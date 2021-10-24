require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSODLFillable1_svg()
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
    obj:setName("frmSODLFillable1_svg");
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
    obj.image1:setSRC("/SODLFillable/images/1.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(26);
    obj.layout1:setTop(59);
    obj.layout1:setWidth(283);
    obj.layout1:setHeight(35);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(283);
    obj.edit1:setHeight(35);
    obj.edit1:setFontSize(24);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setField("Name");
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(318);
    obj.layout2:setTop(59);
    obj.layout2:setWidth(261);
    obj.layout2:setHeight(35);
    obj.layout2:setName("layout2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(261);
    obj.edit2:setHeight(35);
    obj.edit2:setFontSize(14.2);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setFontColor("#000000");
    obj.edit2:setField("Ancestry");
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(322);
    obj.layout3:setTop(419);
    obj.layout3:setWidth(47);
    obj.layout3:setHeight(44);
    obj.layout3:setName("layout3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(32);
    obj.edit3:setFontColor("#a83232");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(47);
    obj.edit3:setHeight(45);
    obj.edit3:setField("Strength");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(366);
    obj.layout4:setTop(469);
    obj.layout4:setWidth(27);
    obj.layout4:setHeight(28);
    obj.layout4:setName("layout4");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout4);
    obj.label1:setFontSize(18);
    obj.label1:setFontColor("#a83232");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setVertTextAlign("center");
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(27);
    obj.label1:setHeight(29);
    obj.label1:setField("Strength_Modifier");
    obj.label1:setName("label1");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(false);
    obj.label1:setAutoSize(true);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(435);
    obj.layout5:setTop(769);
    obj.layout5:setWidth(47);
    obj.layout5:setHeight(44);
    obj.layout5:setName("layout5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(32);
    obj.edit4:setFontColor("#a83232");
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(47);
    obj.edit4:setHeight(45);
    obj.edit4:setField("Health");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(439);
    obj.layout6:setTop(703);
    obj.layout6:setWidth(35);
    obj.layout6:setHeight(32);
    obj.layout6:setName("layout6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(18);
    obj.edit5:setFontColor("#a83232");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(35);
    obj.edit5:setHeight(33);
    obj.edit5:setField("Healing_Rate");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(244);
    obj.layout7:setTop(607);
    obj.layout7:setWidth(47);
    obj.layout7:setHeight(44);
    obj.layout7:setName("layout7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(32);
    obj.edit6:setFontColor("#a83232");
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(47);
    obj.edit6:setHeight(45);
    obj.edit6:setField("Agility");
    obj.edit6:setName("edit6");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(309);
    obj.layout8:setTop(606);
    obj.layout8:setWidth(27);
    obj.layout8:setHeight(28);
    obj.layout8:setName("layout8");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout8);
    obj.label2:setFontSize(18);
    obj.label2:setFontColor("#a83232");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setVertTextAlign("center");
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(27);
    obj.label2:setHeight(29);
    obj.label2:setField("Agility_Modifier");
    obj.label2:setName("label2");
    obj.label2:setTextTrimming("none");
    obj.label2:setWordWrap(false);
    obj.label2:setAutoSize(true);

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(286);
    obj.layout9:setTop(745);
    obj.layout9:setWidth(35);
    obj.layout9:setHeight(32);
    obj.layout9:setName("layout9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(18);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(35);
    obj.edit7:setHeight(33);
    obj.edit7:setField("Defense");
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(546);
    obj.layout10:setTop(420);
    obj.layout10:setWidth(47);
    obj.layout10:setHeight(44);
    obj.layout10:setName("layout10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(32);
    obj.edit8:setFontColor("#a83232");
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(47);
    obj.edit8:setHeight(45);
    obj.edit8:setField("Intellect");
    obj.edit8:setName("edit8");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(517);
    obj.layout11:setTop(466);
    obj.layout11:setWidth(27);
    obj.layout11:setHeight(28);
    obj.layout11:setName("layout11");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout11);
    obj.label3:setFontSize(18);
    obj.label3:setFontColor("#a83232");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setVertTextAlign("center");
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(27);
    obj.label3:setHeight(29);
    obj.label3:setField("Intellect_Modifier");
    obj.label3:setName("label3");
    obj.label3:setTextTrimming("none");
    obj.label3:setWordWrap(false);
    obj.label3:setAutoSize(true);

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(621);
    obj.layout12:setTop(408);
    obj.layout12:setWidth(35);
    obj.layout12:setHeight(32);
    obj.layout12:setName("layout12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(18);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(35);
    obj.edit9:setHeight(33);
    obj.edit9:setField("Perception");
    obj.edit9:setName("edit9");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(606);
    obj.layout13:setTop(447);
    obj.layout13:setWidth(22);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout13);
    obj.edit10:setFontSize(18);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setTransparent(true);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(22);
    obj.edit10:setHeight(26);
    obj.edit10:setField("Perception_Modifier");
    obj.edit10:setName("edit10");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(625);
    obj.layout14:setTop(605);
    obj.layout14:setWidth(47);
    obj.layout14:setHeight(44);
    obj.layout14:setName("layout14");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout14);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(32);
    obj.edit11:setFontColor("#a83232");
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(47);
    obj.edit11:setHeight(45);
    obj.edit11:setField("Will");
    obj.edit11:setName("edit11");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(581);
    obj.layout15:setTop(607);
    obj.layout15:setWidth(27);
    obj.layout15:setHeight(28);
    obj.layout15:setName("layout15");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout15);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(18);
    obj.edit12:setFontColor("#a83232");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(27);
    obj.edit12:setHeight(29);
    obj.edit12:setField("Will_Modifier");
    obj.edit12:setName("edit12");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(255);
    obj.layout16:setTop(470);
    obj.layout16:setWidth(35);
    obj.layout16:setHeight(32);
    obj.layout16:setName("layout16");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout16);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(18);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(35);
    obj.edit13:setHeight(33);
    obj.edit13:setField("Size");
    obj.edit13:setName("edit13");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(216);
    obj.layout17:setTop(520);
    obj.layout17:setWidth(35);
    obj.layout17:setHeight(32);
    obj.layout17:setName("layout17");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout17);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(18);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(35);
    obj.edit14:setHeight(33);
    obj.edit14:setField("Speed");
    obj.edit14:setName("edit14");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(26);
    obj.layout18:setTop(125);
    obj.layout18:setWidth(283);
    obj.layout18:setHeight(187);
    obj.layout18:setName("layout18");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout18);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(283);
    obj.textEditor1:setHeight(187);
    obj.textEditor1:setFontSize(14.2);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Description");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(601);
    obj.layout19:setTop(47);
    obj.layout19:setWidth(298);
    obj.layout19:setHeight(255);
    obj.layout19:setName("layout19");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout19);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(298);
    obj.textEditor2:setHeight(255);
    obj.textEditor2:setFontSize(14.2);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("Professions");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(542);
    obj.layout20:setTop(36);
    obj.layout20:setWidth(35);
    obj.layout20:setHeight(32);
    obj.layout20:setName("layout20");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout20);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(14.2);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(35);
    obj.edit15:setHeight(33);
    obj.edit15:setField("Level");
    obj.edit15:setName("edit15");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(25);
    obj.layout21:setTop(349);
    obj.layout21:setWidth(180);
    obj.layout21:setHeight(586);
    obj.layout21:setName("layout21");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout21);
    obj.textEditor3:setLeft(0);
    obj.textEditor3:setTop(0);
    obj.textEditor3:setWidth(180);
    obj.textEditor3:setHeight(586);
    obj.textEditor3:setFontSize(14.2);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("Talents");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(18);
    obj.layout22:setTop(976);
    obj.layout22:setWidth(380);
    obj.layout22:setHeight(192);
    obj.layout22:setName("layout22");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout22);
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(100);
    obj.edit16:setHeight(31);
    obj.edit16:setFontSize(14);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setField("Weapon_1");
    obj.edit16:setTransparent(false);
    obj.edit16:setHint("Nome");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout22);
    obj.edit17:setLeft(0);
    obj.edit17:setTop(32);
    obj.edit17:setWidth(100);
    obj.edit17:setHeight(31);
    obj.edit17:setFontSize(14);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setField("Weapon_2");
    obj.edit17:setTransparent(false);
    obj.edit17:setHint("Nome");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout22);
    obj.edit18:setLeft(0);
    obj.edit18:setTop(64);
    obj.edit18:setWidth(100);
    obj.edit18:setHeight(31);
    obj.edit18:setFontSize(14);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setField("Weapon_3");
    obj.edit18:setTransparent(false);
    obj.edit18:setHint("Nome");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout22);
    obj.edit19:setLeft(0);
    obj.edit19:setTop(96);
    obj.edit19:setWidth(100);
    obj.edit19:setHeight(31);
    obj.edit19:setFontSize(14);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setField("Weapon_4");
    obj.edit19:setTransparent(false);
    obj.edit19:setHint("Nome");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout22);
    obj.edit20:setLeft(0);
    obj.edit20:setTop(128);
    obj.edit20:setWidth(100);
    obj.edit20:setHeight(31);
    obj.edit20:setFontSize(14);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setField("Weapon_5");
    obj.edit20:setTransparent(false);
    obj.edit20:setHint("Nome");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout22);
    obj.edit21:setLeft(0);
    obj.edit21:setTop(160);
    obj.edit21:setWidth(100);
    obj.edit21:setHeight(31);
    obj.edit21:setFontSize(14);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setField("Weapon_6");
    obj.edit21:setTransparent(false);
    obj.edit21:setHint("Nome");
    obj.edit21:setName("edit21");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout22);
    obj.comboBox1:setLeft(100);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setFontSize(14);
    obj.comboBox1:setFontColor("#a83232");
    obj.comboBox1:setTransparent(false);
    obj.comboBox1:setItems({'Strength','Agility'});
    obj.comboBox1:setValues({'Strength','Agility'});
    obj.comboBox1:setValue("{'Strength','Agility'}");
    obj.comboBox1:setField("Attribute_1");
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout22);
    obj.comboBox2:setLeft(100);
    obj.comboBox2:setTop(32);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setFontSize(14);
    obj.comboBox2:setFontColor("#a83232");
    obj.comboBox2:setTransparent(false);
    obj.comboBox2:setItems({'Strength','Agility'});
    obj.comboBox2:setValues({'Strength','Agility'});
    obj.comboBox2:setValue("{'Strength','Agility'}");
    obj.comboBox2:setField("Attribute_2");
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout22);
    obj.comboBox3:setLeft(100);
    obj.comboBox3:setTop(64);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setFontSize(14);
    obj.comboBox3:setFontColor("#a83232");
    obj.comboBox3:setTransparent(false);
    obj.comboBox3:setItems({'Strength','Agility'});
    obj.comboBox3:setValues({'Strength','Agility'});
    obj.comboBox3:setValue("{'Strength','Agility'}");
    obj.comboBox3:setField("Attribute_3");
    obj.comboBox3:setName("comboBox3");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout22);
    obj.comboBox4:setLeft(100);
    obj.comboBox4:setTop(96);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setFontSize(14);
    obj.comboBox4:setFontColor("#a83232");
    obj.comboBox4:setTransparent(false);
    obj.comboBox4:setItems({'Strength','Agility'});
    obj.comboBox4:setValues({'Strength','Agility'});
    obj.comboBox4:setValue("{'Strength','Agility'}");
    obj.comboBox4:setField("Attribute_4");
    obj.comboBox4:setName("comboBox4");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout22);
    obj.comboBox5:setLeft(100);
    obj.comboBox5:setTop(128);
    obj.comboBox5:setWidth(90);
    obj.comboBox5:setFontSize(14);
    obj.comboBox5:setFontColor("#a83232");
    obj.comboBox5:setTransparent(false);
    obj.comboBox5:setItems({'Strength','Agility'});
    obj.comboBox5:setValues({'Strength','Agility'});
    obj.comboBox5:setValue("{'Strength','Agility'}");
    obj.comboBox5:setField("Attribute_5");
    obj.comboBox5:setName("comboBox5");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout22);
    obj.comboBox6:setLeft(100);
    obj.comboBox6:setTop(160);
    obj.comboBox6:setWidth(90);
    obj.comboBox6:setFontSize(14);
    obj.comboBox6:setFontColor("#a83232");
    obj.comboBox6:setTransparent(false);
    obj.comboBox6:setItems({'Strength','Agility'});
    obj.comboBox6:setValues({'Strength','Agility'});
    obj.comboBox6:setValue("{'Strength','Agility'}");
    obj.comboBox6:setField("Attribute_6");
    obj.comboBox6:setName("comboBox6");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout22);
    obj.edit22:setLeft(190);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(60);
    obj.edit22:setHeight(31);
    obj.edit22:setFontSize(14);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setField("Damageroll_1");
    obj.edit22:setTransparent(false);
    obj.edit22:setHint("Dano");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout22);
    obj.edit23:setLeft(190);
    obj.edit23:setTop(32);
    obj.edit23:setWidth(60);
    obj.edit23:setHeight(31);
    obj.edit23:setFontSize(14);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setField("Damageroll_2");
    obj.edit23:setTransparent(false);
    obj.edit23:setHint("Dano");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout22);
    obj.edit24:setLeft(190);
    obj.edit24:setTop(64);
    obj.edit24:setWidth(60);
    obj.edit24:setHeight(31);
    obj.edit24:setFontSize(14);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setField("Damageroll_3");
    obj.edit24:setTransparent(false);
    obj.edit24:setHint("Dano");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout22);
    obj.edit25:setLeft(190);
    obj.edit25:setTop(96);
    obj.edit25:setWidth(60);
    obj.edit25:setHeight(31);
    obj.edit25:setFontSize(14);
    obj.edit25:setFontColor("#000000");
    obj.edit25:setField("Damageroll_4");
    obj.edit25:setTransparent(false);
    obj.edit25:setHint("Dano");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout22);
    obj.edit26:setLeft(190);
    obj.edit26:setTop(128);
    obj.edit26:setWidth(60);
    obj.edit26:setHeight(31);
    obj.edit26:setFontSize(14);
    obj.edit26:setFontColor("#000000");
    obj.edit26:setField("Damageroll_5");
    obj.edit26:setTransparent(false);
    obj.edit26:setHint("Dano");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout22);
    obj.edit27:setLeft(190);
    obj.edit27:setTop(160);
    obj.edit27:setWidth(60);
    obj.edit27:setHeight(31);
    obj.edit27:setFontSize(14);
    obj.edit27:setFontColor("#000000");
    obj.edit27:setField("Damageroll_6");
    obj.edit27:setTransparent(false);
    obj.edit27:setHint("Dano");
    obj.edit27:setName("edit27");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout22);
    obj.button1:setLeft(290);
    obj.button1:setTop(0);
    obj.button1:setWidth(30);
    obj.button1:setHeight(30);
    obj.button1:setFontSize(10);
    obj.button1:setText("Atk");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout22);
    obj.button2:setLeft(320);
    obj.button2:setTop(0);
    obj.button2:setWidth(30);
    obj.button2:setHeight(30);
    obj.button2:setFontSize(10);
    obj.button2:setText("Dmg");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout22);
    obj.button3:setLeft(290);
    obj.button3:setTop(32);
    obj.button3:setWidth(30);
    obj.button3:setHeight(30);
    obj.button3:setFontSize(10);
    obj.button3:setText("Atk");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout22);
    obj.button4:setLeft(320);
    obj.button4:setTop(32);
    obj.button4:setWidth(30);
    obj.button4:setHeight(30);
    obj.button4:setFontSize(10);
    obj.button4:setText("Dmg");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout22);
    obj.button5:setLeft(290);
    obj.button5:setTop(64);
    obj.button5:setWidth(30);
    obj.button5:setHeight(30);
    obj.button5:setFontSize(10);
    obj.button5:setText("Atk");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout22);
    obj.button6:setLeft(320);
    obj.button6:setTop(64);
    obj.button6:setWidth(30);
    obj.button6:setHeight(30);
    obj.button6:setFontSize(10);
    obj.button6:setText("Dmg");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout22);
    obj.button7:setLeft(290);
    obj.button7:setTop(96);
    obj.button7:setWidth(30);
    obj.button7:setHeight(30);
    obj.button7:setFontSize(10);
    obj.button7:setText("Atk");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout22);
    obj.button8:setLeft(320);
    obj.button8:setTop(96);
    obj.button8:setWidth(30);
    obj.button8:setHeight(30);
    obj.button8:setFontSize(10);
    obj.button8:setText("Dmg");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout22);
    obj.button9:setLeft(290);
    obj.button9:setTop(128);
    obj.button9:setWidth(30);
    obj.button9:setHeight(30);
    obj.button9:setFontSize(10);
    obj.button9:setText("Atk");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout22);
    obj.button10:setLeft(320);
    obj.button10:setTop(128);
    obj.button10:setWidth(30);
    obj.button10:setHeight(30);
    obj.button10:setFontSize(10);
    obj.button10:setText("Dmg");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout22);
    obj.button11:setLeft(290);
    obj.button11:setTop(160);
    obj.button11:setWidth(30);
    obj.button11:setHeight(30);
    obj.button11:setFontSize(10);
    obj.button11:setText("Atk");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout22);
    obj.button12:setLeft(320);
    obj.button12:setTop(160);
    obj.button12:setWidth(30);
    obj.button12:setHeight(30);
    obj.button12:setFontSize(10);
    obj.button12:setText("Dmg");
    obj.button12:setName("button12");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(380);
    obj.layout23:setTop(979);
    obj.layout23:setWidth(662);
    obj.layout23:setHeight(187);
    obj.layout23:setName("layout23");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout23);
    obj.textEditor4:setLeft(0);
    obj.textEditor4:setTop(0);
    obj.textEditor4:setWidth(210);
    obj.textEditor4:setHeight(187);
    obj.textEditor4:setFontSize(14.2);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setField("Equipment_1");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout23);
    obj.textEditor5:setLeft(210);
    obj.textEditor5:setTop(0);
    obj.textEditor5:setWidth(210);
    obj.textEditor5:setHeight(187);
    obj.textEditor5:setFontSize(14.2);
    obj.textEditor5:setFontColor("#000000");
    obj.textEditor5:setField("Equipment_2");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(318);
    obj.layout24:setTop(124);
    obj.layout24:setWidth(261);
    obj.layout24:setHeight(35);
    obj.layout24:setName("layout24");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout24);
    obj.edit28:setLeft(0);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(261);
    obj.edit28:setHeight(35);
    obj.edit28:setFontSize(14.2);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setFontColor("#000000");
    obj.edit28:setField("Novice");
    obj.edit28:setTransparent(true);
    obj.edit28:setName("edit28");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(318);
    obj.layout25:setTop(191);
    obj.layout25:setWidth(261);
    obj.layout25:setHeight(35);
    obj.layout25:setName("layout25");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout25);
    obj.edit29:setLeft(0);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(261);
    obj.edit29:setHeight(35);
    obj.edit29:setFontSize(14.2);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setFontColor("#000000");
    obj.edit29:setField("Expert");
    obj.edit29:setTransparent(true);
    obj.edit29:setName("edit29");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(318);
    obj.layout26:setTop(257);
    obj.layout26:setWidth(261);
    obj.layout26:setHeight(54);
    obj.layout26:setName("layout26");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout26);
    obj.edit30:setLeft(0);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(261);
    obj.edit30:setHeight(54);
    obj.edit30:setFontSize(14.2);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setFontColor("#000000");
    obj.edit30:setField("Master");
    obj.edit30:setTransparent(true);
    obj.edit30:setName("edit30");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(687);
    obj.layout27:setTop(352);
    obj.layout27:setWidth(211);
    obj.layout27:setHeight(583);
    obj.layout27:setName("layout27");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout27);
    obj.textEditor6:setLeft(0);
    obj.textEditor6:setTop(0);
    obj.textEditor6:setWidth(211);
    obj.textEditor6:setHeight(583);
    obj.textEditor6:setFontSize(14.2);
    obj.textEditor6:setFontColor("#000000");
    obj.textEditor6:setField("Magic");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(618);
    obj.layout28:setTop(319);
    obj.layout28:setWidth(35);
    obj.layout28:setHeight(32);
    obj.layout28:setName("layout28");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout28);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontSize(18);
    obj.edit31:setFontColor("#000000");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(35);
    obj.edit31:setHeight(33);
    obj.edit31:setField("Power");
    obj.edit31:setName("edit31");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(626);
    obj.layout29:setTop(539);
    obj.layout29:setWidth(35);
    obj.layout29:setHeight(32);
    obj.layout29:setName("layout29");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout29);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontSize(18);
    obj.edit32:setFontColor("#000000");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(0);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(35);
    obj.edit32:setHeight(33);
    obj.edit32:setField("Insanity");
    obj.edit32:setName("edit32");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(594);
    obj.layout30:setTop(744);
    obj.layout30:setWidth(35);
    obj.layout30:setHeight(32);
    obj.layout30:setName("layout30");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout30);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontSize(18);
    obj.edit33:setFontColor("#000000");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(0);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(35);
    obj.edit33:setHeight(33);
    obj.edit33:setField("Corruption");
    obj.edit33:setName("edit33");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(399);
    obj.layout31:setTop(532);
    obj.layout31:setWidth(110);
    obj.layout31:setHeight(86);
    obj.layout31:setName("layout31");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout31);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontSize(32);
    obj.edit34:setFontColor("#000000");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(0);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(110);
    obj.edit34:setHeight(87);
    obj.edit34:setField("Damage");
    obj.edit34:setName("edit34");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(210);
    obj.layout32:setTop(838);
    obj.layout32:setWidth(472);
    obj.layout32:setHeight(96);
    obj.layout32:setName("layout32");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout32);
    obj.textEditor7:setLeft(0);
    obj.textEditor7:setTop(0);
    obj.textEditor7:setWidth(472);
    obj.textEditor7:setHeight(96);
    obj.textEditor7:setFontSize(14.2);
    obj.textEditor7:setFontColor("#000000");
    obj.textEditor7:setField("Notes");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(400);
    obj.layout33:setTop(330);
    obj.layout33:setHeight(100);
    obj.layout33:setWidth(160);
    obj.layout33:setName("layout33");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout33);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setHeight(40);
    obj.label4:setWidth(80);
    obj.label4:setFontSize(16);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("#a83232");
    obj.label4:setText("Boons/Banes");
    obj.label4:setName("label4");
    obj.label4:setTextTrimming("none");
    obj.label4:setWordWrap(false);
    obj.label4:setAutoSize(true);

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout33);
    obj.comboBox7:setLeft(10);
    obj.comboBox7:setTop(30);
    obj.comboBox7:setWidth(60);
    obj.comboBox7:setFontSize(14);
    obj.comboBox7:setFontColor("#a83232");
    obj.comboBox7:setTransparent(false);
    obj.comboBox7:setItems({'-5','-4','-3','-2','-1','0','+1','+2','+3','+4','+5'});
    obj.comboBox7:setValue("{-5,-4,-3,-2,-1,0,+1,+2,+3,+4,+5}");
    obj.comboBox7:setText("0");
    obj.comboBox7:setField("BoonsBanes");
    obj.comboBox7:setName("comboBox7");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("Strength");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setField("Agility");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle1);
    obj.dataLink3:setField("Intellect");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle1);
    obj.dataLink4:setField("Will");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle1);
    obj.dataLink5:setField("Perception");
    obj.dataLink5:setName("dataLink5");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local weaponName = sheet.Weapon_1;
                                    local attribute;
            						local attackRoll = Firecast.interpretarRolagem("1d20");
                                    local boonBaneLocalRoll = 0;
                                    local characterTable = Firecast.getMesaDe(sheet);
                                    local boonBaneBonus = 0;
            						local operation;
                                    local boonOrBane;
            
                                    if sheet.BoonsBanes == '0' or sheet.BoonsBanes == nil then 
                                        if sheet.Attribute_1 == 'Strength' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Strength_Modifier):concatenar(attackRoll);
                                        elseif sheet.Attribute_1 == 'Agility' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Agility_Modifier):concatenar(attackRoll);
                                        else 
                                            characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque");
                                            return;
                                        end;
            
                                        if weaponName == '' then
                                            weaponName = "Weapon without name"
                                        end;
                                
                                        if characterTable ~= nil then
                                            characterTable.chat:rolarDados(attackRoll, weaponName);
                                        end;
            
                                    else
                                        if (tonumber(sheet.BoonsBanes) > 0) then
                                            boonOrBane = " Boon";
                                            if(tonumber(sheet.BoonsBanes) > 1) then
                                                boonOrBane = " Boons";
                                        end;
                                        elseif (0 > tonumber(sheet.BoonsBanes)) then
                                            boonOrBane = " Bane";
                                            if(-1 > tonumber(sheet.BoonsBanes)) then
                                                boonOrBane = " Banes";
                                            end;
                                        end;
                                        boonBaneLocalRoll = Firecast.interpretarRolagem((sheet.BoonsBanes):sub(2) .. "d6");
            
                                        characterTable.chat:rolarDados(boonBaneLocalRoll, sheet.BoonsBanes .. boonOrBane,
                                            function (rollResult)
            
                                                for i=1,#rollResult.ops,1 do
                                                    operation = rollResult.ops[i];
                                                    for j=1, #operation.resultados,1 do
                                                        if operation.resultados[j] > boonBaneBonus then
                                                            boonBaneBonus = operation.resultados[j];
                                                        end;
                                                    end;
                                                end;
            									
                                                local attributeModifier;
            
            									if sheet.Attribute_1 == 'Strength' then
                                                    attributeModifier = sheet.Strength_Modifier;
                                                elseif sheet.Attribute_1 == 'Agility' then
                                                    attributeModifier = sheet.Agility_Modifier;
                                                else 
                                                    characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                                    return;
                                                end;
            
                                                if(0 > tonumber(sheet.BoonsBanes)) then
                                                    boonBaneBonus = tonumber(boonBaneBonus - attributeModifier);
                                                elseif(tonumber(sheet.BoonsBanes) > 0) then
                                                    boonBaneBonus = tonumber(boonBaneBonus + attributeModifier);
                                                    end;
                                                
                                                if(0 > boonBaneBonus) then boonBaneBonus = tostring(boonBaneBonus).sub(2,0); end;
                                                boonBaneBonus = Firecast.interpretarRolagem(boonBaneBonus);
            
                                                attackRoll = Firecast.interpretarRolagem("1d20 "):concatenar(boonBaneBonus);
            
                                                if sheet.Weapon_1 == nil then
                                                    weaponName = "Arma sem nome";
                                                end;
                                        
                                                if characterTable ~= nil then
                                                    characterTable.chat:rolarDados(attackRoll,'Ataque de ' .. weaponName);
                                                end;
                                        end);
                                    end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local characterTable = Firecast.getMesaDe(sheet);
                                    local damageRoll = Firecast.interpretarRolagem(sheet.Damageroll_1);
            						local weaponName;
            
            						if not damageRoll.possuiAlgumDado then
            							return;
                                    end;
            
                                    if sheet.Weapon_1 == nil then
                                        weaponName = "Arma sem nome";
                                    else 
                                        weaponName = sheet.Weapon_1;
                                    end;
            						
                                    if characterTable ~= nil then
            							characterTable.chat:rolarDados(damageRoll, "Dano de " .. weaponName);
                                    end;
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local weaponName = sheet.Weapon_2;
                                    local attribute;
            						local attackRoll = Firecast.interpretarRolagem("1d20");
                                    local boonBaneLocalRoll = 0;
                                    local characterTable = Firecast.getMesaDe(sheet);
                                    local boonBaneBonus = 0;
            						local operation;
                                    local boonOrBane;
            
                                    if sheet.BoonsBanes == '0' or sheet.BoonsBanes == nil then 
                                        if sheet.Attribute_2 == 'Strength' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Strength_Modifier):concatenar(attackRoll);
                                        elseif sheet.Attribute_2 == 'Agility' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Agility_Modifier):concatenar(attackRoll);
                                        else 
                                            characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                            return;
                                        end;
            
                                        if weaponName == '' then
                                            weaponName = "Weapon without name"
                                        end;
                                
                                        if characterTable ~= nil then
                                            characterTable.chat:rolarDados(attackRoll, weaponName);
                                        end;
            
                                    else
                                        if (tonumber(sheet.BoonsBanes) > 0) then
                                            boonOrBane = " Boon";
                                            if(tonumber(sheet.BoonsBanes) > 1) then
                                                boonOrBane = " Boons";
                                        end;
                                        elseif (0 > tonumber(sheet.BoonsBanes)) then
                                            boonOrBane = " Bane";
                                            if(-1 > tonumber(sheet.BoonsBanes)) then
                                                boonOrBane = " Banes";
                                            end;
                                        end;
                                        boonBaneLocalRoll = Firecast.interpretarRolagem((sheet.BoonsBanes):sub(2) .. "d6");
            
                                        characterTable.chat:rolarDados(boonBaneLocalRoll, sheet.BoonsBanes .. boonOrBane,
                                            function (rollResult)
            
                                                for i=1,#rollResult.ops,1 do
                                                    operation = rollResult.ops[i];
                                                    for j=1, #operation.resultados,1 do
                                                        if operation.resultados[j] > boonBaneBonus then
                                                            boonBaneBonus = operation.resultados[j];
                                                        end;
                                                    end;
                                                end;
            									
                                                local attributeModifier;
            
            									if sheet.Attribute_2 == 'Strength' then
                                                    attributeModifier = sheet.Strength_Modifier;
                                                elseif sheet.Attribute_2 == 'Agility' then
                                                    attributeModifier = sheet.Agility_Modifier;
                                                else 
                                                    characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                                    return;
                                                end;
            
                                                if(0 > tonumber(sheet.BoonsBanes)) then
                                                    boonBaneBonus = tonumber(boonBaneBonus - attributeModifier);
                                                elseif(tonumber(sheet.BoonsBanes) > 0) then
                                                    boonBaneBonus = tonumber(boonBaneBonus + attributeModifier);
                                                    end;
                                                
                                                if(0 > boonBaneBonus) then boonBaneBonus = tostring(boonBaneBonus).sub(2,0); end;
                                                boonBaneBonus = Firecast.interpretarRolagem(boonBaneBonus);
            
                                                attackRoll = Firecast.interpretarRolagem("1d20 "):concatenar(boonBaneBonus);
            
                                                if sheet.Weapon_2 == nil then
                                                    weaponName = "Arma sem nome";
                                                end;
                                        
                                                if characterTable ~= nil then
                                                    characterTable.chat:rolarDados(attackRoll,'Ataque de ' .. weaponName);
                                                end;
                                        end);
                                    end;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            local characterTable = Firecast.getMesaDe(sheet);
                                    local damageRoll = Firecast.interpretarRolagem(sheet.Damageroll_2);
            						local weaponName;
            
            						if not damageRoll.possuiAlgumDado then
            							return;
                                    end;
            
                                    if sheet.Weapon_2 == nil then
                                        weaponName = "Arma sem nome";
                                    else 
                                        weaponName = sheet.Weapon_2;
                                    end;
            						
                                    if characterTable ~= nil then
            							characterTable.chat:rolarDados(damageRoll, "Dano de " .. weaponName);
                                    end;
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            local weaponName = sheet.Weapon_3;
                                    local attribute;
            						local attackRoll = Firecast.interpretarRolagem("1d20");
                                    local boonBaneLocalRoll = 0;
                                    local characterTable = Firecast.getMesaDe(sheet);
                                    local boonBaneBonus = 0;
            						local operation;
                                    local boonOrBane;
            
                                    if sheet.BoonsBanes == '0' or sheet.BoonsBanes == nil then 
                                        if sheet.Attribute_3 == 'Strength' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Strength_Modifier):concatenar(attackRoll);
                                        elseif sheet.Attribute_3 == 'Agility' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Agility_Modifier):concatenar(attackRoll);
                                        else 
                                            characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                            return;
                                        end;
            
                                        if weaponName == '' then
                                            weaponName = "Weapon without name"
                                        end;
                                
                                        if characterTable ~= nil then
                                            characterTable.chat:rolarDados(attackRoll, weaponName);
                                        end;
            
                                    else
                                        if (tonumber(sheet.BoonsBanes) > 0) then
                                            boonOrBane = " Boon";
                                            if(tonumber(sheet.BoonsBanes) > 1) then
                                                boonOrBane = " Boons";
                                        end;
                                        elseif (0 > tonumber(sheet.BoonsBanes)) then
                                            boonOrBane = " Bane";
                                            if(-1 > tonumber(sheet.BoonsBanes)) then
                                                boonOrBane = " Banes";
                                            end;
                                        end;
                                        boonBaneLocalRoll = Firecast.interpretarRolagem((sheet.BoonsBanes):sub(2) .. "d6");
            
                                        characterTable.chat:rolarDados(boonBaneLocalRoll, sheet.BoonsBanes .. boonOrBane,
                                            function (rollResult)
            
                                                for i=1,#rollResult.ops,1 do
                                                    operation = rollResult.ops[i];
                                                    for j=1, #operation.resultados,1 do
                                                        if operation.resultados[j] > boonBaneBonus then
                                                            boonBaneBonus = operation.resultados[j];
                                                        end;
                                                    end;
                                                end;
            									
                                                local attributeModifier;
            
            									if sheet.Attribute_3 == 'Strength' then
                                                    attributeModifier = sheet.Strength_Modifier;
                                                elseif sheet.Attribute_3 == 'Agility' then
                                                    attributeModifier = sheet.Agility_Modifier;
                                                else 
                                                    characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                                    return;
                                                end;
            
                                                if(0 > tonumber(sheet.BoonsBanes)) then
                                                    boonBaneBonus = tonumber(boonBaneBonus - attributeModifier);
                                                elseif(tonumber(sheet.BoonsBanes) > 0) then
                                                    boonBaneBonus = tonumber(boonBaneBonus + attributeModifier);
                                                    end;
                                                
                                                if(0 > boonBaneBonus) then boonBaneBonus = tostring(boonBaneBonus).sub(2,0); end;
                                                boonBaneBonus = Firecast.interpretarRolagem(boonBaneBonus);
            
                                                attackRoll = Firecast.interpretarRolagem("1d20 "):concatenar(boonBaneBonus);
            
                                                if sheet.Weapon_3 == nil then
                                                    weaponName = "Arma sem nome";
                                                end;
                                        
                                                if characterTable ~= nil then
                                                    characterTable.chat:rolarDados(attackRoll,'Ataque de ' .. weaponName);
                                                end;
                                        end);
                                    end;
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            local characterTable = Firecast.getMesaDe(sheet);
                                    local damageRoll = Firecast.interpretarRolagem(sheet.Damageroll_3);
            						local weaponName;
                                    
            						if not damageRoll.possuiAlgumDado then
            							return;
                                    end;
            
                                    if sheet.Weapon_31 == nil then
                                        weaponName = "Arma sem nome";
                                    else 
                                        weaponName = sheet.Weapon_3;
                                    end;
            						
                                    if characterTable ~= nil then
            							characterTable.chat:rolarDados(damageRoll, "Dano de " .. weaponName);
                                    end;
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            local weaponName = sheet.Weapon_4;
                                    local attribute;
            						local attackRoll = Firecast.interpretarRolagem("1d20");
                                    local boonBaneLocalRoll = 0;
                                    local characterTable = Firecast.getMesaDe(sheet);
                                    local boonBaneBonus = 0;
            						local operation;
                                    local boonOrBane;
            
                                    if sheet.BoonsBanes == '0' or sheet.BoonsBanes == nil then 
                                        if sheet.Attribute_4 == 'Strength' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Strength_Modifier):concatenar(attackRoll);
                                        elseif sheet.Attribute_4 == 'Agility' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Agility_Modifier):concatenar(attackRoll);
                                        else 
                                            characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                            return;
                                        end;
            
                                        if weaponName == '' then
                                            weaponName = "Weapon without name"
                                        end;
                                
                                        if characterTable ~= nil then
                                            characterTable.chat:rolarDados(attackRoll, weaponName);
                                        end;
            
                                    else
                                        if (tonumber(sheet.BoonsBanes) > 0) then
                                            boonOrBane = " Boon";
                                            if(tonumber(sheet.BoonsBanes) > 1) then
                                                boonOrBane = " Boons";
                                        end;
                                        elseif (0 > tonumber(sheet.BoonsBanes)) then
                                            boonOrBane = " Bane";
                                            if(-1 > tonumber(sheet.BoonsBanes)) then
                                                boonOrBane = " Banes";
                                            end;
                                        end;
                                        boonBaneLocalRoll = Firecast.interpretarRolagem((sheet.BoonsBanes):sub(2) .. "d6");
            
                                        characterTable.chat:rolarDados(boonBaneLocalRoll, sheet.BoonsBanes .. boonOrBane,
                                            function (rollResult)
            
                                                for i=1,#rollResult.ops,1 do
                                                    operation = rollResult.ops[i];
                                                    for j=1, #operation.resultados,1 do
                                                        if operation.resultados[j] > boonBaneBonus then
                                                            boonBaneBonus = operation.resultados[j];
                                                        end;
                                                    end;
                                                end;
            									
                                                local attributeModifier;
            
            									if sheet.Attribute_4 == 'Strength' then
                                                    attributeModifier = sheet.Strength_Modifier;
                                                elseif sheet.Attribute_4 == 'Agility' then
                                                    attributeModifier = sheet.Agility_Modifier;
                                                else 
                                                    characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                                    return;
                                                end;
            
                                                if(0 > tonumber(sheet.BoonsBanes)) then
                                                    boonBaneBonus = tonumber(boonBaneBonus - attributeModifier);
                                                elseif(tonumber(sheet.BoonsBanes) > 0) then
                                                    boonBaneBonus = tonumber(boonBaneBonus + attributeModifier);
                                                    end;
                                                
                                                if(0 > boonBaneBonus) then boonBaneBonus = tostring(boonBaneBonus).sub(2,0); end;
                                                boonBaneBonus = Firecast.interpretarRolagem(boonBaneBonus);
            
                                                attackRoll = Firecast.interpretarRolagem("1d20 "):concatenar(boonBaneBonus);
            
                                                if sheet.Weapon_4 == nil then
                                                    weaponName = "Arma sem nome";
                                                end;
                                        
                                                if characterTable ~= nil then
                                                    characterTable.chat:rolarDados(attackRoll,'Ataque de ' .. weaponName);
                                                end;
                                        end);
                                    end;
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            local characterTable = Firecast.getMesaDe(sheet);
                                    local damageRoll = Firecast.interpretarRolagem(sheet.Damageroll_4);
            						local weaponName;
                                    
            						if not damageRoll.possuiAlgumDado then
            							return;
                                    end;
            
                                    if sheet.Weapon_4 == nil then
                                        weaponName = "Arma sem nome";
                                    else 
                                        weaponName = sheet.Weapon_4;
                                    end;
            						
                                    if characterTable ~= nil then
            							characterTable.chat:rolarDados(damageRoll, "Dano de " .. weaponName);
                                    end;
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            local weaponName = sheet.Weapon_5;
                                    local attribute = sheet.Attribute_5;
            						local attackRoll = Firecast.interpretarRolagem("1d20");
                                    local boonBaneLocalRoll = 0;
                                    local characterTable = Firecast.getMesaDe(sheet);
                                    local boonBaneBonus = 0;
            						local operation;
                                    local boonOrBane;
            
                                    if sheet.BoonsBanes == '0' then 
            
                                        if attribute == 'Strength' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Strength_Modifier):concatenar(attackRoll);
                                        elseif attribute == 'Agility' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Agility_Modifier):concatenar(attackRoll);
                                        else 
                                            characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                            return;
                                        end;
            
                                        if weaponName == '' then
                                            weaponName = "Weapon without name"
                                        end;
                                
                                        if characterTable ~= nil then
                                            characterTable.chat:rolarDados(attackRoll, weaponName);
                                        end;
            
                                    else
                                        if (tonumber(sheet.BoonsBanes) > 0) then
                                            boonOrBane = " Boon";
                                            if(tonumber(sheet.BoonsBanes) > 1) then
                                                boonOrBane = " Boons";
                                        end;
                                        elseif (0 > tonumber(sheet.BoonsBanes)) then
                                            boonOrBane = " Bane";
                                            if(-1 > tonumber(sheet.BoonsBanes)) then
                                                boonOrBane = " Banes";
                                            end;
                                        end;
            
                                        boonBaneLocalRoll = Firecast.interpretarRolagem((sheet.BoonsBanes):sub(2) .. "d6");
            
                                        characterTable.chat:rolarDados(boonBaneLocalRoll, sheet.BoonsBanes .. boonOrBane,
                                            function (rollResult)
            
                                                for i=1,#rollResult.ops,1 do
                                                    operation = rollResult.ops[i];
                                                    for j=1, #operation.resultados,1 do
                                                        if operation.resultados[j] > boonBaneBonus then
                                                            boonBaneBonus = operation.resultados[j];
                                                        end;
                                                    end;
                                                end;
            									
            									local attributeModifier;
            
            									if sheet.Attribute_5 == 'Strength' then
                                                    attributeModifier = sheet.Strength_Modifier;
                                                elseif sheet.Attribute_5 == 'Agility' then
                                                    attributeModifier = sheet.Agility_Modifier;
                                                else 
                                                    characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                                    return;
                                                end;
            
                                                if(0 > tonumber(sheet.BoonsBanes)) then
                                                    boonBaneBonus = tonumber(boonBaneBonus - attributeModifier);
                                                elseif(tonumber(sheet.BoonsBanes) > 0) then
                                                    boonBaneBonus = tonumber(boonBaneBonus + attributeModifier);
                                                    end;
                                                
                                                if(0 > boonBaneBonus) then boonBaneBonus = tostring(boonBaneBonus).sub(2,0); end;
                                                boonBaneBonus = Firecast.interpretarRolagem(boonBaneBonus);
            
                                                attackRoll = Firecast.interpretarRolagem("1d20 "):concatenar(boonBaneBonus);
            
                                                if sheet.Weapon_5 == nil then
                                                    weaponName = "Arma sem nome";
                                                end;
                                        
                                                if characterTable ~= nil then
                                                    characterTable.chat:rolarDados(attackRoll,'Ataque de ' .. weaponName);
                                                end;
                                        end);
                                    end;
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            local characterTable = Firecast.getMesaDe(sheet);
                                    local damageRoll = Firecast.interpretarRolagem(sheet.Damageroll_5);
            						local weaponName;
                                    
            						if not damageRoll.possuiAlgumDado then
            							return;
                                    end;
            
                                    if sheet.Weapon_5 == nil then
                                        weaponName = "Arma sem nome";
                                    else 
                                        weaponName = sheet.Weapon_5;
                                    end;
            						
                                    if characterTable ~= nil then
            							characterTable.chat:rolarDados(damageRoll, "Dano de " .. weaponName);
                                    end;
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            local weaponName = sheet.Weapon_6;
                                    local attribute = sheet.Attribute_6;
            						local attackRoll = Firecast.interpretarRolagem("1d20");
                                    local boonBaneLocalRoll = 0;
                                    local characterTable = Firecast.getMesaDe(sheet);
                                    local boonBaneBonus = 0;
            						local operation;
                                    local boonOrBane;
            
                                    if sheet.BoonsBanes == '0' then 
            
                                        if attribute == 'Strength' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Strength_Modifier):concatenar(attackRoll);
                                        elseif attribute == 'Agility' then
                                            attackRoll = Firecast.interpretarRolagem(sheet.Agility_Modifier):concatenar(attackRoll);
                                        else 
                                            characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                            return;
                                        end;
            
                                        if weaponName == '' then
                                            weaponName = "Weapon without name"
                                        end;
                                
                                        if characterTable ~= nil then
                                            characterTable.chat:rolarDados(attackRoll, weaponName);
                                        end;
            
                                    else
                                        if (tonumber(sheet.BoonsBanes) > 0) then
                                            boonOrBane = " Boon";
                                            if(tonumber(sheet.BoonsBanes) > 1) then
                                                boonOrBane = " Boons";
                                        end;
                                        elseif (0 > tonumber(sheet.BoonsBanes)) then
                                            boonOrBane = " Bane";
                                            if(-1 > tonumber(sheet.BoonsBanes)) then
                                                boonOrBane = " Banes";
                                            end;
                                        end;
            
                                        boonBaneLocalRoll = Firecast.interpretarRolagem((sheet.BoonsBanes):sub(2) .. "d6");
            
                                        characterTable.chat:rolarDados(boonBaneLocalRoll, sheet.BoonsBanes .. boonOrBane,
                                            function (rollResult)
            
                                                for i=1,#rollResult.ops,1 do
                                                    operation = rollResult.ops[i];
                                                    for j=1, #operation.resultados,1 do
                                                        if operation.resultados[j] > boonBaneBonus then
                                                            boonBaneBonus = operation.resultados[j];
                                                        end;
                                                    end;
                                                end;
            									
            									local attributeModifier;
            
            									if sheet.Attribute_6 == 'Strength' then
                                                    attributeModifier = sheet.Strength_Modifier;
                                                elseif sheet.Attribute_6 == 'Agility' then
                                                    attributeModifier = sheet.Agility_Modifier;
                                                else 
                                                    characterTable.chat:enviarMensagem("Escolha um atributo para a rolagem de ataque.");
                                                    return;
                                                end;
            
                                                if(0 > tonumber(sheet.BoonsBanes)) then
                                                    boonBaneBonus = tonumber(boonBaneBonus - attributeModifier);
                                                elseif(tonumber(sheet.BoonsBanes) > 0) then
                                                    boonBaneBonus = tonumber(boonBaneBonus + attributeModifier);
                                                    end;
                                                
                                                if(0 > boonBaneBonus) then boonBaneBonus = tostring(boonBaneBonus).sub(2,0); end;
                                                boonBaneBonus = Firecast.interpretarRolagem(boonBaneBonus);
            
                                                attackRoll = Firecast.interpretarRolagem("1d20 "):concatenar(boonBaneBonus);
            
                                                if sheet.Weapon_6 == nil then
                                                    weaponName = "Arma sem nome";
                                                end;
                                        
                                                if characterTable ~= nil then
                                                    characterTable.chat:rolarDados(attackRoll,'Ataque de ' .. weaponName);
                                                end;
                                        end);
            
                                    end;
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            local characterTable = Firecast.getMesaDe(sheet);
                                    local damageRoll = Firecast.interpretarRolagem(sheet.Damageroll_6);
            						local weaponName;
                                    
            						if not damageRoll.possuiAlgumDado then
            							return;
                                    end;
            
                                    if sheet.Weapon_6 == nil then
                                        weaponName = "Arma sem nome";
                                    else 
                                        weaponName = sheet.Weapon_6;
                                    end;
            						
                                    if characterTable ~= nil then
            							characterTable.chat:rolarDados(damageRoll, "Dano de " .. weaponName);
                                    end;
        end, obj);

    obj._e_event12 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Strength_Modifier = sheet.Strength - 10;
        end, obj);

    obj._e_event13 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Agility_Modifier = sheet.Agility - 10;
        end, obj);

    obj._e_event14 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Intellect_Modifier = sheet.Intellect - 10;
        end, obj);

    obj._e_event15 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Will_Modifier = sheet.Will - 10;
        end, obj);

    obj._e_event16 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Perception_Modifier = sheet.Perception - 10;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
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

        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSODLFillable1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSODLFillable1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSODLFillable1_svg = {
    newEditor = newfrmSODLFillable1_svg, 
    new = newfrmSODLFillable1_svg, 
    name = "frmSODLFillable1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSODLFillable1_svg = _frmSODLFillable1_svg;
Firecast.registrarForm(_frmSODLFillable1_svg);

return _frmSODLFillable1_svg;
