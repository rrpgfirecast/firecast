require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaOdisseia2_03_L_svg()
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
    obj:setName("frmFichaOdisseia2_03_L_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(952);
    obj.rectangle1:setHeight(1347);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(952);
    obj.image1:setHeight(1347);
    obj.image1:setSRC("images/4.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(82);
    obj.layout1:setTop(241);
    obj.layout1:setWidth(77);
    obj.layout1:setHeight(35);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(20.8);
    obj.edit1:setFontColor("#000000");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(77);
    obj.edit1:setHeight(36);
    obj.edit1:setField("Grau1");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(166);
    obj.layout2:setTop(242);
    obj.layout2:setWidth(172);
    obj.layout2:setHeight(33);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(20.8);
    obj.edit2:setFontColor("#000000");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(172);
    obj.edit2:setHeight(34);
    obj.edit2:setField("Habilidade1");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(346);
    obj.layout3:setTop(242);
    obj.layout3:setWidth(172);
    obj.layout3:setHeight(33);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(20.8);
    obj.edit3:setFontColor("#000000");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(172);
    obj.edit3:setHeight(34);
    obj.edit3:setField("Efeito1");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(527);
    obj.layout4:setTop(239);
    obj.layout4:setWidth(77);
    obj.layout4:setHeight(35);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(20.8);
    obj.edit4:setFontColor("#000000");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(77);
    obj.edit4:setHeight(36);
    obj.edit4:setField("Dur1");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(614);
    obj.layout5:setTop(240);
    obj.layout5:setWidth(77);
    obj.layout5:setHeight(35);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(20.8);
    obj.edit5:setFontColor("#000000");
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(77);
    obj.edit5:setHeight(36);
    obj.edit5:setField("Custo1");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(698);
    obj.layout6:setTop(240);
    obj.layout6:setWidth(77);
    obj.layout6:setHeight(35);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(20.8);
    obj.edit6:setFontColor("#000000");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(77);
    obj.edit6:setHeight(36);
    obj.edit6:setField("Rol1");
    obj.edit6:setName("edit6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(784);
    obj.layout7:setTop(241);
    obj.layout7:setWidth(77);
    obj.layout7:setHeight(35);
    obj.layout7:setName("layout7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(20.8);
    obj.edit7:setFontColor("#000000");
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(77);
    obj.edit7:setHeight(36);
    obj.edit7:setField("Dif1");
    obj.edit7:setName("edit7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(80);
    obj.layout8:setTop(281);
    obj.layout8:setWidth(77);
    obj.layout8:setHeight(35);
    obj.layout8:setName("layout8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(20.8);
    obj.edit8:setFontColor("#000000");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(77);
    obj.edit8:setHeight(36);
    obj.edit8:setField("Grau2");
    obj.edit8:setName("edit8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(167);
    obj.layout9:setTop(280);
    obj.layout9:setWidth(172);
    obj.layout9:setHeight(33);
    obj.layout9:setName("layout9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(20.8);
    obj.edit9:setFontColor("#000000");
    lfm_setPropAsString(obj.edit9, "fontStyle",  "bold");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(172);
    obj.edit9:setHeight(34);
    obj.edit9:setField("Habilidade2");
    obj.edit9:setName("edit9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(347);
    obj.layout10:setTop(280);
    obj.layout10:setWidth(172);
    obj.layout10:setHeight(33);
    obj.layout10:setName("layout10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(20.8);
    obj.edit10:setFontColor("#000000");
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(172);
    obj.edit10:setHeight(34);
    obj.edit10:setField("Efeito2");
    obj.edit10:setName("edit10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(528);
    obj.layout11:setTop(281);
    obj.layout11:setWidth(77);
    obj.layout11:setHeight(35);
    obj.layout11:setName("layout11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(20.8);
    obj.edit11:setFontColor("#000000");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(77);
    obj.edit11:setHeight(36);
    obj.edit11:setField("Dur2");
    obj.edit11:setName("edit11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(613);
    obj.layout12:setTop(280);
    obj.layout12:setWidth(77);
    obj.layout12:setHeight(35);
    obj.layout12:setName("layout12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(20.8);
    obj.edit12:setFontColor("#000000");
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(77);
    obj.edit12:setHeight(36);
    obj.edit12:setField("Custo2");
    obj.edit12:setName("edit12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(698);
    obj.layout13:setTop(279);
    obj.layout13:setWidth(77);
    obj.layout13:setHeight(35);
    obj.layout13:setName("layout13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(20.8);
    obj.edit13:setFontColor("#000000");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(77);
    obj.edit13:setHeight(36);
    obj.edit13:setField("Rol2");
    obj.edit13:setName("edit13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(783);
    obj.layout14:setTop(280);
    obj.layout14:setWidth(77);
    obj.layout14:setHeight(35);
    obj.layout14:setName("layout14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(20.8);
    obj.edit14:setFontColor("#000000");
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(77);
    obj.edit14:setHeight(36);
    obj.edit14:setField("Dif2");
    obj.edit14:setName("edit14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(81);
    obj.layout15:setTop(319);
    obj.layout15:setWidth(77);
    obj.layout15:setHeight(35);
    obj.layout15:setName("layout15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(20.8);
    obj.edit15:setFontColor("#000000");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(77);
    obj.edit15:setHeight(36);
    obj.edit15:setField("Grau3");
    obj.edit15:setName("edit15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(164);
    obj.layout16:setTop(320);
    obj.layout16:setWidth(172);
    obj.layout16:setHeight(33);
    obj.layout16:setName("layout16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout16);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(20.8);
    obj.edit16:setFontColor("#000000");
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(172);
    obj.edit16:setHeight(34);
    obj.edit16:setField("Habilidade3");
    obj.edit16:setName("edit16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(344);
    obj.layout17:setTop(320);
    obj.layout17:setWidth(172);
    obj.layout17:setHeight(33);
    obj.layout17:setName("layout17");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout17);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(20.8);
    obj.edit17:setFontColor("#000000");
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(172);
    obj.edit17:setHeight(34);
    obj.edit17:setField("Efeito3");
    obj.edit17:setName("edit17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(530);
    obj.layout18:setTop(320);
    obj.layout18:setWidth(77);
    obj.layout18:setHeight(35);
    obj.layout18:setName("layout18");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout18);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(20.8);
    obj.edit18:setFontColor("#000000");
    lfm_setPropAsString(obj.edit18, "fontStyle",  "bold");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(77);
    obj.edit18:setHeight(36);
    obj.edit18:setField("Dur3");
    obj.edit18:setName("edit18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(613);
    obj.layout19:setTop(321);
    obj.layout19:setWidth(77);
    obj.layout19:setHeight(35);
    obj.layout19:setName("layout19");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout19);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(20.8);
    obj.edit19:setFontColor("#000000");
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(77);
    obj.edit19:setHeight(36);
    obj.edit19:setField("Custo3");
    obj.edit19:setName("edit19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(698);
    obj.layout20:setTop(320);
    obj.layout20:setWidth(77);
    obj.layout20:setHeight(35);
    obj.layout20:setName("layout20");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout20);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(20.8);
    obj.edit20:setFontColor("#000000");
    lfm_setPropAsString(obj.edit20, "fontStyle",  "bold");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(77);
    obj.edit20:setHeight(36);
    obj.edit20:setField("Rol3");
    obj.edit20:setName("edit20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(784);
    obj.layout21:setTop(319);
    obj.layout21:setWidth(77);
    obj.layout21:setHeight(35);
    obj.layout21:setName("layout21");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout21);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(20.8);
    obj.edit21:setFontColor("#000000");
    lfm_setPropAsString(obj.edit21, "fontStyle",  "bold");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(77);
    obj.edit21:setHeight(36);
    obj.edit21:setField("Dif3");
    obj.edit21:setName("edit21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(80);
    obj.layout22:setTop(359);
    obj.layout22:setWidth(77);
    obj.layout22:setHeight(35);
    obj.layout22:setName("layout22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout22);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(20.8);
    obj.edit22:setFontColor("#000000");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(77);
    obj.edit22:setHeight(36);
    obj.edit22:setField("Grau4");
    obj.edit22:setName("edit22");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(167);
    obj.layout23:setTop(359);
    obj.layout23:setWidth(172);
    obj.layout23:setHeight(33);
    obj.layout23:setName("layout23");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout23);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(20.8);
    obj.edit23:setFontColor("#000000");
    lfm_setPropAsString(obj.edit23, "fontStyle",  "bold");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(172);
    obj.edit23:setHeight(34);
    obj.edit23:setField("Habilidade4");
    obj.edit23:setName("edit23");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(347);
    obj.layout24:setTop(358);
    obj.layout24:setWidth(172);
    obj.layout24:setHeight(33);
    obj.layout24:setName("layout24");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout24);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(20.8);
    obj.edit24:setFontColor("#000000");
    lfm_setPropAsString(obj.edit24, "fontStyle",  "bold");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(172);
    obj.edit24:setHeight(34);
    obj.edit24:setField("Efeito4");
    obj.edit24:setName("edit24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(529);
    obj.layout25:setTop(359);
    obj.layout25:setWidth(77);
    obj.layout25:setHeight(35);
    obj.layout25:setName("layout25");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout25);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(20.8);
    obj.edit25:setFontColor("#000000");
    lfm_setPropAsString(obj.edit25, "fontStyle",  "bold");
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(77);
    obj.edit25:setHeight(36);
    obj.edit25:setField("Dur4");
    obj.edit25:setName("edit25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(613);
    obj.layout26:setTop(359);
    obj.layout26:setWidth(77);
    obj.layout26:setHeight(35);
    obj.layout26:setName("layout26");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout26);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(20.8);
    obj.edit26:setFontColor("#000000");
    lfm_setPropAsString(obj.edit26, "fontStyle",  "bold");
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(77);
    obj.edit26:setHeight(36);
    obj.edit26:setField("Custo4");
    obj.edit26:setName("edit26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(698);
    obj.layout27:setTop(359);
    obj.layout27:setWidth(77);
    obj.layout27:setHeight(35);
    obj.layout27:setName("layout27");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout27);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(20.8);
    obj.edit27:setFontColor("#000000");
    lfm_setPropAsString(obj.edit27, "fontStyle",  "bold");
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(77);
    obj.edit27:setHeight(36);
    obj.edit27:setField("Rol4");
    obj.edit27:setName("edit27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(784);
    obj.layout28:setTop(358);
    obj.layout28:setWidth(77);
    obj.layout28:setHeight(35);
    obj.layout28:setName("layout28");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout28);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(20.8);
    obj.edit28:setFontColor("#000000");
    lfm_setPropAsString(obj.edit28, "fontStyle",  "bold");
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(77);
    obj.edit28:setHeight(36);
    obj.edit28:setField("Dif4");
    obj.edit28:setName("edit28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(81);
    obj.layout29:setTop(400);
    obj.layout29:setWidth(77);
    obj.layout29:setHeight(35);
    obj.layout29:setName("layout29");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout29);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(20.8);
    obj.edit29:setFontColor("#000000");
    lfm_setPropAsString(obj.edit29, "fontStyle",  "bold");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(77);
    obj.edit29:setHeight(36);
    obj.edit29:setField("Grau5");
    obj.edit29:setName("edit29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(167);
    obj.layout30:setTop(399);
    obj.layout30:setWidth(172);
    obj.layout30:setHeight(33);
    obj.layout30:setName("layout30");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout30);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(20.8);
    obj.edit30:setFontColor("#000000");
    lfm_setPropAsString(obj.edit30, "fontStyle",  "bold");
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(172);
    obj.edit30:setHeight(34);
    obj.edit30:setField("Habilidade5");
    obj.edit30:setName("edit30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(347);
    obj.layout31:setTop(399);
    obj.layout31:setWidth(172);
    obj.layout31:setHeight(33);
    obj.layout31:setName("layout31");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout31);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(20.8);
    obj.edit31:setFontColor("#000000");
    lfm_setPropAsString(obj.edit31, "fontStyle",  "bold");
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(172);
    obj.edit31:setHeight(34);
    obj.edit31:setField("Efeito5");
    obj.edit31:setName("edit31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(528);
    obj.layout32:setTop(399);
    obj.layout32:setWidth(77);
    obj.layout32:setHeight(35);
    obj.layout32:setName("layout32");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout32);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(20.8);
    obj.edit32:setFontColor("#000000");
    lfm_setPropAsString(obj.edit32, "fontStyle",  "bold");
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(77);
    obj.edit32:setHeight(36);
    obj.edit32:setField("Dur5");
    obj.edit32:setName("edit32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(612);
    obj.layout33:setTop(399);
    obj.layout33:setWidth(77);
    obj.layout33:setHeight(35);
    obj.layout33:setName("layout33");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout33);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(20.8);
    obj.edit33:setFontColor("#000000");
    lfm_setPropAsString(obj.edit33, "fontStyle",  "bold");
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(77);
    obj.edit33:setHeight(36);
    obj.edit33:setField("Custo5");
    obj.edit33:setName("edit33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(697);
    obj.layout34:setTop(399);
    obj.layout34:setWidth(77);
    obj.layout34:setHeight(35);
    obj.layout34:setName("layout34");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout34);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(20.8);
    obj.edit34:setFontColor("#000000");
    lfm_setPropAsString(obj.edit34, "fontStyle",  "bold");
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(77);
    obj.edit34:setHeight(36);
    obj.edit34:setField("Rol5");
    obj.edit34:setName("edit34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(783);
    obj.layout35:setTop(398);
    obj.layout35:setWidth(77);
    obj.layout35:setHeight(35);
    obj.layout35:setName("layout35");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout35);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(20.8);
    obj.edit35:setFontColor("#000000");
    lfm_setPropAsString(obj.edit35, "fontStyle",  "bold");
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(77);
    obj.edit35:setHeight(36);
    obj.edit35:setField("Dif5");
    obj.edit35:setName("edit35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(80);
    obj.layout36:setTop(440);
    obj.layout36:setWidth(77);
    obj.layout36:setHeight(35);
    obj.layout36:setName("layout36");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout36);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(20.8);
    obj.edit36:setFontColor("#000000");
    lfm_setPropAsString(obj.edit36, "fontStyle",  "bold");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(77);
    obj.edit36:setHeight(36);
    obj.edit36:setField("Grau6");
    obj.edit36:setName("edit36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(165);
    obj.layout37:setTop(439);
    obj.layout37:setWidth(172);
    obj.layout37:setHeight(33);
    obj.layout37:setName("layout37");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout37);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(20.8);
    obj.edit37:setFontColor("#000000");
    lfm_setPropAsString(obj.edit37, "fontStyle",  "bold");
    obj.edit37:setHorzTextAlign("leading");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(172);
    obj.edit37:setHeight(34);
    obj.edit37:setField("Habilidade6");
    obj.edit37:setName("edit37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(345);
    obj.layout38:setTop(439);
    obj.layout38:setWidth(172);
    obj.layout38:setHeight(33);
    obj.layout38:setName("layout38");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout38);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(20.8);
    obj.edit38:setFontColor("#000000");
    lfm_setPropAsString(obj.edit38, "fontStyle",  "bold");
    obj.edit38:setHorzTextAlign("leading");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(172);
    obj.edit38:setHeight(34);
    obj.edit38:setField("Efeito6");
    obj.edit38:setName("edit38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(529);
    obj.layout39:setTop(441);
    obj.layout39:setWidth(77);
    obj.layout39:setHeight(35);
    obj.layout39:setName("layout39");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout39);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(20.8);
    obj.edit39:setFontColor("#000000");
    lfm_setPropAsString(obj.edit39, "fontStyle",  "bold");
    obj.edit39:setHorzTextAlign("leading");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(77);
    obj.edit39:setHeight(36);
    obj.edit39:setField("Dur6");
    obj.edit39:setName("edit39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(612);
    obj.layout40:setTop(441);
    obj.layout40:setWidth(77);
    obj.layout40:setHeight(35);
    obj.layout40:setName("layout40");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout40);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(20.8);
    obj.edit40:setFontColor("#000000");
    lfm_setPropAsString(obj.edit40, "fontStyle",  "bold");
    obj.edit40:setHorzTextAlign("leading");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(77);
    obj.edit40:setHeight(36);
    obj.edit40:setField("Custo6");
    obj.edit40:setName("edit40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(697);
    obj.layout41:setTop(441);
    obj.layout41:setWidth(77);
    obj.layout41:setHeight(35);
    obj.layout41:setName("layout41");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout41);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(20.8);
    obj.edit41:setFontColor("#000000");
    lfm_setPropAsString(obj.edit41, "fontStyle",  "bold");
    obj.edit41:setHorzTextAlign("leading");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(77);
    obj.edit41:setHeight(36);
    obj.edit41:setField("Rol6");
    obj.edit41:setName("edit41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(783);
    obj.layout42:setTop(440);
    obj.layout42:setWidth(77);
    obj.layout42:setHeight(35);
    obj.layout42:setName("layout42");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout42);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(20.8);
    obj.edit42:setFontColor("#000000");
    lfm_setPropAsString(obj.edit42, "fontStyle",  "bold");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(77);
    obj.edit42:setHeight(36);
    obj.edit42:setField("Dif6");
    obj.edit42:setName("edit42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(81);
    obj.layout43:setTop(479);
    obj.layout43:setWidth(77);
    obj.layout43:setHeight(35);
    obj.layout43:setName("layout43");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout43);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(20.8);
    obj.edit43:setFontColor("#000000");
    lfm_setPropAsString(obj.edit43, "fontStyle",  "bold");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(77);
    obj.edit43:setHeight(36);
    obj.edit43:setField("Grau7");
    obj.edit43:setName("edit43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(165);
    obj.layout44:setTop(479);
    obj.layout44:setWidth(172);
    obj.layout44:setHeight(33);
    obj.layout44:setName("layout44");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout44);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(20.8);
    obj.edit44:setFontColor("#000000");
    lfm_setPropAsString(obj.edit44, "fontStyle",  "bold");
    obj.edit44:setHorzTextAlign("leading");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(172);
    obj.edit44:setHeight(34);
    obj.edit44:setField("Habilidade7");
    obj.edit44:setName("edit44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(345);
    obj.layout45:setTop(479);
    obj.layout45:setWidth(172);
    obj.layout45:setHeight(33);
    obj.layout45:setName("layout45");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout45);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(20.8);
    obj.edit45:setFontColor("#000000");
    lfm_setPropAsString(obj.edit45, "fontStyle",  "bold");
    obj.edit45:setHorzTextAlign("leading");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(172);
    obj.edit45:setHeight(34);
    obj.edit45:setField("Efeito7");
    obj.edit45:setName("edit45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(529);
    obj.layout46:setTop(480);
    obj.layout46:setWidth(77);
    obj.layout46:setHeight(35);
    obj.layout46:setName("layout46");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout46);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(20.8);
    obj.edit46:setFontColor("#000000");
    lfm_setPropAsString(obj.edit46, "fontStyle",  "bold");
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(77);
    obj.edit46:setHeight(36);
    obj.edit46:setField("Dur7");
    obj.edit46:setName("edit46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(613);
    obj.layout47:setTop(481);
    obj.layout47:setWidth(77);
    obj.layout47:setHeight(35);
    obj.layout47:setName("layout47");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout47);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(20.8);
    obj.edit47:setFontColor("#000000");
    lfm_setPropAsString(obj.edit47, "fontStyle",  "bold");
    obj.edit47:setHorzTextAlign("leading");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(77);
    obj.edit47:setHeight(36);
    obj.edit47:setField("Custo7");
    obj.edit47:setName("edit47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(697);
    obj.layout48:setTop(480);
    obj.layout48:setWidth(77);
    obj.layout48:setHeight(35);
    obj.layout48:setName("layout48");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout48);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(20.8);
    obj.edit48:setFontColor("#000000");
    lfm_setPropAsString(obj.edit48, "fontStyle",  "bold");
    obj.edit48:setHorzTextAlign("leading");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(77);
    obj.edit48:setHeight(36);
    obj.edit48:setField("Rol7");
    obj.edit48:setName("edit48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(784);
    obj.layout49:setTop(479);
    obj.layout49:setWidth(77);
    obj.layout49:setHeight(35);
    obj.layout49:setName("layout49");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout49);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(20.8);
    obj.edit49:setFontColor("#000000");
    lfm_setPropAsString(obj.edit49, "fontStyle",  "bold");
    obj.edit49:setHorzTextAlign("leading");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(77);
    obj.edit49:setHeight(36);
    obj.edit49:setField("Dif7");
    obj.edit49:setName("edit49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(80);
    obj.layout50:setTop(518);
    obj.layout50:setWidth(77);
    obj.layout50:setHeight(35);
    obj.layout50:setName("layout50");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout50);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(20.8);
    obj.edit50:setFontColor("#000000");
    lfm_setPropAsString(obj.edit50, "fontStyle",  "bold");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(77);
    obj.edit50:setHeight(36);
    obj.edit50:setField("Grau8");
    obj.edit50:setName("edit50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(166);
    obj.layout51:setTop(522);
    obj.layout51:setWidth(172);
    obj.layout51:setHeight(33);
    obj.layout51:setName("layout51");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout51);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(20.8);
    obj.edit51:setFontColor("#000000");
    lfm_setPropAsString(obj.edit51, "fontStyle",  "bold");
    obj.edit51:setHorzTextAlign("leading");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(172);
    obj.edit51:setHeight(34);
    obj.edit51:setField("Habilidade8");
    obj.edit51:setName("edit51");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(346);
    obj.layout52:setTop(522);
    obj.layout52:setWidth(172);
    obj.layout52:setHeight(33);
    obj.layout52:setName("layout52");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout52);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(20.8);
    obj.edit52:setFontColor("#000000");
    lfm_setPropAsString(obj.edit52, "fontStyle",  "bold");
    obj.edit52:setHorzTextAlign("leading");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(172);
    obj.edit52:setHeight(34);
    obj.edit52:setField("Efeito8");
    obj.edit52:setName("edit52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(528);
    obj.layout53:setTop(518);
    obj.layout53:setWidth(77);
    obj.layout53:setHeight(35);
    obj.layout53:setName("layout53");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout53);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(20.8);
    obj.edit53:setFontColor("#000000");
    lfm_setPropAsString(obj.edit53, "fontStyle",  "bold");
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(77);
    obj.edit53:setHeight(36);
    obj.edit53:setField("Dur8");
    obj.edit53:setName("edit53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(611);
    obj.layout54:setTop(519);
    obj.layout54:setWidth(77);
    obj.layout54:setHeight(35);
    obj.layout54:setName("layout54");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout54);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(20.8);
    obj.edit54:setFontColor("#000000");
    lfm_setPropAsString(obj.edit54, "fontStyle",  "bold");
    obj.edit54:setHorzTextAlign("leading");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(77);
    obj.edit54:setHeight(36);
    obj.edit54:setField("Custo8");
    obj.edit54:setName("edit54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(696);
    obj.layout55:setTop(519);
    obj.layout55:setWidth(77);
    obj.layout55:setHeight(35);
    obj.layout55:setName("layout55");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout55);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(20.8);
    obj.edit55:setFontColor("#000000");
    lfm_setPropAsString(obj.edit55, "fontStyle",  "bold");
    obj.edit55:setHorzTextAlign("leading");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(77);
    obj.edit55:setHeight(36);
    obj.edit55:setField("Rol8");
    obj.edit55:setName("edit55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(783);
    obj.layout56:setTop(517);
    obj.layout56:setWidth(77);
    obj.layout56:setHeight(35);
    obj.layout56:setName("layout56");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout56);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(20.8);
    obj.edit56:setFontColor("#000000");
    lfm_setPropAsString(obj.edit56, "fontStyle",  "bold");
    obj.edit56:setHorzTextAlign("leading");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(77);
    obj.edit56:setHeight(36);
    obj.edit56:setField("Dif8");
    obj.edit56:setName("edit56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(81);
    obj.layout57:setTop(560);
    obj.layout57:setWidth(77);
    obj.layout57:setHeight(35);
    obj.layout57:setName("layout57");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout57);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(20.8);
    obj.edit57:setFontColor("#000000");
    lfm_setPropAsString(obj.edit57, "fontStyle",  "bold");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(77);
    obj.edit57:setHeight(36);
    obj.edit57:setField("Grau9");
    obj.edit57:setName("edit57");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(166);
    obj.layout58:setTop(560);
    obj.layout58:setWidth(172);
    obj.layout58:setHeight(33);
    obj.layout58:setName("layout58");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout58);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(20.8);
    obj.edit58:setFontColor("#000000");
    lfm_setPropAsString(obj.edit58, "fontStyle",  "bold");
    obj.edit58:setHorzTextAlign("leading");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(172);
    obj.edit58:setHeight(34);
    obj.edit58:setField("Habilidade9");
    obj.edit58:setName("edit58");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(346);
    obj.layout59:setTop(560);
    obj.layout59:setWidth(172);
    obj.layout59:setHeight(33);
    obj.layout59:setName("layout59");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout59);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(20.8);
    obj.edit59:setFontColor("#000000");
    lfm_setPropAsString(obj.edit59, "fontStyle",  "bold");
    obj.edit59:setHorzTextAlign("leading");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(172);
    obj.edit59:setHeight(34);
    obj.edit59:setField("Efeito9");
    obj.edit59:setName("edit59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(528);
    obj.layout60:setTop(560);
    obj.layout60:setWidth(77);
    obj.layout60:setHeight(35);
    obj.layout60:setName("layout60");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout60);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(20.8);
    obj.edit60:setFontColor("#000000");
    lfm_setPropAsString(obj.edit60, "fontStyle",  "bold");
    obj.edit60:setHorzTextAlign("leading");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(77);
    obj.edit60:setHeight(36);
    obj.edit60:setField("Dur9");
    obj.edit60:setName("edit60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(612);
    obj.layout61:setTop(561);
    obj.layout61:setWidth(77);
    obj.layout61:setHeight(35);
    obj.layout61:setName("layout61");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout61);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(20.8);
    obj.edit61:setFontColor("#000000");
    lfm_setPropAsString(obj.edit61, "fontStyle",  "bold");
    obj.edit61:setHorzTextAlign("leading");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(77);
    obj.edit61:setHeight(36);
    obj.edit61:setField("Custo9");
    obj.edit61:setName("edit61");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(697);
    obj.layout62:setTop(560);
    obj.layout62:setWidth(77);
    obj.layout62:setHeight(35);
    obj.layout62:setName("layout62");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout62);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(20.8);
    obj.edit62:setFontColor("#000000");
    lfm_setPropAsString(obj.edit62, "fontStyle",  "bold");
    obj.edit62:setHorzTextAlign("leading");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(77);
    obj.edit62:setHeight(36);
    obj.edit62:setField("Rol9");
    obj.edit62:setName("edit62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(783);
    obj.layout63:setTop(559);
    obj.layout63:setWidth(77);
    obj.layout63:setHeight(35);
    obj.layout63:setName("layout63");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout63);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(20.8);
    obj.edit63:setFontColor("#000000");
    lfm_setPropAsString(obj.edit63, "fontStyle",  "bold");
    obj.edit63:setHorzTextAlign("leading");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(77);
    obj.edit63:setHeight(36);
    obj.edit63:setField("Dif9");
    obj.edit63:setName("edit63");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(80);
    obj.layout64:setTop(600);
    obj.layout64:setWidth(77);
    obj.layout64:setHeight(35);
    obj.layout64:setName("layout64");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout64);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(20.8);
    obj.edit64:setFontColor("#000000");
    lfm_setPropAsString(obj.edit64, "fontStyle",  "bold");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(77);
    obj.edit64:setHeight(36);
    obj.edit64:setField("Grau10");
    obj.edit64:setName("edit64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(165);
    obj.layout65:setTop(602);
    obj.layout65:setWidth(172);
    obj.layout65:setHeight(33);
    obj.layout65:setName("layout65");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout65);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(20.8);
    obj.edit65:setFontColor("#000000");
    lfm_setPropAsString(obj.edit65, "fontStyle",  "bold");
    obj.edit65:setHorzTextAlign("leading");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(172);
    obj.edit65:setHeight(34);
    obj.edit65:setField("Habilidade10");
    obj.edit65:setName("edit65");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(345);
    obj.layout66:setTop(602);
    obj.layout66:setWidth(172);
    obj.layout66:setHeight(33);
    obj.layout66:setName("layout66");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout66);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(20.8);
    obj.edit66:setFontColor("#000000");
    lfm_setPropAsString(obj.edit66, "fontStyle",  "bold");
    obj.edit66:setHorzTextAlign("leading");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(172);
    obj.edit66:setHeight(34);
    obj.edit66:setField("Efeito10");
    obj.edit66:setName("edit66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(527);
    obj.layout67:setTop(601);
    obj.layout67:setWidth(77);
    obj.layout67:setHeight(35);
    obj.layout67:setName("layout67");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout67);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(20.8);
    obj.edit67:setFontColor("#000000");
    lfm_setPropAsString(obj.edit67, "fontStyle",  "bold");
    obj.edit67:setHorzTextAlign("leading");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(77);
    obj.edit67:setHeight(36);
    obj.edit67:setField("Dur10");
    obj.edit67:setName("edit67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(611);
    obj.layout68:setTop(601);
    obj.layout68:setWidth(77);
    obj.layout68:setHeight(35);
    obj.layout68:setName("layout68");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout68);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(20.8);
    obj.edit68:setFontColor("#000000");
    lfm_setPropAsString(obj.edit68, "fontStyle",  "bold");
    obj.edit68:setHorzTextAlign("leading");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(77);
    obj.edit68:setHeight(36);
    obj.edit68:setField("Custo10");
    obj.edit68:setName("edit68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(696);
    obj.layout69:setTop(601);
    obj.layout69:setWidth(77);
    obj.layout69:setHeight(35);
    obj.layout69:setName("layout69");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout69);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(20.8);
    obj.edit69:setFontColor("#000000");
    lfm_setPropAsString(obj.edit69, "fontStyle",  "bold");
    obj.edit69:setHorzTextAlign("leading");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(77);
    obj.edit69:setHeight(36);
    obj.edit69:setField("Rol10");
    obj.edit69:setName("edit69");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(782);
    obj.layout70:setTop(600);
    obj.layout70:setWidth(77);
    obj.layout70:setHeight(35);
    obj.layout70:setName("layout70");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout70);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(20.8);
    obj.edit70:setFontColor("#000000");
    lfm_setPropAsString(obj.edit70, "fontStyle",  "bold");
    obj.edit70:setHorzTextAlign("leading");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(77);
    obj.edit70:setHeight(36);
    obj.edit70:setField("Dif10");
    obj.edit70:setName("edit70");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(80);
    obj.layout71:setTop(639);
    obj.layout71:setWidth(77);
    obj.layout71:setHeight(35);
    obj.layout71:setName("layout71");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout71);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(20.8);
    obj.edit71:setFontColor("#000000");
    lfm_setPropAsString(obj.edit71, "fontStyle",  "bold");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(77);
    obj.edit71:setHeight(36);
    obj.edit71:setField("Grau11");
    obj.edit71:setName("edit71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(166);
    obj.layout72:setTop(640);
    obj.layout72:setWidth(172);
    obj.layout72:setHeight(33);
    obj.layout72:setName("layout72");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout72);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(20.8);
    obj.edit72:setFontColor("#000000");
    lfm_setPropAsString(obj.edit72, "fontStyle",  "bold");
    obj.edit72:setHorzTextAlign("leading");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(172);
    obj.edit72:setHeight(34);
    obj.edit72:setField("Habilidade11");
    obj.edit72:setName("edit72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(346);
    obj.layout73:setTop(640);
    obj.layout73:setWidth(172);
    obj.layout73:setHeight(33);
    obj.layout73:setName("layout73");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout73);
    obj.edit73:setTransparent(true);
    obj.edit73:setFontSize(20.8);
    obj.edit73:setFontColor("#000000");
    lfm_setPropAsString(obj.edit73, "fontStyle",  "bold");
    obj.edit73:setHorzTextAlign("leading");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(172);
    obj.edit73:setHeight(34);
    obj.edit73:setField("Efeito11");
    obj.edit73:setName("edit73");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(527);
    obj.layout74:setTop(640);
    obj.layout74:setWidth(77);
    obj.layout74:setHeight(35);
    obj.layout74:setName("layout74");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout74);
    obj.edit74:setTransparent(true);
    obj.edit74:setFontSize(20.8);
    obj.edit74:setFontColor("#000000");
    lfm_setPropAsString(obj.edit74, "fontStyle",  "bold");
    obj.edit74:setHorzTextAlign("leading");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(77);
    obj.edit74:setHeight(36);
    obj.edit74:setField("Dur11");
    obj.edit74:setName("edit74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(611);
    obj.layout75:setTop(641);
    obj.layout75:setWidth(77);
    obj.layout75:setHeight(35);
    obj.layout75:setName("layout75");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout75);
    obj.edit75:setTransparent(true);
    obj.edit75:setFontSize(20.8);
    obj.edit75:setFontColor("#000000");
    lfm_setPropAsString(obj.edit75, "fontStyle",  "bold");
    obj.edit75:setHorzTextAlign("leading");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(0);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(77);
    obj.edit75:setHeight(36);
    obj.edit75:setField("Custo11");
    obj.edit75:setName("edit75");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(696);
    obj.layout76:setTop(641);
    obj.layout76:setWidth(77);
    obj.layout76:setHeight(35);
    obj.layout76:setName("layout76");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout76);
    obj.edit76:setTransparent(true);
    obj.edit76:setFontSize(20.8);
    obj.edit76:setFontColor("#000000");
    lfm_setPropAsString(obj.edit76, "fontStyle",  "bold");
    obj.edit76:setHorzTextAlign("leading");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(77);
    obj.edit76:setHeight(36);
    obj.edit76:setField("Rol11");
    obj.edit76:setName("edit76");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(782);
    obj.layout77:setTop(639);
    obj.layout77:setWidth(77);
    obj.layout77:setHeight(35);
    obj.layout77:setName("layout77");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout77);
    obj.edit77:setTransparent(true);
    obj.edit77:setFontSize(20.8);
    obj.edit77:setFontColor("#000000");
    lfm_setPropAsString(obj.edit77, "fontStyle",  "bold");
    obj.edit77:setHorzTextAlign("leading");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(77);
    obj.edit77:setHeight(36);
    obj.edit77:setField("Dif11");
    obj.edit77:setName("edit77");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(82);
    obj.layout78:setTop(678);
    obj.layout78:setWidth(77);
    obj.layout78:setHeight(35);
    obj.layout78:setName("layout78");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout78);
    obj.edit78:setTransparent(true);
    obj.edit78:setFontSize(20.8);
    obj.edit78:setFontColor("#000000");
    lfm_setPropAsString(obj.edit78, "fontStyle",  "bold");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(77);
    obj.edit78:setHeight(36);
    obj.edit78:setField("Grau12");
    obj.edit78:setName("edit78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(167);
    obj.layout79:setTop(678);
    obj.layout79:setWidth(172);
    obj.layout79:setHeight(33);
    obj.layout79:setName("layout79");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout79);
    obj.edit79:setTransparent(true);
    obj.edit79:setFontSize(20.8);
    obj.edit79:setFontColor("#000000");
    lfm_setPropAsString(obj.edit79, "fontStyle",  "bold");
    obj.edit79:setHorzTextAlign("leading");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(172);
    obj.edit79:setHeight(34);
    obj.edit79:setField("Habilidade12");
    obj.edit79:setName("edit79");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(347);
    obj.layout80:setTop(677);
    obj.layout80:setWidth(172);
    obj.layout80:setHeight(33);
    obj.layout80:setName("layout80");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout80);
    obj.edit80:setTransparent(true);
    obj.edit80:setFontSize(20.8);
    obj.edit80:setFontColor("#000000");
    lfm_setPropAsString(obj.edit80, "fontStyle",  "bold");
    obj.edit80:setHorzTextAlign("leading");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(172);
    obj.edit80:setHeight(34);
    obj.edit80:setField("Efeito12");
    obj.edit80:setName("edit80");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(528);
    obj.layout81:setTop(681);
    obj.layout81:setWidth(77);
    obj.layout81:setHeight(35);
    obj.layout81:setName("layout81");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout81);
    obj.edit81:setTransparent(true);
    obj.edit81:setFontSize(20.8);
    obj.edit81:setFontColor("#000000");
    lfm_setPropAsString(obj.edit81, "fontStyle",  "bold");
    obj.edit81:setHorzTextAlign("leading");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(0);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(77);
    obj.edit81:setHeight(36);
    obj.edit81:setField("Dur12");
    obj.edit81:setName("edit81");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(612);
    obj.layout82:setTop(681);
    obj.layout82:setWidth(77);
    obj.layout82:setHeight(35);
    obj.layout82:setName("layout82");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout82);
    obj.edit82:setTransparent(true);
    obj.edit82:setFontSize(20.8);
    obj.edit82:setFontColor("#000000");
    lfm_setPropAsString(obj.edit82, "fontStyle",  "bold");
    obj.edit82:setHorzTextAlign("leading");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(77);
    obj.edit82:setHeight(36);
    obj.edit82:setField("Custo12");
    obj.edit82:setName("edit82");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(697);
    obj.layout83:setTop(681);
    obj.layout83:setWidth(77);
    obj.layout83:setHeight(35);
    obj.layout83:setName("layout83");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout83);
    obj.edit83:setTransparent(true);
    obj.edit83:setFontSize(20.8);
    obj.edit83:setFontColor("#000000");
    lfm_setPropAsString(obj.edit83, "fontStyle",  "bold");
    obj.edit83:setHorzTextAlign("leading");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(0);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(77);
    obj.edit83:setHeight(36);
    obj.edit83:setField("Rol12");
    obj.edit83:setName("edit83");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(783);
    obj.layout84:setTop(680);
    obj.layout84:setWidth(77);
    obj.layout84:setHeight(35);
    obj.layout84:setName("layout84");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout84);
    obj.edit84:setTransparent(true);
    obj.edit84:setFontSize(20.8);
    obj.edit84:setFontColor("#000000");
    lfm_setPropAsString(obj.edit84, "fontStyle",  "bold");
    obj.edit84:setHorzTextAlign("leading");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(0);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(77);
    obj.edit84:setHeight(36);
    obj.edit84:setField("Dif12");
    obj.edit84:setName("edit84");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(81);
    obj.layout85:setTop(719);
    obj.layout85:setWidth(77);
    obj.layout85:setHeight(35);
    obj.layout85:setName("layout85");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout85);
    obj.edit85:setTransparent(true);
    obj.edit85:setFontSize(20.8);
    obj.edit85:setFontColor("#000000");
    lfm_setPropAsString(obj.edit85, "fontStyle",  "bold");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(0);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(77);
    obj.edit85:setHeight(36);
    obj.edit85:setField("Grau13");
    obj.edit85:setName("edit85");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(166);
    obj.layout86:setTop(718);
    obj.layout86:setWidth(172);
    obj.layout86:setHeight(33);
    obj.layout86:setName("layout86");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout86);
    obj.edit86:setTransparent(true);
    obj.edit86:setFontSize(20.8);
    obj.edit86:setFontColor("#000000");
    lfm_setPropAsString(obj.edit86, "fontStyle",  "bold");
    obj.edit86:setHorzTextAlign("leading");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(0);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(172);
    obj.edit86:setHeight(34);
    obj.edit86:setField("Habilidade13");
    obj.edit86:setName("edit86");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(346);
    obj.layout87:setTop(717);
    obj.layout87:setWidth(172);
    obj.layout87:setHeight(33);
    obj.layout87:setName("layout87");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout87);
    obj.edit87:setTransparent(true);
    obj.edit87:setFontSize(20.8);
    obj.edit87:setFontColor("#000000");
    lfm_setPropAsString(obj.edit87, "fontStyle",  "bold");
    obj.edit87:setHorzTextAlign("leading");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(0);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(172);
    obj.edit87:setHeight(34);
    obj.edit87:setField("Efeito13");
    obj.edit87:setName("edit87");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(528);
    obj.layout88:setTop(719);
    obj.layout88:setWidth(77);
    obj.layout88:setHeight(35);
    obj.layout88:setName("layout88");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout88);
    obj.edit88:setTransparent(true);
    obj.edit88:setFontSize(20.8);
    obj.edit88:setFontColor("#000000");
    lfm_setPropAsString(obj.edit88, "fontStyle",  "bold");
    obj.edit88:setHorzTextAlign("leading");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(0);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(77);
    obj.edit88:setHeight(36);
    obj.edit88:setField("Dur13");
    obj.edit88:setName("edit88");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(611);
    obj.layout89:setTop(719);
    obj.layout89:setWidth(77);
    obj.layout89:setHeight(35);
    obj.layout89:setName("layout89");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout89);
    obj.edit89:setTransparent(true);
    obj.edit89:setFontSize(20.8);
    obj.edit89:setFontColor("#000000");
    lfm_setPropAsString(obj.edit89, "fontStyle",  "bold");
    obj.edit89:setHorzTextAlign("leading");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(0);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(77);
    obj.edit89:setHeight(36);
    obj.edit89:setField("Custo13");
    obj.edit89:setName("edit89");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(696);
    obj.layout90:setTop(719);
    obj.layout90:setWidth(77);
    obj.layout90:setHeight(35);
    obj.layout90:setName("layout90");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout90);
    obj.edit90:setTransparent(true);
    obj.edit90:setFontSize(20.8);
    obj.edit90:setFontColor("#000000");
    lfm_setPropAsString(obj.edit90, "fontStyle",  "bold");
    obj.edit90:setHorzTextAlign("leading");
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(0);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(77);
    obj.edit90:setHeight(36);
    obj.edit90:setField("Rol13");
    obj.edit90:setName("edit90");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(783);
    obj.layout91:setTop(718);
    obj.layout91:setWidth(77);
    obj.layout91:setHeight(35);
    obj.layout91:setName("layout91");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout91);
    obj.edit91:setTransparent(true);
    obj.edit91:setFontSize(20.8);
    obj.edit91:setFontColor("#000000");
    lfm_setPropAsString(obj.edit91, "fontStyle",  "bold");
    obj.edit91:setHorzTextAlign("leading");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(77);
    obj.edit91:setHeight(36);
    obj.edit91:setField("Dif13");
    obj.edit91:setName("edit91");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(81);
    obj.layout92:setTop(759);
    obj.layout92:setWidth(77);
    obj.layout92:setHeight(35);
    obj.layout92:setName("layout92");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout92);
    obj.edit92:setTransparent(true);
    obj.edit92:setFontSize(20.8);
    obj.edit92:setFontColor("#000000");
    lfm_setPropAsString(obj.edit92, "fontStyle",  "bold");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(0);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(77);
    obj.edit92:setHeight(36);
    obj.edit92:setField("Grau14");
    obj.edit92:setName("edit92");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(167);
    obj.layout93:setTop(759);
    obj.layout93:setWidth(172);
    obj.layout93:setHeight(33);
    obj.layout93:setName("layout93");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout93);
    obj.edit93:setTransparent(true);
    obj.edit93:setFontSize(20.8);
    obj.edit93:setFontColor("#000000");
    lfm_setPropAsString(obj.edit93, "fontStyle",  "bold");
    obj.edit93:setHorzTextAlign("leading");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(0);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(172);
    obj.edit93:setHeight(34);
    obj.edit93:setField("Habilidade14");
    obj.edit93:setName("edit93");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(347);
    obj.layout94:setTop(759);
    obj.layout94:setWidth(172);
    obj.layout94:setHeight(33);
    obj.layout94:setName("layout94");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout94);
    obj.edit94:setTransparent(true);
    obj.edit94:setFontSize(20.8);
    obj.edit94:setFontColor("#000000");
    lfm_setPropAsString(obj.edit94, "fontStyle",  "bold");
    obj.edit94:setHorzTextAlign("leading");
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(0);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(172);
    obj.edit94:setHeight(34);
    obj.edit94:setField("Efeito14");
    obj.edit94:setName("edit94");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(529);
    obj.layout95:setTop(759);
    obj.layout95:setWidth(77);
    obj.layout95:setHeight(35);
    obj.layout95:setName("layout95");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout95);
    obj.edit95:setTransparent(true);
    obj.edit95:setFontSize(20.8);
    obj.edit95:setFontColor("#000000");
    lfm_setPropAsString(obj.edit95, "fontStyle",  "bold");
    obj.edit95:setHorzTextAlign("leading");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(0);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(77);
    obj.edit95:setHeight(36);
    obj.edit95:setField("Dur14");
    obj.edit95:setName("edit95");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(612);
    obj.layout96:setTop(760);
    obj.layout96:setWidth(77);
    obj.layout96:setHeight(35);
    obj.layout96:setName("layout96");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout96);
    obj.edit96:setTransparent(true);
    obj.edit96:setFontSize(20.8);
    obj.edit96:setFontColor("#000000");
    lfm_setPropAsString(obj.edit96, "fontStyle",  "bold");
    obj.edit96:setHorzTextAlign("leading");
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(0);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(77);
    obj.edit96:setHeight(36);
    obj.edit96:setField("Custo14");
    obj.edit96:setName("edit96");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(697);
    obj.layout97:setTop(760);
    obj.layout97:setWidth(77);
    obj.layout97:setHeight(35);
    obj.layout97:setName("layout97");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout97);
    obj.edit97:setTransparent(true);
    obj.edit97:setFontSize(20.8);
    obj.edit97:setFontColor("#000000");
    lfm_setPropAsString(obj.edit97, "fontStyle",  "bold");
    obj.edit97:setHorzTextAlign("leading");
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setLeft(0);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(77);
    obj.edit97:setHeight(36);
    obj.edit97:setField("Rol14");
    obj.edit97:setName("edit97");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(783);
    obj.layout98:setTop(758);
    obj.layout98:setWidth(77);
    obj.layout98:setHeight(35);
    obj.layout98:setName("layout98");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout98);
    obj.edit98:setTransparent(true);
    obj.edit98:setFontSize(20.8);
    obj.edit98:setFontColor("#000000");
    lfm_setPropAsString(obj.edit98, "fontStyle",  "bold");
    obj.edit98:setHorzTextAlign("leading");
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setLeft(0);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(77);
    obj.edit98:setHeight(36);
    obj.edit98:setField("Dif14");
    obj.edit98:setName("edit98");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(81);
    obj.layout99:setTop(800);
    obj.layout99:setWidth(77);
    obj.layout99:setHeight(35);
    obj.layout99:setName("layout99");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout99);
    obj.edit99:setTransparent(true);
    obj.edit99:setFontSize(20.8);
    obj.edit99:setFontColor("#000000");
    lfm_setPropAsString(obj.edit99, "fontStyle",  "bold");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setLeft(0);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(77);
    obj.edit99:setHeight(36);
    obj.edit99:setField("Grau15");
    obj.edit99:setName("edit99");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(166);
    obj.layout100:setTop(799);
    obj.layout100:setWidth(172);
    obj.layout100:setHeight(33);
    obj.layout100:setName("layout100");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout100);
    obj.edit100:setTransparent(true);
    obj.edit100:setFontSize(20.8);
    obj.edit100:setFontColor("#000000");
    lfm_setPropAsString(obj.edit100, "fontStyle",  "bold");
    obj.edit100:setHorzTextAlign("leading");
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setLeft(0);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(172);
    obj.edit100:setHeight(34);
    obj.edit100:setField("Habilidade15");
    obj.edit100:setName("edit100");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(346);
    obj.layout101:setTop(799);
    obj.layout101:setWidth(172);
    obj.layout101:setHeight(33);
    obj.layout101:setName("layout101");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout101);
    obj.edit101:setTransparent(true);
    obj.edit101:setFontSize(20.8);
    obj.edit101:setFontColor("#000000");
    lfm_setPropAsString(obj.edit101, "fontStyle",  "bold");
    obj.edit101:setHorzTextAlign("leading");
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setLeft(0);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(172);
    obj.edit101:setHeight(34);
    obj.edit101:setField("Efeito15");
    obj.edit101:setName("edit101");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(527);
    obj.layout102:setTop(800);
    obj.layout102:setWidth(77);
    obj.layout102:setHeight(35);
    obj.layout102:setName("layout102");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout102);
    obj.edit102:setTransparent(true);
    obj.edit102:setFontSize(20.8);
    obj.edit102:setFontColor("#000000");
    lfm_setPropAsString(obj.edit102, "fontStyle",  "bold");
    obj.edit102:setHorzTextAlign("leading");
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setLeft(0);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(77);
    obj.edit102:setHeight(36);
    obj.edit102:setField("Dur15");
    obj.edit102:setName("edit102");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(611);
    obj.layout103:setTop(800);
    obj.layout103:setWidth(77);
    obj.layout103:setHeight(35);
    obj.layout103:setName("layout103");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout103);
    obj.edit103:setTransparent(true);
    obj.edit103:setFontSize(20.8);
    obj.edit103:setFontColor("#000000");
    lfm_setPropAsString(obj.edit103, "fontStyle",  "bold");
    obj.edit103:setHorzTextAlign("leading");
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setLeft(0);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(77);
    obj.edit103:setHeight(36);
    obj.edit103:setField("Custo15");
    obj.edit103:setName("edit103");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(696);
    obj.layout104:setTop(800);
    obj.layout104:setWidth(77);
    obj.layout104:setHeight(35);
    obj.layout104:setName("layout104");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout104);
    obj.edit104:setTransparent(true);
    obj.edit104:setFontSize(20.8);
    obj.edit104:setFontColor("#000000");
    lfm_setPropAsString(obj.edit104, "fontStyle",  "bold");
    obj.edit104:setHorzTextAlign("leading");
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setLeft(0);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(77);
    obj.edit104:setHeight(36);
    obj.edit104:setField("Rol15");
    obj.edit104:setName("edit104");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(782);
    obj.layout105:setTop(799);
    obj.layout105:setWidth(77);
    obj.layout105:setHeight(35);
    obj.layout105:setName("layout105");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout105);
    obj.edit105:setTransparent(true);
    obj.edit105:setFontSize(20.8);
    obj.edit105:setFontColor("#000000");
    lfm_setPropAsString(obj.edit105, "fontStyle",  "bold");
    obj.edit105:setHorzTextAlign("leading");
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setLeft(0);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(77);
    obj.edit105:setHeight(36);
    obj.edit105:setField("Dif15");
    obj.edit105:setName("edit105");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(80);
    obj.layout106:setTop(838);
    obj.layout106:setWidth(77);
    obj.layout106:setHeight(35);
    obj.layout106:setName("layout106");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout106);
    obj.edit106:setTransparent(true);
    obj.edit106:setFontSize(20.8);
    obj.edit106:setFontColor("#000000");
    lfm_setPropAsString(obj.edit106, "fontStyle",  "bold");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(0);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(77);
    obj.edit106:setHeight(36);
    obj.edit106:setField("Grau16");
    obj.edit106:setName("edit106");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(165);
    obj.layout107:setTop(839);
    obj.layout107:setWidth(172);
    obj.layout107:setHeight(33);
    obj.layout107:setName("layout107");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout107);
    obj.edit107:setTransparent(true);
    obj.edit107:setFontSize(20.8);
    obj.edit107:setFontColor("#000000");
    lfm_setPropAsString(obj.edit107, "fontStyle",  "bold");
    obj.edit107:setHorzTextAlign("leading");
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(0);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(172);
    obj.edit107:setHeight(34);
    obj.edit107:setField("Habilidade16");
    obj.edit107:setName("edit107");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(345);
    obj.layout108:setTop(838);
    obj.layout108:setWidth(172);
    obj.layout108:setHeight(33);
    obj.layout108:setName("layout108");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout108);
    obj.edit108:setTransparent(true);
    obj.edit108:setFontSize(20.8);
    obj.edit108:setFontColor("#000000");
    lfm_setPropAsString(obj.edit108, "fontStyle",  "bold");
    obj.edit108:setHorzTextAlign("leading");
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(0);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(172);
    obj.edit108:setHeight(34);
    obj.edit108:setField("Efeito16");
    obj.edit108:setName("edit108");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(529);
    obj.layout109:setTop(837);
    obj.layout109:setWidth(77);
    obj.layout109:setHeight(35);
    obj.layout109:setName("layout109");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout109);
    obj.edit109:setTransparent(true);
    obj.edit109:setFontSize(20.8);
    obj.edit109:setFontColor("#000000");
    lfm_setPropAsString(obj.edit109, "fontStyle",  "bold");
    obj.edit109:setHorzTextAlign("leading");
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setLeft(0);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(77);
    obj.edit109:setHeight(36);
    obj.edit109:setField("Dur16");
    obj.edit109:setName("edit109");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(612);
    obj.layout110:setTop(838);
    obj.layout110:setWidth(77);
    obj.layout110:setHeight(35);
    obj.layout110:setName("layout110");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout110);
    obj.edit110:setTransparent(true);
    obj.edit110:setFontSize(20.8);
    obj.edit110:setFontColor("#000000");
    lfm_setPropAsString(obj.edit110, "fontStyle",  "bold");
    obj.edit110:setHorzTextAlign("leading");
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setLeft(0);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(77);
    obj.edit110:setHeight(36);
    obj.edit110:setField("Custo16");
    obj.edit110:setName("edit110");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle1);
    obj.layout111:setLeft(697);
    obj.layout111:setTop(837);
    obj.layout111:setWidth(77);
    obj.layout111:setHeight(35);
    obj.layout111:setName("layout111");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout111);
    obj.edit111:setTransparent(true);
    obj.edit111:setFontSize(20.8);
    obj.edit111:setFontColor("#000000");
    lfm_setPropAsString(obj.edit111, "fontStyle",  "bold");
    obj.edit111:setHorzTextAlign("leading");
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setLeft(0);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(77);
    obj.edit111:setHeight(36);
    obj.edit111:setField("Rol16");
    obj.edit111:setName("edit111");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle1);
    obj.layout112:setLeft(783);
    obj.layout112:setTop(836);
    obj.layout112:setWidth(77);
    obj.layout112:setHeight(35);
    obj.layout112:setName("layout112");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout112);
    obj.edit112:setTransparent(true);
    obj.edit112:setFontSize(20.8);
    obj.edit112:setFontColor("#000000");
    lfm_setPropAsString(obj.edit112, "fontStyle",  "bold");
    obj.edit112:setHorzTextAlign("leading");
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setLeft(0);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(77);
    obj.edit112:setHeight(36);
    obj.edit112:setField("Dif16");
    obj.edit112:setName("edit112");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle1);
    obj.layout113:setLeft(79);
    obj.layout113:setTop(877);
    obj.layout113:setWidth(77);
    obj.layout113:setHeight(35);
    obj.layout113:setName("layout113");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout113);
    obj.edit113:setTransparent(true);
    obj.edit113:setFontSize(20.8);
    obj.edit113:setFontColor("#000000");
    lfm_setPropAsString(obj.edit113, "fontStyle",  "bold");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setLeft(0);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(77);
    obj.edit113:setHeight(36);
    obj.edit113:setField("Grau17");
    obj.edit113:setName("edit113");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle1);
    obj.layout114:setLeft(166);
    obj.layout114:setTop(881);
    obj.layout114:setWidth(172);
    obj.layout114:setHeight(33);
    obj.layout114:setName("layout114");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout114);
    obj.edit114:setTransparent(true);
    obj.edit114:setFontSize(20.8);
    obj.edit114:setFontColor("#000000");
    lfm_setPropAsString(obj.edit114, "fontStyle",  "bold");
    obj.edit114:setHorzTextAlign("leading");
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setLeft(0);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(172);
    obj.edit114:setHeight(34);
    obj.edit114:setField("Habilidade17");
    obj.edit114:setName("edit114");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setLeft(346);
    obj.layout115:setTop(880);
    obj.layout115:setWidth(172);
    obj.layout115:setHeight(33);
    obj.layout115:setName("layout115");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout115);
    obj.edit115:setTransparent(true);
    obj.edit115:setFontSize(20.8);
    obj.edit115:setFontColor("#000000");
    lfm_setPropAsString(obj.edit115, "fontStyle",  "bold");
    obj.edit115:setHorzTextAlign("leading");
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setLeft(0);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(172);
    obj.edit115:setHeight(34);
    obj.edit115:setField("Efeito17");
    obj.edit115:setName("edit115");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle1);
    obj.layout116:setLeft(528);
    obj.layout116:setTop(880);
    obj.layout116:setWidth(77);
    obj.layout116:setHeight(35);
    obj.layout116:setName("layout116");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout116);
    obj.edit116:setTransparent(true);
    obj.edit116:setFontSize(20.8);
    obj.edit116:setFontColor("#000000");
    lfm_setPropAsString(obj.edit116, "fontStyle",  "bold");
    obj.edit116:setHorzTextAlign("leading");
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setLeft(0);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(77);
    obj.edit116:setHeight(36);
    obj.edit116:setField("Dur17");
    obj.edit116:setName("edit116");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle1);
    obj.layout117:setLeft(612);
    obj.layout117:setTop(880);
    obj.layout117:setWidth(77);
    obj.layout117:setHeight(35);
    obj.layout117:setName("layout117");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout117);
    obj.edit117:setTransparent(true);
    obj.edit117:setFontSize(20.8);
    obj.edit117:setFontColor("#000000");
    lfm_setPropAsString(obj.edit117, "fontStyle",  "bold");
    obj.edit117:setHorzTextAlign("leading");
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(0);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(77);
    obj.edit117:setHeight(36);
    obj.edit117:setField("Custo17");
    obj.edit117:setName("edit117");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle1);
    obj.layout118:setLeft(697);
    obj.layout118:setTop(880);
    obj.layout118:setWidth(77);
    obj.layout118:setHeight(35);
    obj.layout118:setName("layout118");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout118);
    obj.edit118:setTransparent(true);
    obj.edit118:setFontSize(20.8);
    obj.edit118:setFontColor("#000000");
    lfm_setPropAsString(obj.edit118, "fontStyle",  "bold");
    obj.edit118:setHorzTextAlign("leading");
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(0);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(77);
    obj.edit118:setHeight(36);
    obj.edit118:setField("Rol17");
    obj.edit118:setName("edit118");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle1);
    obj.layout119:setLeft(783);
    obj.layout119:setTop(879);
    obj.layout119:setWidth(77);
    obj.layout119:setHeight(35);
    obj.layout119:setName("layout119");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout119);
    obj.edit119:setTransparent(true);
    obj.edit119:setFontSize(20.8);
    obj.edit119:setFontColor("#000000");
    lfm_setPropAsString(obj.edit119, "fontStyle",  "bold");
    obj.edit119:setHorzTextAlign("leading");
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(0);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(77);
    obj.edit119:setHeight(36);
    obj.edit119:setField("Dif17");
    obj.edit119:setName("edit119");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle1);
    obj.layout120:setLeft(81);
    obj.layout120:setTop(919);
    obj.layout120:setWidth(77);
    obj.layout120:setHeight(35);
    obj.layout120:setName("layout120");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout120);
    obj.edit120:setTransparent(true);
    obj.edit120:setFontSize(20.8);
    obj.edit120:setFontColor("#000000");
    lfm_setPropAsString(obj.edit120, "fontStyle",  "bold");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(0);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(77);
    obj.edit120:setHeight(36);
    obj.edit120:setField("Grau18");
    obj.edit120:setName("edit120");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle1);
    obj.layout121:setLeft(166);
    obj.layout121:setTop(921);
    obj.layout121:setWidth(172);
    obj.layout121:setHeight(33);
    obj.layout121:setName("layout121");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout121);
    obj.edit121:setTransparent(true);
    obj.edit121:setFontSize(20.8);
    obj.edit121:setFontColor("#000000");
    lfm_setPropAsString(obj.edit121, "fontStyle",  "bold");
    obj.edit121:setHorzTextAlign("leading");
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(0);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(172);
    obj.edit121:setHeight(34);
    obj.edit121:setField("Habilidade18");
    obj.edit121:setName("edit121");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle1);
    obj.layout122:setLeft(346);
    obj.layout122:setTop(921);
    obj.layout122:setWidth(172);
    obj.layout122:setHeight(33);
    obj.layout122:setName("layout122");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout122);
    obj.edit122:setTransparent(true);
    obj.edit122:setFontSize(20.8);
    obj.edit122:setFontColor("#000000");
    lfm_setPropAsString(obj.edit122, "fontStyle",  "bold");
    obj.edit122:setHorzTextAlign("leading");
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(0);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(172);
    obj.edit122:setHeight(34);
    obj.edit122:setField("Efeito18");
    obj.edit122:setName("edit122");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle1);
    obj.layout123:setLeft(529);
    obj.layout123:setTop(919);
    obj.layout123:setWidth(77);
    obj.layout123:setHeight(35);
    obj.layout123:setName("layout123");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout123);
    obj.edit123:setTransparent(true);
    obj.edit123:setFontSize(20.8);
    obj.edit123:setFontColor("#000000");
    lfm_setPropAsString(obj.edit123, "fontStyle",  "bold");
    obj.edit123:setHorzTextAlign("leading");
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(0);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(77);
    obj.edit123:setHeight(36);
    obj.edit123:setField("Dur18");
    obj.edit123:setName("edit123");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle1);
    obj.layout124:setLeft(612);
    obj.layout124:setTop(919);
    obj.layout124:setWidth(77);
    obj.layout124:setHeight(35);
    obj.layout124:setName("layout124");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout124);
    obj.edit124:setTransparent(true);
    obj.edit124:setFontSize(20.8);
    obj.edit124:setFontColor("#000000");
    lfm_setPropAsString(obj.edit124, "fontStyle",  "bold");
    obj.edit124:setHorzTextAlign("leading");
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(0);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(77);
    obj.edit124:setHeight(36);
    obj.edit124:setField("Custo18");
    obj.edit124:setName("edit124");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle1);
    obj.layout125:setLeft(697);
    obj.layout125:setTop(919);
    obj.layout125:setWidth(77);
    obj.layout125:setHeight(35);
    obj.layout125:setName("layout125");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout125);
    obj.edit125:setTransparent(true);
    obj.edit125:setFontSize(20.8);
    obj.edit125:setFontColor("#000000");
    lfm_setPropAsString(obj.edit125, "fontStyle",  "bold");
    obj.edit125:setHorzTextAlign("leading");
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(0);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(77);
    obj.edit125:setHeight(36);
    obj.edit125:setField("Rol18");
    obj.edit125:setName("edit125");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle1);
    obj.layout126:setLeft(784);
    obj.layout126:setTop(918);
    obj.layout126:setWidth(77);
    obj.layout126:setHeight(35);
    obj.layout126:setName("layout126");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout126);
    obj.edit126:setTransparent(true);
    obj.edit126:setFontSize(20.8);
    obj.edit126:setFontColor("#000000");
    lfm_setPropAsString(obj.edit126, "fontStyle",  "bold");
    obj.edit126:setHorzTextAlign("leading");
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(0);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(77);
    obj.edit126:setHeight(36);
    obj.edit126:setField("Dif18");
    obj.edit126:setName("edit126");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle1);
    obj.layout127:setLeft(81);
    obj.layout127:setTop(959);
    obj.layout127:setWidth(77);
    obj.layout127:setHeight(35);
    obj.layout127:setName("layout127");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout127);
    obj.edit127:setTransparent(true);
    obj.edit127:setFontSize(20.8);
    obj.edit127:setFontColor("#000000");
    lfm_setPropAsString(obj.edit127, "fontStyle",  "bold");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(0);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(77);
    obj.edit127:setHeight(36);
    obj.edit127:setField("Grau19");
    obj.edit127:setName("edit127");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle1);
    obj.layout128:setLeft(166);
    obj.layout128:setTop(960);
    obj.layout128:setWidth(172);
    obj.layout128:setHeight(33);
    obj.layout128:setName("layout128");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout128);
    obj.edit128:setTransparent(true);
    obj.edit128:setFontSize(20.8);
    obj.edit128:setFontColor("#000000");
    lfm_setPropAsString(obj.edit128, "fontStyle",  "bold");
    obj.edit128:setHorzTextAlign("leading");
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(0);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(172);
    obj.edit128:setHeight(34);
    obj.edit128:setField("Habilidade19");
    obj.edit128:setName("edit128");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setLeft(346);
    obj.layout129:setTop(960);
    obj.layout129:setWidth(172);
    obj.layout129:setHeight(33);
    obj.layout129:setName("layout129");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout129);
    obj.edit129:setTransparent(true);
    obj.edit129:setFontSize(20.8);
    obj.edit129:setFontColor("#000000");
    lfm_setPropAsString(obj.edit129, "fontStyle",  "bold");
    obj.edit129:setHorzTextAlign("leading");
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(0);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(172);
    obj.edit129:setHeight(34);
    obj.edit129:setField("Efeito19");
    obj.edit129:setName("edit129");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setLeft(527);
    obj.layout130:setTop(958);
    obj.layout130:setWidth(77);
    obj.layout130:setHeight(35);
    obj.layout130:setName("layout130");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout130);
    obj.edit130:setTransparent(true);
    obj.edit130:setFontSize(20.8);
    obj.edit130:setFontColor("#000000");
    lfm_setPropAsString(obj.edit130, "fontStyle",  "bold");
    obj.edit130:setHorzTextAlign("leading");
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(0);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(77);
    obj.edit130:setHeight(36);
    obj.edit130:setField("Dur19");
    obj.edit130:setName("edit130");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setLeft(610);
    obj.layout131:setTop(958);
    obj.layout131:setWidth(77);
    obj.layout131:setHeight(35);
    obj.layout131:setName("layout131");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout131);
    obj.edit131:setTransparent(true);
    obj.edit131:setFontSize(20.8);
    obj.edit131:setFontColor("#000000");
    lfm_setPropAsString(obj.edit131, "fontStyle",  "bold");
    obj.edit131:setHorzTextAlign("leading");
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(0);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(77);
    obj.edit131:setHeight(36);
    obj.edit131:setField("Custo19");
    obj.edit131:setName("edit131");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle1);
    obj.layout132:setLeft(695);
    obj.layout132:setTop(958);
    obj.layout132:setWidth(77);
    obj.layout132:setHeight(35);
    obj.layout132:setName("layout132");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout132);
    obj.edit132:setTransparent(true);
    obj.edit132:setFontSize(20.8);
    obj.edit132:setFontColor("#000000");
    lfm_setPropAsString(obj.edit132, "fontStyle",  "bold");
    obj.edit132:setHorzTextAlign("leading");
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(0);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(77);
    obj.edit132:setHeight(36);
    obj.edit132:setField("Rol19");
    obj.edit132:setName("edit132");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle1);
    obj.layout133:setLeft(782);
    obj.layout133:setTop(957);
    obj.layout133:setWidth(77);
    obj.layout133:setHeight(35);
    obj.layout133:setName("layout133");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout133);
    obj.edit133:setTransparent(true);
    obj.edit133:setFontSize(20.8);
    obj.edit133:setFontColor("#000000");
    lfm_setPropAsString(obj.edit133, "fontStyle",  "bold");
    obj.edit133:setHorzTextAlign("leading");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setLeft(0);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(77);
    obj.edit133:setHeight(36);
    obj.edit133:setField("Dif19");
    obj.edit133:setName("edit133");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle1);
    obj.layout134:setLeft(81);
    obj.layout134:setTop(999);
    obj.layout134:setWidth(77);
    obj.layout134:setHeight(35);
    obj.layout134:setName("layout134");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout134);
    obj.edit134:setTransparent(true);
    obj.edit134:setFontSize(20.8);
    obj.edit134:setFontColor("#000000");
    lfm_setPropAsString(obj.edit134, "fontStyle",  "bold");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setLeft(0);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(77);
    obj.edit134:setHeight(36);
    obj.edit134:setField("Grau20");
    obj.edit134:setName("edit134");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle1);
    obj.layout135:setLeft(166);
    obj.layout135:setTop(998);
    obj.layout135:setWidth(172);
    obj.layout135:setHeight(33);
    obj.layout135:setName("layout135");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout135);
    obj.edit135:setTransparent(true);
    obj.edit135:setFontSize(20.8);
    obj.edit135:setFontColor("#000000");
    lfm_setPropAsString(obj.edit135, "fontStyle",  "bold");
    obj.edit135:setHorzTextAlign("leading");
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(0);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(172);
    obj.edit135:setHeight(34);
    obj.edit135:setField("Habilidade20");
    obj.edit135:setName("edit135");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle1);
    obj.layout136:setLeft(346);
    obj.layout136:setTop(998);
    obj.layout136:setWidth(172);
    obj.layout136:setHeight(33);
    obj.layout136:setName("layout136");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout136);
    obj.edit136:setTransparent(true);
    obj.edit136:setFontSize(20.8);
    obj.edit136:setFontColor("#000000");
    lfm_setPropAsString(obj.edit136, "fontStyle",  "bold");
    obj.edit136:setHorzTextAlign("leading");
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(0);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(172);
    obj.edit136:setHeight(34);
    obj.edit136:setField("Efeito20");
    obj.edit136:setName("edit136");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle1);
    obj.layout137:setLeft(529);
    obj.layout137:setTop(1000);
    obj.layout137:setWidth(77);
    obj.layout137:setHeight(35);
    obj.layout137:setName("layout137");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout137);
    obj.edit137:setTransparent(true);
    obj.edit137:setFontSize(20.8);
    obj.edit137:setFontColor("#000000");
    lfm_setPropAsString(obj.edit137, "fontStyle",  "bold");
    obj.edit137:setHorzTextAlign("leading");
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(0);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(77);
    obj.edit137:setHeight(36);
    obj.edit137:setField("Dur20");
    obj.edit137:setName("edit137");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle1);
    obj.layout138:setLeft(612);
    obj.layout138:setTop(1001);
    obj.layout138:setWidth(77);
    obj.layout138:setHeight(35);
    obj.layout138:setName("layout138");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout138);
    obj.edit138:setTransparent(true);
    obj.edit138:setFontSize(20.8);
    obj.edit138:setFontColor("#000000");
    lfm_setPropAsString(obj.edit138, "fontStyle",  "bold");
    obj.edit138:setHorzTextAlign("leading");
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(0);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(77);
    obj.edit138:setHeight(36);
    obj.edit138:setField("Custo20");
    obj.edit138:setName("edit138");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle1);
    obj.layout139:setLeft(697);
    obj.layout139:setTop(1001);
    obj.layout139:setWidth(77);
    obj.layout139:setHeight(35);
    obj.layout139:setName("layout139");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout139);
    obj.edit139:setTransparent(true);
    obj.edit139:setFontSize(20.8);
    obj.edit139:setFontColor("#000000");
    lfm_setPropAsString(obj.edit139, "fontStyle",  "bold");
    obj.edit139:setHorzTextAlign("leading");
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(0);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(77);
    obj.edit139:setHeight(36);
    obj.edit139:setField("Rol20");
    obj.edit139:setName("edit139");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle1);
    obj.layout140:setLeft(784);
    obj.layout140:setTop(999);
    obj.layout140:setWidth(77);
    obj.layout140:setHeight(35);
    obj.layout140:setName("layout140");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout140);
    obj.edit140:setTransparent(true);
    obj.edit140:setFontSize(20.8);
    obj.edit140:setFontColor("#000000");
    lfm_setPropAsString(obj.edit140, "fontStyle",  "bold");
    obj.edit140:setHorzTextAlign("leading");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setLeft(0);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(77);
    obj.edit140:setHeight(36);
    obj.edit140:setField("Dif20");
    obj.edit140:setName("edit140");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle1);
    obj.layout141:setLeft(80);
    obj.layout141:setTop(1038);
    obj.layout141:setWidth(77);
    obj.layout141:setHeight(35);
    obj.layout141:setName("layout141");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout141);
    obj.edit141:setTransparent(true);
    obj.edit141:setFontSize(20.8);
    obj.edit141:setFontColor("#000000");
    lfm_setPropAsString(obj.edit141, "fontStyle",  "bold");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setLeft(0);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(77);
    obj.edit141:setHeight(36);
    obj.edit141:setField("Grau21");
    obj.edit141:setName("edit141");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle1);
    obj.layout142:setLeft(165);
    obj.layout142:setTop(1039);
    obj.layout142:setWidth(172);
    obj.layout142:setHeight(33);
    obj.layout142:setName("layout142");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout142);
    obj.edit142:setTransparent(true);
    obj.edit142:setFontSize(20.8);
    obj.edit142:setFontColor("#000000");
    lfm_setPropAsString(obj.edit142, "fontStyle",  "bold");
    obj.edit142:setHorzTextAlign("leading");
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setLeft(0);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(172);
    obj.edit142:setHeight(34);
    obj.edit142:setField("Habilidade21");
    obj.edit142:setName("edit142");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle1);
    obj.layout143:setLeft(345);
    obj.layout143:setTop(1039);
    obj.layout143:setWidth(172);
    obj.layout143:setHeight(33);
    obj.layout143:setName("layout143");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout143);
    obj.edit143:setTransparent(true);
    obj.edit143:setFontSize(20.8);
    obj.edit143:setFontColor("#000000");
    lfm_setPropAsString(obj.edit143, "fontStyle",  "bold");
    obj.edit143:setHorzTextAlign("leading");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setLeft(0);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(172);
    obj.edit143:setHeight(34);
    obj.edit143:setField("Efeito21");
    obj.edit143:setName("edit143");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle1);
    obj.layout144:setLeft(526);
    obj.layout144:setTop(1039);
    obj.layout144:setWidth(77);
    obj.layout144:setHeight(35);
    obj.layout144:setName("layout144");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout144);
    obj.edit144:setTransparent(true);
    obj.edit144:setFontSize(20.8);
    obj.edit144:setFontColor("#000000");
    lfm_setPropAsString(obj.edit144, "fontStyle",  "bold");
    obj.edit144:setHorzTextAlign("leading");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setLeft(0);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(77);
    obj.edit144:setHeight(36);
    obj.edit144:setField("Dur21");
    obj.edit144:setName("edit144");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle1);
    obj.layout145:setLeft(610);
    obj.layout145:setTop(1039);
    obj.layout145:setWidth(77);
    obj.layout145:setHeight(35);
    obj.layout145:setName("layout145");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout145);
    obj.edit145:setTransparent(true);
    obj.edit145:setFontSize(20.8);
    obj.edit145:setFontColor("#000000");
    lfm_setPropAsString(obj.edit145, "fontStyle",  "bold");
    obj.edit145:setHorzTextAlign("leading");
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setLeft(0);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(77);
    obj.edit145:setHeight(36);
    obj.edit145:setField("Custo21");
    obj.edit145:setName("edit145");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.rectangle1);
    obj.layout146:setLeft(695);
    obj.layout146:setTop(1039);
    obj.layout146:setWidth(77);
    obj.layout146:setHeight(35);
    obj.layout146:setName("layout146");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout146);
    obj.edit146:setTransparent(true);
    obj.edit146:setFontSize(20.8);
    obj.edit146:setFontColor("#000000");
    lfm_setPropAsString(obj.edit146, "fontStyle",  "bold");
    obj.edit146:setHorzTextAlign("leading");
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setLeft(0);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(77);
    obj.edit146:setHeight(36);
    obj.edit146:setField("Rol21");
    obj.edit146:setName("edit146");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.rectangle1);
    obj.layout147:setLeft(781);
    obj.layout147:setTop(1038);
    obj.layout147:setWidth(77);
    obj.layout147:setHeight(35);
    obj.layout147:setName("layout147");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout147);
    obj.edit147:setTransparent(true);
    obj.edit147:setFontSize(20.8);
    obj.edit147:setFontColor("#000000");
    lfm_setPropAsString(obj.edit147, "fontStyle",  "bold");
    obj.edit147:setHorzTextAlign("leading");
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setLeft(0);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(77);
    obj.edit147:setHeight(36);
    obj.edit147:setField("Dif21");
    obj.edit147:setName("edit147");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle1);
    obj.layout148:setLeft(80);
    obj.layout148:setTop(1079);
    obj.layout148:setWidth(77);
    obj.layout148:setHeight(35);
    obj.layout148:setName("layout148");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout148);
    obj.edit148:setTransparent(true);
    obj.edit148:setFontSize(20.8);
    obj.edit148:setFontColor("#000000");
    lfm_setPropAsString(obj.edit148, "fontStyle",  "bold");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setLeft(0);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(77);
    obj.edit148:setHeight(36);
    obj.edit148:setField("Grau22");
    obj.edit148:setName("edit148");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle1);
    obj.layout149:setLeft(166);
    obj.layout149:setTop(1080);
    obj.layout149:setWidth(172);
    obj.layout149:setHeight(33);
    obj.layout149:setName("layout149");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout149);
    obj.edit149:setTransparent(true);
    obj.edit149:setFontSize(20.8);
    obj.edit149:setFontColor("#000000");
    lfm_setPropAsString(obj.edit149, "fontStyle",  "bold");
    obj.edit149:setHorzTextAlign("leading");
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setLeft(0);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(172);
    obj.edit149:setHeight(34);
    obj.edit149:setField("Habilidade22");
    obj.edit149:setName("edit149");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle1);
    obj.layout150:setLeft(346);
    obj.layout150:setTop(1079);
    obj.layout150:setWidth(172);
    obj.layout150:setHeight(33);
    obj.layout150:setName("layout150");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout150);
    obj.edit150:setTransparent(true);
    obj.edit150:setFontSize(20.8);
    obj.edit150:setFontColor("#000000");
    lfm_setPropAsString(obj.edit150, "fontStyle",  "bold");
    obj.edit150:setHorzTextAlign("leading");
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setLeft(0);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(172);
    obj.edit150:setHeight(34);
    obj.edit150:setField("Efeito22");
    obj.edit150:setName("edit150");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.rectangle1);
    obj.layout151:setLeft(528);
    obj.layout151:setTop(1077);
    obj.layout151:setWidth(77);
    obj.layout151:setHeight(35);
    obj.layout151:setName("layout151");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout151);
    obj.edit151:setTransparent(true);
    obj.edit151:setFontSize(20.8);
    obj.edit151:setFontColor("#000000");
    lfm_setPropAsString(obj.edit151, "fontStyle",  "bold");
    obj.edit151:setHorzTextAlign("leading");
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setLeft(0);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(77);
    obj.edit151:setHeight(36);
    obj.edit151:setField("Dur22");
    obj.edit151:setName("edit151");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.rectangle1);
    obj.layout152:setLeft(612);
    obj.layout152:setTop(1078);
    obj.layout152:setWidth(77);
    obj.layout152:setHeight(35);
    obj.layout152:setName("layout152");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout152);
    obj.edit152:setTransparent(true);
    obj.edit152:setFontSize(20.8);
    obj.edit152:setFontColor("#000000");
    lfm_setPropAsString(obj.edit152, "fontStyle",  "bold");
    obj.edit152:setHorzTextAlign("leading");
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setLeft(0);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(77);
    obj.edit152:setHeight(36);
    obj.edit152:setField("Custo22");
    obj.edit152:setName("edit152");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle1);
    obj.layout153:setLeft(697);
    obj.layout153:setTop(1078);
    obj.layout153:setWidth(77);
    obj.layout153:setHeight(35);
    obj.layout153:setName("layout153");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout153);
    obj.edit153:setTransparent(true);
    obj.edit153:setFontSize(20.8);
    obj.edit153:setFontColor("#000000");
    lfm_setPropAsString(obj.edit153, "fontStyle",  "bold");
    obj.edit153:setHorzTextAlign("leading");
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setLeft(0);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(77);
    obj.edit153:setHeight(36);
    obj.edit153:setField("Rol22");
    obj.edit153:setName("edit153");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.rectangle1);
    obj.layout154:setLeft(783);
    obj.layout154:setTop(1077);
    obj.layout154:setWidth(77);
    obj.layout154:setHeight(35);
    obj.layout154:setName("layout154");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout154);
    obj.edit154:setTransparent(true);
    obj.edit154:setFontSize(20.8);
    obj.edit154:setFontColor("#000000");
    lfm_setPropAsString(obj.edit154, "fontStyle",  "bold");
    obj.edit154:setHorzTextAlign("leading");
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(0);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(77);
    obj.edit154:setHeight(36);
    obj.edit154:setField("Dif22");
    obj.edit154:setName("edit154");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.rectangle1);
    obj.layout155:setLeft(81);
    obj.layout155:setTop(1118);
    obj.layout155:setWidth(77);
    obj.layout155:setHeight(35);
    obj.layout155:setName("layout155");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout155);
    obj.edit155:setTransparent(true);
    obj.edit155:setFontSize(20.8);
    obj.edit155:setFontColor("#000000");
    lfm_setPropAsString(obj.edit155, "fontStyle",  "bold");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(0);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(77);
    obj.edit155:setHeight(36);
    obj.edit155:setField("Grau23");
    obj.edit155:setName("edit155");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.rectangle1);
    obj.layout156:setLeft(168);
    obj.layout156:setTop(1119);
    obj.layout156:setWidth(172);
    obj.layout156:setHeight(33);
    obj.layout156:setName("layout156");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout156);
    obj.edit156:setTransparent(true);
    obj.edit156:setFontSize(20.8);
    obj.edit156:setFontColor("#000000");
    lfm_setPropAsString(obj.edit156, "fontStyle",  "bold");
    obj.edit156:setHorzTextAlign("leading");
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(0);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(172);
    obj.edit156:setHeight(34);
    obj.edit156:setField("Habilidade23");
    obj.edit156:setName("edit156");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.rectangle1);
    obj.layout157:setLeft(348);
    obj.layout157:setTop(1118);
    obj.layout157:setWidth(172);
    obj.layout157:setHeight(33);
    obj.layout157:setName("layout157");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout157);
    obj.edit157:setTransparent(true);
    obj.edit157:setFontSize(20.8);
    obj.edit157:setFontColor("#000000");
    lfm_setPropAsString(obj.edit157, "fontStyle",  "bold");
    obj.edit157:setHorzTextAlign("leading");
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(0);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(172);
    obj.edit157:setHeight(34);
    obj.edit157:setField("Efeito23");
    obj.edit157:setName("edit157");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.rectangle1);
    obj.layout158:setLeft(528);
    obj.layout158:setTop(1117);
    obj.layout158:setWidth(77);
    obj.layout158:setHeight(35);
    obj.layout158:setName("layout158");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout158);
    obj.edit158:setTransparent(true);
    obj.edit158:setFontSize(20.8);
    obj.edit158:setFontColor("#000000");
    lfm_setPropAsString(obj.edit158, "fontStyle",  "bold");
    obj.edit158:setHorzTextAlign("leading");
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(0);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(77);
    obj.edit158:setHeight(36);
    obj.edit158:setField("Dur23");
    obj.edit158:setName("edit158");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.rectangle1);
    obj.layout159:setLeft(612);
    obj.layout159:setTop(1118);
    obj.layout159:setWidth(77);
    obj.layout159:setHeight(35);
    obj.layout159:setName("layout159");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout159);
    obj.edit159:setTransparent(true);
    obj.edit159:setFontSize(20.8);
    obj.edit159:setFontColor("#000000");
    lfm_setPropAsString(obj.edit159, "fontStyle",  "bold");
    obj.edit159:setHorzTextAlign("leading");
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(0);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(77);
    obj.edit159:setHeight(36);
    obj.edit159:setField("Custo23");
    obj.edit159:setName("edit159");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.rectangle1);
    obj.layout160:setLeft(696);
    obj.layout160:setTop(1117);
    obj.layout160:setWidth(77);
    obj.layout160:setHeight(35);
    obj.layout160:setName("layout160");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout160);
    obj.edit160:setTransparent(true);
    obj.edit160:setFontSize(20.8);
    obj.edit160:setFontColor("#000000");
    lfm_setPropAsString(obj.edit160, "fontStyle",  "bold");
    obj.edit160:setHorzTextAlign("leading");
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(0);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(77);
    obj.edit160:setHeight(36);
    obj.edit160:setField("Rol23");
    obj.edit160:setName("edit160");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.rectangle1);
    obj.layout161:setLeft(783);
    obj.layout161:setTop(1116);
    obj.layout161:setWidth(77);
    obj.layout161:setHeight(35);
    obj.layout161:setName("layout161");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout161);
    obj.edit161:setTransparent(true);
    obj.edit161:setFontSize(20.8);
    obj.edit161:setFontColor("#000000");
    lfm_setPropAsString(obj.edit161, "fontStyle",  "bold");
    obj.edit161:setHorzTextAlign("leading");
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setLeft(0);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(77);
    obj.edit161:setHeight(36);
    obj.edit161:setField("Dif23");
    obj.edit161:setName("edit161");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.rectangle1);
    obj.layout162:setLeft(80);
    obj.layout162:setTop(1157);
    obj.layout162:setWidth(77);
    obj.layout162:setHeight(35);
    obj.layout162:setName("layout162");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout162);
    obj.edit162:setTransparent(true);
    obj.edit162:setFontSize(20.8);
    obj.edit162:setFontColor("#000000");
    lfm_setPropAsString(obj.edit162, "fontStyle",  "bold");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setLeft(0);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(77);
    obj.edit162:setHeight(36);
    obj.edit162:setField("Grau24");
    obj.edit162:setName("edit162");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.rectangle1);
    obj.layout163:setLeft(165);
    obj.layout163:setTop(1158);
    obj.layout163:setWidth(172);
    obj.layout163:setHeight(36);
    obj.layout163:setName("layout163");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout163);
    obj.edit163:setTransparent(true);
    obj.edit163:setFontSize(20.8);
    obj.edit163:setFontColor("#000000");
    lfm_setPropAsString(obj.edit163, "fontStyle",  "bold");
    obj.edit163:setHorzTextAlign("leading");
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setLeft(0);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(172);
    obj.edit163:setHeight(37);
    obj.edit163:setField("Habilidade24");
    obj.edit163:setName("edit163");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.rectangle1);
    obj.layout164:setLeft(345);
    obj.layout164:setTop(1159);
    obj.layout164:setWidth(175);
    obj.layout164:setHeight(35);
    obj.layout164:setName("layout164");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout164);
    obj.edit164:setTransparent(true);
    obj.edit164:setFontSize(20.8);
    obj.edit164:setFontColor("#000000");
    lfm_setPropAsString(obj.edit164, "fontStyle",  "bold");
    obj.edit164:setHorzTextAlign("leading");
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setLeft(0);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(175);
    obj.edit164:setHeight(36);
    obj.edit164:setField("Efeito24");
    obj.edit164:setName("edit164");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.rectangle1);
    obj.layout165:setLeft(527);
    obj.layout165:setTop(1158);
    obj.layout165:setWidth(77);
    obj.layout165:setHeight(35);
    obj.layout165:setName("layout165");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout165);
    obj.edit165:setTransparent(true);
    obj.edit165:setFontSize(20.8);
    obj.edit165:setFontColor("#000000");
    lfm_setPropAsString(obj.edit165, "fontStyle",  "bold");
    obj.edit165:setHorzTextAlign("leading");
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setLeft(0);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(77);
    obj.edit165:setHeight(36);
    obj.edit165:setField("Dur24");
    obj.edit165:setName("edit165");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.rectangle1);
    obj.layout166:setLeft(610);
    obj.layout166:setTop(1158);
    obj.layout166:setWidth(77);
    obj.layout166:setHeight(35);
    obj.layout166:setName("layout166");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout166);
    obj.edit166:setTransparent(true);
    obj.edit166:setFontSize(20.8);
    obj.edit166:setFontColor("#000000");
    lfm_setPropAsString(obj.edit166, "fontStyle",  "bold");
    obj.edit166:setHorzTextAlign("leading");
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setLeft(0);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(77);
    obj.edit166:setHeight(36);
    obj.edit166:setField("Custo24");
    obj.edit166:setName("edit166");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.rectangle1);
    obj.layout167:setLeft(695);
    obj.layout167:setTop(1158);
    obj.layout167:setWidth(77);
    obj.layout167:setHeight(35);
    obj.layout167:setName("layout167");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout167);
    obj.edit167:setTransparent(true);
    obj.edit167:setFontSize(20.8);
    obj.edit167:setFontColor("#000000");
    lfm_setPropAsString(obj.edit167, "fontStyle",  "bold");
    obj.edit167:setHorzTextAlign("leading");
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setLeft(0);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(77);
    obj.edit167:setHeight(36);
    obj.edit167:setField("Rol24");
    obj.edit167:setName("edit167");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.rectangle1);
    obj.layout168:setLeft(782);
    obj.layout168:setTop(1157);
    obj.layout168:setWidth(77);
    obj.layout168:setHeight(35);
    obj.layout168:setName("layout168");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout168);
    obj.edit168:setTransparent(true);
    obj.edit168:setFontSize(20.8);
    obj.edit168:setFontColor("#000000");
    lfm_setPropAsString(obj.edit168, "fontStyle",  "bold");
    obj.edit168:setHorzTextAlign("leading");
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setLeft(0);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(77);
    obj.edit168:setHeight(36);
    obj.edit168:setField("Dif24");
    obj.edit168:setName("edit168");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setHitTest(true);
    obj.button1:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button1:setLeft(861);
    obj.button1:setTop(242);
    obj.button1:setWidth(32);
    obj.button1:setText("R");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setHitTest(true);
    obj.button2:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button2:setLeft(861);
    obj.button2:setTop(281);
    obj.button2:setWidth(32);
    obj.button2:setText("R");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setHitTest(true);
    obj.button3:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button3:setLeft(861);
    obj.button3:setTop(320);
    obj.button3:setWidth(32);
    obj.button3:setText("R");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setHitTest(true);
    obj.button4:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button4:setLeft(861);
    obj.button4:setTop(359);
    obj.button4:setWidth(32);
    obj.button4:setText("R");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setHitTest(true);
    obj.button5:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button5:setLeft(861);
    obj.button5:setTop(399);
    obj.button5:setWidth(32);
    obj.button5:setText("R");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setHitTest(true);
    obj.button6:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button6:setLeft(861);
    obj.button6:setTop(440);
    obj.button6:setWidth(32);
    obj.button6:setText("R");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setHitTest(true);
    obj.button7:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button7:setLeft(861);
    obj.button7:setTop(481);
    obj.button7:setWidth(32);
    obj.button7:setText("R");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setHitTest(true);
    obj.button8:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button8:setLeft(861);
    obj.button8:setTop(521);
    obj.button8:setWidth(32);
    obj.button8:setText("R");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setHitTest(true);
    obj.button9:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button9:setLeft(861);
    obj.button9:setTop(561);
    obj.button9:setWidth(32);
    obj.button9:setText("R");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setHitTest(true);
    obj.button10:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button10:setLeft(861);
    obj.button10:setTop(602);
    obj.button10:setWidth(32);
    obj.button10:setText("R");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setHitTest(true);
    obj.button11:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button11:setLeft(861);
    obj.button11:setTop(641);
    obj.button11:setWidth(32);
    obj.button11:setText("R");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle1);
    obj.button12:setHitTest(true);
    obj.button12:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button12:setLeft(861);
    obj.button12:setTop(681);
    obj.button12:setWidth(32);
    obj.button12:setText("R");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle1);
    obj.button13:setHitTest(true);
    obj.button13:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button13:setLeft(861);
    obj.button13:setTop(719);
    obj.button13:setWidth(32);
    obj.button13:setText("R");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle1);
    obj.button14:setHitTest(true);
    obj.button14:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button14:setLeft(861);
    obj.button14:setTop(760);
    obj.button14:setWidth(32);
    obj.button14:setText("R");
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle1);
    obj.button15:setHitTest(true);
    obj.button15:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button15:setLeft(861);
    obj.button15:setTop(800);
    obj.button15:setWidth(32);
    obj.button15:setText("R");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle1);
    obj.button16:setHitTest(true);
    obj.button16:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button16:setLeft(861);
    obj.button16:setTop(838);
    obj.button16:setWidth(32);
    obj.button16:setText("R");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle1);
    obj.button17:setHitTest(true);
    obj.button17:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button17:setLeft(861);
    obj.button17:setTop(880);
    obj.button17:setWidth(32);
    obj.button17:setText("R");
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle1);
    obj.button18:setHitTest(true);
    obj.button18:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button18:setLeft(861);
    obj.button18:setTop(919);
    obj.button18:setWidth(32);
    obj.button18:setText("R");
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle1);
    obj.button19:setHitTest(true);
    obj.button19:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button19:setLeft(861);
    obj.button19:setTop(960);
    obj.button19:setWidth(32);
    obj.button19:setText("R");
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle1);
    obj.button20:setHitTest(true);
    obj.button20:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button20:setLeft(861);
    obj.button20:setTop(999);
    obj.button20:setWidth(32);
    obj.button20:setText("R");
    obj.button20:setName("button20");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle1);
    obj.button21:setHitTest(true);
    obj.button21:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button21:setLeft(861);
    obj.button21:setTop(1039);
    obj.button21:setWidth(32);
    obj.button21:setText("R");
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle1);
    obj.button22:setHitTest(true);
    obj.button22:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button22:setLeft(861);
    obj.button22:setTop(1079);
    obj.button22:setWidth(32);
    obj.button22:setText("R");
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.rectangle1);
    obj.button23:setHitTest(true);
    obj.button23:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button23:setLeft(861);
    obj.button23:setTop(1118);
    obj.button23:setWidth(32);
    obj.button23:setText("R");
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.rectangle1);
    obj.button24:setHitTest(true);
    obj.button24:setHint("Clique apenas de Rol e Dif estiverem preenchidos");
    obj.button24:setLeft(861);
    obj.button24:setTop(1158);
    obj.button24:setWidth(32);
    obj.button24:setText("R");
    obj.button24:setName("button24");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol1
            						local dificuldade = sheet.Dif1
            						local nome = sheet.Habilidade1
            						local dur = sheet.Dur1
            						local custo = sheet.Custo1
            						local efeito = sheet.Efeito1
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol2
            						local dificuldade = sheet.Dif2
            						local nome = sheet.Habilidade2
            						local dur = sheet.Dur2
            						local custo = sheet.Custo2
            						local efeito = sheet.Efeito2
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol3
            						local dificuldade = sheet.Dif3
            						local nome = sheet.Habilidade3
            						local dur = sheet.Dur3
            						local custo = sheet.Custo3
            						local efeito = sheet.Efeito3
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol4
            						local dificuldade = sheet.Dif4
            						local nome = sheet.Habilidade4
            						local dur = sheet.Dur4
            						local custo = sheet.Custo4
            						local efeito = sheet.Efeito4
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol5
            						local dificuldade = sheet.Dif5
            						local nome = sheet.Habilidade5
            						local dur = sheet.Dur5
            						local custo = sheet.Custo5
            						local efeito = sheet.Efeito5
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol6
            						local dificuldade = sheet.Dif6
            						local nome = sheet.Habilidade6
            						local dur = sheet.Dur6
            						local custo = sheet.Custo6
            						local efeito = sheet.Efeito6
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol7
            						local dificuldade = sheet.Dif7
            						local nome = sheet.Habilidade7
            						local dur = sheet.Dur7
            						local custo = sheet.Custo7
            						local efeito = sheet.Efeito7
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol8
            						local dificuldade = sheet.Dif8
            						local nome = sheet.Habilidade8
            						local dur = sheet.Dur8
            						local custo = sheet.Custo8
            						local efeito = sheet.Efeito8
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol9
            						local dificuldade = sheet.Dif9
            						local nome = sheet.Habilidade9
            						local dur = sheet.Dur9
            						local custo = sheet.Custo9
            						local efeito = sheet.Efeito9
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol10
            						local dificuldade = sheet.Dif10
            						local nome = sheet.Habilidade10
            						local dur = sheet.Dur10
            						local custo = sheet.Custo10
            						local efeito = sheet.Efeito10
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol11
            						local dificuldade = sheet.Dif11
            						local nome = sheet.Habilidade11
            						local dur = sheet.Dur11
            						local custo = sheet.Custo11
            						local efeito = sheet.Efeito11
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol12
            						local dificuldade = sheet.Dif12
            						local nome = sheet.Habilidade12
            						local dur = sheet.Dur12
            						local custo = sheet.Custo12
            						local efeito = sheet.Efeito12
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol13
            						local dificuldade = sheet.Dif13
            						local nome = sheet.Habilidade13
            						local dur = sheet.Dur13
            						local custo = sheet.Custo13
            						local efeito = sheet.Efeito13
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol14
            						local dificuldade = sheet.Dif14
            						local nome = sheet.Habilidade14
            						local dur = sheet.Dur14
            						local custo = sheet.Custo14
            						local efeito = sheet.Efeito14
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol15
            						local dificuldade = sheet.Dif15
            						local nome = sheet.Habilidade15
            						local dur = sheet.Dur15
            						local custo = sheet.Custo15
            						local efeito = sheet.Efeito15
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol16
            						local dificuldade = sheet.Dif16
            						local nome = sheet.Habilidade16
            						local dur = sheet.Dur16
            						local custo = sheet.Custo16
            						local efeito = sheet.Efeito16
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol17
            						local dificuldade = sheet.Dif17
            						local nome = sheet.Habilidade17
            						local dur = sheet.Dur17
            						local custo = sheet.Custo17
            						local efeito = sheet.Efeito17
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol18
            						local dificuldade = sheet.Dif18
            						local nome = sheet.Habilidade18
            						local dur = sheet.Dur18
            						local custo = sheet.Custo18
            						local efeito = sheet.Efeito18
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol19
            						local dificuldade = sheet.Dif19
            						local nome = sheet.Habilidade19
            						local dur = sheet.Dur19
            						local custo = sheet.Custo19
            						local efeito = sheet.Efeito19
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol20
            						local dificuldade = sheet.Dif20
            						local nome = sheet.Habilidade20
            						local dur = sheet.Dur20
            						local custo = sheet.Custo20
            						local efeito = sheet.Efeito20
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol21
            						local dificuldade = sheet.Dif21
            						local nome = sheet.Habilidade21
            						local dur = sheet.Dur21
            						local custo = sheet.Custo21
            						local efeito = sheet.Efeito21
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol22
            						local dificuldade = sheet.Dif22
            						local nome = sheet.Habilidade22
            						local dur = sheet.Dur22
            						local custo = sheet.Custo22
            						local efeito = sheet.Efeito22
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol23
            						local dificuldade = sheet.Dif23
            						local nome = sheet.Habilidade23
            						local dur = sheet.Dur23
            						local custo = sheet.Custo23
            						local efeito = sheet.Efeito23
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (_)
            local dado = sheet.Rol24
            						local dificuldade = sheet.Dif24
            						local nome = sheet.Habilidade24
            						local dur = sheet.Dur24
            						local custo = sheet.Custo24
            						local efeito = sheet.Efeito24
            
            			            local str = dado .. ">" .. dificuldade; 
            						
                                   local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            
                                   if mesaDoPersonagem ~= nil then
                                           mesaDoPersonagem.chat:enviarMensagem("/r " .. str .. " : " .. nome .. " - Custo: " .. custo .. " - Duração: " .. dur .. " - Efeito: " .. efeito);
                                   end;
        end, obj);

    function obj:_releaseEvents()
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
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaOdisseia2_03_L_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaOdisseia2_03_L_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaOdisseia2_03_L_svg = {
    newEditor = newfrmFichaOdisseia2_03_L_svg, 
    new = newfrmFichaOdisseia2_03_L_svg, 
    name = "frmFichaOdisseia2_03_L_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaOdisseia2_03_L_svg = _frmFichaOdisseia2_03_L_svg;
Firecast.registrarForm(_frmFichaOdisseia2_03_L_svg);

return _frmFichaOdisseia2_03_L_svg;
