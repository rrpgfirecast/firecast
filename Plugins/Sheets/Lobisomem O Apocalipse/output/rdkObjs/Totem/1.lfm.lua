require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmtotem1_svg()
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
    obj:setName("frmtotem1_svg");
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
    obj.image1:setSRC("/Totem/images/t.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(133);
    obj.layout1:setTop(680);
    obj.layout1:setWidth(537);
    obj.layout1:setHeight(112);
    obj.layout1:setName("layout1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(21.9);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setWidth(537);
    obj.textEditor1:setHeight(113);
    obj.textEditor1:setField("Caractersticas_1");
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(701);
    obj.layout2:setTop(677);
    obj.layout2:setWidth(429);
    obj.layout2:setHeight(34);
    obj.layout2:setName("layout2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(21.9);
    obj.edit1:setFontColor("#000000");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(429);
    obj.edit1:setHeight(35);
    obj.edit1:setField("OOOOO");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(701);
    obj.layout3:setTop(713);
    obj.layout3:setWidth(429);
    obj.layout3:setHeight(31);
    obj.layout3:setName("layout3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(21.1);
    obj.edit2:setFontColor("#000000");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(0);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(429);
    obj.edit2:setHeight(32);
    obj.edit2:setField("OOOOO_2");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(701);
    obj.layout4:setTop(745);
    obj.layout4:setWidth(429);
    obj.layout4:setHeight(31);
    obj.layout4:setName("layout4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(21.1);
    obj.edit3:setFontColor("#000000");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(0);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(429);
    obj.edit3:setHeight(32);
    obj.edit3:setField("OOOOO_3");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(701);
    obj.layout5:setTop(778);
    obj.layout5:setWidth(429);
    obj.layout5:setHeight(32);
    obj.layout5:setName("layout5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(21.8);
    obj.edit4:setFontColor("#000000");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(0);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(429);
    obj.edit4:setHeight(33);
    obj.edit4:setField("OOOOO_4");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(701);
    obj.layout6:setTop(811);
    obj.layout6:setWidth(429);
    obj.layout6:setHeight(31);
    obj.layout6:setName("layout6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(21.1);
    obj.edit5:setFontColor("#000000");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(0);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(429);
    obj.edit5:setHeight(32);
    obj.edit5:setField("OOOOO_5");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(133);
    obj.layout7:setTop(870);
    obj.layout7:setWidth(537);
    obj.layout7:setHeight(105);
    obj.layout7:setName("layout7");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout7);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(21.9);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(537);
    obj.textEditor2:setHeight(106);
    obj.textEditor2:setField("Dogma_1");
    obj.textEditor2:setName("textEditor2");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(701);
    obj.layout8:setTop(844);
    obj.layout8:setWidth(429);
    obj.layout8:setHeight(31);
    obj.layout8:setName("layout8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(21.1);
    obj.edit6:setFontColor("#000000");
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(429);
    obj.edit6:setHeight(32);
    obj.edit6:setField("OOOOO_6");
    obj.edit6:setName("edit6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setLeft(701);
    obj.layout9:setTop(877);
    obj.layout9:setWidth(429);
    obj.layout9:setHeight(31);
    obj.layout9:setName("layout9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(21.1);
    obj.edit7:setFontColor("#000000");
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(0);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(429);
    obj.edit7:setHeight(32);
    obj.edit7:setField("OOOOO_7");
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setLeft(701);
    obj.layout10:setTop(910);
    obj.layout10:setWidth(429);
    obj.layout10:setHeight(31);
    obj.layout10:setName("layout10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(21.1);
    obj.edit8:setFontColor("#000000");
    obj.edit8:setHorzTextAlign("leading");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(0);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(429);
    obj.edit8:setHeight(32);
    obj.edit8:setField("OOOOO_8");
    obj.edit8:setName("edit8");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setLeft(701);
    obj.layout11:setTop(943);
    obj.layout11:setWidth(429);
    obj.layout11:setHeight(31);
    obj.layout11:setName("layout11");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout11);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(21.1);
    obj.edit9:setFontColor("#000000");
    obj.edit9:setHorzTextAlign("leading");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(0);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(429);
    obj.edit9:setHeight(32);
    obj.edit9:setField("OOOOO_9");
    obj.edit9:setName("edit9");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle1);
    obj.layout12:setLeft(136);
    obj.layout12:setTop(1037);
    obj.layout12:setWidth(343);
    obj.layout12:setHeight(34);
    obj.layout12:setName("layout12");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout12);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(21.9);
    obj.edit10:setFontColor("#000000");
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(0);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(343);
    obj.edit10:setHeight(35);
    obj.edit10:setField("_1aaa");
    obj.edit10:setName("edit10");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle1);
    obj.layout13:setLeft(136);
    obj.layout13:setTop(1072);
    obj.layout13:setWidth(343);
    obj.layout13:setHeight(34);
    obj.layout13:setName("layout13");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout13);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(21.9);
    obj.edit11:setFontColor("#000000");
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(343);
    obj.edit11:setHeight(35);
    obj.edit11:setField("_2d");
    obj.edit11:setName("edit11");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle1);
    obj.layout14:setLeft(136);
    obj.layout14:setTop(1107);
    obj.layout14:setWidth(343);
    obj.layout14:setHeight(34);
    obj.layout14:setName("layout14");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout14);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontSize(21.9);
    obj.edit12:setFontColor("#000000");
    obj.edit12:setHorzTextAlign("leading");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(0);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(343);
    obj.edit12:setHeight(35);
    obj.edit12:setField("_3");
    obj.edit12:setName("edit12");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle1);
    obj.layout15:setLeft(136);
    obj.layout15:setTop(1142);
    obj.layout15:setWidth(343);
    obj.layout15:setHeight(34);
    obj.layout15:setName("layout15");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout15);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(21.9);
    obj.edit13:setFontColor("#000000");
    obj.edit13:setHorzTextAlign("leading");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(0);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(343);
    obj.edit13:setHeight(35);
    obj.edit13:setField("_4aaaaaa");
    obj.edit13:setName("edit13");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle1);
    obj.layout16:setLeft(514);
    obj.layout16:setTop(1037);
    obj.layout16:setWidth(343);
    obj.layout16:setHeight(34);
    obj.layout16:setName("layout16");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout16);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(21.9);
    obj.edit14:setFontColor("#000000");
    obj.edit14:setHorzTextAlign("leading");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(0);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(343);
    obj.edit14:setHeight(35);
    obj.edit14:setField("_1_2b");
    obj.edit14:setName("edit14");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle1);
    obj.layout17:setLeft(514);
    obj.layout17:setTop(1072);
    obj.layout17:setWidth(343);
    obj.layout17:setHeight(34);
    obj.layout17:setName("layout17");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout17);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(21.9);
    obj.edit15:setFontColor("#000000");
    obj.edit15:setHorzTextAlign("leading");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(0);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(343);
    obj.edit15:setHeight(35);
    obj.edit15:setField("_2_2aaaaa");
    obj.edit15:setName("edit15");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle1);
    obj.layout18:setLeft(514);
    obj.layout18:setTop(1107);
    obj.layout18:setWidth(343);
    obj.layout18:setHeight(34);
    obj.layout18:setName("layout18");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout18);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontSize(21.9);
    obj.edit16:setFontColor("#000000");
    obj.edit16:setHorzTextAlign("leading");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(343);
    obj.edit16:setHeight(35);
    obj.edit16:setField("_3_2");
    obj.edit16:setName("edit16");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle1);
    obj.layout19:setLeft(514);
    obj.layout19:setTop(1142);
    obj.layout19:setWidth(343);
    obj.layout19:setHeight(34);
    obj.layout19:setName("layout19");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout19);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontSize(21.9);
    obj.edit17:setFontColor("#000000");
    obj.edit17:setHorzTextAlign("leading");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(0);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(343);
    obj.edit17:setHeight(35);
    obj.edit17:setField("_4_2");
    obj.edit17:setName("edit17");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle1);
    obj.layout20:setLeft(892);
    obj.layout20:setTop(1037);
    obj.layout20:setWidth(343);
    obj.layout20:setHeight(34);
    obj.layout20:setName("layout20");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout20);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(21.9);
    obj.edit18:setFontColor("#000000");
    obj.edit18:setHorzTextAlign("leading");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(0);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(343);
    obj.edit18:setHeight(35);
    obj.edit18:setField("_1_3c");
    obj.edit18:setName("edit18");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle1);
    obj.layout21:setLeft(892);
    obj.layout21:setTop(1072);
    obj.layout21:setWidth(343);
    obj.layout21:setHeight(34);
    obj.layout21:setName("layout21");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout21);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontSize(21.9);
    obj.edit19:setFontColor("#000000");
    obj.edit19:setHorzTextAlign("leading");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(0);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(343);
    obj.edit19:setHeight(35);
    obj.edit19:setField("_2_3");
    obj.edit19:setName("edit19");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle1);
    obj.layout22:setLeft(892);
    obj.layout22:setTop(1107);
    obj.layout22:setWidth(343);
    obj.layout22:setHeight(34);
    obj.layout22:setName("layout22");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout22);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(21.9);
    obj.edit20:setFontColor("#000000");
    obj.edit20:setHorzTextAlign("leading");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(0);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(343);
    obj.edit20:setHeight(35);
    obj.edit20:setField("_3_3");
    obj.edit20:setName("edit20");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle1);
    obj.layout23:setLeft(892);
    obj.layout23:setTop(1142);
    obj.layout23:setWidth(343);
    obj.layout23:setHeight(34);
    obj.layout23:setName("layout23");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout23);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(21.9);
    obj.edit21:setFontColor("#000000");
    obj.edit21:setHorzTextAlign("leading");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(343);
    obj.edit21:setHeight(35);
    obj.edit21:setField("_4_3");
    obj.edit21:setName("edit21");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle1);
    obj.layout24:setLeft(136);
    obj.layout24:setTop(1286);
    obj.layout24:setWidth(343);
    obj.layout24:setHeight(284);
    obj.layout24:setName("layout24");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout24);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontSize(21.9);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setWidth(343);
    obj.textEditor3:setHeight(285);
    obj.textEditor3:setField("Outras_Caractersticas_1");
    obj.textEditor3:setName("textEditor3");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle1);
    obj.layout25:setLeft(133);
    obj.layout25:setTop(1632);
    obj.layout25:setWidth(1105);
    obj.layout25:setHeight(185);
    obj.layout25:setName("layout25");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout25);
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setFontSize(21.9);
    obj.textEditor4:setFontColor("#000000");
    obj.textEditor4:setWidth(1105);
    obj.textEditor4:setHeight(185);
    obj.textEditor4:setField("Descri_o_1");
    obj.textEditor4:setName("textEditor4");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle1);
    obj.layout26:setLeft(892);
    obj.layout26:setTop(1291);
    obj.layout26:setWidth(22);
    obj.layout26:setHeight(26);
    obj.layout26:setName("layout26");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout26);
    obj.imageCheckBox1:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox1:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox1:setAlign("client");
    obj.imageCheckBox1:setLeft(0);
    obj.imageCheckBox1:setTop(0);
    obj.imageCheckBox1:setWidth(22);
    obj.imageCheckBox1:setHeight(27);
    obj.imageCheckBox1:setField("ess1_0");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle1);
    obj.layout27:setLeft(1211);
    obj.layout27:setTop(1291);
    obj.layout27:setWidth(22);
    obj.layout27:setHeight(26);
    obj.layout27:setName("layout27");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout27);
    obj.imageCheckBox2:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox2:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox2:setAlign("client");
    obj.imageCheckBox2:setLeft(0);
    obj.imageCheckBox2:setTop(0);
    obj.imageCheckBox2:setWidth(22);
    obj.imageCheckBox2:setHeight(27);
    obj.imageCheckBox2:setField("ess2_0");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28:setLeft(927);
    obj.layout28:setTop(1291);
    obj.layout28:setWidth(22);
    obj.layout28:setHeight(26);
    obj.layout28:setName("layout28");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout28);
    obj.imageCheckBox3:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox3:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox3:setAlign("client");
    obj.imageCheckBox3:setLeft(0);
    obj.imageCheckBox3:setTop(0);
    obj.imageCheckBox3:setWidth(22);
    obj.imageCheckBox3:setHeight(27);
    obj.imageCheckBox3:setField("ess3_0");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle1);
    obj.layout29:setLeft(963);
    obj.layout29:setTop(1291);
    obj.layout29:setWidth(22);
    obj.layout29:setHeight(26);
    obj.layout29:setName("layout29");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout29);
    obj.imageCheckBox4:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox4:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox4:setAlign("client");
    obj.imageCheckBox4:setLeft(0);
    obj.imageCheckBox4:setTop(0);
    obj.imageCheckBox4:setWidth(22);
    obj.imageCheckBox4:setHeight(27);
    obj.imageCheckBox4:setField("ess4_0");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle1);
    obj.layout30:setLeft(999);
    obj.layout30:setTop(1291);
    obj.layout30:setWidth(22);
    obj.layout30:setHeight(26);
    obj.layout30:setName("layout30");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout30);
    obj.imageCheckBox5:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox5:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox5:setAlign("client");
    obj.imageCheckBox5:setLeft(0);
    obj.imageCheckBox5:setTop(0);
    obj.imageCheckBox5:setWidth(22);
    obj.imageCheckBox5:setHeight(27);
    obj.imageCheckBox5:setField("ess5_0");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle1);
    obj.layout31:setLeft(1035);
    obj.layout31:setTop(1291);
    obj.layout31:setWidth(22);
    obj.layout31:setHeight(26);
    obj.layout31:setName("layout31");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout31);
    obj.imageCheckBox6:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox6:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox6:setAlign("client");
    obj.imageCheckBox6:setLeft(0);
    obj.imageCheckBox6:setTop(0);
    obj.imageCheckBox6:setWidth(22);
    obj.imageCheckBox6:setHeight(27);
    obj.imageCheckBox6:setField("ess6_0");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle1);
    obj.layout32:setLeft(1069);
    obj.layout32:setTop(1292);
    obj.layout32:setWidth(22);
    obj.layout32:setHeight(26);
    obj.layout32:setName("layout32");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout32);
    obj.imageCheckBox7:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox7:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox7:setAlign("client");
    obj.imageCheckBox7:setLeft(0);
    obj.imageCheckBox7:setTop(0);
    obj.imageCheckBox7:setWidth(22);
    obj.imageCheckBox7:setHeight(27);
    obj.imageCheckBox7:setField("ess7_0");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle1);
    obj.layout33:setLeft(1103);
    obj.layout33:setTop(1291);
    obj.layout33:setWidth(22);
    obj.layout33:setHeight(26);
    obj.layout33:setName("layout33");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout33);
    obj.imageCheckBox8:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox8:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox8:setAlign("client");
    obj.imageCheckBox8:setLeft(0);
    obj.imageCheckBox8:setTop(0);
    obj.imageCheckBox8:setWidth(22);
    obj.imageCheckBox8:setHeight(27);
    obj.imageCheckBox8:setField("ess8_0");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle1);
    obj.layout34:setLeft(1139);
    obj.layout34:setTop(1291);
    obj.layout34:setWidth(22);
    obj.layout34:setHeight(26);
    obj.layout34:setName("layout34");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.layout34);
    obj.imageCheckBox9:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox9:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox9:setAlign("client");
    obj.imageCheckBox9:setLeft(0);
    obj.imageCheckBox9:setTop(0);
    obj.imageCheckBox9:setWidth(22);
    obj.imageCheckBox9:setHeight(27);
    obj.imageCheckBox9:setField("ess9_0");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle1);
    obj.layout35:setLeft(1175);
    obj.layout35:setTop(1290);
    obj.layout35:setWidth(22);
    obj.layout35:setHeight(26);
    obj.layout35:setName("layout35");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.layout35);
    obj.imageCheckBox10:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox10:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox10:setAlign("client");
    obj.imageCheckBox10:setLeft(0);
    obj.imageCheckBox10:setTop(0);
    obj.imageCheckBox10:setWidth(22);
    obj.imageCheckBox10:setHeight(27);
    obj.imageCheckBox10:setField("ess10_0");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle1);
    obj.layout36:setLeft(892);
    obj.layout36:setTop(1323);
    obj.layout36:setWidth(22);
    obj.layout36:setHeight(26);
    obj.layout36:setName("layout36");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.layout36);
    obj.imageCheckBox11:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox11:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox11:setAlign("client");
    obj.imageCheckBox11:setLeft(0);
    obj.imageCheckBox11:setTop(0);
    obj.imageCheckBox11:setWidth(22);
    obj.imageCheckBox11:setHeight(27);
    obj.imageCheckBox11:setField("ess1_1_0");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle1);
    obj.layout37:setLeft(1212);
    obj.layout37:setTop(1323);
    obj.layout37:setWidth(22);
    obj.layout37:setHeight(26);
    obj.layout37:setName("layout37");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.layout37);
    obj.imageCheckBox12:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox12:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox12:setAlign("client");
    obj.imageCheckBox12:setLeft(0);
    obj.imageCheckBox12:setTop(0);
    obj.imageCheckBox12:setWidth(22);
    obj.imageCheckBox12:setHeight(27);
    obj.imageCheckBox12:setField("ess2_1_0");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle1);
    obj.layout38:setLeft(928);
    obj.layout38:setTop(1323);
    obj.layout38:setWidth(22);
    obj.layout38:setHeight(26);
    obj.layout38:setName("layout38");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.layout38);
    obj.imageCheckBox13:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox13:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox13:setAlign("client");
    obj.imageCheckBox13:setLeft(0);
    obj.imageCheckBox13:setTop(0);
    obj.imageCheckBox13:setWidth(22);
    obj.imageCheckBox13:setHeight(27);
    obj.imageCheckBox13:setField("ess3_1_0");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle1);
    obj.layout39:setLeft(964);
    obj.layout39:setTop(1323);
    obj.layout39:setWidth(22);
    obj.layout39:setHeight(26);
    obj.layout39:setName("layout39");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.layout39);
    obj.imageCheckBox14:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox14:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox14:setAlign("client");
    obj.imageCheckBox14:setLeft(0);
    obj.imageCheckBox14:setTop(0);
    obj.imageCheckBox14:setWidth(22);
    obj.imageCheckBox14:setHeight(27);
    obj.imageCheckBox14:setField("ess4_1_0");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle1);
    obj.layout40:setLeft(999);
    obj.layout40:setTop(1323);
    obj.layout40:setWidth(22);
    obj.layout40:setHeight(26);
    obj.layout40:setName("layout40");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.layout40);
    obj.imageCheckBox15:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox15:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox15:setAlign("client");
    obj.imageCheckBox15:setLeft(0);
    obj.imageCheckBox15:setTop(0);
    obj.imageCheckBox15:setWidth(22);
    obj.imageCheckBox15:setHeight(27);
    obj.imageCheckBox15:setField("ess5_1_0");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle1);
    obj.layout41:setLeft(1036);
    obj.layout41:setTop(1323);
    obj.layout41:setWidth(22);
    obj.layout41:setHeight(26);
    obj.layout41:setName("layout41");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.layout41);
    obj.imageCheckBox16:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox16:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox16:setAlign("client");
    obj.imageCheckBox16:setLeft(0);
    obj.imageCheckBox16:setTop(0);
    obj.imageCheckBox16:setWidth(22);
    obj.imageCheckBox16:setHeight(27);
    obj.imageCheckBox16:setField("ess6_1_0");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle1);
    obj.layout42:setLeft(1070);
    obj.layout42:setTop(1323);
    obj.layout42:setWidth(22);
    obj.layout42:setHeight(26);
    obj.layout42:setName("layout42");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.layout42);
    obj.imageCheckBox17:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox17:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox17:setAlign("client");
    obj.imageCheckBox17:setLeft(0);
    obj.imageCheckBox17:setTop(0);
    obj.imageCheckBox17:setWidth(22);
    obj.imageCheckBox17:setHeight(27);
    obj.imageCheckBox17:setField("ess7_1_0");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle1);
    obj.layout43:setLeft(1104);
    obj.layout43:setTop(1323);
    obj.layout43:setWidth(22);
    obj.layout43:setHeight(26);
    obj.layout43:setName("layout43");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.layout43);
    obj.imageCheckBox18:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox18:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox18:setAlign("client");
    obj.imageCheckBox18:setLeft(0);
    obj.imageCheckBox18:setTop(0);
    obj.imageCheckBox18:setWidth(22);
    obj.imageCheckBox18:setHeight(27);
    obj.imageCheckBox18:setField("ess8_1_0");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle1);
    obj.layout44:setLeft(1140);
    obj.layout44:setTop(1323);
    obj.layout44:setWidth(22);
    obj.layout44:setHeight(26);
    obj.layout44:setName("layout44");

    obj.imageCheckBox19 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.layout44);
    obj.imageCheckBox19:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox19:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox19:setAlign("client");
    obj.imageCheckBox19:setLeft(0);
    obj.imageCheckBox19:setTop(0);
    obj.imageCheckBox19:setWidth(22);
    obj.imageCheckBox19:setHeight(27);
    obj.imageCheckBox19:setField("ess9_1_0");
    obj.imageCheckBox19:setName("imageCheckBox19");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle1);
    obj.layout45:setLeft(1175);
    obj.layout45:setTop(1322);
    obj.layout45:setWidth(22);
    obj.layout45:setHeight(26);
    obj.layout45:setName("layout45");

    obj.imageCheckBox20 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.layout45);
    obj.imageCheckBox20:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox20:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox20:setAlign("client");
    obj.imageCheckBox20:setLeft(0);
    obj.imageCheckBox20:setTop(0);
    obj.imageCheckBox20:setWidth(22);
    obj.imageCheckBox20:setHeight(27);
    obj.imageCheckBox20:setField("ess10_1_0");
    obj.imageCheckBox20:setName("imageCheckBox20");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle1);
    obj.layout46:setLeft(892);
    obj.layout46:setTop(1351);
    obj.layout46:setWidth(22);
    obj.layout46:setHeight(26);
    obj.layout46:setName("layout46");

    obj.imageCheckBox21 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.layout46);
    obj.imageCheckBox21:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox21:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox21:setAlign("client");
    obj.imageCheckBox21:setLeft(0);
    obj.imageCheckBox21:setTop(0);
    obj.imageCheckBox21:setWidth(22);
    obj.imageCheckBox21:setHeight(27);
    obj.imageCheckBox21:setField("ess1_1_1");
    obj.imageCheckBox21:setName("imageCheckBox21");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle1);
    obj.layout47:setLeft(892);
    obj.layout47:setTop(1380);
    obj.layout47:setWidth(22);
    obj.layout47:setHeight(26);
    obj.layout47:setName("layout47");

    obj.imageCheckBox22 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.layout47);
    obj.imageCheckBox22:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox22:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox22:setAlign("client");
    obj.imageCheckBox22:setLeft(0);
    obj.imageCheckBox22:setTop(0);
    obj.imageCheckBox22:setWidth(22);
    obj.imageCheckBox22:setHeight(27);
    obj.imageCheckBox22:setField("ess1_1_2");
    obj.imageCheckBox22:setName("imageCheckBox22");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle1);
    obj.layout48:setLeft(892);
    obj.layout48:setTop(1411);
    obj.layout48:setWidth(22);
    obj.layout48:setHeight(26);
    obj.layout48:setName("layout48");

    obj.imageCheckBox23 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.layout48);
    obj.imageCheckBox23:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox23:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox23:setAlign("client");
    obj.imageCheckBox23:setLeft(0);
    obj.imageCheckBox23:setTop(0);
    obj.imageCheckBox23:setWidth(22);
    obj.imageCheckBox23:setHeight(27);
    obj.imageCheckBox23:setField("ess1_1_3");
    obj.imageCheckBox23:setName("imageCheckBox23");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle1);
    obj.layout49:setLeft(892);
    obj.layout49:setTop(1441);
    obj.layout49:setWidth(22);
    obj.layout49:setHeight(26);
    obj.layout49:setName("layout49");

    obj.imageCheckBox24 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.layout49);
    obj.imageCheckBox24:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox24:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox24:setAlign("client");
    obj.imageCheckBox24:setLeft(0);
    obj.imageCheckBox24:setTop(0);
    obj.imageCheckBox24:setWidth(22);
    obj.imageCheckBox24:setHeight(27);
    obj.imageCheckBox24:setField("ess1_1_4");
    obj.imageCheckBox24:setName("imageCheckBox24");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle1);
    obj.layout50:setLeft(892);
    obj.layout50:setTop(1472);
    obj.layout50:setWidth(22);
    obj.layout50:setHeight(26);
    obj.layout50:setName("layout50");

    obj.imageCheckBox25 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout50);
    obj.imageCheckBox25:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox25:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox25:setAlign("client");
    obj.imageCheckBox25:setLeft(0);
    obj.imageCheckBox25:setTop(0);
    obj.imageCheckBox25:setWidth(22);
    obj.imageCheckBox25:setHeight(27);
    obj.imageCheckBox25:setField("ess1_1_5");
    obj.imageCheckBox25:setName("imageCheckBox25");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle1);
    obj.layout51:setLeft(892);
    obj.layout51:setTop(1503);
    obj.layout51:setWidth(22);
    obj.layout51:setHeight(26);
    obj.layout51:setName("layout51");

    obj.imageCheckBox26 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout51);
    obj.imageCheckBox26:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox26:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox26:setAlign("client");
    obj.imageCheckBox26:setLeft(0);
    obj.imageCheckBox26:setTop(0);
    obj.imageCheckBox26:setWidth(22);
    obj.imageCheckBox26:setHeight(27);
    obj.imageCheckBox26:setField("ess1_1_6");
    obj.imageCheckBox26:setName("imageCheckBox26");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle1);
    obj.layout52:setLeft(893);
    obj.layout52:setTop(1533);
    obj.layout52:setWidth(22);
    obj.layout52:setHeight(26);
    obj.layout52:setName("layout52");

    obj.imageCheckBox27 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout52);
    obj.imageCheckBox27:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox27:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox27:setAlign("client");
    obj.imageCheckBox27:setLeft(0);
    obj.imageCheckBox27:setTop(0);
    obj.imageCheckBox27:setWidth(22);
    obj.imageCheckBox27:setHeight(27);
    obj.imageCheckBox27:setField("ess1_1_7");
    obj.imageCheckBox27:setName("imageCheckBox27");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle1);
    obj.layout53:setLeft(1212);
    obj.layout53:setTop(1351);
    obj.layout53:setWidth(22);
    obj.layout53:setHeight(26);
    obj.layout53:setName("layout53");

    obj.imageCheckBox28 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout53);
    obj.imageCheckBox28:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox28:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox28:setAlign("client");
    obj.imageCheckBox28:setLeft(0);
    obj.imageCheckBox28:setTop(0);
    obj.imageCheckBox28:setWidth(22);
    obj.imageCheckBox28:setHeight(27);
    obj.imageCheckBox28:setField("ess2_1_1");
    obj.imageCheckBox28:setName("imageCheckBox28");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle1);
    obj.layout54:setLeft(1212);
    obj.layout54:setTop(1380);
    obj.layout54:setWidth(22);
    obj.layout54:setHeight(26);
    obj.layout54:setName("layout54");

    obj.imageCheckBox29 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout54);
    obj.imageCheckBox29:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox29:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox29:setAlign("client");
    obj.imageCheckBox29:setLeft(0);
    obj.imageCheckBox29:setTop(0);
    obj.imageCheckBox29:setWidth(22);
    obj.imageCheckBox29:setHeight(27);
    obj.imageCheckBox29:setField("ess2_1_2");
    obj.imageCheckBox29:setName("imageCheckBox29");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle1);
    obj.layout55:setLeft(1211);
    obj.layout55:setTop(1411);
    obj.layout55:setWidth(22);
    obj.layout55:setHeight(26);
    obj.layout55:setName("layout55");

    obj.imageCheckBox30 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout55);
    obj.imageCheckBox30:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox30:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox30:setAlign("client");
    obj.imageCheckBox30:setLeft(0);
    obj.imageCheckBox30:setTop(0);
    obj.imageCheckBox30:setWidth(22);
    obj.imageCheckBox30:setHeight(27);
    obj.imageCheckBox30:setField("ess2_1_3");
    obj.imageCheckBox30:setName("imageCheckBox30");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle1);
    obj.layout56:setLeft(1211);
    obj.layout56:setTop(1441);
    obj.layout56:setWidth(22);
    obj.layout56:setHeight(26);
    obj.layout56:setName("layout56");

    obj.imageCheckBox31 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout56);
    obj.imageCheckBox31:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox31:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox31:setAlign("client");
    obj.imageCheckBox31:setLeft(0);
    obj.imageCheckBox31:setTop(0);
    obj.imageCheckBox31:setWidth(22);
    obj.imageCheckBox31:setHeight(27);
    obj.imageCheckBox31:setField("ess2_1_4");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle1);
    obj.layout57:setLeft(1211);
    obj.layout57:setTop(1472);
    obj.layout57:setWidth(22);
    obj.layout57:setHeight(26);
    obj.layout57:setName("layout57");

    obj.imageCheckBox32 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout57);
    obj.imageCheckBox32:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox32:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox32:setAlign("client");
    obj.imageCheckBox32:setLeft(0);
    obj.imageCheckBox32:setTop(0);
    obj.imageCheckBox32:setWidth(22);
    obj.imageCheckBox32:setHeight(27);
    obj.imageCheckBox32:setField("ess2_1_5");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle1);
    obj.layout58:setLeft(1211);
    obj.layout58:setTop(1503);
    obj.layout58:setWidth(22);
    obj.layout58:setHeight(26);
    obj.layout58:setName("layout58");

    obj.imageCheckBox33 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout58);
    obj.imageCheckBox33:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox33:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox33:setAlign("client");
    obj.imageCheckBox33:setLeft(0);
    obj.imageCheckBox33:setTop(0);
    obj.imageCheckBox33:setWidth(22);
    obj.imageCheckBox33:setHeight(27);
    obj.imageCheckBox33:setField("ess2_1_6");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle1);
    obj.layout59:setLeft(1212);
    obj.layout59:setTop(1533);
    obj.layout59:setWidth(22);
    obj.layout59:setHeight(26);
    obj.layout59:setName("layout59");

    obj.imageCheckBox34 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout59);
    obj.imageCheckBox34:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox34:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox34:setAlign("client");
    obj.imageCheckBox34:setLeft(0);
    obj.imageCheckBox34:setTop(0);
    obj.imageCheckBox34:setWidth(22);
    obj.imageCheckBox34:setHeight(27);
    obj.imageCheckBox34:setField("ess2_1_7");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle1);
    obj.layout60:setLeft(928);
    obj.layout60:setTop(1351);
    obj.layout60:setWidth(22);
    obj.layout60:setHeight(26);
    obj.layout60:setName("layout60");

    obj.imageCheckBox35 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout60);
    obj.imageCheckBox35:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox35:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox35:setAlign("client");
    obj.imageCheckBox35:setLeft(0);
    obj.imageCheckBox35:setTop(0);
    obj.imageCheckBox35:setWidth(22);
    obj.imageCheckBox35:setHeight(27);
    obj.imageCheckBox35:setField("ess3_1_1");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle1);
    obj.layout61:setLeft(928);
    obj.layout61:setTop(1380);
    obj.layout61:setWidth(22);
    obj.layout61:setHeight(26);
    obj.layout61:setName("layout61");

    obj.imageCheckBox36 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout61);
    obj.imageCheckBox36:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox36:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox36:setAlign("client");
    obj.imageCheckBox36:setLeft(0);
    obj.imageCheckBox36:setTop(0);
    obj.imageCheckBox36:setWidth(22);
    obj.imageCheckBox36:setHeight(27);
    obj.imageCheckBox36:setField("ess3_1_2");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle1);
    obj.layout62:setLeft(927);
    obj.layout62:setTop(1411);
    obj.layout62:setWidth(22);
    obj.layout62:setHeight(26);
    obj.layout62:setName("layout62");

    obj.imageCheckBox37 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout62);
    obj.imageCheckBox37:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox37:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox37:setAlign("client");
    obj.imageCheckBox37:setLeft(0);
    obj.imageCheckBox37:setTop(0);
    obj.imageCheckBox37:setWidth(22);
    obj.imageCheckBox37:setHeight(27);
    obj.imageCheckBox37:setField("ess3_1_3");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle1);
    obj.layout63:setLeft(927);
    obj.layout63:setTop(1441);
    obj.layout63:setWidth(22);
    obj.layout63:setHeight(26);
    obj.layout63:setName("layout63");

    obj.imageCheckBox38 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout63);
    obj.imageCheckBox38:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox38:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox38:setAlign("client");
    obj.imageCheckBox38:setLeft(0);
    obj.imageCheckBox38:setTop(0);
    obj.imageCheckBox38:setWidth(22);
    obj.imageCheckBox38:setHeight(27);
    obj.imageCheckBox38:setField("ess3_1_4");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle1);
    obj.layout64:setLeft(927);
    obj.layout64:setTop(1472);
    obj.layout64:setWidth(22);
    obj.layout64:setHeight(26);
    obj.layout64:setName("layout64");

    obj.imageCheckBox39 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout64);
    obj.imageCheckBox39:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox39:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox39:setAlign("client");
    obj.imageCheckBox39:setLeft(0);
    obj.imageCheckBox39:setTop(0);
    obj.imageCheckBox39:setWidth(22);
    obj.imageCheckBox39:setHeight(27);
    obj.imageCheckBox39:setField("ess3_1_5");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle1);
    obj.layout65:setLeft(927);
    obj.layout65:setTop(1503);
    obj.layout65:setWidth(22);
    obj.layout65:setHeight(26);
    obj.layout65:setName("layout65");

    obj.imageCheckBox40 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout65);
    obj.imageCheckBox40:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox40:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox40:setAlign("client");
    obj.imageCheckBox40:setLeft(0);
    obj.imageCheckBox40:setTop(0);
    obj.imageCheckBox40:setWidth(22);
    obj.imageCheckBox40:setHeight(27);
    obj.imageCheckBox40:setField("ess3_1_6");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle1);
    obj.layout66:setLeft(928);
    obj.layout66:setTop(1533);
    obj.layout66:setWidth(22);
    obj.layout66:setHeight(26);
    obj.layout66:setName("layout66");

    obj.imageCheckBox41 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout66);
    obj.imageCheckBox41:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox41:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox41:setAlign("client");
    obj.imageCheckBox41:setLeft(0);
    obj.imageCheckBox41:setTop(0);
    obj.imageCheckBox41:setWidth(22);
    obj.imageCheckBox41:setHeight(27);
    obj.imageCheckBox41:setField("ess3_1_7");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle1);
    obj.layout67:setLeft(964);
    obj.layout67:setTop(1351);
    obj.layout67:setWidth(22);
    obj.layout67:setHeight(26);
    obj.layout67:setName("layout67");

    obj.imageCheckBox42 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout67);
    obj.imageCheckBox42:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox42:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox42:setAlign("client");
    obj.imageCheckBox42:setLeft(0);
    obj.imageCheckBox42:setTop(0);
    obj.imageCheckBox42:setWidth(22);
    obj.imageCheckBox42:setHeight(27);
    obj.imageCheckBox42:setField("ess4_1_1");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle1);
    obj.layout68:setLeft(964);
    obj.layout68:setTop(1380);
    obj.layout68:setWidth(22);
    obj.layout68:setHeight(26);
    obj.layout68:setName("layout68");

    obj.imageCheckBox43 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox43:setParent(obj.layout68);
    obj.imageCheckBox43:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox43:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox43:setAlign("client");
    obj.imageCheckBox43:setLeft(0);
    obj.imageCheckBox43:setTop(0);
    obj.imageCheckBox43:setWidth(22);
    obj.imageCheckBox43:setHeight(27);
    obj.imageCheckBox43:setField("ess4_1_2");
    obj.imageCheckBox43:setName("imageCheckBox43");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle1);
    obj.layout69:setLeft(964);
    obj.layout69:setTop(1411);
    obj.layout69:setWidth(22);
    obj.layout69:setHeight(26);
    obj.layout69:setName("layout69");

    obj.imageCheckBox44 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox44:setParent(obj.layout69);
    obj.imageCheckBox44:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox44:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox44:setAlign("client");
    obj.imageCheckBox44:setLeft(0);
    obj.imageCheckBox44:setTop(0);
    obj.imageCheckBox44:setWidth(22);
    obj.imageCheckBox44:setHeight(27);
    obj.imageCheckBox44:setField("ess4_1_3");
    obj.imageCheckBox44:setName("imageCheckBox44");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle1);
    obj.layout70:setLeft(963);
    obj.layout70:setTop(1441);
    obj.layout70:setWidth(22);
    obj.layout70:setHeight(26);
    obj.layout70:setName("layout70");

    obj.imageCheckBox45 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox45:setParent(obj.layout70);
    obj.imageCheckBox45:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox45:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox45:setAlign("client");
    obj.imageCheckBox45:setLeft(0);
    obj.imageCheckBox45:setTop(0);
    obj.imageCheckBox45:setWidth(22);
    obj.imageCheckBox45:setHeight(27);
    obj.imageCheckBox45:setField("ess4_1_4");
    obj.imageCheckBox45:setName("imageCheckBox45");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle1);
    obj.layout71:setLeft(963);
    obj.layout71:setTop(1472);
    obj.layout71:setWidth(22);
    obj.layout71:setHeight(26);
    obj.layout71:setName("layout71");

    obj.imageCheckBox46 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox46:setParent(obj.layout71);
    obj.imageCheckBox46:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox46:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox46:setAlign("client");
    obj.imageCheckBox46:setLeft(0);
    obj.imageCheckBox46:setTop(0);
    obj.imageCheckBox46:setWidth(22);
    obj.imageCheckBox46:setHeight(27);
    obj.imageCheckBox46:setField("ess4_1_5");
    obj.imageCheckBox46:setName("imageCheckBox46");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle1);
    obj.layout72:setLeft(964);
    obj.layout72:setTop(1503);
    obj.layout72:setWidth(22);
    obj.layout72:setHeight(26);
    obj.layout72:setName("layout72");

    obj.imageCheckBox47 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox47:setParent(obj.layout72);
    obj.imageCheckBox47:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox47:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox47:setAlign("client");
    obj.imageCheckBox47:setLeft(0);
    obj.imageCheckBox47:setTop(0);
    obj.imageCheckBox47:setWidth(22);
    obj.imageCheckBox47:setHeight(27);
    obj.imageCheckBox47:setField("ess4_1_6");
    obj.imageCheckBox47:setName("imageCheckBox47");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle1);
    obj.layout73:setLeft(964);
    obj.layout73:setTop(1533);
    obj.layout73:setWidth(22);
    obj.layout73:setHeight(26);
    obj.layout73:setName("layout73");

    obj.imageCheckBox48 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox48:setParent(obj.layout73);
    obj.imageCheckBox48:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox48:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox48:setAlign("client");
    obj.imageCheckBox48:setLeft(0);
    obj.imageCheckBox48:setTop(0);
    obj.imageCheckBox48:setWidth(22);
    obj.imageCheckBox48:setHeight(27);
    obj.imageCheckBox48:setField("ess4_1_7");
    obj.imageCheckBox48:setName("imageCheckBox48");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle1);
    obj.layout74:setLeft(999);
    obj.layout74:setTop(1351);
    obj.layout74:setWidth(22);
    obj.layout74:setHeight(26);
    obj.layout74:setName("layout74");

    obj.imageCheckBox49 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox49:setParent(obj.layout74);
    obj.imageCheckBox49:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox49:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox49:setAlign("client");
    obj.imageCheckBox49:setLeft(0);
    obj.imageCheckBox49:setTop(0);
    obj.imageCheckBox49:setWidth(22);
    obj.imageCheckBox49:setHeight(27);
    obj.imageCheckBox49:setField("ess5_1_1");
    obj.imageCheckBox49:setName("imageCheckBox49");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle1);
    obj.layout75:setLeft(999);
    obj.layout75:setTop(1380);
    obj.layout75:setWidth(22);
    obj.layout75:setHeight(26);
    obj.layout75:setName("layout75");

    obj.imageCheckBox50 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox50:setParent(obj.layout75);
    obj.imageCheckBox50:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox50:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox50:setAlign("client");
    obj.imageCheckBox50:setLeft(0);
    obj.imageCheckBox50:setTop(0);
    obj.imageCheckBox50:setWidth(22);
    obj.imageCheckBox50:setHeight(27);
    obj.imageCheckBox50:setField("ess5_1_2");
    obj.imageCheckBox50:setName("imageCheckBox50");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle1);
    obj.layout76:setLeft(999);
    obj.layout76:setTop(1411);
    obj.layout76:setWidth(22);
    obj.layout76:setHeight(26);
    obj.layout76:setName("layout76");

    obj.imageCheckBox51 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox51:setParent(obj.layout76);
    obj.imageCheckBox51:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox51:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox51:setAlign("client");
    obj.imageCheckBox51:setLeft(0);
    obj.imageCheckBox51:setTop(0);
    obj.imageCheckBox51:setWidth(22);
    obj.imageCheckBox51:setHeight(27);
    obj.imageCheckBox51:setField("ess5_1_3");
    obj.imageCheckBox51:setName("imageCheckBox51");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle1);
    obj.layout77:setLeft(999);
    obj.layout77:setTop(1441);
    obj.layout77:setWidth(22);
    obj.layout77:setHeight(26);
    obj.layout77:setName("layout77");

    obj.imageCheckBox52 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox52:setParent(obj.layout77);
    obj.imageCheckBox52:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox52:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox52:setAlign("client");
    obj.imageCheckBox52:setLeft(0);
    obj.imageCheckBox52:setTop(0);
    obj.imageCheckBox52:setWidth(22);
    obj.imageCheckBox52:setHeight(27);
    obj.imageCheckBox52:setField("ess5_1_4");
    obj.imageCheckBox52:setName("imageCheckBox52");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle1);
    obj.layout78:setLeft(999);
    obj.layout78:setTop(1472);
    obj.layout78:setWidth(22);
    obj.layout78:setHeight(26);
    obj.layout78:setName("layout78");

    obj.imageCheckBox53 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox53:setParent(obj.layout78);
    obj.imageCheckBox53:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox53:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox53:setAlign("client");
    obj.imageCheckBox53:setLeft(0);
    obj.imageCheckBox53:setTop(0);
    obj.imageCheckBox53:setWidth(22);
    obj.imageCheckBox53:setHeight(27);
    obj.imageCheckBox53:setField("ess5_1_5");
    obj.imageCheckBox53:setName("imageCheckBox53");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle1);
    obj.layout79:setLeft(999);
    obj.layout79:setTop(1503);
    obj.layout79:setWidth(22);
    obj.layout79:setHeight(26);
    obj.layout79:setName("layout79");

    obj.imageCheckBox54 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox54:setParent(obj.layout79);
    obj.imageCheckBox54:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox54:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox54:setAlign("client");
    obj.imageCheckBox54:setLeft(0);
    obj.imageCheckBox54:setTop(0);
    obj.imageCheckBox54:setWidth(22);
    obj.imageCheckBox54:setHeight(27);
    obj.imageCheckBox54:setField("ess5_1_6");
    obj.imageCheckBox54:setName("imageCheckBox54");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle1);
    obj.layout80:setLeft(1000);
    obj.layout80:setTop(1533);
    obj.layout80:setWidth(22);
    obj.layout80:setHeight(26);
    obj.layout80:setName("layout80");

    obj.imageCheckBox55 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox55:setParent(obj.layout80);
    obj.imageCheckBox55:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox55:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox55:setAlign("client");
    obj.imageCheckBox55:setLeft(0);
    obj.imageCheckBox55:setTop(0);
    obj.imageCheckBox55:setWidth(22);
    obj.imageCheckBox55:setHeight(27);
    obj.imageCheckBox55:setField("ess5_1_7");
    obj.imageCheckBox55:setName("imageCheckBox55");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle1);
    obj.layout81:setLeft(1036);
    obj.layout81:setTop(1351);
    obj.layout81:setWidth(22);
    obj.layout81:setHeight(26);
    obj.layout81:setName("layout81");

    obj.imageCheckBox56 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox56:setParent(obj.layout81);
    obj.imageCheckBox56:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox56:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox56:setAlign("client");
    obj.imageCheckBox56:setLeft(0);
    obj.imageCheckBox56:setTop(0);
    obj.imageCheckBox56:setWidth(22);
    obj.imageCheckBox56:setHeight(27);
    obj.imageCheckBox56:setField("ess6_1_1");
    obj.imageCheckBox56:setName("imageCheckBox56");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle1);
    obj.layout82:setLeft(1036);
    obj.layout82:setTop(1380);
    obj.layout82:setWidth(22);
    obj.layout82:setHeight(26);
    obj.layout82:setName("layout82");

    obj.imageCheckBox57 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox57:setParent(obj.layout82);
    obj.imageCheckBox57:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox57:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox57:setAlign("client");
    obj.imageCheckBox57:setLeft(0);
    obj.imageCheckBox57:setTop(0);
    obj.imageCheckBox57:setWidth(22);
    obj.imageCheckBox57:setHeight(27);
    obj.imageCheckBox57:setField("ess6_1_2");
    obj.imageCheckBox57:setName("imageCheckBox57");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle1);
    obj.layout83:setLeft(1036);
    obj.layout83:setTop(1411);
    obj.layout83:setWidth(22);
    obj.layout83:setHeight(26);
    obj.layout83:setName("layout83");

    obj.imageCheckBox58 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox58:setParent(obj.layout83);
    obj.imageCheckBox58:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox58:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox58:setAlign("client");
    obj.imageCheckBox58:setLeft(0);
    obj.imageCheckBox58:setTop(0);
    obj.imageCheckBox58:setWidth(22);
    obj.imageCheckBox58:setHeight(27);
    obj.imageCheckBox58:setField("ess6_1_3");
    obj.imageCheckBox58:setName("imageCheckBox58");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle1);
    obj.layout84:setLeft(1035);
    obj.layout84:setTop(1441);
    obj.layout84:setWidth(22);
    obj.layout84:setHeight(26);
    obj.layout84:setName("layout84");

    obj.imageCheckBox59 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox59:setParent(obj.layout84);
    obj.imageCheckBox59:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox59:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox59:setAlign("client");
    obj.imageCheckBox59:setLeft(0);
    obj.imageCheckBox59:setTop(0);
    obj.imageCheckBox59:setWidth(22);
    obj.imageCheckBox59:setHeight(27);
    obj.imageCheckBox59:setField("ess6_1_4");
    obj.imageCheckBox59:setName("imageCheckBox59");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle1);
    obj.layout85:setLeft(1035);
    obj.layout85:setTop(1472);
    obj.layout85:setWidth(22);
    obj.layout85:setHeight(26);
    obj.layout85:setName("layout85");

    obj.imageCheckBox60 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox60:setParent(obj.layout85);
    obj.imageCheckBox60:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox60:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox60:setAlign("client");
    obj.imageCheckBox60:setLeft(0);
    obj.imageCheckBox60:setTop(0);
    obj.imageCheckBox60:setWidth(22);
    obj.imageCheckBox60:setHeight(27);
    obj.imageCheckBox60:setField("ess6_1_5");
    obj.imageCheckBox60:setName("imageCheckBox60");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle1);
    obj.layout86:setLeft(1036);
    obj.layout86:setTop(1503);
    obj.layout86:setWidth(22);
    obj.layout86:setHeight(26);
    obj.layout86:setName("layout86");

    obj.imageCheckBox61 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox61:setParent(obj.layout86);
    obj.imageCheckBox61:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox61:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox61:setAlign("client");
    obj.imageCheckBox61:setLeft(0);
    obj.imageCheckBox61:setTop(0);
    obj.imageCheckBox61:setWidth(22);
    obj.imageCheckBox61:setHeight(27);
    obj.imageCheckBox61:setField("ess6_1_6");
    obj.imageCheckBox61:setName("imageCheckBox61");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle1);
    obj.layout87:setLeft(1037);
    obj.layout87:setTop(1533);
    obj.layout87:setWidth(22);
    obj.layout87:setHeight(26);
    obj.layout87:setName("layout87");

    obj.imageCheckBox62 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox62:setParent(obj.layout87);
    obj.imageCheckBox62:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox62:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox62:setAlign("client");
    obj.imageCheckBox62:setLeft(0);
    obj.imageCheckBox62:setTop(0);
    obj.imageCheckBox62:setWidth(22);
    obj.imageCheckBox62:setHeight(27);
    obj.imageCheckBox62:setField("ess6_1_7");
    obj.imageCheckBox62:setName("imageCheckBox62");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle1);
    obj.layout88:setLeft(1070);
    obj.layout88:setTop(1352);
    obj.layout88:setWidth(22);
    obj.layout88:setHeight(26);
    obj.layout88:setName("layout88");

    obj.imageCheckBox63 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox63:setParent(obj.layout88);
    obj.imageCheckBox63:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox63:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox63:setAlign("client");
    obj.imageCheckBox63:setLeft(0);
    obj.imageCheckBox63:setTop(0);
    obj.imageCheckBox63:setWidth(22);
    obj.imageCheckBox63:setHeight(27);
    obj.imageCheckBox63:setField("ess7_1_1");
    obj.imageCheckBox63:setName("imageCheckBox63");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle1);
    obj.layout89:setLeft(1070);
    obj.layout89:setTop(1381);
    obj.layout89:setWidth(22);
    obj.layout89:setHeight(26);
    obj.layout89:setName("layout89");

    obj.imageCheckBox64 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox64:setParent(obj.layout89);
    obj.imageCheckBox64:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox64:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox64:setAlign("client");
    obj.imageCheckBox64:setLeft(0);
    obj.imageCheckBox64:setTop(0);
    obj.imageCheckBox64:setWidth(22);
    obj.imageCheckBox64:setHeight(27);
    obj.imageCheckBox64:setField("ess7_1_2");
    obj.imageCheckBox64:setName("imageCheckBox64");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle1);
    obj.layout90:setLeft(1070);
    obj.layout90:setTop(1412);
    obj.layout90:setWidth(22);
    obj.layout90:setHeight(26);
    obj.layout90:setName("layout90");

    obj.imageCheckBox65 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox65:setParent(obj.layout90);
    obj.imageCheckBox65:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox65:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox65:setAlign("client");
    obj.imageCheckBox65:setLeft(0);
    obj.imageCheckBox65:setTop(0);
    obj.imageCheckBox65:setWidth(22);
    obj.imageCheckBox65:setHeight(27);
    obj.imageCheckBox65:setField("ess7_1_3");
    obj.imageCheckBox65:setName("imageCheckBox65");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle1);
    obj.layout91:setLeft(1069);
    obj.layout91:setTop(1442);
    obj.layout91:setWidth(22);
    obj.layout91:setHeight(26);
    obj.layout91:setName("layout91");

    obj.imageCheckBox66 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox66:setParent(obj.layout91);
    obj.imageCheckBox66:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox66:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox66:setAlign("client");
    obj.imageCheckBox66:setLeft(0);
    obj.imageCheckBox66:setTop(0);
    obj.imageCheckBox66:setWidth(22);
    obj.imageCheckBox66:setHeight(27);
    obj.imageCheckBox66:setField("ess7_1_4");
    obj.imageCheckBox66:setName("imageCheckBox66");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle1);
    obj.layout92:setLeft(1069);
    obj.layout92:setTop(1472);
    obj.layout92:setWidth(22);
    obj.layout92:setHeight(26);
    obj.layout92:setName("layout92");

    obj.imageCheckBox67 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox67:setParent(obj.layout92);
    obj.imageCheckBox67:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox67:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox67:setAlign("client");
    obj.imageCheckBox67:setLeft(0);
    obj.imageCheckBox67:setTop(0);
    obj.imageCheckBox67:setWidth(22);
    obj.imageCheckBox67:setHeight(27);
    obj.imageCheckBox67:setField("ess7_1_5");
    obj.imageCheckBox67:setName("imageCheckBox67");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle1);
    obj.layout93:setLeft(1070);
    obj.layout93:setTop(1504);
    obj.layout93:setWidth(22);
    obj.layout93:setHeight(26);
    obj.layout93:setName("layout93");

    obj.imageCheckBox68 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox68:setParent(obj.layout93);
    obj.imageCheckBox68:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox68:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox68:setAlign("client");
    obj.imageCheckBox68:setField("ess7_1_6");
    obj.imageCheckBox68:setName("imageCheckBox68");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle1);
    obj.layout94:setLeft(1071);
    obj.layout94:setTop(1534);
    obj.layout94:setWidth(22);
    obj.layout94:setHeight(26);
    obj.layout94:setName("layout94");

    obj.imageCheckBox69 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox69:setParent(obj.layout94);
    obj.imageCheckBox69:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox69:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox69:setAlign("client");
    obj.imageCheckBox69:setField("ess7_1_7");
    obj.imageCheckBox69:setName("imageCheckBox69");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle1);
    obj.layout95:setLeft(1104);
    obj.layout95:setTop(1351);
    obj.layout95:setWidth(22);
    obj.layout95:setHeight(26);
    obj.layout95:setName("layout95");

    obj.imageCheckBox70 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox70:setParent(obj.layout95);
    obj.imageCheckBox70:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox70:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox70:setAlign("client");
    obj.imageCheckBox70:setLeft(0);
    obj.imageCheckBox70:setTop(0);
    obj.imageCheckBox70:setWidth(22);
    obj.imageCheckBox70:setHeight(27);
    obj.imageCheckBox70:setField("ess8_1_1");
    obj.imageCheckBox70:setName("imageCheckBox70");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle1);
    obj.layout96:setLeft(1104);
    obj.layout96:setTop(1380);
    obj.layout96:setWidth(22);
    obj.layout96:setHeight(26);
    obj.layout96:setName("layout96");

    obj.imageCheckBox71 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox71:setParent(obj.layout96);
    obj.imageCheckBox71:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox71:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox71:setAlign("client");
    obj.imageCheckBox71:setLeft(0);
    obj.imageCheckBox71:setTop(0);
    obj.imageCheckBox71:setWidth(22);
    obj.imageCheckBox71:setHeight(27);
    obj.imageCheckBox71:setField("ess8_1_2");
    obj.imageCheckBox71:setName("imageCheckBox71");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle1);
    obj.layout97:setLeft(1104);
    obj.layout97:setTop(1411);
    obj.layout97:setWidth(22);
    obj.layout97:setHeight(26);
    obj.layout97:setName("layout97");

    obj.imageCheckBox72 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox72:setParent(obj.layout97);
    obj.imageCheckBox72:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox72:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox72:setAlign("client");
    obj.imageCheckBox72:setLeft(0);
    obj.imageCheckBox72:setTop(0);
    obj.imageCheckBox72:setWidth(22);
    obj.imageCheckBox72:setHeight(27);
    obj.imageCheckBox72:setField("ess8_1_3");
    obj.imageCheckBox72:setName("imageCheckBox72");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle1);
    obj.layout98:setLeft(1103);
    obj.layout98:setTop(1441);
    obj.layout98:setWidth(22);
    obj.layout98:setHeight(26);
    obj.layout98:setName("layout98");

    obj.imageCheckBox73 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox73:setParent(obj.layout98);
    obj.imageCheckBox73:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox73:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox73:setAlign("client");
    obj.imageCheckBox73:setLeft(0);
    obj.imageCheckBox73:setTop(0);
    obj.imageCheckBox73:setWidth(22);
    obj.imageCheckBox73:setHeight(27);
    obj.imageCheckBox73:setField("ess8_1_4");
    obj.imageCheckBox73:setName("imageCheckBox73");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle1);
    obj.layout99:setLeft(1103);
    obj.layout99:setTop(1472);
    obj.layout99:setWidth(22);
    obj.layout99:setHeight(26);
    obj.layout99:setName("layout99");

    obj.imageCheckBox74 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox74:setParent(obj.layout99);
    obj.imageCheckBox74:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox74:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox74:setAlign("client");
    obj.imageCheckBox74:setLeft(0);
    obj.imageCheckBox74:setTop(0);
    obj.imageCheckBox74:setWidth(22);
    obj.imageCheckBox74:setHeight(27);
    obj.imageCheckBox74:setField("ess8_1_5");
    obj.imageCheckBox74:setName("imageCheckBox74");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle1);
    obj.layout100:setLeft(1104);
    obj.layout100:setTop(1503);
    obj.layout100:setWidth(22);
    obj.layout100:setHeight(26);
    obj.layout100:setName("layout100");

    obj.imageCheckBox75 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox75:setParent(obj.layout100);
    obj.imageCheckBox75:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox75:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox75:setAlign("client");
    obj.imageCheckBox75:setLeft(0);
    obj.imageCheckBox75:setTop(0);
    obj.imageCheckBox75:setWidth(22);
    obj.imageCheckBox75:setHeight(27);
    obj.imageCheckBox75:setField("ess8_1_6");
    obj.imageCheckBox75:setName("imageCheckBox75");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle1);
    obj.layout101:setLeft(1104);
    obj.layout101:setTop(1533);
    obj.layout101:setWidth(22);
    obj.layout101:setHeight(26);
    obj.layout101:setName("layout101");

    obj.imageCheckBox76 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox76:setParent(obj.layout101);
    obj.imageCheckBox76:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox76:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox76:setAlign("client");
    obj.imageCheckBox76:setLeft(0);
    obj.imageCheckBox76:setTop(0);
    obj.imageCheckBox76:setWidth(22);
    obj.imageCheckBox76:setHeight(27);
    obj.imageCheckBox76:setField("ess8_1_7");
    obj.imageCheckBox76:setName("imageCheckBox76");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle1);
    obj.layout102:setLeft(1140);
    obj.layout102:setTop(1351);
    obj.layout102:setWidth(22);
    obj.layout102:setHeight(26);
    obj.layout102:setName("layout102");

    obj.imageCheckBox77 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox77:setParent(obj.layout102);
    obj.imageCheckBox77:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox77:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox77:setAlign("client");
    obj.imageCheckBox77:setLeft(0);
    obj.imageCheckBox77:setTop(0);
    obj.imageCheckBox77:setWidth(22);
    obj.imageCheckBox77:setHeight(27);
    obj.imageCheckBox77:setField("ess9_1_1");
    obj.imageCheckBox77:setName("imageCheckBox77");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.rectangle1);
    obj.layout103:setLeft(1140);
    obj.layout103:setTop(1380);
    obj.layout103:setWidth(22);
    obj.layout103:setHeight(26);
    obj.layout103:setName("layout103");

    obj.imageCheckBox78 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox78:setParent(obj.layout103);
    obj.imageCheckBox78:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox78:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox78:setAlign("client");
    obj.imageCheckBox78:setLeft(0);
    obj.imageCheckBox78:setTop(0);
    obj.imageCheckBox78:setWidth(22);
    obj.imageCheckBox78:setHeight(27);
    obj.imageCheckBox78:setField("ess9_1_2");
    obj.imageCheckBox78:setName("imageCheckBox78");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.rectangle1);
    obj.layout104:setLeft(1140);
    obj.layout104:setTop(1411);
    obj.layout104:setWidth(22);
    obj.layout104:setHeight(26);
    obj.layout104:setName("layout104");

    obj.imageCheckBox79 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox79:setParent(obj.layout104);
    obj.imageCheckBox79:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox79:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox79:setAlign("client");
    obj.imageCheckBox79:setLeft(0);
    obj.imageCheckBox79:setTop(0);
    obj.imageCheckBox79:setWidth(22);
    obj.imageCheckBox79:setHeight(27);
    obj.imageCheckBox79:setField("ess9_1_3");
    obj.imageCheckBox79:setName("imageCheckBox79");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle1);
    obj.layout105:setLeft(1139);
    obj.layout105:setTop(1441);
    obj.layout105:setWidth(22);
    obj.layout105:setHeight(26);
    obj.layout105:setName("layout105");

    obj.imageCheckBox80 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox80:setParent(obj.layout105);
    obj.imageCheckBox80:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox80:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox80:setAlign("client");
    obj.imageCheckBox80:setLeft(0);
    obj.imageCheckBox80:setTop(0);
    obj.imageCheckBox80:setWidth(22);
    obj.imageCheckBox80:setHeight(27);
    obj.imageCheckBox80:setField("ess9_1_4");
    obj.imageCheckBox80:setName("imageCheckBox80");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.rectangle1);
    obj.layout106:setLeft(1139);
    obj.layout106:setTop(1472);
    obj.layout106:setWidth(22);
    obj.layout106:setHeight(26);
    obj.layout106:setName("layout106");

    obj.imageCheckBox81 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox81:setParent(obj.layout106);
    obj.imageCheckBox81:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox81:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox81:setAlign("client");
    obj.imageCheckBox81:setLeft(0);
    obj.imageCheckBox81:setTop(0);
    obj.imageCheckBox81:setWidth(22);
    obj.imageCheckBox81:setHeight(27);
    obj.imageCheckBox81:setField("ess9_1_5");
    obj.imageCheckBox81:setName("imageCheckBox81");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.rectangle1);
    obj.layout107:setLeft(1140);
    obj.layout107:setTop(1503);
    obj.layout107:setWidth(22);
    obj.layout107:setHeight(26);
    obj.layout107:setName("layout107");

    obj.imageCheckBox82 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox82:setParent(obj.layout107);
    obj.imageCheckBox82:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox82:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox82:setAlign("client");
    obj.imageCheckBox82:setLeft(0);
    obj.imageCheckBox82:setTop(0);
    obj.imageCheckBox82:setWidth(22);
    obj.imageCheckBox82:setHeight(27);
    obj.imageCheckBox82:setField("ess9_1_6");
    obj.imageCheckBox82:setName("imageCheckBox82");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.rectangle1);
    obj.layout108:setLeft(1141);
    obj.layout108:setTop(1533);
    obj.layout108:setWidth(22);
    obj.layout108:setHeight(26);
    obj.layout108:setName("layout108");

    obj.imageCheckBox83 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox83:setParent(obj.layout108);
    obj.imageCheckBox83:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox83:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox83:setAlign("client");
    obj.imageCheckBox83:setLeft(0);
    obj.imageCheckBox83:setTop(0);
    obj.imageCheckBox83:setWidth(22);
    obj.imageCheckBox83:setHeight(27);
    obj.imageCheckBox83:setField("ess9_1_7");
    obj.imageCheckBox83:setName("imageCheckBox83");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.rectangle1);
    obj.layout109:setLeft(1175);
    obj.layout109:setTop(1350);
    obj.layout109:setWidth(22);
    obj.layout109:setHeight(26);
    obj.layout109:setName("layout109");

    obj.imageCheckBox84 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox84:setParent(obj.layout109);
    obj.imageCheckBox84:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox84:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox84:setAlign("client");
    obj.imageCheckBox84:setLeft(0);
    obj.imageCheckBox84:setTop(0);
    obj.imageCheckBox84:setWidth(22);
    obj.imageCheckBox84:setHeight(27);
    obj.imageCheckBox84:setField("ess10_1_1");
    obj.imageCheckBox84:setName("imageCheckBox84");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.rectangle1);
    obj.layout110:setLeft(1175);
    obj.layout110:setTop(1379);
    obj.layout110:setWidth(22);
    obj.layout110:setHeight(26);
    obj.layout110:setName("layout110");

    obj.imageCheckBox85 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox85:setParent(obj.layout110);
    obj.imageCheckBox85:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox85:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox85:setAlign("client");
    obj.imageCheckBox85:setLeft(0);
    obj.imageCheckBox85:setTop(0);
    obj.imageCheckBox85:setWidth(22);
    obj.imageCheckBox85:setHeight(27);
    obj.imageCheckBox85:setField("ess10_1_2");
    obj.imageCheckBox85:setName("imageCheckBox85");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.rectangle1);
    obj.layout111:setLeft(1175);
    obj.layout111:setTop(1410);
    obj.layout111:setWidth(22);
    obj.layout111:setHeight(26);
    obj.layout111:setName("layout111");

    obj.imageCheckBox86 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox86:setParent(obj.layout111);
    obj.imageCheckBox86:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox86:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox86:setAlign("client");
    obj.imageCheckBox86:setLeft(0);
    obj.imageCheckBox86:setTop(0);
    obj.imageCheckBox86:setWidth(22);
    obj.imageCheckBox86:setHeight(27);
    obj.imageCheckBox86:setField("ess10_1_3");
    obj.imageCheckBox86:setName("imageCheckBox86");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle1);
    obj.layout112:setLeft(1175);
    obj.layout112:setTop(1440);
    obj.layout112:setWidth(22);
    obj.layout112:setHeight(26);
    obj.layout112:setName("layout112");

    obj.imageCheckBox87 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox87:setParent(obj.layout112);
    obj.imageCheckBox87:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox87:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox87:setAlign("client");
    obj.imageCheckBox87:setLeft(0);
    obj.imageCheckBox87:setTop(0);
    obj.imageCheckBox87:setWidth(22);
    obj.imageCheckBox87:setHeight(27);
    obj.imageCheckBox87:setField("ess10_1_4");
    obj.imageCheckBox87:setName("imageCheckBox87");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.rectangle1);
    obj.layout113:setLeft(1175);
    obj.layout113:setTop(1471);
    obj.layout113:setWidth(22);
    obj.layout113:setHeight(26);
    obj.layout113:setName("layout113");

    obj.imageCheckBox88 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox88:setParent(obj.layout113);
    obj.imageCheckBox88:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox88:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox88:setAlign("client");
    obj.imageCheckBox88:setLeft(0);
    obj.imageCheckBox88:setTop(0);
    obj.imageCheckBox88:setWidth(22);
    obj.imageCheckBox88:setHeight(27);
    obj.imageCheckBox88:setField("ess10_1_5");
    obj.imageCheckBox88:setName("imageCheckBox88");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.rectangle1);
    obj.layout114:setLeft(1175);
    obj.layout114:setTop(1502);
    obj.layout114:setWidth(22);
    obj.layout114:setHeight(26);
    obj.layout114:setName("layout114");

    obj.imageCheckBox89 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox89:setParent(obj.layout114);
    obj.imageCheckBox89:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox89:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox89:setAlign("client");
    obj.imageCheckBox89:setLeft(0);
    obj.imageCheckBox89:setTop(0);
    obj.imageCheckBox89:setWidth(22);
    obj.imageCheckBox89:setHeight(27);
    obj.imageCheckBox89:setField("ess10_1_6");
    obj.imageCheckBox89:setName("imageCheckBox89");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.rectangle1);
    obj.layout115:setLeft(1176);
    obj.layout115:setTop(1533);
    obj.layout115:setWidth(22);
    obj.layout115:setHeight(26);
    obj.layout115:setName("layout115");

    obj.imageCheckBox90 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox90:setParent(obj.layout115);
    obj.imageCheckBox90:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox90:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox90:setAlign("client");
    obj.imageCheckBox90:setLeft(0);
    obj.imageCheckBox90:setTop(0);
    obj.imageCheckBox90:setWidth(22);
    obj.imageCheckBox90:setHeight(27);
    obj.imageCheckBox90:setField("ess10_1_7");
    obj.imageCheckBox90:setName("imageCheckBox90");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.rectangle1);
    obj.layout116:setLeft(515);
    obj.layout116:setTop(1437);
    obj.layout116:setWidth(19);
    obj.layout116:setHeight(21);
    obj.layout116:setName("layout116");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout116);
    obj.checkBox1:setScale(1.5);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(19);
    obj.checkBox1:setHeight(22);
    obj.checkBox1:setField("gnosecheck1_0");
    obj.checkBox1:setName("checkBox1");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.rectangle1);
    obj.layout117:setLeft(551);
    obj.layout117:setTop(1437);
    obj.layout117:setWidth(19);
    obj.layout117:setHeight(21);
    obj.layout117:setName("layout117");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout117);
    obj.checkBox2:setScale(1.5);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(19);
    obj.checkBox2:setHeight(22);
    obj.checkBox2:setField("gnosecheck1_1");
    obj.checkBox2:setName("checkBox2");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.rectangle1);
    obj.layout118:setLeft(587);
    obj.layout118:setTop(1437);
    obj.layout118:setWidth(19);
    obj.layout118:setHeight(21);
    obj.layout118:setName("layout118");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout118);
    obj.checkBox3:setScale(1.5);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(19);
    obj.checkBox3:setHeight(22);
    obj.checkBox3:setField("gnosecheck1_2");
    obj.checkBox3:setName("checkBox3");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle1);
    obj.layout119:setLeft(622);
    obj.layout119:setTop(1437);
    obj.layout119:setWidth(19);
    obj.layout119:setHeight(21);
    obj.layout119:setName("layout119");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout119);
    obj.checkBox4:setScale(1.5);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(19);
    obj.checkBox4:setHeight(22);
    obj.checkBox4:setField("gnosecheck1_3");
    obj.checkBox4:setName("checkBox4");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.rectangle1);
    obj.layout120:setLeft(656);
    obj.layout120:setTop(1437);
    obj.layout120:setWidth(19);
    obj.layout120:setHeight(21);
    obj.layout120:setName("layout120");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout120);
    obj.checkBox5:setScale(1.5);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(19);
    obj.checkBox5:setHeight(22);
    obj.checkBox5:setField("gnosecheck1_4");
    obj.checkBox5:setName("checkBox5");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.rectangle1);
    obj.layout121:setLeft(692);
    obj.layout121:setTop(1437);
    obj.layout121:setWidth(19);
    obj.layout121:setHeight(21);
    obj.layout121:setName("layout121");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout121);
    obj.checkBox6:setScale(1.5);
    obj.checkBox6:setTop(0);
    obj.checkBox6:setWidth(19);
    obj.checkBox6:setHeight(22);
    obj.checkBox6:setField("gnosecheck1_5");
    obj.checkBox6:setName("checkBox6");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.rectangle1);
    obj.layout122:setLeft(726);
    obj.layout122:setTop(1438);
    obj.layout122:setWidth(19);
    obj.layout122:setHeight(21);
    obj.layout122:setName("layout122");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout122);
    obj.checkBox7:setScale(1.5);
    obj.checkBox7:setTop(0);
    obj.checkBox7:setWidth(19);
    obj.checkBox7:setHeight(22);
    obj.checkBox7:setField("gnosecheck1_6");
    obj.checkBox7:setName("checkBox7");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.rectangle1);
    obj.layout123:setLeft(761);
    obj.layout123:setTop(1437);
    obj.layout123:setWidth(19);
    obj.layout123:setHeight(21);
    obj.layout123:setName("layout123");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout123);
    obj.checkBox8:setScale(1.5);
    obj.checkBox8:setTop(0);
    obj.checkBox8:setWidth(19);
    obj.checkBox8:setHeight(22);
    obj.checkBox8:setField("gnosecheck1_7");
    obj.checkBox8:setName("checkBox8");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.rectangle1);
    obj.layout124:setLeft(798);
    obj.layout124:setTop(1436);
    obj.layout124:setWidth(19);
    obj.layout124:setHeight(21);
    obj.layout124:setName("layout124");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout124);
    obj.checkBox9:setScale(1.5);
    obj.checkBox9:setTop(0);
    obj.checkBox9:setWidth(19);
    obj.checkBox9:setHeight(22);
    obj.checkBox9:setField("gnosecheck1_8");
    obj.checkBox9:setName("checkBox9");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.rectangle1);
    obj.layout125:setLeft(835);
    obj.layout125:setTop(1437);
    obj.layout125:setWidth(19);
    obj.layout125:setHeight(21);
    obj.layout125:setName("layout125");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout125);
    obj.checkBox10:setScale(1.5);
    obj.checkBox10:setTop(0);
    obj.checkBox10:setWidth(19);
    obj.checkBox10:setHeight(22);
    obj.checkBox10:setField("gnosecheck1_9");
    obj.checkBox10:setName("checkBox10");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle1);
    obj.layout126:setLeft(515);
    obj.layout126:setTop(1549);
    obj.layout126:setWidth(20);
    obj.layout126:setHeight(20);
    obj.layout126:setName("layout126");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout126);
    obj.checkBox11:setScale(1.5);
    obj.checkBox11:setField("fvcheck1_0");
    obj.checkBox11:setName("checkBox11");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.rectangle1);
    obj.layout127:setLeft(551);
    obj.layout127:setTop(1548);
    obj.layout127:setWidth(19);
    obj.layout127:setHeight(21);
    obj.layout127:setName("layout127");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout127);
    obj.checkBox12:setScale(1.5);
    obj.checkBox12:setField("check2_0a");
    obj.checkBox12:setName("checkBox12");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.rectangle1);
    obj.layout128:setLeft(586);
    obj.layout128:setTop(1549);
    obj.layout128:setWidth(20);
    obj.layout128:setHeight(20);
    obj.layout128:setName("layout128");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout128);
    obj.checkBox13:setScale(1.5);
    obj.checkBox13:setField("fvcheck1_1");
    obj.checkBox13:setName("checkBox13");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.rectangle1);
    obj.layout129:setLeft(656);
    obj.layout129:setTop(1550);
    obj.layout129:setWidth(20);
    obj.layout129:setHeight(20);
    obj.layout129:setName("layout129");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout129);
    obj.checkBox14:setScale(1.5);
    obj.checkBox14:setField("fvcheck1_2");
    obj.checkBox14:setName("checkBox14");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.rectangle1);
    obj.layout130:setLeft(726);
    obj.layout130:setTop(1550);
    obj.layout130:setWidth(20);
    obj.layout130:setHeight(20);
    obj.layout130:setName("layout130");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout130);
    obj.checkBox15:setScale(1.5);
    obj.checkBox15:setField("fvcheck1_3");
    obj.checkBox15:setName("checkBox15");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.rectangle1);
    obj.layout131:setLeft(798);
    obj.layout131:setTop(1549);
    obj.layout131:setWidth(20);
    obj.layout131:setHeight(20);
    obj.layout131:setName("layout131");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout131);
    obj.checkBox16:setScale(1.5);
    obj.checkBox16:setField("fvcheck1_4");
    obj.checkBox16:setName("checkBox16");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.rectangle1);
    obj.layout132:setLeft(623);
    obj.layout132:setTop(1548);
    obj.layout132:setWidth(19);
    obj.layout132:setHeight(21);
    obj.layout132:setName("layout132");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout132);
    obj.checkBox17:setScale(1.5);
    obj.checkBox17:setField("check2_1b");
    obj.checkBox17:setName("checkBox17");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle1);
    obj.layout133:setLeft(693);
    obj.layout133:setTop(1549);
    obj.layout133:setWidth(19);
    obj.layout133:setHeight(21);
    obj.layout133:setName("layout133");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout133);
    obj.checkBox18:setScale(1.5);
    obj.checkBox18:setAlign("client");
    obj.checkBox18:setField("check2_2qqq");
    obj.checkBox18:setName("checkBox18");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.rectangle1);
    obj.layout134:setLeft(763);
    obj.layout134:setTop(1549);
    obj.layout134:setWidth(19);
    obj.layout134:setHeight(21);
    obj.layout134:setName("layout134");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout134);
    obj.checkBox19:setScale(1.5);
    obj.checkBox19:setAlign("client");
    obj.checkBox19:setField("check2_3www");
    obj.checkBox19:setName("checkBox19");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.rectangle1);
    obj.layout135:setLeft(835);
    obj.layout135:setTop(1548);
    obj.layout135:setWidth(19);
    obj.layout135:setHeight(21);
    obj.layout135:setName("layout135");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout135);
    obj.checkBox20:setScale(1.5);
    obj.checkBox20:setField("check2_4v");
    obj.checkBox20:setName("checkBox20");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.rectangle1);
    obj.layout136:setLeft(514);
    obj.layout136:setTop(1326);
    obj.layout136:setWidth(21);
    obj.layout136:setHeight(21);
    obj.layout136:setName("layout136");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout136);
    obj.checkBox21:setScale(1.5);
    obj.checkBox21:setField("furiacheck1_0");
    obj.checkBox21:setName("checkBox21");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.rectangle1);
    obj.layout137:setLeft(551);
    obj.layout137:setTop(1326);
    obj.layout137:setWidth(20);
    obj.layout137:setHeight(20);
    obj.layout137:setName("layout137");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout137);
    obj.checkBox22:setScale(1.5);
    obj.checkBox22:setField("furiacheck2_0");
    obj.checkBox22:setName("checkBox22");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle1);
    obj.layout138:setLeft(623);
    obj.layout138:setTop(1326);
    obj.layout138:setWidth(20);
    obj.layout138:setHeight(20);
    obj.layout138:setName("layout138");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout138);
    obj.checkBox23:setScale(1.5);
    obj.checkBox23:setField("furiacheck2_1");
    obj.checkBox23:setName("checkBox23");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle1);
    obj.layout139:setLeft(692);
    obj.layout139:setTop(1326);
    obj.layout139:setWidth(20);
    obj.layout139:setHeight(20);
    obj.layout139:setName("layout139");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout139);
    obj.checkBox24:setScale(1.5);
    obj.checkBox24:setField("furiacheck2_2");
    obj.checkBox24:setName("checkBox24");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle1);
    obj.layout140:setLeft(762);
    obj.layout140:setTop(1326);
    obj.layout140:setWidth(20);
    obj.layout140:setHeight(20);
    obj.layout140:setName("layout140");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout140);
    obj.checkBox25:setScale(1.5);
    obj.checkBox25:setField("furiacheck2_3");
    obj.checkBox25:setName("checkBox25");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle1);
    obj.layout141:setLeft(835);
    obj.layout141:setTop(1326);
    obj.layout141:setWidth(20);
    obj.layout141:setHeight(20);
    obj.layout141:setName("layout141");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout141);
    obj.checkBox26:setScale(1.5);
    obj.checkBox26:setField("furiacheck2_4");
    obj.checkBox26:setName("checkBox26");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle1);
    obj.layout142:setLeft(586);
    obj.layout142:setTop(1326);
    obj.layout142:setWidth(21);
    obj.layout142:setHeight(21);
    obj.layout142:setName("layout142");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout142);
    obj.checkBox27:setScale(1.5);
    obj.checkBox27:setField("furiacheck1_1");
    obj.checkBox27:setName("checkBox27");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle1);
    obj.layout143:setLeft(655);
    obj.layout143:setTop(1326);
    obj.layout143:setWidth(21);
    obj.layout143:setHeight(21);
    obj.layout143:setName("layout143");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout143);
    obj.checkBox28:setScale(1.5);
    obj.checkBox28:setField("furiacheck1_2");
    obj.checkBox28:setName("checkBox28");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle1);
    obj.layout144:setLeft(725);
    obj.layout144:setTop(1326);
    obj.layout144:setWidth(21);
    obj.layout144:setHeight(21);
    obj.layout144:setName("layout144");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout144);
    obj.checkBox29:setScale(1.5);
    obj.checkBox29:setField("furiacheck1_3");
    obj.checkBox29:setName("checkBox29");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle1);
    obj.layout145:setLeft(798);
    obj.layout145:setTop(1326);
    obj.layout145:setWidth(21);
    obj.layout145:setHeight(21);
    obj.layout145:setName("layout145");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout145);
    obj.checkBox30:setScale(1.5);
    obj.checkBox30:setField("furiacheck1_4");
    obj.checkBox30:setName("checkBox30");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.rectangle1);
    obj.layout146:setLeft(517);
    obj.layout146:setTop(1295);
    obj.layout146:setWidth(20);
    obj.layout146:setHeight(21);
    obj.layout146:setName("layout146");

    obj.imageCheckBox91 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox91:setParent(obj.layout146);
    obj.imageCheckBox91:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox91:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox91:setAlign("client");
    obj.imageCheckBox91:setField("_0");
    obj.imageCheckBox91:setName("imageCheckBox91");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.rectangle1);
    obj.layout147:setLeft(551);
    obj.layout147:setTop(1295);
    obj.layout147:setWidth(20);
    obj.layout147:setHeight(21);
    obj.layout147:setName("layout147");

    obj.imageCheckBox92 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox92:setParent(obj.layout147);
    obj.imageCheckBox92:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox92:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox92:setAlign("client");
    obj.imageCheckBox92:setField("2_sssss");
    obj.imageCheckBox92:setName("imageCheckBox92");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle1);
    obj.layout148:setLeft(622);
    obj.layout148:setTop(1296);
    obj.layout148:setWidth(20);
    obj.layout148:setHeight(21);
    obj.layout148:setName("layout148");

    obj.imageCheckBox93 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox93:setParent(obj.layout148);
    obj.imageCheckBox93:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox93:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox93:setAlign("client");
    obj.imageCheckBox93:setField("2_1");
    obj.imageCheckBox93:setName("imageCheckBox93");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle1);
    obj.layout149:setLeft(692);
    obj.layout149:setTop(1295);
    obj.layout149:setWidth(20);
    obj.layout149:setHeight(21);
    obj.layout149:setName("layout149");

    obj.imageCheckBox94 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox94:setParent(obj.layout149);
    obj.imageCheckBox94:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox94:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox94:setAlign("client");
    obj.imageCheckBox94:setField("2_2ssssssss");
    obj.imageCheckBox94:setName("imageCheckBox94");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle1);
    obj.layout150:setLeft(763);
    obj.layout150:setTop(1296);
    obj.layout150:setWidth(20);
    obj.layout150:setHeight(21);
    obj.layout150:setName("layout150");

    obj.imageCheckBox95 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox95:setParent(obj.layout150);
    obj.imageCheckBox95:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox95:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox95:setAlign("client");
    obj.imageCheckBox95:setField("sdsdsdsd");
    obj.imageCheckBox95:setName("imageCheckBox95");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.rectangle1);
    obj.layout151:setLeft(834);
    obj.layout151:setTop(1295);
    obj.layout151:setWidth(20);
    obj.layout151:setHeight(21);
    obj.layout151:setName("layout151");

    obj.imageCheckBox96 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox96:setParent(obj.layout151);
    obj.imageCheckBox96:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox96:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox96:setAlign("client");
    obj.imageCheckBox96:setField("2_4aaaaaaaaaaaaaaaa");
    obj.imageCheckBox96:setName("imageCheckBox96");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.rectangle1);
    obj.layout152:setLeft(587);
    obj.layout152:setTop(1296);
    obj.layout152:setWidth(20);
    obj.layout152:setHeight(21);
    obj.layout152:setName("layout152");

    obj.imageCheckBox97 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox97:setParent(obj.layout152);
    obj.imageCheckBox97:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox97:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox97:setAlign("client");
    obj.imageCheckBox97:setField("_1sdssdsd");
    obj.imageCheckBox97:setName("imageCheckBox97");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle1);
    obj.layout153:setLeft(658);
    obj.layout153:setTop(1295);
    obj.layout153:setWidth(20);
    obj.layout153:setHeight(21);
    obj.layout153:setName("layout153");

    obj.imageCheckBox98 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox98:setParent(obj.layout153);
    obj.imageCheckBox98:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox98:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox98:setAlign("client");
    obj.imageCheckBox98:setField("_ddsdds2");
    obj.imageCheckBox98:setName("imageCheckBox98");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.rectangle1);
    obj.layout154:setLeft(729);
    obj.layout154:setTop(1296);
    obj.layout154:setWidth(20);
    obj.layout154:setHeight(21);
    obj.layout154:setName("layout154");

    obj.imageCheckBox99 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox99:setParent(obj.layout154);
    obj.imageCheckBox99:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox99:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox99:setAlign("client");
    obj.imageCheckBox99:setField("_3aaaaaa");
    obj.imageCheckBox99:setName("imageCheckBox99");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.rectangle1);
    obj.layout155:setLeft(799);
    obj.layout155:setTop(1295);
    obj.layout155:setWidth(20);
    obj.layout155:setHeight(21);
    obj.layout155:setName("layout155");

    obj.imageCheckBox100 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox100:setParent(obj.layout155);
    obj.imageCheckBox100:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox100:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox100:setAlign("client");
    obj.imageCheckBox100:setField("_4");
    obj.imageCheckBox100:setName("imageCheckBox100");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.rectangle1);
    obj.layout156:setLeft(516);
    obj.layout156:setTop(1407);
    obj.layout156:setWidth(20);
    obj.layout156:setHeight(21);
    obj.layout156:setName("layout156");

    obj.imageCheckBox101 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox101:setParent(obj.layout156);
    obj.imageCheckBox101:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox101:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox101:setAlign("client");
    obj.imageCheckBox101:setField("b1_0");
    obj.imageCheckBox101:setName("imageCheckBox101");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.rectangle1);
    obj.layout157:setLeft(551);
    obj.layout157:setTop(1406);
    obj.layout157:setWidth(20);
    obj.layout157:setHeight(21);
    obj.layout157:setName("layout157");

    obj.imageCheckBox102 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox102:setParent(obj.layout157);
    obj.imageCheckBox102:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox102:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox102:setAlign("client");
    obj.imageCheckBox102:setField("2_aaaaaa0");
    obj.imageCheckBox102:setName("imageCheckBox102");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.rectangle1);
    obj.layout158:setLeft(622);
    obj.layout158:setTop(1407);
    obj.layout158:setWidth(20);
    obj.layout158:setHeight(21);
    obj.layout158:setName("layout158");

    obj.imageCheckBox103 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox103:setParent(obj.layout158);
    obj.imageCheckBox103:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox103:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox103:setAlign("client");
    obj.imageCheckBox103:setField("2_ssssssss");
    obj.imageCheckBox103:setName("imageCheckBox103");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.rectangle1);
    obj.layout159:setLeft(692);
    obj.layout159:setTop(1406);
    obj.layout159:setWidth(20);
    obj.layout159:setHeight(21);
    obj.layout159:setName("layout159");

    obj.imageCheckBox104 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox104:setParent(obj.layout159);
    obj.imageCheckBox104:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox104:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox104:setAlign("client");
    obj.imageCheckBox104:setField("2_2asasasasas");
    obj.imageCheckBox104:setName("imageCheckBox104");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.rectangle1);
    obj.layout160:setLeft(763);
    obj.layout160:setTop(1407);
    obj.layout160:setWidth(20);
    obj.layout160:setHeight(21);
    obj.layout160:setName("layout160");

    obj.imageCheckBox105 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox105:setParent(obj.layout160);
    obj.imageCheckBox105:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox105:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox105:setAlign("client");
    obj.imageCheckBox105:setField("2_3kkkkk");
    obj.imageCheckBox105:setName("imageCheckBox105");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.rectangle1);
    obj.layout161:setLeft(833);
    obj.layout161:setTop(1407);
    obj.layout161:setWidth(20);
    obj.layout161:setHeight(21);
    obj.layout161:setName("layout161");

    obj.imageCheckBox106 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox106:setParent(obj.layout161);
    obj.imageCheckBox106:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox106:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox106:setAlign("client");
    obj.imageCheckBox106:setField("2_4qwqw");
    obj.imageCheckBox106:setName("imageCheckBox106");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.rectangle1);
    obj.layout162:setLeft(587);
    obj.layout162:setTop(1407);
    obj.layout162:setWidth(20);
    obj.layout162:setHeight(21);
    obj.layout162:setName("layout162");

    obj.imageCheckBox107 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox107:setParent(obj.layout162);
    obj.imageCheckBox107:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox107:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox107:setAlign("client");
    obj.imageCheckBox107:setField("c1_1");
    obj.imageCheckBox107:setName("imageCheckBox107");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.rectangle1);
    obj.layout163:setLeft(657);
    obj.layout163:setTop(1406);
    obj.layout163:setWidth(20);
    obj.layout163:setHeight(21);
    obj.layout163:setName("layout163");

    obj.imageCheckBox108 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox108:setParent(obj.layout163);
    obj.imageCheckBox108:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox108:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox108:setAlign("client");
    obj.imageCheckBox108:setField("a1_2");
    obj.imageCheckBox108:setName("imageCheckBox108");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.rectangle1);
    obj.layout164:setLeft(728);
    obj.layout164:setTop(1407);
    obj.layout164:setWidth(20);
    obj.layout164:setHeight(21);
    obj.layout164:setName("layout164");

    obj.imageCheckBox109 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox109:setParent(obj.layout164);
    obj.imageCheckBox109:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox109:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox109:setAlign("client");
    obj.imageCheckBox109:setField("1_3aa");
    obj.imageCheckBox109:setName("imageCheckBox109");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.rectangle1);
    obj.layout165:setLeft(798);
    obj.layout165:setTop(1407);
    obj.layout165:setWidth(20);
    obj.layout165:setHeight(21);
    obj.layout165:setName("layout165");

    obj.imageCheckBox110 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox110:setParent(obj.layout165);
    obj.imageCheckBox110:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox110:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox110:setAlign("client");
    obj.imageCheckBox110:setField("1_aaaaaa4");
    obj.imageCheckBox110:setName("imageCheckBox110");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.rectangle1);
    obj.layout166:setLeft(516);
    obj.layout166:setTop(1518);
    obj.layout166:setWidth(20);
    obj.layout166:setHeight(21);
    obj.layout166:setName("layout166");

    obj.imageCheckBox111 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox111:setParent(obj.layout166);
    obj.imageCheckBox111:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox111:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox111:setAlign("client");
    obj.imageCheckBox111:setField("1c_0");
    obj.imageCheckBox111:setName("imageCheckBox111");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.rectangle1);
    obj.layout167:setLeft(552);
    obj.layout167:setTop(1518);
    obj.layout167:setWidth(19);
    obj.layout167:setHeight(21);
    obj.layout167:setName("layout167");

    obj.imageCheckBox112 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox112:setParent(obj.layout167);
    obj.imageCheckBox112:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox112:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox112:setAlign("client");
    obj.imageCheckBox112:setField("2_0qqqqqqq");
    obj.imageCheckBox112:setName("imageCheckBox112");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.rectangle1);
    obj.layout168:setLeft(622);
    obj.layout168:setTop(1518);
    obj.layout168:setWidth(19);
    obj.layout168:setHeight(21);
    obj.layout168:setName("layout168");

    obj.imageCheckBox113 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox113:setParent(obj.layout168);
    obj.imageCheckBox113:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox113:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox113:setAlign("client");
    obj.imageCheckBox113:setField("2_1wwwww");
    obj.imageCheckBox113:setName("imageCheckBox113");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.rectangle1);
    obj.layout169:setLeft(693);
    obj.layout169:setTop(1518);
    obj.layout169:setWidth(19);
    obj.layout169:setHeight(21);
    obj.layout169:setName("layout169");

    obj.imageCheckBox114 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox114:setParent(obj.layout169);
    obj.imageCheckBox114:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox114:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox114:setAlign("client");
    obj.imageCheckBox114:setField("2_2dddddd");
    obj.imageCheckBox114:setName("imageCheckBox114");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.rectangle1);
    obj.layout170:setLeft(763);
    obj.layout170:setTop(1518);
    obj.layout170:setWidth(19);
    obj.layout170:setHeight(21);
    obj.layout170:setName("layout170");

    obj.imageCheckBox115 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox115:setParent(obj.layout170);
    obj.imageCheckBox115:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox115:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox115:setAlign("client");
    obj.imageCheckBox115:setField("2_3aaaaaaaaaaaaaaa");
    obj.imageCheckBox115:setName("imageCheckBox115");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.rectangle1);
    obj.layout171:setLeft(834);
    obj.layout171:setTop(1517);
    obj.layout171:setWidth(19);
    obj.layout171:setHeight(21);
    obj.layout171:setName("layout171");

    obj.imageCheckBox116 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox116:setParent(obj.layout171);
    obj.imageCheckBox116:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox116:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox116:setAlign("client");
    obj.imageCheckBox116:setField("2_4aaaaaaaaa");
    obj.imageCheckBox116:setName("imageCheckBox116");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.rectangle1);
    obj.layout172:setLeft(587);
    obj.layout172:setTop(1518);
    obj.layout172:setWidth(20);
    obj.layout172:setHeight(21);
    obj.layout172:setName("layout172");

    obj.imageCheckBox117 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox117:setParent(obj.layout172);
    obj.imageCheckBox117:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox117:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox117:setAlign("client");
    obj.imageCheckBox117:setField("1_a1");
    obj.imageCheckBox117:setName("imageCheckBox117");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.rectangle1);
    obj.layout173:setLeft(657);
    obj.layout173:setTop(1518);
    obj.layout173:setWidth(20);
    obj.layout173:setHeight(21);
    obj.layout173:setName("layout173");

    obj.imageCheckBox118 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox118:setParent(obj.layout173);
    obj.imageCheckBox118:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox118:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox118:setAlign("client");
    obj.imageCheckBox118:setField("1_s2");
    obj.imageCheckBox118:setName("imageCheckBox118");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.rectangle1);
    obj.layout174:setLeft(728);
    obj.layout174:setTop(1518);
    obj.layout174:setWidth(20);
    obj.layout174:setHeight(21);
    obj.layout174:setName("layout174");

    obj.imageCheckBox119 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox119:setParent(obj.layout174);
    obj.imageCheckBox119:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox119:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox119:setAlign("client");
    obj.imageCheckBox119:setField("1_3888");
    obj.imageCheckBox119:setName("imageCheckBox119");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.rectangle1);
    obj.layout175:setLeft(798);
    obj.layout175:setTop(1518);
    obj.layout175:setWidth(20);
    obj.layout175:setHeight(21);
    obj.layout175:setName("layout175");

    obj.imageCheckBox120 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox120:setParent(obj.layout175);
    obj.imageCheckBox120:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox120:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox120:setAlign("client");
    obj.imageCheckBox120:setField("1_4");
    obj.imageCheckBox120:setName("imageCheckBox120");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.rectangle1);
    obj.layout176:setLeft(1132);
    obj.layout176:setTop(688);
    obj.layout176:setWidth(20);
    obj.layout176:setHeight(21);
    obj.layout176:setName("layout176");

    obj.imageCheckBox121 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox121:setParent(obj.layout176);
    obj.imageCheckBox121:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox121:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox121:setAlign("client");
    obj.imageCheckBox121:setField("1_0_0");
    obj.imageCheckBox121:setName("imageCheckBox121");

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.rectangle1);
    obj.layout177:setLeft(1153);
    obj.layout177:setTop(689);
    obj.layout177:setWidth(20);
    obj.layout177:setHeight(21);
    obj.layout177:setName("layout177");

    obj.imageCheckBox122 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox122:setParent(obj.layout177);
    obj.imageCheckBox122:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox122:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox122:setAlign("client");
    obj.imageCheckBox122:setField("2_sdfsdf0");
    obj.imageCheckBox122:setName("imageCheckBox122");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.rectangle1);
    obj.layout178:setLeft(1131);
    obj.layout178:setTop(721);
    obj.layout178:setWidth(21);
    obj.layout178:setHeight(23);
    obj.layout178:setName("layout178");

    obj.imageCheckBox123 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox123:setParent(obj.layout178);
    obj.imageCheckBox123:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox123:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox123:setAlign("client");
    obj.imageCheckBox123:setField("3_0_0");
    obj.imageCheckBox123:setName("imageCheckBox123");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.rectangle1);
    obj.layout179:setLeft(1153);
    obj.layout179:setTop(721);
    obj.layout179:setWidth(20);
    obj.layout179:setHeight(22);
    obj.layout179:setName("layout179");

    obj.imageCheckBox124 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox124:setParent(obj.layout179);
    obj.imageCheckBox124:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox124:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox124:setAlign("client");
    obj.imageCheckBox124:setField("4_0_0");
    obj.imageCheckBox124:setName("imageCheckBox124");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.rectangle1);
    obj.layout180:setLeft(1175);
    obj.layout180:setTop(688);
    obj.layout180:setWidth(20);
    obj.layout180:setHeight(21);
    obj.layout180:setName("layout180");

    obj.imageCheckBox125 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox125:setParent(obj.layout180);
    obj.imageCheckBox125:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox125:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox125:setAlign("client");
    obj.imageCheckBox125:setField("1_0_1");
    obj.imageCheckBox125:setName("imageCheckBox125");

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.rectangle1);
    obj.layout181:setLeft(1131);
    obj.layout181:setTop(754);
    obj.layout181:setWidth(20);
    obj.layout181:setHeight(21);
    obj.layout181:setName("layout181");

    obj.imageCheckBox126 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox126:setParent(obj.layout181);
    obj.imageCheckBox126:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox126:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox126:setAlign("client");
    obj.imageCheckBox126:setField("1_1_0");
    obj.imageCheckBox126:setName("imageCheckBox126");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.rectangle1);
    obj.layout182:setLeft(1175);
    obj.layout182:setTop(754);
    obj.layout182:setWidth(20);
    obj.layout182:setHeight(21);
    obj.layout182:setName("layout182");

    obj.imageCheckBox127 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox127:setParent(obj.layout182);
    obj.imageCheckBox127:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox127:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox127:setAlign("client");
    obj.imageCheckBox127:setField("1_1_1");
    obj.imageCheckBox127:setName("imageCheckBox127");

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.rectangle1);
    obj.layout183:setLeft(1132);
    obj.layout183:setTop(854);
    obj.layout183:setWidth(20);
    obj.layout183:setHeight(21);
    obj.layout183:setName("layout183");

    obj.imageCheckBox128 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox128:setParent(obj.layout183);
    obj.imageCheckBox128:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox128:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox128:setAlign("client");
    obj.imageCheckBox128:setField("1_3_0");
    obj.imageCheckBox128:setName("imageCheckBox128");

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.rectangle1);
    obj.layout184:setLeft(1175);
    obj.layout184:setTop(854);
    obj.layout184:setWidth(20);
    obj.layout184:setHeight(21);
    obj.layout184:setName("layout184");

    obj.imageCheckBox129 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox129:setParent(obj.layout184);
    obj.imageCheckBox129:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox129:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox129:setAlign("client");
    obj.imageCheckBox129:setField("1_3_1");
    obj.imageCheckBox129:setName("imageCheckBox129");

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.rectangle1);
    obj.layout185:setLeft(1131);
    obj.layout185:setTop(919);
    obj.layout185:setWidth(20);
    obj.layout185:setHeight(21);
    obj.layout185:setName("layout185");

    obj.imageCheckBox130 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox130:setParent(obj.layout185);
    obj.imageCheckBox130:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox130:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox130:setAlign("client");
    obj.imageCheckBox130:setField("1_4_aa0");
    obj.imageCheckBox130:setName("imageCheckBox130");

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.rectangle1);
    obj.layout186:setLeft(1175);
    obj.layout186:setTop(919);
    obj.layout186:setWidth(20);
    obj.layout186:setHeight(21);
    obj.layout186:setName("layout186");

    obj.imageCheckBox131 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox131:setParent(obj.layout186);
    obj.imageCheckBox131:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox131:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox131:setAlign("client");
    obj.imageCheckBox131:setField("1_4_1");
    obj.imageCheckBox131:setName("imageCheckBox131");

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.rectangle1);
    obj.layout187:setLeft(1196);
    obj.layout187:setTop(688);
    obj.layout187:setWidth(19);
    obj.layout187:setHeight(21);
    obj.layout187:setName("layout187");

    obj.imageCheckBox132 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox132:setParent(obj.layout187);
    obj.imageCheckBox132:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox132:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox132:setAlign("client");
    obj.imageCheckBox132:setField("2_ffdsfsd");
    obj.imageCheckBox132:setName("imageCheckBox132");

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.rectangle1);
    obj.layout188:setLeft(1152);
    obj.layout188:setTop(754);
    obj.layout188:setWidth(20);
    obj.layout188:setHeight(21);
    obj.layout188:setName("layout188");

    obj.imageCheckBox133 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox133:setParent(obj.layout188);
    obj.imageCheckBox133:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox133:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox133:setAlign("client");
    obj.imageCheckBox133:setField("2_1_0");
    obj.imageCheckBox133:setName("imageCheckBox133");

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.rectangle1);
    obj.layout189:setLeft(1195);
    obj.layout189:setTop(754);
    obj.layout189:setWidth(20);
    obj.layout189:setHeight(21);
    obj.layout189:setName("layout189");

    obj.imageCheckBox134 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox134:setParent(obj.layout189);
    obj.imageCheckBox134:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox134:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox134:setAlign("client");
    obj.imageCheckBox134:setField("2_1sdssd0");
    obj.imageCheckBox134:setName("imageCheckBox134");

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.rectangle1);
    obj.layout190:setLeft(1153);
    obj.layout190:setTop(854);
    obj.layout190:setWidth(20);
    obj.layout190:setHeight(21);
    obj.layout190:setName("layout190");

    obj.imageCheckBox135 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox135:setParent(obj.layout190);
    obj.imageCheckBox135:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox135:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox135:setAlign("client");
    obj.imageCheckBox135:setField("2_3_0");
    obj.imageCheckBox135:setName("imageCheckBox135");

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.rectangle1);
    obj.layout191:setLeft(1196);
    obj.layout191:setTop(854);
    obj.layout191:setWidth(19);
    obj.layout191:setHeight(21);
    obj.layout191:setName("layout191");

    obj.imageCheckBox136 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox136:setParent(obj.layout191);
    obj.imageCheckBox136:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox136:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox136:setAlign("client");
    obj.imageCheckBox136:setField("2_3_1_0");
    obj.imageCheckBox136:setName("imageCheckBox136");

    obj.layout192 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.rectangle1);
    obj.layout192:setLeft(1152);
    obj.layout192:setTop(919);
    obj.layout192:setWidth(20);
    obj.layout192:setHeight(21);
    obj.layout192:setName("layout192");

    obj.imageCheckBox137 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox137:setParent(obj.layout192);
    obj.imageCheckBox137:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox137:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox137:setAlign("client");
    obj.imageCheckBox137:setField("2_4_0");
    obj.imageCheckBox137:setName("imageCheckBox137");

    obj.layout193 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.rectangle1);
    obj.layout193:setLeft(1196);
    obj.layout193:setTop(919);
    obj.layout193:setWidth(19);
    obj.layout193:setHeight(21);
    obj.layout193:setName("layout193");

    obj.imageCheckBox138 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox138:setParent(obj.layout193);
    obj.imageCheckBox138:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox138:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox138:setAlign("client");
    obj.imageCheckBox138:setField("2_4_sd");
    obj.imageCheckBox138:setName("imageCheckBox138");

    obj.layout194 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.rectangle1);
    obj.layout194:setLeft(1175);
    obj.layout194:setTop(721);
    obj.layout194:setWidth(21);
    obj.layout194:setHeight(23);
    obj.layout194:setName("layout194");

    obj.imageCheckBox139 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox139:setParent(obj.layout194);
    obj.imageCheckBox139:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox139:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox139:setAlign("client");
    obj.imageCheckBox139:setField("3_0_1");
    obj.imageCheckBox139:setName("imageCheckBox139");

    obj.layout195 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.rectangle1);
    obj.layout195:setLeft(1130);
    obj.layout195:setTop(785);
    obj.layout195:setWidth(21);
    obj.layout195:setHeight(23);
    obj.layout195:setName("layout195");

    obj.imageCheckBox140 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox140:setParent(obj.layout195);
    obj.imageCheckBox140:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox140:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox140:setAlign("client");
    obj.imageCheckBox140:setField("3_1_0");
    obj.imageCheckBox140:setName("imageCheckBox140");

    obj.layout196 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.rectangle1);
    obj.layout196:setLeft(1174);
    obj.layout196:setTop(785);
    obj.layout196:setWidth(21);
    obj.layout196:setHeight(23);
    obj.layout196:setName("layout196");

    obj.imageCheckBox141 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox141:setParent(obj.layout196);
    obj.imageCheckBox141:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox141:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox141:setAlign("client");
    obj.imageCheckBox141:setField("3_1_1");
    obj.imageCheckBox141:setName("imageCheckBox141");

    obj.layout197 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.rectangle1);
    obj.layout197:setLeft(1132);
    obj.layout197:setTop(820);
    obj.layout197:setWidth(21);
    obj.layout197:setHeight(23);
    obj.layout197:setName("layout197");

    obj.imageCheckBox142 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox142:setParent(obj.layout197);
    obj.imageCheckBox142:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox142:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox142:setAlign("client");
    obj.imageCheckBox142:setField("3_2_0");
    obj.imageCheckBox142:setName("imageCheckBox142");

    obj.layout198 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.rectangle1);
    obj.layout198:setLeft(1175);
    obj.layout198:setTop(820);
    obj.layout198:setWidth(21);
    obj.layout198:setHeight(23);
    obj.layout198:setName("layout198");

    obj.imageCheckBox143 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox143:setParent(obj.layout198);
    obj.imageCheckBox143:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox143:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox143:setAlign("client");
    obj.imageCheckBox143:setField("3_2_1");
    obj.imageCheckBox143:setName("imageCheckBox143");

    obj.layout199 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.rectangle1);
    obj.layout199:setLeft(1131);
    obj.layout199:setTop(886);
    obj.layout199:setWidth(21);
    obj.layout199:setHeight(23);
    obj.layout199:setName("layout199");

    obj.imageCheckBox144 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox144:setParent(obj.layout199);
    obj.imageCheckBox144:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox144:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox144:setAlign("client");
    obj.imageCheckBox144:setField("3_3_0");
    obj.imageCheckBox144:setName("imageCheckBox144");

    obj.layout200 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.rectangle1);
    obj.layout200:setLeft(1175);
    obj.layout200:setTop(886);
    obj.layout200:setWidth(21);
    obj.layout200:setHeight(23);
    obj.layout200:setName("layout200");

    obj.imageCheckBox145 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox145:setParent(obj.layout200);
    obj.imageCheckBox145:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox145:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox145:setAlign("client");
    obj.imageCheckBox145:setField("3_3_1");
    obj.imageCheckBox145:setName("imageCheckBox145");

    obj.layout201 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.rectangle1);
    obj.layout201:setLeft(1130);
    obj.layout201:setTop(950);
    obj.layout201:setWidth(21);
    obj.layout201:setHeight(23);
    obj.layout201:setName("layout201");

    obj.imageCheckBox146 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox146:setParent(obj.layout201);
    obj.imageCheckBox146:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox146:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox146:setAlign("client");
    obj.imageCheckBox146:setField("3_4_0");
    obj.imageCheckBox146:setName("imageCheckBox146");

    obj.layout202 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.rectangle1);
    obj.layout202:setLeft(1174);
    obj.layout202:setTop(950);
    obj.layout202:setWidth(21);
    obj.layout202:setHeight(23);
    obj.layout202:setName("layout202");

    obj.imageCheckBox147 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox147:setParent(obj.layout202);
    obj.imageCheckBox147:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox147:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox147:setAlign("client");
    obj.imageCheckBox147:setField("3_4_1");
    obj.imageCheckBox147:setName("imageCheckBox147");

    obj.layout203 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.rectangle1);
    obj.layout203:setLeft(1196);
    obj.layout203:setTop(721);
    obj.layout203:setWidth(20);
    obj.layout203:setHeight(22);
    obj.layout203:setName("layout203");

    obj.imageCheckBox148 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox148:setParent(obj.layout203);
    obj.imageCheckBox148:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox148:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox148:setAlign("client");
    obj.imageCheckBox148:setField("4_0_1_0");
    obj.imageCheckBox148:setName("imageCheckBox148");

    obj.layout204 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.rectangle1);
    obj.layout204:setLeft(1152);
    obj.layout204:setTop(786);
    obj.layout204:setWidth(20);
    obj.layout204:setHeight(22);
    obj.layout204:setName("layout204");

    obj.imageCheckBox149 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox149:setParent(obj.layout204);
    obj.imageCheckBox149:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox149:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox149:setAlign("client");
    obj.imageCheckBox149:setField("4_1_0");
    obj.imageCheckBox149:setName("imageCheckBox149");

    obj.layout205 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.rectangle1);
    obj.layout205:setLeft(1196);
    obj.layout205:setTop(786);
    obj.layout205:setWidth(20);
    obj.layout205:setHeight(22);
    obj.layout205:setName("layout205");

    obj.imageCheckBox150 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox150:setParent(obj.layout205);
    obj.imageCheckBox150:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox150:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox150:setAlign("client");
    obj.imageCheckBox150:setField("4_1_1_0");
    obj.imageCheckBox150:setName("imageCheckBox150");

    obj.layout206 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.rectangle1);
    obj.layout206:setLeft(1153);
    obj.layout206:setTop(821);
    obj.layout206:setWidth(20);
    obj.layout206:setHeight(22);
    obj.layout206:setName("layout206");

    obj.imageCheckBox151 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox151:setParent(obj.layout206);
    obj.imageCheckBox151:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox151:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox151:setAlign("client");
    obj.imageCheckBox151:setField("4_2_0");
    obj.imageCheckBox151:setName("imageCheckBox151");

    obj.layout207 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.rectangle1);
    obj.layout207:setLeft(1197);
    obj.layout207:setTop(821);
    obj.layout207:setWidth(20);
    obj.layout207:setHeight(22);
    obj.layout207:setName("layout207");

    obj.imageCheckBox152 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox152:setParent(obj.layout207);
    obj.imageCheckBox152:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox152:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox152:setAlign("client");
    obj.imageCheckBox152:setField("4_2_1_0");
    obj.imageCheckBox152:setName("imageCheckBox152");

    obj.layout208 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.rectangle1);
    obj.layout208:setLeft(1153);
    obj.layout208:setTop(887);
    obj.layout208:setWidth(20);
    obj.layout208:setHeight(22);
    obj.layout208:setName("layout208");

    obj.imageCheckBox153 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox153:setParent(obj.layout208);
    obj.imageCheckBox153:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox153:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox153:setAlign("client");
    obj.imageCheckBox153:setField("4_3_0");
    obj.imageCheckBox153:setName("imageCheckBox153");

    obj.layout209 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.rectangle1);
    obj.layout209:setLeft(1196);
    obj.layout209:setTop(887);
    obj.layout209:setWidth(20);
    obj.layout209:setHeight(22);
    obj.layout209:setName("layout209");

    obj.imageCheckBox154 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox154:setParent(obj.layout209);
    obj.imageCheckBox154:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox154:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox154:setAlign("client");
    obj.imageCheckBox154:setField("4_3_1_0");
    obj.imageCheckBox154:setName("imageCheckBox154");

    obj.layout210 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.rectangle1);
    obj.layout210:setLeft(1152);
    obj.layout210:setTop(950);
    obj.layout210:setWidth(20);
    obj.layout210:setHeight(22);
    obj.layout210:setName("layout210");

    obj.imageCheckBox155 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox155:setParent(obj.layout210);
    obj.imageCheckBox155:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox155:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox155:setAlign("client");
    obj.imageCheckBox155:setField("4_4_0");
    obj.imageCheckBox155:setName("imageCheckBox155");

    obj.layout211 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.rectangle1);
    obj.layout211:setLeft(1195);
    obj.layout211:setTop(950);
    obj.layout211:setWidth(20);
    obj.layout211:setHeight(22);
    obj.layout211:setName("layout211");

    obj.imageCheckBox156 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox156:setParent(obj.layout211);
    obj.imageCheckBox156:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox156:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox156:setAlign("client");
    obj.imageCheckBox156:setField("4_4_1_0");
    obj.imageCheckBox156:setName("imageCheckBox156");

    obj.layout212 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.rectangle1);
    obj.layout212:setLeft(1218);
    obj.layout212:setTop(689);
    obj.layout212:setWidth(19);
    obj.layout212:setHeight(21);
    obj.layout212:setName("layout212");

    obj.imageCheckBox157 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox157:setParent(obj.layout212);
    obj.imageCheckBox157:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox157:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox157:setAlign("client");
    obj.imageCheckBox157:setField("2_0_1_1");
    obj.imageCheckBox157:setName("imageCheckBox157");

    obj.layout213 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.rectangle1);
    obj.layout213:setLeft(1218);
    obj.layout213:setTop(721);
    obj.layout213:setWidth(20);
    obj.layout213:setHeight(22);
    obj.layout213:setName("layout213");

    obj.imageCheckBox158 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox158:setParent(obj.layout213);
    obj.imageCheckBox158:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox158:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox158:setAlign("client");
    obj.imageCheckBox158:setField("4_0_1_1");
    obj.imageCheckBox158:setName("imageCheckBox158");

    obj.layout214 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.rectangle1);
    obj.layout214:setLeft(1217);
    obj.layout214:setTop(754);
    obj.layout214:setWidth(20);
    obj.layout214:setHeight(21);
    obj.layout214:setName("layout214");

    obj.imageCheckBox159 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox159:setParent(obj.layout214);
    obj.imageCheckBox159:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox159:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox159:setAlign("client");
    obj.imageCheckBox159:setField("2_1_1_1");
    obj.imageCheckBox159:setName("imageCheckBox159");

    obj.layout215 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.rectangle1);
    obj.layout215:setLeft(1218);
    obj.layout215:setTop(786);
    obj.layout215:setWidth(20);
    obj.layout215:setHeight(22);
    obj.layout215:setName("layout215");

    obj.imageCheckBox160 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox160:setParent(obj.layout215);
    obj.imageCheckBox160:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox160:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox160:setAlign("client");
    obj.imageCheckBox160:setField("4_1_1_1");
    obj.imageCheckBox160:setName("imageCheckBox160");

    obj.layout216 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.rectangle1);
    obj.layout216:setLeft(1219);
    obj.layout216:setTop(821);
    obj.layout216:setWidth(20);
    obj.layout216:setHeight(22);
    obj.layout216:setName("layout216");

    obj.imageCheckBox161 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox161:setParent(obj.layout216);
    obj.imageCheckBox161:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox161:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox161:setAlign("client");
    obj.imageCheckBox161:setField("4_2_1_1");
    obj.imageCheckBox161:setName("imageCheckBox161");

    obj.layout217 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.rectangle1);
    obj.layout217:setLeft(1218);
    obj.layout217:setTop(854);
    obj.layout217:setWidth(19);
    obj.layout217:setHeight(21);
    obj.layout217:setName("layout217");

    obj.imageCheckBox162 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox162:setParent(obj.layout217);
    obj.imageCheckBox162:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox162:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox162:setAlign("client");
    obj.imageCheckBox162:setField("2_3_1_1");
    obj.imageCheckBox162:setName("imageCheckBox162");

    obj.layout218 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.rectangle1);
    obj.layout218:setLeft(1218);
    obj.layout218:setTop(887);
    obj.layout218:setWidth(20);
    obj.layout218:setHeight(22);
    obj.layout218:setName("layout218");

    obj.imageCheckBox163 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox163:setParent(obj.layout218);
    obj.imageCheckBox163:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox163:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox163:setAlign("client");
    obj.imageCheckBox163:setField("4_3_1_1");
    obj.imageCheckBox163:setName("imageCheckBox163");

    obj.layout219 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.rectangle1);
    obj.layout219:setLeft(1218);
    obj.layout219:setTop(919);
    obj.layout219:setWidth(19);
    obj.layout219:setHeight(21);
    obj.layout219:setName("layout219");

    obj.imageCheckBox164 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox164:setParent(obj.layout219);
    obj.imageCheckBox164:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox164:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox164:setAlign("client");
    obj.imageCheckBox164:setField("2_4_1_1");
    obj.imageCheckBox164:setName("imageCheckBox164");

    obj.layout220 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.rectangle1);
    obj.layout220:setLeft(1217);
    obj.layout220:setTop(951);
    obj.layout220:setWidth(20);
    obj.layout220:setHeight(22);
    obj.layout220:setName("layout220");

    obj.imageCheckBox165 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox165:setParent(obj.layout220);
    obj.imageCheckBox165:setImageChecked("Lobisomem/images/on.png");
    obj.imageCheckBox165:setImageUnchecked("Lobisomem/images/off.png");
    obj.imageCheckBox165:setAlign("client");
    obj.imageCheckBox165:setField("4_4_1_1");
    obj.imageCheckBox165:setName("imageCheckBox165");

    obj.layout221 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.rectangle1);
    obj.layout221:setLeft(232);
    obj.layout221:setTop(533);
    obj.layout221:setWidth(266);
    obj.layout221:setHeight(52);
    obj.layout221:setName("layout221");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout221);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontSize(27.6);
    obj.edit22:setFontColor("#000000");
    obj.edit22:setHorzTextAlign("leading");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(0);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(266);
    obj.edit22:setHeight(53);
    obj.edit22:setField("Totem");
    obj.edit22:setName("edit22");

    obj.layout222 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.rectangle1);
    obj.layout222:setLeft(630);
    obj.layout222:setTop(530);
    obj.layout222:setWidth(254);
    obj.layout222:setHeight(52);
    obj.layout222:setName("layout222");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout222);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(27.6);
    obj.edit23:setFontColor("#000000");
    obj.edit23:setHorzTextAlign("leading");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(0);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(254);
    obj.edit23:setHeight(53);
    obj.edit23:setField("Matilha");
    obj.edit23:setName("edit23");

    obj.layout223 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout223:setParent(obj.rectangle1);
    obj.layout223:setLeft(1197);
    obj.layout223:setTop(531);
    obj.layout223:setWidth(51);
    obj.layout223:setHeight(47);
    obj.layout223:setName("layout223");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout223);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontSize(27.6);
    obj.edit24:setFontColor("#000000");
    obj.edit24:setHorzTextAlign("leading");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(0);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(51);
    obj.edit24:setHeight(48);
    obj.edit24:setField("custo");
    obj.edit24:setName("edit24");

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
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.imageCheckBox58 ~= nil then self.imageCheckBox58:destroy(); self.imageCheckBox58 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.imageCheckBox50 ~= nil then self.imageCheckBox50:destroy(); self.imageCheckBox50 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.imageCheckBox148 ~= nil then self.imageCheckBox148:destroy(); self.imageCheckBox148 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.imageCheckBox115 ~= nil then self.imageCheckBox115:destroy(); self.imageCheckBox115 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.imageCheckBox67 ~= nil then self.imageCheckBox67:destroy(); self.imageCheckBox67 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.imageCheckBox126 ~= nil then self.imageCheckBox126:destroy(); self.imageCheckBox126 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout223 ~= nil then self.layout223:destroy(); self.layout223 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.imageCheckBox129 ~= nil then self.imageCheckBox129:destroy(); self.imageCheckBox129 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.imageCheckBox99 ~= nil then self.imageCheckBox99:destroy(); self.imageCheckBox99 = nil; end;
        if self.imageCheckBox133 ~= nil then self.imageCheckBox133:destroy(); self.imageCheckBox133 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.imageCheckBox63 ~= nil then self.imageCheckBox63:destroy(); self.imageCheckBox63 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.imageCheckBox141 ~= nil then self.imageCheckBox141:destroy(); self.imageCheckBox141 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.imageCheckBox145 ~= nil then self.imageCheckBox145:destroy(); self.imageCheckBox145 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.imageCheckBox79 ~= nil then self.imageCheckBox79:destroy(); self.imageCheckBox79 = nil; end;
        if self.imageCheckBox150 ~= nil then self.imageCheckBox150:destroy(); self.imageCheckBox150 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.imageCheckBox136 ~= nil then self.imageCheckBox136:destroy(); self.imageCheckBox136 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.imageCheckBox78 ~= nil then self.imageCheckBox78:destroy(); self.imageCheckBox78 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.imageCheckBox103 ~= nil then self.imageCheckBox103:destroy(); self.imageCheckBox103 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.imageCheckBox104 ~= nil then self.imageCheckBox104:destroy(); self.imageCheckBox104 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.imageCheckBox131 ~= nil then self.imageCheckBox131:destroy(); self.imageCheckBox131 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.imageCheckBox154 ~= nil then self.imageCheckBox154:destroy(); self.imageCheckBox154 = nil; end;
        if self.imageCheckBox68 ~= nil then self.imageCheckBox68:destroy(); self.imageCheckBox68 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.imageCheckBox159 ~= nil then self.imageCheckBox159:destroy(); self.imageCheckBox159 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.imageCheckBox117 ~= nil then self.imageCheckBox117:destroy(); self.imageCheckBox117 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.imageCheckBox112 ~= nil then self.imageCheckBox112:destroy(); self.imageCheckBox112 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.imageCheckBox91 ~= nil then self.imageCheckBox91:destroy(); self.imageCheckBox91 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.imageCheckBox155 ~= nil then self.imageCheckBox155:destroy(); self.imageCheckBox155 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.imageCheckBox59 ~= nil then self.imageCheckBox59:destroy(); self.imageCheckBox59 = nil; end;
        if self.imageCheckBox90 ~= nil then self.imageCheckBox90:destroy(); self.imageCheckBox90 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.imageCheckBox93 ~= nil then self.imageCheckBox93:destroy(); self.imageCheckBox93 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.imageCheckBox55 ~= nil then self.imageCheckBox55:destroy(); self.imageCheckBox55 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.imageCheckBox106 ~= nil then self.imageCheckBox106:destroy(); self.imageCheckBox106 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.imageCheckBox83 ~= nil then self.imageCheckBox83:destroy(); self.imageCheckBox83 = nil; end;
        if self.imageCheckBox128 ~= nil then self.imageCheckBox128:destroy(); self.imageCheckBox128 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.imageCheckBox107 ~= nil then self.imageCheckBox107:destroy(); self.imageCheckBox107 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.imageCheckBox62 ~= nil then self.imageCheckBox62:destroy(); self.imageCheckBox62 = nil; end;
        if self.imageCheckBox124 ~= nil then self.imageCheckBox124:destroy(); self.imageCheckBox124 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.imageCheckBox94 ~= nil then self.imageCheckBox94:destroy(); self.imageCheckBox94 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.imageCheckBox110 ~= nil then self.imageCheckBox110:destroy(); self.imageCheckBox110 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.imageCheckBox71 ~= nil then self.imageCheckBox71:destroy(); self.imageCheckBox71 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.imageCheckBox137 ~= nil then self.imageCheckBox137:destroy(); self.imageCheckBox137 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.imageCheckBox125 ~= nil then self.imageCheckBox125:destroy(); self.imageCheckBox125 = nil; end;
        if self.imageCheckBox87 ~= nil then self.imageCheckBox87:destroy(); self.imageCheckBox87 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.imageCheckBox56 ~= nil then self.imageCheckBox56:destroy(); self.imageCheckBox56 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.imageCheckBox142 ~= nil then self.imageCheckBox142:destroy(); self.imageCheckBox142 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.imageCheckBox85 ~= nil then self.imageCheckBox85:destroy(); self.imageCheckBox85 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.imageCheckBox157 ~= nil then self.imageCheckBox157:destroy(); self.imageCheckBox157 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.imageCheckBox156 ~= nil then self.imageCheckBox156:destroy(); self.imageCheckBox156 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.imageCheckBox116 ~= nil then self.imageCheckBox116:destroy(); self.imageCheckBox116 = nil; end;
        if self.imageCheckBox118 ~= nil then self.imageCheckBox118:destroy(); self.imageCheckBox118 = nil; end;
        if self.imageCheckBox127 ~= nil then self.imageCheckBox127:destroy(); self.imageCheckBox127 = nil; end;
        if self.imageCheckBox86 ~= nil then self.imageCheckBox86:destroy(); self.imageCheckBox86 = nil; end;
        if self.imageCheckBox158 ~= nil then self.imageCheckBox158:destroy(); self.imageCheckBox158 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.imageCheckBox111 ~= nil then self.imageCheckBox111:destroy(); self.imageCheckBox111 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.imageCheckBox65 ~= nil then self.imageCheckBox65:destroy(); self.imageCheckBox65 = nil; end;
        if self.imageCheckBox73 ~= nil then self.imageCheckBox73:destroy(); self.imageCheckBox73 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.imageCheckBox96 ~= nil then self.imageCheckBox96:destroy(); self.imageCheckBox96 = nil; end;
        if self.imageCheckBox165 ~= nil then self.imageCheckBox165:destroy(); self.imageCheckBox165 = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.imageCheckBox105 ~= nil then self.imageCheckBox105:destroy(); self.imageCheckBox105 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.imageCheckBox76 ~= nil then self.imageCheckBox76:destroy(); self.imageCheckBox76 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.imageCheckBox149 ~= nil then self.imageCheckBox149:destroy(); self.imageCheckBox149 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.imageCheckBox45 ~= nil then self.imageCheckBox45:destroy(); self.imageCheckBox45 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.imageCheckBox153 ~= nil then self.imageCheckBox153:destroy(); self.imageCheckBox153 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.imageCheckBox138 ~= nil then self.imageCheckBox138:destroy(); self.imageCheckBox138 = nil; end;
        if self.imageCheckBox101 ~= nil then self.imageCheckBox101:destroy(); self.imageCheckBox101 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.imageCheckBox130 ~= nil then self.imageCheckBox130:destroy(); self.imageCheckBox130 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.imageCheckBox80 ~= nil then self.imageCheckBox80:destroy(); self.imageCheckBox80 = nil; end;
        if self.imageCheckBox119 ~= nil then self.imageCheckBox119:destroy(); self.imageCheckBox119 = nil; end;
        if self.imageCheckBox54 ~= nil then self.imageCheckBox54:destroy(); self.imageCheckBox54 = nil; end;
        if self.imageCheckBox81 ~= nil then self.imageCheckBox81:destroy(); self.imageCheckBox81 = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.imageCheckBox92 ~= nil then self.imageCheckBox92:destroy(); self.imageCheckBox92 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.imageCheckBox123 ~= nil then self.imageCheckBox123:destroy(); self.imageCheckBox123 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.imageCheckBox66 ~= nil then self.imageCheckBox66:destroy(); self.imageCheckBox66 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.imageCheckBox134 ~= nil then self.imageCheckBox134:destroy(); self.imageCheckBox134 = nil; end;
        if self.imageCheckBox82 ~= nil then self.imageCheckBox82:destroy(); self.imageCheckBox82 = nil; end;
        if self.imageCheckBox74 ~= nil then self.imageCheckBox74:destroy(); self.imageCheckBox74 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.imageCheckBox146 ~= nil then self.imageCheckBox146:destroy(); self.imageCheckBox146 = nil; end;
        if self.imageCheckBox95 ~= nil then self.imageCheckBox95:destroy(); self.imageCheckBox95 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.imageCheckBox135 ~= nil then self.imageCheckBox135:destroy(); self.imageCheckBox135 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.imageCheckBox120 ~= nil then self.imageCheckBox120:destroy(); self.imageCheckBox120 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.imageCheckBox162 ~= nil then self.imageCheckBox162:destroy(); self.imageCheckBox162 = nil; end;
        if self.imageCheckBox48 ~= nil then self.imageCheckBox48:destroy(); self.imageCheckBox48 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.imageCheckBox139 ~= nil then self.imageCheckBox139:destroy(); self.imageCheckBox139 = nil; end;
        if self.imageCheckBox102 ~= nil then self.imageCheckBox102:destroy(); self.imageCheckBox102 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.imageCheckBox109 ~= nil then self.imageCheckBox109:destroy(); self.imageCheckBox109 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.imageCheckBox163 ~= nil then self.imageCheckBox163:destroy(); self.imageCheckBox163 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.imageCheckBox35 ~= nil then self.imageCheckBox35:destroy(); self.imageCheckBox35 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.imageCheckBox164 ~= nil then self.imageCheckBox164:destroy(); self.imageCheckBox164 = nil; end;
        if self.imageCheckBox160 ~= nil then self.imageCheckBox160:destroy(); self.imageCheckBox160 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.imageCheckBox88 ~= nil then self.imageCheckBox88:destroy(); self.imageCheckBox88 = nil; end;
        if self.imageCheckBox114 ~= nil then self.imageCheckBox114:destroy(); self.imageCheckBox114 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.imageCheckBox43 ~= nil then self.imageCheckBox43:destroy(); self.imageCheckBox43 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.imageCheckBox61 ~= nil then self.imageCheckBox61:destroy(); self.imageCheckBox61 = nil; end;
        if self.imageCheckBox75 ~= nil then self.imageCheckBox75:destroy(); self.imageCheckBox75 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.imageCheckBox51 ~= nil then self.imageCheckBox51:destroy(); self.imageCheckBox51 = nil; end;
        if self.imageCheckBox44 ~= nil then self.imageCheckBox44:destroy(); self.imageCheckBox44 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.imageCheckBox64 ~= nil then self.imageCheckBox64:destroy(); self.imageCheckBox64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.imageCheckBox161 ~= nil then self.imageCheckBox161:destroy(); self.imageCheckBox161 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.imageCheckBox60 ~= nil then self.imageCheckBox60:destroy(); self.imageCheckBox60 = nil; end;
        if self.imageCheckBox52 ~= nil then self.imageCheckBox52:destroy(); self.imageCheckBox52 = nil; end;
        if self.imageCheckBox77 ~= nil then self.imageCheckBox77:destroy(); self.imageCheckBox77 = nil; end;
        if self.imageCheckBox121 ~= nil then self.imageCheckBox121:destroy(); self.imageCheckBox121 = nil; end;
        if self.imageCheckBox152 ~= nil then self.imageCheckBox152:destroy(); self.imageCheckBox152 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.imageCheckBox113 ~= nil then self.imageCheckBox113:destroy(); self.imageCheckBox113 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.imageCheckBox89 ~= nil then self.imageCheckBox89:destroy(); self.imageCheckBox89 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.imageCheckBox69 ~= nil then self.imageCheckBox69:destroy(); self.imageCheckBox69 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.imageCheckBox46 ~= nil then self.imageCheckBox46:destroy(); self.imageCheckBox46 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.imageCheckBox132 ~= nil then self.imageCheckBox132:destroy(); self.imageCheckBox132 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.imageCheckBox97 ~= nil then self.imageCheckBox97:destroy(); self.imageCheckBox97 = nil; end;
        if self.imageCheckBox100 ~= nil then self.imageCheckBox100:destroy(); self.imageCheckBox100 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.imageCheckBox147 ~= nil then self.imageCheckBox147:destroy(); self.imageCheckBox147 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.imageCheckBox144 ~= nil then self.imageCheckBox144:destroy(); self.imageCheckBox144 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.imageCheckBox151 ~= nil then self.imageCheckBox151:destroy(); self.imageCheckBox151 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.imageCheckBox49 ~= nil then self.imageCheckBox49:destroy(); self.imageCheckBox49 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.imageCheckBox70 ~= nil then self.imageCheckBox70:destroy(); self.imageCheckBox70 = nil; end;
        if self.imageCheckBox140 ~= nil then self.imageCheckBox140:destroy(); self.imageCheckBox140 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.imageCheckBox53 ~= nil then self.imageCheckBox53:destroy(); self.imageCheckBox53 = nil; end;
        if self.imageCheckBox57 ~= nil then self.imageCheckBox57:destroy(); self.imageCheckBox57 = nil; end;
        if self.imageCheckBox143 ~= nil then self.imageCheckBox143:destroy(); self.imageCheckBox143 = nil; end;
        if self.imageCheckBox84 ~= nil then self.imageCheckBox84:destroy(); self.imageCheckBox84 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.imageCheckBox108 ~= nil then self.imageCheckBox108:destroy(); self.imageCheckBox108 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.imageCheckBox122 ~= nil then self.imageCheckBox122:destroy(); self.imageCheckBox122 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.imageCheckBox47 ~= nil then self.imageCheckBox47:destroy(); self.imageCheckBox47 = nil; end;
        if self.imageCheckBox72 ~= nil then self.imageCheckBox72:destroy(); self.imageCheckBox72 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.imageCheckBox98 ~= nil then self.imageCheckBox98:destroy(); self.imageCheckBox98 = nil; end;
        if self.imageCheckBox40 ~= nil then self.imageCheckBox40:destroy(); self.imageCheckBox40 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmtotem1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmtotem1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmtotem1_svg = {
    newEditor = newfrmtotem1_svg, 
    new = newfrmtotem1_svg, 
    name = "frmtotem1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmtotem1_svg = _frmtotem1_svg;
Firecast.registrarForm(_frmtotem1_svg);

return _frmtotem1_svg;
