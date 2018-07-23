require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmL5A3_svg()
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
    obj:setName("frmL5A3_svg");
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
    obj.rectangle1:setHeight(1188);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(918);
    obj.image1:setHeight(1188);
    obj.image1:setSRC("/L5A/images/3.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(105);
    obj.layout1:setTop(108);
    obj.layout1:setWidth(148);
    obj.layout1:setHeight(20);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(12.8);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(148);
    obj.edit1:setHeight(21);
    obj.edit1:setField("ESCOLA_3");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(381);
    obj.layout2:setTop(108);
    obj.layout2:setWidth(148);
    obj.layout2:setHeight(20);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(12.8);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(148);
    obj.edit2:setHeight(21);
    obj.edit2:setField("ESCOLA_4");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(661);
    obj.layout3:setTop(108);
    obj.layout3:setWidth(148);
    obj.layout3:setHeight(20);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(12.8);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(148);
    obj.edit3:setHeight(21);
    obj.edit3:setField("ESCOLA_5");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(105);
    obj.layout4:setTop(133);
    obj.layout4:setWidth(169);
    obj.layout4:setHeight(32);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(14.2);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(169);
    obj.edit4:setHeight(33);
    obj.edit4:setField("APRENDIDONÍVEL_1_2");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(280);
    obj.layout5:setTop(135);
    obj.layout5:setWidth(26);
    obj.layout5:setHeight(27);
    obj.layout5:setName("layout5");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout5);
    obj.checkBox1:setLeft(0);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(26);
    obj.checkBox1:setHeight(28);
    obj.checkBox1:setField("Check_Box108");
    obj.checkBox1:setName("checkBox1");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(383);
    obj.layout6:setTop(133);
    obj.layout6:setWidth(169);
    obj.layout6:setHeight(32);
    obj.layout6:setName("layout6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(14.2);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(169);
    obj.edit5:setHeight(33);
    obj.edit5:setField("APRENDIDONÍVEL_1_4");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(558);
    obj.layout7:setTop(135);
    obj.layout7:setWidth(26);
    obj.layout7:setHeight(27);
    obj.layout7:setName("layout7");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout7);
    obj.checkBox2:setLeft(0);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(26);
    obj.checkBox2:setHeight(28);
    obj.checkBox2:setField("Check_Box113");
    obj.checkBox2:setName("checkBox2");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(661);
    obj.layout8:setTop(133);
    obj.layout8:setWidth(169);
    obj.layout8:setHeight(32);
    obj.layout8:setName("layout8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(14.2);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(169);
    obj.edit6:setHeight(33);
    obj.edit6:setField("APRENDIDONÍVEL_1_6");
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(836);
    obj.layout9:setTop(136);
    obj.layout9:setWidth(26);
    obj.layout9:setHeight(27);
    obj.layout9:setName("layout9");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout9);
    obj.checkBox3:setLeft(0);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(26);
    obj.checkBox3:setHeight(28);
    obj.checkBox3:setField("Check_Box118");
    obj.checkBox3:setName("checkBox3");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(105);
    obj.layout10:setTop(178);
    obj.layout10:setWidth(206);
    obj.layout10:setHeight(89);
    obj.layout10:setName("layout10");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout10);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(206);
    obj.textEditor1:setHeight(89);
    obj.textEditor1:setFontSize(14.2);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("EFEITO_4");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(382);
    obj.layout11:setTop(178);
    obj.layout11:setWidth(206);
    obj.layout11:setHeight(89);
    obj.layout11:setName("layout11");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout11);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(206);
    obj.textEditor2:setHeight(89);
    obj.textEditor2:setFontSize(14.2);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("EFEITO_5");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(660);
    obj.layout12:setTop(178);
    obj.layout12:setWidth(206);
    obj.layout12:setHeight(89);
    obj.layout12:setName("layout12");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout12);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(206);
    obj.textEditor3:setHeight(89);
    obj.textEditor3:setFontSize(14.2);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("EFEITO_6");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(105);
    obj.layout13:setTop(272);
    obj.layout13:setWidth(169);
    obj.layout13:setHeight(32);
    obj.layout13:setName("layout13");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout13);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(14.2);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(169);
    obj.edit7:setHeight(33);
    obj.edit7:setField("NÍVEL_2_2");
    obj.edit7:setName("edit7");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(280);
    obj.layout14:setTop(275);
    obj.layout14:setWidth(26);
    obj.layout14:setHeight(27);
    obj.layout14:setName("layout14");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout14);
    obj.checkBox4:setLeft(0);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(26);
    obj.checkBox4:setHeight(28);
    obj.checkBox4:setField("Check_Box109");
    obj.checkBox4:setName("checkBox4");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(383);
    obj.layout15:setTop(272);
    obj.layout15:setWidth(169);
    obj.layout15:setHeight(32);
    obj.layout15:setName("layout15");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout15);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(14.2);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(169);
    obj.edit8:setHeight(33);
    obj.edit8:setField("NÍVEL_2_3");
    obj.edit8:setName("edit8");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(558);
    obj.layout16:setTop(274);
    obj.layout16:setWidth(26);
    obj.layout16:setHeight(27);
    obj.layout16:setName("layout16");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout16);
    obj.checkBox5:setLeft(0);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(26);
    obj.checkBox5:setHeight(28);
    obj.checkBox5:setField("Check_Box114");
    obj.checkBox5:setName("checkBox5");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(661);
    obj.layout17:setTop(272);
    obj.layout17:setWidth(169);
    obj.layout17:setHeight(32);
    obj.layout17:setName("layout17");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout17);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(14.2);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(169);
    obj.edit9:setHeight(33);
    obj.edit9:setField("NÍVEL_2_4");
    obj.edit9:setName("edit9");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(837);
    obj.layout18:setTop(275);
    obj.layout18:setWidth(26);
    obj.layout18:setHeight(27);
    obj.layout18:setName("layout18");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout18);
    obj.checkBox6:setLeft(0);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(26);
    obj.checkBox6:setHeight(28);
    obj.checkBox6:setField("Check_Box119");
    obj.checkBox6:setName("checkBox6");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(104);
    obj.layout19:setTop(317);
    obj.layout19:setWidth(206);
    obj.layout19:setHeight(90);
    obj.layout19:setName("layout19");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout19);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(206);
    obj.textEditor4:setHeight(90);
    obj.textEditor4:setFontSize(14.2);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("EFEITO_7");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(383);
    obj.layout20:setTop(317);
    obj.layout20:setWidth(206);
    obj.layout20:setHeight(90);
    obj.layout20:setName("layout20");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout20);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(206);
    obj.textEditor5:setHeight(90);
    obj.textEditor5:setFontSize(14.2);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("EFEITO_8");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(660);
    obj.layout21:setTop(317);
    obj.layout21:setWidth(206);
    obj.layout21:setHeight(89);
    obj.layout21:setName("layout21");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout21);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(206);
    obj.textEditor6:setHeight(89);
    obj.textEditor6:setFontSize(14.2);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setField("EFEITO_9");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(105);
    obj.layout22:setTop(411);
    obj.layout22:setWidth(169);
    obj.layout22:setHeight(32);
    obj.layout22:setName("layout22");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout22);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(14.2);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(169);
    obj.edit10:setHeight(33);
    obj.edit10:setField("NÍVEL_3_2");
    obj.edit10:setName("edit10");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(279);
    obj.layout23:setTop(413);
    obj.layout23:setWidth(26);
    obj.layout23:setHeight(27);
    obj.layout23:setName("layout23");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout23);
    obj.checkBox7:setLeft(0);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(26);
    obj.checkBox7:setHeight(28);
    obj.checkBox7:setField("Check_Box110");
    obj.checkBox7:setName("checkBox7");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(383);
    obj.layout24:setTop(411);
    obj.layout24:setWidth(169);
    obj.layout24:setHeight(32);
    obj.layout24:setName("layout24");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout24);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(14.2);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(169);
    obj.edit11:setHeight(33);
    obj.edit11:setField("NÍVEL_3_3");
    obj.edit11:setName("edit11");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(559);
    obj.layout25:setTop(412);
    obj.layout25:setWidth(26);
    obj.layout25:setHeight(27);
    obj.layout25:setName("layout25");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout25);
    obj.checkBox8:setLeft(0);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(26);
    obj.checkBox8:setHeight(28);
    obj.checkBox8:setField("Check_Box115");
    obj.checkBox8:setName("checkBox8");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(661);
    obj.layout26:setTop(411);
    obj.layout26:setWidth(169);
    obj.layout26:setHeight(32);
    obj.layout26:setName("layout26");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout26);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(14.2);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(169);
    obj.edit12:setHeight(33);
    obj.edit12:setField("NÍVEL_3_4");
    obj.edit12:setName("edit12");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(837);
    obj.layout27:setTop(413);
    obj.layout27:setWidth(26);
    obj.layout27:setHeight(27);
    obj.layout27:setName("layout27");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout27);
    obj.checkBox9:setLeft(0);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(26);
    obj.checkBox9:setHeight(28);
    obj.checkBox9:setField("Check_Box120");
    obj.checkBox9:setName("checkBox9");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(104);
    obj.layout28:setTop(456);
    obj.layout28:setWidth(206);
    obj.layout28:setHeight(89);
    obj.layout28:setName("layout28");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout28);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(206);
    obj.textEditor7:setHeight(89);
    obj.textEditor7:setFontSize(14.2);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setField("EFEITO_10");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(383);
    obj.layout29:setTop(456);
    obj.layout29:setWidth(206);
    obj.layout29:setHeight(89);
    obj.layout29:setName("layout29");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout29);
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(0);
    obj.textEditor8:setWidth(206);
    obj.textEditor8:setHeight(89);
    obj.textEditor8:setFontSize(14.2);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setField("EFEITO_11");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setName("textEditor8");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(661);
    obj.layout30:setTop(456);
    obj.layout30:setWidth(206);
    obj.layout30:setHeight(89);
    obj.layout30:setName("layout30");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout30);
    obj.textEditor9:setLeft(0);
    obj.textEditor9:setTop(0);
    obj.textEditor9:setWidth(206);
    obj.textEditor9:setHeight(89);
    obj.textEditor9:setFontSize(14.2);
    obj.textEditor9:setFontColor("#000000");
    obj.textEditor9:setField("EFEITO_12");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setName("textEditor9");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(105);
    obj.layout31:setTop(550);
    obj.layout31:setWidth(169);
    obj.layout31:setHeight(32);
    obj.layout31:setName("layout31");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout31);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(14.2);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(169);
    obj.edit13:setHeight(33);
    obj.edit13:setField("NÍVEL_4_2");
    obj.edit13:setName("edit13");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(280);
    obj.layout32:setTop(552);
    obj.layout32:setWidth(26);
    obj.layout32:setHeight(27);
    obj.layout32:setName("layout32");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout32);
    obj.checkBox10:setLeft(0);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(26);
    obj.checkBox10:setHeight(28);
    obj.checkBox10:setField("Check_Box111");
    obj.checkBox10:setName("checkBox10");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(383);
    obj.layout33:setTop(550);
    obj.layout33:setWidth(169);
    obj.layout33:setHeight(32);
    obj.layout33:setName("layout33");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout33);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(14.2);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(169);
    obj.edit14:setHeight(33);
    obj.edit14:setField("NÍVEL_4_3");
    obj.edit14:setName("edit14");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(559);
    obj.layout34:setTop(552);
    obj.layout34:setWidth(26);
    obj.layout34:setHeight(27);
    obj.layout34:setName("layout34");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout34);
    obj.checkBox11:setLeft(0);
    obj.checkBox11:setTop(0);
    obj.checkBox11:setWidth(26);
    obj.checkBox11:setHeight(28);
    obj.checkBox11:setField("Check_Box116");
    obj.checkBox11:setName("checkBox11");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(661);
    obj.layout35:setTop(550);
    obj.layout35:setWidth(169);
    obj.layout35:setHeight(32);
    obj.layout35:setName("layout35");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout35);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(14.2);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(169);
    obj.edit15:setHeight(33);
    obj.edit15:setField("NÍVEL_4_4");
    obj.edit15:setName("edit15");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(837);
    obj.layout36:setTop(552);
    obj.layout36:setWidth(26);
    obj.layout36:setHeight(27);
    obj.layout36:setName("layout36");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout36);
    obj.checkBox12:setLeft(0);
    obj.checkBox12:setTop(0);
    obj.checkBox12:setWidth(26);
    obj.checkBox12:setHeight(28);
    obj.checkBox12:setField("Check_Box121");
    obj.checkBox12:setName("checkBox12");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(104);
    obj.layout37:setTop(595);
    obj.layout37:setWidth(207);
    obj.layout37:setHeight(89);
    obj.layout37:setName("layout37");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout37);
    obj.textEditor10:setLeft(0);
    obj.textEditor10:setTop(0);
    obj.textEditor10:setWidth(207);
    obj.textEditor10:setHeight(89);
    obj.textEditor10:setFontSize(14.2);
    obj.textEditor10:setFontColor("#000000");
    obj.textEditor10:setField("EFEITO_13");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setName("textEditor10");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(383);
    obj.layout38:setTop(595);
    obj.layout38:setWidth(206);
    obj.layout38:setHeight(90);
    obj.layout38:setName("layout38");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout38);
    obj.textEditor11:setLeft(0);
    obj.textEditor11:setTop(0);
    obj.textEditor11:setWidth(206);
    obj.textEditor11:setHeight(90);
    obj.textEditor11:setFontSize(14.2);
    obj.textEditor11:setFontColor("#000000");
    obj.textEditor11:setField("EFEITO_14");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setName("textEditor11");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(660);
    obj.layout39:setTop(595);
    obj.layout39:setWidth(206);
    obj.layout39:setHeight(90);
    obj.layout39:setName("layout39");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout39);
    obj.textEditor12:setLeft(0);
    obj.textEditor12:setTop(0);
    obj.textEditor12:setWidth(206);
    obj.textEditor12:setHeight(90);
    obj.textEditor12:setFontSize(14.2);
    obj.textEditor12:setFontColor("#000000");
    obj.textEditor12:setField("EFEITO_15");
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setName("textEditor12");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(105);
    obj.layout40:setTop(689);
    obj.layout40:setWidth(169);
    obj.layout40:setHeight(32);
    obj.layout40:setName("layout40");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout40);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(14.2);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(169);
    obj.edit16:setHeight(33);
    obj.edit16:setField("NÍVEL_5_2");
    obj.edit16:setName("edit16");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(280);
    obj.layout41:setTop(691);
    obj.layout41:setWidth(26);
    obj.layout41:setHeight(27);
    obj.layout41:setName("layout41");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout41);
    obj.checkBox13:setLeft(0);
    obj.checkBox13:setTop(0);
    obj.checkBox13:setWidth(26);
    obj.checkBox13:setHeight(28);
    obj.checkBox13:setField("Check_Box112");
    obj.checkBox13:setName("checkBox13");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(383);
    obj.layout42:setTop(689);
    obj.layout42:setWidth(169);
    obj.layout42:setHeight(32);
    obj.layout42:setName("layout42");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout42);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(14.2);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(169);
    obj.edit17:setHeight(33);
    obj.edit17:setField("NÍVEL_5_3");
    obj.edit17:setName("edit17");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(559);
    obj.layout43:setTop(692);
    obj.layout43:setWidth(26);
    obj.layout43:setHeight(27);
    obj.layout43:setName("layout43");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout43);
    obj.checkBox14:setLeft(0);
    obj.checkBox14:setTop(0);
    obj.checkBox14:setWidth(26);
    obj.checkBox14:setHeight(28);
    obj.checkBox14:setField("Check_Box117");
    obj.checkBox14:setName("checkBox14");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(661);
    obj.layout44:setTop(689);
    obj.layout44:setWidth(169);
    obj.layout44:setHeight(32);
    obj.layout44:setName("layout44");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout44);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(14.2);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(169);
    obj.edit18:setHeight(33);
    obj.edit18:setField("NÍVEL_5_4");
    obj.edit18:setName("edit18");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(837);
    obj.layout45:setTop(692);
    obj.layout45:setWidth(26);
    obj.layout45:setHeight(27);
    obj.layout45:setName("layout45");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout45);
    obj.checkBox15:setLeft(0);
    obj.checkBox15:setTop(0);
    obj.checkBox15:setWidth(26);
    obj.checkBox15:setHeight(28);
    obj.checkBox15:setField("Check_Box122");
    obj.checkBox15:setName("checkBox15");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(105);
    obj.layout46:setTop(733);
    obj.layout46:setWidth(206);
    obj.layout46:setHeight(92);
    obj.layout46:setName("layout46");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout46);
    obj.textEditor13:setLeft(0);
    obj.textEditor13:setTop(0);
    obj.textEditor13:setWidth(206);
    obj.textEditor13:setHeight(92);
    obj.textEditor13:setFontSize(14.2);
    obj.textEditor13:setFontColor("#000000");
    obj.textEditor13:setField("EFEITO_16");
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setName("textEditor13");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(382);
    obj.layout47:setTop(734);
    obj.layout47:setWidth(206);
    obj.layout47:setHeight(91);
    obj.layout47:setName("layout47");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout47);
    obj.textEditor14:setLeft(0);
    obj.textEditor14:setTop(0);
    obj.textEditor14:setWidth(206);
    obj.textEditor14:setHeight(91);
    obj.textEditor14:setFontSize(14.2);
    obj.textEditor14:setFontColor("#000000");
    obj.textEditor14:setField("EFEITO_17");
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setName("textEditor14");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(660);
    obj.layout48:setTop(734);
    obj.layout48:setWidth(206);
    obj.layout48:setHeight(91);
    obj.layout48:setName("layout48");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout48);
    obj.textEditor15:setLeft(0);
    obj.textEditor15:setTop(0);
    obj.textEditor15:setWidth(206);
    obj.textEditor15:setHeight(91);
    obj.textEditor15:setFontSize(14.2);
    obj.textEditor15:setFontColor("#000000");
    obj.textEditor15:setField("EFEITO_18");
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setName("textEditor15");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(105);
    obj.layout49:setTop(861);
    obj.layout49:setWidth(205);
    obj.layout49:setHeight(21);
    obj.layout49:setName("layout49");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout49);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(13.5);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(205);
    obj.edit19:setHeight(22);
    obj.edit19:setField("NOME_5");
    obj.edit19:setName("edit19");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(382);
    obj.layout50:setTop(861);
    obj.layout50:setWidth(206);
    obj.layout50:setHeight(21);
    obj.layout50:setName("layout50");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout50);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(13.5);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(206);
    obj.edit20:setHeight(22);
    obj.edit20:setField("NOME_6");
    obj.edit20:setName("edit20");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(661);
    obj.layout51:setTop(861);
    obj.layout51:setWidth(205);
    obj.layout51:setHeight(21);
    obj.layout51:setName("layout51");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout51);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(13.5);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(205);
    obj.edit21:setHeight(22);
    obj.edit21:setField("NOME_7");
    obj.edit21:setName("edit21");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(104);
    obj.layout52:setTop(883);
    obj.layout52:setWidth(76);
    obj.layout52:setHeight(41);
    obj.layout52:setName("layout52");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout52);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(14.2);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(76);
    obj.edit22:setHeight(42);
    obj.edit22:setField("ANEL_MAESTRIA");
    obj.edit22:setName("edit22");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(234);
    obj.layout53:setTop(883);
    obj.layout53:setWidth(76);
    obj.layout53:setHeight(41);
    obj.layout53:setName("layout53");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout53);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(14.2);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(76);
    obj.edit23:setHeight(42);
    obj.edit23:setField("DURAÇÃO_4");
    obj.edit23:setName("edit23");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(383);
    obj.layout54:setTop(883);
    obj.layout54:setWidth(76);
    obj.layout54:setHeight(41);
    obj.layout54:setName("layout54");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout54);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(14.2);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(76);
    obj.edit24:setHeight(42);
    obj.edit24:setField("ANEL_MAESTRIA_2");
    obj.edit24:setName("edit24");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(512);
    obj.layout55:setTop(882);
    obj.layout55:setWidth(76);
    obj.layout55:setHeight(42);
    obj.layout55:setName("layout55");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout55);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(14.2);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(76);
    obj.edit25:setHeight(43);
    obj.edit25:setField("DURAÇÃO_5");
    obj.edit25:setName("edit25");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(660);
    obj.layout56:setTop(883);
    obj.layout56:setWidth(76);
    obj.layout56:setHeight(41);
    obj.layout56:setName("layout56");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout56);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(14.2);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(76);
    obj.edit26:setHeight(42);
    obj.edit26:setField("ANEL_MAESTRIA_3");
    obj.edit26:setName("edit26");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(790);
    obj.layout57:setTop(882);
    obj.layout57:setWidth(76);
    obj.layout57:setHeight(42);
    obj.layout57:setName("layout57");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout57);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(14.2);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(76);
    obj.edit27:setHeight(43);
    obj.edit27:setField("DURAÇÃO_6");
    obj.edit27:setName("edit27");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(104);
    obj.layout58:setTop(925);
    obj.layout58:setWidth(206);
    obj.layout58:setHeight(28);
    obj.layout58:setName("layout58");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout58);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(14.2);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(206);
    obj.edit28:setHeight(29);
    obj.edit28:setField("EFEITO_19");
    obj.edit28:setName("edit28");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(382);
    obj.layout59:setTop(925);
    obj.layout59:setWidth(206);
    obj.layout59:setHeight(28);
    obj.layout59:setName("layout59");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout59);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(14.2);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(206);
    obj.edit29:setHeight(29);
    obj.edit29:setField("EFEITO_20");
    obj.edit29:setName("edit29");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(661);
    obj.layout60:setTop(925);
    obj.layout60:setWidth(206);
    obj.layout60:setHeight(28);
    obj.layout60:setName("layout60");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout60);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(14.2);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(206);
    obj.edit30:setHeight(29);
    obj.edit30:setField("EFEITO_21");
    obj.edit30:setName("edit30");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(104);
    obj.layout61:setTop(957);
    obj.layout61:setWidth(206);
    obj.layout61:setHeight(20);
    obj.layout61:setName("layout61");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout61);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(12.8);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(206);
    obj.edit31:setHeight(21);
    obj.edit31:setField("NOME_8");
    obj.edit31:setName("edit31");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(383);
    obj.layout62:setTop(957);
    obj.layout62:setWidth(206);
    obj.layout62:setHeight(20);
    obj.layout62:setName("layout62");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout62);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(12.8);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(206);
    obj.edit32:setHeight(21);
    obj.edit32:setField("NOME_9");
    obj.edit32:setName("edit32");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(661);
    obj.layout63:setTop(957);
    obj.layout63:setWidth(205);
    obj.layout63:setHeight(20);
    obj.layout63:setName("layout63");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout63);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(12.8);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(205);
    obj.edit33:setHeight(21);
    obj.edit33:setField("NOME_10");
    obj.edit33:setName("edit33");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(105);
    obj.layout64:setTop(979);
    obj.layout64:setWidth(76);
    obj.layout64:setHeight(41);
    obj.layout64:setName("layout64");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout64);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(14.2);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(76);
    obj.edit34:setHeight(42);
    obj.edit34:setField("ANEL_MAESTRIA_4");
    obj.edit34:setName("edit34");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(234);
    obj.layout65:setTop(978);
    obj.layout65:setWidth(76);
    obj.layout65:setHeight(42);
    obj.layout65:setName("layout65");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout65);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(14.2);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(76);
    obj.edit35:setHeight(43);
    obj.edit35:setField("DURAÇÃO_7");
    obj.edit35:setName("edit35");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(382);
    obj.layout66:setTop(979);
    obj.layout66:setWidth(76);
    obj.layout66:setHeight(41);
    obj.layout66:setName("layout66");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout66);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(14.2);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("leading");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(76);
    obj.edit36:setHeight(42);
    obj.edit36:setField("ANEL_MAESTRIA_5");
    obj.edit36:setName("edit36");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(512);
    obj.layout67:setTop(979);
    obj.layout67:setWidth(76);
    obj.layout67:setHeight(41);
    obj.layout67:setName("layout67");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout67);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(14.2);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("leading");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(76);
    obj.edit37:setHeight(42);
    obj.edit37:setField("DURAÇÃO_8");
    obj.edit37:setName("edit37");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(661);
    obj.layout68:setTop(979);
    obj.layout68:setWidth(76);
    obj.layout68:setHeight(41);
    obj.layout68:setName("layout68");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout68);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(14.2);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("leading");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(76);
    obj.edit38:setHeight(42);
    obj.edit38:setField("ANEL_MAESTRIA_6");
    obj.edit38:setName("edit38");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(790);
    obj.layout69:setTop(979);
    obj.layout69:setWidth(76);
    obj.layout69:setHeight(41);
    obj.layout69:setName("layout69");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout69);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(14.2);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("leading");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(76);
    obj.edit39:setHeight(42);
    obj.edit39:setField("DURAÇÃO_9");
    obj.edit39:setName("edit39");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(104);
    obj.layout70:setTop(1021);
    obj.layout70:setWidth(206);
    obj.layout70:setHeight(28);
    obj.layout70:setName("layout70");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout70);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(14.2);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("leading");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(206);
    obj.edit40:setHeight(29);
    obj.edit40:setField("EFEITO_22");
    obj.edit40:setName("edit40");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(383);
    obj.layout71:setTop(1021);
    obj.layout71:setWidth(206);
    obj.layout71:setHeight(28);
    obj.layout71:setName("layout71");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout71);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(14.2);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("leading");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(206);
    obj.edit41:setHeight(29);
    obj.edit41:setField("EFEITO_23");
    obj.edit41:setName("edit41");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(661);
    obj.layout72:setTop(1021);
    obj.layout72:setWidth(206);
    obj.layout72:setHeight(28);
    obj.layout72:setName("layout72");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout72);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(14.2);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(206);
    obj.edit42:setHeight(29);
    obj.edit42:setField("EFEITO_24");
    obj.edit42:setName("edit42");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(105);
    obj.layout73:setTop(1054);
    obj.layout73:setWidth(205);
    obj.layout73:setHeight(20);
    obj.layout73:setName("layout73");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout73);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(12.8);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("leading");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(205);
    obj.edit43:setHeight(21);
    obj.edit43:setField("NOME_11");
    obj.edit43:setName("edit43");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(383);
    obj.layout74:setTop(1054);
    obj.layout74:setWidth(205);
    obj.layout74:setHeight(20);
    obj.layout74:setName("layout74");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout74);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(12.8);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setHorzTextAlign("leading");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(205);
    obj.edit44:setHeight(21);
    obj.edit44:setField("NOME_12");
    obj.edit44:setName("edit44");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(661);
    obj.layout75:setTop(1054);
    obj.layout75:setWidth(206);
    obj.layout75:setHeight(20);
    obj.layout75:setName("layout75");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout75);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(12.8);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("leading");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(206);
    obj.edit45:setHeight(21);
    obj.edit45:setField("NOME_13");
    obj.edit45:setName("edit45");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(104);
    obj.layout76:setTop(1075);
    obj.layout76:setWidth(76);
    obj.layout76:setHeight(41);
    obj.layout76:setName("layout76");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout76);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(14.2);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(76);
    obj.edit46:setHeight(42);
    obj.edit46:setField("ANEL_MAESTRIA_7");
    obj.edit46:setName("edit46");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(234);
    obj.layout77:setTop(1075);
    obj.layout77:setWidth(76);
    obj.layout77:setHeight(41);
    obj.layout77:setName("layout77");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout77);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(14.2);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("leading");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(76);
    obj.edit47:setHeight(42);
    obj.edit47:setField("DURAÇÃO_10");
    obj.edit47:setName("edit47");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(382);
    obj.layout78:setTop(1075);
    obj.layout78:setWidth(76);
    obj.layout78:setHeight(41);
    obj.layout78:setName("layout78");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout78);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(14.2);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("leading");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(76);
    obj.edit48:setHeight(42);
    obj.edit48:setField("ANEL_MAESTRIA_8");
    obj.edit48:setName("edit48");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(512);
    obj.layout79:setTop(1075);
    obj.layout79:setWidth(76);
    obj.layout79:setHeight(41);
    obj.layout79:setName("layout79");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout79);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(14.2);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("leading");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(76);
    obj.edit49:setHeight(42);
    obj.edit49:setField("DURAÇÃO_11");
    obj.edit49:setName("edit49");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(660);
    obj.layout80:setTop(1075);
    obj.layout80:setWidth(76);
    obj.layout80:setHeight(41);
    obj.layout80:setName("layout80");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout80);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(14.2);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setHorzTextAlign("leading");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(76);
    obj.edit50:setHeight(42);
    obj.edit50:setField("ANEL_MAESTRIA_9");
    obj.edit50:setName("edit50");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(790);
    obj.layout81:setTop(1075);
    obj.layout81:setWidth(76);
    obj.layout81:setHeight(41);
    obj.layout81:setName("layout81");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout81);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(14.2);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setHorzTextAlign("leading");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(76);
    obj.edit51:setHeight(42);
    obj.edit51:setField("DURAÇÃO_12");
    obj.edit51:setName("edit51");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(105);
    obj.layout82:setTop(1117);
    obj.layout82:setWidth(206);
    obj.layout82:setHeight(31);
    obj.layout82:setName("layout82");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout82);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(14.2);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("leading");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(206);
    obj.edit52:setHeight(32);
    obj.edit52:setField("EFEITO_25");
    obj.edit52:setName("edit52");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(382);
    obj.layout83:setTop(1117);
    obj.layout83:setWidth(206);
    obj.layout83:setHeight(31);
    obj.layout83:setName("layout83");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout83);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(14.2);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(206);
    obj.edit53:setHeight(32);
    obj.edit53:setField("EFEITO_26");
    obj.edit53:setName("edit53");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(661);
    obj.layout84:setTop(1117);
    obj.layout84:setWidth(205);
    obj.layout84:setHeight(31);
    obj.layout84:setName("layout84");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout84);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(14.2);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("leading");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(205);
    obj.edit54:setHeight(32);
    obj.edit54:setField("EFEITO_27");
    obj.edit54:setName("edit54");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmL5A3_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmL5A3_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmL5A3_svg = {
    newEditor = newfrmL5A3_svg, 
    new = newfrmL5A3_svg, 
    name = "frmL5A3_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmL5A3_svg = _frmL5A3_svg;
Firecast.registrarForm(_frmL5A3_svg);

return _frmL5A3_svg;
