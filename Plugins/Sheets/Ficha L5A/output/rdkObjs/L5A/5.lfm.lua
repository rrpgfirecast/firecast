require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmL5A5_svg()
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
    obj:setName("frmL5A5_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(918);
    obj.rectangle1:setHeight(1188);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(918);
    obj.image1:setHeight(1188);
    obj.image1:setSRC("/L5A/images/5.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(49);
    obj.layout1:setTop(125);
    obj.layout1:setWidth(26);
    obj.layout1:setHeight(27);
    obj.layout1:setName("layout1");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout1);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(26);
    obj.checkBox1:setHeight(28);
    obj.checkBox1:setField("Check_Box123");
    obj.checkBox1:setName("checkBox1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(49);
    obj.layout2:setTop(169);
    obj.layout2:setWidth(26);
    obj.layout2:setHeight(27);
    obj.layout2:setName("layout2");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout2);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(26);
    obj.checkBox2:setHeight(28);
    obj.checkBox2:setField("Check_Box129");
    obj.checkBox2:setName("checkBox2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(49);
    obj.layout3:setTop(189);
    obj.layout3:setWidth(26);
    obj.layout3:setHeight(27);
    obj.layout3:setName("layout3");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout3);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(26);
    obj.checkBox3:setHeight(28);
    obj.checkBox3:setField("Check_Box132");
    obj.checkBox3:setName("checkBox3");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(49);
    obj.layout4:setTop(212);
    obj.layout4:setWidth(26);
    obj.layout4:setHeight(27);
    obj.layout4:setName("layout4");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout4);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(26);
    obj.checkBox4:setHeight(28);
    obj.checkBox4:setField("Check_Box135");
    obj.checkBox4:setName("checkBox4");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(48);
    obj.layout5:setTop(233);
    obj.layout5:setWidth(26);
    obj.layout5:setHeight(27);
    obj.layout5:setName("layout5");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout5);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(26);
    obj.checkBox5:setHeight(28);
    obj.checkBox5:setField("Check_Box138");
    obj.checkBox5:setName("checkBox5");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(49);
    obj.layout6:setTop(256);
    obj.layout6:setWidth(26);
    obj.layout6:setHeight(27);
    obj.layout6:setName("layout6");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout6);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(26);
    obj.checkBox6:setHeight(28);
    obj.checkBox6:setField("Check_Box141");
    obj.checkBox6:setName("checkBox6");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(49);
    obj.layout7:setTop(277);
    obj.layout7:setWidth(26);
    obj.layout7:setHeight(27);
    obj.layout7:setName("layout7");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout7);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(26);
    obj.checkBox7:setHeight(28);
    obj.checkBox7:setField("Check_Box2");
    obj.checkBox7:setName("checkBox7");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(49);
    obj.layout8:setTop(298);
    obj.layout8:setWidth(26);
    obj.layout8:setHeight(27);
    obj.layout8:setName("layout8");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout8);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(26);
    obj.checkBox8:setHeight(28);
    obj.checkBox8:setField("Check_Box146");
    obj.checkBox8:setName("checkBox8");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(49);
    obj.layout9:setTop(319);
    obj.layout9:setWidth(26);
    obj.layout9:setHeight(27);
    obj.layout9:setName("layout9");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout9);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(26);
    obj.checkBox9:setHeight(28);
    obj.checkBox9:setField("Check_Box149");
    obj.checkBox9:setName("checkBox9");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(49);
    obj.layout10:setTop(341);
    obj.layout10:setWidth(26);
    obj.layout10:setHeight(27);
    obj.layout10:setName("layout10");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout10);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(26);
    obj.checkBox10:setHeight(28);
    obj.checkBox10:setField("Check_Box152");
    obj.checkBox10:setName("checkBox10");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(49);
    obj.layout11:setTop(362);
    obj.layout11:setWidth(26);
    obj.layout11:setHeight(27);
    obj.layout11:setName("layout11");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout11);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setTop(0);
    obj.checkBox11:setWidth(26);
    obj.checkBox11:setHeight(28);
    obj.checkBox11:setField("Check_Box155");
    obj.checkBox11:setName("checkBox11");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(49);
    obj.layout12:setTop(385);
    obj.layout12:setWidth(26);
    obj.layout12:setHeight(27);
    obj.layout12:setName("layout12");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout12);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setTop(0);
    obj.checkBox12:setWidth(26);
    obj.checkBox12:setHeight(28);
    obj.checkBox12:setField("Check_Box158");
    obj.checkBox12:setName("checkBox12");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(48);
    obj.layout13:setTop(408);
    obj.layout13:setWidth(26);
    obj.layout13:setHeight(27);
    obj.layout13:setName("layout13");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout13);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(0);
    obj.checkBox13:setWidth(26);
    obj.checkBox13:setHeight(28);
    obj.checkBox13:setField("Check_Box161");
    obj.checkBox13:setName("checkBox13");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(48);
    obj.layout14:setTop(429);
    obj.layout14:setWidth(26);
    obj.layout14:setHeight(27);
    obj.layout14:setName("layout14");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout14);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setTop(0);
    obj.checkBox14:setWidth(26);
    obj.checkBox14:setHeight(28);
    obj.checkBox14:setField("Check_Box164");
    obj.checkBox14:setName("checkBox14");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(49);
    obj.layout15:setTop(451);
    obj.layout15:setWidth(26);
    obj.layout15:setHeight(27);
    obj.layout15:setName("layout15");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout15);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setTop(0);
    obj.checkBox15:setWidth(26);
    obj.checkBox15:setHeight(28);
    obj.checkBox15:setField("Check_Box167");
    obj.checkBox15:setName("checkBox15");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(48);
    obj.layout16:setTop(471);
    obj.layout16:setWidth(26);
    obj.layout16:setHeight(27);
    obj.layout16:setName("layout16");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout16);
    obj.checkBox16:setLeft(0);
    obj.checkBox16:setTop(0);
    obj.checkBox16:setWidth(26);
    obj.checkBox16:setHeight(28);
    obj.checkBox16:setField("Check_Box170");
    obj.checkBox16:setName("checkBox16");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(48);
    obj.layout17:setTop(493);
    obj.layout17:setWidth(26);
    obj.layout17:setHeight(27);
    obj.layout17:setName("layout17");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout17);
    obj.checkBox17:setLeft(0);
    obj.checkBox17:setTop(0);
    obj.checkBox17:setWidth(26);
    obj.checkBox17:setHeight(28);
    obj.checkBox17:setField("Check_Box173");
    obj.checkBox17:setName("checkBox17");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(48);
    obj.layout18:setTop(515);
    obj.layout18:setWidth(26);
    obj.layout18:setHeight(27);
    obj.layout18:setName("layout18");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout18);
    obj.checkBox18:setLeft(0);
    obj.checkBox18:setTop(0);
    obj.checkBox18:setWidth(26);
    obj.checkBox18:setHeight(28);
    obj.checkBox18:setField("Check_Box176");
    obj.checkBox18:setName("checkBox18");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(48);
    obj.layout19:setTop(537);
    obj.layout19:setWidth(26);
    obj.layout19:setHeight(27);
    obj.layout19:setName("layout19");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout19);
    obj.checkBox19:setLeft(0);
    obj.checkBox19:setTop(0);
    obj.checkBox19:setWidth(26);
    obj.checkBox19:setHeight(28);
    obj.checkBox19:setField("Check_Box179");
    obj.checkBox19:setName("checkBox19");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(48);
    obj.layout20:setTop(559);
    obj.layout20:setWidth(26);
    obj.layout20:setHeight(27);
    obj.layout20:setName("layout20");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout20);
    obj.checkBox20:setLeft(0);
    obj.checkBox20:setTop(0);
    obj.checkBox20:setWidth(26);
    obj.checkBox20:setHeight(28);
    obj.checkBox20:setField("Check_Box182");
    obj.checkBox20:setName("checkBox20");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(48);
    obj.layout21:setTop(581);
    obj.layout21:setWidth(26);
    obj.layout21:setHeight(27);
    obj.layout21:setName("layout21");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout21);
    obj.checkBox21:setLeft(0);
    obj.checkBox21:setTop(0);
    obj.checkBox21:setWidth(26);
    obj.checkBox21:setHeight(28);
    obj.checkBox21:setField("Check_Box185");
    obj.checkBox21:setName("checkBox21");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(48);
    obj.layout22:setTop(602);
    obj.layout22:setWidth(26);
    obj.layout22:setHeight(27);
    obj.layout22:setName("layout22");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout22);
    obj.checkBox22:setLeft(0);
    obj.checkBox22:setTop(0);
    obj.checkBox22:setWidth(26);
    obj.checkBox22:setHeight(28);
    obj.checkBox22:setField("Check_Box188");
    obj.checkBox22:setName("checkBox22");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(48);
    obj.layout23:setTop(623);
    obj.layout23:setWidth(26);
    obj.layout23:setHeight(27);
    obj.layout23:setName("layout23");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout23);
    obj.checkBox23:setLeft(0);
    obj.checkBox23:setTop(0);
    obj.checkBox23:setWidth(26);
    obj.checkBox23:setHeight(28);
    obj.checkBox23:setField("Check_Box191");
    obj.checkBox23:setName("checkBox23");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(48);
    obj.layout24:setTop(645);
    obj.layout24:setWidth(26);
    obj.layout24:setHeight(27);
    obj.layout24:setName("layout24");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout24);
    obj.checkBox24:setLeft(0);
    obj.checkBox24:setTop(0);
    obj.checkBox24:setWidth(26);
    obj.checkBox24:setHeight(28);
    obj.checkBox24:setField("Check_Box194");
    obj.checkBox24:setName("checkBox24");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(48);
    obj.layout25:setTop(667);
    obj.layout25:setWidth(26);
    obj.layout25:setHeight(27);
    obj.layout25:setName("layout25");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout25);
    obj.checkBox25:setLeft(0);
    obj.checkBox25:setTop(0);
    obj.checkBox25:setWidth(26);
    obj.checkBox25:setHeight(28);
    obj.checkBox25:setField("Check_Box197");
    obj.checkBox25:setName("checkBox25");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(47);
    obj.layout26:setTop(689);
    obj.layout26:setWidth(26);
    obj.layout26:setHeight(27);
    obj.layout26:setName("layout26");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout26);
    obj.checkBox26:setLeft(0);
    obj.checkBox26:setTop(0);
    obj.checkBox26:setWidth(26);
    obj.checkBox26:setHeight(28);
    obj.checkBox26:setField("Check_Box200");
    obj.checkBox26:setName("checkBox26");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(47);
    obj.layout27:setTop(711);
    obj.layout27:setWidth(26);
    obj.layout27:setHeight(27);
    obj.layout27:setName("layout27");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout27);
    obj.checkBox27:setLeft(0);
    obj.checkBox27:setTop(0);
    obj.checkBox27:setWidth(26);
    obj.checkBox27:setHeight(28);
    obj.checkBox27:setField("Check_Box203");
    obj.checkBox27:setName("checkBox27");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(47);
    obj.layout28:setTop(733);
    obj.layout28:setWidth(26);
    obj.layout28:setHeight(27);
    obj.layout28:setName("layout28");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout28);
    obj.checkBox28:setLeft(0);
    obj.checkBox28:setTop(0);
    obj.checkBox28:setWidth(26);
    obj.checkBox28:setHeight(28);
    obj.checkBox28:setField("Check_Box206");
    obj.checkBox28:setName("checkBox28");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(47);
    obj.layout29:setTop(755);
    obj.layout29:setWidth(26);
    obj.layout29:setHeight(27);
    obj.layout29:setName("layout29");

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout29);
    obj.checkBox29:setLeft(0);
    obj.checkBox29:setTop(0);
    obj.checkBox29:setWidth(26);
    obj.checkBox29:setHeight(28);
    obj.checkBox29:setField("Check_Box209");
    obj.checkBox29:setName("checkBox29");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(47);
    obj.layout30:setTop(777);
    obj.layout30:setWidth(26);
    obj.layout30:setHeight(27);
    obj.layout30:setName("layout30");

    obj.checkBox30 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout30);
    obj.checkBox30:setLeft(0);
    obj.checkBox30:setTop(0);
    obj.checkBox30:setWidth(26);
    obj.checkBox30:setHeight(28);
    obj.checkBox30:setField("Check_Box212");
    obj.checkBox30:setName("checkBox30");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(327);
    obj.layout31:setTop(124);
    obj.layout31:setWidth(26);
    obj.layout31:setHeight(27);
    obj.layout31:setName("layout31");

    obj.checkBox31 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout31);
    obj.checkBox31:setLeft(0);
    obj.checkBox31:setTop(0);
    obj.checkBox31:setWidth(26);
    obj.checkBox31:setHeight(28);
    obj.checkBox31:setField("Check_Box279");
    obj.checkBox31:setName("checkBox31");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(348);
    obj.layout32:setTop(124);
    obj.layout32:setWidth(26);
    obj.layout32:setHeight(27);
    obj.layout32:setName("layout32");

    obj.checkBox32 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout32);
    obj.checkBox32:setLeft(0);
    obj.checkBox32:setTop(0);
    obj.checkBox32:setWidth(26);
    obj.checkBox32:setHeight(28);
    obj.checkBox32:setField("Check_Box280");
    obj.checkBox32:setName("checkBox32");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(367);
    obj.layout33:setTop(124);
    obj.layout33:setWidth(26);
    obj.layout33:setHeight(27);
    obj.layout33:setName("layout33");

    obj.checkBox33 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout33);
    obj.checkBox33:setLeft(0);
    obj.checkBox33:setTop(0);
    obj.checkBox33:setWidth(26);
    obj.checkBox33:setHeight(28);
    obj.checkBox33:setField("Check_Box281");
    obj.checkBox33:setName("checkBox33");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(327);
    obj.layout34:setTop(147);
    obj.layout34:setWidth(26);
    obj.layout34:setHeight(27);
    obj.layout34:setName("layout34");

    obj.checkBox34 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout34);
    obj.checkBox34:setLeft(0);
    obj.checkBox34:setTop(0);
    obj.checkBox34:setWidth(26);
    obj.checkBox34:setHeight(28);
    obj.checkBox34:setField("Check_Box282");
    obj.checkBox34:setName("checkBox34");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(348);
    obj.layout35:setTop(147);
    obj.layout35:setWidth(26);
    obj.layout35:setHeight(27);
    obj.layout35:setName("layout35");

    obj.checkBox35 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout35);
    obj.checkBox35:setLeft(0);
    obj.checkBox35:setTop(0);
    obj.checkBox35:setWidth(26);
    obj.checkBox35:setHeight(28);
    obj.checkBox35:setField("Check_Box283");
    obj.checkBox35:setName("checkBox35");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(367);
    obj.layout36:setTop(147);
    obj.layout36:setWidth(26);
    obj.layout36:setHeight(27);
    obj.layout36:setName("layout36");

    obj.checkBox36 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout36);
    obj.checkBox36:setLeft(0);
    obj.checkBox36:setTop(0);
    obj.checkBox36:setWidth(26);
    obj.checkBox36:setHeight(28);
    obj.checkBox36:setField("Check_Box284");
    obj.checkBox36:setName("checkBox36");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(346);
    obj.layout37:setTop(167);
    obj.layout37:setWidth(26);
    obj.layout37:setHeight(27);
    obj.layout37:setName("layout37");

    obj.checkBox37 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout37);
    obj.checkBox37:setLeft(0);
    obj.checkBox37:setTop(0);
    obj.checkBox37:setWidth(26);
    obj.checkBox37:setHeight(28);
    obj.checkBox37:setField("Check_Box286");
    obj.checkBox37:setName("checkBox37");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(69);
    obj.layout38:setTop(125);
    obj.layout38:setWidth(26);
    obj.layout38:setHeight(27);
    obj.layout38:setName("layout38");

    obj.checkBox38 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout38);
    obj.checkBox38:setLeft(0);
    obj.checkBox38:setTop(0);
    obj.checkBox38:setWidth(26);
    obj.checkBox38:setHeight(28);
    obj.checkBox38:setField("Check_Box124");
    obj.checkBox38:setName("checkBox38");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(68);
    obj.layout39:setTop(169);
    obj.layout39:setWidth(26);
    obj.layout39:setHeight(27);
    obj.layout39:setName("layout39");

    obj.checkBox39 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout39);
    obj.checkBox39:setLeft(0);
    obj.checkBox39:setTop(0);
    obj.checkBox39:setWidth(26);
    obj.checkBox39:setHeight(28);
    obj.checkBox39:setField("Check_Box130");
    obj.checkBox39:setName("checkBox39");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(68);
    obj.layout40:setTop(189);
    obj.layout40:setWidth(26);
    obj.layout40:setHeight(27);
    obj.layout40:setName("layout40");

    obj.checkBox40 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout40);
    obj.checkBox40:setLeft(0);
    obj.checkBox40:setTop(0);
    obj.checkBox40:setWidth(26);
    obj.checkBox40:setHeight(28);
    obj.checkBox40:setField("Check_Box133");
    obj.checkBox40:setName("checkBox40");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(68);
    obj.layout41:setTop(212);
    obj.layout41:setWidth(26);
    obj.layout41:setHeight(27);
    obj.layout41:setName("layout41");

    obj.checkBox41 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout41);
    obj.checkBox41:setLeft(0);
    obj.checkBox41:setTop(0);
    obj.checkBox41:setWidth(26);
    obj.checkBox41:setHeight(28);
    obj.checkBox41:setField("Check_Box136");
    obj.checkBox41:setName("checkBox41");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(68);
    obj.layout42:setTop(234);
    obj.layout42:setWidth(26);
    obj.layout42:setHeight(27);
    obj.layout42:setName("layout42");

    obj.checkBox42 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout42);
    obj.checkBox42:setLeft(0);
    obj.checkBox42:setTop(0);
    obj.checkBox42:setWidth(26);
    obj.checkBox42:setHeight(28);
    obj.checkBox42:setField("Check_Box139");
    obj.checkBox42:setName("checkBox42");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(70);
    obj.layout43:setTop(255);
    obj.layout43:setWidth(26);
    obj.layout43:setHeight(27);
    obj.layout43:setName("layout43");

    obj.checkBox43 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout43);
    obj.checkBox43:setLeft(0);
    obj.checkBox43:setTop(0);
    obj.checkBox43:setWidth(26);
    obj.checkBox43:setHeight(28);
    obj.checkBox43:setField("Check_Box142");
    obj.checkBox43:setName("checkBox43");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(69);
    obj.layout44:setTop(277);
    obj.layout44:setWidth(26);
    obj.layout44:setHeight(27);
    obj.layout44:setName("layout44");

    obj.checkBox44 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout44);
    obj.checkBox44:setLeft(0);
    obj.checkBox44:setTop(0);
    obj.checkBox44:setWidth(26);
    obj.checkBox44:setHeight(28);
    obj.checkBox44:setField("Check_Box144");
    obj.checkBox44:setName("checkBox44");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(69);
    obj.layout45:setTop(298);
    obj.layout45:setWidth(26);
    obj.layout45:setHeight(27);
    obj.layout45:setName("layout45");

    obj.checkBox45 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout45);
    obj.checkBox45:setLeft(0);
    obj.checkBox45:setTop(0);
    obj.checkBox45:setWidth(26);
    obj.checkBox45:setHeight(28);
    obj.checkBox45:setField("Check_Box147");
    obj.checkBox45:setName("checkBox45");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(69);
    obj.layout46:setTop(319);
    obj.layout46:setWidth(26);
    obj.layout46:setHeight(27);
    obj.layout46:setName("layout46");

    obj.checkBox46 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout46);
    obj.checkBox46:setLeft(0);
    obj.checkBox46:setTop(0);
    obj.checkBox46:setWidth(26);
    obj.checkBox46:setHeight(28);
    obj.checkBox46:setField("Check_Box150");
    obj.checkBox46:setName("checkBox46");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(69);
    obj.layout47:setTop(341);
    obj.layout47:setWidth(26);
    obj.layout47:setHeight(27);
    obj.layout47:setName("layout47");

    obj.checkBox47 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout47);
    obj.checkBox47:setLeft(0);
    obj.checkBox47:setTop(0);
    obj.checkBox47:setWidth(26);
    obj.checkBox47:setHeight(28);
    obj.checkBox47:setField("Check_Box153");
    obj.checkBox47:setName("checkBox47");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(69);
    obj.layout48:setTop(363);
    obj.layout48:setWidth(26);
    obj.layout48:setHeight(27);
    obj.layout48:setName("layout48");

    obj.checkBox48 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout48);
    obj.checkBox48:setLeft(0);
    obj.checkBox48:setTop(0);
    obj.checkBox48:setWidth(26);
    obj.checkBox48:setHeight(28);
    obj.checkBox48:setField("Check_Box156");
    obj.checkBox48:setName("checkBox48");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(70);
    obj.layout49:setTop(384);
    obj.layout49:setWidth(26);
    obj.layout49:setHeight(27);
    obj.layout49:setName("layout49");

    obj.checkBox49 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout49);
    obj.checkBox49:setLeft(0);
    obj.checkBox49:setTop(0);
    obj.checkBox49:setWidth(26);
    obj.checkBox49:setHeight(28);
    obj.checkBox49:setField("Check_Box159");
    obj.checkBox49:setName("checkBox49");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(70);
    obj.layout50:setTop(408);
    obj.layout50:setWidth(26);
    obj.layout50:setHeight(27);
    obj.layout50:setName("layout50");

    obj.checkBox50 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout50);
    obj.checkBox50:setLeft(0);
    obj.checkBox50:setTop(0);
    obj.checkBox50:setWidth(26);
    obj.checkBox50:setHeight(28);
    obj.checkBox50:setField("Check_Box162");
    obj.checkBox50:setName("checkBox50");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(69);
    obj.layout51:setTop(429);
    obj.layout51:setWidth(26);
    obj.layout51:setHeight(27);
    obj.layout51:setName("layout51");

    obj.checkBox51 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout51);
    obj.checkBox51:setLeft(0);
    obj.checkBox51:setTop(0);
    obj.checkBox51:setWidth(26);
    obj.checkBox51:setHeight(28);
    obj.checkBox51:setField("Check_Box165");
    obj.checkBox51:setName("checkBox51");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(69);
    obj.layout52:setTop(450);
    obj.layout52:setWidth(26);
    obj.layout52:setHeight(27);
    obj.layout52:setName("layout52");

    obj.checkBox52 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout52);
    obj.checkBox52:setLeft(0);
    obj.checkBox52:setTop(0);
    obj.checkBox52:setWidth(26);
    obj.checkBox52:setHeight(28);
    obj.checkBox52:setField("Check_Box168");
    obj.checkBox52:setName("checkBox52");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(69);
    obj.layout53:setTop(471);
    obj.layout53:setWidth(26);
    obj.layout53:setHeight(27);
    obj.layout53:setName("layout53");

    obj.checkBox53 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout53);
    obj.checkBox53:setLeft(0);
    obj.checkBox53:setTop(0);
    obj.checkBox53:setWidth(26);
    obj.checkBox53:setHeight(28);
    obj.checkBox53:setField("Check_Box171");
    obj.checkBox53:setName("checkBox53");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(70);
    obj.layout54:setTop(493);
    obj.layout54:setWidth(26);
    obj.layout54:setHeight(27);
    obj.layout54:setName("layout54");

    obj.checkBox54 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout54);
    obj.checkBox54:setLeft(0);
    obj.checkBox54:setTop(0);
    obj.checkBox54:setWidth(26);
    obj.checkBox54:setHeight(28);
    obj.checkBox54:setField("Check_Box174");
    obj.checkBox54:setName("checkBox54");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(69);
    obj.layout55:setTop(515);
    obj.layout55:setWidth(26);
    obj.layout55:setHeight(27);
    obj.layout55:setName("layout55");

    obj.checkBox55 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout55);
    obj.checkBox55:setLeft(0);
    obj.checkBox55:setTop(0);
    obj.checkBox55:setWidth(26);
    obj.checkBox55:setHeight(28);
    obj.checkBox55:setField("Check_Box177");
    obj.checkBox55:setName("checkBox55");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(69);
    obj.layout56:setTop(537);
    obj.layout56:setWidth(26);
    obj.layout56:setHeight(27);
    obj.layout56:setName("layout56");

    obj.checkBox56 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout56);
    obj.checkBox56:setLeft(0);
    obj.checkBox56:setTop(0);
    obj.checkBox56:setWidth(26);
    obj.checkBox56:setHeight(28);
    obj.checkBox56:setField("Check_Box180");
    obj.checkBox56:setName("checkBox56");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(69);
    obj.layout57:setTop(559);
    obj.layout57:setWidth(26);
    obj.layout57:setHeight(27);
    obj.layout57:setName("layout57");

    obj.checkBox57 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout57);
    obj.checkBox57:setLeft(0);
    obj.checkBox57:setTop(0);
    obj.checkBox57:setWidth(26);
    obj.checkBox57:setHeight(28);
    obj.checkBox57:setField("Check_Box183");
    obj.checkBox57:setName("checkBox57");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(69);
    obj.layout58:setTop(582);
    obj.layout58:setWidth(26);
    obj.layout58:setHeight(27);
    obj.layout58:setName("layout58");

    obj.checkBox58 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout58);
    obj.checkBox58:setLeft(0);
    obj.checkBox58:setTop(0);
    obj.checkBox58:setWidth(26);
    obj.checkBox58:setHeight(28);
    obj.checkBox58:setField("Check_Box186");
    obj.checkBox58:setName("checkBox58");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(69);
    obj.layout59:setTop(602);
    obj.layout59:setWidth(26);
    obj.layout59:setHeight(27);
    obj.layout59:setName("layout59");

    obj.checkBox59 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout59);
    obj.checkBox59:setLeft(0);
    obj.checkBox59:setTop(0);
    obj.checkBox59:setWidth(26);
    obj.checkBox59:setHeight(28);
    obj.checkBox59:setField("Check_Box189");
    obj.checkBox59:setName("checkBox59");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(69);
    obj.layout60:setTop(623);
    obj.layout60:setWidth(26);
    obj.layout60:setHeight(27);
    obj.layout60:setName("layout60");

    obj.checkBox60 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout60);
    obj.checkBox60:setLeft(0);
    obj.checkBox60:setTop(0);
    obj.checkBox60:setWidth(26);
    obj.checkBox60:setHeight(28);
    obj.checkBox60:setField("Check_Box192");
    obj.checkBox60:setName("checkBox60");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(68);
    obj.layout61:setTop(645);
    obj.layout61:setWidth(26);
    obj.layout61:setHeight(27);
    obj.layout61:setName("layout61");

    obj.checkBox61 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout61);
    obj.checkBox61:setLeft(0);
    obj.checkBox61:setTop(0);
    obj.checkBox61:setWidth(26);
    obj.checkBox61:setHeight(28);
    obj.checkBox61:setField("Check_Box195");
    obj.checkBox61:setName("checkBox61");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(68);
    obj.layout62:setTop(667);
    obj.layout62:setWidth(26);
    obj.layout62:setHeight(27);
    obj.layout62:setName("layout62");

    obj.checkBox62 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout62);
    obj.checkBox62:setLeft(0);
    obj.checkBox62:setTop(0);
    obj.checkBox62:setWidth(26);
    obj.checkBox62:setHeight(28);
    obj.checkBox62:setField("Check_Box198");
    obj.checkBox62:setName("checkBox62");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(68);
    obj.layout63:setTop(689);
    obj.layout63:setWidth(26);
    obj.layout63:setHeight(27);
    obj.layout63:setName("layout63");

    obj.checkBox63 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout63);
    obj.checkBox63:setLeft(0);
    obj.checkBox63:setTop(0);
    obj.checkBox63:setWidth(26);
    obj.checkBox63:setHeight(28);
    obj.checkBox63:setField("Check_Box201");
    obj.checkBox63:setName("checkBox63");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(67);
    obj.layout64:setTop(711);
    obj.layout64:setWidth(26);
    obj.layout64:setHeight(27);
    obj.layout64:setName("layout64");

    obj.checkBox64 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout64);
    obj.checkBox64:setLeft(0);
    obj.checkBox64:setTop(0);
    obj.checkBox64:setWidth(26);
    obj.checkBox64:setHeight(28);
    obj.checkBox64:setField("Check_Box204");
    obj.checkBox64:setName("checkBox64");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(68);
    obj.layout65:setTop(733);
    obj.layout65:setWidth(26);
    obj.layout65:setHeight(27);
    obj.layout65:setName("layout65");

    obj.checkBox65 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout65);
    obj.checkBox65:setLeft(0);
    obj.checkBox65:setTop(0);
    obj.checkBox65:setWidth(26);
    obj.checkBox65:setHeight(28);
    obj.checkBox65:setField("Check_Box207");
    obj.checkBox65:setName("checkBox65");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(68);
    obj.layout66:setTop(755);
    obj.layout66:setWidth(26);
    obj.layout66:setHeight(27);
    obj.layout66:setName("layout66");

    obj.checkBox66 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout66);
    obj.checkBox66:setLeft(0);
    obj.checkBox66:setTop(0);
    obj.checkBox66:setWidth(26);
    obj.checkBox66:setHeight(28);
    obj.checkBox66:setField("Check_Box210");
    obj.checkBox66:setName("checkBox66");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(68);
    obj.layout67:setTop(776);
    obj.layout67:setWidth(26);
    obj.layout67:setHeight(27);
    obj.layout67:setName("layout67");

    obj.checkBox67 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox67:setParent(obj.layout67);
    obj.checkBox67:setLeft(0);
    obj.checkBox67:setTop(0);
    obj.checkBox67:setWidth(26);
    obj.checkBox67:setHeight(28);
    obj.checkBox67:setField("Check_Box213");
    obj.checkBox67:setName("checkBox67");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(822);
    obj.layout68:setTop(105);
    obj.layout68:setWidth(26);
    obj.layout68:setHeight(27);
    obj.layout68:setName("layout68");

    obj.checkBox68 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox68:setParent(obj.layout68);
    obj.checkBox68:setLeft(0);
    obj.checkBox68:setTop(0);
    obj.checkBox68:setWidth(26);
    obj.checkBox68:setHeight(28);
    obj.checkBox68:setField("Check_Box372");
    obj.checkBox68:setName("checkBox68");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(90);
    obj.layout69:setTop(125);
    obj.layout69:setWidth(26);
    obj.layout69:setHeight(27);
    obj.layout69:setName("layout69");

    obj.checkBox69 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox69:setParent(obj.layout69);
    obj.checkBox69:setLeft(0);
    obj.checkBox69:setTop(0);
    obj.checkBox69:setWidth(26);
    obj.checkBox69:setHeight(28);
    obj.checkBox69:setField("Check_Box125");
    obj.checkBox69:setName("checkBox69");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(661);
    obj.layout70:setTop(107);
    obj.layout70:setWidth(111);
    obj.layout70:setHeight(21);
    obj.layout70:setName("layout70");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout70);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(13.5);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(111);
    obj.edit1:setHeight(22);
    obj.edit1:setField("NOME_31");
    obj.edit1:setName("edit1");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(661);
    obj.layout71:setTop(129);
    obj.layout71:setWidth(55);
    obj.layout71:setHeight(21);
    obj.layout71:setName("layout71");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout71);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(13.5);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(55);
    obj.edit2:setHeight(22);
    obj.edit2:setField("INFLUÊNCIA");
    obj.edit2:setName("edit2");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(773);
    obj.layout72:setTop(129);
    obj.layout72:setWidth(93);
    obj.layout72:setHeight(21);
    obj.layout72:setName("layout72");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout72);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(13.5);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(93);
    obj.edit3:setHeight(22);
    obj.edit3:setField("DEVOÇÃO");
    obj.edit3:setName("edit3");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(49);
    obj.layout73:setTop(149);
    obj.layout73:setWidth(26);
    obj.layout73:setHeight(27);
    obj.layout73:setName("layout73");

    obj.checkBox70 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox70:setParent(obj.layout73);
    obj.checkBox70:setLeft(0);
    obj.checkBox70:setTop(0);
    obj.checkBox70:setWidth(26);
    obj.checkBox70:setHeight(28);
    obj.checkBox70:setField("Check_Box126");
    obj.checkBox70:setName("checkBox70");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(69);
    obj.layout74:setTop(149);
    obj.layout74:setWidth(26);
    obj.layout74:setHeight(27);
    obj.layout74:setName("layout74");

    obj.checkBox71 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox71:setParent(obj.layout74);
    obj.checkBox71:setLeft(0);
    obj.checkBox71:setTop(0);
    obj.checkBox71:setWidth(26);
    obj.checkBox71:setHeight(28);
    obj.checkBox71:setField("Check_Box127");
    obj.checkBox71:setName("checkBox71");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(89);
    obj.layout75:setTop(149);
    obj.layout75:setWidth(26);
    obj.layout75:setHeight(27);
    obj.layout75:setName("layout75");

    obj.checkBox72 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox72:setParent(obj.layout75);
    obj.checkBox72:setLeft(0);
    obj.checkBox72:setTop(0);
    obj.checkBox72:setWidth(26);
    obj.checkBox72:setHeight(28);
    obj.checkBox72:setField("Check_Box128");
    obj.checkBox72:setName("checkBox72");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(89);
    obj.layout76:setTop(169);
    obj.layout76:setWidth(26);
    obj.layout76:setHeight(27);
    obj.layout76:setName("layout76");

    obj.checkBox73 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox73:setParent(obj.layout76);
    obj.checkBox73:setLeft(0);
    obj.checkBox73:setTop(0);
    obj.checkBox73:setWidth(26);
    obj.checkBox73:setHeight(28);
    obj.checkBox73:setField("Check_Box131");
    obj.checkBox73:setName("checkBox73");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(89);
    obj.layout77:setTop(189);
    obj.layout77:setWidth(26);
    obj.layout77:setHeight(27);
    obj.layout77:setName("layout77");

    obj.checkBox74 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox74:setParent(obj.layout77);
    obj.checkBox74:setLeft(0);
    obj.checkBox74:setTop(0);
    obj.checkBox74:setWidth(26);
    obj.checkBox74:setHeight(28);
    obj.checkBox74:setField("Check_Box134");
    obj.checkBox74:setName("checkBox74");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(89);
    obj.layout78:setTop(213);
    obj.layout78:setWidth(26);
    obj.layout78:setHeight(27);
    obj.layout78:setName("layout78");

    obj.checkBox75 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox75:setParent(obj.layout78);
    obj.checkBox75:setLeft(0);
    obj.checkBox75:setTop(0);
    obj.checkBox75:setWidth(26);
    obj.checkBox75:setHeight(28);
    obj.checkBox75:setField("Check_Box137");
    obj.checkBox75:setName("checkBox75");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(89);
    obj.layout79:setTop(233);
    obj.layout79:setWidth(26);
    obj.layout79:setHeight(27);
    obj.layout79:setName("layout79");

    obj.checkBox76 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox76:setParent(obj.layout79);
    obj.checkBox76:setLeft(0);
    obj.checkBox76:setTop(0);
    obj.checkBox76:setWidth(26);
    obj.checkBox76:setHeight(28);
    obj.checkBox76:setField("Check_Box140");
    obj.checkBox76:setName("checkBox76");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(90);
    obj.layout80:setTop(255);
    obj.layout80:setWidth(26);
    obj.layout80:setHeight(27);
    obj.layout80:setName("layout80");

    obj.checkBox77 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox77:setParent(obj.layout80);
    obj.checkBox77:setLeft(0);
    obj.checkBox77:setTop(0);
    obj.checkBox77:setWidth(26);
    obj.checkBox77:setHeight(28);
    obj.checkBox77:setField("Check_Box143");
    obj.checkBox77:setName("checkBox77");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(90);
    obj.layout81:setTop(277);
    obj.layout81:setWidth(26);
    obj.layout81:setHeight(27);
    obj.layout81:setName("layout81");

    obj.checkBox78 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox78:setParent(obj.layout81);
    obj.checkBox78:setLeft(0);
    obj.checkBox78:setTop(0);
    obj.checkBox78:setWidth(26);
    obj.checkBox78:setHeight(28);
    obj.checkBox78:setField("Check_Box145");
    obj.checkBox78:setName("checkBox78");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(90);
    obj.layout82:setTop(298);
    obj.layout82:setWidth(26);
    obj.layout82:setHeight(27);
    obj.layout82:setName("layout82");

    obj.checkBox79 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox79:setParent(obj.layout82);
    obj.checkBox79:setLeft(0);
    obj.checkBox79:setTop(0);
    obj.checkBox79:setWidth(26);
    obj.checkBox79:setHeight(28);
    obj.checkBox79:setField("Check_Box148");
    obj.checkBox79:setName("checkBox79");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(90);
    obj.layout83:setTop(319);
    obj.layout83:setWidth(26);
    obj.layout83:setHeight(27);
    obj.layout83:setName("layout83");

    obj.checkBox80 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox80:setParent(obj.layout83);
    obj.checkBox80:setLeft(0);
    obj.checkBox80:setTop(0);
    obj.checkBox80:setWidth(26);
    obj.checkBox80:setHeight(28);
    obj.checkBox80:setField("Check_Box151");
    obj.checkBox80:setName("checkBox80");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(90);
    obj.layout84:setTop(341);
    obj.layout84:setWidth(26);
    obj.layout84:setHeight(27);
    obj.layout84:setName("layout84");

    obj.checkBox81 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox81:setParent(obj.layout84);
    obj.checkBox81:setLeft(0);
    obj.checkBox81:setTop(0);
    obj.checkBox81:setWidth(26);
    obj.checkBox81:setHeight(28);
    obj.checkBox81:setField("Check_Box154");
    obj.checkBox81:setName("checkBox81");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(91);
    obj.layout85:setTop(363);
    obj.layout85:setWidth(26);
    obj.layout85:setHeight(27);
    obj.layout85:setName("layout85");

    obj.checkBox82 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox82:setParent(obj.layout85);
    obj.checkBox82:setLeft(0);
    obj.checkBox82:setTop(0);
    obj.checkBox82:setWidth(26);
    obj.checkBox82:setHeight(28);
    obj.checkBox82:setField("Check_Box157");
    obj.checkBox82:setName("checkBox82");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(90);
    obj.layout86:setTop(385);
    obj.layout86:setWidth(26);
    obj.layout86:setHeight(27);
    obj.layout86:setName("layout86");

    obj.checkBox83 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox83:setParent(obj.layout86);
    obj.checkBox83:setLeft(0);
    obj.checkBox83:setTop(0);
    obj.checkBox83:setWidth(26);
    obj.checkBox83:setHeight(28);
    obj.checkBox83:setField("Check_Box160");
    obj.checkBox83:setName("checkBox83");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(90);
    obj.layout87:setTop(408);
    obj.layout87:setWidth(26);
    obj.layout87:setHeight(27);
    obj.layout87:setName("layout87");

    obj.checkBox84 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox84:setParent(obj.layout87);
    obj.checkBox84:setLeft(0);
    obj.checkBox84:setTop(0);
    obj.checkBox84:setWidth(26);
    obj.checkBox84:setHeight(28);
    obj.checkBox84:setField("Check_Box163");
    obj.checkBox84:setName("checkBox84");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(90);
    obj.layout88:setTop(429);
    obj.layout88:setWidth(26);
    obj.layout88:setHeight(27);
    obj.layout88:setName("layout88");

    obj.checkBox85 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox85:setParent(obj.layout88);
    obj.checkBox85:setLeft(0);
    obj.checkBox85:setTop(0);
    obj.checkBox85:setWidth(26);
    obj.checkBox85:setHeight(28);
    obj.checkBox85:setField("Check_Box166");
    obj.checkBox85:setName("checkBox85");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(89);
    obj.layout89:setTop(450);
    obj.layout89:setWidth(26);
    obj.layout89:setHeight(27);
    obj.layout89:setName("layout89");

    obj.checkBox86 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox86:setParent(obj.layout89);
    obj.checkBox86:setLeft(0);
    obj.checkBox86:setTop(0);
    obj.checkBox86:setWidth(26);
    obj.checkBox86:setHeight(28);
    obj.checkBox86:setField("Check_Box169");
    obj.checkBox86:setName("checkBox86");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(89);
    obj.layout90:setTop(471);
    obj.layout90:setWidth(26);
    obj.layout90:setHeight(27);
    obj.layout90:setName("layout90");

    obj.checkBox87 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox87:setParent(obj.layout90);
    obj.checkBox87:setLeft(0);
    obj.checkBox87:setTop(0);
    obj.checkBox87:setWidth(26);
    obj.checkBox87:setHeight(28);
    obj.checkBox87:setField("Check_Box172");
    obj.checkBox87:setName("checkBox87");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(89);
    obj.layout91:setTop(493);
    obj.layout91:setWidth(26);
    obj.layout91:setHeight(27);
    obj.layout91:setName("layout91");

    obj.checkBox88 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox88:setParent(obj.layout91);
    obj.checkBox88:setLeft(0);
    obj.checkBox88:setTop(0);
    obj.checkBox88:setWidth(26);
    obj.checkBox88:setHeight(28);
    obj.checkBox88:setField("Check_Box175");
    obj.checkBox88:setName("checkBox88");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(88);
    obj.layout92:setTop(515);
    obj.layout92:setWidth(26);
    obj.layout92:setHeight(27);
    obj.layout92:setName("layout92");

    obj.checkBox89 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox89:setParent(obj.layout92);
    obj.checkBox89:setLeft(0);
    obj.checkBox89:setTop(0);
    obj.checkBox89:setWidth(26);
    obj.checkBox89:setHeight(28);
    obj.checkBox89:setField("Check_Box178");
    obj.checkBox89:setName("checkBox89");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(88);
    obj.layout93:setTop(538);
    obj.layout93:setWidth(26);
    obj.layout93:setHeight(27);
    obj.layout93:setName("layout93");

    obj.checkBox90 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox90:setParent(obj.layout93);
    obj.checkBox90:setLeft(0);
    obj.checkBox90:setTop(0);
    obj.checkBox90:setWidth(26);
    obj.checkBox90:setHeight(28);
    obj.checkBox90:setField("Check_Box181");
    obj.checkBox90:setName("checkBox90");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(90);
    obj.layout94:setTop(559);
    obj.layout94:setWidth(26);
    obj.layout94:setHeight(27);
    obj.layout94:setName("layout94");

    obj.checkBox91 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox91:setParent(obj.layout94);
    obj.checkBox91:setLeft(0);
    obj.checkBox91:setTop(0);
    obj.checkBox91:setWidth(26);
    obj.checkBox91:setHeight(28);
    obj.checkBox91:setField("Check_Box184");
    obj.checkBox91:setName("checkBox91");

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(90);
    obj.layout95:setTop(582);
    obj.layout95:setWidth(26);
    obj.layout95:setHeight(27);
    obj.layout95:setName("layout95");

    obj.checkBox92 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox92:setParent(obj.layout95);
    obj.checkBox92:setLeft(0);
    obj.checkBox92:setTop(0);
    obj.checkBox92:setWidth(26);
    obj.checkBox92:setHeight(28);
    obj.checkBox92:setField("Check_Box187");
    obj.checkBox92:setName("checkBox92");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(90);
    obj.layout96:setTop(602);
    obj.layout96:setWidth(26);
    obj.layout96:setHeight(27);
    obj.layout96:setName("layout96");

    obj.checkBox93 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox93:setParent(obj.layout96);
    obj.checkBox93:setLeft(0);
    obj.checkBox93:setTop(0);
    obj.checkBox93:setWidth(26);
    obj.checkBox93:setHeight(28);
    obj.checkBox93:setField("Check_Box190");
    obj.checkBox93:setName("checkBox93");

    obj.layout97 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(90);
    obj.layout97:setTop(624);
    obj.layout97:setWidth(26);
    obj.layout97:setHeight(27);
    obj.layout97:setName("layout97");

    obj.checkBox94 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox94:setParent(obj.layout97);
    obj.checkBox94:setLeft(0);
    obj.checkBox94:setTop(0);
    obj.checkBox94:setWidth(26);
    obj.checkBox94:setHeight(28);
    obj.checkBox94:setField("Check_Box193");
    obj.checkBox94:setName("checkBox94");

    obj.layout98 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(90);
    obj.layout98:setTop(645);
    obj.layout98:setWidth(26);
    obj.layout98:setHeight(27);
    obj.layout98:setName("layout98");

    obj.checkBox95 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox95:setParent(obj.layout98);
    obj.checkBox95:setLeft(0);
    obj.checkBox95:setTop(0);
    obj.checkBox95:setWidth(26);
    obj.checkBox95:setHeight(28);
    obj.checkBox95:setField("Check_Box196");
    obj.checkBox95:setName("checkBox95");

    obj.layout99 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(89);
    obj.layout99:setTop(667);
    obj.layout99:setWidth(26);
    obj.layout99:setHeight(27);
    obj.layout99:setName("layout99");

    obj.checkBox96 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox96:setParent(obj.layout99);
    obj.checkBox96:setLeft(0);
    obj.checkBox96:setTop(0);
    obj.checkBox96:setWidth(26);
    obj.checkBox96:setHeight(28);
    obj.checkBox96:setField("Check_Box199");
    obj.checkBox96:setName("checkBox96");

    obj.layout100 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(89);
    obj.layout100:setTop(690);
    obj.layout100:setWidth(26);
    obj.layout100:setHeight(27);
    obj.layout100:setName("layout100");

    obj.checkBox97 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox97:setParent(obj.layout100);
    obj.checkBox97:setLeft(0);
    obj.checkBox97:setTop(0);
    obj.checkBox97:setWidth(26);
    obj.checkBox97:setHeight(28);
    obj.checkBox97:setField("Check_Box202");
    obj.checkBox97:setName("checkBox97");

    obj.layout101 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(89);
    obj.layout101:setTop(711);
    obj.layout101:setWidth(26);
    obj.layout101:setHeight(27);
    obj.layout101:setName("layout101");

    obj.checkBox98 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox98:setParent(obj.layout101);
    obj.checkBox98:setLeft(0);
    obj.checkBox98:setTop(0);
    obj.checkBox98:setWidth(26);
    obj.checkBox98:setHeight(28);
    obj.checkBox98:setField("Check_Box205");
    obj.checkBox98:setName("checkBox98");

    obj.layout102 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(89);
    obj.layout102:setTop(733);
    obj.layout102:setWidth(26);
    obj.layout102:setHeight(27);
    obj.layout102:setName("layout102");

    obj.checkBox99 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox99:setParent(obj.layout102);
    obj.checkBox99:setLeft(0);
    obj.checkBox99:setTop(0);
    obj.checkBox99:setWidth(26);
    obj.checkBox99:setHeight(28);
    obj.checkBox99:setField("Check_Box208");
    obj.checkBox99:setName("checkBox99");

    obj.layout103 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(90);
    obj.layout103:setTop(755);
    obj.layout103:setWidth(26);
    obj.layout103:setHeight(27);
    obj.layout103:setName("layout103");

    obj.checkBox100 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox100:setParent(obj.layout103);
    obj.checkBox100:setLeft(0);
    obj.checkBox100:setTop(0);
    obj.checkBox100:setWidth(26);
    obj.checkBox100:setHeight(28);
    obj.checkBox100:setField("Check_Box211");
    obj.checkBox100:setName("checkBox100");

    obj.layout104 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(90);
    obj.layout104:setTop(776);
    obj.layout104:setWidth(26);
    obj.layout104:setHeight(27);
    obj.layout104:setName("layout104");

    obj.checkBox101 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox101:setParent(obj.layout104);
    obj.checkBox101:setLeft(0);
    obj.checkBox101:setTop(0);
    obj.checkBox101:setWidth(26);
    obj.checkBox101:setHeight(28);
    obj.checkBox101:setField("Check_Box214");
    obj.checkBox101:setName("checkBox101");

    obj.layout105 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(843);
    obj.layout105:setTop(104);
    obj.layout105:setWidth(26);
    obj.layout105:setHeight(27);
    obj.layout105:setName("layout105");

    obj.checkBox102 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox102:setParent(obj.layout105);
    obj.checkBox102:setLeft(0);
    obj.checkBox102:setTop(0);
    obj.checkBox102:setWidth(26);
    obj.checkBox102:setHeight(28);
    obj.checkBox102:setField("Check_Box373");
    obj.checkBox102:setName("checkBox102");

    obj.layout106 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(822);
    obj.layout106:setTop(199);
    obj.layout106:setWidth(26);
    obj.layout106:setHeight(27);
    obj.layout106:setName("layout106");

    obj.checkBox103 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox103:setParent(obj.layout106);
    obj.checkBox103:setLeft(0);
    obj.checkBox103:setTop(0);
    obj.checkBox103:setWidth(26);
    obj.checkBox103:setHeight(28);
    obj.checkBox103:setField("Check_Box374");
    obj.checkBox103:setName("checkBox103");

    obj.layout107 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(844);
    obj.layout107:setTop(199);
    obj.layout107:setWidth(26);
    obj.layout107:setHeight(27);
    obj.layout107:setName("layout107");

    obj.checkBox104 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox104:setParent(obj.layout107);
    obj.checkBox104:setLeft(0);
    obj.checkBox104:setTop(0);
    obj.checkBox104:setWidth(26);
    obj.checkBox104:setHeight(28);
    obj.checkBox104:setField("Check_Box375");
    obj.checkBox104:setName("checkBox104");

    obj.layout108 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(822);
    obj.layout108:setTop(294);
    obj.layout108:setWidth(26);
    obj.layout108:setHeight(27);
    obj.layout108:setName("layout108");

    obj.checkBox105 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox105:setParent(obj.layout108);
    obj.checkBox105:setLeft(0);
    obj.checkBox105:setTop(0);
    obj.checkBox105:setWidth(26);
    obj.checkBox105:setHeight(28);
    obj.checkBox105:setField("Check_Box376");
    obj.checkBox105:setName("checkBox105");

    obj.layout109 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(843);
    obj.layout109:setTop(294);
    obj.layout109:setWidth(26);
    obj.layout109:setHeight(27);
    obj.layout109:setName("layout109");

    obj.checkBox106 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox106:setParent(obj.layout109);
    obj.checkBox106:setLeft(0);
    obj.checkBox106:setTop(0);
    obj.checkBox106:setWidth(26);
    obj.checkBox106:setHeight(28);
    obj.checkBox106:setField("Check_Box377");
    obj.checkBox106:setName("checkBox106");

    obj.layout110 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(118);
    obj.layout110:setTop(392);
    obj.layout110:setWidth(193);
    obj.layout110:setHeight(20);
    obj.layout110:setName("layout110");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout110);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(12.8);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(193);
    obj.edit4:setHeight(21);
    obj.edit4:setField("Personagens_Encontrados_12");
    obj.edit4:setName("edit4");

    obj.layout111 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle1);
    obj.layout111:setLeft(822);
    obj.layout111:setTop(387);
    obj.layout111:setWidth(26);
    obj.layout111:setHeight(27);
    obj.layout111:setName("layout111");

    obj.checkBox107 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox107:setParent(obj.layout111);
    obj.checkBox107:setLeft(0);
    obj.checkBox107:setTop(0);
    obj.checkBox107:setWidth(26);
    obj.checkBox107:setHeight(28);
    obj.checkBox107:setField("Check_Box378");
    obj.checkBox107:setName("checkBox107");

    obj.layout112 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle1);
    obj.layout112:setLeft(844);
    obj.layout112:setTop(387);
    obj.layout112:setWidth(26);
    obj.layout112:setHeight(27);
    obj.layout112:setName("layout112");

    obj.checkBox108 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox108:setParent(obj.layout112);
    obj.checkBox108:setLeft(0);
    obj.checkBox108:setTop(0);
    obj.checkBox108:setWidth(26);
    obj.checkBox108:setHeight(28);
    obj.checkBox108:setField("Check_Box379");
    obj.checkBox108:setName("checkBox108");

    obj.layout113 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle1);
    obj.layout113:setLeft(349);
    obj.layout113:setTop(188);
    obj.layout113:setWidth(26);
    obj.layout113:setHeight(27);
    obj.layout113:setName("layout113");

    obj.checkBox109 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox109:setParent(obj.layout113);
    obj.checkBox109:setLeft(0);
    obj.checkBox109:setTop(0);
    obj.checkBox109:setWidth(26);
    obj.checkBox109:setHeight(28);
    obj.checkBox109:setField("Check_Box289");
    obj.checkBox109:setName("checkBox109");

    obj.layout114 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle1);
    obj.layout114:setLeft(348);
    obj.layout114:setTop(211);
    obj.layout114:setWidth(26);
    obj.layout114:setHeight(27);
    obj.layout114:setName("layout114");

    obj.checkBox110 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox110:setParent(obj.layout114);
    obj.checkBox110:setLeft(0);
    obj.checkBox110:setTop(0);
    obj.checkBox110:setWidth(26);
    obj.checkBox110:setHeight(28);
    obj.checkBox110:setField("Check_Box292");
    obj.checkBox110:setName("checkBox110");

    obj.layout115 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setLeft(347);
    obj.layout115:setTop(234);
    obj.layout115:setWidth(26);
    obj.layout115:setHeight(27);
    obj.layout115:setName("layout115");

    obj.checkBox111 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox111:setParent(obj.layout115);
    obj.checkBox111:setLeft(0);
    obj.checkBox111:setTop(0);
    obj.checkBox111:setWidth(26);
    obj.checkBox111:setHeight(28);
    obj.checkBox111:setField("Check_Box295");
    obj.checkBox111:setName("checkBox111");

    obj.layout116 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle1);
    obj.layout116:setLeft(349);
    obj.layout116:setTop(256);
    obj.layout116:setWidth(26);
    obj.layout116:setHeight(27);
    obj.layout116:setName("layout116");

    obj.checkBox112 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox112:setParent(obj.layout116);
    obj.checkBox112:setLeft(0);
    obj.checkBox112:setTop(0);
    obj.checkBox112:setWidth(26);
    obj.checkBox112:setHeight(28);
    obj.checkBox112:setField("Check_Box298");
    obj.checkBox112:setName("checkBox112");

    obj.layout117 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle1);
    obj.layout117:setLeft(347);
    obj.layout117:setTop(278);
    obj.layout117:setWidth(26);
    obj.layout117:setHeight(27);
    obj.layout117:setName("layout117");

    obj.checkBox113 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox113:setParent(obj.layout117);
    obj.checkBox113:setLeft(0);
    obj.checkBox113:setTop(0);
    obj.checkBox113:setWidth(26);
    obj.checkBox113:setHeight(28);
    obj.checkBox113:setField("Check_Box301");
    obj.checkBox113:setName("checkBox113");

    obj.layout118 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle1);
    obj.layout118:setLeft(349);
    obj.layout118:setTop(300);
    obj.layout118:setWidth(26);
    obj.layout118:setHeight(27);
    obj.layout118:setName("layout118");

    obj.checkBox114 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox114:setParent(obj.layout118);
    obj.checkBox114:setLeft(0);
    obj.checkBox114:setTop(0);
    obj.checkBox114:setWidth(26);
    obj.checkBox114:setHeight(28);
    obj.checkBox114:setField("Check_Box304");
    obj.checkBox114:setName("checkBox114");

    obj.layout119 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle1);
    obj.layout119:setLeft(348);
    obj.layout119:setTop(320);
    obj.layout119:setWidth(26);
    obj.layout119:setHeight(27);
    obj.layout119:setName("layout119");

    obj.checkBox115 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox115:setParent(obj.layout119);
    obj.checkBox115:setLeft(0);
    obj.checkBox115:setTop(0);
    obj.checkBox115:setWidth(26);
    obj.checkBox115:setHeight(28);
    obj.checkBox115:setField("Check_Box307");
    obj.checkBox115:setName("checkBox115");

    obj.layout120 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle1);
    obj.layout120:setLeft(348);
    obj.layout120:setTop(342);
    obj.layout120:setWidth(26);
    obj.layout120:setHeight(27);
    obj.layout120:setName("layout120");

    obj.checkBox116 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox116:setParent(obj.layout120);
    obj.checkBox116:setLeft(0);
    obj.checkBox116:setTop(0);
    obj.checkBox116:setWidth(26);
    obj.checkBox116:setHeight(28);
    obj.checkBox116:setField("Check_Box310");
    obj.checkBox116:setName("checkBox116");

    obj.layout121 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle1);
    obj.layout121:setLeft(349);
    obj.layout121:setTop(364);
    obj.layout121:setWidth(26);
    obj.layout121:setHeight(27);
    obj.layout121:setName("layout121");

    obj.checkBox117 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox117:setParent(obj.layout121);
    obj.checkBox117:setLeft(0);
    obj.checkBox117:setTop(0);
    obj.checkBox117:setWidth(26);
    obj.checkBox117:setHeight(28);
    obj.checkBox117:setField("Check_Box313");
    obj.checkBox117:setName("checkBox117");

    obj.layout122 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle1);
    obj.layout122:setLeft(348);
    obj.layout122:setTop(387);
    obj.layout122:setWidth(26);
    obj.layout122:setHeight(27);
    obj.layout122:setName("layout122");

    obj.checkBox118 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox118:setParent(obj.layout122);
    obj.checkBox118:setLeft(0);
    obj.checkBox118:setTop(0);
    obj.checkBox118:setWidth(26);
    obj.checkBox118:setHeight(28);
    obj.checkBox118:setField("Check_Box316");
    obj.checkBox118:setName("checkBox118");

    obj.layout123 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle1);
    obj.layout123:setLeft(348);
    obj.layout123:setTop(409);
    obj.layout123:setWidth(26);
    obj.layout123:setHeight(27);
    obj.layout123:setName("layout123");

    obj.checkBox119 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox119:setParent(obj.layout123);
    obj.checkBox119:setLeft(0);
    obj.checkBox119:setTop(0);
    obj.checkBox119:setWidth(26);
    obj.checkBox119:setHeight(28);
    obj.checkBox119:setField("Check_Box319");
    obj.checkBox119:setName("checkBox119");

    obj.layout124 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle1);
    obj.layout124:setLeft(349);
    obj.layout124:setTop(429);
    obj.layout124:setWidth(26);
    obj.layout124:setHeight(27);
    obj.layout124:setName("layout124");

    obj.checkBox120 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox120:setParent(obj.layout124);
    obj.checkBox120:setLeft(0);
    obj.checkBox120:setTop(0);
    obj.checkBox120:setWidth(26);
    obj.checkBox120:setHeight(28);
    obj.checkBox120:setField("Check_Box322");
    obj.checkBox120:setName("checkBox120");

    obj.layout125 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle1);
    obj.layout125:setLeft(348);
    obj.layout125:setTop(450);
    obj.layout125:setWidth(26);
    obj.layout125:setHeight(27);
    obj.layout125:setName("layout125");

    obj.checkBox121 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox121:setParent(obj.layout125);
    obj.checkBox121:setLeft(0);
    obj.checkBox121:setTop(0);
    obj.checkBox121:setWidth(26);
    obj.checkBox121:setHeight(28);
    obj.checkBox121:setField("Check_Box325");
    obj.checkBox121:setName("checkBox121");

    obj.layout126 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle1);
    obj.layout126:setLeft(347);
    obj.layout126:setTop(472);
    obj.layout126:setWidth(26);
    obj.layout126:setHeight(27);
    obj.layout126:setName("layout126");

    obj.checkBox122 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox122:setParent(obj.layout126);
    obj.checkBox122:setLeft(0);
    obj.checkBox122:setTop(0);
    obj.checkBox122:setWidth(26);
    obj.checkBox122:setHeight(28);
    obj.checkBox122:setField("Check_Box328");
    obj.checkBox122:setName("checkBox122");

    obj.layout127 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle1);
    obj.layout127:setLeft(348);
    obj.layout127:setTop(495);
    obj.layout127:setWidth(26);
    obj.layout127:setHeight(27);
    obj.layout127:setName("layout127");

    obj.checkBox123 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox123:setParent(obj.layout127);
    obj.checkBox123:setLeft(0);
    obj.checkBox123:setTop(0);
    obj.checkBox123:setWidth(26);
    obj.checkBox123:setHeight(28);
    obj.checkBox123:setField("Check_Box331");
    obj.checkBox123:setName("checkBox123");

    obj.layout128 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle1);
    obj.layout128:setLeft(347);
    obj.layout128:setTop(515);
    obj.layout128:setWidth(26);
    obj.layout128:setHeight(27);
    obj.layout128:setName("layout128");

    obj.checkBox124 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox124:setParent(obj.layout128);
    obj.checkBox124:setLeft(0);
    obj.checkBox124:setTop(0);
    obj.checkBox124:setWidth(26);
    obj.checkBox124:setHeight(28);
    obj.checkBox124:setField("Check_Box334");
    obj.checkBox124:setName("checkBox124");

    obj.layout129 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setLeft(346);
    obj.layout129:setTop(536);
    obj.layout129:setWidth(26);
    obj.layout129:setHeight(27);
    obj.layout129:setName("layout129");

    obj.checkBox125 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox125:setParent(obj.layout129);
    obj.checkBox125:setLeft(0);
    obj.checkBox125:setTop(0);
    obj.checkBox125:setWidth(26);
    obj.checkBox125:setHeight(28);
    obj.checkBox125:setField("Check_Box337");
    obj.checkBox125:setName("checkBox125");

    obj.layout130 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setLeft(349);
    obj.layout130:setTop(560);
    obj.layout130:setWidth(26);
    obj.layout130:setHeight(27);
    obj.layout130:setName("layout130");

    obj.checkBox126 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox126:setParent(obj.layout130);
    obj.checkBox126:setLeft(0);
    obj.checkBox126:setTop(0);
    obj.checkBox126:setWidth(26);
    obj.checkBox126:setHeight(28);
    obj.checkBox126:setField("Check_Box340");
    obj.checkBox126:setName("checkBox126");

    obj.layout131 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setLeft(349);
    obj.layout131:setTop(580);
    obj.layout131:setWidth(26);
    obj.layout131:setHeight(27);
    obj.layout131:setName("layout131");

    obj.checkBox127 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox127:setParent(obj.layout131);
    obj.checkBox127:setLeft(0);
    obj.checkBox127:setTop(0);
    obj.checkBox127:setWidth(26);
    obj.checkBox127:setHeight(28);
    obj.checkBox127:setField("Check_Box343");
    obj.checkBox127:setName("checkBox127");

    obj.layout132 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle1);
    obj.layout132:setLeft(347);
    obj.layout132:setTop(601);
    obj.layout132:setWidth(26);
    obj.layout132:setHeight(27);
    obj.layout132:setName("layout132");

    obj.checkBox128 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox128:setParent(obj.layout132);
    obj.checkBox128:setLeft(0);
    obj.checkBox128:setTop(0);
    obj.checkBox128:setWidth(26);
    obj.checkBox128:setHeight(28);
    obj.checkBox128:setField("Check_Box346");
    obj.checkBox128:setName("checkBox128");

    obj.layout133 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle1);
    obj.layout133:setLeft(349);
    obj.layout133:setTop(625);
    obj.layout133:setWidth(26);
    obj.layout133:setHeight(27);
    obj.layout133:setName("layout133");

    obj.checkBox129 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox129:setParent(obj.layout133);
    obj.checkBox129:setLeft(0);
    obj.checkBox129:setTop(0);
    obj.checkBox129:setWidth(26);
    obj.checkBox129:setHeight(28);
    obj.checkBox129:setField("Check_Box349");
    obj.checkBox129:setName("checkBox129");

    obj.layout134 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle1);
    obj.layout134:setLeft(347);
    obj.layout134:setTop(646);
    obj.layout134:setWidth(26);
    obj.layout134:setHeight(27);
    obj.layout134:setName("layout134");

    obj.checkBox130 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox130:setParent(obj.layout134);
    obj.checkBox130:setLeft(0);
    obj.checkBox130:setTop(0);
    obj.checkBox130:setWidth(26);
    obj.checkBox130:setHeight(28);
    obj.checkBox130:setField("Check_Box352");
    obj.checkBox130:setName("checkBox130");

    obj.layout135 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle1);
    obj.layout135:setLeft(349);
    obj.layout135:setTop(668);
    obj.layout135:setWidth(26);
    obj.layout135:setHeight(27);
    obj.layout135:setName("layout135");

    obj.checkBox131 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox131:setParent(obj.layout135);
    obj.checkBox131:setLeft(0);
    obj.checkBox131:setTop(0);
    obj.checkBox131:setWidth(26);
    obj.checkBox131:setHeight(28);
    obj.checkBox131:setField("Check_Box355");
    obj.checkBox131:setName("checkBox131");

    obj.layout136 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle1);
    obj.layout136:setLeft(348);
    obj.layout136:setTop(691);
    obj.layout136:setWidth(26);
    obj.layout136:setHeight(27);
    obj.layout136:setName("layout136");

    obj.checkBox132 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox132:setParent(obj.layout136);
    obj.checkBox132:setLeft(0);
    obj.checkBox132:setTop(0);
    obj.checkBox132:setWidth(26);
    obj.checkBox132:setHeight(28);
    obj.checkBox132:setField("Check_Box358");
    obj.checkBox132:setName("checkBox132");

    obj.layout137 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle1);
    obj.layout137:setLeft(347);
    obj.layout137:setTop(712);
    obj.layout137:setWidth(26);
    obj.layout137:setHeight(27);
    obj.layout137:setName("layout137");

    obj.checkBox133 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox133:setParent(obj.layout137);
    obj.checkBox133:setLeft(0);
    obj.checkBox133:setTop(0);
    obj.checkBox133:setWidth(26);
    obj.checkBox133:setHeight(28);
    obj.checkBox133:setField("Check_Box361");
    obj.checkBox133:setName("checkBox133");

    obj.layout138 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle1);
    obj.layout138:setLeft(349);
    obj.layout138:setTop(734);
    obj.layout138:setWidth(26);
    obj.layout138:setHeight(27);
    obj.layout138:setName("layout138");

    obj.checkBox134 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox134:setParent(obj.layout138);
    obj.checkBox134:setLeft(0);
    obj.checkBox134:setTop(0);
    obj.checkBox134:setWidth(26);
    obj.checkBox134:setHeight(28);
    obj.checkBox134:setField("Check_Box364");
    obj.checkBox134:setName("checkBox134");

    obj.layout139 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle1);
    obj.layout139:setLeft(347);
    obj.layout139:setTop(755);
    obj.layout139:setWidth(26);
    obj.layout139:setHeight(27);
    obj.layout139:setName("layout139");

    obj.checkBox135 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox135:setParent(obj.layout139);
    obj.checkBox135:setLeft(0);
    obj.checkBox135:setTop(0);
    obj.checkBox135:setWidth(26);
    obj.checkBox135:setHeight(28);
    obj.checkBox135:setField("Check_Box367");
    obj.checkBox135:setName("checkBox135");

    obj.layout140 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle1);
    obj.layout140:setLeft(349);
    obj.layout140:setTop(776);
    obj.layout140:setWidth(26);
    obj.layout140:setHeight(27);
    obj.layout140:setName("layout140");

    obj.checkBox136 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox136:setParent(obj.layout140);
    obj.checkBox136:setLeft(0);
    obj.checkBox136:setTop(0);
    obj.checkBox136:setWidth(26);
    obj.checkBox136:setHeight(28);
    obj.checkBox136:setField("Check_Box370");
    obj.checkBox136:setName("checkBox136");

    obj.layout141 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle1);
    obj.layout141:setLeft(367);
    obj.layout141:setTop(189);
    obj.layout141:setWidth(26);
    obj.layout141:setHeight(27);
    obj.layout141:setName("layout141");

    obj.checkBox137 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox137:setParent(obj.layout141);
    obj.checkBox137:setLeft(0);
    obj.checkBox137:setTop(0);
    obj.checkBox137:setWidth(26);
    obj.checkBox137:setHeight(28);
    obj.checkBox137:setField("Check_Box290");
    obj.checkBox137:setName("checkBox137");

    obj.layout142 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle1);
    obj.layout142:setLeft(367);
    obj.layout142:setTop(211);
    obj.layout142:setWidth(26);
    obj.layout142:setHeight(27);
    obj.layout142:setName("layout142");

    obj.checkBox138 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox138:setParent(obj.layout142);
    obj.checkBox138:setLeft(0);
    obj.checkBox138:setTop(0);
    obj.checkBox138:setWidth(26);
    obj.checkBox138:setHeight(28);
    obj.checkBox138:setField("Check_Box293");
    obj.checkBox138:setName("checkBox138");

    obj.layout143 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle1);
    obj.layout143:setLeft(368);
    obj.layout143:setTop(233);
    obj.layout143:setWidth(26);
    obj.layout143:setHeight(27);
    obj.layout143:setName("layout143");

    obj.checkBox139 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox139:setParent(obj.layout143);
    obj.checkBox139:setLeft(0);
    obj.checkBox139:setTop(0);
    obj.checkBox139:setWidth(26);
    obj.checkBox139:setHeight(28);
    obj.checkBox139:setField("Check_Box296");
    obj.checkBox139:setName("checkBox139");

    obj.layout144 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle1);
    obj.layout144:setLeft(367);
    obj.layout144:setTop(256);
    obj.layout144:setWidth(26);
    obj.layout144:setHeight(27);
    obj.layout144:setName("layout144");

    obj.checkBox140 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox140:setParent(obj.layout144);
    obj.checkBox140:setLeft(0);
    obj.checkBox140:setTop(0);
    obj.checkBox140:setWidth(26);
    obj.checkBox140:setHeight(28);
    obj.checkBox140:setField("Check_Box299");
    obj.checkBox140:setName("checkBox140");

    obj.layout145 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle1);
    obj.layout145:setLeft(367);
    obj.layout145:setTop(278);
    obj.layout145:setWidth(26);
    obj.layout145:setHeight(27);
    obj.layout145:setName("layout145");

    obj.checkBox141 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox141:setParent(obj.layout145);
    obj.checkBox141:setLeft(0);
    obj.checkBox141:setTop(0);
    obj.checkBox141:setWidth(26);
    obj.checkBox141:setHeight(28);
    obj.checkBox141:setField("Check_Box302");
    obj.checkBox141:setName("checkBox141");

    obj.layout146 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.rectangle1);
    obj.layout146:setLeft(371);
    obj.layout146:setTop(301);
    obj.layout146:setWidth(26);
    obj.layout146:setHeight(27);
    obj.layout146:setName("layout146");

    obj.checkBox142 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox142:setParent(obj.layout146);
    obj.checkBox142:setLeft(0);
    obj.checkBox142:setTop(0);
    obj.checkBox142:setWidth(26);
    obj.checkBox142:setHeight(28);
    obj.checkBox142:setField("Check_Box305");
    obj.checkBox142:setName("checkBox142");

    obj.layout147 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.rectangle1);
    obj.layout147:setLeft(369);
    obj.layout147:setTop(321);
    obj.layout147:setWidth(26);
    obj.layout147:setHeight(27);
    obj.layout147:setName("layout147");

    obj.checkBox143 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox143:setParent(obj.layout147);
    obj.checkBox143:setLeft(0);
    obj.checkBox143:setTop(0);
    obj.checkBox143:setWidth(26);
    obj.checkBox143:setHeight(28);
    obj.checkBox143:setField("Check_Box308");
    obj.checkBox143:setName("checkBox143");

    obj.layout148 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle1);
    obj.layout148:setLeft(369);
    obj.layout148:setTop(343);
    obj.layout148:setWidth(26);
    obj.layout148:setHeight(27);
    obj.layout148:setName("layout148");

    obj.checkBox144 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox144:setParent(obj.layout148);
    obj.checkBox144:setLeft(0);
    obj.checkBox144:setTop(0);
    obj.checkBox144:setWidth(26);
    obj.checkBox144:setHeight(28);
    obj.checkBox144:setField("Check_Box311");
    obj.checkBox144:setName("checkBox144");

    obj.layout149 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle1);
    obj.layout149:setLeft(369);
    obj.layout149:setTop(363);
    obj.layout149:setWidth(26);
    obj.layout149:setHeight(29);
    obj.layout149:setName("layout149");

    obj.checkBox145 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox145:setParent(obj.layout149);
    obj.checkBox145:setLeft(0);
    obj.checkBox145:setTop(0);
    obj.checkBox145:setWidth(26);
    obj.checkBox145:setHeight(30);
    obj.checkBox145:setField("Check_Box314");
    obj.checkBox145:setName("checkBox145");

    obj.layout150 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle1);
    obj.layout150:setLeft(369);
    obj.layout150:setTop(447);
    obj.layout150:setWidth(26);
    obj.layout150:setHeight(27);
    obj.layout150:setName("layout150");

    obj.checkBox146 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox146:setParent(obj.layout150);
    obj.checkBox146:setLeft(0);
    obj.checkBox146:setTop(0);
    obj.checkBox146:setWidth(26);
    obj.checkBox146:setHeight(28);
    obj.checkBox146:setField("Check_Box326");
    obj.checkBox146:setName("checkBox146");

    obj.layout151 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.rectangle1);
    obj.layout151:setLeft(369);
    obj.layout151:setTop(472);
    obj.layout151:setWidth(26);
    obj.layout151:setHeight(27);
    obj.layout151:setName("layout151");

    obj.checkBox147 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox147:setParent(obj.layout151);
    obj.checkBox147:setLeft(0);
    obj.checkBox147:setTop(0);
    obj.checkBox147:setWidth(26);
    obj.checkBox147:setHeight(28);
    obj.checkBox147:setField("Check_Box329");
    obj.checkBox147:setName("checkBox147");

    obj.layout152 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.rectangle1);
    obj.layout152:setLeft(369);
    obj.layout152:setTop(495);
    obj.layout152:setWidth(26);
    obj.layout152:setHeight(27);
    obj.layout152:setName("layout152");

    obj.checkBox148 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox148:setParent(obj.layout152);
    obj.checkBox148:setLeft(0);
    obj.checkBox148:setTop(0);
    obj.checkBox148:setWidth(26);
    obj.checkBox148:setHeight(28);
    obj.checkBox148:setField("Check_Box332");
    obj.checkBox148:setName("checkBox148");

    obj.layout153 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle1);
    obj.layout153:setLeft(371);
    obj.layout153:setTop(581);
    obj.layout153:setWidth(26);
    obj.layout153:setHeight(27);
    obj.layout153:setName("layout153");

    obj.checkBox149 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox149:setParent(obj.layout153);
    obj.checkBox149:setLeft(0);
    obj.checkBox149:setTop(0);
    obj.checkBox149:setWidth(26);
    obj.checkBox149:setHeight(28);
    obj.checkBox149:setField("Check_Box344");
    obj.checkBox149:setName("checkBox149");

    obj.layout154 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.rectangle1);
    obj.layout154:setLeft(327);
    obj.layout154:setTop(167);
    obj.layout154:setWidth(26);
    obj.layout154:setHeight(27);
    obj.layout154:setName("layout154");

    obj.checkBox150 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox150:setParent(obj.layout154);
    obj.checkBox150:setLeft(0);
    obj.checkBox150:setTop(0);
    obj.checkBox150:setWidth(26);
    obj.checkBox150:setHeight(28);
    obj.checkBox150:setField("Check_Box285");
    obj.checkBox150:setName("checkBox150");

    obj.layout155 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.rectangle1);
    obj.layout155:setLeft(367);
    obj.layout155:setTop(167);
    obj.layout155:setWidth(26);
    obj.layout155:setHeight(27);
    obj.layout155:setName("layout155");

    obj.checkBox151 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox151:setParent(obj.layout155);
    obj.checkBox151:setLeft(0);
    obj.checkBox151:setTop(0);
    obj.checkBox151:setWidth(26);
    obj.checkBox151:setHeight(28);
    obj.checkBox151:setField("Check_Box287");
    obj.checkBox151:setName("checkBox151");

    obj.layout156 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.rectangle1);
    obj.layout156:setLeft(327);
    obj.layout156:setTop(189);
    obj.layout156:setWidth(26);
    obj.layout156:setHeight(27);
    obj.layout156:setName("layout156");

    obj.checkBox152 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox152:setParent(obj.layout156);
    obj.checkBox152:setLeft(0);
    obj.checkBox152:setTop(0);
    obj.checkBox152:setWidth(26);
    obj.checkBox152:setHeight(28);
    obj.checkBox152:setField("Check_Box288");
    obj.checkBox152:setName("checkBox152");

    obj.layout157 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.rectangle1);
    obj.layout157:setLeft(327);
    obj.layout157:setTop(211);
    obj.layout157:setWidth(26);
    obj.layout157:setHeight(27);
    obj.layout157:setName("layout157");

    obj.checkBox153 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox153:setParent(obj.layout157);
    obj.checkBox153:setLeft(0);
    obj.checkBox153:setTop(0);
    obj.checkBox153:setWidth(26);
    obj.checkBox153:setHeight(28);
    obj.checkBox153:setField("Check_Box291");
    obj.checkBox153:setName("checkBox153");

    obj.layout158 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.rectangle1);
    obj.layout158:setLeft(326);
    obj.layout158:setTop(233);
    obj.layout158:setWidth(26);
    obj.layout158:setHeight(27);
    obj.layout158:setName("layout158");

    obj.checkBox154 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox154:setParent(obj.layout158);
    obj.checkBox154:setLeft(0);
    obj.checkBox154:setTop(0);
    obj.checkBox154:setWidth(26);
    obj.checkBox154:setHeight(28);
    obj.checkBox154:setField("Check_Box294");
    obj.checkBox154:setName("checkBox154");

    obj.layout159 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.rectangle1);
    obj.layout159:setLeft(326);
    obj.layout159:setTop(256);
    obj.layout159:setWidth(26);
    obj.layout159:setHeight(27);
    obj.layout159:setName("layout159");

    obj.checkBox155 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox155:setParent(obj.layout159);
    obj.checkBox155:setLeft(0);
    obj.checkBox155:setTop(0);
    obj.checkBox155:setWidth(26);
    obj.checkBox155:setHeight(28);
    obj.checkBox155:setField("Check_Box297");
    obj.checkBox155:setName("checkBox155");

    obj.layout160 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.rectangle1);
    obj.layout160:setLeft(326);
    obj.layout160:setTop(277);
    obj.layout160:setWidth(26);
    obj.layout160:setHeight(27);
    obj.layout160:setName("layout160");

    obj.checkBox156 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox156:setParent(obj.layout160);
    obj.checkBox156:setLeft(0);
    obj.checkBox156:setTop(0);
    obj.checkBox156:setWidth(26);
    obj.checkBox156:setHeight(28);
    obj.checkBox156:setField("Check_Box300");
    obj.checkBox156:setName("checkBox156");

    obj.layout161 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.rectangle1);
    obj.layout161:setLeft(326);
    obj.layout161:setTop(301);
    obj.layout161:setWidth(26);
    obj.layout161:setHeight(27);
    obj.layout161:setName("layout161");

    obj.checkBox157 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox157:setParent(obj.layout161);
    obj.checkBox157:setLeft(0);
    obj.checkBox157:setTop(0);
    obj.checkBox157:setWidth(26);
    obj.checkBox157:setHeight(28);
    obj.checkBox157:setField("Check_Box303");
    obj.checkBox157:setName("checkBox157");

    obj.layout162 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.rectangle1);
    obj.layout162:setLeft(327);
    obj.layout162:setTop(321);
    obj.layout162:setWidth(26);
    obj.layout162:setHeight(27);
    obj.layout162:setName("layout162");

    obj.checkBox158 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox158:setParent(obj.layout162);
    obj.checkBox158:setLeft(0);
    obj.checkBox158:setTop(0);
    obj.checkBox158:setWidth(26);
    obj.checkBox158:setHeight(28);
    obj.checkBox158:setField("Check_Box306");
    obj.checkBox158:setName("checkBox158");

    obj.layout163 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.rectangle1);
    obj.layout163:setLeft(327);
    obj.layout163:setTop(342);
    obj.layout163:setWidth(26);
    obj.layout163:setHeight(27);
    obj.layout163:setName("layout163");

    obj.checkBox159 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox159:setParent(obj.layout163);
    obj.checkBox159:setLeft(0);
    obj.checkBox159:setTop(0);
    obj.checkBox159:setWidth(26);
    obj.checkBox159:setHeight(28);
    obj.checkBox159:setField("Check_Box309");
    obj.checkBox159:setName("checkBox159");

    obj.layout164 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.rectangle1);
    obj.layout164:setLeft(328);
    obj.layout164:setTop(364);
    obj.layout164:setWidth(26);
    obj.layout164:setHeight(27);
    obj.layout164:setName("layout164");

    obj.checkBox160 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox160:setParent(obj.layout164);
    obj.checkBox160:setLeft(0);
    obj.checkBox160:setTop(0);
    obj.checkBox160:setWidth(26);
    obj.checkBox160:setHeight(28);
    obj.checkBox160:setField("Check_Box312");
    obj.checkBox160:setName("checkBox160");

    obj.layout165 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.rectangle1);
    obj.layout165:setLeft(327);
    obj.layout165:setTop(387);
    obj.layout165:setWidth(26);
    obj.layout165:setHeight(27);
    obj.layout165:setName("layout165");

    obj.checkBox161 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox161:setParent(obj.layout165);
    obj.checkBox161:setLeft(0);
    obj.checkBox161:setTop(0);
    obj.checkBox161:setWidth(26);
    obj.checkBox161:setHeight(28);
    obj.checkBox161:setField("Check_Box315");
    obj.checkBox161:setName("checkBox161");

    obj.layout166 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.rectangle1);
    obj.layout166:setLeft(327);
    obj.layout166:setTop(409);
    obj.layout166:setWidth(26);
    obj.layout166:setHeight(27);
    obj.layout166:setName("layout166");

    obj.checkBox162 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox162:setParent(obj.layout166);
    obj.checkBox162:setLeft(0);
    obj.checkBox162:setTop(0);
    obj.checkBox162:setWidth(26);
    obj.checkBox162:setHeight(28);
    obj.checkBox162:setField("Check_Box318");
    obj.checkBox162:setName("checkBox162");

    obj.layout167 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.rectangle1);
    obj.layout167:setLeft(371);
    obj.layout167:setTop(388);
    obj.layout167:setWidth(26);
    obj.layout167:setHeight(27);
    obj.layout167:setName("layout167");

    obj.checkBox163 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox163:setParent(obj.layout167);
    obj.checkBox163:setLeft(0);
    obj.checkBox163:setTop(0);
    obj.checkBox163:setWidth(26);
    obj.checkBox163:setHeight(28);
    obj.checkBox163:setField("Check_Box317");
    obj.checkBox163:setName("checkBox163");

    obj.layout168 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.rectangle1);
    obj.layout168:setLeft(371);
    obj.layout168:setTop(407);
    obj.layout168:setWidth(26);
    obj.layout168:setHeight(27);
    obj.layout168:setName("layout168");

    obj.checkBox164 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox164:setParent(obj.layout168);
    obj.checkBox164:setLeft(0);
    obj.checkBox164:setTop(0);
    obj.checkBox164:setWidth(26);
    obj.checkBox164:setHeight(28);
    obj.checkBox164:setField("Check_Box320");
    obj.checkBox164:setName("checkBox164");

    obj.layout169 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.rectangle1);
    obj.layout169:setLeft(326);
    obj.layout169:setTop(429);
    obj.layout169:setWidth(26);
    obj.layout169:setHeight(27);
    obj.layout169:setName("layout169");

    obj.checkBox165 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox165:setParent(obj.layout169);
    obj.checkBox165:setLeft(0);
    obj.checkBox165:setTop(0);
    obj.checkBox165:setWidth(26);
    obj.checkBox165:setHeight(28);
    obj.checkBox165:setField("Check_Box321");
    obj.checkBox165:setName("checkBox165");

    obj.layout170 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.rectangle1);
    obj.layout170:setLeft(372);
    obj.layout170:setTop(429);
    obj.layout170:setWidth(26);
    obj.layout170:setHeight(27);
    obj.layout170:setName("layout170");

    obj.checkBox166 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox166:setParent(obj.layout170);
    obj.checkBox166:setLeft(0);
    obj.checkBox166:setTop(0);
    obj.checkBox166:setWidth(26);
    obj.checkBox166:setHeight(28);
    obj.checkBox166:setField("Check_Box323");
    obj.checkBox166:setName("checkBox166");

    obj.layout171 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.rectangle1);
    obj.layout171:setLeft(326);
    obj.layout171:setTop(450);
    obj.layout171:setWidth(26);
    obj.layout171:setHeight(27);
    obj.layout171:setName("layout171");

    obj.checkBox167 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox167:setParent(obj.layout171);
    obj.checkBox167:setLeft(0);
    obj.checkBox167:setTop(0);
    obj.checkBox167:setWidth(26);
    obj.checkBox167:setHeight(28);
    obj.checkBox167:setField("Check_Box324");
    obj.checkBox167:setName("checkBox167");

    obj.layout172 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.rectangle1);
    obj.layout172:setLeft(326);
    obj.layout172:setTop(472);
    obj.layout172:setWidth(26);
    obj.layout172:setHeight(27);
    obj.layout172:setName("layout172");

    obj.checkBox168 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox168:setParent(obj.layout172);
    obj.checkBox168:setLeft(0);
    obj.checkBox168:setTop(0);
    obj.checkBox168:setWidth(26);
    obj.checkBox168:setHeight(28);
    obj.checkBox168:setField("Check_Box327");
    obj.checkBox168:setName("checkBox168");

    obj.layout173 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.rectangle1);
    obj.layout173:setLeft(326);
    obj.layout173:setTop(495);
    obj.layout173:setWidth(26);
    obj.layout173:setHeight(27);
    obj.layout173:setName("layout173");

    obj.checkBox169 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox169:setParent(obj.layout173);
    obj.checkBox169:setLeft(0);
    obj.checkBox169:setTop(0);
    obj.checkBox169:setWidth(26);
    obj.checkBox169:setHeight(28);
    obj.checkBox169:setField("Check_Box330");
    obj.checkBox169:setName("checkBox169");

    obj.layout174 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.rectangle1);
    obj.layout174:setLeft(326);
    obj.layout174:setTop(515);
    obj.layout174:setWidth(26);
    obj.layout174:setHeight(27);
    obj.layout174:setName("layout174");

    obj.checkBox170 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox170:setParent(obj.layout174);
    obj.checkBox170:setLeft(0);
    obj.checkBox170:setTop(0);
    obj.checkBox170:setWidth(26);
    obj.checkBox170:setHeight(28);
    obj.checkBox170:setField("Check_Box333");
    obj.checkBox170:setName("checkBox170");

    obj.layout175 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.rectangle1);
    obj.layout175:setLeft(326);
    obj.layout175:setTop(537);
    obj.layout175:setWidth(26);
    obj.layout175:setHeight(27);
    obj.layout175:setName("layout175");

    obj.checkBox171 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox171:setParent(obj.layout175);
    obj.checkBox171:setLeft(0);
    obj.checkBox171:setTop(0);
    obj.checkBox171:setWidth(26);
    obj.checkBox171:setHeight(28);
    obj.checkBox171:setField("Check_Box336");
    obj.checkBox171:setName("checkBox171");

    obj.layout176 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.rectangle1);
    obj.layout176:setLeft(325);
    obj.layout176:setTop(581);
    obj.layout176:setWidth(26);
    obj.layout176:setHeight(27);
    obj.layout176:setName("layout176");

    obj.checkBox172 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox172:setParent(obj.layout176);
    obj.checkBox172:setLeft(0);
    obj.checkBox172:setTop(0);
    obj.checkBox172:setWidth(26);
    obj.checkBox172:setHeight(28);
    obj.checkBox172:setField("Check_Box342");
    obj.checkBox172:setName("checkBox172");

    obj.layout177 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.rectangle1);
    obj.layout177:setLeft(325);
    obj.layout177:setTop(624);
    obj.layout177:setWidth(26);
    obj.layout177:setHeight(27);
    obj.layout177:setName("layout177");

    obj.checkBox173 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox173:setParent(obj.layout177);
    obj.checkBox173:setLeft(0);
    obj.checkBox173:setTop(0);
    obj.checkBox173:setWidth(26);
    obj.checkBox173:setHeight(28);
    obj.checkBox173:setField("Check_Box348");
    obj.checkBox173:setName("checkBox173");

    obj.layout178 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.rectangle1);
    obj.layout178:setLeft(325);
    obj.layout178:setTop(646);
    obj.layout178:setWidth(26);
    obj.layout178:setHeight(27);
    obj.layout178:setName("layout178");

    obj.checkBox174 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox174:setParent(obj.layout178);
    obj.checkBox174:setLeft(0);
    obj.checkBox174:setTop(0);
    obj.checkBox174:setWidth(26);
    obj.checkBox174:setHeight(28);
    obj.checkBox174:setField("Check_Box351");
    obj.checkBox174:setName("checkBox174");

    obj.layout179 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.rectangle1);
    obj.layout179:setLeft(326);
    obj.layout179:setTop(668);
    obj.layout179:setWidth(26);
    obj.layout179:setHeight(27);
    obj.layout179:setName("layout179");

    obj.checkBox175 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox175:setParent(obj.layout179);
    obj.checkBox175:setLeft(0);
    obj.checkBox175:setTop(0);
    obj.checkBox175:setWidth(26);
    obj.checkBox175:setHeight(28);
    obj.checkBox175:setField("Check_Box354");
    obj.checkBox175:setName("checkBox175");

    obj.layout180 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.rectangle1);
    obj.layout180:setLeft(326);
    obj.layout180:setTop(690);
    obj.layout180:setWidth(26);
    obj.layout180:setHeight(27);
    obj.layout180:setName("layout180");

    obj.checkBox176 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox176:setParent(obj.layout180);
    obj.checkBox176:setLeft(0);
    obj.checkBox176:setTop(0);
    obj.checkBox176:setWidth(26);
    obj.checkBox176:setHeight(28);
    obj.checkBox176:setField("Check_Box357");
    obj.checkBox176:setName("checkBox176");

    obj.layout181 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.rectangle1);
    obj.layout181:setLeft(326);
    obj.layout181:setTop(712);
    obj.layout181:setWidth(26);
    obj.layout181:setHeight(27);
    obj.layout181:setName("layout181");

    obj.checkBox177 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox177:setParent(obj.layout181);
    obj.checkBox177:setLeft(0);
    obj.checkBox177:setTop(0);
    obj.checkBox177:setWidth(26);
    obj.checkBox177:setHeight(28);
    obj.checkBox177:setField("Check_Box360");
    obj.checkBox177:setName("checkBox177");

    obj.layout182 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.rectangle1);
    obj.layout182:setLeft(326);
    obj.layout182:setTop(734);
    obj.layout182:setWidth(26);
    obj.layout182:setHeight(27);
    obj.layout182:setName("layout182");

    obj.checkBox178 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox178:setParent(obj.layout182);
    obj.checkBox178:setLeft(0);
    obj.checkBox178:setTop(0);
    obj.checkBox178:setWidth(26);
    obj.checkBox178:setHeight(28);
    obj.checkBox178:setField("Check_Box363");
    obj.checkBox178:setName("checkBox178");

    obj.layout183 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.rectangle1);
    obj.layout183:setLeft(326);
    obj.layout183:setTop(755);
    obj.layout183:setWidth(26);
    obj.layout183:setHeight(27);
    obj.layout183:setName("layout183");

    obj.checkBox179 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox179:setParent(obj.layout183);
    obj.checkBox179:setLeft(0);
    obj.checkBox179:setTop(0);
    obj.checkBox179:setWidth(26);
    obj.checkBox179:setHeight(28);
    obj.checkBox179:setField("Check_Box366");
    obj.checkBox179:setName("checkBox179");

    obj.layout184 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.rectangle1);
    obj.layout184:setLeft(326);
    obj.layout184:setTop(777);
    obj.layout184:setWidth(26);
    obj.layout184:setHeight(27);
    obj.layout184:setName("layout184");

    obj.checkBox180 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox180:setParent(obj.layout184);
    obj.checkBox180:setLeft(0);
    obj.checkBox180:setTop(0);
    obj.checkBox180:setWidth(26);
    obj.checkBox180:setHeight(28);
    obj.checkBox180:setField("Check_Box369");
    obj.checkBox180:setName("checkBox180");

    obj.layout185 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.rectangle1);
    obj.layout185:setLeft(824);
    obj.layout185:setTop(483);
    obj.layout185:setWidth(26);
    obj.layout185:setHeight(27);
    obj.layout185:setName("layout185");

    obj.checkBox181 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox181:setParent(obj.layout185);
    obj.checkBox181:setLeft(0);
    obj.checkBox181:setTop(0);
    obj.checkBox181:setWidth(26);
    obj.checkBox181:setHeight(28);
    obj.checkBox181:setField("Check_Box380");
    obj.checkBox181:setName("checkBox181");

    obj.layout186 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.rectangle1);
    obj.layout186:setLeft(843);
    obj.layout186:setTop(482);
    obj.layout186:setWidth(26);
    obj.layout186:setHeight(27);
    obj.layout186:setName("layout186");

    obj.checkBox182 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox182:setParent(obj.layout186);
    obj.checkBox182:setLeft(0);
    obj.checkBox182:setTop(0);
    obj.checkBox182:setWidth(26);
    obj.checkBox182:setHeight(28);
    obj.checkBox182:setField("Check_Box381");
    obj.checkBox182:setName("checkBox182");

    obj.layout187 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.rectangle1);
    obj.layout187:setLeft(822);
    obj.layout187:setTop(577);
    obj.layout187:setWidth(26);
    obj.layout187:setHeight(27);
    obj.layout187:setName("layout187");

    obj.checkBox183 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox183:setParent(obj.layout187);
    obj.checkBox183:setLeft(0);
    obj.checkBox183:setTop(0);
    obj.checkBox183:setWidth(26);
    obj.checkBox183:setHeight(28);
    obj.checkBox183:setField("Check_Box382");
    obj.checkBox183:setName("checkBox183");

    obj.layout188 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.rectangle1);
    obj.layout188:setLeft(843);
    obj.layout188:setTop(577);
    obj.layout188:setWidth(26);
    obj.layout188:setHeight(27);
    obj.layout188:setName("layout188");

    obj.checkBox184 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox184:setParent(obj.layout188);
    obj.checkBox184:setLeft(0);
    obj.checkBox184:setTop(0);
    obj.checkBox184:setWidth(26);
    obj.checkBox184:setHeight(28);
    obj.checkBox184:setField("Check_Box383");
    obj.checkBox184:setName("checkBox184");

    obj.layout189 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.rectangle1);
    obj.layout189:setLeft(368);
    obj.layout189:setTop(515);
    obj.layout189:setWidth(26);
    obj.layout189:setHeight(27);
    obj.layout189:setName("layout189");

    obj.checkBox185 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox185:setParent(obj.layout189);
    obj.checkBox185:setLeft(0);
    obj.checkBox185:setTop(0);
    obj.checkBox185:setWidth(26);
    obj.checkBox185:setHeight(28);
    obj.checkBox185:setField("Check_Box335");
    obj.checkBox185:setName("checkBox185");

    obj.layout190 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.rectangle1);
    obj.layout190:setLeft(369);
    obj.layout190:setTop(538);
    obj.layout190:setWidth(26);
    obj.layout190:setHeight(27);
    obj.layout190:setName("layout190");

    obj.checkBox186 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox186:setParent(obj.layout190);
    obj.checkBox186:setLeft(0);
    obj.checkBox186:setTop(0);
    obj.checkBox186:setWidth(26);
    obj.checkBox186:setHeight(28);
    obj.checkBox186:setField("Check_Box338");
    obj.checkBox186:setName("checkBox186");

    obj.layout191 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.rectangle1);
    obj.layout191:setLeft(326);
    obj.layout191:setTop(560);
    obj.layout191:setWidth(26);
    obj.layout191:setHeight(27);
    obj.layout191:setName("layout191");

    obj.checkBox187 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox187:setParent(obj.layout191);
    obj.checkBox187:setLeft(0);
    obj.checkBox187:setTop(0);
    obj.checkBox187:setWidth(26);
    obj.checkBox187:setHeight(28);
    obj.checkBox187:setField("Check_Box339");
    obj.checkBox187:setName("checkBox187");

    obj.layout192 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.rectangle1);
    obj.layout192:setLeft(369);
    obj.layout192:setTop(560);
    obj.layout192:setWidth(26);
    obj.layout192:setHeight(27);
    obj.layout192:setName("layout192");

    obj.checkBox188 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox188:setParent(obj.layout192);
    obj.checkBox188:setLeft(0);
    obj.checkBox188:setTop(0);
    obj.checkBox188:setWidth(26);
    obj.checkBox188:setHeight(28);
    obj.checkBox188:setField("Check_Box341");
    obj.checkBox188:setName("checkBox188");

    obj.layout193 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.rectangle1);
    obj.layout193:setLeft(325);
    obj.layout193:setTop(601);
    obj.layout193:setWidth(26);
    obj.layout193:setHeight(27);
    obj.layout193:setName("layout193");

    obj.checkBox189 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox189:setParent(obj.layout193);
    obj.checkBox189:setLeft(0);
    obj.checkBox189:setTop(0);
    obj.checkBox189:setWidth(26);
    obj.checkBox189:setHeight(28);
    obj.checkBox189:setField("Check_Box345");
    obj.checkBox189:setName("checkBox189");

    obj.layout194 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.rectangle1);
    obj.layout194:setLeft(368);
    obj.layout194:setTop(603);
    obj.layout194:setWidth(26);
    obj.layout194:setHeight(27);
    obj.layout194:setName("layout194");

    obj.checkBox190 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox190:setParent(obj.layout194);
    obj.checkBox190:setLeft(0);
    obj.checkBox190:setTop(0);
    obj.checkBox190:setWidth(26);
    obj.checkBox190:setHeight(28);
    obj.checkBox190:setField("Check_Box347");
    obj.checkBox190:setName("checkBox190");

    obj.layout195 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.rectangle1);
    obj.layout195:setLeft(371);
    obj.layout195:setTop(625);
    obj.layout195:setWidth(26);
    obj.layout195:setHeight(27);
    obj.layout195:setName("layout195");

    obj.checkBox191 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox191:setParent(obj.layout195);
    obj.checkBox191:setLeft(0);
    obj.checkBox191:setTop(0);
    obj.checkBox191:setWidth(26);
    obj.checkBox191:setHeight(28);
    obj.checkBox191:setField("Check_Box350");
    obj.checkBox191:setName("checkBox191");

    obj.layout196 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.rectangle1);
    obj.layout196:setLeft(371);
    obj.layout196:setTop(646);
    obj.layout196:setWidth(26);
    obj.layout196:setHeight(27);
    obj.layout196:setName("layout196");

    obj.checkBox192 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox192:setParent(obj.layout196);
    obj.checkBox192:setLeft(0);
    obj.checkBox192:setTop(0);
    obj.checkBox192:setWidth(26);
    obj.checkBox192:setHeight(28);
    obj.checkBox192:setField("Check_Box353");
    obj.checkBox192:setName("checkBox192");

    obj.layout197 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.rectangle1);
    obj.layout197:setLeft(368);
    obj.layout197:setTop(757);
    obj.layout197:setWidth(26);
    obj.layout197:setHeight(27);
    obj.layout197:setName("layout197");

    obj.checkBox193 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox193:setParent(obj.layout197);
    obj.checkBox193:setLeft(0);
    obj.checkBox193:setTop(0);
    obj.checkBox193:setWidth(26);
    obj.checkBox193:setHeight(28);
    obj.checkBox193:setField("Check_Box368");
    obj.checkBox193:setName("checkBox193");

    obj.layout198 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.rectangle1);
    obj.layout198:setLeft(393);
    obj.layout198:setTop(130);
    obj.layout198:setWidth(193);
    obj.layout198:setHeight(20);
    obj.layout198:setName("layout198");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout198);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(12.8);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(193);
    obj.edit5:setHeight(21);
    obj.edit5:setField("Personagens_Encontrados_31");
    obj.edit5:setName("edit5");

    obj.layout199 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.rectangle1);
    obj.layout199:setLeft(393);
    obj.layout199:setTop(151);
    obj.layout199:setWidth(193);
    obj.layout199:setHeight(20);
    obj.layout199:setName("layout199");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout199);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(12.8);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(193);
    obj.edit6:setHeight(21);
    obj.edit6:setField("Personagens_Encontrados_32");
    obj.edit6:setName("edit6");

    obj.layout200 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.rectangle1);
    obj.layout200:setLeft(393);
    obj.layout200:setTop(174);
    obj.layout200:setWidth(193);
    obj.layout200:setHeight(20);
    obj.layout200:setName("layout200");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout200);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(12.8);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(193);
    obj.edit7:setHeight(21);
    obj.edit7:setField("Personagens_Encontrados_33");
    obj.edit7:setName("edit7");

    obj.layout201 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.rectangle1);
    obj.layout201:setLeft(393);
    obj.layout201:setTop(196);
    obj.layout201:setWidth(193);
    obj.layout201:setHeight(20);
    obj.layout201:setName("layout201");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout201);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(12.8);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(193);
    obj.edit8:setHeight(21);
    obj.edit8:setField("Personagens_Encontrados_34");
    obj.edit8:setName("edit8");

    obj.layout202 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.rectangle1);
    obj.layout202:setLeft(393);
    obj.layout202:setTop(217);
    obj.layout202:setWidth(193);
    obj.layout202:setHeight(20);
    obj.layout202:setName("layout202");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout202);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(12.8);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(193);
    obj.edit9:setHeight(21);
    obj.edit9:setField("Personagens_Encontrados_35");
    obj.edit9:setName("edit9");

    obj.layout203 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.rectangle1);
    obj.layout203:setLeft(661);
    obj.layout203:setTop(163);
    obj.layout203:setWidth(205);
    obj.layout203:setHeight(38);
    obj.layout203:setName("layout203");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout203);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(205);
    obj.textEditor1:setHeight(38);
    obj.textEditor1:setFontSize(14.2);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("NOTAS_5");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout204 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.rectangle1);
    obj.layout204:setLeft(116);
    obj.layout204:setTop(196);
    obj.layout204:setWidth(193);
    obj.layout204:setHeight(20);
    obj.layout204:setName("layout204");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout204);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(12.8);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(193);
    obj.edit10:setHeight(21);
    obj.edit10:setField("Personagens_Encontrados_3");
    obj.edit10:setName("edit10");

    obj.layout205 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.rectangle1);
    obj.layout205:setLeft(116);
    obj.layout205:setTop(239);
    obj.layout205:setWidth(193);
    obj.layout205:setHeight(20);
    obj.layout205:setName("layout205");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout205);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(12.8);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(193);
    obj.edit11:setHeight(21);
    obj.edit11:setField("Personagens_Encontrados_5");
    obj.edit11:setName("edit11");

    obj.layout206 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.rectangle1);
    obj.layout206:setLeft(393);
    obj.layout206:setTop(240);
    obj.layout206:setWidth(193);
    obj.layout206:setHeight(20);
    obj.layout206:setName("layout206");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout206);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(12.8);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(193);
    obj.edit12:setHeight(21);
    obj.edit12:setField("Personagens_Encontrados_36");
    obj.edit12:setName("edit12");

    obj.layout207 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.rectangle1);
    obj.layout207:setLeft(116);
    obj.layout207:setTop(261);
    obj.layout207:setWidth(193);
    obj.layout207:setHeight(20);
    obj.layout207:setName("layout207");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout207);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(12.8);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(193);
    obj.edit13:setHeight(21);
    obj.edit13:setField("Personagens_Encontrados_6");
    obj.edit13:setName("edit13");

    obj.layout208 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.rectangle1);
    obj.layout208:setLeft(393);
    obj.layout208:setTop(262);
    obj.layout208:setWidth(193);
    obj.layout208:setHeight(20);
    obj.layout208:setName("layout208");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout208);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(12.8);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(193);
    obj.edit14:setHeight(21);
    obj.edit14:setField("Personagens_Encontrados_37");
    obj.edit14:setName("edit14");

    obj.layout209 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.rectangle1);
    obj.layout209:setLeft(116);
    obj.layout209:setTop(283);
    obj.layout209:setWidth(193);
    obj.layout209:setHeight(20);
    obj.layout209:setName("layout209");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout209);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(12.8);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(193);
    obj.edit15:setHeight(21);
    obj.edit15:setField("Personagens_Encontrados_7");
    obj.edit15:setName("edit15");

    obj.layout210 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.rectangle1);
    obj.layout210:setLeft(393);
    obj.layout210:setTop(283);
    obj.layout210:setWidth(193);
    obj.layout210:setHeight(20);
    obj.layout210:setName("layout210");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout210);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(12.8);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(193);
    obj.edit16:setHeight(21);
    obj.edit16:setField("Personagens_Encontrados_38");
    obj.edit16:setName("edit16");

    obj.layout211 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.rectangle1);
    obj.layout211:setLeft(393);
    obj.layout211:setTop(304);
    obj.layout211:setWidth(193);
    obj.layout211:setHeight(20);
    obj.layout211:setName("layout211");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout211);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(12.8);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(193);
    obj.edit17:setHeight(21);
    obj.edit17:setField("Personagens_Encontrados_39");
    obj.edit17:setName("edit17");

    obj.layout212 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.rectangle1);
    obj.layout212:setLeft(393);
    obj.layout212:setTop(326);
    obj.layout212:setWidth(193);
    obj.layout212:setHeight(20);
    obj.layout212:setName("layout212");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout212);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(12.8);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(193);
    obj.edit18:setHeight(21);
    obj.edit18:setField("Personagens_Encontrados_40");
    obj.edit18:setName("edit18");

    obj.layout213 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.rectangle1);
    obj.layout213:setLeft(393);
    obj.layout213:setTop(348);
    obj.layout213:setWidth(193);
    obj.layout213:setHeight(20);
    obj.layout213:setName("layout213");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout213);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(12.8);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(193);
    obj.edit19:setHeight(21);
    obj.edit19:setField("Personagens_Encontrados_41");
    obj.edit19:setName("edit19");

    obj.layout214 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.rectangle1);
    obj.layout214:setLeft(393);
    obj.layout214:setTop(369);
    obj.layout214:setWidth(193);
    obj.layout214:setHeight(20);
    obj.layout214:setName("layout214");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout214);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(12.8);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(193);
    obj.edit20:setHeight(21);
    obj.edit20:setField("Personagens_Encontrados_42");
    obj.edit20:setName("edit20");

    obj.layout215 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.rectangle1);
    obj.layout215:setLeft(393);
    obj.layout215:setTop(391);
    obj.layout215:setWidth(193);
    obj.layout215:setHeight(20);
    obj.layout215:setName("layout215");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout215);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(12.8);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(193);
    obj.edit21:setHeight(21);
    obj.edit21:setField("Personagens_Encontrados_43");
    obj.edit21:setName("edit21");

    obj.layout216 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.rectangle1);
    obj.layout216:setLeft(393);
    obj.layout216:setTop(413);
    obj.layout216:setWidth(193);
    obj.layout216:setHeight(20);
    obj.layout216:setName("layout216");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout216);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(12.8);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(193);
    obj.edit22:setHeight(21);
    obj.edit22:setField("Personagens_Encontrados_44");
    obj.edit22:setName("edit22");

    obj.layout217 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.rectangle1);
    obj.layout217:setLeft(393);
    obj.layout217:setTop(434);
    obj.layout217:setWidth(193);
    obj.layout217:setHeight(20);
    obj.layout217:setName("layout217");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout217);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(12.8);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(193);
    obj.edit23:setHeight(21);
    obj.edit23:setField("Personagens_Encontrados_45");
    obj.edit23:setName("edit23");

    obj.layout218 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.rectangle1);
    obj.layout218:setLeft(392);
    obj.layout218:setTop(457);
    obj.layout218:setWidth(193);
    obj.layout218:setHeight(20);
    obj.layout218:setName("layout218");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout218);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(12.8);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(193);
    obj.edit24:setHeight(21);
    obj.edit24:setField("Personagens_Encontrados_46");
    obj.edit24:setName("edit24");

    obj.layout219 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.rectangle1);
    obj.layout219:setLeft(393);
    obj.layout219:setTop(478);
    obj.layout219:setWidth(193);
    obj.layout219:setHeight(20);
    obj.layout219:setName("layout219");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout219);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(12.8);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(193);
    obj.edit25:setHeight(21);
    obj.edit25:setField("Personagens_Encontrados_47");
    obj.edit25:setName("edit25");

    obj.layout220 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.rectangle1);
    obj.layout220:setLeft(393);
    obj.layout220:setTop(500);
    obj.layout220:setWidth(193);
    obj.layout220:setHeight(20);
    obj.layout220:setName("layout220");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout220);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(12.8);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(193);
    obj.edit26:setHeight(21);
    obj.edit26:setField("Personagens_Encontrados_48");
    obj.edit26:setName("edit26");

    obj.layout221 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.rectangle1);
    obj.layout221:setLeft(393);
    obj.layout221:setTop(522);
    obj.layout221:setWidth(193);
    obj.layout221:setHeight(20);
    obj.layout221:setName("layout221");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout221);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(12.8);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(193);
    obj.edit27:setHeight(21);
    obj.edit27:setField("Personagens_Encontrados_49");
    obj.edit27:setName("edit27");

    obj.layout222 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.rectangle1);
    obj.layout222:setLeft(393);
    obj.layout222:setTop(544);
    obj.layout222:setWidth(193);
    obj.layout222:setHeight(20);
    obj.layout222:setName("layout222");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout222);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(12.8);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(193);
    obj.edit28:setHeight(21);
    obj.edit28:setField("Personagens_Encontrados_50");
    obj.edit28:setName("edit28");

    obj.layout223 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout223:setParent(obj.rectangle1);
    obj.layout223:setLeft(394);
    obj.layout223:setTop(565);
    obj.layout223:setWidth(193);
    obj.layout223:setHeight(20);
    obj.layout223:setName("layout223");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout223);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(12.8);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(193);
    obj.edit29:setHeight(21);
    obj.edit29:setField("Personagens_Encontrados_51");
    obj.edit29:setName("edit29");

    obj.layout224 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout224:setParent(obj.rectangle1);
    obj.layout224:setLeft(393);
    obj.layout224:setTop(587);
    obj.layout224:setWidth(193);
    obj.layout224:setHeight(20);
    obj.layout224:setName("layout224");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout224);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(12.8);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(193);
    obj.edit30:setHeight(21);
    obj.edit30:setField("Personagens_Encontrados_52");
    obj.edit30:setName("edit30");

    obj.layout225 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout225:setParent(obj.rectangle1);
    obj.layout225:setLeft(393);
    obj.layout225:setTop(610);
    obj.layout225:setWidth(193);
    obj.layout225:setHeight(20);
    obj.layout225:setName("layout225");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout225);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(12.8);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(193);
    obj.edit31:setHeight(21);
    obj.edit31:setField("Personagens_Encontrados_53");
    obj.edit31:setName("edit31");

    obj.layout226 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout226:setParent(obj.rectangle1);
    obj.layout226:setLeft(393);
    obj.layout226:setTop(631);
    obj.layout226:setWidth(193);
    obj.layout226:setHeight(20);
    obj.layout226:setName("layout226");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout226);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(12.8);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(193);
    obj.edit32:setHeight(21);
    obj.edit32:setField("Personagens_Encontrados_54");
    obj.edit32:setName("edit32");

    obj.layout227 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout227:setParent(obj.rectangle1);
    obj.layout227:setLeft(661);
    obj.layout227:setTop(201);
    obj.layout227:setWidth(110);
    obj.layout227:setHeight(21);
    obj.layout227:setName("layout227");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout227);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(13.5);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(110);
    obj.edit33:setHeight(22);
    obj.edit33:setField("NOME_32");
    obj.edit33:setName("edit33");

    obj.layout228 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout228:setParent(obj.rectangle1);
    obj.layout228:setLeft(661);
    obj.layout228:setTop(223);
    obj.layout228:setWidth(55);
    obj.layout228:setHeight(21);
    obj.layout228:setName("layout228");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout228);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(13.5);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(55);
    obj.edit34:setHeight(22);
    obj.edit34:setField("INFLUÊNCIA_2");
    obj.edit34:setName("edit34");

    obj.layout229 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout229:setParent(obj.rectangle1);
    obj.layout229:setLeft(773);
    obj.layout229:setTop(224);
    obj.layout229:setWidth(94);
    obj.layout229:setHeight(21);
    obj.layout229:setName("layout229");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout229);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(13.5);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(94);
    obj.edit35:setHeight(22);
    obj.edit35:setField("DEVOÇÃO_2");
    obj.edit35:setName("edit35");

    obj.layout230 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout230:setParent(obj.rectangle1);
    obj.layout230:setLeft(661);
    obj.layout230:setTop(257);
    obj.layout230:setWidth(205);
    obj.layout230:setHeight(38);
    obj.layout230:setName("layout230");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout230);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(205);
    obj.textEditor2:setHeight(38);
    obj.textEditor2:setFontSize(14.2);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("NOTAS_6");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout231 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout231:setParent(obj.rectangle1);
    obj.layout231:setLeft(661);
    obj.layout231:setTop(296);
    obj.layout231:setWidth(111);
    obj.layout231:setHeight(21);
    obj.layout231:setName("layout231");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout231);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(13.5);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("leading");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(111);
    obj.edit36:setHeight(22);
    obj.edit36:setField("NOME_33");
    obj.edit36:setName("edit36");

    obj.layout232 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout232:setParent(obj.rectangle1);
    obj.layout232:setLeft(661);
    obj.layout232:setTop(318);
    obj.layout232:setWidth(55);
    obj.layout232:setHeight(21);
    obj.layout232:setName("layout232");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout232);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(13.5);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("leading");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(55);
    obj.edit37:setHeight(22);
    obj.edit37:setField("INFLUÊNCIA_3");
    obj.edit37:setName("edit37");

    obj.layout233 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout233:setParent(obj.rectangle1);
    obj.layout233:setLeft(773);
    obj.layout233:setTop(318);
    obj.layout233:setWidth(93);
    obj.layout233:setHeight(21);
    obj.layout233:setName("layout233");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout233);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(13.5);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("leading");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(93);
    obj.edit38:setHeight(22);
    obj.edit38:setField("DEVOÇÃO_3");
    obj.edit38:setName("edit38");

    obj.layout234 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout234:setParent(obj.rectangle1);
    obj.layout234:setLeft(661);
    obj.layout234:setTop(352);
    obj.layout234:setWidth(205);
    obj.layout234:setHeight(38);
    obj.layout234:setName("layout234");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout234);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(205);
    obj.textEditor3:setHeight(38);
    obj.textEditor3:setFontSize(14.2);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("NOTAS_7");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout235 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout235:setParent(obj.rectangle1);
    obj.layout235:setLeft(661);
    obj.layout235:setTop(390);
    obj.layout235:setWidth(110);
    obj.layout235:setHeight(21);
    obj.layout235:setName("layout235");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout235);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(13.5);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("leading");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(110);
    obj.edit39:setHeight(22);
    obj.edit39:setField("NOME_34");
    obj.edit39:setName("edit39");

    obj.layout236 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout236:setParent(obj.rectangle1);
    obj.layout236:setLeft(661);
    obj.layout236:setTop(412);
    obj.layout236:setWidth(55);
    obj.layout236:setHeight(21);
    obj.layout236:setName("layout236");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout236);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(13.5);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("leading");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(55);
    obj.edit40:setHeight(22);
    obj.edit40:setField("INFLUÊNCIA_4");
    obj.edit40:setName("edit40");

    obj.layout237 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout237:setParent(obj.rectangle1);
    obj.layout237:setLeft(773);
    obj.layout237:setTop(412);
    obj.layout237:setWidth(94);
    obj.layout237:setHeight(21);
    obj.layout237:setName("layout237");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout237);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(13.5);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("leading");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(94);
    obj.edit41:setHeight(22);
    obj.edit41:setField("DEVOÇÃO_4");
    obj.edit41:setName("edit41");

    obj.layout238 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout238:setParent(obj.rectangle1);
    obj.layout238:setLeft(661);
    obj.layout238:setTop(446);
    obj.layout238:setWidth(205);
    obj.layout238:setHeight(38);
    obj.layout238:setName("layout238");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout238);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(205);
    obj.textEditor4:setHeight(38);
    obj.textEditor4:setFontSize(14.2);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("NOTAS_8");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout239 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout239:setParent(obj.rectangle1);
    obj.layout239:setLeft(116);
    obj.layout239:setTop(130);
    obj.layout239:setWidth(193);
    obj.layout239:setHeight(20);
    obj.layout239:setName("layout239");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout239);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(12.8);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(193);
    obj.edit42:setHeight(21);
    obj.edit42:setField("Personagens_Encontrados_0");
    obj.edit42:setName("edit42");

    obj.layout240 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout240:setParent(obj.rectangle1);
    obj.layout240:setLeft(117);
    obj.layout240:setTop(151);
    obj.layout240:setWidth(193);
    obj.layout240:setHeight(20);
    obj.layout240:setName("layout240");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout240);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(12.8);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("leading");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(193);
    obj.edit43:setHeight(21);
    obj.edit43:setField("Personagens_Encontrados_1");
    obj.edit43:setName("edit43");

    obj.layout241 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout241:setParent(obj.rectangle1);
    obj.layout241:setLeft(117);
    obj.layout241:setTop(174);
    obj.layout241:setWidth(193);
    obj.layout241:setHeight(20);
    obj.layout241:setName("layout241");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout241);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(12.8);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setHorzTextAlign("leading");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(193);
    obj.edit44:setHeight(21);
    obj.edit44:setField("Personagens_Encontrados_2");
    obj.edit44:setName("edit44");

    obj.layout242 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout242:setParent(obj.rectangle1);
    obj.layout242:setLeft(117);
    obj.layout242:setTop(217);
    obj.layout242:setWidth(193);
    obj.layout242:setHeight(20);
    obj.layout242:setName("layout242");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout242);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(12.8);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("leading");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(193);
    obj.edit45:setHeight(21);
    obj.edit45:setField("Personagens_Encontrados_4");
    obj.edit45:setName("edit45");

    obj.layout243 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout243:setParent(obj.rectangle1);
    obj.layout243:setLeft(117);
    obj.layout243:setTop(304);
    obj.layout243:setWidth(193);
    obj.layout243:setHeight(20);
    obj.layout243:setName("layout243");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout243);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(12.8);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(193);
    obj.edit46:setHeight(21);
    obj.edit46:setField("Personagens_Encontrados_8");
    obj.edit46:setName("edit46");

    obj.layout244 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout244:setParent(obj.rectangle1);
    obj.layout244:setLeft(116);
    obj.layout244:setTop(326);
    obj.layout244:setWidth(193);
    obj.layout244:setHeight(20);
    obj.layout244:setName("layout244");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout244);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(12.8);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("leading");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(193);
    obj.edit47:setHeight(21);
    obj.edit47:setField("Personagens_Encontrados_9");
    obj.edit47:setName("edit47");

    obj.layout245 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout245:setParent(obj.rectangle1);
    obj.layout245:setLeft(117);
    obj.layout245:setTop(434);
    obj.layout245:setWidth(193);
    obj.layout245:setHeight(20);
    obj.layout245:setName("layout245");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout245);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(12.8);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("leading");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(193);
    obj.edit48:setHeight(21);
    obj.edit48:setField("Personagens_Encontrados_14");
    obj.edit48:setName("edit48");

    obj.layout246 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout246:setParent(obj.rectangle1);
    obj.layout246:setLeft(116);
    obj.layout246:setTop(456);
    obj.layout246:setWidth(193);
    obj.layout246:setHeight(20);
    obj.layout246:setName("layout246");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout246);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(12.8);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("leading");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(193);
    obj.edit49:setHeight(21);
    obj.edit49:setField("Personagens_Encontrados_15");
    obj.edit49:setName("edit49");

    obj.layout247 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout247:setParent(obj.rectangle1);
    obj.layout247:setLeft(661);
    obj.layout247:setTop(485);
    obj.layout247:setWidth(111);
    obj.layout247:setHeight(20);
    obj.layout247:setName("layout247");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout247);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(12.8);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setHorzTextAlign("leading");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(111);
    obj.edit50:setHeight(21);
    obj.edit50:setField("NOME_35");
    obj.edit50:setName("edit50");

    obj.layout248 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout248:setParent(obj.rectangle1);
    obj.layout248:setLeft(661);
    obj.layout248:setTop(507);
    obj.layout248:setWidth(55);
    obj.layout248:setHeight(21);
    obj.layout248:setName("layout248");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout248);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(13.5);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setHorzTextAlign("leading");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(55);
    obj.edit51:setHeight(22);
    obj.edit51:setField("INFLUÊNCIA_5");
    obj.edit51:setName("edit51");

    obj.layout249 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout249:setParent(obj.rectangle1);
    obj.layout249:setLeft(773);
    obj.layout249:setTop(507);
    obj.layout249:setWidth(93);
    obj.layout249:setHeight(21);
    obj.layout249:setName("layout249");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout249);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(13.5);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("leading");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(93);
    obj.edit52:setHeight(22);
    obj.edit52:setField("DEVOÇÃO_5");
    obj.edit52:setName("edit52");

    obj.layout250 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout250:setParent(obj.rectangle1);
    obj.layout250:setLeft(660);
    obj.layout250:setTop(541);
    obj.layout250:setWidth(206);
    obj.layout250:setHeight(38);
    obj.layout250:setName("layout250");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout250);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(206);
    obj.textEditor5:setHeight(38);
    obj.textEditor5:setFontSize(14.2);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("NOTAS_9");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout251 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout251:setParent(obj.rectangle1);
    obj.layout251:setLeft(661);
    obj.layout251:setTop(580);
    obj.layout251:setWidth(111);
    obj.layout251:setHeight(21);
    obj.layout251:setName("layout251");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout251);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(13.5);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(111);
    obj.edit53:setHeight(22);
    obj.edit53:setField("NOME_36");
    obj.edit53:setName("edit53");

    obj.layout252 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout252:setParent(obj.rectangle1);
    obj.layout252:setLeft(661);
    obj.layout252:setTop(601);
    obj.layout252:setWidth(54);
    obj.layout252:setHeight(21);
    obj.layout252:setName("layout252");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout252);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(13.5);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("leading");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(54);
    obj.edit54:setHeight(22);
    obj.edit54:setField("INFLUÊNCIA_6");
    obj.edit54:setName("edit54");

    obj.layout253 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout253:setParent(obj.rectangle1);
    obj.layout253:setLeft(773);
    obj.layout253:setTop(601);
    obj.layout253:setWidth(93);
    obj.layout253:setHeight(21);
    obj.layout253:setName("layout253");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout253);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(13.5);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setHorzTextAlign("leading");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(93);
    obj.edit55:setHeight(22);
    obj.edit55:setField("DEVOÇÃO_6");
    obj.edit55:setName("edit55");

    obj.layout254 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout254:setParent(obj.rectangle1);
    obj.layout254:setLeft(661);
    obj.layout254:setTop(635);
    obj.layout254:setWidth(205);
    obj.layout254:setHeight(38);
    obj.layout254:setName("layout254");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout254);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(205);
    obj.textEditor6:setHeight(38);
    obj.textEditor6:setFontSize(14.2);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setField("NOTAS_10");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.layout255 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout255:setParent(obj.rectangle1);
    obj.layout255:setLeft(117);
    obj.layout255:setTop(348);
    obj.layout255:setWidth(193);
    obj.layout255:setHeight(20);
    obj.layout255:setName("layout255");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout255);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(12.8);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setHorzTextAlign("leading");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(193);
    obj.edit56:setHeight(21);
    obj.edit56:setField("Personagens_Encontrados_10");
    obj.edit56:setName("edit56");

    obj.layout256 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout256:setParent(obj.rectangle1);
    obj.layout256:setLeft(116);
    obj.layout256:setTop(369);
    obj.layout256:setWidth(193);
    obj.layout256:setHeight(20);
    obj.layout256:setName("layout256");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout256);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(12.8);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setHorzTextAlign("leading");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(193);
    obj.edit57:setHeight(21);
    obj.edit57:setField("Personagens_Encontrados_11");
    obj.edit57:setName("edit57");

    obj.layout257 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout257:setParent(obj.rectangle1);
    obj.layout257:setLeft(116);
    obj.layout257:setTop(413);
    obj.layout257:setWidth(193);
    obj.layout257:setHeight(20);
    obj.layout257:setName("layout257");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout257);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(12.8);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setHorzTextAlign("leading");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(193);
    obj.edit58:setHeight(21);
    obj.edit58:setField("Personagens_Encontrados_13");
    obj.edit58:setName("edit58");

    obj.layout258 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout258:setParent(obj.rectangle1);
    obj.layout258:setLeft(117);
    obj.layout258:setTop(478);
    obj.layout258:setWidth(193);
    obj.layout258:setHeight(20);
    obj.layout258:setName("layout258");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout258);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(12.8);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setHorzTextAlign("leading");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(193);
    obj.edit59:setHeight(21);
    obj.edit59:setField("Personagens_Encontrados_16");
    obj.edit59:setName("edit59");

    obj.layout259 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout259:setParent(obj.rectangle1);
    obj.layout259:setLeft(117);
    obj.layout259:setTop(500);
    obj.layout259:setWidth(193);
    obj.layout259:setHeight(20);
    obj.layout259:setName("layout259");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout259);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(12.8);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setHorzTextAlign("leading");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(193);
    obj.edit60:setHeight(21);
    obj.edit60:setField("Personagens_Encontrados_17");
    obj.edit60:setName("edit60");

    obj.layout260 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout260:setParent(obj.rectangle1);
    obj.layout260:setLeft(116);
    obj.layout260:setTop(522);
    obj.layout260:setWidth(193);
    obj.layout260:setHeight(20);
    obj.layout260:setName("layout260");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout260);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontSize(12.8);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setHorzTextAlign("leading");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(193);
    obj.edit61:setHeight(21);
    obj.edit61:setField("Personagens_Encontrados_18");
    obj.edit61:setName("edit61");

    obj.layout261 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout261:setParent(obj.rectangle1);
    obj.layout261:setLeft(117);
    obj.layout261:setTop(544);
    obj.layout261:setWidth(193);
    obj.layout261:setHeight(20);
    obj.layout261:setName("layout261");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout261);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontSize(12.8);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setHorzTextAlign("leading");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(0);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(193);
    obj.edit62:setHeight(21);
    obj.edit62:setField("Personagens_Encontrados_19");
    obj.edit62:setName("edit62");

    obj.layout262 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout262:setParent(obj.rectangle1);
    obj.layout262:setLeft(117);
    obj.layout262:setTop(565);
    obj.layout262:setWidth(193);
    obj.layout262:setHeight(20);
    obj.layout262:setName("layout262");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout262);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontSize(12.8);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setHorzTextAlign("leading");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(0);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(193);
    obj.edit63:setHeight(21);
    obj.edit63:setField("Personagens_Encontrados_20");
    obj.edit63:setName("edit63");

    obj.layout263 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout263:setParent(obj.rectangle1);
    obj.layout263:setLeft(116);
    obj.layout263:setTop(587);
    obj.layout263:setWidth(193);
    obj.layout263:setHeight(20);
    obj.layout263:setName("layout263");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout263);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontSize(12.8);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setHorzTextAlign("leading");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(0);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(193);
    obj.edit64:setHeight(21);
    obj.edit64:setField("Personagens_Encontrados_21");
    obj.edit64:setName("edit64");

    obj.layout264 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout264:setParent(obj.rectangle1);
    obj.layout264:setLeft(117);
    obj.layout264:setTop(609);
    obj.layout264:setWidth(193);
    obj.layout264:setHeight(20);
    obj.layout264:setName("layout264");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout264);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontSize(12.8);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setHorzTextAlign("leading");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(0);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(193);
    obj.edit65:setHeight(21);
    obj.edit65:setField("Personagens_Encontrados_22");
    obj.edit65:setName("edit65");

    obj.layout265 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout265:setParent(obj.rectangle1);
    obj.layout265:setLeft(116);
    obj.layout265:setTop(630);
    obj.layout265:setWidth(193);
    obj.layout265:setHeight(20);
    obj.layout265:setName("layout265");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout265);
    obj.edit66:setTransparent(true);
    obj.edit66:setFontSize(12.8);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setHorzTextAlign("leading");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(193);
    obj.edit66:setHeight(21);
    obj.edit66:setField("Personagens_Encontrados_23");
    obj.edit66:setName("edit66");

    obj.layout266 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout266:setParent(obj.rectangle1);
    obj.layout266:setLeft(116);
    obj.layout266:setTop(652);
    obj.layout266:setWidth(193);
    obj.layout266:setHeight(20);
    obj.layout266:setName("layout266");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout266);
    obj.edit67:setTransparent(true);
    obj.edit67:setFontSize(12.8);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setHorzTextAlign("leading");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(0);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(193);
    obj.edit67:setHeight(21);
    obj.edit67:setField("Personagens_Encontrados_24");
    obj.edit67:setName("edit67");

    obj.layout267 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout267:setParent(obj.rectangle1);
    obj.layout267:setLeft(393);
    obj.layout267:setTop(652);
    obj.layout267:setWidth(193);
    obj.layout267:setHeight(20);
    obj.layout267:setName("layout267");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout267);
    obj.edit68:setTransparent(true);
    obj.edit68:setFontSize(12.8);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setHorzTextAlign("leading");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(0);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(193);
    obj.edit68:setHeight(21);
    obj.edit68:setField("Personagens_Encontrados_55");
    obj.edit68:setName("edit68");

    obj.layout268 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout268:setParent(obj.rectangle1);
    obj.layout268:setLeft(116);
    obj.layout268:setTop(674);
    obj.layout268:setWidth(193);
    obj.layout268:setHeight(20);
    obj.layout268:setName("layout268");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout268);
    obj.edit69:setTransparent(true);
    obj.edit69:setFontSize(12.8);
    obj.edit69:setFontColor("#000000");
    obj.edit69:setHorzTextAlign("leading");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(0);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(193);
    obj.edit69:setHeight(21);
    obj.edit69:setField("Personagens_Encontrados_25");
    obj.edit69:setName("edit69");

    obj.layout269 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout269:setParent(obj.rectangle1);
    obj.layout269:setLeft(393);
    obj.layout269:setTop(674);
    obj.layout269:setWidth(193);
    obj.layout269:setHeight(20);
    obj.layout269:setName("layout269");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout269);
    obj.edit70:setTransparent(true);
    obj.edit70:setFontSize(12.8);
    obj.edit70:setFontColor("#000000");
    obj.edit70:setHorzTextAlign("leading");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(0);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(193);
    obj.edit70:setHeight(21);
    obj.edit70:setField("Personagens_Encontrados_56");
    obj.edit70:setName("edit70");

    obj.layout270 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout270:setParent(obj.rectangle1);
    obj.layout270:setLeft(117);
    obj.layout270:setTop(695);
    obj.layout270:setWidth(193);
    obj.layout270:setHeight(20);
    obj.layout270:setName("layout270");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout270);
    obj.edit71:setTransparent(true);
    obj.edit71:setFontSize(12.8);
    obj.edit71:setFontColor("#000000");
    obj.edit71:setHorzTextAlign("leading");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(193);
    obj.edit71:setHeight(21);
    obj.edit71:setField("Personagens_Encontrados_26");
    obj.edit71:setName("edit71");

    obj.layout271 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout271:setParent(obj.rectangle1);
    obj.layout271:setLeft(393);
    obj.layout271:setTop(696);
    obj.layout271:setWidth(193);
    obj.layout271:setHeight(20);
    obj.layout271:setName("layout271");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout271);
    obj.edit72:setTransparent(true);
    obj.edit72:setFontSize(12.8);
    obj.edit72:setFontColor("#000000");
    obj.edit72:setHorzTextAlign("leading");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(0);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(193);
    obj.edit72:setHeight(21);
    obj.edit72:setField("Personagens_Encontrados_57");
    obj.edit72:setName("edit72");

    obj.layout272 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout272:setParent(obj.rectangle1);
    obj.layout272:setLeft(117);
    obj.layout272:setTop(717);
    obj.layout272:setWidth(193);
    obj.layout272:setHeight(20);
    obj.layout272:setName("layout272");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout272);
    obj.edit73:setTransparent(true);
    obj.edit73:setFontSize(12.8);
    obj.edit73:setFontColor("#000000");
    obj.edit73:setHorzTextAlign("leading");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(0);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(193);
    obj.edit73:setHeight(21);
    obj.edit73:setField("Personagens_Encontrados_27");
    obj.edit73:setName("edit73");

    obj.layout273 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout273:setParent(obj.rectangle1);
    obj.layout273:setLeft(393);
    obj.layout273:setTop(717);
    obj.layout273:setWidth(193);
    obj.layout273:setHeight(20);
    obj.layout273:setName("layout273");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout273);
    obj.edit74:setTransparent(true);
    obj.edit74:setFontSize(12.8);
    obj.edit74:setFontColor("#000000");
    obj.edit74:setHorzTextAlign("leading");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(0);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(193);
    obj.edit74:setHeight(21);
    obj.edit74:setField("Personagens_Encontrados_58");
    obj.edit74:setName("edit74");

    obj.layout274 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout274:setParent(obj.rectangle1);
    obj.layout274:setLeft(117);
    obj.layout274:setTop(739);
    obj.layout274:setWidth(193);
    obj.layout274:setHeight(20);
    obj.layout274:setName("layout274");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout274);
    obj.edit75:setTransparent(true);
    obj.edit75:setFontSize(12.8);
    obj.edit75:setFontColor("#000000");
    obj.edit75:setHorzTextAlign("leading");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(0);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(193);
    obj.edit75:setHeight(21);
    obj.edit75:setField("Personagens_Encontrados_28");
    obj.edit75:setName("edit75");

    obj.layout275 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout275:setParent(obj.rectangle1);
    obj.layout275:setLeft(393);
    obj.layout275:setTop(740);
    obj.layout275:setWidth(193);
    obj.layout275:setHeight(20);
    obj.layout275:setName("layout275");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout275);
    obj.edit76:setTransparent(true);
    obj.edit76:setFontSize(12.8);
    obj.edit76:setFontColor("#000000");
    obj.edit76:setHorzTextAlign("leading");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(193);
    obj.edit76:setHeight(21);
    obj.edit76:setField("Personagens_Encontrados_59");
    obj.edit76:setName("edit76");

    obj.layout276 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout276:setParent(obj.rectangle1);
    obj.layout276:setLeft(116);
    obj.layout276:setTop(760);
    obj.layout276:setWidth(193);
    obj.layout276:setHeight(20);
    obj.layout276:setName("layout276");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout276);
    obj.edit77:setTransparent(true);
    obj.edit77:setFontSize(12.8);
    obj.edit77:setFontColor("#000000");
    obj.edit77:setHorzTextAlign("leading");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(0);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(193);
    obj.edit77:setHeight(21);
    obj.edit77:setField("Personagens_Encontrados_29");
    obj.edit77:setName("edit77");

    obj.layout277 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout277:setParent(obj.rectangle1);
    obj.layout277:setLeft(393);
    obj.layout277:setTop(761);
    obj.layout277:setWidth(193);
    obj.layout277:setHeight(20);
    obj.layout277:setName("layout277");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout277);
    obj.edit78:setTransparent(true);
    obj.edit78:setFontSize(12.8);
    obj.edit78:setFontColor("#000000");
    obj.edit78:setHorzTextAlign("leading");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(0);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(193);
    obj.edit78:setHeight(21);
    obj.edit78:setField("Personagens_Encontrados_60");
    obj.edit78:setName("edit78");

    obj.layout278 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout278:setParent(obj.rectangle1);
    obj.layout278:setLeft(117);
    obj.layout278:setTop(782);
    obj.layout278:setWidth(193);
    obj.layout278:setHeight(20);
    obj.layout278:setName("layout278");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout278);
    obj.edit79:setTransparent(true);
    obj.edit79:setFontSize(12.8);
    obj.edit79:setFontColor("#000000");
    obj.edit79:setHorzTextAlign("leading");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(0);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(193);
    obj.edit79:setHeight(21);
    obj.edit79:setField("Personagens_Encontrados_30");
    obj.edit79:setName("edit79");

    obj.layout279 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout279:setParent(obj.rectangle1);
    obj.layout279:setLeft(393);
    obj.layout279:setTop(782);
    obj.layout279:setWidth(193);
    obj.layout279:setHeight(20);
    obj.layout279:setName("layout279");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout279);
    obj.edit80:setTransparent(true);
    obj.edit80:setFontSize(12.8);
    obj.edit80:setFontColor("#000000");
    obj.edit80:setHorzTextAlign("leading");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(0);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(193);
    obj.edit80:setHeight(21);
    obj.edit80:setField("Personagens_Encontrados_61");
    obj.edit80:setName("edit80");

    obj.layout280 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout280:setParent(obj.rectangle1);
    obj.layout280:setLeft(369);
    obj.layout280:setTop(667);
    obj.layout280:setWidth(26);
    obj.layout280:setHeight(27);
    obj.layout280:setName("layout280");

    obj.checkBox194 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox194:setParent(obj.layout280);
    obj.checkBox194:setLeft(0);
    obj.checkBox194:setTop(0);
    obj.checkBox194:setWidth(26);
    obj.checkBox194:setHeight(28);
    obj.checkBox194:setField("Check_Box356");
    obj.checkBox194:setName("checkBox194");

    obj.layout281 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout281:setParent(obj.rectangle1);
    obj.layout281:setLeft(371);
    obj.layout281:setTop(691);
    obj.layout281:setWidth(26);
    obj.layout281:setHeight(27);
    obj.layout281:setName("layout281");

    obj.checkBox195 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox195:setParent(obj.layout281);
    obj.checkBox195:setLeft(0);
    obj.checkBox195:setTop(0);
    obj.checkBox195:setWidth(26);
    obj.checkBox195:setHeight(28);
    obj.checkBox195:setField("Check_Box359");
    obj.checkBox195:setName("checkBox195");

    obj.layout282 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout282:setParent(obj.rectangle1);
    obj.layout282:setLeft(369);
    obj.layout282:setTop(711);
    obj.layout282:setWidth(26);
    obj.layout282:setHeight(27);
    obj.layout282:setName("layout282");

    obj.checkBox196 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox196:setParent(obj.layout282);
    obj.checkBox196:setLeft(0);
    obj.checkBox196:setTop(0);
    obj.checkBox196:setWidth(26);
    obj.checkBox196:setHeight(28);
    obj.checkBox196:setField("Check_Box362");
    obj.checkBox196:setName("checkBox196");

    obj.layout283 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout283:setParent(obj.rectangle1);
    obj.layout283:setLeft(368);
    obj.layout283:setTop(734);
    obj.layout283:setWidth(26);
    obj.layout283:setHeight(27);
    obj.layout283:setName("layout283");

    obj.checkBox197 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox197:setParent(obj.layout283);
    obj.checkBox197:setLeft(0);
    obj.checkBox197:setTop(0);
    obj.checkBox197:setWidth(26);
    obj.checkBox197:setHeight(28);
    obj.checkBox197:setField("Check_Box365");
    obj.checkBox197:setName("checkBox197");

    obj.layout284 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout284:setParent(obj.rectangle1);
    obj.layout284:setLeft(367);
    obj.layout284:setTop(777);
    obj.layout284:setWidth(26);
    obj.layout284:setHeight(27);
    obj.layout284:setName("layout284");

    obj.checkBox198 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox198:setParent(obj.layout284);
    obj.checkBox198:setLeft(0);
    obj.checkBox198:setTop(0);
    obj.checkBox198:setWidth(26);
    obj.checkBox198:setHeight(28);
    obj.checkBox198:setField("Check_Box371");
    obj.checkBox198:setName("checkBox198");

    obj.layout285 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout285:setParent(obj.rectangle1);
    obj.layout285:setLeft(56);
    obj.layout285:setTop(903);
    obj.layout285:setWidth(262);
    obj.layout285:setHeight(237);
    obj.layout285:setName("layout285");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout285);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(262);
    obj.textEditor7:setHeight(237);
    obj.textEditor7:setFontSize(14.2);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setField("OBJETIVOS_A_CURTO_PRAZORow1");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.layout286 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout286:setParent(obj.rectangle1);
    obj.layout286:setLeft(320);
    obj.layout286:setTop(903);
    obj.layout286:setWidth(265);
    obj.layout286:setHeight(237);
    obj.layout286:setName("layout286");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout286);
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(0);
    obj.textEditor8:setWidth(265);
    obj.textEditor8:setHeight(237);
    obj.textEditor8:setFontSize(14.2);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setField("OBJETIVOS_A_LONGO_PRAZORow1");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setName("textEditor8");

    obj.layout287 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout287:setParent(obj.rectangle1);
    obj.layout287:setLeft(613);
    obj.layout287:setTop(719);
    obj.layout287:setWidth(253);
    obj.layout287:setHeight(421);
    obj.layout287:setName("layout287");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout287);
    obj.textEditor9:setLeft(0);
    obj.textEditor9:setTop(0);
    obj.textEditor9:setWidth(253);
    obj.textEditor9:setHeight(421);
    obj.textEditor9:setFontSize(14.2);
    obj.textEditor9:setFontColor("#000000");
    obj.textEditor9:setField("Locais_Visitados");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setName("textEditor9");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.checkBox67 ~= nil then self.checkBox67:destroy(); self.checkBox67 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.checkBox85 ~= nil then self.checkBox85:destroy(); self.checkBox85 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox111 ~= nil then self.checkBox111:destroy(); self.checkBox111 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout266 ~= nil then self.layout266:destroy(); self.layout266 = nil; end;
        if self.layout275 ~= nil then self.layout275:destroy(); self.layout275 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.checkBox180 ~= nil then self.checkBox180:destroy(); self.checkBox180 = nil; end;
        if self.checkBox135 ~= nil then self.checkBox135:destroy(); self.checkBox135 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.layout257 ~= nil then self.layout257:destroy(); self.layout257 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.checkBox68 ~= nil then self.checkBox68:destroy(); self.checkBox68 = nil; end;
        if self.checkBox98 ~= nil then self.checkBox98:destroy(); self.checkBox98 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.checkBox177 ~= nil then self.checkBox177:destroy(); self.checkBox177 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.checkBox78 ~= nil then self.checkBox78:destroy(); self.checkBox78 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout247 ~= nil then self.layout247:destroy(); self.layout247 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.layout285 ~= nil then self.layout285:destroy(); self.layout285 = nil; end;
        if self.checkBox167 ~= nil then self.checkBox167:destroy(); self.checkBox167 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout249 ~= nil then self.layout249:destroy(); self.layout249 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.checkBox79 ~= nil then self.checkBox79:destroy(); self.checkBox79 = nil; end;
        if self.checkBox124 ~= nil then self.checkBox124:destroy(); self.checkBox124 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout223 ~= nil then self.layout223:destroy(); self.layout223 = nil; end;
        if self.layout236 ~= nil then self.layout236:destroy(); self.layout236 = nil; end;
        if self.layout251 ~= nil then self.layout251:destroy(); self.layout251 = nil; end;
        if self.layout283 ~= nil then self.layout283:destroy(); self.layout283 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.checkBox197 ~= nil then self.checkBox197:destroy(); self.checkBox197 = nil; end;
        if self.layout276 ~= nil then self.layout276:destroy(); self.layout276 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.checkBox170 ~= nil then self.checkBox170:destroy(); self.checkBox170 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.checkBox175 ~= nil then self.checkBox175:destroy(); self.checkBox175 = nil; end;
        if self.checkBox198 ~= nil then self.checkBox198:destroy(); self.checkBox198 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.checkBox102 ~= nil then self.checkBox102:destroy(); self.checkBox102 = nil; end;
        if self.checkBox128 ~= nil then self.checkBox128:destroy(); self.checkBox128 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.checkBox132 ~= nil then self.checkBox132:destroy(); self.checkBox132 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.checkBox162 ~= nil then self.checkBox162:destroy(); self.checkBox162 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.layout232 ~= nil then self.layout232:destroy(); self.layout232 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.checkBox119 ~= nil then self.checkBox119:destroy(); self.checkBox119 = nil; end;
        if self.checkBox115 ~= nil then self.checkBox115:destroy(); self.checkBox115 = nil; end;
        if self.checkBox131 ~= nil then self.checkBox131:destroy(); self.checkBox131 = nil; end;
        if self.checkBox144 ~= nil then self.checkBox144:destroy(); self.checkBox144 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.layout252 ~= nil then self.layout252:destroy(); self.layout252 = nil; end;
        if self.checkBox195 ~= nil then self.checkBox195:destroy(); self.checkBox195 = nil; end;
        if self.checkBox127 ~= nil then self.checkBox127:destroy(); self.checkBox127 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.layout248 ~= nil then self.layout248:destroy(); self.layout248 = nil; end;
        if self.layout235 ~= nil then self.layout235:destroy(); self.layout235 = nil; end;
        if self.layout259 ~= nil then self.layout259:destroy(); self.layout259 = nil; end;
        if self.checkBox84 ~= nil then self.checkBox84:destroy(); self.checkBox84 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.checkBox70 ~= nil then self.checkBox70:destroy(); self.checkBox70 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.checkBox146 ~= nil then self.checkBox146:destroy(); self.checkBox146 = nil; end;
        if self.checkBox122 ~= nil then self.checkBox122:destroy(); self.checkBox122 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout246 ~= nil then self.layout246:destroy(); self.layout246 = nil; end;
        if self.layout256 ~= nil then self.layout256:destroy(); self.layout256 = nil; end;
        if self.checkBox176 ~= nil then self.checkBox176:destroy(); self.checkBox176 = nil; end;
        if self.checkBox95 ~= nil then self.checkBox95:destroy(); self.checkBox95 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.layout273 ~= nil then self.layout273:destroy(); self.layout273 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.checkBox152 ~= nil then self.checkBox152:destroy(); self.checkBox152 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.layout229 ~= nil then self.layout229:destroy(); self.layout229 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.checkBox189 ~= nil then self.checkBox189:destroy(); self.checkBox189 = nil; end;
        if self.layout277 ~= nil then self.layout277:destroy(); self.layout277 = nil; end;
        if self.checkBox125 ~= nil then self.checkBox125:destroy(); self.checkBox125 = nil; end;
        if self.checkBox74 ~= nil then self.checkBox74:destroy(); self.checkBox74 = nil; end;
        if self.checkBox86 ~= nil then self.checkBox86:destroy(); self.checkBox86 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.checkBox100 ~= nil then self.checkBox100:destroy(); self.checkBox100 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.checkBox114 ~= nil then self.checkBox114:destroy(); self.checkBox114 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout225 ~= nil then self.layout225:destroy(); self.layout225 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout278 ~= nil then self.layout278:destroy(); self.layout278 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.layout260 ~= nil then self.layout260:destroy(); self.layout260 = nil; end;
        if self.layout261 ~= nil then self.layout261:destroy(); self.layout261 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.layout270 ~= nil then self.layout270:destroy(); self.layout270 = nil; end;
        if self.checkBox178 ~= nil then self.checkBox178:destroy(); self.checkBox178 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.checkBox145 ~= nil then self.checkBox145:destroy(); self.checkBox145 = nil; end;
        if self.layout241 ~= nil then self.layout241:destroy(); self.layout241 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout254 ~= nil then self.layout254:destroy(); self.layout254 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.checkBox123 ~= nil then self.checkBox123:destroy(); self.checkBox123 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.checkBox89 ~= nil then self.checkBox89:destroy(); self.checkBox89 = nil; end;
        if self.checkBox149 ~= nil then self.checkBox149:destroy(); self.checkBox149 = nil; end;
        if self.layout244 ~= nil then self.layout244:destroy(); self.layout244 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout279 ~= nil then self.layout279:destroy(); self.layout279 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout262 ~= nil then self.layout262:destroy(); self.layout262 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.checkBox193 ~= nil then self.checkBox193:destroy(); self.checkBox193 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout242 ~= nil then self.layout242:destroy(); self.layout242 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.checkBox94 ~= nil then self.checkBox94:destroy(); self.checkBox94 = nil; end;
        if self.checkBox147 ~= nil then self.checkBox147:destroy(); self.checkBox147 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.checkBox109 ~= nil then self.checkBox109:destroy(); self.checkBox109 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.layout228 ~= nil then self.layout228:destroy(); self.layout228 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.checkBox110 ~= nil then self.checkBox110:destroy(); self.checkBox110 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.checkBox141 ~= nil then self.checkBox141:destroy(); self.checkBox141 = nil; end;
        if self.checkBox103 ~= nil then self.checkBox103:destroy(); self.checkBox103 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.layout267 ~= nil then self.layout267:destroy(); self.layout267 = nil; end;
        if self.checkBox196 ~= nil then self.checkBox196:destroy(); self.checkBox196 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox108 ~= nil then self.checkBox108:destroy(); self.checkBox108 = nil; end;
        if self.checkBox83 ~= nil then self.checkBox83:destroy(); self.checkBox83 = nil; end;
        if self.layout268 ~= nil then self.layout268:destroy(); self.layout268 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.checkBox139 ~= nil then self.checkBox139:destroy(); self.checkBox139 = nil; end;
        if self.checkBox153 ~= nil then self.checkBox153:destroy(); self.checkBox153 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.checkBox182 ~= nil then self.checkBox182:destroy(); self.checkBox182 = nil; end;
        if self.checkBox159 ~= nil then self.checkBox159:destroy(); self.checkBox159 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.checkBox185 ~= nil then self.checkBox185:destroy(); self.checkBox185 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.checkBox93 ~= nil then self.checkBox93:destroy(); self.checkBox93 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.checkBox140 ~= nil then self.checkBox140:destroy(); self.checkBox140 = nil; end;
        if self.checkBox156 ~= nil then self.checkBox156:destroy(); self.checkBox156 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.layout230 ~= nil then self.layout230:destroy(); self.layout230 = nil; end;
        if self.checkBox75 ~= nil then self.checkBox75:destroy(); self.checkBox75 = nil; end;
        if self.checkBox157 ~= nil then self.checkBox157:destroy(); self.checkBox157 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.layout226 ~= nil then self.layout226:destroy(); self.layout226 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.checkBox80 ~= nil then self.checkBox80:destroy(); self.checkBox80 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout224 ~= nil then self.layout224:destroy(); self.layout224 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox163 ~= nil then self.checkBox163:destroy(); self.checkBox163 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.checkBox164 ~= nil then self.checkBox164:destroy(); self.checkBox164 = nil; end;
        if self.checkBox87 ~= nil then self.checkBox87:destroy(); self.checkBox87 = nil; end;
        if self.layout272 ~= nil then self.layout272:destroy(); self.layout272 = nil; end;
        if self.checkBox194 ~= nil then self.checkBox194:destroy(); self.checkBox194 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox73 ~= nil then self.checkBox73:destroy(); self.checkBox73 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.checkBox130 ~= nil then self.checkBox130:destroy(); self.checkBox130 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.checkBox174 ~= nil then self.checkBox174:destroy(); self.checkBox174 = nil; end;
        if self.checkBox191 ~= nil then self.checkBox191:destroy(); self.checkBox191 = nil; end;
        if self.layout227 ~= nil then self.layout227:destroy(); self.layout227 = nil; end;
        if self.checkBox150 ~= nil then self.checkBox150:destroy(); self.checkBox150 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.checkBox137 ~= nil then self.checkBox137:destroy(); self.checkBox137 = nil; end;
        if self.checkBox183 ~= nil then self.checkBox183:destroy(); self.checkBox183 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.checkBox90 ~= nil then self.checkBox90:destroy(); self.checkBox90 = nil; end;
        if self.checkBox142 ~= nil then self.checkBox142:destroy(); self.checkBox142 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.checkBox71 ~= nil then self.checkBox71:destroy(); self.checkBox71 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.checkBox179 ~= nil then self.checkBox179:destroy(); self.checkBox179 = nil; end;
        if self.checkBox188 ~= nil then self.checkBox188:destroy(); self.checkBox188 = nil; end;
        if self.layout263 ~= nil then self.layout263:destroy(); self.layout263 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.layout240 ~= nil then self.layout240:destroy(); self.layout240 = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.checkBox192 ~= nil then self.checkBox192:destroy(); self.checkBox192 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.layout245 ~= nil then self.layout245:destroy(); self.layout245 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout250 ~= nil then self.layout250:destroy(); self.layout250 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.checkBox120 ~= nil then self.checkBox120:destroy(); self.checkBox120 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.checkBox76 ~= nil then self.checkBox76:destroy(); self.checkBox76 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.checkBox81 ~= nil then self.checkBox81:destroy(); self.checkBox81 = nil; end;
        if self.checkBox173 ~= nil then self.checkBox173:destroy(); self.checkBox173 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.checkBox166 ~= nil then self.checkBox166:destroy(); self.checkBox166 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.checkBox121 ~= nil then self.checkBox121:destroy(); self.checkBox121 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.layout243 ~= nil then self.layout243:destroy(); self.layout243 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.checkBox104 ~= nil then self.checkBox104:destroy(); self.checkBox104 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.checkBox96 ~= nil then self.checkBox96:destroy(); self.checkBox96 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.checkBox186 ~= nil then self.checkBox186:destroy(); self.checkBox186 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.checkBox113 ~= nil then self.checkBox113:destroy(); self.checkBox113 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.layout271 ~= nil then self.layout271:destroy(); self.layout271 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.checkBox151 ~= nil then self.checkBox151:destroy(); self.checkBox151 = nil; end;
        if self.layout253 ~= nil then self.layout253:destroy(); self.layout253 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.checkBox69 ~= nil then self.checkBox69:destroy(); self.checkBox69 = nil; end;
        if self.checkBox126 ~= nil then self.checkBox126:destroy(); self.checkBox126 = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.checkBox106 ~= nil then self.checkBox106:destroy(); self.checkBox106 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.layout234 ~= nil then self.layout234:destroy(); self.layout234 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.layout280 ~= nil then self.layout280:destroy(); self.layout280 = nil; end;
        if self.layout238 ~= nil then self.layout238:destroy(); self.layout238 = nil; end;
        if self.checkBox99 ~= nil then self.checkBox99:destroy(); self.checkBox99 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.checkBox107 ~= nil then self.checkBox107:destroy(); self.checkBox107 = nil; end;
        if self.checkBox92 ~= nil then self.checkBox92:destroy(); self.checkBox92 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.checkBox88 ~= nil then self.checkBox88:destroy(); self.checkBox88 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.checkBox171 ~= nil then self.checkBox171:destroy(); self.checkBox171 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.checkBox117 ~= nil then self.checkBox117:destroy(); self.checkBox117 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.checkBox134 ~= nil then self.checkBox134:destroy(); self.checkBox134 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.checkBox187 ~= nil then self.checkBox187:destroy(); self.checkBox187 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.layout282 ~= nil then self.layout282:destroy(); self.layout282 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.checkBox118 ~= nil then self.checkBox118:destroy(); self.checkBox118 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout274 ~= nil then self.layout274:destroy(); self.layout274 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.checkBox148 ~= nil then self.checkBox148:destroy(); self.checkBox148 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout269 ~= nil then self.layout269:destroy(); self.layout269 = nil; end;
        if self.checkBox155 ~= nil then self.checkBox155:destroy(); self.checkBox155 = nil; end;
        if self.checkBox190 ~= nil then self.checkBox190:destroy(); self.checkBox190 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout233 ~= nil then self.layout233:destroy(); self.layout233 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.checkBox168 ~= nil then self.checkBox168:destroy(); self.checkBox168 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.checkBox154 ~= nil then self.checkBox154:destroy(); self.checkBox154 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.checkBox172 ~= nil then self.checkBox172:destroy(); self.checkBox172 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.checkBox112 ~= nil then self.checkBox112:destroy(); self.checkBox112 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout264 ~= nil then self.layout264:destroy(); self.layout264 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.checkBox77 ~= nil then self.checkBox77:destroy(); self.checkBox77 = nil; end;
        if self.layout231 ~= nil then self.layout231:destroy(); self.layout231 = nil; end;
        if self.checkBox91 ~= nil then self.checkBox91:destroy(); self.checkBox91 = nil; end;
        if self.checkBox116 ~= nil then self.checkBox116:destroy(); self.checkBox116 = nil; end;
        if self.checkBox165 ~= nil then self.checkBox165:destroy(); self.checkBox165 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.checkBox158 ~= nil then self.checkBox158:destroy(); self.checkBox158 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.checkBox160 ~= nil then self.checkBox160:destroy(); self.checkBox160 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.checkBox181 ~= nil then self.checkBox181:destroy(); self.checkBox181 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.checkBox169 ~= nil then self.checkBox169:destroy(); self.checkBox169 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox101 ~= nil then self.checkBox101:destroy(); self.checkBox101 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.layout281 ~= nil then self.layout281:destroy(); self.layout281 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.checkBox143 ~= nil then self.checkBox143:destroy(); self.checkBox143 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.checkBox72 ~= nil then self.checkBox72:destroy(); self.checkBox72 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.layout286 ~= nil then self.layout286:destroy(); self.layout286 = nil; end;
        if self.checkBox97 ~= nil then self.checkBox97:destroy(); self.checkBox97 = nil; end;
        if self.layout265 ~= nil then self.layout265:destroy(); self.layout265 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.checkBox161 ~= nil then self.checkBox161:destroy(); self.checkBox161 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.checkBox105 ~= nil then self.checkBox105:destroy(); self.checkBox105 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout239 ~= nil then self.layout239:destroy(); self.layout239 = nil; end;
        if self.checkBox138 ~= nil then self.checkBox138:destroy(); self.checkBox138 = nil; end;
        if self.layout258 ~= nil then self.layout258:destroy(); self.layout258 = nil; end;
        if self.checkBox129 ~= nil then self.checkBox129:destroy(); self.checkBox129 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.checkBox184 ~= nil then self.checkBox184:destroy(); self.checkBox184 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.checkBox133 ~= nil then self.checkBox133:destroy(); self.checkBox133 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout287 ~= nil then self.layout287:destroy(); self.layout287 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.checkBox82 ~= nil then self.checkBox82:destroy(); self.checkBox82 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.layout284 ~= nil then self.layout284:destroy(); self.layout284 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.checkBox136 ~= nil then self.checkBox136:destroy(); self.checkBox136 = nil; end;
        if self.layout237 ~= nil then self.layout237:destroy(); self.layout237 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout255 ~= nil then self.layout255:destroy(); self.layout255 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmL5A5_svg = {
    newEditor = newfrmL5A5_svg, 
    new = newfrmL5A5_svg, 
    name = "frmL5A5_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmL5A5_svg = _frmL5A5_svg;
rrpg.registrarForm(_frmL5A5_svg);

return _frmL5A5_svg;
