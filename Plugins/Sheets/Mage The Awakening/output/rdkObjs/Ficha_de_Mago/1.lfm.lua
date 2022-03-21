require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha_de_Mago1_svg()
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
    obj:setName("frmFicha_de_Mago1_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1206);
    obj.rectangle1:setHeight(1566);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1206);
    obj.image1:setHeight(1566);
    obj.image1:setSRC("/Ficha_de_Mago/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(271);
    obj.layout1:setTop(163);
    obj.layout1:setWidth(210);
    obj.layout1:setHeight(31);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(19);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(210);
    obj.edit1:setHeight(32);
    obj.edit1:setField("name");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(183);
    obj.layout2:setTop(195);
    obj.layout2:setWidth(298);
    obj.layout2:setHeight(31);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(19);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(298);
    obj.edit2:setHeight(32);
    obj.edit2:setField("player");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(218);
    obj.layout3:setTop(227);
    obj.layout3:setWidth(263);
    obj.layout3:setHeight(31);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(19);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(263);
    obj.edit3:setHeight(32);
    obj.edit3:setField("chronicle");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(550);
    obj.layout4:setTop(163);
    obj.layout4:setWidth(266);
    obj.layout4:setHeight(31);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(19);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(266);
    obj.edit4:setHeight(32);
    obj.edit4:setField("Virtue");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(533);
    obj.layout5:setTop(195);
    obj.layout5:setWidth(282);
    obj.layout5:setHeight(31);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(19);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(282);
    obj.edit5:setHeight(32);
    obj.edit5:setField("Vice");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(564);
    obj.layout6:setTop(227);
    obj.layout6:setWidth(251);
    obj.layout6:setHeight(31);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(19);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(251);
    obj.edit6:setHeight(32);
    obj.edit6:setField("concept");
    obj.edit6:setName("edit6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(865);
    obj.layout7:setTop(163);
    obj.layout7:setWidth(225);
    obj.layout7:setHeight(31);
    obj.layout7:setName("layout7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(19);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(225);
    obj.edit7:setHeight(32);
    obj.edit7:setField("path");
    obj.edit7:setName("edit7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(882);
    obj.layout8:setTop(195);
    obj.layout8:setWidth(208);
    obj.layout8:setHeight(31);
    obj.layout8:setName("layout8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(19);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(208);
    obj.edit8:setHeight(32);
    obj.edit8:setField("order");
    obj.edit8:setName("edit8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(888);
    obj.layout9:setTop(227);
    obj.layout9:setWidth(202);
    obj.layout9:setHeight(31);
    obj.layout9:setName("layout9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(19);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(202);
    obj.edit9:setHeight(32);
    obj.edit9:setField("legacy");
    obj.edit9:setName("edit9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(244);
    obj.layout10:setTop(582);
    obj.layout10:setWidth(100);
    obj.layout10:setHeight(24);
    obj.layout10:setName("layout10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(15.8);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(100);
    obj.edit10:setHeight(25);
    obj.edit10:setField("abilities1");
    obj.edit10:setName("edit10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(240);
    obj.layout11:setTop(608);
    obj.layout11:setWidth(104);
    obj.layout11:setHeight(24);
    obj.layout11:setName("layout11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(15.8);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(104);
    obj.edit11:setHeight(25);
    obj.edit11:setField("abilities2");
    obj.edit11:setName("edit11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(198);
    obj.layout12:setTop(634);
    obj.layout12:setWidth(146);
    obj.layout12:setHeight(24);
    obj.layout12:setName("layout12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(15.8);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(146);
    obj.edit12:setHeight(25);
    obj.edit12:setField("abilities3");
    obj.edit12:setName("edit12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(264);
    obj.layout13:setTop(660);
    obj.layout13:setWidth(80);
    obj.layout13:setHeight(24);
    obj.layout13:setName("layout13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(15.8);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(80);
    obj.edit13:setHeight(25);
    obj.edit13:setField("abilities4");
    obj.edit13:setName("edit13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(230);
    obj.layout14:setTop(686);
    obj.layout14:setWidth(114);
    obj.layout14:setHeight(24);
    obj.layout14:setName("layout14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(15.8);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(114);
    obj.edit14:setHeight(25);
    obj.edit14:setField("abilities5");
    obj.edit14:setName("edit14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(205);
    obj.layout15:setTop(712);
    obj.layout15:setWidth(139);
    obj.layout15:setHeight(24);
    obj.layout15:setName("layout15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(15.8);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(139);
    obj.edit15:setHeight(25);
    obj.edit15:setField("abilities6");
    obj.edit15:setName("edit15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(212);
    obj.layout16:setTop(738);
    obj.layout16:setWidth(132);
    obj.layout16:setHeight(24);
    obj.layout16:setName("layout16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout16);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(15.8);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(132);
    obj.edit16:setHeight(25);
    obj.edit16:setField("abilities7");
    obj.edit16:setName("edit16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(212);
    obj.layout17:setTop(764);
    obj.layout17:setWidth(132);
    obj.layout17:setHeight(24);
    obj.layout17:setName("layout17");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout17);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(15.8);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(132);
    obj.edit17:setHeight(25);
    obj.edit17:setField("abilities8");
    obj.edit17:setName("edit17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(226);
    obj.layout18:setTop(920);
    obj.layout18:setWidth(118);
    obj.layout18:setHeight(24);
    obj.layout18:setName("layout18");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout18);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(15.8);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(118);
    obj.edit18:setHeight(25);
    obj.edit18:setField("abilities9");
    obj.edit18:setName("edit18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(197);
    obj.layout19:setTop(946);
    obj.layout19:setWidth(147);
    obj.layout19:setHeight(24);
    obj.layout19:setName("layout19");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout19);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(15.8);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(147);
    obj.edit19:setHeight(25);
    obj.edit19:setField("abilities10");
    obj.edit19:setName("edit19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(193);
    obj.layout20:setTop(972);
    obj.layout20:setWidth(151);
    obj.layout20:setHeight(24);
    obj.layout20:setName("layout20");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout20);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(15.8);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(151);
    obj.edit20:setHeight(25);
    obj.edit20:setField("abilities11");
    obj.edit20:setName("edit20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(225);
    obj.layout21:setTop(998);
    obj.layout21:setWidth(119);
    obj.layout21:setHeight(24);
    obj.layout21:setName("layout21");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout21);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(15.8);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(119);
    obj.edit21:setHeight(25);
    obj.edit21:setField("abilities12");
    obj.edit21:setName("edit21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(216);
    obj.layout22:setTop(1024);
    obj.layout22:setWidth(128);
    obj.layout22:setHeight(24);
    obj.layout22:setName("layout22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout22);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(15.8);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(128);
    obj.edit22:setHeight(25);
    obj.edit22:setField("abilities13");
    obj.edit22:setName("edit22");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(207);
    obj.layout23:setTop(1050);
    obj.layout23:setWidth(137);
    obj.layout23:setHeight(24);
    obj.layout23:setName("layout23");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout23);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(15.8);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(137);
    obj.edit23:setHeight(25);
    obj.edit23:setField("abilities14");
    obj.edit23:setName("edit23");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(218);
    obj.layout24:setTop(1076);
    obj.layout24:setWidth(126);
    obj.layout24:setHeight(24);
    obj.layout24:setName("layout24");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout24);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(15.8);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(126);
    obj.edit24:setHeight(25);
    obj.edit24:setField("abilities15");
    obj.edit24:setName("edit24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(240);
    obj.layout25:setTop(1102);
    obj.layout25:setWidth(104);
    obj.layout25:setHeight(24);
    obj.layout25:setName("layout25");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout25);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(15.8);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(104);
    obj.edit25:setHeight(25);
    obj.edit25:setField("abilities16");
    obj.edit25:setName("edit25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(260);
    obj.layout26:setTop(1258);
    obj.layout26:setWidth(84);
    obj.layout26:setHeight(24);
    obj.layout26:setName("layout26");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout26);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(15.8);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(84);
    obj.edit26:setHeight(25);
    obj.edit26:setField("abilities17");
    obj.edit26:setName("edit26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(227);
    obj.layout27:setTop(1284);
    obj.layout27:setWidth(117);
    obj.layout27:setHeight(24);
    obj.layout27:setName("layout27");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout27);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(15.8);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(117);
    obj.edit27:setHeight(25);
    obj.edit27:setField("abilities18");
    obj.edit27:setName("edit27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(246);
    obj.layout28:setTop(1310);
    obj.layout28:setWidth(98);
    obj.layout28:setHeight(24);
    obj.layout28:setName("layout28");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout28);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(15.8);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(98);
    obj.edit28:setHeight(25);
    obj.edit28:setField("abilities19");
    obj.edit28:setName("edit28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(264);
    obj.layout29:setTop(1336);
    obj.layout29:setWidth(80);
    obj.layout29:setHeight(24);
    obj.layout29:setName("layout29");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout29);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(15.8);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(80);
    obj.edit29:setHeight(25);
    obj.edit29:setField("abilities20");
    obj.edit29:setName("edit29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(246);
    obj.layout30:setTop(1362);
    obj.layout30:setWidth(98);
    obj.layout30:setHeight(24);
    obj.layout30:setName("layout30");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout30);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(15.8);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(98);
    obj.edit30:setHeight(25);
    obj.edit30:setField("abilities21");
    obj.edit30:setName("edit30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(222);
    obj.layout31:setTop(1388);
    obj.layout31:setWidth(122);
    obj.layout31:setHeight(24);
    obj.layout31:setName("layout31");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout31);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(15.8);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(122);
    obj.edit31:setHeight(25);
    obj.edit31:setField("abilities22");
    obj.edit31:setName("edit31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(237);
    obj.layout32:setTop(1414);
    obj.layout32:setWidth(107);
    obj.layout32:setHeight(24);
    obj.layout32:setName("layout32");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout32);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(15.8);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(107);
    obj.edit32:setHeight(25);
    obj.edit32:setField("abilities23");
    obj.edit32:setName("edit32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(246);
    obj.layout33:setTop(1440);
    obj.layout33:setWidth(98);
    obj.layout33:setHeight(24);
    obj.layout33:setName("layout33");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout33);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(15.8);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(98);
    obj.edit33:setHeight(25);
    obj.edit33:setField("abilities24");
    obj.edit33:setName("edit33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(517);
    obj.layout34:setTop(556);
    obj.layout34:setWidth(145);
    obj.layout34:setHeight(24);
    obj.layout34:setName("layout34");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout34);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(15.8);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(145);
    obj.edit34:setHeight(25);
    obj.edit34:setField("arcana1");
    obj.edit34:setName("edit34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(499);
    obj.layout35:setTop(582);
    obj.layout35:setWidth(163);
    obj.layout35:setHeight(24);
    obj.layout35:setName("layout35");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout35);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(15.8);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(163);
    obj.edit35:setHeight(25);
    obj.edit35:setField("arcana2");
    obj.edit35:setName("edit35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(519);
    obj.layout36:setTop(608);
    obj.layout36:setWidth(143);
    obj.layout36:setHeight(24);
    obj.layout36:setName("layout36");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout36);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(15.8);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("leading");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(143);
    obj.edit36:setHeight(25);
    obj.edit36:setField("arcana3");
    obj.edit36:setName("edit36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(496);
    obj.layout37:setTop(634);
    obj.layout37:setWidth(166);
    obj.layout37:setHeight(24);
    obj.layout37:setName("layout37");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout37);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(15.8);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("leading");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(166);
    obj.edit37:setHeight(25);
    obj.edit37:setField("arcana4");
    obj.edit37:setName("edit37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(524);
    obj.layout38:setTop(660);
    obj.layout38:setWidth(138);
    obj.layout38:setHeight(24);
    obj.layout38:setName("layout38");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout38);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(15.8);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("leading");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(138);
    obj.edit38:setHeight(25);
    obj.edit38:setField("arcana5");
    obj.edit38:setName("edit38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(512);
    obj.layout39:setTop(686);
    obj.layout39:setWidth(150);
    obj.layout39:setHeight(24);
    obj.layout39:setName("layout39");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout39);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(15.8);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("leading");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(150);
    obj.edit39:setHeight(25);
    obj.edit39:setField("arcana6");
    obj.edit39:setName("edit39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(518);
    obj.layout40:setTop(712);
    obj.layout40:setWidth(144);
    obj.layout40:setHeight(24);
    obj.layout40:setName("layout40");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout40);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(15.8);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("leading");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(144);
    obj.edit40:setHeight(25);
    obj.edit40:setField("arcana7");
    obj.edit40:setName("edit40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(512);
    obj.layout41:setTop(738);
    obj.layout41:setWidth(150);
    obj.layout41:setHeight(24);
    obj.layout41:setName("layout41");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout41);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(15.8);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("leading");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(150);
    obj.edit41:setHeight(25);
    obj.edit41:setField("arcana8");
    obj.edit41:setName("edit41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(512);
    obj.layout42:setTop(764);
    obj.layout42:setWidth(150);
    obj.layout42:setHeight(24);
    obj.layout42:setName("layout42");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout42);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(15.8);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(150);
    obj.edit42:setHeight(25);
    obj.edit42:setField("arcana9");
    obj.edit42:setName("edit42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(510);
    obj.layout43:setTop(790);
    obj.layout43:setWidth(152);
    obj.layout43:setHeight(24);
    obj.layout43:setName("layout43");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout43);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(15.8);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("leading");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(152);
    obj.edit43:setHeight(25);
    obj.edit43:setField("arcana10");
    obj.edit43:setName("edit43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(458);
    obj.layout44:setTop(867);
    obj.layout44:setWidth(204);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout44);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(16.5);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setHorzTextAlign("leading");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(204);
    obj.edit44:setHeight(26);
    obj.edit44:setField("merits1");
    obj.edit44:setName("edit44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(458);
    obj.layout45:setTop(893);
    obj.layout45:setWidth(204);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout45);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(16.5);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("leading");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(204);
    obj.edit45:setHeight(26);
    obj.edit45:setField("merits2");
    obj.edit45:setName("edit45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(458);
    obj.layout46:setTop(919);
    obj.layout46:setWidth(204);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout46);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(16.5);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(204);
    obj.edit46:setHeight(26);
    obj.edit46:setField("merits3");
    obj.edit46:setName("edit46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(458);
    obj.layout47:setTop(945);
    obj.layout47:setWidth(204);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout47);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(16.5);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("leading");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(204);
    obj.edit47:setHeight(26);
    obj.edit47:setField("merits4");
    obj.edit47:setName("edit47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(458);
    obj.layout48:setTop(971);
    obj.layout48:setWidth(204);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout48);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(16.5);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("leading");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(204);
    obj.edit48:setHeight(26);
    obj.edit48:setField("merits5");
    obj.edit48:setName("edit48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(458);
    obj.layout49:setTop(997);
    obj.layout49:setWidth(204);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout49);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(16.5);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("leading");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(204);
    obj.edit49:setHeight(26);
    obj.edit49:setField("merits6");
    obj.edit49:setName("edit49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(458);
    obj.layout50:setTop(1023);
    obj.layout50:setWidth(204);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout50);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(16.5);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setHorzTextAlign("leading");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(204);
    obj.edit50:setHeight(26);
    obj.edit50:setField("merits7");
    obj.edit50:setName("edit50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(458);
    obj.layout51:setTop(1049);
    obj.layout51:setWidth(204);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout51);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(16.5);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setHorzTextAlign("leading");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(204);
    obj.edit51:setHeight(26);
    obj.edit51:setField("merits8");
    obj.edit51:setName("edit51");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(458);
    obj.layout52:setTop(1127);
    obj.layout52:setWidth(288);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout52);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(16.5);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("leading");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(288);
    obj.edit52:setHeight(26);
    obj.edit52:setField("obsessions1");
    obj.edit52:setName("edit52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(458);
    obj.layout53:setTop(1153);
    obj.layout53:setWidth(288);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout53);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(16.5);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(288);
    obj.edit53:setHeight(26);
    obj.edit53:setField("obsessions2");
    obj.edit53:setName("edit53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(458);
    obj.layout54:setTop(1179);
    obj.layout54:setWidth(288);
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout54);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(16.5);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("leading");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(288);
    obj.edit54:setHeight(26);
    obj.edit54:setField("obsessions3");
    obj.edit54:setName("edit54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(458);
    obj.layout55:setTop(1205);
    obj.layout55:setWidth(288);
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout55);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(16.5);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setHorzTextAlign("leading");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(288);
    obj.edit55:setHeight(26);
    obj.edit55:setField("obsessions4");
    obj.edit55:setName("edit55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(458);
    obj.layout56:setTop(1231);
    obj.layout56:setWidth(288);
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout56);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(16.5);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setHorzTextAlign("leading");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(288);
    obj.edit56:setHeight(26);
    obj.edit56:setField("obsessions5");
    obj.edit56:setName("edit56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(498);
    obj.layout57:setTop(1283);
    obj.layout57:setWidth(94);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout57);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(16.5);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setHorzTextAlign("leading");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(94);
    obj.edit57:setHeight(26);
    obj.edit57:setField("size");
    obj.edit57:setName("edit57");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(664);
    obj.layout58:setTop(1283);
    obj.layout58:setWidth(81);
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout58);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(16.5);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setHorzTextAlign("leading");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(81);
    obj.edit58:setHeight(26);
    obj.edit58:setField("speed");
    obj.edit58:setName("edit58");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(536);
    obj.layout59:setTop(1309);
    obj.layout59:setWidth(56);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout59);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(16.5);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setHorzTextAlign("leading");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(56);
    obj.edit59:setHeight(26);
    obj.edit59:setField("defense");
    obj.edit59:setName("edit59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(674);
    obj.layout60:setTop(1309);
    obj.layout60:setWidth(72);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout60);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(16.5);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setHorzTextAlign("leading");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(72);
    obj.edit60:setHeight(26);
    obj.edit60:setField("armor");
    obj.edit60:setName("edit60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(603);
    obj.layout61:setTop(1335);
    obj.layout61:setWidth(142);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout61);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(16.5);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setHorzTextAlign("leading");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(142);
    obj.edit61:setHeight(26);
    obj.edit61:setField("IM");
    obj.edit61:setName("edit61");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(570);
    obj.layout62:setTop(1387);
    obj.layout62:setWidth(175);
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout62);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(16.5);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setHorzTextAlign("leading");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(175);
    obj.edit62:setHeight(26);
    obj.edit62:setField("exp");
    obj.edit62:setName("edit62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(645);
    obj.layout63:setTop(1439);
    obj.layout63:setWidth(100);
    obj.layout63:setHeight(25);
    obj.layout63:setName("layout63");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout63);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(16.5);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setHorzTextAlign("leading");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(100);
    obj.edit63:setHeight(26);
    obj.edit63:setField("arexp");
    obj.edit63:setName("edit63");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(858);
    obj.layout64:setTop(806);
    obj.layout64:setWidth(90);
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout64);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(16.5);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(90);
    obj.edit64:setHeight(26);
    obj.edit64:setField("mana1");
    obj.edit64:setName("edit64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(972);
    obj.layout65:setTop(806);
    obj.layout65:setWidth(90);
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout65);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(16.5);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(90);
    obj.edit65:setHeight(26);
    obj.edit65:setField("mana2");
    obj.edit65:setName("edit65");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(841);
    obj.layout66:setTop(969);
    obj.layout66:setWidth(231);
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout66);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(16.5);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setHorzTextAlign("leading");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(231);
    obj.edit66:setHeight(26);
    obj.edit66:setField("conditions1");
    obj.edit66:setName("edit66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(841);
    obj.layout67:setTop(995);
    obj.layout67:setWidth(231);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout67);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(16.5);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setHorzTextAlign("leading");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(231);
    obj.edit67:setHeight(26);
    obj.edit67:setField("conditions2");
    obj.edit67:setName("edit67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(841);
    obj.layout68:setTop(1021);
    obj.layout68:setWidth(231);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout68);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(16.5);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setHorzTextAlign("leading");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(231);
    obj.edit68:setHeight(26);
    obj.edit68:setField("conditions3");
    obj.edit68:setName("edit68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(841);
    obj.layout69:setTop(1047);
    obj.layout69:setWidth(231);
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout69);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(16.5);
    obj.edit69:setFontColor("#000000");
    obj.edit69:setHorzTextAlign("leading");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(231);
    obj.edit69:setHeight(26);
    obj.edit69:setField("conditions4");
    obj.edit69:setName("edit69");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(841);
    obj.layout70:setTop(1073);
    obj.layout70:setWidth(231);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout70);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(16.5);
    obj.edit70:setFontColor("#000000");
    obj.edit70:setHorzTextAlign("leading");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(231);
    obj.edit70:setHeight(26);
    obj.edit70:setField("conditions5");
    obj.edit70:setName("edit70");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(841);
    obj.layout71:setTop(1151);
    obj.layout71:setWidth(231);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout71);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(16.5);
    obj.edit71:setFontColor("#000000");
    obj.edit71:setHorzTextAlign("leading");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(231);
    obj.edit71:setHeight(26);
    obj.edit71:setField("tilts1");
    obj.edit71:setName("edit71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(841);
    obj.layout72:setTop(1177);
    obj.layout72:setWidth(231);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout72);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(16.5);
    obj.edit72:setFontColor("#000000");
    obj.edit72:setHorzTextAlign("leading");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(231);
    obj.edit72:setHeight(26);
    obj.edit72:setField("tilts2");
    obj.edit72:setName("edit72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(841);
    obj.layout73:setTop(1203);
    obj.layout73:setWidth(231);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout73);
    obj.edit73:setTransparent(true);
    obj.edit73:setFontSize(16.5);
    obj.edit73:setFontColor("#000000");
    obj.edit73:setHorzTextAlign("leading");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(231);
    obj.edit73:setHeight(26);
    obj.edit73:setField("tilts3");
    obj.edit73:setName("edit73");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(841);
    obj.layout74:setTop(1229);
    obj.layout74:setWidth(231);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout74);
    obj.edit74:setTransparent(true);
    obj.edit74:setFontSize(16.5);
    obj.edit74:setFontColor("#000000");
    obj.edit74:setHorzTextAlign("leading");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(231);
    obj.edit74:setHeight(26);
    obj.edit74:setField("tilts4");
    obj.edit74:setName("edit74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(841);
    obj.layout75:setTop(1255);
    obj.layout75:setWidth(231);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout75);
    obj.edit75:setTransparent(true);
    obj.edit75:setFontSize(16.5);
    obj.edit75:setFontColor("#000000");
    obj.edit75:setHorzTextAlign("leading");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(0);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(231);
    obj.edit75:setHeight(26);
    obj.edit75:setField("tilts5");
    obj.edit75:setName("edit75");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(841);
    obj.layout76:setTop(1331);
    obj.layout76:setWidth(231);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout76);
    obj.edit76:setTransparent(true);
    obj.edit76:setFontSize(16.5);
    obj.edit76:setFontColor("#000000");
    obj.edit76:setHorzTextAlign("leading");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(231);
    obj.edit76:setHeight(26);
    obj.edit76:setField("aspirations1");
    obj.edit76:setName("edit76");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(841);
    obj.layout77:setTop(1357);
    obj.layout77:setWidth(231);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout77);
    obj.edit77:setTransparent(true);
    obj.edit77:setFontSize(16.5);
    obj.edit77:setFontColor("#000000");
    obj.edit77:setHorzTextAlign("leading");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(231);
    obj.edit77:setHeight(26);
    obj.edit77:setField("aspirations2");
    obj.edit77:setName("edit77");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(841);
    obj.layout78:setTop(1383);
    obj.layout78:setWidth(231);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout78);
    obj.edit78:setTransparent(true);
    obj.edit78:setFontSize(16.5);
    obj.edit78:setFontColor("#000000");
    obj.edit78:setHorzTextAlign("leading");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(231);
    obj.edit78:setHeight(26);
    obj.edit78:setField("aspirations3");
    obj.edit78:setName("edit78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(841);
    obj.layout79:setTop(1409);
    obj.layout79:setWidth(231);
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout79);
    obj.edit79:setTransparent(true);
    obj.edit79:setFontSize(16.5);
    obj.edit79:setFontColor("#000000");
    obj.edit79:setHorzTextAlign("leading");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(231);
    obj.edit79:setHeight(26);
    obj.edit79:setField("aspirations4");
    obj.edit79:setName("edit79");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(841);
    obj.layout80:setTop(1435);
    obj.layout80:setWidth(231);
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout80);
    obj.edit80:setTransparent(true);
    obj.edit80:setFontSize(16.5);
    obj.edit80:setFontColor("#000000");
    obj.edit80:setHorzTextAlign("leading");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(231);
    obj.edit80:setHeight(26);
    obj.edit80:setField("aspirations5");
    obj.edit80:setName("edit80");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(410);
    obj.layout81:setTop(318);
    obj.layout81:setWidth(19);
    obj.layout81:setHeight(23);
    obj.layout81:setName("layout81");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout81);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(19);
    obj.checkBox1:setHeight(24);
    obj.checkBox1:setField("dot1");
    obj.checkBox1:setName("checkBox1");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(426);
    obj.layout82:setTop(318);
    obj.layout82:setWidth(20);
    obj.layout82:setHeight(23);
    obj.layout82:setName("layout82");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout82);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setHeight(24);
    obj.checkBox2:setField("dot2");
    obj.checkBox2:setName("checkBox2");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(444);
    obj.layout83:setTop(318);
    obj.layout83:setWidth(20);
    obj.layout83:setHeight(23);
    obj.layout83:setName("layout83");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout83);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setHeight(24);
    obj.checkBox3:setField("dot3");
    obj.checkBox3:setName("checkBox3");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(460);
    obj.layout84:setTop(318);
    obj.layout84:setWidth(20);
    obj.layout84:setHeight(23);
    obj.layout84:setName("layout84");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout84);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setHeight(24);
    obj.checkBox4:setField("dot4");
    obj.checkBox4:setName("checkBox4");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(478);
    obj.layout85:setTop(318);
    obj.layout85:setWidth(20);
    obj.layout85:setHeight(23);
    obj.layout85:setName("layout85");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout85);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setHeight(24);
    obj.checkBox5:setField("dot5");
    obj.checkBox5:setName("checkBox5");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(410);
    obj.layout86:setTop(362);
    obj.layout86:setWidth(20);
    obj.layout86:setHeight(23);
    obj.layout86:setName("layout86");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout86);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setHeight(24);
    obj.checkBox6:setField("dot9");
    obj.checkBox6:setName("checkBox6");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(426);
    obj.layout87:setTop(362);
    obj.layout87:setWidth(20);
    obj.layout87:setHeight(23);
    obj.layout87:setName("layout87");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout87);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setHeight(24);
    obj.checkBox7:setField("dot10");
    obj.checkBox7:setName("checkBox7");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(444);
    obj.layout88:setTop(362);
    obj.layout88:setWidth(20);
    obj.layout88:setHeight(23);
    obj.layout88:setName("layout88");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout88);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setHeight(24);
    obj.checkBox8:setField("dot11");
    obj.checkBox8:setName("checkBox8");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(460);
    obj.layout89:setTop(362);
    obj.layout89:setWidth(20);
    obj.layout89:setHeight(23);
    obj.layout89:setName("layout89");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout89);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setHeight(24);
    obj.checkBox9:setField("dot12");
    obj.checkBox9:setName("checkBox9");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(478);
    obj.layout90:setTop(362);
    obj.layout90:setWidth(20);
    obj.layout90:setHeight(23);
    obj.layout90:setName("layout90");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout90);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setHeight(24);
    obj.checkBox10:setField("dot13");
    obj.checkBox10:setName("checkBox10");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(410);
    obj.layout91:setTop(410);
    obj.layout91:setWidth(20);
    obj.layout91:setHeight(23);
    obj.layout91:setName("layout91");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout91);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setTop(0);
    obj.checkBox11:setWidth(20);
    obj.checkBox11:setHeight(24);
    obj.checkBox11:setField("dot17");
    obj.checkBox11:setName("checkBox11");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(426);
    obj.layout92:setTop(410);
    obj.layout92:setWidth(20);
    obj.layout92:setHeight(23);
    obj.layout92:setName("layout92");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout92);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setTop(0);
    obj.checkBox12:setWidth(20);
    obj.checkBox12:setHeight(24);
    obj.checkBox12:setField("dot18");
    obj.checkBox12:setName("checkBox12");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(444);
    obj.layout93:setTop(410);
    obj.layout93:setWidth(20);
    obj.layout93:setHeight(23);
    obj.layout93:setName("layout93");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout93);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(0);
    obj.checkBox13:setWidth(20);
    obj.checkBox13:setHeight(24);
    obj.checkBox13:setField("dot19");
    obj.checkBox13:setName("checkBox13");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(460);
    obj.layout94:setTop(410);
    obj.layout94:setWidth(20);
    obj.layout94:setHeight(23);
    obj.layout94:setName("layout94");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout94);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setTop(0);
    obj.checkBox14:setWidth(20);
    obj.checkBox14:setHeight(24);
    obj.checkBox14:setField("dot20");
    obj.checkBox14:setName("checkBox14");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(478);
    obj.layout95:setTop(410);
    obj.layout95:setWidth(20);
    obj.layout95:setHeight(23);
    obj.layout95:setName("layout95");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout95);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setTop(0);
    obj.checkBox15:setWidth(20);
    obj.checkBox15:setHeight(24);
    obj.checkBox15:setField("dot21");
    obj.checkBox15:setName("checkBox15");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(702);
    obj.layout96:setTop(318);
    obj.layout96:setWidth(19);
    obj.layout96:setHeight(23);
    obj.layout96:setName("layout96");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout96);
    obj.checkBox16:setLeft(0);
    obj.checkBox16:setTop(0);
    obj.checkBox16:setWidth(19);
    obj.checkBox16:setHeight(24);
    obj.checkBox16:setField("dot25");
    obj.checkBox16:setName("checkBox16");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(718);
    obj.layout97:setTop(318);
    obj.layout97:setWidth(20);
    obj.layout97:setHeight(23);
    obj.layout97:setName("layout97");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout97);
    obj.checkBox17:setLeft(0);
    obj.checkBox17:setTop(0);
    obj.checkBox17:setWidth(20);
    obj.checkBox17:setHeight(24);
    obj.checkBox17:setField("dot26");
    obj.checkBox17:setName("checkBox17");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(736);
    obj.layout98:setTop(318);
    obj.layout98:setWidth(20);
    obj.layout98:setHeight(23);
    obj.layout98:setName("layout98");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout98);
    obj.checkBox18:setLeft(0);
    obj.checkBox18:setTop(0);
    obj.checkBox18:setWidth(20);
    obj.checkBox18:setHeight(24);
    obj.checkBox18:setField("dot27");
    obj.checkBox18:setName("checkBox18");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(752);
    obj.layout99:setTop(318);
    obj.layout99:setWidth(20);
    obj.layout99:setHeight(23);
    obj.layout99:setName("layout99");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout99);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setTop(0);
    obj.checkBox19:setWidth(20);
    obj.checkBox19:setHeight(24);
    obj.checkBox19:setField("dot28");
    obj.checkBox19:setName("checkBox19");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(770);
    obj.layout100:setTop(318);
    obj.layout100:setWidth(20);
    obj.layout100:setHeight(23);
    obj.layout100:setName("layout100");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout100);
    obj.checkBox20:setLeft(0);
    obj.checkBox20:setTop(0);
    obj.checkBox20:setWidth(20);
    obj.checkBox20:setHeight(24);
    obj.checkBox20:setField("dot29");
    obj.checkBox20:setName("checkBox20");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(702);
    obj.layout101:setTop(362);
    obj.layout101:setWidth(19);
    obj.layout101:setHeight(23);
    obj.layout101:setName("layout101");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout101);
    obj.checkBox21:setLeft(0);
    obj.checkBox21:setTop(0);
    obj.checkBox21:setWidth(19);
    obj.checkBox21:setHeight(24);
    obj.checkBox21:setField("dot33");
    obj.checkBox21:setName("checkBox21");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(718);
    obj.layout102:setTop(362);
    obj.layout102:setWidth(20);
    obj.layout102:setHeight(23);
    obj.layout102:setName("layout102");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout102);
    obj.checkBox22:setLeft(0);
    obj.checkBox22:setTop(0);
    obj.checkBox22:setWidth(20);
    obj.checkBox22:setHeight(24);
    obj.checkBox22:setField("dot34");
    obj.checkBox22:setName("checkBox22");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(736);
    obj.layout103:setTop(362);
    obj.layout103:setWidth(20);
    obj.layout103:setHeight(23);
    obj.layout103:setName("layout103");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout103);
    obj.checkBox23:setLeft(0);
    obj.checkBox23:setTop(0);
    obj.checkBox23:setWidth(20);
    obj.checkBox23:setHeight(24);
    obj.checkBox23:setField("dot35");
    obj.checkBox23:setName("checkBox23");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(752);
    obj.layout104:setTop(362);
    obj.layout104:setWidth(20);
    obj.layout104:setHeight(23);
    obj.layout104:setName("layout104");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout104);
    obj.checkBox24:setLeft(0);
    obj.checkBox24:setTop(0);
    obj.checkBox24:setWidth(20);
    obj.checkBox24:setHeight(24);
    obj.checkBox24:setField("dot36");
    obj.checkBox24:setName("checkBox24");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(770);
    obj.layout105:setTop(362);
    obj.layout105:setWidth(20);
    obj.layout105:setHeight(23);
    obj.layout105:setName("layout105");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout105);
    obj.checkBox25:setLeft(0);
    obj.checkBox25:setTop(0);
    obj.checkBox25:setWidth(20);
    obj.checkBox25:setHeight(24);
    obj.checkBox25:setField("dot37");
    obj.checkBox25:setName("checkBox25");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(702);
    obj.layout106:setTop(410);
    obj.layout106:setWidth(19);
    obj.layout106:setHeight(23);
    obj.layout106:setName("layout106");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout106);
    obj.checkBox26:setLeft(0);
    obj.checkBox26:setTop(0);
    obj.checkBox26:setWidth(19);
    obj.checkBox26:setHeight(24);
    obj.checkBox26:setField("dot41");
    obj.checkBox26:setName("checkBox26");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(718);
    obj.layout107:setTop(410);
    obj.layout107:setWidth(20);
    obj.layout107:setHeight(23);
    obj.layout107:setName("layout107");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout107);
    obj.checkBox27:setLeft(0);
    obj.checkBox27:setTop(0);
    obj.checkBox27:setWidth(20);
    obj.checkBox27:setHeight(24);
    obj.checkBox27:setField("dot42");
    obj.checkBox27:setName("checkBox27");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(736);
    obj.layout108:setTop(410);
    obj.layout108:setWidth(20);
    obj.layout108:setHeight(23);
    obj.layout108:setName("layout108");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout108);
    obj.checkBox28:setLeft(0);
    obj.checkBox28:setTop(0);
    obj.checkBox28:setWidth(20);
    obj.checkBox28:setHeight(24);
    obj.checkBox28:setField("dot43");
    obj.checkBox28:setName("checkBox28");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(752);
    obj.layout109:setTop(410);
    obj.layout109:setWidth(20);
    obj.layout109:setHeight(23);
    obj.layout109:setName("layout109");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout109);
    obj.checkBox29:setLeft(0);
    obj.checkBox29:setTop(0);
    obj.checkBox29:setWidth(20);
    obj.checkBox29:setHeight(24);
    obj.checkBox29:setField("dot44");
    obj.checkBox29:setName("checkBox29");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(770);
    obj.layout110:setTop(410);
    obj.layout110:setWidth(20);
    obj.layout110:setHeight(23);
    obj.layout110:setName("layout110");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout110);
    obj.checkBox30:setLeft(0);
    obj.checkBox30:setTop(0);
    obj.checkBox30:setWidth(20);
    obj.checkBox30:setHeight(24);
    obj.checkBox30:setField("dot45");
    obj.checkBox30:setName("checkBox30");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle1);
    obj.layout111:setLeft(998);
    obj.layout111:setTop(318);
    obj.layout111:setWidth(19);
    obj.layout111:setHeight(23);
    obj.layout111:setName("layout111");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout111);
    obj.checkBox31:setLeft(0);
    obj.checkBox31:setTop(0);
    obj.checkBox31:setWidth(19);
    obj.checkBox31:setHeight(24);
    obj.checkBox31:setField("dot49");
    obj.checkBox31:setName("checkBox31");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle1);
    obj.layout112:setLeft(1014);
    obj.layout112:setTop(318);
    obj.layout112:setWidth(20);
    obj.layout112:setHeight(23);
    obj.layout112:setName("layout112");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout112);
    obj.checkBox32:setLeft(0);
    obj.checkBox32:setTop(0);
    obj.checkBox32:setWidth(20);
    obj.checkBox32:setHeight(24);
    obj.checkBox32:setField("dot50");
    obj.checkBox32:setName("checkBox32");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle1);
    obj.layout113:setLeft(1032);
    obj.layout113:setTop(318);
    obj.layout113:setWidth(20);
    obj.layout113:setHeight(23);
    obj.layout113:setName("layout113");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout113);
    obj.checkBox33:setLeft(0);
    obj.checkBox33:setTop(0);
    obj.checkBox33:setWidth(20);
    obj.checkBox33:setHeight(24);
    obj.checkBox33:setField("dot51");
    obj.checkBox33:setName("checkBox33");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle1);
    obj.layout114:setLeft(1048);
    obj.layout114:setTop(318);
    obj.layout114:setWidth(20);
    obj.layout114:setHeight(23);
    obj.layout114:setName("layout114");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout114);
    obj.checkBox34:setLeft(0);
    obj.checkBox34:setTop(0);
    obj.checkBox34:setWidth(20);
    obj.checkBox34:setHeight(24);
    obj.checkBox34:setField("dot52");
    obj.checkBox34:setName("checkBox34");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setLeft(1066);
    obj.layout115:setTop(318);
    obj.layout115:setWidth(20);
    obj.layout115:setHeight(23);
    obj.layout115:setName("layout115");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout115);
    obj.checkBox35:setLeft(0);
    obj.checkBox35:setTop(0);
    obj.checkBox35:setWidth(20);
    obj.checkBox35:setHeight(24);
    obj.checkBox35:setField("dot53");
    obj.checkBox35:setName("checkBox35");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle1);
    obj.layout116:setLeft(998);
    obj.layout116:setTop(362);
    obj.layout116:setWidth(19);
    obj.layout116:setHeight(23);
    obj.layout116:setName("layout116");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout116);
    obj.checkBox36:setLeft(0);
    obj.checkBox36:setTop(0);
    obj.checkBox36:setWidth(19);
    obj.checkBox36:setHeight(24);
    obj.checkBox36:setField("dot57");
    obj.checkBox36:setName("checkBox36");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle1);
    obj.layout117:setLeft(1014);
    obj.layout117:setTop(362);
    obj.layout117:setWidth(20);
    obj.layout117:setHeight(23);
    obj.layout117:setName("layout117");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout117);
    obj.checkBox37:setLeft(0);
    obj.checkBox37:setTop(0);
    obj.checkBox37:setWidth(20);
    obj.checkBox37:setHeight(24);
    obj.checkBox37:setField("dot58");
    obj.checkBox37:setName("checkBox37");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle1);
    obj.layout118:setLeft(1032);
    obj.layout118:setTop(362);
    obj.layout118:setWidth(20);
    obj.layout118:setHeight(23);
    obj.layout118:setName("layout118");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout118);
    obj.checkBox38:setLeft(0);
    obj.checkBox38:setTop(0);
    obj.checkBox38:setWidth(20);
    obj.checkBox38:setHeight(24);
    obj.checkBox38:setField("dot59");
    obj.checkBox38:setName("checkBox38");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle1);
    obj.layout119:setLeft(1048);
    obj.layout119:setTop(362);
    obj.layout119:setWidth(20);
    obj.layout119:setHeight(23);
    obj.layout119:setName("layout119");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout119);
    obj.checkBox39:setLeft(0);
    obj.checkBox39:setTop(0);
    obj.checkBox39:setWidth(20);
    obj.checkBox39:setHeight(24);
    obj.checkBox39:setField("dot60");
    obj.checkBox39:setName("checkBox39");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle1);
    obj.layout120:setLeft(1066);
    obj.layout120:setTop(362);
    obj.layout120:setWidth(20);
    obj.layout120:setHeight(23);
    obj.layout120:setName("layout120");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout120);
    obj.checkBox40:setLeft(0);
    obj.checkBox40:setTop(0);
    obj.checkBox40:setWidth(20);
    obj.checkBox40:setHeight(24);
    obj.checkBox40:setField("dot61");
    obj.checkBox40:setName("checkBox40");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle1);
    obj.layout121:setLeft(998);
    obj.layout121:setTop(410);
    obj.layout121:setWidth(19);
    obj.layout121:setHeight(23);
    obj.layout121:setName("layout121");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout121);
    obj.checkBox41:setLeft(0);
    obj.checkBox41:setTop(0);
    obj.checkBox41:setWidth(19);
    obj.checkBox41:setHeight(24);
    obj.checkBox41:setField("dot65");
    obj.checkBox41:setName("checkBox41");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle1);
    obj.layout122:setLeft(1014);
    obj.layout122:setTop(410);
    obj.layout122:setWidth(20);
    obj.layout122:setHeight(23);
    obj.layout122:setName("layout122");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout122);
    obj.checkBox42:setLeft(0);
    obj.checkBox42:setTop(0);
    obj.checkBox42:setWidth(20);
    obj.checkBox42:setHeight(24);
    obj.checkBox42:setField("dot66");
    obj.checkBox42:setName("checkBox42");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle1);
    obj.layout123:setLeft(1032);
    obj.layout123:setTop(410);
    obj.layout123:setWidth(20);
    obj.layout123:setHeight(23);
    obj.layout123:setName("layout123");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout123);
    obj.checkBox43:setLeft(0);
    obj.checkBox43:setTop(0);
    obj.checkBox43:setWidth(20);
    obj.checkBox43:setHeight(24);
    obj.checkBox43:setField("dot67");
    obj.checkBox43:setName("checkBox43");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle1);
    obj.layout124:setLeft(1048);
    obj.layout124:setTop(410);
    obj.layout124:setWidth(20);
    obj.layout124:setHeight(23);
    obj.layout124:setName("layout124");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout124);
    obj.checkBox44:setLeft(0);
    obj.checkBox44:setTop(0);
    obj.checkBox44:setWidth(20);
    obj.checkBox44:setHeight(24);
    obj.checkBox44:setField("dot68");
    obj.checkBox44:setName("checkBox44");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle1);
    obj.layout125:setLeft(1066);
    obj.layout125:setTop(410);
    obj.layout125:setWidth(20);
    obj.layout125:setHeight(23);
    obj.layout125:setName("layout125");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout125);
    obj.checkBox45:setLeft(0);
    obj.checkBox45:setTop(0);
    obj.checkBox45:setWidth(20);
    obj.checkBox45:setHeight(24);
    obj.checkBox45:setField("dot69");
    obj.checkBox45:setName("checkBox45");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle1);
    obj.layout126:setLeft(342);
    obj.layout126:setTop(585);
    obj.layout126:setWidth(20);
    obj.layout126:setHeight(23);
    obj.layout126:setName("layout126");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout126);
    obj.checkBox46:setLeft(0);
    obj.checkBox46:setTop(0);
    obj.checkBox46:setWidth(20);
    obj.checkBox46:setHeight(24);
    obj.checkBox46:setField("dot73");
    obj.checkBox46:setName("checkBox46");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle1);
    obj.layout127:setLeft(359);
    obj.layout127:setTop(585);
    obj.layout127:setWidth(20);
    obj.layout127:setHeight(23);
    obj.layout127:setName("layout127");

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout127);
    obj.checkBox47:setLeft(0);
    obj.checkBox47:setTop(0);
    obj.checkBox47:setWidth(20);
    obj.checkBox47:setHeight(24);
    obj.checkBox47:setField("dot74");
    obj.checkBox47:setName("checkBox47");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle1);
    obj.layout128:setLeft(376);
    obj.layout128:setTop(585);
    obj.layout128:setWidth(20);
    obj.layout128:setHeight(23);
    obj.layout128:setName("layout128");

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout128);
    obj.checkBox48:setLeft(0);
    obj.checkBox48:setTop(0);
    obj.checkBox48:setWidth(20);
    obj.checkBox48:setHeight(24);
    obj.checkBox48:setField("dot75");
    obj.checkBox48:setName("checkBox48");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setLeft(393);
    obj.layout129:setTop(585);
    obj.layout129:setWidth(20);
    obj.layout129:setHeight(23);
    obj.layout129:setName("layout129");

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout129);
    obj.checkBox49:setLeft(0);
    obj.checkBox49:setTop(0);
    obj.checkBox49:setWidth(20);
    obj.checkBox49:setHeight(24);
    obj.checkBox49:setField("dot76");
    obj.checkBox49:setName("checkBox49");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setLeft(410);
    obj.layout130:setTop(585);
    obj.layout130:setWidth(20);
    obj.layout130:setHeight(23);
    obj.layout130:setName("layout130");

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout130);
    obj.checkBox50:setLeft(0);
    obj.checkBox50:setTop(0);
    obj.checkBox50:setWidth(20);
    obj.checkBox50:setHeight(24);
    obj.checkBox50:setField("dot77");
    obj.checkBox50:setName("checkBox50");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setLeft(342);
    obj.layout131:setTop(611);
    obj.layout131:setWidth(19);
    obj.layout131:setHeight(23);
    obj.layout131:setName("layout131");

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout131);
    obj.checkBox51:setLeft(0);
    obj.checkBox51:setTop(0);
    obj.checkBox51:setWidth(19);
    obj.checkBox51:setHeight(24);
    obj.checkBox51:setField("dot81");
    obj.checkBox51:setName("checkBox51");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle1);
    obj.layout132:setLeft(359);
    obj.layout132:setTop(611);
    obj.layout132:setWidth(20);
    obj.layout132:setHeight(23);
    obj.layout132:setName("layout132");

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout132);
    obj.checkBox52:setLeft(0);
    obj.checkBox52:setTop(0);
    obj.checkBox52:setWidth(20);
    obj.checkBox52:setHeight(24);
    obj.checkBox52:setField("dot82");
    obj.checkBox52:setName("checkBox52");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle1);
    obj.layout133:setLeft(376);
    obj.layout133:setTop(611);
    obj.layout133:setWidth(20);
    obj.layout133:setHeight(23);
    obj.layout133:setName("layout133");

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout133);
    obj.checkBox53:setLeft(0);
    obj.checkBox53:setTop(0);
    obj.checkBox53:setWidth(20);
    obj.checkBox53:setHeight(24);
    obj.checkBox53:setField("dot83");
    obj.checkBox53:setName("checkBox53");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle1);
    obj.layout134:setLeft(393);
    obj.layout134:setTop(611);
    obj.layout134:setWidth(20);
    obj.layout134:setHeight(23);
    obj.layout134:setName("layout134");

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout134);
    obj.checkBox54:setLeft(0);
    obj.checkBox54:setTop(0);
    obj.checkBox54:setWidth(20);
    obj.checkBox54:setHeight(24);
    obj.checkBox54:setField("dot84");
    obj.checkBox54:setName("checkBox54");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle1);
    obj.layout135:setLeft(410);
    obj.layout135:setTop(611);
    obj.layout135:setWidth(20);
    obj.layout135:setHeight(23);
    obj.layout135:setName("layout135");

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout135);
    obj.checkBox55:setLeft(0);
    obj.checkBox55:setTop(0);
    obj.checkBox55:setWidth(20);
    obj.checkBox55:setHeight(24);
    obj.checkBox55:setField("dot85");
    obj.checkBox55:setName("checkBox55");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle1);
    obj.layout136:setLeft(342);
    obj.layout136:setTop(637);
    obj.layout136:setWidth(19);
    obj.layout136:setHeight(23);
    obj.layout136:setName("layout136");

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout136);
    obj.checkBox56:setLeft(0);
    obj.checkBox56:setTop(0);
    obj.checkBox56:setWidth(19);
    obj.checkBox56:setHeight(24);
    obj.checkBox56:setField("dot89");
    obj.checkBox56:setName("checkBox56");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle1);
    obj.layout137:setLeft(359);
    obj.layout137:setTop(637);
    obj.layout137:setWidth(20);
    obj.layout137:setHeight(23);
    obj.layout137:setName("layout137");

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout137);
    obj.checkBox57:setLeft(0);
    obj.checkBox57:setTop(0);
    obj.checkBox57:setWidth(20);
    obj.checkBox57:setHeight(24);
    obj.checkBox57:setField("dot90");
    obj.checkBox57:setName("checkBox57");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle1);
    obj.layout138:setLeft(376);
    obj.layout138:setTop(637);
    obj.layout138:setWidth(20);
    obj.layout138:setHeight(23);
    obj.layout138:setName("layout138");

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout138);
    obj.checkBox58:setLeft(0);
    obj.checkBox58:setTop(0);
    obj.checkBox58:setWidth(20);
    obj.checkBox58:setHeight(24);
    obj.checkBox58:setField("dot91");
    obj.checkBox58:setName("checkBox58");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle1);
    obj.layout139:setLeft(393);
    obj.layout139:setTop(637);
    obj.layout139:setWidth(20);
    obj.layout139:setHeight(23);
    obj.layout139:setName("layout139");

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout139);
    obj.checkBox59:setLeft(0);
    obj.checkBox59:setTop(0);
    obj.checkBox59:setWidth(20);
    obj.checkBox59:setHeight(24);
    obj.checkBox59:setField("dot92");
    obj.checkBox59:setName("checkBox59");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle1);
    obj.layout140:setLeft(410);
    obj.layout140:setTop(637);
    obj.layout140:setWidth(20);
    obj.layout140:setHeight(23);
    obj.layout140:setName("layout140");

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout140);
    obj.checkBox60:setLeft(0);
    obj.checkBox60:setTop(0);
    obj.checkBox60:setWidth(20);
    obj.checkBox60:setHeight(24);
    obj.checkBox60:setField("dot93");
    obj.checkBox60:setName("checkBox60");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle1);
    obj.layout141:setLeft(342);
    obj.layout141:setTop(663);
    obj.layout141:setWidth(20);
    obj.layout141:setHeight(23);
    obj.layout141:setName("layout141");

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout141);
    obj.checkBox61:setLeft(0);
    obj.checkBox61:setTop(0);
    obj.checkBox61:setWidth(20);
    obj.checkBox61:setHeight(24);
    obj.checkBox61:setField("dot97");
    obj.checkBox61:setName("checkBox61");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle1);
    obj.layout142:setLeft(359);
    obj.layout142:setTop(663);
    obj.layout142:setWidth(20);
    obj.layout142:setHeight(23);
    obj.layout142:setName("layout142");

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout142);
    obj.checkBox62:setLeft(0);
    obj.checkBox62:setTop(0);
    obj.checkBox62:setWidth(20);
    obj.checkBox62:setHeight(24);
    obj.checkBox62:setField("dot98");
    obj.checkBox62:setName("checkBox62");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle1);
    obj.layout143:setLeft(376);
    obj.layout143:setTop(663);
    obj.layout143:setWidth(20);
    obj.layout143:setHeight(23);
    obj.layout143:setName("layout143");

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout143);
    obj.checkBox63:setLeft(0);
    obj.checkBox63:setTop(0);
    obj.checkBox63:setWidth(20);
    obj.checkBox63:setHeight(24);
    obj.checkBox63:setField("dot99");
    obj.checkBox63:setName("checkBox63");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle1);
    obj.layout144:setLeft(393);
    obj.layout144:setTop(663);
    obj.layout144:setWidth(20);
    obj.layout144:setHeight(23);
    obj.layout144:setName("layout144");

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout144);
    obj.checkBox64:setLeft(0);
    obj.checkBox64:setTop(0);
    obj.checkBox64:setWidth(20);
    obj.checkBox64:setHeight(24);
    obj.checkBox64:setField("dot100");
    obj.checkBox64:setName("checkBox64");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle1);
    obj.layout145:setLeft(410);
    obj.layout145:setTop(663);
    obj.layout145:setWidth(20);
    obj.layout145:setHeight(23);
    obj.layout145:setName("layout145");

    obj.checkBox65 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout145);
    obj.checkBox65:setLeft(0);
    obj.checkBox65:setTop(0);
    obj.checkBox65:setWidth(20);
    obj.checkBox65:setHeight(24);
    obj.checkBox65:setField("dot101");
    obj.checkBox65:setName("checkBox65");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.rectangle1);
    obj.layout146:setLeft(342);
    obj.layout146:setTop(689);
    obj.layout146:setWidth(20);
    obj.layout146:setHeight(23);
    obj.layout146:setName("layout146");

    obj.checkBox66 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout146);
    obj.checkBox66:setLeft(0);
    obj.checkBox66:setTop(0);
    obj.checkBox66:setWidth(20);
    obj.checkBox66:setHeight(24);
    obj.checkBox66:setField("dot105");
    obj.checkBox66:setName("checkBox66");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.rectangle1);
    obj.layout147:setLeft(359);
    obj.layout147:setTop(689);
    obj.layout147:setWidth(20);
    obj.layout147:setHeight(23);
    obj.layout147:setName("layout147");

    obj.checkBox67 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout147);
    obj.checkBox67:setLeft(0);
    obj.checkBox67:setTop(0);
    obj.checkBox67:setWidth(20);
    obj.checkBox67:setHeight(24);
    obj.checkBox67:setField("dot106");
    obj.checkBox67:setName("checkBox67");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle1);
    obj.layout148:setLeft(376);
    obj.layout148:setTop(689);
    obj.layout148:setWidth(20);
    obj.layout148:setHeight(23);
    obj.layout148:setName("layout148");

    obj.checkBox68 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout148);
    obj.checkBox68:setLeft(0);
    obj.checkBox68:setTop(0);
    obj.checkBox68:setWidth(20);
    obj.checkBox68:setHeight(24);
    obj.checkBox68:setField("dot107");
    obj.checkBox68:setName("checkBox68");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle1);
    obj.layout149:setLeft(393);
    obj.layout149:setTop(689);
    obj.layout149:setWidth(20);
    obj.layout149:setHeight(23);
    obj.layout149:setName("layout149");

    obj.checkBox69 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout149);
    obj.checkBox69:setLeft(0);
    obj.checkBox69:setTop(0);
    obj.checkBox69:setWidth(20);
    obj.checkBox69:setHeight(24);
    obj.checkBox69:setField("dot108");
    obj.checkBox69:setName("checkBox69");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle1);
    obj.layout150:setLeft(410);
    obj.layout150:setTop(689);
    obj.layout150:setWidth(20);
    obj.layout150:setHeight(23);
    obj.layout150:setName("layout150");

    obj.checkBox70 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout150);
    obj.checkBox70:setLeft(0);
    obj.checkBox70:setTop(0);
    obj.checkBox70:setWidth(20);
    obj.checkBox70:setHeight(24);
    obj.checkBox70:setField("dot109");
    obj.checkBox70:setName("checkBox70");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.rectangle1);
    obj.layout151:setLeft(342);
    obj.layout151:setTop(715);
    obj.layout151:setWidth(20);
    obj.layout151:setHeight(23);
    obj.layout151:setName("layout151");

    obj.checkBox71 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout151);
    obj.checkBox71:setLeft(0);
    obj.checkBox71:setTop(0);
    obj.checkBox71:setWidth(20);
    obj.checkBox71:setHeight(24);
    obj.checkBox71:setField("dot113");
    obj.checkBox71:setName("checkBox71");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.rectangle1);
    obj.layout152:setLeft(359);
    obj.layout152:setTop(715);
    obj.layout152:setWidth(20);
    obj.layout152:setHeight(23);
    obj.layout152:setName("layout152");

    obj.checkBox72 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout152);
    obj.checkBox72:setLeft(0);
    obj.checkBox72:setTop(0);
    obj.checkBox72:setWidth(20);
    obj.checkBox72:setHeight(24);
    obj.checkBox72:setField("dot114");
    obj.checkBox72:setName("checkBox72");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle1);
    obj.layout153:setLeft(376);
    obj.layout153:setTop(715);
    obj.layout153:setWidth(20);
    obj.layout153:setHeight(23);
    obj.layout153:setName("layout153");

    obj.checkBox73 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout153);
    obj.checkBox73:setLeft(0);
    obj.checkBox73:setTop(0);
    obj.checkBox73:setWidth(20);
    obj.checkBox73:setHeight(24);
    obj.checkBox73:setField("dot115");
    obj.checkBox73:setName("checkBox73");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.rectangle1);
    obj.layout154:setLeft(393);
    obj.layout154:setTop(715);
    obj.layout154:setWidth(20);
    obj.layout154:setHeight(23);
    obj.layout154:setName("layout154");

    obj.checkBox74 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout154);
    obj.checkBox74:setLeft(0);
    obj.checkBox74:setTop(0);
    obj.checkBox74:setWidth(20);
    obj.checkBox74:setHeight(24);
    obj.checkBox74:setField("dot116");
    obj.checkBox74:setName("checkBox74");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.rectangle1);
    obj.layout155:setLeft(410);
    obj.layout155:setTop(715);
    obj.layout155:setWidth(20);
    obj.layout155:setHeight(23);
    obj.layout155:setName("layout155");

    obj.checkBox75 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.layout155);
    obj.checkBox75:setLeft(0);
    obj.checkBox75:setTop(0);
    obj.checkBox75:setWidth(20);
    obj.checkBox75:setHeight(24);
    obj.checkBox75:setField("dot117");
    obj.checkBox75:setName("checkBox75");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.rectangle1);
    obj.layout156:setLeft(342);
    obj.layout156:setTop(741);
    obj.layout156:setWidth(19);
    obj.layout156:setHeight(23);
    obj.layout156:setName("layout156");

    obj.checkBox76 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.layout156);
    obj.checkBox76:setLeft(0);
    obj.checkBox76:setTop(0);
    obj.checkBox76:setWidth(19);
    obj.checkBox76:setHeight(24);
    obj.checkBox76:setField("dot121");
    obj.checkBox76:setName("checkBox76");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.rectangle1);
    obj.layout157:setLeft(359);
    obj.layout157:setTop(741);
    obj.layout157:setWidth(20);
    obj.layout157:setHeight(23);
    obj.layout157:setName("layout157");

    obj.checkBox77 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.layout157);
    obj.checkBox77:setLeft(0);
    obj.checkBox77:setTop(0);
    obj.checkBox77:setWidth(20);
    obj.checkBox77:setHeight(24);
    obj.checkBox77:setField("dot122");
    obj.checkBox77:setName("checkBox77");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.rectangle1);
    obj.layout158:setLeft(376);
    obj.layout158:setTop(741);
    obj.layout158:setWidth(20);
    obj.layout158:setHeight(23);
    obj.layout158:setName("layout158");

    obj.checkBox78 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.layout158);
    obj.checkBox78:setLeft(0);
    obj.checkBox78:setTop(0);
    obj.checkBox78:setWidth(20);
    obj.checkBox78:setHeight(24);
    obj.checkBox78:setField("dot123");
    obj.checkBox78:setName("checkBox78");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.rectangle1);
    obj.layout159:setLeft(393);
    obj.layout159:setTop(741);
    obj.layout159:setWidth(20);
    obj.layout159:setHeight(23);
    obj.layout159:setName("layout159");

    obj.checkBox79 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.layout159);
    obj.checkBox79:setLeft(0);
    obj.checkBox79:setTop(0);
    obj.checkBox79:setWidth(20);
    obj.checkBox79:setHeight(24);
    obj.checkBox79:setField("dot124");
    obj.checkBox79:setName("checkBox79");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.rectangle1);
    obj.layout160:setLeft(410);
    obj.layout160:setTop(741);
    obj.layout160:setWidth(20);
    obj.layout160:setHeight(23);
    obj.layout160:setName("layout160");

    obj.checkBox80 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.layout160);
    obj.checkBox80:setLeft(0);
    obj.checkBox80:setTop(0);
    obj.checkBox80:setWidth(20);
    obj.checkBox80:setHeight(24);
    obj.checkBox80:setField("dot125");
    obj.checkBox80:setName("checkBox80");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.rectangle1);
    obj.layout161:setLeft(342);
    obj.layout161:setTop(767);
    obj.layout161:setWidth(19);
    obj.layout161:setHeight(23);
    obj.layout161:setName("layout161");

    obj.checkBox81 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.layout161);
    obj.checkBox81:setLeft(0);
    obj.checkBox81:setTop(0);
    obj.checkBox81:setWidth(19);
    obj.checkBox81:setHeight(24);
    obj.checkBox81:setField("dot129");
    obj.checkBox81:setName("checkBox81");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.rectangle1);
    obj.layout162:setLeft(359);
    obj.layout162:setTop(767);
    obj.layout162:setWidth(20);
    obj.layout162:setHeight(23);
    obj.layout162:setName("layout162");

    obj.checkBox82 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.layout162);
    obj.checkBox82:setLeft(0);
    obj.checkBox82:setTop(0);
    obj.checkBox82:setWidth(20);
    obj.checkBox82:setHeight(24);
    obj.checkBox82:setField("dot130");
    obj.checkBox82:setName("checkBox82");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.rectangle1);
    obj.layout163:setLeft(376);
    obj.layout163:setTop(767);
    obj.layout163:setWidth(20);
    obj.layout163:setHeight(23);
    obj.layout163:setName("layout163");

    obj.checkBox83 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.layout163);
    obj.checkBox83:setLeft(0);
    obj.checkBox83:setTop(0);
    obj.checkBox83:setWidth(20);
    obj.checkBox83:setHeight(24);
    obj.checkBox83:setField("dot131");
    obj.checkBox83:setName("checkBox83");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.rectangle1);
    obj.layout164:setLeft(393);
    obj.layout164:setTop(767);
    obj.layout164:setWidth(20);
    obj.layout164:setHeight(23);
    obj.layout164:setName("layout164");

    obj.checkBox84 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.layout164);
    obj.checkBox84:setLeft(0);
    obj.checkBox84:setTop(0);
    obj.checkBox84:setWidth(20);
    obj.checkBox84:setHeight(24);
    obj.checkBox84:setField("dot132");
    obj.checkBox84:setName("checkBox84");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.rectangle1);
    obj.layout165:setLeft(410);
    obj.layout165:setTop(767);
    obj.layout165:setWidth(20);
    obj.layout165:setHeight(23);
    obj.layout165:setName("layout165");

    obj.checkBox85 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.layout165);
    obj.checkBox85:setLeft(0);
    obj.checkBox85:setTop(0);
    obj.checkBox85:setWidth(20);
    obj.checkBox85:setHeight(24);
    obj.checkBox85:setField("dot133");
    obj.checkBox85:setName("checkBox85");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.rectangle1);
    obj.layout166:setLeft(342);
    obj.layout166:setTop(923);
    obj.layout166:setWidth(20);
    obj.layout166:setHeight(23);
    obj.layout166:setName("layout166");

    obj.checkBox86 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.layout166);
    obj.checkBox86:setLeft(0);
    obj.checkBox86:setTop(0);
    obj.checkBox86:setWidth(20);
    obj.checkBox86:setHeight(24);
    obj.checkBox86:setField("dot137");
    obj.checkBox86:setName("checkBox86");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.rectangle1);
    obj.layout167:setLeft(359);
    obj.layout167:setTop(923);
    obj.layout167:setWidth(20);
    obj.layout167:setHeight(23);
    obj.layout167:setName("layout167");

    obj.checkBox87 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.layout167);
    obj.checkBox87:setLeft(0);
    obj.checkBox87:setTop(0);
    obj.checkBox87:setWidth(20);
    obj.checkBox87:setHeight(24);
    obj.checkBox87:setField("dot138");
    obj.checkBox87:setName("checkBox87");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.rectangle1);
    obj.layout168:setLeft(376);
    obj.layout168:setTop(923);
    obj.layout168:setWidth(20);
    obj.layout168:setHeight(23);
    obj.layout168:setName("layout168");

    obj.checkBox88 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.layout168);
    obj.checkBox88:setLeft(0);
    obj.checkBox88:setTop(0);
    obj.checkBox88:setWidth(20);
    obj.checkBox88:setHeight(24);
    obj.checkBox88:setField("dot139");
    obj.checkBox88:setName("checkBox88");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.rectangle1);
    obj.layout169:setLeft(393);
    obj.layout169:setTop(923);
    obj.layout169:setWidth(20);
    obj.layout169:setHeight(23);
    obj.layout169:setName("layout169");

    obj.checkBox89 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.layout169);
    obj.checkBox89:setLeft(0);
    obj.checkBox89:setTop(0);
    obj.checkBox89:setWidth(20);
    obj.checkBox89:setHeight(24);
    obj.checkBox89:setField("dot140");
    obj.checkBox89:setName("checkBox89");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.rectangle1);
    obj.layout170:setLeft(410);
    obj.layout170:setTop(923);
    obj.layout170:setWidth(20);
    obj.layout170:setHeight(23);
    obj.layout170:setName("layout170");

    obj.checkBox90 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.layout170);
    obj.checkBox90:setLeft(0);
    obj.checkBox90:setTop(0);
    obj.checkBox90:setWidth(20);
    obj.checkBox90:setHeight(24);
    obj.checkBox90:setField("dot141");
    obj.checkBox90:setName("checkBox90");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.rectangle1);
    obj.layout171:setLeft(342);
    obj.layout171:setTop(949);
    obj.layout171:setWidth(20);
    obj.layout171:setHeight(23);
    obj.layout171:setName("layout171");

    obj.checkBox91 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.layout171);
    obj.checkBox91:setLeft(0);
    obj.checkBox91:setTop(0);
    obj.checkBox91:setWidth(20);
    obj.checkBox91:setHeight(24);
    obj.checkBox91:setField("dot145");
    obj.checkBox91:setName("checkBox91");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.rectangle1);
    obj.layout172:setLeft(359);
    obj.layout172:setTop(949);
    obj.layout172:setWidth(20);
    obj.layout172:setHeight(23);
    obj.layout172:setName("layout172");

    obj.checkBox92 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox92:setParent(obj.layout172);
    obj.checkBox92:setLeft(0);
    obj.checkBox92:setTop(0);
    obj.checkBox92:setWidth(20);
    obj.checkBox92:setHeight(24);
    obj.checkBox92:setField("dot146");
    obj.checkBox92:setName("checkBox92");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.rectangle1);
    obj.layout173:setLeft(376);
    obj.layout173:setTop(949);
    obj.layout173:setWidth(20);
    obj.layout173:setHeight(23);
    obj.layout173:setName("layout173");

    obj.checkBox93 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox93:setParent(obj.layout173);
    obj.checkBox93:setLeft(0);
    obj.checkBox93:setTop(0);
    obj.checkBox93:setWidth(20);
    obj.checkBox93:setHeight(24);
    obj.checkBox93:setField("dot147");
    obj.checkBox93:setName("checkBox93");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.rectangle1);
    obj.layout174:setLeft(393);
    obj.layout174:setTop(949);
    obj.layout174:setWidth(20);
    obj.layout174:setHeight(23);
    obj.layout174:setName("layout174");

    obj.checkBox94 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox94:setParent(obj.layout174);
    obj.checkBox94:setLeft(0);
    obj.checkBox94:setTop(0);
    obj.checkBox94:setWidth(20);
    obj.checkBox94:setHeight(24);
    obj.checkBox94:setField("dot148");
    obj.checkBox94:setName("checkBox94");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.rectangle1);
    obj.layout175:setLeft(410);
    obj.layout175:setTop(949);
    obj.layout175:setWidth(20);
    obj.layout175:setHeight(23);
    obj.layout175:setName("layout175");

    obj.checkBox95 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox95:setParent(obj.layout175);
    obj.checkBox95:setLeft(0);
    obj.checkBox95:setTop(0);
    obj.checkBox95:setWidth(20);
    obj.checkBox95:setHeight(24);
    obj.checkBox95:setField("dot149");
    obj.checkBox95:setName("checkBox95");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.rectangle1);
    obj.layout176:setLeft(342);
    obj.layout176:setTop(975);
    obj.layout176:setWidth(19);
    obj.layout176:setHeight(23);
    obj.layout176:setName("layout176");

    obj.checkBox96 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox96:setParent(obj.layout176);
    obj.checkBox96:setLeft(0);
    obj.checkBox96:setTop(0);
    obj.checkBox96:setWidth(19);
    obj.checkBox96:setHeight(24);
    obj.checkBox96:setField("dot153");
    obj.checkBox96:setName("checkBox96");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.rectangle1);
    obj.layout177:setLeft(359);
    obj.layout177:setTop(975);
    obj.layout177:setWidth(20);
    obj.layout177:setHeight(23);
    obj.layout177:setName("layout177");

    obj.checkBox97 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox97:setParent(obj.layout177);
    obj.checkBox97:setLeft(0);
    obj.checkBox97:setTop(0);
    obj.checkBox97:setWidth(20);
    obj.checkBox97:setHeight(24);
    obj.checkBox97:setField("dot154");
    obj.checkBox97:setName("checkBox97");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.rectangle1);
    obj.layout178:setLeft(376);
    obj.layout178:setTop(975);
    obj.layout178:setWidth(20);
    obj.layout178:setHeight(23);
    obj.layout178:setName("layout178");

    obj.checkBox98 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox98:setParent(obj.layout178);
    obj.checkBox98:setLeft(0);
    obj.checkBox98:setTop(0);
    obj.checkBox98:setWidth(20);
    obj.checkBox98:setHeight(24);
    obj.checkBox98:setField("dot155");
    obj.checkBox98:setName("checkBox98");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.rectangle1);
    obj.layout179:setLeft(393);
    obj.layout179:setTop(975);
    obj.layout179:setWidth(20);
    obj.layout179:setHeight(23);
    obj.layout179:setName("layout179");

    obj.checkBox99 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox99:setParent(obj.layout179);
    obj.checkBox99:setLeft(0);
    obj.checkBox99:setTop(0);
    obj.checkBox99:setWidth(20);
    obj.checkBox99:setHeight(24);
    obj.checkBox99:setField("dot156");
    obj.checkBox99:setName("checkBox99");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.rectangle1);
    obj.layout180:setLeft(410);
    obj.layout180:setTop(975);
    obj.layout180:setWidth(20);
    obj.layout180:setHeight(23);
    obj.layout180:setName("layout180");

    obj.checkBox100 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox100:setParent(obj.layout180);
    obj.checkBox100:setLeft(0);
    obj.checkBox100:setTop(0);
    obj.checkBox100:setWidth(20);
    obj.checkBox100:setHeight(24);
    obj.checkBox100:setField("dot157");
    obj.checkBox100:setName("checkBox100");

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.rectangle1);
    obj.layout181:setLeft(342);
    obj.layout181:setTop(1001);
    obj.layout181:setWidth(19);
    obj.layout181:setHeight(23);
    obj.layout181:setName("layout181");

    obj.checkBox101 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox101:setParent(obj.layout181);
    obj.checkBox101:setLeft(0);
    obj.checkBox101:setTop(0);
    obj.checkBox101:setWidth(19);
    obj.checkBox101:setHeight(24);
    obj.checkBox101:setField("dot161");
    obj.checkBox101:setName("checkBox101");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.rectangle1);
    obj.layout182:setLeft(359);
    obj.layout182:setTop(1001);
    obj.layout182:setWidth(20);
    obj.layout182:setHeight(23);
    obj.layout182:setName("layout182");

    obj.checkBox102 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox102:setParent(obj.layout182);
    obj.checkBox102:setLeft(0);
    obj.checkBox102:setTop(0);
    obj.checkBox102:setWidth(20);
    obj.checkBox102:setHeight(24);
    obj.checkBox102:setField("dot162");
    obj.checkBox102:setName("checkBox102");

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.rectangle1);
    obj.layout183:setLeft(376);
    obj.layout183:setTop(1001);
    obj.layout183:setWidth(20);
    obj.layout183:setHeight(23);
    obj.layout183:setName("layout183");

    obj.checkBox103 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox103:setParent(obj.layout183);
    obj.checkBox103:setLeft(0);
    obj.checkBox103:setTop(0);
    obj.checkBox103:setWidth(20);
    obj.checkBox103:setHeight(24);
    obj.checkBox103:setField("dot163");
    obj.checkBox103:setName("checkBox103");

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.rectangle1);
    obj.layout184:setLeft(393);
    obj.layout184:setTop(1001);
    obj.layout184:setWidth(20);
    obj.layout184:setHeight(23);
    obj.layout184:setName("layout184");

    obj.checkBox104 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox104:setParent(obj.layout184);
    obj.checkBox104:setLeft(0);
    obj.checkBox104:setTop(0);
    obj.checkBox104:setWidth(20);
    obj.checkBox104:setHeight(24);
    obj.checkBox104:setField("dot164");
    obj.checkBox104:setName("checkBox104");

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.rectangle1);
    obj.layout185:setLeft(410);
    obj.layout185:setTop(1001);
    obj.layout185:setWidth(20);
    obj.layout185:setHeight(23);
    obj.layout185:setName("layout185");

    obj.checkBox105 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox105:setParent(obj.layout185);
    obj.checkBox105:setLeft(0);
    obj.checkBox105:setTop(0);
    obj.checkBox105:setWidth(20);
    obj.checkBox105:setHeight(24);
    obj.checkBox105:setField("dot165");
    obj.checkBox105:setName("checkBox105");

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.rectangle1);
    obj.layout186:setLeft(342);
    obj.layout186:setTop(1027);
    obj.layout186:setWidth(19);
    obj.layout186:setHeight(23);
    obj.layout186:setName("layout186");

    obj.checkBox106 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox106:setParent(obj.layout186);
    obj.checkBox106:setLeft(0);
    obj.checkBox106:setTop(0);
    obj.checkBox106:setWidth(19);
    obj.checkBox106:setHeight(24);
    obj.checkBox106:setField("dot169");
    obj.checkBox106:setName("checkBox106");

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.rectangle1);
    obj.layout187:setLeft(359);
    obj.layout187:setTop(1027);
    obj.layout187:setWidth(20);
    obj.layout187:setHeight(23);
    obj.layout187:setName("layout187");

    obj.checkBox107 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox107:setParent(obj.layout187);
    obj.checkBox107:setLeft(0);
    obj.checkBox107:setTop(0);
    obj.checkBox107:setWidth(20);
    obj.checkBox107:setHeight(24);
    obj.checkBox107:setField("dot170");
    obj.checkBox107:setName("checkBox107");

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.rectangle1);
    obj.layout188:setLeft(376);
    obj.layout188:setTop(1027);
    obj.layout188:setWidth(20);
    obj.layout188:setHeight(23);
    obj.layout188:setName("layout188");

    obj.checkBox108 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox108:setParent(obj.layout188);
    obj.checkBox108:setLeft(0);
    obj.checkBox108:setTop(0);
    obj.checkBox108:setWidth(20);
    obj.checkBox108:setHeight(24);
    obj.checkBox108:setField("dot171");
    obj.checkBox108:setName("checkBox108");

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.rectangle1);
    obj.layout189:setLeft(393);
    obj.layout189:setTop(1027);
    obj.layout189:setWidth(20);
    obj.layout189:setHeight(23);
    obj.layout189:setName("layout189");

    obj.checkBox109 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox109:setParent(obj.layout189);
    obj.checkBox109:setLeft(0);
    obj.checkBox109:setTop(0);
    obj.checkBox109:setWidth(20);
    obj.checkBox109:setHeight(24);
    obj.checkBox109:setField("dot172");
    obj.checkBox109:setName("checkBox109");

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.rectangle1);
    obj.layout190:setLeft(410);
    obj.layout190:setTop(1027);
    obj.layout190:setWidth(20);
    obj.layout190:setHeight(23);
    obj.layout190:setName("layout190");

    obj.checkBox110 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox110:setParent(obj.layout190);
    obj.checkBox110:setLeft(0);
    obj.checkBox110:setTop(0);
    obj.checkBox110:setWidth(20);
    obj.checkBox110:setHeight(24);
    obj.checkBox110:setField("dot173");
    obj.checkBox110:setName("checkBox110");

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.rectangle1);
    obj.layout191:setLeft(342);
    obj.layout191:setTop(1053);
    obj.layout191:setWidth(19);
    obj.layout191:setHeight(23);
    obj.layout191:setName("layout191");

    obj.checkBox111 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox111:setParent(obj.layout191);
    obj.checkBox111:setLeft(0);
    obj.checkBox111:setTop(0);
    obj.checkBox111:setWidth(19);
    obj.checkBox111:setHeight(24);
    obj.checkBox111:setField("dot177");
    obj.checkBox111:setName("checkBox111");

    obj.layout192 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.rectangle1);
    obj.layout192:setLeft(359);
    obj.layout192:setTop(1053);
    obj.layout192:setWidth(20);
    obj.layout192:setHeight(23);
    obj.layout192:setName("layout192");

    obj.checkBox112 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox112:setParent(obj.layout192);
    obj.checkBox112:setLeft(0);
    obj.checkBox112:setTop(0);
    obj.checkBox112:setWidth(20);
    obj.checkBox112:setHeight(24);
    obj.checkBox112:setField("dot178");
    obj.checkBox112:setName("checkBox112");

    obj.layout193 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.rectangle1);
    obj.layout193:setLeft(376);
    obj.layout193:setTop(1053);
    obj.layout193:setWidth(20);
    obj.layout193:setHeight(23);
    obj.layout193:setName("layout193");

    obj.checkBox113 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox113:setParent(obj.layout193);
    obj.checkBox113:setLeft(0);
    obj.checkBox113:setTop(0);
    obj.checkBox113:setWidth(20);
    obj.checkBox113:setHeight(24);
    obj.checkBox113:setField("dot179");
    obj.checkBox113:setName("checkBox113");

    obj.layout194 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.rectangle1);
    obj.layout194:setLeft(393);
    obj.layout194:setTop(1053);
    obj.layout194:setWidth(20);
    obj.layout194:setHeight(23);
    obj.layout194:setName("layout194");

    obj.checkBox114 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox114:setParent(obj.layout194);
    obj.checkBox114:setLeft(0);
    obj.checkBox114:setTop(0);
    obj.checkBox114:setWidth(20);
    obj.checkBox114:setHeight(24);
    obj.checkBox114:setField("dot180");
    obj.checkBox114:setName("checkBox114");

    obj.layout195 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.rectangle1);
    obj.layout195:setLeft(410);
    obj.layout195:setTop(1053);
    obj.layout195:setWidth(20);
    obj.layout195:setHeight(23);
    obj.layout195:setName("layout195");

    obj.checkBox115 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox115:setParent(obj.layout195);
    obj.checkBox115:setLeft(0);
    obj.checkBox115:setTop(0);
    obj.checkBox115:setWidth(20);
    obj.checkBox115:setHeight(24);
    obj.checkBox115:setField("dot181");
    obj.checkBox115:setName("checkBox115");

    obj.layout196 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.rectangle1);
    obj.layout196:setLeft(342);
    obj.layout196:setTop(1079);
    obj.layout196:setWidth(19);
    obj.layout196:setHeight(23);
    obj.layout196:setName("layout196");

    obj.checkBox116 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox116:setParent(obj.layout196);
    obj.checkBox116:setLeft(0);
    obj.checkBox116:setTop(0);
    obj.checkBox116:setWidth(19);
    obj.checkBox116:setHeight(24);
    obj.checkBox116:setField("dot185");
    obj.checkBox116:setName("checkBox116");

    obj.layout197 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.rectangle1);
    obj.layout197:setLeft(359);
    obj.layout197:setTop(1079);
    obj.layout197:setWidth(20);
    obj.layout197:setHeight(23);
    obj.layout197:setName("layout197");

    obj.checkBox117 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox117:setParent(obj.layout197);
    obj.checkBox117:setLeft(0);
    obj.checkBox117:setTop(0);
    obj.checkBox117:setWidth(20);
    obj.checkBox117:setHeight(24);
    obj.checkBox117:setField("dot186");
    obj.checkBox117:setName("checkBox117");

    obj.layout198 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.rectangle1);
    obj.layout198:setLeft(376);
    obj.layout198:setTop(1079);
    obj.layout198:setWidth(20);
    obj.layout198:setHeight(23);
    obj.layout198:setName("layout198");

    obj.checkBox118 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox118:setParent(obj.layout198);
    obj.checkBox118:setLeft(0);
    obj.checkBox118:setTop(0);
    obj.checkBox118:setWidth(20);
    obj.checkBox118:setHeight(24);
    obj.checkBox118:setField("dot187");
    obj.checkBox118:setName("checkBox118");

    obj.layout199 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.rectangle1);
    obj.layout199:setLeft(393);
    obj.layout199:setTop(1079);
    obj.layout199:setWidth(20);
    obj.layout199:setHeight(23);
    obj.layout199:setName("layout199");

    obj.checkBox119 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox119:setParent(obj.layout199);
    obj.checkBox119:setLeft(0);
    obj.checkBox119:setTop(0);
    obj.checkBox119:setWidth(20);
    obj.checkBox119:setHeight(24);
    obj.checkBox119:setField("dot188");
    obj.checkBox119:setName("checkBox119");

    obj.layout200 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.rectangle1);
    obj.layout200:setLeft(410);
    obj.layout200:setTop(1079);
    obj.layout200:setWidth(20);
    obj.layout200:setHeight(23);
    obj.layout200:setName("layout200");

    obj.checkBox120 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox120:setParent(obj.layout200);
    obj.checkBox120:setLeft(0);
    obj.checkBox120:setTop(0);
    obj.checkBox120:setWidth(20);
    obj.checkBox120:setHeight(24);
    obj.checkBox120:setField("dot189");
    obj.checkBox120:setName("checkBox120");

    obj.layout201 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.rectangle1);
    obj.layout201:setLeft(342);
    obj.layout201:setTop(1105);
    obj.layout201:setWidth(19);
    obj.layout201:setHeight(23);
    obj.layout201:setName("layout201");

    obj.checkBox121 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox121:setParent(obj.layout201);
    obj.checkBox121:setLeft(0);
    obj.checkBox121:setTop(0);
    obj.checkBox121:setWidth(19);
    obj.checkBox121:setHeight(24);
    obj.checkBox121:setField("dot193");
    obj.checkBox121:setName("checkBox121");

    obj.layout202 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.rectangle1);
    obj.layout202:setLeft(359);
    obj.layout202:setTop(1105);
    obj.layout202:setWidth(20);
    obj.layout202:setHeight(23);
    obj.layout202:setName("layout202");

    obj.checkBox122 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox122:setParent(obj.layout202);
    obj.checkBox122:setLeft(0);
    obj.checkBox122:setTop(0);
    obj.checkBox122:setWidth(20);
    obj.checkBox122:setHeight(24);
    obj.checkBox122:setField("dot194");
    obj.checkBox122:setName("checkBox122");

    obj.layout203 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.rectangle1);
    obj.layout203:setLeft(376);
    obj.layout203:setTop(1105);
    obj.layout203:setWidth(20);
    obj.layout203:setHeight(23);
    obj.layout203:setName("layout203");

    obj.checkBox123 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox123:setParent(obj.layout203);
    obj.checkBox123:setLeft(0);
    obj.checkBox123:setTop(0);
    obj.checkBox123:setWidth(20);
    obj.checkBox123:setHeight(24);
    obj.checkBox123:setField("dot195");
    obj.checkBox123:setName("checkBox123");

    obj.layout204 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.rectangle1);
    obj.layout204:setLeft(393);
    obj.layout204:setTop(1105);
    obj.layout204:setWidth(20);
    obj.layout204:setHeight(23);
    obj.layout204:setName("layout204");

    obj.checkBox124 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox124:setParent(obj.layout204);
    obj.checkBox124:setLeft(0);
    obj.checkBox124:setTop(0);
    obj.checkBox124:setWidth(20);
    obj.checkBox124:setHeight(24);
    obj.checkBox124:setField("dot196");
    obj.checkBox124:setName("checkBox124");

    obj.layout205 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.rectangle1);
    obj.layout205:setLeft(410);
    obj.layout205:setTop(1105);
    obj.layout205:setWidth(20);
    obj.layout205:setHeight(23);
    obj.layout205:setName("layout205");

    obj.checkBox125 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox125:setParent(obj.layout205);
    obj.checkBox125:setLeft(0);
    obj.checkBox125:setTop(0);
    obj.checkBox125:setWidth(20);
    obj.checkBox125:setHeight(24);
    obj.checkBox125:setField("dot197");
    obj.checkBox125:setName("checkBox125");

    obj.layout206 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.rectangle1);
    obj.layout206:setLeft(342);
    obj.layout206:setTop(1261);
    obj.layout206:setWidth(19);
    obj.layout206:setHeight(23);
    obj.layout206:setName("layout206");

    obj.checkBox126 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox126:setParent(obj.layout206);
    obj.checkBox126:setLeft(0);
    obj.checkBox126:setTop(0);
    obj.checkBox126:setWidth(19);
    obj.checkBox126:setHeight(24);
    obj.checkBox126:setField("dot201");
    obj.checkBox126:setName("checkBox126");

    obj.layout207 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.rectangle1);
    obj.layout207:setLeft(359);
    obj.layout207:setTop(1261);
    obj.layout207:setWidth(20);
    obj.layout207:setHeight(23);
    obj.layout207:setName("layout207");

    obj.checkBox127 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox127:setParent(obj.layout207);
    obj.checkBox127:setLeft(0);
    obj.checkBox127:setTop(0);
    obj.checkBox127:setWidth(20);
    obj.checkBox127:setHeight(24);
    obj.checkBox127:setField("dot202");
    obj.checkBox127:setName("checkBox127");

    obj.layout208 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.rectangle1);
    obj.layout208:setLeft(376);
    obj.layout208:setTop(1261);
    obj.layout208:setWidth(20);
    obj.layout208:setHeight(23);
    obj.layout208:setName("layout208");

    obj.checkBox128 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox128:setParent(obj.layout208);
    obj.checkBox128:setLeft(0);
    obj.checkBox128:setTop(0);
    obj.checkBox128:setWidth(20);
    obj.checkBox128:setHeight(24);
    obj.checkBox128:setField("dot203");
    obj.checkBox128:setName("checkBox128");

    obj.layout209 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.rectangle1);
    obj.layout209:setLeft(393);
    obj.layout209:setTop(1261);
    obj.layout209:setWidth(20);
    obj.layout209:setHeight(23);
    obj.layout209:setName("layout209");

    obj.checkBox129 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox129:setParent(obj.layout209);
    obj.checkBox129:setLeft(0);
    obj.checkBox129:setTop(0);
    obj.checkBox129:setWidth(20);
    obj.checkBox129:setHeight(24);
    obj.checkBox129:setField("dot204");
    obj.checkBox129:setName("checkBox129");

    obj.layout210 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.rectangle1);
    obj.layout210:setLeft(410);
    obj.layout210:setTop(1261);
    obj.layout210:setWidth(20);
    obj.layout210:setHeight(23);
    obj.layout210:setName("layout210");

    obj.checkBox130 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox130:setParent(obj.layout210);
    obj.checkBox130:setLeft(0);
    obj.checkBox130:setTop(0);
    obj.checkBox130:setWidth(20);
    obj.checkBox130:setHeight(24);
    obj.checkBox130:setField("dot205");
    obj.checkBox130:setName("checkBox130");

    obj.layout211 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.rectangle1);
    obj.layout211:setLeft(342);
    obj.layout211:setTop(1287);
    obj.layout211:setWidth(19);
    obj.layout211:setHeight(23);
    obj.layout211:setName("layout211");

    obj.checkBox131 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox131:setParent(obj.layout211);
    obj.checkBox131:setLeft(0);
    obj.checkBox131:setTop(0);
    obj.checkBox131:setWidth(19);
    obj.checkBox131:setHeight(24);
    obj.checkBox131:setField("dot209");
    obj.checkBox131:setName("checkBox131");

    obj.layout212 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.rectangle1);
    obj.layout212:setLeft(359);
    obj.layout212:setTop(1287);
    obj.layout212:setWidth(20);
    obj.layout212:setHeight(23);
    obj.layout212:setName("layout212");

    obj.checkBox132 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox132:setParent(obj.layout212);
    obj.checkBox132:setLeft(0);
    obj.checkBox132:setTop(0);
    obj.checkBox132:setWidth(20);
    obj.checkBox132:setHeight(24);
    obj.checkBox132:setField("dot210");
    obj.checkBox132:setName("checkBox132");

    obj.layout213 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.rectangle1);
    obj.layout213:setLeft(376);
    obj.layout213:setTop(1287);
    obj.layout213:setWidth(20);
    obj.layout213:setHeight(23);
    obj.layout213:setName("layout213");

    obj.checkBox133 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox133:setParent(obj.layout213);
    obj.checkBox133:setLeft(0);
    obj.checkBox133:setTop(0);
    obj.checkBox133:setWidth(20);
    obj.checkBox133:setHeight(24);
    obj.checkBox133:setField("dot211");
    obj.checkBox133:setName("checkBox133");

    obj.layout214 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.rectangle1);
    obj.layout214:setLeft(393);
    obj.layout214:setTop(1287);
    obj.layout214:setWidth(20);
    obj.layout214:setHeight(23);
    obj.layout214:setName("layout214");

    obj.checkBox134 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox134:setParent(obj.layout214);
    obj.checkBox134:setLeft(0);
    obj.checkBox134:setTop(0);
    obj.checkBox134:setWidth(20);
    obj.checkBox134:setHeight(24);
    obj.checkBox134:setField("dot212");
    obj.checkBox134:setName("checkBox134");

    obj.layout215 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.rectangle1);
    obj.layout215:setLeft(410);
    obj.layout215:setTop(1287);
    obj.layout215:setWidth(20);
    obj.layout215:setHeight(23);
    obj.layout215:setName("layout215");

    obj.checkBox135 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox135:setParent(obj.layout215);
    obj.checkBox135:setLeft(0);
    obj.checkBox135:setTop(0);
    obj.checkBox135:setWidth(20);
    obj.checkBox135:setHeight(24);
    obj.checkBox135:setField("dot213");
    obj.checkBox135:setName("checkBox135");

    obj.layout216 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.rectangle1);
    obj.layout216:setLeft(342);
    obj.layout216:setTop(1313);
    obj.layout216:setWidth(19);
    obj.layout216:setHeight(23);
    obj.layout216:setName("layout216");

    obj.checkBox136 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox136:setParent(obj.layout216);
    obj.checkBox136:setLeft(0);
    obj.checkBox136:setTop(0);
    obj.checkBox136:setWidth(19);
    obj.checkBox136:setHeight(24);
    obj.checkBox136:setField("dot217");
    obj.checkBox136:setName("checkBox136");

    obj.layout217 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.rectangle1);
    obj.layout217:setLeft(359);
    obj.layout217:setTop(1313);
    obj.layout217:setWidth(20);
    obj.layout217:setHeight(23);
    obj.layout217:setName("layout217");

    obj.checkBox137 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox137:setParent(obj.layout217);
    obj.checkBox137:setLeft(0);
    obj.checkBox137:setTop(0);
    obj.checkBox137:setWidth(20);
    obj.checkBox137:setHeight(24);
    obj.checkBox137:setField("dot218");
    obj.checkBox137:setName("checkBox137");

    obj.layout218 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.rectangle1);
    obj.layout218:setLeft(376);
    obj.layout218:setTop(1313);
    obj.layout218:setWidth(20);
    obj.layout218:setHeight(23);
    obj.layout218:setName("layout218");

    obj.checkBox138 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox138:setParent(obj.layout218);
    obj.checkBox138:setLeft(0);
    obj.checkBox138:setTop(0);
    obj.checkBox138:setWidth(20);
    obj.checkBox138:setHeight(24);
    obj.checkBox138:setField("dot219");
    obj.checkBox138:setName("checkBox138");

    obj.layout219 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.rectangle1);
    obj.layout219:setLeft(393);
    obj.layout219:setTop(1313);
    obj.layout219:setWidth(20);
    obj.layout219:setHeight(23);
    obj.layout219:setName("layout219");

    obj.checkBox139 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox139:setParent(obj.layout219);
    obj.checkBox139:setLeft(0);
    obj.checkBox139:setTop(0);
    obj.checkBox139:setWidth(20);
    obj.checkBox139:setHeight(24);
    obj.checkBox139:setField("dot220");
    obj.checkBox139:setName("checkBox139");

    obj.layout220 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.rectangle1);
    obj.layout220:setLeft(410);
    obj.layout220:setTop(1313);
    obj.layout220:setWidth(20);
    obj.layout220:setHeight(23);
    obj.layout220:setName("layout220");

    obj.checkBox140 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox140:setParent(obj.layout220);
    obj.checkBox140:setLeft(0);
    obj.checkBox140:setTop(0);
    obj.checkBox140:setWidth(20);
    obj.checkBox140:setHeight(24);
    obj.checkBox140:setField("dot221");
    obj.checkBox140:setName("checkBox140");

    obj.layout221 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.rectangle1);
    obj.layout221:setLeft(342);
    obj.layout221:setTop(1339);
    obj.layout221:setWidth(19);
    obj.layout221:setHeight(23);
    obj.layout221:setName("layout221");

    obj.checkBox141 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox141:setParent(obj.layout221);
    obj.checkBox141:setLeft(0);
    obj.checkBox141:setTop(0);
    obj.checkBox141:setWidth(19);
    obj.checkBox141:setHeight(24);
    obj.checkBox141:setField("dot225");
    obj.checkBox141:setName("checkBox141");

    obj.layout222 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.rectangle1);
    obj.layout222:setLeft(359);
    obj.layout222:setTop(1339);
    obj.layout222:setWidth(20);
    obj.layout222:setHeight(23);
    obj.layout222:setName("layout222");

    obj.checkBox142 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox142:setParent(obj.layout222);
    obj.checkBox142:setLeft(0);
    obj.checkBox142:setTop(0);
    obj.checkBox142:setWidth(20);
    obj.checkBox142:setHeight(24);
    obj.checkBox142:setField("dot226");
    obj.checkBox142:setName("checkBox142");

    obj.layout223 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout223:setParent(obj.rectangle1);
    obj.layout223:setLeft(376);
    obj.layout223:setTop(1339);
    obj.layout223:setWidth(20);
    obj.layout223:setHeight(23);
    obj.layout223:setName("layout223");

    obj.checkBox143 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox143:setParent(obj.layout223);
    obj.checkBox143:setLeft(0);
    obj.checkBox143:setTop(0);
    obj.checkBox143:setWidth(20);
    obj.checkBox143:setHeight(24);
    obj.checkBox143:setField("dot227");
    obj.checkBox143:setName("checkBox143");

    obj.layout224 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout224:setParent(obj.rectangle1);
    obj.layout224:setLeft(393);
    obj.layout224:setTop(1339);
    obj.layout224:setWidth(20);
    obj.layout224:setHeight(23);
    obj.layout224:setName("layout224");

    obj.checkBox144 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox144:setParent(obj.layout224);
    obj.checkBox144:setLeft(0);
    obj.checkBox144:setTop(0);
    obj.checkBox144:setWidth(20);
    obj.checkBox144:setHeight(24);
    obj.checkBox144:setField("dot228");
    obj.checkBox144:setName("checkBox144");

    obj.layout225 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout225:setParent(obj.rectangle1);
    obj.layout225:setLeft(410);
    obj.layout225:setTop(1339);
    obj.layout225:setWidth(20);
    obj.layout225:setHeight(23);
    obj.layout225:setName("layout225");

    obj.checkBox145 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox145:setParent(obj.layout225);
    obj.checkBox145:setLeft(0);
    obj.checkBox145:setTop(0);
    obj.checkBox145:setWidth(20);
    obj.checkBox145:setHeight(24);
    obj.checkBox145:setField("dot229");
    obj.checkBox145:setName("checkBox145");

    obj.layout226 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout226:setParent(obj.rectangle1);
    obj.layout226:setLeft(342);
    obj.layout226:setTop(1365);
    obj.layout226:setWidth(19);
    obj.layout226:setHeight(23);
    obj.layout226:setName("layout226");

    obj.checkBox146 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox146:setParent(obj.layout226);
    obj.checkBox146:setLeft(0);
    obj.checkBox146:setTop(0);
    obj.checkBox146:setWidth(19);
    obj.checkBox146:setHeight(24);
    obj.checkBox146:setField("dot233");
    obj.checkBox146:setName("checkBox146");

    obj.layout227 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout227:setParent(obj.rectangle1);
    obj.layout227:setLeft(359);
    obj.layout227:setTop(1365);
    obj.layout227:setWidth(20);
    obj.layout227:setHeight(23);
    obj.layout227:setName("layout227");

    obj.checkBox147 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox147:setParent(obj.layout227);
    obj.checkBox147:setLeft(0);
    obj.checkBox147:setTop(0);
    obj.checkBox147:setWidth(20);
    obj.checkBox147:setHeight(24);
    obj.checkBox147:setField("dot234");
    obj.checkBox147:setName("checkBox147");

    obj.layout228 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout228:setParent(obj.rectangle1);
    obj.layout228:setLeft(376);
    obj.layout228:setTop(1365);
    obj.layout228:setWidth(20);
    obj.layout228:setHeight(23);
    obj.layout228:setName("layout228");

    obj.checkBox148 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox148:setParent(obj.layout228);
    obj.checkBox148:setLeft(0);
    obj.checkBox148:setTop(0);
    obj.checkBox148:setWidth(20);
    obj.checkBox148:setHeight(24);
    obj.checkBox148:setField("dot235");
    obj.checkBox148:setName("checkBox148");

    obj.layout229 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout229:setParent(obj.rectangle1);
    obj.layout229:setLeft(393);
    obj.layout229:setTop(1365);
    obj.layout229:setWidth(20);
    obj.layout229:setHeight(23);
    obj.layout229:setName("layout229");

    obj.checkBox149 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox149:setParent(obj.layout229);
    obj.checkBox149:setLeft(0);
    obj.checkBox149:setTop(0);
    obj.checkBox149:setWidth(20);
    obj.checkBox149:setHeight(24);
    obj.checkBox149:setField("dot236");
    obj.checkBox149:setName("checkBox149");

    obj.layout230 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout230:setParent(obj.rectangle1);
    obj.layout230:setLeft(410);
    obj.layout230:setTop(1365);
    obj.layout230:setWidth(20);
    obj.layout230:setHeight(23);
    obj.layout230:setName("layout230");

    obj.checkBox150 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox150:setParent(obj.layout230);
    obj.checkBox150:setLeft(0);
    obj.checkBox150:setTop(0);
    obj.checkBox150:setWidth(20);
    obj.checkBox150:setHeight(24);
    obj.checkBox150:setField("dot237");
    obj.checkBox150:setName("checkBox150");

    obj.layout231 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout231:setParent(obj.rectangle1);
    obj.layout231:setLeft(342);
    obj.layout231:setTop(1391);
    obj.layout231:setWidth(19);
    obj.layout231:setHeight(23);
    obj.layout231:setName("layout231");

    obj.checkBox151 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox151:setParent(obj.layout231);
    obj.checkBox151:setLeft(0);
    obj.checkBox151:setTop(0);
    obj.checkBox151:setWidth(19);
    obj.checkBox151:setHeight(24);
    obj.checkBox151:setField("dot241");
    obj.checkBox151:setName("checkBox151");

    obj.layout232 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout232:setParent(obj.rectangle1);
    obj.layout232:setLeft(359);
    obj.layout232:setTop(1391);
    obj.layout232:setWidth(20);
    obj.layout232:setHeight(23);
    obj.layout232:setName("layout232");

    obj.checkBox152 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox152:setParent(obj.layout232);
    obj.checkBox152:setLeft(0);
    obj.checkBox152:setTop(0);
    obj.checkBox152:setWidth(20);
    obj.checkBox152:setHeight(24);
    obj.checkBox152:setField("dot242");
    obj.checkBox152:setName("checkBox152");

    obj.layout233 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout233:setParent(obj.rectangle1);
    obj.layout233:setLeft(376);
    obj.layout233:setTop(1391);
    obj.layout233:setWidth(20);
    obj.layout233:setHeight(23);
    obj.layout233:setName("layout233");

    obj.checkBox153 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox153:setParent(obj.layout233);
    obj.checkBox153:setLeft(0);
    obj.checkBox153:setTop(0);
    obj.checkBox153:setWidth(20);
    obj.checkBox153:setHeight(24);
    obj.checkBox153:setField("dot243");
    obj.checkBox153:setName("checkBox153");

    obj.layout234 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout234:setParent(obj.rectangle1);
    obj.layout234:setLeft(393);
    obj.layout234:setTop(1391);
    obj.layout234:setWidth(20);
    obj.layout234:setHeight(23);
    obj.layout234:setName("layout234");

    obj.checkBox154 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox154:setParent(obj.layout234);
    obj.checkBox154:setLeft(0);
    obj.checkBox154:setTop(0);
    obj.checkBox154:setWidth(20);
    obj.checkBox154:setHeight(24);
    obj.checkBox154:setField("dot244");
    obj.checkBox154:setName("checkBox154");

    obj.layout235 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout235:setParent(obj.rectangle1);
    obj.layout235:setLeft(410);
    obj.layout235:setTop(1391);
    obj.layout235:setWidth(20);
    obj.layout235:setHeight(23);
    obj.layout235:setName("layout235");

    obj.checkBox155 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox155:setParent(obj.layout235);
    obj.checkBox155:setLeft(0);
    obj.checkBox155:setTop(0);
    obj.checkBox155:setWidth(20);
    obj.checkBox155:setHeight(24);
    obj.checkBox155:setField("dot245");
    obj.checkBox155:setName("checkBox155");

    obj.layout236 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout236:setParent(obj.rectangle1);
    obj.layout236:setLeft(342);
    obj.layout236:setTop(1417);
    obj.layout236:setWidth(19);
    obj.layout236:setHeight(23);
    obj.layout236:setName("layout236");

    obj.checkBox156 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox156:setParent(obj.layout236);
    obj.checkBox156:setLeft(0);
    obj.checkBox156:setTop(0);
    obj.checkBox156:setWidth(19);
    obj.checkBox156:setHeight(24);
    obj.checkBox156:setField("dot249");
    obj.checkBox156:setName("checkBox156");

    obj.layout237 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout237:setParent(obj.rectangle1);
    obj.layout237:setLeft(359);
    obj.layout237:setTop(1417);
    obj.layout237:setWidth(20);
    obj.layout237:setHeight(23);
    obj.layout237:setName("layout237");

    obj.checkBox157 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox157:setParent(obj.layout237);
    obj.checkBox157:setLeft(0);
    obj.checkBox157:setTop(0);
    obj.checkBox157:setWidth(20);
    obj.checkBox157:setHeight(24);
    obj.checkBox157:setField("dot250");
    obj.checkBox157:setName("checkBox157");

    obj.layout238 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout238:setParent(obj.rectangle1);
    obj.layout238:setLeft(376);
    obj.layout238:setTop(1417);
    obj.layout238:setWidth(20);
    obj.layout238:setHeight(23);
    obj.layout238:setName("layout238");

    obj.checkBox158 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox158:setParent(obj.layout238);
    obj.checkBox158:setLeft(0);
    obj.checkBox158:setTop(0);
    obj.checkBox158:setWidth(20);
    obj.checkBox158:setHeight(24);
    obj.checkBox158:setField("dot251");
    obj.checkBox158:setName("checkBox158");

    obj.layout239 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout239:setParent(obj.rectangle1);
    obj.layout239:setLeft(393);
    obj.layout239:setTop(1417);
    obj.layout239:setWidth(20);
    obj.layout239:setHeight(23);
    obj.layout239:setName("layout239");

    obj.checkBox159 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox159:setParent(obj.layout239);
    obj.checkBox159:setLeft(0);
    obj.checkBox159:setTop(0);
    obj.checkBox159:setWidth(20);
    obj.checkBox159:setHeight(24);
    obj.checkBox159:setField("dot252");
    obj.checkBox159:setName("checkBox159");

    obj.layout240 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout240:setParent(obj.rectangle1);
    obj.layout240:setLeft(410);
    obj.layout240:setTop(1417);
    obj.layout240:setWidth(20);
    obj.layout240:setHeight(23);
    obj.layout240:setName("layout240");

    obj.checkBox160 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox160:setParent(obj.layout240);
    obj.checkBox160:setLeft(0);
    obj.checkBox160:setTop(0);
    obj.checkBox160:setWidth(20);
    obj.checkBox160:setHeight(24);
    obj.checkBox160:setField("dot253");
    obj.checkBox160:setName("checkBox160");

    obj.layout241 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout241:setParent(obj.rectangle1);
    obj.layout241:setLeft(342);
    obj.layout241:setTop(1443);
    obj.layout241:setWidth(19);
    obj.layout241:setHeight(23);
    obj.layout241:setName("layout241");

    obj.checkBox161 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox161:setParent(obj.layout241);
    obj.checkBox161:setLeft(0);
    obj.checkBox161:setTop(0);
    obj.checkBox161:setWidth(19);
    obj.checkBox161:setHeight(24);
    obj.checkBox161:setField("dot257");
    obj.checkBox161:setName("checkBox161");

    obj.layout242 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout242:setParent(obj.rectangle1);
    obj.layout242:setLeft(359);
    obj.layout242:setTop(1443);
    obj.layout242:setWidth(20);
    obj.layout242:setHeight(23);
    obj.layout242:setName("layout242");

    obj.checkBox162 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox162:setParent(obj.layout242);
    obj.checkBox162:setLeft(0);
    obj.checkBox162:setTop(0);
    obj.checkBox162:setWidth(20);
    obj.checkBox162:setHeight(24);
    obj.checkBox162:setField("dot258");
    obj.checkBox162:setName("checkBox162");

    obj.layout243 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout243:setParent(obj.rectangle1);
    obj.layout243:setLeft(376);
    obj.layout243:setTop(1443);
    obj.layout243:setWidth(20);
    obj.layout243:setHeight(23);
    obj.layout243:setName("layout243");

    obj.checkBox163 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox163:setParent(obj.layout243);
    obj.checkBox163:setLeft(0);
    obj.checkBox163:setTop(0);
    obj.checkBox163:setWidth(20);
    obj.checkBox163:setHeight(24);
    obj.checkBox163:setField("dot259");
    obj.checkBox163:setName("checkBox163");

    obj.layout244 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout244:setParent(obj.rectangle1);
    obj.layout244:setLeft(393);
    obj.layout244:setTop(1443);
    obj.layout244:setWidth(20);
    obj.layout244:setHeight(23);
    obj.layout244:setName("layout244");

    obj.checkBox164 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox164:setParent(obj.layout244);
    obj.checkBox164:setLeft(0);
    obj.checkBox164:setTop(0);
    obj.checkBox164:setWidth(20);
    obj.checkBox164:setHeight(24);
    obj.checkBox164:setField("dot260");
    obj.checkBox164:setName("checkBox164");

    obj.layout245 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout245:setParent(obj.rectangle1);
    obj.layout245:setLeft(410);
    obj.layout245:setTop(1443);
    obj.layout245:setWidth(20);
    obj.layout245:setHeight(23);
    obj.layout245:setName("layout245");

    obj.checkBox165 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox165:setParent(obj.layout245);
    obj.checkBox165:setLeft(0);
    obj.checkBox165:setTop(0);
    obj.checkBox165:setWidth(20);
    obj.checkBox165:setHeight(24);
    obj.checkBox165:setField("dot261");
    obj.checkBox165:setName("checkBox165");

    obj.layout246 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout246:setParent(obj.rectangle1);
    obj.layout246:setLeft(118);
    obj.layout246:setTop(585);
    obj.layout246:setWidth(18);
    obj.layout246:setHeight(19);
    obj.layout246:setName("layout246");

    obj.checkBox166 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox166:setParent(obj.layout246);
    obj.checkBox166:setLeft(0);
    obj.checkBox166:setTop(0);
    obj.checkBox166:setWidth(18);
    obj.checkBox166:setHeight(20);
    obj.checkBox166:setField("rotecheck1");
    obj.checkBox166:setName("checkBox166");

    obj.layout247 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout247:setParent(obj.rectangle1);
    obj.layout247:setLeft(118);
    obj.layout247:setTop(611);
    obj.layout247:setWidth(18);
    obj.layout247:setHeight(19);
    obj.layout247:setName("layout247");

    obj.checkBox167 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox167:setParent(obj.layout247);
    obj.checkBox167:setLeft(0);
    obj.checkBox167:setTop(0);
    obj.checkBox167:setWidth(18);
    obj.checkBox167:setHeight(20);
    obj.checkBox167:setField("rotecheck2");
    obj.checkBox167:setName("checkBox167");

    obj.layout248 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout248:setParent(obj.rectangle1);
    obj.layout248:setLeft(118);
    obj.layout248:setTop(637);
    obj.layout248:setWidth(18);
    obj.layout248:setHeight(19);
    obj.layout248:setName("layout248");

    obj.checkBox168 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox168:setParent(obj.layout248);
    obj.checkBox168:setLeft(0);
    obj.checkBox168:setTop(0);
    obj.checkBox168:setWidth(18);
    obj.checkBox168:setHeight(20);
    obj.checkBox168:setField("rotecheck3");
    obj.checkBox168:setName("checkBox168");

    obj.layout249 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout249:setParent(obj.rectangle1);
    obj.layout249:setLeft(118);
    obj.layout249:setTop(663);
    obj.layout249:setWidth(18);
    obj.layout249:setHeight(19);
    obj.layout249:setName("layout249");

    obj.checkBox169 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox169:setParent(obj.layout249);
    obj.checkBox169:setLeft(0);
    obj.checkBox169:setTop(0);
    obj.checkBox169:setWidth(18);
    obj.checkBox169:setHeight(20);
    obj.checkBox169:setField("rotecheck4");
    obj.checkBox169:setName("checkBox169");

    obj.layout250 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout250:setParent(obj.rectangle1);
    obj.layout250:setLeft(118);
    obj.layout250:setTop(689);
    obj.layout250:setWidth(18);
    obj.layout250:setHeight(19);
    obj.layout250:setName("layout250");

    obj.checkBox170 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox170:setParent(obj.layout250);
    obj.checkBox170:setLeft(0);
    obj.checkBox170:setTop(0);
    obj.checkBox170:setWidth(18);
    obj.checkBox170:setHeight(20);
    obj.checkBox170:setField("rotecheck5");
    obj.checkBox170:setName("checkBox170");

    obj.layout251 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout251:setParent(obj.rectangle1);
    obj.layout251:setLeft(118);
    obj.layout251:setTop(715);
    obj.layout251:setWidth(18);
    obj.layout251:setHeight(19);
    obj.layout251:setName("layout251");

    obj.checkBox171 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox171:setParent(obj.layout251);
    obj.checkBox171:setLeft(0);
    obj.checkBox171:setTop(0);
    obj.checkBox171:setWidth(18);
    obj.checkBox171:setHeight(20);
    obj.checkBox171:setField("rotecheck6");
    obj.checkBox171:setName("checkBox171");

    obj.layout252 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout252:setParent(obj.rectangle1);
    obj.layout252:setLeft(118);
    obj.layout252:setTop(741);
    obj.layout252:setWidth(18);
    obj.layout252:setHeight(19);
    obj.layout252:setName("layout252");

    obj.checkBox172 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox172:setParent(obj.layout252);
    obj.checkBox172:setLeft(0);
    obj.checkBox172:setTop(0);
    obj.checkBox172:setWidth(18);
    obj.checkBox172:setHeight(20);
    obj.checkBox172:setField("rotecheck7");
    obj.checkBox172:setName("checkBox172");

    obj.layout253 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout253:setParent(obj.rectangle1);
    obj.layout253:setLeft(118);
    obj.layout253:setTop(767);
    obj.layout253:setWidth(18);
    obj.layout253:setHeight(19);
    obj.layout253:setName("layout253");

    obj.checkBox173 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox173:setParent(obj.layout253);
    obj.checkBox173:setLeft(0);
    obj.checkBox173:setTop(0);
    obj.checkBox173:setWidth(18);
    obj.checkBox173:setHeight(20);
    obj.checkBox173:setField("rotecheck8");
    obj.checkBox173:setName("checkBox173");

    obj.layout254 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout254:setParent(obj.rectangle1);
    obj.layout254:setLeft(118);
    obj.layout254:setTop(923);
    obj.layout254:setWidth(18);
    obj.layout254:setHeight(19);
    obj.layout254:setName("layout254");

    obj.checkBox174 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox174:setParent(obj.layout254);
    obj.checkBox174:setLeft(0);
    obj.checkBox174:setTop(0);
    obj.checkBox174:setWidth(18);
    obj.checkBox174:setHeight(20);
    obj.checkBox174:setField("rotecheck9");
    obj.checkBox174:setName("checkBox174");

    obj.layout255 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout255:setParent(obj.rectangle1);
    obj.layout255:setLeft(118);
    obj.layout255:setTop(949);
    obj.layout255:setWidth(18);
    obj.layout255:setHeight(19);
    obj.layout255:setName("layout255");

    obj.checkBox175 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox175:setParent(obj.layout255);
    obj.checkBox175:setLeft(0);
    obj.checkBox175:setTop(0);
    obj.checkBox175:setWidth(18);
    obj.checkBox175:setHeight(20);
    obj.checkBox175:setField("rotecheck10");
    obj.checkBox175:setName("checkBox175");

    obj.layout256 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout256:setParent(obj.rectangle1);
    obj.layout256:setLeft(118);
    obj.layout256:setTop(975);
    obj.layout256:setWidth(18);
    obj.layout256:setHeight(19);
    obj.layout256:setName("layout256");

    obj.checkBox176 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox176:setParent(obj.layout256);
    obj.checkBox176:setLeft(0);
    obj.checkBox176:setTop(0);
    obj.checkBox176:setWidth(18);
    obj.checkBox176:setHeight(20);
    obj.checkBox176:setField("rotecheck11");
    obj.checkBox176:setName("checkBox176");

    obj.layout257 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout257:setParent(obj.rectangle1);
    obj.layout257:setLeft(118);
    obj.layout257:setTop(1001);
    obj.layout257:setWidth(18);
    obj.layout257:setHeight(19);
    obj.layout257:setName("layout257");

    obj.checkBox177 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox177:setParent(obj.layout257);
    obj.checkBox177:setLeft(0);
    obj.checkBox177:setTop(0);
    obj.checkBox177:setWidth(18);
    obj.checkBox177:setHeight(20);
    obj.checkBox177:setField("rotecheck12");
    obj.checkBox177:setName("checkBox177");

    obj.layout258 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout258:setParent(obj.rectangle1);
    obj.layout258:setLeft(118);
    obj.layout258:setTop(1027);
    obj.layout258:setWidth(18);
    obj.layout258:setHeight(19);
    obj.layout258:setName("layout258");

    obj.checkBox178 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox178:setParent(obj.layout258);
    obj.checkBox178:setLeft(0);
    obj.checkBox178:setTop(0);
    obj.checkBox178:setWidth(18);
    obj.checkBox178:setHeight(20);
    obj.checkBox178:setField("rotecheck13");
    obj.checkBox178:setName("checkBox178");

    obj.layout259 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout259:setParent(obj.rectangle1);
    obj.layout259:setLeft(118);
    obj.layout259:setTop(1053);
    obj.layout259:setWidth(18);
    obj.layout259:setHeight(19);
    obj.layout259:setName("layout259");

    obj.checkBox179 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox179:setParent(obj.layout259);
    obj.checkBox179:setLeft(0);
    obj.checkBox179:setTop(0);
    obj.checkBox179:setWidth(18);
    obj.checkBox179:setHeight(20);
    obj.checkBox179:setField("rotecheck14");
    obj.checkBox179:setName("checkBox179");

    obj.layout260 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout260:setParent(obj.rectangle1);
    obj.layout260:setLeft(118);
    obj.layout260:setTop(1079);
    obj.layout260:setWidth(18);
    obj.layout260:setHeight(19);
    obj.layout260:setName("layout260");

    obj.checkBox180 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox180:setParent(obj.layout260);
    obj.checkBox180:setLeft(0);
    obj.checkBox180:setTop(0);
    obj.checkBox180:setWidth(18);
    obj.checkBox180:setHeight(20);
    obj.checkBox180:setField("rotecheck15");
    obj.checkBox180:setName("checkBox180");

    obj.layout261 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout261:setParent(obj.rectangle1);
    obj.layout261:setLeft(118);
    obj.layout261:setTop(1105);
    obj.layout261:setWidth(18);
    obj.layout261:setHeight(19);
    obj.layout261:setName("layout261");

    obj.checkBox181 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox181:setParent(obj.layout261);
    obj.checkBox181:setLeft(0);
    obj.checkBox181:setTop(0);
    obj.checkBox181:setWidth(18);
    obj.checkBox181:setHeight(20);
    obj.checkBox181:setField("rotecheck16");
    obj.checkBox181:setName("checkBox181");

    obj.layout262 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout262:setParent(obj.rectangle1);
    obj.layout262:setLeft(118);
    obj.layout262:setTop(1261);
    obj.layout262:setWidth(18);
    obj.layout262:setHeight(19);
    obj.layout262:setName("layout262");

    obj.checkBox182 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox182:setParent(obj.layout262);
    obj.checkBox182:setLeft(0);
    obj.checkBox182:setTop(0);
    obj.checkBox182:setWidth(18);
    obj.checkBox182:setHeight(20);
    obj.checkBox182:setField("rotecheck17");
    obj.checkBox182:setName("checkBox182");

    obj.layout263 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout263:setParent(obj.rectangle1);
    obj.layout263:setLeft(118);
    obj.layout263:setTop(1287);
    obj.layout263:setWidth(18);
    obj.layout263:setHeight(19);
    obj.layout263:setName("layout263");

    obj.checkBox183 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox183:setParent(obj.layout263);
    obj.checkBox183:setLeft(0);
    obj.checkBox183:setTop(0);
    obj.checkBox183:setWidth(18);
    obj.checkBox183:setHeight(20);
    obj.checkBox183:setField("rotecheck18");
    obj.checkBox183:setName("checkBox183");

    obj.layout264 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout264:setParent(obj.rectangle1);
    obj.layout264:setLeft(118);
    obj.layout264:setTop(1313);
    obj.layout264:setWidth(18);
    obj.layout264:setHeight(19);
    obj.layout264:setName("layout264");

    obj.checkBox184 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox184:setParent(obj.layout264);
    obj.checkBox184:setLeft(0);
    obj.checkBox184:setTop(0);
    obj.checkBox184:setWidth(18);
    obj.checkBox184:setHeight(20);
    obj.checkBox184:setField("rotecheck19");
    obj.checkBox184:setName("checkBox184");

    obj.layout265 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout265:setParent(obj.rectangle1);
    obj.layout265:setLeft(118);
    obj.layout265:setTop(1339);
    obj.layout265:setWidth(18);
    obj.layout265:setHeight(19);
    obj.layout265:setName("layout265");

    obj.checkBox185 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox185:setParent(obj.layout265);
    obj.checkBox185:setLeft(0);
    obj.checkBox185:setTop(0);
    obj.checkBox185:setWidth(18);
    obj.checkBox185:setHeight(20);
    obj.checkBox185:setField("rotecheck20");
    obj.checkBox185:setName("checkBox185");

    obj.layout266 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout266:setParent(obj.rectangle1);
    obj.layout266:setLeft(118);
    obj.layout266:setTop(1365);
    obj.layout266:setWidth(18);
    obj.layout266:setHeight(19);
    obj.layout266:setName("layout266");

    obj.checkBox186 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox186:setParent(obj.layout266);
    obj.checkBox186:setLeft(0);
    obj.checkBox186:setTop(0);
    obj.checkBox186:setWidth(18);
    obj.checkBox186:setHeight(20);
    obj.checkBox186:setField("rotecheck21");
    obj.checkBox186:setName("checkBox186");

    obj.layout267 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout267:setParent(obj.rectangle1);
    obj.layout267:setLeft(118);
    obj.layout267:setTop(1391);
    obj.layout267:setWidth(18);
    obj.layout267:setHeight(19);
    obj.layout267:setName("layout267");

    obj.checkBox187 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox187:setParent(obj.layout267);
    obj.checkBox187:setLeft(0);
    obj.checkBox187:setTop(0);
    obj.checkBox187:setWidth(18);
    obj.checkBox187:setHeight(20);
    obj.checkBox187:setField("rotecheck22");
    obj.checkBox187:setName("checkBox187");

    obj.layout268 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout268:setParent(obj.rectangle1);
    obj.layout268:setLeft(118);
    obj.layout268:setTop(1417);
    obj.layout268:setWidth(18);
    obj.layout268:setHeight(19);
    obj.layout268:setName("layout268");

    obj.checkBox188 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox188:setParent(obj.layout268);
    obj.checkBox188:setLeft(0);
    obj.checkBox188:setTop(0);
    obj.checkBox188:setWidth(18);
    obj.checkBox188:setHeight(20);
    obj.checkBox188:setField("rotecheck23");
    obj.checkBox188:setName("checkBox188");

    obj.layout269 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout269:setParent(obj.rectangle1);
    obj.layout269:setLeft(118);
    obj.layout269:setTop(1443);
    obj.layout269:setWidth(18);
    obj.layout269:setHeight(19);
    obj.layout269:setName("layout269");

    obj.checkBox189 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox189:setParent(obj.layout269);
    obj.checkBox189:setLeft(0);
    obj.checkBox189:setTop(0);
    obj.checkBox189:setWidth(18);
    obj.checkBox189:setHeight(20);
    obj.checkBox189:setField("rotecheck24");
    obj.checkBox189:setName("checkBox189");

    obj.layout270 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout270:setParent(obj.rectangle1);
    obj.layout270:setLeft(660);
    obj.layout270:setTop(559);
    obj.layout270:setWidth(19);
    obj.layout270:setHeight(23);
    obj.layout270:setName("layout270");

    obj.checkBox190 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox190:setParent(obj.layout270);
    obj.checkBox190:setLeft(0);
    obj.checkBox190:setTop(0);
    obj.checkBox190:setWidth(19);
    obj.checkBox190:setHeight(24);
    obj.checkBox190:setField("dot265");
    obj.checkBox190:setName("checkBox190");

    obj.layout271 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout271:setParent(obj.rectangle1);
    obj.layout271:setLeft(677);
    obj.layout271:setTop(559);
    obj.layout271:setWidth(20);
    obj.layout271:setHeight(23);
    obj.layout271:setName("layout271");

    obj.checkBox191 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox191:setParent(obj.layout271);
    obj.checkBox191:setLeft(0);
    obj.checkBox191:setTop(0);
    obj.checkBox191:setWidth(20);
    obj.checkBox191:setHeight(24);
    obj.checkBox191:setField("dot266");
    obj.checkBox191:setName("checkBox191");

    obj.layout272 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout272:setParent(obj.rectangle1);
    obj.layout272:setLeft(694);
    obj.layout272:setTop(559);
    obj.layout272:setWidth(20);
    obj.layout272:setHeight(23);
    obj.layout272:setName("layout272");

    obj.checkBox192 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox192:setParent(obj.layout272);
    obj.checkBox192:setLeft(0);
    obj.checkBox192:setTop(0);
    obj.checkBox192:setWidth(20);
    obj.checkBox192:setHeight(24);
    obj.checkBox192:setField("dot267");
    obj.checkBox192:setName("checkBox192");

    obj.layout273 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout273:setParent(obj.rectangle1);
    obj.layout273:setLeft(711);
    obj.layout273:setTop(559);
    obj.layout273:setWidth(20);
    obj.layout273:setHeight(23);
    obj.layout273:setName("layout273");

    obj.checkBox193 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox193:setParent(obj.layout273);
    obj.checkBox193:setLeft(0);
    obj.checkBox193:setTop(0);
    obj.checkBox193:setWidth(20);
    obj.checkBox193:setHeight(24);
    obj.checkBox193:setField("dot268");
    obj.checkBox193:setName("checkBox193");

    obj.layout274 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout274:setParent(obj.rectangle1);
    obj.layout274:setLeft(728);
    obj.layout274:setTop(559);
    obj.layout274:setWidth(20);
    obj.layout274:setHeight(23);
    obj.layout274:setName("layout274");

    obj.checkBox194 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox194:setParent(obj.layout274);
    obj.checkBox194:setLeft(0);
    obj.checkBox194:setTop(0);
    obj.checkBox194:setWidth(20);
    obj.checkBox194:setHeight(24);
    obj.checkBox194:setField("dot269");
    obj.checkBox194:setName("checkBox194");

    obj.layout275 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout275:setParent(obj.rectangle1);
    obj.layout275:setLeft(660);
    obj.layout275:setTop(585);
    obj.layout275:setWidth(19);
    obj.layout275:setHeight(23);
    obj.layout275:setName("layout275");

    obj.checkBox195 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox195:setParent(obj.layout275);
    obj.checkBox195:setLeft(0);
    obj.checkBox195:setTop(0);
    obj.checkBox195:setWidth(19);
    obj.checkBox195:setHeight(24);
    obj.checkBox195:setField("dot273");
    obj.checkBox195:setName("checkBox195");

    obj.layout276 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout276:setParent(obj.rectangle1);
    obj.layout276:setLeft(677);
    obj.layout276:setTop(585);
    obj.layout276:setWidth(20);
    obj.layout276:setHeight(23);
    obj.layout276:setName("layout276");

    obj.checkBox196 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox196:setParent(obj.layout276);
    obj.checkBox196:setLeft(0);
    obj.checkBox196:setTop(0);
    obj.checkBox196:setWidth(20);
    obj.checkBox196:setHeight(24);
    obj.checkBox196:setField("dot274");
    obj.checkBox196:setName("checkBox196");

    obj.layout277 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout277:setParent(obj.rectangle1);
    obj.layout277:setLeft(694);
    obj.layout277:setTop(585);
    obj.layout277:setWidth(20);
    obj.layout277:setHeight(23);
    obj.layout277:setName("layout277");

    obj.checkBox197 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox197:setParent(obj.layout277);
    obj.checkBox197:setLeft(0);
    obj.checkBox197:setTop(0);
    obj.checkBox197:setWidth(20);
    obj.checkBox197:setHeight(24);
    obj.checkBox197:setField("dot275");
    obj.checkBox197:setName("checkBox197");

    obj.layout278 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout278:setParent(obj.rectangle1);
    obj.layout278:setLeft(711);
    obj.layout278:setTop(585);
    obj.layout278:setWidth(20);
    obj.layout278:setHeight(23);
    obj.layout278:setName("layout278");

    obj.checkBox198 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox198:setParent(obj.layout278);
    obj.checkBox198:setLeft(0);
    obj.checkBox198:setTop(0);
    obj.checkBox198:setWidth(20);
    obj.checkBox198:setHeight(24);
    obj.checkBox198:setField("dot276");
    obj.checkBox198:setName("checkBox198");

    obj.layout279 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout279:setParent(obj.rectangle1);
    obj.layout279:setLeft(728);
    obj.layout279:setTop(585);
    obj.layout279:setWidth(20);
    obj.layout279:setHeight(23);
    obj.layout279:setName("layout279");

    obj.checkBox199 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox199:setParent(obj.layout279);
    obj.checkBox199:setLeft(0);
    obj.checkBox199:setTop(0);
    obj.checkBox199:setWidth(20);
    obj.checkBox199:setHeight(24);
    obj.checkBox199:setField("dot277");
    obj.checkBox199:setName("checkBox199");

    obj.layout280 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout280:setParent(obj.rectangle1);
    obj.layout280:setLeft(660);
    obj.layout280:setTop(611);
    obj.layout280:setWidth(19);
    obj.layout280:setHeight(23);
    obj.layout280:setName("layout280");

    obj.checkBox200 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox200:setParent(obj.layout280);
    obj.checkBox200:setLeft(0);
    obj.checkBox200:setTop(0);
    obj.checkBox200:setWidth(19);
    obj.checkBox200:setHeight(24);
    obj.checkBox200:setField("dot281");
    obj.checkBox200:setName("checkBox200");

    obj.layout281 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout281:setParent(obj.rectangle1);
    obj.layout281:setLeft(677);
    obj.layout281:setTop(611);
    obj.layout281:setWidth(20);
    obj.layout281:setHeight(23);
    obj.layout281:setName("layout281");

    obj.checkBox201 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox201:setParent(obj.layout281);
    obj.checkBox201:setLeft(0);
    obj.checkBox201:setTop(0);
    obj.checkBox201:setWidth(20);
    obj.checkBox201:setHeight(24);
    obj.checkBox201:setField("dot282");
    obj.checkBox201:setName("checkBox201");

    obj.layout282 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout282:setParent(obj.rectangle1);
    obj.layout282:setLeft(694);
    obj.layout282:setTop(611);
    obj.layout282:setWidth(20);
    obj.layout282:setHeight(23);
    obj.layout282:setName("layout282");

    obj.checkBox202 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox202:setParent(obj.layout282);
    obj.checkBox202:setLeft(0);
    obj.checkBox202:setTop(0);
    obj.checkBox202:setWidth(20);
    obj.checkBox202:setHeight(24);
    obj.checkBox202:setField("dot283");
    obj.checkBox202:setName("checkBox202");

    obj.layout283 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout283:setParent(obj.rectangle1);
    obj.layout283:setLeft(711);
    obj.layout283:setTop(611);
    obj.layout283:setWidth(20);
    obj.layout283:setHeight(23);
    obj.layout283:setName("layout283");

    obj.checkBox203 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox203:setParent(obj.layout283);
    obj.checkBox203:setLeft(0);
    obj.checkBox203:setTop(0);
    obj.checkBox203:setWidth(20);
    obj.checkBox203:setHeight(24);
    obj.checkBox203:setField("dot284");
    obj.checkBox203:setName("checkBox203");

    obj.layout284 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout284:setParent(obj.rectangle1);
    obj.layout284:setLeft(728);
    obj.layout284:setTop(611);
    obj.layout284:setWidth(20);
    obj.layout284:setHeight(23);
    obj.layout284:setName("layout284");

    obj.checkBox204 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox204:setParent(obj.layout284);
    obj.checkBox204:setLeft(0);
    obj.checkBox204:setTop(0);
    obj.checkBox204:setWidth(20);
    obj.checkBox204:setHeight(24);
    obj.checkBox204:setField("dot285");
    obj.checkBox204:setName("checkBox204");

    obj.layout285 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout285:setParent(obj.rectangle1);
    obj.layout285:setLeft(660);
    obj.layout285:setTop(637);
    obj.layout285:setWidth(19);
    obj.layout285:setHeight(23);
    obj.layout285:setName("layout285");

    obj.checkBox205 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox205:setParent(obj.layout285);
    obj.checkBox205:setLeft(0);
    obj.checkBox205:setTop(0);
    obj.checkBox205:setWidth(19);
    obj.checkBox205:setHeight(24);
    obj.checkBox205:setField("dot289");
    obj.checkBox205:setName("checkBox205");

    obj.layout286 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout286:setParent(obj.rectangle1);
    obj.layout286:setLeft(677);
    obj.layout286:setTop(637);
    obj.layout286:setWidth(20);
    obj.layout286:setHeight(23);
    obj.layout286:setName("layout286");

    obj.checkBox206 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox206:setParent(obj.layout286);
    obj.checkBox206:setLeft(0);
    obj.checkBox206:setTop(0);
    obj.checkBox206:setWidth(20);
    obj.checkBox206:setHeight(24);
    obj.checkBox206:setField("dot290");
    obj.checkBox206:setName("checkBox206");

    obj.layout287 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout287:setParent(obj.rectangle1);
    obj.layout287:setLeft(694);
    obj.layout287:setTop(637);
    obj.layout287:setWidth(20);
    obj.layout287:setHeight(23);
    obj.layout287:setName("layout287");

    obj.checkBox207 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox207:setParent(obj.layout287);
    obj.checkBox207:setLeft(0);
    obj.checkBox207:setTop(0);
    obj.checkBox207:setWidth(20);
    obj.checkBox207:setHeight(24);
    obj.checkBox207:setField("dot291");
    obj.checkBox207:setName("checkBox207");

    obj.layout288 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout288:setParent(obj.rectangle1);
    obj.layout288:setLeft(711);
    obj.layout288:setTop(637);
    obj.layout288:setWidth(20);
    obj.layout288:setHeight(23);
    obj.layout288:setName("layout288");

    obj.checkBox208 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox208:setParent(obj.layout288);
    obj.checkBox208:setLeft(0);
    obj.checkBox208:setTop(0);
    obj.checkBox208:setWidth(20);
    obj.checkBox208:setHeight(24);
    obj.checkBox208:setField("dot292");
    obj.checkBox208:setName("checkBox208");

    obj.layout289 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout289:setParent(obj.rectangle1);
    obj.layout289:setLeft(728);
    obj.layout289:setTop(637);
    obj.layout289:setWidth(20);
    obj.layout289:setHeight(23);
    obj.layout289:setName("layout289");

    obj.checkBox209 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox209:setParent(obj.layout289);
    obj.checkBox209:setLeft(0);
    obj.checkBox209:setTop(0);
    obj.checkBox209:setWidth(20);
    obj.checkBox209:setHeight(24);
    obj.checkBox209:setField("dot293");
    obj.checkBox209:setName("checkBox209");

    obj.layout290 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout290:setParent(obj.rectangle1);
    obj.layout290:setLeft(660);
    obj.layout290:setTop(663);
    obj.layout290:setWidth(19);
    obj.layout290:setHeight(23);
    obj.layout290:setName("layout290");

    obj.checkBox210 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox210:setParent(obj.layout290);
    obj.checkBox210:setLeft(0);
    obj.checkBox210:setTop(0);
    obj.checkBox210:setWidth(19);
    obj.checkBox210:setHeight(24);
    obj.checkBox210:setField("dot297");
    obj.checkBox210:setName("checkBox210");

    obj.layout291 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout291:setParent(obj.rectangle1);
    obj.layout291:setLeft(677);
    obj.layout291:setTop(663);
    obj.layout291:setWidth(20);
    obj.layout291:setHeight(23);
    obj.layout291:setName("layout291");

    obj.checkBox211 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox211:setParent(obj.layout291);
    obj.checkBox211:setLeft(0);
    obj.checkBox211:setTop(0);
    obj.checkBox211:setWidth(20);
    obj.checkBox211:setHeight(24);
    obj.checkBox211:setField("dot298");
    obj.checkBox211:setName("checkBox211");

    obj.layout292 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout292:setParent(obj.rectangle1);
    obj.layout292:setLeft(694);
    obj.layout292:setTop(663);
    obj.layout292:setWidth(20);
    obj.layout292:setHeight(23);
    obj.layout292:setName("layout292");

    obj.checkBox212 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox212:setParent(obj.layout292);
    obj.checkBox212:setLeft(0);
    obj.checkBox212:setTop(0);
    obj.checkBox212:setWidth(20);
    obj.checkBox212:setHeight(24);
    obj.checkBox212:setField("dot299");
    obj.checkBox212:setName("checkBox212");

    obj.layout293 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout293:setParent(obj.rectangle1);
    obj.layout293:setLeft(711);
    obj.layout293:setTop(663);
    obj.layout293:setWidth(20);
    obj.layout293:setHeight(23);
    obj.layout293:setName("layout293");

    obj.checkBox213 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox213:setParent(obj.layout293);
    obj.checkBox213:setLeft(0);
    obj.checkBox213:setTop(0);
    obj.checkBox213:setWidth(20);
    obj.checkBox213:setHeight(24);
    obj.checkBox213:setField("dot300");
    obj.checkBox213:setName("checkBox213");

    obj.layout294 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout294:setParent(obj.rectangle1);
    obj.layout294:setLeft(728);
    obj.layout294:setTop(663);
    obj.layout294:setWidth(20);
    obj.layout294:setHeight(23);
    obj.layout294:setName("layout294");

    obj.checkBox214 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox214:setParent(obj.layout294);
    obj.checkBox214:setLeft(0);
    obj.checkBox214:setTop(0);
    obj.checkBox214:setWidth(20);
    obj.checkBox214:setHeight(24);
    obj.checkBox214:setField("dot301");
    obj.checkBox214:setName("checkBox214");

    obj.layout295 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout295:setParent(obj.rectangle1);
    obj.layout295:setLeft(660);
    obj.layout295:setTop(689);
    obj.layout295:setWidth(19);
    obj.layout295:setHeight(23);
    obj.layout295:setName("layout295");

    obj.checkBox215 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox215:setParent(obj.layout295);
    obj.checkBox215:setLeft(0);
    obj.checkBox215:setTop(0);
    obj.checkBox215:setWidth(19);
    obj.checkBox215:setHeight(24);
    obj.checkBox215:setField("dot305");
    obj.checkBox215:setName("checkBox215");

    obj.layout296 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout296:setParent(obj.rectangle1);
    obj.layout296:setLeft(677);
    obj.layout296:setTop(689);
    obj.layout296:setWidth(20);
    obj.layout296:setHeight(23);
    obj.layout296:setName("layout296");

    obj.checkBox216 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox216:setParent(obj.layout296);
    obj.checkBox216:setLeft(0);
    obj.checkBox216:setTop(0);
    obj.checkBox216:setWidth(20);
    obj.checkBox216:setHeight(24);
    obj.checkBox216:setField("dot306");
    obj.checkBox216:setName("checkBox216");

    obj.layout297 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout297:setParent(obj.rectangle1);
    obj.layout297:setLeft(694);
    obj.layout297:setTop(689);
    obj.layout297:setWidth(20);
    obj.layout297:setHeight(23);
    obj.layout297:setName("layout297");

    obj.checkBox217 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox217:setParent(obj.layout297);
    obj.checkBox217:setLeft(0);
    obj.checkBox217:setTop(0);
    obj.checkBox217:setWidth(20);
    obj.checkBox217:setHeight(24);
    obj.checkBox217:setField("dot307");
    obj.checkBox217:setName("checkBox217");

    obj.layout298 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout298:setParent(obj.rectangle1);
    obj.layout298:setLeft(711);
    obj.layout298:setTop(689);
    obj.layout298:setWidth(20);
    obj.layout298:setHeight(23);
    obj.layout298:setName("layout298");

    obj.checkBox218 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox218:setParent(obj.layout298);
    obj.checkBox218:setLeft(0);
    obj.checkBox218:setTop(0);
    obj.checkBox218:setWidth(20);
    obj.checkBox218:setHeight(24);
    obj.checkBox218:setField("dot308");
    obj.checkBox218:setName("checkBox218");

    obj.layout299 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout299:setParent(obj.rectangle1);
    obj.layout299:setLeft(728);
    obj.layout299:setTop(689);
    obj.layout299:setWidth(20);
    obj.layout299:setHeight(23);
    obj.layout299:setName("layout299");

    obj.checkBox219 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox219:setParent(obj.layout299);
    obj.checkBox219:setLeft(0);
    obj.checkBox219:setTop(0);
    obj.checkBox219:setWidth(20);
    obj.checkBox219:setHeight(24);
    obj.checkBox219:setField("dot309");
    obj.checkBox219:setName("checkBox219");

    obj.layout300 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout300:setParent(obj.rectangle1);
    obj.layout300:setLeft(660);
    obj.layout300:setTop(715);
    obj.layout300:setWidth(19);
    obj.layout300:setHeight(23);
    obj.layout300:setName("layout300");

    obj.checkBox220 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox220:setParent(obj.layout300);
    obj.checkBox220:setLeft(0);
    obj.checkBox220:setTop(0);
    obj.checkBox220:setWidth(19);
    obj.checkBox220:setHeight(24);
    obj.checkBox220:setField("dot313");
    obj.checkBox220:setName("checkBox220");

    obj.layout301 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout301:setParent(obj.rectangle1);
    obj.layout301:setLeft(677);
    obj.layout301:setTop(715);
    obj.layout301:setWidth(20);
    obj.layout301:setHeight(23);
    obj.layout301:setName("layout301");

    obj.checkBox221 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox221:setParent(obj.layout301);
    obj.checkBox221:setLeft(0);
    obj.checkBox221:setTop(0);
    obj.checkBox221:setWidth(20);
    obj.checkBox221:setHeight(24);
    obj.checkBox221:setField("dot314");
    obj.checkBox221:setName("checkBox221");

    obj.layout302 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout302:setParent(obj.rectangle1);
    obj.layout302:setLeft(694);
    obj.layout302:setTop(715);
    obj.layout302:setWidth(20);
    obj.layout302:setHeight(23);
    obj.layout302:setName("layout302");

    obj.checkBox222 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox222:setParent(obj.layout302);
    obj.checkBox222:setLeft(0);
    obj.checkBox222:setTop(0);
    obj.checkBox222:setWidth(20);
    obj.checkBox222:setHeight(24);
    obj.checkBox222:setField("dot315");
    obj.checkBox222:setName("checkBox222");

    obj.layout303 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout303:setParent(obj.rectangle1);
    obj.layout303:setLeft(711);
    obj.layout303:setTop(715);
    obj.layout303:setWidth(20);
    obj.layout303:setHeight(23);
    obj.layout303:setName("layout303");

    obj.checkBox223 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox223:setParent(obj.layout303);
    obj.checkBox223:setLeft(0);
    obj.checkBox223:setTop(0);
    obj.checkBox223:setWidth(20);
    obj.checkBox223:setHeight(24);
    obj.checkBox223:setField("dot316");
    obj.checkBox223:setName("checkBox223");

    obj.layout304 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout304:setParent(obj.rectangle1);
    obj.layout304:setLeft(728);
    obj.layout304:setTop(715);
    obj.layout304:setWidth(20);
    obj.layout304:setHeight(23);
    obj.layout304:setName("layout304");

    obj.checkBox224 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox224:setParent(obj.layout304);
    obj.checkBox224:setLeft(0);
    obj.checkBox224:setTop(0);
    obj.checkBox224:setWidth(20);
    obj.checkBox224:setHeight(24);
    obj.checkBox224:setField("dot317");
    obj.checkBox224:setName("checkBox224");

    obj.layout305 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout305:setParent(obj.rectangle1);
    obj.layout305:setLeft(660);
    obj.layout305:setTop(741);
    obj.layout305:setWidth(19);
    obj.layout305:setHeight(23);
    obj.layout305:setName("layout305");

    obj.checkBox225 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox225:setParent(obj.layout305);
    obj.checkBox225:setLeft(0);
    obj.checkBox225:setTop(0);
    obj.checkBox225:setWidth(19);
    obj.checkBox225:setHeight(24);
    obj.checkBox225:setField("dot321");
    obj.checkBox225:setName("checkBox225");

    obj.layout306 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout306:setParent(obj.rectangle1);
    obj.layout306:setLeft(677);
    obj.layout306:setTop(741);
    obj.layout306:setWidth(20);
    obj.layout306:setHeight(23);
    obj.layout306:setName("layout306");

    obj.checkBox226 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox226:setParent(obj.layout306);
    obj.checkBox226:setLeft(0);
    obj.checkBox226:setTop(0);
    obj.checkBox226:setWidth(20);
    obj.checkBox226:setHeight(24);
    obj.checkBox226:setField("dot322");
    obj.checkBox226:setName("checkBox226");

    obj.layout307 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout307:setParent(obj.rectangle1);
    obj.layout307:setLeft(694);
    obj.layout307:setTop(741);
    obj.layout307:setWidth(20);
    obj.layout307:setHeight(23);
    obj.layout307:setName("layout307");

    obj.checkBox227 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox227:setParent(obj.layout307);
    obj.checkBox227:setLeft(0);
    obj.checkBox227:setTop(0);
    obj.checkBox227:setWidth(20);
    obj.checkBox227:setHeight(24);
    obj.checkBox227:setField("dot323");
    obj.checkBox227:setName("checkBox227");

    obj.layout308 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout308:setParent(obj.rectangle1);
    obj.layout308:setLeft(711);
    obj.layout308:setTop(741);
    obj.layout308:setWidth(20);
    obj.layout308:setHeight(23);
    obj.layout308:setName("layout308");

    obj.checkBox228 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox228:setParent(obj.layout308);
    obj.checkBox228:setLeft(0);
    obj.checkBox228:setTop(0);
    obj.checkBox228:setWidth(20);
    obj.checkBox228:setHeight(24);
    obj.checkBox228:setField("dot324");
    obj.checkBox228:setName("checkBox228");

    obj.layout309 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout309:setParent(obj.rectangle1);
    obj.layout309:setLeft(728);
    obj.layout309:setTop(741);
    obj.layout309:setWidth(20);
    obj.layout309:setHeight(23);
    obj.layout309:setName("layout309");

    obj.checkBox229 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox229:setParent(obj.layout309);
    obj.checkBox229:setLeft(0);
    obj.checkBox229:setTop(0);
    obj.checkBox229:setWidth(20);
    obj.checkBox229:setHeight(24);
    obj.checkBox229:setField("dot325");
    obj.checkBox229:setName("checkBox229");

    obj.layout310 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout310:setParent(obj.rectangle1);
    obj.layout310:setLeft(660);
    obj.layout310:setTop(767);
    obj.layout310:setWidth(19);
    obj.layout310:setHeight(23);
    obj.layout310:setName("layout310");

    obj.checkBox230 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox230:setParent(obj.layout310);
    obj.checkBox230:setLeft(0);
    obj.checkBox230:setTop(0);
    obj.checkBox230:setWidth(19);
    obj.checkBox230:setHeight(24);
    obj.checkBox230:setField("dot329");
    obj.checkBox230:setName("checkBox230");

    obj.layout311 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout311:setParent(obj.rectangle1);
    obj.layout311:setLeft(677);
    obj.layout311:setTop(767);
    obj.layout311:setWidth(20);
    obj.layout311:setHeight(23);
    obj.layout311:setName("layout311");

    obj.checkBox231 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox231:setParent(obj.layout311);
    obj.checkBox231:setLeft(0);
    obj.checkBox231:setTop(0);
    obj.checkBox231:setWidth(20);
    obj.checkBox231:setHeight(24);
    obj.checkBox231:setField("dot330");
    obj.checkBox231:setName("checkBox231");

    obj.layout312 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout312:setParent(obj.rectangle1);
    obj.layout312:setLeft(694);
    obj.layout312:setTop(767);
    obj.layout312:setWidth(20);
    obj.layout312:setHeight(23);
    obj.layout312:setName("layout312");

    obj.checkBox232 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox232:setParent(obj.layout312);
    obj.checkBox232:setLeft(0);
    obj.checkBox232:setTop(0);
    obj.checkBox232:setWidth(20);
    obj.checkBox232:setHeight(24);
    obj.checkBox232:setField("dot331");
    obj.checkBox232:setName("checkBox232");

    obj.layout313 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout313:setParent(obj.rectangle1);
    obj.layout313:setLeft(711);
    obj.layout313:setTop(767);
    obj.layout313:setWidth(20);
    obj.layout313:setHeight(23);
    obj.layout313:setName("layout313");

    obj.checkBox233 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox233:setParent(obj.layout313);
    obj.checkBox233:setLeft(0);
    obj.checkBox233:setTop(0);
    obj.checkBox233:setWidth(20);
    obj.checkBox233:setHeight(24);
    obj.checkBox233:setField("dot332");
    obj.checkBox233:setName("checkBox233");

    obj.layout314 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout314:setParent(obj.rectangle1);
    obj.layout314:setLeft(728);
    obj.layout314:setTop(767);
    obj.layout314:setWidth(20);
    obj.layout314:setHeight(23);
    obj.layout314:setName("layout314");

    obj.checkBox234 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox234:setParent(obj.layout314);
    obj.checkBox234:setLeft(0);
    obj.checkBox234:setTop(0);
    obj.checkBox234:setWidth(20);
    obj.checkBox234:setHeight(24);
    obj.checkBox234:setField("dot333");
    obj.checkBox234:setName("checkBox234");

    obj.layout315 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout315:setParent(obj.rectangle1);
    obj.layout315:setLeft(660);
    obj.layout315:setTop(793);
    obj.layout315:setWidth(19);
    obj.layout315:setHeight(23);
    obj.layout315:setName("layout315");

    obj.checkBox235 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox235:setParent(obj.layout315);
    obj.checkBox235:setLeft(0);
    obj.checkBox235:setTop(0);
    obj.checkBox235:setWidth(19);
    obj.checkBox235:setHeight(24);
    obj.checkBox235:setField("dot337");
    obj.checkBox235:setName("checkBox235");

    obj.layout316 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout316:setParent(obj.rectangle1);
    obj.layout316:setLeft(677);
    obj.layout316:setTop(793);
    obj.layout316:setWidth(20);
    obj.layout316:setHeight(23);
    obj.layout316:setName("layout316");

    obj.checkBox236 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox236:setParent(obj.layout316);
    obj.checkBox236:setLeft(0);
    obj.checkBox236:setTop(0);
    obj.checkBox236:setWidth(20);
    obj.checkBox236:setHeight(24);
    obj.checkBox236:setField("dot338");
    obj.checkBox236:setName("checkBox236");

    obj.layout317 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout317:setParent(obj.rectangle1);
    obj.layout317:setLeft(694);
    obj.layout317:setTop(793);
    obj.layout317:setWidth(20);
    obj.layout317:setHeight(23);
    obj.layout317:setName("layout317");

    obj.checkBox237 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox237:setParent(obj.layout317);
    obj.checkBox237:setLeft(0);
    obj.checkBox237:setTop(0);
    obj.checkBox237:setWidth(20);
    obj.checkBox237:setHeight(24);
    obj.checkBox237:setField("dot339");
    obj.checkBox237:setName("checkBox237");

    obj.layout318 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout318:setParent(obj.rectangle1);
    obj.layout318:setLeft(711);
    obj.layout318:setTop(793);
    obj.layout318:setWidth(20);
    obj.layout318:setHeight(23);
    obj.layout318:setName("layout318");

    obj.checkBox238 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox238:setParent(obj.layout318);
    obj.checkBox238:setLeft(0);
    obj.checkBox238:setTop(0);
    obj.checkBox238:setWidth(20);
    obj.checkBox238:setHeight(24);
    obj.checkBox238:setField("dot340");
    obj.checkBox238:setName("checkBox238");

    obj.layout319 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout319:setParent(obj.rectangle1);
    obj.layout319:setLeft(728);
    obj.layout319:setTop(793);
    obj.layout319:setWidth(20);
    obj.layout319:setHeight(23);
    obj.layout319:setName("layout319");

    obj.checkBox239 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox239:setParent(obj.layout319);
    obj.checkBox239:setLeft(0);
    obj.checkBox239:setTop(0);
    obj.checkBox239:setWidth(20);
    obj.checkBox239:setHeight(24);
    obj.checkBox239:setField("dot341");
    obj.checkBox239:setName("checkBox239");

    obj.layout320 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout320:setParent(obj.rectangle1);
    obj.layout320:setLeft(660);
    obj.layout320:setTop(871);
    obj.layout320:setWidth(19);
    obj.layout320:setHeight(23);
    obj.layout320:setName("layout320");

    obj.checkBox240 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox240:setParent(obj.layout320);
    obj.checkBox240:setLeft(0);
    obj.checkBox240:setTop(0);
    obj.checkBox240:setWidth(19);
    obj.checkBox240:setHeight(24);
    obj.checkBox240:setField("dot345");
    obj.checkBox240:setName("checkBox240");

    obj.layout321 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout321:setParent(obj.rectangle1);
    obj.layout321:setLeft(677);
    obj.layout321:setTop(871);
    obj.layout321:setWidth(20);
    obj.layout321:setHeight(23);
    obj.layout321:setName("layout321");

    obj.checkBox241 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox241:setParent(obj.layout321);
    obj.checkBox241:setLeft(0);
    obj.checkBox241:setTop(0);
    obj.checkBox241:setWidth(20);
    obj.checkBox241:setHeight(24);
    obj.checkBox241:setField("dot346");
    obj.checkBox241:setName("checkBox241");

    obj.layout322 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout322:setParent(obj.rectangle1);
    obj.layout322:setLeft(694);
    obj.layout322:setTop(871);
    obj.layout322:setWidth(20);
    obj.layout322:setHeight(23);
    obj.layout322:setName("layout322");

    obj.checkBox242 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox242:setParent(obj.layout322);
    obj.checkBox242:setLeft(0);
    obj.checkBox242:setTop(0);
    obj.checkBox242:setWidth(20);
    obj.checkBox242:setHeight(24);
    obj.checkBox242:setField("dot347");
    obj.checkBox242:setName("checkBox242");

    obj.layout323 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout323:setParent(obj.rectangle1);
    obj.layout323:setLeft(711);
    obj.layout323:setTop(871);
    obj.layout323:setWidth(20);
    obj.layout323:setHeight(23);
    obj.layout323:setName("layout323");

    obj.checkBox243 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox243:setParent(obj.layout323);
    obj.checkBox243:setLeft(0);
    obj.checkBox243:setTop(0);
    obj.checkBox243:setWidth(20);
    obj.checkBox243:setHeight(24);
    obj.checkBox243:setField("dot348");
    obj.checkBox243:setName("checkBox243");

    obj.layout324 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout324:setParent(obj.rectangle1);
    obj.layout324:setLeft(728);
    obj.layout324:setTop(871);
    obj.layout324:setWidth(20);
    obj.layout324:setHeight(23);
    obj.layout324:setName("layout324");

    obj.checkBox244 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox244:setParent(obj.layout324);
    obj.checkBox244:setLeft(0);
    obj.checkBox244:setTop(0);
    obj.checkBox244:setWidth(20);
    obj.checkBox244:setHeight(24);
    obj.checkBox244:setField("dot349");
    obj.checkBox244:setName("checkBox244");

    obj.layout325 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout325:setParent(obj.rectangle1);
    obj.layout325:setLeft(660);
    obj.layout325:setTop(897);
    obj.layout325:setWidth(19);
    obj.layout325:setHeight(23);
    obj.layout325:setName("layout325");

    obj.checkBox245 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox245:setParent(obj.layout325);
    obj.checkBox245:setLeft(0);
    obj.checkBox245:setTop(0);
    obj.checkBox245:setWidth(19);
    obj.checkBox245:setHeight(24);
    obj.checkBox245:setField("dot353");
    obj.checkBox245:setName("checkBox245");

    obj.layout326 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout326:setParent(obj.rectangle1);
    obj.layout326:setLeft(677);
    obj.layout326:setTop(897);
    obj.layout326:setWidth(20);
    obj.layout326:setHeight(23);
    obj.layout326:setName("layout326");

    obj.checkBox246 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox246:setParent(obj.layout326);
    obj.checkBox246:setLeft(0);
    obj.checkBox246:setTop(0);
    obj.checkBox246:setWidth(20);
    obj.checkBox246:setHeight(24);
    obj.checkBox246:setField("dot354");
    obj.checkBox246:setName("checkBox246");

    obj.layout327 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout327:setParent(obj.rectangle1);
    obj.layout327:setLeft(694);
    obj.layout327:setTop(897);
    obj.layout327:setWidth(20);
    obj.layout327:setHeight(23);
    obj.layout327:setName("layout327");

    obj.checkBox247 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox247:setParent(obj.layout327);
    obj.checkBox247:setLeft(0);
    obj.checkBox247:setTop(0);
    obj.checkBox247:setWidth(20);
    obj.checkBox247:setHeight(24);
    obj.checkBox247:setField("dot355");
    obj.checkBox247:setName("checkBox247");

    obj.layout328 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout328:setParent(obj.rectangle1);
    obj.layout328:setLeft(711);
    obj.layout328:setTop(897);
    obj.layout328:setWidth(20);
    obj.layout328:setHeight(23);
    obj.layout328:setName("layout328");

    obj.checkBox248 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox248:setParent(obj.layout328);
    obj.checkBox248:setLeft(0);
    obj.checkBox248:setTop(0);
    obj.checkBox248:setWidth(20);
    obj.checkBox248:setHeight(24);
    obj.checkBox248:setField("dot356");
    obj.checkBox248:setName("checkBox248");

    obj.layout329 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout329:setParent(obj.rectangle1);
    obj.layout329:setLeft(728);
    obj.layout329:setTop(897);
    obj.layout329:setWidth(20);
    obj.layout329:setHeight(23);
    obj.layout329:setName("layout329");

    obj.checkBox249 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox249:setParent(obj.layout329);
    obj.checkBox249:setLeft(0);
    obj.checkBox249:setTop(0);
    obj.checkBox249:setWidth(20);
    obj.checkBox249:setHeight(24);
    obj.checkBox249:setField("dot357");
    obj.checkBox249:setName("checkBox249");

    obj.layout330 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout330:setParent(obj.rectangle1);
    obj.layout330:setLeft(660);
    obj.layout330:setTop(923);
    obj.layout330:setWidth(19);
    obj.layout330:setHeight(23);
    obj.layout330:setName("layout330");

    obj.checkBox250 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox250:setParent(obj.layout330);
    obj.checkBox250:setLeft(0);
    obj.checkBox250:setTop(0);
    obj.checkBox250:setWidth(19);
    obj.checkBox250:setHeight(24);
    obj.checkBox250:setField("dot361");
    obj.checkBox250:setName("checkBox250");

    obj.layout331 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout331:setParent(obj.rectangle1);
    obj.layout331:setLeft(677);
    obj.layout331:setTop(923);
    obj.layout331:setWidth(20);
    obj.layout331:setHeight(23);
    obj.layout331:setName("layout331");

    obj.checkBox251 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox251:setParent(obj.layout331);
    obj.checkBox251:setLeft(0);
    obj.checkBox251:setTop(0);
    obj.checkBox251:setWidth(20);
    obj.checkBox251:setHeight(24);
    obj.checkBox251:setField("dot362");
    obj.checkBox251:setName("checkBox251");

    obj.layout332 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout332:setParent(obj.rectangle1);
    obj.layout332:setLeft(694);
    obj.layout332:setTop(923);
    obj.layout332:setWidth(20);
    obj.layout332:setHeight(23);
    obj.layout332:setName("layout332");

    obj.checkBox252 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox252:setParent(obj.layout332);
    obj.checkBox252:setLeft(0);
    obj.checkBox252:setTop(0);
    obj.checkBox252:setWidth(20);
    obj.checkBox252:setHeight(24);
    obj.checkBox252:setField("dot363");
    obj.checkBox252:setName("checkBox252");

    obj.layout333 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout333:setParent(obj.rectangle1);
    obj.layout333:setLeft(711);
    obj.layout333:setTop(923);
    obj.layout333:setWidth(20);
    obj.layout333:setHeight(23);
    obj.layout333:setName("layout333");

    obj.checkBox253 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox253:setParent(obj.layout333);
    obj.checkBox253:setLeft(0);
    obj.checkBox253:setTop(0);
    obj.checkBox253:setWidth(20);
    obj.checkBox253:setHeight(24);
    obj.checkBox253:setField("dot364");
    obj.checkBox253:setName("checkBox253");

    obj.layout334 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout334:setParent(obj.rectangle1);
    obj.layout334:setLeft(728);
    obj.layout334:setTop(923);
    obj.layout334:setWidth(20);
    obj.layout334:setHeight(23);
    obj.layout334:setName("layout334");

    obj.checkBox254 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox254:setParent(obj.layout334);
    obj.checkBox254:setLeft(0);
    obj.checkBox254:setTop(0);
    obj.checkBox254:setWidth(20);
    obj.checkBox254:setHeight(24);
    obj.checkBox254:setField("dot365");
    obj.checkBox254:setName("checkBox254");

    obj.layout335 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout335:setParent(obj.rectangle1);
    obj.layout335:setLeft(660);
    obj.layout335:setTop(949);
    obj.layout335:setWidth(19);
    obj.layout335:setHeight(23);
    obj.layout335:setName("layout335");

    obj.checkBox255 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox255:setParent(obj.layout335);
    obj.checkBox255:setLeft(0);
    obj.checkBox255:setTop(0);
    obj.checkBox255:setWidth(19);
    obj.checkBox255:setHeight(24);
    obj.checkBox255:setField("dot369");
    obj.checkBox255:setName("checkBox255");

    obj.layout336 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout336:setParent(obj.rectangle1);
    obj.layout336:setLeft(677);
    obj.layout336:setTop(949);
    obj.layout336:setWidth(20);
    obj.layout336:setHeight(23);
    obj.layout336:setName("layout336");

    obj.checkBox256 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox256:setParent(obj.layout336);
    obj.checkBox256:setLeft(0);
    obj.checkBox256:setTop(0);
    obj.checkBox256:setWidth(20);
    obj.checkBox256:setHeight(24);
    obj.checkBox256:setField("dot370");
    obj.checkBox256:setName("checkBox256");

    obj.layout337 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout337:setParent(obj.rectangle1);
    obj.layout337:setLeft(694);
    obj.layout337:setTop(949);
    obj.layout337:setWidth(20);
    obj.layout337:setHeight(23);
    obj.layout337:setName("layout337");

    obj.checkBox257 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox257:setParent(obj.layout337);
    obj.checkBox257:setLeft(0);
    obj.checkBox257:setTop(0);
    obj.checkBox257:setWidth(20);
    obj.checkBox257:setHeight(24);
    obj.checkBox257:setField("dot371");
    obj.checkBox257:setName("checkBox257");

    obj.layout338 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout338:setParent(obj.rectangle1);
    obj.layout338:setLeft(711);
    obj.layout338:setTop(949);
    obj.layout338:setWidth(20);
    obj.layout338:setHeight(23);
    obj.layout338:setName("layout338");

    obj.checkBox258 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox258:setParent(obj.layout338);
    obj.checkBox258:setLeft(0);
    obj.checkBox258:setTop(0);
    obj.checkBox258:setWidth(20);
    obj.checkBox258:setHeight(24);
    obj.checkBox258:setField("dot372");
    obj.checkBox258:setName("checkBox258");

    obj.layout339 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout339:setParent(obj.rectangle1);
    obj.layout339:setLeft(728);
    obj.layout339:setTop(949);
    obj.layout339:setWidth(20);
    obj.layout339:setHeight(23);
    obj.layout339:setName("layout339");

    obj.checkBox259 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox259:setParent(obj.layout339);
    obj.checkBox259:setLeft(0);
    obj.checkBox259:setTop(0);
    obj.checkBox259:setWidth(20);
    obj.checkBox259:setHeight(24);
    obj.checkBox259:setField("dot373");
    obj.checkBox259:setName("checkBox259");

    obj.layout340 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout340:setParent(obj.rectangle1);
    obj.layout340:setLeft(660);
    obj.layout340:setTop(975);
    obj.layout340:setWidth(19);
    obj.layout340:setHeight(23);
    obj.layout340:setName("layout340");

    obj.checkBox260 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox260:setParent(obj.layout340);
    obj.checkBox260:setLeft(0);
    obj.checkBox260:setTop(0);
    obj.checkBox260:setWidth(19);
    obj.checkBox260:setHeight(24);
    obj.checkBox260:setField("dot377");
    obj.checkBox260:setName("checkBox260");

    obj.layout341 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout341:setParent(obj.rectangle1);
    obj.layout341:setLeft(677);
    obj.layout341:setTop(975);
    obj.layout341:setWidth(20);
    obj.layout341:setHeight(23);
    obj.layout341:setName("layout341");

    obj.checkBox261 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox261:setParent(obj.layout341);
    obj.checkBox261:setLeft(0);
    obj.checkBox261:setTop(0);
    obj.checkBox261:setWidth(20);
    obj.checkBox261:setHeight(24);
    obj.checkBox261:setField("dot378");
    obj.checkBox261:setName("checkBox261");

    obj.layout342 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout342:setParent(obj.rectangle1);
    obj.layout342:setLeft(694);
    obj.layout342:setTop(975);
    obj.layout342:setWidth(20);
    obj.layout342:setHeight(23);
    obj.layout342:setName("layout342");

    obj.checkBox262 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox262:setParent(obj.layout342);
    obj.checkBox262:setLeft(0);
    obj.checkBox262:setTop(0);
    obj.checkBox262:setWidth(20);
    obj.checkBox262:setHeight(24);
    obj.checkBox262:setField("dot379");
    obj.checkBox262:setName("checkBox262");

    obj.layout343 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout343:setParent(obj.rectangle1);
    obj.layout343:setLeft(711);
    obj.layout343:setTop(975);
    obj.layout343:setWidth(20);
    obj.layout343:setHeight(23);
    obj.layout343:setName("layout343");

    obj.checkBox263 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox263:setParent(obj.layout343);
    obj.checkBox263:setLeft(0);
    obj.checkBox263:setTop(0);
    obj.checkBox263:setWidth(20);
    obj.checkBox263:setHeight(24);
    obj.checkBox263:setField("dot380");
    obj.checkBox263:setName("checkBox263");

    obj.layout344 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout344:setParent(obj.rectangle1);
    obj.layout344:setLeft(728);
    obj.layout344:setTop(975);
    obj.layout344:setWidth(20);
    obj.layout344:setHeight(23);
    obj.layout344:setName("layout344");

    obj.checkBox264 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox264:setParent(obj.layout344);
    obj.checkBox264:setLeft(0);
    obj.checkBox264:setTop(0);
    obj.checkBox264:setWidth(20);
    obj.checkBox264:setHeight(24);
    obj.checkBox264:setField("dot381");
    obj.checkBox264:setName("checkBox264");

    obj.layout345 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout345:setParent(obj.rectangle1);
    obj.layout345:setLeft(660);
    obj.layout345:setTop(1001);
    obj.layout345:setWidth(19);
    obj.layout345:setHeight(23);
    obj.layout345:setName("layout345");

    obj.checkBox265 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox265:setParent(obj.layout345);
    obj.checkBox265:setLeft(0);
    obj.checkBox265:setTop(0);
    obj.checkBox265:setWidth(19);
    obj.checkBox265:setHeight(24);
    obj.checkBox265:setField("dot385");
    obj.checkBox265:setName("checkBox265");

    obj.layout346 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout346:setParent(obj.rectangle1);
    obj.layout346:setLeft(677);
    obj.layout346:setTop(1001);
    obj.layout346:setWidth(20);
    obj.layout346:setHeight(23);
    obj.layout346:setName("layout346");

    obj.checkBox266 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox266:setParent(obj.layout346);
    obj.checkBox266:setLeft(0);
    obj.checkBox266:setTop(0);
    obj.checkBox266:setWidth(20);
    obj.checkBox266:setHeight(24);
    obj.checkBox266:setField("dot386");
    obj.checkBox266:setName("checkBox266");

    obj.layout347 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout347:setParent(obj.rectangle1);
    obj.layout347:setLeft(694);
    obj.layout347:setTop(1001);
    obj.layout347:setWidth(20);
    obj.layout347:setHeight(23);
    obj.layout347:setName("layout347");

    obj.checkBox267 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox267:setParent(obj.layout347);
    obj.checkBox267:setLeft(0);
    obj.checkBox267:setTop(0);
    obj.checkBox267:setWidth(20);
    obj.checkBox267:setHeight(24);
    obj.checkBox267:setField("dot387");
    obj.checkBox267:setName("checkBox267");

    obj.layout348 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout348:setParent(obj.rectangle1);
    obj.layout348:setLeft(711);
    obj.layout348:setTop(1001);
    obj.layout348:setWidth(20);
    obj.layout348:setHeight(23);
    obj.layout348:setName("layout348");

    obj.checkBox268 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox268:setParent(obj.layout348);
    obj.checkBox268:setLeft(0);
    obj.checkBox268:setTop(0);
    obj.checkBox268:setWidth(20);
    obj.checkBox268:setHeight(24);
    obj.checkBox268:setField("dot388");
    obj.checkBox268:setName("checkBox268");

    obj.layout349 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout349:setParent(obj.rectangle1);
    obj.layout349:setLeft(728);
    obj.layout349:setTop(1001);
    obj.layout349:setWidth(20);
    obj.layout349:setHeight(23);
    obj.layout349:setName("layout349");

    obj.checkBox269 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox269:setParent(obj.layout349);
    obj.checkBox269:setLeft(0);
    obj.checkBox269:setTop(0);
    obj.checkBox269:setWidth(20);
    obj.checkBox269:setHeight(24);
    obj.checkBox269:setField("dot389");
    obj.checkBox269:setName("checkBox269");

    obj.layout350 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout350:setParent(obj.rectangle1);
    obj.layout350:setLeft(660);
    obj.layout350:setTop(1027);
    obj.layout350:setWidth(19);
    obj.layout350:setHeight(23);
    obj.layout350:setName("layout350");

    obj.checkBox270 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox270:setParent(obj.layout350);
    obj.checkBox270:setLeft(0);
    obj.checkBox270:setTop(0);
    obj.checkBox270:setWidth(19);
    obj.checkBox270:setHeight(24);
    obj.checkBox270:setField("dot393");
    obj.checkBox270:setName("checkBox270");

    obj.layout351 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout351:setParent(obj.rectangle1);
    obj.layout351:setLeft(677);
    obj.layout351:setTop(1027);
    obj.layout351:setWidth(20);
    obj.layout351:setHeight(23);
    obj.layout351:setName("layout351");

    obj.checkBox271 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox271:setParent(obj.layout351);
    obj.checkBox271:setLeft(0);
    obj.checkBox271:setTop(0);
    obj.checkBox271:setWidth(20);
    obj.checkBox271:setHeight(24);
    obj.checkBox271:setField("dot394");
    obj.checkBox271:setName("checkBox271");

    obj.layout352 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout352:setParent(obj.rectangle1);
    obj.layout352:setLeft(694);
    obj.layout352:setTop(1027);
    obj.layout352:setWidth(20);
    obj.layout352:setHeight(23);
    obj.layout352:setName("layout352");

    obj.checkBox272 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox272:setParent(obj.layout352);
    obj.checkBox272:setLeft(0);
    obj.checkBox272:setTop(0);
    obj.checkBox272:setWidth(20);
    obj.checkBox272:setHeight(24);
    obj.checkBox272:setField("dot395");
    obj.checkBox272:setName("checkBox272");

    obj.layout353 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout353:setParent(obj.rectangle1);
    obj.layout353:setLeft(711);
    obj.layout353:setTop(1027);
    obj.layout353:setWidth(20);
    obj.layout353:setHeight(23);
    obj.layout353:setName("layout353");

    obj.checkBox273 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox273:setParent(obj.layout353);
    obj.checkBox273:setLeft(0);
    obj.checkBox273:setTop(0);
    obj.checkBox273:setWidth(20);
    obj.checkBox273:setHeight(24);
    obj.checkBox273:setField("dot396");
    obj.checkBox273:setName("checkBox273");

    obj.layout354 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout354:setParent(obj.rectangle1);
    obj.layout354:setLeft(728);
    obj.layout354:setTop(1027);
    obj.layout354:setWidth(20);
    obj.layout354:setHeight(23);
    obj.layout354:setName("layout354");

    obj.checkBox274 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox274:setParent(obj.layout354);
    obj.checkBox274:setLeft(0);
    obj.checkBox274:setTop(0);
    obj.checkBox274:setWidth(20);
    obj.checkBox274:setHeight(24);
    obj.checkBox274:setField("dot397");
    obj.checkBox274:setName("checkBox274");

    obj.layout355 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout355:setParent(obj.rectangle1);
    obj.layout355:setLeft(660);
    obj.layout355:setTop(1053);
    obj.layout355:setWidth(19);
    obj.layout355:setHeight(23);
    obj.layout355:setName("layout355");

    obj.checkBox275 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox275:setParent(obj.layout355);
    obj.checkBox275:setLeft(0);
    obj.checkBox275:setTop(0);
    obj.checkBox275:setWidth(19);
    obj.checkBox275:setHeight(24);
    obj.checkBox275:setField("dot401");
    obj.checkBox275:setName("checkBox275");

    obj.layout356 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout356:setParent(obj.rectangle1);
    obj.layout356:setLeft(677);
    obj.layout356:setTop(1053);
    obj.layout356:setWidth(20);
    obj.layout356:setHeight(23);
    obj.layout356:setName("layout356");

    obj.checkBox276 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox276:setParent(obj.layout356);
    obj.checkBox276:setLeft(0);
    obj.checkBox276:setTop(0);
    obj.checkBox276:setWidth(20);
    obj.checkBox276:setHeight(24);
    obj.checkBox276:setField("dot402");
    obj.checkBox276:setName("checkBox276");

    obj.layout357 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout357:setParent(obj.rectangle1);
    obj.layout357:setLeft(694);
    obj.layout357:setTop(1053);
    obj.layout357:setWidth(20);
    obj.layout357:setHeight(23);
    obj.layout357:setName("layout357");

    obj.checkBox277 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox277:setParent(obj.layout357);
    obj.checkBox277:setLeft(0);
    obj.checkBox277:setTop(0);
    obj.checkBox277:setWidth(20);
    obj.checkBox277:setHeight(24);
    obj.checkBox277:setField("dot403");
    obj.checkBox277:setName("checkBox277");

    obj.layout358 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout358:setParent(obj.rectangle1);
    obj.layout358:setLeft(711);
    obj.layout358:setTop(1053);
    obj.layout358:setWidth(20);
    obj.layout358:setHeight(23);
    obj.layout358:setName("layout358");

    obj.checkBox278 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox278:setParent(obj.layout358);
    obj.checkBox278:setLeft(0);
    obj.checkBox278:setTop(0);
    obj.checkBox278:setWidth(20);
    obj.checkBox278:setHeight(24);
    obj.checkBox278:setField("dot404");
    obj.checkBox278:setName("checkBox278");

    obj.layout359 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout359:setParent(obj.rectangle1);
    obj.layout359:setLeft(728);
    obj.layout359:setTop(1053);
    obj.layout359:setWidth(20);
    obj.layout359:setHeight(23);
    obj.layout359:setName("layout359");

    obj.checkBox279 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox279:setParent(obj.layout359);
    obj.checkBox279:setLeft(0);
    obj.checkBox279:setTop(0);
    obj.checkBox279:setWidth(20);
    obj.checkBox279:setHeight(24);
    obj.checkBox279:setField("dot405");
    obj.checkBox279:setName("checkBox279");

    obj.layout360 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout360:setParent(obj.rectangle1);
    obj.layout360:setLeft(827);
    obj.layout360:setTop(559);
    obj.layout360:setWidth(26);
    obj.layout360:setHeight(29);
    obj.layout360:setName("layout360");

    obj.checkBox280 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox280:setParent(obj.layout360);
    obj.checkBox280:setLeft(0);
    obj.checkBox280:setTop(0);
    obj.checkBox280:setWidth(26);
    obj.checkBox280:setHeight(30);
    obj.checkBox280:setField("hdot1");
    obj.checkBox280:setName("checkBox280");

    obj.layout361 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout361:setParent(obj.rectangle1);
    obj.layout361:setLeft(848);
    obj.layout361:setTop(559);
    obj.layout361:setWidth(26);
    obj.layout361:setHeight(29);
    obj.layout361:setName("layout361");

    obj.checkBox281 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox281:setParent(obj.layout361);
    obj.checkBox281:setLeft(0);
    obj.checkBox281:setTop(0);
    obj.checkBox281:setWidth(26);
    obj.checkBox281:setHeight(30);
    obj.checkBox281:setField("hdot2");
    obj.checkBox281:setName("checkBox281");

    obj.layout362 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout362:setParent(obj.rectangle1);
    obj.layout362:setLeft(869);
    obj.layout362:setTop(559);
    obj.layout362:setWidth(26);
    obj.layout362:setHeight(29);
    obj.layout362:setName("layout362");

    obj.checkBox282 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox282:setParent(obj.layout362);
    obj.checkBox282:setLeft(0);
    obj.checkBox282:setTop(0);
    obj.checkBox282:setWidth(26);
    obj.checkBox282:setHeight(30);
    obj.checkBox282:setField("hdot3");
    obj.checkBox282:setName("checkBox282");

    obj.layout363 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout363:setParent(obj.rectangle1);
    obj.layout363:setLeft(890);
    obj.layout363:setTop(559);
    obj.layout363:setWidth(26);
    obj.layout363:setHeight(29);
    obj.layout363:setName("layout363");

    obj.checkBox283 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox283:setParent(obj.layout363);
    obj.checkBox283:setLeft(0);
    obj.checkBox283:setTop(0);
    obj.checkBox283:setWidth(26);
    obj.checkBox283:setHeight(30);
    obj.checkBox283:setField("hdot4");
    obj.checkBox283:setName("checkBox283");

    obj.layout364 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout364:setParent(obj.rectangle1);
    obj.layout364:setLeft(911);
    obj.layout364:setTop(559);
    obj.layout364:setWidth(26);
    obj.layout364:setHeight(29);
    obj.layout364:setName("layout364");

    obj.checkBox284 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox284:setParent(obj.layout364);
    obj.checkBox284:setLeft(0);
    obj.checkBox284:setTop(0);
    obj.checkBox284:setWidth(26);
    obj.checkBox284:setHeight(30);
    obj.checkBox284:setField("hdot5");
    obj.checkBox284:setName("checkBox284");

    obj.layout365 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout365:setParent(obj.rectangle1);
    obj.layout365:setLeft(932);
    obj.layout365:setTop(559);
    obj.layout365:setWidth(26);
    obj.layout365:setHeight(29);
    obj.layout365:setName("layout365");

    obj.checkBox285 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox285:setParent(obj.layout365);
    obj.checkBox285:setLeft(0);
    obj.checkBox285:setTop(0);
    obj.checkBox285:setWidth(26);
    obj.checkBox285:setHeight(30);
    obj.checkBox285:setField("hdot6");
    obj.checkBox285:setName("checkBox285");

    obj.layout366 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout366:setParent(obj.rectangle1);
    obj.layout366:setLeft(952);
    obj.layout366:setTop(559);
    obj.layout366:setWidth(26);
    obj.layout366:setHeight(29);
    obj.layout366:setName("layout366");

    obj.checkBox286 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox286:setParent(obj.layout366);
    obj.checkBox286:setLeft(0);
    obj.checkBox286:setTop(0);
    obj.checkBox286:setWidth(26);
    obj.checkBox286:setHeight(30);
    obj.checkBox286:setField("hdot7");
    obj.checkBox286:setName("checkBox286");

    obj.layout367 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout367:setParent(obj.rectangle1);
    obj.layout367:setLeft(974);
    obj.layout367:setTop(559);
    obj.layout367:setWidth(26);
    obj.layout367:setHeight(29);
    obj.layout367:setName("layout367");

    obj.checkBox287 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox287:setParent(obj.layout367);
    obj.checkBox287:setLeft(0);
    obj.checkBox287:setTop(0);
    obj.checkBox287:setWidth(26);
    obj.checkBox287:setHeight(30);
    obj.checkBox287:setField("hdot8");
    obj.checkBox287:setName("checkBox287");

    obj.layout368 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout368:setParent(obj.rectangle1);
    obj.layout368:setLeft(994);
    obj.layout368:setTop(559);
    obj.layout368:setWidth(26);
    obj.layout368:setHeight(29);
    obj.layout368:setName("layout368");

    obj.checkBox288 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox288:setParent(obj.layout368);
    obj.checkBox288:setLeft(0);
    obj.checkBox288:setTop(0);
    obj.checkBox288:setWidth(26);
    obj.checkBox288:setHeight(30);
    obj.checkBox288:setField("hdot9");
    obj.checkBox288:setName("checkBox288");

    obj.layout369 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout369:setParent(obj.rectangle1);
    obj.layout369:setLeft(1016);
    obj.layout369:setTop(559);
    obj.layout369:setWidth(26);
    obj.layout369:setHeight(29);
    obj.layout369:setName("layout369");

    obj.checkBox289 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox289:setParent(obj.layout369);
    obj.checkBox289:setLeft(0);
    obj.checkBox289:setTop(0);
    obj.checkBox289:setWidth(26);
    obj.checkBox289:setHeight(30);
    obj.checkBox289:setField("hdot10");
    obj.checkBox289:setName("checkBox289");

    obj.layout370 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout370:setParent(obj.rectangle1);
    obj.layout370:setLeft(1036);
    obj.layout370:setTop(559);
    obj.layout370:setWidth(26);
    obj.layout370:setHeight(29);
    obj.layout370:setName("layout370");

    obj.checkBox290 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox290:setParent(obj.layout370);
    obj.checkBox290:setLeft(0);
    obj.checkBox290:setTop(0);
    obj.checkBox290:setWidth(26);
    obj.checkBox290:setHeight(30);
    obj.checkBox290:setField("hdot11");
    obj.checkBox290:setName("checkBox290");

    obj.layout371 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout371:setParent(obj.rectangle1);
    obj.layout371:setLeft(1057);
    obj.layout371:setTop(559);
    obj.layout371:setWidth(26);
    obj.layout371:setHeight(29);
    obj.layout371:setName("layout371");

    obj.checkBox291 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox291:setParent(obj.layout371);
    obj.checkBox291:setLeft(0);
    obj.checkBox291:setTop(0);
    obj.checkBox291:setWidth(26);
    obj.checkBox291:setHeight(30);
    obj.checkBox291:setField("hdot12");
    obj.checkBox291:setName("checkBox291");

    obj.layout372 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout372:setParent(obj.rectangle1);
    obj.layout372:setLeft(850);
    obj.layout372:setTop(651);
    obj.layout372:setWidth(26);
    obj.layout372:setHeight(29);
    obj.layout372:setName("layout372");

    obj.checkBox292 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox292:setParent(obj.layout372);
    obj.checkBox292:setLeft(0);
    obj.checkBox292:setTop(0);
    obj.checkBox292:setWidth(26);
    obj.checkBox292:setHeight(30);
    obj.checkBox292:setField("willdot1");
    obj.checkBox292:setName("checkBox292");

    obj.layout373 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout373:setParent(obj.rectangle1);
    obj.layout373:setLeft(871);
    obj.layout373:setTop(651);
    obj.layout373:setWidth(26);
    obj.layout373:setHeight(29);
    obj.layout373:setName("layout373");

    obj.checkBox293 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox293:setParent(obj.layout373);
    obj.checkBox293:setLeft(0);
    obj.checkBox293:setTop(0);
    obj.checkBox293:setWidth(26);
    obj.checkBox293:setHeight(30);
    obj.checkBox293:setField("willdot2");
    obj.checkBox293:setName("checkBox293");

    obj.layout374 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout374:setParent(obj.rectangle1);
    obj.layout374:setLeft(892);
    obj.layout374:setTop(651);
    obj.layout374:setWidth(26);
    obj.layout374:setHeight(29);
    obj.layout374:setName("layout374");

    obj.checkBox294 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox294:setParent(obj.layout374);
    obj.checkBox294:setLeft(0);
    obj.checkBox294:setTop(0);
    obj.checkBox294:setWidth(26);
    obj.checkBox294:setHeight(30);
    obj.checkBox294:setField("willdot3");
    obj.checkBox294:setName("checkBox294");

    obj.layout375 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout375:setParent(obj.rectangle1);
    obj.layout375:setLeft(913);
    obj.layout375:setTop(651);
    obj.layout375:setWidth(26);
    obj.layout375:setHeight(29);
    obj.layout375:setName("layout375");

    obj.checkBox295 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox295:setParent(obj.layout375);
    obj.checkBox295:setLeft(0);
    obj.checkBox295:setTop(0);
    obj.checkBox295:setWidth(26);
    obj.checkBox295:setHeight(30);
    obj.checkBox295:setField("willdot4");
    obj.checkBox295:setName("checkBox295");

    obj.layout376 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout376:setParent(obj.rectangle1);
    obj.layout376:setLeft(934);
    obj.layout376:setTop(651);
    obj.layout376:setWidth(26);
    obj.layout376:setHeight(29);
    obj.layout376:setName("layout376");

    obj.checkBox296 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox296:setParent(obj.layout376);
    obj.checkBox296:setLeft(0);
    obj.checkBox296:setTop(0);
    obj.checkBox296:setWidth(26);
    obj.checkBox296:setHeight(30);
    obj.checkBox296:setField("willdot5");
    obj.checkBox296:setName("checkBox296");

    obj.layout377 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout377:setParent(obj.rectangle1);
    obj.layout377:setLeft(955);
    obj.layout377:setTop(651);
    obj.layout377:setWidth(26);
    obj.layout377:setHeight(29);
    obj.layout377:setName("layout377");

    obj.checkBox297 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox297:setParent(obj.layout377);
    obj.checkBox297:setLeft(0);
    obj.checkBox297:setTop(0);
    obj.checkBox297:setWidth(26);
    obj.checkBox297:setHeight(30);
    obj.checkBox297:setField("willdot6");
    obj.checkBox297:setName("checkBox297");

    obj.layout378 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout378:setParent(obj.rectangle1);
    obj.layout378:setLeft(976);
    obj.layout378:setTop(651);
    obj.layout378:setWidth(26);
    obj.layout378:setHeight(29);
    obj.layout378:setName("layout378");

    obj.checkBox298 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox298:setParent(obj.layout378);
    obj.checkBox298:setLeft(0);
    obj.checkBox298:setTop(0);
    obj.checkBox298:setWidth(26);
    obj.checkBox298:setHeight(30);
    obj.checkBox298:setField("willdot7");
    obj.checkBox298:setName("checkBox298");

    obj.layout379 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout379:setParent(obj.rectangle1);
    obj.layout379:setLeft(996);
    obj.layout379:setTop(651);
    obj.layout379:setWidth(26);
    obj.layout379:setHeight(29);
    obj.layout379:setName("layout379");

    obj.checkBox299 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox299:setParent(obj.layout379);
    obj.checkBox299:setLeft(0);
    obj.checkBox299:setTop(0);
    obj.checkBox299:setWidth(26);
    obj.checkBox299:setHeight(30);
    obj.checkBox299:setField("willdot8");
    obj.checkBox299:setName("checkBox299");

    obj.layout380 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout380:setParent(obj.rectangle1);
    obj.layout380:setLeft(1018);
    obj.layout380:setTop(651);
    obj.layout380:setWidth(26);
    obj.layout380:setHeight(29);
    obj.layout380:setName("layout380");

    obj.checkBox300 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox300:setParent(obj.layout380);
    obj.checkBox300:setLeft(0);
    obj.checkBox300:setTop(0);
    obj.checkBox300:setWidth(26);
    obj.checkBox300:setHeight(30);
    obj.checkBox300:setField("willdot9");
    obj.checkBox300:setName("checkBox300");

    obj.layout381 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout381:setParent(obj.rectangle1);
    obj.layout381:setLeft(1038);
    obj.layout381:setTop(651);
    obj.layout381:setWidth(26);
    obj.layout381:setHeight(29);
    obj.layout381:setName("layout381");

    obj.checkBox301 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox301:setParent(obj.layout381);
    obj.checkBox301:setLeft(0);
    obj.checkBox301:setTop(0);
    obj.checkBox301:setWidth(26);
    obj.checkBox301:setHeight(30);
    obj.checkBox301:setField("willdot10");
    obj.checkBox301:setName("checkBox301");

    obj.layout382 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout382:setParent(obj.rectangle1);
    obj.layout382:setLeft(855);
    obj.layout382:setTop(679);
    obj.layout382:setWidth(19);
    obj.layout382:setHeight(20);
    obj.layout382:setName("layout382");

    obj.checkBox302 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox302:setParent(obj.layout382);
    obj.checkBox302:setLeft(0);
    obj.checkBox302:setTop(0);
    obj.checkBox302:setWidth(19);
    obj.checkBox302:setHeight(21);
    obj.checkBox302:setField("check1");
    obj.checkBox302:setName("checkBox302");

    obj.layout383 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout383:setParent(obj.rectangle1);
    obj.layout383:setLeft(876);
    obj.layout383:setTop(679);
    obj.layout383:setWidth(19);
    obj.layout383:setHeight(20);
    obj.layout383:setName("layout383");

    obj.checkBox303 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox303:setParent(obj.layout383);
    obj.checkBox303:setLeft(0);
    obj.checkBox303:setTop(0);
    obj.checkBox303:setWidth(19);
    obj.checkBox303:setHeight(21);
    obj.checkBox303:setField("check2");
    obj.checkBox303:setName("checkBox303");

    obj.layout384 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout384:setParent(obj.rectangle1);
    obj.layout384:setLeft(896);
    obj.layout384:setTop(679);
    obj.layout384:setWidth(19);
    obj.layout384:setHeight(20);
    obj.layout384:setName("layout384");

    obj.checkBox304 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox304:setParent(obj.layout384);
    obj.checkBox304:setLeft(0);
    obj.checkBox304:setTop(0);
    obj.checkBox304:setWidth(19);
    obj.checkBox304:setHeight(21);
    obj.checkBox304:setField("check3");
    obj.checkBox304:setName("checkBox304");

    obj.layout385 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout385:setParent(obj.rectangle1);
    obj.layout385:setLeft(918);
    obj.layout385:setTop(679);
    obj.layout385:setWidth(19);
    obj.layout385:setHeight(20);
    obj.layout385:setName("layout385");

    obj.checkBox305 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox305:setParent(obj.layout385);
    obj.checkBox305:setLeft(0);
    obj.checkBox305:setTop(0);
    obj.checkBox305:setWidth(19);
    obj.checkBox305:setHeight(21);
    obj.checkBox305:setField("check4");
    obj.checkBox305:setName("checkBox305");

    obj.layout386 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout386:setParent(obj.rectangle1);
    obj.layout386:setLeft(938);
    obj.layout386:setTop(679);
    obj.layout386:setWidth(19);
    obj.layout386:setHeight(20);
    obj.layout386:setName("layout386");

    obj.checkBox306 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox306:setParent(obj.layout386);
    obj.checkBox306:setLeft(0);
    obj.checkBox306:setTop(0);
    obj.checkBox306:setWidth(19);
    obj.checkBox306:setHeight(21);
    obj.checkBox306:setField("check5");
    obj.checkBox306:setName("checkBox306");

    obj.layout387 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout387:setParent(obj.rectangle1);
    obj.layout387:setLeft(959);
    obj.layout387:setTop(679);
    obj.layout387:setWidth(19);
    obj.layout387:setHeight(20);
    obj.layout387:setName("layout387");

    obj.checkBox307 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox307:setParent(obj.layout387);
    obj.checkBox307:setLeft(0);
    obj.checkBox307:setTop(0);
    obj.checkBox307:setWidth(19);
    obj.checkBox307:setHeight(21);
    obj.checkBox307:setField("check6");
    obj.checkBox307:setName("checkBox307");

    obj.layout388 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout388:setParent(obj.rectangle1);
    obj.layout388:setLeft(980);
    obj.layout388:setTop(679);
    obj.layout388:setWidth(19);
    obj.layout388:setHeight(20);
    obj.layout388:setName("layout388");

    obj.checkBox308 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox308:setParent(obj.layout388);
    obj.checkBox308:setLeft(0);
    obj.checkBox308:setTop(0);
    obj.checkBox308:setWidth(19);
    obj.checkBox308:setHeight(21);
    obj.checkBox308:setField("check7");
    obj.checkBox308:setName("checkBox308");

    obj.layout389 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout389:setParent(obj.rectangle1);
    obj.layout389:setLeft(1001);
    obj.layout389:setTop(679);
    obj.layout389:setWidth(19);
    obj.layout389:setHeight(20);
    obj.layout389:setName("layout389");

    obj.checkBox309 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox309:setParent(obj.layout389);
    obj.checkBox309:setLeft(0);
    obj.checkBox309:setTop(0);
    obj.checkBox309:setWidth(19);
    obj.checkBox309:setHeight(21);
    obj.checkBox309:setField("check8");
    obj.checkBox309:setName("checkBox309");

    obj.layout390 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout390:setParent(obj.rectangle1);
    obj.layout390:setLeft(1022);
    obj.layout390:setTop(679);
    obj.layout390:setWidth(19);
    obj.layout390:setHeight(20);
    obj.layout390:setName("layout390");

    obj.checkBox310 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox310:setParent(obj.layout390);
    obj.checkBox310:setLeft(0);
    obj.checkBox310:setTop(0);
    obj.checkBox310:setWidth(19);
    obj.checkBox310:setHeight(21);
    obj.checkBox310:setField("check9");
    obj.checkBox310:setName("checkBox310");

    obj.layout391 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout391:setParent(obj.rectangle1);
    obj.layout391:setLeft(1042);
    obj.layout391:setTop(679);
    obj.layout391:setWidth(19);
    obj.layout391:setHeight(20);
    obj.layout391:setName("layout391");

    obj.checkBox311 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox311:setParent(obj.layout391);
    obj.checkBox311:setLeft(0);
    obj.checkBox311:setTop(0);
    obj.checkBox311:setWidth(19);
    obj.checkBox311:setHeight(21);
    obj.checkBox311:setField("check10");
    obj.checkBox311:setName("checkBox311");

    obj.layout392 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout392:setParent(obj.rectangle1);
    obj.layout392:setLeft(852);
    obj.layout392:setTop(739);
    obj.layout392:setWidth(26);
    obj.layout392:setHeight(29);
    obj.layout392:setName("layout392");

    obj.checkBox312 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox312:setParent(obj.layout392);
    obj.checkBox312:setLeft(0);
    obj.checkBox312:setTop(0);
    obj.checkBox312:setWidth(26);
    obj.checkBox312:setHeight(30);
    obj.checkBox312:setField("bpdot1");
    obj.checkBox312:setName("checkBox312");

    obj.layout393 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout393:setParent(obj.rectangle1);
    obj.layout393:setLeft(873);
    obj.layout393:setTop(739);
    obj.layout393:setWidth(26);
    obj.layout393:setHeight(29);
    obj.layout393:setName("layout393");

    obj.checkBox313 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox313:setParent(obj.layout393);
    obj.checkBox313:setLeft(0);
    obj.checkBox313:setTop(0);
    obj.checkBox313:setWidth(26);
    obj.checkBox313:setHeight(30);
    obj.checkBox313:setField("bpdot2");
    obj.checkBox313:setName("checkBox313");

    obj.layout394 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout394:setParent(obj.rectangle1);
    obj.layout394:setLeft(894);
    obj.layout394:setTop(739);
    obj.layout394:setWidth(26);
    obj.layout394:setHeight(29);
    obj.layout394:setName("layout394");

    obj.checkBox314 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox314:setParent(obj.layout394);
    obj.checkBox314:setLeft(0);
    obj.checkBox314:setTop(0);
    obj.checkBox314:setWidth(26);
    obj.checkBox314:setHeight(30);
    obj.checkBox314:setField("bpdot3");
    obj.checkBox314:setName("checkBox314");

    obj.layout395 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout395:setParent(obj.rectangle1);
    obj.layout395:setLeft(915);
    obj.layout395:setTop(739);
    obj.layout395:setWidth(26);
    obj.layout395:setHeight(29);
    obj.layout395:setName("layout395");

    obj.checkBox315 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox315:setParent(obj.layout395);
    obj.checkBox315:setLeft(0);
    obj.checkBox315:setTop(0);
    obj.checkBox315:setWidth(26);
    obj.checkBox315:setHeight(30);
    obj.checkBox315:setField("bpdot4");
    obj.checkBox315:setName("checkBox315");

    obj.layout396 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout396:setParent(obj.rectangle1);
    obj.layout396:setLeft(936);
    obj.layout396:setTop(739);
    obj.layout396:setWidth(26);
    obj.layout396:setHeight(29);
    obj.layout396:setName("layout396");

    obj.checkBox316 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox316:setParent(obj.layout396);
    obj.checkBox316:setLeft(0);
    obj.checkBox316:setTop(0);
    obj.checkBox316:setWidth(26);
    obj.checkBox316:setHeight(30);
    obj.checkBox316:setField("bpdot5");
    obj.checkBox316:setName("checkBox316");

    obj.layout397 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout397:setParent(obj.rectangle1);
    obj.layout397:setLeft(957);
    obj.layout397:setTop(739);
    obj.layout397:setWidth(26);
    obj.layout397:setHeight(29);
    obj.layout397:setName("layout397");

    obj.checkBox317 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox317:setParent(obj.layout397);
    obj.checkBox317:setLeft(0);
    obj.checkBox317:setTop(0);
    obj.checkBox317:setWidth(26);
    obj.checkBox317:setHeight(30);
    obj.checkBox317:setField("bpdot6");
    obj.checkBox317:setName("checkBox317");

    obj.layout398 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout398:setParent(obj.rectangle1);
    obj.layout398:setLeft(978);
    obj.layout398:setTop(739);
    obj.layout398:setWidth(26);
    obj.layout398:setHeight(29);
    obj.layout398:setName("layout398");

    obj.checkBox318 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox318:setParent(obj.layout398);
    obj.checkBox318:setLeft(0);
    obj.checkBox318:setTop(0);
    obj.checkBox318:setWidth(26);
    obj.checkBox318:setHeight(30);
    obj.checkBox318:setField("bpdot7");
    obj.checkBox318:setName("checkBox318");

    obj.layout399 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout399:setParent(obj.rectangle1);
    obj.layout399:setLeft(999);
    obj.layout399:setTop(739);
    obj.layout399:setWidth(26);
    obj.layout399:setHeight(29);
    obj.layout399:setName("layout399");

    obj.checkBox319 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox319:setParent(obj.layout399);
    obj.checkBox319:setLeft(0);
    obj.checkBox319:setTop(0);
    obj.checkBox319:setWidth(26);
    obj.checkBox319:setHeight(30);
    obj.checkBox319:setField("bpdot8");
    obj.checkBox319:setName("checkBox319");

    obj.layout400 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout400:setParent(obj.rectangle1);
    obj.layout400:setLeft(1020);
    obj.layout400:setTop(739);
    obj.layout400:setWidth(26);
    obj.layout400:setHeight(29);
    obj.layout400:setName("layout400");

    obj.checkBox320 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox320:setParent(obj.layout400);
    obj.checkBox320:setLeft(0);
    obj.checkBox320:setTop(0);
    obj.checkBox320:setWidth(26);
    obj.checkBox320:setHeight(30);
    obj.checkBox320:setField("bpdot9");
    obj.checkBox320:setName("checkBox320");

    obj.layout401 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout401:setParent(obj.rectangle1);
    obj.layout401:setLeft(1041);
    obj.layout401:setTop(739);
    obj.layout401:setWidth(26);
    obj.layout401:setHeight(29);
    obj.layout401:setName("layout401");

    obj.checkBox321 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox321:setParent(obj.layout401);
    obj.checkBox321:setLeft(0);
    obj.checkBox321:setTop(0);
    obj.checkBox321:setWidth(26);
    obj.checkBox321:setHeight(30);
    obj.checkBox321:setField("bpdot10");
    obj.checkBox321:setName("checkBox321");

    obj.layout402 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout402:setParent(obj.rectangle1);
    obj.layout402:setLeft(852);
    obj.layout402:setTop(893);
    obj.layout402:setWidth(26);
    obj.layout402:setHeight(29);
    obj.layout402:setName("layout402");

    obj.checkBox322 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox322:setParent(obj.layout402);
    obj.checkBox322:setLeft(0);
    obj.checkBox322:setTop(0);
    obj.checkBox322:setWidth(26);
    obj.checkBox322:setHeight(30);
    obj.checkBox322:setField("wisdot1");
    obj.checkBox322:setName("checkBox322");

    obj.layout403 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout403:setParent(obj.rectangle1);
    obj.layout403:setLeft(873);
    obj.layout403:setTop(893);
    obj.layout403:setWidth(26);
    obj.layout403:setHeight(29);
    obj.layout403:setName("layout403");

    obj.checkBox323 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox323:setParent(obj.layout403);
    obj.checkBox323:setLeft(0);
    obj.checkBox323:setTop(0);
    obj.checkBox323:setWidth(26);
    obj.checkBox323:setHeight(30);
    obj.checkBox323:setField("wisdot2");
    obj.checkBox323:setName("checkBox323");

    obj.layout404 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout404:setParent(obj.rectangle1);
    obj.layout404:setLeft(894);
    obj.layout404:setTop(893);
    obj.layout404:setWidth(26);
    obj.layout404:setHeight(29);
    obj.layout404:setName("layout404");

    obj.checkBox324 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox324:setParent(obj.layout404);
    obj.checkBox324:setLeft(0);
    obj.checkBox324:setTop(0);
    obj.checkBox324:setWidth(26);
    obj.checkBox324:setHeight(30);
    obj.checkBox324:setField("wisdot3");
    obj.checkBox324:setName("checkBox324");

    obj.layout405 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout405:setParent(obj.rectangle1);
    obj.layout405:setLeft(915);
    obj.layout405:setTop(893);
    obj.layout405:setWidth(26);
    obj.layout405:setHeight(29);
    obj.layout405:setName("layout405");

    obj.checkBox325 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox325:setParent(obj.layout405);
    obj.checkBox325:setLeft(0);
    obj.checkBox325:setTop(0);
    obj.checkBox325:setWidth(26);
    obj.checkBox325:setHeight(30);
    obj.checkBox325:setField("wisdot4");
    obj.checkBox325:setName("checkBox325");

    obj.layout406 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout406:setParent(obj.rectangle1);
    obj.layout406:setLeft(936);
    obj.layout406:setTop(893);
    obj.layout406:setWidth(26);
    obj.layout406:setHeight(29);
    obj.layout406:setName("layout406");

    obj.checkBox326 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox326:setParent(obj.layout406);
    obj.checkBox326:setLeft(0);
    obj.checkBox326:setTop(0);
    obj.checkBox326:setWidth(26);
    obj.checkBox326:setHeight(30);
    obj.checkBox326:setField("wisdot5");
    obj.checkBox326:setName("checkBox326");

    obj.layout407 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout407:setParent(obj.rectangle1);
    obj.layout407:setLeft(957);
    obj.layout407:setTop(893);
    obj.layout407:setWidth(26);
    obj.layout407:setHeight(29);
    obj.layout407:setName("layout407");

    obj.checkBox327 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox327:setParent(obj.layout407);
    obj.checkBox327:setLeft(0);
    obj.checkBox327:setTop(0);
    obj.checkBox327:setWidth(26);
    obj.checkBox327:setHeight(30);
    obj.checkBox327:setField("wisdot6");
    obj.checkBox327:setName("checkBox327");

    obj.layout408 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout408:setParent(obj.rectangle1);
    obj.layout408:setLeft(978);
    obj.layout408:setTop(893);
    obj.layout408:setWidth(26);
    obj.layout408:setHeight(29);
    obj.layout408:setName("layout408");

    obj.checkBox328 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox328:setParent(obj.layout408);
    obj.checkBox328:setLeft(0);
    obj.checkBox328:setTop(0);
    obj.checkBox328:setWidth(26);
    obj.checkBox328:setHeight(30);
    obj.checkBox328:setField("wisdot7");
    obj.checkBox328:setName("checkBox328");

    obj.layout409 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout409:setParent(obj.rectangle1);
    obj.layout409:setLeft(999);
    obj.layout409:setTop(893);
    obj.layout409:setWidth(26);
    obj.layout409:setHeight(29);
    obj.layout409:setName("layout409");

    obj.checkBox329 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox329:setParent(obj.layout409);
    obj.checkBox329:setLeft(0);
    obj.checkBox329:setTop(0);
    obj.checkBox329:setWidth(26);
    obj.checkBox329:setHeight(30);
    obj.checkBox329:setField("wisdot8");
    obj.checkBox329:setName("checkBox329");

    obj.layout410 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout410:setParent(obj.rectangle1);
    obj.layout410:setLeft(1020);
    obj.layout410:setTop(893);
    obj.layout410:setWidth(26);
    obj.layout410:setHeight(29);
    obj.layout410:setName("layout410");

    obj.checkBox330 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox330:setParent(obj.layout410);
    obj.checkBox330:setLeft(0);
    obj.checkBox330:setTop(0);
    obj.checkBox330:setWidth(26);
    obj.checkBox330:setHeight(30);
    obj.checkBox330:setField("wisdot9");
    obj.checkBox330:setName("checkBox330");

    obj.layout411 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout411:setParent(obj.rectangle1);
    obj.layout411:setLeft(1041);
    obj.layout411:setTop(893);
    obj.layout411:setWidth(26);
    obj.layout411:setHeight(29);
    obj.layout411:setName("layout411");

    obj.checkBox331 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox331:setParent(obj.layout411);
    obj.checkBox331:setLeft(0);
    obj.checkBox331:setTop(0);
    obj.checkBox331:setWidth(26);
    obj.checkBox331:setHeight(30);
    obj.checkBox331:setField("wisdot10");
    obj.checkBox331:setName("checkBox331");

    obj.layout412 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout412:setParent(obj.rectangle1);
    obj.layout412:setLeft(628);
    obj.layout412:setTop(1368);
    obj.layout412:setWidth(17);
    obj.layout412:setHeight(17);
    obj.layout412:setName("layout412");

    obj.checkBox332 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox332:setParent(obj.layout412);
    obj.checkBox332:setLeft(0);
    obj.checkBox332:setTop(0);
    obj.checkBox332:setWidth(17);
    obj.checkBox332:setHeight(18);
    obj.checkBox332:setField("beats1");
    obj.checkBox332:setName("checkBox332");

    obj.layout413 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout413:setParent(obj.rectangle1);
    obj.layout413:setLeft(653);
    obj.layout413:setTop(1368);
    obj.layout413:setWidth(17);
    obj.layout413:setHeight(17);
    obj.layout413:setName("layout413");

    obj.checkBox333 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox333:setParent(obj.layout413);
    obj.checkBox333:setLeft(0);
    obj.checkBox333:setTop(0);
    obj.checkBox333:setWidth(17);
    obj.checkBox333:setHeight(18);
    obj.checkBox333:setField("beats2");
    obj.checkBox333:setName("checkBox333");

    obj.layout414 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout414:setParent(obj.rectangle1);
    obj.layout414:setLeft(679);
    obj.layout414:setTop(1368);
    obj.layout414:setWidth(17);
    obj.layout414:setHeight(17);
    obj.layout414:setName("layout414");

    obj.checkBox334 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox334:setParent(obj.layout414);
    obj.checkBox334:setLeft(0);
    obj.checkBox334:setTop(0);
    obj.checkBox334:setWidth(17);
    obj.checkBox334:setHeight(18);
    obj.checkBox334:setField("beats3");
    obj.checkBox334:setName("checkBox334");

    obj.layout415 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout415:setParent(obj.rectangle1);
    obj.layout415:setLeft(705);
    obj.layout415:setTop(1368);
    obj.layout415:setWidth(17);
    obj.layout415:setHeight(17);
    obj.layout415:setName("layout415");

    obj.checkBox335 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox335:setParent(obj.layout415);
    obj.checkBox335:setLeft(0);
    obj.checkBox335:setTop(0);
    obj.checkBox335:setWidth(17);
    obj.checkBox335:setHeight(18);
    obj.checkBox335:setField("beats4");
    obj.checkBox335:setName("checkBox335");

    obj.layout416 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout416:setParent(obj.rectangle1);
    obj.layout416:setLeft(731);
    obj.layout416:setTop(1368);
    obj.layout416:setWidth(17);
    obj.layout416:setHeight(17);
    obj.layout416:setName("layout416");

    obj.checkBox336 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox336:setParent(obj.layout416);
    obj.checkBox336:setLeft(0);
    obj.checkBox336:setTop(0);
    obj.checkBox336:setWidth(17);
    obj.checkBox336:setHeight(18);
    obj.checkBox336:setField("beats5");
    obj.checkBox336:setName("checkBox336");

    obj.layout417 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout417:setParent(obj.rectangle1);
    obj.layout417:setLeft(628);
    obj.layout417:setTop(1420);
    obj.layout417:setWidth(17);
    obj.layout417:setHeight(17);
    obj.layout417:setName("layout417");

    obj.checkBox337 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox337:setParent(obj.layout417);
    obj.checkBox337:setLeft(0);
    obj.checkBox337:setTop(0);
    obj.checkBox337:setWidth(17);
    obj.checkBox337:setHeight(18);
    obj.checkBox337:setField("beats6");
    obj.checkBox337:setName("checkBox337");

    obj.layout418 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout418:setParent(obj.rectangle1);
    obj.layout418:setLeft(653);
    obj.layout418:setTop(1420);
    obj.layout418:setWidth(17);
    obj.layout418:setHeight(17);
    obj.layout418:setName("layout418");

    obj.checkBox338 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox338:setParent(obj.layout418);
    obj.checkBox338:setLeft(0);
    obj.checkBox338:setTop(0);
    obj.checkBox338:setWidth(17);
    obj.checkBox338:setHeight(18);
    obj.checkBox338:setField("beats7");
    obj.checkBox338:setName("checkBox338");

    obj.layout419 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout419:setParent(obj.rectangle1);
    obj.layout419:setLeft(679);
    obj.layout419:setTop(1420);
    obj.layout419:setWidth(17);
    obj.layout419:setHeight(17);
    obj.layout419:setName("layout419");

    obj.checkBox339 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox339:setParent(obj.layout419);
    obj.checkBox339:setLeft(0);
    obj.checkBox339:setTop(0);
    obj.checkBox339:setWidth(17);
    obj.checkBox339:setHeight(18);
    obj.checkBox339:setField("beats8");
    obj.checkBox339:setName("checkBox339");

    obj.layout420 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout420:setParent(obj.rectangle1);
    obj.layout420:setLeft(705);
    obj.layout420:setTop(1420);
    obj.layout420:setWidth(17);
    obj.layout420:setHeight(17);
    obj.layout420:setName("layout420");

    obj.checkBox340 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox340:setParent(obj.layout420);
    obj.checkBox340:setLeft(0);
    obj.checkBox340:setTop(0);
    obj.checkBox340:setWidth(17);
    obj.checkBox340:setHeight(18);
    obj.checkBox340:setField("beats9");
    obj.checkBox340:setName("checkBox340");

    obj.layout421 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout421:setParent(obj.rectangle1);
    obj.layout421:setLeft(731);
    obj.layout421:setTop(1420);
    obj.layout421:setWidth(17);
    obj.layout421:setHeight(17);
    obj.layout421:setName("layout421");

    obj.checkBox341 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox341:setParent(obj.layout421);
    obj.checkBox341:setLeft(0);
    obj.checkBox341:setTop(0);
    obj.checkBox341:setWidth(17);
    obj.checkBox341:setHeight(18);
    obj.checkBox341:setField("beats10");
    obj.checkBox341:setName("checkBox341");

    obj.layout422 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout422:setParent(obj.rectangle1);
    obj.layout422:setLeft(833);
    obj.layout422:setTop(587);
    obj.layout422:setWidth(16);
    obj.layout422:setHeight(17);
    obj.layout422:setName("layout422");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout422);
    obj.edit81:setTransparent(true);
    obj.edit81:setFontSize(10.5);
    obj.edit81:setFontColor("#000000");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(0);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(16);
    obj.edit81:setHeight(18);
    obj.edit81:setField("hbox1");
    obj.edit81:setName("edit81");

    obj.layout423 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout423:setParent(obj.rectangle1);
    obj.layout423:setLeft(854);
    obj.layout423:setTop(587);
    obj.layout423:setWidth(16);
    obj.layout423:setHeight(17);
    obj.layout423:setName("layout423");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout423);
    obj.edit82:setTransparent(true);
    obj.edit82:setFontSize(10.5);
    obj.edit82:setFontColor("#000000");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(16);
    obj.edit82:setHeight(18);
    obj.edit82:setField("hbox2");
    obj.edit82:setName("edit82");

    obj.layout424 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout424:setParent(obj.rectangle1);
    obj.layout424:setLeft(875);
    obj.layout424:setTop(587);
    obj.layout424:setWidth(16);
    obj.layout424:setHeight(17);
    obj.layout424:setName("layout424");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout424);
    obj.edit83:setTransparent(true);
    obj.edit83:setFontSize(10.5);
    obj.edit83:setFontColor("#000000");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(0);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(16);
    obj.edit83:setHeight(18);
    obj.edit83:setField("hbox3");
    obj.edit83:setName("edit83");

    obj.layout425 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout425:setParent(obj.rectangle1);
    obj.layout425:setLeft(896);
    obj.layout425:setTop(587);
    obj.layout425:setWidth(16);
    obj.layout425:setHeight(17);
    obj.layout425:setName("layout425");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout425);
    obj.edit84:setTransparent(true);
    obj.edit84:setFontSize(10.5);
    obj.edit84:setFontColor("#000000");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(0);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(16);
    obj.edit84:setHeight(18);
    obj.edit84:setField("hbox4");
    obj.edit84:setName("edit84");

    obj.layout426 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout426:setParent(obj.rectangle1);
    obj.layout426:setLeft(917);
    obj.layout426:setTop(587);
    obj.layout426:setWidth(16);
    obj.layout426:setHeight(17);
    obj.layout426:setName("layout426");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout426);
    obj.edit85:setTransparent(true);
    obj.edit85:setFontSize(10.5);
    obj.edit85:setFontColor("#000000");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(0);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(16);
    obj.edit85:setHeight(18);
    obj.edit85:setField("hbox5");
    obj.edit85:setName("edit85");

    obj.layout427 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout427:setParent(obj.rectangle1);
    obj.layout427:setLeft(938);
    obj.layout427:setTop(587);
    obj.layout427:setWidth(16);
    obj.layout427:setHeight(17);
    obj.layout427:setName("layout427");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout427);
    obj.edit86:setTransparent(true);
    obj.edit86:setFontSize(10.5);
    obj.edit86:setFontColor("#000000");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(0);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(16);
    obj.edit86:setHeight(18);
    obj.edit86:setField("hbox6");
    obj.edit86:setName("edit86");

    obj.layout428 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout428:setParent(obj.rectangle1);
    obj.layout428:setLeft(959);
    obj.layout428:setTop(588);
    obj.layout428:setWidth(16);
    obj.layout428:setHeight(17);
    obj.layout428:setName("layout428");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout428);
    obj.edit87:setTransparent(true);
    obj.edit87:setFontSize(10.5);
    obj.edit87:setFontColor("#000000");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(0);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(16);
    obj.edit87:setHeight(18);
    obj.edit87:setField("hbox7");
    obj.edit87:setName("edit87");

    obj.layout429 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout429:setParent(obj.rectangle1);
    obj.layout429:setLeft(980);
    obj.layout429:setTop(587);
    obj.layout429:setWidth(16);
    obj.layout429:setHeight(17);
    obj.layout429:setName("layout429");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout429);
    obj.edit88:setTransparent(true);
    obj.edit88:setFontSize(10.5);
    obj.edit88:setFontColor("#000000");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(0);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(16);
    obj.edit88:setHeight(18);
    obj.edit88:setField("hbox8");
    obj.edit88:setName("edit88");

    obj.layout430 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout430:setParent(obj.rectangle1);
    obj.layout430:setLeft(1000);
    obj.layout430:setTop(587);
    obj.layout430:setWidth(16);
    obj.layout430:setHeight(17);
    obj.layout430:setName("layout430");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout430);
    obj.edit89:setTransparent(true);
    obj.edit89:setFontSize(10.5);
    obj.edit89:setFontColor("#000000");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(0);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(16);
    obj.edit89:setHeight(18);
    obj.edit89:setField("hbox9");
    obj.edit89:setName("edit89");

    obj.layout431 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout431:setParent(obj.rectangle1);
    obj.layout431:setLeft(1021);
    obj.layout431:setTop(587);
    obj.layout431:setWidth(16);
    obj.layout431:setHeight(17);
    obj.layout431:setName("layout431");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout431);
    obj.edit90:setTransparent(true);
    obj.edit90:setFontSize(10.5);
    obj.edit90:setFontColor("#000000");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(0);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(16);
    obj.edit90:setHeight(18);
    obj.edit90:setField("hbox10");
    obj.edit90:setName("edit90");

    obj.layout432 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout432:setParent(obj.rectangle1);
    obj.layout432:setLeft(1042);
    obj.layout432:setTop(587);
    obj.layout432:setWidth(16);
    obj.layout432:setHeight(17);
    obj.layout432:setName("layout432");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout432);
    obj.edit91:setTransparent(true);
    obj.edit91:setFontSize(10.5);
    obj.edit91:setFontColor("#000000");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(16);
    obj.edit91:setHeight(18);
    obj.edit91:setField("hbox11");
    obj.edit91:setName("edit91");

    obj.layout433 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout433:setParent(obj.rectangle1);
    obj.layout433:setLeft(1063);
    obj.layout433:setTop(587);
    obj.layout433:setWidth(16);
    obj.layout433:setHeight(17);
    obj.layout433:setName("layout433");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout433);
    obj.edit92:setTransparent(true);
    obj.edit92:setFontSize(10.5);
    obj.edit92:setFontColor("#000000");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(0);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(16);
    obj.edit92:setHeight(18);
    obj.edit92:setField("hbox12");
    obj.edit92:setName("edit92");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'chronicle', 'legacy', 'player'});
    obj.dataLink1:setDefaultValues({'Cidade Cinzenta', '-', 'Narrador'});
    obj.dataLink1:setName("dataLink1");

    function obj:_releaseEvents()
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
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.layout386 ~= nil then self.layout386:destroy(); self.layout386 = nil; end;
        if self.checkBox285 ~= nil then self.checkBox285:destroy(); self.checkBox285 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox304 ~= nil then self.checkBox304:destroy(); self.checkBox304 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout266 ~= nil then self.layout266:destroy(); self.layout266 = nil; end;
        if self.checkBox317 ~= nil then self.checkBox317:destroy(); self.checkBox317 = nil; end;
        if self.layout275 ~= nil then self.layout275:destroy(); self.layout275 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.checkBox180 ~= nil then self.checkBox180:destroy(); self.checkBox180 = nil; end;
        if self.checkBox135 ~= nil then self.checkBox135:destroy(); self.checkBox135 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.checkBox306 ~= nil then self.checkBox306:destroy(); self.checkBox306 = nil; end;
        if self.layout391 ~= nil then self.layout391:destroy(); self.layout391 = nil; end;
        if self.checkBox251 ~= nil then self.checkBox251:destroy(); self.checkBox251 = nil; end;
        if self.layout257 ~= nil then self.layout257:destroy(); self.layout257 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.checkBox177 ~= nil then self.checkBox177:destroy(); self.checkBox177 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.layout290 ~= nil then self.layout290:destroy(); self.layout290 = nil; end;
        if self.layout326 ~= nil then self.layout326:destroy(); self.layout326 = nil; end;
        if self.layout285 ~= nil then self.layout285:destroy(); self.layout285 = nil; end;
        if self.layout247 ~= nil then self.layout247:destroy(); self.layout247 = nil; end;
        if self.checkBox329 ~= nil then self.checkBox329:destroy(); self.checkBox329 = nil; end;
        if self.checkBox167 ~= nil then self.checkBox167:destroy(); self.checkBox167 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout249 ~= nil then self.layout249:destroy(); self.layout249 = nil; end;
        if self.checkBox124 ~= nil then self.checkBox124:destroy(); self.checkBox124 = nil; end;
        if self.layout417 ~= nil then self.layout417:destroy(); self.layout417 = nil; end;
        if self.checkBox204 ~= nil then self.checkBox204:destroy(); self.checkBox204 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout223 ~= nil then self.layout223:destroy(); self.layout223 = nil; end;
        if self.layout236 ~= nil then self.layout236:destroy(); self.layout236 = nil; end;
        if self.layout251 ~= nil then self.layout251:destroy(); self.layout251 = nil; end;
        if self.checkBox197 ~= nil then self.checkBox197:destroy(); self.checkBox197 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.layout365 ~= nil then self.layout365:destroy(); self.layout365 = nil; end;
        if self.checkBox333 ~= nil then self.checkBox333:destroy(); self.checkBox333 = nil; end;
        if self.layout433 ~= nil then self.layout433:destroy(); self.layout433 = nil; end;
        if self.layout407 ~= nil then self.layout407:destroy(); self.layout407 = nil; end;
        if self.checkBox244 ~= nil then self.checkBox244:destroy(); self.checkBox244 = nil; end;
        if self.checkBox175 ~= nil then self.checkBox175:destroy(); self.checkBox175 = nil; end;
        if self.layout411 ~= nil then self.layout411:destroy(); self.layout411 = nil; end;
        if self.checkBox293 ~= nil then self.checkBox293:destroy(); self.checkBox293 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.checkBox202 ~= nil then self.checkBox202:destroy(); self.checkBox202 = nil; end;
        if self.checkBox128 ~= nil then self.checkBox128:destroy(); self.checkBox128 = nil; end;
        if self.checkBox222 ~= nil then self.checkBox222:destroy(); self.checkBox222 = nil; end;
        if self.layout316 ~= nil then self.layout316:destroy(); self.layout316 = nil; end;
        if self.layout312 ~= nil then self.layout312:destroy(); self.layout312 = nil; end;
        if self.checkBox288 ~= nil then self.checkBox288:destroy(); self.checkBox288 = nil; end;
        if self.layout401 ~= nil then self.layout401:destroy(); self.layout401 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.checkBox311 ~= nil then self.checkBox311:destroy(); self.checkBox311 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.checkBox162 ~= nil then self.checkBox162:destroy(); self.checkBox162 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.checkBox115 ~= nil then self.checkBox115:destroy(); self.checkBox115 = nil; end;
        if self.checkBox131 ~= nil then self.checkBox131:destroy(); self.checkBox131 = nil; end;
        if self.checkBox144 ~= nil then self.checkBox144:destroy(); self.checkBox144 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.checkBox195 ~= nil then self.checkBox195:destroy(); self.checkBox195 = nil; end;
        if self.checkBox127 ~= nil then self.checkBox127:destroy(); self.checkBox127 = nil; end;
        if self.checkBox266 ~= nil then self.checkBox266:destroy(); self.checkBox266 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.checkBox254 ~= nil then self.checkBox254:destroy(); self.checkBox254 = nil; end;
        if self.layout413 ~= nil then self.layout413:destroy(); self.layout413 = nil; end;
        if self.checkBox211 ~= nil then self.checkBox211:destroy(); self.checkBox211 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.layout248 ~= nil then self.layout248:destroy(); self.layout248 = nil; end;
        if self.layout341 ~= nil then self.layout341:destroy(); self.layout341 = nil; end;
        if self.layout259 ~= nil then self.layout259:destroy(); self.layout259 = nil; end;
        if self.layout392 ~= nil then self.layout392:destroy(); self.layout392 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.layout362 ~= nil then self.layout362:destroy(); self.layout362 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout325 ~= nil then self.layout325:destroy(); self.layout325 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.checkBox122 ~= nil then self.checkBox122:destroy(); self.checkBox122 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout246 ~= nil then self.layout246:destroy(); self.layout246 = nil; end;
        if self.checkBox176 ~= nil then self.checkBox176:destroy(); self.checkBox176 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.layout229 ~= nil then self.layout229:destroy(); self.layout229 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.checkBox189 ~= nil then self.checkBox189:destroy(); self.checkBox189 = nil; end;
        if self.layout361 ~= nil then self.layout361:destroy(); self.layout361 = nil; end;
        if self.checkBox125 ~= nil then self.checkBox125:destroy(); self.checkBox125 = nil; end;
        if self.checkBox201 ~= nil then self.checkBox201:destroy(); self.checkBox201 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.checkBox307 ~= nil then self.checkBox307:destroy(); self.checkBox307 = nil; end;
        if self.checkBox271 ~= nil then self.checkBox271:destroy(); self.checkBox271 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.checkBox114 ~= nil then self.checkBox114:destroy(); self.checkBox114 = nil; end;
        if self.layout225 ~= nil then self.layout225:destroy(); self.layout225 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.checkBox338 ~= nil then self.checkBox338:destroy(); self.checkBox338 = nil; end;
        if self.layout260 ~= nil then self.layout260:destroy(); self.layout260 = nil; end;
        if self.layout270 ~= nil then self.layout270:destroy(); self.layout270 = nil; end;
        if self.checkBox217 ~= nil then self.checkBox217:destroy(); self.checkBox217 = nil; end;
        if self.checkBox178 ~= nil then self.checkBox178:destroy(); self.checkBox178 = nil; end;
        if self.checkBox272 ~= nil then self.checkBox272:destroy(); self.checkBox272 = nil; end;
        if self.checkBox145 ~= nil then self.checkBox145:destroy(); self.checkBox145 = nil; end;
        if self.layout241 ~= nil then self.layout241:destroy(); self.layout241 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout254 ~= nil then self.layout254:destroy(); self.layout254 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.checkBox233 ~= nil then self.checkBox233:destroy(); self.checkBox233 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.checkBox327 ~= nil then self.checkBox327:destroy(); self.checkBox327 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.layout244 ~= nil then self.layout244:destroy(); self.layout244 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.checkBox223 ~= nil then self.checkBox223:destroy(); self.checkBox223 = nil; end;
        if self.layout279 ~= nil then self.layout279:destroy(); self.layout279 = nil; end;
        if self.layout363 ~= nil then self.layout363:destroy(); self.layout363 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.checkBox247 ~= nil then self.checkBox247:destroy(); self.checkBox247 = nil; end;
        if self.checkBox226 ~= nil then self.checkBox226:destroy(); self.checkBox226 = nil; end;
        if self.layout315 ~= nil then self.layout315:destroy(); self.layout315 = nil; end;
        if self.layout420 ~= nil then self.layout420:destroy(); self.layout420 = nil; end;
        if self.layout382 ~= nil then self.layout382:destroy(); self.layout382 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout296 ~= nil then self.layout296:destroy(); self.layout296 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.layout320 ~= nil then self.layout320:destroy(); self.layout320 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.checkBox268 ~= nil then self.checkBox268:destroy(); self.checkBox268 = nil; end;
        if self.checkBox228 ~= nil then self.checkBox228:destroy(); self.checkBox228 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.checkBox199 ~= nil then self.checkBox199:destroy(); self.checkBox199 = nil; end;
        if self.layout335 ~= nil then self.layout335:destroy(); self.layout335 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.layout370 ~= nil then self.layout370:destroy(); self.layout370 = nil; end;
        if self.checkBox237 ~= nil then self.checkBox237:destroy(); self.checkBox237 = nil; end;
        if self.checkBox300 ~= nil then self.checkBox300:destroy(); self.checkBox300 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout267 ~= nil then self.layout267:destroy(); self.layout267 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.checkBox218 ~= nil then self.checkBox218:destroy(); self.checkBox218 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.checkBox264 ~= nil then self.checkBox264:destroy(); self.checkBox264 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout329 ~= nil then self.layout329:destroy(); self.layout329 = nil; end;
        if self.checkBox312 ~= nil then self.checkBox312:destroy(); self.checkBox312 = nil; end;
        if self.checkBox325 ~= nil then self.checkBox325:destroy(); self.checkBox325 = nil; end;
        if self.checkBox139 ~= nil then self.checkBox139:destroy(); self.checkBox139 = nil; end;
        if self.checkBox153 ~= nil then self.checkBox153:destroy(); self.checkBox153 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.checkBox159 ~= nil then self.checkBox159:destroy(); self.checkBox159 = nil; end;
        if self.checkBox319 ~= nil then self.checkBox319:destroy(); self.checkBox319 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.layout347 ~= nil then self.layout347:destroy(); self.layout347 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout309 ~= nil then self.layout309:destroy(); self.layout309 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.checkBox280 ~= nil then self.checkBox280:destroy(); self.checkBox280 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.checkBox208 ~= nil then self.checkBox208:destroy(); self.checkBox208 = nil; end;
        if self.checkBox157 ~= nil then self.checkBox157:destroy(); self.checkBox157 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout303 ~= nil then self.layout303:destroy(); self.layout303 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.layout302 ~= nil then self.layout302:destroy(); self.layout302 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.checkBox239 ~= nil then self.checkBox239:destroy(); self.checkBox239 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout376 ~= nil then self.layout376:destroy(); self.layout376 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.layout373 ~= nil then self.layout373:destroy(); self.layout373 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.checkBox174 ~= nil then self.checkBox174:destroy(); self.checkBox174 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.checkBox245 ~= nil then self.checkBox245:destroy(); self.checkBox245 = nil; end;
        if self.checkBox191 ~= nil then self.checkBox191:destroy(); self.checkBox191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.checkBox137 ~= nil then self.checkBox137:destroy(); self.checkBox137 = nil; end;
        if self.checkBox183 ~= nil then self.checkBox183:destroy(); self.checkBox183 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout408 ~= nil then self.layout408:destroy(); self.layout408 = nil; end;
        if self.layout263 ~= nil then self.layout263:destroy(); self.layout263 = nil; end;
        if self.checkBox188 ~= nil then self.checkBox188:destroy(); self.checkBox188 = nil; end;
        if self.checkBox240 ~= nil then self.checkBox240:destroy(); self.checkBox240 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout295 ~= nil then self.layout295:destroy(); self.layout295 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.checkBox192 ~= nil then self.checkBox192:destroy(); self.checkBox192 = nil; end;
        if self.layout426 ~= nil then self.layout426:destroy(); self.layout426 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout374 ~= nil then self.layout374:destroy(); self.layout374 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.layout245 ~= nil then self.layout245:destroy(); self.layout245 = nil; end;
        if self.checkBox243 ~= nil then self.checkBox243:destroy(); self.checkBox243 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout333 ~= nil then self.layout333:destroy(); self.layout333 = nil; end;
        if self.layout330 ~= nil then self.layout330:destroy(); self.layout330 = nil; end;
        if self.checkBox259 ~= nil then self.checkBox259:destroy(); self.checkBox259 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.checkBox225 ~= nil then self.checkBox225:destroy(); self.checkBox225 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.checkBox286 ~= nil then self.checkBox286:destroy(); self.checkBox286 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.checkBox120 ~= nil then self.checkBox120:destroy(); self.checkBox120 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.checkBox173 ~= nil then self.checkBox173:destroy(); self.checkBox173 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.checkBox166 ~= nil then self.checkBox166:destroy(); self.checkBox166 = nil; end;
        if self.checkBox227 ~= nil then self.checkBox227:destroy(); self.checkBox227 = nil; end;
        if self.checkBox121 ~= nil then self.checkBox121:destroy(); self.checkBox121 = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout243 ~= nil then self.layout243:destroy(); self.layout243 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.checkBox336 ~= nil then self.checkBox336:destroy(); self.checkBox336 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout339 ~= nil then self.layout339:destroy(); self.layout339 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.layout271 ~= nil then self.layout271:destroy(); self.layout271 = nil; end;
        if self.checkBox151 ~= nil then self.checkBox151:destroy(); self.checkBox151 = nil; end;
        if self.layout366 ~= nil then self.layout366:destroy(); self.layout366 = nil; end;
        if self.layout253 ~= nil then self.layout253:destroy(); self.layout253 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout410 ~= nil then self.layout410:destroy(); self.layout410 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.checkBox126 ~= nil then self.checkBox126:destroy(); self.checkBox126 = nil; end;
        if self.layout292 ~= nil then self.layout292:destroy(); self.layout292 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout306 ~= nil then self.layout306:destroy(); self.layout306 = nil; end;
        if self.layout429 ~= nil then self.layout429:destroy(); self.layout429 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.checkBox316 ~= nil then self.checkBox316:destroy(); self.checkBox316 = nil; end;
        if self.layout234 ~= nil then self.layout234:destroy(); self.layout234 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.checkBox294 ~= nil then self.checkBox294:destroy(); self.checkBox294 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.checkBox273 ~= nil then self.checkBox273:destroy(); self.checkBox273 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.layout412 ~= nil then self.layout412:destroy(); self.layout412 = nil; end;
        if self.layout238 ~= nil then self.layout238:destroy(); self.layout238 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.layout328 ~= nil then self.layout328:destroy(); self.layout328 = nil; end;
        if self.layout348 ~= nil then self.layout348:destroy(); self.layout348 = nil; end;
        if self.layout403 ~= nil then self.layout403:destroy(); self.layout403 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.layout400 ~= nil then self.layout400:destroy(); self.layout400 = nil; end;
        if self.layout337 ~= nil then self.layout337:destroy(); self.layout337 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox187 ~= nil then self.checkBox187:destroy(); self.checkBox187 = nil; end;
        if self.layout282 ~= nil then self.layout282:destroy(); self.layout282 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox118 ~= nil then self.checkBox118:destroy(); self.checkBox118 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout274 ~= nil then self.layout274:destroy(); self.layout274 = nil; end;
        if self.layout375 ~= nil then self.layout375:destroy(); self.layout375 = nil; end;
        if self.checkBox258 ~= nil then self.checkBox258:destroy(); self.checkBox258 = nil; end;
        if self.checkBox322 ~= nil then self.checkBox322:destroy(); self.checkBox322 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout404 ~= nil then self.layout404:destroy(); self.layout404 = nil; end;
        if self.layout308 ~= nil then self.layout308:destroy(); self.layout308 = nil; end;
        if self.layout269 ~= nil then self.layout269:destroy(); self.layout269 = nil; end;
        if self.checkBox297 ~= nil then self.checkBox297:destroy(); self.checkBox297 = nil; end;
        if self.checkBox155 ~= nil then self.checkBox155:destroy(); self.checkBox155 = nil; end;
        if self.checkBox190 ~= nil then self.checkBox190:destroy(); self.checkBox190 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.checkBox200 ~= nil then self.checkBox200:destroy(); self.checkBox200 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.checkBox154 ~= nil then self.checkBox154:destroy(); self.checkBox154 = nil; end;
        if self.layout321 ~= nil then self.layout321:destroy(); self.layout321 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout293 ~= nil then self.layout293:destroy(); self.layout293 = nil; end;
        if self.checkBox334 ~= nil then self.checkBox334:destroy(); self.checkBox334 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout356 ~= nil then self.layout356:destroy(); self.layout356 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.checkBox326 ~= nil then self.checkBox326:destroy(); self.checkBox326 = nil; end;
        if self.layout297 ~= nil then self.layout297:destroy(); self.layout297 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout431 ~= nil then self.layout431:destroy(); self.layout431 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.checkBox241 ~= nil then self.checkBox241:destroy(); self.checkBox241 = nil; end;
        if self.checkBox314 ~= nil then self.checkBox314:destroy(); self.checkBox314 = nil; end;
        if self.checkBox236 ~= nil then self.checkBox236:destroy(); self.checkBox236 = nil; end;
        if self.checkBox165 ~= nil then self.checkBox165:destroy(); self.checkBox165 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.checkBox302 ~= nil then self.checkBox302:destroy(); self.checkBox302 = nil; end;
        if self.checkBox158 ~= nil then self.checkBox158:destroy(); self.checkBox158 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout324 ~= nil then self.layout324:destroy(); self.layout324 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout372 ~= nil then self.layout372:destroy(); self.layout372 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.checkBox298 ~= nil then self.checkBox298:destroy(); self.checkBox298 = nil; end;
        if self.layout319 ~= nil then self.layout319:destroy(); self.layout319 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.checkBox169 ~= nil then self.checkBox169:destroy(); self.checkBox169 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.checkBox232 ~= nil then self.checkBox232:destroy(); self.checkBox232 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox263 ~= nil then self.checkBox263:destroy(); self.checkBox263 = nil; end;
        if self.layout355 ~= nil then self.layout355:destroy(); self.layout355 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.checkBox224 ~= nil then self.checkBox224:destroy(); self.checkBox224 = nil; end;
        if self.checkBox255 ~= nil then self.checkBox255:destroy(); self.checkBox255 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.checkBox219 ~= nil then self.checkBox219:destroy(); self.checkBox219 = nil; end;
        if self.layout358 ~= nil then self.layout358:destroy(); self.layout358 = nil; end;
        if self.checkBox305 ~= nil then self.checkBox305:destroy(); self.checkBox305 = nil; end;
        if self.checkBox341 ~= nil then self.checkBox341:destroy(); self.checkBox341 = nil; end;
        if self.checkBox281 ~= nil then self.checkBox281:destroy(); self.checkBox281 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.checkBox267 ~= nil then self.checkBox267:destroy(); self.checkBox267 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout239 ~= nil then self.layout239:destroy(); self.layout239 = nil; end;
        if self.layout354 ~= nil then self.layout354:destroy(); self.layout354 = nil; end;
        if self.layout397 ~= nil then self.layout397:destroy(); self.layout397 = nil; end;
        if self.layout258 ~= nil then self.layout258:destroy(); self.layout258 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.layout332 ~= nil then self.layout332:destroy(); self.layout332 = nil; end;
        if self.layout381 ~= nil then self.layout381:destroy(); self.layout381 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout353 ~= nil then self.layout353:destroy(); self.layout353 = nil; end;
        if self.checkBox212 ~= nil then self.checkBox212:destroy(); self.checkBox212 = nil; end;
        if self.layout305 ~= nil then self.layout305:destroy(); self.layout305 = nil; end;
        if self.layout416 ~= nil then self.layout416:destroy(); self.layout416 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.layout379 ~= nil then self.layout379:destroy(); self.layout379 = nil; end;
        if self.layout432 ~= nil then self.layout432:destroy(); self.layout432 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.layout394 ~= nil then self.layout394:destroy(); self.layout394 = nil; end;
        if self.checkBox136 ~= nil then self.checkBox136:destroy(); self.checkBox136 = nil; end;
        if self.layout255 ~= nil then self.layout255:destroy(); self.layout255 = nil; end;
        if self.checkBox246 ~= nil then self.checkBox246:destroy(); self.checkBox246 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.checkBox315 ~= nil then self.checkBox315:destroy(); self.checkBox315 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.layout322 ~= nil then self.layout322:destroy(); self.layout322 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.checkBox215 ~= nil then self.checkBox215:destroy(); self.checkBox215 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.layout396 ~= nil then self.layout396:destroy(); self.layout396 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.layout289 ~= nil then self.layout289:destroy(); self.layout289 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.checkBox238 ~= nil then self.checkBox238:destroy(); self.checkBox238 = nil; end;
        if self.checkBox330 ~= nil then self.checkBox330:destroy(); self.checkBox330 = nil; end;
        if self.layout369 ~= nil then self.layout369:destroy(); self.layout369 = nil; end;
        if self.layout283 ~= nil then self.layout283:destroy(); self.layout283 = nil; end;
        if self.checkBox324 ~= nil then self.checkBox324:destroy(); self.checkBox324 = nil; end;
        if self.layout385 ~= nil then self.layout385:destroy(); self.layout385 = nil; end;
        if self.layout276 ~= nil then self.layout276:destroy(); self.layout276 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.checkBox275 ~= nil then self.checkBox275:destroy(); self.checkBox275 = nil; end;
        if self.layout424 ~= nil then self.layout424:destroy(); self.layout424 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.checkBox170 ~= nil then self.checkBox170:destroy(); self.checkBox170 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.checkBox198 ~= nil then self.checkBox198:destroy(); self.checkBox198 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.checkBox214 ~= nil then self.checkBox214:destroy(); self.checkBox214 = nil; end;
        if self.layout311 ~= nil then self.layout311:destroy(); self.layout311 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.checkBox234 ~= nil then self.checkBox234:destroy(); self.checkBox234 = nil; end;
        if self.checkBox132 ~= nil then self.checkBox132:destroy(); self.checkBox132 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.layout345 ~= nil then self.layout345:destroy(); self.layout345 = nil; end;
        if self.layout232 ~= nil then self.layout232:destroy(); self.layout232 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.checkBox119 ~= nil then self.checkBox119:destroy(); self.checkBox119 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.layout252 ~= nil then self.layout252:destroy(); self.layout252 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.layout300 ~= nil then self.layout300:destroy(); self.layout300 = nil; end;
        if self.checkBox203 ~= nil then self.checkBox203:destroy(); self.checkBox203 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.layout307 ~= nil then self.layout307:destroy(); self.layout307 = nil; end;
        if self.layout235 ~= nil then self.layout235:destroy(); self.layout235 = nil; end;
        if self.layout388 ~= nil then self.layout388:destroy(); self.layout388 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.layout406 ~= nil then self.layout406:destroy(); self.layout406 = nil; end;
        if self.checkBox216 ~= nil then self.checkBox216:destroy(); self.checkBox216 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.layout288 ~= nil then self.layout288:destroy(); self.layout288 = nil; end;
        if self.layout317 ~= nil then self.layout317:destroy(); self.layout317 = nil; end;
        if self.checkBox146 ~= nil then self.checkBox146:destroy(); self.checkBox146 = nil; end;
        if self.layout256 ~= nil then self.layout256:destroy(); self.layout256 = nil; end;
        if self.checkBox279 ~= nil then self.checkBox279:destroy(); self.checkBox279 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox210 ~= nil then self.checkBox210:destroy(); self.checkBox210 = nil; end;
        if self.layout273 ~= nil then self.layout273:destroy(); self.layout273 = nil; end;
        if self.checkBox152 ~= nil then self.checkBox152:destroy(); self.checkBox152 = nil; end;
        if self.layout327 ~= nil then self.layout327:destroy(); self.layout327 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.checkBox290 ~= nil then self.checkBox290:destroy(); self.checkBox290 = nil; end;
        if self.checkBox308 ~= nil then self.checkBox308:destroy(); self.checkBox308 = nil; end;
        if self.layout310 ~= nil then self.layout310:destroy(); self.layout310 = nil; end;
        if self.layout277 ~= nil then self.layout277:destroy(); self.layout277 = nil; end;
        if self.checkBox260 ~= nil then self.checkBox260:destroy(); self.checkBox260 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.checkBox296 ~= nil then self.checkBox296:destroy(); self.checkBox296 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout331 ~= nil then self.layout331:destroy(); self.layout331 = nil; end;
        if self.checkBox332 ~= nil then self.checkBox332:destroy(); self.checkBox332 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout278 ~= nil then self.layout278:destroy(); self.layout278 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout261 ~= nil then self.layout261:destroy(); self.layout261 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.checkBox123 ~= nil then self.checkBox123:destroy(); self.checkBox123 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.checkBox313 ~= nil then self.checkBox313:destroy(); self.checkBox313 = nil; end;
        if self.checkBox256 ~= nil then self.checkBox256:destroy(); self.checkBox256 = nil; end;
        if self.checkBox149 ~= nil then self.checkBox149:destroy(); self.checkBox149 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout262 ~= nil then self.layout262:destroy(); self.layout262 = nil; end;
        if self.checkBox193 ~= nil then self.checkBox193:destroy(); self.checkBox193 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout367 ~= nil then self.layout367:destroy(); self.layout367 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout242 ~= nil then self.layout242:destroy(); self.layout242 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.checkBox147 ~= nil then self.checkBox147:destroy(); self.checkBox147 = nil; end;
        if self.checkBox339 ~= nil then self.checkBox339:destroy(); self.checkBox339 = nil; end;
        if self.checkBox231 ~= nil then self.checkBox231:destroy(); self.checkBox231 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.layout228 ~= nil then self.layout228:destroy(); self.layout228 = nil; end;
        if self.layout318 ~= nil then self.layout318:destroy(); self.layout318 = nil; end;
        if self.checkBox337 ~= nil then self.checkBox337:destroy(); self.checkBox337 = nil; end;
        if self.checkBox141 ~= nil then self.checkBox141:destroy(); self.checkBox141 = nil; end;
        if self.checkBox230 ~= nil then self.checkBox230:destroy(); self.checkBox230 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.layout360 ~= nil then self.layout360:destroy(); self.layout360 = nil; end;
        if self.checkBox196 ~= nil then self.checkBox196:destroy(); self.checkBox196 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.layout387 ~= nil then self.layout387:destroy(); self.layout387 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout268 ~= nil then self.layout268:destroy(); self.layout268 = nil; end;
        if self.layout351 ~= nil then self.layout351:destroy(); self.layout351 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.layout415 ~= nil then self.layout415:destroy(); self.layout415 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox249 ~= nil then self.checkBox249:destroy(); self.checkBox249 = nil; end;
        if self.checkBox277 ~= nil then self.checkBox277:destroy(); self.checkBox277 = nil; end;
        if self.checkBox182 ~= nil then self.checkBox182:destroy(); self.checkBox182 = nil; end;
        if self.checkBox303 ~= nil then self.checkBox303:destroy(); self.checkBox303 = nil; end;
        if self.checkBox185 ~= nil then self.checkBox185:destroy(); self.checkBox185 = nil; end;
        if self.checkBox321 ~= nil then self.checkBox321:destroy(); self.checkBox321 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.checkBox229 ~= nil then self.checkBox229:destroy(); self.checkBox229 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.layout364 ~= nil then self.layout364:destroy(); self.layout364 = nil; end;
        if self.checkBox140 ~= nil then self.checkBox140:destroy(); self.checkBox140 = nil; end;
        if self.checkBox156 ~= nil then self.checkBox156:destroy(); self.checkBox156 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout389 ~= nil then self.layout389:destroy(); self.layout389 = nil; end;
        if self.layout230 ~= nil then self.layout230:destroy(); self.layout230 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout226 ~= nil then self.layout226:destroy(); self.layout226 = nil; end;
        if self.checkBox287 ~= nil then self.checkBox287:destroy(); self.checkBox287 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.layout224 ~= nil then self.layout224:destroy(); self.layout224 = nil; end;
        if self.checkBox323 ~= nil then self.checkBox323:destroy(); self.checkBox323 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox163 ~= nil then self.checkBox163:destroy(); self.checkBox163 = nil; end;
        if self.layout272 ~= nil then self.layout272:destroy(); self.layout272 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.checkBox299 ~= nil then self.checkBox299:destroy(); self.checkBox299 = nil; end;
        if self.checkBox164 ~= nil then self.checkBox164:destroy(); self.checkBox164 = nil; end;
        if self.layout414 ~= nil then self.layout414:destroy(); self.layout414 = nil; end;
        if self.checkBox194 ~= nil then self.checkBox194:destroy(); self.checkBox194 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.checkBox220 ~= nil then self.checkBox220:destroy(); self.checkBox220 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.checkBox320 ~= nil then self.checkBox320:destroy(); self.checkBox320 = nil; end;
        if self.checkBox130 ~= nil then self.checkBox130:destroy(); self.checkBox130 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout227 ~= nil then self.layout227:destroy(); self.layout227 = nil; end;
        if self.checkBox150 ~= nil then self.checkBox150:destroy(); self.checkBox150 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.checkBox142 ~= nil then self.checkBox142:destroy(); self.checkBox142 = nil; end;
        if self.layout338 ~= nil then self.layout338:destroy(); self.layout338 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.checkBox179 ~= nil then self.checkBox179:destroy(); self.checkBox179 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.checkBox261 ~= nil then self.checkBox261:destroy(); self.checkBox261 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.layout240 ~= nil then self.layout240:destroy(); self.layout240 = nil; end;
        if self.checkBox235 ~= nil then self.checkBox235:destroy(); self.checkBox235 = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.checkBox276 ~= nil then self.checkBox276:destroy(); self.checkBox276 = nil; end;
        if self.checkBox301 ~= nil then self.checkBox301:destroy(); self.checkBox301 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout323 ~= nil then self.layout323:destroy(); self.layout323 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.checkBox309 ~= nil then self.checkBox309:destroy(); self.checkBox309 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox252 ~= nil then self.checkBox252:destroy(); self.checkBox252 = nil; end;
        if self.layout346 ~= nil then self.layout346:destroy(); self.layout346 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout336 ~= nil then self.layout336:destroy(); self.layout336 = nil; end;
        if self.layout428 ~= nil then self.layout428:destroy(); self.layout428 = nil; end;
        if self.checkBox205 ~= nil then self.checkBox205:destroy(); self.checkBox205 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout250 ~= nil then self.layout250:destroy(); self.layout250 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout393 ~= nil then self.layout393:destroy(); self.layout393 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.layout298 ~= nil then self.layout298:destroy(); self.layout298 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.checkBox186 ~= nil then self.checkBox186:destroy(); self.checkBox186 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.checkBox265 ~= nil then self.checkBox265:destroy(); self.checkBox265 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.checkBox113 ~= nil then self.checkBox113:destroy(); self.checkBox113 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.layout299 ~= nil then self.layout299:destroy(); self.layout299 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.layout343 ~= nil then self.layout343:destroy(); self.layout343 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.layout357 ~= nil then self.layout357:destroy(); self.layout357 = nil; end;
        if self.checkBox250 ~= nil then self.checkBox250:destroy(); self.checkBox250 = nil; end;
        if self.layout314 ~= nil then self.layout314:destroy(); self.layout314 = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.layout419 ~= nil then self.layout419:destroy(); self.layout419 = nil; end;
        if self.layout334 ~= nil then self.layout334:destroy(); self.layout334 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout418 ~= nil then self.layout418:destroy(); self.layout418 = nil; end;
        if self.layout352 ~= nil then self.layout352:destroy(); self.layout352 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.layout359 ~= nil then self.layout359:destroy(); self.layout359 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.checkBox295 ~= nil then self.checkBox295:destroy(); self.checkBox295 = nil; end;
        if self.checkBox318 ~= nil then self.checkBox318:destroy(); self.checkBox318 = nil; end;
        if self.layout423 ~= nil then self.layout423:destroy(); self.layout423 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.layout405 ~= nil then self.layout405:destroy(); self.layout405 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout313 ~= nil then self.layout313:destroy(); self.layout313 = nil; end;
        if self.layout280 ~= nil then self.layout280:destroy(); self.layout280 = nil; end;
        if self.checkBox248 ~= nil then self.checkBox248:destroy(); self.checkBox248 = nil; end;
        if self.layout398 ~= nil then self.layout398:destroy(); self.layout398 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.layout409 ~= nil then self.layout409:destroy(); self.layout409 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.checkBox282 ~= nil then self.checkBox282:destroy(); self.checkBox282 = nil; end;
        if self.checkBox171 ~= nil then self.checkBox171:destroy(); self.checkBox171 = nil; end;
        if self.checkBox117 ~= nil then self.checkBox117:destroy(); self.checkBox117 = nil; end;
        if self.layout427 ~= nil then self.layout427:destroy(); self.layout427 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout430 ~= nil then self.layout430:destroy(); self.layout430 = nil; end;
        if self.checkBox134 ~= nil then self.checkBox134:destroy(); self.checkBox134 = nil; end;
        if self.layout344 ~= nil then self.layout344:destroy(); self.layout344 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.checkBox328 ~= nil then self.checkBox328:destroy(); self.checkBox328 = nil; end;
        if self.layout368 ~= nil then self.layout368:destroy(); self.layout368 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout425 ~= nil then self.layout425:destroy(); self.layout425 = nil; end;
        if self.checkBox242 ~= nil then self.checkBox242:destroy(); self.checkBox242 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.checkBox291 ~= nil then self.checkBox291:destroy(); self.checkBox291 = nil; end;
        if self.checkBox148 ~= nil then self.checkBox148:destroy(); self.checkBox148 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout380 ~= nil then self.layout380:destroy(); self.layout380 = nil; end;
        if self.layout377 ~= nil then self.layout377:destroy(); self.layout377 = nil; end;
        if self.checkBox274 ~= nil then self.checkBox274:destroy(); self.checkBox274 = nil; end;
        if self.layout291 ~= nil then self.layout291:destroy(); self.layout291 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout294 ~= nil then self.layout294:destroy(); self.layout294 = nil; end;
        if self.layout233 ~= nil then self.layout233:destroy(); self.layout233 = nil; end;
        if self.checkBox270 ~= nil then self.checkBox270:destroy(); self.checkBox270 = nil; end;
        if self.layout383 ~= nil then self.layout383:destroy(); self.layout383 = nil; end;
        if self.checkBox168 ~= nil then self.checkBox168:destroy(); self.checkBox168 = nil; end;
        if self.layout390 ~= nil then self.layout390:destroy(); self.layout390 = nil; end;
        if self.checkBox340 ~= nil then self.checkBox340:destroy(); self.checkBox340 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.checkBox172 ~= nil then self.checkBox172:destroy(); self.checkBox172 = nil; end;
        if self.layout395 ~= nil then self.layout395:destroy(); self.layout395 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.checkBox112 ~= nil then self.checkBox112:destroy(); self.checkBox112 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout402 ~= nil then self.layout402:destroy(); self.layout402 = nil; end;
        if self.layout264 ~= nil then self.layout264:destroy(); self.layout264 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.checkBox213 ~= nil then self.checkBox213:destroy(); self.checkBox213 = nil; end;
        if self.layout231 ~= nil then self.layout231:destroy(); self.layout231 = nil; end;
        if self.checkBox331 ~= nil then self.checkBox331:destroy(); self.checkBox331 = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.checkBox116 ~= nil then self.checkBox116:destroy(); self.checkBox116 = nil; end;
        if self.checkBox289 ~= nil then self.checkBox289:destroy(); self.checkBox289 = nil; end;
        if self.layout350 ~= nil then self.layout350:destroy(); self.layout350 = nil; end;
        if self.layout342 ~= nil then self.layout342:destroy(); self.layout342 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout384 ~= nil then self.layout384:destroy(); self.layout384 = nil; end;
        if self.checkBox160 ~= nil then self.checkBox160:destroy(); self.checkBox160 = nil; end;
        if self.checkBox181 ~= nil then self.checkBox181:destroy(); self.checkBox181 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.layout281 ~= nil then self.layout281:destroy(); self.layout281 = nil; end;
        if self.checkBox209 ~= nil then self.checkBox209:destroy(); self.checkBox209 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.checkBox221 ~= nil then self.checkBox221:destroy(); self.checkBox221 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.checkBox143 ~= nil then self.checkBox143:destroy(); self.checkBox143 = nil; end;
        if self.checkBox284 ~= nil then self.checkBox284:destroy(); self.checkBox284 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.checkBox262 ~= nil then self.checkBox262:destroy(); self.checkBox262 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout399 ~= nil then self.layout399:destroy(); self.layout399 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.layout286 ~= nil then self.layout286:destroy(); self.layout286 = nil; end;
        if self.checkBox253 ~= nil then self.checkBox253:destroy(); self.checkBox253 = nil; end;
        if self.layout349 ~= nil then self.layout349:destroy(); self.layout349 = nil; end;
        if self.checkBox269 ~= nil then self.checkBox269:destroy(); self.checkBox269 = nil; end;
        if self.layout371 ~= nil then self.layout371:destroy(); self.layout371 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.layout265 ~= nil then self.layout265:destroy(); self.layout265 = nil; end;
        if self.checkBox335 ~= nil then self.checkBox335:destroy(); self.checkBox335 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.checkBox310 ~= nil then self.checkBox310:destroy(); self.checkBox310 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.checkBox161 ~= nil then self.checkBox161:destroy(); self.checkBox161 = nil; end;
        if self.layout421 ~= nil then self.layout421:destroy(); self.layout421 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox138 ~= nil then self.checkBox138:destroy(); self.checkBox138 = nil; end;
        if self.checkBox129 ~= nil then self.checkBox129:destroy(); self.checkBox129 = nil; end;
        if self.checkBox278 ~= nil then self.checkBox278:destroy(); self.checkBox278 = nil; end;
        if self.checkBox184 ~= nil then self.checkBox184:destroy(); self.checkBox184 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.layout287 ~= nil then self.layout287:destroy(); self.layout287 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox133 ~= nil then self.checkBox133:destroy(); self.checkBox133 = nil; end;
        if self.checkBox257 ~= nil then self.checkBox257:destroy(); self.checkBox257 = nil; end;
        if self.checkBox292 ~= nil then self.checkBox292:destroy(); self.checkBox292 = nil; end;
        if self.layout422 ~= nil then self.layout422:destroy(); self.layout422 = nil; end;
        if self.checkBox283 ~= nil then self.checkBox283:destroy(); self.checkBox283 = nil; end;
        if self.layout378 ~= nil then self.layout378:destroy(); self.layout378 = nil; end;
        if self.layout284 ~= nil then self.layout284:destroy(); self.layout284 = nil; end;
        if self.checkBox207 ~= nil then self.checkBox207:destroy(); self.checkBox207 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.checkBox206 ~= nil then self.checkBox206:destroy(); self.checkBox206 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout237 ~= nil then self.layout237:destroy(); self.layout237 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout340 ~= nil then self.layout340:destroy(); self.layout340 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.layout301 ~= nil then self.layout301:destroy(); self.layout301 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha_de_Mago1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha_de_Mago1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha_de_Mago1_svg = {
    newEditor = newfrmFicha_de_Mago1_svg, 
    new = newfrmFicha_de_Mago1_svg, 
    name = "frmFicha_de_Mago1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha_de_Mago1_svg = _frmFicha_de_Mago1_svg;
Firecast.registrarForm(_frmFicha_de_Mago1_svg);

return _frmFicha_de_Mago1_svg;
