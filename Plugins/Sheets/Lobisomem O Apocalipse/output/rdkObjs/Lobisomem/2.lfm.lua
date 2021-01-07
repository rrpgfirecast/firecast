require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frma2_svg()
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
    obj:setName("frma2_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
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
    obj.image1:setSRC("/Lobisomem/images/dom.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(431);
    obj.layout1:setTop(1024);
    obj.layout1:setWidth(22);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout1);
    obj.imageCheckBox1:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox1:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox1:setLeft(0);
    obj.imageCheckBox1:setTop(0);
    obj.imageCheckBox1:setWidth(22);
    obj.imageCheckBox1:setHeight(26);
    obj.imageCheckBox1:setField("Talentos_10_41");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(451);
    obj.layout2:setTop(1024);
    obj.layout2:setWidth(22);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout2);
    obj.imageCheckBox2:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox2:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox2:setLeft(0);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(22);
    obj.imageCheckBox2:setHeight(26);
    obj.imageCheckBox2:setField("Talentos_10_51");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(367);
    obj.layout3:setTop(1024);
    obj.layout3:setWidth(22);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout3);
    obj.imageCheckBox3:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox3:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox3:setLeft(0);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(22);
    obj.imageCheckBox3:setHeight(26);
    obj.imageCheckBox3:setField("Talentos_10_11");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(389);
    obj.layout4:setTop(1024);
    obj.layout4:setWidth(22);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout4);
    obj.imageCheckBox4:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox4:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox4:setLeft(0);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(22);
    obj.imageCheckBox4:setHeight(26);
    obj.imageCheckBox4:setField("Talentos_10_21");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(410);
    obj.layout5:setTop(1024);
    obj.layout5:setWidth(22);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout5);
    obj.imageCheckBox5:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox5:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox5:setLeft(0);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(22);
    obj.imageCheckBox5:setHeight(26);
    obj.imageCheckBox5:setField("Talentos_10_31");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(451);
    obj.layout6:setTop(730);
    obj.layout6:setWidth(22);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout6);
    obj.imageCheckBox6:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox6:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox6:setLeft(0);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(22);
    obj.imageCheckBox6:setHeight(26);
    obj.imageCheckBox6:setField("Talentos_1_52");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(367);
    obj.layout7:setTop(730);
    obj.layout7:setWidth(22);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout7);
    obj.imageCheckBox7:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox7:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox7:setLeft(0);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(22);
    obj.imageCheckBox7:setHeight(26);
    obj.imageCheckBox7:setField("Talentos_1_11");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(389);
    obj.layout8:setTop(730);
    obj.layout8:setWidth(22);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout8);
    obj.imageCheckBox8:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox8:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox8:setLeft(0);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(22);
    obj.imageCheckBox8:setHeight(26);
    obj.imageCheckBox8:setField("Talentos_1_211");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(410);
    obj.layout9:setTop(730);
    obj.layout9:setWidth(22);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout9);
    obj.imageCheckBox9:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox9:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox9:setLeft(0);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(22);
    obj.imageCheckBox9:setHeight(26);
    obj.imageCheckBox9:setField("Talentos_1_31");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(431);
    obj.layout10:setTop(730);
    obj.layout10:setWidth(22);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout10);
    obj.imageCheckBox10:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox10:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox10:setLeft(0);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(22);
    obj.imageCheckBox10:setHeight(26);
    obj.imageCheckBox10:setField("Talentos_1_41");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(1061);
    obj.layout11:setTop(1549);
    obj.layout11:setWidth(192);
    obj.layout11:setHeight(33);
    obj.layout11:setName("layout11");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout11);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(22.6);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(192);
    obj.edit1:setHeight(34);
    obj.edit1:setField("Nvel");
    obj.edit1:setName("edit1");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(111);
    obj.layout12:setTop(723);
    obj.layout12:setWidth(253);
    obj.layout12:setHeight(33);
    obj.layout12:setName("layout12");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout12);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(22.6);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(253);
    obj.edit2:setHeight(34);
    obj.edit2:setField("Row7_18");
    obj.edit2:setName("edit2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(571);
    obj.layout13:setTop(724);
    obj.layout13:setWidth(406);
    obj.layout13:setHeight(33);
    obj.layout13:setName("layout13");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout13);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(22.6);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(406);
    obj.edit3:setHeight(34);
    obj.edit3:setField("Item_1");
    obj.edit3:setName("edit3");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(1069);
    obj.layout14:setTop(726);
    obj.layout14:setWidth(45);
    obj.layout14:setHeight(30);
    obj.layout14:setName("layout14");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout14);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(20.3);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(45);
    obj.edit4:setHeight(31);
    obj.edit4:setField("Gnose1_1");
    obj.edit4:setName("edit4");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(451);
    obj.layout15:setTop(763);
    obj.layout15:setWidth(22);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout15);
    obj.imageCheckBox11:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox11:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox11:setLeft(0);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(22);
    obj.imageCheckBox11:setHeight(26);
    obj.imageCheckBox11:setField("Talentos_2_51");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(367);
    obj.layout16:setTop(763);
    obj.layout16:setWidth(22);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout16);
    obj.imageCheckBox12:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox12:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox12:setLeft(0);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(22);
    obj.imageCheckBox12:setHeight(26);
    obj.imageCheckBox12:setField("Talentos_2_11");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(389);
    obj.layout17:setTop(763);
    obj.layout17:setWidth(22);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout17);
    obj.imageCheckBox13:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox13:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox13:setLeft(0);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(22);
    obj.imageCheckBox13:setHeight(26);
    obj.imageCheckBox13:setField("Talentos_2_21");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(410);
    obj.layout18:setTop(763);
    obj.layout18:setWidth(22);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout18);
    obj.imageCheckBox14:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox14:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox14:setLeft(0);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(22);
    obj.imageCheckBox14:setHeight(26);
    obj.imageCheckBox14:setField("Talentos_2_31");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(431);
    obj.layout19:setTop(763);
    obj.layout19:setWidth(22);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout19);
    obj.imageCheckBox15:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox15:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox15:setLeft(0);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(22);
    obj.imageCheckBox15:setHeight(26);
    obj.imageCheckBox15:setField("Talentos_2_41");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(1210);
    obj.layout20:setTop(725);
    obj.layout20:setWidth(45);
    obj.layout20:setHeight(30);
    obj.layout20:setName("layout20");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout20);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(20.3);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(45);
    obj.edit5:setHeight(31);
    obj.edit5:setField("Gnose");
    obj.edit5:setName("edit5");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(111);
    obj.layout21:setTop(754);
    obj.layout21:setWidth(253);
    obj.layout21:setHeight(33);
    obj.layout21:setName("layout21");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout21);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(22.6);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(253);
    obj.edit6:setHeight(34);
    obj.edit6:setField("Row1_19");
    obj.edit6:setName("edit6");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(592);
    obj.layout22:setTop(757);
    obj.layout22:setWidth(524);
    obj.layout22:setHeight(33);
    obj.layout22:setName("layout22");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout22);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(22.6);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(524);
    obj.edit7:setHeight(34);
    obj.edit7:setField("Poder_1");
    obj.edit7:setName("edit7");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(111);
    obj.layout23:setTop(786);
    obj.layout23:setWidth(253);
    obj.layout23:setHeight(33);
    obj.layout23:setName("layout23");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout23);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(22.6);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(253);
    obj.edit8:setHeight(34);
    obj.edit8:setField("Row7_20");
    obj.edit8:setName("edit8");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(451);
    obj.layout24:setTop(796);
    obj.layout24:setWidth(22);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout24);
    obj.imageCheckBox16:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox16:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox16:setLeft(0);
    obj.imageCheckBox16:setTop(0);
    obj.imageCheckBox16:setWidth(22);
    obj.imageCheckBox16:setHeight(26);
    obj.imageCheckBox16:setField("Talentos_3_51");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(367);
    obj.layout25:setTop(796);
    obj.layout25:setWidth(22);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout25);
    obj.imageCheckBox17:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox17:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox17:setLeft(0);
    obj.imageCheckBox17:setTop(0);
    obj.imageCheckBox17:setWidth(22);
    obj.imageCheckBox17:setHeight(26);
    obj.imageCheckBox17:setField("Talentos_3_11");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(389);
    obj.layout26:setTop(796);
    obj.layout26:setWidth(22);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout26);
    obj.imageCheckBox18:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox18:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox18:setLeft(0);
    obj.imageCheckBox18:setTop(0);
    obj.imageCheckBox18:setWidth(22);
    obj.imageCheckBox18:setHeight(26);
    obj.imageCheckBox18:setField("Talentos_3_21");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(410);
    obj.layout27:setTop(796);
    obj.layout27:setWidth(22);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout27);
    obj.imageCheckBox19:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox19:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox19:setLeft(0);
    obj.imageCheckBox19:setTop(0);
    obj.imageCheckBox19:setWidth(22);
    obj.imageCheckBox19:setHeight(26);
    obj.imageCheckBox19:setField("Talentos_3_31");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(431);
    obj.layout28:setTop(796);
    obj.layout28:setWidth(22);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout28);
    obj.imageCheckBox20:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox20:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox20:setLeft(0);
    obj.imageCheckBox20:setTop(0);
    obj.imageCheckBox20:setWidth(22);
    obj.imageCheckBox20:setHeight(26);
    obj.imageCheckBox20:setField("Talentos_3_41");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(571);
    obj.layout29:setTop(788);
    obj.layout29:setWidth(406);
    obj.layout29:setHeight(33);
    obj.layout29:setName("layout29");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout29);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(22.6);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(406);
    obj.edit9:setHeight(34);
    obj.edit9:setField("Item_2");
    obj.edit9:setName("edit9");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(1069);
    obj.layout30:setTop(788);
    obj.layout30:setWidth(45);
    obj.layout30:setHeight(33);
    obj.layout30:setName("layout30");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout30);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(22.6);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(45);
    obj.edit10:setHeight(34);
    obj.edit10:setField("Gnose1_2");
    obj.edit10:setName("edit10");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(451);
    obj.layout31:setTop(829);
    obj.layout31:setWidth(22);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout31);
    obj.imageCheckBox21:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox21:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox21:setLeft(0);
    obj.imageCheckBox21:setTop(0);
    obj.imageCheckBox21:setWidth(22);
    obj.imageCheckBox21:setHeight(26);
    obj.imageCheckBox21:setField("Talentos_4_51");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(367);
    obj.layout32:setTop(829);
    obj.layout32:setWidth(22);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout32);
    obj.imageCheckBox22:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox22:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox22:setLeft(0);
    obj.imageCheckBox22:setTop(0);
    obj.imageCheckBox22:setWidth(22);
    obj.imageCheckBox22:setHeight(26);
    obj.imageCheckBox22:setField("Talentos_4_11");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(389);
    obj.layout33:setTop(829);
    obj.layout33:setWidth(22);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout33);
    obj.imageCheckBox23:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox23:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox23:setLeft(0);
    obj.imageCheckBox23:setTop(0);
    obj.imageCheckBox23:setWidth(22);
    obj.imageCheckBox23:setHeight(26);
    obj.imageCheckBox23:setField("Talentos_4_21");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(410);
    obj.layout34:setTop(829);
    obj.layout34:setWidth(22);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout34);
    obj.imageCheckBox24:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox24:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox24:setLeft(0);
    obj.imageCheckBox24:setTop(0);
    obj.imageCheckBox24:setWidth(22);
    obj.imageCheckBox24:setHeight(26);
    obj.imageCheckBox24:setField("Talentos_4_31");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(431);
    obj.layout35:setTop(829);
    obj.layout35:setWidth(22);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout35);
    obj.imageCheckBox25:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox25:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox25:setLeft(0);
    obj.imageCheckBox25:setTop(0);
    obj.imageCheckBox25:setWidth(22);
    obj.imageCheckBox25:setHeight(26);
    obj.imageCheckBox25:setField("Talentos_4_41");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(1210);
    obj.layout36:setTop(787);
    obj.layout36:setWidth(45);
    obj.layout36:setHeight(33);
    obj.layout36:setName("layout36");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout36);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(22.6);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(45);
    obj.edit11:setHeight(34);
    obj.edit11:setField("Gnose_2");
    obj.edit11:setName("edit11");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(111);
    obj.layout37:setTop(820);
    obj.layout37:setWidth(253);
    obj.layout37:setHeight(33);
    obj.layout37:setName("layout37");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout37);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(22.6);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(253);
    obj.edit12:setHeight(34);
    obj.edit12:setField("Row1_21");
    obj.edit12:setName("edit12");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(592);
    obj.layout38:setTop(822);
    obj.layout38:setWidth(524);
    obj.layout38:setHeight(33);
    obj.layout38:setName("layout38");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout38);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(22.6);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(524);
    obj.edit13:setHeight(34);
    obj.edit13:setField("Poder_2");
    obj.edit13:setName("edit13");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(1120);
    obj.layout39:setTop(826);
    obj.layout39:setWidth(23);
    obj.layout39:setHeight(26);
    obj.layout39:setName("layout39");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout39);
    obj.imageCheckBox26:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox26:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox26:setLeft(0);
    obj.imageCheckBox26:setTop(0);
    obj.imageCheckBox26:setWidth(23);
    obj.imageCheckBox26:setHeight(27);
    obj.imageCheckBox26:setField("Vitalidade_92");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(111);
    obj.layout40:setTop(853);
    obj.layout40:setWidth(253);
    obj.layout40:setHeight(33);
    obj.layout40:setName("layout40");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout40);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(22.6);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(253);
    obj.edit14:setHeight(34);
    obj.edit14:setField("Row2_22");
    obj.edit14:setName("edit14");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(451);
    obj.layout41:setTop(859);
    obj.layout41:setWidth(22);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout41);
    obj.imageCheckBox27:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox27:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox27:setLeft(0);
    obj.imageCheckBox27:setTop(0);
    obj.imageCheckBox27:setWidth(22);
    obj.imageCheckBox27:setHeight(26);
    obj.imageCheckBox27:setField("Talentos_5_51");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(367);
    obj.layout42:setTop(859);
    obj.layout42:setWidth(22);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout42);
    obj.imageCheckBox28:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox28:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox28:setLeft(0);
    obj.imageCheckBox28:setTop(0);
    obj.imageCheckBox28:setWidth(22);
    obj.imageCheckBox28:setHeight(26);
    obj.imageCheckBox28:setField("Talentos_5_11");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(389);
    obj.layout43:setTop(859);
    obj.layout43:setWidth(22);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout43);
    obj.imageCheckBox29:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox29:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox29:setLeft(0);
    obj.imageCheckBox29:setTop(0);
    obj.imageCheckBox29:setWidth(22);
    obj.imageCheckBox29:setHeight(26);
    obj.imageCheckBox29:setField("Talentos_5_21");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(410);
    obj.layout44:setTop(859);
    obj.layout44:setWidth(22);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout44);
    obj.imageCheckBox30:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox30:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox30:setLeft(0);
    obj.imageCheckBox30:setTop(0);
    obj.imageCheckBox30:setWidth(22);
    obj.imageCheckBox30:setHeight(26);
    obj.imageCheckBox30:setField("Talentos_5_31");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(431);
    obj.layout45:setTop(859);
    obj.layout45:setWidth(22);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.imageCheckBox31 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout45);
    obj.imageCheckBox31:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox31:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox31:setLeft(0);
    obj.imageCheckBox31:setTop(0);
    obj.imageCheckBox31:setWidth(22);
    obj.imageCheckBox31:setHeight(26);
    obj.imageCheckBox31:setField("Talentos_5_41");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(571);
    obj.layout46:setTop(856);
    obj.layout46:setWidth(406);
    obj.layout46:setHeight(33);
    obj.layout46:setName("layout46");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout46);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(22.6);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(406);
    obj.edit15:setHeight(34);
    obj.edit15:setField("Item_3");
    obj.edit15:setName("edit15");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(1069);
    obj.layout47:setTop(854);
    obj.layout47:setWidth(45);
    obj.layout47:setHeight(33);
    obj.layout47:setName("layout47");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout47);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(22.6);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(45);
    obj.edit16:setHeight(34);
    obj.edit16:setField("Gnose1_3");
    obj.edit16:setName("edit16");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(451);
    obj.layout48:setTop(893);
    obj.layout48:setWidth(22);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.imageCheckBox32 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout48);
    obj.imageCheckBox32:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox32:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox32:setLeft(0);
    obj.imageCheckBox32:setTop(0);
    obj.imageCheckBox32:setWidth(22);
    obj.imageCheckBox32:setHeight(26);
    obj.imageCheckBox32:setField("Talentos_6_51");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(367);
    obj.layout49:setTop(893);
    obj.layout49:setWidth(22);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.imageCheckBox33 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout49);
    obj.imageCheckBox33:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox33:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox33:setLeft(0);
    obj.imageCheckBox33:setTop(0);
    obj.imageCheckBox33:setWidth(22);
    obj.imageCheckBox33:setHeight(26);
    obj.imageCheckBox33:setField("Talentos_6_11");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(389);
    obj.layout50:setTop(893);
    obj.layout50:setWidth(22);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.imageCheckBox34 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout50);
    obj.imageCheckBox34:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox34:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox34:setLeft(0);
    obj.imageCheckBox34:setTop(0);
    obj.imageCheckBox34:setWidth(22);
    obj.imageCheckBox34:setHeight(26);
    obj.imageCheckBox34:setField("Talentos_6_21");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(410);
    obj.layout51:setTop(893);
    obj.layout51:setWidth(22);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.imageCheckBox35 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout51);
    obj.imageCheckBox35:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox35:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox35:setLeft(0);
    obj.imageCheckBox35:setTop(0);
    obj.imageCheckBox35:setWidth(22);
    obj.imageCheckBox35:setHeight(26);
    obj.imageCheckBox35:setField("Talentos_6_31");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(431);
    obj.layout52:setTop(893);
    obj.layout52:setWidth(22);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.imageCheckBox36 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout52);
    obj.imageCheckBox36:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox36:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox36:setLeft(0);
    obj.imageCheckBox36:setTop(0);
    obj.imageCheckBox36:setWidth(22);
    obj.imageCheckBox36:setHeight(26);
    obj.imageCheckBox36:setField("Talentos_6_41");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(1210);
    obj.layout53:setTop(852);
    obj.layout53:setWidth(45);
    obj.layout53:setHeight(33);
    obj.layout53:setName("layout53");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout53);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(22.6);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(45);
    obj.edit17:setHeight(34);
    obj.edit17:setField("Gnose_3");
    obj.edit17:setName("edit17");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(111);
    obj.layout54:setTop(884);
    obj.layout54:setWidth(253);
    obj.layout54:setHeight(33);
    obj.layout54:setName("layout54");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout54);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(22.6);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(253);
    obj.edit18:setHeight(34);
    obj.edit18:setField("Row3_23");
    obj.edit18:setName("edit18");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(592);
    obj.layout55:setTop(887);
    obj.layout55:setWidth(524);
    obj.layout55:setHeight(33);
    obj.layout55:setName("layout55");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout55);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(22.6);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(524);
    obj.edit19:setHeight(34);
    obj.edit19:setField("Poder_3");
    obj.edit19:setName("edit19");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(111);
    obj.layout56:setTop(917);
    obj.layout56:setWidth(253);
    obj.layout56:setHeight(33);
    obj.layout56:setName("layout56");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout56);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(22.6);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(253);
    obj.edit20:setHeight(34);
    obj.edit20:setField("Row4_24");
    obj.edit20:setName("edit20");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(451);
    obj.layout57:setTop(925);
    obj.layout57:setWidth(22);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.imageCheckBox37 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout57);
    obj.imageCheckBox37:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox37:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox37:setLeft(0);
    obj.imageCheckBox37:setTop(0);
    obj.imageCheckBox37:setWidth(22);
    obj.imageCheckBox37:setHeight(26);
    obj.imageCheckBox37:setField("Talentos_7_51");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(367);
    obj.layout58:setTop(925);
    obj.layout58:setWidth(22);
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.imageCheckBox38 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout58);
    obj.imageCheckBox38:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox38:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox38:setLeft(0);
    obj.imageCheckBox38:setTop(0);
    obj.imageCheckBox38:setWidth(22);
    obj.imageCheckBox38:setHeight(26);
    obj.imageCheckBox38:setField("Talentos_7_11");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(389);
    obj.layout59:setTop(925);
    obj.layout59:setWidth(22);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.imageCheckBox39 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout59);
    obj.imageCheckBox39:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox39:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox39:setLeft(0);
    obj.imageCheckBox39:setTop(0);
    obj.imageCheckBox39:setWidth(22);
    obj.imageCheckBox39:setHeight(26);
    obj.imageCheckBox39:setField("Talentos_7_21");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(410);
    obj.layout60:setTop(925);
    obj.layout60:setWidth(22);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.imageCheckBox40 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout60);
    obj.imageCheckBox40:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox40:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox40:setLeft(0);
    obj.imageCheckBox40:setTop(0);
    obj.imageCheckBox40:setWidth(22);
    obj.imageCheckBox40:setHeight(26);
    obj.imageCheckBox40:setField("Talentos_7_31");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(431);
    obj.layout61:setTop(925);
    obj.layout61:setWidth(22);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.imageCheckBox41 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout61);
    obj.imageCheckBox41:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox41:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox41:setLeft(0);
    obj.imageCheckBox41:setTop(0);
    obj.imageCheckBox41:setWidth(22);
    obj.imageCheckBox41:setHeight(26);
    obj.imageCheckBox41:setField("Talentos_7_41");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(571);
    obj.layout62:setTop(920);
    obj.layout62:setWidth(406);
    obj.layout62:setHeight(33);
    obj.layout62:setName("layout62");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout62);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(22.6);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(406);
    obj.edit21:setHeight(34);
    obj.edit21:setField("Item_4");
    obj.edit21:setName("edit21");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(1069);
    obj.layout63:setTop(919);
    obj.layout63:setWidth(45);
    obj.layout63:setHeight(33);
    obj.layout63:setName("layout63");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout63);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(22.6);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(45);
    obj.edit22:setHeight(34);
    obj.edit22:setField("Gnose1_4");
    obj.edit22:setName("edit22");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(451);
    obj.layout64:setTop(958);
    obj.layout64:setWidth(22);
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.imageCheckBox42 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout64);
    obj.imageCheckBox42:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox42:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox42:setLeft(0);
    obj.imageCheckBox42:setTop(0);
    obj.imageCheckBox42:setWidth(22);
    obj.imageCheckBox42:setHeight(26);
    obj.imageCheckBox42:setField("Talentos_8_51");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(367);
    obj.layout65:setTop(958);
    obj.layout65:setWidth(22);
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.imageCheckBox43 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox43:setParent(obj.layout65);
    obj.imageCheckBox43:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox43:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox43:setLeft(0);
    obj.imageCheckBox43:setTop(0);
    obj.imageCheckBox43:setWidth(22);
    obj.imageCheckBox43:setHeight(26);
    obj.imageCheckBox43:setField("Talentos_8_11");
    obj.imageCheckBox43:setName("imageCheckBox43");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(389);
    obj.layout66:setTop(958);
    obj.layout66:setWidth(22);
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.imageCheckBox44 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox44:setParent(obj.layout66);
    obj.imageCheckBox44:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox44:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox44:setLeft(0);
    obj.imageCheckBox44:setTop(0);
    obj.imageCheckBox44:setWidth(22);
    obj.imageCheckBox44:setHeight(26);
    obj.imageCheckBox44:setField("Talentos_8_21");
    obj.imageCheckBox44:setName("imageCheckBox44");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(410);
    obj.layout67:setTop(958);
    obj.layout67:setWidth(22);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.imageCheckBox45 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox45:setParent(obj.layout67);
    obj.imageCheckBox45:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox45:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox45:setLeft(0);
    obj.imageCheckBox45:setTop(0);
    obj.imageCheckBox45:setWidth(22);
    obj.imageCheckBox45:setHeight(26);
    obj.imageCheckBox45:setField("Talentos_8_31");
    obj.imageCheckBox45:setName("imageCheckBox45");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(431);
    obj.layout68:setTop(958);
    obj.layout68:setWidth(22);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.imageCheckBox46 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox46:setParent(obj.layout68);
    obj.imageCheckBox46:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox46:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox46:setLeft(0);
    obj.imageCheckBox46:setTop(0);
    obj.imageCheckBox46:setWidth(22);
    obj.imageCheckBox46:setHeight(26);
    obj.imageCheckBox46:setField("Talentos_8_41");
    obj.imageCheckBox46:setName("imageCheckBox46");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(1069);
    obj.layout69:setTop(984);
    obj.layout69:setWidth(45);
    obj.layout69:setHeight(33);
    obj.layout69:setName("layout69");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout69);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(22.6);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(45);
    obj.edit23:setHeight(34);
    obj.edit23:setField("Gnose1_5");
    obj.edit23:setName("edit23");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(1210);
    obj.layout70:setTop(918);
    obj.layout70:setWidth(45);
    obj.layout70:setHeight(33);
    obj.layout70:setName("layout70");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout70);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(22.6);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(45);
    obj.edit24:setHeight(34);
    obj.edit24:setField("Gnose_4");
    obj.edit24:setName("edit24");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(111);
    obj.layout71:setTop(950);
    obj.layout71:setWidth(253);
    obj.layout71:setHeight(33);
    obj.layout71:setName("layout71");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout71);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(22.6);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(253);
    obj.edit25:setHeight(34);
    obj.edit25:setField("Row5_25");
    obj.edit25:setName("edit25");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(592);
    obj.layout72:setTop(952);
    obj.layout72:setWidth(524);
    obj.layout72:setHeight(33);
    obj.layout72:setName("layout72");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout72);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(22.6);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(524);
    obj.edit26:setHeight(34);
    obj.edit26:setField("Poder_4");
    obj.edit26:setName("edit26");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(111);
    obj.layout73:setTop(983);
    obj.layout73:setWidth(253);
    obj.layout73:setHeight(33);
    obj.layout73:setName("layout73");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout73);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(22.6);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(253);
    obj.edit27:setHeight(34);
    obj.edit27:setField("Row6_26");
    obj.edit27:setName("edit27");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(451);
    obj.layout74:setTop(991);
    obj.layout74:setWidth(22);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.imageCheckBox47 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox47:setParent(obj.layout74);
    obj.imageCheckBox47:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox47:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox47:setLeft(0);
    obj.imageCheckBox47:setTop(0);
    obj.imageCheckBox47:setWidth(22);
    obj.imageCheckBox47:setHeight(26);
    obj.imageCheckBox47:setField("Talentos_9_51");
    obj.imageCheckBox47:setName("imageCheckBox47");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(367);
    obj.layout75:setTop(991);
    obj.layout75:setWidth(22);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.imageCheckBox48 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox48:setParent(obj.layout75);
    obj.imageCheckBox48:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox48:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox48:setLeft(0);
    obj.imageCheckBox48:setTop(0);
    obj.imageCheckBox48:setWidth(22);
    obj.imageCheckBox48:setHeight(26);
    obj.imageCheckBox48:setField("Talentos_9_11");
    obj.imageCheckBox48:setName("imageCheckBox48");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(389);
    obj.layout76:setTop(991);
    obj.layout76:setWidth(22);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.imageCheckBox49 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox49:setParent(obj.layout76);
    obj.imageCheckBox49:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox49:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox49:setLeft(0);
    obj.imageCheckBox49:setTop(0);
    obj.imageCheckBox49:setWidth(22);
    obj.imageCheckBox49:setHeight(26);
    obj.imageCheckBox49:setField("Talentos_9_21");
    obj.imageCheckBox49:setName("imageCheckBox49");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(410);
    obj.layout77:setTop(991);
    obj.layout77:setWidth(22);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.imageCheckBox50 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox50:setParent(obj.layout77);
    obj.imageCheckBox50:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox50:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox50:setLeft(0);
    obj.imageCheckBox50:setTop(0);
    obj.imageCheckBox50:setWidth(22);
    obj.imageCheckBox50:setHeight(26);
    obj.imageCheckBox50:setField("Talentos_9_31");
    obj.imageCheckBox50:setName("imageCheckBox50");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(431);
    obj.layout78:setTop(991);
    obj.layout78:setWidth(22);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.imageCheckBox51 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox51:setParent(obj.layout78);
    obj.imageCheckBox51:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox51:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox51:setLeft(0);
    obj.imageCheckBox51:setTop(0);
    obj.imageCheckBox51:setWidth(22);
    obj.imageCheckBox51:setHeight(26);
    obj.imageCheckBox51:setField("Talentos_9_41");
    obj.imageCheckBox51:setName("imageCheckBox51");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(571);
    obj.layout79:setTop(987);
    obj.layout79:setWidth(406);
    obj.layout79:setHeight(33);
    obj.layout79:setName("layout79");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout79);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(22.6);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(406);
    obj.edit28:setHeight(34);
    obj.edit28:setField("Item_5");
    obj.edit28:setName("edit28");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(1210);
    obj.layout80:setTop(983);
    obj.layout80:setWidth(45);
    obj.layout80:setHeight(33);
    obj.layout80:setName("layout80");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout80);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(22.6);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(45);
    obj.edit29:setHeight(34);
    obj.edit29:setField("Gnose_5");
    obj.edit29:setName("edit29");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(111);
    obj.layout81:setTop(1016);
    obj.layout81:setWidth(253);
    obj.layout81:setHeight(33);
    obj.layout81:setName("layout81");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout81);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(22.6);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(253);
    obj.edit30:setHeight(34);
    obj.edit30:setField("Row4_27");
    obj.edit30:setName("edit30");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(592);
    obj.layout82:setTop(1017);
    obj.layout82:setWidth(524);
    obj.layout82:setHeight(33);
    obj.layout82:setName("layout82");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout82);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(22.6);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(524);
    obj.edit31:setHeight(34);
    obj.edit31:setField("Poder_5");
    obj.edit31:setName("edit31");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(111);
    obj.layout83:setTop(1049);
    obj.layout83:setWidth(253);
    obj.layout83:setHeight(33);
    obj.layout83:setName("layout83");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout83);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(22.6);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(253);
    obj.edit32:setHeight(34);
    obj.edit32:setField("Row5_28");
    obj.edit32:setName("edit32");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(451);
    obj.layout84:setTop(1056);
    obj.layout84:setWidth(22);
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.imageCheckBox52 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox52:setParent(obj.layout84);
    obj.imageCheckBox52:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox52:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox52:setLeft(0);
    obj.imageCheckBox52:setTop(0);
    obj.imageCheckBox52:setWidth(22);
    obj.imageCheckBox52:setHeight(26);
    obj.imageCheckBox52:setField("Talentos_9_52");
    obj.imageCheckBox52:setName("imageCheckBox52");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(367);
    obj.layout85:setTop(1056);
    obj.layout85:setWidth(22);
    obj.layout85:setHeight(25);
    obj.layout85:setName("layout85");

    obj.imageCheckBox53 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox53:setParent(obj.layout85);
    obj.imageCheckBox53:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox53:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox53:setLeft(0);
    obj.imageCheckBox53:setTop(0);
    obj.imageCheckBox53:setWidth(22);
    obj.imageCheckBox53:setHeight(26);
    obj.imageCheckBox53:setField("Talentos_9_12");
    obj.imageCheckBox53:setName("imageCheckBox53");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(389);
    obj.layout86:setTop(1056);
    obj.layout86:setWidth(22);
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.imageCheckBox54 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox54:setParent(obj.layout86);
    obj.imageCheckBox54:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox54:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox54:setLeft(0);
    obj.imageCheckBox54:setTop(0);
    obj.imageCheckBox54:setWidth(22);
    obj.imageCheckBox54:setHeight(26);
    obj.imageCheckBox54:setField("Talentos_9_22");
    obj.imageCheckBox54:setName("imageCheckBox54");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(410);
    obj.layout87:setTop(1056);
    obj.layout87:setWidth(22);
    obj.layout87:setHeight(25);
    obj.layout87:setName("layout87");

    obj.imageCheckBox55 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox55:setParent(obj.layout87);
    obj.imageCheckBox55:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox55:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox55:setLeft(0);
    obj.imageCheckBox55:setTop(0);
    obj.imageCheckBox55:setWidth(22);
    obj.imageCheckBox55:setHeight(26);
    obj.imageCheckBox55:setField("Talentos_9_32");
    obj.imageCheckBox55:setName("imageCheckBox55");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(431);
    obj.layout88:setTop(1056);
    obj.layout88:setWidth(22);
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.imageCheckBox56 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox56:setParent(obj.layout88);
    obj.imageCheckBox56:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox56:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox56:setLeft(0);
    obj.imageCheckBox56:setTop(0);
    obj.imageCheckBox56:setWidth(22);
    obj.imageCheckBox56:setHeight(26);
    obj.imageCheckBox56:setField("Talentos_9_42");
    obj.imageCheckBox56:setName("imageCheckBox56");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(571);
    obj.layout89:setTop(1051);
    obj.layout89:setWidth(406);
    obj.layout89:setHeight(33);
    obj.layout89:setName("layout89");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout89);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(22.6);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(406);
    obj.edit33:setHeight(34);
    obj.edit33:setField("Item_6");
    obj.edit33:setName("edit33");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(1069);
    obj.layout90:setTop(1050);
    obj.layout90:setWidth(45);
    obj.layout90:setHeight(33);
    obj.layout90:setName("layout90");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout90);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(22.6);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(45);
    obj.edit34:setHeight(34);
    obj.edit34:setField("Gnose1_6");
    obj.edit34:setName("edit34");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(431);
    obj.layout91:setTop(1089);
    obj.layout91:setWidth(22);
    obj.layout91:setHeight(25);
    obj.layout91:setName("layout91");

    obj.imageCheckBox57 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox57:setParent(obj.layout91);
    obj.imageCheckBox57:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox57:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox57:setLeft(0);
    obj.imageCheckBox57:setTop(0);
    obj.imageCheckBox57:setWidth(22);
    obj.imageCheckBox57:setHeight(26);
    obj.imageCheckBox57:setField("Talentos_10_42");
    obj.imageCheckBox57:setName("imageCheckBox57");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(367);
    obj.layout92:setTop(1089);
    obj.layout92:setWidth(22);
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.imageCheckBox58 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox58:setParent(obj.layout92);
    obj.imageCheckBox58:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox58:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox58:setLeft(0);
    obj.imageCheckBox58:setTop(0);
    obj.imageCheckBox58:setWidth(22);
    obj.imageCheckBox58:setHeight(26);
    obj.imageCheckBox58:setField("Talentos_10_12");
    obj.imageCheckBox58:setName("imageCheckBox58");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(389);
    obj.layout93:setTop(1089);
    obj.layout93:setWidth(22);
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.imageCheckBox59 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox59:setParent(obj.layout93);
    obj.imageCheckBox59:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox59:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox59:setLeft(0);
    obj.imageCheckBox59:setTop(0);
    obj.imageCheckBox59:setWidth(22);
    obj.imageCheckBox59:setHeight(26);
    obj.imageCheckBox59:setField("Talentos_10_22");
    obj.imageCheckBox59:setName("imageCheckBox59");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(410);
    obj.layout94:setTop(1089);
    obj.layout94:setWidth(22);
    obj.layout94:setHeight(25);
    obj.layout94:setName("layout94");

    obj.imageCheckBox60 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox60:setParent(obj.layout94);
    obj.imageCheckBox60:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox60:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox60:setLeft(0);
    obj.imageCheckBox60:setTop(0);
    obj.imageCheckBox60:setWidth(22);
    obj.imageCheckBox60:setHeight(26);
    obj.imageCheckBox60:setField("Talentos_10_32");
    obj.imageCheckBox60:setName("imageCheckBox60");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(451);
    obj.layout95:setTop(1089);
    obj.layout95:setWidth(22);
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.imageCheckBox61 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox61:setParent(obj.layout95);
    obj.imageCheckBox61:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox61:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox61:setLeft(0);
    obj.imageCheckBox61:setTop(0);
    obj.imageCheckBox61:setWidth(22);
    obj.imageCheckBox61:setHeight(26);
    obj.imageCheckBox61:setField("Talentos_10_52");
    obj.imageCheckBox61:setName("imageCheckBox61");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(1210);
    obj.layout96:setTop(1049);
    obj.layout96:setWidth(45);
    obj.layout96:setHeight(33);
    obj.layout96:setName("layout96");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout96);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(22.6);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(45);
    obj.edit35:setHeight(34);
    obj.edit35:setField("Gnose_6");
    obj.edit35:setName("edit35");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(111);
    obj.layout97:setTop(1083);
    obj.layout97:setWidth(253);
    obj.layout97:setHeight(33);
    obj.layout97:setName("layout97");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout97);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(22.6);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(253);
    obj.edit36:setHeight(34);
    obj.edit36:setField("Row6_29");
    obj.edit36:setName("edit36");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(592);
    obj.layout98:setTop(1082);
    obj.layout98:setWidth(524);
    obj.layout98:setHeight(33);
    obj.layout98:setName("layout98");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout98);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(22.6);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(524);
    obj.edit37:setHeight(34);
    obj.edit37:setField("Poder_6");
    obj.edit37:setName("edit37");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(107);
    obj.layout99:setTop(1156);
    obj.layout99:setWidth(355);
    obj.layout99:setHeight(293);
    obj.layout99:setName("layout99");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout99);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(23);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(355);
    obj.textEditor1:setHeight(294);
    obj.textEditor1:setField("Row7_1");
    obj.textEditor1:setName("textEditor1");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(505);
    obj.layout100:setTop(1159);
    obj.layout100:setWidth(756);
    obj.layout100:setHeight(289);
    obj.layout100:setName("layout100");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout100);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(23);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(756);
    obj.textEditor2:setHeight(290);
    obj.textEditor2:setField("Row7_9");
    obj.textEditor2:setName("textEditor2");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(108);
    obj.layout101:setTop(1547);
    obj.layout101:setWidth(279);
    obj.layout101:setHeight(33);
    obj.layout101:setName("layout101");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout101);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(22.6);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(279);
    obj.edit38:setHeight(34);
    obj.edit38:setField("arma1_1");
    obj.edit38:setName("edit38");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(392);
    obj.layout102:setTop(1547);
    obj.layout102:setWidth(204);
    obj.layout102:setHeight(33);
    obj.layout102:setName("layout102");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout102);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(22.6);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(204);
    obj.edit39:setHeight(34);
    obj.edit39:setField("arma1_2");
    obj.edit39:setName("edit39");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(600);
    obj.layout103:setTop(1547);
    obj.layout103:setWidth(97);
    obj.layout103:setHeight(33);
    obj.layout103:setName("layout103");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout103);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(22.6);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(97);
    obj.edit40:setHeight(34);
    obj.edit40:setField("arma1_3");
    obj.edit40:setName("edit40");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(702);
    obj.layout104:setTop(1547);
    obj.layout104:setWidth(81);
    obj.layout104:setHeight(33);
    obj.layout104:setName("layout104");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout104);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(22.6);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(81);
    obj.edit41:setHeight(34);
    obj.edit41:setField("arma1_4");
    obj.edit41:setName("edit41");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(787);
    obj.layout105:setTop(1547);
    obj.layout105:setWidth(86);
    obj.layout105:setHeight(33);
    obj.layout105:setName("layout105");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout105);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(22.6);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(86);
    obj.edit42:setHeight(34);
    obj.edit42:setField("arma1_5");
    obj.edit42:setName("edit42");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(877);
    obj.layout106:setTop(1547);
    obj.layout106:setWidth(73);
    obj.layout106:setHeight(33);
    obj.layout106:setName("layout106");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout106);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(22.6);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(73);
    obj.edit43:setHeight(34);
    obj.edit43:setField("arma1_6");
    obj.edit43:setName("edit43");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(108);
    obj.layout107:setTop(1585);
    obj.layout107:setWidth(279);
    obj.layout107:setHeight(33);
    obj.layout107:setName("layout107");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout107);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(22.6);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(279);
    obj.edit44:setHeight(34);
    obj.edit44:setField("arma2_1");
    obj.edit44:setName("edit44");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(392);
    obj.layout108:setTop(1585);
    obj.layout108:setWidth(204);
    obj.layout108:setHeight(33);
    obj.layout108:setName("layout108");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout108);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(22.6);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(204);
    obj.edit45:setHeight(34);
    obj.edit45:setField("arma2_2");
    obj.edit45:setName("edit45");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(600);
    obj.layout109:setTop(1585);
    obj.layout109:setWidth(97);
    obj.layout109:setHeight(33);
    obj.layout109:setName("layout109");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout109);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(22.6);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(97);
    obj.edit46:setHeight(34);
    obj.edit46:setField("arma2_3");
    obj.edit46:setName("edit46");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(702);
    obj.layout110:setTop(1585);
    obj.layout110:setWidth(81);
    obj.layout110:setHeight(33);
    obj.layout110:setName("layout110");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout110);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(22.6);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(81);
    obj.edit47:setHeight(34);
    obj.edit47:setField("arma2_4");
    obj.edit47:setName("edit47");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle1);
    obj.layout111:setLeft(787);
    obj.layout111:setTop(1585);
    obj.layout111:setWidth(86);
    obj.layout111:setHeight(33);
    obj.layout111:setName("layout111");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout111);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(22.6);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(86);
    obj.edit48:setHeight(34);
    obj.edit48:setField("arma2_5");
    obj.edit48:setName("edit48");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle1);
    obj.layout112:setLeft(877);
    obj.layout112:setTop(1585);
    obj.layout112:setWidth(73);
    obj.layout112:setHeight(33);
    obj.layout112:setName("layout112");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout112);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(22.6);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(73);
    obj.edit49:setHeight(34);
    obj.edit49:setField("arma2_6");
    obj.edit49:setName("edit49");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle1);
    obj.layout113:setLeft(1129);
    obj.layout113:setTop(1592);
    obj.layout113:setWidth(123);
    obj.layout113:setHeight(33);
    obj.layout113:setName("layout113");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout113);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(22.6);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(123);
    obj.edit50:setHeight(34);
    obj.edit50:setField("Penalidade");
    obj.edit50:setName("edit50");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle1);
    obj.layout114:setLeft(108);
    obj.layout114:setTop(1622);
    obj.layout114:setWidth(279);
    obj.layout114:setHeight(33);
    obj.layout114:setName("layout114");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout114);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(22.6);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(279);
    obj.edit51:setHeight(34);
    obj.edit51:setField("arma3_1");
    obj.edit51:setName("edit51");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setLeft(392);
    obj.layout115:setTop(1622);
    obj.layout115:setWidth(204);
    obj.layout115:setHeight(33);
    obj.layout115:setName("layout115");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout115);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(22.6);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(204);
    obj.edit52:setHeight(34);
    obj.edit52:setField("arma3_2");
    obj.edit52:setName("edit52");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle1);
    obj.layout116:setLeft(600);
    obj.layout116:setTop(1622);
    obj.layout116:setWidth(97);
    obj.layout116:setHeight(33);
    obj.layout116:setName("layout116");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout116);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(22.6);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(97);
    obj.edit53:setHeight(34);
    obj.edit53:setField("arma3_3");
    obj.edit53:setName("edit53");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle1);
    obj.layout117:setLeft(702);
    obj.layout117:setTop(1622);
    obj.layout117:setWidth(81);
    obj.layout117:setHeight(33);
    obj.layout117:setName("layout117");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout117);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(22.6);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(81);
    obj.edit54:setHeight(34);
    obj.edit54:setField("arma3_4");
    obj.edit54:setName("edit54");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle1);
    obj.layout118:setLeft(787);
    obj.layout118:setTop(1622);
    obj.layout118:setWidth(86);
    obj.layout118:setHeight(33);
    obj.layout118:setName("layout118");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout118);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(22.6);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(86);
    obj.edit55:setHeight(34);
    obj.edit55:setField("arma3_5");
    obj.edit55:setName("edit55");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle1);
    obj.layout119:setLeft(877);
    obj.layout119:setTop(1622);
    obj.layout119:setWidth(73);
    obj.layout119:setHeight(33);
    obj.layout119:setName("layout119");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout119);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(22.6);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(73);
    obj.edit56:setHeight(34);
    obj.edit56:setField("arma3_6");
    obj.edit56:setName("edit56");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle1);
    obj.layout120:setLeft(108);
    obj.layout120:setTop(1660);
    obj.layout120:setWidth(279);
    obj.layout120:setHeight(33);
    obj.layout120:setName("layout120");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout120);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(22.6);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(279);
    obj.edit57:setHeight(34);
    obj.edit57:setField("arma4_1");
    obj.edit57:setName("edit57");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle1);
    obj.layout121:setLeft(392);
    obj.layout121:setTop(1660);
    obj.layout121:setWidth(204);
    obj.layout121:setHeight(33);
    obj.layout121:setName("layout121");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout121);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(22.6);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(204);
    obj.edit58:setHeight(34);
    obj.edit58:setField("arma4_2");
    obj.edit58:setName("edit58");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle1);
    obj.layout122:setLeft(600);
    obj.layout122:setTop(1660);
    obj.layout122:setWidth(97);
    obj.layout122:setHeight(33);
    obj.layout122:setName("layout122");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout122);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(22.6);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(97);
    obj.edit59:setHeight(34);
    obj.edit59:setField("arma4_3");
    obj.edit59:setName("edit59");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle1);
    obj.layout123:setLeft(702);
    obj.layout123:setTop(1660);
    obj.layout123:setWidth(81);
    obj.layout123:setHeight(33);
    obj.layout123:setName("layout123");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout123);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(22.6);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(81);
    obj.edit60:setHeight(34);
    obj.edit60:setField("arma4_4");
    obj.edit60:setName("edit60");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle1);
    obj.layout124:setLeft(787);
    obj.layout124:setTop(1660);
    obj.layout124:setWidth(86);
    obj.layout124:setHeight(33);
    obj.layout124:setName("layout124");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout124);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(22.6);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(86);
    obj.edit61:setHeight(34);
    obj.edit61:setField("arma4_5");
    obj.edit61:setName("edit61");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle1);
    obj.layout125:setLeft(877);
    obj.layout125:setTop(1660);
    obj.layout125:setWidth(73);
    obj.layout125:setHeight(33);
    obj.layout125:setName("layout125");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout125);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(22.6);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(73);
    obj.edit62:setHeight(34);
    obj.edit62:setField("arma4_6");
    obj.edit62:setName("edit62");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle1);
    obj.layout126:setLeft(108);
    obj.layout126:setTop(1698);
    obj.layout126:setWidth(279);
    obj.layout126:setHeight(33);
    obj.layout126:setName("layout126");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout126);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(22.6);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(279);
    obj.edit63:setHeight(34);
    obj.edit63:setField("arma5_1");
    obj.edit63:setName("edit63");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle1);
    obj.layout127:setLeft(392);
    obj.layout127:setTop(1698);
    obj.layout127:setWidth(204);
    obj.layout127:setHeight(33);
    obj.layout127:setName("layout127");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout127);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(22.6);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(204);
    obj.edit64:setHeight(34);
    obj.edit64:setField("arma5_2");
    obj.edit64:setName("edit64");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle1);
    obj.layout128:setLeft(600);
    obj.layout128:setTop(1698);
    obj.layout128:setWidth(97);
    obj.layout128:setHeight(33);
    obj.layout128:setName("layout128");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout128);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(22.6);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(97);
    obj.edit65:setHeight(34);
    obj.edit65:setField("arma5_3");
    obj.edit65:setName("edit65");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setLeft(702);
    obj.layout129:setTop(1698);
    obj.layout129:setWidth(81);
    obj.layout129:setHeight(33);
    obj.layout129:setName("layout129");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout129);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(22.6);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(81);
    obj.edit66:setHeight(34);
    obj.edit66:setField("arma5_4");
    obj.edit66:setName("edit66");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setLeft(787);
    obj.layout130:setTop(1698);
    obj.layout130:setWidth(86);
    obj.layout130:setHeight(33);
    obj.layout130:setName("layout130");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout130);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(22.6);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(86);
    obj.edit67:setHeight(34);
    obj.edit67:setField("arma5_5");
    obj.edit67:setName("edit67");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setLeft(877);
    obj.layout131:setTop(1698);
    obj.layout131:setWidth(73);
    obj.layout131:setHeight(33);
    obj.layout131:setName("layout131");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout131);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(22.6);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(73);
    obj.edit68:setHeight(34);
    obj.edit68:setField("arma5_6");
    obj.edit68:setName("edit68");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle1);
    obj.layout132:setLeft(108);
    obj.layout132:setTop(1736);
    obj.layout132:setWidth(279);
    obj.layout132:setHeight(33);
    obj.layout132:setName("layout132");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout132);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(22.6);
    obj.edit69:setFontColor("#000000");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(279);
    obj.edit69:setHeight(34);
    obj.edit69:setField("arma6_1");
    obj.edit69:setName("edit69");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle1);
    obj.layout133:setLeft(392);
    obj.layout133:setTop(1736);
    obj.layout133:setWidth(204);
    obj.layout133:setHeight(33);
    obj.layout133:setName("layout133");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout133);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(22.6);
    obj.edit70:setFontColor("#000000");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(204);
    obj.edit70:setHeight(34);
    obj.edit70:setField("arma6_2");
    obj.edit70:setName("edit70");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle1);
    obj.layout134:setLeft(600);
    obj.layout134:setTop(1736);
    obj.layout134:setWidth(97);
    obj.layout134:setHeight(33);
    obj.layout134:setName("layout134");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout134);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(22.6);
    obj.edit71:setFontColor("#000000");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(97);
    obj.edit71:setHeight(34);
    obj.edit71:setField("arma6_3");
    obj.edit71:setName("edit71");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle1);
    obj.layout135:setLeft(702);
    obj.layout135:setTop(1736);
    obj.layout135:setWidth(81);
    obj.layout135:setHeight(33);
    obj.layout135:setName("layout135");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout135);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(22.6);
    obj.edit72:setFontColor("#000000");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(81);
    obj.edit72:setHeight(34);
    obj.edit72:setField("arma6_4");
    obj.edit72:setName("edit72");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle1);
    obj.layout136:setLeft(877);
    obj.layout136:setTop(1736);
    obj.layout136:setWidth(73);
    obj.layout136:setHeight(33);
    obj.layout136:setName("layout136");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout136);
    obj.edit73:setTransparent(true);
    obj.edit73:setFontSize(22.6);
    obj.edit73:setFontColor("#000000");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(73);
    obj.edit73:setHeight(34);
    obj.edit73:setField("arma6_6");
    obj.edit73:setName("edit73");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle1);
    obj.layout137:setLeft(987);
    obj.layout137:setTop(1672);
    obj.layout137:setWidth(275);
    obj.layout137:setHeight(102);
    obj.layout137:setName("layout137");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout137);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontSize(23);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(275);
    obj.textEditor3:setHeight(103);
    obj.textEditor3:setField("Descri_o_1");
    obj.textEditor3:setName("textEditor3");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle1);
    obj.layout138:setLeft(787);
    obj.layout138:setTop(1736);
    obj.layout138:setWidth(86);
    obj.layout138:setHeight(33);
    obj.layout138:setName("layout138");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout138);
    obj.edit74:setTransparent(true);
    obj.edit74:setFontSize(22.6);
    obj.edit74:setFontColor("#000000");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(86);
    obj.edit74:setHeight(34);
    obj.edit74:setField("arma6_5");
    obj.edit74:setName("edit74");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle1);
    obj.layout139:setLeft(108);
    obj.layout139:setTop(1773);
    obj.layout139:setWidth(279);
    obj.layout139:setHeight(33);
    obj.layout139:setName("layout139");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout139);
    obj.edit75:setTransparent(true);
    obj.edit75:setFontSize(22.6);
    obj.edit75:setFontColor("#000000");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(0);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(279);
    obj.edit75:setHeight(34);
    obj.edit75:setField("arma7_1");
    obj.edit75:setName("edit75");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle1);
    obj.layout140:setLeft(392);
    obj.layout140:setTop(1773);
    obj.layout140:setWidth(204);
    obj.layout140:setHeight(33);
    obj.layout140:setName("layout140");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout140);
    obj.edit76:setTransparent(true);
    obj.edit76:setFontSize(22.6);
    obj.edit76:setFontColor("#000000");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(204);
    obj.edit76:setHeight(34);
    obj.edit76:setField("arma7_2");
    obj.edit76:setName("edit76");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle1);
    obj.layout141:setLeft(600);
    obj.layout141:setTop(1773);
    obj.layout141:setWidth(97);
    obj.layout141:setHeight(33);
    obj.layout141:setName("layout141");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout141);
    obj.edit77:setTransparent(true);
    obj.edit77:setFontSize(22.6);
    obj.edit77:setFontColor("#000000");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(97);
    obj.edit77:setHeight(34);
    obj.edit77:setField("arma7_3");
    obj.edit77:setName("edit77");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle1);
    obj.layout142:setLeft(702);
    obj.layout142:setTop(1773);
    obj.layout142:setWidth(81);
    obj.layout142:setHeight(33);
    obj.layout142:setName("layout142");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout142);
    obj.edit78:setTransparent(true);
    obj.edit78:setFontSize(22.6);
    obj.edit78:setFontColor("#000000");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(81);
    obj.edit78:setHeight(34);
    obj.edit78:setField("arma7_4");
    obj.edit78:setName("edit78");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle1);
    obj.layout143:setLeft(787);
    obj.layout143:setTop(1773);
    obj.layout143:setWidth(86);
    obj.layout143:setHeight(33);
    obj.layout143:setName("layout143");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout143);
    obj.edit79:setTransparent(true);
    obj.edit79:setFontSize(22.6);
    obj.edit79:setFontColor("#000000");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(86);
    obj.edit79:setHeight(34);
    obj.edit79:setField("arma7_5");
    obj.edit79:setName("edit79");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle1);
    obj.layout144:setLeft(877);
    obj.layout144:setTop(1773);
    obj.layout144:setWidth(73);
    obj.layout144:setHeight(33);
    obj.layout144:setName("layout144");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout144);
    obj.edit80:setTransparent(true);
    obj.edit80:setFontSize(22.6);
    obj.edit80:setFontColor("#000000");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(73);
    obj.edit80:setHeight(34);
    obj.edit80:setField("arma7_6");
    obj.edit80:setName("edit80");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle1);
    obj.layout145:setLeft(1120);
    obj.layout145:setTop(1088);
    obj.layout145:setWidth(23);
    obj.layout145:setHeight(26);
    obj.layout145:setName("layout145");

    obj.imageCheckBox62 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox62:setParent(obj.layout145);
    obj.imageCheckBox62:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox62:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox62:setLeft(0);
    obj.imageCheckBox62:setTop(0);
    obj.imageCheckBox62:setWidth(23);
    obj.imageCheckBox62:setHeight(27);
    obj.imageCheckBox62:setField("Vitalidade_142");
    obj.imageCheckBox62:setName("imageCheckBox62");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.rectangle1);
    obj.layout146:setLeft(1120);
    obj.layout146:setTop(1023);
    obj.layout146:setWidth(23);
    obj.layout146:setHeight(26);
    obj.layout146:setName("layout146");

    obj.imageCheckBox63 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox63:setParent(obj.layout146);
    obj.imageCheckBox63:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox63:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox63:setLeft(0);
    obj.imageCheckBox63:setTop(0);
    obj.imageCheckBox63:setWidth(23);
    obj.imageCheckBox63:setHeight(27);
    obj.imageCheckBox63:setField("Vitalidade_132");
    obj.imageCheckBox63:setName("imageCheckBox63");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.rectangle1);
    obj.layout147:setLeft(1120);
    obj.layout147:setTop(957);
    obj.layout147:setWidth(23);
    obj.layout147:setHeight(26);
    obj.layout147:setName("layout147");

    obj.imageCheckBox64 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox64:setParent(obj.layout147);
    obj.imageCheckBox64:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox64:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox64:setLeft(0);
    obj.imageCheckBox64:setTop(0);
    obj.imageCheckBox64:setWidth(23);
    obj.imageCheckBox64:setHeight(27);
    obj.imageCheckBox64:setField("Vitalidade_122");
    obj.imageCheckBox64:setName("imageCheckBox64");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle1);
    obj.layout148:setLeft(1120);
    obj.layout148:setTop(891);
    obj.layout148:setWidth(23);
    obj.layout148:setHeight(26);
    obj.layout148:setName("layout148");

    obj.imageCheckBox65 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox65:setParent(obj.layout148);
    obj.imageCheckBox65:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox65:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox65:setLeft(0);
    obj.imageCheckBox65:setTop(0);
    obj.imageCheckBox65:setWidth(23);
    obj.imageCheckBox65:setHeight(27);
    obj.imageCheckBox65:setField("Vitalidade_112");
    obj.imageCheckBox65:setName("imageCheckBox65");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle1);
    obj.layout149:setLeft(1120);
    obj.layout149:setTop(761);
    obj.layout149:setWidth(23);
    obj.layout149:setHeight(26);
    obj.layout149:setName("layout149");

    obj.imageCheckBox66 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox66:setParent(obj.layout149);
    obj.imageCheckBox66:setImageChecked("/Lobisomem/images/on.png");
    obj.imageCheckBox66:setImageUnchecked("/Lobisomem/images/off.png");
    obj.imageCheckBox66:setLeft(0);
    obj.imageCheckBox66:setTop(0);
    obj.imageCheckBox66:setWidth(23);
    obj.imageCheckBox66:setHeight(27);
    obj.imageCheckBox66:setField("Vitalidade_82");
    obj.imageCheckBox66:setName("imageCheckBox66");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle1);
    obj.layout150:setLeft(453);
    obj.layout150:setTop(300);
    obj.layout150:setWidth(30);
    obj.layout150:setHeight(32);
    obj.layout150:setName("layout150");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout150);
    obj.edit81:setTransparent(true);
    obj.edit81:setFontSize(21.8);
    obj.edit81:setFontColor("#000000");
    obj.edit81:setHorzTextAlign("leading");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(0);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(30);
    obj.edit81:setHeight(33);
    obj.edit81:setField("fgla");
    obj.edit81:setName("edit81");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.rectangle1);
    obj.layout151:setLeft(456);
    obj.layout151:setTop(336);
    obj.layout151:setWidth(28);
    obj.layout151:setHeight(31);
    obj.layout151:setName("layout151");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout151);
    obj.edit82:setTransparent(true);
    obj.edit82:setFontSize(21.1);
    obj.edit82:setFontColor("#000000");
    obj.edit82:setHorzTextAlign("leading");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(0);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(28);
    obj.edit82:setHeight(32);
    obj.edit82:setField("vgla");
    obj.edit82:setName("edit82");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.rectangle1);
    obj.layout152:setLeft(501);
    obj.layout152:setTop(368);
    obj.layout152:setWidth(28);
    obj.layout152:setHeight(31);
    obj.layout152:setName("layout152");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout152);
    obj.edit83:setTransparent(true);
    obj.edit83:setFontSize(21.1);
    obj.edit83:setFontColor("#000000");
    obj.edit83:setHorzTextAlign("leading");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(0);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(28);
    obj.edit83:setHeight(32);
    obj.edit83:setField("apgla");
    obj.edit83:setName("edit83");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle1);
    obj.layout153:setLeft(531);
    obj.layout153:setTop(401);
    obj.layout153:setWidth(28);
    obj.layout153:setHeight(31);
    obj.layout153:setName("layout153");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout153);
    obj.edit84:setTransparent(true);
    obj.edit84:setFontSize(21.1);
    obj.edit84:setFontColor("#000000");
    obj.edit84:setHorzTextAlign("leading");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(0);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(28);
    obj.edit84:setHeight(32);
    obj.edit84:setField("mangla");
    obj.edit84:setName("edit84");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.rectangle1);
    obj.layout154:setLeft(689);
    obj.layout154:setTop(301);
    obj.layout154:setWidth(30);
    obj.layout154:setHeight(32);
    obj.layout154:setName("layout154");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout154);
    obj.edit85:setTransparent(true);
    obj.edit85:setFontSize(21.8);
    obj.edit85:setFontColor("#000000");
    obj.edit85:setHorzTextAlign("leading");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(0);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(30);
    obj.edit85:setHeight(33);
    obj.edit85:setField("fcri");
    obj.edit85:setName("edit85");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.rectangle1);
    obj.layout155:setLeft(721);
    obj.layout155:setTop(336);
    obj.layout155:setWidth(28);
    obj.layout155:setHeight(31);
    obj.layout155:setName("layout155");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout155);
    obj.edit86:setTransparent(true);
    obj.edit86:setFontSize(21.1);
    obj.edit86:setFontColor("#000000");
    obj.edit86:setHorzTextAlign("leading");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(0);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(28);
    obj.edit86:setHeight(32);
    obj.edit86:setField("descri");
    obj.edit86:setName("edit86");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.rectangle1);
    obj.layout156:setLeft(690);
    obj.layout156:setTop(368);
    obj.layout156:setWidth(28);
    obj.layout156:setHeight(31);
    obj.layout156:setName("layout156");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout156);
    obj.edit87:setTransparent(true);
    obj.edit87:setFontSize(21.1);
    obj.edit87:setFontColor("#000000");
    obj.edit87:setHorzTextAlign("leading");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(0);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(28);
    obj.edit87:setHeight(32);
    obj.edit87:setField("vigcri");
    obj.edit87:setName("edit87");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.rectangle1);
    obj.layout157:setLeft(767);
    obj.layout157:setTop(401);
    obj.layout157:setWidth(28);
    obj.layout157:setHeight(31);
    obj.layout157:setName("layout157");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout157);
    obj.edit88:setTransparent(true);
    obj.edit88:setFontSize(21.1);
    obj.edit88:setFontColor("#000000");
    obj.edit88:setHorzTextAlign("leading");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(0);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(28);
    obj.edit88:setHeight(32);
    obj.edit88:setField("mancri");
    obj.edit88:setName("edit88");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.rectangle1);
    obj.layout158:setLeft(917);
    obj.layout158:setTop(301);
    obj.layout158:setWidth(30);
    obj.layout158:setHeight(32);
    obj.layout158:setName("layout158");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout158);
    obj.edit89:setTransparent(true);
    obj.edit89:setFontSize(21.8);
    obj.edit89:setFontColor("#000000");
    obj.edit89:setHorzTextAlign("leading");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(0);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(30);
    obj.edit89:setHeight(33);
    obj.edit89:setField("fhis");
    obj.edit89:setName("edit89");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.rectangle1);
    obj.layout159:setLeft(956);
    obj.layout159:setTop(335);
    obj.layout159:setWidth(28);
    obj.layout159:setHeight(31);
    obj.layout159:setName("layout159");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout159);
    obj.edit90:setTransparent(true);
    obj.edit90:setFontSize(21.1);
    obj.edit90:setFontColor("#000000");
    obj.edit90:setHorzTextAlign("leading");
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(0);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(28);
    obj.edit90:setHeight(32);
    obj.edit90:setField("deshis");
    obj.edit90:setName("edit90");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.rectangle1);
    obj.layout160:setLeft(926);
    obj.layout160:setTop(368);
    obj.layout160:setWidth(28);
    obj.layout160:setHeight(31);
    obj.layout160:setName("layout160");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout160);
    obj.edit91:setTransparent(true);
    obj.edit91:setFontSize(21.1);
    obj.edit91:setFontColor("#000000");
    obj.edit91:setHorzTextAlign("leading");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(28);
    obj.edit91:setHeight(32);
    obj.edit91:setField("vighis");
    obj.edit91:setName("edit91");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.rectangle1);
    obj.layout161:setLeft(1002);
    obj.layout161:setTop(401);
    obj.layout161:setWidth(28);
    obj.layout161:setHeight(31);
    obj.layout161:setName("layout161");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout161);
    obj.edit92:setTransparent(true);
    obj.edit92:setFontSize(21.1);
    obj.edit92:setFontColor("#000000");
    obj.edit92:setHorzTextAlign("leading");
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(0);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(28);
    obj.edit92:setHeight(32);
    obj.edit92:setField("manhis");
    obj.edit92:setName("edit92");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.rectangle1);
    obj.layout162:setLeft(1151);
    obj.layout162:setTop(303);
    obj.layout162:setWidth(30);
    obj.layout162:setHeight(32);
    obj.layout162:setName("layout162");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout162);
    obj.edit93:setTransparent(true);
    obj.edit93:setFontSize(21.8);
    obj.edit93:setFontColor("#000000");
    obj.edit93:setHorzTextAlign("leading");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(0);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(30);
    obj.edit93:setHeight(33);
    obj.edit93:setField("flu");
    obj.edit93:setName("edit93");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.rectangle1);
    obj.layout163:setLeft(1190);
    obj.layout163:setTop(337);
    obj.layout163:setWidth(28);
    obj.layout163:setHeight(31);
    obj.layout163:setName("layout163");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout163);
    obj.edit94:setTransparent(true);
    obj.edit94:setFontSize(21.1);
    obj.edit94:setFontColor("#000000");
    obj.edit94:setHorzTextAlign("leading");
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(0);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(28);
    obj.edit94:setHeight(32);
    obj.edit94:setField("deslu");
    obj.edit94:setName("edit94");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.rectangle1);
    obj.layout164:setLeft(1161);
    obj.layout164:setTop(370);
    obj.layout164:setWidth(28);
    obj.layout164:setHeight(31);
    obj.layout164:setName("layout164");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout164);
    obj.edit95:setTransparent(true);
    obj.edit95:setFontSize(21.1);
    obj.edit95:setFontColor("#000000");
    obj.edit95:setHorzTextAlign("leading");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(0);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(28);
    obj.edit95:setHeight(32);
    obj.edit95:setField("viglu");
    obj.edit95:setName("edit95");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.rectangle1);
    obj.layout165:setLeft(1236);
    obj.layout165:setTop(403);
    obj.layout165:setWidth(28);
    obj.layout165:setHeight(31);
    obj.layout165:setName("layout165");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout165);
    obj.edit96:setTransparent(true);
    obj.edit96:setFontSize(21.1);
    obj.edit96:setFontColor("#000000");
    obj.edit96:setHorzTextAlign("leading");
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(0);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(28);
    obj.edit96:setHeight(32);
    obj.edit96:setField("manlu");
    obj.edit96:setName("edit96");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.rectangle1);
    obj.layout166:setLeft(955);
    obj.layout166:setTop(1548);
    obj.layout166:setWidth(23);
    obj.layout166:setHeight(22);
    obj.layout166:setName("layout166");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout166);
    obj.button1:setHitTest(true);
    obj.button1:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button1:setWidth(32);
    obj.button1:setText("R");
    obj.button1:setName("button1");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.rectangle1);
    obj.layout167:setLeft(954);
    obj.layout167:setTop(1586);
    obj.layout167:setWidth(23);
    obj.layout167:setHeight(22);
    obj.layout167:setName("layout167");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout167);
    obj.button2:setHitTest(true);
    obj.button2:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button2:setWidth(32);
    obj.button2:setText("R");
    obj.button2:setName("button2");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.rectangle1);
    obj.layout168:setLeft(954);
    obj.layout168:setTop(1661);
    obj.layout168:setWidth(23);
    obj.layout168:setHeight(22);
    obj.layout168:setName("layout168");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout168);
    obj.button3:setHitTest(true);
    obj.button3:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button3:setWidth(32);
    obj.button3:setText("R");
    obj.button3:setName("button3");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.rectangle1);
    obj.layout169:setLeft(954);
    obj.layout169:setTop(1623);
    obj.layout169:setWidth(23);
    obj.layout169:setHeight(22);
    obj.layout169:setName("layout169");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout169);
    obj.button4:setHitTest(true);
    obj.button4:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button4:setWidth(32);
    obj.button4:setText("R");
    obj.button4:setName("button4");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.rectangle1);
    obj.layout170:setLeft(954);
    obj.layout170:setTop(1738);
    obj.layout170:setWidth(23);
    obj.layout170:setHeight(22);
    obj.layout170:setName("layout170");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout170);
    obj.button5:setHitTest(true);
    obj.button5:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button5:setWidth(32);
    obj.button5:setText("R");
    obj.button5:setName("button5");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.rectangle1);
    obj.layout171:setLeft(954);
    obj.layout171:setTop(1700);
    obj.layout171:setWidth(23);
    obj.layout171:setHeight(22);
    obj.layout171:setName("layout171");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout171);
    obj.button6:setHitTest(true);
    obj.button6:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button6:setWidth(32);
    obj.button6:setText("R");
    obj.button6:setName("button6");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.rectangle1);
    obj.layout172:setLeft(953);
    obj.layout172:setTop(1774);
    obj.layout172:setWidth(23);
    obj.layout172:setHeight(22);
    obj.layout172:setName("layout172");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout172);
    obj.button7:setHitTest(true);
    obj.button7:setHint("Clique apenas se Teste/Dificuldade estiver preenchido");
    obj.button7:setWidth(32);
    obj.button7:setText("R");
    obj.button7:setName("button7");

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

        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.imageCheckBox65 ~= nil then self.imageCheckBox65:destroy(); self.imageCheckBox65 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.imageCheckBox58 ~= nil then self.imageCheckBox58:destroy(); self.imageCheckBox58 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.imageCheckBox50 ~= nil then self.imageCheckBox50:destroy(); self.imageCheckBox50 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.imageCheckBox45 ~= nil then self.imageCheckBox45:destroy(); self.imageCheckBox45 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.imageCheckBox63 ~= nil then self.imageCheckBox63:destroy(); self.imageCheckBox63 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.imageCheckBox54 ~= nil then self.imageCheckBox54:destroy(); self.imageCheckBox54 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.imageCheckBox66 ~= nil then self.imageCheckBox66:destroy(); self.imageCheckBox66 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.imageCheckBox48 ~= nil then self.imageCheckBox48:destroy(); self.imageCheckBox48 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.imageCheckBox35 ~= nil then self.imageCheckBox35:destroy(); self.imageCheckBox35 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.imageCheckBox59 ~= nil then self.imageCheckBox59:destroy(); self.imageCheckBox59 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.imageCheckBox43 ~= nil then self.imageCheckBox43:destroy(); self.imageCheckBox43 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.imageCheckBox61 ~= nil then self.imageCheckBox61:destroy(); self.imageCheckBox61 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.imageCheckBox51 ~= nil then self.imageCheckBox51:destroy(); self.imageCheckBox51 = nil; end;
        if self.imageCheckBox44 ~= nil then self.imageCheckBox44:destroy(); self.imageCheckBox44 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.imageCheckBox55 ~= nil then self.imageCheckBox55:destroy(); self.imageCheckBox55 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.imageCheckBox64 ~= nil then self.imageCheckBox64:destroy(); self.imageCheckBox64 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.imageCheckBox60 ~= nil then self.imageCheckBox60:destroy(); self.imageCheckBox60 = nil; end;
        if self.imageCheckBox52 ~= nil then self.imageCheckBox52:destroy(); self.imageCheckBox52 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.imageCheckBox62 ~= nil then self.imageCheckBox62:destroy(); self.imageCheckBox62 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.imageCheckBox46 ~= nil then self.imageCheckBox46:destroy(); self.imageCheckBox46 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox49 ~= nil then self.imageCheckBox49:destroy(); self.imageCheckBox49 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.imageCheckBox56 ~= nil then self.imageCheckBox56:destroy(); self.imageCheckBox56 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.imageCheckBox53 ~= nil then self.imageCheckBox53:destroy(); self.imageCheckBox53 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.imageCheckBox57 ~= nil then self.imageCheckBox57:destroy(); self.imageCheckBox57 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.imageCheckBox47 ~= nil then self.imageCheckBox47:destroy(); self.imageCheckBox47 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.imageCheckBox40 ~= nil then self.imageCheckBox40:destroy(); self.imageCheckBox40 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrma2_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frma2_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frma2_svg = {
    newEditor = newfrma2_svg, 
    new = newfrma2_svg, 
    name = "frma2_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frma2_svg = _frma2_svg;
Firecast.registrarForm(_frma2_svg);

return _frma2_svg;
