require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmlobisomem()
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
    obj:setName("frmlobisomem");
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.RRPG.WTFV3_S3");
    obj:setTitle("Lobisomem: O Apocalipse - Ficha de Personagem");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.frmwta1_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmwta1_svg:setParent(obj.tab1);
    obj.frmwta1_svg:setName("frmwta1_svg");
    obj.frmwta1_svg:setAlign("client");
    obj.frmwta1_svg:setTheme("light");
    obj.frmwta1_svg:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmwta1_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1369);
    obj.rectangle1:setHeight(1937);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1369);
    obj.image1:setHeight(1937);
    obj.image1:setSRC("/Lobisomem/images/att.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(191);
    obj.layout1:setTop(268);
    obj.layout1:setWidth(297);
    obj.layout1:setHeight(33);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(22.6);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(297);
    obj.edit1:setHeight(34);
    obj.edit1:setField("Nome");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(214);
    obj.layout2:setTop(309);
    obj.layout2:setWidth(274);
    obj.layout2:setHeight(33);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(22.6);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(274);
    obj.edit2:setHeight(34);
    obj.edit2:setField("Jogador");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(210);
    obj.layout3:setTop(350);
    obj.layout3:setWidth(278);
    obj.layout3:setHeight(33);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(22.6);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(278);
    obj.edit3:setHeight(34);
    obj.edit3:setField("Cronica");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(578);
    obj.layout4:setTop(268);
    obj.layout4:setWidth(306);
    obj.layout4:setHeight(33);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(22.6);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(306);
    obj.edit4:setHeight(34);
    obj.edit4:setField("Natureza");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(617);
    obj.layout5:setTop(309);
    obj.layout5:setWidth(267);
    obj.layout5:setHeight(33);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(22.6);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(267);
    obj.edit5:setHeight(34);
    obj.edit5:setField("Comportamento");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(585);
    obj.layout6:setTop(350);
    obj.layout6:setWidth(299);
    obj.layout6:setHeight(33);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(22.6);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(299);
    obj.edit6:setHeight(34);
    obj.edit6:setField("Clã");
    obj.edit6:setName("edit6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(1121);
    obj.layout7:setTop(268);
    obj.layout7:setWidth(140);
    obj.layout7:setHeight(33);
    obj.layout7:setName("layout7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(22.6);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(140);
    obj.edit7:setHeight(34);
    obj.edit7:setField("Geração");
    obj.edit7:setName("edit7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(1127);
    obj.layout8:setTop(309);
    obj.layout8:setWidth(134);
    obj.layout8:setHeight(33);
    obj.layout8:setName("layout8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(22.6);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(134);
    obj.edit8:setHeight(34);
    obj.edit8:setField("Senhor");
    obj.edit8:setName("edit8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(1012);
    obj.layout9:setTop(350);
    obj.layout9:setWidth(249);
    obj.layout9:setHeight(33);
    obj.layout9:setName("layout9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(22.6);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(249);
    obj.edit9:setHeight(34);
    obj.edit9:setField("Conceito");
    obj.edit9:setName("edit9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(167);
    obj.layout10:setTop(490);
    obj.layout10:setWidth(198);
    obj.layout10:setHeight(29);
    obj.layout10:setName("layout10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(19.5);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(198);
    obj.edit10:setHeight(30);
    obj.edit10:setField("Força");
    obj.edit10:setName("edit10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(199);
    obj.layout11:setTop(522);
    obj.layout11:setWidth(164);
    obj.layout11:setHeight(29);
    obj.layout11:setName("layout11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(19.5);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(164);
    obj.edit11:setHeight(30);
    obj.edit11:setField("Destreza");
    obj.edit11:setName("edit11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(169);
    obj.layout12:setTop(555);
    obj.layout12:setWidth(195);
    obj.layout12:setHeight(29);
    obj.layout12:setName("layout12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(19.5);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(195);
    obj.edit12:setHeight(30);
    obj.edit12:setField("Vigor");
    obj.edit12:setName("edit12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(593);
    obj.layout13:setTop(490);
    obj.layout13:setWidth(168);
    obj.layout13:setHeight(29);
    obj.layout13:setName("layout13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(19.5);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(168);
    obj.edit13:setHeight(30);
    obj.edit13:setField("Carisma");
    obj.edit13:setName("edit13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(647);
    obj.layout14:setTop(522);
    obj.layout14:setWidth(115);
    obj.layout14:setHeight(29);
    obj.layout14:setName("layout14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(19.5);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(115);
    obj.edit14:setHeight(30);
    obj.edit14:setField("Manipulação");
    obj.edit14:setName("edit14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(618);
    obj.layout15:setTop(555);
    obj.layout15:setWidth(144);
    obj.layout15:setHeight(29);
    obj.layout15:setName("layout15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(19.5);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(144);
    obj.edit15:setHeight(30);
    obj.edit15:setField("Aparência");
    obj.edit15:setName("edit15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(1010);
    obj.layout16:setTop(490);
    obj.layout16:setWidth(147);
    obj.layout16:setHeight(29);
    obj.layout16:setName("layout16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout16);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(19.5);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(147);
    obj.edit16:setHeight(30);
    obj.edit16:setField("Percepção");
    obj.edit16:setName("edit16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(1030);
    obj.layout17:setTop(522);
    obj.layout17:setWidth(127);
    obj.layout17:setHeight(29);
    obj.layout17:setName("layout17");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout17);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(19.5);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(127);
    obj.edit17:setHeight(30);
    obj.edit17:setField("Inteligência");
    obj.edit17:setName("edit17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(1018);
    obj.layout18:setTop(555);
    obj.layout18:setWidth(139);
    obj.layout18:setHeight(29);
    obj.layout18:setName("layout18");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout18);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(19.5);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(139);
    obj.edit18:setHeight(30);
    obj.edit18:setField("Raciocínio");
    obj.edit18:setName("edit18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(107);
    obj.layout19:setTop(1115);
    obj.layout19:setWidth(258);
    obj.layout19:setHeight(33);
    obj.layout19:setName("layout19");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout19);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(22.6);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(258);
    obj.edit19:setHeight(34);
    obj.edit19:setField("Antecedentes_1");
    obj.edit19:setName("edit19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(107);
    obj.layout20:setTop(1148);
    obj.layout20:setWidth(258);
    obj.layout20:setHeight(33);
    obj.layout20:setName("layout20");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout20);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(22.6);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(258);
    obj.edit20:setHeight(34);
    obj.edit20:setField("Antecedentes_2");
    obj.edit20:setName("edit20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(107);
    obj.layout21:setTop(1180);
    obj.layout21:setWidth(258);
    obj.layout21:setHeight(33);
    obj.layout21:setName("layout21");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout21);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(22.6);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(258);
    obj.edit21:setHeight(34);
    obj.edit21:setField("Antecedentes_3");
    obj.edit21:setName("edit21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(107);
    obj.layout22:setTop(1213);
    obj.layout22:setWidth(258);
    obj.layout22:setHeight(33);
    obj.layout22:setName("layout22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout22);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(22.6);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(258);
    obj.edit22:setHeight(34);
    obj.edit22:setField("Antecedentes_4");
    obj.edit22:setName("edit22");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(107);
    obj.layout23:setTop(1245);
    obj.layout23:setWidth(258);
    obj.layout23:setHeight(33);
    obj.layout23:setName("layout23");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout23);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(22.6);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(258);
    obj.edit23:setHeight(34);
    obj.edit23:setField("Antecedentes_5");
    obj.edit23:setName("edit23");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(107);
    obj.layout24:setTop(1278);
    obj.layout24:setWidth(258);
    obj.layout24:setHeight(33);
    obj.layout24:setName("layout24");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout24);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(22.6);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(258);
    obj.edit24:setHeight(34);
    obj.edit24:setField("Antecedentes_6");
    obj.edit24:setName("edit24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(507);
    obj.layout25:setTop(1114);
    obj.layout25:setWidth(358);
    obj.layout25:setHeight(33);
    obj.layout25:setName("layout25");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout25);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(22.6);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(358);
    obj.edit25:setHeight(34);
    obj.edit25:setField("OOOOO");
    obj.edit25:setName("edit25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(507);
    obj.layout26:setTop(1147);
    obj.layout26:setWidth(358);
    obj.layout26:setHeight(33);
    obj.layout26:setName("layout26");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout26);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(22.6);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(358);
    obj.edit26:setHeight(34);
    obj.edit26:setField("OOOOO_2");
    obj.edit26:setName("edit26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(507);
    obj.layout27:setTop(1180);
    obj.layout27:setWidth(358);
    obj.layout27:setHeight(33);
    obj.layout27:setName("layout27");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout27);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(22.6);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(358);
    obj.edit27:setHeight(34);
    obj.edit27:setField("OOOOO_3");
    obj.edit27:setName("edit27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(507);
    obj.layout28:setTop(1212);
    obj.layout28:setWidth(358);
    obj.layout28:setHeight(33);
    obj.layout28:setName("layout28");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout28);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(22.6);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(358);
    obj.edit28:setHeight(34);
    obj.edit28:setField("OOOOO_4");
    obj.edit28:setName("edit28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(507);
    obj.layout29:setTop(1245);
    obj.layout29:setWidth(358);
    obj.layout29:setHeight(33);
    obj.layout29:setName("layout29");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout29);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(22.6);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(358);
    obj.edit29:setHeight(34);
    obj.edit29:setField("OOOOO_5");
    obj.edit29:setName("edit29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(507);
    obj.layout30:setTop(1278);
    obj.layout30:setWidth(358);
    obj.layout30:setHeight(33);
    obj.layout30:setName("layout30");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout30);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(22.6);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(358);
    obj.edit30:setHeight(34);
    obj.edit30:setField("OOOOO_6");
    obj.edit30:setName("edit30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(903);
    obj.layout31:setTop(1114);
    obj.layout31:setWidth(358);
    obj.layout31:setHeight(33);
    obj.layout31:setName("layout31");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout31);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(22.6);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(358);
    obj.edit31:setHeight(34);
    obj.edit31:setField("Dons_1");
    obj.edit31:setName("edit31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(903);
    obj.layout32:setTop(1147);
    obj.layout32:setWidth(358);
    obj.layout32:setHeight(33);
    obj.layout32:setName("layout32");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout32);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(22.6);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(358);
    obj.edit32:setHeight(34);
    obj.edit32:setField("Dons_2");
    obj.edit32:setName("edit32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(903);
    obj.layout33:setTop(1180);
    obj.layout33:setWidth(358);
    obj.layout33:setHeight(33);
    obj.layout33:setName("layout33");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout33);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(22.6);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(358);
    obj.edit33:setHeight(34);
    obj.edit33:setField("Dons_3");
    obj.edit33:setName("edit33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(903);
    obj.layout34:setTop(1212);
    obj.layout34:setWidth(358);
    obj.layout34:setHeight(33);
    obj.layout34:setName("layout34");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout34);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(22.6);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(358);
    obj.edit34:setHeight(34);
    obj.edit34:setField("Dons_4");
    obj.edit34:setName("edit34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(903);
    obj.layout35:setTop(1245);
    obj.layout35:setWidth(358);
    obj.layout35:setHeight(33);
    obj.layout35:setName("layout35");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout35);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(22.6);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(358);
    obj.edit35:setHeight(34);
    obj.edit35:setField("Dons_5");
    obj.edit35:setName("edit35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(903);
    obj.layout36:setTop(1278);
    obj.layout36:setWidth(358);
    obj.layout36:setHeight(33);
    obj.layout36:setName("layout36");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout36);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(22.6);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("leading");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(358);
    obj.edit36:setHeight(34);
    obj.edit36:setField("Dons_6");
    obj.edit36:setName("edit36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(116);
    obj.layout37:setTop(1802);
    obj.layout37:setWidth(344);
    obj.layout37:setHeight(33);
    obj.layout37:setName("layout37");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout37);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(22.6);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(344);
    obj.edit37:setHeight(34);
    obj.edit37:setField("Posto");
    obj.edit37:setName("edit37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(904);
    obj.layout38:setTop(1754.4);
    obj.layout38:setWidth(357);
    obj.layout38:setHeight(77.6);
    obj.layout38:setName("layout38");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout38);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(357);
    obj.textEditor1:setHeight(77.6);
    obj.textEditor1:setFontSize(23);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Fraqueza");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(1243);
    obj.layout39:setTop(988);
    obj.layout39:setWidth(22);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout39);
    obj.imageCheckBox1:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox1:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox1:setLeft(0);
    obj.imageCheckBox1:setTop(0);
    obj.imageCheckBox1:setWidth(22);
    obj.imageCheckBox1:setHeight(26);
    obj.imageCheckBox1:setField("Conhecimentos_10_5");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(1223);
    obj.layout40:setTop(988);
    obj.layout40:setWidth(22);
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout40);
    obj.imageCheckBox2:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox2:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox2:setLeft(0);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(22);
    obj.imageCheckBox2:setHeight(26);
    obj.imageCheckBox2:setField("Conhecimentos_10_4");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(1201);
    obj.layout41:setTop(988);
    obj.layout41:setWidth(22);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout41);
    obj.imageCheckBox3:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox3:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox3:setLeft(0);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(22);
    obj.imageCheckBox3:setHeight(26);
    obj.imageCheckBox3:setField("Conhecimentos_10_3");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(1181);
    obj.layout42:setTop(988);
    obj.layout42:setWidth(22);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout42);
    obj.imageCheckBox4:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox4:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox4:setLeft(0);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(22);
    obj.imageCheckBox4:setHeight(26);
    obj.imageCheckBox4:setField("Conhecimentos_10_2");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(1159);
    obj.layout43:setTop(988);
    obj.layout43:setWidth(22);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout43);
    obj.imageCheckBox5:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox5:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox5:setLeft(0);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(22);
    obj.imageCheckBox5:setHeight(26);
    obj.imageCheckBox5:setField("Conhecimentos_10_1");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(848);
    obj.layout44:setTop(988);
    obj.layout44:setWidth(22);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout44);
    obj.imageCheckBox6:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox6:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox6:setLeft(0);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(22);
    obj.imageCheckBox6:setHeight(26);
    obj.imageCheckBox6:setField("Perícias_10_5");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(826);
    obj.layout45:setTop(988);
    obj.layout45:setWidth(22);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout45);
    obj.imageCheckBox7:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox7:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox7:setLeft(0);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(22);
    obj.imageCheckBox7:setHeight(26);
    obj.imageCheckBox7:setField("Perícias_10_4");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(804);
    obj.layout46:setTop(988);
    obj.layout46:setWidth(22);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout46);
    obj.imageCheckBox8:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox8:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox8:setLeft(0);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(22);
    obj.imageCheckBox8:setHeight(26);
    obj.imageCheckBox8:setField("Perícias_10_3");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(784);
    obj.layout47:setTop(988);
    obj.layout47:setWidth(22);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout47);
    obj.imageCheckBox9:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox9:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox9:setLeft(0);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(22);
    obj.imageCheckBox9:setHeight(26);
    obj.imageCheckBox9:setField("Perícias_10_2");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(762);
    obj.layout48:setTop(988);
    obj.layout48:setWidth(22);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout48);
    obj.imageCheckBox10:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox10:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox10:setLeft(0);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(22);
    obj.imageCheckBox10:setHeight(26);
    obj.imageCheckBox10:setField("Perícias_10_1");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(452);
    obj.layout49:setTop(988);
    obj.layout49:setWidth(22);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout49);
    obj.imageCheckBox11:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox11:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox11:setLeft(0);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(22);
    obj.imageCheckBox11:setHeight(26);
    obj.imageCheckBox11:setField("Talentos_10_5");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(430);
    obj.layout50:setTop(988);
    obj.layout50:setWidth(22);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout50);
    obj.imageCheckBox12:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox12:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox12:setLeft(0);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(22);
    obj.imageCheckBox12:setHeight(26);
    obj.imageCheckBox12:setField("Talentos_10_4");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(409);
    obj.layout51:setTop(988);
    obj.layout51:setWidth(22);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout51);
    obj.imageCheckBox13:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox13:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox13:setLeft(0);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(22);
    obj.imageCheckBox13:setHeight(26);
    obj.imageCheckBox13:setField("Talentos_10_3");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(388);
    obj.layout52:setTop(988);
    obj.layout52:setWidth(22);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout52);
    obj.imageCheckBox14:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox14:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox14:setLeft(0);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(22);
    obj.imageCheckBox14:setHeight(26);
    obj.imageCheckBox14:setField("Talentos_10_2");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(365);
    obj.layout53:setTop(988);
    obj.layout53:setWidth(22);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout53);
    obj.imageCheckBox15:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox15:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox15:setLeft(0);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(22);
    obj.imageCheckBox15:setHeight(26);
    obj.imageCheckBox15:setField("Talentos_10_1");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(1243);
    obj.layout54:setTop(954);
    obj.layout54:setWidth(22);
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout54);
    obj.imageCheckBox16:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox16:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox16:setLeft(0);
    obj.imageCheckBox16:setTop(0);
    obj.imageCheckBox16:setWidth(22);
    obj.imageCheckBox16:setHeight(26);
    obj.imageCheckBox16:setField("Conhecimentos_9_5");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(1221);
    obj.layout55:setTop(954);
    obj.layout55:setWidth(22);
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout55);
    obj.imageCheckBox17:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox17:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox17:setLeft(0);
    obj.imageCheckBox17:setTop(0);
    obj.imageCheckBox17:setWidth(22);
    obj.imageCheckBox17:setHeight(26);
    obj.imageCheckBox17:setField("Conhecimentos_9_4");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(1199);
    obj.layout56:setTop(954);
    obj.layout56:setWidth(22);
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout56);
    obj.imageCheckBox18:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox18:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox18:setLeft(0);
    obj.imageCheckBox18:setTop(0);
    obj.imageCheckBox18:setWidth(22);
    obj.imageCheckBox18:setHeight(26);
    obj.imageCheckBox18:setField("Conhecimentos_9_3");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(1178);
    obj.layout57:setTop(954);
    obj.layout57:setWidth(22);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout57);
    obj.imageCheckBox19:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox19:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox19:setLeft(0);
    obj.imageCheckBox19:setTop(0);
    obj.imageCheckBox19:setWidth(22);
    obj.imageCheckBox19:setHeight(26);
    obj.imageCheckBox19:setField("Conhecimentos_9_2");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(1156);
    obj.layout58:setTop(954);
    obj.layout58:setWidth(22);
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout58);
    obj.imageCheckBox20:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox20:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox20:setLeft(0);
    obj.imageCheckBox20:setTop(0);
    obj.imageCheckBox20:setWidth(22);
    obj.imageCheckBox20:setHeight(26);
    obj.imageCheckBox20:setField("Conhecimentos_9_1");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(848);
    obj.layout59:setTop(956);
    obj.layout59:setWidth(22);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout59);
    obj.imageCheckBox21:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox21:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox21:setLeft(0);
    obj.imageCheckBox21:setTop(0);
    obj.imageCheckBox21:setWidth(22);
    obj.imageCheckBox21:setHeight(26);
    obj.imageCheckBox21:setField("Perícias_9_5");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(826);
    obj.layout60:setTop(956);
    obj.layout60:setWidth(22);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout60);
    obj.imageCheckBox22:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox22:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox22:setLeft(0);
    obj.imageCheckBox22:setTop(0);
    obj.imageCheckBox22:setWidth(22);
    obj.imageCheckBox22:setHeight(26);
    obj.imageCheckBox22:setField("Perícias_9_4");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(804);
    obj.layout61:setTop(956);
    obj.layout61:setWidth(22);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout61);
    obj.imageCheckBox23:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox23:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox23:setLeft(0);
    obj.imageCheckBox23:setTop(0);
    obj.imageCheckBox23:setWidth(22);
    obj.imageCheckBox23:setHeight(26);
    obj.imageCheckBox23:setField("Perícias_9_3");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(784);
    obj.layout62:setTop(956);
    obj.layout62:setWidth(22);
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout62);
    obj.imageCheckBox24:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox24:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox24:setLeft(0);
    obj.imageCheckBox24:setTop(0);
    obj.imageCheckBox24:setWidth(22);
    obj.imageCheckBox24:setHeight(26);
    obj.imageCheckBox24:setField("Perícias_9_2");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(762);
    obj.layout63:setTop(956);
    obj.layout63:setWidth(22);
    obj.layout63:setHeight(25);
    obj.layout63:setName("layout63");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout63);
    obj.imageCheckBox25:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox25:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox25:setLeft(0);
    obj.imageCheckBox25:setTop(0);
    obj.imageCheckBox25:setWidth(22);
    obj.imageCheckBox25:setHeight(26);
    obj.imageCheckBox25:setField("Perícias_9_1");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(452);
    obj.layout64:setTop(955);
    obj.layout64:setWidth(22);
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout64);
    obj.imageCheckBox26:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox26:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox26:setLeft(0);
    obj.imageCheckBox26:setTop(0);
    obj.imageCheckBox26:setWidth(22);
    obj.imageCheckBox26:setHeight(26);
    obj.imageCheckBox26:setField("Talentos_9_5");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(430);
    obj.layout65:setTop(955);
    obj.layout65:setWidth(22);
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout65);
    obj.imageCheckBox27:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox27:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox27:setLeft(0);
    obj.imageCheckBox27:setTop(0);
    obj.imageCheckBox27:setWidth(22);
    obj.imageCheckBox27:setHeight(26);
    obj.imageCheckBox27:setField("Talentos_9_4");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(409);
    obj.layout66:setTop(955);
    obj.layout66:setWidth(22);
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout66);
    obj.imageCheckBox28:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox28:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox28:setLeft(0);
    obj.imageCheckBox28:setTop(0);
    obj.imageCheckBox28:setWidth(22);
    obj.imageCheckBox28:setHeight(26);
    obj.imageCheckBox28:setField("Talentos_9_3");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(388);
    obj.layout67:setTop(955);
    obj.layout67:setWidth(22);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout67);
    obj.imageCheckBox29:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox29:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox29:setLeft(0);
    obj.imageCheckBox29:setTop(0);
    obj.imageCheckBox29:setWidth(22);
    obj.imageCheckBox29:setHeight(26);
    obj.imageCheckBox29:setField("Talentos_9_2");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(365);
    obj.layout68:setTop(955);
    obj.layout68:setWidth(22);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout68);
    obj.imageCheckBox30:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox30:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox30:setLeft(0);
    obj.imageCheckBox30:setTop(0);
    obj.imageCheckBox30:setWidth(22);
    obj.imageCheckBox30:setHeight(26);
    obj.imageCheckBox30:setField("Talentos_9_1");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(1243);
    obj.layout69:setTop(924);
    obj.layout69:setWidth(22);
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.imageCheckBox31 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout69);
    obj.imageCheckBox31:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox31:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox31:setLeft(0);
    obj.imageCheckBox31:setTop(0);
    obj.imageCheckBox31:setWidth(22);
    obj.imageCheckBox31:setHeight(26);
    obj.imageCheckBox31:setField("Conhecimentos_8_5");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(1223);
    obj.layout70:setTop(924);
    obj.layout70:setWidth(22);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.imageCheckBox32 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout70);
    obj.imageCheckBox32:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox32:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox32:setLeft(0);
    obj.imageCheckBox32:setTop(0);
    obj.imageCheckBox32:setWidth(22);
    obj.imageCheckBox32:setHeight(26);
    obj.imageCheckBox32:setField("Conhecimentos_8_4");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(1201);
    obj.layout71:setTop(924);
    obj.layout71:setWidth(22);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.imageCheckBox33 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout71);
    obj.imageCheckBox33:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox33:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox33:setLeft(0);
    obj.imageCheckBox33:setTop(0);
    obj.imageCheckBox33:setWidth(22);
    obj.imageCheckBox33:setHeight(26);
    obj.imageCheckBox33:setField("Conhecimentos_8_3");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(1178);
    obj.layout72:setTop(924);
    obj.layout72:setWidth(22);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.imageCheckBox34 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout72);
    obj.imageCheckBox34:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox34:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox34:setLeft(0);
    obj.imageCheckBox34:setTop(0);
    obj.imageCheckBox34:setWidth(22);
    obj.imageCheckBox34:setHeight(26);
    obj.imageCheckBox34:setField("Conhecimentos_8_2");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(1156);
    obj.layout73:setTop(924);
    obj.layout73:setWidth(22);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.imageCheckBox35 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout73);
    obj.imageCheckBox35:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox35:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox35:setLeft(0);
    obj.imageCheckBox35:setTop(0);
    obj.imageCheckBox35:setWidth(22);
    obj.imageCheckBox35:setHeight(26);
    obj.imageCheckBox35:setField("Conhecimentos_8_1");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(848);
    obj.layout74:setTop(923);
    obj.layout74:setWidth(22);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.imageCheckBox36 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout74);
    obj.imageCheckBox36:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox36:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox36:setLeft(0);
    obj.imageCheckBox36:setTop(0);
    obj.imageCheckBox36:setWidth(22);
    obj.imageCheckBox36:setHeight(26);
    obj.imageCheckBox36:setField("Perícias_8_5");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(826);
    obj.layout75:setTop(923);
    obj.layout75:setWidth(22);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.imageCheckBox37 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout75);
    obj.imageCheckBox37:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox37:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox37:setLeft(0);
    obj.imageCheckBox37:setTop(0);
    obj.imageCheckBox37:setWidth(22);
    obj.imageCheckBox37:setHeight(26);
    obj.imageCheckBox37:setField("Perícias_8_4");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(804);
    obj.layout76:setTop(923);
    obj.layout76:setWidth(22);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.imageCheckBox38 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout76);
    obj.imageCheckBox38:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox38:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox38:setLeft(0);
    obj.imageCheckBox38:setTop(0);
    obj.imageCheckBox38:setWidth(22);
    obj.imageCheckBox38:setHeight(26);
    obj.imageCheckBox38:setField("Perícias_8_3");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(784);
    obj.layout77:setTop(923);
    obj.layout77:setWidth(22);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.imageCheckBox39 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout77);
    obj.imageCheckBox39:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox39:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox39:setLeft(0);
    obj.imageCheckBox39:setTop(0);
    obj.imageCheckBox39:setWidth(22);
    obj.imageCheckBox39:setHeight(26);
    obj.imageCheckBox39:setField("Perícias_8_2");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(762);
    obj.layout78:setTop(923);
    obj.layout78:setWidth(22);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.imageCheckBox40 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout78);
    obj.imageCheckBox40:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox40:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox40:setLeft(0);
    obj.imageCheckBox40:setTop(0);
    obj.imageCheckBox40:setWidth(22);
    obj.imageCheckBox40:setHeight(26);
    obj.imageCheckBox40:setField("Perícias_8_1");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(452);
    obj.layout79:setTop(922);
    obj.layout79:setWidth(22);
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.imageCheckBox41 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout79);
    obj.imageCheckBox41:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox41:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox41:setLeft(0);
    obj.imageCheckBox41:setTop(0);
    obj.imageCheckBox41:setWidth(22);
    obj.imageCheckBox41:setHeight(26);
    obj.imageCheckBox41:setField("Talentos_8_5");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(430);
    obj.layout80:setTop(922);
    obj.layout80:setWidth(22);
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.imageCheckBox42 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout80);
    obj.imageCheckBox42:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox42:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox42:setLeft(0);
    obj.imageCheckBox42:setTop(0);
    obj.imageCheckBox42:setWidth(22);
    obj.imageCheckBox42:setHeight(26);
    obj.imageCheckBox42:setField("Talentos_8_4");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(409);
    obj.layout81:setTop(922);
    obj.layout81:setWidth(22);
    obj.layout81:setHeight(25);
    obj.layout81:setName("layout81");

    obj.imageCheckBox43 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox43:setParent(obj.layout81);
    obj.imageCheckBox43:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox43:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox43:setLeft(0);
    obj.imageCheckBox43:setTop(0);
    obj.imageCheckBox43:setWidth(22);
    obj.imageCheckBox43:setHeight(26);
    obj.imageCheckBox43:setField("Talentos_8_3");
    obj.imageCheckBox43:setName("imageCheckBox43");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(388);
    obj.layout82:setTop(922);
    obj.layout82:setWidth(22);
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.imageCheckBox44 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox44:setParent(obj.layout82);
    obj.imageCheckBox44:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox44:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox44:setLeft(0);
    obj.imageCheckBox44:setTop(0);
    obj.imageCheckBox44:setWidth(22);
    obj.imageCheckBox44:setHeight(26);
    obj.imageCheckBox44:setField("Talentos_8_2");
    obj.imageCheckBox44:setName("imageCheckBox44");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(365);
    obj.layout83:setTop(922);
    obj.layout83:setWidth(22);
    obj.layout83:setHeight(25);
    obj.layout83:setName("layout83");

    obj.imageCheckBox45 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox45:setParent(obj.layout83);
    obj.imageCheckBox45:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox45:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox45:setLeft(0);
    obj.imageCheckBox45:setTop(0);
    obj.imageCheckBox45:setWidth(22);
    obj.imageCheckBox45:setHeight(26);
    obj.imageCheckBox45:setField("Talentos_8_1");
    obj.imageCheckBox45:setName("imageCheckBox45");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(1243);
    obj.layout84:setTop(891);
    obj.layout84:setWidth(22);
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.imageCheckBox46 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox46:setParent(obj.layout84);
    obj.imageCheckBox46:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox46:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox46:setLeft(0);
    obj.imageCheckBox46:setTop(0);
    obj.imageCheckBox46:setWidth(22);
    obj.imageCheckBox46:setHeight(26);
    obj.imageCheckBox46:setField("Conhecimentos_7_5");
    obj.imageCheckBox46:setName("imageCheckBox46");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(1223);
    obj.layout85:setTop(891);
    obj.layout85:setWidth(22);
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.imageCheckBox47 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox47:setParent(obj.layout85);
    obj.imageCheckBox47:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox47:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox47:setLeft(0);
    obj.imageCheckBox47:setTop(0);
    obj.imageCheckBox47:setWidth(22);
    obj.imageCheckBox47:setHeight(26);
    obj.imageCheckBox47:setField("Conhecimentos_7_4");
    obj.imageCheckBox47:setName("imageCheckBox47");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(1201);
    obj.layout86:setTop(891);
    obj.layout86:setWidth(22);
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.imageCheckBox48 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox48:setParent(obj.layout86);
    obj.imageCheckBox48:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox48:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox48:setLeft(0);
    obj.imageCheckBox48:setTop(0);
    obj.imageCheckBox48:setWidth(22);
    obj.imageCheckBox48:setHeight(26);
    obj.imageCheckBox48:setField("Conhecimentos_7_3");
    obj.imageCheckBox48:setName("imageCheckBox48");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(1178);
    obj.layout87:setTop(891);
    obj.layout87:setWidth(22);
    obj.layout87:setHeight(25);
    obj.layout87:setName("layout87");

    obj.imageCheckBox49 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox49:setParent(obj.layout87);
    obj.imageCheckBox49:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox49:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox49:setLeft(0);
    obj.imageCheckBox49:setTop(0);
    obj.imageCheckBox49:setWidth(22);
    obj.imageCheckBox49:setHeight(26);
    obj.imageCheckBox49:setField("Conhecimentos_7_2");
    obj.imageCheckBox49:setName("imageCheckBox49");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(1156);
    obj.layout88:setTop(891);
    obj.layout88:setWidth(22);
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.imageCheckBox50 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox50:setParent(obj.layout88);
    obj.imageCheckBox50:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox50:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox50:setLeft(0);
    obj.imageCheckBox50:setTop(0);
    obj.imageCheckBox50:setWidth(22);
    obj.imageCheckBox50:setHeight(26);
    obj.imageCheckBox50:setField("Conhecimentos_7_1");
    obj.imageCheckBox50:setName("imageCheckBox50");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(848);
    obj.layout89:setTop(890);
    obj.layout89:setWidth(22);
    obj.layout89:setHeight(25);
    obj.layout89:setName("layout89");

    obj.imageCheckBox51 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox51:setParent(obj.layout89);
    obj.imageCheckBox51:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox51:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox51:setLeft(0);
    obj.imageCheckBox51:setTop(0);
    obj.imageCheckBox51:setWidth(22);
    obj.imageCheckBox51:setHeight(26);
    obj.imageCheckBox51:setField("Perícias_7_5");
    obj.imageCheckBox51:setName("imageCheckBox51");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(826);
    obj.layout90:setTop(890);
    obj.layout90:setWidth(22);
    obj.layout90:setHeight(25);
    obj.layout90:setName("layout90");

    obj.imageCheckBox52 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox52:setParent(obj.layout90);
    obj.imageCheckBox52:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox52:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox52:setLeft(0);
    obj.imageCheckBox52:setTop(0);
    obj.imageCheckBox52:setWidth(22);
    obj.imageCheckBox52:setHeight(26);
    obj.imageCheckBox52:setField("Perícias_7_4");
    obj.imageCheckBox52:setName("imageCheckBox52");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(804);
    obj.layout91:setTop(890);
    obj.layout91:setWidth(22);
    obj.layout91:setHeight(25);
    obj.layout91:setName("layout91");

    obj.imageCheckBox53 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox53:setParent(obj.layout91);
    obj.imageCheckBox53:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox53:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox53:setLeft(0);
    obj.imageCheckBox53:setTop(0);
    obj.imageCheckBox53:setWidth(22);
    obj.imageCheckBox53:setHeight(26);
    obj.imageCheckBox53:setField("Perícias_7_3");
    obj.imageCheckBox53:setName("imageCheckBox53");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(784);
    obj.layout92:setTop(890);
    obj.layout92:setWidth(22);
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.imageCheckBox54 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox54:setParent(obj.layout92);
    obj.imageCheckBox54:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox54:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox54:setLeft(0);
    obj.imageCheckBox54:setTop(0);
    obj.imageCheckBox54:setWidth(22);
    obj.imageCheckBox54:setHeight(26);
    obj.imageCheckBox54:setField("Perícias_7_2");
    obj.imageCheckBox54:setName("imageCheckBox54");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(762);
    obj.layout93:setTop(890);
    obj.layout93:setWidth(22);
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.imageCheckBox55 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox55:setParent(obj.layout93);
    obj.imageCheckBox55:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox55:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox55:setLeft(0);
    obj.imageCheckBox55:setTop(0);
    obj.imageCheckBox55:setWidth(22);
    obj.imageCheckBox55:setHeight(26);
    obj.imageCheckBox55:setField("Perícias_7_1");
    obj.imageCheckBox55:setName("imageCheckBox55");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(452);
    obj.layout94:setTop(889);
    obj.layout94:setWidth(22);
    obj.layout94:setHeight(25);
    obj.layout94:setName("layout94");

    obj.imageCheckBox56 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox56:setParent(obj.layout94);
    obj.imageCheckBox56:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox56:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox56:setLeft(0);
    obj.imageCheckBox56:setTop(0);
    obj.imageCheckBox56:setWidth(22);
    obj.imageCheckBox56:setHeight(26);
    obj.imageCheckBox56:setField("Talentos_7_5");
    obj.imageCheckBox56:setName("imageCheckBox56");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(430);
    obj.layout95:setTop(889);
    obj.layout95:setWidth(22);
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.imageCheckBox57 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox57:setParent(obj.layout95);
    obj.imageCheckBox57:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox57:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox57:setLeft(0);
    obj.imageCheckBox57:setTop(0);
    obj.imageCheckBox57:setWidth(22);
    obj.imageCheckBox57:setHeight(26);
    obj.imageCheckBox57:setField("Talentos_7_4");
    obj.imageCheckBox57:setName("imageCheckBox57");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(409);
    obj.layout96:setTop(889);
    obj.layout96:setWidth(22);
    obj.layout96:setHeight(25);
    obj.layout96:setName("layout96");

    obj.imageCheckBox58 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox58:setParent(obj.layout96);
    obj.imageCheckBox58:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox58:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox58:setLeft(0);
    obj.imageCheckBox58:setTop(0);
    obj.imageCheckBox58:setWidth(22);
    obj.imageCheckBox58:setHeight(26);
    obj.imageCheckBox58:setField("Talentos_7_3");
    obj.imageCheckBox58:setName("imageCheckBox58");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(388);
    obj.layout97:setTop(889);
    obj.layout97:setWidth(22);
    obj.layout97:setHeight(25);
    obj.layout97:setName("layout97");

    obj.imageCheckBox59 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox59:setParent(obj.layout97);
    obj.imageCheckBox59:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox59:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox59:setLeft(0);
    obj.imageCheckBox59:setTop(0);
    obj.imageCheckBox59:setWidth(22);
    obj.imageCheckBox59:setHeight(26);
    obj.imageCheckBox59:setField("Talentos_7_2");
    obj.imageCheckBox59:setName("imageCheckBox59");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(365);
    obj.layout98:setTop(889);
    obj.layout98:setWidth(22);
    obj.layout98:setHeight(25);
    obj.layout98:setName("layout98");

    obj.imageCheckBox60 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox60:setParent(obj.layout98);
    obj.imageCheckBox60:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox60:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox60:setLeft(0);
    obj.imageCheckBox60:setTop(0);
    obj.imageCheckBox60:setWidth(22);
    obj.imageCheckBox60:setHeight(26);
    obj.imageCheckBox60:setField("Talentos_7_1");
    obj.imageCheckBox60:setName("imageCheckBox60");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(1243);
    obj.layout99:setTop(858);
    obj.layout99:setWidth(22);
    obj.layout99:setHeight(25);
    obj.layout99:setName("layout99");

    obj.imageCheckBox61 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox61:setParent(obj.layout99);
    obj.imageCheckBox61:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox61:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox61:setLeft(0);
    obj.imageCheckBox61:setTop(0);
    obj.imageCheckBox61:setWidth(22);
    obj.imageCheckBox61:setHeight(26);
    obj.imageCheckBox61:setField("Conhecimentos_6_5");
    obj.imageCheckBox61:setName("imageCheckBox61");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(1223);
    obj.layout100:setTop(858);
    obj.layout100:setWidth(22);
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.imageCheckBox62 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox62:setParent(obj.layout100);
    obj.imageCheckBox62:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox62:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox62:setLeft(0);
    obj.imageCheckBox62:setTop(0);
    obj.imageCheckBox62:setWidth(22);
    obj.imageCheckBox62:setHeight(26);
    obj.imageCheckBox62:setField("Conhecimentos_6_4");
    obj.imageCheckBox62:setName("imageCheckBox62");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(1201);
    obj.layout101:setTop(858);
    obj.layout101:setWidth(22);
    obj.layout101:setHeight(25);
    obj.layout101:setName("layout101");

    obj.imageCheckBox63 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox63:setParent(obj.layout101);
    obj.imageCheckBox63:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox63:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox63:setLeft(0);
    obj.imageCheckBox63:setTop(0);
    obj.imageCheckBox63:setWidth(22);
    obj.imageCheckBox63:setHeight(26);
    obj.imageCheckBox63:setField("Conhecimentos_6_3");
    obj.imageCheckBox63:setName("imageCheckBox63");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(1181);
    obj.layout102:setTop(858);
    obj.layout102:setWidth(22);
    obj.layout102:setHeight(25);
    obj.layout102:setName("layout102");

    obj.imageCheckBox64 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox64:setParent(obj.layout102);
    obj.imageCheckBox64:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox64:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox64:setLeft(0);
    obj.imageCheckBox64:setTop(0);
    obj.imageCheckBox64:setWidth(22);
    obj.imageCheckBox64:setHeight(26);
    obj.imageCheckBox64:setField("Conhecimentos_6_2");
    obj.imageCheckBox64:setName("imageCheckBox64");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(1159);
    obj.layout103:setTop(858);
    obj.layout103:setWidth(22);
    obj.layout103:setHeight(25);
    obj.layout103:setName("layout103");

    obj.imageCheckBox65 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox65:setParent(obj.layout103);
    obj.imageCheckBox65:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox65:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox65:setLeft(0);
    obj.imageCheckBox65:setTop(0);
    obj.imageCheckBox65:setWidth(22);
    obj.imageCheckBox65:setHeight(26);
    obj.imageCheckBox65:setField("Conhecimentos_6_1");
    obj.imageCheckBox65:setName("imageCheckBox65");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(848);
    obj.layout104:setTop(857);
    obj.layout104:setWidth(22);
    obj.layout104:setHeight(25);
    obj.layout104:setName("layout104");

    obj.imageCheckBox66 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox66:setParent(obj.layout104);
    obj.imageCheckBox66:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox66:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox66:setLeft(0);
    obj.imageCheckBox66:setTop(0);
    obj.imageCheckBox66:setWidth(22);
    obj.imageCheckBox66:setHeight(26);
    obj.imageCheckBox66:setField("Perícias_6_5");
    obj.imageCheckBox66:setName("imageCheckBox66");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(826);
    obj.layout105:setTop(857);
    obj.layout105:setWidth(22);
    obj.layout105:setHeight(25);
    obj.layout105:setName("layout105");

    obj.imageCheckBox67 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox67:setParent(obj.layout105);
    obj.imageCheckBox67:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox67:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox67:setLeft(0);
    obj.imageCheckBox67:setTop(0);
    obj.imageCheckBox67:setWidth(22);
    obj.imageCheckBox67:setHeight(26);
    obj.imageCheckBox67:setField("Perícias_6_4");
    obj.imageCheckBox67:setName("imageCheckBox67");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(804);
    obj.layout106:setTop(857);
    obj.layout106:setWidth(22);
    obj.layout106:setHeight(25);
    obj.layout106:setName("layout106");

    obj.imageCheckBox68 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox68:setParent(obj.layout106);
    obj.imageCheckBox68:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox68:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox68:setLeft(0);
    obj.imageCheckBox68:setTop(0);
    obj.imageCheckBox68:setWidth(22);
    obj.imageCheckBox68:setHeight(26);
    obj.imageCheckBox68:setField("Perícias_6_3");
    obj.imageCheckBox68:setName("imageCheckBox68");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(784);
    obj.layout107:setTop(857);
    obj.layout107:setWidth(22);
    obj.layout107:setHeight(25);
    obj.layout107:setName("layout107");

    obj.imageCheckBox69 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox69:setParent(obj.layout107);
    obj.imageCheckBox69:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox69:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox69:setLeft(0);
    obj.imageCheckBox69:setTop(0);
    obj.imageCheckBox69:setWidth(22);
    obj.imageCheckBox69:setHeight(26);
    obj.imageCheckBox69:setField("Perícias_6_2");
    obj.imageCheckBox69:setName("imageCheckBox69");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(762);
    obj.layout108:setTop(857);
    obj.layout108:setWidth(22);
    obj.layout108:setHeight(25);
    obj.layout108:setName("layout108");

    obj.imageCheckBox70 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox70:setParent(obj.layout108);
    obj.imageCheckBox70:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox70:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox70:setLeft(0);
    obj.imageCheckBox70:setTop(0);
    obj.imageCheckBox70:setWidth(22);
    obj.imageCheckBox70:setHeight(26);
    obj.imageCheckBox70:setField("Perícias_6_1");
    obj.imageCheckBox70:setName("imageCheckBox70");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(452);
    obj.layout109:setTop(857);
    obj.layout109:setWidth(22);
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.imageCheckBox71 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox71:setParent(obj.layout109);
    obj.imageCheckBox71:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox71:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox71:setLeft(0);
    obj.imageCheckBox71:setTop(0);
    obj.imageCheckBox71:setWidth(22);
    obj.imageCheckBox71:setHeight(26);
    obj.imageCheckBox71:setField("Talentos_6_5");
    obj.imageCheckBox71:setName("imageCheckBox71");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(430);
    obj.layout110:setTop(857);
    obj.layout110:setWidth(22);
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.imageCheckBox72 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox72:setParent(obj.layout110);
    obj.imageCheckBox72:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox72:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox72:setLeft(0);
    obj.imageCheckBox72:setTop(0);
    obj.imageCheckBox72:setWidth(22);
    obj.imageCheckBox72:setHeight(26);
    obj.imageCheckBox72:setField("Talentos_6_4");
    obj.imageCheckBox72:setName("imageCheckBox72");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle1);
    obj.layout111:setLeft(409);
    obj.layout111:setTop(857);
    obj.layout111:setWidth(22);
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.imageCheckBox73 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox73:setParent(obj.layout111);
    obj.imageCheckBox73:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox73:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox73:setLeft(0);
    obj.imageCheckBox73:setTop(0);
    obj.imageCheckBox73:setWidth(22);
    obj.imageCheckBox73:setHeight(26);
    obj.imageCheckBox73:setField("Talentos_6_3");
    obj.imageCheckBox73:setName("imageCheckBox73");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle1);
    obj.layout112:setLeft(365);
    obj.layout112:setTop(857);
    obj.layout112:setWidth(22);
    obj.layout112:setHeight(25);
    obj.layout112:setName("layout112");

    obj.imageCheckBox74 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox74:setParent(obj.layout112);
    obj.imageCheckBox74:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox74:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox74:setLeft(0);
    obj.imageCheckBox74:setTop(0);
    obj.imageCheckBox74:setWidth(22);
    obj.imageCheckBox74:setHeight(26);
    obj.imageCheckBox74:setField("Talentos_6_1");
    obj.imageCheckBox74:setName("imageCheckBox74");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle1);
    obj.layout113:setLeft(388);
    obj.layout113:setTop(857);
    obj.layout113:setWidth(22);
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.imageCheckBox75 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox75:setParent(obj.layout113);
    obj.imageCheckBox75:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox75:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox75:setLeft(0);
    obj.imageCheckBox75:setTop(0);
    obj.imageCheckBox75:setWidth(22);
    obj.imageCheckBox75:setHeight(26);
    obj.imageCheckBox75:setField("Talentos_6_2");
    obj.imageCheckBox75:setName("imageCheckBox75");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle1);
    obj.layout114:setLeft(1243);
    obj.layout114:setTop(825);
    obj.layout114:setWidth(22);
    obj.layout114:setHeight(25);
    obj.layout114:setName("layout114");

    obj.imageCheckBox76 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox76:setParent(obj.layout114);
    obj.imageCheckBox76:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox76:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox76:setLeft(0);
    obj.imageCheckBox76:setTop(0);
    obj.imageCheckBox76:setWidth(22);
    obj.imageCheckBox76:setHeight(26);
    obj.imageCheckBox76:setField("Conhecimentos_5_5");
    obj.imageCheckBox76:setName("imageCheckBox76");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setLeft(1223);
    obj.layout115:setTop(825);
    obj.layout115:setWidth(22);
    obj.layout115:setHeight(25);
    obj.layout115:setName("layout115");

    obj.imageCheckBox77 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox77:setParent(obj.layout115);
    obj.imageCheckBox77:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox77:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox77:setLeft(0);
    obj.imageCheckBox77:setTop(0);
    obj.imageCheckBox77:setWidth(22);
    obj.imageCheckBox77:setHeight(26);
    obj.imageCheckBox77:setField("Conhecimentos_5_4");
    obj.imageCheckBox77:setName("imageCheckBox77");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle1);
    obj.layout116:setLeft(1201);
    obj.layout116:setTop(825);
    obj.layout116:setWidth(22);
    obj.layout116:setHeight(25);
    obj.layout116:setName("layout116");

    obj.imageCheckBox78 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox78:setParent(obj.layout116);
    obj.imageCheckBox78:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox78:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox78:setLeft(0);
    obj.imageCheckBox78:setTop(0);
    obj.imageCheckBox78:setWidth(22);
    obj.imageCheckBox78:setHeight(26);
    obj.imageCheckBox78:setField("Conhecimentos_5_3");
    obj.imageCheckBox78:setName("imageCheckBox78");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle1);
    obj.layout117:setLeft(1181);
    obj.layout117:setTop(825);
    obj.layout117:setWidth(22);
    obj.layout117:setHeight(25);
    obj.layout117:setName("layout117");

    obj.imageCheckBox79 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox79:setParent(obj.layout117);
    obj.imageCheckBox79:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox79:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox79:setLeft(0);
    obj.imageCheckBox79:setTop(0);
    obj.imageCheckBox79:setWidth(22);
    obj.imageCheckBox79:setHeight(26);
    obj.imageCheckBox79:setField("Conhecimentos_5_2");
    obj.imageCheckBox79:setName("imageCheckBox79");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle1);
    obj.layout118:setLeft(1159);
    obj.layout118:setTop(825);
    obj.layout118:setWidth(22);
    obj.layout118:setHeight(25);
    obj.layout118:setName("layout118");

    obj.imageCheckBox80 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox80:setParent(obj.layout118);
    obj.imageCheckBox80:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox80:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox80:setLeft(0);
    obj.imageCheckBox80:setTop(0);
    obj.imageCheckBox80:setWidth(22);
    obj.imageCheckBox80:setHeight(26);
    obj.imageCheckBox80:setField("Conhecimentos_5_1");
    obj.imageCheckBox80:setName("imageCheckBox80");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle1);
    obj.layout119:setLeft(848);
    obj.layout119:setTop(824);
    obj.layout119:setWidth(22);
    obj.layout119:setHeight(25);
    obj.layout119:setName("layout119");

    obj.imageCheckBox81 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox81:setParent(obj.layout119);
    obj.imageCheckBox81:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox81:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox81:setLeft(0);
    obj.imageCheckBox81:setTop(0);
    obj.imageCheckBox81:setWidth(22);
    obj.imageCheckBox81:setHeight(26);
    obj.imageCheckBox81:setField("Perícias_5_5");
    obj.imageCheckBox81:setName("imageCheckBox81");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle1);
    obj.layout120:setLeft(826);
    obj.layout120:setTop(824);
    obj.layout120:setWidth(22);
    obj.layout120:setHeight(25);
    obj.layout120:setName("layout120");

    obj.imageCheckBox82 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox82:setParent(obj.layout120);
    obj.imageCheckBox82:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox82:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox82:setLeft(0);
    obj.imageCheckBox82:setTop(0);
    obj.imageCheckBox82:setWidth(22);
    obj.imageCheckBox82:setHeight(26);
    obj.imageCheckBox82:setField("Perícias_5_4");
    obj.imageCheckBox82:setName("imageCheckBox82");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle1);
    obj.layout121:setLeft(804);
    obj.layout121:setTop(824);
    obj.layout121:setWidth(22);
    obj.layout121:setHeight(25);
    obj.layout121:setName("layout121");

    obj.imageCheckBox83 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox83:setParent(obj.layout121);
    obj.imageCheckBox83:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox83:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox83:setLeft(0);
    obj.imageCheckBox83:setTop(0);
    obj.imageCheckBox83:setWidth(22);
    obj.imageCheckBox83:setHeight(26);
    obj.imageCheckBox83:setField("Perícias_5_3");
    obj.imageCheckBox83:setName("imageCheckBox83");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle1);
    obj.layout122:setLeft(784);
    obj.layout122:setTop(824);
    obj.layout122:setWidth(22);
    obj.layout122:setHeight(25);
    obj.layout122:setName("layout122");

    obj.imageCheckBox84 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox84:setParent(obj.layout122);
    obj.imageCheckBox84:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox84:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox84:setLeft(0);
    obj.imageCheckBox84:setTop(0);
    obj.imageCheckBox84:setWidth(22);
    obj.imageCheckBox84:setHeight(26);
    obj.imageCheckBox84:setField("Perícias_5_2");
    obj.imageCheckBox84:setName("imageCheckBox84");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle1);
    obj.layout123:setLeft(762);
    obj.layout123:setTop(824);
    obj.layout123:setWidth(22);
    obj.layout123:setHeight(25);
    obj.layout123:setName("layout123");

    obj.imageCheckBox85 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox85:setParent(obj.layout123);
    obj.imageCheckBox85:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox85:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox85:setLeft(0);
    obj.imageCheckBox85:setTop(0);
    obj.imageCheckBox85:setWidth(22);
    obj.imageCheckBox85:setHeight(26);
    obj.imageCheckBox85:setField("Perícias_5_1");
    obj.imageCheckBox85:setName("imageCheckBox85");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle1);
    obj.layout124:setLeft(452);
    obj.layout124:setTop(824);
    obj.layout124:setWidth(22);
    obj.layout124:setHeight(25);
    obj.layout124:setName("layout124");

    obj.imageCheckBox86 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox86:setParent(obj.layout124);
    obj.imageCheckBox86:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox86:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox86:setLeft(0);
    obj.imageCheckBox86:setTop(0);
    obj.imageCheckBox86:setWidth(22);
    obj.imageCheckBox86:setHeight(26);
    obj.imageCheckBox86:setField("Talentos_5_5");
    obj.imageCheckBox86:setName("imageCheckBox86");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle1);
    obj.layout125:setLeft(430);
    obj.layout125:setTop(824);
    obj.layout125:setWidth(22);
    obj.layout125:setHeight(25);
    obj.layout125:setName("layout125");

    obj.imageCheckBox87 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox87:setParent(obj.layout125);
    obj.imageCheckBox87:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox87:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox87:setLeft(0);
    obj.imageCheckBox87:setTop(0);
    obj.imageCheckBox87:setWidth(22);
    obj.imageCheckBox87:setHeight(26);
    obj.imageCheckBox87:setField("Talentos_5_4");
    obj.imageCheckBox87:setName("imageCheckBox87");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle1);
    obj.layout126:setLeft(409);
    obj.layout126:setTop(824);
    obj.layout126:setWidth(22);
    obj.layout126:setHeight(25);
    obj.layout126:setName("layout126");

    obj.imageCheckBox88 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox88:setParent(obj.layout126);
    obj.imageCheckBox88:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox88:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox88:setLeft(0);
    obj.imageCheckBox88:setTop(0);
    obj.imageCheckBox88:setWidth(22);
    obj.imageCheckBox88:setHeight(26);
    obj.imageCheckBox88:setField("Talentos_5_3");
    obj.imageCheckBox88:setName("imageCheckBox88");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle1);
    obj.layout127:setLeft(388);
    obj.layout127:setTop(824);
    obj.layout127:setWidth(22);
    obj.layout127:setHeight(25);
    obj.layout127:setName("layout127");

    obj.imageCheckBox89 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox89:setParent(obj.layout127);
    obj.imageCheckBox89:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox89:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox89:setLeft(0);
    obj.imageCheckBox89:setTop(0);
    obj.imageCheckBox89:setWidth(22);
    obj.imageCheckBox89:setHeight(26);
    obj.imageCheckBox89:setField("Talentos_5_2");
    obj.imageCheckBox89:setName("imageCheckBox89");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle1);
    obj.layout128:setLeft(365);
    obj.layout128:setTop(824);
    obj.layout128:setWidth(22);
    obj.layout128:setHeight(25);
    obj.layout128:setName("layout128");

    obj.imageCheckBox90 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox90:setParent(obj.layout128);
    obj.imageCheckBox90:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox90:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox90:setLeft(0);
    obj.imageCheckBox90:setTop(0);
    obj.imageCheckBox90:setWidth(22);
    obj.imageCheckBox90:setHeight(26);
    obj.imageCheckBox90:setField("Talentos_5_1");
    obj.imageCheckBox90:setName("imageCheckBox90");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setLeft(1243);
    obj.layout129:setTop(792);
    obj.layout129:setWidth(22);
    obj.layout129:setHeight(25);
    obj.layout129:setName("layout129");

    obj.imageCheckBox91 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox91:setParent(obj.layout129);
    obj.imageCheckBox91:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox91:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox91:setLeft(0);
    obj.imageCheckBox91:setTop(0);
    obj.imageCheckBox91:setWidth(22);
    obj.imageCheckBox91:setHeight(26);
    obj.imageCheckBox91:setField("Conhecimentos_4_5");
    obj.imageCheckBox91:setName("imageCheckBox91");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setLeft(1223);
    obj.layout130:setTop(792);
    obj.layout130:setWidth(22);
    obj.layout130:setHeight(25);
    obj.layout130:setName("layout130");

    obj.imageCheckBox92 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox92:setParent(obj.layout130);
    obj.imageCheckBox92:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox92:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox92:setLeft(0);
    obj.imageCheckBox92:setTop(0);
    obj.imageCheckBox92:setWidth(22);
    obj.imageCheckBox92:setHeight(26);
    obj.imageCheckBox92:setField("Conhecimentos_4_4");
    obj.imageCheckBox92:setName("imageCheckBox92");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setLeft(1201);
    obj.layout131:setTop(792);
    obj.layout131:setWidth(22);
    obj.layout131:setHeight(25);
    obj.layout131:setName("layout131");

    obj.imageCheckBox93 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox93:setParent(obj.layout131);
    obj.imageCheckBox93:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox93:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox93:setLeft(0);
    obj.imageCheckBox93:setTop(0);
    obj.imageCheckBox93:setWidth(22);
    obj.imageCheckBox93:setHeight(26);
    obj.imageCheckBox93:setField("Conhecimentos_4_3");
    obj.imageCheckBox93:setName("imageCheckBox93");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle1);
    obj.layout132:setLeft(1181);
    obj.layout132:setTop(792);
    obj.layout132:setWidth(22);
    obj.layout132:setHeight(25);
    obj.layout132:setName("layout132");

    obj.imageCheckBox94 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox94:setParent(obj.layout132);
    obj.imageCheckBox94:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox94:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox94:setLeft(0);
    obj.imageCheckBox94:setTop(0);
    obj.imageCheckBox94:setWidth(22);
    obj.imageCheckBox94:setHeight(26);
    obj.imageCheckBox94:setField("Conhecimentos_4_2");
    obj.imageCheckBox94:setName("imageCheckBox94");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle1);
    obj.layout133:setLeft(1159);
    obj.layout133:setTop(792);
    obj.layout133:setWidth(22);
    obj.layout133:setHeight(25);
    obj.layout133:setName("layout133");

    obj.imageCheckBox95 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox95:setParent(obj.layout133);
    obj.imageCheckBox95:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox95:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox95:setLeft(0);
    obj.imageCheckBox95:setTop(0);
    obj.imageCheckBox95:setWidth(22);
    obj.imageCheckBox95:setHeight(26);
    obj.imageCheckBox95:setField("Conhecimentos_4_1");
    obj.imageCheckBox95:setName("imageCheckBox95");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle1);
    obj.layout134:setLeft(848);
    obj.layout134:setTop(793);
    obj.layout134:setWidth(22);
    obj.layout134:setHeight(25);
    obj.layout134:setName("layout134");

    obj.imageCheckBox96 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox96:setParent(obj.layout134);
    obj.imageCheckBox96:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox96:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox96:setLeft(0);
    obj.imageCheckBox96:setTop(0);
    obj.imageCheckBox96:setWidth(22);
    obj.imageCheckBox96:setHeight(26);
    obj.imageCheckBox96:setField("Perícias_4_5");
    obj.imageCheckBox96:setName("imageCheckBox96");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle1);
    obj.layout135:setLeft(826);
    obj.layout135:setTop(793);
    obj.layout135:setWidth(22);
    obj.layout135:setHeight(25);
    obj.layout135:setName("layout135");

    obj.imageCheckBox97 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox97:setParent(obj.layout135);
    obj.imageCheckBox97:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox97:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox97:setLeft(0);
    obj.imageCheckBox97:setTop(0);
    obj.imageCheckBox97:setWidth(22);
    obj.imageCheckBox97:setHeight(26);
    obj.imageCheckBox97:setField("Perícias_4_4");
    obj.imageCheckBox97:setName("imageCheckBox97");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle1);
    obj.layout136:setLeft(804);
    obj.layout136:setTop(793);
    obj.layout136:setWidth(22);
    obj.layout136:setHeight(25);
    obj.layout136:setName("layout136");

    obj.imageCheckBox98 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox98:setParent(obj.layout136);
    obj.imageCheckBox98:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox98:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox98:setLeft(0);
    obj.imageCheckBox98:setTop(0);
    obj.imageCheckBox98:setWidth(22);
    obj.imageCheckBox98:setHeight(26);
    obj.imageCheckBox98:setField("Perícias_4_3");
    obj.imageCheckBox98:setName("imageCheckBox98");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle1);
    obj.layout137:setLeft(784);
    obj.layout137:setTop(793);
    obj.layout137:setWidth(22);
    obj.layout137:setHeight(25);
    obj.layout137:setName("layout137");

    obj.imageCheckBox99 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox99:setParent(obj.layout137);
    obj.imageCheckBox99:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox99:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox99:setLeft(0);
    obj.imageCheckBox99:setTop(0);
    obj.imageCheckBox99:setWidth(22);
    obj.imageCheckBox99:setHeight(26);
    obj.imageCheckBox99:setField("Perícias_4_2");
    obj.imageCheckBox99:setName("imageCheckBox99");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle1);
    obj.layout138:setLeft(762);
    obj.layout138:setTop(793);
    obj.layout138:setWidth(22);
    obj.layout138:setHeight(25);
    obj.layout138:setName("layout138");

    obj.imageCheckBox100 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox100:setParent(obj.layout138);
    obj.imageCheckBox100:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox100:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox100:setLeft(0);
    obj.imageCheckBox100:setTop(0);
    obj.imageCheckBox100:setWidth(22);
    obj.imageCheckBox100:setHeight(26);
    obj.imageCheckBox100:setField("Perícias_4_1");
    obj.imageCheckBox100:setName("imageCheckBox100");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle1);
    obj.layout139:setLeft(452);
    obj.layout139:setTop(793);
    obj.layout139:setWidth(22);
    obj.layout139:setHeight(25);
    obj.layout139:setName("layout139");

    obj.imageCheckBox101 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox101:setParent(obj.layout139);
    obj.imageCheckBox101:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox101:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox101:setLeft(0);
    obj.imageCheckBox101:setTop(0);
    obj.imageCheckBox101:setWidth(22);
    obj.imageCheckBox101:setHeight(26);
    obj.imageCheckBox101:setField("Talentos_4_5");
    obj.imageCheckBox101:setName("imageCheckBox101");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle1);
    obj.layout140:setLeft(430);
    obj.layout140:setTop(793);
    obj.layout140:setWidth(22);
    obj.layout140:setHeight(25);
    obj.layout140:setName("layout140");

    obj.imageCheckBox102 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox102:setParent(obj.layout140);
    obj.imageCheckBox102:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox102:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox102:setLeft(0);
    obj.imageCheckBox102:setTop(0);
    obj.imageCheckBox102:setWidth(22);
    obj.imageCheckBox102:setHeight(26);
    obj.imageCheckBox102:setField("Talentos_4_4");
    obj.imageCheckBox102:setName("imageCheckBox102");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle1);
    obj.layout141:setLeft(409);
    obj.layout141:setTop(793);
    obj.layout141:setWidth(22);
    obj.layout141:setHeight(25);
    obj.layout141:setName("layout141");

    obj.imageCheckBox103 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox103:setParent(obj.layout141);
    obj.imageCheckBox103:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox103:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox103:setLeft(0);
    obj.imageCheckBox103:setTop(0);
    obj.imageCheckBox103:setWidth(22);
    obj.imageCheckBox103:setHeight(26);
    obj.imageCheckBox103:setField("Talentos_4_3");
    obj.imageCheckBox103:setName("imageCheckBox103");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle1);
    obj.layout142:setLeft(388);
    obj.layout142:setTop(793);
    obj.layout142:setWidth(22);
    obj.layout142:setHeight(25);
    obj.layout142:setName("layout142");

    obj.imageCheckBox104 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox104:setParent(obj.layout142);
    obj.imageCheckBox104:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox104:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox104:setLeft(0);
    obj.imageCheckBox104:setTop(0);
    obj.imageCheckBox104:setWidth(22);
    obj.imageCheckBox104:setHeight(26);
    obj.imageCheckBox104:setField("Talentos_4_2");
    obj.imageCheckBox104:setName("imageCheckBox104");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle1);
    obj.layout143:setLeft(365);
    obj.layout143:setTop(793);
    obj.layout143:setWidth(22);
    obj.layout143:setHeight(25);
    obj.layout143:setName("layout143");

    obj.imageCheckBox105 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox105:setParent(obj.layout143);
    obj.imageCheckBox105:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox105:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox105:setLeft(0);
    obj.imageCheckBox105:setTop(0);
    obj.imageCheckBox105:setWidth(22);
    obj.imageCheckBox105:setHeight(26);
    obj.imageCheckBox105:setField("Talentos_4_1");
    obj.imageCheckBox105:setName("imageCheckBox105");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle1);
    obj.layout144:setLeft(1243);
    obj.layout144:setTop(759);
    obj.layout144:setWidth(22);
    obj.layout144:setHeight(25);
    obj.layout144:setName("layout144");

    obj.imageCheckBox106 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox106:setParent(obj.layout144);
    obj.imageCheckBox106:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox106:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox106:setLeft(0);
    obj.imageCheckBox106:setTop(0);
    obj.imageCheckBox106:setWidth(22);
    obj.imageCheckBox106:setHeight(26);
    obj.imageCheckBox106:setField("Conhecimentos_3_5");
    obj.imageCheckBox106:setName("imageCheckBox106");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle1);
    obj.layout145:setLeft(1223);
    obj.layout145:setTop(759);
    obj.layout145:setWidth(22);
    obj.layout145:setHeight(25);
    obj.layout145:setName("layout145");

    obj.imageCheckBox107 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox107:setParent(obj.layout145);
    obj.imageCheckBox107:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox107:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox107:setLeft(0);
    obj.imageCheckBox107:setTop(0);
    obj.imageCheckBox107:setWidth(22);
    obj.imageCheckBox107:setHeight(26);
    obj.imageCheckBox107:setField("Conhecimentos_3_4");
    obj.imageCheckBox107:setName("imageCheckBox107");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.rectangle1);
    obj.layout146:setLeft(1201);
    obj.layout146:setTop(759);
    obj.layout146:setWidth(22);
    obj.layout146:setHeight(25);
    obj.layout146:setName("layout146");

    obj.imageCheckBox108 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox108:setParent(obj.layout146);
    obj.imageCheckBox108:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox108:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox108:setLeft(0);
    obj.imageCheckBox108:setTop(0);
    obj.imageCheckBox108:setWidth(22);
    obj.imageCheckBox108:setHeight(26);
    obj.imageCheckBox108:setField("Conhecimentos_3_3");
    obj.imageCheckBox108:setName("imageCheckBox108");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.rectangle1);
    obj.layout147:setLeft(1178);
    obj.layout147:setTop(759);
    obj.layout147:setWidth(22);
    obj.layout147:setHeight(25);
    obj.layout147:setName("layout147");

    obj.imageCheckBox109 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox109:setParent(obj.layout147);
    obj.imageCheckBox109:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox109:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox109:setLeft(0);
    obj.imageCheckBox109:setTop(0);
    obj.imageCheckBox109:setWidth(22);
    obj.imageCheckBox109:setHeight(26);
    obj.imageCheckBox109:setField("Conhecimentos_3_2");
    obj.imageCheckBox109:setName("imageCheckBox109");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle1);
    obj.layout148:setLeft(1156);
    obj.layout148:setTop(759);
    obj.layout148:setWidth(22);
    obj.layout148:setHeight(25);
    obj.layout148:setName("layout148");

    obj.imageCheckBox110 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox110:setParent(obj.layout148);
    obj.imageCheckBox110:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox110:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox110:setLeft(0);
    obj.imageCheckBox110:setTop(0);
    obj.imageCheckBox110:setWidth(22);
    obj.imageCheckBox110:setHeight(26);
    obj.imageCheckBox110:setField("Conhecimentos_3_1");
    obj.imageCheckBox110:setName("imageCheckBox110");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle1);
    obj.layout149:setLeft(848);
    obj.layout149:setTop(760);
    obj.layout149:setWidth(22);
    obj.layout149:setHeight(25);
    obj.layout149:setName("layout149");

    obj.imageCheckBox111 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox111:setParent(obj.layout149);
    obj.imageCheckBox111:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox111:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox111:setLeft(0);
    obj.imageCheckBox111:setTop(0);
    obj.imageCheckBox111:setWidth(22);
    obj.imageCheckBox111:setHeight(26);
    obj.imageCheckBox111:setField("Perícias_3_5");
    obj.imageCheckBox111:setName("imageCheckBox111");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle1);
    obj.layout150:setLeft(826);
    obj.layout150:setTop(760);
    obj.layout150:setWidth(22);
    obj.layout150:setHeight(25);
    obj.layout150:setName("layout150");

    obj.imageCheckBox112 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox112:setParent(obj.layout150);
    obj.imageCheckBox112:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox112:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox112:setLeft(0);
    obj.imageCheckBox112:setTop(0);
    obj.imageCheckBox112:setWidth(22);
    obj.imageCheckBox112:setHeight(26);
    obj.imageCheckBox112:setField("Perícias_3_4");
    obj.imageCheckBox112:setName("imageCheckBox112");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.rectangle1);
    obj.layout151:setLeft(804);
    obj.layout151:setTop(760);
    obj.layout151:setWidth(22);
    obj.layout151:setHeight(25);
    obj.layout151:setName("layout151");

    obj.imageCheckBox113 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox113:setParent(obj.layout151);
    obj.imageCheckBox113:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox113:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox113:setLeft(0);
    obj.imageCheckBox113:setTop(0);
    obj.imageCheckBox113:setWidth(22);
    obj.imageCheckBox113:setHeight(26);
    obj.imageCheckBox113:setField("Perícias_3_3");
    obj.imageCheckBox113:setName("imageCheckBox113");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.rectangle1);
    obj.layout152:setLeft(784);
    obj.layout152:setTop(760);
    obj.layout152:setWidth(22);
    obj.layout152:setHeight(25);
    obj.layout152:setName("layout152");

    obj.imageCheckBox114 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox114:setParent(obj.layout152);
    obj.imageCheckBox114:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox114:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox114:setLeft(0);
    obj.imageCheckBox114:setTop(0);
    obj.imageCheckBox114:setWidth(22);
    obj.imageCheckBox114:setHeight(26);
    obj.imageCheckBox114:setField("Perícias_3_2");
    obj.imageCheckBox114:setName("imageCheckBox114");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle1);
    obj.layout153:setLeft(762);
    obj.layout153:setTop(760);
    obj.layout153:setWidth(22);
    obj.layout153:setHeight(25);
    obj.layout153:setName("layout153");

    obj.imageCheckBox115 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox115:setParent(obj.layout153);
    obj.imageCheckBox115:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox115:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox115:setLeft(0);
    obj.imageCheckBox115:setTop(0);
    obj.imageCheckBox115:setWidth(22);
    obj.imageCheckBox115:setHeight(26);
    obj.imageCheckBox115:setField("Perícias_3_1");
    obj.imageCheckBox115:setName("imageCheckBox115");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.rectangle1);
    obj.layout154:setLeft(452);
    obj.layout154:setTop(760);
    obj.layout154:setWidth(22);
    obj.layout154:setHeight(25);
    obj.layout154:setName("layout154");

    obj.imageCheckBox116 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox116:setParent(obj.layout154);
    obj.imageCheckBox116:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox116:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox116:setLeft(0);
    obj.imageCheckBox116:setTop(0);
    obj.imageCheckBox116:setWidth(22);
    obj.imageCheckBox116:setHeight(26);
    obj.imageCheckBox116:setField("Talentos_3_5");
    obj.imageCheckBox116:setName("imageCheckBox116");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.rectangle1);
    obj.layout155:setLeft(430);
    obj.layout155:setTop(760);
    obj.layout155:setWidth(22);
    obj.layout155:setHeight(25);
    obj.layout155:setName("layout155");

    obj.imageCheckBox117 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox117:setParent(obj.layout155);
    obj.imageCheckBox117:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox117:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox117:setLeft(0);
    obj.imageCheckBox117:setTop(0);
    obj.imageCheckBox117:setWidth(22);
    obj.imageCheckBox117:setHeight(26);
    obj.imageCheckBox117:setField("Talentos_3_4");
    obj.imageCheckBox117:setName("imageCheckBox117");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.rectangle1);
    obj.layout156:setLeft(409);
    obj.layout156:setTop(760);
    obj.layout156:setWidth(22);
    obj.layout156:setHeight(25);
    obj.layout156:setName("layout156");

    obj.imageCheckBox118 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox118:setParent(obj.layout156);
    obj.imageCheckBox118:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox118:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox118:setLeft(0);
    obj.imageCheckBox118:setTop(0);
    obj.imageCheckBox118:setWidth(22);
    obj.imageCheckBox118:setHeight(26);
    obj.imageCheckBox118:setField("Talentos_3_3");
    obj.imageCheckBox118:setName("imageCheckBox118");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.rectangle1);
    obj.layout157:setLeft(388);
    obj.layout157:setTop(760);
    obj.layout157:setWidth(22);
    obj.layout157:setHeight(25);
    obj.layout157:setName("layout157");

    obj.imageCheckBox119 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox119:setParent(obj.layout157);
    obj.imageCheckBox119:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox119:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox119:setLeft(0);
    obj.imageCheckBox119:setTop(0);
    obj.imageCheckBox119:setWidth(22);
    obj.imageCheckBox119:setHeight(26);
    obj.imageCheckBox119:setField("Talentos_3_2");
    obj.imageCheckBox119:setName("imageCheckBox119");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.rectangle1);
    obj.layout158:setLeft(365);
    obj.layout158:setTop(760);
    obj.layout158:setWidth(22);
    obj.layout158:setHeight(25);
    obj.layout158:setName("layout158");

    obj.imageCheckBox120 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox120:setParent(obj.layout158);
    obj.imageCheckBox120:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox120:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox120:setLeft(0);
    obj.imageCheckBox120:setTop(0);
    obj.imageCheckBox120:setWidth(22);
    obj.imageCheckBox120:setHeight(26);
    obj.imageCheckBox120:setField("Talentos_3_1");
    obj.imageCheckBox120:setName("imageCheckBox120");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.rectangle1);
    obj.layout159:setLeft(1243);
    obj.layout159:setTop(727);
    obj.layout159:setWidth(22);
    obj.layout159:setHeight(25);
    obj.layout159:setName("layout159");

    obj.imageCheckBox121 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox121:setParent(obj.layout159);
    obj.imageCheckBox121:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox121:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox121:setLeft(0);
    obj.imageCheckBox121:setTop(0);
    obj.imageCheckBox121:setWidth(22);
    obj.imageCheckBox121:setHeight(26);
    obj.imageCheckBox121:setField("Conhecimentos_2_5");
    obj.imageCheckBox121:setName("imageCheckBox121");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.rectangle1);
    obj.layout160:setLeft(1223);
    obj.layout160:setTop(727);
    obj.layout160:setWidth(22);
    obj.layout160:setHeight(25);
    obj.layout160:setName("layout160");

    obj.imageCheckBox122 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox122:setParent(obj.layout160);
    obj.imageCheckBox122:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox122:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox122:setLeft(0);
    obj.imageCheckBox122:setTop(0);
    obj.imageCheckBox122:setWidth(22);
    obj.imageCheckBox122:setHeight(26);
    obj.imageCheckBox122:setField("Conhecimentos_2_4");
    obj.imageCheckBox122:setName("imageCheckBox122");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.rectangle1);
    obj.layout161:setLeft(1201);
    obj.layout161:setTop(727);
    obj.layout161:setWidth(22);
    obj.layout161:setHeight(25);
    obj.layout161:setName("layout161");

    obj.imageCheckBox123 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox123:setParent(obj.layout161);
    obj.imageCheckBox123:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox123:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox123:setLeft(0);
    obj.imageCheckBox123:setTop(0);
    obj.imageCheckBox123:setWidth(22);
    obj.imageCheckBox123:setHeight(26);
    obj.imageCheckBox123:setField("Conhecimentos_2_3");
    obj.imageCheckBox123:setName("imageCheckBox123");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.rectangle1);
    obj.layout162:setLeft(1181);
    obj.layout162:setTop(727);
    obj.layout162:setWidth(22);
    obj.layout162:setHeight(25);
    obj.layout162:setName("layout162");

    obj.imageCheckBox124 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox124:setParent(obj.layout162);
    obj.imageCheckBox124:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox124:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox124:setLeft(0);
    obj.imageCheckBox124:setTop(0);
    obj.imageCheckBox124:setWidth(22);
    obj.imageCheckBox124:setHeight(26);
    obj.imageCheckBox124:setField("Conhecimentos_2_2");
    obj.imageCheckBox124:setName("imageCheckBox124");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.rectangle1);
    obj.layout163:setLeft(1159);
    obj.layout163:setTop(727);
    obj.layout163:setWidth(22);
    obj.layout163:setHeight(25);
    obj.layout163:setName("layout163");

    obj.imageCheckBox125 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox125:setParent(obj.layout163);
    obj.imageCheckBox125:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox125:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox125:setLeft(0);
    obj.imageCheckBox125:setTop(0);
    obj.imageCheckBox125:setWidth(22);
    obj.imageCheckBox125:setHeight(26);
    obj.imageCheckBox125:setField("Conhecimentos_2_1");
    obj.imageCheckBox125:setName("imageCheckBox125");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.rectangle1);
    obj.layout164:setLeft(848);
    obj.layout164:setTop(728);
    obj.layout164:setWidth(22);
    obj.layout164:setHeight(25);
    obj.layout164:setName("layout164");

    obj.imageCheckBox126 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox126:setParent(obj.layout164);
    obj.imageCheckBox126:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox126:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox126:setLeft(0);
    obj.imageCheckBox126:setTop(0);
    obj.imageCheckBox126:setWidth(22);
    obj.imageCheckBox126:setHeight(26);
    obj.imageCheckBox126:setField("Perícias_2_5");
    obj.imageCheckBox126:setName("imageCheckBox126");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.rectangle1);
    obj.layout165:setLeft(826);
    obj.layout165:setTop(728);
    obj.layout165:setWidth(22);
    obj.layout165:setHeight(25);
    obj.layout165:setName("layout165");

    obj.imageCheckBox127 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox127:setParent(obj.layout165);
    obj.imageCheckBox127:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox127:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox127:setLeft(0);
    obj.imageCheckBox127:setTop(0);
    obj.imageCheckBox127:setWidth(22);
    obj.imageCheckBox127:setHeight(26);
    obj.imageCheckBox127:setField("Perícias_2_4");
    obj.imageCheckBox127:setName("imageCheckBox127");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.rectangle1);
    obj.layout166:setLeft(804);
    obj.layout166:setTop(728);
    obj.layout166:setWidth(22);
    obj.layout166:setHeight(25);
    obj.layout166:setName("layout166");

    obj.imageCheckBox128 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox128:setParent(obj.layout166);
    obj.imageCheckBox128:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox128:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox128:setLeft(0);
    obj.imageCheckBox128:setTop(0);
    obj.imageCheckBox128:setWidth(22);
    obj.imageCheckBox128:setHeight(26);
    obj.imageCheckBox128:setField("Perícias_2_3");
    obj.imageCheckBox128:setName("imageCheckBox128");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.rectangle1);
    obj.layout167:setLeft(784);
    obj.layout167:setTop(728);
    obj.layout167:setWidth(22);
    obj.layout167:setHeight(25);
    obj.layout167:setName("layout167");

    obj.imageCheckBox129 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox129:setParent(obj.layout167);
    obj.imageCheckBox129:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox129:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox129:setLeft(0);
    obj.imageCheckBox129:setTop(0);
    obj.imageCheckBox129:setWidth(22);
    obj.imageCheckBox129:setHeight(26);
    obj.imageCheckBox129:setField("Perícias_2_2");
    obj.imageCheckBox129:setName("imageCheckBox129");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.rectangle1);
    obj.layout168:setLeft(762);
    obj.layout168:setTop(728);
    obj.layout168:setWidth(22);
    obj.layout168:setHeight(25);
    obj.layout168:setName("layout168");

    obj.imageCheckBox130 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox130:setParent(obj.layout168);
    obj.imageCheckBox130:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox130:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox130:setLeft(0);
    obj.imageCheckBox130:setTop(0);
    obj.imageCheckBox130:setWidth(22);
    obj.imageCheckBox130:setHeight(26);
    obj.imageCheckBox130:setField("Perícias_2_1");
    obj.imageCheckBox130:setName("imageCheckBox130");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.rectangle1);
    obj.layout169:setLeft(452);
    obj.layout169:setTop(727);
    obj.layout169:setWidth(22);
    obj.layout169:setHeight(25);
    obj.layout169:setName("layout169");

    obj.imageCheckBox131 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox131:setParent(obj.layout169);
    obj.imageCheckBox131:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox131:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox131:setLeft(0);
    obj.imageCheckBox131:setTop(0);
    obj.imageCheckBox131:setWidth(22);
    obj.imageCheckBox131:setHeight(26);
    obj.imageCheckBox131:setField("Talentos_2_5");
    obj.imageCheckBox131:setName("imageCheckBox131");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.rectangle1);
    obj.layout170:setLeft(430);
    obj.layout170:setTop(727);
    obj.layout170:setWidth(22);
    obj.layout170:setHeight(25);
    obj.layout170:setName("layout170");

    obj.imageCheckBox132 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox132:setParent(obj.layout170);
    obj.imageCheckBox132:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox132:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox132:setLeft(0);
    obj.imageCheckBox132:setTop(0);
    obj.imageCheckBox132:setWidth(22);
    obj.imageCheckBox132:setHeight(26);
    obj.imageCheckBox132:setField("Talentos_2_4");
    obj.imageCheckBox132:setName("imageCheckBox132");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.rectangle1);
    obj.layout171:setLeft(409);
    obj.layout171:setTop(727);
    obj.layout171:setWidth(22);
    obj.layout171:setHeight(25);
    obj.layout171:setName("layout171");

    obj.imageCheckBox133 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox133:setParent(obj.layout171);
    obj.imageCheckBox133:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox133:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox133:setLeft(0);
    obj.imageCheckBox133:setTop(0);
    obj.imageCheckBox133:setWidth(22);
    obj.imageCheckBox133:setHeight(26);
    obj.imageCheckBox133:setField("Talentos_2_3");
    obj.imageCheckBox133:setName("imageCheckBox133");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.rectangle1);
    obj.layout172:setLeft(388);
    obj.layout172:setTop(727);
    obj.layout172:setWidth(22);
    obj.layout172:setHeight(25);
    obj.layout172:setName("layout172");

    obj.imageCheckBox134 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox134:setParent(obj.layout172);
    obj.imageCheckBox134:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox134:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox134:setLeft(0);
    obj.imageCheckBox134:setTop(0);
    obj.imageCheckBox134:setWidth(22);
    obj.imageCheckBox134:setHeight(26);
    obj.imageCheckBox134:setField("Talentos_2_2");
    obj.imageCheckBox134:setName("imageCheckBox134");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.rectangle1);
    obj.layout173:setLeft(365);
    obj.layout173:setTop(727);
    obj.layout173:setWidth(22);
    obj.layout173:setHeight(25);
    obj.layout173:setName("layout173");

    obj.imageCheckBox135 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox135:setParent(obj.layout173);
    obj.imageCheckBox135:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox135:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox135:setLeft(0);
    obj.imageCheckBox135:setTop(0);
    obj.imageCheckBox135:setWidth(22);
    obj.imageCheckBox135:setHeight(26);
    obj.imageCheckBox135:setField("Talentos_2_1");
    obj.imageCheckBox135:setName("imageCheckBox135");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.rectangle1);
    obj.layout174:setLeft(1243);
    obj.layout174:setTop(694);
    obj.layout174:setWidth(22);
    obj.layout174:setHeight(25);
    obj.layout174:setName("layout174");

    obj.imageCheckBox136 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox136:setParent(obj.layout174);
    obj.imageCheckBox136:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox136:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox136:setLeft(0);
    obj.imageCheckBox136:setTop(0);
    obj.imageCheckBox136:setWidth(22);
    obj.imageCheckBox136:setHeight(26);
    obj.imageCheckBox136:setField("Conhecimentos_1_5");
    obj.imageCheckBox136:setName("imageCheckBox136");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.rectangle1);
    obj.layout175:setLeft(1223);
    obj.layout175:setTop(694);
    obj.layout175:setWidth(22);
    obj.layout175:setHeight(25);
    obj.layout175:setName("layout175");

    obj.imageCheckBox137 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox137:setParent(obj.layout175);
    obj.imageCheckBox137:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox137:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox137:setLeft(0);
    obj.imageCheckBox137:setTop(0);
    obj.imageCheckBox137:setWidth(22);
    obj.imageCheckBox137:setHeight(26);
    obj.imageCheckBox137:setField("Conhecimentos__1_4");
    obj.imageCheckBox137:setName("imageCheckBox137");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.rectangle1);
    obj.layout176:setLeft(1201);
    obj.layout176:setTop(694);
    obj.layout176:setWidth(22);
    obj.layout176:setHeight(25);
    obj.layout176:setName("layout176");

    obj.imageCheckBox138 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox138:setParent(obj.layout176);
    obj.imageCheckBox138:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox138:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox138:setLeft(0);
    obj.imageCheckBox138:setTop(0);
    obj.imageCheckBox138:setWidth(22);
    obj.imageCheckBox138:setHeight(26);
    obj.imageCheckBox138:setField("Conhecimentos__1_3");
    obj.imageCheckBox138:setName("imageCheckBox138");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.rectangle1);
    obj.layout177:setLeft(1181);
    obj.layout177:setTop(694);
    obj.layout177:setWidth(22);
    obj.layout177:setHeight(25);
    obj.layout177:setName("layout177");

    obj.imageCheckBox139 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox139:setParent(obj.layout177);
    obj.imageCheckBox139:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox139:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox139:setLeft(0);
    obj.imageCheckBox139:setTop(0);
    obj.imageCheckBox139:setWidth(22);
    obj.imageCheckBox139:setHeight(26);
    obj.imageCheckBox139:setField("Conhecimentos__1_2");
    obj.imageCheckBox139:setName("imageCheckBox139");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.rectangle1);
    obj.layout178:setLeft(1159);
    obj.layout178:setTop(694);
    obj.layout178:setWidth(22);
    obj.layout178:setHeight(25);
    obj.layout178:setName("layout178");

    obj.imageCheckBox140 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox140:setParent(obj.layout178);
    obj.imageCheckBox140:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox140:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox140:setLeft(0);
    obj.imageCheckBox140:setTop(0);
    obj.imageCheckBox140:setWidth(22);
    obj.imageCheckBox140:setHeight(26);
    obj.imageCheckBox140:setField("Conhecimentos_1_1");
    obj.imageCheckBox140:setName("imageCheckBox140");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.rectangle1);
    obj.layout179:setLeft(848);
    obj.layout179:setTop(695);
    obj.layout179:setWidth(22);
    obj.layout179:setHeight(25);
    obj.layout179:setName("layout179");

    obj.imageCheckBox141 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox141:setParent(obj.layout179);
    obj.imageCheckBox141:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox141:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox141:setLeft(0);
    obj.imageCheckBox141:setTop(0);
    obj.imageCheckBox141:setWidth(22);
    obj.imageCheckBox141:setHeight(26);
    obj.imageCheckBox141:setField("Perícias_1_5");
    obj.imageCheckBox141:setName("imageCheckBox141");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.rectangle1);
    obj.layout180:setLeft(826);
    obj.layout180:setTop(695);
    obj.layout180:setWidth(22);
    obj.layout180:setHeight(25);
    obj.layout180:setName("layout180");

    obj.imageCheckBox142 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox142:setParent(obj.layout180);
    obj.imageCheckBox142:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox142:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox142:setLeft(0);
    obj.imageCheckBox142:setTop(0);
    obj.imageCheckBox142:setWidth(22);
    obj.imageCheckBox142:setHeight(26);
    obj.imageCheckBox142:setField("Perícias__1_4");
    obj.imageCheckBox142:setName("imageCheckBox142");

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.rectangle1);
    obj.layout181:setLeft(804);
    obj.layout181:setTop(695);
    obj.layout181:setWidth(22);
    obj.layout181:setHeight(25);
    obj.layout181:setName("layout181");

    obj.imageCheckBox143 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox143:setParent(obj.layout181);
    obj.imageCheckBox143:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox143:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox143:setLeft(0);
    obj.imageCheckBox143:setTop(0);
    obj.imageCheckBox143:setWidth(22);
    obj.imageCheckBox143:setHeight(26);
    obj.imageCheckBox143:setField("Perícias__1_3");
    obj.imageCheckBox143:setName("imageCheckBox143");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.rectangle1);
    obj.layout182:setLeft(784);
    obj.layout182:setTop(695);
    obj.layout182:setWidth(22);
    obj.layout182:setHeight(25);
    obj.layout182:setName("layout182");

    obj.imageCheckBox144 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox144:setParent(obj.layout182);
    obj.imageCheckBox144:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox144:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox144:setLeft(0);
    obj.imageCheckBox144:setTop(0);
    obj.imageCheckBox144:setWidth(22);
    obj.imageCheckBox144:setHeight(26);
    obj.imageCheckBox144:setField("Perícias__1_2");
    obj.imageCheckBox144:setName("imageCheckBox144");

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.rectangle1);
    obj.layout183:setLeft(762);
    obj.layout183:setTop(695);
    obj.layout183:setWidth(22);
    obj.layout183:setHeight(25);
    obj.layout183:setName("layout183");

    obj.imageCheckBox145 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox145:setParent(obj.layout183);
    obj.imageCheckBox145:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox145:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox145:setLeft(0);
    obj.imageCheckBox145:setTop(0);
    obj.imageCheckBox145:setWidth(22);
    obj.imageCheckBox145:setHeight(26);
    obj.imageCheckBox145:setField("Perícias_1_1");
    obj.imageCheckBox145:setName("imageCheckBox145");

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.rectangle1);
    obj.layout184:setLeft(452);
    obj.layout184:setTop(695);
    obj.layout184:setWidth(22);
    obj.layout184:setHeight(25);
    obj.layout184:setName("layout184");

    obj.imageCheckBox146 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox146:setParent(obj.layout184);
    obj.imageCheckBox146:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox146:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox146:setLeft(0);
    obj.imageCheckBox146:setTop(0);
    obj.imageCheckBox146:setWidth(22);
    obj.imageCheckBox146:setHeight(26);
    obj.imageCheckBox146:setField("Talentos_1_5");
    obj.imageCheckBox146:setName("imageCheckBox146");

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.rectangle1);
    obj.layout185:setLeft(430);
    obj.layout185:setTop(695);
    obj.layout185:setWidth(22);
    obj.layout185:setHeight(25);
    obj.layout185:setName("layout185");

    obj.imageCheckBox147 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox147:setParent(obj.layout185);
    obj.imageCheckBox147:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox147:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox147:setLeft(0);
    obj.imageCheckBox147:setTop(0);
    obj.imageCheckBox147:setWidth(22);
    obj.imageCheckBox147:setHeight(26);
    obj.imageCheckBox147:setField("Talentos_1_4");
    obj.imageCheckBox147:setName("imageCheckBox147");

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.rectangle1);
    obj.layout186:setLeft(409);
    obj.layout186:setTop(695);
    obj.layout186:setWidth(22);
    obj.layout186:setHeight(25);
    obj.layout186:setName("layout186");

    obj.imageCheckBox148 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox148:setParent(obj.layout186);
    obj.imageCheckBox148:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox148:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox148:setLeft(0);
    obj.imageCheckBox148:setTop(0);
    obj.imageCheckBox148:setWidth(22);
    obj.imageCheckBox148:setHeight(26);
    obj.imageCheckBox148:setField("Talentos_1_3");
    obj.imageCheckBox148:setName("imageCheckBox148");

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.rectangle1);
    obj.layout187:setLeft(388);
    obj.layout187:setTop(694);
    obj.layout187:setWidth(22);
    obj.layout187:setHeight(25);
    obj.layout187:setName("layout187");

    obj.imageCheckBox149 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox149:setParent(obj.layout187);
    obj.imageCheckBox149:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox149:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox149:setLeft(0);
    obj.imageCheckBox149:setTop(0);
    obj.imageCheckBox149:setWidth(22);
    obj.imageCheckBox149:setHeight(26);
    obj.imageCheckBox149:setField("Talentos_1_2");
    obj.imageCheckBox149:setName("imageCheckBox149");

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.rectangle1);
    obj.layout188:setLeft(365);
    obj.layout188:setTop(695);
    obj.layout188:setWidth(22);
    obj.layout188:setHeight(25);
    obj.layout188:setName("layout188");

    obj.imageCheckBox150 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox150:setParent(obj.layout188);
    obj.imageCheckBox150:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox150:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox150:setLeft(0);
    obj.imageCheckBox150:setTop(0);
    obj.imageCheckBox150:setWidth(22);
    obj.imageCheckBox150:setHeight(26);
    obj.imageCheckBox150:setField("Talentos_1_1");
    obj.imageCheckBox150:setName("imageCheckBox150");

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.rectangle1);
    obj.layout189:setLeft(450);
    obj.layout189:setTop(560);
    obj.layout189:setWidth(22);
    obj.layout189:setHeight(25);
    obj.layout189:setName("layout189");

    obj.imageCheckBox151 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox151:setParent(obj.layout189);
    obj.imageCheckBox151:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox151:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox151:setLeft(0);
    obj.imageCheckBox151:setTop(0);
    obj.imageCheckBox151:setWidth(22);
    obj.imageCheckBox151:setHeight(26);
    obj.imageCheckBox151:setField("bfis15");
    obj.imageCheckBox151:setName("imageCheckBox151");

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.rectangle1);
    obj.layout190:setLeft(428);
    obj.layout190:setTop(560);
    obj.layout190:setWidth(22);
    obj.layout190:setHeight(25);
    obj.layout190:setName("layout190");

    obj.imageCheckBox152 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox152:setParent(obj.layout190);
    obj.imageCheckBox152:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox152:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox152:setLeft(0);
    obj.imageCheckBox152:setTop(0);
    obj.imageCheckBox152:setWidth(22);
    obj.imageCheckBox152:setHeight(26);
    obj.imageCheckBox152:setField("bfis14");
    obj.imageCheckBox152:setName("imageCheckBox152");

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.rectangle1);
    obj.layout191:setLeft(406);
    obj.layout191:setTop(560);
    obj.layout191:setWidth(22);
    obj.layout191:setHeight(25);
    obj.layout191:setName("layout191");

    obj.imageCheckBox153 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox153:setParent(obj.layout191);
    obj.imageCheckBox153:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox153:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox153:setLeft(0);
    obj.imageCheckBox153:setTop(0);
    obj.imageCheckBox153:setWidth(22);
    obj.imageCheckBox153:setHeight(26);
    obj.imageCheckBox153:setField("bfis13");
    obj.imageCheckBox153:setName("imageCheckBox153");

    obj.layout192 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.rectangle1);
    obj.layout192:setLeft(386);
    obj.layout192:setTop(560);
    obj.layout192:setWidth(22);
    obj.layout192:setHeight(25);
    obj.layout192:setName("layout192");

    obj.imageCheckBox154 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox154:setParent(obj.layout192);
    obj.imageCheckBox154:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox154:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox154:setLeft(0);
    obj.imageCheckBox154:setTop(0);
    obj.imageCheckBox154:setWidth(22);
    obj.imageCheckBox154:setHeight(26);
    obj.imageCheckBox154:setField("bfis12");
    obj.imageCheckBox154:setName("imageCheckBox154");

    obj.layout193 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.rectangle1);
    obj.layout193:setLeft(364);
    obj.layout193:setTop(560);
    obj.layout193:setWidth(22);
    obj.layout193:setHeight(25);
    obj.layout193:setName("layout193");

    obj.imageCheckBox155 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox155:setParent(obj.layout193);
    obj.imageCheckBox155:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox155:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox155:setLeft(0);
    obj.imageCheckBox155:setTop(0);
    obj.imageCheckBox155:setWidth(22);
    obj.imageCheckBox155:setHeight(26);
    obj.imageCheckBox155:setField("bfis11");
    obj.imageCheckBox155:setName("imageCheckBox155");

    obj.layout194 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.rectangle1);
    obj.layout194:setLeft(1243);
    obj.layout194:setTop(528);
    obj.layout194:setWidth(22);
    obj.layout194:setHeight(25);
    obj.layout194:setName("layout194");

    obj.imageCheckBox156 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox156:setParent(obj.layout194);
    obj.imageCheckBox156:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox156:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox156:setLeft(0);
    obj.imageCheckBox156:setTop(0);
    obj.imageCheckBox156:setWidth(22);
    obj.imageCheckBox156:setHeight(26);
    obj.imageCheckBox156:setField("Outras_carac__12_5");
    obj.imageCheckBox156:setName("imageCheckBox156");

    obj.layout195 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.rectangle1);
    obj.layout195:setLeft(1223);
    obj.layout195:setTop(528);
    obj.layout195:setWidth(22);
    obj.layout195:setHeight(25);
    obj.layout195:setName("layout195");

    obj.imageCheckBox157 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox157:setParent(obj.layout195);
    obj.imageCheckBox157:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox157:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox157:setLeft(0);
    obj.imageCheckBox157:setTop(0);
    obj.imageCheckBox157:setWidth(22);
    obj.imageCheckBox157:setHeight(26);
    obj.imageCheckBox157:setField("Outras_carac__12_4");
    obj.imageCheckBox157:setName("imageCheckBox157");

    obj.layout196 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.rectangle1);
    obj.layout196:setLeft(1201);
    obj.layout196:setTop(528);
    obj.layout196:setWidth(22);
    obj.layout196:setHeight(25);
    obj.layout196:setName("layout196");

    obj.imageCheckBox158 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox158:setParent(obj.layout196);
    obj.imageCheckBox158:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox158:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox158:setLeft(0);
    obj.imageCheckBox158:setTop(0);
    obj.imageCheckBox158:setWidth(22);
    obj.imageCheckBox158:setHeight(26);
    obj.imageCheckBox158:setField("Outras_carac__12_3");
    obj.imageCheckBox158:setName("imageCheckBox158");

    obj.layout197 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.rectangle1);
    obj.layout197:setLeft(1178);
    obj.layout197:setTop(528);
    obj.layout197:setWidth(22);
    obj.layout197:setHeight(25);
    obj.layout197:setName("layout197");

    obj.imageCheckBox159 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox159:setParent(obj.layout197);
    obj.imageCheckBox159:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox159:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox159:setLeft(0);
    obj.imageCheckBox159:setTop(0);
    obj.imageCheckBox159:setWidth(22);
    obj.imageCheckBox159:setHeight(26);
    obj.imageCheckBox159:setField("Outras_carac__12_2");
    obj.imageCheckBox159:setName("imageCheckBox159");

    obj.layout198 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.rectangle1);
    obj.layout198:setLeft(1158);
    obj.layout198:setTop(528);
    obj.layout198:setWidth(22);
    obj.layout198:setHeight(25);
    obj.layout198:setName("layout198");

    obj.imageCheckBox160 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox160:setParent(obj.layout198);
    obj.imageCheckBox160:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox160:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox160:setLeft(0);
    obj.imageCheckBox160:setTop(0);
    obj.imageCheckBox160:setWidth(22);
    obj.imageCheckBox160:setHeight(26);
    obj.imageCheckBox160:setField("Outras_carac__12_1");
    obj.imageCheckBox160:setName("imageCheckBox160");

    obj.layout199 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.rectangle1);
    obj.layout199:setLeft(846);
    obj.layout199:setTop(528);
    obj.layout199:setWidth(22);
    obj.layout199:setHeight(25);
    obj.layout199:setName("layout199");

    obj.imageCheckBox161 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox161:setParent(obj.layout199);
    obj.imageCheckBox161:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox161:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox161:setLeft(0);
    obj.imageCheckBox161:setTop(0);
    obj.imageCheckBox161:setWidth(22);
    obj.imageCheckBox161:setHeight(26);
    obj.imageCheckBox161:setField("Outras_carac__7_5");
    obj.imageCheckBox161:setName("imageCheckBox161");

    obj.layout200 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.rectangle1);
    obj.layout200:setLeft(826);
    obj.layout200:setTop(528);
    obj.layout200:setWidth(22);
    obj.layout200:setHeight(25);
    obj.layout200:setName("layout200");

    obj.imageCheckBox162 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox162:setParent(obj.layout200);
    obj.imageCheckBox162:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox162:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox162:setLeft(0);
    obj.imageCheckBox162:setTop(0);
    obj.imageCheckBox162:setWidth(22);
    obj.imageCheckBox162:setHeight(26);
    obj.imageCheckBox162:setField("Outras_carac__7_4");
    obj.imageCheckBox162:setName("imageCheckBox162");

    obj.layout201 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.rectangle1);
    obj.layout201:setLeft(804);
    obj.layout201:setTop(528);
    obj.layout201:setWidth(22);
    obj.layout201:setHeight(25);
    obj.layout201:setName("layout201");

    obj.imageCheckBox163 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox163:setParent(obj.layout201);
    obj.imageCheckBox163:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox163:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox163:setLeft(0);
    obj.imageCheckBox163:setTop(0);
    obj.imageCheckBox163:setWidth(22);
    obj.imageCheckBox163:setHeight(26);
    obj.imageCheckBox163:setField("Outras_carac__7_3");
    obj.imageCheckBox163:setName("imageCheckBox163");

    obj.layout202 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.rectangle1);
    obj.layout202:setLeft(784);
    obj.layout202:setTop(528);
    obj.layout202:setWidth(22);
    obj.layout202:setHeight(25);
    obj.layout202:setName("layout202");

    obj.imageCheckBox164 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox164:setParent(obj.layout202);
    obj.imageCheckBox164:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox164:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox164:setLeft(0);
    obj.imageCheckBox164:setTop(0);
    obj.imageCheckBox164:setWidth(22);
    obj.imageCheckBox164:setHeight(26);
    obj.imageCheckBox164:setField("Outras_carac__7_2");
    obj.imageCheckBox164:setName("imageCheckBox164");

    obj.layout203 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.rectangle1);
    obj.layout203:setLeft(762);
    obj.layout203:setTop(528);
    obj.layout203:setWidth(22);
    obj.layout203:setHeight(25);
    obj.layout203:setName("layout203");

    obj.imageCheckBox165 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox165:setParent(obj.layout203);
    obj.imageCheckBox165:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox165:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox165:setLeft(0);
    obj.imageCheckBox165:setTop(0);
    obj.imageCheckBox165:setWidth(22);
    obj.imageCheckBox165:setHeight(26);
    obj.imageCheckBox165:setField("Outras_carac__7_1");
    obj.imageCheckBox165:setName("imageCheckBox165");

    obj.layout204 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.rectangle1);
    obj.layout204:setLeft(450);
    obj.layout204:setTop(528);
    obj.layout204:setWidth(22);
    obj.layout204:setHeight(25);
    obj.layout204:setName("layout204");

    obj.imageCheckBox166 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox166:setParent(obj.layout204);
    obj.imageCheckBox166:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox166:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox166:setLeft(0);
    obj.imageCheckBox166:setTop(0);
    obj.imageCheckBox166:setWidth(22);
    obj.imageCheckBox166:setHeight(26);
    obj.imageCheckBox166:setField("bfis10");
    obj.imageCheckBox166:setName("imageCheckBox166");

    obj.layout205 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.rectangle1);
    obj.layout205:setLeft(428);
    obj.layout205:setTop(528);
    obj.layout205:setWidth(22);
    obj.layout205:setHeight(25);
    obj.layout205:setName("layout205");

    obj.imageCheckBox167 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox167:setParent(obj.layout205);
    obj.imageCheckBox167:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox167:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox167:setLeft(0);
    obj.imageCheckBox167:setTop(0);
    obj.imageCheckBox167:setWidth(22);
    obj.imageCheckBox167:setHeight(26);
    obj.imageCheckBox167:setField("bfis9");
    obj.imageCheckBox167:setName("imageCheckBox167");

    obj.layout206 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.rectangle1);
    obj.layout206:setLeft(406);
    obj.layout206:setTop(528);
    obj.layout206:setWidth(22);
    obj.layout206:setHeight(25);
    obj.layout206:setName("layout206");

    obj.imageCheckBox168 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox168:setParent(obj.layout206);
    obj.imageCheckBox168:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox168:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox168:setLeft(0);
    obj.imageCheckBox168:setTop(0);
    obj.imageCheckBox168:setWidth(22);
    obj.imageCheckBox168:setHeight(26);
    obj.imageCheckBox168:setField("bfis8");
    obj.imageCheckBox168:setName("imageCheckBox168");

    obj.layout207 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.rectangle1);
    obj.layout207:setLeft(386);
    obj.layout207:setTop(528);
    obj.layout207:setWidth(22);
    obj.layout207:setHeight(25);
    obj.layout207:setName("layout207");

    obj.imageCheckBox169 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox169:setParent(obj.layout207);
    obj.imageCheckBox169:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox169:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox169:setLeft(0);
    obj.imageCheckBox169:setTop(0);
    obj.imageCheckBox169:setWidth(22);
    obj.imageCheckBox169:setHeight(26);
    obj.imageCheckBox169:setField("bfis7");
    obj.imageCheckBox169:setName("imageCheckBox169");

    obj.layout208 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.rectangle1);
    obj.layout208:setLeft(364);
    obj.layout208:setTop(528);
    obj.layout208:setWidth(22);
    obj.layout208:setHeight(25);
    obj.layout208:setName("layout208");

    obj.imageCheckBox170 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox170:setParent(obj.layout208);
    obj.imageCheckBox170:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox170:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox170:setLeft(0);
    obj.imageCheckBox170:setTop(0);
    obj.imageCheckBox170:setWidth(22);
    obj.imageCheckBox170:setHeight(26);
    obj.imageCheckBox170:setField("bfis6");
    obj.imageCheckBox170:setName("imageCheckBox170");

    obj.layout209 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.rectangle1);
    obj.layout209:setLeft(1243);
    obj.layout209:setTop(495);
    obj.layout209:setWidth(22);
    obj.layout209:setHeight(25);
    obj.layout209:setName("layout209");

    obj.imageCheckBox171 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox171:setParent(obj.layout209);
    obj.imageCheckBox171:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox171:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox171:setLeft(0);
    obj.imageCheckBox171:setTop(0);
    obj.imageCheckBox171:setWidth(22);
    obj.imageCheckBox171:setHeight(26);
    obj.imageCheckBox171:setField("Outras_carac__11_5");
    obj.imageCheckBox171:setName("imageCheckBox171");

    obj.layout210 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.rectangle1);
    obj.layout210:setLeft(1223);
    obj.layout210:setTop(495);
    obj.layout210:setWidth(22);
    obj.layout210:setHeight(25);
    obj.layout210:setName("layout210");

    obj.imageCheckBox172 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox172:setParent(obj.layout210);
    obj.imageCheckBox172:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox172:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox172:setLeft(0);
    obj.imageCheckBox172:setTop(0);
    obj.imageCheckBox172:setWidth(22);
    obj.imageCheckBox172:setHeight(26);
    obj.imageCheckBox172:setField("Outras_carac__11_4");
    obj.imageCheckBox172:setName("imageCheckBox172");

    obj.layout211 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.rectangle1);
    obj.layout211:setLeft(1201);
    obj.layout211:setTop(495);
    obj.layout211:setWidth(22);
    obj.layout211:setHeight(25);
    obj.layout211:setName("layout211");

    obj.imageCheckBox173 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox173:setParent(obj.layout211);
    obj.imageCheckBox173:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox173:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox173:setLeft(0);
    obj.imageCheckBox173:setTop(0);
    obj.imageCheckBox173:setWidth(22);
    obj.imageCheckBox173:setHeight(26);
    obj.imageCheckBox173:setField("Outras_carac__11_3");
    obj.imageCheckBox173:setName("imageCheckBox173");

    obj.layout212 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.rectangle1);
    obj.layout212:setLeft(1178);
    obj.layout212:setTop(495);
    obj.layout212:setWidth(22);
    obj.layout212:setHeight(25);
    obj.layout212:setName("layout212");

    obj.imageCheckBox174 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox174:setParent(obj.layout212);
    obj.imageCheckBox174:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox174:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox174:setLeft(0);
    obj.imageCheckBox174:setTop(0);
    obj.imageCheckBox174:setWidth(22);
    obj.imageCheckBox174:setHeight(26);
    obj.imageCheckBox174:setField("Outras_carac__11_2");
    obj.imageCheckBox174:setName("imageCheckBox174");

    obj.layout213 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.rectangle1);
    obj.layout213:setLeft(1158);
    obj.layout213:setTop(495);
    obj.layout213:setWidth(22);
    obj.layout213:setHeight(25);
    obj.layout213:setName("layout213");

    obj.imageCheckBox175 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox175:setParent(obj.layout213);
    obj.imageCheckBox175:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox175:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox175:setLeft(0);
    obj.imageCheckBox175:setTop(0);
    obj.imageCheckBox175:setWidth(22);
    obj.imageCheckBox175:setHeight(26);
    obj.imageCheckBox175:setField("Outras_carac__11_1");
    obj.imageCheckBox175:setName("imageCheckBox175");

    obj.layout214 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.rectangle1);
    obj.layout214:setLeft(846);
    obj.layout214:setTop(495);
    obj.layout214:setWidth(22);
    obj.layout214:setHeight(25);
    obj.layout214:setName("layout214");

    obj.imageCheckBox176 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox176:setParent(obj.layout214);
    obj.imageCheckBox176:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox176:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox176:setLeft(0);
    obj.imageCheckBox176:setTop(0);
    obj.imageCheckBox176:setWidth(22);
    obj.imageCheckBox176:setHeight(26);
    obj.imageCheckBox176:setField("Outras_carac__6_5");
    obj.imageCheckBox176:setName("imageCheckBox176");

    obj.layout215 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.rectangle1);
    obj.layout215:setLeft(826);
    obj.layout215:setTop(495);
    obj.layout215:setWidth(22);
    obj.layout215:setHeight(25);
    obj.layout215:setName("layout215");

    obj.imageCheckBox177 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox177:setParent(obj.layout215);
    obj.imageCheckBox177:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox177:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox177:setLeft(0);
    obj.imageCheckBox177:setTop(0);
    obj.imageCheckBox177:setWidth(22);
    obj.imageCheckBox177:setHeight(26);
    obj.imageCheckBox177:setField("Outras_carac__6_4");
    obj.imageCheckBox177:setName("imageCheckBox177");

    obj.layout216 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.rectangle1);
    obj.layout216:setLeft(804);
    obj.layout216:setTop(495);
    obj.layout216:setWidth(22);
    obj.layout216:setHeight(25);
    obj.layout216:setName("layout216");

    obj.imageCheckBox178 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox178:setParent(obj.layout216);
    obj.imageCheckBox178:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox178:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox178:setLeft(0);
    obj.imageCheckBox178:setTop(0);
    obj.imageCheckBox178:setWidth(22);
    obj.imageCheckBox178:setHeight(26);
    obj.imageCheckBox178:setField("Outras_carac__6_3");
    obj.imageCheckBox178:setName("imageCheckBox178");

    obj.layout217 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.rectangle1);
    obj.layout217:setLeft(784);
    obj.layout217:setTop(495);
    obj.layout217:setWidth(22);
    obj.layout217:setHeight(25);
    obj.layout217:setName("layout217");

    obj.imageCheckBox179 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox179:setParent(obj.layout217);
    obj.imageCheckBox179:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox179:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox179:setLeft(0);
    obj.imageCheckBox179:setTop(0);
    obj.imageCheckBox179:setWidth(22);
    obj.imageCheckBox179:setHeight(26);
    obj.imageCheckBox179:setField("Outras_carac__6_2");
    obj.imageCheckBox179:setName("imageCheckBox179");

    obj.layout218 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.rectangle1);
    obj.layout218:setLeft(762);
    obj.layout218:setTop(495);
    obj.layout218:setWidth(22);
    obj.layout218:setHeight(25);
    obj.layout218:setName("layout218");

    obj.imageCheckBox180 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox180:setParent(obj.layout218);
    obj.imageCheckBox180:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox180:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox180:setLeft(0);
    obj.imageCheckBox180:setTop(0);
    obj.imageCheckBox180:setWidth(22);
    obj.imageCheckBox180:setHeight(26);
    obj.imageCheckBox180:setField("Outras_carac__6_1");
    obj.imageCheckBox180:setName("imageCheckBox180");

    obj.layout219 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.rectangle1);
    obj.layout219:setLeft(450);
    obj.layout219:setTop(495);
    obj.layout219:setWidth(22);
    obj.layout219:setHeight(25);
    obj.layout219:setName("layout219");

    obj.imageCheckBox181 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox181:setParent(obj.layout219);
    obj.imageCheckBox181:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox181:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox181:setLeft(0);
    obj.imageCheckBox181:setTop(0);
    obj.imageCheckBox181:setWidth(22);
    obj.imageCheckBox181:setHeight(26);
    obj.imageCheckBox181:setField("bfis5");
    obj.imageCheckBox181:setName("imageCheckBox181");

    obj.layout220 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.rectangle1);
    obj.layout220:setLeft(428);
    obj.layout220:setTop(495);
    obj.layout220:setWidth(22);
    obj.layout220:setHeight(25);
    obj.layout220:setName("layout220");

    obj.imageCheckBox182 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox182:setParent(obj.layout220);
    obj.imageCheckBox182:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox182:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox182:setLeft(0);
    obj.imageCheckBox182:setTop(0);
    obj.imageCheckBox182:setWidth(22);
    obj.imageCheckBox182:setHeight(26);
    obj.imageCheckBox182:setField("bfis4");
    obj.imageCheckBox182:setName("imageCheckBox182");

    obj.layout221 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.rectangle1);
    obj.layout221:setLeft(408);
    obj.layout221:setTop(495);
    obj.layout221:setWidth(22);
    obj.layout221:setHeight(25);
    obj.layout221:setName("layout221");

    obj.imageCheckBox183 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox183:setParent(obj.layout221);
    obj.imageCheckBox183:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox183:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox183:setLeft(0);
    obj.imageCheckBox183:setTop(0);
    obj.imageCheckBox183:setWidth(22);
    obj.imageCheckBox183:setHeight(26);
    obj.imageCheckBox183:setField("bfis3");
    obj.imageCheckBox183:setName("imageCheckBox183");

    obj.layout222 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.rectangle1);
    obj.layout222:setLeft(386);
    obj.layout222:setTop(495);
    obj.layout222:setWidth(22);
    obj.layout222:setHeight(25);
    obj.layout222:setName("layout222");

    obj.imageCheckBox184 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox184:setParent(obj.layout222);
    obj.imageCheckBox184:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox184:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox184:setLeft(0);
    obj.imageCheckBox184:setTop(0);
    obj.imageCheckBox184:setWidth(22);
    obj.imageCheckBox184:setHeight(26);
    obj.imageCheckBox184:setField("bfis2");
    obj.imageCheckBox184:setName("imageCheckBox184");

    obj.layout223 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout223:setParent(obj.rectangle1);
    obj.layout223:setLeft(366);
    obj.layout223:setTop(495);
    obj.layout223:setWidth(22);
    obj.layout223:setHeight(25);
    obj.layout223:setName("layout223");

    obj.imageCheckBox185 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox185:setParent(obj.layout223);
    obj.imageCheckBox185:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox185:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox185:setLeft(0);
    obj.imageCheckBox185:setTop(0);
    obj.imageCheckBox185:setWidth(22);
    obj.imageCheckBox185:setHeight(26);
    obj.imageCheckBox185:setField("bfis1");
    obj.imageCheckBox185:setName("imageCheckBox185");

    obj.layout224 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout224:setParent(obj.rectangle1);
    obj.layout224:setLeft(1243);
    obj.layout224:setTop(561);
    obj.layout224:setWidth(22);
    obj.layout224:setHeight(25);
    obj.layout224:setName("layout224");

    obj.imageCheckBox186 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox186:setParent(obj.layout224);
    obj.imageCheckBox186:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox186:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox186:setLeft(0);
    obj.imageCheckBox186:setTop(0);
    obj.imageCheckBox186:setWidth(22);
    obj.imageCheckBox186:setHeight(26);
    obj.imageCheckBox186:setField("Outras_carac__13_5");
    obj.imageCheckBox186:setName("imageCheckBox186");

    obj.layout225 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout225:setParent(obj.rectangle1);
    obj.layout225:setLeft(1221);
    obj.layout225:setTop(561);
    obj.layout225:setWidth(22);
    obj.layout225:setHeight(25);
    obj.layout225:setName("layout225");

    obj.imageCheckBox187 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox187:setParent(obj.layout225);
    obj.imageCheckBox187:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox187:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox187:setLeft(0);
    obj.imageCheckBox187:setTop(0);
    obj.imageCheckBox187:setWidth(22);
    obj.imageCheckBox187:setHeight(26);
    obj.imageCheckBox187:setField("Outras_carac__13_4");
    obj.imageCheckBox187:setName("imageCheckBox187");

    obj.layout226 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout226:setParent(obj.rectangle1);
    obj.layout226:setLeft(1201);
    obj.layout226:setTop(561);
    obj.layout226:setWidth(22);
    obj.layout226:setHeight(25);
    obj.layout226:setName("layout226");

    obj.imageCheckBox188 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox188:setParent(obj.layout226);
    obj.imageCheckBox188:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox188:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox188:setLeft(0);
    obj.imageCheckBox188:setTop(0);
    obj.imageCheckBox188:setWidth(22);
    obj.imageCheckBox188:setHeight(26);
    obj.imageCheckBox188:setField("Outras_carac__13_3");
    obj.imageCheckBox188:setName("imageCheckBox188");

    obj.layout227 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout227:setParent(obj.rectangle1);
    obj.layout227:setLeft(1178);
    obj.layout227:setTop(561);
    obj.layout227:setWidth(22);
    obj.layout227:setHeight(25);
    obj.layout227:setName("layout227");

    obj.imageCheckBox189 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox189:setParent(obj.layout227);
    obj.imageCheckBox189:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox189:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox189:setLeft(0);
    obj.imageCheckBox189:setTop(0);
    obj.imageCheckBox189:setWidth(22);
    obj.imageCheckBox189:setHeight(26);
    obj.imageCheckBox189:setField("Outras_carac__13_2");
    obj.imageCheckBox189:setName("imageCheckBox189");

    obj.layout228 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout228:setParent(obj.rectangle1);
    obj.layout228:setLeft(1158);
    obj.layout228:setTop(561);
    obj.layout228:setWidth(22);
    obj.layout228:setHeight(25);
    obj.layout228:setName("layout228");

    obj.imageCheckBox190 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox190:setParent(obj.layout228);
    obj.imageCheckBox190:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox190:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox190:setLeft(0);
    obj.imageCheckBox190:setTop(0);
    obj.imageCheckBox190:setWidth(22);
    obj.imageCheckBox190:setHeight(26);
    obj.imageCheckBox190:setField("Outras_carac__13_1");
    obj.imageCheckBox190:setName("imageCheckBox190");

    obj.layout229 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout229:setParent(obj.rectangle1);
    obj.layout229:setLeft(846);
    obj.layout229:setTop(561);
    obj.layout229:setWidth(22);
    obj.layout229:setHeight(25);
    obj.layout229:setName("layout229");

    obj.imageCheckBox191 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox191:setParent(obj.layout229);
    obj.imageCheckBox191:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox191:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox191:setLeft(0);
    obj.imageCheckBox191:setTop(0);
    obj.imageCheckBox191:setWidth(22);
    obj.imageCheckBox191:setHeight(26);
    obj.imageCheckBox191:setField("Outras_carac__8_5");
    obj.imageCheckBox191:setName("imageCheckBox191");

    obj.layout230 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout230:setParent(obj.rectangle1);
    obj.layout230:setLeft(826);
    obj.layout230:setTop(561);
    obj.layout230:setWidth(22);
    obj.layout230:setHeight(25);
    obj.layout230:setName("layout230");

    obj.imageCheckBox192 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox192:setParent(obj.layout230);
    obj.imageCheckBox192:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox192:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox192:setLeft(0);
    obj.imageCheckBox192:setTop(0);
    obj.imageCheckBox192:setWidth(22);
    obj.imageCheckBox192:setHeight(26);
    obj.imageCheckBox192:setField("Outras_carac__8_4");
    obj.imageCheckBox192:setName("imageCheckBox192");

    obj.layout231 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout231:setParent(obj.rectangle1);
    obj.layout231:setLeft(804);
    obj.layout231:setTop(561);
    obj.layout231:setWidth(22);
    obj.layout231:setHeight(25);
    obj.layout231:setName("layout231");

    obj.imageCheckBox193 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox193:setParent(obj.layout231);
    obj.imageCheckBox193:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox193:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox193:setLeft(0);
    obj.imageCheckBox193:setTop(0);
    obj.imageCheckBox193:setWidth(22);
    obj.imageCheckBox193:setHeight(26);
    obj.imageCheckBox193:setField("Outras_carac__8_3");
    obj.imageCheckBox193:setName("imageCheckBox193");

    obj.layout232 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout232:setParent(obj.rectangle1);
    obj.layout232:setLeft(784);
    obj.layout232:setTop(561);
    obj.layout232:setWidth(22);
    obj.layout232:setHeight(25);
    obj.layout232:setName("layout232");

    obj.imageCheckBox194 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox194:setParent(obj.layout232);
    obj.imageCheckBox194:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox194:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox194:setLeft(0);
    obj.imageCheckBox194:setTop(0);
    obj.imageCheckBox194:setWidth(22);
    obj.imageCheckBox194:setHeight(26);
    obj.imageCheckBox194:setField("Outras_carac__8_2");
    obj.imageCheckBox194:setName("imageCheckBox194");

    obj.layout233 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout233:setParent(obj.rectangle1);
    obj.layout233:setLeft(762);
    obj.layout233:setTop(561);
    obj.layout233:setWidth(22);
    obj.layout233:setHeight(25);
    obj.layout233:setName("layout233");

    obj.imageCheckBox195 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox195:setParent(obj.layout233);
    obj.imageCheckBox195:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox195:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox195:setLeft(0);
    obj.imageCheckBox195:setTop(0);
    obj.imageCheckBox195:setWidth(22);
    obj.imageCheckBox195:setHeight(26);
    obj.imageCheckBox195:setField("Outras_carac__8_1");
    obj.imageCheckBox195:setName("imageCheckBox195");

    obj.layout234 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout234:setParent(obj.rectangle1);
    obj.layout234:setLeft(365);
    obj.layout234:setTop(1123);
    obj.layout234:setWidth(22);
    obj.layout234:setHeight(25);
    obj.layout234:setName("layout234");

    obj.imageCheckBox196 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox196:setParent(obj.layout234);
    obj.imageCheckBox196:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox196:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox196:setLeft(0);
    obj.imageCheckBox196:setTop(0);
    obj.imageCheckBox196:setWidth(22);
    obj.imageCheckBox196:setHeight(26);
    obj.imageCheckBox196:setField("Antecedentes_1_1");
    obj.imageCheckBox196:setName("imageCheckBox196");

    obj.layout235 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout235:setParent(obj.rectangle1);
    obj.layout235:setLeft(388);
    obj.layout235:setTop(1123);
    obj.layout235:setWidth(22);
    obj.layout235:setHeight(25);
    obj.layout235:setName("layout235");

    obj.imageCheckBox197 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox197:setParent(obj.layout235);
    obj.imageCheckBox197:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox197:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox197:setLeft(0);
    obj.imageCheckBox197:setTop(0);
    obj.imageCheckBox197:setWidth(22);
    obj.imageCheckBox197:setHeight(26);
    obj.imageCheckBox197:setField("Antecedentes_1_2");
    obj.imageCheckBox197:setName("imageCheckBox197");

    obj.layout236 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout236:setParent(obj.rectangle1);
    obj.layout236:setLeft(408);
    obj.layout236:setTop(1123);
    obj.layout236:setWidth(22);
    obj.layout236:setHeight(25);
    obj.layout236:setName("layout236");

    obj.imageCheckBox198 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox198:setParent(obj.layout236);
    obj.imageCheckBox198:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox198:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox198:setLeft(0);
    obj.imageCheckBox198:setTop(0);
    obj.imageCheckBox198:setWidth(22);
    obj.imageCheckBox198:setHeight(26);
    obj.imageCheckBox198:setField("Antecedentes_1_3");
    obj.imageCheckBox198:setName("imageCheckBox198");

    obj.layout237 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout237:setParent(obj.rectangle1);
    obj.layout237:setLeft(430);
    obj.layout237:setTop(1123);
    obj.layout237:setWidth(22);
    obj.layout237:setHeight(25);
    obj.layout237:setName("layout237");

    obj.imageCheckBox199 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox199:setParent(obj.layout237);
    obj.imageCheckBox199:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox199:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox199:setLeft(0);
    obj.imageCheckBox199:setTop(0);
    obj.imageCheckBox199:setWidth(22);
    obj.imageCheckBox199:setHeight(26);
    obj.imageCheckBox199:setField("Antecedentes_1_4");
    obj.imageCheckBox199:setName("imageCheckBox199");

    obj.layout238 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout238:setParent(obj.rectangle1);
    obj.layout238:setLeft(452);
    obj.layout238:setTop(1123);
    obj.layout238:setWidth(22);
    obj.layout238:setHeight(25);
    obj.layout238:setName("layout238");

    obj.imageCheckBox200 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox200:setParent(obj.layout238);
    obj.imageCheckBox200:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox200:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox200:setLeft(0);
    obj.imageCheckBox200:setTop(0);
    obj.imageCheckBox200:setWidth(22);
    obj.imageCheckBox200:setHeight(26);
    obj.imageCheckBox200:setField("Antecedentes_1_5");
    obj.imageCheckBox200:setName("imageCheckBox200");

    obj.layout239 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout239:setParent(obj.rectangle1);
    obj.layout239:setLeft(365);
    obj.layout239:setTop(1156);
    obj.layout239:setWidth(22);
    obj.layout239:setHeight(25);
    obj.layout239:setName("layout239");

    obj.imageCheckBox201 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox201:setParent(obj.layout239);
    obj.imageCheckBox201:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox201:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox201:setLeft(0);
    obj.imageCheckBox201:setTop(0);
    obj.imageCheckBox201:setWidth(22);
    obj.imageCheckBox201:setHeight(26);
    obj.imageCheckBox201:setField("Antecedentes_2_1");
    obj.imageCheckBox201:setName("imageCheckBox201");

    obj.layout240 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout240:setParent(obj.rectangle1);
    obj.layout240:setLeft(388);
    obj.layout240:setTop(1156);
    obj.layout240:setWidth(22);
    obj.layout240:setHeight(25);
    obj.layout240:setName("layout240");

    obj.imageCheckBox202 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox202:setParent(obj.layout240);
    obj.imageCheckBox202:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox202:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox202:setLeft(0);
    obj.imageCheckBox202:setTop(0);
    obj.imageCheckBox202:setWidth(22);
    obj.imageCheckBox202:setHeight(26);
    obj.imageCheckBox202:setField("Antecedentes_2_2");
    obj.imageCheckBox202:setName("imageCheckBox202");

    obj.layout241 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout241:setParent(obj.rectangle1);
    obj.layout241:setLeft(408);
    obj.layout241:setTop(1156);
    obj.layout241:setWidth(22);
    obj.layout241:setHeight(25);
    obj.layout241:setName("layout241");

    obj.imageCheckBox203 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox203:setParent(obj.layout241);
    obj.imageCheckBox203:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox203:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox203:setLeft(0);
    obj.imageCheckBox203:setTop(0);
    obj.imageCheckBox203:setWidth(22);
    obj.imageCheckBox203:setHeight(26);
    obj.imageCheckBox203:setField("Antecedentes_2_3");
    obj.imageCheckBox203:setName("imageCheckBox203");

    obj.layout242 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout242:setParent(obj.rectangle1);
    obj.layout242:setLeft(430);
    obj.layout242:setTop(1156);
    obj.layout242:setWidth(22);
    obj.layout242:setHeight(25);
    obj.layout242:setName("layout242");

    obj.imageCheckBox204 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox204:setParent(obj.layout242);
    obj.imageCheckBox204:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox204:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox204:setLeft(0);
    obj.imageCheckBox204:setTop(0);
    obj.imageCheckBox204:setWidth(22);
    obj.imageCheckBox204:setHeight(26);
    obj.imageCheckBox204:setField("Antecedentes_2_4");
    obj.imageCheckBox204:setName("imageCheckBox204");

    obj.layout243 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout243:setParent(obj.rectangle1);
    obj.layout243:setLeft(452);
    obj.layout243:setTop(1156);
    obj.layout243:setWidth(22);
    obj.layout243:setHeight(25);
    obj.layout243:setName("layout243");

    obj.imageCheckBox205 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox205:setParent(obj.layout243);
    obj.imageCheckBox205:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox205:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox205:setLeft(0);
    obj.imageCheckBox205:setTop(0);
    obj.imageCheckBox205:setWidth(22);
    obj.imageCheckBox205:setHeight(26);
    obj.imageCheckBox205:setField("Antecedentes_2_5");
    obj.imageCheckBox205:setName("imageCheckBox205");

    obj.layout244 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout244:setParent(obj.rectangle1);
    obj.layout244:setLeft(365);
    obj.layout244:setTop(1189);
    obj.layout244:setWidth(22);
    obj.layout244:setHeight(25);
    obj.layout244:setName("layout244");

    obj.imageCheckBox206 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox206:setParent(obj.layout244);
    obj.imageCheckBox206:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox206:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox206:setLeft(0);
    obj.imageCheckBox206:setTop(0);
    obj.imageCheckBox206:setWidth(22);
    obj.imageCheckBox206:setHeight(26);
    obj.imageCheckBox206:setField("Antecedentes_3_1");
    obj.imageCheckBox206:setName("imageCheckBox206");

    obj.layout245 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout245:setParent(obj.rectangle1);
    obj.layout245:setLeft(388);
    obj.layout245:setTop(1189);
    obj.layout245:setWidth(22);
    obj.layout245:setHeight(25);
    obj.layout245:setName("layout245");

    obj.imageCheckBox207 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox207:setParent(obj.layout245);
    obj.imageCheckBox207:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox207:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox207:setLeft(0);
    obj.imageCheckBox207:setTop(0);
    obj.imageCheckBox207:setWidth(22);
    obj.imageCheckBox207:setHeight(26);
    obj.imageCheckBox207:setField("Antecedentes_3_2");
    obj.imageCheckBox207:setName("imageCheckBox207");

    obj.layout246 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout246:setParent(obj.rectangle1);
    obj.layout246:setLeft(408);
    obj.layout246:setTop(1189);
    obj.layout246:setWidth(22);
    obj.layout246:setHeight(25);
    obj.layout246:setName("layout246");

    obj.imageCheckBox208 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox208:setParent(obj.layout246);
    obj.imageCheckBox208:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox208:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox208:setLeft(0);
    obj.imageCheckBox208:setTop(0);
    obj.imageCheckBox208:setWidth(22);
    obj.imageCheckBox208:setHeight(26);
    obj.imageCheckBox208:setField("Antecedentes_3_3");
    obj.imageCheckBox208:setName("imageCheckBox208");

    obj.layout247 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout247:setParent(obj.rectangle1);
    obj.layout247:setLeft(430);
    obj.layout247:setTop(1189);
    obj.layout247:setWidth(22);
    obj.layout247:setHeight(25);
    obj.layout247:setName("layout247");

    obj.imageCheckBox209 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox209:setParent(obj.layout247);
    obj.imageCheckBox209:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox209:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox209:setLeft(0);
    obj.imageCheckBox209:setTop(0);
    obj.imageCheckBox209:setWidth(22);
    obj.imageCheckBox209:setHeight(26);
    obj.imageCheckBox209:setField("Antecedentes_3_4");
    obj.imageCheckBox209:setName("imageCheckBox209");

    obj.layout248 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout248:setParent(obj.rectangle1);
    obj.layout248:setLeft(452);
    obj.layout248:setTop(1189);
    obj.layout248:setWidth(22);
    obj.layout248:setHeight(25);
    obj.layout248:setName("layout248");

    obj.imageCheckBox210 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox210:setParent(obj.layout248);
    obj.imageCheckBox210:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox210:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox210:setLeft(0);
    obj.imageCheckBox210:setTop(0);
    obj.imageCheckBox210:setWidth(22);
    obj.imageCheckBox210:setHeight(26);
    obj.imageCheckBox210:setField("Antecedentes_3_5");
    obj.imageCheckBox210:setName("imageCheckBox210");

    obj.layout249 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout249:setParent(obj.rectangle1);
    obj.layout249:setLeft(365);
    obj.layout249:setTop(1222);
    obj.layout249:setWidth(22);
    obj.layout249:setHeight(25);
    obj.layout249:setName("layout249");

    obj.imageCheckBox211 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox211:setParent(obj.layout249);
    obj.imageCheckBox211:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox211:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox211:setLeft(0);
    obj.imageCheckBox211:setTop(0);
    obj.imageCheckBox211:setWidth(22);
    obj.imageCheckBox211:setHeight(26);
    obj.imageCheckBox211:setField("Antecedentes_4_1");
    obj.imageCheckBox211:setName("imageCheckBox211");

    obj.layout250 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout250:setParent(obj.rectangle1);
    obj.layout250:setLeft(388);
    obj.layout250:setTop(1222);
    obj.layout250:setWidth(22);
    obj.layout250:setHeight(25);
    obj.layout250:setName("layout250");

    obj.imageCheckBox212 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox212:setParent(obj.layout250);
    obj.imageCheckBox212:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox212:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox212:setLeft(0);
    obj.imageCheckBox212:setTop(0);
    obj.imageCheckBox212:setWidth(22);
    obj.imageCheckBox212:setHeight(26);
    obj.imageCheckBox212:setField("Antecedentes_4_2");
    obj.imageCheckBox212:setName("imageCheckBox212");

    obj.layout251 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout251:setParent(obj.rectangle1);
    obj.layout251:setLeft(408);
    obj.layout251:setTop(1222);
    obj.layout251:setWidth(22);
    obj.layout251:setHeight(25);
    obj.layout251:setName("layout251");

    obj.imageCheckBox213 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox213:setParent(obj.layout251);
    obj.imageCheckBox213:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox213:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox213:setLeft(0);
    obj.imageCheckBox213:setTop(0);
    obj.imageCheckBox213:setWidth(22);
    obj.imageCheckBox213:setHeight(26);
    obj.imageCheckBox213:setField("Antecedentes_4_3");
    obj.imageCheckBox213:setName("imageCheckBox213");

    obj.layout252 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout252:setParent(obj.rectangle1);
    obj.layout252:setLeft(430);
    obj.layout252:setTop(1222);
    obj.layout252:setWidth(22);
    obj.layout252:setHeight(25);
    obj.layout252:setName("layout252");

    obj.imageCheckBox214 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox214:setParent(obj.layout252);
    obj.imageCheckBox214:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox214:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox214:setLeft(0);
    obj.imageCheckBox214:setTop(0);
    obj.imageCheckBox214:setWidth(22);
    obj.imageCheckBox214:setHeight(26);
    obj.imageCheckBox214:setField("Antecedentes_4_4");
    obj.imageCheckBox214:setName("imageCheckBox214");

    obj.layout253 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout253:setParent(obj.rectangle1);
    obj.layout253:setLeft(452);
    obj.layout253:setTop(1222);
    obj.layout253:setWidth(22);
    obj.layout253:setHeight(25);
    obj.layout253:setName("layout253");

    obj.imageCheckBox215 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox215:setParent(obj.layout253);
    obj.imageCheckBox215:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox215:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox215:setLeft(0);
    obj.imageCheckBox215:setTop(0);
    obj.imageCheckBox215:setWidth(22);
    obj.imageCheckBox215:setHeight(26);
    obj.imageCheckBox215:setField("Antecedentes_4_5");
    obj.imageCheckBox215:setName("imageCheckBox215");

    obj.layout254 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout254:setParent(obj.rectangle1);
    obj.layout254:setLeft(365);
    obj.layout254:setTop(1255);
    obj.layout254:setWidth(22);
    obj.layout254:setHeight(25);
    obj.layout254:setName("layout254");

    obj.imageCheckBox216 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox216:setParent(obj.layout254);
    obj.imageCheckBox216:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox216:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox216:setLeft(0);
    obj.imageCheckBox216:setTop(0);
    obj.imageCheckBox216:setWidth(22);
    obj.imageCheckBox216:setHeight(26);
    obj.imageCheckBox216:setField("Antecedentes_5_1");
    obj.imageCheckBox216:setName("imageCheckBox216");

    obj.layout255 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout255:setParent(obj.rectangle1);
    obj.layout255:setLeft(388);
    obj.layout255:setTop(1255);
    obj.layout255:setWidth(22);
    obj.layout255:setHeight(25);
    obj.layout255:setName("layout255");

    obj.imageCheckBox217 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox217:setParent(obj.layout255);
    obj.imageCheckBox217:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox217:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox217:setLeft(0);
    obj.imageCheckBox217:setTop(0);
    obj.imageCheckBox217:setWidth(22);
    obj.imageCheckBox217:setHeight(26);
    obj.imageCheckBox217:setField("Antecedentes_5_2");
    obj.imageCheckBox217:setName("imageCheckBox217");

    obj.layout256 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout256:setParent(obj.rectangle1);
    obj.layout256:setLeft(408);
    obj.layout256:setTop(1255);
    obj.layout256:setWidth(22);
    obj.layout256:setHeight(25);
    obj.layout256:setName("layout256");

    obj.imageCheckBox218 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox218:setParent(obj.layout256);
    obj.imageCheckBox218:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox218:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox218:setLeft(0);
    obj.imageCheckBox218:setTop(0);
    obj.imageCheckBox218:setWidth(22);
    obj.imageCheckBox218:setHeight(26);
    obj.imageCheckBox218:setField("Antecedentes_5_3");
    obj.imageCheckBox218:setName("imageCheckBox218");

    obj.layout257 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout257:setParent(obj.rectangle1);
    obj.layout257:setLeft(430);
    obj.layout257:setTop(1255);
    obj.layout257:setWidth(22);
    obj.layout257:setHeight(25);
    obj.layout257:setName("layout257");

    obj.imageCheckBox219 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox219:setParent(obj.layout257);
    obj.imageCheckBox219:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox219:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox219:setLeft(0);
    obj.imageCheckBox219:setTop(0);
    obj.imageCheckBox219:setWidth(22);
    obj.imageCheckBox219:setHeight(26);
    obj.imageCheckBox219:setField("Antecedentes_5_4");
    obj.imageCheckBox219:setName("imageCheckBox219");

    obj.layout258 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout258:setParent(obj.rectangle1);
    obj.layout258:setLeft(452);
    obj.layout258:setTop(1255);
    obj.layout258:setWidth(22);
    obj.layout258:setHeight(25);
    obj.layout258:setName("layout258");

    obj.imageCheckBox220 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox220:setParent(obj.layout258);
    obj.imageCheckBox220:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox220:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox220:setLeft(0);
    obj.imageCheckBox220:setTop(0);
    obj.imageCheckBox220:setWidth(22);
    obj.imageCheckBox220:setHeight(26);
    obj.imageCheckBox220:setField("Antecedentes_5_5");
    obj.imageCheckBox220:setName("imageCheckBox220");

    obj.layout259 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout259:setParent(obj.rectangle1);
    obj.layout259:setLeft(366);
    obj.layout259:setTop(1287);
    obj.layout259:setWidth(22);
    obj.layout259:setHeight(25);
    obj.layout259:setName("layout259");

    obj.imageCheckBox221 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox221:setParent(obj.layout259);
    obj.imageCheckBox221:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox221:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox221:setLeft(0);
    obj.imageCheckBox221:setTop(0);
    obj.imageCheckBox221:setWidth(22);
    obj.imageCheckBox221:setHeight(26);
    obj.imageCheckBox221:setField("Antecedentes_6_1");
    obj.imageCheckBox221:setName("imageCheckBox221");

    obj.layout260 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout260:setParent(obj.rectangle1);
    obj.layout260:setLeft(388);
    obj.layout260:setTop(1287);
    obj.layout260:setWidth(22);
    obj.layout260:setHeight(25);
    obj.layout260:setName("layout260");

    obj.imageCheckBox222 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox222:setParent(obj.layout260);
    obj.imageCheckBox222:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox222:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox222:setLeft(0);
    obj.imageCheckBox222:setTop(0);
    obj.imageCheckBox222:setWidth(22);
    obj.imageCheckBox222:setHeight(26);
    obj.imageCheckBox222:setField("Antecedentes_6_2");
    obj.imageCheckBox222:setName("imageCheckBox222");

    obj.layout261 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout261:setParent(obj.rectangle1);
    obj.layout261:setLeft(408);
    obj.layout261:setTop(1287);
    obj.layout261:setWidth(22);
    obj.layout261:setHeight(25);
    obj.layout261:setName("layout261");

    obj.imageCheckBox223 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox223:setParent(obj.layout261);
    obj.imageCheckBox223:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox223:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox223:setLeft(0);
    obj.imageCheckBox223:setTop(0);
    obj.imageCheckBox223:setWidth(22);
    obj.imageCheckBox223:setHeight(26);
    obj.imageCheckBox223:setField("Antecedentes_6_3");
    obj.imageCheckBox223:setName("imageCheckBox223");

    obj.layout262 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout262:setParent(obj.rectangle1);
    obj.layout262:setLeft(430);
    obj.layout262:setTop(1287);
    obj.layout262:setWidth(22);
    obj.layout262:setHeight(25);
    obj.layout262:setName("layout262");

    obj.imageCheckBox224 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox224:setParent(obj.layout262);
    obj.imageCheckBox224:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox224:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox224:setLeft(0);
    obj.imageCheckBox224:setTop(0);
    obj.imageCheckBox224:setWidth(22);
    obj.imageCheckBox224:setHeight(26);
    obj.imageCheckBox224:setField("Antecedentes_6_4");
    obj.imageCheckBox224:setName("imageCheckBox224");

    obj.layout263 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout263:setParent(obj.rectangle1);
    obj.layout263:setLeft(452);
    obj.layout263:setTop(1287);
    obj.layout263:setWidth(22);
    obj.layout263:setHeight(25);
    obj.layout263:setName("layout263");

    obj.imageCheckBox225 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox225:setParent(obj.layout263);
    obj.imageCheckBox225:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox225:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox225:setLeft(0);
    obj.imageCheckBox225:setTop(0);
    obj.imageCheckBox225:setWidth(22);
    obj.imageCheckBox225:setHeight(26);
    obj.imageCheckBox225:setField("Antecedentes_6_5");
    obj.imageCheckBox225:setName("imageCheckBox225");

    obj.layout264 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout264:setParent(obj.rectangle1);
    obj.layout264:setLeft(509);
    obj.layout264:setTop(1407);
    obj.layout264:setWidth(22);
    obj.layout264:setHeight(25);
    obj.layout264:setName("layout264");

    obj.imageCheckBox226 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox226:setParent(obj.layout264);
    obj.imageCheckBox226:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox226:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox226:setLeft(0);
    obj.imageCheckBox226:setTop(0);
    obj.imageCheckBox226:setWidth(22);
    obj.imageCheckBox226:setHeight(26);
    obj.imageCheckBox226:setField("Furia_01");
    obj.imageCheckBox226:setName("imageCheckBox226");

    obj.layout265 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout265:setParent(obj.rectangle1);
    obj.layout265:setLeft(545);
    obj.layout265:setTop(1407);
    obj.layout265:setWidth(22);
    obj.layout265:setHeight(25);
    obj.layout265:setName("layout265");

    obj.imageCheckBox227 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox227:setParent(obj.layout265);
    obj.imageCheckBox227:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox227:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox227:setLeft(0);
    obj.imageCheckBox227:setTop(0);
    obj.imageCheckBox227:setWidth(22);
    obj.imageCheckBox227:setHeight(26);
    obj.imageCheckBox227:setField("Furia_02");
    obj.imageCheckBox227:setName("imageCheckBox227");

    obj.layout266 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout266:setParent(obj.rectangle1);
    obj.layout266:setLeft(581);
    obj.layout266:setTop(1407);
    obj.layout266:setWidth(22);
    obj.layout266:setHeight(25);
    obj.layout266:setName("layout266");

    obj.imageCheckBox228 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox228:setParent(obj.layout266);
    obj.imageCheckBox228:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox228:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox228:setLeft(0);
    obj.imageCheckBox228:setTop(0);
    obj.imageCheckBox228:setWidth(22);
    obj.imageCheckBox228:setHeight(26);
    obj.imageCheckBox228:setField("Furia_03");
    obj.imageCheckBox228:setName("imageCheckBox228");

    obj.layout267 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout267:setParent(obj.rectangle1);
    obj.layout267:setLeft(619);
    obj.layout267:setTop(1407);
    obj.layout267:setWidth(22);
    obj.layout267:setHeight(25);
    obj.layout267:setName("layout267");

    obj.imageCheckBox229 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox229:setParent(obj.layout267);
    obj.imageCheckBox229:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox229:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox229:setLeft(0);
    obj.imageCheckBox229:setTop(0);
    obj.imageCheckBox229:setWidth(22);
    obj.imageCheckBox229:setHeight(26);
    obj.imageCheckBox229:setField("Furia_04");
    obj.imageCheckBox229:setName("imageCheckBox229");

    obj.layout268 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout268:setParent(obj.rectangle1);
    obj.layout268:setLeft(654);
    obj.layout268:setTop(1407);
    obj.layout268:setWidth(22);
    obj.layout268:setHeight(25);
    obj.layout268:setName("layout268");

    obj.imageCheckBox230 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox230:setParent(obj.layout268);
    obj.imageCheckBox230:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox230:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox230:setLeft(0);
    obj.imageCheckBox230:setTop(0);
    obj.imageCheckBox230:setWidth(22);
    obj.imageCheckBox230:setHeight(26);
    obj.imageCheckBox230:setField("Furia_05");
    obj.imageCheckBox230:setName("imageCheckBox230");

    obj.layout269 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout269:setParent(obj.rectangle1);
    obj.layout269:setLeft(690);
    obj.layout269:setTop(1407);
    obj.layout269:setWidth(22);
    obj.layout269:setHeight(25);
    obj.layout269:setName("layout269");

    obj.imageCheckBox231 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox231:setParent(obj.layout269);
    obj.imageCheckBox231:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox231:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox231:setLeft(0);
    obj.imageCheckBox231:setTop(0);
    obj.imageCheckBox231:setWidth(22);
    obj.imageCheckBox231:setHeight(26);
    obj.imageCheckBox231:setField("Furia_06");
    obj.imageCheckBox231:setName("imageCheckBox231");

    obj.layout270 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout270:setParent(obj.rectangle1);
    obj.layout270:setLeft(728);
    obj.layout270:setTop(1407);
    obj.layout270:setWidth(22);
    obj.layout270:setHeight(25);
    obj.layout270:setName("layout270");

    obj.imageCheckBox232 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox232:setParent(obj.layout270);
    obj.imageCheckBox232:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox232:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox232:setLeft(0);
    obj.imageCheckBox232:setTop(0);
    obj.imageCheckBox232:setWidth(22);
    obj.imageCheckBox232:setHeight(26);
    obj.imageCheckBox232:setField("Furia_07");
    obj.imageCheckBox232:setName("imageCheckBox232");

    obj.layout271 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout271:setParent(obj.rectangle1);
    obj.layout271:setLeft(763);
    obj.layout271:setTop(1407);
    obj.layout271:setWidth(22);
    obj.layout271:setHeight(25);
    obj.layout271:setName("layout271");

    obj.imageCheckBox233 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox233:setParent(obj.layout271);
    obj.imageCheckBox233:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox233:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox233:setLeft(0);
    obj.imageCheckBox233:setTop(0);
    obj.imageCheckBox233:setWidth(22);
    obj.imageCheckBox233:setHeight(26);
    obj.imageCheckBox233:setField("Furia_08");
    obj.imageCheckBox233:setName("imageCheckBox233");

    obj.layout272 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout272:setParent(obj.rectangle1);
    obj.layout272:setLeft(801);
    obj.layout272:setTop(1407);
    obj.layout272:setWidth(22);
    obj.layout272:setHeight(25);
    obj.layout272:setName("layout272");

    obj.imageCheckBox234 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox234:setParent(obj.layout272);
    obj.imageCheckBox234:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox234:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox234:setLeft(0);
    obj.imageCheckBox234:setTop(0);
    obj.imageCheckBox234:setWidth(22);
    obj.imageCheckBox234:setHeight(26);
    obj.imageCheckBox234:setField("Furia_09");
    obj.imageCheckBox234:setName("imageCheckBox234");

    obj.layout273 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout273:setParent(obj.rectangle1);
    obj.layout273:setLeft(837);
    obj.layout273:setTop(1407);
    obj.layout273:setWidth(22);
    obj.layout273:setHeight(25);
    obj.layout273:setName("layout273");

    obj.imageCheckBox235 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox235:setParent(obj.layout273);
    obj.imageCheckBox235:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox235:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox235:setLeft(0);
    obj.imageCheckBox235:setTop(0);
    obj.imageCheckBox235:setWidth(22);
    obj.imageCheckBox235:setHeight(26);
    obj.imageCheckBox235:setField("Furia_10");
    obj.imageCheckBox235:setName("imageCheckBox235");

    obj.layout274 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout274:setParent(obj.rectangle1);
    obj.layout274:setLeft(113);
    obj.layout274:setTop(1449);
    obj.layout274:setWidth(22);
    obj.layout274:setHeight(25);
    obj.layout274:setName("layout274");

    obj.imageCheckBox236 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox236:setParent(obj.layout274);
    obj.imageCheckBox236:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox236:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox236:setLeft(0);
    obj.imageCheckBox236:setTop(0);
    obj.imageCheckBox236:setWidth(22);
    obj.imageCheckBox236:setHeight(26);
    obj.imageCheckBox236:setField("Gloria_01");
    obj.imageCheckBox236:setName("imageCheckBox236");

    obj.layout275 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout275:setParent(obj.rectangle1);
    obj.layout275:setLeft(149);
    obj.layout275:setTop(1449);
    obj.layout275:setWidth(22);
    obj.layout275:setHeight(25);
    obj.layout275:setName("layout275");

    obj.imageCheckBox237 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox237:setParent(obj.layout275);
    obj.imageCheckBox237:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox237:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox237:setLeft(0);
    obj.imageCheckBox237:setTop(0);
    obj.imageCheckBox237:setWidth(22);
    obj.imageCheckBox237:setHeight(26);
    obj.imageCheckBox237:setField("Gloria_02");
    obj.imageCheckBox237:setName("imageCheckBox237");

    obj.layout276 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout276:setParent(obj.rectangle1);
    obj.layout276:setLeft(185);
    obj.layout276:setTop(1449);
    obj.layout276:setWidth(22);
    obj.layout276:setHeight(25);
    obj.layout276:setName("layout276");

    obj.imageCheckBox238 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox238:setParent(obj.layout276);
    obj.imageCheckBox238:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox238:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox238:setLeft(0);
    obj.imageCheckBox238:setTop(0);
    obj.imageCheckBox238:setWidth(22);
    obj.imageCheckBox238:setHeight(26);
    obj.imageCheckBox238:setField("Gloria_03");
    obj.imageCheckBox238:setName("imageCheckBox238");

    obj.layout277 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout277:setParent(obj.rectangle1);
    obj.layout277:setLeft(223);
    obj.layout277:setTop(1449);
    obj.layout277:setWidth(22);
    obj.layout277:setHeight(25);
    obj.layout277:setName("layout277");

    obj.imageCheckBox239 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox239:setParent(obj.layout277);
    obj.imageCheckBox239:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox239:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox239:setLeft(0);
    obj.imageCheckBox239:setTop(0);
    obj.imageCheckBox239:setWidth(22);
    obj.imageCheckBox239:setHeight(26);
    obj.imageCheckBox239:setField("Gloria_04");
    obj.imageCheckBox239:setName("imageCheckBox239");

    obj.layout278 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout278:setParent(obj.rectangle1);
    obj.layout278:setLeft(258);
    obj.layout278:setTop(1449);
    obj.layout278:setWidth(22);
    obj.layout278:setHeight(25);
    obj.layout278:setName("layout278");

    obj.imageCheckBox240 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox240:setParent(obj.layout278);
    obj.imageCheckBox240:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox240:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox240:setLeft(0);
    obj.imageCheckBox240:setTop(0);
    obj.imageCheckBox240:setWidth(22);
    obj.imageCheckBox240:setHeight(26);
    obj.imageCheckBox240:setField("Gloria_05");
    obj.imageCheckBox240:setName("imageCheckBox240");

    obj.layout279 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout279:setParent(obj.rectangle1);
    obj.layout279:setLeft(294);
    obj.layout279:setTop(1449);
    obj.layout279:setWidth(22);
    obj.layout279:setHeight(25);
    obj.layout279:setName("layout279");

    obj.imageCheckBox241 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox241:setParent(obj.layout279);
    obj.imageCheckBox241:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox241:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox241:setLeft(0);
    obj.imageCheckBox241:setTop(0);
    obj.imageCheckBox241:setWidth(22);
    obj.imageCheckBox241:setHeight(26);
    obj.imageCheckBox241:setField("Gloria_06");
    obj.imageCheckBox241:setName("imageCheckBox241");

    obj.layout280 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout280:setParent(obj.rectangle1);
    obj.layout280:setLeft(332);
    obj.layout280:setTop(1449);
    obj.layout280:setWidth(22);
    obj.layout280:setHeight(25);
    obj.layout280:setName("layout280");

    obj.imageCheckBox242 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox242:setParent(obj.layout280);
    obj.imageCheckBox242:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox242:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox242:setLeft(0);
    obj.imageCheckBox242:setTop(0);
    obj.imageCheckBox242:setWidth(22);
    obj.imageCheckBox242:setHeight(26);
    obj.imageCheckBox242:setField("Gloria_07");
    obj.imageCheckBox242:setName("imageCheckBox242");

    obj.layout281 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout281:setParent(obj.rectangle1);
    obj.layout281:setLeft(367);
    obj.layout281:setTop(1449);
    obj.layout281:setWidth(22);
    obj.layout281:setHeight(25);
    obj.layout281:setName("layout281");

    obj.imageCheckBox243 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox243:setParent(obj.layout281);
    obj.imageCheckBox243:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox243:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox243:setLeft(0);
    obj.imageCheckBox243:setTop(0);
    obj.imageCheckBox243:setWidth(22);
    obj.imageCheckBox243:setHeight(26);
    obj.imageCheckBox243:setField("Gloria_08");
    obj.imageCheckBox243:setName("imageCheckBox243");

    obj.layout282 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout282:setParent(obj.rectangle1);
    obj.layout282:setLeft(405);
    obj.layout282:setTop(1449);
    obj.layout282:setWidth(22);
    obj.layout282:setHeight(25);
    obj.layout282:setName("layout282");

    obj.imageCheckBox244 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox244:setParent(obj.layout282);
    obj.imageCheckBox244:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox244:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox244:setLeft(0);
    obj.imageCheckBox244:setTop(0);
    obj.imageCheckBox244:setWidth(22);
    obj.imageCheckBox244:setHeight(26);
    obj.imageCheckBox244:setField("Gloria_09");
    obj.imageCheckBox244:setName("imageCheckBox244");

    obj.layout283 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout283:setParent(obj.rectangle1);
    obj.layout283:setLeft(441);
    obj.layout283:setTop(1449);
    obj.layout283:setWidth(22);
    obj.layout283:setHeight(25);
    obj.layout283:setName("layout283");

    obj.imageCheckBox245 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox245:setParent(obj.layout283);
    obj.imageCheckBox245:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox245:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox245:setLeft(0);
    obj.imageCheckBox245:setTop(0);
    obj.imageCheckBox245:setWidth(22);
    obj.imageCheckBox245:setHeight(26);
    obj.imageCheckBox245:setField("Gloria_10");
    obj.imageCheckBox245:setName("imageCheckBox245");

    obj.layout284 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout284:setParent(obj.rectangle1);
    obj.layout284:setLeft(1216);
    obj.layout284:setTop(1438);
    obj.layout284:setWidth(20);
    obj.layout284:setHeight(21);
    obj.layout284:setName("layout284");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout284);
    obj.checkBox1:setScale(1.5);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setHeight(22);
    obj.checkBox1:setField("Vitalidade_2");
    obj.checkBox1:setName("checkBox1");

    obj.layout285 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout285:setParent(obj.rectangle1);
    obj.layout285:setLeft(1255);
    obj.layout285:setTop(1440);
    obj.layout285:setWidth(20);
    obj.layout285:setHeight(21);
    obj.layout285:setName("layout285");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout285);
    obj.checkBox2:setScale(1.5);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setHeight(22);
    obj.checkBox2:setField("Vitalidade_9");
    obj.checkBox2:setName("checkBox2");

    obj.layout286 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout286:setParent(obj.rectangle1);
    obj.layout286:setLeft(113);
    obj.layout286:setTop(1482);
    obj.layout286:setWidth(20);
    obj.layout286:setHeight(21);
    obj.layout286:setName("layout286");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout286);
    obj.checkBox3:setScale(1.5);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setHeight(22);
    obj.checkBox3:setField("Gloria_11");
    obj.checkBox3:setName("checkBox3");

    obj.layout287 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout287:setParent(obj.rectangle1);
    obj.layout287:setLeft(150);
    obj.layout287:setTop(1482);
    obj.layout287:setWidth(20);
    obj.layout287:setHeight(21);
    obj.layout287:setName("layout287");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout287);
    obj.checkBox4:setScale(1.5);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setHeight(22);
    obj.checkBox4:setField("Gloria_12");
    obj.checkBox4:setName("checkBox4");

    obj.layout288 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout288:setParent(obj.rectangle1);
    obj.layout288:setLeft(188);
    obj.layout288:setTop(1482);
    obj.layout288:setWidth(20);
    obj.layout288:setHeight(21);
    obj.layout288:setName("layout288");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout288);
    obj.checkBox5:setScale(1.5);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setHeight(22);
    obj.checkBox5:setField("Gloria_13");
    obj.checkBox5:setName("checkBox5");

    obj.layout289 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout289:setParent(obj.rectangle1);
    obj.layout289:setLeft(225);
    obj.layout289:setTop(1482);
    obj.layout289:setWidth(20);
    obj.layout289:setHeight(21);
    obj.layout289:setName("layout289");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout289);
    obj.checkBox6:setScale(1.5);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setHeight(22);
    obj.checkBox6:setField("Gloria_14");
    obj.checkBox6:setName("checkBox6");

    obj.layout290 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout290:setParent(obj.rectangle1);
    obj.layout290:setLeft(262);
    obj.layout290:setTop(1482);
    obj.layout290:setWidth(20);
    obj.layout290:setHeight(21);
    obj.layout290:setName("layout290");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout290);
    obj.checkBox7:setScale(1.5);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setHeight(22);
    obj.checkBox7:setField("Gloria_15");
    obj.checkBox7:setName("checkBox7");

    obj.layout291 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout291:setParent(obj.rectangle1);
    obj.layout291:setLeft(300);
    obj.layout291:setTop(1482);
    obj.layout291:setWidth(20);
    obj.layout291:setHeight(21);
    obj.layout291:setName("layout291");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout291);
    obj.checkBox8:setScale(1.5);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setHeight(22);
    obj.checkBox8:setField("Gloria_16");
    obj.checkBox8:setName("checkBox8");

    obj.layout292 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout292:setParent(obj.rectangle1);
    obj.layout292:setLeft(338);
    obj.layout292:setTop(1482);
    obj.layout292:setWidth(20);
    obj.layout292:setHeight(21);
    obj.layout292:setName("layout292");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout292);
    obj.checkBox9:setScale(1.5);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setHeight(22);
    obj.checkBox9:setField("Gloria_17");
    obj.checkBox9:setName("checkBox9");

    obj.layout293 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout293:setParent(obj.rectangle1);
    obj.layout293:setLeft(373);
    obj.layout293:setTop(1482);
    obj.layout293:setWidth(20);
    obj.layout293:setHeight(21);
    obj.layout293:setName("layout293");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout293);
    obj.checkBox10:setScale(1.5);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setHeight(22);
    obj.checkBox10:setField("Gloria_18");
    obj.checkBox10:setName("checkBox10");

    obj.layout294 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout294:setParent(obj.rectangle1);
    obj.layout294:setLeft(410);
    obj.layout294:setTop(1482);
    obj.layout294:setWidth(20);
    obj.layout294:setHeight(21);
    obj.layout294:setName("layout294");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout294);
    obj.checkBox11:setScale(1.5);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setTop(0);
    obj.checkBox11:setWidth(20);
    obj.checkBox11:setHeight(22);
    obj.checkBox11:setField("Gloria_19");
    obj.checkBox11:setName("checkBox11");

    obj.layout295 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout295:setParent(obj.rectangle1);
    obj.layout295:setLeft(445);
    obj.layout295:setTop(1482);
    obj.layout295:setWidth(20);
    obj.layout295:setHeight(21);
    obj.layout295:setName("layout295");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout295);
    obj.checkBox12:setScale(1.5);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setTop(0);
    obj.checkBox12:setWidth(20);
    obj.checkBox12:setHeight(22);
    obj.checkBox12:setField("Gloria_20");
    obj.checkBox12:setName("checkBox12");

    obj.layout296 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout296:setParent(obj.rectangle1);
    obj.layout296:setLeft(114);
    obj.layout296:setTop(1564);
    obj.layout296:setWidth(22);
    obj.layout296:setHeight(25);
    obj.layout296:setName("layout296");

    obj.imageCheckBox246 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox246:setParent(obj.layout296);
    obj.imageCheckBox246:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox246:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox246:setLeft(0);
    obj.imageCheckBox246:setTop(0);
    obj.imageCheckBox246:setWidth(22);
    obj.imageCheckBox246:setHeight(26);
    obj.imageCheckBox246:setField("Honra_01");
    obj.imageCheckBox246:setName("imageCheckBox246");

    obj.layout297 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout297:setParent(obj.rectangle1);
    obj.layout297:setLeft(149);
    obj.layout297:setTop(1564);
    obj.layout297:setWidth(22);
    obj.layout297:setHeight(25);
    obj.layout297:setName("layout297");

    obj.imageCheckBox247 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox247:setParent(obj.layout297);
    obj.imageCheckBox247:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox247:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox247:setLeft(0);
    obj.imageCheckBox247:setTop(0);
    obj.imageCheckBox247:setWidth(22);
    obj.imageCheckBox247:setHeight(26);
    obj.imageCheckBox247:setField("Honra_02");
    obj.imageCheckBox247:setName("imageCheckBox247");

    obj.layout298 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout298:setParent(obj.rectangle1);
    obj.layout298:setLeft(185);
    obj.layout298:setTop(1564);
    obj.layout298:setWidth(22);
    obj.layout298:setHeight(25);
    obj.layout298:setName("layout298");

    obj.imageCheckBox248 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox248:setParent(obj.layout298);
    obj.imageCheckBox248:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox248:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox248:setLeft(0);
    obj.imageCheckBox248:setTop(0);
    obj.imageCheckBox248:setWidth(22);
    obj.imageCheckBox248:setHeight(26);
    obj.imageCheckBox248:setField("Honra_03");
    obj.imageCheckBox248:setName("imageCheckBox248");

    obj.layout299 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout299:setParent(obj.rectangle1);
    obj.layout299:setLeft(223);
    obj.layout299:setTop(1564);
    obj.layout299:setWidth(22);
    obj.layout299:setHeight(25);
    obj.layout299:setName("layout299");

    obj.imageCheckBox249 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox249:setParent(obj.layout299);
    obj.imageCheckBox249:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox249:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox249:setLeft(0);
    obj.imageCheckBox249:setTop(0);
    obj.imageCheckBox249:setWidth(22);
    obj.imageCheckBox249:setHeight(26);
    obj.imageCheckBox249:setField("Honra_04");
    obj.imageCheckBox249:setName("imageCheckBox249");

    obj.layout300 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout300:setParent(obj.rectangle1);
    obj.layout300:setLeft(258);
    obj.layout300:setTop(1564);
    obj.layout300:setWidth(22);
    obj.layout300:setHeight(25);
    obj.layout300:setName("layout300");

    obj.imageCheckBox250 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox250:setParent(obj.layout300);
    obj.imageCheckBox250:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox250:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox250:setLeft(0);
    obj.imageCheckBox250:setTop(0);
    obj.imageCheckBox250:setWidth(22);
    obj.imageCheckBox250:setHeight(26);
    obj.imageCheckBox250:setField("Honra_05");
    obj.imageCheckBox250:setName("imageCheckBox250");

    obj.layout301 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout301:setParent(obj.rectangle1);
    obj.layout301:setLeft(294);
    obj.layout301:setTop(1564);
    obj.layout301:setWidth(22);
    obj.layout301:setHeight(25);
    obj.layout301:setName("layout301");

    obj.imageCheckBox251 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox251:setParent(obj.layout301);
    obj.imageCheckBox251:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox251:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox251:setLeft(0);
    obj.imageCheckBox251:setTop(0);
    obj.imageCheckBox251:setWidth(22);
    obj.imageCheckBox251:setHeight(26);
    obj.imageCheckBox251:setField("Honra_06");
    obj.imageCheckBox251:setName("imageCheckBox251");

    obj.layout302 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout302:setParent(obj.rectangle1);
    obj.layout302:setLeft(332);
    obj.layout302:setTop(1564);
    obj.layout302:setWidth(22);
    obj.layout302:setHeight(25);
    obj.layout302:setName("layout302");

    obj.imageCheckBox252 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox252:setParent(obj.layout302);
    obj.imageCheckBox252:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox252:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox252:setLeft(0);
    obj.imageCheckBox252:setTop(0);
    obj.imageCheckBox252:setWidth(22);
    obj.imageCheckBox252:setHeight(26);
    obj.imageCheckBox252:setField("Honra_07");
    obj.imageCheckBox252:setName("imageCheckBox252");

    obj.layout303 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout303:setParent(obj.rectangle1);
    obj.layout303:setLeft(368);
    obj.layout303:setTop(1564);
    obj.layout303:setWidth(22);
    obj.layout303:setHeight(25);
    obj.layout303:setName("layout303");

    obj.imageCheckBox253 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox253:setParent(obj.layout303);
    obj.imageCheckBox253:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox253:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox253:setLeft(0);
    obj.imageCheckBox253:setTop(0);
    obj.imageCheckBox253:setWidth(22);
    obj.imageCheckBox253:setHeight(26);
    obj.imageCheckBox253:setField("Honra_08");
    obj.imageCheckBox253:setName("imageCheckBox253");

    obj.layout304 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout304:setParent(obj.rectangle1);
    obj.layout304:setLeft(406);
    obj.layout304:setTop(1564);
    obj.layout304:setWidth(22);
    obj.layout304:setHeight(25);
    obj.layout304:setName("layout304");

    obj.imageCheckBox254 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox254:setParent(obj.layout304);
    obj.imageCheckBox254:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox254:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox254:setLeft(0);
    obj.imageCheckBox254:setTop(0);
    obj.imageCheckBox254:setWidth(22);
    obj.imageCheckBox254:setHeight(26);
    obj.imageCheckBox254:setField("Honra_09");
    obj.imageCheckBox254:setName("imageCheckBox254");

    obj.layout305 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout305:setParent(obj.rectangle1);
    obj.layout305:setLeft(441);
    obj.layout305:setTop(1564);
    obj.layout305:setWidth(22);
    obj.layout305:setHeight(25);
    obj.layout305:setName("layout305");

    obj.imageCheckBox255 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox255:setParent(obj.layout305);
    obj.imageCheckBox255:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox255:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox255:setLeft(0);
    obj.imageCheckBox255:setTop(0);
    obj.imageCheckBox255:setWidth(22);
    obj.imageCheckBox255:setHeight(26);
    obj.imageCheckBox255:setField("Honra_10");
    obj.imageCheckBox255:setName("imageCheckBox255");

    obj.layout306 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout306:setParent(obj.rectangle1);
    obj.layout306:setLeft(510);
    obj.layout306:setTop(1581);
    obj.layout306:setWidth(22);
    obj.layout306:setHeight(25);
    obj.layout306:setName("layout306");

    obj.imageCheckBox256 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox256:setParent(obj.layout306);
    obj.imageCheckBox256:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox256:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox256:setLeft(0);
    obj.imageCheckBox256:setTop(0);
    obj.imageCheckBox256:setWidth(22);
    obj.imageCheckBox256:setHeight(26);
    obj.imageCheckBox256:setField("Gnose_011");
    obj.imageCheckBox256:setName("imageCheckBox256");

    obj.layout307 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout307:setParent(obj.rectangle1);
    obj.layout307:setLeft(546);
    obj.layout307:setTop(1581);
    obj.layout307:setWidth(22);
    obj.layout307:setHeight(25);
    obj.layout307:setName("layout307");

    obj.imageCheckBox257 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox257:setParent(obj.layout307);
    obj.imageCheckBox257:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox257:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox257:setLeft(0);
    obj.imageCheckBox257:setTop(0);
    obj.imageCheckBox257:setWidth(22);
    obj.imageCheckBox257:setHeight(26);
    obj.imageCheckBox257:setField("Gnose_021");
    obj.imageCheckBox257:setName("imageCheckBox257");

    obj.layout308 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout308:setParent(obj.rectangle1);
    obj.layout308:setLeft(582);
    obj.layout308:setTop(1581);
    obj.layout308:setWidth(22);
    obj.layout308:setHeight(25);
    obj.layout308:setName("layout308");

    obj.imageCheckBox258 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox258:setParent(obj.layout308);
    obj.imageCheckBox258:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox258:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox258:setLeft(0);
    obj.imageCheckBox258:setTop(0);
    obj.imageCheckBox258:setWidth(22);
    obj.imageCheckBox258:setHeight(26);
    obj.imageCheckBox258:setField("Gnose_031");
    obj.imageCheckBox258:setName("imageCheckBox258");

    obj.layout309 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout309:setParent(obj.rectangle1);
    obj.layout309:setLeft(617);
    obj.layout309:setTop(1581);
    obj.layout309:setWidth(22);
    obj.layout309:setHeight(25);
    obj.layout309:setName("layout309");

    obj.imageCheckBox259 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox259:setParent(obj.layout309);
    obj.imageCheckBox259:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox259:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox259:setLeft(0);
    obj.imageCheckBox259:setTop(0);
    obj.imageCheckBox259:setWidth(22);
    obj.imageCheckBox259:setHeight(26);
    obj.imageCheckBox259:setField("Gnose_041");
    obj.imageCheckBox259:setName("imageCheckBox259");

    obj.layout310 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout310:setParent(obj.rectangle1);
    obj.layout310:setLeft(655);
    obj.layout310:setTop(1581);
    obj.layout310:setWidth(22);
    obj.layout310:setHeight(25);
    obj.layout310:setName("layout310");

    obj.imageCheckBox260 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox260:setParent(obj.layout310);
    obj.imageCheckBox260:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox260:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox260:setLeft(0);
    obj.imageCheckBox260:setTop(0);
    obj.imageCheckBox260:setWidth(22);
    obj.imageCheckBox260:setHeight(26);
    obj.imageCheckBox260:setField("Gnose_051");
    obj.imageCheckBox260:setName("imageCheckBox260");

    obj.layout311 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout311:setParent(obj.rectangle1);
    obj.layout311:setLeft(691);
    obj.layout311:setTop(1581);
    obj.layout311:setWidth(22);
    obj.layout311:setHeight(25);
    obj.layout311:setName("layout311");

    obj.imageCheckBox261 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox261:setParent(obj.layout311);
    obj.imageCheckBox261:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox261:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox261:setLeft(0);
    obj.imageCheckBox261:setTop(0);
    obj.imageCheckBox261:setWidth(22);
    obj.imageCheckBox261:setHeight(26);
    obj.imageCheckBox261:setField("Gnose_061");
    obj.imageCheckBox261:setName("imageCheckBox261");

    obj.layout312 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout312:setParent(obj.rectangle1);
    obj.layout312:setLeft(729);
    obj.layout312:setTop(1581);
    obj.layout312:setWidth(22);
    obj.layout312:setHeight(25);
    obj.layout312:setName("layout312");

    obj.imageCheckBox262 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox262:setParent(obj.layout312);
    obj.imageCheckBox262:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox262:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox262:setLeft(0);
    obj.imageCheckBox262:setTop(0);
    obj.imageCheckBox262:setWidth(22);
    obj.imageCheckBox262:setHeight(26);
    obj.imageCheckBox262:setField("Gnose_071");
    obj.imageCheckBox262:setName("imageCheckBox262");

    obj.layout313 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout313:setParent(obj.rectangle1);
    obj.layout313:setLeft(764);
    obj.layout313:setTop(1581);
    obj.layout313:setWidth(22);
    obj.layout313:setHeight(25);
    obj.layout313:setName("layout313");

    obj.imageCheckBox263 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox263:setParent(obj.layout313);
    obj.imageCheckBox263:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox263:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox263:setLeft(0);
    obj.imageCheckBox263:setTop(0);
    obj.imageCheckBox263:setWidth(22);
    obj.imageCheckBox263:setHeight(26);
    obj.imageCheckBox263:setField("Gnose_081");
    obj.imageCheckBox263:setName("imageCheckBox263");

    obj.layout314 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout314:setParent(obj.rectangle1);
    obj.layout314:setLeft(802);
    obj.layout314:setTop(1581);
    obj.layout314:setWidth(22);
    obj.layout314:setHeight(25);
    obj.layout314:setName("layout314");

    obj.imageCheckBox264 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox264:setParent(obj.layout314);
    obj.imageCheckBox264:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox264:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox264:setLeft(0);
    obj.imageCheckBox264:setTop(0);
    obj.imageCheckBox264:setWidth(22);
    obj.imageCheckBox264:setHeight(26);
    obj.imageCheckBox264:setField("Gnose_091");
    obj.imageCheckBox264:setName("imageCheckBox264");

    obj.layout315 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout315:setParent(obj.rectangle1);
    obj.layout315:setLeft(838);
    obj.layout315:setTop(1581);
    obj.layout315:setWidth(22);
    obj.layout315:setHeight(25);
    obj.layout315:setName("layout315");

    obj.imageCheckBox265 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox265:setParent(obj.layout315);
    obj.imageCheckBox265:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox265:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox265:setLeft(0);
    obj.imageCheckBox265:setTop(0);
    obj.imageCheckBox265:setWidth(22);
    obj.imageCheckBox265:setHeight(26);
    obj.imageCheckBox265:setField("Gnose_101");
    obj.imageCheckBox265:setName("imageCheckBox265");

    obj.layout316 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout316:setParent(obj.rectangle1);
    obj.layout316:setLeft(509);
    obj.layout316:setTop(1440);
    obj.layout316:setWidth(20);
    obj.layout316:setHeight(21);
    obj.layout316:setName("layout316");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout316);
    obj.checkBox13:setScale(1.5);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(0);
    obj.checkBox13:setWidth(20);
    obj.checkBox13:setHeight(22);
    obj.checkBox13:setField("Furia_11");
    obj.checkBox13:setName("checkBox13");

    obj.layout317 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout317:setParent(obj.rectangle1);
    obj.layout317:setLeft(546);
    obj.layout317:setTop(1440);
    obj.layout317:setWidth(20);
    obj.layout317:setHeight(21);
    obj.layout317:setName("layout317");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout317);
    obj.checkBox14:setScale(1.5);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setTop(0);
    obj.checkBox14:setWidth(20);
    obj.checkBox14:setHeight(22);
    obj.checkBox14:setField("Furia_12");
    obj.checkBox14:setName("checkBox14");

    obj.layout318 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout318:setParent(obj.rectangle1);
    obj.layout318:setLeft(584);
    obj.layout318:setTop(1440);
    obj.layout318:setWidth(20);
    obj.layout318:setHeight(21);
    obj.layout318:setName("layout318");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout318);
    obj.checkBox15:setScale(1.5);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setTop(0);
    obj.checkBox15:setWidth(20);
    obj.checkBox15:setHeight(22);
    obj.checkBox15:setField("Furia_13");
    obj.checkBox15:setName("checkBox15");

    obj.layout319 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout319:setParent(obj.rectangle1);
    obj.layout319:setLeft(620);
    obj.layout319:setTop(1440);
    obj.layout319:setWidth(20);
    obj.layout319:setHeight(21);
    obj.layout319:setName("layout319");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout319);
    obj.checkBox16:setScale(1.5);
    obj.checkBox16:setLeft(0);
    obj.checkBox16:setTop(0);
    obj.checkBox16:setWidth(20);
    obj.checkBox16:setHeight(22);
    obj.checkBox16:setField("Furia_14");
    obj.checkBox16:setName("checkBox16");

    obj.layout320 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout320:setParent(obj.rectangle1);
    obj.layout320:setLeft(658);
    obj.layout320:setTop(1440);
    obj.layout320:setWidth(20);
    obj.layout320:setHeight(21);
    obj.layout320:setName("layout320");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout320);
    obj.checkBox17:setScale(1.5);
    obj.checkBox17:setLeft(0);
    obj.checkBox17:setTop(0);
    obj.checkBox17:setWidth(20);
    obj.checkBox17:setHeight(22);
    obj.checkBox17:setField("Furia_15");
    obj.checkBox17:setName("checkBox17");

    obj.layout321 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout321:setParent(obj.rectangle1);
    obj.layout321:setLeft(696);
    obj.layout321:setTop(1440);
    obj.layout321:setWidth(20);
    obj.layout321:setHeight(21);
    obj.layout321:setName("layout321");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout321);
    obj.checkBox18:setScale(1.5);
    obj.checkBox18:setLeft(0);
    obj.checkBox18:setTop(0);
    obj.checkBox18:setWidth(20);
    obj.checkBox18:setHeight(22);
    obj.checkBox18:setField("Furia_16");
    obj.checkBox18:setName("checkBox18");

    obj.layout322 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout322:setParent(obj.rectangle1);
    obj.layout322:setLeft(733);
    obj.layout322:setTop(1440);
    obj.layout322:setWidth(20);
    obj.layout322:setHeight(21);
    obj.layout322:setName("layout322");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout322);
    obj.checkBox19:setScale(1.5);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setTop(0);
    obj.checkBox19:setWidth(20);
    obj.checkBox19:setHeight(22);
    obj.checkBox19:setField("Furia_17");
    obj.checkBox19:setName("checkBox19");

    obj.layout323 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout323:setParent(obj.rectangle1);
    obj.layout323:setLeft(769);
    obj.layout323:setTop(1440);
    obj.layout323:setWidth(20);
    obj.layout323:setHeight(21);
    obj.layout323:setName("layout323");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout323);
    obj.checkBox20:setScale(1.5);
    obj.checkBox20:setLeft(0);
    obj.checkBox20:setTop(0);
    obj.checkBox20:setWidth(20);
    obj.checkBox20:setHeight(22);
    obj.checkBox20:setField("Furia_18");
    obj.checkBox20:setName("checkBox20");

    obj.layout324 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout324:setParent(obj.rectangle1);
    obj.layout324:setLeft(806);
    obj.layout324:setTop(1440);
    obj.layout324:setWidth(20);
    obj.layout324:setHeight(21);
    obj.layout324:setName("layout324");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout324);
    obj.checkBox21:setScale(1.5);
    obj.checkBox21:setLeft(0);
    obj.checkBox21:setTop(0);
    obj.checkBox21:setWidth(20);
    obj.checkBox21:setHeight(22);
    obj.checkBox21:setField("Furia_19");
    obj.checkBox21:setName("checkBox21");

    obj.layout325 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout325:setParent(obj.rectangle1);
    obj.layout325:setLeft(841);
    obj.layout325:setTop(1440);
    obj.layout325:setWidth(20);
    obj.layout325:setHeight(21);
    obj.layout325:setName("layout325");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout325);
    obj.checkBox22:setScale(1.5);
    obj.checkBox22:setLeft(0);
    obj.checkBox22:setTop(0);
    obj.checkBox22:setWidth(20);
    obj.checkBox22:setHeight(22);
    obj.checkBox22:setField("Furia_20");
    obj.checkBox22:setName("checkBox22");

    obj.layout326 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout326:setParent(obj.rectangle1);
    obj.layout326:setLeft(1216);
    obj.layout326:setTop(1405);
    obj.layout326:setWidth(20);
    obj.layout326:setHeight(21);
    obj.layout326:setName("layout326");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout326);
    obj.checkBox23:setScale(1.5);
    obj.checkBox23:setLeft(0);
    obj.checkBox23:setTop(0);
    obj.checkBox23:setWidth(20);
    obj.checkBox23:setHeight(22);
    obj.checkBox23:setField("Vitalidade_1");
    obj.checkBox23:setName("checkBox23");

    obj.layout327 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout327:setParent(obj.rectangle1);
    obj.layout327:setLeft(1216);
    obj.layout327:setTop(1470);
    obj.layout327:setWidth(20);
    obj.layout327:setHeight(21);
    obj.layout327:setName("layout327");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout327);
    obj.checkBox24:setScale(1.5);
    obj.checkBox24:setLeft(0);
    obj.checkBox24:setTop(0);
    obj.checkBox24:setWidth(20);
    obj.checkBox24:setHeight(22);
    obj.checkBox24:setField("Vitalidade_3");
    obj.checkBox24:setName("checkBox24");

    obj.layout328 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout328:setParent(obj.rectangle1);
    obj.layout328:setLeft(1216);
    obj.layout328:setTop(1503);
    obj.layout328:setWidth(20);
    obj.layout328:setHeight(21);
    obj.layout328:setName("layout328");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout328);
    obj.checkBox25:setScale(1.5);
    obj.checkBox25:setLeft(0);
    obj.checkBox25:setTop(0);
    obj.checkBox25:setWidth(20);
    obj.checkBox25:setHeight(22);
    obj.checkBox25:setField("Vitalidade_4");
    obj.checkBox25:setName("checkBox25");

    obj.layout329 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout329:setParent(obj.rectangle1);
    obj.layout329:setLeft(1216);
    obj.layout329:setTop(1536);
    obj.layout329:setWidth(20);
    obj.layout329:setHeight(21);
    obj.layout329:setName("layout329");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout329);
    obj.checkBox26:setScale(1.5);
    obj.checkBox26:setLeft(0);
    obj.checkBox26:setTop(0);
    obj.checkBox26:setWidth(20);
    obj.checkBox26:setHeight(22);
    obj.checkBox26:setField("Vitalidade_5");
    obj.checkBox26:setName("checkBox26");

    obj.layout330 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout330:setParent(obj.rectangle1);
    obj.layout330:setLeft(1216);
    obj.layout330:setTop(1569);
    obj.layout330:setWidth(20);
    obj.layout330:setHeight(21);
    obj.layout330:setName("layout330");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout330);
    obj.checkBox27:setScale(1.5);
    obj.checkBox27:setLeft(0);
    obj.checkBox27:setTop(0);
    obj.checkBox27:setWidth(20);
    obj.checkBox27:setHeight(22);
    obj.checkBox27:setField("Vitalidade_6");
    obj.checkBox27:setName("checkBox27");

    obj.layout331 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout331:setParent(obj.rectangle1);
    obj.layout331:setLeft(1216);
    obj.layout331:setTop(1602);
    obj.layout331:setWidth(20);
    obj.layout331:setHeight(21);
    obj.layout331:setName("layout331");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout331);
    obj.checkBox28:setScale(1.5);
    obj.checkBox28:setLeft(0);
    obj.checkBox28:setTop(0);
    obj.checkBox28:setWidth(20);
    obj.checkBox28:setHeight(22);
    obj.checkBox28:setField("Vitalidade_7");
    obj.checkBox28:setName("checkBox28");

    obj.layout332 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout332:setParent(obj.rectangle1);
    obj.layout332:setLeft(1255);
    obj.layout332:setTop(1404);
    obj.layout332:setWidth(20);
    obj.layout332:setHeight(21);
    obj.layout332:setName("layout332");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout332);
    obj.checkBox29:setScale(1.5);
    obj.checkBox29:setLeft(0);
    obj.checkBox29:setTop(0);
    obj.checkBox29:setWidth(20);
    obj.checkBox29:setHeight(22);
    obj.checkBox29:setField("Vitalidade_8");
    obj.checkBox29:setName("checkBox29");

    obj.layout333 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout333:setParent(obj.rectangle1);
    obj.layout333:setLeft(1255);
    obj.layout333:setTop(1471);
    obj.layout333:setWidth(20);
    obj.layout333:setHeight(21);
    obj.layout333:setName("layout333");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout333);
    obj.checkBox30:setScale(1.5);
    obj.checkBox30:setLeft(0);
    obj.checkBox30:setTop(0);
    obj.checkBox30:setWidth(20);
    obj.checkBox30:setHeight(22);
    obj.checkBox30:setField("Vitalidade_10");
    obj.checkBox30:setName("checkBox30");

    obj.layout334 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout334:setParent(obj.rectangle1);
    obj.layout334:setLeft(1255);
    obj.layout334:setTop(1503);
    obj.layout334:setWidth(20);
    obj.layout334:setHeight(21);
    obj.layout334:setName("layout334");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout334);
    obj.checkBox31:setScale(1.5);
    obj.checkBox31:setLeft(0);
    obj.checkBox31:setTop(0);
    obj.checkBox31:setWidth(20);
    obj.checkBox31:setHeight(22);
    obj.checkBox31:setField("Vitalidade_11");
    obj.checkBox31:setName("checkBox31");

    obj.layout335 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout335:setParent(obj.rectangle1);
    obj.layout335:setLeft(1255);
    obj.layout335:setTop(1536);
    obj.layout335:setWidth(20);
    obj.layout335:setHeight(21);
    obj.layout335:setName("layout335");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout335);
    obj.checkBox32:setScale(1.5);
    obj.checkBox32:setLeft(0);
    obj.checkBox32:setTop(0);
    obj.checkBox32:setWidth(20);
    obj.checkBox32:setHeight(22);
    obj.checkBox32:setField("Vitalidade_12");
    obj.checkBox32:setName("checkBox32");

    obj.layout336 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout336:setParent(obj.rectangle1);
    obj.layout336:setLeft(1255);
    obj.layout336:setTop(1602);
    obj.layout336:setWidth(20);
    obj.layout336:setHeight(21);
    obj.layout336:setName("layout336");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout336);
    obj.checkBox33:setScale(1.5);
    obj.checkBox33:setLeft(0);
    obj.checkBox33:setTop(0);
    obj.checkBox33:setWidth(20);
    obj.checkBox33:setHeight(22);
    obj.checkBox33:setField("Vitalidade_14");
    obj.checkBox33:setName("checkBox33");

    obj.layout337 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout337:setParent(obj.rectangle1);
    obj.layout337:setLeft(113);
    obj.layout337:setTop(1597);
    obj.layout337:setWidth(20);
    obj.layout337:setHeight(21);
    obj.layout337:setName("layout337");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout337);
    obj.checkBox34:setScale(1.5);
    obj.checkBox34:setLeft(0);
    obj.checkBox34:setTop(0);
    obj.checkBox34:setWidth(20);
    obj.checkBox34:setHeight(22);
    obj.checkBox34:setField("Honra_11");
    obj.checkBox34:setName("checkBox34");

    obj.layout338 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout338:setParent(obj.rectangle1);
    obj.layout338:setLeft(150);
    obj.layout338:setTop(1597);
    obj.layout338:setWidth(20);
    obj.layout338:setHeight(21);
    obj.layout338:setName("layout338");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout338);
    obj.checkBox35:setScale(1.5);
    obj.checkBox35:setLeft(0);
    obj.checkBox35:setTop(0);
    obj.checkBox35:setWidth(20);
    obj.checkBox35:setHeight(22);
    obj.checkBox35:setField("Honra_12");
    obj.checkBox35:setName("checkBox35");

    obj.layout339 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout339:setParent(obj.rectangle1);
    obj.layout339:setLeft(188);
    obj.layout339:setTop(1597);
    obj.layout339:setWidth(20);
    obj.layout339:setHeight(21);
    obj.layout339:setName("layout339");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout339);
    obj.checkBox36:setScale(1.5);
    obj.checkBox36:setLeft(0);
    obj.checkBox36:setTop(0);
    obj.checkBox36:setWidth(20);
    obj.checkBox36:setHeight(22);
    obj.checkBox36:setField("Honra_13");
    obj.checkBox36:setName("checkBox36");

    obj.layout340 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout340:setParent(obj.rectangle1);
    obj.layout340:setLeft(225);
    obj.layout340:setTop(1597);
    obj.layout340:setWidth(20);
    obj.layout340:setHeight(21);
    obj.layout340:setName("layout340");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout340);
    obj.checkBox37:setScale(1.5);
    obj.checkBox37:setLeft(0);
    obj.checkBox37:setTop(0);
    obj.checkBox37:setWidth(20);
    obj.checkBox37:setHeight(22);
    obj.checkBox37:setField("Honra_14");
    obj.checkBox37:setName("checkBox37");

    obj.layout341 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout341:setParent(obj.rectangle1);
    obj.layout341:setLeft(263);
    obj.layout341:setTop(1597);
    obj.layout341:setWidth(20);
    obj.layout341:setHeight(21);
    obj.layout341:setName("layout341");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout341);
    obj.checkBox38:setScale(1.5);
    obj.checkBox38:setLeft(0);
    obj.checkBox38:setTop(0);
    obj.checkBox38:setWidth(20);
    obj.checkBox38:setHeight(22);
    obj.checkBox38:setField("Honra_15");
    obj.checkBox38:setName("checkBox38");

    obj.layout342 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout342:setParent(obj.rectangle1);
    obj.layout342:setLeft(300);
    obj.layout342:setTop(1597);
    obj.layout342:setWidth(20);
    obj.layout342:setHeight(21);
    obj.layout342:setName("layout342");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout342);
    obj.checkBox39:setScale(1.5);
    obj.checkBox39:setLeft(0);
    obj.checkBox39:setTop(0);
    obj.checkBox39:setWidth(20);
    obj.checkBox39:setHeight(22);
    obj.checkBox39:setField("Honra_16");
    obj.checkBox39:setName("checkBox39");

    obj.layout343 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout343:setParent(obj.rectangle1);
    obj.layout343:setLeft(338);
    obj.layout343:setTop(1597);
    obj.layout343:setWidth(20);
    obj.layout343:setHeight(21);
    obj.layout343:setName("layout343");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout343);
    obj.checkBox40:setScale(1.5);
    obj.checkBox40:setLeft(0);
    obj.checkBox40:setTop(0);
    obj.checkBox40:setWidth(20);
    obj.checkBox40:setHeight(22);
    obj.checkBox40:setField("Honra_17");
    obj.checkBox40:setName("checkBox40");

    obj.layout344 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout344:setParent(obj.rectangle1);
    obj.layout344:setLeft(373);
    obj.layout344:setTop(1597);
    obj.layout344:setWidth(20);
    obj.layout344:setHeight(21);
    obj.layout344:setName("layout344");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout344);
    obj.checkBox41:setScale(1.5);
    obj.checkBox41:setLeft(0);
    obj.checkBox41:setTop(0);
    obj.checkBox41:setWidth(20);
    obj.checkBox41:setHeight(22);
    obj.checkBox41:setField("Honra_18");
    obj.checkBox41:setName("checkBox41");

    obj.layout345 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout345:setParent(obj.rectangle1);
    obj.layout345:setLeft(410);
    obj.layout345:setTop(1597);
    obj.layout345:setWidth(20);
    obj.layout345:setHeight(21);
    obj.layout345:setName("layout345");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout345);
    obj.checkBox42:setScale(1.5);
    obj.checkBox42:setLeft(0);
    obj.checkBox42:setTop(0);
    obj.checkBox42:setWidth(20);
    obj.checkBox42:setHeight(22);
    obj.checkBox42:setField("Honra_19");
    obj.checkBox42:setName("checkBox42");

    obj.layout346 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout346:setParent(obj.rectangle1);
    obj.layout346:setLeft(445);
    obj.layout346:setTop(1597);
    obj.layout346:setWidth(20);
    obj.layout346:setHeight(21);
    obj.layout346:setName("layout346");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout346);
    obj.checkBox43:setScale(1.5);
    obj.checkBox43:setLeft(0);
    obj.checkBox43:setTop(0);
    obj.checkBox43:setWidth(20);
    obj.checkBox43:setHeight(22);
    obj.checkBox43:setField("Honra_20");
    obj.checkBox43:setName("checkBox43");

    obj.layout347 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout347:setParent(obj.rectangle1);
    obj.layout347:setLeft(509);
    obj.layout347:setTop(1615);
    obj.layout347:setWidth(20);
    obj.layout347:setHeight(21);
    obj.layout347:setName("layout347");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout347);
    obj.checkBox44:setScale(1.5);
    obj.checkBox44:setLeft(0);
    obj.checkBox44:setTop(0);
    obj.checkBox44:setWidth(20);
    obj.checkBox44:setHeight(22);
    obj.checkBox44:setField("Gnose_11__0");
    obj.checkBox44:setName("checkBox44");

    obj.layout348 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout348:setParent(obj.rectangle1);
    obj.layout348:setLeft(546);
    obj.layout348:setTop(1615);
    obj.layout348:setWidth(20);
    obj.layout348:setHeight(21);
    obj.layout348:setName("layout348");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout348);
    obj.checkBox45:setScale(1.5);
    obj.checkBox45:setLeft(0);
    obj.checkBox45:setTop(0);
    obj.checkBox45:setWidth(20);
    obj.checkBox45:setHeight(22);
    obj.checkBox45:setField("Gnose_12__0");
    obj.checkBox45:setName("checkBox45");

    obj.layout349 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout349:setParent(obj.rectangle1);
    obj.layout349:setLeft(584);
    obj.layout349:setTop(1615);
    obj.layout349:setWidth(20);
    obj.layout349:setHeight(21);
    obj.layout349:setName("layout349");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout349);
    obj.checkBox46:setScale(1.5);
    obj.checkBox46:setLeft(0);
    obj.checkBox46:setTop(0);
    obj.checkBox46:setWidth(20);
    obj.checkBox46:setHeight(22);
    obj.checkBox46:setField("Gnose_13__0");
    obj.checkBox46:setName("checkBox46");

    obj.layout350 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout350:setParent(obj.rectangle1);
    obj.layout350:setLeft(620);
    obj.layout350:setTop(1615);
    obj.layout350:setWidth(20);
    obj.layout350:setHeight(21);
    obj.layout350:setName("layout350");

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout350);
    obj.checkBox47:setScale(1.5);
    obj.checkBox47:setLeft(0);
    obj.checkBox47:setTop(0);
    obj.checkBox47:setWidth(20);
    obj.checkBox47:setHeight(22);
    obj.checkBox47:setField("Gnose_14__0");
    obj.checkBox47:setName("checkBox47");

    obj.layout351 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout351:setParent(obj.rectangle1);
    obj.layout351:setLeft(658);
    obj.layout351:setTop(1615);
    obj.layout351:setWidth(20);
    obj.layout351:setHeight(21);
    obj.layout351:setName("layout351");

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout351);
    obj.checkBox48:setScale(1.5);
    obj.checkBox48:setLeft(0);
    obj.checkBox48:setTop(0);
    obj.checkBox48:setWidth(20);
    obj.checkBox48:setHeight(22);
    obj.checkBox48:setField("Gnose_15__0");
    obj.checkBox48:setName("checkBox48");

    obj.layout352 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout352:setParent(obj.rectangle1);
    obj.layout352:setLeft(697);
    obj.layout352:setTop(1615);
    obj.layout352:setWidth(20);
    obj.layout352:setHeight(21);
    obj.layout352:setName("layout352");

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout352);
    obj.checkBox49:setScale(1.5);
    obj.checkBox49:setLeft(0);
    obj.checkBox49:setTop(0);
    obj.checkBox49:setWidth(20);
    obj.checkBox49:setHeight(22);
    obj.checkBox49:setField("Gnose_16__0");
    obj.checkBox49:setName("checkBox49");

    obj.layout353 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout353:setParent(obj.rectangle1);
    obj.layout353:setLeft(732);
    obj.layout353:setTop(1615);
    obj.layout353:setWidth(20);
    obj.layout353:setHeight(21);
    obj.layout353:setName("layout353");

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout353);
    obj.checkBox50:setScale(1.5);
    obj.checkBox50:setLeft(0);
    obj.checkBox50:setTop(0);
    obj.checkBox50:setWidth(20);
    obj.checkBox50:setHeight(22);
    obj.checkBox50:setField("Gnose_17__0");
    obj.checkBox50:setName("checkBox50");

    obj.layout354 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout354:setParent(obj.rectangle1);
    obj.layout354:setLeft(769);
    obj.layout354:setTop(1615);
    obj.layout354:setWidth(20);
    obj.layout354:setHeight(21);
    obj.layout354:setName("layout354");

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout354);
    obj.checkBox51:setScale(1.5);
    obj.checkBox51:setLeft(0);
    obj.checkBox51:setTop(0);
    obj.checkBox51:setWidth(20);
    obj.checkBox51:setHeight(22);
    obj.checkBox51:setField("Gnose_18__0");
    obj.checkBox51:setName("checkBox51");

    obj.layout355 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout355:setParent(obj.rectangle1);
    obj.layout355:setLeft(806);
    obj.layout355:setTop(1615);
    obj.layout355:setWidth(20);
    obj.layout355:setHeight(21);
    obj.layout355:setName("layout355");

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout355);
    obj.checkBox52:setScale(1.5);
    obj.checkBox52:setLeft(0);
    obj.checkBox52:setTop(0);
    obj.checkBox52:setWidth(20);
    obj.checkBox52:setHeight(22);
    obj.checkBox52:setField("Gnose_19__0");
    obj.checkBox52:setName("checkBox52");

    obj.layout356 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout356:setParent(obj.rectangle1);
    obj.layout356:setLeft(841);
    obj.layout356:setTop(1615);
    obj.layout356:setWidth(20);
    obj.layout356:setHeight(21);
    obj.layout356:setName("layout356");

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout356);
    obj.checkBox53:setScale(1.5);
    obj.checkBox53:setLeft(0);
    obj.checkBox53:setTop(0);
    obj.checkBox53:setWidth(20);
    obj.checkBox53:setHeight(22);
    obj.checkBox53:setField("Gnose_20__0");
    obj.checkBox53:setName("checkBox53");

    obj.layout357 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout357:setParent(obj.rectangle1);
    obj.layout357:setLeft(1255);
    obj.layout357:setTop(1568);
    obj.layout357:setWidth(20);
    obj.layout357:setHeight(21);
    obj.layout357:setName("layout357");

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout357);
    obj.checkBox54:setScale(1.5);
    obj.checkBox54:setLeft(0);
    obj.checkBox54:setTop(0);
    obj.checkBox54:setWidth(20);
    obj.checkBox54:setHeight(22);
    obj.checkBox54:setField("Vitalidade_13");
    obj.checkBox54:setName("checkBox54");

    obj.layout358 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout358:setParent(obj.rectangle1);
    obj.layout358:setLeft(114);
    obj.layout358:setTop(1679);
    obj.layout358:setWidth(22);
    obj.layout358:setHeight(25);
    obj.layout358:setName("layout358");

    obj.imageCheckBox266 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox266:setParent(obj.layout358);
    obj.imageCheckBox266:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox266:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox266:setLeft(0);
    obj.imageCheckBox266:setTop(0);
    obj.imageCheckBox266:setWidth(22);
    obj.imageCheckBox266:setHeight(26);
    obj.imageCheckBox266:setField("Sabedoria_01");
    obj.imageCheckBox266:setName("imageCheckBox266");

    obj.layout359 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout359:setParent(obj.rectangle1);
    obj.layout359:setLeft(149);
    obj.layout359:setTop(1679);
    obj.layout359:setWidth(22);
    obj.layout359:setHeight(25);
    obj.layout359:setName("layout359");

    obj.imageCheckBox267 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox267:setParent(obj.layout359);
    obj.imageCheckBox267:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox267:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox267:setLeft(0);
    obj.imageCheckBox267:setTop(0);
    obj.imageCheckBox267:setWidth(22);
    obj.imageCheckBox267:setHeight(26);
    obj.imageCheckBox267:setField("Sabedoria_02");
    obj.imageCheckBox267:setName("imageCheckBox267");

    obj.layout360 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout360:setParent(obj.rectangle1);
    obj.layout360:setLeft(185);
    obj.layout360:setTop(1679);
    obj.layout360:setWidth(22);
    obj.layout360:setHeight(25);
    obj.layout360:setName("layout360");

    obj.imageCheckBox268 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox268:setParent(obj.layout360);
    obj.imageCheckBox268:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox268:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox268:setLeft(0);
    obj.imageCheckBox268:setTop(0);
    obj.imageCheckBox268:setWidth(22);
    obj.imageCheckBox268:setHeight(26);
    obj.imageCheckBox268:setField("Sabedoria_03");
    obj.imageCheckBox268:setName("imageCheckBox268");

    obj.layout361 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout361:setParent(obj.rectangle1);
    obj.layout361:setLeft(223);
    obj.layout361:setTop(1679);
    obj.layout361:setWidth(22);
    obj.layout361:setHeight(25);
    obj.layout361:setName("layout361");

    obj.imageCheckBox269 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox269:setParent(obj.layout361);
    obj.imageCheckBox269:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox269:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox269:setLeft(0);
    obj.imageCheckBox269:setTop(0);
    obj.imageCheckBox269:setWidth(22);
    obj.imageCheckBox269:setHeight(26);
    obj.imageCheckBox269:setField("Sabedoria_04");
    obj.imageCheckBox269:setName("imageCheckBox269");

    obj.layout362 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout362:setParent(obj.rectangle1);
    obj.layout362:setLeft(258);
    obj.layout362:setTop(1679);
    obj.layout362:setWidth(22);
    obj.layout362:setHeight(25);
    obj.layout362:setName("layout362");

    obj.imageCheckBox270 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox270:setParent(obj.layout362);
    obj.imageCheckBox270:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox270:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox270:setLeft(0);
    obj.imageCheckBox270:setTop(0);
    obj.imageCheckBox270:setWidth(22);
    obj.imageCheckBox270:setHeight(26);
    obj.imageCheckBox270:setField("Sabedoria_05");
    obj.imageCheckBox270:setName("imageCheckBox270");

    obj.layout363 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout363:setParent(obj.rectangle1);
    obj.layout363:setLeft(294);
    obj.layout363:setTop(1679);
    obj.layout363:setWidth(22);
    obj.layout363:setHeight(25);
    obj.layout363:setName("layout363");

    obj.imageCheckBox271 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox271:setParent(obj.layout363);
    obj.imageCheckBox271:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox271:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox271:setLeft(0);
    obj.imageCheckBox271:setTop(0);
    obj.imageCheckBox271:setWidth(22);
    obj.imageCheckBox271:setHeight(26);
    obj.imageCheckBox271:setField("Sabedoria_06");
    obj.imageCheckBox271:setName("imageCheckBox271");

    obj.layout364 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout364:setParent(obj.rectangle1);
    obj.layout364:setLeft(332);
    obj.layout364:setTop(1679);
    obj.layout364:setWidth(22);
    obj.layout364:setHeight(25);
    obj.layout364:setName("layout364");

    obj.imageCheckBox272 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox272:setParent(obj.layout364);
    obj.imageCheckBox272:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox272:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox272:setLeft(0);
    obj.imageCheckBox272:setTop(0);
    obj.imageCheckBox272:setWidth(22);
    obj.imageCheckBox272:setHeight(26);
    obj.imageCheckBox272:setField("Sabedoria_07");
    obj.imageCheckBox272:setName("imageCheckBox272");

    obj.layout365 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout365:setParent(obj.rectangle1);
    obj.layout365:setLeft(368);
    obj.layout365:setTop(1679);
    obj.layout365:setWidth(22);
    obj.layout365:setHeight(25);
    obj.layout365:setName("layout365");

    obj.imageCheckBox273 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox273:setParent(obj.layout365);
    obj.imageCheckBox273:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox273:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox273:setLeft(0);
    obj.imageCheckBox273:setTop(0);
    obj.imageCheckBox273:setWidth(22);
    obj.imageCheckBox273:setHeight(26);
    obj.imageCheckBox273:setField("Sabedoria_08");
    obj.imageCheckBox273:setName("imageCheckBox273");

    obj.layout366 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout366:setParent(obj.rectangle1);
    obj.layout366:setLeft(406);
    obj.layout366:setTop(1679);
    obj.layout366:setWidth(22);
    obj.layout366:setHeight(25);
    obj.layout366:setName("layout366");

    obj.imageCheckBox274 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox274:setParent(obj.layout366);
    obj.imageCheckBox274:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox274:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox274:setLeft(0);
    obj.imageCheckBox274:setTop(0);
    obj.imageCheckBox274:setWidth(22);
    obj.imageCheckBox274:setHeight(26);
    obj.imageCheckBox274:setField("Sabedoria_09");
    obj.imageCheckBox274:setName("imageCheckBox274");

    obj.layout367 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout367:setParent(obj.rectangle1);
    obj.layout367:setLeft(441);
    obj.layout367:setTop(1679);
    obj.layout367:setWidth(22);
    obj.layout367:setHeight(25);
    obj.layout367:setName("layout367");

    obj.imageCheckBox275 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox275:setParent(obj.layout367);
    obj.imageCheckBox275:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox275:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox275:setLeft(0);
    obj.imageCheckBox275:setTop(0);
    obj.imageCheckBox275:setWidth(22);
    obj.imageCheckBox275:setHeight(26);
    obj.imageCheckBox275:setField("Sabedoria_10");
    obj.imageCheckBox275:setName("imageCheckBox275");

    obj.layout368 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout368:setParent(obj.rectangle1);
    obj.layout368:setLeft(113);
    obj.layout368:setTop(1712);
    obj.layout368:setWidth(20);
    obj.layout368:setHeight(21);
    obj.layout368:setName("layout368");

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout368);
    obj.checkBox55:setScale(1.5);
    obj.checkBox55:setLeft(0);
    obj.checkBox55:setTop(0);
    obj.checkBox55:setWidth(20);
    obj.checkBox55:setHeight(22);
    obj.checkBox55:setField("Sabedoria_11");
    obj.checkBox55:setName("checkBox55");

    obj.layout369 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout369:setParent(obj.rectangle1);
    obj.layout369:setLeft(150);
    obj.layout369:setTop(1712);
    obj.layout369:setWidth(20);
    obj.layout369:setHeight(21);
    obj.layout369:setName("layout369");

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout369);
    obj.checkBox56:setScale(1.5);
    obj.checkBox56:setLeft(0);
    obj.checkBox56:setTop(0);
    obj.checkBox56:setWidth(20);
    obj.checkBox56:setHeight(22);
    obj.checkBox56:setField("Sabedoria_12");
    obj.checkBox56:setName("checkBox56");

    obj.layout370 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout370:setParent(obj.rectangle1);
    obj.layout370:setLeft(188);
    obj.layout370:setTop(1712);
    obj.layout370:setWidth(20);
    obj.layout370:setHeight(21);
    obj.layout370:setName("layout370");

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout370);
    obj.checkBox57:setScale(1.5);
    obj.checkBox57:setLeft(0);
    obj.checkBox57:setTop(0);
    obj.checkBox57:setWidth(20);
    obj.checkBox57:setHeight(22);
    obj.checkBox57:setField("Sabedoria_13");
    obj.checkBox57:setName("checkBox57");

    obj.layout371 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout371:setParent(obj.rectangle1);
    obj.layout371:setLeft(225);
    obj.layout371:setTop(1712);
    obj.layout371:setWidth(20);
    obj.layout371:setHeight(21);
    obj.layout371:setName("layout371");

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout371);
    obj.checkBox58:setScale(1.5);
    obj.checkBox58:setLeft(0);
    obj.checkBox58:setTop(0);
    obj.checkBox58:setWidth(20);
    obj.checkBox58:setHeight(22);
    obj.checkBox58:setField("Sabedoria_14");
    obj.checkBox58:setName("checkBox58");

    obj.layout372 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout372:setParent(obj.rectangle1);
    obj.layout372:setLeft(263);
    obj.layout372:setTop(1712);
    obj.layout372:setWidth(20);
    obj.layout372:setHeight(21);
    obj.layout372:setName("layout372");

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout372);
    obj.checkBox59:setScale(1.5);
    obj.checkBox59:setLeft(0);
    obj.checkBox59:setTop(0);
    obj.checkBox59:setWidth(20);
    obj.checkBox59:setHeight(22);
    obj.checkBox59:setField("Sabedoria_15");
    obj.checkBox59:setName("checkBox59");

    obj.layout373 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout373:setParent(obj.rectangle1);
    obj.layout373:setLeft(300);
    obj.layout373:setTop(1712);
    obj.layout373:setWidth(20);
    obj.layout373:setHeight(21);
    obj.layout373:setName("layout373");

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout373);
    obj.checkBox60:setScale(1.5);
    obj.checkBox60:setLeft(0);
    obj.checkBox60:setTop(0);
    obj.checkBox60:setWidth(20);
    obj.checkBox60:setHeight(22);
    obj.checkBox60:setField("Sabedoria_16");
    obj.checkBox60:setName("checkBox60");

    obj.layout374 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout374:setParent(obj.rectangle1);
    obj.layout374:setLeft(338);
    obj.layout374:setTop(1712);
    obj.layout374:setWidth(20);
    obj.layout374:setHeight(21);
    obj.layout374:setName("layout374");

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout374);
    obj.checkBox61:setScale(1.5);
    obj.checkBox61:setLeft(0);
    obj.checkBox61:setTop(0);
    obj.checkBox61:setWidth(20);
    obj.checkBox61:setHeight(22);
    obj.checkBox61:setField("Sabedoria_17");
    obj.checkBox61:setName("checkBox61");

    obj.layout375 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout375:setParent(obj.rectangle1);
    obj.layout375:setLeft(373);
    obj.layout375:setTop(1712);
    obj.layout375:setWidth(20);
    obj.layout375:setHeight(21);
    obj.layout375:setName("layout375");

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout375);
    obj.checkBox62:setScale(1.5);
    obj.checkBox62:setLeft(0);
    obj.checkBox62:setTop(0);
    obj.checkBox62:setWidth(20);
    obj.checkBox62:setHeight(22);
    obj.checkBox62:setField("Sabedoria_18");
    obj.checkBox62:setName("checkBox62");

    obj.layout376 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout376:setParent(obj.rectangle1);
    obj.layout376:setLeft(410);
    obj.layout376:setTop(1712);
    obj.layout376:setWidth(20);
    obj.layout376:setHeight(21);
    obj.layout376:setName("layout376");

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout376);
    obj.checkBox63:setScale(1.5);
    obj.checkBox63:setLeft(0);
    obj.checkBox63:setTop(0);
    obj.checkBox63:setWidth(20);
    obj.checkBox63:setHeight(22);
    obj.checkBox63:setField("Sabedoria_19");
    obj.checkBox63:setName("checkBox63");

    obj.layout377 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout377:setParent(obj.rectangle1);
    obj.layout377:setLeft(445);
    obj.layout377:setTop(1712);
    obj.layout377:setWidth(20);
    obj.layout377:setHeight(21);
    obj.layout377:setName("layout377");

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout377);
    obj.checkBox64:setScale(1.5);
    obj.checkBox64:setLeft(0);
    obj.checkBox64:setTop(0);
    obj.checkBox64:setWidth(20);
    obj.checkBox64:setHeight(22);
    obj.checkBox64:setField("Sabedoria_20");
    obj.checkBox64:setName("checkBox64");

    obj.layout378 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout378:setParent(obj.rectangle1);
    obj.layout378:setLeft(511);
    obj.layout378:setTop(1753);
    obj.layout378:setWidth(22);
    obj.layout378:setHeight(25);
    obj.layout378:setName("layout378");

    obj.imageCheckBox276 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox276:setParent(obj.layout378);
    obj.imageCheckBox276:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox276:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox276:setLeft(0);
    obj.imageCheckBox276:setTop(0);
    obj.imageCheckBox276:setWidth(22);
    obj.imageCheckBox276:setHeight(26);
    obj.imageCheckBox276:setField("Gnose_01");
    obj.imageCheckBox276:setName("imageCheckBox276");

    obj.layout379 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout379:setParent(obj.rectangle1);
    obj.layout379:setLeft(546);
    obj.layout379:setTop(1753);
    obj.layout379:setWidth(22);
    obj.layout379:setHeight(25);
    obj.layout379:setName("layout379");

    obj.imageCheckBox277 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox277:setParent(obj.layout379);
    obj.imageCheckBox277:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox277:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox277:setLeft(0);
    obj.imageCheckBox277:setTop(0);
    obj.imageCheckBox277:setWidth(22);
    obj.imageCheckBox277:setHeight(26);
    obj.imageCheckBox277:setField("Gnose_02");
    obj.imageCheckBox277:setName("imageCheckBox277");

    obj.layout380 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout380:setParent(obj.rectangle1);
    obj.layout380:setLeft(582);
    obj.layout380:setTop(1753);
    obj.layout380:setWidth(22);
    obj.layout380:setHeight(25);
    obj.layout380:setName("layout380");

    obj.imageCheckBox278 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox278:setParent(obj.layout380);
    obj.imageCheckBox278:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox278:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox278:setLeft(0);
    obj.imageCheckBox278:setTop(0);
    obj.imageCheckBox278:setWidth(22);
    obj.imageCheckBox278:setHeight(26);
    obj.imageCheckBox278:setField("Gnose_03");
    obj.imageCheckBox278:setName("imageCheckBox278");

    obj.layout381 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout381:setParent(obj.rectangle1);
    obj.layout381:setLeft(618);
    obj.layout381:setTop(1753);
    obj.layout381:setWidth(22);
    obj.layout381:setHeight(25);
    obj.layout381:setName("layout381");

    obj.imageCheckBox279 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox279:setParent(obj.layout381);
    obj.imageCheckBox279:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox279:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox279:setLeft(0);
    obj.imageCheckBox279:setTop(0);
    obj.imageCheckBox279:setWidth(22);
    obj.imageCheckBox279:setHeight(26);
    obj.imageCheckBox279:setField("Gnose_04");
    obj.imageCheckBox279:setName("imageCheckBox279");

    obj.layout382 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout382:setParent(obj.rectangle1);
    obj.layout382:setLeft(655);
    obj.layout382:setTop(1753);
    obj.layout382:setWidth(22);
    obj.layout382:setHeight(25);
    obj.layout382:setName("layout382");

    obj.imageCheckBox280 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox280:setParent(obj.layout382);
    obj.imageCheckBox280:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox280:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox280:setLeft(0);
    obj.imageCheckBox280:setTop(0);
    obj.imageCheckBox280:setWidth(22);
    obj.imageCheckBox280:setHeight(26);
    obj.imageCheckBox280:setField("Gnose_05");
    obj.imageCheckBox280:setName("imageCheckBox280");

    obj.layout383 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout383:setParent(obj.rectangle1);
    obj.layout383:setLeft(691);
    obj.layout383:setTop(1753);
    obj.layout383:setWidth(22);
    obj.layout383:setHeight(25);
    obj.layout383:setName("layout383");

    obj.imageCheckBox281 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox281:setParent(obj.layout383);
    obj.imageCheckBox281:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox281:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox281:setLeft(0);
    obj.imageCheckBox281:setTop(0);
    obj.imageCheckBox281:setWidth(22);
    obj.imageCheckBox281:setHeight(26);
    obj.imageCheckBox281:setField("Gnose_06");
    obj.imageCheckBox281:setName("imageCheckBox281");

    obj.layout384 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout384:setParent(obj.rectangle1);
    obj.layout384:setLeft(729);
    obj.layout384:setTop(1753);
    obj.layout384:setWidth(22);
    obj.layout384:setHeight(25);
    obj.layout384:setName("layout384");

    obj.imageCheckBox282 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox282:setParent(obj.layout384);
    obj.imageCheckBox282:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox282:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox282:setLeft(0);
    obj.imageCheckBox282:setTop(0);
    obj.imageCheckBox282:setWidth(22);
    obj.imageCheckBox282:setHeight(26);
    obj.imageCheckBox282:setField("Gnose_07");
    obj.imageCheckBox282:setName("imageCheckBox282");

    obj.layout385 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout385:setParent(obj.rectangle1);
    obj.layout385:setLeft(765);
    obj.layout385:setTop(1753);
    obj.layout385:setWidth(22);
    obj.layout385:setHeight(25);
    obj.layout385:setName("layout385");

    obj.imageCheckBox283 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox283:setParent(obj.layout385);
    obj.imageCheckBox283:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox283:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox283:setLeft(0);
    obj.imageCheckBox283:setTop(0);
    obj.imageCheckBox283:setWidth(22);
    obj.imageCheckBox283:setHeight(26);
    obj.imageCheckBox283:setField("Gnose_08");
    obj.imageCheckBox283:setName("imageCheckBox283");

    obj.layout386 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout386:setParent(obj.rectangle1);
    obj.layout386:setLeft(803);
    obj.layout386:setTop(1753);
    obj.layout386:setWidth(22);
    obj.layout386:setHeight(25);
    obj.layout386:setName("layout386");

    obj.imageCheckBox284 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox284:setParent(obj.layout386);
    obj.imageCheckBox284:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox284:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox284:setLeft(0);
    obj.imageCheckBox284:setTop(0);
    obj.imageCheckBox284:setWidth(22);
    obj.imageCheckBox284:setHeight(26);
    obj.imageCheckBox284:setField("Gnose_09");
    obj.imageCheckBox284:setName("imageCheckBox284");

    obj.layout387 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout387:setParent(obj.rectangle1);
    obj.layout387:setLeft(838);
    obj.layout387:setTop(1753);
    obj.layout387:setWidth(22);
    obj.layout387:setHeight(25);
    obj.layout387:setName("layout387");

    obj.imageCheckBox285 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox285:setParent(obj.layout387);
    obj.imageCheckBox285:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox285:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox285:setLeft(0);
    obj.imageCheckBox285:setTop(0);
    obj.imageCheckBox285:setWidth(22);
    obj.imageCheckBox285:setHeight(26);
    obj.imageCheckBox285:setField("Gnose_10");
    obj.imageCheckBox285:setName("imageCheckBox285");

    obj.layout388 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout388:setParent(obj.rectangle1);
    obj.layout388:setLeft(509);
    obj.layout388:setTop(1786);
    obj.layout388:setWidth(20);
    obj.layout388:setHeight(21);
    obj.layout388:setName("layout388");

    obj.checkBox65 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout388);
    obj.checkBox65:setScale(1.5);
    obj.checkBox65:setLeft(0);
    obj.checkBox65:setTop(0);
    obj.checkBox65:setWidth(20);
    obj.checkBox65:setHeight(22);
    obj.checkBox65:setField("Gnose_11__1");
    obj.checkBox65:setName("checkBox65");

    obj.layout389 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout389:setParent(obj.rectangle1);
    obj.layout389:setLeft(546);
    obj.layout389:setTop(1786);
    obj.layout389:setWidth(20);
    obj.layout389:setHeight(21);
    obj.layout389:setName("layout389");

    obj.checkBox66 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout389);
    obj.checkBox66:setScale(1.5);
    obj.checkBox66:setLeft(0);
    obj.checkBox66:setTop(0);
    obj.checkBox66:setWidth(20);
    obj.checkBox66:setHeight(22);
    obj.checkBox66:setField("Gnose_12__1");
    obj.checkBox66:setName("checkBox66");

    obj.layout390 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout390:setParent(obj.rectangle1);
    obj.layout390:setLeft(584);
    obj.layout390:setTop(1786);
    obj.layout390:setWidth(20);
    obj.layout390:setHeight(21);
    obj.layout390:setName("layout390");

    obj.checkBox67 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout390);
    obj.checkBox67:setScale(1.5);
    obj.checkBox67:setLeft(0);
    obj.checkBox67:setTop(0);
    obj.checkBox67:setWidth(20);
    obj.checkBox67:setHeight(22);
    obj.checkBox67:setField("Gnose_13__1");
    obj.checkBox67:setName("checkBox67");

    obj.layout391 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout391:setParent(obj.rectangle1);
    obj.layout391:setLeft(621);
    obj.layout391:setTop(1786);
    obj.layout391:setWidth(20);
    obj.layout391:setHeight(21);
    obj.layout391:setName("layout391");

    obj.checkBox68 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout391);
    obj.checkBox68:setScale(1.5);
    obj.checkBox68:setLeft(0);
    obj.checkBox68:setTop(0);
    obj.checkBox68:setWidth(20);
    obj.checkBox68:setHeight(22);
    obj.checkBox68:setField("Gnose_14__1");
    obj.checkBox68:setName("checkBox68");

    obj.layout392 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout392:setParent(obj.rectangle1);
    obj.layout392:setLeft(658);
    obj.layout392:setTop(1786);
    obj.layout392:setWidth(20);
    obj.layout392:setHeight(21);
    obj.layout392:setName("layout392");

    obj.checkBox69 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout392);
    obj.checkBox69:setScale(1.5);
    obj.checkBox69:setLeft(0);
    obj.checkBox69:setTop(0);
    obj.checkBox69:setWidth(20);
    obj.checkBox69:setHeight(22);
    obj.checkBox69:setField("Gnose_15__1");
    obj.checkBox69:setName("checkBox69");

    obj.layout393 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout393:setParent(obj.rectangle1);
    obj.layout393:setLeft(697);
    obj.layout393:setTop(1786);
    obj.layout393:setWidth(20);
    obj.layout393:setHeight(21);
    obj.layout393:setName("layout393");

    obj.checkBox70 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout393);
    obj.checkBox70:setScale(1.5);
    obj.checkBox70:setLeft(0);
    obj.checkBox70:setTop(0);
    obj.checkBox70:setWidth(20);
    obj.checkBox70:setHeight(22);
    obj.checkBox70:setField("Gnose_16__1");
    obj.checkBox70:setName("checkBox70");

    obj.layout394 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout394:setParent(obj.rectangle1);
    obj.layout394:setLeft(732);
    obj.layout394:setTop(1786);
    obj.layout394:setWidth(20);
    obj.layout394:setHeight(21);
    obj.layout394:setName("layout394");

    obj.checkBox71 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout394);
    obj.checkBox71:setScale(1.5);
    obj.checkBox71:setLeft(0);
    obj.checkBox71:setTop(0);
    obj.checkBox71:setWidth(20);
    obj.checkBox71:setHeight(22);
    obj.checkBox71:setField("Gnose_17__1");
    obj.checkBox71:setName("checkBox71");

    obj.layout395 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout395:setParent(obj.rectangle1);
    obj.layout395:setLeft(769);
    obj.layout395:setTop(1786);
    obj.layout395:setWidth(20);
    obj.layout395:setHeight(21);
    obj.layout395:setName("layout395");

    obj.checkBox72 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout395);
    obj.checkBox72:setScale(1.5);
    obj.checkBox72:setLeft(0);
    obj.checkBox72:setTop(0);
    obj.checkBox72:setWidth(20);
    obj.checkBox72:setHeight(22);
    obj.checkBox72:setField("Gnose_18__1");
    obj.checkBox72:setName("checkBox72");

    obj.layout396 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout396:setParent(obj.rectangle1);
    obj.layout396:setLeft(806);
    obj.layout396:setTop(1786);
    obj.layout396:setWidth(20);
    obj.layout396:setHeight(21);
    obj.layout396:setName("layout396");

    obj.checkBox73 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout396);
    obj.checkBox73:setScale(1.5);
    obj.checkBox73:setLeft(0);
    obj.checkBox73:setTop(0);
    obj.checkBox73:setWidth(20);
    obj.checkBox73:setHeight(22);
    obj.checkBox73:setField("Gnose_19__1");
    obj.checkBox73:setName("checkBox73");

    obj.layout397 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout397:setParent(obj.rectangle1);
    obj.layout397:setLeft(841);
    obj.layout397:setTop(1786);
    obj.layout397:setWidth(20);
    obj.layout397:setHeight(21);
    obj.layout397:setName("layout397");

    obj.checkBox74 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout397);
    obj.checkBox74:setScale(1.5);
    obj.checkBox74:setLeft(0);
    obj.checkBox74:setTop(0);
    obj.checkBox74:setWidth(20);
    obj.checkBox74:setHeight(22);
    obj.checkBox74:setField("Gnose_20__1");
    obj.checkBox74:setName("checkBox74");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Dons e Rituais");
    obj.tab2:setName("tab2");

    obj.frma2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frma2_svg:setParent(obj.tab2);
    obj.frma2_svg:setName("frma2_svg");
    obj.frma2_svg:setAlign("client");
    obj.frma2_svg:setTheme("light");
    obj.frma2_svg:setMargins({top=1});

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frma2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox2);
    obj.rectangle2:setWidth(1369);
    obj.rectangle2:setHeight(1937);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(1369);
    obj.image2:setHeight(1937);
    obj.image2:setSRC("/Lobisomem/images/dom.png");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.layout398 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout398:setParent(obj.rectangle2);
    obj.layout398:setLeft(431);
    obj.layout398:setTop(1024);
    obj.layout398:setWidth(22);
    obj.layout398:setHeight(25);
    obj.layout398:setName("layout398");

    obj.imageCheckBox286 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox286:setParent(obj.layout398);
    obj.imageCheckBox286:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox286:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox286:setLeft(0);
    obj.imageCheckBox286:setTop(0);
    obj.imageCheckBox286:setWidth(22);
    obj.imageCheckBox286:setHeight(26);
    obj.imageCheckBox286:setField("Talentos_10_41");
    obj.imageCheckBox286:setName("imageCheckBox286");

    obj.layout399 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout399:setParent(obj.rectangle2);
    obj.layout399:setLeft(451);
    obj.layout399:setTop(1024);
    obj.layout399:setWidth(22);
    obj.layout399:setHeight(25);
    obj.layout399:setName("layout399");

    obj.imageCheckBox287 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox287:setParent(obj.layout399);
    obj.imageCheckBox287:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox287:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox287:setLeft(0);
    obj.imageCheckBox287:setTop(0);
    obj.imageCheckBox287:setWidth(22);
    obj.imageCheckBox287:setHeight(26);
    obj.imageCheckBox287:setField("Talentos_10_51");
    obj.imageCheckBox287:setName("imageCheckBox287");

    obj.layout400 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout400:setParent(obj.rectangle2);
    obj.layout400:setLeft(367);
    obj.layout400:setTop(1024);
    obj.layout400:setWidth(22);
    obj.layout400:setHeight(25);
    obj.layout400:setName("layout400");

    obj.imageCheckBox288 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox288:setParent(obj.layout400);
    obj.imageCheckBox288:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox288:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox288:setLeft(0);
    obj.imageCheckBox288:setTop(0);
    obj.imageCheckBox288:setWidth(22);
    obj.imageCheckBox288:setHeight(26);
    obj.imageCheckBox288:setField("Talentos_10_11");
    obj.imageCheckBox288:setName("imageCheckBox288");

    obj.layout401 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout401:setParent(obj.rectangle2);
    obj.layout401:setLeft(389);
    obj.layout401:setTop(1024);
    obj.layout401:setWidth(22);
    obj.layout401:setHeight(25);
    obj.layout401:setName("layout401");

    obj.imageCheckBox289 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox289:setParent(obj.layout401);
    obj.imageCheckBox289:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox289:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox289:setLeft(0);
    obj.imageCheckBox289:setTop(0);
    obj.imageCheckBox289:setWidth(22);
    obj.imageCheckBox289:setHeight(26);
    obj.imageCheckBox289:setField("Talentos_10_21");
    obj.imageCheckBox289:setName("imageCheckBox289");

    obj.layout402 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout402:setParent(obj.rectangle2);
    obj.layout402:setLeft(410);
    obj.layout402:setTop(1024);
    obj.layout402:setWidth(22);
    obj.layout402:setHeight(25);
    obj.layout402:setName("layout402");

    obj.imageCheckBox290 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox290:setParent(obj.layout402);
    obj.imageCheckBox290:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox290:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox290:setLeft(0);
    obj.imageCheckBox290:setTop(0);
    obj.imageCheckBox290:setWidth(22);
    obj.imageCheckBox290:setHeight(26);
    obj.imageCheckBox290:setField("Talentos_10_31");
    obj.imageCheckBox290:setName("imageCheckBox290");

    obj.layout403 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout403:setParent(obj.rectangle2);
    obj.layout403:setLeft(451);
    obj.layout403:setTop(730);
    obj.layout403:setWidth(22);
    obj.layout403:setHeight(25);
    obj.layout403:setName("layout403");

    obj.imageCheckBox291 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox291:setParent(obj.layout403);
    obj.imageCheckBox291:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox291:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox291:setLeft(0);
    obj.imageCheckBox291:setTop(0);
    obj.imageCheckBox291:setWidth(22);
    obj.imageCheckBox291:setHeight(26);
    obj.imageCheckBox291:setField("Talentos_1_52");
    obj.imageCheckBox291:setName("imageCheckBox291");

    obj.layout404 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout404:setParent(obj.rectangle2);
    obj.layout404:setLeft(367);
    obj.layout404:setTop(730);
    obj.layout404:setWidth(22);
    obj.layout404:setHeight(25);
    obj.layout404:setName("layout404");

    obj.imageCheckBox292 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox292:setParent(obj.layout404);
    obj.imageCheckBox292:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox292:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox292:setLeft(0);
    obj.imageCheckBox292:setTop(0);
    obj.imageCheckBox292:setWidth(22);
    obj.imageCheckBox292:setHeight(26);
    obj.imageCheckBox292:setField("Talentos_1_11");
    obj.imageCheckBox292:setName("imageCheckBox292");

    obj.layout405 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout405:setParent(obj.rectangle2);
    obj.layout405:setLeft(389);
    obj.layout405:setTop(730);
    obj.layout405:setWidth(22);
    obj.layout405:setHeight(25);
    obj.layout405:setName("layout405");

    obj.imageCheckBox293 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox293:setParent(obj.layout405);
    obj.imageCheckBox293:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox293:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox293:setLeft(0);
    obj.imageCheckBox293:setTop(0);
    obj.imageCheckBox293:setWidth(22);
    obj.imageCheckBox293:setHeight(26);
    obj.imageCheckBox293:setField("Talentos_1_211");
    obj.imageCheckBox293:setName("imageCheckBox293");

    obj.layout406 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout406:setParent(obj.rectangle2);
    obj.layout406:setLeft(410);
    obj.layout406:setTop(730);
    obj.layout406:setWidth(22);
    obj.layout406:setHeight(25);
    obj.layout406:setName("layout406");

    obj.imageCheckBox294 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox294:setParent(obj.layout406);
    obj.imageCheckBox294:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox294:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox294:setLeft(0);
    obj.imageCheckBox294:setTop(0);
    obj.imageCheckBox294:setWidth(22);
    obj.imageCheckBox294:setHeight(26);
    obj.imageCheckBox294:setField("Talentos_1_31");
    obj.imageCheckBox294:setName("imageCheckBox294");

    obj.layout407 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout407:setParent(obj.rectangle2);
    obj.layout407:setLeft(431);
    obj.layout407:setTop(730);
    obj.layout407:setWidth(22);
    obj.layout407:setHeight(25);
    obj.layout407:setName("layout407");

    obj.imageCheckBox295 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox295:setParent(obj.layout407);
    obj.imageCheckBox295:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox295:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox295:setLeft(0);
    obj.imageCheckBox295:setTop(0);
    obj.imageCheckBox295:setWidth(22);
    obj.imageCheckBox295:setHeight(26);
    obj.imageCheckBox295:setField("Talentos_1_41");
    obj.imageCheckBox295:setName("imageCheckBox295");

    obj.layout408 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout408:setParent(obj.rectangle2);
    obj.layout408:setLeft(1061);
    obj.layout408:setTop(1549);
    obj.layout408:setWidth(192);
    obj.layout408:setHeight(33);
    obj.layout408:setName("layout408");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout408);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(22.6);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(192);
    obj.edit38:setHeight(34);
    obj.edit38:setField("Nvel");
    obj.edit38:setName("edit38");

    obj.layout409 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout409:setParent(obj.rectangle2);
    obj.layout409:setLeft(111);
    obj.layout409:setTop(723);
    obj.layout409:setWidth(253);
    obj.layout409:setHeight(33);
    obj.layout409:setName("layout409");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout409);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(22.6);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(253);
    obj.edit39:setHeight(34);
    obj.edit39:setField("Row7_18");
    obj.edit39:setName("edit39");

    obj.layout410 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout410:setParent(obj.rectangle2);
    obj.layout410:setLeft(571);
    obj.layout410:setTop(724);
    obj.layout410:setWidth(406);
    obj.layout410:setHeight(33);
    obj.layout410:setName("layout410");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout410);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(22.6);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(406);
    obj.edit40:setHeight(34);
    obj.edit40:setField("Item_1");
    obj.edit40:setName("edit40");

    obj.layout411 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout411:setParent(obj.rectangle2);
    obj.layout411:setLeft(1069);
    obj.layout411:setTop(726);
    obj.layout411:setWidth(45);
    obj.layout411:setHeight(30);
    obj.layout411:setName("layout411");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout411);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(20.3);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("leading");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(45);
    obj.edit41:setHeight(31);
    obj.edit41:setField("Gnose1_1");
    obj.edit41:setName("edit41");

    obj.layout412 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout412:setParent(obj.rectangle2);
    obj.layout412:setLeft(451);
    obj.layout412:setTop(763);
    obj.layout412:setWidth(22);
    obj.layout412:setHeight(25);
    obj.layout412:setName("layout412");

    obj.imageCheckBox296 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox296:setParent(obj.layout412);
    obj.imageCheckBox296:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox296:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox296:setLeft(0);
    obj.imageCheckBox296:setTop(0);
    obj.imageCheckBox296:setWidth(22);
    obj.imageCheckBox296:setHeight(26);
    obj.imageCheckBox296:setField("Talentos_2_51");
    obj.imageCheckBox296:setName("imageCheckBox296");

    obj.layout413 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout413:setParent(obj.rectangle2);
    obj.layout413:setLeft(367);
    obj.layout413:setTop(763);
    obj.layout413:setWidth(22);
    obj.layout413:setHeight(25);
    obj.layout413:setName("layout413");

    obj.imageCheckBox297 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox297:setParent(obj.layout413);
    obj.imageCheckBox297:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox297:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox297:setLeft(0);
    obj.imageCheckBox297:setTop(0);
    obj.imageCheckBox297:setWidth(22);
    obj.imageCheckBox297:setHeight(26);
    obj.imageCheckBox297:setField("Talentos_2_11");
    obj.imageCheckBox297:setName("imageCheckBox297");

    obj.layout414 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout414:setParent(obj.rectangle2);
    obj.layout414:setLeft(389);
    obj.layout414:setTop(763);
    obj.layout414:setWidth(22);
    obj.layout414:setHeight(25);
    obj.layout414:setName("layout414");

    obj.imageCheckBox298 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox298:setParent(obj.layout414);
    obj.imageCheckBox298:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox298:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox298:setLeft(0);
    obj.imageCheckBox298:setTop(0);
    obj.imageCheckBox298:setWidth(22);
    obj.imageCheckBox298:setHeight(26);
    obj.imageCheckBox298:setField("Talentos_2_21");
    obj.imageCheckBox298:setName("imageCheckBox298");

    obj.layout415 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout415:setParent(obj.rectangle2);
    obj.layout415:setLeft(410);
    obj.layout415:setTop(763);
    obj.layout415:setWidth(22);
    obj.layout415:setHeight(25);
    obj.layout415:setName("layout415");

    obj.imageCheckBox299 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox299:setParent(obj.layout415);
    obj.imageCheckBox299:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox299:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox299:setLeft(0);
    obj.imageCheckBox299:setTop(0);
    obj.imageCheckBox299:setWidth(22);
    obj.imageCheckBox299:setHeight(26);
    obj.imageCheckBox299:setField("Talentos_2_31");
    obj.imageCheckBox299:setName("imageCheckBox299");

    obj.layout416 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout416:setParent(obj.rectangle2);
    obj.layout416:setLeft(431);
    obj.layout416:setTop(763);
    obj.layout416:setWidth(22);
    obj.layout416:setHeight(25);
    obj.layout416:setName("layout416");

    obj.imageCheckBox300 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox300:setParent(obj.layout416);
    obj.imageCheckBox300:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox300:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox300:setLeft(0);
    obj.imageCheckBox300:setTop(0);
    obj.imageCheckBox300:setWidth(22);
    obj.imageCheckBox300:setHeight(26);
    obj.imageCheckBox300:setField("Talentos_2_41");
    obj.imageCheckBox300:setName("imageCheckBox300");

    obj.layout417 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout417:setParent(obj.rectangle2);
    obj.layout417:setLeft(1210);
    obj.layout417:setTop(725);
    obj.layout417:setWidth(45);
    obj.layout417:setHeight(30);
    obj.layout417:setName("layout417");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout417);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(20.3);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(45);
    obj.edit42:setHeight(31);
    obj.edit42:setField("Gnose");
    obj.edit42:setName("edit42");

    obj.layout418 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout418:setParent(obj.rectangle2);
    obj.layout418:setLeft(111);
    obj.layout418:setTop(754);
    obj.layout418:setWidth(253);
    obj.layout418:setHeight(33);
    obj.layout418:setName("layout418");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout418);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(22.6);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(253);
    obj.edit43:setHeight(34);
    obj.edit43:setField("Row1_19");
    obj.edit43:setName("edit43");

    obj.layout419 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout419:setParent(obj.rectangle2);
    obj.layout419:setLeft(592);
    obj.layout419:setTop(757);
    obj.layout419:setWidth(524);
    obj.layout419:setHeight(33);
    obj.layout419:setName("layout419");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout419);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(22.6);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(524);
    obj.edit44:setHeight(34);
    obj.edit44:setField("Poder_1");
    obj.edit44:setName("edit44");

    obj.layout420 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout420:setParent(obj.rectangle2);
    obj.layout420:setLeft(111);
    obj.layout420:setTop(786);
    obj.layout420:setWidth(253);
    obj.layout420:setHeight(33);
    obj.layout420:setName("layout420");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout420);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(22.6);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(253);
    obj.edit45:setHeight(34);
    obj.edit45:setField("Row7_20");
    obj.edit45:setName("edit45");

    obj.layout421 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout421:setParent(obj.rectangle2);
    obj.layout421:setLeft(451);
    obj.layout421:setTop(796);
    obj.layout421:setWidth(22);
    obj.layout421:setHeight(25);
    obj.layout421:setName("layout421");

    obj.imageCheckBox301 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox301:setParent(obj.layout421);
    obj.imageCheckBox301:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox301:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox301:setLeft(0);
    obj.imageCheckBox301:setTop(0);
    obj.imageCheckBox301:setWidth(22);
    obj.imageCheckBox301:setHeight(26);
    obj.imageCheckBox301:setField("Talentos_3_51");
    obj.imageCheckBox301:setName("imageCheckBox301");

    obj.layout422 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout422:setParent(obj.rectangle2);
    obj.layout422:setLeft(367);
    obj.layout422:setTop(796);
    obj.layout422:setWidth(22);
    obj.layout422:setHeight(25);
    obj.layout422:setName("layout422");

    obj.imageCheckBox302 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox302:setParent(obj.layout422);
    obj.imageCheckBox302:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox302:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox302:setLeft(0);
    obj.imageCheckBox302:setTop(0);
    obj.imageCheckBox302:setWidth(22);
    obj.imageCheckBox302:setHeight(26);
    obj.imageCheckBox302:setField("Talentos_3_11");
    obj.imageCheckBox302:setName("imageCheckBox302");

    obj.layout423 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout423:setParent(obj.rectangle2);
    obj.layout423:setLeft(389);
    obj.layout423:setTop(796);
    obj.layout423:setWidth(22);
    obj.layout423:setHeight(25);
    obj.layout423:setName("layout423");

    obj.imageCheckBox303 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox303:setParent(obj.layout423);
    obj.imageCheckBox303:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox303:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox303:setLeft(0);
    obj.imageCheckBox303:setTop(0);
    obj.imageCheckBox303:setWidth(22);
    obj.imageCheckBox303:setHeight(26);
    obj.imageCheckBox303:setField("Talentos_3_21");
    obj.imageCheckBox303:setName("imageCheckBox303");

    obj.layout424 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout424:setParent(obj.rectangle2);
    obj.layout424:setLeft(410);
    obj.layout424:setTop(796);
    obj.layout424:setWidth(22);
    obj.layout424:setHeight(25);
    obj.layout424:setName("layout424");

    obj.imageCheckBox304 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox304:setParent(obj.layout424);
    obj.imageCheckBox304:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox304:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox304:setLeft(0);
    obj.imageCheckBox304:setTop(0);
    obj.imageCheckBox304:setWidth(22);
    obj.imageCheckBox304:setHeight(26);
    obj.imageCheckBox304:setField("Talentos_3_31");
    obj.imageCheckBox304:setName("imageCheckBox304");

    obj.layout425 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout425:setParent(obj.rectangle2);
    obj.layout425:setLeft(431);
    obj.layout425:setTop(796);
    obj.layout425:setWidth(22);
    obj.layout425:setHeight(25);
    obj.layout425:setName("layout425");

    obj.imageCheckBox305 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox305:setParent(obj.layout425);
    obj.imageCheckBox305:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox305:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox305:setLeft(0);
    obj.imageCheckBox305:setTop(0);
    obj.imageCheckBox305:setWidth(22);
    obj.imageCheckBox305:setHeight(26);
    obj.imageCheckBox305:setField("Talentos_3_41");
    obj.imageCheckBox305:setName("imageCheckBox305");

    obj.layout426 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout426:setParent(obj.rectangle2);
    obj.layout426:setLeft(571);
    obj.layout426:setTop(788);
    obj.layout426:setWidth(406);
    obj.layout426:setHeight(33);
    obj.layout426:setName("layout426");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout426);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(22.6);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(406);
    obj.edit46:setHeight(34);
    obj.edit46:setField("Item_2");
    obj.edit46:setName("edit46");

    obj.layout427 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout427:setParent(obj.rectangle2);
    obj.layout427:setLeft(1069);
    obj.layout427:setTop(788);
    obj.layout427:setWidth(45);
    obj.layout427:setHeight(33);
    obj.layout427:setName("layout427");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout427);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(22.6);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("leading");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(45);
    obj.edit47:setHeight(34);
    obj.edit47:setField("Gnose1_2");
    obj.edit47:setName("edit47");

    obj.layout428 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout428:setParent(obj.rectangle2);
    obj.layout428:setLeft(451);
    obj.layout428:setTop(829);
    obj.layout428:setWidth(22);
    obj.layout428:setHeight(25);
    obj.layout428:setName("layout428");

    obj.imageCheckBox306 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox306:setParent(obj.layout428);
    obj.imageCheckBox306:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox306:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox306:setLeft(0);
    obj.imageCheckBox306:setTop(0);
    obj.imageCheckBox306:setWidth(22);
    obj.imageCheckBox306:setHeight(26);
    obj.imageCheckBox306:setField("Talentos_4_51");
    obj.imageCheckBox306:setName("imageCheckBox306");

    obj.layout429 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout429:setParent(obj.rectangle2);
    obj.layout429:setLeft(367);
    obj.layout429:setTop(829);
    obj.layout429:setWidth(22);
    obj.layout429:setHeight(25);
    obj.layout429:setName("layout429");

    obj.imageCheckBox307 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox307:setParent(obj.layout429);
    obj.imageCheckBox307:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox307:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox307:setLeft(0);
    obj.imageCheckBox307:setTop(0);
    obj.imageCheckBox307:setWidth(22);
    obj.imageCheckBox307:setHeight(26);
    obj.imageCheckBox307:setField("Talentos_4_11");
    obj.imageCheckBox307:setName("imageCheckBox307");

    obj.layout430 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout430:setParent(obj.rectangle2);
    obj.layout430:setLeft(389);
    obj.layout430:setTop(829);
    obj.layout430:setWidth(22);
    obj.layout430:setHeight(25);
    obj.layout430:setName("layout430");

    obj.imageCheckBox308 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox308:setParent(obj.layout430);
    obj.imageCheckBox308:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox308:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox308:setLeft(0);
    obj.imageCheckBox308:setTop(0);
    obj.imageCheckBox308:setWidth(22);
    obj.imageCheckBox308:setHeight(26);
    obj.imageCheckBox308:setField("Talentos_4_21");
    obj.imageCheckBox308:setName("imageCheckBox308");

    obj.layout431 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout431:setParent(obj.rectangle2);
    obj.layout431:setLeft(410);
    obj.layout431:setTop(829);
    obj.layout431:setWidth(22);
    obj.layout431:setHeight(25);
    obj.layout431:setName("layout431");

    obj.imageCheckBox309 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox309:setParent(obj.layout431);
    obj.imageCheckBox309:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox309:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox309:setLeft(0);
    obj.imageCheckBox309:setTop(0);
    obj.imageCheckBox309:setWidth(22);
    obj.imageCheckBox309:setHeight(26);
    obj.imageCheckBox309:setField("Talentos_4_31");
    obj.imageCheckBox309:setName("imageCheckBox309");

    obj.layout432 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout432:setParent(obj.rectangle2);
    obj.layout432:setLeft(431);
    obj.layout432:setTop(829);
    obj.layout432:setWidth(22);
    obj.layout432:setHeight(25);
    obj.layout432:setName("layout432");

    obj.imageCheckBox310 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox310:setParent(obj.layout432);
    obj.imageCheckBox310:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox310:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox310:setLeft(0);
    obj.imageCheckBox310:setTop(0);
    obj.imageCheckBox310:setWidth(22);
    obj.imageCheckBox310:setHeight(26);
    obj.imageCheckBox310:setField("Talentos_4_41");
    obj.imageCheckBox310:setName("imageCheckBox310");

    obj.layout433 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout433:setParent(obj.rectangle2);
    obj.layout433:setLeft(1210);
    obj.layout433:setTop(787);
    obj.layout433:setWidth(45);
    obj.layout433:setHeight(33);
    obj.layout433:setName("layout433");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout433);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(22.6);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("leading");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(45);
    obj.edit48:setHeight(34);
    obj.edit48:setField("Gnose_2");
    obj.edit48:setName("edit48");

    obj.layout434 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout434:setParent(obj.rectangle2);
    obj.layout434:setLeft(111);
    obj.layout434:setTop(820);
    obj.layout434:setWidth(253);
    obj.layout434:setHeight(33);
    obj.layout434:setName("layout434");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout434);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(22.6);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(253);
    obj.edit49:setHeight(34);
    obj.edit49:setField("Row1_21");
    obj.edit49:setName("edit49");

    obj.layout435 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout435:setParent(obj.rectangle2);
    obj.layout435:setLeft(592);
    obj.layout435:setTop(822);
    obj.layout435:setWidth(524);
    obj.layout435:setHeight(33);
    obj.layout435:setName("layout435");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout435);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(22.6);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(524);
    obj.edit50:setHeight(34);
    obj.edit50:setField("Poder_2");
    obj.edit50:setName("edit50");

    obj.layout436 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout436:setParent(obj.rectangle2);
    obj.layout436:setLeft(1120);
    obj.layout436:setTop(826);
    obj.layout436:setWidth(23);
    obj.layout436:setHeight(26);
    obj.layout436:setName("layout436");

    obj.imageCheckBox311 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox311:setParent(obj.layout436);
    obj.imageCheckBox311:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox311:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox311:setLeft(0);
    obj.imageCheckBox311:setTop(0);
    obj.imageCheckBox311:setWidth(23);
    obj.imageCheckBox311:setHeight(27);
    obj.imageCheckBox311:setField("Vitalidade_92");
    obj.imageCheckBox311:setName("imageCheckBox311");

    obj.layout437 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout437:setParent(obj.rectangle2);
    obj.layout437:setLeft(111);
    obj.layout437:setTop(853);
    obj.layout437:setWidth(253);
    obj.layout437:setHeight(33);
    obj.layout437:setName("layout437");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout437);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(22.6);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(253);
    obj.edit51:setHeight(34);
    obj.edit51:setField("Row2_22");
    obj.edit51:setName("edit51");

    obj.layout438 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout438:setParent(obj.rectangle2);
    obj.layout438:setLeft(451);
    obj.layout438:setTop(859);
    obj.layout438:setWidth(22);
    obj.layout438:setHeight(25);
    obj.layout438:setName("layout438");

    obj.imageCheckBox312 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox312:setParent(obj.layout438);
    obj.imageCheckBox312:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox312:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox312:setLeft(0);
    obj.imageCheckBox312:setTop(0);
    obj.imageCheckBox312:setWidth(22);
    obj.imageCheckBox312:setHeight(26);
    obj.imageCheckBox312:setField("Talentos_5_51");
    obj.imageCheckBox312:setName("imageCheckBox312");

    obj.layout439 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout439:setParent(obj.rectangle2);
    obj.layout439:setLeft(367);
    obj.layout439:setTop(859);
    obj.layout439:setWidth(22);
    obj.layout439:setHeight(25);
    obj.layout439:setName("layout439");

    obj.imageCheckBox313 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox313:setParent(obj.layout439);
    obj.imageCheckBox313:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox313:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox313:setLeft(0);
    obj.imageCheckBox313:setTop(0);
    obj.imageCheckBox313:setWidth(22);
    obj.imageCheckBox313:setHeight(26);
    obj.imageCheckBox313:setField("Talentos_5_11");
    obj.imageCheckBox313:setName("imageCheckBox313");

    obj.layout440 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout440:setParent(obj.rectangle2);
    obj.layout440:setLeft(389);
    obj.layout440:setTop(859);
    obj.layout440:setWidth(22);
    obj.layout440:setHeight(25);
    obj.layout440:setName("layout440");

    obj.imageCheckBox314 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox314:setParent(obj.layout440);
    obj.imageCheckBox314:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox314:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox314:setLeft(0);
    obj.imageCheckBox314:setTop(0);
    obj.imageCheckBox314:setWidth(22);
    obj.imageCheckBox314:setHeight(26);
    obj.imageCheckBox314:setField("Talentos_5_21");
    obj.imageCheckBox314:setName("imageCheckBox314");

    obj.layout441 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout441:setParent(obj.rectangle2);
    obj.layout441:setLeft(410);
    obj.layout441:setTop(859);
    obj.layout441:setWidth(22);
    obj.layout441:setHeight(25);
    obj.layout441:setName("layout441");

    obj.imageCheckBox315 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox315:setParent(obj.layout441);
    obj.imageCheckBox315:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox315:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox315:setLeft(0);
    obj.imageCheckBox315:setTop(0);
    obj.imageCheckBox315:setWidth(22);
    obj.imageCheckBox315:setHeight(26);
    obj.imageCheckBox315:setField("Talentos_5_31");
    obj.imageCheckBox315:setName("imageCheckBox315");

    obj.layout442 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout442:setParent(obj.rectangle2);
    obj.layout442:setLeft(431);
    obj.layout442:setTop(859);
    obj.layout442:setWidth(22);
    obj.layout442:setHeight(25);
    obj.layout442:setName("layout442");

    obj.imageCheckBox316 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox316:setParent(obj.layout442);
    obj.imageCheckBox316:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox316:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox316:setLeft(0);
    obj.imageCheckBox316:setTop(0);
    obj.imageCheckBox316:setWidth(22);
    obj.imageCheckBox316:setHeight(26);
    obj.imageCheckBox316:setField("Talentos_5_41");
    obj.imageCheckBox316:setName("imageCheckBox316");

    obj.layout443 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout443:setParent(obj.rectangle2);
    obj.layout443:setLeft(571);
    obj.layout443:setTop(856);
    obj.layout443:setWidth(406);
    obj.layout443:setHeight(33);
    obj.layout443:setName("layout443");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout443);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(22.6);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(406);
    obj.edit52:setHeight(34);
    obj.edit52:setField("Item_3");
    obj.edit52:setName("edit52");

    obj.layout444 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout444:setParent(obj.rectangle2);
    obj.layout444:setLeft(1069);
    obj.layout444:setTop(854);
    obj.layout444:setWidth(45);
    obj.layout444:setHeight(33);
    obj.layout444:setName("layout444");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout444);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(22.6);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(45);
    obj.edit53:setHeight(34);
    obj.edit53:setField("Gnose1_3");
    obj.edit53:setName("edit53");

    obj.layout445 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout445:setParent(obj.rectangle2);
    obj.layout445:setLeft(451);
    obj.layout445:setTop(893);
    obj.layout445:setWidth(22);
    obj.layout445:setHeight(25);
    obj.layout445:setName("layout445");

    obj.imageCheckBox317 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox317:setParent(obj.layout445);
    obj.imageCheckBox317:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox317:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox317:setLeft(0);
    obj.imageCheckBox317:setTop(0);
    obj.imageCheckBox317:setWidth(22);
    obj.imageCheckBox317:setHeight(26);
    obj.imageCheckBox317:setField("Talentos_6_51");
    obj.imageCheckBox317:setName("imageCheckBox317");

    obj.layout446 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout446:setParent(obj.rectangle2);
    obj.layout446:setLeft(367);
    obj.layout446:setTop(893);
    obj.layout446:setWidth(22);
    obj.layout446:setHeight(25);
    obj.layout446:setName("layout446");

    obj.imageCheckBox318 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox318:setParent(obj.layout446);
    obj.imageCheckBox318:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox318:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox318:setLeft(0);
    obj.imageCheckBox318:setTop(0);
    obj.imageCheckBox318:setWidth(22);
    obj.imageCheckBox318:setHeight(26);
    obj.imageCheckBox318:setField("Talentos_6_11");
    obj.imageCheckBox318:setName("imageCheckBox318");

    obj.layout447 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout447:setParent(obj.rectangle2);
    obj.layout447:setLeft(389);
    obj.layout447:setTop(893);
    obj.layout447:setWidth(22);
    obj.layout447:setHeight(25);
    obj.layout447:setName("layout447");

    obj.imageCheckBox319 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox319:setParent(obj.layout447);
    obj.imageCheckBox319:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox319:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox319:setLeft(0);
    obj.imageCheckBox319:setTop(0);
    obj.imageCheckBox319:setWidth(22);
    obj.imageCheckBox319:setHeight(26);
    obj.imageCheckBox319:setField("Talentos_6_21");
    obj.imageCheckBox319:setName("imageCheckBox319");

    obj.layout448 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout448:setParent(obj.rectangle2);
    obj.layout448:setLeft(410);
    obj.layout448:setTop(893);
    obj.layout448:setWidth(22);
    obj.layout448:setHeight(25);
    obj.layout448:setName("layout448");

    obj.imageCheckBox320 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox320:setParent(obj.layout448);
    obj.imageCheckBox320:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox320:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox320:setLeft(0);
    obj.imageCheckBox320:setTop(0);
    obj.imageCheckBox320:setWidth(22);
    obj.imageCheckBox320:setHeight(26);
    obj.imageCheckBox320:setField("Talentos_6_31");
    obj.imageCheckBox320:setName("imageCheckBox320");

    obj.layout449 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout449:setParent(obj.rectangle2);
    obj.layout449:setLeft(431);
    obj.layout449:setTop(893);
    obj.layout449:setWidth(22);
    obj.layout449:setHeight(25);
    obj.layout449:setName("layout449");

    obj.imageCheckBox321 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox321:setParent(obj.layout449);
    obj.imageCheckBox321:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox321:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox321:setLeft(0);
    obj.imageCheckBox321:setTop(0);
    obj.imageCheckBox321:setWidth(22);
    obj.imageCheckBox321:setHeight(26);
    obj.imageCheckBox321:setField("Talentos_6_41");
    obj.imageCheckBox321:setName("imageCheckBox321");

    obj.layout450 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout450:setParent(obj.rectangle2);
    obj.layout450:setLeft(1210);
    obj.layout450:setTop(852);
    obj.layout450:setWidth(45);
    obj.layout450:setHeight(33);
    obj.layout450:setName("layout450");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout450);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(22.6);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("leading");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(45);
    obj.edit54:setHeight(34);
    obj.edit54:setField("Gnose_3");
    obj.edit54:setName("edit54");

    obj.layout451 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout451:setParent(obj.rectangle2);
    obj.layout451:setLeft(111);
    obj.layout451:setTop(884);
    obj.layout451:setWidth(253);
    obj.layout451:setHeight(33);
    obj.layout451:setName("layout451");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout451);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(22.6);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(253);
    obj.edit55:setHeight(34);
    obj.edit55:setField("Row3_23");
    obj.edit55:setName("edit55");

    obj.layout452 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout452:setParent(obj.rectangle2);
    obj.layout452:setLeft(592);
    obj.layout452:setTop(887);
    obj.layout452:setWidth(524);
    obj.layout452:setHeight(33);
    obj.layout452:setName("layout452");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout452);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(22.6);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(524);
    obj.edit56:setHeight(34);
    obj.edit56:setField("Poder_3");
    obj.edit56:setName("edit56");

    obj.layout453 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout453:setParent(obj.rectangle2);
    obj.layout453:setLeft(111);
    obj.layout453:setTop(917);
    obj.layout453:setWidth(253);
    obj.layout453:setHeight(33);
    obj.layout453:setName("layout453");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout453);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(22.6);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(253);
    obj.edit57:setHeight(34);
    obj.edit57:setField("Row4_24");
    obj.edit57:setName("edit57");

    obj.layout454 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout454:setParent(obj.rectangle2);
    obj.layout454:setLeft(451);
    obj.layout454:setTop(925);
    obj.layout454:setWidth(22);
    obj.layout454:setHeight(25);
    obj.layout454:setName("layout454");

    obj.imageCheckBox322 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox322:setParent(obj.layout454);
    obj.imageCheckBox322:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox322:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox322:setLeft(0);
    obj.imageCheckBox322:setTop(0);
    obj.imageCheckBox322:setWidth(22);
    obj.imageCheckBox322:setHeight(26);
    obj.imageCheckBox322:setField("Talentos_7_51");
    obj.imageCheckBox322:setName("imageCheckBox322");

    obj.layout455 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout455:setParent(obj.rectangle2);
    obj.layout455:setLeft(367);
    obj.layout455:setTop(925);
    obj.layout455:setWidth(22);
    obj.layout455:setHeight(25);
    obj.layout455:setName("layout455");

    obj.imageCheckBox323 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox323:setParent(obj.layout455);
    obj.imageCheckBox323:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox323:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox323:setLeft(0);
    obj.imageCheckBox323:setTop(0);
    obj.imageCheckBox323:setWidth(22);
    obj.imageCheckBox323:setHeight(26);
    obj.imageCheckBox323:setField("Talentos_7_11");
    obj.imageCheckBox323:setName("imageCheckBox323");

    obj.layout456 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout456:setParent(obj.rectangle2);
    obj.layout456:setLeft(389);
    obj.layout456:setTop(925);
    obj.layout456:setWidth(22);
    obj.layout456:setHeight(25);
    obj.layout456:setName("layout456");

    obj.imageCheckBox324 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox324:setParent(obj.layout456);
    obj.imageCheckBox324:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox324:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox324:setLeft(0);
    obj.imageCheckBox324:setTop(0);
    obj.imageCheckBox324:setWidth(22);
    obj.imageCheckBox324:setHeight(26);
    obj.imageCheckBox324:setField("Talentos_7_21");
    obj.imageCheckBox324:setName("imageCheckBox324");

    obj.layout457 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout457:setParent(obj.rectangle2);
    obj.layout457:setLeft(410);
    obj.layout457:setTop(925);
    obj.layout457:setWidth(22);
    obj.layout457:setHeight(25);
    obj.layout457:setName("layout457");

    obj.imageCheckBox325 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox325:setParent(obj.layout457);
    obj.imageCheckBox325:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox325:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox325:setLeft(0);
    obj.imageCheckBox325:setTop(0);
    obj.imageCheckBox325:setWidth(22);
    obj.imageCheckBox325:setHeight(26);
    obj.imageCheckBox325:setField("Talentos_7_31");
    obj.imageCheckBox325:setName("imageCheckBox325");

    obj.layout458 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout458:setParent(obj.rectangle2);
    obj.layout458:setLeft(431);
    obj.layout458:setTop(925);
    obj.layout458:setWidth(22);
    obj.layout458:setHeight(25);
    obj.layout458:setName("layout458");

    obj.imageCheckBox326 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox326:setParent(obj.layout458);
    obj.imageCheckBox326:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox326:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox326:setLeft(0);
    obj.imageCheckBox326:setTop(0);
    obj.imageCheckBox326:setWidth(22);
    obj.imageCheckBox326:setHeight(26);
    obj.imageCheckBox326:setField("Talentos_7_41");
    obj.imageCheckBox326:setName("imageCheckBox326");

    obj.layout459 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout459:setParent(obj.rectangle2);
    obj.layout459:setLeft(571);
    obj.layout459:setTop(920);
    obj.layout459:setWidth(406);
    obj.layout459:setHeight(33);
    obj.layout459:setName("layout459");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout459);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(22.6);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(406);
    obj.edit58:setHeight(34);
    obj.edit58:setField("Item_4");
    obj.edit58:setName("edit58");

    obj.layout460 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout460:setParent(obj.rectangle2);
    obj.layout460:setLeft(1069);
    obj.layout460:setTop(919);
    obj.layout460:setWidth(45);
    obj.layout460:setHeight(33);
    obj.layout460:setName("layout460");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout460);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(22.6);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setHorzTextAlign("leading");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(45);
    obj.edit59:setHeight(34);
    obj.edit59:setField("Gnose1_4");
    obj.edit59:setName("edit59");

    obj.layout461 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout461:setParent(obj.rectangle2);
    obj.layout461:setLeft(451);
    obj.layout461:setTop(958);
    obj.layout461:setWidth(22);
    obj.layout461:setHeight(25);
    obj.layout461:setName("layout461");

    obj.imageCheckBox327 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox327:setParent(obj.layout461);
    obj.imageCheckBox327:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox327:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox327:setLeft(0);
    obj.imageCheckBox327:setTop(0);
    obj.imageCheckBox327:setWidth(22);
    obj.imageCheckBox327:setHeight(26);
    obj.imageCheckBox327:setField("Talentos_8_51");
    obj.imageCheckBox327:setName("imageCheckBox327");

    obj.layout462 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout462:setParent(obj.rectangle2);
    obj.layout462:setLeft(367);
    obj.layout462:setTop(958);
    obj.layout462:setWidth(22);
    obj.layout462:setHeight(25);
    obj.layout462:setName("layout462");

    obj.imageCheckBox328 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox328:setParent(obj.layout462);
    obj.imageCheckBox328:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox328:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox328:setLeft(0);
    obj.imageCheckBox328:setTop(0);
    obj.imageCheckBox328:setWidth(22);
    obj.imageCheckBox328:setHeight(26);
    obj.imageCheckBox328:setField("Talentos_8_11");
    obj.imageCheckBox328:setName("imageCheckBox328");

    obj.layout463 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout463:setParent(obj.rectangle2);
    obj.layout463:setLeft(389);
    obj.layout463:setTop(958);
    obj.layout463:setWidth(22);
    obj.layout463:setHeight(25);
    obj.layout463:setName("layout463");

    obj.imageCheckBox329 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox329:setParent(obj.layout463);
    obj.imageCheckBox329:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox329:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox329:setLeft(0);
    obj.imageCheckBox329:setTop(0);
    obj.imageCheckBox329:setWidth(22);
    obj.imageCheckBox329:setHeight(26);
    obj.imageCheckBox329:setField("Talentos_8_21");
    obj.imageCheckBox329:setName("imageCheckBox329");

    obj.layout464 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout464:setParent(obj.rectangle2);
    obj.layout464:setLeft(410);
    obj.layout464:setTop(958);
    obj.layout464:setWidth(22);
    obj.layout464:setHeight(25);
    obj.layout464:setName("layout464");

    obj.imageCheckBox330 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox330:setParent(obj.layout464);
    obj.imageCheckBox330:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox330:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox330:setLeft(0);
    obj.imageCheckBox330:setTop(0);
    obj.imageCheckBox330:setWidth(22);
    obj.imageCheckBox330:setHeight(26);
    obj.imageCheckBox330:setField("Talentos_8_31");
    obj.imageCheckBox330:setName("imageCheckBox330");

    obj.layout465 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout465:setParent(obj.rectangle2);
    obj.layout465:setLeft(431);
    obj.layout465:setTop(958);
    obj.layout465:setWidth(22);
    obj.layout465:setHeight(25);
    obj.layout465:setName("layout465");

    obj.imageCheckBox331 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox331:setParent(obj.layout465);
    obj.imageCheckBox331:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox331:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox331:setLeft(0);
    obj.imageCheckBox331:setTop(0);
    obj.imageCheckBox331:setWidth(22);
    obj.imageCheckBox331:setHeight(26);
    obj.imageCheckBox331:setField("Talentos_8_41");
    obj.imageCheckBox331:setName("imageCheckBox331");

    obj.layout466 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout466:setParent(obj.rectangle2);
    obj.layout466:setLeft(1069);
    obj.layout466:setTop(984);
    obj.layout466:setWidth(45);
    obj.layout466:setHeight(33);
    obj.layout466:setName("layout466");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout466);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(22.6);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setHorzTextAlign("leading");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(45);
    obj.edit60:setHeight(34);
    obj.edit60:setField("Gnose1_5");
    obj.edit60:setName("edit60");

    obj.layout467 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout467:setParent(obj.rectangle2);
    obj.layout467:setLeft(1210);
    obj.layout467:setTop(918);
    obj.layout467:setWidth(45);
    obj.layout467:setHeight(33);
    obj.layout467:setName("layout467");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout467);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(22.6);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setHorzTextAlign("leading");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(45);
    obj.edit61:setHeight(34);
    obj.edit61:setField("Gnose_4");
    obj.edit61:setName("edit61");

    obj.layout468 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout468:setParent(obj.rectangle2);
    obj.layout468:setLeft(111);
    obj.layout468:setTop(950);
    obj.layout468:setWidth(253);
    obj.layout468:setHeight(33);
    obj.layout468:setName("layout468");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout468);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(22.6);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(253);
    obj.edit62:setHeight(34);
    obj.edit62:setField("Row5_25");
    obj.edit62:setName("edit62");

    obj.layout469 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout469:setParent(obj.rectangle2);
    obj.layout469:setLeft(592);
    obj.layout469:setTop(952);
    obj.layout469:setWidth(524);
    obj.layout469:setHeight(33);
    obj.layout469:setName("layout469");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout469);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(22.6);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(524);
    obj.edit63:setHeight(34);
    obj.edit63:setField("Poder_4");
    obj.edit63:setName("edit63");

    obj.layout470 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout470:setParent(obj.rectangle2);
    obj.layout470:setLeft(111);
    obj.layout470:setTop(983);
    obj.layout470:setWidth(253);
    obj.layout470:setHeight(33);
    obj.layout470:setName("layout470");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout470);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(22.6);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(253);
    obj.edit64:setHeight(34);
    obj.edit64:setField("Row6_26");
    obj.edit64:setName("edit64");

    obj.layout471 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout471:setParent(obj.rectangle2);
    obj.layout471:setLeft(451);
    obj.layout471:setTop(991);
    obj.layout471:setWidth(22);
    obj.layout471:setHeight(25);
    obj.layout471:setName("layout471");

    obj.imageCheckBox332 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox332:setParent(obj.layout471);
    obj.imageCheckBox332:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox332:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox332:setLeft(0);
    obj.imageCheckBox332:setTop(0);
    obj.imageCheckBox332:setWidth(22);
    obj.imageCheckBox332:setHeight(26);
    obj.imageCheckBox332:setField("Talentos_9_51");
    obj.imageCheckBox332:setName("imageCheckBox332");

    obj.layout472 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout472:setParent(obj.rectangle2);
    obj.layout472:setLeft(367);
    obj.layout472:setTop(991);
    obj.layout472:setWidth(22);
    obj.layout472:setHeight(25);
    obj.layout472:setName("layout472");

    obj.imageCheckBox333 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox333:setParent(obj.layout472);
    obj.imageCheckBox333:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox333:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox333:setLeft(0);
    obj.imageCheckBox333:setTop(0);
    obj.imageCheckBox333:setWidth(22);
    obj.imageCheckBox333:setHeight(26);
    obj.imageCheckBox333:setField("Talentos_9_11");
    obj.imageCheckBox333:setName("imageCheckBox333");

    obj.layout473 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout473:setParent(obj.rectangle2);
    obj.layout473:setLeft(389);
    obj.layout473:setTop(991);
    obj.layout473:setWidth(22);
    obj.layout473:setHeight(25);
    obj.layout473:setName("layout473");

    obj.imageCheckBox334 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox334:setParent(obj.layout473);
    obj.imageCheckBox334:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox334:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox334:setLeft(0);
    obj.imageCheckBox334:setTop(0);
    obj.imageCheckBox334:setWidth(22);
    obj.imageCheckBox334:setHeight(26);
    obj.imageCheckBox334:setField("Talentos_9_21");
    obj.imageCheckBox334:setName("imageCheckBox334");

    obj.layout474 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout474:setParent(obj.rectangle2);
    obj.layout474:setLeft(410);
    obj.layout474:setTop(991);
    obj.layout474:setWidth(22);
    obj.layout474:setHeight(25);
    obj.layout474:setName("layout474");

    obj.imageCheckBox335 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox335:setParent(obj.layout474);
    obj.imageCheckBox335:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox335:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox335:setLeft(0);
    obj.imageCheckBox335:setTop(0);
    obj.imageCheckBox335:setWidth(22);
    obj.imageCheckBox335:setHeight(26);
    obj.imageCheckBox335:setField("Talentos_9_31");
    obj.imageCheckBox335:setName("imageCheckBox335");

    obj.layout475 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout475:setParent(obj.rectangle2);
    obj.layout475:setLeft(431);
    obj.layout475:setTop(991);
    obj.layout475:setWidth(22);
    obj.layout475:setHeight(25);
    obj.layout475:setName("layout475");

    obj.imageCheckBox336 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox336:setParent(obj.layout475);
    obj.imageCheckBox336:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox336:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox336:setLeft(0);
    obj.imageCheckBox336:setTop(0);
    obj.imageCheckBox336:setWidth(22);
    obj.imageCheckBox336:setHeight(26);
    obj.imageCheckBox336:setField("Talentos_9_41");
    obj.imageCheckBox336:setName("imageCheckBox336");

    obj.layout476 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout476:setParent(obj.rectangle2);
    obj.layout476:setLeft(571);
    obj.layout476:setTop(987);
    obj.layout476:setWidth(406);
    obj.layout476:setHeight(33);
    obj.layout476:setName("layout476");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout476);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(22.6);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(406);
    obj.edit65:setHeight(34);
    obj.edit65:setField("Item_5");
    obj.edit65:setName("edit65");

    obj.layout477 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout477:setParent(obj.rectangle2);
    obj.layout477:setLeft(1210);
    obj.layout477:setTop(983);
    obj.layout477:setWidth(45);
    obj.layout477:setHeight(33);
    obj.layout477:setName("layout477");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout477);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(22.6);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setHorzTextAlign("leading");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(45);
    obj.edit66:setHeight(34);
    obj.edit66:setField("Gnose_5");
    obj.edit66:setName("edit66");

    obj.layout478 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout478:setParent(obj.rectangle2);
    obj.layout478:setLeft(111);
    obj.layout478:setTop(1016);
    obj.layout478:setWidth(253);
    obj.layout478:setHeight(33);
    obj.layout478:setName("layout478");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout478);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(22.6);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(253);
    obj.edit67:setHeight(34);
    obj.edit67:setField("Row4_27");
    obj.edit67:setName("edit67");

    obj.layout479 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout479:setParent(obj.rectangle2);
    obj.layout479:setLeft(592);
    obj.layout479:setTop(1017);
    obj.layout479:setWidth(524);
    obj.layout479:setHeight(33);
    obj.layout479:setName("layout479");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout479);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(22.6);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(524);
    obj.edit68:setHeight(34);
    obj.edit68:setField("Poder_5");
    obj.edit68:setName("edit68");

    obj.layout480 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout480:setParent(obj.rectangle2);
    obj.layout480:setLeft(111);
    obj.layout480:setTop(1049);
    obj.layout480:setWidth(253);
    obj.layout480:setHeight(33);
    obj.layout480:setName("layout480");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout480);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(22.6);
    obj.edit69:setFontColor("#000000");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(253);
    obj.edit69:setHeight(34);
    obj.edit69:setField("Row5_28");
    obj.edit69:setName("edit69");

    obj.layout481 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout481:setParent(obj.rectangle2);
    obj.layout481:setLeft(451);
    obj.layout481:setTop(1056);
    obj.layout481:setWidth(22);
    obj.layout481:setHeight(25);
    obj.layout481:setName("layout481");

    obj.imageCheckBox337 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox337:setParent(obj.layout481);
    obj.imageCheckBox337:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox337:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox337:setLeft(0);
    obj.imageCheckBox337:setTop(0);
    obj.imageCheckBox337:setWidth(22);
    obj.imageCheckBox337:setHeight(26);
    obj.imageCheckBox337:setField("Talentos_9_52");
    obj.imageCheckBox337:setName("imageCheckBox337");

    obj.layout482 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout482:setParent(obj.rectangle2);
    obj.layout482:setLeft(367);
    obj.layout482:setTop(1056);
    obj.layout482:setWidth(22);
    obj.layout482:setHeight(25);
    obj.layout482:setName("layout482");

    obj.imageCheckBox338 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox338:setParent(obj.layout482);
    obj.imageCheckBox338:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox338:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox338:setLeft(0);
    obj.imageCheckBox338:setTop(0);
    obj.imageCheckBox338:setWidth(22);
    obj.imageCheckBox338:setHeight(26);
    obj.imageCheckBox338:setField("Talentos_9_12");
    obj.imageCheckBox338:setName("imageCheckBox338");

    obj.layout483 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout483:setParent(obj.rectangle2);
    obj.layout483:setLeft(389);
    obj.layout483:setTop(1056);
    obj.layout483:setWidth(22);
    obj.layout483:setHeight(25);
    obj.layout483:setName("layout483");

    obj.imageCheckBox339 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox339:setParent(obj.layout483);
    obj.imageCheckBox339:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox339:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox339:setLeft(0);
    obj.imageCheckBox339:setTop(0);
    obj.imageCheckBox339:setWidth(22);
    obj.imageCheckBox339:setHeight(26);
    obj.imageCheckBox339:setField("Talentos_9_22");
    obj.imageCheckBox339:setName("imageCheckBox339");

    obj.layout484 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout484:setParent(obj.rectangle2);
    obj.layout484:setLeft(410);
    obj.layout484:setTop(1056);
    obj.layout484:setWidth(22);
    obj.layout484:setHeight(25);
    obj.layout484:setName("layout484");

    obj.imageCheckBox340 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox340:setParent(obj.layout484);
    obj.imageCheckBox340:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox340:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox340:setLeft(0);
    obj.imageCheckBox340:setTop(0);
    obj.imageCheckBox340:setWidth(22);
    obj.imageCheckBox340:setHeight(26);
    obj.imageCheckBox340:setField("Talentos_9_32");
    obj.imageCheckBox340:setName("imageCheckBox340");

    obj.layout485 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout485:setParent(obj.rectangle2);
    obj.layout485:setLeft(431);
    obj.layout485:setTop(1056);
    obj.layout485:setWidth(22);
    obj.layout485:setHeight(25);
    obj.layout485:setName("layout485");

    obj.imageCheckBox341 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox341:setParent(obj.layout485);
    obj.imageCheckBox341:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox341:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox341:setLeft(0);
    obj.imageCheckBox341:setTop(0);
    obj.imageCheckBox341:setWidth(22);
    obj.imageCheckBox341:setHeight(26);
    obj.imageCheckBox341:setField("Talentos_9_42");
    obj.imageCheckBox341:setName("imageCheckBox341");

    obj.layout486 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout486:setParent(obj.rectangle2);
    obj.layout486:setLeft(571);
    obj.layout486:setTop(1051);
    obj.layout486:setWidth(406);
    obj.layout486:setHeight(33);
    obj.layout486:setName("layout486");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout486);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(22.6);
    obj.edit70:setFontColor("#000000");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(406);
    obj.edit70:setHeight(34);
    obj.edit70:setField("Item_6");
    obj.edit70:setName("edit70");

    obj.layout487 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout487:setParent(obj.rectangle2);
    obj.layout487:setLeft(1069);
    obj.layout487:setTop(1050);
    obj.layout487:setWidth(45);
    obj.layout487:setHeight(33);
    obj.layout487:setName("layout487");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout487);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(22.6);
    obj.edit71:setFontColor("#000000");
    obj.edit71:setHorzTextAlign("leading");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(45);
    obj.edit71:setHeight(34);
    obj.edit71:setField("Gnose1_6");
    obj.edit71:setName("edit71");

    obj.layout488 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout488:setParent(obj.rectangle2);
    obj.layout488:setLeft(431);
    obj.layout488:setTop(1089);
    obj.layout488:setWidth(22);
    obj.layout488:setHeight(25);
    obj.layout488:setName("layout488");

    obj.imageCheckBox342 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox342:setParent(obj.layout488);
    obj.imageCheckBox342:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox342:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox342:setLeft(0);
    obj.imageCheckBox342:setTop(0);
    obj.imageCheckBox342:setWidth(22);
    obj.imageCheckBox342:setHeight(26);
    obj.imageCheckBox342:setField("Talentos_10_42");
    obj.imageCheckBox342:setName("imageCheckBox342");

    obj.layout489 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout489:setParent(obj.rectangle2);
    obj.layout489:setLeft(367);
    obj.layout489:setTop(1089);
    obj.layout489:setWidth(22);
    obj.layout489:setHeight(25);
    obj.layout489:setName("layout489");

    obj.imageCheckBox343 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox343:setParent(obj.layout489);
    obj.imageCheckBox343:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox343:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox343:setLeft(0);
    obj.imageCheckBox343:setTop(0);
    obj.imageCheckBox343:setWidth(22);
    obj.imageCheckBox343:setHeight(26);
    obj.imageCheckBox343:setField("Talentos_10_12");
    obj.imageCheckBox343:setName("imageCheckBox343");

    obj.layout490 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout490:setParent(obj.rectangle2);
    obj.layout490:setLeft(389);
    obj.layout490:setTop(1089);
    obj.layout490:setWidth(22);
    obj.layout490:setHeight(25);
    obj.layout490:setName("layout490");

    obj.imageCheckBox344 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox344:setParent(obj.layout490);
    obj.imageCheckBox344:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox344:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox344:setLeft(0);
    obj.imageCheckBox344:setTop(0);
    obj.imageCheckBox344:setWidth(22);
    obj.imageCheckBox344:setHeight(26);
    obj.imageCheckBox344:setField("Talentos_10_22");
    obj.imageCheckBox344:setName("imageCheckBox344");

    obj.layout491 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout491:setParent(obj.rectangle2);
    obj.layout491:setLeft(410);
    obj.layout491:setTop(1089);
    obj.layout491:setWidth(22);
    obj.layout491:setHeight(25);
    obj.layout491:setName("layout491");

    obj.imageCheckBox345 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox345:setParent(obj.layout491);
    obj.imageCheckBox345:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox345:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox345:setLeft(0);
    obj.imageCheckBox345:setTop(0);
    obj.imageCheckBox345:setWidth(22);
    obj.imageCheckBox345:setHeight(26);
    obj.imageCheckBox345:setField("Talentos_10_32");
    obj.imageCheckBox345:setName("imageCheckBox345");

    obj.layout492 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout492:setParent(obj.rectangle2);
    obj.layout492:setLeft(451);
    obj.layout492:setTop(1089);
    obj.layout492:setWidth(22);
    obj.layout492:setHeight(25);
    obj.layout492:setName("layout492");

    obj.imageCheckBox346 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox346:setParent(obj.layout492);
    obj.imageCheckBox346:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox346:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox346:setLeft(0);
    obj.imageCheckBox346:setTop(0);
    obj.imageCheckBox346:setWidth(22);
    obj.imageCheckBox346:setHeight(26);
    obj.imageCheckBox346:setField("Talentos_10_52");
    obj.imageCheckBox346:setName("imageCheckBox346");

    obj.layout493 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout493:setParent(obj.rectangle2);
    obj.layout493:setLeft(1210);
    obj.layout493:setTop(1049);
    obj.layout493:setWidth(45);
    obj.layout493:setHeight(33);
    obj.layout493:setName("layout493");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout493);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(22.6);
    obj.edit72:setFontColor("#000000");
    obj.edit72:setHorzTextAlign("leading");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(45);
    obj.edit72:setHeight(34);
    obj.edit72:setField("Gnose_6");
    obj.edit72:setName("edit72");

    obj.layout494 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout494:setParent(obj.rectangle2);
    obj.layout494:setLeft(111);
    obj.layout494:setTop(1083);
    obj.layout494:setWidth(253);
    obj.layout494:setHeight(33);
    obj.layout494:setName("layout494");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout494);
    obj.edit73:setTransparent(true);
    obj.edit73:setFontSize(22.6);
    obj.edit73:setFontColor("#000000");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(253);
    obj.edit73:setHeight(34);
    obj.edit73:setField("Row6_29");
    obj.edit73:setName("edit73");

    obj.layout495 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout495:setParent(obj.rectangle2);
    obj.layout495:setLeft(592);
    obj.layout495:setTop(1082);
    obj.layout495:setWidth(524);
    obj.layout495:setHeight(33);
    obj.layout495:setName("layout495");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout495);
    obj.edit74:setTransparent(true);
    obj.edit74:setFontSize(22.6);
    obj.edit74:setFontColor("#000000");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(524);
    obj.edit74:setHeight(34);
    obj.edit74:setField("Poder_6");
    obj.edit74:setName("edit74");

    obj.layout496 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout496:setParent(obj.rectangle2);
    obj.layout496:setLeft(107);
    obj.layout496:setTop(1156);
    obj.layout496:setWidth(355);
    obj.layout496:setHeight(293);
    obj.layout496:setName("layout496");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout496);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(23);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(355);
    obj.textEditor2:setHeight(294);
    obj.textEditor2:setField("Row7_1");
    obj.textEditor2:setName("textEditor2");

    obj.layout497 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout497:setParent(obj.rectangle2);
    obj.layout497:setLeft(505);
    obj.layout497:setTop(1159);
    obj.layout497:setWidth(756);
    obj.layout497:setHeight(289);
    obj.layout497:setName("layout497");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout497);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontSize(23);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(756);
    obj.textEditor3:setHeight(290);
    obj.textEditor3:setField("Row7_9");
    obj.textEditor3:setName("textEditor3");

    obj.layout498 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout498:setParent(obj.rectangle2);
    obj.layout498:setLeft(108);
    obj.layout498:setTop(1547);
    obj.layout498:setWidth(279);
    obj.layout498:setHeight(33);
    obj.layout498:setName("layout498");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout498);
    obj.edit75:setTransparent(true);
    obj.edit75:setFontSize(22.6);
    obj.edit75:setFontColor("#000000");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(0);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(279);
    obj.edit75:setHeight(34);
    obj.edit75:setField("arma1_1");
    obj.edit75:setName("edit75");

    obj.layout499 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout499:setParent(obj.rectangle2);
    obj.layout499:setLeft(392);
    obj.layout499:setTop(1547);
    obj.layout499:setWidth(204);
    obj.layout499:setHeight(33);
    obj.layout499:setName("layout499");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout499);
    obj.edit76:setTransparent(true);
    obj.edit76:setFontSize(22.6);
    obj.edit76:setFontColor("#000000");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(204);
    obj.edit76:setHeight(34);
    obj.edit76:setField("arma1_2");
    obj.edit76:setName("edit76");

    obj.layout500 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout500:setParent(obj.rectangle2);
    obj.layout500:setLeft(600);
    obj.layout500:setTop(1547);
    obj.layout500:setWidth(97);
    obj.layout500:setHeight(33);
    obj.layout500:setName("layout500");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout500);
    obj.edit77:setTransparent(true);
    obj.edit77:setFontSize(22.6);
    obj.edit77:setFontColor("#000000");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(97);
    obj.edit77:setHeight(34);
    obj.edit77:setField("arma1_3");
    obj.edit77:setName("edit77");

    obj.layout501 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout501:setParent(obj.rectangle2);
    obj.layout501:setLeft(702);
    obj.layout501:setTop(1547);
    obj.layout501:setWidth(81);
    obj.layout501:setHeight(33);
    obj.layout501:setName("layout501");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout501);
    obj.edit78:setTransparent(true);
    obj.edit78:setFontSize(22.6);
    obj.edit78:setFontColor("#000000");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(81);
    obj.edit78:setHeight(34);
    obj.edit78:setField("arma1_4");
    obj.edit78:setName("edit78");

    obj.layout502 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout502:setParent(obj.rectangle2);
    obj.layout502:setLeft(787);
    obj.layout502:setTop(1547);
    obj.layout502:setWidth(86);
    obj.layout502:setHeight(33);
    obj.layout502:setName("layout502");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout502);
    obj.edit79:setTransparent(true);
    obj.edit79:setFontSize(22.6);
    obj.edit79:setFontColor("#000000");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(86);
    obj.edit79:setHeight(34);
    obj.edit79:setField("arma1_5");
    obj.edit79:setName("edit79");

    obj.layout503 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout503:setParent(obj.rectangle2);
    obj.layout503:setLeft(877);
    obj.layout503:setTop(1547);
    obj.layout503:setWidth(73);
    obj.layout503:setHeight(33);
    obj.layout503:setName("layout503");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout503);
    obj.edit80:setTransparent(true);
    obj.edit80:setFontSize(22.6);
    obj.edit80:setFontColor("#000000");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(73);
    obj.edit80:setHeight(34);
    obj.edit80:setField("arma1_6");
    obj.edit80:setName("edit80");

    obj.layout504 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout504:setParent(obj.rectangle2);
    obj.layout504:setLeft(108);
    obj.layout504:setTop(1585);
    obj.layout504:setWidth(279);
    obj.layout504:setHeight(33);
    obj.layout504:setName("layout504");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout504);
    obj.edit81:setTransparent(true);
    obj.edit81:setFontSize(22.6);
    obj.edit81:setFontColor("#000000");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(0);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(279);
    obj.edit81:setHeight(34);
    obj.edit81:setField("arma2_1");
    obj.edit81:setName("edit81");

    obj.layout505 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout505:setParent(obj.rectangle2);
    obj.layout505:setLeft(392);
    obj.layout505:setTop(1585);
    obj.layout505:setWidth(204);
    obj.layout505:setHeight(33);
    obj.layout505:setName("layout505");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout505);
    obj.edit82:setTransparent(true);
    obj.edit82:setFontSize(22.6);
    obj.edit82:setFontColor("#000000");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(204);
    obj.edit82:setHeight(34);
    obj.edit82:setField("arma2_2");
    obj.edit82:setName("edit82");

    obj.layout506 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout506:setParent(obj.rectangle2);
    obj.layout506:setLeft(600);
    obj.layout506:setTop(1585);
    obj.layout506:setWidth(97);
    obj.layout506:setHeight(33);
    obj.layout506:setName("layout506");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout506);
    obj.edit83:setTransparent(true);
    obj.edit83:setFontSize(22.6);
    obj.edit83:setFontColor("#000000");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(0);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(97);
    obj.edit83:setHeight(34);
    obj.edit83:setField("arma2_3");
    obj.edit83:setName("edit83");

    obj.layout507 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout507:setParent(obj.rectangle2);
    obj.layout507:setLeft(702);
    obj.layout507:setTop(1585);
    obj.layout507:setWidth(81);
    obj.layout507:setHeight(33);
    obj.layout507:setName("layout507");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout507);
    obj.edit84:setTransparent(true);
    obj.edit84:setFontSize(22.6);
    obj.edit84:setFontColor("#000000");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(0);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(81);
    obj.edit84:setHeight(34);
    obj.edit84:setField("arma2_4");
    obj.edit84:setName("edit84");

    obj.layout508 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout508:setParent(obj.rectangle2);
    obj.layout508:setLeft(787);
    obj.layout508:setTop(1585);
    obj.layout508:setWidth(86);
    obj.layout508:setHeight(33);
    obj.layout508:setName("layout508");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout508);
    obj.edit85:setTransparent(true);
    obj.edit85:setFontSize(22.6);
    obj.edit85:setFontColor("#000000");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(0);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(86);
    obj.edit85:setHeight(34);
    obj.edit85:setField("arma2_5");
    obj.edit85:setName("edit85");

    obj.layout509 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout509:setParent(obj.rectangle2);
    obj.layout509:setLeft(877);
    obj.layout509:setTop(1585);
    obj.layout509:setWidth(73);
    obj.layout509:setHeight(33);
    obj.layout509:setName("layout509");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout509);
    obj.edit86:setTransparent(true);
    obj.edit86:setFontSize(22.6);
    obj.edit86:setFontColor("#000000");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(0);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(73);
    obj.edit86:setHeight(34);
    obj.edit86:setField("arma2_6");
    obj.edit86:setName("edit86");

    obj.layout510 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout510:setParent(obj.rectangle2);
    obj.layout510:setLeft(1129);
    obj.layout510:setTop(1592);
    obj.layout510:setWidth(123);
    obj.layout510:setHeight(33);
    obj.layout510:setName("layout510");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout510);
    obj.edit87:setTransparent(true);
    obj.edit87:setFontSize(22.6);
    obj.edit87:setFontColor("#000000");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(0);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(123);
    obj.edit87:setHeight(34);
    obj.edit87:setField("Penalidade");
    obj.edit87:setName("edit87");

    obj.layout511 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout511:setParent(obj.rectangle2);
    obj.layout511:setLeft(108);
    obj.layout511:setTop(1622);
    obj.layout511:setWidth(279);
    obj.layout511:setHeight(33);
    obj.layout511:setName("layout511");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout511);
    obj.edit88:setTransparent(true);
    obj.edit88:setFontSize(22.6);
    obj.edit88:setFontColor("#000000");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(0);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(279);
    obj.edit88:setHeight(34);
    obj.edit88:setField("arma3_1");
    obj.edit88:setName("edit88");

    obj.layout512 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout512:setParent(obj.rectangle2);
    obj.layout512:setLeft(392);
    obj.layout512:setTop(1622);
    obj.layout512:setWidth(204);
    obj.layout512:setHeight(33);
    obj.layout512:setName("layout512");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout512);
    obj.edit89:setTransparent(true);
    obj.edit89:setFontSize(22.6);
    obj.edit89:setFontColor("#000000");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(0);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(204);
    obj.edit89:setHeight(34);
    obj.edit89:setField("arma3_2");
    obj.edit89:setName("edit89");

    obj.layout513 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout513:setParent(obj.rectangle2);
    obj.layout513:setLeft(600);
    obj.layout513:setTop(1622);
    obj.layout513:setWidth(97);
    obj.layout513:setHeight(33);
    obj.layout513:setName("layout513");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout513);
    obj.edit90:setTransparent(true);
    obj.edit90:setFontSize(22.6);
    obj.edit90:setFontColor("#000000");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(0);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(97);
    obj.edit90:setHeight(34);
    obj.edit90:setField("arma3_3");
    obj.edit90:setName("edit90");

    obj.layout514 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout514:setParent(obj.rectangle2);
    obj.layout514:setLeft(702);
    obj.layout514:setTop(1622);
    obj.layout514:setWidth(81);
    obj.layout514:setHeight(33);
    obj.layout514:setName("layout514");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout514);
    obj.edit91:setTransparent(true);
    obj.edit91:setFontSize(22.6);
    obj.edit91:setFontColor("#000000");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(81);
    obj.edit91:setHeight(34);
    obj.edit91:setField("arma3_4");
    obj.edit91:setName("edit91");

    obj.layout515 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout515:setParent(obj.rectangle2);
    obj.layout515:setLeft(787);
    obj.layout515:setTop(1622);
    obj.layout515:setWidth(86);
    obj.layout515:setHeight(33);
    obj.layout515:setName("layout515");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout515);
    obj.edit92:setTransparent(true);
    obj.edit92:setFontSize(22.6);
    obj.edit92:setFontColor("#000000");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(0);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(86);
    obj.edit92:setHeight(34);
    obj.edit92:setField("arma3_5");
    obj.edit92:setName("edit92");

    obj.layout516 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout516:setParent(obj.rectangle2);
    obj.layout516:setLeft(877);
    obj.layout516:setTop(1622);
    obj.layout516:setWidth(73);
    obj.layout516:setHeight(33);
    obj.layout516:setName("layout516");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout516);
    obj.edit93:setTransparent(true);
    obj.edit93:setFontSize(22.6);
    obj.edit93:setFontColor("#000000");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(0);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(73);
    obj.edit93:setHeight(34);
    obj.edit93:setField("arma3_6");
    obj.edit93:setName("edit93");

    obj.layout517 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout517:setParent(obj.rectangle2);
    obj.layout517:setLeft(108);
    obj.layout517:setTop(1660);
    obj.layout517:setWidth(279);
    obj.layout517:setHeight(33);
    obj.layout517:setName("layout517");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout517);
    obj.edit94:setTransparent(true);
    obj.edit94:setFontSize(22.6);
    obj.edit94:setFontColor("#000000");
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(0);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(279);
    obj.edit94:setHeight(34);
    obj.edit94:setField("arma4_1");
    obj.edit94:setName("edit94");

    obj.layout518 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout518:setParent(obj.rectangle2);
    obj.layout518:setLeft(392);
    obj.layout518:setTop(1660);
    obj.layout518:setWidth(204);
    obj.layout518:setHeight(33);
    obj.layout518:setName("layout518");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout518);
    obj.edit95:setTransparent(true);
    obj.edit95:setFontSize(22.6);
    obj.edit95:setFontColor("#000000");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(0);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(204);
    obj.edit95:setHeight(34);
    obj.edit95:setField("arma4_2");
    obj.edit95:setName("edit95");

    obj.layout519 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout519:setParent(obj.rectangle2);
    obj.layout519:setLeft(600);
    obj.layout519:setTop(1660);
    obj.layout519:setWidth(97);
    obj.layout519:setHeight(33);
    obj.layout519:setName("layout519");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout519);
    obj.edit96:setTransparent(true);
    obj.edit96:setFontSize(22.6);
    obj.edit96:setFontColor("#000000");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(0);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(97);
    obj.edit96:setHeight(34);
    obj.edit96:setField("arma4_3");
    obj.edit96:setName("edit96");

    obj.layout520 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout520:setParent(obj.rectangle2);
    obj.layout520:setLeft(702);
    obj.layout520:setTop(1660);
    obj.layout520:setWidth(81);
    obj.layout520:setHeight(33);
    obj.layout520:setName("layout520");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout520);
    obj.edit97:setTransparent(true);
    obj.edit97:setFontSize(22.6);
    obj.edit97:setFontColor("#000000");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setLeft(0);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(81);
    obj.edit97:setHeight(34);
    obj.edit97:setField("arma4_4");
    obj.edit97:setName("edit97");

    obj.layout521 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout521:setParent(obj.rectangle2);
    obj.layout521:setLeft(787);
    obj.layout521:setTop(1660);
    obj.layout521:setWidth(86);
    obj.layout521:setHeight(33);
    obj.layout521:setName("layout521");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout521);
    obj.edit98:setTransparent(true);
    obj.edit98:setFontSize(22.6);
    obj.edit98:setFontColor("#000000");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setLeft(0);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(86);
    obj.edit98:setHeight(34);
    obj.edit98:setField("arma4_5");
    obj.edit98:setName("edit98");

    obj.layout522 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout522:setParent(obj.rectangle2);
    obj.layout522:setLeft(877);
    obj.layout522:setTop(1660);
    obj.layout522:setWidth(73);
    obj.layout522:setHeight(33);
    obj.layout522:setName("layout522");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout522);
    obj.edit99:setTransparent(true);
    obj.edit99:setFontSize(22.6);
    obj.edit99:setFontColor("#000000");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setLeft(0);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(73);
    obj.edit99:setHeight(34);
    obj.edit99:setField("arma4_6");
    obj.edit99:setName("edit99");

    obj.layout523 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout523:setParent(obj.rectangle2);
    obj.layout523:setLeft(108);
    obj.layout523:setTop(1698);
    obj.layout523:setWidth(279);
    obj.layout523:setHeight(33);
    obj.layout523:setName("layout523");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout523);
    obj.edit100:setTransparent(true);
    obj.edit100:setFontSize(22.6);
    obj.edit100:setFontColor("#000000");
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setLeft(0);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(279);
    obj.edit100:setHeight(34);
    obj.edit100:setField("arma5_1");
    obj.edit100:setName("edit100");

    obj.layout524 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout524:setParent(obj.rectangle2);
    obj.layout524:setLeft(392);
    obj.layout524:setTop(1698);
    obj.layout524:setWidth(204);
    obj.layout524:setHeight(33);
    obj.layout524:setName("layout524");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout524);
    obj.edit101:setTransparent(true);
    obj.edit101:setFontSize(22.6);
    obj.edit101:setFontColor("#000000");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setLeft(0);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(204);
    obj.edit101:setHeight(34);
    obj.edit101:setField("arma5_2");
    obj.edit101:setName("edit101");

    obj.layout525 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout525:setParent(obj.rectangle2);
    obj.layout525:setLeft(600);
    obj.layout525:setTop(1698);
    obj.layout525:setWidth(97);
    obj.layout525:setHeight(33);
    obj.layout525:setName("layout525");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout525);
    obj.edit102:setTransparent(true);
    obj.edit102:setFontSize(22.6);
    obj.edit102:setFontColor("#000000");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setLeft(0);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(97);
    obj.edit102:setHeight(34);
    obj.edit102:setField("arma5_3");
    obj.edit102:setName("edit102");

    obj.layout526 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout526:setParent(obj.rectangle2);
    obj.layout526:setLeft(702);
    obj.layout526:setTop(1698);
    obj.layout526:setWidth(81);
    obj.layout526:setHeight(33);
    obj.layout526:setName("layout526");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout526);
    obj.edit103:setTransparent(true);
    obj.edit103:setFontSize(22.6);
    obj.edit103:setFontColor("#000000");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setLeft(0);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(81);
    obj.edit103:setHeight(34);
    obj.edit103:setField("arma5_4");
    obj.edit103:setName("edit103");

    obj.layout527 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout527:setParent(obj.rectangle2);
    obj.layout527:setLeft(787);
    obj.layout527:setTop(1698);
    obj.layout527:setWidth(86);
    obj.layout527:setHeight(33);
    obj.layout527:setName("layout527");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout527);
    obj.edit104:setTransparent(true);
    obj.edit104:setFontSize(22.6);
    obj.edit104:setFontColor("#000000");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setLeft(0);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(86);
    obj.edit104:setHeight(34);
    obj.edit104:setField("arma5_5");
    obj.edit104:setName("edit104");

    obj.layout528 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout528:setParent(obj.rectangle2);
    obj.layout528:setLeft(877);
    obj.layout528:setTop(1698);
    obj.layout528:setWidth(73);
    obj.layout528:setHeight(33);
    obj.layout528:setName("layout528");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout528);
    obj.edit105:setTransparent(true);
    obj.edit105:setFontSize(22.6);
    obj.edit105:setFontColor("#000000");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setLeft(0);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(73);
    obj.edit105:setHeight(34);
    obj.edit105:setField("arma5_6");
    obj.edit105:setName("edit105");

    obj.layout529 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout529:setParent(obj.rectangle2);
    obj.layout529:setLeft(108);
    obj.layout529:setTop(1736);
    obj.layout529:setWidth(279);
    obj.layout529:setHeight(33);
    obj.layout529:setName("layout529");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout529);
    obj.edit106:setTransparent(true);
    obj.edit106:setFontSize(22.6);
    obj.edit106:setFontColor("#000000");
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(0);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(279);
    obj.edit106:setHeight(34);
    obj.edit106:setField("arma6_1");
    obj.edit106:setName("edit106");

    obj.layout530 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout530:setParent(obj.rectangle2);
    obj.layout530:setLeft(392);
    obj.layout530:setTop(1736);
    obj.layout530:setWidth(204);
    obj.layout530:setHeight(33);
    obj.layout530:setName("layout530");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout530);
    obj.edit107:setTransparent(true);
    obj.edit107:setFontSize(22.6);
    obj.edit107:setFontColor("#000000");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(0);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(204);
    obj.edit107:setHeight(34);
    obj.edit107:setField("arma6_2");
    obj.edit107:setName("edit107");

    obj.layout531 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout531:setParent(obj.rectangle2);
    obj.layout531:setLeft(600);
    obj.layout531:setTop(1736);
    obj.layout531:setWidth(97);
    obj.layout531:setHeight(33);
    obj.layout531:setName("layout531");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout531);
    obj.edit108:setTransparent(true);
    obj.edit108:setFontSize(22.6);
    obj.edit108:setFontColor("#000000");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(0);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(97);
    obj.edit108:setHeight(34);
    obj.edit108:setField("arma6_3");
    obj.edit108:setName("edit108");

    obj.layout532 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout532:setParent(obj.rectangle2);
    obj.layout532:setLeft(702);
    obj.layout532:setTop(1736);
    obj.layout532:setWidth(81);
    obj.layout532:setHeight(33);
    obj.layout532:setName("layout532");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout532);
    obj.edit109:setTransparent(true);
    obj.edit109:setFontSize(22.6);
    obj.edit109:setFontColor("#000000");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setLeft(0);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(81);
    obj.edit109:setHeight(34);
    obj.edit109:setField("arma6_4");
    obj.edit109:setName("edit109");

    obj.layout533 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout533:setParent(obj.rectangle2);
    obj.layout533:setLeft(877);
    obj.layout533:setTop(1736);
    obj.layout533:setWidth(73);
    obj.layout533:setHeight(33);
    obj.layout533:setName("layout533");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout533);
    obj.edit110:setTransparent(true);
    obj.edit110:setFontSize(22.6);
    obj.edit110:setFontColor("#000000");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setLeft(0);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(73);
    obj.edit110:setHeight(34);
    obj.edit110:setField("arma6_6");
    obj.edit110:setName("edit110");

    obj.layout534 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout534:setParent(obj.rectangle2);
    obj.layout534:setLeft(987);
    obj.layout534:setTop(1672);
    obj.layout534:setWidth(275);
    obj.layout534:setHeight(102);
    obj.layout534:setName("layout534");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout534);
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setFontSize(23);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(275);
    obj.textEditor4:setHeight(103);
    obj.textEditor4:setField("Descri_o_1");
    obj.textEditor4:setName("textEditor4");

    obj.layout535 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout535:setParent(obj.rectangle2);
    obj.layout535:setLeft(787);
    obj.layout535:setTop(1736);
    obj.layout535:setWidth(86);
    obj.layout535:setHeight(33);
    obj.layout535:setName("layout535");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout535);
    obj.edit111:setTransparent(true);
    obj.edit111:setFontSize(22.6);
    obj.edit111:setFontColor("#000000");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setLeft(0);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(86);
    obj.edit111:setHeight(34);
    obj.edit111:setField("arma6_5");
    obj.edit111:setName("edit111");

    obj.layout536 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout536:setParent(obj.rectangle2);
    obj.layout536:setLeft(108);
    obj.layout536:setTop(1773);
    obj.layout536:setWidth(279);
    obj.layout536:setHeight(33);
    obj.layout536:setName("layout536");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout536);
    obj.edit112:setTransparent(true);
    obj.edit112:setFontSize(22.6);
    obj.edit112:setFontColor("#000000");
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setLeft(0);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(279);
    obj.edit112:setHeight(34);
    obj.edit112:setField("arma7_1");
    obj.edit112:setName("edit112");

    obj.layout537 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout537:setParent(obj.rectangle2);
    obj.layout537:setLeft(392);
    obj.layout537:setTop(1773);
    obj.layout537:setWidth(204);
    obj.layout537:setHeight(33);
    obj.layout537:setName("layout537");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout537);
    obj.edit113:setTransparent(true);
    obj.edit113:setFontSize(22.6);
    obj.edit113:setFontColor("#000000");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setLeft(0);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(204);
    obj.edit113:setHeight(34);
    obj.edit113:setField("arma7_2");
    obj.edit113:setName("edit113");

    obj.layout538 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout538:setParent(obj.rectangle2);
    obj.layout538:setLeft(600);
    obj.layout538:setTop(1773);
    obj.layout538:setWidth(97);
    obj.layout538:setHeight(33);
    obj.layout538:setName("layout538");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout538);
    obj.edit114:setTransparent(true);
    obj.edit114:setFontSize(22.6);
    obj.edit114:setFontColor("#000000");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setLeft(0);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(97);
    obj.edit114:setHeight(34);
    obj.edit114:setField("arma7_3");
    obj.edit114:setName("edit114");

    obj.layout539 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout539:setParent(obj.rectangle2);
    obj.layout539:setLeft(702);
    obj.layout539:setTop(1773);
    obj.layout539:setWidth(81);
    obj.layout539:setHeight(33);
    obj.layout539:setName("layout539");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout539);
    obj.edit115:setTransparent(true);
    obj.edit115:setFontSize(22.6);
    obj.edit115:setFontColor("#000000");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setLeft(0);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(81);
    obj.edit115:setHeight(34);
    obj.edit115:setField("arma7_4");
    obj.edit115:setName("edit115");

    obj.layout540 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout540:setParent(obj.rectangle2);
    obj.layout540:setLeft(787);
    obj.layout540:setTop(1773);
    obj.layout540:setWidth(86);
    obj.layout540:setHeight(33);
    obj.layout540:setName("layout540");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout540);
    obj.edit116:setTransparent(true);
    obj.edit116:setFontSize(22.6);
    obj.edit116:setFontColor("#000000");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setLeft(0);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(86);
    obj.edit116:setHeight(34);
    obj.edit116:setField("arma7_5");
    obj.edit116:setName("edit116");

    obj.layout541 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout541:setParent(obj.rectangle2);
    obj.layout541:setLeft(877);
    obj.layout541:setTop(1773);
    obj.layout541:setWidth(73);
    obj.layout541:setHeight(33);
    obj.layout541:setName("layout541");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout541);
    obj.edit117:setTransparent(true);
    obj.edit117:setFontSize(22.6);
    obj.edit117:setFontColor("#000000");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(0);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(73);
    obj.edit117:setHeight(34);
    obj.edit117:setField("arma7_6");
    obj.edit117:setName("edit117");

    obj.layout542 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout542:setParent(obj.rectangle2);
    obj.layout542:setLeft(1120);
    obj.layout542:setTop(1088);
    obj.layout542:setWidth(23);
    obj.layout542:setHeight(26);
    obj.layout542:setName("layout542");

    obj.imageCheckBox347 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox347:setParent(obj.layout542);
    obj.imageCheckBox347:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox347:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox347:setLeft(0);
    obj.imageCheckBox347:setTop(0);
    obj.imageCheckBox347:setWidth(23);
    obj.imageCheckBox347:setHeight(27);
    obj.imageCheckBox347:setField("Vitalidade_142");
    obj.imageCheckBox347:setName("imageCheckBox347");

    obj.layout543 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout543:setParent(obj.rectangle2);
    obj.layout543:setLeft(1120);
    obj.layout543:setTop(1023);
    obj.layout543:setWidth(23);
    obj.layout543:setHeight(26);
    obj.layout543:setName("layout543");

    obj.imageCheckBox348 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox348:setParent(obj.layout543);
    obj.imageCheckBox348:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox348:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox348:setLeft(0);
    obj.imageCheckBox348:setTop(0);
    obj.imageCheckBox348:setWidth(23);
    obj.imageCheckBox348:setHeight(27);
    obj.imageCheckBox348:setField("Vitalidade_132");
    obj.imageCheckBox348:setName("imageCheckBox348");

    obj.layout544 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout544:setParent(obj.rectangle2);
    obj.layout544:setLeft(1120);
    obj.layout544:setTop(957);
    obj.layout544:setWidth(23);
    obj.layout544:setHeight(26);
    obj.layout544:setName("layout544");

    obj.imageCheckBox349 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox349:setParent(obj.layout544);
    obj.imageCheckBox349:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox349:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox349:setLeft(0);
    obj.imageCheckBox349:setTop(0);
    obj.imageCheckBox349:setWidth(23);
    obj.imageCheckBox349:setHeight(27);
    obj.imageCheckBox349:setField("Vitalidade_122");
    obj.imageCheckBox349:setName("imageCheckBox349");

    obj.layout545 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout545:setParent(obj.rectangle2);
    obj.layout545:setLeft(1120);
    obj.layout545:setTop(891);
    obj.layout545:setWidth(23);
    obj.layout545:setHeight(26);
    obj.layout545:setName("layout545");

    obj.imageCheckBox350 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox350:setParent(obj.layout545);
    obj.imageCheckBox350:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox350:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox350:setLeft(0);
    obj.imageCheckBox350:setTop(0);
    obj.imageCheckBox350:setWidth(23);
    obj.imageCheckBox350:setHeight(27);
    obj.imageCheckBox350:setField("Vitalidade_112");
    obj.imageCheckBox350:setName("imageCheckBox350");

    obj.layout546 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout546:setParent(obj.rectangle2);
    obj.layout546:setLeft(1120);
    obj.layout546:setTop(761);
    obj.layout546:setWidth(23);
    obj.layout546:setHeight(26);
    obj.layout546:setName("layout546");

    obj.imageCheckBox351 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox351:setParent(obj.layout546);
    obj.imageCheckBox351:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox351:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox351:setLeft(0);
    obj.imageCheckBox351:setTop(0);
    obj.imageCheckBox351:setWidth(23);
    obj.imageCheckBox351:setHeight(27);
    obj.imageCheckBox351:setField("Vitalidade_82");
    obj.imageCheckBox351:setName("imageCheckBox351");

    obj.layout547 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout547:setParent(obj.rectangle2);
    obj.layout547:setLeft(453);
    obj.layout547:setTop(300);
    obj.layout547:setWidth(30);
    obj.layout547:setHeight(32);
    obj.layout547:setName("layout547");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout547);
    obj.edit118:setTransparent(true);
    obj.edit118:setFontSize(21.8);
    obj.edit118:setFontColor("#000000");
    obj.edit118:setHorzTextAlign("leading");
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(0);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(30);
    obj.edit118:setHeight(33);
    obj.edit118:setField("fgla");
    obj.edit118:setName("edit118");

    obj.layout548 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout548:setParent(obj.rectangle2);
    obj.layout548:setLeft(456);
    obj.layout548:setTop(336);
    obj.layout548:setWidth(28);
    obj.layout548:setHeight(31);
    obj.layout548:setName("layout548");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout548);
    obj.edit119:setTransparent(true);
    obj.edit119:setFontSize(21.1);
    obj.edit119:setFontColor("#000000");
    obj.edit119:setHorzTextAlign("leading");
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(0);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(28);
    obj.edit119:setHeight(32);
    obj.edit119:setField("vgla");
    obj.edit119:setName("edit119");

    obj.layout549 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout549:setParent(obj.rectangle2);
    obj.layout549:setLeft(501);
    obj.layout549:setTop(368);
    obj.layout549:setWidth(28);
    obj.layout549:setHeight(31);
    obj.layout549:setName("layout549");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout549);
    obj.edit120:setTransparent(true);
    obj.edit120:setFontSize(21.1);
    obj.edit120:setFontColor("#000000");
    obj.edit120:setHorzTextAlign("leading");
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(0);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(28);
    obj.edit120:setHeight(32);
    obj.edit120:setField("apgla");
    obj.edit120:setName("edit120");

    obj.layout550 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout550:setParent(obj.rectangle2);
    obj.layout550:setLeft(531);
    obj.layout550:setTop(401);
    obj.layout550:setWidth(28);
    obj.layout550:setHeight(31);
    obj.layout550:setName("layout550");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout550);
    obj.edit121:setTransparent(true);
    obj.edit121:setFontSize(21.1);
    obj.edit121:setFontColor("#000000");
    obj.edit121:setHorzTextAlign("leading");
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(0);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(28);
    obj.edit121:setHeight(32);
    obj.edit121:setField("mangla");
    obj.edit121:setName("edit121");

    obj.layout551 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout551:setParent(obj.rectangle2);
    obj.layout551:setLeft(689);
    obj.layout551:setTop(301);
    obj.layout551:setWidth(30);
    obj.layout551:setHeight(32);
    obj.layout551:setName("layout551");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout551);
    obj.edit122:setTransparent(true);
    obj.edit122:setFontSize(21.8);
    obj.edit122:setFontColor("#000000");
    obj.edit122:setHorzTextAlign("leading");
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(0);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(30);
    obj.edit122:setHeight(33);
    obj.edit122:setField("fcri");
    obj.edit122:setName("edit122");

    obj.layout552 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout552:setParent(obj.rectangle2);
    obj.layout552:setLeft(721);
    obj.layout552:setTop(336);
    obj.layout552:setWidth(28);
    obj.layout552:setHeight(31);
    obj.layout552:setName("layout552");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout552);
    obj.edit123:setTransparent(true);
    obj.edit123:setFontSize(21.1);
    obj.edit123:setFontColor("#000000");
    obj.edit123:setHorzTextAlign("leading");
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(0);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(28);
    obj.edit123:setHeight(32);
    obj.edit123:setField("descri");
    obj.edit123:setName("edit123");

    obj.layout553 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout553:setParent(obj.rectangle2);
    obj.layout553:setLeft(690);
    obj.layout553:setTop(368);
    obj.layout553:setWidth(28);
    obj.layout553:setHeight(31);
    obj.layout553:setName("layout553");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout553);
    obj.edit124:setTransparent(true);
    obj.edit124:setFontSize(21.1);
    obj.edit124:setFontColor("#000000");
    obj.edit124:setHorzTextAlign("leading");
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(0);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(28);
    obj.edit124:setHeight(32);
    obj.edit124:setField("vigcri");
    obj.edit124:setName("edit124");

    obj.layout554 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout554:setParent(obj.rectangle2);
    obj.layout554:setLeft(767);
    obj.layout554:setTop(401);
    obj.layout554:setWidth(28);
    obj.layout554:setHeight(31);
    obj.layout554:setName("layout554");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout554);
    obj.edit125:setTransparent(true);
    obj.edit125:setFontSize(21.1);
    obj.edit125:setFontColor("#000000");
    obj.edit125:setHorzTextAlign("leading");
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(0);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(28);
    obj.edit125:setHeight(32);
    obj.edit125:setField("mancri");
    obj.edit125:setName("edit125");

    obj.layout555 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout555:setParent(obj.rectangle2);
    obj.layout555:setLeft(917);
    obj.layout555:setTop(301);
    obj.layout555:setWidth(30);
    obj.layout555:setHeight(32);
    obj.layout555:setName("layout555");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout555);
    obj.edit126:setTransparent(true);
    obj.edit126:setFontSize(21.8);
    obj.edit126:setFontColor("#000000");
    obj.edit126:setHorzTextAlign("leading");
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(0);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(30);
    obj.edit126:setHeight(33);
    obj.edit126:setField("fhis");
    obj.edit126:setName("edit126");

    obj.layout556 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout556:setParent(obj.rectangle2);
    obj.layout556:setLeft(956);
    obj.layout556:setTop(335);
    obj.layout556:setWidth(28);
    obj.layout556:setHeight(31);
    obj.layout556:setName("layout556");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout556);
    obj.edit127:setTransparent(true);
    obj.edit127:setFontSize(21.1);
    obj.edit127:setFontColor("#000000");
    obj.edit127:setHorzTextAlign("leading");
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(0);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(28);
    obj.edit127:setHeight(32);
    obj.edit127:setField("deshis");
    obj.edit127:setName("edit127");

    obj.layout557 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout557:setParent(obj.rectangle2);
    obj.layout557:setLeft(926);
    obj.layout557:setTop(368);
    obj.layout557:setWidth(28);
    obj.layout557:setHeight(31);
    obj.layout557:setName("layout557");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout557);
    obj.edit128:setTransparent(true);
    obj.edit128:setFontSize(21.1);
    obj.edit128:setFontColor("#000000");
    obj.edit128:setHorzTextAlign("leading");
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(0);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(28);
    obj.edit128:setHeight(32);
    obj.edit128:setField("vighis");
    obj.edit128:setName("edit128");

    obj.layout558 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout558:setParent(obj.rectangle2);
    obj.layout558:setLeft(1002);
    obj.layout558:setTop(401);
    obj.layout558:setWidth(28);
    obj.layout558:setHeight(31);
    obj.layout558:setName("layout558");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout558);
    obj.edit129:setTransparent(true);
    obj.edit129:setFontSize(21.1);
    obj.edit129:setFontColor("#000000");
    obj.edit129:setHorzTextAlign("leading");
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(0);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(28);
    obj.edit129:setHeight(32);
    obj.edit129:setField("manhis");
    obj.edit129:setName("edit129");

    obj.layout559 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout559:setParent(obj.rectangle2);
    obj.layout559:setLeft(1151);
    obj.layout559:setTop(303);
    obj.layout559:setWidth(30);
    obj.layout559:setHeight(32);
    obj.layout559:setName("layout559");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout559);
    obj.edit130:setTransparent(true);
    obj.edit130:setFontSize(21.8);
    obj.edit130:setFontColor("#000000");
    obj.edit130:setHorzTextAlign("leading");
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(0);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(30);
    obj.edit130:setHeight(33);
    obj.edit130:setField("flu");
    obj.edit130:setName("edit130");

    obj.layout560 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout560:setParent(obj.rectangle2);
    obj.layout560:setLeft(1190);
    obj.layout560:setTop(337);
    obj.layout560:setWidth(28);
    obj.layout560:setHeight(31);
    obj.layout560:setName("layout560");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout560);
    obj.edit131:setTransparent(true);
    obj.edit131:setFontSize(21.1);
    obj.edit131:setFontColor("#000000");
    obj.edit131:setHorzTextAlign("leading");
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(0);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(28);
    obj.edit131:setHeight(32);
    obj.edit131:setField("deslu");
    obj.edit131:setName("edit131");

    obj.layout561 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout561:setParent(obj.rectangle2);
    obj.layout561:setLeft(1161);
    obj.layout561:setTop(370);
    obj.layout561:setWidth(28);
    obj.layout561:setHeight(31);
    obj.layout561:setName("layout561");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout561);
    obj.edit132:setTransparent(true);
    obj.edit132:setFontSize(21.1);
    obj.edit132:setFontColor("#000000");
    obj.edit132:setHorzTextAlign("leading");
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(0);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(28);
    obj.edit132:setHeight(32);
    obj.edit132:setField("viglu");
    obj.edit132:setName("edit132");

    obj.layout562 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout562:setParent(obj.rectangle2);
    obj.layout562:setLeft(1236);
    obj.layout562:setTop(403);
    obj.layout562:setWidth(28);
    obj.layout562:setHeight(31);
    obj.layout562:setName("layout562");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout562);
    obj.edit133:setTransparent(true);
    obj.edit133:setFontSize(21.1);
    obj.edit133:setFontColor("#000000");
    obj.edit133:setHorzTextAlign("leading");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setLeft(0);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(28);
    obj.edit133:setHeight(32);
    obj.edit133:setField("manlu");
    obj.edit133:setName("edit133");

    obj.layout563 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout563:setParent(obj.rectangle2);
    obj.layout563:setLeft(955);
    obj.layout563:setTop(1548);
    obj.layout563:setWidth(23);
    obj.layout563:setHeight(22);
    obj.layout563:setName("layout563");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout563);
    obj.button1:setHitTest(true);
    obj.button1:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button1:setWidth(32);
    obj.button1:setText("R");
    obj.button1:setName("button1");

    obj.layout564 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout564:setParent(obj.rectangle2);
    obj.layout564:setLeft(954);
    obj.layout564:setTop(1586);
    obj.layout564:setWidth(23);
    obj.layout564:setHeight(22);
    obj.layout564:setName("layout564");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout564);
    obj.button2:setHitTest(true);
    obj.button2:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button2:setWidth(32);
    obj.button2:setText("R");
    obj.button2:setName("button2");

    obj.layout565 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout565:setParent(obj.rectangle2);
    obj.layout565:setLeft(954);
    obj.layout565:setTop(1661);
    obj.layout565:setWidth(23);
    obj.layout565:setHeight(22);
    obj.layout565:setName("layout565");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout565);
    obj.button3:setHitTest(true);
    obj.button3:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button3:setWidth(32);
    obj.button3:setText("R");
    obj.button3:setName("button3");

    obj.layout566 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout566:setParent(obj.rectangle2);
    obj.layout566:setLeft(954);
    obj.layout566:setTop(1623);
    obj.layout566:setWidth(23);
    obj.layout566:setHeight(22);
    obj.layout566:setName("layout566");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout566);
    obj.button4:setHitTest(true);
    obj.button4:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button4:setWidth(32);
    obj.button4:setText("R");
    obj.button4:setName("button4");

    obj.layout567 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout567:setParent(obj.rectangle2);
    obj.layout567:setLeft(954);
    obj.layout567:setTop(1738);
    obj.layout567:setWidth(23);
    obj.layout567:setHeight(22);
    obj.layout567:setName("layout567");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout567);
    obj.button5:setHitTest(true);
    obj.button5:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button5:setWidth(32);
    obj.button5:setText("R");
    obj.button5:setName("button5");

    obj.layout568 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout568:setParent(obj.rectangle2);
    obj.layout568:setLeft(954);
    obj.layout568:setTop(1700);
    obj.layout568:setWidth(23);
    obj.layout568:setHeight(22);
    obj.layout568:setName("layout568");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout568);
    obj.button6:setHitTest(true);
    obj.button6:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button6:setWidth(32);
    obj.button6:setText("R");
    obj.button6:setName("button6");

    obj.layout569 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout569:setParent(obj.rectangle2);
    obj.layout569:setLeft(953);
    obj.layout569:setTop(1774);
    obj.layout569:setWidth(23);
    obj.layout569:setHeight(22);
    obj.layout569:setName("layout569");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout569);
    obj.button7:setHitTest(true);
    obj.button7:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button7:setWidth(32);
    obj.button7:setText("R");
    obj.button7:setName("button7");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Antecedentes");
    obj.tab3:setName("tab3");

    obj.frma3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frma3_svg:setParent(obj.tab3);
    obj.frma3_svg:setName("frma3_svg");
    obj.frma3_svg:setAlign("client");
    obj.frma3_svg:setTheme("light");
    obj.frma3_svg:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frma3_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox3);
    obj.rectangle3:setWidth(1369);
    obj.rectangle3:setHeight(1937);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle3);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(1369);
    obj.image3:setHeight(1937);
    obj.image3:setSRC("/Lobisomem/images/ant.png");
    obj.image3:setStyle("stretch");
    obj.image3:setOptimize(true);
    obj.image3:setName("image3");

    obj.layout570 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout570:setParent(obj.rectangle3);
    obj.layout570:setLeft(228);
    obj.layout570:setTop(265);
    obj.layout570:setWidth(439);
    obj.layout570:setHeight(33);
    obj.layout570:setName("layout570");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout570);
    obj.edit134:setTransparent(true);
    obj.edit134:setFontSize(22.6);
    obj.edit134:setFontColor("#000000");
    obj.edit134:setHorzTextAlign("leading");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setLeft(0);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(439);
    obj.edit134:setHeight(34);
    obj.edit134:setField("Natureza_1");
    obj.edit134:setName("edit134");

    obj.layout571 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout571:setParent(obj.rectangle3);
    obj.layout571:setLeft(904);
    obj.layout571:setTop(265);
    obj.layout571:setWidth(355);
    obj.layout571:setHeight(33);
    obj.layout571:setName("layout571");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout571);
    obj.edit135:setTransparent(true);
    obj.edit135:setFontSize(22.6);
    obj.edit135:setFontColor("#000000");
    obj.edit135:setHorzTextAlign("leading");
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(0);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(355);
    obj.edit135:setHeight(34);
    obj.edit135:setField("Comportamento_1");
    obj.edit135:setName("edit135");

    obj.layout572 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout572:setParent(obj.rectangle3);
    obj.layout572:setLeft(108);
    obj.layout572:setTop(404);
    obj.layout572:setWidth(277);
    obj.layout572:setHeight(33);
    obj.layout572:setName("layout572");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout572);
    obj.edit136:setTransparent(true);
    obj.edit136:setFontSize(22.6);
    obj.edit136:setFontColor("#000000");
    obj.edit136:setHorzTextAlign("leading");
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(0);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(277);
    obj.edit136:setHeight(34);
    obj.edit136:setField("Qualidade_1");
    obj.edit136:setName("edit136");

    obj.layout573 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout573:setParent(obj.rectangle3);
    obj.layout573:setLeft(420);
    obj.layout573:setTop(405);
    obj.layout573:setWidth(148);
    obj.layout573:setHeight(33);
    obj.layout573:setName("layout573");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout573);
    obj.edit137:setTransparent(true);
    obj.edit137:setFontSize(22.6);
    obj.edit137:setFontColor("#000000");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(0);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(148);
    obj.edit137:setHeight(34);
    obj.edit137:setField("Tipo_1_1");
    obj.edit137:setName("edit137");

    obj.layout574 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout574:setParent(obj.rectangle3);
    obj.layout574:setLeft(591);
    obj.layout574:setTop(407);
    obj.layout574:setWidth(74);
    obj.layout574:setHeight(33);
    obj.layout574:setName("layout574");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout574);
    obj.edit138:setTransparent(true);
    obj.edit138:setFontSize(22.6);
    obj.edit138:setFontColor("#000000");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(0);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(74);
    obj.edit138:setHeight(34);
    obj.edit138:setField("Custo_1");
    obj.edit138:setName("edit138");

    obj.layout575 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout575:setParent(obj.rectangle3);
    obj.layout575:setLeft(702);
    obj.layout575:setTop(405);
    obj.layout575:setWidth(277);
    obj.layout575:setHeight(33);
    obj.layout575:setName("layout575");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout575);
    obj.edit139:setTransparent(true);
    obj.edit139:setFontSize(22.6);
    obj.edit139:setFontColor("#000000");
    obj.edit139:setHorzTextAlign("leading");
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(0);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(277);
    obj.edit139:setHeight(34);
    obj.edit139:setField("Defeito_1");
    obj.edit139:setName("edit139");

    obj.layout576 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout576:setParent(obj.rectangle3);
    obj.layout576:setLeft(108);
    obj.layout576:setTop(441);
    obj.layout576:setWidth(277);
    obj.layout576:setHeight(33);
    obj.layout576:setName("layout576");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout576);
    obj.edit140:setTransparent(true);
    obj.edit140:setFontSize(22.6);
    obj.edit140:setFontColor("#000000");
    obj.edit140:setHorzTextAlign("leading");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setLeft(0);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(277);
    obj.edit140:setHeight(34);
    obj.edit140:setField("Qualidade_2");
    obj.edit140:setName("edit140");

    obj.layout577 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout577:setParent(obj.rectangle3);
    obj.layout577:setLeft(420);
    obj.layout577:setTop(440);
    obj.layout577:setWidth(148);
    obj.layout577:setHeight(33);
    obj.layout577:setName("layout577");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout577);
    obj.edit141:setTransparent(true);
    obj.edit141:setFontSize(22.6);
    obj.edit141:setFontColor("#000000");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setLeft(0);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(148);
    obj.edit141:setHeight(34);
    obj.edit141:setField("Tipo_2_2");
    obj.edit141:setName("edit141");

    obj.layout578 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout578:setParent(obj.rectangle3);
    obj.layout578:setLeft(702);
    obj.layout578:setTop(442);
    obj.layout578:setWidth(277);
    obj.layout578:setHeight(33);
    obj.layout578:setName("layout578");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout578);
    obj.edit142:setTransparent(true);
    obj.edit142:setFontSize(22.6);
    obj.edit142:setFontColor("#000000");
    obj.edit142:setHorzTextAlign("leading");
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setLeft(0);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(277);
    obj.edit142:setHeight(34);
    obj.edit142:setField("Defeito_2");
    obj.edit142:setName("edit142");

    obj.layout579 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout579:setParent(obj.rectangle3);
    obj.layout579:setLeft(591);
    obj.layout579:setTop(442);
    obj.layout579:setWidth(74);
    obj.layout579:setHeight(33);
    obj.layout579:setName("layout579");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout579);
    obj.edit143:setTransparent(true);
    obj.edit143:setFontSize(22.6);
    obj.edit143:setFontColor("#000000");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setLeft(0);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(74);
    obj.edit143:setHeight(34);
    obj.edit143:setField("Custo_2");
    obj.edit143:setName("edit143");

    obj.layout580 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout580:setParent(obj.rectangle3);
    obj.layout580:setLeft(108);
    obj.layout580:setTop(476);
    obj.layout580:setWidth(277);
    obj.layout580:setHeight(33);
    obj.layout580:setName("layout580");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout580);
    obj.edit144:setTransparent(true);
    obj.edit144:setFontSize(22.6);
    obj.edit144:setFontColor("#000000");
    obj.edit144:setHorzTextAlign("leading");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setLeft(0);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(277);
    obj.edit144:setHeight(34);
    obj.edit144:setField("Qualidade_3");
    obj.edit144:setName("edit144");

    obj.layout581 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout581:setParent(obj.rectangle3);
    obj.layout581:setLeft(108);
    obj.layout581:setTop(513);
    obj.layout581:setWidth(277);
    obj.layout581:setHeight(33);
    obj.layout581:setName("layout581");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout581);
    obj.edit145:setTransparent(true);
    obj.edit145:setFontSize(22.6);
    obj.edit145:setFontColor("#000000");
    obj.edit145:setHorzTextAlign("leading");
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setLeft(0);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(277);
    obj.edit145:setHeight(34);
    obj.edit145:setField("Qualidade_4");
    obj.edit145:setName("edit145");

    obj.layout582 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout582:setParent(obj.rectangle3);
    obj.layout582:setLeft(108);
    obj.layout582:setTop(547);
    obj.layout582:setWidth(277);
    obj.layout582:setHeight(33);
    obj.layout582:setName("layout582");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout582);
    obj.edit146:setTransparent(true);
    obj.edit146:setFontSize(22.6);
    obj.edit146:setFontColor("#000000");
    obj.edit146:setHorzTextAlign("leading");
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setLeft(0);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(277);
    obj.edit146:setHeight(34);
    obj.edit146:setField("Qualidade_5");
    obj.edit146:setName("edit146");

    obj.layout583 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout583:setParent(obj.rectangle3);
    obj.layout583:setLeft(1013);
    obj.layout583:setTop(404);
    obj.layout583:setWidth(148);
    obj.layout583:setHeight(33);
    obj.layout583:setName("layout583");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout583);
    obj.edit147:setTransparent(true);
    obj.edit147:setFontSize(22.6);
    obj.edit147:setFontColor("#000000");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setLeft(0);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(148);
    obj.edit147:setHeight(34);
    obj.edit147:setField("Tipo_1");
    obj.edit147:setName("edit147");

    obj.layout584 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout584:setParent(obj.rectangle3);
    obj.layout584:setLeft(1013);
    obj.layout584:setTop(440);
    obj.layout584:setWidth(148);
    obj.layout584:setHeight(33);
    obj.layout584:setName("layout584");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout584);
    obj.edit148:setTransparent(true);
    obj.edit148:setFontSize(22.6);
    obj.edit148:setFontColor("#000000");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setLeft(0);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(148);
    obj.edit148:setHeight(34);
    obj.edit148:setField("Tipo_2");
    obj.edit148:setName("edit148");

    obj.layout585 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout585:setParent(obj.rectangle3);
    obj.layout585:setLeft(1185);
    obj.layout585:setTop(440);
    obj.layout585:setWidth(74);
    obj.layout585:setHeight(33);
    obj.layout585:setName("layout585");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout585);
    obj.edit149:setTransparent(true);
    obj.edit149:setFontSize(22.6);
    obj.edit149:setFontColor("#000000");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setLeft(0);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(74);
    obj.edit149:setHeight(34);
    obj.edit149:setField("B_nus_2");
    obj.edit149:setName("edit149");

    obj.layout586 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout586:setParent(obj.rectangle3);
    obj.layout586:setLeft(420);
    obj.layout586:setTop(475);
    obj.layout586:setWidth(148);
    obj.layout586:setHeight(33);
    obj.layout586:setName("layout586");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout586);
    obj.edit150:setTransparent(true);
    obj.edit150:setFontSize(22.6);
    obj.edit150:setFontColor("#000000");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setLeft(0);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(148);
    obj.edit150:setHeight(34);
    obj.edit150:setField("Tipo_3_3");
    obj.edit150:setName("edit150");

    obj.layout587 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout587:setParent(obj.rectangle3);
    obj.layout587:setLeft(591);
    obj.layout587:setTop(478);
    obj.layout587:setWidth(74);
    obj.layout587:setHeight(33);
    obj.layout587:setName("layout587");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout587);
    obj.edit151:setTransparent(true);
    obj.edit151:setFontSize(22.6);
    obj.edit151:setFontColor("#000000");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setLeft(0);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(74);
    obj.edit151:setHeight(34);
    obj.edit151:setField("Custo_3");
    obj.edit151:setName("edit151");

    obj.layout588 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout588:setParent(obj.rectangle3);
    obj.layout588:setLeft(702);
    obj.layout588:setTop(477);
    obj.layout588:setWidth(277);
    obj.layout588:setHeight(33);
    obj.layout588:setName("layout588");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout588);
    obj.edit152:setTransparent(true);
    obj.edit152:setFontSize(22.6);
    obj.edit152:setFontColor("#000000");
    obj.edit152:setHorzTextAlign("leading");
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setLeft(0);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(277);
    obj.edit152:setHeight(34);
    obj.edit152:setField("Defeito_3");
    obj.edit152:setName("edit152");

    obj.layout589 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout589:setParent(obj.rectangle3);
    obj.layout589:setLeft(1013);
    obj.layout589:setTop(475);
    obj.layout589:setWidth(148);
    obj.layout589:setHeight(33);
    obj.layout589:setName("layout589");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout589);
    obj.edit153:setTransparent(true);
    obj.edit153:setFontSize(22.6);
    obj.edit153:setFontColor("#000000");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setLeft(0);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(148);
    obj.edit153:setHeight(34);
    obj.edit153:setField("Tipo_3");
    obj.edit153:setName("edit153");

    obj.layout590 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout590:setParent(obj.rectangle3);
    obj.layout590:setLeft(1185);
    obj.layout590:setTop(475);
    obj.layout590:setWidth(74);
    obj.layout590:setHeight(33);
    obj.layout590:setName("layout590");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout590);
    obj.edit154:setTransparent(true);
    obj.edit154:setFontSize(22.6);
    obj.edit154:setFontColor("#000000");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(0);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(74);
    obj.edit154:setHeight(34);
    obj.edit154:setField("B_nus_3");
    obj.edit154:setName("edit154");

    obj.layout591 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout591:setParent(obj.rectangle3);
    obj.layout591:setLeft(420);
    obj.layout591:setTop(511);
    obj.layout591:setWidth(148);
    obj.layout591:setHeight(33);
    obj.layout591:setName("layout591");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout591);
    obj.edit155:setTransparent(true);
    obj.edit155:setFontSize(22.6);
    obj.edit155:setFontColor("#000000");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(0);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(148);
    obj.edit155:setHeight(34);
    obj.edit155:setField("Tipo_4_4");
    obj.edit155:setName("edit155");

    obj.layout592 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout592:setParent(obj.rectangle3);
    obj.layout592:setLeft(591);
    obj.layout592:setTop(513);
    obj.layout592:setWidth(74);
    obj.layout592:setHeight(33);
    obj.layout592:setName("layout592");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout592);
    obj.edit156:setTransparent(true);
    obj.edit156:setFontSize(22.6);
    obj.edit156:setFontColor("#000000");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(0);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(74);
    obj.edit156:setHeight(34);
    obj.edit156:setField("Custo_4");
    obj.edit156:setName("edit156");

    obj.layout593 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout593:setParent(obj.rectangle3);
    obj.layout593:setLeft(702);
    obj.layout593:setTop(513);
    obj.layout593:setWidth(277);
    obj.layout593:setHeight(33);
    obj.layout593:setName("layout593");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout593);
    obj.edit157:setTransparent(true);
    obj.edit157:setFontSize(22.6);
    obj.edit157:setFontColor("#000000");
    obj.edit157:setHorzTextAlign("leading");
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(0);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(277);
    obj.edit157:setHeight(34);
    obj.edit157:setField("Defeito_4");
    obj.edit157:setName("edit157");

    obj.layout594 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout594:setParent(obj.rectangle3);
    obj.layout594:setLeft(1013);
    obj.layout594:setTop(510);
    obj.layout594:setWidth(148);
    obj.layout594:setHeight(33);
    obj.layout594:setName("layout594");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout594);
    obj.edit158:setTransparent(true);
    obj.edit158:setFontSize(22.6);
    obj.edit158:setFontColor("#000000");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(0);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(148);
    obj.edit158:setHeight(34);
    obj.edit158:setField("Tipo_4");
    obj.edit158:setName("edit158");

    obj.layout595 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout595:setParent(obj.rectangle3);
    obj.layout595:setLeft(1185);
    obj.layout595:setTop(510);
    obj.layout595:setWidth(74);
    obj.layout595:setHeight(33);
    obj.layout595:setName("layout595");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout595);
    obj.edit159:setTransparent(true);
    obj.edit159:setFontSize(22.6);
    obj.edit159:setFontColor("#000000");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(0);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(74);
    obj.edit159:setHeight(34);
    obj.edit159:setField("B_nus_4");
    obj.edit159:setName("edit159");

    obj.layout596 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout596:setParent(obj.rectangle3);
    obj.layout596:setLeft(420);
    obj.layout596:setTop(545);
    obj.layout596:setWidth(148);
    obj.layout596:setHeight(33);
    obj.layout596:setName("layout596");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout596);
    obj.edit160:setTransparent(true);
    obj.edit160:setFontSize(22.6);
    obj.edit160:setFontColor("#000000");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(0);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(148);
    obj.edit160:setHeight(34);
    obj.edit160:setField("Tipo_5_5");
    obj.edit160:setName("edit160");

    obj.layout597 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout597:setParent(obj.rectangle3);
    obj.layout597:setLeft(591);
    obj.layout597:setTop(548);
    obj.layout597:setWidth(74);
    obj.layout597:setHeight(33);
    obj.layout597:setName("layout597");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout597);
    obj.edit161:setTransparent(true);
    obj.edit161:setFontSize(22.6);
    obj.edit161:setFontColor("#000000");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setLeft(0);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(74);
    obj.edit161:setHeight(34);
    obj.edit161:setField("Custo_5");
    obj.edit161:setName("edit161");

    obj.layout598 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout598:setParent(obj.rectangle3);
    obj.layout598:setLeft(702);
    obj.layout598:setTop(548);
    obj.layout598:setWidth(277);
    obj.layout598:setHeight(33);
    obj.layout598:setName("layout598");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout598);
    obj.edit162:setTransparent(true);
    obj.edit162:setFontSize(22.6);
    obj.edit162:setFontColor("#000000");
    obj.edit162:setHorzTextAlign("leading");
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setLeft(0);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(277);
    obj.edit162:setHeight(34);
    obj.edit162:setField("Defeito_5");
    obj.edit162:setName("edit162");

    obj.layout599 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout599:setParent(obj.rectangle3);
    obj.layout599:setLeft(1013);
    obj.layout599:setTop(546);
    obj.layout599:setWidth(148);
    obj.layout599:setHeight(33);
    obj.layout599:setName("layout599");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout599);
    obj.edit163:setTransparent(true);
    obj.edit163:setFontSize(22.6);
    obj.edit163:setFontColor("#000000");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setLeft(0);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(148);
    obj.edit163:setHeight(34);
    obj.edit163:setField("Tipo_5");
    obj.edit163:setName("edit163");

    obj.layout600 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout600:setParent(obj.rectangle3);
    obj.layout600:setLeft(1185);
    obj.layout600:setTop(404);
    obj.layout600:setWidth(74);
    obj.layout600:setHeight(33);
    obj.layout600:setName("layout600");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout600);
    obj.edit164:setTransparent(true);
    obj.edit164:setFontSize(22.6);
    obj.edit164:setFontColor("#000000");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setLeft(0);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(74);
    obj.edit164:setHeight(34);
    obj.edit164:setField("B_nus_1");
    obj.edit164:setName("edit164");

    obj.layout601 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout601:setParent(obj.rectangle3);
    obj.layout601:setLeft(1185);
    obj.layout601:setTop(546);
    obj.layout601:setWidth(74);
    obj.layout601:setHeight(33);
    obj.layout601:setName("layout601");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout601);
    obj.edit165:setTransparent(true);
    obj.edit165:setFontSize(22.6);
    obj.edit165:setFontColor("#000000");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setLeft(0);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(74);
    obj.edit165:setHeight(34);
    obj.edit165:setField("B_nus_5");
    obj.edit165:setName("edit165");

    obj.layout602 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout602:setParent(obj.rectangle3);
    obj.layout602:setLeft(106);
    obj.layout602:setTop(685);
    obj.layout602:setWidth(552);
    obj.layout602:setHeight(139);
    obj.layout602:setName("layout602");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout602);
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setFontSize(23);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(552);
    obj.textEditor5:setHeight(140);
    obj.textEditor5:setField("Aliados_1");
    obj.textEditor5:setName("textEditor5");

    obj.layout603 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout603:setParent(obj.rectangle3);
    obj.layout603:setLeft(699);
    obj.layout603:setTop(685);
    obj.layout603:setWidth(552);
    obj.layout603:setHeight(137);
    obj.layout603:setName("layout603");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout603);
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setFontSize(23);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(552);
    obj.textEditor6:setHeight(138);
    obj.textEditor6:setField("Mentor_1");
    obj.textEditor6:setName("textEditor6");

    obj.layout604 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout604:setParent(obj.rectangle3);
    obj.layout604:setLeft(106);
    obj.layout604:setTop(867);
    obj.layout604:setWidth(552);
    obj.layout604:setHeight(142);
    obj.layout604:setName("layout604");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout604);
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setFontSize(23);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(552);
    obj.textEditor7:setHeight(143);
    obj.textEditor7:setField("Ancestrais_1");
    obj.textEditor7:setName("textEditor7");

    obj.layout605 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout605:setParent(obj.rectangle3);
    obj.layout605:setLeft(699);
    obj.layout605:setTop(870);
    obj.layout605:setWidth(552);
    obj.layout605:setHeight(136);
    obj.layout605:setName("layout605");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout605);
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setFontSize(23);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(0);
    obj.textEditor8:setWidth(552);
    obj.textEditor8:setHeight(137);
    obj.textEditor8:setField("Raça_pura_1");
    obj.textEditor8:setName("textEditor8");

    obj.layout606 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout606:setParent(obj.rectangle3);
    obj.layout606:setLeft(106);
    obj.layout606:setTop(1050);
    obj.layout606:setWidth(552);
    obj.layout606:setHeight(140);
    obj.layout606:setName("layout606");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout606);
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setFontSize(23);
    obj.textEditor9:setFontColor("#000000");
    obj.textEditor9:setLeft(0);
    obj.textEditor9:setTop(0);
    obj.textEditor9:setWidth(552);
    obj.textEditor9:setHeight(141);
    obj.textEditor9:setField("Contatos_1");
    obj.textEditor9:setName("textEditor9");

    obj.layout607 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout607:setParent(obj.rectangle3);
    obj.layout607:setLeft(699);
    obj.layout607:setTop(1050);
    obj.layout607:setWidth(552);
    obj.layout607:setHeight(142);
    obj.layout607:setName("layout607");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout607);
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setFontSize(23);
    obj.textEditor10:setFontColor("#000000");
    obj.textEditor10:setLeft(0);
    obj.textEditor10:setTop(0);
    obj.textEditor10:setWidth(552);
    obj.textEditor10:setHeight(143);
    obj.textEditor10:setField("Recursos_1");
    obj.textEditor10:setName("textEditor10");

    obj.layout608 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout608:setParent(obj.rectangle3);
    obj.layout608:setLeft(106);
    obj.layout608:setTop(1234);
    obj.layout608:setWidth(552);
    obj.layout608:setHeight(142);
    obj.layout608:setName("layout608");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout608);
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setFontSize(23);
    obj.textEditor11:setFontColor("#000000");
    obj.textEditor11:setLeft(0);
    obj.textEditor11:setTop(0);
    obj.textEditor11:setWidth(552);
    obj.textEditor11:setHeight(143);
    obj.textEditor11:setField("Parentes_1");
    obj.textEditor11:setName("textEditor11");

    obj.layout609 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout609:setParent(obj.rectangle3);
    obj.layout609:setLeft(903);
    obj.layout609:setTop(1194);
    obj.layout609:setWidth(240);
    obj.layout609:setHeight(33);
    obj.layout609:setName("layout609");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout609);
    obj.edit166:setTransparent(true);
    obj.edit166:setFontSize(22.6);
    obj.edit166:setFontColor("#000000");
    obj.edit166:setHorzTextAlign("leading");
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setLeft(0);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(240);
    obj.edit166:setHeight(34);
    obj.edit166:setField("undefined_3");
    obj.edit166:setName("edit166");

    obj.layout610 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout610:setParent(obj.rectangle3);
    obj.layout610:setLeft(699);
    obj.layout610:setTop(1234);
    obj.layout610:setWidth(552);
    obj.layout610:setHeight(143);
    obj.layout610:setName("layout610");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout610);
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setFontSize(23);
    obj.textEditor12:setFontColor("#000000");
    obj.textEditor12:setLeft(0);
    obj.textEditor12:setTop(0);
    obj.textEditor12:setWidth(552);
    obj.textEditor12:setHeight(144);
    obj.textEditor12:setField("Outro_1");
    obj.textEditor12:setName("textEditor12");

    obj.layout611 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout611:setParent(obj.rectangle3);
    obj.layout611:setLeft(105);
    obj.layout611:setTop(1447);
    obj.layout611:setWidth(565);
    obj.layout611:setHeight(65);
    obj.layout611:setName("layout611");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout611);
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setFontSize(23);
    obj.textEditor13:setFontColor("#000000");
    obj.textEditor13:setLeft(0);
    obj.textEditor13:setTop(0);
    obj.textEditor13:setWidth(565);
    obj.textEditor13:setHeight(66);
    obj.textEditor13:setField("Equipamento_Carregado_1");
    obj.textEditor13:setName("textEditor13");

    obj.layout612 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout612:setParent(obj.rectangle3);
    obj.layout612:setLeft(801);
    obj.layout612:setTop(1415);
    obj.layout612:setWidth(82);
    obj.layout612:setHeight(33);
    obj.layout612:setName("layout612");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout612);
    obj.edit167:setTransparent(true);
    obj.edit167:setFontSize(22.6);
    obj.edit167:setFontColor("#000000");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setLeft(0);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(82);
    obj.edit167:setHeight(34);
    obj.edit167:setField("TOTAL");
    obj.edit167:setName("edit167");

    obj.layout613 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout613:setParent(obj.rectangle3);
    obj.layout613:setLeft(699);
    obj.layout613:setTop(1480);
    obj.layout613:setWidth(565);
    obj.layout613:setHeight(137);
    obj.layout613:setName("layout613");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout613);
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setFontSize(23);
    obj.textEditor14:setFontColor("#000000");
    obj.textEditor14:setLeft(0);
    obj.textEditor14:setTop(0);
    obj.textEditor14:setWidth(565);
    obj.textEditor14:setHeight(138);
    obj.textEditor14:setField("Adquirido_em_1");
    obj.textEditor14:setName("textEditor14");

    obj.layout614 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout614:setParent(obj.rectangle3);
    obj.layout614:setLeft(105);
    obj.layout614:setTop(1545);
    obj.layout614:setWidth(565);
    obj.layout614:setHeight(65);
    obj.layout614:setName("layout614");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout614);
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setFontSize(23);
    obj.textEditor15:setFontColor("#000000");
    obj.textEditor15:setLeft(0);
    obj.textEditor15:setTop(0);
    obj.textEditor15:setWidth(565);
    obj.textEditor15:setHeight(66);
    obj.textEditor15:setField("Bens_Possuídos_1");
    obj.textEditor15:setName("textEditor15");

    obj.layout615 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout615:setParent(obj.rectangle3);
    obj.layout615:setLeft(182);
    obj.layout615:setTop(1663);
    obj.layout615:setWidth(489);
    obj.layout615:setHeight(33);
    obj.layout615:setName("layout615");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout615);
    obj.edit168:setTransparent(true);
    obj.edit168:setFontSize(22.6);
    obj.edit168:setFontColor("#000000");
    obj.edit168:setHorzTextAlign("leading");
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setLeft(0);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(489);
    obj.edit168:setHeight(34);
    obj.edit168:setField("Seita");
    obj.edit168:setName("edit168");

    obj.layout616 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout616:setParent(obj.rectangle3);
    obj.layout616:setLeft(906);
    obj.layout616:setTop(1635);
    obj.layout616:setWidth(82);
    obj.layout616:setHeight(33);
    obj.layout616:setName("layout616");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout616);
    obj.edit169:setTransparent(true);
    obj.edit169:setFontSize(22.6);
    obj.edit169:setFontColor("#000000");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setLeft(0);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(82);
    obj.edit169:setHeight(34);
    obj.edit169:setField("undefined_5");
    obj.edit169:setName("edit169");

    obj.layout617 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout617:setParent(obj.rectangle3);
    obj.layout617:setLeft(351);
    obj.layout617:setTop(1699);
    obj.layout617:setWidth(320);
    obj.layout617:setHeight(33);
    obj.layout617:setName("layout617");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout617);
    obj.edit170:setTransparent(true);
    obj.edit170:setFontSize(22.6);
    obj.edit170:setFontColor("#000000");
    obj.edit170:setHorzTextAlign("leading");
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setLeft(0);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(320);
    obj.edit170:setHeight(34);
    obj.edit170:setField("undefined_6");
    obj.edit170:setName("edit170");

    obj.layout618 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout618:setParent(obj.rectangle3);
    obj.layout618:setLeft(176);
    obj.layout618:setTop(1733);
    obj.layout618:setWidth(54);
    obj.layout618:setHeight(33);
    obj.layout618:setName("layout618");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout618);
    obj.edit171:setTransparent(true);
    obj.edit171:setFontSize(22.6);
    obj.edit171:setFontColor("#000000");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setLeft(0);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(54);
    obj.edit171:setHeight(34);
    obj.edit171:setField("Localização_do_Caern");
    obj.edit171:setName("edit171");

    obj.layout619 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout619:setParent(obj.rectangle3);
    obj.layout619:setLeft(699);
    obj.layout619:setTop(1701);
    obj.layout619:setWidth(565);
    obj.layout619:setHeight(135);
    obj.layout619:setName("layout619");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout619);
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setFontSize(23);
    obj.textEditor16:setFontColor("#000000");
    obj.textEditor16:setLeft(0);
    obj.textEditor16:setTop(0);
    obj.textEditor16:setWidth(565);
    obj.textEditor16:setHeight(136);
    obj.textEditor16:setField("Gasto_em_1");
    obj.textEditor16:setName("textEditor16");

    obj.layout620 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout620:setParent(obj.rectangle3);
    obj.layout620:setLeft(298);
    obj.layout620:setTop(1733);
    obj.layout620:setWidth(373);
    obj.layout620:setHeight(33);
    obj.layout620:setName("layout620");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout620);
    obj.edit172:setTransparent(true);
    obj.edit172:setFontSize(22.6);
    obj.edit172:setFontColor("#000000");
    obj.edit172:setHorzTextAlign("leading");
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setLeft(0);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(373);
    obj.edit172:setHeight(34);
    obj.edit172:setField("undefined_7");
    obj.edit172:setName("edit172");

    obj.layout621 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout621:setParent(obj.rectangle3);
    obj.layout621:setLeft(189);
    obj.layout621:setTop(1765);
    obj.layout621:setWidth(482);
    obj.layout621:setHeight(33);
    obj.layout621:setName("layout621");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout621);
    obj.edit173:setTransparent(true);
    obj.edit173:setFontSize(22.6);
    obj.edit173:setFontColor("#000000");
    obj.edit173:setHorzTextAlign("leading");
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(0);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(482);
    obj.edit173:setHeight(34);
    obj.edit173:setField("Tipo");
    obj.edit173:setName("edit173");

    obj.layout622 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout622:setParent(obj.rectangle3);
    obj.layout622:setLeft(171);
    obj.layout622:setTop(1798);
    obj.layout622:setWidth(500);
    obj.layout622:setHeight(33);
    obj.layout622:setName("layout622");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout622);
    obj.edit174:setTransparent(true);
    obj.edit174:setFontSize(22.6);
    obj.edit174:setFontColor("#000000");
    obj.edit174:setHorzTextAlign("leading");
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setLeft(0);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(500);
    obj.edit174:setHeight(34);
    obj.edit174:setField("Totem");
    obj.edit174:setName("edit174");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Prelúdio");
    obj.tab4:setName("tab4");

    obj.frma4_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frma4_svg:setParent(obj.tab4);
    obj.frma4_svg:setName("frma4_svg");
    obj.frma4_svg:setAlign("client");
    obj.frma4_svg:setTheme("light");
    obj.frma4_svg:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frma4_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox4);
    obj.rectangle4:setWidth(1369);
    obj.rectangle4:setHeight(1937);
    obj.rectangle4:setColor("white");
    obj.rectangle4:setName("rectangle4");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle4);
    obj.image4:setLeft(0);
    obj.image4:setTop(0);
    obj.image4:setWidth(1369);
    obj.image4:setHeight(1937);
    obj.image4:setSRC("/Lobisomem/images/pre.png");
    obj.image4:setStyle("stretch");
    obj.image4:setOptimize(true);
    obj.image4:setName("image4");

    obj.layout623 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout623:setParent(obj.rectangle4);
    obj.layout623:setLeft(111);
    obj.layout623:setTop(362);
    obj.layout623:setWidth(1150);
    obj.layout623:setHeight(495);
    obj.layout623:setName("layout623");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout623);
    obj.richEdit1:setLeft(0);
    obj.richEdit1:setTop(0);
    obj.richEdit1:setWidth(1150);
    obj.richEdit1:setHeight(496);
    obj.richEdit1:setField("Prelœdio_1");
    obj.richEdit1:setName("richEdit1");

    obj.layout624 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout624:setParent(obj.rectangle4);
    obj.layout624:setLeft(174);
    obj.layout624:setTop(914);
    obj.layout624:setWidth(247);
    obj.layout624:setHeight(33);
    obj.layout624:setName("layout624");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout624);
    obj.edit175:setTransparent(true);
    obj.edit175:setFontSize(22.6);
    obj.edit175:setFontColor("#000000");
    obj.edit175:setHorzTextAlign("leading");
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setLeft(0);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(247);
    obj.edit175:setHeight(34);
    obj.edit175:setField("Idade");
    obj.edit175:setName("edit175");

    obj.layout625 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout625:setParent(obj.rectangle4);
    obj.layout625:setLeft(202);
    obj.layout625:setTop(947);
    obj.layout625:setWidth(220);
    obj.layout625:setHeight(33);
    obj.layout625:setName("layout625");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout625);
    obj.edit176:setTransparent(true);
    obj.edit176:setFontSize(22.6);
    obj.edit176:setFontColor("#000000");
    obj.edit176:setHorzTextAlign("leading");
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(0);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(220);
    obj.edit176:setHeight(34);
    obj.edit176:setField("Cabelos");
    obj.edit176:setName("edit176");

    obj.layout626 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout626:setParent(obj.rectangle4);
    obj.layout626:setLeft(188);
    obj.layout626:setTop(979);
    obj.layout626:setWidth(233);
    obj.layout626:setHeight(33);
    obj.layout626:setName("layout626");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout626);
    obj.edit177:setTransparent(true);
    obj.edit177:setFontSize(22.6);
    obj.edit177:setFontColor("#000000");
    obj.edit177:setHorzTextAlign("leading");
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(0);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(233);
    obj.edit177:setHeight(34);
    obj.edit177:setField("Olhos");
    obj.edit177:setName("edit177");

    obj.layout627 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout627:setParent(obj.rectangle4);
    obj.layout627:setLeft(174);
    obj.layout627:setTop(1012);
    obj.layout627:setWidth(247);
    obj.layout627:setHeight(33);
    obj.layout627:setName("layout627");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout627);
    obj.edit178:setTransparent(true);
    obj.edit178:setFontSize(22.6);
    obj.edit178:setFontColor("#000000");
    obj.edit178:setHorzTextAlign("leading");
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(0);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(247);
    obj.edit178:setHeight(34);
    obj.edit178:setField("Raça");
    obj.edit178:setName("edit178");

    obj.layout628 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout628:setParent(obj.rectangle4);
    obj.layout628:setLeft(274);
    obj.layout628:setTop(1045);
    obj.layout628:setWidth(147);
    obj.layout628:setHeight(33);
    obj.layout628:setName("layout628");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout628);
    obj.edit179:setTransparent(true);
    obj.edit179:setFontSize(22.6);
    obj.edit179:setFontColor("#000000");
    obj.edit179:setHorzTextAlign("leading");
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(0);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(147);
    obj.edit179:setHeight(34);
    obj.edit179:setField("Nacionalidade");
    obj.edit179:setName("edit179");

    obj.layout629 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout629:setParent(obj.rectangle4);
    obj.layout629:setLeft(453);
    obj.layout629:setTop(914);
    obj.layout629:setWidth(799);
    obj.layout629:setHeight(230);
    obj.layout629:setName("layout629");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout629);
    obj.richEdit2:setLeft(0);
    obj.richEdit2:setTop(0);
    obj.richEdit2:setWidth(799);
    obj.richEdit2:setHeight(231);
    obj.richEdit2:setField("_1_3");
    obj.richEdit2:setName("richEdit2");

    obj.layout630 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout630:setParent(obj.rectangle4);
    obj.layout630:setLeft(169);
    obj.layout630:setTop(1077);
    obj.layout630:setWidth(252);
    obj.layout630:setHeight(33);
    obj.layout630:setName("layout630");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout630);
    obj.edit180:setTransparent(true);
    obj.edit180:setFontSize(22.6);
    obj.edit180:setFontColor("#000000");
    obj.edit180:setHorzTextAlign("leading");
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(0);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(252);
    obj.edit180:setHeight(34);
    obj.edit180:setField("Sexo");
    obj.edit180:setName("edit180");

    obj.layout631 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout631:setParent(obj.rectangle4);
    obj.layout631:setLeft(241);
    obj.layout631:setTop(1142);
    obj.layout631:setWidth(82);
    obj.layout631:setHeight(33);
    obj.layout631:setName("layout631");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout631);
    obj.edit181:setTransparent(true);
    obj.edit181:setFontSize(22.6);
    obj.edit181:setFontColor("#000000");
    obj.edit181:setHorzTextAlign("leading");
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(0);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(82);
    obj.edit181:setHeight(34);
    obj.edit181:setField("Hominídeo");
    obj.edit181:setName("edit181");

    obj.layout632 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout632:setParent(obj.rectangle4);
    obj.layout632:setLeft(340);
    obj.layout632:setTop(1142);
    obj.layout632:setWidth(82);
    obj.layout632:setHeight(33);
    obj.layout632:setName("layout632");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout632);
    obj.edit182:setTransparent(true);
    obj.edit182:setFontSize(22.6);
    obj.edit182:setFontColor("#000000");
    obj.edit182:setHorzTextAlign("leading");
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(0);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(82);
    obj.edit182:setHeight(34);
    obj.edit182:setField("undefined_8");
    obj.edit182:setName("edit182");

    obj.layout633 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout633:setParent(obj.rectangle4);
    obj.layout633:setLeft(200);
    obj.layout633:setTop(1175);
    obj.layout633:setWidth(123);
    obj.layout633:setHeight(33);
    obj.layout633:setName("layout633");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout633);
    obj.edit183:setTransparent(true);
    obj.edit183:setFontSize(22.6);
    obj.edit183:setFontColor("#000000");
    obj.edit183:setHorzTextAlign("leading");
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(0);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(123);
    obj.edit183:setHeight(34);
    obj.edit183:setField("Glabro");
    obj.edit183:setName("edit183");

    obj.layout634 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout634:setParent(obj.rectangle4);
    obj.layout634:setLeft(340);
    obj.layout634:setTop(1175);
    obj.layout634:setWidth(82);
    obj.layout634:setHeight(33);
    obj.layout634:setName("layout634");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout634);
    obj.edit184:setTransparent(true);
    obj.edit184:setFontSize(22.6);
    obj.edit184:setFontColor("#000000");
    obj.edit184:setHorzTextAlign("leading");
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(0);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(82);
    obj.edit184:setHeight(34);
    obj.edit184:setField("undefined_9");
    obj.edit184:setName("edit184");

    obj.layout635 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout635:setParent(obj.rectangle4);
    obj.layout635:setLeft(453);
    obj.layout635:setTop(1175);
    obj.layout635:setWidth(799);
    obj.layout635:setHeight(65);
    obj.layout635:setName("layout635");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout635);
    obj.textEditor17:setTransparent(true);
    obj.textEditor17:setFontSize(23);
    obj.textEditor17:setFontColor("#000000");
    obj.textEditor17:setLeft(0);
    obj.textEditor17:setTop(0);
    obj.textEditor17:setWidth(799);
    obj.textEditor17:setHeight(66);
    obj.textEditor17:setField("Altura__Peso_2");
    obj.textEditor17:setName("textEditor17");

    obj.layout636 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout636:setParent(obj.rectangle4);
    obj.layout636:setLeft(188);
    obj.layout636:setTop(1207);
    obj.layout636:setWidth(137);
    obj.layout636:setHeight(33);
    obj.layout636:setName("layout636");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout636);
    obj.edit185:setTransparent(true);
    obj.edit185:setFontSize(22.6);
    obj.edit185:setFontColor("#000000");
    obj.edit185:setHorzTextAlign("leading");
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(0);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(137);
    obj.edit185:setHeight(34);
    obj.edit185:setField("Crinos");
    obj.edit185:setName("edit185");

    obj.layout637 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout637:setParent(obj.rectangle4);
    obj.layout637:setLeft(340);
    obj.layout637:setTop(1207);
    obj.layout637:setWidth(82);
    obj.layout637:setHeight(33);
    obj.layout637:setName("layout637");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout637);
    obj.edit186:setTransparent(true);
    obj.edit186:setFontSize(22.6);
    obj.edit186:setFontColor("#000000");
    obj.edit186:setHorzTextAlign("leading");
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(0);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(82);
    obj.edit186:setHeight(34);
    obj.edit186:setField("undefined_10");
    obj.edit186:setName("edit186");

    obj.layout638 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout638:setParent(obj.rectangle4);
    obj.layout638:setLeft(186);
    obj.layout638:setTop(1240);
    obj.layout638:setWidth(137);
    obj.layout638:setHeight(33);
    obj.layout638:setName("layout638");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout638);
    obj.edit187:setTransparent(true);
    obj.edit187:setFontSize(22.6);
    obj.edit187:setFontColor("#000000");
    obj.edit187:setHorzTextAlign("leading");
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(0);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(137);
    obj.edit187:setHeight(34);
    obj.edit187:setField("Hispo");
    obj.edit187:setName("edit187");

    obj.layout639 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout639:setParent(obj.rectangle4);
    obj.layout639:setLeft(340);
    obj.layout639:setTop(1240);
    obj.layout639:setWidth(82);
    obj.layout639:setHeight(33);
    obj.layout639:setName("layout639");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout639);
    obj.edit188:setTransparent(true);
    obj.edit188:setFontSize(22.6);
    obj.edit188:setFontColor("#000000");
    obj.edit188:setHorzTextAlign("leading");
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(0);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(82);
    obj.edit188:setHeight(34);
    obj.edit188:setField("undefined_11");
    obj.edit188:setName("edit188");

    obj.layout640 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout640:setParent(obj.rectangle4);
    obj.layout640:setLeft(743);
    obj.layout640:setTop(1240);
    obj.layout640:setWidth(509);
    obj.layout640:setHeight(66);
    obj.layout640:setName("layout640");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout640);
    obj.textEditor18:setTransparent(true);
    obj.textEditor18:setFontSize(23);
    obj.textEditor18:setFontColor("#000000");
    obj.textEditor18:setLeft(0);
    obj.textEditor18:setTop(0);
    obj.textEditor18:setWidth(509);
    obj.textEditor18:setHeight(67);
    obj.textEditor18:setField("Deformidades_de_Impuro");
    obj.textEditor18:setName("textEditor18");

    obj.layout641 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout641:setParent(obj.rectangle4);
    obj.layout641:setLeft(199);
    obj.layout641:setTop(1272);
    obj.layout641:setWidth(123);
    obj.layout641:setHeight(33);
    obj.layout641:setName("layout641");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout641);
    obj.edit189:setTransparent(true);
    obj.edit189:setFontSize(22.6);
    obj.edit189:setFontColor("#000000");
    obj.edit189:setHorzTextAlign("leading");
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(0);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(123);
    obj.edit189:setHeight(34);
    obj.edit189:setField("Lupino");
    obj.edit189:setName("edit189");

    obj.layout642 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout642:setParent(obj.rectangle4);
    obj.layout642:setLeft(340);
    obj.layout642:setTop(1272);
    obj.layout642:setWidth(82);
    obj.layout642:setHeight(33);
    obj.layout642:setName("layout642");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout642);
    obj.edit190:setTransparent(true);
    obj.edit190:setFontSize(22.6);
    obj.edit190:setFontColor("#000000");
    obj.edit190:setHorzTextAlign("leading");
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(0);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(82);
    obj.edit190:setHeight(34);
    obj.edit190:setField("undefined_12");
    obj.edit190:setName("edit190");

    obj.layout643 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout643:setParent(obj.rectangle4);
    obj.layout643:setLeft(104);
    obj.layout643:setTop(1430.4);
    obj.layout643:setWidth(574);
    obj.layout643:setHeight(405.6);
    obj.layout643:setName("layout643");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout643);
    obj.textEditor19:setLeft(0);
    obj.textEditor19:setTop(0);
    obj.textEditor19:setWidth(574);
    obj.textEditor19:setHeight(405.6);
    obj.textEditor19:setFontSize(23);
    obj.textEditor19:setFontColor("#000000");
    obj.textEditor19:setField("Relações_da_matilha");
    obj.textEditor19:setTransparent(true);
    obj.textEditor19:setName("textEditor19");

    obj.layout644 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout644:setParent(obj.rectangle4);
    obj.layout644:setLeft(695);
    obj.layout644:setTop(1430.4);
    obj.layout644:setWidth(557);
    obj.layout644:setHeight(405.6);
    obj.layout644:setName("layout644");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout644);
    obj.image5:setField("imagemDoPersonagem");
    obj.image5:setEditable(true);
    obj.image5:setStyle("proportional");
    obj.image5:setAlign("client");
    obj.image5:setName("image5");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local dado = sheet.arma1_2
            						local nome = sheet.arma1_1
            						local dano = sheet.arma1_3
            						local alcance = sheet.arma1_4
            						local cad = sheet.arma1_5
            						local pen = sheet.arma1_6
            
            			            local str = dado; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Dano: " .. dano .. " - Alcance: " .. alcance .. " - Cadência: " .. cad .. " - Pente: " .. pen);
                                   end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local dado = sheet.arma2_2
            						local nome = sheet.arma2_1
            						local dano = sheet.arma2_3
            						local alcance = sheet.arma2_4
            						local cad = sheet.arma2_5
            						local pen = sheet.arma2_6
            
            			            local str = dado; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Dano: " .. dano .. " - Alcance: " .. alcance .. " - Cadência: " .. cad .. " - Pente: " .. pen);
                                   end;
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local dado = sheet.arma4_2
            						local nome = sheet.arma4_1
            						local dano = sheet.arma4_3
            						local alcance = sheet.arma4_4
            						local cad = sheet.arma4_5
            						local pen = sheet.arma4_6
            
            			            local str = dado; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Dano: " .. dano .. " - Alcance: " .. alcance .. " - Cadência: " .. cad .. " - Pente: " .. pen);
                                   end;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            local dado = sheet.arma3_2
            						local nome = sheet.arma3_1
            						local dano = sheet.arma3_3
            						local alcance = sheet.arma3_4
            						local cad = sheet.arma3_5
            						local pen = sheet.arma3_6
            
            			            local str = dado; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Dano: " .. dano .. " - Alcance: " .. alcance .. " - Cadência: " .. cad .. " - Pente: " .. pen);
                                   end;
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            local dado = sheet.arma6_2
            						local nome = sheet.arma6_1
            						local dano = sheet.arma6_3
            						local alcance = sheet.arma6_4
            						local cad = sheet.arma6_5
            						local pen = sheet.arma6_6
            
            			            local str = dado; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Dano: " .. dano .. " - Alcance: " .. alcance .. " - Cadência: " .. cad .. " - Pente: " .. pen);
                                   end;
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            local dado = sheet.arma5_2
            						local nome = sheet.arma5_1
            						local dano = sheet.arma5_3
            						local alcance = sheet.arma5_4
            						local cad = sheet.arma5_5
            						local pen = sheet.arma5_6
            
            			            local str = dado; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Dano: " .. dano .. " - Alcance: " .. alcance .. " - Cadência: " .. cad .. " - Pente: " .. pen);
                                   end;
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            local dado = sheet.arma7_2
            						local nome = sheet.arma7_1
            						local dano = sheet.arma7_3
            						local alcance = sheet.arma7_4
            						local cad = sheet.arma7_5
            						local pen = sheet.arma7_6
            
            			            local str = dado; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Dano: " .. dano .. " - Alcance: " .. alcance .. " - Cadência: " .. cad .. " - Pente: " .. pen);
                                   end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.layout304 ~= nil then self.layout304:destroy(); self.layout304 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.layout386 ~= nil then self.layout386:destroy(); self.layout386 = nil; end;
        if self.imageCheckBox296 ~= nil then self.imageCheckBox296:destroy(); self.imageCheckBox296 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout266 ~= nil then self.layout266:destroy(); self.layout266 = nil; end;
        if self.layout452 ~= nil then self.layout452:destroy(); self.layout452 = nil; end;
        if self.layout275 ~= nil then self.layout275:destroy(); self.layout275 = nil; end;
        if self.layout533 ~= nil then self.layout533:destroy(); self.layout533 = nil; end;
        if self.frma3_svg ~= nil then self.frma3_svg:destroy(); self.frma3_svg = nil; end;
        if self.layout612 ~= nil then self.layout612:destroy(); self.layout612 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.imageCheckBox58 ~= nil then self.imageCheckBox58:destroy(); self.imageCheckBox58 = nil; end;
        if self.layout391 ~= nil then self.layout391:destroy(); self.layout391 = nil; end;
        if self.layout557 ~= nil then self.layout557:destroy(); self.layout557 = nil; end;
        if self.layout457 ~= nil then self.layout457:destroy(); self.layout457 = nil; end;
        if self.layout257 ~= nil then self.layout257:destroy(); self.layout257 = nil; end;
        if self.layout438 ~= nil then self.layout438:destroy(); self.layout438 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout572 ~= nil then self.layout572:destroy(); self.layout572 = nil; end;
        if self.layout644 ~= nil then self.layout644:destroy(); self.layout644 = nil; end;
        if self.imageCheckBox115 ~= nil then self.imageCheckBox115:destroy(); self.imageCheckBox115 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.layout290 ~= nil then self.layout290:destroy(); self.layout290 = nil; end;
        if self.layout445 ~= nil then self.layout445:destroy(); self.layout445 = nil; end;
        if self.imageCheckBox67 ~= nil then self.imageCheckBox67:destroy(); self.imageCheckBox67 = nil; end;
        if self.layout326 ~= nil then self.layout326:destroy(); self.layout326 = nil; end;
        if self.layout285 ~= nil then self.layout285:destroy(); self.layout285 = nil; end;
        if self.layout247 ~= nil then self.layout247:destroy(); self.layout247 = nil; end;
        if self.layout494 ~= nil then self.layout494:destroy(); self.layout494 = nil; end;
        if self.imageCheckBox210 ~= nil then self.imageCheckBox210:destroy(); self.imageCheckBox210 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout249 ~= nil then self.layout249:destroy(); self.layout249 = nil; end;
        if self.imageCheckBox289 ~= nil then self.imageCheckBox289:destroy(); self.imageCheckBox289 = nil; end;
        if self.layout536 ~= nil then self.layout536:destroy(); self.layout536 = nil; end;
        if self.layout417 ~= nil then self.layout417:destroy(); self.layout417 = nil; end;
        if self.imageCheckBox304 ~= nil then self.imageCheckBox304:destroy(); self.imageCheckBox304 = nil; end;
        if self.imageCheckBox190 ~= nil then self.imageCheckBox190:destroy(); self.imageCheckBox190 = nil; end;
        if self.imageCheckBox271 ~= nil then self.imageCheckBox271:destroy(); self.imageCheckBox271 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.imageCheckBox176 ~= nil then self.imageCheckBox176:destroy(); self.imageCheckBox176 = nil; end;
        if self.layout223 ~= nil then self.layout223:destroy(); self.layout223 = nil; end;
        if self.layout236 ~= nil then self.layout236:destroy(); self.layout236 = nil; end;
        if self.layout251 ~= nil then self.layout251:destroy(); self.layout251 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.imageCheckBox181 ~= nil then self.imageCheckBox181:destroy(); self.imageCheckBox181 = nil; end;
        if self.imageCheckBox174 ~= nil then self.imageCheckBox174:destroy(); self.imageCheckBox174 = nil; end;
        if self.layout365 ~= nil then self.layout365:destroy(); self.layout365 = nil; end;
        if self.imageCheckBox129 ~= nil then self.imageCheckBox129:destroy(); self.imageCheckBox129 = nil; end;
        if self.layout433 ~= nil then self.layout433:destroy(); self.layout433 = nil; end;
        if self.imageCheckBox316 ~= nil then self.imageCheckBox316:destroy(); self.imageCheckBox316 = nil; end;
        if self.imageCheckBox99 ~= nil then self.imageCheckBox99:destroy(); self.imageCheckBox99 = nil; end;
        if self.imageCheckBox133 ~= nil then self.imageCheckBox133:destroy(); self.imageCheckBox133 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.layout407 ~= nil then self.layout407:destroy(); self.layout407 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout449 ~= nil then self.layout449:destroy(); self.layout449 = nil; end;
        if self.imageCheckBox141 ~= nil then self.imageCheckBox141:destroy(); self.imageCheckBox141 = nil; end;
        if self.layout552 ~= nil then self.layout552:destroy(); self.layout552 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.imageCheckBox191 ~= nil then self.imageCheckBox191:destroy(); self.imageCheckBox191 = nil; end;
        if self.imageCheckBox145 ~= nil then self.imageCheckBox145:destroy(); self.imageCheckBox145 = nil; end;
        if self.layout411 ~= nil then self.layout411:destroy(); self.layout411 = nil; end;
        if self.layout434 ~= nil then self.layout434:destroy(); self.layout434 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.layout502 ~= nil then self.layout502:destroy(); self.layout502 = nil; end;
        if self.layout316 ~= nil then self.layout316:destroy(); self.layout316 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.imageCheckBox79 ~= nil then self.imageCheckBox79:destroy(); self.imageCheckBox79 = nil; end;
        if self.layout312 ~= nil then self.layout312:destroy(); self.layout312 = nil; end;
        if self.layout401 ~= nil then self.layout401:destroy(); self.layout401 = nil; end;
        if self.imageCheckBox150 ~= nil then self.imageCheckBox150:destroy(); self.imageCheckBox150 = nil; end;
        if self.imageCheckBox136 ~= nil then self.imageCheckBox136:destroy(); self.imageCheckBox136 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.imageCheckBox78 ~= nil then self.imageCheckBox78:destroy(); self.imageCheckBox78 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.imageCheckBox336 ~= nil then self.imageCheckBox336:destroy(); self.imageCheckBox336 = nil; end;
        if self.imageCheckBox103 ~= nil then self.imageCheckBox103:destroy(); self.imageCheckBox103 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.imageCheckBox214 ~= nil then self.imageCheckBox214:destroy(); self.imageCheckBox214 = nil; end;
        if self.imageCheckBox241 ~= nil then self.imageCheckBox241:destroy(); self.imageCheckBox241 = nil; end;
        if self.layout534 ~= nil then self.layout534:destroy(); self.layout534 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.layout509 ~= nil then self.layout509:destroy(); self.layout509 = nil; end;
        if self.imageCheckBox346 ~= nil then self.imageCheckBox346:destroy(); self.imageCheckBox346 = nil; end;
        if self.layout478 ~= nil then self.layout478:destroy(); self.layout478 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.imageCheckBox131 ~= nil then self.imageCheckBox131:destroy(); self.imageCheckBox131 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.layout413 ~= nil then self.layout413:destroy(); self.layout413 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.layout248 ~= nil then self.layout248:destroy(); self.layout248 = nil; end;
        if self.layout341 ~= nil then self.layout341:destroy(); self.layout341 = nil; end;
        if self.layout259 ~= nil then self.layout259:destroy(); self.layout259 = nil; end;
        if self.layout392 ~= nil then self.layout392:destroy(); self.layout392 = nil; end;
        if self.layout513 ~= nil then self.layout513:destroy(); self.layout513 = nil; end;
        if self.imageCheckBox326 ~= nil then self.imageCheckBox326:destroy(); self.imageCheckBox326 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.layout362 ~= nil then self.layout362:destroy(); self.layout362 = nil; end;
        if self.imageCheckBox159 ~= nil then self.imageCheckBox159:destroy(); self.imageCheckBox159 = nil; end;
        if self.layout325 ~= nil then self.layout325:destroy(); self.layout325 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout578 ~= nil then self.layout578:destroy(); self.layout578 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout246 ~= nil then self.layout246:destroy(); self.layout246 = nil; end;
        if self.imageCheckBox285 ~= nil then self.imageCheckBox285:destroy(); self.imageCheckBox285 = nil; end;
        if self.layout549 ~= nil then self.layout549:destroy(); self.layout549 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.imageCheckBox350 ~= nil then self.imageCheckBox350:destroy(); self.imageCheckBox350 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.imageCheckBox117 ~= nil then self.imageCheckBox117:destroy(); self.imageCheckBox117 = nil; end;
        if self.layout636 ~= nil then self.layout636:destroy(); self.layout636 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.layout229 ~= nil then self.layout229:destroy(); self.layout229 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.layout461 ~= nil then self.layout461:destroy(); self.layout461 = nil; end;
        if self.layout361 ~= nil then self.layout361:destroy(); self.layout361 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.imageCheckBox194 ~= nil then self.imageCheckBox194:destroy(); self.imageCheckBox194 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout523 ~= nil then self.layout523:destroy(); self.layout523 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.imageCheckBox343 ~= nil then self.imageCheckBox343:destroy(); self.imageCheckBox343 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.imageCheckBox155 ~= nil then self.imageCheckBox155:destroy(); self.imageCheckBox155 = nil; end;
        if self.layout225 ~= nil then self.layout225:destroy(); self.layout225 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.layout524 ~= nil then self.layout524:destroy(); self.layout524 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.layout260 ~= nil then self.layout260:destroy(); self.layout260 = nil; end;
        if self.layout270 ~= nil then self.layout270:destroy(); self.layout270 = nil; end;
        if self.imageCheckBox59 ~= nil then self.imageCheckBox59:destroy(); self.imageCheckBox59 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.imageCheckBox90 ~= nil then self.imageCheckBox90:destroy(); self.imageCheckBox90 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.layout241 ~= nil then self.layout241:destroy(); self.layout241 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout254 ~= nil then self.layout254:destroy(); self.layout254 = nil; end;
        if self.imageCheckBox182 ~= nil then self.imageCheckBox182:destroy(); self.imageCheckBox182 = nil; end;
        if self.imageCheckBox318 ~= nil then self.imageCheckBox318:destroy(); self.imageCheckBox318 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.imageCheckBox93 ~= nil then self.imageCheckBox93:destroy(); self.imageCheckBox93 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.layout493 ~= nil then self.layout493:destroy(); self.layout493 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout582 ~= nil then self.layout582:destroy(); self.layout582 = nil; end;
        if self.layout634 ~= nil then self.layout634:destroy(); self.layout634 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.layout244 ~= nil then self.layout244:destroy(); self.layout244 = nil; end;
        if self.imageCheckBox219 ~= nil then self.imageCheckBox219:destroy(); self.imageCheckBox219 = nil; end;
        if self.layout491 ~= nil then self.layout491:destroy(); self.layout491 = nil; end;
        if self.layout495 ~= nil then self.layout495:destroy(); self.layout495 = nil; end;
        if self.layout501 ~= nil then self.layout501:destroy(); self.layout501 = nil; end;
        if self.layout279 ~= nil then self.layout279:destroy(); self.layout279 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout363 ~= nil then self.layout363:destroy(); self.layout363 = nil; end;
        if self.imageCheckBox246 ~= nil then self.imageCheckBox246:destroy(); self.imageCheckBox246 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.imageCheckBox340 ~= nil then self.imageCheckBox340:destroy(); self.imageCheckBox340 = nil; end;
        if self.layout315 ~= nil then self.layout315:destroy(); self.layout315 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout420 ~= nil then self.layout420:destroy(); self.layout420 = nil; end;
        if self.imageCheckBox260 ~= nil then self.imageCheckBox260:destroy(); self.imageCheckBox260 = nil; end;
        if self.layout466 ~= nil then self.layout466:destroy(); self.layout466 = nil; end;
        if self.layout382 ~= nil then self.layout382:destroy(); self.layout382 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.imageCheckBox173 ~= nil then self.imageCheckBox173:destroy(); self.imageCheckBox173 = nil; end;
        if self.imageCheckBox309 ~= nil then self.imageCheckBox309:destroy(); self.imageCheckBox309 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.imageCheckBox128 ~= nil then self.imageCheckBox128:destroy(); self.imageCheckBox128 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.imageCheckBox205 ~= nil then self.imageCheckBox205:destroy(); self.imageCheckBox205 = nil; end;
        if self.layout296 ~= nil then self.layout296:destroy(); self.layout296 = nil; end;
        if self.layout320 ~= nil then self.layout320:destroy(); self.layout320 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.imageCheckBox315 ~= nil then self.imageCheckBox315:destroy(); self.imageCheckBox315 = nil; end;
        if self.imageCheckBox333 ~= nil then self.imageCheckBox333:destroy(); self.imageCheckBox333 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.imageCheckBox107 ~= nil then self.imageCheckBox107:destroy(); self.imageCheckBox107 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.imageCheckBox298 ~= nil then self.imageCheckBox298:destroy(); self.imageCheckBox298 = nil; end;
        if self.layout558 ~= nil then self.layout558:destroy(); self.layout558 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.layout370 ~= nil then self.layout370:destroy(); self.layout370 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.layout470 ~= nil then self.layout470:destroy(); self.layout470 = nil; end;
        if self.layout335 ~= nil then self.layout335:destroy(); self.layout335 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.imageCheckBox62 ~= nil then self.imageCheckBox62:destroy(); self.imageCheckBox62 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox325 ~= nil then self.imageCheckBox325:destroy(); self.imageCheckBox325 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout447 ~= nil then self.layout447:destroy(); self.layout447 = nil; end;
        if self.layout603 ~= nil then self.layout603:destroy(); self.layout603 = nil; end;
        if self.imageCheckBox94 ~= nil then self.imageCheckBox94:destroy(); self.imageCheckBox94 = nil; end;
        if self.layout267 ~= nil then self.layout267:destroy(); self.layout267 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.imageCheckBox110 ~= nil then self.imageCheckBox110:destroy(); self.imageCheckBox110 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.layout605 ~= nil then self.layout605:destroy(); self.layout605 = nil; end;
        if self.layout492 ~= nil then self.layout492:destroy(); self.layout492 = nil; end;
        if self.layout576 ~= nil then self.layout576:destroy(); self.layout576 = nil; end;
        if self.imageCheckBox313 ~= nil then self.imageCheckBox313:destroy(); self.imageCheckBox313 = nil; end;
        if self.layout464 ~= nil then self.layout464:destroy(); self.layout464 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout329 ~= nil then self.layout329:destroy(); self.layout329 = nil; end;
        if self.imageCheckBox339 ~= nil then self.imageCheckBox339:destroy(); self.imageCheckBox339 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.imageCheckBox305 ~= nil then self.imageCheckBox305:destroy(); self.imageCheckBox305 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.imageCheckBox231 ~= nil then self.imageCheckBox231:destroy(); self.imageCheckBox231 = nil; end;
        if self.layout594 ~= nil then self.layout594:destroy(); self.layout594 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.imageCheckBox247 ~= nil then self.imageCheckBox247:destroy(); self.imageCheckBox247 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.layout347 ~= nil then self.layout347:destroy(); self.layout347 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout309 ~= nil then self.layout309:destroy(); self.layout309 = nil; end;
        if self.imageCheckBox125 ~= nil then self.imageCheckBox125:destroy(); self.imageCheckBox125 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.layout525 ~= nil then self.layout525:destroy(); self.layout525 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.imageCheckBox87 ~= nil then self.imageCheckBox87:destroy(); self.imageCheckBox87 = nil; end;
        if self.layout643 ~= nil then self.layout643:destroy(); self.layout643 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout506 ~= nil then self.layout506:destroy(); self.layout506 = nil; end;
        if self.layout303 ~= nil then self.layout303:destroy(); self.layout303 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.layout302 ~= nil then self.layout302:destroy(); self.layout302 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout376 ~= nil then self.layout376:destroy(); self.layout376 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout448 ~= nil then self.layout448:destroy(); self.layout448 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout551 ~= nil then self.layout551:destroy(); self.layout551 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.layout580 ~= nil then self.layout580:destroy(); self.layout580 = nil; end;
        if self.layout373 ~= nil then self.layout373:destroy(); self.layout373 = nil; end;
        if self.imageCheckBox322 ~= nil then self.imageCheckBox322:destroy(); self.imageCheckBox322 = nil; end;
        if self.layout611 ~= nil then self.layout611:destroy(); self.layout611 = nil; end;
        if self.layout584 ~= nil then self.layout584:destroy(); self.layout584 = nil; end;
        if self.imageCheckBox262 ~= nil then self.imageCheckBox262:destroy(); self.imageCheckBox262 = nil; end;
        if self.layout548 ~= nil then self.layout548:destroy(); self.layout548 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.imageCheckBox172 ~= nil then self.imageCheckBox172:destroy(); self.imageCheckBox172 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout481 ~= nil then self.layout481:destroy(); self.layout481 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.imageCheckBox127 ~= nil then self.imageCheckBox127:destroy(); self.imageCheckBox127 = nil; end;
        if self.layout519 ~= nil then self.layout519:destroy(); self.layout519 = nil; end;
        if self.imageCheckBox118 ~= nil then self.imageCheckBox118:destroy(); self.imageCheckBox118 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.imageCheckBox86 ~= nil then self.imageCheckBox86:destroy(); self.imageCheckBox86 = nil; end;
        if self.imageCheckBox294 ~= nil then self.imageCheckBox294:destroy(); self.imageCheckBox294 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.imageCheckBox179 ~= nil then self.imageCheckBox179:destroy(); self.imageCheckBox179 = nil; end;
        if self.imageCheckBox235 ~= nil then self.imageCheckBox235:destroy(); self.imageCheckBox235 = nil; end;
        if self.layout616 ~= nil then self.layout616:destroy(); self.layout616 = nil; end;
        if self.layout562 ~= nil then self.layout562:destroy(); self.layout562 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout579 ~= nil then self.layout579:destroy(); self.layout579 = nil; end;
        if self.imageCheckBox250 ~= nil then self.imageCheckBox250:destroy(); self.imageCheckBox250 = nil; end;
        if self.layout408 ~= nil then self.layout408:destroy(); self.layout408 = nil; end;
        if self.layout263 ~= nil then self.layout263:destroy(); self.layout263 = nil; end;
        if self.layout471 ~= nil then self.layout471:destroy(); self.layout471 = nil; end;
        if self.imageCheckBox65 ~= nil then self.imageCheckBox65:destroy(); self.imageCheckBox65 = nil; end;
        if self.imageCheckBox211 ~= nil then self.imageCheckBox211:destroy(); self.imageCheckBox211 = nil; end;
        if self.imageCheckBox73 ~= nil then self.imageCheckBox73:destroy(); self.imageCheckBox73 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.imageCheckBox268 ~= nil then self.imageCheckBox268:destroy(); self.imageCheckBox268 = nil; end;
        if self.layout295 ~= nil then self.layout295:destroy(); self.layout295 = nil; end;
        if self.layout623 ~= nil then self.layout623:destroy(); self.layout623 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.layout588 ~= nil then self.layout588:destroy(); self.layout588 = nil; end;
        if self.imageCheckBox105 ~= nil then self.imageCheckBox105:destroy(); self.imageCheckBox105 = nil; end;
        if self.layout571 ~= nil then self.layout571:destroy(); self.layout571 = nil; end;
        if self.layout577 ~= nil then self.layout577:destroy(); self.layout577 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout426 ~= nil then self.layout426:destroy(); self.layout426 = nil; end;
        if self.imageCheckBox237 ~= nil then self.imageCheckBox237:destroy(); self.imageCheckBox237 = nil; end;
        if self.layout602 ~= nil then self.layout602:destroy(); self.layout602 = nil; end;
        if self.layout619 ~= nil then self.layout619:destroy(); self.layout619 = nil; end;
        if self.imageCheckBox347 ~= nil then self.imageCheckBox347:destroy(); self.imageCheckBox347 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout374 ~= nil then self.layout374:destroy(); self.layout374 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.layout245 ~= nil then self.layout245:destroy(); self.layout245 = nil; end;
        if self.imageCheckBox291 ~= nil then self.imageCheckBox291:destroy(); self.imageCheckBox291 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout333 ~= nil then self.layout333:destroy(); self.layout333 = nil; end;
        if self.layout599 ~= nil then self.layout599:destroy(); self.layout599 = nil; end;
        if self.imageCheckBox328 ~= nil then self.imageCheckBox328:destroy(); self.imageCheckBox328 = nil; end;
        if self.layout613 ~= nil then self.layout613:destroy(); self.layout613 = nil; end;
        if self.layout330 ~= nil then self.layout330:destroy(); self.layout330 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.imageCheckBox295 ~= nil then self.imageCheckBox295:destroy(); self.imageCheckBox295 = nil; end;
        if self.imageCheckBox45 ~= nil then self.imageCheckBox45:destroy(); self.imageCheckBox45 = nil; end;
        if self.layout507 ~= nil then self.layout507:destroy(); self.layout507 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.layout459 ~= nil then self.layout459:destroy(); self.layout459 = nil; end;
        if self.layout467 ~= nil then self.layout467:destroy(); self.layout467 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.imageCheckBox332 ~= nil then self.imageCheckBox332:destroy(); self.imageCheckBox332 = nil; end;
        if self.layout489 ~= nil then self.layout489:destroy(); self.layout489 = nil; end;
        if self.imageCheckBox153 ~= nil then self.imageCheckBox153:destroy(); self.imageCheckBox153 = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.layout479 ~= nil then self.layout479:destroy(); self.layout479 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.imageCheckBox244 ~= nil then self.imageCheckBox244:destroy(); self.imageCheckBox244 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout243 ~= nil then self.layout243:destroy(); self.layout243 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.imageCheckBox198 ~= nil then self.imageCheckBox198:destroy(); self.imageCheckBox198 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout621 ~= nil then self.layout621:destroy(); self.layout621 = nil; end;
        if self.imageCheckBox199 ~= nil then self.imageCheckBox199:destroy(); self.imageCheckBox199 = nil; end;
        if self.imageCheckBox101 ~= nil then self.imageCheckBox101:destroy(); self.imageCheckBox101 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.layout595 ~= nil then self.layout595:destroy(); self.layout595 = nil; end;
        if self.imageCheckBox258 ~= nil then self.imageCheckBox258:destroy(); self.imageCheckBox258 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout339 ~= nil then self.layout339:destroy(); self.layout339 = nil; end;
        if self.layout366 ~= nil then self.layout366:destroy(); self.layout366 = nil; end;
        if self.layout271 ~= nil then self.layout271:destroy(); self.layout271 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.imageCheckBox130 ~= nil then self.imageCheckBox130:destroy(); self.imageCheckBox130 = nil; end;
        if self.layout553 ~= nil then self.layout553:destroy(); self.layout553 = nil; end;
        if self.layout620 ~= nil then self.layout620:destroy(); self.layout620 = nil; end;
        if self.layout253 ~= nil then self.layout253:destroy(); self.layout253 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout410 ~= nil then self.layout410:destroy(); self.layout410 = nil; end;
        if self.imageCheckBox229 ~= nil then self.imageCheckBox229:destroy(); self.imageCheckBox229 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.imageCheckBox54 ~= nil then self.imageCheckBox54:destroy(); self.imageCheckBox54 = nil; end;
        if self.layout474 ~= nil then self.layout474:destroy(); self.layout474 = nil; end;
        if self.layout292 ~= nil then self.layout292:destroy(); self.layout292 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.imageCheckBox293 ~= nil then self.imageCheckBox293:destroy(); self.imageCheckBox293 = nil; end;
        if self.imageCheckBox81 ~= nil then self.imageCheckBox81:destroy(); self.imageCheckBox81 = nil; end;
        if self.layout487 ~= nil then self.layout487:destroy(); self.layout487 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.layout535 ~= nil then self.layout535:destroy(); self.layout535 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.layout497 ~= nil then self.layout497:destroy(); self.layout497 = nil; end;
        if self.imageCheckBox335 ~= nil then self.imageCheckBox335:destroy(); self.imageCheckBox335 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.imageCheckBox123 ~= nil then self.imageCheckBox123:destroy(); self.imageCheckBox123 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout568 ~= nil then self.layout568:destroy(); self.layout568 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.layout306 ~= nil then self.layout306:destroy(); self.layout306 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.imageCheckBox184 ~= nil then self.imageCheckBox184:destroy(); self.imageCheckBox184 = nil; end;
        if self.layout541 ~= nil then self.layout541:destroy(); self.layout541 = nil; end;
        if self.layout429 ~= nil then self.layout429:destroy(); self.layout429 = nil; end;
        if self.layout451 ~= nil then self.layout451:destroy(); self.layout451 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.imageCheckBox134 ~= nil then self.imageCheckBox134:destroy(); self.imageCheckBox134 = nil; end;
        if self.layout234 ~= nil then self.layout234:destroy(); self.layout234 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.imageCheckBox280 ~= nil then self.imageCheckBox280:destroy(); self.imageCheckBox280 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.layout635 ~= nil then self.layout635:destroy(); self.layout635 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout412 ~= nil then self.layout412:destroy(); self.layout412 = nil; end;
        if self.layout468 ~= nil then self.layout468:destroy(); self.layout468 = nil; end;
        if self.layout238 ~= nil then self.layout238:destroy(); self.layout238 = nil; end;
        if self.imageCheckBox95 ~= nil then self.imageCheckBox95:destroy(); self.imageCheckBox95 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.imageCheckBox279 ~= nil then self.imageCheckBox279:destroy(); self.imageCheckBox279 = nil; end;
        if self.imageCheckBox297 ~= nil then self.imageCheckBox297:destroy(); self.imageCheckBox297 = nil; end;
        if self.imageCheckBox135 ~= nil then self.imageCheckBox135:destroy(); self.imageCheckBox135 = nil; end;
        if self.imageCheckBox206 ~= nil then self.imageCheckBox206:destroy(); self.imageCheckBox206 = nil; end;
        if self.imageCheckBox120 ~= nil then self.imageCheckBox120:destroy(); self.imageCheckBox120 = nil; end;
        if self.imageCheckBox162 ~= nil then self.imageCheckBox162:destroy(); self.imageCheckBox162 = nil; end;
        if self.layout328 ~= nil then self.layout328:destroy(); self.layout328 = nil; end;
        if self.imageCheckBox286 ~= nil then self.imageCheckBox286:destroy(); self.imageCheckBox286 = nil; end;
        if self.layout348 ~= nil then self.layout348:destroy(); self.layout348 = nil; end;
        if self.layout403 ~= nil then self.layout403:destroy(); self.layout403 = nil; end;
        if self.imageCheckBox338 ~= nil then self.imageCheckBox338:destroy(); self.imageCheckBox338 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.layout400 ~= nil then self.layout400:destroy(); self.layout400 = nil; end;
        if self.layout538 ~= nil then self.layout538:destroy(); self.layout538 = nil; end;
        if self.layout604 ~= nil then self.layout604:destroy(); self.layout604 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.frma4_svg ~= nil then self.frma4_svg:destroy(); self.frma4_svg = nil; end;
        if self.imageCheckBox102 ~= nil then self.imageCheckBox102:destroy(); self.imageCheckBox102 = nil; end;
        if self.layout337 ~= nil then self.layout337:destroy(); self.layout337 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout282 ~= nil then self.layout282:destroy(); self.layout282 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.imageCheckBox163 ~= nil then self.imageCheckBox163:destroy(); self.imageCheckBox163 = nil; end;
        if self.imageCheckBox109 ~= nil then self.imageCheckBox109:destroy(); self.imageCheckBox109 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.imageCheckBox272 ~= nil then self.imageCheckBox272:destroy(); self.imageCheckBox272 = nil; end;
        if self.imageCheckBox323 ~= nil then self.imageCheckBox323:destroy(); self.imageCheckBox323 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.imageCheckBox35 ~= nil then self.imageCheckBox35:destroy(); self.imageCheckBox35 = nil; end;
        if self.layout274 ~= nil then self.layout274:destroy(); self.layout274 = nil; end;
        if self.layout375 ~= nil then self.layout375:destroy(); self.layout375 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.imageCheckBox164 ~= nil then self.imageCheckBox164:destroy(); self.imageCheckBox164 = nil; end;
        if self.imageCheckBox303 ~= nil then self.imageCheckBox303:destroy(); self.imageCheckBox303 = nil; end;
        if self.layout435 ~= nil then self.layout435:destroy(); self.layout435 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout404 ~= nil then self.layout404:destroy(); self.layout404 = nil; end;
        if self.layout473 ~= nil then self.layout473:destroy(); self.layout473 = nil; end;
        if self.layout308 ~= nil then self.layout308:destroy(); self.layout308 = nil; end;
        if self.layout269 ~= nil then self.layout269:destroy(); self.layout269 = nil; end;
        if self.imageCheckBox114 ~= nil then self.imageCheckBox114:destroy(); self.imageCheckBox114 = nil; end;
        if self.layout515 ~= nil then self.layout515:destroy(); self.layout515 = nil; end;
        if self.imageCheckBox327 ~= nil then self.imageCheckBox327:destroy(); self.imageCheckBox327 = nil; end;
        if self.imageCheckBox329 ~= nil then self.imageCheckBox329:destroy(); self.imageCheckBox329 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.imageCheckBox342 ~= nil then self.imageCheckBox342:destroy(); self.imageCheckBox342 = nil; end;
        if self.layout499 ~= nil then self.layout499:destroy(); self.layout499 = nil; end;
        if self.imageCheckBox43 ~= nil then self.imageCheckBox43:destroy(); self.imageCheckBox43 = nil; end;
        if self.imageCheckBox202 ~= nil then self.imageCheckBox202:destroy(); self.imageCheckBox202 = nil; end;
        if self.layout574 ~= nil then self.layout574:destroy(); self.layout574 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.imageCheckBox226 ~= nil then self.imageCheckBox226:destroy(); self.imageCheckBox226 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.imageCheckBox348 ~= nil then self.imageCheckBox348:destroy(); self.imageCheckBox348 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.imageCheckBox276 ~= nil then self.imageCheckBox276:destroy(); self.imageCheckBox276 = nil; end;
        if self.layout321 ~= nil then self.layout321:destroy(); self.layout321 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.imageCheckBox75 ~= nil then self.imageCheckBox75:destroy(); self.imageCheckBox75 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.layout293 ~= nil then self.layout293:destroy(); self.layout293 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout356 ~= nil then self.layout356:destroy(); self.layout356 = nil; end;
        if self.imageCheckBox51 ~= nil then self.imageCheckBox51:destroy(); self.imageCheckBox51 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout498 ~= nil then self.layout498:destroy(); self.layout498 = nil; end;
        if self.imageCheckBox270 ~= nil then self.imageCheckBox270:destroy(); self.imageCheckBox270 = nil; end;
        if self.layout297 ~= nil then self.layout297:destroy(); self.layout297 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout510 ~= nil then self.layout510:destroy(); self.layout510 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout587 ~= nil then self.layout587:destroy(); self.layout587 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.imageCheckBox161 ~= nil then self.imageCheckBox161:destroy(); self.imageCheckBox161 = nil; end;
        if self.layout484 ~= nil then self.layout484:destroy(); self.layout484 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout431 ~= nil then self.layout431:destroy(); self.layout431 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.layout450 ~= nil then self.layout450:destroy(); self.layout450 = nil; end;
        if self.imageCheckBox281 ~= nil then self.imageCheckBox281:destroy(); self.imageCheckBox281 = nil; end;
        if self.layout441 ~= nil then self.layout441:destroy(); self.layout441 = nil; end;
        if self.imageCheckBox60 ~= nil then self.imageCheckBox60:destroy(); self.imageCheckBox60 = nil; end;
        if self.imageCheckBox52 ~= nil then self.imageCheckBox52:destroy(); self.imageCheckBox52 = nil; end;
        if self.imageCheckBox77 ~= nil then self.imageCheckBox77:destroy(); self.imageCheckBox77 = nil; end;
        if self.layout527 ~= nil then self.layout527:destroy(); self.layout527 = nil; end;
        if self.layout573 ~= nil then self.layout573:destroy(); self.layout573 = nil; end;
        if self.imageCheckBox201 ~= nil then self.imageCheckBox201:destroy(); self.imageCheckBox201 = nil; end;
        if self.imageCheckBox254 ~= nil then self.imageCheckBox254:destroy(); self.imageCheckBox254 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.imageCheckBox69 ~= nil then self.imageCheckBox69:destroy(); self.imageCheckBox69 = nil; end;
        if self.layout324 ~= nil then self.layout324:destroy(); self.layout324 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.imageCheckBox317 ~= nil then self.imageCheckBox317:destroy(); self.imageCheckBox317 = nil; end;
        if self.layout372 ~= nil then self.layout372:destroy(); self.layout372 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.imageCheckBox46 ~= nil then self.imageCheckBox46:destroy(); self.imageCheckBox46 = nil; end;
        if self.imageCheckBox209 ~= nil then self.imageCheckBox209:destroy(); self.imageCheckBox209 = nil; end;
        if self.imageCheckBox218 ~= nil then self.imageCheckBox218:destroy(); self.imageCheckBox218 = nil; end;
        if self.layout319 ~= nil then self.layout319:destroy(); self.layout319 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.imageCheckBox228 ~= nil then self.imageCheckBox228:destroy(); self.imageCheckBox228 = nil; end;
        if self.imageCheckBox178 ~= nil then self.imageCheckBox178:destroy(); self.imageCheckBox178 = nil; end;
        if self.imageCheckBox261 ~= nil then self.imageCheckBox261:destroy(); self.imageCheckBox261 = nil; end;
        if self.layout622 ~= nil then self.layout622:destroy(); self.layout622 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.imageCheckBox321 ~= nil then self.imageCheckBox321:destroy(); self.imageCheckBox321 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.imageCheckBox132 ~= nil then self.imageCheckBox132:destroy(); self.imageCheckBox132 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.layout532 ~= nil then self.layout532:destroy(); self.layout532 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.imageCheckBox147 ~= nil then self.imageCheckBox147:destroy(); self.imageCheckBox147 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout496 ~= nil then self.layout496:destroy(); self.layout496 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.layout355 ~= nil then self.layout355:destroy(); self.layout355 = nil; end;
        if self.layout639 ~= nil then self.layout639:destroy(); self.layout639 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.layout517 ~= nil then self.layout517:destroy(); self.layout517 = nil; end;
        if self.imageCheckBox299 ~= nil then self.imageCheckBox299:destroy(); self.imageCheckBox299 = nil; end;
        if self.imageCheckBox236 ~= nil then self.imageCheckBox236:destroy(); self.imageCheckBox236 = nil; end;
        if self.layout358 ~= nil then self.layout358:destroy(); self.layout358 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.imageCheckBox151 ~= nil then self.imageCheckBox151:destroy(); self.imageCheckBox151 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox49 ~= nil then self.imageCheckBox49:destroy(); self.imageCheckBox49 = nil; end;
        if self.imageCheckBox243 ~= nil then self.imageCheckBox243:destroy(); self.imageCheckBox243 = nil; end;
        if self.layout488 ~= nil then self.layout488:destroy(); self.layout488 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.layout626 ~= nil then self.layout626:destroy(); self.layout626 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.imageCheckBox140 ~= nil then self.imageCheckBox140:destroy(); self.imageCheckBox140 = nil; end;
        if self.imageCheckBox221 ~= nil then self.imageCheckBox221:destroy(); self.imageCheckBox221 = nil; end;
        if self.imageCheckBox216 ~= nil then self.imageCheckBox216:destroy(); self.imageCheckBox216 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout596 ~= nil then self.layout596:destroy(); self.layout596 = nil; end;
        if self.layout239 ~= nil then self.layout239:destroy(); self.layout239 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.imageCheckBox84 ~= nil then self.imageCheckBox84:destroy(); self.imageCheckBox84 = nil; end;
        if self.layout354 ~= nil then self.layout354:destroy(); self.layout354 = nil; end;
        if self.layout397 ~= nil then self.layout397:destroy(); self.layout397 = nil; end;
        if self.layout258 ~= nil then self.layout258:destroy(); self.layout258 = nil; end;
        if self.layout485 ~= nil then self.layout485:destroy(); self.layout485 = nil; end;
        if self.layout453 ~= nil then self.layout453:destroy(); self.layout453 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.layout332 ~= nil then self.layout332:destroy(); self.layout332 = nil; end;
        if self.layout381 ~= nil then self.layout381:destroy(); self.layout381 = nil; end;
        if self.imageCheckBox108 ~= nil then self.imageCheckBox108:destroy(); self.imageCheckBox108 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.imageCheckBox311 ~= nil then self.imageCheckBox311:destroy(); self.imageCheckBox311 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout353 ~= nil then self.layout353:destroy(); self.layout353 = nil; end;
        if self.imageCheckBox312 ~= nil then self.imageCheckBox312:destroy(); self.imageCheckBox312 = nil; end;
        if self.layout540 ~= nil then self.layout540:destroy(); self.layout540 = nil; end;
        if self.layout559 ~= nil then self.layout559:destroy(); self.layout559 = nil; end;
        if self.layout305 ~= nil then self.layout305:destroy(); self.layout305 = nil; end;
        if self.layout416 ~= nil then self.layout416:destroy(); self.layout416 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.layout379 ~= nil then self.layout379:destroy(); self.layout379 = nil; end;
        if self.layout432 ~= nil then self.layout432:destroy(); self.layout432 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.layout394 ~= nil then self.layout394:destroy(); self.layout394 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.imageCheckBox47 ~= nil then self.imageCheckBox47:destroy(); self.imageCheckBox47 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.imageCheckBox72 ~= nil then self.imageCheckBox72:destroy(); self.imageCheckBox72 = nil; end;
        if self.imageCheckBox230 ~= nil then self.imageCheckBox230:destroy(); self.imageCheckBox230 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.imageCheckBox183 ~= nil then self.imageCheckBox183:destroy(); self.imageCheckBox183 = nil; end;
        if self.imageCheckBox98 ~= nil then self.imageCheckBox98:destroy(); self.imageCheckBox98 = nil; end;
        if self.layout255 ~= nil then self.layout255:destroy(); self.layout255 = nil; end;
        if self.imageCheckBox310 ~= nil then self.imageCheckBox310:destroy(); self.imageCheckBox310 = nil; end;
        if self.layout437 ~= nil then self.layout437:destroy(); self.layout437 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout567 ~= nil then self.layout567:destroy(); self.layout567 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout322 ~= nil then self.layout322:destroy(); self.layout322 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.imageCheckBox227 ~= nil then self.imageCheckBox227:destroy(); self.imageCheckBox227 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.imageCheckBox287 ~= nil then self.imageCheckBox287:destroy(); self.imageCheckBox287 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.imageCheckBox200 ~= nil then self.imageCheckBox200:destroy(); self.imageCheckBox200 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.imageCheckBox175 ~= nil then self.imageCheckBox175:destroy(); self.imageCheckBox175 = nil; end;
        if self.imageCheckBox225 ~= nil then self.imageCheckBox225:destroy(); self.imageCheckBox225 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.imageCheckBox50 ~= nil then self.imageCheckBox50:destroy(); self.imageCheckBox50 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.imageCheckBox185 ~= nil then self.imageCheckBox185:destroy(); self.imageCheckBox185 = nil; end;
        if self.imageCheckBox148 ~= nil then self.imageCheckBox148:destroy(); self.imageCheckBox148 = nil; end;
        if self.layout396 ~= nil then self.layout396:destroy(); self.layout396 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.frmwta1_svg ~= nil then self.frmwta1_svg:destroy(); self.frmwta1_svg = nil; end;
        if self.layout614 ~= nil then self.layout614:destroy(); self.layout614 = nil; end;
        if self.layout503 ~= nil then self.layout503:destroy(); self.layout503 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.layout512 ~= nil then self.layout512:destroy(); self.layout512 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.imageCheckBox288 ~= nil then self.imageCheckBox288:destroy(); self.imageCheckBox288 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.imageCheckBox251 ~= nil then self.imageCheckBox251:destroy(); self.imageCheckBox251 = nil; end;
        if self.layout476 ~= nil then self.layout476:destroy(); self.layout476 = nil; end;
        if self.layout542 ~= nil then self.layout542:destroy(); self.layout542 = nil; end;
        if self.layout628 ~= nil then self.layout628:destroy(); self.layout628 = nil; end;
        if self.layout640 ~= nil then self.layout640:destroy(); self.layout640 = nil; end;
        if self.layout289 ~= nil then self.layout289:destroy(); self.layout289 = nil; end;
        if self.layout589 ~= nil then self.layout589:destroy(); self.layout589 = nil; end;
        if self.imageCheckBox126 ~= nil then self.imageCheckBox126:destroy(); self.imageCheckBox126 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout455 ~= nil then self.layout455:destroy(); self.layout455 = nil; end;
        if self.imageCheckBox345 ~= nil then self.imageCheckBox345:destroy(); self.imageCheckBox345 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.layout569 ~= nil then self.layout569:destroy(); self.layout569 = nil; end;
        if self.imageCheckBox166 ~= nil then self.imageCheckBox166:destroy(); self.imageCheckBox166 = nil; end;
        if self.layout369 ~= nil then self.layout369:destroy(); self.layout369 = nil; end;
        if self.layout283 ~= nil then self.layout283:destroy(); self.layout283 = nil; end;
        if self.layout385 ~= nil then self.layout385:destroy(); self.layout385 = nil; end;
        if self.imageCheckBox196 ~= nil then self.imageCheckBox196:destroy(); self.imageCheckBox196 = nil; end;
        if self.imageCheckBox337 ~= nil then self.imageCheckBox337:destroy(); self.imageCheckBox337 = nil; end;
        if self.layout276 ~= nil then self.layout276:destroy(); self.layout276 = nil; end;
        if self.imageCheckBox248 ~= nil then self.imageCheckBox248:destroy(); self.imageCheckBox248 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox168 ~= nil then self.imageCheckBox168:destroy(); self.imageCheckBox168 = nil; end;
        if self.imageCheckBox290 ~= nil then self.imageCheckBox290:destroy(); self.imageCheckBox290 = nil; end;
        if self.layout424 ~= nil then self.layout424:destroy(); self.layout424 = nil; end;
        if self.imageCheckBox63 ~= nil then self.imageCheckBox63:destroy(); self.imageCheckBox63 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout477 ~= nil then self.layout477:destroy(); self.layout477 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.layout630 ~= nil then self.layout630:destroy(); self.layout630 = nil; end;
        if self.layout311 ~= nil then self.layout311:destroy(); self.layout311 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout546 ~= nil then self.layout546:destroy(); self.layout546 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.layout556 ~= nil then self.layout556:destroy(); self.layout556 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.layout345 ~= nil then self.layout345:destroy(); self.layout345 = nil; end;
        if self.layout232 ~= nil then self.layout232:destroy(); self.layout232 = nil; end;
        if self.layout526 ~= nil then self.layout526:destroy(); self.layout526 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.imageCheckBox349 ~= nil then self.imageCheckBox349:destroy(); self.imageCheckBox349 = nil; end;
        if self.layout586 ~= nil then self.layout586:destroy(); self.layout586 = nil; end;
        if self.frma2_svg ~= nil then self.frma2_svg:destroy(); self.frma2_svg = nil; end;
        if self.imageCheckBox104 ~= nil then self.imageCheckBox104:destroy(); self.imageCheckBox104 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.layout252 ~= nil then self.layout252:destroy(); self.layout252 = nil; end;
        if self.layout475 ~= nil then self.layout475:destroy(); self.layout475 = nil; end;
        if self.layout300 ~= nil then self.layout300:destroy(); self.layout300 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.imageCheckBox154 ~= nil then self.imageCheckBox154:destroy(); self.imageCheckBox154 = nil; end;
        if self.imageCheckBox68 ~= nil then self.imageCheckBox68:destroy(); self.imageCheckBox68 = nil; end;
        if self.layout307 ~= nil then self.layout307:destroy(); self.layout307 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.layout235 ~= nil then self.layout235:destroy(); self.layout235 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.layout388 ~= nil then self.layout388:destroy(); self.layout388 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.layout537 ~= nil then self.layout537:destroy(); self.layout537 = nil; end;
        if self.layout617 ~= nil then self.layout617:destroy(); self.layout617 = nil; end;
        if self.imageCheckBox331 ~= nil then self.imageCheckBox331:destroy(); self.imageCheckBox331 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.layout406 ~= nil then self.layout406:destroy(); self.layout406 = nil; end;
        if self.layout317 ~= nil then self.layout317:destroy(); self.layout317 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.layout288 ~= nil then self.layout288:destroy(); self.layout288 = nil; end;
        if self.layout462 ~= nil then self.layout462:destroy(); self.layout462 = nil; end;
        if self.imageCheckBox224 ~= nil then self.imageCheckBox224:destroy(); self.imageCheckBox224 = nil; end;
        if self.layout516 ~= nil then self.layout516:destroy(); self.layout516 = nil; end;
        if self.layout575 ~= nil then self.layout575:destroy(); self.layout575 = nil; end;
        if self.layout256 ~= nil then self.layout256:destroy(); self.layout256 = nil; end;
        if self.imageCheckBox233 ~= nil then self.imageCheckBox233:destroy(); self.imageCheckBox233 = nil; end;
        if self.layout564 ~= nil then self.layout564:destroy(); self.layout564 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout480 ~= nil then self.layout480:destroy(); self.layout480 = nil; end;
        if self.layout273 ~= nil then self.layout273:destroy(); self.layout273 = nil; end;
        if self.layout327 ~= nil then self.layout327:destroy(); self.layout327 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.imageCheckBox239 ~= nil then self.imageCheckBox239:destroy(); self.imageCheckBox239 = nil; end;
        if self.imageCheckBox208 ~= nil then self.imageCheckBox208:destroy(); self.imageCheckBox208 = nil; end;
        if self.imageCheckBox112 ~= nil then self.imageCheckBox112:destroy(); self.imageCheckBox112 = nil; end;
        if self.layout310 ~= nil then self.layout310:destroy(); self.layout310 = nil; end;
        if self.layout277 ~= nil then self.layout277:destroy(); self.layout277 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.imageCheckBox207 ~= nil then self.imageCheckBox207:destroy(); self.imageCheckBox207 = nil; end;
        if self.layout600 ~= nil then self.layout600:destroy(); self.layout600 = nil; end;
        if self.layout633 ~= nil then self.layout633:destroy(); self.layout633 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.imageCheckBox302 ~= nil then self.imageCheckBox302:destroy(); self.imageCheckBox302 = nil; end;
        if self.layout442 ~= nil then self.layout442:destroy(); self.layout442 = nil; end;
        if self.imageCheckBox91 ~= nil then self.imageCheckBox91:destroy(); self.imageCheckBox91 = nil; end;
        if self.layout637 ~= nil then self.layout637:destroy(); self.layout637 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout331 ~= nil then self.layout331:destroy(); self.layout331 = nil; end;
        if self.layout444 ~= nil then self.layout444:destroy(); self.layout444 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout278 ~= nil then self.layout278:destroy(); self.layout278 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout261 ~= nil then self.layout261:destroy(); self.layout261 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.layout570 ~= nil then self.layout570:destroy(); self.layout570 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.imageCheckBox314 ~= nil then self.imageCheckBox314:destroy(); self.imageCheckBox314 = nil; end;
        if self.imageCheckBox341 ~= nil then self.imageCheckBox341:destroy(); self.imageCheckBox341 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout543 ~= nil then self.layout543:destroy(); self.layout543 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout539 ~= nil then self.layout539:destroy(); self.layout539 = nil; end;
        if self.layout440 ~= nil then self.layout440:destroy(); self.layout440 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout262 ~= nil then self.layout262:destroy(); self.layout262 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.layout544 ~= nil then self.layout544:destroy(); self.layout544 = nil; end;
        if self.imageCheckBox55 ~= nil then self.imageCheckBox55:destroy(); self.imageCheckBox55 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout367 ~= nil then self.layout367:destroy(); self.layout367 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout242 ~= nil then self.layout242:destroy(); self.layout242 = nil; end;
        if self.imageCheckBox106 ~= nil then self.imageCheckBox106:destroy(); self.imageCheckBox106 = nil; end;
        if self.imageCheckBox255 ~= nil then self.imageCheckBox255:destroy(); self.imageCheckBox255 = nil; end;
        if self.imageCheckBox83 ~= nil then self.imageCheckBox83:destroy(); self.imageCheckBox83 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.imageCheckBox193 ~= nil then self.imageCheckBox193:destroy(); self.imageCheckBox193 = nil; end;
        if self.layout443 ~= nil then self.layout443:destroy(); self.layout443 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.imageCheckBox213 ~= nil then self.imageCheckBox213:destroy(); self.imageCheckBox213 = nil; end;
        if self.layout458 ~= nil then self.layout458:destroy(); self.layout458 = nil; end;
        if self.layout228 ~= nil then self.layout228:destroy(); self.layout228 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout318 ~= nil then self.layout318:destroy(); self.layout318 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout504 ~= nil then self.layout504:destroy(); self.layout504 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.imageCheckBox124 ~= nil then self.imageCheckBox124:destroy(); self.imageCheckBox124 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.imageCheckBox249 ~= nil then self.imageCheckBox249:destroy(); self.imageCheckBox249 = nil; end;
        if self.layout439 ~= nil then self.layout439:destroy(); self.layout439 = nil; end;
        if self.layout360 ~= nil then self.layout360:destroy(); self.layout360 = nil; end;
        if self.layout618 ~= nil then self.layout618:destroy(); self.layout618 = nil; end;
        if self.layout508 ~= nil then self.layout508:destroy(); self.layout508 = nil; end;
        if self.layout387 ~= nil then self.layout387:destroy(); self.layout387 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.imageCheckBox189 ~= nil then self.imageCheckBox189:destroy(); self.imageCheckBox189 = nil; end;
        if self.layout446 ~= nil then self.layout446:destroy(); self.layout446 = nil; end;
        if self.layout606 ~= nil then self.layout606:destroy(); self.layout606 = nil; end;
        if self.layout268 ~= nil then self.layout268:destroy(); self.layout268 = nil; end;
        if self.layout351 ~= nil then self.layout351:destroy(); self.layout351 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.imageCheckBox71 ~= nil then self.imageCheckBox71:destroy(); self.imageCheckBox71 = nil; end;
        if self.layout415 ~= nil then self.layout415:destroy(); self.layout415 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.imageCheckBox137 ~= nil then self.imageCheckBox137:destroy(); self.imageCheckBox137 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.imageCheckBox351 ~= nil then self.imageCheckBox351:destroy(); self.imageCheckBox351 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.layout364 ~= nil then self.layout364:destroy(); self.layout364 = nil; end;
        if self.layout389 ~= nil then self.layout389:destroy(); self.layout389 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout230 ~= nil then self.layout230:destroy(); self.layout230 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.layout583 ~= nil then self.layout583:destroy(); self.layout583 = nil; end;
        if self.imageCheckBox56 ~= nil then self.imageCheckBox56:destroy(); self.imageCheckBox56 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout226 ~= nil then self.layout226:destroy(); self.layout226 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.layout224 ~= nil then self.layout224:destroy(); self.layout224 = nil; end;
        if self.imageCheckBox142 ~= nil then self.imageCheckBox142:destroy(); self.imageCheckBox142 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.imageCheckBox264 ~= nil then self.imageCheckBox264:destroy(); self.imageCheckBox264 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.layout272 ~= nil then self.layout272:destroy(); self.layout272 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.layout581 ~= nil then self.layout581:destroy(); self.layout581 = nil; end;
        if self.imageCheckBox180 ~= nil then self.imageCheckBox180:destroy(); self.imageCheckBox180 = nil; end;
        if self.imageCheckBox253 ~= nil then self.imageCheckBox253:destroy(); self.imageCheckBox253 = nil; end;
        if self.layout414 ~= nil then self.layout414:destroy(); self.layout414 = nil; end;
        if self.layout607 ~= nil then self.layout607:destroy(); self.layout607 = nil; end;
        if self.imageCheckBox85 ~= nil then self.imageCheckBox85:destroy(); self.imageCheckBox85 = nil; end;
        if self.imageCheckBox252 ~= nil then self.imageCheckBox252:destroy(); self.imageCheckBox252 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.layout560 ~= nil then self.layout560:destroy(); self.layout560 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.imageCheckBox157 ~= nil then self.imageCheckBox157:destroy(); self.imageCheckBox157 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.imageCheckBox156 ~= nil then self.imageCheckBox156:destroy(); self.imageCheckBox156 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.imageCheckBox116 ~= nil then self.imageCheckBox116:destroy(); self.imageCheckBox116 = nil; end;
        if self.layout227 ~= nil then self.layout227:destroy(); self.layout227 = nil; end;
        if self.imageCheckBox222 ~= nil then self.imageCheckBox222:destroy(); self.imageCheckBox222 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.imageCheckBox307 ~= nil then self.imageCheckBox307:destroy(); self.imageCheckBox307 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.imageCheckBox158 ~= nil then self.imageCheckBox158:destroy(); self.imageCheckBox158 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.imageCheckBox220 ~= nil then self.imageCheckBox220:destroy(); self.imageCheckBox220 = nil; end;
        if self.imageCheckBox171 ~= nil then self.imageCheckBox171:destroy(); self.imageCheckBox171 = nil; end;
        if self.layout338 ~= nil then self.layout338:destroy(); self.layout338 = nil; end;
        if self.imageCheckBox334 ~= nil then self.imageCheckBox334:destroy(); self.imageCheckBox334 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.imageCheckBox204 ~= nil then self.imageCheckBox204:destroy(); self.imageCheckBox204 = nil; end;
        if self.layout592 ~= nil then self.layout592:destroy(); self.layout592 = nil; end;
        if self.imageCheckBox197 ~= nil then self.imageCheckBox197:destroy(); self.imageCheckBox197 = nil; end;
        if self.layout554 ~= nil then self.layout554:destroy(); self.layout554 = nil; end;
        if self.imageCheckBox242 ~= nil then self.imageCheckBox242:destroy(); self.imageCheckBox242 = nil; end;
        if self.imageCheckBox111 ~= nil then self.imageCheckBox111:destroy(); self.imageCheckBox111 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.layout641 ~= nil then self.layout641:destroy(); self.layout641 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.imageCheckBox96 ~= nil then self.imageCheckBox96:destroy(); self.imageCheckBox96 = nil; end;
        if self.layout240 ~= nil then self.layout240:destroy(); self.layout240 = nil; end;
        if self.imageCheckBox165 ~= nil then self.imageCheckBox165:destroy(); self.imageCheckBox165 = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.layout598 ~= nil then self.layout598:destroy(); self.layout598 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout323 ~= nil then self.layout323:destroy(); self.layout323 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.imageCheckBox76 ~= nil then self.imageCheckBox76:destroy(); self.imageCheckBox76 = nil; end;
        if self.imageCheckBox292 ~= nil then self.imageCheckBox292:destroy(); self.imageCheckBox292 = nil; end;
        if self.layout469 ~= nil then self.layout469:destroy(); self.layout469 = nil; end;
        if self.imageCheckBox308 ~= nil then self.imageCheckBox308:destroy(); self.imageCheckBox308 = nil; end;
        if self.layout627 ~= nil then self.layout627:destroy(); self.layout627 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.imageCheckBox186 ~= nil then self.imageCheckBox186:destroy(); self.imageCheckBox186 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout346 ~= nil then self.layout346:destroy(); self.layout346 = nil; end;
        if self.imageCheckBox195 ~= nil then self.imageCheckBox195:destroy(); self.imageCheckBox195 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.imageCheckBox149 ~= nil then self.imageCheckBox149:destroy(); self.imageCheckBox149 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout486 ~= nil then self.layout486:destroy(); self.layout486 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.layout472 ~= nil then self.layout472:destroy(); self.layout472 = nil; end;
        if self.layout336 ~= nil then self.layout336:destroy(); self.layout336 = nil; end;
        if self.layout428 ~= nil then self.layout428:destroy(); self.layout428 = nil; end;
        if self.imageCheckBox344 ~= nil then self.imageCheckBox344:destroy(); self.imageCheckBox344 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.imageCheckBox283 ~= nil then self.imageCheckBox283:destroy(); self.imageCheckBox283 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout250 ~= nil then self.layout250:destroy(); self.layout250 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.imageCheckBox215 ~= nil then self.imageCheckBox215:destroy(); self.imageCheckBox215 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.imageCheckBox306 ~= nil then self.imageCheckBox306:destroy(); self.imageCheckBox306 = nil; end;
        if self.layout597 ~= nil then self.layout597:destroy(); self.layout597 = nil; end;
        if self.layout638 ~= nil then self.layout638:destroy(); self.layout638 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout393 ~= nil then self.layout393:destroy(); self.layout393 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.imageCheckBox192 ~= nil then self.imageCheckBox192:destroy(); self.imageCheckBox192 = nil; end;
        if self.imageCheckBox320 ~= nil then self.imageCheckBox320:destroy(); self.imageCheckBox320 = nil; end;
        if self.layout298 ~= nil then self.layout298:destroy(); self.layout298 = nil; end;
        if self.imageCheckBox301 ~= nil then self.imageCheckBox301:destroy(); self.imageCheckBox301 = nil; end;
        if self.layout454 ~= nil then self.layout454:destroy(); self.layout454 = nil; end;
        if self.layout505 ~= nil then self.layout505:destroy(); self.layout505 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.imageCheckBox138 ~= nil then self.imageCheckBox138:destroy(); self.imageCheckBox138 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.layout563 ~= nil then self.layout563:destroy(); self.layout563 = nil; end;
        if self.layout642 ~= nil then self.layout642:destroy(); self.layout642 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.imageCheckBox267 ~= nil then self.imageCheckBox267:destroy(); self.imageCheckBox267 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.layout299 ~= nil then self.layout299:destroy(); self.layout299 = nil; end;
        if self.imageCheckBox330 ~= nil then self.imageCheckBox330:destroy(); self.imageCheckBox330 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.layout343 ~= nil then self.layout343:destroy(); self.layout343 = nil; end;
        if self.imageCheckBox263 ~= nil then self.imageCheckBox263:destroy(); self.imageCheckBox263 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.layout357 ~= nil then self.layout357:destroy(); self.layout357 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.imageCheckBox80 ~= nil then self.imageCheckBox80:destroy(); self.imageCheckBox80 = nil; end;
        if self.layout314 ~= nil then self.layout314:destroy(); self.layout314 = nil; end;
        if self.imageCheckBox265 ~= nil then self.imageCheckBox265:destroy(); self.imageCheckBox265 = nil; end;
        if self.layout456 ~= nil then self.layout456:destroy(); self.layout456 = nil; end;
        if self.imageCheckBox119 ~= nil then self.imageCheckBox119:destroy(); self.imageCheckBox119 = nil; end;
        if self.layout561 ~= nil then self.layout561:destroy(); self.layout561 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.layout590 ~= nil then self.layout590:destroy(); self.layout590 = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.imageCheckBox256 ~= nil then self.imageCheckBox256:destroy(); self.imageCheckBox256 = nil; end;
        if self.layout334 ~= nil then self.layout334:destroy(); self.layout334 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout418 ~= nil then self.layout418:destroy(); self.layout418 = nil; end;
        if self.layout419 ~= nil then self.layout419:destroy(); self.layout419 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.layout352 ~= nil then self.layout352:destroy(); self.layout352 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.imageCheckBox92 ~= nil then self.imageCheckBox92:destroy(); self.imageCheckBox92 = nil; end;
        if self.layout615 ~= nil then self.layout615:destroy(); self.layout615 = nil; end;
        if self.imageCheckBox234 ~= nil then self.imageCheckBox234:destroy(); self.imageCheckBox234 = nil; end;
        if self.layout359 ~= nil then self.layout359:destroy(); self.layout359 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.imageCheckBox238 ~= nil then self.imageCheckBox238:destroy(); self.imageCheckBox238 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox169 ~= nil then self.imageCheckBox169:destroy(); self.imageCheckBox169 = nil; end;
        if self.layout465 ~= nil then self.layout465:destroy(); self.layout465 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.imageCheckBox66 ~= nil then self.imageCheckBox66:destroy(); self.imageCheckBox66 = nil; end;
        if self.imageCheckBox275 ~= nil then self.imageCheckBox275:destroy(); self.imageCheckBox275 = nil; end;
        if self.imageCheckBox217 ~= nil then self.imageCheckBox217:destroy(); self.imageCheckBox217 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.layout514 ~= nil then self.layout514:destroy(); self.layout514 = nil; end;
        if self.imageCheckBox82 ~= nil then self.imageCheckBox82:destroy(); self.imageCheckBox82 = nil; end;
        if self.imageCheckBox74 ~= nil then self.imageCheckBox74:destroy(); self.imageCheckBox74 = nil; end;
        if self.layout423 ~= nil then self.layout423:destroy(); self.layout423 = nil; end;
        if self.layout405 ~= nil then self.layout405:destroy(); self.layout405 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout555 ~= nil then self.layout555:destroy(); self.layout555 = nil; end;
        if self.layout610 ~= nil then self.layout610:destroy(); self.layout610 = nil; end;
        if self.imageCheckBox146 ~= nil then self.imageCheckBox146:destroy(); self.imageCheckBox146 = nil; end;
        if self.layout313 ~= nil then self.layout313:destroy(); self.layout313 = nil; end;
        if self.layout530 ~= nil then self.layout530:destroy(); self.layout530 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.layout280 ~= nil then self.layout280:destroy(); self.layout280 = nil; end;
        if self.imageCheckBox300 ~= nil then self.imageCheckBox300:destroy(); self.imageCheckBox300 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.layout398 ~= nil then self.layout398:destroy(); self.layout398 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout547 ~= nil then self.layout547:destroy(); self.layout547 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.imageCheckBox278 ~= nil then self.imageCheckBox278:destroy(); self.imageCheckBox278 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.layout409 ~= nil then self.layout409:destroy(); self.layout409 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.imageCheckBox48 ~= nil then self.imageCheckBox48:destroy(); self.imageCheckBox48 = nil; end;
        if self.layout591 ~= nil then self.layout591:destroy(); self.layout591 = nil; end;
        if self.imageCheckBox139 ~= nil then self.imageCheckBox139:destroy(); self.imageCheckBox139 = nil; end;
        if self.layout427 ~= nil then self.layout427:destroy(); self.layout427 = nil; end;
        if self.layout593 ~= nil then self.layout593:destroy(); self.layout593 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout430 ~= nil then self.layout430:destroy(); self.layout430 = nil; end;
        if self.imageCheckBox187 ~= nil then self.imageCheckBox187:destroy(); self.imageCheckBox187 = nil; end;
        if self.layout344 ~= nil then self.layout344:destroy(); self.layout344 = nil; end;
        if self.layout490 ~= nil then self.layout490:destroy(); self.layout490 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.imageCheckBox223 ~= nil then self.imageCheckBox223:destroy(); self.imageCheckBox223 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout368 ~= nil then self.layout368:destroy(); self.layout368 = nil; end;
        if self.imageCheckBox266 ~= nil then self.imageCheckBox266:destroy(); self.imageCheckBox266 = nil; end;
        if self.layout425 ~= nil then self.layout425:destroy(); self.layout425 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.imageCheckBox245 ~= nil then self.imageCheckBox245:destroy(); self.imageCheckBox245 = nil; end;
        if self.layout528 ~= nil then self.layout528:destroy(); self.layout528 = nil; end;
        if self.layout585 ~= nil then self.layout585:destroy(); self.layout585 = nil; end;
        if self.imageCheckBox160 ~= nil then self.imageCheckBox160:destroy(); self.imageCheckBox160 = nil; end;
        if self.imageCheckBox259 ~= nil then self.imageCheckBox259:destroy(); self.imageCheckBox259 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout460 ~= nil then self.layout460:destroy(); self.layout460 = nil; end;
        if self.imageCheckBox88 ~= nil then self.imageCheckBox88:destroy(); self.imageCheckBox88 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.layout380 ~= nil then self.layout380:destroy(); self.layout380 = nil; end;
        if self.layout377 ~= nil then self.layout377:destroy(); self.layout377 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout609 ~= nil then self.layout609:destroy(); self.layout609 = nil; end;
        if self.layout291 ~= nil then self.layout291:destroy(); self.layout291 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout294 ~= nil then self.layout294:destroy(); self.layout294 = nil; end;
        if self.layout233 ~= nil then self.layout233:destroy(); self.layout233 = nil; end;
        if self.layout383 ~= nil then self.layout383:destroy(); self.layout383 = nil; end;
        if self.layout390 ~= nil then self.layout390:destroy(); self.layout390 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.layout566 ~= nil then self.layout566:destroy(); self.layout566 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.layout629 ~= nil then self.layout629:destroy(); self.layout629 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.imageCheckBox61 ~= nil then self.imageCheckBox61:destroy(); self.imageCheckBox61 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.layout395 ~= nil then self.layout395:destroy(); self.layout395 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout531 ~= nil then self.layout531:destroy(); self.layout531 = nil; end;
        if self.layout483 ~= nil then self.layout483:destroy(); self.layout483 = nil; end;
        if self.imageCheckBox44 ~= nil then self.imageCheckBox44:destroy(); self.imageCheckBox44 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout529 ~= nil then self.layout529:destroy(); self.layout529 = nil; end;
        if self.imageCheckBox64 ~= nil then self.imageCheckBox64:destroy(); self.imageCheckBox64 = nil; end;
        if self.layout545 ~= nil then self.layout545:destroy(); self.layout545 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout402 ~= nil then self.layout402:destroy(); self.layout402 = nil; end;
        if self.layout264 ~= nil then self.layout264:destroy(); self.layout264 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.imageCheckBox274 ~= nil then self.imageCheckBox274:destroy(); self.imageCheckBox274 = nil; end;
        if self.layout231 ~= nil then self.layout231:destroy(); self.layout231 = nil; end;
        if self.imageCheckBox170 ~= nil then self.imageCheckBox170:destroy(); self.imageCheckBox170 = nil; end;
        if self.imageCheckBox121 ~= nil then self.imageCheckBox121:destroy(); self.imageCheckBox121 = nil; end;
        if self.imageCheckBox152 ~= nil then self.imageCheckBox152:destroy(); self.imageCheckBox152 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.imageCheckBox203 ~= nil then self.imageCheckBox203:destroy(); self.imageCheckBox203 = nil; end;
        if self.layout350 ~= nil then self.layout350:destroy(); self.layout350 = nil; end;
        if self.layout342 ~= nil then self.layout342:destroy(); self.layout342 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.imageCheckBox113 ~= nil then self.imageCheckBox113:destroy(); self.imageCheckBox113 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.imageCheckBox89 ~= nil then self.imageCheckBox89:destroy(); self.imageCheckBox89 = nil; end;
        if self.layout384 ~= nil then self.layout384:destroy(); self.layout384 = nil; end;
        if self.imageCheckBox319 ~= nil then self.imageCheckBox319:destroy(); self.imageCheckBox319 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.imageCheckBox188 ~= nil then self.imageCheckBox188:destroy(); self.imageCheckBox188 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.imageCheckBox284 ~= nil then self.imageCheckBox284:destroy(); self.imageCheckBox284 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.imageCheckBox177 ~= nil then self.imageCheckBox177:destroy(); self.imageCheckBox177 = nil; end;
        if self.layout550 ~= nil then self.layout550:destroy(); self.layout550 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.imageCheckBox97 ~= nil then self.imageCheckBox97:destroy(); self.imageCheckBox97 = nil; end;
        if self.layout281 ~= nil then self.layout281:destroy(); self.layout281 = nil; end;
        if self.layout463 ~= nil then self.layout463:destroy(); self.layout463 = nil; end;
        if self.imageCheckBox100 ~= nil then self.imageCheckBox100:destroy(); self.imageCheckBox100 = nil; end;
        if self.layout624 ~= nil then self.layout624:destroy(); self.layout624 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.layout399 ~= nil then self.layout399:destroy(); self.layout399 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.layout522 ~= nil then self.layout522:destroy(); self.layout522 = nil; end;
        if self.imageCheckBox144 ~= nil then self.imageCheckBox144:destroy(); self.imageCheckBox144 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.layout286 ~= nil then self.layout286:destroy(); self.layout286 = nil; end;
        if self.layout349 ~= nil then self.layout349:destroy(); self.layout349 = nil; end;
        if self.layout371 ~= nil then self.layout371:destroy(); self.layout371 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.layout436 ~= nil then self.layout436:destroy(); self.layout436 = nil; end;
        if self.layout608 ~= nil then self.layout608:destroy(); self.layout608 = nil; end;
        if self.layout511 ~= nil then self.layout511:destroy(); self.layout511 = nil; end;
        if self.layout265 ~= nil then self.layout265:destroy(); self.layout265 = nil; end;
        if self.imageCheckBox212 ~= nil then self.imageCheckBox212:destroy(); self.imageCheckBox212 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.imageCheckBox70 ~= nil then self.imageCheckBox70:destroy(); self.imageCheckBox70 = nil; end;
        if self.imageCheckBox282 ~= nil then self.imageCheckBox282:destroy(); self.imageCheckBox282 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.layout521 ~= nil then self.layout521:destroy(); self.layout521 = nil; end;
        if self.imageCheckBox53 ~= nil then self.imageCheckBox53:destroy(); self.imageCheckBox53 = nil; end;
        if self.layout601 ~= nil then self.layout601:destroy(); self.layout601 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.imageCheckBox57 ~= nil then self.imageCheckBox57:destroy(); self.imageCheckBox57 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.layout421 ~= nil then self.layout421:destroy(); self.layout421 = nil; end;
        if self.imageCheckBox143 ~= nil then self.imageCheckBox143:destroy(); self.imageCheckBox143 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.imageCheckBox273 ~= nil then self.imageCheckBox273:destroy(); self.imageCheckBox273 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.imageCheckBox269 ~= nil then self.imageCheckBox269:destroy(); self.imageCheckBox269 = nil; end;
        if self.layout520 ~= nil then self.layout520:destroy(); self.layout520 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.layout632 ~= nil then self.layout632:destroy(); self.layout632 = nil; end;
        if self.imageCheckBox277 ~= nil then self.imageCheckBox277:destroy(); self.imageCheckBox277 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.imageCheckBox240 ~= nil then self.imageCheckBox240:destroy(); self.imageCheckBox240 = nil; end;
        if self.layout287 ~= nil then self.layout287:destroy(); self.layout287 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.imageCheckBox324 ~= nil then self.imageCheckBox324:destroy(); self.imageCheckBox324 = nil; end;
        if self.layout500 ~= nil then self.layout500:destroy(); self.layout500 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.imageCheckBox257 ~= nil then self.imageCheckBox257:destroy(); self.imageCheckBox257 = nil; end;
        if self.layout422 ~= nil then self.layout422:destroy(); self.layout422 = nil; end;
        if self.layout378 ~= nil then self.layout378:destroy(); self.layout378 = nil; end;
        if self.layout284 ~= nil then self.layout284:destroy(); self.layout284 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.layout518 ~= nil then self.layout518:destroy(); self.layout518 = nil; end;
        if self.layout625 ~= nil then self.layout625:destroy(); self.layout625 = nil; end;
        if self.layout631 ~= nil then self.layout631:destroy(); self.layout631 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.imageCheckBox122 ~= nil then self.imageCheckBox122:destroy(); self.imageCheckBox122 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout565 ~= nil then self.layout565:destroy(); self.layout565 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout237 ~= nil then self.layout237:destroy(); self.layout237 = nil; end;
        if self.imageCheckBox40 ~= nil then self.imageCheckBox40:destroy(); self.imageCheckBox40 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout340 ~= nil then self.layout340:destroy(); self.layout340 = nil; end;
        if self.imageCheckBox232 ~= nil then self.imageCheckBox232:destroy(); self.imageCheckBox232 = nil; end;
        if self.layout482 ~= nil then self.layout482:destroy(); self.layout482 = nil; end;
        if self.imageCheckBox167 ~= nil then self.imageCheckBox167:destroy(); self.imageCheckBox167 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.layout301 ~= nil then self.layout301:destroy(); self.layout301 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmlobisomem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmlobisomem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmlobisomem = {
    newEditor = newfrmlobisomem, 
    new = newfrmlobisomem, 
    name = "frmlobisomem", 
    dataType = "br.com.RRPG.WTFV3_S3", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Lobisomem: O Apocalipse - Ficha de Personagem", 
    description=""};

frmlobisomem = _frmlobisomem;
Firecast.registrarForm(_frmlobisomem);
Firecast.registrarDataType(_frmlobisomem);

return _frmlobisomem;
