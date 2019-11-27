require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAvatar()
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
    obj:setName("frmAvatar");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.Avatar.d20");
    obj:setTitle("Ficha Avatar d20");
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
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmFichaRPGmeister1_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister1_svg:setParent(obj.tab1);
    obj.frmFichaRPGmeister1_svg:setName("frmFichaRPGmeister1_svg");
    obj.frmFichaRPGmeister1_svg:setAlign("client");
    obj.frmFichaRPGmeister1_svg:setTheme("dark");
    obj.frmFichaRPGmeister1_svg:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmFichaRPGmeister1_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.popAtributo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAtributo:setParent(obj.scrollBox1);
    obj.popAtributo:setName("popAtributo");
    obj.popAtributo:setWidth(820);
    obj.popAtributo:setHeight(170);
    obj.popAtributo:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAtributo, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popAtributo);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(13);
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
    obj.label3:setText("NEP");
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
    obj.label4:setText("Inerente");
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
    obj.label5:setText("Tamanho");
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
    obj.label6:setText("Outros");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(20);
    obj.flowPart7:setMaxWidth(20);
    obj.flowPart7:setHeight(15);
    obj.flowPart7:setName("flowPart7");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(50);
    obj.flowPart8:setMaxWidth(75);
    obj.flowPart8:setHeight(15);
    obj.flowPart8:setName("flowPart8");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowPart8);
    obj.checkBox1:setAlign("client");
    obj.checkBox1:setField("isMelhoriaActive");
    obj.checkBox1:setText("Melhoria");
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setFontSize(10);
    obj.checkBox1:setName("checkBox1");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setMinWidth(50);
    obj.flowPart9:setMaxWidth(75);
    obj.flowPart9:setHeight(15);
    obj.flowPart9:setName("flowPart9");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowPart9);
    obj.checkBox2:setAlign("client");
    obj.checkBox2:setField("isDnTempActive");
    obj.checkBox2:setText("Dn Temp.");
    obj.checkBox2:setHorzTextAlign("center");
    obj.checkBox2:setFontSize(10);
    obj.checkBox2:setName("checkBox2");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setMinWidth(50);
    obj.flowPart10:setMaxWidth(75);
    obj.flowPart10:setHeight(15);
    obj.flowPart10:setName("flowPart10");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowPart10);
    obj.checkBox3:setAlign("client");
    obj.checkBox3:setField("isDnPermActive");
    obj.checkBox3:setText("Dn Perm.");
    obj.checkBox3:setHorzTextAlign("center");
    obj.checkBox3:setFontSize(10);
    obj.checkBox3:setName("checkBox3");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setMinWidth(50);
    obj.flowPart11:setMaxWidth(75);
    obj.flowPart11:setHeight(15);
    obj.flowPart11:setName("flowPart11");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowPart11);
    obj.checkBox4:setAlign("client");
    obj.checkBox4:setField("isTempActive");
    obj.checkBox4:setText("Temp.");
    obj.checkBox4:setHorzTextAlign("center");
    obj.checkBox4:setFontSize(10);
    obj.checkBox4:setName("checkBox4");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setMinWidth(50);
    obj.flowPart12:setMaxWidth(75);
    obj.flowPart12:setHeight(15);
    obj.flowPart12:setName("flowPart12");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowPart12);
    obj.checkBox5:setAlign("client");
    obj.checkBox5:setField("isClasseActive");
    obj.checkBox5:setText("Classe");
    obj.checkBox5:setHorzTextAlign("center");
    obj.checkBox5:setFontSize(10);
    obj.checkBox5:setName("checkBox5");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout1);
    obj.flowPart13:setMinWidth(50);
    obj.flowPart13:setMaxWidth(75);
    obj.flowPart13:setHeight(15);
    obj.flowPart13:setName("flowPart13");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowPart13);
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
    obj.flowLayout2:setMaxControlsPerLine(13);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setMinWidth(50);
    obj.flowPart14:setMaxWidth(50);
    obj.flowPart14:setHeight(20);
    obj.flowPart14:setName("flowPart14");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart14);
    obj.edit1:setAlign("client");
    obj.edit1:setField("inicialFor");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(50);
    obj.flowPart15:setMaxWidth(50);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setName("flowPart15");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart15);
    obj.edit2:setAlign("client");
    obj.edit2:setField("racaFor");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(50);
    obj.flowPart16:setMaxWidth(50);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setName("flowPart16");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart16);
    obj.edit3:setAlign("client");
    obj.edit3:setField("nepFor");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(50);
    obj.flowPart17:setMaxWidth(50);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart17);
    obj.edit4:setAlign("client");
    obj.edit4:setField("inerenteFor");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setMinWidth(50);
    obj.flowPart18:setMaxWidth(50);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setName("flowPart18");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart18);
    obj.edit5:setAlign("client");
    obj.edit5:setField("tamanhoFor");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setMinWidth(50);
    obj.flowPart19:setMaxWidth(50);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart19);
    obj.edit6:setAlign("client");
    obj.edit6:setField("outrosFor");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(12);
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setMinWidth(20);
    obj.flowPart20:setMaxWidth(20);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setName("flowPart20");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setMinWidth(50);
    obj.flowPart21:setMaxWidth(75);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setName("flowPart21");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart21);
    obj.edit7:setAlign("client");
    obj.edit7:setField("melhoriaFor");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(12);
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setMinWidth(50);
    obj.flowPart22:setMaxWidth(75);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setName("flowPart22");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart22);
    obj.edit8:setAlign("client");
    obj.edit8:setField("danoTempFor");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(12);
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout2);
    obj.flowPart23:setMinWidth(50);
    obj.flowPart23:setMaxWidth(75);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart23);
    obj.edit9:setAlign("client");
    obj.edit9:setField("danoPermFor");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(12);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout2);
    obj.flowPart24:setMinWidth(50);
    obj.flowPart24:setMaxWidth(75);
    obj.flowPart24:setHeight(20);
    obj.flowPart24:setName("flowPart24");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart24);
    obj.edit10:setAlign("client");
    obj.edit10:setField("temporarioFor");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(12);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout2);
    obj.flowPart25:setMinWidth(50);
    obj.flowPart25:setMaxWidth(75);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart25);
    obj.edit11:setAlign("client");
    obj.edit11:setField("magiaFor");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(12);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout2);
    obj.flowPart26:setMinWidth(50);
    obj.flowPart26:setMaxWidth(75);
    obj.flowPart26:setHeight(20);
    obj.flowPart26:setName("flowPart26");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart26);
    obj.edit12:setAlign("client");
    obj.edit12:setField("classeFor");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(12);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.popAtributo);
    obj.dataLink1:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink1:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.popAtributo);
    obj.dataLink2:setFields({'inicialFor', 'racaFor', 'nepFor', 'inerenteFor', 'tamanhoFor', 'outrosFor', 'melhoriaFor', 'danoTempFor', 'danoPermFor', 'temporarioFor', 'magiaFor', 'classeFor', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink2:setName("dataLink2");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.popAtributo);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxControlsPerLine(13);
    obj.flowLayout3:setMargins({bottom=4});
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout3);
    obj.flowPart27:setMinWidth(50);
    obj.flowPart27:setMaxWidth(50);
    obj.flowPart27:setHeight(20);
    obj.flowPart27:setName("flowPart27");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart27);
    obj.edit13:setAlign("client");
    obj.edit13:setField("inicialDes");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(12);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout3);
    obj.flowPart28:setMinWidth(50);
    obj.flowPart28:setMaxWidth(50);
    obj.flowPart28:setHeight(20);
    obj.flowPart28:setName("flowPart28");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart28);
    obj.edit14:setAlign("client");
    obj.edit14:setField("racaDes");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(12);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout3);
    obj.flowPart29:setMinWidth(50);
    obj.flowPart29:setMaxWidth(50);
    obj.flowPart29:setHeight(20);
    obj.flowPart29:setName("flowPart29");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart29);
    obj.edit15:setAlign("client");
    obj.edit15:setField("nepDes");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(12);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout3);
    obj.flowPart30:setMinWidth(50);
    obj.flowPart30:setMaxWidth(50);
    obj.flowPart30:setHeight(20);
    obj.flowPart30:setName("flowPart30");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart30);
    obj.edit16:setAlign("client");
    obj.edit16:setField("inerenteDes");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(12);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout3);
    obj.flowPart31:setMinWidth(50);
    obj.flowPart31:setMaxWidth(50);
    obj.flowPart31:setHeight(20);
    obj.flowPart31:setName("flowPart31");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart31);
    obj.edit17:setAlign("client");
    obj.edit17:setField("tamanhoDes");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(12);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout3);
    obj.flowPart32:setMinWidth(50);
    obj.flowPart32:setMaxWidth(50);
    obj.flowPart32:setHeight(20);
    obj.flowPart32:setName("flowPart32");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart32);
    obj.edit18:setAlign("client");
    obj.edit18:setField("outrosDes");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(12);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout3);
    obj.flowPart33:setMinWidth(20);
    obj.flowPart33:setMaxWidth(20);
    obj.flowPart33:setHeight(20);
    obj.flowPart33:setName("flowPart33");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout3);
    obj.flowPart34:setMinWidth(50);
    obj.flowPart34:setMaxWidth(75);
    obj.flowPart34:setHeight(20);
    obj.flowPart34:setName("flowPart34");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart34);
    obj.edit19:setAlign("client");
    obj.edit19:setField("melhoriaDes");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(12);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout3);
    obj.flowPart35:setMinWidth(50);
    obj.flowPart35:setMaxWidth(75);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setName("flowPart35");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart35);
    obj.edit20:setAlign("client");
    obj.edit20:setField("danoTempDes");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(12);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout3);
    obj.flowPart36:setMinWidth(50);
    obj.flowPart36:setMaxWidth(75);
    obj.flowPart36:setHeight(20);
    obj.flowPart36:setName("flowPart36");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart36);
    obj.edit21:setAlign("client");
    obj.edit21:setField("danoPermDes");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(12);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout3);
    obj.flowPart37:setMinWidth(50);
    obj.flowPart37:setMaxWidth(75);
    obj.flowPart37:setHeight(20);
    obj.flowPart37:setName("flowPart37");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart37);
    obj.edit22:setAlign("client");
    obj.edit22:setField("temporarioDes");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(12);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout3);
    obj.flowPart38:setMinWidth(50);
    obj.flowPart38:setMaxWidth(75);
    obj.flowPart38:setHeight(20);
    obj.flowPart38:setName("flowPart38");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart38);
    obj.edit23:setAlign("client");
    obj.edit23:setField("magiaDes");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(12);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout3);
    obj.flowPart39:setMinWidth(50);
    obj.flowPart39:setMaxWidth(75);
    obj.flowPart39:setHeight(20);
    obj.flowPart39:setName("flowPart39");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart39);
    obj.edit24:setAlign("client");
    obj.edit24:setField("classeDes");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(12);
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.popAtributo);
    obj.dataLink3:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink3:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.popAtributo);
    obj.dataLink4:setFields({'inicialDes', 'racaDes', 'nepDes', 'inerenteDes', 'tamanhoDes', 'outrosDes', 'melhoriaDes', 'danoTempDes', 'danoPermDes', 'temporarioDes', 'magiaDes', 'classeDes', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink4:setName("dataLink4");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.popAtributo);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxControlsPerLine(13);
    obj.flowLayout4:setMargins({bottom=4});
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout4);
    obj.flowPart40:setMinWidth(50);
    obj.flowPart40:setMaxWidth(50);
    obj.flowPart40:setHeight(20);
    obj.flowPart40:setName("flowPart40");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart40);
    obj.edit25:setAlign("client");
    obj.edit25:setField("inicialCon");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(12);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout4);
    obj.flowPart41:setMinWidth(50);
    obj.flowPart41:setMaxWidth(50);
    obj.flowPart41:setHeight(20);
    obj.flowPart41:setName("flowPart41");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart41);
    obj.edit26:setAlign("client");
    obj.edit26:setField("racaCon");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(12);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout4);
    obj.flowPart42:setMinWidth(50);
    obj.flowPart42:setMaxWidth(50);
    obj.flowPart42:setHeight(20);
    obj.flowPart42:setName("flowPart42");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart42);
    obj.edit27:setAlign("client");
    obj.edit27:setField("nepCon");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(12);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout4);
    obj.flowPart43:setMinWidth(50);
    obj.flowPart43:setMaxWidth(50);
    obj.flowPart43:setHeight(20);
    obj.flowPart43:setName("flowPart43");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart43);
    obj.edit28:setAlign("client");
    obj.edit28:setField("inerenteCon");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(12);
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout4);
    obj.flowPart44:setMinWidth(50);
    obj.flowPart44:setMaxWidth(50);
    obj.flowPart44:setHeight(20);
    obj.flowPart44:setName("flowPart44");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart44);
    obj.edit29:setAlign("client");
    obj.edit29:setField("tamanhoCon");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(12);
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout4);
    obj.flowPart45:setMinWidth(50);
    obj.flowPart45:setMaxWidth(50);
    obj.flowPart45:setHeight(20);
    obj.flowPart45:setName("flowPart45");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart45);
    obj.edit30:setAlign("client");
    obj.edit30:setField("outrosCon");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(12);
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout4);
    obj.flowPart46:setMinWidth(20);
    obj.flowPart46:setMaxWidth(20);
    obj.flowPart46:setHeight(20);
    obj.flowPart46:setName("flowPart46");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout4);
    obj.flowPart47:setMinWidth(50);
    obj.flowPart47:setMaxWidth(75);
    obj.flowPart47:setHeight(20);
    obj.flowPart47:setName("flowPart47");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart47);
    obj.edit31:setAlign("client");
    obj.edit31:setField("melhoriaCon");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(12);
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout4);
    obj.flowPart48:setMinWidth(50);
    obj.flowPart48:setMaxWidth(75);
    obj.flowPart48:setHeight(20);
    obj.flowPart48:setName("flowPart48");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart48);
    obj.edit32:setAlign("client");
    obj.edit32:setField("danoTempCon");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(12);
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout4);
    obj.flowPart49:setMinWidth(50);
    obj.flowPart49:setMaxWidth(75);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setName("flowPart49");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart49);
    obj.edit33:setAlign("client");
    obj.edit33:setField("danoPermCon");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(12);
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout4);
    obj.flowPart50:setMinWidth(50);
    obj.flowPart50:setMaxWidth(75);
    obj.flowPart50:setHeight(20);
    obj.flowPart50:setName("flowPart50");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart50);
    obj.edit34:setAlign("client");
    obj.edit34:setField("temporarioCon");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(12);
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout4);
    obj.flowPart51:setMinWidth(50);
    obj.flowPart51:setMaxWidth(75);
    obj.flowPart51:setHeight(20);
    obj.flowPart51:setName("flowPart51");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart51);
    obj.edit35:setAlign("client");
    obj.edit35:setField("magiaCon");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontSize(12);
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout4);
    obj.flowPart52:setMinWidth(50);
    obj.flowPart52:setMaxWidth(75);
    obj.flowPart52:setHeight(20);
    obj.flowPart52:setName("flowPart52");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart52);
    obj.edit36:setAlign("client");
    obj.edit36:setField("classeCon");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontSize(12);
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.popAtributo);
    obj.dataLink5:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink5:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.popAtributo);
    obj.dataLink6:setFields({'inicialCon', 'racaCon', 'nepCon', 'inerenteCon', 'tamanhoCon', 'outrosCon', 'melhoriaCon', 'danoTempCon', 'danoPermCon', 'temporarioCon', 'magiaCon', 'classeCon', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink6:setName("dataLink6");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.popAtributo);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxControlsPerLine(13);
    obj.flowLayout5:setMargins({bottom=4});
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout5);
    obj.flowPart53:setMinWidth(50);
    obj.flowPart53:setMaxWidth(50);
    obj.flowPart53:setHeight(20);
    obj.flowPart53:setName("flowPart53");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart53);
    obj.edit37:setAlign("client");
    obj.edit37:setField("inicialInt");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(12);
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout5);
    obj.flowPart54:setMinWidth(50);
    obj.flowPart54:setMaxWidth(50);
    obj.flowPart54:setHeight(20);
    obj.flowPart54:setName("flowPart54");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart54);
    obj.edit38:setAlign("client");
    obj.edit38:setField("racaInt");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontSize(12);
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout5);
    obj.flowPart55:setMinWidth(50);
    obj.flowPart55:setMaxWidth(50);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setName("flowPart55");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart55);
    obj.edit39:setAlign("client");
    obj.edit39:setField("nepInt");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontSize(12);
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout5);
    obj.flowPart56:setMinWidth(50);
    obj.flowPart56:setMaxWidth(50);
    obj.flowPart56:setHeight(20);
    obj.flowPart56:setName("flowPart56");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart56);
    obj.edit40:setAlign("client");
    obj.edit40:setField("inerenteInt");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontSize(12);
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout5);
    obj.flowPart57:setMinWidth(50);
    obj.flowPart57:setMaxWidth(50);
    obj.flowPart57:setHeight(20);
    obj.flowPart57:setName("flowPart57");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart57);
    obj.edit41:setAlign("client");
    obj.edit41:setField("tamanhoInt");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(12);
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout5);
    obj.flowPart58:setMinWidth(50);
    obj.flowPart58:setMaxWidth(50);
    obj.flowPart58:setHeight(20);
    obj.flowPart58:setName("flowPart58");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart58);
    obj.edit42:setAlign("client");
    obj.edit42:setField("outrosInt");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontSize(12);
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout5);
    obj.flowPart59:setMinWidth(20);
    obj.flowPart59:setMaxWidth(20);
    obj.flowPart59:setHeight(20);
    obj.flowPart59:setName("flowPart59");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout5);
    obj.flowPart60:setMinWidth(50);
    obj.flowPart60:setMaxWidth(75);
    obj.flowPart60:setHeight(20);
    obj.flowPart60:setName("flowPart60");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart60);
    obj.edit43:setAlign("client");
    obj.edit43:setField("melhoriaInt");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(12);
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout5);
    obj.flowPart61:setMinWidth(50);
    obj.flowPart61:setMaxWidth(75);
    obj.flowPart61:setHeight(20);
    obj.flowPart61:setName("flowPart61");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart61);
    obj.edit44:setAlign("client");
    obj.edit44:setField("danoTempInt");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(12);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout5);
    obj.flowPart62:setMinWidth(50);
    obj.flowPart62:setMaxWidth(75);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setName("flowPart62");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart62);
    obj.edit45:setAlign("client");
    obj.edit45:setField("danoPermInt");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontSize(12);
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout5);
    obj.flowPart63:setMinWidth(50);
    obj.flowPart63:setMaxWidth(75);
    obj.flowPart63:setHeight(20);
    obj.flowPart63:setName("flowPart63");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart63);
    obj.edit46:setAlign("client");
    obj.edit46:setField("temporarioInt");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(12);
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout5);
    obj.flowPart64:setMinWidth(50);
    obj.flowPart64:setMaxWidth(75);
    obj.flowPart64:setHeight(20);
    obj.flowPart64:setName("flowPart64");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart64);
    obj.edit47:setAlign("client");
    obj.edit47:setField("magiaInt");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontSize(12);
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout5);
    obj.flowPart65:setMinWidth(50);
    obj.flowPart65:setMaxWidth(75);
    obj.flowPart65:setHeight(20);
    obj.flowPart65:setName("flowPart65");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart65);
    obj.edit48:setAlign("client");
    obj.edit48:setField("classeInt");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontSize(12);
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.popAtributo);
    obj.dataLink7:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink7:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.popAtributo);
    obj.dataLink8:setFields({'inicialInt', 'racaInt', 'nepInt', 'inerenteInt', 'tamanhoInt', 'outrosInt', 'melhoriaInt', 'danoTempInt', 'danoPermInt', 'temporarioInt', 'magiaInt', 'classeInt', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink8:setName("dataLink8");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.popAtributo);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxControlsPerLine(13);
    obj.flowLayout6:setMargins({bottom=4});
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout6);
    obj.flowPart66:setMinWidth(50);
    obj.flowPart66:setMaxWidth(50);
    obj.flowPart66:setHeight(20);
    obj.flowPart66:setName("flowPart66");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart66);
    obj.edit49:setAlign("client");
    obj.edit49:setField("inicialSab");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontSize(12);
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout6);
    obj.flowPart67:setMinWidth(50);
    obj.flowPart67:setMaxWidth(50);
    obj.flowPart67:setHeight(20);
    obj.flowPart67:setName("flowPart67");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart67);
    obj.edit50:setAlign("client");
    obj.edit50:setField("racaSab");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontSize(12);
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout6);
    obj.flowPart68:setMinWidth(50);
    obj.flowPart68:setMaxWidth(50);
    obj.flowPart68:setHeight(20);
    obj.flowPart68:setName("flowPart68");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart68);
    obj.edit51:setAlign("client");
    obj.edit51:setField("nepSab");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontSize(12);
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout6);
    obj.flowPart69:setMinWidth(50);
    obj.flowPart69:setMaxWidth(50);
    obj.flowPart69:setHeight(20);
    obj.flowPart69:setName("flowPart69");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart69);
    obj.edit52:setAlign("client");
    obj.edit52:setField("inerenteSab");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontSize(12);
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout6);
    obj.flowPart70:setMinWidth(50);
    obj.flowPart70:setMaxWidth(50);
    obj.flowPart70:setHeight(20);
    obj.flowPart70:setName("flowPart70");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart70);
    obj.edit53:setAlign("client");
    obj.edit53:setField("tamanhoSab");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontSize(12);
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout6);
    obj.flowPart71:setMinWidth(50);
    obj.flowPart71:setMaxWidth(50);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setName("flowPart71");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart71);
    obj.edit54:setAlign("client");
    obj.edit54:setField("outrosSab");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontSize(12);
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout6);
    obj.flowPart72:setMinWidth(20);
    obj.flowPart72:setMaxWidth(20);
    obj.flowPart72:setHeight(20);
    obj.flowPart72:setName("flowPart72");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout6);
    obj.flowPart73:setMinWidth(50);
    obj.flowPart73:setMaxWidth(75);
    obj.flowPart73:setHeight(20);
    obj.flowPart73:setName("flowPart73");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart73);
    obj.edit55:setAlign("client");
    obj.edit55:setField("melhoriaSab");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setFontSize(12);
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout6);
    obj.flowPart74:setMinWidth(50);
    obj.flowPart74:setMaxWidth(75);
    obj.flowPart74:setHeight(20);
    obj.flowPart74:setName("flowPart74");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart74);
    obj.edit56:setAlign("client");
    obj.edit56:setField("danoTempSab");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontSize(12);
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout6);
    obj.flowPart75:setMinWidth(50);
    obj.flowPart75:setMaxWidth(75);
    obj.flowPart75:setHeight(20);
    obj.flowPart75:setName("flowPart75");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart75);
    obj.edit57:setAlign("client");
    obj.edit57:setField("danoPermSab");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setFontSize(12);
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout6);
    obj.flowPart76:setMinWidth(50);
    obj.flowPart76:setMaxWidth(75);
    obj.flowPart76:setHeight(20);
    obj.flowPart76:setName("flowPart76");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart76);
    obj.edit58:setAlign("client");
    obj.edit58:setField("temporarioSab");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(12);
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout6);
    obj.flowPart77:setMinWidth(50);
    obj.flowPart77:setMaxWidth(75);
    obj.flowPart77:setHeight(20);
    obj.flowPart77:setName("flowPart77");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart77);
    obj.edit59:setAlign("client");
    obj.edit59:setField("magiaSab");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setFontSize(12);
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout6);
    obj.flowPart78:setMinWidth(50);
    obj.flowPart78:setMaxWidth(75);
    obj.flowPart78:setHeight(20);
    obj.flowPart78:setName("flowPart78");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart78);
    obj.edit60:setAlign("client");
    obj.edit60:setField("classeSab");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(12);
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.popAtributo);
    obj.dataLink9:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink9:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.popAtributo);
    obj.dataLink10:setFields({'inicialSab', 'racaSab', 'nepSab', 'inerenteSab', 'tamanhoSab', 'outrosSab', 'melhoriaSab', 'danoTempSab', 'danoPermSab', 'temporarioSab', 'magiaSab', 'classeSab', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink10:setName("dataLink10");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.popAtributo);
    obj.flowLayout7:setAlign("top");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMaxControlsPerLine(13);
    obj.flowLayout7:setMargins({bottom=4});
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setName("flowLayout7");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout7);
    obj.flowPart79:setMinWidth(50);
    obj.flowPart79:setMaxWidth(50);
    obj.flowPart79:setHeight(20);
    obj.flowPart79:setName("flowPart79");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart79);
    obj.edit61:setAlign("client");
    obj.edit61:setField("inicialCar");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontSize(12);
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout7);
    obj.flowPart80:setMinWidth(50);
    obj.flowPart80:setMaxWidth(50);
    obj.flowPart80:setHeight(20);
    obj.flowPart80:setName("flowPart80");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart80);
    obj.edit62:setAlign("client");
    obj.edit62:setField("racaCar");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontSize(12);
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout7);
    obj.flowPart81:setMinWidth(50);
    obj.flowPart81:setMaxWidth(50);
    obj.flowPart81:setHeight(20);
    obj.flowPart81:setName("flowPart81");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart81);
    obj.edit63:setAlign("client");
    obj.edit63:setField("nepCar");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontSize(12);
    obj.edit63:setType("number");
    obj.edit63:setName("edit63");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout7);
    obj.flowPart82:setMinWidth(50);
    obj.flowPart82:setMaxWidth(50);
    obj.flowPart82:setHeight(20);
    obj.flowPart82:setName("flowPart82");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart82);
    obj.edit64:setAlign("client");
    obj.edit64:setField("inerenteCar");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontSize(12);
    obj.edit64:setType("number");
    obj.edit64:setName("edit64");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout7);
    obj.flowPart83:setMinWidth(50);
    obj.flowPart83:setMaxWidth(50);
    obj.flowPart83:setHeight(20);
    obj.flowPart83:setName("flowPart83");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart83);
    obj.edit65:setAlign("client");
    obj.edit65:setField("tamanhoCar");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontSize(12);
    obj.edit65:setType("number");
    obj.edit65:setName("edit65");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout7);
    obj.flowPart84:setMinWidth(50);
    obj.flowPart84:setMaxWidth(50);
    obj.flowPart84:setHeight(20);
    obj.flowPart84:setName("flowPart84");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.flowPart84);
    obj.edit66:setAlign("client");
    obj.edit66:setField("outrosCar");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontSize(12);
    obj.edit66:setType("number");
    obj.edit66:setName("edit66");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout7);
    obj.flowPart85:setMinWidth(20);
    obj.flowPart85:setMaxWidth(20);
    obj.flowPart85:setHeight(20);
    obj.flowPart85:setName("flowPart85");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout7);
    obj.flowPart86:setMinWidth(50);
    obj.flowPart86:setMaxWidth(75);
    obj.flowPart86:setHeight(20);
    obj.flowPart86:setName("flowPart86");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.flowPart86);
    obj.edit67:setAlign("client");
    obj.edit67:setField("melhoriaCar");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontSize(12);
    obj.edit67:setType("number");
    obj.edit67:setName("edit67");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout7);
    obj.flowPart87:setMinWidth(50);
    obj.flowPart87:setMaxWidth(75);
    obj.flowPart87:setHeight(20);
    obj.flowPart87:setName("flowPart87");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.flowPart87);
    obj.edit68:setAlign("client");
    obj.edit68:setField("danoTempCar");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontSize(12);
    obj.edit68:setType("number");
    obj.edit68:setName("edit68");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout7);
    obj.flowPart88:setMinWidth(50);
    obj.flowPart88:setMaxWidth(75);
    obj.flowPart88:setHeight(20);
    obj.flowPart88:setName("flowPart88");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart88);
    obj.edit69:setAlign("client");
    obj.edit69:setField("danoPermCar");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontSize(12);
    obj.edit69:setType("number");
    obj.edit69:setName("edit69");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout7);
    obj.flowPart89:setMinWidth(50);
    obj.flowPart89:setMaxWidth(75);
    obj.flowPart89:setHeight(20);
    obj.flowPart89:setName("flowPart89");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart89);
    obj.edit70:setAlign("client");
    obj.edit70:setField("temporarioCar");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontSize(12);
    obj.edit70:setType("number");
    obj.edit70:setName("edit70");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout7);
    obj.flowPart90:setMinWidth(50);
    obj.flowPart90:setMaxWidth(75);
    obj.flowPart90:setHeight(20);
    obj.flowPart90:setName("flowPart90");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart90);
    obj.edit71:setAlign("client");
    obj.edit71:setField("magiaCar");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontSize(12);
    obj.edit71:setType("number");
    obj.edit71:setName("edit71");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout7);
    obj.flowPart91:setMinWidth(50);
    obj.flowPart91:setMaxWidth(75);
    obj.flowPart91:setHeight(20);
    obj.flowPart91:setName("flowPart91");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart91);
    obj.edit72:setAlign("client");
    obj.edit72:setField("classeCar");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontSize(12);
    obj.edit72:setType("number");
    obj.edit72:setName("edit72");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.popAtributo);
    obj.dataLink11:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink11:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.popAtributo);
    obj.dataLink12:setFields({'inicialCar', 'racaCar', 'nepCar', 'inerenteCar', 'tamanhoCar', 'outrosCar', 'melhoriaCar', 'danoTempCar', 'danoPermCar', 'temporarioCar', 'magiaCar', 'classeCar', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink12:setName("dataLink12");

    obj.popResistencia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popResistencia:setParent(obj.scrollBox1);
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

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout8);
    obj.flowPart92:setMinWidth(50);
    obj.flowPart92:setMaxWidth(50);
    obj.flowPart92:setHeight(15);
    obj.flowPart92:setName("flowPart92");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart92);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Base");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout8);
    obj.flowPart93:setMinWidth(50);
    obj.flowPart93:setMaxWidth(50);
    obj.flowPart93:setHeight(15);
    obj.flowPart93:setName("flowPart93");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart93);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Atributo");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout8);
    obj.flowPart94:setMinWidth(50);
    obj.flowPart94:setMaxWidth(50);
    obj.flowPart94:setHeight(15);
    obj.flowPart94:setName("flowPart94");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart94);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(10);
    obj.label9:setText("Magia");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout8);
    obj.flowPart95:setMinWidth(50);
    obj.flowPart95:setMaxWidth(50);
    obj.flowPart95:setHeight(15);
    obj.flowPart95:setName("flowPart95");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart95);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Melhoria");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout8);
    obj.flowPart96:setMinWidth(50);
    obj.flowPart96:setMaxWidth(50);
    obj.flowPart96:setHeight(15);
    obj.flowPart96:setName("flowPart96");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart96);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(10);
    obj.label11:setText("Temp.");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout8);
    obj.flowPart97:setMinWidth(50);
    obj.flowPart97:setMaxWidth(50);
    obj.flowPart97:setHeight(15);
    obj.flowPart97:setName("flowPart97");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart97);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Outros");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout8);
    obj.flowPart98:setMinWidth(50);
    obj.flowPart98:setMaxWidth(50);
    obj.flowPart98:setHeight(15);
    obj.flowPart98:setName("flowPart98");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart98);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(10);
    obj.label13:setText("");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.popResistencia);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxControlsPerLine(11);
    obj.flowLayout9:setMargins({bottom=4});
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setName("flowLayout9");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout9);
    obj.flowPart99:setMinWidth(50);
    obj.flowPart99:setMaxWidth(50);
    obj.flowPart99:setHeight(20);
    obj.flowPart99:setName("flowPart99");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart99);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart99);
    obj.label14:setAlign("client");
    obj.label14:setField("baseFort");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontSize(12);
    obj.label14:setName("label14");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout9);
    obj.flowPart100:setMinWidth(50);
    obj.flowPart100:setMaxWidth(50);
    obj.flowPart100:setHeight(20);
    obj.flowPart100:setName("flowPart100");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowPart100);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart100);
    obj.label15:setAlign("client");
    obj.label15:setField("atrModFort");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontSize(12);
    obj.label15:setName("label15");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout9);
    obj.flowPart101:setMinWidth(50);
    obj.flowPart101:setMaxWidth(50);
    obj.flowPart101:setHeight(20);
    obj.flowPart101:setName("flowPart101");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart101);
    obj.edit73:setAlign("client");
    obj.edit73:setField("magiaFort");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontSize(12);
    obj.edit73:setType("number");
    obj.edit73:setName("edit73");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout9);
    obj.flowPart102:setMinWidth(50);
    obj.flowPart102:setMaxWidth(50);
    obj.flowPart102:setHeight(20);
    obj.flowPart102:setName("flowPart102");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart102);
    obj.edit74:setAlign("client");
    obj.edit74:setField("variavelFort");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontSize(12);
    obj.edit74:setType("number");
    obj.edit74:setName("edit74");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout9);
    obj.flowPart103:setMinWidth(50);
    obj.flowPart103:setMaxWidth(50);
    obj.flowPart103:setHeight(20);
    obj.flowPart103:setName("flowPart103");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.flowPart103);
    obj.edit75:setAlign("client");
    obj.edit75:setField("temporarioFort");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setFontSize(12);
    obj.edit75:setType("number");
    obj.edit75:setName("edit75");

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout9);
    obj.flowPart104:setMinWidth(50);
    obj.flowPart104:setMaxWidth(50);
    obj.flowPart104:setHeight(20);
    obj.flowPart104:setName("flowPart104");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.flowPart104);
    obj.edit76:setAlign("client");
    obj.edit76:setField("outrosFort");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontSize(12);
    obj.edit76:setType("number");
    obj.edit76:setName("edit76");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout9);
    obj.flowPart105:setMinWidth(60);
    obj.flowPart105:setMaxWidth(60);
    obj.flowPart105:setHeight(20);
    obj.flowPart105:setName("flowPart105");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowPart105);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setField("atrTrFort");
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.popResistencia);
    obj.dataLink13:setFields({'baseFort', 'atrModFort', 'magiaFort', 'variavelFort', 'temporarioFort', 'outrosFort'});
    obj.dataLink13:setName("dataLink13");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.popResistencia);
    obj.flowLayout10:setAlign("top");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxControlsPerLine(11);
    obj.flowLayout10:setMargins({bottom=4});
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setName("flowLayout10");

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout10);
    obj.flowPart106:setMinWidth(50);
    obj.flowPart106:setMaxWidth(50);
    obj.flowPart106:setHeight(20);
    obj.flowPart106:setName("flowPart106");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart106);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart106);
    obj.label16:setAlign("client");
    obj.label16:setField("baseRef");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(12);
    obj.label16:setName("label16");

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout10);
    obj.flowPart107:setMinWidth(50);
    obj.flowPart107:setMaxWidth(50);
    obj.flowPart107:setHeight(20);
    obj.flowPart107:setName("flowPart107");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowPart107);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart107);
    obj.label17:setAlign("client");
    obj.label17:setField("atrModRef");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(12);
    obj.label17:setName("label17");

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout10);
    obj.flowPart108:setMinWidth(50);
    obj.flowPart108:setMaxWidth(50);
    obj.flowPart108:setHeight(20);
    obj.flowPart108:setName("flowPart108");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.flowPart108);
    obj.edit77:setAlign("client");
    obj.edit77:setField("magiaRef");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setFontSize(12);
    obj.edit77:setType("number");
    obj.edit77:setName("edit77");

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout10);
    obj.flowPart109:setMinWidth(50);
    obj.flowPart109:setMaxWidth(50);
    obj.flowPart109:setHeight(20);
    obj.flowPart109:setName("flowPart109");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.flowPart109);
    obj.edit78:setAlign("client");
    obj.edit78:setField("variavelRef");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setFontSize(12);
    obj.edit78:setType("number");
    obj.edit78:setName("edit78");

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout10);
    obj.flowPart110:setMinWidth(50);
    obj.flowPart110:setMaxWidth(50);
    obj.flowPart110:setHeight(20);
    obj.flowPart110:setName("flowPart110");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.flowPart110);
    obj.edit79:setAlign("client");
    obj.edit79:setField("temporarioRef");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setFontSize(12);
    obj.edit79:setType("number");
    obj.edit79:setName("edit79");

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout10);
    obj.flowPart111:setMinWidth(50);
    obj.flowPart111:setMaxWidth(50);
    obj.flowPart111:setHeight(20);
    obj.flowPart111:setName("flowPart111");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.flowPart111);
    obj.edit80:setAlign("client");
    obj.edit80:setField("outrosRef");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setFontSize(12);
    obj.edit80:setType("number");
    obj.edit80:setName("edit80");

    obj.flowPart112 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.flowLayout10);
    obj.flowPart112:setMinWidth(60);
    obj.flowPart112:setMaxWidth(60);
    obj.flowPart112:setHeight(20);
    obj.flowPart112:setName("flowPart112");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart112);
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setField("atrTrRef");
    obj.comboBox2:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.popResistencia);
    obj.dataLink14:setFields({'baseRef', 'atrModRef', 'magiaRef', 'variavelRef', 'temporarioRef', 'outrosRef'});
    obj.dataLink14:setName("dataLink14");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.popResistencia);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxControlsPerLine(11);
    obj.flowLayout11:setMargins({bottom=4});
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setName("flowLayout11");

    obj.flowPart113 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.flowLayout11);
    obj.flowPart113:setMinWidth(50);
    obj.flowPart113:setMaxWidth(50);
    obj.flowPart113:setHeight(20);
    obj.flowPart113:setName("flowPart113");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.flowPart113);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart113);
    obj.label18:setAlign("client");
    obj.label18:setField("baseVon");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontSize(12);
    obj.label18:setName("label18");

    obj.flowPart114 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.flowLayout11);
    obj.flowPart114:setMinWidth(50);
    obj.flowPart114:setMaxWidth(50);
    obj.flowPart114:setHeight(20);
    obj.flowPart114:setName("flowPart114");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.flowPart114);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart114);
    obj.label19:setAlign("client");
    obj.label19:setField("atrModVon");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontSize(12);
    obj.label19:setName("label19");

    obj.flowPart115 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.flowLayout11);
    obj.flowPart115:setMinWidth(50);
    obj.flowPart115:setMaxWidth(50);
    obj.flowPart115:setHeight(20);
    obj.flowPart115:setName("flowPart115");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.flowPart115);
    obj.edit81:setAlign("client");
    obj.edit81:setField("magiaVon");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setFontSize(12);
    obj.edit81:setType("number");
    obj.edit81:setName("edit81");

    obj.flowPart116 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.flowLayout11);
    obj.flowPart116:setMinWidth(50);
    obj.flowPart116:setMaxWidth(50);
    obj.flowPart116:setHeight(20);
    obj.flowPart116:setName("flowPart116");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.flowPart116);
    obj.edit82:setAlign("client");
    obj.edit82:setField("variavelVon");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setFontSize(12);
    obj.edit82:setType("number");
    obj.edit82:setName("edit82");

    obj.flowPart117 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.flowLayout11);
    obj.flowPart117:setMinWidth(50);
    obj.flowPart117:setMaxWidth(50);
    obj.flowPart117:setHeight(20);
    obj.flowPart117:setName("flowPart117");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.flowPart117);
    obj.edit83:setAlign("client");
    obj.edit83:setField("temporarioVon");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setFontSize(12);
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");

    obj.flowPart118 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.flowLayout11);
    obj.flowPart118:setMinWidth(50);
    obj.flowPart118:setMaxWidth(50);
    obj.flowPart118:setHeight(20);
    obj.flowPart118:setName("flowPart118");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.flowPart118);
    obj.edit84:setAlign("client");
    obj.edit84:setField("outrosVon");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setFontSize(12);
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");

    obj.flowPart119 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.flowLayout11);
    obj.flowPart119:setMinWidth(60);
    obj.flowPart119:setMaxWidth(60);
    obj.flowPart119:setHeight(20);
    obj.flowPart119:setName("flowPart119");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowPart119);
    obj.comboBox3:setAlign("client");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setField("atrTrVon");
    obj.comboBox3:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.popResistencia);
    obj.dataLink15:setFields({'baseVon', 'atrModVon', 'magiaVon', 'variavelVon', 'temporarioVon', 'outrosVon'});
    obj.dataLink15:setName("dataLink15");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popResistencia);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("trCondicional");
    obj.textEditor1:setName("textEditor1");

    obj.popCA = GUI.fromHandle(_obj_newObject("popup"));
    obj.popCA:setParent(obj.scrollBox1);
    obj.popCA:setName("popCA");
    obj.popCA:setWidth(500);
    obj.popCA:setHeight(210);
    obj.popCA:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popCA, "autoScopeNode",  "false");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.popCA);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMargins({bottom=4});
    obj.flowLayout12:setName("flowLayout12");

    obj.flowPart120 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.flowLayout12);
    obj.flowPart120:setMinWidth(50);
    obj.flowPart120:setMaxWidth(50);
    obj.flowPart120:setHeight(15);
    obj.flowPart120:setName("flowPart120");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart120);
    obj.label20:setAlign("top");
    obj.label20:setFontSize(10);
    obj.label20:setText("Armadura");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWordWrap(true);
    obj.label20:setTextTrimming("none");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.flowPart121 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout12);
    obj.flowPart121:setMinWidth(50);
    obj.flowPart121:setMaxWidth(50);
    obj.flowPart121:setHeight(20);
    obj.flowPart121:setName("flowPart121");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.flowPart121);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart121);
    obj.label21:setAlign("client");
    obj.label21:setField("equipamentoCorpoCA");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(12);
    obj.label21:setName("label21");

    obj.flowPart122 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.flowLayout12);
    obj.flowPart122:setMinWidth(140);
    obj.flowPart122:setMaxWidth(150);
    obj.flowPart122:setHeight(20);
    obj.flowPart122:setName("flowPart122");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.flowPart122);
    obj.edit85:setAlign("client");
    obj.edit85:setField("equipamentoCorpoCA2");
    obj.edit85:setFontSize(12);
    obj.edit85:setName("edit85");

    obj.flowPart123 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.flowLayout12);
    obj.flowPart123:setMinWidth(50);
    obj.flowPart123:setMaxWidth(60);
    obj.flowPart123:setHeight(20);
    obj.flowPart123:setName("flowPart123");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowPart123);
    obj.checkBox7:setField("armaduraCaSurp");
    obj.checkBox7:setText("Surpresa");
    obj.checkBox7:setFontSize(10);
    obj.checkBox7:setHeight(20);
    obj.checkBox7:setName("checkBox7");

    obj.flowPart124 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.flowLayout12);
    obj.flowPart124:setMinWidth(50);
    obj.flowPart124:setMaxWidth(60);
    obj.flowPart124:setHeight(20);
    obj.flowPart124:setName("flowPart124");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowPart124);
    obj.checkBox8:setField("armaduraCaToque");
    obj.checkBox8:setText("Toque");
    obj.checkBox8:setFontSize(10);
    obj.checkBox8:setHeight(15);
    obj.checkBox8:setName("checkBox8");

    obj.flowPart125 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.flowLayout12);
    obj.flowPart125:setMinWidth(10);
    obj.flowPart125:setMaxWidth(20);
    obj.flowPart125:setHeight(15);
    obj.flowPart125:setName("flowPart125");

    obj.flowPart126 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.flowLayout12);
    obj.flowPart126:setMinWidth(50);
    obj.flowPart126:setMaxWidth(50);
    obj.flowPart126:setHeight(15);
    obj.flowPart126:setName("flowPart126");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart126);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(10);
    obj.label22:setText("Penalidade");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.flowPart127 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.flowLayout12);
    obj.flowPart127:setMinWidth(50);
    obj.flowPart127:setMaxWidth(50);
    obj.flowPart127:setHeight(20);
    obj.flowPart127:setName("flowPart127");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowPart127);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart127);
    obj.label23:setAlign("client");
    obj.label23:setField("equipamentoCorpoPen");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(12);
    obj.label23:setName("label23");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout12);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart128 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.flowLayout12);
    obj.flowPart128:setMinWidth(50);
    obj.flowPart128:setMaxWidth(50);
    obj.flowPart128:setHeight(15);
    obj.flowPart128:setName("flowPart128");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart128);
    obj.label24:setAlign("top");
    obj.label24:setFontSize(10);
    obj.label24:setText("Escudo");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.flowPart129 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.flowLayout12);
    obj.flowPart129:setMinWidth(50);
    obj.flowPart129:setMaxWidth(50);
    obj.flowPart129:setHeight(20);
    obj.flowPart129:setName("flowPart129");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.flowPart129);
    obj.edit86:setAlign("client");
    obj.edit86:setField("escudoCa");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setFontSize(12);
    obj.edit86:setType("number");
    obj.edit86:setName("edit86");

    obj.flowPart130 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.flowLayout12);
    obj.flowPart130:setMinWidth(140);
    obj.flowPart130:setMaxWidth(150);
    obj.flowPart130:setHeight(20);
    obj.flowPart130:setName("flowPart130");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.flowPart130);
    obj.edit87:setAlign("client");
    obj.edit87:setField("escudoCa2");
    obj.edit87:setFontSize(12);
    obj.edit87:setName("edit87");

    obj.flowPart131 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.flowLayout12);
    obj.flowPart131:setMinWidth(50);
    obj.flowPart131:setMaxWidth(60);
    obj.flowPart131:setHeight(20);
    obj.flowPart131:setName("flowPart131");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowPart131);
    obj.checkBox9:setField("escudoCaSurp");
    obj.checkBox9:setText("Surpresa");
    obj.checkBox9:setFontSize(10);
    obj.checkBox9:setHeight(20);
    obj.checkBox9:setName("checkBox9");

    obj.flowPart132 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.flowLayout12);
    obj.flowPart132:setMinWidth(50);
    obj.flowPart132:setMaxWidth(60);
    obj.flowPart132:setHeight(20);
    obj.flowPart132:setName("flowPart132");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowPart132);
    obj.checkBox10:setField("escudoCaToque");
    obj.checkBox10:setText("Toque");
    obj.checkBox10:setFontSize(10);
    obj.checkBox10:setHeight(15);
    obj.checkBox10:setName("checkBox10");

    obj.flowPart133 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.flowLayout12);
    obj.flowPart133:setMinWidth(10);
    obj.flowPart133:setMaxWidth(20);
    obj.flowPart133:setHeight(15);
    obj.flowPart133:setName("flowPart133");

    obj.flowPart134 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.flowLayout12);
    obj.flowPart134:setMinWidth(50);
    obj.flowPart134:setMaxWidth(50);
    obj.flowPart134:setHeight(15);
    obj.flowPart134:setName("flowPart134");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart134);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(10);
    obj.label25:setText("Penalidade");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setWordWrap(true);
    obj.label25:setTextTrimming("none");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.flowPart135 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.flowLayout12);
    obj.flowPart135:setMinWidth(50);
    obj.flowPart135:setMaxWidth(50);
    obj.flowPart135:setHeight(20);
    obj.flowPart135:setName("flowPart135");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.flowPart135);
    obj.edit88:setAlign("client");
    obj.edit88:setField("escudoPen");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setFontSize(12);
    obj.edit88:setType("number");
    obj.edit88:setName("edit88");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout12);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart136 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.flowLayout12);
    obj.flowPart136:setMinWidth(50);
    obj.flowPart136:setMaxWidth(50);
    obj.flowPart136:setHeight(15);
    obj.flowPart136:setName("flowPart136");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart136);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(10);
    obj.label26:setText("Destreza");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.flowPart137 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.flowLayout12);
    obj.flowPart137:setMinWidth(50);
    obj.flowPart137:setMaxWidth(50);
    obj.flowPart137:setHeight(20);
    obj.flowPart137:setName("flowPart137");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowPart137);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart137);
    obj.label27:setAlign("client");
    obj.label27:setField("efetModDes");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontSize(12);
    obj.label27:setName("label27");

    obj.flowPart138 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.flowLayout12);
    obj.flowPart138:setMinWidth(140);
    obj.flowPart138:setMaxWidth(150);
    obj.flowPart138:setHeight(20);
    obj.flowPart138:setName("flowPart138");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.flowPart138);
    obj.edit89:setAlign("client");
    obj.edit89:setField("destrezaCa2");
    obj.edit89:setFontSize(12);
    obj.edit89:setName("edit89");

    obj.flowPart139 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.flowLayout12);
    obj.flowPart139:setMinWidth(50);
    obj.flowPart139:setMaxWidth(60);
    obj.flowPart139:setHeight(20);
    obj.flowPart139:setName("flowPart139");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowPart139);
    obj.checkBox11:setField("destrezaCaSurp");
    obj.checkBox11:setText("Surpresa");
    obj.checkBox11:setFontSize(10);
    obj.checkBox11:setHeight(20);
    obj.checkBox11:setName("checkBox11");

    obj.flowPart140 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.flowLayout12);
    obj.flowPart140:setMinWidth(50);
    obj.flowPart140:setMaxWidth(60);
    obj.flowPart140:setHeight(20);
    obj.flowPart140:setName("flowPart140");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowPart140);
    obj.checkBox12:setField("destrezaCaToque");
    obj.checkBox12:setText("Toque");
    obj.checkBox12:setFontSize(10);
    obj.checkBox12:setHeight(15);
    obj.checkBox12:setName("checkBox12");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout12);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart141 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.flowLayout12);
    obj.flowPart141:setMinWidth(50);
    obj.flowPart141:setMaxWidth(50);
    obj.flowPart141:setHeight(15);
    obj.flowPart141:setName("flowPart141");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart141);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(10);
    obj.label28:setText("Tamanho");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.flowPart142 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart142:setParent(obj.flowLayout12);
    obj.flowPart142:setMinWidth(50);
    obj.flowPart142:setMaxWidth(50);
    obj.flowPart142:setHeight(20);
    obj.flowPart142:setName("flowPart142");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.flowPart142);
    obj.edit90:setAlign("client");
    obj.edit90:setField("tamanhoCa");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setFontSize(12);
    obj.edit90:setType("number");
    obj.edit90:setName("edit90");

    obj.flowPart143 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart143:setParent(obj.flowLayout12);
    obj.flowPart143:setMinWidth(140);
    obj.flowPart143:setMaxWidth(150);
    obj.flowPart143:setHeight(20);
    obj.flowPart143:setName("flowPart143");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.flowPart143);
    obj.edit91:setAlign("client");
    obj.edit91:setField("tamanhoCa2");
    obj.edit91:setFontSize(12);
    obj.edit91:setName("edit91");

    obj.flowPart144 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart144:setParent(obj.flowLayout12);
    obj.flowPart144:setMinWidth(50);
    obj.flowPart144:setMaxWidth(60);
    obj.flowPart144:setHeight(20);
    obj.flowPart144:setName("flowPart144");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowPart144);
    obj.checkBox13:setField("tamanhoCaSurp");
    obj.checkBox13:setText("Surpresa");
    obj.checkBox13:setFontSize(10);
    obj.checkBox13:setHeight(20);
    obj.checkBox13:setName("checkBox13");

    obj.flowPart145 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart145:setParent(obj.flowLayout12);
    obj.flowPart145:setMinWidth(50);
    obj.flowPart145:setMaxWidth(60);
    obj.flowPart145:setHeight(20);
    obj.flowPart145:setName("flowPart145");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowPart145);
    obj.checkBox14:setField("tamanhoCaToque");
    obj.checkBox14:setText("Toque");
    obj.checkBox14:setFontSize(10);
    obj.checkBox14:setHeight(15);
    obj.checkBox14:setName("checkBox14");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout12);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart146 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart146:setParent(obj.flowLayout12);
    obj.flowPart146:setMinWidth(50);
    obj.flowPart146:setMaxWidth(50);
    obj.flowPart146:setHeight(15);
    obj.flowPart146:setName("flowPart146");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart146);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Natural");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.flowPart147 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart147:setParent(obj.flowLayout12);
    obj.flowPart147:setMinWidth(50);
    obj.flowPart147:setMaxWidth(50);
    obj.flowPart147:setHeight(20);
    obj.flowPart147:setName("flowPart147");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.flowPart147);
    obj.edit92:setAlign("client");
    obj.edit92:setField("naturalCa");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setFontSize(12);
    obj.edit92:setType("number");
    obj.edit92:setName("edit92");

    obj.flowPart148 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart148:setParent(obj.flowLayout12);
    obj.flowPart148:setMinWidth(140);
    obj.flowPart148:setMaxWidth(150);
    obj.flowPart148:setHeight(20);
    obj.flowPart148:setName("flowPart148");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.flowPart148);
    obj.edit93:setAlign("client");
    obj.edit93:setField("naturalCa2");
    obj.edit93:setFontSize(12);
    obj.edit93:setName("edit93");

    obj.flowPart149 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart149:setParent(obj.flowLayout12);
    obj.flowPart149:setMinWidth(50);
    obj.flowPart149:setMaxWidth(60);
    obj.flowPart149:setHeight(20);
    obj.flowPart149:setName("flowPart149");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowPart149);
    obj.checkBox15:setField("naturalCaSurp");
    obj.checkBox15:setText("Surpresa");
    obj.checkBox15:setFontSize(10);
    obj.checkBox15:setHeight(20);
    obj.checkBox15:setName("checkBox15");

    obj.flowPart150 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart150:setParent(obj.flowLayout12);
    obj.flowPart150:setMinWidth(50);
    obj.flowPart150:setMaxWidth(60);
    obj.flowPart150:setHeight(20);
    obj.flowPart150:setName("flowPart150");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowPart150);
    obj.checkBox16:setField("naturalCaToque");
    obj.checkBox16:setText("Toque");
    obj.checkBox16:setFontSize(10);
    obj.checkBox16:setHeight(15);
    obj.checkBox16:setName("checkBox16");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout12);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart151 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart151:setParent(obj.flowLayout12);
    obj.flowPart151:setMinWidth(50);
    obj.flowPart151:setMaxWidth(50);
    obj.flowPart151:setHeight(15);
    obj.flowPart151:setName("flowPart151");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart151);
    obj.label30:setAlign("top");
    obj.label30:setFontSize(10);
    obj.label30:setText("Deflexao");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWordWrap(true);
    obj.label30:setTextTrimming("none");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.flowPart152 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart152:setParent(obj.flowLayout12);
    obj.flowPart152:setMinWidth(50);
    obj.flowPart152:setMaxWidth(50);
    obj.flowPart152:setHeight(20);
    obj.flowPart152:setName("flowPart152");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.flowPart152);
    obj.edit94:setAlign("client");
    obj.edit94:setField("deflexaoCa");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setFontSize(12);
    obj.edit94:setType("number");
    obj.edit94:setName("edit94");

    obj.flowPart153 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart153:setParent(obj.flowLayout12);
    obj.flowPart153:setMinWidth(140);
    obj.flowPart153:setMaxWidth(150);
    obj.flowPart153:setHeight(20);
    obj.flowPart153:setName("flowPart153");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.flowPart153);
    obj.edit95:setAlign("client");
    obj.edit95:setField("deflexaoCa2");
    obj.edit95:setFontSize(12);
    obj.edit95:setName("edit95");

    obj.flowPart154 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart154:setParent(obj.flowLayout12);
    obj.flowPart154:setMinWidth(50);
    obj.flowPart154:setMaxWidth(60);
    obj.flowPart154:setHeight(20);
    obj.flowPart154:setName("flowPart154");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.flowPart154);
    obj.checkBox17:setField("deflexaoCaSurp");
    obj.checkBox17:setText("Surpresa");
    obj.checkBox17:setFontSize(10);
    obj.checkBox17:setHeight(20);
    obj.checkBox17:setName("checkBox17");

    obj.flowPart155 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart155:setParent(obj.flowLayout12);
    obj.flowPart155:setMinWidth(50);
    obj.flowPart155:setMaxWidth(60);
    obj.flowPart155:setHeight(20);
    obj.flowPart155:setName("flowPart155");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.flowPart155);
    obj.checkBox18:setField("deflexaoCaToque");
    obj.checkBox18:setText("Toque");
    obj.checkBox18:setFontSize(10);
    obj.checkBox18:setHeight(15);
    obj.checkBox18:setName("checkBox18");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout12);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flowPart156 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart156:setParent(obj.flowLayout12);
    obj.flowPart156:setMinWidth(50);
    obj.flowPart156:setMaxWidth(50);
    obj.flowPart156:setHeight(15);
    obj.flowPart156:setName("flowPart156");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart156);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(10);
    obj.label31:setText("Esquiva");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.flowPart157 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart157:setParent(obj.flowLayout12);
    obj.flowPart157:setMinWidth(50);
    obj.flowPart157:setMaxWidth(50);
    obj.flowPart157:setHeight(20);
    obj.flowPart157:setName("flowPart157");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.flowPart157);
    obj.edit96:setAlign("client");
    obj.edit96:setField("esquivaCa");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setFontSize(12);
    obj.edit96:setType("number");
    obj.edit96:setName("edit96");

    obj.flowPart158 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart158:setParent(obj.flowLayout12);
    obj.flowPart158:setMinWidth(140);
    obj.flowPart158:setMaxWidth(150);
    obj.flowPart158:setHeight(20);
    obj.flowPart158:setName("flowPart158");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.flowPart158);
    obj.edit97:setAlign("client");
    obj.edit97:setField("esquivaCa2");
    obj.edit97:setFontSize(12);
    obj.edit97:setName("edit97");

    obj.flowPart159 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart159:setParent(obj.flowLayout12);
    obj.flowPart159:setMinWidth(50);
    obj.flowPart159:setMaxWidth(60);
    obj.flowPart159:setHeight(20);
    obj.flowPart159:setName("flowPart159");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.flowPart159);
    obj.checkBox19:setField("esquivaCaSurp");
    obj.checkBox19:setText("Surpresa");
    obj.checkBox19:setFontSize(10);
    obj.checkBox19:setHeight(20);
    obj.checkBox19:setName("checkBox19");

    obj.flowPart160 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart160:setParent(obj.flowLayout12);
    obj.flowPart160:setMinWidth(50);
    obj.flowPart160:setMaxWidth(60);
    obj.flowPart160:setHeight(20);
    obj.flowPart160:setName("flowPart160");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.flowPart160);
    obj.checkBox20:setField("esquivaCaToque");
    obj.checkBox20:setText("Toque");
    obj.checkBox20:setFontSize(10);
    obj.checkBox20:setHeight(15);
    obj.checkBox20:setName("checkBox20");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout12);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart161 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart161:setParent(obj.flowLayout12);
    obj.flowPart161:setMinWidth(50);
    obj.flowPart161:setMaxWidth(50);
    obj.flowPart161:setHeight(15);
    obj.flowPart161:setName("flowPart161");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart161);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(10);
    obj.label32:setText("Sorte");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.flowPart162 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart162:setParent(obj.flowLayout12);
    obj.flowPart162:setMinWidth(50);
    obj.flowPart162:setMaxWidth(50);
    obj.flowPart162:setHeight(20);
    obj.flowPart162:setName("flowPart162");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.flowPart162);
    obj.edit98:setAlign("client");
    obj.edit98:setField("sorteCa");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setFontSize(12);
    obj.edit98:setType("number");
    obj.edit98:setName("edit98");

    obj.flowPart163 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart163:setParent(obj.flowLayout12);
    obj.flowPart163:setMinWidth(140);
    obj.flowPart163:setMaxWidth(150);
    obj.flowPart163:setHeight(20);
    obj.flowPart163:setName("flowPart163");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.flowPart163);
    obj.edit99:setAlign("client");
    obj.edit99:setField("sorteCa2");
    obj.edit99:setFontSize(12);
    obj.edit99:setName("edit99");

    obj.flowPart164 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart164:setParent(obj.flowLayout12);
    obj.flowPart164:setMinWidth(50);
    obj.flowPart164:setMaxWidth(60);
    obj.flowPart164:setHeight(20);
    obj.flowPart164:setName("flowPart164");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.flowPart164);
    obj.checkBox21:setField("sorteCaSurp");
    obj.checkBox21:setText("Surpresa");
    obj.checkBox21:setFontSize(10);
    obj.checkBox21:setHeight(20);
    obj.checkBox21:setName("checkBox21");

    obj.flowPart165 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart165:setParent(obj.flowLayout12);
    obj.flowPart165:setMinWidth(50);
    obj.flowPart165:setMaxWidth(60);
    obj.flowPart165:setHeight(20);
    obj.flowPart165:setName("flowPart165");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.flowPart165);
    obj.checkBox22:setField("sorteCaToque");
    obj.checkBox22:setText("Toque");
    obj.checkBox22:setFontSize(10);
    obj.checkBox22:setHeight(15);
    obj.checkBox22:setName("checkBox22");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout12);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.flowPart166 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart166:setParent(obj.flowLayout12);
    obj.flowPart166:setMinWidth(50);
    obj.flowPart166:setMaxWidth(50);
    obj.flowPart166:setHeight(15);
    obj.flowPart166:setName("flowPart166");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart166);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(10);
    obj.label33:setText("Outros");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.flowPart167 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart167:setParent(obj.flowLayout12);
    obj.flowPart167:setMinWidth(50);
    obj.flowPart167:setMaxWidth(50);
    obj.flowPart167:setHeight(20);
    obj.flowPart167:setName("flowPart167");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.flowPart167);
    obj.edit100:setAlign("client");
    obj.edit100:setField("outrosCa");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setFontSize(12);
    obj.edit100:setType("number");
    obj.edit100:setName("edit100");

    obj.flowPart168 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart168:setParent(obj.flowLayout12);
    obj.flowPart168:setMinWidth(140);
    obj.flowPart168:setMaxWidth(150);
    obj.flowPart168:setHeight(20);
    obj.flowPart168:setName("flowPart168");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.flowPart168);
    obj.edit101:setAlign("client");
    obj.edit101:setField("outrosCa2");
    obj.edit101:setFontSize(12);
    obj.edit101:setName("edit101");

    obj.flowPart169 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart169:setParent(obj.flowLayout12);
    obj.flowPart169:setMinWidth(50);
    obj.flowPart169:setMaxWidth(60);
    obj.flowPart169:setHeight(20);
    obj.flowPart169:setName("flowPart169");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.flowPart169);
    obj.checkBox23:setField("outrosCaSurp");
    obj.checkBox23:setText("Surpresa");
    obj.checkBox23:setFontSize(10);
    obj.checkBox23:setHeight(20);
    obj.checkBox23:setName("checkBox23");

    obj.flowPart170 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart170:setParent(obj.flowLayout12);
    obj.flowPart170:setMinWidth(50);
    obj.flowPart170:setMaxWidth(60);
    obj.flowPart170:setHeight(20);
    obj.flowPart170:setName("flowPart170");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.flowPart170);
    obj.checkBox24:setField("outrosCaToque");
    obj.checkBox24:setText("Toque");
    obj.checkBox24:setFontSize(10);
    obj.checkBox24:setHeight(15);
    obj.checkBox24:setName("checkBox24");

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout12);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart171 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart171:setParent(obj.flowLayout12);
    obj.flowPart171:setMinWidth(50);
    obj.flowPart171:setMaxWidth(50);
    obj.flowPart171:setHeight(15);
    obj.flowPart171:setName("flowPart171");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart171);
    obj.label34:setAlign("top");
    obj.label34:setFontSize(10);
    obj.label34:setText("Variados");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setWordWrap(true);
    obj.label34:setTextTrimming("none");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.flowPart172 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart172:setParent(obj.flowLayout12);
    obj.flowPart172:setMinWidth(50);
    obj.flowPart172:setMaxWidth(50);
    obj.flowPart172:setHeight(20);
    obj.flowPart172:setName("flowPart172");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.flowPart172);
    obj.edit102:setAlign("client");
    obj.edit102:setField("variadosCa");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setFontSize(12);
    obj.edit102:setType("number");
    obj.edit102:setName("edit102");

    obj.flowPart173 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart173:setParent(obj.flowLayout12);
    obj.flowPart173:setMinWidth(140);
    obj.flowPart173:setMaxWidth(150);
    obj.flowPart173:setHeight(20);
    obj.flowPart173:setName("flowPart173");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.flowPart173);
    obj.edit103:setAlign("client");
    obj.edit103:setField("variadosCa2");
    obj.edit103:setFontSize(12);
    obj.edit103:setName("edit103");

    obj.flowPart174 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart174:setParent(obj.flowLayout12);
    obj.flowPart174:setMinWidth(50);
    obj.flowPart174:setMaxWidth(60);
    obj.flowPart174:setHeight(20);
    obj.flowPart174:setName("flowPart174");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.flowPart174);
    obj.checkBox25:setField("variadosCaSurp");
    obj.checkBox25:setText("Surpresa");
    obj.checkBox25:setFontSize(10);
    obj.checkBox25:setHeight(20);
    obj.checkBox25:setName("checkBox25");

    obj.flowPart175 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart175:setParent(obj.flowLayout12);
    obj.flowPart175:setMinWidth(50);
    obj.flowPart175:setMaxWidth(60);
    obj.flowPart175:setHeight(20);
    obj.flowPart175:setName("flowPart175");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.flowPart175);
    obj.checkBox26:setField("variadosCaToque");
    obj.checkBox26:setText("Toque");
    obj.checkBox26:setFontSize(10);
    obj.checkBox26:setHeight(15);
    obj.checkBox26:setName("checkBox26");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout12);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.popGrapple = GUI.fromHandle(_obj_newObject("popup"));
    obj.popGrapple:setParent(obj.scrollBox1);
    obj.popGrapple:setName("popGrapple");
    obj.popGrapple:setWidth(225);
    obj.popGrapple:setHeight(50);
    obj.popGrapple:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popGrapple, "autoScopeNode",  "false");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.popGrapple);
    obj.flowLayout13:setAlign("top");
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMaxControlsPerLine(4);
    obj.flowLayout13:setMargins({bottom=4});
    obj.flowLayout13:setHorzAlign("center");
    obj.flowLayout13:setName("flowLayout13");

    obj.flowPart176 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart176:setParent(obj.flowLayout13);
    obj.flowPart176:setMinWidth(50);
    obj.flowPart176:setMaxWidth(50);
    obj.flowPart176:setHeight(15);
    obj.flowPart176:setName("flowPart176");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart176);
    obj.label35:setAlign("top");
    obj.label35:setFontSize(10);
    obj.label35:setText("BBA");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setWordWrap(true);
    obj.label35:setTextTrimming("none");
    obj.label35:setAutoSize(true);
    obj.label35:setName("label35");

    obj.flowPart177 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart177:setParent(obj.flowLayout13);
    obj.flowPart177:setMinWidth(50);
    obj.flowPart177:setMaxWidth(50);
    obj.flowPart177:setHeight(15);
    obj.flowPart177:setName("flowPart177");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart177);
    obj.label36:setAlign("top");
    obj.label36:setFontSize(10);
    obj.label36:setText("Força");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWordWrap(true);
    obj.label36:setTextTrimming("none");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");

    obj.flowPart178 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart178:setParent(obj.flowLayout13);
    obj.flowPart178:setMinWidth(50);
    obj.flowPart178:setMaxWidth(50);
    obj.flowPart178:setHeight(15);
    obj.flowPart178:setName("flowPart178");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart178);
    obj.label37:setAlign("top");
    obj.label37:setFontSize(10);
    obj.label37:setText("Tamanho");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setWordWrap(true);
    obj.label37:setTextTrimming("none");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.flowPart179 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart179:setParent(obj.flowLayout13);
    obj.flowPart179:setMinWidth(50);
    obj.flowPart179:setMaxWidth(50);
    obj.flowPart179:setHeight(15);
    obj.flowPart179:setName("flowPart179");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart179);
    obj.label38:setAlign("top");
    obj.label38:setFontSize(10);
    obj.label38:setText("Outros");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setWordWrap(true);
    obj.label38:setTextTrimming("none");
    obj.label38:setAutoSize(true);
    obj.label38:setName("label38");

    obj.flowPart180 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart180:setParent(obj.flowLayout13);
    obj.flowPart180:setMinWidth(50);
    obj.flowPart180:setMaxWidth(50);
    obj.flowPart180:setHeight(20);
    obj.flowPart180:setName("flowPart180");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.flowPart180);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart180);
    obj.label39:setAlign("client");
    obj.label39:setField("bba");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontSize(12);
    obj.label39:setName("label39");

    obj.flowPart181 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart181:setParent(obj.flowLayout13);
    obj.flowPart181:setMinWidth(50);
    obj.flowPart181:setMaxWidth(50);
    obj.flowPart181:setHeight(20);
    obj.flowPart181:setName("flowPart181");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.flowPart181);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart181);
    obj.label40:setAlign("client");
    obj.label40:setField("efetModFor");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontSize(12);
    obj.label40:setName("label40");

    obj.flowPart182 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart182:setParent(obj.flowLayout13);
    obj.flowPart182:setMinWidth(50);
    obj.flowPart182:setMaxWidth(50);
    obj.flowPart182:setHeight(20);
    obj.flowPart182:setName("flowPart182");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.flowPart182);
    obj.edit104:setAlign("client");
    obj.edit104:setField("agarrarTam");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setFontSize(12);
    obj.edit104:setType("number");
    obj.edit104:setName("edit104");

    obj.flowPart183 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart183:setParent(obj.flowLayout13);
    obj.flowPart183:setMinWidth(50);
    obj.flowPart183:setMaxWidth(50);
    obj.flowPart183:setHeight(20);
    obj.flowPart183:setName("flowPart183");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.flowPart183);
    obj.edit105:setAlign("client");
    obj.edit105:setField("agarrarVar");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setFontSize(12);
    obj.edit105:setType("number");
    obj.edit105:setName("edit105");


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

			local function getNumber(text)
				local mod = "0";
				if text~= nil then
					mod = string.gsub(text, "%.", "");
					mod = string.gsub(mod, "k", "000");
					mod = string.gsub(mod, "K", "");
					mod = string.gsub(mod, "g", "");
					mod = string.gsub(mod, "P", "");
					mod = string.gsub(mod, "p", "");
					mod = string.gsub(mod, "O", "");
					mod = string.gsub(mod, "o", "");
					mod = string.gsub(mod, "X", "");
					mod = string.gsub(mod, "x", "");
					mod = string.gsub(mod, " ", "");
					mod = string.gsub(mod, ",", ".");
				end
				return tonumber(mod);
			end;
			


    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox1);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(1107);
    obj.rectangle12:setHeight(85);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle12);
    obj.label41:setLeft(5);
    obj.label41:setTop(5);
    obj.label41:setWidth(50);
    obj.label41:setHeight(25);
    obj.label41:setText("ESTILO");
    obj.label41:setName("label41");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.rectangle12);
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(60);
    obj.edit106:setTop(5);
    obj.edit106:setWidth(380);
    obj.edit106:setHeight(25);
    obj.edit106:setField("estilo");
    obj.edit106:setName("edit106");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle12);
    obj.label42:setLeft(5);
    obj.label42:setTop(30);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setText("ETNIA");
    obj.label42:setName("label42");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.rectangle12);
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(60);
    obj.edit107:setTop(30);
    obj.edit107:setWidth(380);
    obj.edit107:setHeight(25);
    obj.edit107:setField("etnia");
    obj.edit107:setName("edit107");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle12);
    obj.label43:setLeft(5);
    obj.label43:setTop(55);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setText("DOBRA");
    obj.label43:setName("label43");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.rectangle12);
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(60);
    obj.edit108:setTop(55);
    obj.edit108:setWidth(380);
    obj.edit108:setHeight(25);
    obj.edit108:setField("dobra");
    obj.edit108:setName("edit108");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle12);
    obj.label44:setLeft(445);
    obj.label44:setTop(5);
    obj.label44:setWidth(50);
    obj.label44:setHeight(25);
    obj.label44:setText("NOME");
    obj.label44:setName("label44");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.rectangle12);
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setLeft(520);
    obj.edit109:setTop(5);
    obj.edit109:setWidth(290);
    obj.edit109:setHeight(25);
    obj.edit109:setField("nome");
    obj.edit109:setName("edit109");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle12);
    obj.label45:setLeft(445);
    obj.label45:setTop(30);
    obj.label45:setWidth(70);
    obj.label45:setHeight(25);
    obj.label45:setText("TENDÊNCIA");
    obj.label45:setName("label45");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.rectangle12);
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setLeft(520);
    obj.edit110:setTop(30);
    obj.edit110:setWidth(290);
    obj.edit110:setHeight(25);
    obj.edit110:setField("tendencia");
    obj.edit110:setName("edit110");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle12);
    obj.label46:setLeft(445);
    obj.label46:setTop(55);
    obj.label46:setWidth(70);
    obj.label46:setHeight(25);
    obj.label46:setText("TITULO");
    obj.label46:setName("label46");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.rectangle12);
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setLeft(520);
    obj.edit111:setTop(55);
    obj.edit111:setWidth(290);
    obj.edit111:setHeight(25);
    obj.edit111:setField("posto");
    obj.edit111:setName("edit111");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle12);
    obj.label47:setLeft(815);
    obj.label47:setTop(5);
    obj.label47:setWidth(70);
    obj.label47:setHeight(25);
    obj.label47:setText("NEP");
    obj.label47:setName("label47");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.rectangle12);
    obj.rectangle13:setLeft(890);
    obj.rectangle13:setTop(5);
    obj.rectangle13:setWidth(70);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle12);
    obj.label48:setField("nep");
    obj.label48:setLeft(890);
    obj.label48:setTop(5);
    obj.label48:setWidth(70);
    obj.label48:setHeight(25);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle12);
    obj.label49:setLeft(975);
    obj.label49:setTop(5);
    obj.label49:setWidth(60);
    obj.label49:setHeight(25);
    obj.label49:setText("PT");
    obj.label49:setName("label49");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle12);
    obj.rectangle14:setLeft(995);
    obj.rectangle14:setTop(5);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle12);
    obj.label50:setField("pt_gasto");
    obj.label50:setLeft(995);
    obj.label50:setTop(5);
    obj.label50:setWidth(50);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle12);
    obj.rectangle15:setLeft(1045);
    obj.rectangle15:setTop(5);
    obj.rectangle15:setWidth(55);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle12);
    obj.label51:setField("pt_total");
    obj.label51:setLeft(1045);
    obj.label51:setTop(5);
    obj.label51:setWidth(55);
    obj.label51:setHeight(25);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle12);
    obj.label52:setLeft(815);
    obj.label52:setTop(30);
    obj.label52:setWidth(70);
    obj.label52:setHeight(25);
    obj.label52:setText("XP");
    obj.label52:setName("label52");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.rectangle12);
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setLeft(890);
    obj.edit112:setTop(30);
    obj.edit112:setWidth(105);
    obj.edit112:setHeight(25);
    obj.edit112:setField("xpAtual");
    obj.edit112:setName("edit112");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle12);
    obj.rectangle16:setLeft(995);
    obj.rectangle16:setTop(30);
    obj.rectangle16:setWidth(105);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle12);
    obj.label53:setField("xpNivel");
    obj.label53:setLeft(995);
    obj.label53:setTop(30);
    obj.label53:setWidth(105);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle12);
    obj.button1:setLeft(815);
    obj.button1:setTop(56);
    obj.button1:setWidth(50);
    obj.button1:setText("ADD");
    obj.button1:setName("button1");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.rectangle12);
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setLeft(890);
    obj.edit113:setTop(55);
    obj.edit113:setWidth(210);
    obj.edit113:setHeight(25);
    obj.edit113:setField("xpNova");
    obj.edit113:setName("edit113");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle12);
    obj.dataLink16:setField("xpAtual");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle12);
    obj.dataLink17:setField("nep");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.rectangle12);
    obj.dataLink18:setFields({'pt_talento', 'pt_outro', 'pt_classe', 'pt_dobra', 'pt_tecnica', 'pt_tecnica_avancada'});
    obj.dataLink18:setName("dataLink18");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.scrollBox1);
    obj.rectangle17:setLeft(0);
    obj.rectangle17:setTop(90);
    obj.rectangle17:setWidth(235);
    obj.rectangle17:setHeight(215);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle17);
    obj.label54:setLeft(0);
    obj.label54:setTop(0);
    obj.label54:setWidth(235);
    obj.label54:setHeight(25);
    obj.label54:setText("ATRIBUTOS");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle17);
    obj.label55:setLeft(45);
    obj.label55:setTop(30);
    obj.label55:setWidth(70);
    obj.label55:setHeight(25);
    obj.label55:setText("Real");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle17);
    obj.label56:setLeft(120);
    obj.label56:setTop(30);
    obj.label56:setWidth(70);
    obj.label56:setHeight(25);
    obj.label56:setText("Efetivo");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle17);
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

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout1);
    obj.rectangle18:setLeft(45);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(35);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout1);
    obj.label57:setLeft(45);
    obj.label57:setWidth(35);
    obj.label57:setHeight(25);
    obj.label57:setField("realFor");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout1);
    obj.rectangle19:setLeft(80);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(35);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout1);
    obj.label58:setField("realModFor");
    obj.label58:setText("0");
    obj.label58:setLeft(80);
    obj.label58:setTop(3);
    obj.label58:setWidth(35);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout1);
    obj.dataLink19:setField("realFor");
    obj.dataLink19:setName("dataLink19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout1);
    obj.rectangle20:setLeft(120);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(35);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout1);
    obj.label59:setLeft(120);
    obj.label59:setWidth(35);
    obj.label59:setHeight(25);
    obj.label59:setField("efetFor");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout1);
    obj.rectangle21:setLeft(155);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(35);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout1);
    obj.label60:setField("efetModFor");
    obj.label60:setText("0");
    obj.label60:setLeft(155);
    obj.label60:setTop(3);
    obj.label60:setWidth(35);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout1);
    obj.dataLink20:setField("efetFor");
    obj.dataLink20:setName("dataLink20");


				local function getFOR()
					local mod = tonumber(sheet.efetModFor) or 0;
					return mod;
				end;
			


    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle17);
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

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout2);
    obj.rectangle22:setLeft(45);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(35);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout2);
    obj.label61:setLeft(45);
    obj.label61:setWidth(35);
    obj.label61:setHeight(25);
    obj.label61:setField("realDes");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout2);
    obj.rectangle23:setLeft(80);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(35);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout2);
    obj.label62:setField("realModDes");
    obj.label62:setText("0");
    obj.label62:setLeft(80);
    obj.label62:setTop(3);
    obj.label62:setWidth(35);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout2);
    obj.dataLink21:setField("realDes");
    obj.dataLink21:setName("dataLink21");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout2);
    obj.rectangle24:setLeft(120);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(35);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout2);
    obj.label63:setLeft(120);
    obj.label63:setWidth(35);
    obj.label63:setHeight(25);
    obj.label63:setField("efetDes");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout2);
    obj.rectangle25:setLeft(155);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(35);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout2);
    obj.label64:setField("efetModDes");
    obj.label64:setText("0");
    obj.label64:setLeft(155);
    obj.label64:setTop(3);
    obj.label64:setWidth(35);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout2);
    obj.dataLink22:setField("efetDes");
    obj.dataLink22:setName("dataLink22");


				local function getDES()
					local mod = tonumber(sheet.efetModDes) or 0;
					return mod;
				end;
			


    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle17);
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

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout3);
    obj.rectangle26:setLeft(45);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(35);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout3);
    obj.label65:setLeft(45);
    obj.label65:setWidth(35);
    obj.label65:setHeight(25);
    obj.label65:setField("realCon");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout3);
    obj.rectangle27:setLeft(80);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(35);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout3);
    obj.label66:setField("realModCon");
    obj.label66:setText("0");
    obj.label66:setLeft(80);
    obj.label66:setTop(3);
    obj.label66:setWidth(35);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout3);
    obj.dataLink23:setField("realCon");
    obj.dataLink23:setName("dataLink23");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout3);
    obj.rectangle28:setLeft(120);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(35);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout3);
    obj.label67:setLeft(120);
    obj.label67:setWidth(35);
    obj.label67:setHeight(25);
    obj.label67:setField("efetCon");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout3);
    obj.rectangle29:setLeft(155);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(35);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout3);
    obj.label68:setField("efetModCon");
    obj.label68:setText("0");
    obj.label68:setLeft(155);
    obj.label68:setTop(3);
    obj.label68:setWidth(35);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout3);
    obj.dataLink24:setField("efetCon");
    obj.dataLink24:setName("dataLink24");


				local function getCON()
					local mod = tonumber(sheet.efetModCon) or 0;
					return mod;
				end;
			


    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle17);
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

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout4);
    obj.rectangle30:setLeft(45);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(35);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout4);
    obj.label69:setLeft(45);
    obj.label69:setWidth(35);
    obj.label69:setHeight(25);
    obj.label69:setField("realInt");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout4);
    obj.rectangle31:setLeft(80);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(35);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout4);
    obj.label70:setField("realModInt");
    obj.label70:setText("0");
    obj.label70:setLeft(80);
    obj.label70:setTop(3);
    obj.label70:setWidth(35);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout4);
    obj.dataLink25:setField("realInt");
    obj.dataLink25:setName("dataLink25");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout4);
    obj.rectangle32:setLeft(120);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(35);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout4);
    obj.label71:setLeft(120);
    obj.label71:setWidth(35);
    obj.label71:setHeight(25);
    obj.label71:setField("efetInt");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout4);
    obj.rectangle33:setLeft(155);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(35);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout4);
    obj.label72:setField("efetModInt");
    obj.label72:setText("0");
    obj.label72:setLeft(155);
    obj.label72:setTop(3);
    obj.label72:setWidth(35);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout4);
    obj.dataLink26:setField("efetInt");
    obj.dataLink26:setName("dataLink26");


				local function getINT()
					local mod = tonumber(sheet.efetModInt) or 0;
					return mod;
				end;
			


    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle17);
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

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout5);
    obj.rectangle34:setLeft(45);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(35);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout5);
    obj.label73:setLeft(45);
    obj.label73:setWidth(35);
    obj.label73:setHeight(25);
    obj.label73:setField("realSab");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout5);
    obj.rectangle35:setLeft(80);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(35);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout5);
    obj.label74:setField("realModSab");
    obj.label74:setText("0");
    obj.label74:setLeft(80);
    obj.label74:setTop(3);
    obj.label74:setWidth(35);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout5);
    obj.dataLink27:setField("realSab");
    obj.dataLink27:setName("dataLink27");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout5);
    obj.rectangle36:setLeft(120);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(35);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout5);
    obj.label75:setLeft(120);
    obj.label75:setWidth(35);
    obj.label75:setHeight(25);
    obj.label75:setField("efetSab");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout5);
    obj.rectangle37:setLeft(155);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(35);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout5);
    obj.label76:setField("efetModSab");
    obj.label76:setText("0");
    obj.label76:setLeft(155);
    obj.label76:setTop(3);
    obj.label76:setWidth(35);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout5);
    obj.dataLink28:setField("efetSab");
    obj.dataLink28:setName("dataLink28");


				local function getSAB()
					local mod = tonumber(sheet.efetModSab) or 0;
					return mod;
				end;
			


    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle17);
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

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout6);
    obj.rectangle38:setLeft(45);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(35);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout6);
    obj.label77:setLeft(45);
    obj.label77:setWidth(35);
    obj.label77:setHeight(25);
    obj.label77:setField("realCar");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout6);
    obj.rectangle39:setLeft(80);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(35);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout6);
    obj.label78:setField("realModCar");
    obj.label78:setText("0");
    obj.label78:setLeft(80);
    obj.label78:setTop(3);
    obj.label78:setWidth(35);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout6);
    obj.dataLink29:setField("realCar");
    obj.dataLink29:setName("dataLink29");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout6);
    obj.rectangle40:setLeft(120);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(35);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout6);
    obj.label79:setLeft(120);
    obj.label79:setWidth(35);
    obj.label79:setHeight(25);
    obj.label79:setField("efetCar");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout6);
    obj.rectangle41:setLeft(155);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(35);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout6);
    obj.label80:setField("efetModCar");
    obj.label80:setText("0");
    obj.label80:setLeft(155);
    obj.label80:setTop(3);
    obj.label80:setWidth(35);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout6);
    obj.dataLink30:setField("efetCar");
    obj.dataLink30:setName("dataLink30");


				local function getCAR()
					local mod = tonumber(sheet.efetModCar) or 0;
					return mod;
				end;
			


    obj.AtrBut = GUI.fromHandle(_obj_newObject("button"));
    obj.AtrBut:setParent(obj.rectangle17);
    obj.AtrBut:setLeft(200);
    obj.AtrBut:setTop(55);
    obj.AtrBut:setWidth(30);
    obj.AtrBut:setHeight(150);
    obj.AtrBut:setName("AtrBut");
    obj.AtrBut:setText(">>");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(240);
    obj.layout7:setTop(90);
    obj.layout7:setWidth(235);
    obj.layout7:setHeight(215);
    obj.layout7:setName("layout7");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout7);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout7);
    obj.label81:setLeft(5);
    obj.label81:setTop(1);
    obj.label81:setWidth(225);
    obj.label81:setHeight(20);
    obj.label81:setText("DESLOCAMENTOS");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout7);
    obj.label82:setLeft(75);
    obj.label82:setTop(30);
    obj.label82:setWidth(70);
    obj.label82:setHeight(25);
    obj.label82:setText("Metros");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout7);
    obj.label83:setLeft(155);
    obj.label83:setTop(30);
    obj.label83:setWidth(70);
    obj.label83:setHeight(25);
    obj.label83:setText("Quadrados");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(55);
    obj.layout8:setWidth(225);
    obj.layout8:setHeight(20);
    obj.layout8:setName("layout8");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout8);
    obj.label84:setLeft(5);
    obj.label84:setTop(0);
    obj.label84:setWidth(70);
    obj.label84:setHeight(20);
    obj.label84:setText("TERRESTRE");
    obj.label84:setName("label84");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout8);
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setLeft(75);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(70);
    obj.edit114:setHeight(20);
    obj.edit114:setField("deslTerrestre");
    obj.edit114:setName("edit114");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout8);
    obj.rectangle43:setLeft(155);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(60);
    obj.rectangle43:setHeight(20);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout8);
    obj.label85:setLeft(155);
    obj.label85:setTop(0);
    obj.label85:setWidth(60);
    obj.label85:setHeight(20);
    obj.label85:setField("deslTerrestreQuadrados");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout8);
    obj.dataLink31:setField("deslTerrestre");
    obj.dataLink31:setName("dataLink31");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(80);
    obj.layout9:setWidth(225);
    obj.layout9:setHeight(20);
    obj.layout9:setName("layout9");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout9);
    obj.label86:setLeft(5);
    obj.label86:setTop(0);
    obj.label86:setWidth(70);
    obj.label86:setHeight(20);
    obj.label86:setText("VOO");
    obj.label86:setName("label86");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout9);
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setLeft(75);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(70);
    obj.edit115:setHeight(20);
    obj.edit115:setField("deslVoo");
    obj.edit115:setName("edit115");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout9);
    obj.rectangle44:setLeft(155);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(60);
    obj.rectangle44:setHeight(20);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout9);
    obj.label87:setLeft(155);
    obj.label87:setTop(0);
    obj.label87:setWidth(60);
    obj.label87:setHeight(20);
    obj.label87:setField("deslVooQuadrados");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout9);
    obj.dataLink32:setField("deslVoo");
    obj.dataLink32:setName("dataLink32");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout7);
    obj.label88:setLeft(50);
    obj.label88:setTop(105);
    obj.label88:setWidth(60);
    obj.label88:setHeight(20);
    obj.label88:setText("Manobra");
    obj.label88:setFontSize(11);
    obj.label88:setName("label88");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout7);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(105);
    obj.comboBox4:setWidth(100);
    obj.comboBox4:setField("qualidadeVoo");
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setItems({' ', 'Desajeitado', 'Ruim', 'Média', 'Boa', 'Perfeita'});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(130);
    obj.layout10:setWidth(225);
    obj.layout10:setHeight(20);
    obj.layout10:setName("layout10");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout10);
    obj.label89:setLeft(5);
    obj.label89:setTop(0);
    obj.label89:setWidth(70);
    obj.label89:setHeight(20);
    obj.label89:setText("NATAÇÃO");
    obj.label89:setName("label89");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout10);
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setLeft(75);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(70);
    obj.edit116:setHeight(20);
    obj.edit116:setField("deslNatacao");
    obj.edit116:setName("edit116");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout10);
    obj.rectangle45:setLeft(155);
    obj.rectangle45:setTop(0);
    obj.rectangle45:setWidth(60);
    obj.rectangle45:setHeight(20);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout10);
    obj.label90:setLeft(155);
    obj.label90:setTop(0);
    obj.label90:setWidth(60);
    obj.label90:setHeight(20);
    obj.label90:setField("deslNatacaoQuadrados");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout10);
    obj.dataLink33:setField("deslNatacao");
    obj.dataLink33:setName("dataLink33");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout7);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(155);
    obj.layout11:setWidth(225);
    obj.layout11:setHeight(20);
    obj.layout11:setName("layout11");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout11);
    obj.label91:setLeft(5);
    obj.label91:setTop(0);
    obj.label91:setWidth(70);
    obj.label91:setHeight(20);
    obj.label91:setText("ESCALAR");
    obj.label91:setName("label91");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout11);
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(75);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(70);
    obj.edit117:setHeight(20);
    obj.edit117:setField("deslEscalar");
    obj.edit117:setName("edit117");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout11);
    obj.rectangle46:setLeft(155);
    obj.rectangle46:setTop(0);
    obj.rectangle46:setWidth(60);
    obj.rectangle46:setHeight(20);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout11);
    obj.label92:setLeft(155);
    obj.label92:setTop(0);
    obj.label92:setWidth(60);
    obj.label92:setHeight(20);
    obj.label92:setField("deslEscalarQuadrados");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout11);
    obj.dataLink34:setField("deslEscalar");
    obj.dataLink34:setName("dataLink34");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout7);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(180);
    obj.layout12:setWidth(225);
    obj.layout12:setHeight(20);
    obj.layout12:setName("layout12");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout12);
    obj.label93:setLeft(5);
    obj.label93:setTop(0);
    obj.label93:setWidth(70);
    obj.label93:setHeight(20);
    obj.label93:setText("ESCAVAR");
    obj.label93:setName("label93");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout12);
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(75);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(70);
    obj.edit118:setHeight(20);
    obj.edit118:setField("deslEscavar");
    obj.edit118:setName("edit118");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout12);
    obj.rectangle47:setLeft(155);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(60);
    obj.rectangle47:setHeight(20);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout12);
    obj.label94:setLeft(155);
    obj.label94:setTop(0);
    obj.label94:setWidth(60);
    obj.label94:setHeight(20);
    obj.label94:setField("deslEscavarQuadrados");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout12);
    obj.dataLink35:setField("deslEscavar");
    obj.dataLink35:setName("dataLink35");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13:setLeft(480);
    obj.layout13:setTop(90);
    obj.layout13:setWidth(260);
    obj.layout13:setHeight(55);
    obj.layout13:setName("layout13");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout13);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setName("rectangle48");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout13);
    obj.label95:setLeft(0);
    obj.label95:setTop(1);
    obj.label95:setWidth(260);
    obj.label95:setHeight(20);
    obj.label95:setText("INICIATIVA");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout13);
    obj.button8:setLeft(35);
    obj.button8:setTop(25);
    obj.button8:setWidth(75);
    obj.button8:setHeight(25);
    obj.button8:setText("INICIATIVA");
    obj.button8:setFontSize(11);
    obj.button8:setName("button8");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout13);
    obj.rectangle49:setLeft(115);
    obj.rectangle49:setTop(25);
    obj.rectangle49:setWidth(35);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout13);
    obj.label96:setField("iniciativa");
    obj.label96:setLeft(115);
    obj.label96:setTop(27);
    obj.label96:setWidth(35);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout13);
    obj.rectangle50:setLeft(165);
    obj.rectangle50:setTop(25);
    obj.rectangle50:setWidth(35);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout13);
    obj.label97:setField("efetModDes");
    obj.label97:setLeft(165);
    obj.label97:setTop(27);
    obj.label97:setWidth(35);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout13);
    obj.edit119:setType("number");
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setLeft(205);
    obj.edit119:setTop(25);
    obj.edit119:setWidth(35);
    obj.edit119:setHeight(25);
    obj.edit119:setField("iniVariado");
    obj.edit119:setName("edit119");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout13);
    obj.dataLink36:setFields({'efetModDes', 'iniVariado'});
    obj.dataLink36:setName("dataLink36");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.scrollBox1);
    obj.rectangle51:setLeft(480);
    obj.rectangle51:setTop(150);
    obj.rectangle51:setWidth(260);
    obj.rectangle51:setHeight(155);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setName("rectangle51");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle51);
    obj.label98:setLeft(0);
    obj.label98:setTop(1);
    obj.label98:setWidth(260);
    obj.label98:setHeight(20);
    obj.label98:setText("CLASSE DE ARMADURA");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle51);
    obj.layout14:setLeft(40);
    obj.layout14:setTop(25);
    obj.layout14:setWidth(220);
    obj.layout14:setHeight(50);
    obj.layout14:setName("layout14");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout14);
    obj.label99:setLeft(10);
    obj.label99:setTop(0);
    obj.label99:setWidth(35);
    obj.label99:setHeight(20);
    obj.label99:setText("CA");
    obj.label99:setName("label99");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout14);
    obj.rectangle52:setLeft(5);
    obj.rectangle52:setTop(25);
    obj.rectangle52:setWidth(35);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout14);
    obj.label100:setLeft(5);
    obj.label100:setTop(27);
    obj.label100:setWidth(35);
    obj.label100:setField("ca");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout14);
    obj.label101:setLeft(45);
    obj.label101:setTop(0);
    obj.label101:setWidth(40);
    obj.label101:setHeight(20);
    obj.label101:setText("SURP.");
    obj.label101:setName("label101");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout14);
    obj.rectangle53:setLeft(45);
    obj.rectangle53:setTop(25);
    obj.rectangle53:setWidth(35);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout14);
    obj.label102:setLeft(45);
    obj.label102:setTop(27);
    obj.label102:setWidth(35);
    obj.label102:setField("surpresa");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout14);
    obj.label103:setLeft(85);
    obj.label103:setTop(0);
    obj.label103:setWidth(45);
    obj.label103:setHeight(20);
    obj.label103:setText("TOQUE");
    obj.label103:setName("label103");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout14);
    obj.rectangle54:setLeft(90);
    obj.rectangle54:setTop(25);
    obj.rectangle54:setWidth(35);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout14);
    obj.label104:setLeft(90);
    obj.label104:setTop(27);
    obj.label104:setWidth(35);
    obj.label104:setField("toque");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout14);
    obj.label105:setLeft(135);
    obj.label105:setTop(0);
    obj.label105:setWidth(35);
    obj.label105:setHeight(20);
    obj.label105:setText("PEN");
    obj.label105:setName("label105");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout14);
    obj.rectangle55:setLeft(135);
    obj.rectangle55:setTop(25);
    obj.rectangle55:setWidth(35);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout14);
    obj.label106:setLeft(135);
    obj.label106:setTop(27);
    obj.label106:setWidth(35);
    obj.label106:setField("penalidade");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.caDetails = GUI.fromHandle(_obj_newObject("button"));
    obj.caDetails:setParent(obj.rectangle51);
    obj.caDetails:setLeft(30);
    obj.caDetails:setTop(80);
    obj.caDetails:setWidth(200);
    obj.caDetails:setHeight(20);
    obj.caDetails:setFontSize(10);
    obj.caDetails:setText("+");
    obj.caDetails:setName("caDetails");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.rectangle51);
    obj.dataLink37:setFields({'equipamentoCorpoCA', 'escudoCa', 'efetModDes', 'tamanhoCa', 'naturalCa', 'deflexaoCa', 'esquivaCa', 'sorteCa', 'outrosCa', 'variadosCa', 'armaduraCaSurp', 'escudoCaSurp', 'destrezaCaSurp', 'tamanhoCaSurp', 'naturalCaSurp', 'deflexaoCaSurp', 'esquivaCaSurp', 'sorteCaSurp', 'outrosCaSurp', 'variadosCaSurp', 'armaduraCaToque', 'escudoCaToque', 'destrezaCaToque', 'tamanhoCaToque', 'naturalCaToque', 'deflexaoCaToque', 'esquivaCaToque', 'sorteCaToque', 'outrosCaToque', 'variadosCaToque'});
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.rectangle51);
    obj.dataLink38:setFields({'armaduraCaSurp', 'escudoCaSurp', 'tamanhoCaSurp', 'naturalCaSurp', 'deflexaoCaSurp', 'destrezaCaToque', 'tamanhoCaToque', 'deflexaoCaToque', 'esquivaCaToque'});
    obj.dataLink38:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.rectangle51);
    obj.dataLink39:setFields({'equipamentoCorpoPen', 'escudoPen'});
    obj.dataLink39:setName("dataLink39");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle51);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(105);
    obj.layout15:setWidth(260);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout15);
    obj.label107:setLeft(30);
    obj.label107:setTop(0);
    obj.label107:setWidth(30);
    obj.label107:setHeight(20);
    obj.label107:setText("RM");
    obj.label107:setName("label107");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout15);
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(60);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(170);
    obj.edit120:setHeight(25);
    obj.edit120:setField("rm");
    obj.edit120:setName("edit120");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.scrollBox1);
    obj.rectangle56:setLeft(0);
    obj.rectangle56:setTop(310);
    obj.rectangle56:setWidth(220);
    obj.rectangle56:setHeight(165);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setName("rectangle56");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.rectangle56);
    obj.label108:setLeft(5);
    obj.label108:setTop(1);
    obj.label108:setWidth(220);
    obj.label108:setHeight(20);
    obj.label108:setText("PONTOS DE VIGOR");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.rectangle56);
    obj.label109:setLeft(35);
    obj.label109:setTop(25);
    obj.label109:setWidth(100);
    obj.label109:setHeight(20);
    obj.label109:setText("VIGOR");
    obj.label109:setName("label109");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.rectangle56);
    obj.edit121:setType("number");
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setLeft(5);
    obj.edit121:setTop(45);
    obj.edit121:setWidth(105);
    obj.edit121:setHeight(25);
    obj.edit121:setField("pvTotal");
    obj.edit121:setName("edit121");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.rectangle56);
    obj.label110:setLeft(115);
    obj.label110:setTop(25);
    obj.label110:setWidth(100);
    obj.label110:setHeight(20);
    obj.label110:setText("TEMPORARIO");
    obj.label110:setName("label110");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.rectangle56);
    obj.edit122:setType("number");
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setLeft(110);
    obj.edit122:setTop(45);
    obj.edit122:setWidth(105);
    obj.edit122:setHeight(25);
    obj.edit122:setField("pvTemporario");
    obj.edit122:setName("edit122");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle56);
    obj.button9:setLeft(5);
    obj.button9:setTop(70);
    obj.button9:setWidth(40);
    obj.button9:setHeight(25);
    obj.button9:setText("DVs");
    obj.button9:setName("button9");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.rectangle56);
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(45);
    obj.edit123:setTop(70);
    obj.edit123:setWidth(170);
    obj.edit123:setHeight(25);
    obj.edit123:setField("dvs");
    obj.edit123:setName("edit123");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle56);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(95);
    obj.textEditor2:setWidth(210);
    obj.textEditor2:setHeight(65);
    obj.textEditor2:setField("rd");
    obj.textEditor2:setName("textEditor2");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox1);
    obj.layout16:setLeft(225);
    obj.layout16:setTop(310);
    obj.layout16:setWidth(322);
    obj.layout16:setHeight(165);
    obj.layout16:setName("layout16");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout16);
    obj.rectangle57:setAlign("client");
    obj.rectangle57:setColor("black");
    obj.rectangle57:setName("rectangle57");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout16);
    obj.label111:setLeft(5);
    obj.label111:setTop(0);
    obj.label111:setWidth(321);
    obj.label111:setHeight(20);
    obj.label111:setText("BÔNUS TEMPORARIOS");
    obj.label111:setName("label111");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout16);
    obj.button10:setLeft(165);
    obj.button10:setTop(5);
    obj.button10:setWidth(85);
    obj.button10:setHeight(20);
    obj.button10:setText("CA oculta");
    obj.button10:setName("button10");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout16);
    obj.label112:setLeft(180);
    obj.label112:setTop(115);
    obj.label112:setWidth(165);
    obj.label112:setHeight(20);
    obj.label112:setText("Apenas o Mestre.");
    obj.label112:setRotationAngle(90);
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout16);
    obj.label113:setLeft(165);
    obj.label113:setTop(30);
    obj.label113:setWidth(50);
    obj.label113:setHeight(25);
    obj.label113:setText("Alvo 1");
    obj.label113:setName("label113");

    obj.alvo1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.alvo1:setParent(obj.layout16);
    obj.alvo1:setLeft(205);
    obj.alvo1:setTop(30);
    obj.alvo1:setWidth(40);
    obj.alvo1:setHeight(25);
    obj.alvo1:setField("alvo1");
    obj.alvo1:setName("alvo1");
    obj.alvo1:setVisible(false);
    obj.alvo1:setType("number");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout16);
    obj.label114:setLeft(165);
    obj.label114:setTop(55);
    obj.label114:setWidth(50);
    obj.label114:setHeight(25);
    obj.label114:setText("Alvo 2");
    obj.label114:setName("label114");

    obj.alvo2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.alvo2:setParent(obj.layout16);
    obj.alvo2:setLeft(205);
    obj.alvo2:setTop(55);
    obj.alvo2:setWidth(40);
    obj.alvo2:setHeight(25);
    obj.alvo2:setField("alvo2");
    obj.alvo2:setName("alvo2");
    obj.alvo2:setVisible(false);
    obj.alvo2:setType("number");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout16);
    obj.label115:setLeft(165);
    obj.label115:setTop(80);
    obj.label115:setWidth(50);
    obj.label115:setHeight(25);
    obj.label115:setText("Alvo 3");
    obj.label115:setName("label115");

    obj.alvo3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.alvo3:setParent(obj.layout16);
    obj.alvo3:setLeft(205);
    obj.alvo3:setTop(80);
    obj.alvo3:setWidth(40);
    obj.alvo3:setHeight(25);
    obj.alvo3:setField("alvo3");
    obj.alvo3:setName("alvo3");
    obj.alvo3:setVisible(false);
    obj.alvo3:setType("number");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout16);
    obj.label116:setLeft(165);
    obj.label116:setTop(105);
    obj.label116:setWidth(50);
    obj.label116:setHeight(25);
    obj.label116:setText("Alvo 4");
    obj.label116:setName("label116");

    obj.alvo4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.alvo4:setParent(obj.layout16);
    obj.alvo4:setLeft(205);
    obj.alvo4:setTop(105);
    obj.alvo4:setWidth(40);
    obj.alvo4:setHeight(25);
    obj.alvo4:setField("alvo4");
    obj.alvo4:setName("alvo4");
    obj.alvo4:setVisible(false);
    obj.alvo4:setType("number");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout16);
    obj.label117:setLeft(165);
    obj.label117:setTop(130);
    obj.label117:setWidth(50);
    obj.label117:setHeight(25);
    obj.label117:setText("Alvo 5");
    obj.label117:setName("label117");

    obj.alvo5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.alvo5:setParent(obj.layout16);
    obj.alvo5:setLeft(205);
    obj.alvo5:setTop(130);
    obj.alvo5:setWidth(40);
    obj.alvo5:setHeight(25);
    obj.alvo5:setField("alvo5");
    obj.alvo5:setName("alvo5");
    obj.alvo5:setVisible(false);
    obj.alvo5:setType("number");


				local function caSecreta()
					if sheet~= nil then
						local jogadores = Firecast.getMesaDe(sheet).jogadores;
						local current = nil;
						
						for i = 1, #jogadores, 1 do
							if jogadores[i].login==Firecast.getCurrentUser().login then
								current = jogadores[i];
							end;
						end; 
						
						
						if current~=nil and current.isMestre then
							self.alvo1.visible = true;
							self.alvo2.visible = true;
							self.alvo3.visible = true;
							self.alvo4.visible = true;
							self.alvo5.visible = true;
						else
							self.alvo1.visible = false;
							self.alvo2.visible = false;
							self.alvo3.visible = false;
							self.alvo4.visible = false;
							self.alvo5.visible = false;
						end;
					end;
				end;
			


    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout16);
    obj.label118:setLeft(5);
    obj.label118:setTop(30);
    obj.label118:setWidth(50);
    obj.label118:setHeight(20);
    obj.label118:setText("ATAQUE");
    obj.label118:setName("label118");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout16);
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(60);
    obj.edit124:setTop(30);
    obj.edit124:setWidth(70);
    obj.edit124:setHeight(25);
    obj.edit124:setField("buffAtaque");
    obj.edit124:setName("edit124");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout16);
    obj.label119:setLeft(5);
    obj.label119:setTop(55);
    obj.label119:setWidth(50);
    obj.label119:setHeight(20);
    obj.label119:setText("DANO");
    obj.label119:setName("label119");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout16);
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(60);
    obj.edit125:setTop(55);
    obj.edit125:setWidth(70);
    obj.edit125:setHeight(25);
    obj.edit125:setField("buffDano");
    obj.edit125:setName("edit125");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout16);
    obj.label120:setLeft(5);
    obj.label120:setTop(80);
    obj.label120:setWidth(50);
    obj.label120:setHeight(20);
    obj.label120:setText("CRITICO");
    obj.label120:setName("label120");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout16);
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(60);
    obj.edit126:setTop(80);
    obj.edit126:setWidth(70);
    obj.edit126:setHeight(25);
    obj.edit126:setField("buffDanoCritico");
    obj.edit126:setName("edit126");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout16);
    obj.label121:setLeft(5);
    obj.label121:setTop(105);
    obj.label121:setWidth(50);
    obj.label121:setHeight(20);
    obj.label121:setText("TR");
    obj.label121:setName("label121");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout16);
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(60);
    obj.edit127:setTop(105);
    obj.edit127:setWidth(70);
    obj.edit127:setHeight(25);
    obj.edit127:setField("buffTR");
    obj.edit127:setName("edit127");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout16);
    obj.label122:setLeft(5);
    obj.label122:setTop(130);
    obj.label122:setWidth(50);
    obj.label122:setHeight(20);
    obj.label122:setText("PERICIA");
    obj.label122:setName("label122");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout16);
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(60);
    obj.edit128:setTop(130);
    obj.edit128:setWidth(70);
    obj.edit128:setHeight(25);
    obj.edit128:setField("buffPericia");
    obj.edit128:setName("edit128");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox1);
    obj.layout17:setLeft(552);
    obj.layout17:setTop(310);
    obj.layout17:setWidth(188);
    obj.layout17:setHeight(142);
    obj.layout17:setName("layout17");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout17);
    obj.rectangle58:setAlign("client");
    obj.rectangle58:setColor("black");
    obj.rectangle58:setName("rectangle58");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout17);
    obj.label123:setLeft(0);
    obj.label123:setTop(0);
    obj.label123:setWidth(180);
    obj.label123:setHeight(25);
    obj.label123:setText("BBA");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout17);
    obj.rectangle59:setLeft(5);
    obj.rectangle59:setTop(25);
    obj.rectangle59:setWidth(40);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout17);
    obj.edit129:setLeft(5);
    obj.edit129:setTop(25);
    obj.edit129:setWidth(40);
    obj.edit129:setHeight(25);
    obj.edit129:setType("number");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setField("bba");
    obj.edit129:setTransparent(true);
    obj.edit129:setName("edit129");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout17);
    obj.rectangle60:setLeft(50);
    obj.rectangle60:setTop(25);
    obj.rectangle60:setWidth(125);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout17);
    obj.label124:setLeft(50);
    obj.label124:setTop(25);
    obj.label124:setWidth(125);
    obj.label124:setHeight(25);
    obj.label124:setField("bbaDesc");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setLeft(0);
    obj.layout18:setTop(60);
    obj.layout18:setWidth(180);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout18);
    obj.button11:setLeft(5);
    obj.button11:setTop(0);
    obj.button11:setWidth(70);
    obj.button11:setHeight(25);
    obj.button11:setText("AGARRAR");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout18);
    obj.rectangle61:setLeft(80);
    obj.rectangle61:setTop(0);
    obj.rectangle61:setWidth(40);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout18);
    obj.label125:setField("agarrar");
    obj.label125:setLeft(80);
    obj.label125:setWidth(40);
    obj.label125:setHeight(25);
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.GrappleBt = GUI.fromHandle(_obj_newObject("button"));
    obj.GrappleBt:setParent(obj.layout18);
    obj.GrappleBt:setLeft(125);
    obj.GrappleBt:setTop(0);
    obj.GrappleBt:setWidth(25);
    obj.GrappleBt:setHeight(25);
    obj.GrappleBt:setName("GrappleBt");
    obj.GrappleBt:setText("i");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout18);
    obj.dataLink40:setFields({'bba', 'efetModFor', 'agarrarTam', 'agarrarVar'});
    obj.dataLink40:setName("dataLink40");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.scrollBox1);
    obj.rectangle62:setLeft(0);
    obj.rectangle62:setTop(480);
    obj.rectangle62:setWidth(140);
    obj.rectangle62:setHeight(115);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setName("rectangle62");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.rectangle62);
    obj.label126:setLeft(0);
    obj.label126:setTop(0);
    obj.label126:setWidth(140);
    obj.label126:setHeight(25);
    obj.label126:setText("RESISTENCIAS");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle62);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(30);
    obj.layout19:setWidth(275);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout19);
    obj.button12:setLeft(5);
    obj.button12:setWidth(45);
    obj.button12:setText("FORT");
    obj.button12:setFontSize(11);
    obj.button12:setName("button12");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout19);
    obj.rectangle63:setLeft(55);
    obj.rectangle63:setTop(0);
    obj.rectangle63:setWidth(40);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout19);
    obj.label127:setLeft(55);
    obj.label127:setWidth(40);
    obj.label127:setHeight(25);
    obj.label127:setField("trFort");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout19);
    obj.dataLink41:setField("atrTrFort");
    obj.dataLink41:setDefaultValue("3");
    obj.dataLink41:setName("dataLink41");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle62);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(55);
    obj.layout20:setWidth(275);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout20);
    obj.button13:setLeft(5);
    obj.button13:setWidth(45);
    obj.button13:setText("REF");
    obj.button13:setFontSize(11);
    obj.button13:setName("button13");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout20);
    obj.rectangle64:setLeft(55);
    obj.rectangle64:setTop(0);
    obj.rectangle64:setWidth(40);
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout20);
    obj.label128:setLeft(55);
    obj.label128:setWidth(40);
    obj.label128:setHeight(25);
    obj.label128:setField("trRef");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout20);
    obj.dataLink42:setField("atrTrRef");
    obj.dataLink42:setDefaultValue("2");
    obj.dataLink42:setName("dataLink42");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle62);
    obj.layout21:setLeft(0);
    obj.layout21:setTop(80);
    obj.layout21:setWidth(275);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout21);
    obj.button14:setLeft(5);
    obj.button14:setWidth(45);
    obj.button14:setText("VON");
    obj.button14:setFontSize(11);
    obj.button14:setName("button14");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout21);
    obj.rectangle65:setLeft(55);
    obj.rectangle65:setTop(0);
    obj.rectangle65:setWidth(40);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout21);
    obj.label129:setLeft(55);
    obj.label129:setWidth(40);
    obj.label129:setHeight(25);
    obj.label129:setField("trVon");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout21);
    obj.dataLink43:setField("atrTrVon");
    obj.dataLink43:setDefaultValue("5");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.rectangle62);
    obj.dataLink44:setFields({'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar', 'atrTrFort', 'atrTrRef', 'atrTrVon'});
    obj.dataLink44:setName("dataLink44");

    obj.TrBut = GUI.fromHandle(_obj_newObject("button"));
    obj.TrBut:setParent(obj.rectangle62);
    obj.TrBut:setLeft(100);
    obj.TrBut:setTop(30);
    obj.TrBut:setWidth(30);
    obj.TrBut:setHeight(75);
    obj.TrBut:setName("TrBut");
    obj.TrBut:setText(">>");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.scrollBox1);
    obj.rectangle66:setLeft(745);
    obj.rectangle66:setTop(90);
    obj.rectangle66:setWidth(362);
    obj.rectangle66:setHeight(362);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(746);
    obj.image1:setTop(91);
    obj.image1:setWidth(360);
    obj.image1:setHeight(360);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Ataques");
    obj.tab2:setName("tab2");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.tab2);
    obj.tabControl2:setAlign("client");
    obj.tabControl2:setName("tabControl2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Simples");
    obj.tab3:setName("tab3");

    obj.frmFichaRPGmeister2_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister2_svg:setParent(obj.tab3);
    obj.frmFichaRPGmeister2_svg:setName("frmFichaRPGmeister2_svg");
    obj.frmFichaRPGmeister2_svg:setAlign("client");
    obj.frmFichaRPGmeister2_svg:setTheme("dark");
    obj.frmFichaRPGmeister2_svg:setMargins({top=1});

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmFichaRPGmeister2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");


			local function pos(rolado)
				local dado = rolado.ops[1].resultados[1];
				local mesaDoPersonagem = Firecast.getMesaDe(sheet);
				local valor = rolado.resultado;
				
				if (dado>=decisivo or dado==1) then
					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Confirmando Critico");
				end;
				
				if dado>1 then
					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano do Ataque " .. i,
						function (rolagem)
							if sheet.alvo1~=nil and valor>=tonumber(sheet.alvo1) then
								danoAlvo1 = danoAlvo1 + rolagem.resultado;
							end;
							if sheet.alvo2~=nil and valor>=tonumber(sheet.alvo2) then
								danoAlvo2 = danoAlvo2 + rolagem.resultado;
							end;
							if sheet.alvo3~=nil and valor>=tonumber(sheet.alvo3) then
								danoAlvo3 = danoAlvo3 + rolagem.resultado;
							end;
							if sheet.alvo4~=nil and valor>=tonumber(sheet.alvo4) then
								danoAlvo4 = danoAlvo4 + rolagem.resultado;
							end;
							if sheet.alvo5~=nil and valor>=tonumber(sheet.alvo5) then
								danoAlvo5 = danoAlvo5 + rolagem.resultado;
							end;
							
							if fimRolagem and decisivo>dado then
								if sheet.alvo1~=nil or sheet.alvo2~=nil or sheet.alvo3~=nil or sheet.alvo4~=nil or sheet.alvo5~=nil then
									mesaDoPersonagem.activeChat:enviarMensagem("Danos: Alvo 1: " .. danoAlvo1 .. ", Alvo 2: " .. danoAlvo2 .. ", Alvo 3: " .. danoAlvo3 .. ", Alvo 4: " .. danoAlvo4 .. ", Alvo 5: " .. danoAlvo5 .. ".");
								end;
							end;
							
						end);
				end;
				
				if dado>=decisivo then
					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Extra do Critico "  .. i,
						function (rolagem)
							if sheet.alvo1~=nil and valor>=tonumber(sheet.alvo1) then
								danoAlvo1 = danoAlvo1 + rolagem.resultado;
							end;
							if sheet.alvo2~=nil and valor>=tonumber(sheet.alvo2) then
								danoAlvo2 = danoAlvo2 + rolagem.resultado;
							end;
							if sheet.alvo3~=nil and valor>=tonumber(sheet.alvo3) then
								danoAlvo3 = danoAlvo3 + rolagem.resultado;
							end;
							if sheet.alvo4~=nil and valor>=tonumber(sheet.alvo4) then
								danoAlvo4 = danoAlvo4 + rolagem.resultado;
							end;
							if sheet.alvo5~=nil and valor>=tonumber(sheet.alvo5) then
								danoAlvo5 = danoAlvo5 + rolagem.resultado;
							end;
							
							if fimRolagem then
								if sheet.alvo1~=nil or sheet.alvo2~=nil or sheet.alvo3~=nil or sheet.alvo4~=nil or sheet.alvo5~=nil then
									mesaDoPersonagem.activeChat:enviarMensagem("Danos: Alvo 1: " .. danoAlvo1 .. ", Alvo 2: " .. danoAlvo2 .. ", Alvo 3: " .. danoAlvo3 .. ", Alvo 4: " .. danoAlvo4 .. ", Alvo 5: " .. danoAlvo5 .. ".");
								end;
							end;
						end);
				end;
				
				i = i+1;
				local mod = tonumber(array[i]);
				
				if mod~=nil then
					rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
					if sheet.buffAtaque ~= nil then
					rolagem = rolagem:concatenar(sheet.buffAtaque);
					end;
					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
						function (rolado)
							pos(rolado)
						end);
				else
					fimRolagem = true;
				end;
				
				
			end;
		


    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox2);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(0);
    obj.layout22:setWidth(1209);
    obj.layout22:setHeight(1900);
    obj.layout22:setName("layout22");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout22);
    obj.rectangle67:setAlign("client");
    obj.rectangle67:setColor("#0000007F");
    obj.rectangle67:setName("rectangle67");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setLeft(2);
    obj.layout23:setTop(2);
    obj.layout23:setWidth(1207);
    obj.layout23:setHeight(92);
    obj.layout23:setName("layout23");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout23);
    obj.rectangle68:setAlign("client");
    obj.rectangle68:setColor("black");
    obj.rectangle68:setName("rectangle68");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout23);
    obj.rectangle69:setLeft(869);
    obj.rectangle69:setTop(4);
    obj.rectangle69:setWidth(332);
    obj.rectangle69:setHeight(77);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout23);
    obj.label130:setLeft(5);
    obj.label130:setTop(5);
    obj.label130:setWidth(50);
    obj.label130:setHeight(25);
    obj.label130:setText("NOME");
    obj.label130:setName("label130");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout23);
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(55);
    obj.edit130:setTop(5);
    obj.edit130:setWidth(225);
    obj.edit130:setHeight(25);
    obj.edit130:setField("nome1");
    obj.edit130:setName("edit130");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout23);
    obj.label131:setLeft(5);
    obj.label131:setTop(30);
    obj.label131:setWidth(50);
    obj.label131:setHeight(25);
    obj.label131:setText("ARMA");
    obj.label131:setName("label131");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout23);
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(55);
    obj.edit131:setTop(30);
    obj.edit131:setWidth(225);
    obj.edit131:setHeight(25);
    obj.edit131:setField("arma1");
    obj.edit131:setName("edit131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout23);
    obj.label132:setLeft(5);
    obj.label132:setTop(55);
    obj.label132:setWidth(50);
    obj.label132:setHeight(25);
    obj.label132:setText("TIPO");
    obj.label132:setName("label132");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout23);
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(55);
    obj.edit132:setTop(55);
    obj.edit132:setWidth(225);
    obj.edit132:setHeight(25);
    obj.edit132:setField("tipo1");
    obj.edit132:setName("edit132");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout23);
    obj.button15:setLeft(279);
    obj.button15:setTop(6);
    obj.button15:setWidth(73);
    obj.button15:setText("ATAQUE");
    obj.button15:setFontSize(11);
    obj.button15:setName("button15");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout23);
    obj.edit133:setType("number");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setLeft(352);
    obj.edit133:setTop(5);
    obj.edit133:setWidth(25);
    obj.edit133:setHeight(25);
    obj.edit133:setField("ataque1a");
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout23);
    obj.edit134:setType("number");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setLeft(380);
    obj.edit134:setTop(5);
    obj.edit134:setWidth(25);
    obj.edit134:setHeight(25);
    obj.edit134:setField("ataque1b");
    obj.edit134:setName("edit134");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout23);
    obj.edit135:setType("number");
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(409);
    obj.edit135:setTop(5);
    obj.edit135:setWidth(25);
    obj.edit135:setHeight(25);
    obj.edit135:setField("ataque1c");
    obj.edit135:setName("edit135");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout23);
    obj.edit136:setType("number");
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(437);
    obj.edit136:setTop(5);
    obj.edit136:setWidth(25);
    obj.edit136:setHeight(25);
    obj.edit136:setField("ataque1d");
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout23);
    obj.edit137:setType("number");
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(465);
    obj.edit137:setTop(5);
    obj.edit137:setWidth(25);
    obj.edit137:setHeight(25);
    obj.edit137:setField("ataque1e");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout23);
    obj.edit138:setType("number");
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(493);
    obj.edit138:setTop(5);
    obj.edit138:setWidth(25);
    obj.edit138:setHeight(25);
    obj.edit138:setField("ataque1f");
    obj.edit138:setName("edit138");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout23);
    obj.edit139:setType("number");
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(522);
    obj.edit139:setTop(5);
    obj.edit139:setWidth(25);
    obj.edit139:setHeight(25);
    obj.edit139:setField("ataque1g");
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout23);
    obj.edit140:setType("number");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setLeft(550);
    obj.edit140:setTop(5);
    obj.edit140:setWidth(25);
    obj.edit140:setHeight(25);
    obj.edit140:setField("ataque1h");
    obj.edit140:setName("edit140");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout23);
    obj.button16:setLeft(279);
    obj.button16:setTop(31);
    obj.button16:setWidth(73);
    obj.button16:setText("DANO");
    obj.button16:setFontSize(11);
    obj.button16:setName("button16");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout23);
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setLeft(352);
    obj.edit141:setTop(30);
    obj.edit141:setWidth(82);
    obj.edit141:setHeight(25);
    obj.edit141:setField("dano1");
    obj.edit141:setName("edit141");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout23);
    obj.button17:setLeft(434);
    obj.button17:setTop(31);
    obj.button17:setWidth(60);
    obj.button17:setText("CRITICO");
    obj.button17:setFontSize(11);
    obj.button17:setName("button17");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout23);
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setLeft(493);
    obj.edit142:setTop(30);
    obj.edit142:setWidth(82);
    obj.edit142:setHeight(25);
    obj.edit142:setField("danoCritico1");
    obj.edit142:setName("edit142");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout23);
    obj.label133:setLeft(290);
    obj.label133:setTop(55);
    obj.label133:setWidth(70);
    obj.label133:setHeight(25);
    obj.label133:setText("DECISIVO");
    obj.label133:setName("label133");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout23);
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setLeft(352);
    obj.edit143:setTop(55);
    obj.edit143:setWidth(82);
    obj.edit143:setHeight(25);
    obj.edit143:setField("decisivo1");
    obj.edit143:setName("edit143");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout23);
    obj.label134:setLeft(445);
    obj.label134:setTop(55);
    obj.label134:setWidth(50);
    obj.label134:setHeight(25);
    obj.label134:setText("MULTI");
    obj.label134:setName("label134");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout23);
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setLeft(493);
    obj.edit144:setTop(55);
    obj.edit144:setWidth(82);
    obj.edit144:setHeight(25);
    obj.edit144:setField("multiplicador1");
    obj.edit144:setName("edit144");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout23);
    obj.label135:setLeft(580);
    obj.label135:setTop(5);
    obj.label135:setWidth(80);
    obj.label135:setHeight(25);
    obj.label135:setText("CATEGORIA");
    obj.label135:setName("label135");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout23);
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setLeft(660);
    obj.edit145:setTop(5);
    obj.edit145:setWidth(200);
    obj.edit145:setHeight(25);
    obj.edit145:setField("categoria1");
    obj.edit145:setName("edit145");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout23);
    obj.label136:setLeft(610);
    obj.label136:setTop(30);
    obj.label136:setWidth(50);
    obj.label136:setHeight(25);
    obj.label136:setText("OBS");
    obj.label136:setName("label136");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout23);
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setLeft(660);
    obj.edit146:setTop(30);
    obj.edit146:setWidth(200);
    obj.edit146:setHeight(25);
    obj.edit146:setField("obs1");
    obj.edit146:setName("edit146");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout23);
    obj.label137:setLeft(590);
    obj.label137:setTop(55);
    obj.label137:setWidth(80);
    obj.label137:setHeight(25);
    obj.label137:setText("MUNIÇÃO");
    obj.label137:setName("label137");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout23);
    obj.edit147:setType("number");
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setLeft(660);
    obj.edit147:setTop(55);
    obj.edit147:setWidth(69);
    obj.edit147:setHeight(25);
    obj.edit147:setField("municao1");
    obj.edit147:setName("edit147");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout23);
    obj.label138:setLeft(735);
    obj.label138:setTop(55);
    obj.label138:setWidth(70);
    obj.label138:setHeight(25);
    obj.label138:setText("ALCANCE");
    obj.label138:setName("label138");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout23);
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setLeft(795);
    obj.edit148:setTop(55);
    obj.edit148:setWidth(65);
    obj.edit148:setHeight(25);
    obj.edit148:setField("alcance1");
    obj.edit148:setName("edit148");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout23);
    obj.label139:setLeft(870);
    obj.label139:setTop(25);
    obj.label139:setWidth(330);
    obj.label139:setHeight(25);
    obj.label139:setHorzTextAlign("center");
    obj.label139:setText("Clique para adicionar imagem");
    obj.label139:setName("label139");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout23);
    obj.image2:setField("imagemArma1");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(870);
    obj.image2:setTop(5);
    obj.image2:setWidth(330);
    obj.image2:setHeight(75);
    obj.image2:setName("image2");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout22);
    obj.layout24:setLeft(2);
    obj.layout24:setTop(97);
    obj.layout24:setWidth(1207);
    obj.layout24:setHeight(92);
    obj.layout24:setName("layout24");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout24);
    obj.rectangle70:setAlign("client");
    obj.rectangle70:setColor("black");
    obj.rectangle70:setName("rectangle70");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout24);
    obj.rectangle71:setLeft(869);
    obj.rectangle71:setTop(4);
    obj.rectangle71:setWidth(332);
    obj.rectangle71:setHeight(77);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout24);
    obj.label140:setLeft(5);
    obj.label140:setTop(5);
    obj.label140:setWidth(50);
    obj.label140:setHeight(25);
    obj.label140:setText("NOME");
    obj.label140:setName("label140");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout24);
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setLeft(55);
    obj.edit149:setTop(5);
    obj.edit149:setWidth(225);
    obj.edit149:setHeight(25);
    obj.edit149:setField("nome2");
    obj.edit149:setName("edit149");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout24);
    obj.label141:setLeft(5);
    obj.label141:setTop(30);
    obj.label141:setWidth(50);
    obj.label141:setHeight(25);
    obj.label141:setText("ARMA");
    obj.label141:setName("label141");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout24);
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setLeft(55);
    obj.edit150:setTop(30);
    obj.edit150:setWidth(225);
    obj.edit150:setHeight(25);
    obj.edit150:setField("arma2");
    obj.edit150:setName("edit150");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout24);
    obj.label142:setLeft(5);
    obj.label142:setTop(55);
    obj.label142:setWidth(50);
    obj.label142:setHeight(25);
    obj.label142:setText("TIPO");
    obj.label142:setName("label142");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout24);
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setLeft(55);
    obj.edit151:setTop(55);
    obj.edit151:setWidth(225);
    obj.edit151:setHeight(25);
    obj.edit151:setField("tipo2");
    obj.edit151:setName("edit151");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout24);
    obj.button18:setLeft(279);
    obj.button18:setTop(6);
    obj.button18:setWidth(73);
    obj.button18:setText("ATAQUE");
    obj.button18:setFontSize(11);
    obj.button18:setName("button18");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout24);
    obj.edit152:setType("number");
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setLeft(352);
    obj.edit152:setTop(5);
    obj.edit152:setWidth(25);
    obj.edit152:setHeight(25);
    obj.edit152:setField("ataque2a");
    obj.edit152:setName("edit152");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout24);
    obj.edit153:setType("number");
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setLeft(380);
    obj.edit153:setTop(5);
    obj.edit153:setWidth(25);
    obj.edit153:setHeight(25);
    obj.edit153:setField("ataque2b");
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout24);
    obj.edit154:setType("number");
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(409);
    obj.edit154:setTop(5);
    obj.edit154:setWidth(25);
    obj.edit154:setHeight(25);
    obj.edit154:setField("ataque2c");
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout24);
    obj.edit155:setType("number");
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(437);
    obj.edit155:setTop(5);
    obj.edit155:setWidth(25);
    obj.edit155:setHeight(25);
    obj.edit155:setField("ataque2d");
    obj.edit155:setName("edit155");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout24);
    obj.edit156:setType("number");
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(465);
    obj.edit156:setTop(5);
    obj.edit156:setWidth(25);
    obj.edit156:setHeight(25);
    obj.edit156:setField("ataque2e");
    obj.edit156:setName("edit156");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout24);
    obj.edit157:setType("number");
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(493);
    obj.edit157:setTop(5);
    obj.edit157:setWidth(25);
    obj.edit157:setHeight(25);
    obj.edit157:setField("ataque2f");
    obj.edit157:setName("edit157");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout24);
    obj.edit158:setType("number");
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(522);
    obj.edit158:setTop(5);
    obj.edit158:setWidth(25);
    obj.edit158:setHeight(25);
    obj.edit158:setField("ataque2g");
    obj.edit158:setName("edit158");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout24);
    obj.edit159:setType("number");
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(550);
    obj.edit159:setTop(5);
    obj.edit159:setWidth(25);
    obj.edit159:setHeight(25);
    obj.edit159:setField("ataque2h");
    obj.edit159:setName("edit159");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout24);
    obj.button19:setLeft(279);
    obj.button19:setTop(31);
    obj.button19:setWidth(73);
    obj.button19:setText("DANO");
    obj.button19:setFontSize(11);
    obj.button19:setName("button19");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout24);
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(352);
    obj.edit160:setTop(30);
    obj.edit160:setWidth(82);
    obj.edit160:setHeight(25);
    obj.edit160:setField("dano2");
    obj.edit160:setName("edit160");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout24);
    obj.button20:setLeft(434);
    obj.button20:setTop(31);
    obj.button20:setWidth(60);
    obj.button20:setText("CRITICO");
    obj.button20:setFontSize(11);
    obj.button20:setName("button20");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout24);
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setLeft(493);
    obj.edit161:setTop(30);
    obj.edit161:setWidth(82);
    obj.edit161:setHeight(25);
    obj.edit161:setField("danoCritico2");
    obj.edit161:setName("edit161");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout24);
    obj.label143:setLeft(290);
    obj.label143:setTop(55);
    obj.label143:setWidth(70);
    obj.label143:setHeight(25);
    obj.label143:setText("DECISIVO");
    obj.label143:setName("label143");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout24);
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setLeft(352);
    obj.edit162:setTop(55);
    obj.edit162:setWidth(82);
    obj.edit162:setHeight(25);
    obj.edit162:setField("decisivo2");
    obj.edit162:setName("edit162");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout24);
    obj.label144:setLeft(445);
    obj.label144:setTop(55);
    obj.label144:setWidth(50);
    obj.label144:setHeight(25);
    obj.label144:setText("MULTI");
    obj.label144:setName("label144");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout24);
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setLeft(493);
    obj.edit163:setTop(55);
    obj.edit163:setWidth(82);
    obj.edit163:setHeight(25);
    obj.edit163:setField("multiplicador2");
    obj.edit163:setName("edit163");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout24);
    obj.label145:setLeft(580);
    obj.label145:setTop(5);
    obj.label145:setWidth(80);
    obj.label145:setHeight(25);
    obj.label145:setText("CATEGORIA");
    obj.label145:setName("label145");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout24);
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setLeft(660);
    obj.edit164:setTop(5);
    obj.edit164:setWidth(200);
    obj.edit164:setHeight(25);
    obj.edit164:setField("categoria2");
    obj.edit164:setName("edit164");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout24);
    obj.label146:setLeft(610);
    obj.label146:setTop(30);
    obj.label146:setWidth(50);
    obj.label146:setHeight(25);
    obj.label146:setText("OBS");
    obj.label146:setName("label146");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout24);
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setLeft(660);
    obj.edit165:setTop(30);
    obj.edit165:setWidth(200);
    obj.edit165:setHeight(25);
    obj.edit165:setField("obs2");
    obj.edit165:setName("edit165");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout24);
    obj.label147:setLeft(590);
    obj.label147:setTop(55);
    obj.label147:setWidth(80);
    obj.label147:setHeight(25);
    obj.label147:setText("MUNIÇÃO");
    obj.label147:setName("label147");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout24);
    obj.edit166:setType("number");
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setLeft(660);
    obj.edit166:setTop(55);
    obj.edit166:setWidth(69);
    obj.edit166:setHeight(25);
    obj.edit166:setField("municao2");
    obj.edit166:setName("edit166");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout24);
    obj.label148:setLeft(735);
    obj.label148:setTop(55);
    obj.label148:setWidth(70);
    obj.label148:setHeight(25);
    obj.label148:setText("ALCANCE");
    obj.label148:setName("label148");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout24);
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setLeft(795);
    obj.edit167:setTop(55);
    obj.edit167:setWidth(65);
    obj.edit167:setHeight(25);
    obj.edit167:setField("alcance2");
    obj.edit167:setName("edit167");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout24);
    obj.label149:setLeft(870);
    obj.label149:setTop(25);
    obj.label149:setWidth(330);
    obj.label149:setHeight(25);
    obj.label149:setHorzTextAlign("center");
    obj.label149:setText("Clique para adicionar imagem");
    obj.label149:setName("label149");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout24);
    obj.image3:setField("imagemArma2");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setLeft(870);
    obj.image3:setTop(5);
    obj.image3:setWidth(330);
    obj.image3:setHeight(75);
    obj.image3:setName("image3");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout22);
    obj.layout25:setLeft(2);
    obj.layout25:setTop(192);
    obj.layout25:setWidth(1207);
    obj.layout25:setHeight(92);
    obj.layout25:setName("layout25");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout25);
    obj.rectangle72:setAlign("client");
    obj.rectangle72:setColor("black");
    obj.rectangle72:setName("rectangle72");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout25);
    obj.rectangle73:setLeft(869);
    obj.rectangle73:setTop(4);
    obj.rectangle73:setWidth(332);
    obj.rectangle73:setHeight(77);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout25);
    obj.label150:setLeft(5);
    obj.label150:setTop(5);
    obj.label150:setWidth(50);
    obj.label150:setHeight(25);
    obj.label150:setText("NOME");
    obj.label150:setName("label150");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout25);
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setLeft(55);
    obj.edit168:setTop(5);
    obj.edit168:setWidth(225);
    obj.edit168:setHeight(25);
    obj.edit168:setField("nome3");
    obj.edit168:setName("edit168");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout25);
    obj.label151:setLeft(5);
    obj.label151:setTop(30);
    obj.label151:setWidth(50);
    obj.label151:setHeight(25);
    obj.label151:setText("ARMA");
    obj.label151:setName("label151");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout25);
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setLeft(55);
    obj.edit169:setTop(30);
    obj.edit169:setWidth(225);
    obj.edit169:setHeight(25);
    obj.edit169:setField("arma3");
    obj.edit169:setName("edit169");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout25);
    obj.label152:setLeft(5);
    obj.label152:setTop(55);
    obj.label152:setWidth(50);
    obj.label152:setHeight(25);
    obj.label152:setText("TIPO");
    obj.label152:setName("label152");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout25);
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setLeft(55);
    obj.edit170:setTop(55);
    obj.edit170:setWidth(225);
    obj.edit170:setHeight(25);
    obj.edit170:setField("tipo3");
    obj.edit170:setName("edit170");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout25);
    obj.button21:setLeft(279);
    obj.button21:setTop(6);
    obj.button21:setWidth(73);
    obj.button21:setText("ATAQUE");
    obj.button21:setFontSize(11);
    obj.button21:setName("button21");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout25);
    obj.edit171:setType("number");
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setLeft(352);
    obj.edit171:setTop(5);
    obj.edit171:setWidth(25);
    obj.edit171:setHeight(25);
    obj.edit171:setField("ataque3a");
    obj.edit171:setName("edit171");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout25);
    obj.edit172:setType("number");
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setLeft(380);
    obj.edit172:setTop(5);
    obj.edit172:setWidth(25);
    obj.edit172:setHeight(25);
    obj.edit172:setField("ataque3b");
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout25);
    obj.edit173:setType("number");
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(409);
    obj.edit173:setTop(5);
    obj.edit173:setWidth(25);
    obj.edit173:setHeight(25);
    obj.edit173:setField("ataque3c");
    obj.edit173:setName("edit173");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout25);
    obj.edit174:setType("number");
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setLeft(437);
    obj.edit174:setTop(5);
    obj.edit174:setWidth(25);
    obj.edit174:setHeight(25);
    obj.edit174:setField("ataque3d");
    obj.edit174:setName("edit174");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout25);
    obj.edit175:setType("number");
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setLeft(465);
    obj.edit175:setTop(5);
    obj.edit175:setWidth(25);
    obj.edit175:setHeight(25);
    obj.edit175:setField("ataque3e");
    obj.edit175:setName("edit175");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout25);
    obj.edit176:setType("number");
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(493);
    obj.edit176:setTop(5);
    obj.edit176:setWidth(25);
    obj.edit176:setHeight(25);
    obj.edit176:setField("ataque3f");
    obj.edit176:setName("edit176");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout25);
    obj.edit177:setType("number");
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(522);
    obj.edit177:setTop(5);
    obj.edit177:setWidth(25);
    obj.edit177:setHeight(25);
    obj.edit177:setField("ataque3g");
    obj.edit177:setName("edit177");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout25);
    obj.edit178:setType("number");
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(550);
    obj.edit178:setTop(5);
    obj.edit178:setWidth(25);
    obj.edit178:setHeight(25);
    obj.edit178:setField("ataque3h");
    obj.edit178:setName("edit178");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout25);
    obj.button22:setLeft(279);
    obj.button22:setTop(31);
    obj.button22:setWidth(73);
    obj.button22:setText("DANO");
    obj.button22:setFontSize(11);
    obj.button22:setName("button22");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout25);
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(352);
    obj.edit179:setTop(30);
    obj.edit179:setWidth(82);
    obj.edit179:setHeight(25);
    obj.edit179:setField("dano3");
    obj.edit179:setName("edit179");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout25);
    obj.button23:setLeft(434);
    obj.button23:setTop(31);
    obj.button23:setWidth(60);
    obj.button23:setText("CRITICO");
    obj.button23:setFontSize(11);
    obj.button23:setName("button23");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout25);
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(493);
    obj.edit180:setTop(30);
    obj.edit180:setWidth(82);
    obj.edit180:setHeight(25);
    obj.edit180:setField("danoCritico3");
    obj.edit180:setName("edit180");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout25);
    obj.label153:setLeft(290);
    obj.label153:setTop(55);
    obj.label153:setWidth(70);
    obj.label153:setHeight(25);
    obj.label153:setText("DECISIVO");
    obj.label153:setName("label153");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout25);
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(352);
    obj.edit181:setTop(55);
    obj.edit181:setWidth(82);
    obj.edit181:setHeight(25);
    obj.edit181:setField("decisivo3");
    obj.edit181:setName("edit181");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout25);
    obj.label154:setLeft(445);
    obj.label154:setTop(55);
    obj.label154:setWidth(50);
    obj.label154:setHeight(25);
    obj.label154:setText("MULTI");
    obj.label154:setName("label154");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout25);
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(493);
    obj.edit182:setTop(55);
    obj.edit182:setWidth(82);
    obj.edit182:setHeight(25);
    obj.edit182:setField("multiplicador3");
    obj.edit182:setName("edit182");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout25);
    obj.label155:setLeft(580);
    obj.label155:setTop(5);
    obj.label155:setWidth(80);
    obj.label155:setHeight(25);
    obj.label155:setText("CATEGORIA");
    obj.label155:setName("label155");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout25);
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(660);
    obj.edit183:setTop(5);
    obj.edit183:setWidth(200);
    obj.edit183:setHeight(25);
    obj.edit183:setField("categoria3");
    obj.edit183:setName("edit183");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout25);
    obj.label156:setLeft(610);
    obj.label156:setTop(30);
    obj.label156:setWidth(50);
    obj.label156:setHeight(25);
    obj.label156:setText("OBS");
    obj.label156:setName("label156");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout25);
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(660);
    obj.edit184:setTop(30);
    obj.edit184:setWidth(200);
    obj.edit184:setHeight(25);
    obj.edit184:setField("obs3");
    obj.edit184:setName("edit184");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout25);
    obj.label157:setLeft(590);
    obj.label157:setTop(55);
    obj.label157:setWidth(80);
    obj.label157:setHeight(25);
    obj.label157:setText("MUNIÇÃO");
    obj.label157:setName("label157");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout25);
    obj.edit185:setType("number");
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(660);
    obj.edit185:setTop(55);
    obj.edit185:setWidth(69);
    obj.edit185:setHeight(25);
    obj.edit185:setField("municao3");
    obj.edit185:setName("edit185");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout25);
    obj.label158:setLeft(735);
    obj.label158:setTop(55);
    obj.label158:setWidth(70);
    obj.label158:setHeight(25);
    obj.label158:setText("ALCANCE");
    obj.label158:setName("label158");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout25);
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(795);
    obj.edit186:setTop(55);
    obj.edit186:setWidth(65);
    obj.edit186:setHeight(25);
    obj.edit186:setField("alcance3");
    obj.edit186:setName("edit186");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout25);
    obj.label159:setLeft(870);
    obj.label159:setTop(25);
    obj.label159:setWidth(330);
    obj.label159:setHeight(25);
    obj.label159:setHorzTextAlign("center");
    obj.label159:setText("Clique para adicionar imagem");
    obj.label159:setName("label159");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout25);
    obj.image4:setField("imagemArma3");
    obj.image4:setEditable(true);
    obj.image4:setStyle("autoFit");
    obj.image4:setLeft(870);
    obj.image4:setTop(5);
    obj.image4:setWidth(330);
    obj.image4:setHeight(75);
    obj.image4:setName("image4");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout22);
    obj.layout26:setLeft(2);
    obj.layout26:setTop(288);
    obj.layout26:setWidth(1207);
    obj.layout26:setHeight(92);
    obj.layout26:setName("layout26");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout26);
    obj.rectangle74:setAlign("client");
    obj.rectangle74:setColor("black");
    obj.rectangle74:setName("rectangle74");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout26);
    obj.rectangle75:setLeft(869);
    obj.rectangle75:setTop(4);
    obj.rectangle75:setWidth(332);
    obj.rectangle75:setHeight(77);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout26);
    obj.label160:setLeft(5);
    obj.label160:setTop(5);
    obj.label160:setWidth(50);
    obj.label160:setHeight(25);
    obj.label160:setText("NOME");
    obj.label160:setName("label160");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout26);
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(55);
    obj.edit187:setTop(5);
    obj.edit187:setWidth(225);
    obj.edit187:setHeight(25);
    obj.edit187:setField("nome4");
    obj.edit187:setName("edit187");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout26);
    obj.label161:setLeft(5);
    obj.label161:setTop(30);
    obj.label161:setWidth(50);
    obj.label161:setHeight(25);
    obj.label161:setText("ARMA");
    obj.label161:setName("label161");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout26);
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(55);
    obj.edit188:setTop(30);
    obj.edit188:setWidth(225);
    obj.edit188:setHeight(25);
    obj.edit188:setField("arma4");
    obj.edit188:setName("edit188");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout26);
    obj.label162:setLeft(5);
    obj.label162:setTop(55);
    obj.label162:setWidth(50);
    obj.label162:setHeight(25);
    obj.label162:setText("TIPO");
    obj.label162:setName("label162");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout26);
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(55);
    obj.edit189:setTop(55);
    obj.edit189:setWidth(225);
    obj.edit189:setHeight(25);
    obj.edit189:setField("tipo4");
    obj.edit189:setName("edit189");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout26);
    obj.button24:setLeft(279);
    obj.button24:setTop(6);
    obj.button24:setWidth(73);
    obj.button24:setText("ATAQUE");
    obj.button24:setFontSize(11);
    obj.button24:setName("button24");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout26);
    obj.edit190:setType("number");
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(352);
    obj.edit190:setTop(5);
    obj.edit190:setWidth(25);
    obj.edit190:setHeight(25);
    obj.edit190:setField("ataque4a");
    obj.edit190:setName("edit190");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout26);
    obj.edit191:setType("number");
    obj.edit191:setVertTextAlign("center");
    obj.edit191:setLeft(380);
    obj.edit191:setTop(5);
    obj.edit191:setWidth(25);
    obj.edit191:setHeight(25);
    obj.edit191:setField("ataque4b");
    obj.edit191:setName("edit191");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout26);
    obj.edit192:setType("number");
    obj.edit192:setVertTextAlign("center");
    obj.edit192:setLeft(409);
    obj.edit192:setTop(5);
    obj.edit192:setWidth(25);
    obj.edit192:setHeight(25);
    obj.edit192:setField("ataque4c");
    obj.edit192:setName("edit192");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout26);
    obj.edit193:setType("number");
    obj.edit193:setVertTextAlign("center");
    obj.edit193:setLeft(437);
    obj.edit193:setTop(5);
    obj.edit193:setWidth(25);
    obj.edit193:setHeight(25);
    obj.edit193:setField("ataque4d");
    obj.edit193:setName("edit193");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout26);
    obj.edit194:setType("number");
    obj.edit194:setVertTextAlign("center");
    obj.edit194:setLeft(465);
    obj.edit194:setTop(5);
    obj.edit194:setWidth(25);
    obj.edit194:setHeight(25);
    obj.edit194:setField("ataque4e");
    obj.edit194:setName("edit194");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout26);
    obj.edit195:setType("number");
    obj.edit195:setVertTextAlign("center");
    obj.edit195:setLeft(493);
    obj.edit195:setTop(5);
    obj.edit195:setWidth(25);
    obj.edit195:setHeight(25);
    obj.edit195:setField("ataque4f");
    obj.edit195:setName("edit195");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout26);
    obj.edit196:setType("number");
    obj.edit196:setVertTextAlign("center");
    obj.edit196:setLeft(522);
    obj.edit196:setTop(5);
    obj.edit196:setWidth(25);
    obj.edit196:setHeight(25);
    obj.edit196:setField("ataque4g");
    obj.edit196:setName("edit196");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout26);
    obj.edit197:setType("number");
    obj.edit197:setVertTextAlign("center");
    obj.edit197:setLeft(550);
    obj.edit197:setTop(5);
    obj.edit197:setWidth(25);
    obj.edit197:setHeight(25);
    obj.edit197:setField("ataque4h");
    obj.edit197:setName("edit197");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout26);
    obj.button25:setLeft(279);
    obj.button25:setTop(31);
    obj.button25:setWidth(73);
    obj.button25:setText("DANO");
    obj.button25:setFontSize(11);
    obj.button25:setName("button25");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout26);
    obj.edit198:setVertTextAlign("center");
    obj.edit198:setLeft(352);
    obj.edit198:setTop(30);
    obj.edit198:setWidth(82);
    obj.edit198:setHeight(25);
    obj.edit198:setField("dano4");
    obj.edit198:setName("edit198");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout26);
    obj.button26:setLeft(434);
    obj.button26:setTop(31);
    obj.button26:setWidth(60);
    obj.button26:setText("CRITICO");
    obj.button26:setFontSize(11);
    obj.button26:setName("button26");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout26);
    obj.edit199:setVertTextAlign("center");
    obj.edit199:setLeft(493);
    obj.edit199:setTop(30);
    obj.edit199:setWidth(82);
    obj.edit199:setHeight(25);
    obj.edit199:setField("danoCritico4");
    obj.edit199:setName("edit199");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout26);
    obj.label163:setLeft(290);
    obj.label163:setTop(55);
    obj.label163:setWidth(70);
    obj.label163:setHeight(25);
    obj.label163:setText("DECISIVO");
    obj.label163:setName("label163");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout26);
    obj.edit200:setVertTextAlign("center");
    obj.edit200:setLeft(352);
    obj.edit200:setTop(55);
    obj.edit200:setWidth(82);
    obj.edit200:setHeight(25);
    obj.edit200:setField("decisivo4");
    obj.edit200:setName("edit200");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout26);
    obj.label164:setLeft(445);
    obj.label164:setTop(55);
    obj.label164:setWidth(50);
    obj.label164:setHeight(25);
    obj.label164:setText("MULTI");
    obj.label164:setName("label164");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout26);
    obj.edit201:setVertTextAlign("center");
    obj.edit201:setLeft(493);
    obj.edit201:setTop(55);
    obj.edit201:setWidth(82);
    obj.edit201:setHeight(25);
    obj.edit201:setField("multiplicador4");
    obj.edit201:setName("edit201");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout26);
    obj.label165:setLeft(580);
    obj.label165:setTop(5);
    obj.label165:setWidth(80);
    obj.label165:setHeight(25);
    obj.label165:setText("CATEGORIA");
    obj.label165:setName("label165");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout26);
    obj.edit202:setVertTextAlign("center");
    obj.edit202:setLeft(660);
    obj.edit202:setTop(5);
    obj.edit202:setWidth(200);
    obj.edit202:setHeight(25);
    obj.edit202:setField("categoria4");
    obj.edit202:setName("edit202");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout26);
    obj.label166:setLeft(610);
    obj.label166:setTop(30);
    obj.label166:setWidth(50);
    obj.label166:setHeight(25);
    obj.label166:setText("OBS");
    obj.label166:setName("label166");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout26);
    obj.edit203:setVertTextAlign("center");
    obj.edit203:setLeft(660);
    obj.edit203:setTop(30);
    obj.edit203:setWidth(200);
    obj.edit203:setHeight(25);
    obj.edit203:setField("obs4");
    obj.edit203:setName("edit203");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout26);
    obj.label167:setLeft(590);
    obj.label167:setTop(55);
    obj.label167:setWidth(80);
    obj.label167:setHeight(25);
    obj.label167:setText("MUNIÇÃO");
    obj.label167:setName("label167");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout26);
    obj.edit204:setType("number");
    obj.edit204:setVertTextAlign("center");
    obj.edit204:setLeft(660);
    obj.edit204:setTop(55);
    obj.edit204:setWidth(69);
    obj.edit204:setHeight(25);
    obj.edit204:setField("municao4");
    obj.edit204:setName("edit204");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout26);
    obj.label168:setLeft(735);
    obj.label168:setTop(55);
    obj.label168:setWidth(70);
    obj.label168:setHeight(25);
    obj.label168:setText("ALCANCE");
    obj.label168:setName("label168");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout26);
    obj.edit205:setVertTextAlign("center");
    obj.edit205:setLeft(795);
    obj.edit205:setTop(55);
    obj.edit205:setWidth(65);
    obj.edit205:setHeight(25);
    obj.edit205:setField("alcance4");
    obj.edit205:setName("edit205");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout26);
    obj.label169:setLeft(870);
    obj.label169:setTop(25);
    obj.label169:setWidth(330);
    obj.label169:setHeight(25);
    obj.label169:setHorzTextAlign("center");
    obj.label169:setText("Clique para adicionar imagem");
    obj.label169:setName("label169");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout26);
    obj.image5:setField("imagemArma4");
    obj.image5:setEditable(true);
    obj.image5:setStyle("autoFit");
    obj.image5:setLeft(870);
    obj.image5:setTop(5);
    obj.image5:setWidth(330);
    obj.image5:setHeight(75);
    obj.image5:setName("image5");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout22);
    obj.layout27:setLeft(2);
    obj.layout27:setTop(383);
    obj.layout27:setWidth(1207);
    obj.layout27:setHeight(92);
    obj.layout27:setName("layout27");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout27);
    obj.rectangle76:setAlign("client");
    obj.rectangle76:setColor("black");
    obj.rectangle76:setName("rectangle76");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout27);
    obj.rectangle77:setLeft(869);
    obj.rectangle77:setTop(4);
    obj.rectangle77:setWidth(332);
    obj.rectangle77:setHeight(77);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout27);
    obj.label170:setLeft(5);
    obj.label170:setTop(5);
    obj.label170:setWidth(50);
    obj.label170:setHeight(25);
    obj.label170:setText("NOME");
    obj.label170:setName("label170");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout27);
    obj.edit206:setVertTextAlign("center");
    obj.edit206:setLeft(55);
    obj.edit206:setTop(5);
    obj.edit206:setWidth(225);
    obj.edit206:setHeight(25);
    obj.edit206:setField("nome5");
    obj.edit206:setName("edit206");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout27);
    obj.label171:setLeft(5);
    obj.label171:setTop(30);
    obj.label171:setWidth(50);
    obj.label171:setHeight(25);
    obj.label171:setText("ARMA");
    obj.label171:setName("label171");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout27);
    obj.edit207:setVertTextAlign("center");
    obj.edit207:setLeft(55);
    obj.edit207:setTop(30);
    obj.edit207:setWidth(225);
    obj.edit207:setHeight(25);
    obj.edit207:setField("arma5");
    obj.edit207:setName("edit207");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout27);
    obj.label172:setLeft(5);
    obj.label172:setTop(55);
    obj.label172:setWidth(50);
    obj.label172:setHeight(25);
    obj.label172:setText("TIPO");
    obj.label172:setName("label172");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout27);
    obj.edit208:setVertTextAlign("center");
    obj.edit208:setLeft(55);
    obj.edit208:setTop(55);
    obj.edit208:setWidth(225);
    obj.edit208:setHeight(25);
    obj.edit208:setField("tipo5");
    obj.edit208:setName("edit208");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout27);
    obj.button27:setLeft(279);
    obj.button27:setTop(6);
    obj.button27:setWidth(73);
    obj.button27:setText("ATAQUE");
    obj.button27:setFontSize(11);
    obj.button27:setName("button27");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout27);
    obj.edit209:setType("number");
    obj.edit209:setVertTextAlign("center");
    obj.edit209:setLeft(352);
    obj.edit209:setTop(5);
    obj.edit209:setWidth(25);
    obj.edit209:setHeight(25);
    obj.edit209:setField("ataque5a");
    obj.edit209:setName("edit209");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout27);
    obj.edit210:setType("number");
    obj.edit210:setVertTextAlign("center");
    obj.edit210:setLeft(380);
    obj.edit210:setTop(5);
    obj.edit210:setWidth(25);
    obj.edit210:setHeight(25);
    obj.edit210:setField("ataque5b");
    obj.edit210:setName("edit210");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout27);
    obj.edit211:setType("number");
    obj.edit211:setVertTextAlign("center");
    obj.edit211:setLeft(409);
    obj.edit211:setTop(5);
    obj.edit211:setWidth(25);
    obj.edit211:setHeight(25);
    obj.edit211:setField("ataque5c");
    obj.edit211:setName("edit211");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout27);
    obj.edit212:setType("number");
    obj.edit212:setVertTextAlign("center");
    obj.edit212:setLeft(437);
    obj.edit212:setTop(5);
    obj.edit212:setWidth(25);
    obj.edit212:setHeight(25);
    obj.edit212:setField("ataque5d");
    obj.edit212:setName("edit212");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout27);
    obj.edit213:setType("number");
    obj.edit213:setVertTextAlign("center");
    obj.edit213:setLeft(465);
    obj.edit213:setTop(5);
    obj.edit213:setWidth(25);
    obj.edit213:setHeight(25);
    obj.edit213:setField("ataque5e");
    obj.edit213:setName("edit213");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout27);
    obj.edit214:setType("number");
    obj.edit214:setVertTextAlign("center");
    obj.edit214:setLeft(493);
    obj.edit214:setTop(5);
    obj.edit214:setWidth(25);
    obj.edit214:setHeight(25);
    obj.edit214:setField("ataque5f");
    obj.edit214:setName("edit214");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout27);
    obj.edit215:setType("number");
    obj.edit215:setVertTextAlign("center");
    obj.edit215:setLeft(522);
    obj.edit215:setTop(5);
    obj.edit215:setWidth(25);
    obj.edit215:setHeight(25);
    obj.edit215:setField("ataque5g");
    obj.edit215:setName("edit215");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout27);
    obj.edit216:setType("number");
    obj.edit216:setVertTextAlign("center");
    obj.edit216:setLeft(550);
    obj.edit216:setTop(5);
    obj.edit216:setWidth(25);
    obj.edit216:setHeight(25);
    obj.edit216:setField("ataque5h");
    obj.edit216:setName("edit216");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout27);
    obj.button28:setLeft(279);
    obj.button28:setTop(31);
    obj.button28:setWidth(73);
    obj.button28:setText("DANO");
    obj.button28:setFontSize(11);
    obj.button28:setName("button28");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout27);
    obj.edit217:setVertTextAlign("center");
    obj.edit217:setLeft(352);
    obj.edit217:setTop(30);
    obj.edit217:setWidth(82);
    obj.edit217:setHeight(25);
    obj.edit217:setField("dano5");
    obj.edit217:setName("edit217");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout27);
    obj.button29:setLeft(434);
    obj.button29:setTop(31);
    obj.button29:setWidth(60);
    obj.button29:setText("CRITICO");
    obj.button29:setFontSize(11);
    obj.button29:setName("button29");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout27);
    obj.edit218:setVertTextAlign("center");
    obj.edit218:setLeft(493);
    obj.edit218:setTop(30);
    obj.edit218:setWidth(82);
    obj.edit218:setHeight(25);
    obj.edit218:setField("danoCritico5");
    obj.edit218:setName("edit218");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout27);
    obj.label173:setLeft(290);
    obj.label173:setTop(55);
    obj.label173:setWidth(70);
    obj.label173:setHeight(25);
    obj.label173:setText("DECISIVO");
    obj.label173:setName("label173");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout27);
    obj.edit219:setVertTextAlign("center");
    obj.edit219:setLeft(352);
    obj.edit219:setTop(55);
    obj.edit219:setWidth(82);
    obj.edit219:setHeight(25);
    obj.edit219:setField("decisivo5");
    obj.edit219:setName("edit219");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout27);
    obj.label174:setLeft(445);
    obj.label174:setTop(55);
    obj.label174:setWidth(50);
    obj.label174:setHeight(25);
    obj.label174:setText("MULTI");
    obj.label174:setName("label174");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout27);
    obj.edit220:setVertTextAlign("center");
    obj.edit220:setLeft(493);
    obj.edit220:setTop(55);
    obj.edit220:setWidth(82);
    obj.edit220:setHeight(25);
    obj.edit220:setField("multiplicador5");
    obj.edit220:setName("edit220");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout27);
    obj.label175:setLeft(580);
    obj.label175:setTop(5);
    obj.label175:setWidth(80);
    obj.label175:setHeight(25);
    obj.label175:setText("CATEGORIA");
    obj.label175:setName("label175");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout27);
    obj.edit221:setVertTextAlign("center");
    obj.edit221:setLeft(660);
    obj.edit221:setTop(5);
    obj.edit221:setWidth(200);
    obj.edit221:setHeight(25);
    obj.edit221:setField("categoria5");
    obj.edit221:setName("edit221");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout27);
    obj.label176:setLeft(610);
    obj.label176:setTop(30);
    obj.label176:setWidth(50);
    obj.label176:setHeight(25);
    obj.label176:setText("OBS");
    obj.label176:setName("label176");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout27);
    obj.edit222:setVertTextAlign("center");
    obj.edit222:setLeft(660);
    obj.edit222:setTop(30);
    obj.edit222:setWidth(200);
    obj.edit222:setHeight(25);
    obj.edit222:setField("obs5");
    obj.edit222:setName("edit222");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout27);
    obj.label177:setLeft(590);
    obj.label177:setTop(55);
    obj.label177:setWidth(80);
    obj.label177:setHeight(25);
    obj.label177:setText("MUNIÇÃO");
    obj.label177:setName("label177");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout27);
    obj.edit223:setType("number");
    obj.edit223:setVertTextAlign("center");
    obj.edit223:setLeft(660);
    obj.edit223:setTop(55);
    obj.edit223:setWidth(69);
    obj.edit223:setHeight(25);
    obj.edit223:setField("municao5");
    obj.edit223:setName("edit223");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout27);
    obj.label178:setLeft(735);
    obj.label178:setTop(55);
    obj.label178:setWidth(70);
    obj.label178:setHeight(25);
    obj.label178:setText("ALCANCE");
    obj.label178:setName("label178");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout27);
    obj.edit224:setVertTextAlign("center");
    obj.edit224:setLeft(795);
    obj.edit224:setTop(55);
    obj.edit224:setWidth(65);
    obj.edit224:setHeight(25);
    obj.edit224:setField("alcance5");
    obj.edit224:setName("edit224");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout27);
    obj.label179:setLeft(870);
    obj.label179:setTop(25);
    obj.label179:setWidth(330);
    obj.label179:setHeight(25);
    obj.label179:setHorzTextAlign("center");
    obj.label179:setText("Clique para adicionar imagem");
    obj.label179:setName("label179");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout27);
    obj.image6:setField("imagemArma5");
    obj.image6:setEditable(true);
    obj.image6:setStyle("autoFit");
    obj.image6:setLeft(870);
    obj.image6:setTop(5);
    obj.image6:setWidth(330);
    obj.image6:setHeight(75);
    obj.image6:setName("image6");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout22);
    obj.layout28:setLeft(2);
    obj.layout28:setTop(478);
    obj.layout28:setWidth(1207);
    obj.layout28:setHeight(92);
    obj.layout28:setName("layout28");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout28);
    obj.rectangle78:setAlign("client");
    obj.rectangle78:setColor("black");
    obj.rectangle78:setName("rectangle78");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout28);
    obj.rectangle79:setLeft(869);
    obj.rectangle79:setTop(4);
    obj.rectangle79:setWidth(332);
    obj.rectangle79:setHeight(77);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setName("rectangle79");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout28);
    obj.label180:setLeft(5);
    obj.label180:setTop(5);
    obj.label180:setWidth(50);
    obj.label180:setHeight(25);
    obj.label180:setText("NOME");
    obj.label180:setName("label180");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout28);
    obj.edit225:setVertTextAlign("center");
    obj.edit225:setLeft(55);
    obj.edit225:setTop(5);
    obj.edit225:setWidth(225);
    obj.edit225:setHeight(25);
    obj.edit225:setField("nome6");
    obj.edit225:setName("edit225");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout28);
    obj.label181:setLeft(5);
    obj.label181:setTop(30);
    obj.label181:setWidth(50);
    obj.label181:setHeight(25);
    obj.label181:setText("ARMA");
    obj.label181:setName("label181");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout28);
    obj.edit226:setVertTextAlign("center");
    obj.edit226:setLeft(55);
    obj.edit226:setTop(30);
    obj.edit226:setWidth(225);
    obj.edit226:setHeight(25);
    obj.edit226:setField("arma6");
    obj.edit226:setName("edit226");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout28);
    obj.label182:setLeft(5);
    obj.label182:setTop(55);
    obj.label182:setWidth(50);
    obj.label182:setHeight(25);
    obj.label182:setText("TIPO");
    obj.label182:setName("label182");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout28);
    obj.edit227:setVertTextAlign("center");
    obj.edit227:setLeft(55);
    obj.edit227:setTop(55);
    obj.edit227:setWidth(225);
    obj.edit227:setHeight(25);
    obj.edit227:setField("tipo6");
    obj.edit227:setName("edit227");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout28);
    obj.button30:setLeft(279);
    obj.button30:setTop(6);
    obj.button30:setWidth(73);
    obj.button30:setText("ATAQUE");
    obj.button30:setFontSize(11);
    obj.button30:setName("button30");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout28);
    obj.edit228:setType("number");
    obj.edit228:setVertTextAlign("center");
    obj.edit228:setLeft(352);
    obj.edit228:setTop(5);
    obj.edit228:setWidth(25);
    obj.edit228:setHeight(25);
    obj.edit228:setField("ataque6a");
    obj.edit228:setName("edit228");

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout28);
    obj.edit229:setType("number");
    obj.edit229:setVertTextAlign("center");
    obj.edit229:setLeft(380);
    obj.edit229:setTop(5);
    obj.edit229:setWidth(25);
    obj.edit229:setHeight(25);
    obj.edit229:setField("ataque6b");
    obj.edit229:setName("edit229");

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout28);
    obj.edit230:setType("number");
    obj.edit230:setVertTextAlign("center");
    obj.edit230:setLeft(409);
    obj.edit230:setTop(5);
    obj.edit230:setWidth(25);
    obj.edit230:setHeight(25);
    obj.edit230:setField("ataque6c");
    obj.edit230:setName("edit230");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout28);
    obj.edit231:setType("number");
    obj.edit231:setVertTextAlign("center");
    obj.edit231:setLeft(437);
    obj.edit231:setTop(5);
    obj.edit231:setWidth(25);
    obj.edit231:setHeight(25);
    obj.edit231:setField("ataque6d");
    obj.edit231:setName("edit231");

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout28);
    obj.edit232:setType("number");
    obj.edit232:setVertTextAlign("center");
    obj.edit232:setLeft(465);
    obj.edit232:setTop(5);
    obj.edit232:setWidth(25);
    obj.edit232:setHeight(25);
    obj.edit232:setField("ataque6e");
    obj.edit232:setName("edit232");

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout28);
    obj.edit233:setType("number");
    obj.edit233:setVertTextAlign("center");
    obj.edit233:setLeft(493);
    obj.edit233:setTop(5);
    obj.edit233:setWidth(25);
    obj.edit233:setHeight(25);
    obj.edit233:setField("ataque6f");
    obj.edit233:setName("edit233");

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout28);
    obj.edit234:setType("number");
    obj.edit234:setVertTextAlign("center");
    obj.edit234:setLeft(522);
    obj.edit234:setTop(5);
    obj.edit234:setWidth(25);
    obj.edit234:setHeight(25);
    obj.edit234:setField("ataque6g");
    obj.edit234:setName("edit234");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout28);
    obj.edit235:setType("number");
    obj.edit235:setVertTextAlign("center");
    obj.edit235:setLeft(550);
    obj.edit235:setTop(5);
    obj.edit235:setWidth(25);
    obj.edit235:setHeight(25);
    obj.edit235:setField("ataque6h");
    obj.edit235:setName("edit235");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout28);
    obj.button31:setLeft(279);
    obj.button31:setTop(31);
    obj.button31:setWidth(73);
    obj.button31:setText("DANO");
    obj.button31:setFontSize(11);
    obj.button31:setName("button31");

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout28);
    obj.edit236:setVertTextAlign("center");
    obj.edit236:setLeft(352);
    obj.edit236:setTop(30);
    obj.edit236:setWidth(82);
    obj.edit236:setHeight(25);
    obj.edit236:setField("dano6");
    obj.edit236:setName("edit236");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout28);
    obj.button32:setLeft(434);
    obj.button32:setTop(31);
    obj.button32:setWidth(60);
    obj.button32:setText("CRITICO");
    obj.button32:setFontSize(11);
    obj.button32:setName("button32");

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout28);
    obj.edit237:setVertTextAlign("center");
    obj.edit237:setLeft(493);
    obj.edit237:setTop(30);
    obj.edit237:setWidth(82);
    obj.edit237:setHeight(25);
    obj.edit237:setField("danoCritico6");
    obj.edit237:setName("edit237");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout28);
    obj.label183:setLeft(290);
    obj.label183:setTop(55);
    obj.label183:setWidth(70);
    obj.label183:setHeight(25);
    obj.label183:setText("DECISIVO");
    obj.label183:setName("label183");

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout28);
    obj.edit238:setVertTextAlign("center");
    obj.edit238:setLeft(352);
    obj.edit238:setTop(55);
    obj.edit238:setWidth(82);
    obj.edit238:setHeight(25);
    obj.edit238:setField("decisivo6");
    obj.edit238:setName("edit238");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout28);
    obj.label184:setLeft(445);
    obj.label184:setTop(55);
    obj.label184:setWidth(50);
    obj.label184:setHeight(25);
    obj.label184:setText("MULTI");
    obj.label184:setName("label184");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout28);
    obj.edit239:setVertTextAlign("center");
    obj.edit239:setLeft(493);
    obj.edit239:setTop(55);
    obj.edit239:setWidth(82);
    obj.edit239:setHeight(25);
    obj.edit239:setField("multiplicador6");
    obj.edit239:setName("edit239");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout28);
    obj.label185:setLeft(580);
    obj.label185:setTop(5);
    obj.label185:setWidth(80);
    obj.label185:setHeight(25);
    obj.label185:setText("CATEGORIA");
    obj.label185:setName("label185");

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout28);
    obj.edit240:setVertTextAlign("center");
    obj.edit240:setLeft(660);
    obj.edit240:setTop(5);
    obj.edit240:setWidth(200);
    obj.edit240:setHeight(25);
    obj.edit240:setField("categoria6");
    obj.edit240:setName("edit240");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout28);
    obj.label186:setLeft(610);
    obj.label186:setTop(30);
    obj.label186:setWidth(50);
    obj.label186:setHeight(25);
    obj.label186:setText("OBS");
    obj.label186:setName("label186");

    obj.edit241 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout28);
    obj.edit241:setVertTextAlign("center");
    obj.edit241:setLeft(660);
    obj.edit241:setTop(30);
    obj.edit241:setWidth(200);
    obj.edit241:setHeight(25);
    obj.edit241:setField("obs6");
    obj.edit241:setName("edit241");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout28);
    obj.label187:setLeft(590);
    obj.label187:setTop(55);
    obj.label187:setWidth(80);
    obj.label187:setHeight(25);
    obj.label187:setText("MUNIÇÃO");
    obj.label187:setName("label187");

    obj.edit242 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout28);
    obj.edit242:setType("number");
    obj.edit242:setVertTextAlign("center");
    obj.edit242:setLeft(660);
    obj.edit242:setTop(55);
    obj.edit242:setWidth(69);
    obj.edit242:setHeight(25);
    obj.edit242:setField("municao6");
    obj.edit242:setName("edit242");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout28);
    obj.label188:setLeft(735);
    obj.label188:setTop(55);
    obj.label188:setWidth(70);
    obj.label188:setHeight(25);
    obj.label188:setText("ALCANCE");
    obj.label188:setName("label188");

    obj.edit243 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout28);
    obj.edit243:setVertTextAlign("center");
    obj.edit243:setLeft(795);
    obj.edit243:setTop(55);
    obj.edit243:setWidth(65);
    obj.edit243:setHeight(25);
    obj.edit243:setField("alcance6");
    obj.edit243:setName("edit243");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout28);
    obj.label189:setLeft(870);
    obj.label189:setTop(25);
    obj.label189:setWidth(330);
    obj.label189:setHeight(25);
    obj.label189:setHorzTextAlign("center");
    obj.label189:setText("Clique para adicionar imagem");
    obj.label189:setName("label189");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout28);
    obj.image7:setField("imagemArma6");
    obj.image7:setEditable(true);
    obj.image7:setStyle("autoFit");
    obj.image7:setLeft(870);
    obj.image7:setTop(5);
    obj.image7:setWidth(330);
    obj.image7:setHeight(75);
    obj.image7:setName("image7");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout22);
    obj.layout29:setLeft(2);
    obj.layout29:setTop(573);
    obj.layout29:setWidth(1207);
    obj.layout29:setHeight(92);
    obj.layout29:setName("layout29");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout29);
    obj.rectangle80:setAlign("client");
    obj.rectangle80:setColor("black");
    obj.rectangle80:setName("rectangle80");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout29);
    obj.rectangle81:setLeft(869);
    obj.rectangle81:setTop(4);
    obj.rectangle81:setWidth(332);
    obj.rectangle81:setHeight(77);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout29);
    obj.label190:setLeft(5);
    obj.label190:setTop(5);
    obj.label190:setWidth(50);
    obj.label190:setHeight(25);
    obj.label190:setText("NOME");
    obj.label190:setName("label190");

    obj.edit244 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout29);
    obj.edit244:setVertTextAlign("center");
    obj.edit244:setLeft(55);
    obj.edit244:setTop(5);
    obj.edit244:setWidth(225);
    obj.edit244:setHeight(25);
    obj.edit244:setField("nome7");
    obj.edit244:setName("edit244");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout29);
    obj.label191:setLeft(5);
    obj.label191:setTop(30);
    obj.label191:setWidth(50);
    obj.label191:setHeight(25);
    obj.label191:setText("ARMA");
    obj.label191:setName("label191");

    obj.edit245 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout29);
    obj.edit245:setVertTextAlign("center");
    obj.edit245:setLeft(55);
    obj.edit245:setTop(30);
    obj.edit245:setWidth(225);
    obj.edit245:setHeight(25);
    obj.edit245:setField("arma7");
    obj.edit245:setName("edit245");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout29);
    obj.label192:setLeft(5);
    obj.label192:setTop(55);
    obj.label192:setWidth(50);
    obj.label192:setHeight(25);
    obj.label192:setText("TIPO");
    obj.label192:setName("label192");

    obj.edit246 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout29);
    obj.edit246:setVertTextAlign("center");
    obj.edit246:setLeft(55);
    obj.edit246:setTop(55);
    obj.edit246:setWidth(225);
    obj.edit246:setHeight(25);
    obj.edit246:setField("tipo7");
    obj.edit246:setName("edit246");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout29);
    obj.button33:setLeft(279);
    obj.button33:setTop(6);
    obj.button33:setWidth(73);
    obj.button33:setText("ATAQUE");
    obj.button33:setFontSize(11);
    obj.button33:setName("button33");

    obj.edit247 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout29);
    obj.edit247:setType("number");
    obj.edit247:setVertTextAlign("center");
    obj.edit247:setLeft(352);
    obj.edit247:setTop(5);
    obj.edit247:setWidth(25);
    obj.edit247:setHeight(25);
    obj.edit247:setField("ataque7a");
    obj.edit247:setName("edit247");

    obj.edit248 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout29);
    obj.edit248:setType("number");
    obj.edit248:setVertTextAlign("center");
    obj.edit248:setLeft(380);
    obj.edit248:setTop(5);
    obj.edit248:setWidth(25);
    obj.edit248:setHeight(25);
    obj.edit248:setField("ataque7b");
    obj.edit248:setName("edit248");

    obj.edit249 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout29);
    obj.edit249:setType("number");
    obj.edit249:setVertTextAlign("center");
    obj.edit249:setLeft(409);
    obj.edit249:setTop(5);
    obj.edit249:setWidth(25);
    obj.edit249:setHeight(25);
    obj.edit249:setField("ataque7c");
    obj.edit249:setName("edit249");

    obj.edit250 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout29);
    obj.edit250:setType("number");
    obj.edit250:setVertTextAlign("center");
    obj.edit250:setLeft(437);
    obj.edit250:setTop(5);
    obj.edit250:setWidth(25);
    obj.edit250:setHeight(25);
    obj.edit250:setField("ataque7d");
    obj.edit250:setName("edit250");

    obj.edit251 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout29);
    obj.edit251:setType("number");
    obj.edit251:setVertTextAlign("center");
    obj.edit251:setLeft(465);
    obj.edit251:setTop(5);
    obj.edit251:setWidth(25);
    obj.edit251:setHeight(25);
    obj.edit251:setField("ataque7e");
    obj.edit251:setName("edit251");

    obj.edit252 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout29);
    obj.edit252:setType("number");
    obj.edit252:setVertTextAlign("center");
    obj.edit252:setLeft(493);
    obj.edit252:setTop(5);
    obj.edit252:setWidth(25);
    obj.edit252:setHeight(25);
    obj.edit252:setField("ataque7f");
    obj.edit252:setName("edit252");

    obj.edit253 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout29);
    obj.edit253:setType("number");
    obj.edit253:setVertTextAlign("center");
    obj.edit253:setLeft(522);
    obj.edit253:setTop(5);
    obj.edit253:setWidth(25);
    obj.edit253:setHeight(25);
    obj.edit253:setField("ataque7g");
    obj.edit253:setName("edit253");

    obj.edit254 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout29);
    obj.edit254:setType("number");
    obj.edit254:setVertTextAlign("center");
    obj.edit254:setLeft(550);
    obj.edit254:setTop(5);
    obj.edit254:setWidth(25);
    obj.edit254:setHeight(25);
    obj.edit254:setField("ataque7h");
    obj.edit254:setName("edit254");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout29);
    obj.button34:setLeft(279);
    obj.button34:setTop(31);
    obj.button34:setWidth(73);
    obj.button34:setText("DANO");
    obj.button34:setFontSize(11);
    obj.button34:setName("button34");

    obj.edit255 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout29);
    obj.edit255:setVertTextAlign("center");
    obj.edit255:setLeft(352);
    obj.edit255:setTop(30);
    obj.edit255:setWidth(82);
    obj.edit255:setHeight(25);
    obj.edit255:setField("dano7");
    obj.edit255:setName("edit255");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout29);
    obj.button35:setLeft(434);
    obj.button35:setTop(31);
    obj.button35:setWidth(60);
    obj.button35:setText("CRITICO");
    obj.button35:setFontSize(11);
    obj.button35:setName("button35");

    obj.edit256 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout29);
    obj.edit256:setVertTextAlign("center");
    obj.edit256:setLeft(493);
    obj.edit256:setTop(30);
    obj.edit256:setWidth(82);
    obj.edit256:setHeight(25);
    obj.edit256:setField("danoCritico7");
    obj.edit256:setName("edit256");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout29);
    obj.label193:setLeft(290);
    obj.label193:setTop(55);
    obj.label193:setWidth(70);
    obj.label193:setHeight(25);
    obj.label193:setText("DECISIVO");
    obj.label193:setName("label193");

    obj.edit257 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout29);
    obj.edit257:setVertTextAlign("center");
    obj.edit257:setLeft(352);
    obj.edit257:setTop(55);
    obj.edit257:setWidth(82);
    obj.edit257:setHeight(25);
    obj.edit257:setField("decisivo7");
    obj.edit257:setName("edit257");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout29);
    obj.label194:setLeft(445);
    obj.label194:setTop(55);
    obj.label194:setWidth(50);
    obj.label194:setHeight(25);
    obj.label194:setText("MULTI");
    obj.label194:setName("label194");

    obj.edit258 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout29);
    obj.edit258:setVertTextAlign("center");
    obj.edit258:setLeft(493);
    obj.edit258:setTop(55);
    obj.edit258:setWidth(82);
    obj.edit258:setHeight(25);
    obj.edit258:setField("multiplicador7");
    obj.edit258:setName("edit258");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout29);
    obj.label195:setLeft(580);
    obj.label195:setTop(5);
    obj.label195:setWidth(80);
    obj.label195:setHeight(25);
    obj.label195:setText("CATEGORIA");
    obj.label195:setName("label195");

    obj.edit259 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout29);
    obj.edit259:setVertTextAlign("center");
    obj.edit259:setLeft(660);
    obj.edit259:setTop(5);
    obj.edit259:setWidth(200);
    obj.edit259:setHeight(25);
    obj.edit259:setField("categoria7");
    obj.edit259:setName("edit259");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout29);
    obj.label196:setLeft(610);
    obj.label196:setTop(30);
    obj.label196:setWidth(50);
    obj.label196:setHeight(25);
    obj.label196:setText("OBS");
    obj.label196:setName("label196");

    obj.edit260 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout29);
    obj.edit260:setVertTextAlign("center");
    obj.edit260:setLeft(660);
    obj.edit260:setTop(30);
    obj.edit260:setWidth(200);
    obj.edit260:setHeight(25);
    obj.edit260:setField("obs7");
    obj.edit260:setName("edit260");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout29);
    obj.label197:setLeft(590);
    obj.label197:setTop(55);
    obj.label197:setWidth(80);
    obj.label197:setHeight(25);
    obj.label197:setText("MUNIÇÃO");
    obj.label197:setName("label197");

    obj.edit261 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout29);
    obj.edit261:setType("number");
    obj.edit261:setVertTextAlign("center");
    obj.edit261:setLeft(660);
    obj.edit261:setTop(55);
    obj.edit261:setWidth(69);
    obj.edit261:setHeight(25);
    obj.edit261:setField("municao7");
    obj.edit261:setName("edit261");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout29);
    obj.label198:setLeft(735);
    obj.label198:setTop(55);
    obj.label198:setWidth(70);
    obj.label198:setHeight(25);
    obj.label198:setText("ALCANCE");
    obj.label198:setName("label198");

    obj.edit262 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout29);
    obj.edit262:setVertTextAlign("center");
    obj.edit262:setLeft(795);
    obj.edit262:setTop(55);
    obj.edit262:setWidth(65);
    obj.edit262:setHeight(25);
    obj.edit262:setField("alcance7");
    obj.edit262:setName("edit262");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout29);
    obj.label199:setLeft(870);
    obj.label199:setTop(25);
    obj.label199:setWidth(330);
    obj.label199:setHeight(25);
    obj.label199:setHorzTextAlign("center");
    obj.label199:setText("Clique para adicionar imagem");
    obj.label199:setName("label199");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout29);
    obj.image8:setField("imagemArma7");
    obj.image8:setEditable(true);
    obj.image8:setStyle("autoFit");
    obj.image8:setLeft(870);
    obj.image8:setTop(5);
    obj.image8:setWidth(330);
    obj.image8:setHeight(75);
    obj.image8:setName("image8");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout22);
    obj.layout30:setLeft(2);
    obj.layout30:setTop(668);
    obj.layout30:setWidth(1207);
    obj.layout30:setHeight(92);
    obj.layout30:setName("layout30");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout30);
    obj.rectangle82:setAlign("client");
    obj.rectangle82:setColor("black");
    obj.rectangle82:setName("rectangle82");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout30);
    obj.rectangle83:setLeft(869);
    obj.rectangle83:setTop(4);
    obj.rectangle83:setWidth(332);
    obj.rectangle83:setHeight(77);
    obj.rectangle83:setColor("black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout30);
    obj.label200:setLeft(5);
    obj.label200:setTop(5);
    obj.label200:setWidth(50);
    obj.label200:setHeight(25);
    obj.label200:setText("NOME");
    obj.label200:setName("label200");

    obj.edit263 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout30);
    obj.edit263:setVertTextAlign("center");
    obj.edit263:setLeft(55);
    obj.edit263:setTop(5);
    obj.edit263:setWidth(225);
    obj.edit263:setHeight(25);
    obj.edit263:setField("nome8");
    obj.edit263:setName("edit263");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout30);
    obj.label201:setLeft(5);
    obj.label201:setTop(30);
    obj.label201:setWidth(50);
    obj.label201:setHeight(25);
    obj.label201:setText("ARMA");
    obj.label201:setName("label201");

    obj.edit264 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout30);
    obj.edit264:setVertTextAlign("center");
    obj.edit264:setLeft(55);
    obj.edit264:setTop(30);
    obj.edit264:setWidth(225);
    obj.edit264:setHeight(25);
    obj.edit264:setField("arma8");
    obj.edit264:setName("edit264");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout30);
    obj.label202:setLeft(5);
    obj.label202:setTop(55);
    obj.label202:setWidth(50);
    obj.label202:setHeight(25);
    obj.label202:setText("TIPO");
    obj.label202:setName("label202");

    obj.edit265 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout30);
    obj.edit265:setVertTextAlign("center");
    obj.edit265:setLeft(55);
    obj.edit265:setTop(55);
    obj.edit265:setWidth(225);
    obj.edit265:setHeight(25);
    obj.edit265:setField("tipo8");
    obj.edit265:setName("edit265");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout30);
    obj.button36:setLeft(279);
    obj.button36:setTop(6);
    obj.button36:setWidth(73);
    obj.button36:setText("ATAQUE");
    obj.button36:setFontSize(11);
    obj.button36:setName("button36");

    obj.edit266 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout30);
    obj.edit266:setType("number");
    obj.edit266:setVertTextAlign("center");
    obj.edit266:setLeft(352);
    obj.edit266:setTop(5);
    obj.edit266:setWidth(25);
    obj.edit266:setHeight(25);
    obj.edit266:setField("ataque8a");
    obj.edit266:setName("edit266");

    obj.edit267 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout30);
    obj.edit267:setType("number");
    obj.edit267:setVertTextAlign("center");
    obj.edit267:setLeft(380);
    obj.edit267:setTop(5);
    obj.edit267:setWidth(25);
    obj.edit267:setHeight(25);
    obj.edit267:setField("ataque8b");
    obj.edit267:setName("edit267");

    obj.edit268 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout30);
    obj.edit268:setType("number");
    obj.edit268:setVertTextAlign("center");
    obj.edit268:setLeft(409);
    obj.edit268:setTop(5);
    obj.edit268:setWidth(25);
    obj.edit268:setHeight(25);
    obj.edit268:setField("ataque8c");
    obj.edit268:setName("edit268");

    obj.edit269 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout30);
    obj.edit269:setType("number");
    obj.edit269:setVertTextAlign("center");
    obj.edit269:setLeft(437);
    obj.edit269:setTop(5);
    obj.edit269:setWidth(25);
    obj.edit269:setHeight(25);
    obj.edit269:setField("ataque8d");
    obj.edit269:setName("edit269");

    obj.edit270 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout30);
    obj.edit270:setType("number");
    obj.edit270:setVertTextAlign("center");
    obj.edit270:setLeft(465);
    obj.edit270:setTop(5);
    obj.edit270:setWidth(25);
    obj.edit270:setHeight(25);
    obj.edit270:setField("ataque8e");
    obj.edit270:setName("edit270");

    obj.edit271 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout30);
    obj.edit271:setType("number");
    obj.edit271:setVertTextAlign("center");
    obj.edit271:setLeft(493);
    obj.edit271:setTop(5);
    obj.edit271:setWidth(25);
    obj.edit271:setHeight(25);
    obj.edit271:setField("ataque8f");
    obj.edit271:setName("edit271");

    obj.edit272 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout30);
    obj.edit272:setType("number");
    obj.edit272:setVertTextAlign("center");
    obj.edit272:setLeft(522);
    obj.edit272:setTop(5);
    obj.edit272:setWidth(25);
    obj.edit272:setHeight(25);
    obj.edit272:setField("ataque8g");
    obj.edit272:setName("edit272");

    obj.edit273 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout30);
    obj.edit273:setType("number");
    obj.edit273:setVertTextAlign("center");
    obj.edit273:setLeft(550);
    obj.edit273:setTop(5);
    obj.edit273:setWidth(25);
    obj.edit273:setHeight(25);
    obj.edit273:setField("ataque8h");
    obj.edit273:setName("edit273");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout30);
    obj.button37:setLeft(279);
    obj.button37:setTop(31);
    obj.button37:setWidth(73);
    obj.button37:setText("DANO");
    obj.button37:setFontSize(11);
    obj.button37:setName("button37");

    obj.edit274 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout30);
    obj.edit274:setVertTextAlign("center");
    obj.edit274:setLeft(352);
    obj.edit274:setTop(30);
    obj.edit274:setWidth(82);
    obj.edit274:setHeight(25);
    obj.edit274:setField("dano8");
    obj.edit274:setName("edit274");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout30);
    obj.button38:setLeft(434);
    obj.button38:setTop(31);
    obj.button38:setWidth(60);
    obj.button38:setText("CRITICO");
    obj.button38:setFontSize(11);
    obj.button38:setName("button38");

    obj.edit275 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout30);
    obj.edit275:setVertTextAlign("center");
    obj.edit275:setLeft(493);
    obj.edit275:setTop(30);
    obj.edit275:setWidth(82);
    obj.edit275:setHeight(25);
    obj.edit275:setField("danoCritico8");
    obj.edit275:setName("edit275");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout30);
    obj.label203:setLeft(290);
    obj.label203:setTop(55);
    obj.label203:setWidth(70);
    obj.label203:setHeight(25);
    obj.label203:setText("DECISIVO");
    obj.label203:setName("label203");

    obj.edit276 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout30);
    obj.edit276:setVertTextAlign("center");
    obj.edit276:setLeft(352);
    obj.edit276:setTop(55);
    obj.edit276:setWidth(82);
    obj.edit276:setHeight(25);
    obj.edit276:setField("decisivo8");
    obj.edit276:setName("edit276");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout30);
    obj.label204:setLeft(445);
    obj.label204:setTop(55);
    obj.label204:setWidth(50);
    obj.label204:setHeight(25);
    obj.label204:setText("MULTI");
    obj.label204:setName("label204");

    obj.edit277 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout30);
    obj.edit277:setVertTextAlign("center");
    obj.edit277:setLeft(493);
    obj.edit277:setTop(55);
    obj.edit277:setWidth(82);
    obj.edit277:setHeight(25);
    obj.edit277:setField("multiplicador8");
    obj.edit277:setName("edit277");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout30);
    obj.label205:setLeft(580);
    obj.label205:setTop(5);
    obj.label205:setWidth(80);
    obj.label205:setHeight(25);
    obj.label205:setText("CATEGORIA");
    obj.label205:setName("label205");

    obj.edit278 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout30);
    obj.edit278:setVertTextAlign("center");
    obj.edit278:setLeft(660);
    obj.edit278:setTop(5);
    obj.edit278:setWidth(200);
    obj.edit278:setHeight(25);
    obj.edit278:setField("categoria8");
    obj.edit278:setName("edit278");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout30);
    obj.label206:setLeft(610);
    obj.label206:setTop(30);
    obj.label206:setWidth(50);
    obj.label206:setHeight(25);
    obj.label206:setText("OBS");
    obj.label206:setName("label206");

    obj.edit279 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout30);
    obj.edit279:setVertTextAlign("center");
    obj.edit279:setLeft(660);
    obj.edit279:setTop(30);
    obj.edit279:setWidth(200);
    obj.edit279:setHeight(25);
    obj.edit279:setField("obs8");
    obj.edit279:setName("edit279");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout30);
    obj.label207:setLeft(590);
    obj.label207:setTop(55);
    obj.label207:setWidth(80);
    obj.label207:setHeight(25);
    obj.label207:setText("MUNIÇÃO");
    obj.label207:setName("label207");

    obj.edit280 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout30);
    obj.edit280:setType("number");
    obj.edit280:setVertTextAlign("center");
    obj.edit280:setLeft(660);
    obj.edit280:setTop(55);
    obj.edit280:setWidth(69);
    obj.edit280:setHeight(25);
    obj.edit280:setField("municao8");
    obj.edit280:setName("edit280");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout30);
    obj.label208:setLeft(735);
    obj.label208:setTop(55);
    obj.label208:setWidth(70);
    obj.label208:setHeight(25);
    obj.label208:setText("ALCANCE");
    obj.label208:setName("label208");

    obj.edit281 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout30);
    obj.edit281:setVertTextAlign("center");
    obj.edit281:setLeft(795);
    obj.edit281:setTop(55);
    obj.edit281:setWidth(65);
    obj.edit281:setHeight(25);
    obj.edit281:setField("alcance8");
    obj.edit281:setName("edit281");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout30);
    obj.label209:setLeft(870);
    obj.label209:setTop(25);
    obj.label209:setWidth(330);
    obj.label209:setHeight(25);
    obj.label209:setHorzTextAlign("center");
    obj.label209:setText("Clique para adicionar imagem");
    obj.label209:setName("label209");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout30);
    obj.image9:setField("imagemArma8");
    obj.image9:setEditable(true);
    obj.image9:setStyle("autoFit");
    obj.image9:setLeft(870);
    obj.image9:setTop(5);
    obj.image9:setWidth(330);
    obj.image9:setHeight(75);
    obj.image9:setName("image9");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout22);
    obj.layout31:setLeft(2);
    obj.layout31:setTop(763);
    obj.layout31:setWidth(1207);
    obj.layout31:setHeight(92);
    obj.layout31:setName("layout31");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout31);
    obj.rectangle84:setAlign("client");
    obj.rectangle84:setColor("black");
    obj.rectangle84:setName("rectangle84");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout31);
    obj.rectangle85:setLeft(869);
    obj.rectangle85:setTop(4);
    obj.rectangle85:setWidth(332);
    obj.rectangle85:setHeight(77);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout31);
    obj.label210:setLeft(5);
    obj.label210:setTop(5);
    obj.label210:setWidth(50);
    obj.label210:setHeight(25);
    obj.label210:setText("NOME");
    obj.label210:setName("label210");

    obj.edit282 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout31);
    obj.edit282:setVertTextAlign("center");
    obj.edit282:setLeft(55);
    obj.edit282:setTop(5);
    obj.edit282:setWidth(225);
    obj.edit282:setHeight(25);
    obj.edit282:setField("nome9");
    obj.edit282:setName("edit282");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout31);
    obj.label211:setLeft(5);
    obj.label211:setTop(30);
    obj.label211:setWidth(50);
    obj.label211:setHeight(25);
    obj.label211:setText("ARMA");
    obj.label211:setName("label211");

    obj.edit283 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout31);
    obj.edit283:setVertTextAlign("center");
    obj.edit283:setLeft(55);
    obj.edit283:setTop(30);
    obj.edit283:setWidth(225);
    obj.edit283:setHeight(25);
    obj.edit283:setField("arma9");
    obj.edit283:setName("edit283");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout31);
    obj.label212:setLeft(5);
    obj.label212:setTop(55);
    obj.label212:setWidth(50);
    obj.label212:setHeight(25);
    obj.label212:setText("TIPO");
    obj.label212:setName("label212");

    obj.edit284 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout31);
    obj.edit284:setVertTextAlign("center");
    obj.edit284:setLeft(55);
    obj.edit284:setTop(55);
    obj.edit284:setWidth(225);
    obj.edit284:setHeight(25);
    obj.edit284:setField("tipo9");
    obj.edit284:setName("edit284");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout31);
    obj.button39:setLeft(279);
    obj.button39:setTop(6);
    obj.button39:setWidth(73);
    obj.button39:setText("ATAQUE");
    obj.button39:setFontSize(11);
    obj.button39:setName("button39");

    obj.edit285 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout31);
    obj.edit285:setType("number");
    obj.edit285:setVertTextAlign("center");
    obj.edit285:setLeft(352);
    obj.edit285:setTop(5);
    obj.edit285:setWidth(25);
    obj.edit285:setHeight(25);
    obj.edit285:setField("ataque9a");
    obj.edit285:setName("edit285");

    obj.edit286 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout31);
    obj.edit286:setType("number");
    obj.edit286:setVertTextAlign("center");
    obj.edit286:setLeft(380);
    obj.edit286:setTop(5);
    obj.edit286:setWidth(25);
    obj.edit286:setHeight(25);
    obj.edit286:setField("ataque9b");
    obj.edit286:setName("edit286");

    obj.edit287 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout31);
    obj.edit287:setType("number");
    obj.edit287:setVertTextAlign("center");
    obj.edit287:setLeft(409);
    obj.edit287:setTop(5);
    obj.edit287:setWidth(25);
    obj.edit287:setHeight(25);
    obj.edit287:setField("ataque9c");
    obj.edit287:setName("edit287");

    obj.edit288 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout31);
    obj.edit288:setType("number");
    obj.edit288:setVertTextAlign("center");
    obj.edit288:setLeft(437);
    obj.edit288:setTop(5);
    obj.edit288:setWidth(25);
    obj.edit288:setHeight(25);
    obj.edit288:setField("ataque9d");
    obj.edit288:setName("edit288");

    obj.edit289 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout31);
    obj.edit289:setType("number");
    obj.edit289:setVertTextAlign("center");
    obj.edit289:setLeft(465);
    obj.edit289:setTop(5);
    obj.edit289:setWidth(25);
    obj.edit289:setHeight(25);
    obj.edit289:setField("ataque9e");
    obj.edit289:setName("edit289");

    obj.edit290 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout31);
    obj.edit290:setType("number");
    obj.edit290:setVertTextAlign("center");
    obj.edit290:setLeft(493);
    obj.edit290:setTop(5);
    obj.edit290:setWidth(25);
    obj.edit290:setHeight(25);
    obj.edit290:setField("ataque9f");
    obj.edit290:setName("edit290");

    obj.edit291 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout31);
    obj.edit291:setType("number");
    obj.edit291:setVertTextAlign("center");
    obj.edit291:setLeft(522);
    obj.edit291:setTop(5);
    obj.edit291:setWidth(25);
    obj.edit291:setHeight(25);
    obj.edit291:setField("ataque9g");
    obj.edit291:setName("edit291");

    obj.edit292 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout31);
    obj.edit292:setType("number");
    obj.edit292:setVertTextAlign("center");
    obj.edit292:setLeft(550);
    obj.edit292:setTop(5);
    obj.edit292:setWidth(25);
    obj.edit292:setHeight(25);
    obj.edit292:setField("ataque9h");
    obj.edit292:setName("edit292");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout31);
    obj.button40:setLeft(279);
    obj.button40:setTop(31);
    obj.button40:setWidth(73);
    obj.button40:setText("DANO");
    obj.button40:setFontSize(11);
    obj.button40:setName("button40");

    obj.edit293 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout31);
    obj.edit293:setVertTextAlign("center");
    obj.edit293:setLeft(352);
    obj.edit293:setTop(30);
    obj.edit293:setWidth(82);
    obj.edit293:setHeight(25);
    obj.edit293:setField("dano9");
    obj.edit293:setName("edit293");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout31);
    obj.button41:setLeft(434);
    obj.button41:setTop(31);
    obj.button41:setWidth(60);
    obj.button41:setText("CRITICO");
    obj.button41:setFontSize(11);
    obj.button41:setName("button41");

    obj.edit294 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout31);
    obj.edit294:setVertTextAlign("center");
    obj.edit294:setLeft(493);
    obj.edit294:setTop(30);
    obj.edit294:setWidth(82);
    obj.edit294:setHeight(25);
    obj.edit294:setField("danoCritico9");
    obj.edit294:setName("edit294");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout31);
    obj.label213:setLeft(290);
    obj.label213:setTop(55);
    obj.label213:setWidth(70);
    obj.label213:setHeight(25);
    obj.label213:setText("DECISIVO");
    obj.label213:setName("label213");

    obj.edit295 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout31);
    obj.edit295:setVertTextAlign("center");
    obj.edit295:setLeft(352);
    obj.edit295:setTop(55);
    obj.edit295:setWidth(82);
    obj.edit295:setHeight(25);
    obj.edit295:setField("decisivo9");
    obj.edit295:setName("edit295");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout31);
    obj.label214:setLeft(445);
    obj.label214:setTop(55);
    obj.label214:setWidth(50);
    obj.label214:setHeight(25);
    obj.label214:setText("MULTI");
    obj.label214:setName("label214");

    obj.edit296 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout31);
    obj.edit296:setVertTextAlign("center");
    obj.edit296:setLeft(493);
    obj.edit296:setTop(55);
    obj.edit296:setWidth(82);
    obj.edit296:setHeight(25);
    obj.edit296:setField("multiplicador9");
    obj.edit296:setName("edit296");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout31);
    obj.label215:setLeft(580);
    obj.label215:setTop(5);
    obj.label215:setWidth(80);
    obj.label215:setHeight(25);
    obj.label215:setText("CATEGORIA");
    obj.label215:setName("label215");

    obj.edit297 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout31);
    obj.edit297:setVertTextAlign("center");
    obj.edit297:setLeft(660);
    obj.edit297:setTop(5);
    obj.edit297:setWidth(200);
    obj.edit297:setHeight(25);
    obj.edit297:setField("categoria9");
    obj.edit297:setName("edit297");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout31);
    obj.label216:setLeft(610);
    obj.label216:setTop(30);
    obj.label216:setWidth(50);
    obj.label216:setHeight(25);
    obj.label216:setText("OBS");
    obj.label216:setName("label216");

    obj.edit298 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout31);
    obj.edit298:setVertTextAlign("center");
    obj.edit298:setLeft(660);
    obj.edit298:setTop(30);
    obj.edit298:setWidth(200);
    obj.edit298:setHeight(25);
    obj.edit298:setField("obs9");
    obj.edit298:setName("edit298");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout31);
    obj.label217:setLeft(590);
    obj.label217:setTop(55);
    obj.label217:setWidth(80);
    obj.label217:setHeight(25);
    obj.label217:setText("MUNIÇÃO");
    obj.label217:setName("label217");

    obj.edit299 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout31);
    obj.edit299:setType("number");
    obj.edit299:setVertTextAlign("center");
    obj.edit299:setLeft(660);
    obj.edit299:setTop(55);
    obj.edit299:setWidth(69);
    obj.edit299:setHeight(25);
    obj.edit299:setField("municao9");
    obj.edit299:setName("edit299");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout31);
    obj.label218:setLeft(735);
    obj.label218:setTop(55);
    obj.label218:setWidth(70);
    obj.label218:setHeight(25);
    obj.label218:setText("ALCANCE");
    obj.label218:setName("label218");

    obj.edit300 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout31);
    obj.edit300:setVertTextAlign("center");
    obj.edit300:setLeft(795);
    obj.edit300:setTop(55);
    obj.edit300:setWidth(65);
    obj.edit300:setHeight(25);
    obj.edit300:setField("alcance9");
    obj.edit300:setName("edit300");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout31);
    obj.label219:setLeft(870);
    obj.label219:setTop(25);
    obj.label219:setWidth(330);
    obj.label219:setHeight(25);
    obj.label219:setHorzTextAlign("center");
    obj.label219:setText("Clique para adicionar imagem");
    obj.label219:setName("label219");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout31);
    obj.image10:setField("imagemArma9");
    obj.image10:setEditable(true);
    obj.image10:setStyle("autoFit");
    obj.image10:setLeft(870);
    obj.image10:setTop(5);
    obj.image10:setWidth(330);
    obj.image10:setHeight(75);
    obj.image10:setName("image10");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout22);
    obj.layout32:setLeft(2);
    obj.layout32:setTop(858);
    obj.layout32:setWidth(1207);
    obj.layout32:setHeight(92);
    obj.layout32:setName("layout32");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout32);
    obj.rectangle86:setAlign("client");
    obj.rectangle86:setColor("black");
    obj.rectangle86:setName("rectangle86");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout32);
    obj.rectangle87:setLeft(869);
    obj.rectangle87:setTop(4);
    obj.rectangle87:setWidth(332);
    obj.rectangle87:setHeight(77);
    obj.rectangle87:setColor("black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout32);
    obj.label220:setLeft(5);
    obj.label220:setTop(5);
    obj.label220:setWidth(50);
    obj.label220:setHeight(25);
    obj.label220:setText("NOME");
    obj.label220:setName("label220");

    obj.edit301 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout32);
    obj.edit301:setVertTextAlign("center");
    obj.edit301:setLeft(55);
    obj.edit301:setTop(5);
    obj.edit301:setWidth(225);
    obj.edit301:setHeight(25);
    obj.edit301:setField("nome10");
    obj.edit301:setName("edit301");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout32);
    obj.label221:setLeft(5);
    obj.label221:setTop(30);
    obj.label221:setWidth(50);
    obj.label221:setHeight(25);
    obj.label221:setText("ARMA");
    obj.label221:setName("label221");

    obj.edit302 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout32);
    obj.edit302:setVertTextAlign("center");
    obj.edit302:setLeft(55);
    obj.edit302:setTop(30);
    obj.edit302:setWidth(225);
    obj.edit302:setHeight(25);
    obj.edit302:setField("arma10");
    obj.edit302:setName("edit302");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout32);
    obj.label222:setLeft(5);
    obj.label222:setTop(55);
    obj.label222:setWidth(50);
    obj.label222:setHeight(25);
    obj.label222:setText("TIPO");
    obj.label222:setName("label222");

    obj.edit303 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout32);
    obj.edit303:setVertTextAlign("center");
    obj.edit303:setLeft(55);
    obj.edit303:setTop(55);
    obj.edit303:setWidth(225);
    obj.edit303:setHeight(25);
    obj.edit303:setField("tipo10");
    obj.edit303:setName("edit303");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout32);
    obj.button42:setLeft(279);
    obj.button42:setTop(6);
    obj.button42:setWidth(73);
    obj.button42:setText("ATAQUE");
    obj.button42:setFontSize(11);
    obj.button42:setName("button42");

    obj.edit304 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout32);
    obj.edit304:setType("number");
    obj.edit304:setVertTextAlign("center");
    obj.edit304:setLeft(352);
    obj.edit304:setTop(5);
    obj.edit304:setWidth(25);
    obj.edit304:setHeight(25);
    obj.edit304:setField("ataque10a");
    obj.edit304:setName("edit304");

    obj.edit305 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout32);
    obj.edit305:setType("number");
    obj.edit305:setVertTextAlign("center");
    obj.edit305:setLeft(380);
    obj.edit305:setTop(5);
    obj.edit305:setWidth(25);
    obj.edit305:setHeight(25);
    obj.edit305:setField("ataque10b");
    obj.edit305:setName("edit305");

    obj.edit306 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout32);
    obj.edit306:setType("number");
    obj.edit306:setVertTextAlign("center");
    obj.edit306:setLeft(409);
    obj.edit306:setTop(5);
    obj.edit306:setWidth(25);
    obj.edit306:setHeight(25);
    obj.edit306:setField("ataque10c");
    obj.edit306:setName("edit306");

    obj.edit307 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout32);
    obj.edit307:setType("number");
    obj.edit307:setVertTextAlign("center");
    obj.edit307:setLeft(437);
    obj.edit307:setTop(5);
    obj.edit307:setWidth(25);
    obj.edit307:setHeight(25);
    obj.edit307:setField("ataque10d");
    obj.edit307:setName("edit307");

    obj.edit308 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout32);
    obj.edit308:setType("number");
    obj.edit308:setVertTextAlign("center");
    obj.edit308:setLeft(465);
    obj.edit308:setTop(5);
    obj.edit308:setWidth(25);
    obj.edit308:setHeight(25);
    obj.edit308:setField("ataque10e");
    obj.edit308:setName("edit308");

    obj.edit309 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout32);
    obj.edit309:setType("number");
    obj.edit309:setVertTextAlign("center");
    obj.edit309:setLeft(493);
    obj.edit309:setTop(5);
    obj.edit309:setWidth(25);
    obj.edit309:setHeight(25);
    obj.edit309:setField("ataque10f");
    obj.edit309:setName("edit309");

    obj.edit310 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout32);
    obj.edit310:setType("number");
    obj.edit310:setVertTextAlign("center");
    obj.edit310:setLeft(522);
    obj.edit310:setTop(5);
    obj.edit310:setWidth(25);
    obj.edit310:setHeight(25);
    obj.edit310:setField("ataque10g");
    obj.edit310:setName("edit310");

    obj.edit311 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout32);
    obj.edit311:setType("number");
    obj.edit311:setVertTextAlign("center");
    obj.edit311:setLeft(550);
    obj.edit311:setTop(5);
    obj.edit311:setWidth(25);
    obj.edit311:setHeight(25);
    obj.edit311:setField("ataque10h");
    obj.edit311:setName("edit311");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout32);
    obj.button43:setLeft(279);
    obj.button43:setTop(31);
    obj.button43:setWidth(73);
    obj.button43:setText("DANO");
    obj.button43:setFontSize(11);
    obj.button43:setName("button43");

    obj.edit312 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout32);
    obj.edit312:setVertTextAlign("center");
    obj.edit312:setLeft(352);
    obj.edit312:setTop(30);
    obj.edit312:setWidth(82);
    obj.edit312:setHeight(25);
    obj.edit312:setField("dano10");
    obj.edit312:setName("edit312");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout32);
    obj.button44:setLeft(434);
    obj.button44:setTop(31);
    obj.button44:setWidth(60);
    obj.button44:setText("CRITICO");
    obj.button44:setFontSize(11);
    obj.button44:setName("button44");

    obj.edit313 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout32);
    obj.edit313:setVertTextAlign("center");
    obj.edit313:setLeft(493);
    obj.edit313:setTop(30);
    obj.edit313:setWidth(82);
    obj.edit313:setHeight(25);
    obj.edit313:setField("danoCritico10");
    obj.edit313:setName("edit313");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout32);
    obj.label223:setLeft(290);
    obj.label223:setTop(55);
    obj.label223:setWidth(70);
    obj.label223:setHeight(25);
    obj.label223:setText("DECISIVO");
    obj.label223:setName("label223");

    obj.edit314 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout32);
    obj.edit314:setVertTextAlign("center");
    obj.edit314:setLeft(352);
    obj.edit314:setTop(55);
    obj.edit314:setWidth(82);
    obj.edit314:setHeight(25);
    obj.edit314:setField("decisivo10");
    obj.edit314:setName("edit314");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout32);
    obj.label224:setLeft(445);
    obj.label224:setTop(55);
    obj.label224:setWidth(50);
    obj.label224:setHeight(25);
    obj.label224:setText("MULTI");
    obj.label224:setName("label224");

    obj.edit315 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout32);
    obj.edit315:setVertTextAlign("center");
    obj.edit315:setLeft(493);
    obj.edit315:setTop(55);
    obj.edit315:setWidth(82);
    obj.edit315:setHeight(25);
    obj.edit315:setField("multiplicador10");
    obj.edit315:setName("edit315");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout32);
    obj.label225:setLeft(580);
    obj.label225:setTop(5);
    obj.label225:setWidth(80);
    obj.label225:setHeight(25);
    obj.label225:setText("CATEGORIA");
    obj.label225:setName("label225");

    obj.edit316 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout32);
    obj.edit316:setVertTextAlign("center");
    obj.edit316:setLeft(660);
    obj.edit316:setTop(5);
    obj.edit316:setWidth(200);
    obj.edit316:setHeight(25);
    obj.edit316:setField("categoria10");
    obj.edit316:setName("edit316");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout32);
    obj.label226:setLeft(610);
    obj.label226:setTop(30);
    obj.label226:setWidth(50);
    obj.label226:setHeight(25);
    obj.label226:setText("OBS");
    obj.label226:setName("label226");

    obj.edit317 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout32);
    obj.edit317:setVertTextAlign("center");
    obj.edit317:setLeft(660);
    obj.edit317:setTop(30);
    obj.edit317:setWidth(200);
    obj.edit317:setHeight(25);
    obj.edit317:setField("obs10");
    obj.edit317:setName("edit317");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout32);
    obj.label227:setLeft(590);
    obj.label227:setTop(55);
    obj.label227:setWidth(80);
    obj.label227:setHeight(25);
    obj.label227:setText("MUNIÇÃO");
    obj.label227:setName("label227");

    obj.edit318 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout32);
    obj.edit318:setType("number");
    obj.edit318:setVertTextAlign("center");
    obj.edit318:setLeft(660);
    obj.edit318:setTop(55);
    obj.edit318:setWidth(69);
    obj.edit318:setHeight(25);
    obj.edit318:setField("municao10");
    obj.edit318:setName("edit318");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout32);
    obj.label228:setLeft(735);
    obj.label228:setTop(55);
    obj.label228:setWidth(70);
    obj.label228:setHeight(25);
    obj.label228:setText("ALCANCE");
    obj.label228:setName("label228");

    obj.edit319 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout32);
    obj.edit319:setVertTextAlign("center");
    obj.edit319:setLeft(795);
    obj.edit319:setTop(55);
    obj.edit319:setWidth(65);
    obj.edit319:setHeight(25);
    obj.edit319:setField("alcance10");
    obj.edit319:setName("edit319");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout32);
    obj.label229:setLeft(870);
    obj.label229:setTop(25);
    obj.label229:setWidth(330);
    obj.label229:setHeight(25);
    obj.label229:setHorzTextAlign("center");
    obj.label229:setText("Clique para adicionar imagem");
    obj.label229:setName("label229");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout32);
    obj.image11:setField("imagemArma10");
    obj.image11:setEditable(true);
    obj.image11:setStyle("autoFit");
    obj.image11:setLeft(870);
    obj.image11:setTop(5);
    obj.image11:setWidth(330);
    obj.image11:setHeight(75);
    obj.image11:setName("image11");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout22);
    obj.layout33:setLeft(2);
    obj.layout33:setTop(953);
    obj.layout33:setWidth(1207);
    obj.layout33:setHeight(92);
    obj.layout33:setName("layout33");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout33);
    obj.rectangle88:setAlign("client");
    obj.rectangle88:setColor("black");
    obj.rectangle88:setName("rectangle88");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout33);
    obj.rectangle89:setLeft(869);
    obj.rectangle89:setTop(4);
    obj.rectangle89:setWidth(332);
    obj.rectangle89:setHeight(77);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout33);
    obj.label230:setLeft(5);
    obj.label230:setTop(5);
    obj.label230:setWidth(50);
    obj.label230:setHeight(25);
    obj.label230:setText("NOME");
    obj.label230:setName("label230");

    obj.edit320 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout33);
    obj.edit320:setVertTextAlign("center");
    obj.edit320:setLeft(55);
    obj.edit320:setTop(5);
    obj.edit320:setWidth(225);
    obj.edit320:setHeight(25);
    obj.edit320:setField("nome11");
    obj.edit320:setName("edit320");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout33);
    obj.label231:setLeft(5);
    obj.label231:setTop(30);
    obj.label231:setWidth(50);
    obj.label231:setHeight(25);
    obj.label231:setText("ARMA");
    obj.label231:setName("label231");

    obj.edit321 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout33);
    obj.edit321:setVertTextAlign("center");
    obj.edit321:setLeft(55);
    obj.edit321:setTop(30);
    obj.edit321:setWidth(225);
    obj.edit321:setHeight(25);
    obj.edit321:setField("arma11");
    obj.edit321:setName("edit321");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout33);
    obj.label232:setLeft(5);
    obj.label232:setTop(55);
    obj.label232:setWidth(50);
    obj.label232:setHeight(25);
    obj.label232:setText("TIPO");
    obj.label232:setName("label232");

    obj.edit322 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout33);
    obj.edit322:setVertTextAlign("center");
    obj.edit322:setLeft(55);
    obj.edit322:setTop(55);
    obj.edit322:setWidth(225);
    obj.edit322:setHeight(25);
    obj.edit322:setField("tipo11");
    obj.edit322:setName("edit322");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout33);
    obj.button45:setLeft(279);
    obj.button45:setTop(6);
    obj.button45:setWidth(73);
    obj.button45:setText("ATAQUE");
    obj.button45:setFontSize(11);
    obj.button45:setName("button45");

    obj.edit323 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout33);
    obj.edit323:setType("number");
    obj.edit323:setVertTextAlign("center");
    obj.edit323:setLeft(352);
    obj.edit323:setTop(5);
    obj.edit323:setWidth(25);
    obj.edit323:setHeight(25);
    obj.edit323:setField("ataque11a");
    obj.edit323:setName("edit323");

    obj.edit324 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout33);
    obj.edit324:setType("number");
    obj.edit324:setVertTextAlign("center");
    obj.edit324:setLeft(380);
    obj.edit324:setTop(5);
    obj.edit324:setWidth(25);
    obj.edit324:setHeight(25);
    obj.edit324:setField("ataque11b");
    obj.edit324:setName("edit324");

    obj.edit325 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout33);
    obj.edit325:setType("number");
    obj.edit325:setVertTextAlign("center");
    obj.edit325:setLeft(409);
    obj.edit325:setTop(5);
    obj.edit325:setWidth(25);
    obj.edit325:setHeight(25);
    obj.edit325:setField("ataque11c");
    obj.edit325:setName("edit325");

    obj.edit326 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout33);
    obj.edit326:setType("number");
    obj.edit326:setVertTextAlign("center");
    obj.edit326:setLeft(437);
    obj.edit326:setTop(5);
    obj.edit326:setWidth(25);
    obj.edit326:setHeight(25);
    obj.edit326:setField("ataque11d");
    obj.edit326:setName("edit326");

    obj.edit327 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout33);
    obj.edit327:setType("number");
    obj.edit327:setVertTextAlign("center");
    obj.edit327:setLeft(465);
    obj.edit327:setTop(5);
    obj.edit327:setWidth(25);
    obj.edit327:setHeight(25);
    obj.edit327:setField("ataque11e");
    obj.edit327:setName("edit327");

    obj.edit328 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout33);
    obj.edit328:setType("number");
    obj.edit328:setVertTextAlign("center");
    obj.edit328:setLeft(493);
    obj.edit328:setTop(5);
    obj.edit328:setWidth(25);
    obj.edit328:setHeight(25);
    obj.edit328:setField("ataque11f");
    obj.edit328:setName("edit328");

    obj.edit329 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout33);
    obj.edit329:setType("number");
    obj.edit329:setVertTextAlign("center");
    obj.edit329:setLeft(522);
    obj.edit329:setTop(5);
    obj.edit329:setWidth(25);
    obj.edit329:setHeight(25);
    obj.edit329:setField("ataque11g");
    obj.edit329:setName("edit329");

    obj.edit330 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout33);
    obj.edit330:setType("number");
    obj.edit330:setVertTextAlign("center");
    obj.edit330:setLeft(550);
    obj.edit330:setTop(5);
    obj.edit330:setWidth(25);
    obj.edit330:setHeight(25);
    obj.edit330:setField("ataque11h");
    obj.edit330:setName("edit330");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout33);
    obj.button46:setLeft(279);
    obj.button46:setTop(31);
    obj.button46:setWidth(73);
    obj.button46:setText("DANO");
    obj.button46:setFontSize(11);
    obj.button46:setName("button46");

    obj.edit331 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout33);
    obj.edit331:setVertTextAlign("center");
    obj.edit331:setLeft(352);
    obj.edit331:setTop(30);
    obj.edit331:setWidth(82);
    obj.edit331:setHeight(25);
    obj.edit331:setField("dano11");
    obj.edit331:setName("edit331");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout33);
    obj.button47:setLeft(434);
    obj.button47:setTop(31);
    obj.button47:setWidth(60);
    obj.button47:setText("CRITICO");
    obj.button47:setFontSize(11);
    obj.button47:setName("button47");

    obj.edit332 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout33);
    obj.edit332:setVertTextAlign("center");
    obj.edit332:setLeft(493);
    obj.edit332:setTop(30);
    obj.edit332:setWidth(82);
    obj.edit332:setHeight(25);
    obj.edit332:setField("danoCritico11");
    obj.edit332:setName("edit332");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout33);
    obj.label233:setLeft(290);
    obj.label233:setTop(55);
    obj.label233:setWidth(70);
    obj.label233:setHeight(25);
    obj.label233:setText("DECISIVO");
    obj.label233:setName("label233");

    obj.edit333 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout33);
    obj.edit333:setVertTextAlign("center");
    obj.edit333:setLeft(352);
    obj.edit333:setTop(55);
    obj.edit333:setWidth(82);
    obj.edit333:setHeight(25);
    obj.edit333:setField("decisivo11");
    obj.edit333:setName("edit333");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout33);
    obj.label234:setLeft(445);
    obj.label234:setTop(55);
    obj.label234:setWidth(50);
    obj.label234:setHeight(25);
    obj.label234:setText("MULTI");
    obj.label234:setName("label234");

    obj.edit334 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout33);
    obj.edit334:setVertTextAlign("center");
    obj.edit334:setLeft(493);
    obj.edit334:setTop(55);
    obj.edit334:setWidth(82);
    obj.edit334:setHeight(25);
    obj.edit334:setField("multiplicador11");
    obj.edit334:setName("edit334");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout33);
    obj.label235:setLeft(580);
    obj.label235:setTop(5);
    obj.label235:setWidth(80);
    obj.label235:setHeight(25);
    obj.label235:setText("CATEGORIA");
    obj.label235:setName("label235");

    obj.edit335 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout33);
    obj.edit335:setVertTextAlign("center");
    obj.edit335:setLeft(660);
    obj.edit335:setTop(5);
    obj.edit335:setWidth(200);
    obj.edit335:setHeight(25);
    obj.edit335:setField("categoria11");
    obj.edit335:setName("edit335");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout33);
    obj.label236:setLeft(610);
    obj.label236:setTop(30);
    obj.label236:setWidth(50);
    obj.label236:setHeight(25);
    obj.label236:setText("OBS");
    obj.label236:setName("label236");

    obj.edit336 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout33);
    obj.edit336:setVertTextAlign("center");
    obj.edit336:setLeft(660);
    obj.edit336:setTop(30);
    obj.edit336:setWidth(200);
    obj.edit336:setHeight(25);
    obj.edit336:setField("obs11");
    obj.edit336:setName("edit336");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout33);
    obj.label237:setLeft(590);
    obj.label237:setTop(55);
    obj.label237:setWidth(80);
    obj.label237:setHeight(25);
    obj.label237:setText("MUNIÇÃO");
    obj.label237:setName("label237");

    obj.edit337 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout33);
    obj.edit337:setType("number");
    obj.edit337:setVertTextAlign("center");
    obj.edit337:setLeft(660);
    obj.edit337:setTop(55);
    obj.edit337:setWidth(69);
    obj.edit337:setHeight(25);
    obj.edit337:setField("municao11");
    obj.edit337:setName("edit337");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout33);
    obj.label238:setLeft(735);
    obj.label238:setTop(55);
    obj.label238:setWidth(70);
    obj.label238:setHeight(25);
    obj.label238:setText("ALCANCE");
    obj.label238:setName("label238");

    obj.edit338 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout33);
    obj.edit338:setVertTextAlign("center");
    obj.edit338:setLeft(795);
    obj.edit338:setTop(55);
    obj.edit338:setWidth(65);
    obj.edit338:setHeight(25);
    obj.edit338:setField("alcance11");
    obj.edit338:setName("edit338");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout33);
    obj.label239:setLeft(870);
    obj.label239:setTop(25);
    obj.label239:setWidth(330);
    obj.label239:setHeight(25);
    obj.label239:setHorzTextAlign("center");
    obj.label239:setText("Clique para adicionar imagem");
    obj.label239:setName("label239");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout33);
    obj.image12:setField("imagemArma11");
    obj.image12:setEditable(true);
    obj.image12:setStyle("autoFit");
    obj.image12:setLeft(870);
    obj.image12:setTop(5);
    obj.image12:setWidth(330);
    obj.image12:setHeight(75);
    obj.image12:setName("image12");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout22);
    obj.layout34:setLeft(2);
    obj.layout34:setTop(1048);
    obj.layout34:setWidth(1207);
    obj.layout34:setHeight(92);
    obj.layout34:setName("layout34");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout34);
    obj.rectangle90:setAlign("client");
    obj.rectangle90:setColor("black");
    obj.rectangle90:setName("rectangle90");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout34);
    obj.rectangle91:setLeft(869);
    obj.rectangle91:setTop(4);
    obj.rectangle91:setWidth(332);
    obj.rectangle91:setHeight(77);
    obj.rectangle91:setColor("black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout34);
    obj.label240:setLeft(5);
    obj.label240:setTop(5);
    obj.label240:setWidth(50);
    obj.label240:setHeight(25);
    obj.label240:setText("NOME");
    obj.label240:setName("label240");

    obj.edit339 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout34);
    obj.edit339:setVertTextAlign("center");
    obj.edit339:setLeft(55);
    obj.edit339:setTop(5);
    obj.edit339:setWidth(225);
    obj.edit339:setHeight(25);
    obj.edit339:setField("nome12");
    obj.edit339:setName("edit339");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout34);
    obj.label241:setLeft(5);
    obj.label241:setTop(30);
    obj.label241:setWidth(50);
    obj.label241:setHeight(25);
    obj.label241:setText("ARMA");
    obj.label241:setName("label241");

    obj.edit340 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout34);
    obj.edit340:setVertTextAlign("center");
    obj.edit340:setLeft(55);
    obj.edit340:setTop(30);
    obj.edit340:setWidth(225);
    obj.edit340:setHeight(25);
    obj.edit340:setField("arma12");
    obj.edit340:setName("edit340");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout34);
    obj.label242:setLeft(5);
    obj.label242:setTop(55);
    obj.label242:setWidth(50);
    obj.label242:setHeight(25);
    obj.label242:setText("TIPO");
    obj.label242:setName("label242");

    obj.edit341 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout34);
    obj.edit341:setVertTextAlign("center");
    obj.edit341:setLeft(55);
    obj.edit341:setTop(55);
    obj.edit341:setWidth(225);
    obj.edit341:setHeight(25);
    obj.edit341:setField("tipo12");
    obj.edit341:setName("edit341");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout34);
    obj.button48:setLeft(279);
    obj.button48:setTop(6);
    obj.button48:setWidth(73);
    obj.button48:setText("ATAQUE");
    obj.button48:setFontSize(11);
    obj.button48:setName("button48");

    obj.edit342 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout34);
    obj.edit342:setType("number");
    obj.edit342:setVertTextAlign("center");
    obj.edit342:setLeft(352);
    obj.edit342:setTop(5);
    obj.edit342:setWidth(25);
    obj.edit342:setHeight(25);
    obj.edit342:setField("ataque12a");
    obj.edit342:setName("edit342");

    obj.edit343 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout34);
    obj.edit343:setType("number");
    obj.edit343:setVertTextAlign("center");
    obj.edit343:setLeft(380);
    obj.edit343:setTop(5);
    obj.edit343:setWidth(25);
    obj.edit343:setHeight(25);
    obj.edit343:setField("ataque12b");
    obj.edit343:setName("edit343");

    obj.edit344 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout34);
    obj.edit344:setType("number");
    obj.edit344:setVertTextAlign("center");
    obj.edit344:setLeft(409);
    obj.edit344:setTop(5);
    obj.edit344:setWidth(25);
    obj.edit344:setHeight(25);
    obj.edit344:setField("ataque12c");
    obj.edit344:setName("edit344");

    obj.edit345 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout34);
    obj.edit345:setType("number");
    obj.edit345:setVertTextAlign("center");
    obj.edit345:setLeft(437);
    obj.edit345:setTop(5);
    obj.edit345:setWidth(25);
    obj.edit345:setHeight(25);
    obj.edit345:setField("ataque12d");
    obj.edit345:setName("edit345");

    obj.edit346 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout34);
    obj.edit346:setType("number");
    obj.edit346:setVertTextAlign("center");
    obj.edit346:setLeft(465);
    obj.edit346:setTop(5);
    obj.edit346:setWidth(25);
    obj.edit346:setHeight(25);
    obj.edit346:setField("ataque12e");
    obj.edit346:setName("edit346");

    obj.edit347 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout34);
    obj.edit347:setType("number");
    obj.edit347:setVertTextAlign("center");
    obj.edit347:setLeft(493);
    obj.edit347:setTop(5);
    obj.edit347:setWidth(25);
    obj.edit347:setHeight(25);
    obj.edit347:setField("ataque12f");
    obj.edit347:setName("edit347");

    obj.edit348 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout34);
    obj.edit348:setType("number");
    obj.edit348:setVertTextAlign("center");
    obj.edit348:setLeft(522);
    obj.edit348:setTop(5);
    obj.edit348:setWidth(25);
    obj.edit348:setHeight(25);
    obj.edit348:setField("ataque12g");
    obj.edit348:setName("edit348");

    obj.edit349 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout34);
    obj.edit349:setType("number");
    obj.edit349:setVertTextAlign("center");
    obj.edit349:setLeft(550);
    obj.edit349:setTop(5);
    obj.edit349:setWidth(25);
    obj.edit349:setHeight(25);
    obj.edit349:setField("ataque12h");
    obj.edit349:setName("edit349");

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout34);
    obj.button49:setLeft(279);
    obj.button49:setTop(31);
    obj.button49:setWidth(73);
    obj.button49:setText("DANO");
    obj.button49:setFontSize(11);
    obj.button49:setName("button49");

    obj.edit350 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout34);
    obj.edit350:setVertTextAlign("center");
    obj.edit350:setLeft(352);
    obj.edit350:setTop(30);
    obj.edit350:setWidth(82);
    obj.edit350:setHeight(25);
    obj.edit350:setField("dano12");
    obj.edit350:setName("edit350");

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout34);
    obj.button50:setLeft(434);
    obj.button50:setTop(31);
    obj.button50:setWidth(60);
    obj.button50:setText("CRITICO");
    obj.button50:setFontSize(11);
    obj.button50:setName("button50");

    obj.edit351 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout34);
    obj.edit351:setVertTextAlign("center");
    obj.edit351:setLeft(493);
    obj.edit351:setTop(30);
    obj.edit351:setWidth(82);
    obj.edit351:setHeight(25);
    obj.edit351:setField("danoCritico12");
    obj.edit351:setName("edit351");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout34);
    obj.label243:setLeft(290);
    obj.label243:setTop(55);
    obj.label243:setWidth(70);
    obj.label243:setHeight(25);
    obj.label243:setText("DECISIVO");
    obj.label243:setName("label243");

    obj.edit352 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout34);
    obj.edit352:setVertTextAlign("center");
    obj.edit352:setLeft(352);
    obj.edit352:setTop(55);
    obj.edit352:setWidth(82);
    obj.edit352:setHeight(25);
    obj.edit352:setField("decisivo12");
    obj.edit352:setName("edit352");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout34);
    obj.label244:setLeft(445);
    obj.label244:setTop(55);
    obj.label244:setWidth(50);
    obj.label244:setHeight(25);
    obj.label244:setText("MULTI");
    obj.label244:setName("label244");

    obj.edit353 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout34);
    obj.edit353:setVertTextAlign("center");
    obj.edit353:setLeft(493);
    obj.edit353:setTop(55);
    obj.edit353:setWidth(82);
    obj.edit353:setHeight(25);
    obj.edit353:setField("multiplicador12");
    obj.edit353:setName("edit353");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout34);
    obj.label245:setLeft(580);
    obj.label245:setTop(5);
    obj.label245:setWidth(80);
    obj.label245:setHeight(25);
    obj.label245:setText("CATEGORIA");
    obj.label245:setName("label245");

    obj.edit354 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout34);
    obj.edit354:setVertTextAlign("center");
    obj.edit354:setLeft(660);
    obj.edit354:setTop(5);
    obj.edit354:setWidth(200);
    obj.edit354:setHeight(25);
    obj.edit354:setField("categoria12");
    obj.edit354:setName("edit354");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout34);
    obj.label246:setLeft(610);
    obj.label246:setTop(30);
    obj.label246:setWidth(50);
    obj.label246:setHeight(25);
    obj.label246:setText("OBS");
    obj.label246:setName("label246");

    obj.edit355 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout34);
    obj.edit355:setVertTextAlign("center");
    obj.edit355:setLeft(660);
    obj.edit355:setTop(30);
    obj.edit355:setWidth(200);
    obj.edit355:setHeight(25);
    obj.edit355:setField("obs12");
    obj.edit355:setName("edit355");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout34);
    obj.label247:setLeft(590);
    obj.label247:setTop(55);
    obj.label247:setWidth(80);
    obj.label247:setHeight(25);
    obj.label247:setText("MUNIÇÃO");
    obj.label247:setName("label247");

    obj.edit356 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout34);
    obj.edit356:setType("number");
    obj.edit356:setVertTextAlign("center");
    obj.edit356:setLeft(660);
    obj.edit356:setTop(55);
    obj.edit356:setWidth(69);
    obj.edit356:setHeight(25);
    obj.edit356:setField("municao12");
    obj.edit356:setName("edit356");

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout34);
    obj.label248:setLeft(735);
    obj.label248:setTop(55);
    obj.label248:setWidth(70);
    obj.label248:setHeight(25);
    obj.label248:setText("ALCANCE");
    obj.label248:setName("label248");

    obj.edit357 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout34);
    obj.edit357:setVertTextAlign("center");
    obj.edit357:setLeft(795);
    obj.edit357:setTop(55);
    obj.edit357:setWidth(65);
    obj.edit357:setHeight(25);
    obj.edit357:setField("alcance12");
    obj.edit357:setName("edit357");

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout34);
    obj.label249:setLeft(870);
    obj.label249:setTop(25);
    obj.label249:setWidth(330);
    obj.label249:setHeight(25);
    obj.label249:setHorzTextAlign("center");
    obj.label249:setText("Clique para adicionar imagem");
    obj.label249:setName("label249");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout34);
    obj.image13:setField("imagemArma12");
    obj.image13:setEditable(true);
    obj.image13:setStyle("autoFit");
    obj.image13:setLeft(870);
    obj.image13:setTop(5);
    obj.image13:setWidth(330);
    obj.image13:setHeight(75);
    obj.image13:setName("image13");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout22);
    obj.layout35:setLeft(2);
    obj.layout35:setTop(1143);
    obj.layout35:setWidth(1207);
    obj.layout35:setHeight(92);
    obj.layout35:setName("layout35");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout35);
    obj.rectangle92:setAlign("client");
    obj.rectangle92:setColor("black");
    obj.rectangle92:setName("rectangle92");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout35);
    obj.rectangle93:setLeft(869);
    obj.rectangle93:setTop(4);
    obj.rectangle93:setWidth(332);
    obj.rectangle93:setHeight(77);
    obj.rectangle93:setColor("black");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setName("rectangle93");

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout35);
    obj.label250:setLeft(5);
    obj.label250:setTop(5);
    obj.label250:setWidth(50);
    obj.label250:setHeight(25);
    obj.label250:setText("NOME");
    obj.label250:setName("label250");

    obj.edit358 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout35);
    obj.edit358:setVertTextAlign("center");
    obj.edit358:setLeft(55);
    obj.edit358:setTop(5);
    obj.edit358:setWidth(225);
    obj.edit358:setHeight(25);
    obj.edit358:setField("nome13");
    obj.edit358:setName("edit358");

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.layout35);
    obj.label251:setLeft(5);
    obj.label251:setTop(30);
    obj.label251:setWidth(50);
    obj.label251:setHeight(25);
    obj.label251:setText("ARMA");
    obj.label251:setName("label251");

    obj.edit359 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout35);
    obj.edit359:setVertTextAlign("center");
    obj.edit359:setLeft(55);
    obj.edit359:setTop(30);
    obj.edit359:setWidth(225);
    obj.edit359:setHeight(25);
    obj.edit359:setField("arma13");
    obj.edit359:setName("edit359");

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.layout35);
    obj.label252:setLeft(5);
    obj.label252:setTop(55);
    obj.label252:setWidth(50);
    obj.label252:setHeight(25);
    obj.label252:setText("TIPO");
    obj.label252:setName("label252");

    obj.edit360 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.layout35);
    obj.edit360:setVertTextAlign("center");
    obj.edit360:setLeft(55);
    obj.edit360:setTop(55);
    obj.edit360:setWidth(225);
    obj.edit360:setHeight(25);
    obj.edit360:setField("tipo13");
    obj.edit360:setName("edit360");

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout35);
    obj.button51:setLeft(279);
    obj.button51:setTop(6);
    obj.button51:setWidth(73);
    obj.button51:setText("ATAQUE");
    obj.button51:setFontSize(11);
    obj.button51:setName("button51");

    obj.edit361 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.layout35);
    obj.edit361:setType("number");
    obj.edit361:setVertTextAlign("center");
    obj.edit361:setLeft(352);
    obj.edit361:setTop(5);
    obj.edit361:setWidth(25);
    obj.edit361:setHeight(25);
    obj.edit361:setField("ataque13a");
    obj.edit361:setName("edit361");

    obj.edit362 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.layout35);
    obj.edit362:setType("number");
    obj.edit362:setVertTextAlign("center");
    obj.edit362:setLeft(380);
    obj.edit362:setTop(5);
    obj.edit362:setWidth(25);
    obj.edit362:setHeight(25);
    obj.edit362:setField("ataque13b");
    obj.edit362:setName("edit362");

    obj.edit363 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.layout35);
    obj.edit363:setType("number");
    obj.edit363:setVertTextAlign("center");
    obj.edit363:setLeft(409);
    obj.edit363:setTop(5);
    obj.edit363:setWidth(25);
    obj.edit363:setHeight(25);
    obj.edit363:setField("ataque13c");
    obj.edit363:setName("edit363");

    obj.edit364 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.layout35);
    obj.edit364:setType("number");
    obj.edit364:setVertTextAlign("center");
    obj.edit364:setLeft(437);
    obj.edit364:setTop(5);
    obj.edit364:setWidth(25);
    obj.edit364:setHeight(25);
    obj.edit364:setField("ataque13d");
    obj.edit364:setName("edit364");

    obj.edit365 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.layout35);
    obj.edit365:setType("number");
    obj.edit365:setVertTextAlign("center");
    obj.edit365:setLeft(465);
    obj.edit365:setTop(5);
    obj.edit365:setWidth(25);
    obj.edit365:setHeight(25);
    obj.edit365:setField("ataque13e");
    obj.edit365:setName("edit365");

    obj.edit366 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.layout35);
    obj.edit366:setType("number");
    obj.edit366:setVertTextAlign("center");
    obj.edit366:setLeft(493);
    obj.edit366:setTop(5);
    obj.edit366:setWidth(25);
    obj.edit366:setHeight(25);
    obj.edit366:setField("ataque13f");
    obj.edit366:setName("edit366");

    obj.edit367 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.layout35);
    obj.edit367:setType("number");
    obj.edit367:setVertTextAlign("center");
    obj.edit367:setLeft(522);
    obj.edit367:setTop(5);
    obj.edit367:setWidth(25);
    obj.edit367:setHeight(25);
    obj.edit367:setField("ataque13g");
    obj.edit367:setName("edit367");

    obj.edit368 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.layout35);
    obj.edit368:setType("number");
    obj.edit368:setVertTextAlign("center");
    obj.edit368:setLeft(550);
    obj.edit368:setTop(5);
    obj.edit368:setWidth(25);
    obj.edit368:setHeight(25);
    obj.edit368:setField("ataque13h");
    obj.edit368:setName("edit368");

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout35);
    obj.button52:setLeft(279);
    obj.button52:setTop(31);
    obj.button52:setWidth(73);
    obj.button52:setText("DANO");
    obj.button52:setFontSize(11);
    obj.button52:setName("button52");

    obj.edit369 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.layout35);
    obj.edit369:setVertTextAlign("center");
    obj.edit369:setLeft(352);
    obj.edit369:setTop(30);
    obj.edit369:setWidth(82);
    obj.edit369:setHeight(25);
    obj.edit369:setField("dano13");
    obj.edit369:setName("edit369");

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout35);
    obj.button53:setLeft(434);
    obj.button53:setTop(31);
    obj.button53:setWidth(60);
    obj.button53:setText("CRITICO");
    obj.button53:setFontSize(11);
    obj.button53:setName("button53");

    obj.edit370 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.layout35);
    obj.edit370:setVertTextAlign("center");
    obj.edit370:setLeft(493);
    obj.edit370:setTop(30);
    obj.edit370:setWidth(82);
    obj.edit370:setHeight(25);
    obj.edit370:setField("danoCritico13");
    obj.edit370:setName("edit370");

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.layout35);
    obj.label253:setLeft(290);
    obj.label253:setTop(55);
    obj.label253:setWidth(70);
    obj.label253:setHeight(25);
    obj.label253:setText("DECISIVO");
    obj.label253:setName("label253");

    obj.edit371 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout35);
    obj.edit371:setVertTextAlign("center");
    obj.edit371:setLeft(352);
    obj.edit371:setTop(55);
    obj.edit371:setWidth(82);
    obj.edit371:setHeight(25);
    obj.edit371:setField("decisivo13");
    obj.edit371:setName("edit371");

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.layout35);
    obj.label254:setLeft(445);
    obj.label254:setTop(55);
    obj.label254:setWidth(50);
    obj.label254:setHeight(25);
    obj.label254:setText("MULTI");
    obj.label254:setName("label254");

    obj.edit372 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout35);
    obj.edit372:setVertTextAlign("center");
    obj.edit372:setLeft(493);
    obj.edit372:setTop(55);
    obj.edit372:setWidth(82);
    obj.edit372:setHeight(25);
    obj.edit372:setField("multiplicador13");
    obj.edit372:setName("edit372");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.layout35);
    obj.label255:setLeft(580);
    obj.label255:setTop(5);
    obj.label255:setWidth(80);
    obj.label255:setHeight(25);
    obj.label255:setText("CATEGORIA");
    obj.label255:setName("label255");

    obj.edit373 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout35);
    obj.edit373:setVertTextAlign("center");
    obj.edit373:setLeft(660);
    obj.edit373:setTop(5);
    obj.edit373:setWidth(200);
    obj.edit373:setHeight(25);
    obj.edit373:setField("categoria13");
    obj.edit373:setName("edit373");

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.layout35);
    obj.label256:setLeft(610);
    obj.label256:setTop(30);
    obj.label256:setWidth(50);
    obj.label256:setHeight(25);
    obj.label256:setText("OBS");
    obj.label256:setName("label256");

    obj.edit374 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout35);
    obj.edit374:setVertTextAlign("center");
    obj.edit374:setLeft(660);
    obj.edit374:setTop(30);
    obj.edit374:setWidth(200);
    obj.edit374:setHeight(25);
    obj.edit374:setField("obs13");
    obj.edit374:setName("edit374");

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.layout35);
    obj.label257:setLeft(590);
    obj.label257:setTop(55);
    obj.label257:setWidth(80);
    obj.label257:setHeight(25);
    obj.label257:setText("MUNIÇÃO");
    obj.label257:setName("label257");

    obj.edit375 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout35);
    obj.edit375:setType("number");
    obj.edit375:setVertTextAlign("center");
    obj.edit375:setLeft(660);
    obj.edit375:setTop(55);
    obj.edit375:setWidth(69);
    obj.edit375:setHeight(25);
    obj.edit375:setField("municao13");
    obj.edit375:setName("edit375");

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.layout35);
    obj.label258:setLeft(735);
    obj.label258:setTop(55);
    obj.label258:setWidth(70);
    obj.label258:setHeight(25);
    obj.label258:setText("ALCANCE");
    obj.label258:setName("label258");

    obj.edit376 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout35);
    obj.edit376:setVertTextAlign("center");
    obj.edit376:setLeft(795);
    obj.edit376:setTop(55);
    obj.edit376:setWidth(65);
    obj.edit376:setHeight(25);
    obj.edit376:setField("alcance13");
    obj.edit376:setName("edit376");

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.layout35);
    obj.label259:setLeft(870);
    obj.label259:setTop(25);
    obj.label259:setWidth(330);
    obj.label259:setHeight(25);
    obj.label259:setHorzTextAlign("center");
    obj.label259:setText("Clique para adicionar imagem");
    obj.label259:setName("label259");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout35);
    obj.image14:setField("imagemArma13");
    obj.image14:setEditable(true);
    obj.image14:setStyle("autoFit");
    obj.image14:setLeft(870);
    obj.image14:setTop(5);
    obj.image14:setWidth(330);
    obj.image14:setHeight(75);
    obj.image14:setName("image14");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout22);
    obj.layout36:setLeft(2);
    obj.layout36:setTop(1238);
    obj.layout36:setWidth(1207);
    obj.layout36:setHeight(92);
    obj.layout36:setName("layout36");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout36);
    obj.rectangle94:setAlign("client");
    obj.rectangle94:setColor("black");
    obj.rectangle94:setName("rectangle94");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout36);
    obj.rectangle95:setLeft(869);
    obj.rectangle95:setTop(4);
    obj.rectangle95:setWidth(332);
    obj.rectangle95:setHeight(77);
    obj.rectangle95:setColor("black");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setName("rectangle95");

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.layout36);
    obj.label260:setLeft(5);
    obj.label260:setTop(5);
    obj.label260:setWidth(50);
    obj.label260:setHeight(25);
    obj.label260:setText("NOME");
    obj.label260:setName("label260");

    obj.edit377 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout36);
    obj.edit377:setVertTextAlign("center");
    obj.edit377:setLeft(55);
    obj.edit377:setTop(5);
    obj.edit377:setWidth(225);
    obj.edit377:setHeight(25);
    obj.edit377:setField("nome14");
    obj.edit377:setName("edit377");

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.layout36);
    obj.label261:setLeft(5);
    obj.label261:setTop(30);
    obj.label261:setWidth(50);
    obj.label261:setHeight(25);
    obj.label261:setText("ARMA");
    obj.label261:setName("label261");

    obj.edit378 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout36);
    obj.edit378:setVertTextAlign("center");
    obj.edit378:setLeft(55);
    obj.edit378:setTop(30);
    obj.edit378:setWidth(225);
    obj.edit378:setHeight(25);
    obj.edit378:setField("arma14");
    obj.edit378:setName("edit378");

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.layout36);
    obj.label262:setLeft(5);
    obj.label262:setTop(55);
    obj.label262:setWidth(50);
    obj.label262:setHeight(25);
    obj.label262:setText("TIPO");
    obj.label262:setName("label262");

    obj.edit379 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout36);
    obj.edit379:setVertTextAlign("center");
    obj.edit379:setLeft(55);
    obj.edit379:setTop(55);
    obj.edit379:setWidth(225);
    obj.edit379:setHeight(25);
    obj.edit379:setField("tipo14");
    obj.edit379:setName("edit379");

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout36);
    obj.button54:setLeft(279);
    obj.button54:setTop(6);
    obj.button54:setWidth(73);
    obj.button54:setText("ATAQUE");
    obj.button54:setFontSize(11);
    obj.button54:setName("button54");

    obj.edit380 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout36);
    obj.edit380:setType("number");
    obj.edit380:setVertTextAlign("center");
    obj.edit380:setLeft(352);
    obj.edit380:setTop(5);
    obj.edit380:setWidth(25);
    obj.edit380:setHeight(25);
    obj.edit380:setField("ataque14a");
    obj.edit380:setName("edit380");

    obj.edit381 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit381:setParent(obj.layout36);
    obj.edit381:setType("number");
    obj.edit381:setVertTextAlign("center");
    obj.edit381:setLeft(380);
    obj.edit381:setTop(5);
    obj.edit381:setWidth(25);
    obj.edit381:setHeight(25);
    obj.edit381:setField("ataque14b");
    obj.edit381:setName("edit381");

    obj.edit382 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit382:setParent(obj.layout36);
    obj.edit382:setType("number");
    obj.edit382:setVertTextAlign("center");
    obj.edit382:setLeft(409);
    obj.edit382:setTop(5);
    obj.edit382:setWidth(25);
    obj.edit382:setHeight(25);
    obj.edit382:setField("ataque14c");
    obj.edit382:setName("edit382");

    obj.edit383 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit383:setParent(obj.layout36);
    obj.edit383:setType("number");
    obj.edit383:setVertTextAlign("center");
    obj.edit383:setLeft(437);
    obj.edit383:setTop(5);
    obj.edit383:setWidth(25);
    obj.edit383:setHeight(25);
    obj.edit383:setField("ataque14d");
    obj.edit383:setName("edit383");

    obj.edit384 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit384:setParent(obj.layout36);
    obj.edit384:setType("number");
    obj.edit384:setVertTextAlign("center");
    obj.edit384:setLeft(465);
    obj.edit384:setTop(5);
    obj.edit384:setWidth(25);
    obj.edit384:setHeight(25);
    obj.edit384:setField("ataque14e");
    obj.edit384:setName("edit384");

    obj.edit385 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit385:setParent(obj.layout36);
    obj.edit385:setType("number");
    obj.edit385:setVertTextAlign("center");
    obj.edit385:setLeft(493);
    obj.edit385:setTop(5);
    obj.edit385:setWidth(25);
    obj.edit385:setHeight(25);
    obj.edit385:setField("ataque14f");
    obj.edit385:setName("edit385");

    obj.edit386 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit386:setParent(obj.layout36);
    obj.edit386:setType("number");
    obj.edit386:setVertTextAlign("center");
    obj.edit386:setLeft(522);
    obj.edit386:setTop(5);
    obj.edit386:setWidth(25);
    obj.edit386:setHeight(25);
    obj.edit386:setField("ataque14g");
    obj.edit386:setName("edit386");

    obj.edit387 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit387:setParent(obj.layout36);
    obj.edit387:setType("number");
    obj.edit387:setVertTextAlign("center");
    obj.edit387:setLeft(550);
    obj.edit387:setTop(5);
    obj.edit387:setWidth(25);
    obj.edit387:setHeight(25);
    obj.edit387:setField("ataque14h");
    obj.edit387:setName("edit387");

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout36);
    obj.button55:setLeft(279);
    obj.button55:setTop(31);
    obj.button55:setWidth(73);
    obj.button55:setText("DANO");
    obj.button55:setFontSize(11);
    obj.button55:setName("button55");

    obj.edit388 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit388:setParent(obj.layout36);
    obj.edit388:setVertTextAlign("center");
    obj.edit388:setLeft(352);
    obj.edit388:setTop(30);
    obj.edit388:setWidth(82);
    obj.edit388:setHeight(25);
    obj.edit388:setField("dano14");
    obj.edit388:setName("edit388");

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout36);
    obj.button56:setLeft(434);
    obj.button56:setTop(31);
    obj.button56:setWidth(60);
    obj.button56:setText("CRITICO");
    obj.button56:setFontSize(11);
    obj.button56:setName("button56");

    obj.edit389 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit389:setParent(obj.layout36);
    obj.edit389:setVertTextAlign("center");
    obj.edit389:setLeft(493);
    obj.edit389:setTop(30);
    obj.edit389:setWidth(82);
    obj.edit389:setHeight(25);
    obj.edit389:setField("danoCritico14");
    obj.edit389:setName("edit389");

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.layout36);
    obj.label263:setLeft(290);
    obj.label263:setTop(55);
    obj.label263:setWidth(70);
    obj.label263:setHeight(25);
    obj.label263:setText("DECISIVO");
    obj.label263:setName("label263");

    obj.edit390 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit390:setParent(obj.layout36);
    obj.edit390:setVertTextAlign("center");
    obj.edit390:setLeft(352);
    obj.edit390:setTop(55);
    obj.edit390:setWidth(82);
    obj.edit390:setHeight(25);
    obj.edit390:setField("decisivo14");
    obj.edit390:setName("edit390");

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.layout36);
    obj.label264:setLeft(445);
    obj.label264:setTop(55);
    obj.label264:setWidth(50);
    obj.label264:setHeight(25);
    obj.label264:setText("MULTI");
    obj.label264:setName("label264");

    obj.edit391 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit391:setParent(obj.layout36);
    obj.edit391:setVertTextAlign("center");
    obj.edit391:setLeft(493);
    obj.edit391:setTop(55);
    obj.edit391:setWidth(82);
    obj.edit391:setHeight(25);
    obj.edit391:setField("multiplicador14");
    obj.edit391:setName("edit391");

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.layout36);
    obj.label265:setLeft(580);
    obj.label265:setTop(5);
    obj.label265:setWidth(80);
    obj.label265:setHeight(25);
    obj.label265:setText("CATEGORIA");
    obj.label265:setName("label265");

    obj.edit392 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit392:setParent(obj.layout36);
    obj.edit392:setVertTextAlign("center");
    obj.edit392:setLeft(660);
    obj.edit392:setTop(5);
    obj.edit392:setWidth(200);
    obj.edit392:setHeight(25);
    obj.edit392:setField("categoria14");
    obj.edit392:setName("edit392");

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.layout36);
    obj.label266:setLeft(610);
    obj.label266:setTop(30);
    obj.label266:setWidth(50);
    obj.label266:setHeight(25);
    obj.label266:setText("OBS");
    obj.label266:setName("label266");

    obj.edit393 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit393:setParent(obj.layout36);
    obj.edit393:setVertTextAlign("center");
    obj.edit393:setLeft(660);
    obj.edit393:setTop(30);
    obj.edit393:setWidth(200);
    obj.edit393:setHeight(25);
    obj.edit393:setField("obs14");
    obj.edit393:setName("edit393");

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.layout36);
    obj.label267:setLeft(590);
    obj.label267:setTop(55);
    obj.label267:setWidth(80);
    obj.label267:setHeight(25);
    obj.label267:setText("MUNIÇÃO");
    obj.label267:setName("label267");

    obj.edit394 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit394:setParent(obj.layout36);
    obj.edit394:setType("number");
    obj.edit394:setVertTextAlign("center");
    obj.edit394:setLeft(660);
    obj.edit394:setTop(55);
    obj.edit394:setWidth(69);
    obj.edit394:setHeight(25);
    obj.edit394:setField("municao14");
    obj.edit394:setName("edit394");

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.layout36);
    obj.label268:setLeft(735);
    obj.label268:setTop(55);
    obj.label268:setWidth(70);
    obj.label268:setHeight(25);
    obj.label268:setText("ALCANCE");
    obj.label268:setName("label268");

    obj.edit395 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit395:setParent(obj.layout36);
    obj.edit395:setVertTextAlign("center");
    obj.edit395:setLeft(795);
    obj.edit395:setTop(55);
    obj.edit395:setWidth(65);
    obj.edit395:setHeight(25);
    obj.edit395:setField("alcance14");
    obj.edit395:setName("edit395");

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.layout36);
    obj.label269:setLeft(870);
    obj.label269:setTop(25);
    obj.label269:setWidth(330);
    obj.label269:setHeight(25);
    obj.label269:setHorzTextAlign("center");
    obj.label269:setText("Clique para adicionar imagem");
    obj.label269:setName("label269");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout36);
    obj.image15:setField("imagemArma14");
    obj.image15:setEditable(true);
    obj.image15:setStyle("autoFit");
    obj.image15:setLeft(870);
    obj.image15:setTop(5);
    obj.image15:setWidth(330);
    obj.image15:setHeight(75);
    obj.image15:setName("image15");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout22);
    obj.layout37:setLeft(2);
    obj.layout37:setTop(1333);
    obj.layout37:setWidth(1207);
    obj.layout37:setHeight(92);
    obj.layout37:setName("layout37");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout37);
    obj.rectangle96:setAlign("client");
    obj.rectangle96:setColor("black");
    obj.rectangle96:setName("rectangle96");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout37);
    obj.rectangle97:setLeft(869);
    obj.rectangle97:setTop(4);
    obj.rectangle97:setWidth(332);
    obj.rectangle97:setHeight(77);
    obj.rectangle97:setColor("black");
    obj.rectangle97:setStrokeColor("white");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setName("rectangle97");

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.layout37);
    obj.label270:setLeft(5);
    obj.label270:setTop(5);
    obj.label270:setWidth(50);
    obj.label270:setHeight(25);
    obj.label270:setText("NOME");
    obj.label270:setName("label270");

    obj.edit396 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit396:setParent(obj.layout37);
    obj.edit396:setVertTextAlign("center");
    obj.edit396:setLeft(55);
    obj.edit396:setTop(5);
    obj.edit396:setWidth(225);
    obj.edit396:setHeight(25);
    obj.edit396:setField("nome15");
    obj.edit396:setName("edit396");

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.layout37);
    obj.label271:setLeft(5);
    obj.label271:setTop(30);
    obj.label271:setWidth(50);
    obj.label271:setHeight(25);
    obj.label271:setText("ARMA");
    obj.label271:setName("label271");

    obj.edit397 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit397:setParent(obj.layout37);
    obj.edit397:setVertTextAlign("center");
    obj.edit397:setLeft(55);
    obj.edit397:setTop(30);
    obj.edit397:setWidth(225);
    obj.edit397:setHeight(25);
    obj.edit397:setField("arma15");
    obj.edit397:setName("edit397");

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.layout37);
    obj.label272:setLeft(5);
    obj.label272:setTop(55);
    obj.label272:setWidth(50);
    obj.label272:setHeight(25);
    obj.label272:setText("TIPO");
    obj.label272:setName("label272");

    obj.edit398 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit398:setParent(obj.layout37);
    obj.edit398:setVertTextAlign("center");
    obj.edit398:setLeft(55);
    obj.edit398:setTop(55);
    obj.edit398:setWidth(225);
    obj.edit398:setHeight(25);
    obj.edit398:setField("tipo15");
    obj.edit398:setName("edit398");

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout37);
    obj.button57:setLeft(279);
    obj.button57:setTop(6);
    obj.button57:setWidth(73);
    obj.button57:setText("ATAQUE");
    obj.button57:setFontSize(11);
    obj.button57:setName("button57");

    obj.edit399 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit399:setParent(obj.layout37);
    obj.edit399:setType("number");
    obj.edit399:setVertTextAlign("center");
    obj.edit399:setLeft(352);
    obj.edit399:setTop(5);
    obj.edit399:setWidth(25);
    obj.edit399:setHeight(25);
    obj.edit399:setField("ataque15a");
    obj.edit399:setName("edit399");

    obj.edit400 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit400:setParent(obj.layout37);
    obj.edit400:setType("number");
    obj.edit400:setVertTextAlign("center");
    obj.edit400:setLeft(380);
    obj.edit400:setTop(5);
    obj.edit400:setWidth(25);
    obj.edit400:setHeight(25);
    obj.edit400:setField("ataque15b");
    obj.edit400:setName("edit400");

    obj.edit401 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit401:setParent(obj.layout37);
    obj.edit401:setType("number");
    obj.edit401:setVertTextAlign("center");
    obj.edit401:setLeft(409);
    obj.edit401:setTop(5);
    obj.edit401:setWidth(25);
    obj.edit401:setHeight(25);
    obj.edit401:setField("ataque15c");
    obj.edit401:setName("edit401");

    obj.edit402 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit402:setParent(obj.layout37);
    obj.edit402:setType("number");
    obj.edit402:setVertTextAlign("center");
    obj.edit402:setLeft(437);
    obj.edit402:setTop(5);
    obj.edit402:setWidth(25);
    obj.edit402:setHeight(25);
    obj.edit402:setField("ataque15d");
    obj.edit402:setName("edit402");

    obj.edit403 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit403:setParent(obj.layout37);
    obj.edit403:setType("number");
    obj.edit403:setVertTextAlign("center");
    obj.edit403:setLeft(465);
    obj.edit403:setTop(5);
    obj.edit403:setWidth(25);
    obj.edit403:setHeight(25);
    obj.edit403:setField("ataque15e");
    obj.edit403:setName("edit403");

    obj.edit404 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit404:setParent(obj.layout37);
    obj.edit404:setType("number");
    obj.edit404:setVertTextAlign("center");
    obj.edit404:setLeft(493);
    obj.edit404:setTop(5);
    obj.edit404:setWidth(25);
    obj.edit404:setHeight(25);
    obj.edit404:setField("ataque15f");
    obj.edit404:setName("edit404");

    obj.edit405 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit405:setParent(obj.layout37);
    obj.edit405:setType("number");
    obj.edit405:setVertTextAlign("center");
    obj.edit405:setLeft(522);
    obj.edit405:setTop(5);
    obj.edit405:setWidth(25);
    obj.edit405:setHeight(25);
    obj.edit405:setField("ataque15g");
    obj.edit405:setName("edit405");

    obj.edit406 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit406:setParent(obj.layout37);
    obj.edit406:setType("number");
    obj.edit406:setVertTextAlign("center");
    obj.edit406:setLeft(550);
    obj.edit406:setTop(5);
    obj.edit406:setWidth(25);
    obj.edit406:setHeight(25);
    obj.edit406:setField("ataque15h");
    obj.edit406:setName("edit406");

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout37);
    obj.button58:setLeft(279);
    obj.button58:setTop(31);
    obj.button58:setWidth(73);
    obj.button58:setText("DANO");
    obj.button58:setFontSize(11);
    obj.button58:setName("button58");

    obj.edit407 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit407:setParent(obj.layout37);
    obj.edit407:setVertTextAlign("center");
    obj.edit407:setLeft(352);
    obj.edit407:setTop(30);
    obj.edit407:setWidth(82);
    obj.edit407:setHeight(25);
    obj.edit407:setField("dano15");
    obj.edit407:setName("edit407");

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout37);
    obj.button59:setLeft(434);
    obj.button59:setTop(31);
    obj.button59:setWidth(60);
    obj.button59:setText("CRITICO");
    obj.button59:setFontSize(11);
    obj.button59:setName("button59");

    obj.edit408 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit408:setParent(obj.layout37);
    obj.edit408:setVertTextAlign("center");
    obj.edit408:setLeft(493);
    obj.edit408:setTop(30);
    obj.edit408:setWidth(82);
    obj.edit408:setHeight(25);
    obj.edit408:setField("danoCritico15");
    obj.edit408:setName("edit408");

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.layout37);
    obj.label273:setLeft(290);
    obj.label273:setTop(55);
    obj.label273:setWidth(70);
    obj.label273:setHeight(25);
    obj.label273:setText("DECISIVO");
    obj.label273:setName("label273");

    obj.edit409 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit409:setParent(obj.layout37);
    obj.edit409:setVertTextAlign("center");
    obj.edit409:setLeft(352);
    obj.edit409:setTop(55);
    obj.edit409:setWidth(82);
    obj.edit409:setHeight(25);
    obj.edit409:setField("decisivo15");
    obj.edit409:setName("edit409");

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.layout37);
    obj.label274:setLeft(445);
    obj.label274:setTop(55);
    obj.label274:setWidth(50);
    obj.label274:setHeight(25);
    obj.label274:setText("MULTI");
    obj.label274:setName("label274");

    obj.edit410 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit410:setParent(obj.layout37);
    obj.edit410:setVertTextAlign("center");
    obj.edit410:setLeft(493);
    obj.edit410:setTop(55);
    obj.edit410:setWidth(82);
    obj.edit410:setHeight(25);
    obj.edit410:setField("multiplicador15");
    obj.edit410:setName("edit410");

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.layout37);
    obj.label275:setLeft(580);
    obj.label275:setTop(5);
    obj.label275:setWidth(80);
    obj.label275:setHeight(25);
    obj.label275:setText("CATEGORIA");
    obj.label275:setName("label275");

    obj.edit411 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit411:setParent(obj.layout37);
    obj.edit411:setVertTextAlign("center");
    obj.edit411:setLeft(660);
    obj.edit411:setTop(5);
    obj.edit411:setWidth(200);
    obj.edit411:setHeight(25);
    obj.edit411:setField("categoria15");
    obj.edit411:setName("edit411");

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.layout37);
    obj.label276:setLeft(610);
    obj.label276:setTop(30);
    obj.label276:setWidth(50);
    obj.label276:setHeight(25);
    obj.label276:setText("OBS");
    obj.label276:setName("label276");

    obj.edit412 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit412:setParent(obj.layout37);
    obj.edit412:setVertTextAlign("center");
    obj.edit412:setLeft(660);
    obj.edit412:setTop(30);
    obj.edit412:setWidth(200);
    obj.edit412:setHeight(25);
    obj.edit412:setField("obs15");
    obj.edit412:setName("edit412");

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.layout37);
    obj.label277:setLeft(590);
    obj.label277:setTop(55);
    obj.label277:setWidth(80);
    obj.label277:setHeight(25);
    obj.label277:setText("MUNIÇÃO");
    obj.label277:setName("label277");

    obj.edit413 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit413:setParent(obj.layout37);
    obj.edit413:setType("number");
    obj.edit413:setVertTextAlign("center");
    obj.edit413:setLeft(660);
    obj.edit413:setTop(55);
    obj.edit413:setWidth(69);
    obj.edit413:setHeight(25);
    obj.edit413:setField("municao15");
    obj.edit413:setName("edit413");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.layout37);
    obj.label278:setLeft(735);
    obj.label278:setTop(55);
    obj.label278:setWidth(70);
    obj.label278:setHeight(25);
    obj.label278:setText("ALCANCE");
    obj.label278:setName("label278");

    obj.edit414 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit414:setParent(obj.layout37);
    obj.edit414:setVertTextAlign("center");
    obj.edit414:setLeft(795);
    obj.edit414:setTop(55);
    obj.edit414:setWidth(65);
    obj.edit414:setHeight(25);
    obj.edit414:setField("alcance15");
    obj.edit414:setName("edit414");

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.layout37);
    obj.label279:setLeft(870);
    obj.label279:setTop(25);
    obj.label279:setWidth(330);
    obj.label279:setHeight(25);
    obj.label279:setHorzTextAlign("center");
    obj.label279:setText("Clique para adicionar imagem");
    obj.label279:setName("label279");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.layout37);
    obj.image16:setField("imagemArma15");
    obj.image16:setEditable(true);
    obj.image16:setStyle("autoFit");
    obj.image16:setLeft(870);
    obj.image16:setTop(5);
    obj.image16:setWidth(330);
    obj.image16:setHeight(75);
    obj.image16:setName("image16");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout22);
    obj.layout38:setLeft(2);
    obj.layout38:setTop(1428);
    obj.layout38:setWidth(1207);
    obj.layout38:setHeight(92);
    obj.layout38:setName("layout38");

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout38);
    obj.rectangle98:setAlign("client");
    obj.rectangle98:setColor("black");
    obj.rectangle98:setName("rectangle98");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout38);
    obj.rectangle99:setLeft(869);
    obj.rectangle99:setTop(4);
    obj.rectangle99:setWidth(332);
    obj.rectangle99:setHeight(77);
    obj.rectangle99:setColor("black");
    obj.rectangle99:setStrokeColor("white");
    obj.rectangle99:setStrokeSize(1);
    obj.rectangle99:setName("rectangle99");

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.layout38);
    obj.label280:setLeft(5);
    obj.label280:setTop(5);
    obj.label280:setWidth(50);
    obj.label280:setHeight(25);
    obj.label280:setText("NOME");
    obj.label280:setName("label280");

    obj.edit415 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit415:setParent(obj.layout38);
    obj.edit415:setVertTextAlign("center");
    obj.edit415:setLeft(55);
    obj.edit415:setTop(5);
    obj.edit415:setWidth(225);
    obj.edit415:setHeight(25);
    obj.edit415:setField("nome16");
    obj.edit415:setName("edit415");

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.layout38);
    obj.label281:setLeft(5);
    obj.label281:setTop(30);
    obj.label281:setWidth(50);
    obj.label281:setHeight(25);
    obj.label281:setText("ARMA");
    obj.label281:setName("label281");

    obj.edit416 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit416:setParent(obj.layout38);
    obj.edit416:setVertTextAlign("center");
    obj.edit416:setLeft(55);
    obj.edit416:setTop(30);
    obj.edit416:setWidth(225);
    obj.edit416:setHeight(25);
    obj.edit416:setField("arma16");
    obj.edit416:setName("edit416");

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.layout38);
    obj.label282:setLeft(5);
    obj.label282:setTop(55);
    obj.label282:setWidth(50);
    obj.label282:setHeight(25);
    obj.label282:setText("TIPO");
    obj.label282:setName("label282");

    obj.edit417 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit417:setParent(obj.layout38);
    obj.edit417:setVertTextAlign("center");
    obj.edit417:setLeft(55);
    obj.edit417:setTop(55);
    obj.edit417:setWidth(225);
    obj.edit417:setHeight(25);
    obj.edit417:setField("tipo16");
    obj.edit417:setName("edit417");

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout38);
    obj.button60:setLeft(279);
    obj.button60:setTop(6);
    obj.button60:setWidth(73);
    obj.button60:setText("ATAQUE");
    obj.button60:setFontSize(11);
    obj.button60:setName("button60");

    obj.edit418 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit418:setParent(obj.layout38);
    obj.edit418:setType("number");
    obj.edit418:setVertTextAlign("center");
    obj.edit418:setLeft(352);
    obj.edit418:setTop(5);
    obj.edit418:setWidth(25);
    obj.edit418:setHeight(25);
    obj.edit418:setField("ataque16a");
    obj.edit418:setName("edit418");

    obj.edit419 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit419:setParent(obj.layout38);
    obj.edit419:setType("number");
    obj.edit419:setVertTextAlign("center");
    obj.edit419:setLeft(380);
    obj.edit419:setTop(5);
    obj.edit419:setWidth(25);
    obj.edit419:setHeight(25);
    obj.edit419:setField("ataque16b");
    obj.edit419:setName("edit419");

    obj.edit420 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit420:setParent(obj.layout38);
    obj.edit420:setType("number");
    obj.edit420:setVertTextAlign("center");
    obj.edit420:setLeft(409);
    obj.edit420:setTop(5);
    obj.edit420:setWidth(25);
    obj.edit420:setHeight(25);
    obj.edit420:setField("ataque16c");
    obj.edit420:setName("edit420");

    obj.edit421 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit421:setParent(obj.layout38);
    obj.edit421:setType("number");
    obj.edit421:setVertTextAlign("center");
    obj.edit421:setLeft(437);
    obj.edit421:setTop(5);
    obj.edit421:setWidth(25);
    obj.edit421:setHeight(25);
    obj.edit421:setField("ataque16d");
    obj.edit421:setName("edit421");

    obj.edit422 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit422:setParent(obj.layout38);
    obj.edit422:setType("number");
    obj.edit422:setVertTextAlign("center");
    obj.edit422:setLeft(465);
    obj.edit422:setTop(5);
    obj.edit422:setWidth(25);
    obj.edit422:setHeight(25);
    obj.edit422:setField("ataque16e");
    obj.edit422:setName("edit422");

    obj.edit423 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit423:setParent(obj.layout38);
    obj.edit423:setType("number");
    obj.edit423:setVertTextAlign("center");
    obj.edit423:setLeft(493);
    obj.edit423:setTop(5);
    obj.edit423:setWidth(25);
    obj.edit423:setHeight(25);
    obj.edit423:setField("ataque16f");
    obj.edit423:setName("edit423");

    obj.edit424 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit424:setParent(obj.layout38);
    obj.edit424:setType("number");
    obj.edit424:setVertTextAlign("center");
    obj.edit424:setLeft(522);
    obj.edit424:setTop(5);
    obj.edit424:setWidth(25);
    obj.edit424:setHeight(25);
    obj.edit424:setField("ataque16g");
    obj.edit424:setName("edit424");

    obj.edit425 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit425:setParent(obj.layout38);
    obj.edit425:setType("number");
    obj.edit425:setVertTextAlign("center");
    obj.edit425:setLeft(550);
    obj.edit425:setTop(5);
    obj.edit425:setWidth(25);
    obj.edit425:setHeight(25);
    obj.edit425:setField("ataque16h");
    obj.edit425:setName("edit425");

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout38);
    obj.button61:setLeft(279);
    obj.button61:setTop(31);
    obj.button61:setWidth(73);
    obj.button61:setText("DANO");
    obj.button61:setFontSize(11);
    obj.button61:setName("button61");

    obj.edit426 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit426:setParent(obj.layout38);
    obj.edit426:setVertTextAlign("center");
    obj.edit426:setLeft(352);
    obj.edit426:setTop(30);
    obj.edit426:setWidth(82);
    obj.edit426:setHeight(25);
    obj.edit426:setField("dano16");
    obj.edit426:setName("edit426");

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout38);
    obj.button62:setLeft(434);
    obj.button62:setTop(31);
    obj.button62:setWidth(60);
    obj.button62:setText("CRITICO");
    obj.button62:setFontSize(11);
    obj.button62:setName("button62");

    obj.edit427 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit427:setParent(obj.layout38);
    obj.edit427:setVertTextAlign("center");
    obj.edit427:setLeft(493);
    obj.edit427:setTop(30);
    obj.edit427:setWidth(82);
    obj.edit427:setHeight(25);
    obj.edit427:setField("danoCritico16");
    obj.edit427:setName("edit427");

    obj.label283 = GUI.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.layout38);
    obj.label283:setLeft(290);
    obj.label283:setTop(55);
    obj.label283:setWidth(70);
    obj.label283:setHeight(25);
    obj.label283:setText("DECISIVO");
    obj.label283:setName("label283");

    obj.edit428 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit428:setParent(obj.layout38);
    obj.edit428:setVertTextAlign("center");
    obj.edit428:setLeft(352);
    obj.edit428:setTop(55);
    obj.edit428:setWidth(82);
    obj.edit428:setHeight(25);
    obj.edit428:setField("decisivo16");
    obj.edit428:setName("edit428");

    obj.label284 = GUI.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.layout38);
    obj.label284:setLeft(445);
    obj.label284:setTop(55);
    obj.label284:setWidth(50);
    obj.label284:setHeight(25);
    obj.label284:setText("MULTI");
    obj.label284:setName("label284");

    obj.edit429 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit429:setParent(obj.layout38);
    obj.edit429:setVertTextAlign("center");
    obj.edit429:setLeft(493);
    obj.edit429:setTop(55);
    obj.edit429:setWidth(82);
    obj.edit429:setHeight(25);
    obj.edit429:setField("multiplicador16");
    obj.edit429:setName("edit429");

    obj.label285 = GUI.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.layout38);
    obj.label285:setLeft(580);
    obj.label285:setTop(5);
    obj.label285:setWidth(80);
    obj.label285:setHeight(25);
    obj.label285:setText("CATEGORIA");
    obj.label285:setName("label285");

    obj.edit430 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit430:setParent(obj.layout38);
    obj.edit430:setVertTextAlign("center");
    obj.edit430:setLeft(660);
    obj.edit430:setTop(5);
    obj.edit430:setWidth(200);
    obj.edit430:setHeight(25);
    obj.edit430:setField("categoria16");
    obj.edit430:setName("edit430");

    obj.label286 = GUI.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.layout38);
    obj.label286:setLeft(610);
    obj.label286:setTop(30);
    obj.label286:setWidth(50);
    obj.label286:setHeight(25);
    obj.label286:setText("OBS");
    obj.label286:setName("label286");

    obj.edit431 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit431:setParent(obj.layout38);
    obj.edit431:setVertTextAlign("center");
    obj.edit431:setLeft(660);
    obj.edit431:setTop(30);
    obj.edit431:setWidth(200);
    obj.edit431:setHeight(25);
    obj.edit431:setField("obs16");
    obj.edit431:setName("edit431");

    obj.label287 = GUI.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.layout38);
    obj.label287:setLeft(590);
    obj.label287:setTop(55);
    obj.label287:setWidth(80);
    obj.label287:setHeight(25);
    obj.label287:setText("MUNIÇÃO");
    obj.label287:setName("label287");

    obj.edit432 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit432:setParent(obj.layout38);
    obj.edit432:setType("number");
    obj.edit432:setVertTextAlign("center");
    obj.edit432:setLeft(660);
    obj.edit432:setTop(55);
    obj.edit432:setWidth(69);
    obj.edit432:setHeight(25);
    obj.edit432:setField("municao16");
    obj.edit432:setName("edit432");

    obj.label288 = GUI.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.layout38);
    obj.label288:setLeft(735);
    obj.label288:setTop(55);
    obj.label288:setWidth(70);
    obj.label288:setHeight(25);
    obj.label288:setText("ALCANCE");
    obj.label288:setName("label288");

    obj.edit433 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit433:setParent(obj.layout38);
    obj.edit433:setVertTextAlign("center");
    obj.edit433:setLeft(795);
    obj.edit433:setTop(55);
    obj.edit433:setWidth(65);
    obj.edit433:setHeight(25);
    obj.edit433:setField("alcance16");
    obj.edit433:setName("edit433");

    obj.label289 = GUI.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.layout38);
    obj.label289:setLeft(870);
    obj.label289:setTop(25);
    obj.label289:setWidth(330);
    obj.label289:setHeight(25);
    obj.label289:setHorzTextAlign("center");
    obj.label289:setText("Clique para adicionar imagem");
    obj.label289:setName("label289");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.layout38);
    obj.image17:setField("imagemArma16");
    obj.image17:setEditable(true);
    obj.image17:setStyle("autoFit");
    obj.image17:setLeft(870);
    obj.image17:setTop(5);
    obj.image17:setWidth(330);
    obj.image17:setHeight(75);
    obj.image17:setName("image17");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout22);
    obj.layout39:setLeft(2);
    obj.layout39:setTop(1523);
    obj.layout39:setWidth(1207);
    obj.layout39:setHeight(92);
    obj.layout39:setName("layout39");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout39);
    obj.rectangle100:setAlign("client");
    obj.rectangle100:setColor("black");
    obj.rectangle100:setName("rectangle100");

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout39);
    obj.rectangle101:setLeft(869);
    obj.rectangle101:setTop(4);
    obj.rectangle101:setWidth(332);
    obj.rectangle101:setHeight(77);
    obj.rectangle101:setColor("black");
    obj.rectangle101:setStrokeColor("white");
    obj.rectangle101:setStrokeSize(1);
    obj.rectangle101:setName("rectangle101");

    obj.label290 = GUI.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.layout39);
    obj.label290:setLeft(5);
    obj.label290:setTop(5);
    obj.label290:setWidth(50);
    obj.label290:setHeight(25);
    obj.label290:setText("NOME");
    obj.label290:setName("label290");

    obj.edit434 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit434:setParent(obj.layout39);
    obj.edit434:setVertTextAlign("center");
    obj.edit434:setLeft(55);
    obj.edit434:setTop(5);
    obj.edit434:setWidth(225);
    obj.edit434:setHeight(25);
    obj.edit434:setField("nome17");
    obj.edit434:setName("edit434");

    obj.label291 = GUI.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.layout39);
    obj.label291:setLeft(5);
    obj.label291:setTop(30);
    obj.label291:setWidth(50);
    obj.label291:setHeight(25);
    obj.label291:setText("ARMA");
    obj.label291:setName("label291");

    obj.edit435 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit435:setParent(obj.layout39);
    obj.edit435:setVertTextAlign("center");
    obj.edit435:setLeft(55);
    obj.edit435:setTop(30);
    obj.edit435:setWidth(225);
    obj.edit435:setHeight(25);
    obj.edit435:setField("arma17");
    obj.edit435:setName("edit435");

    obj.label292 = GUI.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.layout39);
    obj.label292:setLeft(5);
    obj.label292:setTop(55);
    obj.label292:setWidth(50);
    obj.label292:setHeight(25);
    obj.label292:setText("TIPO");
    obj.label292:setName("label292");

    obj.edit436 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit436:setParent(obj.layout39);
    obj.edit436:setVertTextAlign("center");
    obj.edit436:setLeft(55);
    obj.edit436:setTop(55);
    obj.edit436:setWidth(225);
    obj.edit436:setHeight(25);
    obj.edit436:setField("tipo17");
    obj.edit436:setName("edit436");

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout39);
    obj.button63:setLeft(279);
    obj.button63:setTop(6);
    obj.button63:setWidth(73);
    obj.button63:setText("ATAQUE");
    obj.button63:setFontSize(11);
    obj.button63:setName("button63");

    obj.edit437 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit437:setParent(obj.layout39);
    obj.edit437:setType("number");
    obj.edit437:setVertTextAlign("center");
    obj.edit437:setLeft(352);
    obj.edit437:setTop(5);
    obj.edit437:setWidth(25);
    obj.edit437:setHeight(25);
    obj.edit437:setField("ataque17a");
    obj.edit437:setName("edit437");

    obj.edit438 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit438:setParent(obj.layout39);
    obj.edit438:setType("number");
    obj.edit438:setVertTextAlign("center");
    obj.edit438:setLeft(380);
    obj.edit438:setTop(5);
    obj.edit438:setWidth(25);
    obj.edit438:setHeight(25);
    obj.edit438:setField("ataque17b");
    obj.edit438:setName("edit438");

    obj.edit439 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit439:setParent(obj.layout39);
    obj.edit439:setType("number");
    obj.edit439:setVertTextAlign("center");
    obj.edit439:setLeft(409);
    obj.edit439:setTop(5);
    obj.edit439:setWidth(25);
    obj.edit439:setHeight(25);
    obj.edit439:setField("ataque17c");
    obj.edit439:setName("edit439");

    obj.edit440 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit440:setParent(obj.layout39);
    obj.edit440:setType("number");
    obj.edit440:setVertTextAlign("center");
    obj.edit440:setLeft(437);
    obj.edit440:setTop(5);
    obj.edit440:setWidth(25);
    obj.edit440:setHeight(25);
    obj.edit440:setField("ataque17d");
    obj.edit440:setName("edit440");

    obj.edit441 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit441:setParent(obj.layout39);
    obj.edit441:setType("number");
    obj.edit441:setVertTextAlign("center");
    obj.edit441:setLeft(465);
    obj.edit441:setTop(5);
    obj.edit441:setWidth(25);
    obj.edit441:setHeight(25);
    obj.edit441:setField("ataque17e");
    obj.edit441:setName("edit441");

    obj.edit442 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit442:setParent(obj.layout39);
    obj.edit442:setType("number");
    obj.edit442:setVertTextAlign("center");
    obj.edit442:setLeft(493);
    obj.edit442:setTop(5);
    obj.edit442:setWidth(25);
    obj.edit442:setHeight(25);
    obj.edit442:setField("ataque17f");
    obj.edit442:setName("edit442");

    obj.edit443 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit443:setParent(obj.layout39);
    obj.edit443:setType("number");
    obj.edit443:setVertTextAlign("center");
    obj.edit443:setLeft(522);
    obj.edit443:setTop(5);
    obj.edit443:setWidth(25);
    obj.edit443:setHeight(25);
    obj.edit443:setField("ataque17g");
    obj.edit443:setName("edit443");

    obj.edit444 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit444:setParent(obj.layout39);
    obj.edit444:setType("number");
    obj.edit444:setVertTextAlign("center");
    obj.edit444:setLeft(550);
    obj.edit444:setTop(5);
    obj.edit444:setWidth(25);
    obj.edit444:setHeight(25);
    obj.edit444:setField("ataque17h");
    obj.edit444:setName("edit444");

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout39);
    obj.button64:setLeft(279);
    obj.button64:setTop(31);
    obj.button64:setWidth(73);
    obj.button64:setText("DANO");
    obj.button64:setFontSize(11);
    obj.button64:setName("button64");

    obj.edit445 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit445:setParent(obj.layout39);
    obj.edit445:setVertTextAlign("center");
    obj.edit445:setLeft(352);
    obj.edit445:setTop(30);
    obj.edit445:setWidth(82);
    obj.edit445:setHeight(25);
    obj.edit445:setField("dano17");
    obj.edit445:setName("edit445");

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout39);
    obj.button65:setLeft(434);
    obj.button65:setTop(31);
    obj.button65:setWidth(60);
    obj.button65:setText("CRITICO");
    obj.button65:setFontSize(11);
    obj.button65:setName("button65");

    obj.edit446 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit446:setParent(obj.layout39);
    obj.edit446:setVertTextAlign("center");
    obj.edit446:setLeft(493);
    obj.edit446:setTop(30);
    obj.edit446:setWidth(82);
    obj.edit446:setHeight(25);
    obj.edit446:setField("danoCritico17");
    obj.edit446:setName("edit446");

    obj.label293 = GUI.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.layout39);
    obj.label293:setLeft(290);
    obj.label293:setTop(55);
    obj.label293:setWidth(70);
    obj.label293:setHeight(25);
    obj.label293:setText("DECISIVO");
    obj.label293:setName("label293");

    obj.edit447 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit447:setParent(obj.layout39);
    obj.edit447:setVertTextAlign("center");
    obj.edit447:setLeft(352);
    obj.edit447:setTop(55);
    obj.edit447:setWidth(82);
    obj.edit447:setHeight(25);
    obj.edit447:setField("decisivo17");
    obj.edit447:setName("edit447");

    obj.label294 = GUI.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.layout39);
    obj.label294:setLeft(445);
    obj.label294:setTop(55);
    obj.label294:setWidth(50);
    obj.label294:setHeight(25);
    obj.label294:setText("MULTI");
    obj.label294:setName("label294");

    obj.edit448 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit448:setParent(obj.layout39);
    obj.edit448:setVertTextAlign("center");
    obj.edit448:setLeft(493);
    obj.edit448:setTop(55);
    obj.edit448:setWidth(82);
    obj.edit448:setHeight(25);
    obj.edit448:setField("multiplicador17");
    obj.edit448:setName("edit448");

    obj.label295 = GUI.fromHandle(_obj_newObject("label"));
    obj.label295:setParent(obj.layout39);
    obj.label295:setLeft(580);
    obj.label295:setTop(5);
    obj.label295:setWidth(80);
    obj.label295:setHeight(25);
    obj.label295:setText("CATEGORIA");
    obj.label295:setName("label295");

    obj.edit449 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit449:setParent(obj.layout39);
    obj.edit449:setVertTextAlign("center");
    obj.edit449:setLeft(660);
    obj.edit449:setTop(5);
    obj.edit449:setWidth(200);
    obj.edit449:setHeight(25);
    obj.edit449:setField("categoria17");
    obj.edit449:setName("edit449");

    obj.label296 = GUI.fromHandle(_obj_newObject("label"));
    obj.label296:setParent(obj.layout39);
    obj.label296:setLeft(610);
    obj.label296:setTop(30);
    obj.label296:setWidth(50);
    obj.label296:setHeight(25);
    obj.label296:setText("OBS");
    obj.label296:setName("label296");

    obj.edit450 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit450:setParent(obj.layout39);
    obj.edit450:setVertTextAlign("center");
    obj.edit450:setLeft(660);
    obj.edit450:setTop(30);
    obj.edit450:setWidth(200);
    obj.edit450:setHeight(25);
    obj.edit450:setField("obs17");
    obj.edit450:setName("edit450");

    obj.label297 = GUI.fromHandle(_obj_newObject("label"));
    obj.label297:setParent(obj.layout39);
    obj.label297:setLeft(590);
    obj.label297:setTop(55);
    obj.label297:setWidth(80);
    obj.label297:setHeight(25);
    obj.label297:setText("MUNIÇÃO");
    obj.label297:setName("label297");

    obj.edit451 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit451:setParent(obj.layout39);
    obj.edit451:setType("number");
    obj.edit451:setVertTextAlign("center");
    obj.edit451:setLeft(660);
    obj.edit451:setTop(55);
    obj.edit451:setWidth(69);
    obj.edit451:setHeight(25);
    obj.edit451:setField("municao17");
    obj.edit451:setName("edit451");

    obj.label298 = GUI.fromHandle(_obj_newObject("label"));
    obj.label298:setParent(obj.layout39);
    obj.label298:setLeft(735);
    obj.label298:setTop(55);
    obj.label298:setWidth(70);
    obj.label298:setHeight(25);
    obj.label298:setText("ALCANCE");
    obj.label298:setName("label298");

    obj.edit452 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit452:setParent(obj.layout39);
    obj.edit452:setVertTextAlign("center");
    obj.edit452:setLeft(795);
    obj.edit452:setTop(55);
    obj.edit452:setWidth(65);
    obj.edit452:setHeight(25);
    obj.edit452:setField("alcance17");
    obj.edit452:setName("edit452");

    obj.label299 = GUI.fromHandle(_obj_newObject("label"));
    obj.label299:setParent(obj.layout39);
    obj.label299:setLeft(870);
    obj.label299:setTop(25);
    obj.label299:setWidth(330);
    obj.label299:setHeight(25);
    obj.label299:setHorzTextAlign("center");
    obj.label299:setText("Clique para adicionar imagem");
    obj.label299:setName("label299");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.layout39);
    obj.image18:setField("imagemArma17");
    obj.image18:setEditable(true);
    obj.image18:setStyle("autoFit");
    obj.image18:setLeft(870);
    obj.image18:setTop(5);
    obj.image18:setWidth(330);
    obj.image18:setHeight(75);
    obj.image18:setName("image18");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout22);
    obj.layout40:setLeft(2);
    obj.layout40:setTop(1618);
    obj.layout40:setWidth(1207);
    obj.layout40:setHeight(92);
    obj.layout40:setName("layout40");

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout40);
    obj.rectangle102:setAlign("client");
    obj.rectangle102:setColor("black");
    obj.rectangle102:setName("rectangle102");

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout40);
    obj.rectangle103:setLeft(869);
    obj.rectangle103:setTop(4);
    obj.rectangle103:setWidth(332);
    obj.rectangle103:setHeight(77);
    obj.rectangle103:setColor("black");
    obj.rectangle103:setStrokeColor("white");
    obj.rectangle103:setStrokeSize(1);
    obj.rectangle103:setName("rectangle103");

    obj.label300 = GUI.fromHandle(_obj_newObject("label"));
    obj.label300:setParent(obj.layout40);
    obj.label300:setLeft(5);
    obj.label300:setTop(5);
    obj.label300:setWidth(50);
    obj.label300:setHeight(25);
    obj.label300:setText("NOME");
    obj.label300:setName("label300");

    obj.edit453 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit453:setParent(obj.layout40);
    obj.edit453:setVertTextAlign("center");
    obj.edit453:setLeft(55);
    obj.edit453:setTop(5);
    obj.edit453:setWidth(225);
    obj.edit453:setHeight(25);
    obj.edit453:setField("nome18");
    obj.edit453:setName("edit453");

    obj.label301 = GUI.fromHandle(_obj_newObject("label"));
    obj.label301:setParent(obj.layout40);
    obj.label301:setLeft(5);
    obj.label301:setTop(30);
    obj.label301:setWidth(50);
    obj.label301:setHeight(25);
    obj.label301:setText("ARMA");
    obj.label301:setName("label301");

    obj.edit454 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit454:setParent(obj.layout40);
    obj.edit454:setVertTextAlign("center");
    obj.edit454:setLeft(55);
    obj.edit454:setTop(30);
    obj.edit454:setWidth(225);
    obj.edit454:setHeight(25);
    obj.edit454:setField("arma18");
    obj.edit454:setName("edit454");

    obj.label302 = GUI.fromHandle(_obj_newObject("label"));
    obj.label302:setParent(obj.layout40);
    obj.label302:setLeft(5);
    obj.label302:setTop(55);
    obj.label302:setWidth(50);
    obj.label302:setHeight(25);
    obj.label302:setText("TIPO");
    obj.label302:setName("label302");

    obj.edit455 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit455:setParent(obj.layout40);
    obj.edit455:setVertTextAlign("center");
    obj.edit455:setLeft(55);
    obj.edit455:setTop(55);
    obj.edit455:setWidth(225);
    obj.edit455:setHeight(25);
    obj.edit455:setField("tipo18");
    obj.edit455:setName("edit455");

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout40);
    obj.button66:setLeft(279);
    obj.button66:setTop(6);
    obj.button66:setWidth(73);
    obj.button66:setText("ATAQUE");
    obj.button66:setFontSize(11);
    obj.button66:setName("button66");

    obj.edit456 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit456:setParent(obj.layout40);
    obj.edit456:setType("number");
    obj.edit456:setVertTextAlign("center");
    obj.edit456:setLeft(352);
    obj.edit456:setTop(5);
    obj.edit456:setWidth(25);
    obj.edit456:setHeight(25);
    obj.edit456:setField("ataque18a");
    obj.edit456:setName("edit456");

    obj.edit457 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit457:setParent(obj.layout40);
    obj.edit457:setType("number");
    obj.edit457:setVertTextAlign("center");
    obj.edit457:setLeft(380);
    obj.edit457:setTop(5);
    obj.edit457:setWidth(25);
    obj.edit457:setHeight(25);
    obj.edit457:setField("ataque18b");
    obj.edit457:setName("edit457");

    obj.edit458 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit458:setParent(obj.layout40);
    obj.edit458:setType("number");
    obj.edit458:setVertTextAlign("center");
    obj.edit458:setLeft(409);
    obj.edit458:setTop(5);
    obj.edit458:setWidth(25);
    obj.edit458:setHeight(25);
    obj.edit458:setField("ataque18c");
    obj.edit458:setName("edit458");

    obj.edit459 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit459:setParent(obj.layout40);
    obj.edit459:setType("number");
    obj.edit459:setVertTextAlign("center");
    obj.edit459:setLeft(437);
    obj.edit459:setTop(5);
    obj.edit459:setWidth(25);
    obj.edit459:setHeight(25);
    obj.edit459:setField("ataque18d");
    obj.edit459:setName("edit459");

    obj.edit460 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit460:setParent(obj.layout40);
    obj.edit460:setType("number");
    obj.edit460:setVertTextAlign("center");
    obj.edit460:setLeft(465);
    obj.edit460:setTop(5);
    obj.edit460:setWidth(25);
    obj.edit460:setHeight(25);
    obj.edit460:setField("ataque18e");
    obj.edit460:setName("edit460");

    obj.edit461 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit461:setParent(obj.layout40);
    obj.edit461:setType("number");
    obj.edit461:setVertTextAlign("center");
    obj.edit461:setLeft(493);
    obj.edit461:setTop(5);
    obj.edit461:setWidth(25);
    obj.edit461:setHeight(25);
    obj.edit461:setField("ataque18f");
    obj.edit461:setName("edit461");

    obj.edit462 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit462:setParent(obj.layout40);
    obj.edit462:setType("number");
    obj.edit462:setVertTextAlign("center");
    obj.edit462:setLeft(522);
    obj.edit462:setTop(5);
    obj.edit462:setWidth(25);
    obj.edit462:setHeight(25);
    obj.edit462:setField("ataque18g");
    obj.edit462:setName("edit462");

    obj.edit463 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit463:setParent(obj.layout40);
    obj.edit463:setType("number");
    obj.edit463:setVertTextAlign("center");
    obj.edit463:setLeft(550);
    obj.edit463:setTop(5);
    obj.edit463:setWidth(25);
    obj.edit463:setHeight(25);
    obj.edit463:setField("ataque18h");
    obj.edit463:setName("edit463");

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout40);
    obj.button67:setLeft(279);
    obj.button67:setTop(31);
    obj.button67:setWidth(73);
    obj.button67:setText("DANO");
    obj.button67:setFontSize(11);
    obj.button67:setName("button67");

    obj.edit464 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit464:setParent(obj.layout40);
    obj.edit464:setVertTextAlign("center");
    obj.edit464:setLeft(352);
    obj.edit464:setTop(30);
    obj.edit464:setWidth(82);
    obj.edit464:setHeight(25);
    obj.edit464:setField("dano18");
    obj.edit464:setName("edit464");

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout40);
    obj.button68:setLeft(434);
    obj.button68:setTop(31);
    obj.button68:setWidth(60);
    obj.button68:setText("CRITICO");
    obj.button68:setFontSize(11);
    obj.button68:setName("button68");

    obj.edit465 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit465:setParent(obj.layout40);
    obj.edit465:setVertTextAlign("center");
    obj.edit465:setLeft(493);
    obj.edit465:setTop(30);
    obj.edit465:setWidth(82);
    obj.edit465:setHeight(25);
    obj.edit465:setField("danoCritico18");
    obj.edit465:setName("edit465");

    obj.label303 = GUI.fromHandle(_obj_newObject("label"));
    obj.label303:setParent(obj.layout40);
    obj.label303:setLeft(290);
    obj.label303:setTop(55);
    obj.label303:setWidth(70);
    obj.label303:setHeight(25);
    obj.label303:setText("DECISIVO");
    obj.label303:setName("label303");

    obj.edit466 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit466:setParent(obj.layout40);
    obj.edit466:setVertTextAlign("center");
    obj.edit466:setLeft(352);
    obj.edit466:setTop(55);
    obj.edit466:setWidth(82);
    obj.edit466:setHeight(25);
    obj.edit466:setField("decisivo18");
    obj.edit466:setName("edit466");

    obj.label304 = GUI.fromHandle(_obj_newObject("label"));
    obj.label304:setParent(obj.layout40);
    obj.label304:setLeft(445);
    obj.label304:setTop(55);
    obj.label304:setWidth(50);
    obj.label304:setHeight(25);
    obj.label304:setText("MULTI");
    obj.label304:setName("label304");

    obj.edit467 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit467:setParent(obj.layout40);
    obj.edit467:setVertTextAlign("center");
    obj.edit467:setLeft(493);
    obj.edit467:setTop(55);
    obj.edit467:setWidth(82);
    obj.edit467:setHeight(25);
    obj.edit467:setField("multiplicador18");
    obj.edit467:setName("edit467");

    obj.label305 = GUI.fromHandle(_obj_newObject("label"));
    obj.label305:setParent(obj.layout40);
    obj.label305:setLeft(580);
    obj.label305:setTop(5);
    obj.label305:setWidth(80);
    obj.label305:setHeight(25);
    obj.label305:setText("CATEGORIA");
    obj.label305:setName("label305");

    obj.edit468 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit468:setParent(obj.layout40);
    obj.edit468:setVertTextAlign("center");
    obj.edit468:setLeft(660);
    obj.edit468:setTop(5);
    obj.edit468:setWidth(200);
    obj.edit468:setHeight(25);
    obj.edit468:setField("categoria18");
    obj.edit468:setName("edit468");

    obj.label306 = GUI.fromHandle(_obj_newObject("label"));
    obj.label306:setParent(obj.layout40);
    obj.label306:setLeft(610);
    obj.label306:setTop(30);
    obj.label306:setWidth(50);
    obj.label306:setHeight(25);
    obj.label306:setText("OBS");
    obj.label306:setName("label306");

    obj.edit469 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit469:setParent(obj.layout40);
    obj.edit469:setVertTextAlign("center");
    obj.edit469:setLeft(660);
    obj.edit469:setTop(30);
    obj.edit469:setWidth(200);
    obj.edit469:setHeight(25);
    obj.edit469:setField("obs18");
    obj.edit469:setName("edit469");

    obj.label307 = GUI.fromHandle(_obj_newObject("label"));
    obj.label307:setParent(obj.layout40);
    obj.label307:setLeft(590);
    obj.label307:setTop(55);
    obj.label307:setWidth(80);
    obj.label307:setHeight(25);
    obj.label307:setText("MUNIÇÃO");
    obj.label307:setName("label307");

    obj.edit470 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit470:setParent(obj.layout40);
    obj.edit470:setType("number");
    obj.edit470:setVertTextAlign("center");
    obj.edit470:setLeft(660);
    obj.edit470:setTop(55);
    obj.edit470:setWidth(69);
    obj.edit470:setHeight(25);
    obj.edit470:setField("municao18");
    obj.edit470:setName("edit470");

    obj.label308 = GUI.fromHandle(_obj_newObject("label"));
    obj.label308:setParent(obj.layout40);
    obj.label308:setLeft(735);
    obj.label308:setTop(55);
    obj.label308:setWidth(70);
    obj.label308:setHeight(25);
    obj.label308:setText("ALCANCE");
    obj.label308:setName("label308");

    obj.edit471 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit471:setParent(obj.layout40);
    obj.edit471:setVertTextAlign("center");
    obj.edit471:setLeft(795);
    obj.edit471:setTop(55);
    obj.edit471:setWidth(65);
    obj.edit471:setHeight(25);
    obj.edit471:setField("alcance18");
    obj.edit471:setName("edit471");

    obj.label309 = GUI.fromHandle(_obj_newObject("label"));
    obj.label309:setParent(obj.layout40);
    obj.label309:setLeft(870);
    obj.label309:setTop(25);
    obj.label309:setWidth(330);
    obj.label309:setHeight(25);
    obj.label309:setHorzTextAlign("center");
    obj.label309:setText("Clique para adicionar imagem");
    obj.label309:setName("label309");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.layout40);
    obj.image19:setField("imagemArma18");
    obj.image19:setEditable(true);
    obj.image19:setStyle("autoFit");
    obj.image19:setLeft(870);
    obj.image19:setTop(5);
    obj.image19:setWidth(330);
    obj.image19:setHeight(75);
    obj.image19:setName("image19");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout22);
    obj.layout41:setLeft(2);
    obj.layout41:setTop(1713);
    obj.layout41:setWidth(1207);
    obj.layout41:setHeight(92);
    obj.layout41:setName("layout41");

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout41);
    obj.rectangle104:setAlign("client");
    obj.rectangle104:setColor("black");
    obj.rectangle104:setName("rectangle104");

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout41);
    obj.rectangle105:setLeft(869);
    obj.rectangle105:setTop(4);
    obj.rectangle105:setWidth(332);
    obj.rectangle105:setHeight(77);
    obj.rectangle105:setColor("black");
    obj.rectangle105:setStrokeColor("white");
    obj.rectangle105:setStrokeSize(1);
    obj.rectangle105:setName("rectangle105");

    obj.label310 = GUI.fromHandle(_obj_newObject("label"));
    obj.label310:setParent(obj.layout41);
    obj.label310:setLeft(5);
    obj.label310:setTop(5);
    obj.label310:setWidth(50);
    obj.label310:setHeight(25);
    obj.label310:setText("NOME");
    obj.label310:setName("label310");

    obj.edit472 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit472:setParent(obj.layout41);
    obj.edit472:setVertTextAlign("center");
    obj.edit472:setLeft(55);
    obj.edit472:setTop(5);
    obj.edit472:setWidth(225);
    obj.edit472:setHeight(25);
    obj.edit472:setField("nome19");
    obj.edit472:setName("edit472");

    obj.label311 = GUI.fromHandle(_obj_newObject("label"));
    obj.label311:setParent(obj.layout41);
    obj.label311:setLeft(5);
    obj.label311:setTop(30);
    obj.label311:setWidth(50);
    obj.label311:setHeight(25);
    obj.label311:setText("ARMA");
    obj.label311:setName("label311");

    obj.edit473 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit473:setParent(obj.layout41);
    obj.edit473:setVertTextAlign("center");
    obj.edit473:setLeft(55);
    obj.edit473:setTop(30);
    obj.edit473:setWidth(225);
    obj.edit473:setHeight(25);
    obj.edit473:setField("arma19");
    obj.edit473:setName("edit473");

    obj.label312 = GUI.fromHandle(_obj_newObject("label"));
    obj.label312:setParent(obj.layout41);
    obj.label312:setLeft(5);
    obj.label312:setTop(55);
    obj.label312:setWidth(50);
    obj.label312:setHeight(25);
    obj.label312:setText("TIPO");
    obj.label312:setName("label312");

    obj.edit474 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit474:setParent(obj.layout41);
    obj.edit474:setVertTextAlign("center");
    obj.edit474:setLeft(55);
    obj.edit474:setTop(55);
    obj.edit474:setWidth(225);
    obj.edit474:setHeight(25);
    obj.edit474:setField("tipo19");
    obj.edit474:setName("edit474");

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout41);
    obj.button69:setLeft(279);
    obj.button69:setTop(6);
    obj.button69:setWidth(73);
    obj.button69:setText("ATAQUE");
    obj.button69:setFontSize(11);
    obj.button69:setName("button69");

    obj.edit475 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit475:setParent(obj.layout41);
    obj.edit475:setType("number");
    obj.edit475:setVertTextAlign("center");
    obj.edit475:setLeft(352);
    obj.edit475:setTop(5);
    obj.edit475:setWidth(25);
    obj.edit475:setHeight(25);
    obj.edit475:setField("ataque19a");
    obj.edit475:setName("edit475");

    obj.edit476 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit476:setParent(obj.layout41);
    obj.edit476:setType("number");
    obj.edit476:setVertTextAlign("center");
    obj.edit476:setLeft(380);
    obj.edit476:setTop(5);
    obj.edit476:setWidth(25);
    obj.edit476:setHeight(25);
    obj.edit476:setField("ataque19b");
    obj.edit476:setName("edit476");

    obj.edit477 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit477:setParent(obj.layout41);
    obj.edit477:setType("number");
    obj.edit477:setVertTextAlign("center");
    obj.edit477:setLeft(409);
    obj.edit477:setTop(5);
    obj.edit477:setWidth(25);
    obj.edit477:setHeight(25);
    obj.edit477:setField("ataque19c");
    obj.edit477:setName("edit477");

    obj.edit478 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit478:setParent(obj.layout41);
    obj.edit478:setType("number");
    obj.edit478:setVertTextAlign("center");
    obj.edit478:setLeft(437);
    obj.edit478:setTop(5);
    obj.edit478:setWidth(25);
    obj.edit478:setHeight(25);
    obj.edit478:setField("ataque19d");
    obj.edit478:setName("edit478");

    obj.edit479 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit479:setParent(obj.layout41);
    obj.edit479:setType("number");
    obj.edit479:setVertTextAlign("center");
    obj.edit479:setLeft(465);
    obj.edit479:setTop(5);
    obj.edit479:setWidth(25);
    obj.edit479:setHeight(25);
    obj.edit479:setField("ataque19e");
    obj.edit479:setName("edit479");

    obj.edit480 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit480:setParent(obj.layout41);
    obj.edit480:setType("number");
    obj.edit480:setVertTextAlign("center");
    obj.edit480:setLeft(493);
    obj.edit480:setTop(5);
    obj.edit480:setWidth(25);
    obj.edit480:setHeight(25);
    obj.edit480:setField("ataque19f");
    obj.edit480:setName("edit480");

    obj.edit481 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit481:setParent(obj.layout41);
    obj.edit481:setType("number");
    obj.edit481:setVertTextAlign("center");
    obj.edit481:setLeft(522);
    obj.edit481:setTop(5);
    obj.edit481:setWidth(25);
    obj.edit481:setHeight(25);
    obj.edit481:setField("ataque19g");
    obj.edit481:setName("edit481");

    obj.edit482 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit482:setParent(obj.layout41);
    obj.edit482:setType("number");
    obj.edit482:setVertTextAlign("center");
    obj.edit482:setLeft(550);
    obj.edit482:setTop(5);
    obj.edit482:setWidth(25);
    obj.edit482:setHeight(25);
    obj.edit482:setField("ataque19h");
    obj.edit482:setName("edit482");

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.layout41);
    obj.button70:setLeft(279);
    obj.button70:setTop(31);
    obj.button70:setWidth(73);
    obj.button70:setText("DANO");
    obj.button70:setFontSize(11);
    obj.button70:setName("button70");

    obj.edit483 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit483:setParent(obj.layout41);
    obj.edit483:setVertTextAlign("center");
    obj.edit483:setLeft(352);
    obj.edit483:setTop(30);
    obj.edit483:setWidth(82);
    obj.edit483:setHeight(25);
    obj.edit483:setField("dano19");
    obj.edit483:setName("edit483");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout41);
    obj.button71:setLeft(434);
    obj.button71:setTop(31);
    obj.button71:setWidth(60);
    obj.button71:setText("CRITICO");
    obj.button71:setFontSize(11);
    obj.button71:setName("button71");

    obj.edit484 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit484:setParent(obj.layout41);
    obj.edit484:setVertTextAlign("center");
    obj.edit484:setLeft(493);
    obj.edit484:setTop(30);
    obj.edit484:setWidth(82);
    obj.edit484:setHeight(25);
    obj.edit484:setField("danoCritico19");
    obj.edit484:setName("edit484");

    obj.label313 = GUI.fromHandle(_obj_newObject("label"));
    obj.label313:setParent(obj.layout41);
    obj.label313:setLeft(290);
    obj.label313:setTop(55);
    obj.label313:setWidth(70);
    obj.label313:setHeight(25);
    obj.label313:setText("DECISIVO");
    obj.label313:setName("label313");

    obj.edit485 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit485:setParent(obj.layout41);
    obj.edit485:setVertTextAlign("center");
    obj.edit485:setLeft(352);
    obj.edit485:setTop(55);
    obj.edit485:setWidth(82);
    obj.edit485:setHeight(25);
    obj.edit485:setField("decisivo19");
    obj.edit485:setName("edit485");

    obj.label314 = GUI.fromHandle(_obj_newObject("label"));
    obj.label314:setParent(obj.layout41);
    obj.label314:setLeft(445);
    obj.label314:setTop(55);
    obj.label314:setWidth(50);
    obj.label314:setHeight(25);
    obj.label314:setText("MULTI");
    obj.label314:setName("label314");

    obj.edit486 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit486:setParent(obj.layout41);
    obj.edit486:setVertTextAlign("center");
    obj.edit486:setLeft(493);
    obj.edit486:setTop(55);
    obj.edit486:setWidth(82);
    obj.edit486:setHeight(25);
    obj.edit486:setField("multiplicador19");
    obj.edit486:setName("edit486");

    obj.label315 = GUI.fromHandle(_obj_newObject("label"));
    obj.label315:setParent(obj.layout41);
    obj.label315:setLeft(580);
    obj.label315:setTop(5);
    obj.label315:setWidth(80);
    obj.label315:setHeight(25);
    obj.label315:setText("CATEGORIA");
    obj.label315:setName("label315");

    obj.edit487 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit487:setParent(obj.layout41);
    obj.edit487:setVertTextAlign("center");
    obj.edit487:setLeft(660);
    obj.edit487:setTop(5);
    obj.edit487:setWidth(200);
    obj.edit487:setHeight(25);
    obj.edit487:setField("categoria19");
    obj.edit487:setName("edit487");

    obj.label316 = GUI.fromHandle(_obj_newObject("label"));
    obj.label316:setParent(obj.layout41);
    obj.label316:setLeft(610);
    obj.label316:setTop(30);
    obj.label316:setWidth(50);
    obj.label316:setHeight(25);
    obj.label316:setText("OBS");
    obj.label316:setName("label316");

    obj.edit488 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit488:setParent(obj.layout41);
    obj.edit488:setVertTextAlign("center");
    obj.edit488:setLeft(660);
    obj.edit488:setTop(30);
    obj.edit488:setWidth(200);
    obj.edit488:setHeight(25);
    obj.edit488:setField("obs19");
    obj.edit488:setName("edit488");

    obj.label317 = GUI.fromHandle(_obj_newObject("label"));
    obj.label317:setParent(obj.layout41);
    obj.label317:setLeft(590);
    obj.label317:setTop(55);
    obj.label317:setWidth(80);
    obj.label317:setHeight(25);
    obj.label317:setText("MUNIÇÃO");
    obj.label317:setName("label317");

    obj.edit489 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit489:setParent(obj.layout41);
    obj.edit489:setType("number");
    obj.edit489:setVertTextAlign("center");
    obj.edit489:setLeft(660);
    obj.edit489:setTop(55);
    obj.edit489:setWidth(69);
    obj.edit489:setHeight(25);
    obj.edit489:setField("municao19");
    obj.edit489:setName("edit489");

    obj.label318 = GUI.fromHandle(_obj_newObject("label"));
    obj.label318:setParent(obj.layout41);
    obj.label318:setLeft(735);
    obj.label318:setTop(55);
    obj.label318:setWidth(70);
    obj.label318:setHeight(25);
    obj.label318:setText("ALCANCE");
    obj.label318:setName("label318");

    obj.edit490 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit490:setParent(obj.layout41);
    obj.edit490:setVertTextAlign("center");
    obj.edit490:setLeft(795);
    obj.edit490:setTop(55);
    obj.edit490:setWidth(65);
    obj.edit490:setHeight(25);
    obj.edit490:setField("alcance19");
    obj.edit490:setName("edit490");

    obj.label319 = GUI.fromHandle(_obj_newObject("label"));
    obj.label319:setParent(obj.layout41);
    obj.label319:setLeft(870);
    obj.label319:setTop(25);
    obj.label319:setWidth(330);
    obj.label319:setHeight(25);
    obj.label319:setHorzTextAlign("center");
    obj.label319:setText("Clique para adicionar imagem");
    obj.label319:setName("label319");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.layout41);
    obj.image20:setField("imagemArma19");
    obj.image20:setEditable(true);
    obj.image20:setStyle("autoFit");
    obj.image20:setLeft(870);
    obj.image20:setTop(5);
    obj.image20:setWidth(330);
    obj.image20:setHeight(75);
    obj.image20:setName("image20");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout22);
    obj.layout42:setLeft(2);
    obj.layout42:setTop(1808);
    obj.layout42:setWidth(1207);
    obj.layout42:setHeight(92);
    obj.layout42:setName("layout42");

    obj.rectangle106 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout42);
    obj.rectangle106:setAlign("client");
    obj.rectangle106:setColor("black");
    obj.rectangle106:setName("rectangle106");

    obj.rectangle107 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout42);
    obj.rectangle107:setLeft(869);
    obj.rectangle107:setTop(4);
    obj.rectangle107:setWidth(332);
    obj.rectangle107:setHeight(77);
    obj.rectangle107:setColor("black");
    obj.rectangle107:setStrokeColor("white");
    obj.rectangle107:setStrokeSize(1);
    obj.rectangle107:setName("rectangle107");

    obj.label320 = GUI.fromHandle(_obj_newObject("label"));
    obj.label320:setParent(obj.layout42);
    obj.label320:setLeft(5);
    obj.label320:setTop(5);
    obj.label320:setWidth(50);
    obj.label320:setHeight(25);
    obj.label320:setText("NOME");
    obj.label320:setName("label320");

    obj.edit491 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit491:setParent(obj.layout42);
    obj.edit491:setVertTextAlign("center");
    obj.edit491:setLeft(55);
    obj.edit491:setTop(5);
    obj.edit491:setWidth(225);
    obj.edit491:setHeight(25);
    obj.edit491:setField("nome20");
    obj.edit491:setName("edit491");

    obj.label321 = GUI.fromHandle(_obj_newObject("label"));
    obj.label321:setParent(obj.layout42);
    obj.label321:setLeft(5);
    obj.label321:setTop(30);
    obj.label321:setWidth(50);
    obj.label321:setHeight(25);
    obj.label321:setText("ARMA");
    obj.label321:setName("label321");

    obj.edit492 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit492:setParent(obj.layout42);
    obj.edit492:setVertTextAlign("center");
    obj.edit492:setLeft(55);
    obj.edit492:setTop(30);
    obj.edit492:setWidth(225);
    obj.edit492:setHeight(25);
    obj.edit492:setField("arma20");
    obj.edit492:setName("edit492");

    obj.label322 = GUI.fromHandle(_obj_newObject("label"));
    obj.label322:setParent(obj.layout42);
    obj.label322:setLeft(5);
    obj.label322:setTop(55);
    obj.label322:setWidth(50);
    obj.label322:setHeight(25);
    obj.label322:setText("TIPO");
    obj.label322:setName("label322");

    obj.edit493 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit493:setParent(obj.layout42);
    obj.edit493:setVertTextAlign("center");
    obj.edit493:setLeft(55);
    obj.edit493:setTop(55);
    obj.edit493:setWidth(225);
    obj.edit493:setHeight(25);
    obj.edit493:setField("tipo20");
    obj.edit493:setName("edit493");

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.layout42);
    obj.button72:setLeft(279);
    obj.button72:setTop(6);
    obj.button72:setWidth(73);
    obj.button72:setText("ATAQUE");
    obj.button72:setFontSize(11);
    obj.button72:setName("button72");

    obj.edit494 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit494:setParent(obj.layout42);
    obj.edit494:setType("number");
    obj.edit494:setVertTextAlign("center");
    obj.edit494:setLeft(352);
    obj.edit494:setTop(5);
    obj.edit494:setWidth(25);
    obj.edit494:setHeight(25);
    obj.edit494:setField("ataque20a");
    obj.edit494:setName("edit494");

    obj.edit495 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit495:setParent(obj.layout42);
    obj.edit495:setType("number");
    obj.edit495:setVertTextAlign("center");
    obj.edit495:setLeft(380);
    obj.edit495:setTop(5);
    obj.edit495:setWidth(25);
    obj.edit495:setHeight(25);
    obj.edit495:setField("ataque20b");
    obj.edit495:setName("edit495");

    obj.edit496 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit496:setParent(obj.layout42);
    obj.edit496:setType("number");
    obj.edit496:setVertTextAlign("center");
    obj.edit496:setLeft(409);
    obj.edit496:setTop(5);
    obj.edit496:setWidth(25);
    obj.edit496:setHeight(25);
    obj.edit496:setField("ataque20c");
    obj.edit496:setName("edit496");

    obj.edit497 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit497:setParent(obj.layout42);
    obj.edit497:setType("number");
    obj.edit497:setVertTextAlign("center");
    obj.edit497:setLeft(437);
    obj.edit497:setTop(5);
    obj.edit497:setWidth(25);
    obj.edit497:setHeight(25);
    obj.edit497:setField("ataque20d");
    obj.edit497:setName("edit497");

    obj.edit498 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit498:setParent(obj.layout42);
    obj.edit498:setType("number");
    obj.edit498:setVertTextAlign("center");
    obj.edit498:setLeft(465);
    obj.edit498:setTop(5);
    obj.edit498:setWidth(25);
    obj.edit498:setHeight(25);
    obj.edit498:setField("ataque20e");
    obj.edit498:setName("edit498");

    obj.edit499 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit499:setParent(obj.layout42);
    obj.edit499:setType("number");
    obj.edit499:setVertTextAlign("center");
    obj.edit499:setLeft(493);
    obj.edit499:setTop(5);
    obj.edit499:setWidth(25);
    obj.edit499:setHeight(25);
    obj.edit499:setField("ataque20f");
    obj.edit499:setName("edit499");

    obj.edit500 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit500:setParent(obj.layout42);
    obj.edit500:setType("number");
    obj.edit500:setVertTextAlign("center");
    obj.edit500:setLeft(522);
    obj.edit500:setTop(5);
    obj.edit500:setWidth(25);
    obj.edit500:setHeight(25);
    obj.edit500:setField("ataque20g");
    obj.edit500:setName("edit500");

    obj.edit501 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit501:setParent(obj.layout42);
    obj.edit501:setType("number");
    obj.edit501:setVertTextAlign("center");
    obj.edit501:setLeft(550);
    obj.edit501:setTop(5);
    obj.edit501:setWidth(25);
    obj.edit501:setHeight(25);
    obj.edit501:setField("ataque20h");
    obj.edit501:setName("edit501");

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.layout42);
    obj.button73:setLeft(279);
    obj.button73:setTop(31);
    obj.button73:setWidth(73);
    obj.button73:setText("DANO");
    obj.button73:setFontSize(11);
    obj.button73:setName("button73");

    obj.edit502 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit502:setParent(obj.layout42);
    obj.edit502:setVertTextAlign("center");
    obj.edit502:setLeft(352);
    obj.edit502:setTop(30);
    obj.edit502:setWidth(82);
    obj.edit502:setHeight(25);
    obj.edit502:setField("dano20");
    obj.edit502:setName("edit502");

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout42);
    obj.button74:setLeft(434);
    obj.button74:setTop(31);
    obj.button74:setWidth(60);
    obj.button74:setText("CRITICO");
    obj.button74:setFontSize(11);
    obj.button74:setName("button74");

    obj.edit503 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit503:setParent(obj.layout42);
    obj.edit503:setVertTextAlign("center");
    obj.edit503:setLeft(493);
    obj.edit503:setTop(30);
    obj.edit503:setWidth(82);
    obj.edit503:setHeight(25);
    obj.edit503:setField("danoCritico20");
    obj.edit503:setName("edit503");

    obj.label323 = GUI.fromHandle(_obj_newObject("label"));
    obj.label323:setParent(obj.layout42);
    obj.label323:setLeft(290);
    obj.label323:setTop(55);
    obj.label323:setWidth(70);
    obj.label323:setHeight(25);
    obj.label323:setText("DECISIVO");
    obj.label323:setName("label323");

    obj.edit504 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit504:setParent(obj.layout42);
    obj.edit504:setVertTextAlign("center");
    obj.edit504:setLeft(352);
    obj.edit504:setTop(55);
    obj.edit504:setWidth(82);
    obj.edit504:setHeight(25);
    obj.edit504:setField("decisivo20");
    obj.edit504:setName("edit504");

    obj.label324 = GUI.fromHandle(_obj_newObject("label"));
    obj.label324:setParent(obj.layout42);
    obj.label324:setLeft(445);
    obj.label324:setTop(55);
    obj.label324:setWidth(50);
    obj.label324:setHeight(25);
    obj.label324:setText("MULTI");
    obj.label324:setName("label324");

    obj.edit505 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit505:setParent(obj.layout42);
    obj.edit505:setVertTextAlign("center");
    obj.edit505:setLeft(493);
    obj.edit505:setTop(55);
    obj.edit505:setWidth(82);
    obj.edit505:setHeight(25);
    obj.edit505:setField("multiplicador20");
    obj.edit505:setName("edit505");

    obj.label325 = GUI.fromHandle(_obj_newObject("label"));
    obj.label325:setParent(obj.layout42);
    obj.label325:setLeft(580);
    obj.label325:setTop(5);
    obj.label325:setWidth(80);
    obj.label325:setHeight(25);
    obj.label325:setText("CATEGORIA");
    obj.label325:setName("label325");

    obj.edit506 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit506:setParent(obj.layout42);
    obj.edit506:setVertTextAlign("center");
    obj.edit506:setLeft(660);
    obj.edit506:setTop(5);
    obj.edit506:setWidth(200);
    obj.edit506:setHeight(25);
    obj.edit506:setField("categoria20");
    obj.edit506:setName("edit506");

    obj.label326 = GUI.fromHandle(_obj_newObject("label"));
    obj.label326:setParent(obj.layout42);
    obj.label326:setLeft(610);
    obj.label326:setTop(30);
    obj.label326:setWidth(50);
    obj.label326:setHeight(25);
    obj.label326:setText("OBS");
    obj.label326:setName("label326");

    obj.edit507 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit507:setParent(obj.layout42);
    obj.edit507:setVertTextAlign("center");
    obj.edit507:setLeft(660);
    obj.edit507:setTop(30);
    obj.edit507:setWidth(200);
    obj.edit507:setHeight(25);
    obj.edit507:setField("obs20");
    obj.edit507:setName("edit507");

    obj.label327 = GUI.fromHandle(_obj_newObject("label"));
    obj.label327:setParent(obj.layout42);
    obj.label327:setLeft(590);
    obj.label327:setTop(55);
    obj.label327:setWidth(80);
    obj.label327:setHeight(25);
    obj.label327:setText("MUNIÇÃO");
    obj.label327:setName("label327");

    obj.edit508 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit508:setParent(obj.layout42);
    obj.edit508:setType("number");
    obj.edit508:setVertTextAlign("center");
    obj.edit508:setLeft(660);
    obj.edit508:setTop(55);
    obj.edit508:setWidth(69);
    obj.edit508:setHeight(25);
    obj.edit508:setField("municao20");
    obj.edit508:setName("edit508");

    obj.label328 = GUI.fromHandle(_obj_newObject("label"));
    obj.label328:setParent(obj.layout42);
    obj.label328:setLeft(735);
    obj.label328:setTop(55);
    obj.label328:setWidth(70);
    obj.label328:setHeight(25);
    obj.label328:setText("ALCANCE");
    obj.label328:setName("label328");

    obj.edit509 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit509:setParent(obj.layout42);
    obj.edit509:setVertTextAlign("center");
    obj.edit509:setLeft(795);
    obj.edit509:setTop(55);
    obj.edit509:setWidth(65);
    obj.edit509:setHeight(25);
    obj.edit509:setField("alcance20");
    obj.edit509:setName("edit509");

    obj.label329 = GUI.fromHandle(_obj_newObject("label"));
    obj.label329:setParent(obj.layout42);
    obj.label329:setLeft(870);
    obj.label329:setTop(25);
    obj.label329:setWidth(330);
    obj.label329:setHeight(25);
    obj.label329:setHorzTextAlign("center");
    obj.label329:setText("Clique para adicionar imagem");
    obj.label329:setName("label329");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.layout42);
    obj.image21:setField("imagemArma20");
    obj.image21:setEditable(true);
    obj.image21:setStyle("autoFit");
    obj.image21:setLeft(870);
    obj.image21:setTop(5);
    obj.image21:setWidth(330);
    obj.image21:setHeight(75);
    obj.image21:setName("image21");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Avançados");
    obj.tab4:setName("tab4");

    obj.frmFichaRPGmeister2a_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister2a_svg:setParent(obj.tab4);
    obj.frmFichaRPGmeister2a_svg:setName("frmFichaRPGmeister2a_svg");
    obj.frmFichaRPGmeister2a_svg:setAlign("client");
    obj.frmFichaRPGmeister2a_svg:setTheme("dark");
    obj.frmFichaRPGmeister2a_svg:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmFichaRPGmeister2a_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.scrollBox3);
    obj.button75:setText("Novo Ataque");
    obj.button75:setLeft(50);
    obj.button75:setTop(2);
    obj.button75:setWidth(100);
    obj.button75:setHeight(20);
    obj.button75:setName("button75");

    obj.rectangle108 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.scrollBox3);
    obj.rectangle108:setLeft(0);
    obj.rectangle108:setTop(25);
    obj.rectangle108:setWidth(205);
    obj.rectangle108:setHeight(600);
    obj.rectangle108:setColor("black");
    obj.rectangle108:setStrokeColor("white");
    obj.rectangle108:setStrokeSize(1);
    obj.rectangle108:setName("rectangle108");

    obj.rclListaDosAtaques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosAtaques:setParent(obj.scrollBox3);
    obj.rclListaDosAtaques:setName("rclListaDosAtaques");
    obj.rclListaDosAtaques:setField("campoDosAtaques");
    obj.rclListaDosAtaques:setTemplateForm("frmFichaRPGmeister2AS_svg");
    obj.rclListaDosAtaques:setLeft(2);
    obj.rclListaDosAtaques:setTop(27);
    obj.rclListaDosAtaques:setWidth(200);
    obj.rclListaDosAtaques:setHeight(595);
    obj.rclListaDosAtaques:setSelectable(true);
    obj.rclListaDosAtaques:setLayout("vertical");
    obj.rclListaDosAtaques:setMinQt(1);

    obj.rectangle109 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.scrollBox3);
    obj.rectangle109:setLeft(208);
    obj.rectangle109:setTop(0);
    obj.rectangle109:setWidth(1134);
    obj.rectangle109:setHeight(624);
    obj.rectangle109:setColor("black");
    obj.rectangle109:setStrokeColor("white");
    obj.rectangle109:setStrokeSize(1);
    obj.rectangle109:setName("rectangle109");

    obj.boxDetalhesDoAtaque = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoAtaque:setParent(obj.scrollBox3);
    obj.boxDetalhesDoAtaque:setName("boxDetalhesDoAtaque");
    obj.boxDetalhesDoAtaque:setVisible(false);
    obj.boxDetalhesDoAtaque:setLeft(210);
    obj.boxDetalhesDoAtaque:setTop(2);
    obj.boxDetalhesDoAtaque:setWidth(1130);
    obj.boxDetalhesDoAtaque:setHeight(620);


				local numeroAtaques = 0;
				local ataquesFeitos = 0;
				local ataqueID=1;
				local weaponID=1;
				local dadoAtaques = {};
				local resultadoAtaques = {};
				local rolando = false;

				local function proximoCritico(rolado)
					ataquesFeitos = ataquesFeitos + 1;

					local personagem = sheet.nome or "personagem";
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
					local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);

					if ataquesFeitos < numeroAtaques then
						ataqueID = ataqueID + 1;
						if ataqueID > weapons[weaponID].numAtaques then
							ataqueID = 1;
							weaponID = weaponID+1;
						end;

						local decisivo = weapons[weaponID].decisivo;
						local armamento = weapons[weaponID].nomeAtaque or "arma";
						local crit = weapons[weaponID].crit;

						if dadoAtaques[ataquesFeitos+1]>=decisivo then
							local rolagem = Firecast.interpretarRolagem(crit);
							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano adicional do decisivo #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
								function (rolado)
									proximoCritico(rolado)
							end);
						else
							proximoCritico(nil);
						end;
					else
						rolando = false;
					end;
					-- Fim do Ataque
				end;

				local function proximaConfirmacao(rolado)
					ataquesFeitos = ataquesFeitos + 1;

					local personagem = sheet.nome or "personagem";
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
					local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);

					if ataquesFeitos < numeroAtaques then
						ataqueID = ataqueID + 1;
						if ataqueID > weapons[weaponID].numAtaques then
							ataqueID = 1;
							weaponID = weaponID+1;
						end;

						local acertos = weapons[weaponID].acertos;
						local decisivo = weapons[weaponID].decisivo;
						local armamento = weapons[weaponID].nomeAtaque or "arma";
						if dadoAtaques[ataquesFeitos+1]>=decisivo then
							local confirmacao = Firecast.interpretarRolagem("1d20+" .. acertos[ataqueID]);
							mesaDoPersonagem.activeChat:rolarDados(confirmacao, "Confirmação de Decisivo do ataque #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
								function (rolado)
									proximaConfirmacao(rolado)
							end);
						else
							proximaConfirmacao(nil);
						end;
					else
						-- Causa o dano adicional

						weaponID = 1;
						ataqueID = 1;
						ataquesFeitos = 0;

						local decisivo = weapons[weaponID].decisivo;
						local armamento = weapons[weaponID].nomeAtaque or "arma";
						local crit = weapons[weaponID].crit;

						if dadoAtaques[ataquesFeitos+1]>=decisivo then
							local rolagem = Firecast.interpretarRolagem(crit);
							mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano adicional do decisivo #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
								function (rolado)
									proximoCritico(rolado)
							end);
						else
							proximoCritico(nil);
						end;
					end;
				end;

				local function proximoDano(rolado)
					ataquesFeitos = ataquesFeitos + 1;

					local personagem = sheet.nome or "personagem";
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
					local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);

					if ataquesFeitos < numeroAtaques then
						ataqueID = ataqueID + 1;
						if ataqueID > weapons[weaponID].numAtaques then
							ataqueID = 1;
							weaponID = weaponID+1;
						end;

						local dano = weapons[weaponID].dado;
						local armamento = weapons[weaponID].nomeAtaque or "arma";

						local rolagem = Firecast.interpretarRolagem(dano);
						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
							function (rolado)
								proximoDano(rolado)
						end);
					else
						-- confirma os criticos

						-- reseta variaveis
						weaponID = 1;
						ataqueID = 1;
						ataquesFeitos = 0;

						local acertos = weapons[weaponID].acertos;
						local decisivo = weapons[weaponID].decisivo;
						local armamento = weapons[weaponID].nomeAtaque or "arma";
						if dadoAtaques[ataquesFeitos+1]>=decisivo then
							local confirmacao = Firecast.interpretarRolagem("1d20+" .. acertos[ataqueID]);
							mesaDoPersonagem.activeChat:rolarDados(confirmacao, "Confirmação de Decisivo do ataque #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
								function (rolado)
									proximaConfirmacao(rolado)
							end);
						else
							proximaConfirmacao(nil);
						end;
					end
				end;

				local function proximoAtaque(rolado)
					ataquesFeitos = ataquesFeitos + 1;
					dadoAtaques[ataquesFeitos] = rolado.ops[1].resultados[1];
					resultadoAtaques[ataquesFeitos] = rolado.resultado;

					local personagem = sheet.nome or "personagem";
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
					local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);

					if ataquesFeitos < numeroAtaques then
						ataqueID = ataqueID + 1;
						if ataqueID > weapons[weaponID].numAtaques then
							ataqueID = 1;
							weaponID = weaponID+1;
						end;

						local acertos = weapons[weaponID].acertos;
						local armamento = weapons[weaponID].nomeAtaque or "arma";

						local rolagem = Firecast.interpretarRolagem("1d20+" .. acertos[ataqueID]);
						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
							function (rolado)
								proximoAtaque(rolado)
						end);

					else
						-- chama o dano

						-- reseta variaveis
						weaponID = 1;
						ataqueID = 1;
						ataquesFeitos = 0;

						local dano = weapons[weaponID].dado;
						local armamento = weapons[weaponID].nomeAtaque or "arma";

						local rolagem = Firecast.interpretarRolagem(dano);
						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Dano #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
							function (rolado)
								proximoDano(rolado)
						end);
					end
				end;

				


    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.boxDetalhesDoAtaque);
    obj.layout43:setLeft(0);
    obj.layout43:setTop(0);
    obj.layout43:setWidth(1130);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.label330 = GUI.fromHandle(_obj_newObject("label"));
    obj.label330:setParent(obj.layout43);
    obj.label330:setLeft(5);
    obj.label330:setTop(5);
    obj.label330:setWidth(70);
    obj.label330:setHeight(20);
    obj.label330:setText("Nome");
    obj.label330:setName("label330");

    obj.edit510 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit510:setParent(obj.layout43);
    obj.edit510:setLeft(55);
    obj.edit510:setTop(5);
    obj.edit510:setWidth(300);
    obj.edit510:setHeight(20);
    obj.edit510:setField("nomeAtaque");
    obj.edit510:setName("edit510");

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout43);
    obj.button76:setText("Nova Arma");
    obj.button76:setLeft(360);
    obj.button76:setTop(5);
    obj.button76:setWidth(100);
    obj.button76:setHeight(20);
    obj.button76:setName("button76");

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout43);
    obj.button77:setText("Ataque Total");
    obj.button77:setLeft(465);
    obj.button77:setTop(5);
    obj.button77:setWidth(100);
    obj.button77:setHeight(20);
    obj.button77:setName("button77");

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout43);
    obj.button78:setText("Cancelar");
    obj.button78:setLeft(570);
    obj.button78:setTop(5);
    obj.button78:setWidth(100);
    obj.button78:setHeight(20);
    obj.button78:setHint("Libera a trava que evita multiplos ataques ao mesmo tempo manualmente. Sistema anti duplo clique. ");
    obj.button78:setName("button78");

    obj.rclListaDeArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDeArmas:setParent(obj.boxDetalhesDoAtaque);
    obj.rclListaDeArmas:setName("rclListaDeArmas");
    obj.rclListaDeArmas:setField("campoDeArmas");
    obj.rclListaDeArmas:setTemplateForm("frmFichaRPGmeister2Aar_svg");
    obj.rclListaDeArmas:setLeft(0);
    obj.rclListaDeArmas:setTop(30);
    obj.rclListaDeArmas:setWidth(1130);
    obj.rclListaDeArmas:setHeight(590);
    obj.rclListaDeArmas:setLayout("vertical");
    obj.rclListaDeArmas:setMinQt(1);

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Perícias");
    obj.tab5:setName("tab5");

    obj.frmFichaRPGmeister3_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister3_svg:setParent(obj.tab5);
    obj.frmFichaRPGmeister3_svg:setName("frmFichaRPGmeister3_svg");
    obj.frmFichaRPGmeister3_svg:setAlign("client");
    obj.frmFichaRPGmeister3_svg:setTheme("dark");
    obj.frmFichaRPGmeister3_svg:setMargins({top=1});

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmFichaRPGmeister3_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");


			
			local dnd = NDB.load("dndskills.xml");

			local function updateAtributes(num)
				local atr = "" .. num;
				local mod = 0;
				
				if num == 1 then
					mod = tonumber(sheet.efetModFor) or 0;
				elseif num == 2 then
					mod = tonumber(sheet.efetModDes) or 0;
				elseif num == 3 then
					mod = tonumber(sheet.efetModCon) or 0;
				elseif num == 4 then
					mod = tonumber(sheet.efetModInt) or 0;
				elseif num == 5 then
					mod = tonumber(sheet.efetModSab) or 0;
				elseif num == 6 then
					mod = tonumber(sheet.efetModCar) or 0;
				end;

				local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					if nodes[i].chavePericia == atr then
						nodes[i].atributoPericia = mod;
					end;
				end
			end;

			local function updatePenalty()
				if sheet~=nil then
					local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
					for i=1, #nodes, 1 do
						if nodes[i].penalidadeArmadura or nodes[i].penalidadeArmadura2 then
							local pen = (tonumber(sheet.penalidade) or 0)

							local mod = 0;
							mod =   (tonumber(nodes[i].atributoPericia) or 0) +
									(tonumber(nodes[i].graduacaoPericia) or 0) +
									(tonumber(nodes[i].penalidesPericia) or 0) +
									(tonumber(nodes[i].racialPericia) or 0) +
									(tonumber(nodes[i].sinergiaPericia) or 0) +
									(tonumber(nodes[i].equipamentosPericia) or 0) +
									(tonumber(nodes[i].magicoPericia) or 0) +
									(tonumber(nodes[i].outrosPericia) or 0) + 
									(tonumber(nodes[i].talentosPericia) or 0) +
									(tonumber(nodes[i].classePericia) or 0);

							if nodes[i].penalidadeArmadura then
								mod = mod + pen;
							end;
							if nodes[i].penalidadeArmadura2 then
								mod = mod + pen;
							end;

							nodes[i].totalPericia = mod;
						end;
					end;
				end;
			end;

			local function dndSkills()
				local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					NDB.deleteNode(nodes[i]);
				end

				for i=1, 43, 1 do
					local pericia = self.rclListaDasPericias:append();
					pericia.nomePericia = dnd[i].nome;
					pericia.chavePericia = dnd[i].chave;
					pericia.exigeTreino = dnd[i].treino;
					if dnd[i].armadura > 0 then
						pericia.penalidadeArmadura2 = true;
					end;
					if dnd[i].armadura > 1 then
						pericia.penalidadeArmadura = true;
					end;
				end;

				self.rclListaDasPericias:sort();
			end;
		


    obj.popPericia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPericia:setParent(obj.scrollBox4);
    obj.popPericia:setName("popPericia");
    obj.popPericia:setWidth(300);
    obj.popPericia:setHeight(185);
    obj.popPericia:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popPericia, "autoScopeNode",  "false");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.popPericia);
    obj.flowLayout14:setAlign("top");
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxControlsPerLine(3);
    obj.flowLayout14:setMargins({bottom=4});
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setName("flowLayout14");

    obj.flowPart184 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart184:setParent(obj.flowLayout14);
    obj.flowPart184:setMinWidth(90);
    obj.flowPart184:setMaxWidth(100);
    obj.flowPart184:setHeight(35);
    obj.flowPart184:setName("flowPart184");

    obj.label331 = GUI.fromHandle(_obj_newObject("label"));
    obj.label331:setParent(obj.flowPart184);
    obj.label331:setAlign("top");
    obj.label331:setFontSize(10);
    obj.label331:setText("Penalidades");
    obj.label331:setHorzTextAlign("center");
    obj.label331:setWordWrap(true);
    obj.label331:setTextTrimming("none");
    obj.label331:setAutoSize(true);
    obj.label331:setName("label331");

    obj.edit511 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit511:setParent(obj.flowPart184);
    obj.edit511:setAlign("client");
    obj.edit511:setField("penalidesPericia");
    obj.edit511:setHorzTextAlign("center");
    obj.edit511:setFontSize(12);
    obj.edit511:setType("number");
    obj.edit511:setName("edit511");

    obj.flowPart185 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart185:setParent(obj.flowLayout14);
    obj.flowPart185:setMinWidth(90);
    obj.flowPart185:setMaxWidth(100);
    obj.flowPart185:setHeight(35);
    obj.flowPart185:setName("flowPart185");

    obj.label332 = GUI.fromHandle(_obj_newObject("label"));
    obj.label332:setParent(obj.flowPart185);
    obj.label332:setAlign("top");
    obj.label332:setFontSize(10);
    obj.label332:setText("Racial");
    obj.label332:setHorzTextAlign("center");
    obj.label332:setWordWrap(true);
    obj.label332:setTextTrimming("none");
    obj.label332:setAutoSize(true);
    obj.label332:setName("label332");

    obj.edit512 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit512:setParent(obj.flowPart185);
    obj.edit512:setAlign("client");
    obj.edit512:setField("racialPericia");
    obj.edit512:setHorzTextAlign("center");
    obj.edit512:setFontSize(12);
    obj.edit512:setType("number");
    obj.edit512:setName("edit512");

    obj.flowPart186 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart186:setParent(obj.flowLayout14);
    obj.flowPart186:setMinWidth(90);
    obj.flowPart186:setMaxWidth(100);
    obj.flowPart186:setHeight(35);
    obj.flowPart186:setName("flowPart186");

    obj.label333 = GUI.fromHandle(_obj_newObject("label"));
    obj.label333:setParent(obj.flowPart186);
    obj.label333:setAlign("top");
    obj.label333:setFontSize(10);
    obj.label333:setText("Sinergia");
    obj.label333:setHorzTextAlign("center");
    obj.label333:setWordWrap(true);
    obj.label333:setTextTrimming("none");
    obj.label333:setAutoSize(true);
    obj.label333:setName("label333");

    obj.edit513 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit513:setParent(obj.flowPart186);
    obj.edit513:setAlign("client");
    obj.edit513:setField("sinergiaPericia");
    obj.edit513:setHorzTextAlign("center");
    obj.edit513:setFontSize(12);
    obj.edit513:setType("number");
    obj.edit513:setName("edit513");

    obj.flowPart187 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart187:setParent(obj.flowLayout14);
    obj.flowPart187:setMinWidth(90);
    obj.flowPart187:setMaxWidth(100);
    obj.flowPart187:setHeight(35);
    obj.flowPart187:setName("flowPart187");

    obj.label334 = GUI.fromHandle(_obj_newObject("label"));
    obj.label334:setParent(obj.flowPart187);
    obj.label334:setAlign("top");
    obj.label334:setFontSize(10);
    obj.label334:setText("Equipamentos");
    obj.label334:setHorzTextAlign("center");
    obj.label334:setWordWrap(true);
    obj.label334:setTextTrimming("none");
    obj.label334:setAutoSize(true);
    obj.label334:setName("label334");

    obj.edit514 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit514:setParent(obj.flowPart187);
    obj.edit514:setAlign("client");
    obj.edit514:setField("equipamentosPericia");
    obj.edit514:setHorzTextAlign("center");
    obj.edit514:setFontSize(12);
    obj.edit514:setType("number");
    obj.edit514:setName("edit514");

    obj.flowPart188 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart188:setParent(obj.flowLayout14);
    obj.flowPart188:setMinWidth(90);
    obj.flowPart188:setMaxWidth(100);
    obj.flowPart188:setHeight(35);
    obj.flowPart188:setName("flowPart188");

    obj.label335 = GUI.fromHandle(_obj_newObject("label"));
    obj.label335:setParent(obj.flowPart188);
    obj.label335:setAlign("top");
    obj.label335:setFontSize(10);
    obj.label335:setText("Magico");
    obj.label335:setHorzTextAlign("center");
    obj.label335:setWordWrap(true);
    obj.label335:setTextTrimming("none");
    obj.label335:setAutoSize(true);
    obj.label335:setName("label335");

    obj.edit515 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit515:setParent(obj.flowPart188);
    obj.edit515:setAlign("client");
    obj.edit515:setField("magicoPericia");
    obj.edit515:setHorzTextAlign("center");
    obj.edit515:setFontSize(12);
    obj.edit515:setType("number");
    obj.edit515:setName("edit515");

    obj.flowPart189 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart189:setParent(obj.flowLayout14);
    obj.flowPart189:setMinWidth(90);
    obj.flowPart189:setMaxWidth(100);
    obj.flowPart189:setHeight(35);
    obj.flowPart189:setName("flowPart189");

    obj.label336 = GUI.fromHandle(_obj_newObject("label"));
    obj.label336:setParent(obj.flowPart189);
    obj.label336:setAlign("top");
    obj.label336:setFontSize(10);
    obj.label336:setText("Outros");
    obj.label336:setHorzTextAlign("center");
    obj.label336:setWordWrap(true);
    obj.label336:setTextTrimming("none");
    obj.label336:setAutoSize(true);
    obj.label336:setName("label336");

    obj.edit516 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit516:setParent(obj.flowPart189);
    obj.edit516:setAlign("client");
    obj.edit516:setField("outrosPericia");
    obj.edit516:setHorzTextAlign("center");
    obj.edit516:setFontSize(12);
    obj.edit516:setType("number");
    obj.edit516:setName("edit516");

    obj.flowPart190 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart190:setParent(obj.flowLayout14);
    obj.flowPart190:setMinWidth(90);
    obj.flowPart190:setMaxWidth(100);
    obj.flowPart190:setHeight(35);
    obj.flowPart190:setName("flowPart190");

    obj.label337 = GUI.fromHandle(_obj_newObject("label"));
    obj.label337:setParent(obj.flowPart190);
    obj.label337:setAlign("top");
    obj.label337:setFontSize(10);
    obj.label337:setText("Talentos");
    obj.label337:setHorzTextAlign("center");
    obj.label337:setWordWrap(true);
    obj.label337:setTextTrimming("none");
    obj.label337:setAutoSize(true);
    obj.label337:setName("label337");

    obj.edit517 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit517:setParent(obj.flowPart190);
    obj.edit517:setAlign("client");
    obj.edit517:setField("talentosPericia");
    obj.edit517:setHorzTextAlign("center");
    obj.edit517:setFontSize(12);
    obj.edit517:setType("number");
    obj.edit517:setName("edit517");

    obj.flowPart191 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart191:setParent(obj.flowLayout14);
    obj.flowPart191:setMinWidth(90);
    obj.flowPart191:setMaxWidth(100);
    obj.flowPart191:setHeight(35);
    obj.flowPart191:setName("flowPart191");

    obj.label338 = GUI.fromHandle(_obj_newObject("label"));
    obj.label338:setParent(obj.flowPart191);
    obj.label338:setAlign("top");
    obj.label338:setFontSize(10);
    obj.label338:setText("Classe");
    obj.label338:setHorzTextAlign("center");
    obj.label338:setWordWrap(true);
    obj.label338:setTextTrimming("none");
    obj.label338:setAutoSize(true);
    obj.label338:setName("label338");

    obj.edit518 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit518:setParent(obj.flowPart191);
    obj.edit518:setAlign("client");
    obj.edit518:setField("classePericia");
    obj.edit518:setHorzTextAlign("center");
    obj.edit518:setFontSize(12);
    obj.edit518:setType("number");
    obj.edit518:setName("edit518");

    obj.flowPart192 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart192:setParent(obj.flowLayout14);
    obj.flowPart192:setMinWidth(90);
    obj.flowPart192:setMaxWidth(100);
    obj.flowPart192:setHeight(35);
    obj.flowPart192:setName("flowPart192");

    obj.label339 = GUI.fromHandle(_obj_newObject("label"));
    obj.label339:setParent(obj.flowPart192);
    obj.label339:setAlign("top");
    obj.label339:setFontSize(10);
    obj.label339:setText("Condicional");
    obj.label339:setHorzTextAlign("center");
    obj.label339:setWordWrap(true);
    obj.label339:setTextTrimming("none");
    obj.label339:setAutoSize(true);
    obj.label339:setName("label339");

    obj.edit519 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit519:setParent(obj.flowPart192);
    obj.edit519:setAlign("client");
    obj.edit519:setField("condicionalPericia");
    obj.edit519:setHorzTextAlign("center");
    obj.edit519:setFontSize(12);
    obj.edit519:setType("number");
    obj.edit519:setName("edit519");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popPericia);
    obj.textEditor3:setAlign("bottom");
    obj.textEditor3:setField("descricao");
    obj.textEditor3:setName("textEditor3");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.popPericia);
    obj.checkBox27:setAlign("left");
    obj.checkBox27:setText("Exige Treino");
    obj.checkBox27:setField("exigeTreino");
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.popPericia);
    obj.checkBox28:setAlign("right");
    obj.checkBox28:setText("Penalidade Armadura");
    obj.checkBox28:setField("penalidadeArmadura");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.popPericia);
    obj.checkBox29:setAlign("right");
    obj.checkBox29:setWidth(20);
    obj.checkBox29:setText("");
    obj.checkBox29:setField("penalidadeArmadura2");
    obj.checkBox29:setName("checkBox29");

    obj.popIdioma = GUI.fromHandle(_obj_newObject("popup"));
    obj.popIdioma:setParent(obj.scrollBox4);
    obj.popIdioma:setName("popIdioma");
    obj.popIdioma:setWidth(200);
    obj.popIdioma:setHeight(100);
    obj.popIdioma:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popIdioma, "autoScopeNode",  "false");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.popIdioma);
    obj.checkBox30:setAlign("top");
    obj.checkBox30:setText("Falar/Entender");
    obj.checkBox30:setField("conversarIdioma");
    obj.checkBox30:setName("checkBox30");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.popIdioma);
    obj.checkBox31:setAlign("top");
    obj.checkBox31:setText("Escrever/Ler");
    obj.checkBox31:setField("escritaIdioma");
    obj.checkBox31:setName("checkBox31");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.popIdioma);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("descricao");
    obj.textEditor4:setName("textEditor4");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox4);
    obj.layout44:setLeft(0);
    obj.layout44:setTop(0);
    obj.layout44:setWidth(930);
    obj.layout44:setHeight(685);
    obj.layout44:setName("layout44");

    obj.rectangle110 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.layout44);
    obj.rectangle110:setAlign("client");
    obj.rectangle110:setColor("black");
    obj.rectangle110:setName("rectangle110");

    obj.label340 = GUI.fromHandle(_obj_newObject("label"));
    obj.label340:setParent(obj.layout44);
    obj.label340:setText("NOME DA PERÍCIA");
    obj.label340:setLeft(20);
    obj.label340:setTop(1);
    obj.label340:setWidth(135);
    obj.label340:setHeight(20);
    obj.label340:setHorzTextAlign("center");
    obj.label340:setName("label340");

    obj.label341 = GUI.fromHandle(_obj_newObject("label"));
    obj.label341:setParent(obj.layout44);
    obj.label341:setText("CHAVE");
    obj.label341:setLeft(165);
    obj.label341:setTop(1);
    obj.label341:setWidth(60);
    obj.label341:setHeight(20);
    obj.label341:setHorzTextAlign("center");
    obj.label341:setName("label341");

    obj.label342 = GUI.fromHandle(_obj_newObject("label"));
    obj.label342:setParent(obj.layout44);
    obj.label342:setText("TOTAL");
    obj.label342:setLeft(245);
    obj.label342:setTop(1);
    obj.label342:setWidth(40);
    obj.label342:setHeight(20);
    obj.label342:setHorzTextAlign("center");
    obj.label342:setName("label342");

    obj.label343 = GUI.fromHandle(_obj_newObject("label"));
    obj.label343:setParent(obj.layout44);
    obj.label343:setText("ATR");
    obj.label343:setLeft(285);
    obj.label343:setTop(1);
    obj.label343:setWidth(33);
    obj.label343:setHeight(20);
    obj.label343:setHorzTextAlign("center");
    obj.label343:setName("label343");

    obj.label344 = GUI.fromHandle(_obj_newObject("label"));
    obj.label344:setParent(obj.layout44);
    obj.label344:setText("GRAD");
    obj.label344:setLeft(320);
    obj.label344:setTop(1);
    obj.label344:setWidth(40);
    obj.label344:setHeight(20);
    obj.label344:setHorzTextAlign("center");
    obj.label344:setName("label344");

    obj.label345 = GUI.fromHandle(_obj_newObject("label"));
    obj.label345:setParent(obj.layout44);
    obj.label345:setText("NOME DA PERÍCIA");
    obj.label345:setLeft(465);
    obj.label345:setTop(1);
    obj.label345:setWidth(135);
    obj.label345:setHeight(20);
    obj.label345:setHorzTextAlign("center");
    obj.label345:setName("label345");

    obj.label346 = GUI.fromHandle(_obj_newObject("label"));
    obj.label346:setParent(obj.layout44);
    obj.label346:setText("CHAVE");
    obj.label346:setLeft(610);
    obj.label346:setTop(1);
    obj.label346:setWidth(60);
    obj.label346:setHeight(20);
    obj.label346:setHorzTextAlign("center");
    obj.label346:setName("label346");

    obj.label347 = GUI.fromHandle(_obj_newObject("label"));
    obj.label347:setParent(obj.layout44);
    obj.label347:setText("TOTAL");
    obj.label347:setLeft(690);
    obj.label347:setTop(1);
    obj.label347:setWidth(40);
    obj.label347:setHeight(20);
    obj.label347:setHorzTextAlign("center");
    obj.label347:setName("label347");

    obj.label348 = GUI.fromHandle(_obj_newObject("label"));
    obj.label348:setParent(obj.layout44);
    obj.label348:setText("ATR");
    obj.label348:setLeft(730);
    obj.label348:setTop(1);
    obj.label348:setWidth(33);
    obj.label348:setHeight(20);
    obj.label348:setHorzTextAlign("center");
    obj.label348:setName("label348");

    obj.label349 = GUI.fromHandle(_obj_newObject("label"));
    obj.label349:setParent(obj.layout44);
    obj.label349:setText("GRAD");
    obj.label349:setLeft(765);
    obj.label349:setTop(1);
    obj.label349:setWidth(40);
    obj.label349:setHeight(20);
    obj.label349:setHorzTextAlign("center");
    obj.label349:setName("label349");

    obj.rclListaDasPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.layout44);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmFichaRPGmeister3p_svg");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(920);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox4);
    obj.layout45:setLeft(940);
    obj.layout45:setTop(0);
    obj.layout45:setWidth(175);
    obj.layout45:setHeight(60);
    obj.layout45:setName("layout45");

    obj.rectangle111 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout45);
    obj.rectangle111:setAlign("client");
    obj.rectangle111:setColor("black");
    obj.rectangle111:setName("rectangle111");

    obj.label350 = GUI.fromHandle(_obj_newObject("label"));
    obj.label350:setParent(obj.layout45);
    obj.label350:setText("PONTOS GASTOS");
    obj.label350:setLeft(0);
    obj.label350:setTop(5);
    obj.label350:setWidth(130);
    obj.label350:setHeight(20);
    obj.label350:setHorzTextAlign("center");
    obj.label350:setName("label350");

    obj.rectangle112 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout45);
    obj.rectangle112:setLeft(130);
    obj.rectangle112:setTop(5);
    obj.rectangle112:setWidth(40);
    obj.rectangle112:setHeight(20);
    obj.rectangle112:setColor("black");
    obj.rectangle112:setStrokeColor("white");
    obj.rectangle112:setStrokeSize(1);
    obj.rectangle112:setName("rectangle112");

    obj.label351 = GUI.fromHandle(_obj_newObject("label"));
    obj.label351:setParent(obj.layout45);
    obj.label351:setField("pontosPericia");
    obj.label351:setLeft(130);
    obj.label351:setTop(5);
    obj.label351:setWidth(40);
    obj.label351:setHeight(20);
    obj.label351:setHorzTextAlign("center");
    obj.label351:setName("label351");

    obj.label352 = GUI.fromHandle(_obj_newObject("label"));
    obj.label352:setParent(obj.layout45);
    obj.label352:setText("PERÍCIAS DE CLASSE");
    obj.label352:setLeft(0);
    obj.label352:setTop(30);
    obj.label352:setWidth(130);
    obj.label352:setHeight(20);
    obj.label352:setHorzTextAlign("center");
    obj.label352:setName("label352");

    obj.rectangle113 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.layout45);
    obj.rectangle113:setLeft(130);
    obj.rectangle113:setTop(30);
    obj.rectangle113:setWidth(40);
    obj.rectangle113:setHeight(20);
    obj.rectangle113:setColor("black");
    obj.rectangle113:setStrokeColor("white");
    obj.rectangle113:setStrokeSize(1);
    obj.rectangle113:setName("rectangle113");

    obj.label353 = GUI.fromHandle(_obj_newObject("label"));
    obj.label353:setParent(obj.layout45);
    obj.label353:setField("periciasClasse");
    obj.label353:setLeft(130);
    obj.label353:setTop(30);
    obj.label353:setWidth(40);
    obj.label353:setHeight(20);
    obj.label353:setHorzTextAlign("center");
    obj.label353:setName("label353");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox4);
    obj.layout46:setLeft(940);
    obj.layout46:setTop(70);
    obj.layout46:setWidth(135);
    obj.layout46:setHeight(200);
    obj.layout46:setName("layout46");

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout46);
    obj.button79:setText("Nova Perícia");
    obj.button79:setLeft(0);
    obj.button79:setTop(0);
    obj.button79:setWidth(125);
    obj.button79:setHeight(25);
    obj.button79:setName("button79");

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout46);
    obj.button80:setText("Padrão DnD3.5");
    obj.button80:setLeft(0);
    obj.button80:setTop(25);
    obj.button80:setWidth(125);
    obj.button80:setHeight(25);
    obj.button80:setHint("Vai apagar todas perícias atuais. ");
    obj.button80:setName("button80");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Habilidades");
    obj.tab6:setName("tab6");

    obj.frmFichaRPGmeister4_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister4_svg:setParent(obj.tab6);
    obj.frmFichaRPGmeister4_svg:setName("frmFichaRPGmeister4_svg");
    obj.frmFichaRPGmeister4_svg:setAlign("client");
    obj.frmFichaRPGmeister4_svg:setTheme("dark");
    obj.frmFichaRPGmeister4_svg:setMargins({top=1});

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmFichaRPGmeister4_svg);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.popHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.scrollBox5);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(300);
    obj.popHabilidade:setHeight(240);
    obj.popHabilidade:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHabilidade, "autoScopeNode",  "false");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.popHabilidade);
    obj.flowLayout15:setAlign("top");
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setMaxControlsPerLine(3);
    obj.flowLayout15:setMargins({bottom=4});
    obj.flowLayout15:setHorzAlign("center");
    obj.flowLayout15:setName("flowLayout15");

    obj.flowPart193 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart193:setParent(obj.flowLayout15);
    obj.flowPart193:setMinWidth(45);
    obj.flowPart193:setMaxWidth(100);
    obj.flowPart193:setHeight(35);
    obj.flowPart193:setName("flowPart193");

    obj.label354 = GUI.fromHandle(_obj_newObject("label"));
    obj.label354:setParent(obj.flowPart193);
    obj.label354:setAlign("top");
    obj.label354:setFontSize(10);
    obj.label354:setText("Nível");
    obj.label354:setHorzTextAlign("center");
    obj.label354:setWordWrap(true);
    obj.label354:setTextTrimming("none");
    obj.label354:setAutoSize(true);
    obj.label354:setName("label354");

    obj.edit520 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit520:setParent(obj.flowPart193);
    obj.edit520:setAlign("client");
    obj.edit520:setField("nivelHabilidade");
    obj.edit520:setHorzTextAlign("center");
    obj.edit520:setFontSize(12);
    obj.edit520:setType("number");
    obj.edit520:setName("edit520");

    obj.flowPart194 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart194:setParent(obj.flowLayout15);
    obj.flowPart194:setMinWidth(45);
    obj.flowPart194:setMaxWidth(100);
    obj.flowPart194:setHeight(35);
    obj.flowPart194:setName("flowPart194");

    obj.label355 = GUI.fromHandle(_obj_newObject("label"));
    obj.label355:setParent(obj.flowPart194);
    obj.label355:setAlign("top");
    obj.label355:setFontSize(10);
    obj.label355:setText("Custo");
    obj.label355:setHorzTextAlign("center");
    obj.label355:setWordWrap(true);
    obj.label355:setTextTrimming("none");
    obj.label355:setAutoSize(true);
    obj.label355:setName("label355");

    obj.edit521 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit521:setParent(obj.flowPart194);
    obj.edit521:setAlign("client");
    obj.edit521:setField("custoHabilidade");
    obj.edit521:setHorzTextAlign("center");
    obj.edit521:setFontSize(12);
    obj.edit521:setType("number");
    obj.edit521:setName("edit521");

    obj.flowPart195 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart195:setParent(obj.flowLayout15);
    obj.flowPart195:setMinWidth(180);
    obj.flowPart195:setMaxWidth(200);
    obj.flowPart195:setHeight(35);
    obj.flowPart195:setName("flowPart195");

    obj.label356 = GUI.fromHandle(_obj_newObject("label"));
    obj.label356:setParent(obj.flowPart195);
    obj.label356:setAlign("top");
    obj.label356:setFontSize(10);
    obj.label356:setText("Obtido");
    obj.label356:setHorzTextAlign("center");
    obj.label356:setWordWrap(true);
    obj.label356:setTextTrimming("none");
    obj.label356:setAutoSize(true);
    obj.label356:setName("label356");

    obj.edit522 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit522:setParent(obj.flowPart195);
    obj.edit522:setAlign("client");
    obj.edit522:setField("obtencaoHabilidade");
    obj.edit522:setFontSize(12);
    obj.edit522:setName("edit522");

    obj.flowPart196 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart196:setParent(obj.flowLayout15);
    obj.flowPart196:setMinWidth(45);
    obj.flowPart196:setMaxWidth(100);
    obj.flowPart196:setHeight(35);
    obj.flowPart196:setName("flowPart196");

    obj.label357 = GUI.fromHandle(_obj_newObject("label"));
    obj.label357:setParent(obj.flowPart196);
    obj.label357:setAlign("top");
    obj.label357:setFontSize(10);
    obj.label357:setText("Página");
    obj.label357:setHorzTextAlign("center");
    obj.label357:setWordWrap(true);
    obj.label357:setTextTrimming("none");
    obj.label357:setAutoSize(true);
    obj.label357:setName("label357");

    obj.edit523 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit523:setParent(obj.flowPart196);
    obj.edit523:setAlign("client");
    obj.edit523:setField("paginaHabilidade");
    obj.edit523:setHorzTextAlign("center");
    obj.edit523:setFontSize(12);
    obj.edit523:setType("number");
    obj.edit523:setName("edit523");

    obj.flowPart197 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart197:setParent(obj.flowLayout15);
    obj.flowPart197:setMinWidth(180);
    obj.flowPart197:setMaxWidth(200);
    obj.flowPart197:setHeight(35);
    obj.flowPart197:setName("flowPart197");

    obj.label358 = GUI.fromHandle(_obj_newObject("label"));
    obj.label358:setParent(obj.flowPart197);
    obj.label358:setAlign("top");
    obj.label358:setFontSize(10);
    obj.label358:setText("Livro");
    obj.label358:setHorzTextAlign("center");
    obj.label358:setWordWrap(true);
    obj.label358:setTextTrimming("none");
    obj.label358:setAutoSize(true);
    obj.label358:setName("label358");

    obj.edit524 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit524:setParent(obj.flowPart197);
    obj.edit524:setAlign("client");
    obj.edit524:setField("livroHabilidade");
    obj.edit524:setFontSize(12);
    obj.edit524:setName("edit524");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.flowLayout15);
    obj.dataLink45:setField("nivelHabilidade");
    obj.dataLink45:setName("dataLink45");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.popHabilidade);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("descricao");
    obj.textEditor5:setName("textEditor5");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox5);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(0);
    obj.layout47:setWidth(380);
    obj.layout47:setHeight(600);
    obj.layout47:setName("layout47");

    obj.rectangle114 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.layout47);
    obj.rectangle114:setAlign("client");
    obj.rectangle114:setColor("#0000007F");
    obj.rectangle114:setName("rectangle114");

    obj.label359 = GUI.fromHandle(_obj_newObject("label"));
    obj.label359:setParent(obj.layout47);
    obj.label359:setLeft(0);
    obj.label359:setTop(0);
    obj.label359:setWidth(380);
    obj.label359:setHeight(20);
    obj.label359:setText("TALENTOS");
    obj.label359:setHorzTextAlign("center");
    obj.label359:setName("label359");

    obj.rclListaDosTalentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTalentos:setParent(obj.layout47);
    obj.rclListaDosTalentos:setName("rclListaDosTalentos");
    obj.rclListaDosTalentos:setField("campoDosTalentos");
    obj.rclListaDosTalentos:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosTalentos:setLeft(5);
    obj.rclListaDosTalentos:setTop(25);
    obj.rclListaDosTalentos:setWidth(370);
    obj.rclListaDosTalentos:setHeight(570);
    obj.rclListaDosTalentos:setLayout("vertical");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox5);
    obj.layout48:setLeft(395);
    obj.layout48:setTop(0);
    obj.layout48:setWidth(380);
    obj.layout48:setHeight(600);
    obj.layout48:setName("layout48");

    obj.rectangle115 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.layout48);
    obj.rectangle115:setAlign("client");
    obj.rectangle115:setColor("#0000007F");
    obj.rectangle115:setName("rectangle115");

    obj.label360 = GUI.fromHandle(_obj_newObject("label"));
    obj.label360:setParent(obj.layout48);
    obj.label360:setLeft(0);
    obj.label360:setTop(0);
    obj.label360:setWidth(380);
    obj.label360:setHeight(20);
    obj.label360:setText("OUTROS");
    obj.label360:setHorzTextAlign("center");
    obj.label360:setName("label360");

    obj.rclListaDosOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros:setParent(obj.layout48);
    obj.rclListaDosOutros:setName("rclListaDosOutros");
    obj.rclListaDosOutros:setField("campoDosOutros");
    obj.rclListaDosOutros:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosOutros:setLeft(5);
    obj.rclListaDosOutros:setTop(25);
    obj.rclListaDosOutros:setWidth(370);
    obj.rclListaDosOutros:setHeight(570);
    obj.rclListaDosOutros:setLayout("vertical");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox5);
    obj.layout49:setLeft(790);
    obj.layout49:setTop(0);
    obj.layout49:setWidth(380);
    obj.layout49:setHeight(375);
    obj.layout49:setName("layout49");

    obj.rectangle116 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.layout49);
    obj.rectangle116:setAlign("client");
    obj.rectangle116:setColor("#0000007F");
    obj.rectangle116:setName("rectangle116");

    obj.label361 = GUI.fromHandle(_obj_newObject("label"));
    obj.label361:setParent(obj.layout49);
    obj.label361:setLeft(0);
    obj.label361:setTop(0);
    obj.label361:setWidth(380);
    obj.label361:setHeight(20);
    obj.label361:setText("CARACTERISTICAS DE CLASSE");
    obj.label361:setHorzTextAlign("center");
    obj.label361:setName("label361");

    obj.rclListaDasCaracteristicasClasse = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasCaracteristicasClasse:setParent(obj.layout49);
    obj.rclListaDasCaracteristicasClasse:setName("rclListaDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDasCaracteristicasClasse:setLeft(5);
    obj.rclListaDasCaracteristicasClasse:setTop(25);
    obj.rclListaDasCaracteristicasClasse:setWidth(370);
    obj.rclListaDasCaracteristicasClasse:setHeight(345);
    obj.rclListaDasCaracteristicasClasse:setLayout("vertical");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.scrollBox5);
    obj.layout50:setLeft(790);
    obj.layout50:setTop(385);
    obj.layout50:setWidth(380);
    obj.layout50:setHeight(215);
    obj.layout50:setName("layout50");

    obj.rectangle117 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout50);
    obj.rectangle117:setAlign("client");
    obj.rectangle117:setColor("#0000007F");
    obj.rectangle117:setName("rectangle117");

    obj.label362 = GUI.fromHandle(_obj_newObject("label"));
    obj.label362:setParent(obj.layout50);
    obj.label362:setLeft(10);
    obj.label362:setTop(5);
    obj.label362:setWidth(150);
    obj.label362:setHeight(20);
    obj.label362:setText("Conceito");
    obj.label362:setHorzTextAlign("center");
    obj.label362:setName("label362");

    obj.edit525 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit525:setParent(obj.layout50);
    obj.edit525:setLeft(160);
    obj.edit525:setTop(5);
    obj.edit525:setWidth(150);
    obj.edit525:setHeight(25);
    obj.edit525:setField("classeConceito");
    obj.edit525:setName("edit525");

    obj.label363 = GUI.fromHandle(_obj_newObject("label"));
    obj.label363:setParent(obj.layout50);
    obj.label363:setLeft(310);
    obj.label363:setTop(5);
    obj.label363:setWidth(65);
    obj.label363:setHeight(20);
    obj.label363:setText("TOTAL");
    obj.label363:setHorzTextAlign("center");
    obj.label363:setName("label363");

    obj.rectangle118 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.layout50);
    obj.rectangle118:setLeft(315);
    obj.rectangle118:setTop(30);
    obj.rectangle118:setWidth(60);
    obj.rectangle118:setHeight(60);
    obj.rectangle118:setColor("black");
    obj.rectangle118:setStrokeColor("white");
    obj.rectangle118:setStrokeSize(1);
    obj.rectangle118:setName("rectangle118");

    obj.label364 = GUI.fromHandle(_obj_newObject("label"));
    obj.label364:setParent(obj.layout50);
    obj.label364:setLeft(315);
    obj.label364:setTop(30);
    obj.label364:setWidth(60);
    obj.label364:setHeight(60);
    obj.label364:setField("classePontos");
    obj.label364:setHorzTextAlign("center");
    obj.label364:setName("label364");

    obj.label365 = GUI.fromHandle(_obj_newObject("label"));
    obj.label365:setParent(obj.layout50);
    obj.label365:setLeft(10);
    obj.label365:setTop(35);
    obj.label365:setWidth(150);
    obj.label365:setHeight(20);
    obj.label365:setText("Bônus Base Ataque");
    obj.label365:setHorzTextAlign("center");
    obj.label365:setName("label365");

    obj.classeBBA = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.classeBBA:setParent(obj.layout50);
    obj.classeBBA:setVertTextAlign("center");
    obj.classeBBA:setHorzTextAlign("center");
    obj.classeBBA:setLeft(160);
    obj.classeBBA:setTop(35);
    obj.classeBBA:setWidth(150);
    obj.classeBBA:setHeight(25);
    obj.classeBBA:setName("classeBBA");
    obj.classeBBA:setField("classeBBA");
    obj.classeBBA:setItems({'Ruim (0)', 'Médio (+1)', 'Bom (+2)'});
    obj.classeBBA:setValues({'0', '1', '2'});
    obj.classeBBA:setFontColor("white");

    obj.label366 = GUI.fromHandle(_obj_newObject("label"));
    obj.label366:setParent(obj.layout50);
    obj.label366:setLeft(10);
    obj.label366:setTop(65);
    obj.label366:setWidth(150);
    obj.label366:setHeight(20);
    obj.label366:setText("Bônus Base Fortitude");
    obj.label366:setHorzTextAlign("center");
    obj.label366:setName("label366");

    obj.classeBBF = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.classeBBF:setParent(obj.layout50);
    obj.classeBBF:setVertTextAlign("center");
    obj.classeBBF:setHorzTextAlign("center");
    obj.classeBBF:setLeft(160);
    obj.classeBBF:setTop(65);
    obj.classeBBF:setWidth(150);
    obj.classeBBF:setHeight(25);
    obj.classeBBF:setName("classeBBF");
    obj.classeBBF:setField("classeBBF");
    obj.classeBBF:setItems({'Ruim (0)', 'Bom (+1)'});
    obj.classeBBF:setValues({'0', '1'});
    obj.classeBBF:setFontColor("white");

    obj.label367 = GUI.fromHandle(_obj_newObject("label"));
    obj.label367:setParent(obj.layout50);
    obj.label367:setLeft(10);
    obj.label367:setTop(95);
    obj.label367:setWidth(150);
    obj.label367:setHeight(20);
    obj.label367:setText("Bônus Base Reflexos");
    obj.label367:setHorzTextAlign("center");
    obj.label367:setName("label367");

    obj.classeBBR = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.classeBBR:setParent(obj.layout50);
    obj.classeBBR:setVertTextAlign("center");
    obj.classeBBR:setHorzTextAlign("center");
    obj.classeBBR:setLeft(160);
    obj.classeBBR:setTop(95);
    obj.classeBBR:setWidth(150);
    obj.classeBBR:setHeight(25);
    obj.classeBBR:setName("classeBBR");
    obj.classeBBR:setField("classeBBR");
    obj.classeBBR:setItems({'Ruim (0)', 'Bom (+1)'});
    obj.classeBBR:setValues({'0', '1'});
    obj.classeBBR:setFontColor("white");

    obj.label368 = GUI.fromHandle(_obj_newObject("label"));
    obj.label368:setParent(obj.layout50);
    obj.label368:setLeft(10);
    obj.label368:setTop(125);
    obj.label368:setWidth(150);
    obj.label368:setHeight(20);
    obj.label368:setText("Bônus Base Vontade");
    obj.label368:setHorzTextAlign("center");
    obj.label368:setName("label368");

    obj.classeBBV = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.classeBBV:setParent(obj.layout50);
    obj.classeBBV:setVertTextAlign("center");
    obj.classeBBV:setHorzTextAlign("center");
    obj.classeBBV:setLeft(160);
    obj.classeBBV:setTop(125);
    obj.classeBBV:setWidth(150);
    obj.classeBBV:setHeight(25);
    obj.classeBBV:setName("classeBBV");
    obj.classeBBV:setField("classeBBV");
    obj.classeBBV:setItems({'Ruim (0)', 'Bom (+1)'});
    obj.classeBBV:setValues({'0', '1'});
    obj.classeBBV:setFontColor("white");

    obj.label369 = GUI.fromHandle(_obj_newObject("label"));
    obj.label369:setParent(obj.layout50);
    obj.label369:setLeft(10);
    obj.label369:setTop(155);
    obj.label369:setWidth(150);
    obj.label369:setHeight(20);
    obj.label369:setText("Perícias");
    obj.label369:setHorzTextAlign("center");
    obj.label369:setName("label369");

    obj.classePericia = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.classePericia:setParent(obj.layout50);
    obj.classePericia:setVertTextAlign("center");
    obj.classePericia:setHorzTextAlign("center");
    obj.classePericia:setLeft(160);
    obj.classePericia:setTop(155);
    obj.classePericia:setWidth(150);
    obj.classePericia:setHeight(25);
    obj.classePericia:setName("classePericia");
    obj.classePericia:setField("classePericia");
    obj.classePericia:setItems({'Ruim (0)', 'Médio (+1)', 'Bom (+2)', 'Excelente (+3)'});
    obj.classePericia:setValues({'0', '1', '2', '3'});
    obj.classePericia:setFontColor("white");

    obj.label370 = GUI.fromHandle(_obj_newObject("label"));
    obj.label370:setParent(obj.layout50);
    obj.label370:setLeft(10);
    obj.label370:setTop(185);
    obj.label370:setWidth(150);
    obj.label370:setHeight(20);
    obj.label370:setText("Dados de Vida");
    obj.label370:setHorzTextAlign("center");
    obj.label370:setName("label370");

    obj.classeDVs = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.classeDVs:setParent(obj.layout50);
    obj.classeDVs:setVertTextAlign("center");
    obj.classeDVs:setHorzTextAlign("center");
    obj.classeDVs:setLeft(160);
    obj.classeDVs:setTop(185);
    obj.classeDVs:setWidth(150);
    obj.classeDVs:setHeight(25);
    obj.classeDVs:setName("classeDVs");
    obj.classeDVs:setField("classeDVs");
    obj.classeDVs:setItems({'Ruim (0)', 'Médio (+1)', 'Bom (+2)', 'Excelente (+3)'});
    obj.classeDVs:setValues({'0', '1', '2', '3'});
    obj.classeDVs:setFontColor("white");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout50);
    obj.dataLink46:setFields({'classeBBA','classeBBF','classeBBR','classeBBV','classePericia','classeDVs'});
    obj.dataLink46:setDefaultValues({'0','0','0','0','0','0'});
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout50);
    obj.dataLink47:setFields({'nep','classeBBA','classeBBF','classeBBR','classeBBV'});
    obj.dataLink47:setName("dataLink47");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox5);
    obj.layout51:setLeft(1180);
    obj.layout51:setTop(0);
    obj.layout51:setWidth(135);
    obj.layout51:setHeight(600);
    obj.layout51:setName("layout51");

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.layout51);
    obj.button81:setText("Novo Talento");
    obj.button81:setLeft(0);
    obj.button81:setTop(0);
    obj.button81:setWidth(125);
    obj.button81:setHeight(25);
    obj.button81:setName("button81");

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.layout51);
    obj.button82:setText("Novo Outros");
    obj.button82:setLeft(0);
    obj.button82:setTop(25);
    obj.button82:setWidth(125);
    obj.button82:setHeight(25);
    obj.button82:setName("button82");

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.layout51);
    obj.button83:setText("Nova Caracteristica");
    obj.button83:setLeft(0);
    obj.button83:setTop(50);
    obj.button83:setWidth(125);
    obj.button83:setHeight(25);
    obj.button83:setName("button83");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Dobras");
    obj.tab7:setName("tab7");

    obj.frmDobras = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDobras:setParent(obj.tab7);
    obj.frmDobras:setName("frmDobras");
    obj.frmDobras:setAlign("client");
    obj.frmDobras:setTheme("dark");
    obj.frmDobras:setMargins({top=1});

	
		local function rollTest()
			local mesaDoPersonagem = Firecast.getMesaDe(sheet);

			local mod = (tonumber(sheet.testeDobra) or 0);
			local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);

			mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Dobra de " .. (sheet.nome or "Nome"));
		end;

		


    obj.popDobra = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDobra:setParent(obj.frmDobras);
    obj.popDobra:setName("popDobra");
    obj.popDobra:setWidth(250);
    obj.popDobra:setHeight(250);
    obj.popDobra:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popDobra, "autoScopeNode",  "false");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.popDobra);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("descricao");
    obj.textEditor6:setName("textEditor6");

    obj.popTecnica = GUI.fromHandle(_obj_newObject("popup"));
    obj.popTecnica:setParent(obj.frmDobras);
    obj.popTecnica:setName("popTecnica");
    obj.popTecnica:setWidth(250);
    obj.popTecnica:setHeight(250);
    obj.popTecnica:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popTecnica, "autoScopeNode",  "false");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.popTecnica);
    obj.flowLayout16:setAlign("top");
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setMaxControlsPerLine(3);
    obj.flowLayout16:setMargins({bottom=4});
    obj.flowLayout16:setHorzAlign("center");
    obj.flowLayout16:setName("flowLayout16");

    obj.flowPart198 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart198:setParent(obj.flowLayout16);
    obj.flowPart198:setMinWidth(125);
    obj.flowPart198:setMaxWidth(250);
    obj.flowPart198:setHeight(35);
    obj.flowPart198:setName("flowPart198");

    obj.label371 = GUI.fromHandle(_obj_newObject("label"));
    obj.label371:setParent(obj.flowPart198);
    obj.label371:setAlign("top");
    obj.label371:setFontSize(10);
    obj.label371:setText("Elementos");
    obj.label371:setHorzTextAlign("center");
    obj.label371:setWordWrap(true);
    obj.label371:setTextTrimming("none");
    obj.label371:setAutoSize(true);
    obj.label371:setName("label371");

    obj.edit526 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit526:setParent(obj.flowPart198);
    obj.edit526:setAlign("client");
    obj.edit526:setField("elementos");
    obj.edit526:setFontSize(12);
    obj.edit526:setName("edit526");

    obj.flowPart199 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart199:setParent(obj.flowLayout16);
    obj.flowPart199:setMinWidth(125);
    obj.flowPart199:setMaxWidth(250);
    obj.flowPart199:setHeight(35);
    obj.flowPart199:setName("flowPart199");

    obj.label372 = GUI.fromHandle(_obj_newObject("label"));
    obj.label372:setParent(obj.flowPart199);
    obj.label372:setAlign("top");
    obj.label372:setFontSize(10);
    obj.label372:setText("Duração");
    obj.label372:setHorzTextAlign("center");
    obj.label372:setWordWrap(true);
    obj.label372:setTextTrimming("none");
    obj.label372:setAutoSize(true);
    obj.label372:setName("label372");

    obj.edit527 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit527:setParent(obj.flowPart199);
    obj.edit527:setAlign("client");
    obj.edit527:setField("duracao");
    obj.edit527:setFontSize(12);
    obj.edit527:setName("edit527");

    obj.flowPart200 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart200:setParent(obj.flowLayout16);
    obj.flowPart200:setMinWidth(125);
    obj.flowPart200:setMaxWidth(250);
    obj.flowPart200:setHeight(35);
    obj.flowPart200:setName("flowPart200");

    obj.label373 = GUI.fromHandle(_obj_newObject("label"));
    obj.label373:setParent(obj.flowPart200);
    obj.label373:setAlign("top");
    obj.label373:setFontSize(10);
    obj.label373:setText("CD");
    obj.label373:setHorzTextAlign("center");
    obj.label373:setWordWrap(true);
    obj.label373:setTextTrimming("none");
    obj.label373:setAutoSize(true);
    obj.label373:setName("label373");

    obj.edit528 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit528:setParent(obj.flowPart200);
    obj.edit528:setAlign("client");
    obj.edit528:setField("cd");
    obj.edit528:setFontSize(12);
    obj.edit528:setName("edit528");

    obj.flowPart201 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart201:setParent(obj.flowLayout16);
    obj.flowPart201:setMinWidth(125);
    obj.flowPart201:setMaxWidth(250);
    obj.flowPart201:setHeight(35);
    obj.flowPart201:setName("flowPart201");

    obj.label374 = GUI.fromHandle(_obj_newObject("label"));
    obj.label374:setParent(obj.flowPart201);
    obj.label374:setAlign("top");
    obj.label374:setFontSize(10);
    obj.label374:setText("Material");
    obj.label374:setHorzTextAlign("center");
    obj.label374:setWordWrap(true);
    obj.label374:setTextTrimming("none");
    obj.label374:setAutoSize(true);
    obj.label374:setName("label374");

    obj.edit529 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit529:setParent(obj.flowPart201);
    obj.edit529:setAlign("client");
    obj.edit529:setField("material");
    obj.edit529:setFontSize(12);
    obj.edit529:setName("edit529");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.popTecnica);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("descricao");
    obj.textEditor7:setName("textEditor7");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmDobras);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.scrollBox6);
    obj.layout52:setLeft(0);
    obj.layout52:setTop(0);
    obj.layout52:setWidth(335);
    obj.layout52:setHeight(455);
    obj.layout52:setName("layout52");

    obj.rectangle119 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout52);
    obj.rectangle119:setAlign("client");
    obj.rectangle119:setColor("#0000007F");
    obj.rectangle119:setName("rectangle119");

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.layout52);
    obj.button84:setText("+");
    obj.button84:setLeft(5);
    obj.button84:setTop(0);
    obj.button84:setWidth(25);
    obj.button84:setHeight(25);
    obj.button84:setName("button84");

    obj.label375 = GUI.fromHandle(_obj_newObject("label"));
    obj.label375:setParent(obj.layout52);
    obj.label375:setLeft(0);
    obj.label375:setTop(0);
    obj.label375:setWidth(335);
    obj.label375:setHeight(20);
    obj.label375:setText("DOBRAS");
    obj.label375:setHorzTextAlign("center");
    obj.label375:setName("label375");

    obj.label376 = GUI.fromHandle(_obj_newObject("label"));
    obj.label376:setParent(obj.layout52);
    obj.label376:setLeft(5);
    obj.label376:setTop(25);
    obj.label376:setWidth(150);
    obj.label376:setHeight(20);
    obj.label376:setText("TIPO");
    obj.label376:setHorzTextAlign("center");
    obj.label376:setName("label376");

    obj.label377 = GUI.fromHandle(_obj_newObject("label"));
    obj.label377:setParent(obj.layout52);
    obj.label377:setLeft(155);
    obj.label377:setTop(25);
    obj.label377:setWidth(50);
    obj.label377:setHeight(20);
    obj.label377:setText("NÍVEL");
    obj.label377:setHorzTextAlign("center");
    obj.label377:setName("label377");

    obj.label378 = GUI.fromHandle(_obj_newObject("label"));
    obj.label378:setParent(obj.layout52);
    obj.label378:setLeft(205);
    obj.label378:setTop(25);
    obj.label378:setWidth(50);
    obj.label378:setHeight(20);
    obj.label378:setText("PT");
    obj.label378:setHorzTextAlign("center");
    obj.label378:setName("label378");

    obj.rclListaDasDobras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasDobras:setParent(obj.layout52);
    obj.rclListaDasDobras:setName("rclListaDasDobras");
    obj.rclListaDasDobras:setField("campoDasDobras");
    obj.rclListaDasDobras:setTemplateForm("frmDobra");
    obj.rclListaDasDobras:setLeft(5);
    obj.rclListaDasDobras:setTop(50);
    obj.rclListaDasDobras:setWidth(320);
    obj.rclListaDasDobras:setHeight(400);
    obj.rclListaDasDobras:setLayout("vertical");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox6);
    obj.layout53:setLeft(0);
    obj.layout53:setTop(465);
    obj.layout53:setWidth(335);
    obj.layout53:setHeight(135);
    obj.layout53:setName("layout53");

    obj.rectangle120 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout53);
    obj.rectangle120:setAlign("client");
    obj.rectangle120:setColor("#0000007F");
    obj.rectangle120:setName("rectangle120");

    obj.label379 = GUI.fromHandle(_obj_newObject("label"));
    obj.label379:setParent(obj.layout53);
    obj.label379:setLeft(5);
    obj.label379:setTop(5);
    obj.label379:setWidth(150);
    obj.label379:setHeight(20);
    obj.label379:setText("Atributo de Dobra");
    obj.label379:setHorzTextAlign("center");
    obj.label379:setName("label379");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout53);
    obj.comboBox5:setVertTextAlign("center");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setLeft(155);
    obj.comboBox5:setTop(5);
    obj.comboBox5:setWidth(60);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("chaveDobra");
    obj.comboBox5:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox5:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setName("comboBox5");

    obj.rectangle121 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout53);
    obj.rectangle121:setLeft(220);
    obj.rectangle121:setTop(5);
    obj.rectangle121:setWidth(35);
    obj.rectangle121:setHeight(25);
    obj.rectangle121:setColor("black");
    obj.rectangle121:setStrokeColor("white");
    obj.rectangle121:setStrokeSize(1);
    obj.rectangle121:setName("rectangle121");

    obj.label380 = GUI.fromHandle(_obj_newObject("label"));
    obj.label380:setParent(obj.layout53);
    obj.label380:setField("atributoDobra");
    obj.label380:setText("0");
    obj.label380:setLeft(220);
    obj.label380:setTop(5);
    obj.label380:setWidth(35);
    obj.label380:setHeight(25);
    obj.label380:setHorzTextAlign("center");
    obj.label380:setName("label380");

    obj.rectangle122 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout53);
    obj.rectangle122:setLeft(260);
    obj.rectangle122:setTop(5);
    obj.rectangle122:setWidth(35);
    obj.rectangle122:setHeight(25);
    obj.rectangle122:setColor("black");
    obj.rectangle122:setStrokeColor("white");
    obj.rectangle122:setStrokeSize(1);
    obj.rectangle122:setName("rectangle122");

    obj.label381 = GUI.fromHandle(_obj_newObject("label"));
    obj.label381:setParent(obj.layout53);
    obj.label381:setField("atributoDobraMod");
    obj.label381:setText("0");
    obj.label381:setLeft(260);
    obj.label381:setTop(5);
    obj.label381:setWidth(35);
    obj.label381:setHeight(25);
    obj.label381:setHorzTextAlign("center");
    obj.label381:setName("label381");

    obj.label382 = GUI.fromHandle(_obj_newObject("label"));
    obj.label382:setParent(obj.layout53);
    obj.label382:setLeft(5);
    obj.label382:setTop(35);
    obj.label382:setWidth(150);
    obj.label382:setHeight(20);
    obj.label382:setText("Capacidade de Dobra");
    obj.label382:setHorzTextAlign("center");
    obj.label382:setName("label382");

    obj.rectangle123 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.layout53);
    obj.rectangle123:setLeft(155);
    obj.rectangle123:setTop(35);
    obj.rectangle123:setWidth(35);
    obj.rectangle123:setHeight(25);
    obj.rectangle123:setColor("black");
    obj.rectangle123:setStrokeColor("white");
    obj.rectangle123:setStrokeSize(1);
    obj.rectangle123:setName("rectangle123");

    obj.label383 = GUI.fromHandle(_obj_newObject("label"));
    obj.label383:setParent(obj.layout53);
    obj.label383:setField("capacidadeDobra");
    obj.label383:setText("0");
    obj.label383:setLeft(155);
    obj.label383:setTop(35);
    obj.label383:setWidth(35);
    obj.label383:setHeight(25);
    obj.label383:setHorzTextAlign("center");
    obj.label383:setName("label383");

    obj.edit530 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit530:setParent(obj.layout53);
    obj.edit530:setVertTextAlign("center");
    obj.edit530:setHorzTextAlign("center");
    obj.edit530:setLeft(200);
    obj.edit530:setTop(35);
    obj.edit530:setWidth(30);
    obj.edit530:setHeight(25);
    obj.edit530:setField("capacidadeDobraAdicional");
    obj.edit530:setType("number");
    obj.edit530:setName("edit530");

    obj.edit531 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit531:setParent(obj.layout53);
    obj.edit531:setVertTextAlign("center");
    obj.edit531:setHorzTextAlign("center");
    obj.edit531:setLeft(230);
    obj.edit531:setTop(35);
    obj.edit531:setWidth(30);
    obj.edit531:setHeight(25);
    obj.edit531:setField("capacidadeDobraOutros");
    obj.edit531:setType("number");
    obj.edit531:setName("edit531");

    obj.label384 = GUI.fromHandle(_obj_newObject("label"));
    obj.label384:setParent(obj.layout53);
    obj.label384:setLeft(5);
    obj.label384:setTop(65);
    obj.label384:setWidth(150);
    obj.label384:setHeight(20);
    obj.label384:setText("Nível de Dobrador");
    obj.label384:setHorzTextAlign("center");
    obj.label384:setName("label384");

    obj.rectangle124 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.layout53);
    obj.rectangle124:setLeft(155);
    obj.rectangle124:setTop(65);
    obj.rectangle124:setWidth(35);
    obj.rectangle124:setHeight(25);
    obj.rectangle124:setColor("black");
    obj.rectangle124:setStrokeColor("white");
    obj.rectangle124:setStrokeSize(1);
    obj.rectangle124:setName("rectangle124");

    obj.label385 = GUI.fromHandle(_obj_newObject("label"));
    obj.label385:setParent(obj.layout53);
    obj.label385:setField("nivelDobrador");
    obj.label385:setText("0");
    obj.label385:setLeft(155);
    obj.label385:setTop(65);
    obj.label385:setWidth(35);
    obj.label385:setHeight(25);
    obj.label385:setHorzTextAlign("center");
    obj.label385:setName("label385");

    obj.edit532 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit532:setParent(obj.layout53);
    obj.edit532:setVertTextAlign("center");
    obj.edit532:setHorzTextAlign("center");
    obj.edit532:setLeft(200);
    obj.edit532:setTop(65);
    obj.edit532:setWidth(30);
    obj.edit532:setHeight(25);
    obj.edit532:setField("nivelDobradorAdicional");
    obj.edit532:setType("number");
    obj.edit532:setName("edit532");

    obj.edit533 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit533:setParent(obj.layout53);
    obj.edit533:setVertTextAlign("center");
    obj.edit533:setHorzTextAlign("center");
    obj.edit533:setLeft(230);
    obj.edit533:setTop(65);
    obj.edit533:setWidth(30);
    obj.edit533:setHeight(25);
    obj.edit533:setField("nivelDobradorOutros");
    obj.edit533:setType("number");
    obj.edit533:setName("edit533");

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.layout53);
    obj.button85:setLeft(15);
    obj.button85:setTop(95);
    obj.button85:setWidth(130);
    obj.button85:setHeight(25);
    obj.button85:setText("Teste de Dobra");
    obj.button85:setHorzTextAlign("center");
    obj.button85:setName("button85");

    obj.rectangle125 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.layout53);
    obj.rectangle125:setLeft(155);
    obj.rectangle125:setTop(95);
    obj.rectangle125:setWidth(35);
    obj.rectangle125:setHeight(25);
    obj.rectangle125:setColor("black");
    obj.rectangle125:setStrokeColor("white");
    obj.rectangle125:setStrokeSize(1);
    obj.rectangle125:setName("rectangle125");

    obj.label386 = GUI.fromHandle(_obj_newObject("label"));
    obj.label386:setParent(obj.layout53);
    obj.label386:setField("testeDobra");
    obj.label386:setText("0");
    obj.label386:setLeft(155);
    obj.label386:setTop(95);
    obj.label386:setWidth(35);
    obj.label386:setHeight(25);
    obj.label386:setHorzTextAlign("center");
    obj.label386:setName("label386");

    obj.edit534 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit534:setParent(obj.layout53);
    obj.edit534:setVertTextAlign("center");
    obj.edit534:setHorzTextAlign("center");
    obj.edit534:setLeft(200);
    obj.edit534:setTop(95);
    obj.edit534:setWidth(30);
    obj.edit534:setHeight(25);
    obj.edit534:setField("testeDobraAdicional");
    obj.edit534:setType("number");
    obj.edit534:setName("edit534");

    obj.edit535 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit535:setParent(obj.layout53);
    obj.edit535:setVertTextAlign("center");
    obj.edit535:setHorzTextAlign("center");
    obj.edit535:setLeft(230);
    obj.edit535:setTop(95);
    obj.edit535:setWidth(30);
    obj.edit535:setHeight(25);
    obj.edit535:setField("testeDobraOutros");
    obj.edit535:setType("number");
    obj.edit535:setName("edit535");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout53);
    obj.dataLink48:setFields({'nep','atributoDobraMod','capacidadeDobraAdicional','nivelDobradorAdicional','testeDobraAdicional','capacidadeDobraOutros','nivelDobradorOutros','testeDobraOutros'});
    obj.dataLink48:setName("dataLink48");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox6);
    obj.layout54:setLeft(345);
    obj.layout54:setTop(0);
    obj.layout54:setWidth(335);
    obj.layout54:setHeight(600);
    obj.layout54:setName("layout54");

    obj.rectangle126 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.layout54);
    obj.rectangle126:setAlign("client");
    obj.rectangle126:setColor("#0000007F");
    obj.rectangle126:setName("rectangle126");

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.layout54);
    obj.button86:setText("+");
    obj.button86:setLeft(5);
    obj.button86:setTop(0);
    obj.button86:setWidth(25);
    obj.button86:setHeight(25);
    obj.button86:setName("button86");

    obj.label387 = GUI.fromHandle(_obj_newObject("label"));
    obj.label387:setParent(obj.layout54);
    obj.label387:setLeft(0);
    obj.label387:setTop(0);
    obj.label387:setWidth(335);
    obj.label387:setHeight(20);
    obj.label387:setText("TECNICAS");
    obj.label387:setHorzTextAlign("center");
    obj.label387:setName("label387");

    obj.label388 = GUI.fromHandle(_obj_newObject("label"));
    obj.label388:setParent(obj.layout54);
    obj.label388:setLeft(5);
    obj.label388:setTop(25);
    obj.label388:setWidth(150);
    obj.label388:setHeight(20);
    obj.label388:setText("TIPO");
    obj.label388:setHorzTextAlign("center");
    obj.label388:setName("label388");

    obj.label389 = GUI.fromHandle(_obj_newObject("label"));
    obj.label389:setParent(obj.layout54);
    obj.label389:setLeft(155);
    obj.label389:setTop(25);
    obj.label389:setWidth(50);
    obj.label389:setHeight(20);
    obj.label389:setText("NÍVEL");
    obj.label389:setHorzTextAlign("center");
    obj.label389:setName("label389");

    obj.label390 = GUI.fromHandle(_obj_newObject("label"));
    obj.label390:setParent(obj.layout54);
    obj.label390:setLeft(205);
    obj.label390:setTop(25);
    obj.label390:setWidth(50);
    obj.label390:setHeight(20);
    obj.label390:setText("PT");
    obj.label390:setHorzTextAlign("center");
    obj.label390:setName("label390");

    obj.rclListaDasTecnicas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTecnicas:setParent(obj.layout54);
    obj.rclListaDasTecnicas:setName("rclListaDasTecnicas");
    obj.rclListaDasTecnicas:setField("campoDasTecnicas");
    obj.rclListaDasTecnicas:setTemplateForm("frmTecnica");
    obj.rclListaDasTecnicas:setLeft(5);
    obj.rclListaDasTecnicas:setTop(50);
    obj.rclListaDasTecnicas:setWidth(320);
    obj.rclListaDasTecnicas:setHeight(545);
    obj.rclListaDasTecnicas:setLayout("vertical");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.scrollBox6);
    obj.layout55:setLeft(690);
    obj.layout55:setTop(0);
    obj.layout55:setWidth(385);
    obj.layout55:setHeight(600);
    obj.layout55:setName("layout55");

    obj.rectangle127 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.layout55);
    obj.rectangle127:setAlign("client");
    obj.rectangle127:setColor("#0000007F");
    obj.rectangle127:setName("rectangle127");

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.layout55);
    obj.button87:setText("+");
    obj.button87:setLeft(5);
    obj.button87:setTop(0);
    obj.button87:setWidth(25);
    obj.button87:setHeight(25);
    obj.button87:setName("button87");

    obj.label391 = GUI.fromHandle(_obj_newObject("label"));
    obj.label391:setParent(obj.layout55);
    obj.label391:setLeft(0);
    obj.label391:setTop(0);
    obj.label391:setWidth(385);
    obj.label391:setHeight(20);
    obj.label391:setText("TECNICAS AVANÇADAS");
    obj.label391:setHorzTextAlign("center");
    obj.label391:setName("label391");

    obj.label392 = GUI.fromHandle(_obj_newObject("label"));
    obj.label392:setParent(obj.layout55);
    obj.label392:setLeft(5);
    obj.label392:setTop(25);
    obj.label392:setWidth(150);
    obj.label392:setHeight(20);
    obj.label392:setText("TIPO");
    obj.label392:setHorzTextAlign("center");
    obj.label392:setName("label392");

    obj.label393 = GUI.fromHandle(_obj_newObject("label"));
    obj.label393:setParent(obj.layout55);
    obj.label393:setLeft(155);
    obj.label393:setTop(25);
    obj.label393:setWidth(50);
    obj.label393:setHeight(20);
    obj.label393:setText("NÍVEL");
    obj.label393:setHorzTextAlign("center");
    obj.label393:setName("label393");

    obj.label394 = GUI.fromHandle(_obj_newObject("label"));
    obj.label394:setParent(obj.layout55);
    obj.label394:setLeft(205);
    obj.label394:setTop(25);
    obj.label394:setWidth(50);
    obj.label394:setHeight(20);
    obj.label394:setText("AJUSTE");
    obj.label394:setHorzTextAlign("center");
    obj.label394:setName("label394");

    obj.label395 = GUI.fromHandle(_obj_newObject("label"));
    obj.label395:setParent(obj.layout55);
    obj.label395:setLeft(255);
    obj.label395:setTop(25);
    obj.label395:setWidth(50);
    obj.label395:setHeight(20);
    obj.label395:setText("PT");
    obj.label395:setHorzTextAlign("center");
    obj.label395:setName("label395");

    obj.rclListaDasTecnicasAvancadas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTecnicasAvancadas:setParent(obj.layout55);
    obj.rclListaDasTecnicasAvancadas:setName("rclListaDasTecnicasAvancadas");
    obj.rclListaDasTecnicasAvancadas:setField("campoDasTecnicasAvancadas");
    obj.rclListaDasTecnicasAvancadas:setTemplateForm("frmAvancado");
    obj.rclListaDasTecnicasAvancadas:setLeft(5);
    obj.rclListaDasTecnicasAvancadas:setTop(50);
    obj.rclListaDasTecnicasAvancadas:setWidth(375);
    obj.rclListaDasTecnicasAvancadas:setHeight(545);
    obj.rclListaDasTecnicasAvancadas:setLayout("vertical");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Inventario");
    obj.tab8:setName("tab8");

    obj.frmFichaRPGmeister7_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister7_svg:setParent(obj.tab8);
    obj.frmFichaRPGmeister7_svg:setName("frmFichaRPGmeister7_svg");
    obj.frmFichaRPGmeister7_svg:setAlign("client");
    obj.frmFichaRPGmeister7_svg:setTheme("dark");
    obj.frmFichaRPGmeister7_svg:setMargins({top=1});

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmFichaRPGmeister7_svg);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox7);
    obj.layout56:setLeft(0);
    obj.layout56:setTop(0);
    obj.layout56:setWidth(475);
    obj.layout56:setHeight(330);
    obj.layout56:setName("layout56");

    obj.rectangle128 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.layout56);
    obj.rectangle128:setAlign("client");
    obj.rectangle128:setColor("black");
    obj.rectangle128:setName("rectangle128");

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.layout56);
    obj.button88:setText("+");
    obj.button88:setLeft(5);
    obj.button88:setTop(5);
    obj.button88:setWidth(20);
    obj.button88:setHeight(20);
    obj.button88:setName("button88");

    obj.label396 = GUI.fromHandle(_obj_newObject("label"));
    obj.label396:setParent(obj.layout56);
    obj.label396:setLeft(30);
    obj.label396:setTop(5);
    obj.label396:setWidth(435);
    obj.label396:setHeight(20);
    obj.label396:setText("ARMAS E ESCUDOS                                     Kg         $");
    obj.label396:setName("label396");

    obj.rclListaDasArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasArmas:setParent(obj.layout56);
    obj.rclListaDasArmas:setName("rclListaDasArmas");
    obj.rclListaDasArmas:setField("campoDasArmas");
    obj.rclListaDasArmas:setTemplateForm("frmFichaRPGmeister7A_svg");
    obj.rclListaDasArmas:setLeft(5);
    obj.rclListaDasArmas:setTop(25);
    obj.rclListaDasArmas:setWidth(465);
    obj.rclListaDasArmas:setHeight(275);
    obj.rclListaDasArmas:setLayout("vertical");
    obj.rclListaDasArmas:setMinQt(1);

    obj.label397 = GUI.fromHandle(_obj_newObject("label"));
    obj.label397:setParent(obj.layout56);
    obj.label397:setLeft(260);
    obj.label397:setTop(305);
    obj.label397:setWidth(50);
    obj.label397:setHeight(20);
    obj.label397:setText("Kg");
    obj.label397:setName("label397");

    obj.rectangle129 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.layout56);
    obj.rectangle129:setLeft(280);
    obj.rectangle129:setTop(305);
    obj.rectangle129:setWidth(70);
    obj.rectangle129:setHeight(20);
    obj.rectangle129:setColor("black");
    obj.rectangle129:setStrokeColor("white");
    obj.rectangle129:setStrokeSize(1);
    obj.rectangle129:setName("rectangle129");

    obj.label398 = GUI.fromHandle(_obj_newObject("label"));
    obj.label398:setParent(obj.layout56);
    obj.label398:setVertTextAlign("center");
    obj.label398:setHorzTextAlign("center");
    obj.label398:setLeft(280);
    obj.label398:setTop(305);
    obj.label398:setWidth(70);
    obj.label398:setHeight(20);
    obj.label398:setField("pesoArmas");
    obj.label398:setName("label398");

    obj.label399 = GUI.fromHandle(_obj_newObject("label"));
    obj.label399:setParent(obj.layout56);
    obj.label399:setLeft(360);
    obj.label399:setTop(305);
    obj.label399:setWidth(50);
    obj.label399:setHeight(20);
    obj.label399:setText("$");
    obj.label399:setName("label399");

    obj.rectangle130 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.layout56);
    obj.rectangle130:setLeft(375);
    obj.rectangle130:setTop(305);
    obj.rectangle130:setWidth(91);
    obj.rectangle130:setHeight(20);
    obj.rectangle130:setColor("black");
    obj.rectangle130:setStrokeColor("white");
    obj.rectangle130:setStrokeSize(1);
    obj.rectangle130:setName("rectangle130");

    obj.label400 = GUI.fromHandle(_obj_newObject("label"));
    obj.label400:setParent(obj.layout56);
    obj.label400:setVertTextAlign("center");
    obj.label400:setHorzTextAlign("center");
    obj.label400:setLeft(375);
    obj.label400:setTop(305);
    obj.label400:setWidth(91);
    obj.label400:setHeight(20);
    obj.label400:setField("precoArmas");
    obj.label400:setName("label400");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.scrollBox7);
    obj.layout57:setLeft(0);
    obj.layout57:setTop(335);
    obj.layout57:setWidth(475);
    obj.layout57:setHeight(335);
    obj.layout57:setName("layout57");

    obj.rectangle131 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.layout57);
    obj.rectangle131:setAlign("client");
    obj.rectangle131:setColor("black");
    obj.rectangle131:setName("rectangle131");

    obj.label401 = GUI.fromHandle(_obj_newObject("label"));
    obj.label401:setParent(obj.layout57);
    obj.label401:setLeft(5);
    obj.label401:setTop(1);
    obj.label401:setWidth(200);
    obj.label401:setHeight(20);
    obj.label401:setText("MOCHILA");
    obj.label401:setName("label401");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout57);
    obj.textEditor8:setLeft(5);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(465);
    obj.textEditor8:setHeight(280);
    obj.textEditor8:setField("mochila");
    obj.textEditor8:setName("textEditor8");

    obj.label402 = GUI.fromHandle(_obj_newObject("label"));
    obj.label402:setParent(obj.layout57);
    obj.label402:setLeft(280);
    obj.label402:setTop(310);
    obj.label402:setWidth(50);
    obj.label402:setHeight(20);
    obj.label402:setText("Kg");
    obj.label402:setName("label402");

    obj.edit536 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit536:setParent(obj.layout57);
    obj.edit536:setVertTextAlign("center");
    obj.edit536:setHorzTextAlign("center");
    obj.edit536:setLeft(300);
    obj.edit536:setTop(310);
    obj.edit536:setWidth(70);
    obj.edit536:setHeight(20);
    obj.edit536:setField("pesoMochila");
    obj.edit536:setName("edit536");

    obj.label403 = GUI.fromHandle(_obj_newObject("label"));
    obj.label403:setParent(obj.layout57);
    obj.label403:setLeft(380);
    obj.label403:setTop(310);
    obj.label403:setWidth(50);
    obj.label403:setHeight(20);
    obj.label403:setText("$");
    obj.label403:setName("label403");

    obj.edit537 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit537:setParent(obj.layout57);
    obj.edit537:setVertTextAlign("center");
    obj.edit537:setHorzTextAlign("center");
    obj.edit537:setLeft(395);
    obj.edit537:setTop(310);
    obj.edit537:setWidth(71);
    obj.edit537:setHeight(20);
    obj.edit537:setField("precoMochila");
    obj.edit537:setName("edit537");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.scrollBox7);
    obj.layout58:setLeft(480);
    obj.layout58:setTop(0);
    obj.layout58:setWidth(200);
    obj.layout58:setHeight(220);
    obj.layout58:setName("layout58");

    obj.rectangle132 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.layout58);
    obj.rectangle132:setAlign("client");
    obj.rectangle132:setColor("black");
    obj.rectangle132:setName("rectangle132");

    obj.label404 = GUI.fromHandle(_obj_newObject("label"));
    obj.label404:setParent(obj.layout58);
    obj.label404:setLeft(5);
    obj.label404:setTop(1);
    obj.label404:setWidth(150);
    obj.label404:setHeight(20);
    obj.label404:setText("PERMANENCIAS");
    obj.label404:setName("label404");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout58);
    obj.textEditor9:setLeft(5);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(190);
    obj.textEditor9:setHeight(165);
    obj.textEditor9:setField("permanencias");
    obj.textEditor9:setName("textEditor9");

    obj.label405 = GUI.fromHandle(_obj_newObject("label"));
    obj.label405:setParent(obj.layout58);
    obj.label405:setLeft(5);
    obj.label405:setTop(195);
    obj.label405:setWidth(50);
    obj.label405:setHeight(20);
    obj.label405:setText("Kg");
    obj.label405:setName("label405");

    obj.edit538 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit538:setParent(obj.layout58);
    obj.edit538:setVertTextAlign("center");
    obj.edit538:setHorzTextAlign("center");
    obj.edit538:setLeft(25);
    obj.edit538:setTop(195);
    obj.edit538:setWidth(70);
    obj.edit538:setHeight(20);
    obj.edit538:setField("pesoPermanencias");
    obj.edit538:setName("edit538");

    obj.label406 = GUI.fromHandle(_obj_newObject("label"));
    obj.label406:setParent(obj.layout58);
    obj.label406:setLeft(105);
    obj.label406:setTop(195);
    obj.label406:setWidth(50);
    obj.label406:setHeight(20);
    obj.label406:setText("$");
    obj.label406:setName("label406");

    obj.edit539 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit539:setParent(obj.layout58);
    obj.edit539:setVertTextAlign("center");
    obj.edit539:setHorzTextAlign("center");
    obj.edit539:setLeft(120);
    obj.edit539:setTop(195);
    obj.edit539:setWidth(70);
    obj.edit539:setHeight(20);
    obj.edit539:setField("precoPermanencias");
    obj.edit539:setName("edit539");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.scrollBox7);
    obj.layout59:setLeft(685);
    obj.layout59:setTop(0);
    obj.layout59:setWidth(200);
    obj.layout59:setHeight(220);
    obj.layout59:setName("layout59");

    obj.rectangle133 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.layout59);
    obj.rectangle133:setAlign("client");
    obj.rectangle133:setColor("black");
    obj.rectangle133:setName("rectangle133");

    obj.label407 = GUI.fromHandle(_obj_newObject("label"));
    obj.label407:setParent(obj.layout59);
    obj.label407:setLeft(5);
    obj.label407:setTop(1);
    obj.label407:setWidth(150);
    obj.label407:setHeight(20);
    obj.label407:setText("LIVRES");
    obj.label407:setName("label407");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout59);
    obj.textEditor10:setLeft(5);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(190);
    obj.textEditor10:setHeight(165);
    obj.textEditor10:setField("livres");
    obj.textEditor10:setName("textEditor10");

    obj.label408 = GUI.fromHandle(_obj_newObject("label"));
    obj.label408:setParent(obj.layout59);
    obj.label408:setLeft(5);
    obj.label408:setTop(195);
    obj.label408:setWidth(50);
    obj.label408:setHeight(20);
    obj.label408:setText("Kg");
    obj.label408:setName("label408");

    obj.edit540 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit540:setParent(obj.layout59);
    obj.edit540:setVertTextAlign("center");
    obj.edit540:setHorzTextAlign("center");
    obj.edit540:setLeft(25);
    obj.edit540:setTop(195);
    obj.edit540:setWidth(70);
    obj.edit540:setHeight(20);
    obj.edit540:setField("pesoLivres");
    obj.edit540:setName("edit540");

    obj.label409 = GUI.fromHandle(_obj_newObject("label"));
    obj.label409:setParent(obj.layout59);
    obj.label409:setLeft(105);
    obj.label409:setTop(195);
    obj.label409:setWidth(50);
    obj.label409:setHeight(20);
    obj.label409:setText("$");
    obj.label409:setName("label409");

    obj.edit541 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit541:setParent(obj.layout59);
    obj.edit541:setVertTextAlign("center");
    obj.edit541:setHorzTextAlign("center");
    obj.edit541:setLeft(120);
    obj.edit541:setTop(195);
    obj.edit541:setWidth(70);
    obj.edit541:setHeight(20);
    obj.edit541:setField("precoLivres");
    obj.edit541:setName("edit541");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.scrollBox7);
    obj.layout60:setLeft(480);
    obj.layout60:setTop(225);
    obj.layout60:setWidth(200);
    obj.layout60:setHeight(220);
    obj.layout60:setName("layout60");

    obj.rectangle134 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.layout60);
    obj.rectangle134:setAlign("client");
    obj.rectangle134:setColor("black");
    obj.rectangle134:setName("rectangle134");

    obj.label410 = GUI.fromHandle(_obj_newObject("label"));
    obj.label410:setParent(obj.layout60);
    obj.label410:setLeft(5);
    obj.label410:setTop(1);
    obj.label410:setWidth(150);
    obj.label410:setHeight(20);
    obj.label410:setText("OUTROS");
    obj.label410:setName("label410");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout60);
    obj.textEditor11:setLeft(5);
    obj.textEditor11:setTop(25);
    obj.textEditor11:setWidth(190);
    obj.textEditor11:setHeight(165);
    obj.textEditor11:setField("outros");
    obj.textEditor11:setName("textEditor11");

    obj.label411 = GUI.fromHandle(_obj_newObject("label"));
    obj.label411:setParent(obj.layout60);
    obj.label411:setLeft(5);
    obj.label411:setTop(195);
    obj.label411:setWidth(50);
    obj.label411:setHeight(20);
    obj.label411:setText("Kg");
    obj.label411:setName("label411");

    obj.edit542 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit542:setParent(obj.layout60);
    obj.edit542:setVertTextAlign("center");
    obj.edit542:setHorzTextAlign("center");
    obj.edit542:setLeft(25);
    obj.edit542:setTop(195);
    obj.edit542:setWidth(70);
    obj.edit542:setHeight(20);
    obj.edit542:setField("pesoOutros");
    obj.edit542:setName("edit542");

    obj.label412 = GUI.fromHandle(_obj_newObject("label"));
    obj.label412:setParent(obj.layout60);
    obj.label412:setLeft(105);
    obj.label412:setTop(195);
    obj.label412:setWidth(50);
    obj.label412:setHeight(20);
    obj.label412:setText("$");
    obj.label412:setName("label412");

    obj.edit543 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit543:setParent(obj.layout60);
    obj.edit543:setVertTextAlign("center");
    obj.edit543:setHorzTextAlign("center");
    obj.edit543:setLeft(120);
    obj.edit543:setTop(195);
    obj.edit543:setWidth(70);
    obj.edit543:setHeight(20);
    obj.edit543:setField("precoOutros");
    obj.edit543:setName("edit543");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.scrollBox7);
    obj.layout61:setLeft(685);
    obj.layout61:setTop(225);
    obj.layout61:setWidth(200);
    obj.layout61:setHeight(220);
    obj.layout61:setName("layout61");

    obj.rectangle135 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.layout61);
    obj.rectangle135:setAlign("client");
    obj.rectangle135:setColor("black");
    obj.rectangle135:setName("rectangle135");

    obj.label413 = GUI.fromHandle(_obj_newObject("label"));
    obj.label413:setParent(obj.layout61);
    obj.label413:setLeft(5);
    obj.label413:setTop(1);
    obj.label413:setWidth(150);
    obj.label413:setHeight(20);
    obj.label413:setText("MUNIÇÕES");
    obj.label413:setName("label413");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout61);
    obj.textEditor12:setLeft(5);
    obj.textEditor12:setTop(25);
    obj.textEditor12:setWidth(190);
    obj.textEditor12:setHeight(165);
    obj.textEditor12:setField("municoes");
    obj.textEditor12:setName("textEditor12");

    obj.label414 = GUI.fromHandle(_obj_newObject("label"));
    obj.label414:setParent(obj.layout61);
    obj.label414:setLeft(5);
    obj.label414:setTop(195);
    obj.label414:setWidth(50);
    obj.label414:setHeight(20);
    obj.label414:setText("Kg");
    obj.label414:setName("label414");

    obj.edit544 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit544:setParent(obj.layout61);
    obj.edit544:setVertTextAlign("center");
    obj.edit544:setHorzTextAlign("center");
    obj.edit544:setLeft(25);
    obj.edit544:setTop(195);
    obj.edit544:setWidth(70);
    obj.edit544:setHeight(20);
    obj.edit544:setField("pesoMunicoes");
    obj.edit544:setName("edit544");

    obj.label415 = GUI.fromHandle(_obj_newObject("label"));
    obj.label415:setParent(obj.layout61);
    obj.label415:setLeft(105);
    obj.label415:setTop(195);
    obj.label415:setWidth(50);
    obj.label415:setHeight(20);
    obj.label415:setText("$");
    obj.label415:setName("label415");

    obj.edit545 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit545:setParent(obj.layout61);
    obj.edit545:setVertTextAlign("center");
    obj.edit545:setHorzTextAlign("center");
    obj.edit545:setLeft(120);
    obj.edit545:setTop(195);
    obj.edit545:setWidth(70);
    obj.edit545:setHeight(20);
    obj.edit545:setField("precoMunicoes");
    obj.edit545:setName("edit545");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox7);
    obj.layout62:setLeft(480);
    obj.layout62:setTop(450);
    obj.layout62:setWidth(200);
    obj.layout62:setHeight(221);
    obj.layout62:setName("layout62");

    obj.rectangle136 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle136:setParent(obj.layout62);
    obj.rectangle136:setAlign("client");
    obj.rectangle136:setColor("black");
    obj.rectangle136:setName("rectangle136");

    obj.label416 = GUI.fromHandle(_obj_newObject("label"));
    obj.label416:setParent(obj.layout62);
    obj.label416:setLeft(5);
    obj.label416:setTop(1);
    obj.label416:setWidth(150);
    obj.label416:setHeight(20);
    obj.label416:setText("BOLSOS");
    obj.label416:setName("label416");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout62);
    obj.textEditor13:setLeft(5);
    obj.textEditor13:setTop(25);
    obj.textEditor13:setWidth(190);
    obj.textEditor13:setHeight(165);
    obj.textEditor13:setField("bolsos");
    obj.textEditor13:setName("textEditor13");

    obj.label417 = GUI.fromHandle(_obj_newObject("label"));
    obj.label417:setParent(obj.layout62);
    obj.label417:setLeft(5);
    obj.label417:setTop(195);
    obj.label417:setWidth(50);
    obj.label417:setHeight(20);
    obj.label417:setText("Kg");
    obj.label417:setName("label417");

    obj.edit546 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit546:setParent(obj.layout62);
    obj.edit546:setVertTextAlign("center");
    obj.edit546:setHorzTextAlign("center");
    obj.edit546:setLeft(25);
    obj.edit546:setTop(195);
    obj.edit546:setWidth(70);
    obj.edit546:setHeight(20);
    obj.edit546:setField("pesoBolsos");
    obj.edit546:setName("edit546");

    obj.label418 = GUI.fromHandle(_obj_newObject("label"));
    obj.label418:setParent(obj.layout62);
    obj.label418:setLeft(105);
    obj.label418:setTop(195);
    obj.label418:setWidth(50);
    obj.label418:setHeight(20);
    obj.label418:setText("$");
    obj.label418:setName("label418");

    obj.edit547 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit547:setParent(obj.layout62);
    obj.edit547:setVertTextAlign("center");
    obj.edit547:setHorzTextAlign("center");
    obj.edit547:setLeft(120);
    obj.edit547:setTop(195);
    obj.edit547:setWidth(70);
    obj.edit547:setHeight(20);
    obj.edit547:setField("precoBolsos");
    obj.edit547:setName("edit547");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.scrollBox7);
    obj.layout63:setLeft(685);
    obj.layout63:setTop(450);
    obj.layout63:setWidth(200);
    obj.layout63:setHeight(221);
    obj.layout63:setName("layout63");

    obj.rectangle137 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle137:setParent(obj.layout63);
    obj.rectangle137:setAlign("client");
    obj.rectangle137:setColor("black");
    obj.rectangle137:setName("rectangle137");

    obj.label419 = GUI.fromHandle(_obj_newObject("label"));
    obj.label419:setParent(obj.layout63);
    obj.label419:setLeft(5);
    obj.label419:setTop(1);
    obj.label419:setWidth(150);
    obj.label419:setHeight(20);
    obj.label419:setText("IMOVEIS");
    obj.label419:setName("label419");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout63);
    obj.textEditor14:setLeft(5);
    obj.textEditor14:setTop(25);
    obj.textEditor14:setWidth(190);
    obj.textEditor14:setHeight(165);
    obj.textEditor14:setField("moveis");
    obj.textEditor14:setName("textEditor14");

    obj.label420 = GUI.fromHandle(_obj_newObject("label"));
    obj.label420:setParent(obj.layout63);
    obj.label420:setLeft(5);
    obj.label420:setTop(195);
    obj.label420:setWidth(50);
    obj.label420:setHeight(20);
    obj.label420:setText("Kg");
    obj.label420:setName("label420");

    obj.edit548 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit548:setParent(obj.layout63);
    obj.edit548:setVertTextAlign("center");
    obj.edit548:setHorzTextAlign("center");
    obj.edit548:setLeft(25);
    obj.edit548:setTop(195);
    obj.edit548:setWidth(70);
    obj.edit548:setHeight(20);
    obj.edit548:setField("pesoImoveis");
    obj.edit548:setName("edit548");

    obj.label421 = GUI.fromHandle(_obj_newObject("label"));
    obj.label421:setParent(obj.layout63);
    obj.label421:setLeft(105);
    obj.label421:setTop(195);
    obj.label421:setWidth(50);
    obj.label421:setHeight(20);
    obj.label421:setText("$");
    obj.label421:setName("label421");

    obj.edit549 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit549:setParent(obj.layout63);
    obj.edit549:setVertTextAlign("center");
    obj.edit549:setHorzTextAlign("center");
    obj.edit549:setLeft(120);
    obj.edit549:setTop(195);
    obj.edit549:setWidth(70);
    obj.edit549:setHeight(20);
    obj.edit549:setField("precoImoveis");
    obj.edit549:setName("edit549");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.scrollBox7);
    obj.layout64:setLeft(890);
    obj.layout64:setTop(0);
    obj.layout64:setWidth(155);
    obj.layout64:setHeight(185);
    obj.layout64:setName("layout64");

    obj.rectangle138 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle138:setParent(obj.layout64);
    obj.rectangle138:setAlign("client");
    obj.rectangle138:setColor("black");
    obj.rectangle138:setName("rectangle138");

    obj.label422 = GUI.fromHandle(_obj_newObject("label"));
    obj.label422:setParent(obj.layout64);
    obj.label422:setLeft(5);
    obj.label422:setTop(1);
    obj.label422:setWidth(200);
    obj.label422:setHeight(20);
    obj.label422:setText("DINHEIRO");
    obj.label422:setName("label422");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout64);
    obj.textEditor15:setLeft(5);
    obj.textEditor15:setTop(25);
    obj.textEditor15:setWidth(145);
    obj.textEditor15:setHeight(80);
    obj.textEditor15:setField("dinheiro");
    obj.textEditor15:setName("textEditor15");

    obj.label423 = GUI.fromHandle(_obj_newObject("label"));
    obj.label423:setParent(obj.layout64);
    obj.label423:setLeft(10);
    obj.label423:setTop(110);
    obj.label423:setWidth(50);
    obj.label423:setHeight(20);
    obj.label423:setText("TOTAL");
    obj.label423:setName("label423");

    obj.edit550 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit550:setParent(obj.layout64);
    obj.edit550:setField("dinheiroTotal");
    obj.edit550:setLeft(65);
    obj.edit550:setTop(110);
    obj.edit550:setWidth(85);
    obj.edit550:setHeight(20);
    obj.edit550:setFontSize(11);
    obj.edit550:setName("edit550");

    obj.label424 = GUI.fromHandle(_obj_newObject("label"));
    obj.label424:setParent(obj.layout64);
    obj.label424:setLeft(10);
    obj.label424:setTop(135);
    obj.label424:setWidth(50);
    obj.label424:setHeight(20);
    obj.label424:setText("GASTOS");
    obj.label424:setName("label424");

    obj.rectangle139 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle139:setParent(obj.layout64);
    obj.rectangle139:setLeft(65);
    obj.rectangle139:setTop(135);
    obj.rectangle139:setWidth(85);
    obj.rectangle139:setHeight(20);
    obj.rectangle139:setColor("black");
    obj.rectangle139:setStrokeColor("white");
    obj.rectangle139:setStrokeSize(1);
    obj.rectangle139:setName("rectangle139");

    obj.label425 = GUI.fromHandle(_obj_newObject("label"));
    obj.label425:setParent(obj.layout64);
    obj.label425:setField("gastos");
    obj.label425:setText("0");
    obj.label425:setLeft(65);
    obj.label425:setTop(135);
    obj.label425:setWidth(85);
    obj.label425:setHeight(20);
    obj.label425:setHorzTextAlign("center");
    obj.label425:setFontSize(11);
    obj.label425:setName("label425");

    obj.label426 = GUI.fromHandle(_obj_newObject("label"));
    obj.label426:setParent(obj.layout64);
    obj.label426:setLeft(10);
    obj.label426:setTop(160);
    obj.label426:setWidth(50);
    obj.label426:setHeight(20);
    obj.label426:setText("RESTANTE");
    obj.label426:setFontSize(10);
    obj.label426:setName("label426");

    obj.rectangle140 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle140:setParent(obj.layout64);
    obj.rectangle140:setLeft(65);
    obj.rectangle140:setTop(160);
    obj.rectangle140:setWidth(85);
    obj.rectangle140:setHeight(20);
    obj.rectangle140:setColor("black");
    obj.rectangle140:setStrokeColor("white");
    obj.rectangle140:setStrokeSize(1);
    obj.rectangle140:setName("rectangle140");

    obj.label427 = GUI.fromHandle(_obj_newObject("label"));
    obj.label427:setParent(obj.layout64);
    obj.label427:setField("dinheiroRestante");
    obj.label427:setText("0");
    obj.label427:setLeft(65);
    obj.label427:setTop(160);
    obj.label427:setWidth(85);
    obj.label427:setHeight(20);
    obj.label427:setHorzTextAlign("center");
    obj.label427:setFontSize(11);
    obj.label427:setName("label427");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.scrollBox7);
    obj.dataLink49:setFields({'precoCabeca', 'precoOlhos', 'precoPescoco', 'precoOmbros', 'precoTorso', 'precoCorpo', 'precoPunhos', 'precoCintura', 'precoMaos', 'precoDedosI', 'precoDesdosII', 'precoPes', 'precoArmas', 'precoMochila', 'precoPermanencias', 'precoLivres', 'precoOutros', 'precoMunicoes', 'precoBolsos', 'precoImoveis', 'precoInventorioComp', 'dinheiroTotal'});
    obj.dataLink49:setName("dataLink49");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.scrollBox7);
    obj.layout65:setLeft(890);
    obj.layout65:setTop(190);
    obj.layout65:setWidth(250);
    obj.layout65:setHeight(222);
    obj.layout65:setName("layout65");

    obj.rectangle141 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle141:setParent(obj.layout65);
    obj.rectangle141:setAlign("client");
    obj.rectangle141:setColor("black");
    obj.rectangle141:setName("rectangle141");

    obj.label428 = GUI.fromHandle(_obj_newObject("label"));
    obj.label428:setParent(obj.layout65);
    obj.label428:setLeft(5);
    obj.label428:setTop(1);
    obj.label428:setWidth(200);
    obj.label428:setHeight(20);
    obj.label428:setText("ARMADURA");
    obj.label428:setName("label428");

    obj.edit551 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit551:setParent(obj.layout65);
    obj.edit551:setVertTextAlign("center");
    obj.edit551:setLeft(5);
    obj.edit551:setTop(20);
    obj.edit551:setWidth(240);
    obj.edit551:setHeight(25);
    obj.edit551:setField("equipamentoCorpo");
    obj.edit551:setName("edit551");

    obj.label429 = GUI.fromHandle(_obj_newObject("label"));
    obj.label429:setParent(obj.layout65);
    obj.label429:setLeft(10);
    obj.label429:setTop(50);
    obj.label429:setWidth(50);
    obj.label429:setHeight(20);
    obj.label429:setText("CA");
    obj.label429:setName("label429");

    obj.edit552 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit552:setParent(obj.layout65);
    obj.edit552:setVertTextAlign("center");
    obj.edit552:setLeft(45);
    obj.edit552:setTop(50);
    obj.edit552:setWidth(40);
    obj.edit552:setHeight(20);
    obj.edit552:setField("equipamentoCorpoCA");
    obj.edit552:setName("edit552");

    obj.label430 = GUI.fromHandle(_obj_newObject("label"));
    obj.label430:setParent(obj.layout65);
    obj.label430:setLeft(90);
    obj.label430:setTop(50);
    obj.label430:setWidth(50);
    obj.label430:setHeight(20);
    obj.label430:setText("CAT");
    obj.label430:setName("label430");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout65);
    obj.comboBox6:setLeft(120);
    obj.comboBox6:setTop(50);
    obj.comboBox6:setWidth(125);
    obj.comboBox6:setHeight(20);
    obj.comboBox6:setField("equipamentoCorpoCategoria");
    obj.comboBox6:setItems({'Leve', 'Média', 'Pesada', 'Massiva'});
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setName("comboBox6");

    obj.label431 = GUI.fromHandle(_obj_newObject("label"));
    obj.label431:setParent(obj.layout65);
    obj.label431:setLeft(10);
    obj.label431:setTop(75);
    obj.label431:setWidth(50);
    obj.label431:setHeight(20);
    obj.label431:setText("DES");
    obj.label431:setName("label431");

    obj.edit553 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit553:setParent(obj.layout65);
    obj.edit553:setVertTextAlign("center");
    obj.edit553:setLeft(45);
    obj.edit553:setTop(75);
    obj.edit553:setWidth(40);
    obj.edit553:setHeight(20);
    obj.edit553:setField("equipamentoCorpoDesMax");
    obj.edit553:setName("edit553");

    obj.label432 = GUI.fromHandle(_obj_newObject("label"));
    obj.label432:setParent(obj.layout65);
    obj.label432:setLeft(90);
    obj.label432:setTop(75);
    obj.label432:setWidth(50);
    obj.label432:setHeight(20);
    obj.label432:setText("PEN");
    obj.label432:setName("label432");

    obj.edit554 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit554:setParent(obj.layout65);
    obj.edit554:setVertTextAlign("center");
    obj.edit554:setLeft(125);
    obj.edit554:setTop(75);
    obj.edit554:setWidth(40);
    obj.edit554:setHeight(20);
    obj.edit554:setField("equipamentoCorpoPen");
    obj.edit554:setName("edit554");

    obj.label433 = GUI.fromHandle(_obj_newObject("label"));
    obj.label433:setParent(obj.layout65);
    obj.label433:setLeft(170);
    obj.label433:setTop(75);
    obj.label433:setWidth(50);
    obj.label433:setHeight(20);
    obj.label433:setText("Falha");
    obj.label433:setFontSize(13);
    obj.label433:setName("label433");

    obj.edit555 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit555:setParent(obj.layout65);
    obj.edit555:setVertTextAlign("center");
    obj.edit555:setLeft(205);
    obj.edit555:setTop(75);
    obj.edit555:setWidth(40);
    obj.edit555:setHeight(20);
    obj.edit555:setField("equipamentoCorpoFalha");
    obj.edit555:setName("edit555");

    obj.label434 = GUI.fromHandle(_obj_newObject("label"));
    obj.label434:setParent(obj.layout65);
    obj.label434:setLeft(10);
    obj.label434:setTop(100);
    obj.label434:setWidth(50);
    obj.label434:setHeight(20);
    obj.label434:setText("Desl");
    obj.label434:setName("label434");

    obj.edit556 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit556:setParent(obj.layout65);
    obj.edit556:setVertTextAlign("center");
    obj.edit556:setLeft(45);
    obj.edit556:setTop(100);
    obj.edit556:setWidth(40);
    obj.edit556:setHeight(20);
    obj.edit556:setField("equipamentoCorpoDesl");
    obj.edit556:setName("edit556");

    obj.label435 = GUI.fromHandle(_obj_newObject("label"));
    obj.label435:setParent(obj.layout65);
    obj.label435:setLeft(170);
    obj.label435:setTop(100);
    obj.label435:setWidth(50);
    obj.label435:setHeight(20);
    obj.label435:setText("Correr");
    obj.label435:setFontSize(12);
    obj.label435:setName("label435");

    obj.edit557 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit557:setParent(obj.layout65);
    obj.edit557:setVertTextAlign("center");
    obj.edit557:setLeft(205);
    obj.edit557:setTop(100);
    obj.edit557:setWidth(40);
    obj.edit557:setHeight(20);
    obj.edit557:setField("equipamentoCorpoCorrer");
    obj.edit557:setName("edit557");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout65);
    obj.textEditor16:setLeft(5);
    obj.textEditor16:setTop(122);
    obj.textEditor16:setWidth(240);
    obj.textEditor16:setHeight(65);
    obj.textEditor16:setField("descricaoCorpo");
    obj.textEditor16:setName("textEditor16");

    obj.label436 = GUI.fromHandle(_obj_newObject("label"));
    obj.label436:setParent(obj.layout65);
    obj.label436:setLeft(70);
    obj.label436:setTop(193);
    obj.label436:setWidth(50);
    obj.label436:setHeight(20);
    obj.label436:setText("Kg");
    obj.label436:setName("label436");

    obj.edit558 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit558:setParent(obj.layout65);
    obj.edit558:setHorzTextAlign("center");
    obj.edit558:setVertTextAlign("center");
    obj.edit558:setLeft(90);
    obj.edit558:setTop(190);
    obj.edit558:setWidth(50);
    obj.edit558:setHeight(25);
    obj.edit558:setField("pesoCorpo");
    obj.edit558:setName("edit558");

    obj.label437 = GUI.fromHandle(_obj_newObject("label"));
    obj.label437:setParent(obj.layout65);
    obj.label437:setLeft(147);
    obj.label437:setTop(193);
    obj.label437:setWidth(50);
    obj.label437:setHeight(20);
    obj.label437:setText("$");
    obj.label437:setName("label437");

    obj.edit559 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit559:setParent(obj.layout65);
    obj.edit559:setHorzTextAlign("center");
    obj.edit559:setVertTextAlign("center");
    obj.edit559:setLeft(160);
    obj.edit559:setTop(190);
    obj.edit559:setWidth(84);
    obj.edit559:setHeight(25);
    obj.edit559:setField("precoCorpo");
    obj.edit559:setName("edit559");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.scrollBox7);
    obj.layout66:setLeft(1050);
    obj.layout66:setTop(0);
    obj.layout66:setWidth(155);
    obj.layout66:setHeight(185);
    obj.layout66:setName("layout66");

    obj.rectangle142 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle142:setParent(obj.layout66);
    obj.rectangle142:setAlign("client");
    obj.rectangle142:setColor("black");
    obj.rectangle142:setName("rectangle142");

    obj.label438 = GUI.fromHandle(_obj_newObject("label"));
    obj.label438:setParent(obj.layout66);
    obj.label438:setLeft(5);
    obj.label438:setTop(1);
    obj.label438:setWidth(150);
    obj.label438:setHeight(20);
    obj.label438:setText("CARGA");
    obj.label438:setName("label438");

    obj.label439 = GUI.fromHandle(_obj_newObject("label"));
    obj.label439:setParent(obj.layout66);
    obj.label439:setLeft(20);
    obj.label439:setTop(25);
    obj.label439:setWidth(50);
    obj.label439:setHeight(20);
    obj.label439:setText("LEVE");
    obj.label439:setName("label439");

    obj.rectangle143 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle143:setParent(obj.layout66);
    obj.rectangle143:setLeft(80);
    obj.rectangle143:setTop(25);
    obj.rectangle143:setWidth(70);
    obj.rectangle143:setHeight(20);
    obj.rectangle143:setColor("black");
    obj.rectangle143:setStrokeColor("white");
    obj.rectangle143:setStrokeSize(1);
    obj.rectangle143:setName("rectangle143");

    obj.label440 = GUI.fromHandle(_obj_newObject("label"));
    obj.label440:setParent(obj.layout66);
    obj.label440:setLeft(80);
    obj.label440:setTop(25);
    obj.label440:setWidth(70);
    obj.label440:setHeight(20);
    obj.label440:setField("cargaLeve");
    obj.label440:setHorzTextAlign("center");
    obj.label440:setName("label440");

    obj.label441 = GUI.fromHandle(_obj_newObject("label"));
    obj.label441:setParent(obj.layout66);
    obj.label441:setLeft(20);
    obj.label441:setTop(47);
    obj.label441:setWidth(50);
    obj.label441:setHeight(20);
    obj.label441:setText("MÉDIA");
    obj.label441:setName("label441");

    obj.rectangle144 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle144:setParent(obj.layout66);
    obj.rectangle144:setLeft(80);
    obj.rectangle144:setTop(47);
    obj.rectangle144:setWidth(70);
    obj.rectangle144:setHeight(20);
    obj.rectangle144:setColor("black");
    obj.rectangle144:setStrokeColor("white");
    obj.rectangle144:setStrokeSize(1);
    obj.rectangle144:setName("rectangle144");

    obj.label442 = GUI.fromHandle(_obj_newObject("label"));
    obj.label442:setParent(obj.layout66);
    obj.label442:setLeft(80);
    obj.label442:setTop(47);
    obj.label442:setWidth(70);
    obj.label442:setHeight(20);
    obj.label442:setField("cargaMedia");
    obj.label442:setHorzTextAlign("center");
    obj.label442:setName("label442");

    obj.label443 = GUI.fromHandle(_obj_newObject("label"));
    obj.label443:setParent(obj.layout66);
    obj.label443:setLeft(20);
    obj.label443:setTop(69);
    obj.label443:setWidth(50);
    obj.label443:setHeight(20);
    obj.label443:setText("PESADA");
    obj.label443:setName("label443");

    obj.rectangle145 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle145:setParent(obj.layout66);
    obj.rectangle145:setLeft(80);
    obj.rectangle145:setTop(69);
    obj.rectangle145:setWidth(70);
    obj.rectangle145:setHeight(20);
    obj.rectangle145:setColor("black");
    obj.rectangle145:setStrokeColor("white");
    obj.rectangle145:setStrokeSize(1);
    obj.rectangle145:setName("rectangle145");

    obj.label444 = GUI.fromHandle(_obj_newObject("label"));
    obj.label444:setParent(obj.layout66);
    obj.label444:setLeft(80);
    obj.label444:setTop(69);
    obj.label444:setWidth(70);
    obj.label444:setHeight(20);
    obj.label444:setField("cargaPesada");
    obj.label444:setHorzTextAlign("center");
    obj.label444:setName("label444");

    obj.rectangle146 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle146:setParent(obj.layout66);
    obj.rectangle146:setWidth(70);
    obj.rectangle146:setHeight(20);
    obj.rectangle146:setLeft(80);
    obj.rectangle146:setTop(91);
    obj.rectangle146:setColor("black");
    obj.rectangle146:setStrokeColor("white");
    obj.rectangle146:setStrokeSize(1);
    obj.rectangle146:setName("rectangle146");

    obj.label445 = GUI.fromHandle(_obj_newObject("label"));
    obj.label445:setParent(obj.layout66);
    obj.label445:setLeft(20);
    obj.label445:setTop(91);
    obj.label445:setWidth(50);
    obj.label445:setHeight(20);
    obj.label445:setText("ERGUER");
    obj.label445:setName("label445");

    obj.label446 = GUI.fromHandle(_obj_newObject("label"));
    obj.label446:setParent(obj.layout66);
    obj.label446:setField("cargaErguer");
    obj.label446:setText("valor");
    obj.label446:setWidth(70);
    obj.label446:setHeight(20);
    obj.label446:setLeft(80);
    obj.label446:setTop(91);
    obj.label446:setHorzTextAlign("center");
    obj.label446:setName("label446");

    obj.rectangle147 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle147:setParent(obj.layout66);
    obj.rectangle147:setWidth(70);
    obj.rectangle147:setHeight(20);
    obj.rectangle147:setLeft(80);
    obj.rectangle147:setTop(113);
    obj.rectangle147:setColor("black");
    obj.rectangle147:setStrokeColor("white");
    obj.rectangle147:setStrokeSize(1);
    obj.rectangle147:setName("rectangle147");

    obj.label447 = GUI.fromHandle(_obj_newObject("label"));
    obj.label447:setParent(obj.layout66);
    obj.label447:setLeft(10);
    obj.label447:setTop(113);
    obj.label447:setWidth(70);
    obj.label447:setHeight(20);
    obj.label447:setText("EMPURRAR");
    obj.label447:setName("label447");

    obj.label448 = GUI.fromHandle(_obj_newObject("label"));
    obj.label448:setParent(obj.layout66);
    obj.label448:setField("cargaLevantar");
    obj.label448:setText("valor");
    obj.label448:setWidth(70);
    obj.label448:setHeight(20);
    obj.label448:setLeft(80);
    obj.label448:setTop(113);
    obj.label448:setHorzTextAlign("center");
    obj.label448:setName("label448");

    obj.rectangle148 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle148:setParent(obj.layout66);
    obj.rectangle148:setWidth(70);
    obj.rectangle148:setHeight(20);
    obj.rectangle148:setLeft(80);
    obj.rectangle148:setTop(135);
    obj.rectangle148:setColor("black");
    obj.rectangle148:setStrokeColor("white");
    obj.rectangle148:setStrokeSize(1);
    obj.rectangle148:setName("rectangle148");

    obj.label449 = GUI.fromHandle(_obj_newObject("label"));
    obj.label449:setParent(obj.layout66);
    obj.label449:setLeft(10);
    obj.label449:setTop(135);
    obj.label449:setWidth(65);
    obj.label449:setHeight(20);
    obj.label449:setText("LEVANTAR");
    obj.label449:setName("label449");

    obj.label450 = GUI.fromHandle(_obj_newObject("label"));
    obj.label450:setParent(obj.layout66);
    obj.label450:setField("cargaEmpurrar");
    obj.label450:setText("valor");
    obj.label450:setWidth(70);
    obj.label450:setHeight(20);
    obj.label450:setLeft(80);
    obj.label450:setTop(135);
    obj.label450:setHorzTextAlign("center");
    obj.label450:setName("label450");

    obj.rectangle149 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle149:setParent(obj.layout66);
    obj.rectangle149:setWidth(70);
    obj.rectangle149:setHeight(20);
    obj.rectangle149:setLeft(80);
    obj.rectangle149:setTop(160);
    obj.rectangle149:setColor("#404040");
    obj.rectangle149:setName("rectangle149");

    obj.label451 = GUI.fromHandle(_obj_newObject("label"));
    obj.label451:setParent(obj.layout66);
    obj.label451:setLeft(20);
    obj.label451:setTop(160);
    obj.label451:setWidth(65);
    obj.label451:setHeight(20);
    obj.label451:setText("ATUAL");
    obj.label451:setName("label451");

    obj.label452 = GUI.fromHandle(_obj_newObject("label"));
    obj.label452:setParent(obj.layout66);
    obj.label452:setField("cargaAtual");
    obj.label452:setWidth(70);
    obj.label452:setHeight(20);
    obj.label452:setLeft(80);
    obj.label452:setTop(160);
    obj.label452:setHorzTextAlign("center");
    obj.label452:setFontColor("white");
    obj.label452:setName("label452");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.scrollBox7);
    obj.dataLink50:setField("cargaPesada");
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.scrollBox7);
    obj.dataLink51:setFields({'pesoCabeca', 'pesoOlhos', 'pesoPescoco', 'pesoOmbros', 'pesoTorso', 'pesoCorpo', 'pesoPunhos', 'pesoCintura', 'pesoMaos', 'pesoDedosI', 'pesoDesdosII', 'pesoPes', 'pesoArmas', 'pesoMochila', 'pesoPermanencias', 'pesoLivres', 'pesoOutros', 'pesoMunicoes', 'pesoBolsos', 'pesoImoveis', 'pesoInventorioComp'});
    obj.dataLink51:setName("dataLink51");

    obj.popArma = GUI.fromHandle(_obj_newObject("popup"));
    obj.popArma:setParent(obj.scrollBox7);
    obj.popArma:setName("popArma");
    obj.popArma:setWidth(300);
    obj.popArma:setHeight(400);
    obj.popArma:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popArma, "autoScopeNode",  "false");

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.popArma);
    obj.flowLayout17:setAlign("top");
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setMaxControlsPerLine(3);
    obj.flowLayout17:setMargins({bottom=4});
    obj.flowLayout17:setHorzAlign("center");
    obj.flowLayout17:setName("flowLayout17");

    obj.flowPart202 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart202:setParent(obj.flowLayout17);
    obj.flowPart202:setMinWidth(90);
    obj.flowPart202:setMaxWidth(100);
    obj.flowPart202:setHeight(35);
    obj.flowPart202:setName("flowPart202");

    obj.label453 = GUI.fromHandle(_obj_newObject("label"));
    obj.label453:setParent(obj.flowPart202);
    obj.label453:setAlign("top");
    obj.label453:setFontSize(10);
    obj.label453:setText("NOME");
    obj.label453:setHorzTextAlign("center");
    obj.label453:setWordWrap(true);
    obj.label453:setTextTrimming("none");
    obj.label453:setAutoSize(true);
    obj.label453:setHint("Se a arma possui um nome de batismo ponha ele aqui.");
    obj.label453:setHitTest(true);
    obj.label453:setName("label453");

    obj.edit560 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit560:setParent(obj.flowPart202);
    obj.edit560:setAlign("client");
    obj.edit560:setField("batismo");
    obj.edit560:setFontSize(12);
    obj.edit560:setName("edit560");

    obj.flowPart203 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart203:setParent(obj.flowLayout17);
    obj.flowPart203:setMinWidth(90);
    obj.flowPart203:setMaxWidth(100);
    obj.flowPart203:setHeight(35);
    obj.flowPart203:setName("flowPart203");

    obj.label454 = GUI.fromHandle(_obj_newObject("label"));
    obj.label454:setParent(obj.flowPart203);
    obj.label454:setAlign("top");
    obj.label454:setFontSize(10);
    obj.label454:setText("ARMA");
    obj.label454:setHorzTextAlign("center");
    obj.label454:setWordWrap(true);
    obj.label454:setTextTrimming("none");
    obj.label454:setAutoSize(true);
    obj.label454:setHint("Qual a arma? Espada Longa? Machado de Batalha? Arco Longo?");
    obj.label454:setHitTest(true);
    obj.label454:setName("label454");

    obj.edit561 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit561:setParent(obj.flowPart203);
    obj.edit561:setAlign("client");
    obj.edit561:setField("arma");
    obj.edit561:setFontSize(12);
    obj.edit561:setName("edit561");

    obj.flowPart204 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart204:setParent(obj.flowLayout17);
    obj.flowPart204:setMinWidth(90);
    obj.flowPart204:setMaxWidth(100);
    obj.flowPart204:setHeight(35);
    obj.flowPart204:setName("flowPart204");

    obj.label455 = GUI.fromHandle(_obj_newObject("label"));
    obj.label455:setParent(obj.flowPart204);
    obj.label455:setAlign("top");
    obj.label455:setFontSize(10);
    obj.label455:setText("TAMANHO");
    obj.label455:setHorzTextAlign("center");
    obj.label455:setWordWrap(true);
    obj.label455:setTextTrimming("none");
    obj.label455:setAutoSize(true);
    obj.label455:setHint("Essa arma foi feita para um personagem de que tamanho? Médio? Pequeno? Grande?");
    obj.label455:setHitTest(true);
    obj.label455:setName("label455");

    obj.edit562 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit562:setParent(obj.flowPart204);
    obj.edit562:setAlign("client");
    obj.edit562:setField("tamanho");
    obj.edit562:setFontSize(12);
    obj.edit562:setName("edit562");

    obj.flowPart205 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart205:setParent(obj.flowLayout17);
    obj.flowPart205:setMinWidth(90);
    obj.flowPart205:setMaxWidth(100);
    obj.flowPart205:setHeight(35);
    obj.flowPart205:setName("flowPart205");

    obj.label456 = GUI.fromHandle(_obj_newObject("label"));
    obj.label456:setParent(obj.flowPart205);
    obj.label456:setAlign("top");
    obj.label456:setFontSize(10);
    obj.label456:setText("MATERIAL");
    obj.label456:setHorzTextAlign("center");
    obj.label456:setWordWrap(true);
    obj.label456:setTextTrimming("none");
    obj.label456:setAutoSize(true);
    obj.label456:setHint("Essa arma foi feita de um material especial? Adamante? Prata?");
    obj.label456:setHitTest(true);
    obj.label456:setName("label456");

    obj.edit563 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit563:setParent(obj.flowPart205);
    obj.edit563:setAlign("client");
    obj.edit563:setField("material");
    obj.edit563:setFontSize(12);
    obj.edit563:setName("edit563");

    obj.flowPart206 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart206:setParent(obj.flowLayout17);
    obj.flowPart206:setMinWidth(90);
    obj.flowPart206:setMaxWidth(100);
    obj.flowPart206:setHeight(35);
    obj.flowPart206:setName("flowPart206");

    obj.label457 = GUI.fromHandle(_obj_newObject("label"));
    obj.label457:setParent(obj.flowPart206);
    obj.label457:setAlign("top");
    obj.label457:setFontSize(10);
    obj.label457:setText("QUALIDADE");
    obj.label457:setHorzTextAlign("center");
    obj.label457:setWordWrap(true);
    obj.label457:setTextTrimming("none");
    obj.label457:setAutoSize(true);
    obj.label457:setHint("Essa arma é Obra-Prima? +1? +2?");
    obj.label457:setHitTest(true);
    obj.label457:setName("label457");

    obj.edit564 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit564:setParent(obj.flowPart206);
    obj.edit564:setAlign("client");
    obj.edit564:setField("qualidade");
    obj.edit564:setHorzTextAlign("center");
    obj.edit564:setFontSize(12);
    obj.edit564:setName("edit564");

    obj.flowPart207 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart207:setParent(obj.flowLayout17);
    obj.flowPart207:setMinWidth(90);
    obj.flowPart207:setMaxWidth(100);
    obj.flowPart207:setHeight(35);
    obj.flowPart207:setName("flowPart207");

    obj.label458 = GUI.fromHandle(_obj_newObject("label"));
    obj.label458:setParent(obj.flowPart207);
    obj.label458:setAlign("top");
    obj.label458:setFontSize(10);
    obj.label458:setText("CATEGORIA");
    obj.label458:setHorzTextAlign("center");
    obj.label458:setWordWrap(true);
    obj.label458:setTextTrimming("none");
    obj.label458:setAutoSize(true);
    obj.label458:setHint("Essa arma é Simples? Comum? Exotica?");
    obj.label458:setHitTest(true);
    obj.label458:setName("label458");

    obj.edit565 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit565:setParent(obj.flowPart207);
    obj.edit565:setAlign("client");
    obj.edit565:setField("categoria");
    obj.edit565:setFontSize(12);
    obj.edit565:setName("edit565");

    obj.flowPart208 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart208:setParent(obj.flowLayout17);
    obj.flowPart208:setMinWidth(90);
    obj.flowPart208:setMaxWidth(100);
    obj.flowPart208:setHeight(35);
    obj.flowPart208:setName("flowPart208");

    obj.label459 = GUI.fromHandle(_obj_newObject("label"));
    obj.label459:setParent(obj.flowPart208);
    obj.label459:setAlign("top");
    obj.label459:setFontSize(10);
    obj.label459:setText("DANO");
    obj.label459:setHorzTextAlign("center");
    obj.label459:setWordWrap(true);
    obj.label459:setTextTrimming("none");
    obj.label459:setAutoSize(true);
    obj.label459:setHint("Qual o dado de dano dessa arma?");
    obj.label459:setHitTest(true);
    obj.label459:setName("label459");

    obj.edit566 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit566:setParent(obj.flowPart208);
    obj.edit566:setAlign("client");
    obj.edit566:setField("dano");
    obj.edit566:setHorzTextAlign("center");
    obj.edit566:setFontSize(12);
    obj.edit566:setName("edit566");

    obj.flowPart209 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart209:setParent(obj.flowLayout17);
    obj.flowPart209:setMinWidth(90);
    obj.flowPart209:setMaxWidth(100);
    obj.flowPart209:setHeight(35);
    obj.flowPart209:setName("flowPart209");

    obj.label460 = GUI.fromHandle(_obj_newObject("label"));
    obj.label460:setParent(obj.flowPart209);
    obj.label460:setAlign("top");
    obj.label460:setFontSize(10);
    obj.label460:setText("DECISIVO");
    obj.label460:setHorzTextAlign("center");
    obj.label460:setWordWrap(true);
    obj.label460:setTextTrimming("none");
    obj.label460:setAutoSize(true);
    obj.label460:setHint("Quando a margem de ameaça dessa arma?20? 19-20?");
    obj.label460:setHitTest(true);
    obj.label460:setName("label460");

    obj.edit567 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit567:setParent(obj.flowPart209);
    obj.edit567:setAlign("client");
    obj.edit567:setField("decisivo");
    obj.edit567:setHorzTextAlign("center");
    obj.edit567:setFontSize(12);
    obj.edit567:setName("edit567");

    obj.flowPart210 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart210:setParent(obj.flowLayout17);
    obj.flowPart210:setMinWidth(90);
    obj.flowPart210:setMaxWidth(100);
    obj.flowPart210:setHeight(35);
    obj.flowPart210:setName("flowPart210");

    obj.label461 = GUI.fromHandle(_obj_newObject("label"));
    obj.label461:setParent(obj.flowPart210);
    obj.label461:setAlign("top");
    obj.label461:setFontSize(10);
    obj.label461:setText("MULTIPLICADOR");
    obj.label461:setHorzTextAlign("center");
    obj.label461:setWordWrap(true);
    obj.label461:setTextTrimming("none");
    obj.label461:setAutoSize(true);
    obj.label461:setHint("Em um decisivo por quanto é multiplicado o dano dessa arma?");
    obj.label461:setHitTest(true);
    obj.label461:setName("label461");

    obj.edit568 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit568:setParent(obj.flowPart210);
    obj.edit568:setAlign("client");
    obj.edit568:setField("multiplicador");
    obj.edit568:setHorzTextAlign("center");
    obj.edit568:setFontSize(12);
    obj.edit568:setName("edit568");

    obj.flowPart211 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart211:setParent(obj.flowLayout17);
    obj.flowPart211:setMinWidth(90);
    obj.flowPart211:setMaxWidth(100);
    obj.flowPart211:setHeight(35);
    obj.flowPart211:setName("flowPart211");

    obj.label462 = GUI.fromHandle(_obj_newObject("label"));
    obj.label462:setParent(obj.flowPart211);
    obj.label462:setAlign("top");
    obj.label462:setFontSize(10);
    obj.label462:setText("ALCANCE");
    obj.label462:setHorzTextAlign("center");
    obj.label462:setWordWrap(true);
    obj.label462:setTextTrimming("none");
    obj.label462:setAutoSize(true);
    obj.label462:setHint("Qual o alcance em metros da arma? Normalmente usado apenas em armas de ataque a distancia. ");
    obj.label462:setHitTest(true);
    obj.label462:setName("label462");

    obj.edit569 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit569:setParent(obj.flowPart211);
    obj.edit569:setAlign("client");
    obj.edit569:setField("alcance");
    obj.edit569:setFontSize(12);
    obj.edit569:setName("edit569");

    obj.flowPart212 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart212:setParent(obj.flowLayout17);
    obj.flowPart212:setMinWidth(90);
    obj.flowPart212:setMaxWidth(100);
    obj.flowPart212:setHeight(35);
    obj.flowPart212:setName("flowPart212");

    obj.label463 = GUI.fromHandle(_obj_newObject("label"));
    obj.label463:setParent(obj.flowPart212);
    obj.label463:setAlign("top");
    obj.label463:setFontSize(10);
    obj.label463:setText("ESPECIAL");
    obj.label463:setHorzTextAlign("center");
    obj.label463:setWordWrap(true);
    obj.label463:setTextTrimming("none");
    obj.label463:setAutoSize(true);
    obj.label463:setHint("Essa arma tem efeitos especiais? Pode ser usada em derrubar? desarmar? Pode ser preparada contra investida?");
    obj.label463:setHitTest(true);
    obj.label463:setName("label463");

    obj.edit570 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit570:setParent(obj.flowPart212);
    obj.edit570:setAlign("client");
    obj.edit570:setField("especial");
    obj.edit570:setFontSize(12);
    obj.edit570:setName("edit570");

    obj.flowPart213 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart213:setParent(obj.flowLayout17);
    obj.flowPart213:setMinWidth(90);
    obj.flowPart213:setMaxWidth(100);
    obj.flowPart213:setHeight(35);
    obj.flowPart213:setName("flowPart213");

    obj.label464 = GUI.fromHandle(_obj_newObject("label"));
    obj.label464:setParent(obj.flowPart213);
    obj.label464:setAlign("top");
    obj.label464:setFontSize(10);
    obj.label464:setText("TIPO");
    obj.label464:setHorzTextAlign("center");
    obj.label464:setWordWrap(true);
    obj.label464:setTextTrimming("none");
    obj.label464:setAutoSize(true);
    obj.label464:setHint("Qual o tipo de dano que essa arma causa? Concusivo? Cortante?");
    obj.label464:setHitTest(true);
    obj.label464:setName("label464");

    obj.edit571 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit571:setParent(obj.flowPart213);
    obj.edit571:setAlign("client");
    obj.edit571:setField("tipo");
    obj.edit571:setFontSize(12);
    obj.edit571:setName("edit571");

    obj.flowPart214 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart214:setParent(obj.flowLayout17);
    obj.flowPart214:setMinWidth(290);
    obj.flowPart214:setMaxWidth(300);
    obj.flowPart214:setHeight(35);
    obj.flowPart214:setName("flowPart214");

    obj.label465 = GUI.fromHandle(_obj_newObject("label"));
    obj.label465:setParent(obj.flowPart214);
    obj.label465:setAlign("top");
    obj.label465:setFontSize(10);
    obj.label465:setText("EFEITOS");
    obj.label465:setHorzTextAlign("center");
    obj.label465:setWordWrap(true);
    obj.label465:setTextTrimming("none");
    obj.label465:setAutoSize(true);
    obj.label465:setHint("Essa arma tem efeitos mágicos? Flamejante? Vorpal?");
    obj.label465:setHitTest(true);
    obj.label465:setName("label465");

    obj.edit572 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit572:setParent(obj.flowPart214);
    obj.edit572:setAlign("client");
    obj.edit572:setField("efeitos");
    obj.edit572:setFontSize(12);
    obj.edit572:setName("edit572");

    obj.flowPart215 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart215:setParent(obj.flowLayout17);
    obj.flowPart215:setMinWidth(90);
    obj.flowPart215:setMaxWidth(100);
    obj.flowPart215:setHeight(35);
    obj.flowPart215:setName("flowPart215");

    obj.label466 = GUI.fromHandle(_obj_newObject("label"));
    obj.label466:setParent(obj.flowPart215);
    obj.label466:setAlign("top");
    obj.label466:setFontSize(10);
    obj.label466:setText("CA");
    obj.label466:setHorzTextAlign("center");
    obj.label466:setWordWrap(true);
    obj.label466:setTextTrimming("none");
    obj.label466:setAutoSize(true);
    obj.label466:setHint("Para escudos: qual o bonus que ele fornece na CA?");
    obj.label466:setHitTest(true);
    obj.label466:setName("label466");

    obj.edit573 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit573:setParent(obj.flowPart215);
    obj.edit573:setAlign("client");
    obj.edit573:setField("ca");
    obj.edit573:setHorzTextAlign("center");
    obj.edit573:setFontSize(12);
    obj.edit573:setName("edit573");

    obj.flowPart216 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart216:setParent(obj.flowLayout17);
    obj.flowPart216:setMinWidth(90);
    obj.flowPart216:setMaxWidth(100);
    obj.flowPart216:setHeight(35);
    obj.flowPart216:setName("flowPart216");

    obj.label467 = GUI.fromHandle(_obj_newObject("label"));
    obj.label467:setParent(obj.flowPart216);
    obj.label467:setAlign("top");
    obj.label467:setFontSize(10);
    obj.label467:setText("PEN");
    obj.label467:setHorzTextAlign("center");
    obj.label467:setWordWrap(true);
    obj.label467:setTextTrimming("none");
    obj.label467:setAutoSize(true);
    obj.label467:setHint("Para escudos: qual a penalidade do escudo?");
    obj.label467:setHitTest(true);
    obj.label467:setName("label467");

    obj.edit574 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit574:setParent(obj.flowPart216);
    obj.edit574:setAlign("client");
    obj.edit574:setField("penalidade");
    obj.edit574:setHorzTextAlign("center");
    obj.edit574:setFontSize(12);
    obj.edit574:setName("edit574");

    obj.flowPart217 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart217:setParent(obj.flowLayout17);
    obj.flowPart217:setMinWidth(90);
    obj.flowPart217:setMaxWidth(100);
    obj.flowPart217:setHeight(35);
    obj.flowPart217:setName("flowPart217");

    obj.label468 = GUI.fromHandle(_obj_newObject("label"));
    obj.label468:setParent(obj.flowPart217);
    obj.label468:setAlign("top");
    obj.label468:setFontSize(10);
    obj.label468:setText("FALHA");
    obj.label468:setHorzTextAlign("center");
    obj.label468:setWordWrap(true);
    obj.label468:setTextTrimming("none");
    obj.label468:setAutoSize(true);
    obj.label468:setHint("Para escudos: qual a falha arcana?");
    obj.label468:setHitTest(true);
    obj.label468:setName("label468");

    obj.edit575 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit575:setParent(obj.flowPart217);
    obj.edit575:setAlign("client");
    obj.edit575:setField("falha");
    obj.edit575:setHorzTextAlign("center");
    obj.edit575:setFontSize(12);
    obj.edit575:setName("edit575");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.popArma);
    obj.textEditor17:setAlign("client");
    obj.textEditor17:setField("descricao");
    obj.textEditor17:setName("textEditor17");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Companheiro");
    obj.tab9:setName("tab9");

    obj.frmFichaRPGmeister8_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister8_svg:setParent(obj.tab9);
    obj.frmFichaRPGmeister8_svg:setName("frmFichaRPGmeister8_svg");
    obj.frmFichaRPGmeister8_svg:setAlign("client");
    obj.frmFichaRPGmeister8_svg:setTheme("dark");
    obj.frmFichaRPGmeister8_svg:setMargins({top=1});

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmFichaRPGmeister8_svg);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.boxDetalhesDoCompanheiro = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoCompanheiro:setParent(obj.scrollBox8);
    obj.boxDetalhesDoCompanheiro:setName("boxDetalhesDoCompanheiro");
    obj.boxDetalhesDoCompanheiro:setVisible(false);
    obj.boxDetalhesDoCompanheiro:setLeft(0);
    obj.boxDetalhesDoCompanheiro:setTop(0);
    obj.boxDetalhesDoCompanheiro:setWidth(1335);
    obj.boxDetalhesDoCompanheiro:setHeight(620);

    obj.rectangle150 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle150:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle150:setLeft(0);
    obj.rectangle150:setTop(0);
    obj.rectangle150:setWidth(200);
    obj.rectangle150:setHeight(135);
    obj.rectangle150:setColor("black");
    obj.rectangle150:setName("rectangle150");

    obj.label469 = GUI.fromHandle(_obj_newObject("label"));
    obj.label469:setParent(obj.rectangle150);
    obj.label469:setLeft(5);
    obj.label469:setTop(10);
    obj.label469:setWidth(70);
    obj.label469:setHeight(20);
    obj.label469:setText("Nome");
    obj.label469:setName("label469");

    obj.edit576 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit576:setParent(obj.rectangle150);
    obj.edit576:setLeft(70);
    obj.edit576:setTop(5);
    obj.edit576:setWidth(125);
    obj.edit576:setHeight(25);
    obj.edit576:setField("nomeComp");
    obj.edit576:setName("edit576");

    obj.label470 = GUI.fromHandle(_obj_newObject("label"));
    obj.label470:setParent(obj.rectangle150);
    obj.label470:setLeft(5);
    obj.label470:setTop(35);
    obj.label470:setWidth(70);
    obj.label470:setHeight(20);
    obj.label470:setText("Raça");
    obj.label470:setName("label470");

    obj.edit577 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit577:setParent(obj.rectangle150);
    obj.edit577:setLeft(70);
    obj.edit577:setTop(30);
    obj.edit577:setWidth(125);
    obj.edit577:setHeight(25);
    obj.edit577:setField("racaComp");
    obj.edit577:setName("edit577");

    obj.label471 = GUI.fromHandle(_obj_newObject("label"));
    obj.label471:setParent(obj.rectangle150);
    obj.label471:setLeft(5);
    obj.label471:setTop(60);
    obj.label471:setWidth(70);
    obj.label471:setHeight(20);
    obj.label471:setText("Tipo");
    obj.label471:setName("label471");

    obj.edit578 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit578:setParent(obj.rectangle150);
    obj.edit578:setLeft(70);
    obj.edit578:setTop(55);
    obj.edit578:setWidth(125);
    obj.edit578:setHeight(25);
    obj.edit578:setField("tipoComp");
    obj.edit578:setName("edit578");

    obj.label472 = GUI.fromHandle(_obj_newObject("label"));
    obj.label472:setParent(obj.rectangle150);
    obj.label472:setLeft(5);
    obj.label472:setTop(85);
    obj.label472:setWidth(70);
    obj.label472:setHeight(20);
    obj.label472:setText("Subtipos");
    obj.label472:setName("label472");

    obj.edit579 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit579:setParent(obj.rectangle150);
    obj.edit579:setLeft(70);
    obj.edit579:setTop(80);
    obj.edit579:setWidth(125);
    obj.edit579:setHeight(25);
    obj.edit579:setField("subtiposComp");
    obj.edit579:setName("edit579");

    obj.label473 = GUI.fromHandle(_obj_newObject("label"));
    obj.label473:setParent(obj.rectangle150);
    obj.label473:setLeft(5);
    obj.label473:setTop(110);
    obj.label473:setWidth(70);
    obj.label473:setHeight(20);
    obj.label473:setText("Tamanho");
    obj.label473:setName("label473");

    obj.edit580 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit580:setParent(obj.rectangle150);
    obj.edit580:setLeft(70);
    obj.edit580:setTop(105);
    obj.edit580:setWidth(125);
    obj.edit580:setHeight(25);
    obj.edit580:setField("tamanhoComp");
    obj.edit580:setName("edit580");

    obj.rectangle151 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle151:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle151:setLeft(0);
    obj.rectangle151:setTop(138);
    obj.rectangle151:setWidth(200);
    obj.rectangle151:setHeight(110);
    obj.rectangle151:setColor("black");
    obj.rectangle151:setName("rectangle151");

    obj.label474 = GUI.fromHandle(_obj_newObject("label"));
    obj.label474:setParent(obj.rectangle151);
    obj.label474:setLeft(5);
    obj.label474:setTop(10);
    obj.label474:setWidth(40);
    obj.label474:setHeight(20);
    obj.label474:setText("DVs");
    obj.label474:setName("label474");

    obj.edit581 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit581:setParent(obj.rectangle151);
    obj.edit581:setLeft(35);
    obj.edit581:setTop(5);
    obj.edit581:setWidth(70);
    obj.edit581:setHeight(25);
    obj.edit581:setField("dvsComp");
    obj.edit581:setName("edit581");

    obj.label475 = GUI.fromHandle(_obj_newObject("label"));
    obj.label475:setParent(obj.rectangle151);
    obj.label475:setLeft(110);
    obj.label475:setTop(8);
    obj.label475:setWidth(40);
    obj.label475:setHeight(20);
    obj.label475:setText("PVs");
    obj.label475:setName("label475");

    obj.edit582 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit582:setParent(obj.rectangle151);
    obj.edit582:setLeft(140);
    obj.edit582:setTop(5);
    obj.edit582:setWidth(55);
    obj.edit582:setHeight(25);
    obj.edit582:setField("pvsComp");
    obj.edit582:setName("edit582");

    obj.label476 = GUI.fromHandle(_obj_newObject("label"));
    obj.label476:setParent(obj.rectangle151);
    obj.label476:setLeft(5);
    obj.label476:setTop(35);
    obj.label476:setWidth(60);
    obj.label476:setHeight(20);
    obj.label476:setText("CA");
    obj.label476:setName("label476");

    obj.edit583 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit583:setParent(obj.rectangle151);
    obj.edit583:setLeft(70);
    obj.edit583:setTop(30);
    obj.edit583:setWidth(35);
    obj.edit583:setHeight(25);
    obj.edit583:setField("caComp");
    obj.edit583:setName("edit583");

    obj.label477 = GUI.fromHandle(_obj_newObject("label"));
    obj.label477:setParent(obj.rectangle151);
    obj.label477:setLeft(5);
    obj.label477:setTop(60);
    obj.label477:setWidth(60);
    obj.label477:setHeight(20);
    obj.label477:setText("Toque");
    obj.label477:setName("label477");

    obj.edit584 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit584:setParent(obj.rectangle151);
    obj.edit584:setLeft(70);
    obj.edit584:setTop(55);
    obj.edit584:setWidth(35);
    obj.edit584:setHeight(25);
    obj.edit584:setField("toqueComp");
    obj.edit584:setName("edit584");

    obj.label478 = GUI.fromHandle(_obj_newObject("label"));
    obj.label478:setParent(obj.rectangle151);
    obj.label478:setLeft(5);
    obj.label478:setTop(85);
    obj.label478:setWidth(60);
    obj.label478:setHeight(20);
    obj.label478:setText("Surpresa");
    obj.label478:setName("label478");

    obj.edit585 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit585:setParent(obj.rectangle151);
    obj.edit585:setLeft(70);
    obj.edit585:setTop(80);
    obj.edit585:setWidth(35);
    obj.edit585:setHeight(25);
    obj.edit585:setField("surpresaComp");
    obj.edit585:setName("edit585");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.rectangle151);
    obj.textEditor18:setLeft(105);
    obj.textEditor18:setTop(30);
    obj.textEditor18:setWidth(90);
    obj.textEditor18:setHeight(75);
    obj.textEditor18:setField("caCompDesc");
    obj.textEditor18:setName("textEditor18");

    obj.rectangle152 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle152:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle152:setLeft(0);
    obj.rectangle152:setTop(251);
    obj.rectangle152:setWidth(200);
    obj.rectangle152:setHeight(110);
    obj.rectangle152:setColor("black");
    obj.rectangle152:setName("rectangle152");

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.rectangle152);
    obj.button89:setLeft(5);
    obj.button89:setTop(8);
    obj.button89:setWidth(70);
    obj.button89:setHeight(20);
    obj.button89:setText("Iniciativa");
    obj.button89:setName("button89");

    obj.edit586 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit586:setParent(obj.rectangle152);
    obj.edit586:setLeft(80);
    obj.edit586:setTop(5);
    obj.edit586:setWidth(30);
    obj.edit586:setHeight(25);
    obj.edit586:setField("iniciativaComp");
    obj.edit586:setName("edit586");

    obj.edit587 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit587:setParent(obj.rectangle152);
    obj.edit587:setLeft(110);
    obj.edit587:setTop(5);
    obj.edit587:setWidth(85);
    obj.edit587:setHeight(25);
    obj.edit587:setField("iniciativaCompDesc");
    obj.edit587:setName("edit587");

    obj.label479 = GUI.fromHandle(_obj_newObject("label"));
    obj.label479:setParent(obj.rectangle152);
    obj.label479:setLeft(2);
    obj.label479:setTop(35);
    obj.label479:setWidth(85);
    obj.label479:setHeight(20);
    obj.label479:setText("Deslocamento");
    obj.label479:setFontSize(12);
    obj.label479:setName("label479");

    obj.edit588 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit588:setParent(obj.rectangle152);
    obj.edit588:setLeft(80);
    obj.edit588:setTop(30);
    obj.edit588:setWidth(115);
    obj.edit588:setHeight(25);
    obj.edit588:setField("deslocamentoComp");
    obj.edit588:setName("edit588");

    obj.label480 = GUI.fromHandle(_obj_newObject("label"));
    obj.label480:setParent(obj.rectangle152);
    obj.label480:setLeft(5);
    obj.label480:setTop(60);
    obj.label480:setWidth(40);
    obj.label480:setHeight(20);
    obj.label480:setText("BBA");
    obj.label480:setName("label480");

    obj.edit589 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit589:setParent(obj.rectangle152);
    obj.edit589:setLeft(35);
    obj.edit589:setTop(55);
    obj.edit589:setWidth(55);
    obj.edit589:setHeight(25);
    obj.edit589:setField("bbaComp");
    obj.edit589:setName("edit589");

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.rectangle152);
    obj.button90:setLeft(90);
    obj.button90:setTop(58);
    obj.button90:setWidth(60);
    obj.button90:setHeight(20);
    obj.button90:setText("Agarrar");
    obj.button90:setName("button90");

    obj.edit590 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit590:setParent(obj.rectangle152);
    obj.edit590:setLeft(150);
    obj.edit590:setTop(55);
    obj.edit590:setWidth(45);
    obj.edit590:setHeight(25);
    obj.edit590:setField("agarrarComp");
    obj.edit590:setName("edit590");

    obj.label481 = GUI.fromHandle(_obj_newObject("label"));
    obj.label481:setParent(obj.rectangle152);
    obj.label481:setLeft(5);
    obj.label481:setTop(85);
    obj.label481:setWidth(40);
    obj.label481:setHeight(20);
    obj.label481:setText("Esp.");
    obj.label481:setName("label481");

    obj.edit591 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit591:setParent(obj.rectangle152);
    obj.edit591:setLeft(35);
    obj.edit591:setTop(80);
    obj.edit591:setWidth(35);
    obj.edit591:setHeight(25);
    obj.edit591:setField("esp1Comp");
    obj.edit591:setName("edit591");

    obj.edit592 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit592:setParent(obj.rectangle152);
    obj.edit592:setLeft(70);
    obj.edit592:setTop(80);
    obj.edit592:setWidth(35);
    obj.edit592:setHeight(25);
    obj.edit592:setField("esp2Comp");
    obj.edit592:setName("edit592");

    obj.label482 = GUI.fromHandle(_obj_newObject("label"));
    obj.label482:setParent(obj.rectangle152);
    obj.label482:setLeft(110);
    obj.label482:setTop(85);
    obj.label482:setWidth(40);
    obj.label482:setHeight(20);
    obj.label482:setText("Alc.");
    obj.label482:setName("label482");

    obj.edit593 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit593:setParent(obj.rectangle152);
    obj.edit593:setLeft(140);
    obj.edit593:setTop(80);
    obj.edit593:setWidth(55);
    obj.edit593:setHeight(25);
    obj.edit593:setField("alcanceComp");
    obj.edit593:setName("edit593");

    obj.rectangle153 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle153:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle153:setLeft(0);
    obj.rectangle153:setTop(364);
    obj.rectangle153:setWidth(200);
    obj.rectangle153:setHeight(160);
    obj.rectangle153:setColor("black");
    obj.rectangle153:setName("rectangle153");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle153);
    obj.layout67:setLeft(5);
    obj.layout67:setTop(5);
    obj.layout67:setWidth(195);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.button91 = GUI.fromHandle(_obj_newObject("button"));
    obj.button91:setParent(obj.layout67);
    obj.button91:setLeft(0);
    obj.button91:setTop(3);
    obj.button91:setWidth(42);
    obj.button91:setHeight(20);
    obj.button91:setText("FOR");
    obj.button91:setName("button91");

    obj.edit594 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit594:setParent(obj.layout67);
    obj.edit594:setLeft(45);
    obj.edit594:setTop(0);
    obj.edit594:setWidth(30);
    obj.edit594:setHeight(25);
    obj.edit594:setField("forComp");
    obj.edit594:setName("edit594");

    obj.rectangle154 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle154:setParent(obj.layout67);
    obj.rectangle154:setLeft(80);
    obj.rectangle154:setTop(0);
    obj.rectangle154:setWidth(30);
    obj.rectangle154:setHeight(25);
    obj.rectangle154:setColor("black");
    obj.rectangle154:setStrokeColor("white");
    obj.rectangle154:setStrokeSize(1);
    obj.rectangle154:setName("rectangle154");

    obj.label483 = GUI.fromHandle(_obj_newObject("label"));
    obj.label483:setParent(obj.layout67);
    obj.label483:setLeft(80);
    obj.label483:setTop(0);
    obj.label483:setWidth(30);
    obj.label483:setHeight(25);
    obj.label483:setField("forModComp");
    obj.label483:setHorzTextAlign("center");
    obj.label483:setName("label483");

    obj.edit595 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit595:setParent(obj.layout67);
    obj.edit595:setLeft(115);
    obj.edit595:setTop(0);
    obj.edit595:setWidth(75);
    obj.edit595:setHeight(25);
    obj.edit595:setField("forCompDesc");
    obj.edit595:setName("edit595");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle153);
    obj.layout68:setLeft(5);
    obj.layout68:setTop(30);
    obj.layout68:setWidth(195);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.button92 = GUI.fromHandle(_obj_newObject("button"));
    obj.button92:setParent(obj.layout68);
    obj.button92:setLeft(0);
    obj.button92:setTop(3);
    obj.button92:setWidth(42);
    obj.button92:setHeight(20);
    obj.button92:setText("DES");
    obj.button92:setName("button92");

    obj.edit596 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit596:setParent(obj.layout68);
    obj.edit596:setLeft(45);
    obj.edit596:setTop(0);
    obj.edit596:setWidth(30);
    obj.edit596:setHeight(25);
    obj.edit596:setField("desComp");
    obj.edit596:setName("edit596");

    obj.rectangle155 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle155:setParent(obj.layout68);
    obj.rectangle155:setLeft(80);
    obj.rectangle155:setTop(0);
    obj.rectangle155:setWidth(30);
    obj.rectangle155:setHeight(25);
    obj.rectangle155:setColor("black");
    obj.rectangle155:setStrokeColor("white");
    obj.rectangle155:setStrokeSize(1);
    obj.rectangle155:setName("rectangle155");

    obj.label484 = GUI.fromHandle(_obj_newObject("label"));
    obj.label484:setParent(obj.layout68);
    obj.label484:setLeft(80);
    obj.label484:setTop(0);
    obj.label484:setWidth(30);
    obj.label484:setHeight(25);
    obj.label484:setField("desModComp");
    obj.label484:setHorzTextAlign("center");
    obj.label484:setName("label484");

    obj.edit597 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit597:setParent(obj.layout68);
    obj.edit597:setLeft(115);
    obj.edit597:setTop(0);
    obj.edit597:setWidth(75);
    obj.edit597:setHeight(25);
    obj.edit597:setField("desCompDesc");
    obj.edit597:setName("edit597");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle153);
    obj.layout69:setLeft(5);
    obj.layout69:setTop(55);
    obj.layout69:setWidth(195);
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.button93 = GUI.fromHandle(_obj_newObject("button"));
    obj.button93:setParent(obj.layout69);
    obj.button93:setLeft(0);
    obj.button93:setTop(3);
    obj.button93:setWidth(42);
    obj.button93:setHeight(20);
    obj.button93:setText("CON");
    obj.button93:setName("button93");

    obj.edit598 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit598:setParent(obj.layout69);
    obj.edit598:setLeft(45);
    obj.edit598:setTop(0);
    obj.edit598:setWidth(30);
    obj.edit598:setHeight(25);
    obj.edit598:setField("conComp");
    obj.edit598:setName("edit598");

    obj.rectangle156 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle156:setParent(obj.layout69);
    obj.rectangle156:setLeft(80);
    obj.rectangle156:setTop(0);
    obj.rectangle156:setWidth(30);
    obj.rectangle156:setHeight(25);
    obj.rectangle156:setColor("black");
    obj.rectangle156:setStrokeColor("white");
    obj.rectangle156:setStrokeSize(1);
    obj.rectangle156:setName("rectangle156");

    obj.label485 = GUI.fromHandle(_obj_newObject("label"));
    obj.label485:setParent(obj.layout69);
    obj.label485:setLeft(80);
    obj.label485:setTop(0);
    obj.label485:setWidth(30);
    obj.label485:setHeight(25);
    obj.label485:setField("conModComp");
    obj.label485:setHorzTextAlign("center");
    obj.label485:setName("label485");

    obj.edit599 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit599:setParent(obj.layout69);
    obj.edit599:setLeft(115);
    obj.edit599:setTop(0);
    obj.edit599:setWidth(75);
    obj.edit599:setHeight(25);
    obj.edit599:setField("conCompDesc");
    obj.edit599:setName("edit599");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle153);
    obj.layout70:setLeft(5);
    obj.layout70:setTop(80);
    obj.layout70:setWidth(195);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.button94 = GUI.fromHandle(_obj_newObject("button"));
    obj.button94:setParent(obj.layout70);
    obj.button94:setLeft(0);
    obj.button94:setTop(3);
    obj.button94:setWidth(42);
    obj.button94:setHeight(20);
    obj.button94:setText("INT");
    obj.button94:setName("button94");

    obj.edit600 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit600:setParent(obj.layout70);
    obj.edit600:setLeft(45);
    obj.edit600:setTop(0);
    obj.edit600:setWidth(30);
    obj.edit600:setHeight(25);
    obj.edit600:setField("intComp");
    obj.edit600:setName("edit600");

    obj.rectangle157 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle157:setParent(obj.layout70);
    obj.rectangle157:setLeft(80);
    obj.rectangle157:setTop(0);
    obj.rectangle157:setWidth(30);
    obj.rectangle157:setHeight(25);
    obj.rectangle157:setColor("black");
    obj.rectangle157:setStrokeColor("white");
    obj.rectangle157:setStrokeSize(1);
    obj.rectangle157:setName("rectangle157");

    obj.label486 = GUI.fromHandle(_obj_newObject("label"));
    obj.label486:setParent(obj.layout70);
    obj.label486:setLeft(80);
    obj.label486:setTop(0);
    obj.label486:setWidth(30);
    obj.label486:setHeight(25);
    obj.label486:setField("intModComp");
    obj.label486:setHorzTextAlign("center");
    obj.label486:setName("label486");

    obj.edit601 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit601:setParent(obj.layout70);
    obj.edit601:setLeft(115);
    obj.edit601:setTop(0);
    obj.edit601:setWidth(75);
    obj.edit601:setHeight(25);
    obj.edit601:setField("intCompDesc");
    obj.edit601:setName("edit601");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle153);
    obj.layout71:setLeft(5);
    obj.layout71:setTop(105);
    obj.layout71:setWidth(195);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.button95 = GUI.fromHandle(_obj_newObject("button"));
    obj.button95:setParent(obj.layout71);
    obj.button95:setLeft(0);
    obj.button95:setTop(3);
    obj.button95:setWidth(42);
    obj.button95:setHeight(20);
    obj.button95:setText("SAB");
    obj.button95:setName("button95");

    obj.edit602 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit602:setParent(obj.layout71);
    obj.edit602:setLeft(45);
    obj.edit602:setTop(0);
    obj.edit602:setWidth(30);
    obj.edit602:setHeight(25);
    obj.edit602:setField("sabComp");
    obj.edit602:setName("edit602");

    obj.rectangle158 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle158:setParent(obj.layout71);
    obj.rectangle158:setLeft(80);
    obj.rectangle158:setTop(0);
    obj.rectangle158:setWidth(30);
    obj.rectangle158:setHeight(25);
    obj.rectangle158:setColor("black");
    obj.rectangle158:setStrokeColor("white");
    obj.rectangle158:setStrokeSize(1);
    obj.rectangle158:setName("rectangle158");

    obj.label487 = GUI.fromHandle(_obj_newObject("label"));
    obj.label487:setParent(obj.layout71);
    obj.label487:setLeft(80);
    obj.label487:setTop(0);
    obj.label487:setWidth(30);
    obj.label487:setHeight(25);
    obj.label487:setField("sabModComp");
    obj.label487:setHorzTextAlign("center");
    obj.label487:setName("label487");

    obj.edit603 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit603:setParent(obj.layout71);
    obj.edit603:setLeft(115);
    obj.edit603:setTop(0);
    obj.edit603:setWidth(75);
    obj.edit603:setHeight(25);
    obj.edit603:setField("sabCompDesc");
    obj.edit603:setName("edit603");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle153);
    obj.layout72:setLeft(5);
    obj.layout72:setTop(130);
    obj.layout72:setWidth(195);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.button96 = GUI.fromHandle(_obj_newObject("button"));
    obj.button96:setParent(obj.layout72);
    obj.button96:setLeft(0);
    obj.button96:setTop(3);
    obj.button96:setWidth(42);
    obj.button96:setHeight(20);
    obj.button96:setText("CAR");
    obj.button96:setName("button96");

    obj.edit604 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit604:setParent(obj.layout72);
    obj.edit604:setLeft(45);
    obj.edit604:setTop(0);
    obj.edit604:setWidth(30);
    obj.edit604:setHeight(25);
    obj.edit604:setField("carComp");
    obj.edit604:setName("edit604");

    obj.rectangle159 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle159:setParent(obj.layout72);
    obj.rectangle159:setLeft(80);
    obj.rectangle159:setTop(0);
    obj.rectangle159:setWidth(30);
    obj.rectangle159:setHeight(25);
    obj.rectangle159:setColor("black");
    obj.rectangle159:setStrokeColor("white");
    obj.rectangle159:setStrokeSize(1);
    obj.rectangle159:setName("rectangle159");

    obj.label488 = GUI.fromHandle(_obj_newObject("label"));
    obj.label488:setParent(obj.layout72);
    obj.label488:setLeft(80);
    obj.label488:setTop(0);
    obj.label488:setWidth(30);
    obj.label488:setHeight(25);
    obj.label488:setField("carModComp");
    obj.label488:setHorzTextAlign("center");
    obj.label488:setName("label488");

    obj.edit605 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit605:setParent(obj.layout72);
    obj.edit605:setLeft(115);
    obj.edit605:setTop(0);
    obj.edit605:setWidth(75);
    obj.edit605:setHeight(25);
    obj.edit605:setField("carCompDesc");
    obj.edit605:setName("edit605");

    obj.rectangle160 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle160:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle160:setLeft(0);
    obj.rectangle160:setTop(527);
    obj.rectangle160:setWidth(200);
    obj.rectangle160:setHeight(85);
    obj.rectangle160:setColor("black");
    obj.rectangle160:setName("rectangle160");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle160);
    obj.layout73:setLeft(5);
    obj.layout73:setTop(5);
    obj.layout73:setWidth(195);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.button97 = GUI.fromHandle(_obj_newObject("button"));
    obj.button97:setParent(obj.layout73);
    obj.button97:setLeft(0);
    obj.button97:setTop(3);
    obj.button97:setWidth(42);
    obj.button97:setHeight(20);
    obj.button97:setText("FORT");
    obj.button97:setName("button97");

    obj.edit606 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit606:setParent(obj.layout73);
    obj.edit606:setLeft(45);
    obj.edit606:setTop(0);
    obj.edit606:setWidth(30);
    obj.edit606:setHeight(25);
    obj.edit606:setField("fortComp");
    obj.edit606:setName("edit606");

    obj.edit607 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit607:setParent(obj.layout73);
    obj.edit607:setLeft(80);
    obj.edit607:setTop(0);
    obj.edit607:setWidth(110);
    obj.edit607:setHeight(25);
    obj.edit607:setField("fortCompDesc");
    obj.edit607:setName("edit607");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle160);
    obj.layout74:setLeft(5);
    obj.layout74:setTop(30);
    obj.layout74:setWidth(195);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.button98 = GUI.fromHandle(_obj_newObject("button"));
    obj.button98:setParent(obj.layout74);
    obj.button98:setLeft(0);
    obj.button98:setTop(3);
    obj.button98:setWidth(42);
    obj.button98:setHeight(20);
    obj.button98:setText("REF");
    obj.button98:setName("button98");

    obj.edit608 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit608:setParent(obj.layout74);
    obj.edit608:setLeft(45);
    obj.edit608:setTop(0);
    obj.edit608:setWidth(30);
    obj.edit608:setHeight(25);
    obj.edit608:setField("refComp");
    obj.edit608:setName("edit608");

    obj.edit609 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit609:setParent(obj.layout74);
    obj.edit609:setLeft(80);
    obj.edit609:setTop(0);
    obj.edit609:setWidth(110);
    obj.edit609:setHeight(25);
    obj.edit609:setField("refCompDesc");
    obj.edit609:setName("edit609");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle160);
    obj.layout75:setLeft(5);
    obj.layout75:setTop(55);
    obj.layout75:setWidth(195);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.button99 = GUI.fromHandle(_obj_newObject("button"));
    obj.button99:setParent(obj.layout75);
    obj.button99:setLeft(0);
    obj.button99:setTop(3);
    obj.button99:setWidth(42);
    obj.button99:setHeight(20);
    obj.button99:setText("VON");
    obj.button99:setName("button99");

    obj.edit610 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit610:setParent(obj.layout75);
    obj.edit610:setLeft(45);
    obj.edit610:setTop(0);
    obj.edit610:setWidth(30);
    obj.edit610:setHeight(25);
    obj.edit610:setField("vonComp");
    obj.edit610:setName("edit610");

    obj.edit611 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit611:setParent(obj.layout75);
    obj.edit611:setLeft(80);
    obj.edit611:setTop(0);
    obj.edit611:setWidth(110);
    obj.edit611:setHeight(25);
    obj.edit611:setField("vonCompDesc");
    obj.edit611:setName("edit611");

    obj.rectangle161 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle161:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle161:setLeft(205);
    obj.rectangle161:setTop(0);
    obj.rectangle161:setWidth(300);
    obj.rectangle161:setHeight(300);
    obj.rectangle161:setColor("black");
    obj.rectangle161:setName("rectangle161");

    obj.label489 = GUI.fromHandle(_obj_newObject("label"));
    obj.label489:setParent(obj.rectangle161);
    obj.label489:setLeft(0);
    obj.label489:setTop(0);
    obj.label489:setWidth(300);
    obj.label489:setHeight(25);
    obj.label489:setText("PERÍCIAS");
    obj.label489:setHorzTextAlign("center");
    obj.label489:setName("label489");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.rectangle161);
    obj.textEditor19:setLeft(5);
    obj.textEditor19:setTop(30);
    obj.textEditor19:setWidth(290);
    obj.textEditor19:setHeight(265);
    obj.textEditor19:setField("periciasComp");
    obj.textEditor19:setName("textEditor19");

    obj.rectangle162 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle162:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle162:setLeft(510);
    obj.rectangle162:setTop(0);
    obj.rectangle162:setWidth(300);
    obj.rectangle162:setHeight(300);
    obj.rectangle162:setColor("black");
    obj.rectangle162:setName("rectangle162");

    obj.label490 = GUI.fromHandle(_obj_newObject("label"));
    obj.label490:setParent(obj.rectangle162);
    obj.label490:setLeft(0);
    obj.label490:setTop(0);
    obj.label490:setWidth(300);
    obj.label490:setHeight(25);
    obj.label490:setText("TALENTOS");
    obj.label490:setHorzTextAlign("center");
    obj.label490:setName("label490");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.rectangle162);
    obj.textEditor20:setLeft(5);
    obj.textEditor20:setTop(30);
    obj.textEditor20:setWidth(290);
    obj.textEditor20:setHeight(265);
    obj.textEditor20:setField("talentosComp");
    obj.textEditor20:setName("textEditor20");

    obj.rectangle163 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle163:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle163:setLeft(815);
    obj.rectangle163:setTop(0);
    obj.rectangle163:setWidth(300);
    obj.rectangle163:setHeight(300);
    obj.rectangle163:setColor("black");
    obj.rectangle163:setName("rectangle163");

    obj.label491 = GUI.fromHandle(_obj_newObject("label"));
    obj.label491:setParent(obj.rectangle163);
    obj.label491:setLeft(0);
    obj.label491:setTop(0);
    obj.label491:setWidth(300);
    obj.label491:setHeight(25);
    obj.label491:setText("HABILIDADES");
    obj.label491:setHorzTextAlign("center");
    obj.label491:setName("label491");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.rectangle163);
    obj.textEditor21:setLeft(5);
    obj.textEditor21:setTop(30);
    obj.textEditor21:setWidth(290);
    obj.textEditor21:setHeight(265);
    obj.textEditor21:setField("habilidadesComp");
    obj.textEditor21:setName("textEditor21");

    obj.rectangle164 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle164:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle164:setLeft(205);
    obj.rectangle164:setTop(305);
    obj.rectangle164:setWidth(300);
    obj.rectangle164:setHeight(300);
    obj.rectangle164:setColor("black");
    obj.rectangle164:setName("rectangle164");

    obj.label492 = GUI.fromHandle(_obj_newObject("label"));
    obj.label492:setParent(obj.rectangle164);
    obj.label492:setLeft(0);
    obj.label492:setTop(0);
    obj.label492:setWidth(300);
    obj.label492:setHeight(25);
    obj.label492:setText("INVENTARIO");
    obj.label492:setHorzTextAlign("center");
    obj.label492:setName("label492");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.rectangle164);
    obj.textEditor22:setLeft(5);
    obj.textEditor22:setTop(30);
    obj.textEditor22:setWidth(290);
    obj.textEditor22:setHeight(240);
    obj.textEditor22:setField("inventarioComp");
    obj.textEditor22:setName("textEditor22");

    obj.label493 = GUI.fromHandle(_obj_newObject("label"));
    obj.label493:setParent(obj.rectangle164);
    obj.label493:setLeft(55);
    obj.label493:setTop(275);
    obj.label493:setWidth(50);
    obj.label493:setHeight(20);
    obj.label493:setText("PESO");
    obj.label493:setName("label493");

    obj.edit612 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit612:setParent(obj.rectangle164);
    obj.edit612:setLeft(95);
    obj.edit612:setTop(270);
    obj.edit612:setWidth(70);
    obj.edit612:setHeight(25);
    obj.edit612:setField("pesoInventorioComp");
    obj.edit612:setVertTextAlign("center");
    obj.edit612:setHorzTextAlign("center");
    obj.edit612:setName("edit612");

    obj.label494 = GUI.fromHandle(_obj_newObject("label"));
    obj.label494:setParent(obj.rectangle164);
    obj.label494:setLeft(175);
    obj.label494:setTop(275);
    obj.label494:setWidth(50);
    obj.label494:setHeight(20);
    obj.label494:setText("PREÇO");
    obj.label494:setName("label494");

    obj.edit613 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit613:setParent(obj.rectangle164);
    obj.edit613:setLeft(225);
    obj.edit613:setTop(270);
    obj.edit613:setWidth(70);
    obj.edit613:setHeight(25);
    obj.edit613:setField("precoInventorioComp");
    obj.edit613:setVertTextAlign("center");
    obj.edit613:setHorzTextAlign("center");
    obj.edit613:setName("edit613");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.boxDetalhesDoCompanheiro);
    obj.dataLink52:setField("precoInventorioComp");
    obj.dataLink52:setName("dataLink52");

    obj.rectangle165 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle165:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle165:setLeft(510);
    obj.rectangle165:setTop(305);
    obj.rectangle165:setWidth(300);
    obj.rectangle165:setHeight(300);
    obj.rectangle165:setColor("black");
    obj.rectangle165:setName("rectangle165");

    obj.label495 = GUI.fromHandle(_obj_newObject("label"));
    obj.label495:setParent(obj.rectangle165);
    obj.label495:setLeft(0);
    obj.label495:setTop(0);
    obj.label495:setWidth(300);
    obj.label495:setHeight(25);
    obj.label495:setText("ATAQUES");
    obj.label495:setHorzTextAlign("center");
    obj.label495:setName("label495");

    obj.textEditor23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.rectangle165);
    obj.textEditor23:setLeft(5);
    obj.textEditor23:setTop(30);
    obj.textEditor23:setWidth(290);
    obj.textEditor23:setHeight(120);
    obj.textEditor23:setField("ataquesComp");
    obj.textEditor23:setName("textEditor23");

    obj.label496 = GUI.fromHandle(_obj_newObject("label"));
    obj.label496:setParent(obj.rectangle165);
    obj.label496:setLeft(5);
    obj.label496:setTop(150);
    obj.label496:setWidth(100);
    obj.label496:setHeight(20);
    obj.label496:setText("Macro");
    obj.label496:setName("label496");


					local function lines(str)
					   local t = {}
					   local function helper(line)
					      table.insert(t, line)
					      return ""
					   end
					   helper((str:gsub("(.-)\r?\n", helper)))
					   return t
					end
				


    obj.button100 = GUI.fromHandle(_obj_newObject("button"));
    obj.button100:setParent(obj.rectangle165);
    obj.button100:setLeft(55);
    obj.button100:setTop(150);
    obj.button100:setWidth(50);
    obj.button100:setHeight(20);
    obj.button100:setHint("Envia tudo do segundo espaço para ataques no chat.");
    obj.button100:setText("Atacar");
    obj.button100:setName("button100");

    obj.textEditor24 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.rectangle165);
    obj.textEditor24:setLeft(5);
    obj.textEditor24:setTop(170);
    obj.textEditor24:setWidth(290);
    obj.textEditor24:setHeight(120);
    obj.textEditor24:setField("macro");
    obj.textEditor24:setName("textEditor24");

    obj.rectangle166 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle166:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle166:setLeft(815);
    obj.rectangle166:setTop(305);
    obj.rectangle166:setWidth(300);
    obj.rectangle166:setHeight(300);
    obj.rectangle166:setColor("black");
    obj.rectangle166:setName("rectangle166");

    obj.label497 = GUI.fromHandle(_obj_newObject("label"));
    obj.label497:setParent(obj.rectangle166);
    obj.label497:setLeft(0);
    obj.label497:setTop(0);
    obj.label497:setWidth(300);
    obj.label497:setHeight(25);
    obj.label497:setText("OUTROS");
    obj.label497:setHorzTextAlign("center");
    obj.label497:setName("label497");

    obj.textEditor25 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.rectangle166);
    obj.textEditor25:setLeft(5);
    obj.textEditor25:setTop(30);
    obj.textEditor25:setWidth(290);
    obj.textEditor25:setHeight(265);
    obj.textEditor25:setField("outrosComp");
    obj.textEditor25:setName("textEditor25");

    obj.rectangle167 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle167:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle167:setLeft(1120);
    obj.rectangle167:setTop(0);
    obj.rectangle167:setWidth(202);
    obj.rectangle167:setHeight(202);
    obj.rectangle167:setColor("black");
    obj.rectangle167:setStrokeColor("white");
    obj.rectangle167:setStrokeSize(1);
    obj.rectangle167:setName("rectangle167");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.boxDetalhesDoCompanheiro);
    obj.image22:setLeft(1121);
    obj.image22:setTop(1);
    obj.image22:setWidth(200);
    obj.image22:setHeight(200);
    obj.image22:setField("avatarComp");
    obj.image22:setEditable(true);
    obj.image22:setStyle("autoFit");
    obj.image22:setName("image22");

    obj.button101 = GUI.fromHandle(_obj_newObject("button"));
    obj.button101:setParent(obj.scrollBox8);
    obj.button101:setText("Novo Companheiro");
    obj.button101:setLeft(1140);
    obj.button101:setTop(206);
    obj.button101:setWidth(160);
    obj.button101:setHeight(20);
    obj.button101:setName("button101");

    obj.rectangle168 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle168:setParent(obj.scrollBox8);
    obj.rectangle168:setLeft(1119);
    obj.rectangle168:setTop(229);
    obj.rectangle168:setWidth(202);
    obj.rectangle168:setHeight(362);
    obj.rectangle168:setColor("black");
    obj.rectangle168:setStrokeColor("white");
    obj.rectangle168:setStrokeSize(1);
    obj.rectangle168:setName("rectangle168");

    obj.rclListaDosCompanheiros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosCompanheiros:setParent(obj.scrollBox8);
    obj.rclListaDosCompanheiros:setName("rclListaDosCompanheiros");
    obj.rclListaDosCompanheiros:setField("campoDosCompanheiros");
    obj.rclListaDosCompanheiros:setTemplateForm("frmFichaRPGmeister8CS_svg");
    obj.rclListaDosCompanheiros:setLeft(1120);
    obj.rclListaDosCompanheiros:setTop(230);
    obj.rclListaDosCompanheiros:setWidth(200);
    obj.rclListaDosCompanheiros:setHeight(360);
    obj.rclListaDosCompanheiros:setSelectable(true);
    obj.rclListaDosCompanheiros:setLayout("vertical");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Descrição");
    obj.tab10:setName("tab10");

    obj.frmFichaRPGmeister9_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister9_svg:setParent(obj.tab10);
    obj.frmFichaRPGmeister9_svg:setName("frmFichaRPGmeister9_svg");
    obj.frmFichaRPGmeister9_svg:setAlign("client");
    obj.frmFichaRPGmeister9_svg:setTheme("dark");
    obj.frmFichaRPGmeister9_svg:setMargins({top=1});

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmFichaRPGmeister9_svg);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.rectangle169 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle169:setParent(obj.scrollBox9);
    obj.rectangle169:setLeft(0);
    obj.rectangle169:setTop(0);
    obj.rectangle169:setWidth(1205);
    obj.rectangle169:setHeight(105);
    obj.rectangle169:setColor("black");
    obj.rectangle169:setName("rectangle169");

    obj.label498 = GUI.fromHandle(_obj_newObject("label"));
    obj.label498:setParent(obj.rectangle169);
    obj.label498:setLeft(3);
    obj.label498:setTop(1);
    obj.label498:setWidth(100);
    obj.label498:setHeight(20);
    obj.label498:setText("DESCRIÇÃO");
    obj.label498:setName("label498");

    obj.label499 = GUI.fromHandle(_obj_newObject("label"));
    obj.label499:setParent(obj.rectangle169);
    obj.label499:setLeft(10);
    obj.label499:setTop(25);
    obj.label499:setWidth(90);
    obj.label499:setHeight(20);
    obj.label499:setText("TAMANHO");
    obj.label499:setHorzTextAlign("center");
    obj.label499:setName("label499");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle169);
    obj.comboBox7:setLeft(100);
    obj.comboBox7:setTop(25);
    obj.comboBox7:setWidth(100);
    obj.comboBox7:setField("tamanho");
    obj.comboBox7:setFontColor("white");
    obj.comboBox7:setItems({'Minúsculo', 'Diminuto', 'Miúdo', 'Pequeno', 'Médio', 'Grande', 'Enorme', 'Imenso', 'Colossal'});
    obj.comboBox7:setValues({'-4','-3','-2','-1','0','1','2','3','4'});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setName("comboBox7");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.rectangle169);
    obj.checkBox32:setLeft(200);
    obj.checkBox32:setTop(25);
    obj.checkBox32:setWidth(100);
    obj.checkBox32:setField("quadrupede");
    obj.checkBox32:setText("Quadrúpede");
    obj.checkBox32:setName("checkBox32");

    obj.label500 = GUI.fromHandle(_obj_newObject("label"));
    obj.label500:setParent(obj.rectangle169);
    obj.label500:setLeft(10);
    obj.label500:setTop(50);
    obj.label500:setWidth(90);
    obj.label500:setHeight(20);
    obj.label500:setText("ALTURA");
    obj.label500:setHorzTextAlign("center");
    obj.label500:setName("label500");

    obj.edit614 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit614:setParent(obj.rectangle169);
    obj.edit614:setLeft(100);
    obj.edit614:setTop(50);
    obj.edit614:setWidth(200);
    obj.edit614:setHeight(25);
    obj.edit614:setField("altura");
    obj.edit614:setVertTextAlign("center");
    obj.edit614:setName("edit614");

    obj.label501 = GUI.fromHandle(_obj_newObject("label"));
    obj.label501:setParent(obj.rectangle169);
    obj.label501:setLeft(10);
    obj.label501:setTop(75);
    obj.label501:setWidth(90);
    obj.label501:setHeight(20);
    obj.label501:setText("PESO");
    obj.label501:setHorzTextAlign("center");
    obj.label501:setName("label501");

    obj.edit615 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit615:setParent(obj.rectangle169);
    obj.edit615:setLeft(100);
    obj.edit615:setTop(75);
    obj.edit615:setWidth(200);
    obj.edit615:setHeight(25);
    obj.edit615:setField("peso");
    obj.edit615:setVertTextAlign("center");
    obj.edit615:setName("edit615");

    obj.label502 = GUI.fromHandle(_obj_newObject("label"));
    obj.label502:setParent(obj.rectangle169);
    obj.label502:setLeft(310);
    obj.label502:setTop(25);
    obj.label502:setWidth(90);
    obj.label502:setHeight(20);
    obj.label502:setText("IDADE");
    obj.label502:setHorzTextAlign("center");
    obj.label502:setName("label502");

    obj.edit616 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit616:setParent(obj.rectangle169);
    obj.edit616:setLeft(400);
    obj.edit616:setTop(25);
    obj.edit616:setWidth(200);
    obj.edit616:setHeight(25);
    obj.edit616:setField("idade");
    obj.edit616:setVertTextAlign("center");
    obj.edit616:setName("edit616");

    obj.label503 = GUI.fromHandle(_obj_newObject("label"));
    obj.label503:setParent(obj.rectangle169);
    obj.label503:setLeft(310);
    obj.label503:setTop(50);
    obj.label503:setWidth(90);
    obj.label503:setHeight(20);
    obj.label503:setText("SEXO");
    obj.label503:setHorzTextAlign("center");
    obj.label503:setName("label503");

    obj.edit617 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit617:setParent(obj.rectangle169);
    obj.edit617:setLeft(400);
    obj.edit617:setTop(50);
    obj.edit617:setWidth(200);
    obj.edit617:setHeight(25);
    obj.edit617:setField("sexo");
    obj.edit617:setVertTextAlign("center");
    obj.edit617:setName("edit617");

    obj.label504 = GUI.fromHandle(_obj_newObject("label"));
    obj.label504:setParent(obj.rectangle169);
    obj.label504:setLeft(310);
    obj.label504:setTop(75);
    obj.label504:setWidth(90);
    obj.label504:setHeight(20);
    obj.label504:setText("OUTROS");
    obj.label504:setHorzTextAlign("center");
    obj.label504:setName("label504");

    obj.edit618 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit618:setParent(obj.rectangle169);
    obj.edit618:setLeft(400);
    obj.edit618:setTop(75);
    obj.edit618:setWidth(200);
    obj.edit618:setHeight(25);
    obj.edit618:setField("aparenciaOutros");
    obj.edit618:setVertTextAlign("center");
    obj.edit618:setName("edit618");

    obj.label505 = GUI.fromHandle(_obj_newObject("label"));
    obj.label505:setParent(obj.rectangle169);
    obj.label505:setLeft(610);
    obj.label505:setTop(25);
    obj.label505:setWidth(90);
    obj.label505:setHeight(20);
    obj.label505:setText("OLHOS");
    obj.label505:setHorzTextAlign("center");
    obj.label505:setName("label505");

    obj.edit619 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit619:setParent(obj.rectangle169);
    obj.edit619:setLeft(700);
    obj.edit619:setTop(25);
    obj.edit619:setWidth(200);
    obj.edit619:setHeight(25);
    obj.edit619:setField("aparenciaOlhos");
    obj.edit619:setVertTextAlign("center");
    obj.edit619:setName("edit619");

    obj.label506 = GUI.fromHandle(_obj_newObject("label"));
    obj.label506:setParent(obj.rectangle169);
    obj.label506:setLeft(610);
    obj.label506:setTop(50);
    obj.label506:setWidth(90);
    obj.label506:setHeight(20);
    obj.label506:setText("PELE");
    obj.label506:setHorzTextAlign("center");
    obj.label506:setName("label506");

    obj.edit620 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit620:setParent(obj.rectangle169);
    obj.edit620:setLeft(700);
    obj.edit620:setTop(50);
    obj.edit620:setWidth(200);
    obj.edit620:setHeight(25);
    obj.edit620:setField("pele");
    obj.edit620:setVertTextAlign("center");
    obj.edit620:setName("edit620");

    obj.label507 = GUI.fromHandle(_obj_newObject("label"));
    obj.label507:setParent(obj.rectangle169);
    obj.label507:setLeft(610);
    obj.label507:setTop(75);
    obj.label507:setWidth(90);
    obj.label507:setHeight(20);
    obj.label507:setText("CABELO");
    obj.label507:setHorzTextAlign("center");
    obj.label507:setName("label507");

    obj.edit621 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit621:setParent(obj.rectangle169);
    obj.edit621:setLeft(700);
    obj.edit621:setTop(75);
    obj.edit621:setWidth(200);
    obj.edit621:setHeight(25);
    obj.edit621:setField("cabelo");
    obj.edit621:setVertTextAlign("center");
    obj.edit621:setName("edit621");

    obj.label508 = GUI.fromHandle(_obj_newObject("label"));
    obj.label508:setParent(obj.rectangle169);
    obj.label508:setLeft(910);
    obj.label508:setTop(25);
    obj.label508:setWidth(90);
    obj.label508:setHeight(20);
    obj.label508:setText("REINO");
    obj.label508:setHorzTextAlign("center");
    obj.label508:setName("label508");

    obj.edit622 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit622:setParent(obj.rectangle169);
    obj.edit622:setLeft(1000);
    obj.edit622:setTop(25);
    obj.edit622:setWidth(200);
    obj.edit622:setHeight(25);
    obj.edit622:setField("reino");
    obj.edit622:setVertTextAlign("center");
    obj.edit622:setName("edit622");

    obj.label509 = GUI.fromHandle(_obj_newObject("label"));
    obj.label509:setParent(obj.rectangle169);
    obj.label509:setLeft(910);
    obj.label509:setTop(50);
    obj.label509:setWidth(90);
    obj.label509:setHeight(20);
    obj.label509:setText("REGIÃO");
    obj.label509:setHorzTextAlign("center");
    obj.label509:setName("label509");

    obj.edit623 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit623:setParent(obj.rectangle169);
    obj.edit623:setLeft(1000);
    obj.edit623:setTop(50);
    obj.edit623:setWidth(200);
    obj.edit623:setHeight(25);
    obj.edit623:setField("regiao");
    obj.edit623:setVertTextAlign("center");
    obj.edit623:setName("edit623");

    obj.label510 = GUI.fromHandle(_obj_newObject("label"));
    obj.label510:setParent(obj.rectangle169);
    obj.label510:setLeft(910);
    obj.label510:setTop(75);
    obj.label510:setWidth(90);
    obj.label510:setHeight(20);
    obj.label510:setText("CIDADE");
    obj.label510:setHorzTextAlign("center");
    obj.label510:setName("label510");

    obj.edit624 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit624:setParent(obj.rectangle169);
    obj.edit624:setLeft(1000);
    obj.edit624:setTop(75);
    obj.edit624:setWidth(200);
    obj.edit624:setHeight(25);
    obj.edit624:setField("cidade");
    obj.edit624:setVertTextAlign("center");
    obj.edit624:setName("edit624");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.scrollBox9);
    obj.dataLink53:setFields({'tamanho', 'quadrupede', 'efetFor'});
    obj.dataLink53:setName("dataLink53");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.scrollBox9);
    obj.layout76:setLeft(0);
    obj.layout76:setTop(110);
    obj.layout76:setWidth(375);
    obj.layout76:setHeight(240);
    obj.layout76:setName("layout76");

    obj.rectangle170 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle170:setParent(obj.layout76);
    obj.rectangle170:setAlign("client");
    obj.rectangle170:setColor("black");
    obj.rectangle170:setName("rectangle170");

    obj.label511 = GUI.fromHandle(_obj_newObject("label"));
    obj.label511:setParent(obj.layout76);
    obj.label511:setLeft(5);
    obj.label511:setTop(1);
    obj.label511:setWidth(100);
    obj.label511:setHeight(20);
    obj.label511:setText("APARÊNCIA");
    obj.label511:setName("label511");

    obj.textEditor26 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor26:setParent(obj.layout76);
    obj.textEditor26:setLeft(5);
    obj.textEditor26:setTop(25);
    obj.textEditor26:setWidth(365);
    obj.textEditor26:setHeight(210);
    obj.textEditor26:setField("aparencia");
    obj.textEditor26:setName("textEditor26");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.scrollBox9);
    obj.layout77:setLeft(0);
    obj.layout77:setTop(355);
    obj.layout77:setWidth(375);
    obj.layout77:setHeight(250);
    obj.layout77:setName("layout77");

    obj.rectangle171 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle171:setParent(obj.layout77);
    obj.rectangle171:setAlign("client");
    obj.rectangle171:setColor("black");
    obj.rectangle171:setName("rectangle171");

    obj.label512 = GUI.fromHandle(_obj_newObject("label"));
    obj.label512:setParent(obj.layout77);
    obj.label512:setLeft(5);
    obj.label512:setTop(1);
    obj.label512:setWidth(100);
    obj.label512:setHeight(20);
    obj.label512:setText("PERSONALIDADE");
    obj.label512:setName("label512");

    obj.textEditor27 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor27:setParent(obj.layout77);
    obj.textEditor27:setLeft(5);
    obj.textEditor27:setTop(25);
    obj.textEditor27:setWidth(365);
    obj.textEditor27:setHeight(220);
    obj.textEditor27:setField("personalidade");
    obj.textEditor27:setName("textEditor27");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.scrollBox9);
    obj.layout78:setLeft(380);
    obj.layout78:setTop(110);
    obj.layout78:setWidth(825);
    obj.layout78:setHeight(495);
    obj.layout78:setName("layout78");

    obj.rectangle172 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle172:setParent(obj.layout78);
    obj.rectangle172:setAlign("client");
    obj.rectangle172:setColor("black");
    obj.rectangle172:setName("rectangle172");

    obj.label513 = GUI.fromHandle(_obj_newObject("label"));
    obj.label513:setParent(obj.layout78);
    obj.label513:setLeft(5);
    obj.label513:setTop(1);
    obj.label513:setWidth(100);
    obj.label513:setHeight(20);
    obj.label513:setText("HISTORIA");
    obj.label513:setName("label513");

    obj.button102 = GUI.fromHandle(_obj_newObject("button"));
    obj.button102:setParent(obj.layout78);
    obj.button102:setLeft(720);
    obj.button102:setTop(1);
    obj.button102:setWidth(100);
    obj.button102:setHeight(20);
    obj.button102:setText("Copiar Antigo");
    obj.button102:setName("button102");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout78);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab11 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab11:setParent(obj.tabControl1);
    obj.tab11:setTitle("Anotações");
    obj.tab11:setName("tab11");

    obj.frmFichaRPGmeister10_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab11);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");
    obj.frmFichaRPGmeister10_svg:setTheme("dark");

    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmFichaRPGmeister10_svg);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.scrollBox10);
    obj.layout79:setLeft(0);
    obj.layout79:setTop(0);
    obj.layout79:setWidth(400);
    obj.layout79:setHeight(605);
    obj.layout79:setName("layout79");

    obj.rectangle173 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle173:setParent(obj.layout79);
    obj.rectangle173:setAlign("client");
    obj.rectangle173:setColor("black");
    obj.rectangle173:setName("rectangle173");

    obj.label514 = GUI.fromHandle(_obj_newObject("label"));
    obj.label514:setParent(obj.layout79);
    obj.label514:setLeft(0);
    obj.label514:setTop(0);
    obj.label514:setWidth(400);
    obj.label514:setHeight(20);
    obj.label514:setText("ANOTAÇÕES");
    obj.label514:setHorzTextAlign("center");
    obj.label514:setName("label514");

    obj.textEditor28 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor28:setParent(obj.layout79);
    obj.textEditor28:setLeft(10);
    obj.textEditor28:setTop(25);
    obj.textEditor28:setWidth(380);
    obj.textEditor28:setHeight(575);
    obj.textEditor28:setField("anotacoes1");
    obj.textEditor28:setName("textEditor28");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.scrollBox10);
    obj.layout80:setLeft(405);
    obj.layout80:setTop(0);
    obj.layout80:setWidth(400);
    obj.layout80:setHeight(605);
    obj.layout80:setName("layout80");

    obj.rectangle174 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle174:setParent(obj.layout80);
    obj.rectangle174:setAlign("client");
    obj.rectangle174:setColor("black");
    obj.rectangle174:setName("rectangle174");

    obj.label515 = GUI.fromHandle(_obj_newObject("label"));
    obj.label515:setParent(obj.layout80);
    obj.label515:setLeft(0);
    obj.label515:setTop(0);
    obj.label515:setWidth(400);
    obj.label515:setHeight(20);
    obj.label515:setText("ANOTAÇÕES");
    obj.label515:setHorzTextAlign("center");
    obj.label515:setName("label515");

    obj.textEditor29 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor29:setParent(obj.layout80);
    obj.textEditor29:setLeft(10);
    obj.textEditor29:setTop(25);
    obj.textEditor29:setWidth(380);
    obj.textEditor29:setHeight(575);
    obj.textEditor29:setField("anotacoes2");
    obj.textEditor29:setName("textEditor29");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.scrollBox10);
    obj.layout81:setLeft(810);
    obj.layout81:setTop(0);
    obj.layout81:setWidth(400);
    obj.layout81:setHeight(605);
    obj.layout81:setName("layout81");

    obj.rectangle175 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle175:setParent(obj.layout81);
    obj.rectangle175:setAlign("client");
    obj.rectangle175:setColor("black");
    obj.rectangle175:setName("rectangle175");

    obj.label516 = GUI.fromHandle(_obj_newObject("label"));
    obj.label516:setParent(obj.layout81);
    obj.label516:setLeft(0);
    obj.label516:setTop(0);
    obj.label516:setWidth(400);
    obj.label516:setHeight(20);
    obj.label516:setText("ANOTAÇÕES");
    obj.label516:setHorzTextAlign("center");
    obj.label516:setName("label516");

    obj.textEditor30 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor30:setParent(obj.layout81);
    obj.textEditor30:setLeft(10);
    obj.textEditor30:setTop(25);
    obj.textEditor30:setWidth(380);
    obj.textEditor30:setHeight(575);
    obj.textEditor30:setField("anotacoes3");
    obj.textEditor30:setName("textEditor30");

    obj.tab12 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab12:setParent(obj.tabControl1);
    obj.tab12:setTitle("Creditos");
    obj.tab12:setName("tab12");

    obj.frmFichaRPGmeister11_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab12);
    obj.frmFichaRPGmeister11_svg:setName("frmFichaRPGmeister11_svg");
    obj.frmFichaRPGmeister11_svg:setAlign("client");
    obj.frmFichaRPGmeister11_svg:setTheme("dark");

    obj.scrollBox11 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox11:setParent(obj.frmFichaRPGmeister11_svg);
    obj.scrollBox11:setAlign("client");
    obj.scrollBox11:setName("scrollBox11");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.scrollBox11);
    obj.image23:setLeft(0);
    obj.image23:setTop(0);
    obj.image23:setWidth(600);
    obj.image23:setHeight(600);
    obj.image23:setSRC("/FichaAvatar/images/RPGmeister.jpg");
    obj.image23:setStyle("stretch");
    obj.image23:setOptimize(true);
    obj.image23:setName("image23");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox11);
    obj.layout82:setLeft(620);
    obj.layout82:setTop(10);
    obj.layout82:setWidth(200);
    obj.layout82:setHeight(150);
    obj.layout82:setName("layout82");

    obj.rectangle176 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle176:setParent(obj.layout82);
    obj.rectangle176:setLeft(0);
    obj.rectangle176:setTop(0);
    obj.rectangle176:setWidth(200);
    obj.rectangle176:setHeight(150);
    obj.rectangle176:setColor("black");
    obj.rectangle176:setXradius(15);
    obj.rectangle176:setYradius(15);
    obj.rectangle176:setCornerType("round");
    obj.rectangle176:setName("rectangle176");

    obj.label517 = GUI.fromHandle(_obj_newObject("label"));
    obj.label517:setParent(obj.layout82);
    obj.label517:setLeft(0);
    obj.label517:setTop(10);
    obj.label517:setWidth(200);
    obj.label517:setHeight(20);
    obj.label517:setText("Programador: Vinny (Ambesek)");
    obj.label517:setHorzTextAlign("center");
    obj.label517:setName("label517");

    obj.label518 = GUI.fromHandle(_obj_newObject("label"));
    obj.label518:setParent(obj.layout82);
    obj.label518:setLeft(0);
    obj.label518:setTop(35);
    obj.label518:setWidth(200);
    obj.label518:setHeight(20);
    obj.label518:setText("Arte: Nefer (Nefertyne)");
    obj.label518:setHorzTextAlign("center");
    obj.label518:setName("label518");

    obj.label519 = GUI.fromHandle(_obj_newObject("label"));
    obj.label519:setParent(obj.layout82);
    obj.label519:setLeft(0);
    obj.label519:setTop(95);
    obj.label519:setWidth(200);
    obj.label519:setHeight(20);
    obj.label519:setText("Sistema: Ambesek & Nefertyne");
    obj.label519:setHorzTextAlign("center");
    obj.label519:setName("label519");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.scrollBox11);
    obj.layout83:setLeft(830);
    obj.layout83:setTop(0);
    obj.layout83:setWidth(400);
    obj.layout83:setHeight(350);
    obj.layout83:setName("layout83");

    obj.rectangle177 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle177:setParent(obj.layout83);
    obj.rectangle177:setAlign("client");
    obj.rectangle177:setColor("black");
    obj.rectangle177:setName("rectangle177");

    obj.label520 = GUI.fromHandle(_obj_newObject("label"));
    obj.label520:setParent(obj.layout83);
    obj.label520:setLeft(0);
    obj.label520:setTop(0);
    obj.label520:setWidth(400);
    obj.label520:setHeight(20);
    obj.label520:setText("ANOTAÇÕES DO MESTRE");
    obj.label520:setHorzTextAlign("center");
    obj.label520:setName("label520");

    obj.textEditor31 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor31:setParent(obj.layout83);
    obj.textEditor31:setLeft(10);
    obj.textEditor31:setTop(25);
    obj.textEditor31:setWidth(380);
    obj.textEditor31:setHeight(320);
    obj.textEditor31:setField("anotacoes_do_mestre");
    obj.textEditor31:setName("textEditor31");

    obj.label521 = GUI.fromHandle(_obj_newObject("label"));
    obj.label521:setParent(obj.scrollBox11);
    obj.label521:setLeft(630);
    obj.label521:setTop(400);
    obj.label521:setWidth(200);
    obj.label521:setHeight(20);
    obj.label521:setText("SUA VERSÃO:");
    obj.label521:setField("versionInstalled");
    obj.label521:setName("label521");

    obj.label522 = GUI.fromHandle(_obj_newObject("label"));
    obj.label522:setParent(obj.scrollBox11);
    obj.label522:setLeft(630);
    obj.label522:setTop(430);
    obj.label522:setWidth(200);
    obj.label522:setHeight(20);
    obj.label522:setText("VERSÃO ATUAL:");
    obj.label522:setField("versionDownloaded");
    obj.label522:setName("label522");

    obj.button103 = GUI.fromHandle(_obj_newObject("button"));
    obj.button103:setParent(obj.scrollBox11);
    obj.button103:setLeft(620);
    obj.button103:setTop(475);
    obj.button103:setWidth(100);
    obj.button103:setText("Change Log");
    obj.button103:setName("button103");

    obj.button104 = GUI.fromHandle(_obj_newObject("button"));
    obj.button104:setParent(obj.scrollBox11);
    obj.button104:setLeft(730);
    obj.button104:setTop(475);
    obj.button104:setWidth(100);
    obj.button104:setText("Atualizar");
    obj.button104:setName("button104");

    obj.button105 = GUI.fromHandle(_obj_newObject("button"));
    obj.button105:setParent(obj.scrollBox11);
    obj.button105:setLeft(840);
    obj.button105:setTop(475);
    obj.button105:setWidth(100);
    obj.button105:setText("Tutorial");
    obj.button105:setName("button105");

    obj.button106 = GUI.fromHandle(_obj_newObject("button"));
    obj.button106:setParent(obj.scrollBox11);
    obj.button106:setLeft(950);
    obj.button106:setTop(475);
    obj.button106:setWidth(100);
    obj.button106:setText("Adaptação");
    obj.button106:setName("button106");

    obj.label523 = GUI.fromHandle(_obj_newObject("label"));
    obj.label523:setParent(obj.scrollBox11);
    obj.label523:setLeft(620);
    obj.label523:setTop(525);
    obj.label523:setWidth(120);
    obj.label523:setHeight(20);
    obj.label523:setText("CONHEÇA A MESA:");
    obj.label523:setFontSize(11);
    obj.label523:setName("label523");

    obj.button107 = GUI.fromHandle(_obj_newObject("button"));
    obj.button107:setParent(obj.scrollBox11);
    obj.button107:setLeft(730);
    obj.button107:setTop(525);
    obj.button107:setWidth(100);
    obj.button107:setText("RPGmeister");
    obj.button107:setName("button107");

    obj.button108 = GUI.fromHandle(_obj_newObject("button"));
    obj.button108:setParent(obj.scrollBox11);
    obj.button108:setLeft(840);
    obj.button108:setTop(525);
    obj.button108:setWidth(100);
    obj.button108:setText("Avatar");
    obj.button108:setName("button108");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Pathfinder/output/Ficha%20Pathfinder.rpk?raw=true",
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
                                Dialogs.choose("Há uma nova versão(".. info.version .. ") da Ficha Pathfinder. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Pathfinder/output/Ficha%20Pathfinder.rpk?raw=true');
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

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local real = 	(tonumber(sheet.inicialFor) or 0) + 
            										(tonumber(sheet.racaFor) or 0) + 
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

    obj._e_event2 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local real = 	(tonumber(sheet.inicialDes) or 0) + 
            										(tonumber(sheet.racaDes) or 0) + 
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

    obj._e_event3 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local real = 	(tonumber(sheet.inicialCon) or 0) + 
            										(tonumber(sheet.racaCon) or 0) + 
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

    obj._e_event4 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local real = 	(tonumber(sheet.inicialInt) or 0) + 
            										(tonumber(sheet.racaInt) or 0) + 
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

    obj._e_event5 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local real = 	(tonumber(sheet.inicialSab) or 0) + 
            										(tonumber(sheet.racaSab) or 0) + 
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

    obj._e_event6 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local real = 	(tonumber(sheet.inicialCar) or 0) + 
            										(tonumber(sheet.racaCar) or 0) + 
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

    obj._e_event7 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local tr = (tonumber(sheet.baseFort) or 0) + 
            										(tonumber(sheet.atrModFort) or 0) + 
            										(tonumber(sheet.magiaFort) or 0) + 
            										(tonumber(sheet.variavelFort) or 0) + 
            										(tonumber(sheet.temporarioFort) or 0) + 
            										(tonumber(sheet.outrosFort) or 0);
            						sheet.trFort = tr;
            					end;
        end, obj);

    obj._e_event8 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local tr = (tonumber(sheet.baseRef) or 0) + 
            										(tonumber(sheet.atrModRef) or 0) + 
            										(tonumber(sheet.magiaRef) or 0) + 
            										(tonumber(sheet.variavelRef) or 0) + 
            										(tonumber(sheet.temporarioRef) or 0) + 
            										(tonumber(sheet.outrosRef) or 0);
            						sheet.trRef = tr;
            					end;
        end, obj);

    obj._e_event9 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local tr = (tonumber(sheet.baseVon) or 0) + 
            										(tonumber(sheet.atrModVon) or 0) + 
            										(tonumber(sheet.magiaVon) or 0) + 
            										(tonumber(sheet.variavelVon) or 0) + 
            										(tonumber(sheet.temporarioVon) or 0) + 
            										(tonumber(sheet.outrosVon) or 0);
            						sheet.trVon = tr;
            					end;
        end, obj);

    obj._e_event10 = obj.button1:addEventListener("onClick",
        function (_)
            local mod = (getNumber(sheet.xpAtual) or 0) + (getNumber(sheet.xpNova) or 0);
            						
            						while true do  
            							mod, k = string.gsub(mod, "^(-?%d+)(%d%d%d)", '%1,%2')
            							if (k==0) then
            							  break
            							end
            						end
            						mod = string.gsub(mod, ",", ".");
            						
            						sheet.xpAtual = mod .. "XP";
            						sheet.xpNova = "0";
        end, obj);

    obj._e_event11 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
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
            						local mod2 = 0;
            						local mod3 = 0;
            						while mod>=mod2 do
            							mod3 = mod3+1;
            							mod2 = mod2 + mod3*1000;
            						end
            						
            						while true do  
            							mod2, k = string.gsub(mod2, "^(-?%d+)(%d%d%d)", '%1,%2')
            							if (k==0) then
            							  break
            							end
            						end
            						mod2 = string.gsub(mod2, ",", ".");
            						
            						sheet.xpNivel = mod2 .. "XP";
            						sheet.nep = mod3;
            					end;
        end, obj);

    obj._e_event12 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local pt = 0;
            					local nep = (tonumber(sheet.nep) or 0);
            
            					for i=1, nep, 1 do
            						pt = pt + 50 + math.floor(i/2) * 5;
            					end;
            					sheet.pt_total = pt;
        end, obj);

    obj._e_event13 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local pt_gasto = 	(tonumber(sheet.pt_talento) or 0) + 
            										(tonumber(sheet.pt_outro) or 0) + 
            										(tonumber(sheet.pt_classe) or 0) + 
            										(tonumber(sheet.pt_dobra) or 0) + 
            										(tonumber(sheet.pt_tecnica) or 0) + 
            										(tonumber(sheet.pt_tecnica_avancada) or 0);
            
            					sheet.pt_gasto = pt_gasto;
        end, obj);

    obj._e_event14 = obj.button2:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModFor) or 0);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Força de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event15 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.realModFor = getMOD(sheet.realFor);  
            					end;
        end, obj);

    obj._e_event16 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.efetModFor = getMOD(sheet.efetFor);
            						updateAtributes(1);
            					end;
        end, obj);

    obj._e_event17 = obj.button3:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModDes) or 0);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Destreza de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event18 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.realModDes = getMOD(sheet.realDes);  
            					end;
        end, obj);

    obj._e_event19 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.efetModDes = getMOD(sheet.efetDes);
            						updateAtributes(2);
            					end;
        end, obj);

    obj._e_event20 = obj.button4:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModCon) or 0);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Constituição de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event21 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.realModCon = getMOD(sheet.realCon);  
            					end;
        end, obj);

    obj._e_event22 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.efetModCon = getMOD(sheet.efetCon);
            						updateAtributes(3);
            					end;
        end, obj);

    obj._e_event23 = obj.button5:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModInt) or 0);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Inteligência de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event24 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.realModInt = getMOD(sheet.realInt);  
            					end;
        end, obj);

    obj._e_event25 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.efetModInt = getMOD(sheet.efetInt);
            						updateAtributes(4);
            					end;
        end, obj);

    obj._e_event26 = obj.button6:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModSab) or 0);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Sabedoria de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event27 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.realModSab = getMOD(sheet.realSab);  
            					end;
        end, obj);

    obj._e_event28 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.efetModSab = getMOD(sheet.efetSab);
            						updateAtributes(5);
            					end;
        end, obj);

    obj._e_event29 = obj.button7:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.efetModCar) or 0);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Carisma de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event30 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.realModCar = getMOD(sheet.realCar);  
            					end;
        end, obj);

    obj._e_event31 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						sheet.efetModCar = getMOD(sheet.efetCar);
            						updateAtributes(6);
            					end;
        end, obj);

    obj._e_event32 = obj.AtrBut:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popAtributo");
            				
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("rightCenter", self.AtrBut);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            					end;
        end, obj);

    obj._e_event33 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslTerrestre ~= nil then
            
            						local mod = sheet.deslTerrestre;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslTerrestreQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event34 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslVoo ~= nil then
            
            						local mod = sheet.deslVoo;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslVooQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event35 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslNatacao ~= nil then
            
            						local mod = sheet.deslNatacao;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslNatacaoQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event36 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslEscalar ~= nil then
            
            						local mod = sheet.deslEscalar;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslEscalarQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event37 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslEscavar ~= nil then
            
            						local mod = sheet.deslEscavar;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslEscavarQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event38 = obj.button8:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 " .. (sheet.iniciativa or "+0"));
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Iniciativa de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event39 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local mod = (tonumber(sheet.efetModDes) or 0) + (tonumber(sheet.iniVariado) or 0);
            						if (mod >= 0) then
            								mod = "+" .. mod;
            						end;					   
            						sheet.iniciativa = mod;
            					end;
        end, obj);

    obj._e_event40 = obj.caDetails:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popCA");
            					
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("bottomCenter", self.caDetails);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup de armadura para exibir");
            					end;
        end, obj);

    obj._e_event41 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            						local armaduraCa = (tonumber(sheet.equipamentoCorpoCA) or 0);
            						local escudoCa = (tonumber(sheet.escudoCa) or 0);
            						local efetModDes = (tonumber(sheet.efetModDes) or 0);
            						local tamanhoCa = (tonumber(sheet.tamanhoCa) or 0);
            						local naturalCa = (tonumber(sheet.naturalCa) or 0);
            						local deflexaoCa = (tonumber(sheet.deflexaoCa) or 0);
            						local esquivaCa = (tonumber(sheet.esquivaCa) or 0);
            						local sorteCa = (tonumber(sheet.sorteCa) or 0);
            						local outrosCa = (tonumber(sheet.outrosCa) or 0);
            						local variadosCa = (tonumber(sheet.variadosCa) or 0);
            
            						local desMax = tonumber(sheet.equipamentoCorpoDesMax) or 999;
            						if desMax < efetModDes then
            							efetModDes = desMax;
            						end;
            
            						local ca = 	10 + armaduraCa + escudoCa + efetModDes + tamanhoCa + naturalCa + deflexaoCa + esquivaCa + sorteCa + outrosCa + variadosCa;
            						
            						local surpresa = ca;
            						if not sheet.armaduraCaSurp then
            							surpresa = surpresa - armaduraCa;
            						end;
            						if not sheet.escudoCaSurp then
            							surpresa = surpresa - escudoCa;
            						end;
            						if not sheet.destrezaCaSurp then
            							surpresa = surpresa - efetModDes;
            						end;
            						if not sheet.tamanhoCaSurp then
            							surpresa = surpresa - tamanhoCa;
            						end;
            						if not sheet.naturalCaSurp then
            							surpresa = surpresa - naturalCa;
            						end;
            						if not sheet.deflexaoCaSurp then
            							surpresa = surpresa - deflexaoCa;
            						end;
            						if not sheet.esquivaCaSurp then
            							surpresa = surpresa - esquivaCa;
            						end;
            						if not sheet.sorteCaSurp then
            							surpresa = surpresa - sorteCa;
            						end;
            						if not sheet.outrosCaSurp then
            							surpresa = surpresa - outrosCa;
            						end;
            						if not sheet.variadosCaSurp then
            							surpresa = surpresa - variadosCa;
            						end;
            
            						local toque = ca;
            						if not sheet.armaduraCaToque then
            							toque = toque - armaduraCa;
            						end;
            						if not sheet.escudoCaToque then
            							toque = toque - escudoCa;
            						end;
            						if not sheet.destrezaCaToque then
            							toque = toque - efetModDes;
            						end;
            						if not sheet.tamanhoCaToque then
            							toque = toque - tamanhoCa;
            						end;
            						if not sheet.naturalCaToque then
            							toque = toque - naturalCa;
            						end;
            						if not sheet.deflexaoCaToque then
            							toque = toque - deflexaoCa;
            						end;
            						if not sheet.esquivaCaToque then
            							toque = toque - esquivaCa;
            						end;
            						if not sheet.sorteCaToque then
            							toque = toque - sorteCa;
            						end;
            						if not sheet.outrosCaToque then
            							toque = toque - outrosCa;
            						end;
            						if not sheet.variadosCaToque then
            							toque = toque - variadosCa;
            						end;
            
            						sheet.ca = ca;
            						sheet.surpresa = surpresa;
            						sheet.toque = toque;
            					end;
        end, obj);

    obj._e_event42 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~=nil then
            						sheet.penalidade = (tonumber(sheet.equipamentoCorpoPen) or 0) + (tonumber(sheet.escudoPEn) or 0);
            						updatePenalty();
            					end;
        end, obj);

    obj._e_event43 = obj.button9:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					sheet.modificador = sheet.modificador or 0;
            					mesaDoPersonagem.activeChat:rolarDados(sheet.dvs, "Pontos de Vigor de " .. (sheet.nome or "NOME"),
            						function (rolagem)
            							local maximo = 0;
            							local media = 0;
            							for i = 1, #rolagem.ops, 1 do 
            								local operacao = rolagem.ops[i]; 
            								if operacao.tipo == "dado" then   
            									maximo = maximo + (operacao.quantidade * operacao.face);
            									media = media + (operacao.quantidade * (operacao.face+1)/2);
            									if i==1 then
            										media = media + ((operacao.face-1)/2);
            									end;
            								elseif operacao.tipo == "imediato" then
            									maximo = maximo + operacao.valor;
            									media = media + operacao.valor;
            								end;
            							end;
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            							mesaDoPersonagem.activeChat:enviarMensagem("PV máximo: " .. maximo .. "; PV médio: " .. math.floor(media));
            							sheet.pvTotal = math.floor(media);
            						end);
        end, obj);

    obj._e_event44 = obj.button10:addEventListener("onClick",
        function (_)
            caSecreta();
        end, obj);

    obj._e_event45 = obj.edit129:addEventListener("onChange",
        function (_)
            if sheet~= nil then
            						local bba = tonumber(sheet.bba) or 0;
            						local text = "+" .. bba;
            						local l = 1;
            						while bba > 5 and l < 4 do
            							bba = bba -5;
            							l = l + 1;
            							text = text .. "/+" .. bba;
            						end;
            						sheet.bbaDesc = text;
            					end;
        end, obj);

    obj._e_event46 = obj.button11:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 + " .. (sheet.agarrar or "0"));
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Agarrar de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event47 = obj.GrappleBt:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popGrapple");
            					
            						if pop ~= nil then
            							pop:setNodeObject(self.sheet);
            							pop:showPopupEx("rightCenter", self.GrappleBt);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup de agarrar para exibir");
            						end;
        end, obj);

    obj._e_event48 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            							local agarrar = (tonumber(sheet.bba) or 0) + 
            										(tonumber(sheet.efetModFor) or 0) +  
            										(tonumber(sheet.agarrarTam) or 0) +   
            										(tonumber(sheet.agarrarVar) or 0);					  
            							sheet.agarrar = agarrar;
            						end;
        end, obj);

    obj._e_event49 = obj.button12:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 +" .. (sheet.trFort) or "0");
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Fortitude de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event50 = obj.button13:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 +" .. (sheet.trRef) or "0");
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Reflexos de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event51 = obj.button14:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem("1d20 +" .. (sheet.trVon) or "0");
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Vontade de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event52 = obj.dataLink44:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            						local atrModFort = 0;
            						local atrModRef = 0;
            						local atrModVon = 0;
            
            						local num = tonumber(sheet.atrTrFort) or 3;
            
            						if num == 1 then
            							atrModFort = getFOR();
            						elseif num == 2 then
            							atrModFort = getDES();
            						elseif num == 3 then
            							atrModFort = getCON();
            						elseif num == 4 then
            							atrModFort = getINT();
            						elseif num == 5 then
            							atrModFort = getSAB();
            						elseif num == 6 then
            							atrModFort = getCAR();
            						end;
            
            						num = tonumber(sheet.atrTrRef) or 2;
            
            						if num == 1 then
            							atrModRef = getFOR();
            						elseif num == 2 then
            							atrModRef = getDES();
            						elseif num == 3 then
            							atrModRef = getCON();
            						elseif num == 4 then
            							atrModRef = getINT();
            						elseif num == 5 then
            							atrModRef = getSAB();
            						elseif num == 6 then
            							atrModRef = getCAR();
            						end;
            
            						num = tonumber(sheet.atrTrVon) or 5;
            
            						if num == 1 then
            							atrModVon = getFOR();
            						elseif num == 2 then
            							atrModVon = getDES();
            						elseif num == 3 then
            							atrModVon = getCON();
            						elseif num == 4 then
            							atrModVon = getINT();
            						elseif num == 5 then
            							atrModVon = getSAB();
            						elseif num == 6 then
            							atrModVon = getCAR();
            						end;
            
            						sheet.atrModFort = atrModFort;
            						sheet.atrModRef = atrModRef;
            						sheet.atrModVon = atrModVon;
            					end;
        end, obj);

    obj._e_event53 = obj.TrBut:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popResistencia");
            				
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("rightCenter", self.TrBut);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup de resistencias para exibir");
            					end;
        end, obj);

    obj._e_event54 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event55 = obj.button15:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque1a, sheet.ataque1b, sheet.ataque1c, sheet.ataque1d, sheet.ataque1e, sheet.ataque1f, sheet.ataque1g, sheet.ataque1h};
            					decisivo = tonumber(string.sub(sheet.decisivo1, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano1);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico1);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome1;
            					municao = tonumber(sheet.municao1);
            					if armamento==nil then
            						armamento = sheet.arma1;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao1 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event56 = obj.button16:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano1);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome1;
            					if armamento==nil then
            						armamento = sheet.arma1;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event57 = obj.button17:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico1);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome1;
            					if armamento==nil then
            						armamento = sheet.arma1;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event58 = obj.button18:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque2a, sheet.ataque2b, sheet.ataque2c, sheet.ataque2d, sheet.ataque2e, sheet.ataque2f, sheet.ataque2g, sheet.ataque2h};
            					decisivo = tonumber(string.sub(sheet.decisivo2, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano2);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico2);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome2;
            					municao = tonumber(sheet.municao2);
            					if armamento==nil then
            						armamento = sheet.arma2;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao2 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event59 = obj.button19:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano2);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome2;
            					if armamento==nil then
            						armamento = sheet.arma2;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event60 = obj.button20:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico2);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome2;
            					if armamento==nil then
            						armamento = sheet.arma2;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event61 = obj.button21:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque3a, sheet.ataque3b, sheet.ataque3c, sheet.ataque3d, sheet.ataque3e, sheet.ataque3f, sheet.ataque3g, sheet.ataque3h};
            					decisivo = tonumber(string.sub(sheet.decisivo3, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano3);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico3);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome3;
            					municao = tonumber(sheet.municao3);
            					if armamento==nil then
            						armamento = sheet.arma3;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao3 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event62 = obj.button22:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano3);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome3;
            					if armamento==nil then
            						armamento = sheet.arma3;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event63 = obj.button23:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico3);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome3;
            					if armamento==nil then
            						armamento = sheet.arma3;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event64 = obj.button24:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque4a, sheet.ataque4b, sheet.ataque4c, sheet.ataque4d, sheet.ataque4e, sheet.ataque4f, sheet.ataque4g, sheet.ataque4h};
            					decisivo = tonumber(string.sub(sheet.decisivo4, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano4);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico4);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome4;
            					municao = tonumber(sheet.municao4);
            					if armamento==nil then
            						armamento = sheet.arma4;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao4 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event65 = obj.button25:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano4);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome4;
            					if armamento==nil then
            						armamento = sheet.arma4;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event66 = obj.button26:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico4);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome4;
            					if armamento==nil then
            						armamento = sheet.arma4;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event67 = obj.button27:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque5a, sheet.ataque5b, sheet.ataque5c, sheet.ataque5d, sheet.ataque5e, sheet.ataque5f, sheet.ataque5g, sheet.ataque5h};
            					decisivo = tonumber(string.sub(sheet.decisivo5, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano5);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico5);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome5;
            					municao = tonumber(sheet.municao5);
            					if armamento==nil then
            						armamento = sheet.arma5;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao5 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event68 = obj.button28:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano5);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome5;
            					if armamento==nil then
            						armamento = sheet.arma5;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event69 = obj.button29:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico5);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome5;
            					if armamento==nil then
            						armamento = sheet.arma5;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event70 = obj.button30:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque6a, sheet.ataque6b, sheet.ataque6c, sheet.ataque6d, sheet.ataque6e, sheet.ataque6f, sheet.ataque6g, sheet.ataque6h};
            					decisivo = tonumber(string.sub(sheet.decisivo6, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano6);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico6);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome6;
            					municao = tonumber(sheet.municao6);
            					if armamento==nil then
            						armamento = sheet.arma6;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao6 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event71 = obj.button31:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano6);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome6;
            					if armamento==nil then
            						armamento = sheet.arma6;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event72 = obj.button32:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico6);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome6;
            					if armamento==nil then
            						armamento = sheet.arma6;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event73 = obj.button33:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque7a, sheet.ataque7b, sheet.ataque7c, sheet.ataque7d, sheet.ataque7e, sheet.ataque7f, sheet.ataque7g, sheet.ataque7h};
            					decisivo = tonumber(string.sub(sheet.decisivo7, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano7);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico7);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome7;
            					municao = tonumber(sheet.municao7);
            					if armamento==nil then
            						armamento = sheet.arma7;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao7 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event74 = obj.button34:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano7);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome7;
            					if armamento==nil then
            						armamento = sheet.arma7;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event75 = obj.button35:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico7);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome7;
            					if armamento==nil then
            						armamento = sheet.arma7;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event76 = obj.button36:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque8a, sheet.ataque8b, sheet.ataque8c, sheet.ataque8d, sheet.ataque8e, sheet.ataque8f, sheet.ataque8g, sheet.ataque8h};
            					decisivo = tonumber(string.sub(sheet.decisivo8, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano8);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico8);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome8;
            					municao = tonumber(sheet.municao8);
            					if armamento==nil then
            						armamento = sheet.arma8;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao8 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event77 = obj.button37:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano8);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome8;
            					if armamento==nil then
            						armamento = sheet.arma8;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event78 = obj.button38:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico8);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome8;
            					if armamento==nil then
            						armamento = sheet.arma8;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event79 = obj.button39:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque9a, sheet.ataque9b, sheet.ataque9c, sheet.ataque9d, sheet.ataque9e, sheet.ataque9f, sheet.ataque9g, sheet.ataque9h};
            					decisivo = tonumber(string.sub(sheet.decisivo9, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano9);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico9);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome9;
            					municao = tonumber(sheet.municao9);
            					if armamento==nil then
            						armamento = sheet.arma9;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao9 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event80 = obj.button40:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano9);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome9;
            					if armamento==nil then
            						armamento = sheet.arma9;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event81 = obj.button41:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico9);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome9;
            					if armamento==nil then
            						armamento = sheet.arma9;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event82 = obj.button42:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque10a, sheet.ataque10b, sheet.ataque10c, sheet.ataque10d, sheet.ataque10e, sheet.ataque10f, sheet.ataque10g, sheet.ataque10h};
            					decisivo = tonumber(string.sub(sheet.decisivo10, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano10);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico10);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome10;
            					municao = tonumber(sheet.municao10);
            					if armamento==nil then
            						armamento = sheet.arma10;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao10 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event83 = obj.button43:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano10);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome10;
            					if armamento==nil then
            						armamento = sheet.arma10;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event84 = obj.button44:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico10);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome10;
            					if armamento==nil then
            						armamento = sheet.arma10;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event85 = obj.button45:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque11a, sheet.ataque11b, sheet.ataque11c, sheet.ataque11d, sheet.ataque11e, sheet.ataque11f, sheet.ataque11g, sheet.ataque11h};
            					decisivo = tonumber(string.sub(sheet.decisivo11, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano11);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico11);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome11;
            					municao = tonumber(sheet.municao11);
            					if armamento==nil then
            						armamento = sheet.arma11;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao11 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event86 = obj.button46:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano11);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome11;
            					if armamento==nil then
            						armamento = sheet.arma11;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event87 = obj.button47:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico11);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome11;
            					if armamento==nil then
            						armamento = sheet.arma11;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event88 = obj.button48:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque12a, sheet.ataque12b, sheet.ataque12c, sheet.ataque12d, sheet.ataque12e, sheet.ataque12f, sheet.ataque12g, sheet.ataque12h};
            					decisivo = tonumber(string.sub(sheet.decisivo12, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano12);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico12);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome12;
            					municao = tonumber(sheet.municao12);
            					if armamento==nil then
            						armamento = sheet.arma12;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao12 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event89 = obj.button49:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano12);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome12;
            					if armamento==nil then
            						armamento = sheet.arma12;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event90 = obj.button50:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico12);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome12;
            					if armamento==nil then
            						armamento = sheet.arma12;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event91 = obj.button51:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque13a, sheet.ataque13b, sheet.ataque13c, sheet.ataque13d, sheet.ataque13e, sheet.ataque13f, sheet.ataque13g, sheet.ataque13h};
            					decisivo = tonumber(string.sub(sheet.decisivo13, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano13);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico13);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome13;
            					municao = tonumber(sheet.municao13);
            					if armamento==nil then
            						armamento = sheet.arma13;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao13 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event92 = obj.button52:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano13);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome13;
            					if armamento==nil then
            						armamento = sheet.arma13;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event93 = obj.button53:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico13);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome13;
            					if armamento==nil then
            						armamento = sheet.arma13;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event94 = obj.button54:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque14a, sheet.ataque14b, sheet.ataque14c, sheet.ataque14d, sheet.ataque14e, sheet.ataque14f, sheet.ataque14g, sheet.ataque14h};
            					decisivo = tonumber(string.sub(sheet.decisivo14, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano14);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico14);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome14;
            					municao = tonumber(sheet.municao14);
            					if armamento==nil then
            						armamento = sheet.arma14;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao14 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event95 = obj.button55:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano14);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome14;
            					if armamento==nil then
            						armamento = sheet.arma14;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event96 = obj.button56:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico14);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome14;
            					if armamento==nil then
            						armamento = sheet.arma14;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event97 = obj.button57:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque15a, sheet.ataque15b, sheet.ataque15c, sheet.ataque15d, sheet.ataque15e, sheet.ataque15f, sheet.ataque15g, sheet.ataque15h};
            					decisivo = tonumber(string.sub(sheet.decisivo15, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano15);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico15);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome15;
            					municao = tonumber(sheet.municao15);
            					if armamento==nil then
            						armamento = sheet.arma15;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao15 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event98 = obj.button58:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano15);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome15;
            					if armamento==nil then
            						armamento = sheet.arma15;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event99 = obj.button59:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico15);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome15;
            					if armamento==nil then
            						armamento = sheet.arma15;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event100 = obj.button60:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque16a, sheet.ataque16b, sheet.ataque16c, sheet.ataque16d, sheet.ataque16e, sheet.ataque16f, sheet.ataque16g, sheet.ataque16h};
            					decisivo = tonumber(string.sub(sheet.decisivo16, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano16);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico16);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome16;
            					municao = tonumber(sheet.municao16);
            					if armamento==nil then
            						armamento = sheet.arma16;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao16 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event101 = obj.button61:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano16);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome16;
            					if armamento==nil then
            						armamento = sheet.arma16;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event102 = obj.button62:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico16);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome16;
            					if armamento==nil then
            						armamento = sheet.arma16;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event103 = obj.button63:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque17a, sheet.ataque17b, sheet.ataque17c, sheet.ataque17d, sheet.ataque17e, sheet.ataque17f, sheet.ataque17g, sheet.ataque17h};
            					decisivo = tonumber(string.sub(sheet.decisivo17, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano17);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico17);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome17;
            					municao = tonumber(sheet.municao17);
            					if armamento==nil then
            						armamento = sheet.arma17;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao17 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event104 = obj.button64:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano17);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome17;
            					if armamento==nil then
            						armamento = sheet.arma17;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event105 = obj.button65:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico17);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome17;
            					if armamento==nil then
            						armamento = sheet.arma17;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event106 = obj.button66:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque18a, sheet.ataque18b, sheet.ataque18c, sheet.ataque18d, sheet.ataque18e, sheet.ataque18f, sheet.ataque18g, sheet.ataque18h};
            					decisivo = tonumber(string.sub(sheet.decisivo18, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano18);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico18);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome18;
            					municao = tonumber(sheet.municao18);
            					if armamento==nil then
            						armamento = sheet.arma18;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao18 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event107 = obj.button67:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano18);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome18;
            					if armamento==nil then
            						armamento = sheet.arma18;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event108 = obj.button68:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico18);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome18;
            					if armamento==nil then
            						armamento = sheet.arma18;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event109 = obj.button69:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque19a, sheet.ataque19b, sheet.ataque19c, sheet.ataque19d, sheet.ataque19e, sheet.ataque19f, sheet.ataque19g, sheet.ataque19h};
            					decisivo = tonumber(string.sub(sheet.decisivo19, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano19);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico19);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome19;
            					municao = tonumber(sheet.municao19);
            					if armamento==nil then
            						armamento = sheet.arma19;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao19 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event110 = obj.button70:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano19);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome19;
            					if armamento==nil then
            						armamento = sheet.arma19;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event111 = obj.button71:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico19);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome19;
            					if armamento==nil then
            						armamento = sheet.arma19;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event112 = obj.button72:addEventListener("onClick",
        function (_)
            i = 1;
            					max = 1;
            					danoAlvo1 = 0;
            					danoAlvo2 = 0;
            					danoAlvo3 = 0;
            					danoAlvo4 = 0;
            					danoAlvo5 = 0;
            					fimRolagem = false;
            					
            					array = {sheet.ataque20a, sheet.ataque20b, sheet.ataque20c, sheet.ataque20d, sheet.ataque20e, sheet.ataque20f, sheet.ataque20g, sheet.ataque20h};
            					decisivo = tonumber(string.sub(sheet.decisivo20, 1, 2));
            					
            					dano = Firecast.interpretarRolagem(sheet.dano20);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					danoCritico = Firecast.interpretarRolagem(sheet.danoCritico20);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					armamento = sheet.nome20;
            					municao = tonumber(sheet.municao20);
            					if armamento==nil then
            						armamento = sheet.arma20;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						while array[max]~=nil do
            						max = max + 1;
            					end;
            					
            					local mod = tonumber(array[1]);
            					if mod~=nil then
            						rolagem = Firecast.interpretarRolagem("1d20 + " .. mod);
            						if sheet.buffAtaque ~= nil then
            							rolagem = rolagem:concatenar(sheet.buffAtaque);
            						end;
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque " .. i .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"), 
            							function (rolado)
            								pos(rolado)
            							end);
            						if municao~=nil then
            							sheet.municao20 = municao-max+1;
            						end;
            					end;
        end, obj);

    obj._e_event113 = obj.button73:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local dano = Firecast.interpretarRolagem(sheet.dano20);
            					if sheet.buffDano ~= nil then
            						dano = dano:concatenar(sheet.buffDano);
            					end;
            					
            					local armamento = sheet.nome20;
            					if armamento==nil then
            						armamento = sheet.arma20;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(dano, "Dano" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event114 = obj.button74:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					local danoCritico = Firecast.interpretarRolagem(sheet.danoCritico20);
            					if sheet.buffDanoCritico ~= nil then
            						danoCritico = danoCritico:concatenar(sheet.buffDanoCritico);
            					end;
            					
            					local armamento = sheet.nome20;
            					if armamento==nil then
            						armamento = sheet.arma20;
            					end;
            					
            					mesaDoPersonagem.activeChat:rolarDados(danoCritico, "Dano Critico" .. " com " .. armamento .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event115 = obj.button75:addEventListener("onClick",
        function (_)
            self.rclListaDosAtaques:append();
        end, obj);

    obj._e_event116 = obj.rclListaDosAtaques:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosAtaques.selectedNode;
            				self.boxDetalhesDoAtaque.node = node;
            				self.boxDetalhesDoAtaque.visible = (node ~= nil);
        end, obj);

    obj._e_event117 = obj.rclListaDosAtaques:addEventListener("onEndEnumeration",
        function (_)
            if self.rclListaDosAtaques.selectedNode == nil and sheet ~= nil then
            					local nodes = NDB.getChildNodes(sheet.campoDosAtaques);               
            					if #nodes > 0 then
            						self.rclListaDosAtaques.selectedNode = nodes[1];
            					end;
            				end;
        end, obj);

    obj._e_event118 = obj.button76:addEventListener("onClick",
        function (_)
            self.rclListaDeArmas:append();
        end, obj);

    obj._e_event119 = obj.button77:addEventListener("onClick",
        function (_)
            if sheet==nil then
            							return;
            						end;
            						if rolando then
            							return;
            						end;
            						rolando = true;
            						
            						local weapons = NDB.getChildNodes(self.boxDetalhesDoAtaque.node.campoDeArmas);
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						local personagem = sheet.nome or "personagem";
            
            						--limpando variaveis do ultimo ataque
            						dadoAtaques = {};
            						resultadoAtaques = {};
            						ataquesFeitos = 0;
            						multMunicao = 0;
            						ataqueID=1;
            						weaponID=1;
            
            						numeroAtaques = 0;
            						for i=1, #weapons, 1 do
            							numeroAtaques = numeroAtaques + weapons[i].numAtaques;
            
            							if weapons[i].municao~= nil then
            								local municao = tonumber(weapons[i].municao) or 0;
            								local multMunicao = tonumber(weapons[i].multMunicao) or 0;
            								if numeroAtaques > municao then
            									weapons[i].municao = 0;
            									mesaDoPersonagem.activeChat:enviarMensagem("Esta arma possui apenas " .. municao .. " das " .. numeroAtaques .. " munições necessarias para atacar.");
            								else
            									weapons[i].municao = municao - numeroAtaques - multMunicao;
            								end;
            							end;
            						end;
            
            						--preparando ataque
            						local acertos = weapons[weaponID].acertos;
            						local armamento = weapons[weaponID].nomeAtaque or "arma";
            
            						local rolagem = Firecast.interpretarRolagem("1d20+" .. acertos[ataqueID]);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Ataque #" .. ataqueID .. " com " .. armamento .. " de " .. personagem, 
            							function (rolado)
            								proximoAtaque(rolado)
            						end);
        end, obj);

    obj._e_event120 = obj.button78:addEventListener("onClick",
        function (_)
            rolando =false;
        end, obj);

    obj._e_event121 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia);
        end, obj);

    obj._e_event122 = obj.button79:addEventListener("onClick",
        function (_)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event123 = obj.button80:addEventListener("onClick",
        function (_)
            dndSkills();
        end, obj);

    obj._e_event124 = obj.dataLink45:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local rcl = self:findControlByName("rclListaDosTalentos");
            						if rcl~= nil then
            							rcl:sort();
            						end;
            						rcl = self:findControlByName("rclListaDosOutros");
            						if rcl~= nil then
            							rcl:sort();
            						end;
            						rcl = self:findControlByName("rclListaDasCaracteristicasClasse");
            						if rcl~= nil then
            							rcl:sort();
            						end;
        end, obj);

    obj._e_event125 = obj.rclListaDosTalentos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event126 = obj.rclListaDosOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event127 = obj.rclListaDasCaracteristicasClasse:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event128 = obj.classeBBA:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					if sheet.classeBBA == "0" then
            						self.classeBBA.hint = "BBA = 1/2 do NEP e sabe usar todas armas simples e armaduras leves.";
            					elseif sheet.classeBBA == "1" then
            						self.classeBBA.hint = "BBA = 3/4 do NEP e sabe usar todas armas simples, armaduras até médias e escudos (menos de corpo).";
            					elseif sheet.classeBBA == "2" then
            						self.classeBBA.hint = "BBA = NEP e sabe usar todas armas simples e comuns, armaduras até pesada e escudos.";
            					else
            						self.classeBBA.hint = "";
            					end;
        end, obj);

    obj._e_event129 = obj.classeBBF:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					if sheet.classeBBF == "0" then
            						self.classeBBF.hint = "BBF = 1/3 do NEP.";
            					elseif sheet.classeBBF == "1" then
            						self.classeBBF.hint = "BBF = 2 + 1/2 do NEP.";
            					else
            						self.classeBBF.hint = "";
            					end;
        end, obj);

    obj._e_event130 = obj.classeBBR:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					if sheet.classeBBR == "0" then
            						self.classeBBR.hint = "BBR = 1/3 do NEP.";
            					elseif sheet.classeBBR == "1" then
            						self.classeBBR.hint = "BBR = 2 + 1/2 do NEP.";
            					else
            						self.classeBBR.hint = "";
            					end;
        end, obj);

    obj._e_event131 = obj.classeBBV:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					if sheet.classeBBV == "0" then
            						self.classeBBV.hint = "BBV = 1/3 do NEP.";
            					elseif sheet.classeBBV == "1" then
            						self.classeBBV.hint = "BBV = 2 + 1/2 do NEP.";
            					else
            						self.classeBBV.hint = "";
            					end;
        end, obj);

    obj._e_event132 = obj.classePericia:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					if sheet.classePericia == "0" then
            						self.classePericia.hint = "2 + 1 + modificador de inteligência por nível, 7 perícias de classe.";
            					elseif sheet.classePericia == "1" then
            						self.classePericia.hint = "4 + 1 + modificador de inteligência por nível, 13 perícias de classe.";
            					elseif sheet.classePericia == "2" then
            						self.classePericia.hint = "6 + 1 + modificador de inteligência por nível, 18 perícias de classe.";
            					elseif sheet.classePericia == "3" then
            						self.classePericia.hint = "8 + 1 + modificador de inteligência por nível, 22 perícias de classe.";
            					else
            						self.classePericia.hint = "";
            					end;
        end, obj);

    obj._e_event133 = obj.classeDVs:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					if sheet.classeDVs == "0" then
            						self.classeDVs.hint = "1d6 + modificador de constituição por nível.";
            					elseif sheet.classeDVs == "1" then
            						self.classeDVs.hint = "1d8 + modificador de constituição por nível.";
            					elseif sheet.classeDVs == "2" then
            						self.classeDVs.hint = "1d10 + modificador de constituição por nível.";
            					elseif sheet.classeDVs == "3" then
            						self.classeDVs.hint = "1d12 + modificador de constituição por nível.";
            					else
            						self.classeDVs.hint = "";
            					end;
        end, obj);

    obj._e_event134 = obj.dataLink46:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					sheet.classePontos = 	(tonumber(sheet.classeBBA) or 0) + 
            											(tonumber(sheet.classeBBF) or 0) + 
            											(tonumber(sheet.classeBBR) or 0) + 
            											(tonumber(sheet.classeBBV) or 0) + 
            											(tonumber(sheet.classePericia) or 0) + 
            											(tonumber(sheet.classeDVs) or 0);
        end, obj);

    obj._e_event135 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nep = (tonumber(sheet.nep) or 1);
            
            					if sheet.classeBBA == "0" then
            						sheet.bba = math.floor(nep/2);
            					elseif sheet.classeBBA == "1" then
            						sheet.bba = math.floor(nep*3/4);
            					elseif sheet.classeBBA == "2" then
            						sheet.bba = nep;
            					end;
            
            					if sheet.classeBBF == "0" then
            						sheet.baseFort = math.floor(nep/3);
            					elseif sheet.classeBBF == "1" then
            						sheet.baseFort = 2 + math.floor(nep/2);
            					end;
            
            					if sheet.classeBBR == "0" then
            						sheet.baseRef = math.floor(nep/3);
            					elseif sheet.classeBBR == "1" then
            						sheet.baseRef = 2 + math.floor(nep/2);
            					end;
            
            					if sheet.classeBBV == "0" then
            						sheet.baseVon = math.floor(nep/3);
            					elseif sheet.classeBBV == "1" then
            						sheet.baseVon = 2 + math.floor(nep/2);
            					end;
        end, obj);

    obj._e_event136 = obj.button81:addEventListener("onClick",
        function (_)
            self.rclListaDosTalentos:append();
        end, obj);

    obj._e_event137 = obj.button82:addEventListener("onClick",
        function (_)
            self.rclListaDosOutros:append();
        end, obj);

    obj._e_event138 = obj.button83:addEventListener("onClick",
        function (_)
            self.rclListaDasCaracteristicasClasse:append();
        end, obj);

    obj._e_event139 = obj.button84:addEventListener("onClick",
        function (_)
            self.rclListaDasDobras:append();
        end, obj);

    obj._e_event140 = obj.rclListaDasDobras:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    obj._e_event141 = obj.comboBox5:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					if sheet.chaveDobra == "1" then
            						sheet.atributoDobra = tonumber(sheet.efetFor) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModFor) or 0;
            					elseif sheet.chaveDobra == "2" then
            						sheet.atributoDobra = tonumber(sheet.efetDes) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModDes) or 0;
            					elseif sheet.chaveDobra == "3" then
            						sheet.atributoDobra = tonumber(sheet.efetCon) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModCon) or 0;
            					elseif sheet.chaveDobra == "4" then
            						sheet.atributoDobra = tonumber(sheet.efetInt) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModInt) or 0;
            					elseif sheet.chaveDobra == "5" then
            						sheet.atributoDobra = tonumber(sheet.efetSab) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModSab) or 0;
            					elseif sheet.chaveDobra == "6" then
            						sheet.atributoDobra = tonumber(sheet.efetCar) or 0;
            						sheet.atributoDobraMod = tonumber(sheet.efetModCar) or 0;
            					else
            						sheet.atributoDobra = "";
            						sheet.atributoDobraMod = "";
            					end;
        end, obj);

    obj._e_event142 = obj.button85:addEventListener("onClick",
        function (_)
            rollTest();
        end, obj);

    obj._e_event143 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					sheet.capacidadeDobra = (tonumber(sheet.nep) or 0) + 
            											(tonumber(sheet.atributoDobraMod) or 0) + 
            											(tonumber(sheet.capacidadeDobraAdicional) or 0) + 
            											(tonumber(sheet.capacidadeDobraOutros) or 0);
            
            					sheet.nivelDobrador = (tonumber(sheet.nep) or 0) + 
            											(tonumber(sheet.nivelDobradorAdicional) or 0) + 
            											(tonumber(sheet.nivelDobradorOutros) or 0);
            
            					sheet.testeDobra = 	(tonumber(sheet.nep) or 0) + 
            										(tonumber(sheet.atributoDobraMod) or 0) + 
            										(tonumber(sheet.testeDobraAdicional) or 0) + 
            										(tonumber(sheet.testeDobraOutros) or 0);
        end, obj);

    obj._e_event144 = obj.button86:addEventListener("onClick",
        function (_)
            self.rclListaDasTecnicas:append();
        end, obj);

    obj._e_event145 = obj.rclListaDasTecnicas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    obj._e_event146 = obj.button87:addEventListener("onClick",
        function (_)
            self.rclListaDasTecnicasAvancadas:append();
        end, obj);

    obj._e_event147 = obj.rclListaDasTecnicasAvancadas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nome) or 0) - (tonumber(nodeB.nome) or 0));
        end, obj);

    obj._e_event148 = obj.button88:addEventListener("onClick",
        function (_)
            self.rclListaDasArmas:append();
        end, obj);

    obj._e_event149 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            
            					-- Calculando todos gastos
            					local mod = 0;
            					mod = (getNumber(sheet.precoCabeca) or 0) +
            								(getNumber(sheet.precoOlhos) or 0) +
            								(getNumber(sheet.precoPescoco) or 0) +
            								(getNumber(sheet.precoOmbros) or 0) +
            								(getNumber(sheet.precoTorso) or 0) +
            								(getNumber(sheet.precoCorpo) or 0) +
            								(getNumber(sheet.precoPunhos) or 0) +
            								(getNumber(sheet.precoCintura) or 0) +
            								(getNumber(sheet.precoMaos) or 0) +
            								(getNumber(sheet.precoDedosI) or 0) +
            								(getNumber(sheet.precoDesdosII) or 0) +
            								(getNumber(sheet.precoPes) or 0) +
            								(getNumber(sheet.precoArmas) or 0) +
            								(getNumber(sheet.precoMochila) or 0) +
            								(getNumber(sheet.precoPermanencias) or 0) +
            								(getNumber(sheet.precoLivres) or 0) +
            								(getNumber(sheet.precoOutros) or 0) +
            								(getNumber(sheet.precoMunicoes) or 0) +
            								(getNumber(sheet.precoBolsos) or 0) +
            								(getNumber(sheet.precoImoveis) or 0) +
            								(getNumber(sheet.precoInventorioComp) or 0);
            
            					-- Calculando dinheiro restante
            					local total = getNumber(sheet.dinheiroTotal) or 0;
            					local restante = total - mod;
            					--showMessage(total .. " | " .. mod .. " | " .. restante);
            
            					-- Formatando texto
            					mod = string.gsub(mod, "%.", "_");
            					while true do  
            						mod, k = string.gsub(mod, "^(-?%d+)(%d%d%d)", '%1,%2')
            						if (k==0) then
            							break
            							end
            						end
            					mod = string.gsub(mod, ",", ".");
            					mod = string.gsub(mod, "_", ",");
            					sheet.gastos = mod;
            
            					restante = string.gsub(restante, "%.", "_");
            					while true do  
            						restante, k = string.gsub(restante, "^(-?%d+)(%d%d%d)", '%1,%2')
            						if (k==0) then
            							break
            							end
            						end
            					restante = string.gsub(restante, ",", ".");
            					restante = string.gsub(restante, "_", ",");
            					sheet.dinheiroRestante = restante;
            				end;
        end, obj);

    obj._e_event150 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            
            					local mod1 = sheet.cargaPesada;
            					if mod1==nil then
            						mod1 = "0";
            					end
            					mod1 = string.gsub(mod1, "Kg", "");
            					mod1 = string.gsub(mod1, "K", "");
            					mod1 = string.gsub(mod1, "k", "");
            					mod1 = string.gsub(mod1, "G", "");
            					mod1 = string.gsub(mod1, "g", "");
            					mod1 = string.gsub(mod1, ",", ".");
            					local mod = (tonumber(mod1) or 0);
            					sheet.cargaErguer = mod .. "Kg";
            					sheet.cargaLevantar = (2*mod) .. "Kg";
            					sheet.cargaEmpurrar = (5*mod) .. "Kg";
            				end;
        end, obj);

    obj._e_event151 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~=nil then
            					local mod = 0;
            					mod = (getNumber(sheet.pesoCabeca) or 0) +
            								(getNumber(sheet.pesoOlhos) or 0) +
            								(getNumber(sheet.pesoPescoco) or 0) +
            								(getNumber(sheet.pesoOmbros) or 0) +
            								(getNumber(sheet.pesoTorso) or 0) +
            								(getNumber(sheet.pesoCorpo) or 0) +
            								(getNumber(sheet.pesoPunhos) or 0) +
            								(getNumber(sheet.pesoCintura) or 0) +
            								(getNumber(sheet.pesoMaos) or 0) +
            								(getNumber(sheet.pesoDedosI) or 0) +
            								(getNumber(sheet.pesoDesdosII) or 0) +
            								(getNumber(sheet.pesoPes) or 0) +
            								(getNumber(sheet.pesoArmas) or 0) +
            								(getNumber(sheet.pesoMochila) or 0) +
            								(getNumber(sheet.pesoPermanencias) or 0) +
            								(getNumber(sheet.pesoLivres) or 0) +
            								(getNumber(sheet.pesoOutros) or 0) +
            								(getNumber(sheet.pesoMunicoes) or 0) +
            								(getNumber(sheet.pesoBolsos) or 0) +
            								(getNumber(sheet.pesoImoveis) or 0);
            					while true do  
            						mod, k = string.gsub(mod, "^(-?%d+)(%d%d%d)", '%1,%2')
            						if (k==0) then
            							break
            							end
            						end
            					mod = string.gsub(mod, ",", ".");
            					sheet.cargaAtual = mod .. "Kg";
            				end;
        end, obj);

    obj._e_event152 = obj.button89:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            						local rolagem = Firecast.interpretarRolagem("1d20 + " .. (node.iniciativaComp or 0));
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de iniciativa de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event153 = obj.button90:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            						local rolagem = Firecast.interpretarRolagem("1d20 + " .. (node.agarrarComp or 0));
            						local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de agarrar de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event154 = obj.button91:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.forModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de força de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event155 = obj.edit594:addEventListener("onChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.forComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.forModComp = mod;
            					end;
        end, obj);

    obj._e_event156 = obj.button92:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.desModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de destreza de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event157 = obj.edit596:addEventListener("onChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.desComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.desModComp = mod;
            					end;
        end, obj);

    obj._e_event158 = obj.button93:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.conModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de constituição de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event159 = obj.edit598:addEventListener("onChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.conComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.conModComp = mod;
            					end;
        end, obj);

    obj._e_event160 = obj.button94:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.intModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de inteligência de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event161 = obj.edit600:addEventListener("onChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.intComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.intModComp = mod;
            					end;
        end, obj);

    obj._e_event162 = obj.button95:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.sabModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de sabedoria de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event163 = obj.edit602:addEventListener("onChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.sabComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.sabModComp = mod;
            					end;
        end, obj);

    obj._e_event164 = obj.button96:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.carModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de carisma de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event165 = obj.edit604:addEventListener("onChange",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						local mod = (tonumber(node.carComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.carModComp = mod;
            					end;
        end, obj);

    obj._e_event166 = obj.button97:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.fortComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de fortitude de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event167 = obj.button98:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.refComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de reflexos de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event168 = obj.button99:addEventListener("onClick",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.vonComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = Firecast.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de vontade de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event169 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nodes = NDB.getChildNodes(sheet.campoDosCompanheiros);   
            					local total = 0;
            					for i=1, #nodes, 1 do
            						total = total + (getNumber(nodes[i].precoInventorioComp) or 0);
            					end
            					sheet.precoInventorioComp = total;
        end, obj);

    obj._e_event170 = obj.button100:addEventListener("onClick",
        function (_)
            local macro = self.boxDetalhesDoCompanheiro.node.macro;
            						if macro~=nil then
            							local macros = lines(macro);
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            							for i=1, #macros, 1 do
            								mesaDoPersonagem.activeChat:enviarMensagem(macros[i]);
            							end;
            						end;
        end, obj);

    obj._e_event171 = obj.image22:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", self.rclListaDosCompanheiros.selectedNode.avatarComp);
        end, obj);

    obj._e_event172 = obj.button101:addEventListener("onClick",
        function (_)
            self.rclListaDosCompanheiros:append();
        end, obj);

    obj._e_event173 = obj.rclListaDosCompanheiros:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosCompanheiros.selectedNode;
            				self.boxDetalhesDoCompanheiro.node = node;
            				self.boxDetalhesDoCompanheiro.visible = (node ~= nil);
        end, obj);

    obj._e_event174 = obj.rclListaDosCompanheiros:addEventListener("onEndEnumeration",
        function (_)
            if self.rclListaDosCompanheiros.selectedNode == nil and sheet ~= nil then
            					local nodes = NDB.getChildNodes(sheet.campoDosCompanheiros);               
            					if #nodes > 0 then
            						self.rclListaDosCompanheiros.selectedNode = nodes[1];
            					end;
            				end;
        end, obj);

    obj._e_event175 = obj.dataLink53:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~=nil then
            					local str = tonumber(sheet.efetFor) or 1;
            					local size = tonumber(sheet.tamanho) or 0;
            					local quad = sheet.quadrupede;
            
            					local mult = 1;
            					local mod1 = 0;
            					local mod2 = 0;
            
            					if size == -4 then
            						if quad then
            							mult = 1 / 4;
            						else
            							mult = 1 / 8;
            						end;
            						mod1 = 8;
            						mod2 = 16;
            					elseif size == -3 then
            						if quad then
            							mult = 1 / 2;
            						else
            							mult = 1 / 4;
            						end;
            						mod1 = 4;
            						mod2 = 12;
            					elseif size == -2 then
            						if quad then
            							mult = 3 / 4;
            						else
            							mult = 1 / 2;
            						end;
            						mod1 = 2;
            						mod2 = 8;
            					elseif size == -1 then
            						if quad then
            							mult = 1;
            						else
            							mult = 3 / 4;
            						end;
            						mod1 = 1;
            						mod2 = 4;
            					elseif size == 0 then
            						if quad then
            							mult = 1.5;
            						else
            							mult = 1;
            						end;
            					elseif size == 1 then
            						if quad then
            							mult = 3;
            						else
            							mult = 2;
            						end;
            						mod1 = -1;
            						mod2 = -4;
            					elseif size == 2 then
            						if quad then
            							mult = 6;
            						else
            							mult = 4;
            						end;
            						mod1 = -2;
            						mod2 = -8;
            					elseif size == 3 then
            						if quad then
            							mult = 12;
            						else
            							mult = 8;
            						end;
            						mod1 = -4;
            						mod2 = -12;
            					elseif size == 4 then
            						if quad then
            							mult = 24;
            						else
            							mult = 16;
            						end;
            						mod1 = -8;
            						mod2 = -16;
            					end;
            
            					while str > 29 do
            						mult = mult * 4;
            						str = str - 10;
            					end;
            
            					if str < 1 then
            						str = 1;
            					end;
            
            					local load = NDB.load("loads.xml");
            
            					local light = (load.light[str] * mult);
            					local medium = (load.medium[str] * mult);
            					local heavy = (load.heavy[str] * mult);
            
            					sheet.cargaLeve = light .. "Kg";
            					sheet.cargaMedia = medium .. "Kg";
            					sheet.cargaPesada = heavy .. "Kg";
            
            					sheet.agarrarTam = 0 - mod2;
            					sheet.tamanhoCa = mod1;
            				end;
        end, obj);

    obj._e_event176 = obj.button102:addEventListener("onClick",
        function (_)
            System.setClipboardText(sheet.historia);
        end, obj);

    obj._e_event177 = obj.button103:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Avatar%20d20/README.md')
        end, obj);

    obj._e_event178 = obj.button104:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Avatar%20d20/output/Ficha%20Avatar%20d20.rpk?raw=true')
        end, obj);

    obj._e_event179 = obj.button105:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Avatar%20d20/__Tutorial/Ficha%20Avatar%20-%20Tutorial.docx')
        end, obj);

    obj._e_event180 = obj.button106:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://www.dropbox.com/s/h4zleo51jqq6cc8/Dobra.docx?dl=0')
        end, obj);

    obj._e_event181 = obj.button107:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event182 = obj.button108:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=149962');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
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

        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
        if self.label454 ~= nil then self.label454:destroy(); self.label454 = nil; end;
        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.label327 ~= nil then self.label327:destroy(); self.label327 = nil; end;
        if self.rectangle148 ~= nil then self.rectangle148:destroy(); self.rectangle148 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label338 ~= nil then self.label338:destroy(); self.label338 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.label488 ~= nil then self.label488:destroy(); self.label488 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.label399 ~= nil then self.label399:destroy(); self.label399 = nil; end;
        if self.rectangle138 ~= nil then self.rectangle138:destroy(); self.rectangle138 = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.frmFichaRPGmeister1_svg ~= nil then self.frmFichaRPGmeister1_svg:destroy(); self.frmFichaRPGmeister1_svg = nil; end;
        if self.edit480 ~= nil then self.edit480:destroy(); self.edit480 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit431 ~= nil then self.edit431:destroy(); self.edit431 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit599 ~= nil then self.edit599:destroy(); self.edit599 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label331 ~= nil then self.label331:destroy(); self.label331 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.edit508 ~= nil then self.edit508:destroy(); self.edit508 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.edit462 ~= nil then self.edit462:destroy(); self.edit462 = nil; end;
        if self.edit523 ~= nil then self.edit523:destroy(); self.edit523 = nil; end;
        if self.edit570 ~= nil then self.edit570:destroy(); self.edit570 = nil; end;
        if self.label494 ~= nil then self.label494:destroy(); self.label494 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit429 ~= nil then self.edit429:destroy(); self.edit429 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.edit590 ~= nil then self.edit590:destroy(); self.edit590 = nil; end;
        if self.edit442 ~= nil then self.edit442:destroy(); self.edit442 = nil; end;
        if self.edit504 ~= nil then self.edit504:destroy(); self.edit504 = nil; end;
        if self.edit464 ~= nil then self.edit464:destroy(); self.edit464 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.edit532 ~= nil then self.edit532:destroy(); self.edit532 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.label506 ~= nil then self.label506:destroy(); self.label506 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit400 ~= nil then self.edit400:destroy(); self.edit400 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label465 ~= nil then self.label465:destroy(); self.label465 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.edit518 ~= nil then self.edit518:destroy(); self.edit518 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label307 ~= nil then self.label307:destroy(); self.label307 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.label501 ~= nil then self.label501:destroy(); self.label501 = nil; end;
        if self.label455 ~= nil then self.label455:destroy(); self.label455 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.edit465 ~= nil then self.edit465:destroy(); self.edit465 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label378 ~= nil then self.label378:destroy(); self.label378 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label489 ~= nil then self.label489:destroy(); self.label489 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.edit606 ~= nil then self.edit606:destroy(); self.edit606 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.label324 ~= nil then self.label324:destroy(); self.label324 = nil; end;
        if self.button106 ~= nil then self.button106:destroy(); self.button106 = nil; end;
        if self.label332 ~= nil then self.label332:destroy(); self.label332 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.label334 ~= nil then self.label334:destroy(); self.label334 = nil; end;
        if self.edit603 ~= nil then self.edit603:destroy(); self.edit603 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label401 ~= nil then self.label401:destroy(); self.label401 = nil; end;
        if self.label375 ~= nil then self.label375:destroy(); self.label375 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit476 ~= nil then self.edit476:destroy(); self.edit476 = nil; end;
        if self.flowPart142 ~= nil then self.flowPart142:destroy(); self.flowPart142 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.label323 ~= nil then self.label323:destroy(); self.label323 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.flowPart152 ~= nil then self.flowPart152:destroy(); self.flowPart152 = nil; end;
        if self.flowPart169 ~= nil then self.flowPart169:destroy(); self.flowPart169 = nil; end;
        if self.label315 ~= nil then self.label315:destroy(); self.label315 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.flowPart113 ~= nil then self.flowPart113:destroy(); self.flowPart113 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.label306 ~= nil then self.label306:destroy(); self.label306 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.label484 ~= nil then self.label484:destroy(); self.label484 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.rclListaDosCompanheiros ~= nil then self.rclListaDosCompanheiros:destroy(); self.rclListaDosCompanheiros = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.edit604 ~= nil then self.edit604:destroy(); self.edit604 = nil; end;
        if self.edit489 ~= nil then self.edit489:destroy(); self.edit489 = nil; end;
        if self.flowPart144 ~= nil then self.flowPart144:destroy(); self.flowPart144 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.label355 ~= nil then self.label355:destroy(); self.label355 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.rectangle158 ~= nil then self.rectangle158:destroy(); self.rectangle158 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.label482 ~= nil then self.label482:destroy(); self.label482 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.flowPart183 ~= nil then self.flowPart183:destroy(); self.flowPart183 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.tab12 ~= nil then self.tab12:destroy(); self.tab12 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit490 ~= nil then self.edit490:destroy(); self.edit490 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.label380 ~= nil then self.label380:destroy(); self.label380 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.popArma ~= nil then self.popArma:destroy(); self.popArma = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label336 ~= nil then self.label336:destroy(); self.label336 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rclListaDasCaracteristicasClasse ~= nil then self.rclListaDasCaracteristicasClasse:destroy(); self.rclListaDasCaracteristicasClasse = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label317 ~= nil then self.label317:destroy(); self.label317 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit390 ~= nil then self.edit390:destroy(); self.edit390 = nil; end;
        if self.label469 ~= nil then self.label469:destroy(); self.label469 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit620 ~= nil then self.edit620:destroy(); self.edit620 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle162 ~= nil then self.rectangle162:destroy(); self.rectangle162 = nil; end;
        if self.rectangle175 ~= nil then self.rectangle175:destroy(); self.rectangle175 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label481 ~= nil then self.label481:destroy(); self.label481 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.flowPart180 ~= nil then self.flowPart180:destroy(); self.flowPart180 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label341 ~= nil then self.label341:destroy(); self.label341 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit398 ~= nil then self.edit398:destroy(); self.edit398 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.button99 ~= nil then self.button99:destroy(); self.button99 = nil; end;
        if self.edit553 ~= nil then self.edit553:destroy(); self.edit553 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.edit581 ~= nil then self.edit581:destroy(); self.edit581 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label439 ~= nil then self.label439:destroy(); self.label439 = nil; end;
        if self.label507 ~= nil then self.label507:destroy(); self.label507 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label357 ~= nil then self.label357:destroy(); self.label357 = nil; end;
        if self.edit393 ~= nil then self.edit393:destroy(); self.edit393 = nil; end;
        if self.rectangle146 ~= nil then self.rectangle146:destroy(); self.rectangle146 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit543 ~= nil then self.edit543:destroy(); self.edit543 = nil; end;
        if self.edit547 ~= nil then self.edit547:destroy(); self.edit547 = nil; end;
        if self.label413 ~= nil then self.label413:destroy(); self.label413 = nil; end;
        if self.label298 ~= nil then self.label298:destroy(); self.label298 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.label365 ~= nil then self.label365:destroy(); self.label365 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.label434 ~= nil then self.label434:destroy(); self.label434 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.edit459 ~= nil then self.edit459:destroy(); self.edit459 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.button97 ~= nil then self.button97:destroy(); self.button97 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.edit567 ~= nil then self.edit567:destroy(); self.edit567 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.classeBBV ~= nil then self.classeBBV:destroy(); self.classeBBV = nil; end;
        if self.button102 ~= nil then self.button102:destroy(); self.button102 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.label518 ~= nil then self.label518:destroy(); self.label518 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.flowPart155 ~= nil then self.flowPart155:destroy(); self.flowPart155 = nil; end;
        if self.label517 ~= nil then self.label517:destroy(); self.label517 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.alvo4 ~= nil then self.alvo4:destroy(); self.alvo4 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit557 ~= nil then self.edit557:destroy(); self.edit557 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.label425 ~= nil then self.label425:destroy(); self.label425 = nil; end;
        if self.label512 ~= nil then self.label512:destroy(); self.label512 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit479 ~= nil then self.edit479:destroy(); self.edit479 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit530 ~= nil then self.edit530:destroy(); self.edit530 = nil; end;
        if self.edit526 ~= nil then self.edit526:destroy(); self.edit526 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.label490 ~= nil then self.label490:destroy(); self.label490 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit397 ~= nil then self.edit397:destroy(); self.edit397 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label301 ~= nil then self.label301:destroy(); self.label301 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.edit540 ~= nil then self.edit540:destroy(); self.edit540 = nil; end;
        if self.rectangle140 ~= nil then self.rectangle140:destroy(); self.rectangle140 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.rectangle147 ~= nil then self.rectangle147:destroy(); self.rectangle147 = nil; end;
        if self.popResistencia ~= nil then self.popResistencia:destroy(); self.popResistencia = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.edit582 ~= nil then self.edit582:destroy(); self.edit582 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.flowPart202 ~= nil then self.flowPart202:destroy(); self.flowPart202 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.flowPart174 ~= nil then self.flowPart174:destroy(); self.flowPart174 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.label379 ~= nil then self.label379:destroy(); self.label379 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit558 ~= nil then self.edit558:destroy(); self.edit558 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.flowPart214 ~= nil then self.flowPart214:destroy(); self.flowPart214 = nil; end;
        if self.edit449 ~= nil then self.edit449:destroy(); self.edit449 = nil; end;
        if self.flowPart197 ~= nil then self.flowPart197:destroy(); self.flowPart197 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.rectangle159 ~= nil then self.rectangle159:destroy(); self.rectangle159 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.textEditor26 ~= nil then self.textEditor26:destroy(); self.textEditor26 = nil; end;
        if self.edit515 ~= nil then self.edit515:destroy(); self.edit515 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label396 ~= nil then self.label396:destroy(); self.label396 = nil; end;
        if self.edit421 ~= nil then self.edit421:destroy(); self.edit421 = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.label345 ~= nil then self.label345:destroy(); self.label345 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label303 ~= nil then self.label303:destroy(); self.label303 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.alvo1 ~= nil then self.alvo1:destroy(); self.alvo1 = nil; end;
        if self.label457 ~= nil then self.label457:destroy(); self.label457 = nil; end;
        if self.label344 ~= nil then self.label344:destroy(); self.label344 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.edit474 ~= nil then self.edit474:destroy(); self.edit474 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.flowPart210 ~= nil then self.flowPart210:destroy(); self.flowPart210 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.rectangle152 ~= nil then self.rectangle152:destroy(); self.rectangle152 = nil; end;
        if self.classeBBR ~= nil then self.classeBBR:destroy(); self.classeBBR = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit587 ~= nil then self.edit587:destroy(); self.edit587 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.label353 ~= nil then self.label353:destroy(); self.label353 = nil; end;
        if self.label412 ~= nil then self.label412:destroy(); self.label412 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart204 ~= nil then self.flowPart204:destroy(); self.flowPart204 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.flowPart179 ~= nil then self.flowPart179:destroy(); self.flowPart179 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.rectangle154 ~= nil then self.rectangle154:destroy(); self.rectangle154 = nil; end;
        if self.edit614 ~= nil then self.edit614:destroy(); self.edit614 = nil; end;
        if self.edit522 ~= nil then self.edit522:destroy(); self.edit522 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.edit502 ~= nil then self.edit502:destroy(); self.edit502 = nil; end;
        if self.label356 ~= nil then self.label356:destroy(); self.label356 = nil; end;
        if self.label383 ~= nil then self.label383:destroy(); self.label383 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit539 ~= nil then self.edit539:destroy(); self.edit539 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.label414 ~= nil then self.label414:destroy(); self.label414 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.label400 ~= nil then self.label400:destroy(); self.label400 = nil; end;
        if self.edit408 ~= nil then self.edit408:destroy(); self.edit408 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.frmFichaRPGmeister2_svg ~= nil then self.frmFichaRPGmeister2_svg:destroy(); self.frmFichaRPGmeister2_svg = nil; end;
        if self.frmFichaRPGmeister8_svg ~= nil then self.frmFichaRPGmeister8_svg:destroy(); self.frmFichaRPGmeister8_svg = nil; end;
        if self.flowPart153 ~= nil then self.flowPart153:destroy(); self.flowPart153 = nil; end;
        if self.edit444 ~= nil then self.edit444:destroy(); self.edit444 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.rectangle177 ~= nil then self.rectangle177:destroy(); self.rectangle177 = nil; end;
        if self.edit403 ~= nil then self.edit403:destroy(); self.edit403 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit623 ~= nil then self.edit623:destroy(); self.edit623 = nil; end;
        if self.label385 ~= nil then self.label385:destroy(); self.label385 = nil; end;
        if self.flowPart167 ~= nil then self.flowPart167:destroy(); self.flowPart167 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.label314 ~= nil then self.label314:destroy(); self.label314 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit541 ~= nil then self.edit541:destroy(); self.edit541 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.flowPart134 ~= nil then self.flowPart134:destroy(); self.flowPart134 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.label521 ~= nil then self.label521:destroy(); self.label521 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.edit583 ~= nil then self.edit583:destroy(); self.edit583 = nil; end;
        if self.flowPart151 ~= nil then self.flowPart151:destroy(); self.flowPart151 = nil; end;
        if self.edit436 ~= nil then self.edit436:destroy(); self.edit436 = nil; end;
        if self.edit461 ~= nil then self.edit461:destroy(); self.edit461 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit395 ~= nil then self.edit395:destroy(); self.edit395 = nil; end;
        if self.label322 ~= nil then self.label322:destroy(); self.label322 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label427 ~= nil then self.label427:destroy(); self.label427 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.label497 ~= nil then self.label497:destroy(); self.label497 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.rclListaDasTecnicas ~= nil then self.rclListaDasTecnicas:destroy(); self.rclListaDasTecnicas = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.edit613 ~= nil then self.edit613:destroy(); self.edit613 = nil; end;
        if self.flowPart165 ~= nil then self.flowPart165:destroy(); self.flowPart165 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.flowPart184 ~= nil then self.flowPart184:destroy(); self.flowPart184 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.edit516 ~= nil then self.edit516:destroy(); self.edit516 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.edit434 ~= nil then self.edit434:destroy(); self.edit434 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.edit495 ~= nil then self.edit495:destroy(); self.edit495 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.edit396 ~= nil then self.edit396:destroy(); self.edit396 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit551 ~= nil then self.edit551:destroy(); self.edit551 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.rectangle144 ~= nil then self.rectangle144:destroy(); self.rectangle144 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.label299 ~= nil then self.label299:destroy(); self.label299 = nil; end;
        if self.flowPart181 ~= nil then self.flowPart181:destroy(); self.flowPart181 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit607 ~= nil then self.edit607:destroy(); self.edit607 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.edit580 ~= nil then self.edit580:destroy(); self.edit580 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label498 ~= nil then self.label498:destroy(); self.label498 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit571 ~= nil then self.edit571:destroy(); self.edit571 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.edit576 ~= nil then self.edit576:destroy(); self.edit576 = nil; end;
        if self.edit624 ~= nil then self.edit624:destroy(); self.edit624 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.edit445 ~= nil then self.edit445:destroy(); self.edit445 = nil; end;
        if self.flowPart178 ~= nil then self.flowPart178:destroy(); self.flowPart178 = nil; end;
        if self.edit488 ~= nil then self.edit488:destroy(); self.edit488 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.label328 ~= nil then self.label328:destroy(); self.label328 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit412 ~= nil then self.edit412:destroy(); self.edit412 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.label428 ~= nil then self.label428:destroy(); self.label428 = nil; end;
        if self.label499 ~= nil then self.label499:destroy(); self.label499 = nil; end;
        if self.label462 ~= nil then self.label462:destroy(); self.label462 = nil; end;
        if self.label478 ~= nil then self.label478:destroy(); self.label478 = nil; end;
        if self.edit413 ~= nil then self.edit413:destroy(); self.edit413 = nil; end;
        if self.rectangle172 ~= nil then self.rectangle172:destroy(); self.rectangle172 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label359 ~= nil then self.label359:destroy(); self.label359 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.rectangle153 ~= nil then self.rectangle153:destroy(); self.rectangle153 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.label446 ~= nil then self.label446:destroy(); self.label446 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.edit546 ~= nil then self.edit546:destroy(); self.edit546 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.edit472 ~= nil then self.edit472:destroy(); self.edit472 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.flowPart150 ~= nil then self.flowPart150:destroy(); self.flowPart150 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.edit452 ~= nil then self.edit452:destroy(); self.edit452 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart190 ~= nil then self.flowPart190:destroy(); self.flowPart190 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.label302 ~= nil then self.label302:destroy(); self.label302 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.alvo5 ~= nil then self.alvo5:destroy(); self.alvo5 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.frmFichaRPGmeister3_svg ~= nil then self.frmFichaRPGmeister3_svg:destroy(); self.frmFichaRPGmeister3_svg = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit460 ~= nil then self.edit460:destroy(); self.edit460 = nil; end;
        if self.label445 ~= nil then self.label445:destroy(); self.label445 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.frmDobras ~= nil then self.frmDobras:destroy(); self.frmDobras = nil; end;
        if self.edit441 ~= nil then self.edit441:destroy(); self.edit441 = nil; end;
        if self.edit622 ~= nil then self.edit622:destroy(); self.edit622 = nil; end;
        if self.edit423 ~= nil then self.edit423:destroy(); self.edit423 = nil; end;
        if self.label321 ~= nil then self.label321:destroy(); self.label321 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.popPericia ~= nil then self.popPericia:destroy(); self.popPericia = nil; end;
        if self.rectangle143 ~= nil then self.rectangle143:destroy(); self.rectangle143 = nil; end;
        if self.label486 ~= nil then self.label486:destroy(); self.label486 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit575 ~= nil then self.edit575:destroy(); self.edit575 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.edit596 ~= nil then self.edit596:destroy(); self.edit596 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit385 ~= nil then self.edit385:destroy(); self.edit385 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label502 ~= nil then self.label502:destroy(); self.label502 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.rectangle171 ~= nil then self.rectangle171:destroy(); self.rectangle171 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.flowPart209 ~= nil then self.flowPart209:destroy(); self.flowPart209 = nil; end;
        if self.label495 ~= nil then self.label495:destroy(); self.label495 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.label491 ~= nil then self.label491:destroy(); self.label491 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.rclListaDosTalentos ~= nil then self.rclListaDosTalentos:destroy(); self.rclListaDosTalentos = nil; end;
        if self.edit577 ~= nil then self.edit577:destroy(); self.edit577 = nil; end;
        if self.edit388 ~= nil then self.edit388:destroy(); self.edit388 = nil; end;
        if self.label305 ~= nil then self.label305:destroy(); self.label305 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label418 ~= nil then self.label418:destroy(); self.label418 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.edit619 ~= nil then self.edit619:destroy(); self.edit619 = nil; end;
        if self.edit435 ~= nil then self.edit435:destroy(); self.edit435 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit469 ~= nil then self.edit469:destroy(); self.edit469 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label358 ~= nil then self.label358:destroy(); self.label358 = nil; end;
        if self.edit617 ~= nil then self.edit617:destroy(); self.edit617 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label477 ~= nil then self.label477:destroy(); self.label477 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.frmFichaRPGmeister7_svg ~= nil then self.frmFichaRPGmeister7_svg:destroy(); self.frmFichaRPGmeister7_svg = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.label295 ~= nil then self.label295:destroy(); self.label295 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.edit424 ~= nil then self.edit424:destroy(); self.edit424 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit415 ~= nil then self.edit415:destroy(); self.edit415 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.edit387 ~= nil then self.edit387:destroy(); self.edit387 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.label360 ~= nil then self.label360:destroy(); self.label360 = nil; end;
        if self.edit592 ~= nil then self.edit592:destroy(); self.edit592 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.flowPart189 ~= nil then self.flowPart189:destroy(); self.flowPart189 = nil; end;
        if self.label493 ~= nil then self.label493:destroy(); self.label493 = nil; end;
        if self.tab11 ~= nil then self.tab11:destroy(); self.tab11 = nil; end;
        if self.label424 ~= nil then self.label424:destroy(); self.label424 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label471 ~= nil then self.label471:destroy(); self.label471 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.button94 ~= nil then self.button94:destroy(); self.button94 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label342 ~= nil then self.label342:destroy(); self.label342 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit512 ~= nil then self.edit512:destroy(); self.edit512 = nil; end;
        if self.label479 ~= nil then self.label479:destroy(); self.label479 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.edit531 ~= nil then self.edit531:destroy(); self.edit531 = nil; end;
        if self.label467 ~= nil then self.label467:destroy(); self.label467 = nil; end;
        if self.label371 ~= nil then self.label371:destroy(); self.label371 = nil; end;
        if self.label408 ~= nil then self.label408:destroy(); self.label408 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.edit594 ~= nil then self.edit594:destroy(); self.edit594 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowPart216 ~= nil then self.flowPart216:destroy(); self.flowPart216 = nil; end;
        if self.flowPart149 ~= nil then self.flowPart149:destroy(); self.flowPart149 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label504 ~= nil then self.label504:destroy(); self.label504 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.label309 ~= nil then self.label309:destroy(); self.label309 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit432 ~= nil then self.edit432:destroy(); self.edit432 = nil; end;
        if self.edit438 ~= nil then self.edit438:destroy(); self.edit438 = nil; end;
        if self.label442 ~= nil then self.label442:destroy(); self.label442 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.rectangle176 ~= nil then self.rectangle176:destroy(); self.rectangle176 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label297 ~= nil then self.label297:destroy(); self.label297 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.label391 ~= nil then self.label391:destroy(); self.label391 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.edit527 ~= nil then self.edit527:destroy(); self.edit527 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.label326 ~= nil then self.label326:destroy(); self.label326 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.flowPart207 ~= nil then self.flowPart207:destroy(); self.flowPart207 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.TrBut ~= nil then self.TrBut:destroy(); self.TrBut = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.edit511 ~= nil then self.edit511:destroy(); self.edit511 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.label432 ~= nil then self.label432:destroy(); self.label432 = nil; end;
        if self.edit463 ~= nil then self.edit463:destroy(); self.edit463 = nil; end;
        if self.edit450 ~= nil then self.edit450:destroy(); self.edit450 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.alvo2 ~= nil then self.alvo2:destroy(); self.alvo2 = nil; end;
        if self.flowPart166 ~= nil then self.flowPart166:destroy(); self.flowPart166 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit411 ~= nil then self.edit411:destroy(); self.edit411 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit612 ~= nil then self.edit612:destroy(); self.edit612 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.edit611 ~= nil then self.edit611:destroy(); self.edit611 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.flowPart170 ~= nil then self.flowPart170:destroy(); self.flowPart170 = nil; end;
        if self.edit422 ~= nil then self.edit422:destroy(); self.edit422 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.flowPart143 ~= nil then self.flowPart143:destroy(); self.flowPart143 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.classePericia ~= nil then self.classePericia:destroy(); self.classePericia = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.edit381 ~= nil then self.edit381:destroy(); self.edit381 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit468 ~= nil then self.edit468:destroy(); self.edit468 = nil; end;
        if self.label452 ~= nil then self.label452:destroy(); self.label452 = nil; end;
        if self.edit601 ~= nil then self.edit601:destroy(); self.edit601 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.rectangle166 ~= nil then self.rectangle166:destroy(); self.rectangle166 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label398 ~= nil then self.label398:destroy(); self.label398 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.edit485 ~= nil then self.edit485:destroy(); self.edit485 = nil; end;
        if self.flowPart186 ~= nil then self.flowPart186:destroy(); self.flowPart186 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.label438 ~= nil then self.label438:destroy(); self.label438 = nil; end;
        if self.label369 ~= nil then self.label369:destroy(); self.label369 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label513 ~= nil then self.label513:destroy(); self.label513 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit406 ~= nil then self.edit406:destroy(); self.edit406 = nil; end;
        if self.edit589 ~= nil then self.edit589:destroy(); self.edit589 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.edit455 ~= nil then self.edit455:destroy(); self.edit455 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.edit453 ~= nil then self.edit453:destroy(); self.edit453 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label346 ~= nil then self.label346:destroy(); self.label346 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.edit484 ~= nil then self.edit484:destroy(); self.edit484 = nil; end;
        if self.label316 ~= nil then self.label316:destroy(); self.label316 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.flowPart212 ~= nil then self.flowPart212:destroy(); self.flowPart212 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.flowPart201 ~= nil then self.flowPart201:destroy(); self.flowPart201 = nil; end;
        if self.flowPart164 ~= nil then self.flowPart164:destroy(); self.flowPart164 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.button103 ~= nil then self.button103:destroy(); self.button103 = nil; end;
        if self.flowPart172 ~= nil then self.flowPart172:destroy(); self.flowPart172 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.rectangle136 ~= nil then self.rectangle136:destroy(); self.rectangle136 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.edit497 ~= nil then self.edit497:destroy(); self.edit497 = nil; end;
        if self.label311 ~= nil then self.label311:destroy(); self.label311 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit548 ~= nil then self.edit548:destroy(); self.edit548 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label441 ~= nil then self.label441:destroy(); self.label441 = nil; end;
        if self.label476 ~= nil then self.label476:destroy(); self.label476 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.flowPart182 ~= nil then self.flowPart182:destroy(); self.flowPart182 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit405 ~= nil then self.edit405:destroy(); self.edit405 = nil; end;
        if self.edit486 ~= nil then self.edit486:destroy(); self.edit486 = nil; end;
        if self.label407 ~= nil then self.label407:destroy(); self.label407 = nil; end;
        if self.rectangle167 ~= nil then self.rectangle167:destroy(); self.rectangle167 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.flowPart194 ~= nil then self.flowPart194:destroy(); self.flowPart194 = nil; end;
        if self.edit621 ~= nil then self.edit621:destroy(); self.edit621 = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.edit477 ~= nil then self.edit477:destroy(); self.edit477 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit383 ~= nil then self.edit383:destroy(); self.edit383 = nil; end;
        if self.button95 ~= nil then self.button95:destroy(); self.button95 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.label392 ~= nil then self.label392:destroy(); self.label392 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit550 ~= nil then self.edit550:destroy(); self.edit550 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label511 ~= nil then self.label511:destroy(); self.label511 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.label421 ~= nil then self.label421:destroy(); self.label421 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.label451 ~= nil then self.label451:destroy(); self.label451 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.label388 ~= nil then self.label388:destroy(); self.label388 = nil; end;
        if self.edit602 ~= nil then self.edit602:destroy(); self.edit602 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.flowPart146 ~= nil then self.flowPart146:destroy(); self.flowPart146 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.rclListaDosOutros ~= nil then self.rclListaDosOutros:destroy(); self.rclListaDosOutros = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label509 ~= nil then self.label509:destroy(); self.label509 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart171 ~= nil then self.flowPart171:destroy(); self.flowPart171 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.edit392 ~= nil then self.edit392:destroy(); self.edit392 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.edit514 ~= nil then self.edit514:destroy(); self.edit514 = nil; end;
        if self.edit562 ~= nil then self.edit562:destroy(); self.edit562 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label397 ~= nil then self.label397:destroy(); self.label397 = nil; end;
        if self.label406 ~= nil then self.label406:destroy(); self.label406 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.AtrBut ~= nil then self.AtrBut:destroy(); self.AtrBut = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.label429 ~= nil then self.label429:destroy(); self.label429 = nil; end;
        if self.textEditor28 ~= nil then self.textEditor28:destroy(); self.textEditor28 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.edit471 ~= nil then self.edit471:destroy(); self.edit471 = nil; end;
        if self.edit503 ~= nil then self.edit503:destroy(); self.edit503 = nil; end;
        if self.label423 ~= nil then self.label423:destroy(); self.label423 = nil; end;
        if self.label419 ~= nil then self.label419:destroy(); self.label419 = nil; end;
        if self.edit458 ~= nil then self.edit458:destroy(); self.edit458 = nil; end;
        if self.rclListaDeArmas ~= nil then self.rclListaDeArmas:destroy(); self.rclListaDeArmas = nil; end;
        if self.label329 ~= nil then self.label329:destroy(); self.label329 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.button96 ~= nil then self.button96:destroy(); self.button96 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.label468 ~= nil then self.label468:destroy(); self.label468 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.flowPart129 ~= nil then self.flowPart129:destroy(); self.flowPart129 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label430 ~= nil then self.label430:destroy(); self.label430 = nil; end;
        if self.edit573 ~= nil then self.edit573:destroy(); self.edit573 = nil; end;
        if self.frmFichaRPGmeister4_svg ~= nil then self.frmFichaRPGmeister4_svg:destroy(); self.frmFichaRPGmeister4_svg = nil; end;
        if self.flowPart193 ~= nil then self.flowPart193:destroy(); self.flowPart193 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit568 ~= nil then self.edit568:destroy(); self.edit568 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label510 ~= nil then self.label510:destroy(); self.label510 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit457 ~= nil then self.edit457:destroy(); self.edit457 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.button93 ~= nil then self.button93:destroy(); self.button93 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label367 ~= nil then self.label367:destroy(); self.label367 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.textEditor27 ~= nil then self.textEditor27:destroy(); self.textEditor27 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.edit466 ~= nil then self.edit466:destroy(); self.edit466 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label417 ~= nil then self.label417:destroy(); self.label417 = nil; end;
        if self.caDetails ~= nil then self.caDetails:destroy(); self.caDetails = nil; end;
        if self.edit519 ~= nil then self.edit519:destroy(); self.edit519 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label386 ~= nil then self.label386:destroy(); self.label386 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit404 ~= nil then self.edit404:destroy(); self.edit404 = nil; end;
        if self.edit510 ~= nil then self.edit510:destroy(); self.edit510 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.label340 ~= nil then self.label340:destroy(); self.label340 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.edit446 ~= nil then self.edit446:destroy(); self.edit446 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.edit475 ~= nil then self.edit475:destroy(); self.edit475 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label459 ~= nil then self.label459:destroy(); self.label459 = nil; end;
        if self.label444 ~= nil then self.label444:destroy(); self.label444 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label372 ~= nil then self.label372:destroy(); self.label372 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.edit549 ~= nil then self.edit549:destroy(); self.edit549 = nil; end;
        if self.label381 ~= nil then self.label381:destroy(); self.label381 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.edit440 ~= nil then self.edit440:destroy(); self.edit440 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.rectangle156 ~= nil then self.rectangle156:destroy(); self.rectangle156 = nil; end;
        if self.edit501 ~= nil then self.edit501:destroy(); self.edit501 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.edit572 ~= nil then self.edit572:destroy(); self.edit572 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.label335 ~= nil then self.label335:destroy(); self.label335 = nil; end;
        if self.edit513 ~= nil then self.edit513:destroy(); self.edit513 = nil; end;
        if self.flowPart145 ~= nil then self.flowPart145:destroy(); self.flowPart145 = nil; end;
        if self.button108 ~= nil then self.button108:destroy(); self.button108 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label382 ~= nil then self.label382:destroy(); self.label382 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.label403 ~= nil then self.label403:destroy(); self.label403 = nil; end;
        if self.flowPart215 ~= nil then self.flowPart215:destroy(); self.flowPart215 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit419 ~= nil then self.edit419:destroy(); self.edit419 = nil; end;
        if self.flowPart199 ~= nil then self.flowPart199:destroy(); self.flowPart199 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.frmFichaRPGmeister9_svg ~= nil then self.frmFichaRPGmeister9_svg:destroy(); self.frmFichaRPGmeister9_svg = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.label420 ~= nil then self.label420:destroy(); self.label420 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.label347 ~= nil then self.label347:destroy(); self.label347 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit542 ~= nil then self.edit542:destroy(); self.edit542 = nil; end;
        if self.label440 ~= nil then self.label440:destroy(); self.label440 = nil; end;
        if self.scrollBox11 ~= nil then self.scrollBox11:destroy(); self.scrollBox11 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.edit499 ~= nil then self.edit499:destroy(); self.edit499 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.label390 ~= nil then self.label390:destroy(); self.label390 = nil; end;
        if self.edit358 ~= nil then self.edit358:destroy(); self.edit358 = nil; end;
        if self.label325 ~= nil then self.label325:destroy(); self.label325 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.edit520 ~= nil then self.edit520:destroy(); self.edit520 = nil; end;
        if self.label361 ~= nil then self.label361:destroy(); self.label361 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.edit473 ~= nil then self.edit473:destroy(); self.edit473 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.edit483 ~= nil then self.edit483:destroy(); self.edit483 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.button105 ~= nil then self.button105:destroy(); self.button105 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.label330 ~= nil then self.label330:destroy(); self.label330 = nil; end;
        if self.label339 ~= nil then self.label339:destroy(); self.label339 = nil; end;
        if self.label448 ~= nil then self.label448:destroy(); self.label448 = nil; end;
        if self.flowPart205 ~= nil then self.flowPart205:destroy(); self.flowPart205 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.popTecnica ~= nil then self.popTecnica:destroy(); self.popTecnica = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label333 ~= nil then self.label333:destroy(); self.label333 = nil; end;
        if self.edit559 ~= nil then self.edit559:destroy(); self.edit559 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.flowPart195 ~= nil then self.flowPart195:destroy(); self.flowPart195 = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.flowPart188 ~= nil then self.flowPart188:destroy(); self.flowPart188 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.edit529 ~= nil then self.edit529:destroy(); self.edit529 = nil; end;
        if self.edit389 ~= nil then self.edit389:destroy(); self.edit389 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.GrappleBt ~= nil then self.GrappleBt:destroy(); self.GrappleBt = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit439 ~= nil then self.edit439:destroy(); self.edit439 = nil; end;
        if self.label304 ~= nil then self.label304:destroy(); self.label304 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit556 ~= nil then self.edit556:destroy(); self.edit556 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.edit610 ~= nil then self.edit610:destroy(); self.edit610 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.edit500 ~= nil then self.edit500:destroy(); self.edit500 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.edit528 ~= nil then self.edit528:destroy(); self.edit528 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit561 ~= nil then self.edit561:destroy(); self.edit561 = nil; end;
        if self.boxDetalhesDoCompanheiro ~= nil then self.boxDetalhesDoCompanheiro:destroy(); self.boxDetalhesDoCompanheiro = nil; end;
        if self.edit492 ~= nil then self.edit492:destroy(); self.edit492 = nil; end;
        if self.edit544 ~= nil then self.edit544:destroy(); self.edit544 = nil; end;
        if self.popCA ~= nil then self.popCA:destroy(); self.popCA = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label458 ~= nil then self.label458:destroy(); self.label458 = nil; end;
        if self.label480 ~= nil then self.label480:destroy(); self.label480 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.flowPart198 ~= nil then self.flowPart198:destroy(); self.flowPart198 = nil; end;
        if self.flowPart187 ~= nil then self.flowPart187:destroy(); self.flowPart187 = nil; end;
        if self.edit416 ~= nil then self.edit416:destroy(); self.edit416 = nil; end;
        if self.flowPart192 ~= nil then self.flowPart192:destroy(); self.flowPart192 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.classeBBF ~= nil then self.classeBBF:destroy(); self.classeBBF = nil; end;
        if self.label496 ~= nil then self.label496:destroy(); self.label496 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.rectangle137 ~= nil then self.rectangle137:destroy(); self.rectangle137 = nil; end;
        if self.rectangle150 ~= nil then self.rectangle150:destroy(); self.rectangle150 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit382 ~= nil then self.edit382:destroy(); self.edit382 = nil; end;
        if self.edit454 ~= nil then self.edit454:destroy(); self.edit454 = nil; end;
        if self.classeDVs ~= nil then self.classeDVs:destroy(); self.classeDVs = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.label362 ~= nil then self.label362:destroy(); self.label362 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label474 ~= nil then self.label474:destroy(); self.label474 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit593 ~= nil then self.edit593:destroy(); self.edit593 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit467 ~= nil then self.edit467:destroy(); self.edit467 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.edit451 ~= nil then self.edit451:destroy(); self.edit451 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.edit391 ~= nil then self.edit391:destroy(); self.edit391 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.frmFichaRPGmeister2a_svg ~= nil then self.frmFichaRPGmeister2a_svg:destroy(); self.frmFichaRPGmeister2a_svg = nil; end;
        if self.edit402 ~= nil then self.edit402:destroy(); self.edit402 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.edit481 ~= nil then self.edit481:destroy(); self.edit481 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.rectangle164 ~= nil then self.rectangle164:destroy(); self.rectangle164 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.label318 ~= nil then self.label318:destroy(); self.label318 = nil; end;
        if self.edit428 ~= nil then self.edit428:destroy(); self.edit428 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.flowPart191 ~= nil then self.flowPart191:destroy(); self.flowPart191 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.button104 ~= nil then self.button104:destroy(); self.button104 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label492 ~= nil then self.label492:destroy(); self.label492 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label374 ~= nil then self.label374:destroy(); self.label374 = nil; end;
        if self.edit426 ~= nil then self.edit426:destroy(); self.edit426 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit384 ~= nil then self.edit384:destroy(); self.edit384 = nil; end;
        if self.edit588 ~= nil then self.edit588:destroy(); self.edit588 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit560 ~= nil then self.edit560:destroy(); self.edit560 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.label464 ~= nil then self.label464:destroy(); self.label464 = nil; end;
        if self.rectangle160 ~= nil then self.rectangle160:destroy(); self.rectangle160 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.label384 ~= nil then self.label384:destroy(); self.label384 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.label300 ~= nil then self.label300:destroy(); self.label300 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.flowPart156 ~= nil then self.flowPart156:destroy(); self.flowPart156 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.flowPart148 ~= nil then self.flowPart148:destroy(); self.flowPart148 = nil; end;
        if self.edit609 ~= nil then self.edit609:destroy(); self.edit609 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.popAtributo ~= nil then self.popAtributo:destroy(); self.popAtributo = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit536 ~= nil then self.edit536:destroy(); self.edit536 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label410 ~= nil then self.label410:destroy(); self.label410 = nil; end;
        if self.rclListaDasTecnicasAvancadas ~= nil then self.rclListaDasTecnicasAvancadas:destroy(); self.rclListaDasTecnicasAvancadas = nil; end;
        if self.label308 ~= nil then self.label308:destroy(); self.label308 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.label450 ~= nil then self.label450:destroy(); self.label450 = nil; end;
        if self.rectangle151 ~= nil then self.rectangle151:destroy(); self.rectangle151 = nil; end;
        if self.flowPart177 ~= nil then self.flowPart177:destroy(); self.flowPart177 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.rectangle161 ~= nil then self.rectangle161:destroy(); self.rectangle161 = nil; end;
        if self.edit545 ~= nil then self.edit545:destroy(); self.edit545 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.rclListaDasArmas ~= nil then self.rclListaDasArmas:destroy(); self.rclListaDasArmas = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.edit507 ~= nil then self.edit507:destroy(); self.edit507 = nil; end;
        if self.flowPart211 ~= nil then self.flowPart211:destroy(); self.flowPart211 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.label447 ~= nil then self.label447:destroy(); self.label447 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.edit399 ~= nil then self.edit399:destroy(); self.edit399 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit524 ~= nil then self.edit524:destroy(); self.edit524 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.flowPart217 ~= nil then self.flowPart217:destroy(); self.flowPart217 = nil; end;
        if self.edit579 ~= nil then self.edit579:destroy(); self.edit579 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit487 ~= nil then self.edit487:destroy(); self.edit487 = nil; end;
        if self.label475 ~= nil then self.label475:destroy(); self.label475 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.label404 ~= nil then self.label404:destroy(); self.label404 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label508 ~= nil then self.label508:destroy(); self.label508 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.label519 ~= nil then self.label519:destroy(); self.label519 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.popIdioma ~= nil then self.popIdioma:destroy(); self.popIdioma = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.flowPart200 ~= nil then self.flowPart200:destroy(); self.flowPart200 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit608 ~= nil then self.edit608:destroy(); self.edit608 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit470 ~= nil then self.edit470:destroy(); self.edit470 = nil; end;
        if self.edit578 ~= nil then self.edit578:destroy(); self.edit578 = nil; end;
        if self.edit394 ~= nil then self.edit394:destroy(); self.edit394 = nil; end;
        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.label422 ~= nil then self.label422:destroy(); self.label422 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label466 ~= nil then self.label466:destroy(); self.label466 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit430 ~= nil then self.edit430:destroy(); self.edit430 = nil; end;
        if self.label350 ~= nil then self.label350:destroy(); self.label350 = nil; end;
        if self.label520 ~= nil then self.label520:destroy(); self.label520 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.edit456 ~= nil then self.edit456:destroy(); self.edit456 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label456 ~= nil then self.label456:destroy(); self.label456 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label503 ~= nil then self.label503:destroy(); self.label503 = nil; end;
        if self.flowPart157 ~= nil then self.flowPart157:destroy(); self.flowPart157 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit386 ~= nil then self.edit386:destroy(); self.edit386 = nil; end;
        if self.label351 ~= nil then self.label351:destroy(); self.label351 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart203 ~= nil then self.flowPart203:destroy(); self.flowPart203 = nil; end;
        if self.flowPart161 ~= nil then self.flowPart161:destroy(); self.flowPart161 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.rectangle149 ~= nil then self.rectangle149:destroy(); self.rectangle149 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.edit615 ~= nil then self.edit615:destroy(); self.edit615 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label319 ~= nil then self.label319:destroy(); self.label319 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.label364 ~= nil then self.label364:destroy(); self.label364 = nil; end;
        if self.label393 ~= nil then self.label393:destroy(); self.label393 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.label348 ~= nil then self.label348:destroy(); self.label348 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit534 ~= nil then self.edit534:destroy(); self.edit534 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.label437 ~= nil then self.label437:destroy(); self.label437 = nil; end;
        if self.rectangle168 ~= nil then self.rectangle168:destroy(); self.rectangle168 = nil; end;
        if self.label366 ~= nil then self.label366:destroy(); self.label366 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.edit493 ~= nil then self.edit493:destroy(); self.edit493 = nil; end;
        if self.button107 ~= nil then self.button107:destroy(); self.button107 = nil; end;
        if self.rectangle155 ~= nil then self.rectangle155:destroy(); self.rectangle155 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.label433 ~= nil then self.label433:destroy(); self.label433 = nil; end;
        if self.edit401 ~= nil then self.edit401:destroy(); self.edit401 = nil; end;
        if self.classeBBA ~= nil then self.classeBBA:destroy(); self.classeBBA = nil; end;
        if self.edit566 ~= nil then self.edit566:destroy(); self.edit566 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.edit410 ~= nil then self.edit410:destroy(); self.edit410 = nil; end;
        if self.label515 ~= nil then self.label515:destroy(); self.label515 = nil; end;
        if self.rectangle145 ~= nil then self.rectangle145:destroy(); self.rectangle145 = nil; end;
        if self.label435 ~= nil then self.label435:destroy(); self.label435 = nil; end;
        if self.edit420 ~= nil then self.edit420:destroy(); self.edit420 = nil; end;
        if self.label409 ~= nil then self.label409:destroy(); self.label409 = nil; end;
        if self.label523 ~= nil then self.label523:destroy(); self.label523 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label376 ~= nil then self.label376:destroy(); self.label376 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.button98 ~= nil then self.button98:destroy(); self.button98 = nil; end;
        if self.edit616 ~= nil then self.edit616:destroy(); self.edit616 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.rectangle174 ~= nil then self.rectangle174:destroy(); self.rectangle174 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.label377 ~= nil then self.label377:destroy(); self.label377 = nil; end;
        if self.button92 ~= nil then self.button92:destroy(); self.button92 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.edit491 ~= nil then self.edit491:destroy(); self.edit491 = nil; end;
        if self.edit584 ~= nil then self.edit584:destroy(); self.edit584 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.rectangle173 ~= nil then self.rectangle173:destroy(); self.rectangle173 = nil; end;
        if self.edit565 ~= nil then self.edit565:destroy(); self.edit565 = nil; end;
        if self.edit598 ~= nil then self.edit598:destroy(); self.edit598 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit574 ~= nil then self.edit574:destroy(); self.edit574 = nil; end;
        if self.flowPart132 ~= nil then self.flowPart132:destroy(); self.flowPart132 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.label313 ~= nil then self.label313:destroy(); self.label313 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.edit409 ~= nil then self.edit409:destroy(); self.edit409 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.rectangle170 ~= nil then self.rectangle170:destroy(); self.rectangle170 = nil; end;
        if self.edit605 ~= nil then self.edit605:destroy(); self.edit605 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label411 ~= nil then self.label411:destroy(); self.label411 = nil; end;
        if self.textEditor30 ~= nil then self.textEditor30:destroy(); self.textEditor30 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.label389 ~= nil then self.label389:destroy(); self.label389 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.edit600 ~= nil then self.edit600:destroy(); self.edit600 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.flowPart127 ~= nil then self.flowPart127:destroy(); self.flowPart127 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.button91 ~= nil then self.button91:destroy(); self.button91 = nil; end;
        if self.flowPart147 ~= nil then self.flowPart147:destroy(); self.flowPart147 = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle157 ~= nil then self.rectangle157:destroy(); self.rectangle157 = nil; end;
        if self.flowPart158 ~= nil then self.flowPart158:destroy(); self.flowPart158 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.button100 ~= nil then self.button100:destroy(); self.button100 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.boxDetalhesDoAtaque ~= nil then self.boxDetalhesDoAtaque:destroy(); self.boxDetalhesDoAtaque = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.label402 ~= nil then self.label402:destroy(); self.label402 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit418 ~= nil then self.edit418:destroy(); self.edit418 = nil; end;
        if self.flowPart162 ~= nil then self.flowPart162:destroy(); self.flowPart162 = nil; end;
        if self.label500 ~= nil then self.label500:destroy(); self.label500 = nil; end;
        if self.flowPart176 ~= nil then self.flowPart176:destroy(); self.flowPart176 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.flowPart208 ~= nil then self.flowPart208:destroy(); self.flowPart208 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.edit525 ~= nil then self.edit525:destroy(); self.edit525 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit533 ~= nil then self.edit533:destroy(); self.edit533 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.label485 ~= nil then self.label485:destroy(); self.label485 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label436 ~= nil then self.label436:destroy(); self.label436 = nil; end;
        if self.label449 ~= nil then self.label449:destroy(); self.label449 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.flowPart163 ~= nil then self.flowPart163:destroy(); self.flowPart163 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.label312 ~= nil then self.label312:destroy(); self.label312 = nil; end;
        if self.label310 ~= nil then self.label310:destroy(); self.label310 = nil; end;
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.label461 ~= nil then self.label461:destroy(); self.label461 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.flowPart173 ~= nil then self.flowPart173:destroy(); self.flowPart173 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label415 ~= nil then self.label415:destroy(); self.label415 = nil; end;
        if self.label394 ~= nil then self.label394:destroy(); self.label394 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.rectangle169 ~= nil then self.rectangle169:destroy(); self.rectangle169 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.flowPart154 ~= nil then self.flowPart154:destroy(); self.flowPart154 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.label343 ~= nil then self.label343:destroy(); self.label343 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.edit521 ~= nil then self.edit521:destroy(); self.edit521 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit555 ~= nil then self.edit555:destroy(); self.edit555 = nil; end;
        if self.edit478 ~= nil then self.edit478:destroy(); self.edit478 = nil; end;
        if self.edit564 ~= nil then self.edit564:destroy(); self.edit564 = nil; end;
        if self.edit447 ~= nil then self.edit447:destroy(); self.edit447 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit517 ~= nil then self.edit517:destroy(); self.edit517 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit496 ~= nil then self.edit496:destroy(); self.edit496 = nil; end;
        if self.label352 ~= nil then self.label352:destroy(); self.label352 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.edit586 ~= nil then self.edit586:destroy(); self.edit586 = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.rectangle141 ~= nil then self.rectangle141:destroy(); self.rectangle141 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.edit537 ~= nil then self.edit537:destroy(); self.edit537 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edit591 ~= nil then self.edit591:destroy(); self.edit591 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit538 ~= nil then self.edit538:destroy(); self.edit538 = nil; end;
        if self.flowPart160 ~= nil then self.flowPart160:destroy(); self.flowPart160 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.edit417 ~= nil then self.edit417:destroy(); self.edit417 = nil; end;
        if self.rectangle142 ~= nil then self.rectangle142:destroy(); self.rectangle142 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.popGrapple ~= nil then self.popGrapple:destroy(); self.popGrapple = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit448 ~= nil then self.edit448:destroy(); self.edit448 = nil; end;
        if self.edit506 ~= nil then self.edit506:destroy(); self.edit506 = nil; end;
        if self.label426 ~= nil then self.label426:destroy(); self.label426 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.label387 ~= nil then self.label387:destroy(); self.label387 = nil; end;
        if self.textEditor29 ~= nil then self.textEditor29:destroy(); self.textEditor29 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit554 ~= nil then self.edit554:destroy(); self.edit554 = nil; end;
        if self.label514 ~= nil then self.label514:destroy(); self.label514 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.edit437 ~= nil then self.edit437:destroy(); self.edit437 = nil; end;
        if self.edit443 ~= nil then self.edit443:destroy(); self.edit443 = nil; end;
        if self.rectangle163 ~= nil then self.rectangle163:destroy(); self.rectangle163 = nil; end;
        if self.edit494 ~= nil then self.edit494:destroy(); self.edit494 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.edit433 ~= nil then self.edit433:destroy(); self.edit433 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.label349 ~= nil then self.label349:destroy(); self.label349 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.label370 ~= nil then self.label370:destroy(); self.label370 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit585 ~= nil then self.edit585:destroy(); self.edit585 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rclListaDosAtaques ~= nil then self.rclListaDosAtaques:destroy(); self.rclListaDosAtaques = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label460 ~= nil then self.label460:destroy(); self.label460 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.textEditor31 ~= nil then self.textEditor31:destroy(); self.textEditor31 = nil; end;
        if self.alvo3 ~= nil then self.alvo3:destroy(); self.alvo3 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.label473 ~= nil then self.label473:destroy(); self.label473 = nil; end;
        if self.popDobra ~= nil then self.popDobra:destroy(); self.popDobra = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.label395 ~= nil then self.label395:destroy(); self.label395 = nil; end;
        if self.rclListaDasDobras ~= nil then self.rclListaDasDobras:destroy(); self.rclListaDasDobras = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label337 ~= nil then self.label337:destroy(); self.label337 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.label416 ~= nil then self.label416:destroy(); self.label416 = nil; end;
        if self.label453 ~= nil then self.label453:destroy(); self.label453 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label505 ~= nil then self.label505:destroy(); self.label505 = nil; end;
        if self.edit563 ~= nil then self.edit563:destroy(); self.edit563 = nil; end;
        if self.label354 ~= nil then self.label354:destroy(); self.label354 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.edit505 ~= nil then self.edit505:destroy(); self.edit505 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.flowPart175 ~= nil then self.flowPart175:destroy(); self.flowPart175 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit595 ~= nil then self.edit595:destroy(); self.edit595 = nil; end;
        if self.button101 ~= nil then self.button101:destroy(); self.button101 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label405 ~= nil then self.label405:destroy(); self.label405 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.edit425 ~= nil then self.edit425:destroy(); self.edit425 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.edit427 ~= nil then self.edit427:destroy(); self.edit427 = nil; end;
        if self.edit509 ~= nil then self.edit509:destroy(); self.edit509 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label463 ~= nil then self.label463:destroy(); self.label463 = nil; end;
        if self.label487 ~= nil then self.label487:destroy(); self.label487 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.label320 ~= nil then self.label320:destroy(); self.label320 = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.edit569 ~= nil then self.edit569:destroy(); self.edit569 = nil; end;
        if self.edit535 ~= nil then self.edit535:destroy(); self.edit535 = nil; end;
        if self.flowPart168 ~= nil then self.flowPart168:destroy(); self.flowPart168 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.edit414 ~= nil then self.edit414:destroy(); self.edit414 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.edit482 ~= nil then self.edit482:destroy(); self.edit482 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit552 ~= nil then self.edit552:destroy(); self.edit552 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.flowPart159 ~= nil then self.flowPart159:destroy(); self.flowPart159 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.rectangle139 ~= nil then self.rectangle139:destroy(); self.rectangle139 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.edit618 ~= nil then self.edit618:destroy(); self.edit618 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.label443 ~= nil then self.label443:destroy(); self.label443 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label516 ~= nil then self.label516:destroy(); self.label516 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.flowPart185 ~= nil then self.flowPart185:destroy(); self.flowPart185 = nil; end;
        if self.flowPart196 ~= nil then self.flowPart196:destroy(); self.flowPart196 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.label373 ~= nil then self.label373:destroy(); self.label373 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit597 ~= nil then self.edit597:destroy(); self.edit597 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.rectangle165 ~= nil then self.rectangle165:destroy(); self.rectangle165 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.label522 ~= nil then self.label522:destroy(); self.label522 = nil; end;
        if self.label431 ~= nil then self.label431:destroy(); self.label431 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label363 ~= nil then self.label363:destroy(); self.label363 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.label470 ~= nil then self.label470:destroy(); self.label470 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.flowPart213 ~= nil then self.flowPart213:destroy(); self.flowPart213 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label296 ~= nil then self.label296:destroy(); self.label296 = nil; end;
        if self.flowPart206 ~= nil then self.flowPart206:destroy(); self.flowPart206 = nil; end;
        if self.label483 ~= nil then self.label483:destroy(); self.label483 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit407 ~= nil then self.edit407:destroy(); self.edit407 = nil; end;
        if self.edit498 ~= nil then self.edit498:destroy(); self.edit498 = nil; end;
        if self.label472 ~= nil then self.label472:destroy(); self.label472 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.label368 ~= nil then self.label368:destroy(); self.label368 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAvatar()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAvatar();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAvatar = {
    newEditor = newfrmAvatar, 
    new = newfrmAvatar, 
    name = "frmAvatar", 
    dataType = "Ambesek.Nefertyne.Avatar.d20", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Avatar d20", 
    description=""};

frmAvatar = _frmAvatar;
Firecast.registrarForm(_frmAvatar);
Firecast.registrarDataType(_frmAvatar);

return _frmAvatar;
