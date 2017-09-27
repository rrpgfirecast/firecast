require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmW20_2()
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
    obj:setName("frmW20_2");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(255);
    obj.layout1:setHeight(205);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(240);
    obj.label1:setHeight(20);
    obj.label1:setText("BACKGROUNDS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(15);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(225);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(95);
    obj.edit1:setHeight(20);
    obj.edit1:setField("background_1");
    obj.edit1:setFontSize(12);
    obj.edit1:setName("edit1");

    obj.imageCheckBox1 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout2);
    obj.imageCheckBox1:setLeft(100);
    obj.imageCheckBox1:setTop(0);
    obj.imageCheckBox1:setWidth(25);
    obj.imageCheckBox1:setHeight(25);
    obj.imageCheckBox1:setField("background_1_1");
    obj.imageCheckBox1:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox1:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.imageCheckBox2 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout2);
    obj.imageCheckBox2:setLeft(125);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(25);
    obj.imageCheckBox2:setHeight(25);
    obj.imageCheckBox2:setField("background_1_2");
    obj.imageCheckBox2:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox2:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.imageCheckBox3 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout2);
    obj.imageCheckBox3:setLeft(150);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(25);
    obj.imageCheckBox3:setHeight(25);
    obj.imageCheckBox3:setField("background_1_3");
    obj.imageCheckBox3:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox3:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.imageCheckBox4 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout2);
    obj.imageCheckBox4:setLeft(175);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(25);
    obj.imageCheckBox4:setHeight(25);
    obj.imageCheckBox4:setField("background_1_4");
    obj.imageCheckBox4:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox4:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.imageCheckBox5 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout2);
    obj.imageCheckBox5:setLeft(200);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(25);
    obj.imageCheckBox5:setHeight(25);
    obj.imageCheckBox5:setField("background_1_5");
    obj.imageCheckBox5:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox5:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(15);
    obj.layout3:setTop(50);
    obj.layout3:setWidth(225);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(0);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(95);
    obj.edit2:setHeight(20);
    obj.edit2:setField("background_2");
    obj.edit2:setFontSize(12);
    obj.edit2:setName("edit2");

    obj.imageCheckBox6 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout3);
    obj.imageCheckBox6:setLeft(100);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(25);
    obj.imageCheckBox6:setHeight(25);
    obj.imageCheckBox6:setField("background_2_1");
    obj.imageCheckBox6:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox6:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.imageCheckBox7 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout3);
    obj.imageCheckBox7:setLeft(125);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(25);
    obj.imageCheckBox7:setHeight(25);
    obj.imageCheckBox7:setField("background_2_2");
    obj.imageCheckBox7:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox7:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.imageCheckBox8 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout3);
    obj.imageCheckBox8:setLeft(150);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(25);
    obj.imageCheckBox8:setHeight(25);
    obj.imageCheckBox8:setField("background_2_3");
    obj.imageCheckBox8:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox8:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.imageCheckBox9 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout3);
    obj.imageCheckBox9:setLeft(175);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(25);
    obj.imageCheckBox9:setHeight(25);
    obj.imageCheckBox9:setField("background_2_4");
    obj.imageCheckBox9:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox9:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.imageCheckBox10 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout3);
    obj.imageCheckBox10:setLeft(200);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(25);
    obj.imageCheckBox10:setHeight(25);
    obj.imageCheckBox10:setField("background_2_5");
    obj.imageCheckBox10:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox10:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(15);
    obj.layout4:setTop(75);
    obj.layout4:setWidth(225);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(0);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(95);
    obj.edit3:setHeight(20);
    obj.edit3:setField("background_3");
    obj.edit3:setFontSize(12);
    obj.edit3:setName("edit3");

    obj.imageCheckBox11 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout4);
    obj.imageCheckBox11:setLeft(100);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(25);
    obj.imageCheckBox11:setHeight(25);
    obj.imageCheckBox11:setField("background_3_1");
    obj.imageCheckBox11:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox11:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.imageCheckBox12 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout4);
    obj.imageCheckBox12:setLeft(125);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(25);
    obj.imageCheckBox12:setHeight(25);
    obj.imageCheckBox12:setField("background_3_2");
    obj.imageCheckBox12:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox12:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.imageCheckBox13 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout4);
    obj.imageCheckBox13:setLeft(150);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(25);
    obj.imageCheckBox13:setHeight(25);
    obj.imageCheckBox13:setField("background_3_3");
    obj.imageCheckBox13:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox13:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.imageCheckBox14 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout4);
    obj.imageCheckBox14:setLeft(175);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(25);
    obj.imageCheckBox14:setHeight(25);
    obj.imageCheckBox14:setField("background_3_4");
    obj.imageCheckBox14:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox14:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.imageCheckBox15 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout4);
    obj.imageCheckBox15:setLeft(200);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(25);
    obj.imageCheckBox15:setHeight(25);
    obj.imageCheckBox15:setField("background_3_5");
    obj.imageCheckBox15:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox15:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(15);
    obj.layout5:setTop(100);
    obj.layout5:setWidth(225);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(0);
    obj.edit4:setTop(5);
    obj.edit4:setWidth(95);
    obj.edit4:setHeight(20);
    obj.edit4:setField("background_4");
    obj.edit4:setFontSize(12);
    obj.edit4:setName("edit4");

    obj.imageCheckBox16 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout5);
    obj.imageCheckBox16:setLeft(100);
    obj.imageCheckBox16:setTop(0);
    obj.imageCheckBox16:setWidth(25);
    obj.imageCheckBox16:setHeight(25);
    obj.imageCheckBox16:setField("background_4_1");
    obj.imageCheckBox16:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox16:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.imageCheckBox17 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout5);
    obj.imageCheckBox17:setLeft(125);
    obj.imageCheckBox17:setTop(0);
    obj.imageCheckBox17:setWidth(25);
    obj.imageCheckBox17:setHeight(25);
    obj.imageCheckBox17:setField("background_4_2");
    obj.imageCheckBox17:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox17:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.imageCheckBox18 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout5);
    obj.imageCheckBox18:setLeft(150);
    obj.imageCheckBox18:setTop(0);
    obj.imageCheckBox18:setWidth(25);
    obj.imageCheckBox18:setHeight(25);
    obj.imageCheckBox18:setField("background_4_3");
    obj.imageCheckBox18:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox18:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.imageCheckBox19 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout5);
    obj.imageCheckBox19:setLeft(175);
    obj.imageCheckBox19:setTop(0);
    obj.imageCheckBox19:setWidth(25);
    obj.imageCheckBox19:setHeight(25);
    obj.imageCheckBox19:setField("background_4_4");
    obj.imageCheckBox19:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox19:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.imageCheckBox20 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout5);
    obj.imageCheckBox20:setLeft(200);
    obj.imageCheckBox20:setTop(0);
    obj.imageCheckBox20:setWidth(25);
    obj.imageCheckBox20:setHeight(25);
    obj.imageCheckBox20:setField("background_4_5");
    obj.imageCheckBox20:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox20:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(15);
    obj.layout6:setTop(125);
    obj.layout6:setWidth(225);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(0);
    obj.edit5:setTop(5);
    obj.edit5:setWidth(95);
    obj.edit5:setHeight(20);
    obj.edit5:setField("background_5");
    obj.edit5:setFontSize(12);
    obj.edit5:setName("edit5");

    obj.imageCheckBox21 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout6);
    obj.imageCheckBox21:setLeft(100);
    obj.imageCheckBox21:setTop(0);
    obj.imageCheckBox21:setWidth(25);
    obj.imageCheckBox21:setHeight(25);
    obj.imageCheckBox21:setField("background_5_1");
    obj.imageCheckBox21:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox21:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.imageCheckBox22 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout6);
    obj.imageCheckBox22:setLeft(125);
    obj.imageCheckBox22:setTop(0);
    obj.imageCheckBox22:setWidth(25);
    obj.imageCheckBox22:setHeight(25);
    obj.imageCheckBox22:setField("background_5_2");
    obj.imageCheckBox22:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox22:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.imageCheckBox23 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout6);
    obj.imageCheckBox23:setLeft(150);
    obj.imageCheckBox23:setTop(0);
    obj.imageCheckBox23:setWidth(25);
    obj.imageCheckBox23:setHeight(25);
    obj.imageCheckBox23:setField("background_5_3");
    obj.imageCheckBox23:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox23:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.imageCheckBox24 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout6);
    obj.imageCheckBox24:setLeft(175);
    obj.imageCheckBox24:setTop(0);
    obj.imageCheckBox24:setWidth(25);
    obj.imageCheckBox24:setHeight(25);
    obj.imageCheckBox24:setField("background_5_4");
    obj.imageCheckBox24:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox24:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.imageCheckBox25 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout6);
    obj.imageCheckBox25:setLeft(200);
    obj.imageCheckBox25:setTop(0);
    obj.imageCheckBox25:setWidth(25);
    obj.imageCheckBox25:setHeight(25);
    obj.imageCheckBox25:setField("background_5_5");
    obj.imageCheckBox25:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox25:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(15);
    obj.layout7:setTop(150);
    obj.layout7:setWidth(225);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setLeft(0);
    obj.edit6:setTop(5);
    obj.edit6:setWidth(95);
    obj.edit6:setHeight(20);
    obj.edit6:setField("background_6");
    obj.edit6:setFontSize(12);
    obj.edit6:setName("edit6");

    obj.imageCheckBox26 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout7);
    obj.imageCheckBox26:setLeft(100);
    obj.imageCheckBox26:setTop(0);
    obj.imageCheckBox26:setWidth(25);
    obj.imageCheckBox26:setHeight(25);
    obj.imageCheckBox26:setField("background_6_1");
    obj.imageCheckBox26:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox26:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.imageCheckBox27 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout7);
    obj.imageCheckBox27:setLeft(125);
    obj.imageCheckBox27:setTop(0);
    obj.imageCheckBox27:setWidth(25);
    obj.imageCheckBox27:setHeight(25);
    obj.imageCheckBox27:setField("background_6_2");
    obj.imageCheckBox27:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox27:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.imageCheckBox28 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout7);
    obj.imageCheckBox28:setLeft(150);
    obj.imageCheckBox28:setTop(0);
    obj.imageCheckBox28:setWidth(25);
    obj.imageCheckBox28:setHeight(25);
    obj.imageCheckBox28:setField("background_6_3");
    obj.imageCheckBox28:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox28:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.imageCheckBox29 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout7);
    obj.imageCheckBox29:setLeft(175);
    obj.imageCheckBox29:setTop(0);
    obj.imageCheckBox29:setWidth(25);
    obj.imageCheckBox29:setHeight(25);
    obj.imageCheckBox29:setField("background_6_4");
    obj.imageCheckBox29:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox29:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.imageCheckBox30 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout7);
    obj.imageCheckBox30:setLeft(200);
    obj.imageCheckBox30:setTop(0);
    obj.imageCheckBox30:setWidth(25);
    obj.imageCheckBox30:setHeight(25);
    obj.imageCheckBox30:setField("background_6_5");
    obj.imageCheckBox30:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox30:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(215);
    obj.layout8:setWidth(255);
    obj.layout8:setHeight(355);
    obj.layout8:setName("layout8");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout8);
    obj.label2:setLeft(5);
    obj.label2:setTop(0);
    obj.label2:setWidth(240);
    obj.label2:setHeight(20);
    obj.label2:setText("GIFTS");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(15);
    obj.layout9:setTop(25);
    obj.layout9:setWidth(225);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setLeft(0);
    obj.edit7:setTop(5);
    obj.edit7:setWidth(255);
    obj.edit7:setHeight(20);
    obj.edit7:setField("gift_1");
    obj.edit7:setName("edit7");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(15);
    obj.layout10:setTop(50);
    obj.layout10:setWidth(225);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setLeft(0);
    obj.edit8:setTop(5);
    obj.edit8:setWidth(255);
    obj.edit8:setHeight(20);
    obj.edit8:setField("gift_2");
    obj.edit8:setName("edit8");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(15);
    obj.layout11:setTop(75);
    obj.layout11:setWidth(225);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout11);
    obj.edit9:setLeft(0);
    obj.edit9:setTop(5);
    obj.edit9:setWidth(255);
    obj.edit9:setHeight(20);
    obj.edit9:setField("gift_3");
    obj.edit9:setName("edit9");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(15);
    obj.layout12:setTop(100);
    obj.layout12:setWidth(225);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout12);
    obj.edit10:setLeft(0);
    obj.edit10:setTop(5);
    obj.edit10:setWidth(255);
    obj.edit10:setHeight(20);
    obj.edit10:setField("gift_4");
    obj.edit10:setName("edit10");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(15);
    obj.layout13:setTop(125);
    obj.layout13:setWidth(225);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout13);
    obj.edit11:setLeft(0);
    obj.edit11:setTop(5);
    obj.edit11:setWidth(255);
    obj.edit11:setHeight(20);
    obj.edit11:setField("gift_5");
    obj.edit11:setName("edit11");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(15);
    obj.layout14:setTop(150);
    obj.layout14:setWidth(225);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout14);
    obj.edit12:setLeft(0);
    obj.edit12:setTop(5);
    obj.edit12:setWidth(255);
    obj.edit12:setHeight(20);
    obj.edit12:setField("gift_6");
    obj.edit12:setName("edit12");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout8);
    obj.layout15:setLeft(15);
    obj.layout15:setTop(175);
    obj.layout15:setWidth(225);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout15);
    obj.edit13:setLeft(0);
    obj.edit13:setTop(5);
    obj.edit13:setWidth(255);
    obj.edit13:setHeight(20);
    obj.edit13:setField("gift_7");
    obj.edit13:setName("edit13");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout8);
    obj.layout16:setLeft(15);
    obj.layout16:setTop(200);
    obj.layout16:setWidth(225);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout16);
    obj.edit14:setLeft(0);
    obj.edit14:setTop(5);
    obj.edit14:setWidth(255);
    obj.edit14:setHeight(20);
    obj.edit14:setField("gift_8");
    obj.edit14:setName("edit14");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout8);
    obj.layout17:setLeft(15);
    obj.layout17:setTop(225);
    obj.layout17:setWidth(225);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout17);
    obj.edit15:setLeft(0);
    obj.edit15:setTop(5);
    obj.edit15:setWidth(255);
    obj.edit15:setHeight(20);
    obj.edit15:setField("gift_9");
    obj.edit15:setName("edit15");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout8);
    obj.layout18:setLeft(15);
    obj.layout18:setTop(250);
    obj.layout18:setWidth(225);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout18);
    obj.edit16:setLeft(0);
    obj.edit16:setTop(5);
    obj.edit16:setWidth(255);
    obj.edit16:setHeight(20);
    obj.edit16:setField("gift_10");
    obj.edit16:setName("edit16");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout8);
    obj.layout19:setLeft(15);
    obj.layout19:setTop(275);
    obj.layout19:setWidth(225);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout19);
    obj.edit17:setLeft(0);
    obj.edit17:setTop(5);
    obj.edit17:setWidth(255);
    obj.edit17:setHeight(20);
    obj.edit17:setField("gift_11");
    obj.edit17:setName("edit17");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout8);
    obj.layout20:setLeft(15);
    obj.layout20:setTop(300);
    obj.layout20:setWidth(225);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout20);
    obj.edit18:setLeft(0);
    obj.edit18:setTop(5);
    obj.edit18:setWidth(255);
    obj.edit18:setHeight(20);
    obj.edit18:setField("gift_12");
    obj.edit18:setName("edit18");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox1);
    obj.layout21:setLeft(265);
    obj.layout21:setTop(0);
    obj.layout21:setWidth(690);
    obj.layout21:setHeight(205);
    obj.layout21:setName("layout21");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout21);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("innerLine");
    obj.rectangle3:setName("rectangle3");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setLeft(15);
    obj.layout22:setTop(0);
    obj.layout22:setWidth(125);
    obj.layout22:setHeight(175);
    obj.layout22:setName("layout22");

    obj.radioButton1 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout22);
    obj.radioButton1:setLeft(25);
    obj.radioButton1:setTop(0);
    obj.radioButton1:setWidth(75);
    obj.radioButton1:setHeight(20);
    obj.radioButton1:setText("HOMID");
    obj.radioButton1:setHorzTextAlign("center");
    obj.radioButton1:setGroupName("form");
    obj.radioButton1:setField("shape");
    obj.radioButton1:setName("radioButton1");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout22);
    obj.label3:setLeft(0);
    obj.label3:setTop(70);
    obj.label3:setWidth(125);
    obj.label3:setHeight(20);
    obj.label3:setText("No Change");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout22);
    obj.label4:setLeft(0);
    obj.label4:setTop(130);
    obj.label4:setWidth(125);
    obj.label4:setHeight(20);
    obj.label4:setText("Difficulty: 6");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout21);
    obj.layout23:setLeft(150);
    obj.layout23:setTop(0);
    obj.layout23:setWidth(125);
    obj.layout23:setHeight(190);
    obj.layout23:setName("layout23");

    obj.radioButton2 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout23);
    obj.radioButton2:setLeft(25);
    obj.radioButton2:setTop(0);
    obj.radioButton2:setWidth(75);
    obj.radioButton2:setHeight(20);
    obj.radioButton2:setText("GLABRO");
    obj.radioButton2:setHorzTextAlign("center");
    obj.radioButton2:setGroupName("form");
    obj.radioButton2:setField("shape");
    obj.radioButton2:setName("radioButton2");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout23);
    obj.label5:setLeft(0);
    obj.label5:setTop(30);
    obj.label5:setWidth(125);
    obj.label5:setHeight(20);
    obj.label5:setText("Strength (+2)");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout23);
    obj.label6:setLeft(0);
    obj.label6:setTop(50);
    obj.label6:setWidth(125);
    obj.label6:setHeight(20);
    obj.label6:setText("Stamina (+2)");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout23);
    obj.label7:setLeft(0);
    obj.label7:setTop(70);
    obj.label7:setWidth(125);
    obj.label7:setHeight(20);
    obj.label7:setText("Appearance (-1)");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout23);
    obj.label8:setLeft(0);
    obj.label8:setTop(90);
    obj.label8:setWidth(125);
    obj.label8:setHeight(20);
    obj.label8:setText("Manipulation (-2)");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout23);
    obj.label9:setLeft(0);
    obj.label9:setTop(130);
    obj.label9:setWidth(125);
    obj.label9:setHeight(20);
    obj.label9:setText("Difficulty: 7");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24:setLeft(285);
    obj.layout24:setTop(0);
    obj.layout24:setWidth(125);
    obj.layout24:setHeight(190);
    obj.layout24:setName("layout24");

    obj.radioButton3 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout24);
    obj.radioButton3:setLeft(25);
    obj.radioButton3:setTop(0);
    obj.radioButton3:setWidth(75);
    obj.radioButton3:setHeight(20);
    obj.radioButton3:setText("CRINOS");
    obj.radioButton3:setHorzTextAlign("center");
    obj.radioButton3:setGroupName("form");
    obj.radioButton3:setField("shape");
    obj.radioButton3:setName("radioButton3");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout24);
    obj.label10:setLeft(0);
    obj.label10:setTop(30);
    obj.label10:setWidth(125);
    obj.label10:setHeight(20);
    obj.label10:setText("Strength (+4)");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout24);
    obj.label11:setLeft(0);
    obj.label11:setTop(50);
    obj.label11:setWidth(125);
    obj.label11:setHeight(20);
    obj.label11:setText("Dextery (+1)");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout24);
    obj.label12:setLeft(0);
    obj.label12:setTop(70);
    obj.label12:setWidth(125);
    obj.label12:setHeight(20);
    obj.label12:setText("Stamina (+3)");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout24);
    obj.label13:setLeft(0);
    obj.label13:setTop(90);
    obj.label13:setWidth(125);
    obj.label13:setHeight(20);
    obj.label13:setText("Manipulation (-3)");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout24);
    obj.label14:setLeft(0);
    obj.label14:setTop(110);
    obj.label14:setWidth(125);
    obj.label14:setHeight(20);
    obj.label14:setText("Appearance 0");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout24);
    obj.label15:setLeft(0);
    obj.label15:setTop(130);
    obj.label15:setWidth(125);
    obj.label15:setHeight(20);
    obj.label15:setText("Difficulty: 6");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout24);
    obj.label16:setLeft(0);
    obj.label16:setTop(150);
    obj.label16:setWidth(125);
    obj.label16:setHeight(20);
    obj.label16:setText("INCITE DELIRIUM");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout24);
    obj.label17:setLeft(0);
    obj.label17:setTop(170);
    obj.label17:setWidth(125);
    obj.label17:setHeight(20);
    obj.label17:setText("IN HUMANS");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout21);
    obj.layout25:setLeft(420);
    obj.layout25:setTop(0);
    obj.layout25:setWidth(125);
    obj.layout25:setHeight(190);
    obj.layout25:setName("layout25");

    obj.radioButton4 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout25);
    obj.radioButton4:setLeft(25);
    obj.radioButton4:setTop(0);
    obj.radioButton4:setWidth(75);
    obj.radioButton4:setHeight(20);
    obj.radioButton4:setText("HISPO");
    obj.radioButton4:setHorzTextAlign("center");
    obj.radioButton4:setGroupName("form");
    obj.radioButton4:setField("shape");
    obj.radioButton4:setName("radioButton4");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout25);
    obj.label18:setLeft(0);
    obj.label18:setTop(30);
    obj.label18:setWidth(125);
    obj.label18:setHeight(20);
    obj.label18:setText("Strength (+3)");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout25);
    obj.label19:setLeft(0);
    obj.label19:setTop(50);
    obj.label19:setWidth(125);
    obj.label19:setHeight(20);
    obj.label19:setText("Dexterity (+2)");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout25);
    obj.label20:setLeft(0);
    obj.label20:setTop(70);
    obj.label20:setWidth(125);
    obj.label20:setHeight(20);
    obj.label20:setText("Stamina (+3)");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout25);
    obj.label21:setLeft(0);
    obj.label21:setTop(90);
    obj.label21:setWidth(125);
    obj.label21:setHeight(20);
    obj.label21:setText("Manipulation (-3)");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout25);
    obj.label22:setLeft(0);
    obj.label22:setTop(110);
    obj.label22:setWidth(125);
    obj.label22:setHeight(20);
    obj.label22:setText("+1 Die to Bite Damage");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontSize(11);
    obj.label22:setName("label22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout25);
    obj.label23:setLeft(0);
    obj.label23:setTop(130);
    obj.label23:setWidth(125);
    obj.label23:setHeight(20);
    obj.label23:setText("Difficulty: 7");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout21);
    obj.layout26:setLeft(555);
    obj.layout26:setTop(0);
    obj.layout26:setWidth(125);
    obj.layout26:setHeight(190);
    obj.layout26:setName("layout26");

    obj.radioButton5 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout26);
    obj.radioButton5:setLeft(25);
    obj.radioButton5:setTop(0);
    obj.radioButton5:setWidth(75);
    obj.radioButton5:setHeight(20);
    obj.radioButton5:setText("LUPUS");
    obj.radioButton5:setHorzTextAlign("center");
    obj.radioButton5:setGroupName("form");
    obj.radioButton5:setField("shape");
    obj.radioButton5:setName("radioButton5");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout26);
    obj.label24:setLeft(0);
    obj.label24:setTop(30);
    obj.label24:setWidth(125);
    obj.label24:setHeight(20);
    obj.label24:setText("Strength (+1)");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout26);
    obj.label25:setLeft(0);
    obj.label25:setTop(50);
    obj.label25:setWidth(125);
    obj.label25:setHeight(20);
    obj.label25:setText("Dexterity (+2)");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout26);
    obj.label26:setLeft(0);
    obj.label26:setTop(70);
    obj.label26:setWidth(125);
    obj.label26:setHeight(20);
    obj.label26:setText("Stamina (+2)");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout26);
    obj.label27:setLeft(0);
    obj.label27:setTop(90);
    obj.label27:setWidth(125);
    obj.label27:setHeight(20);
    obj.label27:setText("Manipulation (-3)");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout26);
    obj.label28:setLeft(0);
    obj.label28:setTop(110);
    obj.label28:setWidth(125);
    obj.label28:setHeight(20);
    obj.label28:setText("-2 Perception Diff");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setFontSize(11);
    obj.label28:setName("label28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout26);
    obj.label29:setLeft(0);
    obj.label29:setTop(130);
    obj.label29:setWidth(125);
    obj.label29:setHeight(20);
    obj.label29:setText("Difficulty: 6");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox1);
    obj.layout27:setLeft(265);
    obj.layout27:setTop(215);
    obj.layout27:setWidth(255);
    obj.layout27:setHeight(355);
    obj.layout27:setName("layout27");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout27);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("innerLine");
    obj.rectangle4:setName("rectangle4");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout27);
    obj.label30:setLeft(5);
    obj.label30:setTop(0);
    obj.label30:setWidth(240);
    obj.label30:setHeight(20);
    obj.label30:setText("OTHER TRAITS");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setLeft(15);
    obj.layout28:setTop(25);
    obj.layout28:setWidth(225);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout28);
    obj.edit19:setLeft(0);
    obj.edit19:setTop(5);
    obj.edit19:setWidth(95);
    obj.edit19:setHeight(20);
    obj.edit19:setField("trait_1");
    obj.edit19:setFontSize(12);
    obj.edit19:setName("edit19");

    obj.imageCheckBox31 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout28);
    obj.imageCheckBox31:setLeft(100);
    obj.imageCheckBox31:setTop(0);
    obj.imageCheckBox31:setWidth(25);
    obj.imageCheckBox31:setHeight(25);
    obj.imageCheckBox31:setField("trait_1_1");
    obj.imageCheckBox31:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox31:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.imageCheckBox32 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout28);
    obj.imageCheckBox32:setLeft(125);
    obj.imageCheckBox32:setTop(0);
    obj.imageCheckBox32:setWidth(25);
    obj.imageCheckBox32:setHeight(25);
    obj.imageCheckBox32:setField("trait_1_2");
    obj.imageCheckBox32:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox32:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.imageCheckBox33 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout28);
    obj.imageCheckBox33:setLeft(150);
    obj.imageCheckBox33:setTop(0);
    obj.imageCheckBox33:setWidth(25);
    obj.imageCheckBox33:setHeight(25);
    obj.imageCheckBox33:setField("trait_1_3");
    obj.imageCheckBox33:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox33:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.imageCheckBox34 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout28);
    obj.imageCheckBox34:setLeft(175);
    obj.imageCheckBox34:setTop(0);
    obj.imageCheckBox34:setWidth(25);
    obj.imageCheckBox34:setHeight(25);
    obj.imageCheckBox34:setField("trait_1_4");
    obj.imageCheckBox34:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox34:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.imageCheckBox35 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout28);
    obj.imageCheckBox35:setLeft(200);
    obj.imageCheckBox35:setTop(0);
    obj.imageCheckBox35:setWidth(25);
    obj.imageCheckBox35:setHeight(25);
    obj.imageCheckBox35:setField("trait_1_5");
    obj.imageCheckBox35:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox35:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout27);
    obj.layout29:setLeft(15);
    obj.layout29:setTop(50);
    obj.layout29:setWidth(225);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout29);
    obj.edit20:setLeft(0);
    obj.edit20:setTop(5);
    obj.edit20:setWidth(95);
    obj.edit20:setHeight(20);
    obj.edit20:setField("trait_2");
    obj.edit20:setFontSize(12);
    obj.edit20:setName("edit20");

    obj.imageCheckBox36 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout29);
    obj.imageCheckBox36:setLeft(100);
    obj.imageCheckBox36:setTop(0);
    obj.imageCheckBox36:setWidth(25);
    obj.imageCheckBox36:setHeight(25);
    obj.imageCheckBox36:setField("trait_2_1");
    obj.imageCheckBox36:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox36:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.imageCheckBox37 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout29);
    obj.imageCheckBox37:setLeft(125);
    obj.imageCheckBox37:setTop(0);
    obj.imageCheckBox37:setWidth(25);
    obj.imageCheckBox37:setHeight(25);
    obj.imageCheckBox37:setField("trait_2_2");
    obj.imageCheckBox37:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox37:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.imageCheckBox38 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout29);
    obj.imageCheckBox38:setLeft(150);
    obj.imageCheckBox38:setTop(0);
    obj.imageCheckBox38:setWidth(25);
    obj.imageCheckBox38:setHeight(25);
    obj.imageCheckBox38:setField("trait_2_3");
    obj.imageCheckBox38:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox38:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.imageCheckBox39 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout29);
    obj.imageCheckBox39:setLeft(175);
    obj.imageCheckBox39:setTop(0);
    obj.imageCheckBox39:setWidth(25);
    obj.imageCheckBox39:setHeight(25);
    obj.imageCheckBox39:setField("trait_2_4");
    obj.imageCheckBox39:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox39:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.imageCheckBox40 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout29);
    obj.imageCheckBox40:setLeft(200);
    obj.imageCheckBox40:setTop(0);
    obj.imageCheckBox40:setWidth(25);
    obj.imageCheckBox40:setHeight(25);
    obj.imageCheckBox40:setField("trait_2_5");
    obj.imageCheckBox40:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox40:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout27);
    obj.layout30:setLeft(15);
    obj.layout30:setTop(75);
    obj.layout30:setWidth(225);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout30);
    obj.edit21:setLeft(0);
    obj.edit21:setTop(5);
    obj.edit21:setWidth(95);
    obj.edit21:setHeight(20);
    obj.edit21:setField("trait_3");
    obj.edit21:setFontSize(12);
    obj.edit21:setName("edit21");

    obj.imageCheckBox41 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout30);
    obj.imageCheckBox41:setLeft(100);
    obj.imageCheckBox41:setTop(0);
    obj.imageCheckBox41:setWidth(25);
    obj.imageCheckBox41:setHeight(25);
    obj.imageCheckBox41:setField("trait_3_1");
    obj.imageCheckBox41:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox41:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.imageCheckBox42 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout30);
    obj.imageCheckBox42:setLeft(125);
    obj.imageCheckBox42:setTop(0);
    obj.imageCheckBox42:setWidth(25);
    obj.imageCheckBox42:setHeight(25);
    obj.imageCheckBox42:setField("trait_3_2");
    obj.imageCheckBox42:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox42:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.imageCheckBox43 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox43:setParent(obj.layout30);
    obj.imageCheckBox43:setLeft(150);
    obj.imageCheckBox43:setTop(0);
    obj.imageCheckBox43:setWidth(25);
    obj.imageCheckBox43:setHeight(25);
    obj.imageCheckBox43:setField("trait_3_3");
    obj.imageCheckBox43:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox43:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox43:setName("imageCheckBox43");

    obj.imageCheckBox44 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox44:setParent(obj.layout30);
    obj.imageCheckBox44:setLeft(175);
    obj.imageCheckBox44:setTop(0);
    obj.imageCheckBox44:setWidth(25);
    obj.imageCheckBox44:setHeight(25);
    obj.imageCheckBox44:setField("trait_3_4");
    obj.imageCheckBox44:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox44:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox44:setName("imageCheckBox44");

    obj.imageCheckBox45 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox45:setParent(obj.layout30);
    obj.imageCheckBox45:setLeft(200);
    obj.imageCheckBox45:setTop(0);
    obj.imageCheckBox45:setWidth(25);
    obj.imageCheckBox45:setHeight(25);
    obj.imageCheckBox45:setField("trait_3_5");
    obj.imageCheckBox45:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox45:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox45:setName("imageCheckBox45");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout27);
    obj.layout31:setLeft(15);
    obj.layout31:setTop(100);
    obj.layout31:setWidth(225);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout31);
    obj.edit22:setLeft(0);
    obj.edit22:setTop(5);
    obj.edit22:setWidth(95);
    obj.edit22:setHeight(20);
    obj.edit22:setField("trait_4");
    obj.edit22:setFontSize(12);
    obj.edit22:setName("edit22");

    obj.imageCheckBox46 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox46:setParent(obj.layout31);
    obj.imageCheckBox46:setLeft(100);
    obj.imageCheckBox46:setTop(0);
    obj.imageCheckBox46:setWidth(25);
    obj.imageCheckBox46:setHeight(25);
    obj.imageCheckBox46:setField("trait_4_1");
    obj.imageCheckBox46:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox46:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox46:setName("imageCheckBox46");

    obj.imageCheckBox47 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox47:setParent(obj.layout31);
    obj.imageCheckBox47:setLeft(125);
    obj.imageCheckBox47:setTop(0);
    obj.imageCheckBox47:setWidth(25);
    obj.imageCheckBox47:setHeight(25);
    obj.imageCheckBox47:setField("trait_4_2");
    obj.imageCheckBox47:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox47:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox47:setName("imageCheckBox47");

    obj.imageCheckBox48 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox48:setParent(obj.layout31);
    obj.imageCheckBox48:setLeft(150);
    obj.imageCheckBox48:setTop(0);
    obj.imageCheckBox48:setWidth(25);
    obj.imageCheckBox48:setHeight(25);
    obj.imageCheckBox48:setField("trait_4_3");
    obj.imageCheckBox48:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox48:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox48:setName("imageCheckBox48");

    obj.imageCheckBox49 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox49:setParent(obj.layout31);
    obj.imageCheckBox49:setLeft(175);
    obj.imageCheckBox49:setTop(0);
    obj.imageCheckBox49:setWidth(25);
    obj.imageCheckBox49:setHeight(25);
    obj.imageCheckBox49:setField("trait_4_4");
    obj.imageCheckBox49:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox49:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox49:setName("imageCheckBox49");

    obj.imageCheckBox50 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox50:setParent(obj.layout31);
    obj.imageCheckBox50:setLeft(200);
    obj.imageCheckBox50:setTop(0);
    obj.imageCheckBox50:setWidth(25);
    obj.imageCheckBox50:setHeight(25);
    obj.imageCheckBox50:setField("trait_4_5");
    obj.imageCheckBox50:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox50:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox50:setName("imageCheckBox50");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout27);
    obj.layout32:setLeft(15);
    obj.layout32:setTop(125);
    obj.layout32:setWidth(225);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout32);
    obj.edit23:setLeft(0);
    obj.edit23:setTop(5);
    obj.edit23:setWidth(95);
    obj.edit23:setHeight(20);
    obj.edit23:setField("trait_5");
    obj.edit23:setFontSize(12);
    obj.edit23:setName("edit23");

    obj.imageCheckBox51 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox51:setParent(obj.layout32);
    obj.imageCheckBox51:setLeft(100);
    obj.imageCheckBox51:setTop(0);
    obj.imageCheckBox51:setWidth(25);
    obj.imageCheckBox51:setHeight(25);
    obj.imageCheckBox51:setField("trait_5_1");
    obj.imageCheckBox51:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox51:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox51:setName("imageCheckBox51");

    obj.imageCheckBox52 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox52:setParent(obj.layout32);
    obj.imageCheckBox52:setLeft(125);
    obj.imageCheckBox52:setTop(0);
    obj.imageCheckBox52:setWidth(25);
    obj.imageCheckBox52:setHeight(25);
    obj.imageCheckBox52:setField("trait_5_2");
    obj.imageCheckBox52:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox52:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox52:setName("imageCheckBox52");

    obj.imageCheckBox53 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox53:setParent(obj.layout32);
    obj.imageCheckBox53:setLeft(150);
    obj.imageCheckBox53:setTop(0);
    obj.imageCheckBox53:setWidth(25);
    obj.imageCheckBox53:setHeight(25);
    obj.imageCheckBox53:setField("trait_5_3");
    obj.imageCheckBox53:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox53:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox53:setName("imageCheckBox53");

    obj.imageCheckBox54 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox54:setParent(obj.layout32);
    obj.imageCheckBox54:setLeft(175);
    obj.imageCheckBox54:setTop(0);
    obj.imageCheckBox54:setWidth(25);
    obj.imageCheckBox54:setHeight(25);
    obj.imageCheckBox54:setField("trait_5_4");
    obj.imageCheckBox54:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox54:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox54:setName("imageCheckBox54");

    obj.imageCheckBox55 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox55:setParent(obj.layout32);
    obj.imageCheckBox55:setLeft(200);
    obj.imageCheckBox55:setTop(0);
    obj.imageCheckBox55:setWidth(25);
    obj.imageCheckBox55:setHeight(25);
    obj.imageCheckBox55:setField("trait_5_5");
    obj.imageCheckBox55:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox55:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox55:setName("imageCheckBox55");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout27);
    obj.layout33:setLeft(15);
    obj.layout33:setTop(150);
    obj.layout33:setWidth(225);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout33);
    obj.edit24:setLeft(0);
    obj.edit24:setTop(5);
    obj.edit24:setWidth(95);
    obj.edit24:setHeight(20);
    obj.edit24:setField("trait_6");
    obj.edit24:setFontSize(12);
    obj.edit24:setName("edit24");

    obj.imageCheckBox56 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox56:setParent(obj.layout33);
    obj.imageCheckBox56:setLeft(100);
    obj.imageCheckBox56:setTop(0);
    obj.imageCheckBox56:setWidth(25);
    obj.imageCheckBox56:setHeight(25);
    obj.imageCheckBox56:setField("trait_6_1");
    obj.imageCheckBox56:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox56:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox56:setName("imageCheckBox56");

    obj.imageCheckBox57 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox57:setParent(obj.layout33);
    obj.imageCheckBox57:setLeft(125);
    obj.imageCheckBox57:setTop(0);
    obj.imageCheckBox57:setWidth(25);
    obj.imageCheckBox57:setHeight(25);
    obj.imageCheckBox57:setField("trait_6_2");
    obj.imageCheckBox57:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox57:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox57:setName("imageCheckBox57");

    obj.imageCheckBox58 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox58:setParent(obj.layout33);
    obj.imageCheckBox58:setLeft(150);
    obj.imageCheckBox58:setTop(0);
    obj.imageCheckBox58:setWidth(25);
    obj.imageCheckBox58:setHeight(25);
    obj.imageCheckBox58:setField("trait_6_3");
    obj.imageCheckBox58:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox58:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox58:setName("imageCheckBox58");

    obj.imageCheckBox59 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox59:setParent(obj.layout33);
    obj.imageCheckBox59:setLeft(175);
    obj.imageCheckBox59:setTop(0);
    obj.imageCheckBox59:setWidth(25);
    obj.imageCheckBox59:setHeight(25);
    obj.imageCheckBox59:setField("trait_6_4");
    obj.imageCheckBox59:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox59:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox59:setName("imageCheckBox59");

    obj.imageCheckBox60 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox60:setParent(obj.layout33);
    obj.imageCheckBox60:setLeft(200);
    obj.imageCheckBox60:setTop(0);
    obj.imageCheckBox60:setWidth(25);
    obj.imageCheckBox60:setHeight(25);
    obj.imageCheckBox60:setField("trait_6_5");
    obj.imageCheckBox60:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox60:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox60:setName("imageCheckBox60");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout27);
    obj.layout34:setLeft(15);
    obj.layout34:setTop(175);
    obj.layout34:setWidth(225);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout34);
    obj.edit25:setLeft(0);
    obj.edit25:setTop(5);
    obj.edit25:setWidth(95);
    obj.edit25:setHeight(20);
    obj.edit25:setField("trait_7");
    obj.edit25:setFontSize(12);
    obj.edit25:setName("edit25");

    obj.imageCheckBox61 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox61:setParent(obj.layout34);
    obj.imageCheckBox61:setLeft(100);
    obj.imageCheckBox61:setTop(0);
    obj.imageCheckBox61:setWidth(25);
    obj.imageCheckBox61:setHeight(25);
    obj.imageCheckBox61:setField("trait_7_1");
    obj.imageCheckBox61:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox61:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox61:setName("imageCheckBox61");

    obj.imageCheckBox62 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox62:setParent(obj.layout34);
    obj.imageCheckBox62:setLeft(125);
    obj.imageCheckBox62:setTop(0);
    obj.imageCheckBox62:setWidth(25);
    obj.imageCheckBox62:setHeight(25);
    obj.imageCheckBox62:setField("trait_7_2");
    obj.imageCheckBox62:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox62:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox62:setName("imageCheckBox62");

    obj.imageCheckBox63 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox63:setParent(obj.layout34);
    obj.imageCheckBox63:setLeft(150);
    obj.imageCheckBox63:setTop(0);
    obj.imageCheckBox63:setWidth(25);
    obj.imageCheckBox63:setHeight(25);
    obj.imageCheckBox63:setField("trait_7_3");
    obj.imageCheckBox63:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox63:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox63:setName("imageCheckBox63");

    obj.imageCheckBox64 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox64:setParent(obj.layout34);
    obj.imageCheckBox64:setLeft(175);
    obj.imageCheckBox64:setTop(0);
    obj.imageCheckBox64:setWidth(25);
    obj.imageCheckBox64:setHeight(25);
    obj.imageCheckBox64:setField("trait_7_4");
    obj.imageCheckBox64:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox64:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox64:setName("imageCheckBox64");

    obj.imageCheckBox65 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox65:setParent(obj.layout34);
    obj.imageCheckBox65:setLeft(200);
    obj.imageCheckBox65:setTop(0);
    obj.imageCheckBox65:setWidth(25);
    obj.imageCheckBox65:setHeight(25);
    obj.imageCheckBox65:setField("trait_7_5");
    obj.imageCheckBox65:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox65:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox65:setName("imageCheckBox65");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout27);
    obj.layout35:setLeft(15);
    obj.layout35:setTop(200);
    obj.layout35:setWidth(225);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout35);
    obj.edit26:setLeft(0);
    obj.edit26:setTop(5);
    obj.edit26:setWidth(95);
    obj.edit26:setHeight(20);
    obj.edit26:setField("trait_8");
    obj.edit26:setFontSize(12);
    obj.edit26:setName("edit26");

    obj.imageCheckBox66 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox66:setParent(obj.layout35);
    obj.imageCheckBox66:setLeft(100);
    obj.imageCheckBox66:setTop(0);
    obj.imageCheckBox66:setWidth(25);
    obj.imageCheckBox66:setHeight(25);
    obj.imageCheckBox66:setField("trait_8_1");
    obj.imageCheckBox66:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox66:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox66:setName("imageCheckBox66");

    obj.imageCheckBox67 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox67:setParent(obj.layout35);
    obj.imageCheckBox67:setLeft(125);
    obj.imageCheckBox67:setTop(0);
    obj.imageCheckBox67:setWidth(25);
    obj.imageCheckBox67:setHeight(25);
    obj.imageCheckBox67:setField("trait_8_2");
    obj.imageCheckBox67:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox67:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox67:setName("imageCheckBox67");

    obj.imageCheckBox68 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox68:setParent(obj.layout35);
    obj.imageCheckBox68:setLeft(150);
    obj.imageCheckBox68:setTop(0);
    obj.imageCheckBox68:setWidth(25);
    obj.imageCheckBox68:setHeight(25);
    obj.imageCheckBox68:setField("trait_8_3");
    obj.imageCheckBox68:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox68:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox68:setName("imageCheckBox68");

    obj.imageCheckBox69 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox69:setParent(obj.layout35);
    obj.imageCheckBox69:setLeft(175);
    obj.imageCheckBox69:setTop(0);
    obj.imageCheckBox69:setWidth(25);
    obj.imageCheckBox69:setHeight(25);
    obj.imageCheckBox69:setField("trait_8_4");
    obj.imageCheckBox69:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox69:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox69:setName("imageCheckBox69");

    obj.imageCheckBox70 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox70:setParent(obj.layout35);
    obj.imageCheckBox70:setLeft(200);
    obj.imageCheckBox70:setTop(0);
    obj.imageCheckBox70:setWidth(25);
    obj.imageCheckBox70:setHeight(25);
    obj.imageCheckBox70:setField("trait_8_5");
    obj.imageCheckBox70:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox70:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox70:setName("imageCheckBox70");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout27);
    obj.layout36:setLeft(15);
    obj.layout36:setTop(225);
    obj.layout36:setWidth(225);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout36);
    obj.edit27:setLeft(0);
    obj.edit27:setTop(5);
    obj.edit27:setWidth(95);
    obj.edit27:setHeight(20);
    obj.edit27:setField("trait_9");
    obj.edit27:setFontSize(12);
    obj.edit27:setName("edit27");

    obj.imageCheckBox71 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox71:setParent(obj.layout36);
    obj.imageCheckBox71:setLeft(100);
    obj.imageCheckBox71:setTop(0);
    obj.imageCheckBox71:setWidth(25);
    obj.imageCheckBox71:setHeight(25);
    obj.imageCheckBox71:setField("trait_9_1");
    obj.imageCheckBox71:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox71:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox71:setName("imageCheckBox71");

    obj.imageCheckBox72 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox72:setParent(obj.layout36);
    obj.imageCheckBox72:setLeft(125);
    obj.imageCheckBox72:setTop(0);
    obj.imageCheckBox72:setWidth(25);
    obj.imageCheckBox72:setHeight(25);
    obj.imageCheckBox72:setField("trait_9_2");
    obj.imageCheckBox72:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox72:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox72:setName("imageCheckBox72");

    obj.imageCheckBox73 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox73:setParent(obj.layout36);
    obj.imageCheckBox73:setLeft(150);
    obj.imageCheckBox73:setTop(0);
    obj.imageCheckBox73:setWidth(25);
    obj.imageCheckBox73:setHeight(25);
    obj.imageCheckBox73:setField("trait_9_3");
    obj.imageCheckBox73:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox73:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox73:setName("imageCheckBox73");

    obj.imageCheckBox74 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox74:setParent(obj.layout36);
    obj.imageCheckBox74:setLeft(175);
    obj.imageCheckBox74:setTop(0);
    obj.imageCheckBox74:setWidth(25);
    obj.imageCheckBox74:setHeight(25);
    obj.imageCheckBox74:setField("trait_9_4");
    obj.imageCheckBox74:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox74:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox74:setName("imageCheckBox74");

    obj.imageCheckBox75 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox75:setParent(obj.layout36);
    obj.imageCheckBox75:setLeft(200);
    obj.imageCheckBox75:setTop(0);
    obj.imageCheckBox75:setWidth(25);
    obj.imageCheckBox75:setHeight(25);
    obj.imageCheckBox75:setField("trait_9_5");
    obj.imageCheckBox75:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox75:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox75:setName("imageCheckBox75");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout27);
    obj.layout37:setLeft(15);
    obj.layout37:setTop(250);
    obj.layout37:setWidth(225);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout37);
    obj.edit28:setLeft(0);
    obj.edit28:setTop(5);
    obj.edit28:setWidth(95);
    obj.edit28:setHeight(20);
    obj.edit28:setField("trait_10");
    obj.edit28:setFontSize(12);
    obj.edit28:setName("edit28");

    obj.imageCheckBox76 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox76:setParent(obj.layout37);
    obj.imageCheckBox76:setLeft(100);
    obj.imageCheckBox76:setTop(0);
    obj.imageCheckBox76:setWidth(25);
    obj.imageCheckBox76:setHeight(25);
    obj.imageCheckBox76:setField("trait_10_1");
    obj.imageCheckBox76:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox76:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox76:setName("imageCheckBox76");

    obj.imageCheckBox77 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox77:setParent(obj.layout37);
    obj.imageCheckBox77:setLeft(125);
    obj.imageCheckBox77:setTop(0);
    obj.imageCheckBox77:setWidth(25);
    obj.imageCheckBox77:setHeight(25);
    obj.imageCheckBox77:setField("trait_10_2");
    obj.imageCheckBox77:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox77:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox77:setName("imageCheckBox77");

    obj.imageCheckBox78 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox78:setParent(obj.layout37);
    obj.imageCheckBox78:setLeft(150);
    obj.imageCheckBox78:setTop(0);
    obj.imageCheckBox78:setWidth(25);
    obj.imageCheckBox78:setHeight(25);
    obj.imageCheckBox78:setField("trait_10_3");
    obj.imageCheckBox78:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox78:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox78:setName("imageCheckBox78");

    obj.imageCheckBox79 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox79:setParent(obj.layout37);
    obj.imageCheckBox79:setLeft(175);
    obj.imageCheckBox79:setTop(0);
    obj.imageCheckBox79:setWidth(25);
    obj.imageCheckBox79:setHeight(25);
    obj.imageCheckBox79:setField("trait_10_4");
    obj.imageCheckBox79:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox79:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox79:setName("imageCheckBox79");

    obj.imageCheckBox80 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox80:setParent(obj.layout37);
    obj.imageCheckBox80:setLeft(200);
    obj.imageCheckBox80:setTop(0);
    obj.imageCheckBox80:setWidth(25);
    obj.imageCheckBox80:setHeight(25);
    obj.imageCheckBox80:setField("trait_10_5");
    obj.imageCheckBox80:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox80:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox80:setName("imageCheckBox80");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout27);
    obj.layout38:setLeft(15);
    obj.layout38:setTop(275);
    obj.layout38:setWidth(225);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout38);
    obj.edit29:setLeft(0);
    obj.edit29:setTop(5);
    obj.edit29:setWidth(95);
    obj.edit29:setHeight(20);
    obj.edit29:setField("trait_11");
    obj.edit29:setFontSize(12);
    obj.edit29:setName("edit29");

    obj.imageCheckBox81 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox81:setParent(obj.layout38);
    obj.imageCheckBox81:setLeft(100);
    obj.imageCheckBox81:setTop(0);
    obj.imageCheckBox81:setWidth(25);
    obj.imageCheckBox81:setHeight(25);
    obj.imageCheckBox81:setField("trait_11_1");
    obj.imageCheckBox81:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox81:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox81:setName("imageCheckBox81");

    obj.imageCheckBox82 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox82:setParent(obj.layout38);
    obj.imageCheckBox82:setLeft(125);
    obj.imageCheckBox82:setTop(0);
    obj.imageCheckBox82:setWidth(25);
    obj.imageCheckBox82:setHeight(25);
    obj.imageCheckBox82:setField("trait_11_2");
    obj.imageCheckBox82:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox82:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox82:setName("imageCheckBox82");

    obj.imageCheckBox83 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox83:setParent(obj.layout38);
    obj.imageCheckBox83:setLeft(150);
    obj.imageCheckBox83:setTop(0);
    obj.imageCheckBox83:setWidth(25);
    obj.imageCheckBox83:setHeight(25);
    obj.imageCheckBox83:setField("trait_11_3");
    obj.imageCheckBox83:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox83:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox83:setName("imageCheckBox83");

    obj.imageCheckBox84 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox84:setParent(obj.layout38);
    obj.imageCheckBox84:setLeft(175);
    obj.imageCheckBox84:setTop(0);
    obj.imageCheckBox84:setWidth(25);
    obj.imageCheckBox84:setHeight(25);
    obj.imageCheckBox84:setField("trait_11_4");
    obj.imageCheckBox84:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox84:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox84:setName("imageCheckBox84");

    obj.imageCheckBox85 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox85:setParent(obj.layout38);
    obj.imageCheckBox85:setLeft(200);
    obj.imageCheckBox85:setTop(0);
    obj.imageCheckBox85:setWidth(25);
    obj.imageCheckBox85:setHeight(25);
    obj.imageCheckBox85:setField("trait_11_5");
    obj.imageCheckBox85:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox85:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox85:setName("imageCheckBox85");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout27);
    obj.layout39:setLeft(15);
    obj.layout39:setTop(300);
    obj.layout39:setWidth(225);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout39);
    obj.edit30:setLeft(0);
    obj.edit30:setTop(5);
    obj.edit30:setWidth(95);
    obj.edit30:setHeight(20);
    obj.edit30:setField("trait_12");
    obj.edit30:setFontSize(12);
    obj.edit30:setName("edit30");

    obj.imageCheckBox86 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox86:setParent(obj.layout39);
    obj.imageCheckBox86:setLeft(100);
    obj.imageCheckBox86:setTop(0);
    obj.imageCheckBox86:setWidth(25);
    obj.imageCheckBox86:setHeight(25);
    obj.imageCheckBox86:setField("trait_12_1");
    obj.imageCheckBox86:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox86:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox86:setName("imageCheckBox86");

    obj.imageCheckBox87 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox87:setParent(obj.layout39);
    obj.imageCheckBox87:setLeft(125);
    obj.imageCheckBox87:setTop(0);
    obj.imageCheckBox87:setWidth(25);
    obj.imageCheckBox87:setHeight(25);
    obj.imageCheckBox87:setField("trait_12_2");
    obj.imageCheckBox87:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox87:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox87:setName("imageCheckBox87");

    obj.imageCheckBox88 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox88:setParent(obj.layout39);
    obj.imageCheckBox88:setLeft(150);
    obj.imageCheckBox88:setTop(0);
    obj.imageCheckBox88:setWidth(25);
    obj.imageCheckBox88:setHeight(25);
    obj.imageCheckBox88:setField("trait_12_3");
    obj.imageCheckBox88:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox88:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox88:setName("imageCheckBox88");

    obj.imageCheckBox89 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox89:setParent(obj.layout39);
    obj.imageCheckBox89:setLeft(175);
    obj.imageCheckBox89:setTop(0);
    obj.imageCheckBox89:setWidth(25);
    obj.imageCheckBox89:setHeight(25);
    obj.imageCheckBox89:setField("trait_12_4");
    obj.imageCheckBox89:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox89:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox89:setName("imageCheckBox89");

    obj.imageCheckBox90 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox90:setParent(obj.layout39);
    obj.imageCheckBox90:setLeft(200);
    obj.imageCheckBox90:setTop(0);
    obj.imageCheckBox90:setWidth(25);
    obj.imageCheckBox90:setHeight(25);
    obj.imageCheckBox90:setField("trait_12_5");
    obj.imageCheckBox90:setImageChecked("/Werewolf20th/images/paw_on.png");
    obj.imageCheckBox90:setImageUnchecked("/Werewolf20th/images/paw_off.png");
    obj.imageCheckBox90:setName("imageCheckBox90");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox1);
    obj.layout40:setLeft(530);
    obj.layout40:setTop(215);
    obj.layout40:setWidth(255);
    obj.layout40:setHeight(355);
    obj.layout40:setName("layout40");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout40);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("innerLine");
    obj.rectangle5:setName("rectangle5");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout40);
    obj.label31:setLeft(5);
    obj.label31:setTop(0);
    obj.label31:setWidth(240);
    obj.label31:setHeight(20);
    obj.label31:setText("RITES");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setLeft(15);
    obj.layout41:setTop(25);
    obj.layout41:setWidth(225);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout41);
    obj.edit31:setLeft(0);
    obj.edit31:setTop(5);
    obj.edit31:setWidth(255);
    obj.edit31:setHeight(20);
    obj.edit31:setField("rites_1");
    obj.edit31:setName("edit31");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setLeft(15);
    obj.layout42:setTop(50);
    obj.layout42:setWidth(225);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout42);
    obj.edit32:setLeft(0);
    obj.edit32:setTop(5);
    obj.edit32:setWidth(255);
    obj.edit32:setHeight(20);
    obj.edit32:setField("rites_2");
    obj.edit32:setName("edit32");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43:setLeft(15);
    obj.layout43:setTop(75);
    obj.layout43:setWidth(225);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout43);
    obj.edit33:setLeft(0);
    obj.edit33:setTop(5);
    obj.edit33:setWidth(255);
    obj.edit33:setHeight(20);
    obj.edit33:setField("rites_3");
    obj.edit33:setName("edit33");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setLeft(15);
    obj.layout44:setTop(100);
    obj.layout44:setWidth(225);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout44);
    obj.edit34:setLeft(0);
    obj.edit34:setTop(5);
    obj.edit34:setWidth(255);
    obj.edit34:setHeight(20);
    obj.edit34:setField("rites_4");
    obj.edit34:setName("edit34");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout40);
    obj.layout45:setLeft(15);
    obj.layout45:setTop(125);
    obj.layout45:setWidth(225);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout45);
    obj.edit35:setLeft(0);
    obj.edit35:setTop(5);
    obj.edit35:setWidth(255);
    obj.edit35:setHeight(20);
    obj.edit35:setField("rites_5");
    obj.edit35:setName("edit35");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout40);
    obj.layout46:setLeft(15);
    obj.layout46:setTop(150);
    obj.layout46:setWidth(225);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout46);
    obj.edit36:setLeft(0);
    obj.edit36:setTop(5);
    obj.edit36:setWidth(255);
    obj.edit36:setHeight(20);
    obj.edit36:setField("rites_6");
    obj.edit36:setName("edit36");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout40);
    obj.layout47:setLeft(15);
    obj.layout47:setTop(175);
    obj.layout47:setWidth(225);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout47);
    obj.edit37:setLeft(0);
    obj.edit37:setTop(5);
    obj.edit37:setWidth(255);
    obj.edit37:setHeight(20);
    obj.edit37:setField("rites_7");
    obj.edit37:setName("edit37");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout40);
    obj.layout48:setLeft(15);
    obj.layout48:setTop(200);
    obj.layout48:setWidth(225);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout48);
    obj.edit38:setLeft(0);
    obj.edit38:setTop(5);
    obj.edit38:setWidth(255);
    obj.edit38:setHeight(20);
    obj.edit38:setField("rites_8");
    obj.edit38:setName("edit38");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout40);
    obj.layout49:setLeft(15);
    obj.layout49:setTop(225);
    obj.layout49:setWidth(225);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout49);
    obj.edit39:setLeft(0);
    obj.edit39:setTop(5);
    obj.edit39:setWidth(255);
    obj.edit39:setHeight(20);
    obj.edit39:setField("rites_9");
    obj.edit39:setName("edit39");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout40);
    obj.layout50:setLeft(15);
    obj.layout50:setTop(250);
    obj.layout50:setWidth(225);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout50);
    obj.edit40:setLeft(0);
    obj.edit40:setTop(5);
    obj.edit40:setWidth(255);
    obj.edit40:setHeight(20);
    obj.edit40:setField("rites_10");
    obj.edit40:setName("edit40");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout40);
    obj.layout51:setLeft(15);
    obj.layout51:setTop(275);
    obj.layout51:setWidth(225);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout51);
    obj.edit41:setLeft(0);
    obj.edit41:setTop(5);
    obj.edit41:setWidth(255);
    obj.edit41:setHeight(20);
    obj.edit41:setField("rites_11");
    obj.edit41:setName("edit41");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout40);
    obj.layout52:setLeft(15);
    obj.layout52:setTop(300);
    obj.layout52:setWidth(225);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout52);
    obj.edit42:setLeft(0);
    obj.edit42:setTop(5);
    obj.edit42:setWidth(255);
    obj.edit42:setHeight(20);
    obj.edit42:setField("rites_12");
    obj.edit42:setName("edit42");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox1);
    obj.layout53:setLeft(795);
    obj.layout53:setTop(215);
    obj.layout53:setWidth(255);
    obj.layout53:setHeight(170);
    obj.layout53:setName("layout53");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout53);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("innerLine");
    obj.rectangle6:setName("rectangle6");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout53);
    obj.label32:setLeft(5);
    obj.label32:setTop(0);
    obj.label32:setWidth(240);
    obj.label32:setHeight(20);
    obj.label32:setText("BATTLE SCARS");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout53);
    obj.textEditor1:setLeft(15);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(225);
    obj.textEditor1:setHeight(130);
    obj.textEditor1:setField("scars");
    obj.textEditor1:setName("textEditor1");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox1);
    obj.layout54:setLeft(795);
    obj.layout54:setTop(400);
    obj.layout54:setWidth(255);
    obj.layout54:setHeight(170);
    obj.layout54:setName("layout54");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout54);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("innerLine");
    obj.rectangle7:setName("rectangle7");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout54);
    obj.label33:setLeft(5);
    obj.label33:setTop(0);
    obj.label33:setWidth(240);
    obj.label33:setHeight(20);
    obj.label33:setText("METIS DEFORMITY");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout54);
    obj.textEditor2:setLeft(15);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(225);
    obj.textEditor2:setHeight(130);
    obj.textEditor2:setField("deformity");
    obj.textEditor2:setName("textEditor2");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.imageCheckBox65 ~= nil then self.imageCheckBox65:destroy(); self.imageCheckBox65 = nil; end;
        if self.imageCheckBox73 ~= nil then self.imageCheckBox73:destroy(); self.imageCheckBox73 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.imageCheckBox76 ~= nil then self.imageCheckBox76:destroy(); self.imageCheckBox76 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.imageCheckBox58 ~= nil then self.imageCheckBox58:destroy(); self.imageCheckBox58 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.imageCheckBox50 ~= nil then self.imageCheckBox50:destroy(); self.imageCheckBox50 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.imageCheckBox67 ~= nil then self.imageCheckBox67:destroy(); self.imageCheckBox67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.imageCheckBox45 ~= nil then self.imageCheckBox45:destroy(); self.imageCheckBox45 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.imageCheckBox63 ~= nil then self.imageCheckBox63:destroy(); self.imageCheckBox63 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.imageCheckBox79 ~= nil then self.imageCheckBox79:destroy(); self.imageCheckBox79 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.imageCheckBox78 ~= nil then self.imageCheckBox78:destroy(); self.imageCheckBox78 = nil; end;
        if self.imageCheckBox80 ~= nil then self.imageCheckBox80:destroy(); self.imageCheckBox80 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.imageCheckBox54 ~= nil then self.imageCheckBox54:destroy(); self.imageCheckBox54 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.imageCheckBox81 ~= nil then self.imageCheckBox81:destroy(); self.imageCheckBox81 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.imageCheckBox68 ~= nil then self.imageCheckBox68:destroy(); self.imageCheckBox68 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.imageCheckBox66 ~= nil then self.imageCheckBox66:destroy(); self.imageCheckBox66 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.imageCheckBox82 ~= nil then self.imageCheckBox82:destroy(); self.imageCheckBox82 = nil; end;
        if self.imageCheckBox74 ~= nil then self.imageCheckBox74:destroy(); self.imageCheckBox74 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.imageCheckBox48 ~= nil then self.imageCheckBox48:destroy(); self.imageCheckBox48 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.imageCheckBox35 ~= nil then self.imageCheckBox35:destroy(); self.imageCheckBox35 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.imageCheckBox88 ~= nil then self.imageCheckBox88:destroy(); self.imageCheckBox88 = nil; end;
        if self.imageCheckBox59 ~= nil then self.imageCheckBox59:destroy(); self.imageCheckBox59 = nil; end;
        if self.imageCheckBox90 ~= nil then self.imageCheckBox90:destroy(); self.imageCheckBox90 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.imageCheckBox43 ~= nil then self.imageCheckBox43:destroy(); self.imageCheckBox43 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.imageCheckBox61 ~= nil then self.imageCheckBox61:destroy(); self.imageCheckBox61 = nil; end;
        if self.imageCheckBox75 ~= nil then self.imageCheckBox75:destroy(); self.imageCheckBox75 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.imageCheckBox51 ~= nil then self.imageCheckBox51:destroy(); self.imageCheckBox51 = nil; end;
        if self.imageCheckBox44 ~= nil then self.imageCheckBox44:destroy(); self.imageCheckBox44 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.imageCheckBox55 ~= nil then self.imageCheckBox55:destroy(); self.imageCheckBox55 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.imageCheckBox64 ~= nil then self.imageCheckBox64:destroy(); self.imageCheckBox64 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.imageCheckBox83 ~= nil then self.imageCheckBox83:destroy(); self.imageCheckBox83 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.imageCheckBox60 ~= nil then self.imageCheckBox60:destroy(); self.imageCheckBox60 = nil; end;
        if self.imageCheckBox52 ~= nil then self.imageCheckBox52:destroy(); self.imageCheckBox52 = nil; end;
        if self.imageCheckBox77 ~= nil then self.imageCheckBox77:destroy(); self.imageCheckBox77 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.imageCheckBox62 ~= nil then self.imageCheckBox62:destroy(); self.imageCheckBox62 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox89 ~= nil then self.imageCheckBox89:destroy(); self.imageCheckBox89 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.imageCheckBox69 ~= nil then self.imageCheckBox69:destroy(); self.imageCheckBox69 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.imageCheckBox46 ~= nil then self.imageCheckBox46:destroy(); self.imageCheckBox46 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.imageCheckBox71 ~= nil then self.imageCheckBox71:destroy(); self.imageCheckBox71 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox49 ~= nil then self.imageCheckBox49:destroy(); self.imageCheckBox49 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.imageCheckBox87 ~= nil then self.imageCheckBox87:destroy(); self.imageCheckBox87 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.imageCheckBox70 ~= nil then self.imageCheckBox70:destroy(); self.imageCheckBox70 = nil; end;
        if self.imageCheckBox56 ~= nil then self.imageCheckBox56:destroy(); self.imageCheckBox56 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.imageCheckBox53 ~= nil then self.imageCheckBox53:destroy(); self.imageCheckBox53 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.imageCheckBox57 ~= nil then self.imageCheckBox57:destroy(); self.imageCheckBox57 = nil; end;
        if self.imageCheckBox84 ~= nil then self.imageCheckBox84:destroy(); self.imageCheckBox84 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.imageCheckBox85 ~= nil then self.imageCheckBox85:destroy(); self.imageCheckBox85 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.imageCheckBox47 ~= nil then self.imageCheckBox47:destroy(); self.imageCheckBox47 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.imageCheckBox72 ~= nil then self.imageCheckBox72:destroy(); self.imageCheckBox72 = nil; end;
        if self.imageCheckBox86 ~= nil then self.imageCheckBox86:destroy(); self.imageCheckBox86 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.imageCheckBox40 ~= nil then self.imageCheckBox40:destroy(); self.imageCheckBox40 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmW20_2 = {
    newEditor = newfrmW20_2, 
    new = newfrmW20_2, 
    name = "frmW20_2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmW20_2 = _frmW20_2;
rrpg.registrarForm(_frmW20_2);

return _frmW20_2;
