require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPATHFINDER()
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
    obj:setName("frmPATHFINDER");
    obj:setFormType("sheetTemplate");
    obj:setDataType("PathFinder_Oficial");
    obj:setTitle("PathFinder 2E (Oficial)");
    obj:setAlign("client");
    obj:setTheme("light");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Página 2");
    obj.tab1:setName("tab1");

    obj.frmPATHFINDER2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPATHFINDER2_svg:setParent(obj.tab1);
    obj.frmPATHFINDER2_svg:setName("frmPATHFINDER2_svg");
    obj.frmPATHFINDER2_svg:setAlign("client");
    obj.frmPATHFINDER2_svg:setTheme("light");
    obj.frmPATHFINDER2_svg:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmPATHFINDER2_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(905);
    obj.rectangle1:setHeight(1175);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(905);
    obj.image1:setHeight(1175);
    obj.image1:setSRC("/PATHFINDER/images/2.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(35);
    obj.edit1:setTop(54);
    obj.edit1:setWidth(300);
    obj.edit1:setHeight(20);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontColor("black");
    obj.edit1:setFontSize(14);
    obj.edit1:setTransparent(false);
    obj.edit1:setField("Idiomas");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(35);
    obj.edit2:setTop(83);
    obj.edit2:setWidth(300);
    obj.edit2:setHeight(20);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontColor("black");
    obj.edit2:setFontSize(14);
    obj.edit2:setTransparent(false);
    obj.edit2:setField("Idiomas");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(35);
    obj.edit3:setTop(112);
    obj.edit3:setWidth(300);
    obj.edit3:setHeight(20);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontColor("black");
    obj.edit3:setFontSize(14);
    obj.edit3:setTransparent(false);
    obj.edit3:setField("Idiomas");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(35);
    obj.edit4:setTop(141);
    obj.edit4:setWidth(300);
    obj.edit4:setHeight(20);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("black");
    obj.edit4:setFontSize(14);
    obj.edit4:setTransparent(false);
    obj.edit4:setField("Idiomas");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(35);
    obj.edit5:setTop(170);
    obj.edit5:setWidth(300);
    obj.edit5:setHeight(20);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontColor("black");
    obj.edit5:setFontSize(14);
    obj.edit5:setTransparent(false);
    obj.edit5:setField("Idiomas");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(35);
    obj.edit6:setTop(199);
    obj.edit6:setWidth(300);
    obj.edit6:setHeight(20);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontColor("black");
    obj.edit6:setFontSize(14);
    obj.edit6:setTransparent(false);
    obj.edit6:setField("Idiomas");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(35);
    obj.edit7:setTop(228);
    obj.edit7:setWidth(300);
    obj.edit7:setHeight(20);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontColor("black");
    obj.edit7:setFontSize(14);
    obj.edit7:setTransparent(false);
    obj.edit7:setField("Idiomas");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(35);
    obj.edit8:setTop(287);
    obj.edit8:setWidth(300);
    obj.edit8:setHeight(20);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontColor("black");
    obj.edit8:setFontSize(14);
    obj.edit8:setTransparent(false);
    obj.edit8:setField("Idiomas");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(35);
    obj.edit9:setTop(317);
    obj.edit9:setWidth(300);
    obj.edit9:setHeight(20);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontColor("black");
    obj.edit9:setFontSize(14);
    obj.edit9:setTransparent(false);
    obj.edit9:setField("Idiomas");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(35);
    obj.edit10:setTop(346);
    obj.edit10:setWidth(300);
    obj.edit10:setHeight(20);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontColor("black");
    obj.edit10:setFontSize(14);
    obj.edit10:setTransparent(false);
    obj.edit10:setField("Idiomas");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setLeft(35);
    obj.edit11:setTop(375);
    obj.edit11:setWidth(300);
    obj.edit11:setHeight(20);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontColor("black");
    obj.edit11:setFontSize(14);
    obj.edit11:setTransparent(false);
    obj.edit11:setField("Idiomas");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setLeft(35);
    obj.edit12:setTop(405);
    obj.edit12:setWidth(300);
    obj.edit12:setHeight(20);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("black");
    obj.edit12:setFontSize(14);
    obj.edit12:setTransparent(false);
    obj.edit12:setField("Idiomas");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle1);
    obj.edit13:setLeft(35);
    obj.edit13:setTop(434);
    obj.edit13:setWidth(300);
    obj.edit13:setHeight(20);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontColor("black");
    obj.edit13:setFontSize(14);
    obj.edit13:setTransparent(false);
    obj.edit13:setField("Idiomas");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle1);
    obj.edit14:setLeft(35);
    obj.edit14:setTop(463);
    obj.edit14:setWidth(300);
    obj.edit14:setHeight(20);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontColor("black");
    obj.edit14:setFontSize(14);
    obj.edit14:setTransparent(false);
    obj.edit14:setField("Idiomas");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle1);
    obj.edit15:setLeft(35);
    obj.edit15:setTop(492);
    obj.edit15:setWidth(300);
    obj.edit15:setHeight(20);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontColor("black");
    obj.edit15:setFontSize(14);
    obj.edit15:setTransparent(false);
    obj.edit15:setField("Idiomas");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle1);
    obj.edit16:setLeft(35);
    obj.edit16:setTop(523);
    obj.edit16:setWidth(300);
    obj.edit16:setHeight(20);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontColor("black");
    obj.edit16:setFontSize(14);
    obj.edit16:setTransparent(false);
    obj.edit16:setField("Idiomas");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle1);
    obj.edit17:setLeft(35);
    obj.edit17:setTop(552);
    obj.edit17:setWidth(300);
    obj.edit17:setHeight(20);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontColor("black");
    obj.edit17:setFontSize(14);
    obj.edit17:setTransparent(false);
    obj.edit17:setField("Idiomas");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle1);
    obj.edit18:setLeft(35);
    obj.edit18:setTop(580);
    obj.edit18:setWidth(300);
    obj.edit18:setHeight(20);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontColor("black");
    obj.edit18:setFontSize(14);
    obj.edit18:setTransparent(false);
    obj.edit18:setField("Idiomas");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle1);
    obj.edit19:setLeft(35);
    obj.edit19:setTop(637);
    obj.edit19:setWidth(300);
    obj.edit19:setHeight(20);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontColor("black");
    obj.edit19:setFontSize(14);
    obj.edit19:setTransparent(false);
    obj.edit19:setField("Idiomas");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle1);
    obj.edit20:setLeft(35);
    obj.edit20:setTop(666);
    obj.edit20:setWidth(300);
    obj.edit20:setHeight(20);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontColor("black");
    obj.edit20:setFontSize(14);
    obj.edit20:setTransparent(false);
    obj.edit20:setField("Idiomas");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle1);
    obj.edit21:setLeft(35);
    obj.edit21:setTop(695);
    obj.edit21:setWidth(300);
    obj.edit21:setHeight(20);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontColor("black");
    obj.edit21:setFontSize(14);
    obj.edit21:setTransparent(false);
    obj.edit21:setField("Idiomas");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle1);
    obj.edit22:setLeft(35);
    obj.edit22:setTop(725);
    obj.edit22:setWidth(300);
    obj.edit22:setHeight(20);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontColor("black");
    obj.edit22:setFontSize(14);
    obj.edit22:setTransparent(false);
    obj.edit22:setField("Idiomas");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle1);
    obj.edit23:setLeft(35);
    obj.edit23:setTop(755);
    obj.edit23:setWidth(300);
    obj.edit23:setHeight(20);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontColor("black");
    obj.edit23:setFontSize(14);
    obj.edit23:setTransparent(false);
    obj.edit23:setField("Idiomas");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle1);
    obj.edit24:setLeft(462);
    obj.edit24:setTop(54);
    obj.edit24:setWidth(280);
    obj.edit24:setHeight(20);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontColor("black");
    obj.edit24:setFontSize(14);
    obj.edit24:setTransparent(false);
    obj.edit24:setField("Idiomas");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle1);
    obj.edit25:setLeft(462);
    obj.edit25:setTop(83);
    obj.edit25:setWidth(280);
    obj.edit25:setHeight(20);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontColor("black");
    obj.edit25:setFontSize(14);
    obj.edit25:setTransparent(false);
    obj.edit25:setField("Idiomas");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle1);
    obj.edit26:setLeft(462);
    obj.edit26:setTop(112);
    obj.edit26:setWidth(280);
    obj.edit26:setHeight(20);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontColor("black");
    obj.edit26:setFontSize(14);
    obj.edit26:setTransparent(false);
    obj.edit26:setField("Idiomas");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle1);
    obj.edit27:setLeft(462);
    obj.edit27:setTop(141);
    obj.edit27:setWidth(280);
    obj.edit27:setHeight(20);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontColor("black");
    obj.edit27:setFontSize(14);
    obj.edit27:setTransparent(false);
    obj.edit27:setField("Idiomas");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle1);
    obj.edit28:setLeft(462);
    obj.edit28:setTop(170);
    obj.edit28:setWidth(280);
    obj.edit28:setHeight(20);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontColor("black");
    obj.edit28:setFontSize(14);
    obj.edit28:setTransparent(false);
    obj.edit28:setField("Idiomas");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle1);
    obj.edit29:setLeft(462);
    obj.edit29:setTop(199);
    obj.edit29:setWidth(280);
    obj.edit29:setHeight(20);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontColor("black");
    obj.edit29:setFontSize(14);
    obj.edit29:setTransparent(false);
    obj.edit29:setField("Idiomas");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle1);
    obj.edit30:setLeft(462);
    obj.edit30:setTop(228);
    obj.edit30:setWidth(280);
    obj.edit30:setHeight(20);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontColor("black");
    obj.edit30:setFontSize(14);
    obj.edit30:setTransparent(false);
    obj.edit30:setField("Idiomas");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle1);
    obj.edit31:setLeft(462);
    obj.edit31:setTop(258);
    obj.edit31:setWidth(280);
    obj.edit31:setHeight(20);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontColor("black");
    obj.edit31:setFontSize(14);
    obj.edit31:setTransparent(false);
    obj.edit31:setField("Idiomas");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle1);
    obj.edit32:setLeft(462);
    obj.edit32:setTop(287);
    obj.edit32:setWidth(280);
    obj.edit32:setHeight(20);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontColor("black");
    obj.edit32:setFontSize(14);
    obj.edit32:setTransparent(false);
    obj.edit32:setField("Idiomas");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle1);
    obj.edit33:setLeft(462);
    obj.edit33:setTop(316);
    obj.edit33:setWidth(280);
    obj.edit33:setHeight(20);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontColor("black");
    obj.edit33:setFontSize(14);
    obj.edit33:setTransparent(false);
    obj.edit33:setField("Idiomas");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle1);
    obj.edit34:setLeft(462);
    obj.edit34:setTop(345);
    obj.edit34:setWidth(280);
    obj.edit34:setHeight(20);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontColor("black");
    obj.edit34:setFontSize(14);
    obj.edit34:setTransparent(false);
    obj.edit34:setField("Idiomas");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle1);
    obj.edit35:setLeft(462);
    obj.edit35:setTop(374);
    obj.edit35:setWidth(280);
    obj.edit35:setHeight(20);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontColor("black");
    obj.edit35:setFontSize(14);
    obj.edit35:setTransparent(false);
    obj.edit35:setField("Idiomas");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle1);
    obj.edit36:setLeft(462);
    obj.edit36:setTop(404);
    obj.edit36:setWidth(280);
    obj.edit36:setHeight(20);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontColor("black");
    obj.edit36:setFontSize(14);
    obj.edit36:setTransparent(false);
    obj.edit36:setField("Idiomas");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle1);
    obj.edit37:setLeft(462);
    obj.edit37:setTop(433);
    obj.edit37:setWidth(280);
    obj.edit37:setHeight(20);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontColor("black");
    obj.edit37:setFontSize(14);
    obj.edit37:setTransparent(false);
    obj.edit37:setField("Idiomas");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle1);
    obj.edit38:setLeft(462);
    obj.edit38:setTop(462);
    obj.edit38:setWidth(280);
    obj.edit38:setHeight(20);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontColor("black");
    obj.edit38:setFontSize(14);
    obj.edit38:setTransparent(false);
    obj.edit38:setField("Idiomas");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle1);
    obj.edit39:setLeft(462);
    obj.edit39:setTop(492);
    obj.edit39:setWidth(280);
    obj.edit39:setHeight(20);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontColor("black");
    obj.edit39:setFontSize(14);
    obj.edit39:setTransparent(false);
    obj.edit39:setField("Idiomas");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle1);
    obj.edit40:setLeft(462);
    obj.edit40:setTop(522);
    obj.edit40:setWidth(280);
    obj.edit40:setHeight(20);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontColor("black");
    obj.edit40:setFontSize(14);
    obj.edit40:setTransparent(false);
    obj.edit40:setField("Idiomas");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle1);
    obj.edit41:setLeft(462);
    obj.edit41:setTop(551);
    obj.edit41:setWidth(280);
    obj.edit41:setHeight(20);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontColor("black");
    obj.edit41:setFontSize(14);
    obj.edit41:setTransparent(false);
    obj.edit41:setField("Idiomas");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle1);
    obj.edit42:setLeft(462);
    obj.edit42:setTop(580);
    obj.edit42:setWidth(280);
    obj.edit42:setHeight(20);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontColor("black");
    obj.edit42:setFontSize(14);
    obj.edit42:setTransparent(false);
    obj.edit42:setField("Idiomas");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle1);
    obj.edit43:setLeft(462);
    obj.edit43:setTop(610);
    obj.edit43:setWidth(280);
    obj.edit43:setHeight(20);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontColor("black");
    obj.edit43:setFontSize(14);
    obj.edit43:setTransparent(false);
    obj.edit43:setField("Idiomas");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle1);
    obj.edit44:setLeft(462);
    obj.edit44:setTop(639);
    obj.edit44:setWidth(280);
    obj.edit44:setHeight(20);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontColor("black");
    obj.edit44:setFontSize(14);
    obj.edit44:setTransparent(false);
    obj.edit44:setField("Idiomas");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle1);
    obj.edit45:setLeft(462);
    obj.edit45:setTop(668);
    obj.edit45:setWidth(280);
    obj.edit45:setHeight(20);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontColor("black");
    obj.edit45:setFontSize(14);
    obj.edit45:setTransparent(false);
    obj.edit45:setField("Idiomas");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle1);
    obj.edit46:setLeft(462);
    obj.edit46:setTop(725);
    obj.edit46:setWidth(405);
    obj.edit46:setHeight(20);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontColor("black");
    obj.edit46:setFontSize(14);
    obj.edit46:setTransparent(false);
    obj.edit46:setField("Idiomas");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle1);
    obj.edit47:setLeft(462);
    obj.edit47:setTop(754);
    obj.edit47:setWidth(405);
    obj.edit47:setHeight(20);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontColor("black");
    obj.edit47:setFontSize(14);
    obj.edit47:setTransparent(false);
    obj.edit47:setField("Idiomas");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle1);
    obj.edit48:setLeft(35);
    obj.edit48:setTop(845);
    obj.edit48:setWidth(324);
    obj.edit48:setHeight(20);
    obj.edit48:setField("Teste");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.rectangle1);
    obj.edit49:setLeft(361);
    obj.edit49:setTop(845);
    obj.edit49:setWidth(37);
    obj.edit49:setHeight(20);
    obj.edit49:setField("Teste");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.rectangle1);
    obj.edit50:setLeft(400);
    obj.edit50:setTop(845);
    obj.edit50:setWidth(33);
    obj.edit50:setHeight(20);
    obj.edit50:setField("Teste");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.rectangle1);
    obj.edit51:setLeft(35);
    obj.edit51:setTop(867);
    obj.edit51:setWidth(324);
    obj.edit51:setHeight(20);
    obj.edit51:setField("Teste");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.rectangle1);
    obj.edit52:setLeft(361);
    obj.edit52:setTop(867);
    obj.edit52:setWidth(37);
    obj.edit52:setHeight(20);
    obj.edit52:setField("Teste");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.rectangle1);
    obj.edit53:setLeft(400);
    obj.edit53:setTop(867);
    obj.edit53:setWidth(33);
    obj.edit53:setHeight(20);
    obj.edit53:setField("Teste");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.rectangle1);
    obj.edit54:setLeft(35);
    obj.edit54:setTop(889);
    obj.edit54:setWidth(324);
    obj.edit54:setHeight(20);
    obj.edit54:setField("Teste");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.rectangle1);
    obj.edit55:setLeft(361);
    obj.edit55:setTop(889);
    obj.edit55:setWidth(37);
    obj.edit55:setHeight(20);
    obj.edit55:setField("Teste");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.rectangle1);
    obj.edit56:setLeft(400);
    obj.edit56:setTop(889);
    obj.edit56:setWidth(33);
    obj.edit56:setHeight(20);
    obj.edit56:setField("Teste");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.rectangle1);
    obj.edit57:setLeft(35);
    obj.edit57:setTop(911);
    obj.edit57:setWidth(324);
    obj.edit57:setHeight(20);
    obj.edit57:setField("Teste");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.rectangle1);
    obj.edit58:setLeft(361);
    obj.edit58:setTop(911);
    obj.edit58:setWidth(37);
    obj.edit58:setHeight(20);
    obj.edit58:setField("Teste");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.rectangle1);
    obj.edit59:setLeft(400);
    obj.edit59:setTop(911);
    obj.edit59:setWidth(33);
    obj.edit59:setHeight(20);
    obj.edit59:setField("Teste");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.rectangle1);
    obj.edit60:setLeft(35);
    obj.edit60:setTop(933);
    obj.edit60:setWidth(324);
    obj.edit60:setHeight(20);
    obj.edit60:setField("Teste");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.rectangle1);
    obj.edit61:setLeft(361);
    obj.edit61:setTop(933);
    obj.edit61:setWidth(37);
    obj.edit61:setHeight(20);
    obj.edit61:setField("Teste");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.rectangle1);
    obj.edit62:setLeft(400);
    obj.edit62:setTop(933);
    obj.edit62:setWidth(33);
    obj.edit62:setHeight(20);
    obj.edit62:setField("Teste");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.rectangle1);
    obj.edit63:setLeft(35);
    obj.edit63:setTop(955);
    obj.edit63:setWidth(324);
    obj.edit63:setHeight(20);
    obj.edit63:setField("Teste");
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.rectangle1);
    obj.edit64:setLeft(361);
    obj.edit64:setTop(955);
    obj.edit64:setWidth(37);
    obj.edit64:setHeight(20);
    obj.edit64:setField("Teste");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.rectangle1);
    obj.edit65:setLeft(400);
    obj.edit65:setTop(955);
    obj.edit65:setWidth(33);
    obj.edit65:setHeight(20);
    obj.edit65:setField("Teste");
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.rectangle1);
    obj.edit66:setLeft(35);
    obj.edit66:setTop(977);
    obj.edit66:setWidth(324);
    obj.edit66:setHeight(20);
    obj.edit66:setField("Teste");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.rectangle1);
    obj.edit67:setLeft(361);
    obj.edit67:setTop(977);
    obj.edit67:setWidth(37);
    obj.edit67:setHeight(20);
    obj.edit67:setField("Teste");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.rectangle1);
    obj.edit68:setLeft(400);
    obj.edit68:setTop(977);
    obj.edit68:setWidth(33);
    obj.edit68:setHeight(20);
    obj.edit68:setField("Teste");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.rectangle1);
    obj.edit69:setLeft(35);
    obj.edit69:setTop(999);
    obj.edit69:setWidth(324);
    obj.edit69:setHeight(20);
    obj.edit69:setField("Teste");
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.rectangle1);
    obj.edit70:setLeft(361);
    obj.edit70:setTop(999);
    obj.edit70:setWidth(37);
    obj.edit70:setHeight(20);
    obj.edit70:setField("Teste");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.rectangle1);
    obj.edit71:setLeft(400);
    obj.edit71:setTop(999);
    obj.edit71:setWidth(33);
    obj.edit71:setHeight(20);
    obj.edit71:setField("Teste");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.rectangle1);
    obj.edit72:setLeft(35);
    obj.edit72:setTop(1021);
    obj.edit72:setWidth(324);
    obj.edit72:setHeight(20);
    obj.edit72:setField("Teste");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.rectangle1);
    obj.edit73:setLeft(361);
    obj.edit73:setTop(1021);
    obj.edit73:setWidth(37);
    obj.edit73:setHeight(20);
    obj.edit73:setField("Teste");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.rectangle1);
    obj.edit74:setLeft(400);
    obj.edit74:setTop(1021);
    obj.edit74:setWidth(33);
    obj.edit74:setHeight(20);
    obj.edit74:setField("Teste");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.rectangle1);
    obj.edit75:setLeft(35);
    obj.edit75:setTop(1043);
    obj.edit75:setWidth(324);
    obj.edit75:setHeight(20);
    obj.edit75:setField("Teste");
    obj.edit75:setName("edit75");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.rectangle1);
    obj.edit76:setLeft(361);
    obj.edit76:setTop(1043);
    obj.edit76:setWidth(37);
    obj.edit76:setHeight(20);
    obj.edit76:setField("Teste");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.rectangle1);
    obj.edit77:setLeft(400);
    obj.edit77:setTop(1043);
    obj.edit77:setWidth(33);
    obj.edit77:setHeight(20);
    obj.edit77:setField("Teste");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.rectangle1);
    obj.edit78:setLeft(35);
    obj.edit78:setTop(1065);
    obj.edit78:setWidth(324);
    obj.edit78:setHeight(20);
    obj.edit78:setField("Teste");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.rectangle1);
    obj.edit79:setLeft(361);
    obj.edit79:setTop(1065);
    obj.edit79:setWidth(37);
    obj.edit79:setHeight(20);
    obj.edit79:setField("Teste");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.rectangle1);
    obj.edit80:setLeft(400);
    obj.edit80:setTop(1065);
    obj.edit80:setWidth(33);
    obj.edit80:setHeight(20);
    obj.edit80:setField("Teste");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.rectangle1);
    obj.edit81:setLeft(35);
    obj.edit81:setTop(1087);
    obj.edit81:setWidth(324);
    obj.edit81:setHeight(20);
    obj.edit81:setField("Teste");
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.rectangle1);
    obj.edit82:setLeft(361);
    obj.edit82:setTop(1087);
    obj.edit82:setWidth(37);
    obj.edit82:setHeight(20);
    obj.edit82:setField("Teste");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.rectangle1);
    obj.edit83:setLeft(400);
    obj.edit83:setTop(1087);
    obj.edit83:setWidth(33);
    obj.edit83:setHeight(20);
    obj.edit83:setField("Teste");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.rectangle1);
    obj.edit84:setLeft(35);
    obj.edit84:setTop(1109);
    obj.edit84:setWidth(324);
    obj.edit84:setHeight(20);
    obj.edit84:setField("Teste");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.rectangle1);
    obj.edit85:setLeft(361);
    obj.edit85:setTop(1109);
    obj.edit85:setWidth(37);
    obj.edit85:setHeight(20);
    obj.edit85:setField("Teste");
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.rectangle1);
    obj.edit86:setLeft(400);
    obj.edit86:setTop(1109);
    obj.edit86:setWidth(33);
    obj.edit86:setHeight(20);
    obj.edit86:setField("Teste");
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.rectangle1);
    obj.edit87:setLeft(461);
    obj.edit87:setTop(845);
    obj.edit87:setWidth(167);
    obj.edit87:setHeight(20);
    obj.edit87:setField("Teste");
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.rectangle1);
    obj.edit88:setLeft(631);
    obj.edit88:setTop(845);
    obj.edit88:setWidth(31);
    obj.edit88:setHeight(20);
    obj.edit88:setField("Teste");
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.rectangle1);
    obj.edit89:setLeft(461);
    obj.edit89:setTop(867);
    obj.edit89:setWidth(167);
    obj.edit89:setHeight(20);
    obj.edit89:setField("Teste");
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.rectangle1);
    obj.edit90:setLeft(631);
    obj.edit90:setTop(867);
    obj.edit90:setWidth(31);
    obj.edit90:setHeight(20);
    obj.edit90:setField("Teste");
    obj.edit90:setName("edit90");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.rectangle1);
    obj.edit91:setLeft(461);
    obj.edit91:setTop(889);
    obj.edit91:setWidth(167);
    obj.edit91:setHeight(20);
    obj.edit91:setField("Teste");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.rectangle1);
    obj.edit92:setLeft(631);
    obj.edit92:setTop(889);
    obj.edit92:setWidth(31);
    obj.edit92:setHeight(20);
    obj.edit92:setField("Teste");
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.rectangle1);
    obj.edit93:setLeft(461);
    obj.edit93:setTop(911);
    obj.edit93:setWidth(167);
    obj.edit93:setHeight(20);
    obj.edit93:setField("Teste");
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.rectangle1);
    obj.edit94:setLeft(631);
    obj.edit94:setTop(911);
    obj.edit94:setWidth(31);
    obj.edit94:setHeight(20);
    obj.edit94:setField("Teste");
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.rectangle1);
    obj.edit95:setLeft(461);
    obj.edit95:setTop(933);
    obj.edit95:setWidth(167);
    obj.edit95:setHeight(20);
    obj.edit95:setField("Teste");
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.rectangle1);
    obj.edit96:setLeft(631);
    obj.edit96:setTop(933);
    obj.edit96:setWidth(31);
    obj.edit96:setHeight(20);
    obj.edit96:setField("Teste");
    obj.edit96:setName("edit96");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.rectangle1);
    obj.edit97:setLeft(461);
    obj.edit97:setTop(955);
    obj.edit97:setWidth(167);
    obj.edit97:setHeight(20);
    obj.edit97:setField("Teste");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.rectangle1);
    obj.edit98:setLeft(631);
    obj.edit98:setTop(955);
    obj.edit98:setWidth(31);
    obj.edit98:setHeight(20);
    obj.edit98:setField("Teste");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.rectangle1);
    obj.edit99:setLeft(461);
    obj.edit99:setTop(977);
    obj.edit99:setWidth(167);
    obj.edit99:setHeight(20);
    obj.edit99:setField("Teste");
    obj.edit99:setName("edit99");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.rectangle1);
    obj.edit100:setLeft(631);
    obj.edit100:setTop(977);
    obj.edit100:setWidth(31);
    obj.edit100:setHeight(20);
    obj.edit100:setField("Teste");
    obj.edit100:setName("edit100");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.rectangle1);
    obj.edit101:setLeft(461);
    obj.edit101:setTop(999);
    obj.edit101:setWidth(167);
    obj.edit101:setHeight(20);
    obj.edit101:setField("Teste");
    obj.edit101:setName("edit101");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.rectangle1);
    obj.edit102:setLeft(631);
    obj.edit102:setTop(999);
    obj.edit102:setWidth(31);
    obj.edit102:setHeight(20);
    obj.edit102:setField("Teste");
    obj.edit102:setName("edit102");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.rectangle1);
    obj.edit103:setLeft(461);
    obj.edit103:setTop(1021);
    obj.edit103:setWidth(167);
    obj.edit103:setHeight(20);
    obj.edit103:setField("Teste");
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.rectangle1);
    obj.edit104:setLeft(631);
    obj.edit104:setTop(1021);
    obj.edit104:setWidth(31);
    obj.edit104:setHeight(20);
    obj.edit104:setField("Teste");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.rectangle1);
    obj.edit105:setLeft(669);
    obj.edit105:setTop(845);
    obj.edit105:setWidth(167);
    obj.edit105:setHeight(20);
    obj.edit105:setField("Teste");
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.rectangle1);
    obj.edit106:setLeft(839	);
    obj.edit106:setTop(845);
    obj.edit106:setWidth(31);
    obj.edit106:setHeight(20);
    obj.edit106:setField("Teste");
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.rectangle1);
    obj.edit107:setLeft(669);
    obj.edit107:setTop(867);
    obj.edit107:setWidth(167);
    obj.edit107:setHeight(20);
    obj.edit107:setField("Teste");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.rectangle1);
    obj.edit108:setLeft(839);
    obj.edit108:setTop(867);
    obj.edit108:setWidth(31);
    obj.edit108:setHeight(20);
    obj.edit108:setField("Teste");
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.rectangle1);
    obj.edit109:setLeft(669);
    obj.edit109:setTop(889);
    obj.edit109:setWidth(167);
    obj.edit109:setHeight(20);
    obj.edit109:setField("Teste");
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.rectangle1);
    obj.edit110:setLeft(839);
    obj.edit110:setTop(889);
    obj.edit110:setWidth(31);
    obj.edit110:setHeight(20);
    obj.edit110:setField("Teste");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.rectangle1);
    obj.edit111:setLeft(669);
    obj.edit111:setTop(911);
    obj.edit111:setWidth(167);
    obj.edit111:setHeight(20);
    obj.edit111:setField("Teste");
    obj.edit111:setName("edit111");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.rectangle1);
    obj.edit112:setLeft(839);
    obj.edit112:setTop(911);
    obj.edit112:setWidth(31);
    obj.edit112:setHeight(20);
    obj.edit112:setField("Teste");
    obj.edit112:setName("edit112");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.rectangle1);
    obj.edit113:setLeft(669);
    obj.edit113:setTop(933);
    obj.edit113:setWidth(167);
    obj.edit113:setHeight(20);
    obj.edit113:setField("Teste");
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.rectangle1);
    obj.edit114:setLeft(839);
    obj.edit114:setTop(933);
    obj.edit114:setWidth(31);
    obj.edit114:setHeight(20);
    obj.edit114:setField("Teste");
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.rectangle1);
    obj.edit115:setLeft(669);
    obj.edit115:setTop(955);
    obj.edit115:setWidth(167);
    obj.edit115:setHeight(20);
    obj.edit115:setField("Teste");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.rectangle1);
    obj.edit116:setLeft(839);
    obj.edit116:setTop(955);
    obj.edit116:setWidth(31);
    obj.edit116:setHeight(20);
    obj.edit116:setField("Teste");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.rectangle1);
    obj.edit117:setLeft(669);
    obj.edit117:setTop(977);
    obj.edit117:setWidth(167);
    obj.edit117:setHeight(20);
    obj.edit117:setField("Teste");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.rectangle1);
    obj.edit118:setLeft(839);
    obj.edit118:setTop(977);
    obj.edit118:setWidth(31);
    obj.edit118:setHeight(20);
    obj.edit118:setField("Teste");
    obj.edit118:setName("edit118");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.rectangle1);
    obj.edit119:setLeft(669);
    obj.edit119:setTop(999);
    obj.edit119:setWidth(167);
    obj.edit119:setHeight(20);
    obj.edit119:setField("Teste");
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.rectangle1);
    obj.edit120:setLeft(839);
    obj.edit120:setTop(999);
    obj.edit120:setWidth(31);
    obj.edit120:setHeight(20);
    obj.edit120:setField("Teste");
    obj.edit120:setName("edit120");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.rectangle1);
    obj.edit121:setLeft(669);
    obj.edit121:setTop(1021);
    obj.edit121:setWidth(167);
    obj.edit121:setHeight(20);
    obj.edit121:setField("Teste");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.rectangle1);
    obj.edit122:setLeft(839);
    obj.edit122:setTop(1021);
    obj.edit122:setWidth(31);
    obj.edit122:setHeight(20);
    obj.edit122:setField("Teste");
    obj.edit122:setName("edit122");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Página 3");
    obj.tab2:setName("tab2");

    obj.frmPATHFINDER3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPATHFINDER3_svg:setParent(obj.tab2);
    obj.frmPATHFINDER3_svg:setName("frmPATHFINDER3_svg");
    obj.frmPATHFINDER3_svg:setAlign("client");
    obj.frmPATHFINDER3_svg:setTheme("light");
    obj.frmPATHFINDER3_svg:setMargins({top=1});

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmPATHFINDER3_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox2);
    obj.rectangle2:setWidth(905);
    obj.rectangle2:setHeight(1175);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setName("rectangle2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(905);
    obj.image2:setHeight(1175);
    obj.image2:setSRC("/PATHFINDER/images/3.png");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Página 4");
    obj.tab3:setName("tab3");

    obj.frmPATHFINDER4_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPATHFINDER4_svg:setParent(obj.tab3);
    obj.frmPATHFINDER4_svg:setName("frmPATHFINDER4_svg");
    obj.frmPATHFINDER4_svg:setAlign("client");
    obj.frmPATHFINDER4_svg:setTheme("light");
    obj.frmPATHFINDER4_svg:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmPATHFINDER4_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox3);
    obj.rectangle3:setWidth(905);
    obj.rectangle3:setHeight(1175);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle3);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(905);
    obj.image3:setHeight(1175);
    obj.image3:setSRC("/PATHFINDER/images/4.png");
    obj.image3:setStyle("stretch");
    obj.image3:setOptimize(true);
    obj.image3:setName("image3");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.frmPATHFINDER4_svg ~= nil then self.frmPATHFINDER4_svg:destroy(); self.frmPATHFINDER4_svg = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.frmPATHFINDER2_svg ~= nil then self.frmPATHFINDER2_svg:destroy(); self.frmPATHFINDER2_svg = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.frmPATHFINDER3_svg ~= nil then self.frmPATHFINDER3_svg:destroy(); self.frmPATHFINDER3_svg = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPATHFINDER()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPATHFINDER();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPATHFINDER = {
    newEditor = newfrmPATHFINDER, 
    new = newfrmPATHFINDER, 
    name = "frmPATHFINDER", 
    dataType = "PathFinder_Oficial", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "PathFinder 2E (Oficial)", 
    description=""};

frmPATHFINDER = _frmPATHFINDER;
Firecast.registrarForm(_frmPATHFINDER);
Firecast.registrarDataType(_frmPATHFINDER);

return _frmPATHFINDER;
