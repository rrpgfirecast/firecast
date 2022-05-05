require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmficha_editavel_tftl1_svg()
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
    obj:setName("frmficha_editavel_tftl1_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(918);
    obj.rectangle1:setHeight(1186);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(918);
    obj.image1:setHeight(1186);
    obj.image1:setSRC("/ficha_editavel-tftl/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(355);
    obj.layout1:setTop(227);
    obj.layout1:setWidth(237);
    obj.layout1:setHeight(15);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(9);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(237);
    obj.edit1:setHeight(16);
    obj.edit1:setField("Caixa_de_texto_1");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(663);
    obj.layout2:setTop(227);
    obj.layout2:setWidth(216);
    obj.layout2:setHeight(15);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(9);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(216);
    obj.edit2:setHeight(16);
    obj.edit2:setField("Caixa_de_texto_3");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(818);
    obj.layout3:setTop(257);
    obj.layout3:setWidth(13);
    obj.layout3:setHeight(14);
    obj.layout3:setName("layout3");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout3);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(13);
    obj.checkBox1:setHeight(15);
    obj.checkBox1:setField("Caixa_de_sele_C3_A7_C3_A3o_3");
    obj.checkBox1:setName("checkBox1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(793);
    obj.layout4:setTop(257);
    obj.layout4:setWidth(13);
    obj.layout4:setHeight(14);
    obj.layout4:setName("layout4");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout4);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(13);
    obj.checkBox2:setHeight(15);
    obj.checkBox2:setField("Caixa_de_sele_C3_A7_C3_A3o_2");
    obj.checkBox2:setName("checkBox2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(767);
    obj.layout5:setTop(259);
    obj.layout5:setWidth(13);
    obj.layout5:setHeight(14);
    obj.layout5:setName("layout5");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout5);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(13);
    obj.checkBox3:setHeight(15);
    obj.checkBox3:setField("Caixa_de_sele_C3_A7_C3_A3o_1");
    obj.checkBox3:setName("checkBox3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(843);
    obj.layout6:setTop(259);
    obj.layout6:setWidth(13);
    obj.layout6:setHeight(14);
    obj.layout6:setName("layout6");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout6);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(13);
    obj.checkBox4:setHeight(15);
    obj.checkBox4:setField("Caixa_de_sele_C3_A7_C3_A3o_5");
    obj.checkBox4:setName("checkBox4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(867);
    obj.layout7:setTop(259);
    obj.layout7:setWidth(13);
    obj.layout7:setHeight(14);
    obj.layout7:setName("layout7");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout7);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(13);
    obj.checkBox5:setHeight(15);
    obj.checkBox5:setField("Caixa_de_sele_C3_A7_C3_A3o_4");
    obj.checkBox5:setName("checkBox5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(259);
    obj.layout8:setTop(270);
    obj.layout8:setWidth(35);
    obj.layout8:setHeight(3);
    obj.layout8:setName("layout8");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout8);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(35);
    obj.textEditor1:setHeight(3);
    obj.textEditor1:setFontSize(14.2);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Caixa_de_texto_9");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(355);
    obj.layout9:setTop(258);
    obj.layout9:setWidth(237);
    obj.layout9:setHeight(15);
    obj.layout9:setName("layout9");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout9);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(9);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(237);
    obj.edit3:setHeight(16);
    obj.edit3:setField("Caixa_de_texto_1_3");
    obj.edit3:setName("edit3");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(259);
    obj.layout10:setTop(302);
    obj.layout10:setWidth(35);
    obj.layout10:setHeight(3);
    obj.layout10:setName("layout10");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout10);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(35);
    obj.textEditor2:setHeight(3);
    obj.textEditor2:setFontSize(14.2);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("Caixa_de_texto_8");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(366);
    obj.layout11:setTop(290);
    obj.layout11:setWidth(237);
    obj.layout11:setHeight(15);
    obj.layout11:setName("layout11");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout11);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(9);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(237);
    obj.edit4:setHeight(16);
    obj.edit4:setField("Caixa_de_texto_1_2");
    obj.edit4:setName("edit4");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(653);
    obj.layout12:setTop(290);
    obj.layout12:setWidth(216);
    obj.layout12:setHeight(15);
    obj.layout12:setName("layout12");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout12);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(9);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(216);
    obj.edit5:setHeight(16);
    obj.edit5:setField("Caixa_de_texto_2");
    obj.edit5:setName("edit5");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(262);
    obj.layout13:setTop(334);
    obj.layout13:setWidth(35);
    obj.layout13:setHeight(3);
    obj.layout13:setName("layout13");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout13);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(35);
    obj.textEditor3:setHeight(3);
    obj.textEditor3:setFontSize(14.2);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("Caixa_de_texto_8_2");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(376);
    obj.layout14:setTop(322);
    obj.layout14:setWidth(492);
    obj.layout14:setHeight(15);
    obj.layout14:setName("layout14");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout14);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(9);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(492);
    obj.edit6:setHeight(16);
    obj.edit6:setField("Caixa_de_texto_4");
    obj.edit6:setName("edit6");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(869);
    obj.layout15:setTop(355);
    obj.layout15:setWidth(13);
    obj.layout15:setHeight(14);
    obj.layout15:setName("layout15");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout15);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(13);
    obj.checkBox6:setHeight(15);
    obj.checkBox6:setField("Caixa_de_sele_C3_A7_C3_A3o_6");
    obj.checkBox6:setName("checkBox6");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(259);
    obj.layout16:setTop(366);
    obj.layout16:setWidth(35);
    obj.layout16:setHeight(3);
    obj.layout16:setName("layout16");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout16);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(35);
    obj.textEditor4:setHeight(3);
    obj.textEditor4:setFontSize(14.2);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("Caixa_de_texto_8_3");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(376);
    obj.layout17:setTop(354);
    obj.layout17:setWidth(471);
    obj.layout17:setHeight(15);
    obj.layout17:setName("layout17");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout17);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(9);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(471);
    obj.edit7:setHeight(16);
    obj.edit7:setField("Caixa_de_texto_5");
    obj.edit7:setName("edit7");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(376);
    obj.layout18:setTop(386);
    obj.layout18:setWidth(492);
    obj.layout18:setHeight(15);
    obj.layout18:setName("layout18");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout18);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(9);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(492);
    obj.edit8:setHeight(16);
    obj.edit8:setField("Caixa_de_texto_6");
    obj.edit8:setName("edit8");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(408);
    obj.layout19:setTop(418);
    obj.layout19:setWidth(460);
    obj.layout19:setHeight(15);
    obj.layout19:setName("layout19");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout19);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(9);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(460);
    obj.edit9:setHeight(16);
    obj.edit9:setField("Caixa_de_texto_7");
    obj.edit9:setName("edit9");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(268);
    obj.layout20:setTop(429);
    obj.layout20:setWidth(13);
    obj.layout20:setHeight(14);
    obj.layout20:setName("layout20");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout20);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(13);
    obj.checkBox7:setHeight(15);
    obj.checkBox7:setField("Caixa_de_sele_C3_A7_C3_A3o_7");
    obj.checkBox7:setName("checkBox7");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(268);
    obj.layout21:setTop(461);
    obj.layout21:setWidth(13);
    obj.layout21:setHeight(14);
    obj.layout21:setName("layout21");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout21);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(13);
    obj.checkBox8:setHeight(15);
    obj.checkBox8:setField("Caixa_de_sele_C3_A7_C3_A3o_7_2");
    obj.checkBox8:setName("checkBox8");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(268);
    obj.layout22:setTop(493);
    obj.layout22:setWidth(13);
    obj.layout22:setHeight(14);
    obj.layout22:setName("layout22");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout22);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(13);
    obj.checkBox9:setHeight(15);
    obj.checkBox9:setField("Caixa_de_sele_C3_A7_C3_A3o_7_3");
    obj.checkBox9:setName("checkBox9");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(376);
    obj.layout23:setTop(492);
    obj.layout23:setWidth(503);
    obj.layout23:setHeight(15);
    obj.layout23:setName("layout23");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout23);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(9);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(503);
    obj.edit10:setHeight(16);
    obj.edit10:setField("Caixa_de_texto_29");
    obj.edit10:setName("edit10");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(268);
    obj.layout24:setTop(525);
    obj.layout24:setWidth(13);
    obj.layout24:setHeight(14);
    obj.layout24:setName("layout24");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout24);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(13);
    obj.checkBox10:setHeight(15);
    obj.checkBox10:setField("Caixa_de_sele_C3_A7_C3_A3o_7_4");
    obj.checkBox10:setName("checkBox10");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(376);
    obj.layout25:setTop(524);
    obj.layout25:setWidth(503);
    obj.layout25:setHeight(15);
    obj.layout25:setName("layout25");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout25);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(9);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(503);
    obj.edit11:setHeight(16);
    obj.edit11:setField("Caixa_de_texto_29_2");
    obj.edit11:setName("edit11");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(268);
    obj.layout26:setTop(557);
    obj.layout26:setWidth(13);
    obj.layout26:setHeight(14);
    obj.layout26:setName("layout26");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout26);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setTop(0);
    obj.checkBox11:setWidth(13);
    obj.checkBox11:setHeight(15);
    obj.checkBox11:setField("Caixa_de_sele_C3_A7_C3_A3o_7_5");
    obj.checkBox11:setName("checkBox11");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(376);
    obj.layout27:setTop(556);
    obj.layout27:setWidth(503);
    obj.layout27:setHeight(15);
    obj.layout27:setName("layout27");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout27);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(9);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(503);
    obj.edit12:setHeight(16);
    obj.edit12:setField("Caixa_de_texto_30");
    obj.edit12:setName("edit12");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(376);
    obj.layout28:setTop(588);
    obj.layout28:setWidth(503);
    obj.layout28:setHeight(15);
    obj.layout28:setName("layout28");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout28);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(9);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(503);
    obj.edit13:setHeight(16);
    obj.edit13:setField("Caixa_de_texto_29_3");
    obj.edit13:setName("edit13");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(376);
    obj.layout29:setTop(620);
    obj.layout29:setWidth(503);
    obj.layout29:setHeight(15);
    obj.layout29:setName("layout29");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout29);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(9);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(503);
    obj.edit14:setHeight(16);
    obj.edit14:setField("Caixa_de_texto_29_4");
    obj.edit14:setName("edit14");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(259);
    obj.layout30:setTop(648);
    obj.layout30:setWidth(35);
    obj.layout30:setHeight(3);
    obj.layout30:setName("layout30");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout30);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(35);
    obj.textEditor5:setHeight(3);
    obj.textEditor5:setFontSize(14.2);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("Caixa_de_texto_17");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(376);
    obj.layout31:setTop(652);
    obj.layout31:setWidth(503);
    obj.layout31:setHeight(15);
    obj.layout31:setName("layout31");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout31);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(9);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(503);
    obj.edit15:setHeight(16);
    obj.edit15:setField("Caixa_de_texto_29_5");
    obj.edit15:setName("edit15");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(259);
    obj.layout32:setTop(680);
    obj.layout32:setWidth(35);
    obj.layout32:setHeight(3);
    obj.layout32:setName("layout32");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout32);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(35);
    obj.textEditor6:setHeight(3);
    obj.textEditor6:setFontSize(14.2);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setField("Caixa_de_texto_18");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(260);
    obj.layout33:setTop(714);
    obj.layout33:setWidth(35);
    obj.layout33:setHeight(3);
    obj.layout33:setName("layout33");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout33);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(35);
    obj.textEditor7:setHeight(3);
    obj.textEditor7:setFontSize(14.2);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setField("Caixa_de_texto_19");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(260);
    obj.layout34:setTop(746);
    obj.layout34:setWidth(35);
    obj.layout34:setHeight(3);
    obj.layout34:setName("layout34");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout34);
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(0);
    obj.textEditor8:setWidth(35);
    obj.textEditor8:setHeight(3);
    obj.textEditor8:setFontSize(14.2);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setField("Caixa_de_texto_20");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setName("textEditor8");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(387);
    obj.layout35:setTop(737);
    obj.layout35:setWidth(163);
    obj.layout35:setHeight(15);
    obj.layout35:setName("layout35");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout35);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(9);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(163);
    obj.edit16:setHeight(16);
    obj.edit16:setField("Caixa_de_texto_32_6");
    obj.edit16:setName("edit16");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(259);
    obj.layout36:setTop(781);
    obj.layout36:setWidth(35);
    obj.layout36:setHeight(3);
    obj.layout36:setName("layout36");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout36);
    obj.textEditor9:setLeft(0);
    obj.textEditor9:setTop(0);
    obj.textEditor9:setWidth(35);
    obj.textEditor9:setHeight(3);
    obj.textEditor9:setFontSize(14.2);
    obj.textEditor9:setFontColor("#000000");
    obj.textEditor9:setField("Caixa_de_texto_21");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setName("textEditor9");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(334);
    obj.layout37:setTop(769);
    obj.layout37:setWidth(195);
    obj.layout37:setHeight(15);
    obj.layout37:setName("layout37");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout37);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(9);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(195);
    obj.edit17:setHeight(16);
    obj.edit17:setField("Caixa_de_texto_32");
    obj.edit17:setName("edit17");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(557);
    obj.layout38:setTop(781);
    obj.layout38:setWidth(35);
    obj.layout38:setHeight(3);
    obj.layout38:setName("layout38");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout38);
    obj.textEditor10:setLeft(0);
    obj.textEditor10:setTop(0);
    obj.textEditor10:setWidth(35);
    obj.textEditor10:setHeight(3);
    obj.textEditor10:setFontSize(14.2);
    obj.textEditor10:setFontColor("#000000");
    obj.textEditor10:setField("Caixa_de_texto_33");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setName("textEditor10");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(333);
    obj.layout39:setTop(798);
    obj.layout39:setWidth(195);
    obj.layout39:setHeight(15);
    obj.layout39:setName("layout39");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout39);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(9);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(195);
    obj.edit18:setHeight(16);
    obj.edit18:setField("Caixa_de_texto_32_2");
    obj.edit18:setName("edit18");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(259);
    obj.layout40:setTop(813);
    obj.layout40:setWidth(35);
    obj.layout40:setHeight(3);
    obj.layout40:setName("layout40");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout40);
    obj.textEditor11:setLeft(0);
    obj.textEditor11:setTop(0);
    obj.textEditor11:setWidth(35);
    obj.textEditor11:setHeight(3);
    obj.textEditor11:setFontSize(14.2);
    obj.textEditor11:setFontColor("#000000");
    obj.textEditor11:setField("Caixa_de_texto_22");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setName("textEditor11");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(557);
    obj.layout41:setTop(813);
    obj.layout41:setWidth(35);
    obj.layout41:setHeight(3);
    obj.layout41:setName("layout41");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout41);
    obj.textEditor12:setLeft(0);
    obj.textEditor12:setTop(0);
    obj.textEditor12:setWidth(35);
    obj.textEditor12:setHeight(3);
    obj.textEditor12:setFontSize(14.2);
    obj.textEditor12:setFontColor("#000000");
    obj.textEditor12:setField("Caixa_de_texto_34");
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setName("textEditor12");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(259);
    obj.layout42:setTop(844);
    obj.layout42:setWidth(35);
    obj.layout42:setHeight(3);
    obj.layout42:setName("layout42");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout42);
    obj.textEditor13:setLeft(0);
    obj.textEditor13:setTop(0);
    obj.textEditor13:setWidth(35);
    obj.textEditor13:setHeight(3);
    obj.textEditor13:setFontSize(14.2);
    obj.textEditor13:setFontColor("#000000");
    obj.textEditor13:setField("Caixa_de_texto_23");
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setName("textEditor13");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(334);
    obj.layout43:setTop(832);
    obj.layout43:setWidth(195);
    obj.layout43:setHeight(15);
    obj.layout43:setName("layout43");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout43);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(9);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(195);
    obj.edit19:setHeight(16);
    obj.edit19:setField("Caixa_de_texto_32_3");
    obj.edit19:setName("edit19");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(557);
    obj.layout44:setTop(844);
    obj.layout44:setWidth(35);
    obj.layout44:setHeight(3);
    obj.layout44:setName("layout44");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout44);
    obj.textEditor14:setLeft(0);
    obj.textEditor14:setTop(0);
    obj.textEditor14:setWidth(35);
    obj.textEditor14:setHeight(3);
    obj.textEditor14:setFontSize(14.2);
    obj.textEditor14:setFontColor("#000000");
    obj.textEditor14:setField("Caixa_de_texto_35");
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setName("textEditor14");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(259);
    obj.layout45:setTop(876);
    obj.layout45:setWidth(35);
    obj.layout45:setHeight(3);
    obj.layout45:setName("layout45");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout45);
    obj.textEditor15:setLeft(0);
    obj.textEditor15:setTop(0);
    obj.textEditor15:setWidth(35);
    obj.textEditor15:setHeight(3);
    obj.textEditor15:setFontSize(14.2);
    obj.textEditor15:setFontColor("#000000");
    obj.textEditor15:setField("Caixa_de_texto_24");
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setName("textEditor15");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(334);
    obj.layout46:setTop(864);
    obj.layout46:setWidth(195);
    obj.layout46:setHeight(15);
    obj.layout46:setName("layout46");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout46);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(9);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(195);
    obj.edit20:setHeight(16);
    obj.edit20:setField("Caixa_de_texto_32_4");
    obj.edit20:setName("edit20");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(557);
    obj.layout47:setTop(876);
    obj.layout47:setWidth(35);
    obj.layout47:setHeight(3);
    obj.layout47:setName("layout47");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout47);
    obj.textEditor16:setLeft(0);
    obj.textEditor16:setTop(0);
    obj.textEditor16:setWidth(35);
    obj.textEditor16:setHeight(3);
    obj.textEditor16:setFontSize(14.2);
    obj.textEditor16:setFontColor("#000000");
    obj.textEditor16:setField("Caixa_de_texto_36");
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setName("textEditor16");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(621);
    obj.layout48:setTop(749);
    obj.layout48:setWidth(258);
    obj.layout48:setHeight(151);
    obj.layout48:setName("layout48");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout48);
    obj.textEditor17:setLeft(0);
    obj.textEditor17:setTop(0);
    obj.textEditor17:setWidth(258);
    obj.textEditor17:setHeight(151);
    obj.textEditor17:setFontSize(14.2);
    obj.textEditor17:setFontColor("#000000");
    obj.textEditor17:setField("Caixa_de_texto_31");
    obj.textEditor17:setTransparent(true);
    obj.textEditor17:setName("textEditor17");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(259);
    obj.layout49:setTop(908);
    obj.layout49:setWidth(35);
    obj.layout49:setHeight(3);
    obj.layout49:setName("layout49");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout49);
    obj.textEditor18:setLeft(0);
    obj.textEditor18:setTop(0);
    obj.textEditor18:setWidth(35);
    obj.textEditor18:setHeight(3);
    obj.textEditor18:setFontSize(14.2);
    obj.textEditor18:setFontColor("#000000");
    obj.textEditor18:setField("Caixa_de_texto_25");
    obj.textEditor18:setTransparent(true);
    obj.textEditor18:setName("textEditor18");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(334);
    obj.layout50:setTop(896);
    obj.layout50:setWidth(195);
    obj.layout50:setHeight(15);
    obj.layout50:setName("layout50");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout50);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(9);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(195);
    obj.edit21:setHeight(16);
    obj.edit21:setField("Caixa_de_texto_32_5");
    obj.edit21:setName("edit21");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(557);
    obj.layout51:setTop(908);
    obj.layout51:setWidth(35);
    obj.layout51:setHeight(3);
    obj.layout51:setName("layout51");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout51);
    obj.textEditor19:setLeft(0);
    obj.textEditor19:setTop(0);
    obj.textEditor19:setWidth(35);
    obj.textEditor19:setHeight(3);
    obj.textEditor19:setFontSize(14.2);
    obj.textEditor19:setFontColor("#000000");
    obj.textEditor19:setField("Caixa_de_texto_37");
    obj.textEditor19:setTransparent(true);
    obj.textEditor19:setName("textEditor19");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(259);
    obj.layout52:setTop(940);
    obj.layout52:setWidth(35);
    obj.layout52:setHeight(3);
    obj.layout52:setName("layout52");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout52);
    obj.textEditor20:setLeft(0);
    obj.textEditor20:setTop(0);
    obj.textEditor20:setWidth(35);
    obj.textEditor20:setHeight(3);
    obj.textEditor20:setFontSize(14.2);
    obj.textEditor20:setFontColor("#000000");
    obj.textEditor20:setField("Caixa_de_texto_26");
    obj.textEditor20:setTransparent(true);
    obj.textEditor20:setName("textEditor20");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(259);
    obj.layout53:setTop(972);
    obj.layout53:setWidth(35);
    obj.layout53:setHeight(3);
    obj.layout53:setName("layout53");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout53);
    obj.textEditor21:setLeft(0);
    obj.textEditor21:setTop(0);
    obj.textEditor21:setWidth(35);
    obj.textEditor21:setHeight(3);
    obj.textEditor21:setFontSize(14.2);
    obj.textEditor21:setFontColor("#000000");
    obj.textEditor21:setField("Caixa_de_texto_27");
    obj.textEditor21:setTransparent(true);
    obj.textEditor21:setName("textEditor21");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(259);
    obj.layout54:setTop(1004);
    obj.layout54:setWidth(35);
    obj.layout54:setHeight(3);
    obj.layout54:setName("layout54");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.layout54);
    obj.textEditor22:setLeft(0);
    obj.textEditor22:setTop(0);
    obj.textEditor22:setWidth(35);
    obj.textEditor22:setHeight(3);
    obj.textEditor22:setFontSize(14.2);
    obj.textEditor22:setFontColor("#000000");
    obj.textEditor22:setField("Caixa_de_texto_28");
    obj.textEditor22:setTransparent(true);
    obj.textEditor22:setName("textEditor22");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(45);
    obj.layout55:setTop(1069);
    obj.layout55:setWidth(9);
    obj.layout55:setHeight(10);
    obj.layout55:setName("layout55");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout55);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setTop(0);
    obj.checkBox12:setWidth(9);
    obj.checkBox12:setHeight(11);
    obj.checkBox12:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_1");
    obj.checkBox12:setName("checkBox12");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(98);
    obj.layout56:setTop(1069);
    obj.layout56:setWidth(9);
    obj.layout56:setHeight(10);
    obj.layout56:setName("layout56");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout56);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(0);
    obj.checkBox13:setWidth(9);
    obj.checkBox13:setHeight(11);
    obj.checkBox13:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_3");
    obj.checkBox13:setName("checkBox13");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(119);
    obj.layout57:setTop(1069);
    obj.layout57:setWidth(9);
    obj.layout57:setHeight(10);
    obj.layout57:setName("layout57");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout57);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setTop(0);
    obj.checkBox14:setWidth(9);
    obj.checkBox14:setHeight(11);
    obj.checkBox14:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_4");
    obj.checkBox14:setName("checkBox14");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(151);
    obj.layout58:setTop(1069);
    obj.layout58:setWidth(9);
    obj.layout58:setHeight(10);
    obj.layout58:setName("layout58");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout58);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setTop(0);
    obj.checkBox15:setWidth(9);
    obj.checkBox15:setHeight(11);
    obj.checkBox15:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_5");
    obj.checkBox15:setName("checkBox15");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(225);
    obj.layout59:setTop(1069);
    obj.layout59:setWidth(9);
    obj.layout59:setHeight(10);
    obj.layout59:setName("layout59");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout59);
    obj.checkBox16:setLeft(0);
    obj.checkBox16:setTop(0);
    obj.checkBox16:setWidth(9);
    obj.checkBox16:setHeight(11);
    obj.checkBox16:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_8");
    obj.checkBox16:setName("checkBox16");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(197);
    obj.layout60:setTop(1066);
    obj.layout60:setWidth(13);
    obj.layout60:setHeight(14);
    obj.layout60:setName("layout60");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout60);
    obj.checkBox17:setLeft(0);
    obj.checkBox17:setTop(0);
    obj.checkBox17:setWidth(13);
    obj.checkBox17:setHeight(15);
    obj.checkBox17:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_7");
    obj.checkBox17:setName("checkBox17");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(248);
    obj.layout61:setTop(1066);
    obj.layout61:setWidth(13);
    obj.layout61:setHeight(14);
    obj.layout61:setName("layout61");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout61);
    obj.checkBox18:setLeft(0);
    obj.checkBox18:setTop(0);
    obj.checkBox18:setWidth(13);
    obj.checkBox18:setHeight(15);
    obj.checkBox18:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_9");
    obj.checkBox18:setName("checkBox18");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(172);
    obj.layout62:setTop(1067);
    obj.layout62:setWidth(13);
    obj.layout62:setHeight(14);
    obj.layout62:setName("layout62");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout62);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setTop(0);
    obj.checkBox19:setWidth(13);
    obj.checkBox19:setHeight(15);
    obj.checkBox19:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_6");
    obj.checkBox19:setName("checkBox19");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(278);
    obj.layout63:setTop(1067);
    obj.layout63:setWidth(13);
    obj.layout63:setHeight(14);
    obj.layout63:setName("layout63");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout63);
    obj.checkBox20:setLeft(0);
    obj.checkBox20:setTop(0);
    obj.checkBox20:setWidth(13);
    obj.checkBox20:setHeight(15);
    obj.checkBox20:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_10");
    obj.checkBox20:setName("checkBox20");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(323);
    obj.layout64:setTop(971);
    obj.layout64:setWidth(556);
    obj.layout64:setHeight(110);
    obj.layout64:setName("layout64");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout64);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(14.2);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(556);
    obj.edit22:setHeight(111);
    obj.edit22:setField("Caixa_de_texto_38");
    obj.edit22:setName("edit22");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(68);
    obj.layout65:setTop(1068);
    obj.layout65:setWidth(13);
    obj.layout65:setHeight(14);
    obj.layout65:setName("layout65");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout65);
    obj.checkBox21:setLeft(0);
    obj.checkBox21:setTop(0);
    obj.checkBox21:setWidth(13);
    obj.checkBox21:setHeight(15);
    obj.checkBox21:setField("Bot_C3_A3o_de_op_C3_A7_C3_A3o_2");
    obj.checkBox21:setName("checkBox21");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmficha_editavel_tftl1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmficha_editavel_tftl1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmficha_editavel_tftl1_svg = {
    newEditor = newfrmficha_editavel_tftl1_svg, 
    new = newfrmficha_editavel_tftl1_svg, 
    name = "frmficha_editavel_tftl1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmficha_editavel_tftl1_svg = _frmficha_editavel_tftl1_svg;
Firecast.registrarForm(_frmficha_editavel_tftl1_svg);

return _frmficha_editavel_tftl1_svg;
