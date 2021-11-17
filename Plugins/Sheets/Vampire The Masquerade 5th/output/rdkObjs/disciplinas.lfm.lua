require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_disciplinas()
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
    obj:setName("disciplinas");
    obj:setHeight(230);
    obj:setWidth(220);
    obj:setMargins({left=20, right=20});

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj);
    obj.flowPart1:setHeight(230);
    obj.flowPart1:setWidth(220);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMinWidth(220);
    obj.flowPart1:setMaxWidth(220);
    obj.flowPart1:setMargins({left=20, right=20, bottom=10});

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.flowPart1);
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setWidth(220);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxColumns(1);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMargins({bottom=5});
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMinWidth(220);
    obj.flowPart2:setMaxWidth(220);
    obj.flowPart2:setHeight(25);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart2);
    obj.edit1:setAlign("left");
    obj.edit1:setField("fldDis_Disc00");
    obj.edit1:setWidth(100);
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("white");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.flowPart2);
    obj.dataLink1:setField("fldDis_Disc00");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart2);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({right=10});
    obj.layout1:setName("layout1");

    obj.nomeCheckDisc00_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDisc00_01:setParent(obj.layout1);
    obj.nomeCheckDisc00_01:setField("fldCheckDisc00_01");
    obj.nomeCheckDisc00_01:setName("nomeCheckDisc00_01");
    obj.nomeCheckDisc00_01:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckDisc00_01:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckDisc00_01:setHeight(25);
    obj.nomeCheckDisc00_01:setWidth(14);
    obj.nomeCheckDisc00_01:setAlign("right");
    obj.nomeCheckDisc00_01:setMargins({left=3});
    obj.nomeCheckDisc00_01:setAutoChange(false);

    obj.nomeCheckDisc00_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDisc00_02:setParent(obj.layout1);
    obj.nomeCheckDisc00_02:setField("fldCheckDisc00_02");
    obj.nomeCheckDisc00_02:setName("nomeCheckDisc00_02");
    obj.nomeCheckDisc00_02:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckDisc00_02:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckDisc00_02:setHeight(25);
    obj.nomeCheckDisc00_02:setWidth(14);
    obj.nomeCheckDisc00_02:setAlign("right");
    obj.nomeCheckDisc00_02:setMargins({left=3});
    obj.nomeCheckDisc00_02:setAutoChange(false);

    obj.nomeCheckDisc00_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDisc00_03:setParent(obj.layout1);
    obj.nomeCheckDisc00_03:setField("fldCheckDisc00_03");
    obj.nomeCheckDisc00_03:setName("nomeCheckDisc00_03");
    obj.nomeCheckDisc00_03:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckDisc00_03:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckDisc00_03:setHeight(25);
    obj.nomeCheckDisc00_03:setWidth(14);
    obj.nomeCheckDisc00_03:setAlign("right");
    obj.nomeCheckDisc00_03:setMargins({left=3});
    obj.nomeCheckDisc00_03:setAutoChange(false);

    obj.nomeCheckDisc00_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDisc00_04:setParent(obj.layout1);
    obj.nomeCheckDisc00_04:setField("fldCheckDisc00_04");
    obj.nomeCheckDisc00_04:setName("nomeCheckDisc00_04");
    obj.nomeCheckDisc00_04:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckDisc00_04:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckDisc00_04:setHeight(25);
    obj.nomeCheckDisc00_04:setWidth(14);
    obj.nomeCheckDisc00_04:setAlign("right");
    obj.nomeCheckDisc00_04:setMargins({left=3});
    obj.nomeCheckDisc00_04:setAutoChange(false);

    obj.nomeCheckDisc00_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDisc00_05:setParent(obj.layout1);
    obj.nomeCheckDisc00_05:setField("fldCheckDisc00_05");
    obj.nomeCheckDisc00_05:setName("nomeCheckDisc00_05");
    obj.nomeCheckDisc00_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheckDisc00_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheckDisc00_05:setHeight(25);
    obj.nomeCheckDisc00_05:setWidth(14);
    obj.nomeCheckDisc00_05:setAlign("right");
    obj.nomeCheckDisc00_05:setMargins({left=3});
    obj.nomeCheckDisc00_05:setAutoChange(false);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowLayout1);
    obj.horzLine1:setAlign("none");
    obj.horzLine1:setMargins({bottom=10});
    obj.horzLine1:setTop(24);
    obj.horzLine1:setWidth(215);
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#424242");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMargins({bottom=5});
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMinWidth(220);
    obj.flowPart3:setMaxWidth(220);
    obj.flowPart3:setHeight(25);

    obj.nomeDis_01 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeDis_01:setParent(obj.flowPart3);
    obj.nomeDis_01:setAlign("left");
    obj.nomeDis_01:setName("nomeDis_01");
    obj.nomeDis_01:setField("fldDisPod_01");
    obj.nomeDis_01:setWidth(220);
    obj.nomeDis_01:setFontSize(14);
    obj.nomeDis_01:setFontColor("#cdcdcd");
    obj.nomeDis_01:setTextTrimming("character");
    obj.nomeDis_01:setFontFamily("Constantia");
    obj.nomeDis_01:setTransparent(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flowPart3);
    obj.dataLink2:setField("fldDisPod_01");
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setName("dataLink2");

    obj.nomeBut01 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut01:setParent(obj.flowPart3);
    obj.nomeBut01:setName("nomeBut01");
    obj.nomeBut01:setText("𝐢");
    obj.nomeBut01:setWidth(22);
    obj.nomeBut01:setHeight(22);
    obj.nomeBut01:setTop(1);
    obj.nomeBut01:setLeft(191);
    obj.nomeBut01:setFontColor("#272727");

    obj.nomeBut01B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut01B:setParent(obj.flowPart3);
    obj.nomeBut01B:setName("nomeBut01B");
    obj.nomeBut01B:setText("𝐢");
    obj.nomeBut01B:setWidth(22);
    obj.nomeBut01B:setHeight(22);
    obj.nomeBut01B:setTop(1);
    obj.nomeBut01B:setLeft(191);
    obj.nomeBut01B:setFontColor("white");
    obj.nomeBut01B:setVisible(false);

    obj.popUp_01 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_01:setParent(obj.flowPart3);
    obj.popUp_01:setName("popUp_01");
    obj.popUp_01:setWidth(300);
    obj.popUp_01:setHeight(200);
    obj.popUp_01:setBackOpacity(0);
    obj.popUp_01:setDrawContainer(false);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popUp_01);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0e0e0e");
    obj.rectangle1:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("bevel");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#0e0e0e");
    obj.rectangle2:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle2:setXradius(3);
    obj.rectangle2:setYradius(3);
    obj.rectangle2:setStrokeColor("#272727");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setName("rectangle2");

    obj.nomeDis01 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeDis01:setParent(obj.rectangle2);
    obj.nomeDis01:setAlign("client");
    obj.nomeDis01:setTransparent(true);
    obj.nomeDis01:setField("fld01");
    obj.nomeDis01:setName("nomeDis01");
    obj.nomeDis01:setFontFamily("Constantia");
    obj.nomeDis01:setFontSize(13);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle2);
    obj.dataLink3:setField("fld01");
    obj.dataLink3:setDefaultValue("Descrição do Poder");
    obj.dataLink3:setName("dataLink3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMargins({bottom=5});
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMinWidth(220);
    obj.flowPart4:setMaxWidth(220);
    obj.flowPart4:setHeight(25);

    obj.nomeDis_02 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeDis_02:setParent(obj.flowPart4);
    obj.nomeDis_02:setAlign("left");
    obj.nomeDis_02:setName("nomeDis_02");
    obj.nomeDis_02:setField("fldDisPod_02");
    obj.nomeDis_02:setWidth(220);
    obj.nomeDis_02:setFontSize(14);
    obj.nomeDis_02:setFontColor("#cdcdcd");
    obj.nomeDis_02:setTextTrimming("character");
    obj.nomeDis_02:setFontFamily("Constantia");
    obj.nomeDis_02:setTransparent(true);

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowPart4);
    obj.dataLink4:setField("fldDisPod_02");
    obj.dataLink4:setDefaultValue("—");
    obj.dataLink4:setName("dataLink4");

    obj.nomeBut02 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut02:setParent(obj.flowPart4);
    obj.nomeBut02:setName("nomeBut02");
    obj.nomeBut02:setText("𝐢");
    obj.nomeBut02:setWidth(22);
    obj.nomeBut02:setHeight(22);
    obj.nomeBut02:setTop(1);
    obj.nomeBut02:setLeft(191);
    obj.nomeBut02:setFontColor("#272727");

    obj.nomeBut02B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut02B:setParent(obj.flowPart4);
    obj.nomeBut02B:setName("nomeBut02B");
    obj.nomeBut02B:setText("𝐢");
    obj.nomeBut02B:setWidth(22);
    obj.nomeBut02B:setHeight(22);
    obj.nomeBut02B:setTop(1);
    obj.nomeBut02B:setLeft(191);
    obj.nomeBut02B:setFontColor("white");
    obj.nomeBut02B:setVisible(false);

    obj.popUp_02 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_02:setParent(obj.flowPart4);
    obj.popUp_02:setName("popUp_02");
    obj.popUp_02:setWidth(300);
    obj.popUp_02:setHeight(200);
    obj.popUp_02:setBackOpacity(0);
    obj.popUp_02:setDrawContainer(false);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.popUp_02);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#0e0e0e");
    obj.rectangle3:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setName("rectangle3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#0e0e0e");
    obj.rectangle4:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle4:setXradius(3);
    obj.rectangle4:setYradius(3);
    obj.rectangle4:setStrokeColor("#272727");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setName("rectangle4");

    obj.nomeDis02 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeDis02:setParent(obj.rectangle4);
    obj.nomeDis02:setAlign("client");
    obj.nomeDis02:setTransparent(true);
    obj.nomeDis02:setField("fld02");
    obj.nomeDis02:setName("nomeDis02");
    obj.nomeDis02:setFontFamily("Constantia");
    obj.nomeDis02:setFontSize(13);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle4);
    obj.dataLink5:setField("fld02");
    obj.dataLink5:setDefaultValue("Descrição do Poder");
    obj.dataLink5:setName("dataLink5");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMargins({bottom=5});
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMinWidth(220);
    obj.flowPart5:setMaxWidth(220);
    obj.flowPart5:setHeight(25);

    obj.nomeDis_03 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeDis_03:setParent(obj.flowPart5);
    obj.nomeDis_03:setAlign("left");
    obj.nomeDis_03:setName("nomeDis_03");
    obj.nomeDis_03:setField("fldDisPod_03");
    obj.nomeDis_03:setWidth(220);
    obj.nomeDis_03:setFontSize(14);
    obj.nomeDis_03:setFontColor("#cdcdcd");
    obj.nomeDis_03:setTextTrimming("character");
    obj.nomeDis_03:setFontFamily("Constantia");
    obj.nomeDis_03:setTransparent(true);

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowPart5);
    obj.dataLink6:setField("fldDisPod_03");
    obj.dataLink6:setDefaultValue("—");
    obj.dataLink6:setName("dataLink6");

    obj.nomeBut03 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut03:setParent(obj.flowPart5);
    obj.nomeBut03:setName("nomeBut03");
    obj.nomeBut03:setText("𝐢");
    obj.nomeBut03:setWidth(22);
    obj.nomeBut03:setHeight(22);
    obj.nomeBut03:setTop(1);
    obj.nomeBut03:setLeft(191);
    obj.nomeBut03:setFontColor("#272727");

    obj.nomeBut03B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut03B:setParent(obj.flowPart5);
    obj.nomeBut03B:setName("nomeBut03B");
    obj.nomeBut03B:setText("𝐢");
    obj.nomeBut03B:setWidth(22);
    obj.nomeBut03B:setHeight(22);
    obj.nomeBut03B:setTop(1);
    obj.nomeBut03B:setLeft(191);
    obj.nomeBut03B:setFontColor("white");
    obj.nomeBut03B:setVisible(false);

    obj.popUp_03 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_03:setParent(obj.flowPart5);
    obj.popUp_03:setName("popUp_03");
    obj.popUp_03:setWidth(300);
    obj.popUp_03:setHeight(200);
    obj.popUp_03:setBackOpacity(0);
    obj.popUp_03:setDrawContainer(false);

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.popUp_03);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#0e0e0e");
    obj.rectangle5:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(5);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setName("rectangle5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#0e0e0e");
    obj.rectangle6:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle6:setXradius(3);
    obj.rectangle6:setYradius(3);
    obj.rectangle6:setStrokeColor("#272727");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setCornerType("bevel");
    obj.rectangle6:setName("rectangle6");

    obj.nomeDis03 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeDis03:setParent(obj.rectangle6);
    obj.nomeDis03:setAlign("client");
    obj.nomeDis03:setTransparent(true);
    obj.nomeDis03:setField("fld03");
    obj.nomeDis03:setName("nomeDis03");
    obj.nomeDis03:setFontFamily("Constantia");
    obj.nomeDis03:setFontSize(13);

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle6);
    obj.dataLink7:setField("fld03");
    obj.dataLink7:setDefaultValue("Descrição do Poder");
    obj.dataLink7:setName("dataLink7");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMargins({bottom=5});
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMinWidth(220);
    obj.flowPart6:setMaxWidth(220);
    obj.flowPart6:setHeight(25);

    obj.nomeDis_04 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeDis_04:setParent(obj.flowPart6);
    obj.nomeDis_04:setAlign("left");
    obj.nomeDis_04:setName("nomeDis_04");
    obj.nomeDis_04:setField("fldDisPod_04");
    obj.nomeDis_04:setWidth(220);
    obj.nomeDis_04:setFontSize(14);
    obj.nomeDis_04:setFontColor("#cdcdcd");
    obj.nomeDis_04:setTextTrimming("character");
    obj.nomeDis_04:setFontFamily("Constantia");
    obj.nomeDis_04:setTransparent(true);

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowPart6);
    obj.dataLink8:setField("fldDisPod_04");
    obj.dataLink8:setDefaultValue("—");
    obj.dataLink8:setName("dataLink8");

    obj.nomeBut04 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut04:setParent(obj.flowPart6);
    obj.nomeBut04:setName("nomeBut04");
    obj.nomeBut04:setText("𝐢");
    obj.nomeBut04:setWidth(22);
    obj.nomeBut04:setHeight(22);
    obj.nomeBut04:setTop(1);
    obj.nomeBut04:setLeft(191);
    obj.nomeBut04:setFontColor("#272727");

    obj.nomeBut04B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut04B:setParent(obj.flowPart6);
    obj.nomeBut04B:setName("nomeBut04B");
    obj.nomeBut04B:setText("𝐢");
    obj.nomeBut04B:setWidth(22);
    obj.nomeBut04B:setHeight(22);
    obj.nomeBut04B:setTop(1);
    obj.nomeBut04B:setLeft(191);
    obj.nomeBut04B:setFontColor("white");
    obj.nomeBut04B:setVisible(false);

    obj.popUp_04 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_04:setParent(obj.flowPart6);
    obj.popUp_04:setName("popUp_04");
    obj.popUp_04:setWidth(300);
    obj.popUp_04:setHeight(200);
    obj.popUp_04:setBackOpacity(0);
    obj.popUp_04:setDrawContainer(false);

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.popUp_04);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("#0e0e0e");
    obj.rectangle7:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("bevel");
    obj.rectangle7:setName("rectangle7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle7);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("#0e0e0e");
    obj.rectangle8:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle8:setXradius(3);
    obj.rectangle8:setYradius(3);
    obj.rectangle8:setStrokeColor("#272727");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setName("rectangle8");

    obj.nomeDis04 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeDis04:setParent(obj.rectangle8);
    obj.nomeDis04:setAlign("client");
    obj.nomeDis04:setTransparent(true);
    obj.nomeDis04:setField("fld04");
    obj.nomeDis04:setName("nomeDis04");
    obj.nomeDis04:setFontFamily("Constantia");
    obj.nomeDis04:setFontSize(13);

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle8);
    obj.dataLink9:setField("fld04");
    obj.dataLink9:setDefaultValue("Descrição do Poder");
    obj.dataLink9:setName("dataLink9");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMargins({bottom=5});
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMinWidth(220);
    obj.flowPart7:setMaxWidth(220);
    obj.flowPart7:setHeight(25);

    obj.nomeDis_05 = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeDis_05:setParent(obj.flowPart7);
    obj.nomeDis_05:setAlign("left");
    obj.nomeDis_05:setName("nomeDis_05");
    obj.nomeDis_05:setField("fldDisPod_05");
    obj.nomeDis_05:setWidth(220);
    obj.nomeDis_05:setFontSize(14);
    obj.nomeDis_05:setFontColor("#cdcdcd");
    obj.nomeDis_05:setTextTrimming("character");
    obj.nomeDis_05:setFontFamily("Constantia");
    obj.nomeDis_05:setTransparent(true);

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowPart7);
    obj.dataLink10:setField("fldDisPod_05");
    obj.dataLink10:setDefaultValue("—");
    obj.dataLink10:setName("dataLink10");

    obj.nomeBut05 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut05:setParent(obj.flowPart7);
    obj.nomeBut05:setName("nomeBut05");
    obj.nomeBut05:setText("𝐢");
    obj.nomeBut05:setWidth(22);
    obj.nomeBut05:setHeight(22);
    obj.nomeBut05:setTop(1);
    obj.nomeBut05:setLeft(191);
    obj.nomeBut05:setFontColor("#272727");

    obj.nomeBut05B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut05B:setParent(obj.flowPart7);
    obj.nomeBut05B:setName("nomeBut05B");
    obj.nomeBut05B:setText("𝐢");
    obj.nomeBut05B:setWidth(22);
    obj.nomeBut05B:setHeight(22);
    obj.nomeBut05B:setTop(1);
    obj.nomeBut05B:setLeft(191);
    obj.nomeBut05B:setFontColor("white");
    obj.nomeBut05B:setVisible(false);

    obj.popUp_05 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_05:setParent(obj.flowPart7);
    obj.popUp_05:setName("popUp_05");
    obj.popUp_05:setWidth(300);
    obj.popUp_05:setHeight(200);
    obj.popUp_05:setBackOpacity(0);
    obj.popUp_05:setDrawContainer(false);

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.popUp_05);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("#0e0e0e");
    obj.rectangle9:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(5);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setName("rectangle9");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle9);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("#0e0e0e");
    obj.rectangle10:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle10:setXradius(3);
    obj.rectangle10:setYradius(3);
    obj.rectangle10:setStrokeColor("#272727");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setName("rectangle10");

    obj.nomeDis05 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeDis05:setParent(obj.rectangle10);
    obj.nomeDis05:setAlign("client");
    obj.nomeDis05:setTransparent(true);
    obj.nomeDis05:setField("fld05");
    obj.nomeDis05:setName("nomeDis05");
    obj.nomeDis05:setFontFamily("Constantia");
    obj.nomeDis05:setFontSize(13);

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle10);
    obj.dataLink11:setField("fld05");
    obj.dataLink11:setDefaultValue("Descrição do Poder");
    obj.dataLink11:setName("dataLink11");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMargins({bottom=5});
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMinWidth(220);
    obj.flowPart8:setMaxWidth(220);
    obj.flowPart8:setHeight(25);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart8);
    obj.layout2:setAlign("right");
    obj.layout2:setWidth(22);
    obj.layout2:setHeight(22);
    obj.layout2:setMargins({right=7});
    obj.layout2:setName("layout2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setText("🞭");
    obj.button1:setWidth(22);
    obj.button1:setHeight(22);
    obj.button1:setHint("Apagar Disciplina");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nomeCheckDisc00_01:addEventListener("onClick",
        function (_)
            
            					sheet.fldCheckDisc00_01 = not sheet.fldCheckDisc00_01;
            					
            					if(sheet.fldCheckDisc00_02) then 
            						sheet.fldCheckDisc00_01 = true; 
            						sheet.fldCheckDisc00_02 = false; 
            						sheet.fldCheckDisc00_03 = false; 
            						sheet.fldCheckDisc00_04 = false; 
            						sheet.fldCheckDisc00_05 = false; 
            					end;
            				
        end, obj);

    obj._e_event1 = obj.nomeCheckDisc00_02:addEventListener("onClick",
        function (_)
            
            					sheet.fldCheckDisc00_02 = not sheet.fldCheckDisc00_02;
            					
            					if(sheet.fldCheckDisc00_02) then 
            						sheet.fldCheckDisc00_01 = true; 
            					else 
            						sheet.fldCheckDisc00_01 = false;
            					end;
            					
            					if(sheet.fldCheckDisc00_03) then 
            						sheet.fldCheckDisc00_01 = true; 
            						sheet.fldCheckDisc00_02 = true; 
            						sheet.fldCheckDisc00_03 = false; 
            						sheet.fldCheckDisc00_04 = false; 
            						sheet.fldCheckDisc00_05 = false; 
            					end;
            				
        end, obj);

    obj._e_event2 = obj.nomeCheckDisc00_03:addEventListener("onClick",
        function (_)
            
            					sheet.fldCheckDisc00_03 = not sheet.fldCheckDisc00_03;
            					
            					if(sheet.fldCheckDisc00_03) then 
            						sheet.fldCheckDisc00_01 = true; 
            						sheet.fldCheckDisc00_02 = true; 
            					else 
            						sheet.fldCheckDisc00_01 = false; 
            						sheet.fldCheckDisc00_02 = false; 
            					end;
            					
            					if(sheet.fldCheckDisc00_04) then 
            						sheet.fldCheckDisc00_01 = true; 
            						sheet.fldCheckDisc00_02 = true; 
            						sheet.fldCheckDisc00_03 = true; 
            						sheet.fldCheckDisc00_04 = false; 
            						sheet.fldCheckDisc00_05 = false; 
            					end;
            				
        end, obj);

    obj._e_event3 = obj.nomeCheckDisc00_04:addEventListener("onClick",
        function (_)
            
            					sheet.fldCheckDisc00_04 = not sheet.fldCheckDisc00_04;
            					
            					if(sheet.fldCheckDisc00_04) then 
            						sheet.fldCheckDisc00_01 = true; 
            						sheet.fldCheckDisc00_02 = true; 
            						sheet.fldCheckDisc00_03 = true; 
            					else 
            						sheet.fldCheckDisc00_01 = false; 
            						sheet.fldCheckDisc00_02 = false; 
            						sheet.fldCheckDisc00_03 = false; 
            					end;
            					
            					if(sheet.fldCheckDisc00_05) then 
            						sheet.fldCheckDisc00_01 = true; 
            						sheet.fldCheckDisc00_02 = true; 
            						sheet.fldCheckDisc00_03 = true; 
            						sheet.fldCheckDisc00_04 = true; 
            						sheet.fldCheckDisc00_05 = false; 
            					end;
            				
        end, obj);

    obj._e_event4 = obj.nomeCheckDisc00_05:addEventListener("onClick",
        function (_)
            
            					sheet.fldCheckDisc00_05 = not sheet.fldCheckDisc00_05;
            					
            					if(sheet.fldCheckDisc00_05) then 
            						sheet.fldCheckDisc00_01 = true; 
            						sheet.fldCheckDisc00_02 = true; 
            						sheet.fldCheckDisc00_03 = true; 
            						sheet.fldCheckDisc00_04 = true; 
            					else 
            						sheet.fldCheckDisc00_01 = false; 
            						sheet.fldCheckDisc00_02 = false; 
            						sheet.fldCheckDisc00_03 = false; 
            						sheet.fldCheckDisc00_04 = false; 
            					end;
            				
        end, obj);

    obj._e_event5 = obj.nomeBut01:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_01");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_01);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event6 = obj.nomeBut01B:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_01");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_01);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event7 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fld01 == nil or sheet.fld01 == "Descrição do Poder") then
            										self.nomeBut01.visible = true;
            										self.nomeBut01B.visible = false;
            									else
            										self.nomeBut01B.visible = true;
            										self.nomeBut01.visible = false;
            									end;
        end, obj);

    obj._e_event8 = obj.nomeBut02:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_02");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_02);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event9 = obj.nomeBut02B:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_02");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_02);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event10 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fld02 == nil or sheet.fld02 == "Descrição do Poder") then
            										self.nomeBut02.visible = true;
            										self.nomeBut02B.visible = false;
            									else
            										self.nomeBut02B.visible = true;
            										self.nomeBut02.visible = false;
            									end;
        end, obj);

    obj._e_event11 = obj.nomeBut03:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_03");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_03);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event12 = obj.nomeBut03B:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_03");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_03);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event13 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fld03 == nil or sheet.fld03 == "Descrição do Poder") then
            										self.nomeBut03.visible = true;
            										self.nomeBut03B.visible = false;
            									else
            										self.nomeBut03B.visible = true;
            										self.nomeBut03.visible = false;
            									end;
        end, obj);

    obj._e_event14 = obj.nomeBut04:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_04");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_04);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event15 = obj.nomeBut04B:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_04");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_04);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event16 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fld04 == nil or sheet.fld04 == "Descrição do Poder") then
            										self.nomeBut04.visible = true;
            										self.nomeBut04B.visible = false;
            									else
            										self.nomeBut04B.visible = true;
            										self.nomeBut04.visible = false;
            									end;
        end, obj);

    obj._e_event17 = obj.nomeBut05:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_05");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_05);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event18 = obj.nomeBut05B:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_05");
            					
            					if pop ~= nil then
            						pop:setNodeObject(sheet);
            						pop:showPopupEx("bottom", self.nomeDis_05);
            					else
            						showMessage("Ops, não encontrei o pop-up para exibir");
            					end;
        end, obj);

    obj._e_event19 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fld05 == nil or sheet.fld05 == "Descrição do Poder") then
            										self.nomeBut05.visible = true;
            										self.nomeBut05B.visible = false;
            									else
            										self.nomeBut05B.visible = true;
            										self.nomeBut05.visible = false;
            									end;
        end, obj);

    obj._e_event20 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
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

        if self.nomeDis04 ~= nil then self.nomeDis04:destroy(); self.nomeDis04 = nil; end;
        if self.nomeDis_05 ~= nil then self.nomeDis_05:destroy(); self.nomeDis_05 = nil; end;
        if self.nomeCheckDisc00_04 ~= nil then self.nomeCheckDisc00_04:destroy(); self.nomeCheckDisc00_04 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.nomeBut01B ~= nil then self.nomeBut01B:destroy(); self.nomeBut01B = nil; end;
        if self.nomeBut05B ~= nil then self.nomeBut05B:destroy(); self.nomeBut05B = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.nomeDis01 ~= nil then self.nomeDis01:destroy(); self.nomeDis01 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.nomeBut02 ~= nil then self.nomeBut02:destroy(); self.nomeBut02 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.popUp_04 ~= nil then self.popUp_04:destroy(); self.popUp_04 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.nomeDis_01 ~= nil then self.nomeDis_01:destroy(); self.nomeDis_01 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.nomeBut05 ~= nil then self.nomeBut05:destroy(); self.nomeBut05 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.nomeDis_02 ~= nil then self.nomeDis_02:destroy(); self.nomeDis_02 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.nomeBut04 ~= nil then self.nomeBut04:destroy(); self.nomeBut04 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.nomeCheckDisc00_03 ~= nil then self.nomeCheckDisc00_03:destroy(); self.nomeCheckDisc00_03 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.nomeBut04B ~= nil then self.nomeBut04B:destroy(); self.nomeBut04B = nil; end;
        if self.popUp_01 ~= nil then self.popUp_01:destroy(); self.popUp_01 = nil; end;
        if self.nomeBut03 ~= nil then self.nomeBut03:destroy(); self.nomeBut03 = nil; end;
        if self.nomeBut02B ~= nil then self.nomeBut02B:destroy(); self.nomeBut02B = nil; end;
        if self.popUp_02 ~= nil then self.popUp_02:destroy(); self.popUp_02 = nil; end;
        if self.nomeDis_03 ~= nil then self.nomeDis_03:destroy(); self.nomeDis_03 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.nomeDis05 ~= nil then self.nomeDis05:destroy(); self.nomeDis05 = nil; end;
        if self.nomeCheckDisc00_02 ~= nil then self.nomeCheckDisc00_02:destroy(); self.nomeCheckDisc00_02 = nil; end;
        if self.popUp_03 ~= nil then self.popUp_03:destroy(); self.popUp_03 = nil; end;
        if self.nomeDis_04 ~= nil then self.nomeDis_04:destroy(); self.nomeDis_04 = nil; end;
        if self.popUp_05 ~= nil then self.popUp_05:destroy(); self.popUp_05 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.nomeBut01 ~= nil then self.nomeBut01:destroy(); self.nomeBut01 = nil; end;
        if self.nomeDis02 ~= nil then self.nomeDis02:destroy(); self.nomeDis02 = nil; end;
        if self.nomeBut03B ~= nil then self.nomeBut03B:destroy(); self.nomeBut03B = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.nomeCheckDisc00_01 ~= nil then self.nomeCheckDisc00_01:destroy(); self.nomeCheckDisc00_01 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.nomeDis03 ~= nil then self.nomeDis03:destroy(); self.nomeDis03 = nil; end;
        if self.nomeCheckDisc00_05 ~= nil then self.nomeCheckDisc00_05:destroy(); self.nomeCheckDisc00_05 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newdisciplinas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_disciplinas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _disciplinas = {
    newEditor = newdisciplinas, 
    new = newdisciplinas, 
    name = "disciplinas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

disciplinas = _disciplinas;
Firecast.registrarForm(_disciplinas);

return _disciplinas;
