require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaOdisseia2_02_svg()
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
    obj:setName("frmFichaOdisseia2_02_svg");
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
    obj.image1:setSRC("/FichaOdisseia2.0/images/2.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(352);
    obj.layout1:setTop(275);
    obj.layout1:setWidth(118);
    obj.layout1:setHeight(40);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setEnabled(false);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(20.8);
    obj.edit1:setFontColor("#8B0000");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(118);
    obj.edit1:setHeight(41);
    obj.edit1:setField("ValorAtaqueFisico");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(475);
    obj.layout2:setTop(273);
    obj.layout2:setWidth(98);
    obj.layout2:setHeight(36);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(20.8);
    obj.edit2:setFontColor("#8B0000");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(98);
    obj.edit2:setHeight(37);
    obj.edit2:setField("ModAtaqueFisico");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(575);
    obj.layout3:setTop(276);
    obj.layout3:setWidth(106);
    obj.layout3:setHeight(36);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(20.8);
    obj.edit3:setFontColor("#8B0000");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(106);
    obj.edit3:setHeight(37);
    obj.edit3:setField("MultAtaqueFisico");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(689);
    obj.layout4:setTop(276);
    obj.layout4:setWidth(114);
    obj.layout4:setHeight(36);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(20.8);
    obj.edit4:setFontColor("#8B0000");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(114);
    obj.edit4:setHeight(37);
    obj.edit4:setField("BonusAtaqueFisico");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(353);
    obj.layout5:setTop(316);
    obj.layout5:setWidth(115);
    obj.layout5:setHeight(33);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setEnabled(false);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(20.8);
    obj.edit5:setFontColor("#8B0000");
    obj.edit5:setReadOnly(true);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(115);
    obj.edit5:setHeight(34);
    obj.edit5:setField("ValorAtaqueMagico");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(474);
    obj.layout6:setTop(319);
    obj.layout6:setWidth(95);
    obj.layout6:setHeight(30);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(20.3);
    obj.edit6:setFontColor("#8B0000");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(95);
    obj.edit6:setHeight(31);
    obj.edit6:setField("ModAtaque_Mágico");
    obj.edit6:setName("edit6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(575);
    obj.layout7:setTop(319);
    obj.layout7:setWidth(106);
    obj.layout7:setHeight(30);
    obj.layout7:setName("layout7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(20.3);
    obj.edit7:setFontColor("#8B0000");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(106);
    obj.edit7:setHeight(31);
    obj.edit7:setField("MultAtaque_Mágico");
    obj.edit7:setName("edit7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(690);
    obj.layout8:setTop(319);
    obj.layout8:setWidth(118);
    obj.layout8:setHeight(31);
    obj.layout8:setName("layout8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(20.8);
    obj.edit8:setFontColor("#8B0000");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(118);
    obj.edit8:setHeight(32);
    obj.edit8:setField("BonusAtaqueMagico__0");
    obj.edit8:setName("edit8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(354);
    obj.layout9:setTop(350);
    obj.layout9:setWidth(115);
    obj.layout9:setHeight(33);
    obj.layout9:setName("layout9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setEnabled(false);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(20.8);
    obj.edit9:setFontColor("#8B0000");
    obj.edit9:setReadOnly(true);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(115);
    obj.edit9:setHeight(34);
    obj.edit9:setField("ValorPrecisao");
    obj.edit9:setName("edit9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(474);
    obj.layout10:setTop(354);
    obj.layout10:setWidth(95);
    obj.layout10:setHeight(30);
    obj.layout10:setName("layout10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(20.3);
    obj.edit10:setFontColor("#8B0000");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(95);
    obj.edit10:setHeight(31);
    obj.edit10:setField("ModPrecisão");
    obj.edit10:setName("edit10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(575);
    obj.layout11:setTop(354);
    obj.layout11:setWidth(108);
    obj.layout11:setHeight(31);
    obj.layout11:setName("layout11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(20.8);
    obj.edit11:setFontColor("#8B0000");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(108);
    obj.edit11:setHeight(32);
    obj.edit11:setField("MultPrecisão");
    obj.edit11:setName("edit11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(690);
    obj.layout12:setTop(354);
    obj.layout12:setWidth(118);
    obj.layout12:setHeight(29);
    obj.layout12:setName("layout12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(20.8);
    obj.edit12:setFontColor("#8B0000");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(118);
    obj.edit12:setHeight(30);
    obj.edit12:setField("BonusPrecisão");
    obj.edit12:setName("edit12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(353);
    obj.layout13:setTop(386);
    obj.layout13:setWidth(115);
    obj.layout13:setHeight(33);
    obj.layout13:setName("layout13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setEnabled(false);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(20.8);
    obj.edit13:setFontColor("#8B0000");
    obj.edit13:setReadOnly(true);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(115);
    obj.edit13:setHeight(34);
    obj.edit13:setField("ValorDefFisica");
    obj.edit13:setName("edit13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(474);
    obj.layout14:setTop(390);
    obj.layout14:setWidth(95);
    obj.layout14:setHeight(28);
    obj.layout14:setName("layout14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(18.8);
    obj.edit14:setFontColor("#8B0000");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(95);
    obj.edit14:setHeight(29);
    obj.edit14:setField("ModDefesa_Física");
    obj.edit14:setName("edit14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(575);
    obj.layout15:setTop(390);
    obj.layout15:setWidth(110);
    obj.layout15:setHeight(28);
    obj.layout15:setName("layout15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(18.8);
    obj.edit15:setFontColor("#8B0000");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(110);
    obj.edit15:setHeight(29);
    obj.edit15:setField("MultDefesa_Física");
    obj.edit15:setName("edit15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(689);
    obj.layout16:setTop(389);
    obj.layout16:setWidth(120);
    obj.layout16:setHeight(29);
    obj.layout16:setName("layout16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout16);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(20.8);
    obj.edit16:setFontColor("#8B0000");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(120);
    obj.edit16:setHeight(30);
    obj.edit16:setField("BonusDefFisica");
    obj.edit16:setName("edit16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(353);
    obj.layout17:setTop(421);
    obj.layout17:setWidth(115);
    obj.layout17:setHeight(33);
    obj.layout17:setName("layout17");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout17);
    obj.edit17:setEnabled(false);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(20.8);
    obj.edit17:setFontColor("#8B0000");
    obj.edit17:setReadOnly(true);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(115);
    obj.edit17:setHeight(34);
    obj.edit17:setField("ValorDefesaMagica");
    obj.edit17:setName("edit17");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(474);
    obj.layout18:setTop(425);
    obj.layout18:setWidth(95);
    obj.layout18:setHeight(29);
    obj.layout18:setName("layout18");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout18);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(20.8);
    obj.edit18:setFontColor("#8B0000");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(95);
    obj.edit18:setHeight(30);
    obj.edit18:setField("ModDefesaMágica");
    obj.edit18:setName("edit18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(575);
    obj.layout19:setTop(423);
    obj.layout19:setWidth(110);
    obj.layout19:setHeight(31);
    obj.layout19:setName("layout19");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout19);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(20.8);
    obj.edit19:setFontColor("#8B0000");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(110);
    obj.edit19:setHeight(32);
    obj.edit19:setField("MultDefesaMagica");
    obj.edit19:setName("edit19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(688);
    obj.layout20:setTop(423);
    obj.layout20:setWidth(121);
    obj.layout20:setHeight(35);
    obj.layout20:setName("layout20");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout20);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(20.8);
    obj.edit20:setFontColor("#8B0000");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(121);
    obj.edit20:setHeight(36);
    obj.edit20:setField("BonusDefesaMagica1");
    obj.edit20:setName("edit20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(353);
    obj.layout21:setTop(457);
    obj.layout21:setWidth(115);
    obj.layout21:setHeight(33);
    obj.layout21:setName("layout21");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout21);
    obj.edit21:setEnabled(false);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(20.8);
    obj.edit21:setFontColor("#8B0000");
    obj.edit21:setReadOnly(true);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(115);
    obj.edit21:setHeight(34);
    obj.edit21:setField("ValorEsquiva");
    obj.edit21:setName("edit21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(473);
    obj.layout22:setTop(459);
    obj.layout22:setWidth(96);
    obj.layout22:setHeight(27);
    obj.layout22:setName("layout22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout22);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(18);
    obj.edit22:setFontColor("#8B0000");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(96);
    obj.edit22:setHeight(28);
    obj.edit22:setField("ModEsquiva");
    obj.edit22:setName("edit22");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(575);
    obj.layout23:setTop(459);
    obj.layout23:setWidth(110);
    obj.layout23:setHeight(27);
    obj.layout23:setName("layout23");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout23);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(18);
    obj.edit23:setFontColor("#8B0000");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(110);
    obj.edit23:setHeight(28);
    obj.edit23:setField("MultEsquiva");
    obj.edit23:setName("edit23");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(688);
    obj.layout24:setTop(455);
    obj.layout24:setWidth(123);
    obj.layout24:setHeight(35);
    obj.layout24:setName("layout24");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout24);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(20.8);
    obj.edit24:setFontColor("#8B0000");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(123);
    obj.edit24:setHeight(36);
    obj.edit24:setField("BonusEsquiva");
    obj.edit24:setName("edit24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(353);
    obj.layout25:setTop(492);
    obj.layout25:setWidth(115);
    obj.layout25:setHeight(33);
    obj.layout25:setName("layout25");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout25);
    obj.edit25:setEnabled(false);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(20.8);
    obj.edit25:setFontColor("#8B0000");
    obj.edit25:setReadOnly(true);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(115);
    obj.edit25:setHeight(34);
    obj.edit25:setField("ValorIniciativa");
    obj.edit25:setName("edit25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(474);
    obj.layout26:setTop(492);
    obj.layout26:setWidth(99);
    obj.layout26:setHeight(30);
    obj.layout26:setName("layout26");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout26);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(20.3);
    obj.edit26:setFontColor("#8B0000");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(99);
    obj.edit26:setHeight(31);
    obj.edit26:setField("ModIniciativa");
    obj.edit26:setName("edit26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(575);
    obj.layout27:setTop(491);
    obj.layout27:setWidth(113);
    obj.layout27:setHeight(31);
    obj.layout27:setName("layout27");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout27);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(20.8);
    obj.edit27:setFontColor("#8B0000");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(113);
    obj.edit27:setHeight(32);
    obj.edit27:setField("MultIniciativa");
    obj.edit27:setName("edit27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(690);
    obj.layout28:setTop(488);
    obj.layout28:setWidth(119);
    obj.layout28:setHeight(37);
    obj.layout28:setName("layout28");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout28);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(20.8);
    obj.edit28:setFontColor("#8B0000");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(119);
    obj.edit28:setHeight(38);
    obj.edit28:setField("BonusIniciativa");
    obj.edit28:setName("edit28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(354);
    obj.layout29:setTop(528);
    obj.layout29:setWidth(115);
    obj.layout29:setHeight(33);
    obj.layout29:setName("layout29");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout29);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(20.8);
    obj.edit29:setFontColor("#8B0000");
    obj.edit29:setReadOnly(true);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(115);
    obj.edit29:setHeight(34);
    obj.edit29:setField("ValorBonusIniciativa");
    obj.edit29:setName("edit29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(473);
    obj.layout30:setTop(526);
    obj.layout30:setWidth(100);
    obj.layout30:setHeight(36);
    obj.layout30:setName("layout30");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout30);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(20.8);
    obj.edit30:setFontColor("#8B0000");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(100);
    obj.edit30:setHeight(37);
    obj.edit30:setField("ModBonusInciativa");
    obj.edit30:setName("edit30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(575);
    obj.layout31:setTop(527);
    obj.layout31:setWidth(110);
    obj.layout31:setHeight(34);
    obj.layout31:setName("layout31");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout31);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(20.8);
    obj.edit31:setFontColor("#8B0000");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(110);
    obj.edit31:setHeight(35);
    obj.edit31:setField("MultBonusIniciativa");
    obj.edit31:setName("edit31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(693);
    obj.layout32:setTop(528);
    obj.layout32:setWidth(114);
    obj.layout32:setHeight(33);
    obj.layout32:setName("layout32");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout32);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(20.8);
    obj.edit32:setFontColor("#8B0000");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(114);
    obj.edit32:setHeight(34);
    obj.edit32:setField("BonusBonusIniciativa");
    obj.edit32:setName("edit32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(186);
    obj.layout33:setTop(603);
    obj.layout33:setWidth(38);
    obj.layout33:setHeight(31);
    obj.layout33:setName("layout33");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout33);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(18.8);
    obj.edit33:setFontColor("#FF0000");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(38);
    obj.edit33:setHeight(32);
    obj.edit33:setField("PVAtual");
    obj.edit33:setName("edit33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(244);
    obj.layout34:setTop(604);
    obj.layout34:setWidth(39);
    obj.layout34:setHeight(30);
    obj.layout34:setName("layout34");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout34);
    obj.edit34:setEnabled(false);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(20.3);
    obj.edit34:setFontColor("#FF0000");
    obj.edit34:setReadOnly(true);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(39);
    obj.edit34:setHeight(31);
    obj.edit34:setField("PVTotal");
    obj.edit34:setName("edit34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(427);
    obj.layout35:setTop(602);
    obj.layout35:setWidth(39);
    obj.layout35:setHeight(36);
    obj.layout35:setName("layout35");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout35);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(20.8);
    obj.edit35:setFontColor("#0000FF");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(39);
    obj.edit35:setHeight(37);
    obj.edit35:setField("PMAtual");
    obj.edit35:setName("edit35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(483);
    obj.layout36:setTop(602);
    obj.layout36:setWidth(40);
    obj.layout36:setHeight(33);
    obj.layout36:setName("layout36");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout36);
    obj.edit36:setEnabled(false);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(20.8);
    obj.edit36:setFontColor("#0000FF");
    obj.edit36:setReadOnly(true);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(40);
    obj.edit36:setHeight(34);
    obj.edit36:setField("PMTotal");
    obj.edit36:setName("edit36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(670);
    obj.layout37:setTop(602);
    obj.layout37:setWidth(40);
    obj.layout37:setHeight(33);
    obj.layout37:setName("layout37");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout37);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(20.8);
    obj.edit37:setFontColor("#008000");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(40);
    obj.edit37:setHeight(34);
    obj.edit37:setField("EnergiaAtual");
    obj.edit37:setName("edit37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(728);
    obj.layout38:setTop(604);
    obj.layout38:setWidth(43);
    obj.layout38:setHeight(31);
    obj.layout38:setName("layout38");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout38);
    obj.edit38:setEnabled(false);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(20.8);
    obj.edit38:setFontColor("#008000");
    obj.edit38:setReadOnly(true);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(43);
    obj.edit38:setHeight(32);
    obj.edit38:setField("EnergiaTotal");
    obj.edit38:setName("edit38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(363);
    obj.layout39:setTop(737);
    obj.layout39:setWidth(183);
    obj.layout39:setHeight(33);
    obj.layout39:setName("layout39");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout39);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(20.8);
    obj.edit39:setFontColor("#8B0000");
    obj.edit39:setHorzTextAlign("leading");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(183);
    obj.edit39:setHeight(34);
    obj.edit39:setField("ItemCabeça");
    obj.edit39:setName("edit39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(553);
    obj.layout40:setTop(737);
    obj.layout40:setWidth(90);
    obj.layout40:setHeight(33);
    obj.layout40:setName("layout40");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout40);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(20.8);
    obj.edit40:setFontColor("#8B0000");
    obj.edit40:setHorzTextAlign("leading");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(90);
    obj.edit40:setHeight(34);
    obj.edit40:setField("BonusCabeça");
    obj.edit40:setName("edit40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(649);
    obj.layout41:setTop(739);
    obj.layout41:setWidth(52);
    obj.layout41:setHeight(33);
    obj.layout41:setName("layout41");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout41);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(20.8);
    obj.edit41:setFontColor("#8B0000");
    obj.edit41:setHorzTextAlign("leading");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(52);
    obj.edit41:setHeight(34);
    obj.edit41:setField("PesoCabeca");
    obj.edit41:setName("edit41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(710);
    obj.layout42:setTop(740);
    obj.layout42:setWidth(135);
    obj.layout42:setHeight(33);
    obj.layout42:setName("layout42");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout42);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(20.8);
    obj.edit42:setFontColor("#8B0000");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(135);
    obj.edit42:setHeight(34);
    obj.edit42:setField("DurabilidadeCabeça");
    obj.edit42:setName("edit42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(362);
    obj.layout43:setTop(787);
    obj.layout43:setWidth(183);
    obj.layout43:setHeight(33);
    obj.layout43:setName("layout43");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout43);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(20.8);
    obj.edit43:setFontColor("#8B0000");
    obj.edit43:setHorzTextAlign("leading");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(183);
    obj.edit43:setHeight(34);
    obj.edit43:setField("ItemTronco");
    obj.edit43:setName("edit43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(551);
    obj.layout44:setTop(789);
    obj.layout44:setWidth(90);
    obj.layout44:setHeight(33);
    obj.layout44:setName("layout44");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout44);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(20.8);
    obj.edit44:setFontColor("#8B0000");
    obj.edit44:setHorzTextAlign("leading");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(90);
    obj.edit44:setHeight(34);
    obj.edit44:setField("BonusTronco");
    obj.edit44:setName("edit44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(648);
    obj.layout45:setTop(788);
    obj.layout45:setWidth(52);
    obj.layout45:setHeight(33);
    obj.layout45:setName("layout45");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout45);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(20.8);
    obj.edit45:setFontColor("#8B0000");
    obj.edit45:setHorzTextAlign("leading");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(52);
    obj.edit45:setHeight(34);
    obj.edit45:setField("PesoTronco");
    obj.edit45:setName("edit45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(709);
    obj.layout46:setTop(787);
    obj.layout46:setWidth(135);
    obj.layout46:setHeight(33);
    obj.layout46:setName("layout46");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout46);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(20.8);
    obj.edit46:setFontColor("#8B0000");
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(135);
    obj.edit46:setHeight(34);
    obj.edit46:setField("DurabilidadeTronco");
    obj.edit46:setName("edit46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(362);
    obj.layout47:setTop(834);
    obj.layout47:setWidth(183);
    obj.layout47:setHeight(33);
    obj.layout47:setName("layout47");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout47);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(20.8);
    obj.edit47:setFontColor("#8B0000");
    obj.edit47:setHorzTextAlign("leading");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(183);
    obj.edit47:setHeight(34);
    obj.edit47:setField("ItemBraços");
    obj.edit47:setName("edit47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(552);
    obj.layout48:setTop(836);
    obj.layout48:setWidth(90);
    obj.layout48:setHeight(33);
    obj.layout48:setName("layout48");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout48);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(20.8);
    obj.edit48:setFontColor("#8B0000");
    obj.edit48:setHorzTextAlign("leading");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(90);
    obj.edit48:setHeight(34);
    obj.edit48:setField("BonusBraços");
    obj.edit48:setName("edit48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(648);
    obj.layout49:setTop(835);
    obj.layout49:setWidth(52);
    obj.layout49:setHeight(33);
    obj.layout49:setName("layout49");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout49);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(20.8);
    obj.edit49:setFontColor("#8B0000");
    obj.edit49:setHorzTextAlign("leading");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(52);
    obj.edit49:setHeight(34);
    obj.edit49:setField("PesoBraços");
    obj.edit49:setName("edit49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(707);
    obj.layout50:setTop(835);
    obj.layout50:setWidth(135);
    obj.layout50:setHeight(33);
    obj.layout50:setName("layout50");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout50);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(20.8);
    obj.edit50:setFontColor("#8B0000");
    obj.edit50:setHorzTextAlign("leading");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(135);
    obj.edit50:setHeight(34);
    obj.edit50:setField("DurabilidadeBraços");
    obj.edit50:setName("edit50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(361);
    obj.layout51:setTop(882);
    obj.layout51:setWidth(183);
    obj.layout51:setHeight(33);
    obj.layout51:setName("layout51");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout51);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(20.8);
    obj.edit51:setFontColor("#8B0000");
    obj.edit51:setHorzTextAlign("leading");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(183);
    obj.edit51:setHeight(34);
    obj.edit51:setField("ItemMãoDIR");
    obj.edit51:setName("edit51");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(550);
    obj.layout52:setTop(882);
    obj.layout52:setWidth(90);
    obj.layout52:setHeight(33);
    obj.layout52:setName("layout52");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout52);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(20.8);
    obj.edit52:setFontColor("#8B0000");
    obj.edit52:setHorzTextAlign("leading");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(90);
    obj.edit52:setHeight(34);
    obj.edit52:setField("BonusMãoDir");
    obj.edit52:setName("edit52");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(649);
    obj.layout53:setTop(881);
    obj.layout53:setWidth(52);
    obj.layout53:setHeight(33);
    obj.layout53:setName("layout53");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout53);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(20.8);
    obj.edit53:setFontColor("#8B0000");
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(52);
    obj.edit53:setHeight(34);
    obj.edit53:setField("PesoMaoDir");
    obj.edit53:setName("edit53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(708);
    obj.layout54:setTop(882);
    obj.layout54:setWidth(135);
    obj.layout54:setHeight(33);
    obj.layout54:setName("layout54");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout54);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(20.8);
    obj.edit54:setFontColor("#8B0000");
    obj.edit54:setHorzTextAlign("leading");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(135);
    obj.edit54:setHeight(34);
    obj.edit54:setField("DurabilidadeMãoDir");
    obj.edit54:setName("edit54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(361);
    obj.layout55:setTop(936);
    obj.layout55:setWidth(183);
    obj.layout55:setHeight(33);
    obj.layout55:setName("layout55");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout55);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(20.8);
    obj.edit55:setFontColor("#8B0000");
    obj.edit55:setHorzTextAlign("leading");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(183);
    obj.edit55:setHeight(34);
    obj.edit55:setField("BonusMãoESQ");
    obj.edit55:setName("edit55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(551);
    obj.layout56:setTop(935);
    obj.layout56:setWidth(90);
    obj.layout56:setHeight(33);
    obj.layout56:setName("layout56");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout56);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(20.8);
    obj.edit56:setFontColor("#8B0000");
    obj.edit56:setHorzTextAlign("leading");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(90);
    obj.edit56:setHeight(34);
    obj.edit56:setField("ItemMãoESQ");
    obj.edit56:setName("edit56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(648);
    obj.layout57:setTop(935);
    obj.layout57:setWidth(52);
    obj.layout57:setHeight(33);
    obj.layout57:setName("layout57");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout57);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(20.8);
    obj.edit57:setFontColor("#8B0000");
    obj.edit57:setHorzTextAlign("leading");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(52);
    obj.edit57:setHeight(34);
    obj.edit57:setField("PesoMaoESQ");
    obj.edit57:setName("edit57");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(708);
    obj.layout58:setTop(935);
    obj.layout58:setWidth(135);
    obj.layout58:setHeight(33);
    obj.layout58:setName("layout58");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout58);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(20.8);
    obj.edit58:setFontColor("#8B0000");
    obj.edit58:setHorzTextAlign("leading");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(135);
    obj.edit58:setHeight(34);
    obj.edit58:setField("DurabilidadeMãoESQ");
    obj.edit58:setName("edit58");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(363);
    obj.layout59:setTop(1001);
    obj.layout59:setWidth(183);
    obj.layout59:setHeight(33);
    obj.layout59:setName("layout59");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout59);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(20.8);
    obj.edit59:setFontColor("#8B0000");
    obj.edit59:setHorzTextAlign("leading");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(183);
    obj.edit59:setHeight(34);
    obj.edit59:setField("ItemPernas");
    obj.edit59:setName("edit59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(550);
    obj.layout60:setTop(1000);
    obj.layout60:setWidth(90);
    obj.layout60:setHeight(33);
    obj.layout60:setName("layout60");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout60);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(20.8);
    obj.edit60:setFontColor("#8B0000");
    obj.edit60:setHorzTextAlign("leading");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(90);
    obj.edit60:setHeight(34);
    obj.edit60:setField("BonusPernas");
    obj.edit60:setName("edit60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(649);
    obj.layout61:setTop(1001);
    obj.layout61:setWidth(52);
    obj.layout61:setHeight(33);
    obj.layout61:setName("layout61");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout61);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(20.8);
    obj.edit61:setFontColor("#8B0000");
    obj.edit61:setHorzTextAlign("leading");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(52);
    obj.edit61:setHeight(34);
    obj.edit61:setField("PesoPernas");
    obj.edit61:setName("edit61");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(709);
    obj.layout62:setTop(1000);
    obj.layout62:setWidth(135);
    obj.layout62:setHeight(33);
    obj.layout62:setName("layout62");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout62);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(20.8);
    obj.edit62:setFontColor("#8B0000");
    obj.edit62:setHorzTextAlign("leading");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(135);
    obj.edit62:setHeight(34);
    obj.edit62:setField("DurabilidadePernas");
    obj.edit62:setName("edit62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(362);
    obj.layout63:setTop(1048);
    obj.layout63:setWidth(183);
    obj.layout63:setHeight(33);
    obj.layout63:setName("layout63");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout63);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(20.8);
    obj.edit63:setFontColor("#8B0000");
    obj.edit63:setHorzTextAlign("leading");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(183);
    obj.edit63:setHeight(34);
    obj.edit63:setField("ItemPés");
    obj.edit63:setName("edit63");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(551);
    obj.layout64:setTop(1048);
    obj.layout64:setWidth(90);
    obj.layout64:setHeight(33);
    obj.layout64:setName("layout64");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout64);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(20.8);
    obj.edit64:setFontColor("#8B0000");
    obj.edit64:setHorzTextAlign("leading");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(90);
    obj.edit64:setHeight(34);
    obj.edit64:setField("BonusPés");
    obj.edit64:setName("edit64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(648);
    obj.layout65:setTop(1049);
    obj.layout65:setWidth(52);
    obj.layout65:setHeight(33);
    obj.layout65:setName("layout65");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout65);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(20.8);
    obj.edit65:setFontColor("#8B0000");
    obj.edit65:setHorzTextAlign("leading");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(52);
    obj.edit65:setHeight(34);
    obj.edit65:setField("PesoPes");
    obj.edit65:setName("edit65");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(710);
    obj.layout66:setTop(1048);
    obj.layout66:setWidth(135);
    obj.layout66:setHeight(33);
    obj.layout66:setName("layout66");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout66);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(20.8);
    obj.edit66:setFontColor("#8B0000");
    obj.edit66:setHorzTextAlign("leading");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(135);
    obj.edit66:setHeight(34);
    obj.edit66:setField("DurabilidadePés");
    obj.edit66:setName("edit66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(361);
    obj.layout67:setTop(1095);
    obj.layout67:setWidth(183);
    obj.layout67:setHeight(33);
    obj.layout67:setName("layout67");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout67);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(20.8);
    obj.edit67:setFontColor("#8B0000");
    obj.edit67:setHorzTextAlign("leading");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(183);
    obj.edit67:setHeight(34);
    obj.edit67:setField("ItemOutros");
    obj.edit67:setName("edit67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(551);
    obj.layout68:setTop(1095);
    obj.layout68:setWidth(90);
    obj.layout68:setHeight(33);
    obj.layout68:setName("layout68");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout68);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(20.8);
    obj.edit68:setFontColor("#8B0000");
    obj.edit68:setHorzTextAlign("leading");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(90);
    obj.edit68:setHeight(34);
    obj.edit68:setField("BonusOutros");
    obj.edit68:setName("edit68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(648);
    obj.layout69:setTop(1096);
    obj.layout69:setWidth(52);
    obj.layout69:setHeight(33);
    obj.layout69:setName("layout69");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout69);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(20.8);
    obj.edit69:setFontColor("#8B0000");
    obj.edit69:setHorzTextAlign("leading");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(52);
    obj.edit69:setHeight(34);
    obj.edit69:setField("PesoOutros");
    obj.edit69:setName("edit69");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(708);
    obj.layout70:setTop(1095);
    obj.layout70:setWidth(135);
    obj.layout70:setHeight(33);
    obj.layout70:setName("layout70");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout70);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(20.8);
    obj.edit70:setFontColor("#8B0000");
    obj.edit70:setHorzTextAlign("leading");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(135);
    obj.edit70:setHeight(34);
    obj.edit70:setField("DurabilidadeOutros");
    obj.edit70:setName("edit70");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(633);
    obj.layout71:setTop(1166);
    obj.layout71:setWidth(53);
    obj.layout71:setHeight(30);
    obj.layout71:setName("layout71");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout71);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(20.3);
    obj.edit71:setFontColor("#8B0000");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(53);
    obj.edit71:setHeight(31);
    obj.edit71:setField("PesoAtual");
    obj.edit71:setName("edit71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(709);
    obj.layout72:setTop(1165);
    obj.layout72:setWidth(53);
    obj.layout72:setHeight(33);
    obj.layout72:setName("layout72");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout72);
    obj.edit72:setEnabled(false);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(20.8);
    obj.edit72:setFontColor("#8B0000");
    obj.edit72:setReadOnly(true);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(53);
    obj.edit72:setHeight(34);
    obj.edit72:setField("PesoLimite");
    obj.edit72:setName("edit72");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'Const', 'For'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'Mist', 'Int'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'Const', 'For'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'Dest', 'For'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setFields({'Mist', 'Int'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setFields({'Dest', 'Int'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'Const', 'For'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'Mist', 'Const'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'Dest', 'Const'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'Dest', 'Int'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'For', 'Const'});
    obj.dataLink11:setName("dataLink11");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PVTotal= ((tonumber(sheet.Const) or 0) * 5) +
                                          (tonumber(sheet.For) or 0);                  
            
                           if sheet.PVTotal >= 0 then
                                   sheet.PVTotal = "" .. sheet.PVTotal;
                           end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PMTotal = (tonumber(sheet.Mist) or 0) * 5 +
                                          (tonumber(sheet.Int) or 0);                  
            
                           if sheet.PMTotal >= 0 then
                                   sheet.PMTotal = "" .. sheet.PMTotal;
                           end;
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.EnergiaTotal = (tonumber(sheet.Const) or 0) +
                                          (tonumber(sheet.For) or 0) / 2;                  
            
                           if sheet.EnergiaTotal >= 0 then
                                   sheet.EnergiaTotal = "" .. sheet.EnergiaTotal;
                           end;
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ValorAtaqueFisico = math.floor((tonumber(sheet.Dest) or 0) / 2) +
                                          math.floor((tonumber(sheet.For) or 0) / 2);                  
            
                           if sheet.ValorAtaqueFisico >= 0 then
                                   sheet.ValorAtaqueFisico = sheet.ValorAtaqueFisico;
                           end;
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ValorAtaqueMagico = math.floor((sheet.Mist or 0) / 2) +
                                     math.floor((sheet.Int or 0) / 2);				
            
                            if sheet.ValorAtaqueMagico >= 0 then
                                    sheet.ValorAtaqueMagico = sheet.ValorAtaqueMagico;
                            end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ValorPrecisao = math.floor((tonumber(sheet.Dest) or 0) / 2) +
                                          math.floor((tonumber(sheet.Int) or 0) / 2);                  
            
                           if sheet.ValorPrecisao >= 0 then
                                   sheet.ValorPrecisao = sheet.ValorPrecisao;
                           end;
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ValorDefFisica = math.floor(tonumber(sheet.Const or 0) / 2) +
                                          math.floor(tonumber(sheet.For or 0) / 2) ;                  
            
                           if sheet.ValorDefFisica >= 0 then
                                   sheet.ValorDefFisica = sheet.ValorDefFisica;
                           end;
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ValorDefesaMagica = math.floor(tonumber(sheet.Mist) or 0) +
                                          math.floor(tonumber(sheet.Const) or 0);                  
            
                           if sheet.ValorDefesaMagica >= 0 then
                                   sheet.ValorDefesaMagica = math.floor(tonumber(sheet.ValorDefesaMagica) / 2);
                           end;
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ValorEsquiva = math.floor(((sheet.Dest) or 0) / 2) +
            				         math.floor(((sheet.Const) or 0) / 2);               
            
                            if sheet.ValorEsquiva >= 0 then
                                    sheet.ValorEsquiva = sheet.ValorEsquiva;
            				end;
        end, obj);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.ValorIniciativa = math.floor(tonumber(sheet.Dest or 0) / 2) +
                                          math.floor(tonumber(sheet.Int or 0) / 2);                  
            
                           if sheet.ValorIniciativa >= 0 then
                                   sheet.ValorIniciativa = sheet.ValorIniciativa;
                           end;
        end, obj);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.PesoLimite = math.floor(tonumber(sheet.For or 0) * 2) +
                                          math.floor(tonumber(sheet.Const or 0));                  
            
                           if sheet.PesoLimite >= 0 then
                                   sheet.PesoLimite = sheet.PesoLimite;
                           end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaOdisseia2_02_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaOdisseia2_02_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaOdisseia2_02_svg = {
    newEditor = newfrmFichaOdisseia2_02_svg, 
    new = newfrmFichaOdisseia2_02_svg, 
    name = "frmFichaOdisseia2_02_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaOdisseia2_02_svg = _frmFichaOdisseia2_02_svg;
Firecast.registrarForm(_frmFichaOdisseia2_02_svg);

return _frmFichaOdisseia2_02_svg;
