require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmOD()
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
    obj:setName("frmOD");
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.RRPG.ODAPM_S3");
    obj:setTitle("Old Dragon Aprimorado - Ficha de Personagem");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Atributos e Ataques");
    obj.tab1:setName("tab1");

    obj.frmOD1_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmOD1_svg:setParent(obj.tab1);
    obj.frmOD1_svg:setName("frmOD1_svg");
    obj.frmOD1_svg:setAlign("client");
    obj.frmOD1_svg:setTheme("light");
    obj.frmOD1_svg:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmOD1_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1190);
    obj.rectangle1:setHeight(1684);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1190);
    obj.image1:setHeight(1684);
    obj.image1:setSRC("/OD/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(111);
    obj.layout1:setTop(116);
    obj.layout1:setWidth(611);
    obj.layout1:setHeight(79);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(36);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(611);
    obj.edit1:setHeight(80);
    obj.edit1:setField("Personagem");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(100);
    obj.layout2:setTop(219);
    obj.layout2:setWidth(427);
    obj.layout2:setHeight(45);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(24);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(427);
    obj.edit2:setHeight(46);
    obj.edit2:setField("Classe_e_Especialização");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(547);
    obj.layout3:setTop(218);
    obj.layout3:setWidth(91);
    obj.layout3:setHeight(46);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(24);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(91);
    obj.edit3:setHeight(47);
    obj.edit3:setField("Nivel");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(656);
    obj.layout4:setTop(218);
    obj.layout4:setWidth(181);
    obj.layout4:setHeight(46);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(24);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(181);
    obj.edit4:setHeight(47);
    obj.edit4:setField("RACa");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(855);
    obj.layout5:setTop(218);
    obj.layout5:setWidth(236);
    obj.layout5:setHeight(46);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(24);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(236);
    obj.edit5:setHeight(47);
    obj.edit5:setField("Alinhamento");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(257);
    obj.layout6:setTop(473);
    obj.layout6:setWidth(86);
    obj.layout6:setHeight(95);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(50);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(86);
    obj.edit6:setHeight(96);
    obj.edit6:setField("DES");
    obj.edit6:setName("edit6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(371);
    obj.layout7:setTop(370);
    obj.layout7:setWidth(84);
    obj.layout7:setHeight(77);
    obj.layout7:setName("layout7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(44);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setEnabled(false);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(84);
    obj.edit7:setHeight(78);
    obj.edit7:setField("AFOR");
    obj.edit7:setName("edit7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(257);
    obj.layout8:setTop(367);
    obj.layout8:setWidth(86);
    obj.layout8:setHeight(95);
    obj.layout8:setName("layout8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(50);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(86);
    obj.edit8:setHeight(96);
    obj.edit8:setField("FOR");
    obj.edit8:setName("edit8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(706);
    obj.layout9:setTop(369);
    obj.layout9:setWidth(109);
    obj.layout9:setHeight(96);
    obj.layout9:setName("layout9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(50);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(109);
    obj.edit9:setHeight(97);
    obj.edit9:setField("PV");
    obj.edit9:setName("edit9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(837);
    obj.layout10:setTop(369);
    obj.layout10:setWidth(78);
    obj.layout10:setHeight(78);
    obj.layout10:setName("layout10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(40);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(78);
    obj.edit10:setHeight(79);
    obj.edit10:setField("DV");
    obj.edit10:setName("edit10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(925);
    obj.layout11:setTop(369);
    obj.layout11:setWidth(78);
    obj.layout11:setHeight(78);
    obj.layout11:setName("layout11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(40);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setEnabled(false);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(78);
    obj.edit11:setHeight(79);
    obj.edit11:setField("PVCon");
    obj.edit11:setName("edit11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(1013);
    obj.layout12:setTop(370);
    obj.layout12:setWidth(78);
    obj.layout12:setHeight(78);
    obj.layout12:setName("layout12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(32);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(78);
    obj.edit12:setHeight(79);
    obj.edit12:setField("RESS");
    obj.edit12:setName("edit12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(695);
    obj.layout13:setTop(477);
    obj.layout13:setWidth(395);
    obj.layout13:setHeight(62);
    obj.layout13:setName("layout13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(36);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(395);
    obj.edit13:setHeight(63);
    obj.edit13:setField("AT_PV");
    obj.edit13:setName("edit13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(371);
    obj.layout14:setTop(475);
    obj.layout14:setWidth(84);
    obj.layout14:setHeight(77);
    obj.layout14:setName("layout14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(44);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setEnabled(false);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(84);
    obj.edit14:setHeight(78);
    obj.edit14:setField("ADES");
    obj.edit14:setName("edit14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(926);
    obj.layout15:setTop(564);
    obj.layout15:setWidth(75);
    obj.layout15:setHeight(69);
    obj.layout15:setName("layout15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(40);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(75);
    obj.edit15:setHeight(70);
    obj.edit15:setField("ESC");
    obj.edit15:setName("edit15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(1013);
    obj.layout16:setTop(564);
    obj.layout16:setWidth(75);
    obj.layout16:setHeight(69);
    obj.layout16:setName("layout16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout16);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(40);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(75);
    obj.edit16:setHeight(70);
    obj.edit16:setField("RAC");
    obj.edit16:setName("edit16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(257);
    obj.layout17:setTop(578);
    obj.layout17:setWidth(86);
    obj.layout17:setHeight(95);
    obj.layout17:setName("layout17");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout17);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(50);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(86);
    obj.edit17:setHeight(96);
    obj.edit17:setField("CON");
    obj.edit17:setName("edit17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(371);
    obj.layout18:setTop(579);
    obj.layout18:setWidth(84);
    obj.layout18:setHeight(77);
    obj.layout18:setName("layout18");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout18);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(44);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setEnabled(false);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(84);
    obj.edit18:setHeight(78);
    obj.edit18:setField("ACON");
    obj.edit18:setName("edit18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(713);
    obj.layout19:setTop(563);
    obj.layout19:setWidth(101);
    obj.layout19:setHeight(95);
    obj.layout19:setName("layout19");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout19);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(50);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setEnabled(false);
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(101);
    obj.edit19:setHeight(96);
    obj.edit19:setField("CA");
    obj.edit19:setName("edit19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(837);
    obj.layout20:setTop(658);
    obj.layout20:setWidth(77);
    obj.layout20:setHeight(70);
    obj.layout20:setName("layout20");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout20);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(44);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setEnabled(false);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(77);
    obj.edit20:setHeight(71);
    obj.edit20:setField("ADES");
    obj.edit20:setName("edit20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(924);
    obj.layout21:setTop(658);
    obj.layout21:setWidth(77);
    obj.layout21:setHeight(70);
    obj.layout21:setName("layout21");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout21);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(44);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(77);
    obj.edit21:setHeight(71);
    obj.edit21:setField("OUT2");
    obj.edit21:setName("edit21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(1013);
    obj.layout22:setTop(659);
    obj.layout22:setWidth(77);
    obj.layout22:setHeight(70);
    obj.layout22:setName("layout22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout22);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(44);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(77);
    obj.edit22:setHeight(71);
    obj.edit22:setField("OUT");
    obj.edit22:setName("edit22");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(256);
    obj.layout23:setTop(684);
    obj.layout23:setWidth(86);
    obj.layout23:setHeight(95);
    obj.layout23:setName("layout23");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout23);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(50);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(86);
    obj.edit23:setHeight(96);
    obj.edit23:setField("INT");
    obj.edit23:setName("edit23");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(468);
    obj.layout24:setTop(897);
    obj.layout24:setWidth(84);
    obj.layout24:setHeight(77);
    obj.layout24:setName("layout24");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout24);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(28);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(84);
    obj.edit24:setHeight(78);
    obj.edit24:setField("A_REA");
    obj.edit24:setName("edit24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(371);
    obj.layout25:setTop(686);
    obj.layout25:setWidth(84);
    obj.layout25:setHeight(77);
    obj.layout25:setName("layout25");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout25);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(44);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(84);
    obj.edit25:setHeight(78);
    obj.edit25:setField("Idiomas");
    obj.edit25:setName("edit25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(468);
    obj.layout26:setTop(685);
    obj.layout26:setWidth(84);
    obj.layout26:setHeight(79);
    obj.layout26:setName("layout26");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout26);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(36);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(84);
    obj.edit26:setHeight(80);
    obj.edit26:setField("Ap_Magia");
    obj.edit26:setName("edit26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(838);
    obj.layout27:setTop(564);
    obj.layout27:setWidth(75);
    obj.layout27:setHeight(69);
    obj.layout27:setName("layout27");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout27);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(40);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(75);
    obj.edit27:setHeight(70);
    obj.edit27:setField("ARMAD");
    obj.edit27:setName("edit27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(703);
    obj.layout28:setTop(769);
    obj.layout28:setWidth(92);
    obj.layout28:setHeight(96);
    obj.layout28:setName("layout28");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout28);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(50);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(92);
    obj.edit28:setHeight(97);
    obj.edit28:setField("JP");
    obj.edit28:setName("edit28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(1009);
    obj.layout29:setTop(771);
    obj.layout29:setWidth(81);
    obj.layout29:setHeight(78);
    obj.layout29:setName("layout29");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout29);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(44);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setEnabled(false);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(81);
    obj.edit29:setHeight(79);
    obj.edit29:setField("JPSab");
    obj.edit29:setName("edit29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(914);
    obj.layout30:setTop(770);
    obj.layout30:setWidth(81);
    obj.layout30:setHeight(78);
    obj.layout30:setName("layout30");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout30);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(44);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setEnabled(false);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(81);
    obj.edit30:setHeight(79);
    obj.edit30:setField("JPCon");
    obj.edit30:setName("edit30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(257);
    obj.layout31:setTop(790);
    obj.layout31:setWidth(86);
    obj.layout31:setHeight(95);
    obj.layout31:setName("layout31");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout31);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(50);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(86);
    obj.edit31:setHeight(96);
    obj.edit31:setField("SAB");
    obj.edit31:setName("edit31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(371);
    obj.layout32:setTop(791);
    obj.layout32:setWidth(84);
    obj.layout32:setHeight(77);
    obj.layout32:setName("layout32");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout32);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(44);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setEnabled(false);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(84);
    obj.edit32:setHeight(78);
    obj.edit32:setField("ASAB");
    obj.edit32:setName("edit32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(820);
    obj.layout33:setTop(770);
    obj.layout33:setWidth(81);
    obj.layout33:setHeight(78);
    obj.layout33:setName("layout33");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout33);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(44);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setEnabled(false);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(81);
    obj.edit33:setHeight(79);
    obj.edit33:setField("JPDes");
    obj.edit33:setName("edit33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(257);
    obj.layout34:setTop(896);
    obj.layout34:setWidth(86);
    obj.layout34:setHeight(95);
    obj.layout34:setName("layout34");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout34);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(50);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(86);
    obj.edit34:setHeight(96);
    obj.edit34:setField("CAR");
    obj.edit34:setName("edit34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(371);
    obj.layout35:setTop(897);
    obj.layout35:setWidth(84);
    obj.layout35:setHeight(78);
    obj.layout35:setName("layout35");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout35);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(44);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(84);
    obj.edit35:setHeight(79);
    obj.edit35:setField("Seguidores");
    obj.edit35:setName("edit35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(594);
    obj.layout36:setTop(896);
    obj.layout36:setWidth(216);
    obj.layout36:setHeight(75);
    obj.layout36:setName("layout36");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout36);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(40);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(216);
    obj.edit36:setHeight(76);
    obj.edit36:setField("MOV");
    obj.edit36:setName("edit36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(835);
    obj.layout37:setTop(897);
    obj.layout37:setWidth(75);
    obj.layout37:setHeight(75);
    obj.layout37:setName("layout37");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout37);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(40);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(75);
    obj.edit37:setHeight(76);
    obj.edit37:setField("M_RAC");
    obj.edit37:setName("edit37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(925);
    obj.layout38:setTop(896);
    obj.layout38:setWidth(75);
    obj.layout38:setHeight(75);
    obj.layout38:setName("layout38");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout38);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(40);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(75);
    obj.edit38:setHeight(76);
    obj.edit38:setField("CARG");
    obj.edit38:setName("edit38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(1014);
    obj.layout39:setTop(897);
    obj.layout39:setWidth(75);
    obj.layout39:setHeight(75);
    obj.layout39:setName("layout39");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout39);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(40);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(75);
    obj.edit39:setHeight(76);
    obj.edit39:setField("M_ARMAD");
    obj.edit39:setName("edit39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(209);
    obj.layout40:setTop(1099);
    obj.layout40:setWidth(81);
    obj.layout40:setHeight(67);
    obj.layout40:setName("layout40");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout40);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(40);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(81);
    obj.edit40:setHeight(68);
    obj.edit40:setField("CaC");
    obj.edit40:setName("edit40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(1031);
    obj.layout41:setTop(1099);
    obj.layout41:setWidth(60);
    obj.layout41:setHeight(68);
    obj.layout41:setName("layout41");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout41);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(24);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(60);
    obj.edit41:setHeight(69);
    obj.edit41:setField("Misc2");
    obj.edit41:setName("edit41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(889);
    obj.layout42:setTop(1099);
    obj.layout42:setWidth(60);
    obj.layout42:setHeight(68);
    obj.layout42:setName("layout42");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout42);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(24);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setEnabled(false);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(60);
    obj.edit42:setHeight(69);
    obj.edit42:setField("ADES");
    obj.edit42:setName("edit42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(519);
    obj.layout43:setTop(1099);
    obj.layout43:setWidth(60);
    obj.layout43:setHeight(68);
    obj.layout43:setName("layout43");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout43);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(24);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(60);
    obj.edit43:setHeight(69);
    obj.edit43:setField("Misc1");
    obj.edit43:setName("edit43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(307);
    obj.layout44:setTop(1099);
    obj.layout44:setWidth(60);
    obj.layout44:setHeight(68);
    obj.layout44:setName("layout44");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout44);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(24);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(60);
    obj.edit44:setHeight(69);
    obj.edit44:setField("BA1");
    obj.edit44:setName("edit44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(378);
    obj.layout45:setTop(1099);
    obj.layout45:setWidth(60);
    obj.layout45:setHeight(68);
    obj.layout45:setName("layout45");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout45);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(24);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setEnabled(false);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(60);
    obj.edit45:setHeight(69);
    obj.edit45:setField("AFOR");
    obj.edit45:setName("edit45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(449);
    obj.layout46:setTop(1098);
    obj.layout46:setWidth(60);
    obj.layout46:setHeight(68);
    obj.layout46:setName("layout46");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout46);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(24);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(60);
    obj.edit46:setHeight(69);
    obj.edit46:setField("Item1");
    obj.edit46:setName("edit46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(720);
    obj.layout47:setTop(1099);
    obj.layout47:setWidth(81);
    obj.layout47:setHeight(67);
    obj.layout47:setName("layout47");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout47);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(40);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(81);
    obj.edit47:setHeight(68);
    obj.edit47:setField("DIS");
    obj.edit47:setName("edit47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(820);
    obj.layout48:setTop(1099);
    obj.layout48:setWidth(60);
    obj.layout48:setHeight(68);
    obj.layout48:setName("layout48");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout48);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(24);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(60);
    obj.edit48:setHeight(69);
    obj.edit48:setField("BA2");
    obj.edit48:setName("edit48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(960);
    obj.layout49:setTop(1099);
    obj.layout49:setWidth(60);
    obj.layout49:setHeight(68);
    obj.layout49:setName("layout49");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout49);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(24);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(60);
    obj.edit49:setHeight(69);
    obj.edit49:setField("Item2");
    obj.edit49:setName("edit49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(102);
    obj.layout50:setTop(1227);
    obj.layout50:setWidth(262);
    obj.layout50:setHeight(45);
    obj.layout50:setName("layout50");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout50);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(20);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(262);
    obj.edit50:setHeight(46);
    obj.edit50:setField("_1_2");
    obj.edit50:setName("edit50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(381);
    obj.layout51:setTop(1227);
    obj.layout51:setWidth(98);
    obj.layout51:setHeight(46);
    obj.layout51:setName("layout51");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout51);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(20);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(98);
    obj.edit51:setHeight(47);
    obj.edit51:setField("_0_1");
    obj.edit51:setName("edit51");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(693);
    obj.layout52:setTop(1228);
    obj.layout52:setWidth(72);
    obj.layout52:setHeight(47);
    obj.layout52:setName("layout52");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout52);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(16);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(72);
    obj.edit52:setHeight(48);
    obj.edit52:setField("CRIT1");
    obj.edit52:setName("edit52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(692);
    obj.layout53:setTop(1329);
    obj.layout53:setWidth(72);
    obj.layout53:setHeight(47);
    obj.layout53:setName("layout53");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout53);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(16);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(72);
    obj.edit53:setHeight(48);
    obj.edit53:setField("CRIT3");
    obj.edit53:setName("edit53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(693);
    obj.layout54:setTop(1381);
    obj.layout54:setWidth(72);
    obj.layout54:setHeight(47);
    obj.layout54:setName("layout54");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout54);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(16);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(72);
    obj.edit54:setHeight(48);
    obj.edit54:setField("CRIT4");
    obj.edit54:setName("edit54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(692);
    obj.layout55:setTop(1278);
    obj.layout55:setWidth(72);
    obj.layout55:setHeight(47);
    obj.layout55:setName("layout55");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout55);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(16);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(72);
    obj.edit55:setHeight(48);
    obj.edit55:setField("CRIT2");
    obj.edit55:setName("edit55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(102);
    obj.layout56:setTop(1278);
    obj.layout56:setWidth(262);
    obj.layout56:setHeight(46);
    obj.layout56:setName("layout56");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout56);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(20);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(262);
    obj.edit56:setHeight(47);
    obj.edit56:setField("_2");
    obj.edit56:setName("edit56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(102);
    obj.layout57:setTop(1330);
    obj.layout57:setWidth(262);
    obj.layout57:setHeight(46);
    obj.layout57:setName("layout57");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout57);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(20);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(262);
    obj.edit57:setHeight(47);
    obj.edit57:setField("_3");
    obj.edit57:setName("edit57");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(102);
    obj.layout58:setTop(1381);
    obj.layout58:setWidth(262);
    obj.layout58:setHeight(46);
    obj.layout58:setName("layout58");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout58);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(20);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(262);
    obj.edit58:setHeight(47);
    obj.edit58:setField("_4");
    obj.edit58:setName("edit58");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(381);
    obj.layout59:setTop(1278);
    obj.layout59:setWidth(97);
    obj.layout59:setHeight(46);
    obj.layout59:setName("layout59");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout59);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(20);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(97);
    obj.edit59:setHeight(47);
    obj.edit59:setField("_0_2");
    obj.edit59:setName("edit59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(381);
    obj.layout60:setTop(1330);
    obj.layout60:setWidth(97);
    obj.layout60:setHeight(46);
    obj.layout60:setName("layout60");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout60);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(20);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(97);
    obj.edit60:setHeight(47);
    obj.edit60:setField("_0_3");
    obj.edit60:setName("edit60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(381);
    obj.layout61:setTop(1381);
    obj.layout61:setWidth(97);
    obj.layout61:setHeight(46);
    obj.layout61:setName("layout61");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout61);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(20);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(97);
    obj.edit61:setHeight(47);
    obj.edit61:setField("_0_4");
    obj.edit61:setName("edit61");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(497);
    obj.layout62:setTop(1227);
    obj.layout62:setWidth(93);
    obj.layout62:setHeight(46);
    obj.layout62:setName("layout62");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout62);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(20);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(93);
    obj.edit62:setHeight(47);
    obj.edit62:setField("_1_3");
    obj.edit62:setName("edit62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(497);
    obj.layout63:setTop(1278);
    obj.layout63:setWidth(93);
    obj.layout63:setHeight(46);
    obj.layout63:setName("layout63");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout63);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(20);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(93);
    obj.edit63:setHeight(47);
    obj.edit63:setField("_2_2");
    obj.edit63:setName("edit63");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(497);
    obj.layout64:setTop(1330);
    obj.layout64:setWidth(93);
    obj.layout64:setHeight(46);
    obj.layout64:setName("layout64");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout64);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(20);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(93);
    obj.edit64:setHeight(47);
    obj.edit64:setField("_3_2");
    obj.edit64:setName("edit64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(497);
    obj.layout65:setTop(1381);
    obj.layout65:setWidth(93);
    obj.layout65:setHeight(46);
    obj.layout65:setName("layout65");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout65);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(20);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(93);
    obj.edit65:setHeight(47);
    obj.edit65:setField("_4_2");
    obj.edit65:setName("edit65");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(607);
    obj.layout66:setTop(1227);
    obj.layout66:setWidth(69);
    obj.layout66:setHeight(46);
    obj.layout66:setName("layout66");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout66);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(20);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(69);
    obj.edit66:setHeight(47);
    obj.edit66:setField("_1_4");
    obj.edit66:setName("edit66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(607);
    obj.layout67:setTop(1278);
    obj.layout67:setWidth(69);
    obj.layout67:setHeight(46);
    obj.layout67:setName("layout67");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout67);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(20);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(69);
    obj.edit67:setHeight(47);
    obj.edit67:setField("_2_3");
    obj.edit67:setName("edit67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(607);
    obj.layout68:setTop(1330);
    obj.layout68:setWidth(69);
    obj.layout68:setHeight(46);
    obj.layout68:setName("layout68");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout68);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(20);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(69);
    obj.edit68:setHeight(47);
    obj.edit68:setField("_3_3");
    obj.edit68:setName("edit68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(607);
    obj.layout69:setTop(1381);
    obj.layout69:setWidth(69);
    obj.layout69:setHeight(46);
    obj.layout69:setName("layout69");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout69);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(20);
    obj.edit69:setFontColor("#000000");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(69);
    obj.edit69:setHeight(47);
    obj.edit69:setField("_4_3");
    obj.edit69:setName("edit69");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(786);
    obj.layout70:setTop(1227);
    obj.layout70:setWidth(133);
    obj.layout70:setHeight(46);
    obj.layout70:setName("layout70");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout70);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(20);
    obj.edit70:setFontColor("#000000");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(133);
    obj.edit70:setHeight(47);
    obj.edit70:setField("_1_5");
    obj.edit70:setName("edit70");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(786);
    obj.layout71:setTop(1278);
    obj.layout71:setWidth(133);
    obj.layout71:setHeight(46);
    obj.layout71:setName("layout71");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout71);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(20);
    obj.edit71:setFontColor("#000000");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(133);
    obj.edit71:setHeight(47);
    obj.edit71:setField("_2_4");
    obj.edit71:setName("edit71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(786);
    obj.layout72:setTop(1330);
    obj.layout72:setWidth(133);
    obj.layout72:setHeight(46);
    obj.layout72:setName("layout72");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout72);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(20);
    obj.edit72:setFontColor("#000000");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(133);
    obj.edit72:setHeight(47);
    obj.edit72:setField("_3_4");
    obj.edit72:setName("edit72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(786);
    obj.layout73:setTop(1381);
    obj.layout73:setWidth(133);
    obj.layout73:setHeight(46);
    obj.layout73:setName("layout73");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout73);
    obj.edit73:setTransparent(true);
    obj.edit73:setFontSize(20);
    obj.edit73:setFontColor("#000000");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(133);
    obj.edit73:setHeight(47);
    obj.edit73:setField("_4_4");
    obj.edit73:setName("edit73");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(933);
    obj.layout74:setTop(1227);
    obj.layout74:setWidth(158);
    obj.layout74:setHeight(46);
    obj.layout74:setName("layout74");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout74);
    obj.edit74:setTransparent(true);
    obj.edit74:setFontSize(20);
    obj.edit74:setFontColor("#000000");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(158);
    obj.edit74:setHeight(47);
    obj.edit74:setField("_1_6");
    obj.edit74:setName("edit74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(933);
    obj.layout75:setTop(1278);
    obj.layout75:setWidth(158);
    obj.layout75:setHeight(46);
    obj.layout75:setName("layout75");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout75);
    obj.edit75:setTransparent(true);
    obj.edit75:setFontSize(20);
    obj.edit75:setFontColor("#000000");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(0);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(158);
    obj.edit75:setHeight(47);
    obj.edit75:setField("_2_5");
    obj.edit75:setName("edit75");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(933);
    obj.layout76:setTop(1330);
    obj.layout76:setWidth(158);
    obj.layout76:setHeight(46);
    obj.layout76:setName("layout76");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout76);
    obj.edit76:setTransparent(true);
    obj.edit76:setFontSize(20);
    obj.edit76:setFontColor("#000000");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(158);
    obj.edit76:setHeight(47);
    obj.edit76:setField("_3_5");
    obj.edit76:setName("edit76");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(934);
    obj.layout77:setTop(1381);
    obj.layout77:setWidth(158);
    obj.layout77:setHeight(46);
    obj.layout77:setName("layout77");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout77);
    obj.edit77:setTransparent(true);
    obj.edit77:setFontSize(20);
    obj.edit77:setFontColor("#000000");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(158);
    obj.edit77:setHeight(47);
    obj.edit77:setField("_4_5");
    obj.edit77:setName("edit77");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(102);
    obj.layout78:setTop(1500);
    obj.layout78:setWidth(449);
    obj.layout78:setHeight(46);
    obj.layout78:setName("layout78");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout78);
    obj.edit78:setTransparent(true);
    obj.edit78:setFontSize(20);
    obj.edit78:setFontColor("#000000");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(449);
    obj.edit78:setHeight(47);
    obj.edit78:setField("_1_7");
    obj.edit78:setName("edit78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(723);
    obj.layout79:setTop(1501);
    obj.layout79:setWidth(366);
    obj.layout79:setHeight(46);
    obj.layout79:setName("layout79");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout79);
    obj.edit79:setTransparent(true);
    obj.edit79:setFontSize(30);
    obj.edit79:setFontColor("#000000");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(366);
    obj.edit79:setHeight(47);
    obj.edit79:setField("_1__0");
    obj.edit79:setName("edit79");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(102);
    obj.layout80:setTop(1547);
    obj.layout80:setWidth(449);
    obj.layout80:setHeight(42);
    obj.layout80:setName("layout80");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout80);
    obj.edit80:setTransparent(true);
    obj.edit80:setFontSize(20);
    obj.edit80:setFontColor("#000000");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(449);
    obj.edit80:setHeight(43);
    obj.edit80:setField("_2_6");
    obj.edit80:setName("edit80");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(724);
    obj.layout81:setTop(1547);
    obj.layout81:setWidth(365);
    obj.layout81:setHeight(42);
    obj.layout81:setName("layout81");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout81);
    obj.edit81:setTransparent(true);
    obj.edit81:setFontSize(29.3);
    obj.edit81:setFontColor("#000000");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(0);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(365);
    obj.edit81:setHeight(43);
    obj.edit81:setField("_2_1");
    obj.edit81:setName("edit81");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.frmOD1_svg);
    obj.dataLink1:setField("FOR");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.frmOD1_svg);
    obj.dataLink2:setField("DES");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.frmOD1_svg);
    obj.dataLink3:setField("CON");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.frmOD1_svg);
    obj.dataLink4:setField("SAB");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.frmOD1_svg);
    obj.dataLink5:setFields({'ACON', 'Nivel'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.frmOD1_svg);
    obj.dataLink6:setFields({'ARMAD', 'ESC', 'RAC', 'ADES', 'OUT', 'OUT2'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.frmOD1_svg);
    obj.dataLink7:setFields({'JP', 'ADES'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.frmOD1_svg);
    obj.dataLink8:setFields({'JP', 'ACON'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.frmOD1_svg);
    obj.dataLink9:setFields({'JP', 'ASAB'});
    obj.dataLink9:setName("dataLink9");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Equipamentos e Habilidades");
    obj.tab2:setName("tab2");

    obj.frmOD2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmOD2_svg:setParent(obj.tab2);
    obj.frmOD2_svg:setName("frmOD2_svg");
    obj.frmOD2_svg:setAlign("client");
    obj.frmOD2_svg:setTheme("light");
    obj.frmOD2_svg:setMargins({top=1});

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmOD2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox2);
    obj.rectangle2:setWidth(1190);
    obj.rectangle2:setHeight(1684);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(1190);
    obj.image2:setHeight(1684);
    obj.image2:setSRC("/OD/images/2.png");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle2);
    obj.layout82:setLeft(101);
    obj.layout82:setTop(128);
    obj.layout82:setWidth(238);
    obj.layout82:setHeight(39);
    obj.layout82:setName("layout82");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout82);
    obj.edit82:setTransparent(true);
    obj.edit82:setFontSize(20);
    obj.edit82:setFontColor("#000000");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(238);
    obj.edit82:setHeight(40);
    obj.edit82:setField("_1_8");
    obj.edit82:setName("edit82");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle2);
    obj.layout83:setLeft(101);
    obj.layout83:setTop(169);
    obj.layout83:setWidth(238);
    obj.layout83:setHeight(39);
    obj.layout83:setName("layout83");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout83);
    obj.edit83:setTransparent(true);
    obj.edit83:setFontSize(20);
    obj.edit83:setFontColor("#000000");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(0);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(238);
    obj.edit83:setHeight(40);
    obj.edit83:setField("_2_7");
    obj.edit83:setName("edit83");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle2);
    obj.layout84:setLeft(532);
    obj.layout84:setTop(161);
    obj.layout84:setWidth(67);
    obj.layout84:setHeight(61);
    obj.layout84:setName("layout84");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout84);
    obj.edit84:setTransparent(true);
    obj.edit84:setFontSize(30);
    obj.edit84:setFontColor("#000000");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(0);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(67);
    obj.edit84:setHeight(62);
    obj.edit84:setField("Mag_1__0");
    obj.edit84:setName("edit84");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle2);
    obj.layout85:setLeft(101);
    obj.layout85:setTop(210);
    obj.layout85:setWidth(238);
    obj.layout85:setHeight(39);
    obj.layout85:setName("layout85");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout85);
    obj.edit85:setTransparent(true);
    obj.edit85:setFontSize(20);
    obj.edit85:setFontColor("#000000");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(0);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(238);
    obj.edit85:setHeight(40);
    obj.edit85:setField("_3_6");
    obj.edit85:setName("edit85");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle2);
    obj.layout86:setLeft(101);
    obj.layout86:setTop(251);
    obj.layout86:setWidth(238);
    obj.layout86:setHeight(39);
    obj.layout86:setName("layout86");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout86);
    obj.edit86:setTransparent(true);
    obj.edit86:setFontSize(20);
    obj.edit86:setFontColor("#000000");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(0);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(238);
    obj.edit86:setHeight(40);
    obj.edit86:setField("_4_6");
    obj.edit86:setName("edit86");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle2);
    obj.layout87:setLeft(618);
    obj.layout87:setTop(161);
    obj.layout87:setWidth(83);
    obj.layout87:setHeight(62);
    obj.layout87:setName("layout87");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout87);
    obj.edit87:setTransparent(true);
    obj.edit87:setFontSize(30);
    obj.edit87:setFontColor("#000000");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(0);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(83);
    obj.edit87:setHeight(63);
    obj.edit87:setField("Mag_Ad_1");
    obj.edit87:setName("edit87");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle2);
    obj.layout88:setLeft(618);
    obj.layout88:setTop(230);
    obj.layout88:setWidth(83);
    obj.layout88:setHeight(62);
    obj.layout88:setName("layout88");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout88);
    obj.edit88:setTransparent(true);
    obj.edit88:setFontSize(30);
    obj.edit88:setFontColor("#000000");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(0);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(83);
    obj.edit88:setHeight(63);
    obj.edit88:setField("Mag_Ad_2");
    obj.edit88:setName("edit88");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle2);
    obj.layout89:setLeft(101);
    obj.layout89:setTop(292);
    obj.layout89:setWidth(238);
    obj.layout89:setHeight(39);
    obj.layout89:setName("layout89");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout89);
    obj.edit89:setTransparent(true);
    obj.edit89:setFontSize(20);
    obj.edit89:setFontColor("#000000");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(0);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(238);
    obj.edit89:setHeight(40);
    obj.edit89:setField("_5");
    obj.edit89:setName("edit89");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle2);
    obj.layout90:setLeft(353);
    obj.layout90:setTop(292);
    obj.layout90:setWidth(62);
    obj.layout90:setHeight(39);
    obj.layout90:setName("layout90");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout90);
    obj.edit90:setTransparent(true);
    obj.edit90:setFontSize(20);
    obj.edit90:setFontColor("#000000");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(0);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(62);
    obj.edit90:setHeight(40);
    obj.edit90:setField("_5_2");
    obj.edit90:setName("edit90");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle2);
    obj.layout91:setLeft(532);
    obj.layout91:setTop(230);
    obj.layout91:setWidth(67);
    obj.layout91:setHeight(61);
    obj.layout91:setName("layout91");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout91);
    obj.edit91:setTransparent(true);
    obj.edit91:setFontSize(30);
    obj.edit91:setFontColor("#000000");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(67);
    obj.edit91:setHeight(62);
    obj.edit91:setField("Mag_2__0");
    obj.edit91:setName("edit91");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle2);
    obj.layout92:setLeft(618);
    obj.layout92:setTop(299);
    obj.layout92:setWidth(83);
    obj.layout92:setHeight(62);
    obj.layout92:setName("layout92");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout92);
    obj.edit92:setTransparent(true);
    obj.edit92:setFontSize(30);
    obj.edit92:setFontColor("#000000");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(0);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(83);
    obj.edit92:setHeight(63);
    obj.edit92:setField("Mag_Ad_3");
    obj.edit92:setName("edit92");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle2);
    obj.layout93:setLeft(101);
    obj.layout93:setTop(332);
    obj.layout93:setWidth(238);
    obj.layout93:setHeight(39);
    obj.layout93:setName("layout93");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout93);
    obj.edit93:setTransparent(true);
    obj.edit93:setFontSize(20);
    obj.edit93:setFontColor("#000000");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(0);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(238);
    obj.edit93:setHeight(40);
    obj.edit93:setField("_6_3");
    obj.edit93:setName("edit93");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle2);
    obj.layout94:setLeft(101);
    obj.layout94:setTop(373);
    obj.layout94:setWidth(238);
    obj.layout94:setHeight(39);
    obj.layout94:setName("layout94");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout94);
    obj.edit94:setTransparent(true);
    obj.edit94:setFontSize(20);
    obj.edit94:setFontColor("#000000");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(0);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(238);
    obj.edit94:setHeight(40);
    obj.edit94:setField("_7_2");
    obj.edit94:setName("edit94");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle2);
    obj.layout95:setLeft(532);
    obj.layout95:setTop(300);
    obj.layout95:setWidth(67);
    obj.layout95:setHeight(61);
    obj.layout95:setName("layout95");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout95);
    obj.edit95:setTransparent(true);
    obj.edit95:setFontSize(30);
    obj.edit95:setFontColor("#000000");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(0);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(67);
    obj.edit95:setHeight(62);
    obj.edit95:setField("Mag_3__0");
    obj.edit95:setName("edit95");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle2);
    obj.layout96:setLeft(532);
    obj.layout96:setTop(368);
    obj.layout96:setWidth(67);
    obj.layout96:setHeight(61);
    obj.layout96:setName("layout96");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout96);
    obj.edit96:setTransparent(true);
    obj.edit96:setFontSize(30);
    obj.edit96:setFontColor("#000000");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(0);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(67);
    obj.edit96:setHeight(62);
    obj.edit96:setField("Mag_4__0");
    obj.edit96:setName("edit96");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle2);
    obj.layout97:setLeft(628);
    obj.layout97:setTop(368);
    obj.layout97:setWidth(67);
    obj.layout97:setHeight(61);
    obj.layout97:setName("layout97");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout97);
    obj.edit97:setTransparent(true);
    obj.edit97:setFontSize(30);
    obj.edit97:setFontColor("#000000");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setLeft(0);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(67);
    obj.edit97:setHeight(62);
    obj.edit97:setField("Mag_7__0");
    obj.edit97:setName("edit97");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle2);
    obj.layout98:setLeft(532);
    obj.layout98:setTop(439);
    obj.layout98:setWidth(67);
    obj.layout98:setHeight(61);
    obj.layout98:setName("layout98");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout98);
    obj.edit98:setTransparent(true);
    obj.edit98:setFontSize(30);
    obj.edit98:setFontColor("#000000");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setLeft(0);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(67);
    obj.edit98:setHeight(62);
    obj.edit98:setField("Mag_5__0");
    obj.edit98:setName("edit98");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle2);
    obj.layout99:setLeft(628);
    obj.layout99:setTop(439);
    obj.layout99:setWidth(67);
    obj.layout99:setHeight(61);
    obj.layout99:setName("layout99");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout99);
    obj.edit99:setTransparent(true);
    obj.edit99:setFontSize(30);
    obj.edit99:setFontColor("#000000");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setLeft(0);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(67);
    obj.edit99:setHeight(62);
    obj.edit99:setField("Mag_8__0");
    obj.edit99:setName("edit99");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle2);
    obj.layout100:setLeft(532);
    obj.layout100:setTop(507);
    obj.layout100:setWidth(67);
    obj.layout100:setHeight(61);
    obj.layout100:setName("layout100");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout100);
    obj.edit100:setTransparent(true);
    obj.edit100:setFontSize(30);
    obj.edit100:setFontColor("#000000");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setLeft(0);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(67);
    obj.edit100:setHeight(62);
    obj.edit100:setField("Mag_6__0");
    obj.edit100:setName("edit100");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle2);
    obj.layout101:setLeft(628);
    obj.layout101:setTop(507);
    obj.layout101:setWidth(67);
    obj.layout101:setHeight(61);
    obj.layout101:setName("layout101");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout101);
    obj.edit101:setTransparent(true);
    obj.edit101:setFontSize(30);
    obj.edit101:setFontColor("#000000");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setLeft(0);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(67);
    obj.edit101:setHeight(62);
    obj.edit101:setField("Mag_9__0");
    obj.edit101:setName("edit101");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle2);
    obj.layout102:setLeft(930);
    obj.layout102:setTop(141);
    obj.layout102:setWidth(69);
    obj.layout102:setHeight(70);
    obj.layout102:setName("layout102");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout102);
    obj.edit102:setTransparent(true);
    obj.edit102:setFontSize(30);
    obj.edit102:setFontColor("#000000");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setLeft(0);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(69);
    obj.edit102:setHeight(71);
    obj.edit102:setField("Arrombar");
    obj.edit102:setName("edit102");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle2);
    obj.layout103:setLeft(930);
    obj.layout103:setTop(217);
    obj.layout103:setWidth(69);
    obj.layout103:setHeight(70);
    obj.layout103:setName("layout103");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout103);
    obj.edit103:setTransparent(true);
    obj.edit103:setFontSize(30);
    obj.edit103:setFontColor("#000000");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setLeft(0);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(69);
    obj.edit103:setHeight(71);
    obj.edit103:setField("Armadilhas");
    obj.edit103:setName("edit103");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle2);
    obj.layout104:setLeft(930);
    obj.layout104:setTop(295);
    obj.layout104:setWidth(69);
    obj.layout104:setHeight(70);
    obj.layout104:setName("layout104");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout104);
    obj.edit104:setTransparent(true);
    obj.edit104:setFontSize(30);
    obj.edit104:setFontColor("#000000");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setLeft(0);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(69);
    obj.edit104:setHeight(71);
    obj.edit104:setField("Escalar");
    obj.edit104:setName("edit104");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle2);
    obj.layout105:setLeft(930);
    obj.layout105:setTop(374);
    obj.layout105:setWidth(69);
    obj.layout105:setHeight(70);
    obj.layout105:setName("layout105");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout105);
    obj.edit105:setTransparent(true);
    obj.edit105:setFontSize(30);
    obj.edit105:setFontColor("#000000");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setLeft(0);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(69);
    obj.edit105:setHeight(71);
    obj.edit105:setField("Furtividade");
    obj.edit105:setName("edit105");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle2);
    obj.layout106:setLeft(930);
    obj.layout106:setTop(451);
    obj.layout106:setWidth(69);
    obj.layout106:setHeight(70);
    obj.layout106:setName("layout106");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout106);
    obj.edit106:setTransparent(true);
    obj.edit106:setFontSize(30);
    obj.edit106:setFontColor("#000000");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(0);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(69);
    obj.edit106:setHeight(71);
    obj.edit106:setField("Punga");
    obj.edit106:setName("edit106");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle2);
    obj.layout107:setLeft(930);
    obj.layout107:setTop(526);
    obj.layout107:setWidth(69);
    obj.layout107:setHeight(70);
    obj.layout107:setName("layout107");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout107);
    obj.edit107:setTransparent(true);
    obj.edit107:setFontSize(30);
    obj.edit107:setFontColor("#000000");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(0);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(69);
    obj.edit107:setHeight(71);
    obj.edit107:setField("Percepção");
    obj.edit107:setName("edit107");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle2);
    obj.layout108:setLeft(930);
    obj.layout108:setTop(605);
    obj.layout108:setWidth(69);
    obj.layout108:setHeight(70);
    obj.layout108:setName("layout108");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout108);
    obj.edit108:setTransparent(true);
    obj.edit108:setFontSize(30);
    obj.edit108:setFontColor("#000000");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(0);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(69);
    obj.edit108:setHeight(71);
    obj.edit108:setField("Atk_Furt");
    obj.edit108:setName("edit108");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle2);
    obj.layout109:setLeft(1020);
    obj.layout109:setTop(141);
    obj.layout109:setWidth(69);
    obj.layout109:setHeight(70);
    obj.layout109:setName("layout109");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout109);
    obj.edit109:setTransparent(true);
    obj.edit109:setFontSize(30);
    obj.edit109:setFontColor("#000000");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setLeft(0);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(69);
    obj.edit109:setHeight(71);
    obj.edit109:setField("Dx1");
    obj.edit109:setName("edit109");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle2);
    obj.layout110:setLeft(1019);
    obj.layout110:setTop(219);
    obj.layout110:setWidth(69);
    obj.layout110:setHeight(70);
    obj.layout110:setName("layout110");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout110);
    obj.edit110:setTransparent(true);
    obj.edit110:setFontSize(30);
    obj.edit110:setFontColor("#000000");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setLeft(0);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(69);
    obj.edit110:setHeight(71);
    obj.edit110:setField("Dx2");
    obj.edit110:setName("edit110");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle2);
    obj.layout111:setLeft(101);
    obj.layout111:setTop(414);
    obj.layout111:setWidth(238);
    obj.layout111:setHeight(39);
    obj.layout111:setName("layout111");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout111);
    obj.edit111:setTransparent(true);
    obj.edit111:setFontSize(20);
    obj.edit111:setFontColor("#000000");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setLeft(0);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(238);
    obj.edit111:setHeight(40);
    obj.edit111:setField("_8");
    obj.edit111:setName("edit111");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle2);
    obj.layout112:setLeft(101);
    obj.layout112:setTop(455);
    obj.layout112:setWidth(238);
    obj.layout112:setHeight(39);
    obj.layout112:setName("layout112");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout112);
    obj.edit112:setTransparent(true);
    obj.edit112:setFontSize(20);
    obj.edit112:setFontColor("#000000");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setLeft(0);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(238);
    obj.edit112:setHeight(40);
    obj.edit112:setField("_9");
    obj.edit112:setName("edit112");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle2);
    obj.layout113:setLeft(101);
    obj.layout113:setTop(496);
    obj.layout113:setWidth(238);
    obj.layout113:setHeight(39);
    obj.layout113:setName("layout113");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout113);
    obj.edit113:setTransparent(true);
    obj.edit113:setFontSize(20);
    obj.edit113:setFontColor("#000000");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setLeft(0);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(238);
    obj.edit113:setHeight(40);
    obj.edit113:setField("_10");
    obj.edit113:setName("edit113");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle2);
    obj.layout114:setLeft(101);
    obj.layout114:setTop(536);
    obj.layout114:setWidth(238);
    obj.layout114:setHeight(39);
    obj.layout114:setName("layout114");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout114);
    obj.edit114:setTransparent(true);
    obj.edit114:setFontSize(20);
    obj.edit114:setFontColor("#000000");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setLeft(0);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(238);
    obj.edit114:setHeight(40);
    obj.edit114:setField("_11");
    obj.edit114:setName("edit114");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle2);
    obj.layout115:setLeft(101);
    obj.layout115:setTop(577);
    obj.layout115:setWidth(238);
    obj.layout115:setHeight(39);
    obj.layout115:setName("layout115");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout115);
    obj.edit115:setTransparent(true);
    obj.edit115:setFontSize(20);
    obj.edit115:setFontColor("#000000");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setLeft(0);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(238);
    obj.edit115:setHeight(40);
    obj.edit115:setField("_12");
    obj.edit115:setName("edit115");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle2);
    obj.layout116:setLeft(101);
    obj.layout116:setTop(618);
    obj.layout116:setWidth(238);
    obj.layout116:setHeight(39);
    obj.layout116:setName("layout116");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout116);
    obj.edit116:setTransparent(true);
    obj.edit116:setFontSize(20);
    obj.edit116:setFontColor("#000000");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setLeft(0);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(238);
    obj.edit116:setHeight(40);
    obj.edit116:setField("_13");
    obj.edit116:setName("edit116");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle2);
    obj.layout117:setLeft(101);
    obj.layout117:setTop(659);
    obj.layout117:setWidth(238);
    obj.layout117:setHeight(39);
    obj.layout117:setName("layout117");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout117);
    obj.edit117:setTransparent(true);
    obj.edit117:setFontSize(20);
    obj.edit117:setFontColor("#000000");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(0);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(238);
    obj.edit117:setHeight(40);
    obj.edit117:setField("_14");
    obj.edit117:setName("edit117");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle2);
    obj.layout118:setLeft(101);
    obj.layout118:setTop(700);
    obj.layout118:setWidth(238);
    obj.layout118:setHeight(39);
    obj.layout118:setName("layout118");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout118);
    obj.edit118:setTransparent(true);
    obj.edit118:setFontSize(20);
    obj.edit118:setFontColor("#000000");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(0);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(238);
    obj.edit118:setHeight(40);
    obj.edit118:setField("_15");
    obj.edit118:setName("edit118");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle2);
    obj.layout119:setLeft(101);
    obj.layout119:setTop(741);
    obj.layout119:setWidth(238);
    obj.layout119:setHeight(39);
    obj.layout119:setName("layout119");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout119);
    obj.edit119:setTransparent(true);
    obj.edit119:setFontSize(20);
    obj.edit119:setFontColor("#000000");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(0);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(238);
    obj.edit119:setHeight(40);
    obj.edit119:setField("_16");
    obj.edit119:setName("edit119");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle2);
    obj.layout120:setLeft(101);
    obj.layout120:setTop(782);
    obj.layout120:setWidth(238);
    obj.layout120:setHeight(39);
    obj.layout120:setName("layout120");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout120);
    obj.edit120:setTransparent(true);
    obj.edit120:setFontSize(20);
    obj.edit120:setFontColor("#000000");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(0);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(238);
    obj.edit120:setHeight(40);
    obj.edit120:setField("_17");
    obj.edit120:setName("edit120");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle2);
    obj.layout121:setLeft(101);
    obj.layout121:setTop(823);
    obj.layout121:setWidth(238);
    obj.layout121:setHeight(39);
    obj.layout121:setName("layout121");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout121);
    obj.edit121:setTransparent(true);
    obj.edit121:setFontSize(20);
    obj.edit121:setFontColor("#000000");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(0);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(238);
    obj.edit121:setHeight(40);
    obj.edit121:setField("_18");
    obj.edit121:setName("edit121");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle2);
    obj.layout122:setLeft(101);
    obj.layout122:setTop(863);
    obj.layout122:setWidth(238);
    obj.layout122:setHeight(39);
    obj.layout122:setName("layout122");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout122);
    obj.edit122:setTransparent(true);
    obj.edit122:setFontSize(20);
    obj.edit122:setFontColor("#000000");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(0);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(238);
    obj.edit122:setHeight(40);
    obj.edit122:setField("_19");
    obj.edit122:setName("edit122");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle2);
    obj.layout123:setLeft(101);
    obj.layout123:setTop(904);
    obj.layout123:setWidth(238);
    obj.layout123:setHeight(39);
    obj.layout123:setName("layout123");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout123);
    obj.edit123:setTransparent(true);
    obj.edit123:setFontSize(20);
    obj.edit123:setFontColor("#000000");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(0);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(238);
    obj.edit123:setHeight(40);
    obj.edit123:setField("_20");
    obj.edit123:setName("edit123");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle2);
    obj.layout124:setLeft(353);
    obj.layout124:setTop(128);
    obj.layout124:setWidth(62);
    obj.layout124:setHeight(39);
    obj.layout124:setName("layout124");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout124);
    obj.edit124:setTransparent(true);
    obj.edit124:setFontSize(20);
    obj.edit124:setFontColor("#000000");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(0);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(62);
    obj.edit124:setHeight(40);
    obj.edit124:setField("_1_9");
    obj.edit124:setName("edit124");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle2);
    obj.layout125:setLeft(353);
    obj.layout125:setTop(169);
    obj.layout125:setWidth(62);
    obj.layout125:setHeight(39);
    obj.layout125:setName("layout125");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout125);
    obj.edit125:setTransparent(true);
    obj.edit125:setFontSize(20);
    obj.edit125:setFontColor("#000000");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(0);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(62);
    obj.edit125:setHeight(40);
    obj.edit125:setField("_2_8");
    obj.edit125:setName("edit125");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle2);
    obj.layout126:setLeft(353);
    obj.layout126:setTop(210);
    obj.layout126:setWidth(62);
    obj.layout126:setHeight(39);
    obj.layout126:setName("layout126");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout126);
    obj.edit126:setTransparent(true);
    obj.edit126:setFontSize(20);
    obj.edit126:setFontColor("#000000");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(0);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(62);
    obj.edit126:setHeight(40);
    obj.edit126:setField("_3_7");
    obj.edit126:setName("edit126");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle2);
    obj.layout127:setLeft(353);
    obj.layout127:setTop(251);
    obj.layout127:setWidth(62);
    obj.layout127:setHeight(39);
    obj.layout127:setName("layout127");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout127);
    obj.edit127:setTransparent(true);
    obj.edit127:setFontSize(20);
    obj.edit127:setFontColor("#000000");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(0);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(62);
    obj.edit127:setHeight(40);
    obj.edit127:setField("_4_7");
    obj.edit127:setName("edit127");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle2);
    obj.layout128:setLeft(353);
    obj.layout128:setTop(332);
    obj.layout128:setWidth(62);
    obj.layout128:setHeight(39);
    obj.layout128:setName("layout128");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout128);
    obj.edit128:setTransparent(true);
    obj.edit128:setFontSize(20);
    obj.edit128:setFontColor("#000000");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(0);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(62);
    obj.edit128:setHeight(40);
    obj.edit128:setField("_6_4");
    obj.edit128:setName("edit128");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle2);
    obj.layout129:setLeft(353);
    obj.layout129:setTop(373);
    obj.layout129:setWidth(62);
    obj.layout129:setHeight(39);
    obj.layout129:setName("layout129");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout129);
    obj.edit129:setTransparent(true);
    obj.edit129:setFontSize(20);
    obj.edit129:setFontColor("#000000");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(0);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(62);
    obj.edit129:setHeight(40);
    obj.edit129:setField("_7_3");
    obj.edit129:setName("edit129");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle2);
    obj.layout130:setLeft(353);
    obj.layout130:setTop(414);
    obj.layout130:setWidth(62);
    obj.layout130:setHeight(39);
    obj.layout130:setName("layout130");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout130);
    obj.edit130:setTransparent(true);
    obj.edit130:setFontSize(20);
    obj.edit130:setFontColor("#000000");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(0);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(62);
    obj.edit130:setHeight(40);
    obj.edit130:setField("_8_2");
    obj.edit130:setName("edit130");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle2);
    obj.layout131:setLeft(353);
    obj.layout131:setTop(455);
    obj.layout131:setWidth(62);
    obj.layout131:setHeight(39);
    obj.layout131:setName("layout131");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout131);
    obj.edit131:setTransparent(true);
    obj.edit131:setFontSize(20);
    obj.edit131:setFontColor("#000000");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(0);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(62);
    obj.edit131:setHeight(40);
    obj.edit131:setField("_9_2");
    obj.edit131:setName("edit131");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle2);
    obj.layout132:setLeft(353);
    obj.layout132:setTop(496);
    obj.layout132:setWidth(62);
    obj.layout132:setHeight(39);
    obj.layout132:setName("layout132");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout132);
    obj.edit132:setTransparent(true);
    obj.edit132:setFontSize(20);
    obj.edit132:setFontColor("#000000");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(0);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(62);
    obj.edit132:setHeight(40);
    obj.edit132:setField("_10_2");
    obj.edit132:setName("edit132");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle2);
    obj.layout133:setLeft(353);
    obj.layout133:setTop(536);
    obj.layout133:setWidth(62);
    obj.layout133:setHeight(39);
    obj.layout133:setName("layout133");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout133);
    obj.edit133:setTransparent(true);
    obj.edit133:setFontSize(20);
    obj.edit133:setFontColor("#000000");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setLeft(0);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(62);
    obj.edit133:setHeight(40);
    obj.edit133:setField("_11_2");
    obj.edit133:setName("edit133");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle2);
    obj.layout134:setLeft(353);
    obj.layout134:setTop(577);
    obj.layout134:setWidth(62);
    obj.layout134:setHeight(39);
    obj.layout134:setName("layout134");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout134);
    obj.edit134:setTransparent(true);
    obj.edit134:setFontSize(20);
    obj.edit134:setFontColor("#000000");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setLeft(0);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(62);
    obj.edit134:setHeight(40);
    obj.edit134:setField("undefined_17");
    obj.edit134:setName("edit134");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle2);
    obj.layout135:setLeft(353);
    obj.layout135:setTop(618);
    obj.layout135:setWidth(62);
    obj.layout135:setHeight(39);
    obj.layout135:setName("layout135");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout135);
    obj.edit135:setTransparent(true);
    obj.edit135:setFontSize(20);
    obj.edit135:setFontColor("#000000");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(0);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(62);
    obj.edit135:setHeight(40);
    obj.edit135:setField("_1_10");
    obj.edit135:setName("edit135");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle2);
    obj.layout136:setLeft(353);
    obj.layout136:setTop(659);
    obj.layout136:setWidth(62);
    obj.layout136:setHeight(39);
    obj.layout136:setName("layout136");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout136);
    obj.edit136:setTransparent(true);
    obj.edit136:setFontSize(20);
    obj.edit136:setFontColor("#000000");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(0);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(62);
    obj.edit136:setHeight(40);
    obj.edit136:setField("_2_9");
    obj.edit136:setName("edit136");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle2);
    obj.layout137:setLeft(353);
    obj.layout137:setTop(700);
    obj.layout137:setWidth(62);
    obj.layout137:setHeight(39);
    obj.layout137:setName("layout137");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout137);
    obj.edit137:setTransparent(true);
    obj.edit137:setFontSize(20);
    obj.edit137:setFontColor("#000000");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(0);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(62);
    obj.edit137:setHeight(40);
    obj.edit137:setField("_3_8");
    obj.edit137:setName("edit137");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle2);
    obj.layout138:setLeft(353);
    obj.layout138:setTop(741);
    obj.layout138:setWidth(62);
    obj.layout138:setHeight(39);
    obj.layout138:setName("layout138");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout138);
    obj.edit138:setTransparent(true);
    obj.edit138:setFontSize(20);
    obj.edit138:setFontColor("#000000");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(0);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(62);
    obj.edit138:setHeight(40);
    obj.edit138:setField("_4_8");
    obj.edit138:setName("edit138");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle2);
    obj.layout139:setLeft(353);
    obj.layout139:setTop(782);
    obj.layout139:setWidth(62);
    obj.layout139:setHeight(39);
    obj.layout139:setName("layout139");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout139);
    obj.edit139:setTransparent(true);
    obj.edit139:setFontSize(20);
    obj.edit139:setFontColor("#000000");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(0);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(62);
    obj.edit139:setHeight(40);
    obj.edit139:setField("undefined_20");
    obj.edit139:setName("edit139");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle2);
    obj.layout140:setLeft(353);
    obj.layout140:setTop(823);
    obj.layout140:setWidth(62);
    obj.layout140:setHeight(39);
    obj.layout140:setName("layout140");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout140);
    obj.edit140:setTransparent(true);
    obj.edit140:setFontSize(20);
    obj.edit140:setFontColor("#000000");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setLeft(0);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(62);
    obj.edit140:setHeight(40);
    obj.edit140:setField("_1_12");
    obj.edit140:setName("edit140");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle2);
    obj.layout141:setLeft(819);
    obj.layout141:setTop(805);
    obj.layout141:setWidth(87);
    obj.layout141:setHeight(72);
    obj.layout141:setName("layout141");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout141);
    obj.edit141:setTransparent(true);
    obj.edit141:setFontSize(40);
    obj.edit141:setFontColor("#000000");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setLeft(0);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(87);
    obj.edit141:setHeight(73);
    obj.edit141:setField("DV1__0");
    obj.edit141:setName("edit141");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle2);
    obj.layout142:setLeft(993);
    obj.layout142:setTop(805);
    obj.layout142:setWidth(87);
    obj.layout142:setHeight(72);
    obj.layout142:setName("layout142");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout142);
    obj.edit142:setTransparent(true);
    obj.edit142:setFontSize(40);
    obj.edit142:setFontColor("#000000");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setLeft(0);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(87);
    obj.edit142:setHeight(73);
    obj.edit142:setField("DV1__1");
    obj.edit142:setName("edit142");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle2);
    obj.layout143:setLeft(353);
    obj.layout143:setTop(863);
    obj.layout143:setWidth(62);
    obj.layout143:setHeight(39);
    obj.layout143:setName("layout143");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout143);
    obj.edit143:setTransparent(true);
    obj.edit143:setFontSize(20);
    obj.edit143:setFontColor("#000000");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setLeft(0);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(62);
    obj.edit143:setHeight(40);
    obj.edit143:setField("_2_11");
    obj.edit143:setName("edit143");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle2);
    obj.layout144:setLeft(353);
    obj.layout144:setTop(904);
    obj.layout144:setWidth(62);
    obj.layout144:setHeight(39);
    obj.layout144:setName("layout144");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout144);
    obj.edit144:setTransparent(true);
    obj.edit144:setFontSize(20);
    obj.edit144:setFontColor("#000000");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setLeft(0);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(62);
    obj.edit144:setHeight(40);
    obj.edit144:setField("_3_9");
    obj.edit144:setName("edit144");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle2);
    obj.layout145:setLeft(820);
    obj.layout145:setTop(883);
    obj.layout145:setWidth(87);
    obj.layout145:setHeight(72);
    obj.layout145:setName("layout145");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout145);
    obj.edit145:setTransparent(true);
    obj.edit145:setFontSize(40);
    obj.edit145:setFontColor("#000000");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setLeft(0);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(87);
    obj.edit145:setHeight(73);
    obj.edit145:setField("DV1__2");
    obj.edit145:setName("edit145");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.rectangle2);
    obj.layout146:setLeft(994);
    obj.layout146:setTop(882);
    obj.layout146:setWidth(87);
    obj.layout146:setHeight(72);
    obj.layout146:setName("layout146");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout146);
    obj.edit146:setTransparent(true);
    obj.edit146:setFontSize(40);
    obj.edit146:setFontColor("#000000");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setLeft(0);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(87);
    obj.edit146:setHeight(73);
    obj.edit146:setField("DV1__3");
    obj.edit146:setName("edit146");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.rectangle2);
    obj.layout147:setLeft(175);
    obj.layout147:setTop(966);
    obj.layout147:setWidth(71);
    obj.layout147:setHeight(66);
    obj.layout147:setName("layout147");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout147);
    obj.edit147:setTransparent(true);
    obj.edit147:setFontSize(20);
    obj.edit147:setFontColor("#000000");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setLeft(0);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(71);
    obj.edit147:setHeight(67);
    obj.edit147:setField("Leve");
    obj.edit147:setName("edit147");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle2);
    obj.layout148:setLeft(259);
    obj.layout148:setTop(966);
    obj.layout148:setWidth(71);
    obj.layout148:setHeight(66);
    obj.layout148:setName("layout148");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout148);
    obj.edit148:setTransparent(true);
    obj.edit148:setFontSize(20);
    obj.edit148:setFontColor("#000000");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setLeft(0);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(71);
    obj.edit148:setHeight(67);
    obj.edit148:setField("Média");
    obj.edit148:setName("edit148");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle2);
    obj.layout149:setLeft(344);
    obj.layout149:setTop(966);
    obj.layout149:setWidth(71);
    obj.layout149:setHeight(66);
    obj.layout149:setName("layout149");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout149);
    obj.edit149:setTransparent(true);
    obj.edit149:setFontSize(20);
    obj.edit149:setFontColor("#000000");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setLeft(0);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(71);
    obj.edit149:setHeight(67);
    obj.edit149:setField("Pesada");
    obj.edit149:setName("edit149");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle2);
    obj.layout150:setLeft(819);
    obj.layout150:setTop(960);
    obj.layout150:setWidth(87);
    obj.layout150:setHeight(72);
    obj.layout150:setName("layout150");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout150);
    obj.edit150:setTransparent(true);
    obj.edit150:setFontSize(40);
    obj.edit150:setFontColor("#000000");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setLeft(0);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(87);
    obj.edit150:setHeight(73);
    obj.edit150:setField("DV1__4");
    obj.edit150:setName("edit150");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.rectangle2);
    obj.layout151:setLeft(994);
    obj.layout151:setTop(960);
    obj.layout151:setWidth(87);
    obj.layout151:setHeight(72);
    obj.layout151:setName("layout151");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout151);
    obj.edit151:setTransparent(true);
    obj.edit151:setFontSize(40);
    obj.edit151:setFontColor("#000000");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setLeft(0);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(87);
    obj.edit151:setHeight(73);
    obj.edit151:setField("DV1__5");
    obj.edit151:setName("edit151");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.rectangle2);
    obj.layout152:setLeft(820);
    obj.layout152:setTop(1038);
    obj.layout152:setWidth(87);
    obj.layout152:setHeight(72);
    obj.layout152:setName("layout152");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout152);
    obj.edit152:setTransparent(true);
    obj.edit152:setFontSize(40);
    obj.edit152:setFontColor("#000000");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setLeft(0);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(87);
    obj.edit152:setHeight(73);
    obj.edit152:setField("DV1__6");
    obj.edit152:setName("edit152");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle2);
    obj.layout153:setLeft(994);
    obj.layout153:setTop(1037);
    obj.layout153:setWidth(87);
    obj.layout153:setHeight(72);
    obj.layout153:setName("layout153");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout153);
    obj.edit153:setTransparent(true);
    obj.edit153:setFontSize(40);
    obj.edit153:setFontColor("#000000");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setLeft(0);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(87);
    obj.edit153:setHeight(73);
    obj.edit153:setField("DV1__7");
    obj.edit153:setName("edit153");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.rectangle2);
    obj.layout154:setLeft(101);
    obj.layout154:setTop(1139);
    obj.layout154:setWidth(314);
    obj.layout154:setHeight(124);
    obj.layout154:setName("layout154");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout154);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(314);
    obj.textEditor1:setHeight(124);
    obj.textEditor1:setFontSize(20);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Dinheiro");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.rectangle2);
    obj.layout155:setLeft(819);
    obj.layout155:setTop(1115);
    obj.layout155:setWidth(87);
    obj.layout155:setHeight(72);
    obj.layout155:setName("layout155");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout155);
    obj.edit154:setTransparent(true);
    obj.edit154:setFontSize(40);
    obj.edit154:setFontColor("#000000");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(0);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(87);
    obj.edit154:setHeight(73);
    obj.edit154:setField("DV1__8");
    obj.edit154:setName("edit154");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.rectangle2);
    obj.layout156:setLeft(994);
    obj.layout156:setTop(1115);
    obj.layout156:setWidth(87);
    obj.layout156:setHeight(72);
    obj.layout156:setName("layout156");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout156);
    obj.edit155:setTransparent(true);
    obj.edit155:setFontSize(40);
    obj.edit155:setFontColor("#000000");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(0);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(87);
    obj.edit155:setHeight(73);
    obj.edit155:setField("DV1__9");
    obj.edit155:setName("edit155");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.rectangle2);
    obj.layout157:setLeft(818);
    obj.layout157:setTop(1192);
    obj.layout157:setWidth(87);
    obj.layout157:setHeight(72);
    obj.layout157:setName("layout157");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout157);
    obj.edit156:setTransparent(true);
    obj.edit156:setFontSize(40);
    obj.edit156:setFontColor("#000000");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(0);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(87);
    obj.edit156:setHeight(73);
    obj.edit156:setField("DV1__10");
    obj.edit156:setName("edit156");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.rectangle2);
    obj.layout158:setLeft(994);
    obj.layout158:setTop(1192);
    obj.layout158:setWidth(87);
    obj.layout158:setHeight(72);
    obj.layout158:setName("layout158");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout158);
    obj.edit157:setTransparent(true);
    obj.edit157:setFontSize(40);
    obj.edit157:setFontColor("#000000");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(0);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(87);
    obj.edit157:setHeight(73);
    obj.edit157:setField("DV1__11");
    obj.edit157:setName("edit157");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.rectangle2);
    obj.layout159:setLeft(819);
    obj.layout159:setTop(1270);
    obj.layout159:setWidth(87);
    obj.layout159:setHeight(72);
    obj.layout159:setName("layout159");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout159);
    obj.edit158:setTransparent(true);
    obj.edit158:setFontSize(40);
    obj.edit158:setFontColor("#000000");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(0);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(87);
    obj.edit158:setHeight(73);
    obj.edit158:setField("DV1__12");
    obj.edit158:setName("edit158");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.rectangle2);
    obj.layout160:setLeft(994);
    obj.layout160:setTop(1270);
    obj.layout160:setWidth(87);
    obj.layout160:setHeight(72);
    obj.layout160:setName("layout160");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout160);
    obj.edit159:setTransparent(true);
    obj.edit159:setFontSize(40);
    obj.edit159:setFontColor("#000000");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(0);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(87);
    obj.edit159:setHeight(73);
    obj.edit159:setField("DV1__13");
    obj.edit159:setName("edit159");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.rectangle2);
    obj.layout161:setLeft(819);
    obj.layout161:setTop(1345);
    obj.layout161:setWidth(87);
    obj.layout161:setHeight(72);
    obj.layout161:setName("layout161");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout161);
    obj.edit160:setTransparent(true);
    obj.edit160:setFontSize(40);
    obj.edit160:setFontColor("#000000");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(0);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(87);
    obj.edit160:setHeight(73);
    obj.edit160:setField("DV1__14");
    obj.edit160:setName("edit160");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.rectangle2);
    obj.layout162:setLeft(994);
    obj.layout162:setTop(1347);
    obj.layout162:setWidth(87);
    obj.layout162:setHeight(72);
    obj.layout162:setName("layout162");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout162);
    obj.edit161:setTransparent(true);
    obj.edit161:setFontSize(40);
    obj.edit161:setFontColor("#000000");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setLeft(0);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(87);
    obj.edit161:setHeight(73);
    obj.edit161:setField("DV1__15");
    obj.edit161:setName("edit161");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.rectangle2);
    obj.layout163:setLeft(819);
    obj.layout163:setTop(1425);
    obj.layout163:setWidth(87);
    obj.layout163:setHeight(72);
    obj.layout163:setName("layout163");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout163);
    obj.edit162:setTransparent(true);
    obj.edit162:setFontSize(40);
    obj.edit162:setFontColor("#000000");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setLeft(0);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(87);
    obj.edit162:setHeight(73);
    obj.edit162:setField("DV1__16");
    obj.edit162:setName("edit162");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.rectangle2);
    obj.layout164:setLeft(994);
    obj.layout164:setTop(1425);
    obj.layout164:setWidth(87);
    obj.layout164:setHeight(72);
    obj.layout164:setName("layout164");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout164);
    obj.edit163:setTransparent(true);
    obj.edit163:setFontSize(40);
    obj.edit163:setFontColor("#000000");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setLeft(0);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(87);
    obj.edit163:setHeight(73);
    obj.edit163:setField("DV1__17");
    obj.edit163:setName("edit163");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.rectangle2);
    obj.layout165:setLeft(948);
    obj.layout165:setTop(1514);
    obj.layout165:setWidth(142);
    obj.layout165:setHeight(79);
    obj.layout165:setName("layout165");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout165);
    obj.edit164:setTransparent(true);
    obj.edit164:setFontSize(40);
    obj.edit164:setFontColor("#000000");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setLeft(0);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(142);
    obj.edit164:setHeight(80);
    obj.edit164:setField("Mor_Viv_Afas");
    obj.edit164:setName("edit164");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.rectangle2);
    obj.layout166:setLeft(456);
    obj.layout166:setTop(622);
    obj.layout166:setWidth(278);
    obj.layout166:setHeight(114);
    obj.layout166:setName("layout166");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout166);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(24);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(278);
    obj.textEditor2:setHeight(115);
    obj.textEditor2:setField("Domínio");
    obj.textEditor2:setName("textEditor2");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.rectangle2);
    obj.layout167:setLeft(433);
    obj.layout167:setTop(828);
    obj.layout167:setWidth(343);
    obj.layout167:setHeight(136);
    obj.layout167:setName("layout167");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout167);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontSize(24);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(343);
    obj.textEditor3:setHeight(137);
    obj.textEditor3:setField("Esp5");
    obj.textEditor3:setName("textEditor3");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.rectangle2);
    obj.layout168:setLeft(434);
    obj.layout168:setTop(993);
    obj.layout168:setWidth(343);
    obj.layout168:setHeight(136);
    obj.layout168:setName("layout168");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout168);
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setFontSize(24);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(343);
    obj.textEditor4:setHeight(137);
    obj.textEditor4:setField("Esp8");
    obj.textEditor4:setName("textEditor4");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.rectangle2);
    obj.layout169:setLeft(433);
    obj.layout169:setTop(1153);
    obj.layout169:setWidth(343);
    obj.layout169:setHeight(136);
    obj.layout169:setName("layout169");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout169);
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setFontSize(24);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(343);
    obj.textEditor5:setHeight(137);
    obj.textEditor5:setField("Esp16");
    obj.textEditor5:setName("textEditor5");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.rectangle2);
    obj.layout170:setLeft(85);
    obj.layout170:setTop(1347);
    obj.layout170:setWidth(676);
    obj.layout170:setHeight(309);
    obj.layout170:setName("layout170");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout170);
    obj.richEdit1:setLeft(0);
    obj.richEdit1:setTop(0);
    obj.richEdit1:setWidth(676);
    obj.richEdit1:setHeight(290);
    obj.richEdit1:setField("CarENot");
    obj.richEdit1:setName("richEdit1");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Background e Mochila");
    obj.tab3:setName("tab3");

    obj.frmOD3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmOD3_svg:setParent(obj.tab3);
    obj.frmOD3_svg:setName("frmOD3_svg");
    obj.frmOD3_svg:setAlign("client");
    obj.frmOD3_svg:setTheme("light");
    obj.frmOD3_svg:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmOD3_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox3);
    obj.rectangle3:setWidth(1190);
    obj.rectangle3:setHeight(1684);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle3);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(1190);
    obj.image3:setHeight(1684);
    obj.image3:setSRC("/OD/images/3.png");
    obj.image3:setStyle("stretch");
    obj.image3:setOptimize(true);
    obj.image3:setName("image3");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.rectangle3);
    obj.layout171:setLeft(465);
    obj.layout171:setTop(176);
    obj.layout171:setWidth(661);
    obj.layout171:setHeight(444);
    obj.layout171:setName("layout171");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout171);
    obj.richEdit2:setLeft(0);
    obj.richEdit2:setTop(0);
    obj.richEdit2:setWidth(661);
    obj.richEdit2:setHeight(444);
    obj.richEdit2:setField("His_Per");
    obj.richEdit2:setName("richEdit2");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle3);
    obj.image4:setField("Aparen");
    obj.image4:setEditable(true);
    obj.image4:setStyle("autoFit");
    obj.image4:setLeft(29);
    obj.image4:setTop(267);
    obj.image4:setWidth(421);
    obj.image4:setHeight(368);
    obj.image4:setName("image4");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.rectangle3);
    obj.layout172:setLeft(34);
    obj.layout172:setTop(702);
    obj.layout172:setWidth(1096);
    obj.layout172:setHeight(856);
    obj.layout172:setName("layout172");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.layout172);
    obj.richEdit3:setLeft(0);
    obj.richEdit3:setTop(0);
    obj.richEdit3:setWidth(1096);
    obj.richEdit3:setHeight(856);
    obj.richEdit3:setField("Inv");
    obj.richEdit3:setName("richEdit3");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Magias");
    obj.tab4:setName("tab4");

    obj.frmOD5_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmOD5_svg:setParent(obj.tab4);
    obj.frmOD5_svg:setName("frmOD5_svg");
    obj.frmOD5_svg:setAlign("client");
    obj.frmOD5_svg:setTheme("light");
    obj.frmOD5_svg:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmOD5_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox4);
    obj.rectangle4:setWidth(1191);
    obj.rectangle4:setHeight(1684);
    obj.rectangle4:setColor("white");
    obj.rectangle4:setName("rectangle4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle4);
    obj.image5:setLeft(0);
    obj.image5:setTop(0);
    obj.image5:setWidth(1191);
    obj.image5:setHeight(1684);
    obj.image5:setSRC("/OD/images/m.png");
    obj.image5:setStyle("stretch");
    obj.image5:setOptimize(true);
    obj.image5:setName("image5");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.rectangle4);
    obj.layout173:setLeft(52);
    obj.layout173:setTop(139);
    obj.layout173:setWidth(62);
    obj.layout173:setHeight(55);
    obj.layout173:setName("layout173");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout173);
    obj.edit165:setTransparent(true);
    obj.edit165:setFontSize(30);
    obj.edit165:setFontColor("#000000");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setLeft(0);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(62);
    obj.edit165:setHeight(56);
    obj.edit165:setField("_1_0_0");
    obj.edit165:setName("edit165");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.rectangle4);
    obj.layout174:setLeft(121);
    obj.layout174:setTop(139);
    obj.layout174:setWidth(62);
    obj.layout174:setHeight(55);
    obj.layout174:setName("layout174");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout174);
    obj.edit166:setTransparent(true);
    obj.edit166:setFontSize(30);
    obj.edit166:setFontColor("#000000");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setLeft(0);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(62);
    obj.edit166:setHeight(56);
    obj.edit166:setField("_1_0_1");
    obj.edit166:setName("edit166");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.rectangle4);
    obj.layout175:setLeft(191);
    obj.layout175:setTop(139);
    obj.layout175:setWidth(62);
    obj.layout175:setHeight(55);
    obj.layout175:setName("layout175");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout175);
    obj.edit167:setTransparent(true);
    obj.edit167:setFontSize(30);
    obj.edit167:setFontColor("#000000");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setLeft(0);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(62);
    obj.edit167:setHeight(56);
    obj.edit167:setField("_1_0_2");
    obj.edit167:setName("edit167");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.rectangle4);
    obj.layout176:setLeft(260);
    obj.layout176:setTop(139);
    obj.layout176:setWidth(62);
    obj.layout176:setHeight(55);
    obj.layout176:setName("layout176");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout176);
    obj.edit168:setTransparent(true);
    obj.edit168:setFontSize(30);
    obj.edit168:setFontColor("#000000");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setLeft(0);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(62);
    obj.edit168:setHeight(56);
    obj.edit168:setField("_1_0_3");
    obj.edit168:setName("edit168");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.rectangle4);
    obj.layout177:setLeft(330);
    obj.layout177:setTop(139);
    obj.layout177:setWidth(62);
    obj.layout177:setHeight(55);
    obj.layout177:setName("layout177");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout177);
    obj.edit169:setTransparent(true);
    obj.edit169:setFontSize(30);
    obj.edit169:setFontColor("#000000");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setLeft(0);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(62);
    obj.edit169:setHeight(56);
    obj.edit169:setField("_1_0_4");
    obj.edit169:setName("edit169");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.rectangle4);
    obj.layout178:setLeft(399);
    obj.layout178:setTop(139);
    obj.layout178:setWidth(62);
    obj.layout178:setHeight(55);
    obj.layout178:setName("layout178");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout178);
    obj.edit170:setTransparent(true);
    obj.edit170:setFontSize(30);
    obj.edit170:setFontColor("#000000");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setLeft(0);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(62);
    obj.edit170:setHeight(56);
    obj.edit170:setField("_1_0_5");
    obj.edit170:setName("edit170");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.rectangle4);
    obj.layout179:setLeft(468);
    obj.layout179:setTop(139);
    obj.layout179:setWidth(62);
    obj.layout179:setHeight(55);
    obj.layout179:setName("layout179");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout179);
    obj.edit171:setTransparent(true);
    obj.edit171:setFontSize(30);
    obj.edit171:setFontColor("#000000");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setLeft(0);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(62);
    obj.edit171:setHeight(56);
    obj.edit171:setField("_1_0_6");
    obj.edit171:setName("edit171");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.rectangle4);
    obj.layout180:setLeft(538);
    obj.layout180:setTop(139);
    obj.layout180:setWidth(62);
    obj.layout180:setHeight(55);
    obj.layout180:setName("layout180");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout180);
    obj.edit172:setTransparent(true);
    obj.edit172:setFontSize(30);
    obj.edit172:setFontColor("#000000");
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setLeft(0);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(62);
    obj.edit172:setHeight(56);
    obj.edit172:setField("_1_0_7");
    obj.edit172:setName("edit172");

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.rectangle4);
    obj.layout181:setLeft(607);
    obj.layout181:setTop(139);
    obj.layout181:setWidth(62);
    obj.layout181:setHeight(55);
    obj.layout181:setName("layout181");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout181);
    obj.edit173:setTransparent(true);
    obj.edit173:setFontSize(30);
    obj.edit173:setFontColor("#000000");
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(0);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(62);
    obj.edit173:setHeight(56);
    obj.edit173:setField("_1_0_8");
    obj.edit173:setName("edit173");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.rectangle4);
    obj.layout182:setLeft(52);
    obj.layout182:setTop(217);
    obj.layout182:setWidth(62);
    obj.layout182:setHeight(55);
    obj.layout182:setName("layout182");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout182);
    obj.edit174:setTransparent(true);
    obj.edit174:setFontSize(30);
    obj.edit174:setFontColor("#000000");
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setLeft(0);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(62);
    obj.edit174:setHeight(56);
    obj.edit174:setField("_1_1_0");
    obj.edit174:setName("edit174");

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.rectangle4);
    obj.layout183:setLeft(121);
    obj.layout183:setTop(217);
    obj.layout183:setWidth(62);
    obj.layout183:setHeight(55);
    obj.layout183:setName("layout183");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout183);
    obj.edit175:setTransparent(true);
    obj.edit175:setFontSize(30);
    obj.edit175:setFontColor("#000000");
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setLeft(0);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(62);
    obj.edit175:setHeight(56);
    obj.edit175:setField("_1_1_1");
    obj.edit175:setName("edit175");

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.rectangle4);
    obj.layout184:setLeft(191);
    obj.layout184:setTop(217);
    obj.layout184:setWidth(62);
    obj.layout184:setHeight(55);
    obj.layout184:setName("layout184");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout184);
    obj.edit176:setTransparent(true);
    obj.edit176:setFontSize(30);
    obj.edit176:setFontColor("#000000");
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(0);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(62);
    obj.edit176:setHeight(56);
    obj.edit176:setField("_1_1_2");
    obj.edit176:setName("edit176");

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.rectangle4);
    obj.layout185:setLeft(260);
    obj.layout185:setTop(217);
    obj.layout185:setWidth(62);
    obj.layout185:setHeight(55);
    obj.layout185:setName("layout185");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout185);
    obj.edit177:setTransparent(true);
    obj.edit177:setFontSize(30);
    obj.edit177:setFontColor("#000000");
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(0);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(62);
    obj.edit177:setHeight(56);
    obj.edit177:setField("_1_1_3");
    obj.edit177:setName("edit177");

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.rectangle4);
    obj.layout186:setLeft(330);
    obj.layout186:setTop(217);
    obj.layout186:setWidth(62);
    obj.layout186:setHeight(55);
    obj.layout186:setName("layout186");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout186);
    obj.edit178:setTransparent(true);
    obj.edit178:setFontSize(30);
    obj.edit178:setFontColor("#000000");
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(0);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(62);
    obj.edit178:setHeight(56);
    obj.edit178:setField("_1_1_4");
    obj.edit178:setName("edit178");

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.rectangle4);
    obj.layout187:setLeft(399);
    obj.layout187:setTop(217);
    obj.layout187:setWidth(62);
    obj.layout187:setHeight(55);
    obj.layout187:setName("layout187");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout187);
    obj.edit179:setTransparent(true);
    obj.edit179:setFontSize(30);
    obj.edit179:setFontColor("#000000");
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(0);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(62);
    obj.edit179:setHeight(56);
    obj.edit179:setField("_1_1_5");
    obj.edit179:setName("edit179");

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.rectangle4);
    obj.layout188:setLeft(468);
    obj.layout188:setTop(217);
    obj.layout188:setWidth(62);
    obj.layout188:setHeight(55);
    obj.layout188:setName("layout188");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout188);
    obj.edit180:setTransparent(true);
    obj.edit180:setFontSize(30);
    obj.edit180:setFontColor("#000000");
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(0);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(62);
    obj.edit180:setHeight(56);
    obj.edit180:setField("_1_1_6");
    obj.edit180:setName("edit180");

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.rectangle4);
    obj.layout189:setLeft(538);
    obj.layout189:setTop(217);
    obj.layout189:setWidth(62);
    obj.layout189:setHeight(55);
    obj.layout189:setName("layout189");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout189);
    obj.edit181:setTransparent(true);
    obj.edit181:setFontSize(30);
    obj.edit181:setFontColor("#000000");
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(0);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(62);
    obj.edit181:setHeight(56);
    obj.edit181:setField("_1_1_7");
    obj.edit181:setName("edit181");

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.rectangle4);
    obj.layout190:setLeft(607);
    obj.layout190:setTop(217);
    obj.layout190:setWidth(62);
    obj.layout190:setHeight(55);
    obj.layout190:setName("layout190");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout190);
    obj.edit182:setTransparent(true);
    obj.edit182:setFontSize(30);
    obj.edit182:setFontColor("#000000");
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(0);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(62);
    obj.edit182:setHeight(56);
    obj.edit182:setField("_1_1_8");
    obj.edit182:setName("edit182");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle4);
    obj.scrollBox5:setWidth(1106);
    obj.scrollBox5:setHeight(1284);
    obj.scrollBox5:setTop(365);
    obj.scrollBox5:setName("scrollBox5");

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.scrollBox5);
    obj.layout191:setAlign("top");
    obj.layout191:setHeight(30);
    obj.layout191:setMargins({bottom=4});
    obj.layout191:setName("layout191");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout191);
    obj.button1:setText("Nova Magia");
    obj.button1:setWidth(190);
    obj.button1:setLeft(448);
    obj.button1:setName("button1");

    obj.rclListaDeMagia = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDeMagia:setParent(obj.scrollBox5);
    obj.rclListaDeMagia:setName("rclListaDeMagia");
    obj.rclListaDeMagia:setField("campoDasMagias");
    obj.rclListaDeMagia:setTemplateForm("frmMG");
    obj.rclListaDeMagia:setLeft(1);
    obj.rclListaDeMagia:setTop(40);
    obj.rclListaDeMagia:setHeight(60);
    obj.rclListaDeMagia:setWidth(1106);
    obj.rclListaDeMagia:setAutoHeight(true);

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmOD4_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmOD4_svg:setParent(obj.tab5);
    obj.frmOD4_svg:setName("frmOD4_svg");
    obj.frmOD4_svg:setAlign("client");
    obj.frmOD4_svg:setTheme("light");
    obj.frmOD4_svg:setMargins({top=1});

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmOD4_svg);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox6);
    obj.rectangle5:setWidth(1190);
    obj.rectangle5:setHeight(1684);
    obj.rectangle5:setColor("white");
    obj.rectangle5:setName("rectangle5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.rectangle5);
    obj.image6:setLeft(0);
    obj.image6:setTop(0);
    obj.image6:setWidth(1190);
    obj.image6:setHeight(1684);
    obj.image6:setSRC("/OD/images/4.png");
    obj.image6:setStyle("stretch");
    obj.image6:setOptimize(true);
    obj.image6:setName("image6");

    obj.layout192 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.rectangle5);
    obj.layout192:setLeft(82);
    obj.layout192:setTop(230);
    obj.layout192:setWidth(1014);
    obj.layout192:setHeight(1301);
    obj.layout192:setName("layout192");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.layout192);
    obj.richEdit4:setLeft(0);
    obj.richEdit4:setTop(0);
    obj.richEdit4:setWidth(1014);
    obj.richEdit4:setHeight(1301);
    obj.richEdit4:setField("Anot");
    obj.richEdit4:setName("richEdit4");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.FOR or 0) - 10) / 2);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.AFOR = mod;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.DES or 0) - 10) / 2);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.ADES = mod;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.CON or 0) - 10) / 2);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.ACON = mod;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = math.floor(((sheet.SAB or 0) - 10) / 2);
                                 
            
                                    if (mod >= 0) then
                                            mod = "+" .. mod;
                                    end;                       
            
                                    sheet.ASAB = mod;
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PVCon = (tonumber(sheet.ACON) or 0) *
                                         (math.floor(sheet.Nivel) or 1);                  
            
                           if sheet.PVCon >= 0 then
                                   sheet.PVCon = sheet.PVCon;
                           end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.CA = ((tonumber(sheet.ARMAD) or 0) + 10) +
                                          (tonumber(sheet.ESC) or 0) +
            							  (tonumber(sheet.RAC or 0) or 0) +
                                          (tonumber(sheet.ADES) or 0) +
            							  (tonumber(sheet.OUT) or 0) +
                                          (tonumber((sheet.OUT2) or 0));                  
            
                           if sheet.CA >= 0 then
                                   sheet.CA = sheet.CA;
                           end;
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.JPDes = (tonumber(sheet.JP or 0)) -
                                         (math.floor(sheet.ADES or 0));                  
            
                           if sheet.JPDes >= 0 then
                                   sheet.JPDes = sheet.JPDes;
                           end;
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.JPCon = (tonumber(sheet.JP or 0)) -
                                         (math.floor(sheet.ACON or 0));                  
            
                           if sheet.JPCon >= 0 then
                                   sheet.JPCon = sheet.JPCon;
                           end;
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.JPSab = (tonumber(sheet.JP or 0)) -
                                         (math.floor(sheet.ASAB or 0));                  
            
                           if sheet.JPSab >= 0 then
                                   sheet.JPSab = sheet.JPSab;
                           end;
        end, obj);

    obj._e_event9 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclListaDeMagia:append();
        end, obj);

    function obj:_releaseEvents()
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
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.rclListaDeMagia ~= nil then self.rclListaDeMagia:destroy(); self.rclListaDeMagia = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.frmOD3_svg ~= nil then self.frmOD3_svg:destroy(); self.frmOD3_svg = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.frmOD5_svg ~= nil then self.frmOD5_svg:destroy(); self.frmOD5_svg = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.frmOD2_svg ~= nil then self.frmOD2_svg:destroy(); self.frmOD2_svg = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.frmOD4_svg ~= nil then self.frmOD4_svg:destroy(); self.frmOD4_svg = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.frmOD1_svg ~= nil then self.frmOD1_svg:destroy(); self.frmOD1_svg = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmOD()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmOD();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmOD = {
    newEditor = newfrmOD, 
    new = newfrmOD, 
    name = "frmOD", 
    dataType = "br.com.RRPG.ODAPM_S3", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Old Dragon Aprimorado - Ficha de Personagem", 
    description=""};

frmOD = _frmOD;
Firecast.registrarForm(_frmOD);
Firecast.registrarDataType(_frmOD);

return _frmOD;
