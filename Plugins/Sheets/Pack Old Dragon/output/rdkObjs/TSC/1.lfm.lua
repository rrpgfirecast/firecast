require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTSC1_svg()
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
    obj:setName("frmTSC1_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1049);
    obj.rectangle1:setHeight(1488);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1049);
    obj.image1:setHeight(1488);
    obj.image1:setSRC("/TSC/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(77);
    obj.layout1:setTop(88);
    obj.layout1:setWidth(544);
    obj.layout1:setHeight(74);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(20);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(544);
    obj.edit1:setHeight(75);
    obj.edit1:setField("untitled1");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(75);
    obj.layout2:setTop(182);
    obj.layout2:setWidth(305);
    obj.layout2:setHeight(41);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(20);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(305);
    obj.edit2:setHeight(42);
    obj.edit2:setField("untitled2");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(401);
    obj.layout3:setTop(180);
    obj.layout3:setWidth(78);
    obj.layout3:setHeight(43);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(20);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(78);
    obj.edit3:setHeight(44);
    obj.edit3:setField("untitled3");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(502);
    obj.layout4:setTop(180);
    obj.layout4:setWidth(125);
    obj.layout4:setHeight(43);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(20);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(125);
    obj.edit4:setHeight(44);
    obj.edit4:setField("untitled4");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(75);
    obj.layout5:setTop(247);
    obj.layout5:setWidth(132);
    obj.layout5:setHeight(34);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(20);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(132);
    obj.edit5:setHeight(35);
    obj.edit5:setField("untitled5");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(233);
    obj.layout6:setTop(245);
    obj.layout6:setWidth(168);
    obj.layout6:setHeight(38);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(20);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(168);
    obj.edit6:setHeight(39);
    obj.edit6:setField("untitled6");
    obj.edit6:setName("edit6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(424);
    obj.layout7:setTop(239);
    obj.layout7:setWidth(550);
    obj.layout7:setHeight(43);
    obj.layout7:setName("layout7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(20);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(550);
    obj.edit7:setHeight(44);
    obj.edit7:setField("untitled7");
    obj.edit7:setName("edit7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(181);
    obj.layout8:setTop(324);
    obj.layout8:setWidth(87);
    obj.layout8:setHeight(67);
    obj.layout8:setName("layout8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(30);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(87);
    obj.edit8:setHeight(68);
    obj.edit8:setField("for");
    obj.edit8:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");
    obj.edit8:setName("edit8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(183);
    obj.layout9:setTop(403);
    obj.layout9:setWidth(83);
    obj.layout9:setHeight(63);
    obj.layout9:setName("layout9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(30);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(83);
    obj.edit9:setHeight(64);
    obj.edit9:setField("des");
    obj.edit9:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");
    obj.edit9:setName("edit9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(185);
    obj.layout10:setTop(477);
    obj.layout10:setWidth(82);
    obj.layout10:setHeight(63);
    obj.layout10:setName("layout10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(30);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(82);
    obj.edit10:setHeight(64);
    obj.edit10:setField("const");
    obj.edit10:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");
    obj.edit10:setName("edit10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(183);
    obj.layout11:setTop(551);
    obj.layout11:setWidth(83);
    obj.layout11:setHeight(68);
    obj.layout11:setName("layout11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(30);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(83);
    obj.edit11:setHeight(69);
    obj.edit11:setField("int");
    obj.edit11:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setName("edit11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(183);
    obj.layout12:setTop(630);
    obj.layout12:setWidth(85);
    obj.layout12:setHeight(59);
    obj.layout12:setName("layout12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(30);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(85);
    obj.edit12:setHeight(60);
    obj.edit12:setField("sab");
    obj.edit12:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");
    obj.edit12:setName("edit12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(183);
    obj.layout13:setTop(704);
    obj.layout13:setWidth(83);
    obj.layout13:setHeight(61);
    obj.layout13:setName("layout13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(30);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(83);
    obj.edit13:setHeight(62);
    obj.edit13:setField("car");
    obj.edit13:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setName("edit13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(386);
    obj.layout14:setTop(325);
    obj.layout14:setWidth(96);
    obj.layout14:setHeight(88);
    obj.layout14:setName("layout14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(40);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(96);
    obj.edit14:setHeight(89);
    obj.edit14:setField("ca");
    obj.edit14:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");
    obj.edit14:setName("edit14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(496);
    obj.layout15:setTop(347);
    obj.layout15:setWidth(44);
    obj.layout15:setHeight(45);
    obj.layout15:setName("layout15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(20);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(44);
    obj.edit15:setHeight(46);
    obj.edit15:setField("desca");
    obj.edit15:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setName("edit15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(566);
    obj.layout16:setTop(346);
    obj.layout16:setWidth(40);
    obj.layout16:setHeight(43);
    obj.layout16:setName("layout16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout16);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(20);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(40);
    obj.edit16:setHeight(44);
    obj.edit16:setField("caou1");
    obj.edit16:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");
    obj.edit16:setName("edit16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(635);
    obj.layout17:setTop(346);
    obj.layout17:setWidth(42);
    obj.layout17:setHeight(45);
    obj.layout17:setName("layout17");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout17);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(20);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(42);
    obj.edit17:setHeight(46);
    obj.edit17:setField("caou2");
    obj.edit17:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");
    obj.edit17:setName("edit17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(838);
    obj.layout18:setTop(326);
    obj.layout18:setWidth(112);
    obj.layout18:setHeight(144);
    obj.layout18:setName("layout18");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout18);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(40);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit18, "fontStyle",  "bold");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(112);
    obj.edit18:setHeight(145);
    obj.edit18:setField("PVs");
    obj.edit18:setName("edit18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(818);
    obj.layout19:setTop(475);
    obj.layout19:setWidth(119);
    obj.layout19:setHeight(67);
    obj.layout19:setName("layout19");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout19);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(25);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(119);
    obj.edit19:setHeight(68);
    obj.edit19:setField("DVs");
    obj.edit19:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setName("edit19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(815);
    obj.layout20:setTop(551);
    obj.layout20:setWidth(112);
    obj.layout20:setHeight(103);
    obj.layout20:setName("layout20");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout20);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(40);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(112);
    obj.edit20:setHeight(104);
    obj.edit20:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit20, "fontStyle",  "bold");
    obj.edit20:setField("dano");
    obj.edit20:setName("edit20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(390);
    obj.layout21:setTop(515);
    obj.layout21:setWidth(80);
    obj.layout21:setHeight(67);
    obj.layout21:setName("layout21");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout21);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(40);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(80);
    obj.edit21:setHeight(68);
    obj.edit21:setField("jp");
    obj.edit21:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit21, "fontStyle",  "bold");
    obj.edit21:setName("edit21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(494);
    obj.layout22:setTop(517);
    obj.layout22:setWidth(46);
    obj.layout22:setHeight(49);
    obj.layout22:setName("layout22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout22);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(20);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(46);
    obj.edit22:setHeight(50);
    obj.edit22:setField("jpdes");
    obj.edit22:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setName("edit22");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(565);
    obj.layout23:setTop(517);
    obj.layout23:setWidth(44);
    obj.layout23:setHeight(47);
    obj.layout23:setName("layout23");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout23);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(20);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(44);
    obj.edit23:setHeight(48);
    obj.edit23:setField("jpcon");
    obj.edit23:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit23, "fontStyle",  "bold");
    obj.edit23:setName("edit23");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(633);
    obj.layout24:setTop(518);
    obj.layout24:setWidth(40);
    obj.layout24:setHeight(45);
    obj.layout24:setName("layout24");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout24);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(20);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(40);
    obj.edit24:setHeight(46);
    obj.edit24:setField("jpsab");
    obj.edit24:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit24, "fontStyle",  "bold");
    obj.edit24:setName("edit24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(455);
    obj.layout25:setTop(601);
    obj.layout25:setWidth(226);
    obj.layout25:setHeight(67);
    obj.layout25:setName("layout25");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout25);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(30);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(226);
    obj.edit25:setHeight(68);
    obj.edit25:setField("mov");
    obj.edit25:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit25, "fontStyle",  "bold");
    obj.edit25:setName("edit25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(399);
    obj.layout26:setTop(688);
    obj.layout26:setWidth(128);
    obj.layout26:setHeight(67);
    obj.layout26:setName("layout26");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout26);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(30);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(128);
    obj.edit26:setHeight(68);
    obj.edit26:setField("babase");
    obj.edit26:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit26, "fontStyle",  "bold");
    obj.edit26:setName("edit26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(552);
    obj.layout27:setTop(695);
    obj.layout27:setWidth(46);
    obj.layout27:setHeight(49);
    obj.layout27:setName("layout27");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout27);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(20);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(46);
    obj.edit27:setHeight(50);
    obj.edit27:setField("bafor");
    obj.edit27:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit27, "fontStyle",  "bold");
    obj.edit27:setName("edit27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(620);
    obj.layout28:setTop(688);
    obj.layout28:setWidth(130);
    obj.layout28:setHeight(67);
    obj.layout28:setName("layout28");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout28);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(30);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(130);
    obj.edit28:setHeight(68);
    obj.edit28:setField("bacac");
    obj.edit28:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit28, "fontStyle",  "bold");
    obj.edit28:setName("edit28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(772);
    obj.layout29:setTop(697);
    obj.layout29:setWidth(49);
    obj.layout29:setHeight(47);
    obj.layout29:setName("layout29");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout29);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(20);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(49);
    obj.edit29:setHeight(48);
    obj.edit29:setField("bades");
    obj.edit29:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit29, "fontStyle",  "bold");
    obj.edit29:setName("edit29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(835);
    obj.layout30:setTop(688);
    obj.layout30:setWidth(134);
    obj.layout30:setHeight(63);
    obj.layout30:setName("layout30");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout30);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(30);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(134);
    obj.edit30:setHeight(64);
    obj.edit30:setField("badis");
    obj.edit30:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit30, "fontStyle",  "bold");
    obj.edit30:setName("edit30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(77);
    obj.layout31:setTop(842);
    obj.layout31:setWidth(326);
    obj.layout31:setHeight(36);
    obj.layout31:setName("layout31");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout31);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(20);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(326);
    obj.edit31:setHeight(37);
    obj.edit31:setField("untitled31");
    obj.edit31:setName("edit31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(77);
    obj.layout32:setTop(880);
    obj.layout32:setWidth(326);
    obj.layout32:setHeight(34);
    obj.layout32:setName("layout32");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout32);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(20);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(326);
    obj.edit32:setHeight(35);
    obj.edit32:setField("untitled32");
    obj.edit32:setName("edit32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(80);
    obj.layout33:setTop(914);
    obj.layout33:setWidth(323);
    obj.layout33:setHeight(34);
    obj.layout33:setName("layout33");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout33);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(20);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(323);
    obj.edit33:setHeight(35);
    obj.edit33:setField("untitled33");
    obj.edit33:setName("edit33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(80);
    obj.layout34:setTop(950);
    obj.layout34:setWidth(326);
    obj.layout34:setHeight(34);
    obj.layout34:setName("layout34");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout34);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(20);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(326);
    obj.edit34:setHeight(35);
    obj.edit34:setField("untitled34");
    obj.edit34:setName("edit34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(79);
    obj.layout35:setTop(988);
    obj.layout35:setWidth(330);
    obj.layout35:setHeight(32);
    obj.layout35:setName("layout35");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout35);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(20);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(330);
    obj.edit35:setHeight(33);
    obj.edit35:setField("untitled35");
    obj.edit35:setName("edit35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(430);
    obj.layout36:setTop(841);
    obj.layout36:setWidth(69);
    obj.layout36:setHeight(40);
    obj.layout36:setName("layout36");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout36);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(20);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(69);
    obj.edit36:setHeight(41);
    obj.edit36:setField("untitled36");
    obj.edit36:setName("edit36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(430);
    obj.layout37:setTop(880);
    obj.layout37:setWidth(67);
    obj.layout37:setHeight(34);
    obj.layout37:setName("layout37");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout37);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(20);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(67);
    obj.edit37:setHeight(35);
    obj.edit37:setField("untitled37");
    obj.edit37:setName("edit37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(431);
    obj.layout38:setTop(914);
    obj.layout38:setWidth(65);
    obj.layout38:setHeight(36);
    obj.layout38:setName("layout38");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout38);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(20);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(65);
    obj.edit38:setHeight(37);
    obj.edit38:setField("untitled38");
    obj.edit38:setName("edit38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(430);
    obj.layout39:setTop(950);
    obj.layout39:setWidth(69);
    obj.layout39:setHeight(34);
    obj.layout39:setName("layout39");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout39);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(20);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(69);
    obj.edit39:setHeight(35);
    obj.edit39:setField("untitled39");
    obj.edit39:setName("edit39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(433);
    obj.layout40:setTop(990);
    obj.layout40:setWidth(65);
    obj.layout40:setHeight(29);
    obj.layout40:setName("layout40");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout40);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(19.5);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(65);
    obj.edit40:setHeight(30);
    obj.edit40:setField("untitled40");
    obj.edit40:setName("edit40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(516);
    obj.layout41:setTop(842);
    obj.layout41:setWidth(127);
    obj.layout41:setHeight(36);
    obj.layout41:setName("layout41");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout41);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(20);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(127);
    obj.edit41:setHeight(37);
    obj.edit41:setField("untitled41");
    obj.edit41:setName("edit41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(516);
    obj.layout42:setTop(880);
    obj.layout42:setWidth(128);
    obj.layout42:setHeight(34);
    obj.layout42:setName("layout42");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout42);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(20);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(128);
    obj.edit42:setHeight(35);
    obj.edit42:setField("untitled42");
    obj.edit42:setName("edit42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(516);
    obj.layout43:setTop(914);
    obj.layout43:setWidth(128);
    obj.layout43:setHeight(34);
    obj.layout43:setName("layout43");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout43);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(20);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(128);
    obj.edit43:setHeight(35);
    obj.edit43:setField("untitled43");
    obj.edit43:setName("edit43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(518);
    obj.layout44:setTop(950);
    obj.layout44:setWidth(127);
    obj.layout44:setHeight(36);
    obj.layout44:setName("layout44");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout44);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(20);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(127);
    obj.edit44:setHeight(37);
    obj.edit44:setField("untitled44");
    obj.edit44:setName("edit44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(518);
    obj.layout45:setTop(985);
    obj.layout45:setWidth(123);
    obj.layout45:setHeight(36);
    obj.layout45:setName("layout45");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout45);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(20);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(123);
    obj.edit45:setHeight(37);
    obj.edit45:setField("untitled45");
    obj.edit45:setName("edit45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(671);
    obj.layout46:setTop(846);
    obj.layout46:setWidth(82);
    obj.layout46:setHeight(32);
    obj.layout46:setName("layout46");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout46);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(20);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(82);
    obj.edit46:setHeight(33);
    obj.edit46:setField("untitled46");
    obj.edit46:setName("edit46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(671);
    obj.layout47:setTop(880);
    obj.layout47:setWidth(80);
    obj.layout47:setHeight(32);
    obj.layout47:setName("layout47");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout47);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(20);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(80);
    obj.edit47:setHeight(33);
    obj.edit47:setField("untitled47");
    obj.edit47:setName("edit47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(671);
    obj.layout48:setTop(913);
    obj.layout48:setWidth(80);
    obj.layout48:setHeight(38);
    obj.layout48:setName("layout48");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout48);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(20);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(80);
    obj.edit48:setHeight(39);
    obj.edit48:setField("untitled48");
    obj.edit48:setName("edit48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(669);
    obj.layout49:setTop(950);
    obj.layout49:setWidth(82);
    obj.layout49:setHeight(36);
    obj.layout49:setName("layout49");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout49);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(20);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(82);
    obj.edit49:setHeight(37);
    obj.edit49:setField("untitled49");
    obj.edit49:setName("edit49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(669);
    obj.layout50:setTop(986);
    obj.layout50:setWidth(82);
    obj.layout50:setHeight(36);
    obj.layout50:setName("layout50");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout50);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(20);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(82);
    obj.edit50:setHeight(37);
    obj.edit50:setField("untitled50");
    obj.edit50:setName("edit50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(772);
    obj.layout51:setTop(842);
    obj.layout51:setWidth(125);
    obj.layout51:setHeight(36);
    obj.layout51:setName("layout51");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout51);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(20);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(125);
    obj.edit51:setHeight(37);
    obj.edit51:setField("untitled51");
    obj.edit51:setName("edit51");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(773);
    obj.layout52:setTop(880);
    obj.layout52:setWidth(125);
    obj.layout52:setHeight(36);
    obj.layout52:setName("layout52");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout52);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(20);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(125);
    obj.edit52:setHeight(37);
    obj.edit52:setField("untitled52");
    obj.edit52:setName("edit52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(772);
    obj.layout53:setTop(916);
    obj.layout53:setWidth(128);
    obj.layout53:setHeight(38);
    obj.layout53:setName("layout53");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout53);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(20);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(128);
    obj.edit53:setHeight(39);
    obj.edit53:setField("untitled53");
    obj.edit53:setName("edit53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(773);
    obj.layout54:setTop(950);
    obj.layout54:setWidth(125);
    obj.layout54:setHeight(38);
    obj.layout54:setName("layout54");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout54);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(20);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(125);
    obj.edit54:setHeight(39);
    obj.edit54:setField("untitled54");
    obj.edit54:setName("edit54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(772);
    obj.layout55:setTop(985);
    obj.layout55:setWidth(128);
    obj.layout55:setHeight(38);
    obj.layout55:setName("layout55");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout55);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(20);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(128);
    obj.edit55:setHeight(39);
    obj.edit55:setField("untitled55");
    obj.edit55:setName("edit55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(921);
    obj.layout56:setTop(846);
    obj.layout56:setWidth(49);
    obj.layout56:setHeight(32);
    obj.layout56:setName("layout56");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout56);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(20);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(49);
    obj.edit56:setHeight(33);
    obj.edit56:setField("untitled56");
    obj.edit56:setName("edit56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(923);
    obj.layout57:setTop(880);
    obj.layout57:setWidth(53);
    obj.layout57:setHeight(34);
    obj.layout57:setName("layout57");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout57);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(20);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(53);
    obj.edit57:setHeight(35);
    obj.edit57:setField("untitled57");
    obj.edit57:setName("edit57");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(923);
    obj.layout58:setTop(914);
    obj.layout58:setWidth(51);
    obj.layout58:setHeight(38);
    obj.layout58:setName("layout58");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout58);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(20);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(51);
    obj.edit58:setHeight(39);
    obj.edit58:setField("untitled58");
    obj.edit58:setName("edit58");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(923);
    obj.layout59:setTop(950);
    obj.layout59:setWidth(51);
    obj.layout59:setHeight(34);
    obj.layout59:setName("layout59");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout59);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(20);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(51);
    obj.edit59:setHeight(35);
    obj.edit59:setField("untitled59");
    obj.edit59:setName("edit59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(923);
    obj.layout60:setTop(988);
    obj.layout60:setWidth(49);
    obj.layout60:setHeight(34);
    obj.layout60:setName("layout60");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout60);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(20);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(49);
    obj.edit60:setHeight(35);
    obj.edit60:setField("untitled60");
    obj.edit60:setName("edit60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(84);
    obj.layout61:setTop(1109);
    obj.layout61:setWidth(301);
    obj.layout61:setHeight(31);
    obj.layout61:setName("layout61");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout61);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(20);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(301);
    obj.edit61:setHeight(32);
    obj.edit61:setField("untitled61");
    obj.edit61:setName("edit61");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(412);
    obj.layout62:setTop(1107);
    obj.layout62:setWidth(298);
    obj.layout62:setHeight(32);
    obj.layout62:setName("layout62");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout62);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(20);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(298);
    obj.edit62:setHeight(33);
    obj.edit62:setField("untitled62");
    obj.edit62:setName("edit62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(84);
    obj.layout63:setTop(1141);
    obj.layout63:setWidth(303);
    obj.layout63:setHeight(32);
    obj.layout63:setName("layout63");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout63);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(20);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(303);
    obj.edit63:setHeight(33);
    obj.edit63:setField("untitled63");
    obj.edit63:setName("edit63");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(413);
    obj.layout64:setTop(1141);
    obj.layout64:setWidth(296);
    obj.layout64:setHeight(32);
    obj.layout64:setName("layout64");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout64);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(20);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(296);
    obj.edit64:setHeight(33);
    obj.edit64:setField("untitled64");
    obj.edit64:setName("edit64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(86);
    obj.layout65:setTop(1174);
    obj.layout65:setWidth(301);
    obj.layout65:setHeight(36);
    obj.layout65:setName("layout65");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout65);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(20);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(301);
    obj.edit65:setHeight(37);
    obj.edit65:setField("untitled65");
    obj.edit65:setName("edit65");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(413);
    obj.layout66:setTop(1174);
    obj.layout66:setWidth(299);
    obj.layout66:setHeight(32);
    obj.layout66:setName("layout66");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout66);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(20);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(299);
    obj.edit66:setHeight(33);
    obj.edit66:setField("untitled66");
    obj.edit66:setName("edit66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(82);
    obj.layout67:setTop(1208);
    obj.layout67:setWidth(305);
    obj.layout67:setHeight(34);
    obj.layout67:setName("layout67");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout67);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(20);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(305);
    obj.edit67:setHeight(35);
    obj.edit67:setField("untitled67");
    obj.edit67:setName("edit67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(413);
    obj.layout68:setTop(1208);
    obj.layout68:setWidth(298);
    obj.layout68:setHeight(34);
    obj.layout68:setName("layout68");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout68);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(20);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(298);
    obj.edit68:setHeight(35);
    obj.edit68:setField("untitled68");
    obj.edit68:setName("edit68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(82);
    obj.layout69:setTop(1242);
    obj.layout69:setWidth(303);
    obj.layout69:setHeight(34);
    obj.layout69:setName("layout69");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout69);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(20);
    obj.edit69:setFontColor("#000000");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(303);
    obj.edit69:setHeight(35);
    obj.edit69:setField("untitled69");
    obj.edit69:setName("edit69");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(413);
    obj.layout70:setTop(1242);
    obj.layout70:setWidth(298);
    obj.layout70:setHeight(34);
    obj.layout70:setName("layout70");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout70);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(20);
    obj.edit70:setFontColor("#000000");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(298);
    obj.edit70:setHeight(35);
    obj.edit70:setField("untitled70");
    obj.edit70:setName("edit70");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(82);
    obj.layout71:setTop(1276);
    obj.layout71:setWidth(301);
    obj.layout71:setHeight(32);
    obj.layout71:setName("layout71");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout71);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(20);
    obj.edit71:setFontColor("#000000");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(301);
    obj.edit71:setHeight(33);
    obj.edit71:setField("untitled71");
    obj.edit71:setName("edit71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(412);
    obj.layout72:setTop(1273);
    obj.layout72:setWidth(303);
    obj.layout72:setHeight(36);
    obj.layout72:setName("layout72");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout72);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(20);
    obj.edit72:setFontColor("#000000");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(303);
    obj.edit72:setHeight(37);
    obj.edit72:setField("untitled72");
    obj.edit72:setName("edit72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(82);
    obj.layout73:setTop(1307);
    obj.layout73:setWidth(301);
    obj.layout73:setHeight(36);
    obj.layout73:setName("layout73");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout73);
    obj.edit73:setTransparent(true);
    obj.edit73:setFontSize(20);
    obj.edit73:setFontColor("#000000");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(301);
    obj.edit73:setHeight(37);
    obj.edit73:setField("untitled73");
    obj.edit73:setName("edit73");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(412);
    obj.layout74:setTop(1309);
    obj.layout74:setWidth(301);
    obj.layout74:setHeight(34);
    obj.layout74:setName("layout74");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout74);
    obj.edit74:setTransparent(true);
    obj.edit74:setFontSize(20);
    obj.edit74:setFontColor("#000000");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(301);
    obj.edit74:setHeight(35);
    obj.edit74:setField("untitled74");
    obj.edit74:setName("edit74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(412);
    obj.layout75:setTop(1343);
    obj.layout75:setWidth(301);
    obj.layout75:setHeight(34);
    obj.layout75:setName("layout75");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout75);
    obj.edit75:setTransparent(true);
    obj.edit75:setFontSize(20);
    obj.edit75:setFontColor("#000000");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(0);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(301);
    obj.edit75:setHeight(35);
    obj.edit75:setField("untitled75");
    obj.edit75:setName("edit75");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(82);
    obj.layout76:setTop(1341);
    obj.layout76:setWidth(301);
    obj.layout76:setHeight(34);
    obj.layout76:setName("layout76");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout76);
    obj.edit76:setTransparent(true);
    obj.edit76:setFontSize(20);
    obj.edit76:setFontColor("#000000");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(301);
    obj.edit76:setHeight(35);
    obj.edit76:setField("untitled76");
    obj.edit76:setName("edit76");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(804);
    obj.layout77:setTop(1274);
    obj.layout77:setWidth(164);
    obj.layout77:setHeight(47);
    obj.layout77:setName("layout77");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout77);
    obj.edit77:setTransparent(true);
    obj.edit77:setFontSize(20);
    obj.edit77:setFontColor("#000000");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(164);
    obj.edit77:setHeight(48);
    obj.edit77:setField("xpatual");
    obj.edit77:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit77, "fontStyle",  "bold");
    obj.edit77:setName("edit77");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(808);
    obj.layout78:setTop(1339);
    obj.layout78:setWidth(161);
    obj.layout78:setHeight(47);
    obj.layout78:setName("layout78");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout78);
    obj.edit78:setTransparent(true);
    obj.edit78:setFontSize(20);
    obj.edit78:setFontColor("#000000");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(161);
    obj.edit78:setHeight(48);
    obj.edit78:setField("xplvlup");
    obj.edit78:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit78, "fontStyle",  "bold");
    obj.edit78:setName("edit78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(817);
    obj.layout79:setTop(1076);
    obj.layout79:setWidth(10);
    obj.layout79:setHeight(18);
    obj.layout79:setName("layout79");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout79);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(10);
    obj.checkBox1:setHeight(19);
    obj.checkBox1:setField("untitled232");
    obj.checkBox1:setName("checkBox1");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(833);
    obj.layout80:setTop(1078);
    obj.layout80:setWidth(10);
    obj.layout80:setHeight(13);
    obj.layout80:setName("layout80");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout80);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(10);
    obj.checkBox2:setHeight(14);
    obj.checkBox2:setField("untitled233");
    obj.checkBox2:setName("checkBox2");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(863);
    obj.layout81:setTop(1078);
    obj.layout81:setWidth(11);
    obj.layout81:setHeight(14);
    obj.layout81:setName("layout81");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout81);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(11);
    obj.checkBox3:setHeight(15);
    obj.checkBox3:setField("untitled235");
    obj.checkBox3:setName("checkBox3");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(878);
    obj.layout82:setTop(1078);
    obj.layout82:setWidth(13);
    obj.layout82:setHeight(14);
    obj.layout82:setName("layout82");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout82);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(13);
    obj.checkBox4:setHeight(15);
    obj.checkBox4:setField("untitled236");
    obj.checkBox4:setName("checkBox4");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(817);
    obj.layout83:setTop(1094);
    obj.layout83:setWidth(13);
    obj.layout83:setHeight(14);
    obj.layout83:setName("layout83");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout83);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(13);
    obj.checkBox5:setHeight(15);
    obj.checkBox5:setField("untitled237");
    obj.checkBox5:setName("checkBox5");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(831);
    obj.layout84:setTop(1094);
    obj.layout84:setWidth(13);
    obj.layout84:setHeight(13);
    obj.layout84:setName("layout84");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout84);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(13);
    obj.checkBox6:setHeight(14);
    obj.checkBox6:setField("untitled238");
    obj.checkBox6:setName("checkBox6");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(845);
    obj.layout85:setTop(1094);
    obj.layout85:setWidth(13);
    obj.layout85:setHeight(14);
    obj.layout85:setName("layout85");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout85);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(13);
    obj.checkBox7:setHeight(15);
    obj.checkBox7:setField("untitled239");
    obj.checkBox7:setName("checkBox7");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(862);
    obj.layout86:setTop(1094);
    obj.layout86:setWidth(15);
    obj.layout86:setHeight(14);
    obj.layout86:setName("layout86");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout86);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(15);
    obj.checkBox8:setHeight(15);
    obj.checkBox8:setField("untitled240");
    obj.checkBox8:setName("checkBox8");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(876);
    obj.layout87:setTop(1094);
    obj.layout87:setWidth(15);
    obj.layout87:setHeight(14);
    obj.layout87:setName("layout87");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout87);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(15);
    obj.checkBox9:setHeight(15);
    obj.checkBox9:setField("untitled241");
    obj.checkBox9:setName("checkBox9");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(959);
    obj.layout88:setTop(1094);
    obj.layout88:setWidth(15);
    obj.layout88:setHeight(14);
    obj.layout88:setName("layout88");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout88);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(15);
    obj.checkBox10:setHeight(15);
    obj.checkBox10:setField("untitled242");
    obj.checkBox10:setName("checkBox10");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(959);
    obj.layout89:setTop(1076);
    obj.layout89:setWidth(15);
    obj.layout89:setHeight(16);
    obj.layout89:setName("layout89");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout89);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setTop(0);
    obj.checkBox11:setWidth(15);
    obj.checkBox11:setHeight(17);
    obj.checkBox11:setField("untitled243");
    obj.checkBox11:setName("checkBox11");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(898);
    obj.layout90:setTop(1076);
    obj.layout90:setWidth(15);
    obj.layout90:setHeight(16);
    obj.layout90:setName("layout90");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout90);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setTop(0);
    obj.checkBox12:setWidth(15);
    obj.checkBox12:setHeight(17);
    obj.checkBox12:setField("untitled244");
    obj.checkBox12:setName("checkBox12");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(896);
    obj.layout91:setTop(1094);
    obj.layout91:setWidth(15);
    obj.layout91:setHeight(14);
    obj.layout91:setName("layout91");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout91);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(0);
    obj.checkBox13:setWidth(15);
    obj.checkBox13:setHeight(15);
    obj.checkBox13:setField("untitled245");
    obj.checkBox13:setName("checkBox13");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(910);
    obj.layout92:setTop(1094);
    obj.layout92:setWidth(17);
    obj.layout92:setHeight(16);
    obj.layout92:setName("layout92");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout92);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setTop(0);
    obj.checkBox14:setWidth(17);
    obj.checkBox14:setHeight(17);
    obj.checkBox14:setField("untitled246");
    obj.checkBox14:setName("checkBox14");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(928);
    obj.layout93:setTop(1093);
    obj.layout93:setWidth(15);
    obj.layout93:setHeight(16);
    obj.layout93:setName("layout93");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout93);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setTop(0);
    obj.checkBox15:setWidth(15);
    obj.checkBox15:setHeight(17);
    obj.checkBox15:setField("untitled247");
    obj.checkBox15:setName("checkBox15");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(944);
    obj.layout94:setTop(1094);
    obj.layout94:setWidth(15);
    obj.layout94:setHeight(16);
    obj.layout94:setName("layout94");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout94);
    obj.checkBox16:setLeft(0);
    obj.checkBox16:setTop(0);
    obj.checkBox16:setWidth(15);
    obj.checkBox16:setHeight(17);
    obj.checkBox16:setField("untitled248");
    obj.checkBox16:setName("checkBox16");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(914);
    obj.layout95:setTop(1076);
    obj.layout95:setWidth(13);
    obj.layout95:setHeight(16);
    obj.layout95:setName("layout95");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout95);
    obj.checkBox17:setLeft(0);
    obj.checkBox17:setTop(0);
    obj.checkBox17:setWidth(13);
    obj.checkBox17:setHeight(17);
    obj.checkBox17:setField("untitled249");
    obj.checkBox17:setName("checkBox17");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(928);
    obj.layout96:setTop(1076);
    obj.layout96:setWidth(15);
    obj.layout96:setHeight(16);
    obj.layout96:setName("layout96");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout96);
    obj.checkBox18:setLeft(0);
    obj.checkBox18:setTop(0);
    obj.checkBox18:setWidth(15);
    obj.checkBox18:setHeight(17);
    obj.checkBox18:setField("untitled250");
    obj.checkBox18:setName("checkBox18");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(943);
    obj.layout97:setTop(1075);
    obj.layout97:setWidth(15);
    obj.layout97:setHeight(18);
    obj.layout97:setName("layout97");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout97);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setTop(0);
    obj.checkBox19:setWidth(15);
    obj.checkBox19:setHeight(19);
    obj.checkBox19:setField("untitled251");
    obj.checkBox19:setName("checkBox19");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(813);
    obj.layout98:setTop(1118);
    obj.layout98:setWidth(15);
    obj.layout98:setHeight(16);
    obj.layout98:setName("layout98");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout98);
    obj.checkBox20:setLeft(0);
    obj.checkBox20:setTop(0);
    obj.checkBox20:setWidth(15);
    obj.checkBox20:setHeight(17);
    obj.checkBox20:setField("untitled252");
    obj.checkBox20:setName("checkBox20");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(815);
    obj.layout99:setTop(1136);
    obj.layout99:setWidth(13);
    obj.layout99:setHeight(14);
    obj.layout99:setName("layout99");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout99);
    obj.checkBox21:setLeft(0);
    obj.checkBox21:setTop(0);
    obj.checkBox21:setWidth(13);
    obj.checkBox21:setHeight(15);
    obj.checkBox21:setField("untitled253");
    obj.checkBox21:setName("checkBox21");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(831);
    obj.layout100:setTop(1134);
    obj.layout100:setWidth(11);
    obj.layout100:setHeight(16);
    obj.layout100:setName("layout100");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout100);
    obj.checkBox22:setLeft(0);
    obj.checkBox22:setTop(0);
    obj.checkBox22:setWidth(11);
    obj.checkBox22:setHeight(17);
    obj.checkBox22:setField("untitled254");
    obj.checkBox22:setName("checkBox22");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(845);
    obj.layout101:setTop(1134);
    obj.layout101:setWidth(13);
    obj.layout101:setHeight(16);
    obj.layout101:setName("layout101");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout101);
    obj.checkBox23:setLeft(0);
    obj.checkBox23:setTop(0);
    obj.checkBox23:setWidth(13);
    obj.checkBox23:setHeight(17);
    obj.checkBox23:setField("untitled255");
    obj.checkBox23:setName("checkBox23");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(862);
    obj.layout102:setTop(1136);
    obj.layout102:setWidth(13);
    obj.layout102:setHeight(14);
    obj.layout102:setName("layout102");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout102);
    obj.checkBox24:setLeft(0);
    obj.checkBox24:setTop(0);
    obj.checkBox24:setWidth(13);
    obj.checkBox24:setHeight(15);
    obj.checkBox24:setField("untitled256");
    obj.checkBox24:setName("checkBox24");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(878);
    obj.layout103:setTop(1136);
    obj.layout103:setWidth(15);
    obj.layout103:setHeight(14);
    obj.layout103:setName("layout103");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout103);
    obj.checkBox25:setLeft(0);
    obj.checkBox25:setTop(0);
    obj.checkBox25:setWidth(15);
    obj.checkBox25:setHeight(15);
    obj.checkBox25:setField("untitled257");
    obj.checkBox25:setName("checkBox25");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(831);
    obj.layout104:setTop(1118);
    obj.layout104:setWidth(13);
    obj.layout104:setHeight(14);
    obj.layout104:setName("layout104");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout104);
    obj.checkBox26:setLeft(0);
    obj.checkBox26:setTop(0);
    obj.checkBox26:setWidth(13);
    obj.checkBox26:setHeight(15);
    obj.checkBox26:setField("untitled258");
    obj.checkBox26:setName("checkBox26");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(860);
    obj.layout105:setTop(1118);
    obj.layout105:setWidth(15);
    obj.layout105:setHeight(16);
    obj.layout105:setName("layout105");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout105);
    obj.checkBox27:setLeft(0);
    obj.checkBox27:setTop(0);
    obj.checkBox27:setWidth(15);
    obj.checkBox27:setHeight(17);
    obj.checkBox27:setField("untitled260");
    obj.checkBox27:setName("checkBox27");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(876);
    obj.layout106:setTop(1118);
    obj.layout106:setWidth(15);
    obj.layout106:setHeight(16);
    obj.layout106:setName("layout106");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout106);
    obj.checkBox28:setLeft(0);
    obj.checkBox28:setTop(0);
    obj.checkBox28:setWidth(15);
    obj.checkBox28:setHeight(17);
    obj.checkBox28:setField("untitled261");
    obj.checkBox28:setName("checkBox28");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(959);
    obj.layout107:setTop(1134);
    obj.layout107:setWidth(15);
    obj.layout107:setHeight(14);
    obj.layout107:setName("layout107");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout107);
    obj.checkBox29:setLeft(0);
    obj.checkBox29:setTop(0);
    obj.checkBox29:setWidth(15);
    obj.checkBox29:setHeight(15);
    obj.checkBox29:setField("untitled262");
    obj.checkBox29:setName("checkBox29");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(959);
    obj.layout108:setTop(1118);
    obj.layout108:setWidth(15);
    obj.layout108:setHeight(14);
    obj.layout108:setName("layout108");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout108);
    obj.checkBox30:setLeft(0);
    obj.checkBox30:setTop(0);
    obj.checkBox30:setWidth(15);
    obj.checkBox30:setHeight(15);
    obj.checkBox30:setField("untitled263");
    obj.checkBox30:setName("checkBox30");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(943);
    obj.layout109:setTop(1136);
    obj.layout109:setWidth(17);
    obj.layout109:setHeight(16);
    obj.layout109:setName("layout109");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout109);
    obj.checkBox31:setLeft(0);
    obj.checkBox31:setTop(0);
    obj.checkBox31:setWidth(17);
    obj.checkBox31:setHeight(17);
    obj.checkBox31:setField("untitled264");
    obj.checkBox31:setName("checkBox31");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(943);
    obj.layout110:setTop(1116);
    obj.layout110:setWidth(17);
    obj.layout110:setHeight(18);
    obj.layout110:setName("layout110");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout110);
    obj.checkBox32:setLeft(0);
    obj.checkBox32:setTop(0);
    obj.checkBox32:setWidth(17);
    obj.checkBox32:setHeight(19);
    obj.checkBox32:setField("untitled265");
    obj.checkBox32:setName("checkBox32");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle1);
    obj.layout111:setLeft(926);
    obj.layout111:setTop(1118);
    obj.layout111:setWidth(17);
    obj.layout111:setHeight(16);
    obj.layout111:setName("layout111");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout111);
    obj.checkBox33:setLeft(0);
    obj.checkBox33:setTop(0);
    obj.checkBox33:setWidth(17);
    obj.checkBox33:setHeight(17);
    obj.checkBox33:setField("untitled266");
    obj.checkBox33:setName("checkBox33");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle1);
    obj.layout112:setLeft(926);
    obj.layout112:setTop(1134);
    obj.layout112:setWidth(17);
    obj.layout112:setHeight(16);
    obj.layout112:setName("layout112");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout112);
    obj.checkBox34:setLeft(0);
    obj.checkBox34:setTop(0);
    obj.checkBox34:setWidth(17);
    obj.checkBox34:setHeight(17);
    obj.checkBox34:setField("untitled267");
    obj.checkBox34:setName("checkBox34");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle1);
    obj.layout113:setLeft(912);
    obj.layout113:setTop(1134);
    obj.layout113:setWidth(15);
    obj.layout113:setHeight(16);
    obj.layout113:setName("layout113");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout113);
    obj.checkBox35:setLeft(0);
    obj.checkBox35:setTop(0);
    obj.checkBox35:setWidth(15);
    obj.checkBox35:setHeight(17);
    obj.checkBox35:setField("untitled268");
    obj.checkBox35:setName("checkBox35");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle1);
    obj.layout114:setLeft(912);
    obj.layout114:setTop(1116);
    obj.layout114:setWidth(15);
    obj.layout114:setHeight(20);
    obj.layout114:setName("layout114");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout114);
    obj.checkBox36:setLeft(0);
    obj.checkBox36:setTop(0);
    obj.checkBox36:setWidth(15);
    obj.checkBox36:setHeight(21);
    obj.checkBox36:setField("untitled269");
    obj.checkBox36:setName("checkBox36");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setLeft(896);
    obj.layout115:setTop(1116);
    obj.layout115:setWidth(19);
    obj.layout115:setHeight(18);
    obj.layout115:setName("layout115");

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout115);
    obj.checkBox37:setLeft(0);
    obj.checkBox37:setTop(0);
    obj.checkBox37:setWidth(19);
    obj.checkBox37:setHeight(19);
    obj.checkBox37:setField("untitled270");
    obj.checkBox37:setName("checkBox37");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle1);
    obj.layout116:setLeft(899);
    obj.layout116:setTop(1136);
    obj.layout116:setWidth(10);
    obj.layout116:setHeight(14);
    obj.layout116:setName("layout116");

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout116);
    obj.checkBox38:setLeft(0);
    obj.checkBox38:setTop(0);
    obj.checkBox38:setWidth(10);
    obj.checkBox38:setHeight(15);
    obj.checkBox38:setField("untitled271");
    obj.checkBox38:setName("checkBox38");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle1);
    obj.layout117:setLeft(818);
    obj.layout117:setTop(1157);
    obj.layout117:setWidth(10);
    obj.layout117:setHeight(14);
    obj.layout117:setName("layout117");

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout117);
    obj.checkBox39:setLeft(0);
    obj.checkBox39:setTop(0);
    obj.checkBox39:setWidth(10);
    obj.checkBox39:setHeight(15);
    obj.checkBox39:setField("untitled273");
    obj.checkBox39:setName("checkBox39");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle1);
    obj.layout118:setLeft(815);
    obj.layout118:setTop(1175);
    obj.layout118:setWidth(15);
    obj.layout118:setHeight(14);
    obj.layout118:setName("layout118");

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout118);
    obj.checkBox40:setLeft(0);
    obj.checkBox40:setTop(0);
    obj.checkBox40:setWidth(15);
    obj.checkBox40:setHeight(15);
    obj.checkBox40:setField("untitled274");
    obj.checkBox40:setName("checkBox40");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle1);
    obj.layout119:setLeft(831);
    obj.layout119:setTop(1175);
    obj.layout119:setWidth(13);
    obj.layout119:setHeight(16);
    obj.layout119:setName("layout119");

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout119);
    obj.checkBox41:setLeft(0);
    obj.checkBox41:setTop(0);
    obj.checkBox41:setWidth(13);
    obj.checkBox41:setHeight(17);
    obj.checkBox41:setField("untitled275");
    obj.checkBox41:setName("checkBox41");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle1);
    obj.layout120:setLeft(831);
    obj.layout120:setTop(1157);
    obj.layout120:setWidth(13);
    obj.layout120:setHeight(16);
    obj.layout120:setName("layout120");

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout120);
    obj.checkBox42:setLeft(0);
    obj.checkBox42:setTop(0);
    obj.checkBox42:setWidth(13);
    obj.checkBox42:setHeight(17);
    obj.checkBox42:setField("untitled276");
    obj.checkBox42:setName("checkBox42");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle1);
    obj.layout121:setLeft(845);
    obj.layout121:setTop(1175);
    obj.layout121:setWidth(13);
    obj.layout121:setHeight(14);
    obj.layout121:setName("layout121");

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout121);
    obj.checkBox43:setLeft(0);
    obj.checkBox43:setTop(0);
    obj.checkBox43:setWidth(13);
    obj.checkBox43:setHeight(15);
    obj.checkBox43:setField("untitled277");
    obj.checkBox43:setName("checkBox43");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle1);
    obj.layout122:setLeft(845);
    obj.layout122:setTop(1156);
    obj.layout122:setWidth(15);
    obj.layout122:setHeight(18);
    obj.layout122:setName("layout122");

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout122);
    obj.checkBox44:setLeft(0);
    obj.checkBox44:setTop(0);
    obj.checkBox44:setWidth(15);
    obj.checkBox44:setHeight(19);
    obj.checkBox44:setField("untitled278");
    obj.checkBox44:setName("checkBox44");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle1);
    obj.layout123:setLeft(860);
    obj.layout123:setTop(1175);
    obj.layout123:setWidth(17);
    obj.layout123:setHeight(14);
    obj.layout123:setName("layout123");

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout123);
    obj.checkBox45:setLeft(0);
    obj.checkBox45:setTop(0);
    obj.checkBox45:setWidth(17);
    obj.checkBox45:setHeight(15);
    obj.checkBox45:setField("untitled279");
    obj.checkBox45:setName("checkBox45");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle1);
    obj.layout124:setLeft(862);
    obj.layout124:setTop(1157);
    obj.layout124:setWidth(15);
    obj.layout124:setHeight(16);
    obj.layout124:setName("layout124");

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout124);
    obj.checkBox46:setLeft(0);
    obj.checkBox46:setTop(0);
    obj.checkBox46:setWidth(15);
    obj.checkBox46:setHeight(17);
    obj.checkBox46:setField("untitled280");
    obj.checkBox46:setName("checkBox46");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle1);
    obj.layout125:setLeft(876);
    obj.layout125:setTop(1175);
    obj.layout125:setWidth(17);
    obj.layout125:setHeight(14);
    obj.layout125:setName("layout125");

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout125);
    obj.checkBox47:setLeft(0);
    obj.checkBox47:setTop(0);
    obj.checkBox47:setWidth(17);
    obj.checkBox47:setHeight(15);
    obj.checkBox47:setField("untitled281");
    obj.checkBox47:setName("checkBox47");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle1);
    obj.layout126:setLeft(876);
    obj.layout126:setTop(1156);
    obj.layout126:setWidth(15);
    obj.layout126:setHeight(18);
    obj.layout126:setName("layout126");

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout126);
    obj.checkBox48:setLeft(0);
    obj.checkBox48:setTop(0);
    obj.checkBox48:setWidth(15);
    obj.checkBox48:setHeight(19);
    obj.checkBox48:setField("untitled282");
    obj.checkBox48:setName("checkBox48");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle1);
    obj.layout127:setLeft(898);
    obj.layout127:setTop(1177);
    obj.layout127:setWidth(13);
    obj.layout127:setHeight(14);
    obj.layout127:setName("layout127");

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout127);
    obj.checkBox49:setLeft(0);
    obj.checkBox49:setTop(0);
    obj.checkBox49:setWidth(13);
    obj.checkBox49:setHeight(15);
    obj.checkBox49:setField("untitled283");
    obj.checkBox49:setName("checkBox49");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle1);
    obj.layout128:setLeft(898);
    obj.layout128:setTop(1156);
    obj.layout128:setWidth(15);
    obj.layout128:setHeight(18);
    obj.layout128:setName("layout128");

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout128);
    obj.checkBox50:setLeft(0);
    obj.checkBox50:setTop(0);
    obj.checkBox50:setWidth(15);
    obj.checkBox50:setHeight(19);
    obj.checkBox50:setField("untitled284");
    obj.checkBox50:setName("checkBox50");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setLeft(912);
    obj.layout129:setTop(1175);
    obj.layout129:setWidth(15);
    obj.layout129:setHeight(16);
    obj.layout129:setName("layout129");

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout129);
    obj.checkBox51:setLeft(0);
    obj.checkBox51:setTop(0);
    obj.checkBox51:setWidth(15);
    obj.checkBox51:setHeight(17);
    obj.checkBox51:setField("untitled285");
    obj.checkBox51:setName("checkBox51");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setLeft(910);
    obj.layout130:setTop(1156);
    obj.layout130:setWidth(17);
    obj.layout130:setHeight(18);
    obj.layout130:setName("layout130");

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout130);
    obj.checkBox52:setLeft(0);
    obj.checkBox52:setTop(0);
    obj.checkBox52:setWidth(17);
    obj.checkBox52:setHeight(19);
    obj.checkBox52:setField("untitled286");
    obj.checkBox52:setName("checkBox52");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setLeft(926);
    obj.layout131:setTop(1175);
    obj.layout131:setWidth(17);
    obj.layout131:setHeight(16);
    obj.layout131:setName("layout131");

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout131);
    obj.checkBox53:setLeft(0);
    obj.checkBox53:setTop(0);
    obj.checkBox53:setWidth(17);
    obj.checkBox53:setHeight(17);
    obj.checkBox53:setField("untitled287");
    obj.checkBox53:setName("checkBox53");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle1);
    obj.layout132:setLeft(926);
    obj.layout132:setTop(1157);
    obj.layout132:setWidth(19);
    obj.layout132:setHeight(18);
    obj.layout132:setName("layout132");

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout132);
    obj.checkBox54:setLeft(0);
    obj.checkBox54:setTop(0);
    obj.checkBox54:setWidth(19);
    obj.checkBox54:setHeight(19);
    obj.checkBox54:setField("untitled288");
    obj.checkBox54:setName("checkBox54");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle1);
    obj.layout133:setLeft(943);
    obj.layout133:setTop(1175);
    obj.layout133:setWidth(15);
    obj.layout133:setHeight(16);
    obj.layout133:setName("layout133");

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout133);
    obj.checkBox55:setLeft(0);
    obj.checkBox55:setTop(0);
    obj.checkBox55:setWidth(15);
    obj.checkBox55:setHeight(17);
    obj.checkBox55:setField("untitled289");
    obj.checkBox55:setName("checkBox55");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle1);
    obj.layout134:setLeft(944);
    obj.layout134:setTop(1157);
    obj.layout134:setWidth(15);
    obj.layout134:setHeight(14);
    obj.layout134:setName("layout134");

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout134);
    obj.checkBox56:setLeft(0);
    obj.checkBox56:setTop(0);
    obj.checkBox56:setWidth(15);
    obj.checkBox56:setHeight(15);
    obj.checkBox56:setField("untitled290");
    obj.checkBox56:setName("checkBox56");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle1);
    obj.layout135:setLeft(957);
    obj.layout135:setTop(1174);
    obj.layout135:setWidth(17);
    obj.layout135:setHeight(16);
    obj.layout135:setName("layout135");

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout135);
    obj.checkBox57:setLeft(0);
    obj.checkBox57:setTop(0);
    obj.checkBox57:setWidth(17);
    obj.checkBox57:setHeight(17);
    obj.checkBox57:setField("untitled291");
    obj.checkBox57:setName("checkBox57");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle1);
    obj.layout136:setLeft(957);
    obj.layout136:setTop(1156);
    obj.layout136:setWidth(17);
    obj.layout136:setHeight(20);
    obj.layout136:setName("layout136");

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout136);
    obj.checkBox58:setLeft(0);
    obj.checkBox58:setTop(0);
    obj.checkBox58:setWidth(17);
    obj.checkBox58:setHeight(21);
    obj.checkBox58:setField("untitled292");
    obj.checkBox58:setName("checkBox58");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle1);
    obj.layout137:setLeft(845);
    obj.layout137:setTop(1118);
    obj.layout137:setWidth(17);
    obj.layout137:setHeight(16);
    obj.layout137:setName("layout137");

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout137);
    obj.checkBox59:setLeft(0);
    obj.checkBox59:setTop(0);
    obj.checkBox59:setWidth(17);
    obj.checkBox59:setHeight(17);
    obj.checkBox59:setField("untitled259");
    obj.checkBox59:setName("checkBox59");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle1);
    obj.layout138:setLeft(845);
    obj.layout138:setTop(1076);
    obj.layout138:setWidth(17);
    obj.layout138:setHeight(16);
    obj.layout138:setName("layout138");

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout138);
    obj.checkBox60:setLeft(0);
    obj.checkBox60:setTop(0);
    obj.checkBox60:setWidth(17);
    obj.checkBox60:setHeight(17);
    obj.checkBox60:setField("untitled326");
    obj.checkBox60:setName("checkBox60");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle1);
    obj.layout139:setLeft(493);
    obj.layout139:setTop(452);
    obj.layout139:setWidth(11);
    obj.layout139:setHeight(14);
    obj.layout139:setName("layout139");

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout139);
    obj.checkBox61:setLeft(0);
    obj.checkBox61:setTop(0);
    obj.checkBox61:setWidth(11);
    obj.checkBox61:setHeight(15);
    obj.checkBox61:setField("untitled327");
    obj.checkBox61:setName("checkBox61");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle1);
    obj.layout140:setLeft(406);
    obj.layout140:setTop(430);
    obj.layout140:setWidth(10);
    obj.layout140:setHeight(13);
    obj.layout140:setName("layout140");

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout140);
    obj.checkBox62:setLeft(0);
    obj.checkBox62:setTop(0);
    obj.checkBox62:setWidth(10);
    obj.checkBox62:setHeight(14);
    obj.checkBox62:setField("untitled328");
    obj.checkBox62:setName("checkBox62");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle1);
    obj.layout141:setLeft(309);
    obj.layout141:setTop(454);
    obj.layout141:setWidth(10);
    obj.layout141:setHeight(11);
    obj.layout141:setName("layout141");

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout141);
    obj.checkBox63:setLeft(0);
    obj.checkBox63:setTop(0);
    obj.checkBox63:setWidth(10);
    obj.checkBox63:setHeight(12);
    obj.checkBox63:setField("untitled329");
    obj.checkBox63:setName("checkBox63");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle1);
    obj.layout142:setLeft(307);
    obj.layout142:setTop(430);
    obj.layout142:setWidth(10);
    obj.layout142:setHeight(13);
    obj.layout142:setName("layout142");

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout142);
    obj.checkBox64:setLeft(0);
    obj.checkBox64:setTop(0);
    obj.checkBox64:setWidth(10);
    obj.checkBox64:setHeight(14);
    obj.checkBox64:setField("untitled330");
    obj.checkBox64:setName("checkBox64");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTSC1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTSC1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTSC1_svg = {
    newEditor = newfrmTSC1_svg, 
    new = newfrmTSC1_svg, 
    name = "frmTSC1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmTSC1_svg = _frmTSC1_svg;
Firecast.registrarForm(_frmTSC1_svg);

return _frmTSC1_svg;
