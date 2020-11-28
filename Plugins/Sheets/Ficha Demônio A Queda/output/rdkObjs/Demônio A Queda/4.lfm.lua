require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmkpta4_svg()
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
    obj:setName("frmkpta4_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(893);
    obj.rectangle1:setHeight(1263);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(893);
    obj.image1:setHeight(1263);
    obj.image1:setSRC("/Demônio A Queda/images/rel.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(107);
    obj.layout1:setTop(194);
    obj.layout1:setWidth(237);
    obj.layout1:setHeight(19);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(237);
    obj.edit1:setHeight(20);
    obj.edit1:setField("Relíquias__Nome_1");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(385);
    obj.layout2:setTop(194);
    obj.layout2:setWidth(167);
    obj.layout2:setHeight(19);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(14);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(167);
    obj.edit2:setHeight(20);
    obj.edit2:setField("Relíquias__Tipo_1");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(107);
    obj.layout3:setTop(323);
    obj.layout3:setWidth(237);
    obj.layout3:setHeight(20);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(14);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(237);
    obj.edit3:setHeight(20);
    obj.edit3:setField("Relíquias__Nome_2");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(385);
    obj.layout4:setTop(323);
    obj.layout4:setWidth(167);
    obj.layout4:setHeight(19);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(14);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(167);
    obj.edit4:setHeight(20);
    obj.edit4:setField("Relíquias__Tipo_2");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(107);
    obj.layout5:setTop(453);
    obj.layout5:setWidth(237);
    obj.layout5:setHeight(19);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(14);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(237);
    obj.edit5:setHeight(20);
    obj.edit5:setField("Relíquias__Nome_3");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(385);
    obj.layout6:setTop(453);
    obj.layout6:setWidth(167);
    obj.layout6:setHeight(19);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(14);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(167);
    obj.edit6:setHeight(20);
    obj.edit6:setField("Relíquias__Tipo_3");
    obj.edit6:setName("edit6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(706);
    obj.layout7:setTop(193);
    obj.layout7:setWidth(18);
    obj.layout7:setHeight(23);
    obj.layout7:setName("layout7");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout7);
    obj.imageCheckBox1:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox1:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox1:setLeft(0);
    obj.imageCheckBox1:setTop(0);
    obj.imageCheckBox1:setWidth(18);
    obj.imageCheckBox1:setHeight(24);
    obj.imageCheckBox1:setField("Relíquias__Dout__Nec__1A");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(720);
    obj.layout8:setTop(193);
    obj.layout8:setWidth(18);
    obj.layout8:setHeight(23);
    obj.layout8:setName("layout8");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout8);
    obj.imageCheckBox2:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox2:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox2:setLeft(0);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(18);
    obj.imageCheckBox2:setHeight(24);
    obj.imageCheckBox2:setField("Relíquias__Dout__Nec__1B");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(734);
    obj.layout9:setTop(193);
    obj.layout9:setWidth(18);
    obj.layout9:setHeight(23);
    obj.layout9:setName("layout9");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout9);
    obj.imageCheckBox3:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox3:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox3:setLeft(0);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(18);
    obj.imageCheckBox3:setHeight(24);
    obj.imageCheckBox3:setField("Relíquias__Dout__Nec__1C");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(747);
    obj.layout10:setTop(193);
    obj.layout10:setWidth(18);
    obj.layout10:setHeight(23);
    obj.layout10:setName("layout10");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout10);
    obj.imageCheckBox4:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox4:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox4:setLeft(0);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(18);
    obj.imageCheckBox4:setHeight(24);
    obj.imageCheckBox4:setField("Relíquias__Dout__Nec__1D");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(761);
    obj.layout11:setTop(193);
    obj.layout11:setWidth(18);
    obj.layout11:setHeight(23);
    obj.layout11:setName("layout11");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout11);
    obj.imageCheckBox5:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox5:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox5:setLeft(0);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(18);
    obj.imageCheckBox5:setHeight(24);
    obj.imageCheckBox5:setField("Relíquias__Dout__Nec__1E");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(782);
    obj.layout12:setTop(193);
    obj.layout12:setWidth(18);
    obj.layout12:setHeight(23);
    obj.layout12:setName("layout12");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout12);
    obj.imageCheckBox6:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox6:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox6:setLeft(0);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(18);
    obj.imageCheckBox6:setHeight(24);
    obj.imageCheckBox6:setField("Relíquias__Dout__Nec__1F");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(796);
    obj.layout13:setTop(193);
    obj.layout13:setWidth(18);
    obj.layout13:setHeight(23);
    obj.layout13:setName("layout13");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout13);
    obj.imageCheckBox7:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox7:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox7:setLeft(0);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(18);
    obj.imageCheckBox7:setHeight(24);
    obj.imageCheckBox7:setField("Relíquias__Dout__Nec__1G");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(810);
    obj.layout14:setTop(193);
    obj.layout14:setWidth(18);
    obj.layout14:setHeight(23);
    obj.layout14:setName("layout14");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout14);
    obj.imageCheckBox8:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox8:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox8:setLeft(0);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(18);
    obj.imageCheckBox8:setHeight(24);
    obj.imageCheckBox8:setField("Relíquias__Dout__Nec__1H");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(139);
    obj.layout15:setTop(216);
    obj.layout15:setWidth(687);
    obj.layout15:setHeight(40);
    obj.layout15:setName("layout15");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout15);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(14);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(687);
    obj.textEditor1:setHeight(40);
    obj.textEditor1:setField("Relíquias__Descrição_1");
    obj.textEditor1:setName("textEditor1");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(124);
    obj.layout16:setTop(257);
    obj.layout16:setWidth(701);
    obj.layout16:setHeight(40);
    obj.layout16:setName("layout16");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout16);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(14);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(701);
    obj.textEditor2:setHeight(40);
    obj.textEditor2:setField("Relíquias__Sistema_1");
    obj.textEditor2:setName("textEditor2");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(706);
    obj.layout17:setTop(322);
    obj.layout17:setWidth(18);
    obj.layout17:setHeight(23);
    obj.layout17:setName("layout17");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout17);
    obj.imageCheckBox9:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox9:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox9:setLeft(0);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(18);
    obj.imageCheckBox9:setHeight(24);
    obj.imageCheckBox9:setField("Relíquias__Dout__Nec__2A");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(720);
    obj.layout18:setTop(322);
    obj.layout18:setWidth(18);
    obj.layout18:setHeight(23);
    obj.layout18:setName("layout18");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout18);
    obj.imageCheckBox10:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox10:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox10:setLeft(0);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(18);
    obj.imageCheckBox10:setHeight(24);
    obj.imageCheckBox10:setField("Relíquias__Dout__Nec__2B");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(734);
    obj.layout19:setTop(322);
    obj.layout19:setWidth(18);
    obj.layout19:setHeight(23);
    obj.layout19:setName("layout19");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout19);
    obj.imageCheckBox11:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox11:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox11:setLeft(0);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(18);
    obj.imageCheckBox11:setHeight(24);
    obj.imageCheckBox11:setField("Relíquias__Dout__Nec__2C");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(747);
    obj.layout20:setTop(322);
    obj.layout20:setWidth(18);
    obj.layout20:setHeight(23);
    obj.layout20:setName("layout20");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout20);
    obj.imageCheckBox12:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox12:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox12:setLeft(0);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(18);
    obj.imageCheckBox12:setHeight(24);
    obj.imageCheckBox12:setField("Relíquias__Dout__Nec__2D");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(761);
    obj.layout21:setTop(322);
    obj.layout21:setWidth(18);
    obj.layout21:setHeight(23);
    obj.layout21:setName("layout21");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout21);
    obj.imageCheckBox13:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox13:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox13:setLeft(0);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(18);
    obj.imageCheckBox13:setHeight(24);
    obj.imageCheckBox13:setField("Relíquias__Dout__Nec__2E");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(782);
    obj.layout22:setTop(322);
    obj.layout22:setWidth(18);
    obj.layout22:setHeight(23);
    obj.layout22:setName("layout22");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout22);
    obj.imageCheckBox14:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox14:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox14:setLeft(0);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(18);
    obj.imageCheckBox14:setHeight(24);
    obj.imageCheckBox14:setField("Relíquias__Dout__Nec__2F");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(797);
    obj.layout23:setTop(322);
    obj.layout23:setWidth(18);
    obj.layout23:setHeight(23);
    obj.layout23:setName("layout23");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout23);
    obj.imageCheckBox15:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox15:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox15:setLeft(0);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(18);
    obj.imageCheckBox15:setHeight(24);
    obj.imageCheckBox15:setField("Relíquias__Dout__Nec__2G");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(810);
    obj.layout24:setTop(322);
    obj.layout24:setWidth(18);
    obj.layout24:setHeight(23);
    obj.layout24:setName("layout24");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout24);
    obj.imageCheckBox16:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox16:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox16:setLeft(0);
    obj.imageCheckBox16:setTop(0);
    obj.imageCheckBox16:setWidth(18);
    obj.imageCheckBox16:setHeight(24);
    obj.imageCheckBox16:setField("Relíquias__Dout__Nec__2H");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(139);
    obj.layout25:setTop(345);
    obj.layout25:setWidth(687);
    obj.layout25:setHeight(40);
    obj.layout25:setName("layout25");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout25);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontSize(14);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(687);
    obj.textEditor3:setHeight(40);
    obj.textEditor3:setField("Relíquias__Descrição_2");
    obj.textEditor3:setName("textEditor3");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(125);
    obj.layout26:setTop(387);
    obj.layout26:setWidth(701);
    obj.layout26:setHeight(40);
    obj.layout26:setName("layout26");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout26);
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setFontSize(14);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(701);
    obj.textEditor4:setHeight(40);
    obj.textEditor4:setField("Relíquias__Sistema_2");
    obj.textEditor4:setName("textEditor4");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(706);
    obj.layout27:setTop(451);
    obj.layout27:setWidth(18);
    obj.layout27:setHeight(23);
    obj.layout27:setName("layout27");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout27);
    obj.imageCheckBox17:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox17:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox17:setLeft(0);
    obj.imageCheckBox17:setTop(0);
    obj.imageCheckBox17:setWidth(18);
    obj.imageCheckBox17:setHeight(24);
    obj.imageCheckBox17:setField("Relíquias__Dout__Nec__3A");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(720);
    obj.layout28:setTop(451);
    obj.layout28:setWidth(18);
    obj.layout28:setHeight(23);
    obj.layout28:setName("layout28");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout28);
    obj.imageCheckBox18:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox18:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox18:setLeft(0);
    obj.imageCheckBox18:setTop(0);
    obj.imageCheckBox18:setWidth(18);
    obj.imageCheckBox18:setHeight(24);
    obj.imageCheckBox18:setField("Relíquias__Dout__Nec__3B");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(734);
    obj.layout29:setTop(451);
    obj.layout29:setWidth(18);
    obj.layout29:setHeight(23);
    obj.layout29:setName("layout29");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout29);
    obj.imageCheckBox19:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox19:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox19:setLeft(0);
    obj.imageCheckBox19:setTop(0);
    obj.imageCheckBox19:setWidth(18);
    obj.imageCheckBox19:setHeight(24);
    obj.imageCheckBox19:setField("Relíquias__Dout__Nec__3C");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(747);
    obj.layout30:setTop(451);
    obj.layout30:setWidth(18);
    obj.layout30:setHeight(23);
    obj.layout30:setName("layout30");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout30);
    obj.imageCheckBox20:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox20:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox20:setLeft(0);
    obj.imageCheckBox20:setTop(0);
    obj.imageCheckBox20:setWidth(18);
    obj.imageCheckBox20:setHeight(24);
    obj.imageCheckBox20:setField("Relíquias__Dout__Nec__3D");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(761);
    obj.layout31:setTop(451);
    obj.layout31:setWidth(18);
    obj.layout31:setHeight(23);
    obj.layout31:setName("layout31");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout31);
    obj.imageCheckBox21:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox21:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox21:setLeft(0);
    obj.imageCheckBox21:setTop(0);
    obj.imageCheckBox21:setWidth(18);
    obj.imageCheckBox21:setHeight(24);
    obj.imageCheckBox21:setField("Relíquias__Dout__Nec__3E");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(782);
    obj.layout32:setTop(451);
    obj.layout32:setWidth(18);
    obj.layout32:setHeight(23);
    obj.layout32:setName("layout32");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout32);
    obj.imageCheckBox22:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox22:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox22:setLeft(0);
    obj.imageCheckBox22:setTop(0);
    obj.imageCheckBox22:setWidth(18);
    obj.imageCheckBox22:setHeight(24);
    obj.imageCheckBox22:setField("Relíquias__Dout__Nec__3F");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(797);
    obj.layout33:setTop(451);
    obj.layout33:setWidth(18);
    obj.layout33:setHeight(23);
    obj.layout33:setName("layout33");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout33);
    obj.imageCheckBox23:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox23:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox23:setLeft(0);
    obj.imageCheckBox23:setTop(0);
    obj.imageCheckBox23:setWidth(18);
    obj.imageCheckBox23:setHeight(24);
    obj.imageCheckBox23:setField("Relíquias__Dout__Nec__3G");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(810);
    obj.layout34:setTop(451);
    obj.layout34:setWidth(18);
    obj.layout34:setHeight(23);
    obj.layout34:setName("layout34");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout34);
    obj.imageCheckBox24:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox24:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox24:setLeft(0);
    obj.imageCheckBox24:setTop(0);
    obj.imageCheckBox24:setWidth(18);
    obj.imageCheckBox24:setHeight(24);
    obj.imageCheckBox24:setField("Relíquias__Dout__Nec__3H");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(139);
    obj.layout35:setTop(474);
    obj.layout35:setWidth(687);
    obj.layout35:setHeight(40);
    obj.layout35:setName("layout35");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout35);
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setFontSize(14);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(687);
    obj.textEditor5:setHeight(40);
    obj.textEditor5:setField("Relíquias__Descrição_3");
    obj.textEditor5:setName("textEditor5");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(124);
    obj.layout36:setTop(516);
    obj.layout36:setWidth(701);
    obj.layout36:setHeight(40);
    obj.layout36:setName("layout36");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout36);
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setFontSize(14);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(701);
    obj.textEditor6:setHeight(40);
    obj.textEditor6:setField("Relíquias__Sistema_3");
    obj.textEditor6:setName("textEditor6");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(107);
    obj.layout37:setTop(603);
    obj.layout37:setWidth(328);
    obj.layout37:setHeight(19);
    obj.layout37:setName("layout37");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout37);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(14);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(328);
    obj.edit7:setHeight(20);
    obj.edit7:setField("Ritual__Nome_1");
    obj.edit7:setName("edit7");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(469);
    obj.layout38:setTop(917);
    obj.layout38:setWidth(18);
    obj.layout38:setHeight(23);
    obj.layout38:setName("layout38");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout38);
    obj.imageCheckBox25:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox25:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox25:setLeft(0);
    obj.imageCheckBox25:setTop(0);
    obj.imageCheckBox25:setWidth(18);
    obj.imageCheckBox25:setHeight(24);
    obj.imageCheckBox25:setField("Ritual_Expandido__Primária_1");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(482);
    obj.layout39:setTop(917);
    obj.layout39:setWidth(18);
    obj.layout39:setHeight(23);
    obj.layout39:setName("layout39");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout39);
    obj.imageCheckBox26:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox26:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox26:setLeft(0);
    obj.imageCheckBox26:setTop(0);
    obj.imageCheckBox26:setWidth(18);
    obj.imageCheckBox26:setHeight(24);
    obj.imageCheckBox26:setField("Ritual_Expandido__Primária_2");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(496);
    obj.layout40:setTop(917);
    obj.layout40:setWidth(18);
    obj.layout40:setHeight(23);
    obj.layout40:setName("layout40");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout40);
    obj.imageCheckBox27:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox27:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox27:setLeft(0);
    obj.imageCheckBox27:setTop(0);
    obj.imageCheckBox27:setWidth(18);
    obj.imageCheckBox27:setHeight(24);
    obj.imageCheckBox27:setField("Ritual_Expandido__Primária_3");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(510);
    obj.layout41:setTop(917);
    obj.layout41:setWidth(18);
    obj.layout41:setHeight(23);
    obj.layout41:setName("layout41");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout41);
    obj.imageCheckBox28:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox28:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox28:setLeft(0);
    obj.imageCheckBox28:setTop(0);
    obj.imageCheckBox28:setWidth(18);
    obj.imageCheckBox28:setHeight(24);
    obj.imageCheckBox28:setField("Ritual_Expandido__Primária_4");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(523);
    obj.layout42:setTop(917);
    obj.layout42:setWidth(18);
    obj.layout42:setHeight(23);
    obj.layout42:setName("layout42");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout42);
    obj.imageCheckBox29:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox29:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox29:setLeft(0);
    obj.imageCheckBox29:setTop(0);
    obj.imageCheckBox29:setWidth(18);
    obj.imageCheckBox29:setHeight(24);
    obj.imageCheckBox29:setField("Ritual_Expandido__Primária_5");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(545);
    obj.layout43:setTop(917);
    obj.layout43:setWidth(18);
    obj.layout43:setHeight(23);
    obj.layout43:setName("layout43");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout43);
    obj.imageCheckBox30:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox30:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox30:setLeft(0);
    obj.imageCheckBox30:setTop(0);
    obj.imageCheckBox30:setWidth(18);
    obj.imageCheckBox30:setHeight(24);
    obj.imageCheckBox30:setField("Ritual_Expandido__Primária_6");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(558);
    obj.layout44:setTop(917);
    obj.layout44:setWidth(18);
    obj.layout44:setHeight(23);
    obj.layout44:setName("layout44");

    obj.imageCheckBox31 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout44);
    obj.imageCheckBox31:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox31:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox31:setLeft(0);
    obj.imageCheckBox31:setTop(0);
    obj.imageCheckBox31:setWidth(18);
    obj.imageCheckBox31:setHeight(24);
    obj.imageCheckBox31:setField("Ritual_Expandido__Primária_7");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(572);
    obj.layout45:setTop(917);
    obj.layout45:setWidth(18);
    obj.layout45:setHeight(23);
    obj.layout45:setName("layout45");

    obj.imageCheckBox32 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout45);
    obj.imageCheckBox32:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox32:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox32:setLeft(0);
    obj.imageCheckBox32:setTop(0);
    obj.imageCheckBox32:setWidth(18);
    obj.imageCheckBox32:setHeight(24);
    obj.imageCheckBox32:setField("Ritual_Expandido__Primária_8");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(502);
    obj.layout46:setTop(603);
    obj.layout46:setWidth(328);
    obj.layout46:setHeight(19);
    obj.layout46:setName("layout46");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout46);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(14);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(328);
    obj.edit8:setHeight(20);
    obj.edit8:setField("Ritual__Nome_2");
    obj.edit8:setName("edit8");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(501);
    obj.layout47:setTop(672);
    obj.layout47:setWidth(328);
    obj.layout47:setHeight(19);
    obj.layout47:setName("layout47");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout47);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(14);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(328);
    obj.edit9:setHeight(20);
    obj.edit9:setField("Ritual__Nome_4");
    obj.edit9:setName("edit9");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(107);
    obj.layout48:setTop(733);
    obj.layout48:setWidth(328);
    obj.layout48:setHeight(19);
    obj.layout48:setName("layout48");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout48);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(14);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(328);
    obj.edit10:setHeight(20);
    obj.edit10:setField("Ritual__Nome_5");
    obj.edit10:setName("edit10");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(502);
    obj.layout49:setTop(733);
    obj.layout49:setWidth(328);
    obj.layout49:setHeight(19);
    obj.layout49:setName("layout49");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout49);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(14);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(328);
    obj.edit11:setHeight(20);
    obj.edit11:setField("Ritual__Nome_6");
    obj.edit11:setName("edit11");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(108);
    obj.layout50:setTop(625);
    obj.layout50:setWidth(226);
    obj.layout50:setHeight(19);
    obj.layout50:setName("layout50");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout50);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(14);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(226);
    obj.edit12:setHeight(20);
    obj.edit12:setField("Ritual__Livro_1");
    obj.edit12:setName("edit12");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(392);
    obj.layout51:setTop(625);
    obj.layout51:setWidth(37);
    obj.layout51:setHeight(19);
    obj.layout51:setName("layout51");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout51);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(14);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(37);
    obj.edit13:setHeight(20);
    obj.edit13:setField("Ritual__Página_1");
    obj.edit13:setName("edit13");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(107);
    obj.layout52:setTop(672);
    obj.layout52:setWidth(328);
    obj.layout52:setHeight(19);
    obj.layout52:setName("layout52");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout52);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(14);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(328);
    obj.edit14:setHeight(20);
    obj.edit14:setField("Ritual__Nome_3");
    obj.edit14:setName("edit14");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(502);
    obj.layout53:setTop(625);
    obj.layout53:setWidth(226);
    obj.layout53:setHeight(19);
    obj.layout53:setName("layout53");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout53);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(14);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(226);
    obj.edit15:setHeight(20);
    obj.edit15:setField("Ritual__Livro_2");
    obj.edit15:setName("edit15");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(786);
    obj.layout54:setTop(625);
    obj.layout54:setWidth(37);
    obj.layout54:setHeight(19);
    obj.layout54:setName("layout54");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout54);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(14);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(37);
    obj.edit16:setHeight(20);
    obj.edit16:setField("Ritual__Página_2");
    obj.edit16:setName("edit16");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(107);
    obj.layout55:setTop(694);
    obj.layout55:setWidth(226);
    obj.layout55:setHeight(19);
    obj.layout55:setName("layout55");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout55);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(14);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(226);
    obj.edit17:setHeight(20);
    obj.edit17:setField("Ritual__Livro_3");
    obj.edit17:setName("edit17");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(391);
    obj.layout56:setTop(694);
    obj.layout56:setWidth(37);
    obj.layout56:setHeight(19);
    obj.layout56:setName("layout56");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout56);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(14);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(37);
    obj.edit18:setHeight(20);
    obj.edit18:setField("Ritual__Página_3");
    obj.edit18:setName("edit18");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(501);
    obj.layout57:setTop(694);
    obj.layout57:setWidth(226);
    obj.layout57:setHeight(19);
    obj.layout57:setName("layout57");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout57);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(14);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(226);
    obj.edit19:setHeight(20);
    obj.edit19:setField("Ritual__Livro_4");
    obj.edit19:setName("edit19");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(785);
    obj.layout58:setTop(694);
    obj.layout58:setWidth(37);
    obj.layout58:setHeight(19);
    obj.layout58:setName("layout58");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout58);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(14);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(37);
    obj.edit20:setHeight(20);
    obj.edit20:setField("Ritual__Página_4");
    obj.edit20:setName("edit20");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(107);
    obj.layout59:setTop(755);
    obj.layout59:setWidth(226);
    obj.layout59:setHeight(19);
    obj.layout59:setName("layout59");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout59);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(14);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(226);
    obj.edit21:setHeight(20);
    obj.edit21:setField("Ritual__Livro_5");
    obj.edit21:setName("edit21");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(191);
    obj.layout60:setTop(810);
    obj.layout60:setWidth(202);
    obj.layout60:setHeight(19);
    obj.layout60:setName("layout60");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout60);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(14);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(202);
    obj.edit22:setHeight(20);
    obj.edit22:setField("Ritual_Expandido__Nome");
    obj.edit22:setName("edit22");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(441);
    obj.layout61:setTop(810);
    obj.layout61:setWidth(45);
    obj.layout61:setHeight(19);
    obj.layout61:setName("layout61");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout61);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(14);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(45);
    obj.edit23:setHeight(20);
    obj.edit23:setField("Ritual_Expandido__Custo");
    obj.edit23:setName("edit23");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(697);
    obj.layout62:setTop(811);
    obj.layout62:setWidth(45);
    obj.layout62:setHeight(19);
    obj.layout62:setName("layout62");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout62);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(14);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(45);
    obj.edit24:setHeight(20);
    obj.edit24:setField("Ritual_Expandido__Tempo");
    obj.edit24:setName("edit24");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(392);
    obj.layout63:setTop(755);
    obj.layout63:setWidth(37);
    obj.layout63:setHeight(19);
    obj.layout63:setName("layout63");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout63);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(14);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(37);
    obj.edit25:setHeight(20);
    obj.edit25:setField("Ritual__Página_5");
    obj.edit25:setName("edit25");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(502);
    obj.layout64:setTop(755);
    obj.layout64:setWidth(226);
    obj.layout64:setHeight(19);
    obj.layout64:setName("layout64");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout64);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(14);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(226);
    obj.edit26:setHeight(20);
    obj.edit26:setField("Ritual__Livro_6");
    obj.edit26:setName("edit26");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(68);
    obj.layout65:setTop(854);
    obj.layout65:setWidth(757);
    obj.layout65:setHeight(19);
    obj.layout65:setName("layout65");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout65);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(14);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(757);
    obj.edit27:setHeight(20);
    obj.edit27:setField("Ritual_Expandido__Restrições");
    obj.edit27:setName("edit27");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(304);
    obj.layout66:setTop(918);
    obj.layout66:setWidth(170);
    obj.layout66:setHeight(19);
    obj.layout66:setName("layout66");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout66);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(14);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(170);
    obj.edit28:setHeight(20);
    obj.edit28:setField("Ritual_Expandido__Doutrina_Primária");
    obj.edit28:setName("edit28");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(67);
    obj.layout67:setTop(961);
    obj.layout67:setWidth(124);
    obj.layout67:setHeight(60);
    obj.layout67:setName("layout67");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout67);
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setFontSize(14);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(124);
    obj.textEditor7:setHeight(60);
    obj.textEditor7:setField("Ritual_Expandido__Doutrina_Secundária_1");
    obj.textEditor7:setName("textEditor7");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(185);
    obj.layout68:setTop(960);
    obj.layout68:setWidth(18);
    obj.layout68:setHeight(23);
    obj.layout68:setName("layout68");

    obj.imageCheckBox33 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout68);
    obj.imageCheckBox33:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox33:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox33:setLeft(0);
    obj.imageCheckBox33:setTop(0);
    obj.imageCheckBox33:setWidth(18);
    obj.imageCheckBox33:setHeight(24);
    obj.imageCheckBox33:setField("Ritual_Expandido__Secundária_1A");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(199);
    obj.layout69:setTop(960);
    obj.layout69:setWidth(18);
    obj.layout69:setHeight(23);
    obj.layout69:setName("layout69");

    obj.imageCheckBox34 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout69);
    obj.imageCheckBox34:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox34:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox34:setLeft(0);
    obj.imageCheckBox34:setTop(0);
    obj.imageCheckBox34:setWidth(18);
    obj.imageCheckBox34:setHeight(24);
    obj.imageCheckBox34:setField("Ritual_Expandido__Secundária_1B");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(212);
    obj.layout70:setTop(960);
    obj.layout70:setWidth(18);
    obj.layout70:setHeight(23);
    obj.layout70:setName("layout70");

    obj.imageCheckBox35 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout70);
    obj.imageCheckBox35:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox35:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox35:setLeft(0);
    obj.imageCheckBox35:setTop(0);
    obj.imageCheckBox35:setWidth(18);
    obj.imageCheckBox35:setHeight(24);
    obj.imageCheckBox35:setField("Ritual_Expandido__Secundária_1C");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(226);
    obj.layout71:setTop(960);
    obj.layout71:setWidth(18);
    obj.layout71:setHeight(23);
    obj.layout71:setName("layout71");

    obj.imageCheckBox36 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout71);
    obj.imageCheckBox36:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox36:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox36:setLeft(0);
    obj.imageCheckBox36:setTop(0);
    obj.imageCheckBox36:setWidth(18);
    obj.imageCheckBox36:setHeight(24);
    obj.imageCheckBox36:setField("Ritual_Expandido__Secundária_1D");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(240);
    obj.layout72:setTop(960);
    obj.layout72:setWidth(18);
    obj.layout72:setHeight(23);
    obj.layout72:setName("layout72");

    obj.imageCheckBox37 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout72);
    obj.imageCheckBox37:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox37:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox37:setLeft(0);
    obj.imageCheckBox37:setTop(0);
    obj.imageCheckBox37:setWidth(18);
    obj.imageCheckBox37:setHeight(24);
    obj.imageCheckBox37:setField("Ritual_Expandido__Secundária_1E");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(261);
    obj.layout73:setTop(960);
    obj.layout73:setWidth(18);
    obj.layout73:setHeight(23);
    obj.layout73:setName("layout73");

    obj.imageCheckBox38 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout73);
    obj.imageCheckBox38:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox38:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox38:setLeft(0);
    obj.imageCheckBox38:setTop(0);
    obj.imageCheckBox38:setWidth(18);
    obj.imageCheckBox38:setHeight(24);
    obj.imageCheckBox38:setField("Ritual_Expandido__Secundária_1F");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(275);
    obj.layout74:setTop(960);
    obj.layout74:setWidth(18);
    obj.layout74:setHeight(23);
    obj.layout74:setName("layout74");

    obj.imageCheckBox39 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout74);
    obj.imageCheckBox39:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox39:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox39:setLeft(0);
    obj.imageCheckBox39:setTop(0);
    obj.imageCheckBox39:setWidth(18);
    obj.imageCheckBox39:setHeight(24);
    obj.imageCheckBox39:setField("Ritual_Expandido__Secundária_1G");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(289);
    obj.layout75:setTop(960);
    obj.layout75:setWidth(18);
    obj.layout75:setHeight(23);
    obj.layout75:setName("layout75");

    obj.imageCheckBox40 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout75);
    obj.imageCheckBox40:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox40:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox40:setLeft(0);
    obj.imageCheckBox40:setTop(0);
    obj.imageCheckBox40:setWidth(18);
    obj.imageCheckBox40:setHeight(24);
    obj.imageCheckBox40:setField("Ritual_Expandido__Secundária_1H");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(440);
    obj.layout76:setTop(960);
    obj.layout76:setWidth(18);
    obj.layout76:setHeight(23);
    obj.layout76:setName("layout76");

    obj.imageCheckBox41 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout76);
    obj.imageCheckBox41:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox41:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox41:setLeft(0);
    obj.imageCheckBox41:setTop(0);
    obj.imageCheckBox41:setWidth(18);
    obj.imageCheckBox41:setHeight(24);
    obj.imageCheckBox41:setField("Ritual_Expandido__Secundária_2A");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(454);
    obj.layout77:setTop(960);
    obj.layout77:setWidth(18);
    obj.layout77:setHeight(23);
    obj.layout77:setName("layout77");

    obj.imageCheckBox42 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout77);
    obj.imageCheckBox42:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox42:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox42:setLeft(0);
    obj.imageCheckBox42:setTop(0);
    obj.imageCheckBox42:setWidth(18);
    obj.imageCheckBox42:setHeight(24);
    obj.imageCheckBox42:setField("Ritual_Expandido__Secundária_2B");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(467);
    obj.layout78:setTop(960);
    obj.layout78:setWidth(18);
    obj.layout78:setHeight(23);
    obj.layout78:setName("layout78");

    obj.imageCheckBox43 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox43:setParent(obj.layout78);
    obj.imageCheckBox43:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox43:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox43:setLeft(0);
    obj.imageCheckBox43:setTop(0);
    obj.imageCheckBox43:setWidth(18);
    obj.imageCheckBox43:setHeight(24);
    obj.imageCheckBox43:setField("Ritual_Expandido__Secundária_2C");
    obj.imageCheckBox43:setName("imageCheckBox43");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(481);
    obj.layout79:setTop(960);
    obj.layout79:setWidth(18);
    obj.layout79:setHeight(23);
    obj.layout79:setName("layout79");

    obj.imageCheckBox44 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox44:setParent(obj.layout79);
    obj.imageCheckBox44:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox44:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox44:setLeft(0);
    obj.imageCheckBox44:setTop(0);
    obj.imageCheckBox44:setWidth(18);
    obj.imageCheckBox44:setHeight(24);
    obj.imageCheckBox44:setField("Ritual_Expandido__Secundária_2D");
    obj.imageCheckBox44:setName("imageCheckBox44");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(495);
    obj.layout80:setTop(960);
    obj.layout80:setWidth(18);
    obj.layout80:setHeight(23);
    obj.layout80:setName("layout80");

    obj.imageCheckBox45 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox45:setParent(obj.layout80);
    obj.imageCheckBox45:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox45:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox45:setLeft(0);
    obj.imageCheckBox45:setTop(0);
    obj.imageCheckBox45:setWidth(18);
    obj.imageCheckBox45:setHeight(24);
    obj.imageCheckBox45:setField("Ritual_Expandido__Secundária_2E");
    obj.imageCheckBox45:setName("imageCheckBox45");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(516);
    obj.layout81:setTop(960);
    obj.layout81:setWidth(18);
    obj.layout81:setHeight(23);
    obj.layout81:setName("layout81");

    obj.imageCheckBox46 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox46:setParent(obj.layout81);
    obj.imageCheckBox46:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox46:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox46:setLeft(0);
    obj.imageCheckBox46:setTop(0);
    obj.imageCheckBox46:setWidth(18);
    obj.imageCheckBox46:setHeight(24);
    obj.imageCheckBox46:setField("Ritual_Expandido__Secundária_2F");
    obj.imageCheckBox46:setName("imageCheckBox46");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(530);
    obj.layout82:setTop(960);
    obj.layout82:setWidth(18);
    obj.layout82:setHeight(23);
    obj.layout82:setName("layout82");

    obj.imageCheckBox47 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox47:setParent(obj.layout82);
    obj.imageCheckBox47:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox47:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox47:setLeft(0);
    obj.imageCheckBox47:setTop(0);
    obj.imageCheckBox47:setWidth(18);
    obj.imageCheckBox47:setHeight(24);
    obj.imageCheckBox47:setField("Ritual_Expandido__Secundária_2G");
    obj.imageCheckBox47:setName("imageCheckBox47");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(544);
    obj.layout83:setTop(960);
    obj.layout83:setWidth(18);
    obj.layout83:setHeight(23);
    obj.layout83:setName("layout83");

    obj.imageCheckBox48 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox48:setParent(obj.layout83);
    obj.imageCheckBox48:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox48:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox48:setLeft(0);
    obj.imageCheckBox48:setTop(0);
    obj.imageCheckBox48:setWidth(18);
    obj.imageCheckBox48:setHeight(24);
    obj.imageCheckBox48:setField("Ritual_Expandido__Secundária_2H");
    obj.imageCheckBox48:setName("imageCheckBox48");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(705);
    obj.layout84:setTop(960);
    obj.layout84:setWidth(18);
    obj.layout84:setHeight(23);
    obj.layout84:setName("layout84");

    obj.imageCheckBox49 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox49:setParent(obj.layout84);
    obj.imageCheckBox49:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox49:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox49:setLeft(0);
    obj.imageCheckBox49:setTop(0);
    obj.imageCheckBox49:setWidth(18);
    obj.imageCheckBox49:setHeight(24);
    obj.imageCheckBox49:setField("Ritual_Expandido__Secundária_3A");
    obj.imageCheckBox49:setName("imageCheckBox49");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(719);
    obj.layout85:setTop(960);
    obj.layout85:setWidth(18);
    obj.layout85:setHeight(23);
    obj.layout85:setName("layout85");

    obj.imageCheckBox50 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox50:setParent(obj.layout85);
    obj.imageCheckBox50:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox50:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox50:setLeft(0);
    obj.imageCheckBox50:setTop(0);
    obj.imageCheckBox50:setWidth(18);
    obj.imageCheckBox50:setHeight(24);
    obj.imageCheckBox50:setField("Ritual_Expandido__Secundária_3B");
    obj.imageCheckBox50:setName("imageCheckBox50");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(733);
    obj.layout86:setTop(960);
    obj.layout86:setWidth(18);
    obj.layout86:setHeight(23);
    obj.layout86:setName("layout86");

    obj.imageCheckBox51 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox51:setParent(obj.layout86);
    obj.imageCheckBox51:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox51:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox51:setLeft(0);
    obj.imageCheckBox51:setTop(0);
    obj.imageCheckBox51:setWidth(18);
    obj.imageCheckBox51:setHeight(24);
    obj.imageCheckBox51:setField("Ritual_Expandido__Secundária_3C");
    obj.imageCheckBox51:setName("imageCheckBox51");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(747);
    obj.layout87:setTop(960);
    obj.layout87:setWidth(18);
    obj.layout87:setHeight(23);
    obj.layout87:setName("layout87");

    obj.imageCheckBox52 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox52:setParent(obj.layout87);
    obj.imageCheckBox52:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox52:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox52:setLeft(0);
    obj.imageCheckBox52:setTop(0);
    obj.imageCheckBox52:setWidth(18);
    obj.imageCheckBox52:setHeight(24);
    obj.imageCheckBox52:setField("Ritual_Expandido__Secundária_3D");
    obj.imageCheckBox52:setName("imageCheckBox52");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(760);
    obj.layout88:setTop(960);
    obj.layout88:setWidth(18);
    obj.layout88:setHeight(23);
    obj.layout88:setName("layout88");

    obj.imageCheckBox53 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox53:setParent(obj.layout88);
    obj.imageCheckBox53:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox53:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox53:setLeft(0);
    obj.imageCheckBox53:setTop(0);
    obj.imageCheckBox53:setWidth(18);
    obj.imageCheckBox53:setHeight(24);
    obj.imageCheckBox53:setField("Ritual_Expandido__Secundária_3E");
    obj.imageCheckBox53:setName("imageCheckBox53");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(782);
    obj.layout89:setTop(960);
    obj.layout89:setWidth(18);
    obj.layout89:setHeight(23);
    obj.layout89:setName("layout89");

    obj.imageCheckBox54 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox54:setParent(obj.layout89);
    obj.imageCheckBox54:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox54:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox54:setLeft(0);
    obj.imageCheckBox54:setTop(0);
    obj.imageCheckBox54:setWidth(18);
    obj.imageCheckBox54:setHeight(24);
    obj.imageCheckBox54:setField("Ritual_Expandido__Secundária_3F");
    obj.imageCheckBox54:setName("imageCheckBox54");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(795);
    obj.layout90:setTop(960);
    obj.layout90:setWidth(18);
    obj.layout90:setHeight(23);
    obj.layout90:setName("layout90");

    obj.imageCheckBox55 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox55:setParent(obj.layout90);
    obj.imageCheckBox55:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox55:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox55:setLeft(0);
    obj.imageCheckBox55:setTop(0);
    obj.imageCheckBox55:setWidth(18);
    obj.imageCheckBox55:setHeight(24);
    obj.imageCheckBox55:setField("Ritual_Expandido__Secundária_3G");
    obj.imageCheckBox55:setName("imageCheckBox55");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(809);
    obj.layout91:setTop(960);
    obj.layout91:setWidth(18);
    obj.layout91:setHeight(23);
    obj.layout91:setName("layout91");

    obj.imageCheckBox56 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox56:setParent(obj.layout91);
    obj.imageCheckBox56:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox56:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox56:setLeft(0);
    obj.imageCheckBox56:setTop(0);
    obj.imageCheckBox56:setWidth(18);
    obj.imageCheckBox56:setHeight(24);
    obj.imageCheckBox56:setField("Ritual_Expandido__Secundária_3H");
    obj.imageCheckBox56:setName("imageCheckBox56");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(126);
    obj.layout92:setTop(993);
    obj.layout92:setWidth(714);
    obj.layout92:setHeight(60);
    obj.layout92:setName("layout92");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout92);
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setFontSize(14);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setLeft(0);
    obj.textEditor8:setTop(0);
    obj.textEditor8:setWidth(714);
    obj.textEditor8:setHeight(60);
    obj.textEditor8:setField("Ritual_Expandido__Descrição_1");
    obj.textEditor8:setName("textEditor8");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(116);
    obj.layout93:setTop(1058);
    obj.layout93:setWidth(722);
    obj.layout93:setHeight(60);
    obj.layout93:setName("layout93");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout93);
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setFontSize(14);
    obj.textEditor9:setFontColor("#000000");
    obj.textEditor9:setLeft(0);
    obj.textEditor9:setTop(0);
    obj.textEditor9:setWidth(722);
    obj.textEditor9:setHeight(60);
    obj.textEditor9:setField("Ritual_Expandido__Sistema_1");
    obj.textEditor9:setName("textEditor9");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(124);
    obj.layout94:setTop(1123);
    obj.layout94:setWidth(714);
    obj.layout94:setHeight(40);
    obj.layout94:setName("layout94");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout94);
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setFontSize(14);
    obj.textEditor10:setFontColor("#000000");
    obj.textEditor10:setLeft(0);
    obj.textEditor10:setTop(0);
    obj.textEditor10:setWidth(714);
    obj.textEditor10:setHeight(40);
    obj.textEditor10:setField("Ritual_Expandido__Tormento_1");
    obj.textEditor10:setName("textEditor10");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(127);
    obj.layout95:setTop(1168);
    obj.layout95:setWidth(711);
    obj.layout95:setHeight(20);
    obj.layout95:setName("layout95");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout95);
    obj.textEditor11:setLeft(0);
    obj.textEditor11:setTop(0);
    obj.textEditor11:setWidth(711);
    obj.textEditor11:setHeight(20);
    obj.textEditor11:setFontSize(14);
    obj.textEditor11:setFontColor("#000000");
    obj.textEditor11:setField("Ritual_Expandido__Variações");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setName("textEditor11");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(786);
    obj.layout96:setTop(755);
    obj.layout96:setWidth(37);
    obj.layout96:setHeight(19);
    obj.layout96:setName("layout96");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout96);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(14);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(37);
    obj.edit29:setHeight(20);
    obj.edit29:setField("Ritual__Página_6");
    obj.edit29:setName("edit29");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.imageCheckBox50 ~= nil then self.imageCheckBox50:destroy(); self.imageCheckBox50 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.imageCheckBox45 ~= nil then self.imageCheckBox45:destroy(); self.imageCheckBox45 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.imageCheckBox54 ~= nil then self.imageCheckBox54:destroy(); self.imageCheckBox54 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.imageCheckBox48 ~= nil then self.imageCheckBox48:destroy(); self.imageCheckBox48 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
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
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.imageCheckBox43 ~= nil then self.imageCheckBox43:destroy(); self.imageCheckBox43 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.imageCheckBox51 ~= nil then self.imageCheckBox51:destroy(); self.imageCheckBox51 = nil; end;
        if self.imageCheckBox44 ~= nil then self.imageCheckBox44:destroy(); self.imageCheckBox44 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.imageCheckBox55 ~= nil then self.imageCheckBox55:destroy(); self.imageCheckBox55 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.imageCheckBox52 ~= nil then self.imageCheckBox52:destroy(); self.imageCheckBox52 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.imageCheckBox46 ~= nil then self.imageCheckBox46:destroy(); self.imageCheckBox46 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox49 ~= nil then self.imageCheckBox49:destroy(); self.imageCheckBox49 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.imageCheckBox56 ~= nil then self.imageCheckBox56:destroy(); self.imageCheckBox56 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.imageCheckBox53 ~= nil then self.imageCheckBox53:destroy(); self.imageCheckBox53 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.imageCheckBox47 ~= nil then self.imageCheckBox47:destroy(); self.imageCheckBox47 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
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

function newfrmkpta4_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmkpta4_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmkpta4_svg = {
    newEditor = newfrmkpta4_svg, 
    new = newfrmkpta4_svg, 
    name = "frmkpta4_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmkpta4_svg = _frmkpta4_svg;
Firecast.registrarForm(_frmkpta4_svg);

return _frmkpta4_svg;
