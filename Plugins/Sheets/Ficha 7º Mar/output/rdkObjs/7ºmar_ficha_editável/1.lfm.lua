require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrm_7mar_ficha_editavel1_svg()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frm_7mar_ficha_editavel1_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1188);
    obj.rectangle1:setHeight(918);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1188);
    obj.image1:setHeight(918);
    obj.image1:setSRC("/7ºmar_ficha_editável/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(132);
    obj.layout1:setTop(85);
    obj.layout1:setWidth(236);
    obj.layout1:setHeight(28);
    obj.layout1:setName("layout1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(14.2);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(236);
    obj.edit1:setHeight(29);
    obj.edit1:setField("Jogador");
    obj.edit1:setName("edit1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(132);
    obj.layout2:setTop(109);
    obj.layout2:setWidth(236);
    obj.layout2:setHeight(28);
    obj.layout2:setName("layout2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(14.2);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(236);
    obj.edit2:setHeight(29);
    obj.edit2:setField("Personaguem");
    obj.edit2:setName("edit2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(132);
    obj.layout3:setTop(158);
    obj.layout3:setWidth(236);
    obj.layout3:setHeight(28);
    obj.layout3:setName("layout3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(14.2);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(236);
    obj.edit3:setHeight(29);
    obj.edit3:setField("nação");
    obj.edit3:setName("edit3");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(132);
    obj.layout4:setTop(134);
    obj.layout4:setWidth(236);
    obj.layout4:setHeight(28);
    obj.layout4:setName("layout4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(14.2);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(236);
    obj.edit4:setHeight(29);
    obj.edit4:setField("conceito");
    obj.edit4:setName("edit4");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(132);
    obj.layout5:setTop(182);
    obj.layout5:setWidth(236);
    obj.layout5:setHeight(28);
    obj.layout5:setName("layout5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(14.2);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(236);
    obj.edit5:setHeight(29);
    obj.edit5:setField("religião");
    obj.edit5:setName("edit5");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(132);
    obj.layout6:setTop(269);
    obj.layout6:setWidth(236);
    obj.layout6:setHeight(28);
    obj.layout6:setName("layout6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(14.2);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(236);
    obj.edit6:setHeight(29);
    obj.edit6:setField("riqueza");
    obj.edit6:setName("edit6");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(132);
    obj.layout7:setTop(220);
    obj.layout7:setWidth(236);
    obj.layout7:setHeight(42);
    obj.layout7:setName("layout7");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout7);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(236);
    obj.textEditor1:setHeight(42);
    obj.textEditor1:setFontSize(14.2);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("reputação");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(35);
    obj.layout8:setTop(362);
    obj.layout8:setWidth(351);
    obj.layout8:setHeight(121);
    obj.layout8:setName("layout8");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout8);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(351);
    obj.textEditor2:setHeight(121);
    obj.textEditor2:setFontSize(14.2);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("Arcana");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(134);
    obj.layout9:setTop(513);
    obj.layout9:setWidth(236);
    obj.layout9:setHeight(28);
    obj.layout9:setName("layout9");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(14.2);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(236);
    obj.edit7:setHeight(29);
    obj.edit7:setField("Nome_H");
    obj.edit7:setName("edit7");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(134);
    obj.layout10:setTop(537);
    obj.layout10:setWidth(236);
    obj.layout10:setHeight(28);
    obj.layout10:setName("layout10");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(14.2);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(236);
    obj.edit8:setHeight(29);
    obj.edit8:setField("Objetivo");
    obj.edit8:setName("edit8");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(38);
    obj.layout11:setTop(621);
    obj.layout11:setWidth(347);
    obj.layout11:setHeight(259);
    obj.layout11:setName("layout11");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout11);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(347);
    obj.textEditor3:setHeight(259);
    obj.textEditor3:setFontSize(14.2);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("Passo_1");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(134);
    obj.layout12:setTop(562);
    obj.layout12:setWidth(236);
    obj.layout12:setHeight(28);
    obj.layout12:setName("layout12");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(14.2);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(236);
    obj.edit9:setHeight(29);
    obj.edit9:setField("Recompensas");
    obj.edit9:setName("edit9");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(577);
    obj.layout13:setTop(87);
    obj.layout13:setWidth(25);
    obj.layout13:setHeight(22);
    obj.layout13:setName("layout13");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout13);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(25);
    obj.checkBox1:setHeight(23);
    obj.checkBox1:setField("Vigor_1");
    obj.checkBox1:setName("checkBox1");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(594);
    obj.layout14:setTop(87);
    obj.layout14:setWidth(25);
    obj.layout14:setHeight(22);
    obj.layout14:setName("layout14");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout14);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(25);
    obj.checkBox2:setHeight(23);
    obj.checkBox2:setField("Vigor_2");
    obj.checkBox2:setName("checkBox2");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(611);
    obj.layout15:setTop(86);
    obj.layout15:setWidth(25);
    obj.layout15:setHeight(22);
    obj.layout15:setName("layout15");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout15);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(25);
    obj.checkBox3:setHeight(23);
    obj.checkBox3:setField("Vigor_3");
    obj.checkBox3:setName("checkBox3");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(628);
    obj.layout16:setTop(86);
    obj.layout16:setWidth(25);
    obj.layout16:setHeight(22);
    obj.layout16:setName("layout16");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout16);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(25);
    obj.checkBox4:setHeight(23);
    obj.checkBox4:setField("Vigor_4");
    obj.checkBox4:setName("checkBox4");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(645);
    obj.layout17:setTop(86);
    obj.layout17:setWidth(25);
    obj.layout17:setHeight(22);
    obj.layout17:setName("layout17");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout17);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(25);
    obj.checkBox5:setHeight(23);
    obj.checkBox5:setField("Vigor_5");
    obj.checkBox5:setName("checkBox5");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(577);
    obj.layout18:setTop(111);
    obj.layout18:setWidth(25);
    obj.layout18:setHeight(22);
    obj.layout18:setName("layout18");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout18);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(25);
    obj.checkBox6:setHeight(23);
    obj.checkBox6:setField("Finesse_1");
    obj.checkBox6:setName("checkBox6");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(594);
    obj.layout19:setTop(111);
    obj.layout19:setWidth(25);
    obj.layout19:setHeight(22);
    obj.layout19:setName("layout19");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout19);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(25);
    obj.checkBox7:setHeight(23);
    obj.checkBox7:setField("Finesse_2");
    obj.checkBox7:setName("checkBox7");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(611);
    obj.layout20:setTop(111);
    obj.layout20:setWidth(25);
    obj.layout20:setHeight(22);
    obj.layout20:setName("layout20");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout20);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(25);
    obj.checkBox8:setHeight(23);
    obj.checkBox8:setField("Finesse_3");
    obj.checkBox8:setName("checkBox8");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(628);
    obj.layout21:setTop(111);
    obj.layout21:setWidth(25);
    obj.layout21:setHeight(22);
    obj.layout21:setName("layout21");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout21);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(25);
    obj.checkBox9:setHeight(23);
    obj.checkBox9:setField("Finesse_4");
    obj.checkBox9:setName("checkBox9");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(646);
    obj.layout22:setTop(111);
    obj.layout22:setWidth(25);
    obj.layout22:setHeight(22);
    obj.layout22:setName("layout22");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout22);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(25);
    obj.checkBox10:setHeight(23);
    obj.checkBox10:setField("Finesse_5");
    obj.checkBox10:setName("checkBox10");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(577);
    obj.layout23:setTop(136);
    obj.layout23:setWidth(25);
    obj.layout23:setHeight(22);
    obj.layout23:setName("layout23");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout23);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setTop(0);
    obj.checkBox11:setWidth(25);
    obj.checkBox11:setHeight(23);
    obj.checkBox11:setField("Argúcia_1");
    obj.checkBox11:setName("checkBox11");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(594);
    obj.layout24:setTop(136);
    obj.layout24:setWidth(25);
    obj.layout24:setHeight(22);
    obj.layout24:setName("layout24");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout24);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setTop(0);
    obj.checkBox12:setWidth(25);
    obj.checkBox12:setHeight(23);
    obj.checkBox12:setField("Argúcia_2");
    obj.checkBox12:setName("checkBox12");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(611);
    obj.layout25:setTop(136);
    obj.layout25:setWidth(25);
    obj.layout25:setHeight(22);
    obj.layout25:setName("layout25");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout25);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(0);
    obj.checkBox13:setWidth(25);
    obj.checkBox13:setHeight(23);
    obj.checkBox13:setField("Argúcia_3");
    obj.checkBox13:setName("checkBox13");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(628);
    obj.layout26:setTop(136);
    obj.layout26:setWidth(25);
    obj.layout26:setHeight(22);
    obj.layout26:setName("layout26");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout26);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setTop(0);
    obj.checkBox14:setWidth(25);
    obj.checkBox14:setHeight(23);
    obj.checkBox14:setField("Argúcia_4");
    obj.checkBox14:setName("checkBox14");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(646);
    obj.layout27:setTop(136);
    obj.layout27:setWidth(25);
    obj.layout27:setHeight(22);
    obj.layout27:setName("layout27");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout27);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setTop(0);
    obj.checkBox15:setWidth(25);
    obj.checkBox15:setHeight(23);
    obj.checkBox15:setField("Argúcia_5");
    obj.checkBox15:setName("checkBox15");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(577);
    obj.layout28:setTop(161);
    obj.layout28:setWidth(25);
    obj.layout28:setHeight(22);
    obj.layout28:setName("layout28");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout28);
    obj.checkBox16:setLeft(0);
    obj.checkBox16:setTop(0);
    obj.checkBox16:setWidth(25);
    obj.checkBox16:setHeight(23);
    obj.checkBox16:setField("Determinação_1");
    obj.checkBox16:setName("checkBox16");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(594);
    obj.layout29:setTop(161);
    obj.layout29:setWidth(25);
    obj.layout29:setHeight(22);
    obj.layout29:setName("layout29");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout29);
    obj.checkBox17:setLeft(0);
    obj.checkBox17:setTop(0);
    obj.checkBox17:setWidth(25);
    obj.checkBox17:setHeight(23);
    obj.checkBox17:setField("Determinação_2");
    obj.checkBox17:setName("checkBox17");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(611);
    obj.layout30:setTop(161);
    obj.layout30:setWidth(25);
    obj.layout30:setHeight(22);
    obj.layout30:setName("layout30");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout30);
    obj.checkBox18:setLeft(0);
    obj.checkBox18:setTop(0);
    obj.checkBox18:setWidth(25);
    obj.checkBox18:setHeight(23);
    obj.checkBox18:setField("Determinação_3");
    obj.checkBox18:setName("checkBox18");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(628);
    obj.layout31:setTop(160);
    obj.layout31:setWidth(25);
    obj.layout31:setHeight(22);
    obj.layout31:setName("layout31");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout31);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setTop(0);
    obj.checkBox19:setWidth(25);
    obj.checkBox19:setHeight(23);
    obj.checkBox19:setField("Determinação_4");
    obj.checkBox19:setName("checkBox19");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(646);
    obj.layout32:setTop(161);
    obj.layout32:setWidth(25);
    obj.layout32:setHeight(22);
    obj.layout32:setName("layout32");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout32);
    obj.checkBox20:setLeft(0);
    obj.checkBox20:setTop(0);
    obj.checkBox20:setWidth(25);
    obj.checkBox20:setHeight(23);
    obj.checkBox20:setField("Determinação_5");
    obj.checkBox20:setName("checkBox20");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(577);
    obj.layout33:setTop(185);
    obj.layout33:setWidth(25);
    obj.layout33:setHeight(22);
    obj.layout33:setName("layout33");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout33);
    obj.checkBox21:setLeft(0);
    obj.checkBox21:setTop(0);
    obj.checkBox21:setWidth(25);
    obj.checkBox21:setHeight(23);
    obj.checkBox21:setField("Panache_1");
    obj.checkBox21:setName("checkBox21");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(594);
    obj.layout34:setTop(185);
    obj.layout34:setWidth(25);
    obj.layout34:setHeight(22);
    obj.layout34:setName("layout34");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout34);
    obj.checkBox22:setLeft(0);
    obj.checkBox22:setTop(0);
    obj.checkBox22:setWidth(25);
    obj.checkBox22:setHeight(23);
    obj.checkBox22:setField("Panache_2");
    obj.checkBox22:setName("checkBox22");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(611);
    obj.layout35:setTop(185);
    obj.layout35:setWidth(25);
    obj.layout35:setHeight(22);
    obj.layout35:setName("layout35");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout35);
    obj.checkBox23:setLeft(0);
    obj.checkBox23:setTop(0);
    obj.checkBox23:setWidth(25);
    obj.checkBox23:setHeight(23);
    obj.checkBox23:setField("Panache_3");
    obj.checkBox23:setName("checkBox23");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(628);
    obj.layout36:setTop(185);
    obj.layout36:setWidth(25);
    obj.layout36:setHeight(22);
    obj.layout36:setName("layout36");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout36);
    obj.checkBox24:setLeft(0);
    obj.checkBox24:setTop(0);
    obj.checkBox24:setWidth(25);
    obj.checkBox24:setHeight(23);
    obj.checkBox24:setField("Panache_4");
    obj.checkBox24:setName("checkBox24");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(645);
    obj.layout37:setTop(185);
    obj.layout37:setWidth(25);
    obj.layout37:setHeight(22);
    obj.layout37:setName("layout37");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout37);
    obj.checkBox25:setLeft(0);
    obj.checkBox25:setTop(0);
    obj.checkBox25:setWidth(25);
    obj.checkBox25:setHeight(23);
    obj.checkBox25:setField("Panache_5");
    obj.checkBox25:setName("checkBox25");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(495);
    obj.layout38:setTop(263);
    obj.layout38:setWidth(25);
    obj.layout38:setHeight(22);
    obj.layout38:setName("layout38");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout38);
    obj.checkBox26:setLeft(0);
    obj.checkBox26:setTop(0);
    obj.checkBox26:setWidth(25);
    obj.checkBox26:setHeight(23);
    obj.checkBox26:setField("Mirar_1");
    obj.checkBox26:setName("checkBox26");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(512);
    obj.layout39:setTop(263);
    obj.layout39:setWidth(25);
    obj.layout39:setHeight(22);
    obj.layout39:setName("layout39");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout39);
    obj.checkBox27:setLeft(0);
    obj.checkBox27:setTop(0);
    obj.checkBox27:setWidth(25);
    obj.checkBox27:setHeight(23);
    obj.checkBox27:setField("Mirar_2");
    obj.checkBox27:setName("checkBox27");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(529);
    obj.layout40:setTop(263);
    obj.layout40:setWidth(25);
    obj.layout40:setHeight(22);
    obj.layout40:setName("layout40");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout40);
    obj.checkBox28:setLeft(0);
    obj.checkBox28:setTop(0);
    obj.checkBox28:setWidth(25);
    obj.checkBox28:setHeight(23);
    obj.checkBox28:setField("Mirar_3");
    obj.checkBox28:setName("checkBox28");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(545);
    obj.layout41:setTop(263);
    obj.layout41:setWidth(25);
    obj.layout41:setHeight(22);
    obj.layout41:setName("layout41");

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout41);
    obj.checkBox29:setLeft(0);
    obj.checkBox29:setTop(0);
    obj.checkBox29:setWidth(25);
    obj.checkBox29:setHeight(23);
    obj.checkBox29:setField("Mirar_4");
    obj.checkBox29:setName("checkBox29");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(562);
    obj.layout42:setTop(263);
    obj.layout42:setWidth(25);
    obj.layout42:setHeight(22);
    obj.layout42:setName("layout42");

    obj.checkBox30 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout42);
    obj.checkBox30:setLeft(0);
    obj.checkBox30:setTop(0);
    obj.checkBox30:setWidth(25);
    obj.checkBox30:setHeight(23);
    obj.checkBox30:setField("Mirar_5");
    obj.checkBox30:setName("checkBox30");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(495);
    obj.layout43:setTop(287);
    obj.layout43:setWidth(25);
    obj.layout43:setHeight(22);
    obj.layout43:setName("layout43");

    obj.checkBox31 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout43);
    obj.checkBox31:setLeft(0);
    obj.checkBox31:setTop(0);
    obj.checkBox31:setWidth(25);
    obj.checkBox31:setHeight(23);
    obj.checkBox31:setField("Atletismo_1");
    obj.checkBox31:setName("checkBox31");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(512);
    obj.layout44:setTop(287);
    obj.layout44:setWidth(25);
    obj.layout44:setHeight(22);
    obj.layout44:setName("layout44");

    obj.checkBox32 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout44);
    obj.checkBox32:setLeft(0);
    obj.checkBox32:setTop(0);
    obj.checkBox32:setWidth(25);
    obj.checkBox32:setHeight(23);
    obj.checkBox32:setField("Atletismo_2");
    obj.checkBox32:setName("checkBox32");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(529);
    obj.layout45:setTop(287);
    obj.layout45:setWidth(25);
    obj.layout45:setHeight(22);
    obj.layout45:setName("layout45");

    obj.checkBox33 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout45);
    obj.checkBox33:setLeft(0);
    obj.checkBox33:setTop(0);
    obj.checkBox33:setWidth(25);
    obj.checkBox33:setHeight(23);
    obj.checkBox33:setField("Atletismo_3");
    obj.checkBox33:setName("checkBox33");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(545);
    obj.layout46:setTop(287);
    obj.layout46:setWidth(25);
    obj.layout46:setHeight(22);
    obj.layout46:setName("layout46");

    obj.checkBox34 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout46);
    obj.checkBox34:setLeft(0);
    obj.checkBox34:setTop(0);
    obj.checkBox34:setWidth(25);
    obj.checkBox34:setHeight(23);
    obj.checkBox34:setField("Atletismo_4");
    obj.checkBox34:setName("checkBox34");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(562);
    obj.layout47:setTop(287);
    obj.layout47:setWidth(25);
    obj.layout47:setHeight(22);
    obj.layout47:setName("layout47");

    obj.checkBox35 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout47);
    obj.checkBox35:setLeft(0);
    obj.checkBox35:setTop(0);
    obj.checkBox35:setWidth(25);
    obj.checkBox35:setHeight(23);
    obj.checkBox35:setField("Atletismo_5");
    obj.checkBox35:setName("checkBox35");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(495);
    obj.layout48:setTop(312);
    obj.layout48:setWidth(25);
    obj.layout48:setHeight(22);
    obj.layout48:setName("layout48");

    obj.checkBox36 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout48);
    obj.checkBox36:setLeft(0);
    obj.checkBox36:setTop(0);
    obj.checkBox36:setWidth(25);
    obj.checkBox36:setHeight(23);
    obj.checkBox36:setField("Briga_1");
    obj.checkBox36:setName("checkBox36");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(512);
    obj.layout49:setTop(312);
    obj.layout49:setWidth(25);
    obj.layout49:setHeight(22);
    obj.layout49:setName("layout49");

    obj.checkBox37 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout49);
    obj.checkBox37:setLeft(0);
    obj.checkBox37:setTop(0);
    obj.checkBox37:setWidth(25);
    obj.checkBox37:setHeight(23);
    obj.checkBox37:setField("Briga_2");
    obj.checkBox37:setName("checkBox37");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(529);
    obj.layout50:setTop(312);
    obj.layout50:setWidth(25);
    obj.layout50:setHeight(22);
    obj.layout50:setName("layout50");

    obj.checkBox38 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout50);
    obj.checkBox38:setLeft(0);
    obj.checkBox38:setTop(0);
    obj.checkBox38:setWidth(25);
    obj.checkBox38:setHeight(23);
    obj.checkBox38:setField("Briga_3");
    obj.checkBox38:setName("checkBox38");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(545);
    obj.layout51:setTop(312);
    obj.layout51:setWidth(25);
    obj.layout51:setHeight(22);
    obj.layout51:setName("layout51");

    obj.checkBox39 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout51);
    obj.checkBox39:setLeft(0);
    obj.checkBox39:setTop(0);
    obj.checkBox39:setWidth(25);
    obj.checkBox39:setHeight(23);
    obj.checkBox39:setField("Briga_4");
    obj.checkBox39:setName("checkBox39");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(562);
    obj.layout52:setTop(312);
    obj.layout52:setWidth(25);
    obj.layout52:setHeight(22);
    obj.layout52:setName("layout52");

    obj.checkBox40 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout52);
    obj.checkBox40:setLeft(0);
    obj.checkBox40:setTop(0);
    obj.checkBox40:setWidth(25);
    obj.checkBox40:setHeight(23);
    obj.checkBox40:setField("Briga_5");
    obj.checkBox40:setName("checkBox40");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(495);
    obj.layout53:setTop(337);
    obj.layout53:setWidth(25);
    obj.layout53:setHeight(22);
    obj.layout53:setName("layout53");

    obj.checkBox41 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout53);
    obj.checkBox41:setLeft(0);
    obj.checkBox41:setTop(0);
    obj.checkBox41:setWidth(25);
    obj.checkBox41:setHeight(23);
    obj.checkBox41:setField("Convencer_1");
    obj.checkBox41:setName("checkBox41");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(512);
    obj.layout54:setTop(337);
    obj.layout54:setWidth(25);
    obj.layout54:setHeight(22);
    obj.layout54:setName("layout54");

    obj.checkBox42 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout54);
    obj.checkBox42:setLeft(0);
    obj.checkBox42:setTop(0);
    obj.checkBox42:setWidth(25);
    obj.checkBox42:setHeight(23);
    obj.checkBox42:setField("Convencer_2");
    obj.checkBox42:setName("checkBox42");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(529);
    obj.layout55:setTop(337);
    obj.layout55:setWidth(25);
    obj.layout55:setHeight(22);
    obj.layout55:setName("layout55");

    obj.checkBox43 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout55);
    obj.checkBox43:setLeft(0);
    obj.checkBox43:setTop(0);
    obj.checkBox43:setWidth(25);
    obj.checkBox43:setHeight(23);
    obj.checkBox43:setField("Convencer_3");
    obj.checkBox43:setName("checkBox43");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(545);
    obj.layout56:setTop(337);
    obj.layout56:setWidth(25);
    obj.layout56:setHeight(22);
    obj.layout56:setName("layout56");

    obj.checkBox44 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout56);
    obj.checkBox44:setLeft(0);
    obj.checkBox44:setTop(0);
    obj.checkBox44:setWidth(25);
    obj.checkBox44:setHeight(23);
    obj.checkBox44:setField("Convencer_4");
    obj.checkBox44:setName("checkBox44");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(562);
    obj.layout57:setTop(337);
    obj.layout57:setWidth(25);
    obj.layout57:setHeight(22);
    obj.layout57:setName("layout57");

    obj.checkBox45 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout57);
    obj.checkBox45:setLeft(0);
    obj.checkBox45:setTop(0);
    obj.checkBox45:setWidth(25);
    obj.checkBox45:setHeight(23);
    obj.checkBox45:setField("Convencer_5");
    obj.checkBox45:setName("checkBox45");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(495);
    obj.layout58:setTop(362);
    obj.layout58:setWidth(25);
    obj.layout58:setHeight(22);
    obj.layout58:setName("layout58");

    obj.checkBox46 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout58);
    obj.checkBox46:setLeft(0);
    obj.checkBox46:setTop(0);
    obj.checkBox46:setWidth(25);
    obj.checkBox46:setHeight(23);
    obj.checkBox46:setField("Empatia_1");
    obj.checkBox46:setName("checkBox46");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(511);
    obj.layout59:setTop(361);
    obj.layout59:setWidth(25);
    obj.layout59:setHeight(22);
    obj.layout59:setName("layout59");

    obj.checkBox47 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout59);
    obj.checkBox47:setLeft(0);
    obj.checkBox47:setTop(0);
    obj.checkBox47:setWidth(25);
    obj.checkBox47:setHeight(23);
    obj.checkBox47:setField("Empatia_2");
    obj.checkBox47:setName("checkBox47");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(528);
    obj.layout60:setTop(361);
    obj.layout60:setWidth(25);
    obj.layout60:setHeight(22);
    obj.layout60:setName("layout60");

    obj.checkBox48 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout60);
    obj.checkBox48:setLeft(0);
    obj.checkBox48:setTop(0);
    obj.checkBox48:setWidth(25);
    obj.checkBox48:setHeight(23);
    obj.checkBox48:setField("Empatia_3");
    obj.checkBox48:setName("checkBox48");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(545);
    obj.layout61:setTop(361);
    obj.layout61:setWidth(25);
    obj.layout61:setHeight(22);
    obj.layout61:setName("layout61");

    obj.checkBox49 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout61);
    obj.checkBox49:setLeft(0);
    obj.checkBox49:setTop(0);
    obj.checkBox49:setWidth(25);
    obj.checkBox49:setHeight(23);
    obj.checkBox49:setField("Empatia_4");
    obj.checkBox49:setName("checkBox49");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(562);
    obj.layout62:setTop(361);
    obj.layout62:setWidth(25);
    obj.layout62:setHeight(22);
    obj.layout62:setName("layout62");

    obj.checkBox50 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout62);
    obj.checkBox50:setLeft(0);
    obj.checkBox50:setTop(0);
    obj.checkBox50:setWidth(25);
    obj.checkBox50:setHeight(23);
    obj.checkBox50:setField("Empatia_5");
    obj.checkBox50:setName("checkBox50");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(495);
    obj.layout63:setTop(386);
    obj.layout63:setWidth(25);
    obj.layout63:setHeight(22);
    obj.layout63:setName("layout63");

    obj.checkBox51 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout63);
    obj.checkBox51:setLeft(0);
    obj.checkBox51:setTop(0);
    obj.checkBox51:setWidth(25);
    obj.checkBox51:setHeight(23);
    obj.checkBox51:setField("Esconder_1");
    obj.checkBox51:setName("checkBox51");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(512);
    obj.layout64:setTop(386);
    obj.layout64:setWidth(25);
    obj.layout64:setHeight(22);
    obj.layout64:setName("layout64");

    obj.checkBox52 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout64);
    obj.checkBox52:setLeft(0);
    obj.checkBox52:setTop(0);
    obj.checkBox52:setWidth(25);
    obj.checkBox52:setHeight(23);
    obj.checkBox52:setField("Esconder_2");
    obj.checkBox52:setName("checkBox52");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(529);
    obj.layout65:setTop(386);
    obj.layout65:setWidth(25);
    obj.layout65:setHeight(22);
    obj.layout65:setName("layout65");

    obj.checkBox53 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout65);
    obj.checkBox53:setLeft(0);
    obj.checkBox53:setTop(0);
    obj.checkBox53:setWidth(25);
    obj.checkBox53:setHeight(23);
    obj.checkBox53:setField("Esconder_3");
    obj.checkBox53:setName("checkBox53");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(545);
    obj.layout66:setTop(386);
    obj.layout66:setWidth(25);
    obj.layout66:setHeight(22);
    obj.layout66:setName("layout66");

    obj.checkBox54 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout66);
    obj.checkBox54:setLeft(0);
    obj.checkBox54:setTop(0);
    obj.checkBox54:setWidth(25);
    obj.checkBox54:setHeight(23);
    obj.checkBox54:setField("Esconder_4");
    obj.checkBox54:setName("checkBox54");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(562);
    obj.layout67:setTop(386);
    obj.layout67:setWidth(25);
    obj.layout67:setHeight(22);
    obj.layout67:setName("layout67");

    obj.checkBox55 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout67);
    obj.checkBox55:setLeft(0);
    obj.checkBox55:setTop(0);
    obj.checkBox55:setWidth(25);
    obj.checkBox55:setHeight(23);
    obj.checkBox55:setField("Esconder_5");
    obj.checkBox55:setName("checkBox55");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(495);
    obj.layout68:setTop(411);
    obj.layout68:setWidth(25);
    obj.layout68:setHeight(22);
    obj.layout68:setName("layout68");

    obj.checkBox56 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout68);
    obj.checkBox56:setLeft(0);
    obj.checkBox56:setTop(0);
    obj.checkBox56:setWidth(25);
    obj.checkBox56:setHeight(23);
    obj.checkBox56:setField("Intimidar_1");
    obj.checkBox56:setName("checkBox56");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(511);
    obj.layout69:setTop(411);
    obj.layout69:setWidth(25);
    obj.layout69:setHeight(22);
    obj.layout69:setName("layout69");

    obj.checkBox57 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout69);
    obj.checkBox57:setLeft(0);
    obj.checkBox57:setTop(0);
    obj.checkBox57:setWidth(25);
    obj.checkBox57:setHeight(23);
    obj.checkBox57:setField("Intimidar_2");
    obj.checkBox57:setName("checkBox57");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(528);
    obj.layout70:setTop(411);
    obj.layout70:setWidth(25);
    obj.layout70:setHeight(22);
    obj.layout70:setName("layout70");

    obj.checkBox58 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout70);
    obj.checkBox58:setLeft(0);
    obj.checkBox58:setTop(0);
    obj.checkBox58:setWidth(25);
    obj.checkBox58:setHeight(23);
    obj.checkBox58:setField("Intimidar_3");
    obj.checkBox58:setName("checkBox58");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(545);
    obj.layout71:setTop(411);
    obj.layout71:setWidth(25);
    obj.layout71:setHeight(22);
    obj.layout71:setName("layout71");

    obj.checkBox59 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout71);
    obj.checkBox59:setLeft(0);
    obj.checkBox59:setTop(0);
    obj.checkBox59:setWidth(25);
    obj.checkBox59:setHeight(23);
    obj.checkBox59:setField("Intimidar_4");
    obj.checkBox59:setName("checkBox59");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(562);
    obj.layout72:setTop(411);
    obj.layout72:setWidth(25);
    obj.layout72:setHeight(22);
    obj.layout72:setName("layout72");

    obj.checkBox60 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout72);
    obj.checkBox60:setLeft(0);
    obj.checkBox60:setTop(0);
    obj.checkBox60:setWidth(25);
    obj.checkBox60:setHeight(23);
    obj.checkBox60:setField("Intimidar_5");
    obj.checkBox60:setName("checkBox60");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(495);
    obj.layout73:setTop(454);
    obj.layout73:setWidth(25);
    obj.layout73:setHeight(22);
    obj.layout73:setName("layout73");

    obj.checkBox61 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout73);
    obj.checkBox61:setLeft(0);
    obj.checkBox61:setTop(0);
    obj.checkBox61:setWidth(25);
    obj.checkBox61:setHeight(23);
    obj.checkBox61:setField("Observar_1");
    obj.checkBox61:setName("checkBox61");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(512);
    obj.layout74:setTop(454);
    obj.layout74:setWidth(25);
    obj.layout74:setHeight(22);
    obj.layout74:setName("layout74");

    obj.checkBox62 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout74);
    obj.checkBox62:setLeft(0);
    obj.checkBox62:setTop(0);
    obj.checkBox62:setWidth(25);
    obj.checkBox62:setHeight(23);
    obj.checkBox62:setField("Observar_2");
    obj.checkBox62:setName("checkBox62");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(529);
    obj.layout75:setTop(454);
    obj.layout75:setWidth(25);
    obj.layout75:setHeight(22);
    obj.layout75:setName("layout75");

    obj.checkBox63 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout75);
    obj.checkBox63:setLeft(0);
    obj.checkBox63:setTop(0);
    obj.checkBox63:setWidth(25);
    obj.checkBox63:setHeight(23);
    obj.checkBox63:setField("Observar_3");
    obj.checkBox63:setName("checkBox63");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(545);
    obj.layout76:setTop(454);
    obj.layout76:setWidth(25);
    obj.layout76:setHeight(22);
    obj.layout76:setName("layout76");

    obj.checkBox64 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout76);
    obj.checkBox64:setLeft(0);
    obj.checkBox64:setTop(0);
    obj.checkBox64:setWidth(25);
    obj.checkBox64:setHeight(23);
    obj.checkBox64:setField("Observar_4");
    obj.checkBox64:setName("checkBox64");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(562);
    obj.layout77:setTop(454);
    obj.layout77:setWidth(25);
    obj.layout77:setHeight(22);
    obj.layout77:setName("layout77");

    obj.checkBox65 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout77);
    obj.checkBox65:setLeft(0);
    obj.checkBox65:setTop(0);
    obj.checkBox65:setWidth(25);
    obj.checkBox65:setHeight(23);
    obj.checkBox65:setField("Observar_5");
    obj.checkBox65:setName("checkBox65");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(684);
    obj.layout78:setTop(263);
    obj.layout78:setWidth(25);
    obj.layout78:setHeight(22);
    obj.layout78:setName("layout78");

    obj.checkBox66 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout78);
    obj.checkBox66:setLeft(0);
    obj.checkBox66:setTop(0);
    obj.checkBox66:setWidth(25);
    obj.checkBox66:setHeight(23);
    obj.checkBox66:setField("Atuar_1");
    obj.checkBox66:setName("checkBox66");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(701);
    obj.layout79:setTop(263);
    obj.layout79:setWidth(25);
    obj.layout79:setHeight(22);
    obj.layout79:setName("layout79");

    obj.checkBox67 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout79);
    obj.checkBox67:setLeft(0);
    obj.checkBox67:setTop(0);
    obj.checkBox67:setWidth(25);
    obj.checkBox67:setHeight(23);
    obj.checkBox67:setField("Atuar_2");
    obj.checkBox67:setName("checkBox67");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(718);
    obj.layout80:setTop(263);
    obj.layout80:setWidth(25);
    obj.layout80:setHeight(22);
    obj.layout80:setName("layout80");

    obj.checkBox68 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout80);
    obj.checkBox68:setLeft(0);
    obj.checkBox68:setTop(0);
    obj.checkBox68:setWidth(25);
    obj.checkBox68:setHeight(23);
    obj.checkBox68:setField("Atuar_3");
    obj.checkBox68:setName("checkBox68");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(734);
    obj.layout81:setTop(263);
    obj.layout81:setWidth(25);
    obj.layout81:setHeight(22);
    obj.layout81:setName("layout81");

    obj.checkBox69 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout81);
    obj.checkBox69:setLeft(0);
    obj.checkBox69:setTop(0);
    obj.checkBox69:setWidth(25);
    obj.checkBox69:setHeight(23);
    obj.checkBox69:setField("Atuar_4");
    obj.checkBox69:setName("checkBox69");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(751);
    obj.layout82:setTop(263);
    obj.layout82:setWidth(25);
    obj.layout82:setHeight(22);
    obj.layout82:setName("layout82");

    obj.checkBox70 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout82);
    obj.checkBox70:setLeft(0);
    obj.checkBox70:setTop(0);
    obj.checkBox70:setWidth(25);
    obj.checkBox70:setHeight(23);
    obj.checkBox70:setField("Atuar_5");
    obj.checkBox70:setName("checkBox70");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(684);
    obj.layout83:setTop(288);
    obj.layout83:setWidth(25);
    obj.layout83:setHeight(22);
    obj.layout83:setName("layout83");

    obj.checkBox71 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout83);
    obj.checkBox71:setLeft(0);
    obj.checkBox71:setTop(0);
    obj.checkBox71:setWidth(25);
    obj.checkBox71:setHeight(23);
    obj.checkBox71:setField("Cavalgar_1");
    obj.checkBox71:setName("checkBox71");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(701);
    obj.layout84:setTop(288);
    obj.layout84:setWidth(25);
    obj.layout84:setHeight(22);
    obj.layout84:setName("layout84");

    obj.checkBox72 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout84);
    obj.checkBox72:setLeft(0);
    obj.checkBox72:setTop(0);
    obj.checkBox72:setWidth(25);
    obj.checkBox72:setHeight(23);
    obj.checkBox72:setField("Cavalgar_2");
    obj.checkBox72:setName("checkBox72");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(718);
    obj.layout85:setTop(288);
    obj.layout85:setWidth(25);
    obj.layout85:setHeight(22);
    obj.layout85:setName("layout85");

    obj.checkBox73 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout85);
    obj.checkBox73:setLeft(0);
    obj.checkBox73:setTop(0);
    obj.checkBox73:setWidth(25);
    obj.checkBox73:setHeight(23);
    obj.checkBox73:setField("Cavalgar_3");
    obj.checkBox73:setName("checkBox73");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(734);
    obj.layout86:setTop(287);
    obj.layout86:setWidth(25);
    obj.layout86:setHeight(22);
    obj.layout86:setName("layout86");

    obj.checkBox74 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout86);
    obj.checkBox74:setLeft(0);
    obj.checkBox74:setTop(0);
    obj.checkBox74:setWidth(25);
    obj.checkBox74:setHeight(23);
    obj.checkBox74:setField("Cavalgar_4");
    obj.checkBox74:setName("checkBox74");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(751);
    obj.layout87:setTop(288);
    obj.layout87:setWidth(25);
    obj.layout87:setHeight(22);
    obj.layout87:setName("layout87");

    obj.checkBox75 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.layout87);
    obj.checkBox75:setLeft(0);
    obj.checkBox75:setTop(0);
    obj.checkBox75:setWidth(25);
    obj.checkBox75:setHeight(23);
    obj.checkBox75:setField("Cavalgar_5");
    obj.checkBox75:setName("checkBox75");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(684);
    obj.layout88:setTop(312);
    obj.layout88:setWidth(25);
    obj.layout88:setHeight(22);
    obj.layout88:setName("layout88");

    obj.checkBox76 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.layout88);
    obj.checkBox76:setLeft(0);
    obj.checkBox76:setTop(0);
    obj.checkBox76:setWidth(25);
    obj.checkBox76:setHeight(23);
    obj.checkBox76:setField("Navegar_1");
    obj.checkBox76:setName("checkBox76");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(701);
    obj.layout89:setTop(312);
    obj.layout89:setWidth(25);
    obj.layout89:setHeight(22);
    obj.layout89:setName("layout89");

    obj.checkBox77 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.layout89);
    obj.checkBox77:setLeft(0);
    obj.checkBox77:setTop(0);
    obj.checkBox77:setWidth(25);
    obj.checkBox77:setHeight(23);
    obj.checkBox77:setField("Navegar_2");
    obj.checkBox77:setName("checkBox77");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(718);
    obj.layout90:setTop(312);
    obj.layout90:setWidth(25);
    obj.layout90:setHeight(22);
    obj.layout90:setName("layout90");

    obj.checkBox78 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.layout90);
    obj.checkBox78:setLeft(0);
    obj.checkBox78:setTop(0);
    obj.checkBox78:setWidth(25);
    obj.checkBox78:setHeight(23);
    obj.checkBox78:setField("Navegar_3");
    obj.checkBox78:setName("checkBox78");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(734);
    obj.layout91:setTop(312);
    obj.layout91:setWidth(25);
    obj.layout91:setHeight(22);
    obj.layout91:setName("layout91");

    obj.checkBox79 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.layout91);
    obj.checkBox79:setLeft(0);
    obj.checkBox79:setTop(0);
    obj.checkBox79:setWidth(25);
    obj.checkBox79:setHeight(23);
    obj.checkBox79:setField("Navegar_4");
    obj.checkBox79:setName("checkBox79");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(751);
    obj.layout92:setTop(312);
    obj.layout92:setWidth(25);
    obj.layout92:setHeight(22);
    obj.layout92:setName("layout92");

    obj.checkBox80 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.layout92);
    obj.checkBox80:setLeft(0);
    obj.checkBox80:setTop(0);
    obj.checkBox80:setWidth(25);
    obj.checkBox80:setHeight(23);
    obj.checkBox80:setField("Navegar_5");
    obj.checkBox80:setName("checkBox80");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(684);
    obj.layout93:setTop(337);
    obj.layout93:setWidth(25);
    obj.layout93:setHeight(22);
    obj.layout93:setName("layout93");

    obj.checkBox81 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.layout93);
    obj.checkBox81:setLeft(0);
    obj.checkBox81:setTop(0);
    obj.checkBox81:setWidth(25);
    obj.checkBox81:setHeight(23);
    obj.checkBox81:setField("Erudição_1");
    obj.checkBox81:setName("checkBox81");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(701);
    obj.layout94:setTop(337);
    obj.layout94:setWidth(25);
    obj.layout94:setHeight(22);
    obj.layout94:setName("layout94");

    obj.checkBox82 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.layout94);
    obj.checkBox82:setLeft(0);
    obj.checkBox82:setTop(0);
    obj.checkBox82:setWidth(25);
    obj.checkBox82:setHeight(23);
    obj.checkBox82:setField("Erudição_2");
    obj.checkBox82:setName("checkBox82");

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(718);
    obj.layout95:setTop(337);
    obj.layout95:setWidth(25);
    obj.layout95:setHeight(22);
    obj.layout95:setName("layout95");

    obj.checkBox83 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.layout95);
    obj.checkBox83:setLeft(0);
    obj.checkBox83:setTop(0);
    obj.checkBox83:setWidth(25);
    obj.checkBox83:setHeight(23);
    obj.checkBox83:setField("Erudição_3");
    obj.checkBox83:setName("checkBox83");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(734);
    obj.layout96:setTop(337);
    obj.layout96:setWidth(25);
    obj.layout96:setHeight(22);
    obj.layout96:setName("layout96");

    obj.checkBox84 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.layout96);
    obj.checkBox84:setLeft(0);
    obj.checkBox84:setTop(0);
    obj.checkBox84:setWidth(25);
    obj.checkBox84:setHeight(23);
    obj.checkBox84:setField("Erudição_4");
    obj.checkBox84:setName("checkBox84");

    obj.layout97 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(751);
    obj.layout97:setTop(337);
    obj.layout97:setWidth(25);
    obj.layout97:setHeight(22);
    obj.layout97:setName("layout97");

    obj.checkBox85 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.layout97);
    obj.checkBox85:setLeft(0);
    obj.checkBox85:setTop(0);
    obj.checkBox85:setWidth(25);
    obj.checkBox85:setHeight(23);
    obj.checkBox85:setField("Erudição_5");
    obj.checkBox85:setName("checkBox85");

    obj.layout98 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(684);
    obj.layout98:setTop(362);
    obj.layout98:setWidth(25);
    obj.layout98:setHeight(22);
    obj.layout98:setName("layout98");

    obj.checkBox86 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.layout98);
    obj.checkBox86:setLeft(0);
    obj.checkBox86:setTop(0);
    obj.checkBox86:setWidth(25);
    obj.checkBox86:setHeight(23);
    obj.checkBox86:setField("Seduzir_1");
    obj.checkBox86:setName("checkBox86");

    obj.layout99 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(701);
    obj.layout99:setTop(361);
    obj.layout99:setWidth(25);
    obj.layout99:setHeight(22);
    obj.layout99:setName("layout99");

    obj.checkBox87 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.layout99);
    obj.checkBox87:setLeft(0);
    obj.checkBox87:setTop(0);
    obj.checkBox87:setWidth(25);
    obj.checkBox87:setHeight(23);
    obj.checkBox87:setField("Seduzir_2");
    obj.checkBox87:setName("checkBox87");

    obj.layout100 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(718);
    obj.layout100:setTop(361);
    obj.layout100:setWidth(25);
    obj.layout100:setHeight(22);
    obj.layout100:setName("layout100");

    obj.checkBox88 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.layout100);
    obj.checkBox88:setLeft(0);
    obj.checkBox88:setTop(0);
    obj.checkBox88:setWidth(25);
    obj.checkBox88:setHeight(23);
    obj.checkBox88:setField("Seduzir_3");
    obj.checkBox88:setName("checkBox88");

    obj.layout101 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(734);
    obj.layout101:setTop(361);
    obj.layout101:setWidth(25);
    obj.layout101:setHeight(22);
    obj.layout101:setName("layout101");

    obj.checkBox89 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.layout101);
    obj.checkBox89:setLeft(0);
    obj.checkBox89:setTop(0);
    obj.checkBox89:setWidth(25);
    obj.checkBox89:setHeight(23);
    obj.checkBox89:setField("Seduzir_4");
    obj.checkBox89:setName("checkBox89");

    obj.layout102 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(751);
    obj.layout102:setTop(361);
    obj.layout102:setWidth(25);
    obj.layout102:setHeight(22);
    obj.layout102:setName("layout102");

    obj.checkBox90 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.layout102);
    obj.checkBox90:setLeft(0);
    obj.checkBox90:setTop(0);
    obj.checkBox90:setWidth(25);
    obj.checkBox90:setHeight(23);
    obj.checkBox90:setField("Seduzir_5");
    obj.checkBox90:setName("checkBox90");

    obj.layout103 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(684);
    obj.layout103:setTop(386);
    obj.layout103:setWidth(25);
    obj.layout103:setHeight(22);
    obj.layout103:setName("layout103");

    obj.checkBox91 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.layout103);
    obj.checkBox91:setLeft(0);
    obj.checkBox91:setTop(0);
    obj.checkBox91:setWidth(25);
    obj.checkBox91:setHeight(23);
    obj.checkBox91:setField("Furto_1");
    obj.checkBox91:setName("checkBox91");

    obj.layout104 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(701);
    obj.layout104:setTop(386);
    obj.layout104:setWidth(25);
    obj.layout104:setHeight(22);
    obj.layout104:setName("layout104");

    obj.checkBox92 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox92:setParent(obj.layout104);
    obj.checkBox92:setLeft(0);
    obj.checkBox92:setTop(0);
    obj.checkBox92:setWidth(25);
    obj.checkBox92:setHeight(23);
    obj.checkBox92:setField("Furto2");
    obj.checkBox92:setName("checkBox92");

    obj.layout105 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(718);
    obj.layout105:setTop(386);
    obj.layout105:setWidth(25);
    obj.layout105:setHeight(22);
    obj.layout105:setName("layout105");

    obj.checkBox93 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox93:setParent(obj.layout105);
    obj.checkBox93:setLeft(0);
    obj.checkBox93:setTop(0);
    obj.checkBox93:setWidth(25);
    obj.checkBox93:setHeight(23);
    obj.checkBox93:setField("Furto_3");
    obj.checkBox93:setName("checkBox93");

    obj.layout106 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(734);
    obj.layout106:setTop(386);
    obj.layout106:setWidth(25);
    obj.layout106:setHeight(22);
    obj.layout106:setName("layout106");

    obj.checkBox94 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox94:setParent(obj.layout106);
    obj.checkBox94:setLeft(0);
    obj.checkBox94:setTop(0);
    obj.checkBox94:setWidth(25);
    obj.checkBox94:setHeight(23);
    obj.checkBox94:setField("Furto_4");
    obj.checkBox94:setName("checkBox94");

    obj.layout107 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(751);
    obj.layout107:setTop(386);
    obj.layout107:setWidth(25);
    obj.layout107:setHeight(22);
    obj.layout107:setName("layout107");

    obj.checkBox95 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox95:setParent(obj.layout107);
    obj.checkBox95:setLeft(0);
    obj.checkBox95:setTop(0);
    obj.checkBox95:setWidth(25);
    obj.checkBox95:setHeight(23);
    obj.checkBox95:setField("Furto_5");
    obj.checkBox95:setName("checkBox95");

    obj.layout108 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(684);
    obj.layout108:setTop(411);
    obj.layout108:setWidth(25);
    obj.layout108:setHeight(22);
    obj.layout108:setName("layout108");

    obj.checkBox96 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox96:setParent(obj.layout108);
    obj.checkBox96:setLeft(0);
    obj.checkBox96:setTop(0);
    obj.checkBox96:setWidth(25);
    obj.checkBox96:setHeight(23);
    obj.checkBox96:setField("Arte_da_Guerra_1");
    obj.checkBox96:setName("checkBox96");

    obj.layout109 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(701);
    obj.layout109:setTop(411);
    obj.layout109:setWidth(25);
    obj.layout109:setHeight(22);
    obj.layout109:setName("layout109");

    obj.checkBox97 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox97:setParent(obj.layout109);
    obj.checkBox97:setLeft(0);
    obj.checkBox97:setTop(0);
    obj.checkBox97:setWidth(25);
    obj.checkBox97:setHeight(23);
    obj.checkBox97:setField("Arte_da_Guerra_2");
    obj.checkBox97:setName("checkBox97");

    obj.layout110 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(718);
    obj.layout110:setTop(411);
    obj.layout110:setWidth(25);
    obj.layout110:setHeight(22);
    obj.layout110:setName("layout110");

    obj.checkBox98 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox98:setParent(obj.layout110);
    obj.checkBox98:setLeft(0);
    obj.checkBox98:setTop(0);
    obj.checkBox98:setWidth(25);
    obj.checkBox98:setHeight(23);
    obj.checkBox98:setField("Arte_da_Guerra_3");
    obj.checkBox98:setName("checkBox98");

    obj.layout111 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle1);
    obj.layout111:setLeft(734);
    obj.layout111:setTop(411);
    obj.layout111:setWidth(25);
    obj.layout111:setHeight(22);
    obj.layout111:setName("layout111");

    obj.checkBox99 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox99:setParent(obj.layout111);
    obj.checkBox99:setLeft(0);
    obj.checkBox99:setTop(0);
    obj.checkBox99:setWidth(25);
    obj.checkBox99:setHeight(23);
    obj.checkBox99:setField("Arte_da_Guerra_4");
    obj.checkBox99:setName("checkBox99");

    obj.layout112 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle1);
    obj.layout112:setLeft(751);
    obj.layout112:setTop(411);
    obj.layout112:setWidth(25);
    obj.layout112:setHeight(22);
    obj.layout112:setName("layout112");

    obj.checkBox100 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox100:setParent(obj.layout112);
    obj.checkBox100:setLeft(0);
    obj.checkBox100:setTop(0);
    obj.checkBox100:setWidth(25);
    obj.checkBox100:setHeight(23);
    obj.checkBox100:setField("Arte_da_Guerra_5");
    obj.checkBox100:setName("checkBox100");

    obj.layout113 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle1);
    obj.layout113:setLeft(684);
    obj.layout113:setTop(454);
    obj.layout113:setWidth(25);
    obj.layout113:setHeight(22);
    obj.layout113:setName("layout113");

    obj.checkBox101 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox101:setParent(obj.layout113);
    obj.checkBox101:setLeft(0);
    obj.checkBox101:setTop(0);
    obj.checkBox101:setWidth(25);
    obj.checkBox101:setHeight(23);
    obj.checkBox101:setField("Armas_1");
    obj.checkBox101:setName("checkBox101");

    obj.layout114 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle1);
    obj.layout114:setLeft(701);
    obj.layout114:setTop(454);
    obj.layout114:setWidth(25);
    obj.layout114:setHeight(22);
    obj.layout114:setName("layout114");

    obj.checkBox102 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox102:setParent(obj.layout114);
    obj.checkBox102:setLeft(0);
    obj.checkBox102:setTop(0);
    obj.checkBox102:setWidth(25);
    obj.checkBox102:setHeight(23);
    obj.checkBox102:setField("Armas_2");
    obj.checkBox102:setName("checkBox102");

    obj.layout115 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setLeft(718);
    obj.layout115:setTop(454);
    obj.layout115:setWidth(25);
    obj.layout115:setHeight(22);
    obj.layout115:setName("layout115");

    obj.checkBox103 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox103:setParent(obj.layout115);
    obj.checkBox103:setLeft(0);
    obj.checkBox103:setTop(0);
    obj.checkBox103:setWidth(25);
    obj.checkBox103:setHeight(23);
    obj.checkBox103:setField("Armas_3");
    obj.checkBox103:setName("checkBox103");

    obj.layout116 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle1);
    obj.layout116:setLeft(734);
    obj.layout116:setTop(454);
    obj.layout116:setWidth(25);
    obj.layout116:setHeight(22);
    obj.layout116:setName("layout116");

    obj.checkBox104 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox104:setParent(obj.layout116);
    obj.checkBox104:setLeft(0);
    obj.checkBox104:setTop(0);
    obj.checkBox104:setWidth(25);
    obj.checkBox104:setHeight(23);
    obj.checkBox104:setField("Armas_4");
    obj.checkBox104:setName("checkBox104");

    obj.layout117 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle1);
    obj.layout117:setLeft(751);
    obj.layout117:setTop(454);
    obj.layout117:setWidth(25);
    obj.layout117:setHeight(22);
    obj.layout117:setName("layout117");

    obj.checkBox105 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox105:setParent(obj.layout117);
    obj.checkBox105:setLeft(0);
    obj.checkBox105:setTop(0);
    obj.checkBox105:setWidth(25);
    obj.checkBox105:setHeight(23);
    obj.checkBox105:setField("Armas_5");
    obj.checkBox105:setName("checkBox105");

    obj.layout118 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle1);
    obj.layout118:setLeft(804);
    obj.layout118:setTop(93);
    obj.layout118:setWidth(348);
    obj.layout118:setHeight(139);
    obj.layout118:setName("layout118");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout118);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(348);
    obj.textEditor4:setHeight(139);
    obj.textEditor4:setFontSize(14.2);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("Formações");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout119 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle1);
    obj.layout119:setLeft(804);
    obj.layout119:setTop(273);
    obj.layout119:setWidth(350);
    obj.layout119:setHeight(604);
    obj.layout119:setName("layout119");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout119);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(350);
    obj.textEditor5:setHeight(604);
    obj.textEditor5:setFontSize(14.2);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("Vantagens");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout120 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle1);
    obj.layout120:setLeft(541);
    obj.layout120:setTop(693);
    obj.layout120:setWidth(38);
    obj.layout120:setHeight(41);
    obj.layout120:setName("layout120");

    obj.checkBox106 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox106:setParent(obj.layout120);
    obj.checkBox106:setLeft(0);
    obj.checkBox106:setTop(0);
    obj.checkBox106:setWidth(38);
    obj.checkBox106:setHeight(42);
    obj.checkBox106:setField("Dano_1");
    obj.checkBox106:setName("checkBox106");

    obj.layout121 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle1);
    obj.layout121:setLeft(555);
    obj.layout121:setTop(666);
    obj.layout121:setWidth(38);
    obj.layout121:setHeight(41);
    obj.layout121:setName("layout121");

    obj.checkBox107 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox107:setParent(obj.layout121);
    obj.checkBox107:setLeft(0);
    obj.checkBox107:setTop(0);
    obj.checkBox107:setWidth(38);
    obj.checkBox107:setHeight(42);
    obj.checkBox107:setField("Dano_2");
    obj.checkBox107:setName("checkBox107");

    obj.layout122 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle1);
    obj.layout122:setLeft(574);
    obj.layout122:setTop(639);
    obj.layout122:setWidth(38);
    obj.layout122:setHeight(41);
    obj.layout122:setName("layout122");

    obj.checkBox108 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox108:setParent(obj.layout122);
    obj.checkBox108:setLeft(0);
    obj.checkBox108:setTop(0);
    obj.checkBox108:setWidth(38);
    obj.checkBox108:setHeight(42);
    obj.checkBox108:setField("Dano_3");
    obj.checkBox108:setName("checkBox108");

    obj.layout123 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle1);
    obj.layout123:setLeft(598);
    obj.layout123:setTop(618);
    obj.layout123:setWidth(38);
    obj.layout123:setHeight(41);
    obj.layout123:setName("layout123");

    obj.checkBox109 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox109:setParent(obj.layout123);
    obj.checkBox109:setLeft(0);
    obj.checkBox109:setTop(0);
    obj.checkBox109:setWidth(38);
    obj.checkBox109:setHeight(42);
    obj.checkBox109:setField("Dano_4");
    obj.checkBox109:setName("checkBox109");

    obj.layout124 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle1);
    obj.layout124:setLeft(630);
    obj.layout124:setTop(605);
    obj.layout124:setWidth(38);
    obj.layout124:setHeight(41);
    obj.layout124:setName("layout124");

    obj.checkBox110 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox110:setParent(obj.layout124);
    obj.checkBox110:setLeft(0);
    obj.checkBox110:setTop(0);
    obj.checkBox110:setWidth(38);
    obj.checkBox110:setHeight(42);
    obj.checkBox110:setField("Dano_Crítico_1");
    obj.checkBox110:setName("checkBox110");

    obj.layout125 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle1);
    obj.layout125:setLeft(666);
    obj.layout125:setTop(608);
    obj.layout125:setWidth(38);
    obj.layout125:setHeight(41);
    obj.layout125:setName("layout125");

    obj.checkBox111 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox111:setParent(obj.layout125);
    obj.checkBox111:setLeft(0);
    obj.checkBox111:setTop(0);
    obj.checkBox111:setWidth(38);
    obj.checkBox111:setHeight(42);
    obj.checkBox111:setField("Dano_6");
    obj.checkBox111:setName("checkBox111");

    obj.layout126 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle1);
    obj.layout126:setLeft(695);
    obj.layout126:setTop(618);
    obj.layout126:setWidth(38);
    obj.layout126:setHeight(41);
    obj.layout126:setName("layout126");

    obj.checkBox112 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox112:setParent(obj.layout126);
    obj.checkBox112:setLeft(0);
    obj.checkBox112:setTop(0);
    obj.checkBox112:setWidth(38);
    obj.checkBox112:setHeight(42);
    obj.checkBox112:setField("Dano_7");
    obj.checkBox112:setName("checkBox112");

    obj.layout127 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle1);
    obj.layout127:setLeft(719);
    obj.layout127:setTop(641);
    obj.layout127:setWidth(38);
    obj.layout127:setHeight(41);
    obj.layout127:setName("layout127");

    obj.checkBox113 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox113:setParent(obj.layout127);
    obj.checkBox113:setLeft(0);
    obj.checkBox113:setTop(0);
    obj.checkBox113:setWidth(38);
    obj.checkBox113:setHeight(42);
    obj.checkBox113:setField("Dano_8");
    obj.checkBox113:setName("checkBox113");

    obj.layout128 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle1);
    obj.layout128:setLeft(737);
    obj.layout128:setTop(668);
    obj.layout128:setWidth(38);
    obj.layout128:setHeight(41);
    obj.layout128:setName("layout128");

    obj.checkBox114 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox114:setParent(obj.layout128);
    obj.checkBox114:setLeft(0);
    obj.checkBox114:setTop(0);
    obj.checkBox114:setWidth(38);
    obj.checkBox114:setHeight(42);
    obj.checkBox114:setField("Dano_9");
    obj.checkBox114:setName("checkBox114");

    obj.layout129 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setLeft(744);
    obj.layout129:setTop(705);
    obj.layout129:setWidth(38);
    obj.layout129:setHeight(41);
    obj.layout129:setName("layout129");

    obj.checkBox115 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox115:setParent(obj.layout129);
    obj.checkBox115:setLeft(0);
    obj.checkBox115:setTop(0);
    obj.checkBox115:setWidth(38);
    obj.checkBox115:setHeight(42);
    obj.checkBox115:setField("Dano_Crítico_2");
    obj.checkBox115:setName("checkBox115");

    obj.layout130 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setLeft(732);
    obj.layout130:setTop(738);
    obj.layout130:setWidth(38);
    obj.layout130:setHeight(41);
    obj.layout130:setName("layout130");

    obj.checkBox116 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox116:setParent(obj.layout130);
    obj.checkBox116:setLeft(0);
    obj.checkBox116:setTop(0);
    obj.checkBox116:setWidth(38);
    obj.checkBox116:setHeight(42);
    obj.checkBox116:setField("Dano_10");
    obj.checkBox116:setName("checkBox116");

    obj.layout131 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setLeft(710);
    obj.layout131:setTop(759);
    obj.layout131:setWidth(38);
    obj.layout131:setHeight(41);
    obj.layout131:setName("layout131");

    obj.checkBox117 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox117:setParent(obj.layout131);
    obj.checkBox117:setLeft(0);
    obj.checkBox117:setTop(0);
    obj.checkBox117:setWidth(38);
    obj.checkBox117:setHeight(42);
    obj.checkBox117:setField("Dano_11");
    obj.checkBox117:setName("checkBox117");

    obj.layout132 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle1);
    obj.layout132:setLeft(682);
    obj.layout132:setTop(772);
    obj.layout132:setWidth(38);
    obj.layout132:setHeight(41);
    obj.layout132:setName("layout132");

    obj.checkBox118 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox118:setParent(obj.layout132);
    obj.checkBox118:setLeft(0);
    obj.checkBox118:setTop(0);
    obj.checkBox118:setWidth(38);
    obj.checkBox118:setHeight(42);
    obj.checkBox118:setField("Dano_12");
    obj.checkBox118:setName("checkBox118");

    obj.layout133 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle1);
    obj.layout133:setLeft(651);
    obj.layout133:setTop(776);
    obj.layout133:setWidth(38);
    obj.layout133:setHeight(41);
    obj.layout133:setName("layout133");

    obj.checkBox119 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox119:setParent(obj.layout133);
    obj.checkBox119:setLeft(0);
    obj.checkBox119:setTop(0);
    obj.checkBox119:setWidth(38);
    obj.checkBox119:setHeight(42);
    obj.checkBox119:setField("Dano_13");
    obj.checkBox119:setName("checkBox119");

    obj.layout134 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle1);
    obj.layout134:setLeft(619);
    obj.layout134:setTop(761);
    obj.layout134:setWidth(38);
    obj.layout134:setHeight(41);
    obj.layout134:setName("layout134");

    obj.checkBox120 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox120:setParent(obj.layout134);
    obj.checkBox120:setLeft(0);
    obj.checkBox120:setTop(0);
    obj.checkBox120:setWidth(38);
    obj.checkBox120:setHeight(42);
    obj.checkBox120:setField("Dano_Crítico_3");
    obj.checkBox120:setName("checkBox120");

    obj.layout135 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle1);
    obj.layout135:setLeft(596);
    obj.layout135:setTop(734);
    obj.layout135:setWidth(38);
    obj.layout135:setHeight(41);
    obj.layout135:setName("layout135");

    obj.checkBox121 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox121:setParent(obj.layout135);
    obj.checkBox121:setLeft(0);
    obj.checkBox121:setTop(0);
    obj.checkBox121:setWidth(38);
    obj.checkBox121:setHeight(42);
    obj.checkBox121:setField("Dano_14");
    obj.checkBox121:setName("checkBox121");

    obj.layout136 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle1);
    obj.layout136:setLeft(592);
    obj.layout136:setTop(702);
    obj.layout136:setWidth(38);
    obj.layout136:setHeight(41);
    obj.layout136:setName("layout136");

    obj.checkBox122 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox122:setParent(obj.layout136);
    obj.checkBox122:setLeft(0);
    obj.checkBox122:setTop(0);
    obj.checkBox122:setWidth(38);
    obj.checkBox122:setHeight(42);
    obj.checkBox122:setField("Dano_15");
    obj.checkBox122:setName("checkBox122");

    obj.layout137 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle1);
    obj.layout137:setLeft(608);
    obj.layout137:setTop(676);
    obj.layout137:setWidth(38);
    obj.layout137:setHeight(41);
    obj.layout137:setName("layout137");

    obj.checkBox123 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox123:setParent(obj.layout137);
    obj.checkBox123:setLeft(0);
    obj.checkBox123:setTop(0);
    obj.checkBox123:setWidth(38);
    obj.checkBox123:setHeight(42);
    obj.checkBox123:setField("Dano_16");
    obj.checkBox123:setName("checkBox123");

    obj.layout138 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle1);
    obj.layout138:setLeft(638);
    obj.layout138:setTop(665);
    obj.layout138:setWidth(38);
    obj.layout138:setHeight(41);
    obj.layout138:setName("layout138");

    obj.checkBox124 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox124:setParent(obj.layout138);
    obj.checkBox124:setLeft(0);
    obj.checkBox124:setTop(0);
    obj.checkBox124:setWidth(38);
    obj.checkBox124:setHeight(42);
    obj.checkBox124:setField("Dano_17");
    obj.checkBox124:setName("checkBox124");

    obj.layout139 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle1);
    obj.layout139:setLeft(671);
    obj.layout139:setTop(679);
    obj.layout139:setWidth(38);
    obj.layout139:setHeight(41);
    obj.layout139:setName("layout139");

    obj.checkBox125 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox125:setParent(obj.layout139);
    obj.checkBox125:setLeft(0);
    obj.checkBox125:setTop(0);
    obj.checkBox125:setWidth(38);
    obj.checkBox125:setHeight(42);
    obj.checkBox125:setField("Dano_Crítico_4");
    obj.checkBox125:setName("checkBox125");

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
        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.checkBox120 ~= nil then self.checkBox120:destroy(); self.checkBox120 = nil; end;
        if self.checkBox124 ~= nil then self.checkBox124:destroy(); self.checkBox124 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.checkBox121 ~= nil then self.checkBox121:destroy(); self.checkBox121 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.checkBox113 ~= nil then self.checkBox113:destroy(); self.checkBox113 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.checkBox115 ~= nil then self.checkBox115:destroy(); self.checkBox115 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.checkBox119 ~= nil then self.checkBox119:destroy(); self.checkBox119 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.checkBox122 ~= nil then self.checkBox122:destroy(); self.checkBox122 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.checkBox125 ~= nil then self.checkBox125:destroy(); self.checkBox125 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.checkBox117 ~= nil then self.checkBox117:destroy(); self.checkBox117 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.checkBox118 ~= nil then self.checkBox118:destroy(); self.checkBox118 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.checkBox114 ~= nil then self.checkBox114:destroy(); self.checkBox114 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.checkBox123 ~= nil then self.checkBox123:destroy(); self.checkBox123 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.checkBox112 ~= nil then self.checkBox112:destroy(); self.checkBox112 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.checkBox116 ~= nil then self.checkBox116:destroy(); self.checkBox116 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frm_7mar_ficha_editavel1_svg = {
    newEditor = newfrm_7mar_ficha_editavel1_svg, 
    new = newfrm_7mar_ficha_editavel1_svg, 
    name = "frm_7mar_ficha_editavel1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frm_7mar_ficha_editavel1_svg = _frm_7mar_ficha_editavel1_svg;
rrpg.registrarForm(_frm_7mar_ficha_editavel1_svg);

return _frm_7mar_ficha_editavel1_svg;
