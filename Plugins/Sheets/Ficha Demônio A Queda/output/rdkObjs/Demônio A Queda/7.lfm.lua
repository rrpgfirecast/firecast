require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmkpta7_svg()
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
    obj:setName("frmkpta7_svg");
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
    obj.image1:setSRC("/Demônio A Queda/images/pac.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(353);
    obj.layout1:setTop(181);
    obj.layout1:setWidth(16);
    obj.layout1:setHeight(26);
    obj.layout1:setName("layout1");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout1);
    obj.imageCheckBox1:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox1:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox1:setLeft(0);
    obj.imageCheckBox1:setTop(0);
    obj.imageCheckBox1:setWidth(16);
    obj.imageCheckBox1:setHeight(27);
    obj.imageCheckBox1:setField("Pactos__Fé_1A");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(64);
    obj.layout2:setTop(1034);
    obj.layout2:setWidth(771);
    obj.layout2:setHeight(104);
    obj.layout2:setName("layout2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout2);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(14);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setWidth(771);
    obj.textEditor1:setHeight(105);
    obj.textEditor1:setField("untitled72");
    obj.textEditor1:setName("textEditor1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(96);
    obj.layout3:setTop(184);
    obj.layout3:setWidth(233);
    obj.layout3:setHeight(19);
    obj.layout3:setName("layout3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(233);
    obj.edit1:setHeight(20);
    obj.edit1:setField("Pacto__Nome_1");
    obj.edit1:setName("edit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(366);
    obj.layout4:setTop(181);
    obj.layout4:setWidth(17);
    obj.layout4:setHeight(27);
    obj.layout4:setName("layout4");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout4);
    obj.imageCheckBox2:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox2:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox2:setLeft(0);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(17);
    obj.imageCheckBox2:setHeight(28);
    obj.imageCheckBox2:setField("Pactos__Fé_1B");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(380);
    obj.layout5:setTop(181);
    obj.layout5:setWidth(16);
    obj.layout5:setHeight(26);
    obj.layout5:setName("layout5");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout5);
    obj.imageCheckBox3:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox3:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox3:setLeft(0);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(16);
    obj.imageCheckBox3:setHeight(27);
    obj.imageCheckBox3:setField("Pactos__Fé_1C");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(394);
    obj.layout6:setTop(181);
    obj.layout6:setWidth(16);
    obj.layout6:setHeight(26);
    obj.layout6:setName("layout6");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout6);
    obj.imageCheckBox4:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox4:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox4:setLeft(0);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(16);
    obj.imageCheckBox4:setHeight(27);
    obj.imageCheckBox4:setField("Pactos__Fé_1D");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(408);
    obj.layout7:setTop(181);
    obj.layout7:setWidth(16);
    obj.layout7:setHeight(26);
    obj.layout7:setName("layout7");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout7);
    obj.imageCheckBox5:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox5:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox5:setLeft(0);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(16);
    obj.imageCheckBox5:setHeight(27);
    obj.imageCheckBox5:setField("Pactos__Fé_1E");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(532);
    obj.layout8:setTop(184);
    obj.layout8:setWidth(47);
    obj.layout8:setHeight(19);
    obj.layout8:setName("layout8");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout8);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(14);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(47);
    obj.edit2:setHeight(20);
    obj.edit2:setField("Pacto__Fé_Oferecida_1");
    obj.edit2:setName("edit2");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(130);
    obj.layout9:setTop(205);
    obj.layout9:setWidth(708);
    obj.layout9:setHeight(60);
    obj.layout9:setName("layout9");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout9);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(14);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(708);
    obj.textEditor2:setHeight(60);
    obj.textEditor2:setField("Pacto__Pacto_Feito_1A");
    obj.textEditor2:setName("textEditor2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(197);
    obj.layout10:setTop(269);
    obj.layout10:setWidth(643);
    obj.layout10:setHeight(44);
    obj.layout10:setName("layout10");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout10);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontSize(14);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(643);
    obj.textEditor3:setHeight(44);
    obj.textEditor3:setField("Pacto__Dádivas_Recebidas_1A");
    obj.textEditor3:setName("textEditor3");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(97);
    obj.layout11:setTop(335);
    obj.layout11:setWidth(233);
    obj.layout11:setHeight(19);
    obj.layout11:setName("layout11");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout11);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(14);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(233);
    obj.edit3:setHeight(20);
    obj.edit3:setField("Pacto__Nome_2");
    obj.edit3:setName("edit3");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(353);
    obj.layout12:setTop(333);
    obj.layout12:setWidth(16);
    obj.layout12:setHeight(26);
    obj.layout12:setName("layout12");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout12);
    obj.imageCheckBox6:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox6:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox6:setLeft(0);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(16);
    obj.imageCheckBox6:setHeight(27);
    obj.imageCheckBox6:setField("Pactos__Fé_2A");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(367);
    obj.layout13:setTop(333);
    obj.layout13:setWidth(16);
    obj.layout13:setHeight(26);
    obj.layout13:setName("layout13");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout13);
    obj.imageCheckBox7:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox7:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox7:setLeft(0);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(16);
    obj.imageCheckBox7:setHeight(27);
    obj.imageCheckBox7:setField("Pactos__Fé_2B");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(380);
    obj.layout14:setTop(333);
    obj.layout14:setWidth(16);
    obj.layout14:setHeight(26);
    obj.layout14:setName("layout14");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout14);
    obj.imageCheckBox8:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox8:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox8:setLeft(0);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(16);
    obj.imageCheckBox8:setHeight(27);
    obj.imageCheckBox8:setField("Pactos__Fé_2C");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(393);
    obj.layout15:setTop(333);
    obj.layout15:setWidth(16);
    obj.layout15:setHeight(26);
    obj.layout15:setName("layout15");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout15);
    obj.imageCheckBox9:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox9:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox9:setLeft(0);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(16);
    obj.imageCheckBox9:setHeight(27);
    obj.imageCheckBox9:setField("Pactos__Fé_2D");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(408);
    obj.layout16:setTop(333);
    obj.layout16:setWidth(16);
    obj.layout16:setHeight(26);
    obj.layout16:setName("layout16");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout16);
    obj.imageCheckBox10:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox10:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox10:setLeft(0);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(16);
    obj.imageCheckBox10:setHeight(27);
    obj.imageCheckBox10:setField("Pactos__Fé_2E");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(533);
    obj.layout17:setTop(335);
    obj.layout17:setWidth(47);
    obj.layout17:setHeight(19);
    obj.layout17:setName("layout17");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout17);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(14);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(47);
    obj.edit4:setHeight(20);
    obj.edit4:setField("Pacto__Fé_Oferecida_2");
    obj.edit4:setName("edit4");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(130);
    obj.layout18:setTop(356);
    obj.layout18:setWidth(708);
    obj.layout18:setHeight(60);
    obj.layout18:setName("layout18");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout18);
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setFontSize(14);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(708);
    obj.textEditor4:setHeight(60);
    obj.textEditor4:setField("Pacto__Pacto_Feito_2A");
    obj.textEditor4:setName("textEditor4");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(197);
    obj.layout19:setTop(421);
    obj.layout19:setWidth(643);
    obj.layout19:setHeight(19);
    obj.layout19:setName("layout19");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout19);
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setFontSize(14);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(643);
    obj.textEditor5:setHeight(40);
    obj.textEditor5:setField("Pacto__Dádivas_Recebidas_2A");
    obj.textEditor5:setName("textEditor5");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(96);
    obj.layout20:setTop(486);
    obj.layout20:setWidth(233);
    obj.layout20:setHeight(19);
    obj.layout20:setName("layout20");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout20);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(14);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(233);
    obj.edit5:setHeight(20);
    obj.edit5:setField("Pacto__Nome_3");
    obj.edit5:setName("edit5");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(352);
    obj.layout21:setTop(484);
    obj.layout21:setWidth(16);
    obj.layout21:setHeight(26);
    obj.layout21:setName("layout21");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout21);
    obj.imageCheckBox11:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox11:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox11:setLeft(0);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(16);
    obj.imageCheckBox11:setHeight(27);
    obj.imageCheckBox11:setField("Pactos__Fé_3A");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(367);
    obj.layout22:setTop(484);
    obj.layout22:setWidth(16);
    obj.layout22:setHeight(26);
    obj.layout22:setName("layout22");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout22);
    obj.imageCheckBox12:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox12:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox12:setLeft(0);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(16);
    obj.imageCheckBox12:setHeight(27);
    obj.imageCheckBox12:setField("Pactos__Fé_3B");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(380);
    obj.layout23:setTop(484);
    obj.layout23:setWidth(16);
    obj.layout23:setHeight(26);
    obj.layout23:setName("layout23");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout23);
    obj.imageCheckBox13:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox13:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox13:setLeft(0);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(16);
    obj.imageCheckBox13:setHeight(27);
    obj.imageCheckBox13:setField("Pactos__Fé_3C");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(393);
    obj.layout24:setTop(484);
    obj.layout24:setWidth(16);
    obj.layout24:setHeight(26);
    obj.layout24:setName("layout24");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout24);
    obj.imageCheckBox14:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox14:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox14:setLeft(0);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(16);
    obj.imageCheckBox14:setHeight(27);
    obj.imageCheckBox14:setField("Pactos__Fé_3D");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(408);
    obj.layout25:setTop(484);
    obj.layout25:setWidth(16);
    obj.layout25:setHeight(26);
    obj.layout25:setName("layout25");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout25);
    obj.imageCheckBox15:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox15:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox15:setLeft(0);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(16);
    obj.imageCheckBox15:setHeight(27);
    obj.imageCheckBox15:setField("Pactos__Fé_3E");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(532);
    obj.layout26:setTop(486);
    obj.layout26:setWidth(47);
    obj.layout26:setHeight(19);
    obj.layout26:setName("layout26");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout26);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(14);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(47);
    obj.edit6:setHeight(20);
    obj.edit6:setField("Pacto__Fé_Oferecida_3");
    obj.edit6:setName("edit6");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(129);
    obj.layout27:setTop(507);
    obj.layout27:setWidth(708);
    obj.layout27:setHeight(60);
    obj.layout27:setName("layout27");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout27);
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setFontSize(14);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(708);
    obj.textEditor6:setHeight(60);
    obj.textEditor6:setField("Pacto__Pacto_Feito_3A");
    obj.textEditor6:setName("textEditor6");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(196);
    obj.layout28:setTop(572);
    obj.layout28:setWidth(643);
    obj.layout28:setHeight(60);
    obj.layout28:setName("layout28");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout28);
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setFontSize(14);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(643);
    obj.textEditor7:setHeight(60);
    obj.textEditor7:setField("Pacto__Dádivas_Recebidas_3A");
    obj.textEditor7:setName("textEditor7");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(69);
    obj.layout29:setTop(688);
    obj.layout29:setWidth(250);
    obj.layout29:setHeight(19);
    obj.layout29:setName("layout29");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout29);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(14);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(250);
    obj.edit7:setHeight(20);
    obj.edit7:setField("Combate__Nome_1");
    obj.edit7:setName("edit7");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(333);
    obj.layout30:setTop(688);
    obj.layout30:setWidth(35);
    obj.layout30:setHeight(19);
    obj.layout30:setName("layout30");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout30);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(14);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(35);
    obj.edit8:setHeight(20);
    obj.edit8:setField("Combate__Dano_1");
    obj.edit8:setName("edit8");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(387);
    obj.layout31:setTop(688);
    obj.layout31:setWidth(90);
    obj.layout31:setHeight(19);
    obj.layout31:setName("layout31");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout31);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(14);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(90);
    obj.edit9:setHeight(20);
    obj.edit9:setField("Combate__Tipo_de_Dano_1");
    obj.edit9:setName("edit9");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(485);
    obj.layout32:setTop(688);
    obj.layout32:setWidth(35);
    obj.layout32:setHeight(19);
    obj.layout32:setName("layout32");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout32);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(14);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(35);
    obj.edit10:setHeight(20);
    obj.edit10:setField("Combate__Dif__1");
    obj.edit10:setName("edit10");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(534);
    obj.layout33:setTop(688);
    obj.layout33:setWidth(53);
    obj.layout33:setHeight(19);
    obj.layout33:setName("layout33");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout33);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(14);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(53);
    obj.edit11:setHeight(20);
    obj.edit11:setField("Combate__Cad___1");
    obj.edit11:setName("edit11");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(594);
    obj.layout34:setTop(688);
    obj.layout34:setWidth(53);
    obj.layout34:setHeight(19);
    obj.layout34:setName("layout34");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout34);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(14);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(53);
    obj.edit12:setHeight(20);
    obj.edit12:setField("Combate__Distância__1");
    obj.edit12:setName("edit12");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(654);
    obj.layout35:setTop(688);
    obj.layout35:setWidth(53);
    obj.layout35:setHeight(19);
    obj.layout35:setName("layout35");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout35);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(14);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(53);
    obj.edit13:setHeight(20);
    obj.edit13:setField("Combate__Carga__1");
    obj.edit13:setName("edit13");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(720);
    obj.layout36:setTop(688);
    obj.layout36:setWidth(53);
    obj.layout36:setHeight(19);
    obj.layout36:setName("layout36");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout36);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(14);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(53);
    obj.edit14:setHeight(20);
    obj.edit14:setField("Combate__Peso_1");
    obj.edit14:setName("edit14");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(786);
    obj.layout37:setTop(688);
    obj.layout37:setWidth(35);
    obj.layout37:setHeight(19);
    obj.layout37:setName("layout37");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout37);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(14);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(35);
    obj.edit15:setHeight(20);
    obj.edit15:setField("Combate__Ocult__1");
    obj.edit15:setName("edit15");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(69);
    obj.layout38:setTop(711);
    obj.layout38:setWidth(250);
    obj.layout38:setHeight(19);
    obj.layout38:setName("layout38");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout38);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(14);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(250);
    obj.edit16:setHeight(20);
    obj.edit16:setField("Combate__Nome_2");
    obj.edit16:setName("edit16");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(333);
    obj.layout39:setTop(711);
    obj.layout39:setWidth(35);
    obj.layout39:setHeight(19);
    obj.layout39:setName("layout39");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout39);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(14);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(35);
    obj.edit17:setHeight(20);
    obj.edit17:setField("Combate__Dano_2");
    obj.edit17:setName("edit17");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(387);
    obj.layout40:setTop(711);
    obj.layout40:setWidth(90);
    obj.layout40:setHeight(19);
    obj.layout40:setName("layout40");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout40);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(14);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(90);
    obj.edit18:setHeight(20);
    obj.edit18:setField("Combate__Tipo_de_Dano_2");
    obj.edit18:setName("edit18");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(485);
    obj.layout41:setTop(711);
    obj.layout41:setWidth(35);
    obj.layout41:setHeight(19);
    obj.layout41:setName("layout41");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout41);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(14);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(35);
    obj.edit19:setHeight(20);
    obj.edit19:setField("Combate__Dif__2");
    obj.edit19:setName("edit19");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(534);
    obj.layout42:setTop(711);
    obj.layout42:setWidth(53);
    obj.layout42:setHeight(19);
    obj.layout42:setName("layout42");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout42);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(14);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(53);
    obj.edit20:setHeight(20);
    obj.edit20:setField("Combate__Cad___2");
    obj.edit20:setName("edit20");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(594);
    obj.layout43:setTop(711);
    obj.layout43:setWidth(53);
    obj.layout43:setHeight(19);
    obj.layout43:setName("layout43");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout43);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(14);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(53);
    obj.edit21:setHeight(20);
    obj.edit21:setField("Combate__Distância_2");
    obj.edit21:setName("edit21");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(654);
    obj.layout44:setTop(711);
    obj.layout44:setWidth(53);
    obj.layout44:setHeight(19);
    obj.layout44:setName("layout44");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout44);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(14);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(53);
    obj.edit22:setHeight(20);
    obj.edit22:setField("Combate__Carga_2");
    obj.edit22:setName("edit22");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(720);
    obj.layout45:setTop(711);
    obj.layout45:setWidth(53);
    obj.layout45:setHeight(19);
    obj.layout45:setName("layout45");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout45);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(14);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(53);
    obj.edit23:setHeight(20);
    obj.edit23:setField("Combate__Peso_2");
    obj.edit23:setName("edit23");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(786);
    obj.layout46:setTop(711);
    obj.layout46:setWidth(35);
    obj.layout46:setHeight(19);
    obj.layout46:setName("layout46");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout46);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(14);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(35);
    obj.edit24:setHeight(20);
    obj.edit24:setField("Combate__Ocult__2");
    obj.edit24:setName("edit24");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(68);
    obj.layout47:setTop(788);
    obj.layout47:setWidth(250);
    obj.layout47:setHeight(19);
    obj.layout47:setName("layout47");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout47);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(14);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(250);
    obj.edit25:setHeight(20);
    obj.edit25:setField("Combate__Nome_3");
    obj.edit25:setName("edit25");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(336);
    obj.layout48:setTop(788);
    obj.layout48:setWidth(35);
    obj.layout48:setHeight(19);
    obj.layout48:setName("layout48");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout48);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(14);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(35);
    obj.edit26:setHeight(20);
    obj.edit26:setField("Combate__Dano_3");
    obj.edit26:setName("edit26");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(381);
    obj.layout49:setTop(788);
    obj.layout49:setWidth(90);
    obj.layout49:setHeight(19);
    obj.layout49:setName("layout49");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout49);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(14);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(90);
    obj.edit27:setHeight(20);
    obj.edit27:setField("Combate__Tipo_de_Dano_3");
    obj.edit27:setName("edit27");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(487);
    obj.layout50:setTop(788);
    obj.layout50:setWidth(35);
    obj.layout50:setHeight(19);
    obj.layout50:setName("layout50");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout50);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(14);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(35);
    obj.edit28:setHeight(20);
    obj.edit28:setField("Combate__Dif__3__0");
    obj.edit28:setName("edit28");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(540);
    obj.layout51:setTop(788);
    obj.layout51:setWidth(35);
    obj.layout51:setHeight(19);
    obj.layout51:setName("layout51");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout51);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(14);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(35);
    obj.edit29:setHeight(20);
    obj.edit29:setField("Combate__Ocult__3__0");
    obj.edit29:setName("edit29");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(740);
    obj.layout52:setTop(788);
    obj.layout52:setWidth(35);
    obj.layout52:setHeight(19);
    obj.layout52:setName("layout52");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout52);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(14);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(35);
    obj.edit30:setHeight(20);
    obj.edit30:setField("Combate__Ocult__5");
    obj.edit30:setName("edit30");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(632);
    obj.layout53:setTop(788);
    obj.layout53:setWidth(35);
    obj.layout53:setHeight(19);
    obj.layout53:setName("layout53");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout53);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(14);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(35);
    obj.edit31:setHeight(20);
    obj.edit31:setField("Combate__Nível_5");
    obj.edit31:setName("edit31");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(790);
    obj.layout54:setTop(788);
    obj.layout54:setWidth(35);
    obj.layout54:setHeight(19);
    obj.layout54:setName("layout54");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout54);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(14);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(35);
    obj.edit32:setHeight(20);
    obj.edit32:setField("Combate__Mod__5");
    obj.edit32:setName("edit32");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(68);
    obj.layout55:setTop(809);
    obj.layout55:setWidth(250);
    obj.layout55:setHeight(19);
    obj.layout55:setName("layout55");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout55);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(14);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(250);
    obj.edit33:setHeight(20);
    obj.edit33:setField("Combate__Nome_4");
    obj.edit33:setName("edit33");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(336);
    obj.layout56:setTop(809);
    obj.layout56:setWidth(35);
    obj.layout56:setHeight(19);
    obj.layout56:setName("layout56");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout56);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(14);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(35);
    obj.edit34:setHeight(20);
    obj.edit34:setField("Combate__Dano_4");
    obj.edit34:setName("edit34");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(381);
    obj.layout57:setTop(809);
    obj.layout57:setWidth(90);
    obj.layout57:setHeight(19);
    obj.layout57:setName("layout57");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout57);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(14);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(90);
    obj.edit35:setHeight(20);
    obj.edit35:setField("Combate__Tipo_de_Dano_4");
    obj.edit35:setName("edit35");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(688);
    obj.layout58:setTop(788);
    obj.layout58:setWidth(35);
    obj.layout58:setHeight(19);
    obj.layout58:setName("layout58");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout58);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(14);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("leading");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(35);
    obj.edit36:setHeight(20);
    obj.edit36:setField("Combate__Peso_5");
    obj.edit36:setName("edit36");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(487);
    obj.layout59:setTop(809);
    obj.layout59:setWidth(35);
    obj.layout59:setHeight(19);
    obj.layout59:setName("layout59");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout59);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(14);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("leading");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(35);
    obj.edit37:setHeight(20);
    obj.edit37:setField("Combate__Dif__3__1");
    obj.edit37:setName("edit37");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(540);
    obj.layout60:setTop(809);
    obj.layout60:setWidth(35);
    obj.layout60:setHeight(19);
    obj.layout60:setName("layout60");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout60);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(14);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("leading");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(35);
    obj.edit38:setHeight(20);
    obj.edit38:setField("Combate__Ocult__3__1");
    obj.edit38:setName("edit38");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(632);
    obj.layout61:setTop(810);
    obj.layout61:setWidth(35);
    obj.layout61:setHeight(19);
    obj.layout61:setName("layout61");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout61);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(14);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("leading");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(35);
    obj.edit39:setHeight(20);
    obj.edit39:setField("Combate__Nível_6");
    obj.edit39:setName("edit39");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(688);
    obj.layout62:setTop(810);
    obj.layout62:setWidth(35);
    obj.layout62:setHeight(19);
    obj.layout62:setName("layout62");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout62);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(14);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("leading");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(35);
    obj.edit40:setHeight(20);
    obj.edit40:setField("Combate__Peso_6");
    obj.edit40:setName("edit40");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(740);
    obj.layout63:setTop(810);
    obj.layout63:setWidth(35);
    obj.layout63:setHeight(19);
    obj.layout63:setName("layout63");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout63);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(14);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("leading");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(35);
    obj.edit41:setHeight(20);
    obj.edit41:setField("Combate__Ocult__6");
    obj.edit41:setName("edit41");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(790);
    obj.layout64:setTop(810);
    obj.layout64:setWidth(35);
    obj.layout64:setHeight(19);
    obj.layout64:setName("layout64");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout64);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(14);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(35);
    obj.edit42:setHeight(20);
    obj.edit42:setField("Combate__Mod__6");
    obj.edit42:setName("edit42");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(100);
    obj.layout65:setTop(889);
    obj.layout65:setWidth(220);
    obj.layout65:setHeight(19);
    obj.layout65:setName("layout65");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout65);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(14);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("leading");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(220);
    obj.edit43:setHeight(20);
    obj.edit43:setField("Manobras_de_Combate__Nome_1");
    obj.edit43:setName("edit43");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(415);
    obj.layout66:setTop(889);
    obj.layout66:setWidth(297);
    obj.layout66:setHeight(19);
    obj.layout66:setName("layout66");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout66);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(14);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setHorzTextAlign("leading");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(297);
    obj.edit44:setHeight(20);
    obj.edit44:setField("Manobras_de_Combate__Pré_requisitos");
    obj.edit44:setName("edit44");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(791);
    obj.layout67:setTop(889);
    obj.layout67:setWidth(32);
    obj.layout67:setHeight(19);
    obj.layout67:setName("layout67");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout67);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(14);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("leading");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(32);
    obj.edit45:setHeight(20);
    obj.edit45:setField("Manobras_de_Combate__Página");
    obj.edit45:setName("edit45");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(162);
    obj.layout68:setTop(911);
    obj.layout68:setWidth(35);
    obj.layout68:setHeight(19);
    obj.layout68:setName("layout68");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout68);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(14);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(35);
    obj.edit46:setHeight(20);
    obj.edit46:setField("Manobras_de_Combate__Pontos_de_Poder");
    obj.edit46:setName("edit46");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(241);
    obj.layout69:setTop(911);
    obj.layout69:setWidth(55);
    obj.layout69:setHeight(19);
    obj.layout69:setName("layout69");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout69);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(14);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("leading");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(55);
    obj.edit47:setHeight(20);
    obj.edit47:setField("Manobras_de_Combate__Custo");
    obj.edit47:setName("edit47");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(363);
    obj.layout70:setTop(911);
    obj.layout70:setWidth(62);
    obj.layout70:setHeight(19);
    obj.layout70:setName("layout70");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout70);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(14);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("leading");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(62);
    obj.edit48:setHeight(20);
    obj.edit48:setField("Manobras_de_Combate__Iniciativa");
    obj.edit48:setName("edit48");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(498);
    obj.layout71:setTop(911);
    obj.layout71:setWidth(61);
    obj.layout71:setHeight(19);
    obj.layout71:setName("layout71");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout71);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(14);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("leading");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(61);
    obj.edit49:setHeight(20);
    obj.edit49:setField("Manobras_de_Combate__Movimento");
    obj.edit49:setName("edit49");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(598);
    obj.layout72:setTop(911);
    obj.layout72:setWidth(112);
    obj.layout72:setHeight(19);
    obj.layout72:setName("layout72");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout72);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(14);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setHorzTextAlign("leading");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(112);
    obj.edit50:setHeight(20);
    obj.edit50:setField("Manobras_de_Combate__Dano");
    obj.edit50:setName("edit50");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(767);
    obj.layout73:setTop(911);
    obj.layout73:setWidth(58);
    obj.layout73:setHeight(19);
    obj.layout73:setName("layout73");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout73);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(14);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setHorzTextAlign("leading");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(58);
    obj.edit51:setHeight(20);
    obj.edit51:setField("Manobras_de_Combate__Precisão");
    obj.edit51:setName("edit51");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(101);
    obj.layout74:setTop(956);
    obj.layout74:setWidth(220);
    obj.layout74:setHeight(19);
    obj.layout74:setName("layout74");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout74);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(14);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("leading");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(220);
    obj.edit52:setHeight(20);
    obj.edit52:setField("Manobras_de_Combate__Nome_2");
    obj.edit52:setName("edit52");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(416);
    obj.layout75:setTop(956);
    obj.layout75:setWidth(297);
    obj.layout75:setHeight(19);
    obj.layout75:setName("layout75");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout75);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(14);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(297);
    obj.edit53:setHeight(20);
    obj.edit53:setField("Manobras_de_Combate__Pré_requisitos_2");
    obj.edit53:setName("edit53");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(793);
    obj.layout76:setTop(956);
    obj.layout76:setWidth(32);
    obj.layout76:setHeight(19);
    obj.layout76:setName("layout76");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout76);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(14);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("leading");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(32);
    obj.edit54:setHeight(20);
    obj.edit54:setField("Manobras_de_Combate__Página_2");
    obj.edit54:setName("edit54");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(163);
    obj.layout77:setTop(978);
    obj.layout77:setWidth(35);
    obj.layout77:setHeight(19);
    obj.layout77:setName("layout77");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout77);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(14);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setHorzTextAlign("leading");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(35);
    obj.edit55:setHeight(20);
    obj.edit55:setField("Manobras_de_Combate__Pontos_de_Poder_2");
    obj.edit55:setName("edit55");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(242);
    obj.layout78:setTop(978);
    obj.layout78:setWidth(55);
    obj.layout78:setHeight(19);
    obj.layout78:setName("layout78");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout78);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontSize(14);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setHorzTextAlign("leading");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(55);
    obj.edit56:setHeight(20);
    obj.edit56:setField("Manobras_de_Combate__Custo_2");
    obj.edit56:setName("edit56");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(365);
    obj.layout79:setTop(978);
    obj.layout79:setWidth(62);
    obj.layout79:setHeight(19);
    obj.layout79:setName("layout79");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout79);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontSize(14);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setHorzTextAlign("leading");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(0);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(62);
    obj.edit57:setHeight(20);
    obj.edit57:setField("Manobras_de_Combate__Iniciativa_2");
    obj.edit57:setName("edit57");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(499);
    obj.layout80:setTop(978);
    obj.layout80:setWidth(61);
    obj.layout80:setHeight(19);
    obj.layout80:setName("layout80");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout80);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontSize(14);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setHorzTextAlign("leading");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(0);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(61);
    obj.edit58:setHeight(20);
    obj.edit58:setField("Manobras_de_Combate__Movimento_2");
    obj.edit58:setName("edit58");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(599);
    obj.layout81:setTop(978);
    obj.layout81:setWidth(112);
    obj.layout81:setHeight(19);
    obj.layout81:setName("layout81");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout81);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontSize(14);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setHorzTextAlign("leading");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(0);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(112);
    obj.edit59:setHeight(20);
    obj.edit59:setField("Manobras_de_Combate__Dano_2");
    obj.edit59:setName("edit59");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(768);
    obj.layout82:setTop(978);
    obj.layout82:setWidth(58);
    obj.layout82:setHeight(19);
    obj.layout82:setName("layout82");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout82);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontSize(14);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setHorzTextAlign("leading");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(0);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(58);
    obj.edit60:setHeight(20);
    obj.edit60:setField("Manobras_de_Combate__Precisão_2");
    obj.edit60:setName("edit60");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
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
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmkpta7_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmkpta7_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmkpta7_svg = {
    newEditor = newfrmkpta7_svg, 
    new = newfrmkpta7_svg, 
    name = "frmkpta7_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmkpta7_svg = _frmkpta7_svg;
Firecast.registrarForm(_frmkpta7_svg);

return _frmkpta7_svg;
