require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTemplate()
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
    obj:setName("frmTemplate");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.Shadowrun5E");
    obj:setTitle("Ficha Shadowrun 5E");
    obj:setAlign("client");
    obj:setTheme("dark");


        local function isNewVersion(installed, downloaded)
            local installedVersion = {};
            local installedIndex = 0;
            for i in string.gmatch(installed, "[^%.]+") do
                installedIndex = installedIndex +1;
                installedVersion[installedIndex] = i;
            end

            local downloadedVersion = {};
            local downloadedIndex = 0;
            for i in string.gmatch(downloaded, "[^%.]+") do
                downloadedIndex = downloadedIndex +1;
                downloadedVersion[downloadedIndex] = i;
            end

            for i=1, math.min(installedIndex, downloadedIndex), 1 do 
                if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
                    return false;
                elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
                    return true;
                end;
            end;

            if downloadedIndex > installedIndex then
                return true;
            else
                return false;
            end;
        end;
        


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("General");
    obj.tab1:setName("tab1");

    obj.frmGeneral = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeneral:setParent(obj.tab1);
    obj.frmGeneral:setName("frmGeneral");
    obj.frmGeneral:setAlign("client");

    obj.popupPhysical = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupPhysical:setParent(obj.frmGeneral);
    obj.popupPhysical:setName("popupPhysical");
    obj.popupPhysical:setWidth(400);
    obj.popupPhysical:setHeight(130);
    obj.popupPhysical:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popupPhysical, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popupPhysical);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(8);
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
    obj.label1:setText("Max");
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
    obj.label2:setText("Base");
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
    obj.label3:setText("Initial");
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
    obj.label4:setText("Karma");
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
    obj.label5:setText("Other");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(20);
    obj.flowPart6:setMaxWidth(20);
    obj.flowPart6:setHeight(15);
    obj.flowPart6:setName("flowPart6");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(50);
    obj.flowPart7:setMaxWidth(50);
    obj.flowPart7:setHeight(15);
    obj.flowPart7:setName("flowPart7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart7);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Augment");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(50);
    obj.flowPart8:setMaxWidth(50);
    obj.flowPart8:setHeight(15);
    obj.flowPart8:setName("flowPart8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart8);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Misc");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popupPhysical);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(8);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setMinWidth(50);
    obj.flowPart9:setMaxWidth(50);
    obj.flowPart9:setHeight(20);
    obj.flowPart9:setName("flowPart9");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart9);
    obj.edit1:setAlign("client");
    obj.edit1:setField("attribute_body_max");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout2);
    obj.flowPart10:setMinWidth(50);
    obj.flowPart10:setMaxWidth(50);
    obj.flowPart10:setHeight(20);
    obj.flowPart10:setName("flowPart10");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart10);
    obj.edit2:setAlign("client");
    obj.edit2:setField("attribute_body_base");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout2);
    obj.flowPart11:setMinWidth(50);
    obj.flowPart11:setMaxWidth(50);
    obj.flowPart11:setHeight(20);
    obj.flowPart11:setName("flowPart11");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart11);
    obj.edit3:setAlign("client");
    obj.edit3:setField("attribute_body_initial");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout2);
    obj.flowPart12:setMinWidth(50);
    obj.flowPart12:setMaxWidth(50);
    obj.flowPart12:setHeight(20);
    obj.flowPart12:setName("flowPart12");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart12);
    obj.edit4:setAlign("client");
    obj.edit4:setField("attribute_body_karma");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout2);
    obj.flowPart13:setMinWidth(50);
    obj.flowPart13:setMaxWidth(50);
    obj.flowPart13:setHeight(20);
    obj.flowPart13:setName("flowPart13");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart13);
    obj.edit5:setAlign("client");
    obj.edit5:setField("attribute_body_other");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setMinWidth(20);
    obj.flowPart14:setMaxWidth(20);
    obj.flowPart14:setHeight(20);
    obj.flowPart14:setName("flowPart14");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(50);
    obj.flowPart15:setMaxWidth(50);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setName("flowPart15");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart15);
    obj.edit6:setAlign("client");
    obj.edit6:setField("attribute_body_augmented");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(12);
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(50);
    obj.flowPart16:setMaxWidth(50);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setName("flowPart16");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart16);
    obj.edit7:setAlign("client");
    obj.edit7:setField("attribute_body_misc");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(12);
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.popupPhysical);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxControlsPerLine(8);
    obj.flowLayout3:setMargins({bottom=4});
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout3);
    obj.flowPart17:setMinWidth(50);
    obj.flowPart17:setMaxWidth(50);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart17);
    obj.edit8:setAlign("client");
    obj.edit8:setField("attribute_agility_max");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(12);
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout3);
    obj.flowPart18:setMinWidth(50);
    obj.flowPart18:setMaxWidth(50);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setName("flowPart18");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart18);
    obj.edit9:setAlign("client");
    obj.edit9:setField("attribute_agility_base");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(12);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout3);
    obj.flowPart19:setMinWidth(50);
    obj.flowPart19:setMaxWidth(50);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart19);
    obj.edit10:setAlign("client");
    obj.edit10:setField("attribute_agility_initial");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(12);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout3);
    obj.flowPart20:setMinWidth(50);
    obj.flowPart20:setMaxWidth(50);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setName("flowPart20");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart20);
    obj.edit11:setAlign("client");
    obj.edit11:setField("attribute_agility_karma");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(12);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout3);
    obj.flowPart21:setMinWidth(50);
    obj.flowPart21:setMaxWidth(50);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setName("flowPart21");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart21);
    obj.edit12:setAlign("client");
    obj.edit12:setField("attribute_agility_other");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(12);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout3);
    obj.flowPart22:setMinWidth(20);
    obj.flowPart22:setMaxWidth(20);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setName("flowPart22");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout3);
    obj.flowPart23:setMinWidth(50);
    obj.flowPart23:setMaxWidth(50);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart23);
    obj.edit13:setAlign("client");
    obj.edit13:setField("attribute_agility_augmented");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(12);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout3);
    obj.flowPart24:setMinWidth(50);
    obj.flowPart24:setMaxWidth(50);
    obj.flowPart24:setHeight(20);
    obj.flowPart24:setName("flowPart24");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart24);
    obj.edit14:setAlign("client");
    obj.edit14:setField("attribute_agility_misc");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(12);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.popupPhysical);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxControlsPerLine(8);
    obj.flowLayout4:setMargins({bottom=4});
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout4);
    obj.flowPart25:setMinWidth(50);
    obj.flowPart25:setMaxWidth(50);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart25);
    obj.edit15:setAlign("client");
    obj.edit15:setField("attribute_reaction_max");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(12);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout4);
    obj.flowPart26:setMinWidth(50);
    obj.flowPart26:setMaxWidth(50);
    obj.flowPart26:setHeight(20);
    obj.flowPart26:setName("flowPart26");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart26);
    obj.edit16:setAlign("client");
    obj.edit16:setField("attribute_reaction_base");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(12);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout4);
    obj.flowPart27:setMinWidth(50);
    obj.flowPart27:setMaxWidth(50);
    obj.flowPart27:setHeight(20);
    obj.flowPart27:setName("flowPart27");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart27);
    obj.edit17:setAlign("client");
    obj.edit17:setField("attribute_reaction_initial");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(12);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout4);
    obj.flowPart28:setMinWidth(50);
    obj.flowPart28:setMaxWidth(50);
    obj.flowPart28:setHeight(20);
    obj.flowPart28:setName("flowPart28");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart28);
    obj.edit18:setAlign("client");
    obj.edit18:setField("attribute_reaction_karma");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(12);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout4);
    obj.flowPart29:setMinWidth(50);
    obj.flowPart29:setMaxWidth(50);
    obj.flowPart29:setHeight(20);
    obj.flowPart29:setName("flowPart29");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart29);
    obj.edit19:setAlign("client");
    obj.edit19:setField("attribute_reaction_other");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(12);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout4);
    obj.flowPart30:setMinWidth(20);
    obj.flowPart30:setMaxWidth(20);
    obj.flowPart30:setHeight(20);
    obj.flowPart30:setName("flowPart30");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout4);
    obj.flowPart31:setMinWidth(50);
    obj.flowPart31:setMaxWidth(50);
    obj.flowPart31:setHeight(20);
    obj.flowPart31:setName("flowPart31");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart31);
    obj.edit20:setAlign("client");
    obj.edit20:setField("attribute_reaction_augmented");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(12);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout4);
    obj.flowPart32:setMinWidth(50);
    obj.flowPart32:setMaxWidth(50);
    obj.flowPart32:setHeight(20);
    obj.flowPart32:setName("flowPart32");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart32);
    obj.edit21:setAlign("client");
    obj.edit21:setField("attribute_reaction_misc");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(12);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.popupPhysical);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxControlsPerLine(8);
    obj.flowLayout5:setMargins({bottom=4});
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout5);
    obj.flowPart33:setMinWidth(50);
    obj.flowPart33:setMaxWidth(50);
    obj.flowPart33:setHeight(20);
    obj.flowPart33:setName("flowPart33");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart33);
    obj.edit22:setAlign("client");
    obj.edit22:setField("attribute_strenght_max");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(12);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout5);
    obj.flowPart34:setMinWidth(50);
    obj.flowPart34:setMaxWidth(50);
    obj.flowPart34:setHeight(20);
    obj.flowPart34:setName("flowPart34");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart34);
    obj.edit23:setAlign("client");
    obj.edit23:setField("attribute_strenght_base");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(12);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout5);
    obj.flowPart35:setMinWidth(50);
    obj.flowPart35:setMaxWidth(50);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setName("flowPart35");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart35);
    obj.edit24:setAlign("client");
    obj.edit24:setField("attribute_strenght_initial");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(12);
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout5);
    obj.flowPart36:setMinWidth(50);
    obj.flowPart36:setMaxWidth(50);
    obj.flowPart36:setHeight(20);
    obj.flowPart36:setName("flowPart36");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart36);
    obj.edit25:setAlign("client");
    obj.edit25:setField("attribute_strenght_karma");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(12);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout5);
    obj.flowPart37:setMinWidth(50);
    obj.flowPart37:setMaxWidth(50);
    obj.flowPart37:setHeight(20);
    obj.flowPart37:setName("flowPart37");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart37);
    obj.edit26:setAlign("client");
    obj.edit26:setField("attribute_strenght_other");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(12);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout5);
    obj.flowPart38:setMinWidth(20);
    obj.flowPart38:setMaxWidth(20);
    obj.flowPart38:setHeight(20);
    obj.flowPart38:setName("flowPart38");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout5);
    obj.flowPart39:setMinWidth(50);
    obj.flowPart39:setMaxWidth(50);
    obj.flowPart39:setHeight(20);
    obj.flowPart39:setName("flowPart39");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart39);
    obj.edit27:setAlign("client");
    obj.edit27:setField("attribute_strenght_augmented");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(12);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout5);
    obj.flowPart40:setMinWidth(50);
    obj.flowPart40:setMaxWidth(50);
    obj.flowPart40:setHeight(20);
    obj.flowPart40:setName("flowPart40");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart40);
    obj.edit28:setAlign("client");
    obj.edit28:setField("attribute_strenght_misc");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(12);
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.popupMental = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupMental:setParent(obj.frmGeneral);
    obj.popupMental:setName("popupMental");
    obj.popupMental:setWidth(400);
    obj.popupMental:setHeight(130);
    obj.popupMental:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popupMental, "autoScopeNode",  "false");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.popupMental);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxControlsPerLine(8);
    obj.flowLayout6:setMargins({bottom=4});
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout6);
    obj.flowPart41:setMinWidth(50);
    obj.flowPart41:setMaxWidth(50);
    obj.flowPart41:setHeight(15);
    obj.flowPart41:setName("flowPart41");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart41);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Max");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout6);
    obj.flowPart42:setMinWidth(50);
    obj.flowPart42:setMaxWidth(50);
    obj.flowPart42:setHeight(15);
    obj.flowPart42:setName("flowPart42");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart42);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(10);
    obj.label9:setText("Base");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout6);
    obj.flowPart43:setMinWidth(50);
    obj.flowPart43:setMaxWidth(50);
    obj.flowPart43:setHeight(15);
    obj.flowPart43:setName("flowPart43");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart43);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Initial");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout6);
    obj.flowPart44:setMinWidth(50);
    obj.flowPart44:setMaxWidth(50);
    obj.flowPart44:setHeight(15);
    obj.flowPart44:setName("flowPart44");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart44);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(10);
    obj.label11:setText("Karma");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout6);
    obj.flowPart45:setMinWidth(50);
    obj.flowPart45:setMaxWidth(50);
    obj.flowPart45:setHeight(15);
    obj.flowPart45:setName("flowPart45");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart45);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Other");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout6);
    obj.flowPart46:setMinWidth(20);
    obj.flowPart46:setMaxWidth(20);
    obj.flowPart46:setHeight(15);
    obj.flowPart46:setName("flowPart46");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout6);
    obj.flowPart47:setMinWidth(50);
    obj.flowPart47:setMaxWidth(50);
    obj.flowPart47:setHeight(15);
    obj.flowPart47:setName("flowPart47");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart47);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(10);
    obj.label13:setText("Augment");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout6);
    obj.flowPart48:setMinWidth(50);
    obj.flowPart48:setMaxWidth(50);
    obj.flowPart48:setHeight(15);
    obj.flowPart48:setName("flowPart48");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart48);
    obj.label14:setAlign("top");
    obj.label14:setFontSize(10);
    obj.label14:setText("Misc");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setWordWrap(true);
    obj.label14:setTextTrimming("none");
    obj.label14:setAutoSize(true);
    obj.label14:setName("label14");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.popupMental);
    obj.flowLayout7:setAlign("top");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMaxControlsPerLine(8);
    obj.flowLayout7:setMargins({bottom=4});
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setName("flowLayout7");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout7);
    obj.flowPart49:setMinWidth(50);
    obj.flowPart49:setMaxWidth(50);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setName("flowPart49");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart49);
    obj.edit29:setAlign("client");
    obj.edit29:setField("attribute_charisma_max");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(12);
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout7);
    obj.flowPart50:setMinWidth(50);
    obj.flowPart50:setMaxWidth(50);
    obj.flowPart50:setHeight(20);
    obj.flowPart50:setName("flowPart50");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart50);
    obj.edit30:setAlign("client");
    obj.edit30:setField("attribute_charisma_base");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(12);
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout7);
    obj.flowPart51:setMinWidth(50);
    obj.flowPart51:setMaxWidth(50);
    obj.flowPart51:setHeight(20);
    obj.flowPart51:setName("flowPart51");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart51);
    obj.edit31:setAlign("client");
    obj.edit31:setField("attribute_charisma_initial");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(12);
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout7);
    obj.flowPart52:setMinWidth(50);
    obj.flowPart52:setMaxWidth(50);
    obj.flowPart52:setHeight(20);
    obj.flowPart52:setName("flowPart52");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart52);
    obj.edit32:setAlign("client");
    obj.edit32:setField("attribute_charisma_karma");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(12);
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout7);
    obj.flowPart53:setMinWidth(50);
    obj.flowPart53:setMaxWidth(50);
    obj.flowPart53:setHeight(20);
    obj.flowPart53:setName("flowPart53");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart53);
    obj.edit33:setAlign("client");
    obj.edit33:setField("attribute_charisma_other");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(12);
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout7);
    obj.flowPart54:setMinWidth(20);
    obj.flowPart54:setMaxWidth(20);
    obj.flowPart54:setHeight(20);
    obj.flowPart54:setName("flowPart54");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout7);
    obj.flowPart55:setMinWidth(50);
    obj.flowPart55:setMaxWidth(50);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setName("flowPart55");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart55);
    obj.edit34:setAlign("client");
    obj.edit34:setField("attribute_charisma_augmented");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(12);
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout7);
    obj.flowPart56:setMinWidth(50);
    obj.flowPart56:setMaxWidth(50);
    obj.flowPart56:setHeight(20);
    obj.flowPart56:setName("flowPart56");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart56);
    obj.edit35:setAlign("client");
    obj.edit35:setField("attribute_charisma_misc");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontSize(12);
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.popupMental);
    obj.flowLayout8:setAlign("top");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setMaxControlsPerLine(8);
    obj.flowLayout8:setMargins({bottom=4});
    obj.flowLayout8:setHorzAlign("center");
    obj.flowLayout8:setName("flowLayout8");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout8);
    obj.flowPart57:setMinWidth(50);
    obj.flowPart57:setMaxWidth(50);
    obj.flowPart57:setHeight(20);
    obj.flowPart57:setName("flowPart57");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart57);
    obj.edit36:setAlign("client");
    obj.edit36:setField("attribute_intuition_max");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontSize(12);
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout8);
    obj.flowPart58:setMinWidth(50);
    obj.flowPart58:setMaxWidth(50);
    obj.flowPart58:setHeight(20);
    obj.flowPart58:setName("flowPart58");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart58);
    obj.edit37:setAlign("client");
    obj.edit37:setField("attribute_intuition_base");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(12);
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout8);
    obj.flowPart59:setMinWidth(50);
    obj.flowPart59:setMaxWidth(50);
    obj.flowPart59:setHeight(20);
    obj.flowPart59:setName("flowPart59");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart59);
    obj.edit38:setAlign("client");
    obj.edit38:setField("attribute_intuition_initial");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontSize(12);
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout8);
    obj.flowPart60:setMinWidth(50);
    obj.flowPart60:setMaxWidth(50);
    obj.flowPart60:setHeight(20);
    obj.flowPart60:setName("flowPart60");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart60);
    obj.edit39:setAlign("client");
    obj.edit39:setField("attribute_intuition_karma");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontSize(12);
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout8);
    obj.flowPart61:setMinWidth(50);
    obj.flowPart61:setMaxWidth(50);
    obj.flowPart61:setHeight(20);
    obj.flowPart61:setName("flowPart61");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart61);
    obj.edit40:setAlign("client");
    obj.edit40:setField("attribute_intuition_other");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontSize(12);
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout8);
    obj.flowPart62:setMinWidth(20);
    obj.flowPart62:setMaxWidth(20);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setName("flowPart62");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout8);
    obj.flowPart63:setMinWidth(50);
    obj.flowPart63:setMaxWidth(50);
    obj.flowPart63:setHeight(20);
    obj.flowPart63:setName("flowPart63");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart63);
    obj.edit41:setAlign("client");
    obj.edit41:setField("attribute_intuition_augmented");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(12);
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout8);
    obj.flowPart64:setMinWidth(50);
    obj.flowPart64:setMaxWidth(50);
    obj.flowPart64:setHeight(20);
    obj.flowPart64:setName("flowPart64");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart64);
    obj.edit42:setAlign("client");
    obj.edit42:setField("attribute_intuition_misc");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontSize(12);
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.popupMental);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxControlsPerLine(8);
    obj.flowLayout9:setMargins({bottom=4});
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setName("flowLayout9");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout9);
    obj.flowPart65:setMinWidth(50);
    obj.flowPart65:setMaxWidth(50);
    obj.flowPart65:setHeight(20);
    obj.flowPart65:setName("flowPart65");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart65);
    obj.edit43:setAlign("client");
    obj.edit43:setField("attribute_logic_max");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(12);
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout9);
    obj.flowPart66:setMinWidth(50);
    obj.flowPart66:setMaxWidth(50);
    obj.flowPart66:setHeight(20);
    obj.flowPart66:setName("flowPart66");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart66);
    obj.edit44:setAlign("client");
    obj.edit44:setField("attribute_logic_base");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(12);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout9);
    obj.flowPart67:setMinWidth(50);
    obj.flowPart67:setMaxWidth(50);
    obj.flowPart67:setHeight(20);
    obj.flowPart67:setName("flowPart67");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart67);
    obj.edit45:setAlign("client");
    obj.edit45:setField("attribute_logic_initial");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontSize(12);
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout9);
    obj.flowPart68:setMinWidth(50);
    obj.flowPart68:setMaxWidth(50);
    obj.flowPart68:setHeight(20);
    obj.flowPart68:setName("flowPart68");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart68);
    obj.edit46:setAlign("client");
    obj.edit46:setField("attribute_logic_karma");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(12);
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout9);
    obj.flowPart69:setMinWidth(50);
    obj.flowPart69:setMaxWidth(50);
    obj.flowPart69:setHeight(20);
    obj.flowPart69:setName("flowPart69");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart69);
    obj.edit47:setAlign("client");
    obj.edit47:setField("attribute_logic_other");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontSize(12);
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout9);
    obj.flowPart70:setMinWidth(20);
    obj.flowPart70:setMaxWidth(20);
    obj.flowPart70:setHeight(20);
    obj.flowPart70:setName("flowPart70");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout9);
    obj.flowPart71:setMinWidth(50);
    obj.flowPart71:setMaxWidth(50);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setName("flowPart71");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart71);
    obj.edit48:setAlign("client");
    obj.edit48:setField("attribute_logic_augmented");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontSize(12);
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout9);
    obj.flowPart72:setMinWidth(50);
    obj.flowPart72:setMaxWidth(50);
    obj.flowPart72:setHeight(20);
    obj.flowPart72:setName("flowPart72");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart72);
    obj.edit49:setAlign("client");
    obj.edit49:setField("attribute_logic_misc");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontSize(12);
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.popupMental);
    obj.flowLayout10:setAlign("top");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxControlsPerLine(8);
    obj.flowLayout10:setMargins({bottom=4});
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setName("flowLayout10");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout10);
    obj.flowPart73:setMinWidth(50);
    obj.flowPart73:setMaxWidth(50);
    obj.flowPart73:setHeight(20);
    obj.flowPart73:setName("flowPart73");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart73);
    obj.edit50:setAlign("client");
    obj.edit50:setField("attribute_willpower_max");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontSize(12);
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout10);
    obj.flowPart74:setMinWidth(50);
    obj.flowPart74:setMaxWidth(50);
    obj.flowPart74:setHeight(20);
    obj.flowPart74:setName("flowPart74");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart74);
    obj.edit51:setAlign("client");
    obj.edit51:setField("attribute_willpower_base");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontSize(12);
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout10);
    obj.flowPart75:setMinWidth(50);
    obj.flowPart75:setMaxWidth(50);
    obj.flowPart75:setHeight(20);
    obj.flowPart75:setName("flowPart75");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart75);
    obj.edit52:setAlign("client");
    obj.edit52:setField("attribute_willpower_initial");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontSize(12);
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout10);
    obj.flowPart76:setMinWidth(50);
    obj.flowPart76:setMaxWidth(50);
    obj.flowPart76:setHeight(20);
    obj.flowPart76:setName("flowPart76");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart76);
    obj.edit53:setAlign("client");
    obj.edit53:setField("attribute_willpower_karma");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontSize(12);
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout10);
    obj.flowPart77:setMinWidth(50);
    obj.flowPart77:setMaxWidth(50);
    obj.flowPart77:setHeight(20);
    obj.flowPart77:setName("flowPart77");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart77);
    obj.edit54:setAlign("client");
    obj.edit54:setField("attribute_willpower_other");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontSize(12);
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout10);
    obj.flowPart78:setMinWidth(20);
    obj.flowPart78:setMaxWidth(20);
    obj.flowPart78:setHeight(20);
    obj.flowPart78:setName("flowPart78");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout10);
    obj.flowPart79:setMinWidth(50);
    obj.flowPart79:setMaxWidth(50);
    obj.flowPart79:setHeight(20);
    obj.flowPart79:setName("flowPart79");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart79);
    obj.edit55:setAlign("client");
    obj.edit55:setField("attribute_willpower_augmented");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setFontSize(12);
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout10);
    obj.flowPart80:setMinWidth(50);
    obj.flowPart80:setMaxWidth(50);
    obj.flowPart80:setHeight(20);
    obj.flowPart80:setName("flowPart80");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart80);
    obj.edit56:setAlign("client");
    obj.edit56:setField("attribute_willpower_misc");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontSize(12);
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.popupSpecial = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupSpecial:setParent(obj.frmGeneral);
    obj.popupSpecial:setName("popupSpecial");
    obj.popupSpecial:setWidth(400);
    obj.popupSpecial:setHeight(130);
    obj.popupSpecial:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popupSpecial, "autoScopeNode",  "false");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.popupSpecial);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxControlsPerLine(8);
    obj.flowLayout11:setMargins({bottom=4});
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setName("flowLayout11");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout11);
    obj.flowPart81:setMinWidth(50);
    obj.flowPart81:setMaxWidth(50);
    obj.flowPart81:setHeight(15);
    obj.flowPart81:setName("flowPart81");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart81);
    obj.label15:setAlign("top");
    obj.label15:setFontSize(10);
    obj.label15:setText("Max");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWordWrap(true);
    obj.label15:setTextTrimming("none");
    obj.label15:setAutoSize(true);
    obj.label15:setName("label15");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout11);
    obj.flowPart82:setMinWidth(50);
    obj.flowPart82:setMaxWidth(50);
    obj.flowPart82:setHeight(15);
    obj.flowPart82:setName("flowPart82");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart82);
    obj.label16:setAlign("top");
    obj.label16:setFontSize(10);
    obj.label16:setText("Base");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setWordWrap(true);
    obj.label16:setTextTrimming("none");
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout11);
    obj.flowPart83:setMinWidth(50);
    obj.flowPart83:setMaxWidth(50);
    obj.flowPart83:setHeight(15);
    obj.flowPart83:setName("flowPart83");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart83);
    obj.label17:setAlign("top");
    obj.label17:setFontSize(10);
    obj.label17:setText("Initial");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setWordWrap(true);
    obj.label17:setTextTrimming("none");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout11);
    obj.flowPart84:setMinWidth(50);
    obj.flowPart84:setMaxWidth(50);
    obj.flowPart84:setHeight(15);
    obj.flowPart84:setName("flowPart84");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart84);
    obj.label18:setAlign("top");
    obj.label18:setFontSize(10);
    obj.label18:setText("Karma");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWordWrap(true);
    obj.label18:setTextTrimming("none");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout11);
    obj.flowPart85:setMinWidth(50);
    obj.flowPart85:setMaxWidth(50);
    obj.flowPart85:setHeight(15);
    obj.flowPart85:setName("flowPart85");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart85);
    obj.label19:setAlign("top");
    obj.label19:setFontSize(10);
    obj.label19:setText("Other");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setWordWrap(true);
    obj.label19:setTextTrimming("none");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout11);
    obj.flowPart86:setMinWidth(20);
    obj.flowPart86:setMaxWidth(20);
    obj.flowPart86:setHeight(15);
    obj.flowPart86:setName("flowPart86");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout11);
    obj.flowPart87:setMinWidth(50);
    obj.flowPart87:setMaxWidth(50);
    obj.flowPart87:setHeight(15);
    obj.flowPart87:setName("flowPart87");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart87);
    obj.label20:setAlign("top");
    obj.label20:setFontSize(10);
    obj.label20:setText("Augment");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWordWrap(true);
    obj.label20:setTextTrimming("none");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout11);
    obj.flowPart88:setMinWidth(50);
    obj.flowPart88:setMaxWidth(50);
    obj.flowPart88:setHeight(15);
    obj.flowPart88:setName("flowPart88");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart88);
    obj.label21:setAlign("top");
    obj.label21:setFontSize(10);
    obj.label21:setText("Misc");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWordWrap(true);
    obj.label21:setTextTrimming("none");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.popupSpecial);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMaxControlsPerLine(8);
    obj.flowLayout12:setMargins({bottom=4});
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setName("flowLayout12");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout12);
    obj.flowPart89:setMinWidth(50);
    obj.flowPart89:setMaxWidth(50);
    obj.flowPart89:setHeight(20);
    obj.flowPart89:setName("flowPart89");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart89);
    obj.edit57:setAlign("client");
    obj.edit57:setField("attribute_edge_max");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setFontSize(12);
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout12);
    obj.flowPart90:setMinWidth(50);
    obj.flowPart90:setMaxWidth(50);
    obj.flowPart90:setHeight(20);
    obj.flowPart90:setName("flowPart90");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart90);
    obj.edit58:setAlign("client");
    obj.edit58:setField("attribute_edge_base");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(12);
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout12);
    obj.flowPart91:setMinWidth(50);
    obj.flowPart91:setMaxWidth(50);
    obj.flowPart91:setHeight(20);
    obj.flowPart91:setName("flowPart91");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart91);
    obj.edit59:setAlign("client");
    obj.edit59:setField("attribute_edge_initial");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setFontSize(12);
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout12);
    obj.flowPart92:setMinWidth(50);
    obj.flowPart92:setMaxWidth(50);
    obj.flowPart92:setHeight(20);
    obj.flowPart92:setName("flowPart92");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart92);
    obj.edit60:setAlign("client");
    obj.edit60:setField("attribute_edge_karma");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(12);
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout12);
    obj.flowPart93:setMinWidth(50);
    obj.flowPart93:setMaxWidth(50);
    obj.flowPart93:setHeight(20);
    obj.flowPart93:setName("flowPart93");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart93);
    obj.edit61:setAlign("client");
    obj.edit61:setField("attribute_edge_other");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontSize(12);
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout12);
    obj.flowPart94:setMinWidth(20);
    obj.flowPart94:setMaxWidth(20);
    obj.flowPart94:setHeight(20);
    obj.flowPart94:setName("flowPart94");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout12);
    obj.flowPart95:setMinWidth(50);
    obj.flowPart95:setMaxWidth(50);
    obj.flowPart95:setHeight(20);
    obj.flowPart95:setName("flowPart95");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart95);
    obj.edit62:setAlign("client");
    obj.edit62:setField("attribute_edge_augmented");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontSize(12);
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout12);
    obj.flowPart96:setMinWidth(50);
    obj.flowPart96:setMaxWidth(50);
    obj.flowPart96:setHeight(20);
    obj.flowPart96:setName("flowPart96");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart96);
    obj.edit63:setAlign("client");
    obj.edit63:setField("attribute_edge_misc");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontSize(12);
    obj.edit63:setType("number");
    obj.edit63:setName("edit63");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.popupSpecial);
    obj.flowLayout13:setAlign("top");
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMaxControlsPerLine(8);
    obj.flowLayout13:setMargins({bottom=4});
    obj.flowLayout13:setHorzAlign("center");
    obj.flowLayout13:setName("flowLayout13");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout13);
    obj.flowPart97:setMinWidth(50);
    obj.flowPart97:setMaxWidth(50);
    obj.flowPart97:setHeight(20);
    obj.flowPart97:setName("flowPart97");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart97);
    obj.edit64:setAlign("client");
    obj.edit64:setField("attribute_magic_max");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontSize(12);
    obj.edit64:setType("number");
    obj.edit64:setName("edit64");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout13);
    obj.flowPart98:setMinWidth(50);
    obj.flowPart98:setMaxWidth(50);
    obj.flowPart98:setHeight(20);
    obj.flowPart98:setName("flowPart98");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart98);
    obj.edit65:setAlign("client");
    obj.edit65:setField("attribute_magic_base");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontSize(12);
    obj.edit65:setType("number");
    obj.edit65:setName("edit65");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout13);
    obj.flowPart99:setMinWidth(50);
    obj.flowPart99:setMaxWidth(50);
    obj.flowPart99:setHeight(20);
    obj.flowPart99:setName("flowPart99");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.flowPart99);
    obj.edit66:setAlign("client");
    obj.edit66:setField("attribute_magic_initial");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontSize(12);
    obj.edit66:setType("number");
    obj.edit66:setName("edit66");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout13);
    obj.flowPart100:setMinWidth(50);
    obj.flowPart100:setMaxWidth(50);
    obj.flowPart100:setHeight(20);
    obj.flowPart100:setName("flowPart100");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.flowPart100);
    obj.edit67:setAlign("client");
    obj.edit67:setField("attribute_magic_karma");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontSize(12);
    obj.edit67:setType("number");
    obj.edit67:setName("edit67");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout13);
    obj.flowPart101:setMinWidth(50);
    obj.flowPart101:setMaxWidth(50);
    obj.flowPart101:setHeight(20);
    obj.flowPart101:setName("flowPart101");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.flowPart101);
    obj.edit68:setAlign("client");
    obj.edit68:setField("attribute_magic_other");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontSize(12);
    obj.edit68:setType("number");
    obj.edit68:setName("edit68");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout13);
    obj.flowPart102:setMinWidth(20);
    obj.flowPart102:setMaxWidth(20);
    obj.flowPart102:setHeight(20);
    obj.flowPart102:setName("flowPart102");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout13);
    obj.flowPart103:setMinWidth(50);
    obj.flowPart103:setMaxWidth(50);
    obj.flowPart103:setHeight(20);
    obj.flowPart103:setName("flowPart103");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart103);
    obj.edit69:setAlign("client");
    obj.edit69:setField("attribute_magic_augmented");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontSize(12);
    obj.edit69:setType("number");
    obj.edit69:setName("edit69");

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout13);
    obj.flowPart104:setMinWidth(50);
    obj.flowPart104:setMaxWidth(50);
    obj.flowPart104:setHeight(20);
    obj.flowPart104:setName("flowPart104");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart104);
    obj.edit70:setAlign("client");
    obj.edit70:setField("attribute_magic_misc");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontSize(12);
    obj.edit70:setType("number");
    obj.edit70:setName("edit70");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.popupSpecial);
    obj.flowLayout14:setAlign("top");
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxControlsPerLine(8);
    obj.flowLayout14:setMargins({bottom=4});
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setName("flowLayout14");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout14);
    obj.flowPart105:setMinWidth(50);
    obj.flowPart105:setMaxWidth(50);
    obj.flowPart105:setHeight(20);
    obj.flowPart105:setName("flowPart105");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart105);
    obj.edit71:setAlign("client");
    obj.edit71:setField("attribute_ressonance_max");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontSize(12);
    obj.edit71:setType("number");
    obj.edit71:setName("edit71");

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout14);
    obj.flowPart106:setMinWidth(50);
    obj.flowPart106:setMaxWidth(50);
    obj.flowPart106:setHeight(20);
    obj.flowPart106:setName("flowPart106");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart106);
    obj.edit72:setAlign("client");
    obj.edit72:setField("attribute_ressonance_base");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontSize(12);
    obj.edit72:setType("number");
    obj.edit72:setName("edit72");

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout14);
    obj.flowPart107:setMinWidth(50);
    obj.flowPart107:setMaxWidth(50);
    obj.flowPart107:setHeight(20);
    obj.flowPart107:setName("flowPart107");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart107);
    obj.edit73:setAlign("client");
    obj.edit73:setField("attribute_ressonance_initial");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontSize(12);
    obj.edit73:setType("number");
    obj.edit73:setName("edit73");

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout14);
    obj.flowPart108:setMinWidth(50);
    obj.flowPart108:setMaxWidth(50);
    obj.flowPart108:setHeight(20);
    obj.flowPart108:setName("flowPart108");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart108);
    obj.edit74:setAlign("client");
    obj.edit74:setField("attribute_ressonance_karma");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontSize(12);
    obj.edit74:setType("number");
    obj.edit74:setName("edit74");

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout14);
    obj.flowPart109:setMinWidth(50);
    obj.flowPart109:setMaxWidth(50);
    obj.flowPart109:setHeight(20);
    obj.flowPart109:setName("flowPart109");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.flowPart109);
    obj.edit75:setAlign("client");
    obj.edit75:setField("attribute_ressonance_other");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setFontSize(12);
    obj.edit75:setType("number");
    obj.edit75:setName("edit75");

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout14);
    obj.flowPart110:setMinWidth(20);
    obj.flowPart110:setMaxWidth(20);
    obj.flowPart110:setHeight(20);
    obj.flowPart110:setName("flowPart110");

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout14);
    obj.flowPart111:setMinWidth(50);
    obj.flowPart111:setMaxWidth(50);
    obj.flowPart111:setHeight(20);
    obj.flowPart111:setName("flowPart111");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.flowPart111);
    obj.edit76:setAlign("client");
    obj.edit76:setField("attribute_ressonance_augmented");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontSize(12);
    obj.edit76:setType("number");
    obj.edit76:setName("edit76");

    obj.flowPart112 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.flowLayout14);
    obj.flowPart112:setMinWidth(50);
    obj.flowPart112:setMaxWidth(50);
    obj.flowPart112:setHeight(20);
    obj.flowPart112:setName("flowPart112");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.flowPart112);
    obj.edit77:setAlign("client");
    obj.edit77:setField("attribute_ressonance_misc");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setFontSize(12);
    obj.edit77:setType("number");
    obj.edit77:setName("edit77");

    obj.popupActiveSkill = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupActiveSkill:setParent(obj.frmGeneral);
    obj.popupActiveSkill:setName("popupActiveSkill");
    obj.popupActiveSkill:setWidth(350);
    obj.popupActiveSkill:setHeight(220);
    obj.popupActiveSkill:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popupActiveSkill, "autoScopeNode",  "false");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.popupActiveSkill);
    obj.flowLayout15:setAlign("top");
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setMaxControlsPerLine(3);
    obj.flowLayout15:setMargins({bottom=4});
    obj.flowLayout15:setHorzAlign("center");
    obj.flowLayout15:setName("flowLayout15");

    obj.flowPart113 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.flowLayout15);
    obj.flowPart113:setMinWidth(50);
    obj.flowPart113:setMaxWidth(100);
    obj.flowPart113:setHeight(15);
    obj.flowPart113:setName("flowPart113");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart113);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(10);
    obj.label22:setText("Base");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.flowPart114 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.flowLayout15);
    obj.flowPart114:setMinWidth(50);
    obj.flowPart114:setMaxWidth(100);
    obj.flowPart114:setHeight(15);
    obj.flowPart114:setName("flowPart114");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart114);
    obj.label23:setAlign("top");
    obj.label23:setFontSize(10);
    obj.label23:setText("Points");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setWordWrap(true);
    obj.label23:setTextTrimming("none");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.flowPart115 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.flowLayout15);
    obj.flowPart115:setMinWidth(100);
    obj.flowPart115:setMaxWidth(100);
    obj.flowPart115:setHeight(15);
    obj.flowPart115:setName("flowPart115");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart115);
    obj.label24:setAlign("left");
    obj.label24:setWidth(85);
    obj.label24:setFontSize(10);
    obj.label24:setText("Karma");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowPart115);
    obj.button1:setAlign("left");
    obj.button1:setWidth(15);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.popupActiveSkill);
    obj.flowLayout16:setAlign("top");
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setMaxControlsPerLine(3);
    obj.flowLayout16:setMargins({bottom=4});
    obj.flowLayout16:setHorzAlign("center");
    obj.flowLayout16:setName("flowLayout16");

    obj.flowPart116 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.flowLayout16);
    obj.flowPart116:setMinWidth(50);
    obj.flowPart116:setMaxWidth(100);
    obj.flowPart116:setHeight(20);
    obj.flowPart116:setName("flowPart116");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.flowPart116);
    obj.edit78:setAlign("client");
    obj.edit78:setField("skill_base");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setFontSize(12);
    obj.edit78:setType("number");
    obj.edit78:setName("edit78");

    obj.flowPart117 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.flowLayout16);
    obj.flowPart117:setMinWidth(50);
    obj.flowPart117:setMaxWidth(100);
    obj.flowPart117:setHeight(20);
    obj.flowPart117:setName("flowPart117");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.flowPart117);
    obj.edit79:setAlign("client");
    obj.edit79:setField("skill_points");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setFontSize(12);
    obj.edit79:setType("number");
    obj.edit79:setName("edit79");

    obj.flowPart118 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.flowLayout16);
    obj.flowPart118:setMinWidth(100);
    obj.flowPart118:setMaxWidth(100);
    obj.flowPart118:setHeight(20);
    obj.flowPart118:setName("flowPart118");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.flowPart118);
    obj.edit80:setAlign("left");
    obj.edit80:setWidth(50);
    obj.edit80:setField("skill_karma_bonus");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setFontSize(12);
    obj.edit80:setType("number");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.flowPart118);
    obj.edit81:setAlign("left");
    obj.edit81:setWidth(50);
    obj.edit81:setField("skill_karma_spent");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setFontSize(12);
    obj.edit81:setType("number");
    obj.edit81:setName("edit81");

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.popupActiveSkill);
    obj.flowLayout17:setAlign("top");
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setMaxControlsPerLine(1);
    obj.flowLayout17:setMargins({bottom=4});
    obj.flowLayout17:setHorzAlign("center");
    obj.flowLayout17:setName("flowLayout17");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowLayout17);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(10);
    obj.label25:setText("Group");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setWordWrap(true);
    obj.label25:setTextTrimming("none");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.popupActiveSkill);
    obj.flowLayout18:setAlign("top");
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setMaxControlsPerLine(3);
    obj.flowLayout18:setMargins({bottom=4});
    obj.flowLayout18:setHorzAlign("center");
    obj.flowLayout18:setName("flowLayout18");

    obj.flowPart119 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.flowLayout18);
    obj.flowPart119:setMinWidth(50);
    obj.flowPart119:setMaxWidth(100);
    obj.flowPart119:setHeight(15);
    obj.flowPart119:setName("flowPart119");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart119);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(10);
    obj.label26:setText("Name");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.flowPart120 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.flowLayout18);
    obj.flowPart120:setMinWidth(50);
    obj.flowPart120:setMaxWidth(100);
    obj.flowPart120:setHeight(15);
    obj.flowPart120:setName("flowPart120");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart120);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(10);
    obj.label27:setText("Points");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.flowPart121 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout18);
    obj.flowPart121:setMinWidth(100);
    obj.flowPart121:setMaxWidth(100);
    obj.flowPart121:setHeight(15);
    obj.flowPart121:setName("flowPart121");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart121);
    obj.label28:setAlign("left");
    obj.label28:setWidth(85);
    obj.label28:setFontSize(10);
    obj.label28:setText("Karma");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowPart121);
    obj.button2:setAlign("left");
    obj.button2:setWidth(15);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.popupActiveSkill);
    obj.flowLayout19:setAlign("top");
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setMaxControlsPerLine(3);
    obj.flowLayout19:setMargins({bottom=4});
    obj.flowLayout19:setHorzAlign("center");
    obj.flowLayout19:setName("flowLayout19");

    obj.flowPart122 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.flowLayout19);
    obj.flowPart122:setMinWidth(50);
    obj.flowPart122:setMaxWidth(100);
    obj.flowPart122:setHeight(20);
    obj.flowPart122:setName("flowPart122");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.flowPart122);
    obj.edit82:setAlign("client");
    obj.edit82:setField("skill_group_name");
    obj.edit82:setFontSize(12);
    obj.edit82:setName("edit82");

    obj.flowPart123 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.flowLayout19);
    obj.flowPart123:setMinWidth(50);
    obj.flowPart123:setMaxWidth(100);
    obj.flowPart123:setHeight(20);
    obj.flowPart123:setName("flowPart123");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.flowPart123);
    obj.edit83:setAlign("client");
    obj.edit83:setField("skill_group_points");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setFontSize(12);
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");

    obj.flowPart124 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.flowLayout19);
    obj.flowPart124:setMinWidth(100);
    obj.flowPart124:setMaxWidth(100);
    obj.flowPart124:setHeight(20);
    obj.flowPart124:setName("flowPart124");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.flowPart124);
    obj.edit84:setAlign("left");
    obj.edit84:setWidth(50);
    obj.edit84:setField("skill_group_karma_bonus");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setFontSize(12);
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.flowPart124);
    obj.edit85:setAlign("left");
    obj.edit85:setWidth(50);
    obj.edit85:setField("skill_group_karma_spent");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setFontSize(12);
    obj.edit85:setType("number");
    obj.edit85:setName("edit85");

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.popupActiveSkill);
    obj.flowLayout20:setAlign("top");
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setMaxControlsPerLine(1);
    obj.flowLayout20:setMargins({bottom=4});
    obj.flowLayout20:setHorzAlign("center");
    obj.flowLayout20:setName("flowLayout20");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowLayout20);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Especialization");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.popupActiveSkill);
    obj.flowLayout21:setAlign("top");
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setMaxControlsPerLine(3);
    obj.flowLayout21:setMargins({bottom=4});
    obj.flowLayout21:setHorzAlign("center");
    obj.flowLayout21:setName("flowLayout21");

    obj.flowPart125 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.flowLayout21);
    obj.flowPart125:setMinWidth(50);
    obj.flowPart125:setMaxWidth(100);
    obj.flowPart125:setHeight(15);
    obj.flowPart125:setName("flowPart125");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart125);
    obj.label30:setAlign("top");
    obj.label30:setFontSize(10);
    obj.label30:setText("Other");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWordWrap(true);
    obj.label30:setTextTrimming("none");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.flowPart126 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.flowLayout21);
    obj.flowPart126:setMinWidth(50);
    obj.flowPart126:setMaxWidth(100);
    obj.flowPart126:setHeight(15);
    obj.flowPart126:setName("flowPart126");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart126);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(10);
    obj.label31:setText("Points");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.flowPart127 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.flowLayout21);
    obj.flowPart127:setMinWidth(50);
    obj.flowPart127:setMaxWidth(100);
    obj.flowPart127:setHeight(15);
    obj.flowPart127:setName("flowPart127");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart127);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(10);
    obj.label32:setText("Karma");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.popupActiveSkill);
    obj.flowLayout22:setAlign("top");
    obj.flowLayout22:setAutoHeight(true);
    obj.flowLayout22:setMaxControlsPerLine(3);
    obj.flowLayout22:setMargins({bottom=4});
    obj.flowLayout22:setHorzAlign("center");
    obj.flowLayout22:setName("flowLayout22");

    obj.flowPart128 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.flowLayout22);
    obj.flowPart128:setMinWidth(50);
    obj.flowPart128:setMaxWidth(100);
    obj.flowPart128:setHeight(20);
    obj.flowPart128:setName("flowPart128");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.flowPart128);
    obj.edit86:setAlign("client");
    obj.edit86:setField("skill_other");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setFontSize(12);
    obj.edit86:setType("number");
    obj.edit86:setName("edit86");

    obj.flowPart129 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.flowLayout22);
    obj.flowPart129:setMinWidth(50);
    obj.flowPart129:setMaxWidth(100);
    obj.flowPart129:setHeight(20);
    obj.flowPart129:setName("flowPart129");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.flowPart129);
    obj.edit87:setAlign("client");
    obj.edit87:setField("skill_espec_points");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setFontSize(12);
    obj.edit87:setType("number");
    obj.edit87:setName("edit87");

    obj.flowPart130 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.flowLayout22);
    obj.flowPart130:setMinWidth(50);
    obj.flowPart130:setMaxWidth(100);
    obj.flowPart130:setHeight(20);
    obj.flowPart130:setName("flowPart130");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.flowPart130);
    obj.edit88:setAlign("client");
    obj.edit88:setField("skill_espec_karma");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setFontSize(12);
    obj.edit88:setType("number");
    obj.edit88:setName("edit88");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popupActiveSkill);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("skils_especs");
    obj.textEditor1:setName("textEditor1");

    obj.popupKnowledgeSkill = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupKnowledgeSkill:setParent(obj.frmGeneral);
    obj.popupKnowledgeSkill:setName("popupKnowledgeSkill");
    obj.popupKnowledgeSkill:setWidth(350);
    obj.popupKnowledgeSkill:setHeight(200);
    obj.popupKnowledgeSkill:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popupKnowledgeSkill, "autoScopeNode",  "false");

    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.popupKnowledgeSkill);
    obj.flowLayout23:setAlign("top");
    obj.flowLayout23:setAutoHeight(true);
    obj.flowLayout23:setMaxControlsPerLine(3);
    obj.flowLayout23:setMargins({bottom=4});
    obj.flowLayout23:setHorzAlign("center");
    obj.flowLayout23:setName("flowLayout23");

    obj.flowPart131 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.flowLayout23);
    obj.flowPart131:setMinWidth(50);
    obj.flowPart131:setMaxWidth(100);
    obj.flowPart131:setHeight(15);
    obj.flowPart131:setName("flowPart131");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart131);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(10);
    obj.label33:setText("Base");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.flowPart132 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.flowLayout23);
    obj.flowPart132:setMinWidth(50);
    obj.flowPart132:setMaxWidth(100);
    obj.flowPart132:setHeight(15);
    obj.flowPart132:setName("flowPart132");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart132);
    obj.label34:setAlign("top");
    obj.label34:setFontSize(10);
    obj.label34:setText("Points");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setWordWrap(true);
    obj.label34:setTextTrimming("none");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.flowPart133 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.flowLayout23);
    obj.flowPart133:setMinWidth(100);
    obj.flowPart133:setMaxWidth(100);
    obj.flowPart133:setHeight(15);
    obj.flowPart133:setName("flowPart133");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart133);
    obj.label35:setAlign("left");
    obj.label35:setWidth(85);
    obj.label35:setFontSize(10);
    obj.label35:setText("Karma");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setWordWrap(true);
    obj.label35:setTextTrimming("none");
    obj.label35:setAutoSize(true);
    obj.label35:setName("label35");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowPart133);
    obj.button3:setAlign("left");
    obj.button3:setWidth(15);
    obj.button3:setText("+");
    obj.button3:setName("button3");

    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.popupKnowledgeSkill);
    obj.flowLayout24:setAlign("top");
    obj.flowLayout24:setAutoHeight(true);
    obj.flowLayout24:setMaxControlsPerLine(3);
    obj.flowLayout24:setMargins({bottom=4});
    obj.flowLayout24:setHorzAlign("center");
    obj.flowLayout24:setName("flowLayout24");

    obj.flowPart134 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.flowLayout24);
    obj.flowPart134:setMinWidth(50);
    obj.flowPart134:setMaxWidth(100);
    obj.flowPart134:setHeight(20);
    obj.flowPart134:setName("flowPart134");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.flowPart134);
    obj.edit89:setAlign("client");
    obj.edit89:setField("skill_base");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setFontSize(12);
    obj.edit89:setType("number");
    obj.edit89:setName("edit89");

    obj.flowPart135 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.flowLayout24);
    obj.flowPart135:setMinWidth(50);
    obj.flowPart135:setMaxWidth(100);
    obj.flowPart135:setHeight(20);
    obj.flowPart135:setName("flowPart135");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.flowPart135);
    obj.edit90:setAlign("client");
    obj.edit90:setField("skill_points");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setFontSize(12);
    obj.edit90:setType("number");
    obj.edit90:setName("edit90");

    obj.flowPart136 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.flowLayout24);
    obj.flowPart136:setMinWidth(100);
    obj.flowPart136:setMaxWidth(100);
    obj.flowPart136:setHeight(20);
    obj.flowPart136:setName("flowPart136");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.flowPart136);
    obj.edit91:setAlign("left");
    obj.edit91:setWidth(50);
    obj.edit91:setField("skill_karma_bonus");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setFontSize(12);
    obj.edit91:setType("number");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.flowPart136);
    obj.edit92:setAlign("left");
    obj.edit92:setWidth(50);
    obj.edit92:setField("skill_karma_spent");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setFontSize(12);
    obj.edit92:setType("number");
    obj.edit92:setName("edit92");

    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.popupKnowledgeSkill);
    obj.flowLayout25:setAlign("top");
    obj.flowLayout25:setAutoHeight(true);
    obj.flowLayout25:setMaxControlsPerLine(1);
    obj.flowLayout25:setMargins({bottom=4});
    obj.flowLayout25:setHorzAlign("center");
    obj.flowLayout25:setName("flowLayout25");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowLayout25);
    obj.label36:setAlign("top");
    obj.label36:setFontSize(10);
    obj.label36:setText("Category");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWordWrap(true);
    obj.label36:setTextTrimming("none");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");

    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.popupKnowledgeSkill);
    obj.flowLayout26:setAlign("top");
    obj.flowLayout26:setAutoHeight(true);
    obj.flowLayout26:setMaxControlsPerLine(3);
    obj.flowLayout26:setMargins({bottom=4});
    obj.flowLayout26:setHorzAlign("center");
    obj.flowLayout26:setName("flowLayout26");

    obj.flowPart137 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.flowLayout26);
    obj.flowPart137:setMinWidth(50);
    obj.flowPart137:setMaxWidth(150);
    obj.flowPart137:setHeight(20);
    obj.flowPart137:setName("flowPart137");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.flowPart137);
    obj.edit93:setAlign("client");
    obj.edit93:setField("skill_category");
    obj.edit93:setFontSize(12);
    obj.edit93:setName("edit93");

    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.popupKnowledgeSkill);
    obj.flowLayout27:setAlign("top");
    obj.flowLayout27:setAutoHeight(true);
    obj.flowLayout27:setMaxControlsPerLine(1);
    obj.flowLayout27:setMargins({bottom=4});
    obj.flowLayout27:setHorzAlign("center");
    obj.flowLayout27:setName("flowLayout27");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowLayout27);
    obj.label37:setAlign("top");
    obj.label37:setFontSize(10);
    obj.label37:setText("Especialization");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setWordWrap(true);
    obj.label37:setTextTrimming("none");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.flowLayout28 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.popupKnowledgeSkill);
    obj.flowLayout28:setAlign("top");
    obj.flowLayout28:setAutoHeight(true);
    obj.flowLayout28:setMaxControlsPerLine(3);
    obj.flowLayout28:setMargins({bottom=4});
    obj.flowLayout28:setHorzAlign("center");
    obj.flowLayout28:setName("flowLayout28");

    obj.flowPart138 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.flowLayout28);
    obj.flowPart138:setMinWidth(50);
    obj.flowPart138:setMaxWidth(100);
    obj.flowPart138:setHeight(15);
    obj.flowPart138:setName("flowPart138");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart138);
    obj.label38:setAlign("top");
    obj.label38:setFontSize(10);
    obj.label38:setText("Other");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setWordWrap(true);
    obj.label38:setTextTrimming("none");
    obj.label38:setAutoSize(true);
    obj.label38:setName("label38");

    obj.flowPart139 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.flowLayout28);
    obj.flowPart139:setMinWidth(50);
    obj.flowPart139:setMaxWidth(100);
    obj.flowPart139:setHeight(15);
    obj.flowPart139:setName("flowPart139");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart139);
    obj.label39:setAlign("top");
    obj.label39:setFontSize(10);
    obj.label39:setText("Points");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setWordWrap(true);
    obj.label39:setTextTrimming("none");
    obj.label39:setAutoSize(true);
    obj.label39:setName("label39");

    obj.flowPart140 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.flowLayout28);
    obj.flowPart140:setMinWidth(50);
    obj.flowPart140:setMaxWidth(100);
    obj.flowPart140:setHeight(15);
    obj.flowPart140:setName("flowPart140");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart140);
    obj.label40:setAlign("top");
    obj.label40:setFontSize(10);
    obj.label40:setText("Karma");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setWordWrap(true);
    obj.label40:setTextTrimming("none");
    obj.label40:setAutoSize(true);
    obj.label40:setName("label40");

    obj.flowLayout29 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.popupKnowledgeSkill);
    obj.flowLayout29:setAlign("top");
    obj.flowLayout29:setAutoHeight(true);
    obj.flowLayout29:setMaxControlsPerLine(3);
    obj.flowLayout29:setMargins({bottom=4});
    obj.flowLayout29:setHorzAlign("center");
    obj.flowLayout29:setName("flowLayout29");

    obj.flowPart141 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.flowLayout29);
    obj.flowPart141:setMinWidth(50);
    obj.flowPart141:setMaxWidth(100);
    obj.flowPart141:setHeight(20);
    obj.flowPart141:setName("flowPart141");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.flowPart141);
    obj.edit94:setAlign("client");
    obj.edit94:setField("skill_other");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setFontSize(12);
    obj.edit94:setType("number");
    obj.edit94:setName("edit94");

    obj.flowPart142 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart142:setParent(obj.flowLayout29);
    obj.flowPart142:setMinWidth(50);
    obj.flowPart142:setMaxWidth(100);
    obj.flowPart142:setHeight(20);
    obj.flowPart142:setName("flowPart142");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.flowPart142);
    obj.edit95:setAlign("client");
    obj.edit95:setField("skill_espec_points");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setFontSize(12);
    obj.edit95:setType("number");
    obj.edit95:setName("edit95");

    obj.flowPart143 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart143:setParent(obj.flowLayout29);
    obj.flowPart143:setMinWidth(50);
    obj.flowPart143:setMaxWidth(100);
    obj.flowPart143:setHeight(20);
    obj.flowPart143:setName("flowPart143");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.flowPart143);
    obj.edit96:setAlign("client");
    obj.edit96:setField("skill_espec_karma");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setFontSize(12);
    obj.edit96:setType("number");
    obj.edit96:setName("edit96");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popupKnowledgeSkill);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("skils_especs");
    obj.textEditor2:setName("textEditor2");

    obj.popupLanguageSkill = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupLanguageSkill:setParent(obj.frmGeneral);
    obj.popupLanguageSkill:setName("popupLanguageSkill");
    obj.popupLanguageSkill:setWidth(350);
    obj.popupLanguageSkill:setHeight(160);
    obj.popupLanguageSkill:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popupLanguageSkill, "autoScopeNode",  "false");

    obj.flowLayout30 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.popupLanguageSkill);
    obj.flowLayout30:setAlign("top");
    obj.flowLayout30:setAutoHeight(true);
    obj.flowLayout30:setMaxControlsPerLine(3);
    obj.flowLayout30:setMargins({bottom=4});
    obj.flowLayout30:setHorzAlign("center");
    obj.flowLayout30:setName("flowLayout30");

    obj.flowPart144 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart144:setParent(obj.flowLayout30);
    obj.flowPart144:setMinWidth(50);
    obj.flowPart144:setMaxWidth(100);
    obj.flowPart144:setHeight(15);
    obj.flowPart144:setName("flowPart144");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowPart144);
    obj.checkBox1:setAlign("client");
    obj.checkBox1:setField("skill_native");
    obj.checkBox1:setText("Native");
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setFontSize(10);
    obj.checkBox1:setName("checkBox1");

    obj.flowPart145 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart145:setParent(obj.flowLayout30);
    obj.flowPart145:setMinWidth(50);
    obj.flowPart145:setMaxWidth(100);
    obj.flowPart145:setHeight(15);
    obj.flowPart145:setName("flowPart145");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart145);
    obj.label41:setAlign("top");
    obj.label41:setFontSize(10);
    obj.label41:setText("Points");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setWordWrap(true);
    obj.label41:setTextTrimming("none");
    obj.label41:setAutoSize(true);
    obj.label41:setName("label41");

    obj.flowPart146 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart146:setParent(obj.flowLayout30);
    obj.flowPart146:setMinWidth(100);
    obj.flowPart146:setMaxWidth(100);
    obj.flowPart146:setHeight(15);
    obj.flowPart146:setName("flowPart146");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart146);
    obj.label42:setAlign("left");
    obj.label42:setWidth(85);
    obj.label42:setFontSize(10);
    obj.label42:setText("Karma");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setWordWrap(true);
    obj.label42:setTextTrimming("none");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowPart146);
    obj.button4:setAlign("left");
    obj.button4:setWidth(15);
    obj.button4:setText("+");
    obj.button4:setName("button4");

    obj.flowLayout31 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.popupLanguageSkill);
    obj.flowLayout31:setAlign("top");
    obj.flowLayout31:setAutoHeight(true);
    obj.flowLayout31:setMaxControlsPerLine(3);
    obj.flowLayout31:setMargins({bottom=4});
    obj.flowLayout31:setHorzAlign("center");
    obj.flowLayout31:setName("flowLayout31");

    obj.flowPart147 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart147:setParent(obj.flowLayout31);
    obj.flowPart147:setMinWidth(50);
    obj.flowPart147:setMaxWidth(100);
    obj.flowPart147:setHeight(20);
    obj.flowPart147:setName("flowPart147");

    obj.flowPart148 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart148:setParent(obj.flowLayout31);
    obj.flowPart148:setMinWidth(50);
    obj.flowPart148:setMaxWidth(100);
    obj.flowPart148:setHeight(20);
    obj.flowPart148:setName("flowPart148");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.flowPart148);
    obj.edit97:setAlign("client");
    obj.edit97:setField("skill_points");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setFontSize(12);
    obj.edit97:setType("number");
    obj.edit97:setName("edit97");

    obj.flowPart149 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart149:setParent(obj.flowLayout31);
    obj.flowPart149:setMinWidth(100);
    obj.flowPart149:setMaxWidth(100);
    obj.flowPart149:setHeight(20);
    obj.flowPart149:setName("flowPart149");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.flowPart149);
    obj.edit98:setAlign("left");
    obj.edit98:setWidth(50);
    obj.edit98:setField("skill_karma_bonus");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setFontSize(12);
    obj.edit98:setType("number");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.flowPart149);
    obj.edit99:setAlign("left");
    obj.edit99:setWidth(50);
    obj.edit99:setField("skill_karma_spent");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setFontSize(12);
    obj.edit99:setType("number");
    obj.edit99:setName("edit99");

    obj.flowLayout32 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.popupLanguageSkill);
    obj.flowLayout32:setAlign("top");
    obj.flowLayout32:setAutoHeight(true);
    obj.flowLayout32:setMaxControlsPerLine(1);
    obj.flowLayout32:setMargins({bottom=4});
    obj.flowLayout32:setHorzAlign("center");
    obj.flowLayout32:setName("flowLayout32");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowLayout32);
    obj.label43:setAlign("top");
    obj.label43:setFontSize(10);
    obj.label43:setText("Especialization");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setWordWrap(true);
    obj.label43:setTextTrimming("none");
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");

    obj.flowLayout33 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.popupLanguageSkill);
    obj.flowLayout33:setAlign("top");
    obj.flowLayout33:setAutoHeight(true);
    obj.flowLayout33:setMaxControlsPerLine(3);
    obj.flowLayout33:setMargins({bottom=4});
    obj.flowLayout33:setHorzAlign("center");
    obj.flowLayout33:setName("flowLayout33");

    obj.flowPart150 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart150:setParent(obj.flowLayout33);
    obj.flowPart150:setMinWidth(50);
    obj.flowPart150:setMaxWidth(100);
    obj.flowPart150:setHeight(15);
    obj.flowPart150:setName("flowPart150");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart150);
    obj.label44:setAlign("top");
    obj.label44:setFontSize(10);
    obj.label44:setText("Other");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setWordWrap(true);
    obj.label44:setTextTrimming("none");
    obj.label44:setAutoSize(true);
    obj.label44:setName("label44");

    obj.flowPart151 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart151:setParent(obj.flowLayout33);
    obj.flowPart151:setMinWidth(50);
    obj.flowPart151:setMaxWidth(100);
    obj.flowPart151:setHeight(15);
    obj.flowPart151:setName("flowPart151");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart151);
    obj.label45:setAlign("top");
    obj.label45:setFontSize(10);
    obj.label45:setText("Points");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWordWrap(true);
    obj.label45:setTextTrimming("none");
    obj.label45:setAutoSize(true);
    obj.label45:setName("label45");

    obj.flowPart152 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart152:setParent(obj.flowLayout33);
    obj.flowPart152:setMinWidth(50);
    obj.flowPart152:setMaxWidth(100);
    obj.flowPart152:setHeight(15);
    obj.flowPart152:setName("flowPart152");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart152);
    obj.label46:setAlign("top");
    obj.label46:setFontSize(10);
    obj.label46:setText("Karma");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setWordWrap(true);
    obj.label46:setTextTrimming("none");
    obj.label46:setAutoSize(true);
    obj.label46:setName("label46");

    obj.flowLayout34 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.popupLanguageSkill);
    obj.flowLayout34:setAlign("top");
    obj.flowLayout34:setAutoHeight(true);
    obj.flowLayout34:setMaxControlsPerLine(3);
    obj.flowLayout34:setMargins({bottom=4});
    obj.flowLayout34:setHorzAlign("center");
    obj.flowLayout34:setName("flowLayout34");

    obj.flowPart153 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart153:setParent(obj.flowLayout34);
    obj.flowPart153:setMinWidth(50);
    obj.flowPart153:setMaxWidth(100);
    obj.flowPart153:setHeight(20);
    obj.flowPart153:setName("flowPart153");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.flowPart153);
    obj.edit100:setAlign("client");
    obj.edit100:setField("skill_other");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setFontSize(12);
    obj.edit100:setType("number");
    obj.edit100:setName("edit100");

    obj.flowPart154 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart154:setParent(obj.flowLayout34);
    obj.flowPart154:setMinWidth(50);
    obj.flowPart154:setMaxWidth(100);
    obj.flowPart154:setHeight(20);
    obj.flowPart154:setName("flowPart154");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.flowPart154);
    obj.edit101:setAlign("client");
    obj.edit101:setField("skill_espec_points");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setFontSize(12);
    obj.edit101:setType("number");
    obj.edit101:setName("edit101");

    obj.flowPart155 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart155:setParent(obj.flowLayout34);
    obj.flowPart155:setMinWidth(50);
    obj.flowPart155:setMaxWidth(100);
    obj.flowPart155:setHeight(20);
    obj.flowPart155:setName("flowPart155");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.flowPart155);
    obj.edit102:setAlign("client");
    obj.edit102:setField("skill_espec_karma");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setFontSize(12);
    obj.edit102:setType("number");
    obj.edit102:setName("edit102");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popupLanguageSkill);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("skils_especs");
    obj.textEditor3:setName("textEditor3");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeneral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(560);
    obj.layout1:setHeight(85);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout1);
    obj.label47:setLeft(5);
    obj.label47:setTop(5);
    obj.label47:setWidth(90);
    obj.label47:setHeight(20);
    obj.label47:setText("NAME");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout1);
    obj.edit103:setLeft(100);
    obj.edit103:setTop(5);
    obj.edit103:setWidth(300);
    obj.edit103:setHeight(25);
    obj.edit103:setField("name");
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setName("edit103");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout1);
    obj.label48:setLeft(5);
    obj.label48:setTop(30);
    obj.label48:setWidth(90);
    obj.label48:setHeight(20);
    obj.label48:setText("CONCEPT");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout1);
    obj.edit104:setLeft(100);
    obj.edit104:setTop(30);
    obj.edit104:setWidth(300);
    obj.edit104:setHeight(25);
    obj.edit104:setField("concept");
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setName("edit104");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout1);
    obj.label49:setLeft(5);
    obj.label49:setTop(55);
    obj.label49:setWidth(90);
    obj.label49:setHeight(20);
    obj.label49:setText("METATYPE");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout1);
    obj.edit105:setLeft(100);
    obj.edit105:setTop(55);
    obj.edit105:setWidth(300);
    obj.edit105:setHeight(25);
    obj.edit105:setField("metatype");
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setName("edit105");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout1);
    obj.label51:setLeft(405);
    obj.label51:setTop(5);
    obj.label51:setWidth(90);
    obj.label51:setHeight(20);
    obj.label51:setText("KARMA");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(500);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout1);
    obj.label52:setLeft(500);
    obj.label52:setTop(5);
    obj.label52:setWidth(50);
    obj.label52:setHeight(25);
    obj.label52:setField("karma");
    obj.label52:setVertTextAlign("center");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout1);
    obj.label53:setLeft(405);
    obj.label53:setTop(30);
    obj.label53:setWidth(90);
    obj.label53:setHeight(20);
    obj.label53:setText("TOTAL KARMA");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout1);
    obj.edit106:setLeft(500);
    obj.edit106:setTop(30);
    obj.edit106:setWidth(50);
    obj.edit106:setHeight(25);
    obj.edit106:setField("karmaTotal");
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(90);
    obj.layout2:setWidth(260);
    obj.layout2:setHeight(465);
    obj.layout2:setName("layout2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout2);
    obj.label54:setLeft(5);
    obj.label54:setTop(0);
    obj.label54:setWidth(260);
    obj.label54:setHeight(20);
    obj.label54:setText("ATTRIBUTES");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout2);
    obj.label55:setLeft(195);
    obj.label55:setTop(90);
    obj.label55:setWidth(100);
    obj.label55:setHeight(20);
    obj.label55:setText("Physical");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setRotationAngle(90);
    obj.label55:setName("label55");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout2);
    obj.horzLine1:setLeft(0);
    obj.horzLine1:setTop(155);
    obj.horzLine1:setWidth(315);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout2);
    obj.label56:setLeft(195);
    obj.label56:setTop(200);
    obj.label56:setWidth(100);
    obj.label56:setHeight(20);
    obj.label56:setText("Mental");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setRotationAngle(90);
    obj.label56:setName("label56");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout2);
    obj.horzLine2:setLeft(0);
    obj.horzLine2:setTop(265);
    obj.horzLine2:setWidth(315);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout2);
    obj.label57:setLeft(195);
    obj.label57:setTop(310);
    obj.label57:setWidth(100);
    obj.label57:setHeight(20);
    obj.label57:setText("Special");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setRotationAngle(90);
    obj.label57:setName("label57");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout2);
    obj.horzLine3:setLeft(0);
    obj.horzLine3:setTop(375);
    obj.horzLine3:setWidth(315);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout2);
    obj.label58:setLeft(95);
    obj.label58:setTop(25);
    obj.label58:setWidth(50);
    obj.label58:setHeight(20);
    obj.label58:setText("Real");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout2);
    obj.label59:setLeft(145);
    obj.label59:setTop(25);
    obj.label59:setWidth(50);
    obj.label59:setHeight(20);
    obj.label59:setText("Augm.");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout2);
    obj.label60:setLeft(5);
    obj.label60:setTop(50);
    obj.label60:setWidth(90);
    obj.label60:setHeight(20);
    obj.label60:setText("Body");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(95);
    obj.rectangle4:setTop(50);
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout2);
    obj.label61:setLeft(95);
    obj.label61:setTop(50);
    obj.label61:setWidth(50);
    obj.label61:setHeight(25);
    obj.label61:setField("attribute_body_real");
    obj.label61:setVertTextAlign("center");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setLeft(145);
    obj.rectangle5:setTop(50);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout2);
    obj.label62:setLeft(145);
    obj.label62:setTop(50);
    obj.label62:setWidth(50);
    obj.label62:setHeight(25);
    obj.label62:setField("attribute_body_effective");
    obj.label62:setVertTextAlign("center");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setFields({'attribute_body_max', 'attribute_body_base', 'attribute_body_initial', 'attribute_body_karma', 'attribute_body_other', 'attribute_body_augmented', 'attribute_body_misc'});
    obj.dataLink1:setName("dataLink1");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout2);
    obj.label63:setLeft(5);
    obj.label63:setTop(75);
    obj.label63:setWidth(90);
    obj.label63:setHeight(20);
    obj.label63:setText("Agility");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout2);
    obj.rectangle6:setLeft(95);
    obj.rectangle6:setTop(75);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout2);
    obj.label64:setLeft(95);
    obj.label64:setTop(75);
    obj.label64:setWidth(50);
    obj.label64:setHeight(25);
    obj.label64:setField("attribute_agility_real");
    obj.label64:setVertTextAlign("center");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout2);
    obj.rectangle7:setLeft(145);
    obj.rectangle7:setTop(75);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout2);
    obj.label65:setLeft(145);
    obj.label65:setTop(75);
    obj.label65:setWidth(50);
    obj.label65:setHeight(25);
    obj.label65:setField("attribute_agility_effective");
    obj.label65:setVertTextAlign("center");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setFields({'attribute_agility_max', 'attribute_agility_base', 'attribute_agility_initial', 'attribute_agility_karma', 'attribute_agility_other', 'attribute_agility_augmented', 'attribute_agility_misc'});
    obj.dataLink2:setName("dataLink2");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout2);
    obj.label66:setLeft(5);
    obj.label66:setTop(100);
    obj.label66:setWidth(90);
    obj.label66:setHeight(20);
    obj.label66:setText("Reaction");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout2);
    obj.rectangle8:setLeft(95);
    obj.rectangle8:setTop(100);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout2);
    obj.label67:setLeft(95);
    obj.label67:setTop(100);
    obj.label67:setWidth(50);
    obj.label67:setHeight(25);
    obj.label67:setField("attribute_reaction_real");
    obj.label67:setVertTextAlign("center");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout2);
    obj.rectangle9:setLeft(145);
    obj.rectangle9:setTop(100);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout2);
    obj.label68:setLeft(145);
    obj.label68:setTop(100);
    obj.label68:setWidth(50);
    obj.label68:setHeight(25);
    obj.label68:setField("attribute_reaction_effective");
    obj.label68:setVertTextAlign("center");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout2);
    obj.dataLink3:setFields({'attribute_reaction_max', 'attribute_reaction_base', 'attribute_reaction_initial', 'attribute_reaction_karma', 'attribute_reaction_other', 'attribute_reaction_augmented', 'attribute_reaction_misc'});
    obj.dataLink3:setName("dataLink3");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout2);
    obj.label69:setLeft(5);
    obj.label69:setTop(125);
    obj.label69:setWidth(90);
    obj.label69:setHeight(20);
    obj.label69:setText("Strenght");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout2);
    obj.rectangle10:setLeft(95);
    obj.rectangle10:setTop(125);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout2);
    obj.label70:setLeft(95);
    obj.label70:setTop(125);
    obj.label70:setWidth(50);
    obj.label70:setHeight(25);
    obj.label70:setField("attribute_strenght_real");
    obj.label70:setVertTextAlign("center");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout2);
    obj.rectangle11:setLeft(145);
    obj.rectangle11:setTop(125);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout2);
    obj.label71:setLeft(145);
    obj.label71:setTop(125);
    obj.label71:setWidth(50);
    obj.label71:setHeight(25);
    obj.label71:setField("attribute_strenght_effective");
    obj.label71:setVertTextAlign("center");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout2);
    obj.dataLink4:setFields({'attribute_strenght_max', 'attribute_strenght_base', 'attribute_strenght_initial', 'attribute_strenght_karma', 'attribute_strenght_other', 'attribute_strenght_augmented', 'attribute_strenght_misc'});
    obj.dataLink4:setName("dataLink4");

    obj.physicalButton = GUI.fromHandle(_obj_newObject("button"));
    obj.physicalButton:setParent(obj.layout2);
    obj.physicalButton:setLeft(200);
    obj.physicalButton:setTop(50);
    obj.physicalButton:setText(">>");
    obj.physicalButton:setWidth(30);
    obj.physicalButton:setHeight(100);
    obj.physicalButton:setName("physicalButton");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout2);
    obj.label72:setLeft(5);
    obj.label72:setTop(160);
    obj.label72:setWidth(90);
    obj.label72:setHeight(20);
    obj.label72:setText("Charisma");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout2);
    obj.rectangle12:setLeft(95);
    obj.rectangle12:setTop(160);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout2);
    obj.label73:setLeft(95);
    obj.label73:setTop(160);
    obj.label73:setWidth(50);
    obj.label73:setHeight(25);
    obj.label73:setField("attribute_charisma_real");
    obj.label73:setVertTextAlign("center");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout2);
    obj.rectangle13:setLeft(145);
    obj.rectangle13:setTop(160);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout2);
    obj.label74:setLeft(145);
    obj.label74:setTop(160);
    obj.label74:setWidth(50);
    obj.label74:setHeight(25);
    obj.label74:setField("attribute_charisma_effective");
    obj.label74:setVertTextAlign("center");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout2);
    obj.dataLink5:setFields({'attribute_charisma_max', 'attribute_charisma_base', 'attribute_charisma_initial', 'attribute_charisma_karma', 'attribute_charisma_other', 'attribute_charisma_augmented', 'attribute_charisma_misc'});
    obj.dataLink5:setName("dataLink5");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout2);
    obj.label75:setLeft(5);
    obj.label75:setTop(185);
    obj.label75:setWidth(90);
    obj.label75:setHeight(20);
    obj.label75:setText("Intuition");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout2);
    obj.rectangle14:setLeft(95);
    obj.rectangle14:setTop(185);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout2);
    obj.label76:setLeft(95);
    obj.label76:setTop(185);
    obj.label76:setWidth(50);
    obj.label76:setHeight(25);
    obj.label76:setField("attribute_intuition_real");
    obj.label76:setVertTextAlign("center");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout2);
    obj.rectangle15:setLeft(145);
    obj.rectangle15:setTop(185);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout2);
    obj.label77:setLeft(145);
    obj.label77:setTop(185);
    obj.label77:setWidth(50);
    obj.label77:setHeight(25);
    obj.label77:setField("attribute_intuition_effective");
    obj.label77:setVertTextAlign("center");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout2);
    obj.dataLink6:setFields({'attribute_intuition_max', 'attribute_intuition_base', 'attribute_intuition_initial', 'attribute_intuition_karma', 'attribute_intuition_other', 'attribute_intuition_augmented', 'attribute_intuition_misc'});
    obj.dataLink6:setName("dataLink6");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout2);
    obj.label78:setLeft(5);
    obj.label78:setTop(210);
    obj.label78:setWidth(90);
    obj.label78:setHeight(20);
    obj.label78:setText("Logic");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout2);
    obj.rectangle16:setLeft(95);
    obj.rectangle16:setTop(210);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout2);
    obj.label79:setLeft(95);
    obj.label79:setTop(210);
    obj.label79:setWidth(50);
    obj.label79:setHeight(25);
    obj.label79:setField("attribute_logic_real");
    obj.label79:setVertTextAlign("center");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout2);
    obj.rectangle17:setLeft(145);
    obj.rectangle17:setTop(210);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout2);
    obj.label80:setLeft(145);
    obj.label80:setTop(210);
    obj.label80:setWidth(50);
    obj.label80:setHeight(25);
    obj.label80:setField("attribute_logic_effective");
    obj.label80:setVertTextAlign("center");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout2);
    obj.dataLink7:setFields({'attribute_logic_max', 'attribute_logic_base', 'attribute_logic_initial', 'attribute_logic_karma', 'attribute_logic_other', 'attribute_logic_augmented', 'attribute_logic_misc'});
    obj.dataLink7:setName("dataLink7");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout2);
    obj.label81:setLeft(5);
    obj.label81:setTop(235);
    obj.label81:setWidth(90);
    obj.label81:setHeight(20);
    obj.label81:setText("Willpower");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout2);
    obj.rectangle18:setLeft(95);
    obj.rectangle18:setTop(235);
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout2);
    obj.label82:setLeft(95);
    obj.label82:setTop(235);
    obj.label82:setWidth(50);
    obj.label82:setHeight(25);
    obj.label82:setField("attribute_willpower_real");
    obj.label82:setVertTextAlign("center");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout2);
    obj.rectangle19:setLeft(145);
    obj.rectangle19:setTop(235);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout2);
    obj.label83:setLeft(145);
    obj.label83:setTop(235);
    obj.label83:setWidth(50);
    obj.label83:setHeight(25);
    obj.label83:setField("attribute_willpower_effective");
    obj.label83:setVertTextAlign("center");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout2);
    obj.dataLink8:setFields({'attribute_willpower_max', 'attribute_willpower_base', 'attribute_willpower_initial', 'attribute_willpower_karma', 'attribute_willpower_other', 'attribute_willpower_augmented', 'attribute_willpower_misc'});
    obj.dataLink8:setName("dataLink8");

    obj.mentalButton = GUI.fromHandle(_obj_newObject("button"));
    obj.mentalButton:setParent(obj.layout2);
    obj.mentalButton:setLeft(200);
    obj.mentalButton:setTop(160);
    obj.mentalButton:setText(">>");
    obj.mentalButton:setWidth(30);
    obj.mentalButton:setHeight(100);
    obj.mentalButton:setName("mentalButton");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout2);
    obj.label84:setLeft(5);
    obj.label84:setTop(270);
    obj.label84:setWidth(90);
    obj.label84:setHeight(20);
    obj.label84:setText("Edge");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout2);
    obj.rectangle20:setLeft(95);
    obj.rectangle20:setTop(270);
    obj.rectangle20:setWidth(50);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout2);
    obj.label85:setLeft(95);
    obj.label85:setTop(270);
    obj.label85:setWidth(50);
    obj.label85:setHeight(25);
    obj.label85:setField("attribute_edge_real");
    obj.label85:setVertTextAlign("center");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout2);
    obj.rectangle21:setLeft(145);
    obj.rectangle21:setTop(270);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout2);
    obj.label86:setLeft(145);
    obj.label86:setTop(270);
    obj.label86:setWidth(50);
    obj.label86:setHeight(25);
    obj.label86:setField("attribute_edge_effective");
    obj.label86:setVertTextAlign("center");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout2);
    obj.dataLink9:setFields({'attribute_edge_max', 'attribute_edge_base', 'attribute_edge_initial', 'attribute_edge_karma', 'attribute_edge_other', 'attribute_edge_augmented', 'attribute_edge_misc'});
    obj.dataLink9:setName("dataLink9");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout2);
    obj.label87:setLeft(5);
    obj.label87:setTop(295);
    obj.label87:setWidth(90);
    obj.label87:setHeight(20);
    obj.label87:setText("Magic");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout2);
    obj.rectangle22:setLeft(95);
    obj.rectangle22:setTop(295);
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout2);
    obj.label88:setLeft(95);
    obj.label88:setTop(295);
    obj.label88:setWidth(50);
    obj.label88:setHeight(25);
    obj.label88:setField("attribute_magic_real");
    obj.label88:setVertTextAlign("center");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout2);
    obj.rectangle23:setLeft(145);
    obj.rectangle23:setTop(295);
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout2);
    obj.label89:setLeft(145);
    obj.label89:setTop(295);
    obj.label89:setWidth(50);
    obj.label89:setHeight(25);
    obj.label89:setField("attribute_magic_effective");
    obj.label89:setVertTextAlign("center");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout2);
    obj.dataLink10:setFields({'attribute_magic_max', 'attribute_magic_base', 'attribute_magic_initial', 'attribute_magic_karma', 'attribute_magic_other', 'attribute_magic_augmented', 'attribute_magic_misc'});
    obj.dataLink10:setName("dataLink10");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout2);
    obj.label90:setLeft(5);
    obj.label90:setTop(320);
    obj.label90:setWidth(90);
    obj.label90:setHeight(20);
    obj.label90:setText("Ressonance");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout2);
    obj.rectangle24:setLeft(95);
    obj.rectangle24:setTop(320);
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout2);
    obj.label91:setLeft(95);
    obj.label91:setTop(320);
    obj.label91:setWidth(50);
    obj.label91:setHeight(25);
    obj.label91:setField("attribute_ressonance_real");
    obj.label91:setVertTextAlign("center");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout2);
    obj.rectangle25:setLeft(145);
    obj.rectangle25:setTop(320);
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout2);
    obj.label92:setLeft(145);
    obj.label92:setTop(320);
    obj.label92:setWidth(50);
    obj.label92:setHeight(25);
    obj.label92:setField("attribute_ressonance_effective");
    obj.label92:setVertTextAlign("center");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout2);
    obj.dataLink11:setFields({'attribute_ressonance_max', 'attribute_ressonance_base', 'attribute_ressonance_initial', 'attribute_ressonance_karma', 'attribute_ressonance_other', 'attribute_ressonance_augmented', 'attribute_ressonance_misc'});
    obj.dataLink11:setName("dataLink11");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout2);
    obj.label93:setLeft(5);
    obj.label93:setTop(345);
    obj.label93:setWidth(90);
    obj.label93:setHeight(20);
    obj.label93:setText("Essence");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout2);
    obj.rectangle26:setLeft(95);
    obj.rectangle26:setTop(345);
    obj.rectangle26:setWidth(50);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout2);
    obj.label94:setLeft(95);
    obj.label94:setTop(345);
    obj.label94:setWidth(50);
    obj.label94:setHeight(25);
    obj.label94:setField("attribute_essence_real");
    obj.label94:setVertTextAlign("center");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout2);
    obj.rectangle27:setLeft(145);
    obj.rectangle27:setTop(345);
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout2);
    obj.label95:setLeft(145);
    obj.label95:setTop(345);
    obj.label95:setWidth(50);
    obj.label95:setHeight(25);
    obj.label95:setField("attribute_essence_effective");
    obj.label95:setVertTextAlign("center");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout2);
    obj.dataLink12:setField("attribute_essence_real");
    obj.dataLink12:setDefaultValue("6");
    obj.dataLink12:setName("dataLink12");

    obj.specialButton = GUI.fromHandle(_obj_newObject("button"));
    obj.specialButton:setParent(obj.layout2);
    obj.specialButton:setLeft(200);
    obj.specialButton:setTop(270);
    obj.specialButton:setText(">>");
    obj.specialButton:setWidth(30);
    obj.specialButton:setHeight(100);
    obj.specialButton:setName("specialButton");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout2);
    obj.label96:setLeft(5);
    obj.label96:setTop(380);
    obj.label96:setWidth(90);
    obj.label96:setHeight(20);
    obj.label96:setText("Physical Limit");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout2);
    obj.rectangle28:setLeft(95);
    obj.rectangle28:setTop(380);
    obj.rectangle28:setWidth(50);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout2);
    obj.label97:setLeft(95);
    obj.label97:setTop(380);
    obj.label97:setWidth(50);
    obj.label97:setHeight(25);
    obj.label97:setField("limitPhysical");
    obj.label97:setVertTextAlign("center");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout2);
    obj.label98:setLeft(5);
    obj.label98:setTop(405);
    obj.label98:setWidth(90);
    obj.label98:setHeight(20);
    obj.label98:setText("Mental Limit");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout2);
    obj.rectangle29:setLeft(95);
    obj.rectangle29:setTop(405);
    obj.rectangle29:setWidth(50);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout2);
    obj.label99:setLeft(95);
    obj.label99:setTop(405);
    obj.label99:setWidth(50);
    obj.label99:setHeight(25);
    obj.label99:setField("limitMental");
    obj.label99:setVertTextAlign("center");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout2);
    obj.label100:setLeft(5);
    obj.label100:setTop(430);
    obj.label100:setWidth(90);
    obj.label100:setHeight(20);
    obj.label100:setText("Social Limit");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout2);
    obj.rectangle30:setLeft(95);
    obj.rectangle30:setTop(430);
    obj.rectangle30:setWidth(50);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout2);
    obj.label101:setLeft(95);
    obj.label101:setTop(430);
    obj.label101:setWidth(50);
    obj.label101:setHeight(25);
    obj.label101:setField("limitSocial");
    obj.label101:setVertTextAlign("center");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout2);
    obj.dataLink13:setFields({'attribute_body_effective', 'attribute_reaction_effective', 'attribute_strenght_effective'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout2);
    obj.dataLink14:setFields({'attribute_willpower_effective', 'attribute_intuition_effective', 'attribute_logic_effective'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout2);
    obj.dataLink15:setFields({'attribute_willpower_effective', 'attribute_essence_effective', 'attribute_charisma_effective'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout2);
    obj.dataLink16:setFields({'attribute_body_karma', 'attribute_agility_karma', 'attribute_reaction_karma', 'attribute_strenght_karma', 'attribute_charisma_karma', 'attribute_intuition_karma', 'attribute_logic_karma', 'attribute_willpower_karma', 'attribute_edge_karma', 'attribute_magic_karma', 'attribute_ressonance_karma'});
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout2);
    obj.dataLink17:setFields({'attribute_body_base', 'attribute_agility_base', 'attribute_reaction_base', 'attribute_strenght_base', 'attribute_charisma_base', 'attribute_intuition_base', 'attribute_logic_base', 'attribute_willpower_base', 'attribute_edge_base', 'attribute_magic_base', 'attribute_ressonance_base'});
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout2);
    obj.dataLink18:setFields({'attribute_body_initial', 'attribute_agility_initial', 'attribute_reaction_initial', 'attribute_strenght_initial', 'attribute_charisma_initial', 'attribute_intuition_initial', 'attribute_logic_initial', 'attribute_willpower_initial', 'attribute_edge_initial', 'attribute_magic_initial', 'attribute_ressonance_initial'});
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout2);
    obj.dataLink19:setField("augmentations_essence");
    obj.dataLink19:setName("dataLink19");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(265);
    obj.layout3:setTop(90);
    obj.layout3:setWidth(295);
    obj.layout3:setHeight(110);
    obj.layout3:setName("layout3");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout3);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout3);
    obj.label102:setLeft(5);
    obj.label102:setTop(0);
    obj.label102:setWidth(295);
    obj.label102:setHeight(20);
    obj.label102:setText("INITATIVES");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setTop(25);
    obj.layout4:setWidth(260);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout4);
    obj.button5:setLeft(5);
    obj.button5:setTop(0);
    obj.button5:setWidth(80);
    obj.button5:setHeight(25);
    obj.button5:setText("Initiative");
    obj.button5:setName("button5");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout4);
    obj.rectangle32:setLeft(90);
    obj.rectangle32:setWidth(50);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout4);
    obj.label103:setLeft(90);
    obj.label103:setWidth(50);
    obj.label103:setHeight(25);
    obj.label103:setField("initiativePhysical");
    obj.label103:setVertTextAlign("center");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout4);
    obj.label104:setLeft(140);
    obj.label104:setWidth(25);
    obj.label104:setHeight(25);
    obj.label104:setText("+");
    obj.label104:setName("label104");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout4);
    obj.edit107:setLeft(150);
    obj.edit107:setWidth(25);
    obj.edit107:setHeight(25);
    obj.edit107:setField("initiativePhysicalDice");
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setType("number");
    obj.edit107:setName("edit107");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout4);
    obj.label105:setLeft(175);
    obj.label105:setWidth(25);
    obj.label105:setHeight(25);
    obj.label105:setText("d6");
    obj.label105:setName("label105");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout4);
    obj.edit108:setLeft(205);
    obj.edit108:setWidth(50);
    obj.edit108:setHeight(25);
    obj.edit108:setField("initiativePhysicalOther");
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setType("number");
    obj.edit108:setName("edit108");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout4);
    obj.dataLink20:setField("initiativePhysicalDice");
    obj.dataLink20:setDefaultValue("1");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout4);
    obj.dataLink21:setFields({'attribute_reaction_effective', 'attribute_intuition_effective', 'initiativePhysicalOther'});
    obj.dataLink21:setName("dataLink21");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setTop(50);
    obj.layout5:setWidth(260);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout5);
    obj.button6:setLeft(5);
    obj.button6:setTop(0);
    obj.button6:setWidth(80);
    obj.button6:setHeight(25);
    obj.button6:setText("Matrix");
    obj.button6:setName("button6");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout5);
    obj.rectangle33:setLeft(90);
    obj.rectangle33:setWidth(50);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout5);
    obj.label106:setLeft(90);
    obj.label106:setWidth(50);
    obj.label106:setHeight(25);
    obj.label106:setField("initiativeMatrix");
    obj.label106:setVertTextAlign("center");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout5);
    obj.label107:setLeft(140);
    obj.label107:setWidth(25);
    obj.label107:setHeight(25);
    obj.label107:setText("+");
    obj.label107:setName("label107");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout5);
    obj.edit109:setLeft(150);
    obj.edit109:setWidth(25);
    obj.edit109:setHeight(25);
    obj.edit109:setField("initiativeMatrixDice");
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setType("number");
    obj.edit109:setName("edit109");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout5);
    obj.label108:setLeft(175);
    obj.label108:setWidth(25);
    obj.label108:setHeight(25);
    obj.label108:setText("d6");
    obj.label108:setName("label108");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout5);
    obj.edit110:setLeft(205);
    obj.edit110:setWidth(50);
    obj.edit110:setHeight(25);
    obj.edit110:setField("initiativeMatrixOther");
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setType("number");
    obj.edit110:setName("edit110");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout5);
    obj.dataLink22:setField("initiativeMatrixDice");
    obj.dataLink22:setDefaultValue("3");
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout5);
    obj.dataLink23:setFields({'attribute_intuition_effective', 'initiativeMatrixOther', 'cyberdeck_data_processing'});
    obj.dataLink23:setName("dataLink23");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setTop(75);
    obj.layout6:setWidth(260);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout6);
    obj.button7:setLeft(5);
    obj.button7:setTop(0);
    obj.button7:setWidth(80);
    obj.button7:setHeight(25);
    obj.button7:setText("Astral");
    obj.button7:setName("button7");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout6);
    obj.rectangle34:setLeft(90);
    obj.rectangle34:setWidth(50);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout6);
    obj.label109:setLeft(90);
    obj.label109:setWidth(50);
    obj.label109:setHeight(25);
    obj.label109:setField("initiativeAstral");
    obj.label109:setVertTextAlign("center");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout6);
    obj.label110:setLeft(140);
    obj.label110:setWidth(25);
    obj.label110:setHeight(25);
    obj.label110:setText("+");
    obj.label110:setName("label110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout6);
    obj.edit111:setLeft(150);
    obj.edit111:setWidth(25);
    obj.edit111:setHeight(25);
    obj.edit111:setField("initiativeAstralDice");
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setType("number");
    obj.edit111:setName("edit111");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout6);
    obj.label111:setLeft(175);
    obj.label111:setWidth(25);
    obj.label111:setHeight(25);
    obj.label111:setText("d6");
    obj.label111:setName("label111");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout6);
    obj.edit112:setLeft(205);
    obj.edit112:setWidth(50);
    obj.edit112:setHeight(25);
    obj.edit112:setField("initiativeAstralOther");
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setType("number");
    obj.edit112:setName("edit112");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout6);
    obj.dataLink24:setField("initiativeAstralDice");
    obj.dataLink24:setDefaultValue("2");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout6);
    obj.dataLink25:setFields({'attribute_intuition_effective', 'initiativeAstralOther'});
    obj.dataLink25:setName("dataLink25");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(265);
    obj.layout7:setTop(205);
    obj.layout7:setWidth(295);
    obj.layout7:setHeight(155);
    obj.layout7:setName("layout7");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout7);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout7);
    obj.label112:setLeft(5);
    obj.label112:setTop(0);
    obj.label112:setWidth(295);
    obj.label112:setHeight(20);
    obj.label112:setText("COMPOUND ATTRIBUTES");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout7);
    obj.label113:setLeft(5);
    obj.label113:setTop(25);
    obj.label113:setWidth(90);
    obj.label113:setHeight(20);
    obj.label113:setText("Composure");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout7);
    obj.rectangle36:setLeft(95);
    obj.rectangle36:setTop(25);
    obj.rectangle36:setWidth(50);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout7);
    obj.label114:setLeft(95);
    obj.label114:setTop(25);
    obj.label114:setWidth(50);
    obj.label114:setHeight(25);
    obj.label114:setField("attribute_composure");
    obj.label114:setVertTextAlign("center");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout7);
    obj.edit113:setLeft(145);
    obj.edit113:setTop(25);
    obj.edit113:setWidth(50);
    obj.edit113:setHeight(25);
    obj.edit113:setField("attribute_composure_other");
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout7);
    obj.dataLink26:setFields({'attribute_charisma_effective', 'attribute_willpower_effective', 'attribute_composure_other'});
    obj.dataLink26:setName("dataLink26");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout7);
    obj.label115:setLeft(5);
    obj.label115:setTop(50);
    obj.label115:setWidth(90);
    obj.label115:setHeight(20);
    obj.label115:setText("Judge Intention");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout7);
    obj.rectangle37:setLeft(95);
    obj.rectangle37:setTop(50);
    obj.rectangle37:setWidth(50);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout7);
    obj.label116:setLeft(95);
    obj.label116:setTop(50);
    obj.label116:setWidth(50);
    obj.label116:setHeight(25);
    obj.label116:setField("attribute_judge");
    obj.label116:setVertTextAlign("center");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout7);
    obj.edit114:setLeft(145);
    obj.edit114:setTop(50);
    obj.edit114:setWidth(50);
    obj.edit114:setHeight(25);
    obj.edit114:setField("attribute_judge_other");
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setName("edit114");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout7);
    obj.dataLink27:setFields({'attribute_charisma_effective', 'attribute_intuition_effective', 'attribute_judge_other'});
    obj.dataLink27:setName("dataLink27");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout7);
    obj.label117:setLeft(5);
    obj.label117:setTop(75);
    obj.label117:setWidth(90);
    obj.label117:setHeight(20);
    obj.label117:setText("Lifting/Carrying");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout7);
    obj.rectangle38:setLeft(95);
    obj.rectangle38:setTop(75);
    obj.rectangle38:setWidth(50);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout7);
    obj.label118:setLeft(95);
    obj.label118:setTop(75);
    obj.label118:setWidth(50);
    obj.label118:setHeight(25);
    obj.label118:setField("attribute_lifting");
    obj.label118:setVertTextAlign("center");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout7);
    obj.edit115:setLeft(145);
    obj.edit115:setTop(75);
    obj.edit115:setWidth(50);
    obj.edit115:setHeight(25);
    obj.edit115:setField("attribute_lifting_other");
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setName("edit115");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout7);
    obj.dataLink28:setFields({'attribute_body_effective', 'attribute_strenght_effective', 'attribute_lifting_other'});
    obj.dataLink28:setName("dataLink28");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout7);
    obj.label119:setLeft(5);
    obj.label119:setTop(100);
    obj.label119:setWidth(90);
    obj.label119:setHeight(20);
    obj.label119:setText("Memory");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout7);
    obj.rectangle39:setLeft(95);
    obj.rectangle39:setTop(100);
    obj.rectangle39:setWidth(50);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout7);
    obj.label120:setLeft(95);
    obj.label120:setTop(100);
    obj.label120:setWidth(50);
    obj.label120:setHeight(25);
    obj.label120:setField("attribute_memory");
    obj.label120:setVertTextAlign("center");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout7);
    obj.edit116:setLeft(145);
    obj.edit116:setTop(100);
    obj.edit116:setWidth(50);
    obj.edit116:setHeight(25);
    obj.edit116:setField("attribute_memory_other");
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout7);
    obj.dataLink29:setFields({'attribute_logic_effective', 'attribute_willpower_effective', 'attribute_memory_other'});
    obj.dataLink29:setName("dataLink29");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout7);
    obj.label121:setLeft(5);
    obj.label121:setTop(125);
    obj.label121:setWidth(90);
    obj.label121:setHeight(20);
    obj.label121:setText("Movement");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout7);
    obj.rectangle40:setLeft(95);
    obj.rectangle40:setTop(125);
    obj.rectangle40:setWidth(50);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout7);
    obj.label122:setLeft(95);
    obj.label122:setTop(125);
    obj.label122:setWidth(50);
    obj.label122:setHeight(25);
    obj.label122:setField("attribute_movement_walk");
    obj.label122:setVertTextAlign("center");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout7);
    obj.rectangle41:setLeft(145);
    obj.rectangle41:setTop(125);
    obj.rectangle41:setWidth(50);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout7);
    obj.label123:setLeft(145);
    obj.label123:setTop(125);
    obj.label123:setWidth(50);
    obj.label123:setHeight(25);
    obj.label123:setField("attribute_movement_run");
    obj.label123:setVertTextAlign("center");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout7);
    obj.dataLink30:setField("attribute_agility_effective");
    obj.dataLink30:setName("dataLink30");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(265);
    obj.layout8:setTop(365);
    obj.layout8:setWidth(295);
    obj.layout8:setHeight(130);
    obj.layout8:setName("layout8");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout8);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout8);
    obj.label124:setLeft(5);
    obj.label124:setTop(0);
    obj.label124:setWidth(300);
    obj.label124:setHeight(20);
    obj.label124:setText("CONDITION MONITOR");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout8);
    obj.label125:setLeft(95);
    obj.label125:setTop(25);
    obj.label125:setWidth(40);
    obj.label125:setHeight(20);
    obj.label125:setText("Total");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout8);
    obj.label126:setLeft(135);
    obj.label126:setTop(25);
    obj.label126:setWidth(30);
    obj.label126:setHeight(20);
    obj.label126:setText("Bonus");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setFontSize(11);
    obj.label126:setName("label126");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout8);
    obj.label127:setLeft(170);
    obj.label127:setTop(25);
    obj.label127:setWidth(30);
    obj.label127:setHeight(20);
    obj.label127:setText("DMG");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setFontSize(11);
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout8);
    obj.label128:setLeft(200);
    obj.label128:setTop(25);
    obj.label128:setWidth(40);
    obj.label128:setHeight(20);
    obj.label128:setText("Left");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout8);
    obj.label129:setLeft(240);
    obj.label129:setTop(25);
    obj.label129:setWidth(50);
    obj.label129:setHeight(20);
    obj.label129:setText("Modifier");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout8);
    obj.label130:setLeft(5);
    obj.label130:setTop(50);
    obj.label130:setWidth(90);
    obj.label130:setHeight(20);
    obj.label130:setText("Physical");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout8);
    obj.rectangle43:setLeft(95);
    obj.rectangle43:setTop(50);
    obj.rectangle43:setWidth(40);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout8);
    obj.label131:setLeft(95);
    obj.label131:setTop(50);
    obj.label131:setWidth(40);
    obj.label131:setHeight(25);
    obj.label131:setField("monitor_physical");
    obj.label131:setVertTextAlign("center");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout8);
    obj.edit117:setLeft(135);
    obj.edit117:setTop(50);
    obj.edit117:setWidth(30);
    obj.edit117:setHeight(25);
    obj.edit117:setField("monitor_physical_other");
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout8);
    obj.edit118:setLeft(170);
    obj.edit118:setTop(50);
    obj.edit118:setWidth(30);
    obj.edit118:setHeight(25);
    obj.edit118:setField("monitor_physical_damage");
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setName("edit118");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout8);
    obj.rectangle44:setLeft(200);
    obj.rectangle44:setTop(50);
    obj.rectangle44:setWidth(40);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout8);
    obj.label132:setLeft(200);
    obj.label132:setTop(50);
    obj.label132:setWidth(40);
    obj.label132:setHeight(25);
    obj.label132:setField("monitor_physical_left");
    obj.label132:setVertTextAlign("center");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout8);
    obj.label133:setLeft(240);
    obj.label133:setTop(50);
    obj.label133:setWidth(50);
    obj.label133:setHeight(25);
    obj.label133:setField("monitor_physical_modifier");
    obj.label133:setVertTextAlign("center");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout8);
    obj.dataLink31:setFields({'attribute_body_effective', 'monitor_physical_other'});
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout8);
    obj.dataLink32:setFields({'monitor_physical_damage', 'monitor_physical'});
    obj.dataLink32:setName("dataLink32");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout8);
    obj.label134:setLeft(5);
    obj.label134:setTop(75);
    obj.label134:setWidth(90);
    obj.label134:setHeight(20);
    obj.label134:setText("Stun");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout8);
    obj.rectangle45:setLeft(95);
    obj.rectangle45:setTop(75);
    obj.rectangle45:setWidth(40);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout8);
    obj.label135:setLeft(95);
    obj.label135:setTop(75);
    obj.label135:setWidth(40);
    obj.label135:setHeight(25);
    obj.label135:setField("monitor_stun");
    obj.label135:setVertTextAlign("center");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout8);
    obj.edit119:setLeft(135);
    obj.edit119:setTop(75);
    obj.edit119:setWidth(30);
    obj.edit119:setHeight(25);
    obj.edit119:setField("monitor_stun_other");
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout8);
    obj.edit120:setLeft(170);
    obj.edit120:setTop(75);
    obj.edit120:setWidth(30);
    obj.edit120:setHeight(25);
    obj.edit120:setField("monitor_stun_damage");
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setName("edit120");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout8);
    obj.rectangle46:setLeft(200);
    obj.rectangle46:setTop(75);
    obj.rectangle46:setWidth(40);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout8);
    obj.label136:setLeft(200);
    obj.label136:setTop(75);
    obj.label136:setWidth(40);
    obj.label136:setHeight(25);
    obj.label136:setField("monitor_stun_left");
    obj.label136:setVertTextAlign("center");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout8);
    obj.label137:setLeft(240);
    obj.label137:setTop(75);
    obj.label137:setWidth(50);
    obj.label137:setHeight(25);
    obj.label137:setField("monitor_stun_modifier");
    obj.label137:setVertTextAlign("center");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout8);
    obj.dataLink33:setFields({'attribute_willpower_effective', 'monitor_stun_other'});
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout8);
    obj.dataLink34:setFields({'monitor_stun_damage', 'monitor_stun'});
    obj.dataLink34:setName("dataLink34");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout8);
    obj.label138:setLeft(5);
    obj.label138:setTop(100);
    obj.label138:setWidth(90);
    obj.label138:setHeight(20);
    obj.label138:setText("Overflow");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout8);
    obj.rectangle47:setLeft(95);
    obj.rectangle47:setTop(100);
    obj.rectangle47:setWidth(40);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout8);
    obj.label139:setLeft(95);
    obj.label139:setTop(100);
    obj.label139:setWidth(40);
    obj.label139:setHeight(25);
    obj.label139:setField("monitor_overflow");
    obj.label139:setVertTextAlign("center");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout8);
    obj.edit121:setLeft(135);
    obj.edit121:setTop(100);
    obj.edit121:setWidth(30);
    obj.edit121:setHeight(25);
    obj.edit121:setField("monitor_overflow_other");
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout8);
    obj.edit122:setLeft(170);
    obj.edit122:setTop(100);
    obj.edit122:setWidth(30);
    obj.edit122:setHeight(25);
    obj.edit122:setField("monitor_overflow_damage");
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setName("edit122");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout8);
    obj.rectangle48:setLeft(200);
    obj.rectangle48:setTop(100);
    obj.rectangle48:setWidth(40);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout8);
    obj.label140:setLeft(200);
    obj.label140:setTop(100);
    obj.label140:setWidth(40);
    obj.label140:setHeight(25);
    obj.label140:setField("monitor_overflow_left");
    obj.label140:setVertTextAlign("center");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout8);
    obj.label141:setLeft(240);
    obj.label141:setTop(100);
    obj.label141:setWidth(50);
    obj.label141:setHeight(25);
    obj.label141:setField("monitor_overflow_modifier");
    obj.label141:setVertTextAlign("center");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout8);
    obj.dataLink35:setFields({'attribute_body_effective', 'monitor_overflow_other'});
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout8);
    obj.dataLink36:setFields({'monitor_overflow_damage', 'monitor_overflow'});
    obj.dataLink36:setName("dataLink36");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.scrollBox1);
    obj.rectangle49:setLeft(565);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(200);
    obj.rectangle49:setHeight(200);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.rectangle49);
    obj.label142:setLeft(0);
    obj.label142:setTop(90);
    obj.label142:setWidth(200);
    obj.label142:setHeight(20);
    obj.label142:setText("Avatar");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle49);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Skills");
    obj.tab2:setName("tab2");

    obj.frmSkills = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSkills:setParent(obj.tab2);
    obj.frmSkills:setName("frmSkills");
    obj.frmSkills:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmSkills);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox2);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(0);
    obj.layout9:setWidth(285);
    obj.layout9:setHeight(685);
    obj.layout9:setName("layout9");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout9);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setName("rectangle50");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout9);
    obj.label143:setLeft(5);
    obj.label143:setTop(0);
    obj.label143:setWidth(285);
    obj.label143:setHeight(20);
    obj.label143:setText("ACTIVE SKILLS");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout9);
    obj.button8:setText("+");
    obj.button8:setLeft(5);
    obj.button8:setTop(0);
    obj.button8:setWidth(25);
    obj.button8:setHeight(25);
    obj.button8:setName("button8");

    obj.rclSkillList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSkillList:setParent(obj.layout9);
    obj.rclSkillList:setName("rclSkillList");
    obj.rclSkillList:setField("skillList");
    obj.rclSkillList:setTemplateForm("frmActiveSkill");
    obj.rclSkillList:setLeft(5);
    obj.rclSkillList:setTop(25);
    obj.rclSkillList:setWidth(275);
    obj.rclSkillList:setHeight(650);
    obj.rclSkillList:setLayout("vertical");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox2);
    obj.layout10:setLeft(290);
    obj.layout10:setTop(0);
    obj.layout10:setWidth(285);
    obj.layout10:setHeight(685);
    obj.layout10:setName("layout10");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout10);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setName("rectangle51");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout10);
    obj.label144:setLeft(5);
    obj.label144:setTop(0);
    obj.label144:setWidth(285);
    obj.label144:setHeight(20);
    obj.label144:setText("KNOWLEDGE SKILLS");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout10);
    obj.button9:setText("+");
    obj.button9:setLeft(5);
    obj.button9:setTop(0);
    obj.button9:setWidth(25);
    obj.button9:setHeight(25);
    obj.button9:setName("button9");

    obj.rclKnowledgeList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclKnowledgeList:setParent(obj.layout10);
    obj.rclKnowledgeList:setName("rclKnowledgeList");
    obj.rclKnowledgeList:setField("knowledgeList");
    obj.rclKnowledgeList:setTemplateForm("frmKnowledgeSkill");
    obj.rclKnowledgeList:setLeft(5);
    obj.rclKnowledgeList:setTop(25);
    obj.rclKnowledgeList:setWidth(275);
    obj.rclKnowledgeList:setHeight(650);
    obj.rclKnowledgeList:setLayout("vertical");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox2);
    obj.layout11:setLeft(580);
    obj.layout11:setTop(0);
    obj.layout11:setWidth(285);
    obj.layout11:setHeight(685);
    obj.layout11:setName("layout11");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout11);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout11);
    obj.label145:setLeft(5);
    obj.label145:setTop(0);
    obj.label145:setWidth(285);
    obj.label145:setHeight(20);
    obj.label145:setText("LANGUAGE SKILLS");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout11);
    obj.button10:setText("+");
    obj.button10:setLeft(5);
    obj.button10:setTop(0);
    obj.button10:setWidth(25);
    obj.button10:setHeight(25);
    obj.button10:setName("button10");

    obj.rclLanguageList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLanguageList:setParent(obj.layout11);
    obj.rclLanguageList:setName("rclLanguageList");
    obj.rclLanguageList:setField("languageList");
    obj.rclLanguageList:setTemplateForm("frmLanguageSkill");
    obj.rclLanguageList:setLeft(5);
    obj.rclLanguageList:setTop(25);
    obj.rclLanguageList:setWidth(275);
    obj.rclLanguageList:setHeight(650);
    obj.rclLanguageList:setLayout("vertical");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Qualities");
    obj.tab3:setName("tab3");

    obj.frmQualities = GUI.fromHandle(_obj_newObject("form"));
    obj.frmQualities:setParent(obj.tab3);
    obj.frmQualities:setName("frmQualities");
    obj.frmQualities:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmQualities);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox3);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(0);
    obj.layout12:setWidth(410);
    obj.layout12:setHeight(685);
    obj.layout12:setName("layout12");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout12);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("black");
    obj.rectangle53:setName("rectangle53");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout12);
    obj.label146:setLeft(5);
    obj.label146:setTop(0);
    obj.label146:setWidth(410);
    obj.label146:setHeight(20);
    obj.label146:setText("POSITIVE QUALITIES");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout12);
    obj.button11:setText("+");
    obj.button11:setLeft(5);
    obj.button11:setTop(0);
    obj.button11:setWidth(25);
    obj.button11:setHeight(25);
    obj.button11:setName("button11");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout12);
    obj.label147:setText("NAME");
    obj.label147:setLeft(5);
    obj.label147:setTop(25);
    obj.label147:setWidth(150);
    obj.label147:setHeight(20);
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout12);
    obj.label148:setText("NOTES");
    obj.label148:setLeft(155);
    obj.label148:setTop(25);
    obj.label148:setWidth(150);
    obj.label148:setHeight(20);
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout12);
    obj.label149:setText("KARMA");
    obj.label149:setLeft(305);
    obj.label149:setTop(25);
    obj.label149:setWidth(50);
    obj.label149:setHeight(20);
    obj.label149:setHorzTextAlign("center");
    obj.label149:setName("label149");

    obj.rclPositiveQualities = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPositiveQualities:setParent(obj.layout12);
    obj.rclPositiveQualities:setName("rclPositiveQualities");
    obj.rclPositiveQualities:setField("positiveQualityList");
    obj.rclPositiveQualities:setTemplateForm("frmQuality");
    obj.rclPositiveQualities:setLeft(5);
    obj.rclPositiveQualities:setTop(50);
    obj.rclPositiveQualities:setWidth(400);
    obj.rclPositiveQualities:setHeight(625);
    obj.rclPositiveQualities:setLayout("vertical");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox3);
    obj.layout13:setLeft(415);
    obj.layout13:setTop(0);
    obj.layout13:setWidth(410);
    obj.layout13:setHeight(685);
    obj.layout13:setName("layout13");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout13);
    obj.rectangle54:setAlign("client");
    obj.rectangle54:setColor("black");
    obj.rectangle54:setName("rectangle54");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout13);
    obj.label150:setLeft(5);
    obj.label150:setTop(0);
    obj.label150:setWidth(410);
    obj.label150:setHeight(20);
    obj.label150:setText("NEGATIVE QUALITIES");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout13);
    obj.button12:setText("+");
    obj.button12:setLeft(5);
    obj.button12:setTop(0);
    obj.button12:setWidth(25);
    obj.button12:setHeight(25);
    obj.button12:setName("button12");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout13);
    obj.label151:setText("NAME");
    obj.label151:setLeft(5);
    obj.label151:setTop(25);
    obj.label151:setWidth(150);
    obj.label151:setHeight(20);
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout13);
    obj.label152:setText("NOTES");
    obj.label152:setLeft(155);
    obj.label152:setTop(25);
    obj.label152:setWidth(150);
    obj.label152:setHeight(20);
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout13);
    obj.label153:setText("KARMA");
    obj.label153:setLeft(305);
    obj.label153:setTop(25);
    obj.label153:setWidth(50);
    obj.label153:setHeight(20);
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.rclNegativeQualities = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclNegativeQualities:setParent(obj.layout13);
    obj.rclNegativeQualities:setName("rclNegativeQualities");
    obj.rclNegativeQualities:setField("negativeQualityList");
    obj.rclNegativeQualities:setTemplateForm("frmQuality");
    obj.rclNegativeQualities:setLeft(5);
    obj.rclNegativeQualities:setTop(50);
    obj.rclNegativeQualities:setWidth(400);
    obj.rclNegativeQualities:setHeight(625);
    obj.rclNegativeQualities:setLayout("vertical");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox3);
    obj.layout14:setLeft(830);
    obj.layout14:setTop(0);
    obj.layout14:setWidth(360);
    obj.layout14:setHeight(685);
    obj.layout14:setName("layout14");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout14);
    obj.rectangle55:setAlign("client");
    obj.rectangle55:setColor("black");
    obj.rectangle55:setName("rectangle55");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout14);
    obj.label154:setLeft(5);
    obj.label154:setTop(0);
    obj.label154:setWidth(360);
    obj.label154:setHeight(20);
    obj.label154:setText("CONTACTS");
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout14);
    obj.button13:setText("+");
    obj.button13:setLeft(5);
    obj.button13:setTop(0);
    obj.button13:setWidth(25);
    obj.button13:setHeight(25);
    obj.button13:setName("button13");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout14);
    obj.label155:setText("NAME");
    obj.label155:setLeft(5);
    obj.label155:setTop(25);
    obj.label155:setWidth(150);
    obj.label155:setHeight(20);
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout14);
    obj.label156:setText("LOYALTY");
    obj.label156:setLeft(155);
    obj.label156:setTop(25);
    obj.label156:setWidth(50);
    obj.label156:setHeight(20);
    obj.label156:setHorzTextAlign("center");
    obj.label156:setFontSize(12);
    obj.label156:setName("label156");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout14);
    obj.label157:setText("CONNECTION");
    obj.label157:setLeft(205);
    obj.label157:setTop(25);
    obj.label157:setWidth(50);
    obj.label157:setHeight(20);
    obj.label157:setHorzTextAlign("center");
    obj.label157:setFontSize(7);
    obj.label157:setName("label157");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout14);
    obj.label158:setText("FAVOR");
    obj.label158:setLeft(255);
    obj.label158:setTop(25);
    obj.label158:setWidth(50);
    obj.label158:setHeight(20);
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.rclContacts = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclContacts:setParent(obj.layout14);
    obj.rclContacts:setName("rclContacts");
    obj.rclContacts:setField("contactList");
    obj.rclContacts:setTemplateForm("frmContact");
    obj.rclContacts:setLeft(5);
    obj.rclContacts:setTop(50);
    obj.rclContacts:setWidth(350);
    obj.rclContacts:setHeight(625);
    obj.rclContacts:setLayout("vertical");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Combat");
    obj.tab4:setName("tab4");

    obj.frmCombat = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCombat:setParent(obj.tab4);
    obj.frmCombat:setName("frmCombat");
    obj.frmCombat:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmCombat);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox4);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(0);
    obj.layout15:setWidth(540);
    obj.layout15:setHeight(340);
    obj.layout15:setName("layout15");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout15);
    obj.rectangle56:setAlign("client");
    obj.rectangle56:setColor("black");
    obj.rectangle56:setName("rectangle56");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout15);
    obj.label159:setLeft(5);
    obj.label159:setTop(0);
    obj.label159:setWidth(540);
    obj.label159:setHeight(20);
    obj.label159:setText("RANGED WEAPONS");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout15);
    obj.button14:setText("+");
    obj.button14:setLeft(5);
    obj.button14:setTop(0);
    obj.button14:setWidth(25);
    obj.button14:setHeight(25);
    obj.button14:setName("button14");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout15);
    obj.label160:setText("WEAPON");
    obj.label160:setLeft(5);
    obj.label160:setTop(25);
    obj.label160:setWidth(150);
    obj.label160:setHeight(20);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout15);
    obj.label161:setText("DMG");
    obj.label161:setLeft(155);
    obj.label161:setTop(25);
    obj.label161:setWidth(40);
    obj.label161:setHeight(20);
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout15);
    obj.label162:setText("ACC");
    obj.label162:setLeft(195);
    obj.label162:setTop(25);
    obj.label162:setWidth(40);
    obj.label162:setHeight(20);
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout15);
    obj.label163:setText("AP");
    obj.label163:setLeft(235);
    obj.label163:setTop(25);
    obj.label163:setWidth(40);
    obj.label163:setHeight(20);
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout15);
    obj.label164:setText("MODE");
    obj.label164:setLeft(275);
    obj.label164:setTop(25);
    obj.label164:setWidth(40);
    obj.label164:setHeight(20);
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout15);
    obj.label165:setText("RC");
    obj.label165:setLeft(315);
    obj.label165:setTop(25);
    obj.label165:setWidth(40);
    obj.label165:setHeight(20);
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout15);
    obj.label166:setText("AMMO");
    obj.label166:setLeft(355);
    obj.label166:setTop(25);
    obj.label166:setWidth(40);
    obj.label166:setHeight(20);
    obj.label166:setHorzTextAlign("center");
    obj.label166:setFontSize(11);
    obj.label166:setName("label166");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout15);
    obj.label167:setText("PRICE");
    obj.label167:setLeft(395);
    obj.label167:setTop(25);
    obj.label167:setWidth(40);
    obj.label167:setHeight(20);
    obj.label167:setHorzTextAlign("center");
    obj.label167:setFontSize(12);
    obj.label167:setName("label167");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout15);
    obj.label168:setText("WEIGHT");
    obj.label168:setLeft(435);
    obj.label168:setTop(25);
    obj.label168:setWidth(40);
    obj.label168:setHeight(20);
    obj.label168:setHorzTextAlign("center");
    obj.label168:setFontSize(11);
    obj.label168:setName("label168");

    obj.rclRangedWeapons = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclRangedWeapons:setParent(obj.layout15);
    obj.rclRangedWeapons:setName("rclRangedWeapons");
    obj.rclRangedWeapons:setField("rangedWeaponsList");
    obj.rclRangedWeapons:setTemplateForm("frmRanged");
    obj.rclRangedWeapons:setLeft(5);
    obj.rclRangedWeapons:setTop(50);
    obj.rclRangedWeapons:setWidth(530);
    obj.rclRangedWeapons:setHeight(280);
    obj.rclRangedWeapons:setLayout("vertical");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox4);
    obj.layout16:setLeft(545);
    obj.layout16:setTop(0);
    obj.layout16:setWidth(450);
    obj.layout16:setHeight(340);
    obj.layout16:setName("layout16");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout16);
    obj.rectangle57:setAlign("client");
    obj.rectangle57:setColor("black");
    obj.rectangle57:setName("rectangle57");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout16);
    obj.label169:setLeft(5);
    obj.label169:setTop(0);
    obj.label169:setWidth(450);
    obj.label169:setHeight(20);
    obj.label169:setText("MELEE WEAPONS");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout16);
    obj.button15:setText("+");
    obj.button15:setLeft(5);
    obj.button15:setTop(0);
    obj.button15:setWidth(25);
    obj.button15:setHeight(25);
    obj.button15:setName("button15");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout16);
    obj.label170:setText("WEAPON");
    obj.label170:setLeft(5);
    obj.label170:setTop(25);
    obj.label170:setWidth(150);
    obj.label170:setHeight(20);
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout16);
    obj.label171:setText("REACH");
    obj.label171:setLeft(155);
    obj.label171:setTop(25);
    obj.label171:setWidth(40);
    obj.label171:setHeight(20);
    obj.label171:setHorzTextAlign("center");
    obj.label171:setFontSize(11);
    obj.label171:setName("label171");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout16);
    obj.label172:setText("DMG");
    obj.label172:setLeft(195);
    obj.label172:setTop(25);
    obj.label172:setWidth(40);
    obj.label172:setHeight(20);
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout16);
    obj.label173:setText("ACC");
    obj.label173:setLeft(235);
    obj.label173:setTop(25);
    obj.label173:setWidth(40);
    obj.label173:setHeight(20);
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout16);
    obj.label174:setText("AP");
    obj.label174:setLeft(275);
    obj.label174:setTop(25);
    obj.label174:setWidth(40);
    obj.label174:setHeight(20);
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout16);
    obj.label175:setText("PRICE");
    obj.label175:setLeft(315);
    obj.label175:setTop(25);
    obj.label175:setWidth(40);
    obj.label175:setHeight(20);
    obj.label175:setHorzTextAlign("center");
    obj.label175:setFontSize(12);
    obj.label175:setName("label175");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout16);
    obj.label176:setText("WEIGHT");
    obj.label176:setLeft(355);
    obj.label176:setTop(25);
    obj.label176:setWidth(40);
    obj.label176:setHeight(20);
    obj.label176:setHorzTextAlign("center");
    obj.label176:setFontSize(11);
    obj.label176:setName("label176");

    obj.rclMeleeWeapons = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMeleeWeapons:setParent(obj.layout16);
    obj.rclMeleeWeapons:setName("rclMeleeWeapons");
    obj.rclMeleeWeapons:setField("meleeWeaponsList");
    obj.rclMeleeWeapons:setTemplateForm("frmMelee");
    obj.rclMeleeWeapons:setLeft(5);
    obj.rclMeleeWeapons:setTop(50);
    obj.rclMeleeWeapons:setWidth(440);
    obj.rclMeleeWeapons:setHeight(280);
    obj.rclMeleeWeapons:setLayout("vertical");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox4);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(345);
    obj.layout17:setWidth(460);
    obj.layout17:setHeight(340);
    obj.layout17:setName("layout17");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout17);
    obj.rectangle58:setAlign("client");
    obj.rectangle58:setColor("black");
    obj.rectangle58:setName("rectangle58");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout17);
    obj.label177:setLeft(5);
    obj.label177:setTop(0);
    obj.label177:setWidth(460);
    obj.label177:setHeight(20);
    obj.label177:setText("AUGMENTATIONS");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout17);
    obj.button16:setText("+");
    obj.button16:setLeft(5);
    obj.button16:setTop(0);
    obj.button16:setWidth(25);
    obj.button16:setHeight(25);
    obj.button16:setName("button16");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout17);
    obj.label178:setText("AUGMENTATION");
    obj.label178:setLeft(5);
    obj.label178:setTop(25);
    obj.label178:setWidth(150);
    obj.label178:setHeight(20);
    obj.label178:setHorzTextAlign("center");
    obj.label178:setName("label178");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout17);
    obj.label179:setText("RATING");
    obj.label179:setLeft(155);
    obj.label179:setTop(25);
    obj.label179:setWidth(50);
    obj.label179:setHeight(20);
    obj.label179:setHorzTextAlign("center");
    obj.label179:setFontSize(11);
    obj.label179:setName("label179");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout17);
    obj.label180:setText("NOTES");
    obj.label180:setLeft(205);
    obj.label180:setTop(25);
    obj.label180:setWidth(100);
    obj.label180:setHeight(20);
    obj.label180:setHorzTextAlign("center");
    obj.label180:setName("label180");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout17);
    obj.label181:setText("ESSENCE");
    obj.label181:setLeft(305);
    obj.label181:setTop(25);
    obj.label181:setWidth(50);
    obj.label181:setHeight(20);
    obj.label181:setHorzTextAlign("center");
    obj.label181:setFontSize(11);
    obj.label181:setName("label181");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout17);
    obj.label182:setText("PRICE");
    obj.label182:setLeft(355);
    obj.label182:setTop(25);
    obj.label182:setWidth(50);
    obj.label182:setHeight(20);
    obj.label182:setHorzTextAlign("center");
    obj.label182:setFontSize(12);
    obj.label182:setName("label182");

    obj.rclAugmentations = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAugmentations:setParent(obj.layout17);
    obj.rclAugmentations:setName("rclAugmentations");
    obj.rclAugmentations:setField("augmentationsList");
    obj.rclAugmentations:setTemplateForm("frmAugmentation");
    obj.rclAugmentations:setLeft(5);
    obj.rclAugmentations:setTop(50);
    obj.rclAugmentations:setWidth(450);
    obj.rclAugmentations:setHeight(280);
    obj.rclAugmentations:setLayout("vertical");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox4);
    obj.layout18:setLeft(465);
    obj.layout18:setTop(345);
    obj.layout18:setWidth(360);
    obj.layout18:setHeight(340);
    obj.layout18:setName("layout18");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout18);
    obj.rectangle59:setAlign("client");
    obj.rectangle59:setColor("black");
    obj.rectangle59:setName("rectangle59");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout18);
    obj.label183:setLeft(5);
    obj.label183:setTop(0);
    obj.label183:setWidth(360);
    obj.label183:setHeight(20);
    obj.label183:setText("ARMOR");
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout18);
    obj.button17:setText("+");
    obj.button17:setLeft(5);
    obj.button17:setTop(0);
    obj.button17:setWidth(25);
    obj.button17:setHeight(25);
    obj.button17:setName("button17");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout18);
    obj.label184:setText("ARMOR");
    obj.label184:setLeft(5);
    obj.label184:setTop(25);
    obj.label184:setWidth(100);
    obj.label184:setHeight(20);
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout18);
    obj.label185:setText("RATING");
    obj.label185:setLeft(105);
    obj.label185:setTop(25);
    obj.label185:setWidth(40);
    obj.label185:setHeight(20);
    obj.label185:setHorzTextAlign("center");
    obj.label185:setFontSize(11);
    obj.label185:setName("label185");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout18);
    obj.label186:setText("NOTES");
    obj.label186:setLeft(145);
    obj.label186:setTop(25);
    obj.label186:setWidth(80);
    obj.label186:setHeight(20);
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout18);
    obj.label187:setText("PRICE");
    obj.label187:setLeft(225);
    obj.label187:setTop(25);
    obj.label187:setWidth(40);
    obj.label187:setHeight(20);
    obj.label187:setHorzTextAlign("center");
    obj.label187:setFontSize(12);
    obj.label187:setName("label187");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout18);
    obj.label188:setText("WEIGHT");
    obj.label188:setLeft(265);
    obj.label188:setTop(25);
    obj.label188:setWidth(40);
    obj.label188:setHeight(20);
    obj.label188:setHorzTextAlign("center");
    obj.label188:setFontSize(11);
    obj.label188:setName("label188");

    obj.rclArmor = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmor:setParent(obj.layout18);
    obj.rclArmor:setName("rclArmor");
    obj.rclArmor:setField("armorList");
    obj.rclArmor:setTemplateForm("frmArmor");
    obj.rclArmor:setLeft(5);
    obj.rclArmor:setTop(50);
    obj.rclArmor:setWidth(350);
    obj.rclArmor:setHeight(280);
    obj.rclArmor:setLayout("vertical");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Inventory");
    obj.tab5:setName("tab5");

    obj.frmInventory = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInventory:setParent(obj.tab5);
    obj.frmInventory:setName("frmInventory");
    obj.frmInventory:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmInventory);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox5);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(0);
    obj.layout19:setWidth(360);
    obj.layout19:setHeight(685);
    obj.layout19:setName("layout19");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout19);
    obj.rectangle60:setAlign("client");
    obj.rectangle60:setColor("black");
    obj.rectangle60:setName("rectangle60");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout19);
    obj.label189:setLeft(5);
    obj.label189:setTop(0);
    obj.label189:setWidth(360);
    obj.label189:setHeight(20);
    obj.label189:setText("GEAR");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout19);
    obj.button18:setText("+");
    obj.button18:setLeft(5);
    obj.button18:setTop(0);
    obj.button18:setWidth(25);
    obj.button18:setHeight(25);
    obj.button18:setName("button18");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout19);
    obj.label190:setText("ITEM");
    obj.label190:setLeft(5);
    obj.label190:setTop(25);
    obj.label190:setWidth(150);
    obj.label190:setHeight(20);
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout19);
    obj.label191:setText("RATING");
    obj.label191:setLeft(155);
    obj.label191:setTop(25);
    obj.label191:setWidth(50);
    obj.label191:setHeight(20);
    obj.label191:setHorzTextAlign("center");
    obj.label191:setFontSize(11);
    obj.label191:setName("label191");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout19);
    obj.label192:setText("PRICE");
    obj.label192:setLeft(205);
    obj.label192:setTop(25);
    obj.label192:setWidth(50);
    obj.label192:setHeight(20);
    obj.label192:setHorzTextAlign("center");
    obj.label192:setFontSize(12);
    obj.label192:setName("label192");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout19);
    obj.label193:setText("WEIGHT");
    obj.label193:setLeft(255);
    obj.label193:setTop(25);
    obj.label193:setWidth(50);
    obj.label193:setHeight(20);
    obj.label193:setHorzTextAlign("center");
    obj.label193:setFontSize(11);
    obj.label193:setName("label193");

    obj.rclGearList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclGearList:setParent(obj.layout19);
    obj.rclGearList:setName("rclGearList");
    obj.rclGearList:setField("gearList");
    obj.rclGearList:setTemplateForm("frmGear");
    obj.rclGearList:setLeft(5);
    obj.rclGearList:setTop(50);
    obj.rclGearList:setWidth(350);
    obj.rclGearList:setHeight(625);
    obj.rclGearList:setLayout("vertical");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox5);
    obj.layout20:setLeft(365);
    obj.layout20:setTop(0);
    obj.layout20:setWidth(360);
    obj.layout20:setHeight(340);
    obj.layout20:setName("layout20");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout20);
    obj.rectangle61:setAlign("client");
    obj.rectangle61:setColor("black");
    obj.rectangle61:setName("rectangle61");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout20);
    obj.label194:setLeft(5);
    obj.label194:setTop(0);
    obj.label194:setWidth(360);
    obj.label194:setHeight(20);
    obj.label194:setText("CYBERDECK");
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout20);
    obj.label195:setText("MODEL");
    obj.label195:setLeft(5);
    obj.label195:setTop(25);
    obj.label195:setWidth(60);
    obj.label195:setHeight(20);
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout20);
    obj.edit123:setLeft(65);
    obj.edit123:setTop(25);
    obj.edit123:setWidth(55);
    obj.edit123:setHeight(25);
    obj.edit123:setField("cyberdeck_model");
    obj.edit123:setName("edit123");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout20);
    obj.label196:setText("ATTACK");
    obj.label196:setLeft(125);
    obj.label196:setTop(25);
    obj.label196:setWidth(60);
    obj.label196:setHeight(20);
    obj.label196:setHorzTextAlign("center");
    obj.label196:setName("label196");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout20);
    obj.edit124:setLeft(185);
    obj.edit124:setTop(25);
    obj.edit124:setWidth(55);
    obj.edit124:setHeight(25);
    obj.edit124:setField("cyberdeck_attack");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setType("number");
    obj.edit124:setName("edit124");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout20);
    obj.label197:setText("SLEAZE");
    obj.label197:setLeft(245);
    obj.label197:setTop(25);
    obj.label197:setWidth(60);
    obj.label197:setHeight(20);
    obj.label197:setHorzTextAlign("center");
    obj.label197:setName("label197");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout20);
    obj.edit125:setLeft(305);
    obj.edit125:setTop(25);
    obj.edit125:setWidth(50);
    obj.edit125:setHeight(25);
    obj.edit125:setField("cyberdeck_sleaze");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setType("number");
    obj.edit125:setName("edit125");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout20);
    obj.label198:setText("RATING");
    obj.label198:setLeft(5);
    obj.label198:setTop(50);
    obj.label198:setWidth(60);
    obj.label198:setHeight(20);
    obj.label198:setHorzTextAlign("center");
    obj.label198:setName("label198");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout20);
    obj.edit126:setLeft(65);
    obj.edit126:setTop(50);
    obj.edit126:setWidth(55);
    obj.edit126:setHeight(25);
    obj.edit126:setField("cyberdeck_rating");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setType("number");
    obj.edit126:setName("edit126");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout20);
    obj.label199:setText("PROCESSING");
    obj.label199:setLeft(125);
    obj.label199:setTop(50);
    obj.label199:setWidth(60);
    obj.label199:setHeight(20);
    obj.label199:setHorzTextAlign("center");
    obj.label199:setFontSize(10);
    obj.label199:setName("label199");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout20);
    obj.edit127:setLeft(185);
    obj.edit127:setTop(50);
    obj.edit127:setWidth(55);
    obj.edit127:setHeight(25);
    obj.edit127:setField("cyberdeck_data_processing");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setType("number");
    obj.edit127:setName("edit127");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout20);
    obj.label200:setText("FIREWALL");
    obj.label200:setLeft(245);
    obj.label200:setTop(50);
    obj.label200:setWidth(60);
    obj.label200:setHeight(20);
    obj.label200:setHorzTextAlign("center");
    obj.label200:setName("label200");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout20);
    obj.edit128:setLeft(305);
    obj.edit128:setTop(50);
    obj.edit128:setWidth(50);
    obj.edit128:setHeight(25);
    obj.edit128:setField("cyberdeck_firewall");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setType("number");
    obj.edit128:setName("edit128");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout20);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(75);
    obj.textEditor4:setWidth(350);
    obj.textEditor4:setHeight(235);
    obj.textEditor4:setField("cyberdeck_programs");
    obj.textEditor4:setName("textEditor4");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout20);
    obj.label201:setText("Matrix Condition Monitor");
    obj.label201:setLeft(5);
    obj.label201:setTop(310);
    obj.label201:setWidth(150);
    obj.label201:setHeight(20);
    obj.label201:setHorzTextAlign("center");
    obj.label201:setName("label201");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout20);
    obj.edit129:setLeft(155);
    obj.edit129:setTop(310);
    obj.edit129:setWidth(50);
    obj.edit129:setHeight(25);
    obj.edit129:setField("monitor_matrix");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setType("number");
    obj.edit129:setName("edit129");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout20);
    obj.label202:setLeft(205);
    obj.label202:setTop(310);
    obj.label202:setWidth(10);
    obj.label202:setHeight(25);
    obj.label202:setText("-");
    obj.label202:setHorzTextAlign("center");
    obj.label202:setName("label202");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout20);
    obj.edit130:setLeft(215);
    obj.edit130:setTop(310);
    obj.edit130:setWidth(50);
    obj.edit130:setHeight(25);
    obj.edit130:setField("monitor_matrix_damage");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setType("number");
    obj.edit130:setName("edit130");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout20);
    obj.label203:setLeft(265);
    obj.label203:setTop(310);
    obj.label203:setWidth(10);
    obj.label203:setHeight(25);
    obj.label203:setText("=");
    obj.label203:setHorzTextAlign("center");
    obj.label203:setName("label203");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout20);
    obj.rectangle62:setLeft(275);
    obj.rectangle62:setTop(310);
    obj.rectangle62:setWidth(50);
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout20);
    obj.label204:setLeft(275);
    obj.label204:setTop(310);
    obj.label204:setWidth(50);
    obj.label204:setHeight(25);
    obj.label204:setField("monitor_matrix_left");
    obj.label204:setVertTextAlign("center");
    obj.label204:setHorzTextAlign("center");
    obj.label204:setName("label204");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout20);
    obj.dataLink37:setFields({'monitor_matrix', 'monitor_matrix_damage'});
    obj.dataLink37:setName("dataLink37");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox5);
    obj.layout21:setLeft(365);
    obj.layout21:setTop(345);
    obj.layout21:setWidth(360);
    obj.layout21:setHeight(340);
    obj.layout21:setName("layout21");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout21);
    obj.rectangle63:setAlign("client");
    obj.rectangle63:setColor("black");
    obj.rectangle63:setName("rectangle63");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout21);
    obj.label205:setLeft(5);
    obj.label205:setTop(0);
    obj.label205:setWidth(360);
    obj.label205:setHeight(20);
    obj.label205:setText("VEHICLE");
    obj.label205:setHorzTextAlign("center");
    obj.label205:setName("label205");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout21);
    obj.label206:setText("VEHICLE");
    obj.label206:setLeft(5);
    obj.label206:setTop(25);
    obj.label206:setWidth(60);
    obj.label206:setHeight(20);
    obj.label206:setHorzTextAlign("center");
    obj.label206:setName("label206");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout21);
    obj.edit131:setLeft(65);
    obj.edit131:setTop(25);
    obj.edit131:setWidth(55);
    obj.edit131:setHeight(25);
    obj.edit131:setField("vehicle_model");
    obj.edit131:setName("edit131");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout21);
    obj.label207:setText("HANDLING");
    obj.label207:setLeft(125);
    obj.label207:setTop(25);
    obj.label207:setWidth(60);
    obj.label207:setHeight(20);
    obj.label207:setHorzTextAlign("center");
    obj.label207:setFontSize(11);
    obj.label207:setName("label207");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout21);
    obj.edit132:setLeft(185);
    obj.edit132:setTop(25);
    obj.edit132:setWidth(55);
    obj.edit132:setHeight(25);
    obj.edit132:setField("vehicle_handling");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setType("number");
    obj.edit132:setName("edit132");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout21);
    obj.label208:setText("ACCELERATION");
    obj.label208:setLeft(245);
    obj.label208:setTop(25);
    obj.label208:setWidth(60);
    obj.label208:setHeight(20);
    obj.label208:setHorzTextAlign("center");
    obj.label208:setFontSize(8);
    obj.label208:setName("label208");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout21);
    obj.edit133:setLeft(305);
    obj.edit133:setTop(25);
    obj.edit133:setWidth(50);
    obj.edit133:setHeight(25);
    obj.edit133:setField("vehicle_acceleration");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setType("number");
    obj.edit133:setName("edit133");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout21);
    obj.label209:setText("SPEED");
    obj.label209:setLeft(5);
    obj.label209:setTop(50);
    obj.label209:setWidth(60);
    obj.label209:setHeight(20);
    obj.label209:setHorzTextAlign("center");
    obj.label209:setName("label209");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout21);
    obj.edit134:setLeft(65);
    obj.edit134:setTop(50);
    obj.edit134:setWidth(55);
    obj.edit134:setHeight(25);
    obj.edit134:setField("vehicle_speed");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setType("number");
    obj.edit134:setName("edit134");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout21);
    obj.label210:setText("PILOT");
    obj.label210:setLeft(125);
    obj.label210:setTop(50);
    obj.label210:setWidth(60);
    obj.label210:setHeight(20);
    obj.label210:setHorzTextAlign("center");
    obj.label210:setName("label210");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout21);
    obj.edit135:setLeft(185);
    obj.edit135:setTop(50);
    obj.edit135:setWidth(55);
    obj.edit135:setHeight(25);
    obj.edit135:setField("vehicle_pilot");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setType("number");
    obj.edit135:setName("edit135");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout21);
    obj.label211:setText("BODY");
    obj.label211:setLeft(245);
    obj.label211:setTop(50);
    obj.label211:setWidth(60);
    obj.label211:setHeight(20);
    obj.label211:setHorzTextAlign("center");
    obj.label211:setName("label211");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout21);
    obj.edit136:setLeft(305);
    obj.edit136:setTop(50);
    obj.edit136:setWidth(50);
    obj.edit136:setHeight(25);
    obj.edit136:setField("vehicle_body");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setType("number");
    obj.edit136:setName("edit136");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout21);
    obj.label212:setText("ARMOR");
    obj.label212:setLeft(5);
    obj.label212:setTop(75);
    obj.label212:setWidth(60);
    obj.label212:setHeight(20);
    obj.label212:setHorzTextAlign("center");
    obj.label212:setName("label212");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout21);
    obj.edit137:setLeft(65);
    obj.edit137:setTop(75);
    obj.edit137:setWidth(55);
    obj.edit137:setHeight(25);
    obj.edit137:setField("vehicle_armor");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setType("number");
    obj.edit137:setName("edit137");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout21);
    obj.label213:setText("SENSOR");
    obj.label213:setLeft(125);
    obj.label213:setTop(75);
    obj.label213:setWidth(60);
    obj.label213:setHeight(20);
    obj.label213:setHorzTextAlign("center");
    obj.label213:setName("label213");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout21);
    obj.edit138:setLeft(185);
    obj.edit138:setTop(75);
    obj.edit138:setWidth(55);
    obj.edit138:setHeight(25);
    obj.edit138:setField("vehicle_sensor");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setType("number");
    obj.edit138:setName("edit138");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout21);
    obj.label214:setText("OTHER");
    obj.label214:setLeft(245);
    obj.label214:setTop(75);
    obj.label214:setWidth(60);
    obj.label214:setHeight(20);
    obj.label214:setHorzTextAlign("center");
    obj.label214:setName("label214");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout21);
    obj.edit139:setLeft(305);
    obj.edit139:setTop(75);
    obj.edit139:setWidth(50);
    obj.edit139:setHeight(25);
    obj.edit139:setField("vehicle_other");
    obj.edit139:setName("edit139");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout21);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(100);
    obj.textEditor5:setWidth(350);
    obj.textEditor5:setHeight(235);
    obj.textEditor5:setField("vehicle_notes");
    obj.textEditor5:setName("textEditor5");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox5);
    obj.layout22:setLeft(730);
    obj.layout22:setTop(0);
    obj.layout22:setWidth(360);
    obj.layout22:setHeight(340);
    obj.layout22:setName("layout22");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout22);
    obj.rectangle64:setAlign("client");
    obj.rectangle64:setColor("black");
    obj.rectangle64:setName("rectangle64");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout22);
    obj.label215:setLeft(5);
    obj.label215:setTop(0);
    obj.label215:setWidth(360);
    obj.label215:setHeight(20);
    obj.label215:setText("ID - LIFESTYLE - CURRENCY");
    obj.label215:setHorzTextAlign("center");
    obj.label215:setName("label215");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout22);
    obj.label216:setText("LIFESTYLE");
    obj.label216:setLeft(5);
    obj.label216:setTop(25);
    obj.label216:setWidth(60);
    obj.label216:setHeight(25);
    obj.label216:setHorzTextAlign("center");
    obj.label216:setName("label216");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout22);
    obj.edit140:setLeft(65);
    obj.edit140:setTop(25);
    obj.edit140:setWidth(290);
    obj.edit140:setHeight(25);
    obj.edit140:setField("lifestyle");
    obj.edit140:setName("edit140");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout22);
    obj.label217:setText("NUYEN");
    obj.label217:setLeft(5);
    obj.label217:setTop(50);
    obj.label217:setWidth(60);
    obj.label217:setHeight(25);
    obj.label217:setHorzTextAlign("center");
    obj.label217:setName("label217");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout22);
    obj.edit141:setLeft(65);
    obj.edit141:setTop(50);
    obj.edit141:setWidth(115);
    obj.edit141:setHeight(25);
    obj.edit141:setField("nuyen");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setType("number");
    obj.edit141:setName("edit141");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout22);
    obj.label218:setText("LICENSES");
    obj.label218:setLeft(180);
    obj.label218:setTop(50);
    obj.label218:setWidth(60);
    obj.label218:setHeight(25);
    obj.label218:setHorzTextAlign("center");
    obj.label218:setName("label218");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout22);
    obj.edit142:setLeft(240);
    obj.edit142:setTop(50);
    obj.edit142:setWidth(115);
    obj.edit142:setHeight(25);
    obj.edit142:setField("licenses");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setType("number");
    obj.edit142:setName("edit142");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout22);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(75);
    obj.textEditor6:setWidth(350);
    obj.textEditor6:setHeight(260);
    obj.textEditor6:setField("ids_lifestyles_licenses");
    obj.textEditor6:setName("textEditor6");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Powers");
    obj.tab6:setName("tab6");

    obj.frmPowers = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPowers:setParent(obj.tab6);
    obj.frmPowers:setName("frmPowers");
    obj.frmPowers:setAlign("client");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmPowers);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox6);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(0);
    obj.layout23:setWidth(510);
    obj.layout23:setHeight(685);
    obj.layout23:setName("layout23");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout23);
    obj.rectangle65:setAlign("client");
    obj.rectangle65:setColor("black");
    obj.rectangle65:setName("rectangle65");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout23);
    obj.label219:setLeft(5);
    obj.label219:setTop(0);
    obj.label219:setWidth(510);
    obj.label219:setHeight(20);
    obj.label219:setText("SPELLS - PREPARATIONS - RITUALS - COMPLEX FORMS");
    obj.label219:setHorzTextAlign("center");
    obj.label219:setName("label219");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout23);
    obj.button19:setText("+");
    obj.button19:setLeft(5);
    obj.button19:setTop(0);
    obj.button19:setWidth(25);
    obj.button19:setHeight(25);
    obj.button19:setName("button19");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout23);
    obj.label220:setText("S/P/R/CF");
    obj.label220:setLeft(5);
    obj.label220:setTop(25);
    obj.label220:setWidth(150);
    obj.label220:setHeight(20);
    obj.label220:setHorzTextAlign("center");
    obj.label220:setName("label220");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout23);
    obj.label221:setText("TYPE/TARGET");
    obj.label221:setLeft(155);
    obj.label221:setTop(25);
    obj.label221:setWidth(100);
    obj.label221:setHeight(20);
    obj.label221:setHorzTextAlign("center");
    obj.label221:setFontSize(11);
    obj.label221:setName("label221");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout23);
    obj.label222:setText("RANGE");
    obj.label222:setLeft(255);
    obj.label222:setTop(25);
    obj.label222:setWidth(50);
    obj.label222:setHeight(20);
    obj.label222:setHorzTextAlign("center");
    obj.label222:setFontSize(12);
    obj.label222:setName("label222");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout23);
    obj.label223:setText("DURATION");
    obj.label223:setLeft(305);
    obj.label223:setTop(25);
    obj.label223:setWidth(50);
    obj.label223:setHeight(20);
    obj.label223:setHorzTextAlign("center");
    obj.label223:setFontSize(10);
    obj.label223:setName("label223");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout23);
    obj.label224:setText("DRAIN");
    obj.label224:setLeft(355);
    obj.label224:setTop(25);
    obj.label224:setWidth(50);
    obj.label224:setHeight(20);
    obj.label224:setHorzTextAlign("center");
    obj.label224:setFontSize(11);
    obj.label224:setName("label224");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout23);
    obj.label225:setText("KARMA");
    obj.label225:setLeft(405);
    obj.label225:setTop(25);
    obj.label225:setWidth(50);
    obj.label225:setHeight(20);
    obj.label225:setHorzTextAlign("center");
    obj.label225:setFontSize(11);
    obj.label225:setName("label225");

    obj.rclSpells = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSpells:setParent(obj.layout23);
    obj.rclSpells:setName("rclSpells");
    obj.rclSpells:setField("spellList");
    obj.rclSpells:setTemplateForm("frmSpells");
    obj.rclSpells:setLeft(5);
    obj.rclSpells:setTop(50);
    obj.rclSpells:setWidth(500);
    obj.rclSpells:setHeight(625);
    obj.rclSpells:setLayout("vertical");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox6);
    obj.layout24:setLeft(515);
    obj.layout24:setTop(0);
    obj.layout24:setWidth(410);
    obj.layout24:setHeight(685);
    obj.layout24:setName("layout24");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout24);
    obj.rectangle66:setAlign("client");
    obj.rectangle66:setColor("black");
    obj.rectangle66:setName("rectangle66");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout24);
    obj.label226:setLeft(5);
    obj.label226:setTop(0);
    obj.label226:setWidth(410);
    obj.label226:setHeight(20);
    obj.label226:setText("ADEPT POWER or OTHER ABILITIES");
    obj.label226:setHorzTextAlign("center");
    obj.label226:setName("label226");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout24);
    obj.button20:setText("+");
    obj.button20:setLeft(5);
    obj.button20:setTop(0);
    obj.button20:setWidth(25);
    obj.button20:setHeight(25);
    obj.button20:setName("button20");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout24);
    obj.label227:setText("NAME");
    obj.label227:setLeft(5);
    obj.label227:setTop(25);
    obj.label227:setWidth(150);
    obj.label227:setHeight(20);
    obj.label227:setHorzTextAlign("center");
    obj.label227:setName("label227");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout24);
    obj.label228:setText("RATING");
    obj.label228:setLeft(155);
    obj.label228:setTop(25);
    obj.label228:setWidth(50);
    obj.label228:setHeight(20);
    obj.label228:setHorzTextAlign("center");
    obj.label228:setFontSize(11);
    obj.label228:setName("label228");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout24);
    obj.label229:setText("NOTES");
    obj.label229:setLeft(205);
    obj.label229:setTop(25);
    obj.label229:setWidth(100);
    obj.label229:setHeight(20);
    obj.label229:setHorzTextAlign("center");
    obj.label229:setFontSize(12);
    obj.label229:setName("label229");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout24);
    obj.label230:setText("KARMA");
    obj.label230:setLeft(305);
    obj.label230:setTop(25);
    obj.label230:setWidth(50);
    obj.label230:setHeight(20);
    obj.label230:setHorzTextAlign("center");
    obj.label230:setFontSize(11);
    obj.label230:setName("label230");

    obj.rclAbilities = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAbilities:setParent(obj.layout24);
    obj.rclAbilities:setName("rclAbilities");
    obj.rclAbilities:setField("abilityList");
    obj.rclAbilities:setTemplateForm("frmAbilities");
    obj.rclAbilities:setLeft(5);
    obj.rclAbilities:setTop(50);
    obj.rclAbilities:setWidth(400);
    obj.rclAbilities:setHeight(625);
    obj.rclAbilities:setLayout("vertical");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Description");
    obj.tab7:setName("tab7");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab7);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmTemplateDescription);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.scrollBox7);
    obj.rectangle67:setLeft(0);
    obj.rectangle67:setTop(0);
    obj.rectangle67:setWidth(1205);
    obj.rectangle67:setHeight(105);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setName("rectangle67");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.rectangle67);
    obj.label231:setLeft(3);
    obj.label231:setTop(1);
    obj.label231:setWidth(100);
    obj.label231:setHeight(20);
    obj.label231:setText("PERSONAL DATA");
    obj.label231:setName("label231");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.rectangle67);
    obj.label232:setLeft(10);
    obj.label232:setTop(25);
    obj.label232:setWidth(90);
    obj.label232:setHeight(20);
    obj.label232:setText("ETHNICITY");
    obj.label232:setHorzTextAlign("center");
    obj.label232:setFontSize(13);
    obj.label232:setName("label232");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.rectangle67);
    obj.edit143:setLeft(100);
    obj.edit143:setTop(25);
    obj.edit143:setWidth(200);
    obj.edit143:setHeight(25);
    obj.edit143:setField("ethnicity");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setName("edit143");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.rectangle67);
    obj.label233:setLeft(10);
    obj.label233:setTop(50);
    obj.label233:setWidth(90);
    obj.label233:setHeight(20);
    obj.label233:setText("HEIGHT");
    obj.label233:setHorzTextAlign("center");
    obj.label233:setFontSize(13);
    obj.label233:setName("label233");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.rectangle67);
    obj.edit144:setLeft(100);
    obj.edit144:setTop(50);
    obj.edit144:setWidth(200);
    obj.edit144:setHeight(25);
    obj.edit144:setField("altura");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setName("edit144");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.rectangle67);
    obj.label234:setLeft(10);
    obj.label234:setTop(75);
    obj.label234:setWidth(90);
    obj.label234:setHeight(20);
    obj.label234:setText("WEIGHT");
    obj.label234:setHorzTextAlign("center");
    obj.label234:setFontSize(13);
    obj.label234:setName("label234");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.rectangle67);
    obj.edit145:setLeft(100);
    obj.edit145:setTop(75);
    obj.edit145:setWidth(200);
    obj.edit145:setHeight(25);
    obj.edit145:setField("peso");
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setName("edit145");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.rectangle67);
    obj.label235:setLeft(310);
    obj.label235:setTop(25);
    obj.label235:setWidth(90);
    obj.label235:setHeight(20);
    obj.label235:setText("AGE");
    obj.label235:setHorzTextAlign("center");
    obj.label235:setFontSize(13);
    obj.label235:setName("label235");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.rectangle67);
    obj.edit146:setLeft(400);
    obj.edit146:setTop(25);
    obj.edit146:setWidth(200);
    obj.edit146:setHeight(25);
    obj.edit146:setField("idade");
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setName("edit146");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.rectangle67);
    obj.label236:setLeft(310);
    obj.label236:setTop(50);
    obj.label236:setWidth(90);
    obj.label236:setHeight(20);
    obj.label236:setText("SEX");
    obj.label236:setHorzTextAlign("center");
    obj.label236:setFontSize(13);
    obj.label236:setName("label236");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.rectangle67);
    obj.edit147:setLeft(400);
    obj.edit147:setTop(50);
    obj.edit147:setWidth(200);
    obj.edit147:setHeight(25);
    obj.edit147:setField("sexo");
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setName("edit147");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.rectangle67);
    obj.label237:setLeft(310);
    obj.label237:setTop(75);
    obj.label237:setWidth(90);
    obj.label237:setHeight(20);
    obj.label237:setText("OTHER");
    obj.label237:setHorzTextAlign("center");
    obj.label237:setFontSize(13);
    obj.label237:setName("label237");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.rectangle67);
    obj.edit148:setLeft(400);
    obj.edit148:setTop(75);
    obj.edit148:setWidth(200);
    obj.edit148:setHeight(25);
    obj.edit148:setField("aparenciaOutros");
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setName("edit148");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.rectangle67);
    obj.label238:setLeft(610);
    obj.label238:setTop(25);
    obj.label238:setWidth(90);
    obj.label238:setHeight(20);
    obj.label238:setText("EYES");
    obj.label238:setHorzTextAlign("center");
    obj.label238:setFontSize(13);
    obj.label238:setName("label238");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.rectangle67);
    obj.edit149:setLeft(700);
    obj.edit149:setTop(25);
    obj.edit149:setWidth(200);
    obj.edit149:setHeight(25);
    obj.edit149:setField("aparenciaOlhos");
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setName("edit149");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.rectangle67);
    obj.label239:setLeft(610);
    obj.label239:setTop(50);
    obj.label239:setWidth(90);
    obj.label239:setHeight(20);
    obj.label239:setText("SKIN");
    obj.label239:setHorzTextAlign("center");
    obj.label239:setFontSize(13);
    obj.label239:setName("label239");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.rectangle67);
    obj.edit150:setLeft(700);
    obj.edit150:setTop(50);
    obj.edit150:setWidth(200);
    obj.edit150:setHeight(25);
    obj.edit150:setField("pele");
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setName("edit150");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.rectangle67);
    obj.label240:setLeft(610);
    obj.label240:setTop(75);
    obj.label240:setWidth(90);
    obj.label240:setHeight(20);
    obj.label240:setText("HAIR");
    obj.label240:setHorzTextAlign("center");
    obj.label240:setFontSize(13);
    obj.label240:setName("label240");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.rectangle67);
    obj.edit151:setLeft(700);
    obj.edit151:setTop(75);
    obj.edit151:setWidth(200);
    obj.edit151:setHeight(25);
    obj.edit151:setField("cabelo");
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setName("edit151");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.rectangle67);
    obj.label241:setLeft(910);
    obj.label241:setTop(25);
    obj.label241:setWidth(90);
    obj.label241:setHeight(20);
    obj.label241:setText("STREET CRED");
    obj.label241:setHorzTextAlign("center");
    obj.label241:setFontSize(13);
    obj.label241:setName("label241");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.rectangle67);
    obj.edit152:setLeft(1000);
    obj.edit152:setTop(25);
    obj.edit152:setWidth(200);
    obj.edit152:setHeight(25);
    obj.edit152:setField("cred");
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setName("edit152");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.rectangle67);
    obj.label242:setLeft(910);
    obj.label242:setTop(50);
    obj.label242:setWidth(90);
    obj.label242:setHeight(20);
    obj.label242:setText("NOTORIETY");
    obj.label242:setHorzTextAlign("center");
    obj.label242:setFontSize(13);
    obj.label242:setName("label242");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.rectangle67);
    obj.edit153:setLeft(1000);
    obj.edit153:setTop(50);
    obj.edit153:setWidth(200);
    obj.edit153:setHeight(25);
    obj.edit153:setField("notoriety");
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setName("edit153");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.rectangle67);
    obj.label243:setLeft(910);
    obj.label243:setTop(75);
    obj.label243:setWidth(90);
    obj.label243:setHeight(20);
    obj.label243:setText("PUBLIC AWARENESS");
    obj.label243:setHorzTextAlign("center");
    obj.label243:setFontSize(9);
    obj.label243:setName("label243");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.rectangle67);
    obj.edit154:setLeft(1000);
    obj.edit154:setTop(75);
    obj.edit154:setWidth(200);
    obj.edit154:setHeight(25);
    obj.edit154:setField("awareness");
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setName("edit154");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox7);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(110);
    obj.layout25:setWidth(375);
    obj.layout25:setHeight(240);
    obj.layout25:setName("layout25");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout25);
    obj.rectangle68:setAlign("client");
    obj.rectangle68:setColor("black");
    obj.rectangle68:setName("rectangle68");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout25);
    obj.label244:setLeft(5);
    obj.label244:setTop(1);
    obj.label244:setWidth(100);
    obj.label244:setHeight(20);
    obj.label244:setText("APPEARANCE");
    obj.label244:setName("label244");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout25);
    obj.textEditor7:setLeft(5);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(365);
    obj.textEditor7:setHeight(210);
    obj.textEditor7:setField("aparencia");
    obj.textEditor7:setName("textEditor7");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox7);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(355);
    obj.layout26:setWidth(375);
    obj.layout26:setHeight(250);
    obj.layout26:setName("layout26");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout26);
    obj.rectangle69:setAlign("client");
    obj.rectangle69:setColor("black");
    obj.rectangle69:setName("rectangle69");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout26);
    obj.label245:setLeft(5);
    obj.label245:setTop(1);
    obj.label245:setWidth(100);
    obj.label245:setHeight(20);
    obj.label245:setText("PERSONALITY");
    obj.label245:setName("label245");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout26);
    obj.textEditor8:setLeft(5);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(365);
    obj.textEditor8:setHeight(220);
    obj.textEditor8:setField("personalidade");
    obj.textEditor8:setName("textEditor8");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox7);
    obj.layout27:setLeft(380);
    obj.layout27:setTop(110);
    obj.layout27:setWidth(825);
    obj.layout27:setHeight(495);
    obj.layout27:setName("layout27");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout27);
    obj.rectangle70:setAlign("client");
    obj.rectangle70:setColor("black");
    obj.rectangle70:setName("rectangle70");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout27);
    obj.label246:setLeft(5);
    obj.label246:setTop(1);
    obj.label246:setWidth(100);
    obj.label246:setHeight(20);
    obj.label246:setText("BACKGROUND");
    obj.label246:setName("label246");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout27);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Notes");
    obj.tab8:setName("tab8");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab8);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmTemplateNotes);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox8);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(0);
    obj.layout28:setWidth(400);
    obj.layout28:setHeight(580);
    obj.layout28:setName("layout28");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout28);
    obj.rectangle71:setLeft(0);
    obj.rectangle71:setTop(0);
    obj.rectangle71:setWidth(400);
    obj.rectangle71:setHeight(580);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setXradius(5);
    obj.rectangle71:setYradius(15);
    obj.rectangle71:setCornerType("round");
    obj.rectangle71:setName("rectangle71");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout28);
    obj.label247:setLeft(0);
    obj.label247:setTop(0);
    obj.label247:setWidth(400);
    obj.label247:setHeight(20);
    obj.label247:setText("NOTES");
    obj.label247:setHorzTextAlign("center");
    obj.label247:setName("label247");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout28);
    obj.textEditor9:setLeft(10);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(380);
    obj.textEditor9:setHeight(540);
    obj.textEditor9:setField("anotacoes1");
    obj.textEditor9:setName("textEditor9");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox8);
    obj.layout29:setLeft(410);
    obj.layout29:setTop(0);
    obj.layout29:setWidth(400);
    obj.layout29:setHeight(580);
    obj.layout29:setName("layout29");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout29);
    obj.rectangle72:setLeft(0);
    obj.rectangle72:setTop(0);
    obj.rectangle72:setWidth(400);
    obj.rectangle72:setHeight(580);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setXradius(5);
    obj.rectangle72:setYradius(15);
    obj.rectangle72:setCornerType("round");
    obj.rectangle72:setName("rectangle72");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout29);
    obj.label248:setLeft(0);
    obj.label248:setTop(0);
    obj.label248:setWidth(400);
    obj.label248:setHeight(20);
    obj.label248:setText("NOTES");
    obj.label248:setHorzTextAlign("center");
    obj.label248:setName("label248");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout29);
    obj.textEditor10:setLeft(10);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(380);
    obj.textEditor10:setHeight(540);
    obj.textEditor10:setField("anotacoes2");
    obj.textEditor10:setName("textEditor10");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox8);
    obj.layout30:setLeft(820);
    obj.layout30:setTop(0);
    obj.layout30:setWidth(400);
    obj.layout30:setHeight(580);
    obj.layout30:setName("layout30");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout30);
    obj.rectangle73:setLeft(0);
    obj.rectangle73:setTop(0);
    obj.rectangle73:setWidth(400);
    obj.rectangle73:setHeight(580);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setXradius(5);
    obj.rectangle73:setYradius(15);
    obj.rectangle73:setCornerType("round");
    obj.rectangle73:setName("rectangle73");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout30);
    obj.label249:setLeft(0);
    obj.label249:setTop(0);
    obj.label249:setWidth(400);
    obj.label249:setHeight(20);
    obj.label249:setText("NOTES");
    obj.label249:setHorzTextAlign("center");
    obj.label249:setName("label249");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout30);
    obj.textEditor11:setLeft(10);
    obj.textEditor11:setTop(25);
    obj.textEditor11:setWidth(380);
    obj.textEditor11:setHeight(540);
    obj.textEditor11:setField("anotacoes3");
    obj.textEditor11:setName("textEditor11");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Stats");
    obj.tab9:setName("tab9");

    obj.frmStats = GUI.fromHandle(_obj_newObject("form"));
    obj.frmStats:setParent(obj.tab9);
    obj.frmStats:setName("frmStats");
    obj.frmStats:setAlign("client");

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmStats);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox9);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(0);
    obj.layout31:setWidth(210);
    obj.layout31:setHeight(505);
    obj.layout31:setName("layout31");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout31);
    obj.rectangle74:setAlign("client");
    obj.rectangle74:setColor("black");
    obj.rectangle74:setName("rectangle74");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout31);
    obj.label250:setLeft(5);
    obj.label250:setTop(0);
    obj.label250:setWidth(210);
    obj.label250:setHeight(20);
    obj.label250:setText("KARMA SPENT");
    obj.label250:setHorzTextAlign("center");
    obj.label250:setName("label250");

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.layout31);
    obj.label251:setText("ATTRIBUTES");
    obj.label251:setLeft(5);
    obj.label251:setTop(25);
    obj.label251:setWidth(150);
    obj.label251:setHeight(20);
    obj.label251:setHorzTextAlign("center");
    obj.label251:setName("label251");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout31);
    obj.rectangle75:setLeft(155);
    obj.rectangle75:setTop(25);
    obj.rectangle75:setWidth(50);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.layout31);
    obj.label252:setLeft(155);
    obj.label252:setTop(25);
    obj.label252:setWidth(50);
    obj.label252:setHeight(25);
    obj.label252:setField("attribute_karma_spent");
    obj.label252:setVertTextAlign("center");
    obj.label252:setHorzTextAlign("center");
    obj.label252:setName("label252");

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.layout31);
    obj.label253:setText("ACTIVE SKILLS");
    obj.label253:setLeft(5);
    obj.label253:setTop(50);
    obj.label253:setWidth(150);
    obj.label253:setHeight(20);
    obj.label253:setHorzTextAlign("center");
    obj.label253:setName("label253");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout31);
    obj.rectangle76:setLeft(155);
    obj.rectangle76:setTop(50);
    obj.rectangle76:setWidth(50);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.layout31);
    obj.label254:setLeft(155);
    obj.label254:setTop(50);
    obj.label254:setWidth(50);
    obj.label254:setHeight(25);
    obj.label254:setField("skills_active_karma_spent");
    obj.label254:setVertTextAlign("center");
    obj.label254:setHorzTextAlign("center");
    obj.label254:setName("label254");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.layout31);
    obj.label255:setText("KNOWLEDGE SKILLS");
    obj.label255:setLeft(5);
    obj.label255:setTop(75);
    obj.label255:setWidth(150);
    obj.label255:setHeight(20);
    obj.label255:setHorzTextAlign("center");
    obj.label255:setName("label255");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout31);
    obj.rectangle77:setLeft(155);
    obj.rectangle77:setTop(75);
    obj.rectangle77:setWidth(50);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.layout31);
    obj.label256:setLeft(155);
    obj.label256:setTop(75);
    obj.label256:setWidth(50);
    obj.label256:setHeight(25);
    obj.label256:setField("skills_knowledge_karma_spent");
    obj.label256:setVertTextAlign("center");
    obj.label256:setHorzTextAlign("center");
    obj.label256:setName("label256");

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.layout31);
    obj.label257:setText("LANGUAGE SKILLS");
    obj.label257:setLeft(5);
    obj.label257:setTop(100);
    obj.label257:setWidth(150);
    obj.label257:setHeight(20);
    obj.label257:setHorzTextAlign("center");
    obj.label257:setName("label257");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout31);
    obj.rectangle78:setLeft(155);
    obj.rectangle78:setTop(100);
    obj.rectangle78:setWidth(50);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.layout31);
    obj.label258:setLeft(155);
    obj.label258:setTop(100);
    obj.label258:setWidth(50);
    obj.label258:setHeight(25);
    obj.label258:setField("skills_language_karma_spent");
    obj.label258:setVertTextAlign("center");
    obj.label258:setHorzTextAlign("center");
    obj.label258:setName("label258");

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.layout31);
    obj.label259:setText("QUALITIES");
    obj.label259:setLeft(5);
    obj.label259:setTop(125);
    obj.label259:setWidth(150);
    obj.label259:setHeight(20);
    obj.label259:setHorzTextAlign("center");
    obj.label259:setName("label259");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout31);
    obj.rectangle79:setLeft(155);
    obj.rectangle79:setTop(125);
    obj.rectangle79:setWidth(50);
    obj.rectangle79:setHeight(25);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setName("rectangle79");

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.layout31);
    obj.label260:setLeft(155);
    obj.label260:setTop(125);
    obj.label260:setWidth(50);
    obj.label260:setHeight(25);
    obj.label260:setField("qualities_karma");
    obj.label260:setVertTextAlign("center");
    obj.label260:setHorzTextAlign("center");
    obj.label260:setName("label260");

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.layout31);
    obj.label261:setText("CONTACTS");
    obj.label261:setLeft(5);
    obj.label261:setTop(150);
    obj.label261:setWidth(150);
    obj.label261:setHeight(20);
    obj.label261:setHorzTextAlign("center");
    obj.label261:setName("label261");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout31);
    obj.rectangle80:setLeft(155);
    obj.rectangle80:setTop(150);
    obj.rectangle80:setWidth(50);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.layout31);
    obj.label262:setLeft(155);
    obj.label262:setTop(150);
    obj.label262:setWidth(50);
    obj.label262:setHeight(25);
    obj.label262:setField("contact_karma");
    obj.label262:setVertTextAlign("center");
    obj.label262:setHorzTextAlign("center");
    obj.label262:setName("label262");

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.layout31);
    obj.label263:setText("S/P/R/CF");
    obj.label263:setLeft(5);
    obj.label263:setTop(175);
    obj.label263:setWidth(150);
    obj.label263:setHeight(20);
    obj.label263:setHorzTextAlign("center");
    obj.label263:setName("label263");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout31);
    obj.rectangle81:setLeft(155);
    obj.rectangle81:setTop(175);
    obj.rectangle81:setWidth(50);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.layout31);
    obj.label264:setLeft(155);
    obj.label264:setTop(175);
    obj.label264:setWidth(50);
    obj.label264:setHeight(25);
    obj.label264:setField("spells_karma");
    obj.label264:setVertTextAlign("center");
    obj.label264:setHorzTextAlign("center");
    obj.label264:setName("label264");

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.layout31);
    obj.label265:setText("POWERS/ABILITIES");
    obj.label265:setLeft(5);
    obj.label265:setTop(200);
    obj.label265:setWidth(150);
    obj.label265:setHeight(20);
    obj.label265:setHorzTextAlign("center");
    obj.label265:setName("label265");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout31);
    obj.rectangle82:setLeft(155);
    obj.rectangle82:setTop(200);
    obj.rectangle82:setWidth(50);
    obj.rectangle82:setHeight(25);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.layout31);
    obj.label266:setLeft(155);
    obj.label266:setTop(200);
    obj.label266:setWidth(50);
    obj.label266:setHeight(25);
    obj.label266:setField("abilities_karma");
    obj.label266:setVertTextAlign("center");
    obj.label266:setHorzTextAlign("center");
    obj.label266:setName("label266");

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.layout31);
    obj.label267:setText("OTHER");
    obj.label267:setLeft(5);
    obj.label267:setTop(225);
    obj.label267:setWidth(150);
    obj.label267:setHeight(20);
    obj.label267:setHorzTextAlign("center");
    obj.label267:setName("label267");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout31);
    obj.edit155:setLeft(155);
    obj.edit155:setTop(225);
    obj.edit155:setWidth(50);
    obj.edit155:setHeight(25);
    obj.edit155:setField("other_karma");
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setType("number");
    obj.edit155:setName("edit155");

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.layout31);
    obj.label268:setText("MISC");
    obj.label268:setLeft(5);
    obj.label268:setTop(250);
    obj.label268:setWidth(150);
    obj.label268:setHeight(20);
    obj.label268:setHorzTextAlign("center");
    obj.label268:setName("label268");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout31);
    obj.edit156:setLeft(155);
    obj.edit156:setTop(250);
    obj.edit156:setWidth(50);
    obj.edit156:setHeight(25);
    obj.edit156:setField("misc_karma");
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setType("number");
    obj.edit156:setName("edit156");

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.layout31);
    obj.label269:setText("ALTERNATIVE");
    obj.label269:setLeft(5);
    obj.label269:setTop(275);
    obj.label269:setWidth(150);
    obj.label269:setHeight(20);
    obj.label269:setHorzTextAlign("center");
    obj.label269:setName("label269");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout31);
    obj.edit157:setLeft(155);
    obj.edit157:setTop(275);
    obj.edit157:setWidth(50);
    obj.edit157:setHeight(25);
    obj.edit157:setField("alternative_karma");
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setType("number");
    obj.edit157:setName("edit157");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout31);
    obj.textEditor12:setLeft(5);
    obj.textEditor12:setTop(300);
    obj.textEditor12:setWidth(200);
    obj.textEditor12:setHeight(200);
    obj.textEditor12:setField("details_karma");
    obj.textEditor12:setName("textEditor12");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout31);
    obj.dataLink38:setFields({'attribute_karma_spent', 'skills_active_karma_spent', 'skills_knowledge_karma_spent', 'skills_language_karma_spent', 'qualities_karma', 'contact_karma', 'spells_karma', 'abilities_karma', 'other_karma', 'misc_karma', 'alternative_karma', 'details_karma', 'karmaTotal'});
    obj.dataLink38:setName("dataLink38");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox9);
    obj.layout32:setLeft(215);
    obj.layout32:setTop(0);
    obj.layout32:setWidth(610);
    obj.layout32:setHeight(155);
    obj.layout32:setName("layout32");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout32);
    obj.rectangle83:setAlign("client");
    obj.rectangle83:setColor("black");
    obj.rectangle83:setName("rectangle83");

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.layout32);
    obj.label270:setLeft(5);
    obj.label270:setTop(0);
    obj.label270:setWidth(610);
    obj.label270:setHeight(20);
    obj.label270:setText("PRIORITIES");
    obj.label270:setHorzTextAlign("center");
    obj.label270:setName("label270");

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.layout32);
    obj.label271:setText("PRIORITY A");
    obj.label271:setLeft(5);
    obj.label271:setTop(25);
    obj.label271:setWidth(100);
    obj.label271:setHeight(20);
    obj.label271:setHorzTextAlign("center");
    obj.label271:setName("label271");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout32);
    obj.comboBox1:setLeft(105);
    obj.comboBox1:setTop(25);
    obj.comboBox1:setWidth(500);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("priority_a");
    obj.comboBox1:setItems({'METATYPE: Human (9), Elf (8), Dwarf (7), Ork (7), Troll (5)', 'ATTRIBUTES: 24', 'MAGIC: Magician or Mystic Adept: Magic 6, two Rating 5 Magical skills, 10 spells', 'RESSONANCE: Technomancer: Resonance 6, two Rating 5 Resonance skills, 5 complex forms', 'SKILLS: 46/10 ', 'RESOURCES: 450,000¥'});
    obj.comboBox1:setName("comboBox1");

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.layout32);
    obj.label272:setText("PRIORITY B");
    obj.label272:setLeft(5);
    obj.label272:setTop(50);
    obj.label272:setWidth(100);
    obj.label272:setHeight(20);
    obj.label272:setHorzTextAlign("center");
    obj.label272:setName("label272");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout32);
    obj.comboBox2:setLeft(105);
    obj.comboBox2:setTop(50);
    obj.comboBox2:setWidth(500);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("priority_b");
    obj.comboBox2:setItems({'METATYPE: Human (7), Elf (6), Dwarf (4), Ork (4), Troll (0)', 'ATTRIBUTES: 20', 'MAGIC: Magician or Mystic Adept: Magic 4, two Rating 4 Magical skills, 7 spells', 'RESSONANCE: Technomancer: Resonance 4, two Rating 4 Resonance skills, 2 complex forms', 'MAGIC: Adept: Magic 6, one Rating 4 Active skill', 'MAGIC: Aspected Magician: Magic 5, one Rating 4 Magical skill group', 'SKILLS: 36/5 ', 'RESOURCES: 275,000¥'});
    obj.comboBox2:setName("comboBox2");

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.layout32);
    obj.label273:setText("PRIORITY C");
    obj.label273:setLeft(5);
    obj.label273:setTop(75);
    obj.label273:setWidth(100);
    obj.label273:setHeight(20);
    obj.label273:setHorzTextAlign("center");
    obj.label273:setName("label273");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout32);
    obj.comboBox3:setLeft(105);
    obj.comboBox3:setTop(75);
    obj.comboBox3:setWidth(500);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("priority_c");
    obj.comboBox3:setItems({'METATYPE: Human (5), Elf (3), Dwarf (1), Ork (0)', 'ATTRIBUTES: 16', 'MAGIC: Magician or Mystic Adept: Magic 3, 5 spells', 'RESSONANCE: Technomancer: Resonance 3, 1 complex form', 'MAGIC: Adept: Magic 4, one Rating 2 Active skill', 'MAGIC: Aspected Magician: Magic 3, one Rating 2 Magical skill group', 'SKILLS: 28/2 ', 'RESOURCES: 140,000¥'});
    obj.comboBox3:setName("comboBox3");

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.layout32);
    obj.label274:setText("PRIORITY D");
    obj.label274:setLeft(5);
    obj.label274:setTop(100);
    obj.label274:setWidth(100);
    obj.label274:setHeight(20);
    obj.label274:setHorzTextAlign("center");
    obj.label274:setName("label274");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout32);
    obj.comboBox4:setLeft(105);
    obj.comboBox4:setTop(100);
    obj.comboBox4:setWidth(500);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("priority_d");
    obj.comboBox4:setItems({'METATYPE: Human (3), Elf (0)', 'ATTRIBUTES: 14', 'MAGIC: Adept: Magic 2', 'MAGIC: Aspected Magician: Magic 2', 'SKILLS: 22/0 ', 'RESOURCES: 50,000¥'});
    obj.comboBox4:setName("comboBox4");

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.layout32);
    obj.label275:setText("PRIORITY E");
    obj.label275:setLeft(5);
    obj.label275:setTop(125);
    obj.label275:setWidth(100);
    obj.label275:setHeight(20);
    obj.label275:setHorzTextAlign("center");
    obj.label275:setName("label275");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout32);
    obj.comboBox5:setLeft(105);
    obj.comboBox5:setTop(125);
    obj.comboBox5:setWidth(500);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("priority_e");
    obj.comboBox5:setItems({'METATYPE: Human (1)', 'ATTRIBUTES: 12 ', 'MAGIC: — ', 'SKILLS: 18/0 ', 'RESOURCES: 6,000¥'});
    obj.comboBox5:setName("comboBox5");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox9);
    obj.layout33:setLeft(215);
    obj.layout33:setTop(160);
    obj.layout33:setWidth(310);
    obj.layout33:setHeight(130);
    obj.layout33:setName("layout33");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout33);
    obj.rectangle84:setAlign("client");
    obj.rectangle84:setColor("black");
    obj.rectangle84:setName("rectangle84");

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.layout33);
    obj.label276:setLeft(5);
    obj.label276:setTop(0);
    obj.label276:setWidth(310);
    obj.label276:setHeight(20);
    obj.label276:setText("BASE/POINTS SPENT");
    obj.label276:setHorzTextAlign("center");
    obj.label276:setName("label276");

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.layout33);
    obj.label277:setLeft(155);
    obj.label277:setTop(25);
    obj.label277:setWidth(50);
    obj.label277:setHeight(20);
    obj.label277:setText("BASE");
    obj.label277:setHorzTextAlign("center");
    obj.label277:setName("label277");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.layout33);
    obj.label278:setLeft(205);
    obj.label278:setTop(25);
    obj.label278:setWidth(50);
    obj.label278:setHeight(20);
    obj.label278:setText("POINTS");
    obj.label278:setHorzTextAlign("center");
    obj.label278:setName("label278");

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.layout33);
    obj.label279:setLeft(255);
    obj.label279:setTop(25);
    obj.label279:setWidth(50);
    obj.label279:setHeight(20);
    obj.label279:setText("GROUP");
    obj.label279:setHorzTextAlign("center");
    obj.label279:setName("label279");

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.layout33);
    obj.label280:setText("ATTRIBUTES");
    obj.label280:setLeft(5);
    obj.label280:setTop(50);
    obj.label280:setWidth(150);
    obj.label280:setHeight(20);
    obj.label280:setHorzTextAlign("center");
    obj.label280:setName("label280");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout33);
    obj.rectangle85:setLeft(155);
    obj.rectangle85:setTop(50);
    obj.rectangle85:setWidth(50);
    obj.rectangle85:setHeight(25);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.layout33);
    obj.label281:setLeft(155);
    obj.label281:setTop(50);
    obj.label281:setWidth(50);
    obj.label281:setHeight(25);
    obj.label281:setField("attribute_base_spent");
    obj.label281:setVertTextAlign("center");
    obj.label281:setHorzTextAlign("center");
    obj.label281:setName("label281");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout33);
    obj.rectangle86:setLeft(205);
    obj.rectangle86:setTop(50);
    obj.rectangle86:setWidth(50);
    obj.rectangle86:setHeight(25);
    obj.rectangle86:setColor("black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.layout33);
    obj.label282:setLeft(205);
    obj.label282:setTop(50);
    obj.label282:setWidth(50);
    obj.label282:setHeight(25);
    obj.label282:setField("attribute_initial_spent");
    obj.label282:setVertTextAlign("center");
    obj.label282:setHorzTextAlign("center");
    obj.label282:setName("label282");

    obj.label283 = GUI.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.layout33);
    obj.label283:setText("ACTIVE SKILLS");
    obj.label283:setLeft(5);
    obj.label283:setTop(75);
    obj.label283:setWidth(150);
    obj.label283:setHeight(20);
    obj.label283:setHorzTextAlign("center");
    obj.label283:setName("label283");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout33);
    obj.rectangle87:setLeft(155);
    obj.rectangle87:setTop(75);
    obj.rectangle87:setWidth(50);
    obj.rectangle87:setHeight(25);
    obj.rectangle87:setColor("black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.label284 = GUI.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.layout33);
    obj.label284:setLeft(155);
    obj.label284:setTop(75);
    obj.label284:setWidth(50);
    obj.label284:setHeight(25);
    obj.label284:setField("skills_active_base_spent");
    obj.label284:setVertTextAlign("center");
    obj.label284:setHorzTextAlign("center");
    obj.label284:setName("label284");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout33);
    obj.rectangle88:setLeft(205);
    obj.rectangle88:setTop(75);
    obj.rectangle88:setWidth(50);
    obj.rectangle88:setHeight(25);
    obj.rectangle88:setColor("black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.label285 = GUI.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.layout33);
    obj.label285:setLeft(205);
    obj.label285:setTop(75);
    obj.label285:setWidth(50);
    obj.label285:setHeight(25);
    obj.label285:setField("skills_active_points_spent");
    obj.label285:setVertTextAlign("center");
    obj.label285:setHorzTextAlign("center");
    obj.label285:setName("label285");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout33);
    obj.rectangle89:setLeft(255);
    obj.rectangle89:setTop(75);
    obj.rectangle89:setWidth(50);
    obj.rectangle89:setHeight(25);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.label286 = GUI.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.layout33);
    obj.label286:setLeft(255);
    obj.label286:setTop(75);
    obj.label286:setWidth(50);
    obj.label286:setHeight(25);
    obj.label286:setField("skills_active_group_spent");
    obj.label286:setVertTextAlign("center");
    obj.label286:setHorzTextAlign("center");
    obj.label286:setName("label286");

    obj.label287 = GUI.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.layout33);
    obj.label287:setText("KNOWLEDGE/LANGUAGE");
    obj.label287:setLeft(5);
    obj.label287:setTop(100);
    obj.label287:setWidth(150);
    obj.label287:setHeight(20);
    obj.label287:setHorzTextAlign("center");
    obj.label287:setName("label287");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout33);
    obj.rectangle90:setLeft(155);
    obj.rectangle90:setTop(100);
    obj.rectangle90:setWidth(50);
    obj.rectangle90:setHeight(25);
    obj.rectangle90:setColor("black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.label288 = GUI.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.layout33);
    obj.label288:setLeft(155);
    obj.label288:setTop(100);
    obj.label288:setWidth(50);
    obj.label288:setHeight(25);
    obj.label288:setField("skill_knowledge_base_spent");
    obj.label288:setVertTextAlign("center");
    obj.label288:setHorzTextAlign("center");
    obj.label288:setName("label288");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout33);
    obj.rectangle91:setLeft(205);
    obj.rectangle91:setTop(100);
    obj.rectangle91:setWidth(50);
    obj.rectangle91:setHeight(25);
    obj.rectangle91:setColor("black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.label289 = GUI.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.layout33);
    obj.label289:setLeft(205);
    obj.label289:setTop(100);
    obj.label289:setWidth(50);
    obj.label289:setHeight(25);
    obj.label289:setField("skill_knowledge_points_spent");
    obj.label289:setVertTextAlign("center");
    obj.label289:setHorzTextAlign("center");
    obj.label289:setName("label289");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Credits");
    obj.tab10:setName("tab10");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab10);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmTemplateCreditos);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox10);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(210);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Shadowrun5E/images/shadowrun.png");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox10);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Shadowrun5E/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox10);
    obj.layout34:setLeft(850);
    obj.layout34:setTop(0);
    obj.layout34:setWidth(200);
    obj.layout34:setHeight(160);
    obj.layout34:setName("layout34");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout34);
    obj.rectangle92:setAlign("client");
    obj.rectangle92:setColor("black");
    obj.rectangle92:setXradius(5);
    obj.rectangle92:setYradius(15);
    obj.rectangle92:setCornerType("round");
    obj.rectangle92:setName("rectangle92");

    obj.label290 = GUI.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.layout34);
    obj.label290:setLeft(0);
    obj.label290:setTop(10);
    obj.label290:setWidth(200);
    obj.label290:setHeight(20);
    obj.label290:setText("Programador: Vinny (Ambesek)");
    obj.label290:setHorzTextAlign("center");
    obj.label290:setName("label290");

    obj.label291 = GUI.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.layout34);
    obj.label291:setLeft(0);
    obj.label291:setTop(35);
    obj.label291:setWidth(200);
    obj.label291:setHeight(20);
    obj.label291:setText("Consultor: Nautilus");
    obj.label291:setHorzTextAlign("center");
    obj.label291:setName("label291");

    obj.label292 = GUI.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.scrollBox10);
    obj.label292:setLeft(555);
    obj.label292:setTop(275);
    obj.label292:setWidth(200);
    obj.label292:setHeight(20);
    obj.label292:setText("Versão Atual: ");
    obj.label292:setHorzTextAlign("center");
    obj.label292:setField("versionInstalled");
    obj.label292:setName("label292");

    obj.label293 = GUI.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.scrollBox10);
    obj.label293:setLeft(555);
    obj.label293:setTop(300);
    obj.label293:setWidth(200);
    obj.label293:setHeight(20);
    obj.label293:setText("Sua Versão: ");
    obj.label293:setHorzTextAlign("center");
    obj.label293:setField("versionDownloaded");
    obj.label293:setName("label293");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.scrollBox10);
    obj.checkBox2:setLeft(555);
    obj.checkBox2:setTop(325);
    obj.checkBox2:setWidth(200);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setField("noUpdate");
    obj.checkBox2:setText("Não pedir para atualizar.");
    obj.checkBox2:setName("checkBox2");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.scrollBox10);
    obj.button21:setLeft(555);
    obj.button21:setTop(350);
    obj.button21:setWidth(100);
    obj.button21:setText("Change Log");
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.scrollBox10);
    obj.button22:setLeft(667);
    obj.button22:setTop(350);
    obj.button22:setWidth(100);
    obj.button22:setText("Atualizar");
    obj.button22:setName("button22");

    obj.label294 = GUI.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.scrollBox10);
    obj.label294:setLeft(555);
    obj.label294:setTop(400);
    obj.label294:setWidth(200);
    obj.label294:setHeight(20);
    obj.label294:setText("Conheça as Mesas:");
    obj.label294:setName("label294");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.scrollBox10);
    obj.button23:setLeft(555);
    obj.button23:setTop(425);
    obj.button23:setWidth(100);
    obj.button23:setText("RPGmeister");
    obj.button23:setName("button23");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Shadowrun%205E/output/Ficha%20Shadowrun%205E.rpk?raw=true",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Shadowrun%205E/output/Ficha%20Shadowrun%205E.rpk?raw=true');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            --showMessage(errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end);
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popupActiveSkill");
            						if pop == nil then return end;
            
            						local total = (tonumber(pop.node.skill_total) or 0) + 1;
            
            						pop.node.skill_karma_bonus = (tonumber(pop.node.skill_karma_bonus) or 0) + 1;
            						pop.node.skill_karma_spent = (tonumber(pop.node.skill_karma_spent) or 0) + (total*2);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popupActiveSkill");
            						if pop == nil then return end;
            
            						local total = (tonumber(pop.node.skill_total) or 0) + 1;
            
            						pop.node.skill_group_karma_bonus = (tonumber(pop.node.skill_group_karma_bonus) or 0) + 1;
            						pop.node.skill_group_karma_spent = (tonumber(pop.node.skill_group_karma_spent) or 0) + (total*5);
            
            						local objetos = NDB.getChildNodes(sheet.skillList);
            						for i=1, #objetos, 1 do 
            							if Utils.compareStringPtBr(objetos[i].skill_group_name, pop.node.skill_group_name) == 0 then
            								objetos[i].skill_group_karma_bonus = pop.node.skill_group_karma_bonus;
            								objetos[i].skill_group_karma_spent = pop.node.skill_group_karma_spent;
            							end;
            						end;
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popupKnowledgeSkill");
            						if pop == nil then return end;
            
            						local total = (tonumber(pop.node.skill_total) or 0) + 1;
            
            						pop.node.skill_karma_bonus = (tonumber(pop.node.skill_karma_bonus) or 0) + 1;
            						pop.node.skill_karma_spent = (tonumber(pop.node.skill_karma_spent) or 0) + total;
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popupLanguageSkill");
            						if pop == nil then return end;
            
            						local total = (tonumber(pop.node.skill_total) or 0) + 1;
            
            						pop.node.skill_karma_bonus = (tonumber(pop.node.skill_karma_bonus) or 0) + 1;
            						pop.node.skill_karma_spent = (tonumber(pop.node.skill_karma_spent) or 0) + total;
        end, obj);

    obj._e_event5 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_body_base) or 0) + 
            								(tonumber(sheet.attribute_body_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_body_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_body_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_body_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_body_augmented) or 0) + 
            							(tonumber(sheet.attribute_body_misc) or 0);
            
            				sheet.attribute_body_real = real;
            				sheet.attribute_body_effective = effective;
        end, obj);

    obj._e_event6 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_agility_base) or 0) + 
            								(tonumber(sheet.attribute_agility_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_agility_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_agility_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_agility_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_agility_augmented) or 0) + 
            							(tonumber(sheet.attribute_agility_misc) or 0);
            
            				sheet.attribute_agility_real = real;
            				sheet.attribute_agility_effective = effective;
        end, obj);

    obj._e_event7 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_reaction_base) or 0) + 
            								(tonumber(sheet.attribute_reaction_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_reaction_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_reaction_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_reaction_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_reaction_augmented) or 0) + 
            							(tonumber(sheet.attribute_reaction_misc) or 0);
            
            				sheet.attribute_reaction_real = real;
            				sheet.attribute_reaction_effective = effective;
        end, obj);

    obj._e_event8 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_strenght_base) or 0) + 
            								(tonumber(sheet.attribute_strenght_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_strenght_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_strenght_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_strenght_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_strenght_augmented) or 0) + 
            							(tonumber(sheet.attribute_strenght_misc) or 0);
            
            				sheet.attribute_strenght_real = real;
            				sheet.attribute_strenght_effective = effective;
        end, obj);

    obj._e_event9 = obj.physicalButton:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popupPhysical");
            			
            				if pop ~= nil then
            					pop:setNodeObject(self.sheet);
            					pop:showPopupEx("rightCenter", self.physicalButton);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup popupPhysical para exibir");
            				end;
        end, obj);

    obj._e_event10 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_charisma_base) or 0) + 
            								(tonumber(sheet.attribute_charisma_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_charisma_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_charisma_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_charisma_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_charisma_augmented) or 0) + 
            							(tonumber(sheet.attribute_charisma_misc) or 0);
            
            				sheet.attribute_charisma_real = real;
            				sheet.attribute_charisma_effective = effective;
        end, obj);

    obj._e_event11 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_intuition_base) or 0) + 
            								(tonumber(sheet.attribute_intuition_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_intuition_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_intuition_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_intuition_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_intuition_augmented) or 0) + 
            							(tonumber(sheet.attribute_intuition_misc) or 0);
            
            				sheet.attribute_intuition_real = real;
            				sheet.attribute_intuition_effective = effective;
        end, obj);

    obj._e_event12 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_logic_base) or 0) + 
            								(tonumber(sheet.attribute_logic_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_logic_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_logic_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_logic_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_logic_augmented) or 0) + 
            							(tonumber(sheet.attribute_logic_misc) or 0);
            
            				sheet.attribute_logic_real = real;
            				sheet.attribute_logic_effective = effective;
        end, obj);

    obj._e_event13 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_willpower_base) or 0) + 
            								(tonumber(sheet.attribute_willpower_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_willpower_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_willpower_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_willpower_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_willpower_augmented) or 0) + 
            							(tonumber(sheet.attribute_willpower_misc) or 0);
            
            				sheet.attribute_willpower_real = real;
            				sheet.attribute_willpower_effective = effective;
        end, obj);

    obj._e_event14 = obj.mentalButton:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popupMental");
            			
            				if pop ~= nil then
            					pop:setNodeObject(self.sheet);
            					pop:showPopupEx("rightCenter", self.mentalButton);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup popupMental para exibir");
            				end;
        end, obj);

    obj._e_event15 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_edge_base) or 0) + 
            								(tonumber(sheet.attribute_edge_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_edge_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_edge_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_edge_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_edge_augmented) or 0) + 
            							(tonumber(sheet.attribute_edge_misc) or 0);
            
            				sheet.attribute_edge_real = real;
            				sheet.attribute_edge_effective = effective;
        end, obj);

    obj._e_event16 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_magic_base) or 0) + 
            								(tonumber(sheet.attribute_magic_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_magic_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_magic_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_magic_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_magic_augmented) or 0) + 
            							(tonumber(sheet.attribute_magic_misc) or 0);
            
            				sheet.attribute_magic_real = real;
            				sheet.attribute_magic_effective = effective;
        end, obj);

    obj._e_event17 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local real = 	(tonumber(sheet.attribute_ressonance_base) or 0) + 
            								(tonumber(sheet.attribute_ressonance_initial) or 0);
            
            				local karma = (tonumber(sheet.attribute_ressonance_karma) or 0);
            
            				while (karma > 0) do
            					karma = karma - ((real+1) * 5);
            					if karma >= 0 then
            						real = real + 1;
            					end;
            				end;
            
            				real = real + (tonumber(sheet.attribute_ressonance_other) or 0);
            				real = math.min(real, (tonumber(sheet.attribute_ressonance_max) or 11));
            
            				effective = real + 
            							(tonumber(sheet.attribute_ressonance_augmented) or 0) + 
            							(tonumber(sheet.attribute_ressonance_misc) or 0);
            
            				sheet.attribute_ressonance_real = real;
            				sheet.attribute_ressonance_effective = effective;
        end, obj);

    obj._e_event18 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				sheet.attribute_essence_effective = math.floor(tonumber(sheet.attribute_essence_real) or 6);
        end, obj);

    obj._e_event19 = obj.specialButton:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popupSpecial");
            			
            				if pop ~= nil then
            					pop:setNodeObject(self.sheet);
            					pop:showPopupEx("rightCenter", self.specialButton);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup popupSpecial para exibir");
            				end;
        end, obj);

    obj._e_event20 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local strenght = (tonumber(sheet.attribute_strenght_effective) or 0) * 2;
            					local body = (tonumber(sheet.attribute_body_effective) or 0);
            					local reaction = (tonumber(sheet.attribute_reaction_effective) or 0);
            
            					sheet.limitPhysical = math.ceil((strenght + body + reaction)/3);
        end, obj);

    obj._e_event21 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local logic = (tonumber(sheet.attribute_logic_effective) or 0) * 2;
            					local willpower = (tonumber(sheet.attribute_willpower_effective) or 0);
            					local intuition = (tonumber(sheet.attribute_intuition_effective) or 0);
            
            					sheet.limitMental = math.ceil((logic + willpower + intuition)/3);
        end, obj);

    obj._e_event22 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local charisma = (tonumber(sheet.attribute_charisma_effective) or 0) * 2;
            					local willpower = (tonumber(sheet.attribute_willpower_effective) or 0);
            					local essence = (tonumber(sheet.attribute_essence_effective) or 0);
            
            					sheet.limitSocial = math.ceil((charisma + willpower + essence)/3);
        end, obj);

    obj._e_event23 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					sheet.attribute_karma_spent = 	(tonumber(sheet.attribute_body_karma) or 0) + 
            													(tonumber(sheet.attribute_agility_karma) or 0) + 
            													(tonumber(sheet.attribute_reaction_karma) or 0) + 
            													(tonumber(sheet.attribute_strenght_karma) or 0) + 
            													(tonumber(sheet.attribute_charisma_karma) or 0) + 
            													(tonumber(sheet.attribute_intuition_karma) or 0) + 
            													(tonumber(sheet.attribute_logic_karma) or 0) + 
            													(tonumber(sheet.attribute_willpower_karma) or 0) + 
            													(tonumber(sheet.attribute_edge_karma) or 0) + 
            													(tonumber(sheet.attribute_magic_karma) or 0) + 
            													(tonumber(sheet.attribute_ressonance_karma) or 0);
        end, obj);

    obj._e_event24 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					sheet.attribute_base_spent = 	(tonumber(sheet.attribute_body_base) or 0) + 
            													(tonumber(sheet.attribute_agility_base) or 0) + 
            													(tonumber(sheet.attribute_reaction_base) or 0) + 
            													(tonumber(sheet.attribute_strenght_base) or 0) + 
            													(tonumber(sheet.attribute_charisma_base) or 0) + 
            													(tonumber(sheet.attribute_intuition_base) or 0) + 
            													(tonumber(sheet.attribute_logic_base) or 0) + 
            													(tonumber(sheet.attribute_willpower_base) or 0) + 
            													(tonumber(sheet.attribute_edge_base) or 0) + 
            													(tonumber(sheet.attribute_magic_base) or 0) + 
            													(tonumber(sheet.attribute_ressonance_base) or 0);
        end, obj);

    obj._e_event25 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					sheet.attribute_initial_spent = 	(tonumber(sheet.attribute_body_initial) or 0) + 
            													(tonumber(sheet.attribute_agility_initial) or 0) + 
            													(tonumber(sheet.attribute_reaction_initial) or 0) + 
            													(tonumber(sheet.attribute_strenght_initial) or 0) + 
            													(tonumber(sheet.attribute_charisma_initial) or 0) + 
            													(tonumber(sheet.attribute_intuition_initial) or 0) + 
            													(tonumber(sheet.attribute_logic_initial) or 0) + 
            													(tonumber(sheet.attribute_willpower_initial) or 0) + 
            													(tonumber(sheet.attribute_edge_initial) or 0) + 
            													(tonumber(sheet.attribute_magic_initial) or 0) + 
            													(tonumber(sheet.attribute_ressonance_initial) or 0);
        end, obj);

    obj._e_event26 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local essence = 6 - (tonumber(sheet.augmentations_essence) or 0);
            
            					sheet.attribute_essence_real = essence;
            					sheet.attribute_essence_effective = math.floor(essence);
        end, obj);

    obj._e_event27 = obj.button5:addEventListener("onClick",
        function (_)
            local teste = (sheet.initiativePhysicalDice or 1) .. "d6 + " .. (sheet.initiativePhysical or 0); 
            						local rolagem = Firecast.interpretarRolagem(teste);
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Iniciativa de " .. (sheet.name or "name"));
        end, obj);

    obj._e_event28 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            						local reaction = (tonumber(sheet.attribute_reaction_effective) or 0);
            						local intuition = (tonumber(sheet.attribute_intuition_effective) or 0);
            						local other = (tonumber(sheet.initiativePhysicalOther) or 0);
            
            						sheet.initiativePhysical = reaction+intuition+other;
        end, obj);

    obj._e_event29 = obj.button6:addEventListener("onClick",
        function (_)
            local teste = (sheet.initiativeMatrixDice or 1) .. "d6 + " .. (sheet.initiativeMatrix or 0); 
            						local rolagem = Firecast.interpretarRolagem(teste);
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Iniciativa da Matrix de " .. (sheet.name or "name"));
        end, obj);

    obj._e_event30 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            						local intuition = (tonumber(sheet.attribute_intuition_effective) or 0);
            						local data = (tonumber(sheet.cyberdeck_data_processing) or 0);
            						local other = (tonumber(sheet.initiativeMatrixOther) or 0);
            
            						sheet.initiativeMatrix = intuition+data+other;
        end, obj);

    obj._e_event31 = obj.button7:addEventListener("onClick",
        function (_)
            local teste = (sheet.initiativeAstralDice or 1) .. "d6 + " .. (sheet.initiativeAstral or 0); 
            						local rolagem = Firecast.interpretarRolagem(teste);
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Iniciativa Astral de " .. (sheet.name or "name"));
        end, obj);

    obj._e_event32 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            						local intuition = (tonumber(sheet.attribute_intuition_effective) or 0);
            						local other = (tonumber(sheet.initiativeAstralOther) or 0);
            
            						sheet.initiativeAstral = (intuition*2)+other;
        end, obj);

    obj._e_event33 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local link1 = (tonumber(sheet.attribute_charisma_effective) or 0);
            				local link2 = (tonumber(sheet.attribute_willpower_effective) or 0);
            				local other = (tonumber(sheet.attribute_composure_other) or 0);
            				sheet.attribute_composure = link1 + link2 + other;
        end, obj);

    obj._e_event34 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local link1 = (tonumber(sheet.attribute_charisma_effective) or 0);
            				local link2 = (tonumber(sheet.attribute_intuition_effective) or 0);
            				local other = (tonumber(sheet.attribute_judge_other) or 0);
            				sheet.attribute_judge = link1 + link2 + other;
        end, obj);

    obj._e_event35 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local link1 = (tonumber(sheet.attribute_body_effective) or 0);
            				local link2 = (tonumber(sheet.attribute_strenght_effective) or 0);
            				local other = (tonumber(sheet.attribute_lifting_other) or 0);
            				sheet.attribute_lifting = link1 + link2 + other;
        end, obj);

    obj._e_event36 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local link1 = (tonumber(sheet.attribute_logic_effective) or 0);
            				local link2 = (tonumber(sheet.attribute_willpower_effective) or 0);
            				local other = (tonumber(sheet.attribute_memory_other) or 0);
            				sheet.attribute_memory = link1 + link2 + other;
        end, obj);

    obj._e_event37 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local agility = (tonumber(sheet.attribute_agility_effective) or 0);
            
            					sheet.attribute_movement_walk = agility * 2;
            					sheet.attribute_movement_run = agility * 4;
        end, obj);

    obj._e_event38 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local link1 = math.ceil((tonumber(sheet.attribute_body_effective) or 0)/2);
            				local other = (tonumber(sheet.monitor_physical_other) or 0);
            				sheet.monitor_physical = link1 + other + 8;
        end, obj);

    obj._e_event39 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local total = (tonumber(sheet.monitor_physical) or 0);
            				local damage = (tonumber(sheet.monitor_physical_damage) or 0);
            				sheet.monitor_physical_left = total - damage;
            
            				local mod = math.floor(damage/3);
            				if mod > 0 then
            					sheet.monitor_physical_modifier = "-" .. mod .. " d.p.";
            				else
            					sheet.monitor_physical_modifier = "";
            				end;
        end, obj);

    obj._e_event40 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local link1 = math.ceil((tonumber(sheet.attribute_willpower_effective) or 0)/2);
            				local other = (tonumber(sheet.monitor_stun_other) or 0);
            				sheet.monitor_stun = link1 + other + 8;
        end, obj);

    obj._e_event41 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local total = (tonumber(sheet.monitor_stun) or 0);
            				local damage = (tonumber(sheet.monitor_stun_damage) or 0);
            				sheet.monitor_stun_left = total - damage;
            
            				local mod = math.floor(damage/3);
            				if mod > 0 then
            					sheet.monitor_stun_modifier = "-" .. mod .. " d.p.";
            				else
            					sheet.monitor_stun_modifier = "";
            				end;
        end, obj);

    obj._e_event42 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local link1 = math.ceil((tonumber(sheet.attribute_body_effective) or 0)/2);
            				local other = (tonumber(sheet.monitor_overflow_other) or 0);
            				sheet.monitor_overflow = link1 + other;
        end, obj);

    obj._e_event43 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local total = (tonumber(sheet.monitor_overflow) or 0);
            				local damage = (tonumber(sheet.monitor_overflow_damage) or 0);
            				local left = total - damage;
            
            				sheet.monitor_overflow_left = left;
            
            				if left >= 0 then
            					sheet.monitor_overflow_modifier = "";
            				else 
            					sheet.monitor_overflow_modifier = "DEAD";
            				end;
        end, obj);

    obj._e_event44 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event45 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclSkillList:append();
        end, obj);

    obj._e_event46 = obj.rclSkillList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if Utils.compareStringPtBr(nodeA.skill_group_name, nodeB.skill_group_name)== 0 then
            						return Utils.compareStringPtBr(nodeA.skill_name, nodeB.skill_name);
            					else 
            		            	return Utils.compareStringPtBr(nodeA.skill_group_name, nodeB.skill_group_name);
            		            end;
        end, obj);

    obj._e_event47 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclKnowledgeList:append();
        end, obj);

    obj._e_event48 = obj.rclKnowledgeList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.skill_name, nodeB.skill_name);
        end, obj);

    obj._e_event49 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclLanguageList:append();
        end, obj);

    obj._e_event50 = obj.rclLanguageList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.skill_name, nodeB.skill_name);
        end, obj);

    obj._e_event51 = obj.button11:addEventListener("onClick",
        function (_)
            self.rclPositiveQualities:append();
        end, obj);

    obj._e_event52 = obj.rclPositiveQualities:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.quality_name, nodeB.quality_name);
        end, obj);

    obj._e_event53 = obj.button12:addEventListener("onClick",
        function (_)
            self.rclNegativeQualities:append();
        end, obj);

    obj._e_event54 = obj.rclNegativeQualities:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.quality_name, nodeB.quality_name);
        end, obj);

    obj._e_event55 = obj.button13:addEventListener("onClick",
        function (_)
            self.rclContacts:append();
        end, obj);

    obj._e_event56 = obj.rclContacts:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.contact_name, nodeB.contact_name);
        end, obj);

    obj._e_event57 = obj.button14:addEventListener("onClick",
        function (_)
            self.rclRangedWeapons:append();
        end, obj);

    obj._e_event58 = obj.rclRangedWeapons:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.ranged_weapon, nodeB.ranged_weapon);
        end, obj);

    obj._e_event59 = obj.button15:addEventListener("onClick",
        function (_)
            self.rclMeleeWeapons:append();
        end, obj);

    obj._e_event60 = obj.rclMeleeWeapons:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.melee_weapon, nodeB.melee_weapon);
        end, obj);

    obj._e_event61 = obj.button16:addEventListener("onClick",
        function (_)
            self.rclAugmentations:append();
        end, obj);

    obj._e_event62 = obj.rclAugmentations:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.augmentation_name, nodeB.augmentation_name);
        end, obj);

    obj._e_event63 = obj.button17:addEventListener("onClick",
        function (_)
            self.rclArmor:append();
        end, obj);

    obj._e_event64 = obj.rclArmor:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.armor_name, nodeB.armor_name);
        end, obj);

    obj._e_event65 = obj.button18:addEventListener("onClick",
        function (_)
            self.rclGearList:append();
        end, obj);

    obj._e_event66 = obj.rclGearList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.gear_name, nodeB.gear_name);
        end, obj);

    obj._e_event67 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					sheet.monitor_matrix_left = (tonumber(sheet.monitor_matrix) or 0) - ((tonumber(sheet.monitor_matrix_damage) or 0));
        end, obj);

    obj._e_event68 = obj.button19:addEventListener("onClick",
        function (_)
            self.rclSpells:append();
        end, obj);

    obj._e_event69 = obj.rclSpells:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.spell_name, nodeB.spell_name);
        end, obj);

    obj._e_event70 = obj.button20:addEventListener("onClick",
        function (_)
            self.rclAbilities:append();
        end, obj);

    obj._e_event71 = obj.rclAbilities:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.abilities_name, nodeB.abilities_name);
        end, obj);

    obj._e_event72 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local karma = 	(tonumber(sheet.attribute_karma_spent) or 0) + 
            									(tonumber(sheet.skills_active_karma_spent) or 0) + 
            									(tonumber(sheet.skills_knowledge_karma_spent) or 0) + 
            									(tonumber(sheet.skills_language_karma_spent) or 0) + 
            									(tonumber(sheet.qualities_karma) or 0) + 
            									(tonumber(sheet.contact_karma) or 0) + 
            									(tonumber(sheet.spells_karma) or 0) + 
            									(tonumber(sheet.abilities_karma) or 0) + 
            									(tonumber(sheet.other_karma) or 0) + 
            									(tonumber(sheet.misc_karma) or 0) + 
            									(tonumber(sheet.alternative_karma) or 0) + 
            									(tonumber(sheet.details_karma) or 0);
            
            					local left = (tonumber(sheet.karmaTotal) or 0) - karma;
            
            					sheet.karma = left;
        end, obj);

    obj._e_event73 = obj.button21:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Shadowrun%205E/README.md')
        end, obj);

    obj._e_event74 = obj.button22:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Shadowrun%205E/output/Ficha%20Shadowrun%205E.rpk?raw=true')
        end, obj);

    obj._e_event75 = obj.button23:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
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

        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.flowPart129 ~= nil then self.flowPart129:destroy(); self.flowPart129 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.rclPositiveQualities ~= nil then self.rclPositiveQualities:destroy(); self.rclPositiveQualities = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.specialButton ~= nil then self.specialButton:destroy(); self.specialButton = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.flowPart145 ~= nil then self.flowPart145:destroy(); self.flowPart145 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.flowPart142 ~= nil then self.flowPart142:destroy(); self.flowPart142 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.flowPart152 ~= nil then self.flowPart152:destroy(); self.flowPart152 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.flowPart113 ~= nil then self.flowPart113:destroy(); self.flowPart113 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.physicalButton ~= nil then self.physicalButton:destroy(); self.physicalButton = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.flowPart144 ~= nil then self.flowPart144:destroy(); self.flowPart144 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rclContacts ~= nil then self.rclContacts:destroy(); self.rclContacts = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rclArmor ~= nil then self.rclArmor:destroy(); self.rclArmor = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.flowPart155 ~= nil then self.flowPart155:destroy(); self.flowPart155 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rclSpells ~= nil then self.rclSpells:destroy(); self.rclSpells = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.popupKnowledgeSkill ~= nil then self.popupKnowledgeSkill:destroy(); self.popupKnowledgeSkill = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.flowPart148 ~= nil then self.flowPart148:destroy(); self.flowPart148 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.flowPart153 ~= nil then self.flowPart153:destroy(); self.flowPart153 = nil; end;
        if self.popupLanguageSkill ~= nil then self.popupLanguageSkill:destroy(); self.popupLanguageSkill = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.rclLanguageList ~= nil then self.rclLanguageList:destroy(); self.rclLanguageList = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.rclGearList ~= nil then self.rclGearList:destroy(); self.rclGearList = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.flowPart134 ~= nil then self.flowPart134:destroy(); self.flowPart134 = nil; end;
        if self.frmStats ~= nil then self.frmStats:destroy(); self.frmStats = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.rclAbilities ~= nil then self.rclAbilities:destroy(); self.rclAbilities = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.flowPart151 ~= nil then self.flowPart151:destroy(); self.flowPart151 = nil; end;
        if self.mentalButton ~= nil then self.mentalButton:destroy(); self.mentalButton = nil; end;
        if self.popupPhysical ~= nil then self.popupPhysical:destroy(); self.popupPhysical = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.frmCombat ~= nil then self.frmCombat:destroy(); self.frmCombat = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.popupSpecial ~= nil then self.popupSpecial:destroy(); self.popupSpecial = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rclAugmentations ~= nil then self.rclAugmentations:destroy(); self.rclAugmentations = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.flowPart150 ~= nil then self.flowPart150:destroy(); self.flowPart150 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.rclMeleeWeapons ~= nil then self.rclMeleeWeapons:destroy(); self.rclMeleeWeapons = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.rclSkillList ~= nil then self.rclSkillList:destroy(); self.rclSkillList = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.flowPart132 ~= nil then self.flowPart132:destroy(); self.flowPart132 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.rclRangedWeapons ~= nil then self.rclRangedWeapons:destroy(); self.rclRangedWeapons = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.flowPart127 ~= nil then self.flowPart127:destroy(); self.flowPart127 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowPart147 ~= nil then self.flowPart147:destroy(); self.flowPart147 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.popupActiveSkill ~= nil then self.popupActiveSkill:destroy(); self.popupActiveSkill = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart149 ~= nil then self.flowPart149:destroy(); self.flowPart149 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.flowPart154 ~= nil then self.flowPart154:destroy(); self.flowPart154 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.flowPart143 ~= nil then self.flowPart143:destroy(); self.flowPart143 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.frmPowers ~= nil then self.frmPowers:destroy(); self.frmPowers = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.frmQualities ~= nil then self.frmQualities:destroy(); self.frmQualities = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.popupMental ~= nil then self.popupMental:destroy(); self.popupMental = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.rclKnowledgeList ~= nil then self.rclKnowledgeList:destroy(); self.rclKnowledgeList = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.frmSkills ~= nil then self.frmSkills:destroy(); self.frmSkills = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.flowPart146 ~= nil then self.flowPart146:destroy(); self.flowPart146 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.rclNegativeQualities ~= nil then self.rclNegativeQualities:destroy(); self.rclNegativeQualities = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTemplate()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTemplate();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTemplate = {
    newEditor = newfrmTemplate, 
    new = newfrmTemplate, 
    name = "frmTemplate", 
    dataType = "Ambesek.Nefertyne.Shadowrun5E", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Shadowrun 5E", 
    description=""};

frmTemplate = _frmTemplate;
Firecast.registrarForm(_frmTemplate);
Firecast.registrarDataType(_frmTemplate);

return _frmTemplate;
