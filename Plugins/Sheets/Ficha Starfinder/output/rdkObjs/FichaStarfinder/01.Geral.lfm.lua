require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister1_svg()
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
    obj:setName("frmFichaRPGmeister1_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.popAtributo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAtributo:setParent(obj);
    obj.popAtributo:setName("popAtributo");
    obj.popAtributo:setWidth(870);
    obj.popAtributo:setHeight(170);
    obj.popAtributo:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAtributo, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popAtributo);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(14);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(50);
    obj.flowPart1:setHeight(15);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Inicial");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(50);
    obj.flowPart2:setMaxWidth(50);
    obj.flowPart2:setHeight(15);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Raça");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(50);
    obj.flowPart3:setMaxWidth(50);
    obj.flowPart3:setHeight(15);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("Tema");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(50);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(15);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("NEP");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(50);
    obj.flowPart5:setMaxWidth(50);
    obj.flowPart5:setHeight(15);
    obj.flowPart5:setName("flowPart5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("Inerente");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(50);
    obj.flowPart6:setMaxWidth(50);
    obj.flowPart6:setHeight(15);
    obj.flowPart6:setName("flowPart6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart6);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Tamanho");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(50);
    obj.flowPart7:setMaxWidth(50);
    obj.flowPart7:setHeight(15);
    obj.flowPart7:setName("flowPart7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart7);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Outros");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(20);
    obj.flowPart8:setMaxWidth(20);
    obj.flowPart8:setHeight(15);
    obj.flowPart8:setName("flowPart8");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setMinWidth(50);
    obj.flowPart9:setMaxWidth(75);
    obj.flowPart9:setHeight(15);
    obj.flowPart9:setName("flowPart9");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowPart9);
    obj.checkBox1:setAlign("client");
    obj.checkBox1:setField("isMelhoriaActive");
    obj.checkBox1:setText("Melhoria");
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setFontSize(10);
    obj.checkBox1:setName("checkBox1");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setMinWidth(50);
    obj.flowPart10:setMaxWidth(75);
    obj.flowPart10:setHeight(15);
    obj.flowPart10:setName("flowPart10");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowPart10);
    obj.checkBox2:setAlign("client");
    obj.checkBox2:setField("isDnTempActive");
    obj.checkBox2:setText("Dn Temp.");
    obj.checkBox2:setHorzTextAlign("center");
    obj.checkBox2:setFontSize(10);
    obj.checkBox2:setName("checkBox2");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setMinWidth(50);
    obj.flowPart11:setMaxWidth(75);
    obj.flowPart11:setHeight(15);
    obj.flowPart11:setName("flowPart11");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowPart11);
    obj.checkBox3:setAlign("client");
    obj.checkBox3:setField("isDnPermActive");
    obj.checkBox3:setText("Dn Perm.");
    obj.checkBox3:setHorzTextAlign("center");
    obj.checkBox3:setFontSize(10);
    obj.checkBox3:setName("checkBox3");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setMinWidth(50);
    obj.flowPart12:setMaxWidth(75);
    obj.flowPart12:setHeight(15);
    obj.flowPart12:setName("flowPart12");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowPart12);
    obj.checkBox4:setAlign("client");
    obj.checkBox4:setField("isTempActive");
    obj.checkBox4:setText("Temp.");
    obj.checkBox4:setHorzTextAlign("center");
    obj.checkBox4:setFontSize(10);
    obj.checkBox4:setName("checkBox4");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout1);
    obj.flowPart13:setMinWidth(50);
    obj.flowPart13:setMaxWidth(75);
    obj.flowPart13:setHeight(15);
    obj.flowPart13:setName("flowPart13");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowPart13);
    obj.checkBox5:setAlign("client");
    obj.checkBox5:setField("isClasseActive");
    obj.checkBox5:setText("Classe");
    obj.checkBox5:setHorzTextAlign("center");
    obj.checkBox5:setFontSize(10);
    obj.checkBox5:setName("checkBox5");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout1);
    obj.flowPart14:setMinWidth(50);
    obj.flowPart14:setMaxWidth(75);
    obj.flowPart14:setHeight(15);
    obj.flowPart14:setName("flowPart14");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowPart14);
    obj.checkBox6:setAlign("client");
    obj.checkBox6:setField("isMagiaActive");
    obj.checkBox6:setText("Magia");
    obj.checkBox6:setHorzTextAlign("center");
    obj.checkBox6:setFontSize(10);
    obj.checkBox6:setName("checkBox6");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popAtributo);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(14);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(50);
    obj.flowPart15:setMaxWidth(50);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setName("flowPart15");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart15);
    obj.edit1:setAlign("client");
    obj.edit1:setField("inicialFor");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(50);
    obj.flowPart16:setMaxWidth(50);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setName("flowPart16");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart16);
    obj.edit2:setAlign("client");
    obj.edit2:setField("racaFor");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(50);
    obj.flowPart17:setMaxWidth(50);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart17);
    obj.edit3:setAlign("client");
    obj.edit3:setField("temaFor");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setMinWidth(50);
    obj.flowPart18:setMaxWidth(50);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setName("flowPart18");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart18);
    obj.edit4:setAlign("client");
    obj.edit4:setField("nepFor");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setMinWidth(50);
    obj.flowPart19:setMaxWidth(50);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart19);
    obj.edit5:setAlign("client");
    obj.edit5:setField("inerenteFor");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setMinWidth(50);
    obj.flowPart20:setMaxWidth(50);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setName("flowPart20");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart20);
    obj.edit6:setAlign("client");
    obj.edit6:setField("tamanhoFor");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(12);
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setMinWidth(50);
    obj.flowPart21:setMaxWidth(50);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setName("flowPart21");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart21);
    obj.edit7:setAlign("client");
    obj.edit7:setField("outrosFor");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(12);
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setMinWidth(20);
    obj.flowPart22:setMaxWidth(20);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setName("flowPart22");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout2);
    obj.flowPart23:setMinWidth(50);
    obj.flowPart23:setMaxWidth(75);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart23);
    obj.edit8:setAlign("client");
    obj.edit8:setField("melhoriaFor");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(12);
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout2);
    obj.flowPart24:setMinWidth(50);
    obj.flowPart24:setMaxWidth(75);
    obj.flowPart24:setHeight(20);
    obj.flowPart24:setName("flowPart24");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart24);
    obj.edit9:setAlign("client");
    obj.edit9:setField("danoTempFor");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(12);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout2);
    obj.flowPart25:setMinWidth(50);
    obj.flowPart25:setMaxWidth(75);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart25);
    obj.edit10:setAlign("client");
    obj.edit10:setField("danoPermFor");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(12);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout2);
    obj.flowPart26:setMinWidth(50);
    obj.flowPart26:setMaxWidth(75);
    obj.flowPart26:setHeight(20);
    obj.flowPart26:setName("flowPart26");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart26);
    obj.edit11:setAlign("client");
    obj.edit11:setField("temporarioFor");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(12);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout2);
    obj.flowPart27:setMinWidth(50);
    obj.flowPart27:setMaxWidth(75);
    obj.flowPart27:setHeight(20);
    obj.flowPart27:setName("flowPart27");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart27);
    obj.edit12:setAlign("client");
    obj.edit12:setField("magiaFor");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(12);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout2);
    obj.flowPart28:setMinWidth(50);
    obj.flowPart28:setMaxWidth(75);
    obj.flowPart28:setHeight(20);
    obj.flowPart28:setName("flowPart28");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart28);
    obj.edit13:setAlign("client");
    obj.edit13:setField("classeFor");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(12);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.popAtributo);
    obj.dataLink1:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink1:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.popAtributo);
    obj.dataLink2:setFields({'inicialFor', 'racaFor', 'temaFor', 'nepFor', 'inerenteFor', 'tamanhoFor', 'outrosFor', 'melhoriaFor', 'danoTempFor', 'danoPermFor', 'temporarioFor', 'magiaFor', 'classeFor', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink2:setName("dataLink2");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.popAtributo);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxControlsPerLine(14);
    obj.flowLayout3:setMargins({bottom=4});
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout3);
    obj.flowPart29:setMinWidth(50);
    obj.flowPart29:setMaxWidth(50);
    obj.flowPart29:setHeight(20);
    obj.flowPart29:setName("flowPart29");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart29);
    obj.edit14:setAlign("client");
    obj.edit14:setField("inicialDes");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(12);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout3);
    obj.flowPart30:setMinWidth(50);
    obj.flowPart30:setMaxWidth(50);
    obj.flowPart30:setHeight(20);
    obj.flowPart30:setName("flowPart30");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart30);
    obj.edit15:setAlign("client");
    obj.edit15:setField("racaDes");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(12);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout3);
    obj.flowPart31:setMinWidth(50);
    obj.flowPart31:setMaxWidth(50);
    obj.flowPart31:setHeight(20);
    obj.flowPart31:setName("flowPart31");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart31);
    obj.edit16:setAlign("client");
    obj.edit16:setField("temaDes");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(12);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout3);
    obj.flowPart32:setMinWidth(50);
    obj.flowPart32:setMaxWidth(50);
    obj.flowPart32:setHeight(20);
    obj.flowPart32:setName("flowPart32");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart32);
    obj.edit17:setAlign("client");
    obj.edit17:setField("nepDes");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(12);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout3);
    obj.flowPart33:setMinWidth(50);
    obj.flowPart33:setMaxWidth(50);
    obj.flowPart33:setHeight(20);
    obj.flowPart33:setName("flowPart33");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart33);
    obj.edit18:setAlign("client");
    obj.edit18:setField("inerenteDes");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(12);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout3);
    obj.flowPart34:setMinWidth(50);
    obj.flowPart34:setMaxWidth(50);
    obj.flowPart34:setHeight(20);
    obj.flowPart34:setName("flowPart34");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart34);
    obj.edit19:setAlign("client");
    obj.edit19:setField("tamanhoDes");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(12);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout3);
    obj.flowPart35:setMinWidth(50);
    obj.flowPart35:setMaxWidth(50);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setName("flowPart35");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart35);
    obj.edit20:setAlign("client");
    obj.edit20:setField("outrosDes");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(12);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout3);
    obj.flowPart36:setMinWidth(20);
    obj.flowPart36:setMaxWidth(20);
    obj.flowPart36:setHeight(20);
    obj.flowPart36:setName("flowPart36");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout3);
    obj.flowPart37:setMinWidth(50);
    obj.flowPart37:setMaxWidth(75);
    obj.flowPart37:setHeight(20);
    obj.flowPart37:setName("flowPart37");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart37);
    obj.edit21:setAlign("client");
    obj.edit21:setField("melhoriaDes");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(12);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout3);
    obj.flowPart38:setMinWidth(50);
    obj.flowPart38:setMaxWidth(75);
    obj.flowPart38:setHeight(20);
    obj.flowPart38:setName("flowPart38");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart38);
    obj.edit22:setAlign("client");
    obj.edit22:setField("danoTempDes");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(12);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout3);
    obj.flowPart39:setMinWidth(50);
    obj.flowPart39:setMaxWidth(75);
    obj.flowPart39:setHeight(20);
    obj.flowPart39:setName("flowPart39");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart39);
    obj.edit23:setAlign("client");
    obj.edit23:setField("danoPermDes");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(12);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout3);
    obj.flowPart40:setMinWidth(50);
    obj.flowPart40:setMaxWidth(75);
    obj.flowPart40:setHeight(20);
    obj.flowPart40:setName("flowPart40");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart40);
    obj.edit24:setAlign("client");
    obj.edit24:setField("temporarioDes");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(12);
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout3);
    obj.flowPart41:setMinWidth(50);
    obj.flowPart41:setMaxWidth(75);
    obj.flowPart41:setHeight(20);
    obj.flowPart41:setName("flowPart41");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart41);
    obj.edit25:setAlign("client");
    obj.edit25:setField("magiaDes");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(12);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout3);
    obj.flowPart42:setMinWidth(50);
    obj.flowPart42:setMaxWidth(75);
    obj.flowPart42:setHeight(20);
    obj.flowPart42:setName("flowPart42");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart42);
    obj.edit26:setAlign("client");
    obj.edit26:setField("classeDes");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(12);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.popAtributo);
    obj.dataLink3:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink3:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.popAtributo);
    obj.dataLink4:setFields({'inicialDes', 'racaDes', 'temaDes', 'nepDes', 'inerenteDes', 'tamanhoDes', 'outrosDes', 'melhoriaDes', 'danoTempDes', 'danoPermDes', 'temporarioDes', 'magiaDes', 'classeDes', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink4:setName("dataLink4");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.popAtributo);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxControlsPerLine(14);
    obj.flowLayout4:setMargins({bottom=4});
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout4);
    obj.flowPart43:setMinWidth(50);
    obj.flowPart43:setMaxWidth(50);
    obj.flowPart43:setHeight(20);
    obj.flowPart43:setName("flowPart43");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart43);
    obj.edit27:setAlign("client");
    obj.edit27:setField("inicialCon");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(12);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout4);
    obj.flowPart44:setMinWidth(50);
    obj.flowPart44:setMaxWidth(50);
    obj.flowPart44:setHeight(20);
    obj.flowPart44:setName("flowPart44");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart44);
    obj.edit28:setAlign("client");
    obj.edit28:setField("racaCon");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(12);
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout4);
    obj.flowPart45:setMinWidth(50);
    obj.flowPart45:setMaxWidth(50);
    obj.flowPart45:setHeight(20);
    obj.flowPart45:setName("flowPart45");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart45);
    obj.edit29:setAlign("client");
    obj.edit29:setField("temaCon");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(12);
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout4);
    obj.flowPart46:setMinWidth(50);
    obj.flowPart46:setMaxWidth(50);
    obj.flowPart46:setHeight(20);
    obj.flowPart46:setName("flowPart46");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart46);
    obj.edit30:setAlign("client");
    obj.edit30:setField("nepCon");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(12);
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout4);
    obj.flowPart47:setMinWidth(50);
    obj.flowPart47:setMaxWidth(50);
    obj.flowPart47:setHeight(20);
    obj.flowPart47:setName("flowPart47");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart47);
    obj.edit31:setAlign("client");
    obj.edit31:setField("inerenteCon");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(12);
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout4);
    obj.flowPart48:setMinWidth(50);
    obj.flowPart48:setMaxWidth(50);
    obj.flowPart48:setHeight(20);
    obj.flowPart48:setName("flowPart48");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart48);
    obj.edit32:setAlign("client");
    obj.edit32:setField("tamanhoCon");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(12);
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout4);
    obj.flowPart49:setMinWidth(50);
    obj.flowPart49:setMaxWidth(50);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setName("flowPart49");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart49);
    obj.edit33:setAlign("client");
    obj.edit33:setField("outrosCon");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(12);
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout4);
    obj.flowPart50:setMinWidth(20);
    obj.flowPart50:setMaxWidth(20);
    obj.flowPart50:setHeight(20);
    obj.flowPart50:setName("flowPart50");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout4);
    obj.flowPart51:setMinWidth(50);
    obj.flowPart51:setMaxWidth(75);
    obj.flowPart51:setHeight(20);
    obj.flowPart51:setName("flowPart51");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart51);
    obj.edit34:setAlign("client");
    obj.edit34:setField("melhoriaCon");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(12);
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout4);
    obj.flowPart52:setMinWidth(50);
    obj.flowPart52:setMaxWidth(75);
    obj.flowPart52:setHeight(20);
    obj.flowPart52:setName("flowPart52");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart52);
    obj.edit35:setAlign("client");
    obj.edit35:setField("danoTempCon");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontSize(12);
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout4);
    obj.flowPart53:setMinWidth(50);
    obj.flowPart53:setMaxWidth(75);
    obj.flowPart53:setHeight(20);
    obj.flowPart53:setName("flowPart53");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart53);
    obj.edit36:setAlign("client");
    obj.edit36:setField("danoPermCon");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontSize(12);
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout4);
    obj.flowPart54:setMinWidth(50);
    obj.flowPart54:setMaxWidth(75);
    obj.flowPart54:setHeight(20);
    obj.flowPart54:setName("flowPart54");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart54);
    obj.edit37:setAlign("client");
    obj.edit37:setField("temporarioCon");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(12);
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout4);
    obj.flowPart55:setMinWidth(50);
    obj.flowPart55:setMaxWidth(75);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setName("flowPart55");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart55);
    obj.edit38:setAlign("client");
    obj.edit38:setField("magiaCon");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontSize(12);
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout4);
    obj.flowPart56:setMinWidth(50);
    obj.flowPart56:setMaxWidth(75);
    obj.flowPart56:setHeight(20);
    obj.flowPart56:setName("flowPart56");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart56);
    obj.edit39:setAlign("client");
    obj.edit39:setField("classeCon");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontSize(12);
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.popAtributo);
    obj.dataLink5:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink5:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.popAtributo);
    obj.dataLink6:setFields({'inicialCon', 'racaCon', 'temaCon', 'nepCon', 'inerenteCon', 'tamanhoCon', 'outrosCon', 'melhoriaCon', 'danoTempCon', 'danoPermCon', 'temporarioCon', 'magiaCon', 'classeCon', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink6:setName("dataLink6");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.popAtributo);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxControlsPerLine(14);
    obj.flowLayout5:setMargins({bottom=4});
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout5);
    obj.flowPart57:setMinWidth(50);
    obj.flowPart57:setMaxWidth(50);
    obj.flowPart57:setHeight(20);
    obj.flowPart57:setName("flowPart57");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart57);
    obj.edit40:setAlign("client");
    obj.edit40:setField("inicialInt");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontSize(12);
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout5);
    obj.flowPart58:setMinWidth(50);
    obj.flowPart58:setMaxWidth(50);
    obj.flowPart58:setHeight(20);
    obj.flowPart58:setName("flowPart58");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart58);
    obj.edit41:setAlign("client");
    obj.edit41:setField("racaInt");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(12);
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout5);
    obj.flowPart59:setMinWidth(50);
    obj.flowPart59:setMaxWidth(50);
    obj.flowPart59:setHeight(20);
    obj.flowPart59:setName("flowPart59");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart59);
    obj.edit42:setAlign("client");
    obj.edit42:setField("temaInt");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontSize(12);
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout5);
    obj.flowPart60:setMinWidth(50);
    obj.flowPart60:setMaxWidth(50);
    obj.flowPart60:setHeight(20);
    obj.flowPart60:setName("flowPart60");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart60);
    obj.edit43:setAlign("client");
    obj.edit43:setField("nepInt");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(12);
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout5);
    obj.flowPart61:setMinWidth(50);
    obj.flowPart61:setMaxWidth(50);
    obj.flowPart61:setHeight(20);
    obj.flowPart61:setName("flowPart61");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart61);
    obj.edit44:setAlign("client");
    obj.edit44:setField("inerenteInt");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(12);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout5);
    obj.flowPart62:setMinWidth(50);
    obj.flowPart62:setMaxWidth(50);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setName("flowPart62");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart62);
    obj.edit45:setAlign("client");
    obj.edit45:setField("tamanhoInt");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontSize(12);
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout5);
    obj.flowPart63:setMinWidth(50);
    obj.flowPart63:setMaxWidth(50);
    obj.flowPart63:setHeight(20);
    obj.flowPart63:setName("flowPart63");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart63);
    obj.edit46:setAlign("client");
    obj.edit46:setField("outrosInt");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(12);
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout5);
    obj.flowPart64:setMinWidth(20);
    obj.flowPart64:setMaxWidth(20);
    obj.flowPart64:setHeight(20);
    obj.flowPart64:setName("flowPart64");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout5);
    obj.flowPart65:setMinWidth(50);
    obj.flowPart65:setMaxWidth(75);
    obj.flowPart65:setHeight(20);
    obj.flowPart65:setName("flowPart65");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart65);
    obj.edit47:setAlign("client");
    obj.edit47:setField("melhoriaInt");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontSize(12);
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout5);
    obj.flowPart66:setMinWidth(50);
    obj.flowPart66:setMaxWidth(75);
    obj.flowPart66:setHeight(20);
    obj.flowPart66:setName("flowPart66");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart66);
    obj.edit48:setAlign("client");
    obj.edit48:setField("danoTempInt");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontSize(12);
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout5);
    obj.flowPart67:setMinWidth(50);
    obj.flowPart67:setMaxWidth(75);
    obj.flowPart67:setHeight(20);
    obj.flowPart67:setName("flowPart67");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart67);
    obj.edit49:setAlign("client");
    obj.edit49:setField("danoPermInt");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontSize(12);
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout5);
    obj.flowPart68:setMinWidth(50);
    obj.flowPart68:setMaxWidth(75);
    obj.flowPart68:setHeight(20);
    obj.flowPart68:setName("flowPart68");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart68);
    obj.edit50:setAlign("client");
    obj.edit50:setField("temporarioInt");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontSize(12);
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout5);
    obj.flowPart69:setMinWidth(50);
    obj.flowPart69:setMaxWidth(75);
    obj.flowPart69:setHeight(20);
    obj.flowPart69:setName("flowPart69");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart69);
    obj.edit51:setAlign("client");
    obj.edit51:setField("magiaInt");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontSize(12);
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout5);
    obj.flowPart70:setMinWidth(50);
    obj.flowPart70:setMaxWidth(75);
    obj.flowPart70:setHeight(20);
    obj.flowPart70:setName("flowPart70");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart70);
    obj.edit52:setAlign("client");
    obj.edit52:setField("classeInt");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontSize(12);
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.popAtributo);
    obj.dataLink7:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink7:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.popAtributo);
    obj.dataLink8:setFields({'inicialInt', 'racaInt', 'temaInt', 'nepInt', 'inerenteInt', 'tamanhoInt', 'outrosInt', 'melhoriaInt', 'danoTempInt', 'danoPermInt', 'temporarioInt', 'magiaInt', 'classeInt', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink8:setName("dataLink8");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.popAtributo);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxControlsPerLine(14);
    obj.flowLayout6:setMargins({bottom=4});
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout6);
    obj.flowPart71:setMinWidth(50);
    obj.flowPart71:setMaxWidth(50);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setName("flowPart71");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart71);
    obj.edit53:setAlign("client");
    obj.edit53:setField("inicialSab");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontSize(12);
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout6);
    obj.flowPart72:setMinWidth(50);
    obj.flowPart72:setMaxWidth(50);
    obj.flowPart72:setHeight(20);
    obj.flowPart72:setName("flowPart72");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart72);
    obj.edit54:setAlign("client");
    obj.edit54:setField("racaSab");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontSize(12);
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout6);
    obj.flowPart73:setMinWidth(50);
    obj.flowPart73:setMaxWidth(50);
    obj.flowPart73:setHeight(20);
    obj.flowPart73:setName("flowPart73");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart73);
    obj.edit55:setAlign("client");
    obj.edit55:setField("temaSab");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setFontSize(12);
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout6);
    obj.flowPart74:setMinWidth(50);
    obj.flowPart74:setMaxWidth(50);
    obj.flowPart74:setHeight(20);
    obj.flowPart74:setName("flowPart74");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart74);
    obj.edit56:setAlign("client");
    obj.edit56:setField("nepSab");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontSize(12);
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout6);
    obj.flowPart75:setMinWidth(50);
    obj.flowPart75:setMaxWidth(50);
    obj.flowPart75:setHeight(20);
    obj.flowPart75:setName("flowPart75");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart75);
    obj.edit57:setAlign("client");
    obj.edit57:setField("inerenteSab");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setFontSize(12);
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout6);
    obj.flowPart76:setMinWidth(50);
    obj.flowPart76:setMaxWidth(50);
    obj.flowPart76:setHeight(20);
    obj.flowPart76:setName("flowPart76");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart76);
    obj.edit58:setAlign("client");
    obj.edit58:setField("tamanhoSab");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(12);
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout6);
    obj.flowPart77:setMinWidth(50);
    obj.flowPart77:setMaxWidth(50);
    obj.flowPart77:setHeight(20);
    obj.flowPart77:setName("flowPart77");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart77);
    obj.edit59:setAlign("client");
    obj.edit59:setField("outrosSab");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setFontSize(12);
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout6);
    obj.flowPart78:setMinWidth(20);
    obj.flowPart78:setMaxWidth(20);
    obj.flowPart78:setHeight(20);
    obj.flowPart78:setName("flowPart78");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout6);
    obj.flowPart79:setMinWidth(50);
    obj.flowPart79:setMaxWidth(75);
    obj.flowPart79:setHeight(20);
    obj.flowPart79:setName("flowPart79");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart79);
    obj.edit60:setAlign("client");
    obj.edit60:setField("melhoriaSab");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(12);
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout6);
    obj.flowPart80:setMinWidth(50);
    obj.flowPart80:setMaxWidth(75);
    obj.flowPart80:setHeight(20);
    obj.flowPart80:setName("flowPart80");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart80);
    obj.edit61:setAlign("client");
    obj.edit61:setField("danoTempSab");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontSize(12);
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout6);
    obj.flowPart81:setMinWidth(50);
    obj.flowPart81:setMaxWidth(75);
    obj.flowPart81:setHeight(20);
    obj.flowPart81:setName("flowPart81");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart81);
    obj.edit62:setAlign("client");
    obj.edit62:setField("danoPermSab");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontSize(12);
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout6);
    obj.flowPart82:setMinWidth(50);
    obj.flowPart82:setMaxWidth(75);
    obj.flowPart82:setHeight(20);
    obj.flowPart82:setName("flowPart82");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart82);
    obj.edit63:setAlign("client");
    obj.edit63:setField("temporarioSab");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontSize(12);
    obj.edit63:setType("number");
    obj.edit63:setName("edit63");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout6);
    obj.flowPart83:setMinWidth(50);
    obj.flowPart83:setMaxWidth(75);
    obj.flowPart83:setHeight(20);
    obj.flowPart83:setName("flowPart83");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart83);
    obj.edit64:setAlign("client");
    obj.edit64:setField("magiaSab");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontSize(12);
    obj.edit64:setType("number");
    obj.edit64:setName("edit64");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout6);
    obj.flowPart84:setMinWidth(50);
    obj.flowPart84:setMaxWidth(75);
    obj.flowPart84:setHeight(20);
    obj.flowPart84:setName("flowPart84");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart84);
    obj.edit65:setAlign("client");
    obj.edit65:setField("classeSab");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontSize(12);
    obj.edit65:setType("number");
    obj.edit65:setName("edit65");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.popAtributo);
    obj.dataLink9:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink9:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.popAtributo);
    obj.dataLink10:setFields({'inicialSab', 'racaSab', 'temaSab', 'nepSab', 'inerenteSab', 'tamanhoSab', 'outrosSab', 'melhoriaSab', 'danoTempSab', 'danoPermSab', 'temporarioSab', 'magiaSab', 'classeSab', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink10:setName("dataLink10");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.popAtributo);
    obj.flowLayout7:setAlign("top");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMaxControlsPerLine(14);
    obj.flowLayout7:setMargins({bottom=4});
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setName("flowLayout7");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout7);
    obj.flowPart85:setMinWidth(50);
    obj.flowPart85:setMaxWidth(50);
    obj.flowPart85:setHeight(20);
    obj.flowPart85:setName("flowPart85");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.flowPart85);
    obj.edit66:setAlign("client");
    obj.edit66:setField("inicialCar");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontSize(12);
    obj.edit66:setType("number");
    obj.edit66:setName("edit66");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout7);
    obj.flowPart86:setMinWidth(50);
    obj.flowPart86:setMaxWidth(50);
    obj.flowPart86:setHeight(20);
    obj.flowPart86:setName("flowPart86");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.flowPart86);
    obj.edit67:setAlign("client");
    obj.edit67:setField("racaCar");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontSize(12);
    obj.edit67:setType("number");
    obj.edit67:setName("edit67");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout7);
    obj.flowPart87:setMinWidth(50);
    obj.flowPart87:setMaxWidth(50);
    obj.flowPart87:setHeight(20);
    obj.flowPart87:setName("flowPart87");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.flowPart87);
    obj.edit68:setAlign("client");
    obj.edit68:setField("temaCar");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontSize(12);
    obj.edit68:setType("number");
    obj.edit68:setName("edit68");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout7);
    obj.flowPart88:setMinWidth(50);
    obj.flowPart88:setMaxWidth(50);
    obj.flowPart88:setHeight(20);
    obj.flowPart88:setName("flowPart88");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart88);
    obj.edit69:setAlign("client");
    obj.edit69:setField("nepCar");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontSize(12);
    obj.edit69:setType("number");
    obj.edit69:setName("edit69");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout7);
    obj.flowPart89:setMinWidth(50);
    obj.flowPart89:setMaxWidth(50);
    obj.flowPart89:setHeight(20);
    obj.flowPart89:setName("flowPart89");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart89);
    obj.edit70:setAlign("client");
    obj.edit70:setField("inerenteCar");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontSize(12);
    obj.edit70:setType("number");
    obj.edit70:setName("edit70");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout7);
    obj.flowPart90:setMinWidth(50);
    obj.flowPart90:setMaxWidth(50);
    obj.flowPart90:setHeight(20);
    obj.flowPart90:setName("flowPart90");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart90);
    obj.edit71:setAlign("client");
    obj.edit71:setField("tamanhoCar");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontSize(12);
    obj.edit71:setType("number");
    obj.edit71:setName("edit71");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout7);
    obj.flowPart91:setMinWidth(50);
    obj.flowPart91:setMaxWidth(50);
    obj.flowPart91:setHeight(20);
    obj.flowPart91:setName("flowPart91");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart91);
    obj.edit72:setAlign("client");
    obj.edit72:setField("outrosCar");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontSize(12);
    obj.edit72:setType("number");
    obj.edit72:setName("edit72");

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout7);
    obj.flowPart92:setMinWidth(20);
    obj.flowPart92:setMaxWidth(20);
    obj.flowPart92:setHeight(20);
    obj.flowPart92:setName("flowPart92");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout7);
    obj.flowPart93:setMinWidth(50);
    obj.flowPart93:setMaxWidth(75);
    obj.flowPart93:setHeight(20);
    obj.flowPart93:setName("flowPart93");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart93);
    obj.edit73:setAlign("client");
    obj.edit73:setField("melhoriaCar");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontSize(12);
    obj.edit73:setType("number");
    obj.edit73:setName("edit73");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout7);
    obj.flowPart94:setMinWidth(50);
    obj.flowPart94:setMaxWidth(75);
    obj.flowPart94:setHeight(20);
    obj.flowPart94:setName("flowPart94");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart94);
    obj.edit74:setAlign("client");
    obj.edit74:setField("danoTempCar");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontSize(12);
    obj.edit74:setType("number");
    obj.edit74:setName("edit74");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout7);
    obj.flowPart95:setMinWidth(50);
    obj.flowPart95:setMaxWidth(75);
    obj.flowPart95:setHeight(20);
    obj.flowPart95:setName("flowPart95");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.flowPart95);
    obj.edit75:setAlign("client");
    obj.edit75:setField("danoPermCar");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setFontSize(12);
    obj.edit75:setType("number");
    obj.edit75:setName("edit75");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout7);
    obj.flowPart96:setMinWidth(50);
    obj.flowPart96:setMaxWidth(75);
    obj.flowPart96:setHeight(20);
    obj.flowPart96:setName("flowPart96");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.flowPart96);
    obj.edit76:setAlign("client");
    obj.edit76:setField("temporarioCar");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontSize(12);
    obj.edit76:setType("number");
    obj.edit76:setName("edit76");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout7);
    obj.flowPart97:setMinWidth(50);
    obj.flowPart97:setMaxWidth(75);
    obj.flowPart97:setHeight(20);
    obj.flowPart97:setName("flowPart97");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.flowPart97);
    obj.edit77:setAlign("client");
    obj.edit77:setField("magiaCar");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setFontSize(12);
    obj.edit77:setType("number");
    obj.edit77:setName("edit77");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout7);
    obj.flowPart98:setMinWidth(50);
    obj.flowPart98:setMaxWidth(75);
    obj.flowPart98:setHeight(20);
    obj.flowPart98:setName("flowPart98");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.flowPart98);
    obj.edit78:setAlign("client");
    obj.edit78:setField("classeCar");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setFontSize(12);
    obj.edit78:setType("number");
    obj.edit78:setName("edit78");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.popAtributo);
    obj.dataLink11:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink11:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.popAtributo);
    obj.dataLink12:setFields({'inicialCar', 'racaCar', 'temaCar', 'nepCar', 'inerenteCar', 'tamanhoCar', 'outrosCar', 'melhoriaCar', 'danoTempCar', 'danoPermCar', 'temporarioCar', 'magiaCar', 'classeCar', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink12:setName("dataLink12");

    obj.popResistencia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popResistencia:setParent(obj);
    obj.popResistencia:setName("popResistencia");
    obj.popResistencia:setWidth(380);
    obj.popResistencia:setHeight(150);
    obj.popResistencia:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popResistencia, "autoScopeNode",  "false");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.popResistencia);
    obj.flowLayout8:setAlign("top");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setMaxControlsPerLine(11);
    obj.flowLayout8:setMargins({bottom=4});
    obj.flowLayout8:setHorzAlign("center");
    obj.flowLayout8:setName("flowLayout8");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout8);
    obj.flowPart99:setMinWidth(50);
    obj.flowPart99:setMaxWidth(50);
    obj.flowPart99:setHeight(15);
    obj.flowPart99:setName("flowPart99");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart99);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Base");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout8);
    obj.flowPart100:setMinWidth(50);
    obj.flowPart100:setMaxWidth(50);
    obj.flowPart100:setHeight(15);
    obj.flowPart100:setName("flowPart100");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart100);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(10);
    obj.label9:setText("Atributo");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout8);
    obj.flowPart101:setMinWidth(50);
    obj.flowPart101:setMaxWidth(50);
    obj.flowPart101:setHeight(15);
    obj.flowPart101:setName("flowPart101");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart101);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Magia");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout8);
    obj.flowPart102:setMinWidth(50);
    obj.flowPart102:setMaxWidth(50);
    obj.flowPart102:setHeight(15);
    obj.flowPart102:setName("flowPart102");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart102);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(10);
    obj.label11:setText("Melhoria");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout8);
    obj.flowPart103:setMinWidth(50);
    obj.flowPart103:setMaxWidth(50);
    obj.flowPart103:setHeight(15);
    obj.flowPart103:setName("flowPart103");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart103);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Temp.");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout8);
    obj.flowPart104:setMinWidth(50);
    obj.flowPart104:setMaxWidth(50);
    obj.flowPart104:setHeight(15);
    obj.flowPart104:setName("flowPart104");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart104);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(10);
    obj.label13:setText("Outros");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout8);
    obj.flowPart105:setMinWidth(50);
    obj.flowPart105:setMaxWidth(50);
    obj.flowPart105:setHeight(15);
    obj.flowPart105:setName("flowPart105");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart105);
    obj.label14:setAlign("top");
    obj.label14:setFontSize(10);
    obj.label14:setText("");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setWordWrap(true);
    obj.label14:setTextTrimming("none");
    obj.label14:setAutoSize(true);
    obj.label14:setName("label14");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.popResistencia);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxControlsPerLine(11);
    obj.flowLayout9:setMargins({bottom=4});
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setName("flowLayout9");

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout9);
    obj.flowPart106:setMinWidth(50);
    obj.flowPart106:setMaxWidth(50);
    obj.flowPart106:setHeight(20);
    obj.flowPart106:setName("flowPart106");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.flowPart106);
    obj.edit79:setAlign("client");
    obj.edit79:setField("baseFort");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setFontSize(12);
    obj.edit79:setType("number");
    obj.edit79:setName("edit79");

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout9);
    obj.flowPart107:setMinWidth(50);
    obj.flowPart107:setMaxWidth(50);
    obj.flowPart107:setHeight(20);
    obj.flowPart107:setName("flowPart107");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart107);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart107);
    obj.label15:setAlign("client");
    obj.label15:setField("atrModFort");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontSize(12);
    obj.label15:setName("label15");

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout9);
    obj.flowPart108:setMinWidth(50);
    obj.flowPart108:setMaxWidth(50);
    obj.flowPart108:setHeight(20);
    obj.flowPart108:setName("flowPart108");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.flowPart108);
    obj.edit80:setAlign("client");
    obj.edit80:setField("magiaFort");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setFontSize(12);
    obj.edit80:setType("number");
    obj.edit80:setName("edit80");

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout9);
    obj.flowPart109:setMinWidth(50);
    obj.flowPart109:setMaxWidth(50);
    obj.flowPart109:setHeight(20);
    obj.flowPart109:setName("flowPart109");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.flowPart109);
    obj.edit81:setAlign("client");
    obj.edit81:setField("variavelFort");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setFontSize(12);
    obj.edit81:setType("number");
    obj.edit81:setName("edit81");

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout9);
    obj.flowPart110:setMinWidth(50);
    obj.flowPart110:setMaxWidth(50);
    obj.flowPart110:setHeight(20);
    obj.flowPart110:setName("flowPart110");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.flowPart110);
    obj.edit82:setAlign("client");
    obj.edit82:setField("temporarioFort");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setFontSize(12);
    obj.edit82:setType("number");
    obj.edit82:setName("edit82");

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout9);
    obj.flowPart111:setMinWidth(50);
    obj.flowPart111:setMaxWidth(50);
    obj.flowPart111:setHeight(20);
    obj.flowPart111:setName("flowPart111");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.flowPart111);
    obj.edit83:setAlign("client");
    obj.edit83:setField("outrosFort");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setFontSize(12);
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");

    obj.flowPart112 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.flowLayout9);
    obj.flowPart112:setMinWidth(60);
    obj.flowPart112:setMaxWidth(60);
    obj.flowPart112:setHeight(20);
    obj.flowPart112:setName("flowPart112");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowPart112);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setField("atrTrFort");
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setName("comboBox1");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.popResistencia);
    obj.flowLayout10:setAlign("top");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxControlsPerLine(11);
    obj.flowLayout10:setMargins({bottom=4});
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setName("flowLayout10");

    obj.flowPart113 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.flowLayout10);
    obj.flowPart113:setMinWidth(50);
    obj.flowPart113:setMaxWidth(50);
    obj.flowPart113:setHeight(20);
    obj.flowPart113:setName("flowPart113");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.flowPart113);
    obj.edit84:setAlign("client");
    obj.edit84:setField("baseRef");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setFontSize(12);
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");

    obj.flowPart114 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.flowLayout10);
    obj.flowPart114:setMinWidth(50);
    obj.flowPart114:setMaxWidth(50);
    obj.flowPart114:setHeight(20);
    obj.flowPart114:setName("flowPart114");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowPart114);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart114);
    obj.label16:setAlign("client");
    obj.label16:setField("atrModRef");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(12);
    obj.label16:setName("label16");

    obj.flowPart115 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.flowLayout10);
    obj.flowPart115:setMinWidth(50);
    obj.flowPart115:setMaxWidth(50);
    obj.flowPart115:setHeight(20);
    obj.flowPart115:setName("flowPart115");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.flowPart115);
    obj.edit85:setAlign("client");
    obj.edit85:setField("magiaRef");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setFontSize(12);
    obj.edit85:setType("number");
    obj.edit85:setName("edit85");

    obj.flowPart116 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.flowLayout10);
    obj.flowPart116:setMinWidth(50);
    obj.flowPart116:setMaxWidth(50);
    obj.flowPart116:setHeight(20);
    obj.flowPart116:setName("flowPart116");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.flowPart116);
    obj.edit86:setAlign("client");
    obj.edit86:setField("variavelRef");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setFontSize(12);
    obj.edit86:setType("number");
    obj.edit86:setName("edit86");

    obj.flowPart117 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.flowLayout10);
    obj.flowPart117:setMinWidth(50);
    obj.flowPart117:setMaxWidth(50);
    obj.flowPart117:setHeight(20);
    obj.flowPart117:setName("flowPart117");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.flowPart117);
    obj.edit87:setAlign("client");
    obj.edit87:setField("temporarioRef");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setFontSize(12);
    obj.edit87:setType("number");
    obj.edit87:setName("edit87");

    obj.flowPart118 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.flowLayout10);
    obj.flowPart118:setMinWidth(50);
    obj.flowPart118:setMaxWidth(50);
    obj.flowPart118:setHeight(20);
    obj.flowPart118:setName("flowPart118");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.flowPart118);
    obj.edit88:setAlign("client");
    obj.edit88:setField("outrosRef");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setFontSize(12);
    obj.edit88:setType("number");
    obj.edit88:setName("edit88");

    obj.flowPart119 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.flowLayout10);
    obj.flowPart119:setMinWidth(60);
    obj.flowPart119:setMaxWidth(60);
    obj.flowPart119:setHeight(20);
    obj.flowPart119:setName("flowPart119");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart119);
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setField("atrTrRef");
    obj.comboBox2:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox2:setName("comboBox2");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.popResistencia);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxControlsPerLine(11);
    obj.flowLayout11:setMargins({bottom=4});
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setName("flowLayout11");

    obj.flowPart120 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.flowLayout11);
    obj.flowPart120:setMinWidth(50);
    obj.flowPart120:setMaxWidth(50);
    obj.flowPart120:setHeight(20);
    obj.flowPart120:setName("flowPart120");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.flowPart120);
    obj.edit89:setAlign("client");
    obj.edit89:setField("baseVon");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setFontSize(12);
    obj.edit89:setType("number");
    obj.edit89:setName("edit89");

    obj.flowPart121 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout11);
    obj.flowPart121:setMinWidth(50);
    obj.flowPart121:setMaxWidth(50);
    obj.flowPart121:setHeight(20);
    obj.flowPart121:setName("flowPart121");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart121);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart121);
    obj.label17:setAlign("client");
    obj.label17:setField("atrModVon");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(12);
    obj.label17:setName("label17");

    obj.flowPart122 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.flowLayout11);
    obj.flowPart122:setMinWidth(50);
    obj.flowPart122:setMaxWidth(50);
    obj.flowPart122:setHeight(20);
    obj.flowPart122:setName("flowPart122");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.flowPart122);
    obj.edit90:setAlign("client");
    obj.edit90:setField("magiaVon");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setFontSize(12);
    obj.edit90:setType("number");
    obj.edit90:setName("edit90");

    obj.flowPart123 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.flowLayout11);
    obj.flowPart123:setMinWidth(50);
    obj.flowPart123:setMaxWidth(50);
    obj.flowPart123:setHeight(20);
    obj.flowPart123:setName("flowPart123");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.flowPart123);
    obj.edit91:setAlign("client");
    obj.edit91:setField("variavelVon");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setFontSize(12);
    obj.edit91:setType("number");
    obj.edit91:setName("edit91");

    obj.flowPart124 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.flowLayout11);
    obj.flowPart124:setMinWidth(50);
    obj.flowPart124:setMaxWidth(50);
    obj.flowPart124:setHeight(20);
    obj.flowPart124:setName("flowPart124");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.flowPart124);
    obj.edit92:setAlign("client");
    obj.edit92:setField("temporarioVon");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setFontSize(12);
    obj.edit92:setType("number");
    obj.edit92:setName("edit92");

    obj.flowPart125 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.flowLayout11);
    obj.flowPart125:setMinWidth(50);
    obj.flowPart125:setMaxWidth(50);
    obj.flowPart125:setHeight(20);
    obj.flowPart125:setName("flowPart125");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.flowPart125);
    obj.edit93:setAlign("client");
    obj.edit93:setField("outrosVon");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setFontSize(12);
    obj.edit93:setType("number");
    obj.edit93:setName("edit93");

    obj.flowPart126 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.flowLayout11);
    obj.flowPart126:setMinWidth(60);
    obj.flowPart126:setMaxWidth(60);
    obj.flowPart126:setHeight(20);
    obj.flowPart126:setName("flowPart126");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowPart126);
    obj.comboBox3:setAlign("client");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setField("atrTrVon");
    obj.comboBox3:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox3:setName("comboBox3");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popResistencia);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("trCondicional");
    obj.textEditor1:setName("textEditor1");

    obj.popCA = GUI.fromHandle(_obj_newObject("popup"));
    obj.popCA:setParent(obj);
    obj.popCA:setName("popCA");
    obj.popCA:setWidth(450);
    obj.popCA:setHeight(210);
    obj.popCA:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popCA, "autoScopeNode",  "false");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.popCA);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMargins({bottom=4});
    obj.flowLayout12:setName("flowLayout12");

    obj.flowPart127 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.flowLayout12);
    obj.flowPart127:setMinWidth(50);
    obj.flowPart127:setMaxWidth(50);
    obj.flowPart127:setHeight(15);
    obj.flowPart127:setName("flowPart127");

    obj.flowPart128 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.flowLayout12);
    obj.flowPart128:setMinWidth(50);
    obj.flowPart128:setMaxWidth(50);
    obj.flowPart128:setHeight(15);
    obj.flowPart128:setName("flowPart128");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart128);
    obj.label18:setAlign("top");
    obj.label18:setFontSize(10);
    obj.label18:setText("CAE");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWordWrap(true);
    obj.label18:setTextTrimming("none");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");

    obj.flowPart129 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.flowLayout12);
    obj.flowPart129:setMinWidth(50);
    obj.flowPart129:setMaxWidth(50);
    obj.flowPart129:setHeight(15);
    obj.flowPart129:setName("flowPart129");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart129);
    obj.label19:setAlign("top");
    obj.label19:setFontSize(10);
    obj.label19:setText("CAC");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setWordWrap(true);
    obj.label19:setTextTrimming("none");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout12);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart130 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.flowLayout12);
    obj.flowPart130:setMinWidth(50);
    obj.flowPart130:setMaxWidth(50);
    obj.flowPart130:setHeight(15);
    obj.flowPart130:setName("flowPart130");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart130);
    obj.label20:setAlign("top");
    obj.label20:setFontSize(10);
    obj.label20:setText("Armadura");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWordWrap(true);
    obj.label20:setTextTrimming("none");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.flowPart131 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.flowLayout12);
    obj.flowPart131:setMinWidth(50);
    obj.flowPart131:setMaxWidth(50);
    obj.flowPart131:setHeight(20);
    obj.flowPart131:setName("flowPart131");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.flowPart131);
    obj.edit94:setAlign("client");
    obj.edit94:setField("armaduraCae");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setFontSize(12);
    obj.edit94:setType("number");
    obj.edit94:setName("edit94");

    obj.flowPart132 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.flowLayout12);
    obj.flowPart132:setMinWidth(50);
    obj.flowPart132:setMaxWidth(50);
    obj.flowPart132:setHeight(20);
    obj.flowPart132:setName("flowPart132");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.flowPart132);
    obj.edit95:setAlign("client");
    obj.edit95:setField("armaduraCac");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setFontSize(12);
    obj.edit95:setType("number");
    obj.edit95:setName("edit95");

    obj.flowPart133 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.flowLayout12);
    obj.flowPart133:setMinWidth(140);
    obj.flowPart133:setMaxWidth(150);
    obj.flowPart133:setHeight(20);
    obj.flowPart133:setName("flowPart133");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.flowPart133);
    obj.edit96:setAlign("client");
    obj.edit96:setField("armaduraCa2");
    obj.edit96:setFontSize(12);
    obj.edit96:setName("edit96");

    obj.flowPart134 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.flowLayout12);
    obj.flowPart134:setMinWidth(10);
    obj.flowPart134:setMaxWidth(20);
    obj.flowPart134:setHeight(15);
    obj.flowPart134:setName("flowPart134");

    obj.flowPart135 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.flowLayout12);
    obj.flowPart135:setMinWidth(50);
    obj.flowPart135:setMaxWidth(50);
    obj.flowPart135:setHeight(15);
    obj.flowPart135:setName("flowPart135");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart135);
    obj.label21:setAlign("top");
    obj.label21:setFontSize(10);
    obj.label21:setText("Penalidade");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWordWrap(true);
    obj.label21:setTextTrimming("none");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.flowPart136 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.flowLayout12);
    obj.flowPart136:setMinWidth(50);
    obj.flowPart136:setMaxWidth(50);
    obj.flowPart136:setHeight(20);
    obj.flowPart136:setName("flowPart136");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.flowPart136);
    obj.edit97:setAlign("client");
    obj.edit97:setField("equipamentoCorpoPen");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setFontSize(12);
    obj.edit97:setType("number");
    obj.edit97:setName("edit97");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout12);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart137 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.flowLayout12);
    obj.flowPart137:setMinWidth(50);
    obj.flowPart137:setMaxWidth(50);
    obj.flowPart137:setHeight(15);
    obj.flowPart137:setName("flowPart137");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart137);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(10);
    obj.label22:setText("Destreza");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.flowPart138 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.flowLayout12);
    obj.flowPart138:setMinWidth(25);
    obj.flowPart138:setMaxWidth(25);
    obj.flowPart138:setHeight(15);
    obj.flowPart138:setName("flowPart138");

    obj.flowPart139 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.flowLayout12);
    obj.flowPart139:setMinWidth(50);
    obj.flowPart139:setMaxWidth(50);
    obj.flowPart139:setHeight(20);
    obj.flowPart139:setName("flowPart139");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowPart139);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart139);
    obj.label23:setAlign("client");
    obj.label23:setField("efetModDes");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(12);
    obj.label23:setName("label23");

    obj.flowPart140 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.flowLayout12);
    obj.flowPart140:setMinWidth(25);
    obj.flowPart140:setMaxWidth(25);
    obj.flowPart140:setHeight(15);
    obj.flowPart140:setName("flowPart140");

    obj.flowPart141 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.flowLayout12);
    obj.flowPart141:setMinWidth(140);
    obj.flowPart141:setMaxWidth(150);
    obj.flowPart141:setHeight(20);
    obj.flowPart141:setName("flowPart141");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.flowPart141);
    obj.edit98:setAlign("client");
    obj.edit98:setField("destrezaCa2");
    obj.edit98:setFontSize(12);
    obj.edit98:setName("edit98");

    obj.flowPart142 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart142:setParent(obj.flowLayout12);
    obj.flowPart142:setMinWidth(10);
    obj.flowPart142:setMaxWidth(20);
    obj.flowPart142:setHeight(15);
    obj.flowPart142:setName("flowPart142");

    obj.flowPart143 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart143:setParent(obj.flowLayout12);
    obj.flowPart143:setMinWidth(50);
    obj.flowPart143:setMaxWidth(50);
    obj.flowPart143:setHeight(15);
    obj.flowPart143:setName("flowPart143");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart143);
    obj.label24:setAlign("top");
    obj.label24:setFontSize(10);
    obj.label24:setText("Limite");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.flowPart144 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart144:setParent(obj.flowLayout12);
    obj.flowPart144:setMinWidth(50);
    obj.flowPart144:setMaxWidth(50);
    obj.flowPart144:setHeight(20);
    obj.flowPart144:setName("flowPart144");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.flowPart144);
    obj.edit99:setAlign("client");
    obj.edit99:setField("destrezaCALimit");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setFontSize(12);
    obj.edit99:setType("number");
    obj.edit99:setName("edit99");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout12);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart145 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart145:setParent(obj.flowLayout12);
    obj.flowPart145:setMinWidth(50);
    obj.flowPart145:setMaxWidth(50);
    obj.flowPart145:setHeight(15);
    obj.flowPart145:setName("flowPart145");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart145);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(10);
    obj.label25:setText("Tamanho");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setWordWrap(true);
    obj.label25:setTextTrimming("none");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.flowPart146 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart146:setParent(obj.flowLayout12);
    obj.flowPart146:setMinWidth(50);
    obj.flowPart146:setMaxWidth(50);
    obj.flowPart146:setHeight(20);
    obj.flowPart146:setName("flowPart146");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.flowPart146);
    obj.edit100:setAlign("client");
    obj.edit100:setField("tamanhoCae");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setFontSize(12);
    obj.edit100:setType("number");
    obj.edit100:setName("edit100");

    obj.flowPart147 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart147:setParent(obj.flowLayout12);
    obj.flowPart147:setMinWidth(50);
    obj.flowPart147:setMaxWidth(50);
    obj.flowPart147:setHeight(20);
    obj.flowPart147:setName("flowPart147");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.flowPart147);
    obj.edit101:setAlign("client");
    obj.edit101:setField("tamanhoCac");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setFontSize(12);
    obj.edit101:setType("number");
    obj.edit101:setName("edit101");

    obj.flowPart148 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart148:setParent(obj.flowLayout12);
    obj.flowPart148:setMinWidth(140);
    obj.flowPart148:setMaxWidth(150);
    obj.flowPart148:setHeight(20);
    obj.flowPart148:setName("flowPart148");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.flowPart148);
    obj.edit102:setAlign("client");
    obj.edit102:setField("tamanhoCa2");
    obj.edit102:setFontSize(12);
    obj.edit102:setName("edit102");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout12);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart149 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart149:setParent(obj.flowLayout12);
    obj.flowPart149:setMinWidth(50);
    obj.flowPart149:setMaxWidth(50);
    obj.flowPart149:setHeight(15);
    obj.flowPart149:setName("flowPart149");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart149);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(10);
    obj.label26:setText("Natural");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.flowPart150 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart150:setParent(obj.flowLayout12);
    obj.flowPart150:setMinWidth(50);
    obj.flowPart150:setMaxWidth(50);
    obj.flowPart150:setHeight(20);
    obj.flowPart150:setName("flowPart150");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.flowPart150);
    obj.edit103:setAlign("client");
    obj.edit103:setField("naturalCae");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setFontSize(12);
    obj.edit103:setType("number");
    obj.edit103:setName("edit103");

    obj.flowPart151 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart151:setParent(obj.flowLayout12);
    obj.flowPart151:setMinWidth(50);
    obj.flowPart151:setMaxWidth(50);
    obj.flowPart151:setHeight(20);
    obj.flowPart151:setName("flowPart151");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.flowPart151);
    obj.edit104:setAlign("client");
    obj.edit104:setField("naturalCac");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setFontSize(12);
    obj.edit104:setType("number");
    obj.edit104:setName("edit104");

    obj.flowPart152 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart152:setParent(obj.flowLayout12);
    obj.flowPart152:setMinWidth(140);
    obj.flowPart152:setMaxWidth(150);
    obj.flowPart152:setHeight(20);
    obj.flowPart152:setName("flowPart152");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.flowPart152);
    obj.edit105:setAlign("client");
    obj.edit105:setField("naturalCa2");
    obj.edit105:setFontSize(12);
    obj.edit105:setName("edit105");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout12);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart153 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart153:setParent(obj.flowLayout12);
    obj.flowPart153:setMinWidth(50);
    obj.flowPart153:setMaxWidth(50);
    obj.flowPart153:setHeight(15);
    obj.flowPart153:setName("flowPart153");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart153);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(10);
    obj.label27:setText("Deflexao");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.flowPart154 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart154:setParent(obj.flowLayout12);
    obj.flowPart154:setMinWidth(50);
    obj.flowPart154:setMaxWidth(50);
    obj.flowPart154:setHeight(20);
    obj.flowPart154:setName("flowPart154");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.flowPart154);
    obj.edit106:setAlign("client");
    obj.edit106:setField("deflexaoCae");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setFontSize(12);
    obj.edit106:setType("number");
    obj.edit106:setName("edit106");

    obj.flowPart155 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart155:setParent(obj.flowLayout12);
    obj.flowPart155:setMinWidth(50);
    obj.flowPart155:setMaxWidth(50);
    obj.flowPart155:setHeight(20);
    obj.flowPart155:setName("flowPart155");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.flowPart155);
    obj.edit107:setAlign("client");
    obj.edit107:setField("deflexaoCac");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setFontSize(12);
    obj.edit107:setType("number");
    obj.edit107:setName("edit107");

    obj.flowPart156 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart156:setParent(obj.flowLayout12);
    obj.flowPart156:setMinWidth(140);
    obj.flowPart156:setMaxWidth(150);
    obj.flowPart156:setHeight(20);
    obj.flowPart156:setName("flowPart156");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.flowPart156);
    obj.edit108:setAlign("client");
    obj.edit108:setField("deflexaoCa2");
    obj.edit108:setFontSize(12);
    obj.edit108:setName("edit108");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout12);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flowPart157 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart157:setParent(obj.flowLayout12);
    obj.flowPart157:setMinWidth(50);
    obj.flowPart157:setMaxWidth(50);
    obj.flowPart157:setHeight(15);
    obj.flowPart157:setName("flowPart157");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart157);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(10);
    obj.label28:setText("Esquiva");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.flowPart158 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart158:setParent(obj.flowLayout12);
    obj.flowPart158:setMinWidth(50);
    obj.flowPart158:setMaxWidth(50);
    obj.flowPart158:setHeight(20);
    obj.flowPart158:setName("flowPart158");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.flowPart158);
    obj.edit109:setAlign("client");
    obj.edit109:setField("esquivaCae");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setFontSize(12);
    obj.edit109:setType("number");
    obj.edit109:setName("edit109");

    obj.flowPart159 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart159:setParent(obj.flowLayout12);
    obj.flowPart159:setMinWidth(50);
    obj.flowPart159:setMaxWidth(50);
    obj.flowPart159:setHeight(20);
    obj.flowPart159:setName("flowPart159");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.flowPart159);
    obj.edit110:setAlign("client");
    obj.edit110:setField("esquivaCac");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setFontSize(12);
    obj.edit110:setType("number");
    obj.edit110:setName("edit110");

    obj.flowPart160 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart160:setParent(obj.flowLayout12);
    obj.flowPart160:setMinWidth(140);
    obj.flowPart160:setMaxWidth(150);
    obj.flowPart160:setHeight(20);
    obj.flowPart160:setName("flowPart160");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.flowPart160);
    obj.edit111:setAlign("client");
    obj.edit111:setField("esquivaCa2");
    obj.edit111:setFontSize(12);
    obj.edit111:setName("edit111");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout12);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart161 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart161:setParent(obj.flowLayout12);
    obj.flowPart161:setMinWidth(50);
    obj.flowPart161:setMaxWidth(50);
    obj.flowPart161:setHeight(15);
    obj.flowPart161:setName("flowPart161");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart161);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Sorte");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.flowPart162 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart162:setParent(obj.flowLayout12);
    obj.flowPart162:setMinWidth(50);
    obj.flowPart162:setMaxWidth(50);
    obj.flowPart162:setHeight(20);
    obj.flowPart162:setName("flowPart162");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.flowPart162);
    obj.edit112:setAlign("client");
    obj.edit112:setField("sorteCae");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setFontSize(12);
    obj.edit112:setType("number");
    obj.edit112:setName("edit112");

    obj.flowPart163 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart163:setParent(obj.flowLayout12);
    obj.flowPart163:setMinWidth(50);
    obj.flowPart163:setMaxWidth(50);
    obj.flowPart163:setHeight(20);
    obj.flowPart163:setName("flowPart163");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.flowPart163);
    obj.edit113:setAlign("client");
    obj.edit113:setField("sorteCac");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setFontSize(12);
    obj.edit113:setType("number");
    obj.edit113:setName("edit113");

    obj.flowPart164 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart164:setParent(obj.flowLayout12);
    obj.flowPart164:setMinWidth(140);
    obj.flowPart164:setMaxWidth(150);
    obj.flowPart164:setHeight(20);
    obj.flowPart164:setName("flowPart164");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.flowPart164);
    obj.edit114:setAlign("client");
    obj.edit114:setField("sorteCa2");
    obj.edit114:setFontSize(12);
    obj.edit114:setName("edit114");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout12);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.flowPart165 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart165:setParent(obj.flowLayout12);
    obj.flowPart165:setMinWidth(50);
    obj.flowPart165:setMaxWidth(50);
    obj.flowPart165:setHeight(15);
    obj.flowPart165:setName("flowPart165");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart165);
    obj.label30:setAlign("top");
    obj.label30:setFontSize(10);
    obj.label30:setText("Outros");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWordWrap(true);
    obj.label30:setTextTrimming("none");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.flowPart166 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart166:setParent(obj.flowLayout12);
    obj.flowPart166:setMinWidth(50);
    obj.flowPart166:setMaxWidth(50);
    obj.flowPart166:setHeight(20);
    obj.flowPart166:setName("flowPart166");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.flowPart166);
    obj.edit115:setAlign("client");
    obj.edit115:setField("outrosCae");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setFontSize(12);
    obj.edit115:setType("number");
    obj.edit115:setName("edit115");

    obj.flowPart167 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart167:setParent(obj.flowLayout12);
    obj.flowPart167:setMinWidth(50);
    obj.flowPart167:setMaxWidth(50);
    obj.flowPart167:setHeight(20);
    obj.flowPart167:setName("flowPart167");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.flowPart167);
    obj.edit116:setAlign("client");
    obj.edit116:setField("outrosCac");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setFontSize(12);
    obj.edit116:setType("number");
    obj.edit116:setName("edit116");

    obj.flowPart168 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart168:setParent(obj.flowLayout12);
    obj.flowPart168:setMinWidth(140);
    obj.flowPart168:setMaxWidth(150);
    obj.flowPart168:setHeight(20);
    obj.flowPart168:setName("flowPart168");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.flowPart168);
    obj.edit117:setAlign("client");
    obj.edit117:setField("outrosCa2");
    obj.edit117:setFontSize(12);
    obj.edit117:setName("edit117");

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout12);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart169 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart169:setParent(obj.flowLayout12);
    obj.flowPart169:setMinWidth(50);
    obj.flowPart169:setMaxWidth(50);
    obj.flowPart169:setHeight(15);
    obj.flowPart169:setName("flowPart169");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart169);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(10);
    obj.label31:setText("Variados");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.flowPart170 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart170:setParent(obj.flowLayout12);
    obj.flowPart170:setMinWidth(50);
    obj.flowPart170:setMaxWidth(50);
    obj.flowPart170:setHeight(20);
    obj.flowPart170:setName("flowPart170");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.flowPart170);
    obj.edit118:setAlign("client");
    obj.edit118:setField("variadosCae");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setFontSize(12);
    obj.edit118:setType("number");
    obj.edit118:setName("edit118");

    obj.flowPart171 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart171:setParent(obj.flowLayout12);
    obj.flowPart171:setMinWidth(50);
    obj.flowPart171:setMaxWidth(50);
    obj.flowPart171:setHeight(20);
    obj.flowPart171:setName("flowPart171");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.flowPart171);
    obj.edit119:setAlign("client");
    obj.edit119:setField("variadosCac");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setFontSize(12);
    obj.edit119:setType("number");
    obj.edit119:setName("edit119");

    obj.flowPart172 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart172:setParent(obj.flowLayout12);
    obj.flowPart172:setMinWidth(140);
    obj.flowPart172:setMaxWidth(150);
    obj.flowPart172:setHeight(20);
    obj.flowPart172:setName("flowPart172");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.flowPart172);
    obj.edit120:setAlign("client");
    obj.edit120:setField("variadosCa2");
    obj.edit120:setFontSize(12);
    obj.edit120:setName("edit120");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout12);
    obj.flowLineBreak10:setName("flowLineBreak10");


		local function getMOD(valor)
			if valor~= nil then
				local mod = math.floor(((tonumber(valor) or 10) / 2) - 5);
				if (mod >= 0) then
					mod = "+" .. mod;
				end;					   
				return mod;
			else
				return "+0";
			end;
		end;
		


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(1107);
    obj.rectangle5:setHeight(110);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle5);
    obj.label32:setLeft(5);
    obj.label32:setTop(5);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setText("CLASSE");
    obj.label32:setName("label32");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.rectangle5);
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(60);
    obj.edit121:setTop(5);
    obj.edit121:setWidth(380);
    obj.edit121:setHeight(25);
    obj.edit121:setField("classe1");
    obj.edit121:setName("edit121");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle5);
    obj.label33:setLeft(5);
    obj.label33:setTop(30);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setText("RAÇA");
    obj.label33:setName("label33");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.rectangle5);
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(60);
    obj.edit122:setTop(30);
    obj.edit122:setWidth(380);
    obj.edit122:setHeight(25);
    obj.edit122:setField("raca");
    obj.edit122:setName("edit122");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle5);
    obj.label34:setLeft(5);
    obj.label34:setTop(55);
    obj.label34:setWidth(50);
    obj.label34:setHeight(25);
    obj.label34:setText("TIPO");
    obj.label34:setName("label34");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.rectangle5);
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(60);
    obj.edit123:setTop(55);
    obj.edit123:setWidth(380);
    obj.edit123:setHeight(25);
    obj.edit123:setField("tipo");
    obj.edit123:setName("edit123");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle5);
    obj.label35:setLeft(5);
    obj.label35:setTop(80);
    obj.label35:setWidth(70);
    obj.label35:setHeight(25);
    obj.label35:setText("TEMA");
    obj.label35:setName("label35");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.rectangle5);
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(60);
    obj.edit124:setTop(80);
    obj.edit124:setWidth(380);
    obj.edit124:setHeight(25);
    obj.edit124:setField("tema");
    obj.edit124:setName("edit124");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle5);
    obj.label36:setLeft(445);
    obj.label36:setTop(5);
    obj.label36:setWidth(50);
    obj.label36:setHeight(25);
    obj.label36:setText("NOME");
    obj.label36:setName("label36");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.rectangle5);
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(520);
    obj.edit125:setTop(5);
    obj.edit125:setWidth(290);
    obj.edit125:setHeight(25);
    obj.edit125:setField("nome");
    obj.edit125:setName("edit125");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle5);
    obj.label37:setLeft(445);
    obj.label37:setTop(30);
    obj.label37:setWidth(70);
    obj.label37:setHeight(25);
    obj.label37:setText("TENDÊNCIA");
    obj.label37:setFontSize(12);
    obj.label37:setName("label37");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.rectangle5);
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(520);
    obj.edit126:setTop(30);
    obj.edit126:setWidth(290);
    obj.edit126:setHeight(25);
    obj.edit126:setField("tendencia");
    obj.edit126:setName("edit126");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle5);
    obj.label38:setLeft(445);
    obj.label38:setTop(55);
    obj.label38:setWidth(70);
    obj.label38:setHeight(25);
    obj.label38:setText("RELIGIÂO");
    obj.label38:setName("label38");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.rectangle5);
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(520);
    obj.edit127:setTop(55);
    obj.edit127:setWidth(290);
    obj.edit127:setHeight(25);
    obj.edit127:setField("culto");
    obj.edit127:setName("edit127");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle5);
    obj.label39:setLeft(445);
    obj.label39:setTop(80);
    obj.label39:setWidth(70);
    obj.label39:setHeight(25);
    obj.label39:setText("TITULO");
    obj.label39:setName("label39");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.rectangle5);
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(520);
    obj.edit128:setTop(80);
    obj.edit128:setWidth(290);
    obj.edit128:setHeight(25);
    obj.edit128:setField("posto");
    obj.edit128:setName("edit128");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle5);
    obj.label40:setLeft(815);
    obj.label40:setTop(5);
    obj.label40:setWidth(70);
    obj.label40:setHeight(25);
    obj.label40:setText("NEP");
    obj.label40:setName("label40");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setLeft(890);
    obj.rectangle6:setTop(5);
    obj.rectangle6:setWidth(70);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle5);
    obj.label41:setField("nep");
    obj.label41:setLeft(890);
    obj.label41:setTop(5);
    obj.label41:setWidth(70);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle5);
    obj.label42:setLeft(815);
    obj.label42:setTop(30);
    obj.label42:setWidth(70);
    obj.label42:setHeight(25);
    obj.label42:setText("XP ATUAL");
    obj.label42:setName("label42");

    obj.xpAtualLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.xpAtualLabel:setParent(obj.rectangle5);
    obj.xpAtualLabel:setLeft(890);
    obj.xpAtualLabel:setTop(30);
    obj.xpAtualLabel:setWidth(210);
    obj.xpAtualLabel:setHeight(25);
    obj.xpAtualLabel:setColor("black");
    obj.xpAtualLabel:setStrokeColor("grey");
    obj.xpAtualLabel:setStrokeSize(1);
    obj.xpAtualLabel:setName("xpAtualLabel");
    obj.xpAtualLabel:setVisible(true);
    obj.xpAtualLabel:setOpacity(0.75);
    obj.xpAtualLabel:setCornerType("innerRound");
    obj.xpAtualLabel:setXradius(5);
    obj.xpAtualLabel:setYradius(5);

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.xpAtualLabel);
    obj.label43:setWidth(210);
    obj.label43:setHeight(25);
    obj.label43:setField("xpAtual");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setFontSize(11);
    lfm_setPropAsString(obj.label43, "formatFloat",  ",0.## XP");
    obj.label43:setName("label43");

    obj.xpAtualEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.xpAtualEdit:setParent(obj.rectangle5);
    obj.xpAtualEdit:setField("xpAtual");
    obj.xpAtualEdit:setLeft(890);
    obj.xpAtualEdit:setTop(30);
    obj.xpAtualEdit:setWidth(210);
    obj.xpAtualEdit:setHeight(25);
    obj.xpAtualEdit:setType("float");
    obj.xpAtualEdit:setFontSize(11);
    obj.xpAtualEdit:setName("xpAtualEdit");
    obj.xpAtualEdit:setVisible(false);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle5);
    obj.button1:setLeft(815);
    obj.button1:setTop(56);
    obj.button1:setWidth(50);
    obj.button1:setText("ADD");
    obj.button1:setName("button1");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.rectangle5);
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(890);
    obj.edit129:setTop(55);
    obj.edit129:setWidth(210);
    obj.edit129:setHeight(25);
    obj.edit129:setType("number");
    obj.edit129:setField("xpNova");
    obj.edit129:setName("edit129");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle5);
    obj.label44:setLeft(815);
    obj.label44:setTop(80);
    obj.label44:setWidth(70);
    obj.label44:setHeight(25);
    obj.label44:setText("XP ALVO");
    obj.label44:setName("label44");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle5);
    obj.rectangle7:setLeft(890);
    obj.rectangle7:setTop(80);
    obj.rectangle7:setWidth(100);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle5);
    obj.label45:setField("xpNivel");
    obj.label45:setLeft(890);
    obj.label45:setTop(80);
    obj.label45:setWidth(100);
    obj.label45:setHeight(25);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle5);
    obj.comboBox4:setField("xpVelocidade");
    obj.comboBox4:setLeft(1000);
    obj.comboBox4:setTop(80);
    obj.comboBox4:setWidth(100);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setItems({'Rapido', 'Medio', 'Lento', 'd20'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle5);
    obj.dataLink13:setFields({'xpAtual', 'xpVelocidade'});
    obj.dataLink13:setName("dataLink13");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.scrollBox1);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(115);
    obj.rectangle8:setWidth(235);
    obj.rectangle8:setHeight(215);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle8);
    obj.label46:setLeft(0);
    obj.label46:setTop(0);
    obj.label46:setWidth(235);
    obj.label46:setHeight(25);
    obj.label46:setText("ATRIBUTOS");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle8);
    obj.label47:setLeft(45);
    obj.label47:setTop(30);
    obj.label47:setWidth(70);
    obj.label47:setHeight(25);
    obj.label47:setText("Real");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle8);
    obj.label48:setLeft(120);
    obj.label48:setTop(30);
    obj.label48:setWidth(70);
    obj.label48:setHeight(25);
    obj.label48:setText("Efetivo");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle8);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(55);
    obj.layout1:setWidth(275);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setLeft(5);
    obj.button2:setWidth(35);
    obj.button2:setText("FOR");
    obj.button2:setFontSize(11);
    obj.button2:setName("button2");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout1);
    obj.rectangle9:setLeft(45);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(35);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout1);
    obj.label49:setLeft(45);
    obj.label49:setWidth(35);
    obj.label49:setHeight(25);
    obj.label49:setField("realFor");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout1);
    obj.rectangle10:setLeft(80);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(35);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout1);
    obj.label50:setField("realModFor");
    obj.label50:setText("0");
    obj.label50:setLeft(80);
    obj.label50:setTop(3);
    obj.label50:setWidth(35);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout1);
    obj.dataLink14:setField("realFor");
    obj.dataLink14:setName("dataLink14");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout1);
    obj.rectangle11:setLeft(120);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(35);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout1);
    obj.label51:setLeft(120);
    obj.label51:setWidth(35);
    obj.label51:setHeight(25);
    obj.label51:setField("efetFor");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout1);
    obj.rectangle12:setLeft(155);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(35);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout1);
    obj.label52:setField("efetModFor");
    obj.label52:setText("0");
    obj.label52:setLeft(155);
    obj.label52:setTop(3);
    obj.label52:setWidth(35);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout1);
    obj.dataLink15:setField("efetFor");
    obj.dataLink15:setName("dataLink15");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle8);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(80);
    obj.layout2:setWidth(275);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(5);
    obj.button3:setWidth(35);
    obj.button3:setText("DES");
    obj.button3:setFontSize(11);
    obj.button3:setName("button3");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout2);
    obj.rectangle13:setLeft(45);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(35);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout2);
    obj.label53:setLeft(45);
    obj.label53:setWidth(35);
    obj.label53:setHeight(25);
    obj.label53:setField("realDes");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout2);
    obj.rectangle14:setLeft(80);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(35);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout2);
    obj.label54:setField("realModDes");
    obj.label54:setText("0");
    obj.label54:setLeft(80);
    obj.label54:setTop(3);
    obj.label54:setWidth(35);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout2);
    obj.dataLink16:setField("realDes");
    obj.dataLink16:setName("dataLink16");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout2);
    obj.rectangle15:setLeft(120);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(35);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout2);
    obj.label55:setLeft(120);
    obj.label55:setWidth(35);
    obj.label55:setHeight(25);
    obj.label55:setField("efetDes");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout2);
    obj.rectangle16:setLeft(155);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(35);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout2);
    obj.label56:setField("efetModDes");
    obj.label56:setText("0");
    obj.label56:setLeft(155);
    obj.label56:setTop(3);
    obj.label56:setWidth(35);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout2);
    obj.dataLink17:setField("efetDes");
    obj.dataLink17:setName("dataLink17");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle8);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(105);
    obj.layout3:setWidth(275);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout3);
    obj.button4:setLeft(5);
    obj.button4:setWidth(35);
    obj.button4:setText("CON");
    obj.button4:setFontSize(11);
    obj.button4:setName("button4");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout3);
    obj.rectangle17:setLeft(45);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(35);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout3);
    obj.label57:setLeft(45);
    obj.label57:setWidth(35);
    obj.label57:setHeight(25);
    obj.label57:setField("realCon");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout3);
    obj.rectangle18:setLeft(80);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(35);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout3);
    obj.label58:setField("realModCon");
    obj.label58:setText("0");
    obj.label58:setLeft(80);
    obj.label58:setTop(3);
    obj.label58:setWidth(35);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout3);
    obj.dataLink18:setField("realCon");
    obj.dataLink18:setName("dataLink18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout3);
    obj.rectangle19:setLeft(120);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(35);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout3);
    obj.label59:setLeft(120);
    obj.label59:setWidth(35);
    obj.label59:setHeight(25);
    obj.label59:setField("efetCon");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout3);
    obj.rectangle20:setLeft(155);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(35);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout3);
    obj.label60:setField("efetModCon");
    obj.label60:setText("0");
    obj.label60:setLeft(155);
    obj.label60:setTop(3);
    obj.label60:setWidth(35);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout3);
    obj.dataLink19:setField("efetCon");
    obj.dataLink19:setName("dataLink19");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle8);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(130);
    obj.layout4:setWidth(275);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout4);
    obj.button5:setLeft(5);
    obj.button5:setWidth(35);
    obj.button5:setText("INT");
    obj.button5:setFontSize(11);
    obj.button5:setName("button5");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout4);
    obj.rectangle21:setLeft(45);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(35);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout4);
    obj.label61:setLeft(45);
    obj.label61:setWidth(35);
    obj.label61:setHeight(25);
    obj.label61:setField("realInt");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout4);
    obj.rectangle22:setLeft(80);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(35);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout4);
    obj.label62:setField("realModInt");
    obj.label62:setText("0");
    obj.label62:setLeft(80);
    obj.label62:setTop(3);
    obj.label62:setWidth(35);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout4);
    obj.dataLink20:setField("realInt");
    obj.dataLink20:setName("dataLink20");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout4);
    obj.rectangle23:setLeft(120);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(35);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout4);
    obj.label63:setLeft(120);
    obj.label63:setWidth(35);
    obj.label63:setHeight(25);
    obj.label63:setField("efetInt");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout4);
    obj.rectangle24:setLeft(155);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(35);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout4);
    obj.label64:setField("efetModInt");
    obj.label64:setText("0");
    obj.label64:setLeft(155);
    obj.label64:setTop(3);
    obj.label64:setWidth(35);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout4);
    obj.dataLink21:setField("efetInt");
    obj.dataLink21:setName("dataLink21");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle8);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(155);
    obj.layout5:setWidth(275);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout5);
    obj.button6:setLeft(5);
    obj.button6:setWidth(35);
    obj.button6:setText("SAB");
    obj.button6:setFontSize(11);
    obj.button6:setName("button6");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout5);
    obj.rectangle25:setLeft(45);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(35);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout5);
    obj.label65:setLeft(45);
    obj.label65:setWidth(35);
    obj.label65:setHeight(25);
    obj.label65:setField("realSab");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout5);
    obj.rectangle26:setLeft(80);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(35);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout5);
    obj.label66:setField("realModSab");
    obj.label66:setText("0");
    obj.label66:setLeft(80);
    obj.label66:setTop(3);
    obj.label66:setWidth(35);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout5);
    obj.dataLink22:setField("realSab");
    obj.dataLink22:setName("dataLink22");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout5);
    obj.rectangle27:setLeft(120);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(35);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout5);
    obj.label67:setLeft(120);
    obj.label67:setWidth(35);
    obj.label67:setHeight(25);
    obj.label67:setField("efetSab");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout5);
    obj.rectangle28:setLeft(155);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(35);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout5);
    obj.label68:setField("efetModSab");
    obj.label68:setText("0");
    obj.label68:setLeft(155);
    obj.label68:setTop(3);
    obj.label68:setWidth(35);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout5);
    obj.dataLink23:setField("efetSab");
    obj.dataLink23:setName("dataLink23");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle8);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(180);
    obj.layout6:setWidth(275);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout6);
    obj.button7:setLeft(5);
    obj.button7:setWidth(35);
    obj.button7:setText("CAR");
    obj.button7:setFontSize(11);
    obj.button7:setName("button7");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout6);
    obj.rectangle29:setLeft(45);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(35);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout6);
    obj.label69:setLeft(45);
    obj.label69:setWidth(35);
    obj.label69:setHeight(25);
    obj.label69:setField("realCar");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout6);
    obj.rectangle30:setLeft(80);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(35);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout6);
    obj.label70:setField("realModCar");
    obj.label70:setText("0");
    obj.label70:setLeft(80);
    obj.label70:setTop(3);
    obj.label70:setWidth(35);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout6);
    obj.dataLink24:setField("realCar");
    obj.dataLink24:setName("dataLink24");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout6);
    obj.rectangle31:setLeft(120);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(35);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout6);
    obj.label71:setLeft(120);
    obj.label71:setWidth(35);
    obj.label71:setHeight(25);
    obj.label71:setField("efetCar");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout6);
    obj.rectangle32:setLeft(155);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(35);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout6);
    obj.label72:setField("efetModCar");
    obj.label72:setText("0");
    obj.label72:setLeft(155);
    obj.label72:setTop(3);
    obj.label72:setWidth(35);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout6);
    obj.dataLink25:setField("efetCar");
    obj.dataLink25:setName("dataLink25");

    obj.AtrBut = GUI.fromHandle(_obj_newObject("button"));
    obj.AtrBut:setParent(obj.rectangle8);
    obj.AtrBut:setLeft(200);
    obj.AtrBut:setTop(55);
    obj.AtrBut:setWidth(30);
    obj.AtrBut:setHeight(150);
    obj.AtrBut:setName("AtrBut");
    obj.AtrBut:setText(">>");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(240);
    obj.layout7:setTop(115);
    obj.layout7:setWidth(235);
    obj.layout7:setHeight(215);
    obj.layout7:setName("layout7");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout7);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout7);
    obj.label73:setLeft(5);
    obj.label73:setTop(1);
    obj.label73:setWidth(225);
    obj.label73:setHeight(20);
    obj.label73:setText("DESLOCAMENTOS");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout7);
    obj.label74:setLeft(75);
    obj.label74:setTop(30);
    obj.label74:setWidth(70);
    obj.label74:setHeight(25);
    obj.label74:setText("Metros");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout7);
    obj.label75:setLeft(155);
    obj.label75:setTop(30);
    obj.label75:setWidth(70);
    obj.label75:setHeight(25);
    obj.label75:setText("Quadrados");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(55);
    obj.layout8:setWidth(225);
    obj.layout8:setHeight(20);
    obj.layout8:setName("layout8");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout8);
    obj.label76:setLeft(5);
    obj.label76:setTop(0);
    obj.label76:setWidth(70);
    obj.label76:setHeight(20);
    obj.label76:setText("TERRESTRE");
    obj.label76:setName("label76");

    obj.deslTerrestreLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.deslTerrestreLabel:setParent(obj.layout8);
    obj.deslTerrestreLabel:setLeft(75);
    obj.deslTerrestreLabel:setTop(0);
    obj.deslTerrestreLabel:setWidth(70);
    obj.deslTerrestreLabel:setHeight(20);
    obj.deslTerrestreLabel:setColor("black");
    obj.deslTerrestreLabel:setStrokeColor("grey");
    obj.deslTerrestreLabel:setStrokeSize(1);
    obj.deslTerrestreLabel:setName("deslTerrestreLabel");
    obj.deslTerrestreLabel:setVisible(true);
    obj.deslTerrestreLabel:setOpacity(0.75);
    obj.deslTerrestreLabel:setCornerType("innerRound");
    obj.deslTerrestreLabel:setXradius(5);
    obj.deslTerrestreLabel:setYradius(5);

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.deslTerrestreLabel);
    obj.label77:setWidth(70);
    obj.label77:setHeight(20);
    obj.label77:setField("deslTerrestre");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setFontSize(11);
    lfm_setPropAsString(obj.label77, "formatFloat",  ",0.## m");
    obj.label77:setName("label77");

    obj.deslTerrestreEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.deslTerrestreEdit:setParent(obj.layout8);
    obj.deslTerrestreEdit:setField("deslTerrestre");
    obj.deslTerrestreEdit:setLeft(75);
    obj.deslTerrestreEdit:setTop(0);
    obj.deslTerrestreEdit:setWidth(70);
    obj.deslTerrestreEdit:setHeight(20);
    obj.deslTerrestreEdit:setType("float");
    obj.deslTerrestreEdit:setFontSize(11);
    obj.deslTerrestreEdit:setName("deslTerrestreEdit");
    obj.deslTerrestreEdit:setVisible(false);

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout8);
    obj.rectangle34:setLeft(155);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(60);
    obj.rectangle34:setHeight(20);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout8);
    obj.label78:setLeft(155);
    obj.label78:setTop(0);
    obj.label78:setWidth(60);
    obj.label78:setHeight(20);
    obj.label78:setField("deslTerrestreQuadrados");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout8);
    obj.dataLink26:setField("deslTerrestre");
    obj.dataLink26:setName("dataLink26");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(80);
    obj.layout9:setWidth(225);
    obj.layout9:setHeight(20);
    obj.layout9:setName("layout9");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout9);
    obj.label79:setLeft(5);
    obj.label79:setTop(0);
    obj.label79:setWidth(70);
    obj.label79:setHeight(20);
    obj.label79:setText("VOO");
    obj.label79:setName("label79");

    obj.deslVooLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.deslVooLabel:setParent(obj.layout9);
    obj.deslVooLabel:setLeft(75);
    obj.deslVooLabel:setTop(0);
    obj.deslVooLabel:setWidth(70);
    obj.deslVooLabel:setHeight(20);
    obj.deslVooLabel:setColor("black");
    obj.deslVooLabel:setStrokeColor("grey");
    obj.deslVooLabel:setStrokeSize(1);
    obj.deslVooLabel:setName("deslVooLabel");
    obj.deslVooLabel:setVisible(true);
    obj.deslVooLabel:setOpacity(0.75);
    obj.deslVooLabel:setCornerType("innerRound");
    obj.deslVooLabel:setXradius(5);
    obj.deslVooLabel:setYradius(5);

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.deslVooLabel);
    obj.label80:setWidth(70);
    obj.label80:setHeight(20);
    obj.label80:setField("deslVoo");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setFontSize(11);
    lfm_setPropAsString(obj.label80, "formatFloat",  ",0.## m");
    obj.label80:setName("label80");

    obj.deslVooEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.deslVooEdit:setParent(obj.layout9);
    obj.deslVooEdit:setField("deslVoo");
    obj.deslVooEdit:setLeft(75);
    obj.deslVooEdit:setTop(0);
    obj.deslVooEdit:setWidth(70);
    obj.deslVooEdit:setHeight(20);
    obj.deslVooEdit:setType("float");
    obj.deslVooEdit:setFontSize(11);
    obj.deslVooEdit:setName("deslVooEdit");
    obj.deslVooEdit:setVisible(false);

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout9);
    obj.rectangle35:setLeft(155);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(60);
    obj.rectangle35:setHeight(20);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout9);
    obj.label81:setLeft(155);
    obj.label81:setTop(0);
    obj.label81:setWidth(60);
    obj.label81:setHeight(20);
    obj.label81:setField("deslVooQuadrados");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout9);
    obj.dataLink27:setField("deslVoo");
    obj.dataLink27:setName("dataLink27");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout7);
    obj.label82:setLeft(50);
    obj.label82:setTop(105);
    obj.label82:setWidth(60);
    obj.label82:setHeight(20);
    obj.label82:setText("Manobra");
    obj.label82:setFontSize(11);
    obj.label82:setName("label82");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout7);
    obj.comboBox5:setLeft(95);
    obj.comboBox5:setTop(105);
    obj.comboBox5:setWidth(100);
    obj.comboBox5:setField("qualidadeVoo");
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setItems({' ', 'Desajeitado', 'Ruim', 'Média', 'Boa', 'Perfeita'});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setName("comboBox5");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(130);
    obj.layout10:setWidth(225);
    obj.layout10:setHeight(20);
    obj.layout10:setName("layout10");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout10);
    obj.label83:setLeft(5);
    obj.label83:setTop(0);
    obj.label83:setWidth(70);
    obj.label83:setHeight(20);
    obj.label83:setText("NATAÇÃO");
    obj.label83:setName("label83");

    obj.deslNatacaoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.deslNatacaoLabel:setParent(obj.layout10);
    obj.deslNatacaoLabel:setLeft(75);
    obj.deslNatacaoLabel:setTop(0);
    obj.deslNatacaoLabel:setWidth(70);
    obj.deslNatacaoLabel:setHeight(20);
    obj.deslNatacaoLabel:setColor("black");
    obj.deslNatacaoLabel:setStrokeColor("grey");
    obj.deslNatacaoLabel:setStrokeSize(1);
    obj.deslNatacaoLabel:setName("deslNatacaoLabel");
    obj.deslNatacaoLabel:setVisible(true);
    obj.deslNatacaoLabel:setOpacity(0.75);
    obj.deslNatacaoLabel:setCornerType("innerRound");
    obj.deslNatacaoLabel:setXradius(5);
    obj.deslNatacaoLabel:setYradius(5);

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.deslNatacaoLabel);
    obj.label84:setWidth(70);
    obj.label84:setHeight(20);
    obj.label84:setField("deslNatacao");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setFontSize(11);
    lfm_setPropAsString(obj.label84, "formatFloat",  ",0.## m");
    obj.label84:setName("label84");

    obj.deslNatacaoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.deslNatacaoEdit:setParent(obj.layout10);
    obj.deslNatacaoEdit:setField("deslNatacao");
    obj.deslNatacaoEdit:setLeft(75);
    obj.deslNatacaoEdit:setTop(0);
    obj.deslNatacaoEdit:setWidth(70);
    obj.deslNatacaoEdit:setHeight(20);
    obj.deslNatacaoEdit:setType("float");
    obj.deslNatacaoEdit:setFontSize(11);
    obj.deslNatacaoEdit:setName("deslNatacaoEdit");
    obj.deslNatacaoEdit:setVisible(false);

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout10);
    obj.rectangle36:setLeft(155);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(60);
    obj.rectangle36:setHeight(20);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout10);
    obj.label85:setLeft(155);
    obj.label85:setTop(0);
    obj.label85:setWidth(60);
    obj.label85:setHeight(20);
    obj.label85:setField("deslNatacaoQuadrados");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout10);
    obj.dataLink28:setField("deslNatacao");
    obj.dataLink28:setName("dataLink28");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout7);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(155);
    obj.layout11:setWidth(225);
    obj.layout11:setHeight(20);
    obj.layout11:setName("layout11");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout11);
    obj.label86:setLeft(5);
    obj.label86:setTop(0);
    obj.label86:setWidth(70);
    obj.label86:setHeight(20);
    obj.label86:setText("ESCALAR");
    obj.label86:setName("label86");

    obj.deslEscalarLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.deslEscalarLabel:setParent(obj.layout11);
    obj.deslEscalarLabel:setLeft(75);
    obj.deslEscalarLabel:setTop(0);
    obj.deslEscalarLabel:setWidth(70);
    obj.deslEscalarLabel:setHeight(20);
    obj.deslEscalarLabel:setColor("black");
    obj.deslEscalarLabel:setStrokeColor("grey");
    obj.deslEscalarLabel:setStrokeSize(1);
    obj.deslEscalarLabel:setName("deslEscalarLabel");
    obj.deslEscalarLabel:setVisible(true);
    obj.deslEscalarLabel:setOpacity(0.75);
    obj.deslEscalarLabel:setCornerType("innerRound");
    obj.deslEscalarLabel:setXradius(5);
    obj.deslEscalarLabel:setYradius(5);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.deslEscalarLabel);
    obj.label87:setWidth(70);
    obj.label87:setHeight(20);
    obj.label87:setField("deslEscalar");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setFontSize(11);
    lfm_setPropAsString(obj.label87, "formatFloat",  ",0.## m");
    obj.label87:setName("label87");

    obj.deslEscalarEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.deslEscalarEdit:setParent(obj.layout11);
    obj.deslEscalarEdit:setField("deslEscalar");
    obj.deslEscalarEdit:setLeft(75);
    obj.deslEscalarEdit:setTop(0);
    obj.deslEscalarEdit:setWidth(70);
    obj.deslEscalarEdit:setHeight(20);
    obj.deslEscalarEdit:setType("float");
    obj.deslEscalarEdit:setFontSize(11);
    obj.deslEscalarEdit:setName("deslEscalarEdit");
    obj.deslEscalarEdit:setVisible(false);

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout11);
    obj.rectangle37:setLeft(155);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(60);
    obj.rectangle37:setHeight(20);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout11);
    obj.label88:setLeft(155);
    obj.label88:setTop(0);
    obj.label88:setWidth(60);
    obj.label88:setHeight(20);
    obj.label88:setField("deslEscalarQuadrados");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout11);
    obj.dataLink29:setField("deslEscalar");
    obj.dataLink29:setName("dataLink29");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout7);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(180);
    obj.layout12:setWidth(225);
    obj.layout12:setHeight(20);
    obj.layout12:setName("layout12");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout12);
    obj.label89:setLeft(5);
    obj.label89:setTop(0);
    obj.label89:setWidth(70);
    obj.label89:setHeight(20);
    obj.label89:setText("ESCAVAR");
    obj.label89:setName("label89");

    obj.deslEscavarLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.deslEscavarLabel:setParent(obj.layout12);
    obj.deslEscavarLabel:setLeft(75);
    obj.deslEscavarLabel:setTop(0);
    obj.deslEscavarLabel:setWidth(70);
    obj.deslEscavarLabel:setHeight(20);
    obj.deslEscavarLabel:setColor("black");
    obj.deslEscavarLabel:setStrokeColor("grey");
    obj.deslEscavarLabel:setStrokeSize(1);
    obj.deslEscavarLabel:setName("deslEscavarLabel");
    obj.deslEscavarLabel:setVisible(true);
    obj.deslEscavarLabel:setOpacity(0.75);
    obj.deslEscavarLabel:setCornerType("innerRound");
    obj.deslEscavarLabel:setXradius(5);
    obj.deslEscavarLabel:setYradius(5);

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.deslEscavarLabel);
    obj.label90:setWidth(70);
    obj.label90:setHeight(20);
    obj.label90:setField("deslEscavar");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setFontSize(11);
    lfm_setPropAsString(obj.label90, "formatFloat",  ",0.## m");
    obj.label90:setName("label90");

    obj.deslEscavarEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.deslEscavarEdit:setParent(obj.layout12);
    obj.deslEscavarEdit:setField("deslEscavar");
    obj.deslEscavarEdit:setLeft(75);
    obj.deslEscavarEdit:setTop(0);
    obj.deslEscavarEdit:setWidth(70);
    obj.deslEscavarEdit:setHeight(20);
    obj.deslEscavarEdit:setType("float");
    obj.deslEscavarEdit:setFontSize(11);
    obj.deslEscavarEdit:setName("deslEscavarEdit");
    obj.deslEscavarEdit:setVisible(false);

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout12);
    obj.rectangle38:setLeft(155);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(60);
    obj.rectangle38:setHeight(20);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout12);
    obj.label91:setLeft(155);
    obj.label91:setTop(0);
    obj.label91:setWidth(60);
    obj.label91:setHeight(20);
    obj.label91:setField("deslEscavarQuadrados");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout12);
    obj.dataLink30:setField("deslEscavar");
    obj.dataLink30:setName("dataLink30");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13:setLeft(480);
    obj.layout13:setTop(115);
    obj.layout13:setWidth(260);
    obj.layout13:setHeight(55);
    obj.layout13:setName("layout13");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout13);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("black");
    obj.rectangle39:setName("rectangle39");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout13);
    obj.label92:setLeft(0);
    obj.label92:setTop(1);
    obj.label92:setWidth(260);
    obj.label92:setHeight(20);
    obj.label92:setText("INICIATIVA");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout13);
    obj.button8:setLeft(35);
    obj.button8:setTop(25);
    obj.button8:setWidth(75);
    obj.button8:setHeight(25);
    obj.button8:setText("INICIATIVA");
    obj.button8:setFontSize(11);
    obj.button8:setName("button8");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout13);
    obj.rectangle40:setLeft(115);
    obj.rectangle40:setTop(25);
    obj.rectangle40:setWidth(35);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout13);
    obj.label93:setField("iniciativa");
    obj.label93:setLeft(115);
    obj.label93:setTop(27);
    obj.label93:setWidth(35);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout13);
    obj.rectangle41:setLeft(165);
    obj.rectangle41:setTop(25);
    obj.rectangle41:setWidth(35);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout13);
    obj.label94:setField("efetModDes");
    obj.label94:setLeft(165);
    obj.label94:setTop(27);
    obj.label94:setWidth(35);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout13);
    obj.edit130:setType("number");
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setLeft(205);
    obj.edit130:setTop(25);
    obj.edit130:setWidth(35);
    obj.edit130:setHeight(25);
    obj.edit130:setField("iniVariado");
    obj.edit130:setName("edit130");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout13);
    obj.dataLink31:setFields({'efetModDes', 'iniVariado'});
    obj.dataLink31:setName("dataLink31");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.scrollBox1);
    obj.rectangle42:setLeft(480);
    obj.rectangle42:setTop(175);
    obj.rectangle42:setWidth(260);
    obj.rectangle42:setHeight(155);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle42);
    obj.label95:setLeft(0);
    obj.label95:setTop(1);
    obj.label95:setWidth(260);
    obj.label95:setHeight(20);
    obj.label95:setText("CLASSE DE ARMADURA");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle42);
    obj.layout14:setLeft(20);
    obj.layout14:setTop(25);
    obj.layout14:setWidth(220);
    obj.layout14:setHeight(50);
    obj.layout14:setName("layout14");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout14);
    obj.label96:setLeft(10);
    obj.label96:setTop(0);
    obj.label96:setWidth(35);
    obj.label96:setHeight(20);
    obj.label96:setText("CAE");
    obj.label96:setName("label96");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout14);
    obj.rectangle43:setLeft(5);
    obj.rectangle43:setTop(25);
    obj.rectangle43:setWidth(35);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout14);
    obj.label97:setLeft(5);
    obj.label97:setTop(27);
    obj.label97:setWidth(35);
    obj.label97:setField("cae");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout14);
    obj.label98:setLeft(45);
    obj.label98:setTop(0);
    obj.label98:setWidth(40);
    obj.label98:setHeight(20);
    obj.label98:setText("CAC");
    obj.label98:setName("label98");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout14);
    obj.rectangle44:setLeft(45);
    obj.rectangle44:setTop(25);
    obj.rectangle44:setWidth(35);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout14);
    obj.label99:setLeft(45);
    obj.label99:setTop(27);
    obj.label99:setWidth(35);
    obj.label99:setField("cac");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout14);
    obj.label100:setLeft(85);
    obj.label100:setTop(0);
    obj.label100:setWidth(45);
    obj.label100:setHeight(20);
    obj.label100:setText("CA MC");
    obj.label100:setName("label100");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout14);
    obj.rectangle45:setLeft(90);
    obj.rectangle45:setTop(25);
    obj.rectangle45:setWidth(35);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout14);
    obj.label101:setLeft(90);
    obj.label101:setTop(27);
    obj.label101:setWidth(35);
    obj.label101:setField("camc");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout14);
    obj.label102:setLeft(135);
    obj.label102:setTop(0);
    obj.label102:setWidth(35);
    obj.label102:setHeight(20);
    obj.label102:setText("PEN");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout14);
    obj.rectangle46:setLeft(135);
    obj.rectangle46:setTop(25);
    obj.rectangle46:setWidth(35);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout14);
    obj.label103:setLeft(135);
    obj.label103:setTop(27);
    obj.label103:setWidth(35);
    obj.label103:setField("equipamentoCorpoPen");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout14);
    obj.label104:setLeft(185);
    obj.label104:setTop(0);
    obj.label104:setWidth(35);
    obj.label104:setHeight(20);
    obj.label104:setText("RM");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout14);
    obj.edit131:setLeft(185);
    obj.edit131:setTop(27);
    obj.edit131:setWidth(35);
    obj.edit131:setField("rm");
    obj.edit131:setName("edit131");

    obj.caDetails = GUI.fromHandle(_obj_newObject("button"));
    obj.caDetails:setParent(obj.rectangle42);
    obj.caDetails:setLeft(30);
    obj.caDetails:setTop(80);
    obj.caDetails:setWidth(200);
    obj.caDetails:setHeight(20);
    obj.caDetails:setFontSize(10);
    obj.caDetails:setText("+");
    obj.caDetails:setName("caDetails");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.rectangle42);
    obj.dataLink32:setFields({'armaduraCac', 'efetModDes', 'tamanhoCac', 'naturalCac', 'deflexaoCac', 'esquivaCac', 'sorteCac', 'outrosCac', 'variadosCac','destrezaCALimit'});
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.rectangle42);
    obj.dataLink33:setFields({'armaduraCae', 'efetModDes', 'tamanhoCae', 'naturalCae', 'deflexaoCae', 'esquivaCae', 'sorteCae', 'outrosCae', 'variadosCae','destrezaCALimit'});
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.rectangle42);
    obj.dataLink34:setFields({'equipamentoCorpoPen'});
    obj.dataLink34:setName("dataLink34");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.scrollBox1);
    obj.rectangle47:setLeft(0);
    obj.rectangle47:setTop(335);
    obj.rectangle47:setWidth(220);
    obj.rectangle47:setHeight(165);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setName("rectangle47");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.rectangle47);
    obj.label105:setLeft(5);
    obj.label105:setTop(1);
    obj.label105:setWidth(220);
    obj.label105:setHeight(20);
    obj.label105:setText("SAÚDE E DETERMINAÇÃO");
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.rectangle47);
    obj.label106:setLeft(5);
    obj.label106:setTop(25);
    obj.label106:setWidth(70);
    obj.label106:setHeight(20);
    obj.label106:setText("VIDA");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.rectangle47);
    obj.edit132:setType("number");
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setLeft(5);
    obj.edit132:setTop(45);
    obj.edit132:setWidth(70);
    obj.edit132:setHeight(25);
    obj.edit132:setField("pv");
    obj.edit132:setName("edit132");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle47);
    obj.label107:setLeft(75);
    obj.label107:setTop(25);
    obj.label107:setWidth(70);
    obj.label107:setHeight(20);
    obj.label107:setText("ESTAMINA");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.rectangle47);
    obj.edit133:setType("number");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setLeft(75);
    obj.edit133:setTop(45);
    obj.edit133:setWidth(70);
    obj.edit133:setHeight(25);
    obj.edit133:setField("pe");
    obj.edit133:setName("edit133");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.rectangle47);
    obj.label108:setLeft(145);
    obj.label108:setTop(25);
    obj.label108:setWidth(70);
    obj.label108:setHeight(20);
    obj.label108:setText("DETERMINAÇÃO");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setFontSize(9);
    obj.label108:setName("label108");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.rectangle47);
    obj.edit134:setType("number");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setLeft(145);
    obj.edit134:setTop(45);
    obj.edit134:setWidth(70);
    obj.edit134:setHeight(25);
    obj.edit134:setField("pd");
    obj.edit134:setName("edit134");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle47);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(70);
    obj.textEditor2:setWidth(210);
    obj.textEditor2:setHeight(90);
    obj.textEditor2:setField("rd");
    obj.textEditor2:setName("textEditor2");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox1);
    obj.layout15:setLeft(225);
    obj.layout15:setTop(335);
    obj.layout15:setWidth(142);
    obj.layout15:setHeight(165);
    obj.layout15:setName("layout15");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout15);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setName("rectangle48");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout15);
    obj.label109:setLeft(5);
    obj.label109:setTop(0);
    obj.label109:setWidth(321);
    obj.label109:setHeight(20);
    obj.label109:setText("BÔNUS TEMPORARIOS");
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout15);
    obj.label110:setLeft(5);
    obj.label110:setTop(30);
    obj.label110:setWidth(50);
    obj.label110:setHeight(20);
    obj.label110:setText("ATAQUE");
    obj.label110:setFontSize(12);
    obj.label110:setName("label110");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout15);
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(60);
    obj.edit135:setTop(30);
    obj.edit135:setWidth(70);
    obj.edit135:setHeight(25);
    obj.edit135:setField("buffAtaque");
    obj.edit135:setName("edit135");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout15);
    obj.label111:setLeft(5);
    obj.label111:setTop(55);
    obj.label111:setWidth(50);
    obj.label111:setHeight(20);
    obj.label111:setText("DANO");
    obj.label111:setFontSize(12);
    obj.label111:setName("label111");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout15);
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(60);
    obj.edit136:setTop(55);
    obj.edit136:setWidth(70);
    obj.edit136:setHeight(25);
    obj.edit136:setField("buffDano");
    obj.edit136:setName("edit136");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout15);
    obj.label112:setLeft(5);
    obj.label112:setTop(80);
    obj.label112:setWidth(50);
    obj.label112:setHeight(20);
    obj.label112:setText("CRITICO");
    obj.label112:setFontSize(12);
    obj.label112:setName("label112");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout15);
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(60);
    obj.edit137:setTop(80);
    obj.edit137:setWidth(70);
    obj.edit137:setHeight(25);
    obj.edit137:setField("buffDanoCritico");
    obj.edit137:setName("edit137");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout15);
    obj.label113:setLeft(5);
    obj.label113:setTop(105);
    obj.label113:setWidth(50);
    obj.label113:setHeight(20);
    obj.label113:setText("TR");
    obj.label113:setFontSize(12);
    obj.label113:setName("label113");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout15);
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(60);
    obj.edit138:setTop(105);
    obj.edit138:setWidth(70);
    obj.edit138:setHeight(25);
    obj.edit138:setField("buffTR");
    obj.edit138:setName("edit138");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout15);
    obj.label114:setLeft(5);
    obj.label114:setTop(130);
    obj.label114:setWidth(50);
    obj.label114:setHeight(20);
    obj.label114:setText("PERICIA");
    obj.label114:setFontSize(12);
    obj.label114:setName("label114");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout15);
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(60);
    obj.edit139:setTop(130);
    obj.edit139:setWidth(70);
    obj.edit139:setHeight(25);
    obj.edit139:setField("buffPericia");
    obj.edit139:setName("edit139");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox1);
    obj.layout16:setLeft(372);
    obj.layout16:setTop(335);
    obj.layout16:setWidth(170);
    obj.layout16:setHeight(165);
    obj.layout16:setName("layout16");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout16);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setName("rectangle49");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout16);
    obj.label115:setLeft(5);
    obj.label115:setTop(0);
    obj.label115:setWidth(321);
    obj.label115:setHeight(20);
    obj.label115:setText("NOTAS");
    obj.label115:setName("label115");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout16);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setField("notas");
    obj.textEditor3:setWidth(160);
    obj.textEditor3:setTop(30);
    obj.textEditor3:setHeight(130);
    obj.textEditor3:setName("textEditor3");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox1);
    obj.layout17:setLeft(552);
    obj.layout17:setTop(335);
    obj.layout17:setWidth(188);
    obj.layout17:setHeight(142);
    obj.layout17:setName("layout17");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout17);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setName("rectangle50");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle50);
    obj.label116:setLeft(0);
    obj.label116:setTop(0);
    obj.label116:setWidth(140);
    obj.label116:setHeight(25);
    obj.label116:setText("RESISTENCIAS");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle50);
    obj.layout18:setLeft(0);
    obj.layout18:setTop(30);
    obj.layout18:setWidth(275);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout18);
    obj.button9:setLeft(5);
    obj.button9:setWidth(45);
    obj.button9:setText("FORT");
    obj.button9:setFontSize(11);
    obj.button9:setName("button9");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout18);
    obj.rectangle51:setLeft(55);
    obj.rectangle51:setTop(0);
    obj.rectangle51:setWidth(40);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout18);
    obj.label117:setLeft(55);
    obj.label117:setWidth(40);
    obj.label117:setHeight(25);
    obj.label117:setField("trFort");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout18);
    obj.dataLink35:setFields({'baseFort', 'atrModFort', 'magiaFort', 'variavelFort', 'temporarioFort', 'outrosFort','buffTR'});
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout18);
    obj.dataLink36:setField("atrTrFort");
    obj.dataLink36:setDefaultValue("3");
    obj.dataLink36:setName("dataLink36");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle50);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(55);
    obj.layout19:setWidth(275);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout19);
    obj.button10:setLeft(5);
    obj.button10:setWidth(45);
    obj.button10:setText("REF");
    obj.button10:setFontSize(11);
    obj.button10:setName("button10");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout19);
    obj.rectangle52:setLeft(55);
    obj.rectangle52:setTop(0);
    obj.rectangle52:setWidth(40);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout19);
    obj.label118:setLeft(55);
    obj.label118:setWidth(40);
    obj.label118:setHeight(25);
    obj.label118:setField("trRef");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout19);
    obj.dataLink37:setFields({'baseRef', 'atrModRef', 'magiaRef', 'variavelRef', 'temporarioRef', 'outrosRef','buffTR'});
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout19);
    obj.dataLink38:setField("atrTrRef");
    obj.dataLink38:setDefaultValue("2");
    obj.dataLink38:setName("dataLink38");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle50);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(80);
    obj.layout20:setWidth(275);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout20);
    obj.button11:setLeft(5);
    obj.button11:setWidth(45);
    obj.button11:setText("VON");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout20);
    obj.rectangle53:setLeft(55);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(40);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout20);
    obj.label119:setLeft(55);
    obj.label119:setWidth(40);
    obj.label119:setHeight(25);
    obj.label119:setField("trVon");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout20);
    obj.dataLink39:setFields({'baseVon', 'atrModVon', 'magiaVon', 'variavelVon', 'temporarioVon', 'outrosVon','buffTR'});
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout20);
    obj.dataLink40:setField("atrTrVon");
    obj.dataLink40:setDefaultValue("5");
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle50);
    obj.dataLink41:setFields({'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar', 'atrTrFort', 'atrTrRef', 'atrTrVon'});
    obj.dataLink41:setName("dataLink41");

    obj.TrBut = GUI.fromHandle(_obj_newObject("button"));
    obj.TrBut:setParent(obj.rectangle50);
    obj.TrBut:setLeft(100);
    obj.TrBut:setTop(30);
    obj.TrBut:setWidth(30);
    obj.TrBut:setHeight(75);
    obj.TrBut:setName("TrBut");
    obj.TrBut:setText(">>");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle50);
    obj.label120:setLeft(5);
    obj.label120:setTop(110);
    obj.label120:setWidth(45);
    obj.label120:setHeight(25);
    obj.label120:setText("BBA");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.rectangle50);
    obj.edit140:setLeft(55);
    obj.edit140:setTop(110);
    obj.edit140:setWidth(45);
    obj.edit140:setHeight(25);
    obj.edit140:setType("number");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setField("bba");
    obj.edit140:setName("edit140");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.scrollBox1);
    obj.rectangle54:setLeft(745);
    obj.rectangle54:setTop(115);
    obj.rectangle54:setWidth(362);
    obj.rectangle54:setHeight(362);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(746);
    obj.image1:setTop(116);
    obj.image1:setWidth(360);
    obj.image1:setHeight(360);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj._e_event0 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local real = 	(tonumber(sheet.inicialFor) or 0) + 
            									(tonumber(sheet.racaFor) or 0) + 
            									(tonumber(sheet.temaFor) or 0) + 
            									(tonumber(sheet.nepFor) or 0) + 
            									(tonumber(sheet.inerenteFor) or 0) + 
            									(tonumber(sheet.tamanhoFor) or 0) + 
            									(tonumber(sheet.outrosFor) or 0);
            					local efetivo = real;
            					if sheet.isMelhoriaActive then
            						efetivo = efetivo + (tonumber(sheet.melhoriaFor) or 0);
            					end;
            					if sheet.isDnTempActive then
            						efetivo = efetivo + (tonumber(sheet.danoTempFor) or 0);
            					end;
            					if sheet.isDnPermActive then
            						efetivo = efetivo + (tonumber(sheet.danoPermFor) or 0);
            					end;
            					if sheet.isTempActive then
            						efetivo = efetivo + (tonumber(sheet.temporarioFor) or 0);
            					end;
            					if sheet.isClasseActive then
            						efetivo = efetivo + (tonumber(sheet.magiaFor) or 0);
            					end;
            					if sheet.isMagiaActive then
            						efetivo = efetivo + (tonumber(sheet.classeFor) or 0);
            					end;			
            					sheet.realFor = real;
            					sheet.efetFor = efetivo;
            				end;
        end, obj);

    obj._e_event1 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local real = 	(tonumber(sheet.inicialDes) or 0) + 
            									(tonumber(sheet.racaDes) or 0) + 
            									(tonumber(sheet.temaDes) or 0) + 
            									(tonumber(sheet.nepDes) or 0) + 
            									(tonumber(sheet.inerenteDes) or 0) + 
            									(tonumber(sheet.tamanhoDes) or 0) + 
            									(tonumber(sheet.outrosDes) or 0);
            					local efetivo = real;
            					if sheet.isMelhoriaActive then
            						efetivo = efetivo + (tonumber(sheet.melhoriaDes) or 0);
            					end;
            					if sheet.isDnTempActive then
            						efetivo = efetivo + (tonumber(sheet.danoTempDes) or 0);
            					end;
            					if sheet.isDnPermActive then
            						efetivo = efetivo + (tonumber(sheet.danoPermDes) or 0);
            					end;
            					if sheet.isTempActive then
            						efetivo = efetivo + (tonumber(sheet.temporarioDes) or 0);
            					end;
            					if sheet.isClasseActive then
            						efetivo = efetivo + (tonumber(sheet.magiaDes) or 0);
            					end;
            					if sheet.isMagiaActive then
            						efetivo = efetivo + (tonumber(sheet.classeDes) or 0);
            					end;			
            					sheet.realDes = real;
            					sheet.efetDes = efetivo;
            				end;
        end, obj);

    obj._e_event2 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local real = 	(tonumber(sheet.inicialCon) or 0) + 
            									(tonumber(sheet.racaCon) or 0) + 
            									(tonumber(sheet.temaCon) or 0) + 
            									(tonumber(sheet.nepCon) or 0) + 
            									(tonumber(sheet.inerenteCon) or 0) + 
            									(tonumber(sheet.tamanhoCon) or 0) + 
            									(tonumber(sheet.outrosCon) or 0);
            					local efetivo = real;
            					if sheet.isMelhoriaActive then
            						efetivo = efetivo + (tonumber(sheet.melhoriaCon) or 0);
            					end;
            					if sheet.isDnTempActive then
            						efetivo = efetivo + (tonumber(sheet.danoTempCon) or 0);
            					end;
            					if sheet.isDnPermActive then
            						efetivo = efetivo + (tonumber(sheet.danoPermCon) or 0);
            					end;
            					if sheet.isTempActive then
            						efetivo = efetivo + (tonumber(sheet.temporarioCon) or 0);
            					end;
            					if sheet.isClasseActive then
            						efetivo = efetivo + (tonumber(sheet.magiaCon) or 0);
            					end;
            					if sheet.isMagiaActive then
            						efetivo = efetivo + (tonumber(sheet.classeCon) or 0);
            					end;			
            					sheet.realCon = real;
            					sheet.efetCon = efetivo;
            				end;
        end, obj);

    obj._e_event3 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local real = 	(tonumber(sheet.inicialInt) or 0) + 
            									(tonumber(sheet.racaInt) or 0) + 
            									(tonumber(sheet.temaInt) or 0) + 
            									(tonumber(sheet.nepInt) or 0) + 
            									(tonumber(sheet.inerenteInt) or 0) + 
            									(tonumber(sheet.tamanhoInt) or 0) + 
            									(tonumber(sheet.outrosInt) or 0);
            					local efetivo = real;
            					if sheet.isMelhoriaActive then
            						efetivo = efetivo + (tonumber(sheet.melhoriaInt) or 0);
            					end;
            					if sheet.isDnTempActive then
            						efetivo = efetivo + (tonumber(sheet.danoTempInt) or 0);
            					end;
            					if sheet.isDnPermActive then
            						efetivo = efetivo + (tonumber(sheet.danoPermInt) or 0);
            					end;
            					if sheet.isTempActive then
            						efetivo = efetivo + (tonumber(sheet.temporarioInt) or 0);
            					end;
            					if sheet.isClasseActive then
            						efetivo = efetivo + (tonumber(sheet.magiaInt) or 0);
            					end;
            					if sheet.isMagiaActive then
            						efetivo = efetivo + (tonumber(sheet.classeInt) or 0);
            					end;			
            					sheet.realInt = real;
            					sheet.efetInt = efetivo;
            				end;
        end, obj);

    obj._e_event4 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local real = 	(tonumber(sheet.inicialSab) or 0) + 
            									(tonumber(sheet.racaSab) or 0) + 
            									(tonumber(sheet.temaSab) or 0) + 
            									(tonumber(sheet.nepSab) or 0) + 
            									(tonumber(sheet.inerenteSab) or 0) + 
            									(tonumber(sheet.tamanhoSab) or 0) + 
            									(tonumber(sheet.outrosSab) or 0);
            					local efetivo = real;
            					if sheet.isMelhoriaActive then
            						efetivo = efetivo + (tonumber(sheet.melhoriaSab) or 0);
            					end;
            					if sheet.isDnTempActive then
            						efetivo = efetivo + (tonumber(sheet.danoTempSab) or 0);
            					end;
            					if sheet.isDnPermActive then
            						efetivo = efetivo + (tonumber(sheet.danoPermSab) or 0);
            					end;
            					if sheet.isTempActive then
            						efetivo = efetivo + (tonumber(sheet.temporarioSab) or 0);
            					end;
            					if sheet.isClasseActive then
            						efetivo = efetivo + (tonumber(sheet.magiaSab) or 0);
            					end;
            					if sheet.isMagiaActive then
            						efetivo = efetivo + (tonumber(sheet.classeSab) or 0);
            					end;			
            					sheet.realSab = real;
            					sheet.efetSab = efetivo;
            				end;
        end, obj);

    obj._e_event5 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local real = 	(tonumber(sheet.inicialCar) or 0) + 
            									(tonumber(sheet.racaCar) or 0) + 
            									(tonumber(sheet.temaCar) or 0) + 
            									(tonumber(sheet.nepCar) or 0) + 
            									(tonumber(sheet.inerenteCar) or 0) + 
            									(tonumber(sheet.tamanhoCar) or 0) + 
            									(tonumber(sheet.outrosCar) or 0);
            					local efetivo = real;
            					if sheet.isMelhoriaActive then
            						efetivo = efetivo + (tonumber(sheet.melhoriaCar) or 0);
            					end;
            					if sheet.isDnTempActive then
            						efetivo = efetivo + (tonumber(sheet.danoTempCar) or 0);
            					end;
            					if sheet.isDnPermActive then
            						efetivo = efetivo + (tonumber(sheet.danoPermCar) or 0);
            					end;
            					if sheet.isTempActive then
            						efetivo = efetivo + (tonumber(sheet.temporarioCar) or 0);
            					end;
            					if sheet.isClasseActive then
            						efetivo = efetivo + (tonumber(sheet.magiaCar) or 0);
            					end;
            					if sheet.isMagiaActive then
            						efetivo = efetivo + (tonumber(sheet.classeCar) or 0);
            					end;			
            					sheet.realCar = real;
            					sheet.efetCar = efetivo;
            				end;
        end, obj);

    obj._e_event6 = obj.xpAtualLabel:addEventListener("onClick",
        function (_)
            self.xpAtualLabel.visible = false;
            				self.xpAtualEdit.visible = true;
            				self.xpAtualEdit:setFocus();
        end, obj);

    obj._e_event7 = obj.xpAtualEdit:addEventListener("onExit",
        function (_)
            self.xpAtualLabel.visible = true;
            				self.xpAtualEdit.visible = false;
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (_)
            local xp = (tonumber(sheet.xpAtual) or 0) + (tonumber(sheet.xpNova) or 0);
            						
            						sheet.xpAtual = xp;
            						sheet.xpNova = "0";
        end, obj);

    obj._e_event9 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            
            
            						-- Calculando XP atual (tirando formatação)
            						if sheet.xpAtual == nil then
            							sheet.xpAtual = 0;
            						end;
            						local mod = sheet.xpAtual;
            						mod = string.gsub(mod, "X", "");
            						mod = string.gsub(mod, "P", "");
            						mod = string.gsub(mod, "x", "");
            						mod = string.gsub(mod, "p", "");
            						mod = string.gsub(mod, "%.", "");
            						mod = (tonumber(mod) or 0);
            						local xpAtual = mod;
            
            						-- Calculando XP alvo
            						local xpTable = {};
            						if sheet.xpVelocidade == "Lento" then
            							xpTable = {3000, 7500, 14000, 23000, 35000, 53000, 77000, 115000, 160000, 235000, 330000, 475000, 665000, 955000, 1350000, 1900000, 2700000, 3850000, 5350000};
            						elseif sheet.xpVelocidade == "Medio" then
            							xpTable = {2000, 5000, 9000, 15000, 23000, 35000, 51000, 75000, 105000, 155000, 220000, 315000, 445000, 635000, 890000, 1300000, 1800000, 2550000, 3600000};
            						elseif sheet.xpVelocidade == "d20" then
            							xpTable = {1000, 3000, 6000, 10000, 15000, 21000, 28000, 36000, 45000, 55000, 66000, 78000, 91000, 105000, 120000, 136000, 153000, 171000, 190000};
            						else
            							xpTable = {1300, 3300, 6000, 10000, 15000, 23000, 34000, 50000, 71000, 105000, 145000, 210000, 295000, 425000, 600000, 850000, 1200000, 1700000, 2400000};
            						end;
            						
            						local level = 1;
            						local xpAlvo = xpTable[19];
            						for i=1, 19, 1 do
            							if xpAtual >= xpTable[i] then
            								level = i + 1;
            							else
            								xpAlvo = xpTable[i];
            								break;
            							end;
            						end;
            
            						while true do  
            							xpAlvo, k = string.gsub(xpAlvo, "^(-?%d+)(%d%d%d)", '%1,%2')
            							if (k==0) then
            							  break
            							end
            						end
            						xpAlvo = string.gsub(xpAlvo, ",", ".");
            						
            						sheet.xpNivel = xpAlvo .. "XP";
            						sheet.nep = level;
            					end;
        end, obj);

    obj._e_event10 = obj.button2:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModFor) or 0);
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Força de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event11 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.realModFor = getMOD(sheet.realFor);  
            				end;
        end, obj);

    obj._e_event12 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.efetModFor = getMOD(sheet.efetFor);
            					updateAtributes(1);
            				end;
        end, obj);

    obj._e_event13 = obj.button3:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModDes) or 0);
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Destreza de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event14 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.realModDes = getMOD(sheet.realDes);  
            				end;
        end, obj);

    obj._e_event15 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.efetModDes = getMOD(sheet.efetDes);
            					updateAtributes(2);
            				end;
        end, obj);

    obj._e_event16 = obj.button4:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModCon) or 0);
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Constituição de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event17 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.realModCon = getMOD(sheet.realCon);  
            				end;
        end, obj);

    obj._e_event18 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.efetModCon = getMOD(sheet.efetCon);
            					updateAtributes(3);
            				end;
        end, obj);

    obj._e_event19 = obj.button5:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModInt) or 0);
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Inteligência de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event20 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.realModInt = getMOD(sheet.realInt);  
            				end;
        end, obj);

    obj._e_event21 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.efetModInt = getMOD(sheet.efetInt);
            					updateAtributes(4);
            				end;
        end, obj);

    obj._e_event22 = obj.button6:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModSab) or 0);
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Sabedoria de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event23 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.realModSab = getMOD(sheet.realSab);  
            				end;
        end, obj);

    obj._e_event24 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.efetModSab = getMOD(sheet.efetSab);
            					updateAtributes(5);
            				end;
        end, obj);

    obj._e_event25 = obj.button7:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModCar) or 0);
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Carisma de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event26 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.realModCar = getMOD(sheet.realCar);  
            				end;
        end, obj);

    obj._e_event27 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            					sheet.efetModCar = getMOD(sheet.efetCar);
            					updateAtributes(6);
            				end;
        end, obj);

    obj._e_event28 = obj.AtrBut:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAtributo");
            				
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("rightCenter", self.AtrBut);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            					end;
        end, obj);

    obj._e_event29 = obj.deslTerrestreLabel:addEventListener("onClick",
        function (_)
            self.deslTerrestreLabel.visible = false;
            				self.deslTerrestreEdit.visible = true;
            				self.deslTerrestreEdit:setFocus();
        end, obj);

    obj._e_event30 = obj.deslTerrestreEdit:addEventListener("onExit",
        function (_)
            self.deslTerrestreLabel.visible = true;
            				self.deslTerrestreEdit.visible = false;
        end, obj);

    obj._e_event31 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslTerrestre ~= nil then
            
            					local mod = sheet.deslTerrestre;
            					mod = string.gsub(mod, "m", "");
            					mod = string.gsub(mod, ",", ".");
            
            					mod = math.floor((tonumber(mod) or 0) / 1.5);
            					sheet.deslTerrestreQuadrados = mod .. "q";
            				end;
        end, obj);

    obj._e_event32 = obj.deslVooLabel:addEventListener("onClick",
        function (_)
            self.deslVooLabel.visible = false;
            				self.deslVooEdit.visible = true;
            				self.deslVooEdit:setFocus();
        end, obj);

    obj._e_event33 = obj.deslVooEdit:addEventListener("onExit",
        function (_)
            self.deslVooLabel.visible = true;
            				self.deslVooEdit.visible = false;
        end, obj);

    obj._e_event34 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslVoo ~= nil then
            
            					local mod = sheet.deslVoo;
            					mod = string.gsub(mod, "m", "");
            					mod = string.gsub(mod, ",", ".");
            
            					mod = math.floor((tonumber(mod) or 0) / 1.5);
            					sheet.deslVooQuadrados = mod .. "q";
            				end;
        end, obj);

    obj._e_event35 = obj.deslNatacaoLabel:addEventListener("onClick",
        function (_)
            self.deslNatacaoLabel.visible = false;
            				self.deslNatacaoEdit.visible = true;
            				self.deslNatacaoEdit:setFocus();
        end, obj);

    obj._e_event36 = obj.deslNatacaoEdit:addEventListener("onExit",
        function (_)
            self.deslNatacaoLabel.visible = true;
            				self.deslNatacaoEdit.visible = false;
        end, obj);

    obj._e_event37 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslNatacao ~= nil then
            
            					local mod = sheet.deslNatacao;
            					mod = string.gsub(mod, "m", "");
            					mod = string.gsub(mod, ",", ".");
            
            					mod = math.floor((tonumber(mod) or 0) / 1.5);
            					sheet.deslNatacaoQuadrados = mod .. "q";
            				end;
        end, obj);

    obj._e_event38 = obj.deslEscalarLabel:addEventListener("onClick",
        function (_)
            self.deslEscalarLabel.visible = false;
            				self.deslEscalarEdit.visible = true;
            				self.deslEscalarEdit:setFocus();
        end, obj);

    obj._e_event39 = obj.deslEscalarEdit:addEventListener("onExit",
        function (_)
            self.deslEscalarLabel.visible = true;
            				self.deslEscalarEdit.visible = false;
        end, obj);

    obj._e_event40 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslEscalar ~= nil then
            
            					local mod = sheet.deslEscalar;
            					mod = string.gsub(mod, "m", "");
            					mod = string.gsub(mod, ",", ".");
            
            					mod = math.floor((tonumber(mod) or 0) / 1.5);
            					sheet.deslEscalarQuadrados = mod .. "q";
            				end;
        end, obj);

    obj._e_event41 = obj.deslEscavarLabel:addEventListener("onClick",
        function (_)
            self.deslEscavarLabel.visible = false;
            				self.deslEscavarEdit.visible = true;
            				self.deslEscavarEdit:setFocus();
        end, obj);

    obj._e_event42 = obj.deslEscavarEdit:addEventListener("onExit",
        function (_)
            self.deslEscavarLabel.visible = true;
            				self.deslEscavarEdit.visible = false;
        end, obj);

    obj._e_event43 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslEscavar ~= nil then
            
            					local mod = sheet.deslEscavar;
            					mod = string.gsub(mod, "m", "");
            					mod = string.gsub(mod, ",", ".");
            
            					mod = math.floor((tonumber(mod) or 0) / 1.5);
            					sheet.deslEscavarQuadrados = mod .. "q";
            				end;
        end, obj);

    obj._e_event44 = obj.button8:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.iniciativa or "+0"));
            					local mesa = Firecast.getMesaDe(sheet);
            					mesa.activeChat:rolarDados(rolagem, "Teste de Iniciativa de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event45 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local mod = (tonumber(sheet.efetModDes) or 0) + (tonumber(sheet.iniVariado) or 0);
            						if (mod >= 0) then
            								mod = "+" .. mod;
            						end;					   
            						sheet.iniciativa = mod;
            					end;
        end, obj);

    obj._e_event46 = obj.caDetails:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popCA");
            					
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("bottomCenter", self.caDetails);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup de armadura para exibir");
            					end;
        end, obj);

    obj._e_event47 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local armaduraCac = (tonumber(sheet.armaduraCac) or 0);
            						local efetModDes = (tonumber(sheet.efetModDes) or 0);
            						local tamanhoCac = (tonumber(sheet.tamanhoCac) or 0);
            						local naturalCac = (tonumber(sheet.naturalCac) or 0);
            						local deflexaoCac = (tonumber(sheet.deflexaoCac) or 0);
            						local esquivaCac = (tonumber(sheet.esquivaCac) or 0);
            						local sorteCac = (tonumber(sheet.sorteCac) or 0);
            						local outrosCac = (tonumber(sheet.outrosCac) or 0);
            						local variadosCac = (tonumber(sheet.variadosCac) or 0);
            
            						local desMax = tonumber(sheet.destrezaCALimit) or 999;
            						if desMax < efetModDes then
            							efetModDes = desMax;
            						end;
            
            						local cac = 	10 + armaduraCac + efetModDes + tamanhoCac + naturalCac + deflexaoCac + esquivaCac + sorteCac + outrosCac + variadosCac;
            
            						sheet.cac = cac;
            						sheet.camc = 8 + cac;
            					end;
        end, obj);

    obj._e_event48 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local armaduraCae = (tonumber(sheet.armaduraCae) or 0);
            						local efetModDes = (tonumber(sheet.efetModDes) or 0);
            						local tamanhoCae = (tonumber(sheet.tamanhoCae) or 0);
            						local naturalCae = (tonumber(sheet.naturalCae) or 0);
            						local deflexaoCae = (tonumber(sheet.deflexaoCae) or 0);
            						local esquivaCae = (tonumber(sheet.esquivaCae) or 0);
            						local sorteCae = (tonumber(sheet.sorteCae) or 0);
            						local outrosCae = (tonumber(sheet.outrosCae) or 0);
            						local variadosCae = (tonumber(sheet.variadosCae) or 0);
            
            						local desMax = tonumber(sheet.destrezaCALimit) or 999;
            						if desMax < efetModDes then
            							efetModDes = desMax;
            						end;
            
            						local cae = 10 + armaduraCae + efetModDes + tamanhoCae + naturalCae + deflexaoCae + esquivaCae + sorteCae + outrosCae + variadosCae;
            
            						sheet.cae = cae;
            					end;
        end, obj);

    obj._e_event49 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					
            					local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            					for i=1, #nodes, 1 do
            						nodes[i].penalidade = sheet.equipamentoCorpoPen;
            					end;
        end, obj);

    obj._e_event50 = obj.button9:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 +" .. (sheet.trFort) or "0");
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Fortitude de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event51 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local tr = (tonumber(sheet.baseFort) or 0) + 
            									(tonumber(sheet.atrModFort) or 0) + 
            									(tonumber(sheet.magiaFort) or 0) + 
            									(tonumber(sheet.variavelFort) or 0) + 
            									(tonumber(sheet.temporarioFort) or 0) + 
            									(tonumber(sheet.outrosFort) or 0) + 
            									(tonumber(sheet.buffTR) or 0);
            					sheet.trFort = tr;
            				end;
        end, obj);

    obj._e_event52 = obj.button10:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 +" .. (sheet.trRef) or "0");
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Reflexos de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event53 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local tr = (tonumber(sheet.baseRef) or 0) + 
            									(tonumber(sheet.atrModRef) or 0) + 
            									(tonumber(sheet.magiaRef) or 0) + 
            									(tonumber(sheet.variavelRef) or 0) + 
            									(tonumber(sheet.temporarioRef) or 0) + 
            									(tonumber(sheet.outrosRef) or 0) + 
            									(tonumber(sheet.buffTR) or 0);
            					sheet.trRef = tr;
            				end;
        end, obj);

    obj._e_event54 = obj.button11:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 +" .. (sheet.trVon) or "0");
            				local mesa = Firecast.getMesaDe(sheet);
            				mesa.activeChat:rolarDados(rolagem, "Teste de Vontade de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event55 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local tr = (tonumber(sheet.baseVon) or 0) + 
            									(tonumber(sheet.atrModVon) or 0) + 
            									(tonumber(sheet.magiaVon) or 0) + 
            									(tonumber(sheet.variavelVon) or 0) + 
            									(tonumber(sheet.temporarioVon) or 0) + 
            									(tonumber(sheet.outrosVon) or 0) + 
            									(tonumber(sheet.buffTR) or 0);
            					sheet.trVon = tr;
            				end;
        end, obj);

    obj._e_event56 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            							local atrModFort = 0;
            							local atrModRef = 0;
            							local atrModVon = 0;
            
            							local num = tonumber(sheet.atrTrFort) or 3;
            
            							if num == 1 then
            								atrModFort = tonumber(sheet.efetModFor) or 0;
            							elseif num == 2 then
            								atrModFort = tonumber(sheet.efetModDes) or 0;
            							elseif num == 3 then
            								atrModFort = tonumber(sheet.efetModCon) or 0;
            							elseif num == 4 then
            								atrModFort = tonumber(sheet.efetModInt) or 0;
            							elseif num == 5 then
            								atrModFort = tonumber(sheet.efetModSab) or 0;
            							elseif num == 6 then
            								atrModFort = tonumber(sheet.efetModCar) or 0;
            							end;
            
            							num = tonumber(sheet.atrTrRef) or 2;
            
            							if num == 1 then
            								atrModRef = tonumber(sheet.efetModFor) or 0;
            							elseif num == 2 then
            								atrModRef = tonumber(sheet.efetModDes) or 0;
            							elseif num == 3 then
            								atrModRef = tonumber(sheet.efetModCon) or 0;
            							elseif num == 4 then
            								atrModRef = tonumber(sheet.efetModInt) or 0;
            							elseif num == 5 then
            								atrModRef = tonumber(sheet.efetModSab) or 0;
            							elseif num == 6 then
            								atrModRef = tonumber(sheet.efetModCar) or 0;
            							end;
            
            							num = tonumber(sheet.atrTrVon) or 5;
            
            							if num == 1 then
            								atrModVon = tonumber(sheet.efetModFor) or 0;
            							elseif num == 2 then
            								atrModVon = tonumber(sheet.efetModDes) or 0;
            							elseif num == 3 then
            								atrModVon = tonumber(sheet.efetModCon) or 0;
            							elseif num == 4 then
            								atrModVon = tonumber(sheet.efetModInt) or 0;
            							elseif num == 5 then
            								atrModVon = tonumber(sheet.efetModSab) or 0;
            							elseif num == 6 then
            								atrModVon = tonumber(sheet.efetModCar) or 0;
            							end;
            
            							sheet.atrModFort = atrModFort;
            							sheet.atrModRef = atrModRef;
            							sheet.atrModVon = atrModVon;
            						end;
        end, obj);

    obj._e_event57 = obj.TrBut:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popResistencia");
            					
            						if pop ~= nil then
            							pop:setNodeObject(self.sheet);
            							pop:showPopupEx("rightCenter", self.TrBut);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup de resistencias para exibir");
            						end;
        end, obj);

    obj._e_event58 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
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

        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.flowPart129 ~= nil then self.flowPart129:destroy(); self.flowPart129 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.flowPart157 ~= nil then self.flowPart157:destroy(); self.flowPart157 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.flowPart161 ~= nil then self.flowPart161:destroy(); self.flowPart161 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.deslTerrestreEdit ~= nil then self.deslTerrestreEdit:destroy(); self.deslTerrestreEdit = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.caDetails ~= nil then self.caDetails:destroy(); self.caDetails = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.flowPart150 ~= nil then self.flowPart150:destroy(); self.flowPart150 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.flowPart145 ~= nil then self.flowPart145:destroy(); self.flowPart145 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.flowPart142 ~= nil then self.flowPart142:destroy(); self.flowPart142 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowPart152 ~= nil then self.flowPart152:destroy(); self.flowPart152 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowPart169 ~= nil then self.flowPart169:destroy(); self.flowPart169 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.flowPart113 ~= nil then self.flowPart113:destroy(); self.flowPart113 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowPart132 ~= nil then self.flowPart132:destroy(); self.flowPart132 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.flowPart144 ~= nil then self.flowPart144:destroy(); self.flowPart144 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.deslTerrestreLabel ~= nil then self.deslTerrestreLabel:destroy(); self.deslTerrestreLabel = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.flowPart127 ~= nil then self.flowPart127:destroy(); self.flowPart127 = nil; end;
        if self.flowPart147 ~= nil then self.flowPart147:destroy(); self.flowPart147 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.deslEscalarEdit ~= nil then self.deslEscalarEdit:destroy(); self.deslEscalarEdit = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.flowPart158 ~= nil then self.flowPart158:destroy(); self.flowPart158 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.xpAtualEdit ~= nil then self.xpAtualEdit:destroy(); self.xpAtualEdit = nil; end;
        if self.flowPart162 ~= nil then self.flowPart162:destroy(); self.flowPart162 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.flowPart149 ~= nil then self.flowPart149:destroy(); self.flowPart149 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.deslNatacaoLabel ~= nil then self.deslNatacaoLabel:destroy(); self.deslNatacaoLabel = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.flowPart163 ~= nil then self.flowPart163:destroy(); self.flowPart163 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.flowPart154 ~= nil then self.flowPart154:destroy(); self.flowPart154 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.TrBut ~= nil then self.TrBut:destroy(); self.TrBut = nil; end;
        if self.flowPart155 ~= nil then self.flowPart155:destroy(); self.flowPart155 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.popCA ~= nil then self.popCA:destroy(); self.popCA = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart166 ~= nil then self.flowPart166:destroy(); self.flowPart166 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.deslEscavarEdit ~= nil then self.deslEscavarEdit:destroy(); self.deslEscavarEdit = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.flowPart170 ~= nil then self.flowPart170:destroy(); self.flowPart170 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flowPart160 ~= nil then self.flowPart160:destroy(); self.flowPart160 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.popResistencia ~= nil then self.popResistencia:destroy(); self.popResistencia = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.flowPart143 ~= nil then self.flowPart143:destroy(); self.flowPart143 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.xpAtualLabel ~= nil then self.xpAtualLabel:destroy(); self.xpAtualLabel = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.deslVooLabel ~= nil then self.deslVooLabel:destroy(); self.deslVooLabel = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.deslEscalarLabel ~= nil then self.deslEscalarLabel:destroy(); self.deslEscalarLabel = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.deslNatacaoEdit ~= nil then self.deslNatacaoEdit:destroy(); self.deslNatacaoEdit = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.deslVooEdit ~= nil then self.deslVooEdit:destroy(); self.deslVooEdit = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.flowPart164 ~= nil then self.flowPart164:destroy(); self.flowPart164 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.flowPart172 ~= nil then self.flowPart172:destroy(); self.flowPart172 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.flowPart156 ~= nil then self.flowPart156:destroy(); self.flowPart156 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.flowPart168 ~= nil then self.flowPart168:destroy(); self.flowPart168 = nil; end;
        if self.flowPart148 ~= nil then self.flowPart148:destroy(); self.flowPart148 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.popAtributo ~= nil then self.popAtributo:destroy(); self.popAtributo = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowPart153 ~= nil then self.flowPart153:destroy(); self.flowPart153 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.flowPart159 ~= nil then self.flowPart159:destroy(); self.flowPart159 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.deslEscavarLabel ~= nil then self.deslEscavarLabel:destroy(); self.deslEscavarLabel = nil; end;
        if self.flowPart167 ~= nil then self.flowPart167:destroy(); self.flowPart167 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.flowPart134 ~= nil then self.flowPart134:destroy(); self.flowPart134 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.flowPart151 ~= nil then self.flowPart151:destroy(); self.flowPart151 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.flowPart146 ~= nil then self.flowPart146:destroy(); self.flowPart146 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.flowPart171 ~= nil then self.flowPart171:destroy(); self.flowPart171 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.AtrBut ~= nil then self.AtrBut:destroy(); self.AtrBut = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.flowPart165 ~= nil then self.flowPart165:destroy(); self.flowPart165 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister1_svg = {
    newEditor = newfrmFichaRPGmeister1_svg, 
    new = newfrmFichaRPGmeister1_svg, 
    name = "frmFichaRPGmeister1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister1_svg = _frmFichaRPGmeister1_svg;
Firecast.registrarForm(_frmFichaRPGmeister1_svg);

return _frmFichaRPGmeister1_svg;
