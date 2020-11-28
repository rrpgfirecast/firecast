require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmkpta6_svg()
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
    obj:setName("frmkpta6_svg");
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
    obj.image1:setSRC("/Demônio A Queda/images/seg.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(893);
    obj.image2:setHeight(1263);
    obj.image2:setSRC("images/2.png");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(780);
    obj.layout1:setTop(236);
    obj.layout1:setWidth(56);
    obj.layout1:setHeight(18);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(56);
    obj.edit1:setHeight(19);
    obj.edit1:setField("untitled9");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(271);
    obj.layout2:setTop(188);
    obj.layout2:setWidth(261);
    obj.layout2:setHeight(19);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(13);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(261);
    obj.edit2:setHeight(20);
    obj.edit2:setField("Seguidores__Nome_1");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(782);
    obj.layout3:setTop(444);
    obj.layout3:setWidth(54);
    obj.layout3:setHeight(15);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(14);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(54);
    obj.edit3:setHeight(16);
    obj.edit3:setField("untitled10");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(591);
    obj.layout4:setTop(188);
    obj.layout4:setWidth(151);
    obj.layout4:setHeight(19);
    obj.layout4:setName("layout4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(13);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(151);
    obj.edit4:setHeight(20);
    obj.edit4:setField("Seguidores__Definição_1");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(782);
    obj.layout5:setTop(649);
    obj.layout5:setWidth(54);
    obj.layout5:setHeight(14);
    obj.layout5:setName("layout5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(14);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(54);
    obj.edit5:setHeight(15);
    obj.edit5:setField("untitled11");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(782);
    obj.layout6:setTop(853);
    obj.layout6:setWidth(54);
    obj.layout6:setHeight(14);
    obj.layout6:setName("layout6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(14);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(54);
    obj.edit6:setHeight(15);
    obj.edit6:setField("untitled93");
    obj.edit6:setName("edit6");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setField("imagems1");
    obj.image3:setLeft(63);
    obj.image3:setTop(199);
    obj.image3:setEditable(true);
    obj.image3:setStyle("proportional");
    obj.image3:setWidth(151);
    obj.image3:setHeight(153);
    obj.image3:setName("image3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(765);
    obj.layout7:setTop(188);
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
    obj.imageCheckBox1:setField("Seguidores__Fé_1A");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(780);
    obj.layout8:setTop(1057);
    obj.layout8:setWidth(54);
    obj.layout8:setHeight(14);
    obj.layout8:setName("layout8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(14);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(54);
    obj.edit7:setHeight(15);
    obj.edit7:setField("untitled94");
    obj.edit7:setName("edit7");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(779);
    obj.layout9:setTop(188);
    obj.layout9:setWidth(18);
    obj.layout9:setHeight(23);
    obj.layout9:setName("layout9");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout9);
    obj.imageCheckBox2:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox2:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox2:setLeft(0);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(18);
    obj.imageCheckBox2:setHeight(24);
    obj.imageCheckBox2:setField("Seguidores__Fé_1B");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(793);
    obj.layout10:setTop(188);
    obj.layout10:setWidth(18);
    obj.layout10:setHeight(23);
    obj.layout10:setName("layout10");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout10);
    obj.imageCheckBox3:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox3:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox3:setLeft(0);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(18);
    obj.imageCheckBox3:setHeight(24);
    obj.imageCheckBox3:setField("Seguidores__Fé_1C");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(806);
    obj.layout11:setTop(188);
    obj.layout11:setWidth(18);
    obj.layout11:setHeight(23);
    obj.layout11:setName("layout11");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout11);
    obj.imageCheckBox4:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox4:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox4:setLeft(0);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(18);
    obj.imageCheckBox4:setHeight(24);
    obj.imageCheckBox4:setField("Seguidores__Fé_1D");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(820);
    obj.layout12:setTop(188);
    obj.layout12:setWidth(18);
    obj.layout12:setHeight(23);
    obj.layout12:setName("layout12");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout12);
    obj.imageCheckBox5:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox5:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox5:setLeft(0);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(18);
    obj.imageCheckBox5:setHeight(24);
    obj.imageCheckBox5:setField("Seguidores__Fé_1E");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(301);
    obj.layout13:setTop(216);
    obj.layout13:setWidth(144);
    obj.layout13:setHeight(19);
    obj.layout13:setName("layout13");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout13);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(13);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(144);
    obj.edit8:setHeight(20);
    obj.edit8:setField("Seguidores__Lealdade_1");
    obj.edit8:setName("edit8");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(449);
    obj.layout14:setTop(216);
    obj.layout14:setWidth(388);
    obj.layout14:setHeight(19);
    obj.layout14:setName("layout14");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout14);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(13);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(388);
    obj.edit9:setHeight(20);
    obj.edit9:setField("Seguidores__Lealdade_1A");
    obj.edit9:setName("edit9");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(346);
    obj.layout15:setTop(237);
    obj.layout15:setWidth(359);
    obj.layout15:setHeight(19);
    obj.layout15:setName("layout15");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout15);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(13);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(359);
    obj.edit10:setHeight(20);
    obj.edit10:setField("Seguidores__Dádivas_1B");
    obj.edit10:setName("edit10");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(779);
    obj.layout16:setTop(254);
    obj.layout16:setWidth(50);
    obj.layout16:setHeight(7);
    obj.layout16:setName("layout16");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout16);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(50);
    obj.textEditor1:setHeight(7);
    obj.textEditor1:setFontSize(18);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Seguidores__Fé_Oferecida_1");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(265);
    obj.layout17:setTop(305);
    obj.layout17:setWidth(267);
    obj.layout17:setHeight(19);
    obj.layout17:setName("layout17");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout17);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(13);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(267);
    obj.edit11:setHeight(20);
    obj.edit11:setField("Seguidores__1_3");
    obj.edit11:setName("edit11");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(265);
    obj.layout18:setTop(282);
    obj.layout18:setWidth(267);
    obj.layout18:setHeight(19);
    obj.layout18:setName("layout18");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout18);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(13);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(267);
    obj.edit12:setHeight(20);
    obj.edit12:setField("Seguidores__1_2");
    obj.edit12:setName("edit12");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(562);
    obj.layout19:setTop(282);
    obj.layout19:setWidth(267);
    obj.layout19:setHeight(19);
    obj.layout19:setName("layout19");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout19);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(13);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(267);
    obj.edit13:setHeight(20);
    obj.edit13:setField("Seguidores__1_5");
    obj.edit13:setName("edit13");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(536);
    obj.layout20:setTop(327);
    obj.layout20:setWidth(290);
    obj.layout20:setHeight(19);
    obj.layout20:setName("layout20");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout20);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(13);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(290);
    obj.edit14:setHeight(20);
    obj.edit14:setField("Seguidores__Demônio_1");
    obj.edit14:setName("edit14");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(265);
    obj.layout21:setTop(327);
    obj.layout21:setWidth(267);
    obj.layout21:setHeight(19);
    obj.layout21:setName("layout21");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout21);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(13);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(267);
    obj.edit15:setHeight(20);
    obj.edit15:setField("Seguidores__1_4");
    obj.edit15:setName("edit15");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(270);
    obj.layout22:setTop(393);
    obj.layout22:setWidth(261);
    obj.layout22:setHeight(19);
    obj.layout22:setName("layout22");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout22);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(13);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(261);
    obj.edit16:setHeight(20);
    obj.edit16:setField("Seguidores__Nome_2");
    obj.edit16:setName("edit16");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(590);
    obj.layout23:setTop(393);
    obj.layout23:setWidth(151);
    obj.layout23:setHeight(19);
    obj.layout23:setName("layout23");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout23);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(13);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(151);
    obj.edit17:setHeight(20);
    obj.edit17:setField("Seguidores__Definição_2");
    obj.edit17:setName("edit17");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle1);
    obj.image4:setField("imagems2");
    obj.image4:setStyle("proportional");
    obj.image4:setEditable(true);
    obj.image4:setLeft(63);
    obj.image4:setTop(403);
    obj.image4:setWidth(151);
    obj.image4:setHeight(153);
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle1);
    obj.image5:setField("imagems3");
    obj.image5:setStyle("proportional");
    obj.image5:setEditable(true);
    obj.image5:setLeft(63);
    obj.image5:setTop(607);
    obj.image5:setWidth(151);
    obj.image5:setHeight(153);
    obj.image5:setName("image5");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(301);
    obj.layout24:setTop(420);
    obj.layout24:setWidth(144);
    obj.layout24:setHeight(19);
    obj.layout24:setName("layout24");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout24);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(13);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(144);
    obj.edit18:setHeight(20);
    obj.edit18:setField("Seguidores__Lealdade_2");
    obj.edit18:setName("edit18");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(448);
    obj.layout25:setTop(420);
    obj.layout25:setWidth(388);
    obj.layout25:setHeight(19);
    obj.layout25:setName("layout25");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout25);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(13);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(388);
    obj.edit19:setHeight(20);
    obj.edit19:setField("Seguidores__Lealdade_2A");
    obj.edit19:setName("edit19");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(346);
    obj.layout26:setTop(442);
    obj.layout26:setWidth(359);
    obj.layout26:setHeight(19);
    obj.layout26:setName("layout26");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout26);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(13);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(359);
    obj.edit20:setHeight(20);
    obj.edit20:setField("Seguidores__Dádivas_2B");
    obj.edit20:setName("edit20");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(781);
    obj.layout27:setTop(458);
    obj.layout27:setWidth(50);
    obj.layout27:setHeight(7);
    obj.layout27:setName("layout27");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout27);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(50);
    obj.textEditor2:setHeight(7);
    obj.textEditor2:setFontSize(18);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("Seguidores__Fé_Oferecida_2");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(265);
    obj.layout28:setTop(487);
    obj.layout28:setWidth(267);
    obj.layout28:setHeight(19);
    obj.layout28:setName("layout28");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout28);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(13);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(267);
    obj.edit21:setHeight(20);
    obj.edit21:setField("Seguidores__2_1");
    obj.edit21:setName("edit21");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(561);
    obj.layout29:setTop(487);
    obj.layout29:setWidth(267);
    obj.layout29:setHeight(19);
    obj.layout29:setName("layout29");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout29);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(13);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(267);
    obj.edit22:setHeight(20);
    obj.edit22:setField("Seguidores__2_5");
    obj.edit22:setName("edit22");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(265);
    obj.layout30:setTop(509);
    obj.layout30:setWidth(267);
    obj.layout30:setHeight(19);
    obj.layout30:setName("layout30");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout30);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(13);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(267);
    obj.edit23:setHeight(20);
    obj.edit23:setField("Seguidores__2_3");
    obj.edit23:setName("edit23");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(265);
    obj.layout31:setTop(531);
    obj.layout31:setWidth(267);
    obj.layout31:setHeight(19);
    obj.layout31:setName("layout31");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout31);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(13);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(267);
    obj.edit24:setHeight(20);
    obj.edit24:setField("Seguidores__2_4");
    obj.edit24:setName("edit24");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(535);
    obj.layout32:setTop(531);
    obj.layout32:setWidth(290);
    obj.layout32:setHeight(19);
    obj.layout32:setName("layout32");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout32);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontSize(13);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setHorzTextAlign("leading");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(0);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(290);
    obj.edit25:setHeight(20);
    obj.edit25:setField("Seguidores__Demônio_2");
    obj.edit25:setName("edit25");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(271);
    obj.layout33:setTop(597);
    obj.layout33:setWidth(261);
    obj.layout33:setHeight(19);
    obj.layout33:setName("layout33");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout33);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontSize(13);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setHorzTextAlign("leading");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(261);
    obj.edit26:setHeight(20);
    obj.edit26:setField("Seguidores__Nome_3");
    obj.edit26:setName("edit26");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(592);
    obj.layout34:setTop(597);
    obj.layout34:setWidth(151);
    obj.layout34:setHeight(19);
    obj.layout34:setName("layout34");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout34);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontSize(13);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setHorzTextAlign("leading");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(0);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(151);
    obj.edit27:setHeight(20);
    obj.edit27:setField("Seguidores__Definição_3");
    obj.edit27:setName("edit27");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(302);
    obj.layout35:setTop(625);
    obj.layout35:setWidth(144);
    obj.layout35:setHeight(19);
    obj.layout35:setName("layout35");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout35);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontSize(13);
    obj.edit28:setFontColor("#000000");
    obj.edit28:setHorzTextAlign("leading");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(144);
    obj.edit28:setHeight(20);
    obj.edit28:setField("Seguidores__Lealdade_3");
    obj.edit28:setName("edit28");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(450);
    obj.layout36:setTop(625);
    obj.layout36:setWidth(388);
    obj.layout36:setHeight(19);
    obj.layout36:setName("layout36");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout36);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontSize(13);
    obj.edit29:setFontColor("#000000");
    obj.edit29:setHorzTextAlign("leading");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(388);
    obj.edit29:setHeight(20);
    obj.edit29:setField("Seguidores__Lealdade_3A");
    obj.edit29:setName("edit29");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(346);
    obj.layout37:setTop(646);
    obj.layout37:setWidth(359);
    obj.layout37:setHeight(19);
    obj.layout37:setName("layout37");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout37);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontSize(13);
    obj.edit30:setFontColor("#000000");
    obj.edit30:setHorzTextAlign("leading");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(359);
    obj.edit30:setHeight(20);
    obj.edit30:setField("Seguidores__Dádivas_3B");
    obj.edit30:setName("edit30");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(781);
    obj.layout38:setTop(663);
    obj.layout38:setWidth(50);
    obj.layout38:setHeight(7);
    obj.layout38:setName("layout38");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout38);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(50);
    obj.textEditor3:setHeight(7);
    obj.textEditor3:setFontSize(18);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("Seguidores__Fé_Oferecida_3");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(268);
    obj.layout39:setTop(692);
    obj.layout39:setWidth(267);
    obj.layout39:setHeight(19);
    obj.layout39:setName("layout39");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout39);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(13);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("leading");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(267);
    obj.edit31:setHeight(20);
    obj.edit31:setField("Seguidores__3_1");
    obj.edit31:setName("edit31");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(564);
    obj.layout40:setTop(692);
    obj.layout40:setWidth(267);
    obj.layout40:setHeight(19);
    obj.layout40:setName("layout40");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout40);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(13);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("leading");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(267);
    obj.edit32:setHeight(20);
    obj.edit32:setField("Seguidores__3_5");
    obj.edit32:setName("edit32");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(268);
    obj.layout41:setTop(714);
    obj.layout41:setWidth(267);
    obj.layout41:setHeight(19);
    obj.layout41:setName("layout41");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout41);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(13);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("leading");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(267);
    obj.edit33:setHeight(20);
    obj.edit33:setField("Seguidores__3_2");
    obj.edit33:setName("edit33");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(268);
    obj.layout42:setTop(736);
    obj.layout42:setWidth(267);
    obj.layout42:setHeight(19);
    obj.layout42:setName("layout42");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout42);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(13);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("leading");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(267);
    obj.edit34:setHeight(20);
    obj.edit34:setField("Seguidores__3_4");
    obj.edit34:setName("edit34");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(538);
    obj.layout43:setTop(736);
    obj.layout43:setWidth(290);
    obj.layout43:setHeight(19);
    obj.layout43:setName("layout43");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout43);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontSize(13);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setHorzTextAlign("leading");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(0);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(290);
    obj.edit35:setHeight(20);
    obj.edit35:setField("Seguidores__Demônio_3");
    obj.edit35:setName("edit35");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(272);
    obj.layout44:setTop(801);
    obj.layout44:setWidth(261);
    obj.layout44:setHeight(19);
    obj.layout44:setName("layout44");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout44);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontSize(13);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setHorzTextAlign("leading");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(261);
    obj.edit36:setHeight(20);
    obj.edit36:setField("Seguidores__Nome_4");
    obj.edit36:setName("edit36");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(592);
    obj.layout45:setTop(801);
    obj.layout45:setWidth(151);
    obj.layout45:setHeight(19);
    obj.layout45:setName("layout45");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout45);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontSize(13);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setHorzTextAlign("leading");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(0);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(151);
    obj.edit37:setHeight(20);
    obj.edit37:setField("Seguidores__Definição_4");
    obj.edit37:setName("edit37");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.rectangle1);
    obj.image6:setField("imagems4");
    obj.image6:setStyle("proportional");
    obj.image6:setEditable(true);
    obj.image6:setLeft(63);
    obj.image6:setTop(813);
    obj.image6:setWidth(151);
    obj.image6:setHeight(153);
    obj.image6:setName("image6");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(766);
    obj.layout46:setTop(801);
    obj.layout46:setWidth(18);
    obj.layout46:setHeight(23);
    obj.layout46:setName("layout46");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout46);
    obj.imageCheckBox6:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox6:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox6:setLeft(0);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(18);
    obj.imageCheckBox6:setHeight(24);
    obj.imageCheckBox6:setField("Seguidores__Fé_4A");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(780);
    obj.layout47:setTop(801);
    obj.layout47:setWidth(18);
    obj.layout47:setHeight(23);
    obj.layout47:setName("layout47");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout47);
    obj.imageCheckBox7:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox7:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox7:setLeft(0);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(18);
    obj.imageCheckBox7:setHeight(24);
    obj.imageCheckBox7:setField("Seguidores__Fé_4B");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(794);
    obj.layout48:setTop(801);
    obj.layout48:setWidth(18);
    obj.layout48:setHeight(23);
    obj.layout48:setName("layout48");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout48);
    obj.imageCheckBox8:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox8:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox8:setLeft(0);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(18);
    obj.imageCheckBox8:setHeight(24);
    obj.imageCheckBox8:setField("Seguidores__Fé_4C");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(808);
    obj.layout49:setTop(801);
    obj.layout49:setWidth(18);
    obj.layout49:setHeight(23);
    obj.layout49:setName("layout49");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout49);
    obj.imageCheckBox9:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox9:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox9:setLeft(0);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(18);
    obj.imageCheckBox9:setHeight(24);
    obj.imageCheckBox9:setField("Seguidores__Fé_4D");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(821);
    obj.layout50:setTop(801);
    obj.layout50:setWidth(18);
    obj.layout50:setHeight(23);
    obj.layout50:setName("layout50");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout50);
    obj.imageCheckBox10:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox10:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox10:setLeft(0);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(18);
    obj.imageCheckBox10:setHeight(24);
    obj.imageCheckBox10:setField("Seguidores__Fé_4E");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(303);
    obj.layout51:setTop(829);
    obj.layout51:setWidth(144);
    obj.layout51:setHeight(19);
    obj.layout51:setName("layout51");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout51);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontSize(13);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setHorzTextAlign("leading");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(0);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(144);
    obj.edit38:setHeight(20);
    obj.edit38:setField("Seguidores__Lealdade_4");
    obj.edit38:setName("edit38");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(450);
    obj.layout52:setTop(829);
    obj.layout52:setWidth(388);
    obj.layout52:setHeight(19);
    obj.layout52:setName("layout52");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout52);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontSize(13);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setHorzTextAlign("leading");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(0);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(388);
    obj.edit39:setHeight(20);
    obj.edit39:setField("Seguidores__Lealdade_4A");
    obj.edit39:setName("edit39");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(348);
    obj.layout53:setTop(850);
    obj.layout53:setWidth(359);
    obj.layout53:setHeight(19);
    obj.layout53:setName("layout53");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout53);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontSize(13);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setHorzTextAlign("leading");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(0);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(359);
    obj.edit40:setHeight(20);
    obj.edit40:setField("Seguidores__Dádivas_4B");
    obj.edit40:setName("edit40");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(780);
    obj.layout54:setTop(867);
    obj.layout54:setWidth(50);
    obj.layout54:setHeight(7);
    obj.layout54:setName("layout54");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout54);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(50);
    obj.textEditor4:setHeight(7);
    obj.textEditor4:setFontSize(18);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("Seguidores__Fé_Oferecida_4");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(267);
    obj.layout55:setTop(896);
    obj.layout55:setWidth(267);
    obj.layout55:setHeight(19);
    obj.layout55:setName("layout55");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout55);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontSize(13);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setHorzTextAlign("leading");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(267);
    obj.edit41:setHeight(20);
    obj.edit41:setField("Seguidores__4_1");
    obj.edit41:setName("edit41");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(563);
    obj.layout56:setTop(896);
    obj.layout56:setWidth(267);
    obj.layout56:setHeight(19);
    obj.layout56:setName("layout56");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout56);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontSize(13);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setHorzTextAlign("leading");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(0);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(267);
    obj.edit42:setHeight(20);
    obj.edit42:setField("Seguidores__4_5");
    obj.edit42:setName("edit42");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(267);
    obj.layout57:setTop(918);
    obj.layout57:setWidth(267);
    obj.layout57:setHeight(19);
    obj.layout57:setName("layout57");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout57);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontSize(13);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setHorzTextAlign("leading");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(0);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(267);
    obj.edit43:setHeight(20);
    obj.edit43:setField("Seguidores__4_2");
    obj.edit43:setName("edit43");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(267);
    obj.layout58:setTop(940);
    obj.layout58:setWidth(267);
    obj.layout58:setHeight(19);
    obj.layout58:setName("layout58");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout58);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontSize(13);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setHorzTextAlign("leading");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(0);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(267);
    obj.edit44:setHeight(20);
    obj.edit44:setField("Seguidores__4_3");
    obj.edit44:setName("edit44");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(537);
    obj.layout59:setTop(940);
    obj.layout59:setWidth(290);
    obj.layout59:setHeight(19);
    obj.layout59:setName("layout59");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout59);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontSize(13);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setHorzTextAlign("leading");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(0);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(290);
    obj.edit45:setHeight(20);
    obj.edit45:setField("Seguidores__Demônio_4");
    obj.edit45:setName("edit45");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(272);
    obj.layout60:setTop(1006);
    obj.layout60:setWidth(261);
    obj.layout60:setHeight(19);
    obj.layout60:setName("layout60");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout60);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontSize(13);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setHorzTextAlign("leading");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(261);
    obj.edit46:setHeight(20);
    obj.edit46:setField("Seguidores__Nome_5");
    obj.edit46:setName("edit46");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(592);
    obj.layout61:setTop(1006);
    obj.layout61:setWidth(151);
    obj.layout61:setHeight(19);
    obj.layout61:setName("layout61");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout61);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontSize(13);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setHorzTextAlign("leading");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(0);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(151);
    obj.edit47:setHeight(20);
    obj.edit47:setField("Seguidores__Definição_5");
    obj.edit47:setName("edit47");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(766);
    obj.layout62:setTop(597);
    obj.layout62:setWidth(18);
    obj.layout62:setHeight(23);
    obj.layout62:setName("layout62");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout62);
    obj.imageCheckBox11:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox11:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox11:setLeft(0);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(18);
    obj.imageCheckBox11:setHeight(24);
    obj.imageCheckBox11:setField("Seguidores__Fé_3A");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(764);
    obj.layout63:setTop(392);
    obj.layout63:setWidth(18);
    obj.layout63:setHeight(23);
    obj.layout63:setName("layout63");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout63);
    obj.imageCheckBox12:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox12:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox12:setLeft(0);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(18);
    obj.imageCheckBox12:setHeight(24);
    obj.imageCheckBox12:setField("Seguidores__Fé_2A");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(766);
    obj.layout64:setTop(1006);
    obj.layout64:setWidth(18);
    obj.layout64:setHeight(23);
    obj.layout64:setName("layout64");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout64);
    obj.imageCheckBox13:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox13:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox13:setLeft(0);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(18);
    obj.imageCheckBox13:setHeight(24);
    obj.imageCheckBox13:setField("Seguidores__Fé_5A");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(778);
    obj.layout65:setTop(392);
    obj.layout65:setWidth(18);
    obj.layout65:setHeight(23);
    obj.layout65:setName("layout65");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout65);
    obj.imageCheckBox14:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox14:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox14:setLeft(0);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(18);
    obj.imageCheckBox14:setHeight(24);
    obj.imageCheckBox14:setField("Seguidores__Fé_2B");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(779);
    obj.layout66:setTop(597);
    obj.layout66:setWidth(18);
    obj.layout66:setHeight(23);
    obj.layout66:setName("layout66");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout66);
    obj.imageCheckBox15:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox15:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox15:setLeft(0);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(18);
    obj.imageCheckBox15:setHeight(24);
    obj.imageCheckBox15:setField("Seguidores__Fé_3B");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(780);
    obj.layout67:setTop(1006);
    obj.layout67:setWidth(18);
    obj.layout67:setHeight(23);
    obj.layout67:setName("layout67");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout67);
    obj.imageCheckBox16:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox16:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox16:setLeft(0);
    obj.imageCheckBox16:setTop(0);
    obj.imageCheckBox16:setWidth(18);
    obj.imageCheckBox16:setHeight(24);
    obj.imageCheckBox16:setField("Seguidores__Fé_5B");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(792);
    obj.layout68:setTop(392);
    obj.layout68:setWidth(18);
    obj.layout68:setHeight(23);
    obj.layout68:setName("layout68");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout68);
    obj.imageCheckBox17:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox17:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox17:setLeft(0);
    obj.imageCheckBox17:setTop(0);
    obj.imageCheckBox17:setWidth(18);
    obj.imageCheckBox17:setHeight(24);
    obj.imageCheckBox17:setField("Seguidores__Fé_2C");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(793);
    obj.layout69:setTop(597);
    obj.layout69:setWidth(18);
    obj.layout69:setHeight(23);
    obj.layout69:setName("layout69");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout69);
    obj.imageCheckBox18:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox18:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox18:setLeft(0);
    obj.imageCheckBox18:setTop(0);
    obj.imageCheckBox18:setWidth(18);
    obj.imageCheckBox18:setHeight(24);
    obj.imageCheckBox18:setField("Seguidores__Fé_3C");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(794);
    obj.layout70:setTop(1006);
    obj.layout70:setWidth(18);
    obj.layout70:setHeight(23);
    obj.layout70:setName("layout70");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout70);
    obj.imageCheckBox19:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox19:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox19:setLeft(0);
    obj.imageCheckBox19:setTop(0);
    obj.imageCheckBox19:setWidth(18);
    obj.imageCheckBox19:setHeight(24);
    obj.imageCheckBox19:setField("Seguidores__Fé_5C");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(806);
    obj.layout71:setTop(392);
    obj.layout71:setWidth(18);
    obj.layout71:setHeight(23);
    obj.layout71:setName("layout71");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout71);
    obj.imageCheckBox20:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox20:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox20:setLeft(0);
    obj.imageCheckBox20:setTop(0);
    obj.imageCheckBox20:setWidth(18);
    obj.imageCheckBox20:setHeight(24);
    obj.imageCheckBox20:setField("Seguidores__Fé_2D");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(807);
    obj.layout72:setTop(597);
    obj.layout72:setWidth(18);
    obj.layout72:setHeight(23);
    obj.layout72:setName("layout72");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout72);
    obj.imageCheckBox21:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox21:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox21:setLeft(0);
    obj.imageCheckBox21:setTop(0);
    obj.imageCheckBox21:setWidth(18);
    obj.imageCheckBox21:setHeight(24);
    obj.imageCheckBox21:setField("Seguidores__Fé_3D");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(808);
    obj.layout73:setTop(1006);
    obj.layout73:setWidth(18);
    obj.layout73:setHeight(23);
    obj.layout73:setName("layout73");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout73);
    obj.imageCheckBox22:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox22:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox22:setLeft(0);
    obj.imageCheckBox22:setTop(0);
    obj.imageCheckBox22:setWidth(18);
    obj.imageCheckBox22:setHeight(24);
    obj.imageCheckBox22:setField("Seguidores__Fé_5D");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(820);
    obj.layout74:setTop(392);
    obj.layout74:setWidth(18);
    obj.layout74:setHeight(23);
    obj.layout74:setName("layout74");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout74);
    obj.imageCheckBox23:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox23:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox23:setLeft(0);
    obj.imageCheckBox23:setTop(0);
    obj.imageCheckBox23:setWidth(18);
    obj.imageCheckBox23:setHeight(24);
    obj.imageCheckBox23:setField("Seguidores__Fé_2E");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(821);
    obj.layout75:setTop(597);
    obj.layout75:setWidth(18);
    obj.layout75:setHeight(23);
    obj.layout75:setName("layout75");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout75);
    obj.imageCheckBox24:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox24:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox24:setLeft(0);
    obj.imageCheckBox24:setTop(0);
    obj.imageCheckBox24:setWidth(18);
    obj.imageCheckBox24:setHeight(24);
    obj.imageCheckBox24:setField("Seguidores__Fé_3E");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(821);
    obj.layout76:setTop(1006);
    obj.layout76:setWidth(18);
    obj.layout76:setHeight(23);
    obj.layout76:setName("layout76");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout76);
    obj.imageCheckBox25:setImageChecked("/Demônio A Queda/images/on.png");
    obj.imageCheckBox25:setImageUnchecked("/Demônio A Queda/images/off.png");
    obj.imageCheckBox25:setLeft(0);
    obj.imageCheckBox25:setTop(0);
    obj.imageCheckBox25:setWidth(18);
    obj.imageCheckBox25:setHeight(24);
    obj.imageCheckBox25:setField("Seguidores__Fé_5E");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.rectangle1);
    obj.image7:setField("imagems5");
    obj.image7:setStyle("proportional");
    obj.image7:setEditable(true);
    obj.image7:setLeft(63);
    obj.image7:setTop(1018);
    obj.image7:setWidth(151);
    obj.image7:setHeight(153);
    obj.image7:setName("image7");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(303);
    obj.layout77:setTop(1034);
    obj.layout77:setWidth(144);
    obj.layout77:setHeight(19);
    obj.layout77:setName("layout77");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout77);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontSize(13);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setHorzTextAlign("leading");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(0);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(144);
    obj.edit48:setHeight(20);
    obj.edit48:setField("Seguidores__Lealdade_5");
    obj.edit48:setName("edit48");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(450);
    obj.layout78:setTop(1034);
    obj.layout78:setWidth(388);
    obj.layout78:setHeight(19);
    obj.layout78:setName("layout78");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout78);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontSize(13);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setHorzTextAlign("leading");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(0);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(388);
    obj.edit49:setHeight(20);
    obj.edit49:setField("Seguidores__Lealdade_5A");
    obj.edit49:setName("edit49");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(348);
    obj.layout79:setTop(1055);
    obj.layout79:setWidth(359);
    obj.layout79:setHeight(19);
    obj.layout79:setName("layout79");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout79);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontSize(13);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setHorzTextAlign("leading");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(0);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(359);
    obj.edit50:setHeight(20);
    obj.edit50:setField("Seguidores__Dádivas_5B");
    obj.edit50:setName("edit50");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(780);
    obj.layout80:setTop(1072);
    obj.layout80:setWidth(50);
    obj.layout80:setHeight(7);
    obj.layout80:setName("layout80");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout80);
    obj.textEditor5:setLeft(0);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(50);
    obj.textEditor5:setHeight(7);
    obj.textEditor5:setFontSize(18);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("Seguidores__Fé_Oferecida_5");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(267);
    obj.layout81:setTop(1100);
    obj.layout81:setWidth(267);
    obj.layout81:setHeight(19);
    obj.layout81:setName("layout81");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout81);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontSize(13);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setHorzTextAlign("leading");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(267);
    obj.edit51:setHeight(20);
    obj.edit51:setField("Seguidores__5_1");
    obj.edit51:setName("edit51");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(563);
    obj.layout82:setTop(1100);
    obj.layout82:setWidth(267);
    obj.layout82:setHeight(19);
    obj.layout82:setName("layout82");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout82);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontSize(13);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setHorzTextAlign("leading");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(0);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(267);
    obj.edit52:setHeight(20);
    obj.edit52:setField("Seguidores__5_4");
    obj.edit52:setName("edit52");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(267);
    obj.layout83:setTop(1123);
    obj.layout83:setWidth(267);
    obj.layout83:setHeight(19);
    obj.layout83:setName("layout83");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout83);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontSize(13);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setHorzTextAlign("leading");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(0);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(267);
    obj.edit53:setHeight(20);
    obj.edit53:setField("Seguidores__5_2");
    obj.edit53:setName("edit53");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(267);
    obj.layout84:setTop(1145);
    obj.layout84:setWidth(267);
    obj.layout84:setHeight(19);
    obj.layout84:setName("layout84");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout84);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontSize(13);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setHorzTextAlign("leading");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(0);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(267);
    obj.edit54:setHeight(20);
    obj.edit54:setField("Seguidores__5_3");
    obj.edit54:setName("edit54");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(537);
    obj.layout85:setTop(1145);
    obj.layout85:setWidth(290);
    obj.layout85:setHeight(19);
    obj.layout85:setName("layout85");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout85);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontSize(13);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setHorzTextAlign("leading");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(0);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(290);
    obj.edit55:setHeight(20);
    obj.edit55:setField("Seguidores__Demônio_5");
    obj.edit55:setName("edit55");

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
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
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
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
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
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
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
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
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

function newfrmkpta6_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmkpta6_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmkpta6_svg = {
    newEditor = newfrmkpta6_svg, 
    new = newfrmkpta6_svg, 
    name = "frmkpta6_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmkpta6_svg = _frmkpta6_svg;
Firecast.registrarForm(_frmkpta6_svg);

return _frmkpta6_svg;
