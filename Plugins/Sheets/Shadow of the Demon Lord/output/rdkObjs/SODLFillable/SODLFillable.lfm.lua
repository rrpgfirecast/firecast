require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSODLSheet()
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
    obj:setName("frmSODLSheet");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Valk_Data");
    obj:setTitle("SODLSheet");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Página 1");
    obj.tab1:setName("tab1");

    obj.frmSODLFillable1_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSODLFillable1_svg:setParent(obj.tab1);
    obj.frmSODLFillable1_svg:setName("frmSODLFillable1_svg");
    obj.frmSODLFillable1_svg:setAlign("client");
    obj.frmSODLFillable1_svg:setTheme("light");
    obj.frmSODLFillable1_svg:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmSODLFillable1_svg);
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

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Página 2");
    obj.tab2:setName("tab2");

    obj.frmSODLFillable2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSODLFillable2_svg:setParent(obj.tab2);
    obj.frmSODLFillable2_svg:setName("frmSODLFillable2_svg");
    obj.frmSODLFillable2_svg:setAlign("client");
    obj.frmSODLFillable2_svg:setTheme("light");
    obj.frmSODLFillable2_svg:setMargins({top=1});

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmSODLFillable2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox2);
    obj.rectangle2:setWidth(893);
    obj.rectangle2:setHeight(1263);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(893);
    obj.image2:setHeight(1263);
    obj.image2:setSRC("/SODLFillable/images/2.png");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle2);
    obj.layout34:setLeft(0);
    obj.layout34:setTop(0);
    obj.layout34:setWidth(447);
    obj.layout34:setHeight(1263);
    obj.layout34:setName("layout34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout34);
    obj.edit35:setLeft(80);
    obj.edit35:setTop(36);
    obj.edit35:setWidth(160);
    obj.edit35:setHeight(30);
    obj.edit35:setFontSize(16);
    obj.edit35:setFontColor("#000000");
    obj.edit35:setTransparent(true);
    obj.edit35:setField("magicName_0");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout34);
    obj.edit36:setLeft(302);
    obj.edit36:setTop(36);
    obj.edit36:setWidth(90);
    obj.edit36:setHeight(30);
    obj.edit36:setFontSize(16);
    obj.edit36:setFontColor("#000000");
    obj.edit36:setTransparent(true);
    obj.edit36:setField("magicTrad_0");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout34);
    obj.edit37:setLeft(406);
    obj.edit37:setTop(66);
    obj.edit37:setWidth(90);
    obj.edit37:setHeight(30);
    obj.edit37:setFontSize(16);
    obj.edit37:setFontColor("#000000");
    obj.edit37:setTransparent(true);
    obj.edit37:setField("magicLevel_0");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout34);
    obj.edit38:setLeft(370);
    obj.edit38:setTop(98);
    obj.edit38:setWidth(90);
    obj.edit38:setHeight(30);
    obj.edit38:setFontSize(16);
    obj.edit38:setFontColor("#000000");
    obj.edit38:setTransparent(true);
    obj.edit38:setField("magicConj_0");
    obj.edit38:setName("edit38");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35:setLeft(73);
    obj.layout35:setTop(66);
    obj.layout35:setWidth(200);
    obj.layout35:setHeight(20);
    obj.layout35:setName("layout35");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout35);
    obj.imageCheckBox1:setLeft(0);
    obj.imageCheckBox1:setTop(0);
    obj.imageCheckBox1:setWidth(20);
    obj.imageCheckBox1:setHeight(20);
    obj.imageCheckBox1:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox1:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox1:setField("magicCheck_00");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout35);
    obj.imageCheckBox2:setLeft(20);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(20);
    obj.imageCheckBox2:setHeight(20);
    obj.imageCheckBox2:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox2:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox2:setField("magicCheck_01");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout35);
    obj.imageCheckBox3:setLeft(40);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(20);
    obj.imageCheckBox3:setHeight(20);
    obj.imageCheckBox3:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox3:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox3:setField("magicCheck_02");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout35);
    obj.imageCheckBox4:setLeft(60);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(20);
    obj.imageCheckBox4:setHeight(20);
    obj.imageCheckBox4:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox4:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox4:setField("magicCheck_03");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout35);
    obj.imageCheckBox5:setLeft(80);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(20);
    obj.imageCheckBox5:setHeight(20);
    obj.imageCheckBox5:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox5:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox5:setField("magicCheck_04");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout35);
    obj.imageCheckBox6:setLeft(100);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(20);
    obj.imageCheckBox6:setHeight(20);
    obj.imageCheckBox6:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox6:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox6:setField("magicCheck_05");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout35);
    obj.imageCheckBox7:setLeft(120);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(20);
    obj.imageCheckBox7:setHeight(20);
    obj.imageCheckBox7:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox7:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox7:setField("magicCheck_06");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout35);
    obj.imageCheckBox8:setLeft(140);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(20);
    obj.imageCheckBox8:setHeight(20);
    obj.imageCheckBox8:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox8:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox8:setField("magicCheck_07");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout35);
    obj.imageCheckBox9:setLeft(160);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(20);
    obj.imageCheckBox9:setHeight(20);
    obj.imageCheckBox9:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox9:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox9:setField("magicCheck_08");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout35);
    obj.imageCheckBox10:setLeft(180);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(20);
    obj.imageCheckBox10:setHeight(20);
    obj.imageCheckBox10:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox10:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox10:setField("magicCheck_09");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout34);
    obj.textEditor8:setLeft(36);
    obj.textEditor8:setTop(86);
    obj.textEditor8:setWidth(320);
    obj.textEditor8:setHeight(150);
    obj.textEditor8:setFontSize(14);
    obj.textEditor8:setFontColor("#000000");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setField("magicDesc_0");
    obj.textEditor8:setName("textEditor8");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout34);
    obj.edit39:setLeft(80);
    obj.edit39:setTop(242);
    obj.edit39:setWidth(160);
    obj.edit39:setHeight(30);
    obj.edit39:setFontSize(16);
    obj.edit39:setFontColor("#000000");
    obj.edit39:setTransparent(true);
    obj.edit39:setField("magicName_1");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout34);
    obj.edit40:setLeft(302);
    obj.edit40:setTop(242);
    obj.edit40:setWidth(90);
    obj.edit40:setHeight(30);
    obj.edit40:setFontSize(16);
    obj.edit40:setFontColor("#000000");
    obj.edit40:setTransparent(true);
    obj.edit40:setField("magicTrad_1");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout34);
    obj.edit41:setLeft(406);
    obj.edit41:setTop(272);
    obj.edit41:setWidth(90);
    obj.edit41:setHeight(30);
    obj.edit41:setFontSize(16);
    obj.edit41:setFontColor("#000000");
    obj.edit41:setTransparent(true);
    obj.edit41:setField("magicLevel_1");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout34);
    obj.edit42:setLeft(370);
    obj.edit42:setTop(304);
    obj.edit42:setWidth(90);
    obj.edit42:setHeight(30);
    obj.edit42:setFontSize(16);
    obj.edit42:setFontColor("#000000");
    obj.edit42:setTransparent(true);
    obj.edit42:setField("magicConj_1");
    obj.edit42:setName("edit42");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout34);
    obj.layout36:setLeft(73);
    obj.layout36:setTop(272);
    obj.layout36:setWidth(200);
    obj.layout36:setHeight(20);
    obj.layout36:setName("layout36");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout36);
    obj.imageCheckBox11:setLeft(0);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(20);
    obj.imageCheckBox11:setHeight(20);
    obj.imageCheckBox11:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox11:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox11:setField("magicCheck_10");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout36);
    obj.imageCheckBox12:setLeft(20);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(20);
    obj.imageCheckBox12:setHeight(20);
    obj.imageCheckBox12:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox12:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox12:setField("magicCheck_11");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout36);
    obj.imageCheckBox13:setLeft(40);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(20);
    obj.imageCheckBox13:setHeight(20);
    obj.imageCheckBox13:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox13:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox13:setField("magicCheck_12");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout36);
    obj.imageCheckBox14:setLeft(60);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(20);
    obj.imageCheckBox14:setHeight(20);
    obj.imageCheckBox14:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox14:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox14:setField("magicCheck_13");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout36);
    obj.imageCheckBox15:setLeft(80);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(20);
    obj.imageCheckBox15:setHeight(20);
    obj.imageCheckBox15:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox15:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox15:setField("magicCheck_14");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout36);
    obj.imageCheckBox16:setLeft(100);
    obj.imageCheckBox16:setTop(0);
    obj.imageCheckBox16:setWidth(20);
    obj.imageCheckBox16:setHeight(20);
    obj.imageCheckBox16:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox16:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox16:setField("magicCheck_15");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout36);
    obj.imageCheckBox17:setLeft(120);
    obj.imageCheckBox17:setTop(0);
    obj.imageCheckBox17:setWidth(20);
    obj.imageCheckBox17:setHeight(20);
    obj.imageCheckBox17:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox17:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox17:setField("magicCheck_16");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout36);
    obj.imageCheckBox18:setLeft(140);
    obj.imageCheckBox18:setTop(0);
    obj.imageCheckBox18:setWidth(20);
    obj.imageCheckBox18:setHeight(20);
    obj.imageCheckBox18:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox18:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox18:setField("magicCheck_17");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout36);
    obj.imageCheckBox19:setLeft(160);
    obj.imageCheckBox19:setTop(0);
    obj.imageCheckBox19:setWidth(20);
    obj.imageCheckBox19:setHeight(20);
    obj.imageCheckBox19:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox19:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox19:setField("magicCheck_18");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout36);
    obj.imageCheckBox20:setLeft(180);
    obj.imageCheckBox20:setTop(0);
    obj.imageCheckBox20:setWidth(20);
    obj.imageCheckBox20:setHeight(20);
    obj.imageCheckBox20:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox20:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox20:setField("magicCheck_19");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout34);
    obj.textEditor9:setLeft(36);
    obj.textEditor9:setTop(292);
    obj.textEditor9:setWidth(320);
    obj.textEditor9:setHeight(150);
    obj.textEditor9:setFontSize(14);
    obj.textEditor9:setFontColor("#000000");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setField("magicDesc_1");
    obj.textEditor9:setName("textEditor9");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout34);
    obj.edit43:setLeft(80);
    obj.edit43:setTop(448);
    obj.edit43:setWidth(160);
    obj.edit43:setHeight(30);
    obj.edit43:setFontSize(16);
    obj.edit43:setFontColor("#000000");
    obj.edit43:setTransparent(true);
    obj.edit43:setField("magicName_2");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout34);
    obj.edit44:setLeft(302);
    obj.edit44:setTop(448);
    obj.edit44:setWidth(90);
    obj.edit44:setHeight(30);
    obj.edit44:setFontSize(16);
    obj.edit44:setFontColor("#000000");
    obj.edit44:setTransparent(true);
    obj.edit44:setField("magicTrad_2");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout34);
    obj.edit45:setLeft(406);
    obj.edit45:setTop(478);
    obj.edit45:setWidth(90);
    obj.edit45:setHeight(30);
    obj.edit45:setFontSize(16);
    obj.edit45:setFontColor("#000000");
    obj.edit45:setTransparent(true);
    obj.edit45:setField("magicLevel_2");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout34);
    obj.edit46:setLeft(370);
    obj.edit46:setTop(510);
    obj.edit46:setWidth(90);
    obj.edit46:setHeight(30);
    obj.edit46:setFontSize(16);
    obj.edit46:setFontColor("#000000");
    obj.edit46:setTransparent(true);
    obj.edit46:setField("magicConj_2");
    obj.edit46:setName("edit46");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout34);
    obj.layout37:setLeft(73);
    obj.layout37:setTop(478);
    obj.layout37:setWidth(200);
    obj.layout37:setHeight(20);
    obj.layout37:setName("layout37");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout37);
    obj.imageCheckBox21:setLeft(0);
    obj.imageCheckBox21:setTop(0);
    obj.imageCheckBox21:setWidth(20);
    obj.imageCheckBox21:setHeight(20);
    obj.imageCheckBox21:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox21:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox21:setField("magicCheck_20");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout37);
    obj.imageCheckBox22:setLeft(20);
    obj.imageCheckBox22:setTop(0);
    obj.imageCheckBox22:setWidth(20);
    obj.imageCheckBox22:setHeight(20);
    obj.imageCheckBox22:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox22:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox22:setField("magicCheck_21");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout37);
    obj.imageCheckBox23:setLeft(40);
    obj.imageCheckBox23:setTop(0);
    obj.imageCheckBox23:setWidth(20);
    obj.imageCheckBox23:setHeight(20);
    obj.imageCheckBox23:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox23:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox23:setField("magicCheck_22");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout37);
    obj.imageCheckBox24:setLeft(60);
    obj.imageCheckBox24:setTop(0);
    obj.imageCheckBox24:setWidth(20);
    obj.imageCheckBox24:setHeight(20);
    obj.imageCheckBox24:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox24:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox24:setField("magicCheck_23");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout37);
    obj.imageCheckBox25:setLeft(80);
    obj.imageCheckBox25:setTop(0);
    obj.imageCheckBox25:setWidth(20);
    obj.imageCheckBox25:setHeight(20);
    obj.imageCheckBox25:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox25:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox25:setField("magicCheck_24");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout37);
    obj.imageCheckBox26:setLeft(100);
    obj.imageCheckBox26:setTop(0);
    obj.imageCheckBox26:setWidth(20);
    obj.imageCheckBox26:setHeight(20);
    obj.imageCheckBox26:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox26:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox26:setField("magicCheck_25");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout37);
    obj.imageCheckBox27:setLeft(120);
    obj.imageCheckBox27:setTop(0);
    obj.imageCheckBox27:setWidth(20);
    obj.imageCheckBox27:setHeight(20);
    obj.imageCheckBox27:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox27:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox27:setField("magicCheck_26");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout37);
    obj.imageCheckBox28:setLeft(140);
    obj.imageCheckBox28:setTop(0);
    obj.imageCheckBox28:setWidth(20);
    obj.imageCheckBox28:setHeight(20);
    obj.imageCheckBox28:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox28:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox28:setField("magicCheck_27");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout37);
    obj.imageCheckBox29:setLeft(160);
    obj.imageCheckBox29:setTop(0);
    obj.imageCheckBox29:setWidth(20);
    obj.imageCheckBox29:setHeight(20);
    obj.imageCheckBox29:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox29:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox29:setField("magicCheck_28");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout37);
    obj.imageCheckBox30:setLeft(180);
    obj.imageCheckBox30:setTop(0);
    obj.imageCheckBox30:setWidth(20);
    obj.imageCheckBox30:setHeight(20);
    obj.imageCheckBox30:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox30:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox30:setField("magicCheck_29");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout34);
    obj.textEditor10:setLeft(36);
    obj.textEditor10:setTop(498);
    obj.textEditor10:setWidth(320);
    obj.textEditor10:setHeight(150);
    obj.textEditor10:setFontSize(14);
    obj.textEditor10:setFontColor("#000000");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setField("magicDesc_2");
    obj.textEditor10:setName("textEditor10");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout34);
    obj.edit47:setLeft(80);
    obj.edit47:setTop(670);
    obj.edit47:setWidth(160);
    obj.edit47:setHeight(30);
    obj.edit47:setFontSize(16);
    obj.edit47:setFontColor("#000000");
    obj.edit47:setTransparent(true);
    obj.edit47:setField("magicName_4");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout34);
    obj.edit48:setLeft(302);
    obj.edit48:setTop(670);
    obj.edit48:setWidth(90);
    obj.edit48:setHeight(30);
    obj.edit48:setFontSize(16);
    obj.edit48:setFontColor("#000000");
    obj.edit48:setTransparent(true);
    obj.edit48:setField("magicTrad_4");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout34);
    obj.edit49:setLeft(406);
    obj.edit49:setTop(700);
    obj.edit49:setWidth(90);
    obj.edit49:setHeight(30);
    obj.edit49:setFontSize(16);
    obj.edit49:setFontColor("#000000");
    obj.edit49:setTransparent(true);
    obj.edit49:setField("magicLevel_4");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout34);
    obj.edit50:setLeft(370);
    obj.edit50:setTop(732);
    obj.edit50:setWidth(90);
    obj.edit50:setHeight(30);
    obj.edit50:setFontSize(16);
    obj.edit50:setFontColor("#000000");
    obj.edit50:setTransparent(true);
    obj.edit50:setField("magicConj_4");
    obj.edit50:setName("edit50");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout34);
    obj.layout38:setLeft(73);
    obj.layout38:setTop(700);
    obj.layout38:setWidth(200);
    obj.layout38:setHeight(20);
    obj.layout38:setName("layout38");

    obj.imageCheckBox31 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout38);
    obj.imageCheckBox31:setLeft(0);
    obj.imageCheckBox31:setTop(0);
    obj.imageCheckBox31:setWidth(20);
    obj.imageCheckBox31:setHeight(20);
    obj.imageCheckBox31:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox31:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox31:setField("magicCheck_30");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.imageCheckBox32 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout38);
    obj.imageCheckBox32:setLeft(20);
    obj.imageCheckBox32:setTop(0);
    obj.imageCheckBox32:setWidth(20);
    obj.imageCheckBox32:setHeight(20);
    obj.imageCheckBox32:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox32:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox32:setField("magicCheck_31");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.imageCheckBox33 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout38);
    obj.imageCheckBox33:setLeft(40);
    obj.imageCheckBox33:setTop(0);
    obj.imageCheckBox33:setWidth(20);
    obj.imageCheckBox33:setHeight(20);
    obj.imageCheckBox33:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox33:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox33:setField("magicCheck_32");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.imageCheckBox34 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout38);
    obj.imageCheckBox34:setLeft(60);
    obj.imageCheckBox34:setTop(0);
    obj.imageCheckBox34:setWidth(20);
    obj.imageCheckBox34:setHeight(20);
    obj.imageCheckBox34:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox34:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox34:setField("magicCheck_33");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.imageCheckBox35 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout38);
    obj.imageCheckBox35:setLeft(80);
    obj.imageCheckBox35:setTop(0);
    obj.imageCheckBox35:setWidth(20);
    obj.imageCheckBox35:setHeight(20);
    obj.imageCheckBox35:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox35:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox35:setField("magicCheck_34");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.imageCheckBox36 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout38);
    obj.imageCheckBox36:setLeft(100);
    obj.imageCheckBox36:setTop(0);
    obj.imageCheckBox36:setWidth(20);
    obj.imageCheckBox36:setHeight(20);
    obj.imageCheckBox36:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox36:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox36:setField("magicCheck_35");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.imageCheckBox37 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout38);
    obj.imageCheckBox37:setLeft(120);
    obj.imageCheckBox37:setTop(0);
    obj.imageCheckBox37:setWidth(20);
    obj.imageCheckBox37:setHeight(20);
    obj.imageCheckBox37:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox37:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox37:setField("magicCheck_36");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.imageCheckBox38 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout38);
    obj.imageCheckBox38:setLeft(140);
    obj.imageCheckBox38:setTop(0);
    obj.imageCheckBox38:setWidth(20);
    obj.imageCheckBox38:setHeight(20);
    obj.imageCheckBox38:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox38:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox38:setField("magicCheck_37");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.imageCheckBox39 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout38);
    obj.imageCheckBox39:setLeft(160);
    obj.imageCheckBox39:setTop(0);
    obj.imageCheckBox39:setWidth(20);
    obj.imageCheckBox39:setHeight(20);
    obj.imageCheckBox39:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox39:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox39:setField("magicCheck_38");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.imageCheckBox40 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout38);
    obj.imageCheckBox40:setLeft(180);
    obj.imageCheckBox40:setTop(0);
    obj.imageCheckBox40:setWidth(20);
    obj.imageCheckBox40:setHeight(20);
    obj.imageCheckBox40:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox40:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox40:setField("magicCheck_39");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout34);
    obj.textEditor11:setLeft(36);
    obj.textEditor11:setTop(720);
    obj.textEditor11:setWidth(320);
    obj.textEditor11:setHeight(150);
    obj.textEditor11:setFontSize(14);
    obj.textEditor11:setFontColor("#000000");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setField("magicDesc_4");
    obj.textEditor11:setName("textEditor11");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout34);
    obj.edit51:setLeft(80);
    obj.edit51:setTop(856);
    obj.edit51:setWidth(160);
    obj.edit51:setHeight(30);
    obj.edit51:setFontSize(16);
    obj.edit51:setFontColor("#000000");
    obj.edit51:setTransparent(true);
    obj.edit51:setField("magicName_5");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout34);
    obj.edit52:setLeft(302);
    obj.edit52:setTop(856);
    obj.edit52:setWidth(90);
    obj.edit52:setHeight(30);
    obj.edit52:setFontSize(16);
    obj.edit52:setFontColor("#000000");
    obj.edit52:setTransparent(true);
    obj.edit52:setField("magicTrad_5");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout34);
    obj.edit53:setLeft(406);
    obj.edit53:setTop(886);
    obj.edit53:setWidth(90);
    obj.edit53:setHeight(30);
    obj.edit53:setFontSize(16);
    obj.edit53:setFontColor("#000000");
    obj.edit53:setTransparent(true);
    obj.edit53:setField("magicLevel_5");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout34);
    obj.edit54:setLeft(370);
    obj.edit54:setTop(918);
    obj.edit54:setWidth(90);
    obj.edit54:setHeight(30);
    obj.edit54:setFontSize(16);
    obj.edit54:setFontColor("#000000");
    obj.edit54:setTransparent(true);
    obj.edit54:setField("magicConj_5");
    obj.edit54:setName("edit54");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout34);
    obj.layout39:setLeft(73);
    obj.layout39:setTop(886);
    obj.layout39:setWidth(200);
    obj.layout39:setHeight(20);
    obj.layout39:setName("layout39");

    obj.imageCheckBox41 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout39);
    obj.imageCheckBox41:setLeft(0);
    obj.imageCheckBox41:setTop(0);
    obj.imageCheckBox41:setWidth(20);
    obj.imageCheckBox41:setHeight(20);
    obj.imageCheckBox41:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox41:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox41:setField("magicCheck_40");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.imageCheckBox42 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout39);
    obj.imageCheckBox42:setLeft(20);
    obj.imageCheckBox42:setTop(0);
    obj.imageCheckBox42:setWidth(20);
    obj.imageCheckBox42:setHeight(20);
    obj.imageCheckBox42:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox42:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox42:setField("magicCheck_41");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.imageCheckBox43 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox43:setParent(obj.layout39);
    obj.imageCheckBox43:setLeft(40);
    obj.imageCheckBox43:setTop(0);
    obj.imageCheckBox43:setWidth(20);
    obj.imageCheckBox43:setHeight(20);
    obj.imageCheckBox43:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox43:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox43:setField("magicCheck_42");
    obj.imageCheckBox43:setName("imageCheckBox43");

    obj.imageCheckBox44 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox44:setParent(obj.layout39);
    obj.imageCheckBox44:setLeft(60);
    obj.imageCheckBox44:setTop(0);
    obj.imageCheckBox44:setWidth(20);
    obj.imageCheckBox44:setHeight(20);
    obj.imageCheckBox44:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox44:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox44:setField("magicCheck_43");
    obj.imageCheckBox44:setName("imageCheckBox44");

    obj.imageCheckBox45 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox45:setParent(obj.layout39);
    obj.imageCheckBox45:setLeft(80);
    obj.imageCheckBox45:setTop(0);
    obj.imageCheckBox45:setWidth(20);
    obj.imageCheckBox45:setHeight(20);
    obj.imageCheckBox45:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox45:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox45:setField("magicCheck_44");
    obj.imageCheckBox45:setName("imageCheckBox45");

    obj.imageCheckBox46 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox46:setParent(obj.layout39);
    obj.imageCheckBox46:setLeft(100);
    obj.imageCheckBox46:setTop(0);
    obj.imageCheckBox46:setWidth(20);
    obj.imageCheckBox46:setHeight(20);
    obj.imageCheckBox46:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox46:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox46:setField("magicCheck_45");
    obj.imageCheckBox46:setName("imageCheckBox46");

    obj.imageCheckBox47 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox47:setParent(obj.layout39);
    obj.imageCheckBox47:setLeft(120);
    obj.imageCheckBox47:setTop(0);
    obj.imageCheckBox47:setWidth(20);
    obj.imageCheckBox47:setHeight(20);
    obj.imageCheckBox47:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox47:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox47:setField("magicCheck_46");
    obj.imageCheckBox47:setName("imageCheckBox47");

    obj.imageCheckBox48 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox48:setParent(obj.layout39);
    obj.imageCheckBox48:setLeft(140);
    obj.imageCheckBox48:setTop(0);
    obj.imageCheckBox48:setWidth(20);
    obj.imageCheckBox48:setHeight(20);
    obj.imageCheckBox48:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox48:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox48:setField("magicCheck_47");
    obj.imageCheckBox48:setName("imageCheckBox48");

    obj.imageCheckBox49 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox49:setParent(obj.layout39);
    obj.imageCheckBox49:setLeft(160);
    obj.imageCheckBox49:setTop(0);
    obj.imageCheckBox49:setWidth(20);
    obj.imageCheckBox49:setHeight(20);
    obj.imageCheckBox49:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox49:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox49:setField("magicCheck_48");
    obj.imageCheckBox49:setName("imageCheckBox49");

    obj.imageCheckBox50 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox50:setParent(obj.layout39);
    obj.imageCheckBox50:setLeft(180);
    obj.imageCheckBox50:setTop(0);
    obj.imageCheckBox50:setWidth(20);
    obj.imageCheckBox50:setHeight(20);
    obj.imageCheckBox50:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox50:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox50:setField("magicCheck_49");
    obj.imageCheckBox50:setName("imageCheckBox50");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout34);
    obj.textEditor12:setLeft(36);
    obj.textEditor12:setTop(906);
    obj.textEditor12:setWidth(320);
    obj.textEditor12:setHeight(150);
    obj.textEditor12:setFontSize(14);
    obj.textEditor12:setFontColor("#000000");
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setField("magicDesc_5");
    obj.textEditor12:setName("textEditor12");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout34);
    obj.edit55:setLeft(80);
    obj.edit55:setTop(1056);
    obj.edit55:setWidth(160);
    obj.edit55:setHeight(30);
    obj.edit55:setFontSize(16);
    obj.edit55:setFontColor("#000000");
    obj.edit55:setTransparent(true);
    obj.edit55:setField("magicName_6");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout34);
    obj.edit56:setLeft(302);
    obj.edit56:setTop(1056);
    obj.edit56:setWidth(90);
    obj.edit56:setHeight(30);
    obj.edit56:setFontSize(16);
    obj.edit56:setFontColor("#000000");
    obj.edit56:setTransparent(true);
    obj.edit56:setField("magicTrad_6");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout34);
    obj.edit57:setLeft(406);
    obj.edit57:setTop(1086);
    obj.edit57:setWidth(90);
    obj.edit57:setHeight(30);
    obj.edit57:setFontSize(16);
    obj.edit57:setFontColor("#000000");
    obj.edit57:setTransparent(true);
    obj.edit57:setField("magicLevel_6");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout34);
    obj.edit58:setLeft(370);
    obj.edit58:setTop(1118);
    obj.edit58:setWidth(90);
    obj.edit58:setHeight(30);
    obj.edit58:setFontSize(16);
    obj.edit58:setFontColor("#000000");
    obj.edit58:setTransparent(true);
    obj.edit58:setField("magicConj_6");
    obj.edit58:setName("edit58");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout34);
    obj.layout40:setLeft(73);
    obj.layout40:setTop(1086);
    obj.layout40:setWidth(200);
    obj.layout40:setHeight(20);
    obj.layout40:setName("layout40");

    obj.imageCheckBox51 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox51:setParent(obj.layout40);
    obj.imageCheckBox51:setLeft(0);
    obj.imageCheckBox51:setTop(0);
    obj.imageCheckBox51:setWidth(20);
    obj.imageCheckBox51:setHeight(20);
    obj.imageCheckBox51:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox51:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox51:setField("magicCheck_50");
    obj.imageCheckBox51:setName("imageCheckBox51");

    obj.imageCheckBox52 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox52:setParent(obj.layout40);
    obj.imageCheckBox52:setLeft(20);
    obj.imageCheckBox52:setTop(0);
    obj.imageCheckBox52:setWidth(20);
    obj.imageCheckBox52:setHeight(20);
    obj.imageCheckBox52:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox52:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox52:setField("magicCheck_51");
    obj.imageCheckBox52:setName("imageCheckBox52");

    obj.imageCheckBox53 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox53:setParent(obj.layout40);
    obj.imageCheckBox53:setLeft(40);
    obj.imageCheckBox53:setTop(0);
    obj.imageCheckBox53:setWidth(20);
    obj.imageCheckBox53:setHeight(20);
    obj.imageCheckBox53:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox53:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox53:setField("magicCheck_52");
    obj.imageCheckBox53:setName("imageCheckBox53");

    obj.imageCheckBox54 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox54:setParent(obj.layout40);
    obj.imageCheckBox54:setLeft(60);
    obj.imageCheckBox54:setTop(0);
    obj.imageCheckBox54:setWidth(20);
    obj.imageCheckBox54:setHeight(20);
    obj.imageCheckBox54:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox54:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox54:setField("magicCheck_53");
    obj.imageCheckBox54:setName("imageCheckBox54");

    obj.imageCheckBox55 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox55:setParent(obj.layout40);
    obj.imageCheckBox55:setLeft(80);
    obj.imageCheckBox55:setTop(0);
    obj.imageCheckBox55:setWidth(20);
    obj.imageCheckBox55:setHeight(20);
    obj.imageCheckBox55:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox55:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox55:setField("magicCheck_54");
    obj.imageCheckBox55:setName("imageCheckBox55");

    obj.imageCheckBox56 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox56:setParent(obj.layout40);
    obj.imageCheckBox56:setLeft(100);
    obj.imageCheckBox56:setTop(0);
    obj.imageCheckBox56:setWidth(20);
    obj.imageCheckBox56:setHeight(20);
    obj.imageCheckBox56:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox56:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox56:setField("magicCheck_55");
    obj.imageCheckBox56:setName("imageCheckBox56");

    obj.imageCheckBox57 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox57:setParent(obj.layout40);
    obj.imageCheckBox57:setLeft(120);
    obj.imageCheckBox57:setTop(0);
    obj.imageCheckBox57:setWidth(20);
    obj.imageCheckBox57:setHeight(20);
    obj.imageCheckBox57:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox57:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox57:setField("magicCheck_56");
    obj.imageCheckBox57:setName("imageCheckBox57");

    obj.imageCheckBox58 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox58:setParent(obj.layout40);
    obj.imageCheckBox58:setLeft(140);
    obj.imageCheckBox58:setTop(0);
    obj.imageCheckBox58:setWidth(20);
    obj.imageCheckBox58:setHeight(20);
    obj.imageCheckBox58:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox58:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox58:setField("magicCheck_57");
    obj.imageCheckBox58:setName("imageCheckBox58");

    obj.imageCheckBox59 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox59:setParent(obj.layout40);
    obj.imageCheckBox59:setLeft(160);
    obj.imageCheckBox59:setTop(0);
    obj.imageCheckBox59:setWidth(20);
    obj.imageCheckBox59:setHeight(20);
    obj.imageCheckBox59:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox59:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox59:setField("magicCheck_58");
    obj.imageCheckBox59:setName("imageCheckBox59");

    obj.imageCheckBox60 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox60:setParent(obj.layout40);
    obj.imageCheckBox60:setLeft(180);
    obj.imageCheckBox60:setTop(0);
    obj.imageCheckBox60:setWidth(20);
    obj.imageCheckBox60:setHeight(20);
    obj.imageCheckBox60:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox60:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox60:setField("magicCheck_59");
    obj.imageCheckBox60:setName("imageCheckBox60");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout34);
    obj.textEditor13:setLeft(36);
    obj.textEditor13:setTop(1106);
    obj.textEditor13:setWidth(320);
    obj.textEditor13:setHeight(150);
    obj.textEditor13:setFontSize(14);
    obj.textEditor13:setFontColor("#000000");
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setField("magicDesc_6");
    obj.textEditor13:setName("textEditor13");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle2);
    obj.layout41:setLeft(427);
    obj.layout41:setTop(0);
    obj.layout41:setWidth(447);
    obj.layout41:setHeight(1263);
    obj.layout41:setName("layout41");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout41);
    obj.edit59:setLeft(80);
    obj.edit59:setTop(36);
    obj.edit59:setWidth(160);
    obj.edit59:setHeight(30);
    obj.edit59:setFontSize(16);
    obj.edit59:setFontColor("#000000");
    obj.edit59:setTransparent(true);
    obj.edit59:setField("magicName_7");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout41);
    obj.edit60:setLeft(302);
    obj.edit60:setTop(36);
    obj.edit60:setWidth(90);
    obj.edit60:setHeight(30);
    obj.edit60:setFontSize(16);
    obj.edit60:setFontColor("#000000");
    obj.edit60:setTransparent(true);
    obj.edit60:setField("magicTrad_7");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout41);
    obj.edit61:setLeft(406);
    obj.edit61:setTop(66);
    obj.edit61:setWidth(90);
    obj.edit61:setHeight(30);
    obj.edit61:setFontSize(16);
    obj.edit61:setFontColor("#000000");
    obj.edit61:setTransparent(true);
    obj.edit61:setField("magicLevel_7");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout41);
    obj.edit62:setLeft(370);
    obj.edit62:setTop(98);
    obj.edit62:setWidth(90);
    obj.edit62:setHeight(30);
    obj.edit62:setFontSize(16);
    obj.edit62:setFontColor("#000000");
    obj.edit62:setTransparent(true);
    obj.edit62:setField("magicConj_7");
    obj.edit62:setName("edit62");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setLeft(73);
    obj.layout42:setTop(66);
    obj.layout42:setWidth(200);
    obj.layout42:setHeight(20);
    obj.layout42:setName("layout42");

    obj.imageCheckBox61 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox61:setParent(obj.layout42);
    obj.imageCheckBox61:setLeft(0);
    obj.imageCheckBox61:setTop(0);
    obj.imageCheckBox61:setWidth(20);
    obj.imageCheckBox61:setHeight(20);
    obj.imageCheckBox61:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox61:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox61:setField("magicCheck_60");
    obj.imageCheckBox61:setName("imageCheckBox61");

    obj.imageCheckBox62 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox62:setParent(obj.layout42);
    obj.imageCheckBox62:setLeft(20);
    obj.imageCheckBox62:setTop(0);
    obj.imageCheckBox62:setWidth(20);
    obj.imageCheckBox62:setHeight(20);
    obj.imageCheckBox62:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox62:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox62:setField("magicCheck_61");
    obj.imageCheckBox62:setName("imageCheckBox62");

    obj.imageCheckBox63 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox63:setParent(obj.layout42);
    obj.imageCheckBox63:setLeft(40);
    obj.imageCheckBox63:setTop(0);
    obj.imageCheckBox63:setWidth(20);
    obj.imageCheckBox63:setHeight(20);
    obj.imageCheckBox63:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox63:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox63:setField("magicCheck_62");
    obj.imageCheckBox63:setName("imageCheckBox63");

    obj.imageCheckBox64 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox64:setParent(obj.layout42);
    obj.imageCheckBox64:setLeft(60);
    obj.imageCheckBox64:setTop(0);
    obj.imageCheckBox64:setWidth(20);
    obj.imageCheckBox64:setHeight(20);
    obj.imageCheckBox64:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox64:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox64:setField("magicCheck_63");
    obj.imageCheckBox64:setName("imageCheckBox64");

    obj.imageCheckBox65 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox65:setParent(obj.layout42);
    obj.imageCheckBox65:setLeft(80);
    obj.imageCheckBox65:setTop(0);
    obj.imageCheckBox65:setWidth(20);
    obj.imageCheckBox65:setHeight(20);
    obj.imageCheckBox65:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox65:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox65:setField("magicCheck_64");
    obj.imageCheckBox65:setName("imageCheckBox65");

    obj.imageCheckBox66 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox66:setParent(obj.layout42);
    obj.imageCheckBox66:setLeft(100);
    obj.imageCheckBox66:setTop(0);
    obj.imageCheckBox66:setWidth(20);
    obj.imageCheckBox66:setHeight(20);
    obj.imageCheckBox66:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox66:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox66:setField("magicCheck_65");
    obj.imageCheckBox66:setName("imageCheckBox66");

    obj.imageCheckBox67 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox67:setParent(obj.layout42);
    obj.imageCheckBox67:setLeft(120);
    obj.imageCheckBox67:setTop(0);
    obj.imageCheckBox67:setWidth(20);
    obj.imageCheckBox67:setHeight(20);
    obj.imageCheckBox67:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox67:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox67:setField("magicCheck_66");
    obj.imageCheckBox67:setName("imageCheckBox67");

    obj.imageCheckBox68 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox68:setParent(obj.layout42);
    obj.imageCheckBox68:setLeft(140);
    obj.imageCheckBox68:setTop(0);
    obj.imageCheckBox68:setWidth(20);
    obj.imageCheckBox68:setHeight(20);
    obj.imageCheckBox68:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox68:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox68:setField("magicCheck_67");
    obj.imageCheckBox68:setName("imageCheckBox68");

    obj.imageCheckBox69 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox69:setParent(obj.layout42);
    obj.imageCheckBox69:setLeft(160);
    obj.imageCheckBox69:setTop(0);
    obj.imageCheckBox69:setWidth(20);
    obj.imageCheckBox69:setHeight(20);
    obj.imageCheckBox69:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox69:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox69:setField("magicCheck_68");
    obj.imageCheckBox69:setName("imageCheckBox69");

    obj.imageCheckBox70 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox70:setParent(obj.layout42);
    obj.imageCheckBox70:setLeft(180);
    obj.imageCheckBox70:setTop(0);
    obj.imageCheckBox70:setWidth(20);
    obj.imageCheckBox70:setHeight(20);
    obj.imageCheckBox70:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox70:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox70:setField("magicCheck_69");
    obj.imageCheckBox70:setName("imageCheckBox70");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout41);
    obj.textEditor14:setLeft(36);
    obj.textEditor14:setTop(86);
    obj.textEditor14:setWidth(320);
    obj.textEditor14:setHeight(150);
    obj.textEditor14:setFontSize(14);
    obj.textEditor14:setFontColor("#000000");
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setField("magicDesc_7");
    obj.textEditor14:setName("textEditor14");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout41);
    obj.edit63:setLeft(80);
    obj.edit63:setTop(242);
    obj.edit63:setWidth(160);
    obj.edit63:setHeight(30);
    obj.edit63:setFontSize(16);
    obj.edit63:setFontColor("#000000");
    obj.edit63:setTransparent(true);
    obj.edit63:setField("magicName_8");
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout41);
    obj.edit64:setLeft(302);
    obj.edit64:setTop(242);
    obj.edit64:setWidth(90);
    obj.edit64:setHeight(30);
    obj.edit64:setFontSize(16);
    obj.edit64:setFontColor("#000000");
    obj.edit64:setTransparent(true);
    obj.edit64:setField("magicTrad_8");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout41);
    obj.edit65:setLeft(406);
    obj.edit65:setTop(272);
    obj.edit65:setWidth(90);
    obj.edit65:setHeight(30);
    obj.edit65:setFontSize(16);
    obj.edit65:setFontColor("#000000");
    obj.edit65:setTransparent(true);
    obj.edit65:setField("magicLevel_8");
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout41);
    obj.edit66:setLeft(370);
    obj.edit66:setTop(304);
    obj.edit66:setWidth(90);
    obj.edit66:setHeight(30);
    obj.edit66:setFontSize(16);
    obj.edit66:setFontColor("#000000");
    obj.edit66:setTransparent(true);
    obj.edit66:setField("magicConj_8");
    obj.edit66:setName("edit66");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43:setLeft(73);
    obj.layout43:setTop(272);
    obj.layout43:setWidth(200);
    obj.layout43:setHeight(20);
    obj.layout43:setName("layout43");

    obj.imageCheckBox71 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox71:setParent(obj.layout43);
    obj.imageCheckBox71:setLeft(0);
    obj.imageCheckBox71:setTop(0);
    obj.imageCheckBox71:setWidth(20);
    obj.imageCheckBox71:setHeight(20);
    obj.imageCheckBox71:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox71:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox71:setField("magicCheck_70");
    obj.imageCheckBox71:setName("imageCheckBox71");

    obj.imageCheckBox72 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox72:setParent(obj.layout43);
    obj.imageCheckBox72:setLeft(20);
    obj.imageCheckBox72:setTop(0);
    obj.imageCheckBox72:setWidth(20);
    obj.imageCheckBox72:setHeight(20);
    obj.imageCheckBox72:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox72:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox72:setField("magicCheck_71");
    obj.imageCheckBox72:setName("imageCheckBox72");

    obj.imageCheckBox73 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox73:setParent(obj.layout43);
    obj.imageCheckBox73:setLeft(40);
    obj.imageCheckBox73:setTop(0);
    obj.imageCheckBox73:setWidth(20);
    obj.imageCheckBox73:setHeight(20);
    obj.imageCheckBox73:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox73:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox73:setField("magicCheck_72");
    obj.imageCheckBox73:setName("imageCheckBox73");

    obj.imageCheckBox74 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox74:setParent(obj.layout43);
    obj.imageCheckBox74:setLeft(60);
    obj.imageCheckBox74:setTop(0);
    obj.imageCheckBox74:setWidth(20);
    obj.imageCheckBox74:setHeight(20);
    obj.imageCheckBox74:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox74:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox74:setField("magicCheck_73");
    obj.imageCheckBox74:setName("imageCheckBox74");

    obj.imageCheckBox75 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox75:setParent(obj.layout43);
    obj.imageCheckBox75:setLeft(80);
    obj.imageCheckBox75:setTop(0);
    obj.imageCheckBox75:setWidth(20);
    obj.imageCheckBox75:setHeight(20);
    obj.imageCheckBox75:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox75:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox75:setField("magicCheck_74");
    obj.imageCheckBox75:setName("imageCheckBox75");

    obj.imageCheckBox76 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox76:setParent(obj.layout43);
    obj.imageCheckBox76:setLeft(100);
    obj.imageCheckBox76:setTop(0);
    obj.imageCheckBox76:setWidth(20);
    obj.imageCheckBox76:setHeight(20);
    obj.imageCheckBox76:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox76:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox76:setField("magicCheck_75");
    obj.imageCheckBox76:setName("imageCheckBox76");

    obj.imageCheckBox77 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox77:setParent(obj.layout43);
    obj.imageCheckBox77:setLeft(120);
    obj.imageCheckBox77:setTop(0);
    obj.imageCheckBox77:setWidth(20);
    obj.imageCheckBox77:setHeight(20);
    obj.imageCheckBox77:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox77:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox77:setField("magicCheck_76");
    obj.imageCheckBox77:setName("imageCheckBox77");

    obj.imageCheckBox78 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox78:setParent(obj.layout43);
    obj.imageCheckBox78:setLeft(140);
    obj.imageCheckBox78:setTop(0);
    obj.imageCheckBox78:setWidth(20);
    obj.imageCheckBox78:setHeight(20);
    obj.imageCheckBox78:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox78:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox78:setField("magicCheck_77");
    obj.imageCheckBox78:setName("imageCheckBox78");

    obj.imageCheckBox79 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox79:setParent(obj.layout43);
    obj.imageCheckBox79:setLeft(160);
    obj.imageCheckBox79:setTop(0);
    obj.imageCheckBox79:setWidth(20);
    obj.imageCheckBox79:setHeight(20);
    obj.imageCheckBox79:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox79:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox79:setField("magicCheck_78");
    obj.imageCheckBox79:setName("imageCheckBox79");

    obj.imageCheckBox80 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox80:setParent(obj.layout43);
    obj.imageCheckBox80:setLeft(180);
    obj.imageCheckBox80:setTop(0);
    obj.imageCheckBox80:setWidth(20);
    obj.imageCheckBox80:setHeight(20);
    obj.imageCheckBox80:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox80:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox80:setField("magicCheck_79");
    obj.imageCheckBox80:setName("imageCheckBox80");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout41);
    obj.textEditor15:setLeft(36);
    obj.textEditor15:setTop(292);
    obj.textEditor15:setWidth(320);
    obj.textEditor15:setHeight(150);
    obj.textEditor15:setFontSize(14);
    obj.textEditor15:setFontColor("#000000");
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setField("magicDesc_8");
    obj.textEditor15:setName("textEditor15");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout41);
    obj.edit67:setLeft(80);
    obj.edit67:setTop(448);
    obj.edit67:setWidth(160);
    obj.edit67:setHeight(30);
    obj.edit67:setFontSize(16);
    obj.edit67:setFontColor("#000000");
    obj.edit67:setTransparent(true);
    obj.edit67:setField("magicName_9");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout41);
    obj.edit68:setLeft(302);
    obj.edit68:setTop(448);
    obj.edit68:setWidth(90);
    obj.edit68:setHeight(30);
    obj.edit68:setFontSize(16);
    obj.edit68:setFontColor("#000000");
    obj.edit68:setTransparent(true);
    obj.edit68:setField("magicTrad_9");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout41);
    obj.edit69:setLeft(406);
    obj.edit69:setTop(478);
    obj.edit69:setWidth(90);
    obj.edit69:setHeight(30);
    obj.edit69:setFontSize(16);
    obj.edit69:setFontColor("#000000");
    obj.edit69:setTransparent(true);
    obj.edit69:setField("magicLevel_9");
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout41);
    obj.edit70:setLeft(370);
    obj.edit70:setTop(510);
    obj.edit70:setWidth(90);
    obj.edit70:setHeight(30);
    obj.edit70:setFontSize(16);
    obj.edit70:setFontColor("#000000");
    obj.edit70:setTransparent(true);
    obj.edit70:setField("magicConj_9");
    obj.edit70:setName("edit70");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout41);
    obj.layout44:setLeft(73);
    obj.layout44:setTop(478);
    obj.layout44:setWidth(200);
    obj.layout44:setHeight(20);
    obj.layout44:setName("layout44");

    obj.imageCheckBox81 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox81:setParent(obj.layout44);
    obj.imageCheckBox81:setLeft(0);
    obj.imageCheckBox81:setTop(0);
    obj.imageCheckBox81:setWidth(20);
    obj.imageCheckBox81:setHeight(20);
    obj.imageCheckBox81:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox81:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox81:setField("magicCheck_80");
    obj.imageCheckBox81:setName("imageCheckBox81");

    obj.imageCheckBox82 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox82:setParent(obj.layout44);
    obj.imageCheckBox82:setLeft(20);
    obj.imageCheckBox82:setTop(0);
    obj.imageCheckBox82:setWidth(20);
    obj.imageCheckBox82:setHeight(20);
    obj.imageCheckBox82:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox82:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox82:setField("magicCheck_81");
    obj.imageCheckBox82:setName("imageCheckBox82");

    obj.imageCheckBox83 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox83:setParent(obj.layout44);
    obj.imageCheckBox83:setLeft(40);
    obj.imageCheckBox83:setTop(0);
    obj.imageCheckBox83:setWidth(20);
    obj.imageCheckBox83:setHeight(20);
    obj.imageCheckBox83:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox83:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox83:setField("magicCheck_82");
    obj.imageCheckBox83:setName("imageCheckBox83");

    obj.imageCheckBox84 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox84:setParent(obj.layout44);
    obj.imageCheckBox84:setLeft(60);
    obj.imageCheckBox84:setTop(0);
    obj.imageCheckBox84:setWidth(20);
    obj.imageCheckBox84:setHeight(20);
    obj.imageCheckBox84:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox84:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox84:setField("magicCheck_83");
    obj.imageCheckBox84:setName("imageCheckBox84");

    obj.imageCheckBox85 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox85:setParent(obj.layout44);
    obj.imageCheckBox85:setLeft(80);
    obj.imageCheckBox85:setTop(0);
    obj.imageCheckBox85:setWidth(20);
    obj.imageCheckBox85:setHeight(20);
    obj.imageCheckBox85:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox85:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox85:setField("magicCheck_84");
    obj.imageCheckBox85:setName("imageCheckBox85");

    obj.imageCheckBox86 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox86:setParent(obj.layout44);
    obj.imageCheckBox86:setLeft(100);
    obj.imageCheckBox86:setTop(0);
    obj.imageCheckBox86:setWidth(20);
    obj.imageCheckBox86:setHeight(20);
    obj.imageCheckBox86:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox86:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox86:setField("magicCheck_85");
    obj.imageCheckBox86:setName("imageCheckBox86");

    obj.imageCheckBox87 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox87:setParent(obj.layout44);
    obj.imageCheckBox87:setLeft(120);
    obj.imageCheckBox87:setTop(0);
    obj.imageCheckBox87:setWidth(20);
    obj.imageCheckBox87:setHeight(20);
    obj.imageCheckBox87:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox87:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox87:setField("magicCheck_86");
    obj.imageCheckBox87:setName("imageCheckBox87");

    obj.imageCheckBox88 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox88:setParent(obj.layout44);
    obj.imageCheckBox88:setLeft(140);
    obj.imageCheckBox88:setTop(0);
    obj.imageCheckBox88:setWidth(20);
    obj.imageCheckBox88:setHeight(20);
    obj.imageCheckBox88:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox88:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox88:setField("magicCheck_87");
    obj.imageCheckBox88:setName("imageCheckBox88");

    obj.imageCheckBox89 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox89:setParent(obj.layout44);
    obj.imageCheckBox89:setLeft(160);
    obj.imageCheckBox89:setTop(0);
    obj.imageCheckBox89:setWidth(20);
    obj.imageCheckBox89:setHeight(20);
    obj.imageCheckBox89:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox89:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox89:setField("magicCheck_88");
    obj.imageCheckBox89:setName("imageCheckBox89");

    obj.imageCheckBox90 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox90:setParent(obj.layout44);
    obj.imageCheckBox90:setLeft(180);
    obj.imageCheckBox90:setTop(0);
    obj.imageCheckBox90:setWidth(20);
    obj.imageCheckBox90:setHeight(20);
    obj.imageCheckBox90:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox90:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox90:setField("magicCheck_89");
    obj.imageCheckBox90:setName("imageCheckBox90");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout41);
    obj.textEditor16:setLeft(36);
    obj.textEditor16:setTop(498);
    obj.textEditor16:setWidth(320);
    obj.textEditor16:setHeight(150);
    obj.textEditor16:setFontSize(14);
    obj.textEditor16:setFontColor("#000000");
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setField("magicDesc_9");
    obj.textEditor16:setName("textEditor16");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout41);
    obj.edit71:setLeft(80);
    obj.edit71:setTop(670);
    obj.edit71:setWidth(160);
    obj.edit71:setHeight(30);
    obj.edit71:setFontSize(16);
    obj.edit71:setFontColor("#000000");
    obj.edit71:setTransparent(true);
    obj.edit71:setField("magicName_10");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout41);
    obj.edit72:setLeft(302);
    obj.edit72:setTop(670);
    obj.edit72:setWidth(90);
    obj.edit72:setHeight(30);
    obj.edit72:setFontSize(16);
    obj.edit72:setFontColor("#000000");
    obj.edit72:setTransparent(true);
    obj.edit72:setField("magicTrad_10");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout41);
    obj.edit73:setLeft(406);
    obj.edit73:setTop(700);
    obj.edit73:setWidth(90);
    obj.edit73:setHeight(30);
    obj.edit73:setFontSize(16);
    obj.edit73:setFontColor("#000000");
    obj.edit73:setTransparent(true);
    obj.edit73:setField("magicLevel_10");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout41);
    obj.edit74:setLeft(370);
    obj.edit74:setTop(732);
    obj.edit74:setWidth(90);
    obj.edit74:setHeight(30);
    obj.edit74:setFontSize(16);
    obj.edit74:setFontColor("#000000");
    obj.edit74:setTransparent(true);
    obj.edit74:setField("magicConj_10");
    obj.edit74:setName("edit74");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout41);
    obj.layout45:setLeft(73);
    obj.layout45:setTop(700);
    obj.layout45:setWidth(200);
    obj.layout45:setHeight(20);
    obj.layout45:setName("layout45");

    obj.imageCheckBox91 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox91:setParent(obj.layout45);
    obj.imageCheckBox91:setLeft(0);
    obj.imageCheckBox91:setTop(0);
    obj.imageCheckBox91:setWidth(20);
    obj.imageCheckBox91:setHeight(20);
    obj.imageCheckBox91:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox91:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox91:setField("magicCheck_90");
    obj.imageCheckBox91:setName("imageCheckBox91");

    obj.imageCheckBox92 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox92:setParent(obj.layout45);
    obj.imageCheckBox92:setLeft(20);
    obj.imageCheckBox92:setTop(0);
    obj.imageCheckBox92:setWidth(20);
    obj.imageCheckBox92:setHeight(20);
    obj.imageCheckBox92:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox92:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox92:setField("magicCheck_91");
    obj.imageCheckBox92:setName("imageCheckBox92");

    obj.imageCheckBox93 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox93:setParent(obj.layout45);
    obj.imageCheckBox93:setLeft(40);
    obj.imageCheckBox93:setTop(0);
    obj.imageCheckBox93:setWidth(20);
    obj.imageCheckBox93:setHeight(20);
    obj.imageCheckBox93:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox93:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox93:setField("magicCheck_92");
    obj.imageCheckBox93:setName("imageCheckBox93");

    obj.imageCheckBox94 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox94:setParent(obj.layout45);
    obj.imageCheckBox94:setLeft(60);
    obj.imageCheckBox94:setTop(0);
    obj.imageCheckBox94:setWidth(20);
    obj.imageCheckBox94:setHeight(20);
    obj.imageCheckBox94:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox94:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox94:setField("magicCheck_93");
    obj.imageCheckBox94:setName("imageCheckBox94");

    obj.imageCheckBox95 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox95:setParent(obj.layout45);
    obj.imageCheckBox95:setLeft(80);
    obj.imageCheckBox95:setTop(0);
    obj.imageCheckBox95:setWidth(20);
    obj.imageCheckBox95:setHeight(20);
    obj.imageCheckBox95:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox95:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox95:setField("magicCheck_94");
    obj.imageCheckBox95:setName("imageCheckBox95");

    obj.imageCheckBox96 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox96:setParent(obj.layout45);
    obj.imageCheckBox96:setLeft(100);
    obj.imageCheckBox96:setTop(0);
    obj.imageCheckBox96:setWidth(20);
    obj.imageCheckBox96:setHeight(20);
    obj.imageCheckBox96:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox96:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox96:setField("magicCheck_95");
    obj.imageCheckBox96:setName("imageCheckBox96");

    obj.imageCheckBox97 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox97:setParent(obj.layout45);
    obj.imageCheckBox97:setLeft(120);
    obj.imageCheckBox97:setTop(0);
    obj.imageCheckBox97:setWidth(20);
    obj.imageCheckBox97:setHeight(20);
    obj.imageCheckBox97:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox97:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox97:setField("magicCheck_96");
    obj.imageCheckBox97:setName("imageCheckBox97");

    obj.imageCheckBox98 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox98:setParent(obj.layout45);
    obj.imageCheckBox98:setLeft(140);
    obj.imageCheckBox98:setTop(0);
    obj.imageCheckBox98:setWidth(20);
    obj.imageCheckBox98:setHeight(20);
    obj.imageCheckBox98:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox98:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox98:setField("magicCheck_97");
    obj.imageCheckBox98:setName("imageCheckBox98");

    obj.imageCheckBox99 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox99:setParent(obj.layout45);
    obj.imageCheckBox99:setLeft(160);
    obj.imageCheckBox99:setTop(0);
    obj.imageCheckBox99:setWidth(20);
    obj.imageCheckBox99:setHeight(20);
    obj.imageCheckBox99:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox99:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox99:setField("magicCheck_98");
    obj.imageCheckBox99:setName("imageCheckBox99");

    obj.imageCheckBox100 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox100:setParent(obj.layout45);
    obj.imageCheckBox100:setLeft(180);
    obj.imageCheckBox100:setTop(0);
    obj.imageCheckBox100:setWidth(20);
    obj.imageCheckBox100:setHeight(20);
    obj.imageCheckBox100:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox100:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox100:setField("magicCheck_99");
    obj.imageCheckBox100:setName("imageCheckBox100");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout41);
    obj.textEditor17:setLeft(36);
    obj.textEditor17:setTop(720);
    obj.textEditor17:setWidth(320);
    obj.textEditor17:setHeight(150);
    obj.textEditor17:setFontSize(14);
    obj.textEditor17:setFontColor("#000000");
    obj.textEditor17:setTransparent(true);
    obj.textEditor17:setField("magicDesc_10");
    obj.textEditor17:setName("textEditor17");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout41);
    obj.edit75:setLeft(80);
    obj.edit75:setTop(856);
    obj.edit75:setWidth(160);
    obj.edit75:setHeight(30);
    obj.edit75:setFontSize(16);
    obj.edit75:setFontColor("#000000");
    obj.edit75:setTransparent(true);
    obj.edit75:setField("magicName_11");
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout41);
    obj.edit76:setLeft(302);
    obj.edit76:setTop(856);
    obj.edit76:setWidth(90);
    obj.edit76:setHeight(30);
    obj.edit76:setFontSize(16);
    obj.edit76:setFontColor("#000000");
    obj.edit76:setTransparent(true);
    obj.edit76:setField("magicTrad_11");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout41);
    obj.edit77:setLeft(406);
    obj.edit77:setTop(886);
    obj.edit77:setWidth(90);
    obj.edit77:setHeight(30);
    obj.edit77:setFontSize(16);
    obj.edit77:setFontColor("#000000");
    obj.edit77:setTransparent(true);
    obj.edit77:setField("magicLevel_11");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout41);
    obj.edit78:setLeft(370);
    obj.edit78:setTop(918);
    obj.edit78:setWidth(90);
    obj.edit78:setHeight(30);
    obj.edit78:setFontSize(16);
    obj.edit78:setFontColor("#000000");
    obj.edit78:setTransparent(true);
    obj.edit78:setField("magicConj_11");
    obj.edit78:setName("edit78");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout41);
    obj.layout46:setLeft(73);
    obj.layout46:setTop(886);
    obj.layout46:setWidth(200);
    obj.layout46:setHeight(20);
    obj.layout46:setName("layout46");

    obj.imageCheckBox101 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox101:setParent(obj.layout46);
    obj.imageCheckBox101:setLeft(0);
    obj.imageCheckBox101:setTop(0);
    obj.imageCheckBox101:setWidth(20);
    obj.imageCheckBox101:setHeight(20);
    obj.imageCheckBox101:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox101:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox101:setField("magicCheck_100");
    obj.imageCheckBox101:setName("imageCheckBox101");

    obj.imageCheckBox102 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox102:setParent(obj.layout46);
    obj.imageCheckBox102:setLeft(20);
    obj.imageCheckBox102:setTop(0);
    obj.imageCheckBox102:setWidth(20);
    obj.imageCheckBox102:setHeight(20);
    obj.imageCheckBox102:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox102:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox102:setField("magicCheck_101");
    obj.imageCheckBox102:setName("imageCheckBox102");

    obj.imageCheckBox103 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox103:setParent(obj.layout46);
    obj.imageCheckBox103:setLeft(40);
    obj.imageCheckBox103:setTop(0);
    obj.imageCheckBox103:setWidth(20);
    obj.imageCheckBox103:setHeight(20);
    obj.imageCheckBox103:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox103:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox103:setField("magicCheck_102");
    obj.imageCheckBox103:setName("imageCheckBox103");

    obj.imageCheckBox104 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox104:setParent(obj.layout46);
    obj.imageCheckBox104:setLeft(60);
    obj.imageCheckBox104:setTop(0);
    obj.imageCheckBox104:setWidth(20);
    obj.imageCheckBox104:setHeight(20);
    obj.imageCheckBox104:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox104:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox104:setField("magicCheck_103");
    obj.imageCheckBox104:setName("imageCheckBox104");

    obj.imageCheckBox105 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox105:setParent(obj.layout46);
    obj.imageCheckBox105:setLeft(80);
    obj.imageCheckBox105:setTop(0);
    obj.imageCheckBox105:setWidth(20);
    obj.imageCheckBox105:setHeight(20);
    obj.imageCheckBox105:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox105:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox105:setField("magicCheck_104");
    obj.imageCheckBox105:setName("imageCheckBox105");

    obj.imageCheckBox106 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox106:setParent(obj.layout46);
    obj.imageCheckBox106:setLeft(100);
    obj.imageCheckBox106:setTop(0);
    obj.imageCheckBox106:setWidth(20);
    obj.imageCheckBox106:setHeight(20);
    obj.imageCheckBox106:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox106:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox106:setField("magicCheck_105");
    obj.imageCheckBox106:setName("imageCheckBox106");

    obj.imageCheckBox107 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox107:setParent(obj.layout46);
    obj.imageCheckBox107:setLeft(120);
    obj.imageCheckBox107:setTop(0);
    obj.imageCheckBox107:setWidth(20);
    obj.imageCheckBox107:setHeight(20);
    obj.imageCheckBox107:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox107:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox107:setField("magicCheck_106");
    obj.imageCheckBox107:setName("imageCheckBox107");

    obj.imageCheckBox108 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox108:setParent(obj.layout46);
    obj.imageCheckBox108:setLeft(140);
    obj.imageCheckBox108:setTop(0);
    obj.imageCheckBox108:setWidth(20);
    obj.imageCheckBox108:setHeight(20);
    obj.imageCheckBox108:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox108:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox108:setField("magicCheck_107");
    obj.imageCheckBox108:setName("imageCheckBox108");

    obj.imageCheckBox109 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox109:setParent(obj.layout46);
    obj.imageCheckBox109:setLeft(160);
    obj.imageCheckBox109:setTop(0);
    obj.imageCheckBox109:setWidth(20);
    obj.imageCheckBox109:setHeight(20);
    obj.imageCheckBox109:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox109:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox109:setField("magicCheck_108");
    obj.imageCheckBox109:setName("imageCheckBox109");

    obj.imageCheckBox110 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox110:setParent(obj.layout46);
    obj.imageCheckBox110:setLeft(180);
    obj.imageCheckBox110:setTop(0);
    obj.imageCheckBox110:setWidth(20);
    obj.imageCheckBox110:setHeight(20);
    obj.imageCheckBox110:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox110:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox110:setField("magicCheck_109");
    obj.imageCheckBox110:setName("imageCheckBox110");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout41);
    obj.textEditor18:setLeft(36);
    obj.textEditor18:setTop(906);
    obj.textEditor18:setWidth(320);
    obj.textEditor18:setHeight(150);
    obj.textEditor18:setFontSize(14);
    obj.textEditor18:setFontColor("#000000");
    obj.textEditor18:setTransparent(true);
    obj.textEditor18:setField("magicDesc_11");
    obj.textEditor18:setName("textEditor18");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout41);
    obj.edit79:setLeft(80);
    obj.edit79:setTop(1056);
    obj.edit79:setWidth(160);
    obj.edit79:setHeight(30);
    obj.edit79:setFontSize(16);
    obj.edit79:setFontColor("#000000");
    obj.edit79:setTransparent(true);
    obj.edit79:setField("magicName_12");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout41);
    obj.edit80:setLeft(302);
    obj.edit80:setTop(1056);
    obj.edit80:setWidth(90);
    obj.edit80:setHeight(30);
    obj.edit80:setFontSize(16);
    obj.edit80:setFontColor("#000000");
    obj.edit80:setTransparent(true);
    obj.edit80:setField("magicTrad_12");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout41);
    obj.edit81:setLeft(406);
    obj.edit81:setTop(1086);
    obj.edit81:setWidth(90);
    obj.edit81:setHeight(30);
    obj.edit81:setFontSize(16);
    obj.edit81:setFontColor("#000000");
    obj.edit81:setTransparent(true);
    obj.edit81:setField("magicLevel_12");
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout41);
    obj.edit82:setLeft(370);
    obj.edit82:setTop(1118);
    obj.edit82:setWidth(90);
    obj.edit82:setHeight(30);
    obj.edit82:setFontSize(16);
    obj.edit82:setFontColor("#000000");
    obj.edit82:setTransparent(true);
    obj.edit82:setField("magicConj_12");
    obj.edit82:setName("edit82");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout41);
    obj.layout47:setLeft(73);
    obj.layout47:setTop(1086);
    obj.layout47:setWidth(200);
    obj.layout47:setHeight(20);
    obj.layout47:setName("layout47");

    obj.imageCheckBox111 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox111:setParent(obj.layout47);
    obj.imageCheckBox111:setLeft(0);
    obj.imageCheckBox111:setTop(0);
    obj.imageCheckBox111:setWidth(20);
    obj.imageCheckBox111:setHeight(20);
    obj.imageCheckBox111:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox111:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox111:setField("magicCheck_110");
    obj.imageCheckBox111:setName("imageCheckBox111");

    obj.imageCheckBox112 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox112:setParent(obj.layout47);
    obj.imageCheckBox112:setLeft(20);
    obj.imageCheckBox112:setTop(0);
    obj.imageCheckBox112:setWidth(20);
    obj.imageCheckBox112:setHeight(20);
    obj.imageCheckBox112:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox112:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox112:setField("magicCheck_111");
    obj.imageCheckBox112:setName("imageCheckBox112");

    obj.imageCheckBox113 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox113:setParent(obj.layout47);
    obj.imageCheckBox113:setLeft(40);
    obj.imageCheckBox113:setTop(0);
    obj.imageCheckBox113:setWidth(20);
    obj.imageCheckBox113:setHeight(20);
    obj.imageCheckBox113:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox113:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox113:setField("magicCheck_112");
    obj.imageCheckBox113:setName("imageCheckBox113");

    obj.imageCheckBox114 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox114:setParent(obj.layout47);
    obj.imageCheckBox114:setLeft(60);
    obj.imageCheckBox114:setTop(0);
    obj.imageCheckBox114:setWidth(20);
    obj.imageCheckBox114:setHeight(20);
    obj.imageCheckBox114:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox114:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox114:setField("magicCheck_113");
    obj.imageCheckBox114:setName("imageCheckBox114");

    obj.imageCheckBox115 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox115:setParent(obj.layout47);
    obj.imageCheckBox115:setLeft(80);
    obj.imageCheckBox115:setTop(0);
    obj.imageCheckBox115:setWidth(20);
    obj.imageCheckBox115:setHeight(20);
    obj.imageCheckBox115:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox115:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox115:setField("magicCheck_114");
    obj.imageCheckBox115:setName("imageCheckBox115");

    obj.imageCheckBox116 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox116:setParent(obj.layout47);
    obj.imageCheckBox116:setLeft(100);
    obj.imageCheckBox116:setTop(0);
    obj.imageCheckBox116:setWidth(20);
    obj.imageCheckBox116:setHeight(20);
    obj.imageCheckBox116:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox116:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox116:setField("magicCheck_115");
    obj.imageCheckBox116:setName("imageCheckBox116");

    obj.imageCheckBox117 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox117:setParent(obj.layout47);
    obj.imageCheckBox117:setLeft(120);
    obj.imageCheckBox117:setTop(0);
    obj.imageCheckBox117:setWidth(20);
    obj.imageCheckBox117:setHeight(20);
    obj.imageCheckBox117:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox117:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox117:setField("magicCheck_116");
    obj.imageCheckBox117:setName("imageCheckBox117");

    obj.imageCheckBox118 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox118:setParent(obj.layout47);
    obj.imageCheckBox118:setLeft(140);
    obj.imageCheckBox118:setTop(0);
    obj.imageCheckBox118:setWidth(20);
    obj.imageCheckBox118:setHeight(20);
    obj.imageCheckBox118:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox118:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox118:setField("magicCheck_117");
    obj.imageCheckBox118:setName("imageCheckBox118");

    obj.imageCheckBox119 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox119:setParent(obj.layout47);
    obj.imageCheckBox119:setLeft(160);
    obj.imageCheckBox119:setTop(0);
    obj.imageCheckBox119:setWidth(20);
    obj.imageCheckBox119:setHeight(20);
    obj.imageCheckBox119:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox119:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox119:setField("magicCheck_118");
    obj.imageCheckBox119:setName("imageCheckBox119");

    obj.imageCheckBox120 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox120:setParent(obj.layout47);
    obj.imageCheckBox120:setLeft(180);
    obj.imageCheckBox120:setTop(0);
    obj.imageCheckBox120:setWidth(20);
    obj.imageCheckBox120:setHeight(20);
    obj.imageCheckBox120:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox120:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox120:setField("magicCheck_119");
    obj.imageCheckBox120:setName("imageCheckBox120");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout41);
    obj.textEditor19:setLeft(36);
    obj.textEditor19:setTop(1106);
    obj.textEditor19:setWidth(320);
    obj.textEditor19:setHeight(150);
    obj.textEditor19:setFontSize(14);
    obj.textEditor19:setFontColor("#000000");
    obj.textEditor19:setTransparent(true);
    obj.textEditor19:setField("magicDesc_12");
    obj.textEditor19:setName("textEditor19");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Página 3");
    obj.tab3:setName("tab3");

    obj.frmSODLFillable3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSODLFillable3_svg:setParent(obj.tab3);
    obj.frmSODLFillable3_svg:setName("frmSODLFillable3_svg");
    obj.frmSODLFillable3_svg:setAlign("client");
    obj.frmSODLFillable3_svg:setTheme("light");
    obj.frmSODLFillable3_svg:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmSODLFillable3_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox3);
    obj.rectangle3:setWidth(893);
    obj.rectangle3:setHeight(1263);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle3);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(893);
    obj.image3:setHeight(1263);
    obj.image3:setSRC("/SODLFillable/images/2.png");
    obj.image3:setStyle("stretch");
    obj.image3:setOptimize(true);
    obj.image3:setName("image3");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle3);
    obj.layout48:setLeft(0);
    obj.layout48:setTop(0);
    obj.layout48:setWidth(447);
    obj.layout48:setHeight(1263);
    obj.layout48:setName("layout48");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout48);
    obj.edit83:setLeft(80);
    obj.edit83:setTop(36);
    obj.edit83:setWidth(160);
    obj.edit83:setHeight(30);
    obj.edit83:setFontSize(16);
    obj.edit83:setFontColor("#000000");
    obj.edit83:setTransparent(true);
    obj.edit83:setField("magicName_011");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout48);
    obj.edit84:setLeft(302);
    obj.edit84:setTop(36);
    obj.edit84:setWidth(90);
    obj.edit84:setHeight(30);
    obj.edit84:setFontSize(16);
    obj.edit84:setFontColor("#000000");
    obj.edit84:setTransparent(true);
    obj.edit84:setField("magicTrad_011");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout48);
    obj.edit85:setLeft(406);
    obj.edit85:setTop(66);
    obj.edit85:setWidth(90);
    obj.edit85:setHeight(30);
    obj.edit85:setFontSize(16);
    obj.edit85:setFontColor("#000000");
    obj.edit85:setTransparent(true);
    obj.edit85:setField("magicLevel_011");
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout48);
    obj.edit86:setLeft(370);
    obj.edit86:setTop(98);
    obj.edit86:setWidth(90);
    obj.edit86:setHeight(30);
    obj.edit86:setFontSize(16);
    obj.edit86:setFontColor("#000000");
    obj.edit86:setTransparent(true);
    obj.edit86:setField("magicConj_011");
    obj.edit86:setName("edit86");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout48);
    obj.layout49:setLeft(73);
    obj.layout49:setTop(66);
    obj.layout49:setWidth(200);
    obj.layout49:setHeight(20);
    obj.layout49:setName("layout49");

    obj.imageCheckBox121 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox121:setParent(obj.layout49);
    obj.imageCheckBox121:setLeft(0);
    obj.imageCheckBox121:setTop(0);
    obj.imageCheckBox121:setWidth(20);
    obj.imageCheckBox121:setHeight(20);
    obj.imageCheckBox121:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox121:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox121:setField("magicCheck_0101");
    obj.imageCheckBox121:setName("imageCheckBox121");

    obj.imageCheckBox122 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox122:setParent(obj.layout49);
    obj.imageCheckBox122:setLeft(20);
    obj.imageCheckBox122:setTop(0);
    obj.imageCheckBox122:setWidth(20);
    obj.imageCheckBox122:setHeight(20);
    obj.imageCheckBox122:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox122:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox122:setField("magicCheck_0111");
    obj.imageCheckBox122:setName("imageCheckBox122");

    obj.imageCheckBox123 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox123:setParent(obj.layout49);
    obj.imageCheckBox123:setLeft(40);
    obj.imageCheckBox123:setTop(0);
    obj.imageCheckBox123:setWidth(20);
    obj.imageCheckBox123:setHeight(20);
    obj.imageCheckBox123:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox123:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox123:setField("magicCheck_0121");
    obj.imageCheckBox123:setName("imageCheckBox123");

    obj.imageCheckBox124 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox124:setParent(obj.layout49);
    obj.imageCheckBox124:setLeft(60);
    obj.imageCheckBox124:setTop(0);
    obj.imageCheckBox124:setWidth(20);
    obj.imageCheckBox124:setHeight(20);
    obj.imageCheckBox124:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox124:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox124:setField("magicCheck_0131");
    obj.imageCheckBox124:setName("imageCheckBox124");

    obj.imageCheckBox125 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox125:setParent(obj.layout49);
    obj.imageCheckBox125:setLeft(80);
    obj.imageCheckBox125:setTop(0);
    obj.imageCheckBox125:setWidth(20);
    obj.imageCheckBox125:setHeight(20);
    obj.imageCheckBox125:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox125:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox125:setField("magicCheck_0141");
    obj.imageCheckBox125:setName("imageCheckBox125");

    obj.imageCheckBox126 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox126:setParent(obj.layout49);
    obj.imageCheckBox126:setLeft(100);
    obj.imageCheckBox126:setTop(0);
    obj.imageCheckBox126:setWidth(20);
    obj.imageCheckBox126:setHeight(20);
    obj.imageCheckBox126:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox126:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox126:setField("magicCheck_0151");
    obj.imageCheckBox126:setName("imageCheckBox126");

    obj.imageCheckBox127 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox127:setParent(obj.layout49);
    obj.imageCheckBox127:setLeft(120);
    obj.imageCheckBox127:setTop(0);
    obj.imageCheckBox127:setWidth(20);
    obj.imageCheckBox127:setHeight(20);
    obj.imageCheckBox127:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox127:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox127:setField("magicCheck_0161");
    obj.imageCheckBox127:setName("imageCheckBox127");

    obj.imageCheckBox128 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox128:setParent(obj.layout49);
    obj.imageCheckBox128:setLeft(140);
    obj.imageCheckBox128:setTop(0);
    obj.imageCheckBox128:setWidth(20);
    obj.imageCheckBox128:setHeight(20);
    obj.imageCheckBox128:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox128:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox128:setField("magicCheck_0171");
    obj.imageCheckBox128:setName("imageCheckBox128");

    obj.imageCheckBox129 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox129:setParent(obj.layout49);
    obj.imageCheckBox129:setLeft(160);
    obj.imageCheckBox129:setTop(0);
    obj.imageCheckBox129:setWidth(20);
    obj.imageCheckBox129:setHeight(20);
    obj.imageCheckBox129:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox129:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox129:setField("magicCheck_0181");
    obj.imageCheckBox129:setName("imageCheckBox129");

    obj.imageCheckBox130 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox130:setParent(obj.layout49);
    obj.imageCheckBox130:setLeft(180);
    obj.imageCheckBox130:setTop(0);
    obj.imageCheckBox130:setWidth(20);
    obj.imageCheckBox130:setHeight(20);
    obj.imageCheckBox130:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox130:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox130:setField("magicCheck_0191");
    obj.imageCheckBox130:setName("imageCheckBox130");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout48);
    obj.textEditor20:setLeft(36);
    obj.textEditor20:setTop(86);
    obj.textEditor20:setWidth(320);
    obj.textEditor20:setHeight(150);
    obj.textEditor20:setFontSize(14);
    obj.textEditor20:setFontColor("#000000");
    obj.textEditor20:setTransparent(true);
    obj.textEditor20:setField("magicDesc_011");
    obj.textEditor20:setName("textEditor20");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout48);
    obj.edit87:setLeft(80);
    obj.edit87:setTop(242);
    obj.edit87:setWidth(160);
    obj.edit87:setHeight(30);
    obj.edit87:setFontSize(16);
    obj.edit87:setFontColor("#000000");
    obj.edit87:setTransparent(true);
    obj.edit87:setField("magicName_21");
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout48);
    obj.edit88:setLeft(302);
    obj.edit88:setTop(242);
    obj.edit88:setWidth(90);
    obj.edit88:setHeight(30);
    obj.edit88:setFontSize(16);
    obj.edit88:setFontColor("#000000");
    obj.edit88:setTransparent(true);
    obj.edit88:setField("magicTrad_21");
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout48);
    obj.edit89:setLeft(406);
    obj.edit89:setTop(272);
    obj.edit89:setWidth(90);
    obj.edit89:setHeight(30);
    obj.edit89:setFontSize(16);
    obj.edit89:setFontColor("#000000");
    obj.edit89:setTransparent(true);
    obj.edit89:setField("magicLevel_21");
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout48);
    obj.edit90:setLeft(370);
    obj.edit90:setTop(304);
    obj.edit90:setWidth(90);
    obj.edit90:setHeight(30);
    obj.edit90:setFontSize(16);
    obj.edit90:setFontColor("#000000");
    obj.edit90:setTransparent(true);
    obj.edit90:setField("magicConj_21");
    obj.edit90:setName("edit90");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout48);
    obj.layout50:setLeft(73);
    obj.layout50:setTop(272);
    obj.layout50:setWidth(200);
    obj.layout50:setHeight(20);
    obj.layout50:setName("layout50");

    obj.imageCheckBox131 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox131:setParent(obj.layout50);
    obj.imageCheckBox131:setLeft(0);
    obj.imageCheckBox131:setTop(0);
    obj.imageCheckBox131:setWidth(20);
    obj.imageCheckBox131:setHeight(20);
    obj.imageCheckBox131:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox131:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox131:setField("magicCheck_201");
    obj.imageCheckBox131:setName("imageCheckBox131");

    obj.imageCheckBox132 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox132:setParent(obj.layout50);
    obj.imageCheckBox132:setLeft(20);
    obj.imageCheckBox132:setTop(0);
    obj.imageCheckBox132:setWidth(20);
    obj.imageCheckBox132:setHeight(20);
    obj.imageCheckBox132:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox132:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox132:setField("magicCheck_211");
    obj.imageCheckBox132:setName("imageCheckBox132");

    obj.imageCheckBox133 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox133:setParent(obj.layout50);
    obj.imageCheckBox133:setLeft(40);
    obj.imageCheckBox133:setTop(0);
    obj.imageCheckBox133:setWidth(20);
    obj.imageCheckBox133:setHeight(20);
    obj.imageCheckBox133:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox133:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox133:setField("magicCheck_221");
    obj.imageCheckBox133:setName("imageCheckBox133");

    obj.imageCheckBox134 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox134:setParent(obj.layout50);
    obj.imageCheckBox134:setLeft(60);
    obj.imageCheckBox134:setTop(0);
    obj.imageCheckBox134:setWidth(20);
    obj.imageCheckBox134:setHeight(20);
    obj.imageCheckBox134:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox134:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox134:setField("magicCheck_231");
    obj.imageCheckBox134:setName("imageCheckBox134");

    obj.imageCheckBox135 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox135:setParent(obj.layout50);
    obj.imageCheckBox135:setLeft(80);
    obj.imageCheckBox135:setTop(0);
    obj.imageCheckBox135:setWidth(20);
    obj.imageCheckBox135:setHeight(20);
    obj.imageCheckBox135:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox135:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox135:setField("magicCheck_241");
    obj.imageCheckBox135:setName("imageCheckBox135");

    obj.imageCheckBox136 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox136:setParent(obj.layout50);
    obj.imageCheckBox136:setLeft(100);
    obj.imageCheckBox136:setTop(0);
    obj.imageCheckBox136:setWidth(20);
    obj.imageCheckBox136:setHeight(20);
    obj.imageCheckBox136:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox136:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox136:setField("magicCheck_251");
    obj.imageCheckBox136:setName("imageCheckBox136");

    obj.imageCheckBox137 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox137:setParent(obj.layout50);
    obj.imageCheckBox137:setLeft(120);
    obj.imageCheckBox137:setTop(0);
    obj.imageCheckBox137:setWidth(20);
    obj.imageCheckBox137:setHeight(20);
    obj.imageCheckBox137:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox137:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox137:setField("magicCheck_261");
    obj.imageCheckBox137:setName("imageCheckBox137");

    obj.imageCheckBox138 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox138:setParent(obj.layout50);
    obj.imageCheckBox138:setLeft(140);
    obj.imageCheckBox138:setTop(0);
    obj.imageCheckBox138:setWidth(20);
    obj.imageCheckBox138:setHeight(20);
    obj.imageCheckBox138:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox138:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox138:setField("magicCheck_271");
    obj.imageCheckBox138:setName("imageCheckBox138");

    obj.imageCheckBox139 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox139:setParent(obj.layout50);
    obj.imageCheckBox139:setLeft(160);
    obj.imageCheckBox139:setTop(0);
    obj.imageCheckBox139:setWidth(20);
    obj.imageCheckBox139:setHeight(20);
    obj.imageCheckBox139:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox139:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox139:setField("magicCheck_281");
    obj.imageCheckBox139:setName("imageCheckBox139");

    obj.imageCheckBox140 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox140:setParent(obj.layout50);
    obj.imageCheckBox140:setLeft(180);
    obj.imageCheckBox140:setTop(0);
    obj.imageCheckBox140:setWidth(20);
    obj.imageCheckBox140:setHeight(20);
    obj.imageCheckBox140:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox140:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox140:setField("magicCheck_291");
    obj.imageCheckBox140:setName("imageCheckBox140");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout48);
    obj.textEditor21:setLeft(36);
    obj.textEditor21:setTop(292);
    obj.textEditor21:setWidth(320);
    obj.textEditor21:setHeight(150);
    obj.textEditor21:setFontSize(14);
    obj.textEditor21:setFontColor("#000000");
    obj.textEditor21:setTransparent(true);
    obj.textEditor21:setField("magicDesc_21");
    obj.textEditor21:setName("textEditor21");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout48);
    obj.edit91:setLeft(80);
    obj.edit91:setTop(448);
    obj.edit91:setWidth(160);
    obj.edit91:setHeight(30);
    obj.edit91:setFontSize(16);
    obj.edit91:setFontColor("#000000");
    obj.edit91:setTransparent(true);
    obj.edit91:setField("magicName_31");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout48);
    obj.edit92:setLeft(302);
    obj.edit92:setTop(448);
    obj.edit92:setWidth(90);
    obj.edit92:setHeight(30);
    obj.edit92:setFontSize(16);
    obj.edit92:setFontColor("#000000");
    obj.edit92:setTransparent(true);
    obj.edit92:setField("magicTrad_31");
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout48);
    obj.edit93:setLeft(406);
    obj.edit93:setTop(478);
    obj.edit93:setWidth(90);
    obj.edit93:setHeight(30);
    obj.edit93:setFontSize(16);
    obj.edit93:setFontColor("#000000");
    obj.edit93:setTransparent(true);
    obj.edit93:setField("magicLevel_31");
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout48);
    obj.edit94:setLeft(370);
    obj.edit94:setTop(510);
    obj.edit94:setWidth(90);
    obj.edit94:setHeight(30);
    obj.edit94:setFontSize(16);
    obj.edit94:setFontColor("#000000");
    obj.edit94:setTransparent(true);
    obj.edit94:setField("magicConj_31");
    obj.edit94:setName("edit94");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout48);
    obj.layout51:setLeft(73);
    obj.layout51:setTop(478);
    obj.layout51:setWidth(200);
    obj.layout51:setHeight(20);
    obj.layout51:setName("layout51");

    obj.imageCheckBox141 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox141:setParent(obj.layout51);
    obj.imageCheckBox141:setLeft(0);
    obj.imageCheckBox141:setTop(0);
    obj.imageCheckBox141:setWidth(20);
    obj.imageCheckBox141:setHeight(20);
    obj.imageCheckBox141:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox141:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox141:setField("magicCheck_301");
    obj.imageCheckBox141:setName("imageCheckBox141");

    obj.imageCheckBox142 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox142:setParent(obj.layout51);
    obj.imageCheckBox142:setLeft(20);
    obj.imageCheckBox142:setTop(0);
    obj.imageCheckBox142:setWidth(20);
    obj.imageCheckBox142:setHeight(20);
    obj.imageCheckBox142:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox142:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox142:setField("magicCheck_311");
    obj.imageCheckBox142:setName("imageCheckBox142");

    obj.imageCheckBox143 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox143:setParent(obj.layout51);
    obj.imageCheckBox143:setLeft(40);
    obj.imageCheckBox143:setTop(0);
    obj.imageCheckBox143:setWidth(20);
    obj.imageCheckBox143:setHeight(20);
    obj.imageCheckBox143:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox143:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox143:setField("magicCheck_321");
    obj.imageCheckBox143:setName("imageCheckBox143");

    obj.imageCheckBox144 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox144:setParent(obj.layout51);
    obj.imageCheckBox144:setLeft(60);
    obj.imageCheckBox144:setTop(0);
    obj.imageCheckBox144:setWidth(20);
    obj.imageCheckBox144:setHeight(20);
    obj.imageCheckBox144:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox144:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox144:setField("magicCheck_331");
    obj.imageCheckBox144:setName("imageCheckBox144");

    obj.imageCheckBox145 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox145:setParent(obj.layout51);
    obj.imageCheckBox145:setLeft(80);
    obj.imageCheckBox145:setTop(0);
    obj.imageCheckBox145:setWidth(20);
    obj.imageCheckBox145:setHeight(20);
    obj.imageCheckBox145:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox145:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox145:setField("magicCheck_341");
    obj.imageCheckBox145:setName("imageCheckBox145");

    obj.imageCheckBox146 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox146:setParent(obj.layout51);
    obj.imageCheckBox146:setLeft(100);
    obj.imageCheckBox146:setTop(0);
    obj.imageCheckBox146:setWidth(20);
    obj.imageCheckBox146:setHeight(20);
    obj.imageCheckBox146:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox146:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox146:setField("magicCheck_351");
    obj.imageCheckBox146:setName("imageCheckBox146");

    obj.imageCheckBox147 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox147:setParent(obj.layout51);
    obj.imageCheckBox147:setLeft(120);
    obj.imageCheckBox147:setTop(0);
    obj.imageCheckBox147:setWidth(20);
    obj.imageCheckBox147:setHeight(20);
    obj.imageCheckBox147:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox147:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox147:setField("magicCheck_361");
    obj.imageCheckBox147:setName("imageCheckBox147");

    obj.imageCheckBox148 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox148:setParent(obj.layout51);
    obj.imageCheckBox148:setLeft(140);
    obj.imageCheckBox148:setTop(0);
    obj.imageCheckBox148:setWidth(20);
    obj.imageCheckBox148:setHeight(20);
    obj.imageCheckBox148:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox148:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox148:setField("magicCheck_371");
    obj.imageCheckBox148:setName("imageCheckBox148");

    obj.imageCheckBox149 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox149:setParent(obj.layout51);
    obj.imageCheckBox149:setLeft(160);
    obj.imageCheckBox149:setTop(0);
    obj.imageCheckBox149:setWidth(20);
    obj.imageCheckBox149:setHeight(20);
    obj.imageCheckBox149:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox149:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox149:setField("magicCheck_381");
    obj.imageCheckBox149:setName("imageCheckBox149");

    obj.imageCheckBox150 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox150:setParent(obj.layout51);
    obj.imageCheckBox150:setLeft(180);
    obj.imageCheckBox150:setTop(0);
    obj.imageCheckBox150:setWidth(20);
    obj.imageCheckBox150:setHeight(20);
    obj.imageCheckBox150:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox150:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox150:setField("magicCheck_391");
    obj.imageCheckBox150:setName("imageCheckBox150");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.layout48);
    obj.textEditor22:setLeft(36);
    obj.textEditor22:setTop(498);
    obj.textEditor22:setWidth(320);
    obj.textEditor22:setHeight(150);
    obj.textEditor22:setFontSize(14);
    obj.textEditor22:setFontColor("#000000");
    obj.textEditor22:setTransparent(true);
    obj.textEditor22:setField("magicDesc_31");
    obj.textEditor22:setName("textEditor22");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout48);
    obj.edit95:setLeft(80);
    obj.edit95:setTop(670);
    obj.edit95:setWidth(160);
    obj.edit95:setHeight(30);
    obj.edit95:setFontSize(16);
    obj.edit95:setFontColor("#000000");
    obj.edit95:setTransparent(true);
    obj.edit95:setField("magicName_41");
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout48);
    obj.edit96:setLeft(302);
    obj.edit96:setTop(670);
    obj.edit96:setWidth(90);
    obj.edit96:setHeight(30);
    obj.edit96:setFontSize(16);
    obj.edit96:setFontColor("#000000");
    obj.edit96:setTransparent(true);
    obj.edit96:setField("magicTrad_41");
    obj.edit96:setName("edit96");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout48);
    obj.edit97:setLeft(406);
    obj.edit97:setTop(700);
    obj.edit97:setWidth(90);
    obj.edit97:setHeight(30);
    obj.edit97:setFontSize(16);
    obj.edit97:setFontColor("#000000");
    obj.edit97:setTransparent(true);
    obj.edit97:setField("magicLevel_41");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout48);
    obj.edit98:setLeft(370);
    obj.edit98:setTop(732);
    obj.edit98:setWidth(90);
    obj.edit98:setHeight(30);
    obj.edit98:setFontSize(16);
    obj.edit98:setFontColor("#000000");
    obj.edit98:setTransparent(true);
    obj.edit98:setField("magicConj_41");
    obj.edit98:setName("edit98");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout48);
    obj.layout52:setLeft(73);
    obj.layout52:setTop(700);
    obj.layout52:setWidth(200);
    obj.layout52:setHeight(20);
    obj.layout52:setName("layout52");

    obj.imageCheckBox151 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox151:setParent(obj.layout52);
    obj.imageCheckBox151:setLeft(0);
    obj.imageCheckBox151:setTop(0);
    obj.imageCheckBox151:setWidth(20);
    obj.imageCheckBox151:setHeight(20);
    obj.imageCheckBox151:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox151:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox151:setField("magicCheck_401");
    obj.imageCheckBox151:setName("imageCheckBox151");

    obj.imageCheckBox152 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox152:setParent(obj.layout52);
    obj.imageCheckBox152:setLeft(20);
    obj.imageCheckBox152:setTop(0);
    obj.imageCheckBox152:setWidth(20);
    obj.imageCheckBox152:setHeight(20);
    obj.imageCheckBox152:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox152:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox152:setField("magicCheck_411");
    obj.imageCheckBox152:setName("imageCheckBox152");

    obj.imageCheckBox153 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox153:setParent(obj.layout52);
    obj.imageCheckBox153:setLeft(40);
    obj.imageCheckBox153:setTop(0);
    obj.imageCheckBox153:setWidth(20);
    obj.imageCheckBox153:setHeight(20);
    obj.imageCheckBox153:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox153:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox153:setField("magicCheck_421");
    obj.imageCheckBox153:setName("imageCheckBox153");

    obj.imageCheckBox154 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox154:setParent(obj.layout52);
    obj.imageCheckBox154:setLeft(60);
    obj.imageCheckBox154:setTop(0);
    obj.imageCheckBox154:setWidth(20);
    obj.imageCheckBox154:setHeight(20);
    obj.imageCheckBox154:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox154:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox154:setField("magicCheck_431");
    obj.imageCheckBox154:setName("imageCheckBox154");

    obj.imageCheckBox155 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox155:setParent(obj.layout52);
    obj.imageCheckBox155:setLeft(80);
    obj.imageCheckBox155:setTop(0);
    obj.imageCheckBox155:setWidth(20);
    obj.imageCheckBox155:setHeight(20);
    obj.imageCheckBox155:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox155:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox155:setField("magicCheck_441");
    obj.imageCheckBox155:setName("imageCheckBox155");

    obj.imageCheckBox156 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox156:setParent(obj.layout52);
    obj.imageCheckBox156:setLeft(100);
    obj.imageCheckBox156:setTop(0);
    obj.imageCheckBox156:setWidth(20);
    obj.imageCheckBox156:setHeight(20);
    obj.imageCheckBox156:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox156:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox156:setField("magicCheck_451");
    obj.imageCheckBox156:setName("imageCheckBox156");

    obj.imageCheckBox157 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox157:setParent(obj.layout52);
    obj.imageCheckBox157:setLeft(120);
    obj.imageCheckBox157:setTop(0);
    obj.imageCheckBox157:setWidth(20);
    obj.imageCheckBox157:setHeight(20);
    obj.imageCheckBox157:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox157:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox157:setField("magicCheck_461");
    obj.imageCheckBox157:setName("imageCheckBox157");

    obj.imageCheckBox158 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox158:setParent(obj.layout52);
    obj.imageCheckBox158:setLeft(140);
    obj.imageCheckBox158:setTop(0);
    obj.imageCheckBox158:setWidth(20);
    obj.imageCheckBox158:setHeight(20);
    obj.imageCheckBox158:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox158:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox158:setField("magicCheck_471");
    obj.imageCheckBox158:setName("imageCheckBox158");

    obj.imageCheckBox159 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox159:setParent(obj.layout52);
    obj.imageCheckBox159:setLeft(160);
    obj.imageCheckBox159:setTop(0);
    obj.imageCheckBox159:setWidth(20);
    obj.imageCheckBox159:setHeight(20);
    obj.imageCheckBox159:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox159:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox159:setField("magicCheck_481");
    obj.imageCheckBox159:setName("imageCheckBox159");

    obj.imageCheckBox160 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox160:setParent(obj.layout52);
    obj.imageCheckBox160:setLeft(180);
    obj.imageCheckBox160:setTop(0);
    obj.imageCheckBox160:setWidth(20);
    obj.imageCheckBox160:setHeight(20);
    obj.imageCheckBox160:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox160:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox160:setField("magicCheck_491");
    obj.imageCheckBox160:setName("imageCheckBox160");

    obj.textEditor23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.layout48);
    obj.textEditor23:setLeft(36);
    obj.textEditor23:setTop(720);
    obj.textEditor23:setWidth(320);
    obj.textEditor23:setHeight(150);
    obj.textEditor23:setFontSize(14);
    obj.textEditor23:setFontColor("#000000");
    obj.textEditor23:setTransparent(true);
    obj.textEditor23:setField("magicDesc_41");
    obj.textEditor23:setName("textEditor23");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout48);
    obj.edit99:setLeft(80);
    obj.edit99:setTop(856);
    obj.edit99:setWidth(160);
    obj.edit99:setHeight(30);
    obj.edit99:setFontSize(16);
    obj.edit99:setFontColor("#000000");
    obj.edit99:setTransparent(true);
    obj.edit99:setField("magicName_51");
    obj.edit99:setName("edit99");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout48);
    obj.edit100:setLeft(302);
    obj.edit100:setTop(856);
    obj.edit100:setWidth(90);
    obj.edit100:setHeight(30);
    obj.edit100:setFontSize(16);
    obj.edit100:setFontColor("#000000");
    obj.edit100:setTransparent(true);
    obj.edit100:setField("magicTrad_51");
    obj.edit100:setName("edit100");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout48);
    obj.edit101:setLeft(406);
    obj.edit101:setTop(886);
    obj.edit101:setWidth(90);
    obj.edit101:setHeight(30);
    obj.edit101:setFontSize(16);
    obj.edit101:setFontColor("#000000");
    obj.edit101:setTransparent(true);
    obj.edit101:setField("magicLevel_51");
    obj.edit101:setName("edit101");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout48);
    obj.edit102:setLeft(370);
    obj.edit102:setTop(918);
    obj.edit102:setWidth(90);
    obj.edit102:setHeight(30);
    obj.edit102:setFontSize(16);
    obj.edit102:setFontColor("#000000");
    obj.edit102:setTransparent(true);
    obj.edit102:setField("magicConj_51");
    obj.edit102:setName("edit102");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout48);
    obj.layout53:setLeft(73);
    obj.layout53:setTop(886);
    obj.layout53:setWidth(200);
    obj.layout53:setHeight(20);
    obj.layout53:setName("layout53");

    obj.imageCheckBox161 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox161:setParent(obj.layout53);
    obj.imageCheckBox161:setLeft(0);
    obj.imageCheckBox161:setTop(0);
    obj.imageCheckBox161:setWidth(20);
    obj.imageCheckBox161:setHeight(20);
    obj.imageCheckBox161:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox161:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox161:setField("magicCheck_501");
    obj.imageCheckBox161:setName("imageCheckBox161");

    obj.imageCheckBox162 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox162:setParent(obj.layout53);
    obj.imageCheckBox162:setLeft(20);
    obj.imageCheckBox162:setTop(0);
    obj.imageCheckBox162:setWidth(20);
    obj.imageCheckBox162:setHeight(20);
    obj.imageCheckBox162:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox162:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox162:setField("magicCheck_511");
    obj.imageCheckBox162:setName("imageCheckBox162");

    obj.imageCheckBox163 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox163:setParent(obj.layout53);
    obj.imageCheckBox163:setLeft(40);
    obj.imageCheckBox163:setTop(0);
    obj.imageCheckBox163:setWidth(20);
    obj.imageCheckBox163:setHeight(20);
    obj.imageCheckBox163:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox163:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox163:setField("magicCheck_521");
    obj.imageCheckBox163:setName("imageCheckBox163");

    obj.imageCheckBox164 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox164:setParent(obj.layout53);
    obj.imageCheckBox164:setLeft(60);
    obj.imageCheckBox164:setTop(0);
    obj.imageCheckBox164:setWidth(20);
    obj.imageCheckBox164:setHeight(20);
    obj.imageCheckBox164:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox164:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox164:setField("magicCheck_531");
    obj.imageCheckBox164:setName("imageCheckBox164");

    obj.imageCheckBox165 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox165:setParent(obj.layout53);
    obj.imageCheckBox165:setLeft(80);
    obj.imageCheckBox165:setTop(0);
    obj.imageCheckBox165:setWidth(20);
    obj.imageCheckBox165:setHeight(20);
    obj.imageCheckBox165:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox165:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox165:setField("magicCheck_541");
    obj.imageCheckBox165:setName("imageCheckBox165");

    obj.imageCheckBox166 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox166:setParent(obj.layout53);
    obj.imageCheckBox166:setLeft(100);
    obj.imageCheckBox166:setTop(0);
    obj.imageCheckBox166:setWidth(20);
    obj.imageCheckBox166:setHeight(20);
    obj.imageCheckBox166:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox166:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox166:setField("magicCheck_551");
    obj.imageCheckBox166:setName("imageCheckBox166");

    obj.imageCheckBox167 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox167:setParent(obj.layout53);
    obj.imageCheckBox167:setLeft(120);
    obj.imageCheckBox167:setTop(0);
    obj.imageCheckBox167:setWidth(20);
    obj.imageCheckBox167:setHeight(20);
    obj.imageCheckBox167:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox167:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox167:setField("magicCheck_561");
    obj.imageCheckBox167:setName("imageCheckBox167");

    obj.imageCheckBox168 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox168:setParent(obj.layout53);
    obj.imageCheckBox168:setLeft(140);
    obj.imageCheckBox168:setTop(0);
    obj.imageCheckBox168:setWidth(20);
    obj.imageCheckBox168:setHeight(20);
    obj.imageCheckBox168:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox168:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox168:setField("magicCheck_571");
    obj.imageCheckBox168:setName("imageCheckBox168");

    obj.imageCheckBox169 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox169:setParent(obj.layout53);
    obj.imageCheckBox169:setLeft(160);
    obj.imageCheckBox169:setTop(0);
    obj.imageCheckBox169:setWidth(20);
    obj.imageCheckBox169:setHeight(20);
    obj.imageCheckBox169:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox169:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox169:setField("magicCheck_581");
    obj.imageCheckBox169:setName("imageCheckBox169");

    obj.imageCheckBox170 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox170:setParent(obj.layout53);
    obj.imageCheckBox170:setLeft(180);
    obj.imageCheckBox170:setTop(0);
    obj.imageCheckBox170:setWidth(20);
    obj.imageCheckBox170:setHeight(20);
    obj.imageCheckBox170:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox170:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox170:setField("magicCheck_591");
    obj.imageCheckBox170:setName("imageCheckBox170");

    obj.textEditor24 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.layout48);
    obj.textEditor24:setLeft(36);
    obj.textEditor24:setTop(906);
    obj.textEditor24:setWidth(320);
    obj.textEditor24:setHeight(150);
    obj.textEditor24:setFontSize(14);
    obj.textEditor24:setFontColor("#000000");
    obj.textEditor24:setTransparent(true);
    obj.textEditor24:setField("magicDesc_51");
    obj.textEditor24:setName("textEditor24");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout48);
    obj.edit103:setLeft(80);
    obj.edit103:setTop(1056);
    obj.edit103:setWidth(160);
    obj.edit103:setHeight(30);
    obj.edit103:setFontSize(16);
    obj.edit103:setFontColor("#000000");
    obj.edit103:setTransparent(true);
    obj.edit103:setField("magicName_61");
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout48);
    obj.edit104:setLeft(302);
    obj.edit104:setTop(1056);
    obj.edit104:setWidth(90);
    obj.edit104:setHeight(30);
    obj.edit104:setFontSize(16);
    obj.edit104:setFontColor("#000000");
    obj.edit104:setTransparent(true);
    obj.edit104:setField("magicTrad_61");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout48);
    obj.edit105:setLeft(406);
    obj.edit105:setTop(1086);
    obj.edit105:setWidth(90);
    obj.edit105:setHeight(30);
    obj.edit105:setFontSize(16);
    obj.edit105:setFontColor("#000000");
    obj.edit105:setTransparent(true);
    obj.edit105:setField("magicLevel_61");
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout48);
    obj.edit106:setLeft(370);
    obj.edit106:setTop(1118);
    obj.edit106:setWidth(90);
    obj.edit106:setHeight(30);
    obj.edit106:setFontSize(16);
    obj.edit106:setFontColor("#000000");
    obj.edit106:setTransparent(true);
    obj.edit106:setField("magicConj_61");
    obj.edit106:setName("edit106");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout48);
    obj.layout54:setLeft(73);
    obj.layout54:setTop(1086);
    obj.layout54:setWidth(200);
    obj.layout54:setHeight(20);
    obj.layout54:setName("layout54");

    obj.imageCheckBox171 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox171:setParent(obj.layout54);
    obj.imageCheckBox171:setLeft(0);
    obj.imageCheckBox171:setTop(0);
    obj.imageCheckBox171:setWidth(20);
    obj.imageCheckBox171:setHeight(20);
    obj.imageCheckBox171:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox171:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox171:setField("magicCheck_601");
    obj.imageCheckBox171:setName("imageCheckBox171");

    obj.imageCheckBox172 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox172:setParent(obj.layout54);
    obj.imageCheckBox172:setLeft(20);
    obj.imageCheckBox172:setTop(0);
    obj.imageCheckBox172:setWidth(20);
    obj.imageCheckBox172:setHeight(20);
    obj.imageCheckBox172:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox172:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox172:setField("magicCheck_611");
    obj.imageCheckBox172:setName("imageCheckBox172");

    obj.imageCheckBox173 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox173:setParent(obj.layout54);
    obj.imageCheckBox173:setLeft(40);
    obj.imageCheckBox173:setTop(0);
    obj.imageCheckBox173:setWidth(20);
    obj.imageCheckBox173:setHeight(20);
    obj.imageCheckBox173:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox173:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox173:setField("magicCheck_621");
    obj.imageCheckBox173:setName("imageCheckBox173");

    obj.imageCheckBox174 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox174:setParent(obj.layout54);
    obj.imageCheckBox174:setLeft(60);
    obj.imageCheckBox174:setTop(0);
    obj.imageCheckBox174:setWidth(20);
    obj.imageCheckBox174:setHeight(20);
    obj.imageCheckBox174:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox174:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox174:setField("magicCheck_631");
    obj.imageCheckBox174:setName("imageCheckBox174");

    obj.imageCheckBox175 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox175:setParent(obj.layout54);
    obj.imageCheckBox175:setLeft(80);
    obj.imageCheckBox175:setTop(0);
    obj.imageCheckBox175:setWidth(20);
    obj.imageCheckBox175:setHeight(20);
    obj.imageCheckBox175:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox175:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox175:setField("magicCheck_641");
    obj.imageCheckBox175:setName("imageCheckBox175");

    obj.imageCheckBox176 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox176:setParent(obj.layout54);
    obj.imageCheckBox176:setLeft(100);
    obj.imageCheckBox176:setTop(0);
    obj.imageCheckBox176:setWidth(20);
    obj.imageCheckBox176:setHeight(20);
    obj.imageCheckBox176:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox176:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox176:setField("magicCheck_651");
    obj.imageCheckBox176:setName("imageCheckBox176");

    obj.imageCheckBox177 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox177:setParent(obj.layout54);
    obj.imageCheckBox177:setLeft(120);
    obj.imageCheckBox177:setTop(0);
    obj.imageCheckBox177:setWidth(20);
    obj.imageCheckBox177:setHeight(20);
    obj.imageCheckBox177:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox177:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox177:setField("magicCheck_661");
    obj.imageCheckBox177:setName("imageCheckBox177");

    obj.imageCheckBox178 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox178:setParent(obj.layout54);
    obj.imageCheckBox178:setLeft(140);
    obj.imageCheckBox178:setTop(0);
    obj.imageCheckBox178:setWidth(20);
    obj.imageCheckBox178:setHeight(20);
    obj.imageCheckBox178:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox178:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox178:setField("magicCheck_671");
    obj.imageCheckBox178:setName("imageCheckBox178");

    obj.imageCheckBox179 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox179:setParent(obj.layout54);
    obj.imageCheckBox179:setLeft(160);
    obj.imageCheckBox179:setTop(0);
    obj.imageCheckBox179:setWidth(20);
    obj.imageCheckBox179:setHeight(20);
    obj.imageCheckBox179:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox179:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox179:setField("magicCheck_681");
    obj.imageCheckBox179:setName("imageCheckBox179");

    obj.imageCheckBox180 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox180:setParent(obj.layout54);
    obj.imageCheckBox180:setLeft(180);
    obj.imageCheckBox180:setTop(0);
    obj.imageCheckBox180:setWidth(20);
    obj.imageCheckBox180:setHeight(20);
    obj.imageCheckBox180:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox180:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox180:setField("magicCheck_691");
    obj.imageCheckBox180:setName("imageCheckBox180");

    obj.textEditor25 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.layout48);
    obj.textEditor25:setLeft(36);
    obj.textEditor25:setTop(1106);
    obj.textEditor25:setWidth(320);
    obj.textEditor25:setHeight(150);
    obj.textEditor25:setFontSize(14);
    obj.textEditor25:setFontColor("#000000");
    obj.textEditor25:setTransparent(true);
    obj.textEditor25:setField("magicDesc_61");
    obj.textEditor25:setName("textEditor25");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle3);
    obj.layout55:setLeft(427);
    obj.layout55:setTop(0);
    obj.layout55:setWidth(447);
    obj.layout55:setHeight(1263);
    obj.layout55:setName("layout55");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout55);
    obj.edit107:setLeft(80);
    obj.edit107:setTop(36);
    obj.edit107:setWidth(160);
    obj.edit107:setHeight(30);
    obj.edit107:setFontSize(16);
    obj.edit107:setFontColor("#000000");
    obj.edit107:setTransparent(true);
    obj.edit107:setField("magicName_71");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout55);
    obj.edit108:setLeft(302);
    obj.edit108:setTop(36);
    obj.edit108:setWidth(90);
    obj.edit108:setHeight(30);
    obj.edit108:setFontSize(16);
    obj.edit108:setFontColor("#000000");
    obj.edit108:setTransparent(true);
    obj.edit108:setField("magicTrad_71");
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout55);
    obj.edit109:setLeft(406);
    obj.edit109:setTop(66);
    obj.edit109:setWidth(90);
    obj.edit109:setHeight(30);
    obj.edit109:setFontSize(16);
    obj.edit109:setFontColor("#000000");
    obj.edit109:setTransparent(true);
    obj.edit109:setField("magicLevel_71");
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout55);
    obj.edit110:setLeft(370);
    obj.edit110:setTop(98);
    obj.edit110:setWidth(90);
    obj.edit110:setHeight(30);
    obj.edit110:setFontSize(16);
    obj.edit110:setFontColor("#000000");
    obj.edit110:setTransparent(true);
    obj.edit110:setField("magicConj_71");
    obj.edit110:setName("edit110");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout55);
    obj.layout56:setLeft(73);
    obj.layout56:setTop(66);
    obj.layout56:setWidth(200);
    obj.layout56:setHeight(20);
    obj.layout56:setName("layout56");

    obj.imageCheckBox181 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox181:setParent(obj.layout56);
    obj.imageCheckBox181:setLeft(0);
    obj.imageCheckBox181:setTop(0);
    obj.imageCheckBox181:setWidth(20);
    obj.imageCheckBox181:setHeight(20);
    obj.imageCheckBox181:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox181:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox181:setField("magicCheck_701");
    obj.imageCheckBox181:setName("imageCheckBox181");

    obj.imageCheckBox182 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox182:setParent(obj.layout56);
    obj.imageCheckBox182:setLeft(20);
    obj.imageCheckBox182:setTop(0);
    obj.imageCheckBox182:setWidth(20);
    obj.imageCheckBox182:setHeight(20);
    obj.imageCheckBox182:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox182:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox182:setField("magicCheck_711");
    obj.imageCheckBox182:setName("imageCheckBox182");

    obj.imageCheckBox183 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox183:setParent(obj.layout56);
    obj.imageCheckBox183:setLeft(40);
    obj.imageCheckBox183:setTop(0);
    obj.imageCheckBox183:setWidth(20);
    obj.imageCheckBox183:setHeight(20);
    obj.imageCheckBox183:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox183:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox183:setField("magicCheck_721");
    obj.imageCheckBox183:setName("imageCheckBox183");

    obj.imageCheckBox184 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox184:setParent(obj.layout56);
    obj.imageCheckBox184:setLeft(60);
    obj.imageCheckBox184:setTop(0);
    obj.imageCheckBox184:setWidth(20);
    obj.imageCheckBox184:setHeight(20);
    obj.imageCheckBox184:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox184:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox184:setField("magicCheck_731");
    obj.imageCheckBox184:setName("imageCheckBox184");

    obj.imageCheckBox185 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox185:setParent(obj.layout56);
    obj.imageCheckBox185:setLeft(80);
    obj.imageCheckBox185:setTop(0);
    obj.imageCheckBox185:setWidth(20);
    obj.imageCheckBox185:setHeight(20);
    obj.imageCheckBox185:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox185:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox185:setField("magicCheck_741");
    obj.imageCheckBox185:setName("imageCheckBox185");

    obj.imageCheckBox186 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox186:setParent(obj.layout56);
    obj.imageCheckBox186:setLeft(100);
    obj.imageCheckBox186:setTop(0);
    obj.imageCheckBox186:setWidth(20);
    obj.imageCheckBox186:setHeight(20);
    obj.imageCheckBox186:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox186:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox186:setField("magicCheck_751");
    obj.imageCheckBox186:setName("imageCheckBox186");

    obj.imageCheckBox187 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox187:setParent(obj.layout56);
    obj.imageCheckBox187:setLeft(120);
    obj.imageCheckBox187:setTop(0);
    obj.imageCheckBox187:setWidth(20);
    obj.imageCheckBox187:setHeight(20);
    obj.imageCheckBox187:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox187:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox187:setField("magicCheck_761");
    obj.imageCheckBox187:setName("imageCheckBox187");

    obj.imageCheckBox188 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox188:setParent(obj.layout56);
    obj.imageCheckBox188:setLeft(140);
    obj.imageCheckBox188:setTop(0);
    obj.imageCheckBox188:setWidth(20);
    obj.imageCheckBox188:setHeight(20);
    obj.imageCheckBox188:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox188:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox188:setField("magicCheck_771");
    obj.imageCheckBox188:setName("imageCheckBox188");

    obj.imageCheckBox189 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox189:setParent(obj.layout56);
    obj.imageCheckBox189:setLeft(160);
    obj.imageCheckBox189:setTop(0);
    obj.imageCheckBox189:setWidth(20);
    obj.imageCheckBox189:setHeight(20);
    obj.imageCheckBox189:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox189:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox189:setField("magicCheck_781");
    obj.imageCheckBox189:setName("imageCheckBox189");

    obj.imageCheckBox190 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox190:setParent(obj.layout56);
    obj.imageCheckBox190:setLeft(180);
    obj.imageCheckBox190:setTop(0);
    obj.imageCheckBox190:setWidth(20);
    obj.imageCheckBox190:setHeight(20);
    obj.imageCheckBox190:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox190:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox190:setField("magicCheck_791");
    obj.imageCheckBox190:setName("imageCheckBox190");

    obj.textEditor26 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor26:setParent(obj.layout55);
    obj.textEditor26:setLeft(36);
    obj.textEditor26:setTop(86);
    obj.textEditor26:setWidth(320);
    obj.textEditor26:setHeight(150);
    obj.textEditor26:setFontSize(14);
    obj.textEditor26:setFontColor("#000000");
    obj.textEditor26:setTransparent(true);
    obj.textEditor26:setField("magicDesc_71");
    obj.textEditor26:setName("textEditor26");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout55);
    obj.edit111:setLeft(80);
    obj.edit111:setTop(242);
    obj.edit111:setWidth(160);
    obj.edit111:setHeight(30);
    obj.edit111:setFontSize(16);
    obj.edit111:setFontColor("#000000");
    obj.edit111:setTransparent(true);
    obj.edit111:setField("magicName_81");
    obj.edit111:setName("edit111");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout55);
    obj.edit112:setLeft(302);
    obj.edit112:setTop(242);
    obj.edit112:setWidth(90);
    obj.edit112:setHeight(30);
    obj.edit112:setFontSize(16);
    obj.edit112:setFontColor("#000000");
    obj.edit112:setTransparent(true);
    obj.edit112:setField("magicTrad_81");
    obj.edit112:setName("edit112");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout55);
    obj.edit113:setLeft(406);
    obj.edit113:setTop(272);
    obj.edit113:setWidth(90);
    obj.edit113:setHeight(30);
    obj.edit113:setFontSize(16);
    obj.edit113:setFontColor("#000000");
    obj.edit113:setTransparent(true);
    obj.edit113:setField("magicLevel_81");
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout55);
    obj.edit114:setLeft(370);
    obj.edit114:setTop(304);
    obj.edit114:setWidth(90);
    obj.edit114:setHeight(30);
    obj.edit114:setFontSize(16);
    obj.edit114:setFontColor("#000000");
    obj.edit114:setTransparent(true);
    obj.edit114:setField("magicConj_81");
    obj.edit114:setName("edit114");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout55);
    obj.layout57:setLeft(73);
    obj.layout57:setTop(272);
    obj.layout57:setWidth(200);
    obj.layout57:setHeight(20);
    obj.layout57:setName("layout57");

    obj.imageCheckBox191 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox191:setParent(obj.layout57);
    obj.imageCheckBox191:setLeft(0);
    obj.imageCheckBox191:setTop(0);
    obj.imageCheckBox191:setWidth(20);
    obj.imageCheckBox191:setHeight(20);
    obj.imageCheckBox191:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox191:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox191:setField("magicCheck_801");
    obj.imageCheckBox191:setName("imageCheckBox191");

    obj.imageCheckBox192 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox192:setParent(obj.layout57);
    obj.imageCheckBox192:setLeft(20);
    obj.imageCheckBox192:setTop(0);
    obj.imageCheckBox192:setWidth(20);
    obj.imageCheckBox192:setHeight(20);
    obj.imageCheckBox192:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox192:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox192:setField("magicCheck_811");
    obj.imageCheckBox192:setName("imageCheckBox192");

    obj.imageCheckBox193 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox193:setParent(obj.layout57);
    obj.imageCheckBox193:setLeft(40);
    obj.imageCheckBox193:setTop(0);
    obj.imageCheckBox193:setWidth(20);
    obj.imageCheckBox193:setHeight(20);
    obj.imageCheckBox193:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox193:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox193:setField("magicCheck_821");
    obj.imageCheckBox193:setName("imageCheckBox193");

    obj.imageCheckBox194 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox194:setParent(obj.layout57);
    obj.imageCheckBox194:setLeft(60);
    obj.imageCheckBox194:setTop(0);
    obj.imageCheckBox194:setWidth(20);
    obj.imageCheckBox194:setHeight(20);
    obj.imageCheckBox194:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox194:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox194:setField("magicCheck_831");
    obj.imageCheckBox194:setName("imageCheckBox194");

    obj.imageCheckBox195 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox195:setParent(obj.layout57);
    obj.imageCheckBox195:setLeft(80);
    obj.imageCheckBox195:setTop(0);
    obj.imageCheckBox195:setWidth(20);
    obj.imageCheckBox195:setHeight(20);
    obj.imageCheckBox195:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox195:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox195:setField("magicCheck_841");
    obj.imageCheckBox195:setName("imageCheckBox195");

    obj.imageCheckBox196 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox196:setParent(obj.layout57);
    obj.imageCheckBox196:setLeft(100);
    obj.imageCheckBox196:setTop(0);
    obj.imageCheckBox196:setWidth(20);
    obj.imageCheckBox196:setHeight(20);
    obj.imageCheckBox196:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox196:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox196:setField("magicCheck_851");
    obj.imageCheckBox196:setName("imageCheckBox196");

    obj.imageCheckBox197 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox197:setParent(obj.layout57);
    obj.imageCheckBox197:setLeft(120);
    obj.imageCheckBox197:setTop(0);
    obj.imageCheckBox197:setWidth(20);
    obj.imageCheckBox197:setHeight(20);
    obj.imageCheckBox197:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox197:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox197:setField("magicCheck_861");
    obj.imageCheckBox197:setName("imageCheckBox197");

    obj.imageCheckBox198 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox198:setParent(obj.layout57);
    obj.imageCheckBox198:setLeft(140);
    obj.imageCheckBox198:setTop(0);
    obj.imageCheckBox198:setWidth(20);
    obj.imageCheckBox198:setHeight(20);
    obj.imageCheckBox198:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox198:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox198:setField("magicCheck_871");
    obj.imageCheckBox198:setName("imageCheckBox198");

    obj.imageCheckBox199 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox199:setParent(obj.layout57);
    obj.imageCheckBox199:setLeft(160);
    obj.imageCheckBox199:setTop(0);
    obj.imageCheckBox199:setWidth(20);
    obj.imageCheckBox199:setHeight(20);
    obj.imageCheckBox199:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox199:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox199:setField("magicCheck_881");
    obj.imageCheckBox199:setName("imageCheckBox199");

    obj.imageCheckBox200 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox200:setParent(obj.layout57);
    obj.imageCheckBox200:setLeft(180);
    obj.imageCheckBox200:setTop(0);
    obj.imageCheckBox200:setWidth(20);
    obj.imageCheckBox200:setHeight(20);
    obj.imageCheckBox200:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox200:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox200:setField("magicCheck_891");
    obj.imageCheckBox200:setName("imageCheckBox200");

    obj.textEditor27 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor27:setParent(obj.layout55);
    obj.textEditor27:setLeft(36);
    obj.textEditor27:setTop(292);
    obj.textEditor27:setWidth(320);
    obj.textEditor27:setHeight(150);
    obj.textEditor27:setFontSize(14);
    obj.textEditor27:setFontColor("#000000");
    obj.textEditor27:setTransparent(true);
    obj.textEditor27:setField("magicDesc_81");
    obj.textEditor27:setName("textEditor27");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout55);
    obj.edit115:setLeft(80);
    obj.edit115:setTop(448);
    obj.edit115:setWidth(160);
    obj.edit115:setHeight(30);
    obj.edit115:setFontSize(16);
    obj.edit115:setFontColor("#000000");
    obj.edit115:setTransparent(true);
    obj.edit115:setField("magicName_91");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout55);
    obj.edit116:setLeft(302);
    obj.edit116:setTop(448);
    obj.edit116:setWidth(90);
    obj.edit116:setHeight(30);
    obj.edit116:setFontSize(16);
    obj.edit116:setFontColor("#000000");
    obj.edit116:setTransparent(true);
    obj.edit116:setField("magicTrad_91");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout55);
    obj.edit117:setLeft(406);
    obj.edit117:setTop(478);
    obj.edit117:setWidth(90);
    obj.edit117:setHeight(30);
    obj.edit117:setFontSize(16);
    obj.edit117:setFontColor("#000000");
    obj.edit117:setTransparent(true);
    obj.edit117:setField("magicLevel_91");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout55);
    obj.edit118:setLeft(370);
    obj.edit118:setTop(510);
    obj.edit118:setWidth(90);
    obj.edit118:setHeight(30);
    obj.edit118:setFontSize(16);
    obj.edit118:setFontColor("#000000");
    obj.edit118:setTransparent(true);
    obj.edit118:setField("magicConj_91");
    obj.edit118:setName("edit118");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout55);
    obj.layout58:setLeft(73);
    obj.layout58:setTop(478);
    obj.layout58:setWidth(200);
    obj.layout58:setHeight(20);
    obj.layout58:setName("layout58");

    obj.imageCheckBox201 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox201:setParent(obj.layout58);
    obj.imageCheckBox201:setLeft(0);
    obj.imageCheckBox201:setTop(0);
    obj.imageCheckBox201:setWidth(20);
    obj.imageCheckBox201:setHeight(20);
    obj.imageCheckBox201:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox201:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox201:setField("magicCheck_901");
    obj.imageCheckBox201:setName("imageCheckBox201");

    obj.imageCheckBox202 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox202:setParent(obj.layout58);
    obj.imageCheckBox202:setLeft(20);
    obj.imageCheckBox202:setTop(0);
    obj.imageCheckBox202:setWidth(20);
    obj.imageCheckBox202:setHeight(20);
    obj.imageCheckBox202:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox202:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox202:setField("magicCheck_911");
    obj.imageCheckBox202:setName("imageCheckBox202");

    obj.imageCheckBox203 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox203:setParent(obj.layout58);
    obj.imageCheckBox203:setLeft(40);
    obj.imageCheckBox203:setTop(0);
    obj.imageCheckBox203:setWidth(20);
    obj.imageCheckBox203:setHeight(20);
    obj.imageCheckBox203:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox203:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox203:setField("magicCheck_921");
    obj.imageCheckBox203:setName("imageCheckBox203");

    obj.imageCheckBox204 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox204:setParent(obj.layout58);
    obj.imageCheckBox204:setLeft(60);
    obj.imageCheckBox204:setTop(0);
    obj.imageCheckBox204:setWidth(20);
    obj.imageCheckBox204:setHeight(20);
    obj.imageCheckBox204:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox204:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox204:setField("magicCheck_931");
    obj.imageCheckBox204:setName("imageCheckBox204");

    obj.imageCheckBox205 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox205:setParent(obj.layout58);
    obj.imageCheckBox205:setLeft(80);
    obj.imageCheckBox205:setTop(0);
    obj.imageCheckBox205:setWidth(20);
    obj.imageCheckBox205:setHeight(20);
    obj.imageCheckBox205:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox205:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox205:setField("magicCheck_941");
    obj.imageCheckBox205:setName("imageCheckBox205");

    obj.imageCheckBox206 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox206:setParent(obj.layout58);
    obj.imageCheckBox206:setLeft(100);
    obj.imageCheckBox206:setTop(0);
    obj.imageCheckBox206:setWidth(20);
    obj.imageCheckBox206:setHeight(20);
    obj.imageCheckBox206:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox206:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox206:setField("magicCheck_951");
    obj.imageCheckBox206:setName("imageCheckBox206");

    obj.imageCheckBox207 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox207:setParent(obj.layout58);
    obj.imageCheckBox207:setLeft(120);
    obj.imageCheckBox207:setTop(0);
    obj.imageCheckBox207:setWidth(20);
    obj.imageCheckBox207:setHeight(20);
    obj.imageCheckBox207:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox207:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox207:setField("magicCheck_961");
    obj.imageCheckBox207:setName("imageCheckBox207");

    obj.imageCheckBox208 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox208:setParent(obj.layout58);
    obj.imageCheckBox208:setLeft(140);
    obj.imageCheckBox208:setTop(0);
    obj.imageCheckBox208:setWidth(20);
    obj.imageCheckBox208:setHeight(20);
    obj.imageCheckBox208:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox208:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox208:setField("magicCheck_971");
    obj.imageCheckBox208:setName("imageCheckBox208");

    obj.imageCheckBox209 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox209:setParent(obj.layout58);
    obj.imageCheckBox209:setLeft(160);
    obj.imageCheckBox209:setTop(0);
    obj.imageCheckBox209:setWidth(20);
    obj.imageCheckBox209:setHeight(20);
    obj.imageCheckBox209:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox209:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox209:setField("magicCheck_981");
    obj.imageCheckBox209:setName("imageCheckBox209");

    obj.imageCheckBox210 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox210:setParent(obj.layout58);
    obj.imageCheckBox210:setLeft(180);
    obj.imageCheckBox210:setTop(0);
    obj.imageCheckBox210:setWidth(20);
    obj.imageCheckBox210:setHeight(20);
    obj.imageCheckBox210:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox210:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox210:setField("magicCheck_991");
    obj.imageCheckBox210:setName("imageCheckBox210");

    obj.textEditor28 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor28:setParent(obj.layout55);
    obj.textEditor28:setLeft(36);
    obj.textEditor28:setTop(498);
    obj.textEditor28:setWidth(320);
    obj.textEditor28:setHeight(150);
    obj.textEditor28:setFontSize(14);
    obj.textEditor28:setFontColor("#000000");
    obj.textEditor28:setTransparent(true);
    obj.textEditor28:setField("magicDesc_91");
    obj.textEditor28:setName("textEditor28");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout55);
    obj.edit119:setLeft(80);
    obj.edit119:setTop(670);
    obj.edit119:setWidth(160);
    obj.edit119:setHeight(30);
    obj.edit119:setFontSize(16);
    obj.edit119:setFontColor("#000000");
    obj.edit119:setTransparent(true);
    obj.edit119:setField("magicName_101");
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout55);
    obj.edit120:setLeft(302);
    obj.edit120:setTop(670);
    obj.edit120:setWidth(90);
    obj.edit120:setHeight(30);
    obj.edit120:setFontSize(16);
    obj.edit120:setFontColor("#000000");
    obj.edit120:setTransparent(true);
    obj.edit120:setField("magicTrad_101");
    obj.edit120:setName("edit120");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout55);
    obj.edit121:setLeft(406);
    obj.edit121:setTop(700);
    obj.edit121:setWidth(90);
    obj.edit121:setHeight(30);
    obj.edit121:setFontSize(16);
    obj.edit121:setFontColor("#000000");
    obj.edit121:setTransparent(true);
    obj.edit121:setField("magicLevel_101");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout55);
    obj.edit122:setLeft(370);
    obj.edit122:setTop(732);
    obj.edit122:setWidth(90);
    obj.edit122:setHeight(30);
    obj.edit122:setFontSize(16);
    obj.edit122:setFontColor("#000000");
    obj.edit122:setTransparent(true);
    obj.edit122:setField("magicConj_101");
    obj.edit122:setName("edit122");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout55);
    obj.layout59:setLeft(73);
    obj.layout59:setTop(700);
    obj.layout59:setWidth(200);
    obj.layout59:setHeight(20);
    obj.layout59:setName("layout59");

    obj.imageCheckBox211 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox211:setParent(obj.layout59);
    obj.imageCheckBox211:setLeft(0);
    obj.imageCheckBox211:setTop(0);
    obj.imageCheckBox211:setWidth(20);
    obj.imageCheckBox211:setHeight(20);
    obj.imageCheckBox211:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox211:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox211:setField("magicCheck_1001");
    obj.imageCheckBox211:setName("imageCheckBox211");

    obj.imageCheckBox212 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox212:setParent(obj.layout59);
    obj.imageCheckBox212:setLeft(20);
    obj.imageCheckBox212:setTop(0);
    obj.imageCheckBox212:setWidth(20);
    obj.imageCheckBox212:setHeight(20);
    obj.imageCheckBox212:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox212:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox212:setField("magicCheck_1011");
    obj.imageCheckBox212:setName("imageCheckBox212");

    obj.imageCheckBox213 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox213:setParent(obj.layout59);
    obj.imageCheckBox213:setLeft(40);
    obj.imageCheckBox213:setTop(0);
    obj.imageCheckBox213:setWidth(20);
    obj.imageCheckBox213:setHeight(20);
    obj.imageCheckBox213:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox213:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox213:setField("magicCheck_1021");
    obj.imageCheckBox213:setName("imageCheckBox213");

    obj.imageCheckBox214 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox214:setParent(obj.layout59);
    obj.imageCheckBox214:setLeft(60);
    obj.imageCheckBox214:setTop(0);
    obj.imageCheckBox214:setWidth(20);
    obj.imageCheckBox214:setHeight(20);
    obj.imageCheckBox214:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox214:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox214:setField("magicCheck_1031");
    obj.imageCheckBox214:setName("imageCheckBox214");

    obj.imageCheckBox215 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox215:setParent(obj.layout59);
    obj.imageCheckBox215:setLeft(80);
    obj.imageCheckBox215:setTop(0);
    obj.imageCheckBox215:setWidth(20);
    obj.imageCheckBox215:setHeight(20);
    obj.imageCheckBox215:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox215:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox215:setField("magicCheck_1041");
    obj.imageCheckBox215:setName("imageCheckBox215");

    obj.imageCheckBox216 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox216:setParent(obj.layout59);
    obj.imageCheckBox216:setLeft(100);
    obj.imageCheckBox216:setTop(0);
    obj.imageCheckBox216:setWidth(20);
    obj.imageCheckBox216:setHeight(20);
    obj.imageCheckBox216:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox216:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox216:setField("magicCheck_1051");
    obj.imageCheckBox216:setName("imageCheckBox216");

    obj.imageCheckBox217 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox217:setParent(obj.layout59);
    obj.imageCheckBox217:setLeft(120);
    obj.imageCheckBox217:setTop(0);
    obj.imageCheckBox217:setWidth(20);
    obj.imageCheckBox217:setHeight(20);
    obj.imageCheckBox217:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox217:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox217:setField("magicCheck_1061");
    obj.imageCheckBox217:setName("imageCheckBox217");

    obj.imageCheckBox218 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox218:setParent(obj.layout59);
    obj.imageCheckBox218:setLeft(140);
    obj.imageCheckBox218:setTop(0);
    obj.imageCheckBox218:setWidth(20);
    obj.imageCheckBox218:setHeight(20);
    obj.imageCheckBox218:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox218:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox218:setField("magicCheck_1071");
    obj.imageCheckBox218:setName("imageCheckBox218");

    obj.imageCheckBox219 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox219:setParent(obj.layout59);
    obj.imageCheckBox219:setLeft(160);
    obj.imageCheckBox219:setTop(0);
    obj.imageCheckBox219:setWidth(20);
    obj.imageCheckBox219:setHeight(20);
    obj.imageCheckBox219:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox219:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox219:setField("magicCheck_1081");
    obj.imageCheckBox219:setName("imageCheckBox219");

    obj.imageCheckBox220 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox220:setParent(obj.layout59);
    obj.imageCheckBox220:setLeft(180);
    obj.imageCheckBox220:setTop(0);
    obj.imageCheckBox220:setWidth(20);
    obj.imageCheckBox220:setHeight(20);
    obj.imageCheckBox220:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox220:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox220:setField("magicCheck_1091");
    obj.imageCheckBox220:setName("imageCheckBox220");

    obj.textEditor29 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor29:setParent(obj.layout55);
    obj.textEditor29:setLeft(36);
    obj.textEditor29:setTop(720);
    obj.textEditor29:setWidth(320);
    obj.textEditor29:setHeight(150);
    obj.textEditor29:setFontSize(14);
    obj.textEditor29:setFontColor("#000000");
    obj.textEditor29:setTransparent(true);
    obj.textEditor29:setField("magicDesc_101");
    obj.textEditor29:setName("textEditor29");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout55);
    obj.edit123:setLeft(80);
    obj.edit123:setTop(856);
    obj.edit123:setWidth(160);
    obj.edit123:setHeight(30);
    obj.edit123:setFontSize(16);
    obj.edit123:setFontColor("#000000");
    obj.edit123:setTransparent(true);
    obj.edit123:setField("magicName_111");
    obj.edit123:setName("edit123");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout55);
    obj.edit124:setLeft(302);
    obj.edit124:setTop(856);
    obj.edit124:setWidth(90);
    obj.edit124:setHeight(30);
    obj.edit124:setFontSize(16);
    obj.edit124:setFontColor("#000000");
    obj.edit124:setTransparent(true);
    obj.edit124:setField("magicTrad_111");
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout55);
    obj.edit125:setLeft(406);
    obj.edit125:setTop(886);
    obj.edit125:setWidth(90);
    obj.edit125:setHeight(30);
    obj.edit125:setFontSize(16);
    obj.edit125:setFontColor("#000000");
    obj.edit125:setTransparent(true);
    obj.edit125:setField("magicLevel_111");
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout55);
    obj.edit126:setLeft(370);
    obj.edit126:setTop(918);
    obj.edit126:setWidth(90);
    obj.edit126:setHeight(30);
    obj.edit126:setFontSize(16);
    obj.edit126:setFontColor("#000000");
    obj.edit126:setTransparent(true);
    obj.edit126:setField("magicConj_111");
    obj.edit126:setName("edit126");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout55);
    obj.layout60:setLeft(73);
    obj.layout60:setTop(886);
    obj.layout60:setWidth(200);
    obj.layout60:setHeight(20);
    obj.layout60:setName("layout60");

    obj.imageCheckBox221 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox221:setParent(obj.layout60);
    obj.imageCheckBox221:setLeft(0);
    obj.imageCheckBox221:setTop(0);
    obj.imageCheckBox221:setWidth(20);
    obj.imageCheckBox221:setHeight(20);
    obj.imageCheckBox221:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox221:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox221:setField("magicCheck_1101");
    obj.imageCheckBox221:setName("imageCheckBox221");

    obj.imageCheckBox222 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox222:setParent(obj.layout60);
    obj.imageCheckBox222:setLeft(20);
    obj.imageCheckBox222:setTop(0);
    obj.imageCheckBox222:setWidth(20);
    obj.imageCheckBox222:setHeight(20);
    obj.imageCheckBox222:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox222:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox222:setField("magicCheck_1111");
    obj.imageCheckBox222:setName("imageCheckBox222");

    obj.imageCheckBox223 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox223:setParent(obj.layout60);
    obj.imageCheckBox223:setLeft(40);
    obj.imageCheckBox223:setTop(0);
    obj.imageCheckBox223:setWidth(20);
    obj.imageCheckBox223:setHeight(20);
    obj.imageCheckBox223:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox223:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox223:setField("magicCheck_1121");
    obj.imageCheckBox223:setName("imageCheckBox223");

    obj.imageCheckBox224 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox224:setParent(obj.layout60);
    obj.imageCheckBox224:setLeft(60);
    obj.imageCheckBox224:setTop(0);
    obj.imageCheckBox224:setWidth(20);
    obj.imageCheckBox224:setHeight(20);
    obj.imageCheckBox224:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox224:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox224:setField("magicCheck_1131");
    obj.imageCheckBox224:setName("imageCheckBox224");

    obj.imageCheckBox225 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox225:setParent(obj.layout60);
    obj.imageCheckBox225:setLeft(80);
    obj.imageCheckBox225:setTop(0);
    obj.imageCheckBox225:setWidth(20);
    obj.imageCheckBox225:setHeight(20);
    obj.imageCheckBox225:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox225:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox225:setField("magicCheck_1141");
    obj.imageCheckBox225:setName("imageCheckBox225");

    obj.imageCheckBox226 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox226:setParent(obj.layout60);
    obj.imageCheckBox226:setLeft(100);
    obj.imageCheckBox226:setTop(0);
    obj.imageCheckBox226:setWidth(20);
    obj.imageCheckBox226:setHeight(20);
    obj.imageCheckBox226:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox226:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox226:setField("magicCheck_1151");
    obj.imageCheckBox226:setName("imageCheckBox226");

    obj.imageCheckBox227 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox227:setParent(obj.layout60);
    obj.imageCheckBox227:setLeft(120);
    obj.imageCheckBox227:setTop(0);
    obj.imageCheckBox227:setWidth(20);
    obj.imageCheckBox227:setHeight(20);
    obj.imageCheckBox227:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox227:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox227:setField("magicCheck_1161");
    obj.imageCheckBox227:setName("imageCheckBox227");

    obj.imageCheckBox228 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox228:setParent(obj.layout60);
    obj.imageCheckBox228:setLeft(140);
    obj.imageCheckBox228:setTop(0);
    obj.imageCheckBox228:setWidth(20);
    obj.imageCheckBox228:setHeight(20);
    obj.imageCheckBox228:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox228:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox228:setField("magicCheck_1171");
    obj.imageCheckBox228:setName("imageCheckBox228");

    obj.imageCheckBox229 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox229:setParent(obj.layout60);
    obj.imageCheckBox229:setLeft(160);
    obj.imageCheckBox229:setTop(0);
    obj.imageCheckBox229:setWidth(20);
    obj.imageCheckBox229:setHeight(20);
    obj.imageCheckBox229:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox229:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox229:setField("magicCheck_1181");
    obj.imageCheckBox229:setName("imageCheckBox229");

    obj.imageCheckBox230 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox230:setParent(obj.layout60);
    obj.imageCheckBox230:setLeft(180);
    obj.imageCheckBox230:setTop(0);
    obj.imageCheckBox230:setWidth(20);
    obj.imageCheckBox230:setHeight(20);
    obj.imageCheckBox230:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox230:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox230:setField("magicCheck_1191");
    obj.imageCheckBox230:setName("imageCheckBox230");

    obj.textEditor30 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor30:setParent(obj.layout55);
    obj.textEditor30:setLeft(36);
    obj.textEditor30:setTop(906);
    obj.textEditor30:setWidth(320);
    obj.textEditor30:setHeight(150);
    obj.textEditor30:setFontSize(14);
    obj.textEditor30:setFontColor("#000000");
    obj.textEditor30:setTransparent(true);
    obj.textEditor30:setField("magicDesc_111");
    obj.textEditor30:setName("textEditor30");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout55);
    obj.edit127:setLeft(80);
    obj.edit127:setTop(1056);
    obj.edit127:setWidth(160);
    obj.edit127:setHeight(30);
    obj.edit127:setFontSize(16);
    obj.edit127:setFontColor("#000000");
    obj.edit127:setTransparent(true);
    obj.edit127:setField("magicName_121");
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout55);
    obj.edit128:setLeft(302);
    obj.edit128:setTop(1056);
    obj.edit128:setWidth(90);
    obj.edit128:setHeight(30);
    obj.edit128:setFontSize(16);
    obj.edit128:setFontColor("#000000");
    obj.edit128:setTransparent(true);
    obj.edit128:setField("magicTrad_121");
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout55);
    obj.edit129:setLeft(406);
    obj.edit129:setTop(1086);
    obj.edit129:setWidth(90);
    obj.edit129:setHeight(30);
    obj.edit129:setFontSize(16);
    obj.edit129:setFontColor("#000000");
    obj.edit129:setTransparent(true);
    obj.edit129:setField("magicLevel_121");
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout55);
    obj.edit130:setLeft(370);
    obj.edit130:setTop(1118);
    obj.edit130:setWidth(90);
    obj.edit130:setHeight(30);
    obj.edit130:setFontSize(16);
    obj.edit130:setFontColor("#000000");
    obj.edit130:setTransparent(true);
    obj.edit130:setField("magicConj_121");
    obj.edit130:setName("edit130");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout55);
    obj.layout61:setLeft(73);
    obj.layout61:setTop(1086);
    obj.layout61:setWidth(200);
    obj.layout61:setHeight(20);
    obj.layout61:setName("layout61");

    obj.imageCheckBox231 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox231:setParent(obj.layout61);
    obj.imageCheckBox231:setLeft(0);
    obj.imageCheckBox231:setTop(0);
    obj.imageCheckBox231:setWidth(20);
    obj.imageCheckBox231:setHeight(20);
    obj.imageCheckBox231:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox231:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox231:setField("magicCheck_1201");
    obj.imageCheckBox231:setName("imageCheckBox231");

    obj.imageCheckBox232 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox232:setParent(obj.layout61);
    obj.imageCheckBox232:setLeft(20);
    obj.imageCheckBox232:setTop(0);
    obj.imageCheckBox232:setWidth(20);
    obj.imageCheckBox232:setHeight(20);
    obj.imageCheckBox232:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox232:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox232:setField("magicCheck_1211");
    obj.imageCheckBox232:setName("imageCheckBox232");

    obj.imageCheckBox233 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox233:setParent(obj.layout61);
    obj.imageCheckBox233:setLeft(40);
    obj.imageCheckBox233:setTop(0);
    obj.imageCheckBox233:setWidth(20);
    obj.imageCheckBox233:setHeight(20);
    obj.imageCheckBox233:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox233:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox233:setField("magicCheck_1221");
    obj.imageCheckBox233:setName("imageCheckBox233");

    obj.imageCheckBox234 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox234:setParent(obj.layout61);
    obj.imageCheckBox234:setLeft(60);
    obj.imageCheckBox234:setTop(0);
    obj.imageCheckBox234:setWidth(20);
    obj.imageCheckBox234:setHeight(20);
    obj.imageCheckBox234:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox234:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox234:setField("magicCheck_1231");
    obj.imageCheckBox234:setName("imageCheckBox234");

    obj.imageCheckBox235 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox235:setParent(obj.layout61);
    obj.imageCheckBox235:setLeft(80);
    obj.imageCheckBox235:setTop(0);
    obj.imageCheckBox235:setWidth(20);
    obj.imageCheckBox235:setHeight(20);
    obj.imageCheckBox235:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox235:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox235:setField("magicCheck_1241");
    obj.imageCheckBox235:setName("imageCheckBox235");

    obj.imageCheckBox236 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox236:setParent(obj.layout61);
    obj.imageCheckBox236:setLeft(100);
    obj.imageCheckBox236:setTop(0);
    obj.imageCheckBox236:setWidth(20);
    obj.imageCheckBox236:setHeight(20);
    obj.imageCheckBox236:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox236:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox236:setField("magicCheck_1251");
    obj.imageCheckBox236:setName("imageCheckBox236");

    obj.imageCheckBox237 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox237:setParent(obj.layout61);
    obj.imageCheckBox237:setLeft(120);
    obj.imageCheckBox237:setTop(0);
    obj.imageCheckBox237:setWidth(20);
    obj.imageCheckBox237:setHeight(20);
    obj.imageCheckBox237:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox237:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox237:setField("magicCheck_1261");
    obj.imageCheckBox237:setName("imageCheckBox237");

    obj.imageCheckBox238 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox238:setParent(obj.layout61);
    obj.imageCheckBox238:setLeft(140);
    obj.imageCheckBox238:setTop(0);
    obj.imageCheckBox238:setWidth(20);
    obj.imageCheckBox238:setHeight(20);
    obj.imageCheckBox238:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox238:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox238:setField("magicCheck_1271");
    obj.imageCheckBox238:setName("imageCheckBox238");

    obj.imageCheckBox239 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox239:setParent(obj.layout61);
    obj.imageCheckBox239:setLeft(160);
    obj.imageCheckBox239:setTop(0);
    obj.imageCheckBox239:setWidth(20);
    obj.imageCheckBox239:setHeight(20);
    obj.imageCheckBox239:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox239:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox239:setField("magicCheck_1281");
    obj.imageCheckBox239:setName("imageCheckBox239");

    obj.imageCheckBox240 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox240:setParent(obj.layout61);
    obj.imageCheckBox240:setLeft(180);
    obj.imageCheckBox240:setTop(0);
    obj.imageCheckBox240:setWidth(20);
    obj.imageCheckBox240:setHeight(20);
    obj.imageCheckBox240:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox240:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox240:setField("magicCheck_1291");
    obj.imageCheckBox240:setName("imageCheckBox240");

    obj.textEditor31 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor31:setParent(obj.layout55);
    obj.textEditor31:setLeft(36);
    obj.textEditor31:setTop(1106);
    obj.textEditor31:setWidth(320);
    obj.textEditor31:setHeight(150);
    obj.textEditor31:setFontSize(14);
    obj.textEditor31:setFontColor("#000000");
    obj.textEditor31:setTransparent(true);
    obj.textEditor31:setField("magicDesc_121");
    obj.textEditor31:setName("textEditor31");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Página 4");
    obj.tab4:setName("tab4");

    obj.frmSODLFillable4_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSODLFillable4_svg:setParent(obj.tab4);
    obj.frmSODLFillable4_svg:setName("frmSODLFillable4_svg");
    obj.frmSODLFillable4_svg:setAlign("client");
    obj.frmSODLFillable4_svg:setTheme("light");
    obj.frmSODLFillable4_svg:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmSODLFillable4_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox4);
    obj.rectangle4:setWidth(893);
    obj.rectangle4:setHeight(1263);
    obj.rectangle4:setColor("white");
    obj.rectangle4:setName("rectangle4");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle4);
    obj.image4:setLeft(0);
    obj.image4:setTop(0);
    obj.image4:setWidth(893);
    obj.image4:setHeight(1263);
    obj.image4:setSRC("/SODLFillable/images/2.png");
    obj.image4:setStyle("stretch");
    obj.image4:setOptimize(true);
    obj.image4:setName("image4");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle4);
    obj.layout62:setLeft(0);
    obj.layout62:setTop(0);
    obj.layout62:setWidth(447);
    obj.layout62:setHeight(1263);
    obj.layout62:setName("layout62");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout62);
    obj.edit131:setLeft(80);
    obj.edit131:setTop(36);
    obj.edit131:setWidth(160);
    obj.edit131:setHeight(30);
    obj.edit131:setFontSize(16);
    obj.edit131:setFontColor("#000000");
    obj.edit131:setTransparent(true);
    obj.edit131:setField("magicName_20");
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout62);
    obj.edit132:setLeft(302);
    obj.edit132:setTop(36);
    obj.edit132:setWidth(90);
    obj.edit132:setHeight(30);
    obj.edit132:setFontSize(16);
    obj.edit132:setFontColor("#000000");
    obj.edit132:setTransparent(true);
    obj.edit132:setField("magicTrad_20");
    obj.edit132:setName("edit132");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout62);
    obj.edit133:setLeft(406);
    obj.edit133:setTop(66);
    obj.edit133:setWidth(90);
    obj.edit133:setHeight(30);
    obj.edit133:setFontSize(16);
    obj.edit133:setFontColor("#000000");
    obj.edit133:setTransparent(true);
    obj.edit133:setField("magicLevel_20");
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout62);
    obj.edit134:setLeft(370);
    obj.edit134:setTop(98);
    obj.edit134:setWidth(90);
    obj.edit134:setHeight(30);
    obj.edit134:setFontSize(16);
    obj.edit134:setFontColor("#000000");
    obj.edit134:setTransparent(true);
    obj.edit134:setField("magicConj_20");
    obj.edit134:setName("edit134");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setLeft(73);
    obj.layout63:setTop(66);
    obj.layout63:setWidth(200);
    obj.layout63:setHeight(20);
    obj.layout63:setName("layout63");

    obj.imageCheckBox241 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox241:setParent(obj.layout63);
    obj.imageCheckBox241:setLeft(0);
    obj.imageCheckBox241:setTop(0);
    obj.imageCheckBox241:setWidth(20);
    obj.imageCheckBox241:setHeight(20);
    obj.imageCheckBox241:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox241:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox241:setField("magicCheck_200");
    obj.imageCheckBox241:setName("imageCheckBox241");

    obj.imageCheckBox242 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox242:setParent(obj.layout63);
    obj.imageCheckBox242:setLeft(20);
    obj.imageCheckBox242:setTop(0);
    obj.imageCheckBox242:setWidth(20);
    obj.imageCheckBox242:setHeight(20);
    obj.imageCheckBox242:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox242:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox242:setField("magicCheck_201");
    obj.imageCheckBox242:setName("imageCheckBox242");

    obj.imageCheckBox243 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox243:setParent(obj.layout63);
    obj.imageCheckBox243:setLeft(40);
    obj.imageCheckBox243:setTop(0);
    obj.imageCheckBox243:setWidth(20);
    obj.imageCheckBox243:setHeight(20);
    obj.imageCheckBox243:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox243:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox243:setField("magicCheck_202");
    obj.imageCheckBox243:setName("imageCheckBox243");

    obj.imageCheckBox244 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox244:setParent(obj.layout63);
    obj.imageCheckBox244:setLeft(60);
    obj.imageCheckBox244:setTop(0);
    obj.imageCheckBox244:setWidth(20);
    obj.imageCheckBox244:setHeight(20);
    obj.imageCheckBox244:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox244:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox244:setField("magicCheck_203");
    obj.imageCheckBox244:setName("imageCheckBox244");

    obj.imageCheckBox245 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox245:setParent(obj.layout63);
    obj.imageCheckBox245:setLeft(80);
    obj.imageCheckBox245:setTop(0);
    obj.imageCheckBox245:setWidth(20);
    obj.imageCheckBox245:setHeight(20);
    obj.imageCheckBox245:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox245:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox245:setField("magicCheck_204");
    obj.imageCheckBox245:setName("imageCheckBox245");

    obj.imageCheckBox246 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox246:setParent(obj.layout63);
    obj.imageCheckBox246:setLeft(100);
    obj.imageCheckBox246:setTop(0);
    obj.imageCheckBox246:setWidth(20);
    obj.imageCheckBox246:setHeight(20);
    obj.imageCheckBox246:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox246:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox246:setField("magicCheck_205");
    obj.imageCheckBox246:setName("imageCheckBox246");

    obj.imageCheckBox247 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox247:setParent(obj.layout63);
    obj.imageCheckBox247:setLeft(120);
    obj.imageCheckBox247:setTop(0);
    obj.imageCheckBox247:setWidth(20);
    obj.imageCheckBox247:setHeight(20);
    obj.imageCheckBox247:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox247:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox247:setField("magicCheck_206");
    obj.imageCheckBox247:setName("imageCheckBox247");

    obj.imageCheckBox248 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox248:setParent(obj.layout63);
    obj.imageCheckBox248:setLeft(140);
    obj.imageCheckBox248:setTop(0);
    obj.imageCheckBox248:setWidth(20);
    obj.imageCheckBox248:setHeight(20);
    obj.imageCheckBox248:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox248:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox248:setField("magicCheck_207");
    obj.imageCheckBox248:setName("imageCheckBox248");

    obj.imageCheckBox249 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox249:setParent(obj.layout63);
    obj.imageCheckBox249:setLeft(160);
    obj.imageCheckBox249:setTop(0);
    obj.imageCheckBox249:setWidth(20);
    obj.imageCheckBox249:setHeight(20);
    obj.imageCheckBox249:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox249:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox249:setField("magicCheck_208");
    obj.imageCheckBox249:setName("imageCheckBox249");

    obj.imageCheckBox250 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox250:setParent(obj.layout63);
    obj.imageCheckBox250:setLeft(180);
    obj.imageCheckBox250:setTop(0);
    obj.imageCheckBox250:setWidth(20);
    obj.imageCheckBox250:setHeight(20);
    obj.imageCheckBox250:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox250:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox250:setField("magicCheck_209");
    obj.imageCheckBox250:setName("imageCheckBox250");

    obj.textEditor32 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor32:setParent(obj.layout62);
    obj.textEditor32:setLeft(36);
    obj.textEditor32:setTop(86);
    obj.textEditor32:setWidth(320);
    obj.textEditor32:setHeight(150);
    obj.textEditor32:setFontSize(14);
    obj.textEditor32:setFontColor("#000000");
    obj.textEditor32:setTransparent(true);
    obj.textEditor32:setField("magicDesc_20");
    obj.textEditor32:setName("textEditor32");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout62);
    obj.edit135:setLeft(80);
    obj.edit135:setTop(242);
    obj.edit135:setWidth(160);
    obj.edit135:setHeight(30);
    obj.edit135:setFontSize(16);
    obj.edit135:setFontColor("#000000");
    obj.edit135:setTransparent(true);
    obj.edit135:setField("magicName_21");
    obj.edit135:setName("edit135");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout62);
    obj.edit136:setLeft(302);
    obj.edit136:setTop(242);
    obj.edit136:setWidth(90);
    obj.edit136:setHeight(30);
    obj.edit136:setFontSize(16);
    obj.edit136:setFontColor("#000000");
    obj.edit136:setTransparent(true);
    obj.edit136:setField("magicTrad_21");
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout62);
    obj.edit137:setLeft(406);
    obj.edit137:setTop(272);
    obj.edit137:setWidth(90);
    obj.edit137:setHeight(30);
    obj.edit137:setFontSize(16);
    obj.edit137:setFontColor("#000000");
    obj.edit137:setTransparent(true);
    obj.edit137:setField("magicLevel_21");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout62);
    obj.edit138:setLeft(370);
    obj.edit138:setTop(304);
    obj.edit138:setWidth(90);
    obj.edit138:setHeight(30);
    obj.edit138:setFontSize(16);
    obj.edit138:setFontColor("#000000");
    obj.edit138:setTransparent(true);
    obj.edit138:setField("magicConj_21");
    obj.edit138:setName("edit138");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout62);
    obj.layout64:setLeft(73);
    obj.layout64:setTop(272);
    obj.layout64:setWidth(200);
    obj.layout64:setHeight(20);
    obj.layout64:setName("layout64");

    obj.imageCheckBox251 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox251:setParent(obj.layout64);
    obj.imageCheckBox251:setLeft(0);
    obj.imageCheckBox251:setTop(0);
    obj.imageCheckBox251:setWidth(20);
    obj.imageCheckBox251:setHeight(20);
    obj.imageCheckBox251:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox251:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox251:setField("magicCheck_210");
    obj.imageCheckBox251:setName("imageCheckBox251");

    obj.imageCheckBox252 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox252:setParent(obj.layout64);
    obj.imageCheckBox252:setLeft(20);
    obj.imageCheckBox252:setTop(0);
    obj.imageCheckBox252:setWidth(20);
    obj.imageCheckBox252:setHeight(20);
    obj.imageCheckBox252:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox252:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox252:setField("magicCheck_211");
    obj.imageCheckBox252:setName("imageCheckBox252");

    obj.imageCheckBox253 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox253:setParent(obj.layout64);
    obj.imageCheckBox253:setLeft(40);
    obj.imageCheckBox253:setTop(0);
    obj.imageCheckBox253:setWidth(20);
    obj.imageCheckBox253:setHeight(20);
    obj.imageCheckBox253:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox253:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox253:setField("magicCheck_212");
    obj.imageCheckBox253:setName("imageCheckBox253");

    obj.imageCheckBox254 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox254:setParent(obj.layout64);
    obj.imageCheckBox254:setLeft(60);
    obj.imageCheckBox254:setTop(0);
    obj.imageCheckBox254:setWidth(20);
    obj.imageCheckBox254:setHeight(20);
    obj.imageCheckBox254:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox254:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox254:setField("magicCheck_213");
    obj.imageCheckBox254:setName("imageCheckBox254");

    obj.imageCheckBox255 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox255:setParent(obj.layout64);
    obj.imageCheckBox255:setLeft(80);
    obj.imageCheckBox255:setTop(0);
    obj.imageCheckBox255:setWidth(20);
    obj.imageCheckBox255:setHeight(20);
    obj.imageCheckBox255:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox255:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox255:setField("magicCheck_214");
    obj.imageCheckBox255:setName("imageCheckBox255");

    obj.imageCheckBox256 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox256:setParent(obj.layout64);
    obj.imageCheckBox256:setLeft(100);
    obj.imageCheckBox256:setTop(0);
    obj.imageCheckBox256:setWidth(20);
    obj.imageCheckBox256:setHeight(20);
    obj.imageCheckBox256:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox256:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox256:setField("magicCheck_215");
    obj.imageCheckBox256:setName("imageCheckBox256");

    obj.imageCheckBox257 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox257:setParent(obj.layout64);
    obj.imageCheckBox257:setLeft(120);
    obj.imageCheckBox257:setTop(0);
    obj.imageCheckBox257:setWidth(20);
    obj.imageCheckBox257:setHeight(20);
    obj.imageCheckBox257:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox257:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox257:setField("magicCheck_216");
    obj.imageCheckBox257:setName("imageCheckBox257");

    obj.imageCheckBox258 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox258:setParent(obj.layout64);
    obj.imageCheckBox258:setLeft(140);
    obj.imageCheckBox258:setTop(0);
    obj.imageCheckBox258:setWidth(20);
    obj.imageCheckBox258:setHeight(20);
    obj.imageCheckBox258:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox258:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox258:setField("magicCheck_217");
    obj.imageCheckBox258:setName("imageCheckBox258");

    obj.imageCheckBox259 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox259:setParent(obj.layout64);
    obj.imageCheckBox259:setLeft(160);
    obj.imageCheckBox259:setTop(0);
    obj.imageCheckBox259:setWidth(20);
    obj.imageCheckBox259:setHeight(20);
    obj.imageCheckBox259:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox259:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox259:setField("magicCheck_218");
    obj.imageCheckBox259:setName("imageCheckBox259");

    obj.imageCheckBox260 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox260:setParent(obj.layout64);
    obj.imageCheckBox260:setLeft(180);
    obj.imageCheckBox260:setTop(0);
    obj.imageCheckBox260:setWidth(20);
    obj.imageCheckBox260:setHeight(20);
    obj.imageCheckBox260:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox260:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox260:setField("magicCheck_219");
    obj.imageCheckBox260:setName("imageCheckBox260");

    obj.textEditor33 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor33:setParent(obj.layout62);
    obj.textEditor33:setLeft(36);
    obj.textEditor33:setTop(292);
    obj.textEditor33:setWidth(320);
    obj.textEditor33:setHeight(150);
    obj.textEditor33:setFontSize(14);
    obj.textEditor33:setFontColor("#000000");
    obj.textEditor33:setTransparent(true);
    obj.textEditor33:setField("magicDesc_21");
    obj.textEditor33:setName("textEditor33");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout62);
    obj.edit139:setLeft(80);
    obj.edit139:setTop(448);
    obj.edit139:setWidth(160);
    obj.edit139:setHeight(30);
    obj.edit139:setFontSize(16);
    obj.edit139:setFontColor("#000000");
    obj.edit139:setTransparent(true);
    obj.edit139:setField("magicName_22");
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout62);
    obj.edit140:setLeft(302);
    obj.edit140:setTop(448);
    obj.edit140:setWidth(90);
    obj.edit140:setHeight(30);
    obj.edit140:setFontSize(16);
    obj.edit140:setFontColor("#000000");
    obj.edit140:setTransparent(true);
    obj.edit140:setField("magicTrad_22");
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout62);
    obj.edit141:setLeft(406);
    obj.edit141:setTop(478);
    obj.edit141:setWidth(90);
    obj.edit141:setHeight(30);
    obj.edit141:setFontSize(16);
    obj.edit141:setFontColor("#000000");
    obj.edit141:setTransparent(true);
    obj.edit141:setField("magicLevel_22");
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout62);
    obj.edit142:setLeft(370);
    obj.edit142:setTop(510);
    obj.edit142:setWidth(90);
    obj.edit142:setHeight(30);
    obj.edit142:setFontSize(16);
    obj.edit142:setFontColor("#000000");
    obj.edit142:setTransparent(true);
    obj.edit142:setField("magicConj_22");
    obj.edit142:setName("edit142");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout62);
    obj.layout65:setLeft(73);
    obj.layout65:setTop(478);
    obj.layout65:setWidth(200);
    obj.layout65:setHeight(20);
    obj.layout65:setName("layout65");

    obj.imageCheckBox261 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox261:setParent(obj.layout65);
    obj.imageCheckBox261:setLeft(0);
    obj.imageCheckBox261:setTop(0);
    obj.imageCheckBox261:setWidth(20);
    obj.imageCheckBox261:setHeight(20);
    obj.imageCheckBox261:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox261:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox261:setField("magicCheck_220");
    obj.imageCheckBox261:setName("imageCheckBox261");

    obj.imageCheckBox262 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox262:setParent(obj.layout65);
    obj.imageCheckBox262:setLeft(20);
    obj.imageCheckBox262:setTop(0);
    obj.imageCheckBox262:setWidth(20);
    obj.imageCheckBox262:setHeight(20);
    obj.imageCheckBox262:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox262:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox262:setField("magicCheck_221");
    obj.imageCheckBox262:setName("imageCheckBox262");

    obj.imageCheckBox263 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox263:setParent(obj.layout65);
    obj.imageCheckBox263:setLeft(40);
    obj.imageCheckBox263:setTop(0);
    obj.imageCheckBox263:setWidth(20);
    obj.imageCheckBox263:setHeight(20);
    obj.imageCheckBox263:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox263:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox263:setField("magicCheck_222");
    obj.imageCheckBox263:setName("imageCheckBox263");

    obj.imageCheckBox264 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox264:setParent(obj.layout65);
    obj.imageCheckBox264:setLeft(60);
    obj.imageCheckBox264:setTop(0);
    obj.imageCheckBox264:setWidth(20);
    obj.imageCheckBox264:setHeight(20);
    obj.imageCheckBox264:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox264:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox264:setField("magicCheck_223");
    obj.imageCheckBox264:setName("imageCheckBox264");

    obj.imageCheckBox265 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox265:setParent(obj.layout65);
    obj.imageCheckBox265:setLeft(80);
    obj.imageCheckBox265:setTop(0);
    obj.imageCheckBox265:setWidth(20);
    obj.imageCheckBox265:setHeight(20);
    obj.imageCheckBox265:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox265:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox265:setField("magicCheck_224");
    obj.imageCheckBox265:setName("imageCheckBox265");

    obj.imageCheckBox266 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox266:setParent(obj.layout65);
    obj.imageCheckBox266:setLeft(100);
    obj.imageCheckBox266:setTop(0);
    obj.imageCheckBox266:setWidth(20);
    obj.imageCheckBox266:setHeight(20);
    obj.imageCheckBox266:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox266:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox266:setField("magicCheck_225");
    obj.imageCheckBox266:setName("imageCheckBox266");

    obj.imageCheckBox267 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox267:setParent(obj.layout65);
    obj.imageCheckBox267:setLeft(120);
    obj.imageCheckBox267:setTop(0);
    obj.imageCheckBox267:setWidth(20);
    obj.imageCheckBox267:setHeight(20);
    obj.imageCheckBox267:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox267:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox267:setField("magicCheck_226");
    obj.imageCheckBox267:setName("imageCheckBox267");

    obj.imageCheckBox268 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox268:setParent(obj.layout65);
    obj.imageCheckBox268:setLeft(140);
    obj.imageCheckBox268:setTop(0);
    obj.imageCheckBox268:setWidth(20);
    obj.imageCheckBox268:setHeight(20);
    obj.imageCheckBox268:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox268:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox268:setField("magicCheck_227");
    obj.imageCheckBox268:setName("imageCheckBox268");

    obj.imageCheckBox269 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox269:setParent(obj.layout65);
    obj.imageCheckBox269:setLeft(160);
    obj.imageCheckBox269:setTop(0);
    obj.imageCheckBox269:setWidth(20);
    obj.imageCheckBox269:setHeight(20);
    obj.imageCheckBox269:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox269:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox269:setField("magicCheck_228");
    obj.imageCheckBox269:setName("imageCheckBox269");

    obj.imageCheckBox270 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox270:setParent(obj.layout65);
    obj.imageCheckBox270:setLeft(180);
    obj.imageCheckBox270:setTop(0);
    obj.imageCheckBox270:setWidth(20);
    obj.imageCheckBox270:setHeight(20);
    obj.imageCheckBox270:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox270:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox270:setField("magicCheck_229");
    obj.imageCheckBox270:setName("imageCheckBox270");

    obj.textEditor34 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor34:setParent(obj.layout62);
    obj.textEditor34:setLeft(36);
    obj.textEditor34:setTop(498);
    obj.textEditor34:setWidth(320);
    obj.textEditor34:setHeight(150);
    obj.textEditor34:setFontSize(14);
    obj.textEditor34:setFontColor("#000000");
    obj.textEditor34:setTransparent(true);
    obj.textEditor34:setField("magicDesc_22");
    obj.textEditor34:setName("textEditor34");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout62);
    obj.edit143:setLeft(80);
    obj.edit143:setTop(670);
    obj.edit143:setWidth(160);
    obj.edit143:setHeight(30);
    obj.edit143:setFontSize(16);
    obj.edit143:setFontColor("#000000");
    obj.edit143:setTransparent(true);
    obj.edit143:setField("magicName_24");
    obj.edit143:setName("edit143");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout62);
    obj.edit144:setLeft(302);
    obj.edit144:setTop(670);
    obj.edit144:setWidth(90);
    obj.edit144:setHeight(30);
    obj.edit144:setFontSize(16);
    obj.edit144:setFontColor("#000000");
    obj.edit144:setTransparent(true);
    obj.edit144:setField("magicTrad_24");
    obj.edit144:setName("edit144");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout62);
    obj.edit145:setLeft(406);
    obj.edit145:setTop(700);
    obj.edit145:setWidth(90);
    obj.edit145:setHeight(30);
    obj.edit145:setFontSize(16);
    obj.edit145:setFontColor("#000000");
    obj.edit145:setTransparent(true);
    obj.edit145:setField("magicLevel_24");
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout62);
    obj.edit146:setLeft(370);
    obj.edit146:setTop(732);
    obj.edit146:setWidth(90);
    obj.edit146:setHeight(30);
    obj.edit146:setFontSize(16);
    obj.edit146:setFontColor("#000000");
    obj.edit146:setTransparent(true);
    obj.edit146:setField("magicConj_24");
    obj.edit146:setName("edit146");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout62);
    obj.layout66:setLeft(73);
    obj.layout66:setTop(700);
    obj.layout66:setWidth(200);
    obj.layout66:setHeight(20);
    obj.layout66:setName("layout66");

    obj.imageCheckBox271 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox271:setParent(obj.layout66);
    obj.imageCheckBox271:setLeft(0);
    obj.imageCheckBox271:setTop(0);
    obj.imageCheckBox271:setWidth(20);
    obj.imageCheckBox271:setHeight(20);
    obj.imageCheckBox271:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox271:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox271:setField("magicCheck_230");
    obj.imageCheckBox271:setName("imageCheckBox271");

    obj.imageCheckBox272 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox272:setParent(obj.layout66);
    obj.imageCheckBox272:setLeft(20);
    obj.imageCheckBox272:setTop(0);
    obj.imageCheckBox272:setWidth(20);
    obj.imageCheckBox272:setHeight(20);
    obj.imageCheckBox272:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox272:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox272:setField("magicCheck_231");
    obj.imageCheckBox272:setName("imageCheckBox272");

    obj.imageCheckBox273 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox273:setParent(obj.layout66);
    obj.imageCheckBox273:setLeft(40);
    obj.imageCheckBox273:setTop(0);
    obj.imageCheckBox273:setWidth(20);
    obj.imageCheckBox273:setHeight(20);
    obj.imageCheckBox273:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox273:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox273:setField("magicCheck_232");
    obj.imageCheckBox273:setName("imageCheckBox273");

    obj.imageCheckBox274 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox274:setParent(obj.layout66);
    obj.imageCheckBox274:setLeft(60);
    obj.imageCheckBox274:setTop(0);
    obj.imageCheckBox274:setWidth(20);
    obj.imageCheckBox274:setHeight(20);
    obj.imageCheckBox274:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox274:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox274:setField("magicCheck_233");
    obj.imageCheckBox274:setName("imageCheckBox274");

    obj.imageCheckBox275 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox275:setParent(obj.layout66);
    obj.imageCheckBox275:setLeft(80);
    obj.imageCheckBox275:setTop(0);
    obj.imageCheckBox275:setWidth(20);
    obj.imageCheckBox275:setHeight(20);
    obj.imageCheckBox275:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox275:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox275:setField("magicCheck_234");
    obj.imageCheckBox275:setName("imageCheckBox275");

    obj.imageCheckBox276 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox276:setParent(obj.layout66);
    obj.imageCheckBox276:setLeft(100);
    obj.imageCheckBox276:setTop(0);
    obj.imageCheckBox276:setWidth(20);
    obj.imageCheckBox276:setHeight(20);
    obj.imageCheckBox276:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox276:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox276:setField("magicCheck_235");
    obj.imageCheckBox276:setName("imageCheckBox276");

    obj.imageCheckBox277 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox277:setParent(obj.layout66);
    obj.imageCheckBox277:setLeft(120);
    obj.imageCheckBox277:setTop(0);
    obj.imageCheckBox277:setWidth(20);
    obj.imageCheckBox277:setHeight(20);
    obj.imageCheckBox277:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox277:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox277:setField("magicCheck_236");
    obj.imageCheckBox277:setName("imageCheckBox277");

    obj.imageCheckBox278 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox278:setParent(obj.layout66);
    obj.imageCheckBox278:setLeft(140);
    obj.imageCheckBox278:setTop(0);
    obj.imageCheckBox278:setWidth(20);
    obj.imageCheckBox278:setHeight(20);
    obj.imageCheckBox278:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox278:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox278:setField("magicCheck_237");
    obj.imageCheckBox278:setName("imageCheckBox278");

    obj.imageCheckBox279 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox279:setParent(obj.layout66);
    obj.imageCheckBox279:setLeft(160);
    obj.imageCheckBox279:setTop(0);
    obj.imageCheckBox279:setWidth(20);
    obj.imageCheckBox279:setHeight(20);
    obj.imageCheckBox279:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox279:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox279:setField("magicCheck_238");
    obj.imageCheckBox279:setName("imageCheckBox279");

    obj.imageCheckBox280 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox280:setParent(obj.layout66);
    obj.imageCheckBox280:setLeft(180);
    obj.imageCheckBox280:setTop(0);
    obj.imageCheckBox280:setWidth(20);
    obj.imageCheckBox280:setHeight(20);
    obj.imageCheckBox280:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox280:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox280:setField("magicCheck_239");
    obj.imageCheckBox280:setName("imageCheckBox280");

    obj.textEditor35 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor35:setParent(obj.layout62);
    obj.textEditor35:setLeft(36);
    obj.textEditor35:setTop(720);
    obj.textEditor35:setWidth(320);
    obj.textEditor35:setHeight(150);
    obj.textEditor35:setFontSize(14);
    obj.textEditor35:setFontColor("#000000");
    obj.textEditor35:setTransparent(true);
    obj.textEditor35:setField("magicDesc_24");
    obj.textEditor35:setName("textEditor35");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout62);
    obj.edit147:setLeft(80);
    obj.edit147:setTop(856);
    obj.edit147:setWidth(160);
    obj.edit147:setHeight(30);
    obj.edit147:setFontSize(16);
    obj.edit147:setFontColor("#000000");
    obj.edit147:setTransparent(true);
    obj.edit147:setField("magicName_25");
    obj.edit147:setName("edit147");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout62);
    obj.edit148:setLeft(302);
    obj.edit148:setTop(856);
    obj.edit148:setWidth(90);
    obj.edit148:setHeight(30);
    obj.edit148:setFontSize(16);
    obj.edit148:setFontColor("#000000");
    obj.edit148:setTransparent(true);
    obj.edit148:setField("magicTrad_25");
    obj.edit148:setName("edit148");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout62);
    obj.edit149:setLeft(406);
    obj.edit149:setTop(886);
    obj.edit149:setWidth(90);
    obj.edit149:setHeight(30);
    obj.edit149:setFontSize(16);
    obj.edit149:setFontColor("#000000");
    obj.edit149:setTransparent(true);
    obj.edit149:setField("magicLevel_25");
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout62);
    obj.edit150:setLeft(370);
    obj.edit150:setTop(918);
    obj.edit150:setWidth(90);
    obj.edit150:setHeight(30);
    obj.edit150:setFontSize(16);
    obj.edit150:setFontColor("#000000");
    obj.edit150:setTransparent(true);
    obj.edit150:setField("magicConj_25");
    obj.edit150:setName("edit150");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout62);
    obj.layout67:setLeft(73);
    obj.layout67:setTop(886);
    obj.layout67:setWidth(200);
    obj.layout67:setHeight(20);
    obj.layout67:setName("layout67");

    obj.imageCheckBox281 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox281:setParent(obj.layout67);
    obj.imageCheckBox281:setLeft(0);
    obj.imageCheckBox281:setTop(0);
    obj.imageCheckBox281:setWidth(20);
    obj.imageCheckBox281:setHeight(20);
    obj.imageCheckBox281:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox281:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox281:setField("magicCheck_240");
    obj.imageCheckBox281:setName("imageCheckBox281");

    obj.imageCheckBox282 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox282:setParent(obj.layout67);
    obj.imageCheckBox282:setLeft(20);
    obj.imageCheckBox282:setTop(0);
    obj.imageCheckBox282:setWidth(20);
    obj.imageCheckBox282:setHeight(20);
    obj.imageCheckBox282:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox282:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox282:setField("magicCheck_241");
    obj.imageCheckBox282:setName("imageCheckBox282");

    obj.imageCheckBox283 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox283:setParent(obj.layout67);
    obj.imageCheckBox283:setLeft(40);
    obj.imageCheckBox283:setTop(0);
    obj.imageCheckBox283:setWidth(20);
    obj.imageCheckBox283:setHeight(20);
    obj.imageCheckBox283:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox283:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox283:setField("magicCheck_242");
    obj.imageCheckBox283:setName("imageCheckBox283");

    obj.imageCheckBox284 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox284:setParent(obj.layout67);
    obj.imageCheckBox284:setLeft(60);
    obj.imageCheckBox284:setTop(0);
    obj.imageCheckBox284:setWidth(20);
    obj.imageCheckBox284:setHeight(20);
    obj.imageCheckBox284:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox284:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox284:setField("magicCheck_243");
    obj.imageCheckBox284:setName("imageCheckBox284");

    obj.imageCheckBox285 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox285:setParent(obj.layout67);
    obj.imageCheckBox285:setLeft(80);
    obj.imageCheckBox285:setTop(0);
    obj.imageCheckBox285:setWidth(20);
    obj.imageCheckBox285:setHeight(20);
    obj.imageCheckBox285:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox285:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox285:setField("magicCheck_244");
    obj.imageCheckBox285:setName("imageCheckBox285");

    obj.imageCheckBox286 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox286:setParent(obj.layout67);
    obj.imageCheckBox286:setLeft(100);
    obj.imageCheckBox286:setTop(0);
    obj.imageCheckBox286:setWidth(20);
    obj.imageCheckBox286:setHeight(20);
    obj.imageCheckBox286:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox286:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox286:setField("magicCheck_245");
    obj.imageCheckBox286:setName("imageCheckBox286");

    obj.imageCheckBox287 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox287:setParent(obj.layout67);
    obj.imageCheckBox287:setLeft(120);
    obj.imageCheckBox287:setTop(0);
    obj.imageCheckBox287:setWidth(20);
    obj.imageCheckBox287:setHeight(20);
    obj.imageCheckBox287:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox287:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox287:setField("magicCheck_246");
    obj.imageCheckBox287:setName("imageCheckBox287");

    obj.imageCheckBox288 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox288:setParent(obj.layout67);
    obj.imageCheckBox288:setLeft(140);
    obj.imageCheckBox288:setTop(0);
    obj.imageCheckBox288:setWidth(20);
    obj.imageCheckBox288:setHeight(20);
    obj.imageCheckBox288:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox288:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox288:setField("magicCheck_247");
    obj.imageCheckBox288:setName("imageCheckBox288");

    obj.imageCheckBox289 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox289:setParent(obj.layout67);
    obj.imageCheckBox289:setLeft(160);
    obj.imageCheckBox289:setTop(0);
    obj.imageCheckBox289:setWidth(20);
    obj.imageCheckBox289:setHeight(20);
    obj.imageCheckBox289:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox289:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox289:setField("magicCheck_248");
    obj.imageCheckBox289:setName("imageCheckBox289");

    obj.imageCheckBox290 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox290:setParent(obj.layout67);
    obj.imageCheckBox290:setLeft(180);
    obj.imageCheckBox290:setTop(0);
    obj.imageCheckBox290:setWidth(20);
    obj.imageCheckBox290:setHeight(20);
    obj.imageCheckBox290:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox290:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox290:setField("magicCheck_249");
    obj.imageCheckBox290:setName("imageCheckBox290");

    obj.textEditor36 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor36:setParent(obj.layout62);
    obj.textEditor36:setLeft(36);
    obj.textEditor36:setTop(906);
    obj.textEditor36:setWidth(320);
    obj.textEditor36:setHeight(150);
    obj.textEditor36:setFontSize(14);
    obj.textEditor36:setFontColor("#000000");
    obj.textEditor36:setTransparent(true);
    obj.textEditor36:setField("magicDesc_25");
    obj.textEditor36:setName("textEditor36");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout62);
    obj.edit151:setLeft(80);
    obj.edit151:setTop(1056);
    obj.edit151:setWidth(160);
    obj.edit151:setHeight(30);
    obj.edit151:setFontSize(16);
    obj.edit151:setFontColor("#000000");
    obj.edit151:setTransparent(true);
    obj.edit151:setField("magicName_6");
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout62);
    obj.edit152:setLeft(302);
    obj.edit152:setTop(1056);
    obj.edit152:setWidth(90);
    obj.edit152:setHeight(30);
    obj.edit152:setFontSize(16);
    obj.edit152:setFontColor("#000000");
    obj.edit152:setTransparent(true);
    obj.edit152:setField("magicTrad_6");
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout62);
    obj.edit153:setLeft(406);
    obj.edit153:setTop(1086);
    obj.edit153:setWidth(90);
    obj.edit153:setHeight(30);
    obj.edit153:setFontSize(16);
    obj.edit153:setFontColor("#000000");
    obj.edit153:setTransparent(true);
    obj.edit153:setField("magicLevel_6");
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout62);
    obj.edit154:setLeft(370);
    obj.edit154:setTop(1118);
    obj.edit154:setWidth(90);
    obj.edit154:setHeight(30);
    obj.edit154:setFontSize(16);
    obj.edit154:setFontColor("#000000");
    obj.edit154:setTransparent(true);
    obj.edit154:setField("magicConj_6");
    obj.edit154:setName("edit154");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout62);
    obj.layout68:setLeft(73);
    obj.layout68:setTop(1086);
    obj.layout68:setWidth(200);
    obj.layout68:setHeight(20);
    obj.layout68:setName("layout68");

    obj.imageCheckBox291 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox291:setParent(obj.layout68);
    obj.imageCheckBox291:setLeft(0);
    obj.imageCheckBox291:setTop(0);
    obj.imageCheckBox291:setWidth(20);
    obj.imageCheckBox291:setHeight(20);
    obj.imageCheckBox291:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox291:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox291:setField("magicCheck_250");
    obj.imageCheckBox291:setName("imageCheckBox291");

    obj.imageCheckBox292 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox292:setParent(obj.layout68);
    obj.imageCheckBox292:setLeft(20);
    obj.imageCheckBox292:setTop(0);
    obj.imageCheckBox292:setWidth(20);
    obj.imageCheckBox292:setHeight(20);
    obj.imageCheckBox292:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox292:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox292:setField("magicCheck_251");
    obj.imageCheckBox292:setName("imageCheckBox292");

    obj.imageCheckBox293 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox293:setParent(obj.layout68);
    obj.imageCheckBox293:setLeft(40);
    obj.imageCheckBox293:setTop(0);
    obj.imageCheckBox293:setWidth(20);
    obj.imageCheckBox293:setHeight(20);
    obj.imageCheckBox293:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox293:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox293:setField("magicCheck_252");
    obj.imageCheckBox293:setName("imageCheckBox293");

    obj.imageCheckBox294 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox294:setParent(obj.layout68);
    obj.imageCheckBox294:setLeft(60);
    obj.imageCheckBox294:setTop(0);
    obj.imageCheckBox294:setWidth(20);
    obj.imageCheckBox294:setHeight(20);
    obj.imageCheckBox294:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox294:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox294:setField("magicCheck_253");
    obj.imageCheckBox294:setName("imageCheckBox294");

    obj.imageCheckBox295 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox295:setParent(obj.layout68);
    obj.imageCheckBox295:setLeft(80);
    obj.imageCheckBox295:setTop(0);
    obj.imageCheckBox295:setWidth(20);
    obj.imageCheckBox295:setHeight(20);
    obj.imageCheckBox295:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox295:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox295:setField("magicCheck_254");
    obj.imageCheckBox295:setName("imageCheckBox295");

    obj.imageCheckBox296 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox296:setParent(obj.layout68);
    obj.imageCheckBox296:setLeft(100);
    obj.imageCheckBox296:setTop(0);
    obj.imageCheckBox296:setWidth(20);
    obj.imageCheckBox296:setHeight(20);
    obj.imageCheckBox296:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox296:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox296:setField("magicCheck_255");
    obj.imageCheckBox296:setName("imageCheckBox296");

    obj.imageCheckBox297 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox297:setParent(obj.layout68);
    obj.imageCheckBox297:setLeft(120);
    obj.imageCheckBox297:setTop(0);
    obj.imageCheckBox297:setWidth(20);
    obj.imageCheckBox297:setHeight(20);
    obj.imageCheckBox297:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox297:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox297:setField("magicCheck_256");
    obj.imageCheckBox297:setName("imageCheckBox297");

    obj.imageCheckBox298 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox298:setParent(obj.layout68);
    obj.imageCheckBox298:setLeft(140);
    obj.imageCheckBox298:setTop(0);
    obj.imageCheckBox298:setWidth(20);
    obj.imageCheckBox298:setHeight(20);
    obj.imageCheckBox298:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox298:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox298:setField("magicCheck_257");
    obj.imageCheckBox298:setName("imageCheckBox298");

    obj.imageCheckBox299 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox299:setParent(obj.layout68);
    obj.imageCheckBox299:setLeft(160);
    obj.imageCheckBox299:setTop(0);
    obj.imageCheckBox299:setWidth(20);
    obj.imageCheckBox299:setHeight(20);
    obj.imageCheckBox299:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox299:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox299:setField("magicCheck_258");
    obj.imageCheckBox299:setName("imageCheckBox299");

    obj.imageCheckBox300 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox300:setParent(obj.layout68);
    obj.imageCheckBox300:setLeft(180);
    obj.imageCheckBox300:setTop(0);
    obj.imageCheckBox300:setWidth(20);
    obj.imageCheckBox300:setHeight(20);
    obj.imageCheckBox300:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox300:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox300:setField("magicCheck_259");
    obj.imageCheckBox300:setName("imageCheckBox300");

    obj.textEditor37 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor37:setParent(obj.layout62);
    obj.textEditor37:setLeft(36);
    obj.textEditor37:setTop(1106);
    obj.textEditor37:setWidth(320);
    obj.textEditor37:setHeight(150);
    obj.textEditor37:setFontSize(14);
    obj.textEditor37:setFontColor("#000000");
    obj.textEditor37:setTransparent(true);
    obj.textEditor37:setField("magicDesc_26");
    obj.textEditor37:setName("textEditor37");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle4);
    obj.layout69:setLeft(427);
    obj.layout69:setTop(0);
    obj.layout69:setWidth(447);
    obj.layout69:setHeight(1263);
    obj.layout69:setName("layout69");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout69);
    obj.edit155:setLeft(80);
    obj.edit155:setTop(36);
    obj.edit155:setWidth(160);
    obj.edit155:setHeight(30);
    obj.edit155:setFontSize(16);
    obj.edit155:setFontColor("#000000");
    obj.edit155:setTransparent(true);
    obj.edit155:setField("magicName_27");
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout69);
    obj.edit156:setLeft(302);
    obj.edit156:setTop(36);
    obj.edit156:setWidth(90);
    obj.edit156:setHeight(30);
    obj.edit156:setFontSize(16);
    obj.edit156:setFontColor("#000000");
    obj.edit156:setTransparent(true);
    obj.edit156:setField("magicTrad_27");
    obj.edit156:setName("edit156");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout69);
    obj.edit157:setLeft(406);
    obj.edit157:setTop(66);
    obj.edit157:setWidth(90);
    obj.edit157:setHeight(30);
    obj.edit157:setFontSize(16);
    obj.edit157:setFontColor("#000000");
    obj.edit157:setTransparent(true);
    obj.edit157:setField("magicLevel_27");
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout69);
    obj.edit158:setLeft(370);
    obj.edit158:setTop(98);
    obj.edit158:setWidth(90);
    obj.edit158:setHeight(30);
    obj.edit158:setFontSize(16);
    obj.edit158:setFontColor("#000000");
    obj.edit158:setTransparent(true);
    obj.edit158:setField("magicConj_27");
    obj.edit158:setName("edit158");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout69);
    obj.layout70:setLeft(73);
    obj.layout70:setTop(66);
    obj.layout70:setWidth(200);
    obj.layout70:setHeight(20);
    obj.layout70:setName("layout70");

    obj.imageCheckBox301 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox301:setParent(obj.layout70);
    obj.imageCheckBox301:setLeft(0);
    obj.imageCheckBox301:setTop(0);
    obj.imageCheckBox301:setWidth(20);
    obj.imageCheckBox301:setHeight(20);
    obj.imageCheckBox301:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox301:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox301:setField("magicCheck_260");
    obj.imageCheckBox301:setName("imageCheckBox301");

    obj.imageCheckBox302 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox302:setParent(obj.layout70);
    obj.imageCheckBox302:setLeft(20);
    obj.imageCheckBox302:setTop(0);
    obj.imageCheckBox302:setWidth(20);
    obj.imageCheckBox302:setHeight(20);
    obj.imageCheckBox302:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox302:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox302:setField("magicCheck_261");
    obj.imageCheckBox302:setName("imageCheckBox302");

    obj.imageCheckBox303 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox303:setParent(obj.layout70);
    obj.imageCheckBox303:setLeft(40);
    obj.imageCheckBox303:setTop(0);
    obj.imageCheckBox303:setWidth(20);
    obj.imageCheckBox303:setHeight(20);
    obj.imageCheckBox303:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox303:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox303:setField("magicCheck_262");
    obj.imageCheckBox303:setName("imageCheckBox303");

    obj.imageCheckBox304 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox304:setParent(obj.layout70);
    obj.imageCheckBox304:setLeft(60);
    obj.imageCheckBox304:setTop(0);
    obj.imageCheckBox304:setWidth(20);
    obj.imageCheckBox304:setHeight(20);
    obj.imageCheckBox304:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox304:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox304:setField("magicCheck_263");
    obj.imageCheckBox304:setName("imageCheckBox304");

    obj.imageCheckBox305 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox305:setParent(obj.layout70);
    obj.imageCheckBox305:setLeft(80);
    obj.imageCheckBox305:setTop(0);
    obj.imageCheckBox305:setWidth(20);
    obj.imageCheckBox305:setHeight(20);
    obj.imageCheckBox305:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox305:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox305:setField("magicCheck_264");
    obj.imageCheckBox305:setName("imageCheckBox305");

    obj.imageCheckBox306 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox306:setParent(obj.layout70);
    obj.imageCheckBox306:setLeft(100);
    obj.imageCheckBox306:setTop(0);
    obj.imageCheckBox306:setWidth(20);
    obj.imageCheckBox306:setHeight(20);
    obj.imageCheckBox306:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox306:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox306:setField("magicCheck_265");
    obj.imageCheckBox306:setName("imageCheckBox306");

    obj.imageCheckBox307 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox307:setParent(obj.layout70);
    obj.imageCheckBox307:setLeft(120);
    obj.imageCheckBox307:setTop(0);
    obj.imageCheckBox307:setWidth(20);
    obj.imageCheckBox307:setHeight(20);
    obj.imageCheckBox307:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox307:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox307:setField("magicCheck_266");
    obj.imageCheckBox307:setName("imageCheckBox307");

    obj.imageCheckBox308 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox308:setParent(obj.layout70);
    obj.imageCheckBox308:setLeft(140);
    obj.imageCheckBox308:setTop(0);
    obj.imageCheckBox308:setWidth(20);
    obj.imageCheckBox308:setHeight(20);
    obj.imageCheckBox308:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox308:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox308:setField("magicCheck_267");
    obj.imageCheckBox308:setName("imageCheckBox308");

    obj.imageCheckBox309 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox309:setParent(obj.layout70);
    obj.imageCheckBox309:setLeft(160);
    obj.imageCheckBox309:setTop(0);
    obj.imageCheckBox309:setWidth(20);
    obj.imageCheckBox309:setHeight(20);
    obj.imageCheckBox309:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox309:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox309:setField("magicCheck_268");
    obj.imageCheckBox309:setName("imageCheckBox309");

    obj.imageCheckBox310 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox310:setParent(obj.layout70);
    obj.imageCheckBox310:setLeft(180);
    obj.imageCheckBox310:setTop(0);
    obj.imageCheckBox310:setWidth(20);
    obj.imageCheckBox310:setHeight(20);
    obj.imageCheckBox310:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox310:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox310:setField("magicCheck_269");
    obj.imageCheckBox310:setName("imageCheckBox310");

    obj.textEditor38 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor38:setParent(obj.layout69);
    obj.textEditor38:setLeft(36);
    obj.textEditor38:setTop(86);
    obj.textEditor38:setWidth(320);
    obj.textEditor38:setHeight(150);
    obj.textEditor38:setFontSize(14);
    obj.textEditor38:setFontColor("#000000");
    obj.textEditor38:setTransparent(true);
    obj.textEditor38:setField("magicDesc_27");
    obj.textEditor38:setName("textEditor38");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout69);
    obj.edit159:setLeft(80);
    obj.edit159:setTop(242);
    obj.edit159:setWidth(160);
    obj.edit159:setHeight(30);
    obj.edit159:setFontSize(16);
    obj.edit159:setFontColor("#000000");
    obj.edit159:setTransparent(true);
    obj.edit159:setField("magicName_28");
    obj.edit159:setName("edit159");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout69);
    obj.edit160:setLeft(302);
    obj.edit160:setTop(242);
    obj.edit160:setWidth(90);
    obj.edit160:setHeight(30);
    obj.edit160:setFontSize(16);
    obj.edit160:setFontColor("#000000");
    obj.edit160:setTransparent(true);
    obj.edit160:setField("magicTrad_28");
    obj.edit160:setName("edit160");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout69);
    obj.edit161:setLeft(406);
    obj.edit161:setTop(272);
    obj.edit161:setWidth(90);
    obj.edit161:setHeight(30);
    obj.edit161:setFontSize(16);
    obj.edit161:setFontColor("#000000");
    obj.edit161:setTransparent(true);
    obj.edit161:setField("magicLevel_28");
    obj.edit161:setName("edit161");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout69);
    obj.edit162:setLeft(370);
    obj.edit162:setTop(304);
    obj.edit162:setWidth(90);
    obj.edit162:setHeight(30);
    obj.edit162:setFontSize(16);
    obj.edit162:setFontColor("#000000");
    obj.edit162:setTransparent(true);
    obj.edit162:setField("magicConj_28");
    obj.edit162:setName("edit162");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout69);
    obj.layout71:setLeft(73);
    obj.layout71:setTop(272);
    obj.layout71:setWidth(200);
    obj.layout71:setHeight(20);
    obj.layout71:setName("layout71");

    obj.imageCheckBox311 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox311:setParent(obj.layout71);
    obj.imageCheckBox311:setLeft(0);
    obj.imageCheckBox311:setTop(0);
    obj.imageCheckBox311:setWidth(20);
    obj.imageCheckBox311:setHeight(20);
    obj.imageCheckBox311:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox311:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox311:setField("magicCheck_270");
    obj.imageCheckBox311:setName("imageCheckBox311");

    obj.imageCheckBox312 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox312:setParent(obj.layout71);
    obj.imageCheckBox312:setLeft(20);
    obj.imageCheckBox312:setTop(0);
    obj.imageCheckBox312:setWidth(20);
    obj.imageCheckBox312:setHeight(20);
    obj.imageCheckBox312:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox312:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox312:setField("magicCheck_271");
    obj.imageCheckBox312:setName("imageCheckBox312");

    obj.imageCheckBox313 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox313:setParent(obj.layout71);
    obj.imageCheckBox313:setLeft(40);
    obj.imageCheckBox313:setTop(0);
    obj.imageCheckBox313:setWidth(20);
    obj.imageCheckBox313:setHeight(20);
    obj.imageCheckBox313:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox313:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox313:setField("magicCheck_272");
    obj.imageCheckBox313:setName("imageCheckBox313");

    obj.imageCheckBox314 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox314:setParent(obj.layout71);
    obj.imageCheckBox314:setLeft(60);
    obj.imageCheckBox314:setTop(0);
    obj.imageCheckBox314:setWidth(20);
    obj.imageCheckBox314:setHeight(20);
    obj.imageCheckBox314:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox314:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox314:setField("magicCheck_273");
    obj.imageCheckBox314:setName("imageCheckBox314");

    obj.imageCheckBox315 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox315:setParent(obj.layout71);
    obj.imageCheckBox315:setLeft(80);
    obj.imageCheckBox315:setTop(0);
    obj.imageCheckBox315:setWidth(20);
    obj.imageCheckBox315:setHeight(20);
    obj.imageCheckBox315:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox315:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox315:setField("magicCheck_274");
    obj.imageCheckBox315:setName("imageCheckBox315");

    obj.imageCheckBox316 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox316:setParent(obj.layout71);
    obj.imageCheckBox316:setLeft(100);
    obj.imageCheckBox316:setTop(0);
    obj.imageCheckBox316:setWidth(20);
    obj.imageCheckBox316:setHeight(20);
    obj.imageCheckBox316:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox316:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox316:setField("magicCheck_275");
    obj.imageCheckBox316:setName("imageCheckBox316");

    obj.imageCheckBox317 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox317:setParent(obj.layout71);
    obj.imageCheckBox317:setLeft(120);
    obj.imageCheckBox317:setTop(0);
    obj.imageCheckBox317:setWidth(20);
    obj.imageCheckBox317:setHeight(20);
    obj.imageCheckBox317:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox317:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox317:setField("magicCheck_276");
    obj.imageCheckBox317:setName("imageCheckBox317");

    obj.imageCheckBox318 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox318:setParent(obj.layout71);
    obj.imageCheckBox318:setLeft(140);
    obj.imageCheckBox318:setTop(0);
    obj.imageCheckBox318:setWidth(20);
    obj.imageCheckBox318:setHeight(20);
    obj.imageCheckBox318:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox318:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox318:setField("magicCheck_277");
    obj.imageCheckBox318:setName("imageCheckBox318");

    obj.imageCheckBox319 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox319:setParent(obj.layout71);
    obj.imageCheckBox319:setLeft(160);
    obj.imageCheckBox319:setTop(0);
    obj.imageCheckBox319:setWidth(20);
    obj.imageCheckBox319:setHeight(20);
    obj.imageCheckBox319:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox319:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox319:setField("magicCheck_278");
    obj.imageCheckBox319:setName("imageCheckBox319");

    obj.imageCheckBox320 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox320:setParent(obj.layout71);
    obj.imageCheckBox320:setLeft(180);
    obj.imageCheckBox320:setTop(0);
    obj.imageCheckBox320:setWidth(20);
    obj.imageCheckBox320:setHeight(20);
    obj.imageCheckBox320:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox320:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox320:setField("magicCheck_279");
    obj.imageCheckBox320:setName("imageCheckBox320");

    obj.textEditor39 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor39:setParent(obj.layout69);
    obj.textEditor39:setLeft(36);
    obj.textEditor39:setTop(292);
    obj.textEditor39:setWidth(320);
    obj.textEditor39:setHeight(150);
    obj.textEditor39:setFontSize(14);
    obj.textEditor39:setFontColor("#000000");
    obj.textEditor39:setTransparent(true);
    obj.textEditor39:setField("magicDesc_28");
    obj.textEditor39:setName("textEditor39");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout69);
    obj.edit163:setLeft(80);
    obj.edit163:setTop(448);
    obj.edit163:setWidth(160);
    obj.edit163:setHeight(30);
    obj.edit163:setFontSize(16);
    obj.edit163:setFontColor("#000000");
    obj.edit163:setTransparent(true);
    obj.edit163:setField("magicName_29");
    obj.edit163:setName("edit163");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout69);
    obj.edit164:setLeft(302);
    obj.edit164:setTop(448);
    obj.edit164:setWidth(90);
    obj.edit164:setHeight(30);
    obj.edit164:setFontSize(16);
    obj.edit164:setFontColor("#000000");
    obj.edit164:setTransparent(true);
    obj.edit164:setField("magicTrad_29");
    obj.edit164:setName("edit164");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout69);
    obj.edit165:setLeft(406);
    obj.edit165:setTop(478);
    obj.edit165:setWidth(90);
    obj.edit165:setHeight(30);
    obj.edit165:setFontSize(16);
    obj.edit165:setFontColor("#000000");
    obj.edit165:setTransparent(true);
    obj.edit165:setField("magicLevel_29");
    obj.edit165:setName("edit165");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout69);
    obj.edit166:setLeft(370);
    obj.edit166:setTop(510);
    obj.edit166:setWidth(90);
    obj.edit166:setHeight(30);
    obj.edit166:setFontSize(16);
    obj.edit166:setFontColor("#000000");
    obj.edit166:setTransparent(true);
    obj.edit166:setField("magicConj_29");
    obj.edit166:setName("edit166");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout69);
    obj.layout72:setLeft(73);
    obj.layout72:setTop(478);
    obj.layout72:setWidth(200);
    obj.layout72:setHeight(20);
    obj.layout72:setName("layout72");

    obj.imageCheckBox321 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox321:setParent(obj.layout72);
    obj.imageCheckBox321:setLeft(0);
    obj.imageCheckBox321:setTop(0);
    obj.imageCheckBox321:setWidth(20);
    obj.imageCheckBox321:setHeight(20);
    obj.imageCheckBox321:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox321:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox321:setField("magicCheck_280");
    obj.imageCheckBox321:setName("imageCheckBox321");

    obj.imageCheckBox322 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox322:setParent(obj.layout72);
    obj.imageCheckBox322:setLeft(20);
    obj.imageCheckBox322:setTop(0);
    obj.imageCheckBox322:setWidth(20);
    obj.imageCheckBox322:setHeight(20);
    obj.imageCheckBox322:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox322:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox322:setField("magicCheck_281");
    obj.imageCheckBox322:setName("imageCheckBox322");

    obj.imageCheckBox323 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox323:setParent(obj.layout72);
    obj.imageCheckBox323:setLeft(40);
    obj.imageCheckBox323:setTop(0);
    obj.imageCheckBox323:setWidth(20);
    obj.imageCheckBox323:setHeight(20);
    obj.imageCheckBox323:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox323:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox323:setField("magicCheck_282");
    obj.imageCheckBox323:setName("imageCheckBox323");

    obj.imageCheckBox324 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox324:setParent(obj.layout72);
    obj.imageCheckBox324:setLeft(60);
    obj.imageCheckBox324:setTop(0);
    obj.imageCheckBox324:setWidth(20);
    obj.imageCheckBox324:setHeight(20);
    obj.imageCheckBox324:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox324:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox324:setField("magicCheck_283");
    obj.imageCheckBox324:setName("imageCheckBox324");

    obj.imageCheckBox325 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox325:setParent(obj.layout72);
    obj.imageCheckBox325:setLeft(80);
    obj.imageCheckBox325:setTop(0);
    obj.imageCheckBox325:setWidth(20);
    obj.imageCheckBox325:setHeight(20);
    obj.imageCheckBox325:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox325:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox325:setField("magicCheck_284");
    obj.imageCheckBox325:setName("imageCheckBox325");

    obj.imageCheckBox326 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox326:setParent(obj.layout72);
    obj.imageCheckBox326:setLeft(100);
    obj.imageCheckBox326:setTop(0);
    obj.imageCheckBox326:setWidth(20);
    obj.imageCheckBox326:setHeight(20);
    obj.imageCheckBox326:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox326:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox326:setField("magicCheck_285");
    obj.imageCheckBox326:setName("imageCheckBox326");

    obj.imageCheckBox327 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox327:setParent(obj.layout72);
    obj.imageCheckBox327:setLeft(120);
    obj.imageCheckBox327:setTop(0);
    obj.imageCheckBox327:setWidth(20);
    obj.imageCheckBox327:setHeight(20);
    obj.imageCheckBox327:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox327:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox327:setField("magicCheck_286");
    obj.imageCheckBox327:setName("imageCheckBox327");

    obj.imageCheckBox328 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox328:setParent(obj.layout72);
    obj.imageCheckBox328:setLeft(140);
    obj.imageCheckBox328:setTop(0);
    obj.imageCheckBox328:setWidth(20);
    obj.imageCheckBox328:setHeight(20);
    obj.imageCheckBox328:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox328:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox328:setField("magicCheck_287");
    obj.imageCheckBox328:setName("imageCheckBox328");

    obj.imageCheckBox329 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox329:setParent(obj.layout72);
    obj.imageCheckBox329:setLeft(160);
    obj.imageCheckBox329:setTop(0);
    obj.imageCheckBox329:setWidth(20);
    obj.imageCheckBox329:setHeight(20);
    obj.imageCheckBox329:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox329:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox329:setField("magicCheck_288");
    obj.imageCheckBox329:setName("imageCheckBox329");

    obj.imageCheckBox330 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox330:setParent(obj.layout72);
    obj.imageCheckBox330:setLeft(180);
    obj.imageCheckBox330:setTop(0);
    obj.imageCheckBox330:setWidth(20);
    obj.imageCheckBox330:setHeight(20);
    obj.imageCheckBox330:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox330:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox330:setField("magicCheck_289");
    obj.imageCheckBox330:setName("imageCheckBox330");

    obj.textEditor40 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor40:setParent(obj.layout69);
    obj.textEditor40:setLeft(36);
    obj.textEditor40:setTop(498);
    obj.textEditor40:setWidth(320);
    obj.textEditor40:setHeight(150);
    obj.textEditor40:setFontSize(14);
    obj.textEditor40:setFontColor("#000000");
    obj.textEditor40:setTransparent(true);
    obj.textEditor40:setField("magicDesc_29");
    obj.textEditor40:setName("textEditor40");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout69);
    obj.edit167:setLeft(80);
    obj.edit167:setTop(670);
    obj.edit167:setWidth(160);
    obj.edit167:setHeight(30);
    obj.edit167:setFontSize(16);
    obj.edit167:setFontColor("#000000");
    obj.edit167:setTransparent(true);
    obj.edit167:setField("magicName_210");
    obj.edit167:setName("edit167");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout69);
    obj.edit168:setLeft(302);
    obj.edit168:setTop(670);
    obj.edit168:setWidth(90);
    obj.edit168:setHeight(30);
    obj.edit168:setFontSize(16);
    obj.edit168:setFontColor("#000000");
    obj.edit168:setTransparent(true);
    obj.edit168:setField("magicTrad_210");
    obj.edit168:setName("edit168");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout69);
    obj.edit169:setLeft(406);
    obj.edit169:setTop(700);
    obj.edit169:setWidth(90);
    obj.edit169:setHeight(30);
    obj.edit169:setFontSize(16);
    obj.edit169:setFontColor("#000000");
    obj.edit169:setTransparent(true);
    obj.edit169:setField("magicLevel_210");
    obj.edit169:setName("edit169");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout69);
    obj.edit170:setLeft(370);
    obj.edit170:setTop(732);
    obj.edit170:setWidth(90);
    obj.edit170:setHeight(30);
    obj.edit170:setFontSize(16);
    obj.edit170:setFontColor("#000000");
    obj.edit170:setTransparent(true);
    obj.edit170:setField("magicConj_210");
    obj.edit170:setName("edit170");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout69);
    obj.layout73:setLeft(73);
    obj.layout73:setTop(700);
    obj.layout73:setWidth(200);
    obj.layout73:setHeight(20);
    obj.layout73:setName("layout73");

    obj.imageCheckBox331 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox331:setParent(obj.layout73);
    obj.imageCheckBox331:setLeft(0);
    obj.imageCheckBox331:setTop(0);
    obj.imageCheckBox331:setWidth(20);
    obj.imageCheckBox331:setHeight(20);
    obj.imageCheckBox331:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox331:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox331:setField("magicCheck_290");
    obj.imageCheckBox331:setName("imageCheckBox331");

    obj.imageCheckBox332 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox332:setParent(obj.layout73);
    obj.imageCheckBox332:setLeft(20);
    obj.imageCheckBox332:setTop(0);
    obj.imageCheckBox332:setWidth(20);
    obj.imageCheckBox332:setHeight(20);
    obj.imageCheckBox332:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox332:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox332:setField("magicCheck_291");
    obj.imageCheckBox332:setName("imageCheckBox332");

    obj.imageCheckBox333 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox333:setParent(obj.layout73);
    obj.imageCheckBox333:setLeft(40);
    obj.imageCheckBox333:setTop(0);
    obj.imageCheckBox333:setWidth(20);
    obj.imageCheckBox333:setHeight(20);
    obj.imageCheckBox333:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox333:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox333:setField("magicCheck_292");
    obj.imageCheckBox333:setName("imageCheckBox333");

    obj.imageCheckBox334 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox334:setParent(obj.layout73);
    obj.imageCheckBox334:setLeft(60);
    obj.imageCheckBox334:setTop(0);
    obj.imageCheckBox334:setWidth(20);
    obj.imageCheckBox334:setHeight(20);
    obj.imageCheckBox334:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox334:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox334:setField("magicCheck_293");
    obj.imageCheckBox334:setName("imageCheckBox334");

    obj.imageCheckBox335 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox335:setParent(obj.layout73);
    obj.imageCheckBox335:setLeft(80);
    obj.imageCheckBox335:setTop(0);
    obj.imageCheckBox335:setWidth(20);
    obj.imageCheckBox335:setHeight(20);
    obj.imageCheckBox335:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox335:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox335:setField("magicCheck_294");
    obj.imageCheckBox335:setName("imageCheckBox335");

    obj.imageCheckBox336 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox336:setParent(obj.layout73);
    obj.imageCheckBox336:setLeft(100);
    obj.imageCheckBox336:setTop(0);
    obj.imageCheckBox336:setWidth(20);
    obj.imageCheckBox336:setHeight(20);
    obj.imageCheckBox336:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox336:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox336:setField("magicCheck_295");
    obj.imageCheckBox336:setName("imageCheckBox336");

    obj.imageCheckBox337 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox337:setParent(obj.layout73);
    obj.imageCheckBox337:setLeft(120);
    obj.imageCheckBox337:setTop(0);
    obj.imageCheckBox337:setWidth(20);
    obj.imageCheckBox337:setHeight(20);
    obj.imageCheckBox337:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox337:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox337:setField("magicCheck_296");
    obj.imageCheckBox337:setName("imageCheckBox337");

    obj.imageCheckBox338 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox338:setParent(obj.layout73);
    obj.imageCheckBox338:setLeft(140);
    obj.imageCheckBox338:setTop(0);
    obj.imageCheckBox338:setWidth(20);
    obj.imageCheckBox338:setHeight(20);
    obj.imageCheckBox338:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox338:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox338:setField("magicCheck_297");
    obj.imageCheckBox338:setName("imageCheckBox338");

    obj.imageCheckBox339 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox339:setParent(obj.layout73);
    obj.imageCheckBox339:setLeft(160);
    obj.imageCheckBox339:setTop(0);
    obj.imageCheckBox339:setWidth(20);
    obj.imageCheckBox339:setHeight(20);
    obj.imageCheckBox339:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox339:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox339:setField("magicCheck_298");
    obj.imageCheckBox339:setName("imageCheckBox339");

    obj.imageCheckBox340 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox340:setParent(obj.layout73);
    obj.imageCheckBox340:setLeft(180);
    obj.imageCheckBox340:setTop(0);
    obj.imageCheckBox340:setWidth(20);
    obj.imageCheckBox340:setHeight(20);
    obj.imageCheckBox340:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox340:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox340:setField("magicCheck_299");
    obj.imageCheckBox340:setName("imageCheckBox340");

    obj.textEditor41 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor41:setParent(obj.layout69);
    obj.textEditor41:setLeft(36);
    obj.textEditor41:setTop(720);
    obj.textEditor41:setWidth(320);
    obj.textEditor41:setHeight(150);
    obj.textEditor41:setFontSize(14);
    obj.textEditor41:setFontColor("#000000");
    obj.textEditor41:setTransparent(true);
    obj.textEditor41:setField("magicDesc_210");
    obj.textEditor41:setName("textEditor41");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout69);
    obj.edit171:setLeft(80);
    obj.edit171:setTop(856);
    obj.edit171:setWidth(160);
    obj.edit171:setHeight(30);
    obj.edit171:setFontSize(16);
    obj.edit171:setFontColor("#000000");
    obj.edit171:setTransparent(true);
    obj.edit171:setField("magicName_2211");
    obj.edit171:setName("edit171");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout69);
    obj.edit172:setLeft(302);
    obj.edit172:setTop(856);
    obj.edit172:setWidth(90);
    obj.edit172:setHeight(30);
    obj.edit172:setFontSize(16);
    obj.edit172:setFontColor("#000000");
    obj.edit172:setTransparent(true);
    obj.edit172:setField("magicTrad_2211");
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout69);
    obj.edit173:setLeft(406);
    obj.edit173:setTop(886);
    obj.edit173:setWidth(90);
    obj.edit173:setHeight(30);
    obj.edit173:setFontSize(16);
    obj.edit173:setFontColor("#000000");
    obj.edit173:setTransparent(true);
    obj.edit173:setField("magicLevel_2211");
    obj.edit173:setName("edit173");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout69);
    obj.edit174:setLeft(370);
    obj.edit174:setTop(918);
    obj.edit174:setWidth(90);
    obj.edit174:setHeight(30);
    obj.edit174:setFontSize(16);
    obj.edit174:setFontColor("#000000");
    obj.edit174:setTransparent(true);
    obj.edit174:setField("magicConj_2211");
    obj.edit174:setName("edit174");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout69);
    obj.layout74:setLeft(73);
    obj.layout74:setTop(886);
    obj.layout74:setWidth(200);
    obj.layout74:setHeight(20);
    obj.layout74:setName("layout74");

    obj.imageCheckBox341 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox341:setParent(obj.layout74);
    obj.imageCheckBox341:setLeft(0);
    obj.imageCheckBox341:setTop(0);
    obj.imageCheckBox341:setWidth(20);
    obj.imageCheckBox341:setHeight(20);
    obj.imageCheckBox341:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox341:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox341:setField("magicCheck_2100");
    obj.imageCheckBox341:setName("imageCheckBox341");

    obj.imageCheckBox342 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox342:setParent(obj.layout74);
    obj.imageCheckBox342:setLeft(20);
    obj.imageCheckBox342:setTop(0);
    obj.imageCheckBox342:setWidth(20);
    obj.imageCheckBox342:setHeight(20);
    obj.imageCheckBox342:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox342:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox342:setField("magicCheck_2101");
    obj.imageCheckBox342:setName("imageCheckBox342");

    obj.imageCheckBox343 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox343:setParent(obj.layout74);
    obj.imageCheckBox343:setLeft(40);
    obj.imageCheckBox343:setTop(0);
    obj.imageCheckBox343:setWidth(20);
    obj.imageCheckBox343:setHeight(20);
    obj.imageCheckBox343:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox343:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox343:setField("magicCheck_2102");
    obj.imageCheckBox343:setName("imageCheckBox343");

    obj.imageCheckBox344 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox344:setParent(obj.layout74);
    obj.imageCheckBox344:setLeft(60);
    obj.imageCheckBox344:setTop(0);
    obj.imageCheckBox344:setWidth(20);
    obj.imageCheckBox344:setHeight(20);
    obj.imageCheckBox344:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox344:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox344:setField("magicCheck_2103");
    obj.imageCheckBox344:setName("imageCheckBox344");

    obj.imageCheckBox345 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox345:setParent(obj.layout74);
    obj.imageCheckBox345:setLeft(80);
    obj.imageCheckBox345:setTop(0);
    obj.imageCheckBox345:setWidth(20);
    obj.imageCheckBox345:setHeight(20);
    obj.imageCheckBox345:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox345:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox345:setField("magicCheck_2104");
    obj.imageCheckBox345:setName("imageCheckBox345");

    obj.imageCheckBox346 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox346:setParent(obj.layout74);
    obj.imageCheckBox346:setLeft(100);
    obj.imageCheckBox346:setTop(0);
    obj.imageCheckBox346:setWidth(20);
    obj.imageCheckBox346:setHeight(20);
    obj.imageCheckBox346:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox346:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox346:setField("magicCheck_2105");
    obj.imageCheckBox346:setName("imageCheckBox346");

    obj.imageCheckBox347 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox347:setParent(obj.layout74);
    obj.imageCheckBox347:setLeft(120);
    obj.imageCheckBox347:setTop(0);
    obj.imageCheckBox347:setWidth(20);
    obj.imageCheckBox347:setHeight(20);
    obj.imageCheckBox347:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox347:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox347:setField("magicCheck_2106");
    obj.imageCheckBox347:setName("imageCheckBox347");

    obj.imageCheckBox348 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox348:setParent(obj.layout74);
    obj.imageCheckBox348:setLeft(140);
    obj.imageCheckBox348:setTop(0);
    obj.imageCheckBox348:setWidth(20);
    obj.imageCheckBox348:setHeight(20);
    obj.imageCheckBox348:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox348:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox348:setField("magicCheck_2107");
    obj.imageCheckBox348:setName("imageCheckBox348");

    obj.imageCheckBox349 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox349:setParent(obj.layout74);
    obj.imageCheckBox349:setLeft(160);
    obj.imageCheckBox349:setTop(0);
    obj.imageCheckBox349:setWidth(20);
    obj.imageCheckBox349:setHeight(20);
    obj.imageCheckBox349:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox349:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox349:setField("magicCheck_2108");
    obj.imageCheckBox349:setName("imageCheckBox349");

    obj.imageCheckBox350 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox350:setParent(obj.layout74);
    obj.imageCheckBox350:setLeft(180);
    obj.imageCheckBox350:setTop(0);
    obj.imageCheckBox350:setWidth(20);
    obj.imageCheckBox350:setHeight(20);
    obj.imageCheckBox350:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox350:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox350:setField("magicCheck_2109");
    obj.imageCheckBox350:setName("imageCheckBox350");

    obj.textEditor42 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor42:setParent(obj.layout69);
    obj.textEditor42:setLeft(36);
    obj.textEditor42:setTop(906);
    obj.textEditor42:setWidth(320);
    obj.textEditor42:setHeight(150);
    obj.textEditor42:setFontSize(14);
    obj.textEditor42:setFontColor("#000000");
    obj.textEditor42:setTransparent(true);
    obj.textEditor42:setField("magicDesc_2211");
    obj.textEditor42:setName("textEditor42");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout69);
    obj.edit175:setLeft(80);
    obj.edit175:setTop(1056);
    obj.edit175:setWidth(160);
    obj.edit175:setHeight(30);
    obj.edit175:setFontSize(16);
    obj.edit175:setFontColor("#000000");
    obj.edit175:setTransparent(true);
    obj.edit175:setField("magicName_12");
    obj.edit175:setName("edit175");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout69);
    obj.edit176:setLeft(302);
    obj.edit176:setTop(1056);
    obj.edit176:setWidth(90);
    obj.edit176:setHeight(30);
    obj.edit176:setFontSize(16);
    obj.edit176:setFontColor("#000000");
    obj.edit176:setTransparent(true);
    obj.edit176:setField("magicTrad_12");
    obj.edit176:setName("edit176");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout69);
    obj.edit177:setLeft(406);
    obj.edit177:setTop(1086);
    obj.edit177:setWidth(90);
    obj.edit177:setHeight(30);
    obj.edit177:setFontSize(16);
    obj.edit177:setFontColor("#000000");
    obj.edit177:setTransparent(true);
    obj.edit177:setField("magicLevel_12");
    obj.edit177:setName("edit177");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout69);
    obj.edit178:setLeft(370);
    obj.edit178:setTop(1118);
    obj.edit178:setWidth(90);
    obj.edit178:setHeight(30);
    obj.edit178:setFontSize(16);
    obj.edit178:setFontColor("#000000");
    obj.edit178:setTransparent(true);
    obj.edit178:setField("magicConj_12");
    obj.edit178:setName("edit178");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout69);
    obj.layout75:setLeft(73);
    obj.layout75:setTop(1086);
    obj.layout75:setWidth(200);
    obj.layout75:setHeight(20);
    obj.layout75:setName("layout75");

    obj.imageCheckBox351 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox351:setParent(obj.layout75);
    obj.imageCheckBox351:setLeft(0);
    obj.imageCheckBox351:setTop(0);
    obj.imageCheckBox351:setWidth(20);
    obj.imageCheckBox351:setHeight(20);
    obj.imageCheckBox351:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox351:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox351:setField("magicCheck_2110");
    obj.imageCheckBox351:setName("imageCheckBox351");

    obj.imageCheckBox352 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox352:setParent(obj.layout75);
    obj.imageCheckBox352:setLeft(20);
    obj.imageCheckBox352:setTop(0);
    obj.imageCheckBox352:setWidth(20);
    obj.imageCheckBox352:setHeight(20);
    obj.imageCheckBox352:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox352:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox352:setField("magicCheck_2111");
    obj.imageCheckBox352:setName("imageCheckBox352");

    obj.imageCheckBox353 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox353:setParent(obj.layout75);
    obj.imageCheckBox353:setLeft(40);
    obj.imageCheckBox353:setTop(0);
    obj.imageCheckBox353:setWidth(20);
    obj.imageCheckBox353:setHeight(20);
    obj.imageCheckBox353:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox353:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox353:setField("magicCheck_2112");
    obj.imageCheckBox353:setName("imageCheckBox353");

    obj.imageCheckBox354 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox354:setParent(obj.layout75);
    obj.imageCheckBox354:setLeft(60);
    obj.imageCheckBox354:setTop(0);
    obj.imageCheckBox354:setWidth(20);
    obj.imageCheckBox354:setHeight(20);
    obj.imageCheckBox354:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox354:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox354:setField("magicCheck_2113");
    obj.imageCheckBox354:setName("imageCheckBox354");

    obj.imageCheckBox355 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox355:setParent(obj.layout75);
    obj.imageCheckBox355:setLeft(80);
    obj.imageCheckBox355:setTop(0);
    obj.imageCheckBox355:setWidth(20);
    obj.imageCheckBox355:setHeight(20);
    obj.imageCheckBox355:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox355:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox355:setField("magicCheck_2114");
    obj.imageCheckBox355:setName("imageCheckBox355");

    obj.imageCheckBox356 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox356:setParent(obj.layout75);
    obj.imageCheckBox356:setLeft(100);
    obj.imageCheckBox356:setTop(0);
    obj.imageCheckBox356:setWidth(20);
    obj.imageCheckBox356:setHeight(20);
    obj.imageCheckBox356:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox356:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox356:setField("magicCheck_2115");
    obj.imageCheckBox356:setName("imageCheckBox356");

    obj.imageCheckBox357 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox357:setParent(obj.layout75);
    obj.imageCheckBox357:setLeft(120);
    obj.imageCheckBox357:setTop(0);
    obj.imageCheckBox357:setWidth(20);
    obj.imageCheckBox357:setHeight(20);
    obj.imageCheckBox357:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox357:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox357:setField("magicCheck_2116");
    obj.imageCheckBox357:setName("imageCheckBox357");

    obj.imageCheckBox358 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox358:setParent(obj.layout75);
    obj.imageCheckBox358:setLeft(140);
    obj.imageCheckBox358:setTop(0);
    obj.imageCheckBox358:setWidth(20);
    obj.imageCheckBox358:setHeight(20);
    obj.imageCheckBox358:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox358:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox358:setField("magicCheck_2117");
    obj.imageCheckBox358:setName("imageCheckBox358");

    obj.imageCheckBox359 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox359:setParent(obj.layout75);
    obj.imageCheckBox359:setLeft(160);
    obj.imageCheckBox359:setTop(0);
    obj.imageCheckBox359:setWidth(20);
    obj.imageCheckBox359:setHeight(20);
    obj.imageCheckBox359:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox359:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox359:setField("magicCheck_2118");
    obj.imageCheckBox359:setName("imageCheckBox359");

    obj.imageCheckBox360 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox360:setParent(obj.layout75);
    obj.imageCheckBox360:setLeft(180);
    obj.imageCheckBox360:setTop(0);
    obj.imageCheckBox360:setWidth(20);
    obj.imageCheckBox360:setHeight(20);
    obj.imageCheckBox360:setImageUnchecked("/SODLFillable/images/checkboxUnchecked.png");
    obj.imageCheckBox360:setImageChecked("/SODLFillable/images/checkboxChecked.png");
    obj.imageCheckBox360:setField("magicCheck_2119");
    obj.imageCheckBox360:setName("imageCheckBox360");

    obj.textEditor43 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor43:setParent(obj.layout69);
    obj.textEditor43:setLeft(36);
    obj.textEditor43:setTop(1106);
    obj.textEditor43:setWidth(320);
    obj.textEditor43:setHeight(150);
    obj.textEditor43:setFontSize(14);
    obj.textEditor43:setFontColor("#000000");
    obj.textEditor43:setTransparent(true);
    obj.textEditor43:setField("magicDesc_212");
    obj.textEditor43:setName("textEditor43");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Página 5");
    obj.tab5:setName("tab5");

    obj.frmSODLFillable5_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSODLFillable5_svg:setParent(obj.tab5);
    obj.frmSODLFillable5_svg:setName("frmSODLFillable5_svg");
    obj.frmSODLFillable5_svg:setAlign("client");
    obj.frmSODLFillable5_svg:setTheme("light");
    obj.frmSODLFillable5_svg:setMargins({top=1});

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmSODLFillable5_svg);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox5);
    obj.rectangle5:setWidth(881);
    obj.rectangle5:setHeight(1267);
    obj.rectangle5:setColor("white");
    obj.rectangle5:setName("rectangle5");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle5);
    obj.image5:setLeft(0);
    obj.image5:setTop(0);
    obj.image5:setWidth(881);
    obj.image5:setHeight(1267);
    obj.image5:setSRC("/SODLFillable/images/5.png");
    obj.image5:setStyle("stretch");
    obj.image5:setOptimize(true);
    obj.image5:setName("image5");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle5);
    obj.layout76:setLeft(0);
    obj.layout76:setTop(0);
    obj.layout76:setWidth(881);
    obj.layout76:setHeight(1267);
    obj.layout76:setName("layout76");

    obj.textEditor44 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor44:setParent(obj.layout76);
    obj.textEditor44:setWidth(881);
    obj.textEditor44:setHeight(1267);
    obj.textEditor44:setFontColor("#000000");
    obj.textEditor44:setFontSize(18);
    obj.textEditor44:setTransparent(true);
    obj.textEditor44:setField("Background");
    obj.textEditor44:setName("textEditor44");

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

        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.imageCheckBox296 ~= nil then self.imageCheckBox296:destroy(); self.imageCheckBox296 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.imageCheckBox227 ~= nil then self.imageCheckBox227:destroy(); self.imageCheckBox227 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.imageCheckBox287 ~= nil then self.imageCheckBox287:destroy(); self.imageCheckBox287 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.imageCheckBox200 ~= nil then self.imageCheckBox200:destroy(); self.imageCheckBox200 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.frmSODLFillable2_svg ~= nil then self.frmSODLFillable2_svg:destroy(); self.frmSODLFillable2_svg = nil; end;
        if self.imageCheckBox357 ~= nil then self.imageCheckBox357:destroy(); self.imageCheckBox357 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.imageCheckBox58 ~= nil then self.imageCheckBox58:destroy(); self.imageCheckBox58 = nil; end;
        if self.imageCheckBox175 ~= nil then self.imageCheckBox175:destroy(); self.imageCheckBox175 = nil; end;
        if self.imageCheckBox225 ~= nil then self.imageCheckBox225:destroy(); self.imageCheckBox225 = nil; end;
        if self.imageCheckBox360 ~= nil then self.imageCheckBox360:destroy(); self.imageCheckBox360 = nil; end;
        if self.imageCheckBox50 ~= nil then self.imageCheckBox50:destroy(); self.imageCheckBox50 = nil; end;
        if self.imageCheckBox185 ~= nil then self.imageCheckBox185:destroy(); self.imageCheckBox185 = nil; end;
        if self.imageCheckBox148 ~= nil then self.imageCheckBox148:destroy(); self.imageCheckBox148 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.imageCheckBox115 ~= nil then self.imageCheckBox115:destroy(); self.imageCheckBox115 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.textEditor38 ~= nil then self.textEditor38:destroy(); self.textEditor38 = nil; end;
        if self.imageCheckBox67 ~= nil then self.imageCheckBox67:destroy(); self.imageCheckBox67 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.imageCheckBox288 ~= nil then self.imageCheckBox288:destroy(); self.imageCheckBox288 = nil; end;
        if self.imageCheckBox251 ~= nil then self.imageCheckBox251:destroy(); self.imageCheckBox251 = nil; end;
        if self.imageCheckBox210 ~= nil then self.imageCheckBox210:destroy(); self.imageCheckBox210 = nil; end;
        if self.imageCheckBox126 ~= nil then self.imageCheckBox126:destroy(); self.imageCheckBox126 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.imageCheckBox345 ~= nil then self.imageCheckBox345:destroy(); self.imageCheckBox345 = nil; end;
        if self.imageCheckBox289 ~= nil then self.imageCheckBox289:destroy(); self.imageCheckBox289 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.imageCheckBox304 ~= nil then self.imageCheckBox304:destroy(); self.imageCheckBox304 = nil; end;
        if self.imageCheckBox190 ~= nil then self.imageCheckBox190:destroy(); self.imageCheckBox190 = nil; end;
        if self.textEditor27 ~= nil then self.textEditor27:destroy(); self.textEditor27 = nil; end;
        if self.imageCheckBox166 ~= nil then self.imageCheckBox166:destroy(); self.imageCheckBox166 = nil; end;
        if self.imageCheckBox271 ~= nil then self.imageCheckBox271:destroy(); self.imageCheckBox271 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.imageCheckBox176 ~= nil then self.imageCheckBox176:destroy(); self.imageCheckBox176 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.imageCheckBox181 ~= nil then self.imageCheckBox181:destroy(); self.imageCheckBox181 = nil; end;
        if self.imageCheckBox174 ~= nil then self.imageCheckBox174:destroy(); self.imageCheckBox174 = nil; end;
        if self.imageCheckBox196 ~= nil then self.imageCheckBox196:destroy(); self.imageCheckBox196 = nil; end;
        if self.imageCheckBox129 ~= nil then self.imageCheckBox129:destroy(); self.imageCheckBox129 = nil; end;
        if self.imageCheckBox248 ~= nil then self.imageCheckBox248:destroy(); self.imageCheckBox248 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox99 ~= nil then self.imageCheckBox99:destroy(); self.imageCheckBox99 = nil; end;
        if self.imageCheckBox133 ~= nil then self.imageCheckBox133:destroy(); self.imageCheckBox133 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.imageCheckBox63 ~= nil then self.imageCheckBox63:destroy(); self.imageCheckBox63 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.imageCheckBox168 ~= nil then self.imageCheckBox168:destroy(); self.imageCheckBox168 = nil; end;
        if self.imageCheckBox141 ~= nil then self.imageCheckBox141:destroy(); self.imageCheckBox141 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.imageCheckBox290 ~= nil then self.imageCheckBox290:destroy(); self.imageCheckBox290 = nil; end;
        if self.imageCheckBox316 ~= nil then self.imageCheckBox316:destroy(); self.imageCheckBox316 = nil; end;
        if self.imageCheckBox191 ~= nil then self.imageCheckBox191:destroy(); self.imageCheckBox191 = nil; end;
        if self.imageCheckBox145 ~= nil then self.imageCheckBox145:destroy(); self.imageCheckBox145 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.imageCheckBox337 ~= nil then self.imageCheckBox337:destroy(); self.imageCheckBox337 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.imageCheckBox79 ~= nil then self.imageCheckBox79:destroy(); self.imageCheckBox79 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.imageCheckBox136 ~= nil then self.imageCheckBox136:destroy(); self.imageCheckBox136 = nil; end;
        if self.imageCheckBox150 ~= nil then self.imageCheckBox150:destroy(); self.imageCheckBox150 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.imageCheckBox78 ~= nil then self.imageCheckBox78:destroy(); self.imageCheckBox78 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.imageCheckBox103 ~= nil then self.imageCheckBox103:destroy(); self.imageCheckBox103 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.imageCheckBox214 ~= nil then self.imageCheckBox214:destroy(); self.imageCheckBox214 = nil; end;
        if self.imageCheckBox336 ~= nil then self.imageCheckBox336:destroy(); self.imageCheckBox336 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.imageCheckBox241 ~= nil then self.imageCheckBox241:destroy(); self.imageCheckBox241 = nil; end;
        if self.textEditor36 ~= nil then self.textEditor36:destroy(); self.textEditor36 = nil; end;
        if self.imageCheckBox349 ~= nil then self.imageCheckBox349:destroy(); self.imageCheckBox349 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.imageCheckBox104 ~= nil then self.imageCheckBox104:destroy(); self.imageCheckBox104 = nil; end;
        if self.imageCheckBox346 ~= nil then self.imageCheckBox346:destroy(); self.imageCheckBox346 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.imageCheckBox131 ~= nil then self.imageCheckBox131:destroy(); self.imageCheckBox131 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.imageCheckBox154 ~= nil then self.imageCheckBox154:destroy(); self.imageCheckBox154 = nil; end;
        if self.imageCheckBox68 ~= nil then self.imageCheckBox68:destroy(); self.imageCheckBox68 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.imageCheckBox326 ~= nil then self.imageCheckBox326:destroy(); self.imageCheckBox326 = nil; end;
        if self.imageCheckBox331 ~= nil then self.imageCheckBox331:destroy(); self.imageCheckBox331 = nil; end;
        if self.imageCheckBox159 ~= nil then self.imageCheckBox159:destroy(); self.imageCheckBox159 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.imageCheckBox358 ~= nil then self.imageCheckBox358:destroy(); self.imageCheckBox358 = nil; end;
        if self.imageCheckBox224 ~= nil then self.imageCheckBox224:destroy(); self.imageCheckBox224 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.imageCheckBox285 ~= nil then self.imageCheckBox285:destroy(); self.imageCheckBox285 = nil; end;
        if self.imageCheckBox233 ~= nil then self.imageCheckBox233:destroy(); self.imageCheckBox233 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.imageCheckBox350 ~= nil then self.imageCheckBox350:destroy(); self.imageCheckBox350 = nil; end;
        if self.imageCheckBox354 ~= nil then self.imageCheckBox354:destroy(); self.imageCheckBox354 = nil; end;
        if self.imageCheckBox117 ~= nil then self.imageCheckBox117:destroy(); self.imageCheckBox117 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.imageCheckBox239 ~= nil then self.imageCheckBox239:destroy(); self.imageCheckBox239 = nil; end;
        if self.imageCheckBox208 ~= nil then self.imageCheckBox208:destroy(); self.imageCheckBox208 = nil; end;
        if self.imageCheckBox112 ~= nil then self.imageCheckBox112:destroy(); self.imageCheckBox112 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.imageCheckBox352 ~= nil then self.imageCheckBox352:destroy(); self.imageCheckBox352 = nil; end;
        if self.imageCheckBox207 ~= nil then self.imageCheckBox207:destroy(); self.imageCheckBox207 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.imageCheckBox194 ~= nil then self.imageCheckBox194:destroy(); self.imageCheckBox194 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.imageCheckBox302 ~= nil then self.imageCheckBox302:destroy(); self.imageCheckBox302 = nil; end;
        if self.imageCheckBox91 ~= nil then self.imageCheckBox91:destroy(); self.imageCheckBox91 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.textEditor43 ~= nil then self.textEditor43:destroy(); self.textEditor43 = nil; end;
        if self.imageCheckBox343 ~= nil then self.imageCheckBox343:destroy(); self.imageCheckBox343 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.imageCheckBox155 ~= nil then self.imageCheckBox155:destroy(); self.imageCheckBox155 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.imageCheckBox59 ~= nil then self.imageCheckBox59:destroy(); self.imageCheckBox59 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.imageCheckBox90 ~= nil then self.imageCheckBox90:destroy(); self.imageCheckBox90 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.imageCheckBox182 ~= nil then self.imageCheckBox182:destroy(); self.imageCheckBox182 = nil; end;
        if self.imageCheckBox318 ~= nil then self.imageCheckBox318:destroy(); self.imageCheckBox318 = nil; end;
        if self.imageCheckBox93 ~= nil then self.imageCheckBox93:destroy(); self.imageCheckBox93 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.imageCheckBox314 ~= nil then self.imageCheckBox314:destroy(); self.imageCheckBox314 = nil; end;
        if self.imageCheckBox341 ~= nil then self.imageCheckBox341:destroy(); self.imageCheckBox341 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.imageCheckBox219 ~= nil then self.imageCheckBox219:destroy(); self.imageCheckBox219 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.imageCheckBox246 ~= nil then self.imageCheckBox246:destroy(); self.imageCheckBox246 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.textEditor40 ~= nil then self.textEditor40:destroy(); self.textEditor40 = nil; end;
        if self.imageCheckBox340 ~= nil then self.imageCheckBox340:destroy(); self.imageCheckBox340 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.imageCheckBox260 ~= nil then self.imageCheckBox260:destroy(); self.imageCheckBox260 = nil; end;
        if self.imageCheckBox55 ~= nil then self.imageCheckBox55:destroy(); self.imageCheckBox55 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.imageCheckBox83 ~= nil then self.imageCheckBox83:destroy(); self.imageCheckBox83 = nil; end;
        if self.imageCheckBox106 ~= nil then self.imageCheckBox106:destroy(); self.imageCheckBox106 = nil; end;
        if self.imageCheckBox128 ~= nil then self.imageCheckBox128:destroy(); self.imageCheckBox128 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.imageCheckBox173 ~= nil then self.imageCheckBox173:destroy(); self.imageCheckBox173 = nil; end;
        if self.imageCheckBox193 ~= nil then self.imageCheckBox193:destroy(); self.imageCheckBox193 = nil; end;
        if self.imageCheckBox205 ~= nil then self.imageCheckBox205:destroy(); self.imageCheckBox205 = nil; end;
        if self.imageCheckBox213 ~= nil then self.imageCheckBox213:destroy(); self.imageCheckBox213 = nil; end;
        if self.imageCheckBox107 ~= nil then self.imageCheckBox107:destroy(); self.imageCheckBox107 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.textEditor30 ~= nil then self.textEditor30:destroy(); self.textEditor30 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.imageCheckBox255 ~= nil then self.imageCheckBox255:destroy(); self.imageCheckBox255 = nil; end;
        if self.imageCheckBox298 ~= nil then self.imageCheckBox298:destroy(); self.imageCheckBox298 = nil; end;
        if self.imageCheckBox309 ~= nil then self.imageCheckBox309:destroy(); self.imageCheckBox309 = nil; end;
        if self.imageCheckBox315 ~= nil then self.imageCheckBox315:destroy(); self.imageCheckBox315 = nil; end;
        if self.imageCheckBox333 ~= nil then self.imageCheckBox333:destroy(); self.imageCheckBox333 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.imageCheckBox62 ~= nil then self.imageCheckBox62:destroy(); self.imageCheckBox62 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.imageCheckBox124 ~= nil then self.imageCheckBox124:destroy(); self.imageCheckBox124 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox325 ~= nil then self.imageCheckBox325:destroy(); self.imageCheckBox325 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.imageCheckBox249 ~= nil then self.imageCheckBox249:destroy(); self.imageCheckBox249 = nil; end;
        if self.imageCheckBox94 ~= nil then self.imageCheckBox94:destroy(); self.imageCheckBox94 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.imageCheckBox110 ~= nil then self.imageCheckBox110:destroy(); self.imageCheckBox110 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.imageCheckBox189 ~= nil then self.imageCheckBox189:destroy(); self.imageCheckBox189 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.imageCheckBox313 ~= nil then self.imageCheckBox313:destroy(); self.imageCheckBox313 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.imageCheckBox71 ~= nil then self.imageCheckBox71:destroy(); self.imageCheckBox71 = nil; end;
        if self.imageCheckBox339 ~= nil then self.imageCheckBox339:destroy(); self.imageCheckBox339 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.imageCheckBox137 ~= nil then self.imageCheckBox137:destroy(); self.imageCheckBox137 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.imageCheckBox305 ~= nil then self.imageCheckBox305:destroy(); self.imageCheckBox305 = nil; end;
        if self.imageCheckBox231 ~= nil then self.imageCheckBox231:destroy(); self.imageCheckBox231 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.imageCheckBox351 ~= nil then self.imageCheckBox351:destroy(); self.imageCheckBox351 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.imageCheckBox247 ~= nil then self.imageCheckBox247:destroy(); self.imageCheckBox247 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.imageCheckBox125 ~= nil then self.imageCheckBox125:destroy(); self.imageCheckBox125 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.imageCheckBox87 ~= nil then self.imageCheckBox87:destroy(); self.imageCheckBox87 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.imageCheckBox56 ~= nil then self.imageCheckBox56:destroy(); self.imageCheckBox56 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.imageCheckBox142 ~= nil then self.imageCheckBox142:destroy(); self.imageCheckBox142 = nil; end;
        if self.imageCheckBox264 ~= nil then self.imageCheckBox264:destroy(); self.imageCheckBox264 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.imageCheckBox180 ~= nil then self.imageCheckBox180:destroy(); self.imageCheckBox180 = nil; end;
        if self.imageCheckBox253 ~= nil then self.imageCheckBox253:destroy(); self.imageCheckBox253 = nil; end;
        if self.imageCheckBox85 ~= nil then self.imageCheckBox85:destroy(); self.imageCheckBox85 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.imageCheckBox252 ~= nil then self.imageCheckBox252:destroy(); self.imageCheckBox252 = nil; end;
        if self.imageCheckBox322 ~= nil then self.imageCheckBox322:destroy(); self.imageCheckBox322 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.imageCheckBox262 ~= nil then self.imageCheckBox262:destroy(); self.imageCheckBox262 = nil; end;
        if self.imageCheckBox157 ~= nil then self.imageCheckBox157:destroy(); self.imageCheckBox157 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.imageCheckBox172 ~= nil then self.imageCheckBox172:destroy(); self.imageCheckBox172 = nil; end;
        if self.imageCheckBox156 ~= nil then self.imageCheckBox156:destroy(); self.imageCheckBox156 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.imageCheckBox116 ~= nil then self.imageCheckBox116:destroy(); self.imageCheckBox116 = nil; end;
        if self.imageCheckBox118 ~= nil then self.imageCheckBox118:destroy(); self.imageCheckBox118 = nil; end;
        if self.imageCheckBox127 ~= nil then self.imageCheckBox127:destroy(); self.imageCheckBox127 = nil; end;
        if self.imageCheckBox222 ~= nil then self.imageCheckBox222:destroy(); self.imageCheckBox222 = nil; end;
        if self.imageCheckBox86 ~= nil then self.imageCheckBox86:destroy(); self.imageCheckBox86 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.imageCheckBox158 ~= nil then self.imageCheckBox158:destroy(); self.imageCheckBox158 = nil; end;
        if self.imageCheckBox179 ~= nil then self.imageCheckBox179:destroy(); self.imageCheckBox179 = nil; end;
        if self.imageCheckBox220 ~= nil then self.imageCheckBox220:destroy(); self.imageCheckBox220 = nil; end;
        if self.imageCheckBox171 ~= nil then self.imageCheckBox171:destroy(); self.imageCheckBox171 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.imageCheckBox235 ~= nil then self.imageCheckBox235:destroy(); self.imageCheckBox235 = nil; end;
        if self.imageCheckBox204 ~= nil then self.imageCheckBox204:destroy(); self.imageCheckBox204 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.imageCheckBox250 ~= nil then self.imageCheckBox250:destroy(); self.imageCheckBox250 = nil; end;
        if self.imageCheckBox197 ~= nil then self.imageCheckBox197:destroy(); self.imageCheckBox197 = nil; end;
        if self.imageCheckBox294 ~= nil then self.imageCheckBox294:destroy(); self.imageCheckBox294 = nil; end;
        if self.imageCheckBox307 ~= nil then self.imageCheckBox307:destroy(); self.imageCheckBox307 = nil; end;
        if self.imageCheckBox242 ~= nil then self.imageCheckBox242:destroy(); self.imageCheckBox242 = nil; end;
        if self.imageCheckBox111 ~= nil then self.imageCheckBox111:destroy(); self.imageCheckBox111 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.imageCheckBox334 ~= nil then self.imageCheckBox334:destroy(); self.imageCheckBox334 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.imageCheckBox65 ~= nil then self.imageCheckBox65:destroy(); self.imageCheckBox65 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.imageCheckBox73 ~= nil then self.imageCheckBox73:destroy(); self.imageCheckBox73 = nil; end;
        if self.imageCheckBox211 ~= nil then self.imageCheckBox211:destroy(); self.imageCheckBox211 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.imageCheckBox355 ~= nil then self.imageCheckBox355:destroy(); self.imageCheckBox355 = nil; end;
        if self.imageCheckBox268 ~= nil then self.imageCheckBox268:destroy(); self.imageCheckBox268 = nil; end;
        if self.imageCheckBox96 ~= nil then self.imageCheckBox96:destroy(); self.imageCheckBox96 = nil; end;
        if self.imageCheckBox165 ~= nil then self.imageCheckBox165:destroy(); self.imageCheckBox165 = nil; end;
        if self.imageCheckBox105 ~= nil then self.imageCheckBox105:destroy(); self.imageCheckBox105 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.textEditor32 ~= nil then self.textEditor32:destroy(); self.textEditor32 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.imageCheckBox76 ~= nil then self.imageCheckBox76:destroy(); self.imageCheckBox76 = nil; end;
        if self.imageCheckBox237 ~= nil then self.imageCheckBox237:destroy(); self.imageCheckBox237 = nil; end;
        if self.imageCheckBox292 ~= nil then self.imageCheckBox292:destroy(); self.imageCheckBox292 = nil; end;
        if self.imageCheckBox347 ~= nil then self.imageCheckBox347:destroy(); self.imageCheckBox347 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.imageCheckBox308 ~= nil then self.imageCheckBox308:destroy(); self.imageCheckBox308 = nil; end;
        if self.imageCheckBox291 ~= nil then self.imageCheckBox291:destroy(); self.imageCheckBox291 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.imageCheckBox186 ~= nil then self.imageCheckBox186:destroy(); self.imageCheckBox186 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.textEditor42 ~= nil then self.textEditor42:destroy(); self.textEditor42 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.imageCheckBox195 ~= nil then self.imageCheckBox195:destroy(); self.imageCheckBox195 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.imageCheckBox149 ~= nil then self.imageCheckBox149:destroy(); self.imageCheckBox149 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.imageCheckBox328 ~= nil then self.imageCheckBox328:destroy(); self.imageCheckBox328 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.imageCheckBox344 ~= nil then self.imageCheckBox344:destroy(); self.imageCheckBox344 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.imageCheckBox295 ~= nil then self.imageCheckBox295:destroy(); self.imageCheckBox295 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.imageCheckBox45 ~= nil then self.imageCheckBox45:destroy(); self.imageCheckBox45 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.imageCheckBox283 ~= nil then self.imageCheckBox283:destroy(); self.imageCheckBox283 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.imageCheckBox215 ~= nil then self.imageCheckBox215:destroy(); self.imageCheckBox215 = nil; end;
        if self.imageCheckBox306 ~= nil then self.imageCheckBox306:destroy(); self.imageCheckBox306 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.imageCheckBox332 ~= nil then self.imageCheckBox332:destroy(); self.imageCheckBox332 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.imageCheckBox153 ~= nil then self.imageCheckBox153:destroy(); self.imageCheckBox153 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.imageCheckBox192 ~= nil then self.imageCheckBox192:destroy(); self.imageCheckBox192 = nil; end;
        if self.imageCheckBox320 ~= nil then self.imageCheckBox320:destroy(); self.imageCheckBox320 = nil; end;
        if self.imageCheckBox301 ~= nil then self.imageCheckBox301:destroy(); self.imageCheckBox301 = nil; end;
        if self.imageCheckBox244 ~= nil then self.imageCheckBox244:destroy(); self.imageCheckBox244 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.imageCheckBox138 ~= nil then self.imageCheckBox138:destroy(); self.imageCheckBox138 = nil; end;
        if self.imageCheckBox198 ~= nil then self.imageCheckBox198:destroy(); self.imageCheckBox198 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.frmSODLFillable1_svg ~= nil then self.frmSODLFillable1_svg:destroy(); self.frmSODLFillable1_svg = nil; end;
        if self.imageCheckBox101 ~= nil then self.imageCheckBox101:destroy(); self.imageCheckBox101 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.imageCheckBox199 ~= nil then self.imageCheckBox199:destroy(); self.imageCheckBox199 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.imageCheckBox258 ~= nil then self.imageCheckBox258:destroy(); self.imageCheckBox258 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.imageCheckBox267 ~= nil then self.imageCheckBox267:destroy(); self.imageCheckBox267 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.imageCheckBox130 ~= nil then self.imageCheckBox130:destroy(); self.imageCheckBox130 = nil; end;
        if self.imageCheckBox263 ~= nil then self.imageCheckBox263:destroy(); self.imageCheckBox263 = nil; end;
        if self.textEditor35 ~= nil then self.textEditor35:destroy(); self.textEditor35 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.imageCheckBox330 ~= nil then self.imageCheckBox330:destroy(); self.imageCheckBox330 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.imageCheckBox80 ~= nil then self.imageCheckBox80:destroy(); self.imageCheckBox80 = nil; end;
        if self.imageCheckBox229 ~= nil then self.imageCheckBox229:destroy(); self.imageCheckBox229 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.imageCheckBox119 ~= nil then self.imageCheckBox119:destroy(); self.imageCheckBox119 = nil; end;
        if self.imageCheckBox54 ~= nil then self.imageCheckBox54:destroy(); self.imageCheckBox54 = nil; end;
        if self.textEditor29 ~= nil then self.textEditor29:destroy(); self.textEditor29 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.imageCheckBox265 ~= nil then self.imageCheckBox265:destroy(); self.imageCheckBox265 = nil; end;
        if self.imageCheckBox293 ~= nil then self.imageCheckBox293:destroy(); self.imageCheckBox293 = nil; end;
        if self.imageCheckBox81 ~= nil then self.imageCheckBox81:destroy(); self.imageCheckBox81 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.imageCheckBox256 ~= nil then self.imageCheckBox256:destroy(); self.imageCheckBox256 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.imageCheckBox335 ~= nil then self.imageCheckBox335:destroy(); self.imageCheckBox335 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.imageCheckBox92 ~= nil then self.imageCheckBox92:destroy(); self.imageCheckBox92 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.imageCheckBox123 ~= nil then self.imageCheckBox123:destroy(); self.imageCheckBox123 = nil; end;
        if self.imageCheckBox234 ~= nil then self.imageCheckBox234:destroy(); self.imageCheckBox234 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.imageCheckBox238 ~= nil then self.imageCheckBox238:destroy(); self.imageCheckBox238 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.imageCheckBox184 ~= nil then self.imageCheckBox184:destroy(); self.imageCheckBox184 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox169 ~= nil then self.imageCheckBox169:destroy(); self.imageCheckBox169 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor26 ~= nil then self.textEditor26:destroy(); self.textEditor26 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.imageCheckBox66 ~= nil then self.imageCheckBox66:destroy(); self.imageCheckBox66 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.imageCheckBox82 ~= nil then self.imageCheckBox82:destroy(); self.imageCheckBox82 = nil; end;
        if self.imageCheckBox74 ~= nil then self.imageCheckBox74:destroy(); self.imageCheckBox74 = nil; end;
        if self.imageCheckBox134 ~= nil then self.imageCheckBox134:destroy(); self.imageCheckBox134 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.imageCheckBox217 ~= nil then self.imageCheckBox217:destroy(); self.imageCheckBox217 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.imageCheckBox146 ~= nil then self.imageCheckBox146:destroy(); self.imageCheckBox146 = nil; end;
        if self.imageCheckBox275 ~= nil then self.imageCheckBox275:destroy(); self.imageCheckBox275 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.imageCheckBox280 ~= nil then self.imageCheckBox280:destroy(); self.imageCheckBox280 = nil; end;
        if self.textEditor41 ~= nil then self.textEditor41:destroy(); self.textEditor41 = nil; end;
        if self.frmSODLFillable5_svg ~= nil then self.frmSODLFillable5_svg:destroy(); self.frmSODLFillable5_svg = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.imageCheckBox300 ~= nil then self.imageCheckBox300:destroy(); self.imageCheckBox300 = nil; end;
        if self.imageCheckBox95 ~= nil then self.imageCheckBox95:destroy(); self.imageCheckBox95 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.textEditor31 ~= nil then self.textEditor31:destroy(); self.textEditor31 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.imageCheckBox278 ~= nil then self.imageCheckBox278:destroy(); self.imageCheckBox278 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.imageCheckBox135 ~= nil then self.imageCheckBox135:destroy(); self.imageCheckBox135 = nil; end;
        if self.imageCheckBox206 ~= nil then self.imageCheckBox206:destroy(); self.imageCheckBox206 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.imageCheckBox120 ~= nil then self.imageCheckBox120:destroy(); self.imageCheckBox120 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.imageCheckBox48 ~= nil then self.imageCheckBox48:destroy(); self.imageCheckBox48 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.imageCheckBox162 ~= nil then self.imageCheckBox162:destroy(); self.imageCheckBox162 = nil; end;
        if self.textEditor33 ~= nil then self.textEditor33:destroy(); self.textEditor33 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.imageCheckBox139 ~= nil then self.imageCheckBox139:destroy(); self.imageCheckBox139 = nil; end;
        if self.imageCheckBox279 ~= nil then self.imageCheckBox279:destroy(); self.imageCheckBox279 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.imageCheckBox286 ~= nil then self.imageCheckBox286:destroy(); self.imageCheckBox286 = nil; end;
        if self.imageCheckBox297 ~= nil then self.imageCheckBox297:destroy(); self.imageCheckBox297 = nil; end;
        if self.textEditor39 ~= nil then self.textEditor39:destroy(); self.textEditor39 = nil; end;
        if self.imageCheckBox338 ~= nil then self.imageCheckBox338:destroy(); self.imageCheckBox338 = nil; end;
        if self.imageCheckBox102 ~= nil then self.imageCheckBox102:destroy(); self.imageCheckBox102 = nil; end;
        if self.imageCheckBox187 ~= nil then self.imageCheckBox187:destroy(); self.imageCheckBox187 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.frmSODLFillable4_svg ~= nil then self.frmSODLFillable4_svg:destroy(); self.frmSODLFillable4_svg = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.textEditor34 ~= nil then self.textEditor34:destroy(); self.textEditor34 = nil; end;
        if self.imageCheckBox163 ~= nil then self.imageCheckBox163:destroy(); self.imageCheckBox163 = nil; end;
        if self.imageCheckBox109 ~= nil then self.imageCheckBox109:destroy(); self.imageCheckBox109 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.imageCheckBox223 ~= nil then self.imageCheckBox223:destroy(); self.imageCheckBox223 = nil; end;
        if self.imageCheckBox266 ~= nil then self.imageCheckBox266:destroy(); self.imageCheckBox266 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.imageCheckBox35 ~= nil then self.imageCheckBox35:destroy(); self.imageCheckBox35 = nil; end;
        if self.imageCheckBox272 ~= nil then self.imageCheckBox272:destroy(); self.imageCheckBox272 = nil; end;
        if self.imageCheckBox323 ~= nil then self.imageCheckBox323:destroy(); self.imageCheckBox323 = nil; end;
        if self.frmSODLFillable3_svg ~= nil then self.frmSODLFillable3_svg:destroy(); self.frmSODLFillable3_svg = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.imageCheckBox245 ~= nil then self.imageCheckBox245:destroy(); self.imageCheckBox245 = nil; end;
        if self.imageCheckBox164 ~= nil then self.imageCheckBox164:destroy(); self.imageCheckBox164 = nil; end;
        if self.imageCheckBox303 ~= nil then self.imageCheckBox303:destroy(); self.imageCheckBox303 = nil; end;
        if self.imageCheckBox160 ~= nil then self.imageCheckBox160:destroy(); self.imageCheckBox160 = nil; end;
        if self.imageCheckBox259 ~= nil then self.imageCheckBox259:destroy(); self.imageCheckBox259 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.imageCheckBox88 ~= nil then self.imageCheckBox88:destroy(); self.imageCheckBox88 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.imageCheckBox114 ~= nil then self.imageCheckBox114:destroy(); self.imageCheckBox114 = nil; end;
        if self.imageCheckBox327 ~= nil then self.imageCheckBox327:destroy(); self.imageCheckBox327 = nil; end;
        if self.imageCheckBox329 ~= nil then self.imageCheckBox329:destroy(); self.imageCheckBox329 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.imageCheckBox342 ~= nil then self.imageCheckBox342:destroy(); self.imageCheckBox342 = nil; end;
        if self.imageCheckBox43 ~= nil then self.imageCheckBox43:destroy(); self.imageCheckBox43 = nil; end;
        if self.imageCheckBox202 ~= nil then self.imageCheckBox202:destroy(); self.imageCheckBox202 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.imageCheckBox226 ~= nil then self.imageCheckBox226:destroy(); self.imageCheckBox226 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.imageCheckBox348 ~= nil then self.imageCheckBox348:destroy(); self.imageCheckBox348 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.imageCheckBox276 ~= nil then self.imageCheckBox276:destroy(); self.imageCheckBox276 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.imageCheckBox61 ~= nil then self.imageCheckBox61:destroy(); self.imageCheckBox61 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.imageCheckBox75 ~= nil then self.imageCheckBox75:destroy(); self.imageCheckBox75 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.textEditor37 ~= nil then self.textEditor37:destroy(); self.textEditor37 = nil; end;
        if self.imageCheckBox51 ~= nil then self.imageCheckBox51:destroy(); self.imageCheckBox51 = nil; end;
        if self.imageCheckBox44 ~= nil then self.imageCheckBox44:destroy(); self.imageCheckBox44 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.imageCheckBox353 ~= nil then self.imageCheckBox353:destroy(); self.imageCheckBox353 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.imageCheckBox270 ~= nil then self.imageCheckBox270:destroy(); self.imageCheckBox270 = nil; end;
        if self.imageCheckBox64 ~= nil then self.imageCheckBox64:destroy(); self.imageCheckBox64 = nil; end;
        if self.imageCheckBox161 ~= nil then self.imageCheckBox161:destroy(); self.imageCheckBox161 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.imageCheckBox274 ~= nil then self.imageCheckBox274:destroy(); self.imageCheckBox274 = nil; end;
        if self.imageCheckBox281 ~= nil then self.imageCheckBox281:destroy(); self.imageCheckBox281 = nil; end;
        if self.imageCheckBox60 ~= nil then self.imageCheckBox60:destroy(); self.imageCheckBox60 = nil; end;
        if self.imageCheckBox52 ~= nil then self.imageCheckBox52:destroy(); self.imageCheckBox52 = nil; end;
        if self.imageCheckBox77 ~= nil then self.imageCheckBox77:destroy(); self.imageCheckBox77 = nil; end;
        if self.imageCheckBox121 ~= nil then self.imageCheckBox121:destroy(); self.imageCheckBox121 = nil; end;
        if self.imageCheckBox152 ~= nil then self.imageCheckBox152:destroy(); self.imageCheckBox152 = nil; end;
        if self.imageCheckBox170 ~= nil then self.imageCheckBox170:destroy(); self.imageCheckBox170 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.imageCheckBox201 ~= nil then self.imageCheckBox201:destroy(); self.imageCheckBox201 = nil; end;
        if self.imageCheckBox203 ~= nil then self.imageCheckBox203:destroy(); self.imageCheckBox203 = nil; end;
        if self.imageCheckBox254 ~= nil then self.imageCheckBox254:destroy(); self.imageCheckBox254 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.imageCheckBox113 ~= nil then self.imageCheckBox113:destroy(); self.imageCheckBox113 = nil; end;
        if self.imageCheckBox359 ~= nil then self.imageCheckBox359:destroy(); self.imageCheckBox359 = nil; end;
        if self.imageCheckBox89 ~= nil then self.imageCheckBox89:destroy(); self.imageCheckBox89 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.textEditor44 ~= nil then self.textEditor44:destroy(); self.textEditor44 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.imageCheckBox69 ~= nil then self.imageCheckBox69:destroy(); self.imageCheckBox69 = nil; end;
        if self.imageCheckBox319 ~= nil then self.imageCheckBox319:destroy(); self.imageCheckBox319 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.imageCheckBox317 ~= nil then self.imageCheckBox317:destroy(); self.imageCheckBox317 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.imageCheckBox46 ~= nil then self.imageCheckBox46:destroy(); self.imageCheckBox46 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.imageCheckBox188 ~= nil then self.imageCheckBox188:destroy(); self.imageCheckBox188 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.imageCheckBox209 ~= nil then self.imageCheckBox209:destroy(); self.imageCheckBox209 = nil; end;
        if self.imageCheckBox178 ~= nil then self.imageCheckBox178:destroy(); self.imageCheckBox178 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.imageCheckBox218 ~= nil then self.imageCheckBox218:destroy(); self.imageCheckBox218 = nil; end;
        if self.imageCheckBox228 ~= nil then self.imageCheckBox228:destroy(); self.imageCheckBox228 = nil; end;
        if self.imageCheckBox177 ~= nil then self.imageCheckBox177:destroy(); self.imageCheckBox177 = nil; end;
        if self.imageCheckBox261 ~= nil then self.imageCheckBox261:destroy(); self.imageCheckBox261 = nil; end;
        if self.imageCheckBox284 ~= nil then self.imageCheckBox284:destroy(); self.imageCheckBox284 = nil; end;
        if self.imageCheckBox132 ~= nil then self.imageCheckBox132:destroy(); self.imageCheckBox132 = nil; end;
        if self.imageCheckBox321 ~= nil then self.imageCheckBox321:destroy(); self.imageCheckBox321 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.imageCheckBox97 ~= nil then self.imageCheckBox97:destroy(); self.imageCheckBox97 = nil; end;
        if self.imageCheckBox147 ~= nil then self.imageCheckBox147:destroy(); self.imageCheckBox147 = nil; end;
        if self.imageCheckBox100 ~= nil then self.imageCheckBox100:destroy(); self.imageCheckBox100 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.imageCheckBox144 ~= nil then self.imageCheckBox144:destroy(); self.imageCheckBox144 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.imageCheckBox236 ~= nil then self.imageCheckBox236:destroy(); self.imageCheckBox236 = nil; end;
        if self.imageCheckBox299 ~= nil then self.imageCheckBox299:destroy(); self.imageCheckBox299 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.imageCheckBox151 ~= nil then self.imageCheckBox151:destroy(); self.imageCheckBox151 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.imageCheckBox49 ~= nil then self.imageCheckBox49:destroy(); self.imageCheckBox49 = nil; end;
        if self.imageCheckBox243 ~= nil then self.imageCheckBox243:destroy(); self.imageCheckBox243 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.imageCheckBox212 ~= nil then self.imageCheckBox212:destroy(); self.imageCheckBox212 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.imageCheckBox70 ~= nil then self.imageCheckBox70:destroy(); self.imageCheckBox70 = nil; end;
        if self.imageCheckBox140 ~= nil then self.imageCheckBox140:destroy(); self.imageCheckBox140 = nil; end;
        if self.imageCheckBox221 ~= nil then self.imageCheckBox221:destroy(); self.imageCheckBox221 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.imageCheckBox282 ~= nil then self.imageCheckBox282:destroy(); self.imageCheckBox282 = nil; end;
        if self.imageCheckBox53 ~= nil then self.imageCheckBox53:destroy(); self.imageCheckBox53 = nil; end;
        if self.imageCheckBox216 ~= nil then self.imageCheckBox216:destroy(); self.imageCheckBox216 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.imageCheckBox57 ~= nil then self.imageCheckBox57:destroy(); self.imageCheckBox57 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.imageCheckBox143 ~= nil then self.imageCheckBox143:destroy(); self.imageCheckBox143 = nil; end;
        if self.imageCheckBox273 ~= nil then self.imageCheckBox273:destroy(); self.imageCheckBox273 = nil; end;
        if self.imageCheckBox84 ~= nil then self.imageCheckBox84:destroy(); self.imageCheckBox84 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.imageCheckBox269 ~= nil then self.imageCheckBox269:destroy(); self.imageCheckBox269 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.imageCheckBox277 ~= nil then self.imageCheckBox277:destroy(); self.imageCheckBox277 = nil; end;
        if self.imageCheckBox311 ~= nil then self.imageCheckBox311:destroy(); self.imageCheckBox311 = nil; end;
        if self.imageCheckBox312 ~= nil then self.imageCheckBox312:destroy(); self.imageCheckBox312 = nil; end;
        if self.imageCheckBox356 ~= nil then self.imageCheckBox356:destroy(); self.imageCheckBox356 = nil; end;
        if self.imageCheckBox108 ~= nil then self.imageCheckBox108:destroy(); self.imageCheckBox108 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.imageCheckBox240 ~= nil then self.imageCheckBox240:destroy(); self.imageCheckBox240 = nil; end;
        if self.imageCheckBox324 ~= nil then self.imageCheckBox324:destroy(); self.imageCheckBox324 = nil; end;
        if self.imageCheckBox257 ~= nil then self.imageCheckBox257:destroy(); self.imageCheckBox257 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.textEditor28 ~= nil then self.textEditor28:destroy(); self.textEditor28 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.imageCheckBox122 ~= nil then self.imageCheckBox122:destroy(); self.imageCheckBox122 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.imageCheckBox47 ~= nil then self.imageCheckBox47:destroy(); self.imageCheckBox47 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.imageCheckBox72 ~= nil then self.imageCheckBox72:destroy(); self.imageCheckBox72 = nil; end;
        if self.imageCheckBox230 ~= nil then self.imageCheckBox230:destroy(); self.imageCheckBox230 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.imageCheckBox183 ~= nil then self.imageCheckBox183:destroy(); self.imageCheckBox183 = nil; end;
        if self.imageCheckBox98 ~= nil then self.imageCheckBox98:destroy(); self.imageCheckBox98 = nil; end;
        if self.imageCheckBox40 ~= nil then self.imageCheckBox40:destroy(); self.imageCheckBox40 = nil; end;
        if self.imageCheckBox310 ~= nil then self.imageCheckBox310:destroy(); self.imageCheckBox310 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.imageCheckBox232 ~= nil then self.imageCheckBox232:destroy(); self.imageCheckBox232 = nil; end;
        if self.imageCheckBox167 ~= nil then self.imageCheckBox167:destroy(); self.imageCheckBox167 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSODLSheet()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSODLSheet();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSODLSheet = {
    newEditor = newfrmSODLSheet, 
    new = newfrmSODLSheet, 
    name = "frmSODLSheet", 
    dataType = "Valk_Data", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "SODLSheet", 
    description=""};

frmSODLSheet = _frmSODLSheet;
Firecast.registrarForm(_frmSODLSheet);
Firecast.registrarDataType(_frmSODLSheet);

return _frmSODLSheet;
