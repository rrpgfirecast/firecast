require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_OrdemParanormalS_byHelldemos()
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
    obj:setDataType("OrdemParanormalS_byHelldemos");
    obj:setTitle("Ficha de Ordem Paranormal v0.55");
    obj:setName("OrdemParanormalS_byHelldemos");

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
    obj.label3:setText("     Origem:");
    obj.label3:setName("label3");
    obj.label3:setAlign("left");
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setVertTextAlign("leading");
    obj.label3:setAutoSize(true);
    obj.label3:setTop(30);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setField("identidade.origem");
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
    obj.label4:setText("     Classe:");
    obj.label4:setName("label4");
    obj.label4:setAlign("left");
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setVertTextAlign("leading");
    obj.label4:setAutoSize(true);
    obj.label4:setTop(30);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setField("identidade.classe");
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
    obj.label5:setText("     Elemento:");
    obj.label5:setName("label5");
    obj.label5:setAlign("left");
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setVertTextAlign("leading");
    obj.label5:setAutoSize(true);
    obj.label5:setTop(30);

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setField("identidade.elemento");
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
    obj.label6:setText("     Trilha:");
    obj.label6:setName("label6");
    obj.label6:setAlign("left");
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setVertTextAlign("leading");
    obj.label6:setAutoSize(true);
    obj.label6:setTop(30);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setField("identidade.trilha");
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
    obj.label7:setText("     Patente:");
    obj.label7:setName("label7");
    obj.label7:setAlign("left");
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setVertTextAlign("leading");
    obj.label7:setAutoSize(true);
    obj.label7:setTop(30);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setField("identidade.patente");
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
    obj.label8:setText("     Sexo/Idade:");
    obj.label8:setName("label8");
    obj.label8:setAlign("left");
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setVertTextAlign("leading");
    obj.label8:setAutoSize(true);
    obj.label8:setTop(30);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setField("identidade.sexoidade");
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
    obj.layout12:setWidth(111);
    obj.layout12:setAlign("left");
    obj.layout12:setMargins({left=2, right=2});

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout12);
    obj.image1:setWidth(150);
    obj.image1:setHeight(75);
    obj.image1:setStyle("proportional");
    obj.image1:setSRC("https://media.discordapp.net/attachments/806112336577560576/994292340384596019/unknown.png");
    obj.image1:setName("image1");
    obj.image1:setAlign("top");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setName("layout13");
    obj.layout13:setWidth(74);
    obj.layout13:setAlign("left");
    obj.layout13:setMargins({left=2, right=2});

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout13);
    obj.edit8:setType("number");
    obj.edit8:setField("atributo.forca");
    obj.edit8:setName("edit8");
    obj.edit8:setHeight(30);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(20);
    obj.edit8:setAlign("top");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout13);
    obj.label10:setText("Força");
    obj.label10:setName("label10");
    obj.label10:setAlign("top");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("leading");
    obj.label10:setAutoSize(true);

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setName("layout14");
    obj.layout14:setWidth(74);
    obj.layout14:setAlign("left");
    obj.layout14:setMargins({left=2, right=2});

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout14);
    obj.edit9:setType("number");
    obj.edit9:setField("atributo.agilidade");
    obj.edit9:setName("edit9");
    obj.edit9:setHeight(30);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(20);
    obj.edit9:setAlign("top");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout14);
    obj.label11:setText("Agilidade");
    obj.label11:setName("label11");
    obj.label11:setAlign("top");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setVertTextAlign("leading");
    obj.label11:setAutoSize(true);

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setName("layout15");
    obj.layout15:setWidth(74);
    obj.layout15:setAlign("left");
    obj.layout15:setMargins({left=2, right=2});

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout15);
    obj.edit10:setType("number");
    obj.edit10:setField("atributo.vigor");
    obj.edit10:setName("edit10");
    obj.edit10:setHeight(30);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(20);
    obj.edit10:setAlign("top");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout15);
    obj.label12:setText("Vigor");
    obj.label12:setName("label12");
    obj.label12:setAlign("top");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("leading");
    obj.label12:setAutoSize(true);

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout11);
    obj.layout16:setName("layout16");
    obj.layout16:setWidth(74);
    obj.layout16:setAlign("left");
    obj.layout16:setMargins({left=2, right=2});

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout16);
    obj.edit11:setType("number");
    obj.edit11:setField("atributo.presenca");
    obj.edit11:setName("edit11");
    obj.edit11:setHeight(30);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(20);
    obj.edit11:setAlign("top");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout16);
    obj.label13:setText("Presença");
    obj.label13:setName("label13");
    obj.label13:setAlign("top");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setVertTextAlign("leading");
    obj.label13:setAutoSize(true);

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout11);
    obj.layout17:setName("layout17");
    obj.layout17:setWidth(74);
    obj.layout17:setAlign("left");
    obj.layout17:setMargins({left=2, right=2});

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout17);
    obj.edit12:setType("number");
    obj.edit12:setField("atributo.intelecto");
    obj.edit12:setName("edit12");
    obj.edit12:setHeight(30);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(20);
    obj.edit12:setAlign("top");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout17);
    obj.label14:setText("Intelecto");
    obj.label14:setName("label14");
    obj.label14:setAlign("top");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("leading");
    obj.label14:setAutoSize(true);

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout11);
    obj.layout18:setName("layout18");
    obj.layout18:setWidth(111);
    obj.layout18:setAlign("left");
    obj.layout18:setMargins({left=2, right=2});

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout18);
    obj.image2:setWidth(150);
    obj.image2:setHeight(75);
    obj.image2:setStyle("proportional");
    obj.image2:setSRC("https://media.discordapp.net/attachments/806112336577560576/994292340384596019/unknown.png");
    obj.image2:setName("image2");
    obj.image2:setAlign("top");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19:setAlign("none");
    obj.layout19:setLeft(423);
    obj.layout19:setHeight(130);
    obj.layout19:setWidth(665);
    obj.layout19:setTop(138);
    obj.layout19:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout19:setMargins({left=30, right=10, bottom=10});
    obj.layout19:setName("layout19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setLeft(20);
    obj.layout20:setTop(40);
    obj.layout20:setWidth(700);
    obj.layout20:setHeight(250);
    obj.layout20:setName("layout20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setName("layout21");
    obj.layout21:setWidth(74);
    obj.layout21:setAlign("left");
    obj.layout21:setMargins({left=2, right=2});

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout21);
    obj.edit13:setField("atributo.hp");
    obj.edit13:setName("edit13");
    obj.edit13:setHeight(30);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(20);
    obj.edit13:setAlign("top");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout21);
    obj.label15:setText("Pontos De Vida");
    obj.label15:setName("label15");
    obj.label15:setAlign("top");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setVertTextAlign("leading");
    obj.label15:setAutoSize(true);

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22:setName("layout22");
    obj.layout22:setWidth(74);
    obj.layout22:setAlign("left");
    obj.layout22:setMargins({left=2, right=2});

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout22);
    obj.edit14:setField("atributo.mp");
    obj.edit14:setName("edit14");
    obj.edit14:setHeight(30);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(20);
    obj.edit14:setAlign("top");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout22);
    obj.label16:setText("Pontos de Esforço");
    obj.label16:setName("label16");
    obj.label16:setAlign("top");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setVertTextAlign("leading");
    obj.label16:setAutoSize(true);

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout20);
    obj.layout23:setName("layout23");
    obj.layout23:setWidth(74);
    obj.layout23:setAlign("left");
    obj.layout23:setMargins({left=2, right=2});

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout23);
    obj.edit15:setField("atributo.nex");
    obj.edit15:setName("edit15");
    obj.edit15:setHeight(30);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(20);
    obj.edit15:setAlign("top");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout23);
    obj.label17:setText("NEX%");
    obj.label17:setName("label17");
    obj.label17:setAlign("top");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setVertTextAlign("leading");
    obj.label17:setAutoSize(true);

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout20);
    obj.layout24:setName("layout24");
    obj.layout24:setWidth(74);
    obj.layout24:setAlign("left");
    obj.layout24:setMargins({left=2, right=2});

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout24);
    obj.edit16:setType("number");
    obj.edit16:setField("atributo.deslocamento");
    obj.edit16:setName("edit16");
    obj.edit16:setHeight(30);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(20);
    obj.edit16:setAlign("top");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout24);
    obj.label18:setText("Deslocamento");
    obj.label18:setName("label18");
    obj.label18:setAlign("top");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setVertTextAlign("leading");
    obj.label18:setAutoSize(true);

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout20);
    obj.layout25:setName("layout25");
    obj.layout25:setWidth(74);
    obj.layout25:setAlign("left");
    obj.layout25:setMargins({left=2, right=2});

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout25);
    obj.edit17:setType("number");
    obj.edit17:setField("atributo.xp");
    obj.edit17:setName("edit17");
    obj.edit17:setHeight(30);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(20);
    obj.edit17:setAlign("top");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout25);
    obj.label19:setText("XP");
    obj.label19:setName("label19");
    obj.label19:setAlign("top");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setVertTextAlign("leading");
    obj.label19:setAutoSize(true);

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout20);
    obj.layout26:setName("layout26");
    obj.layout26:setWidth(74);
    obj.layout26:setAlign("left");
    obj.layout26:setMargins({left=2, right=2});

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout26);
    obj.edit18:setType("number");
    obj.edit18:setField("atributo.sanidadeatual");
    obj.edit18:setName("edit18");
    obj.edit18:setHeight(30);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(20);
    obj.edit18:setAlign("top");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout26);
    obj.label20:setText("Sanidade Atual");
    obj.label20:setName("label20");
    obj.label20:setAlign("top");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setVertTextAlign("leading");
    obj.label20:setAutoSize(true);

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout20);
    obj.layout27:setName("layout27");
    obj.layout27:setWidth(74);
    obj.layout27:setAlign("left");
    obj.layout27:setMargins({left=2, right=2});

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout27);
    obj.edit19:setType("number");
    obj.edit19:setField("atributo.sanidademaxima");
    obj.edit19:setName("edit19");
    obj.edit19:setHeight(30);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(20);
    obj.edit19:setAlign("top");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout27);
    obj.label21:setText("Sanidade Maxima");
    obj.label21:setName("label21");
    obj.label21:setAlign("top");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setVertTextAlign("leading");
    obj.label21:setAutoSize(true);

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout20);
    obj.layout28:setName("layout28");
    obj.layout28:setWidth(74);
    obj.layout28:setAlign("left");
    obj.layout28:setMargins({left=2, right=2});

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout28);
    obj.edit20:setType("number");
    obj.edit20:setField("atributo.pm");
    obj.edit20:setName("edit20");
    obj.edit20:setHeight(30);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(20);
    obj.edit20:setAlign("top");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout28);
    obj.label22:setText("PM");
    obj.label22:setName("label22");
    obj.label22:setAlign("top");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setVertTextAlign("leading");
    obj.label22:setAutoSize(true);

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox1);
    obj.layout29:setAlign("none");
    obj.layout29:setLeft(1103);
    obj.layout29:setHeight(255);
    obj.layout29:setWidth(230);
    obj.layout29:setTop(15);
    obj.layout29:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout29:setMargins({left=30, right=10, bottom=10});
    obj.layout29:setName("layout29");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout29);
    obj.label23:setText("Escolha Uma Imagem");
    obj.label23:setLeft(55);
    obj.label23:setTop(19);
    obj.label23:setWidth(200);
    obj.label23:setHeight(215);
    obj.label23:setName("label23");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout29);
    obj.image3:setField("imagemDoPersonagem");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setLeft(15);
    obj.image3:setTop(19);
    obj.image3:setWidth(200);
    obj.image3:setHeight(215);
    obj.image3:setName("image3");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox1);
    obj.layout30:setAlign("none");
    obj.layout30:setLeft(5);
    obj.layout30:setHeight(35);
    obj.layout30:setWidth(1329);
    obj.layout30:setTop(290);
    obj.layout30:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout30:setMargins({left=30, right=10, bottom=10});
    obj.layout30:setName("layout30");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout30);
    obj.label24:setText("Perícias e Proficiências");
    obj.label24:setLeft(625);
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold italic");
    obj.label24:setTop(9);
    obj.label24:setWidth(1343);
    obj.label24:setName("label24");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox1);
    obj.layout31:setAlign("none");
    obj.layout31:setLeft(5);
    obj.layout31:setHeight(604);
    obj.layout31:setWidth(332);
    obj.layout31:setTop(325);
    obj.layout31:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout31:setMargins({left=30, right=10, bottom=10});
    obj.layout31:setName("layout31");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout31);
    obj.label25:setText("Perícias Gerais");
    obj.label25:setLeft(115);
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold italic");
    obj.label25:setTop(9);
    obj.label25:setWidth(1343);
    obj.label25:setName("label25");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setLeft(20);
    obj.layout32:setTop(25);
    obj.layout32:setWidth(270);
    obj.layout32:setHeight(604);
    obj.layout32:setName("layout32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(20);
    obj.layout33:setMargins({bottom=2, top=15});
    obj.layout33:setName("layout33");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout33);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setLeft(5);
    obj.comboBox1:setTop(20);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox1:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox1:setValue("D");
    obj.comboBox1:setField("periciaselect.adestramento");
    obj.comboBox1:setName("comboBox1");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout33);
    obj.label26:setAlign("left");
    obj.label26:setWidth(120);
    obj.label26:setText("Adestrar (Trein.):");
    obj.label26:setHorzTextAlign("trailing");
    obj.label26:setMargins({right=5});
    obj.label26:setName("label26");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout33);
    obj.edit21:setType("number");
    obj.edit21:setAlign("left");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(14);
    obj.edit21:setWidth(30);
    obj.edit21:setField("pericia.adestramento");
    obj.edit21:setName("edit21");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout33);
    obj.label27:setAlign("left");
    obj.label27:setWidth(5);
    obj.label27:setText("");
    obj.label27:setHorzTextAlign("trailing");
    obj.label27:setMargins({right=5});
    obj.label27:setName("label27");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout32);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(20);
    obj.layout34:setMargins({bottom=2, top=15});
    obj.layout34:setName("layout34");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout34);
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setLeft(5);
    obj.comboBox2:setTop(20);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox2:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox2:setValue("D");
    obj.comboBox2:setField("periciaselect.atualidades");
    obj.comboBox2:setName("comboBox2");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout34);
    obj.label28:setAlign("left");
    obj.label28:setWidth(120);
    obj.label28:setText("Atualidades:");
    obj.label28:setHorzTextAlign("trailing");
    obj.label28:setMargins({right=5});
    obj.label28:setName("label28");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout34);
    obj.edit22:setType("number");
    obj.edit22:setAlign("left");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(14);
    obj.edit22:setWidth(30);
    obj.edit22:setField("pericia.atualidades");
    obj.edit22:setName("edit22");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout34);
    obj.label29:setAlign("left");
    obj.label29:setWidth(5);
    obj.label29:setText("");
    obj.label29:setHorzTextAlign("trailing");
    obj.label29:setMargins({right=5});
    obj.label29:setName("label29");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout32);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(20);
    obj.layout35:setMargins({bottom=2, top=15});
    obj.layout35:setName("layout35");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout35);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setLeft(5);
    obj.comboBox3:setTop(20);
    obj.comboBox3:setWidth(100);
    obj.comboBox3:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox3:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox3:setValue("D");
    obj.comboBox3:setField("periciaselect.crime");
    obj.comboBox3:setName("comboBox3");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout35);
    obj.label30:setAlign("left");
    obj.label30:setWidth(120);
    obj.label30:setText("Crime (Trein.):");
    obj.label30:setHorzTextAlign("trailing");
    obj.label30:setMargins({right=5});
    obj.label30:setName("label30");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout35);
    obj.edit23:setType("number");
    obj.edit23:setAlign("left");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(14);
    obj.edit23:setWidth(30);
    obj.edit23:setField("pericia.crime");
    obj.edit23:setName("edit23");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout35);
    obj.label31:setAlign("left");
    obj.label31:setWidth(5);
    obj.label31:setText("");
    obj.label31:setHorzTextAlign("trailing");
    obj.label31:setMargins({right=5});
    obj.label31:setName("label31");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout32);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(20);
    obj.layout36:setMargins({bottom=2, top=15});
    obj.layout36:setName("layout36");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout36);
    obj.comboBox4:setAlign("left");
    obj.comboBox4:setLeft(5);
    obj.comboBox4:setTop(20);
    obj.comboBox4:setWidth(100);
    obj.comboBox4:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox4:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox4:setValue("D");
    obj.comboBox4:setField("periciaselect.iniciativa");
    obj.comboBox4:setName("comboBox4");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout36);
    obj.label32:setAlign("left");
    obj.label32:setWidth(120);
    obj.label32:setText("Iniciativa:");
    obj.label32:setHorzTextAlign("trailing");
    obj.label32:setMargins({right=5});
    obj.label32:setName("label32");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout36);
    obj.edit24:setType("number");
    obj.edit24:setAlign("left");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(14);
    obj.edit24:setWidth(30);
    obj.edit24:setField("pericia.iniciativa");
    obj.edit24:setName("edit24");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout36);
    obj.label33:setAlign("left");
    obj.label33:setWidth(5);
    obj.label33:setText("");
    obj.label33:setHorzTextAlign("trailing");
    obj.label33:setMargins({right=5});
    obj.label33:setName("label33");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout32);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(20);
    obj.layout37:setMargins({bottom=2, top=15});
    obj.layout37:setName("layout37");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout37);
    obj.comboBox5:setAlign("left");
    obj.comboBox5:setLeft(5);
    obj.comboBox5:setTop(20);
    obj.comboBox5:setWidth(100);
    obj.comboBox5:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox5:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox5:setValue("D");
    obj.comboBox5:setField("periciaselect.investigacao");
    obj.comboBox5:setName("comboBox5");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout37);
    obj.label34:setAlign("left");
    obj.label34:setWidth(120);
    obj.label34:setText("Investigação:");
    obj.label34:setHorzTextAlign("trailing");
    obj.label34:setMargins({right=5});
    obj.label34:setName("label34");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout37);
    obj.edit25:setType("number");
    obj.edit25:setAlign("left");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(14);
    obj.edit25:setWidth(30);
    obj.edit25:setField("pericia.investigacao");
    obj.edit25:setName("edit25");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout37);
    obj.label35:setAlign("left");
    obj.label35:setWidth(5);
    obj.label35:setText("");
    obj.label35:setHorzTextAlign("trailing");
    obj.label35:setMargins({right=5});
    obj.label35:setName("label35");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout32);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(20);
    obj.layout38:setMargins({bottom=2, top=15});
    obj.layout38:setName("layout38");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout38);
    obj.comboBox6:setAlign("left");
    obj.comboBox6:setLeft(5);
    obj.comboBox6:setTop(20);
    obj.comboBox6:setWidth(100);
    obj.comboBox6:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox6:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox6:setValue("D");
    obj.comboBox6:setField("periciaselect.ocultismo");
    obj.comboBox6:setName("comboBox6");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout38);
    obj.label36:setAlign("left");
    obj.label36:setWidth(120);
    obj.label36:setText("Ocultismo (Trein.):");
    obj.label36:setHorzTextAlign("trailing");
    obj.label36:setMargins({right=5});
    obj.label36:setName("label36");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout38);
    obj.edit26:setType("number");
    obj.edit26:setAlign("left");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(14);
    obj.edit26:setWidth(30);
    obj.edit26:setField("pericia.ocultismo");
    obj.edit26:setName("edit26");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout38);
    obj.label37:setAlign("left");
    obj.label37:setWidth(5);
    obj.label37:setText("");
    obj.label37:setHorzTextAlign("trailing");
    obj.label37:setMargins({right=5});
    obj.label37:setName("label37");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout32);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(20);
    obj.layout39:setMargins({bottom=2, top=15});
    obj.layout39:setName("layout39");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout39);
    obj.comboBox7:setAlign("left");
    obj.comboBox7:setLeft(5);
    obj.comboBox7:setTop(20);
    obj.comboBox7:setWidth(100);
    obj.comboBox7:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox7:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox7:setValue("D");
    obj.comboBox7:setField("periciaselect.pilotagem");
    obj.comboBox7:setName("comboBox7");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout39);
    obj.label38:setAlign("left");
    obj.label38:setWidth(120);
    obj.label38:setText("Pilotagem (Trein.):");
    obj.label38:setHorzTextAlign("trailing");
    obj.label38:setMargins({right=5});
    obj.label38:setName("label38");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout39);
    obj.edit27:setType("number");
    obj.edit27:setAlign("left");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(14);
    obj.edit27:setWidth(30);
    obj.edit27:setField("pericia.pilotagem");
    obj.edit27:setName("edit27");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout39);
    obj.label39:setAlign("left");
    obj.label39:setWidth(5);
    obj.label39:setText("");
    obj.label39:setHorzTextAlign("trailing");
    obj.label39:setMargins({right=5});
    obj.label39:setName("label39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout32);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(20);
    obj.layout40:setMargins({bottom=2, top=15});
    obj.layout40:setName("layout40");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout40);
    obj.comboBox8:setAlign("left");
    obj.comboBox8:setLeft(5);
    obj.comboBox8:setTop(20);
    obj.comboBox8:setWidth(100);
    obj.comboBox8:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox8:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox8:setValue("D");
    obj.comboBox8:setField("periciaselect.pontaria");
    obj.comboBox8:setName("comboBox8");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout40);
    obj.label40:setAlign("left");
    obj.label40:setWidth(120);
    obj.label40:setText("Pontaria:");
    obj.label40:setHorzTextAlign("trailing");
    obj.label40:setMargins({right=5});
    obj.label40:setName("label40");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout40);
    obj.edit28:setType("number");
    obj.edit28:setAlign("left");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(14);
    obj.edit28:setWidth(30);
    obj.edit28:setField("pericia.pontaria");
    obj.edit28:setName("edit28");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout40);
    obj.label41:setAlign("left");
    obj.label41:setWidth(5);
    obj.label41:setText("");
    obj.label41:setHorzTextAlign("trailing");
    obj.label41:setMargins({right=5});
    obj.label41:setName("label41");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout32);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(20);
    obj.layout41:setMargins({bottom=2, top=15});
    obj.layout41:setName("layout41");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout41);
    obj.comboBox9:setAlign("left");
    obj.comboBox9:setLeft(5);
    obj.comboBox9:setTop(20);
    obj.comboBox9:setWidth(100);
    obj.comboBox9:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox9:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox9:setValue("D");
    obj.comboBox9:setField("periciaselect.sobrevivencia");
    obj.comboBox9:setName("comboBox9");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout41);
    obj.label42:setAlign("left");
    obj.label42:setWidth(120);
    obj.label42:setText("Sobrevivência:");
    obj.label42:setHorzTextAlign("trailing");
    obj.label42:setMargins({right=5});
    obj.label42:setName("label42");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout41);
    obj.edit29:setType("number");
    obj.edit29:setAlign("left");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(14);
    obj.edit29:setWidth(30);
    obj.edit29:setField("pericia.sobrevivencia");
    obj.edit29:setName("edit29");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout41);
    obj.label43:setAlign("left");
    obj.label43:setWidth(5);
    obj.label43:setText("");
    obj.label43:setHorzTextAlign("trailing");
    obj.label43:setMargins({right=5});
    obj.label43:setName("label43");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout32);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(20);
    obj.layout42:setMargins({bottom=2, top=15});
    obj.layout42:setName("layout42");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout42);
    obj.comboBox10:setAlign("left");
    obj.comboBox10:setLeft(5);
    obj.comboBox10:setTop(20);
    obj.comboBox10:setWidth(100);
    obj.comboBox10:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox10:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox10:setValue("D");
    obj.comboBox10:setField("periciaselect.tatica");
    obj.comboBox10:setName("comboBox10");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout42);
    obj.label44:setAlign("left");
    obj.label44:setWidth(120);
    obj.label44:setText("Tática (Trein.):");
    obj.label44:setHorzTextAlign("trailing");
    obj.label44:setMargins({right=5});
    obj.label44:setName("label44");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout42);
    obj.edit30:setType("number");
    obj.edit30:setAlign("left");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(14);
    obj.edit30:setWidth(30);
    obj.edit30:setField("pericia.tatica");
    obj.edit30:setName("edit30");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout42);
    obj.label45:setAlign("left");
    obj.label45:setWidth(5);
    obj.label45:setText("");
    obj.label45:setHorzTextAlign("trailing");
    obj.label45:setMargins({right=5});
    obj.label45:setName("label45");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout32);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(20);
    obj.layout43:setMargins({bottom=2, top=15});
    obj.layout43:setName("layout43");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout43);
    obj.comboBox11:setAlign("left");
    obj.comboBox11:setLeft(5);
    obj.comboBox11:setTop(20);
    obj.comboBox11:setWidth(100);
    obj.comboBox11:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox11:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox11:setValue("D");
    obj.comboBox11:setField("periciaselect.vontade");
    obj.comboBox11:setName("comboBox11");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout43);
    obj.label46:setAlign("left");
    obj.label46:setWidth(120);
    obj.label46:setText("Vontade:");
    obj.label46:setHorzTextAlign("trailing");
    obj.label46:setMargins({right=5});
    obj.label46:setName("label46");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout43);
    obj.edit31:setType("number");
    obj.edit31:setAlign("left");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(14);
    obj.edit31:setWidth(30);
    obj.edit31:setField("pericia.vontade");
    obj.edit31:setName("edit31");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout43);
    obj.label47:setAlign("left");
    obj.label47:setWidth(5);
    obj.label47:setText("");
    obj.label47:setHorzTextAlign("trailing");
    obj.label47:setMargins({right=5});
    obj.label47:setName("label47");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout32);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(20);
    obj.layout44:setMargins({bottom=2, top=15});
    obj.layout44:setName("layout44");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout44);
    obj.label48:setAlign("left");
    obj.label48:setWidth(14);
    obj.label48:setText(" ");
    obj.label48:setHorzTextAlign("trailing");
    obj.label48:setMargins({right=5});
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout44);
    obj.label49:setAlign("left");
    obj.label49:setWidth(120);
    obj.label49:setText("Profissão:");
    obj.label49:setHorzTextAlign("trailing");
    obj.label49:setMargins({right=5});
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout44);
    obj.label50:setAlign("left");
    obj.label50:setWidth(5);
    obj.label50:setText("");
    obj.label50:setHorzTextAlign("trailing");
    obj.label50:setMargins({right=5});
    obj.label50:setName("label50");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout32);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(20);
    obj.layout45:setMargins({bottom=2, top=15});
    obj.layout45:setName("layout45");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout45);
    obj.comboBox12:setAlign("left");
    obj.comboBox12:setLeft(5);
    obj.comboBox12:setTop(20);
    obj.comboBox12:setWidth(100);
    obj.comboBox12:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox12:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox12:setValue("D");
    obj.comboBox12:setField("periciaselect.prof1");
    obj.comboBox12:setName("comboBox12");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout45);
    obj.edit32:setAlign("left");
    obj.edit32:setHorzTextAlign("trailing");
    obj.edit32:setFontSize(14);
    obj.edit32:setWidth(120);
    obj.edit32:setField("pericia.nome.prof1");
    obj.edit32:setMargins({right=5});
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout45);
    obj.edit33:setType("number");
    obj.edit33:setAlign("left");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(14);
    obj.edit33:setWidth(30);
    obj.edit33:setField("pericia.prof1");
    obj.edit33:setName("edit33");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout45);
    obj.label51:setAlign("left");
    obj.label51:setWidth(5);
    obj.label51:setText("");
    obj.label51:setHorzTextAlign("trailing");
    obj.label51:setMargins({right=5});
    obj.label51:setName("label51");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout32);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(20);
    obj.layout46:setMargins({bottom=2, top=15});
    obj.layout46:setName("layout46");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout46);
    obj.comboBox13:setAlign("left");
    obj.comboBox13:setLeft(5);
    obj.comboBox13:setTop(20);
    obj.comboBox13:setWidth(100);
    obj.comboBox13:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox13:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox13:setValue("D");
    obj.comboBox13:setField("periciaselect.prof2");
    obj.comboBox13:setName("comboBox13");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout46);
    obj.edit34:setAlign("left");
    obj.edit34:setHorzTextAlign("trailing");
    obj.edit34:setFontSize(14);
    obj.edit34:setWidth(120);
    obj.edit34:setField("pericia.nome.prof2");
    obj.edit34:setMargins({right=5});
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout46);
    obj.edit35:setType("number");
    obj.edit35:setAlign("left");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontSize(14);
    obj.edit35:setWidth(30);
    obj.edit35:setField("pericia.prof2");
    obj.edit35:setName("edit35");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout46);
    obj.label52:setAlign("left");
    obj.label52:setWidth(5);
    obj.label52:setText("");
    obj.label52:setHorzTextAlign("trailing");
    obj.label52:setMargins({right=5});
    obj.label52:setName("label52");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout32);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(20);
    obj.layout47:setMargins({bottom=2, top=15});
    obj.layout47:setName("layout47");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout47);
    obj.comboBox14:setAlign("left");
    obj.comboBox14:setLeft(5);
    obj.comboBox14:setTop(20);
    obj.comboBox14:setWidth(100);
    obj.comboBox14:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox14:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox14:setValue("D");
    obj.comboBox14:setField("periciaselect.prof3");
    obj.comboBox14:setName("comboBox14");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout47);
    obj.edit36:setAlign("left");
    obj.edit36:setHorzTextAlign("trailing");
    obj.edit36:setFontSize(14);
    obj.edit36:setWidth(120);
    obj.edit36:setField("pericia.nome.prof3");
    obj.edit36:setMargins({right=5});
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout47);
    obj.edit37:setType("number");
    obj.edit37:setAlign("left");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(14);
    obj.edit37:setWidth(30);
    obj.edit37:setField("pericia.prof3");
    obj.edit37:setName("edit37");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout47);
    obj.label53:setAlign("left");
    obj.label53:setWidth(5);
    obj.label53:setText("");
    obj.label53:setHorzTextAlign("trailing");
    obj.label53:setMargins({right=5});
    obj.label53:setName("label53");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox1);
    obj.layout48:setAlign("none");
    obj.layout48:setLeft(337);
    obj.layout48:setHeight(604);
    obj.layout48:setWidth(332);
    obj.layout48:setTop(325);
    obj.layout48:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout48:setMargins({left=30, right=10, bottom=10});
    obj.layout48:setName("layout48");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout48);
    obj.label54:setText("Habilidades Acadêmicas");
    obj.label54:setLeft(90);
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold italic");
    obj.label54:setTop(9);
    obj.label54:setWidth(1343);
    obj.label54:setName("label54");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout48);
    obj.layout49:setLeft(20);
    obj.layout49:setTop(25);
    obj.layout49:setWidth(270);
    obj.layout49:setHeight(604);
    obj.layout49:setName("layout49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(20);
    obj.layout50:setMargins({bottom=2, top=15});
    obj.layout50:setName("layout50");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout50);
    obj.comboBox15:setAlign("left");
    obj.comboBox15:setLeft(5);
    obj.comboBox15:setTop(20);
    obj.comboBox15:setWidth(100);
    obj.comboBox15:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox15:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox15:setValue("D");
    obj.comboBox15:setField("periciaselect.artes");
    obj.comboBox15:setName("comboBox15");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout50);
    obj.label55:setAlign("left");
    obj.label55:setWidth(120);
    obj.label55:setText("Artes (Trein.):");
    obj.label55:setHorzTextAlign("trailing");
    obj.label55:setMargins({right=5});
    obj.label55:setName("label55");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout50);
    obj.edit38:setType("number");
    obj.edit38:setAlign("left");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontSize(14);
    obj.edit38:setWidth(30);
    obj.edit38:setField("pericia.artes");
    obj.edit38:setName("edit38");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout50);
    obj.label56:setAlign("left");
    obj.label56:setWidth(5);
    obj.label56:setText("");
    obj.label56:setHorzTextAlign("trailing");
    obj.label56:setMargins({right=5});
    obj.label56:setName("label56");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout49);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(20);
    obj.layout51:setMargins({bottom=2, top=15});
    obj.layout51:setName("layout51");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout51);
    obj.comboBox16:setAlign("left");
    obj.comboBox16:setLeft(5);
    obj.comboBox16:setTop(20);
    obj.comboBox16:setWidth(100);
    obj.comboBox16:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox16:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox16:setValue("D");
    obj.comboBox16:setField("periciaselect.ciencia");
    obj.comboBox16:setName("comboBox16");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout51);
    obj.label57:setAlign("left");
    obj.label57:setWidth(120);
    obj.label57:setText("Ciências (Trein.):");
    obj.label57:setHorzTextAlign("trailing");
    obj.label57:setMargins({right=5});
    obj.label57:setName("label57");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout51);
    obj.edit39:setType("number");
    obj.edit39:setAlign("left");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontSize(14);
    obj.edit39:setWidth(30);
    obj.edit39:setField("pericia.ciencia");
    obj.edit39:setName("edit39");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout51);
    obj.label58:setAlign("left");
    obj.label58:setWidth(5);
    obj.label58:setText("");
    obj.label58:setHorzTextAlign("trailing");
    obj.label58:setMargins({right=5});
    obj.label58:setName("label58");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout49);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(20);
    obj.layout52:setMargins({bottom=2, top=15});
    obj.layout52:setName("layout52");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout52);
    obj.comboBox17:setAlign("left");
    obj.comboBox17:setLeft(5);
    obj.comboBox17:setTop(20);
    obj.comboBox17:setWidth(100);
    obj.comboBox17:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox17:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox17:setValue("D");
    obj.comboBox17:setField("periciaselect.medicina");
    obj.comboBox17:setName("comboBox17");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout52);
    obj.label59:setAlign("left");
    obj.label59:setWidth(120);
    obj.label59:setText("Medicina (Trein.):");
    obj.label59:setHorzTextAlign("trailing");
    obj.label59:setMargins({right=5});
    obj.label59:setName("label59");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout52);
    obj.edit40:setType("number");
    obj.edit40:setAlign("left");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontSize(14);
    obj.edit40:setWidth(30);
    obj.edit40:setField("pericia.medicina");
    obj.edit40:setName("edit40");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout52);
    obj.label60:setAlign("left");
    obj.label60:setWidth(5);
    obj.label60:setText("");
    obj.label60:setHorzTextAlign("trailing");
    obj.label60:setMargins({right=5});
    obj.label60:setName("label60");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout49);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(20);
    obj.layout53:setMargins({bottom=2, top=15});
    obj.layout53:setName("layout53");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout53);
    obj.comboBox18:setAlign("left");
    obj.comboBox18:setLeft(5);
    obj.comboBox18:setTop(20);
    obj.comboBox18:setWidth(100);
    obj.comboBox18:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox18:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox18:setValue("D");
    obj.comboBox18:setField("periciaselect.religiao");
    obj.comboBox18:setName("comboBox18");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout53);
    obj.label61:setAlign("left");
    obj.label61:setWidth(120);
    obj.label61:setText("Religião (Trein.):");
    obj.label61:setHorzTextAlign("trailing");
    obj.label61:setMargins({right=5});
    obj.label61:setName("label61");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout53);
    obj.edit41:setType("number");
    obj.edit41:setAlign("left");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(14);
    obj.edit41:setWidth(30);
    obj.edit41:setField("pericia.religiao");
    obj.edit41:setName("edit41");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout53);
    obj.label62:setAlign("left");
    obj.label62:setWidth(5);
    obj.label62:setText("");
    obj.label62:setHorzTextAlign("trailing");
    obj.label62:setMargins({right=5});
    obj.label62:setName("label62");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout49);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(20);
    obj.layout54:setMargins({bottom=2, top=15});
    obj.layout54:setName("layout54");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout54);
    obj.comboBox19:setAlign("left");
    obj.comboBox19:setLeft(5);
    obj.comboBox19:setTop(20);
    obj.comboBox19:setWidth(100);
    obj.comboBox19:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox19:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox19:setValue("D");
    obj.comboBox19:setField("periciaselect.tecnologia");
    obj.comboBox19:setName("comboBox19");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout54);
    obj.label63:setAlign("left");
    obj.label63:setWidth(120);
    obj.label63:setText("Tecnologia (Trein.):");
    obj.label63:setHorzTextAlign("trailing");
    obj.label63:setMargins({right=5});
    obj.label63:setName("label63");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout54);
    obj.edit42:setType("number");
    obj.edit42:setAlign("left");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontSize(14);
    obj.edit42:setWidth(30);
    obj.edit42:setField("pericia.tecnologia");
    obj.edit42:setName("edit42");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout54);
    obj.label64:setAlign("left");
    obj.label64:setWidth(5);
    obj.label64:setText("");
    obj.label64:setHorzTextAlign("trailing");
    obj.label64:setMargins({right=5});
    obj.label64:setName("label64");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout49);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(20);
    obj.layout55:setMargins({bottom=2, top=15});
    obj.layout55:setName("layout55");

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout55);
    obj.comboBox20:setAlign("left");
    obj.comboBox20:setLeft(5);
    obj.comboBox20:setTop(20);
    obj.comboBox20:setWidth(100);
    obj.comboBox20:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox20:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox20:setValue("D");
    obj.comboBox20:setField("periciaselect.gen1");
    obj.comboBox20:setName("comboBox20");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout55);
    obj.edit43:setAlign("left");
    obj.edit43:setHorzTextAlign("trailing");
    obj.edit43:setFontSize(14);
    obj.edit43:setWidth(120);
    obj.edit43:setField("pericia.nome.gen1");
    obj.edit43:setMargins({right=5});
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout55);
    obj.edit44:setType("number");
    obj.edit44:setAlign("left");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(14);
    obj.edit44:setWidth(30);
    obj.edit44:setField("pericia.gen1");
    obj.edit44:setName("edit44");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout55);
    obj.label65:setAlign("left");
    obj.label65:setWidth(5);
    obj.label65:setText("");
    obj.label65:setHorzTextAlign("trailing");
    obj.label65:setMargins({right=5});
    obj.label65:setName("label65");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout49);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(20);
    obj.layout56:setMargins({bottom=2, top=15});
    obj.layout56:setName("layout56");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout56);
    obj.comboBox21:setAlign("left");
    obj.comboBox21:setLeft(5);
    obj.comboBox21:setTop(20);
    obj.comboBox21:setWidth(100);
    obj.comboBox21:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox21:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox21:setValue("D");
    obj.comboBox21:setField("periciaselect.gen2");
    obj.comboBox21:setName("comboBox21");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout56);
    obj.edit45:setAlign("left");
    obj.edit45:setHorzTextAlign("trailing");
    obj.edit45:setFontSize(14);
    obj.edit45:setWidth(120);
    obj.edit45:setField("pericia.nome.gen2");
    obj.edit45:setMargins({right=5});
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout56);
    obj.edit46:setType("number");
    obj.edit46:setAlign("left");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(14);
    obj.edit46:setWidth(30);
    obj.edit46:setField("pericia.gen2");
    obj.edit46:setName("edit46");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout56);
    obj.label66:setAlign("left");
    obj.label66:setWidth(5);
    obj.label66:setText("");
    obj.label66:setHorzTextAlign("trailing");
    obj.label66:setMargins({right=5});
    obj.label66:setName("label66");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout49);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(20);
    obj.layout57:setMargins({bottom=2, top=15});
    obj.layout57:setName("layout57");

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout57);
    obj.comboBox22:setAlign("left");
    obj.comboBox22:setLeft(5);
    obj.comboBox22:setTop(20);
    obj.comboBox22:setWidth(100);
    obj.comboBox22:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox22:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox22:setValue("D");
    obj.comboBox22:setField("periciaselect.gen3");
    obj.comboBox22:setName("comboBox22");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout57);
    obj.edit47:setAlign("left");
    obj.edit47:setHorzTextAlign("trailing");
    obj.edit47:setFontSize(14);
    obj.edit47:setWidth(120);
    obj.edit47:setField("pericia.nome.gen3");
    obj.edit47:setMargins({right=5});
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout57);
    obj.edit48:setType("number");
    obj.edit48:setAlign("left");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontSize(14);
    obj.edit48:setWidth(30);
    obj.edit48:setField("pericia.gen3");
    obj.edit48:setName("edit48");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout57);
    obj.label67:setAlign("left");
    obj.label67:setWidth(5);
    obj.label67:setText("");
    obj.label67:setHorzTextAlign("trailing");
    obj.label67:setMargins({right=5});
    obj.label67:setName("label67");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout49);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(20);
    obj.layout58:setMargins({bottom=2, top=15});
    obj.layout58:setName("layout58");

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout58);
    obj.comboBox23:setAlign("left");
    obj.comboBox23:setLeft(5);
    obj.comboBox23:setTop(20);
    obj.comboBox23:setWidth(100);
    obj.comboBox23:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox23:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox23:setValue("D");
    obj.comboBox23:setField("periciaselect.gen4");
    obj.comboBox23:setName("comboBox23");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout58);
    obj.edit49:setAlign("left");
    obj.edit49:setHorzTextAlign("trailing");
    obj.edit49:setFontSize(14);
    obj.edit49:setWidth(120);
    obj.edit49:setField("pericia.nome.gen4");
    obj.edit49:setMargins({right=5});
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout58);
    obj.edit50:setType("number");
    obj.edit50:setAlign("left");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontSize(14);
    obj.edit50:setWidth(30);
    obj.edit50:setField("pericia.gen4");
    obj.edit50:setName("edit50");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout58);
    obj.label68:setAlign("left");
    obj.label68:setWidth(5);
    obj.label68:setText("");
    obj.label68:setHorzTextAlign("trailing");
    obj.label68:setMargins({right=5});
    obj.label68:setName("label68");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout49);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(20);
    obj.layout59:setMargins({bottom=2, top=15});
    obj.layout59:setName("layout59");

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout59);
    obj.comboBox24:setAlign("left");
    obj.comboBox24:setLeft(5);
    obj.comboBox24:setTop(20);
    obj.comboBox24:setWidth(100);
    obj.comboBox24:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox24:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox24:setValue("D");
    obj.comboBox24:setField("periciaselect.gen5");
    obj.comboBox24:setName("comboBox24");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout59);
    obj.edit51:setAlign("left");
    obj.edit51:setHorzTextAlign("trailing");
    obj.edit51:setFontSize(14);
    obj.edit51:setWidth(120);
    obj.edit51:setField("pericia.nome.gen5");
    obj.edit51:setMargins({right=5});
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout59);
    obj.edit52:setType("number");
    obj.edit52:setAlign("left");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontSize(14);
    obj.edit52:setWidth(30);
    obj.edit52:setField("pericia.gen5");
    obj.edit52:setName("edit52");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout59);
    obj.label69:setAlign("left");
    obj.label69:setWidth(5);
    obj.label69:setText("");
    obj.label69:setHorzTextAlign("trailing");
    obj.label69:setMargins({right=5});
    obj.label69:setName("label69");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout49);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(20);
    obj.layout60:setMargins({bottom=2, top=15});
    obj.layout60:setName("layout60");

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout60);
    obj.comboBox25:setAlign("left");
    obj.comboBox25:setLeft(5);
    obj.comboBox25:setTop(20);
    obj.comboBox25:setWidth(100);
    obj.comboBox25:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox25:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox25:setValue("D");
    obj.comboBox25:setField("periciaselect.gen6");
    obj.comboBox25:setName("comboBox25");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout60);
    obj.edit53:setAlign("left");
    obj.edit53:setHorzTextAlign("trailing");
    obj.edit53:setFontSize(14);
    obj.edit53:setWidth(120);
    obj.edit53:setField("pericia.nome.gen6");
    obj.edit53:setMargins({right=5});
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout60);
    obj.edit54:setType("number");
    obj.edit54:setAlign("left");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontSize(14);
    obj.edit54:setWidth(30);
    obj.edit54:setField("pericia.gen6");
    obj.edit54:setName("edit54");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout60);
    obj.label70:setAlign("left");
    obj.label70:setWidth(5);
    obj.label70:setText("");
    obj.label70:setHorzTextAlign("trailing");
    obj.label70:setMargins({right=5});
    obj.label70:setName("label70");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout49);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(20);
    obj.layout61:setMargins({bottom=2, top=15});
    obj.layout61:setName("layout61");

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout61);
    obj.comboBox26:setAlign("left");
    obj.comboBox26:setLeft(5);
    obj.comboBox26:setTop(20);
    obj.comboBox26:setWidth(100);
    obj.comboBox26:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox26:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox26:setValue("D");
    obj.comboBox26:setField("periciaselect.gen7");
    obj.comboBox26:setName("comboBox26");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout61);
    obj.edit55:setAlign("left");
    obj.edit55:setHorzTextAlign("trailing");
    obj.edit55:setFontSize(14);
    obj.edit55:setWidth(120);
    obj.edit55:setField("pericia.nome.gen7");
    obj.edit55:setMargins({right=5});
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout61);
    obj.edit56:setType("number");
    obj.edit56:setAlign("left");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontSize(14);
    obj.edit56:setWidth(30);
    obj.edit56:setField("pericia.gen7");
    obj.edit56:setName("edit56");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout61);
    obj.label71:setAlign("left");
    obj.label71:setWidth(5);
    obj.label71:setText("");
    obj.label71:setHorzTextAlign("trailing");
    obj.label71:setMargins({right=5});
    obj.label71:setName("label71");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout49);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(20);
    obj.layout62:setMargins({bottom=2, top=15});
    obj.layout62:setName("layout62");

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout62);
    obj.comboBox27:setAlign("left");
    obj.comboBox27:setLeft(5);
    obj.comboBox27:setTop(20);
    obj.comboBox27:setWidth(100);
    obj.comboBox27:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox27:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox27:setValue("D");
    obj.comboBox27:setField("periciaselect.gen8");
    obj.comboBox27:setName("comboBox27");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout62);
    obj.edit57:setAlign("left");
    obj.edit57:setHorzTextAlign("trailing");
    obj.edit57:setFontSize(14);
    obj.edit57:setWidth(120);
    obj.edit57:setField("pericia.nome.gen8");
    obj.edit57:setMargins({right=5});
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout62);
    obj.edit58:setType("number");
    obj.edit58:setAlign("left");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(14);
    obj.edit58:setWidth(30);
    obj.edit58:setField("pericia.gen8");
    obj.edit58:setName("edit58");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout62);
    obj.label72:setAlign("left");
    obj.label72:setWidth(5);
    obj.label72:setText("");
    obj.label72:setHorzTextAlign("trailing");
    obj.label72:setMargins({right=5});
    obj.label72:setName("label72");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout49);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(20);
    obj.layout63:setMargins({bottom=2, top=15});
    obj.layout63:setName("layout63");

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout63);
    obj.comboBox28:setAlign("left");
    obj.comboBox28:setLeft(5);
    obj.comboBox28:setTop(20);
    obj.comboBox28:setWidth(100);
    obj.comboBox28:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox28:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox28:setValue("D");
    obj.comboBox28:setField("periciaselect.gen9");
    obj.comboBox28:setName("comboBox28");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout63);
    obj.edit59:setAlign("left");
    obj.edit59:setHorzTextAlign("trailing");
    obj.edit59:setFontSize(14);
    obj.edit59:setWidth(120);
    obj.edit59:setField("pericia.nome.gen9");
    obj.edit59:setMargins({right=5});
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout63);
    obj.edit60:setType("number");
    obj.edit60:setAlign("left");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(14);
    obj.edit60:setWidth(30);
    obj.edit60:setField("pericia.gen9");
    obj.edit60:setName("edit60");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout63);
    obj.label73:setAlign("left");
    obj.label73:setWidth(5);
    obj.label73:setText("");
    obj.label73:setHorzTextAlign("trailing");
    obj.label73:setMargins({right=5});
    obj.label73:setName("label73");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout49);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(20);
    obj.layout64:setMargins({bottom=2, top=15});
    obj.layout64:setName("layout64");

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout64);
    obj.comboBox29:setAlign("left");
    obj.comboBox29:setLeft(5);
    obj.comboBox29:setTop(20);
    obj.comboBox29:setWidth(100);
    obj.comboBox29:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox29:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox29:setValue("D");
    obj.comboBox29:setField("periciaselect.gen10");
    obj.comboBox29:setName("comboBox29");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout64);
    obj.edit61:setAlign("left");
    obj.edit61:setHorzTextAlign("trailing");
    obj.edit61:setFontSize(14);
    obj.edit61:setWidth(120);
    obj.edit61:setField("pericia.nome.gen10");
    obj.edit61:setMargins({right=5});
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout64);
    obj.edit62:setType("number");
    obj.edit62:setAlign("left");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontSize(14);
    obj.edit62:setWidth(30);
    obj.edit62:setField("pericia.gen10");
    obj.edit62:setName("edit62");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout64);
    obj.label74:setAlign("left");
    obj.label74:setWidth(5);
    obj.label74:setText("");
    obj.label74:setHorzTextAlign("trailing");
    obj.label74:setMargins({right=5});
    obj.label74:setName("label74");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.scrollBox1);
    obj.layout65:setAlign("none");
    obj.layout65:setLeft(670);
    obj.layout65:setHeight(604);
    obj.layout65:setWidth(332);
    obj.layout65:setTop(325);
    obj.layout65:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout65:setMargins({left=30, right=10, bottom=10});
    obj.layout65:setName("layout65");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout65);
    obj.label75:setText("Percepção/Habilidades Sociais e Fisicas");
    obj.label75:setLeft(40);
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold italic");
    obj.label75:setTop(9);
    obj.label75:setWidth(1343);
    obj.label75:setName("label75");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout65);
    obj.layout66:setLeft(20);
    obj.layout66:setTop(25);
    obj.layout66:setWidth(270);
    obj.layout66:setHeight(604);
    obj.layout66:setName("layout66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout66);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(20);
    obj.layout67:setMargins({bottom=2, top=15});
    obj.layout67:setName("layout67");

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout67);
    obj.comboBox30:setAlign("left");
    obj.comboBox30:setLeft(5);
    obj.comboBox30:setTop(20);
    obj.comboBox30:setWidth(100);
    obj.comboBox30:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox30:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox30:setValue("D");
    obj.comboBox30:setField("periciaselect.acrobacia");
    obj.comboBox30:setName("comboBox30");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout67);
    obj.label76:setAlign("left");
    obj.label76:setWidth(120);
    obj.label76:setText("Acrobacia:");
    obj.label76:setHorzTextAlign("trailing");
    obj.label76:setMargins({right=5});
    obj.label76:setName("label76");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout67);
    obj.edit63:setType("number");
    obj.edit63:setAlign("left");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontSize(14);
    obj.edit63:setWidth(30);
    obj.edit63:setField("pericia.acrobacia");
    obj.edit63:setName("edit63");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout67);
    obj.label77:setAlign("left");
    obj.label77:setWidth(5);
    obj.label77:setText("");
    obj.label77:setHorzTextAlign("trailing");
    obj.label77:setMargins({right=5});
    obj.label77:setName("label77");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout66);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(20);
    obj.layout68:setMargins({bottom=2, top=15});
    obj.layout68:setName("layout68");

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout68);
    obj.comboBox31:setAlign("left");
    obj.comboBox31:setLeft(5);
    obj.comboBox31:setTop(20);
    obj.comboBox31:setWidth(100);
    obj.comboBox31:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox31:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox31:setValue("D");
    obj.comboBox31:setField("periciaselect.atletismo");
    obj.comboBox31:setName("comboBox31");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout68);
    obj.label78:setAlign("left");
    obj.label78:setWidth(120);
    obj.label78:setText("Atletismo:");
    obj.label78:setHorzTextAlign("trailing");
    obj.label78:setMargins({right=5});
    obj.label78:setName("label78");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout68);
    obj.edit64:setType("number");
    obj.edit64:setAlign("left");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontSize(14);
    obj.edit64:setWidth(30);
    obj.edit64:setField("pericia.atletismo");
    obj.edit64:setName("edit64");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout68);
    obj.label79:setAlign("left");
    obj.label79:setWidth(5);
    obj.label79:setText("");
    obj.label79:setHorzTextAlign("trailing");
    obj.label79:setMargins({right=5});
    obj.label79:setName("label79");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout66);
    obj.layout69:setAlign("top");
    obj.layout69:setHeight(20);
    obj.layout69:setMargins({bottom=2, top=15});
    obj.layout69:setName("layout69");

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout69);
    obj.comboBox32:setAlign("left");
    obj.comboBox32:setLeft(5);
    obj.comboBox32:setTop(20);
    obj.comboBox32:setWidth(100);
    obj.comboBox32:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox32:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox32:setValue("D");
    obj.comboBox32:setField("periciaselect.diplomacia");
    obj.comboBox32:setName("comboBox32");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout69);
    obj.label80:setAlign("left");
    obj.label80:setWidth(120);
    obj.label80:setText("Diplomacia:");
    obj.label80:setHorzTextAlign("trailing");
    obj.label80:setMargins({right=5});
    obj.label80:setName("label80");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout69);
    obj.edit65:setType("number");
    obj.edit65:setAlign("left");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontSize(14);
    obj.edit65:setWidth(30);
    obj.edit65:setField("pericia.diplomacia");
    obj.edit65:setName("edit65");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout69);
    obj.label81:setAlign("left");
    obj.label81:setWidth(5);
    obj.label81:setText("");
    obj.label81:setHorzTextAlign("trailing");
    obj.label81:setMargins({right=5});
    obj.label81:setName("label81");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout66);
    obj.layout70:setAlign("top");
    obj.layout70:setHeight(20);
    obj.layout70:setMargins({bottom=2, top=15});
    obj.layout70:setName("layout70");

    obj.comboBox33 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.layout70);
    obj.comboBox33:setAlign("left");
    obj.comboBox33:setLeft(5);
    obj.comboBox33:setTop(20);
    obj.comboBox33:setWidth(100);
    obj.comboBox33:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox33:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox33:setValue("D");
    obj.comboBox33:setField("periciaselect.enganacao");
    obj.comboBox33:setName("comboBox33");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout70);
    obj.label82:setAlign("left");
    obj.label82:setWidth(120);
    obj.label82:setText("Enganação:");
    obj.label82:setHorzTextAlign("trailing");
    obj.label82:setMargins({right=5});
    obj.label82:setName("label82");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout70);
    obj.edit66:setType("number");
    obj.edit66:setAlign("left");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontSize(14);
    obj.edit66:setWidth(30);
    obj.edit66:setField("pericia.enganacao");
    obj.edit66:setName("edit66");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout70);
    obj.label83:setAlign("left");
    obj.label83:setWidth(5);
    obj.label83:setText("");
    obj.label83:setHorzTextAlign("trailing");
    obj.label83:setMargins({right=5});
    obj.label83:setName("label83");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout66);
    obj.layout71:setAlign("top");
    obj.layout71:setHeight(20);
    obj.layout71:setMargins({bottom=2, top=15});
    obj.layout71:setName("layout71");

    obj.comboBox34 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox34:setParent(obj.layout71);
    obj.comboBox34:setAlign("left");
    obj.comboBox34:setLeft(5);
    obj.comboBox34:setTop(20);
    obj.comboBox34:setWidth(100);
    obj.comboBox34:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox34:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox34:setValue("D");
    obj.comboBox34:setField("periciaselect.fortitude");
    obj.comboBox34:setName("comboBox34");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout71);
    obj.label84:setAlign("left");
    obj.label84:setWidth(120);
    obj.label84:setText("Fortitude:");
    obj.label84:setHorzTextAlign("trailing");
    obj.label84:setMargins({right=5});
    obj.label84:setName("label84");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout71);
    obj.edit67:setType("number");
    obj.edit67:setAlign("left");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontSize(14);
    obj.edit67:setWidth(30);
    obj.edit67:setField("pericia.fortitude");
    obj.edit67:setName("edit67");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout71);
    obj.label85:setAlign("left");
    obj.label85:setWidth(5);
    obj.label85:setText("");
    obj.label85:setHorzTextAlign("trailing");
    obj.label85:setMargins({right=5});
    obj.label85:setName("label85");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout66);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(20);
    obj.layout72:setMargins({bottom=2, top=15});
    obj.layout72:setName("layout72");

    obj.comboBox35 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox35:setParent(obj.layout72);
    obj.comboBox35:setAlign("left");
    obj.comboBox35:setLeft(5);
    obj.comboBox35:setTop(20);
    obj.comboBox35:setWidth(100);
    obj.comboBox35:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox35:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox35:setValue("D");
    obj.comboBox35:setField("periciaselect.intimidacao");
    obj.comboBox35:setName("comboBox35");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout72);
    obj.label86:setAlign("left");
    obj.label86:setWidth(120);
    obj.label86:setText("Intimidação:");
    obj.label86:setHorzTextAlign("trailing");
    obj.label86:setMargins({right=5});
    obj.label86:setName("label86");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout72);
    obj.edit68:setType("number");
    obj.edit68:setAlign("left");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontSize(14);
    obj.edit68:setWidth(30);
    obj.edit68:setField("pericia.intimidacao");
    obj.edit68:setName("edit68");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout72);
    obj.label87:setAlign("left");
    obj.label87:setWidth(5);
    obj.label87:setText("");
    obj.label87:setHorzTextAlign("trailing");
    obj.label87:setMargins({right=5});
    obj.label87:setName("label87");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout66);
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(20);
    obj.layout73:setMargins({bottom=2, top=15});
    obj.layout73:setName("layout73");

    obj.comboBox36 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox36:setParent(obj.layout73);
    obj.comboBox36:setAlign("left");
    obj.comboBox36:setLeft(5);
    obj.comboBox36:setTop(20);
    obj.comboBox36:setWidth(100);
    obj.comboBox36:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox36:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox36:setValue("D");
    obj.comboBox36:setField("periciaselect.intuicao");
    obj.comboBox36:setName("comboBox36");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout73);
    obj.label88:setAlign("left");
    obj.label88:setWidth(120);
    obj.label88:setText("Intuição:");
    obj.label88:setHorzTextAlign("trailing");
    obj.label88:setMargins({right=5});
    obj.label88:setName("label88");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout73);
    obj.edit69:setType("number");
    obj.edit69:setAlign("left");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontSize(14);
    obj.edit69:setWidth(30);
    obj.edit69:setField("pericia.intuicao");
    obj.edit69:setName("edit69");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout73);
    obj.label89:setAlign("left");
    obj.label89:setWidth(5);
    obj.label89:setText("");
    obj.label89:setHorzTextAlign("trailing");
    obj.label89:setMargins({right=5});
    obj.label89:setName("label89");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout66);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(20);
    obj.layout74:setMargins({bottom=2, top=15});
    obj.layout74:setName("layout74");

    obj.comboBox37 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox37:setParent(obj.layout74);
    obj.comboBox37:setAlign("left");
    obj.comboBox37:setLeft(5);
    obj.comboBox37:setTop(20);
    obj.comboBox37:setWidth(100);
    obj.comboBox37:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox37:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox37:setValue("D");
    obj.comboBox37:setField("periciaselect.luta");
    obj.comboBox37:setName("comboBox37");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout74);
    obj.label90:setAlign("left");
    obj.label90:setWidth(120);
    obj.label90:setText("Luta:");
    obj.label90:setHorzTextAlign("trailing");
    obj.label90:setMargins({right=5});
    obj.label90:setName("label90");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout74);
    obj.edit70:setType("number");
    obj.edit70:setAlign("left");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontSize(14);
    obj.edit70:setWidth(30);
    obj.edit70:setField("pericia.luta");
    obj.edit70:setName("edit70");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout74);
    obj.label91:setAlign("left");
    obj.label91:setWidth(5);
    obj.label91:setText("");
    obj.label91:setHorzTextAlign("trailing");
    obj.label91:setMargins({right=5});
    obj.label91:setName("label91");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout66);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(20);
    obj.layout75:setMargins({bottom=2, top=15});
    obj.layout75:setName("layout75");

    obj.comboBox38 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox38:setParent(obj.layout75);
    obj.comboBox38:setAlign("left");
    obj.comboBox38:setLeft(5);
    obj.comboBox38:setTop(20);
    obj.comboBox38:setWidth(100);
    obj.comboBox38:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox38:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox38:setValue("D");
    obj.comboBox38:setField("periciaselect.percepcao");
    obj.comboBox38:setName("comboBox38");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout75);
    obj.label92:setAlign("left");
    obj.label92:setWidth(120);
    obj.label92:setText("Percepção:");
    obj.label92:setHorzTextAlign("trailing");
    obj.label92:setMargins({right=5});
    obj.label92:setName("label92");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout75);
    obj.edit71:setType("number");
    obj.edit71:setAlign("left");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontSize(14);
    obj.edit71:setWidth(30);
    obj.edit71:setField("pericia.percepcao");
    obj.edit71:setName("edit71");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout75);
    obj.label93:setAlign("left");
    obj.label93:setWidth(5);
    obj.label93:setText("");
    obj.label93:setHorzTextAlign("trailing");
    obj.label93:setMargins({right=5});
    obj.label93:setName("label93");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout66);
    obj.layout76:setAlign("top");
    obj.layout76:setHeight(20);
    obj.layout76:setMargins({bottom=2, top=15});
    obj.layout76:setName("layout76");

    obj.comboBox39 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox39:setParent(obj.layout76);
    obj.comboBox39:setAlign("left");
    obj.comboBox39:setLeft(5);
    obj.comboBox39:setTop(20);
    obj.comboBox39:setWidth(100);
    obj.comboBox39:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox39:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox39:setValue("D");
    obj.comboBox39:setField("periciaselect.reflexos");
    obj.comboBox39:setName("comboBox39");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout76);
    obj.label94:setAlign("left");
    obj.label94:setWidth(120);
    obj.label94:setText("Reflexos:");
    obj.label94:setHorzTextAlign("trailing");
    obj.label94:setMargins({right=5});
    obj.label94:setName("label94");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout76);
    obj.edit72:setType("number");
    obj.edit72:setAlign("left");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontSize(14);
    obj.edit72:setWidth(30);
    obj.edit72:setField("pericia.reflexos");
    obj.edit72:setName("edit72");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout76);
    obj.label95:setAlign("left");
    obj.label95:setWidth(5);
    obj.label95:setText("");
    obj.label95:setHorzTextAlign("trailing");
    obj.label95:setMargins({right=5});
    obj.label95:setName("label95");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout66);
    obj.layout77:setAlign("top");
    obj.layout77:setHeight(20);
    obj.layout77:setMargins({bottom=2, top=15});
    obj.layout77:setName("layout77");

    obj.comboBox40 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox40:setParent(obj.layout77);
    obj.comboBox40:setAlign("left");
    obj.comboBox40:setLeft(5);
    obj.comboBox40:setTop(20);
    obj.comboBox40:setWidth(100);
    obj.comboBox40:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox40:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox40:setValue("D");
    obj.comboBox40:setField("periciaselect.furtividade");
    obj.comboBox40:setName("comboBox40");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout77);
    obj.label96:setAlign("left");
    obj.label96:setWidth(120);
    obj.label96:setText("Furtividade:");
    obj.label96:setHorzTextAlign("trailing");
    obj.label96:setMargins({right=5});
    obj.label96:setName("label96");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout77);
    obj.edit73:setType("number");
    obj.edit73:setAlign("left");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontSize(14);
    obj.edit73:setWidth(30);
    obj.edit73:setField("pericia.furtividade");
    obj.edit73:setName("edit73");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout77);
    obj.label97:setAlign("left");
    obj.label97:setWidth(5);
    obj.label97:setText("");
    obj.label97:setHorzTextAlign("trailing");
    obj.label97:setMargins({right=5});
    obj.label97:setName("label97");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout66);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(20);
    obj.layout78:setMargins({bottom=2, top=15});
    obj.layout78:setName("layout78");

    obj.comboBox41 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox41:setParent(obj.layout78);
    obj.comboBox41:setAlign("left");
    obj.comboBox41:setLeft(5);
    obj.comboBox41:setTop(20);
    obj.comboBox41:setWidth(100);
    obj.comboBox41:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox41:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox41:setValue("D");
    obj.comboBox41:setField("periciaselect.gen12");
    obj.comboBox41:setName("comboBox41");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout78);
    obj.edit74:setAlign("left");
    obj.edit74:setHorzTextAlign("trailing");
    obj.edit74:setFontSize(14);
    obj.edit74:setWidth(120);
    obj.edit74:setField("pericia.nome.gen12");
    obj.edit74:setMargins({right=5});
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout78);
    obj.edit75:setType("number");
    obj.edit75:setAlign("left");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setFontSize(14);
    obj.edit75:setWidth(30);
    obj.edit75:setField("pericia.gen12");
    obj.edit75:setName("edit75");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout78);
    obj.label98:setAlign("left");
    obj.label98:setWidth(5);
    obj.label98:setText("");
    obj.label98:setHorzTextAlign("trailing");
    obj.label98:setMargins({right=5});
    obj.label98:setName("label98");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout66);
    obj.layout79:setAlign("top");
    obj.layout79:setHeight(20);
    obj.layout79:setMargins({bottom=2, top=15});
    obj.layout79:setName("layout79");

    obj.comboBox42 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox42:setParent(obj.layout79);
    obj.comboBox42:setAlign("left");
    obj.comboBox42:setLeft(5);
    obj.comboBox42:setTop(20);
    obj.comboBox42:setWidth(100);
    obj.comboBox42:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox42:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox42:setValue("D");
    obj.comboBox42:setField("periciaselect.gen13");
    obj.comboBox42:setName("comboBox42");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout79);
    obj.edit76:setAlign("left");
    obj.edit76:setHorzTextAlign("trailing");
    obj.edit76:setFontSize(14);
    obj.edit76:setWidth(120);
    obj.edit76:setField("pericia.nome.gen13");
    obj.edit76:setMargins({right=5});
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout79);
    obj.edit77:setType("number");
    obj.edit77:setAlign("left");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setFontSize(14);
    obj.edit77:setWidth(30);
    obj.edit77:setField("pericia.gen13");
    obj.edit77:setName("edit77");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout79);
    obj.label99:setAlign("left");
    obj.label99:setWidth(5);
    obj.label99:setText("");
    obj.label99:setHorzTextAlign("trailing");
    obj.label99:setMargins({right=5});
    obj.label99:setName("label99");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout66);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(20);
    obj.layout80:setMargins({bottom=2, top=15});
    obj.layout80:setName("layout80");

    obj.comboBox43 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox43:setParent(obj.layout80);
    obj.comboBox43:setAlign("left");
    obj.comboBox43:setLeft(5);
    obj.comboBox43:setTop(20);
    obj.comboBox43:setWidth(100);
    obj.comboBox43:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox43:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox43:setValue("D");
    obj.comboBox43:setField("periciaselect.gen14");
    obj.comboBox43:setName("comboBox43");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout80);
    obj.edit78:setAlign("left");
    obj.edit78:setHorzTextAlign("trailing");
    obj.edit78:setFontSize(14);
    obj.edit78:setWidth(120);
    obj.edit78:setField("pericia.nome.gen14");
    obj.edit78:setMargins({right=5});
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout80);
    obj.edit79:setType("number");
    obj.edit79:setAlign("left");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setFontSize(14);
    obj.edit79:setWidth(30);
    obj.edit79:setField("pericia.gen14");
    obj.edit79:setName("edit79");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout80);
    obj.label100:setAlign("left");
    obj.label100:setWidth(5);
    obj.label100:setText("");
    obj.label100:setHorzTextAlign("trailing");
    obj.label100:setMargins({right=5});
    obj.label100:setName("label100");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout66);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(20);
    obj.layout81:setMargins({bottom=2, top=15});
    obj.layout81:setName("layout81");

    obj.comboBox44 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox44:setParent(obj.layout81);
    obj.comboBox44:setAlign("left");
    obj.comboBox44:setLeft(5);
    obj.comboBox44:setTop(20);
    obj.comboBox44:setWidth(100);
    obj.comboBox44:setItems({'Destreinado', 'Treinado', 'Veterano', 'Expert'});
    obj.comboBox44:setValues({'D', 'T', 'V', 'E'});
    obj.comboBox44:setValue("D");
    obj.comboBox44:setField("periciaselect.gen15");
    obj.comboBox44:setName("comboBox44");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout81);
    obj.edit80:setAlign("left");
    obj.edit80:setHorzTextAlign("trailing");
    obj.edit80:setFontSize(14);
    obj.edit80:setWidth(120);
    obj.edit80:setField("pericia.nome.gen15");
    obj.edit80:setMargins({right=5});
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout81);
    obj.edit81:setType("number");
    obj.edit81:setAlign("left");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setFontSize(14);
    obj.edit81:setWidth(30);
    obj.edit81:setField("pericia.gen15");
    obj.edit81:setName("edit81");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout81);
    obj.label101:setAlign("left");
    obj.label101:setWidth(5);
    obj.label101:setText("");
    obj.label101:setHorzTextAlign("trailing");
    obj.label101:setMargins({right=5});
    obj.label101:setName("label101");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox1);
    obj.layout82:setAlign("none");
    obj.layout82:setLeft(1002);
    obj.layout82:setHeight(604);
    obj.layout82:setWidth(332);
    obj.layout82:setTop(325);
    obj.layout82:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout82:setMargins({left=30, right=10, bottom=10});
    obj.layout82:setName("layout82");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout82);
    obj.label102:setText("Proficiências");
    obj.label102:setLeft(130);
    lfm_setPropAsString(obj.label102, "fontStyle",  "bold italic");
    obj.label102:setTop(9);
    obj.label102:setWidth(1343);
    obj.label102:setName("label102");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout82);
    obj.layout83:setLeft(20);
    obj.layout83:setTop(25);
    obj.layout83:setWidth(270);
    obj.layout83:setHeight(604);
    obj.layout83:setName("layout83");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout83);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(20);
    obj.layout84:setMargins({bottom=2, top=15});
    obj.layout84:setName("layout84");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout84);
    obj.label103:setAlign("left");
    obj.label103:setWidth(20);
    obj.label103:setText("");
    obj.label103:setHorzTextAlign("trailing");
    obj.label103:setMargins({right=5});
    obj.label103:setName("label103");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout84);
    obj.edit82:setAlign("left");
    obj.edit82:setHorzTextAlign("leading");
    obj.edit82:setFontSize(14);
    obj.edit82:setWidth(240);
    obj.edit82:setField("pericia.nome.profc1");
    obj.edit82:setMargins({right=5});
    obj.edit82:setName("edit82");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout83);
    obj.layout85:setAlign("top");
    obj.layout85:setHeight(20);
    obj.layout85:setMargins({bottom=2, top=15});
    obj.layout85:setName("layout85");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout85);
    obj.label104:setAlign("left");
    obj.label104:setWidth(20);
    obj.label104:setText("");
    obj.label104:setHorzTextAlign("trailing");
    obj.label104:setMargins({right=5});
    obj.label104:setName("label104");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout85);
    obj.edit83:setAlign("left");
    obj.edit83:setHorzTextAlign("leading");
    obj.edit83:setFontSize(14);
    obj.edit83:setWidth(240);
    obj.edit83:setField("pericia.nome.profc2");
    obj.edit83:setMargins({right=5});
    obj.edit83:setName("edit83");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout83);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(20);
    obj.layout86:setMargins({bottom=2, top=15});
    obj.layout86:setName("layout86");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout86);
    obj.label105:setAlign("left");
    obj.label105:setWidth(20);
    obj.label105:setText("");
    obj.label105:setHorzTextAlign("trailing");
    obj.label105:setMargins({right=5});
    obj.label105:setName("label105");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout86);
    obj.edit84:setAlign("left");
    obj.edit84:setHorzTextAlign("leading");
    obj.edit84:setFontSize(14);
    obj.edit84:setWidth(240);
    obj.edit84:setField("pericia.nome.profc3");
    obj.edit84:setMargins({right=5});
    obj.edit84:setName("edit84");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout83);
    obj.layout87:setAlign("top");
    obj.layout87:setHeight(20);
    obj.layout87:setMargins({bottom=2, top=15});
    obj.layout87:setName("layout87");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout87);
    obj.label106:setAlign("left");
    obj.label106:setWidth(20);
    obj.label106:setText("");
    obj.label106:setHorzTextAlign("trailing");
    obj.label106:setMargins({right=5});
    obj.label106:setName("label106");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout87);
    obj.edit85:setAlign("left");
    obj.edit85:setHorzTextAlign("leading");
    obj.edit85:setFontSize(14);
    obj.edit85:setWidth(240);
    obj.edit85:setField("pericia.nome.profc4");
    obj.edit85:setMargins({right=5});
    obj.edit85:setName("edit85");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout83);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(20);
    obj.layout88:setMargins({bottom=2, top=15});
    obj.layout88:setName("layout88");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout88);
    obj.label107:setAlign("left");
    obj.label107:setWidth(20);
    obj.label107:setText("");
    obj.label107:setHorzTextAlign("trailing");
    obj.label107:setMargins({right=5});
    obj.label107:setName("label107");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout88);
    obj.edit86:setAlign("left");
    obj.edit86:setHorzTextAlign("leading");
    obj.edit86:setFontSize(14);
    obj.edit86:setWidth(240);
    obj.edit86:setField("pericia.nome.profc5");
    obj.edit86:setMargins({right=5});
    obj.edit86:setName("edit86");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout83);
    obj.layout89:setAlign("top");
    obj.layout89:setHeight(20);
    obj.layout89:setMargins({bottom=2, top=15});
    obj.layout89:setName("layout89");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout89);
    obj.label108:setAlign("left");
    obj.label108:setWidth(20);
    obj.label108:setText("");
    obj.label108:setHorzTextAlign("trailing");
    obj.label108:setMargins({right=5});
    obj.label108:setName("label108");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout89);
    obj.edit87:setAlign("left");
    obj.edit87:setHorzTextAlign("leading");
    obj.edit87:setFontSize(14);
    obj.edit87:setWidth(240);
    obj.edit87:setField("pericia.nome.profc6");
    obj.edit87:setMargins({right=5});
    obj.edit87:setName("edit87");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout83);
    obj.layout90:setAlign("top");
    obj.layout90:setHeight(20);
    obj.layout90:setMargins({bottom=2, top=15});
    obj.layout90:setName("layout90");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout90);
    obj.label109:setAlign("left");
    obj.label109:setWidth(20);
    obj.label109:setText("");
    obj.label109:setHorzTextAlign("trailing");
    obj.label109:setMargins({right=5});
    obj.label109:setName("label109");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout90);
    obj.edit88:setAlign("left");
    obj.edit88:setHorzTextAlign("leading");
    obj.edit88:setFontSize(14);
    obj.edit88:setWidth(240);
    obj.edit88:setField("pericia.nome.profc7");
    obj.edit88:setMargins({right=5});
    obj.edit88:setName("edit88");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout83);
    obj.layout91:setAlign("top");
    obj.layout91:setHeight(20);
    obj.layout91:setMargins({bottom=2, top=15});
    obj.layout91:setName("layout91");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout91);
    obj.label110:setAlign("left");
    obj.label110:setWidth(20);
    obj.label110:setText("");
    obj.label110:setHorzTextAlign("trailing");
    obj.label110:setMargins({right=5});
    obj.label110:setName("label110");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout91);
    obj.edit89:setAlign("left");
    obj.edit89:setHorzTextAlign("leading");
    obj.edit89:setFontSize(14);
    obj.edit89:setWidth(240);
    obj.edit89:setField("pericia.nome.profc8");
    obj.edit89:setMargins({right=5});
    obj.edit89:setName("edit89");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout83);
    obj.layout92:setAlign("top");
    obj.layout92:setHeight(20);
    obj.layout92:setMargins({bottom=2, top=15});
    obj.layout92:setName("layout92");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout92);
    obj.label111:setAlign("left");
    obj.label111:setWidth(20);
    obj.label111:setText("");
    obj.label111:setHorzTextAlign("trailing");
    obj.label111:setMargins({right=5});
    obj.label111:setName("label111");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout92);
    obj.edit90:setAlign("left");
    obj.edit90:setHorzTextAlign("leading");
    obj.edit90:setFontSize(14);
    obj.edit90:setWidth(240);
    obj.edit90:setField("pericia.nome.profc9");
    obj.edit90:setMargins({right=5});
    obj.edit90:setName("edit90");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout83);
    obj.layout93:setAlign("top");
    obj.layout93:setHeight(20);
    obj.layout93:setMargins({bottom=2, top=15});
    obj.layout93:setName("layout93");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout93);
    obj.label112:setAlign("left");
    obj.label112:setWidth(20);
    obj.label112:setText("");
    obj.label112:setHorzTextAlign("trailing");
    obj.label112:setMargins({right=5});
    obj.label112:setName("label112");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout93);
    obj.edit91:setAlign("left");
    obj.edit91:setHorzTextAlign("leading");
    obj.edit91:setFontSize(14);
    obj.edit91:setWidth(240);
    obj.edit91:setField("pericia.nome.profc10");
    obj.edit91:setMargins({right=5});
    obj.edit91:setName("edit91");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout83);
    obj.layout94:setAlign("top");
    obj.layout94:setHeight(20);
    obj.layout94:setMargins({bottom=2, top=15});
    obj.layout94:setName("layout94");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout94);
    obj.label113:setAlign("left");
    obj.label113:setWidth(20);
    obj.label113:setText("");
    obj.label113:setHorzTextAlign("trailing");
    obj.label113:setMargins({right=5});
    obj.label113:setName("label113");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout94);
    obj.edit92:setAlign("left");
    obj.edit92:setHorzTextAlign("leading");
    obj.edit92:setFontSize(14);
    obj.edit92:setWidth(240);
    obj.edit92:setField("pericia.nome.profc11");
    obj.edit92:setMargins({right=5});
    obj.edit92:setName("edit92");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout83);
    obj.layout95:setAlign("top");
    obj.layout95:setHeight(20);
    obj.layout95:setMargins({bottom=2, top=15});
    obj.layout95:setName("layout95");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout95);
    obj.label114:setAlign("left");
    obj.label114:setWidth(20);
    obj.label114:setText("");
    obj.label114:setHorzTextAlign("trailing");
    obj.label114:setMargins({right=5});
    obj.label114:setName("label114");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout95);
    obj.edit93:setAlign("left");
    obj.edit93:setHorzTextAlign("leading");
    obj.edit93:setFontSize(14);
    obj.edit93:setWidth(240);
    obj.edit93:setField("pericia.nome.profc12");
    obj.edit93:setMargins({right=5});
    obj.edit93:setName("edit93");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout83);
    obj.layout96:setAlign("top");
    obj.layout96:setHeight(20);
    obj.layout96:setMargins({bottom=2, top=15});
    obj.layout96:setName("layout96");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout96);
    obj.label115:setAlign("left");
    obj.label115:setWidth(20);
    obj.label115:setText("");
    obj.label115:setHorzTextAlign("trailing");
    obj.label115:setMargins({right=5});
    obj.label115:setName("label115");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout96);
    obj.edit94:setAlign("left");
    obj.edit94:setHorzTextAlign("leading");
    obj.edit94:setFontSize(14);
    obj.edit94:setWidth(240);
    obj.edit94:setField("pericia.nome.profc13");
    obj.edit94:setMargins({right=5});
    obj.edit94:setName("edit94");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout83);
    obj.layout97:setAlign("top");
    obj.layout97:setHeight(20);
    obj.layout97:setMargins({bottom=2, top=15});
    obj.layout97:setName("layout97");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout97);
    obj.label116:setAlign("left");
    obj.label116:setWidth(20);
    obj.label116:setText("");
    obj.label116:setHorzTextAlign("trailing");
    obj.label116:setMargins({right=5});
    obj.label116:setName("label116");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout97);
    obj.edit95:setAlign("left");
    obj.edit95:setHorzTextAlign("leading");
    obj.edit95:setFontSize(14);
    obj.edit95:setWidth(240);
    obj.edit95:setField("pericia.nome.profc14");
    obj.edit95:setMargins({right=5});
    obj.edit95:setName("edit95");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layout83);
    obj.layout98:setAlign("top");
    obj.layout98:setHeight(20);
    obj.layout98:setMargins({bottom=2, top=15});
    obj.layout98:setName("layout98");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout98);
    obj.label117:setAlign("left");
    obj.label117:setWidth(20);
    obj.label117:setText("");
    obj.label117:setHorzTextAlign("trailing");
    obj.label117:setMargins({right=5});
    obj.label117:setName("label117");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout98);
    obj.edit96:setAlign("left");
    obj.edit96:setHorzTextAlign("leading");
    obj.edit96:setFontSize(14);
    obj.edit96:setWidth(240);
    obj.edit96:setField("pericia.nome.profc15");
    obj.edit96:setMargins({right=5});
    obj.edit96:setName("edit96");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.scrollBox1);
    obj.layout99:setAlign("none");
    obj.layout99:setLeft(5);
    obj.layout99:setHeight(332);
    obj.layout99:setWidth(996);
    obj.layout99:setTop(930);
    obj.layout99:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout99:setMargins({left=30, right=10, bottom=10});
    obj.layout99:setName("layout99");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout99);
    obj.label118:setText("Ataques");
    obj.label118:setLeft(491);
    lfm_setPropAsString(obj.label118, "fontStyle",  "bold italic");
    obj.label118:setTop(9);
    obj.label118:setWidth(996);
    obj.label118:setName("label118");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout99);
    obj.layout100:setLeft(20);
    obj.layout100:setTop(25);
    obj.layout100:setWidth(996);
    obj.layout100:setHeight(332);
    obj.layout100:setName("layout100");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout100);
    obj.layout101:setAlign("top");
    obj.layout101:setHeight(20);
    obj.layout101:setMargins({bottom=2, top=15});
    obj.layout101:setName("layout101");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout101);
    obj.label119:setAlign("left");
    obj.label119:setWidth(5);
    obj.label119:setText("");
    obj.label119:setHorzTextAlign("trailing");
    obj.label119:setMargins({right=5});
    obj.label119:setName("label119");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout101);
    obj.label120:setAlign("left");
    obj.label120:setWidth(55);
    obj.label120:setText("Nome: ");
    obj.label120:setHorzTextAlign("trailing");
    obj.label120:setMargins({right=5});
    obj.label120:setName("label120");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout101);
    obj.edit97:setAlign("left");
    obj.edit97:setHorzTextAlign("leading");
    obj.edit97:setFontSize(14);
    obj.edit97:setWidth(120);
    obj.edit97:setField("ataque.nome.a1");
    obj.edit97:setMargins({right=5});
    obj.edit97:setName("edit97");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout101);
    obj.label121:setAlign("left");
    obj.label121:setWidth(55);
    obj.label121:setText("Tipo: ");
    obj.label121:setHorzTextAlign("trailing");
    obj.label121:setMargins({right=5});
    obj.label121:setName("label121");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout101);
    obj.edit98:setAlign("left");
    obj.edit98:setHorzTextAlign("leading");
    obj.edit98:setFontSize(14);
    obj.edit98:setWidth(60);
    obj.edit98:setField("ataque.tipo.a1");
    obj.edit98:setMargins({right=5});
    obj.edit98:setName("edit98");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout101);
    obj.label122:setAlign("left");
    obj.label122:setWidth(55);
    obj.label122:setText("Ataque: ");
    obj.label122:setHorzTextAlign("trailing");
    obj.label122:setMargins({right=5});
    obj.label122:setName("label122");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout101);
    obj.edit99:setAlign("left");
    obj.edit99:setHorzTextAlign("leading");
    obj.edit99:setFontSize(14);
    obj.edit99:setWidth(60);
    obj.edit99:setField("ataque.ataque.a1");
    obj.edit99:setMargins({right=5});
    obj.edit99:setName("edit99");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout101);
    obj.label123:setAlign("left");
    obj.label123:setWidth(55);
    obj.label123:setText("Alcance: ");
    obj.label123:setHorzTextAlign("trailing");
    obj.label123:setMargins({right=5});
    obj.label123:setName("label123");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout101);
    obj.edit100:setAlign("left");
    obj.edit100:setHorzTextAlign("leading");
    obj.edit100:setFontSize(14);
    obj.edit100:setWidth(60);
    obj.edit100:setField("ataque.alcance.a1");
    obj.edit100:setMargins({right=5});
    obj.edit100:setName("edit100");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout101);
    obj.label124:setAlign("left");
    obj.label124:setWidth(55);
    obj.label124:setText("Dano: ");
    obj.label124:setHorzTextAlign("trailing");
    obj.label124:setMargins({right=5});
    obj.label124:setName("label124");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout101);
    obj.edit101:setAlign("left");
    obj.edit101:setHorzTextAlign("leading");
    obj.edit101:setFontSize(14);
    obj.edit101:setWidth(60);
    obj.edit101:setField("ataque.dano.a1");
    obj.edit101:setMargins({right=5});
    obj.edit101:setName("edit101");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout101);
    obj.label125:setAlign("left");
    obj.label125:setWidth(55);
    obj.label125:setText("Munição: ");
    obj.label125:setHorzTextAlign("trailing");
    obj.label125:setMargins({right=5});
    obj.label125:setName("label125");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout101);
    obj.edit102:setAlign("left");
    obj.edit102:setHorzTextAlign("leading");
    obj.edit102:setFontSize(14);
    obj.edit102:setWidth(60);
    obj.edit102:setField("ataque.municao.a1");
    obj.edit102:setMargins({right=5});
    obj.edit102:setName("edit102");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout101);
    obj.label126:setAlign("left");
    obj.label126:setWidth(55);
    obj.label126:setText("Crítico: ");
    obj.label126:setHorzTextAlign("trailing");
    obj.label126:setMargins({right=5});
    obj.label126:setName("label126");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout101);
    obj.edit103:setAlign("left");
    obj.edit103:setHorzTextAlign("leading");
    obj.edit103:setFontSize(14);
    obj.edit103:setWidth(60);
    obj.edit103:setField("ataque.critico.a1");
    obj.edit103:setMargins({right=5});
    obj.edit103:setName("edit103");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout101);
    obj.label127:setAlign("left");
    obj.label127:setWidth(5);
    obj.label127:setText("");
    obj.label127:setHorzTextAlign("trailing");
    obj.label127:setMargins({right=5});
    obj.label127:setName("label127");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout100);
    obj.layout102:setAlign("top");
    obj.layout102:setHeight(20);
    obj.layout102:setMargins({bottom=2, top=15});
    obj.layout102:setName("layout102");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout102);
    obj.label128:setAlign("left");
    obj.label128:setWidth(5);
    obj.label128:setText("");
    obj.label128:setHorzTextAlign("trailing");
    obj.label128:setMargins({right=5});
    obj.label128:setName("label128");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout102);
    obj.label129:setAlign("left");
    obj.label129:setWidth(55);
    obj.label129:setText("Nome: ");
    obj.label129:setHorzTextAlign("trailing");
    obj.label129:setMargins({right=5});
    obj.label129:setName("label129");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout102);
    obj.edit104:setAlign("left");
    obj.edit104:setHorzTextAlign("leading");
    obj.edit104:setFontSize(14);
    obj.edit104:setWidth(120);
    obj.edit104:setField("ataque.nome.a2");
    obj.edit104:setMargins({right=5});
    obj.edit104:setName("edit104");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout102);
    obj.label130:setAlign("left");
    obj.label130:setWidth(55);
    obj.label130:setText("Tipo: ");
    obj.label130:setHorzTextAlign("trailing");
    obj.label130:setMargins({right=5});
    obj.label130:setName("label130");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout102);
    obj.edit105:setAlign("left");
    obj.edit105:setHorzTextAlign("leading");
    obj.edit105:setFontSize(14);
    obj.edit105:setWidth(60);
    obj.edit105:setField("ataque.tipo.a2");
    obj.edit105:setMargins({right=5});
    obj.edit105:setName("edit105");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout102);
    obj.label131:setAlign("left");
    obj.label131:setWidth(55);
    obj.label131:setText("Ataque: ");
    obj.label131:setHorzTextAlign("trailing");
    obj.label131:setMargins({right=5});
    obj.label131:setName("label131");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout102);
    obj.edit106:setAlign("left");
    obj.edit106:setHorzTextAlign("leading");
    obj.edit106:setFontSize(14);
    obj.edit106:setWidth(60);
    obj.edit106:setField("ataque.ataque.a2");
    obj.edit106:setMargins({right=5});
    obj.edit106:setName("edit106");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout102);
    obj.label132:setAlign("left");
    obj.label132:setWidth(55);
    obj.label132:setText("Alcance: ");
    obj.label132:setHorzTextAlign("trailing");
    obj.label132:setMargins({right=5});
    obj.label132:setName("label132");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout102);
    obj.edit107:setAlign("left");
    obj.edit107:setHorzTextAlign("leading");
    obj.edit107:setFontSize(14);
    obj.edit107:setWidth(60);
    obj.edit107:setField("ataque.alcance.a2");
    obj.edit107:setMargins({right=5});
    obj.edit107:setName("edit107");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout102);
    obj.label133:setAlign("left");
    obj.label133:setWidth(55);
    obj.label133:setText("Dano: ");
    obj.label133:setHorzTextAlign("trailing");
    obj.label133:setMargins({right=5});
    obj.label133:setName("label133");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout102);
    obj.edit108:setAlign("left");
    obj.edit108:setHorzTextAlign("leading");
    obj.edit108:setFontSize(14);
    obj.edit108:setWidth(60);
    obj.edit108:setField("ataque.dano.a2");
    obj.edit108:setMargins({right=5});
    obj.edit108:setName("edit108");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout102);
    obj.label134:setAlign("left");
    obj.label134:setWidth(55);
    obj.label134:setText("Munição: ");
    obj.label134:setHorzTextAlign("trailing");
    obj.label134:setMargins({right=5});
    obj.label134:setName("label134");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout102);
    obj.edit109:setAlign("left");
    obj.edit109:setHorzTextAlign("leading");
    obj.edit109:setFontSize(14);
    obj.edit109:setWidth(60);
    obj.edit109:setField("ataque.municao.a2");
    obj.edit109:setMargins({right=5});
    obj.edit109:setName("edit109");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout102);
    obj.label135:setAlign("left");
    obj.label135:setWidth(55);
    obj.label135:setText("Crítico: ");
    obj.label135:setHorzTextAlign("trailing");
    obj.label135:setMargins({right=5});
    obj.label135:setName("label135");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout102);
    obj.edit110:setAlign("left");
    obj.edit110:setHorzTextAlign("leading");
    obj.edit110:setFontSize(14);
    obj.edit110:setWidth(60);
    obj.edit110:setField("ataque.critico.a2");
    obj.edit110:setMargins({right=5});
    obj.edit110:setName("edit110");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout102);
    obj.label136:setAlign("left");
    obj.label136:setWidth(5);
    obj.label136:setText("");
    obj.label136:setHorzTextAlign("trailing");
    obj.label136:setMargins({right=5});
    obj.label136:setName("label136");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout100);
    obj.layout103:setAlign("top");
    obj.layout103:setHeight(20);
    obj.layout103:setMargins({bottom=2, top=15});
    obj.layout103:setName("layout103");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout103);
    obj.label137:setAlign("left");
    obj.label137:setWidth(5);
    obj.label137:setText("");
    obj.label137:setHorzTextAlign("trailing");
    obj.label137:setMargins({right=5});
    obj.label137:setName("label137");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout103);
    obj.label138:setAlign("left");
    obj.label138:setWidth(55);
    obj.label138:setText("Nome: ");
    obj.label138:setHorzTextAlign("trailing");
    obj.label138:setMargins({right=5});
    obj.label138:setName("label138");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout103);
    obj.edit111:setAlign("left");
    obj.edit111:setHorzTextAlign("leading");
    obj.edit111:setFontSize(14);
    obj.edit111:setWidth(120);
    obj.edit111:setField("ataque.nome.a3");
    obj.edit111:setMargins({right=5});
    obj.edit111:setName("edit111");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout103);
    obj.label139:setAlign("left");
    obj.label139:setWidth(55);
    obj.label139:setText("Tipo: ");
    obj.label139:setHorzTextAlign("trailing");
    obj.label139:setMargins({right=5});
    obj.label139:setName("label139");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout103);
    obj.edit112:setAlign("left");
    obj.edit112:setHorzTextAlign("leading");
    obj.edit112:setFontSize(14);
    obj.edit112:setWidth(60);
    obj.edit112:setField("ataque.tipo.a3");
    obj.edit112:setMargins({right=5});
    obj.edit112:setName("edit112");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout103);
    obj.label140:setAlign("left");
    obj.label140:setWidth(55);
    obj.label140:setText("Ataque: ");
    obj.label140:setHorzTextAlign("trailing");
    obj.label140:setMargins({right=5});
    obj.label140:setName("label140");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout103);
    obj.edit113:setAlign("left");
    obj.edit113:setHorzTextAlign("leading");
    obj.edit113:setFontSize(14);
    obj.edit113:setWidth(60);
    obj.edit113:setField("ataque.ataque.a3");
    obj.edit113:setMargins({right=5});
    obj.edit113:setName("edit113");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout103);
    obj.label141:setAlign("left");
    obj.label141:setWidth(55);
    obj.label141:setText("Alcance: ");
    obj.label141:setHorzTextAlign("trailing");
    obj.label141:setMargins({right=5});
    obj.label141:setName("label141");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout103);
    obj.edit114:setAlign("left");
    obj.edit114:setHorzTextAlign("leading");
    obj.edit114:setFontSize(14);
    obj.edit114:setWidth(60);
    obj.edit114:setField("ataque.alcance.a3");
    obj.edit114:setMargins({right=5});
    obj.edit114:setName("edit114");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout103);
    obj.label142:setAlign("left");
    obj.label142:setWidth(55);
    obj.label142:setText("Dano: ");
    obj.label142:setHorzTextAlign("trailing");
    obj.label142:setMargins({right=5});
    obj.label142:setName("label142");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout103);
    obj.edit115:setAlign("left");
    obj.edit115:setHorzTextAlign("leading");
    obj.edit115:setFontSize(14);
    obj.edit115:setWidth(60);
    obj.edit115:setField("ataque.dano.a3");
    obj.edit115:setMargins({right=5});
    obj.edit115:setName("edit115");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout103);
    obj.label143:setAlign("left");
    obj.label143:setWidth(55);
    obj.label143:setText("Munição: ");
    obj.label143:setHorzTextAlign("trailing");
    obj.label143:setMargins({right=5});
    obj.label143:setName("label143");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout103);
    obj.edit116:setAlign("left");
    obj.edit116:setHorzTextAlign("leading");
    obj.edit116:setFontSize(14);
    obj.edit116:setWidth(60);
    obj.edit116:setField("ataque.municao.a3");
    obj.edit116:setMargins({right=5});
    obj.edit116:setName("edit116");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout103);
    obj.label144:setAlign("left");
    obj.label144:setWidth(55);
    obj.label144:setText("Crítico: ");
    obj.label144:setHorzTextAlign("trailing");
    obj.label144:setMargins({right=5});
    obj.label144:setName("label144");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout103);
    obj.edit117:setAlign("left");
    obj.edit117:setHorzTextAlign("leading");
    obj.edit117:setFontSize(14);
    obj.edit117:setWidth(60);
    obj.edit117:setField("ataque.critico.a3");
    obj.edit117:setMargins({right=5});
    obj.edit117:setName("edit117");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout103);
    obj.label145:setAlign("left");
    obj.label145:setWidth(5);
    obj.label145:setText("");
    obj.label145:setHorzTextAlign("trailing");
    obj.label145:setMargins({right=5});
    obj.label145:setName("label145");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout100);
    obj.layout104:setAlign("top");
    obj.layout104:setHeight(20);
    obj.layout104:setMargins({bottom=2, top=15});
    obj.layout104:setName("layout104");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout104);
    obj.label146:setAlign("left");
    obj.label146:setWidth(5);
    obj.label146:setText("");
    obj.label146:setHorzTextAlign("trailing");
    obj.label146:setMargins({right=5});
    obj.label146:setName("label146");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout104);
    obj.label147:setAlign("left");
    obj.label147:setWidth(55);
    obj.label147:setText("Nome: ");
    obj.label147:setHorzTextAlign("trailing");
    obj.label147:setMargins({right=5});
    obj.label147:setName("label147");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout104);
    obj.edit118:setAlign("left");
    obj.edit118:setHorzTextAlign("leading");
    obj.edit118:setFontSize(14);
    obj.edit118:setWidth(120);
    obj.edit118:setField("ataque.nome.a4");
    obj.edit118:setMargins({right=5});
    obj.edit118:setName("edit118");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout104);
    obj.label148:setAlign("left");
    obj.label148:setWidth(55);
    obj.label148:setText("Tipo: ");
    obj.label148:setHorzTextAlign("trailing");
    obj.label148:setMargins({right=5});
    obj.label148:setName("label148");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout104);
    obj.edit119:setAlign("left");
    obj.edit119:setHorzTextAlign("leading");
    obj.edit119:setFontSize(14);
    obj.edit119:setWidth(60);
    obj.edit119:setField("ataque.tipo.a4");
    obj.edit119:setMargins({right=5});
    obj.edit119:setName("edit119");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout104);
    obj.label149:setAlign("left");
    obj.label149:setWidth(55);
    obj.label149:setText("Ataque: ");
    obj.label149:setHorzTextAlign("trailing");
    obj.label149:setMargins({right=5});
    obj.label149:setName("label149");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout104);
    obj.edit120:setAlign("left");
    obj.edit120:setHorzTextAlign("leading");
    obj.edit120:setFontSize(14);
    obj.edit120:setWidth(60);
    obj.edit120:setField("ataque.ataque.a4");
    obj.edit120:setMargins({right=5});
    obj.edit120:setName("edit120");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout104);
    obj.label150:setAlign("left");
    obj.label150:setWidth(55);
    obj.label150:setText("Alcance: ");
    obj.label150:setHorzTextAlign("trailing");
    obj.label150:setMargins({right=5});
    obj.label150:setName("label150");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout104);
    obj.edit121:setAlign("left");
    obj.edit121:setHorzTextAlign("leading");
    obj.edit121:setFontSize(14);
    obj.edit121:setWidth(60);
    obj.edit121:setField("ataque.alcance.a4");
    obj.edit121:setMargins({right=5});
    obj.edit121:setName("edit121");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout104);
    obj.label151:setAlign("left");
    obj.label151:setWidth(55);
    obj.label151:setText("Dano: ");
    obj.label151:setHorzTextAlign("trailing");
    obj.label151:setMargins({right=5});
    obj.label151:setName("label151");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout104);
    obj.edit122:setAlign("left");
    obj.edit122:setHorzTextAlign("leading");
    obj.edit122:setFontSize(14);
    obj.edit122:setWidth(60);
    obj.edit122:setField("ataque.dano.a4");
    obj.edit122:setMargins({right=5});
    obj.edit122:setName("edit122");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout104);
    obj.label152:setAlign("left");
    obj.label152:setWidth(55);
    obj.label152:setText("Munição: ");
    obj.label152:setHorzTextAlign("trailing");
    obj.label152:setMargins({right=5});
    obj.label152:setName("label152");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout104);
    obj.edit123:setAlign("left");
    obj.edit123:setHorzTextAlign("leading");
    obj.edit123:setFontSize(14);
    obj.edit123:setWidth(60);
    obj.edit123:setField("ataque.municao.a4");
    obj.edit123:setMargins({right=5});
    obj.edit123:setName("edit123");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout104);
    obj.label153:setAlign("left");
    obj.label153:setWidth(55);
    obj.label153:setText("Crítico: ");
    obj.label153:setHorzTextAlign("trailing");
    obj.label153:setMargins({right=5});
    obj.label153:setName("label153");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout104);
    obj.edit124:setAlign("left");
    obj.edit124:setHorzTextAlign("leading");
    obj.edit124:setFontSize(14);
    obj.edit124:setWidth(60);
    obj.edit124:setField("ataque.critico.a4");
    obj.edit124:setMargins({right=5});
    obj.edit124:setName("edit124");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout104);
    obj.label154:setAlign("left");
    obj.label154:setWidth(5);
    obj.label154:setText("");
    obj.label154:setHorzTextAlign("trailing");
    obj.label154:setMargins({right=5});
    obj.label154:setName("label154");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout100);
    obj.layout105:setAlign("top");
    obj.layout105:setHeight(20);
    obj.layout105:setMargins({bottom=2, top=15});
    obj.layout105:setName("layout105");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout105);
    obj.label155:setAlign("left");
    obj.label155:setWidth(5);
    obj.label155:setText("");
    obj.label155:setHorzTextAlign("trailing");
    obj.label155:setMargins({right=5});
    obj.label155:setName("label155");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout105);
    obj.label156:setAlign("left");
    obj.label156:setWidth(55);
    obj.label156:setText("Nome: ");
    obj.label156:setHorzTextAlign("trailing");
    obj.label156:setMargins({right=5});
    obj.label156:setName("label156");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout105);
    obj.edit125:setAlign("left");
    obj.edit125:setHorzTextAlign("leading");
    obj.edit125:setFontSize(14);
    obj.edit125:setWidth(120);
    obj.edit125:setField("ataque.nome.a5");
    obj.edit125:setMargins({right=5});
    obj.edit125:setName("edit125");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout105);
    obj.label157:setAlign("left");
    obj.label157:setWidth(55);
    obj.label157:setText("Tipo: ");
    obj.label157:setHorzTextAlign("trailing");
    obj.label157:setMargins({right=5});
    obj.label157:setName("label157");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout105);
    obj.edit126:setAlign("left");
    obj.edit126:setHorzTextAlign("leading");
    obj.edit126:setFontSize(14);
    obj.edit126:setWidth(60);
    obj.edit126:setField("ataque.tipo.a5");
    obj.edit126:setMargins({right=5});
    obj.edit126:setName("edit126");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout105);
    obj.label158:setAlign("left");
    obj.label158:setWidth(55);
    obj.label158:setText("Ataque: ");
    obj.label158:setHorzTextAlign("trailing");
    obj.label158:setMargins({right=5});
    obj.label158:setName("label158");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout105);
    obj.edit127:setAlign("left");
    obj.edit127:setHorzTextAlign("leading");
    obj.edit127:setFontSize(14);
    obj.edit127:setWidth(60);
    obj.edit127:setField("ataque.ataque.a5");
    obj.edit127:setMargins({right=5});
    obj.edit127:setName("edit127");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout105);
    obj.label159:setAlign("left");
    obj.label159:setWidth(55);
    obj.label159:setText("Alcance: ");
    obj.label159:setHorzTextAlign("trailing");
    obj.label159:setMargins({right=5});
    obj.label159:setName("label159");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout105);
    obj.edit128:setAlign("left");
    obj.edit128:setHorzTextAlign("leading");
    obj.edit128:setFontSize(14);
    obj.edit128:setWidth(60);
    obj.edit128:setField("ataque.alcance.a5");
    obj.edit128:setMargins({right=5});
    obj.edit128:setName("edit128");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout105);
    obj.label160:setAlign("left");
    obj.label160:setWidth(55);
    obj.label160:setText("Dano: ");
    obj.label160:setHorzTextAlign("trailing");
    obj.label160:setMargins({right=5});
    obj.label160:setName("label160");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout105);
    obj.edit129:setAlign("left");
    obj.edit129:setHorzTextAlign("leading");
    obj.edit129:setFontSize(14);
    obj.edit129:setWidth(60);
    obj.edit129:setField("ataque.dano.a5");
    obj.edit129:setMargins({right=5});
    obj.edit129:setName("edit129");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout105);
    obj.label161:setAlign("left");
    obj.label161:setWidth(55);
    obj.label161:setText("Munição: ");
    obj.label161:setHorzTextAlign("trailing");
    obj.label161:setMargins({right=5});
    obj.label161:setName("label161");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout105);
    obj.edit130:setAlign("left");
    obj.edit130:setHorzTextAlign("leading");
    obj.edit130:setFontSize(14);
    obj.edit130:setWidth(60);
    obj.edit130:setField("ataque.municao.a5");
    obj.edit130:setMargins({right=5});
    obj.edit130:setName("edit130");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout105);
    obj.label162:setAlign("left");
    obj.label162:setWidth(55);
    obj.label162:setText("Crítico: ");
    obj.label162:setHorzTextAlign("trailing");
    obj.label162:setMargins({right=5});
    obj.label162:setName("label162");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout105);
    obj.edit131:setAlign("left");
    obj.edit131:setHorzTextAlign("leading");
    obj.edit131:setFontSize(14);
    obj.edit131:setWidth(60);
    obj.edit131:setField("ataque.critico.a5");
    obj.edit131:setMargins({right=5});
    obj.edit131:setName("edit131");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout105);
    obj.label163:setAlign("left");
    obj.label163:setWidth(5);
    obj.label163:setText("");
    obj.label163:setHorzTextAlign("trailing");
    obj.label163:setMargins({right=5});
    obj.label163:setName("label163");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout100);
    obj.layout106:setAlign("top");
    obj.layout106:setHeight(20);
    obj.layout106:setMargins({bottom=2, top=15});
    obj.layout106:setName("layout106");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout106);
    obj.label164:setAlign("left");
    obj.label164:setWidth(5);
    obj.label164:setText("");
    obj.label164:setHorzTextAlign("trailing");
    obj.label164:setMargins({right=5});
    obj.label164:setName("label164");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout106);
    obj.label165:setAlign("left");
    obj.label165:setWidth(55);
    obj.label165:setText("Nome: ");
    obj.label165:setHorzTextAlign("trailing");
    obj.label165:setMargins({right=5});
    obj.label165:setName("label165");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout106);
    obj.edit132:setAlign("left");
    obj.edit132:setHorzTextAlign("leading");
    obj.edit132:setFontSize(14);
    obj.edit132:setWidth(120);
    obj.edit132:setField("ataque.nome.a6");
    obj.edit132:setMargins({right=5});
    obj.edit132:setName("edit132");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout106);
    obj.label166:setAlign("left");
    obj.label166:setWidth(55);
    obj.label166:setText("Tipo: ");
    obj.label166:setHorzTextAlign("trailing");
    obj.label166:setMargins({right=5});
    obj.label166:setName("label166");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout106);
    obj.edit133:setAlign("left");
    obj.edit133:setHorzTextAlign("leading");
    obj.edit133:setFontSize(14);
    obj.edit133:setWidth(60);
    obj.edit133:setField("ataque.tipo.a6");
    obj.edit133:setMargins({right=5});
    obj.edit133:setName("edit133");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout106);
    obj.label167:setAlign("left");
    obj.label167:setWidth(55);
    obj.label167:setText("Ataque: ");
    obj.label167:setHorzTextAlign("trailing");
    obj.label167:setMargins({right=5});
    obj.label167:setName("label167");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout106);
    obj.edit134:setAlign("left");
    obj.edit134:setHorzTextAlign("leading");
    obj.edit134:setFontSize(14);
    obj.edit134:setWidth(60);
    obj.edit134:setField("ataque.ataque.a6");
    obj.edit134:setMargins({right=5});
    obj.edit134:setName("edit134");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout106);
    obj.label168:setAlign("left");
    obj.label168:setWidth(55);
    obj.label168:setText("Alcance: ");
    obj.label168:setHorzTextAlign("trailing");
    obj.label168:setMargins({right=5});
    obj.label168:setName("label168");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout106);
    obj.edit135:setAlign("left");
    obj.edit135:setHorzTextAlign("leading");
    obj.edit135:setFontSize(14);
    obj.edit135:setWidth(60);
    obj.edit135:setField("ataque.alcance.a6");
    obj.edit135:setMargins({right=5});
    obj.edit135:setName("edit135");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout106);
    obj.label169:setAlign("left");
    obj.label169:setWidth(55);
    obj.label169:setText("Dano: ");
    obj.label169:setHorzTextAlign("trailing");
    obj.label169:setMargins({right=5});
    obj.label169:setName("label169");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout106);
    obj.edit136:setAlign("left");
    obj.edit136:setHorzTextAlign("leading");
    obj.edit136:setFontSize(14);
    obj.edit136:setWidth(60);
    obj.edit136:setField("ataque.dano.a6");
    obj.edit136:setMargins({right=5});
    obj.edit136:setName("edit136");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout106);
    obj.label170:setAlign("left");
    obj.label170:setWidth(55);
    obj.label170:setText("Munição: ");
    obj.label170:setHorzTextAlign("trailing");
    obj.label170:setMargins({right=5});
    obj.label170:setName("label170");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout106);
    obj.edit137:setAlign("left");
    obj.edit137:setHorzTextAlign("leading");
    obj.edit137:setFontSize(14);
    obj.edit137:setWidth(60);
    obj.edit137:setField("ataque.municao.a6");
    obj.edit137:setMargins({right=5});
    obj.edit137:setName("edit137");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout106);
    obj.label171:setAlign("left");
    obj.label171:setWidth(55);
    obj.label171:setText("Crítico: ");
    obj.label171:setHorzTextAlign("trailing");
    obj.label171:setMargins({right=5});
    obj.label171:setName("label171");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout106);
    obj.edit138:setAlign("left");
    obj.edit138:setHorzTextAlign("leading");
    obj.edit138:setFontSize(14);
    obj.edit138:setWidth(60);
    obj.edit138:setField("ataque.critico.a6");
    obj.edit138:setMargins({right=5});
    obj.edit138:setName("edit138");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout106);
    obj.label172:setAlign("left");
    obj.label172:setWidth(5);
    obj.label172:setText("");
    obj.label172:setHorzTextAlign("trailing");
    obj.label172:setMargins({right=5});
    obj.label172:setName("label172");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout100);
    obj.layout107:setAlign("top");
    obj.layout107:setHeight(20);
    obj.layout107:setMargins({bottom=2, top=15});
    obj.layout107:setName("layout107");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout107);
    obj.label173:setAlign("left");
    obj.label173:setWidth(5);
    obj.label173:setText("");
    obj.label173:setHorzTextAlign("trailing");
    obj.label173:setMargins({right=5});
    obj.label173:setName("label173");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout107);
    obj.label174:setAlign("left");
    obj.label174:setWidth(55);
    obj.label174:setText("Nome: ");
    obj.label174:setHorzTextAlign("trailing");
    obj.label174:setMargins({right=5});
    obj.label174:setName("label174");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout107);
    obj.edit139:setAlign("left");
    obj.edit139:setHorzTextAlign("leading");
    obj.edit139:setFontSize(14);
    obj.edit139:setWidth(120);
    obj.edit139:setField("ataque.nome.a7");
    obj.edit139:setMargins({right=5});
    obj.edit139:setName("edit139");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout107);
    obj.label175:setAlign("left");
    obj.label175:setWidth(55);
    obj.label175:setText("Tipo: ");
    obj.label175:setHorzTextAlign("trailing");
    obj.label175:setMargins({right=5});
    obj.label175:setName("label175");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout107);
    obj.edit140:setAlign("left");
    obj.edit140:setHorzTextAlign("leading");
    obj.edit140:setFontSize(14);
    obj.edit140:setWidth(60);
    obj.edit140:setField("ataque.tipo.a7");
    obj.edit140:setMargins({right=5});
    obj.edit140:setName("edit140");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout107);
    obj.label176:setAlign("left");
    obj.label176:setWidth(55);
    obj.label176:setText("Ataque: ");
    obj.label176:setHorzTextAlign("trailing");
    obj.label176:setMargins({right=5});
    obj.label176:setName("label176");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout107);
    obj.edit141:setAlign("left");
    obj.edit141:setHorzTextAlign("leading");
    obj.edit141:setFontSize(14);
    obj.edit141:setWidth(60);
    obj.edit141:setField("ataque.ataque.a7");
    obj.edit141:setMargins({right=5});
    obj.edit141:setName("edit141");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout107);
    obj.label177:setAlign("left");
    obj.label177:setWidth(55);
    obj.label177:setText("Alcance: ");
    obj.label177:setHorzTextAlign("trailing");
    obj.label177:setMargins({right=5});
    obj.label177:setName("label177");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout107);
    obj.edit142:setAlign("left");
    obj.edit142:setHorzTextAlign("leading");
    obj.edit142:setFontSize(14);
    obj.edit142:setWidth(60);
    obj.edit142:setField("ataque.alcance.a7");
    obj.edit142:setMargins({right=5});
    obj.edit142:setName("edit142");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout107);
    obj.label178:setAlign("left");
    obj.label178:setWidth(55);
    obj.label178:setText("Dano: ");
    obj.label178:setHorzTextAlign("trailing");
    obj.label178:setMargins({right=5});
    obj.label178:setName("label178");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout107);
    obj.edit143:setAlign("left");
    obj.edit143:setHorzTextAlign("leading");
    obj.edit143:setFontSize(14);
    obj.edit143:setWidth(60);
    obj.edit143:setField("ataque.dano.a7");
    obj.edit143:setMargins({right=5});
    obj.edit143:setName("edit143");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout107);
    obj.label179:setAlign("left");
    obj.label179:setWidth(55);
    obj.label179:setText("Munição: ");
    obj.label179:setHorzTextAlign("trailing");
    obj.label179:setMargins({right=5});
    obj.label179:setName("label179");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout107);
    obj.edit144:setAlign("left");
    obj.edit144:setHorzTextAlign("leading");
    obj.edit144:setFontSize(14);
    obj.edit144:setWidth(60);
    obj.edit144:setField("ataque.municao.a7");
    obj.edit144:setMargins({right=5});
    obj.edit144:setName("edit144");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout107);
    obj.label180:setAlign("left");
    obj.label180:setWidth(55);
    obj.label180:setText("Crítico: ");
    obj.label180:setHorzTextAlign("trailing");
    obj.label180:setMargins({right=5});
    obj.label180:setName("label180");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout107);
    obj.edit145:setAlign("left");
    obj.edit145:setHorzTextAlign("leading");
    obj.edit145:setFontSize(14);
    obj.edit145:setWidth(60);
    obj.edit145:setField("ataque.critico.a7");
    obj.edit145:setMargins({right=5});
    obj.edit145:setName("edit145");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout107);
    obj.label181:setAlign("left");
    obj.label181:setWidth(5);
    obj.label181:setText("");
    obj.label181:setHorzTextAlign("trailing");
    obj.label181:setMargins({right=5});
    obj.label181:setName("label181");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout100);
    obj.layout108:setAlign("top");
    obj.layout108:setHeight(20);
    obj.layout108:setMargins({bottom=2, top=15});
    obj.layout108:setName("layout108");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout108);
    obj.label182:setAlign("left");
    obj.label182:setWidth(5);
    obj.label182:setText("");
    obj.label182:setHorzTextAlign("trailing");
    obj.label182:setMargins({right=5});
    obj.label182:setName("label182");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout108);
    obj.label183:setAlign("left");
    obj.label183:setWidth(55);
    obj.label183:setText("Nome: ");
    obj.label183:setHorzTextAlign("trailing");
    obj.label183:setMargins({right=5});
    obj.label183:setName("label183");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout108);
    obj.edit146:setAlign("left");
    obj.edit146:setHorzTextAlign("leading");
    obj.edit146:setFontSize(14);
    obj.edit146:setWidth(120);
    obj.edit146:setField("ataque.nome.a8");
    obj.edit146:setMargins({right=5});
    obj.edit146:setName("edit146");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout108);
    obj.label184:setAlign("left");
    obj.label184:setWidth(55);
    obj.label184:setText("Tipo: ");
    obj.label184:setHorzTextAlign("trailing");
    obj.label184:setMargins({right=5});
    obj.label184:setName("label184");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout108);
    obj.edit147:setAlign("left");
    obj.edit147:setHorzTextAlign("leading");
    obj.edit147:setFontSize(14);
    obj.edit147:setWidth(60);
    obj.edit147:setField("ataque.tipo.a8");
    obj.edit147:setMargins({right=5});
    obj.edit147:setName("edit147");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout108);
    obj.label185:setAlign("left");
    obj.label185:setWidth(55);
    obj.label185:setText("Ataque: ");
    obj.label185:setHorzTextAlign("trailing");
    obj.label185:setMargins({right=5});
    obj.label185:setName("label185");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout108);
    obj.edit148:setAlign("left");
    obj.edit148:setHorzTextAlign("leading");
    obj.edit148:setFontSize(14);
    obj.edit148:setWidth(60);
    obj.edit148:setField("ataque.ataque.a8");
    obj.edit148:setMargins({right=5});
    obj.edit148:setName("edit148");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout108);
    obj.label186:setAlign("left");
    obj.label186:setWidth(55);
    obj.label186:setText("Alcance: ");
    obj.label186:setHorzTextAlign("trailing");
    obj.label186:setMargins({right=5});
    obj.label186:setName("label186");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout108);
    obj.edit149:setAlign("left");
    obj.edit149:setHorzTextAlign("leading");
    obj.edit149:setFontSize(14);
    obj.edit149:setWidth(60);
    obj.edit149:setField("ataque.alcance.a8");
    obj.edit149:setMargins({right=5});
    obj.edit149:setName("edit149");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout108);
    obj.label187:setAlign("left");
    obj.label187:setWidth(55);
    obj.label187:setText("Dano: ");
    obj.label187:setHorzTextAlign("trailing");
    obj.label187:setMargins({right=5});
    obj.label187:setName("label187");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout108);
    obj.edit150:setAlign("left");
    obj.edit150:setHorzTextAlign("leading");
    obj.edit150:setFontSize(14);
    obj.edit150:setWidth(60);
    obj.edit150:setField("ataque.dano.a8");
    obj.edit150:setMargins({right=5});
    obj.edit150:setName("edit150");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout108);
    obj.label188:setAlign("left");
    obj.label188:setWidth(55);
    obj.label188:setText("Munição: ");
    obj.label188:setHorzTextAlign("trailing");
    obj.label188:setMargins({right=5});
    obj.label188:setName("label188");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout108);
    obj.edit151:setAlign("left");
    obj.edit151:setHorzTextAlign("leading");
    obj.edit151:setFontSize(14);
    obj.edit151:setWidth(60);
    obj.edit151:setField("ataque.municao.a8");
    obj.edit151:setMargins({right=5});
    obj.edit151:setName("edit151");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout108);
    obj.label189:setAlign("left");
    obj.label189:setWidth(55);
    obj.label189:setText("Crítico: ");
    obj.label189:setHorzTextAlign("trailing");
    obj.label189:setMargins({right=5});
    obj.label189:setName("label189");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout108);
    obj.edit152:setAlign("left");
    obj.edit152:setHorzTextAlign("leading");
    obj.edit152:setFontSize(14);
    obj.edit152:setWidth(60);
    obj.edit152:setField("ataque.critico.a8");
    obj.edit152:setMargins({right=5});
    obj.edit152:setName("edit152");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout108);
    obj.label190:setAlign("left");
    obj.label190:setWidth(5);
    obj.label190:setText("");
    obj.label190:setHorzTextAlign("trailing");
    obj.label190:setMargins({right=5});
    obj.label190:setName("label190");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.scrollBox1);
    obj.layout109:setAlign("none");
    obj.layout109:setLeft(1002);
    obj.layout109:setHeight(332);
    obj.layout109:setWidth(332);
    obj.layout109:setTop(930);
    obj.layout109:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout109:setMargins({left=30, right=10, bottom=10});
    obj.layout109:setName("layout109");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout109);
    obj.label191:setText("Combate");
    obj.label191:setLeft(132);
    lfm_setPropAsString(obj.label191, "fontStyle",  "bold italic");
    obj.label191:setTop(9);
    obj.label191:setWidth(1343);
    obj.label191:setName("label191");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout109);
    obj.layout110:setLeft(20);
    obj.layout110:setTop(25);
    obj.layout110:setWidth(270);
    obj.layout110:setHeight(984);
    obj.layout110:setName("layout110");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout110);
    obj.layout111:setAlign("top");
    obj.layout111:setHeight(50);
    obj.layout111:setMargins({bottom=2, top=15});
    obj.layout111:setName("layout111");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout111);
    obj.label192:setAlign("left");
    obj.label192:setWidth(120);
    obj.label192:setText("Defesa Passiva:");
    obj.label192:setHorzTextAlign("trailing");
    obj.label192:setMargins({right=5});
    obj.label192:setName("label192");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout111);
    obj.edit153:setAlign("left");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setFontSize(20);
    obj.edit153:setHeight(30);
    obj.edit153:setField("bonus.dpassiva");
    obj.edit153:setName("edit153");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout110);
    obj.layout112:setAlign("top");
    obj.layout112:setHeight(50);
    obj.layout112:setMargins({bottom=2, top=15});
    obj.layout112:setName("layout112");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout112);
    obj.label193:setAlign("left");
    obj.label193:setWidth(120);
    obj.label193:setText("Esquiva:");
    obj.label193:setHorzTextAlign("trailing");
    obj.label193:setMargins({right=5});
    obj.label193:setName("label193");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout112);
    obj.edit154:setAlign("left");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setFontSize(20);
    obj.edit154:setHeight(30);
    obj.edit154:setField("bonus.esquiva");
    obj.edit154:setName("edit154");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout110);
    obj.layout113:setAlign("top");
    obj.layout113:setHeight(15);
    obj.layout113:setMargins({bottom=2, top=15});
    obj.layout113:setName("layout113");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout113);
    obj.label194:setAlign("left");
    obj.label194:setWidth(60);
    obj.label194:setText("           ");
    obj.label194:setHorzTextAlign("trailing");
    obj.label194:setMargins({right=5});
    obj.label194:setName("label194");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout113);
    obj.label195:setAlign("left");
    obj.label195:setWidth(120);
    obj.label195:setText("Resistências a Dano:");
    obj.label195:setHorzTextAlign("trailing");
    obj.label195:setMargins({right=5});
    obj.label195:setName("label195");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout110);
    obj.layout114:setAlign("top");
    obj.layout114:setHeight(150);
    obj.layout114:setMargins({bottom=2, top=15});
    obj.layout114:setName("layout114");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout114);
    obj.textEditor1:setWidth(255);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("textEditor.defesas");
    obj.textEditor1:setName("textEditor1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Antecedentes");
    obj.tab2:setName("tab2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.scrollBox2);
    obj.layout115:setAlign("none");
    obj.layout115:setHeight(35);
    obj.layout115:setWidth(1329);
    obj.layout115:setTop(15);
    obj.layout115:setLeft(5);
    obj.layout115:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout115:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout115:setName("layout115");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout115);
    obj.label196:setText("Antecedentes");
    obj.label196:setLeft(625);
    lfm_setPropAsString(obj.label196, "fontStyle",  "bold italic");
    obj.label196:setTop(9);
    obj.label196:setName("label196");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.scrollBox2);
    obj.layout116:setAlign("none");
    obj.layout116:setHeight(332);
    obj.layout116:setWidth(664);
    obj.layout116:setTop(52);
    obj.layout116:setLeft(5);
    obj.layout116:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout116:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout116:setName("layout116");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout116);
    obj.textEditor2:setLeft(20);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setWidth(624);
    obj.textEditor2:setHeight(292);
    obj.textEditor2:setField("textEditor.desPessoal");
    obj.textEditor2:setName("textEditor2");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout116);
    obj.label197:setText("Descrição Pessoal");
    obj.label197:setLeft(280);
    lfm_setPropAsString(obj.label197, "fontStyle",  "bold italic");
    obj.label197:setTop(9);
    obj.label197:setName("label197");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.scrollBox2);
    obj.layout117:setAlign("none");
    obj.layout117:setHeight(332);
    obj.layout117:setWidth(664);
    obj.layout117:setTop(52);
    obj.layout117:setLeft(669);
    obj.layout117:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout117:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout117:setName("layout117");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout117);
    obj.textEditor3:setLeft(20);
    obj.textEditor3:setTop(30);
    obj.textEditor3:setWidth(624);
    obj.textEditor3:setHeight(292);
    obj.textEditor3:setField("textEditor.caracteristicas");
    obj.textEditor3:setName("textEditor3");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout117);
    obj.label198:setText("Características");
    obj.label198:setLeft(290);
    lfm_setPropAsString(obj.label198, "fontStyle",  "bold italic");
    obj.label198:setTop(9);
    obj.label198:setName("label198");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.scrollBox2);
    obj.layout118:setAlign("none");
    obj.layout118:setHeight(332);
    obj.layout118:setWidth(664);
    obj.layout118:setTop(386);
    obj.layout118:setLeft(5);
    obj.layout118:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout118:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout118:setName("layout118");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout118);
    obj.textEditor4:setLeft(20);
    obj.textEditor4:setTop(30);
    obj.textEditor4:setWidth(624);
    obj.textEditor4:setHeight(292);
    obj.textEditor4:setField("textEditor.ideologiasC");
    obj.textEditor4:setName("textEditor4");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout118);
    obj.label199:setText("Ideologias/Crenças");
    obj.label199:setLeft(280);
    lfm_setPropAsString(obj.label199, "fontStyle",  "bold italic");
    obj.label199:setTop(9);
    obj.label199:setName("label199");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.scrollBox2);
    obj.layout119:setAlign("none");
    obj.layout119:setHeight(332);
    obj.layout119:setWidth(664);
    obj.layout119:setTop(386);
    obj.layout119:setLeft(669);
    obj.layout119:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout119:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout119:setName("layout119");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout119);
    obj.textEditor5:setLeft(20);
    obj.textEditor5:setTop(30);
    obj.textEditor5:setWidth(624);
    obj.textEditor5:setHeight(292);
    obj.textEditor5:setField("textEditor.ferimentosC");
    obj.textEditor5:setName("textEditor5");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout119);
    obj.label200:setText("Ferimentos e Cicatrizes");
    obj.label200:setLeft(280);
    obj.label200:setWidth(292);
    lfm_setPropAsString(obj.label200, "fontStyle",  "bold italic");
    obj.label200:setTop(9);
    obj.label200:setName("label200");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.scrollBox2);
    obj.layout120:setAlign("none");
    obj.layout120:setHeight(332);
    obj.layout120:setWidth(664);
    obj.layout120:setTop(720);
    obj.layout120:setLeft(5);
    obj.layout120:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout120:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout120:setName("layout120");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout120);
    obj.textEditor6:setLeft(20);
    obj.textEditor6:setTop(30);
    obj.textEditor6:setWidth(624);
    obj.textEditor6:setHeight(292);
    obj.textEditor6:setField("textEditor.pessoasS");
    obj.textEditor6:setName("textEditor6");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout120);
    obj.label201:setText("Pessosa Significativas");
    obj.label201:setLeft(280);
    obj.label201:setWidth(292);
    lfm_setPropAsString(obj.label201, "fontStyle",  "bold italic");
    obj.label201:setTop(9);
    obj.label201:setName("label201");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.scrollBox2);
    obj.layout121:setAlign("none");
    obj.layout121:setHeight(332);
    obj.layout121:setWidth(664);
    obj.layout121:setTop(720);
    obj.layout121:setLeft(669);
    obj.layout121:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout121:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout121:setName("layout121");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout121);
    obj.textEditor7:setLeft(20);
    obj.textEditor7:setTop(30);
    obj.textEditor7:setWidth(624);
    obj.textEditor7:setHeight(292);
    obj.textEditor7:setField("textEditor.fobiasM");
    obj.textEditor7:setName("textEditor7");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout121);
    obj.label202:setText("Fobias/Manias");
    obj.label202:setLeft(280);
    obj.label202:setWidth(292);
    lfm_setPropAsString(obj.label202, "fontStyle",  "bold italic");
    obj.label202:setTop(9);
    obj.label202:setName("label202");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.scrollBox2);
    obj.layout122:setAlign("none");
    obj.layout122:setHeight(332);
    obj.layout122:setWidth(664);
    obj.layout122:setTop(1053);
    obj.layout122:setLeft(5);
    obj.layout122:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout122:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout122:setName("layout122");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout122);
    obj.textEditor8:setLeft(20);
    obj.textEditor8:setTop(30);
    obj.textEditor8:setWidth(624);
    obj.textEditor8:setHeight(292);
    obj.textEditor8:setField("textEditor.habilits");
    obj.textEditor8:setName("textEditor8");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout122);
    obj.label203:setText("Casos Paranormais Investigados");
    obj.label203:setLeft(230);
    obj.label203:setWidth(292);
    lfm_setPropAsString(obj.label203, "fontStyle",  "bold italic");
    obj.label203:setTop(9);
    obj.label203:setName("label203");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox2);
    obj.layout123:setAlign("none");
    obj.layout123:setHeight(332);
    obj.layout123:setWidth(664);
    obj.layout123:setTop(1053);
    obj.layout123:setLeft(669);
    obj.layout123:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout123:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout123:setName("layout123");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout123);
    obj.textEditor9:setLeft(20);
    obj.textEditor9:setTop(30);
    obj.textEditor9:setWidth(624);
    obj.textEditor9:setHeight(292);
    obj.textEditor9:setField("textEditor.rituaCon");
    obj.textEditor9:setName("textEditor9");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout123);
    obj.label204:setText("Experiencias Paranormais");
    obj.label204:setLeft(250);
    obj.label204:setWidth(292);
    lfm_setPropAsString(obj.label204, "fontStyle",  "bold italic");
    obj.label204:setTop(9);
    obj.label204:setName("label204");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.scrollBox2);
    obj.layout124:setAlign("none");
    obj.layout124:setHeight(332);
    obj.layout124:setWidth(664);
    obj.layout124:setTop(1386);
    obj.layout124:setLeft(5);
    obj.layout124:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout124:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout124:setName("layout124");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout124);
    obj.textEditor10:setLeft(20);
    obj.textEditor10:setTop(30);
    obj.textEditor10:setWidth(624);
    obj.textEditor10:setHeight(292);
    obj.textEditor10:setField("textEditor.locaisimpw");
    obj.textEditor10:setName("textEditor10");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout124);
    obj.label205:setText("Locais Importantes");
    obj.label205:setLeft(280);
    obj.label205:setWidth(292);
    lfm_setPropAsString(obj.label205, "fontStyle",  "bold italic");
    obj.label205:setTop(9);
    obj.label205:setName("label205");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.scrollBox2);
    obj.layout125:setAlign("none");
    obj.layout125:setHeight(332);
    obj.layout125:setWidth(664);
    obj.layout125:setTop(1386);
    obj.layout125:setLeft(669);
    obj.layout125:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout125:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout125:setName("layout125");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout125);
    obj.textEditor11:setLeft(20);
    obj.textEditor11:setTop(30);
    obj.textEditor11:setWidth(624);
    obj.textEditor11:setHeight(292);
    obj.textEditor11:setField("textEditor.entidades");
    obj.textEditor11:setName("textEditor11");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout125);
    obj.label206:setText("Encontros com Criaturas Paranormais");
    obj.label206:setLeft(220);
    obj.label206:setWidth(292);
    lfm_setPropAsString(obj.label206, "fontStyle",  "bold italic");
    obj.label206:setTop(9);
    obj.label206:setName("label206");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Recursos");
    obj.tab3:setName("tab3");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.scrollBox3);
    obj.layout126:setAlign("none");
    obj.layout126:setHeight(35);
    obj.layout126:setWidth(1329);
    obj.layout126:setTop(15);
    obj.layout126:setLeft(5);
    obj.layout126:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout126:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout126:setName("layout126");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout126);
    obj.label207:setText("Equipamentos e pertences / Dinheiro e Recursos");
    obj.label207:setLeft(525);
    obj.label207:setWidth(1329);
    lfm_setPropAsString(obj.label207, "fontStyle",  "bold italic");
    obj.label207:setTop(9);
    obj.label207:setName("label207");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.scrollBox3);
    obj.layout127:setAlign("none");
    obj.layout127:setHeight(1660);
    obj.layout127:setWidth(664);
    obj.layout127:setTop(52);
    obj.layout127:setLeft(5);
    obj.layout127:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout127:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout127:setName("layout127");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout127);
    obj.label208:setText("Equipamentos e pertences");
    obj.label208:setWidth(624);
    obj.label208:setLeft(260);
    lfm_setPropAsString(obj.label208, "fontStyle",  "bold italic");
    obj.label208:setTop(9);
    obj.label208:setName("label208");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout127);
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(30);
    obj.layout128:setTop(25);
    obj.layout128:setMargins({bottom=4});
    obj.layout128:setName("layout128");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout128);
    obj.button1:setText("Adicionar Novo Item");
    obj.button1:setWidth(150);
    obj.button1:setTop(45);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout127);
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
    obj.boxDetalhesDoItem:setParent(obj.layout127);
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

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setAlign("top");
    obj.layout129:setTop(15);
    obj.layout129:setHeight(30);
    obj.layout129:setMargins({bottom=4});
    obj.layout129:setName("layout129");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout129);
    obj.label209:setAlign("left");
    obj.label209:setText("Titulo do Item:");
    obj.label209:setAutoSize(true);
    obj.label209:setName("label209");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout129);
    obj.edit155:setAlign("client");
    obj.edit155:setField("campoTitulo");
    obj.edit155:setName("edit155");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout129);
    obj.button2:setAlign("right");
    obj.button2:setText("Apagar!");
    obj.button2:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button2:setWidth(150);
    obj.button2:setName("button2");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setAlign("top");
    obj.layout130:setTop(15);
    obj.layout130:setHeight(130);
    obj.layout130:setName("layout130");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout130);
    obj.image4:setAlign("left");
    obj.image4:setEditable(true);
    obj.image4:setField("campoURLImagem");
    obj.image4:setWidth(130);
    obj.image4:setName("image4");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout130);
    obj.layout131:setAlign("client");
    obj.layout131:setMargins({left=2});
    obj.layout131:setName("layout131");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout131);
    obj.edit156:setAlign("top");
    obj.edit156:setField("campoSubTitulo");
    obj.edit156:setHeight(30);
    obj.edit156:setName("edit156");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout131);
    obj.textEditor12:setAlign("top");
    obj.textEditor12:setField("campoTextoGrande");
    obj.textEditor12:setHeight(100);
    obj.textEditor12:setName("textEditor12");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.scrollBox3);
    obj.layout132:setAlign("none");
    obj.layout132:setHeight(1660);
    obj.layout132:setWidth(664);
    obj.layout132:setTop(52);
    obj.layout132:setLeft(669);
    obj.layout132:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout132:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout132:setName("layout132");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout132);
    obj.label210:setText("Dinheiro e Recursos");
    obj.label210:setWidth(624);
    obj.label210:setLeft(270);
    lfm_setPropAsString(obj.label210, "fontStyle",  "bold italic");
    obj.label210:setTop(9);
    obj.label210:setName("label210");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout132);
    obj.layout133:setLeft(5);
    obj.layout133:setTop(25);
    obj.layout133:setWidth(664);
    obj.layout133:setHeight(1660);
    obj.layout133:setName("layout133");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout133);
    obj.layout134:setName("layout134");
    obj.layout134:setWidth(15);
    obj.layout134:setTop(25);
    obj.layout134:setHeight(25);
    obj.layout134:setAlign("top");
    obj.layout134:setMargins({left=2, right=2, top=5});

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout134);
    obj.label211:setText("     P. de Prest.:");
    obj.label211:setName("label211");
    obj.label211:setAlign("left");
    obj.label211:setHorzTextAlign("leading");
    obj.label211:setVertTextAlign("leading");
    obj.label211:setAutoSize(true);
    obj.label211:setTop(30);

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout134);
    obj.edit157:setField("dinheiro.ng");
    obj.edit157:setName("edit157");
    obj.edit157:setHeight(5);
    obj.edit157:setWidth(250);
    obj.edit157:setFontSize(15);
    obj.edit157:setAlign("left");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout133);
    obj.layout135:setName("layout135");
    obj.layout135:setWidth(15);
    obj.layout135:setTop(25);
    obj.layout135:setHeight(25);
    obj.layout135:setAlign("top");
    obj.layout135:setMargins({left=2, right=2, top=5});

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout135);
    obj.label212:setText("     Patente:");
    obj.label212:setName("label212");
    obj.label212:setAlign("left");
    obj.label212:setHorzTextAlign("leading");
    obj.label212:setVertTextAlign("leading");
    obj.label212:setAutoSize(true);
    obj.label212:setTop(30);

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout135);
    obj.edit158:setField("dinheiro.dinheiro");
    obj.edit158:setName("edit158");
    obj.edit158:setHeight(5);
    obj.edit158:setWidth(250);
    obj.edit158:setFontSize(15);
    obj.edit158:setAlign("left");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout133);
    obj.layout136:setName("layout136");
    obj.layout136:setWidth(15);
    obj.layout136:setTop(25);
    obj.layout136:setHeight(25);
    obj.layout136:setAlign("top");
    obj.layout136:setMargins({left=2, right=2, top=5});

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout136);
    obj.label213:setText("     Limite de Credito:");
    obj.label213:setName("label213");
    obj.label213:setAlign("left");
    obj.label213:setHorzTextAlign("leading");
    obj.label213:setVertTextAlign("leading");
    obj.label213:setAutoSize(true);
    obj.label213:setTop(30);

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout136);
    obj.edit159:setField("dinheiro.patrimonio");
    obj.edit159:setName("edit159");
    obj.edit159:setHeight(5);
    obj.edit159:setWidth(250);
    obj.edit159:setFontSize(15);
    obj.edit159:setAlign("left");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout132);
    obj.textEditor13:setLeft(20);
    obj.textEditor13:setTop(125);
    obj.textEditor13:setWidth(624);
    obj.textEditor13:setHeight(1521);
    obj.textEditor13:setField("textEditor.patrimonio");
    obj.textEditor13:setName("textEditor13");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Rituais e Habilidades");
    obj.tab4:setName("tab4");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab4);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.scrollBox4);
    obj.layout137:setAlign("none");
    obj.layout137:setHeight(35);
    obj.layout137:setWidth(1329);
    obj.layout137:setTop(15);
    obj.layout137:setLeft(5);
    obj.layout137:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout137:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout137:setName("layout137");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout137);
    obj.label214:setText("Rituais / Habilidades");
    obj.label214:setLeft(525);
    obj.label214:setWidth(1329);
    lfm_setPropAsString(obj.label214, "fontStyle",  "bold italic");
    obj.label214:setTop(9);
    obj.label214:setName("label214");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.scrollBox4);
    obj.layout138:setAlign("none");
    obj.layout138:setHeight(1660);
    obj.layout138:setWidth(664);
    obj.layout138:setTop(52);
    obj.layout138:setLeft(5);
    obj.layout138:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout138:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout138:setName("layout138");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout138);
    obj.label215:setText("Rituais");
    obj.label215:setWidth(624);
    obj.label215:setLeft(290);
    lfm_setPropAsString(obj.label215, "fontStyle",  "bold italic");
    obj.label215:setTop(9);
    obj.label215:setName("label215");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout138);
    obj.layout139:setAlign("top");
    obj.layout139:setHeight(30);
    obj.layout139:setTop(25);
    obj.layout139:setMargins({bottom=4});
    obj.layout139:setName("layout139");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout139);
    obj.button3:setText("Adicionar Novo Ritual");
    obj.button3:setWidth(150);
    obj.button3:setTop(45);
    obj.button3:setAlign("left");
    obj.button3:setName("button3");

    obj.rclListaDosItens2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens2:setParent(obj.layout138);
    obj.rclListaDosItens2:setName("rclListaDosItens2");
    obj.rclListaDosItens2:setField("campoDosItens2");
    obj.rclListaDosItens2:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens2:setAlign("left");
    obj.rclListaDosItens2:setSelectable(true);
    obj.rclListaDosItens2:setLayout("vertical");
    obj.rclListaDosItens2:setTop(40);
    obj.rclListaDosItens2:setHeight(80);
    obj.rclListaDosItens2:setWidth(150);

    obj.boxDetalhesDoItem2 = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem2:setParent(obj.layout138);
    obj.boxDetalhesDoItem2:setName("boxDetalhesDoItem2");
    obj.boxDetalhesDoItem2:setVisible(false);
    obj.boxDetalhesDoItem2:setAlign("client");
    obj.boxDetalhesDoItem2:setMargins({left=4, right=4, top=2});

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoItem2);
    obj.rectangle2:setAlign("none");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setHeight(180);
    obj.rectangle2:setWidth(480);
    obj.rectangle2:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle2:setName("rectangle2");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle2);
    obj.layout140:setAlign("top");
    obj.layout140:setTop(15);
    obj.layout140:setHeight(30);
    obj.layout140:setMargins({bottom=4});
    obj.layout140:setName("layout140");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout140);
    obj.label216:setAlign("left");
    obj.label216:setText("Nome do Ritual:");
    obj.label216:setAutoSize(true);
    obj.label216:setName("label216");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout140);
    obj.edit160:setAlign("client");
    obj.edit160:setField("campoTitulo");
    obj.edit160:setName("edit160");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout140);
    obj.button4:setAlign("right");
    obj.button4:setText("Apagar!");
    obj.button4:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button4:setWidth(150);
    obj.button4:setName("button4");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle2);
    obj.layout141:setAlign("top");
    obj.layout141:setTop(15);
    obj.layout141:setHeight(130);
    obj.layout141:setName("layout141");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout141);
    obj.image5:setAlign("left");
    obj.image5:setEditable(true);
    obj.image5:setField("campoURLImagem2");
    obj.image5:setWidth(130);
    obj.image5:setName("image5");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout141);
    obj.layout142:setAlign("client");
    obj.layout142:setMargins({left=2});
    obj.layout142:setName("layout142");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout142);
    obj.edit161:setAlign("top");
    obj.edit161:setField("campoSubTitulo2");
    obj.edit161:setHeight(30);
    obj.edit161:setName("edit161");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout142);
    obj.textEditor14:setAlign("top");
    obj.textEditor14:setField("campoTextoGrande2");
    obj.textEditor14:setHeight(100);
    obj.textEditor14:setName("textEditor14");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.scrollBox4);
    obj.layout143:setAlign("none");
    obj.layout143:setHeight(1660);
    obj.layout143:setWidth(664);
    obj.layout143:setTop(52);
    obj.layout143:setLeft(669);
    obj.layout143:setFrameStyle("/frames/FrameRetangular.xml");
    obj.layout143:setMargins({left=30, top=15, right=10, bottom=10});
    obj.layout143:setName("layout143");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout143);
    obj.label217:setText("Habilidades");
    obj.label217:setWidth(624);
    obj.label217:setLeft(290);
    lfm_setPropAsString(obj.label217, "fontStyle",  "bold italic");
    obj.label217:setTop(9);
    obj.label217:setName("label217");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.layout143);
    obj.layout144:setLeft(5);
    obj.layout144:setTop(25);
    obj.layout144:setWidth(664);
    obj.layout144:setHeight(1660);
    obj.layout144:setName("layout144");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout144);
    obj.layout145:setName("layout145");
    obj.layout145:setWidth(15);
    obj.layout145:setTop(25);
    obj.layout145:setHeight(25);
    obj.layout145:setAlign("top");
    obj.layout145:setMargins({left=2, right=2, top=5});

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout145);
    obj.label218:setText("     Classe:");
    obj.label218:setName("label218");
    obj.label218:setAlign("left");
    obj.label218:setHorzTextAlign("leading");
    obj.label218:setVertTextAlign("leading");
    obj.label218:setAutoSize(true);
    obj.label218:setTop(30);

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout145);
    obj.edit162:setField("identidade.classe");
    obj.edit162:setName("edit162");
    obj.edit162:setHeight(5);
    obj.edit162:setWidth(250);
    obj.edit162:setFontSize(15);
    obj.edit162:setAlign("left");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout144);
    obj.layout146:setName("layout146");
    obj.layout146:setWidth(15);
    obj.layout146:setTop(25);
    obj.layout146:setHeight(25);
    obj.layout146:setAlign("top");
    obj.layout146:setMargins({left=2, right=2, top=5});

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout146);
    obj.label219:setText("     Elemento:");
    obj.label219:setName("label219");
    obj.label219:setAlign("left");
    obj.label219:setHorzTextAlign("leading");
    obj.label219:setVertTextAlign("leading");
    obj.label219:setAutoSize(true);
    obj.label219:setTop(30);

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout146);
    obj.edit163:setField("identidade.elemento");
    obj.edit163:setName("edit163");
    obj.edit163:setHeight(5);
    obj.edit163:setWidth(250);
    obj.edit163:setFontSize(15);
    obj.edit163:setAlign("left");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout144);
    obj.layout147:setName("layout147");
    obj.layout147:setWidth(15);
    obj.layout147:setTop(25);
    obj.layout147:setHeight(25);
    obj.layout147:setAlign("top");
    obj.layout147:setMargins({left=2, right=2, top=5});

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout147);
    obj.label220:setText("     Trilha:");
    obj.label220:setName("label220");
    obj.label220:setAlign("left");
    obj.label220:setHorzTextAlign("leading");
    obj.label220:setVertTextAlign("leading");
    obj.label220:setAutoSize(true);
    obj.label220:setTop(30);

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout147);
    obj.edit164:setField("identidade.trilha");
    obj.edit164:setName("edit164");
    obj.edit164:setHeight(5);
    obj.edit164:setWidth(250);
    obj.edit164:setFontSize(15);
    obj.edit164:setAlign("left");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout143);
    obj.textEditor15:setLeft(20);
    obj.textEditor15:setTop(125);
    obj.textEditor15:setWidth(624);
    obj.textEditor15:setHeight(1521);
    obj.textEditor15:setField("textEditor.habilidades");
    obj.textEditor15:setName("textEditor15");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.tab5);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.scrollBox5);
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "black");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setField("txt");
    obj.richEdit1:setName("richEdit1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclListaDosItens:append();
        end, obj);

    obj._e_event1 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            --[[
                                    Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                              --]]                      
                              local node = self.rclListaDosItens.selectedNode; 
                                     self.boxDetalhesDoItem.node = node;                       
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            NDB.deleteNode(self.boxDetalhesDoItem.node);
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclListaDosItens2:append();
        end, obj);

    obj._e_event4 = obj.rclListaDosItens2:addEventListener("onSelect",
        function (_)
            --[[
                                    Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                              --]]                      
                              local node = self.rclListaDosItens2.selectedNode; 
                                     self.boxDetalhesDoItem2.node = node;                       
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.boxDetalhesDoItem2.visible = (node ~= nil);
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (_)
            NDB.deleteNode(self.boxDetalhesDoItem2.node);
        end, obj);

    function obj:_releaseEvents()
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
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.boxDetalhesDoItem2 ~= nil then self.boxDetalhesDoItem2:destroy(); self.boxDetalhesDoItem2 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.comboBox36 ~= nil then self.comboBox36:destroy(); self.comboBox36 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.comboBox35 ~= nil then self.comboBox35:destroy(); self.comboBox35 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.comboBox38 ~= nil then self.comboBox38:destroy(); self.comboBox38 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.comboBox39 ~= nil then self.comboBox39:destroy(); self.comboBox39 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.comboBox44 ~= nil then self.comboBox44:destroy(); self.comboBox44 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.comboBox37 ~= nil then self.comboBox37:destroy(); self.comboBox37 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rclListaDosItens2 ~= nil then self.rclListaDosItens2:destroy(); self.rclListaDosItens2 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.comboBox42 ~= nil then self.comboBox42:destroy(); self.comboBox42 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.comboBox41 ~= nil then self.comboBox41:destroy(); self.comboBox41 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.comboBox43 ~= nil then self.comboBox43:destroy(); self.comboBox43 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.comboBox40 ~= nil then self.comboBox40:destroy(); self.comboBox40 = nil; end;
        if self.comboBox34 ~= nil then self.comboBox34:destroy(); self.comboBox34 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newOrdemParanormalS_byHelldemos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_OrdemParanormalS_byHelldemos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _OrdemParanormalS_byHelldemos = {
    newEditor = newOrdemParanormalS_byHelldemos, 
    new = newOrdemParanormalS_byHelldemos, 
    name = "OrdemParanormalS_byHelldemos", 
    dataType = "OrdemParanormalS_byHelldemos", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha de Ordem Paranormal v0.55", 
    description=""};

OrdemParanormalS_byHelldemos = _OrdemParanormalS_byHelldemos;
Firecast.registrarForm(_OrdemParanormalS_byHelldemos);
Firecast.registrarDataType(_OrdemParanormalS_byHelldemos);

return _OrdemParanormalS_byHelldemos;
