require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmOP()
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
    obj:setName("frmOP");
    obj:setFormType("sheetTemplate");
    obj:setDataType("OP.v1.0.Samelfero");
    obj:setTitle("Ordem Paranormal v1.0");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.frmOP1_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmOP1_svg:setParent(obj.tab1);
    obj.frmOP1_svg:setName("frmOP1_svg");
    obj.frmOP1_svg:setAlign("client");
    obj.frmOP1_svg:setTheme("light");
    obj.frmOP1_svg:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmOP1_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(892);
    obj.rectangle1:setHeight(1214);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(892);
    obj.image1:setHeight(1214);
    obj.image1:setSRC("/OP/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setField("Personagem");
    obj.edit1:setLeft(110);
    obj.edit1:setTop(40);
    obj.edit1:setWidth(250);
    obj.edit1:setFontSize(25);
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setHeight(45);
    obj.edit1:setFontColor("black");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setField("Jogador");
    obj.edit2:setLeft(380);
    obj.edit2:setTop(40);
    obj.edit2:setWidth(125);
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);
    obj.edit2:setHeight(45);
    obj.edit2:setFontSize(20);
    obj.edit2:setFontColor("black");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setField("Origem");
    obj.edit3:setLeft(206);
    obj.edit3:setTop(528);
    obj.edit3:setWidth(310);
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setHeight(45);
    obj.edit3:setFontSize(20);
    obj.edit3:setFontColor("black");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setField("Classe");
    obj.edit4:setLeft(196);
    obj.edit4:setTop(585);
    obj.edit4:setWidth(310);
    obj.edit4:setName("edit4");
    obj.edit4:setTransparent(true);
    obj.edit4:setHeight(45);
    obj.edit4:setFontSize(20);
    obj.edit4:setFontColor("black");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setField("NEX");
    obj.edit5:setLeft(160);
    obj.edit5:setTop(645);
    obj.edit5:setWidth(50);
    obj.edit5:setFontSize(25);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);
    obj.edit5:setHeight(45);
    obj.edit5:setFontColor("black");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setField("PErodada");
    obj.edit6:setLeft(230);
    obj.edit6:setTop(645);
    obj.edit6:setWidth(65);
    obj.edit6:setFontSize(25);
    obj.edit6:setType("number");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");
    obj.edit6:setTransparent(true);
    obj.edit6:setHeight(45);
    obj.edit6:setFontColor("black");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setField("Deslc");
    obj.edit7:setLeft(380);
    obj.edit7:setTop(645);
    obj.edit7:setWidth(129);
    obj.edit7:setFontSize(25);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");
    obj.edit7:setTransparent(true);
    obj.edit7:setHeight(45);
    obj.edit7:setFontColor("black");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setField("PV");
    obj.edit8:setLeft(130);
    obj.edit8:setTop(720);
    obj.edit8:setWidth(65);
    obj.edit8:setFontSize(25);
    obj.edit8:setType("number");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");
    obj.edit8:setTransparent(true);
    obj.edit8:setHeight(45);
    obj.edit8:setFontColor("black");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setField("PE");
    obj.edit9:setLeft(330);
    obj.edit9:setTop(720);
    obj.edit9:setWidth(65);
    obj.edit9:setFontSize(25);
    obj.edit9:setType("number");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");
    obj.edit9:setTransparent(true);
    obj.edit9:setHeight(45);
    obj.edit9:setFontColor("black");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setField("SAN");
    obj.edit10:setLeft(375);
    obj.edit10:setTop(830);
    obj.edit10:setWidth(75);
    obj.edit10:setFontSize(25);
    obj.edit10:setType("number");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");
    obj.edit10:setTransparent(true);
    obj.edit10:setHeight(45);
    obj.edit10:setFontColor("black");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setField("PVt");
    obj.edit11:setLeft(150);
    obj.edit11:setTop(755);
    obj.edit11:setWidth(129);
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setName("edit11");
    obj.edit11:setTransparent(true);
    obj.edit11:setHeight(45);
    obj.edit11:setFontSize(20);
    obj.edit11:setFontColor("black");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setField("PEt");
    obj.edit12:setLeft(350);
    obj.edit12:setTop(755);
    obj.edit12:setWidth(129);
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setName("edit12");
    obj.edit12:setTransparent(true);
    obj.edit12:setHeight(45);
    obj.edit12:setFontSize(20);
    obj.edit12:setFontColor("black");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle1);
    obj.edit13:setField("SANt");
    obj.edit13:setLeft(395);
    obj.edit13:setTop(870);
    obj.edit13:setWidth(129);
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setName("edit13");
    obj.edit13:setTransparent(true);
    obj.edit13:setHeight(45);
    obj.edit13:setFontSize(20);
    obj.edit13:setFontColor("black");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle1);
    obj.edit14:setField("Def");
    obj.edit14:setLeft(130);
    obj.edit14:setTop(840);
    obj.edit14:setWidth(60);
    obj.edit14:setFontSize(25);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setReadOnly(true);
    obj.edit14:setName("edit14");
    obj.edit14:setTransparent(true);
    obj.edit14:setHeight(45);
    obj.edit14:setFontColor("black");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle1);
    obj.edit15:setField("DefEq");
    obj.edit15:setLeft(272);
    obj.edit15:setTop(855);
    obj.edit15:setWidth(30);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setTransparent(true);
    obj.edit15:setHeight(45);
    obj.edit15:setFontSize(20);
    obj.edit15:setFontColor("black");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle1);
    obj.edit16:setField("DefOt");
    obj.edit16:setLeft(311);
    obj.edit16:setTop(855);
    obj.edit16:setWidth(30);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");
    obj.edit16:setTransparent(true);
    obj.edit16:setHeight(45);
    obj.edit16:setFontSize(20);
    obj.edit16:setFontColor("black");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle1);
    obj.edit17:setField("Protecoes");
    obj.edit17:setLeft(180);
    obj.edit17:setTop(905);
    obj.edit17:setWidth(330);
    obj.edit17:setFontSize(16);
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setHint("Equipamentos que adicionam defesa. Ex: Casaco de Couro +2 Def.");
    obj.edit17:setName("edit17");
    obj.edit17:setTransparent(true);
    obj.edit17:setHeight(45);
    obj.edit17:setFontColor("black");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle1);
    obj.edit18:setField("Resistencias");
    obj.edit18:setLeft(200);
    obj.edit18:setTop(930);
    obj.edit18:setWidth(315);
    obj.edit18:setFontSize(16);
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setName("edit18");
    obj.edit18:setTransparent(true);
    obj.edit18:setHeight(45);
    obj.edit18:setFontColor("black");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setFields({'Def', 'DefEq', 'DefOt'});
    obj.dataLink1:setName("dataLink1");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle1);
    obj.edit19:setField("ATK1");
    obj.edit19:setLeft(105);
    obj.edit19:setTop(1015);
    obj.edit19:setWidth(260);
    obj.edit19:setName("edit19");
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(16);
    obj.edit19:setFontColor("black");
    obj.edit19:setHorzTextAlign("leading");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle1);
    obj.edit20:setField("TesteATK1");
    obj.edit20:setLeft(378);
    obj.edit20:setTop(1015);
    obj.edit20:setWidth(100);
    obj.edit20:setName("edit20");
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(16);
    obj.edit20:setFontColor("black");
    obj.edit20:setHorzTextAlign("leading");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle1);
    obj.edit21:setField("DanoATK1");
    obj.edit21:setLeft(482);
    obj.edit21:setTop(1015);
    obj.edit21:setWidth(100);
    obj.edit21:setName("edit21");
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(16);
    obj.edit21:setFontColor("black");
    obj.edit21:setHorzTextAlign("leading");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle1);
    obj.edit22:setField("CriticoATK1");
    obj.edit22:setLeft(590);
    obj.edit22:setTop(1015);
    obj.edit22:setWidth(100);
    obj.edit22:setName("edit22");
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(16);
    obj.edit22:setFontColor("black");
    obj.edit22:setHorzTextAlign("leading");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setField("AlcanceATK1");
    obj.comboBox1:setLeft(700);
    obj.comboBox1:setTop(1020);
    obj.comboBox1:setWidth(80);
    obj.comboBox1:setItems({'CaC', 'Curta', 'Médio', 'Longo', 'Extremo'});
    obj.comboBox1:setHint("9m(6q), 18m(12q), 36m(24q), 90m(60q)");
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontSize(16);
    obj.comboBox1:setFontColor("black");
    obj.comboBox1:setHorzTextAlign("leading");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle1);
    obj.edit23:setField("EspecialATK1");
    obj.edit23:setLeft(790);
    obj.edit23:setTop(1015);
    obj.edit23:setWidth(100);
    obj.edit23:setName("edit23");
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(16);
    obj.edit23:setFontColor("black");
    obj.edit23:setHorzTextAlign("leading");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle1);
    obj.edit24:setField("ATK2");
    obj.edit24:setLeft(105);
    obj.edit24:setTop(1040);
    obj.edit24:setWidth(260);
    obj.edit24:setName("edit24");
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(16);
    obj.edit24:setFontColor("black");
    obj.edit24:setHorzTextAlign("leading");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle1);
    obj.edit25:setField("TesteATK2");
    obj.edit25:setLeft(378);
    obj.edit25:setTop(1040);
    obj.edit25:setWidth(100);
    obj.edit25:setName("edit25");
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(16);
    obj.edit25:setFontColor("black");
    obj.edit25:setHorzTextAlign("leading");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle1);
    obj.edit26:setField("DanoATK2");
    obj.edit26:setLeft(482);
    obj.edit26:setTop(1040);
    obj.edit26:setWidth(100);
    obj.edit26:setName("edit26");
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(16);
    obj.edit26:setFontColor("black");
    obj.edit26:setHorzTextAlign("leading");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle1);
    obj.edit27:setField("CriticoATK2");
    obj.edit27:setLeft(590);
    obj.edit27:setTop(1040);
    obj.edit27:setWidth(100);
    obj.edit27:setName("edit27");
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(16);
    obj.edit27:setFontColor("black");
    obj.edit27:setHorzTextAlign("leading");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle1);
    obj.comboBox2:setField("AlcanceATK2");
    obj.comboBox2:setLeft(700);
    obj.comboBox2:setTop(1045);
    obj.comboBox2:setWidth(80);
    obj.comboBox2:setItems({'CaC', 'Curta', 'Médio', 'Longo', 'Extremo'});
    obj.comboBox2:setHint("9m(6q), 18m(12q), 36m(24q), 90m(60q)");
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setFontSize(16);
    obj.comboBox2:setFontColor("black");
    obj.comboBox2:setHorzTextAlign("leading");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle1);
    obj.edit28:setField("EspecialATK2");
    obj.edit28:setLeft(790);
    obj.edit28:setTop(1040);
    obj.edit28:setWidth(100);
    obj.edit28:setName("edit28");
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(16);
    obj.edit28:setFontColor("black");
    obj.edit28:setHorzTextAlign("leading");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle1);
    obj.edit29:setField("ATK3");
    obj.edit29:setLeft(105);
    obj.edit29:setTop(1065);
    obj.edit29:setWidth(260);
    obj.edit29:setName("edit29");
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(16);
    obj.edit29:setFontColor("black");
    obj.edit29:setHorzTextAlign("leading");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle1);
    obj.edit30:setField("TesteATK3");
    obj.edit30:setLeft(378);
    obj.edit30:setTop(1065);
    obj.edit30:setWidth(100);
    obj.edit30:setName("edit30");
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(16);
    obj.edit30:setFontColor("black");
    obj.edit30:setHorzTextAlign("leading");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle1);
    obj.edit31:setField("DanoATK3");
    obj.edit31:setLeft(482);
    obj.edit31:setTop(1065);
    obj.edit31:setWidth(100);
    obj.edit31:setName("edit31");
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(16);
    obj.edit31:setFontColor("black");
    obj.edit31:setHorzTextAlign("leading");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle1);
    obj.edit32:setField("CriticoATK3");
    obj.edit32:setLeft(590);
    obj.edit32:setTop(1065);
    obj.edit32:setWidth(100);
    obj.edit32:setName("edit32");
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(16);
    obj.edit32:setFontColor("black");
    obj.edit32:setHorzTextAlign("leading");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle1);
    obj.comboBox3:setField("AlcanceATK3");
    obj.comboBox3:setLeft(700);
    obj.comboBox3:setTop(1070);
    obj.comboBox3:setWidth(80);
    obj.comboBox3:setItems({'CaC', 'Curta', 'Médio', 'Longo', 'Extremo'});
    obj.comboBox3:setHint("9m(6q), 18m(12q), 36m(24q), 90m(60q)");
    obj.comboBox3:setName("comboBox3");
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setFontSize(16);
    obj.comboBox3:setFontColor("black");
    obj.comboBox3:setHorzTextAlign("leading");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle1);
    obj.edit33:setField("EspecialATK3");
    obj.edit33:setLeft(790);
    obj.edit33:setTop(1065);
    obj.edit33:setWidth(100);
    obj.edit33:setName("edit33");
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(16);
    obj.edit33:setFontColor("black");
    obj.edit33:setHorzTextAlign("leading");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle1);
    obj.edit34:setField("ATK4");
    obj.edit34:setLeft(105);
    obj.edit34:setTop(1090);
    obj.edit34:setWidth(260);
    obj.edit34:setName("edit34");
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(16);
    obj.edit34:setFontColor("black");
    obj.edit34:setHorzTextAlign("leading");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle1);
    obj.edit35:setField("TesteATK4");
    obj.edit35:setLeft(378);
    obj.edit35:setTop(1090);
    obj.edit35:setWidth(100);
    obj.edit35:setName("edit35");
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(16);
    obj.edit35:setFontColor("black");
    obj.edit35:setHorzTextAlign("leading");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle1);
    obj.edit36:setField("DanoATK4");
    obj.edit36:setLeft(482);
    obj.edit36:setTop(1090);
    obj.edit36:setWidth(100);
    obj.edit36:setName("edit36");
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(16);
    obj.edit36:setFontColor("black");
    obj.edit36:setHorzTextAlign("leading");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle1);
    obj.edit37:setField("CriticoATK4");
    obj.edit37:setLeft(590);
    obj.edit37:setTop(1090);
    obj.edit37:setWidth(100);
    obj.edit37:setName("edit37");
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(16);
    obj.edit37:setFontColor("black");
    obj.edit37:setHorzTextAlign("leading");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle1);
    obj.comboBox4:setField("AlcanceATK4");
    obj.comboBox4:setLeft(700);
    obj.comboBox4:setTop(1095);
    obj.comboBox4:setWidth(80);
    obj.comboBox4:setItems({'CaC', 'Curta', 'Médio', 'Longo', 'Extremo'});
    obj.comboBox4:setHint("9m(6q), 18m(12q), 36m(24q), 90m(60q)");
    obj.comboBox4:setName("comboBox4");
    obj.comboBox4:setTransparent(true);
    obj.comboBox4:setFontSize(16);
    obj.comboBox4:setFontColor("black");
    obj.comboBox4:setHorzTextAlign("leading");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle1);
    obj.edit38:setField("EspecialATK4");
    obj.edit38:setLeft(790);
    obj.edit38:setTop(1090);
    obj.edit38:setWidth(100);
    obj.edit38:setName("edit38");
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(16);
    obj.edit38:setFontColor("black");
    obj.edit38:setHorzTextAlign("leading");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle1);
    obj.edit39:setField("ATK5");
    obj.edit39:setLeft(105);
    obj.edit39:setTop(1115);
    obj.edit39:setWidth(260);
    obj.edit39:setName("edit39");
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(16);
    obj.edit39:setFontColor("black");
    obj.edit39:setHorzTextAlign("leading");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle1);
    obj.edit40:setField("TesteATK5");
    obj.edit40:setLeft(378);
    obj.edit40:setTop(1115);
    obj.edit40:setWidth(100);
    obj.edit40:setName("edit40");
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(16);
    obj.edit40:setFontColor("black");
    obj.edit40:setHorzTextAlign("leading");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle1);
    obj.edit41:setField("DanoATK5");
    obj.edit41:setLeft(482);
    obj.edit41:setTop(1115);
    obj.edit41:setWidth(100);
    obj.edit41:setName("edit41");
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(16);
    obj.edit41:setFontColor("black");
    obj.edit41:setHorzTextAlign("leading");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle1);
    obj.edit42:setField("CriticoATK5");
    obj.edit42:setLeft(590);
    obj.edit42:setTop(1115);
    obj.edit42:setWidth(100);
    obj.edit42:setName("edit42");
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(16);
    obj.edit42:setFontColor("black");
    obj.edit42:setHorzTextAlign("leading");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle1);
    obj.comboBox5:setField("AlcanceATK5");
    obj.comboBox5:setLeft(700);
    obj.comboBox5:setTop(1120);
    obj.comboBox5:setWidth(80);
    obj.comboBox5:setItems({'CaC', 'Curta', 'Médio', 'Longo', 'Extremo'});
    obj.comboBox5:setHint("9m(6q), 18m(12q), 36m(24q), 90m(60q)");
    obj.comboBox5:setName("comboBox5");
    obj.comboBox5:setTransparent(true);
    obj.comboBox5:setFontSize(16);
    obj.comboBox5:setFontColor("black");
    obj.comboBox5:setHorzTextAlign("leading");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle1);
    obj.edit43:setField("EspecialATK5");
    obj.edit43:setLeft(790);
    obj.edit43:setTop(1115);
    obj.edit43:setWidth(100);
    obj.edit43:setName("edit43");
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(16);
    obj.edit43:setFontColor("black");
    obj.edit43:setHorzTextAlign("leading");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle1);
    obj.edit44:setField("INT");
    obj.edit44:setLeft(388);
    obj.edit44:setTop(240);
    obj.edit44:setName("edit44");
    obj.edit44:setTransparent(true);
    obj.edit44:setWidth(100);
    obj.edit44:setHeight(50);
    obj.edit44:setFontSize(40);
    obj.edit44:setFontColor("black");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setType("number");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle1);
    obj.edit45:setLeft(415);
    obj.edit45:setTop(300);
    obj.edit45:setWidth(50);
    obj.edit45:setTransparent(true);
    obj.edit45:setReadOnly(true);
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle1);
    obj.edit46:setField("FOR");
    obj.edit46:setLeft(141);
    obj.edit46:setTop(240);
    obj.edit46:setName("edit46");
    obj.edit46:setTransparent(true);
    obj.edit46:setWidth(100);
    obj.edit46:setHeight(50);
    obj.edit46:setFontSize(40);
    obj.edit46:setFontColor("black");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setType("number");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle1);
    obj.edit47:setLeft(165);
    obj.edit47:setTop(300);
    obj.edit47:setWidth(50);
    obj.edit47:setTransparent(true);
    obj.edit47:setReadOnly(true);
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle1);
    obj.edit48:setField("AGI");
    obj.edit48:setLeft(264);
    obj.edit48:setTop(150);
    obj.edit48:setName("edit48");
    obj.edit48:setTransparent(true);
    obj.edit48:setWidth(100);
    obj.edit48:setHeight(50);
    obj.edit48:setFontSize(40);
    obj.edit48:setFontColor("black");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setType("number");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.rectangle1);
    obj.edit49:setLeft(290);
    obj.edit49:setTop(210);
    obj.edit49:setWidth(50);
    obj.edit49:setTransparent(true);
    obj.edit49:setReadOnly(true);
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.rectangle1);
    obj.edit50:setField("PRE");
    obj.edit50:setLeft(176);
    obj.edit50:setTop(390);
    obj.edit50:setName("edit50");
    obj.edit50:setTransparent(true);
    obj.edit50:setWidth(100);
    obj.edit50:setHeight(50);
    obj.edit50:setFontSize(40);
    obj.edit50:setFontColor("black");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setType("number");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.rectangle1);
    obj.edit51:setLeft(200);
    obj.edit51:setTop(450);
    obj.edit51:setWidth(50);
    obj.edit51:setTransparent(true);
    obj.edit51:setReadOnly(true);
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.rectangle1);
    obj.edit52:setField("VIG");
    obj.edit52:setLeft(352);
    obj.edit52:setTop(390);
    obj.edit52:setName("edit52");
    obj.edit52:setTransparent(true);
    obj.edit52:setWidth(100);
    obj.edit52:setHeight(50);
    obj.edit52:setFontSize(40);
    obj.edit52:setFontColor("black");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setType("number");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.rectangle1);
    obj.edit53:setLeft(380);
    obj.edit53:setTop(450);
    obj.edit53:setWidth(50);
    obj.edit53:setTransparent(true);
    obj.edit53:setReadOnly(true);
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.rectangle1);
    obj.edit54:setField("AcrobaciaB");
    obj.edit54:setLeft(742);
    obj.edit54:setTop(230);
    obj.edit54:setName("edit54");
    obj.edit54:setTransparent(true);
    obj.edit54:setWidth(30);
    obj.edit54:setFontSize(16);
    obj.edit54:setFontColor("black");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setType("number");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.rectangle1);
    obj.edit55:setField("AcrobaciaT");
    obj.edit55:setLeft(785);
    obj.edit55:setTop(230);
    obj.edit55:setName("edit55");
    obj.edit55:setTransparent(true);
    obj.edit55:setWidth(30);
    obj.edit55:setFontSize(16);
    obj.edit55:setFontColor("black");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setType("number");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.rectangle1);
    obj.edit56:setField("AcrobaciaO");
    obj.edit56:setLeft(827);
    obj.edit56:setTop(230);
    obj.edit56:setName("edit56");
    obj.edit56:setTransparent(true);
    obj.edit56:setWidth(30);
    obj.edit56:setFontSize(16);
    obj.edit56:setFontColor("black");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setType("number");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.rectangle1);
    obj.edit57:setLeft(550);
    obj.edit57:setTop(230);
    obj.edit57:setWidth(60);
    obj.edit57:setHeight(20);
    obj.edit57:setTransparent(true);
    obj.edit57:setReadOnly(true);
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.rectangle1);
    obj.edit58:setField("AdestramentoB");
    obj.edit58:setLeft(742);
    obj.edit58:setTop(258);
    obj.edit58:setName("edit58");
    obj.edit58:setTransparent(true);
    obj.edit58:setWidth(30);
    obj.edit58:setFontSize(16);
    obj.edit58:setFontColor("black");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setType("number");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.rectangle1);
    obj.edit59:setField("AdestramentoT");
    obj.edit59:setLeft(785);
    obj.edit59:setTop(258);
    obj.edit59:setName("edit59");
    obj.edit59:setTransparent(true);
    obj.edit59:setWidth(30);
    obj.edit59:setFontSize(16);
    obj.edit59:setFontColor("black");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setType("number");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.rectangle1);
    obj.edit60:setField("AdestramentoO");
    obj.edit60:setLeft(827);
    obj.edit60:setTop(258);
    obj.edit60:setName("edit60");
    obj.edit60:setTransparent(true);
    obj.edit60:setWidth(30);
    obj.edit60:setFontSize(16);
    obj.edit60:setFontColor("black");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setType("number");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.rectangle1);
    obj.edit61:setLeft(550);
    obj.edit61:setTop(258);
    obj.edit61:setWidth(60);
    obj.edit61:setHeight(20);
    obj.edit61:setTransparent(true);
    obj.edit61:setReadOnly(true);
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.rectangle1);
    obj.edit62:setField("ArtesB");
    obj.edit62:setLeft(742);
    obj.edit62:setTop(284);
    obj.edit62:setName("edit62");
    obj.edit62:setTransparent(true);
    obj.edit62:setWidth(30);
    obj.edit62:setFontSize(16);
    obj.edit62:setFontColor("black");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setType("number");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.rectangle1);
    obj.edit63:setField("ArtesT");
    obj.edit63:setLeft(785);
    obj.edit63:setTop(284);
    obj.edit63:setName("edit63");
    obj.edit63:setTransparent(true);
    obj.edit63:setWidth(30);
    obj.edit63:setFontSize(16);
    obj.edit63:setFontColor("black");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setType("number");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.rectangle1);
    obj.edit64:setField("ArtesO");
    obj.edit64:setLeft(827);
    obj.edit64:setTop(284);
    obj.edit64:setName("edit64");
    obj.edit64:setTransparent(true);
    obj.edit64:setWidth(30);
    obj.edit64:setFontSize(16);
    obj.edit64:setFontColor("black");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setType("number");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.rectangle1);
    obj.edit65:setLeft(550);
    obj.edit65:setTop(284);
    obj.edit65:setWidth(60);
    obj.edit65:setHeight(20);
    obj.edit65:setTransparent(true);
    obj.edit65:setReadOnly(true);
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.rectangle1);
    obj.edit66:setField("AtletismoB");
    obj.edit66:setLeft(742);
    obj.edit66:setTop(308);
    obj.edit66:setName("edit66");
    obj.edit66:setTransparent(true);
    obj.edit66:setWidth(30);
    obj.edit66:setFontSize(16);
    obj.edit66:setFontColor("black");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setType("number");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.rectangle1);
    obj.edit67:setField("AtletismoT");
    obj.edit67:setLeft(785);
    obj.edit67:setTop(308);
    obj.edit67:setName("edit67");
    obj.edit67:setTransparent(true);
    obj.edit67:setWidth(30);
    obj.edit67:setFontSize(16);
    obj.edit67:setFontColor("black");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setType("number");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.rectangle1);
    obj.edit68:setField("AtletismoO");
    obj.edit68:setLeft(827);
    obj.edit68:setTop(308);
    obj.edit68:setName("edit68");
    obj.edit68:setTransparent(true);
    obj.edit68:setWidth(30);
    obj.edit68:setFontSize(16);
    obj.edit68:setFontColor("black");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setType("number");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.rectangle1);
    obj.edit69:setLeft(550);
    obj.edit69:setTop(308);
    obj.edit69:setWidth(60);
    obj.edit69:setHeight(20);
    obj.edit69:setTransparent(true);
    obj.edit69:setReadOnly(true);
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.rectangle1);
    obj.edit70:setField("AtualidadesB");
    obj.edit70:setLeft(742);
    obj.edit70:setTop(330);
    obj.edit70:setName("edit70");
    obj.edit70:setTransparent(true);
    obj.edit70:setWidth(30);
    obj.edit70:setFontSize(16);
    obj.edit70:setFontColor("black");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setType("number");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.rectangle1);
    obj.edit71:setField("AtualidadesT");
    obj.edit71:setLeft(785);
    obj.edit71:setTop(330);
    obj.edit71:setName("edit71");
    obj.edit71:setTransparent(true);
    obj.edit71:setWidth(30);
    obj.edit71:setFontSize(16);
    obj.edit71:setFontColor("black");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setType("number");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.rectangle1);
    obj.edit72:setField("AtualidadesO");
    obj.edit72:setLeft(827);
    obj.edit72:setTop(330);
    obj.edit72:setName("edit72");
    obj.edit72:setTransparent(true);
    obj.edit72:setWidth(30);
    obj.edit72:setFontSize(16);
    obj.edit72:setFontColor("black");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setType("number");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.rectangle1);
    obj.edit73:setLeft(550);
    obj.edit73:setTop(330);
    obj.edit73:setWidth(60);
    obj.edit73:setHeight(20);
    obj.edit73:setTransparent(true);
    obj.edit73:setReadOnly(true);
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.rectangle1);
    obj.edit74:setField("CienciaisB");
    obj.edit74:setLeft(742);
    obj.edit74:setTop(356);
    obj.edit74:setName("edit74");
    obj.edit74:setTransparent(true);
    obj.edit74:setWidth(30);
    obj.edit74:setFontSize(16);
    obj.edit74:setFontColor("black");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setType("number");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.rectangle1);
    obj.edit75:setField("CienciaisT");
    obj.edit75:setLeft(785);
    obj.edit75:setTop(356);
    obj.edit75:setName("edit75");
    obj.edit75:setTransparent(true);
    obj.edit75:setWidth(30);
    obj.edit75:setFontSize(16);
    obj.edit75:setFontColor("black");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setType("number");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.rectangle1);
    obj.edit76:setField("CienciaisO");
    obj.edit76:setLeft(827);
    obj.edit76:setTop(356);
    obj.edit76:setName("edit76");
    obj.edit76:setTransparent(true);
    obj.edit76:setWidth(30);
    obj.edit76:setFontSize(16);
    obj.edit76:setFontColor("black");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setType("number");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.rectangle1);
    obj.edit77:setLeft(550);
    obj.edit77:setTop(356);
    obj.edit77:setWidth(60);
    obj.edit77:setHeight(20);
    obj.edit77:setTransparent(true);
    obj.edit77:setReadOnly(true);
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.rectangle1);
    obj.edit78:setField("CrimeB");
    obj.edit78:setLeft(742);
    obj.edit78:setTop(382);
    obj.edit78:setName("edit78");
    obj.edit78:setTransparent(true);
    obj.edit78:setWidth(30);
    obj.edit78:setFontSize(16);
    obj.edit78:setFontColor("black");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setType("number");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.rectangle1);
    obj.edit79:setField("CrimeT");
    obj.edit79:setLeft(785);
    obj.edit79:setTop(382);
    obj.edit79:setName("edit79");
    obj.edit79:setTransparent(true);
    obj.edit79:setWidth(30);
    obj.edit79:setFontSize(16);
    obj.edit79:setFontColor("black");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setType("number");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.rectangle1);
    obj.edit80:setField("CrimeO");
    obj.edit80:setLeft(827);
    obj.edit80:setTop(382);
    obj.edit80:setName("edit80");
    obj.edit80:setTransparent(true);
    obj.edit80:setWidth(30);
    obj.edit80:setFontSize(16);
    obj.edit80:setFontColor("black");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setType("number");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.rectangle1);
    obj.edit81:setLeft(550);
    obj.edit81:setTop(382);
    obj.edit81:setWidth(60);
    obj.edit81:setHeight(20);
    obj.edit81:setTransparent(true);
    obj.edit81:setReadOnly(true);
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.rectangle1);
    obj.edit82:setField("DiplomaciaB");
    obj.edit82:setLeft(742);
    obj.edit82:setTop(408);
    obj.edit82:setName("edit82");
    obj.edit82:setTransparent(true);
    obj.edit82:setWidth(30);
    obj.edit82:setFontSize(16);
    obj.edit82:setFontColor("black");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setType("number");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.rectangle1);
    obj.edit83:setField("DiplomaciaT");
    obj.edit83:setLeft(785);
    obj.edit83:setTop(408);
    obj.edit83:setName("edit83");
    obj.edit83:setTransparent(true);
    obj.edit83:setWidth(30);
    obj.edit83:setFontSize(16);
    obj.edit83:setFontColor("black");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setType("number");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.rectangle1);
    obj.edit84:setField("DiplomaciaO");
    obj.edit84:setLeft(827);
    obj.edit84:setTop(408);
    obj.edit84:setName("edit84");
    obj.edit84:setTransparent(true);
    obj.edit84:setWidth(30);
    obj.edit84:setFontSize(16);
    obj.edit84:setFontColor("black");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setType("number");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.rectangle1);
    obj.edit85:setLeft(550);
    obj.edit85:setTop(408);
    obj.edit85:setWidth(60);
    obj.edit85:setHeight(20);
    obj.edit85:setTransparent(true);
    obj.edit85:setReadOnly(true);
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.rectangle1);
    obj.edit86:setField("EnganacaoB");
    obj.edit86:setLeft(742);
    obj.edit86:setTop(434);
    obj.edit86:setName("edit86");
    obj.edit86:setTransparent(true);
    obj.edit86:setWidth(30);
    obj.edit86:setFontSize(16);
    obj.edit86:setFontColor("black");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setType("number");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.rectangle1);
    obj.edit87:setField("EnganacaoT");
    obj.edit87:setLeft(785);
    obj.edit87:setTop(434);
    obj.edit87:setName("edit87");
    obj.edit87:setTransparent(true);
    obj.edit87:setWidth(30);
    obj.edit87:setFontSize(16);
    obj.edit87:setFontColor("black");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setType("number");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.rectangle1);
    obj.edit88:setField("EnganacaoO");
    obj.edit88:setLeft(827);
    obj.edit88:setTop(434);
    obj.edit88:setName("edit88");
    obj.edit88:setTransparent(true);
    obj.edit88:setWidth(30);
    obj.edit88:setFontSize(16);
    obj.edit88:setFontColor("black");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setType("number");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.rectangle1);
    obj.edit89:setLeft(550);
    obj.edit89:setTop(434);
    obj.edit89:setWidth(60);
    obj.edit89:setHeight(20);
    obj.edit89:setTransparent(true);
    obj.edit89:setReadOnly(true);
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.rectangle1);
    obj.edit90:setField("FortitudeB");
    obj.edit90:setLeft(742);
    obj.edit90:setTop(460);
    obj.edit90:setName("edit90");
    obj.edit90:setTransparent(true);
    obj.edit90:setWidth(30);
    obj.edit90:setFontSize(16);
    obj.edit90:setFontColor("black");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setType("number");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.rectangle1);
    obj.edit91:setField("FortitudeT");
    obj.edit91:setLeft(785);
    obj.edit91:setTop(460);
    obj.edit91:setName("edit91");
    obj.edit91:setTransparent(true);
    obj.edit91:setWidth(30);
    obj.edit91:setFontSize(16);
    obj.edit91:setFontColor("black");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setType("number");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.rectangle1);
    obj.edit92:setField("FortitudeO");
    obj.edit92:setLeft(827);
    obj.edit92:setTop(460);
    obj.edit92:setName("edit92");
    obj.edit92:setTransparent(true);
    obj.edit92:setWidth(30);
    obj.edit92:setFontSize(16);
    obj.edit92:setFontColor("black");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setType("number");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.rectangle1);
    obj.edit93:setLeft(550);
    obj.edit93:setTop(460);
    obj.edit93:setWidth(60);
    obj.edit93:setHeight(20);
    obj.edit93:setTransparent(true);
    obj.edit93:setReadOnly(true);
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.rectangle1);
    obj.edit94:setField("FurtividadeB");
    obj.edit94:setLeft(742);
    obj.edit94:setTop(486);
    obj.edit94:setName("edit94");
    obj.edit94:setTransparent(true);
    obj.edit94:setWidth(30);
    obj.edit94:setFontSize(16);
    obj.edit94:setFontColor("black");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setType("number");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.rectangle1);
    obj.edit95:setField("FurtividadeT");
    obj.edit95:setLeft(785);
    obj.edit95:setTop(486);
    obj.edit95:setName("edit95");
    obj.edit95:setTransparent(true);
    obj.edit95:setWidth(30);
    obj.edit95:setFontSize(16);
    obj.edit95:setFontColor("black");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setType("number");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.rectangle1);
    obj.edit96:setField("FurtividadeO");
    obj.edit96:setLeft(827);
    obj.edit96:setTop(486);
    obj.edit96:setName("edit96");
    obj.edit96:setTransparent(true);
    obj.edit96:setWidth(30);
    obj.edit96:setFontSize(16);
    obj.edit96:setFontColor("black");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setType("number");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.rectangle1);
    obj.edit97:setLeft(550);
    obj.edit97:setTop(486);
    obj.edit97:setWidth(60);
    obj.edit97:setHeight(20);
    obj.edit97:setTransparent(true);
    obj.edit97:setReadOnly(true);
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.rectangle1);
    obj.edit98:setField("IniciativaB");
    obj.edit98:setLeft(742);
    obj.edit98:setTop(512);
    obj.edit98:setName("edit98");
    obj.edit98:setTransparent(true);
    obj.edit98:setWidth(30);
    obj.edit98:setFontSize(16);
    obj.edit98:setFontColor("black");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setType("number");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.rectangle1);
    obj.edit99:setField("IniciativaT");
    obj.edit99:setLeft(785);
    obj.edit99:setTop(512);
    obj.edit99:setName("edit99");
    obj.edit99:setTransparent(true);
    obj.edit99:setWidth(30);
    obj.edit99:setFontSize(16);
    obj.edit99:setFontColor("black");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setType("number");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.rectangle1);
    obj.edit100:setField("IniciativaO");
    obj.edit100:setLeft(827);
    obj.edit100:setTop(512);
    obj.edit100:setName("edit100");
    obj.edit100:setTransparent(true);
    obj.edit100:setWidth(30);
    obj.edit100:setFontSize(16);
    obj.edit100:setFontColor("black");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setType("number");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.rectangle1);
    obj.edit101:setLeft(550);
    obj.edit101:setTop(512);
    obj.edit101:setWidth(60);
    obj.edit101:setHeight(20);
    obj.edit101:setTransparent(true);
    obj.edit101:setReadOnly(true);
    obj.edit101:setName("edit101");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.rectangle1);
    obj.edit102:setField("IntimidacaoB");
    obj.edit102:setLeft(742);
    obj.edit102:setTop(538);
    obj.edit102:setName("edit102");
    obj.edit102:setTransparent(true);
    obj.edit102:setWidth(30);
    obj.edit102:setFontSize(16);
    obj.edit102:setFontColor("black");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setType("number");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.rectangle1);
    obj.edit103:setField("IntimidacaoT");
    obj.edit103:setLeft(785);
    obj.edit103:setTop(538);
    obj.edit103:setName("edit103");
    obj.edit103:setTransparent(true);
    obj.edit103:setWidth(30);
    obj.edit103:setFontSize(16);
    obj.edit103:setFontColor("black");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setType("number");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.rectangle1);
    obj.edit104:setField("IntimidacaoO");
    obj.edit104:setLeft(827);
    obj.edit104:setTop(538);
    obj.edit104:setName("edit104");
    obj.edit104:setTransparent(true);
    obj.edit104:setWidth(30);
    obj.edit104:setFontSize(16);
    obj.edit104:setFontColor("black");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setType("number");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.rectangle1);
    obj.edit105:setLeft(550);
    obj.edit105:setTop(538);
    obj.edit105:setWidth(60);
    obj.edit105:setHeight(20);
    obj.edit105:setTransparent(true);
    obj.edit105:setReadOnly(true);
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.rectangle1);
    obj.edit106:setField("IntuicaoB");
    obj.edit106:setLeft(742);
    obj.edit106:setTop(564);
    obj.edit106:setName("edit106");
    obj.edit106:setTransparent(true);
    obj.edit106:setWidth(30);
    obj.edit106:setFontSize(16);
    obj.edit106:setFontColor("black");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setType("number");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.rectangle1);
    obj.edit107:setField("IntuicaoT");
    obj.edit107:setLeft(785);
    obj.edit107:setTop(564);
    obj.edit107:setName("edit107");
    obj.edit107:setTransparent(true);
    obj.edit107:setWidth(30);
    obj.edit107:setFontSize(16);
    obj.edit107:setFontColor("black");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setType("number");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.rectangle1);
    obj.edit108:setField("IntuicaoO");
    obj.edit108:setLeft(827);
    obj.edit108:setTop(564);
    obj.edit108:setName("edit108");
    obj.edit108:setTransparent(true);
    obj.edit108:setWidth(30);
    obj.edit108:setFontSize(16);
    obj.edit108:setFontColor("black");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setType("number");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.rectangle1);
    obj.edit109:setLeft(550);
    obj.edit109:setTop(564);
    obj.edit109:setWidth(60);
    obj.edit109:setHeight(20);
    obj.edit109:setTransparent(true);
    obj.edit109:setReadOnly(true);
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.rectangle1);
    obj.edit110:setField("InvestigacaoB");
    obj.edit110:setLeft(742);
    obj.edit110:setTop(590);
    obj.edit110:setName("edit110");
    obj.edit110:setTransparent(true);
    obj.edit110:setWidth(30);
    obj.edit110:setFontSize(16);
    obj.edit110:setFontColor("black");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setType("number");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.rectangle1);
    obj.edit111:setField("InvestigacaoT");
    obj.edit111:setLeft(785);
    obj.edit111:setTop(590);
    obj.edit111:setName("edit111");
    obj.edit111:setTransparent(true);
    obj.edit111:setWidth(30);
    obj.edit111:setFontSize(16);
    obj.edit111:setFontColor("black");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setType("number");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.rectangle1);
    obj.edit112:setField("InvestigacaoO");
    obj.edit112:setLeft(827);
    obj.edit112:setTop(590);
    obj.edit112:setName("edit112");
    obj.edit112:setTransparent(true);
    obj.edit112:setWidth(30);
    obj.edit112:setFontSize(16);
    obj.edit112:setFontColor("black");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setType("number");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.rectangle1);
    obj.edit113:setLeft(550);
    obj.edit113:setTop(590);
    obj.edit113:setWidth(60);
    obj.edit113:setHeight(20);
    obj.edit113:setTransparent(true);
    obj.edit113:setReadOnly(true);
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.rectangle1);
    obj.edit114:setField("LutaB");
    obj.edit114:setLeft(742);
    obj.edit114:setTop(616);
    obj.edit114:setName("edit114");
    obj.edit114:setTransparent(true);
    obj.edit114:setWidth(30);
    obj.edit114:setFontSize(16);
    obj.edit114:setFontColor("black");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setType("number");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.rectangle1);
    obj.edit115:setField("LutaT");
    obj.edit115:setLeft(785);
    obj.edit115:setTop(616);
    obj.edit115:setName("edit115");
    obj.edit115:setTransparent(true);
    obj.edit115:setWidth(30);
    obj.edit115:setFontSize(16);
    obj.edit115:setFontColor("black");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setType("number");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.rectangle1);
    obj.edit116:setField("LutaO");
    obj.edit116:setLeft(827);
    obj.edit116:setTop(616);
    obj.edit116:setName("edit116");
    obj.edit116:setTransparent(true);
    obj.edit116:setWidth(30);
    obj.edit116:setFontSize(16);
    obj.edit116:setFontColor("black");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setType("number");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.rectangle1);
    obj.edit117:setLeft(550);
    obj.edit117:setTop(616);
    obj.edit117:setWidth(60);
    obj.edit117:setHeight(20);
    obj.edit117:setTransparent(true);
    obj.edit117:setReadOnly(true);
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.rectangle1);
    obj.edit118:setField("MedicinaB");
    obj.edit118:setLeft(742);
    obj.edit118:setTop(642);
    obj.edit118:setName("edit118");
    obj.edit118:setTransparent(true);
    obj.edit118:setWidth(30);
    obj.edit118:setFontSize(16);
    obj.edit118:setFontColor("black");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setType("number");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.rectangle1);
    obj.edit119:setField("MedicinaT");
    obj.edit119:setLeft(785);
    obj.edit119:setTop(642);
    obj.edit119:setName("edit119");
    obj.edit119:setTransparent(true);
    obj.edit119:setWidth(30);
    obj.edit119:setFontSize(16);
    obj.edit119:setFontColor("black");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setType("number");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.rectangle1);
    obj.edit120:setField("MedicinaO");
    obj.edit120:setLeft(827);
    obj.edit120:setTop(642);
    obj.edit120:setName("edit120");
    obj.edit120:setTransparent(true);
    obj.edit120:setWidth(30);
    obj.edit120:setFontSize(16);
    obj.edit120:setFontColor("black");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setType("number");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.rectangle1);
    obj.edit121:setLeft(550);
    obj.edit121:setTop(642);
    obj.edit121:setWidth(60);
    obj.edit121:setHeight(20);
    obj.edit121:setTransparent(true);
    obj.edit121:setReadOnly(true);
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.rectangle1);
    obj.edit122:setField("OcultismoB");
    obj.edit122:setLeft(742);
    obj.edit122:setTop(668);
    obj.edit122:setName("edit122");
    obj.edit122:setTransparent(true);
    obj.edit122:setWidth(30);
    obj.edit122:setFontSize(16);
    obj.edit122:setFontColor("black");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setType("number");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.rectangle1);
    obj.edit123:setField("OcultismoT");
    obj.edit123:setLeft(785);
    obj.edit123:setTop(668);
    obj.edit123:setName("edit123");
    obj.edit123:setTransparent(true);
    obj.edit123:setWidth(30);
    obj.edit123:setFontSize(16);
    obj.edit123:setFontColor("black");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setType("number");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.rectangle1);
    obj.edit124:setField("OcultismoO");
    obj.edit124:setLeft(827);
    obj.edit124:setTop(668);
    obj.edit124:setName("edit124");
    obj.edit124:setTransparent(true);
    obj.edit124:setWidth(30);
    obj.edit124:setFontSize(16);
    obj.edit124:setFontColor("black");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setType("number");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.rectangle1);
    obj.edit125:setLeft(550);
    obj.edit125:setTop(668);
    obj.edit125:setWidth(60);
    obj.edit125:setHeight(20);
    obj.edit125:setTransparent(true);
    obj.edit125:setReadOnly(true);
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.rectangle1);
    obj.edit126:setField("PercepcaoB");
    obj.edit126:setLeft(742);
    obj.edit126:setTop(694);
    obj.edit126:setName("edit126");
    obj.edit126:setTransparent(true);
    obj.edit126:setWidth(30);
    obj.edit126:setFontSize(16);
    obj.edit126:setFontColor("black");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setType("number");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.rectangle1);
    obj.edit127:setField("PercepcaoT");
    obj.edit127:setLeft(785);
    obj.edit127:setTop(694);
    obj.edit127:setName("edit127");
    obj.edit127:setTransparent(true);
    obj.edit127:setWidth(30);
    obj.edit127:setFontSize(16);
    obj.edit127:setFontColor("black");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setType("number");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.rectangle1);
    obj.edit128:setField("PercepcaoO");
    obj.edit128:setLeft(827);
    obj.edit128:setTop(694);
    obj.edit128:setName("edit128");
    obj.edit128:setTransparent(true);
    obj.edit128:setWidth(30);
    obj.edit128:setFontSize(16);
    obj.edit128:setFontColor("black");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setType("number");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.rectangle1);
    obj.edit129:setLeft(550);
    obj.edit129:setTop(694);
    obj.edit129:setWidth(60);
    obj.edit129:setHeight(20);
    obj.edit129:setTransparent(true);
    obj.edit129:setReadOnly(true);
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.rectangle1);
    obj.edit130:setField("PilotagemB");
    obj.edit130:setLeft(742);
    obj.edit130:setTop(720);
    obj.edit130:setName("edit130");
    obj.edit130:setTransparent(true);
    obj.edit130:setWidth(30);
    obj.edit130:setFontSize(16);
    obj.edit130:setFontColor("black");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setType("number");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.rectangle1);
    obj.edit131:setField("PilotagemT");
    obj.edit131:setLeft(785);
    obj.edit131:setTop(720);
    obj.edit131:setName("edit131");
    obj.edit131:setTransparent(true);
    obj.edit131:setWidth(30);
    obj.edit131:setFontSize(16);
    obj.edit131:setFontColor("black");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setType("number");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.rectangle1);
    obj.edit132:setField("PilotagemO");
    obj.edit132:setLeft(827);
    obj.edit132:setTop(720);
    obj.edit132:setName("edit132");
    obj.edit132:setTransparent(true);
    obj.edit132:setWidth(30);
    obj.edit132:setFontSize(16);
    obj.edit132:setFontColor("black");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setType("number");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.rectangle1);
    obj.edit133:setLeft(550);
    obj.edit133:setTop(720);
    obj.edit133:setWidth(60);
    obj.edit133:setHeight(20);
    obj.edit133:setTransparent(true);
    obj.edit133:setReadOnly(true);
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.rectangle1);
    obj.edit134:setField("PontariaB");
    obj.edit134:setLeft(742);
    obj.edit134:setTop(745);
    obj.edit134:setName("edit134");
    obj.edit134:setTransparent(true);
    obj.edit134:setWidth(30);
    obj.edit134:setFontSize(16);
    obj.edit134:setFontColor("black");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setType("number");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.rectangle1);
    obj.edit135:setField("PontariaT");
    obj.edit135:setLeft(785);
    obj.edit135:setTop(745);
    obj.edit135:setName("edit135");
    obj.edit135:setTransparent(true);
    obj.edit135:setWidth(30);
    obj.edit135:setFontSize(16);
    obj.edit135:setFontColor("black");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setType("number");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.rectangle1);
    obj.edit136:setField("PontariaO");
    obj.edit136:setLeft(827);
    obj.edit136:setTop(745);
    obj.edit136:setName("edit136");
    obj.edit136:setTransparent(true);
    obj.edit136:setWidth(30);
    obj.edit136:setFontSize(16);
    obj.edit136:setFontColor("black");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setType("number");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.rectangle1);
    obj.edit137:setLeft(550);
    obj.edit137:setTop(745);
    obj.edit137:setWidth(60);
    obj.edit137:setHeight(20);
    obj.edit137:setTransparent(true);
    obj.edit137:setReadOnly(true);
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.rectangle1);
    obj.edit138:setField("ProfissaoB");
    obj.edit138:setLeft(742);
    obj.edit138:setTop(768);
    obj.edit138:setName("edit138");
    obj.edit138:setTransparent(true);
    obj.edit138:setWidth(30);
    obj.edit138:setFontSize(16);
    obj.edit138:setFontColor("black");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setType("number");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.rectangle1);
    obj.edit139:setField("ProfissaoT");
    obj.edit139:setLeft(785);
    obj.edit139:setTop(768);
    obj.edit139:setName("edit139");
    obj.edit139:setTransparent(true);
    obj.edit139:setWidth(30);
    obj.edit139:setFontSize(16);
    obj.edit139:setFontColor("black");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setType("number");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.rectangle1);
    obj.edit140:setField("ProfissaoO");
    obj.edit140:setLeft(827);
    obj.edit140:setTop(768);
    obj.edit140:setName("edit140");
    obj.edit140:setTransparent(true);
    obj.edit140:setWidth(30);
    obj.edit140:setFontSize(16);
    obj.edit140:setFontColor("black");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setType("number");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.rectangle1);
    obj.edit141:setLeft(550);
    obj.edit141:setTop(768);
    obj.edit141:setWidth(60);
    obj.edit141:setHeight(20);
    obj.edit141:setTransparent(true);
    obj.edit141:setReadOnly(true);
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.rectangle1);
    obj.edit142:setField("ReflexosB");
    obj.edit142:setLeft(742);
    obj.edit142:setTop(794);
    obj.edit142:setName("edit142");
    obj.edit142:setTransparent(true);
    obj.edit142:setWidth(30);
    obj.edit142:setFontSize(16);
    obj.edit142:setFontColor("black");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setType("number");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.rectangle1);
    obj.edit143:setField("ReflexosT");
    obj.edit143:setLeft(785);
    obj.edit143:setTop(794);
    obj.edit143:setName("edit143");
    obj.edit143:setTransparent(true);
    obj.edit143:setWidth(30);
    obj.edit143:setFontSize(16);
    obj.edit143:setFontColor("black");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setType("number");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.rectangle1);
    obj.edit144:setField("ReflexosO");
    obj.edit144:setLeft(827);
    obj.edit144:setTop(794);
    obj.edit144:setName("edit144");
    obj.edit144:setTransparent(true);
    obj.edit144:setWidth(30);
    obj.edit144:setFontSize(16);
    obj.edit144:setFontColor("black");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setType("number");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.rectangle1);
    obj.edit145:setLeft(550);
    obj.edit145:setTop(794);
    obj.edit145:setWidth(60);
    obj.edit145:setHeight(20);
    obj.edit145:setTransparent(true);
    obj.edit145:setReadOnly(true);
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.rectangle1);
    obj.edit146:setField("ReligiaoB");
    obj.edit146:setLeft(742);
    obj.edit146:setTop(820);
    obj.edit146:setName("edit146");
    obj.edit146:setTransparent(true);
    obj.edit146:setWidth(30);
    obj.edit146:setFontSize(16);
    obj.edit146:setFontColor("black");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setType("number");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.rectangle1);
    obj.edit147:setField("ReligiaoT");
    obj.edit147:setLeft(785);
    obj.edit147:setTop(820);
    obj.edit147:setName("edit147");
    obj.edit147:setTransparent(true);
    obj.edit147:setWidth(30);
    obj.edit147:setFontSize(16);
    obj.edit147:setFontColor("black");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setType("number");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.rectangle1);
    obj.edit148:setField("ReligiaoO");
    obj.edit148:setLeft(827);
    obj.edit148:setTop(820);
    obj.edit148:setName("edit148");
    obj.edit148:setTransparent(true);
    obj.edit148:setWidth(30);
    obj.edit148:setFontSize(16);
    obj.edit148:setFontColor("black");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setType("number");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.rectangle1);
    obj.edit149:setLeft(550);
    obj.edit149:setTop(820);
    obj.edit149:setWidth(60);
    obj.edit149:setHeight(20);
    obj.edit149:setTransparent(true);
    obj.edit149:setReadOnly(true);
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.rectangle1);
    obj.edit150:setField("SobrevivenciaB");
    obj.edit150:setLeft(742);
    obj.edit150:setTop(846);
    obj.edit150:setName("edit150");
    obj.edit150:setTransparent(true);
    obj.edit150:setWidth(30);
    obj.edit150:setFontSize(16);
    obj.edit150:setFontColor("black");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setType("number");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.rectangle1);
    obj.edit151:setField("SobrevivenciaT");
    obj.edit151:setLeft(785);
    obj.edit151:setTop(846);
    obj.edit151:setName("edit151");
    obj.edit151:setTransparent(true);
    obj.edit151:setWidth(30);
    obj.edit151:setFontSize(16);
    obj.edit151:setFontColor("black");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setType("number");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.rectangle1);
    obj.edit152:setField("SobrevivenciaO");
    obj.edit152:setLeft(827);
    obj.edit152:setTop(846);
    obj.edit152:setName("edit152");
    obj.edit152:setTransparent(true);
    obj.edit152:setWidth(30);
    obj.edit152:setFontSize(16);
    obj.edit152:setFontColor("black");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setType("number");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.rectangle1);
    obj.edit153:setLeft(550);
    obj.edit153:setTop(846);
    obj.edit153:setWidth(60);
    obj.edit153:setHeight(20);
    obj.edit153:setTransparent(true);
    obj.edit153:setReadOnly(true);
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.rectangle1);
    obj.edit154:setField("TaticaB");
    obj.edit154:setLeft(742);
    obj.edit154:setTop(874);
    obj.edit154:setName("edit154");
    obj.edit154:setTransparent(true);
    obj.edit154:setWidth(30);
    obj.edit154:setFontSize(16);
    obj.edit154:setFontColor("black");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setType("number");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.rectangle1);
    obj.edit155:setField("TaticaT");
    obj.edit155:setLeft(785);
    obj.edit155:setTop(874);
    obj.edit155:setName("edit155");
    obj.edit155:setTransparent(true);
    obj.edit155:setWidth(30);
    obj.edit155:setFontSize(16);
    obj.edit155:setFontColor("black");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setType("number");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.rectangle1);
    obj.edit156:setField("TaticaO");
    obj.edit156:setLeft(827);
    obj.edit156:setTop(874);
    obj.edit156:setName("edit156");
    obj.edit156:setTransparent(true);
    obj.edit156:setWidth(30);
    obj.edit156:setFontSize(16);
    obj.edit156:setFontColor("black");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setType("number");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.rectangle1);
    obj.edit157:setLeft(550);
    obj.edit157:setTop(874);
    obj.edit157:setWidth(60);
    obj.edit157:setHeight(20);
    obj.edit157:setTransparent(true);
    obj.edit157:setReadOnly(true);
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.rectangle1);
    obj.edit158:setField("TecnologiaB");
    obj.edit158:setLeft(742);
    obj.edit158:setTop(898);
    obj.edit158:setName("edit158");
    obj.edit158:setTransparent(true);
    obj.edit158:setWidth(30);
    obj.edit158:setFontSize(16);
    obj.edit158:setFontColor("black");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setType("number");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.rectangle1);
    obj.edit159:setField("TecnologiaT");
    obj.edit159:setLeft(785);
    obj.edit159:setTop(898);
    obj.edit159:setName("edit159");
    obj.edit159:setTransparent(true);
    obj.edit159:setWidth(30);
    obj.edit159:setFontSize(16);
    obj.edit159:setFontColor("black");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setType("number");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.rectangle1);
    obj.edit160:setField("TecnologiaO");
    obj.edit160:setLeft(827);
    obj.edit160:setTop(898);
    obj.edit160:setName("edit160");
    obj.edit160:setTransparent(true);
    obj.edit160:setWidth(30);
    obj.edit160:setFontSize(16);
    obj.edit160:setFontColor("black");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setType("number");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.rectangle1);
    obj.edit161:setLeft(550);
    obj.edit161:setTop(898);
    obj.edit161:setWidth(60);
    obj.edit161:setHeight(20);
    obj.edit161:setTransparent(true);
    obj.edit161:setReadOnly(true);
    obj.edit161:setName("edit161");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.rectangle1);
    obj.edit162:setField("VontadeB");
    obj.edit162:setLeft(742);
    obj.edit162:setTop(925);
    obj.edit162:setName("edit162");
    obj.edit162:setTransparent(true);
    obj.edit162:setWidth(30);
    obj.edit162:setFontSize(16);
    obj.edit162:setFontColor("black");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setType("number");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.rectangle1);
    obj.edit163:setField("VontadeT");
    obj.edit163:setLeft(785);
    obj.edit163:setTop(925);
    obj.edit163:setName("edit163");
    obj.edit163:setTransparent(true);
    obj.edit163:setWidth(30);
    obj.edit163:setFontSize(16);
    obj.edit163:setFontColor("black");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setType("number");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.rectangle1);
    obj.edit164:setField("VontadeO");
    obj.edit164:setLeft(827);
    obj.edit164:setTop(925);
    obj.edit164:setName("edit164");
    obj.edit164:setTransparent(true);
    obj.edit164:setWidth(30);
    obj.edit164:setFontSize(16);
    obj.edit164:setFontColor("black");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setType("number");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.rectangle1);
    obj.edit165:setLeft(550);
    obj.edit165:setTop(925);
    obj.edit165:setWidth(60);
    obj.edit165:setHeight(20);
    obj.edit165:setTransparent(true);
    obj.edit165:setReadOnly(true);
    obj.edit165:setName("edit165");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Verso");
    obj.tab2:setName("tab2");

    obj.frmOP2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmOP2_svg:setParent(obj.tab2);
    obj.frmOP2_svg:setName("frmOP2_svg");
    obj.frmOP2_svg:setAlign("client");
    obj.frmOP2_svg:setTheme("light");
    obj.frmOP2_svg:setMargins({top=1});

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmOP2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox2);
    obj.rectangle2:setWidth(890);
    obj.rectangle2:setHeight(1244);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(890);
    obj.image2:setHeight(1244);
    obj.image2:setSRC("/OP/images/2.png");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Créditos");
    obj.tab3:setName("tab3");

    obj.frmFichaCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaCreditos:setParent(obj.tab3);
    obj.frmFichaCreditos:setName("frmFichaCreditos");
    obj.frmFichaCreditos:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmFichaCreditos);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox3);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(500);
    obj.image3:setHeight(500);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("logo_mesa");
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox3);
    obj.image4:setLeft(480);
    obj.image4:setTop(0);
    obj.image4:setWidth(350);
    obj.image4:setHeight(125);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("https://ordemparanormal.com.br/wp-content/uploads/2021/07/op-logo.png");
    obj.image4:setName("image4");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox3);
    obj.layout1:setLeft(480);
    obj.layout1:setTop(190);
    obj.layout1:setWidth(350);
    obj.layout1:setHeight(80);
    obj.layout1:setName("layout1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(10);
    obj.label1:setWidth(350);
    obj.label1:setHeight(20);
    obj.label1:setText("Ficha criada por Marcio F. (Samelfero) ");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(0);
    obj.label2:setTop(40);
    obj.label2:setWidth(350);
    obj.label2:setHeight(20);
    obj.label2:setText("para o sistema Ordem Paranormal RPG");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox3);
    obj.label3:setLeft(480);
    obj.label3:setTop(300);
    obj.label3:setWidth(350);
    obj.label3:setHeight(20);
    obj.label3:setText("Sua Versão: 1.0");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox3);
    obj.button1:setLeft(490);
    obj.button1:setTop(320);
    obj.button1:setWidth(160);
    obj.button1:setText("Change Log");
    obj.button1:setHint("Abre as notas de atualização da ficha");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox3);
    obj.button2:setLeft(660);
    obj.button2:setTop(320);
    obj.button2:setWidth(160);
    obj.button2:setText("Atualizar");
    obj.button2:setHint("Baixa a versão mais recente da ficha");
    obj.button2:setName("button2");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Def = 10 + (tonumber(sheet.DefEq) or 0) + (tonumber(sheet.DefOt) or 0)+ (tonumber(sheet.AGI) or 0);
        end, obj);

    obj._e_event1 = obj.edit45:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            						end;
            						
            						msg = msg .. " >>>  Intelecto de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagem.resultado; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event2 = obj.edit47:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.FOR.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            						end;
            						
            						msg = msg .. " >>>  Força de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagem.resultado; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event3 = obj.edit49:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.AGI.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            						end;
            						
            						msg = msg .. " >>>  Agilidade de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagem.resultado; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event4 = obj.edit51:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            						end;
            						
            						msg = msg .. " >>>  Presença de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagem.resultado; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event5 = obj.edit53:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.VIG.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            						end;
            						
            						msg = msg .. " >>> Vigor de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagem.resultado; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event6 = obj.edit57:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.AcrobaciaB+sheet.AcrobaciaT+sheet.AcrobaciaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.AGI.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Acrobacia[§K0][+"..rolagemS.."] [§K15](c/ AGI)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event7 = obj.edit61:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.AdestramentoB+sheet.AdestramentoT+sheet.AdestramentoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Adestramento[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event8 = obj.edit65:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.ArtesB+sheet.ArtesT+sheet.ArtesO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Artes[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event9 = obj.edit69:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.AtletismoB+sheet.AtletismoT+sheet.AtletismoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.FOR.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Atletismo[§K0][+"..rolagemS.."] [§K15](c/ FOR)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event10 = obj.edit73:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.AtualidadesB+sheet.AtualidadesT+sheet.AtualidadesO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Atualidades[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event11 = obj.edit77:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.CienciaisB+sheet.CienciaisT+sheet.CienciaisO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Cienciais[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event12 = obj.edit81:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.CrimeB+sheet.CrimeT+sheet.CrimeO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.AGI.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Crime[§K0][+"..rolagemS.."] [§K15](c/ AGI)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event13 = obj.edit85:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.DiplomaciaB+sheet.DiplomaciaT+sheet.DiplomaciaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Diplomacia[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event14 = obj.edit89:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.EnganacaoB+sheet.EnganacaoT+sheet.EnganacaoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Enganacao[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event15 = obj.edit93:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.FortitudeB+sheet.FortitudeT+sheet.FortitudeO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.VIG.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Fortitude[§K0][+"..rolagemS.."] [§K15](c/ VIG)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event16 = obj.edit97:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.FurtividadeB+sheet.FurtividadeT+sheet.FurtividadeO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.AGI.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Furtividade[§K0][+"..rolagemS.."] [§K15](c/ AGI)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event17 = obj.edit101:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.IniciativaB+sheet.IniciativaT+sheet.IniciativaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.AGI.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Iniciativa[§K0][+"..rolagemS.."] [§K15](c/ AGI)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event18 = obj.edit105:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.IntimidacaoB+sheet.IntimidacaoT+sheet.IntimidacaoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Intimidacao[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event19 = obj.edit109:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.IntuicaoB+sheet.IntuicaoT+sheet.IntuicaoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Intuicao[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event20 = obj.edit113:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.InvestigacaoB+sheet.InvestigacaoT+sheet.InvestigacaoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Investigacao[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event21 = obj.edit117:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.LutaB+sheet.LutaT+sheet.LutaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.FOR.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Luta[§K0][+"..rolagemS.."] [§K15](c/ FOR)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event22 = obj.edit121:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.MedicinaB+sheet.MedicinaT+sheet.MedicinaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Medicina[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event23 = obj.edit125:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.OcultismoB+sheet.OcultismoT+sheet.OcultismoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Ocultismo[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event24 = obj.edit129:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.PercepcaoB+sheet.PercepcaoT+sheet.PercepcaoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Percepcao[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event25 = obj.edit133:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.PilotagemB+sheet.PilotagemT+sheet.PilotagemO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.AGI.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Pilotagem[§K0][+"..rolagemS.."] [§K15](c/ AGI)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event26 = obj.edit137:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.PontariaB+sheet.PontariaT+sheet.PontariaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.AGI.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Pontaria[§K0][+"..rolagemS.."] [§K15](c/ AGI)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event27 = obj.edit141:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.ProfissaoB+sheet.ProfissaoT+sheet.ProfissaoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Profissao[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event28 = obj.edit145:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.ReflexosB+sheet.ReflexosT+sheet.ReflexosO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.AGI.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Reflexos[§K0][+"..rolagemS.."] [§K15](c/ AGI)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event29 = obj.edit149:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.ReligiaoB+sheet.ReligiaoT+sheet.ReligiaoO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Religiao[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event30 = obj.edit153:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.SobrevivenciaB+sheet.SobrevivenciaT+sheet.SobrevivenciaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Sobrevivencia[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event31 = obj.edit157:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.TaticaB+sheet.TaticaT+sheet.TaticaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Tatica[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event32 = obj.edit161:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.TecnologiaB+sheet.TecnologiaT+sheet.TecnologiaO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.INT.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Tecnologia[§K0][+"..rolagemS.."] [§K15](c/ INT)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 	
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event33 = obj.edit165:addEventListener("onClick",
        function (_)
            local msg = "";
            						
            						local rolagemF = 1;
            						
            						local rolagemS = sheet.VontadeB+sheet.VontadeT+sheet.VontadeO
            						
            						local rolagem = Firecast.interpretarRolagem(sheet.PRE.. "d20");
            						
            						rolagem:rolarLocalmente();
            						
            						for i = 1, #rolagem.ops, 1 do  
            						
            								local operacao = rolagem.ops[i]; 
            								
            								local maior = 1
            								
            								if operacao.tipo == "dado" then        
            										msg = msg .. "[§K14]" .. operacao.quantidade .. "d" .. operacao.face .. ":";               
            										
            										for j = 1, #operacao.resultados, 1 do
            												msg = msg .. "  " ..operacao.resultados[j];												
            										
            										if operacao.resultados[j] > maior then maior = operacao.resultados[j]	
            										end;
            										end; 		
            								end;
            								
            								if 	maior > 0 then rolagem.resultado = maior
            								end;
            								if rolagem.resultado > 0 then rolagemF = (rolagem.resultado+rolagemS)
            								end;
            						end;
            																		
            						msg = msg .. " >>> Vontade[§K0][+"..rolagemS.."] [§K15](c/ PRE)[§K14] de " ..Firecast.getMesaDe(sheet).meuJogador.nick.. ": [§K8]" ..rolagemF; 					
            						
            						Firecast.getMesaDe(sheet).chat:enviarMensagem(msg);
        end, obj);

    obj._e_event34 = obj.button1:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/')
        end, obj);

    obj._e_event35 = obj.button2:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/')
        end, obj);

    function obj:_releaseEvents()
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
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.frmFichaCreditos ~= nil then self.frmFichaCreditos:destroy(); self.frmFichaCreditos = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.frmOP2_svg ~= nil then self.frmOP2_svg:destroy(); self.frmOP2_svg = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.frmOP1_svg ~= nil then self.frmOP1_svg:destroy(); self.frmOP1_svg = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmOP()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmOP();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmOP = {
    newEditor = newfrmOP, 
    new = newfrmOP, 
    name = "frmOP", 
    dataType = "OP.v1.0.Samelfero", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ordem Paranormal v1.0", 
    description=""};

frmOP = _frmOP;
Firecast.registrarForm(_frmOP);
Firecast.registrarDataType(_frmOP);

return _frmOP;
