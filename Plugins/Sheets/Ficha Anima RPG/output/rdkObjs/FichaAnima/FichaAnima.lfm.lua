require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaAnima()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmFichaAnima");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Anima");
    obj:setTitle("Ficha Anima");
    obj:setAlign("client");
    obj:setTheme("dark");


        local debug = false;
        local index = 1;

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
        


    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmFichaRPGmeister1_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister1_svg:setParent(obj.tab1);
    obj.frmFichaRPGmeister1_svg:setName("frmFichaRPGmeister1_svg");
    obj.frmFichaRPGmeister1_svg:setAlign("client");
    obj.frmFichaRPGmeister1_svg:setTheme("dark");
    obj.frmFichaRPGmeister1_svg:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmFichaRPGmeister1_svg);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.popAtributo = gui.fromHandle(_obj_newObject("popup"));
    obj.popAtributo:setParent(obj.scrollBox1);
    obj.popAtributo:setName("popAtributo");
    obj.popAtributo:setWidth(820);
    obj.popAtributo:setHeight(170);
    obj.popAtributo:setBackOpacity(0.4);

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popAtributo);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(13);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(50);
    obj.flowPart1:setHeight(15);
    obj.flowPart1:setName("flowPart1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setFontSize(10);
    obj.label1:setText("Inicial");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(50);
    obj.flowPart2:setMaxWidth(50);
    obj.flowPart2:setHeight(15);
    obj.flowPart2:setName("flowPart2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("Raça");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(50);
    obj.flowPart3:setMaxWidth(50);
    obj.flowPart3:setHeight(15);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("NEP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.flowPart4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(50);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(15);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Inerente");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.flowPart5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(50);
    obj.flowPart5:setMaxWidth(50);
    obj.flowPart5:setHeight(15);
    obj.flowPart5:setName("flowPart5");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setFontSize(10);
    obj.label5:setText("Tamanho");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.flowPart6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(50);
    obj.flowPart6:setMaxWidth(50);
    obj.flowPart6:setHeight(15);
    obj.flowPart6:setName("flowPart6");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart6);
    obj.label6:setAlign("top");
    obj.label6:setFontSize(10);
    obj.label6:setText("Outros");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.flowPart7 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(20);
    obj.flowPart7:setMaxWidth(20);
    obj.flowPart7:setHeight(15);
    obj.flowPart7:setName("flowPart7");

    obj.flowPart8 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(50);
    obj.flowPart8:setMaxWidth(75);
    obj.flowPart8:setHeight(15);
    obj.flowPart8:setName("flowPart8");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowPart8);
    obj.checkBox1:setAlign("client");
    obj.checkBox1:setField("isMelhoriaActive");
    obj.checkBox1:setText("Melhoria");
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setFontSize(10);
    obj.checkBox1:setName("checkBox1");

    obj.flowPart9 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setMinWidth(50);
    obj.flowPart9:setMaxWidth(75);
    obj.flowPart9:setHeight(15);
    obj.flowPart9:setName("flowPart9");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowPart9);
    obj.checkBox2:setAlign("client");
    obj.checkBox2:setField("isDnTempActive");
    obj.checkBox2:setText("Dn Temp.");
    obj.checkBox2:setHorzTextAlign("center");
    obj.checkBox2:setFontSize(10);
    obj.checkBox2:setName("checkBox2");

    obj.flowPart10 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setMinWidth(50);
    obj.flowPart10:setMaxWidth(75);
    obj.flowPart10:setHeight(15);
    obj.flowPart10:setName("flowPart10");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowPart10);
    obj.checkBox3:setAlign("client");
    obj.checkBox3:setField("isDnPermActive");
    obj.checkBox3:setText("Dn Perm.");
    obj.checkBox3:setHorzTextAlign("center");
    obj.checkBox3:setFontSize(10);
    obj.checkBox3:setName("checkBox3");

    obj.flowPart11 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setMinWidth(50);
    obj.flowPart11:setMaxWidth(75);
    obj.flowPart11:setHeight(15);
    obj.flowPart11:setName("flowPart11");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowPart11);
    obj.checkBox4:setAlign("client");
    obj.checkBox4:setField("isTempActive");
    obj.checkBox4:setText("Temp.");
    obj.checkBox4:setHorzTextAlign("center");
    obj.checkBox4:setFontSize(10);
    obj.checkBox4:setName("checkBox4");

    obj.flowPart12 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setMinWidth(50);
    obj.flowPart12:setMaxWidth(75);
    obj.flowPart12:setHeight(15);
    obj.flowPart12:setName("flowPart12");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowPart12);
    obj.checkBox5:setAlign("client");
    obj.checkBox5:setField("isClasseActive");
    obj.checkBox5:setText("Classe");
    obj.checkBox5:setHorzTextAlign("center");
    obj.checkBox5:setFontSize(10);
    obj.checkBox5:setName("checkBox5");

    obj.flowPart13 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout1);
    obj.flowPart13:setMinWidth(50);
    obj.flowPart13:setMaxWidth(75);
    obj.flowPart13:setHeight(15);
    obj.flowPart13:setName("flowPart13");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowPart13);
    obj.checkBox6:setAlign("client");
    obj.checkBox6:setField("isMagiaActive");
    obj.checkBox6:setText("Magia");
    obj.checkBox6:setHorzTextAlign("center");
    obj.checkBox6:setFontSize(10);
    obj.checkBox6:setName("checkBox6");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popAtributo);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(13);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart14 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setMinWidth(50);
    obj.flowPart14:setMaxWidth(50);
    obj.flowPart14:setHeight(20);
    obj.flowPart14:setName("flowPart14");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart14);
    obj.edit1:setAlign("client");
    obj.edit1:setField("inicialFor");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.flowPart15 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(50);
    obj.flowPart15:setMaxWidth(50);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setName("flowPart15");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart15);
    obj.edit2:setAlign("client");
    obj.edit2:setField("racaFor");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart16 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(50);
    obj.flowPart16:setMaxWidth(50);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setName("flowPart16");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart16);
    obj.edit3:setAlign("client");
    obj.edit3:setField("nepFor");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart17 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(50);
    obj.flowPart17:setMaxWidth(50);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart17);
    obj.edit4:setAlign("client");
    obj.edit4:setField("inerenteFor");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart18 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setMinWidth(50);
    obj.flowPart18:setMaxWidth(50);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setName("flowPart18");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart18);
    obj.edit5:setAlign("client");
    obj.edit5:setField("tamanhoFor");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.flowPart19 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setMinWidth(50);
    obj.flowPart19:setMaxWidth(50);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart19);
    obj.edit6:setAlign("client");
    obj.edit6:setField("outrosFor");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(12);
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.flowPart20 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setMinWidth(20);
    obj.flowPart20:setMaxWidth(20);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setName("flowPart20");

    obj.flowPart21 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setMinWidth(50);
    obj.flowPart21:setMaxWidth(75);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setName("flowPart21");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart21);
    obj.edit7:setAlign("client");
    obj.edit7:setField("melhoriaFor");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(12);
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.flowPart22 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setMinWidth(50);
    obj.flowPart22:setMaxWidth(75);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setName("flowPart22");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart22);
    obj.edit8:setAlign("client");
    obj.edit8:setField("danoTempFor");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(12);
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.flowPart23 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout2);
    obj.flowPart23:setMinWidth(50);
    obj.flowPart23:setMaxWidth(75);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart23);
    obj.edit9:setAlign("client");
    obj.edit9:setField("danoPermFor");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(12);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.flowPart24 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout2);
    obj.flowPart24:setMinWidth(50);
    obj.flowPart24:setMaxWidth(75);
    obj.flowPart24:setHeight(20);
    obj.flowPart24:setName("flowPart24");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart24);
    obj.edit10:setAlign("client");
    obj.edit10:setField("temporarioFor");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(12);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.flowPart25 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout2);
    obj.flowPart25:setMinWidth(50);
    obj.flowPart25:setMaxWidth(75);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart25);
    obj.edit11:setAlign("client");
    obj.edit11:setField("magiaFor");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(12);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.flowPart26 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout2);
    obj.flowPart26:setMinWidth(50);
    obj.flowPart26:setMaxWidth(75);
    obj.flowPart26:setHeight(20);
    obj.flowPart26:setName("flowPart26");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart26);
    obj.edit12:setAlign("client");
    obj.edit12:setField("classeFor");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(12);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.popAtributo);
    obj.dataLink1:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink1:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.popAtributo);
    obj.dataLink2:setFields({'inicialFor', 'racaFor', 'nepFor', 'inerenteFor', 'tamanhoFor', 'outrosFor', 'melhoriaFor', 'danoTempFor', 'danoPermFor', 'temporarioFor', 'magiaFor', 'classeFor', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink2:setName("dataLink2");

    obj.flowLayout3 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.popAtributo);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxControlsPerLine(13);
    obj.flowLayout3:setMargins({bottom=4});
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart27 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout3);
    obj.flowPart27:setMinWidth(50);
    obj.flowPart27:setMaxWidth(50);
    obj.flowPart27:setHeight(20);
    obj.flowPart27:setName("flowPart27");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart27);
    obj.edit13:setAlign("client");
    obj.edit13:setField("inicialDes");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(12);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.flowPart28 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout3);
    obj.flowPart28:setMinWidth(50);
    obj.flowPart28:setMaxWidth(50);
    obj.flowPart28:setHeight(20);
    obj.flowPart28:setName("flowPart28");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart28);
    obj.edit14:setAlign("client");
    obj.edit14:setField("racaDes");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(12);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.flowPart29 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout3);
    obj.flowPart29:setMinWidth(50);
    obj.flowPart29:setMaxWidth(50);
    obj.flowPart29:setHeight(20);
    obj.flowPart29:setName("flowPart29");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart29);
    obj.edit15:setAlign("client");
    obj.edit15:setField("nepDes");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(12);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.flowPart30 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout3);
    obj.flowPart30:setMinWidth(50);
    obj.flowPart30:setMaxWidth(50);
    obj.flowPart30:setHeight(20);
    obj.flowPart30:setName("flowPart30");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart30);
    obj.edit16:setAlign("client");
    obj.edit16:setField("inerenteDes");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(12);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.flowPart31 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout3);
    obj.flowPart31:setMinWidth(50);
    obj.flowPart31:setMaxWidth(50);
    obj.flowPart31:setHeight(20);
    obj.flowPart31:setName("flowPart31");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart31);
    obj.edit17:setAlign("client");
    obj.edit17:setField("tamanhoDes");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(12);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.flowPart32 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout3);
    obj.flowPart32:setMinWidth(50);
    obj.flowPart32:setMaxWidth(50);
    obj.flowPart32:setHeight(20);
    obj.flowPart32:setName("flowPart32");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart32);
    obj.edit18:setAlign("client");
    obj.edit18:setField("outrosDes");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(12);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.flowPart33 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout3);
    obj.flowPart33:setMinWidth(20);
    obj.flowPart33:setMaxWidth(20);
    obj.flowPart33:setHeight(20);
    obj.flowPart33:setName("flowPart33");

    obj.flowPart34 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout3);
    obj.flowPart34:setMinWidth(50);
    obj.flowPart34:setMaxWidth(75);
    obj.flowPart34:setHeight(20);
    obj.flowPart34:setName("flowPart34");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart34);
    obj.edit19:setAlign("client");
    obj.edit19:setField("melhoriaDes");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(12);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.flowPart35 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout3);
    obj.flowPart35:setMinWidth(50);
    obj.flowPart35:setMaxWidth(75);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setName("flowPart35");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart35);
    obj.edit20:setAlign("client");
    obj.edit20:setField("danoTempDes");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(12);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.flowPart36 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout3);
    obj.flowPart36:setMinWidth(50);
    obj.flowPart36:setMaxWidth(75);
    obj.flowPart36:setHeight(20);
    obj.flowPart36:setName("flowPart36");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart36);
    obj.edit21:setAlign("client");
    obj.edit21:setField("danoPermDes");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(12);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.flowPart37 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout3);
    obj.flowPart37:setMinWidth(50);
    obj.flowPart37:setMaxWidth(75);
    obj.flowPart37:setHeight(20);
    obj.flowPart37:setName("flowPart37");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart37);
    obj.edit22:setAlign("client");
    obj.edit22:setField("temporarioDes");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(12);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.flowPart38 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout3);
    obj.flowPart38:setMinWidth(50);
    obj.flowPart38:setMaxWidth(75);
    obj.flowPart38:setHeight(20);
    obj.flowPart38:setName("flowPart38");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart38);
    obj.edit23:setAlign("client");
    obj.edit23:setField("magiaDes");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(12);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.flowPart39 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout3);
    obj.flowPart39:setMinWidth(50);
    obj.flowPart39:setMaxWidth(75);
    obj.flowPart39:setHeight(20);
    obj.flowPart39:setName("flowPart39");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart39);
    obj.edit24:setAlign("client");
    obj.edit24:setField("classeDes");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(12);
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.popAtributo);
    obj.dataLink3:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink3:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.popAtributo);
    obj.dataLink4:setFields({'inicialDes', 'racaDes', 'nepDes', 'inerenteDes', 'tamanhoDes', 'outrosDes', 'melhoriaDes', 'danoTempDes', 'danoPermDes', 'temporarioDes', 'magiaDes', 'classeDes', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink4:setName("dataLink4");

    obj.flowLayout4 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.popAtributo);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxControlsPerLine(13);
    obj.flowLayout4:setMargins({bottom=4});
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart40 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout4);
    obj.flowPart40:setMinWidth(50);
    obj.flowPart40:setMaxWidth(50);
    obj.flowPart40:setHeight(20);
    obj.flowPart40:setName("flowPart40");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart40);
    obj.edit25:setAlign("client");
    obj.edit25:setField("inicialCon");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(12);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.flowPart41 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout4);
    obj.flowPart41:setMinWidth(50);
    obj.flowPart41:setMaxWidth(50);
    obj.flowPart41:setHeight(20);
    obj.flowPart41:setName("flowPart41");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart41);
    obj.edit26:setAlign("client");
    obj.edit26:setField("racaCon");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(12);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.flowPart42 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout4);
    obj.flowPart42:setMinWidth(50);
    obj.flowPart42:setMaxWidth(50);
    obj.flowPart42:setHeight(20);
    obj.flowPart42:setName("flowPart42");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart42);
    obj.edit27:setAlign("client");
    obj.edit27:setField("nepCon");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(12);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.flowPart43 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout4);
    obj.flowPart43:setMinWidth(50);
    obj.flowPart43:setMaxWidth(50);
    obj.flowPart43:setHeight(20);
    obj.flowPart43:setName("flowPart43");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart43);
    obj.edit28:setAlign("client");
    obj.edit28:setField("inerenteCon");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(12);
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.flowPart44 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout4);
    obj.flowPart44:setMinWidth(50);
    obj.flowPart44:setMaxWidth(50);
    obj.flowPart44:setHeight(20);
    obj.flowPart44:setName("flowPart44");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart44);
    obj.edit29:setAlign("client");
    obj.edit29:setField("tamanhoCon");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(12);
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.flowPart45 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout4);
    obj.flowPart45:setMinWidth(50);
    obj.flowPart45:setMaxWidth(50);
    obj.flowPart45:setHeight(20);
    obj.flowPart45:setName("flowPart45");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart45);
    obj.edit30:setAlign("client");
    obj.edit30:setField("outrosCon");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(12);
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.flowPart46 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout4);
    obj.flowPart46:setMinWidth(20);
    obj.flowPart46:setMaxWidth(20);
    obj.flowPart46:setHeight(20);
    obj.flowPart46:setName("flowPart46");

    obj.flowPart47 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout4);
    obj.flowPart47:setMinWidth(50);
    obj.flowPart47:setMaxWidth(75);
    obj.flowPart47:setHeight(20);
    obj.flowPart47:setName("flowPart47");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart47);
    obj.edit31:setAlign("client");
    obj.edit31:setField("melhoriaCon");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(12);
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.flowPart48 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout4);
    obj.flowPart48:setMinWidth(50);
    obj.flowPart48:setMaxWidth(75);
    obj.flowPart48:setHeight(20);
    obj.flowPart48:setName("flowPart48");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart48);
    obj.edit32:setAlign("client");
    obj.edit32:setField("danoTempCon");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(12);
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.flowPart49 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout4);
    obj.flowPart49:setMinWidth(50);
    obj.flowPart49:setMaxWidth(75);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setName("flowPart49");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart49);
    obj.edit33:setAlign("client");
    obj.edit33:setField("danoPermCon");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(12);
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.flowPart50 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout4);
    obj.flowPart50:setMinWidth(50);
    obj.flowPart50:setMaxWidth(75);
    obj.flowPart50:setHeight(20);
    obj.flowPart50:setName("flowPart50");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart50);
    obj.edit34:setAlign("client");
    obj.edit34:setField("temporarioCon");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(12);
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.flowPart51 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout4);
    obj.flowPart51:setMinWidth(50);
    obj.flowPart51:setMaxWidth(75);
    obj.flowPart51:setHeight(20);
    obj.flowPart51:setName("flowPart51");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart51);
    obj.edit35:setAlign("client");
    obj.edit35:setField("magiaCon");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontSize(12);
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.flowPart52 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout4);
    obj.flowPart52:setMinWidth(50);
    obj.flowPart52:setMaxWidth(75);
    obj.flowPart52:setHeight(20);
    obj.flowPart52:setName("flowPart52");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart52);
    obj.edit36:setAlign("client");
    obj.edit36:setField("classeCon");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontSize(12);
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.popAtributo);
    obj.dataLink5:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink5:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.popAtributo);
    obj.dataLink6:setFields({'inicialCon', 'racaCon', 'nepCon', 'inerenteCon', 'tamanhoCon', 'outrosCon', 'melhoriaCon', 'danoTempCon', 'danoPermCon', 'temporarioCon', 'magiaCon', 'classeCon', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink6:setName("dataLink6");

    obj.flowLayout5 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.popAtributo);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxControlsPerLine(13);
    obj.flowLayout5:setMargins({bottom=4});
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");

    obj.flowPart53 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout5);
    obj.flowPart53:setMinWidth(50);
    obj.flowPart53:setMaxWidth(50);
    obj.flowPart53:setHeight(20);
    obj.flowPart53:setName("flowPart53");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart53);
    obj.edit37:setAlign("client");
    obj.edit37:setField("inicialInt");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(12);
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.flowPart54 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout5);
    obj.flowPart54:setMinWidth(50);
    obj.flowPart54:setMaxWidth(50);
    obj.flowPart54:setHeight(20);
    obj.flowPart54:setName("flowPart54");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart54);
    obj.edit38:setAlign("client");
    obj.edit38:setField("racaInt");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontSize(12);
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.flowPart55 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout5);
    obj.flowPart55:setMinWidth(50);
    obj.flowPart55:setMaxWidth(50);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setName("flowPart55");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart55);
    obj.edit39:setAlign("client");
    obj.edit39:setField("nepInt");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontSize(12);
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.flowPart56 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout5);
    obj.flowPart56:setMinWidth(50);
    obj.flowPart56:setMaxWidth(50);
    obj.flowPart56:setHeight(20);
    obj.flowPart56:setName("flowPart56");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart56);
    obj.edit40:setAlign("client");
    obj.edit40:setField("inerenteInt");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontSize(12);
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.flowPart57 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout5);
    obj.flowPart57:setMinWidth(50);
    obj.flowPart57:setMaxWidth(50);
    obj.flowPart57:setHeight(20);
    obj.flowPart57:setName("flowPart57");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart57);
    obj.edit41:setAlign("client");
    obj.edit41:setField("tamanhoInt");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(12);
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.flowPart58 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout5);
    obj.flowPart58:setMinWidth(50);
    obj.flowPart58:setMaxWidth(50);
    obj.flowPart58:setHeight(20);
    obj.flowPart58:setName("flowPart58");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart58);
    obj.edit42:setAlign("client");
    obj.edit42:setField("outrosInt");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontSize(12);
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.flowPart59 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout5);
    obj.flowPart59:setMinWidth(20);
    obj.flowPart59:setMaxWidth(20);
    obj.flowPart59:setHeight(20);
    obj.flowPart59:setName("flowPart59");

    obj.flowPart60 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout5);
    obj.flowPart60:setMinWidth(50);
    obj.flowPart60:setMaxWidth(75);
    obj.flowPart60:setHeight(20);
    obj.flowPart60:setName("flowPart60");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart60);
    obj.edit43:setAlign("client");
    obj.edit43:setField("melhoriaInt");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(12);
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.flowPart61 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout5);
    obj.flowPart61:setMinWidth(50);
    obj.flowPart61:setMaxWidth(75);
    obj.flowPart61:setHeight(20);
    obj.flowPart61:setName("flowPart61");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart61);
    obj.edit44:setAlign("client");
    obj.edit44:setField("danoTempInt");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(12);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.flowPart62 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout5);
    obj.flowPart62:setMinWidth(50);
    obj.flowPart62:setMaxWidth(75);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setName("flowPart62");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart62);
    obj.edit45:setAlign("client");
    obj.edit45:setField("danoPermInt");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontSize(12);
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.flowPart63 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout5);
    obj.flowPart63:setMinWidth(50);
    obj.flowPart63:setMaxWidth(75);
    obj.flowPart63:setHeight(20);
    obj.flowPart63:setName("flowPart63");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart63);
    obj.edit46:setAlign("client");
    obj.edit46:setField("temporarioInt");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(12);
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.flowPart64 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout5);
    obj.flowPart64:setMinWidth(50);
    obj.flowPart64:setMaxWidth(75);
    obj.flowPart64:setHeight(20);
    obj.flowPart64:setName("flowPart64");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart64);
    obj.edit47:setAlign("client");
    obj.edit47:setField("magiaInt");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontSize(12);
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.flowPart65 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout5);
    obj.flowPart65:setMinWidth(50);
    obj.flowPart65:setMaxWidth(75);
    obj.flowPart65:setHeight(20);
    obj.flowPart65:setName("flowPart65");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart65);
    obj.edit48:setAlign("client");
    obj.edit48:setField("classeInt");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontSize(12);
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.popAtributo);
    obj.dataLink7:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink7:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.popAtributo);
    obj.dataLink8:setFields({'inicialInt', 'racaInt', 'nepInt', 'inerenteInt', 'tamanhoInt', 'outrosInt', 'melhoriaInt', 'danoTempInt', 'danoPermInt', 'temporarioInt', 'magiaInt', 'classeInt', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink8:setName("dataLink8");

    obj.flowLayout6 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.popAtributo);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxControlsPerLine(13);
    obj.flowLayout6:setMargins({bottom=4});
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart66 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout6);
    obj.flowPart66:setMinWidth(50);
    obj.flowPart66:setMaxWidth(50);
    obj.flowPart66:setHeight(20);
    obj.flowPart66:setName("flowPart66");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart66);
    obj.edit49:setAlign("client");
    obj.edit49:setField("inicialSab");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontSize(12);
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.flowPart67 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout6);
    obj.flowPart67:setMinWidth(50);
    obj.flowPart67:setMaxWidth(50);
    obj.flowPart67:setHeight(20);
    obj.flowPart67:setName("flowPart67");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart67);
    obj.edit50:setAlign("client");
    obj.edit50:setField("racaSab");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontSize(12);
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.flowPart68 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout6);
    obj.flowPart68:setMinWidth(50);
    obj.flowPart68:setMaxWidth(50);
    obj.flowPart68:setHeight(20);
    obj.flowPart68:setName("flowPart68");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart68);
    obj.edit51:setAlign("client");
    obj.edit51:setField("nepSab");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontSize(12);
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.flowPart69 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout6);
    obj.flowPart69:setMinWidth(50);
    obj.flowPart69:setMaxWidth(50);
    obj.flowPart69:setHeight(20);
    obj.flowPart69:setName("flowPart69");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart69);
    obj.edit52:setAlign("client");
    obj.edit52:setField("inerenteSab");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontSize(12);
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.flowPart70 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout6);
    obj.flowPart70:setMinWidth(50);
    obj.flowPart70:setMaxWidth(50);
    obj.flowPart70:setHeight(20);
    obj.flowPart70:setName("flowPart70");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart70);
    obj.edit53:setAlign("client");
    obj.edit53:setField("tamanhoSab");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontSize(12);
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.flowPart71 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout6);
    obj.flowPart71:setMinWidth(50);
    obj.flowPart71:setMaxWidth(50);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setName("flowPart71");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart71);
    obj.edit54:setAlign("client");
    obj.edit54:setField("outrosSab");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontSize(12);
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.flowPart72 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout6);
    obj.flowPart72:setMinWidth(20);
    obj.flowPart72:setMaxWidth(20);
    obj.flowPart72:setHeight(20);
    obj.flowPart72:setName("flowPart72");

    obj.flowPart73 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout6);
    obj.flowPart73:setMinWidth(50);
    obj.flowPart73:setMaxWidth(75);
    obj.flowPart73:setHeight(20);
    obj.flowPart73:setName("flowPart73");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart73);
    obj.edit55:setAlign("client");
    obj.edit55:setField("melhoriaSab");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setFontSize(12);
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.flowPart74 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout6);
    obj.flowPart74:setMinWidth(50);
    obj.flowPart74:setMaxWidth(75);
    obj.flowPart74:setHeight(20);
    obj.flowPart74:setName("flowPart74");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart74);
    obj.edit56:setAlign("client");
    obj.edit56:setField("danoTempSab");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontSize(12);
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.flowPart75 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout6);
    obj.flowPart75:setMinWidth(50);
    obj.flowPart75:setMaxWidth(75);
    obj.flowPart75:setHeight(20);
    obj.flowPart75:setName("flowPart75");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart75);
    obj.edit57:setAlign("client");
    obj.edit57:setField("danoPermSab");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setFontSize(12);
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.flowPart76 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout6);
    obj.flowPart76:setMinWidth(50);
    obj.flowPart76:setMaxWidth(75);
    obj.flowPart76:setHeight(20);
    obj.flowPart76:setName("flowPart76");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart76);
    obj.edit58:setAlign("client");
    obj.edit58:setField("temporarioSab");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(12);
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.flowPart77 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout6);
    obj.flowPart77:setMinWidth(50);
    obj.flowPart77:setMaxWidth(75);
    obj.flowPart77:setHeight(20);
    obj.flowPart77:setName("flowPart77");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart77);
    obj.edit59:setAlign("client");
    obj.edit59:setField("magiaSab");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setFontSize(12);
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.flowPart78 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout6);
    obj.flowPart78:setMinWidth(50);
    obj.flowPart78:setMaxWidth(75);
    obj.flowPart78:setHeight(20);
    obj.flowPart78:setName("flowPart78");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart78);
    obj.edit60:setAlign("client");
    obj.edit60:setField("classeSab");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(12);
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.popAtributo);
    obj.dataLink9:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink9:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.popAtributo);
    obj.dataLink10:setFields({'inicialSab', 'racaSab', 'nepSab', 'inerenteSab', 'tamanhoSab', 'outrosSab', 'melhoriaSab', 'danoTempSab', 'danoPermSab', 'temporarioSab', 'magiaSab', 'classeSab', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink10:setName("dataLink10");

    obj.flowLayout7 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.popAtributo);
    obj.flowLayout7:setAlign("top");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMaxControlsPerLine(13);
    obj.flowLayout7:setMargins({bottom=4});
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setName("flowLayout7");

    obj.flowPart79 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout7);
    obj.flowPart79:setMinWidth(50);
    obj.flowPart79:setMaxWidth(50);
    obj.flowPart79:setHeight(20);
    obj.flowPart79:setName("flowPart79");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart79);
    obj.edit61:setAlign("client");
    obj.edit61:setField("inicialCar");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontSize(12);
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.flowPart80 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout7);
    obj.flowPart80:setMinWidth(50);
    obj.flowPart80:setMaxWidth(50);
    obj.flowPart80:setHeight(20);
    obj.flowPart80:setName("flowPart80");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart80);
    obj.edit62:setAlign("client");
    obj.edit62:setField("racaCar");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontSize(12);
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");

    obj.flowPart81 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout7);
    obj.flowPart81:setMinWidth(50);
    obj.flowPart81:setMaxWidth(50);
    obj.flowPart81:setHeight(20);
    obj.flowPart81:setName("flowPart81");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart81);
    obj.edit63:setAlign("client");
    obj.edit63:setField("nepCar");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontSize(12);
    obj.edit63:setType("number");
    obj.edit63:setName("edit63");

    obj.flowPart82 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout7);
    obj.flowPart82:setMinWidth(50);
    obj.flowPart82:setMaxWidth(50);
    obj.flowPart82:setHeight(20);
    obj.flowPart82:setName("flowPart82");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart82);
    obj.edit64:setAlign("client");
    obj.edit64:setField("inerenteCar");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontSize(12);
    obj.edit64:setType("number");
    obj.edit64:setName("edit64");

    obj.flowPart83 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout7);
    obj.flowPart83:setMinWidth(50);
    obj.flowPart83:setMaxWidth(50);
    obj.flowPart83:setHeight(20);
    obj.flowPart83:setName("flowPart83");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart83);
    obj.edit65:setAlign("client");
    obj.edit65:setField("tamanhoCar");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontSize(12);
    obj.edit65:setType("number");
    obj.edit65:setName("edit65");

    obj.flowPart84 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout7);
    obj.flowPart84:setMinWidth(50);
    obj.flowPart84:setMaxWidth(50);
    obj.flowPart84:setHeight(20);
    obj.flowPart84:setName("flowPart84");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.flowPart84);
    obj.edit66:setAlign("client");
    obj.edit66:setField("outrosCar");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontSize(12);
    obj.edit66:setType("number");
    obj.edit66:setName("edit66");

    obj.flowPart85 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout7);
    obj.flowPart85:setMinWidth(20);
    obj.flowPart85:setMaxWidth(20);
    obj.flowPart85:setHeight(20);
    obj.flowPart85:setName("flowPart85");

    obj.flowPart86 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout7);
    obj.flowPart86:setMinWidth(50);
    obj.flowPart86:setMaxWidth(75);
    obj.flowPart86:setHeight(20);
    obj.flowPart86:setName("flowPart86");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.flowPart86);
    obj.edit67:setAlign("client");
    obj.edit67:setField("melhoriaCar");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontSize(12);
    obj.edit67:setType("number");
    obj.edit67:setName("edit67");

    obj.flowPart87 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout7);
    obj.flowPart87:setMinWidth(50);
    obj.flowPart87:setMaxWidth(75);
    obj.flowPart87:setHeight(20);
    obj.flowPart87:setName("flowPart87");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.flowPart87);
    obj.edit68:setAlign("client");
    obj.edit68:setField("danoTempCar");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontSize(12);
    obj.edit68:setType("number");
    obj.edit68:setName("edit68");

    obj.flowPart88 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout7);
    obj.flowPart88:setMinWidth(50);
    obj.flowPart88:setMaxWidth(75);
    obj.flowPart88:setHeight(20);
    obj.flowPart88:setName("flowPart88");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart88);
    obj.edit69:setAlign("client");
    obj.edit69:setField("danoPermCar");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontSize(12);
    obj.edit69:setType("number");
    obj.edit69:setName("edit69");

    obj.flowPart89 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout7);
    obj.flowPart89:setMinWidth(50);
    obj.flowPart89:setMaxWidth(75);
    obj.flowPart89:setHeight(20);
    obj.flowPart89:setName("flowPart89");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart89);
    obj.edit70:setAlign("client");
    obj.edit70:setField("temporarioCar");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontSize(12);
    obj.edit70:setType("number");
    obj.edit70:setName("edit70");

    obj.flowPart90 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout7);
    obj.flowPart90:setMinWidth(50);
    obj.flowPart90:setMaxWidth(75);
    obj.flowPart90:setHeight(20);
    obj.flowPart90:setName("flowPart90");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart90);
    obj.edit71:setAlign("client");
    obj.edit71:setField("magiaCar");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontSize(12);
    obj.edit71:setType("number");
    obj.edit71:setName("edit71");

    obj.flowPart91 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout7);
    obj.flowPart91:setMinWidth(50);
    obj.flowPart91:setMaxWidth(75);
    obj.flowPart91:setHeight(20);
    obj.flowPart91:setName("flowPart91");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart91);
    obj.edit72:setAlign("client");
    obj.edit72:setField("classeCar");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontSize(12);
    obj.edit72:setType("number");
    obj.edit72:setName("edit72");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.popAtributo);
    obj.dataLink11:setFields({'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink11:setDefaultValues({'true', 'true', 'true', 'true', 'true', 'true'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.popAtributo);
    obj.dataLink12:setFields({'inicialCar', 'racaCar', 'nepCar', 'inerenteCar', 'tamanhoCar', 'outrosCar', 'melhoriaCar', 'danoTempCar', 'danoPermCar', 'temporarioCar', 'magiaCar', 'classeCar', 'isMelhoriaActive', 'isDnTempActive', 'isDnPermActive', 'isTempActive', 'isClasseActive', 'isMagiaActive'});
    obj.dataLink12:setName("dataLink12");

    obj.popResistencia = gui.fromHandle(_obj_newObject("popup"));
    obj.popResistencia:setParent(obj.scrollBox1);
    obj.popResistencia:setName("popResistencia");
    obj.popResistencia:setWidth(380);
    obj.popResistencia:setHeight(175);
    obj.popResistencia:setBackOpacity(0.4);

    obj.flowLayout8 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.popResistencia);
    obj.flowLayout8:setAlign("top");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setMaxControlsPerLine(11);
    obj.flowLayout8:setMargins({bottom=4});
    obj.flowLayout8:setHorzAlign("center");
    obj.flowLayout8:setName("flowLayout8");

    obj.flowPart92 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout8);
    obj.flowPart92:setMinWidth(50);
    obj.flowPart92:setMaxWidth(50);
    obj.flowPart92:setHeight(15);
    obj.flowPart92:setName("flowPart92");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart92);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Nível");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.flowPart93 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout8);
    obj.flowPart93:setMinWidth(50);
    obj.flowPart93:setMaxWidth(50);
    obj.flowPart93:setHeight(15);
    obj.flowPart93:setName("flowPart93");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart93);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Atributo 1");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.flowPart94 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout8);
    obj.flowPart94:setMinWidth(50);
    obj.flowPart94:setMaxWidth(50);
    obj.flowPart94:setHeight(15);
    obj.flowPart94:setName("flowPart94");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart94);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(10);
    obj.label9:setText("Atributo 2");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.flowPart95 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout8);
    obj.flowPart95:setMinWidth(50);
    obj.flowPart95:setMaxWidth(50);
    obj.flowPart95:setHeight(15);
    obj.flowPart95:setName("flowPart95");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart95);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Magia");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.flowPart96 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout8);
    obj.flowPart96:setMinWidth(50);
    obj.flowPart96:setMaxWidth(50);
    obj.flowPart96:setHeight(15);
    obj.flowPart96:setName("flowPart96");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart96);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(10);
    obj.label11:setText("Melhoria");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.flowPart97 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout8);
    obj.flowPart97:setMinWidth(50);
    obj.flowPart97:setMaxWidth(50);
    obj.flowPart97:setHeight(15);
    obj.flowPart97:setName("flowPart97");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart97);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Temp.");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.flowPart98 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout8);
    obj.flowPart98:setMinWidth(50);
    obj.flowPart98:setMaxWidth(50);
    obj.flowPart98:setHeight(15);
    obj.flowPart98:setName("flowPart98");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart98);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(10);
    obj.label13:setText("Outros");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.flowLayout9 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.popResistencia);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxControlsPerLine(11);
    obj.flowLayout9:setMargins({bottom=4});
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setName("flowLayout9");

    obj.flowPart99 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout9);
    obj.flowPart99:setMinWidth(50);
    obj.flowPart99:setMaxWidth(50);
    obj.flowPart99:setHeight(20);
    obj.flowPart99:setName("flowPart99");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart99);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart99);
    obj.label14:setAlign("client");
    obj.label14:setField("ajuste");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontSize(12);
    obj.label14:setName("label14");

    obj.flowPart100 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout9);
    obj.flowPart100:setMinWidth(50);
    obj.flowPart100:setMaxWidth(50);
    obj.flowPart100:setHeight(20);
    obj.flowPart100:setName("flowPart100");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowPart100);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart100);
    obj.label15:setAlign("client");
    obj.label15:setField("efetModFor");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontSize(12);
    obj.label15:setName("label15");

    obj.flowPart101 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout9);
    obj.flowPart101:setMinWidth(50);
    obj.flowPart101:setMaxWidth(50);
    obj.flowPart101:setHeight(20);
    obj.flowPart101:setName("flowPart101");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart101);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart101);
    obj.label16:setAlign("client");
    obj.label16:setField("efetModCon");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(12);
    obj.label16:setName("label16");

    obj.flowPart102 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout9);
    obj.flowPart102:setMinWidth(50);
    obj.flowPart102:setMaxWidth(50);
    obj.flowPart102:setHeight(20);
    obj.flowPart102:setName("flowPart102");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart102);
    obj.edit73:setAlign("client");
    obj.edit73:setField("magiaFort");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontSize(12);
    obj.edit73:setType("number");
    obj.edit73:setName("edit73");

    obj.flowPart103 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout9);
    obj.flowPart103:setMinWidth(50);
    obj.flowPart103:setMaxWidth(50);
    obj.flowPart103:setHeight(20);
    obj.flowPart103:setName("flowPart103");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart103);
    obj.edit74:setAlign("client");
    obj.edit74:setField("variavelFort");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontSize(12);
    obj.edit74:setType("number");
    obj.edit74:setName("edit74");

    obj.flowPart104 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout9);
    obj.flowPart104:setMinWidth(50);
    obj.flowPart104:setMaxWidth(50);
    obj.flowPart104:setHeight(20);
    obj.flowPart104:setName("flowPart104");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.flowPart104);
    obj.edit75:setAlign("client");
    obj.edit75:setField("temporarioFort");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setFontSize(12);
    obj.edit75:setType("number");
    obj.edit75:setName("edit75");

    obj.flowPart105 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout9);
    obj.flowPart105:setMinWidth(50);
    obj.flowPart105:setMaxWidth(50);
    obj.flowPart105:setHeight(20);
    obj.flowPart105:setName("flowPart105");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.flowPart105);
    obj.edit76:setAlign("client");
    obj.edit76:setField("outrosFort");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontSize(12);
    obj.edit76:setType("number");
    obj.edit76:setName("edit76");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.popResistencia);
    obj.dataLink13:setFields({'ajuste', 'efetModFor', 'efetModCon', 'magiaFort', 'variavelFort', 'temporarioFort', 'outrosFort'});
    obj.dataLink13:setName("dataLink13");

    obj.flowLayout10 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.popResistencia);
    obj.flowLayout10:setAlign("top");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxControlsPerLine(11);
    obj.flowLayout10:setMargins({bottom=4});
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setName("flowLayout10");

    obj.flowPart106 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout10);
    obj.flowPart106:setMinWidth(50);
    obj.flowPart106:setMaxWidth(50);
    obj.flowPart106:setHeight(20);
    obj.flowPart106:setName("flowPart106");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowPart106);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart106);
    obj.label17:setAlign("client");
    obj.label17:setField("ajuste");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(12);
    obj.label17:setName("label17");

    obj.flowPart107 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout10);
    obj.flowPart107:setMinWidth(50);
    obj.flowPart107:setMaxWidth(50);
    obj.flowPart107:setHeight(20);
    obj.flowPart107:setName("flowPart107");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.flowPart107);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart107);
    obj.label18:setAlign("client");
    obj.label18:setField("efetModDes");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontSize(12);
    obj.label18:setName("label18");

    obj.flowPart108 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout10);
    obj.flowPart108:setMinWidth(50);
    obj.flowPart108:setMaxWidth(50);
    obj.flowPart108:setHeight(20);
    obj.flowPart108:setName("flowPart108");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.flowPart108);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart108);
    obj.label19:setAlign("client");
    obj.label19:setField("efetModInt");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontSize(12);
    obj.label19:setName("label19");

    obj.flowPart109 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout10);
    obj.flowPart109:setMinWidth(50);
    obj.flowPart109:setMaxWidth(50);
    obj.flowPart109:setHeight(20);
    obj.flowPart109:setName("flowPart109");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.flowPart109);
    obj.edit77:setAlign("client");
    obj.edit77:setField("magiaRef");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setFontSize(12);
    obj.edit77:setType("number");
    obj.edit77:setName("edit77");

    obj.flowPart110 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout10);
    obj.flowPart110:setMinWidth(50);
    obj.flowPart110:setMaxWidth(50);
    obj.flowPart110:setHeight(20);
    obj.flowPart110:setName("flowPart110");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.flowPart110);
    obj.edit78:setAlign("client");
    obj.edit78:setField("variavelRef");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setFontSize(12);
    obj.edit78:setType("number");
    obj.edit78:setName("edit78");

    obj.flowPart111 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout10);
    obj.flowPart111:setMinWidth(50);
    obj.flowPart111:setMaxWidth(50);
    obj.flowPart111:setHeight(20);
    obj.flowPart111:setName("flowPart111");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.flowPart111);
    obj.edit79:setAlign("client");
    obj.edit79:setField("temporarioRef");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setFontSize(12);
    obj.edit79:setType("number");
    obj.edit79:setName("edit79");

    obj.flowPart112 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.flowLayout10);
    obj.flowPart112:setMinWidth(50);
    obj.flowPart112:setMaxWidth(50);
    obj.flowPart112:setHeight(20);
    obj.flowPart112:setName("flowPart112");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.flowPart112);
    obj.edit80:setAlign("client");
    obj.edit80:setField("outrosRef");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setFontSize(12);
    obj.edit80:setType("number");
    obj.edit80:setName("edit80");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.popResistencia);
    obj.dataLink14:setFields({'ajuste', 'efetModDes', 'efetModInt', 'magiaRef', 'variavelRef', 'temporarioRef', 'outrosRef'});
    obj.dataLink14:setName("dataLink14");

    obj.flowLayout11 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.popResistencia);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxControlsPerLine(11);
    obj.flowLayout11:setMargins({bottom=4});
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setName("flowLayout11");

    obj.flowPart113 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.flowLayout11);
    obj.flowPart113:setMinWidth(50);
    obj.flowPart113:setMaxWidth(50);
    obj.flowPart113:setHeight(20);
    obj.flowPart113:setName("flowPart113");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.flowPart113);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart113);
    obj.label20:setAlign("client");
    obj.label20:setField("ajuste");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setFontSize(12);
    obj.label20:setName("label20");

    obj.flowPart114 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.flowLayout11);
    obj.flowPart114:setMinWidth(50);
    obj.flowPart114:setMaxWidth(50);
    obj.flowPart114:setHeight(20);
    obj.flowPart114:setName("flowPart114");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowPart114);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart114);
    obj.label21:setAlign("client");
    obj.label21:setField("efetModDes");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(12);
    obj.label21:setName("label21");

    obj.flowPart115 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.flowLayout11);
    obj.flowPart115:setMinWidth(50);
    obj.flowPart115:setMaxWidth(50);
    obj.flowPart115:setHeight(20);
    obj.flowPart115:setName("flowPart115");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowPart115);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart115);
    obj.label22:setAlign("client");
    obj.label22:setField("efetModInt");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontSize(12);
    obj.label22:setName("label22");

    obj.flowPart116 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.flowLayout11);
    obj.flowPart116:setMinWidth(50);
    obj.flowPart116:setMaxWidth(50);
    obj.flowPart116:setHeight(20);
    obj.flowPart116:setName("flowPart116");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.flowPart116);
    obj.edit81:setAlign("client");
    obj.edit81:setField("magiaRefT");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setFontSize(12);
    obj.edit81:setType("number");
    obj.edit81:setName("edit81");

    obj.flowPart117 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.flowLayout11);
    obj.flowPart117:setMinWidth(50);
    obj.flowPart117:setMaxWidth(50);
    obj.flowPart117:setHeight(20);
    obj.flowPart117:setName("flowPart117");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.flowPart117);
    obj.edit82:setAlign("client");
    obj.edit82:setField("variavelRefT");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setFontSize(12);
    obj.edit82:setType("number");
    obj.edit82:setName("edit82");

    obj.flowPart118 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.flowLayout11);
    obj.flowPart118:setMinWidth(50);
    obj.flowPart118:setMaxWidth(50);
    obj.flowPart118:setHeight(20);
    obj.flowPart118:setName("flowPart118");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.flowPart118);
    obj.edit83:setAlign("client");
    obj.edit83:setField("temporarioRefT");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setFontSize(12);
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");

    obj.flowPart119 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.flowLayout11);
    obj.flowPart119:setMinWidth(50);
    obj.flowPart119:setMaxWidth(50);
    obj.flowPart119:setHeight(20);
    obj.flowPart119:setName("flowPart119");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.flowPart119);
    obj.edit84:setAlign("client");
    obj.edit84:setField("outrosRefT");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setFontSize(12);
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.popResistencia);
    obj.dataLink15:setFields({'ajuste', 'efetModDes', 'efetModInt', 'magiaRefT', 'variavelRefT', 'temporarioRefT', 'outrosRefT'});
    obj.dataLink15:setName("dataLink15");

    obj.flowLayout12 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.popResistencia);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMaxControlsPerLine(11);
    obj.flowLayout12:setMargins({bottom=4});
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setName("flowLayout12");

    obj.flowPart120 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.flowLayout12);
    obj.flowPart120:setMinWidth(50);
    obj.flowPart120:setMaxWidth(50);
    obj.flowPart120:setHeight(20);
    obj.flowPart120:setName("flowPart120");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.flowPart120);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart120);
    obj.label23:setAlign("client");
    obj.label23:setField("ajuste");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(12);
    obj.label23:setName("label23");

    obj.flowPart121 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout12);
    obj.flowPart121:setMinWidth(50);
    obj.flowPart121:setMaxWidth(50);
    obj.flowPart121:setHeight(20);
    obj.flowPart121:setName("flowPart121");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.flowPart121);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart121);
    obj.label24:setAlign("client");
    obj.label24:setField("efetModSab");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontSize(12);
    obj.label24:setName("label24");

    obj.flowPart122 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.flowLayout12);
    obj.flowPart122:setMinWidth(50);
    obj.flowPart122:setMaxWidth(50);
    obj.flowPart122:setHeight(20);
    obj.flowPart122:setName("flowPart122");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.flowPart122);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart122);
    obj.label25:setAlign("client");
    obj.label25:setField("efetModCar");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontSize(12);
    obj.label25:setName("label25");

    obj.flowPart123 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.flowLayout12);
    obj.flowPart123:setMinWidth(50);
    obj.flowPart123:setMaxWidth(50);
    obj.flowPart123:setHeight(20);
    obj.flowPart123:setName("flowPart123");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.flowPart123);
    obj.edit85:setAlign("client");
    obj.edit85:setField("magiaVon");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setFontSize(12);
    obj.edit85:setType("number");
    obj.edit85:setName("edit85");

    obj.flowPart124 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.flowLayout12);
    obj.flowPart124:setMinWidth(50);
    obj.flowPart124:setMaxWidth(50);
    obj.flowPart124:setHeight(20);
    obj.flowPart124:setName("flowPart124");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.flowPart124);
    obj.edit86:setAlign("client");
    obj.edit86:setField("variavelVon");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setFontSize(12);
    obj.edit86:setType("number");
    obj.edit86:setName("edit86");

    obj.flowPart125 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.flowLayout12);
    obj.flowPart125:setMinWidth(50);
    obj.flowPart125:setMaxWidth(50);
    obj.flowPart125:setHeight(20);
    obj.flowPart125:setName("flowPart125");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.flowPart125);
    obj.edit87:setAlign("client");
    obj.edit87:setField("temporarioVon");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setFontSize(12);
    obj.edit87:setType("number");
    obj.edit87:setName("edit87");

    obj.flowPart126 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.flowLayout12);
    obj.flowPart126:setMinWidth(50);
    obj.flowPart126:setMaxWidth(50);
    obj.flowPart126:setHeight(20);
    obj.flowPart126:setName("flowPart126");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.flowPart126);
    obj.edit88:setAlign("client");
    obj.edit88:setField("outrosVon");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setFontSize(12);
    obj.edit88:setType("number");
    obj.edit88:setName("edit88");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.popResistencia);
    obj.dataLink16:setFields({'ajuste', 'efetModSab', 'efetModCar', 'magiaVon', 'variavelVon', 'temporarioVon', 'outrosVon'});
    obj.dataLink16:setName("dataLink16");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popResistencia);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("trCondicional");
    obj.textEditor1:setName("textEditor1");

    obj.popCA = gui.fromHandle(_obj_newObject("popup"));
    obj.popCA:setParent(obj.scrollBox1);
    obj.popCA:setName("popCA");
    obj.popCA:setWidth(600);
    obj.popCA:setHeight(210);
    obj.popCA:setBackOpacity(0.4);

    obj.flowLayout13 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.popCA);
    obj.flowLayout13:setAlign("top");
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMargins({bottom=4});
    obj.flowLayout13:setName("flowLayout13");

    obj.flowPart127 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.flowLayout13);
    obj.flowPart127:setMinWidth(50);
    obj.flowPart127:setMaxWidth(50);
    obj.flowPart127:setHeight(15);
    obj.flowPart127:setName("flowPart127");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart127);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(10);
    obj.label26:setText("Armadura");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.flowPart128 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.flowLayout13);
    obj.flowPart128:setMinWidth(50);
    obj.flowPart128:setMaxWidth(50);
    obj.flowPart128:setHeight(20);
    obj.flowPart128:setName("flowPart128");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.flowPart128);
    obj.edit89:setAlign("client");
    obj.edit89:setField("armaduraCa");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setFontSize(12);
    obj.edit89:setType("number");
    obj.edit89:setName("edit89");

    obj.flowPart129 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.flowLayout13);
    obj.flowPart129:setMinWidth(140);
    obj.flowPart129:setMaxWidth(150);
    obj.flowPart129:setHeight(20);
    obj.flowPart129:setName("flowPart129");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.flowPart129);
    obj.edit90:setAlign("client");
    obj.edit90:setField("armaduraCa2");
    obj.edit90:setFontSize(12);
    obj.edit90:setName("edit90");

    obj.flowPart130 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.flowLayout13);
    obj.flowPart130:setMinWidth(50);
    obj.flowPart130:setMaxWidth(60);
    obj.flowPart130:setHeight(20);
    obj.flowPart130:setName("flowPart130");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowPart130);
    obj.checkBox7:setField("armaduraCaSurp");
    obj.checkBox7:setText("Surpresa");
    obj.checkBox7:setFontSize(10);
    obj.checkBox7:setHeight(20);
    obj.checkBox7:setName("checkBox7");

    obj.flowPart131 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.flowLayout13);
    obj.flowPart131:setMinWidth(50);
    obj.flowPart131:setMaxWidth(60);
    obj.flowPart131:setHeight(20);
    obj.flowPart131:setName("flowPart131");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowPart131);
    obj.checkBox8:setField("armaduraCaToque");
    obj.checkBox8:setText("Toque");
    obj.checkBox8:setFontSize(10);
    obj.checkBox8:setHeight(15);
    obj.checkBox8:setName("checkBox8");

    obj.flowPart132 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.flowLayout13);
    obj.flowPart132:setMinWidth(10);
    obj.flowPart132:setMaxWidth(20);
    obj.flowPart132:setHeight(15);
    obj.flowPart132:setName("flowPart132");

    obj.flowPart133 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.flowLayout13);
    obj.flowPart133:setMinWidth(50);
    obj.flowPart133:setMaxWidth(50);
    obj.flowPart133:setHeight(15);
    obj.flowPart133:setName("flowPart133");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart133);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(10);
    obj.label27:setText("Penalidade");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.flowPart134 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.flowLayout13);
    obj.flowPart134:setMinWidth(50);
    obj.flowPart134:setMaxWidth(50);
    obj.flowPart134:setHeight(20);
    obj.flowPart134:setName("flowPart134");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.flowPart134);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart134);
    obj.label28:setAlign("client");
    obj.label28:setField("equipamentoCorpoPen");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setFontSize(12);
    obj.label28:setName("label28");

    obj.flowPart135 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.flowLayout13);
    obj.flowPart135:setMinWidth(50);
    obj.flowPart135:setMaxWidth(50);
    obj.flowPart135:setHeight(15);
    obj.flowPart135:setName("flowPart135");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart135);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Falha");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.flowPart136 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.flowLayout13);
    obj.flowPart136:setMinWidth(50);
    obj.flowPart136:setMaxWidth(50);
    obj.flowPart136:setHeight(20);
    obj.flowPart136:setName("flowPart136");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.flowPart136);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart136);
    obj.label30:setAlign("client");
    obj.label30:setField("equipamentoCorpoFalha");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setFontSize(12);
    obj.label30:setName("label30");

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout13);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart137 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.flowLayout13);
    obj.flowPart137:setMinWidth(50);
    obj.flowPart137:setMaxWidth(50);
    obj.flowPart137:setHeight(15);
    obj.flowPart137:setName("flowPart137");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart137);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(10);
    obj.label31:setText("Escudo");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.flowPart138 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.flowLayout13);
    obj.flowPart138:setMinWidth(50);
    obj.flowPart138:setMaxWidth(50);
    obj.flowPart138:setHeight(20);
    obj.flowPart138:setName("flowPart138");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.flowPart138);
    obj.edit91:setAlign("client");
    obj.edit91:setField("escudoCa");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setFontSize(12);
    obj.edit91:setType("number");
    obj.edit91:setName("edit91");

    obj.flowPart139 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.flowLayout13);
    obj.flowPart139:setMinWidth(140);
    obj.flowPart139:setMaxWidth(150);
    obj.flowPart139:setHeight(20);
    obj.flowPart139:setName("flowPart139");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.flowPart139);
    obj.edit92:setAlign("client");
    obj.edit92:setField("escudoCa2");
    obj.edit92:setFontSize(12);
    obj.edit92:setName("edit92");

    obj.flowPart140 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.flowLayout13);
    obj.flowPart140:setMinWidth(50);
    obj.flowPart140:setMaxWidth(60);
    obj.flowPart140:setHeight(20);
    obj.flowPart140:setName("flowPart140");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowPart140);
    obj.checkBox9:setField("escudoCaSurp");
    obj.checkBox9:setText("Surpresa");
    obj.checkBox9:setFontSize(10);
    obj.checkBox9:setHeight(20);
    obj.checkBox9:setName("checkBox9");

    obj.flowPart141 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.flowLayout13);
    obj.flowPart141:setMinWidth(50);
    obj.flowPart141:setMaxWidth(60);
    obj.flowPart141:setHeight(20);
    obj.flowPart141:setName("flowPart141");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowPart141);
    obj.checkBox10:setField("escudoCaToque");
    obj.checkBox10:setText("Toque");
    obj.checkBox10:setFontSize(10);
    obj.checkBox10:setHeight(15);
    obj.checkBox10:setName("checkBox10");

    obj.flowPart142 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart142:setParent(obj.flowLayout13);
    obj.flowPart142:setMinWidth(10);
    obj.flowPart142:setMaxWidth(20);
    obj.flowPart142:setHeight(15);
    obj.flowPart142:setName("flowPart142");

    obj.flowPart143 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart143:setParent(obj.flowLayout13);
    obj.flowPart143:setMinWidth(50);
    obj.flowPart143:setMaxWidth(50);
    obj.flowPart143:setHeight(15);
    obj.flowPart143:setName("flowPart143");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart143);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(10);
    obj.label32:setText("Penalidade");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.flowPart144 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart144:setParent(obj.flowLayout13);
    obj.flowPart144:setMinWidth(50);
    obj.flowPart144:setMaxWidth(50);
    obj.flowPart144:setHeight(20);
    obj.flowPart144:setName("flowPart144");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.flowPart144);
    obj.edit93:setAlign("client");
    obj.edit93:setField("escudoPen");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setFontSize(12);
    obj.edit93:setType("number");
    obj.edit93:setName("edit93");

    obj.flowPart145 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart145:setParent(obj.flowLayout13);
    obj.flowPart145:setMinWidth(50);
    obj.flowPart145:setMaxWidth(50);
    obj.flowPart145:setHeight(15);
    obj.flowPart145:setName("flowPart145");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart145);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(10);
    obj.label33:setText("Falha");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.flowPart146 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart146:setParent(obj.flowLayout13);
    obj.flowPart146:setMinWidth(50);
    obj.flowPart146:setMaxWidth(50);
    obj.flowPart146:setHeight(20);
    obj.flowPart146:setName("flowPart146");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.flowPart146);
    obj.edit94:setAlign("client");
    obj.edit94:setField("escudoFalha");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setFontSize(12);
    obj.edit94:setType("number");
    obj.edit94:setName("edit94");

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout13);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart147 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart147:setParent(obj.flowLayout13);
    obj.flowPart147:setMinWidth(50);
    obj.flowPart147:setMaxWidth(50);
    obj.flowPart147:setHeight(15);
    obj.flowPart147:setName("flowPart147");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart147);
    obj.label34:setAlign("top");
    obj.label34:setFontSize(10);
    obj.label34:setText("Destreza");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setWordWrap(true);
    obj.label34:setTextTrimming("none");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.flowPart148 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart148:setParent(obj.flowLayout13);
    obj.flowPart148:setMinWidth(50);
    obj.flowPart148:setMaxWidth(50);
    obj.flowPart148:setHeight(20);
    obj.flowPart148:setName("flowPart148");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.flowPart148);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart148);
    obj.label35:setAlign("client");
    obj.label35:setField("efetModDes");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setFontSize(12);
    obj.label35:setName("label35");

    obj.flowPart149 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart149:setParent(obj.flowLayout13);
    obj.flowPart149:setMinWidth(140);
    obj.flowPart149:setMaxWidth(150);
    obj.flowPart149:setHeight(20);
    obj.flowPart149:setName("flowPart149");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.flowPart149);
    obj.edit95:setAlign("client");
    obj.edit95:setField("destrezaCa2");
    obj.edit95:setFontSize(12);
    obj.edit95:setName("edit95");

    obj.flowPart150 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart150:setParent(obj.flowLayout13);
    obj.flowPart150:setMinWidth(50);
    obj.flowPart150:setMaxWidth(60);
    obj.flowPart150:setHeight(20);
    obj.flowPart150:setName("flowPart150");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowPart150);
    obj.checkBox11:setField("destrezaCaSurp");
    obj.checkBox11:setText("Surpresa");
    obj.checkBox11:setFontSize(10);
    obj.checkBox11:setHeight(20);
    obj.checkBox11:setName("checkBox11");

    obj.flowPart151 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart151:setParent(obj.flowLayout13);
    obj.flowPart151:setMinWidth(50);
    obj.flowPart151:setMaxWidth(60);
    obj.flowPart151:setHeight(20);
    obj.flowPart151:setName("flowPart151");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowPart151);
    obj.checkBox12:setField("destrezaCaToque");
    obj.checkBox12:setText("Toque");
    obj.checkBox12:setFontSize(10);
    obj.checkBox12:setHeight(15);
    obj.checkBox12:setName("checkBox12");

    obj.flowLineBreak3 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout13);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart152 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart152:setParent(obj.flowLayout13);
    obj.flowPart152:setMinWidth(50);
    obj.flowPart152:setMaxWidth(50);
    obj.flowPart152:setHeight(15);
    obj.flowPart152:setName("flowPart152");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart152);
    obj.label36:setAlign("top");
    obj.label36:setFontSize(10);
    obj.label36:setText("Tamanho");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWordWrap(true);
    obj.label36:setTextTrimming("none");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");

    obj.flowPart153 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart153:setParent(obj.flowLayout13);
    obj.flowPart153:setMinWidth(50);
    obj.flowPart153:setMaxWidth(50);
    obj.flowPart153:setHeight(20);
    obj.flowPart153:setName("flowPart153");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.flowPart153);
    obj.edit96:setAlign("client");
    obj.edit96:setField("tamanhoCa");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setFontSize(12);
    obj.edit96:setType("number");
    obj.edit96:setName("edit96");

    obj.flowPart154 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart154:setParent(obj.flowLayout13);
    obj.flowPart154:setMinWidth(140);
    obj.flowPart154:setMaxWidth(150);
    obj.flowPart154:setHeight(20);
    obj.flowPart154:setName("flowPart154");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.flowPart154);
    obj.edit97:setAlign("client");
    obj.edit97:setField("tamanhoCa2");
    obj.edit97:setFontSize(12);
    obj.edit97:setName("edit97");

    obj.flowPart155 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart155:setParent(obj.flowLayout13);
    obj.flowPart155:setMinWidth(50);
    obj.flowPart155:setMaxWidth(60);
    obj.flowPart155:setHeight(20);
    obj.flowPart155:setName("flowPart155");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowPart155);
    obj.checkBox13:setField("tamanhoCaSurp");
    obj.checkBox13:setText("Surpresa");
    obj.checkBox13:setFontSize(10);
    obj.checkBox13:setHeight(20);
    obj.checkBox13:setName("checkBox13");

    obj.flowPart156 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart156:setParent(obj.flowLayout13);
    obj.flowPart156:setMinWidth(50);
    obj.flowPart156:setMaxWidth(60);
    obj.flowPart156:setHeight(20);
    obj.flowPart156:setName("flowPart156");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowPart156);
    obj.checkBox14:setField("tamanhoCaToque");
    obj.checkBox14:setText("Toque");
    obj.checkBox14:setFontSize(10);
    obj.checkBox14:setHeight(15);
    obj.checkBox14:setName("checkBox14");

    obj.flowLineBreak4 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout13);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart157 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart157:setParent(obj.flowLayout13);
    obj.flowPart157:setMinWidth(50);
    obj.flowPart157:setMaxWidth(50);
    obj.flowPart157:setHeight(15);
    obj.flowPart157:setName("flowPart157");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart157);
    obj.label37:setAlign("top");
    obj.label37:setFontSize(10);
    obj.label37:setText("Natural");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setWordWrap(true);
    obj.label37:setTextTrimming("none");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.flowPart158 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart158:setParent(obj.flowLayout13);
    obj.flowPart158:setMinWidth(50);
    obj.flowPart158:setMaxWidth(50);
    obj.flowPart158:setHeight(20);
    obj.flowPart158:setName("flowPart158");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.flowPart158);
    obj.edit98:setAlign("client");
    obj.edit98:setField("naturalCa");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setFontSize(12);
    obj.edit98:setType("number");
    obj.edit98:setName("edit98");

    obj.flowPart159 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart159:setParent(obj.flowLayout13);
    obj.flowPart159:setMinWidth(140);
    obj.flowPart159:setMaxWidth(150);
    obj.flowPart159:setHeight(20);
    obj.flowPart159:setName("flowPart159");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.flowPart159);
    obj.edit99:setAlign("client");
    obj.edit99:setField("naturalCa2");
    obj.edit99:setFontSize(12);
    obj.edit99:setName("edit99");

    obj.flowPart160 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart160:setParent(obj.flowLayout13);
    obj.flowPart160:setMinWidth(50);
    obj.flowPart160:setMaxWidth(60);
    obj.flowPart160:setHeight(20);
    obj.flowPart160:setName("flowPart160");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowPart160);
    obj.checkBox15:setField("naturalCaSurp");
    obj.checkBox15:setText("Surpresa");
    obj.checkBox15:setFontSize(10);
    obj.checkBox15:setHeight(20);
    obj.checkBox15:setName("checkBox15");

    obj.flowPart161 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart161:setParent(obj.flowLayout13);
    obj.flowPart161:setMinWidth(50);
    obj.flowPart161:setMaxWidth(60);
    obj.flowPart161:setHeight(20);
    obj.flowPart161:setName("flowPart161");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowPart161);
    obj.checkBox16:setField("naturalCaToque");
    obj.checkBox16:setText("Toque");
    obj.checkBox16:setFontSize(10);
    obj.checkBox16:setHeight(15);
    obj.checkBox16:setName("checkBox16");

    obj.flowLineBreak5 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout13);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart162 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart162:setParent(obj.flowLayout13);
    obj.flowPart162:setMinWidth(50);
    obj.flowPart162:setMaxWidth(50);
    obj.flowPart162:setHeight(15);
    obj.flowPart162:setName("flowPart162");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart162);
    obj.label38:setAlign("top");
    obj.label38:setFontSize(10);
    obj.label38:setText("Deflexao");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setWordWrap(true);
    obj.label38:setTextTrimming("none");
    obj.label38:setAutoSize(true);
    obj.label38:setName("label38");

    obj.flowPart163 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart163:setParent(obj.flowLayout13);
    obj.flowPart163:setMinWidth(50);
    obj.flowPart163:setMaxWidth(50);
    obj.flowPart163:setHeight(20);
    obj.flowPart163:setName("flowPart163");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.flowPart163);
    obj.edit100:setAlign("client");
    obj.edit100:setField("deflexaoCa");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setFontSize(12);
    obj.edit100:setType("number");
    obj.edit100:setName("edit100");

    obj.flowPart164 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart164:setParent(obj.flowLayout13);
    obj.flowPart164:setMinWidth(140);
    obj.flowPart164:setMaxWidth(150);
    obj.flowPart164:setHeight(20);
    obj.flowPart164:setName("flowPart164");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.flowPart164);
    obj.edit101:setAlign("client");
    obj.edit101:setField("deflexaoCa2");
    obj.edit101:setFontSize(12);
    obj.edit101:setName("edit101");

    obj.flowPart165 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart165:setParent(obj.flowLayout13);
    obj.flowPart165:setMinWidth(50);
    obj.flowPart165:setMaxWidth(60);
    obj.flowPart165:setHeight(20);
    obj.flowPart165:setName("flowPart165");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.flowPart165);
    obj.checkBox17:setField("deflexaoCaSurp");
    obj.checkBox17:setText("Surpresa");
    obj.checkBox17:setFontSize(10);
    obj.checkBox17:setHeight(20);
    obj.checkBox17:setName("checkBox17");

    obj.flowPart166 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart166:setParent(obj.flowLayout13);
    obj.flowPart166:setMinWidth(50);
    obj.flowPart166:setMaxWidth(60);
    obj.flowPart166:setHeight(20);
    obj.flowPart166:setName("flowPart166");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.flowPart166);
    obj.checkBox18:setField("deflexaoCaToque");
    obj.checkBox18:setText("Toque");
    obj.checkBox18:setFontSize(10);
    obj.checkBox18:setHeight(15);
    obj.checkBox18:setName("checkBox18");

    obj.flowLineBreak6 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout13);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flowPart167 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart167:setParent(obj.flowLayout13);
    obj.flowPart167:setMinWidth(50);
    obj.flowPart167:setMaxWidth(50);
    obj.flowPart167:setHeight(15);
    obj.flowPart167:setName("flowPart167");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart167);
    obj.label39:setAlign("top");
    obj.label39:setFontSize(10);
    obj.label39:setText("Esquiva");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setWordWrap(true);
    obj.label39:setTextTrimming("none");
    obj.label39:setAutoSize(true);
    obj.label39:setName("label39");

    obj.flowPart168 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart168:setParent(obj.flowLayout13);
    obj.flowPart168:setMinWidth(50);
    obj.flowPart168:setMaxWidth(50);
    obj.flowPart168:setHeight(20);
    obj.flowPart168:setName("flowPart168");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.flowPart168);
    obj.edit102:setAlign("client");
    obj.edit102:setField("esquivaCa");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setFontSize(12);
    obj.edit102:setType("number");
    obj.edit102:setName("edit102");

    obj.flowPart169 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart169:setParent(obj.flowLayout13);
    obj.flowPart169:setMinWidth(140);
    obj.flowPart169:setMaxWidth(150);
    obj.flowPart169:setHeight(20);
    obj.flowPart169:setName("flowPart169");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.flowPart169);
    obj.edit103:setAlign("client");
    obj.edit103:setField("esquivaCa2");
    obj.edit103:setFontSize(12);
    obj.edit103:setName("edit103");

    obj.flowPart170 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart170:setParent(obj.flowLayout13);
    obj.flowPart170:setMinWidth(50);
    obj.flowPart170:setMaxWidth(60);
    obj.flowPart170:setHeight(20);
    obj.flowPart170:setName("flowPart170");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.flowPart170);
    obj.checkBox19:setField("esquivaCaSurp");
    obj.checkBox19:setText("Surpresa");
    obj.checkBox19:setFontSize(10);
    obj.checkBox19:setHeight(20);
    obj.checkBox19:setName("checkBox19");

    obj.flowPart171 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart171:setParent(obj.flowLayout13);
    obj.flowPart171:setMinWidth(50);
    obj.flowPart171:setMaxWidth(60);
    obj.flowPart171:setHeight(20);
    obj.flowPart171:setName("flowPart171");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.flowPart171);
    obj.checkBox20:setField("esquivaCaToque");
    obj.checkBox20:setText("Toque");
    obj.checkBox20:setFontSize(10);
    obj.checkBox20:setHeight(15);
    obj.checkBox20:setName("checkBox20");

    obj.flowLineBreak7 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout13);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart172 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart172:setParent(obj.flowLayout13);
    obj.flowPart172:setMinWidth(50);
    obj.flowPart172:setMaxWidth(50);
    obj.flowPart172:setHeight(15);
    obj.flowPart172:setName("flowPart172");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart172);
    obj.label40:setAlign("top");
    obj.label40:setFontSize(10);
    obj.label40:setText("Sorte");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setWordWrap(true);
    obj.label40:setTextTrimming("none");
    obj.label40:setAutoSize(true);
    obj.label40:setName("label40");

    obj.flowPart173 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart173:setParent(obj.flowLayout13);
    obj.flowPart173:setMinWidth(50);
    obj.flowPart173:setMaxWidth(50);
    obj.flowPart173:setHeight(20);
    obj.flowPart173:setName("flowPart173");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.flowPart173);
    obj.edit104:setAlign("client");
    obj.edit104:setField("sorteCa");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setFontSize(12);
    obj.edit104:setType("number");
    obj.edit104:setName("edit104");

    obj.flowPart174 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart174:setParent(obj.flowLayout13);
    obj.flowPart174:setMinWidth(140);
    obj.flowPart174:setMaxWidth(150);
    obj.flowPart174:setHeight(20);
    obj.flowPart174:setName("flowPart174");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.flowPart174);
    obj.edit105:setAlign("client");
    obj.edit105:setField("sorteCa2");
    obj.edit105:setFontSize(12);
    obj.edit105:setName("edit105");

    obj.flowPart175 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart175:setParent(obj.flowLayout13);
    obj.flowPart175:setMinWidth(50);
    obj.flowPart175:setMaxWidth(60);
    obj.flowPart175:setHeight(20);
    obj.flowPart175:setName("flowPart175");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.flowPart175);
    obj.checkBox21:setField("sorteCaSurp");
    obj.checkBox21:setText("Surpresa");
    obj.checkBox21:setFontSize(10);
    obj.checkBox21:setHeight(20);
    obj.checkBox21:setName("checkBox21");

    obj.flowPart176 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart176:setParent(obj.flowLayout13);
    obj.flowPart176:setMinWidth(50);
    obj.flowPart176:setMaxWidth(60);
    obj.flowPart176:setHeight(20);
    obj.flowPart176:setName("flowPart176");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.flowPart176);
    obj.checkBox22:setField("sorteCaToque");
    obj.checkBox22:setText("Toque");
    obj.checkBox22:setFontSize(10);
    obj.checkBox22:setHeight(15);
    obj.checkBox22:setName("checkBox22");

    obj.flowLineBreak8 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout13);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.flowPart177 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart177:setParent(obj.flowLayout13);
    obj.flowPart177:setMinWidth(50);
    obj.flowPart177:setMaxWidth(50);
    obj.flowPart177:setHeight(15);
    obj.flowPart177:setName("flowPart177");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart177);
    obj.label41:setAlign("top");
    obj.label41:setFontSize(10);
    obj.label41:setText("Outros");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setWordWrap(true);
    obj.label41:setTextTrimming("none");
    obj.label41:setAutoSize(true);
    obj.label41:setName("label41");

    obj.flowPart178 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart178:setParent(obj.flowLayout13);
    obj.flowPart178:setMinWidth(50);
    obj.flowPart178:setMaxWidth(50);
    obj.flowPart178:setHeight(20);
    obj.flowPart178:setName("flowPart178");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.flowPart178);
    obj.edit106:setAlign("client");
    obj.edit106:setField("outrosCa");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setFontSize(12);
    obj.edit106:setType("number");
    obj.edit106:setName("edit106");

    obj.flowPart179 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart179:setParent(obj.flowLayout13);
    obj.flowPart179:setMinWidth(140);
    obj.flowPart179:setMaxWidth(150);
    obj.flowPart179:setHeight(20);
    obj.flowPart179:setName("flowPart179");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.flowPart179);
    obj.edit107:setAlign("client");
    obj.edit107:setField("outrosCa2");
    obj.edit107:setFontSize(12);
    obj.edit107:setName("edit107");

    obj.flowPart180 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart180:setParent(obj.flowLayout13);
    obj.flowPart180:setMinWidth(50);
    obj.flowPart180:setMaxWidth(60);
    obj.flowPart180:setHeight(20);
    obj.flowPart180:setName("flowPart180");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.flowPart180);
    obj.checkBox23:setField("outrosCaSurp");
    obj.checkBox23:setText("Surpresa");
    obj.checkBox23:setFontSize(10);
    obj.checkBox23:setHeight(20);
    obj.checkBox23:setName("checkBox23");

    obj.flowPart181 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart181:setParent(obj.flowLayout13);
    obj.flowPart181:setMinWidth(50);
    obj.flowPart181:setMaxWidth(60);
    obj.flowPart181:setHeight(20);
    obj.flowPart181:setName("flowPart181");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.flowPart181);
    obj.checkBox24:setField("outrosCaToque");
    obj.checkBox24:setText("Toque");
    obj.checkBox24:setFontSize(10);
    obj.checkBox24:setHeight(15);
    obj.checkBox24:setName("checkBox24");

    obj.flowLineBreak9 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout13);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart182 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart182:setParent(obj.flowLayout13);
    obj.flowPart182:setMinWidth(50);
    obj.flowPart182:setMaxWidth(50);
    obj.flowPart182:setHeight(15);
    obj.flowPart182:setName("flowPart182");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart182);
    obj.label42:setAlign("top");
    obj.label42:setFontSize(10);
    obj.label42:setText("Variados");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setWordWrap(true);
    obj.label42:setTextTrimming("none");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");

    obj.flowPart183 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart183:setParent(obj.flowLayout13);
    obj.flowPart183:setMinWidth(50);
    obj.flowPart183:setMaxWidth(50);
    obj.flowPart183:setHeight(20);
    obj.flowPart183:setName("flowPart183");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.flowPart183);
    obj.edit108:setAlign("client");
    obj.edit108:setField("variadosCa");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setFontSize(12);
    obj.edit108:setType("number");
    obj.edit108:setName("edit108");

    obj.flowPart184 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart184:setParent(obj.flowLayout13);
    obj.flowPart184:setMinWidth(140);
    obj.flowPart184:setMaxWidth(150);
    obj.flowPart184:setHeight(20);
    obj.flowPart184:setName("flowPart184");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.flowPart184);
    obj.edit109:setAlign("client");
    obj.edit109:setField("variadosCa2");
    obj.edit109:setFontSize(12);
    obj.edit109:setName("edit109");

    obj.flowPart185 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart185:setParent(obj.flowLayout13);
    obj.flowPart185:setMinWidth(50);
    obj.flowPart185:setMaxWidth(60);
    obj.flowPart185:setHeight(20);
    obj.flowPart185:setName("flowPart185");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.flowPart185);
    obj.checkBox25:setField("variadosCaSurp");
    obj.checkBox25:setText("Surpresa");
    obj.checkBox25:setFontSize(10);
    obj.checkBox25:setHeight(20);
    obj.checkBox25:setName("checkBox25");

    obj.flowPart186 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart186:setParent(obj.flowLayout13);
    obj.flowPart186:setMinWidth(50);
    obj.flowPart186:setMaxWidth(60);
    obj.flowPart186:setHeight(20);
    obj.flowPart186:setName("flowPart186");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.flowPart186);
    obj.checkBox26:setField("variadosCaToque");
    obj.checkBox26:setText("Toque");
    obj.checkBox26:setFontSize(10);
    obj.checkBox26:setHeight(15);
    obj.checkBox26:setName("checkBox26");

    obj.flowLineBreak10 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout13);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.popGrapple = gui.fromHandle(_obj_newObject("popup"));
    obj.popGrapple:setParent(obj.scrollBox1);
    obj.popGrapple:setName("popGrapple");
    obj.popGrapple:setWidth(225);
    obj.popGrapple:setHeight(50);
    obj.popGrapple:setBackOpacity(0.4);

    obj.flowLayout14 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.popGrapple);
    obj.flowLayout14:setAlign("top");
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxControlsPerLine(4);
    obj.flowLayout14:setMargins({bottom=4});
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setName("flowLayout14");

    obj.flowPart187 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart187:setParent(obj.flowLayout14);
    obj.flowPart187:setMinWidth(50);
    obj.flowPart187:setMaxWidth(50);
    obj.flowPart187:setHeight(15);
    obj.flowPart187:setName("flowPart187");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart187);
    obj.label43:setAlign("top");
    obj.label43:setFontSize(10);
    obj.label43:setText("BBA");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setWordWrap(true);
    obj.label43:setTextTrimming("none");
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");

    obj.flowPart188 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart188:setParent(obj.flowLayout14);
    obj.flowPart188:setMinWidth(50);
    obj.flowPart188:setMaxWidth(50);
    obj.flowPart188:setHeight(15);
    obj.flowPart188:setName("flowPart188");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart188);
    obj.label44:setAlign("top");
    obj.label44:setFontSize(10);
    obj.label44:setText("Força");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setWordWrap(true);
    obj.label44:setTextTrimming("none");
    obj.label44:setAutoSize(true);
    obj.label44:setName("label44");

    obj.flowPart189 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart189:setParent(obj.flowLayout14);
    obj.flowPart189:setMinWidth(50);
    obj.flowPart189:setMaxWidth(50);
    obj.flowPart189:setHeight(15);
    obj.flowPart189:setName("flowPart189");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart189);
    obj.label45:setAlign("top");
    obj.label45:setFontSize(10);
    obj.label45:setText("Tamanho");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWordWrap(true);
    obj.label45:setTextTrimming("none");
    obj.label45:setAutoSize(true);
    obj.label45:setName("label45");

    obj.flowPart190 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart190:setParent(obj.flowLayout14);
    obj.flowPart190:setMinWidth(50);
    obj.flowPart190:setMaxWidth(50);
    obj.flowPart190:setHeight(15);
    obj.flowPart190:setName("flowPart190");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart190);
    obj.label46:setAlign("top");
    obj.label46:setFontSize(10);
    obj.label46:setText("Outros");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setWordWrap(true);
    obj.label46:setTextTrimming("none");
    obj.label46:setAutoSize(true);
    obj.label46:setName("label46");

    obj.flowPart191 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart191:setParent(obj.flowLayout14);
    obj.flowPart191:setMinWidth(50);
    obj.flowPart191:setMaxWidth(50);
    obj.flowPart191:setHeight(20);
    obj.flowPart191:setName("flowPart191");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.flowPart191);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart191);
    obj.label47:setAlign("client");
    obj.label47:setField("bba");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontSize(12);
    obj.label47:setName("label47");

    obj.flowPart192 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart192:setParent(obj.flowLayout14);
    obj.flowPart192:setMinWidth(50);
    obj.flowPart192:setMaxWidth(50);
    obj.flowPart192:setHeight(20);
    obj.flowPart192:setName("flowPart192");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.flowPart192);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart192);
    obj.label48:setAlign("client");
    obj.label48:setField("efetModFor");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setFontSize(12);
    obj.label48:setName("label48");

    obj.flowPart193 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart193:setParent(obj.flowLayout14);
    obj.flowPart193:setMinWidth(50);
    obj.flowPart193:setMaxWidth(50);
    obj.flowPart193:setHeight(20);
    obj.flowPart193:setName("flowPart193");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.flowPart193);
    obj.edit110:setAlign("client");
    obj.edit110:setField("agarrarTam");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setFontSize(12);
    obj.edit110:setType("number");
    obj.edit110:setName("edit110");

    obj.flowPart194 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart194:setParent(obj.flowLayout14);
    obj.flowPart194:setMinWidth(50);
    obj.flowPart194:setMaxWidth(50);
    obj.flowPart194:setHeight(20);
    obj.flowPart194:setName("flowPart194");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.flowPart194);
    obj.edit111:setAlign("client");
    obj.edit111:setField("agarrarVar");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setFontSize(12);
    obj.edit111:setType("number");
    obj.edit111:setName("edit111");

    obj.popManeuver = gui.fromHandle(_obj_newObject("popup"));
    obj.popManeuver:setParent(obj.scrollBox1);
    obj.popManeuver:setName("popManeuver");
    obj.popManeuver:setWidth(380);
    obj.popManeuver:setHeight(65);
    obj.popManeuver:setBackOpacity(0.4);

    obj.flowLayout15 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.popManeuver);
    obj.flowLayout15:setAlign("top");
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setMaxControlsPerLine(7);
    obj.flowLayout15:setMargins({bottom=4});
    obj.flowLayout15:setHorzAlign("center");
    obj.flowLayout15:setName("flowLayout15");

    obj.flowPart195 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart195:setParent(obj.flowLayout15);
    obj.flowPart195:setMinWidth(50);
    obj.flowPart195:setMaxWidth(50);
    obj.flowPart195:setHeight(15);
    obj.flowPart195:setName("flowPart195");

    obj.flowPart196 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart196:setParent(obj.flowLayout15);
    obj.flowPart196:setMinWidth(50);
    obj.flowPart196:setMaxWidth(50);
    obj.flowPart196:setHeight(15);
    obj.flowPart196:setName("flowPart196");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart196);
    obj.label49:setAlign("top");
    obj.label49:setFontSize(10);
    obj.label49:setText("BBA");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setWordWrap(true);
    obj.label49:setTextTrimming("none");
    obj.label49:setAutoSize(true);
    obj.label49:setName("label49");

    obj.flowPart197 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart197:setParent(obj.flowLayout15);
    obj.flowPart197:setMinWidth(50);
    obj.flowPart197:setMaxWidth(50);
    obj.flowPart197:setHeight(15);
    obj.flowPart197:setName("flowPart197");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart197);
    obj.label50:setAlign("top");
    obj.label50:setFontSize(10);
    obj.label50:setText("Força");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setWordWrap(true);
    obj.label50:setTextTrimming("none");
    obj.label50:setAutoSize(true);
    obj.label50:setName("label50");

    obj.flowPart198 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart198:setParent(obj.flowLayout15);
    obj.flowPart198:setMinWidth(50);
    obj.flowPart198:setMaxWidth(50);
    obj.flowPart198:setHeight(15);
    obj.flowPart198:setName("flowPart198");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart198);
    obj.label51:setAlign("top");
    obj.label51:setFontSize(10);
    obj.label51:setText("Tamanho");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setWordWrap(true);
    obj.label51:setTextTrimming("none");
    obj.label51:setAutoSize(true);
    obj.label51:setName("label51");

    obj.flowPart199 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart199:setParent(obj.flowLayout15);
    obj.flowPart199:setMinWidth(50);
    obj.flowPart199:setMaxWidth(50);
    obj.flowPart199:setHeight(15);
    obj.flowPart199:setName("flowPart199");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart199);
    obj.label52:setAlign("top");
    obj.label52:setFontSize(10);
    obj.label52:setText("Outros");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setWordWrap(true);
    obj.label52:setTextTrimming("none");
    obj.label52:setAutoSize(true);
    obj.label52:setName("label52");

    obj.flowPart200 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart200:setParent(obj.flowLayout15);
    obj.flowPart200:setMinWidth(50);
    obj.flowPart200:setMaxWidth(50);
    obj.flowPart200:setHeight(15);
    obj.flowPart200:setName("flowPart200");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart200);
    obj.label53:setAlign("top");
    obj.label53:setFontSize(10);
    obj.label53:setText("Destreza");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setWordWrap(true);
    obj.label53:setTextTrimming("none");
    obj.label53:setAutoSize(true);
    obj.label53:setName("label53");

    obj.flowPart201 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart201:setParent(obj.flowLayout15);
    obj.flowPart201:setMinWidth(50);
    obj.flowPart201:setMaxWidth(50);
    obj.flowPart201:setHeight(15);
    obj.flowPart201:setName("flowPart201");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart201);
    obj.label54:setAlign("top");
    obj.label54:setFontSize(10);
    obj.label54:setText("Diversos");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setWordWrap(true);
    obj.label54:setTextTrimming("none");
    obj.label54:setAutoSize(true);
    obj.label54:setName("label54");

    obj.flowLineBreak11 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout15);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.flowPart202 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart202:setParent(obj.flowLayout15);
    obj.flowPart202:setMinWidth(50);
    obj.flowPart202:setMaxWidth(50);
    obj.flowPart202:setHeight(15);
    obj.flowPart202:setName("flowPart202");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart202);
    obj.label55:setAlign("top");
    obj.label55:setFontSize(10);
    obj.label55:setText("BMC");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setWordWrap(true);
    obj.label55:setTextTrimming("none");
    obj.label55:setAutoSize(true);
    obj.label55:setName("label55");

    obj.flowPart203 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart203:setParent(obj.flowLayout15);
    obj.flowPart203:setMinWidth(50);
    obj.flowPart203:setMaxWidth(50);
    obj.flowPart203:setHeight(20);
    obj.flowPart203:setName("flowPart203");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.flowPart203);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart203);
    obj.label56:setAlign("client");
    obj.label56:setField("bba");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setFontSize(12);
    obj.label56:setName("label56");

    obj.flowPart204 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart204:setParent(obj.flowLayout15);
    obj.flowPart204:setMinWidth(50);
    obj.flowPart204:setMaxWidth(50);
    obj.flowPart204:setHeight(20);
    obj.flowPart204:setName("flowPart204");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.flowPart204);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart204);
    obj.label57:setAlign("client");
    obj.label57:setField("efetModFor");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setFontSize(12);
    obj.label57:setName("label57");

    obj.flowPart205 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart205:setParent(obj.flowLayout15);
    obj.flowPart205:setMinWidth(50);
    obj.flowPart205:setMaxWidth(50);
    obj.flowPart205:setHeight(20);
    obj.flowPart205:setName("flowPart205");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.flowPart205);
    obj.edit112:setAlign("client");
    obj.edit112:setField("bmcTamanho");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setFontSize(12);
    obj.edit112:setType("number");
    obj.edit112:setName("edit112");

    obj.flowPart206 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart206:setParent(obj.flowLayout15);
    obj.flowPart206:setMinWidth(50);
    obj.flowPart206:setMaxWidth(50);
    obj.flowPart206:setHeight(20);
    obj.flowPart206:setName("flowPart206");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.flowPart206);
    obj.edit113:setAlign("client");
    obj.edit113:setField("bmcOutros");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setFontSize(12);
    obj.edit113:setType("number");
    obj.edit113:setName("edit113");

    obj.flowPart207 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart207:setParent(obj.flowLayout15);
    obj.flowPart207:setMinWidth(50);
    obj.flowPart207:setMaxWidth(50);
    obj.flowPart207:setHeight(20);
    obj.flowPart207:setName("flowPart207");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.flowPart207);
    obj.checkBox27:setField("destrezaBMC");
    obj.checkBox27:setLeft(15);
    obj.checkBox27:setFontSize(10);
    obj.checkBox27:setHeight(20);
    obj.checkBox27:setName("checkBox27");

    obj.flowPart208 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart208:setParent(obj.flowLayout15);
    obj.flowPart208:setMinWidth(50);
    obj.flowPart208:setMaxWidth(50);
    obj.flowPart208:setHeight(20);
    obj.flowPart208:setName("flowPart208");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.flowPart208);
    obj.edit114:setAlign("client");
    obj.edit114:setField("bmcDiversos");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setFontSize(12);
    obj.edit114:setType("number");
    obj.edit114:setName("edit114");

    obj.flowLineBreak12 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout15);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.flowPart209 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart209:setParent(obj.flowLayout15);
    obj.flowPart209:setMinWidth(50);
    obj.flowPart209:setMaxWidth(50);
    obj.flowPart209:setHeight(15);
    obj.flowPart209:setName("flowPart209");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart209);
    obj.label58:setAlign("top");
    obj.label58:setFontSize(10);
    obj.label58:setText("BMD");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setWordWrap(true);
    obj.label58:setTextTrimming("none");
    obj.label58:setAutoSize(true);
    obj.label58:setName("label58");

    obj.flowPart210 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart210:setParent(obj.flowLayout15);
    obj.flowPart210:setMinWidth(50);
    obj.flowPart210:setMaxWidth(50);
    obj.flowPart210:setHeight(20);
    obj.flowPart210:setName("flowPart210");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.flowPart210);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart210);
    obj.label59:setAlign("client");
    obj.label59:setField("bba");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setFontSize(12);
    obj.label59:setName("label59");

    obj.flowPart211 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart211:setParent(obj.flowLayout15);
    obj.flowPart211:setMinWidth(50);
    obj.flowPart211:setMaxWidth(50);
    obj.flowPart211:setHeight(20);
    obj.flowPart211:setName("flowPart211");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.flowPart211);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart211);
    obj.label60:setAlign("client");
    obj.label60:setField("efetModFor");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setFontSize(12);
    obj.label60:setName("label60");

    obj.flowPart212 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart212:setParent(obj.flowLayout15);
    obj.flowPart212:setMinWidth(50);
    obj.flowPart212:setMaxWidth(50);
    obj.flowPart212:setHeight(20);
    obj.flowPart212:setName("flowPart212");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.flowPart212);
    obj.edit115:setAlign("client");
    obj.edit115:setField("bmdTamanho");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setFontSize(12);
    obj.edit115:setType("number");
    obj.edit115:setName("edit115");

    obj.flowPart213 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart213:setParent(obj.flowLayout15);
    obj.flowPart213:setMinWidth(50);
    obj.flowPart213:setMaxWidth(50);
    obj.flowPart213:setHeight(20);
    obj.flowPart213:setName("flowPart213");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.flowPart213);
    obj.edit116:setAlign("client");
    obj.edit116:setField("bmdOutros");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setFontSize(12);
    obj.edit116:setType("number");
    obj.edit116:setName("edit116");

    obj.flowPart214 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart214:setParent(obj.flowLayout15);
    obj.flowPart214:setMinWidth(50);
    obj.flowPart214:setMaxWidth(50);
    obj.flowPart214:setHeight(20);
    obj.flowPart214:setName("flowPart214");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.flowPart214);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart214);
    obj.label61:setAlign("client");
    obj.label61:setField("efetModDes");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setFontSize(12);
    obj.label61:setName("label61");

    obj.flowPart215 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart215:setParent(obj.flowLayout15);
    obj.flowPart215:setMinWidth(50);
    obj.flowPart215:setMaxWidth(50);
    obj.flowPart215:setHeight(20);
    obj.flowPart215:setName("flowPart215");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.flowPart215);
    obj.edit117:setAlign("client");
    obj.edit117:setField("bmdDiversos");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setFontSize(12);
    obj.edit117:setType("number");
    obj.edit117:setName("edit117");


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
			


    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.scrollBox1);
    obj.rectangle23:setLeft(0);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(1107);
    obj.rectangle23:setHeight(110);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setName("rectangle23");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle23);
    obj.label62:setLeft(5);
    obj.label62:setTop(5);
    obj.label62:setWidth(50);
    obj.label62:setHeight(25);
    obj.label62:setText("CLASSE");
    obj.label62:setName("label62");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.rectangle23);
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(60);
    obj.edit118:setTop(5);
    obj.edit118:setWidth(380);
    obj.edit118:setHeight(25);
    obj.edit118:setField("classe1");
    obj.edit118:setName("edit118");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle23);
    obj.label63:setLeft(5);
    obj.label63:setTop(30);
    obj.label63:setWidth(50);
    obj.label63:setHeight(25);
    obj.label63:setText("RAÇA");
    obj.label63:setName("label63");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.rectangle23);
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(60);
    obj.edit119:setTop(30);
    obj.edit119:setWidth(380);
    obj.edit119:setHeight(25);
    obj.edit119:setField("raca");
    obj.edit119:setName("edit119");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle23);
    obj.label64:setLeft(5);
    obj.label64:setTop(55);
    obj.label64:setWidth(50);
    obj.label64:setHeight(25);
    obj.label64:setText("TIPO");
    obj.label64:setName("label64");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.rectangle23);
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(60);
    obj.edit120:setTop(55);
    obj.edit120:setWidth(380);
    obj.edit120:setHeight(25);
    obj.edit120:setField("tipo");
    obj.edit120:setName("edit120");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle23);
    obj.label65:setLeft(5);
    obj.label65:setTop(80);
    obj.label65:setWidth(70);
    obj.label65:setHeight(25);
    obj.label65:setText("SUBTIPO");
    obj.label65:setName("label65");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.rectangle23);
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(60);
    obj.edit121:setTop(80);
    obj.edit121:setWidth(380);
    obj.edit121:setHeight(25);
    obj.edit121:setField("subtipo");
    obj.edit121:setName("edit121");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle23);
    obj.label66:setLeft(445);
    obj.label66:setTop(5);
    obj.label66:setWidth(50);
    obj.label66:setHeight(25);
    obj.label66:setText("NOME");
    obj.label66:setName("label66");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.rectangle23);
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(520);
    obj.edit122:setTop(5);
    obj.edit122:setWidth(290);
    obj.edit122:setHeight(25);
    obj.edit122:setField("nome");
    obj.edit122:setName("edit122");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle23);
    obj.label67:setLeft(445);
    obj.label67:setTop(30);
    obj.label67:setWidth(70);
    obj.label67:setHeight(25);
    obj.label67:setText("TENDÊNCIA");
    obj.label67:setName("label67");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.rectangle23);
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(520);
    obj.edit123:setTop(30);
    obj.edit123:setWidth(290);
    obj.edit123:setHeight(25);
    obj.edit123:setField("tendencia");
    obj.edit123:setName("edit123");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle23);
    obj.label68:setLeft(445);
    obj.label68:setTop(55);
    obj.label68:setWidth(70);
    obj.label68:setHeight(25);
    obj.label68:setText("CULTO");
    obj.label68:setName("label68");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.rectangle23);
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(520);
    obj.edit124:setTop(55);
    obj.edit124:setWidth(290);
    obj.edit124:setHeight(25);
    obj.edit124:setField("culto");
    obj.edit124:setName("edit124");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle23);
    obj.label69:setLeft(445);
    obj.label69:setTop(80);
    obj.label69:setWidth(70);
    obj.label69:setHeight(25);
    obj.label69:setText("TITULO");
    obj.label69:setName("label69");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.rectangle23);
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(520);
    obj.edit125:setTop(80);
    obj.edit125:setWidth(290);
    obj.edit125:setHeight(25);
    obj.edit125:setField("posto");
    obj.edit125:setName("edit125");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle23);
    obj.label70:setLeft(815);
    obj.label70:setTop(5);
    obj.label70:setWidth(70);
    obj.label70:setHeight(25);
    obj.label70:setText("NEP");
    obj.label70:setName("label70");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle23);
    obj.rectangle24:setLeft(890);
    obj.rectangle24:setTop(5);
    obj.rectangle24:setWidth(70);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle23);
    obj.label71:setField("nep");
    obj.label71:setLeft(890);
    obj.label71:setTop(5);
    obj.label71:setWidth(70);
    obj.label71:setHeight(25);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle23);
    obj.label72:setLeft(965);
    obj.label72:setTop(5);
    obj.label72:setWidth(60);
    obj.label72:setHeight(25);
    obj.label72:setText("Mod Nível");
    obj.label72:setName("label72");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle23);
    obj.rectangle25:setLeft(1030);
    obj.rectangle25:setTop(5);
    obj.rectangle25:setWidth(70);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle23);
    obj.label73:setField("ajuste");
    obj.label73:setLeft(1030);
    obj.label73:setTop(5);
    obj.label73:setWidth(70);
    obj.label73:setHeight(25);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle23);
    obj.label74:setLeft(815);
    obj.label74:setTop(30);
    obj.label74:setWidth(70);
    obj.label74:setHeight(25);
    obj.label74:setText("XP ATUAL");
    obj.label74:setName("label74");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.rectangle23);
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(890);
    obj.edit126:setTop(30);
    obj.edit126:setWidth(210);
    obj.edit126:setHeight(25);
    obj.edit126:setField("xpAtual");
    obj.edit126:setName("edit126");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle23);
    obj.button1:setLeft(815);
    obj.button1:setTop(56);
    obj.button1:setWidth(50);
    obj.button1:setText("ADD");
    obj.button1:setName("button1");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.rectangle23);
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(890);
    obj.edit127:setTop(55);
    obj.edit127:setWidth(210);
    obj.edit127:setHeight(25);
    obj.edit127:setField("xpNova");
    obj.edit127:setName("edit127");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle23);
    obj.label75:setLeft(815);
    obj.label75:setTop(80);
    obj.label75:setWidth(70);
    obj.label75:setHeight(25);
    obj.label75:setText("XP ALVO");
    obj.label75:setName("label75");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle23);
    obj.rectangle26:setLeft(890);
    obj.rectangle26:setTop(80);
    obj.rectangle26:setWidth(210);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle23);
    obj.label76:setField("xpNivel");
    obj.label76:setLeft(890);
    obj.label76:setTop(80);
    obj.label76:setWidth(210);
    obj.label76:setHeight(25);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle23);
    obj.dataLink17:setField("xpAtual");
    obj.dataLink17:setName("dataLink17");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.scrollBox1);
    obj.rectangle27:setLeft(0);
    obj.rectangle27:setTop(115);
    obj.rectangle27:setWidth(235);
    obj.rectangle27:setHeight(215);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle27);
    obj.label77:setLeft(0);
    obj.label77:setTop(0);
    obj.label77:setWidth(235);
    obj.label77:setHeight(25);
    obj.label77:setText("ATRIBUTOS");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle27);
    obj.label78:setLeft(45);
    obj.label78:setTop(30);
    obj.label78:setWidth(70);
    obj.label78:setHeight(25);
    obj.label78:setText("Real");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle27);
    obj.label79:setLeft(120);
    obj.label79:setTop(30);
    obj.label79:setWidth(70);
    obj.label79:setHeight(25);
    obj.label79:setText("Efetivo");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle27);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(55);
    obj.layout1:setWidth(275);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setLeft(5);
    obj.button2:setWidth(35);
    obj.button2:setText("FOR");
    obj.button2:setFontSize(11);
    obj.button2:setName("button2");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout1);
    obj.rectangle28:setLeft(45);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(35);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout1);
    obj.label80:setLeft(45);
    obj.label80:setWidth(35);
    obj.label80:setHeight(25);
    obj.label80:setField("realFor");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout1);
    obj.rectangle29:setLeft(80);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(35);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout1);
    obj.label81:setField("realModFor");
    obj.label81:setText("0");
    obj.label81:setLeft(80);
    obj.label81:setTop(3);
    obj.label81:setWidth(35);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout1);
    obj.dataLink18:setField("realFor");
    obj.dataLink18:setName("dataLink18");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout1);
    obj.rectangle30:setLeft(120);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(35);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout1);
    obj.label82:setLeft(120);
    obj.label82:setWidth(35);
    obj.label82:setHeight(25);
    obj.label82:setField("efetFor");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout1);
    obj.rectangle31:setLeft(155);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(35);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout1);
    obj.label83:setField("efetModFor");
    obj.label83:setText("0");
    obj.label83:setLeft(155);
    obj.label83:setTop(3);
    obj.label83:setWidth(35);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout1);
    obj.dataLink19:setField("efetFor");
    obj.dataLink19:setName("dataLink19");


				local function getFOR()
					if debug then
						local mesa = rrpg.getMesaDe(sheet);
						mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Captando FOR");
						index = index + 1;
					end;
					local mod = tonumber(sheet.efetModFor) or 0;
					return mod;
				end;
			


    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle27);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(80);
    obj.layout2:setWidth(275);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(5);
    obj.button3:setWidth(35);
    obj.button3:setText("DES");
    obj.button3:setFontSize(11);
    obj.button3:setName("button3");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout2);
    obj.rectangle32:setLeft(45);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(35);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout2);
    obj.label84:setLeft(45);
    obj.label84:setWidth(35);
    obj.label84:setHeight(25);
    obj.label84:setField("realDes");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout2);
    obj.rectangle33:setLeft(80);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(35);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout2);
    obj.label85:setField("realModDes");
    obj.label85:setText("0");
    obj.label85:setLeft(80);
    obj.label85:setTop(3);
    obj.label85:setWidth(35);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout2);
    obj.dataLink20:setField("realDes");
    obj.dataLink20:setName("dataLink20");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout2);
    obj.rectangle34:setLeft(120);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(35);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout2);
    obj.label86:setLeft(120);
    obj.label86:setWidth(35);
    obj.label86:setHeight(25);
    obj.label86:setField("efetDes");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout2);
    obj.rectangle35:setLeft(155);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(35);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout2);
    obj.label87:setField("efetModDes");
    obj.label87:setText("0");
    obj.label87:setLeft(155);
    obj.label87:setTop(3);
    obj.label87:setWidth(35);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout2);
    obj.dataLink21:setField("efetDes");
    obj.dataLink21:setName("dataLink21");


				local function getDES()
					if debug then
						local mesa = rrpg.getMesaDe(sheet);
						mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Captando DES");
						index = index + 1;
					end;
					local mod = tonumber(sheet.efetModDes) or 0;
					return mod;
				end;
			


    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle27);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(105);
    obj.layout3:setWidth(275);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout3);
    obj.button4:setLeft(5);
    obj.button4:setWidth(35);
    obj.button4:setText("CON");
    obj.button4:setFontSize(11);
    obj.button4:setName("button4");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout3);
    obj.rectangle36:setLeft(45);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(35);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout3);
    obj.label88:setLeft(45);
    obj.label88:setWidth(35);
    obj.label88:setHeight(25);
    obj.label88:setField("realCon");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout3);
    obj.rectangle37:setLeft(80);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(35);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout3);
    obj.label89:setField("realModCon");
    obj.label89:setText("0");
    obj.label89:setLeft(80);
    obj.label89:setTop(3);
    obj.label89:setWidth(35);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout3);
    obj.dataLink22:setField("realCon");
    obj.dataLink22:setName("dataLink22");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout3);
    obj.rectangle38:setLeft(120);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(35);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout3);
    obj.label90:setLeft(120);
    obj.label90:setWidth(35);
    obj.label90:setHeight(25);
    obj.label90:setField("efetCon");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout3);
    obj.rectangle39:setLeft(155);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(35);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout3);
    obj.label91:setField("efetModCon");
    obj.label91:setText("0");
    obj.label91:setLeft(155);
    obj.label91:setTop(3);
    obj.label91:setWidth(35);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout3);
    obj.dataLink23:setField("efetCon");
    obj.dataLink23:setName("dataLink23");


				local function getCON()
					if debug then
						local mesa = rrpg.getMesaDe(sheet);
						mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Captando CON");
						index = index + 1;
					end;
					local mod = tonumber(sheet.efetModCon) or 0;
					return mod;
				end;
			


    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle27);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(130);
    obj.layout4:setWidth(275);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout4);
    obj.button5:setLeft(5);
    obj.button5:setWidth(35);
    obj.button5:setText("INT");
    obj.button5:setFontSize(11);
    obj.button5:setName("button5");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout4);
    obj.rectangle40:setLeft(45);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(35);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout4);
    obj.label92:setLeft(45);
    obj.label92:setWidth(35);
    obj.label92:setHeight(25);
    obj.label92:setField("realInt");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout4);
    obj.rectangle41:setLeft(80);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(35);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout4);
    obj.label93:setField("realModInt");
    obj.label93:setText("0");
    obj.label93:setLeft(80);
    obj.label93:setTop(3);
    obj.label93:setWidth(35);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout4);
    obj.dataLink24:setField("realInt");
    obj.dataLink24:setName("dataLink24");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout4);
    obj.rectangle42:setLeft(120);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(35);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout4);
    obj.label94:setLeft(120);
    obj.label94:setWidth(35);
    obj.label94:setHeight(25);
    obj.label94:setField("efetInt");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout4);
    obj.rectangle43:setLeft(155);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(35);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout4);
    obj.label95:setField("efetModInt");
    obj.label95:setText("0");
    obj.label95:setLeft(155);
    obj.label95:setTop(3);
    obj.label95:setWidth(35);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout4);
    obj.dataLink25:setField("efetInt");
    obj.dataLink25:setName("dataLink25");


				local function getINT()
					if debug then
						local mesa = rrpg.getMesaDe(sheet);
						mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Captando INT");
						index = index + 1;
					end;
					local mod = tonumber(sheet.efetModInt) or 0;
					return mod;
				end;
			


    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle27);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(155);
    obj.layout5:setWidth(275);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout5);
    obj.button6:setLeft(5);
    obj.button6:setWidth(35);
    obj.button6:setText("SAB");
    obj.button6:setFontSize(11);
    obj.button6:setName("button6");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout5);
    obj.rectangle44:setLeft(45);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(35);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout5);
    obj.label96:setLeft(45);
    obj.label96:setWidth(35);
    obj.label96:setHeight(25);
    obj.label96:setField("realSab");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout5);
    obj.rectangle45:setLeft(80);
    obj.rectangle45:setTop(0);
    obj.rectangle45:setWidth(35);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout5);
    obj.label97:setField("realModSab");
    obj.label97:setText("0");
    obj.label97:setLeft(80);
    obj.label97:setTop(3);
    obj.label97:setWidth(35);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout5);
    obj.dataLink26:setField("realSab");
    obj.dataLink26:setName("dataLink26");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout5);
    obj.rectangle46:setLeft(120);
    obj.rectangle46:setTop(0);
    obj.rectangle46:setWidth(35);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout5);
    obj.label98:setLeft(120);
    obj.label98:setWidth(35);
    obj.label98:setHeight(25);
    obj.label98:setField("efetSab");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout5);
    obj.rectangle47:setLeft(155);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(35);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout5);
    obj.label99:setField("efetModSab");
    obj.label99:setText("0");
    obj.label99:setLeft(155);
    obj.label99:setTop(3);
    obj.label99:setWidth(35);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout5);
    obj.dataLink27:setField("efetSab");
    obj.dataLink27:setName("dataLink27");


				local function getSAB()
					if debug then
						local mesa = rrpg.getMesaDe(sheet);
						mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Captando SAB");
						index = index + 1;
					end;
					local mod = tonumber(sheet.efetModSab) or 0;
					return mod;
				end;
			


    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle27);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(180);
    obj.layout6:setWidth(275);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout6);
    obj.button7:setLeft(5);
    obj.button7:setWidth(35);
    obj.button7:setText("CAR");
    obj.button7:setFontSize(11);
    obj.button7:setName("button7");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout6);
    obj.rectangle48:setLeft(45);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(35);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout6);
    obj.label100:setLeft(45);
    obj.label100:setWidth(35);
    obj.label100:setHeight(25);
    obj.label100:setField("realCar");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout6);
    obj.rectangle49:setLeft(80);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(35);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout6);
    obj.label101:setField("realModCar");
    obj.label101:setText("0");
    obj.label101:setLeft(80);
    obj.label101:setTop(3);
    obj.label101:setWidth(35);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout6);
    obj.dataLink28:setField("realCar");
    obj.dataLink28:setName("dataLink28");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout6);
    obj.rectangle50:setLeft(120);
    obj.rectangle50:setTop(0);
    obj.rectangle50:setWidth(35);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout6);
    obj.label102:setLeft(120);
    obj.label102:setWidth(35);
    obj.label102:setHeight(25);
    obj.label102:setField("efetCar");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout6);
    obj.rectangle51:setLeft(155);
    obj.rectangle51:setTop(0);
    obj.rectangle51:setWidth(35);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout6);
    obj.label103:setField("efetModCar");
    obj.label103:setText("0");
    obj.label103:setLeft(155);
    obj.label103:setTop(3);
    obj.label103:setWidth(35);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout6);
    obj.dataLink29:setField("efetCar");
    obj.dataLink29:setName("dataLink29");


				local function getCAR()
					if debug then
						local mesa = rrpg.getMesaDe(sheet);
						mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Captando CAR");
						index = index + 1;
					end;
					local mod = tonumber(sheet.efetModCar) or 0;
					return mod;
				end;
			


    obj.AtrBut = gui.fromHandle(_obj_newObject("button"));
    obj.AtrBut:setParent(obj.rectangle27);
    obj.AtrBut:setLeft(200);
    obj.AtrBut:setTop(55);
    obj.AtrBut:setWidth(30);
    obj.AtrBut:setHeight(150);
    obj.AtrBut:setName("AtrBut");
    obj.AtrBut:setText(">>");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(240);
    obj.layout7:setTop(115);
    obj.layout7:setWidth(235);
    obj.layout7:setHeight(215);
    obj.layout7:setName("layout7");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout7);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout7);
    obj.label104:setLeft(5);
    obj.label104:setTop(1);
    obj.label104:setWidth(225);
    obj.label104:setHeight(20);
    obj.label104:setText("DESLOCAMENTOS");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout7);
    obj.label105:setLeft(75);
    obj.label105:setTop(30);
    obj.label105:setWidth(70);
    obj.label105:setHeight(25);
    obj.label105:setText("Metros");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout7);
    obj.label106:setLeft(155);
    obj.label106:setTop(30);
    obj.label106:setWidth(70);
    obj.label106:setHeight(25);
    obj.label106:setText("Quadrados");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(55);
    obj.layout8:setWidth(225);
    obj.layout8:setHeight(20);
    obj.layout8:setName("layout8");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout8);
    obj.label107:setLeft(5);
    obj.label107:setTop(0);
    obj.label107:setWidth(70);
    obj.label107:setHeight(20);
    obj.label107:setText("TERRESTRE");
    obj.label107:setName("label107");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout8);
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(75);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(70);
    obj.edit128:setHeight(20);
    obj.edit128:setField("deslTerrestre");
    obj.edit128:setName("edit128");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout8);
    obj.rectangle53:setLeft(155);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(60);
    obj.rectangle53:setHeight(20);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout8);
    obj.label108:setLeft(155);
    obj.label108:setTop(0);
    obj.label108:setWidth(60);
    obj.label108:setHeight(20);
    obj.label108:setField("deslTerrestreQuadrados");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout8);
    obj.dataLink30:setField("deslTerrestre");
    obj.dataLink30:setName("dataLink30");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(80);
    obj.layout9:setWidth(225);
    obj.layout9:setHeight(20);
    obj.layout9:setName("layout9");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout9);
    obj.label109:setLeft(5);
    obj.label109:setTop(0);
    obj.label109:setWidth(70);
    obj.label109:setHeight(20);
    obj.label109:setText("VOO");
    obj.label109:setName("label109");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout9);
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(75);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(70);
    obj.edit129:setHeight(20);
    obj.edit129:setField("deslVoo");
    obj.edit129:setName("edit129");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout9);
    obj.rectangle54:setLeft(155);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(60);
    obj.rectangle54:setHeight(20);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout9);
    obj.label110:setLeft(155);
    obj.label110:setTop(0);
    obj.label110:setWidth(60);
    obj.label110:setHeight(20);
    obj.label110:setField("deslVooQuadrados");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout9);
    obj.dataLink31:setField("deslVoo");
    obj.dataLink31:setName("dataLink31");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout7);
    obj.label111:setLeft(50);
    obj.label111:setTop(105);
    obj.label111:setWidth(60);
    obj.label111:setHeight(20);
    obj.label111:setText("Manobra");
    obj.label111:setFontSize(11);
    obj.label111:setName("label111");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout7);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(105);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("qualidadeVoo");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({' ', 'Desajeitado', 'Ruim', 'Média', 'Boa', 'Perfeita'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(130);
    obj.layout10:setWidth(225);
    obj.layout10:setHeight(20);
    obj.layout10:setName("layout10");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout10);
    obj.label112:setLeft(5);
    obj.label112:setTop(0);
    obj.label112:setWidth(70);
    obj.label112:setHeight(20);
    obj.label112:setText("NATAÇÃO");
    obj.label112:setName("label112");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout10);
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(75);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(70);
    obj.edit130:setHeight(20);
    obj.edit130:setField("deslNatacao");
    obj.edit130:setName("edit130");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout10);
    obj.rectangle55:setLeft(155);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(60);
    obj.rectangle55:setHeight(20);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout10);
    obj.label113:setLeft(155);
    obj.label113:setTop(0);
    obj.label113:setWidth(60);
    obj.label113:setHeight(20);
    obj.label113:setField("deslNatacaoQuadrados");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout10);
    obj.dataLink32:setField("deslNatacao");
    obj.dataLink32:setName("dataLink32");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout7);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(155);
    obj.layout11:setWidth(225);
    obj.layout11:setHeight(20);
    obj.layout11:setName("layout11");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout11);
    obj.label114:setLeft(5);
    obj.label114:setTop(0);
    obj.label114:setWidth(70);
    obj.label114:setHeight(20);
    obj.label114:setText("ESCALAR");
    obj.label114:setName("label114");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout11);
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(75);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(70);
    obj.edit131:setHeight(20);
    obj.edit131:setField("deslEscalar");
    obj.edit131:setName("edit131");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout11);
    obj.rectangle56:setLeft(155);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(60);
    obj.rectangle56:setHeight(20);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout11);
    obj.label115:setLeft(155);
    obj.label115:setTop(0);
    obj.label115:setWidth(60);
    obj.label115:setHeight(20);
    obj.label115:setField("deslEscalarQuadrados");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout11);
    obj.dataLink33:setField("deslEscalar");
    obj.dataLink33:setName("dataLink33");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout7);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(180);
    obj.layout12:setWidth(225);
    obj.layout12:setHeight(20);
    obj.layout12:setName("layout12");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout12);
    obj.label116:setLeft(5);
    obj.label116:setTop(0);
    obj.label116:setWidth(70);
    obj.label116:setHeight(20);
    obj.label116:setText("ESCAVAR");
    obj.label116:setName("label116");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout12);
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(75);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(70);
    obj.edit132:setHeight(20);
    obj.edit132:setField("deslEscavar");
    obj.edit132:setName("edit132");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout12);
    obj.rectangle57:setLeft(155);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(60);
    obj.rectangle57:setHeight(20);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout12);
    obj.label117:setLeft(155);
    obj.label117:setTop(0);
    obj.label117:setWidth(60);
    obj.label117:setHeight(20);
    obj.label117:setField("deslEscavarQuadrados");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout12);
    obj.dataLink34:setField("deslEscavar");
    obj.dataLink34:setName("dataLink34");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13:setLeft(480);
    obj.layout13:setTop(115);
    obj.layout13:setWidth(260);
    obj.layout13:setHeight(55);
    obj.layout13:setName("layout13");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout13);
    obj.rectangle58:setAlign("client");
    obj.rectangle58:setColor("black");
    obj.rectangle58:setName("rectangle58");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout13);
    obj.label118:setLeft(0);
    obj.label118:setTop(1);
    obj.label118:setWidth(260);
    obj.label118:setHeight(20);
    obj.label118:setText("INICIATIVA");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout13);
    obj.button8:setLeft(35);
    obj.button8:setTop(25);
    obj.button8:setWidth(75);
    obj.button8:setHeight(25);
    obj.button8:setText("INICIATIVA");
    obj.button8:setFontSize(11);
    obj.button8:setName("button8");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout13);
    obj.rectangle59:setLeft(115);
    obj.rectangle59:setTop(25);
    obj.rectangle59:setWidth(35);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout13);
    obj.label119:setField("iniciativa");
    obj.label119:setLeft(115);
    obj.label119:setTop(27);
    obj.label119:setWidth(35);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout13);
    obj.rectangle60:setLeft(165);
    obj.rectangle60:setTop(25);
    obj.rectangle60:setWidth(35);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout13);
    obj.label120:setField("modIniciativa");
    obj.label120:setLeft(165);
    obj.label120:setTop(27);
    obj.label120:setWidth(35);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout13);
    obj.edit133:setType("number");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setLeft(205);
    obj.edit133:setTop(25);
    obj.edit133:setWidth(35);
    obj.edit133:setHeight(25);
    obj.edit133:setField("iniVariado");
    obj.edit133:setName("edit133");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout13);
    obj.dataLink35:setFields({'efetModDes', 'efetModInt', 'efetModSab', 'iniVariado'});
    obj.dataLink35:setName("dataLink35");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.scrollBox1);
    obj.rectangle61:setLeft(0);
    obj.rectangle61:setTop(335);
    obj.rectangle61:setWidth(220);
    obj.rectangle61:setHeight(165);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setName("rectangle61");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle61);
    obj.label121:setLeft(5);
    obj.label121:setTop(1);
    obj.label121:setWidth(220);
    obj.label121:setHeight(20);
    obj.label121:setText("PONTOS DE VIDA");
    obj.label121:setName("label121");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle61);
    obj.label122:setLeft(35);
    obj.label122:setTop(25);
    obj.label122:setWidth(100);
    obj.label122:setHeight(20);
    obj.label122:setText("TOTAL");
    obj.label122:setName("label122");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.rectangle61);
    obj.rectangle62:setLeft(5);
    obj.rectangle62:setTop(45);
    obj.rectangle62:setWidth(105);
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle61);
    obj.label123:setVertTextAlign("center");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setLeft(5);
    obj.label123:setTop(45);
    obj.label123:setWidth(105);
    obj.label123:setHeight(25);
    obj.label123:setField("pvTotal");
    obj.label123:setName("label123");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle61);
    obj.label124:setLeft(115);
    obj.label124:setTop(25);
    obj.label124:setWidth(100);
    obj.label124:setHeight(20);
    obj.label124:setText("EXTRA");
    obj.label124:setName("label124");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.rectangle61);
    obj.edit134:setType("number");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setLeft(110);
    obj.edit134:setTop(45);
    obj.edit134:setWidth(105);
    obj.edit134:setHeight(25);
    obj.edit134:setField("pvExtra");
    obj.edit134:setName("edit134");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle61);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(70);
    obj.textEditor2:setWidth(210);
    obj.textEditor2:setHeight(90);
    obj.textEditor2:setField("rd");
    obj.textEditor2:setName("textEditor2");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.rectangle61);
    obj.dataLink36:setFields({'efetCon','pvExtra','nep'});
    obj.dataLink36:setName("dataLink36");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14:setLeft(225);
    obj.layout14:setTop(335);
    obj.layout14:setWidth(322);
    obj.layout14:setHeight(165);
    obj.layout14:setName("layout14");

    obj.rectangle63 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout14);
    obj.rectangle63:setAlign("client");
    obj.rectangle63:setColor("black");
    obj.rectangle63:setName("rectangle63");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout14);
    obj.label125:setLeft(5);
    obj.label125:setTop(0);
    obj.label125:setWidth(321);
    obj.label125:setHeight(20);
    obj.label125:setText("BÔNUS TEMPORARIOS");
    obj.label125:setName("label125");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout14);
    obj.button9:setLeft(165);
    obj.button9:setTop(5);
    obj.button9:setWidth(85);
    obj.button9:setHeight(20);
    obj.button9:setText("CA oculta");
    obj.button9:setName("button9");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout14);
    obj.label126:setLeft(180);
    obj.label126:setTop(115);
    obj.label126:setWidth(165);
    obj.label126:setHeight(20);
    obj.label126:setText("Apenas o Mestre.");
    obj.label126:setRotationAngle(90);
    obj.label126:setName("label126");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout14);
    obj.label127:setLeft(165);
    obj.label127:setTop(30);
    obj.label127:setWidth(50);
    obj.label127:setHeight(25);
    obj.label127:setText("Alvo 1");
    obj.label127:setName("label127");

    obj.alvo1 = gui.fromHandle(_obj_newObject("edit"));
    obj.alvo1:setParent(obj.layout14);
    obj.alvo1:setLeft(205);
    obj.alvo1:setTop(30);
    obj.alvo1:setWidth(40);
    obj.alvo1:setHeight(25);
    obj.alvo1:setField("alvo1");
    obj.alvo1:setName("alvo1");
    obj.alvo1:setVisible(false);
    obj.alvo1:setType("number");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout14);
    obj.label128:setLeft(165);
    obj.label128:setTop(55);
    obj.label128:setWidth(50);
    obj.label128:setHeight(25);
    obj.label128:setText("Alvo 2");
    obj.label128:setName("label128");

    obj.alvo2 = gui.fromHandle(_obj_newObject("edit"));
    obj.alvo2:setParent(obj.layout14);
    obj.alvo2:setLeft(205);
    obj.alvo2:setTop(55);
    obj.alvo2:setWidth(40);
    obj.alvo2:setHeight(25);
    obj.alvo2:setField("alvo2");
    obj.alvo2:setName("alvo2");
    obj.alvo2:setVisible(false);
    obj.alvo2:setType("number");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout14);
    obj.label129:setLeft(165);
    obj.label129:setTop(80);
    obj.label129:setWidth(50);
    obj.label129:setHeight(25);
    obj.label129:setText("Alvo 3");
    obj.label129:setName("label129");

    obj.alvo3 = gui.fromHandle(_obj_newObject("edit"));
    obj.alvo3:setParent(obj.layout14);
    obj.alvo3:setLeft(205);
    obj.alvo3:setTop(80);
    obj.alvo3:setWidth(40);
    obj.alvo3:setHeight(25);
    obj.alvo3:setField("alvo3");
    obj.alvo3:setName("alvo3");
    obj.alvo3:setVisible(false);
    obj.alvo3:setType("number");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout14);
    obj.label130:setLeft(165);
    obj.label130:setTop(105);
    obj.label130:setWidth(50);
    obj.label130:setHeight(25);
    obj.label130:setText("Alvo 4");
    obj.label130:setName("label130");

    obj.alvo4 = gui.fromHandle(_obj_newObject("edit"));
    obj.alvo4:setParent(obj.layout14);
    obj.alvo4:setLeft(205);
    obj.alvo4:setTop(105);
    obj.alvo4:setWidth(40);
    obj.alvo4:setHeight(25);
    obj.alvo4:setField("alvo4");
    obj.alvo4:setName("alvo4");
    obj.alvo4:setVisible(false);
    obj.alvo4:setType("number");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout14);
    obj.label131:setLeft(165);
    obj.label131:setTop(130);
    obj.label131:setWidth(50);
    obj.label131:setHeight(25);
    obj.label131:setText("Alvo 5");
    obj.label131:setName("label131");

    obj.alvo5 = gui.fromHandle(_obj_newObject("edit"));
    obj.alvo5:setParent(obj.layout14);
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
						local jogadores = rrpg.getMesaDe(sheet).jogadores;
						local current = nil;
						
						for i = 1, #jogadores, 1 do
							if jogadores[i].login==rrpg.getCurrentUser().login then
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
			


    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout14);
    obj.label132:setLeft(5);
    obj.label132:setTop(30);
    obj.label132:setWidth(50);
    obj.label132:setHeight(20);
    obj.label132:setText("ATAQUE");
    obj.label132:setName("label132");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout14);
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(60);
    obj.edit135:setTop(30);
    obj.edit135:setWidth(70);
    obj.edit135:setHeight(25);
    obj.edit135:setField("buffAtaque");
    obj.edit135:setName("edit135");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout14);
    obj.label133:setLeft(5);
    obj.label133:setTop(55);
    obj.label133:setWidth(50);
    obj.label133:setHeight(20);
    obj.label133:setText("DANO");
    obj.label133:setName("label133");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout14);
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(60);
    obj.edit136:setTop(55);
    obj.edit136:setWidth(70);
    obj.edit136:setHeight(25);
    obj.edit136:setField("buffDano");
    obj.edit136:setName("edit136");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout14);
    obj.label134:setLeft(5);
    obj.label134:setTop(80);
    obj.label134:setWidth(50);
    obj.label134:setHeight(20);
    obj.label134:setText("CRITICO");
    obj.label134:setName("label134");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout14);
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(60);
    obj.edit137:setTop(80);
    obj.edit137:setWidth(70);
    obj.edit137:setHeight(25);
    obj.edit137:setField("buffDanoCritico");
    obj.edit137:setName("edit137");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout14);
    obj.label135:setLeft(5);
    obj.label135:setTop(105);
    obj.label135:setWidth(50);
    obj.label135:setHeight(20);
    obj.label135:setText("TR");
    obj.label135:setName("label135");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout14);
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(60);
    obj.edit138:setTop(105);
    obj.edit138:setWidth(70);
    obj.edit138:setHeight(25);
    obj.edit138:setField("buffTR");
    obj.edit138:setName("edit138");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout14);
    obj.label136:setLeft(5);
    obj.label136:setTop(130);
    obj.label136:setWidth(50);
    obj.label136:setHeight(20);
    obj.label136:setText("PERICIA");
    obj.label136:setName("label136");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout14);
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(60);
    obj.edit139:setTop(130);
    obj.edit139:setWidth(70);
    obj.edit139:setHeight(25);
    obj.edit139:setField("buffPericia");
    obj.edit139:setName("edit139");

    obj.rectangle64 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.scrollBox1);
    obj.rectangle64:setLeft(480);
    obj.rectangle64:setTop(175);
    obj.rectangle64:setWidth(260);
    obj.rectangle64:setHeight(155);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setName("rectangle64");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.rectangle64);
    obj.label137:setLeft(0);
    obj.label137:setTop(0);
    obj.label137:setWidth(260);
    obj.label137:setHeight(25);
    obj.label137:setText("DEFESAS");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle64);
    obj.layout15:setLeft(55);
    obj.layout15:setTop(30);
    obj.layout15:setWidth(275);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout15);
    obj.button10:setLeft(5);
    obj.button10:setWidth(45);
    obj.button10:setText("FORT");
    obj.button10:setFontSize(11);
    obj.button10:setName("button10");

    obj.rectangle65 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout15);
    obj.rectangle65:setLeft(55);
    obj.rectangle65:setTop(0);
    obj.rectangle65:setWidth(40);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout15);
    obj.label138:setLeft(55);
    obj.label138:setWidth(40);
    obj.label138:setHeight(25);
    obj.label138:setField("trFort");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle64);
    obj.layout16:setLeft(55);
    obj.layout16:setTop(55);
    obj.layout16:setWidth(275);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout16);
    obj.button11:setLeft(5);
    obj.button11:setWidth(45);
    obj.button11:setText("REF");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.rectangle66 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout16);
    obj.rectangle66:setLeft(55);
    obj.rectangle66:setTop(0);
    obj.rectangle66:setWidth(40);
    obj.rectangle66:setHeight(25);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout16);
    obj.label139:setLeft(55);
    obj.label139:setWidth(40);
    obj.label139:setHeight(25);
    obj.label139:setField("trRef");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle64);
    obj.layout17:setLeft(55);
    obj.layout17:setTop(80);
    obj.layout17:setWidth(275);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout17);
    obj.button12:setLeft(5);
    obj.button12:setWidth(45);
    obj.button12:setText("REF(T)");
    obj.button12:setFontSize(11);
    obj.button12:setName("button12");

    obj.rectangle67 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout17);
    obj.rectangle67:setLeft(55);
    obj.rectangle67:setTop(0);
    obj.rectangle67:setWidth(40);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout17);
    obj.label140:setLeft(55);
    obj.label140:setWidth(40);
    obj.label140:setHeight(25);
    obj.label140:setField("trRefT");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle64);
    obj.layout18:setLeft(55);
    obj.layout18:setTop(105);
    obj.layout18:setWidth(275);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout18);
    obj.button13:setLeft(5);
    obj.button13:setWidth(45);
    obj.button13:setText("VON");
    obj.button13:setFontSize(11);
    obj.button13:setName("button13");

    obj.rectangle68 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout18);
    obj.rectangle68:setLeft(55);
    obj.rectangle68:setTop(0);
    obj.rectangle68:setWidth(40);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout18);
    obj.label141:setLeft(55);
    obj.label141:setWidth(40);
    obj.label141:setHeight(25);
    obj.label141:setField("trVon");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.TrBut = gui.fromHandle(_obj_newObject("button"));
    obj.TrBut:setParent(obj.rectangle64);
    obj.TrBut:setLeft(160);
    obj.TrBut:setTop(30);
    obj.TrBut:setWidth(30);
    obj.TrBut:setHeight(100);
    obj.TrBut:setName("TrBut");
    obj.TrBut:setText(">>");

    obj.rectangle69 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.scrollBox1);
    obj.rectangle69:setLeft(745);
    obj.rectangle69:setTop(115);
    obj.rectangle69:setWidth(362);
    obj.rectangle69:setHeight(362);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(746);
    obj.image1:setTop(116);
    obj.image1:setWidth(360);
    obj.image1:setHeight(360);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Ataques");
    obj.tab2:setName("tab2");

    obj.frmFichaRPGmeister2_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister2_svg:setParent(obj.tab2);
    obj.frmFichaRPGmeister2_svg:setName("frmFichaRPGmeister2_svg");
    obj.frmFichaRPGmeister2_svg:setAlign("client");
    obj.frmFichaRPGmeister2_svg:setTheme("dark");
    obj.frmFichaRPGmeister2_svg:setMargins({top=1});

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmFichaRPGmeister2_svg);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.attackList = gui.fromHandle(_obj_newObject("recordList"));
    obj.attackList:setParent(obj.scrollBox2);
    obj.attackList:setAlign("client");
    obj.attackList:setField("attackList");
    obj.attackList:setName("attackList");
    obj.attackList:setTemplateForm("frmAtaqueItem");
    obj.attackList:setLayout("vertical");
    obj.attackList:setMinQt(1);

    obj.dataLink37 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.scrollBox2);
    obj.dataLink37:setField("addWeapon");
    obj.dataLink37:setName("dataLink37");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Perícias");
    obj.tab3:setName("tab3");

    obj.frmFichaRPGmeister3_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister3_svg:setParent(obj.tab3);
    obj.frmFichaRPGmeister3_svg:setName("frmFichaRPGmeister3_svg");
    obj.frmFichaRPGmeister3_svg:setAlign("client");
    obj.frmFichaRPGmeister3_svg:setTheme("dark");
    obj.frmFichaRPGmeister3_svg:setMargins({top=1});

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmFichaRPGmeister3_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");


			
			local anima = ndb.load("animaskills.xml");

			local function updateAtributes(num)
				if debug then
					rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Atributos nas Pericias. ");
					index = index + 1;
				end;
				local atr = "" .. num;
				local mod = 0;
				
				if num == 1 then
					mod = getFOR();
				elseif num == 2 then
					mod = getDES();
				elseif num == 3 then
					mod = getCON();
				elseif num == 4 then
					mod = getINT();
				elseif num == 5 then
					mod = getSAB();
				elseif num == 6 then
					mod = getCAR();
				end;

				local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					if nodes[i].chavePericia == atr then
						nodes[i].atributoPericia = mod;
					end;
				end
			end;

			local function updatePenalty()
				if debug then
					rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Penalidade nas pericias.");
					index = index + 1;
				end;
				if sheet~=nil then
					local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
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

			local function animaSkills()
				local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
				for i=1, #nodes, 1 do
					ndb.deleteNode(nodes[i]);
				end

				for i=1, 17, 1 do
					local pericia = self.rclListaDasPericias:append();
					pericia.nomePericia = anima[i].nome;
					pericia.chavePericia = anima[i].chave;
					pericia.exigeTreino = anima[i].treino;
					if anima[i].armadura > 0 then
						pericia.penalidadeArmadura = true;
					end;
				end;

				self.rclListaDasPericias:sort();
			end;
		


    obj.popPericia = gui.fromHandle(_obj_newObject("popup"));
    obj.popPericia:setParent(obj.scrollBox3);
    obj.popPericia:setName("popPericia");
    obj.popPericia:setWidth(300);
    obj.popPericia:setHeight(185);
    obj.popPericia:setBackOpacity(0.4);

    obj.flowLayout16 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.popPericia);
    obj.flowLayout16:setAlign("top");
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setMaxControlsPerLine(3);
    obj.flowLayout16:setMargins({bottom=4});
    obj.flowLayout16:setHorzAlign("center");
    obj.flowLayout16:setName("flowLayout16");

    obj.flowPart216 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart216:setParent(obj.flowLayout16);
    obj.flowPart216:setMinWidth(90);
    obj.flowPart216:setMaxWidth(100);
    obj.flowPart216:setHeight(35);
    obj.flowPart216:setName("flowPart216");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.flowPart216);
    obj.label142:setAlign("top");
    obj.label142:setFontSize(10);
    obj.label142:setText("Penalidades");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setWordWrap(true);
    obj.label142:setTextTrimming("none");
    obj.label142:setAutoSize(true);
    obj.label142:setName("label142");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.flowPart216);
    obj.edit140:setAlign("client");
    obj.edit140:setField("penalidesPericia");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setFontSize(12);
    obj.edit140:setType("number");
    obj.edit140:setName("edit140");

    obj.flowPart217 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart217:setParent(obj.flowLayout16);
    obj.flowPart217:setMinWidth(90);
    obj.flowPart217:setMaxWidth(100);
    obj.flowPart217:setHeight(35);
    obj.flowPart217:setName("flowPart217");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.flowPart217);
    obj.label143:setAlign("top");
    obj.label143:setFontSize(10);
    obj.label143:setText("Racial");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setWordWrap(true);
    obj.label143:setTextTrimming("none");
    obj.label143:setAutoSize(true);
    obj.label143:setName("label143");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.flowPart217);
    obj.edit141:setAlign("client");
    obj.edit141:setField("racialPericia");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setFontSize(12);
    obj.edit141:setType("number");
    obj.edit141:setName("edit141");

    obj.flowPart218 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart218:setParent(obj.flowLayout16);
    obj.flowPart218:setMinWidth(90);
    obj.flowPart218:setMaxWidth(100);
    obj.flowPart218:setHeight(35);
    obj.flowPart218:setName("flowPart218");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.flowPart218);
    obj.label144:setAlign("top");
    obj.label144:setFontSize(10);
    obj.label144:setText("Sinergia");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setWordWrap(true);
    obj.label144:setTextTrimming("none");
    obj.label144:setAutoSize(true);
    obj.label144:setName("label144");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.flowPart218);
    obj.edit142:setAlign("client");
    obj.edit142:setField("sinergiaPericia");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setFontSize(12);
    obj.edit142:setType("number");
    obj.edit142:setName("edit142");

    obj.flowPart219 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart219:setParent(obj.flowLayout16);
    obj.flowPart219:setMinWidth(90);
    obj.flowPart219:setMaxWidth(100);
    obj.flowPart219:setHeight(35);
    obj.flowPart219:setName("flowPart219");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.flowPart219);
    obj.label145:setAlign("top");
    obj.label145:setFontSize(10);
    obj.label145:setText("Equipamentos");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setWordWrap(true);
    obj.label145:setTextTrimming("none");
    obj.label145:setAutoSize(true);
    obj.label145:setName("label145");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.flowPart219);
    obj.edit143:setAlign("client");
    obj.edit143:setField("equipamentosPericia");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setFontSize(12);
    obj.edit143:setType("number");
    obj.edit143:setName("edit143");

    obj.flowPart220 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart220:setParent(obj.flowLayout16);
    obj.flowPart220:setMinWidth(90);
    obj.flowPart220:setMaxWidth(100);
    obj.flowPart220:setHeight(35);
    obj.flowPart220:setName("flowPart220");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.flowPart220);
    obj.label146:setAlign("top");
    obj.label146:setFontSize(10);
    obj.label146:setText("Magico");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setWordWrap(true);
    obj.label146:setTextTrimming("none");
    obj.label146:setAutoSize(true);
    obj.label146:setName("label146");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.flowPart220);
    obj.edit144:setAlign("client");
    obj.edit144:setField("magicoPericia");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setFontSize(12);
    obj.edit144:setType("number");
    obj.edit144:setName("edit144");

    obj.flowPart221 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart221:setParent(obj.flowLayout16);
    obj.flowPart221:setMinWidth(90);
    obj.flowPart221:setMaxWidth(100);
    obj.flowPart221:setHeight(35);
    obj.flowPart221:setName("flowPart221");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.flowPart221);
    obj.label147:setAlign("top");
    obj.label147:setFontSize(10);
    obj.label147:setText("Outros");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setWordWrap(true);
    obj.label147:setTextTrimming("none");
    obj.label147:setAutoSize(true);
    obj.label147:setName("label147");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.flowPart221);
    obj.edit145:setAlign("client");
    obj.edit145:setField("outrosPericia");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setFontSize(12);
    obj.edit145:setType("number");
    obj.edit145:setName("edit145");

    obj.flowPart222 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart222:setParent(obj.flowLayout16);
    obj.flowPart222:setMinWidth(90);
    obj.flowPart222:setMaxWidth(100);
    obj.flowPart222:setHeight(35);
    obj.flowPart222:setName("flowPart222");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.flowPart222);
    obj.label148:setAlign("top");
    obj.label148:setFontSize(10);
    obj.label148:setText("Talentos");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setWordWrap(true);
    obj.label148:setTextTrimming("none");
    obj.label148:setAutoSize(true);
    obj.label148:setName("label148");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.flowPart222);
    obj.edit146:setAlign("client");
    obj.edit146:setField("talentosPericia");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setFontSize(12);
    obj.edit146:setType("number");
    obj.edit146:setName("edit146");

    obj.flowPart223 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart223:setParent(obj.flowLayout16);
    obj.flowPart223:setMinWidth(90);
    obj.flowPart223:setMaxWidth(100);
    obj.flowPart223:setHeight(35);
    obj.flowPart223:setName("flowPart223");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.flowPart223);
    obj.label149:setAlign("top");
    obj.label149:setFontSize(10);
    obj.label149:setText("Classe");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setWordWrap(true);
    obj.label149:setTextTrimming("none");
    obj.label149:setAutoSize(true);
    obj.label149:setName("label149");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.flowPart223);
    obj.edit147:setAlign("client");
    obj.edit147:setField("classePericia");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setFontSize(12);
    obj.edit147:setType("number");
    obj.edit147:setName("edit147");

    obj.flowPart224 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart224:setParent(obj.flowLayout16);
    obj.flowPart224:setMinWidth(90);
    obj.flowPart224:setMaxWidth(100);
    obj.flowPart224:setHeight(35);
    obj.flowPart224:setName("flowPart224");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.flowPart224);
    obj.label150:setAlign("top");
    obj.label150:setFontSize(10);
    obj.label150:setText("Condicional");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setWordWrap(true);
    obj.label150:setTextTrimming("none");
    obj.label150:setAutoSize(true);
    obj.label150:setName("label150");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.flowPart224);
    obj.edit148:setAlign("client");
    obj.edit148:setField("condicionalPericia");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setFontSize(12);
    obj.edit148:setType("number");
    obj.edit148:setName("edit148");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popPericia);
    obj.textEditor3:setAlign("bottom");
    obj.textEditor3:setField("descricao");
    obj.textEditor3:setName("textEditor3");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.popPericia);
    obj.checkBox28:setAlign("right");
    obj.checkBox28:setText("Penalidade Armadura");
    obj.checkBox28:setField("penalidadeArmadura");
    obj.checkBox28:setName("checkBox28");

    obj.popIdioma = gui.fromHandle(_obj_newObject("popup"));
    obj.popIdioma:setParent(obj.scrollBox3);
    obj.popIdioma:setName("popIdioma");
    obj.popIdioma:setWidth(200);
    obj.popIdioma:setHeight(100);
    obj.popIdioma:setBackOpacity(0.4);

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.popIdioma);
    obj.checkBox29:setAlign("top");
    obj.checkBox29:setText("Falar/Entender");
    obj.checkBox29:setField("conversarIdioma");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.popIdioma);
    obj.checkBox30:setAlign("top");
    obj.checkBox30:setText("Escrever/Ler");
    obj.checkBox30:setField("escritaIdioma");
    obj.checkBox30:setName("checkBox30");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.popIdioma);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("descricao");
    obj.textEditor4:setName("textEditor4");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox3);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(0);
    obj.layout19:setWidth(930);
    obj.layout19:setHeight(685);
    obj.layout19:setName("layout19");

    obj.rectangle70 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout19);
    obj.rectangle70:setAlign("client");
    obj.rectangle70:setColor("black");
    obj.rectangle70:setName("rectangle70");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout19);
    obj.label151:setText("NOME DA PERÍCIA");
    obj.label151:setLeft(20);
    obj.label151:setTop(1);
    obj.label151:setWidth(135);
    obj.label151:setHeight(20);
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout19);
    obj.label152:setText("CHAVE");
    obj.label152:setLeft(165);
    obj.label152:setTop(1);
    obj.label152:setWidth(60);
    obj.label152:setHeight(20);
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout19);
    obj.label153:setText("TOTAL");
    obj.label153:setLeft(220);
    obj.label153:setTop(1);
    obj.label153:setWidth(40);
    obj.label153:setHeight(20);
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout19);
    obj.label154:setText("ATR");
    obj.label154:setLeft(265);
    obj.label154:setTop(1);
    obj.label154:setWidth(33);
    obj.label154:setHeight(20);
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout19);
    obj.label155:setText("GRAD");
    obj.label155:setLeft(320);
    obj.label155:setTop(1);
    obj.label155:setWidth(40);
    obj.label155:setHeight(20);
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout19);
    obj.label156:setText("NOME DA PERÍCIA");
    obj.label156:setLeft(465);
    obj.label156:setTop(1);
    obj.label156:setWidth(135);
    obj.label156:setHeight(20);
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout19);
    obj.label157:setText("CHAVE");
    obj.label157:setLeft(610);
    obj.label157:setTop(1);
    obj.label157:setWidth(60);
    obj.label157:setHeight(20);
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout19);
    obj.label158:setText("TOTAL");
    obj.label158:setLeft(665);
    obj.label158:setTop(1);
    obj.label158:setWidth(40);
    obj.label158:setHeight(20);
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout19);
    obj.label159:setText("ATR");
    obj.label159:setLeft(710);
    obj.label159:setTop(1);
    obj.label159:setWidth(33);
    obj.label159:setHeight(20);
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout19);
    obj.label160:setText("GRAD");
    obj.label160:setLeft(765);
    obj.label160:setTop(1);
    obj.label160:setWidth(40);
    obj.label160:setHeight(20);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.rclListaDasPericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasPericias:setParent(obj.layout19);
    obj.rclListaDasPericias:setName("rclListaDasPericias");
    obj.rclListaDasPericias:setField("campoDasPericias");
    obj.rclListaDasPericias:setTemplateForm("frmFichaRPGmeister3p_svg");
    obj.rclListaDasPericias:setLeft(5);
    obj.rclListaDasPericias:setTop(25);
    obj.rclListaDasPericias:setWidth(920);
    obj.rclListaDasPericias:setHeight(650);
    obj.rclListaDasPericias:setLayout("verticalTiles");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox3);
    obj.layout20:setLeft(940);
    obj.layout20:setTop(0);
    obj.layout20:setWidth(300);
    obj.layout20:setHeight(400);
    obj.layout20:setName("layout20");

    obj.rectangle71 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout20);
    obj.rectangle71:setAlign("client");
    obj.rectangle71:setColor("black");
    obj.rectangle71:setName("rectangle71");

    obj.checkBox31 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout20);
    obj.checkBox31:setLeft(60);
    obj.checkBox31:setTop(5);
    obj.checkBox31:setWidth(19);
    obj.checkBox31:setHeight(15);
    obj.checkBox31:setField("idiomasIsClass");
    obj.checkBox31:setName("checkBox31");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout20);
    obj.label161:setText("FALAR IDIOMAS");
    obj.label161:setLeft(80);
    obj.label161:setTop(1);
    obj.label161:setWidth(135);
    obj.label161:setHeight(20);
    obj.label161:setName("label161");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout20);
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setLeft(50);
    obj.edit149:setTop(25);
    obj.edit149:setWidth(30);
    obj.edit149:setHeight(20);
    obj.edit149:setField("idiomasGrad");
    obj.edit149:setType("float");
    obj.edit149:setName("edit149");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout20);
    obj.label162:setText("Graduações");
    obj.label162:setLeft(90);
    obj.label162:setTop(25);
    obj.label162:setWidth(135);
    obj.label162:setHeight(20);
    obj.label162:setName("label162");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout20);
    obj.label163:setText("Idioma");
    obj.label163:setLeft(0);
    obj.label163:setTop(55);
    obj.label163:setWidth(110);
    obj.label163:setHeight(20);
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout20);
    obj.label164:setText("Alfabeto");
    obj.label164:setLeft(110);
    obj.label164:setTop(55);
    obj.label164:setWidth(110);
    obj.label164:setHeight(20);
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.rclListaDosIdiomas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosIdiomas:setParent(obj.layout20);
    obj.rclListaDosIdiomas:setName("rclListaDosIdiomas");
    obj.rclListaDosIdiomas:setField("campoDosIdiomas");
    obj.rclListaDosIdiomas:setTemplateForm("frmFichaRPGmeister3i_svg");
    obj.rclListaDosIdiomas:setLeft(5);
    obj.rclListaDosIdiomas:setTop(75);
    obj.rclListaDosIdiomas:setWidth(290);
    obj.rclListaDosIdiomas:setHeight(320);
    obj.rclListaDosIdiomas:setLayout("vertical");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox3);
    obj.layout21:setLeft(940);
    obj.layout21:setTop(410);
    obj.layout21:setWidth(135);
    obj.layout21:setHeight(100);
    obj.layout21:setName("layout21");

    obj.rectangle72 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout21);
    obj.rectangle72:setAlign("client");
    obj.rectangle72:setColor("black");
    obj.rectangle72:setName("rectangle72");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout21);
    obj.label165:setText("PONTOS GASTOS");
    obj.label165:setLeft(0);
    obj.label165:setTop(0);
    obj.label165:setWidth(135);
    obj.label165:setHeight(20);
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout21);
    obj.label166:setLeft(10);
    obj.label166:setTop(30);
    obj.label166:setWidth(70);
    obj.label166:setHeight(20);
    obj.label166:setText("DnD3.5");
    obj.label166:setName("label166");

    obj.rectangle73 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout21);
    obj.rectangle73:setLeft(80);
    obj.rectangle73:setTop(30);
    obj.rectangle73:setWidth(37);
    obj.rectangle73:setHeight(20);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout21);
    obj.label167:setField("pontosPericia");
    obj.label167:setLeft(80);
    obj.label167:setTop(30);
    obj.label167:setWidth(37);
    obj.label167:setHeight(20);
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox3);
    obj.layout22:setLeft(940);
    obj.layout22:setTop(520);
    obj.layout22:setWidth(135);
    obj.layout22:setHeight(200);
    obj.layout22:setName("layout22");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout22);
    obj.button14:setText("Nova Perícia");
    obj.button14:setLeft(0);
    obj.button14:setTop(0);
    obj.button14:setWidth(125);
    obj.button14:setHeight(25);
    obj.button14:setName("button14");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout22);
    obj.button15:setText("Novo Idioma");
    obj.button15:setLeft(0);
    obj.button15:setTop(25);
    obj.button15:setWidth(125);
    obj.button15:setHeight(25);
    obj.button15:setName("button15");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout22);
    obj.button16:setText("Padrão Anima");
    obj.button16:setLeft(0);
    obj.button16:setTop(50);
    obj.button16:setWidth(125);
    obj.button16:setHeight(25);
    obj.button16:setHint("Vai apagar todas perícias atuais. ");
    obj.button16:setName("button16");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Habilidades");
    obj.tab4:setName("tab4");

    obj.frmFichaRPGmeister4_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister4_svg:setParent(obj.tab4);
    obj.frmFichaRPGmeister4_svg:setName("frmFichaRPGmeister4_svg");
    obj.frmFichaRPGmeister4_svg:setAlign("client");
    obj.frmFichaRPGmeister4_svg:setTheme("dark");
    obj.frmFichaRPGmeister4_svg:setMargins({top=1});

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmFichaRPGmeister4_svg);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.popHabilidade = gui.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.scrollBox4);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(300);
    obj.popHabilidade:setHeight(240);
    obj.popHabilidade:setBackOpacity(0.4);

    obj.flowLayout17 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.popHabilidade);
    obj.flowLayout17:setAlign("top");
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setMaxControlsPerLine(3);
    obj.flowLayout17:setMargins({bottom=4});
    obj.flowLayout17:setHorzAlign("center");
    obj.flowLayout17:setName("flowLayout17");

    obj.flowPart225 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart225:setParent(obj.flowLayout17);
    obj.flowPart225:setMinWidth(90);
    obj.flowPart225:setMaxWidth(100);
    obj.flowPart225:setHeight(35);
    obj.flowPart225:setName("flowPart225");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.flowPart225);
    obj.label168:setAlign("top");
    obj.label168:setFontSize(10);
    obj.label168:setText("Nível");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setWordWrap(true);
    obj.label168:setTextTrimming("none");
    obj.label168:setAutoSize(true);
    obj.label168:setName("label168");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.flowPart225);
    obj.edit150:setAlign("client");
    obj.edit150:setField("nivelHabilidade");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setFontSize(12);
    obj.edit150:setType("number");
    obj.edit150:setName("edit150");

    obj.flowPart226 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart226:setParent(obj.flowLayout17);
    obj.flowPart226:setMinWidth(180);
    obj.flowPart226:setMaxWidth(200);
    obj.flowPart226:setHeight(35);
    obj.flowPart226:setName("flowPart226");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.flowPart226);
    obj.label169:setAlign("top");
    obj.label169:setFontSize(10);
    obj.label169:setText("Obtido");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setWordWrap(true);
    obj.label169:setTextTrimming("none");
    obj.label169:setAutoSize(true);
    obj.label169:setName("label169");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.flowPart226);
    obj.edit151:setAlign("client");
    obj.edit151:setField("obtencaoHabilidade");
    obj.edit151:setFontSize(12);
    obj.edit151:setName("edit151");

    obj.flowPart227 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart227:setParent(obj.flowLayout17);
    obj.flowPart227:setMinWidth(90);
    obj.flowPart227:setMaxWidth(100);
    obj.flowPart227:setHeight(35);
    obj.flowPart227:setName("flowPart227");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.flowPart227);
    obj.label170:setAlign("top");
    obj.label170:setFontSize(10);
    obj.label170:setText("Página");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setWordWrap(true);
    obj.label170:setTextTrimming("none");
    obj.label170:setAutoSize(true);
    obj.label170:setName("label170");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.flowPart227);
    obj.edit152:setAlign("client");
    obj.edit152:setField("paginaHabilidade");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setFontSize(12);
    obj.edit152:setType("number");
    obj.edit152:setName("edit152");

    obj.flowPart228 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart228:setParent(obj.flowLayout17);
    obj.flowPart228:setMinWidth(180);
    obj.flowPart228:setMaxWidth(200);
    obj.flowPart228:setHeight(35);
    obj.flowPart228:setName("flowPart228");

    obj.label171 = gui.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.flowPart228);
    obj.label171:setAlign("top");
    obj.label171:setFontSize(10);
    obj.label171:setText("Livro");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setWordWrap(true);
    obj.label171:setTextTrimming("none");
    obj.label171:setAutoSize(true);
    obj.label171:setName("label171");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.flowPart228);
    obj.edit153:setAlign("client");
    obj.edit153:setField("livroHabilidade");
    obj.edit153:setFontSize(12);
    obj.edit153:setName("edit153");

    obj.dataLink38 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.flowLayout17);
    obj.dataLink38:setField("nivelHabilidade");
    obj.dataLink38:setName("dataLink38");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.popHabilidade);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("descricao");
    obj.textEditor5:setName("textEditor5");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox4);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(0);
    obj.layout23:setWidth(380);
    obj.layout23:setHeight(600);
    obj.layout23:setName("layout23");

    obj.rectangle74 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout23);
    obj.rectangle74:setAlign("client");
    obj.rectangle74:setColor("#0000007F");
    obj.rectangle74:setName("rectangle74");

    obj.label172 = gui.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout23);
    obj.label172:setLeft(0);
    obj.label172:setTop(0);
    obj.label172:setWidth(380);
    obj.label172:setHeight(20);
    obj.label172:setText("TALENTOS");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.rclListaDosTalentos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTalentos:setParent(obj.layout23);
    obj.rclListaDosTalentos:setName("rclListaDosTalentos");
    obj.rclListaDosTalentos:setField("campoDosTalentos");
    obj.rclListaDosTalentos:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosTalentos:setLeft(5);
    obj.rclListaDosTalentos:setTop(25);
    obj.rclListaDosTalentos:setWidth(370);
    obj.rclListaDosTalentos:setHeight(570);
    obj.rclListaDosTalentos:setLayout("vertical");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox4);
    obj.layout24:setLeft(395);
    obj.layout24:setTop(0);
    obj.layout24:setWidth(380);
    obj.layout24:setHeight(600);
    obj.layout24:setName("layout24");

    obj.rectangle75 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout24);
    obj.rectangle75:setAlign("client");
    obj.rectangle75:setColor("#0000007F");
    obj.rectangle75:setName("rectangle75");

    obj.label173 = gui.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout24);
    obj.label173:setLeft(0);
    obj.label173:setTop(0);
    obj.label173:setWidth(380);
    obj.label173:setHeight(20);
    obj.label173:setText("OUTROS");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.rclListaDosOutros = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros:setParent(obj.layout24);
    obj.rclListaDosOutros:setName("rclListaDosOutros");
    obj.rclListaDosOutros:setField("campoDosOutros");
    obj.rclListaDosOutros:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosOutros:setLeft(5);
    obj.rclListaDosOutros:setTop(25);
    obj.rclListaDosOutros:setWidth(370);
    obj.rclListaDosOutros:setHeight(570);
    obj.rclListaDosOutros:setLayout("vertical");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox4);
    obj.layout25:setLeft(790);
    obj.layout25:setTop(0);
    obj.layout25:setWidth(380);
    obj.layout25:setHeight(600);
    obj.layout25:setName("layout25");

    obj.rectangle76 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout25);
    obj.rectangle76:setAlign("client");
    obj.rectangle76:setColor("#0000007F");
    obj.rectangle76:setName("rectangle76");

    obj.label174 = gui.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout25);
    obj.label174:setLeft(0);
    obj.label174:setTop(0);
    obj.label174:setWidth(380);
    obj.label174:setHeight(20);
    obj.label174:setText("CARACTERISTICAS DE CLASSE");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.rclListaDasCaracteristicasClasse = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasCaracteristicasClasse:setParent(obj.layout25);
    obj.rclListaDasCaracteristicasClasse:setName("rclListaDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDasCaracteristicasClasse:setLeft(5);
    obj.rclListaDasCaracteristicasClasse:setTop(25);
    obj.rclListaDasCaracteristicasClasse:setWidth(370);
    obj.rclListaDasCaracteristicasClasse:setHeight(570);
    obj.rclListaDasCaracteristicasClasse:setLayout("vertical");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox4);
    obj.layout26:setLeft(1180);
    obj.layout26:setTop(0);
    obj.layout26:setWidth(135);
    obj.layout26:setHeight(600);
    obj.layout26:setName("layout26");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout26);
    obj.button17:setText("Novo Talento");
    obj.button17:setLeft(0);
    obj.button17:setTop(0);
    obj.button17:setWidth(125);
    obj.button17:setHeight(25);
    obj.button17:setName("button17");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout26);
    obj.button18:setText("Novo Outros");
    obj.button18:setLeft(0);
    obj.button18:setTop(25);
    obj.button18:setWidth(125);
    obj.button18:setHeight(25);
    obj.button18:setName("button18");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout26);
    obj.button19:setText("Nova Caracteristica");
    obj.button19:setLeft(0);
    obj.button19:setTop(50);
    obj.button19:setWidth(125);
    obj.button19:setHeight(25);
    obj.button19:setName("button19");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Magias");
    obj.tab5:setName("tab5");

    obj.frmFichaRPGmeister5M_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister5M_svg:setParent(obj.tab5);
    obj.frmFichaRPGmeister5M_svg:setName("frmFichaRPGmeister5M_svg");
    obj.frmFichaRPGmeister5M_svg:setAlign("client");
    obj.frmFichaRPGmeister5M_svg:setTheme("dark");
    obj.frmFichaRPGmeister5M_svg:setMargins({top=1});

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmFichaRPGmeister5M_svg);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox5);
    obj.layout27:setLeft(1205);
    obj.layout27:setTop(0);
    obj.layout27:setWidth(30);
    obj.layout27:setHeight(30);
    obj.layout27:setMargins({bottom=4});
    obj.layout27:setName("layout27");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout27);
    obj.button20:setText("+");
    obj.button20:setWidth(30);
    obj.button20:setAlign("left");
    obj.button20:setName("button20");

    obj.rectangle77 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.scrollBox5);
    obj.rectangle77:setLeft(0);
    obj.rectangle77:setTop(0);
    obj.rectangle77:setWidth(1200);
    obj.rectangle77:setHeight(46);
    obj.rectangle77:setColor("gray");
    obj.rectangle77:setName("rectangle77");

    obj.rclListaDosItens = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.scrollBox5);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmFichaRPGmeister5MM_svg");
    obj.rclListaDosItens:setLeft(0);
    obj.rclListaDosItens:setTop(0);
    obj.rclListaDosItens:setWidth(1200);
    obj.rclListaDosItens:setHeight(46);
    obj.rclListaDosItens:setSelectable(true);
    obj.rclListaDosItens:setLayout("horizontal");

    obj.boxDetalhesDoItem = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox5);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setLeft(0);
    obj.boxDetalhesDoItem:setTop(50);
    obj.boxDetalhesDoItem:setWidth(1200);
    obj.boxDetalhesDoItem:setHeight(600);

    obj.label175 = gui.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.boxDetalhesDoItem);
    obj.label175:setVertTextAlign("center");
    obj.label175:setLeft(5);
    obj.label175:setTop(10);
    obj.label175:setWidth(50);
    obj.label175:setHeight(25);
    obj.label175:setText("Classe");
    obj.label175:setName("label175");
    obj.label175:setFontColor("white");
    obj.label175:setTextTrimming("none");
    obj.label175:setWordWrap(false);
    obj.label175:setAutoSize(true);

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.boxDetalhesDoItem);
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(50);
    obj.edit154:setTop(5);
    obj.edit154:setWidth(150);
    obj.edit154:setHeight(25);
    obj.edit154:setField("classeMagia");
    obj.edit154:setName("edit154");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.boxDetalhesDoItem);
    obj.button21:setLeft(203);
    obj.button21:setTop(8);
    obj.button21:setWidth(30);
    obj.button21:setHeight(20);
    obj.button21:setText("NC");
    obj.button21:setName("button21");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.boxDetalhesDoItem);
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(235);
    obj.edit155:setTop(5);
    obj.edit155:setWidth(100);
    obj.edit155:setHeight(25);
    obj.edit155:setField("NC");
    obj.edit155:setName("edit155");

    obj.label176 = gui.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.boxDetalhesDoItem);
    obj.label176:setVertTextAlign("center");
    obj.label176:setLeft(340);
    obj.label176:setTop(10);
    obj.label176:setWidth(30);
    obj.label176:setHeight(25);
    obj.label176:setText("PM");
    obj.label176:setName("label176");
    obj.label176:setFontColor("white");
    obj.label176:setTextTrimming("none");
    obj.label176:setWordWrap(false);
    obj.label176:setAutoSize(true);

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.boxDetalhesDoItem);
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(375);
    obj.edit156:setTop(5);
    obj.edit156:setWidth(100);
    obj.edit156:setHeight(25);
    obj.edit156:setField("PM");
    obj.edit156:setName("edit156");

    obj.label177 = gui.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.boxDetalhesDoItem);
    obj.label177:setVertTextAlign("center");
    obj.label177:setLeft(480);
    obj.label177:setTop(10);
    obj.label177:setWidth(30);
    obj.label177:setHeight(25);
    obj.label177:setText("Usos");
    obj.label177:setName("label177");
    obj.label177:setFontColor("white");
    obj.label177:setTextTrimming("none");
    obj.label177:setWordWrap(false);
    obj.label177:setAutoSize(true);

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.boxDetalhesDoItem);
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(515);
    obj.edit157:setTop(5);
    obj.edit157:setWidth(100);
    obj.edit157:setHeight(25);
    obj.edit157:setField("usos");
    obj.edit157:setName("edit157");

    obj.label178 = gui.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.boxDetalhesDoItem);
    obj.label178:setVertTextAlign("center");
    obj.label178:setLeft(620);
    obj.label178:setTop(10);
    obj.label178:setWidth(35);
    obj.label178:setHeight(25);
    obj.label178:setText("Outros");
    obj.label178:setName("label178");
    obj.label178:setFontColor("white");
    obj.label178:setTextTrimming("none");
    obj.label178:setWordWrap(false);
    obj.label178:setAutoSize(true);

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.boxDetalhesDoItem);
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(665);
    obj.edit158:setTop(5);
    obj.edit158:setWidth(535);
    obj.edit158:setHeight(25);
    obj.edit158:setField("magiasOutros");
    obj.edit158:setName("edit158");


				local function limpar()
					if self.boxDetalhesDoItem.node~= nil then
						if debug then
							rrpg.getMesaDe(self.boxDetalhesDoItem.node).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Visibilidade da pagina de magias. ");
							index = index + 1;
						end;
						local mod = self.boxDetalhesDoItem.node.tipoMagia;
						if mod=='1' then
							self.layoutMagias.visible = true;
							self.layoutSignos.visible = false;
							self.layoutListaMagias.visible = false;
							self.layoutMagiasEpicas.visible = false;
							self.layoutMagiasAprimoradas.visible = false;
						elseif mod=='2' then
							self.layoutMagias.visible = false;
							self.layoutSignos.visible = true;
							self.layoutListaMagias.visible = false;
							self.layoutMagiasEpicas.visible = false;
							self.layoutMagiasAprimoradas.visible = false;
						elseif mod=='3' then
							self.layoutMagias.visible = false;
							self.layoutSignos.visible = false;
							self.layoutListaMagias.visible = true;
							self.layoutMagiasEpicas.visible = false;
							self.layoutMagiasAprimoradas.visible = false;
						elseif mod=='7' then
							self.layoutMagias.visible = false;
							self.layoutSignos.visible = false;
							self.layoutListaMagias.visible = false;
							self.layoutMagiasEpicas.visible = true;
							self.layoutMagiasAprimoradas.visible = false;
						elseif mod=='8' then
							self.layoutMagias.visible = false;
							self.layoutSignos.visible = false;
							self.layoutListaMagias.visible = false;
							self.layoutMagiasEpicas.visible = false;
							self.layoutMagiasAprimoradas.visible = true;
						else
							self.layoutMagias.visible = false;
							self.layoutSignos.visible = false;
							self.layoutListaMagias.visible = false;
							self.layoutMagiasEpicas.visible = false;
							self.layoutMagiasAprimoradas.visible = false;
						end
					end
				end;
			


    obj.rectangle78 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.boxDetalhesDoItem);
    obj.rectangle78:setLeft(5);
    obj.rectangle78:setTop(40);
    obj.rectangle78:setWidth(330);
    obj.rectangle78:setHeight(370);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setCornerType("round");
    obj.rectangle78:setXradius(15);
    obj.rectangle78:setYradius(15);
    obj.rectangle78:setName("rectangle78");

    obj.layoutMagias = gui.fromHandle(_obj_newObject("layout"));
    obj.layoutMagias:setParent(obj.boxDetalhesDoItem);
    obj.layoutMagias:setLeft(0);
    obj.layoutMagias:setTop(50);
    obj.layoutMagias:setWidth(1200);
    obj.layoutMagias:setHeight(550);
    obj.layoutMagias:setName("layoutMagias");
    obj.layoutMagias:setVisible(false);

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layoutMagias);
    obj.layout28:setLeft(10);
    obj.layout28:setTop(0);
    obj.layout28:setWidth(350);
    obj.layout28:setHeight(350);
    obj.layout28:setName("layout28");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout28);
    obj.comboBox2:setLeft(115);
    obj.comboBox2:setTop(0);
    obj.comboBox2:setWidth(60);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox2:setField("atributoBonus");
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout28);
    obj.comboBox3:setLeft(260);
    obj.comboBox3:setTop(0);
    obj.comboBox3:setWidth(60);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox3:setField("atributoCD");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setName("comboBox3");

    obj.rectangle79 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout28);
    obj.rectangle79:setLeft(210);
    obj.rectangle79:setTop(0);
    obj.rectangle79:setWidth(30);
    obj.rectangle79:setHeight(25);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setName("rectangle79");

    obj.label179 = gui.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout28);
    obj.label179:setLeft(211);
    obj.label179:setTop(0);
    obj.label179:setWidth(30);
    obj.label179:setHeight(25);
    obj.label179:setField("grimorio");
    obj.label179:setHorzTextAlign("center");
    obj.label179:setName("label179");
    obj.label179:setFontColor("white");
    obj.label179:setTextTrimming("none");
    obj.label179:setWordWrap(false);
    obj.label179:setAutoSize(true);

    obj.dataLink39 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout28);
    obj.dataLink39:setFields({'conhecidas0', 'conhecidas1', 'conhecidas2', 'conhecidas3', 'conhecidas4', 'conhecidas5', 'conhecidas6', 'conhecidas7', 'conhecidas8', 'conhecidas9'});
    obj.dataLink39:setName("dataLink39");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout28);
    obj.layout29:setLeft(0);
    obj.layout29:setTop(25);
    obj.layout29:setWidth(350);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.label180 = gui.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout29);
    obj.label180:setVertTextAlign("center");
    obj.label180:setLeft(0);
    obj.label180:setTop(3);
    obj.label180:setWidth(25);
    obj.label180:setHeight(22);
    obj.label180:setText("NÍVEL");
    obj.label180:setName("label180");
    obj.label180:setFontColor("white");
    obj.label180:setTextTrimming("none");
    obj.label180:setWordWrap(false);
    obj.label180:setAutoSize(true);

    obj.label181 = gui.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout29);
    obj.label181:setVertTextAlign("center");
    obj.label181:setLeft(40);
    obj.label181:setTop(3);
    obj.label181:setWidth(25);
    obj.label181:setHeight(22);
    obj.label181:setText("TOTAL");
    obj.label181:setName("label181");
    obj.label181:setFontColor("white");
    obj.label181:setTextTrimming("none");
    obj.label181:setWordWrap(false);
    obj.label181:setAutoSize(true);

    obj.label182 = gui.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout29);
    obj.label182:setVertTextAlign("center");
    obj.label182:setLeft(85);
    obj.label182:setTop(3);
    obj.label182:setWidth(25);
    obj.label182:setHeight(22);
    obj.label182:setText("BASE");
    obj.label182:setName("label182");
    obj.label182:setFontColor("white");
    obj.label182:setTextTrimming("none");
    obj.label182:setWordWrap(false);
    obj.label182:setAutoSize(true);

    obj.label183 = gui.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout29);
    obj.label183:setVertTextAlign("center");
    obj.label183:setLeft(125);
    obj.label183:setTop(3);
    obj.label183:setWidth(25);
    obj.label183:setHeight(22);
    obj.label183:setText("BONUS");
    obj.label183:setName("label183");
    obj.label183:setFontColor("white");
    obj.label183:setTextTrimming("none");
    obj.label183:setWordWrap(false);
    obj.label183:setAutoSize(true);

    obj.label184 = gui.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout29);
    obj.label184:setVertTextAlign("center");
    obj.label184:setLeft(180);
    obj.label184:setTop(3);
    obj.label184:setWidth(25);
    obj.label184:setHeight(22);
    obj.label184:setText("CONHECIDAS");
    obj.label184:setName("label184");
    obj.label184:setFontColor("white");
    obj.label184:setTextTrimming("none");
    obj.label184:setWordWrap(false);
    obj.label184:setAutoSize(true);

    obj.label185 = gui.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout29);
    obj.label185:setVertTextAlign("center");
    obj.label185:setLeft(270);
    obj.label185:setTop(3);
    obj.label185:setWidth(25);
    obj.label185:setHeight(22);
    obj.label185:setText("CD");
    obj.label185:setName("label185");
    obj.label185:setFontColor("white");
    obj.label185:setTextTrimming("none");
    obj.label185:setWordWrap(false);
    obj.label185:setAutoSize(true);

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout28);
    obj.layout30:setLeft(0);
    obj.layout30:setTop(55);
    obj.layout30:setWidth(350);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.label186 = gui.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout30);
    obj.label186:setVertTextAlign("center");
    obj.label186:setLeft(10);
    obj.label186:setTop(3);
    obj.label186:setWidth(25);
    obj.label186:setHeight(22);
    obj.label186:setText("0");
    obj.label186:setName("label186");
    obj.label186:setFontColor("white");
    obj.label186:setTextTrimming("none");
    obj.label186:setWordWrap(false);
    obj.label186:setAutoSize(true);

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout30);
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(45);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(30);
    obj.edit159:setHeight(25);
    obj.edit159:setField("total0");
    obj.edit159:setType("number");
    obj.edit159:setName("edit159");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout30);
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(85);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(30);
    obj.edit160:setHeight(25);
    obj.edit160:setField("base0");
    obj.edit160:setType("number");
    obj.edit160:setName("edit160");

    obj.label187 = gui.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout30);
    obj.label187:setVertTextAlign("center");
    obj.label187:setLeft(140);
    obj.label187:setTop(0);
    obj.label187:setWidth(30);
    obj.label187:setHeight(25);
    obj.label187:setField("bonus0");
    obj.label187:setName("label187");
    obj.label187:setFontColor("white");
    obj.label187:setTextTrimming("none");
    obj.label187:setWordWrap(false);
    obj.label187:setAutoSize(true);

    obj.dataLink40 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout30);
    obj.dataLink40:setFields({'base0', 'bonus0'});
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout30);
    obj.dataLink41:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink41:setName("dataLink41");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout30);
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setLeft(210);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(30);
    obj.edit161:setHeight(25);
    obj.edit161:setField("conhecidas0");
    obj.edit161:setType("number");
    obj.edit161:setName("edit161");

    obj.label188 = gui.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout30);
    obj.label188:setVertTextAlign("center");
    obj.label188:setLeft(270);
    obj.label188:setTop(0);
    obj.label188:setWidth(30);
    obj.label188:setHeight(25);
    obj.label188:setField("cd0");
    obj.label188:setName("label188");
    obj.label188:setFontColor("white");
    obj.label188:setTextTrimming("none");
    obj.label188:setWordWrap(false);
    obj.label188:setAutoSize(true);

    obj.dataLink42 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout30);
    obj.dataLink42:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink42:setName("dataLink42");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout28);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(85);
    obj.layout31:setWidth(350);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label189 = gui.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout31);
    obj.label189:setVertTextAlign("center");
    obj.label189:setLeft(10);
    obj.label189:setTop(3);
    obj.label189:setWidth(25);
    obj.label189:setHeight(22);
    obj.label189:setText("1");
    obj.label189:setName("label189");
    obj.label189:setFontColor("white");
    obj.label189:setTextTrimming("none");
    obj.label189:setWordWrap(false);
    obj.label189:setAutoSize(true);

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout31);
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setLeft(45);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(30);
    obj.edit162:setHeight(25);
    obj.edit162:setField("total1");
    obj.edit162:setType("number");
    obj.edit162:setName("edit162");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout31);
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setLeft(85);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(30);
    obj.edit163:setHeight(25);
    obj.edit163:setField("base1");
    obj.edit163:setType("number");
    obj.edit163:setName("edit163");

    obj.label190 = gui.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout31);
    obj.label190:setVertTextAlign("center");
    obj.label190:setLeft(140);
    obj.label190:setTop(0);
    obj.label190:setWidth(30);
    obj.label190:setHeight(25);
    obj.label190:setField("bonus1");
    obj.label190:setName("label190");
    obj.label190:setFontColor("white");
    obj.label190:setTextTrimming("none");
    obj.label190:setWordWrap(false);
    obj.label190:setAutoSize(true);

    obj.dataLink43 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout31);
    obj.dataLink43:setFields({'base1', 'bonus1'});
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout31);
    obj.dataLink44:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink44:setName("dataLink44");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout31);
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setLeft(210);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(30);
    obj.edit164:setHeight(25);
    obj.edit164:setField("conhecidas1");
    obj.edit164:setType("number");
    obj.edit164:setName("edit164");

    obj.label191 = gui.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout31);
    obj.label191:setVertTextAlign("center");
    obj.label191:setLeft(270);
    obj.label191:setTop(0);
    obj.label191:setWidth(30);
    obj.label191:setHeight(25);
    obj.label191:setField("cd1");
    obj.label191:setName("label191");
    obj.label191:setFontColor("white");
    obj.label191:setTextTrimming("none");
    obj.label191:setWordWrap(false);
    obj.label191:setAutoSize(true);

    obj.dataLink45 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout31);
    obj.dataLink45:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink45:setName("dataLink45");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout28);
    obj.layout32:setLeft(0);
    obj.layout32:setTop(115);
    obj.layout32:setWidth(350);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.label192 = gui.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout32);
    obj.label192:setVertTextAlign("center");
    obj.label192:setLeft(10);
    obj.label192:setTop(3);
    obj.label192:setWidth(25);
    obj.label192:setHeight(22);
    obj.label192:setText("2");
    obj.label192:setName("label192");
    obj.label192:setFontColor("white");
    obj.label192:setTextTrimming("none");
    obj.label192:setWordWrap(false);
    obj.label192:setAutoSize(true);

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout32);
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setLeft(45);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(30);
    obj.edit165:setHeight(25);
    obj.edit165:setField("total2");
    obj.edit165:setType("number");
    obj.edit165:setName("edit165");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout32);
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setLeft(85);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(30);
    obj.edit166:setHeight(25);
    obj.edit166:setField("base2");
    obj.edit166:setType("number");
    obj.edit166:setName("edit166");

    obj.label193 = gui.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout32);
    obj.label193:setVertTextAlign("center");
    obj.label193:setLeft(140);
    obj.label193:setTop(0);
    obj.label193:setWidth(30);
    obj.label193:setHeight(25);
    obj.label193:setField("bonus2");
    obj.label193:setName("label193");
    obj.label193:setFontColor("white");
    obj.label193:setTextTrimming("none");
    obj.label193:setWordWrap(false);
    obj.label193:setAutoSize(true);

    obj.dataLink46 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout32);
    obj.dataLink46:setFields({'base2', 'bonus2'});
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout32);
    obj.dataLink47:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink47:setName("dataLink47");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout32);
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setLeft(210);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(30);
    obj.edit167:setHeight(25);
    obj.edit167:setField("conhecidas2");
    obj.edit167:setType("number");
    obj.edit167:setName("edit167");

    obj.label194 = gui.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout32);
    obj.label194:setVertTextAlign("center");
    obj.label194:setLeft(270);
    obj.label194:setTop(0);
    obj.label194:setWidth(30);
    obj.label194:setHeight(25);
    obj.label194:setField("cd2");
    obj.label194:setName("label194");
    obj.label194:setFontColor("white");
    obj.label194:setTextTrimming("none");
    obj.label194:setWordWrap(false);
    obj.label194:setAutoSize(true);

    obj.dataLink48 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout32);
    obj.dataLink48:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink48:setName("dataLink48");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout28);
    obj.layout33:setLeft(0);
    obj.layout33:setTop(145);
    obj.layout33:setWidth(350);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.label195 = gui.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout33);
    obj.label195:setVertTextAlign("center");
    obj.label195:setLeft(10);
    obj.label195:setTop(3);
    obj.label195:setWidth(25);
    obj.label195:setHeight(22);
    obj.label195:setText("3");
    obj.label195:setName("label195");
    obj.label195:setFontColor("white");
    obj.label195:setTextTrimming("none");
    obj.label195:setWordWrap(false);
    obj.label195:setAutoSize(true);

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout33);
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setLeft(45);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(30);
    obj.edit168:setHeight(25);
    obj.edit168:setField("total3");
    obj.edit168:setType("number");
    obj.edit168:setName("edit168");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout33);
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setLeft(85);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(30);
    obj.edit169:setHeight(25);
    obj.edit169:setField("base3");
    obj.edit169:setType("number");
    obj.edit169:setName("edit169");

    obj.label196 = gui.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout33);
    obj.label196:setVertTextAlign("center");
    obj.label196:setLeft(140);
    obj.label196:setTop(0);
    obj.label196:setWidth(30);
    obj.label196:setHeight(25);
    obj.label196:setField("bonus3");
    obj.label196:setName("label196");
    obj.label196:setFontColor("white");
    obj.label196:setTextTrimming("none");
    obj.label196:setWordWrap(false);
    obj.label196:setAutoSize(true);

    obj.dataLink49 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout33);
    obj.dataLink49:setFields({'base3', 'bonus3'});
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout33);
    obj.dataLink50:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink50:setName("dataLink50");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout33);
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setLeft(210);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(30);
    obj.edit170:setHeight(25);
    obj.edit170:setField("conhecidas3");
    obj.edit170:setType("number");
    obj.edit170:setName("edit170");

    obj.label197 = gui.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout33);
    obj.label197:setVertTextAlign("center");
    obj.label197:setLeft(270);
    obj.label197:setTop(0);
    obj.label197:setWidth(30);
    obj.label197:setHeight(25);
    obj.label197:setField("cd3");
    obj.label197:setName("label197");
    obj.label197:setFontColor("white");
    obj.label197:setTextTrimming("none");
    obj.label197:setWordWrap(false);
    obj.label197:setAutoSize(true);

    obj.dataLink51 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout33);
    obj.dataLink51:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink51:setName("dataLink51");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout28);
    obj.layout34:setLeft(0);
    obj.layout34:setTop(175);
    obj.layout34:setWidth(350);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.label198 = gui.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout34);
    obj.label198:setVertTextAlign("center");
    obj.label198:setLeft(10);
    obj.label198:setTop(3);
    obj.label198:setWidth(25);
    obj.label198:setHeight(22);
    obj.label198:setText("4");
    obj.label198:setName("label198");
    obj.label198:setFontColor("white");
    obj.label198:setTextTrimming("none");
    obj.label198:setWordWrap(false);
    obj.label198:setAutoSize(true);

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout34);
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setLeft(45);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(30);
    obj.edit171:setHeight(25);
    obj.edit171:setField("total4");
    obj.edit171:setType("number");
    obj.edit171:setName("edit171");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout34);
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setLeft(85);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(30);
    obj.edit172:setHeight(25);
    obj.edit172:setField("base4");
    obj.edit172:setType("number");
    obj.edit172:setName("edit172");

    obj.label199 = gui.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout34);
    obj.label199:setVertTextAlign("center");
    obj.label199:setLeft(140);
    obj.label199:setTop(0);
    obj.label199:setWidth(30);
    obj.label199:setHeight(25);
    obj.label199:setField("bonus4");
    obj.label199:setName("label199");
    obj.label199:setFontColor("white");
    obj.label199:setTextTrimming("none");
    obj.label199:setWordWrap(false);
    obj.label199:setAutoSize(true);

    obj.dataLink52 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout34);
    obj.dataLink52:setFields({'base4', 'bonus4'});
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout34);
    obj.dataLink53:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink53:setName("dataLink53");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout34);
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(210);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(30);
    obj.edit173:setHeight(25);
    obj.edit173:setField("conhecidas4");
    obj.edit173:setType("number");
    obj.edit173:setName("edit173");

    obj.label200 = gui.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout34);
    obj.label200:setVertTextAlign("center");
    obj.label200:setLeft(270);
    obj.label200:setTop(0);
    obj.label200:setWidth(30);
    obj.label200:setHeight(25);
    obj.label200:setField("cd4");
    obj.label200:setName("label200");
    obj.label200:setFontColor("white");
    obj.label200:setTextTrimming("none");
    obj.label200:setWordWrap(false);
    obj.label200:setAutoSize(true);

    obj.dataLink54 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout34);
    obj.dataLink54:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink54:setName("dataLink54");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout28);
    obj.layout35:setLeft(0);
    obj.layout35:setTop(205);
    obj.layout35:setWidth(350);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.label201 = gui.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout35);
    obj.label201:setVertTextAlign("center");
    obj.label201:setLeft(10);
    obj.label201:setTop(3);
    obj.label201:setWidth(25);
    obj.label201:setHeight(22);
    obj.label201:setText("5");
    obj.label201:setName("label201");
    obj.label201:setFontColor("white");
    obj.label201:setTextTrimming("none");
    obj.label201:setWordWrap(false);
    obj.label201:setAutoSize(true);

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout35);
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setLeft(45);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(30);
    obj.edit174:setHeight(25);
    obj.edit174:setField("total5");
    obj.edit174:setType("number");
    obj.edit174:setName("edit174");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout35);
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setLeft(85);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(30);
    obj.edit175:setHeight(25);
    obj.edit175:setField("base5");
    obj.edit175:setType("number");
    obj.edit175:setName("edit175");

    obj.label202 = gui.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout35);
    obj.label202:setVertTextAlign("center");
    obj.label202:setLeft(140);
    obj.label202:setTop(0);
    obj.label202:setWidth(30);
    obj.label202:setHeight(25);
    obj.label202:setField("bonus5");
    obj.label202:setName("label202");
    obj.label202:setFontColor("white");
    obj.label202:setTextTrimming("none");
    obj.label202:setWordWrap(false);
    obj.label202:setAutoSize(true);

    obj.dataLink55 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout35);
    obj.dataLink55:setFields({'base5', 'bonus5'});
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout35);
    obj.dataLink56:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink56:setName("dataLink56");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout35);
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(210);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(30);
    obj.edit176:setHeight(25);
    obj.edit176:setField("conhecidas5");
    obj.edit176:setType("number");
    obj.edit176:setName("edit176");

    obj.label203 = gui.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout35);
    obj.label203:setVertTextAlign("center");
    obj.label203:setLeft(270);
    obj.label203:setTop(0);
    obj.label203:setWidth(30);
    obj.label203:setHeight(25);
    obj.label203:setField("cd5");
    obj.label203:setName("label203");
    obj.label203:setFontColor("white");
    obj.label203:setTextTrimming("none");
    obj.label203:setWordWrap(false);
    obj.label203:setAutoSize(true);

    obj.dataLink57 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout35);
    obj.dataLink57:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink57:setName("dataLink57");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout28);
    obj.layout36:setLeft(0);
    obj.layout36:setTop(235);
    obj.layout36:setWidth(350);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label204 = gui.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout36);
    obj.label204:setVertTextAlign("center");
    obj.label204:setLeft(10);
    obj.label204:setTop(3);
    obj.label204:setWidth(25);
    obj.label204:setHeight(22);
    obj.label204:setText("6");
    obj.label204:setName("label204");
    obj.label204:setFontColor("white");
    obj.label204:setTextTrimming("none");
    obj.label204:setWordWrap(false);
    obj.label204:setAutoSize(true);

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout36);
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(45);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(30);
    obj.edit177:setHeight(25);
    obj.edit177:setField("total6");
    obj.edit177:setType("number");
    obj.edit177:setName("edit177");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout36);
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(85);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(30);
    obj.edit178:setHeight(25);
    obj.edit178:setField("base6");
    obj.edit178:setType("number");
    obj.edit178:setName("edit178");

    obj.label205 = gui.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout36);
    obj.label205:setVertTextAlign("center");
    obj.label205:setLeft(140);
    obj.label205:setTop(0);
    obj.label205:setWidth(30);
    obj.label205:setHeight(25);
    obj.label205:setField("bonus6");
    obj.label205:setName("label205");
    obj.label205:setFontColor("white");
    obj.label205:setTextTrimming("none");
    obj.label205:setWordWrap(false);
    obj.label205:setAutoSize(true);

    obj.dataLink58 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout36);
    obj.dataLink58:setFields({'base6', 'bonus6'});
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout36);
    obj.dataLink59:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink59:setName("dataLink59");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout36);
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(210);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(30);
    obj.edit179:setHeight(25);
    obj.edit179:setField("conhecidas6");
    obj.edit179:setType("number");
    obj.edit179:setName("edit179");

    obj.label206 = gui.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout36);
    obj.label206:setVertTextAlign("center");
    obj.label206:setLeft(270);
    obj.label206:setTop(0);
    obj.label206:setWidth(30);
    obj.label206:setHeight(25);
    obj.label206:setField("cd6");
    obj.label206:setName("label206");
    obj.label206:setFontColor("white");
    obj.label206:setTextTrimming("none");
    obj.label206:setWordWrap(false);
    obj.label206:setAutoSize(true);

    obj.dataLink60 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout36);
    obj.dataLink60:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink60:setName("dataLink60");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout28);
    obj.layout37:setLeft(0);
    obj.layout37:setTop(265);
    obj.layout37:setWidth(350);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label207 = gui.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout37);
    obj.label207:setVertTextAlign("center");
    obj.label207:setLeft(10);
    obj.label207:setTop(3);
    obj.label207:setWidth(25);
    obj.label207:setHeight(22);
    obj.label207:setText("7");
    obj.label207:setName("label207");
    obj.label207:setFontColor("white");
    obj.label207:setTextTrimming("none");
    obj.label207:setWordWrap(false);
    obj.label207:setAutoSize(true);

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout37);
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(45);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(30);
    obj.edit180:setHeight(25);
    obj.edit180:setField("total7");
    obj.edit180:setType("number");
    obj.edit180:setName("edit180");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout37);
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(85);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(30);
    obj.edit181:setHeight(25);
    obj.edit181:setField("base7");
    obj.edit181:setType("number");
    obj.edit181:setName("edit181");

    obj.label208 = gui.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout37);
    obj.label208:setVertTextAlign("center");
    obj.label208:setLeft(140);
    obj.label208:setTop(0);
    obj.label208:setWidth(30);
    obj.label208:setHeight(25);
    obj.label208:setField("bonus7");
    obj.label208:setName("label208");
    obj.label208:setFontColor("white");
    obj.label208:setTextTrimming("none");
    obj.label208:setWordWrap(false);
    obj.label208:setAutoSize(true);

    obj.dataLink61 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout37);
    obj.dataLink61:setFields({'base7', 'bonus7'});
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout37);
    obj.dataLink62:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink62:setName("dataLink62");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout37);
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(210);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(30);
    obj.edit182:setHeight(25);
    obj.edit182:setField("conhecidas7");
    obj.edit182:setType("number");
    obj.edit182:setName("edit182");

    obj.label209 = gui.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout37);
    obj.label209:setVertTextAlign("center");
    obj.label209:setLeft(270);
    obj.label209:setTop(0);
    obj.label209:setWidth(30);
    obj.label209:setHeight(25);
    obj.label209:setField("cd7");
    obj.label209:setName("label209");
    obj.label209:setFontColor("white");
    obj.label209:setTextTrimming("none");
    obj.label209:setWordWrap(false);
    obj.label209:setAutoSize(true);

    obj.dataLink63 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout37);
    obj.dataLink63:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink63:setName("dataLink63");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout28);
    obj.layout38:setLeft(0);
    obj.layout38:setTop(295);
    obj.layout38:setWidth(350);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.label210 = gui.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout38);
    obj.label210:setVertTextAlign("center");
    obj.label210:setLeft(10);
    obj.label210:setTop(3);
    obj.label210:setWidth(25);
    obj.label210:setHeight(22);
    obj.label210:setText("8");
    obj.label210:setName("label210");
    obj.label210:setFontColor("white");
    obj.label210:setTextTrimming("none");
    obj.label210:setWordWrap(false);
    obj.label210:setAutoSize(true);

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout38);
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(45);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(30);
    obj.edit183:setHeight(25);
    obj.edit183:setField("total8");
    obj.edit183:setType("number");
    obj.edit183:setName("edit183");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout38);
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(85);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(30);
    obj.edit184:setHeight(25);
    obj.edit184:setField("base8");
    obj.edit184:setType("number");
    obj.edit184:setName("edit184");

    obj.label211 = gui.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout38);
    obj.label211:setVertTextAlign("center");
    obj.label211:setLeft(140);
    obj.label211:setTop(0);
    obj.label211:setWidth(30);
    obj.label211:setHeight(25);
    obj.label211:setField("bonus8");
    obj.label211:setName("label211");
    obj.label211:setFontColor("white");
    obj.label211:setTextTrimming("none");
    obj.label211:setWordWrap(false);
    obj.label211:setAutoSize(true);

    obj.dataLink64 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout38);
    obj.dataLink64:setFields({'base8', 'bonus8'});
    obj.dataLink64:setName("dataLink64");

    obj.dataLink65 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout38);
    obj.dataLink65:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink65:setName("dataLink65");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout38);
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(210);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(30);
    obj.edit185:setHeight(25);
    obj.edit185:setField("conhecidas8");
    obj.edit185:setType("number");
    obj.edit185:setName("edit185");

    obj.label212 = gui.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout38);
    obj.label212:setVertTextAlign("center");
    obj.label212:setLeft(270);
    obj.label212:setTop(0);
    obj.label212:setWidth(30);
    obj.label212:setHeight(25);
    obj.label212:setField("cd8");
    obj.label212:setName("label212");
    obj.label212:setFontColor("white");
    obj.label212:setTextTrimming("none");
    obj.label212:setWordWrap(false);
    obj.label212:setAutoSize(true);

    obj.dataLink66 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout38);
    obj.dataLink66:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink66:setName("dataLink66");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout28);
    obj.layout39:setLeft(0);
    obj.layout39:setTop(325);
    obj.layout39:setWidth(350);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label213 = gui.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout39);
    obj.label213:setVertTextAlign("center");
    obj.label213:setLeft(10);
    obj.label213:setTop(3);
    obj.label213:setWidth(25);
    obj.label213:setHeight(22);
    obj.label213:setText("9");
    obj.label213:setName("label213");
    obj.label213:setFontColor("white");
    obj.label213:setTextTrimming("none");
    obj.label213:setWordWrap(false);
    obj.label213:setAutoSize(true);

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout39);
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(45);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(30);
    obj.edit186:setHeight(25);
    obj.edit186:setField("total9");
    obj.edit186:setType("number");
    obj.edit186:setName("edit186");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout39);
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(85);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(30);
    obj.edit187:setHeight(25);
    obj.edit187:setField("base9");
    obj.edit187:setType("number");
    obj.edit187:setName("edit187");

    obj.label214 = gui.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout39);
    obj.label214:setVertTextAlign("center");
    obj.label214:setLeft(140);
    obj.label214:setTop(0);
    obj.label214:setWidth(30);
    obj.label214:setHeight(25);
    obj.label214:setField("bonus9");
    obj.label214:setName("label214");
    obj.label214:setFontColor("white");
    obj.label214:setTextTrimming("none");
    obj.label214:setWordWrap(false);
    obj.label214:setAutoSize(true);

    obj.dataLink67 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout39);
    obj.dataLink67:setFields({'base9', 'bonus9'});
    obj.dataLink67:setName("dataLink67");

    obj.dataLink68 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout39);
    obj.dataLink68:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink68:setName("dataLink68");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout39);
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(210);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(30);
    obj.edit188:setHeight(25);
    obj.edit188:setField("conhecidas9");
    obj.edit188:setType("number");
    obj.edit188:setName("edit188");

    obj.label215 = gui.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout39);
    obj.label215:setVertTextAlign("center");
    obj.label215:setLeft(270);
    obj.label215:setTop(0);
    obj.label215:setWidth(30);
    obj.label215:setHeight(25);
    obj.label215:setField("cd9");
    obj.label215:setName("label215");
    obj.label215:setFontColor("white");
    obj.label215:setTextTrimming("none");
    obj.label215:setWordWrap(false);
    obj.label215:setAutoSize(true);

    obj.dataLink69 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout39);
    obj.dataLink69:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink69:setName("dataLink69");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layoutMagias);
    obj.layout40:setLeft(50);
    obj.layout40:setTop(360);
    obj.layout40:setWidth(280);
    obj.layout40:setHeight(180);
    obj.layout40:setName("layout40");

    obj.label216 = gui.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout40);
    obj.label216:setVertTextAlign("center");
    obj.label216:setLeft(0);
    obj.label216:setTop(0);
    obj.label216:setWidth(100);
    obj.label216:setHeight(20);
    obj.label216:setText("Magias Nível 6");
    obj.label216:setName("label216");
    obj.label216:setFontColor("white");
    obj.label216:setTextTrimming("none");
    obj.label216:setWordWrap(false);
    obj.label216:setAutoSize(true);

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout40);
    obj.textEditor6:setTop(20);
    obj.textEditor6:setWidth(280);
    obj.textEditor6:setHeight(160);
    obj.textEditor6:setFontSize(12);
    obj.textEditor6:setField("circulo6");
    obj.textEditor6:setName("textEditor6");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layoutMagias);
    obj.layout41:setLeft(340);
    obj.layout41:setTop(0);
    obj.layout41:setWidth(280);
    obj.layout41:setHeight(180);
    obj.layout41:setName("layout41");

    obj.label217 = gui.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout41);
    obj.label217:setVertTextAlign("center");
    obj.label217:setLeft(0);
    obj.label217:setTop(0);
    obj.label217:setWidth(100);
    obj.label217:setHeight(20);
    obj.label217:setText("Magias Nível 0");
    obj.label217:setName("label217");
    obj.label217:setFontColor("white");
    obj.label217:setTextTrimming("none");
    obj.label217:setWordWrap(false);
    obj.label217:setAutoSize(true);

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout41);
    obj.textEditor7:setTop(20);
    obj.textEditor7:setWidth(280);
    obj.textEditor7:setHeight(160);
    obj.textEditor7:setFontSize(12);
    obj.textEditor7:setField("circulo0");
    obj.textEditor7:setName("textEditor7");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layoutMagias);
    obj.layout42:setLeft(340);
    obj.layout42:setTop(180);
    obj.layout42:setWidth(280);
    obj.layout42:setHeight(180);
    obj.layout42:setName("layout42");

    obj.label218 = gui.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout42);
    obj.label218:setVertTextAlign("center");
    obj.label218:setLeft(0);
    obj.label218:setTop(0);
    obj.label218:setWidth(100);
    obj.label218:setHeight(20);
    obj.label218:setText("Magias Nível 3");
    obj.label218:setName("label218");
    obj.label218:setFontColor("white");
    obj.label218:setTextTrimming("none");
    obj.label218:setWordWrap(false);
    obj.label218:setAutoSize(true);

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout42);
    obj.textEditor8:setTop(20);
    obj.textEditor8:setWidth(280);
    obj.textEditor8:setHeight(160);
    obj.textEditor8:setFontSize(12);
    obj.textEditor8:setField("circulo3");
    obj.textEditor8:setName("textEditor8");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layoutMagias);
    obj.layout43:setLeft(340);
    obj.layout43:setTop(360);
    obj.layout43:setWidth(280);
    obj.layout43:setHeight(180);
    obj.layout43:setName("layout43");

    obj.label219 = gui.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout43);
    obj.label219:setVertTextAlign("center");
    obj.label219:setLeft(0);
    obj.label219:setTop(0);
    obj.label219:setWidth(100);
    obj.label219:setHeight(20);
    obj.label219:setText("Magias Nível 7");
    obj.label219:setName("label219");
    obj.label219:setFontColor("white");
    obj.label219:setTextTrimming("none");
    obj.label219:setWordWrap(false);
    obj.label219:setAutoSize(true);

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout43);
    obj.textEditor9:setTop(20);
    obj.textEditor9:setWidth(280);
    obj.textEditor9:setHeight(160);
    obj.textEditor9:setFontSize(12);
    obj.textEditor9:setField("circulo7");
    obj.textEditor9:setName("textEditor9");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layoutMagias);
    obj.layout44:setLeft(630);
    obj.layout44:setTop(0);
    obj.layout44:setWidth(280);
    obj.layout44:setHeight(180);
    obj.layout44:setName("layout44");

    obj.label220 = gui.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout44);
    obj.label220:setVertTextAlign("center");
    obj.label220:setLeft(0);
    obj.label220:setTop(0);
    obj.label220:setWidth(100);
    obj.label220:setHeight(20);
    obj.label220:setText("Magias Nível 1");
    obj.label220:setName("label220");
    obj.label220:setFontColor("white");
    obj.label220:setTextTrimming("none");
    obj.label220:setWordWrap(false);
    obj.label220:setAutoSize(true);

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout44);
    obj.textEditor10:setTop(20);
    obj.textEditor10:setWidth(280);
    obj.textEditor10:setHeight(160);
    obj.textEditor10:setFontSize(12);
    obj.textEditor10:setField("circulo1");
    obj.textEditor10:setName("textEditor10");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layoutMagias);
    obj.layout45:setLeft(630);
    obj.layout45:setTop(180);
    obj.layout45:setWidth(280);
    obj.layout45:setHeight(180);
    obj.layout45:setName("layout45");

    obj.label221 = gui.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout45);
    obj.label221:setVertTextAlign("center");
    obj.label221:setLeft(0);
    obj.label221:setTop(0);
    obj.label221:setWidth(100);
    obj.label221:setHeight(20);
    obj.label221:setText("Magias Nível 4");
    obj.label221:setName("label221");
    obj.label221:setFontColor("white");
    obj.label221:setTextTrimming("none");
    obj.label221:setWordWrap(false);
    obj.label221:setAutoSize(true);

    obj.textEditor11 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout45);
    obj.textEditor11:setTop(20);
    obj.textEditor11:setWidth(280);
    obj.textEditor11:setHeight(160);
    obj.textEditor11:setFontSize(12);
    obj.textEditor11:setField("circulo4");
    obj.textEditor11:setName("textEditor11");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layoutMagias);
    obj.layout46:setLeft(630);
    obj.layout46:setTop(360);
    obj.layout46:setWidth(280);
    obj.layout46:setHeight(180);
    obj.layout46:setName("layout46");

    obj.label222 = gui.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout46);
    obj.label222:setVertTextAlign("center");
    obj.label222:setLeft(0);
    obj.label222:setTop(0);
    obj.label222:setWidth(100);
    obj.label222:setHeight(20);
    obj.label222:setText("Magias Nível 8");
    obj.label222:setName("label222");
    obj.label222:setFontColor("white");
    obj.label222:setTextTrimming("none");
    obj.label222:setWordWrap(false);
    obj.label222:setAutoSize(true);

    obj.textEditor12 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout46);
    obj.textEditor12:setTop(20);
    obj.textEditor12:setWidth(280);
    obj.textEditor12:setHeight(160);
    obj.textEditor12:setFontSize(12);
    obj.textEditor12:setField("circulo8");
    obj.textEditor12:setName("textEditor12");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layoutMagias);
    obj.layout47:setLeft(920);
    obj.layout47:setTop(0);
    obj.layout47:setWidth(280);
    obj.layout47:setHeight(180);
    obj.layout47:setName("layout47");

    obj.label223 = gui.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout47);
    obj.label223:setVertTextAlign("center");
    obj.label223:setLeft(0);
    obj.label223:setTop(0);
    obj.label223:setWidth(100);
    obj.label223:setHeight(20);
    obj.label223:setText("Magias Nível 2");
    obj.label223:setName("label223");
    obj.label223:setFontColor("white");
    obj.label223:setTextTrimming("none");
    obj.label223:setWordWrap(false);
    obj.label223:setAutoSize(true);

    obj.textEditor13 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout47);
    obj.textEditor13:setTop(20);
    obj.textEditor13:setWidth(280);
    obj.textEditor13:setHeight(160);
    obj.textEditor13:setFontSize(12);
    obj.textEditor13:setField("circulo2");
    obj.textEditor13:setName("textEditor13");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layoutMagias);
    obj.layout48:setLeft(920);
    obj.layout48:setTop(180);
    obj.layout48:setWidth(280);
    obj.layout48:setHeight(180);
    obj.layout48:setName("layout48");

    obj.label224 = gui.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout48);
    obj.label224:setVertTextAlign("center");
    obj.label224:setLeft(0);
    obj.label224:setTop(0);
    obj.label224:setWidth(100);
    obj.label224:setHeight(20);
    obj.label224:setText("Magias Nível 5");
    obj.label224:setName("label224");
    obj.label224:setFontColor("white");
    obj.label224:setTextTrimming("none");
    obj.label224:setWordWrap(false);
    obj.label224:setAutoSize(true);

    obj.textEditor14 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout48);
    obj.textEditor14:setTop(20);
    obj.textEditor14:setWidth(280);
    obj.textEditor14:setHeight(160);
    obj.textEditor14:setFontSize(12);
    obj.textEditor14:setField("circulo5");
    obj.textEditor14:setName("textEditor14");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layoutMagias);
    obj.layout49:setLeft(920);
    obj.layout49:setTop(360);
    obj.layout49:setWidth(280);
    obj.layout49:setHeight(180);
    obj.layout49:setName("layout49");

    obj.label225 = gui.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout49);
    obj.label225:setVertTextAlign("center");
    obj.label225:setLeft(0);
    obj.label225:setTop(0);
    obj.label225:setWidth(100);
    obj.label225:setHeight(20);
    obj.label225:setText("Magias Nível 9");
    obj.label225:setName("label225");
    obj.label225:setFontColor("white");
    obj.label225:setTextTrimming("none");
    obj.label225:setWordWrap(false);
    obj.label225:setAutoSize(true);

    obj.textEditor15 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout49);
    obj.textEditor15:setTop(20);
    obj.textEditor15:setWidth(280);
    obj.textEditor15:setHeight(160);
    obj.textEditor15:setFontSize(12);
    obj.textEditor15:setField("circulo9");
    obj.textEditor15:setName("textEditor15");

    obj.layoutSignos = gui.fromHandle(_obj_newObject("layout"));
    obj.layoutSignos:setParent(obj.boxDetalhesDoItem);
    obj.layoutSignos:setLeft(0);
    obj.layoutSignos:setTop(50);
    obj.layoutSignos:setWidth(1200);
    obj.layoutSignos:setHeight(550);
    obj.layoutSignos:setName("layoutSignos");
    obj.layoutSignos:setVisible(false);

    obj.label226 = gui.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layoutSignos);
    obj.label226:setVertTextAlign("center");
    obj.label226:setLeft(130);
    obj.label226:setTop(0);
    obj.label226:setWidth(30);
    obj.label226:setHeight(25);
    obj.label226:setText("CD");
    obj.label226:setName("label226");
    obj.label226:setFontColor("white");
    obj.label226:setTextTrimming("none");
    obj.label226:setWordWrap(false);
    obj.label226:setAutoSize(true);

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layoutSignos);
    obj.comboBox4:setLeft(160);
    obj.comboBox4:setTop(0);
    obj.comboBox4:setWidth(60);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox4:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox4:setField("atributoCD");
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setName("comboBox4");

    obj.dataLink70 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layoutSignos);
    obj.dataLink70:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink70:setName("dataLink70");

    obj.label227 = gui.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layoutSignos);
    obj.label227:setVertTextAlign("center");
    obj.label227:setLeft(230);
    obj.label227:setTop(0);
    obj.label227:setWidth(100);
    obj.label227:setHeight(25);
    obj.label227:setField("cdSignos");
    obj.label227:setName("label227");
    obj.label227:setFontColor("white");
    obj.label227:setTextTrimming("none");
    obj.label227:setWordWrap(false);
    obj.label227:setAutoSize(true);

    obj.label228 = gui.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layoutSignos);
    obj.label228:setVertTextAlign("center");
    obj.label228:setLeft(20);
    obj.label228:setTop(30);
    obj.label228:setWidth(100);
    obj.label228:setHeight(25);
    obj.label228:setText("NOME");
    obj.label228:setName("label228");
    obj.label228:setFontColor("white");
    obj.label228:setTextTrimming("none");
    obj.label228:setWordWrap(false);
    obj.label228:setAutoSize(true);

    obj.label229 = gui.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layoutSignos);
    obj.label229:setVertTextAlign("center");
    obj.label229:setLeft(280);
    obj.label229:setTop(30);
    obj.label229:setWidth(50);
    obj.label229:setHeight(25);
    obj.label229:setText("NÍVEL");
    obj.label229:setName("label229");
    obj.label229:setFontColor("white");
    obj.label229:setTextTrimming("none");
    obj.label229:setWordWrap(false);
    obj.label229:setAutoSize(true);

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layoutSignos);
    obj.layout50:setLeft(20);
    obj.layout50:setTop(50);
    obj.layout50:setWidth(350);
    obj.layout50:setHeight(300);
    obj.layout50:setName("layout50");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setLeft(0);
    obj.layout51:setTop(0);
    obj.layout51:setWidth(350);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout51);
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(0);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(270);
    obj.edit189:setHeight(25);
    obj.edit189:setField("nomeSignos0");
    obj.edit189:setName("edit189");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout51);
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(270);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(30);
    obj.edit190:setHeight(25);
    obj.edit190:setField("nivelSignos0");
    obj.edit190:setName("edit190");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setLeft(0);
    obj.layout52:setTop(25);
    obj.layout52:setWidth(350);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout52);
    obj.edit191:setVertTextAlign("center");
    obj.edit191:setLeft(0);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(270);
    obj.edit191:setHeight(25);
    obj.edit191:setField("nomeSignos1");
    obj.edit191:setName("edit191");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout52);
    obj.edit192:setVertTextAlign("center");
    obj.edit192:setLeft(270);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(30);
    obj.edit192:setHeight(25);
    obj.edit192:setField("nivelSignos1");
    obj.edit192:setName("edit192");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout50);
    obj.layout53:setLeft(0);
    obj.layout53:setTop(50);
    obj.layout53:setWidth(350);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout53);
    obj.edit193:setVertTextAlign("center");
    obj.edit193:setLeft(0);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(270);
    obj.edit193:setHeight(25);
    obj.edit193:setField("nomeSignos2");
    obj.edit193:setName("edit193");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout53);
    obj.edit194:setVertTextAlign("center");
    obj.edit194:setLeft(270);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(30);
    obj.edit194:setHeight(25);
    obj.edit194:setField("nivelSignos2");
    obj.edit194:setName("edit194");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout50);
    obj.layout54:setLeft(0);
    obj.layout54:setTop(75);
    obj.layout54:setWidth(350);
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout54);
    obj.edit195:setVertTextAlign("center");
    obj.edit195:setLeft(0);
    obj.edit195:setTop(0);
    obj.edit195:setWidth(270);
    obj.edit195:setHeight(25);
    obj.edit195:setField("nomeSignos3");
    obj.edit195:setName("edit195");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout54);
    obj.edit196:setVertTextAlign("center");
    obj.edit196:setLeft(270);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(30);
    obj.edit196:setHeight(25);
    obj.edit196:setField("nivelSignos3");
    obj.edit196:setName("edit196");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout50);
    obj.layout55:setLeft(0);
    obj.layout55:setTop(100);
    obj.layout55:setWidth(350);
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout55);
    obj.edit197:setVertTextAlign("center");
    obj.edit197:setLeft(0);
    obj.edit197:setTop(0);
    obj.edit197:setWidth(270);
    obj.edit197:setHeight(25);
    obj.edit197:setField("nomeSignos4");
    obj.edit197:setName("edit197");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout55);
    obj.edit198:setVertTextAlign("center");
    obj.edit198:setLeft(270);
    obj.edit198:setTop(0);
    obj.edit198:setWidth(30);
    obj.edit198:setHeight(25);
    obj.edit198:setField("nivelSignos4");
    obj.edit198:setName("edit198");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout50);
    obj.layout56:setLeft(0);
    obj.layout56:setTop(125);
    obj.layout56:setWidth(350);
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout56);
    obj.edit199:setVertTextAlign("center");
    obj.edit199:setLeft(0);
    obj.edit199:setTop(0);
    obj.edit199:setWidth(270);
    obj.edit199:setHeight(25);
    obj.edit199:setField("nomeSignos5");
    obj.edit199:setName("edit199");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout56);
    obj.edit200:setVertTextAlign("center");
    obj.edit200:setLeft(270);
    obj.edit200:setTop(0);
    obj.edit200:setWidth(30);
    obj.edit200:setHeight(25);
    obj.edit200:setField("nivelSignos5");
    obj.edit200:setName("edit200");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout50);
    obj.layout57:setLeft(0);
    obj.layout57:setTop(150);
    obj.layout57:setWidth(350);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout57);
    obj.edit201:setVertTextAlign("center");
    obj.edit201:setLeft(0);
    obj.edit201:setTop(0);
    obj.edit201:setWidth(270);
    obj.edit201:setHeight(25);
    obj.edit201:setField("nomeSignos6");
    obj.edit201:setName("edit201");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout57);
    obj.edit202:setVertTextAlign("center");
    obj.edit202:setLeft(270);
    obj.edit202:setTop(0);
    obj.edit202:setWidth(30);
    obj.edit202:setHeight(25);
    obj.edit202:setField("nivelSignos6");
    obj.edit202:setName("edit202");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout50);
    obj.layout58:setLeft(0);
    obj.layout58:setTop(175);
    obj.layout58:setWidth(350);
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.edit203 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout58);
    obj.edit203:setVertTextAlign("center");
    obj.edit203:setLeft(0);
    obj.edit203:setTop(0);
    obj.edit203:setWidth(270);
    obj.edit203:setHeight(25);
    obj.edit203:setField("nomeSignos7");
    obj.edit203:setName("edit203");

    obj.edit204 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout58);
    obj.edit204:setVertTextAlign("center");
    obj.edit204:setLeft(270);
    obj.edit204:setTop(0);
    obj.edit204:setWidth(30);
    obj.edit204:setHeight(25);
    obj.edit204:setField("nivelSignos7");
    obj.edit204:setName("edit204");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout50);
    obj.layout59:setLeft(0);
    obj.layout59:setTop(200);
    obj.layout59:setWidth(350);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.edit205 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout59);
    obj.edit205:setVertTextAlign("center");
    obj.edit205:setLeft(0);
    obj.edit205:setTop(0);
    obj.edit205:setWidth(270);
    obj.edit205:setHeight(25);
    obj.edit205:setField("nomeSignos8");
    obj.edit205:setName("edit205");

    obj.edit206 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout59);
    obj.edit206:setVertTextAlign("center");
    obj.edit206:setLeft(270);
    obj.edit206:setTop(0);
    obj.edit206:setWidth(30);
    obj.edit206:setHeight(25);
    obj.edit206:setField("nivelSignos8");
    obj.edit206:setName("edit206");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout50);
    obj.layout60:setLeft(0);
    obj.layout60:setTop(225);
    obj.layout60:setWidth(350);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.edit207 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout60);
    obj.edit207:setVertTextAlign("center");
    obj.edit207:setLeft(0);
    obj.edit207:setTop(0);
    obj.edit207:setWidth(270);
    obj.edit207:setHeight(25);
    obj.edit207:setField("nomeSignos9");
    obj.edit207:setName("edit207");

    obj.edit208 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout60);
    obj.edit208:setVertTextAlign("center");
    obj.edit208:setLeft(270);
    obj.edit208:setTop(0);
    obj.edit208:setWidth(30);
    obj.edit208:setHeight(25);
    obj.edit208:setField("nivelSignos9");
    obj.edit208:setName("edit208");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout50);
    obj.layout61:setLeft(0);
    obj.layout61:setTop(250);
    obj.layout61:setWidth(350);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.edit209 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout61);
    obj.edit209:setVertTextAlign("center");
    obj.edit209:setLeft(0);
    obj.edit209:setTop(0);
    obj.edit209:setWidth(270);
    obj.edit209:setHeight(25);
    obj.edit209:setField("nomeSignos10");
    obj.edit209:setName("edit209");

    obj.edit210 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout61);
    obj.edit210:setVertTextAlign("center");
    obj.edit210:setLeft(270);
    obj.edit210:setTop(0);
    obj.edit210:setWidth(30);
    obj.edit210:setHeight(25);
    obj.edit210:setField("nivelSignos10");
    obj.edit210:setName("edit210");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout50);
    obj.layout62:setLeft(0);
    obj.layout62:setTop(275);
    obj.layout62:setWidth(350);
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.edit211 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout62);
    obj.edit211:setVertTextAlign("center");
    obj.edit211:setLeft(0);
    obj.edit211:setTop(0);
    obj.edit211:setWidth(270);
    obj.edit211:setHeight(25);
    obj.edit211:setField("nomeSignos11");
    obj.edit211:setName("edit211");

    obj.edit212 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout62);
    obj.edit212:setVertTextAlign("center");
    obj.edit212:setLeft(270);
    obj.edit212:setTop(0);
    obj.edit212:setWidth(30);
    obj.edit212:setHeight(25);
    obj.edit212:setField("nivelSignos11");
    obj.edit212:setName("edit212");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layoutSignos);
    obj.layout63:setLeft(50);
    obj.layout63:setTop(360);
    obj.layout63:setWidth(280);
    obj.layout63:setHeight(180);
    obj.layout63:setName("layout63");

    obj.edit213 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout63);
    obj.edit213:setVertTextAlign("center");
    obj.edit213:setLeft(40);
    obj.edit213:setTop(5);
    obj.edit213:setWidth(200);
    obj.edit213:setHeight(20);
    obj.edit213:setField("descricaoNomeSigno0");
    obj.edit213:setName("edit213");

    obj.textEditor16 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout63);
    obj.textEditor16:setTop(25);
    obj.textEditor16:setWidth(280);
    obj.textEditor16:setHeight(155);
    obj.textEditor16:setFontSize(12);
    obj.textEditor16:setField("descricaoSigno0");
    obj.textEditor16:setName("textEditor16");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layoutSignos);
    obj.layout64:setLeft(340);
    obj.layout64:setTop(0);
    obj.layout64:setWidth(280);
    obj.layout64:setHeight(180);
    obj.layout64:setName("layout64");

    obj.edit214 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout64);
    obj.edit214:setVertTextAlign("center");
    obj.edit214:setLeft(40);
    obj.edit214:setTop(5);
    obj.edit214:setWidth(200);
    obj.edit214:setHeight(20);
    obj.edit214:setField("descricaoNomeSigno1");
    obj.edit214:setName("edit214");

    obj.textEditor17 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout64);
    obj.textEditor17:setTop(25);
    obj.textEditor17:setWidth(280);
    obj.textEditor17:setHeight(155);
    obj.textEditor17:setFontSize(12);
    obj.textEditor17:setField("descricaoSigno1");
    obj.textEditor17:setName("textEditor17");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layoutSignos);
    obj.layout65:setLeft(340);
    obj.layout65:setTop(180);
    obj.layout65:setWidth(280);
    obj.layout65:setHeight(180);
    obj.layout65:setName("layout65");

    obj.edit215 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout65);
    obj.edit215:setVertTextAlign("center");
    obj.edit215:setLeft(40);
    obj.edit215:setTop(5);
    obj.edit215:setWidth(200);
    obj.edit215:setHeight(20);
    obj.edit215:setField("descricaoNomeSigno2");
    obj.edit215:setName("edit215");

    obj.textEditor18 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout65);
    obj.textEditor18:setTop(25);
    obj.textEditor18:setWidth(280);
    obj.textEditor18:setHeight(155);
    obj.textEditor18:setFontSize(12);
    obj.textEditor18:setField("descricaoSigno2");
    obj.textEditor18:setName("textEditor18");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layoutSignos);
    obj.layout66:setLeft(340);
    obj.layout66:setTop(360);
    obj.layout66:setWidth(280);
    obj.layout66:setHeight(180);
    obj.layout66:setName("layout66");

    obj.edit216 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout66);
    obj.edit216:setVertTextAlign("center");
    obj.edit216:setLeft(40);
    obj.edit216:setTop(5);
    obj.edit216:setWidth(200);
    obj.edit216:setHeight(20);
    obj.edit216:setField("descricaoNomeSigno3");
    obj.edit216:setName("edit216");

    obj.textEditor19 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout66);
    obj.textEditor19:setTop(25);
    obj.textEditor19:setWidth(280);
    obj.textEditor19:setHeight(155);
    obj.textEditor19:setFontSize(12);
    obj.textEditor19:setField("descricaoSigno3");
    obj.textEditor19:setName("textEditor19");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layoutSignos);
    obj.layout67:setLeft(630);
    obj.layout67:setTop(0);
    obj.layout67:setWidth(280);
    obj.layout67:setHeight(180);
    obj.layout67:setName("layout67");

    obj.edit217 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout67);
    obj.edit217:setVertTextAlign("center");
    obj.edit217:setLeft(40);
    obj.edit217:setTop(5);
    obj.edit217:setWidth(200);
    obj.edit217:setHeight(20);
    obj.edit217:setField("descricaoNomeSigno4");
    obj.edit217:setName("edit217");

    obj.textEditor20 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout67);
    obj.textEditor20:setTop(25);
    obj.textEditor20:setWidth(280);
    obj.textEditor20:setHeight(155);
    obj.textEditor20:setFontSize(12);
    obj.textEditor20:setField("descricaoSigno4");
    obj.textEditor20:setName("textEditor20");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layoutSignos);
    obj.layout68:setLeft(630);
    obj.layout68:setTop(180);
    obj.layout68:setWidth(280);
    obj.layout68:setHeight(180);
    obj.layout68:setName("layout68");

    obj.edit218 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout68);
    obj.edit218:setVertTextAlign("center");
    obj.edit218:setLeft(40);
    obj.edit218:setTop(5);
    obj.edit218:setWidth(200);
    obj.edit218:setHeight(20);
    obj.edit218:setField("descricaoNomeSigno5");
    obj.edit218:setName("edit218");

    obj.textEditor21 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout68);
    obj.textEditor21:setTop(25);
    obj.textEditor21:setWidth(280);
    obj.textEditor21:setHeight(155);
    obj.textEditor21:setFontSize(12);
    obj.textEditor21:setField("descricaoSigno5");
    obj.textEditor21:setName("textEditor21");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layoutSignos);
    obj.layout69:setLeft(630);
    obj.layout69:setTop(360);
    obj.layout69:setWidth(280);
    obj.layout69:setHeight(180);
    obj.layout69:setName("layout69");

    obj.edit219 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout69);
    obj.edit219:setVertTextAlign("center");
    obj.edit219:setLeft(40);
    obj.edit219:setTop(5);
    obj.edit219:setWidth(200);
    obj.edit219:setHeight(20);
    obj.edit219:setField("descricaoNomeSigno6");
    obj.edit219:setName("edit219");

    obj.textEditor22 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.layout69);
    obj.textEditor22:setTop(25);
    obj.textEditor22:setWidth(280);
    obj.textEditor22:setHeight(155);
    obj.textEditor22:setFontSize(12);
    obj.textEditor22:setField("descricaoSigno6");
    obj.textEditor22:setName("textEditor22");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layoutSignos);
    obj.layout70:setLeft(920);
    obj.layout70:setTop(0);
    obj.layout70:setWidth(280);
    obj.layout70:setHeight(180);
    obj.layout70:setName("layout70");

    obj.edit220 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout70);
    obj.edit220:setVertTextAlign("center");
    obj.edit220:setLeft(40);
    obj.edit220:setTop(5);
    obj.edit220:setWidth(200);
    obj.edit220:setHeight(20);
    obj.edit220:setField("descricaoNomeSigno7");
    obj.edit220:setName("edit220");

    obj.textEditor23 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.layout70);
    obj.textEditor23:setTop(25);
    obj.textEditor23:setWidth(280);
    obj.textEditor23:setHeight(155);
    obj.textEditor23:setFontSize(12);
    obj.textEditor23:setField("descricaoSigno7");
    obj.textEditor23:setName("textEditor23");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layoutSignos);
    obj.layout71:setLeft(920);
    obj.layout71:setTop(180);
    obj.layout71:setWidth(280);
    obj.layout71:setHeight(180);
    obj.layout71:setName("layout71");

    obj.edit221 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout71);
    obj.edit221:setVertTextAlign("center");
    obj.edit221:setLeft(40);
    obj.edit221:setTop(5);
    obj.edit221:setWidth(200);
    obj.edit221:setHeight(20);
    obj.edit221:setField("descricaoNomeSigno8");
    obj.edit221:setName("edit221");

    obj.textEditor24 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.layout71);
    obj.textEditor24:setTop(25);
    obj.textEditor24:setWidth(280);
    obj.textEditor24:setHeight(155);
    obj.textEditor24:setFontSize(12);
    obj.textEditor24:setField("descricaoSigno8");
    obj.textEditor24:setName("textEditor24");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layoutSignos);
    obj.layout72:setLeft(920);
    obj.layout72:setTop(360);
    obj.layout72:setWidth(280);
    obj.layout72:setHeight(180);
    obj.layout72:setName("layout72");

    obj.edit222 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout72);
    obj.edit222:setVertTextAlign("center");
    obj.edit222:setLeft(40);
    obj.edit222:setTop(5);
    obj.edit222:setWidth(200);
    obj.edit222:setHeight(20);
    obj.edit222:setField("descricaoNomeSigno9");
    obj.edit222:setName("edit222");

    obj.textEditor25 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.layout72);
    obj.textEditor25:setTop(25);
    obj.textEditor25:setWidth(280);
    obj.textEditor25:setHeight(155);
    obj.textEditor25:setFontSize(12);
    obj.textEditor25:setField("descricaoSigno9");
    obj.textEditor25:setName("textEditor25");

    obj.layoutListaMagias = gui.fromHandle(_obj_newObject("layout"));
    obj.layoutListaMagias:setParent(obj.boxDetalhesDoItem);
    obj.layoutListaMagias:setLeft(0);
    obj.layoutListaMagias:setTop(50);
    obj.layoutListaMagias:setWidth(1200);
    obj.layoutListaMagias:setHeight(550);
    obj.layoutListaMagias:setName("layoutListaMagias");
    obj.layoutListaMagias:setVisible(false);

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layoutListaMagias);
    obj.layout73:setLeft(10);
    obj.layout73:setTop(0);
    obj.layout73:setWidth(350);
    obj.layout73:setHeight(350);
    obj.layout73:setName("layout73");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout73);
    obj.comboBox5:setLeft(115);
    obj.comboBox5:setTop(0);
    obj.comboBox5:setWidth(60);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox5:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox5:setField("atributoBonus");
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setName("comboBox5");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout73);
    obj.comboBox6:setLeft(260);
    obj.comboBox6:setTop(0);
    obj.comboBox6:setWidth(60);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox6:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox6:setField("atributoCD");
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setName("comboBox6");

    obj.rectangle80 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout73);
    obj.rectangle80:setLeft(210);
    obj.rectangle80:setTop(0);
    obj.rectangle80:setWidth(30);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.label230 = gui.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout73);
    obj.label230:setLeft(211);
    obj.label230:setTop(0);
    obj.label230:setWidth(30);
    obj.label230:setHeight(25);
    obj.label230:setField("grimorio");
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");
    obj.label230:setFontColor("white");
    obj.label230:setTextTrimming("none");
    obj.label230:setWordWrap(false);
    obj.label230:setAutoSize(true);

    obj.dataLink71 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout73);
    obj.dataLink71:setFields({'conhecidas0', 'conhecidas1', 'conhecidas2', 'conhecidas3', 'conhecidas4', 'conhecidas5', 'conhecidas6', 'conhecidas7', 'conhecidas8', 'conhecidas9'});
    obj.dataLink71:setName("dataLink71");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout73);
    obj.layout74:setLeft(0);
    obj.layout74:setTop(25);
    obj.layout74:setWidth(350);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.label231 = gui.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout74);
    obj.label231:setVertTextAlign("center");
    obj.label231:setLeft(0);
    obj.label231:setTop(3);
    obj.label231:setWidth(25);
    obj.label231:setHeight(22);
    obj.label231:setText("NÍVEL");
    obj.label231:setName("label231");
    obj.label231:setFontColor("white");
    obj.label231:setTextTrimming("none");
    obj.label231:setWordWrap(false);
    obj.label231:setAutoSize(true);

    obj.label232 = gui.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout74);
    obj.label232:setVertTextAlign("center");
    obj.label232:setLeft(40);
    obj.label232:setTop(3);
    obj.label232:setWidth(25);
    obj.label232:setHeight(22);
    obj.label232:setText("TOTAL");
    obj.label232:setName("label232");
    obj.label232:setFontColor("white");
    obj.label232:setTextTrimming("none");
    obj.label232:setWordWrap(false);
    obj.label232:setAutoSize(true);

    obj.label233 = gui.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout74);
    obj.label233:setVertTextAlign("center");
    obj.label233:setLeft(85);
    obj.label233:setTop(3);
    obj.label233:setWidth(25);
    obj.label233:setHeight(22);
    obj.label233:setText("BASE");
    obj.label233:setName("label233");
    obj.label233:setFontColor("white");
    obj.label233:setTextTrimming("none");
    obj.label233:setWordWrap(false);
    obj.label233:setAutoSize(true);

    obj.label234 = gui.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout74);
    obj.label234:setVertTextAlign("center");
    obj.label234:setLeft(125);
    obj.label234:setTop(3);
    obj.label234:setWidth(25);
    obj.label234:setHeight(22);
    obj.label234:setText("BONUS");
    obj.label234:setName("label234");
    obj.label234:setFontColor("white");
    obj.label234:setTextTrimming("none");
    obj.label234:setWordWrap(false);
    obj.label234:setAutoSize(true);

    obj.label235 = gui.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout74);
    obj.label235:setVertTextAlign("center");
    obj.label235:setLeft(180);
    obj.label235:setTop(3);
    obj.label235:setWidth(25);
    obj.label235:setHeight(22);
    obj.label235:setText("CONHECIDAS");
    obj.label235:setName("label235");
    obj.label235:setFontColor("white");
    obj.label235:setTextTrimming("none");
    obj.label235:setWordWrap(false);
    obj.label235:setAutoSize(true);

    obj.label236 = gui.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout74);
    obj.label236:setVertTextAlign("center");
    obj.label236:setLeft(270);
    obj.label236:setTop(3);
    obj.label236:setWidth(25);
    obj.label236:setHeight(22);
    obj.label236:setText("CD");
    obj.label236:setName("label236");
    obj.label236:setFontColor("white");
    obj.label236:setTextTrimming("none");
    obj.label236:setWordWrap(false);
    obj.label236:setAutoSize(true);

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout73);
    obj.layout75:setLeft(0);
    obj.layout75:setTop(55);
    obj.layout75:setWidth(350);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.label237 = gui.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout75);
    obj.label237:setVertTextAlign("center");
    obj.label237:setLeft(10);
    obj.label237:setTop(3);
    obj.label237:setWidth(25);
    obj.label237:setHeight(22);
    obj.label237:setText("0");
    obj.label237:setName("label237");
    obj.label237:setFontColor("white");
    obj.label237:setTextTrimming("none");
    obj.label237:setWordWrap(false);
    obj.label237:setAutoSize(true);

    obj.edit223 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout75);
    obj.edit223:setVertTextAlign("center");
    obj.edit223:setLeft(45);
    obj.edit223:setTop(0);
    obj.edit223:setWidth(30);
    obj.edit223:setHeight(25);
    obj.edit223:setField("total0");
    obj.edit223:setType("number");
    obj.edit223:setName("edit223");

    obj.edit224 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout75);
    obj.edit224:setVertTextAlign("center");
    obj.edit224:setLeft(85);
    obj.edit224:setTop(0);
    obj.edit224:setWidth(30);
    obj.edit224:setHeight(25);
    obj.edit224:setField("base0");
    obj.edit224:setType("number");
    obj.edit224:setName("edit224");

    obj.label238 = gui.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout75);
    obj.label238:setVertTextAlign("center");
    obj.label238:setLeft(140);
    obj.label238:setTop(0);
    obj.label238:setWidth(30);
    obj.label238:setHeight(25);
    obj.label238:setField("bonus0");
    obj.label238:setName("label238");
    obj.label238:setFontColor("white");
    obj.label238:setTextTrimming("none");
    obj.label238:setWordWrap(false);
    obj.label238:setAutoSize(true);

    obj.dataLink72 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout75);
    obj.dataLink72:setFields({'base0', 'bonus0'});
    obj.dataLink72:setName("dataLink72");

    obj.dataLink73 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout75);
    obj.dataLink73:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink73:setName("dataLink73");

    obj.edit225 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout75);
    obj.edit225:setVertTextAlign("center");
    obj.edit225:setLeft(210);
    obj.edit225:setTop(0);
    obj.edit225:setWidth(30);
    obj.edit225:setHeight(25);
    obj.edit225:setField("conhecidas0");
    obj.edit225:setType("number");
    obj.edit225:setName("edit225");

    obj.label239 = gui.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout75);
    obj.label239:setVertTextAlign("center");
    obj.label239:setLeft(270);
    obj.label239:setTop(0);
    obj.label239:setWidth(30);
    obj.label239:setHeight(25);
    obj.label239:setField("cd0");
    obj.label239:setName("label239");
    obj.label239:setFontColor("white");
    obj.label239:setTextTrimming("none");
    obj.label239:setWordWrap(false);
    obj.label239:setAutoSize(true);

    obj.dataLink74 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout75);
    obj.dataLink74:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink74:setName("dataLink74");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout73);
    obj.layout76:setLeft(0);
    obj.layout76:setTop(85);
    obj.layout76:setWidth(350);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.label240 = gui.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout76);
    obj.label240:setVertTextAlign("center");
    obj.label240:setLeft(10);
    obj.label240:setTop(3);
    obj.label240:setWidth(25);
    obj.label240:setHeight(22);
    obj.label240:setText("1");
    obj.label240:setName("label240");
    obj.label240:setFontColor("white");
    obj.label240:setTextTrimming("none");
    obj.label240:setWordWrap(false);
    obj.label240:setAutoSize(true);

    obj.edit226 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout76);
    obj.edit226:setVertTextAlign("center");
    obj.edit226:setLeft(45);
    obj.edit226:setTop(0);
    obj.edit226:setWidth(30);
    obj.edit226:setHeight(25);
    obj.edit226:setField("total1");
    obj.edit226:setType("number");
    obj.edit226:setName("edit226");

    obj.edit227 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout76);
    obj.edit227:setVertTextAlign("center");
    obj.edit227:setLeft(85);
    obj.edit227:setTop(0);
    obj.edit227:setWidth(30);
    obj.edit227:setHeight(25);
    obj.edit227:setField("base1");
    obj.edit227:setType("number");
    obj.edit227:setName("edit227");

    obj.label241 = gui.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout76);
    obj.label241:setVertTextAlign("center");
    obj.label241:setLeft(140);
    obj.label241:setTop(0);
    obj.label241:setWidth(30);
    obj.label241:setHeight(25);
    obj.label241:setField("bonus1");
    obj.label241:setName("label241");
    obj.label241:setFontColor("white");
    obj.label241:setTextTrimming("none");
    obj.label241:setWordWrap(false);
    obj.label241:setAutoSize(true);

    obj.dataLink75 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout76);
    obj.dataLink75:setFields({'base1', 'bonus1'});
    obj.dataLink75:setName("dataLink75");

    obj.dataLink76 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout76);
    obj.dataLink76:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink76:setName("dataLink76");

    obj.edit228 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout76);
    obj.edit228:setVertTextAlign("center");
    obj.edit228:setLeft(210);
    obj.edit228:setTop(0);
    obj.edit228:setWidth(30);
    obj.edit228:setHeight(25);
    obj.edit228:setField("conhecidas1");
    obj.edit228:setType("number");
    obj.edit228:setName("edit228");

    obj.label242 = gui.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout76);
    obj.label242:setVertTextAlign("center");
    obj.label242:setLeft(270);
    obj.label242:setTop(0);
    obj.label242:setWidth(30);
    obj.label242:setHeight(25);
    obj.label242:setField("cd1");
    obj.label242:setName("label242");
    obj.label242:setFontColor("white");
    obj.label242:setTextTrimming("none");
    obj.label242:setWordWrap(false);
    obj.label242:setAutoSize(true);

    obj.dataLink77 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout76);
    obj.dataLink77:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink77:setName("dataLink77");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout73);
    obj.layout77:setLeft(0);
    obj.layout77:setTop(115);
    obj.layout77:setWidth(350);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.label243 = gui.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout77);
    obj.label243:setVertTextAlign("center");
    obj.label243:setLeft(10);
    obj.label243:setTop(3);
    obj.label243:setWidth(25);
    obj.label243:setHeight(22);
    obj.label243:setText("2");
    obj.label243:setName("label243");
    obj.label243:setFontColor("white");
    obj.label243:setTextTrimming("none");
    obj.label243:setWordWrap(false);
    obj.label243:setAutoSize(true);

    obj.edit229 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout77);
    obj.edit229:setVertTextAlign("center");
    obj.edit229:setLeft(45);
    obj.edit229:setTop(0);
    obj.edit229:setWidth(30);
    obj.edit229:setHeight(25);
    obj.edit229:setField("total2");
    obj.edit229:setType("number");
    obj.edit229:setName("edit229");

    obj.edit230 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout77);
    obj.edit230:setVertTextAlign("center");
    obj.edit230:setLeft(85);
    obj.edit230:setTop(0);
    obj.edit230:setWidth(30);
    obj.edit230:setHeight(25);
    obj.edit230:setField("base2");
    obj.edit230:setType("number");
    obj.edit230:setName("edit230");

    obj.label244 = gui.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout77);
    obj.label244:setVertTextAlign("center");
    obj.label244:setLeft(140);
    obj.label244:setTop(0);
    obj.label244:setWidth(30);
    obj.label244:setHeight(25);
    obj.label244:setField("bonus2");
    obj.label244:setName("label244");
    obj.label244:setFontColor("white");
    obj.label244:setTextTrimming("none");
    obj.label244:setWordWrap(false);
    obj.label244:setAutoSize(true);

    obj.dataLink78 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout77);
    obj.dataLink78:setFields({'base2', 'bonus2'});
    obj.dataLink78:setName("dataLink78");

    obj.dataLink79 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout77);
    obj.dataLink79:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink79:setName("dataLink79");

    obj.edit231 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout77);
    obj.edit231:setVertTextAlign("center");
    obj.edit231:setLeft(210);
    obj.edit231:setTop(0);
    obj.edit231:setWidth(30);
    obj.edit231:setHeight(25);
    obj.edit231:setField("conhecidas2");
    obj.edit231:setType("number");
    obj.edit231:setName("edit231");

    obj.label245 = gui.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout77);
    obj.label245:setVertTextAlign("center");
    obj.label245:setLeft(270);
    obj.label245:setTop(0);
    obj.label245:setWidth(30);
    obj.label245:setHeight(25);
    obj.label245:setField("cd2");
    obj.label245:setName("label245");
    obj.label245:setFontColor("white");
    obj.label245:setTextTrimming("none");
    obj.label245:setWordWrap(false);
    obj.label245:setAutoSize(true);

    obj.dataLink80 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout77);
    obj.dataLink80:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink80:setName("dataLink80");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout73);
    obj.layout78:setLeft(0);
    obj.layout78:setTop(145);
    obj.layout78:setWidth(350);
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.label246 = gui.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout78);
    obj.label246:setVertTextAlign("center");
    obj.label246:setLeft(10);
    obj.label246:setTop(3);
    obj.label246:setWidth(25);
    obj.label246:setHeight(22);
    obj.label246:setText("3");
    obj.label246:setName("label246");
    obj.label246:setFontColor("white");
    obj.label246:setTextTrimming("none");
    obj.label246:setWordWrap(false);
    obj.label246:setAutoSize(true);

    obj.edit232 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout78);
    obj.edit232:setVertTextAlign("center");
    obj.edit232:setLeft(45);
    obj.edit232:setTop(0);
    obj.edit232:setWidth(30);
    obj.edit232:setHeight(25);
    obj.edit232:setField("total3");
    obj.edit232:setType("number");
    obj.edit232:setName("edit232");

    obj.edit233 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout78);
    obj.edit233:setVertTextAlign("center");
    obj.edit233:setLeft(85);
    obj.edit233:setTop(0);
    obj.edit233:setWidth(30);
    obj.edit233:setHeight(25);
    obj.edit233:setField("base3");
    obj.edit233:setType("number");
    obj.edit233:setName("edit233");

    obj.label247 = gui.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout78);
    obj.label247:setVertTextAlign("center");
    obj.label247:setLeft(140);
    obj.label247:setTop(0);
    obj.label247:setWidth(30);
    obj.label247:setHeight(25);
    obj.label247:setField("bonus3");
    obj.label247:setName("label247");
    obj.label247:setFontColor("white");
    obj.label247:setTextTrimming("none");
    obj.label247:setWordWrap(false);
    obj.label247:setAutoSize(true);

    obj.dataLink81 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout78);
    obj.dataLink81:setFields({'base3', 'bonus3'});
    obj.dataLink81:setName("dataLink81");

    obj.dataLink82 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout78);
    obj.dataLink82:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink82:setName("dataLink82");

    obj.edit234 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout78);
    obj.edit234:setVertTextAlign("center");
    obj.edit234:setLeft(210);
    obj.edit234:setTop(0);
    obj.edit234:setWidth(30);
    obj.edit234:setHeight(25);
    obj.edit234:setField("conhecidas3");
    obj.edit234:setType("number");
    obj.edit234:setName("edit234");

    obj.label248 = gui.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout78);
    obj.label248:setVertTextAlign("center");
    obj.label248:setLeft(270);
    obj.label248:setTop(0);
    obj.label248:setWidth(30);
    obj.label248:setHeight(25);
    obj.label248:setField("cd3");
    obj.label248:setName("label248");
    obj.label248:setFontColor("white");
    obj.label248:setTextTrimming("none");
    obj.label248:setWordWrap(false);
    obj.label248:setAutoSize(true);

    obj.dataLink83 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout78);
    obj.dataLink83:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink83:setName("dataLink83");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout73);
    obj.layout79:setLeft(0);
    obj.layout79:setTop(175);
    obj.layout79:setWidth(350);
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.label249 = gui.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout79);
    obj.label249:setVertTextAlign("center");
    obj.label249:setLeft(10);
    obj.label249:setTop(3);
    obj.label249:setWidth(25);
    obj.label249:setHeight(22);
    obj.label249:setText("4");
    obj.label249:setName("label249");
    obj.label249:setFontColor("white");
    obj.label249:setTextTrimming("none");
    obj.label249:setWordWrap(false);
    obj.label249:setAutoSize(true);

    obj.edit235 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout79);
    obj.edit235:setVertTextAlign("center");
    obj.edit235:setLeft(45);
    obj.edit235:setTop(0);
    obj.edit235:setWidth(30);
    obj.edit235:setHeight(25);
    obj.edit235:setField("total4");
    obj.edit235:setType("number");
    obj.edit235:setName("edit235");

    obj.edit236 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout79);
    obj.edit236:setVertTextAlign("center");
    obj.edit236:setLeft(85);
    obj.edit236:setTop(0);
    obj.edit236:setWidth(30);
    obj.edit236:setHeight(25);
    obj.edit236:setField("base4");
    obj.edit236:setType("number");
    obj.edit236:setName("edit236");

    obj.label250 = gui.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout79);
    obj.label250:setVertTextAlign("center");
    obj.label250:setLeft(140);
    obj.label250:setTop(0);
    obj.label250:setWidth(30);
    obj.label250:setHeight(25);
    obj.label250:setField("bonus4");
    obj.label250:setName("label250");
    obj.label250:setFontColor("white");
    obj.label250:setTextTrimming("none");
    obj.label250:setWordWrap(false);
    obj.label250:setAutoSize(true);

    obj.dataLink84 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout79);
    obj.dataLink84:setFields({'base4', 'bonus4'});
    obj.dataLink84:setName("dataLink84");

    obj.dataLink85 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.layout79);
    obj.dataLink85:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink85:setName("dataLink85");

    obj.edit237 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout79);
    obj.edit237:setVertTextAlign("center");
    obj.edit237:setLeft(210);
    obj.edit237:setTop(0);
    obj.edit237:setWidth(30);
    obj.edit237:setHeight(25);
    obj.edit237:setField("conhecidas4");
    obj.edit237:setType("number");
    obj.edit237:setName("edit237");

    obj.label251 = gui.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.layout79);
    obj.label251:setVertTextAlign("center");
    obj.label251:setLeft(270);
    obj.label251:setTop(0);
    obj.label251:setWidth(30);
    obj.label251:setHeight(25);
    obj.label251:setField("cd4");
    obj.label251:setName("label251");
    obj.label251:setFontColor("white");
    obj.label251:setTextTrimming("none");
    obj.label251:setWordWrap(false);
    obj.label251:setAutoSize(true);

    obj.dataLink86 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout79);
    obj.dataLink86:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink86:setName("dataLink86");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout73);
    obj.layout80:setLeft(0);
    obj.layout80:setTop(205);
    obj.layout80:setWidth(350);
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.label252 = gui.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.layout80);
    obj.label252:setVertTextAlign("center");
    obj.label252:setLeft(10);
    obj.label252:setTop(3);
    obj.label252:setWidth(25);
    obj.label252:setHeight(22);
    obj.label252:setText("5");
    obj.label252:setName("label252");
    obj.label252:setFontColor("white");
    obj.label252:setTextTrimming("none");
    obj.label252:setWordWrap(false);
    obj.label252:setAutoSize(true);

    obj.edit238 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout80);
    obj.edit238:setVertTextAlign("center");
    obj.edit238:setLeft(45);
    obj.edit238:setTop(0);
    obj.edit238:setWidth(30);
    obj.edit238:setHeight(25);
    obj.edit238:setField("total5");
    obj.edit238:setType("number");
    obj.edit238:setName("edit238");

    obj.edit239 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout80);
    obj.edit239:setVertTextAlign("center");
    obj.edit239:setLeft(85);
    obj.edit239:setTop(0);
    obj.edit239:setWidth(30);
    obj.edit239:setHeight(25);
    obj.edit239:setField("base5");
    obj.edit239:setType("number");
    obj.edit239:setName("edit239");

    obj.label253 = gui.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.layout80);
    obj.label253:setVertTextAlign("center");
    obj.label253:setLeft(140);
    obj.label253:setTop(0);
    obj.label253:setWidth(30);
    obj.label253:setHeight(25);
    obj.label253:setField("bonus5");
    obj.label253:setName("label253");
    obj.label253:setFontColor("white");
    obj.label253:setTextTrimming("none");
    obj.label253:setWordWrap(false);
    obj.label253:setAutoSize(true);

    obj.dataLink87 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout80);
    obj.dataLink87:setFields({'base5', 'bonus5'});
    obj.dataLink87:setName("dataLink87");

    obj.dataLink88 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout80);
    obj.dataLink88:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink88:setName("dataLink88");

    obj.edit240 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout80);
    obj.edit240:setVertTextAlign("center");
    obj.edit240:setLeft(210);
    obj.edit240:setTop(0);
    obj.edit240:setWidth(30);
    obj.edit240:setHeight(25);
    obj.edit240:setField("conhecidas5");
    obj.edit240:setType("number");
    obj.edit240:setName("edit240");

    obj.label254 = gui.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.layout80);
    obj.label254:setVertTextAlign("center");
    obj.label254:setLeft(270);
    obj.label254:setTop(0);
    obj.label254:setWidth(30);
    obj.label254:setHeight(25);
    obj.label254:setField("cd5");
    obj.label254:setName("label254");
    obj.label254:setFontColor("white");
    obj.label254:setTextTrimming("none");
    obj.label254:setWordWrap(false);
    obj.label254:setAutoSize(true);

    obj.dataLink89 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout80);
    obj.dataLink89:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink89:setName("dataLink89");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout73);
    obj.layout81:setLeft(0);
    obj.layout81:setTop(235);
    obj.layout81:setWidth(350);
    obj.layout81:setHeight(25);
    obj.layout81:setName("layout81");

    obj.label255 = gui.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.layout81);
    obj.label255:setVertTextAlign("center");
    obj.label255:setLeft(10);
    obj.label255:setTop(3);
    obj.label255:setWidth(25);
    obj.label255:setHeight(22);
    obj.label255:setText("6");
    obj.label255:setName("label255");
    obj.label255:setFontColor("white");
    obj.label255:setTextTrimming("none");
    obj.label255:setWordWrap(false);
    obj.label255:setAutoSize(true);

    obj.edit241 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout81);
    obj.edit241:setVertTextAlign("center");
    obj.edit241:setLeft(45);
    obj.edit241:setTop(0);
    obj.edit241:setWidth(30);
    obj.edit241:setHeight(25);
    obj.edit241:setField("total6");
    obj.edit241:setType("number");
    obj.edit241:setName("edit241");

    obj.edit242 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout81);
    obj.edit242:setVertTextAlign("center");
    obj.edit242:setLeft(85);
    obj.edit242:setTop(0);
    obj.edit242:setWidth(30);
    obj.edit242:setHeight(25);
    obj.edit242:setField("base6");
    obj.edit242:setType("number");
    obj.edit242:setName("edit242");

    obj.label256 = gui.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.layout81);
    obj.label256:setVertTextAlign("center");
    obj.label256:setLeft(140);
    obj.label256:setTop(0);
    obj.label256:setWidth(30);
    obj.label256:setHeight(25);
    obj.label256:setField("bonus6");
    obj.label256:setName("label256");
    obj.label256:setFontColor("white");
    obj.label256:setTextTrimming("none");
    obj.label256:setWordWrap(false);
    obj.label256:setAutoSize(true);

    obj.dataLink90 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.layout81);
    obj.dataLink90:setFields({'base6', 'bonus6'});
    obj.dataLink90:setName("dataLink90");

    obj.dataLink91 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.layout81);
    obj.dataLink91:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink91:setName("dataLink91");

    obj.edit243 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout81);
    obj.edit243:setVertTextAlign("center");
    obj.edit243:setLeft(210);
    obj.edit243:setTop(0);
    obj.edit243:setWidth(30);
    obj.edit243:setHeight(25);
    obj.edit243:setField("conhecidas6");
    obj.edit243:setType("number");
    obj.edit243:setName("edit243");

    obj.label257 = gui.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.layout81);
    obj.label257:setVertTextAlign("center");
    obj.label257:setLeft(270);
    obj.label257:setTop(0);
    obj.label257:setWidth(30);
    obj.label257:setHeight(25);
    obj.label257:setField("cd6");
    obj.label257:setName("label257");
    obj.label257:setFontColor("white");
    obj.label257:setTextTrimming("none");
    obj.label257:setWordWrap(false);
    obj.label257:setAutoSize(true);

    obj.dataLink92 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.layout81);
    obj.dataLink92:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink92:setName("dataLink92");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout73);
    obj.layout82:setLeft(0);
    obj.layout82:setTop(265);
    obj.layout82:setWidth(350);
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.label258 = gui.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.layout82);
    obj.label258:setVertTextAlign("center");
    obj.label258:setLeft(10);
    obj.label258:setTop(3);
    obj.label258:setWidth(25);
    obj.label258:setHeight(22);
    obj.label258:setText("7");
    obj.label258:setName("label258");
    obj.label258:setFontColor("white");
    obj.label258:setTextTrimming("none");
    obj.label258:setWordWrap(false);
    obj.label258:setAutoSize(true);

    obj.edit244 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout82);
    obj.edit244:setVertTextAlign("center");
    obj.edit244:setLeft(45);
    obj.edit244:setTop(0);
    obj.edit244:setWidth(30);
    obj.edit244:setHeight(25);
    obj.edit244:setField("total7");
    obj.edit244:setType("number");
    obj.edit244:setName("edit244");

    obj.edit245 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout82);
    obj.edit245:setVertTextAlign("center");
    obj.edit245:setLeft(85);
    obj.edit245:setTop(0);
    obj.edit245:setWidth(30);
    obj.edit245:setHeight(25);
    obj.edit245:setField("base7");
    obj.edit245:setType("number");
    obj.edit245:setName("edit245");

    obj.label259 = gui.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.layout82);
    obj.label259:setVertTextAlign("center");
    obj.label259:setLeft(140);
    obj.label259:setTop(0);
    obj.label259:setWidth(30);
    obj.label259:setHeight(25);
    obj.label259:setField("bonus7");
    obj.label259:setName("label259");
    obj.label259:setFontColor("white");
    obj.label259:setTextTrimming("none");
    obj.label259:setWordWrap(false);
    obj.label259:setAutoSize(true);

    obj.dataLink93 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.layout82);
    obj.dataLink93:setFields({'base7', 'bonus7'});
    obj.dataLink93:setName("dataLink93");

    obj.dataLink94 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.layout82);
    obj.dataLink94:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink94:setName("dataLink94");

    obj.edit246 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout82);
    obj.edit246:setVertTextAlign("center");
    obj.edit246:setLeft(210);
    obj.edit246:setTop(0);
    obj.edit246:setWidth(30);
    obj.edit246:setHeight(25);
    obj.edit246:setField("conhecidas7");
    obj.edit246:setType("number");
    obj.edit246:setName("edit246");

    obj.label260 = gui.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.layout82);
    obj.label260:setVertTextAlign("center");
    obj.label260:setLeft(270);
    obj.label260:setTop(0);
    obj.label260:setWidth(30);
    obj.label260:setHeight(25);
    obj.label260:setField("cd7");
    obj.label260:setName("label260");
    obj.label260:setFontColor("white");
    obj.label260:setTextTrimming("none");
    obj.label260:setWordWrap(false);
    obj.label260:setAutoSize(true);

    obj.dataLink95 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.layout82);
    obj.dataLink95:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink95:setName("dataLink95");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout73);
    obj.layout83:setLeft(0);
    obj.layout83:setTop(295);
    obj.layout83:setWidth(350);
    obj.layout83:setHeight(25);
    obj.layout83:setName("layout83");

    obj.label261 = gui.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.layout83);
    obj.label261:setVertTextAlign("center");
    obj.label261:setLeft(10);
    obj.label261:setTop(3);
    obj.label261:setWidth(25);
    obj.label261:setHeight(22);
    obj.label261:setText("8");
    obj.label261:setName("label261");
    obj.label261:setFontColor("white");
    obj.label261:setTextTrimming("none");
    obj.label261:setWordWrap(false);
    obj.label261:setAutoSize(true);

    obj.edit247 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout83);
    obj.edit247:setVertTextAlign("center");
    obj.edit247:setLeft(45);
    obj.edit247:setTop(0);
    obj.edit247:setWidth(30);
    obj.edit247:setHeight(25);
    obj.edit247:setField("total8");
    obj.edit247:setType("number");
    obj.edit247:setName("edit247");

    obj.edit248 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout83);
    obj.edit248:setVertTextAlign("center");
    obj.edit248:setLeft(85);
    obj.edit248:setTop(0);
    obj.edit248:setWidth(30);
    obj.edit248:setHeight(25);
    obj.edit248:setField("base8");
    obj.edit248:setType("number");
    obj.edit248:setName("edit248");

    obj.label262 = gui.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.layout83);
    obj.label262:setVertTextAlign("center");
    obj.label262:setLeft(140);
    obj.label262:setTop(0);
    obj.label262:setWidth(30);
    obj.label262:setHeight(25);
    obj.label262:setField("bonus8");
    obj.label262:setName("label262");
    obj.label262:setFontColor("white");
    obj.label262:setTextTrimming("none");
    obj.label262:setWordWrap(false);
    obj.label262:setAutoSize(true);

    obj.dataLink96 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.layout83);
    obj.dataLink96:setFields({'base8', 'bonus8'});
    obj.dataLink96:setName("dataLink96");

    obj.dataLink97 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.layout83);
    obj.dataLink97:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink97:setName("dataLink97");

    obj.edit249 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout83);
    obj.edit249:setVertTextAlign("center");
    obj.edit249:setLeft(210);
    obj.edit249:setTop(0);
    obj.edit249:setWidth(30);
    obj.edit249:setHeight(25);
    obj.edit249:setField("conhecidas8");
    obj.edit249:setType("number");
    obj.edit249:setName("edit249");

    obj.label263 = gui.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.layout83);
    obj.label263:setVertTextAlign("center");
    obj.label263:setLeft(270);
    obj.label263:setTop(0);
    obj.label263:setWidth(30);
    obj.label263:setHeight(25);
    obj.label263:setField("cd8");
    obj.label263:setName("label263");
    obj.label263:setFontColor("white");
    obj.label263:setTextTrimming("none");
    obj.label263:setWordWrap(false);
    obj.label263:setAutoSize(true);

    obj.dataLink98 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout83);
    obj.dataLink98:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink98:setName("dataLink98");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout73);
    obj.layout84:setLeft(0);
    obj.layout84:setTop(325);
    obj.layout84:setWidth(350);
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.label264 = gui.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.layout84);
    obj.label264:setVertTextAlign("center");
    obj.label264:setLeft(10);
    obj.label264:setTop(3);
    obj.label264:setWidth(25);
    obj.label264:setHeight(22);
    obj.label264:setText("9");
    obj.label264:setName("label264");
    obj.label264:setFontColor("white");
    obj.label264:setTextTrimming("none");
    obj.label264:setWordWrap(false);
    obj.label264:setAutoSize(true);

    obj.edit250 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout84);
    obj.edit250:setVertTextAlign("center");
    obj.edit250:setLeft(45);
    obj.edit250:setTop(0);
    obj.edit250:setWidth(30);
    obj.edit250:setHeight(25);
    obj.edit250:setField("total9");
    obj.edit250:setType("number");
    obj.edit250:setName("edit250");

    obj.edit251 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout84);
    obj.edit251:setVertTextAlign("center");
    obj.edit251:setLeft(85);
    obj.edit251:setTop(0);
    obj.edit251:setWidth(30);
    obj.edit251:setHeight(25);
    obj.edit251:setField("base9");
    obj.edit251:setType("number");
    obj.edit251:setName("edit251");

    obj.label265 = gui.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.layout84);
    obj.label265:setVertTextAlign("center");
    obj.label265:setLeft(140);
    obj.label265:setTop(0);
    obj.label265:setWidth(30);
    obj.label265:setHeight(25);
    obj.label265:setField("bonus9");
    obj.label265:setName("label265");
    obj.label265:setFontColor("white");
    obj.label265:setTextTrimming("none");
    obj.label265:setWordWrap(false);
    obj.label265:setAutoSize(true);

    obj.dataLink99 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.layout84);
    obj.dataLink99:setFields({'base9', 'bonus9'});
    obj.dataLink99:setName("dataLink99");

    obj.dataLink100 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.layout84);
    obj.dataLink100:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink100:setName("dataLink100");

    obj.edit252 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout84);
    obj.edit252:setVertTextAlign("center");
    obj.edit252:setLeft(210);
    obj.edit252:setTop(0);
    obj.edit252:setWidth(30);
    obj.edit252:setHeight(25);
    obj.edit252:setField("conhecidas9");
    obj.edit252:setType("number");
    obj.edit252:setName("edit252");

    obj.label266 = gui.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.layout84);
    obj.label266:setVertTextAlign("center");
    obj.label266:setLeft(270);
    obj.label266:setTop(0);
    obj.label266:setWidth(30);
    obj.label266:setHeight(25);
    obj.label266:setField("cd9");
    obj.label266:setName("label266");
    obj.label266:setFontColor("white");
    obj.label266:setTextTrimming("none");
    obj.label266:setWordWrap(false);
    obj.label266:setAutoSize(true);

    obj.dataLink101 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.layout84);
    obj.dataLink101:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink101:setName("dataLink101");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layoutListaMagias);
    obj.layout85:setLeft(50);
    obj.layout85:setTop(360);
    obj.layout85:setWidth(280);
    obj.layout85:setHeight(180);
    obj.layout85:setName("layout85");

    obj.rectangle81 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout85);
    obj.rectangle81:setAlign("client");
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout85);
    obj.button22:setText("+");
    obj.button22:setLeft(5);
    obj.button22:setTop(5);
    obj.button22:setWidth(20);
    obj.button22:setHeight(20);
    obj.button22:setName("button22");

    obj.label267 = gui.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.layout85);
    obj.label267:setVertTextAlign("center");
    obj.label267:setLeft(50);
    obj.label267:setTop(5);
    obj.label267:setWidth(100);
    obj.label267:setHeight(20);
    obj.label267:setText("Magias Nível 6   PREP USO");
    obj.label267:setName("label267");
    obj.label267:setFontColor("white");
    obj.label267:setTextTrimming("none");
    obj.label267:setWordWrap(false);
    obj.label267:setAutoSize(true);

    obj.rclListaDasMagias6 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias6:setParent(obj.layout85);
    obj.rclListaDasMagias6:setName("rclListaDasMagias6");
    obj.rclListaDasMagias6:setField("campoDasMagias6");
    obj.rclListaDasMagias6:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias6:setLeft(5);
    obj.rclListaDasMagias6:setTop(25);
    obj.rclListaDasMagias6:setWidth(270);
    obj.rclListaDasMagias6:setHeight(150);
    obj.rclListaDasMagias6:setLayout("vertical");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layoutListaMagias);
    obj.layout86:setLeft(340);
    obj.layout86:setTop(0);
    obj.layout86:setWidth(280);
    obj.layout86:setHeight(180);
    obj.layout86:setName("layout86");

    obj.rectangle82 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout86);
    obj.rectangle82:setAlign("client");
    obj.rectangle82:setColor("black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout86);
    obj.button23:setText("+");
    obj.button23:setLeft(5);
    obj.button23:setTop(5);
    obj.button23:setWidth(20);
    obj.button23:setHeight(20);
    obj.button23:setName("button23");

    obj.label268 = gui.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.layout86);
    obj.label268:setVertTextAlign("center");
    obj.label268:setLeft(50);
    obj.label268:setTop(5);
    obj.label268:setWidth(100);
    obj.label268:setHeight(20);
    obj.label268:setText("Magias Nível 0   PREP USO");
    obj.label268:setName("label268");
    obj.label268:setFontColor("white");
    obj.label268:setTextTrimming("none");
    obj.label268:setWordWrap(false);
    obj.label268:setAutoSize(true);

    obj.rclListaDasMagias0 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias0:setParent(obj.layout86);
    obj.rclListaDasMagias0:setName("rclListaDasMagias0");
    obj.rclListaDasMagias0:setField("campoDasMagias0");
    obj.rclListaDasMagias0:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias0:setLeft(5);
    obj.rclListaDasMagias0:setTop(25);
    obj.rclListaDasMagias0:setWidth(270);
    obj.rclListaDasMagias0:setHeight(150);
    obj.rclListaDasMagias0:setLayout("vertical");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layoutListaMagias);
    obj.layout87:setLeft(340);
    obj.layout87:setTop(180);
    obj.layout87:setWidth(280);
    obj.layout87:setHeight(180);
    obj.layout87:setName("layout87");

    obj.rectangle83 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout87);
    obj.rectangle83:setAlign("client");
    obj.rectangle83:setColor("black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout87);
    obj.button24:setText("+");
    obj.button24:setLeft(5);
    obj.button24:setTop(5);
    obj.button24:setWidth(20);
    obj.button24:setHeight(20);
    obj.button24:setName("button24");

    obj.label269 = gui.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.layout87);
    obj.label269:setVertTextAlign("center");
    obj.label269:setLeft(50);
    obj.label269:setTop(5);
    obj.label269:setWidth(100);
    obj.label269:setHeight(20);
    obj.label269:setText("Magias Nível 3   PREP USO");
    obj.label269:setName("label269");
    obj.label269:setFontColor("white");
    obj.label269:setTextTrimming("none");
    obj.label269:setWordWrap(false);
    obj.label269:setAutoSize(true);

    obj.rclListaDasMagias3 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias3:setParent(obj.layout87);
    obj.rclListaDasMagias3:setName("rclListaDasMagias3");
    obj.rclListaDasMagias3:setField("campoDasMagias3");
    obj.rclListaDasMagias3:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias3:setLeft(5);
    obj.rclListaDasMagias3:setTop(25);
    obj.rclListaDasMagias3:setWidth(270);
    obj.rclListaDasMagias3:setHeight(150);
    obj.rclListaDasMagias3:setLayout("vertical");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layoutListaMagias);
    obj.layout88:setLeft(340);
    obj.layout88:setTop(360);
    obj.layout88:setWidth(280);
    obj.layout88:setHeight(180);
    obj.layout88:setName("layout88");

    obj.rectangle84 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout88);
    obj.rectangle84:setAlign("client");
    obj.rectangle84:setColor("black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout88);
    obj.button25:setText("+");
    obj.button25:setLeft(5);
    obj.button25:setTop(5);
    obj.button25:setWidth(20);
    obj.button25:setHeight(20);
    obj.button25:setName("button25");

    obj.label270 = gui.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.layout88);
    obj.label270:setVertTextAlign("center");
    obj.label270:setLeft(50);
    obj.label270:setTop(5);
    obj.label270:setWidth(100);
    obj.label270:setHeight(20);
    obj.label270:setText("Magias Nível 7   PREP USO");
    obj.label270:setName("label270");
    obj.label270:setFontColor("white");
    obj.label270:setTextTrimming("none");
    obj.label270:setWordWrap(false);
    obj.label270:setAutoSize(true);

    obj.rclListaDasMagias7 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias7:setParent(obj.layout88);
    obj.rclListaDasMagias7:setName("rclListaDasMagias7");
    obj.rclListaDasMagias7:setField("campoDasMagias7");
    obj.rclListaDasMagias7:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias7:setLeft(5);
    obj.rclListaDasMagias7:setTop(25);
    obj.rclListaDasMagias7:setWidth(270);
    obj.rclListaDasMagias7:setHeight(150);
    obj.rclListaDasMagias7:setLayout("vertical");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layoutListaMagias);
    obj.layout89:setLeft(630);
    obj.layout89:setTop(0);
    obj.layout89:setWidth(280);
    obj.layout89:setHeight(180);
    obj.layout89:setName("layout89");

    obj.rectangle85 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout89);
    obj.rectangle85:setAlign("client");
    obj.rectangle85:setColor("black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout89);
    obj.button26:setText("+");
    obj.button26:setLeft(5);
    obj.button26:setTop(5);
    obj.button26:setWidth(20);
    obj.button26:setHeight(20);
    obj.button26:setName("button26");

    obj.label271 = gui.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.layout89);
    obj.label271:setVertTextAlign("center");
    obj.label271:setLeft(50);
    obj.label271:setTop(5);
    obj.label271:setWidth(100);
    obj.label271:setHeight(20);
    obj.label271:setText("Magias Nível 1   PREP USO");
    obj.label271:setName("label271");
    obj.label271:setFontColor("white");
    obj.label271:setTextTrimming("none");
    obj.label271:setWordWrap(false);
    obj.label271:setAutoSize(true);

    obj.rclListaDasMagias1 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias1:setParent(obj.layout89);
    obj.rclListaDasMagias1:setName("rclListaDasMagias1");
    obj.rclListaDasMagias1:setField("campoDasMagias1");
    obj.rclListaDasMagias1:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias1:setLeft(5);
    obj.rclListaDasMagias1:setTop(25);
    obj.rclListaDasMagias1:setWidth(270);
    obj.rclListaDasMagias1:setHeight(150);
    obj.rclListaDasMagias1:setLayout("vertical");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layoutListaMagias);
    obj.layout90:setLeft(630);
    obj.layout90:setTop(180);
    obj.layout90:setWidth(280);
    obj.layout90:setHeight(180);
    obj.layout90:setName("layout90");

    obj.rectangle86 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout90);
    obj.rectangle86:setAlign("client");
    obj.rectangle86:setColor("black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.button27 = gui.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout90);
    obj.button27:setText("+");
    obj.button27:setLeft(5);
    obj.button27:setTop(5);
    obj.button27:setWidth(20);
    obj.button27:setHeight(20);
    obj.button27:setName("button27");

    obj.label272 = gui.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.layout90);
    obj.label272:setVertTextAlign("center");
    obj.label272:setLeft(50);
    obj.label272:setTop(5);
    obj.label272:setWidth(100);
    obj.label272:setHeight(20);
    obj.label272:setText("Magias Nível 4   PREP USO");
    obj.label272:setName("label272");
    obj.label272:setFontColor("white");
    obj.label272:setTextTrimming("none");
    obj.label272:setWordWrap(false);
    obj.label272:setAutoSize(true);

    obj.rclListaDasMagias4 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias4:setParent(obj.layout90);
    obj.rclListaDasMagias4:setName("rclListaDasMagias4");
    obj.rclListaDasMagias4:setField("campoDasMagias4");
    obj.rclListaDasMagias4:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias4:setLeft(5);
    obj.rclListaDasMagias4:setTop(25);
    obj.rclListaDasMagias4:setWidth(270);
    obj.rclListaDasMagias4:setHeight(150);
    obj.rclListaDasMagias4:setLayout("vertical");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layoutListaMagias);
    obj.layout91:setLeft(630);
    obj.layout91:setTop(360);
    obj.layout91:setWidth(280);
    obj.layout91:setHeight(180);
    obj.layout91:setName("layout91");

    obj.rectangle87 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout91);
    obj.rectangle87:setAlign("client");
    obj.rectangle87:setColor("black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.button28 = gui.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout91);
    obj.button28:setText("+");
    obj.button28:setLeft(5);
    obj.button28:setTop(5);
    obj.button28:setWidth(20);
    obj.button28:setHeight(20);
    obj.button28:setName("button28");

    obj.label273 = gui.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.layout91);
    obj.label273:setVertTextAlign("center");
    obj.label273:setLeft(50);
    obj.label273:setTop(5);
    obj.label273:setWidth(100);
    obj.label273:setHeight(20);
    obj.label273:setText("Magias Nível 8   PREP USO");
    obj.label273:setName("label273");
    obj.label273:setFontColor("white");
    obj.label273:setTextTrimming("none");
    obj.label273:setWordWrap(false);
    obj.label273:setAutoSize(true);

    obj.rclListaDasMagias8 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias8:setParent(obj.layout91);
    obj.rclListaDasMagias8:setName("rclListaDasMagias8");
    obj.rclListaDasMagias8:setField("campoDasMagias8");
    obj.rclListaDasMagias8:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias8:setLeft(5);
    obj.rclListaDasMagias8:setTop(25);
    obj.rclListaDasMagias8:setWidth(270);
    obj.rclListaDasMagias8:setHeight(150);
    obj.rclListaDasMagias8:setLayout("vertical");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layoutListaMagias);
    obj.layout92:setLeft(920);
    obj.layout92:setTop(0);
    obj.layout92:setWidth(280);
    obj.layout92:setHeight(180);
    obj.layout92:setName("layout92");

    obj.rectangle88 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout92);
    obj.rectangle88:setAlign("client");
    obj.rectangle88:setColor("black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.button29 = gui.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout92);
    obj.button29:setText("+");
    obj.button29:setLeft(5);
    obj.button29:setTop(5);
    obj.button29:setWidth(20);
    obj.button29:setHeight(20);
    obj.button29:setName("button29");

    obj.label274 = gui.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.layout92);
    obj.label274:setVertTextAlign("center");
    obj.label274:setLeft(50);
    obj.label274:setTop(5);
    obj.label274:setWidth(100);
    obj.label274:setHeight(20);
    obj.label274:setText("Magias Nível 2   PREP USO");
    obj.label274:setName("label274");
    obj.label274:setFontColor("white");
    obj.label274:setTextTrimming("none");
    obj.label274:setWordWrap(false);
    obj.label274:setAutoSize(true);

    obj.rclListaDasMagias2 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias2:setParent(obj.layout92);
    obj.rclListaDasMagias2:setName("rclListaDasMagias2");
    obj.rclListaDasMagias2:setField("campoDasMagias2");
    obj.rclListaDasMagias2:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias2:setLeft(5);
    obj.rclListaDasMagias2:setTop(25);
    obj.rclListaDasMagias2:setWidth(270);
    obj.rclListaDasMagias2:setHeight(150);
    obj.rclListaDasMagias2:setLayout("vertical");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layoutListaMagias);
    obj.layout93:setLeft(920);
    obj.layout93:setTop(180);
    obj.layout93:setWidth(280);
    obj.layout93:setHeight(180);
    obj.layout93:setName("layout93");

    obj.rectangle89 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout93);
    obj.rectangle89:setAlign("client");
    obj.rectangle89:setColor("black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.button30 = gui.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout93);
    obj.button30:setText("+");
    obj.button30:setLeft(5);
    obj.button30:setTop(5);
    obj.button30:setWidth(20);
    obj.button30:setHeight(20);
    obj.button30:setName("button30");

    obj.label275 = gui.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.layout93);
    obj.label275:setVertTextAlign("center");
    obj.label275:setLeft(50);
    obj.label275:setTop(5);
    obj.label275:setWidth(100);
    obj.label275:setHeight(20);
    obj.label275:setText("Magias Nível 5   PREP USO");
    obj.label275:setName("label275");
    obj.label275:setFontColor("white");
    obj.label275:setTextTrimming("none");
    obj.label275:setWordWrap(false);
    obj.label275:setAutoSize(true);

    obj.rclListaDasMagias5 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias5:setParent(obj.layout93);
    obj.rclListaDasMagias5:setName("rclListaDasMagias5");
    obj.rclListaDasMagias5:setField("campoDasMagias5");
    obj.rclListaDasMagias5:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias5:setLeft(5);
    obj.rclListaDasMagias5:setTop(25);
    obj.rclListaDasMagias5:setWidth(270);
    obj.rclListaDasMagias5:setHeight(150);
    obj.rclListaDasMagias5:setLayout("vertical");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layoutListaMagias);
    obj.layout94:setLeft(920);
    obj.layout94:setTop(360);
    obj.layout94:setWidth(280);
    obj.layout94:setHeight(180);
    obj.layout94:setName("layout94");

    obj.rectangle90 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout94);
    obj.rectangle90:setAlign("client");
    obj.rectangle90:setColor("black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.button31 = gui.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout94);
    obj.button31:setText("+");
    obj.button31:setLeft(5);
    obj.button31:setTop(5);
    obj.button31:setWidth(20);
    obj.button31:setHeight(20);
    obj.button31:setName("button31");

    obj.label276 = gui.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.layout94);
    obj.label276:setVertTextAlign("center");
    obj.label276:setLeft(50);
    obj.label276:setTop(5);
    obj.label276:setWidth(100);
    obj.label276:setHeight(20);
    obj.label276:setText("Magias Nível 9   PREP USO");
    obj.label276:setName("label276");
    obj.label276:setFontColor("white");
    obj.label276:setTextTrimming("none");
    obj.label276:setWordWrap(false);
    obj.label276:setAutoSize(true);

    obj.rclListaDasMagias9 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasMagias9:setParent(obj.layout94);
    obj.rclListaDasMagias9:setName("rclListaDasMagias9");
    obj.rclListaDasMagias9:setField("campoDasMagias9");
    obj.rclListaDasMagias9:setTemplateForm("frmFichaRPGmeister5D_svg");
    obj.rclListaDasMagias9:setLeft(5);
    obj.rclListaDasMagias9:setTop(25);
    obj.rclListaDasMagias9:setWidth(270);
    obj.rclListaDasMagias9:setHeight(150);
    obj.rclListaDasMagias9:setLayout("vertical");

    obj.layoutMagiasEpicas = gui.fromHandle(_obj_newObject("layout"));
    obj.layoutMagiasEpicas:setParent(obj.boxDetalhesDoItem);
    obj.layoutMagiasEpicas:setLeft(0);
    obj.layoutMagiasEpicas:setTop(50);
    obj.layoutMagiasEpicas:setWidth(1200);
    obj.layoutMagiasEpicas:setHeight(550);
    obj.layoutMagiasEpicas:setName("layoutMagiasEpicas");
    obj.layoutMagiasEpicas:setVisible(false);

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layoutMagiasEpicas);
    obj.layout95:setLeft(50);
    obj.layout95:setTop(360);
    obj.layout95:setWidth(280);
    obj.layout95:setHeight(180);
    obj.layout95:setName("layout95");

    obj.edit253 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout95);
    obj.edit253:setVertTextAlign("center");
    obj.edit253:setLeft(0);
    obj.edit253:setTop(5);
    obj.edit253:setWidth(200);
    obj.edit253:setHeight(20);
    obj.edit253:setField("nomeMagiaEpica0");
    obj.edit253:setName("edit253");

    obj.label277 = gui.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.layout95);
    obj.label277:setVertTextAlign("center");
    obj.label277:setLeft(205);
    obj.label277:setTop(5);
    obj.label277:setWidth(30);
    obj.label277:setHeight(20);
    obj.label277:setText("Teste");
    obj.label277:setName("label277");
    obj.label277:setFontColor("white");
    obj.label277:setTextTrimming("none");
    obj.label277:setWordWrap(false);
    obj.label277:setAutoSize(true);

    obj.edit254 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout95);
    obj.edit254:setVertTextAlign("center");
    obj.edit254:setLeft(240);
    obj.edit254:setTop(5);
    obj.edit254:setWidth(40);
    obj.edit254:setHeight(20);
    obj.edit254:setField("cdMagiaEpica0");
    obj.edit254:setName("edit254");

    obj.textEditor26 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor26:setParent(obj.layout95);
    obj.textEditor26:setTop(25);
    obj.textEditor26:setWidth(280);
    obj.textEditor26:setHeight(155);
    obj.textEditor26:setFontSize(12);
    obj.textEditor26:setField("descricaoMagiaEpica0");
    obj.textEditor26:setName("textEditor26");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layoutMagiasEpicas);
    obj.layout96:setLeft(340);
    obj.layout96:setTop(0);
    obj.layout96:setWidth(280);
    obj.layout96:setHeight(180);
    obj.layout96:setName("layout96");

    obj.edit255 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout96);
    obj.edit255:setVertTextAlign("center");
    obj.edit255:setLeft(0);
    obj.edit255:setTop(5);
    obj.edit255:setWidth(200);
    obj.edit255:setHeight(20);
    obj.edit255:setField("nomeMagiaEpica1");
    obj.edit255:setName("edit255");

    obj.label278 = gui.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.layout96);
    obj.label278:setVertTextAlign("center");
    obj.label278:setLeft(205);
    obj.label278:setTop(5);
    obj.label278:setWidth(30);
    obj.label278:setHeight(20);
    obj.label278:setText("Teste");
    obj.label278:setName("label278");
    obj.label278:setFontColor("white");
    obj.label278:setTextTrimming("none");
    obj.label278:setWordWrap(false);
    obj.label278:setAutoSize(true);

    obj.edit256 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout96);
    obj.edit256:setVertTextAlign("center");
    obj.edit256:setLeft(240);
    obj.edit256:setTop(5);
    obj.edit256:setWidth(40);
    obj.edit256:setHeight(20);
    obj.edit256:setField("cdMagiaEpica1");
    obj.edit256:setName("edit256");

    obj.textEditor27 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor27:setParent(obj.layout96);
    obj.textEditor27:setTop(25);
    obj.textEditor27:setWidth(280);
    obj.textEditor27:setHeight(155);
    obj.textEditor27:setFontSize(12);
    obj.textEditor27:setField("descricaoMagiaEpica1");
    obj.textEditor27:setName("textEditor27");

    obj.layout97 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layoutMagiasEpicas);
    obj.layout97:setLeft(340);
    obj.layout97:setTop(180);
    obj.layout97:setWidth(280);
    obj.layout97:setHeight(180);
    obj.layout97:setName("layout97");

    obj.edit257 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout97);
    obj.edit257:setVertTextAlign("center");
    obj.edit257:setLeft(0);
    obj.edit257:setTop(5);
    obj.edit257:setWidth(200);
    obj.edit257:setHeight(20);
    obj.edit257:setField("nomeMagiaEpica2");
    obj.edit257:setName("edit257");

    obj.label279 = gui.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.layout97);
    obj.label279:setVertTextAlign("center");
    obj.label279:setLeft(205);
    obj.label279:setTop(5);
    obj.label279:setWidth(30);
    obj.label279:setHeight(20);
    obj.label279:setText("Teste");
    obj.label279:setName("label279");
    obj.label279:setFontColor("white");
    obj.label279:setTextTrimming("none");
    obj.label279:setWordWrap(false);
    obj.label279:setAutoSize(true);

    obj.edit258 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout97);
    obj.edit258:setVertTextAlign("center");
    obj.edit258:setLeft(240);
    obj.edit258:setTop(5);
    obj.edit258:setWidth(40);
    obj.edit258:setHeight(20);
    obj.edit258:setField("cdMagiaEpica2");
    obj.edit258:setName("edit258");

    obj.textEditor28 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor28:setParent(obj.layout97);
    obj.textEditor28:setTop(25);
    obj.textEditor28:setWidth(280);
    obj.textEditor28:setHeight(155);
    obj.textEditor28:setFontSize(12);
    obj.textEditor28:setField("descricaoMagiaEpica2");
    obj.textEditor28:setName("textEditor28");

    obj.layout98 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.layoutMagiasEpicas);
    obj.layout98:setLeft(340);
    obj.layout98:setTop(360);
    obj.layout98:setWidth(280);
    obj.layout98:setHeight(180);
    obj.layout98:setName("layout98");

    obj.edit259 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout98);
    obj.edit259:setVertTextAlign("center");
    obj.edit259:setLeft(0);
    obj.edit259:setTop(5);
    obj.edit259:setWidth(200);
    obj.edit259:setHeight(20);
    obj.edit259:setField("nomeMagiaEpica3");
    obj.edit259:setName("edit259");

    obj.label280 = gui.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.layout98);
    obj.label280:setVertTextAlign("center");
    obj.label280:setLeft(205);
    obj.label280:setTop(5);
    obj.label280:setWidth(30);
    obj.label280:setHeight(20);
    obj.label280:setText("Teste");
    obj.label280:setName("label280");
    obj.label280:setFontColor("white");
    obj.label280:setTextTrimming("none");
    obj.label280:setWordWrap(false);
    obj.label280:setAutoSize(true);

    obj.edit260 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout98);
    obj.edit260:setVertTextAlign("center");
    obj.edit260:setLeft(240);
    obj.edit260:setTop(5);
    obj.edit260:setWidth(40);
    obj.edit260:setHeight(20);
    obj.edit260:setField("cdMagiaEpica3");
    obj.edit260:setName("edit260");

    obj.textEditor29 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor29:setParent(obj.layout98);
    obj.textEditor29:setTop(25);
    obj.textEditor29:setWidth(280);
    obj.textEditor29:setHeight(155);
    obj.textEditor29:setFontSize(12);
    obj.textEditor29:setField("descricaoMagiaEpica3");
    obj.textEditor29:setName("textEditor29");

    obj.layout99 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layoutMagiasEpicas);
    obj.layout99:setLeft(630);
    obj.layout99:setTop(0);
    obj.layout99:setWidth(280);
    obj.layout99:setHeight(180);
    obj.layout99:setName("layout99");

    obj.edit261 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout99);
    obj.edit261:setVertTextAlign("center");
    obj.edit261:setLeft(0);
    obj.edit261:setTop(5);
    obj.edit261:setWidth(200);
    obj.edit261:setHeight(20);
    obj.edit261:setField("nomeMagiaEpica4");
    obj.edit261:setName("edit261");

    obj.label281 = gui.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.layout99);
    obj.label281:setVertTextAlign("center");
    obj.label281:setLeft(205);
    obj.label281:setTop(5);
    obj.label281:setWidth(30);
    obj.label281:setHeight(20);
    obj.label281:setText("Teste");
    obj.label281:setName("label281");
    obj.label281:setFontColor("white");
    obj.label281:setTextTrimming("none");
    obj.label281:setWordWrap(false);
    obj.label281:setAutoSize(true);

    obj.edit262 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout99);
    obj.edit262:setVertTextAlign("center");
    obj.edit262:setLeft(240);
    obj.edit262:setTop(5);
    obj.edit262:setWidth(40);
    obj.edit262:setHeight(20);
    obj.edit262:setField("cdMagiaEpica4");
    obj.edit262:setName("edit262");

    obj.textEditor30 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor30:setParent(obj.layout99);
    obj.textEditor30:setTop(25);
    obj.textEditor30:setWidth(280);
    obj.textEditor30:setHeight(155);
    obj.textEditor30:setFontSize(12);
    obj.textEditor30:setField("descricaoMagiaEpica4");
    obj.textEditor30:setName("textEditor30");

    obj.layout100 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layoutMagiasEpicas);
    obj.layout100:setLeft(630);
    obj.layout100:setTop(180);
    obj.layout100:setWidth(280);
    obj.layout100:setHeight(180);
    obj.layout100:setName("layout100");

    obj.edit263 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout100);
    obj.edit263:setVertTextAlign("center");
    obj.edit263:setLeft(0);
    obj.edit263:setTop(5);
    obj.edit263:setWidth(200);
    obj.edit263:setHeight(20);
    obj.edit263:setField("nomeMagiaEpica5");
    obj.edit263:setName("edit263");

    obj.label282 = gui.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.layout100);
    obj.label282:setVertTextAlign("center");
    obj.label282:setLeft(205);
    obj.label282:setTop(5);
    obj.label282:setWidth(30);
    obj.label282:setHeight(20);
    obj.label282:setText("Teste");
    obj.label282:setName("label282");
    obj.label282:setFontColor("white");
    obj.label282:setTextTrimming("none");
    obj.label282:setWordWrap(false);
    obj.label282:setAutoSize(true);

    obj.edit264 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout100);
    obj.edit264:setVertTextAlign("center");
    obj.edit264:setLeft(240);
    obj.edit264:setTop(5);
    obj.edit264:setWidth(40);
    obj.edit264:setHeight(20);
    obj.edit264:setField("cdMagiaEpica5");
    obj.edit264:setName("edit264");

    obj.textEditor31 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor31:setParent(obj.layout100);
    obj.textEditor31:setTop(25);
    obj.textEditor31:setWidth(280);
    obj.textEditor31:setHeight(155);
    obj.textEditor31:setFontSize(12);
    obj.textEditor31:setField("descricaoMagiaEpica5");
    obj.textEditor31:setName("textEditor31");

    obj.layout101 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layoutMagiasEpicas);
    obj.layout101:setLeft(630);
    obj.layout101:setTop(360);
    obj.layout101:setWidth(280);
    obj.layout101:setHeight(180);
    obj.layout101:setName("layout101");

    obj.edit265 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout101);
    obj.edit265:setVertTextAlign("center");
    obj.edit265:setLeft(0);
    obj.edit265:setTop(5);
    obj.edit265:setWidth(200);
    obj.edit265:setHeight(20);
    obj.edit265:setField("nomeMagiaEpica6");
    obj.edit265:setName("edit265");

    obj.label283 = gui.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.layout101);
    obj.label283:setVertTextAlign("center");
    obj.label283:setLeft(205);
    obj.label283:setTop(5);
    obj.label283:setWidth(30);
    obj.label283:setHeight(20);
    obj.label283:setText("Teste");
    obj.label283:setName("label283");
    obj.label283:setFontColor("white");
    obj.label283:setTextTrimming("none");
    obj.label283:setWordWrap(false);
    obj.label283:setAutoSize(true);

    obj.edit266 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout101);
    obj.edit266:setVertTextAlign("center");
    obj.edit266:setLeft(240);
    obj.edit266:setTop(5);
    obj.edit266:setWidth(40);
    obj.edit266:setHeight(20);
    obj.edit266:setField("cdMagiaEpica6");
    obj.edit266:setName("edit266");

    obj.textEditor32 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor32:setParent(obj.layout101);
    obj.textEditor32:setTop(25);
    obj.textEditor32:setWidth(280);
    obj.textEditor32:setHeight(155);
    obj.textEditor32:setFontSize(12);
    obj.textEditor32:setField("descricaoMagiaEpica6");
    obj.textEditor32:setName("textEditor32");

    obj.layout102 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layoutMagiasEpicas);
    obj.layout102:setLeft(920);
    obj.layout102:setTop(0);
    obj.layout102:setWidth(280);
    obj.layout102:setHeight(180);
    obj.layout102:setName("layout102");

    obj.edit267 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout102);
    obj.edit267:setVertTextAlign("center");
    obj.edit267:setLeft(0);
    obj.edit267:setTop(5);
    obj.edit267:setWidth(200);
    obj.edit267:setHeight(20);
    obj.edit267:setField("nomeMagiaEpica7");
    obj.edit267:setName("edit267");

    obj.label284 = gui.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.layout102);
    obj.label284:setVertTextAlign("center");
    obj.label284:setLeft(205);
    obj.label284:setTop(5);
    obj.label284:setWidth(30);
    obj.label284:setHeight(20);
    obj.label284:setText("Teste");
    obj.label284:setName("label284");
    obj.label284:setFontColor("white");
    obj.label284:setTextTrimming("none");
    obj.label284:setWordWrap(false);
    obj.label284:setAutoSize(true);

    obj.edit268 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout102);
    obj.edit268:setVertTextAlign("center");
    obj.edit268:setLeft(240);
    obj.edit268:setTop(5);
    obj.edit268:setWidth(40);
    obj.edit268:setHeight(20);
    obj.edit268:setField("cdMagiaEpica7");
    obj.edit268:setName("edit268");

    obj.textEditor33 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor33:setParent(obj.layout102);
    obj.textEditor33:setTop(25);
    obj.textEditor33:setWidth(280);
    obj.textEditor33:setHeight(155);
    obj.textEditor33:setFontSize(12);
    obj.textEditor33:setField("descricaoMagiaEpica7");
    obj.textEditor33:setName("textEditor33");

    obj.layout103 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layoutMagiasEpicas);
    obj.layout103:setLeft(920);
    obj.layout103:setTop(180);
    obj.layout103:setWidth(280);
    obj.layout103:setHeight(180);
    obj.layout103:setName("layout103");

    obj.edit269 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout103);
    obj.edit269:setVertTextAlign("center");
    obj.edit269:setLeft(0);
    obj.edit269:setTop(5);
    obj.edit269:setWidth(200);
    obj.edit269:setHeight(20);
    obj.edit269:setField("nomeMagiaEpica8");
    obj.edit269:setName("edit269");

    obj.label285 = gui.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.layout103);
    obj.label285:setVertTextAlign("center");
    obj.label285:setLeft(205);
    obj.label285:setTop(5);
    obj.label285:setWidth(30);
    obj.label285:setHeight(20);
    obj.label285:setText("Teste");
    obj.label285:setName("label285");
    obj.label285:setFontColor("white");
    obj.label285:setTextTrimming("none");
    obj.label285:setWordWrap(false);
    obj.label285:setAutoSize(true);

    obj.edit270 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout103);
    obj.edit270:setVertTextAlign("center");
    obj.edit270:setLeft(240);
    obj.edit270:setTop(5);
    obj.edit270:setWidth(40);
    obj.edit270:setHeight(20);
    obj.edit270:setField("cdMagiaEpica8");
    obj.edit270:setName("edit270");

    obj.textEditor34 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor34:setParent(obj.layout103);
    obj.textEditor34:setTop(25);
    obj.textEditor34:setWidth(280);
    obj.textEditor34:setHeight(155);
    obj.textEditor34:setFontSize(12);
    obj.textEditor34:setField("descricaoMagiaEpica8");
    obj.textEditor34:setName("textEditor34");

    obj.layout104 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layoutMagiasEpicas);
    obj.layout104:setLeft(920);
    obj.layout104:setTop(360);
    obj.layout104:setWidth(280);
    obj.layout104:setHeight(180);
    obj.layout104:setName("layout104");

    obj.edit271 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout104);
    obj.edit271:setVertTextAlign("center");
    obj.edit271:setLeft(0);
    obj.edit271:setTop(5);
    obj.edit271:setWidth(200);
    obj.edit271:setHeight(20);
    obj.edit271:setField("nomeMagiaEpica9");
    obj.edit271:setName("edit271");

    obj.label286 = gui.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.layout104);
    obj.label286:setVertTextAlign("center");
    obj.label286:setLeft(205);
    obj.label286:setTop(5);
    obj.label286:setWidth(30);
    obj.label286:setHeight(20);
    obj.label286:setText("Teste");
    obj.label286:setName("label286");
    obj.label286:setFontColor("white");
    obj.label286:setTextTrimming("none");
    obj.label286:setWordWrap(false);
    obj.label286:setAutoSize(true);

    obj.edit272 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout104);
    obj.edit272:setVertTextAlign("center");
    obj.edit272:setLeft(240);
    obj.edit272:setTop(5);
    obj.edit272:setWidth(40);
    obj.edit272:setHeight(20);
    obj.edit272:setField("cdMagiaEpica9");
    obj.edit272:setName("edit272");

    obj.textEditor35 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor35:setParent(obj.layout104);
    obj.textEditor35:setTop(25);
    obj.textEditor35:setWidth(280);
    obj.textEditor35:setHeight(155);
    obj.textEditor35:setFontSize(12);
    obj.textEditor35:setField("descricaoMagiaEpica9");
    obj.textEditor35:setName("textEditor35");

    obj.layoutMagiasAprimoradas = gui.fromHandle(_obj_newObject("layout"));
    obj.layoutMagiasAprimoradas:setParent(obj.boxDetalhesDoItem);
    obj.layoutMagiasAprimoradas:setLeft(0);
    obj.layoutMagiasAprimoradas:setTop(50);
    obj.layoutMagiasAprimoradas:setWidth(1200);
    obj.layoutMagiasAprimoradas:setHeight(550);
    obj.layoutMagiasAprimoradas:setName("layoutMagiasAprimoradas");
    obj.layoutMagiasAprimoradas:setVisible(false);

    obj.layout105 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layoutMagiasAprimoradas);
    obj.layout105:setLeft(10);
    obj.layout105:setTop(0);
    obj.layout105:setWidth(350);
    obj.layout105:setHeight(350);
    obj.layout105:setName("layout105");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout105);
    obj.comboBox7:setLeft(115);
    obj.comboBox7:setTop(0);
    obj.comboBox7:setWidth(60);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox7:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox7:setField("atributoBonus");
    obj.comboBox7:setFontColor("white");
    obj.comboBox7:setName("comboBox7");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout105);
    obj.comboBox8:setLeft(260);
    obj.comboBox8:setTop(0);
    obj.comboBox8:setWidth(60);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox8:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox8:setField("atributoCD");
    obj.comboBox8:setFontColor("white");
    obj.comboBox8:setName("comboBox8");

    obj.layout106 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout105);
    obj.layout106:setLeft(0);
    obj.layout106:setTop(25);
    obj.layout106:setWidth(350);
    obj.layout106:setHeight(25);
    obj.layout106:setName("layout106");

    obj.label287 = gui.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.layout106);
    obj.label287:setVertTextAlign("center");
    obj.label287:setLeft(0);
    obj.label287:setTop(3);
    obj.label287:setWidth(25);
    obj.label287:setHeight(22);
    obj.label287:setText("NÍVEL");
    obj.label287:setName("label287");
    obj.label287:setFontColor("white");
    obj.label287:setTextTrimming("none");
    obj.label287:setWordWrap(false);
    obj.label287:setAutoSize(true);

    obj.label288 = gui.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.layout106);
    obj.label288:setVertTextAlign("center");
    obj.label288:setLeft(40);
    obj.label288:setTop(3);
    obj.label288:setWidth(25);
    obj.label288:setHeight(22);
    obj.label288:setText("TOTAL");
    obj.label288:setName("label288");
    obj.label288:setFontColor("white");
    obj.label288:setTextTrimming("none");
    obj.label288:setWordWrap(false);
    obj.label288:setAutoSize(true);

    obj.label289 = gui.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.layout106);
    obj.label289:setVertTextAlign("center");
    obj.label289:setLeft(85);
    obj.label289:setTop(3);
    obj.label289:setWidth(25);
    obj.label289:setHeight(22);
    obj.label289:setText("BASE");
    obj.label289:setName("label289");
    obj.label289:setFontColor("white");
    obj.label289:setTextTrimming("none");
    obj.label289:setWordWrap(false);
    obj.label289:setAutoSize(true);

    obj.label290 = gui.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.layout106);
    obj.label290:setVertTextAlign("center");
    obj.label290:setLeft(125);
    obj.label290:setTop(3);
    obj.label290:setWidth(25);
    obj.label290:setHeight(22);
    obj.label290:setText("BONUS");
    obj.label290:setName("label290");
    obj.label290:setFontColor("white");
    obj.label290:setTextTrimming("none");
    obj.label290:setWordWrap(false);
    obj.label290:setAutoSize(true);

    obj.label291 = gui.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.layout106);
    obj.label291:setVertTextAlign("center");
    obj.label291:setLeft(180);
    obj.label291:setTop(3);
    obj.label291:setWidth(25);
    obj.label291:setHeight(22);
    obj.label291:setText("CONHECIDAS");
    obj.label291:setName("label291");
    obj.label291:setFontColor("white");
    obj.label291:setTextTrimming("none");
    obj.label291:setWordWrap(false);
    obj.label291:setAutoSize(true);

    obj.label292 = gui.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.layout106);
    obj.label292:setVertTextAlign("center");
    obj.label292:setLeft(270);
    obj.label292:setTop(3);
    obj.label292:setWidth(25);
    obj.label292:setHeight(22);
    obj.label292:setText("CD");
    obj.label292:setName("label292");
    obj.label292:setFontColor("white");
    obj.label292:setTextTrimming("none");
    obj.label292:setWordWrap(false);
    obj.label292:setAutoSize(true);

    obj.layout107 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout105);
    obj.layout107:setLeft(0);
    obj.layout107:setTop(55);
    obj.layout107:setWidth(350);
    obj.layout107:setHeight(25);
    obj.layout107:setName("layout107");

    obj.label293 = gui.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.layout107);
    obj.label293:setVertTextAlign("center");
    obj.label293:setLeft(10);
    obj.label293:setTop(3);
    obj.label293:setWidth(25);
    obj.label293:setHeight(22);
    obj.label293:setText("10");
    obj.label293:setName("label293");
    obj.label293:setFontColor("white");
    obj.label293:setTextTrimming("none");
    obj.label293:setWordWrap(false);
    obj.label293:setAutoSize(true);

    obj.edit273 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout107);
    obj.edit273:setVertTextAlign("center");
    obj.edit273:setLeft(45);
    obj.edit273:setTop(0);
    obj.edit273:setWidth(30);
    obj.edit273:setHeight(25);
    obj.edit273:setField("total10");
    obj.edit273:setType("number");
    obj.edit273:setName("edit273");

    obj.edit274 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout107);
    obj.edit274:setVertTextAlign("center");
    obj.edit274:setLeft(85);
    obj.edit274:setTop(0);
    obj.edit274:setWidth(30);
    obj.edit274:setHeight(25);
    obj.edit274:setField("base10");
    obj.edit274:setType("number");
    obj.edit274:setName("edit274");

    obj.label294 = gui.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.layout107);
    obj.label294:setVertTextAlign("center");
    obj.label294:setLeft(140);
    obj.label294:setTop(0);
    obj.label294:setWidth(30);
    obj.label294:setHeight(25);
    obj.label294:setField("bonus10");
    obj.label294:setName("label294");
    obj.label294:setFontColor("white");
    obj.label294:setTextTrimming("none");
    obj.label294:setWordWrap(false);
    obj.label294:setAutoSize(true);

    obj.dataLink102 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink102:setParent(obj.layout107);
    obj.dataLink102:setFields({'base10', 'bonus10'});
    obj.dataLink102:setName("dataLink102");

    obj.dataLink103 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink103:setParent(obj.layout107);
    obj.dataLink103:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink103:setName("dataLink103");

    obj.edit275 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout107);
    obj.edit275:setVertTextAlign("center");
    obj.edit275:setLeft(210);
    obj.edit275:setTop(0);
    obj.edit275:setWidth(30);
    obj.edit275:setHeight(25);
    obj.edit275:setField("conhecidas10");
    obj.edit275:setType("number");
    obj.edit275:setName("edit275");

    obj.label295 = gui.fromHandle(_obj_newObject("label"));
    obj.label295:setParent(obj.layout107);
    obj.label295:setVertTextAlign("center");
    obj.label295:setLeft(270);
    obj.label295:setTop(0);
    obj.label295:setWidth(30);
    obj.label295:setHeight(25);
    obj.label295:setField("cd10");
    obj.label295:setName("label295");
    obj.label295:setFontColor("white");
    obj.label295:setTextTrimming("none");
    obj.label295:setWordWrap(false);
    obj.label295:setAutoSize(true);

    obj.dataLink104 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink104:setParent(obj.layout107);
    obj.dataLink104:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink104:setName("dataLink104");

    obj.layout108 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout105);
    obj.layout108:setLeft(0);
    obj.layout108:setTop(85);
    obj.layout108:setWidth(350);
    obj.layout108:setHeight(25);
    obj.layout108:setName("layout108");

    obj.label296 = gui.fromHandle(_obj_newObject("label"));
    obj.label296:setParent(obj.layout108);
    obj.label296:setVertTextAlign("center");
    obj.label296:setLeft(10);
    obj.label296:setTop(3);
    obj.label296:setWidth(25);
    obj.label296:setHeight(22);
    obj.label296:setText("11");
    obj.label296:setName("label296");
    obj.label296:setFontColor("white");
    obj.label296:setTextTrimming("none");
    obj.label296:setWordWrap(false);
    obj.label296:setAutoSize(true);

    obj.edit276 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout108);
    obj.edit276:setVertTextAlign("center");
    obj.edit276:setLeft(45);
    obj.edit276:setTop(0);
    obj.edit276:setWidth(30);
    obj.edit276:setHeight(25);
    obj.edit276:setField("total11");
    obj.edit276:setType("number");
    obj.edit276:setName("edit276");

    obj.edit277 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout108);
    obj.edit277:setVertTextAlign("center");
    obj.edit277:setLeft(85);
    obj.edit277:setTop(0);
    obj.edit277:setWidth(30);
    obj.edit277:setHeight(25);
    obj.edit277:setField("base11");
    obj.edit277:setType("number");
    obj.edit277:setName("edit277");

    obj.label297 = gui.fromHandle(_obj_newObject("label"));
    obj.label297:setParent(obj.layout108);
    obj.label297:setVertTextAlign("center");
    obj.label297:setLeft(140);
    obj.label297:setTop(0);
    obj.label297:setWidth(30);
    obj.label297:setHeight(25);
    obj.label297:setField("bonus11");
    obj.label297:setName("label297");
    obj.label297:setFontColor("white");
    obj.label297:setTextTrimming("none");
    obj.label297:setWordWrap(false);
    obj.label297:setAutoSize(true);

    obj.dataLink105 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink105:setParent(obj.layout108);
    obj.dataLink105:setFields({'base11', 'bonus11'});
    obj.dataLink105:setName("dataLink105");

    obj.dataLink106 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink106:setParent(obj.layout108);
    obj.dataLink106:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink106:setName("dataLink106");

    obj.edit278 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout108);
    obj.edit278:setVertTextAlign("center");
    obj.edit278:setLeft(210);
    obj.edit278:setTop(0);
    obj.edit278:setWidth(30);
    obj.edit278:setHeight(25);
    obj.edit278:setField("conhecidas11");
    obj.edit278:setType("number");
    obj.edit278:setName("edit278");

    obj.label298 = gui.fromHandle(_obj_newObject("label"));
    obj.label298:setParent(obj.layout108);
    obj.label298:setVertTextAlign("center");
    obj.label298:setLeft(270);
    obj.label298:setTop(0);
    obj.label298:setWidth(30);
    obj.label298:setHeight(25);
    obj.label298:setField("cd11");
    obj.label298:setName("label298");
    obj.label298:setFontColor("white");
    obj.label298:setTextTrimming("none");
    obj.label298:setWordWrap(false);
    obj.label298:setAutoSize(true);

    obj.dataLink107 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink107:setParent(obj.layout108);
    obj.dataLink107:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink107:setName("dataLink107");

    obj.layout109 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout105);
    obj.layout109:setLeft(0);
    obj.layout109:setTop(115);
    obj.layout109:setWidth(350);
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.label299 = gui.fromHandle(_obj_newObject("label"));
    obj.label299:setParent(obj.layout109);
    obj.label299:setVertTextAlign("center");
    obj.label299:setLeft(10);
    obj.label299:setTop(3);
    obj.label299:setWidth(25);
    obj.label299:setHeight(22);
    obj.label299:setText("12");
    obj.label299:setName("label299");
    obj.label299:setFontColor("white");
    obj.label299:setTextTrimming("none");
    obj.label299:setWordWrap(false);
    obj.label299:setAutoSize(true);

    obj.edit279 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout109);
    obj.edit279:setVertTextAlign("center");
    obj.edit279:setLeft(45);
    obj.edit279:setTop(0);
    obj.edit279:setWidth(30);
    obj.edit279:setHeight(25);
    obj.edit279:setField("total12");
    obj.edit279:setType("number");
    obj.edit279:setName("edit279");

    obj.edit280 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout109);
    obj.edit280:setVertTextAlign("center");
    obj.edit280:setLeft(85);
    obj.edit280:setTop(0);
    obj.edit280:setWidth(30);
    obj.edit280:setHeight(25);
    obj.edit280:setField("base12");
    obj.edit280:setType("number");
    obj.edit280:setName("edit280");

    obj.label300 = gui.fromHandle(_obj_newObject("label"));
    obj.label300:setParent(obj.layout109);
    obj.label300:setVertTextAlign("center");
    obj.label300:setLeft(140);
    obj.label300:setTop(0);
    obj.label300:setWidth(30);
    obj.label300:setHeight(25);
    obj.label300:setField("bonus12");
    obj.label300:setName("label300");
    obj.label300:setFontColor("white");
    obj.label300:setTextTrimming("none");
    obj.label300:setWordWrap(false);
    obj.label300:setAutoSize(true);

    obj.dataLink108 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink108:setParent(obj.layout109);
    obj.dataLink108:setFields({'base12', 'bonus12'});
    obj.dataLink108:setName("dataLink108");

    obj.dataLink109 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink109:setParent(obj.layout109);
    obj.dataLink109:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink109:setName("dataLink109");

    obj.edit281 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout109);
    obj.edit281:setVertTextAlign("center");
    obj.edit281:setLeft(210);
    obj.edit281:setTop(0);
    obj.edit281:setWidth(30);
    obj.edit281:setHeight(25);
    obj.edit281:setField("conhecidas12");
    obj.edit281:setType("number");
    obj.edit281:setName("edit281");

    obj.label301 = gui.fromHandle(_obj_newObject("label"));
    obj.label301:setParent(obj.layout109);
    obj.label301:setVertTextAlign("center");
    obj.label301:setLeft(270);
    obj.label301:setTop(0);
    obj.label301:setWidth(30);
    obj.label301:setHeight(25);
    obj.label301:setField("cd12");
    obj.label301:setName("label301");
    obj.label301:setFontColor("white");
    obj.label301:setTextTrimming("none");
    obj.label301:setWordWrap(false);
    obj.label301:setAutoSize(true);

    obj.dataLink110 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink110:setParent(obj.layout109);
    obj.dataLink110:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink110:setName("dataLink110");

    obj.layout110 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout105);
    obj.layout110:setLeft(0);
    obj.layout110:setTop(145);
    obj.layout110:setWidth(350);
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.label302 = gui.fromHandle(_obj_newObject("label"));
    obj.label302:setParent(obj.layout110);
    obj.label302:setVertTextAlign("center");
    obj.label302:setLeft(10);
    obj.label302:setTop(3);
    obj.label302:setWidth(25);
    obj.label302:setHeight(22);
    obj.label302:setText("13");
    obj.label302:setName("label302");
    obj.label302:setFontColor("white");
    obj.label302:setTextTrimming("none");
    obj.label302:setWordWrap(false);
    obj.label302:setAutoSize(true);

    obj.edit282 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout110);
    obj.edit282:setVertTextAlign("center");
    obj.edit282:setLeft(45);
    obj.edit282:setTop(0);
    obj.edit282:setWidth(30);
    obj.edit282:setHeight(25);
    obj.edit282:setField("total13");
    obj.edit282:setType("number");
    obj.edit282:setName("edit282");

    obj.edit283 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout110);
    obj.edit283:setVertTextAlign("center");
    obj.edit283:setLeft(85);
    obj.edit283:setTop(0);
    obj.edit283:setWidth(30);
    obj.edit283:setHeight(25);
    obj.edit283:setField("base13");
    obj.edit283:setType("number");
    obj.edit283:setName("edit283");

    obj.label303 = gui.fromHandle(_obj_newObject("label"));
    obj.label303:setParent(obj.layout110);
    obj.label303:setVertTextAlign("center");
    obj.label303:setLeft(140);
    obj.label303:setTop(0);
    obj.label303:setWidth(30);
    obj.label303:setHeight(25);
    obj.label303:setField("bonus13");
    obj.label303:setName("label303");
    obj.label303:setFontColor("white");
    obj.label303:setTextTrimming("none");
    obj.label303:setWordWrap(false);
    obj.label303:setAutoSize(true);

    obj.dataLink111 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink111:setParent(obj.layout110);
    obj.dataLink111:setFields({'base13', 'bonus13'});
    obj.dataLink111:setName("dataLink111");

    obj.dataLink112 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink112:setParent(obj.layout110);
    obj.dataLink112:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink112:setName("dataLink112");

    obj.edit284 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout110);
    obj.edit284:setVertTextAlign("center");
    obj.edit284:setLeft(210);
    obj.edit284:setTop(0);
    obj.edit284:setWidth(30);
    obj.edit284:setHeight(25);
    obj.edit284:setField("conhecidas13");
    obj.edit284:setType("number");
    obj.edit284:setName("edit284");

    obj.label304 = gui.fromHandle(_obj_newObject("label"));
    obj.label304:setParent(obj.layout110);
    obj.label304:setVertTextAlign("center");
    obj.label304:setLeft(270);
    obj.label304:setTop(0);
    obj.label304:setWidth(30);
    obj.label304:setHeight(25);
    obj.label304:setField("cd13");
    obj.label304:setName("label304");
    obj.label304:setFontColor("white");
    obj.label304:setTextTrimming("none");
    obj.label304:setWordWrap(false);
    obj.label304:setAutoSize(true);

    obj.dataLink113 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink113:setParent(obj.layout110);
    obj.dataLink113:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink113:setName("dataLink113");

    obj.layout111 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout105);
    obj.layout111:setLeft(0);
    obj.layout111:setTop(175);
    obj.layout111:setWidth(350);
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.label305 = gui.fromHandle(_obj_newObject("label"));
    obj.label305:setParent(obj.layout111);
    obj.label305:setVertTextAlign("center");
    obj.label305:setLeft(10);
    obj.label305:setTop(3);
    obj.label305:setWidth(25);
    obj.label305:setHeight(22);
    obj.label305:setText("14");
    obj.label305:setName("label305");
    obj.label305:setFontColor("white");
    obj.label305:setTextTrimming("none");
    obj.label305:setWordWrap(false);
    obj.label305:setAutoSize(true);

    obj.edit285 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout111);
    obj.edit285:setVertTextAlign("center");
    obj.edit285:setLeft(45);
    obj.edit285:setTop(0);
    obj.edit285:setWidth(30);
    obj.edit285:setHeight(25);
    obj.edit285:setField("total14");
    obj.edit285:setType("number");
    obj.edit285:setName("edit285");

    obj.edit286 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout111);
    obj.edit286:setVertTextAlign("center");
    obj.edit286:setLeft(85);
    obj.edit286:setTop(0);
    obj.edit286:setWidth(30);
    obj.edit286:setHeight(25);
    obj.edit286:setField("base14");
    obj.edit286:setType("number");
    obj.edit286:setName("edit286");

    obj.label306 = gui.fromHandle(_obj_newObject("label"));
    obj.label306:setParent(obj.layout111);
    obj.label306:setVertTextAlign("center");
    obj.label306:setLeft(140);
    obj.label306:setTop(0);
    obj.label306:setWidth(30);
    obj.label306:setHeight(25);
    obj.label306:setField("bonus14");
    obj.label306:setName("label306");
    obj.label306:setFontColor("white");
    obj.label306:setTextTrimming("none");
    obj.label306:setWordWrap(false);
    obj.label306:setAutoSize(true);

    obj.dataLink114 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink114:setParent(obj.layout111);
    obj.dataLink114:setFields({'base14', 'bonus14'});
    obj.dataLink114:setName("dataLink114");

    obj.dataLink115 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink115:setParent(obj.layout111);
    obj.dataLink115:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink115:setName("dataLink115");

    obj.edit287 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout111);
    obj.edit287:setVertTextAlign("center");
    obj.edit287:setLeft(210);
    obj.edit287:setTop(0);
    obj.edit287:setWidth(30);
    obj.edit287:setHeight(25);
    obj.edit287:setField("conhecidas14");
    obj.edit287:setType("number");
    obj.edit287:setName("edit287");

    obj.label307 = gui.fromHandle(_obj_newObject("label"));
    obj.label307:setParent(obj.layout111);
    obj.label307:setVertTextAlign("center");
    obj.label307:setLeft(270);
    obj.label307:setTop(0);
    obj.label307:setWidth(30);
    obj.label307:setHeight(25);
    obj.label307:setField("cd14");
    obj.label307:setName("label307");
    obj.label307:setFontColor("white");
    obj.label307:setTextTrimming("none");
    obj.label307:setWordWrap(false);
    obj.label307:setAutoSize(true);

    obj.dataLink116 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink116:setParent(obj.layout111);
    obj.dataLink116:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink116:setName("dataLink116");

    obj.layout112 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout105);
    obj.layout112:setLeft(0);
    obj.layout112:setTop(205);
    obj.layout112:setWidth(350);
    obj.layout112:setHeight(25);
    obj.layout112:setName("layout112");

    obj.label308 = gui.fromHandle(_obj_newObject("label"));
    obj.label308:setParent(obj.layout112);
    obj.label308:setVertTextAlign("center");
    obj.label308:setLeft(10);
    obj.label308:setTop(3);
    obj.label308:setWidth(25);
    obj.label308:setHeight(22);
    obj.label308:setText("15");
    obj.label308:setName("label308");
    obj.label308:setFontColor("white");
    obj.label308:setTextTrimming("none");
    obj.label308:setWordWrap(false);
    obj.label308:setAutoSize(true);

    obj.edit288 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout112);
    obj.edit288:setVertTextAlign("center");
    obj.edit288:setLeft(45);
    obj.edit288:setTop(0);
    obj.edit288:setWidth(30);
    obj.edit288:setHeight(25);
    obj.edit288:setField("total15");
    obj.edit288:setType("number");
    obj.edit288:setName("edit288");

    obj.edit289 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout112);
    obj.edit289:setVertTextAlign("center");
    obj.edit289:setLeft(85);
    obj.edit289:setTop(0);
    obj.edit289:setWidth(30);
    obj.edit289:setHeight(25);
    obj.edit289:setField("base15");
    obj.edit289:setType("number");
    obj.edit289:setName("edit289");

    obj.label309 = gui.fromHandle(_obj_newObject("label"));
    obj.label309:setParent(obj.layout112);
    obj.label309:setVertTextAlign("center");
    obj.label309:setLeft(140);
    obj.label309:setTop(0);
    obj.label309:setWidth(30);
    obj.label309:setHeight(25);
    obj.label309:setField("bonus15");
    obj.label309:setName("label309");
    obj.label309:setFontColor("white");
    obj.label309:setTextTrimming("none");
    obj.label309:setWordWrap(false);
    obj.label309:setAutoSize(true);

    obj.dataLink117 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink117:setParent(obj.layout112);
    obj.dataLink117:setFields({'base15', 'bonus15'});
    obj.dataLink117:setName("dataLink117");

    obj.dataLink118 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink118:setParent(obj.layout112);
    obj.dataLink118:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink118:setName("dataLink118");

    obj.edit290 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout112);
    obj.edit290:setVertTextAlign("center");
    obj.edit290:setLeft(210);
    obj.edit290:setTop(0);
    obj.edit290:setWidth(30);
    obj.edit290:setHeight(25);
    obj.edit290:setField("conhecidas15");
    obj.edit290:setType("number");
    obj.edit290:setName("edit290");

    obj.label310 = gui.fromHandle(_obj_newObject("label"));
    obj.label310:setParent(obj.layout112);
    obj.label310:setVertTextAlign("center");
    obj.label310:setLeft(270);
    obj.label310:setTop(0);
    obj.label310:setWidth(30);
    obj.label310:setHeight(25);
    obj.label310:setField("cd15");
    obj.label310:setName("label310");
    obj.label310:setFontColor("white");
    obj.label310:setTextTrimming("none");
    obj.label310:setWordWrap(false);
    obj.label310:setAutoSize(true);

    obj.dataLink119 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink119:setParent(obj.layout112);
    obj.dataLink119:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink119:setName("dataLink119");

    obj.layout113 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout105);
    obj.layout113:setLeft(0);
    obj.layout113:setTop(235);
    obj.layout113:setWidth(350);
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.label311 = gui.fromHandle(_obj_newObject("label"));
    obj.label311:setParent(obj.layout113);
    obj.label311:setVertTextAlign("center");
    obj.label311:setLeft(10);
    obj.label311:setTop(3);
    obj.label311:setWidth(25);
    obj.label311:setHeight(22);
    obj.label311:setText("16");
    obj.label311:setName("label311");
    obj.label311:setFontColor("white");
    obj.label311:setTextTrimming("none");
    obj.label311:setWordWrap(false);
    obj.label311:setAutoSize(true);

    obj.edit291 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout113);
    obj.edit291:setVertTextAlign("center");
    obj.edit291:setLeft(45);
    obj.edit291:setTop(0);
    obj.edit291:setWidth(30);
    obj.edit291:setHeight(25);
    obj.edit291:setField("total16");
    obj.edit291:setType("number");
    obj.edit291:setName("edit291");

    obj.edit292 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout113);
    obj.edit292:setVertTextAlign("center");
    obj.edit292:setLeft(85);
    obj.edit292:setTop(0);
    obj.edit292:setWidth(30);
    obj.edit292:setHeight(25);
    obj.edit292:setField("base16");
    obj.edit292:setType("number");
    obj.edit292:setName("edit292");

    obj.label312 = gui.fromHandle(_obj_newObject("label"));
    obj.label312:setParent(obj.layout113);
    obj.label312:setVertTextAlign("center");
    obj.label312:setLeft(140);
    obj.label312:setTop(0);
    obj.label312:setWidth(30);
    obj.label312:setHeight(25);
    obj.label312:setField("bonus16");
    obj.label312:setName("label312");
    obj.label312:setFontColor("white");
    obj.label312:setTextTrimming("none");
    obj.label312:setWordWrap(false);
    obj.label312:setAutoSize(true);

    obj.dataLink120 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink120:setParent(obj.layout113);
    obj.dataLink120:setFields({'base16', 'bonus16'});
    obj.dataLink120:setName("dataLink120");

    obj.dataLink121 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink121:setParent(obj.layout113);
    obj.dataLink121:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink121:setName("dataLink121");

    obj.edit293 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout113);
    obj.edit293:setVertTextAlign("center");
    obj.edit293:setLeft(210);
    obj.edit293:setTop(0);
    obj.edit293:setWidth(30);
    obj.edit293:setHeight(25);
    obj.edit293:setField("conhecidas16");
    obj.edit293:setType("number");
    obj.edit293:setName("edit293");

    obj.label313 = gui.fromHandle(_obj_newObject("label"));
    obj.label313:setParent(obj.layout113);
    obj.label313:setVertTextAlign("center");
    obj.label313:setLeft(270);
    obj.label313:setTop(0);
    obj.label313:setWidth(30);
    obj.label313:setHeight(25);
    obj.label313:setField("cd16");
    obj.label313:setName("label313");
    obj.label313:setFontColor("white");
    obj.label313:setTextTrimming("none");
    obj.label313:setWordWrap(false);
    obj.label313:setAutoSize(true);

    obj.dataLink122 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink122:setParent(obj.layout113);
    obj.dataLink122:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink122:setName("dataLink122");

    obj.layout114 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout105);
    obj.layout114:setLeft(0);
    obj.layout114:setTop(265);
    obj.layout114:setWidth(350);
    obj.layout114:setHeight(25);
    obj.layout114:setName("layout114");

    obj.label314 = gui.fromHandle(_obj_newObject("label"));
    obj.label314:setParent(obj.layout114);
    obj.label314:setVertTextAlign("center");
    obj.label314:setLeft(10);
    obj.label314:setTop(3);
    obj.label314:setWidth(25);
    obj.label314:setHeight(22);
    obj.label314:setText("17");
    obj.label314:setName("label314");
    obj.label314:setFontColor("white");
    obj.label314:setTextTrimming("none");
    obj.label314:setWordWrap(false);
    obj.label314:setAutoSize(true);

    obj.edit294 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout114);
    obj.edit294:setVertTextAlign("center");
    obj.edit294:setLeft(45);
    obj.edit294:setTop(0);
    obj.edit294:setWidth(30);
    obj.edit294:setHeight(25);
    obj.edit294:setField("total17");
    obj.edit294:setType("number");
    obj.edit294:setName("edit294");

    obj.edit295 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout114);
    obj.edit295:setVertTextAlign("center");
    obj.edit295:setLeft(85);
    obj.edit295:setTop(0);
    obj.edit295:setWidth(30);
    obj.edit295:setHeight(25);
    obj.edit295:setField("base17");
    obj.edit295:setType("number");
    obj.edit295:setName("edit295");

    obj.label315 = gui.fromHandle(_obj_newObject("label"));
    obj.label315:setParent(obj.layout114);
    obj.label315:setVertTextAlign("center");
    obj.label315:setLeft(140);
    obj.label315:setTop(0);
    obj.label315:setWidth(30);
    obj.label315:setHeight(25);
    obj.label315:setField("bonus17");
    obj.label315:setName("label315");
    obj.label315:setFontColor("white");
    obj.label315:setTextTrimming("none");
    obj.label315:setWordWrap(false);
    obj.label315:setAutoSize(true);

    obj.dataLink123 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink123:setParent(obj.layout114);
    obj.dataLink123:setFields({'base17', 'bonus17'});
    obj.dataLink123:setName("dataLink123");

    obj.dataLink124 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink124:setParent(obj.layout114);
    obj.dataLink124:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink124:setName("dataLink124");

    obj.edit296 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout114);
    obj.edit296:setVertTextAlign("center");
    obj.edit296:setLeft(210);
    obj.edit296:setTop(0);
    obj.edit296:setWidth(30);
    obj.edit296:setHeight(25);
    obj.edit296:setField("conhecidas17");
    obj.edit296:setType("number");
    obj.edit296:setName("edit296");

    obj.label316 = gui.fromHandle(_obj_newObject("label"));
    obj.label316:setParent(obj.layout114);
    obj.label316:setVertTextAlign("center");
    obj.label316:setLeft(270);
    obj.label316:setTop(0);
    obj.label316:setWidth(30);
    obj.label316:setHeight(25);
    obj.label316:setField("cd17");
    obj.label316:setName("label316");
    obj.label316:setFontColor("white");
    obj.label316:setTextTrimming("none");
    obj.label316:setWordWrap(false);
    obj.label316:setAutoSize(true);

    obj.dataLink125 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink125:setParent(obj.layout114);
    obj.dataLink125:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink125:setName("dataLink125");

    obj.layout115 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout105);
    obj.layout115:setLeft(0);
    obj.layout115:setTop(295);
    obj.layout115:setWidth(350);
    obj.layout115:setHeight(25);
    obj.layout115:setName("layout115");

    obj.label317 = gui.fromHandle(_obj_newObject("label"));
    obj.label317:setParent(obj.layout115);
    obj.label317:setVertTextAlign("center");
    obj.label317:setLeft(10);
    obj.label317:setTop(3);
    obj.label317:setWidth(25);
    obj.label317:setHeight(22);
    obj.label317:setText("18");
    obj.label317:setName("label317");
    obj.label317:setFontColor("white");
    obj.label317:setTextTrimming("none");
    obj.label317:setWordWrap(false);
    obj.label317:setAutoSize(true);

    obj.edit297 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout115);
    obj.edit297:setVertTextAlign("center");
    obj.edit297:setLeft(45);
    obj.edit297:setTop(0);
    obj.edit297:setWidth(30);
    obj.edit297:setHeight(25);
    obj.edit297:setField("total18");
    obj.edit297:setType("number");
    obj.edit297:setName("edit297");

    obj.edit298 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout115);
    obj.edit298:setVertTextAlign("center");
    obj.edit298:setLeft(85);
    obj.edit298:setTop(0);
    obj.edit298:setWidth(30);
    obj.edit298:setHeight(25);
    obj.edit298:setField("base18");
    obj.edit298:setType("number");
    obj.edit298:setName("edit298");

    obj.label318 = gui.fromHandle(_obj_newObject("label"));
    obj.label318:setParent(obj.layout115);
    obj.label318:setVertTextAlign("center");
    obj.label318:setLeft(140);
    obj.label318:setTop(0);
    obj.label318:setWidth(30);
    obj.label318:setHeight(25);
    obj.label318:setField("bonus18");
    obj.label318:setName("label318");
    obj.label318:setFontColor("white");
    obj.label318:setTextTrimming("none");
    obj.label318:setWordWrap(false);
    obj.label318:setAutoSize(true);

    obj.dataLink126 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink126:setParent(obj.layout115);
    obj.dataLink126:setFields({'base18', 'bonus18'});
    obj.dataLink126:setName("dataLink126");

    obj.dataLink127 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink127:setParent(obj.layout115);
    obj.dataLink127:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink127:setName("dataLink127");

    obj.edit299 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout115);
    obj.edit299:setVertTextAlign("center");
    obj.edit299:setLeft(210);
    obj.edit299:setTop(0);
    obj.edit299:setWidth(30);
    obj.edit299:setHeight(25);
    obj.edit299:setField("conhecidas18");
    obj.edit299:setType("number");
    obj.edit299:setName("edit299");

    obj.label319 = gui.fromHandle(_obj_newObject("label"));
    obj.label319:setParent(obj.layout115);
    obj.label319:setVertTextAlign("center");
    obj.label319:setLeft(270);
    obj.label319:setTop(0);
    obj.label319:setWidth(30);
    obj.label319:setHeight(25);
    obj.label319:setField("cd18");
    obj.label319:setName("label319");
    obj.label319:setFontColor("white");
    obj.label319:setTextTrimming("none");
    obj.label319:setWordWrap(false);
    obj.label319:setAutoSize(true);

    obj.dataLink128 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink128:setParent(obj.layout115);
    obj.dataLink128:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink128:setName("dataLink128");

    obj.layout116 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout105);
    obj.layout116:setLeft(0);
    obj.layout116:setTop(325);
    obj.layout116:setWidth(350);
    obj.layout116:setHeight(25);
    obj.layout116:setName("layout116");

    obj.label320 = gui.fromHandle(_obj_newObject("label"));
    obj.label320:setParent(obj.layout116);
    obj.label320:setVertTextAlign("center");
    obj.label320:setLeft(10);
    obj.label320:setTop(3);
    obj.label320:setWidth(25);
    obj.label320:setHeight(22);
    obj.label320:setText("19");
    obj.label320:setName("label320");
    obj.label320:setFontColor("white");
    obj.label320:setTextTrimming("none");
    obj.label320:setWordWrap(false);
    obj.label320:setAutoSize(true);

    obj.edit300 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout116);
    obj.edit300:setVertTextAlign("center");
    obj.edit300:setLeft(45);
    obj.edit300:setTop(0);
    obj.edit300:setWidth(30);
    obj.edit300:setHeight(25);
    obj.edit300:setField("total19");
    obj.edit300:setType("number");
    obj.edit300:setName("edit300");

    obj.edit301 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout116);
    obj.edit301:setVertTextAlign("center");
    obj.edit301:setLeft(85);
    obj.edit301:setTop(0);
    obj.edit301:setWidth(30);
    obj.edit301:setHeight(25);
    obj.edit301:setField("base19");
    obj.edit301:setType("number");
    obj.edit301:setName("edit301");

    obj.label321 = gui.fromHandle(_obj_newObject("label"));
    obj.label321:setParent(obj.layout116);
    obj.label321:setVertTextAlign("center");
    obj.label321:setLeft(140);
    obj.label321:setTop(0);
    obj.label321:setWidth(30);
    obj.label321:setHeight(25);
    obj.label321:setField("bonus19");
    obj.label321:setName("label321");
    obj.label321:setFontColor("white");
    obj.label321:setTextTrimming("none");
    obj.label321:setWordWrap(false);
    obj.label321:setAutoSize(true);

    obj.dataLink129 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink129:setParent(obj.layout116);
    obj.dataLink129:setFields({'base19', 'bonus19'});
    obj.dataLink129:setName("dataLink129");

    obj.dataLink130 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink130:setParent(obj.layout116);
    obj.dataLink130:setFields({'atributoBonus', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink130:setName("dataLink130");

    obj.edit302 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout116);
    obj.edit302:setVertTextAlign("center");
    obj.edit302:setLeft(210);
    obj.edit302:setTop(0);
    obj.edit302:setWidth(30);
    obj.edit302:setHeight(25);
    obj.edit302:setField("conhecidas19");
    obj.edit302:setType("number");
    obj.edit302:setName("edit302");

    obj.label322 = gui.fromHandle(_obj_newObject("label"));
    obj.label322:setParent(obj.layout116);
    obj.label322:setVertTextAlign("center");
    obj.label322:setLeft(270);
    obj.label322:setTop(0);
    obj.label322:setWidth(30);
    obj.label322:setHeight(25);
    obj.label322:setField("cd19");
    obj.label322:setName("label322");
    obj.label322:setFontColor("white");
    obj.label322:setTextTrimming("none");
    obj.label322:setWordWrap(false);
    obj.label322:setAutoSize(true);

    obj.dataLink131 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink131:setParent(obj.layout116);
    obj.dataLink131:setFields({'atributoCD', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink131:setName("dataLink131");

    obj.layout117 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layoutMagiasAprimoradas);
    obj.layout117:setLeft(50);
    obj.layout117:setTop(360);
    obj.layout117:setWidth(280);
    obj.layout117:setHeight(180);
    obj.layout117:setName("layout117");

    obj.label323 = gui.fromHandle(_obj_newObject("label"));
    obj.label323:setParent(obj.layout117);
    obj.label323:setVertTextAlign("center");
    obj.label323:setLeft(0);
    obj.label323:setTop(0);
    obj.label323:setWidth(100);
    obj.label323:setHeight(20);
    obj.label323:setText("Magias Nível 16");
    obj.label323:setName("label323");
    obj.label323:setFontColor("white");
    obj.label323:setTextTrimming("none");
    obj.label323:setWordWrap(false);
    obj.label323:setAutoSize(true);

    obj.textEditor36 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor36:setParent(obj.layout117);
    obj.textEditor36:setTop(20);
    obj.textEditor36:setWidth(280);
    obj.textEditor36:setHeight(160);
    obj.textEditor36:setFontSize(12);
    obj.textEditor36:setField("circulo16");
    obj.textEditor36:setName("textEditor36");

    obj.layout118 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layoutMagiasAprimoradas);
    obj.layout118:setLeft(340);
    obj.layout118:setTop(0);
    obj.layout118:setWidth(280);
    obj.layout118:setHeight(180);
    obj.layout118:setName("layout118");

    obj.label324 = gui.fromHandle(_obj_newObject("label"));
    obj.label324:setParent(obj.layout118);
    obj.label324:setVertTextAlign("center");
    obj.label324:setLeft(0);
    obj.label324:setTop(0);
    obj.label324:setWidth(100);
    obj.label324:setHeight(20);
    obj.label324:setText("Magias Nível 10");
    obj.label324:setName("label324");
    obj.label324:setFontColor("white");
    obj.label324:setTextTrimming("none");
    obj.label324:setWordWrap(false);
    obj.label324:setAutoSize(true);

    obj.textEditor37 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor37:setParent(obj.layout118);
    obj.textEditor37:setTop(20);
    obj.textEditor37:setWidth(280);
    obj.textEditor37:setHeight(160);
    obj.textEditor37:setFontSize(12);
    obj.textEditor37:setField("circulo10");
    obj.textEditor37:setName("textEditor37");

    obj.layout119 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.layoutMagiasAprimoradas);
    obj.layout119:setLeft(340);
    obj.layout119:setTop(180);
    obj.layout119:setWidth(280);
    obj.layout119:setHeight(180);
    obj.layout119:setName("layout119");

    obj.label325 = gui.fromHandle(_obj_newObject("label"));
    obj.label325:setParent(obj.layout119);
    obj.label325:setVertTextAlign("center");
    obj.label325:setLeft(0);
    obj.label325:setTop(0);
    obj.label325:setWidth(100);
    obj.label325:setHeight(20);
    obj.label325:setText("Magias Nível 13");
    obj.label325:setName("label325");
    obj.label325:setFontColor("white");
    obj.label325:setTextTrimming("none");
    obj.label325:setWordWrap(false);
    obj.label325:setAutoSize(true);

    obj.textEditor38 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor38:setParent(obj.layout119);
    obj.textEditor38:setTop(20);
    obj.textEditor38:setWidth(280);
    obj.textEditor38:setHeight(160);
    obj.textEditor38:setFontSize(12);
    obj.textEditor38:setField("circulo13");
    obj.textEditor38:setName("textEditor38");

    obj.layout120 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layoutMagiasAprimoradas);
    obj.layout120:setLeft(340);
    obj.layout120:setTop(360);
    obj.layout120:setWidth(280);
    obj.layout120:setHeight(180);
    obj.layout120:setName("layout120");

    obj.label326 = gui.fromHandle(_obj_newObject("label"));
    obj.label326:setParent(obj.layout120);
    obj.label326:setVertTextAlign("center");
    obj.label326:setLeft(0);
    obj.label326:setTop(0);
    obj.label326:setWidth(100);
    obj.label326:setHeight(20);
    obj.label326:setText("Magias Nível 17");
    obj.label326:setName("label326");
    obj.label326:setFontColor("white");
    obj.label326:setTextTrimming("none");
    obj.label326:setWordWrap(false);
    obj.label326:setAutoSize(true);

    obj.textEditor39 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor39:setParent(obj.layout120);
    obj.textEditor39:setTop(20);
    obj.textEditor39:setWidth(280);
    obj.textEditor39:setHeight(160);
    obj.textEditor39:setFontSize(12);
    obj.textEditor39:setField("circulo17");
    obj.textEditor39:setName("textEditor39");

    obj.layout121 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layoutMagiasAprimoradas);
    obj.layout121:setLeft(630);
    obj.layout121:setTop(0);
    obj.layout121:setWidth(280);
    obj.layout121:setHeight(180);
    obj.layout121:setName("layout121");

    obj.label327 = gui.fromHandle(_obj_newObject("label"));
    obj.label327:setParent(obj.layout121);
    obj.label327:setVertTextAlign("center");
    obj.label327:setLeft(0);
    obj.label327:setTop(0);
    obj.label327:setWidth(100);
    obj.label327:setHeight(20);
    obj.label327:setText("Magias Nível 11");
    obj.label327:setName("label327");
    obj.label327:setFontColor("white");
    obj.label327:setTextTrimming("none");
    obj.label327:setWordWrap(false);
    obj.label327:setAutoSize(true);

    obj.textEditor40 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor40:setParent(obj.layout121);
    obj.textEditor40:setTop(20);
    obj.textEditor40:setWidth(280);
    obj.textEditor40:setHeight(160);
    obj.textEditor40:setFontSize(12);
    obj.textEditor40:setField("circulo11");
    obj.textEditor40:setName("textEditor40");

    obj.layout122 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layoutMagiasAprimoradas);
    obj.layout122:setLeft(630);
    obj.layout122:setTop(180);
    obj.layout122:setWidth(280);
    obj.layout122:setHeight(180);
    obj.layout122:setName("layout122");

    obj.label328 = gui.fromHandle(_obj_newObject("label"));
    obj.label328:setParent(obj.layout122);
    obj.label328:setVertTextAlign("center");
    obj.label328:setLeft(0);
    obj.label328:setTop(0);
    obj.label328:setWidth(100);
    obj.label328:setHeight(20);
    obj.label328:setText("Magias Nível 14");
    obj.label328:setName("label328");
    obj.label328:setFontColor("white");
    obj.label328:setTextTrimming("none");
    obj.label328:setWordWrap(false);
    obj.label328:setAutoSize(true);

    obj.textEditor41 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor41:setParent(obj.layout122);
    obj.textEditor41:setTop(20);
    obj.textEditor41:setWidth(280);
    obj.textEditor41:setHeight(160);
    obj.textEditor41:setFontSize(12);
    obj.textEditor41:setField("circulo14");
    obj.textEditor41:setName("textEditor41");

    obj.layout123 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layoutMagiasAprimoradas);
    obj.layout123:setLeft(630);
    obj.layout123:setTop(360);
    obj.layout123:setWidth(280);
    obj.layout123:setHeight(180);
    obj.layout123:setName("layout123");

    obj.label329 = gui.fromHandle(_obj_newObject("label"));
    obj.label329:setParent(obj.layout123);
    obj.label329:setVertTextAlign("center");
    obj.label329:setLeft(0);
    obj.label329:setTop(0);
    obj.label329:setWidth(100);
    obj.label329:setHeight(20);
    obj.label329:setText("Magias Nível 18");
    obj.label329:setName("label329");
    obj.label329:setFontColor("white");
    obj.label329:setTextTrimming("none");
    obj.label329:setWordWrap(false);
    obj.label329:setAutoSize(true);

    obj.textEditor42 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor42:setParent(obj.layout123);
    obj.textEditor42:setTop(20);
    obj.textEditor42:setWidth(280);
    obj.textEditor42:setHeight(160);
    obj.textEditor42:setFontSize(12);
    obj.textEditor42:setField("circulo18");
    obj.textEditor42:setName("textEditor42");

    obj.layout124 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layoutMagiasAprimoradas);
    obj.layout124:setLeft(920);
    obj.layout124:setTop(0);
    obj.layout124:setWidth(280);
    obj.layout124:setHeight(180);
    obj.layout124:setName("layout124");

    obj.label330 = gui.fromHandle(_obj_newObject("label"));
    obj.label330:setParent(obj.layout124);
    obj.label330:setVertTextAlign("center");
    obj.label330:setLeft(0);
    obj.label330:setTop(0);
    obj.label330:setWidth(100);
    obj.label330:setHeight(20);
    obj.label330:setText("Magias Nível 12");
    obj.label330:setName("label330");
    obj.label330:setFontColor("white");
    obj.label330:setTextTrimming("none");
    obj.label330:setWordWrap(false);
    obj.label330:setAutoSize(true);

    obj.textEditor43 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor43:setParent(obj.layout124);
    obj.textEditor43:setTop(20);
    obj.textEditor43:setWidth(280);
    obj.textEditor43:setHeight(160);
    obj.textEditor43:setFontSize(12);
    obj.textEditor43:setField("circulo12");
    obj.textEditor43:setName("textEditor43");

    obj.layout125 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layoutMagiasAprimoradas);
    obj.layout125:setLeft(920);
    obj.layout125:setTop(180);
    obj.layout125:setWidth(280);
    obj.layout125:setHeight(180);
    obj.layout125:setName("layout125");

    obj.label331 = gui.fromHandle(_obj_newObject("label"));
    obj.label331:setParent(obj.layout125);
    obj.label331:setVertTextAlign("center");
    obj.label331:setLeft(0);
    obj.label331:setTop(0);
    obj.label331:setWidth(100);
    obj.label331:setHeight(20);
    obj.label331:setText("Magias Nível 15");
    obj.label331:setName("label331");
    obj.label331:setFontColor("white");
    obj.label331:setTextTrimming("none");
    obj.label331:setWordWrap(false);
    obj.label331:setAutoSize(true);

    obj.textEditor44 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor44:setParent(obj.layout125);
    obj.textEditor44:setTop(20);
    obj.textEditor44:setWidth(280);
    obj.textEditor44:setHeight(160);
    obj.textEditor44:setFontSize(12);
    obj.textEditor44:setField("circulo15");
    obj.textEditor44:setName("textEditor44");

    obj.layout126 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layoutMagiasAprimoradas);
    obj.layout126:setLeft(920);
    obj.layout126:setTop(360);
    obj.layout126:setWidth(280);
    obj.layout126:setHeight(180);
    obj.layout126:setName("layout126");

    obj.label332 = gui.fromHandle(_obj_newObject("label"));
    obj.label332:setParent(obj.layout126);
    obj.label332:setVertTextAlign("center");
    obj.label332:setLeft(0);
    obj.label332:setTop(0);
    obj.label332:setWidth(100);
    obj.label332:setHeight(20);
    obj.label332:setText("Magias Nível 19");
    obj.label332:setName("label332");
    obj.label332:setFontColor("white");
    obj.label332:setTextTrimming("none");
    obj.label332:setWordWrap(false);
    obj.label332:setAutoSize(true);

    obj.textEditor45 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor45:setParent(obj.layout126);
    obj.textEditor45:setTop(20);
    obj.textEditor45:setWidth(280);
    obj.textEditor45:setHeight(160);
    obj.textEditor45:setFontSize(12);
    obj.textEditor45:setField("circulo19");
    obj.textEditor45:setName("textEditor45");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.boxDetalhesDoItem);
    obj.comboBox9:setLeft(10);
    obj.comboBox9:setTop(50);
    obj.comboBox9:setWidth(110);
    obj.comboBox9:setHeight(25);
    obj.comboBox9:setItems({'Lista Magias', 'Signos', 'Magias (OLD)', 'Magia Epica', 'Magias Aprimoradas'});
    obj.comboBox9:setValues({'3', '2', '1', '7', '8'});
    obj.comboBox9:setValue("3");
    obj.comboBox9:setField("tipoMagia");
    obj.comboBox9:setFontColor("white");
    obj.comboBox9:setName("comboBox9");

    obj.popMagia = gui.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj.boxDetalhesDoItem);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setWidth(250);
    obj.popMagia:setHeight(350);
    obj.popMagia:setBackOpacity(0.4);

    obj.flowLayout18 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.popMagia);
    obj.flowLayout18:setAlign("top");
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setMaxControlsPerLine(2);
    obj.flowLayout18:setMargins({bottom=4});
    obj.flowLayout18:setHorzAlign("center");
    obj.flowLayout18:setName("flowLayout18");

    obj.flowPart229 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart229:setParent(obj.flowLayout18);
    obj.flowPart229:setMinWidth(30);
    obj.flowPart229:setMaxWidth(400);
    obj.flowPart229:setHeight(35);
    obj.flowPart229:setName("flowPart229");

    obj.label333 = gui.fromHandle(_obj_newObject("label"));
    obj.label333:setParent(obj.flowPart229);
    obj.label333:setAlign("top");
    obj.label333:setFontSize(10);
    obj.label333:setText("ESCOLA");
    obj.label333:setHorzTextAlign("center");
    obj.label333:setWordWrap(true);
    obj.label333:setTextTrimming("none");
    obj.label333:setAutoSize(true);
    obj.label333:setName("label333");
    obj.label333:setFontColor("white");

    obj.edit303 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.flowPart229);
    obj.edit303:setAlign("client");
    obj.edit303:setField("escola");
    obj.edit303:setHorzTextAlign("center");
    obj.edit303:setFontSize(12);
    obj.edit303:setName("edit303");

    obj.flowPart230 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart230:setParent(obj.flowLayout18);
    obj.flowPart230:setMinWidth(30);
    obj.flowPart230:setMaxWidth(400);
    obj.flowPart230:setHeight(35);
    obj.flowPart230:setName("flowPart230");

    obj.label334 = gui.fromHandle(_obj_newObject("label"));
    obj.label334:setParent(obj.flowPart230);
    obj.label334:setAlign("top");
    obj.label334:setFontSize(10);
    obj.label334:setText("COMPONENTES");
    obj.label334:setHorzTextAlign("center");
    obj.label334:setWordWrap(true);
    obj.label334:setTextTrimming("none");
    obj.label334:setAutoSize(true);
    obj.label334:setName("label334");
    obj.label334:setFontColor("white");

    obj.edit304 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.flowPart230);
    obj.edit304:setAlign("client");
    obj.edit304:setField("componentes");
    obj.edit304:setHorzTextAlign("center");
    obj.edit304:setFontSize(12);
    obj.edit304:setName("edit304");

    obj.flowPart231 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart231:setParent(obj.flowLayout18);
    obj.flowPart231:setMinWidth(30);
    obj.flowPart231:setMaxWidth(400);
    obj.flowPart231:setHeight(35);
    obj.flowPart231:setName("flowPart231");

    obj.label335 = gui.fromHandle(_obj_newObject("label"));
    obj.label335:setParent(obj.flowPart231);
    obj.label335:setAlign("top");
    obj.label335:setFontSize(10);
    obj.label335:setText("EXECUÇÃO");
    obj.label335:setHorzTextAlign("center");
    obj.label335:setWordWrap(true);
    obj.label335:setTextTrimming("none");
    obj.label335:setAutoSize(true);
    obj.label335:setName("label335");
    obj.label335:setFontColor("white");

    obj.edit305 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.flowPart231);
    obj.edit305:setAlign("client");
    obj.edit305:setField("execucao");
    obj.edit305:setHorzTextAlign("center");
    obj.edit305:setFontSize(12);
    obj.edit305:setName("edit305");

    obj.flowPart232 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart232:setParent(obj.flowLayout18);
    obj.flowPart232:setMinWidth(30);
    obj.flowPart232:setMaxWidth(400);
    obj.flowPart232:setHeight(35);
    obj.flowPart232:setName("flowPart232");

    obj.label336 = gui.fromHandle(_obj_newObject("label"));
    obj.label336:setParent(obj.flowPart232);
    obj.label336:setAlign("top");
    obj.label336:setFontSize(10);
    obj.label336:setText("ALCANCE");
    obj.label336:setHorzTextAlign("center");
    obj.label336:setWordWrap(true);
    obj.label336:setTextTrimming("none");
    obj.label336:setAutoSize(true);
    obj.label336:setName("label336");
    obj.label336:setFontColor("white");

    obj.edit306 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.flowPart232);
    obj.edit306:setAlign("client");
    obj.edit306:setField("alcance");
    obj.edit306:setHorzTextAlign("center");
    obj.edit306:setFontSize(12);
    obj.edit306:setName("edit306");

    obj.flowPart233 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart233:setParent(obj.flowLayout18);
    obj.flowPart233:setMinWidth(30);
    obj.flowPart233:setMaxWidth(400);
    obj.flowPart233:setHeight(35);
    obj.flowPart233:setName("flowPart233");

    obj.label337 = gui.fromHandle(_obj_newObject("label"));
    obj.label337:setParent(obj.flowPart233);
    obj.label337:setAlign("top");
    obj.label337:setFontSize(10);
    obj.label337:setText("ALVO");
    obj.label337:setHorzTextAlign("center");
    obj.label337:setWordWrap(true);
    obj.label337:setTextTrimming("none");
    obj.label337:setAutoSize(true);
    obj.label337:setName("label337");
    obj.label337:setFontColor("white");

    obj.edit307 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.flowPart233);
    obj.edit307:setAlign("client");
    obj.edit307:setField("alvo");
    obj.edit307:setHorzTextAlign("center");
    obj.edit307:setFontSize(12);
    obj.edit307:setName("edit307");

    obj.flowPart234 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart234:setParent(obj.flowLayout18);
    obj.flowPart234:setMinWidth(30);
    obj.flowPart234:setMaxWidth(400);
    obj.flowPart234:setHeight(35);
    obj.flowPart234:setName("flowPart234");

    obj.label338 = gui.fromHandle(_obj_newObject("label"));
    obj.label338:setParent(obj.flowPart234);
    obj.label338:setAlign("top");
    obj.label338:setFontSize(10);
    obj.label338:setText("DURAÇÃO");
    obj.label338:setHorzTextAlign("center");
    obj.label338:setWordWrap(true);
    obj.label338:setTextTrimming("none");
    obj.label338:setAutoSize(true);
    obj.label338:setName("label338");
    obj.label338:setFontColor("white");

    obj.edit308 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.flowPart234);
    obj.edit308:setAlign("client");
    obj.edit308:setField("duracao");
    obj.edit308:setHorzTextAlign("center");
    obj.edit308:setFontSize(12);
    obj.edit308:setName("edit308");

    obj.flowPart235 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart235:setParent(obj.flowLayout18);
    obj.flowPart235:setMinWidth(30);
    obj.flowPart235:setMaxWidth(400);
    obj.flowPart235:setHeight(35);
    obj.flowPart235:setName("flowPart235");

    obj.label339 = gui.fromHandle(_obj_newObject("label"));
    obj.label339:setParent(obj.flowPart235);
    obj.label339:setAlign("top");
    obj.label339:setFontSize(10);
    obj.label339:setText("TR");
    obj.label339:setHorzTextAlign("center");
    obj.label339:setWordWrap(true);
    obj.label339:setTextTrimming("none");
    obj.label339:setAutoSize(true);
    obj.label339:setName("label339");
    obj.label339:setFontColor("white");

    obj.edit309 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.flowPart235);
    obj.edit309:setAlign("client");
    obj.edit309:setField("tr");
    obj.edit309:setHorzTextAlign("center");
    obj.edit309:setFontSize(12);
    obj.edit309:setName("edit309");

    obj.flowPart236 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart236:setParent(obj.flowLayout18);
    obj.flowPart236:setMinWidth(30);
    obj.flowPart236:setMaxWidth(400);
    obj.flowPart236:setHeight(35);
    obj.flowPart236:setName("flowPart236");

    obj.label340 = gui.fromHandle(_obj_newObject("label"));
    obj.label340:setParent(obj.flowPart236);
    obj.label340:setAlign("top");
    obj.label340:setFontSize(10);
    obj.label340:setText("RM");
    obj.label340:setHorzTextAlign("center");
    obj.label340:setWordWrap(true);
    obj.label340:setTextTrimming("none");
    obj.label340:setAutoSize(true);
    obj.label340:setName("label340");
    obj.label340:setFontColor("white");

    obj.edit310 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.flowPart236);
    obj.edit310:setAlign("client");
    obj.edit310:setField("rm");
    obj.edit310:setHorzTextAlign("center");
    obj.edit310:setFontSize(12);
    obj.edit310:setName("edit310");

    obj.flowPart237 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart237:setParent(obj.flowLayout18);
    obj.flowPart237:setMinWidth(30);
    obj.flowPart237:setMaxWidth(400);
    obj.flowPart237:setHeight(35);
    obj.flowPart237:setName("flowPart237");

    obj.label341 = gui.fromHandle(_obj_newObject("label"));
    obj.label341:setParent(obj.flowPart237);
    obj.label341:setAlign("top");
    obj.label341:setFontSize(10);
    obj.label341:setText("LIVRO");
    obj.label341:setHorzTextAlign("center");
    obj.label341:setWordWrap(true);
    obj.label341:setTextTrimming("none");
    obj.label341:setAutoSize(true);
    obj.label341:setName("label341");
    obj.label341:setFontColor("white");

    obj.edit311 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.flowPart237);
    obj.edit311:setAlign("client");
    obj.edit311:setField("livro");
    obj.edit311:setHorzTextAlign("center");
    obj.edit311:setFontSize(12);
    obj.edit311:setName("edit311");

    obj.flowPart238 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart238:setParent(obj.flowLayout18);
    obj.flowPart238:setMinWidth(30);
    obj.flowPart238:setMaxWidth(400);
    obj.flowPart238:setHeight(35);
    obj.flowPart238:setName("flowPart238");

    obj.label342 = gui.fromHandle(_obj_newObject("label"));
    obj.label342:setParent(obj.flowPart238);
    obj.label342:setAlign("top");
    obj.label342:setFontSize(10);
    obj.label342:setText("PÁGINA");
    obj.label342:setHorzTextAlign("center");
    obj.label342:setWordWrap(true);
    obj.label342:setTextTrimming("none");
    obj.label342:setAutoSize(true);
    obj.label342:setName("label342");
    obj.label342:setFontColor("white");

    obj.edit312 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.flowPart238);
    obj.edit312:setAlign("client");
    obj.edit312:setField("pagina");
    obj.edit312:setHorzTextAlign("center");
    obj.edit312:setFontSize(12);
    obj.edit312:setName("edit312");

    obj.textEditor46 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor46:setParent(obj.popMagia);
    obj.textEditor46:setAlign("client");
    obj.textEditor46:setField("descricao");
    obj.textEditor46:setName("textEditor46");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Inventario");
    obj.tab6:setName("tab6");

    obj.frmFichaRPGmeister7_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister7_svg:setParent(obj.tab6);
    obj.frmFichaRPGmeister7_svg:setName("frmFichaRPGmeister7_svg");
    obj.frmFichaRPGmeister7_svg:setAlign("client");
    obj.frmFichaRPGmeister7_svg:setTheme("dark");
    obj.frmFichaRPGmeister7_svg:setMargins({top=1});

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmFichaRPGmeister7_svg);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout127 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.scrollBox6);
    obj.layout127:setLeft(0);
    obj.layout127:setTop(0);
    obj.layout127:setWidth(475);
    obj.layout127:setHeight(330);
    obj.layout127:setName("layout127");

    obj.rectangle91 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout127);
    obj.rectangle91:setAlign("client");
    obj.rectangle91:setColor("black");
    obj.rectangle91:setName("rectangle91");

    obj.button32 = gui.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout127);
    obj.button32:setText("+");
    obj.button32:setLeft(5);
    obj.button32:setTop(5);
    obj.button32:setWidth(20);
    obj.button32:setHeight(20);
    obj.button32:setName("button32");

    obj.label343 = gui.fromHandle(_obj_newObject("label"));
    obj.label343:setParent(obj.layout127);
    obj.label343:setLeft(30);
    obj.label343:setTop(5);
    obj.label343:setWidth(435);
    obj.label343:setHeight(20);
    obj.label343:setText("ARMAS E ESCUDOS                                     Kg         $");
    obj.label343:setName("label343");

    obj.rclListaDasArmas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasArmas:setParent(obj.layout127);
    obj.rclListaDasArmas:setName("rclListaDasArmas");
    obj.rclListaDasArmas:setField("campoDasArmas");
    obj.rclListaDasArmas:setTemplateForm("frmFichaRPGmeister7A_svg");
    obj.rclListaDasArmas:setLeft(5);
    obj.rclListaDasArmas:setTop(25);
    obj.rclListaDasArmas:setWidth(465);
    obj.rclListaDasArmas:setHeight(275);
    obj.rclListaDasArmas:setLayout("vertical");
    obj.rclListaDasArmas:setMinQt(1);

    obj.label344 = gui.fromHandle(_obj_newObject("label"));
    obj.label344:setParent(obj.layout127);
    obj.label344:setLeft(260);
    obj.label344:setTop(305);
    obj.label344:setWidth(50);
    obj.label344:setHeight(20);
    obj.label344:setText("Kg");
    obj.label344:setName("label344");

    obj.rectangle92 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout127);
    obj.rectangle92:setLeft(280);
    obj.rectangle92:setTop(305);
    obj.rectangle92:setWidth(70);
    obj.rectangle92:setHeight(20);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setStrokeColor("white");
    obj.rectangle92:setStrokeSize(1);
    obj.rectangle92:setName("rectangle92");

    obj.label345 = gui.fromHandle(_obj_newObject("label"));
    obj.label345:setParent(obj.layout127);
    obj.label345:setVertTextAlign("center");
    obj.label345:setHorzTextAlign("center");
    obj.label345:setLeft(280);
    obj.label345:setTop(305);
    obj.label345:setWidth(70);
    obj.label345:setHeight(20);
    obj.label345:setField("pesoArmas");
    obj.label345:setName("label345");

    obj.label346 = gui.fromHandle(_obj_newObject("label"));
    obj.label346:setParent(obj.layout127);
    obj.label346:setLeft(360);
    obj.label346:setTop(305);
    obj.label346:setWidth(50);
    obj.label346:setHeight(20);
    obj.label346:setText("$");
    obj.label346:setName("label346");

    obj.rectangle93 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout127);
    obj.rectangle93:setLeft(375);
    obj.rectangle93:setTop(305);
    obj.rectangle93:setWidth(91);
    obj.rectangle93:setHeight(20);
    obj.rectangle93:setColor("black");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setName("rectangle93");

    obj.label347 = gui.fromHandle(_obj_newObject("label"));
    obj.label347:setParent(obj.layout127);
    obj.label347:setVertTextAlign("center");
    obj.label347:setHorzTextAlign("center");
    obj.label347:setLeft(375);
    obj.label347:setTop(305);
    obj.label347:setWidth(91);
    obj.label347:setHeight(20);
    obj.label347:setField("precoArmas");
    obj.label347:setName("label347");

    obj.layout128 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.scrollBox6);
    obj.layout128:setLeft(0);
    obj.layout128:setTop(335);
    obj.layout128:setWidth(475);
    obj.layout128:setHeight(335);
    obj.layout128:setName("layout128");

    obj.rectangle94 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout128);
    obj.rectangle94:setAlign("client");
    obj.rectangle94:setColor("black");
    obj.rectangle94:setName("rectangle94");

    obj.label348 = gui.fromHandle(_obj_newObject("label"));
    obj.label348:setParent(obj.layout128);
    obj.label348:setLeft(5);
    obj.label348:setTop(1);
    obj.label348:setWidth(200);
    obj.label348:setHeight(20);
    obj.label348:setText("MOCHILA");
    obj.label348:setName("label348");

    obj.textEditor47 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor47:setParent(obj.layout128);
    obj.textEditor47:setLeft(5);
    obj.textEditor47:setTop(25);
    obj.textEditor47:setWidth(465);
    obj.textEditor47:setHeight(280);
    obj.textEditor47:setField("mochila");
    obj.textEditor47:setName("textEditor47");

    obj.label349 = gui.fromHandle(_obj_newObject("label"));
    obj.label349:setParent(obj.layout128);
    obj.label349:setLeft(280);
    obj.label349:setTop(310);
    obj.label349:setWidth(50);
    obj.label349:setHeight(20);
    obj.label349:setText("Kg");
    obj.label349:setName("label349");

    obj.edit313 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout128);
    obj.edit313:setVertTextAlign("center");
    obj.edit313:setHorzTextAlign("center");
    obj.edit313:setLeft(300);
    obj.edit313:setTop(310);
    obj.edit313:setWidth(70);
    obj.edit313:setHeight(20);
    obj.edit313:setField("pesoMochila");
    obj.edit313:setName("edit313");

    obj.label350 = gui.fromHandle(_obj_newObject("label"));
    obj.label350:setParent(obj.layout128);
    obj.label350:setLeft(380);
    obj.label350:setTop(310);
    obj.label350:setWidth(50);
    obj.label350:setHeight(20);
    obj.label350:setText("$");
    obj.label350:setName("label350");

    obj.edit314 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout128);
    obj.edit314:setVertTextAlign("center");
    obj.edit314:setHorzTextAlign("center");
    obj.edit314:setLeft(395);
    obj.edit314:setTop(310);
    obj.edit314:setWidth(71);
    obj.edit314:setHeight(20);
    obj.edit314:setField("precoMochila");
    obj.edit314:setName("edit314");

    obj.layout129 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.scrollBox6);
    obj.layout129:setLeft(480);
    obj.layout129:setTop(0);
    obj.layout129:setWidth(200);
    obj.layout129:setHeight(220);
    obj.layout129:setName("layout129");

    obj.rectangle95 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout129);
    obj.rectangle95:setAlign("client");
    obj.rectangle95:setColor("black");
    obj.rectangle95:setName("rectangle95");

    obj.label351 = gui.fromHandle(_obj_newObject("label"));
    obj.label351:setParent(obj.layout129);
    obj.label351:setLeft(5);
    obj.label351:setTop(1);
    obj.label351:setWidth(150);
    obj.label351:setHeight(20);
    obj.label351:setText("PERMANENCIAS");
    obj.label351:setName("label351");

    obj.textEditor48 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor48:setParent(obj.layout129);
    obj.textEditor48:setLeft(5);
    obj.textEditor48:setTop(25);
    obj.textEditor48:setWidth(190);
    obj.textEditor48:setHeight(165);
    obj.textEditor48:setField("permanencias");
    obj.textEditor48:setName("textEditor48");

    obj.label352 = gui.fromHandle(_obj_newObject("label"));
    obj.label352:setParent(obj.layout129);
    obj.label352:setLeft(5);
    obj.label352:setTop(195);
    obj.label352:setWidth(50);
    obj.label352:setHeight(20);
    obj.label352:setText("Kg");
    obj.label352:setName("label352");

    obj.edit315 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout129);
    obj.edit315:setVertTextAlign("center");
    obj.edit315:setHorzTextAlign("center");
    obj.edit315:setLeft(25);
    obj.edit315:setTop(195);
    obj.edit315:setWidth(70);
    obj.edit315:setHeight(20);
    obj.edit315:setField("pesoPermanencias");
    obj.edit315:setName("edit315");

    obj.label353 = gui.fromHandle(_obj_newObject("label"));
    obj.label353:setParent(obj.layout129);
    obj.label353:setLeft(105);
    obj.label353:setTop(195);
    obj.label353:setWidth(50);
    obj.label353:setHeight(20);
    obj.label353:setText("$");
    obj.label353:setName("label353");

    obj.edit316 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout129);
    obj.edit316:setVertTextAlign("center");
    obj.edit316:setHorzTextAlign("center");
    obj.edit316:setLeft(120);
    obj.edit316:setTop(195);
    obj.edit316:setWidth(70);
    obj.edit316:setHeight(20);
    obj.edit316:setField("precoPermanencias");
    obj.edit316:setName("edit316");

    obj.layout130 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.scrollBox6);
    obj.layout130:setLeft(685);
    obj.layout130:setTop(0);
    obj.layout130:setWidth(200);
    obj.layout130:setHeight(220);
    obj.layout130:setName("layout130");

    obj.rectangle96 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout130);
    obj.rectangle96:setAlign("client");
    obj.rectangle96:setColor("black");
    obj.rectangle96:setName("rectangle96");

    obj.label354 = gui.fromHandle(_obj_newObject("label"));
    obj.label354:setParent(obj.layout130);
    obj.label354:setLeft(5);
    obj.label354:setTop(1);
    obj.label354:setWidth(150);
    obj.label354:setHeight(20);
    obj.label354:setText("LIVRES");
    obj.label354:setName("label354");

    obj.textEditor49 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor49:setParent(obj.layout130);
    obj.textEditor49:setLeft(5);
    obj.textEditor49:setTop(25);
    obj.textEditor49:setWidth(190);
    obj.textEditor49:setHeight(165);
    obj.textEditor49:setField("livres");
    obj.textEditor49:setName("textEditor49");

    obj.label355 = gui.fromHandle(_obj_newObject("label"));
    obj.label355:setParent(obj.layout130);
    obj.label355:setLeft(5);
    obj.label355:setTop(195);
    obj.label355:setWidth(50);
    obj.label355:setHeight(20);
    obj.label355:setText("Kg");
    obj.label355:setName("label355");

    obj.edit317 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout130);
    obj.edit317:setVertTextAlign("center");
    obj.edit317:setHorzTextAlign("center");
    obj.edit317:setLeft(25);
    obj.edit317:setTop(195);
    obj.edit317:setWidth(70);
    obj.edit317:setHeight(20);
    obj.edit317:setField("pesoLivres");
    obj.edit317:setName("edit317");

    obj.label356 = gui.fromHandle(_obj_newObject("label"));
    obj.label356:setParent(obj.layout130);
    obj.label356:setLeft(105);
    obj.label356:setTop(195);
    obj.label356:setWidth(50);
    obj.label356:setHeight(20);
    obj.label356:setText("$");
    obj.label356:setName("label356");

    obj.edit318 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout130);
    obj.edit318:setVertTextAlign("center");
    obj.edit318:setHorzTextAlign("center");
    obj.edit318:setLeft(120);
    obj.edit318:setTop(195);
    obj.edit318:setWidth(70);
    obj.edit318:setHeight(20);
    obj.edit318:setField("precoLivres");
    obj.edit318:setName("edit318");

    obj.layout131 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.scrollBox6);
    obj.layout131:setLeft(480);
    obj.layout131:setTop(225);
    obj.layout131:setWidth(200);
    obj.layout131:setHeight(220);
    obj.layout131:setName("layout131");

    obj.rectangle97 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout131);
    obj.rectangle97:setAlign("client");
    obj.rectangle97:setColor("black");
    obj.rectangle97:setName("rectangle97");

    obj.label357 = gui.fromHandle(_obj_newObject("label"));
    obj.label357:setParent(obj.layout131);
    obj.label357:setLeft(5);
    obj.label357:setTop(1);
    obj.label357:setWidth(150);
    obj.label357:setHeight(20);
    obj.label357:setText("OUTROS");
    obj.label357:setName("label357");

    obj.textEditor50 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor50:setParent(obj.layout131);
    obj.textEditor50:setLeft(5);
    obj.textEditor50:setTop(25);
    obj.textEditor50:setWidth(190);
    obj.textEditor50:setHeight(165);
    obj.textEditor50:setField("outros");
    obj.textEditor50:setName("textEditor50");

    obj.label358 = gui.fromHandle(_obj_newObject("label"));
    obj.label358:setParent(obj.layout131);
    obj.label358:setLeft(5);
    obj.label358:setTop(195);
    obj.label358:setWidth(50);
    obj.label358:setHeight(20);
    obj.label358:setText("Kg");
    obj.label358:setName("label358");

    obj.edit319 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout131);
    obj.edit319:setVertTextAlign("center");
    obj.edit319:setHorzTextAlign("center");
    obj.edit319:setLeft(25);
    obj.edit319:setTop(195);
    obj.edit319:setWidth(70);
    obj.edit319:setHeight(20);
    obj.edit319:setField("pesoOutros");
    obj.edit319:setName("edit319");

    obj.label359 = gui.fromHandle(_obj_newObject("label"));
    obj.label359:setParent(obj.layout131);
    obj.label359:setLeft(105);
    obj.label359:setTop(195);
    obj.label359:setWidth(50);
    obj.label359:setHeight(20);
    obj.label359:setText("$");
    obj.label359:setName("label359");

    obj.edit320 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout131);
    obj.edit320:setVertTextAlign("center");
    obj.edit320:setHorzTextAlign("center");
    obj.edit320:setLeft(120);
    obj.edit320:setTop(195);
    obj.edit320:setWidth(70);
    obj.edit320:setHeight(20);
    obj.edit320:setField("precoOutros");
    obj.edit320:setName("edit320");

    obj.layout132 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.scrollBox6);
    obj.layout132:setLeft(685);
    obj.layout132:setTop(225);
    obj.layout132:setWidth(200);
    obj.layout132:setHeight(220);
    obj.layout132:setName("layout132");

    obj.rectangle98 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout132);
    obj.rectangle98:setAlign("client");
    obj.rectangle98:setColor("black");
    obj.rectangle98:setName("rectangle98");

    obj.label360 = gui.fromHandle(_obj_newObject("label"));
    obj.label360:setParent(obj.layout132);
    obj.label360:setLeft(5);
    obj.label360:setTop(1);
    obj.label360:setWidth(150);
    obj.label360:setHeight(20);
    obj.label360:setText("MUNIÇÕES");
    obj.label360:setName("label360");

    obj.textEditor51 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor51:setParent(obj.layout132);
    obj.textEditor51:setLeft(5);
    obj.textEditor51:setTop(25);
    obj.textEditor51:setWidth(190);
    obj.textEditor51:setHeight(165);
    obj.textEditor51:setField("municoes");
    obj.textEditor51:setName("textEditor51");

    obj.label361 = gui.fromHandle(_obj_newObject("label"));
    obj.label361:setParent(obj.layout132);
    obj.label361:setLeft(5);
    obj.label361:setTop(195);
    obj.label361:setWidth(50);
    obj.label361:setHeight(20);
    obj.label361:setText("Kg");
    obj.label361:setName("label361");

    obj.edit321 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout132);
    obj.edit321:setVertTextAlign("center");
    obj.edit321:setHorzTextAlign("center");
    obj.edit321:setLeft(25);
    obj.edit321:setTop(195);
    obj.edit321:setWidth(70);
    obj.edit321:setHeight(20);
    obj.edit321:setField("pesoMunicoes");
    obj.edit321:setName("edit321");

    obj.label362 = gui.fromHandle(_obj_newObject("label"));
    obj.label362:setParent(obj.layout132);
    obj.label362:setLeft(105);
    obj.label362:setTop(195);
    obj.label362:setWidth(50);
    obj.label362:setHeight(20);
    obj.label362:setText("$");
    obj.label362:setName("label362");

    obj.edit322 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout132);
    obj.edit322:setVertTextAlign("center");
    obj.edit322:setHorzTextAlign("center");
    obj.edit322:setLeft(120);
    obj.edit322:setTop(195);
    obj.edit322:setWidth(70);
    obj.edit322:setHeight(20);
    obj.edit322:setField("precoMunicoes");
    obj.edit322:setName("edit322");

    obj.layout133 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.scrollBox6);
    obj.layout133:setLeft(480);
    obj.layout133:setTop(450);
    obj.layout133:setWidth(200);
    obj.layout133:setHeight(221);
    obj.layout133:setName("layout133");

    obj.rectangle99 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout133);
    obj.rectangle99:setAlign("client");
    obj.rectangle99:setColor("black");
    obj.rectangle99:setName("rectangle99");

    obj.label363 = gui.fromHandle(_obj_newObject("label"));
    obj.label363:setParent(obj.layout133);
    obj.label363:setLeft(5);
    obj.label363:setTop(1);
    obj.label363:setWidth(150);
    obj.label363:setHeight(20);
    obj.label363:setText("BOLSOS");
    obj.label363:setName("label363");

    obj.textEditor52 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor52:setParent(obj.layout133);
    obj.textEditor52:setLeft(5);
    obj.textEditor52:setTop(25);
    obj.textEditor52:setWidth(190);
    obj.textEditor52:setHeight(165);
    obj.textEditor52:setField("bolsos");
    obj.textEditor52:setName("textEditor52");

    obj.label364 = gui.fromHandle(_obj_newObject("label"));
    obj.label364:setParent(obj.layout133);
    obj.label364:setLeft(5);
    obj.label364:setTop(195);
    obj.label364:setWidth(50);
    obj.label364:setHeight(20);
    obj.label364:setText("Kg");
    obj.label364:setName("label364");

    obj.edit323 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout133);
    obj.edit323:setVertTextAlign("center");
    obj.edit323:setHorzTextAlign("center");
    obj.edit323:setLeft(25);
    obj.edit323:setTop(195);
    obj.edit323:setWidth(70);
    obj.edit323:setHeight(20);
    obj.edit323:setField("pesoBolsos");
    obj.edit323:setName("edit323");

    obj.label365 = gui.fromHandle(_obj_newObject("label"));
    obj.label365:setParent(obj.layout133);
    obj.label365:setLeft(105);
    obj.label365:setTop(195);
    obj.label365:setWidth(50);
    obj.label365:setHeight(20);
    obj.label365:setText("$");
    obj.label365:setName("label365");

    obj.edit324 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout133);
    obj.edit324:setVertTextAlign("center");
    obj.edit324:setHorzTextAlign("center");
    obj.edit324:setLeft(120);
    obj.edit324:setTop(195);
    obj.edit324:setWidth(70);
    obj.edit324:setHeight(20);
    obj.edit324:setField("precoBolsos");
    obj.edit324:setName("edit324");

    obj.layout134 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.scrollBox6);
    obj.layout134:setLeft(685);
    obj.layout134:setTop(450);
    obj.layout134:setWidth(200);
    obj.layout134:setHeight(221);
    obj.layout134:setName("layout134");

    obj.rectangle100 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout134);
    obj.rectangle100:setAlign("client");
    obj.rectangle100:setColor("black");
    obj.rectangle100:setName("rectangle100");

    obj.label366 = gui.fromHandle(_obj_newObject("label"));
    obj.label366:setParent(obj.layout134);
    obj.label366:setLeft(5);
    obj.label366:setTop(1);
    obj.label366:setWidth(150);
    obj.label366:setHeight(20);
    obj.label366:setText("IMOVEIS");
    obj.label366:setName("label366");

    obj.textEditor53 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor53:setParent(obj.layout134);
    obj.textEditor53:setLeft(5);
    obj.textEditor53:setTop(25);
    obj.textEditor53:setWidth(190);
    obj.textEditor53:setHeight(165);
    obj.textEditor53:setField("moveis");
    obj.textEditor53:setName("textEditor53");

    obj.label367 = gui.fromHandle(_obj_newObject("label"));
    obj.label367:setParent(obj.layout134);
    obj.label367:setLeft(5);
    obj.label367:setTop(195);
    obj.label367:setWidth(50);
    obj.label367:setHeight(20);
    obj.label367:setText("Kg");
    obj.label367:setName("label367");

    obj.edit325 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout134);
    obj.edit325:setVertTextAlign("center");
    obj.edit325:setHorzTextAlign("center");
    obj.edit325:setLeft(25);
    obj.edit325:setTop(195);
    obj.edit325:setWidth(70);
    obj.edit325:setHeight(20);
    obj.edit325:setField("pesoImoveis");
    obj.edit325:setName("edit325");

    obj.label368 = gui.fromHandle(_obj_newObject("label"));
    obj.label368:setParent(obj.layout134);
    obj.label368:setLeft(105);
    obj.label368:setTop(195);
    obj.label368:setWidth(50);
    obj.label368:setHeight(20);
    obj.label368:setText("$");
    obj.label368:setName("label368");

    obj.edit326 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout134);
    obj.edit326:setVertTextAlign("center");
    obj.edit326:setHorzTextAlign("center");
    obj.edit326:setLeft(120);
    obj.edit326:setTop(195);
    obj.edit326:setWidth(70);
    obj.edit326:setHeight(20);
    obj.edit326:setField("precoImoveis");
    obj.edit326:setName("edit326");

    obj.layout135 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.scrollBox6);
    obj.layout135:setLeft(890);
    obj.layout135:setTop(0);
    obj.layout135:setWidth(155);
    obj.layout135:setHeight(185);
    obj.layout135:setName("layout135");

    obj.rectangle101 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout135);
    obj.rectangle101:setAlign("client");
    obj.rectangle101:setColor("black");
    obj.rectangle101:setName("rectangle101");

    obj.label369 = gui.fromHandle(_obj_newObject("label"));
    obj.label369:setParent(obj.layout135);
    obj.label369:setLeft(5);
    obj.label369:setTop(1);
    obj.label369:setWidth(200);
    obj.label369:setHeight(20);
    obj.label369:setText("DINHEIRO");
    obj.label369:setName("label369");

    obj.textEditor54 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor54:setParent(obj.layout135);
    obj.textEditor54:setLeft(5);
    obj.textEditor54:setTop(25);
    obj.textEditor54:setWidth(145);
    obj.textEditor54:setHeight(80);
    obj.textEditor54:setField("dinheiro");
    obj.textEditor54:setName("textEditor54");

    obj.label370 = gui.fromHandle(_obj_newObject("label"));
    obj.label370:setParent(obj.layout135);
    obj.label370:setLeft(10);
    obj.label370:setTop(110);
    obj.label370:setWidth(50);
    obj.label370:setHeight(20);
    obj.label370:setText("TOTAL");
    obj.label370:setName("label370");

    obj.edit327 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout135);
    obj.edit327:setField("dinheiroTotal");
    obj.edit327:setLeft(65);
    obj.edit327:setTop(110);
    obj.edit327:setWidth(85);
    obj.edit327:setHeight(20);
    obj.edit327:setFontSize(11);
    obj.edit327:setName("edit327");

    obj.label371 = gui.fromHandle(_obj_newObject("label"));
    obj.label371:setParent(obj.layout135);
    obj.label371:setLeft(10);
    obj.label371:setTop(135);
    obj.label371:setWidth(50);
    obj.label371:setHeight(20);
    obj.label371:setText("GASTOS");
    obj.label371:setName("label371");

    obj.rectangle102 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout135);
    obj.rectangle102:setLeft(65);
    obj.rectangle102:setTop(135);
    obj.rectangle102:setWidth(85);
    obj.rectangle102:setHeight(20);
    obj.rectangle102:setColor("black");
    obj.rectangle102:setStrokeColor("white");
    obj.rectangle102:setStrokeSize(1);
    obj.rectangle102:setName("rectangle102");

    obj.label372 = gui.fromHandle(_obj_newObject("label"));
    obj.label372:setParent(obj.layout135);
    obj.label372:setField("gastos");
    obj.label372:setText("0");
    obj.label372:setLeft(65);
    obj.label372:setTop(135);
    obj.label372:setWidth(85);
    obj.label372:setHeight(20);
    obj.label372:setHorzTextAlign("center");
    obj.label372:setFontSize(11);
    obj.label372:setName("label372");

    obj.label373 = gui.fromHandle(_obj_newObject("label"));
    obj.label373:setParent(obj.layout135);
    obj.label373:setLeft(10);
    obj.label373:setTop(160);
    obj.label373:setWidth(50);
    obj.label373:setHeight(20);
    obj.label373:setText("RESTANTE");
    obj.label373:setFontSize(10);
    obj.label373:setName("label373");

    obj.rectangle103 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout135);
    obj.rectangle103:setLeft(65);
    obj.rectangle103:setTop(160);
    obj.rectangle103:setWidth(85);
    obj.rectangle103:setHeight(20);
    obj.rectangle103:setColor("black");
    obj.rectangle103:setStrokeColor("white");
    obj.rectangle103:setStrokeSize(1);
    obj.rectangle103:setName("rectangle103");

    obj.label374 = gui.fromHandle(_obj_newObject("label"));
    obj.label374:setParent(obj.layout135);
    obj.label374:setField("dinheiroRestante");
    obj.label374:setText("0");
    obj.label374:setLeft(65);
    obj.label374:setTop(160);
    obj.label374:setWidth(85);
    obj.label374:setHeight(20);
    obj.label374:setHorzTextAlign("center");
    obj.label374:setFontSize(11);
    obj.label374:setName("label374");

    obj.dataLink132 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink132:setParent(obj.scrollBox6);
    obj.dataLink132:setFields({'precoCabeca', 'precoOlhos', 'precoPescoco', 'precoOmbros', 'precoTorso', 'precoCorpo', 'precoPunhos', 'precoCintura', 'precoMaos', 'precoDedosI', 'precoDesdosII', 'precoPes', 'precoArmas', 'precoMochila', 'precoPermanencias', 'precoLivres', 'precoOutros', 'precoMunicoes', 'precoBolsos', 'precoImoveis', 'precoInventorioComp', 'dinheiroTotal'});
    obj.dataLink132:setName("dataLink132");

    obj.layout136 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.scrollBox6);
    obj.layout136:setLeft(890);
    obj.layout136:setTop(190);
    obj.layout136:setWidth(250);
    obj.layout136:setHeight(222);
    obj.layout136:setName("layout136");

    obj.rectangle104 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout136);
    obj.rectangle104:setAlign("client");
    obj.rectangle104:setColor("black");
    obj.rectangle104:setName("rectangle104");

    obj.label375 = gui.fromHandle(_obj_newObject("label"));
    obj.label375:setParent(obj.layout136);
    obj.label375:setLeft(5);
    obj.label375:setTop(1);
    obj.label375:setWidth(200);
    obj.label375:setHeight(20);
    obj.label375:setText("ARMADURA");
    obj.label375:setName("label375");

    obj.edit328 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout136);
    obj.edit328:setVertTextAlign("center");
    obj.edit328:setLeft(5);
    obj.edit328:setTop(20);
    obj.edit328:setWidth(240);
    obj.edit328:setHeight(25);
    obj.edit328:setField("equipamentoCorpo");
    obj.edit328:setName("edit328");

    obj.label376 = gui.fromHandle(_obj_newObject("label"));
    obj.label376:setParent(obj.layout136);
    obj.label376:setLeft(10);
    obj.label376:setTop(50);
    obj.label376:setWidth(50);
    obj.label376:setHeight(20);
    obj.label376:setText("CA");
    obj.label376:setName("label376");

    obj.edit329 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout136);
    obj.edit329:setVertTextAlign("center");
    obj.edit329:setLeft(45);
    obj.edit329:setTop(50);
    obj.edit329:setWidth(40);
    obj.edit329:setHeight(20);
    obj.edit329:setField("equipamentoCorpoCA");
    obj.edit329:setName("edit329");

    obj.label377 = gui.fromHandle(_obj_newObject("label"));
    obj.label377:setParent(obj.layout136);
    obj.label377:setLeft(90);
    obj.label377:setTop(50);
    obj.label377:setWidth(50);
    obj.label377:setHeight(20);
    obj.label377:setText("CAT");
    obj.label377:setName("label377");

    obj.comboBox10 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout136);
    obj.comboBox10:setLeft(120);
    obj.comboBox10:setTop(50);
    obj.comboBox10:setWidth(125);
    obj.comboBox10:setHeight(20);
    obj.comboBox10:setField("equipamentoCorpoCategoria");
    obj.comboBox10:setItems({'Leve', 'Média', 'Pesada', 'Massiva'});
    obj.comboBox10:setFontColor("white");
    obj.comboBox10:setName("comboBox10");

    obj.label378 = gui.fromHandle(_obj_newObject("label"));
    obj.label378:setParent(obj.layout136);
    obj.label378:setLeft(10);
    obj.label378:setTop(75);
    obj.label378:setWidth(50);
    obj.label378:setHeight(20);
    obj.label378:setText("DES");
    obj.label378:setName("label378");

    obj.edit330 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout136);
    obj.edit330:setVertTextAlign("center");
    obj.edit330:setLeft(45);
    obj.edit330:setTop(75);
    obj.edit330:setWidth(40);
    obj.edit330:setHeight(20);
    obj.edit330:setField("equipamentoCorpoDesMax");
    obj.edit330:setName("edit330");

    obj.label379 = gui.fromHandle(_obj_newObject("label"));
    obj.label379:setParent(obj.layout136);
    obj.label379:setLeft(90);
    obj.label379:setTop(75);
    obj.label379:setWidth(50);
    obj.label379:setHeight(20);
    obj.label379:setText("PEN");
    obj.label379:setName("label379");

    obj.edit331 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout136);
    obj.edit331:setVertTextAlign("center");
    obj.edit331:setLeft(125);
    obj.edit331:setTop(75);
    obj.edit331:setWidth(40);
    obj.edit331:setHeight(20);
    obj.edit331:setField("penalidade");
    obj.edit331:setName("edit331");

    obj.label380 = gui.fromHandle(_obj_newObject("label"));
    obj.label380:setParent(obj.layout136);
    obj.label380:setLeft(170);
    obj.label380:setTop(75);
    obj.label380:setWidth(50);
    obj.label380:setHeight(20);
    obj.label380:setText("Falha");
    obj.label380:setFontSize(13);
    obj.label380:setName("label380");

    obj.edit332 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout136);
    obj.edit332:setVertTextAlign("center");
    obj.edit332:setLeft(205);
    obj.edit332:setTop(75);
    obj.edit332:setWidth(40);
    obj.edit332:setHeight(20);
    obj.edit332:setField("equipamentoCorpoFalha");
    obj.edit332:setName("edit332");

    obj.dataLink133 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink133:setParent(obj.layout136);
    obj.dataLink133:setField("penalidade");
    obj.dataLink133:setName("dataLink133");

    obj.label381 = gui.fromHandle(_obj_newObject("label"));
    obj.label381:setParent(obj.layout136);
    obj.label381:setLeft(10);
    obj.label381:setTop(100);
    obj.label381:setWidth(50);
    obj.label381:setHeight(20);
    obj.label381:setText("Desl");
    obj.label381:setName("label381");

    obj.edit333 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout136);
    obj.edit333:setVertTextAlign("center");
    obj.edit333:setLeft(45);
    obj.edit333:setTop(100);
    obj.edit333:setWidth(40);
    obj.edit333:setHeight(20);
    obj.edit333:setField("equipamentoCorpoDesl");
    obj.edit333:setName("edit333");

    obj.label382 = gui.fromHandle(_obj_newObject("label"));
    obj.label382:setParent(obj.layout136);
    obj.label382:setLeft(170);
    obj.label382:setTop(100);
    obj.label382:setWidth(50);
    obj.label382:setHeight(20);
    obj.label382:setText("Correr");
    obj.label382:setFontSize(12);
    obj.label382:setName("label382");

    obj.edit334 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout136);
    obj.edit334:setVertTextAlign("center");
    obj.edit334:setLeft(205);
    obj.edit334:setTop(100);
    obj.edit334:setWidth(40);
    obj.edit334:setHeight(20);
    obj.edit334:setField("equipamentoCorpoCorrer");
    obj.edit334:setName("edit334");

    obj.textEditor55 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor55:setParent(obj.layout136);
    obj.textEditor55:setLeft(5);
    obj.textEditor55:setTop(122);
    obj.textEditor55:setWidth(240);
    obj.textEditor55:setHeight(65);
    obj.textEditor55:setField("descricaoCorpo");
    obj.textEditor55:setName("textEditor55");

    obj.label383 = gui.fromHandle(_obj_newObject("label"));
    obj.label383:setParent(obj.layout136);
    obj.label383:setLeft(70);
    obj.label383:setTop(193);
    obj.label383:setWidth(50);
    obj.label383:setHeight(20);
    obj.label383:setText("Kg");
    obj.label383:setName("label383");

    obj.edit335 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout136);
    obj.edit335:setHorzTextAlign("center");
    obj.edit335:setVertTextAlign("center");
    obj.edit335:setLeft(90);
    obj.edit335:setTop(190);
    obj.edit335:setWidth(50);
    obj.edit335:setHeight(25);
    obj.edit335:setField("pesoCorpo");
    obj.edit335:setName("edit335");

    obj.label384 = gui.fromHandle(_obj_newObject("label"));
    obj.label384:setParent(obj.layout136);
    obj.label384:setLeft(147);
    obj.label384:setTop(193);
    obj.label384:setWidth(50);
    obj.label384:setHeight(20);
    obj.label384:setText("$");
    obj.label384:setName("label384");

    obj.edit336 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout136);
    obj.edit336:setHorzTextAlign("center");
    obj.edit336:setVertTextAlign("center");
    obj.edit336:setLeft(160);
    obj.edit336:setTop(190);
    obj.edit336:setWidth(84);
    obj.edit336:setHeight(25);
    obj.edit336:setField("precoCorpo");
    obj.edit336:setName("edit336");

    obj.layout137 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.scrollBox6);
    obj.layout137:setLeft(1050);
    obj.layout137:setTop(0);
    obj.layout137:setWidth(155);
    obj.layout137:setHeight(185);
    obj.layout137:setName("layout137");

    obj.rectangle105 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout137);
    obj.rectangle105:setAlign("client");
    obj.rectangle105:setColor("black");
    obj.rectangle105:setName("rectangle105");

    obj.label385 = gui.fromHandle(_obj_newObject("label"));
    obj.label385:setParent(obj.layout137);
    obj.label385:setLeft(5);
    obj.label385:setTop(1);
    obj.label385:setWidth(150);
    obj.label385:setHeight(20);
    obj.label385:setText("CARGA");
    obj.label385:setName("label385");

    obj.label386 = gui.fromHandle(_obj_newObject("label"));
    obj.label386:setParent(obj.layout137);
    obj.label386:setLeft(20);
    obj.label386:setTop(25);
    obj.label386:setWidth(50);
    obj.label386:setHeight(20);
    obj.label386:setText("LEVE");
    obj.label386:setName("label386");

    obj.rectangle106 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout137);
    obj.rectangle106:setLeft(80);
    obj.rectangle106:setTop(25);
    obj.rectangle106:setWidth(70);
    obj.rectangle106:setHeight(20);
    obj.rectangle106:setColor("black");
    obj.rectangle106:setStrokeColor("white");
    obj.rectangle106:setStrokeSize(1);
    obj.rectangle106:setName("rectangle106");

    obj.label387 = gui.fromHandle(_obj_newObject("label"));
    obj.label387:setParent(obj.layout137);
    obj.label387:setLeft(80);
    obj.label387:setTop(25);
    obj.label387:setWidth(70);
    obj.label387:setHeight(20);
    obj.label387:setField("cargaLeve");
    obj.label387:setHorzTextAlign("center");
    obj.label387:setName("label387");

    obj.label388 = gui.fromHandle(_obj_newObject("label"));
    obj.label388:setParent(obj.layout137);
    obj.label388:setLeft(20);
    obj.label388:setTop(47);
    obj.label388:setWidth(50);
    obj.label388:setHeight(20);
    obj.label388:setText("MÉDIA");
    obj.label388:setName("label388");

    obj.rectangle107 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout137);
    obj.rectangle107:setLeft(80);
    obj.rectangle107:setTop(47);
    obj.rectangle107:setWidth(70);
    obj.rectangle107:setHeight(20);
    obj.rectangle107:setColor("black");
    obj.rectangle107:setStrokeColor("white");
    obj.rectangle107:setStrokeSize(1);
    obj.rectangle107:setName("rectangle107");

    obj.label389 = gui.fromHandle(_obj_newObject("label"));
    obj.label389:setParent(obj.layout137);
    obj.label389:setLeft(80);
    obj.label389:setTop(47);
    obj.label389:setWidth(70);
    obj.label389:setHeight(20);
    obj.label389:setField("cargaMedia");
    obj.label389:setHorzTextAlign("center");
    obj.label389:setName("label389");

    obj.label390 = gui.fromHandle(_obj_newObject("label"));
    obj.label390:setParent(obj.layout137);
    obj.label390:setLeft(20);
    obj.label390:setTop(69);
    obj.label390:setWidth(50);
    obj.label390:setHeight(20);
    obj.label390:setText("PESADA");
    obj.label390:setName("label390");

    obj.rectangle108 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.layout137);
    obj.rectangle108:setLeft(80);
    obj.rectangle108:setTop(69);
    obj.rectangle108:setWidth(70);
    obj.rectangle108:setHeight(20);
    obj.rectangle108:setColor("black");
    obj.rectangle108:setStrokeColor("white");
    obj.rectangle108:setStrokeSize(1);
    obj.rectangle108:setName("rectangle108");

    obj.label391 = gui.fromHandle(_obj_newObject("label"));
    obj.label391:setParent(obj.layout137);
    obj.label391:setLeft(80);
    obj.label391:setTop(69);
    obj.label391:setWidth(70);
    obj.label391:setHeight(20);
    obj.label391:setField("cargaPesada");
    obj.label391:setHorzTextAlign("center");
    obj.label391:setName("label391");

    obj.rectangle109 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.layout137);
    obj.rectangle109:setWidth(70);
    obj.rectangle109:setHeight(20);
    obj.rectangle109:setLeft(80);
    obj.rectangle109:setTop(91);
    obj.rectangle109:setColor("black");
    obj.rectangle109:setStrokeColor("white");
    obj.rectangle109:setStrokeSize(1);
    obj.rectangle109:setName("rectangle109");

    obj.label392 = gui.fromHandle(_obj_newObject("label"));
    obj.label392:setParent(obj.layout137);
    obj.label392:setLeft(20);
    obj.label392:setTop(91);
    obj.label392:setWidth(50);
    obj.label392:setHeight(20);
    obj.label392:setText("ERGUER");
    obj.label392:setName("label392");

    obj.label393 = gui.fromHandle(_obj_newObject("label"));
    obj.label393:setParent(obj.layout137);
    obj.label393:setField("cargaErguer");
    obj.label393:setText("valor");
    obj.label393:setWidth(70);
    obj.label393:setHeight(20);
    obj.label393:setLeft(80);
    obj.label393:setTop(91);
    obj.label393:setHorzTextAlign("center");
    obj.label393:setName("label393");

    obj.rectangle110 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.layout137);
    obj.rectangle110:setWidth(70);
    obj.rectangle110:setHeight(20);
    obj.rectangle110:setLeft(80);
    obj.rectangle110:setTop(113);
    obj.rectangle110:setColor("black");
    obj.rectangle110:setStrokeColor("white");
    obj.rectangle110:setStrokeSize(1);
    obj.rectangle110:setName("rectangle110");

    obj.label394 = gui.fromHandle(_obj_newObject("label"));
    obj.label394:setParent(obj.layout137);
    obj.label394:setLeft(10);
    obj.label394:setTop(113);
    obj.label394:setWidth(70);
    obj.label394:setHeight(20);
    obj.label394:setText("EMPURRAR");
    obj.label394:setName("label394");

    obj.label395 = gui.fromHandle(_obj_newObject("label"));
    obj.label395:setParent(obj.layout137);
    obj.label395:setField("cargaLevantar");
    obj.label395:setText("valor");
    obj.label395:setWidth(70);
    obj.label395:setHeight(20);
    obj.label395:setLeft(80);
    obj.label395:setTop(113);
    obj.label395:setHorzTextAlign("center");
    obj.label395:setName("label395");

    obj.rectangle111 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout137);
    obj.rectangle111:setWidth(70);
    obj.rectangle111:setHeight(20);
    obj.rectangle111:setLeft(80);
    obj.rectangle111:setTop(135);
    obj.rectangle111:setColor("black");
    obj.rectangle111:setStrokeColor("white");
    obj.rectangle111:setStrokeSize(1);
    obj.rectangle111:setName("rectangle111");

    obj.label396 = gui.fromHandle(_obj_newObject("label"));
    obj.label396:setParent(obj.layout137);
    obj.label396:setLeft(10);
    obj.label396:setTop(135);
    obj.label396:setWidth(65);
    obj.label396:setHeight(20);
    obj.label396:setText("LEVANTAR");
    obj.label396:setName("label396");

    obj.label397 = gui.fromHandle(_obj_newObject("label"));
    obj.label397:setParent(obj.layout137);
    obj.label397:setField("cargaEmpurrar");
    obj.label397:setText("valor");
    obj.label397:setWidth(70);
    obj.label397:setHeight(20);
    obj.label397:setLeft(80);
    obj.label397:setTop(135);
    obj.label397:setHorzTextAlign("center");
    obj.label397:setName("label397");

    obj.rectangle112 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout137);
    obj.rectangle112:setWidth(70);
    obj.rectangle112:setHeight(20);
    obj.rectangle112:setLeft(80);
    obj.rectangle112:setTop(160);
    obj.rectangle112:setColor("#404040");
    obj.rectangle112:setName("rectangle112");

    obj.label398 = gui.fromHandle(_obj_newObject("label"));
    obj.label398:setParent(obj.layout137);
    obj.label398:setLeft(20);
    obj.label398:setTop(160);
    obj.label398:setWidth(65);
    obj.label398:setHeight(20);
    obj.label398:setText("ATUAL");
    obj.label398:setName("label398");

    obj.label399 = gui.fromHandle(_obj_newObject("label"));
    obj.label399:setParent(obj.layout137);
    obj.label399:setField("cargaAtual");
    obj.label399:setWidth(70);
    obj.label399:setHeight(20);
    obj.label399:setLeft(80);
    obj.label399:setTop(160);
    obj.label399:setHorzTextAlign("center");
    obj.label399:setFontColor("white");
    obj.label399:setName("label399");

    obj.dataLink134 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink134:setParent(obj.scrollBox6);
    obj.dataLink134:setField("cargaPesada");
    obj.dataLink134:setName("dataLink134");

    obj.dataLink135 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink135:setParent(obj.scrollBox6);
    obj.dataLink135:setFields({'pesoCabeca', 'pesoOlhos', 'pesoPescoco', 'pesoOmbros', 'pesoTorso', 'pesoCorpo', 'pesoPunhos', 'pesoCintura', 'pesoMaos', 'pesoDedosI', 'pesoDesdosII', 'pesoPes', 'pesoArmas', 'pesoMochila', 'pesoPermanencias', 'pesoLivres', 'pesoOutros', 'pesoMunicoes', 'pesoBolsos', 'pesoImoveis', 'pesoInventorioComp'});
    obj.dataLink135:setName("dataLink135");

    obj.popArma = gui.fromHandle(_obj_newObject("popup"));
    obj.popArma:setParent(obj.scrollBox6);
    obj.popArma:setName("popArma");
    obj.popArma:setWidth(300);
    obj.popArma:setHeight(400);
    obj.popArma:setBackOpacity(0.4);

    obj.flowLayout19 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.popArma);
    obj.flowLayout19:setAlign("top");
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setMaxControlsPerLine(3);
    obj.flowLayout19:setMargins({bottom=4});
    obj.flowLayout19:setHorzAlign("center");
    obj.flowLayout19:setName("flowLayout19");

    obj.flowPart239 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart239:setParent(obj.flowLayout19);
    obj.flowPart239:setMinWidth(90);
    obj.flowPart239:setMaxWidth(100);
    obj.flowPart239:setHeight(35);
    obj.flowPart239:setName("flowPart239");

    obj.label400 = gui.fromHandle(_obj_newObject("label"));
    obj.label400:setParent(obj.flowPart239);
    obj.label400:setAlign("top");
    obj.label400:setFontSize(10);
    obj.label400:setText("NOME");
    obj.label400:setHorzTextAlign("center");
    obj.label400:setWordWrap(true);
    obj.label400:setTextTrimming("none");
    obj.label400:setAutoSize(true);
    obj.label400:setHint("Se a arma possui um nome de batismo ponha ele aqui.");
    obj.label400:setHitTest(true);
    obj.label400:setName("label400");

    obj.edit337 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.flowPart239);
    obj.edit337:setAlign("client");
    obj.edit337:setField("batismo");
    obj.edit337:setFontSize(12);
    obj.edit337:setName("edit337");

    obj.flowPart240 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart240:setParent(obj.flowLayout19);
    obj.flowPart240:setMinWidth(90);
    obj.flowPart240:setMaxWidth(100);
    obj.flowPart240:setHeight(35);
    obj.flowPart240:setName("flowPart240");

    obj.label401 = gui.fromHandle(_obj_newObject("label"));
    obj.label401:setParent(obj.flowPart240);
    obj.label401:setAlign("top");
    obj.label401:setFontSize(10);
    obj.label401:setText("ARMA");
    obj.label401:setHorzTextAlign("center");
    obj.label401:setWordWrap(true);
    obj.label401:setTextTrimming("none");
    obj.label401:setAutoSize(true);
    obj.label401:setHint("Qual a arma? Espada Longa? Machado de Batalha? Arco Longo?");
    obj.label401:setHitTest(true);
    obj.label401:setName("label401");

    obj.edit338 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.flowPart240);
    obj.edit338:setAlign("client");
    obj.edit338:setField("arma");
    obj.edit338:setFontSize(12);
    obj.edit338:setName("edit338");

    obj.flowPart241 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart241:setParent(obj.flowLayout19);
    obj.flowPart241:setMinWidth(90);
    obj.flowPart241:setMaxWidth(100);
    obj.flowPart241:setHeight(35);
    obj.flowPart241:setName("flowPart241");

    obj.label402 = gui.fromHandle(_obj_newObject("label"));
    obj.label402:setParent(obj.flowPart241);
    obj.label402:setAlign("top");
    obj.label402:setFontSize(10);
    obj.label402:setText("TAMANHO");
    obj.label402:setHorzTextAlign("center");
    obj.label402:setWordWrap(true);
    obj.label402:setTextTrimming("none");
    obj.label402:setAutoSize(true);
    obj.label402:setHint("Essa arma foi feita para um personagem de que tamanho? Médio? Pequeno? Grande?");
    obj.label402:setHitTest(true);
    obj.label402:setName("label402");

    obj.edit339 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.flowPart241);
    obj.edit339:setAlign("client");
    obj.edit339:setField("tamanho");
    obj.edit339:setFontSize(12);
    obj.edit339:setName("edit339");

    obj.flowPart242 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart242:setParent(obj.flowLayout19);
    obj.flowPart242:setMinWidth(90);
    obj.flowPart242:setMaxWidth(100);
    obj.flowPart242:setHeight(35);
    obj.flowPart242:setName("flowPart242");

    obj.label403 = gui.fromHandle(_obj_newObject("label"));
    obj.label403:setParent(obj.flowPart242);
    obj.label403:setAlign("top");
    obj.label403:setFontSize(10);
    obj.label403:setText("MATERIAL");
    obj.label403:setHorzTextAlign("center");
    obj.label403:setWordWrap(true);
    obj.label403:setTextTrimming("none");
    obj.label403:setAutoSize(true);
    obj.label403:setHint("Essa arma foi feita de um material especial? Adamante? Prata?");
    obj.label403:setHitTest(true);
    obj.label403:setName("label403");

    obj.edit340 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.flowPart242);
    obj.edit340:setAlign("client");
    obj.edit340:setField("material");
    obj.edit340:setFontSize(12);
    obj.edit340:setName("edit340");

    obj.flowPart243 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart243:setParent(obj.flowLayout19);
    obj.flowPart243:setMinWidth(90);
    obj.flowPart243:setMaxWidth(100);
    obj.flowPart243:setHeight(35);
    obj.flowPart243:setName("flowPart243");

    obj.label404 = gui.fromHandle(_obj_newObject("label"));
    obj.label404:setParent(obj.flowPart243);
    obj.label404:setAlign("top");
    obj.label404:setFontSize(10);
    obj.label404:setText("QUALIDADE");
    obj.label404:setHorzTextAlign("center");
    obj.label404:setWordWrap(true);
    obj.label404:setTextTrimming("none");
    obj.label404:setAutoSize(true);
    obj.label404:setHint("Essa arma é Obra-Prima? +1? +2?");
    obj.label404:setHitTest(true);
    obj.label404:setName("label404");

    obj.edit341 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.flowPart243);
    obj.edit341:setAlign("client");
    obj.edit341:setField("qualidade");
    obj.edit341:setHorzTextAlign("center");
    obj.edit341:setFontSize(12);
    obj.edit341:setName("edit341");

    obj.flowPart244 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart244:setParent(obj.flowLayout19);
    obj.flowPart244:setMinWidth(90);
    obj.flowPart244:setMaxWidth(100);
    obj.flowPart244:setHeight(35);
    obj.flowPart244:setName("flowPart244");

    obj.label405 = gui.fromHandle(_obj_newObject("label"));
    obj.label405:setParent(obj.flowPart244);
    obj.label405:setAlign("top");
    obj.label405:setFontSize(10);
    obj.label405:setText("CATEGORIA");
    obj.label405:setHorzTextAlign("center");
    obj.label405:setWordWrap(true);
    obj.label405:setTextTrimming("none");
    obj.label405:setAutoSize(true);
    obj.label405:setHint("Essa arma é Simples? Comum? Exotica?");
    obj.label405:setHitTest(true);
    obj.label405:setName("label405");

    obj.edit342 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.flowPart244);
    obj.edit342:setAlign("client");
    obj.edit342:setField("categoria");
    obj.edit342:setFontSize(12);
    obj.edit342:setName("edit342");

    obj.flowPart245 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart245:setParent(obj.flowLayout19);
    obj.flowPart245:setMinWidth(90);
    obj.flowPart245:setMaxWidth(100);
    obj.flowPart245:setHeight(35);
    obj.flowPart245:setName("flowPart245");

    obj.label406 = gui.fromHandle(_obj_newObject("label"));
    obj.label406:setParent(obj.flowPart245);
    obj.label406:setAlign("top");
    obj.label406:setFontSize(10);
    obj.label406:setText("DANO");
    obj.label406:setHorzTextAlign("center");
    obj.label406:setWordWrap(true);
    obj.label406:setTextTrimming("none");
    obj.label406:setAutoSize(true);
    obj.label406:setHint("Qual o dado de dano dessa arma?");
    obj.label406:setHitTest(true);
    obj.label406:setName("label406");

    obj.edit343 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.flowPart245);
    obj.edit343:setAlign("client");
    obj.edit343:setField("dano");
    obj.edit343:setHorzTextAlign("center");
    obj.edit343:setFontSize(12);
    obj.edit343:setName("edit343");

    obj.flowPart246 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart246:setParent(obj.flowLayout19);
    obj.flowPart246:setMinWidth(90);
    obj.flowPart246:setMaxWidth(100);
    obj.flowPart246:setHeight(35);
    obj.flowPart246:setName("flowPart246");

    obj.label407 = gui.fromHandle(_obj_newObject("label"));
    obj.label407:setParent(obj.flowPart246);
    obj.label407:setAlign("top");
    obj.label407:setFontSize(10);
    obj.label407:setText("DECISIVO");
    obj.label407:setHorzTextAlign("center");
    obj.label407:setWordWrap(true);
    obj.label407:setTextTrimming("none");
    obj.label407:setAutoSize(true);
    obj.label407:setHint("Quando a margem de ameaça dessa arma?20? 19-20?");
    obj.label407:setHitTest(true);
    obj.label407:setName("label407");

    obj.edit344 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.flowPart246);
    obj.edit344:setAlign("client");
    obj.edit344:setField("decisivo");
    obj.edit344:setHorzTextAlign("center");
    obj.edit344:setFontSize(12);
    obj.edit344:setName("edit344");

    obj.flowPart247 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart247:setParent(obj.flowLayout19);
    obj.flowPart247:setMinWidth(90);
    obj.flowPart247:setMaxWidth(100);
    obj.flowPart247:setHeight(35);
    obj.flowPart247:setName("flowPart247");

    obj.label408 = gui.fromHandle(_obj_newObject("label"));
    obj.label408:setParent(obj.flowPart247);
    obj.label408:setAlign("top");
    obj.label408:setFontSize(10);
    obj.label408:setText("MULTIPLICADOR");
    obj.label408:setHorzTextAlign("center");
    obj.label408:setWordWrap(true);
    obj.label408:setTextTrimming("none");
    obj.label408:setAutoSize(true);
    obj.label408:setHint("Em um decisivo por quanto é multiplicado o dano dessa arma?");
    obj.label408:setHitTest(true);
    obj.label408:setName("label408");

    obj.edit345 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.flowPart247);
    obj.edit345:setAlign("client");
    obj.edit345:setField("multiplicador");
    obj.edit345:setHorzTextAlign("center");
    obj.edit345:setFontSize(12);
    obj.edit345:setName("edit345");

    obj.flowPart248 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart248:setParent(obj.flowLayout19);
    obj.flowPart248:setMinWidth(90);
    obj.flowPart248:setMaxWidth(100);
    obj.flowPart248:setHeight(35);
    obj.flowPart248:setName("flowPart248");

    obj.label409 = gui.fromHandle(_obj_newObject("label"));
    obj.label409:setParent(obj.flowPart248);
    obj.label409:setAlign("top");
    obj.label409:setFontSize(10);
    obj.label409:setText("ALCANCE");
    obj.label409:setHorzTextAlign("center");
    obj.label409:setWordWrap(true);
    obj.label409:setTextTrimming("none");
    obj.label409:setAutoSize(true);
    obj.label409:setHint("Qual o alcance em metros da arma? Normalmente usado apenas em armas de ataque a distancia. ");
    obj.label409:setHitTest(true);
    obj.label409:setName("label409");

    obj.edit346 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.flowPart248);
    obj.edit346:setAlign("client");
    obj.edit346:setField("alcance");
    obj.edit346:setFontSize(12);
    obj.edit346:setName("edit346");

    obj.flowPart249 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart249:setParent(obj.flowLayout19);
    obj.flowPart249:setMinWidth(90);
    obj.flowPart249:setMaxWidth(100);
    obj.flowPart249:setHeight(35);
    obj.flowPart249:setName("flowPart249");

    obj.label410 = gui.fromHandle(_obj_newObject("label"));
    obj.label410:setParent(obj.flowPart249);
    obj.label410:setAlign("top");
    obj.label410:setFontSize(10);
    obj.label410:setText("ESPECIAL");
    obj.label410:setHorzTextAlign("center");
    obj.label410:setWordWrap(true);
    obj.label410:setTextTrimming("none");
    obj.label410:setAutoSize(true);
    obj.label410:setHint("Essa arma tem efeitos especiais? Pode ser usada em derrubar? desarmar? Pode ser preparada contra investida?");
    obj.label410:setHitTest(true);
    obj.label410:setName("label410");

    obj.edit347 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.flowPart249);
    obj.edit347:setAlign("client");
    obj.edit347:setField("especial");
    obj.edit347:setFontSize(12);
    obj.edit347:setName("edit347");

    obj.flowPart250 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart250:setParent(obj.flowLayout19);
    obj.flowPart250:setMinWidth(90);
    obj.flowPart250:setMaxWidth(100);
    obj.flowPart250:setHeight(35);
    obj.flowPart250:setName("flowPart250");

    obj.label411 = gui.fromHandle(_obj_newObject("label"));
    obj.label411:setParent(obj.flowPart250);
    obj.label411:setAlign("top");
    obj.label411:setFontSize(10);
    obj.label411:setText("TIPO");
    obj.label411:setHorzTextAlign("center");
    obj.label411:setWordWrap(true);
    obj.label411:setTextTrimming("none");
    obj.label411:setAutoSize(true);
    obj.label411:setHint("Qual o tipo de dano que essa arma causa? Concusivo? Cortante?");
    obj.label411:setHitTest(true);
    obj.label411:setName("label411");

    obj.edit348 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.flowPart250);
    obj.edit348:setAlign("client");
    obj.edit348:setField("tipo");
    obj.edit348:setFontSize(12);
    obj.edit348:setName("edit348");

    obj.flowPart251 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart251:setParent(obj.flowLayout19);
    obj.flowPart251:setMinWidth(290);
    obj.flowPart251:setMaxWidth(300);
    obj.flowPart251:setHeight(35);
    obj.flowPart251:setName("flowPart251");

    obj.label412 = gui.fromHandle(_obj_newObject("label"));
    obj.label412:setParent(obj.flowPart251);
    obj.label412:setAlign("top");
    obj.label412:setFontSize(10);
    obj.label412:setText("EFEITOS");
    obj.label412:setHorzTextAlign("center");
    obj.label412:setWordWrap(true);
    obj.label412:setTextTrimming("none");
    obj.label412:setAutoSize(true);
    obj.label412:setHint("Essa arma tem efeitos mágicos? Flamejante? Vorpal?");
    obj.label412:setHitTest(true);
    obj.label412:setName("label412");

    obj.edit349 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.flowPart251);
    obj.edit349:setAlign("client");
    obj.edit349:setField("efeitos");
    obj.edit349:setFontSize(12);
    obj.edit349:setName("edit349");

    obj.flowPart252 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart252:setParent(obj.flowLayout19);
    obj.flowPart252:setMinWidth(90);
    obj.flowPart252:setMaxWidth(100);
    obj.flowPart252:setHeight(35);
    obj.flowPart252:setName("flowPart252");

    obj.label413 = gui.fromHandle(_obj_newObject("label"));
    obj.label413:setParent(obj.flowPart252);
    obj.label413:setAlign("top");
    obj.label413:setFontSize(10);
    obj.label413:setText("CA");
    obj.label413:setHorzTextAlign("center");
    obj.label413:setWordWrap(true);
    obj.label413:setTextTrimming("none");
    obj.label413:setAutoSize(true);
    obj.label413:setHint("Para escudos: qual o bonus que ele fornece na CA?");
    obj.label413:setHitTest(true);
    obj.label413:setName("label413");

    obj.edit350 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.flowPart252);
    obj.edit350:setAlign("client");
    obj.edit350:setField("ca");
    obj.edit350:setHorzTextAlign("center");
    obj.edit350:setFontSize(12);
    obj.edit350:setName("edit350");

    obj.flowPart253 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart253:setParent(obj.flowLayout19);
    obj.flowPart253:setMinWidth(90);
    obj.flowPart253:setMaxWidth(100);
    obj.flowPart253:setHeight(35);
    obj.flowPart253:setName("flowPart253");

    obj.label414 = gui.fromHandle(_obj_newObject("label"));
    obj.label414:setParent(obj.flowPart253);
    obj.label414:setAlign("top");
    obj.label414:setFontSize(10);
    obj.label414:setText("PEN");
    obj.label414:setHorzTextAlign("center");
    obj.label414:setWordWrap(true);
    obj.label414:setTextTrimming("none");
    obj.label414:setAutoSize(true);
    obj.label414:setHint("Para escudos: qual a penalidade do escudo?");
    obj.label414:setHitTest(true);
    obj.label414:setName("label414");

    obj.edit351 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.flowPart253);
    obj.edit351:setAlign("client");
    obj.edit351:setField("penalidade");
    obj.edit351:setHorzTextAlign("center");
    obj.edit351:setFontSize(12);
    obj.edit351:setName("edit351");

    obj.flowPart254 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart254:setParent(obj.flowLayout19);
    obj.flowPart254:setMinWidth(90);
    obj.flowPart254:setMaxWidth(100);
    obj.flowPart254:setHeight(35);
    obj.flowPart254:setName("flowPart254");

    obj.label415 = gui.fromHandle(_obj_newObject("label"));
    obj.label415:setParent(obj.flowPart254);
    obj.label415:setAlign("top");
    obj.label415:setFontSize(10);
    obj.label415:setText("FALHA");
    obj.label415:setHorzTextAlign("center");
    obj.label415:setWordWrap(true);
    obj.label415:setTextTrimming("none");
    obj.label415:setAutoSize(true);
    obj.label415:setHint("Para escudos: qual a falha arcana?");
    obj.label415:setHitTest(true);
    obj.label415:setName("label415");

    obj.edit352 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.flowPart254);
    obj.edit352:setAlign("client");
    obj.edit352:setField("falha");
    obj.edit352:setHorzTextAlign("center");
    obj.edit352:setFontSize(12);
    obj.edit352:setName("edit352");

    obj.textEditor56 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor56:setParent(obj.popArma);
    obj.textEditor56:setAlign("client");
    obj.textEditor56:setField("descricao");
    obj.textEditor56:setName("textEditor56");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Companheiro");
    obj.tab7:setName("tab7");

    obj.frmFichaRPGmeister8_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister8_svg:setParent(obj.tab7);
    obj.frmFichaRPGmeister8_svg:setName("frmFichaRPGmeister8_svg");
    obj.frmFichaRPGmeister8_svg:setAlign("client");
    obj.frmFichaRPGmeister8_svg:setTheme("dark");
    obj.frmFichaRPGmeister8_svg:setMargins({top=1});

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmFichaRPGmeister8_svg);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.boxDetalhesDoCompanheiro = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoCompanheiro:setParent(obj.scrollBox7);
    obj.boxDetalhesDoCompanheiro:setName("boxDetalhesDoCompanheiro");
    obj.boxDetalhesDoCompanheiro:setVisible(false);
    obj.boxDetalhesDoCompanheiro:setLeft(0);
    obj.boxDetalhesDoCompanheiro:setTop(0);
    obj.boxDetalhesDoCompanheiro:setWidth(1335);
    obj.boxDetalhesDoCompanheiro:setHeight(620);

    obj.rectangle113 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle113:setLeft(0);
    obj.rectangle113:setTop(0);
    obj.rectangle113:setWidth(200);
    obj.rectangle113:setHeight(135);
    obj.rectangle113:setColor("black");
    obj.rectangle113:setName("rectangle113");

    obj.label416 = gui.fromHandle(_obj_newObject("label"));
    obj.label416:setParent(obj.rectangle113);
    obj.label416:setLeft(5);
    obj.label416:setTop(10);
    obj.label416:setWidth(70);
    obj.label416:setHeight(20);
    obj.label416:setText("Nome");
    obj.label416:setName("label416");

    obj.edit353 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.rectangle113);
    obj.edit353:setLeft(70);
    obj.edit353:setTop(5);
    obj.edit353:setWidth(125);
    obj.edit353:setHeight(25);
    obj.edit353:setField("nomeComp");
    obj.edit353:setName("edit353");

    obj.label417 = gui.fromHandle(_obj_newObject("label"));
    obj.label417:setParent(obj.rectangle113);
    obj.label417:setLeft(5);
    obj.label417:setTop(35);
    obj.label417:setWidth(70);
    obj.label417:setHeight(20);
    obj.label417:setText("Raça");
    obj.label417:setName("label417");

    obj.edit354 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.rectangle113);
    obj.edit354:setLeft(70);
    obj.edit354:setTop(30);
    obj.edit354:setWidth(125);
    obj.edit354:setHeight(25);
    obj.edit354:setField("racaComp");
    obj.edit354:setName("edit354");

    obj.label418 = gui.fromHandle(_obj_newObject("label"));
    obj.label418:setParent(obj.rectangle113);
    obj.label418:setLeft(5);
    obj.label418:setTop(60);
    obj.label418:setWidth(70);
    obj.label418:setHeight(20);
    obj.label418:setText("Tipo");
    obj.label418:setName("label418");

    obj.edit355 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.rectangle113);
    obj.edit355:setLeft(70);
    obj.edit355:setTop(55);
    obj.edit355:setWidth(125);
    obj.edit355:setHeight(25);
    obj.edit355:setField("tipoComp");
    obj.edit355:setName("edit355");

    obj.label419 = gui.fromHandle(_obj_newObject("label"));
    obj.label419:setParent(obj.rectangle113);
    obj.label419:setLeft(5);
    obj.label419:setTop(85);
    obj.label419:setWidth(70);
    obj.label419:setHeight(20);
    obj.label419:setText("Subtipos");
    obj.label419:setName("label419");

    obj.edit356 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.rectangle113);
    obj.edit356:setLeft(70);
    obj.edit356:setTop(80);
    obj.edit356:setWidth(125);
    obj.edit356:setHeight(25);
    obj.edit356:setField("subtiposComp");
    obj.edit356:setName("edit356");

    obj.label420 = gui.fromHandle(_obj_newObject("label"));
    obj.label420:setParent(obj.rectangle113);
    obj.label420:setLeft(5);
    obj.label420:setTop(110);
    obj.label420:setWidth(70);
    obj.label420:setHeight(20);
    obj.label420:setText("Tamanho");
    obj.label420:setName("label420");

    obj.edit357 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.rectangle113);
    obj.edit357:setLeft(70);
    obj.edit357:setTop(105);
    obj.edit357:setWidth(125);
    obj.edit357:setHeight(25);
    obj.edit357:setField("tamanhoComp");
    obj.edit357:setName("edit357");

    obj.rectangle114 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle114:setLeft(0);
    obj.rectangle114:setTop(138);
    obj.rectangle114:setWidth(200);
    obj.rectangle114:setHeight(110);
    obj.rectangle114:setColor("black");
    obj.rectangle114:setName("rectangle114");

    obj.label421 = gui.fromHandle(_obj_newObject("label"));
    obj.label421:setParent(obj.rectangle114);
    obj.label421:setLeft(5);
    obj.label421:setTop(10);
    obj.label421:setWidth(40);
    obj.label421:setHeight(20);
    obj.label421:setText("DVs");
    obj.label421:setName("label421");

    obj.edit358 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.rectangle114);
    obj.edit358:setLeft(35);
    obj.edit358:setTop(5);
    obj.edit358:setWidth(70);
    obj.edit358:setHeight(25);
    obj.edit358:setField("dvsComp");
    obj.edit358:setName("edit358");

    obj.label422 = gui.fromHandle(_obj_newObject("label"));
    obj.label422:setParent(obj.rectangle114);
    obj.label422:setLeft(110);
    obj.label422:setTop(8);
    obj.label422:setWidth(40);
    obj.label422:setHeight(20);
    obj.label422:setText("PVs");
    obj.label422:setName("label422");

    obj.edit359 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.rectangle114);
    obj.edit359:setLeft(140);
    obj.edit359:setTop(5);
    obj.edit359:setWidth(55);
    obj.edit359:setHeight(25);
    obj.edit359:setField("pvsComp");
    obj.edit359:setName("edit359");

    obj.label423 = gui.fromHandle(_obj_newObject("label"));
    obj.label423:setParent(obj.rectangle114);
    obj.label423:setLeft(5);
    obj.label423:setTop(35);
    obj.label423:setWidth(60);
    obj.label423:setHeight(20);
    obj.label423:setText("CA");
    obj.label423:setName("label423");

    obj.edit360 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.rectangle114);
    obj.edit360:setLeft(70);
    obj.edit360:setTop(30);
    obj.edit360:setWidth(35);
    obj.edit360:setHeight(25);
    obj.edit360:setField("caComp");
    obj.edit360:setName("edit360");

    obj.label424 = gui.fromHandle(_obj_newObject("label"));
    obj.label424:setParent(obj.rectangle114);
    obj.label424:setLeft(5);
    obj.label424:setTop(60);
    obj.label424:setWidth(60);
    obj.label424:setHeight(20);
    obj.label424:setText("Toque");
    obj.label424:setName("label424");

    obj.edit361 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.rectangle114);
    obj.edit361:setLeft(70);
    obj.edit361:setTop(55);
    obj.edit361:setWidth(35);
    obj.edit361:setHeight(25);
    obj.edit361:setField("toqueComp");
    obj.edit361:setName("edit361");

    obj.label425 = gui.fromHandle(_obj_newObject("label"));
    obj.label425:setParent(obj.rectangle114);
    obj.label425:setLeft(5);
    obj.label425:setTop(85);
    obj.label425:setWidth(60);
    obj.label425:setHeight(20);
    obj.label425:setText("Surpresa");
    obj.label425:setName("label425");

    obj.edit362 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.rectangle114);
    obj.edit362:setLeft(70);
    obj.edit362:setTop(80);
    obj.edit362:setWidth(35);
    obj.edit362:setHeight(25);
    obj.edit362:setField("surpresaComp");
    obj.edit362:setName("edit362");

    obj.textEditor57 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor57:setParent(obj.rectangle114);
    obj.textEditor57:setLeft(105);
    obj.textEditor57:setTop(30);
    obj.textEditor57:setWidth(90);
    obj.textEditor57:setHeight(75);
    obj.textEditor57:setField("caCompDesc");
    obj.textEditor57:setName("textEditor57");

    obj.rectangle115 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle115:setLeft(0);
    obj.rectangle115:setTop(251);
    obj.rectangle115:setWidth(200);
    obj.rectangle115:setHeight(110);
    obj.rectangle115:setColor("black");
    obj.rectangle115:setName("rectangle115");

    obj.button33 = gui.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.rectangle115);
    obj.button33:setLeft(5);
    obj.button33:setTop(8);
    obj.button33:setWidth(70);
    obj.button33:setHeight(20);
    obj.button33:setText("Iniciativa");
    obj.button33:setName("button33");

    obj.edit363 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.rectangle115);
    obj.edit363:setLeft(80);
    obj.edit363:setTop(5);
    obj.edit363:setWidth(30);
    obj.edit363:setHeight(25);
    obj.edit363:setField("iniciativaComp");
    obj.edit363:setName("edit363");

    obj.edit364 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.rectangle115);
    obj.edit364:setLeft(110);
    obj.edit364:setTop(5);
    obj.edit364:setWidth(85);
    obj.edit364:setHeight(25);
    obj.edit364:setField("iniciativaCompDesc");
    obj.edit364:setName("edit364");

    obj.label426 = gui.fromHandle(_obj_newObject("label"));
    obj.label426:setParent(obj.rectangle115);
    obj.label426:setLeft(2);
    obj.label426:setTop(35);
    obj.label426:setWidth(85);
    obj.label426:setHeight(20);
    obj.label426:setText("Deslocamento");
    obj.label426:setFontSize(12);
    obj.label426:setName("label426");

    obj.edit365 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.rectangle115);
    obj.edit365:setLeft(80);
    obj.edit365:setTop(30);
    obj.edit365:setWidth(115);
    obj.edit365:setHeight(25);
    obj.edit365:setField("deslocamentoComp");
    obj.edit365:setName("edit365");

    obj.label427 = gui.fromHandle(_obj_newObject("label"));
    obj.label427:setParent(obj.rectangle115);
    obj.label427:setLeft(5);
    obj.label427:setTop(60);
    obj.label427:setWidth(40);
    obj.label427:setHeight(20);
    obj.label427:setText("BBA");
    obj.label427:setName("label427");

    obj.edit366 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.rectangle115);
    obj.edit366:setLeft(35);
    obj.edit366:setTop(55);
    obj.edit366:setWidth(55);
    obj.edit366:setHeight(25);
    obj.edit366:setField("bbaComp");
    obj.edit366:setName("edit366");

    obj.button34 = gui.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.rectangle115);
    obj.button34:setLeft(90);
    obj.button34:setTop(58);
    obj.button34:setWidth(60);
    obj.button34:setHeight(20);
    obj.button34:setText("Agarrar");
    obj.button34:setName("button34");

    obj.edit367 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.rectangle115);
    obj.edit367:setLeft(150);
    obj.edit367:setTop(55);
    obj.edit367:setWidth(45);
    obj.edit367:setHeight(25);
    obj.edit367:setField("agarrarComp");
    obj.edit367:setName("edit367");

    obj.label428 = gui.fromHandle(_obj_newObject("label"));
    obj.label428:setParent(obj.rectangle115);
    obj.label428:setLeft(5);
    obj.label428:setTop(85);
    obj.label428:setWidth(40);
    obj.label428:setHeight(20);
    obj.label428:setText("Esp.");
    obj.label428:setName("label428");

    obj.edit368 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.rectangle115);
    obj.edit368:setLeft(35);
    obj.edit368:setTop(80);
    obj.edit368:setWidth(35);
    obj.edit368:setHeight(25);
    obj.edit368:setField("esp1Comp");
    obj.edit368:setName("edit368");

    obj.edit369 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.rectangle115);
    obj.edit369:setLeft(70);
    obj.edit369:setTop(80);
    obj.edit369:setWidth(35);
    obj.edit369:setHeight(25);
    obj.edit369:setField("esp2Comp");
    obj.edit369:setName("edit369");

    obj.label429 = gui.fromHandle(_obj_newObject("label"));
    obj.label429:setParent(obj.rectangle115);
    obj.label429:setLeft(110);
    obj.label429:setTop(85);
    obj.label429:setWidth(40);
    obj.label429:setHeight(20);
    obj.label429:setText("Alc.");
    obj.label429:setName("label429");

    obj.edit370 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.rectangle115);
    obj.edit370:setLeft(140);
    obj.edit370:setTop(80);
    obj.edit370:setWidth(55);
    obj.edit370:setHeight(25);
    obj.edit370:setField("alcanceComp");
    obj.edit370:setName("edit370");

    obj.rectangle116 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle116:setLeft(0);
    obj.rectangle116:setTop(364);
    obj.rectangle116:setWidth(200);
    obj.rectangle116:setHeight(160);
    obj.rectangle116:setColor("black");
    obj.rectangle116:setName("rectangle116");

    obj.layout138 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.rectangle116);
    obj.layout138:setLeft(5);
    obj.layout138:setTop(5);
    obj.layout138:setWidth(195);
    obj.layout138:setHeight(25);
    obj.layout138:setName("layout138");

    obj.button35 = gui.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout138);
    obj.button35:setLeft(0);
    obj.button35:setTop(3);
    obj.button35:setWidth(42);
    obj.button35:setHeight(20);
    obj.button35:setText("FOR");
    obj.button35:setName("button35");

    obj.edit371 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout138);
    obj.edit371:setLeft(45);
    obj.edit371:setTop(0);
    obj.edit371:setWidth(30);
    obj.edit371:setHeight(25);
    obj.edit371:setField("forComp");
    obj.edit371:setName("edit371");

    obj.rectangle117 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout138);
    obj.rectangle117:setLeft(80);
    obj.rectangle117:setTop(0);
    obj.rectangle117:setWidth(30);
    obj.rectangle117:setHeight(25);
    obj.rectangle117:setColor("black");
    obj.rectangle117:setStrokeColor("white");
    obj.rectangle117:setStrokeSize(1);
    obj.rectangle117:setName("rectangle117");

    obj.label430 = gui.fromHandle(_obj_newObject("label"));
    obj.label430:setParent(obj.layout138);
    obj.label430:setLeft(80);
    obj.label430:setTop(0);
    obj.label430:setWidth(30);
    obj.label430:setHeight(25);
    obj.label430:setField("forModComp");
    obj.label430:setHorzTextAlign("center");
    obj.label430:setName("label430");

    obj.edit372 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout138);
    obj.edit372:setLeft(115);
    obj.edit372:setTop(0);
    obj.edit372:setWidth(75);
    obj.edit372:setHeight(25);
    obj.edit372:setField("forCompDesc");
    obj.edit372:setName("edit372");

    obj.layout139 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.rectangle116);
    obj.layout139:setLeft(5);
    obj.layout139:setTop(30);
    obj.layout139:setWidth(195);
    obj.layout139:setHeight(25);
    obj.layout139:setName("layout139");

    obj.button36 = gui.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout139);
    obj.button36:setLeft(0);
    obj.button36:setTop(3);
    obj.button36:setWidth(42);
    obj.button36:setHeight(20);
    obj.button36:setText("DES");
    obj.button36:setName("button36");

    obj.edit373 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout139);
    obj.edit373:setLeft(45);
    obj.edit373:setTop(0);
    obj.edit373:setWidth(30);
    obj.edit373:setHeight(25);
    obj.edit373:setField("desComp");
    obj.edit373:setName("edit373");

    obj.rectangle118 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.layout139);
    obj.rectangle118:setLeft(80);
    obj.rectangle118:setTop(0);
    obj.rectangle118:setWidth(30);
    obj.rectangle118:setHeight(25);
    obj.rectangle118:setColor("black");
    obj.rectangle118:setStrokeColor("white");
    obj.rectangle118:setStrokeSize(1);
    obj.rectangle118:setName("rectangle118");

    obj.label431 = gui.fromHandle(_obj_newObject("label"));
    obj.label431:setParent(obj.layout139);
    obj.label431:setLeft(80);
    obj.label431:setTop(0);
    obj.label431:setWidth(30);
    obj.label431:setHeight(25);
    obj.label431:setField("desModComp");
    obj.label431:setHorzTextAlign("center");
    obj.label431:setName("label431");

    obj.edit374 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout139);
    obj.edit374:setLeft(115);
    obj.edit374:setTop(0);
    obj.edit374:setWidth(75);
    obj.edit374:setHeight(25);
    obj.edit374:setField("desCompDesc");
    obj.edit374:setName("edit374");

    obj.layout140 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle116);
    obj.layout140:setLeft(5);
    obj.layout140:setTop(55);
    obj.layout140:setWidth(195);
    obj.layout140:setHeight(25);
    obj.layout140:setName("layout140");

    obj.button37 = gui.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout140);
    obj.button37:setLeft(0);
    obj.button37:setTop(3);
    obj.button37:setWidth(42);
    obj.button37:setHeight(20);
    obj.button37:setText("CON");
    obj.button37:setName("button37");

    obj.edit375 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout140);
    obj.edit375:setLeft(45);
    obj.edit375:setTop(0);
    obj.edit375:setWidth(30);
    obj.edit375:setHeight(25);
    obj.edit375:setField("conComp");
    obj.edit375:setName("edit375");

    obj.rectangle119 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout140);
    obj.rectangle119:setLeft(80);
    obj.rectangle119:setTop(0);
    obj.rectangle119:setWidth(30);
    obj.rectangle119:setHeight(25);
    obj.rectangle119:setColor("black");
    obj.rectangle119:setStrokeColor("white");
    obj.rectangle119:setStrokeSize(1);
    obj.rectangle119:setName("rectangle119");

    obj.label432 = gui.fromHandle(_obj_newObject("label"));
    obj.label432:setParent(obj.layout140);
    obj.label432:setLeft(80);
    obj.label432:setTop(0);
    obj.label432:setWidth(30);
    obj.label432:setHeight(25);
    obj.label432:setField("conModComp");
    obj.label432:setHorzTextAlign("center");
    obj.label432:setName("label432");

    obj.edit376 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout140);
    obj.edit376:setLeft(115);
    obj.edit376:setTop(0);
    obj.edit376:setWidth(75);
    obj.edit376:setHeight(25);
    obj.edit376:setField("conCompDesc");
    obj.edit376:setName("edit376");

    obj.layout141 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle116);
    obj.layout141:setLeft(5);
    obj.layout141:setTop(80);
    obj.layout141:setWidth(195);
    obj.layout141:setHeight(25);
    obj.layout141:setName("layout141");

    obj.button38 = gui.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout141);
    obj.button38:setLeft(0);
    obj.button38:setTop(3);
    obj.button38:setWidth(42);
    obj.button38:setHeight(20);
    obj.button38:setText("INT");
    obj.button38:setName("button38");

    obj.edit377 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout141);
    obj.edit377:setLeft(45);
    obj.edit377:setTop(0);
    obj.edit377:setWidth(30);
    obj.edit377:setHeight(25);
    obj.edit377:setField("intComp");
    obj.edit377:setName("edit377");

    obj.rectangle120 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout141);
    obj.rectangle120:setLeft(80);
    obj.rectangle120:setTop(0);
    obj.rectangle120:setWidth(30);
    obj.rectangle120:setHeight(25);
    obj.rectangle120:setColor("black");
    obj.rectangle120:setStrokeColor("white");
    obj.rectangle120:setStrokeSize(1);
    obj.rectangle120:setName("rectangle120");

    obj.label433 = gui.fromHandle(_obj_newObject("label"));
    obj.label433:setParent(obj.layout141);
    obj.label433:setLeft(80);
    obj.label433:setTop(0);
    obj.label433:setWidth(30);
    obj.label433:setHeight(25);
    obj.label433:setField("intModComp");
    obj.label433:setHorzTextAlign("center");
    obj.label433:setName("label433");

    obj.edit378 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout141);
    obj.edit378:setLeft(115);
    obj.edit378:setTop(0);
    obj.edit378:setWidth(75);
    obj.edit378:setHeight(25);
    obj.edit378:setField("intCompDesc");
    obj.edit378:setName("edit378");

    obj.layout142 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.rectangle116);
    obj.layout142:setLeft(5);
    obj.layout142:setTop(105);
    obj.layout142:setWidth(195);
    obj.layout142:setHeight(25);
    obj.layout142:setName("layout142");

    obj.button39 = gui.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout142);
    obj.button39:setLeft(0);
    obj.button39:setTop(3);
    obj.button39:setWidth(42);
    obj.button39:setHeight(20);
    obj.button39:setText("SAB");
    obj.button39:setName("button39");

    obj.edit379 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout142);
    obj.edit379:setLeft(45);
    obj.edit379:setTop(0);
    obj.edit379:setWidth(30);
    obj.edit379:setHeight(25);
    obj.edit379:setField("sabComp");
    obj.edit379:setName("edit379");

    obj.rectangle121 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout142);
    obj.rectangle121:setLeft(80);
    obj.rectangle121:setTop(0);
    obj.rectangle121:setWidth(30);
    obj.rectangle121:setHeight(25);
    obj.rectangle121:setColor("black");
    obj.rectangle121:setStrokeColor("white");
    obj.rectangle121:setStrokeSize(1);
    obj.rectangle121:setName("rectangle121");

    obj.label434 = gui.fromHandle(_obj_newObject("label"));
    obj.label434:setParent(obj.layout142);
    obj.label434:setLeft(80);
    obj.label434:setTop(0);
    obj.label434:setWidth(30);
    obj.label434:setHeight(25);
    obj.label434:setField("sabModComp");
    obj.label434:setHorzTextAlign("center");
    obj.label434:setName("label434");

    obj.edit380 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout142);
    obj.edit380:setLeft(115);
    obj.edit380:setTop(0);
    obj.edit380:setWidth(75);
    obj.edit380:setHeight(25);
    obj.edit380:setField("sabCompDesc");
    obj.edit380:setName("edit380");

    obj.layout143 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.rectangle116);
    obj.layout143:setLeft(5);
    obj.layout143:setTop(130);
    obj.layout143:setWidth(195);
    obj.layout143:setHeight(25);
    obj.layout143:setName("layout143");

    obj.button40 = gui.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout143);
    obj.button40:setLeft(0);
    obj.button40:setTop(3);
    obj.button40:setWidth(42);
    obj.button40:setHeight(20);
    obj.button40:setText("CAR");
    obj.button40:setName("button40");

    obj.edit381 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit381:setParent(obj.layout143);
    obj.edit381:setLeft(45);
    obj.edit381:setTop(0);
    obj.edit381:setWidth(30);
    obj.edit381:setHeight(25);
    obj.edit381:setField("carComp");
    obj.edit381:setName("edit381");

    obj.rectangle122 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout143);
    obj.rectangle122:setLeft(80);
    obj.rectangle122:setTop(0);
    obj.rectangle122:setWidth(30);
    obj.rectangle122:setHeight(25);
    obj.rectangle122:setColor("black");
    obj.rectangle122:setStrokeColor("white");
    obj.rectangle122:setStrokeSize(1);
    obj.rectangle122:setName("rectangle122");

    obj.label435 = gui.fromHandle(_obj_newObject("label"));
    obj.label435:setParent(obj.layout143);
    obj.label435:setLeft(80);
    obj.label435:setTop(0);
    obj.label435:setWidth(30);
    obj.label435:setHeight(25);
    obj.label435:setField("carModComp");
    obj.label435:setHorzTextAlign("center");
    obj.label435:setName("label435");

    obj.edit382 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit382:setParent(obj.layout143);
    obj.edit382:setLeft(115);
    obj.edit382:setTop(0);
    obj.edit382:setWidth(75);
    obj.edit382:setHeight(25);
    obj.edit382:setField("carCompDesc");
    obj.edit382:setName("edit382");

    obj.rectangle123 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle123:setLeft(0);
    obj.rectangle123:setTop(527);
    obj.rectangle123:setWidth(200);
    obj.rectangle123:setHeight(85);
    obj.rectangle123:setColor("black");
    obj.rectangle123:setName("rectangle123");

    obj.layout144 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.rectangle123);
    obj.layout144:setLeft(5);
    obj.layout144:setTop(5);
    obj.layout144:setWidth(195);
    obj.layout144:setHeight(25);
    obj.layout144:setName("layout144");

    obj.button41 = gui.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout144);
    obj.button41:setLeft(0);
    obj.button41:setTop(3);
    obj.button41:setWidth(42);
    obj.button41:setHeight(20);
    obj.button41:setText("FORT");
    obj.button41:setName("button41");

    obj.edit383 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit383:setParent(obj.layout144);
    obj.edit383:setLeft(45);
    obj.edit383:setTop(0);
    obj.edit383:setWidth(30);
    obj.edit383:setHeight(25);
    obj.edit383:setField("fortComp");
    obj.edit383:setName("edit383");

    obj.edit384 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit384:setParent(obj.layout144);
    obj.edit384:setLeft(80);
    obj.edit384:setTop(0);
    obj.edit384:setWidth(110);
    obj.edit384:setHeight(25);
    obj.edit384:setField("fortCompDesc");
    obj.edit384:setName("edit384");

    obj.layout145 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.rectangle123);
    obj.layout145:setLeft(5);
    obj.layout145:setTop(30);
    obj.layout145:setWidth(195);
    obj.layout145:setHeight(25);
    obj.layout145:setName("layout145");

    obj.button42 = gui.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout145);
    obj.button42:setLeft(0);
    obj.button42:setTop(3);
    obj.button42:setWidth(42);
    obj.button42:setHeight(20);
    obj.button42:setText("REF");
    obj.button42:setName("button42");

    obj.edit385 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit385:setParent(obj.layout145);
    obj.edit385:setLeft(45);
    obj.edit385:setTop(0);
    obj.edit385:setWidth(30);
    obj.edit385:setHeight(25);
    obj.edit385:setField("refComp");
    obj.edit385:setName("edit385");

    obj.edit386 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit386:setParent(obj.layout145);
    obj.edit386:setLeft(80);
    obj.edit386:setTop(0);
    obj.edit386:setWidth(110);
    obj.edit386:setHeight(25);
    obj.edit386:setField("refCompDesc");
    obj.edit386:setName("edit386");

    obj.layout146 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.rectangle123);
    obj.layout146:setLeft(5);
    obj.layout146:setTop(55);
    obj.layout146:setWidth(195);
    obj.layout146:setHeight(25);
    obj.layout146:setName("layout146");

    obj.button43 = gui.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout146);
    obj.button43:setLeft(0);
    obj.button43:setTop(3);
    obj.button43:setWidth(42);
    obj.button43:setHeight(20);
    obj.button43:setText("VON");
    obj.button43:setName("button43");

    obj.edit387 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit387:setParent(obj.layout146);
    obj.edit387:setLeft(45);
    obj.edit387:setTop(0);
    obj.edit387:setWidth(30);
    obj.edit387:setHeight(25);
    obj.edit387:setField("vonComp");
    obj.edit387:setName("edit387");

    obj.edit388 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit388:setParent(obj.layout146);
    obj.edit388:setLeft(80);
    obj.edit388:setTop(0);
    obj.edit388:setWidth(110);
    obj.edit388:setHeight(25);
    obj.edit388:setField("vonCompDesc");
    obj.edit388:setName("edit388");

    obj.rectangle124 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle124:setLeft(205);
    obj.rectangle124:setTop(0);
    obj.rectangle124:setWidth(300);
    obj.rectangle124:setHeight(300);
    obj.rectangle124:setColor("black");
    obj.rectangle124:setName("rectangle124");

    obj.label436 = gui.fromHandle(_obj_newObject("label"));
    obj.label436:setParent(obj.rectangle124);
    obj.label436:setLeft(0);
    obj.label436:setTop(0);
    obj.label436:setWidth(300);
    obj.label436:setHeight(25);
    obj.label436:setText("PERÍCIAS");
    obj.label436:setHorzTextAlign("center");
    obj.label436:setName("label436");

    obj.textEditor58 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor58:setParent(obj.rectangle124);
    obj.textEditor58:setLeft(5);
    obj.textEditor58:setTop(30);
    obj.textEditor58:setWidth(290);
    obj.textEditor58:setHeight(265);
    obj.textEditor58:setField("periciasComp");
    obj.textEditor58:setName("textEditor58");

    obj.rectangle125 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle125:setLeft(510);
    obj.rectangle125:setTop(0);
    obj.rectangle125:setWidth(300);
    obj.rectangle125:setHeight(300);
    obj.rectangle125:setColor("black");
    obj.rectangle125:setName("rectangle125");

    obj.label437 = gui.fromHandle(_obj_newObject("label"));
    obj.label437:setParent(obj.rectangle125);
    obj.label437:setLeft(0);
    obj.label437:setTop(0);
    obj.label437:setWidth(300);
    obj.label437:setHeight(25);
    obj.label437:setText("TALENTOS");
    obj.label437:setHorzTextAlign("center");
    obj.label437:setName("label437");

    obj.textEditor59 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor59:setParent(obj.rectangle125);
    obj.textEditor59:setLeft(5);
    obj.textEditor59:setTop(30);
    obj.textEditor59:setWidth(290);
    obj.textEditor59:setHeight(265);
    obj.textEditor59:setField("talentosComp");
    obj.textEditor59:setName("textEditor59");

    obj.rectangle126 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle126:setLeft(815);
    obj.rectangle126:setTop(0);
    obj.rectangle126:setWidth(300);
    obj.rectangle126:setHeight(300);
    obj.rectangle126:setColor("black");
    obj.rectangle126:setName("rectangle126");

    obj.label438 = gui.fromHandle(_obj_newObject("label"));
    obj.label438:setParent(obj.rectangle126);
    obj.label438:setLeft(0);
    obj.label438:setTop(0);
    obj.label438:setWidth(300);
    obj.label438:setHeight(25);
    obj.label438:setText("HABILIDADES");
    obj.label438:setHorzTextAlign("center");
    obj.label438:setName("label438");

    obj.textEditor60 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor60:setParent(obj.rectangle126);
    obj.textEditor60:setLeft(5);
    obj.textEditor60:setTop(30);
    obj.textEditor60:setWidth(290);
    obj.textEditor60:setHeight(265);
    obj.textEditor60:setField("habilidadesComp");
    obj.textEditor60:setName("textEditor60");

    obj.rectangle127 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle127:setLeft(205);
    obj.rectangle127:setTop(305);
    obj.rectangle127:setWidth(300);
    obj.rectangle127:setHeight(300);
    obj.rectangle127:setColor("black");
    obj.rectangle127:setName("rectangle127");

    obj.label439 = gui.fromHandle(_obj_newObject("label"));
    obj.label439:setParent(obj.rectangle127);
    obj.label439:setLeft(0);
    obj.label439:setTop(0);
    obj.label439:setWidth(300);
    obj.label439:setHeight(25);
    obj.label439:setText("INVENTARIO");
    obj.label439:setHorzTextAlign("center");
    obj.label439:setName("label439");

    obj.textEditor61 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor61:setParent(obj.rectangle127);
    obj.textEditor61:setLeft(5);
    obj.textEditor61:setTop(30);
    obj.textEditor61:setWidth(290);
    obj.textEditor61:setHeight(240);
    obj.textEditor61:setField("inventarioComp");
    obj.textEditor61:setName("textEditor61");

    obj.label440 = gui.fromHandle(_obj_newObject("label"));
    obj.label440:setParent(obj.rectangle127);
    obj.label440:setLeft(55);
    obj.label440:setTop(275);
    obj.label440:setWidth(50);
    obj.label440:setHeight(20);
    obj.label440:setText("PESO");
    obj.label440:setName("label440");

    obj.edit389 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit389:setParent(obj.rectangle127);
    obj.edit389:setLeft(95);
    obj.edit389:setTop(270);
    obj.edit389:setWidth(70);
    obj.edit389:setHeight(25);
    obj.edit389:setField("pesoInventorioComp");
    obj.edit389:setVertTextAlign("center");
    obj.edit389:setHorzTextAlign("center");
    obj.edit389:setName("edit389");

    obj.label441 = gui.fromHandle(_obj_newObject("label"));
    obj.label441:setParent(obj.rectangle127);
    obj.label441:setLeft(175);
    obj.label441:setTop(275);
    obj.label441:setWidth(50);
    obj.label441:setHeight(20);
    obj.label441:setText("PREÇO");
    obj.label441:setName("label441");

    obj.edit390 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit390:setParent(obj.rectangle127);
    obj.edit390:setLeft(225);
    obj.edit390:setTop(270);
    obj.edit390:setWidth(70);
    obj.edit390:setHeight(25);
    obj.edit390:setField("precoInventorioComp");
    obj.edit390:setVertTextAlign("center");
    obj.edit390:setHorzTextAlign("center");
    obj.edit390:setName("edit390");

    obj.dataLink136 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink136:setParent(obj.boxDetalhesDoCompanheiro);
    obj.dataLink136:setField("precoInventorioComp");
    obj.dataLink136:setName("dataLink136");

    obj.rectangle128 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle128:setLeft(510);
    obj.rectangle128:setTop(305);
    obj.rectangle128:setWidth(300);
    obj.rectangle128:setHeight(300);
    obj.rectangle128:setColor("black");
    obj.rectangle128:setName("rectangle128");

    obj.label442 = gui.fromHandle(_obj_newObject("label"));
    obj.label442:setParent(obj.rectangle128);
    obj.label442:setLeft(0);
    obj.label442:setTop(0);
    obj.label442:setWidth(300);
    obj.label442:setHeight(25);
    obj.label442:setText("ATAQUES");
    obj.label442:setHorzTextAlign("center");
    obj.label442:setName("label442");

    obj.textEditor62 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor62:setParent(obj.rectangle128);
    obj.textEditor62:setLeft(5);
    obj.textEditor62:setTop(30);
    obj.textEditor62:setWidth(290);
    obj.textEditor62:setHeight(120);
    obj.textEditor62:setField("ataquesComp");
    obj.textEditor62:setName("textEditor62");

    obj.label443 = gui.fromHandle(_obj_newObject("label"));
    obj.label443:setParent(obj.rectangle128);
    obj.label443:setLeft(5);
    obj.label443:setTop(150);
    obj.label443:setWidth(100);
    obj.label443:setHeight(20);
    obj.label443:setText("Macro");
    obj.label443:setName("label443");


					local function lines(str)
					   local t = {}
					   local function helper(line)
					      table.insert(t, line)
					      return ""
					   end
					   helper((str:gsub("(.-)\r?\n", helper)))
					   return t
					end
				


    obj.button44 = gui.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.rectangle128);
    obj.button44:setLeft(55);
    obj.button44:setTop(150);
    obj.button44:setWidth(50);
    obj.button44:setHeight(20);
    obj.button44:setHint("Envia tudo do segundo espaço para ataques no chat.");
    obj.button44:setText("Atacar");
    obj.button44:setName("button44");

    obj.textEditor63 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor63:setParent(obj.rectangle128);
    obj.textEditor63:setLeft(5);
    obj.textEditor63:setTop(170);
    obj.textEditor63:setWidth(290);
    obj.textEditor63:setHeight(120);
    obj.textEditor63:setField("macro");
    obj.textEditor63:setName("textEditor63");

    obj.rectangle129 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle129:setLeft(815);
    obj.rectangle129:setTop(305);
    obj.rectangle129:setWidth(300);
    obj.rectangle129:setHeight(300);
    obj.rectangle129:setColor("black");
    obj.rectangle129:setName("rectangle129");

    obj.label444 = gui.fromHandle(_obj_newObject("label"));
    obj.label444:setParent(obj.rectangle129);
    obj.label444:setLeft(0);
    obj.label444:setTop(0);
    obj.label444:setWidth(300);
    obj.label444:setHeight(25);
    obj.label444:setText("OUTROS");
    obj.label444:setHorzTextAlign("center");
    obj.label444:setName("label444");

    obj.textEditor64 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor64:setParent(obj.rectangle129);
    obj.textEditor64:setLeft(5);
    obj.textEditor64:setTop(30);
    obj.textEditor64:setWidth(290);
    obj.textEditor64:setHeight(265);
    obj.textEditor64:setField("outrosComp");
    obj.textEditor64:setName("textEditor64");

    obj.rectangle130 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle130:setLeft(1120);
    obj.rectangle130:setTop(0);
    obj.rectangle130:setWidth(202);
    obj.rectangle130:setHeight(202);
    obj.rectangle130:setColor("black");
    obj.rectangle130:setStrokeColor("white");
    obj.rectangle130:setStrokeSize(1);
    obj.rectangle130:setName("rectangle130");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.boxDetalhesDoCompanheiro);
    obj.image2:setLeft(1121);
    obj.image2:setTop(1);
    obj.image2:setWidth(200);
    obj.image2:setHeight(200);
    obj.image2:setField("avatarComp");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.button45 = gui.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.scrollBox7);
    obj.button45:setText("Novo Companheiro");
    obj.button45:setLeft(1140);
    obj.button45:setTop(206);
    obj.button45:setWidth(160);
    obj.button45:setHeight(20);
    obj.button45:setName("button45");

    obj.rectangle131 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.scrollBox7);
    obj.rectangle131:setLeft(1119);
    obj.rectangle131:setTop(229);
    obj.rectangle131:setWidth(202);
    obj.rectangle131:setHeight(362);
    obj.rectangle131:setColor("black");
    obj.rectangle131:setStrokeColor("white");
    obj.rectangle131:setStrokeSize(1);
    obj.rectangle131:setName("rectangle131");

    obj.rclListaDosCompanheiros = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosCompanheiros:setParent(obj.scrollBox7);
    obj.rclListaDosCompanheiros:setName("rclListaDosCompanheiros");
    obj.rclListaDosCompanheiros:setField("campoDosCompanheiros");
    obj.rclListaDosCompanheiros:setTemplateForm("frmFichaRPGmeister8CS_svg");
    obj.rclListaDosCompanheiros:setLeft(1120);
    obj.rclListaDosCompanheiros:setTop(230);
    obj.rclListaDosCompanheiros:setWidth(200);
    obj.rclListaDosCompanheiros:setHeight(360);
    obj.rclListaDosCompanheiros:setSelectable(true);
    obj.rclListaDosCompanheiros:setLayout("vertical");

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Descrição");
    obj.tab8:setName("tab8");

    obj.frmFichaRPGmeister9_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister9_svg:setParent(obj.tab8);
    obj.frmFichaRPGmeister9_svg:setName("frmFichaRPGmeister9_svg");
    obj.frmFichaRPGmeister9_svg:setAlign("client");
    obj.frmFichaRPGmeister9_svg:setTheme("dark");
    obj.frmFichaRPGmeister9_svg:setMargins({top=1});

    obj.scrollBox8 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmFichaRPGmeister9_svg);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.rectangle132 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.scrollBox8);
    obj.rectangle132:setLeft(0);
    obj.rectangle132:setTop(0);
    obj.rectangle132:setWidth(1205);
    obj.rectangle132:setHeight(105);
    obj.rectangle132:setColor("black");
    obj.rectangle132:setName("rectangle132");

    obj.label445 = gui.fromHandle(_obj_newObject("label"));
    obj.label445:setParent(obj.rectangle132);
    obj.label445:setLeft(3);
    obj.label445:setTop(1);
    obj.label445:setWidth(100);
    obj.label445:setHeight(20);
    obj.label445:setText("DESCRIÇÃO");
    obj.label445:setName("label445");

    obj.label446 = gui.fromHandle(_obj_newObject("label"));
    obj.label446:setParent(obj.rectangle132);
    obj.label446:setLeft(10);
    obj.label446:setTop(25);
    obj.label446:setWidth(90);
    obj.label446:setHeight(20);
    obj.label446:setText("TAMANHO");
    obj.label446:setHorzTextAlign("center");
    obj.label446:setName("label446");

    obj.comboBox11 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.rectangle132);
    obj.comboBox11:setLeft(100);
    obj.comboBox11:setTop(25);
    obj.comboBox11:setWidth(100);
    obj.comboBox11:setField("tamanho");
    obj.comboBox11:setFontColor("white");
    obj.comboBox11:setItems({'Minúsculo', 'Diminuto', 'Miúdo', 'Pequeno', 'Médio', 'Grande', 'Enorme', 'Imenso', 'Colossal'});
    obj.comboBox11:setValues({'-4','-3','-2','-1','0','1','2','3','4'});
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setName("comboBox11");

    obj.checkBox32 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.rectangle132);
    obj.checkBox32:setLeft(200);
    obj.checkBox32:setTop(25);
    obj.checkBox32:setWidth(100);
    obj.checkBox32:setField("quadrupede");
    obj.checkBox32:setText("Quadrúpede");
    obj.checkBox32:setName("checkBox32");

    obj.label447 = gui.fromHandle(_obj_newObject("label"));
    obj.label447:setParent(obj.rectangle132);
    obj.label447:setLeft(10);
    obj.label447:setTop(50);
    obj.label447:setWidth(90);
    obj.label447:setHeight(20);
    obj.label447:setText("ALTURA");
    obj.label447:setHorzTextAlign("center");
    obj.label447:setName("label447");

    obj.edit391 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit391:setParent(obj.rectangle132);
    obj.edit391:setLeft(100);
    obj.edit391:setTop(50);
    obj.edit391:setWidth(200);
    obj.edit391:setHeight(25);
    obj.edit391:setField("altura");
    obj.edit391:setVertTextAlign("center");
    obj.edit391:setName("edit391");

    obj.label448 = gui.fromHandle(_obj_newObject("label"));
    obj.label448:setParent(obj.rectangle132);
    obj.label448:setLeft(10);
    obj.label448:setTop(75);
    obj.label448:setWidth(90);
    obj.label448:setHeight(20);
    obj.label448:setText("PESO");
    obj.label448:setHorzTextAlign("center");
    obj.label448:setName("label448");

    obj.edit392 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit392:setParent(obj.rectangle132);
    obj.edit392:setLeft(100);
    obj.edit392:setTop(75);
    obj.edit392:setWidth(200);
    obj.edit392:setHeight(25);
    obj.edit392:setField("peso");
    obj.edit392:setVertTextAlign("center");
    obj.edit392:setName("edit392");

    obj.label449 = gui.fromHandle(_obj_newObject("label"));
    obj.label449:setParent(obj.rectangle132);
    obj.label449:setLeft(310);
    obj.label449:setTop(25);
    obj.label449:setWidth(90);
    obj.label449:setHeight(20);
    obj.label449:setText("IDADE");
    obj.label449:setHorzTextAlign("center");
    obj.label449:setName("label449");

    obj.edit393 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit393:setParent(obj.rectangle132);
    obj.edit393:setLeft(400);
    obj.edit393:setTop(25);
    obj.edit393:setWidth(200);
    obj.edit393:setHeight(25);
    obj.edit393:setField("idade");
    obj.edit393:setVertTextAlign("center");
    obj.edit393:setName("edit393");

    obj.label450 = gui.fromHandle(_obj_newObject("label"));
    obj.label450:setParent(obj.rectangle132);
    obj.label450:setLeft(310);
    obj.label450:setTop(50);
    obj.label450:setWidth(90);
    obj.label450:setHeight(20);
    obj.label450:setText("SEXO");
    obj.label450:setHorzTextAlign("center");
    obj.label450:setName("label450");

    obj.edit394 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit394:setParent(obj.rectangle132);
    obj.edit394:setLeft(400);
    obj.edit394:setTop(50);
    obj.edit394:setWidth(200);
    obj.edit394:setHeight(25);
    obj.edit394:setField("sexo");
    obj.edit394:setVertTextAlign("center");
    obj.edit394:setName("edit394");

    obj.label451 = gui.fromHandle(_obj_newObject("label"));
    obj.label451:setParent(obj.rectangle132);
    obj.label451:setLeft(310);
    obj.label451:setTop(75);
    obj.label451:setWidth(90);
    obj.label451:setHeight(20);
    obj.label451:setText("OUTROS");
    obj.label451:setHorzTextAlign("center");
    obj.label451:setName("label451");

    obj.edit395 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit395:setParent(obj.rectangle132);
    obj.edit395:setLeft(400);
    obj.edit395:setTop(75);
    obj.edit395:setWidth(200);
    obj.edit395:setHeight(25);
    obj.edit395:setField("aparenciaOutros");
    obj.edit395:setVertTextAlign("center");
    obj.edit395:setName("edit395");

    obj.label452 = gui.fromHandle(_obj_newObject("label"));
    obj.label452:setParent(obj.rectangle132);
    obj.label452:setLeft(610);
    obj.label452:setTop(25);
    obj.label452:setWidth(90);
    obj.label452:setHeight(20);
    obj.label452:setText("OLHOS");
    obj.label452:setHorzTextAlign("center");
    obj.label452:setName("label452");

    obj.edit396 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit396:setParent(obj.rectangle132);
    obj.edit396:setLeft(700);
    obj.edit396:setTop(25);
    obj.edit396:setWidth(200);
    obj.edit396:setHeight(25);
    obj.edit396:setField("aparenciaOlhos");
    obj.edit396:setVertTextAlign("center");
    obj.edit396:setName("edit396");

    obj.label453 = gui.fromHandle(_obj_newObject("label"));
    obj.label453:setParent(obj.rectangle132);
    obj.label453:setLeft(610);
    obj.label453:setTop(50);
    obj.label453:setWidth(90);
    obj.label453:setHeight(20);
    obj.label453:setText("PELE");
    obj.label453:setHorzTextAlign("center");
    obj.label453:setName("label453");

    obj.edit397 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit397:setParent(obj.rectangle132);
    obj.edit397:setLeft(700);
    obj.edit397:setTop(50);
    obj.edit397:setWidth(200);
    obj.edit397:setHeight(25);
    obj.edit397:setField("pele");
    obj.edit397:setVertTextAlign("center");
    obj.edit397:setName("edit397");

    obj.label454 = gui.fromHandle(_obj_newObject("label"));
    obj.label454:setParent(obj.rectangle132);
    obj.label454:setLeft(610);
    obj.label454:setTop(75);
    obj.label454:setWidth(90);
    obj.label454:setHeight(20);
    obj.label454:setText("CABELO");
    obj.label454:setHorzTextAlign("center");
    obj.label454:setName("label454");

    obj.edit398 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit398:setParent(obj.rectangle132);
    obj.edit398:setLeft(700);
    obj.edit398:setTop(75);
    obj.edit398:setWidth(200);
    obj.edit398:setHeight(25);
    obj.edit398:setField("cabelo");
    obj.edit398:setVertTextAlign("center");
    obj.edit398:setName("edit398");

    obj.label455 = gui.fromHandle(_obj_newObject("label"));
    obj.label455:setParent(obj.rectangle132);
    obj.label455:setLeft(910);
    obj.label455:setTop(25);
    obj.label455:setWidth(90);
    obj.label455:setHeight(20);
    obj.label455:setText("PLANO");
    obj.label455:setHorzTextAlign("center");
    obj.label455:setName("label455");

    obj.edit399 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit399:setParent(obj.rectangle132);
    obj.edit399:setLeft(1000);
    obj.edit399:setTop(25);
    obj.edit399:setWidth(200);
    obj.edit399:setHeight(25);
    obj.edit399:setField("plano");
    obj.edit399:setVertTextAlign("center");
    obj.edit399:setName("edit399");

    obj.label456 = gui.fromHandle(_obj_newObject("label"));
    obj.label456:setParent(obj.rectangle132);
    obj.label456:setLeft(910);
    obj.label456:setTop(50);
    obj.label456:setWidth(90);
    obj.label456:setHeight(20);
    obj.label456:setText("REGIÃO");
    obj.label456:setHorzTextAlign("center");
    obj.label456:setName("label456");

    obj.edit400 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit400:setParent(obj.rectangle132);
    obj.edit400:setLeft(1000);
    obj.edit400:setTop(50);
    obj.edit400:setWidth(200);
    obj.edit400:setHeight(25);
    obj.edit400:setField("regiao");
    obj.edit400:setVertTextAlign("center");
    obj.edit400:setName("edit400");

    obj.label457 = gui.fromHandle(_obj_newObject("label"));
    obj.label457:setParent(obj.rectangle132);
    obj.label457:setLeft(910);
    obj.label457:setTop(75);
    obj.label457:setWidth(90);
    obj.label457:setHeight(20);
    obj.label457:setText("REINO");
    obj.label457:setHorzTextAlign("center");
    obj.label457:setName("label457");

    obj.edit401 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit401:setParent(obj.rectangle132);
    obj.edit401:setLeft(1000);
    obj.edit401:setTop(75);
    obj.edit401:setWidth(200);
    obj.edit401:setHeight(25);
    obj.edit401:setField("reino");
    obj.edit401:setVertTextAlign("center");
    obj.edit401:setName("edit401");

    obj.dataLink137 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink137:setParent(obj.scrollBox8);
    obj.dataLink137:setFields({'tamanho', 'quadrupede', 'efetFor'});
    obj.dataLink137:setName("dataLink137");

    obj.layout147 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.scrollBox8);
    obj.layout147:setLeft(0);
    obj.layout147:setTop(110);
    obj.layout147:setWidth(375);
    obj.layout147:setHeight(240);
    obj.layout147:setName("layout147");

    obj.rectangle133 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.layout147);
    obj.rectangle133:setAlign("client");
    obj.rectangle133:setColor("black");
    obj.rectangle133:setName("rectangle133");

    obj.label458 = gui.fromHandle(_obj_newObject("label"));
    obj.label458:setParent(obj.layout147);
    obj.label458:setLeft(5);
    obj.label458:setTop(1);
    obj.label458:setWidth(100);
    obj.label458:setHeight(20);
    obj.label458:setText("APARÊNCIA");
    obj.label458:setName("label458");

    obj.textEditor65 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor65:setParent(obj.layout147);
    obj.textEditor65:setLeft(5);
    obj.textEditor65:setTop(25);
    obj.textEditor65:setWidth(365);
    obj.textEditor65:setHeight(210);
    obj.textEditor65:setField("aparencia");
    obj.textEditor65:setName("textEditor65");

    obj.layout148 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.scrollBox8);
    obj.layout148:setLeft(0);
    obj.layout148:setTop(355);
    obj.layout148:setWidth(375);
    obj.layout148:setHeight(250);
    obj.layout148:setName("layout148");

    obj.rectangle134 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.layout148);
    obj.rectangle134:setAlign("client");
    obj.rectangle134:setColor("black");
    obj.rectangle134:setName("rectangle134");

    obj.label459 = gui.fromHandle(_obj_newObject("label"));
    obj.label459:setParent(obj.layout148);
    obj.label459:setLeft(5);
    obj.label459:setTop(1);
    obj.label459:setWidth(100);
    obj.label459:setHeight(20);
    obj.label459:setText("PERSONALIDADE");
    obj.label459:setName("label459");

    obj.textEditor66 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor66:setParent(obj.layout148);
    obj.textEditor66:setLeft(5);
    obj.textEditor66:setTop(25);
    obj.textEditor66:setWidth(365);
    obj.textEditor66:setHeight(220);
    obj.textEditor66:setField("personalidade");
    obj.textEditor66:setName("textEditor66");

    obj.layout149 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.scrollBox8);
    obj.layout149:setLeft(380);
    obj.layout149:setTop(110);
    obj.layout149:setWidth(825);
    obj.layout149:setHeight(495);
    obj.layout149:setName("layout149");

    obj.rectangle135 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.layout149);
    obj.rectangle135:setAlign("client");
    obj.rectangle135:setColor("black");
    obj.rectangle135:setName("rectangle135");

    obj.label460 = gui.fromHandle(_obj_newObject("label"));
    obj.label460:setParent(obj.layout149);
    obj.label460:setLeft(5);
    obj.label460:setTop(1);
    obj.label460:setWidth(100);
    obj.label460:setHeight(20);
    obj.label460:setText("HISTORIA");
    obj.label460:setName("label460");

    obj.button46 = gui.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout149);
    obj.button46:setLeft(720);
    obj.button46:setTop(1);
    obj.button46:setWidth(100);
    obj.button46:setHeight(20);
    obj.button46:setText("Copiar Antigo");
    obj.button46:setName("button46");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout149);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab9 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Anotações");
    obj.tab9:setName("tab9");

    obj.frmFichaRPGmeister10_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab9);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");
    obj.frmFichaRPGmeister10_svg:setTheme("dark");

    obj.scrollBox9 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmFichaRPGmeister10_svg);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.layout150 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.scrollBox9);
    obj.layout150:setLeft(0);
    obj.layout150:setTop(0);
    obj.layout150:setWidth(400);
    obj.layout150:setHeight(605);
    obj.layout150:setName("layout150");

    obj.rectangle136 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle136:setParent(obj.layout150);
    obj.rectangle136:setAlign("client");
    obj.rectangle136:setColor("black");
    obj.rectangle136:setName("rectangle136");

    obj.label461 = gui.fromHandle(_obj_newObject("label"));
    obj.label461:setParent(obj.layout150);
    obj.label461:setLeft(0);
    obj.label461:setTop(0);
    obj.label461:setWidth(400);
    obj.label461:setHeight(20);
    obj.label461:setText("ANOTAÇÕES");
    obj.label461:setHorzTextAlign("center");
    obj.label461:setName("label461");

    obj.textEditor67 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor67:setParent(obj.layout150);
    obj.textEditor67:setLeft(10);
    obj.textEditor67:setTop(25);
    obj.textEditor67:setWidth(380);
    obj.textEditor67:setHeight(575);
    obj.textEditor67:setField("anotacoes1");
    obj.textEditor67:setName("textEditor67");

    obj.layout151 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.scrollBox9);
    obj.layout151:setLeft(405);
    obj.layout151:setTop(0);
    obj.layout151:setWidth(400);
    obj.layout151:setHeight(605);
    obj.layout151:setName("layout151");

    obj.rectangle137 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle137:setParent(obj.layout151);
    obj.rectangle137:setAlign("client");
    obj.rectangle137:setColor("black");
    obj.rectangle137:setName("rectangle137");

    obj.label462 = gui.fromHandle(_obj_newObject("label"));
    obj.label462:setParent(obj.layout151);
    obj.label462:setLeft(0);
    obj.label462:setTop(0);
    obj.label462:setWidth(400);
    obj.label462:setHeight(20);
    obj.label462:setText("ANOTAÇÕES");
    obj.label462:setHorzTextAlign("center");
    obj.label462:setName("label462");

    obj.textEditor68 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor68:setParent(obj.layout151);
    obj.textEditor68:setLeft(10);
    obj.textEditor68:setTop(25);
    obj.textEditor68:setWidth(380);
    obj.textEditor68:setHeight(575);
    obj.textEditor68:setField("anotacoes2");
    obj.textEditor68:setName("textEditor68");

    obj.layout152 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.scrollBox9);
    obj.layout152:setLeft(810);
    obj.layout152:setTop(0);
    obj.layout152:setWidth(400);
    obj.layout152:setHeight(605);
    obj.layout152:setName("layout152");

    obj.rectangle138 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle138:setParent(obj.layout152);
    obj.rectangle138:setAlign("client");
    obj.rectangle138:setColor("black");
    obj.rectangle138:setName("rectangle138");

    obj.label463 = gui.fromHandle(_obj_newObject("label"));
    obj.label463:setParent(obj.layout152);
    obj.label463:setLeft(0);
    obj.label463:setTop(0);
    obj.label463:setWidth(400);
    obj.label463:setHeight(20);
    obj.label463:setText("ANOTAÇÕES");
    obj.label463:setHorzTextAlign("center");
    obj.label463:setName("label463");

    obj.textEditor69 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor69:setParent(obj.layout152);
    obj.textEditor69:setLeft(10);
    obj.textEditor69:setTop(25);
    obj.textEditor69:setWidth(380);
    obj.textEditor69:setHeight(575);
    obj.textEditor69:setField("anotacoes3");
    obj.textEditor69:setName("textEditor69");

    obj.tab10 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Creditos");
    obj.tab10:setName("tab10");

    obj.frmFichaRPGmeister11_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab10);
    obj.frmFichaRPGmeister11_svg:setName("frmFichaRPGmeister11_svg");
    obj.frmFichaRPGmeister11_svg:setAlign("client");
    obj.frmFichaRPGmeister11_svg:setTheme("dark");

    obj.scrollBox10 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmFichaRPGmeister11_svg);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox10);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(600);
    obj.image3:setHeight(600);
    obj.image3:setSRC("/FichaAnima/images/RPGmeister.jpg");
    obj.image3:setStyle("stretch");
    obj.image3:setOptimize(true);
    obj.image3:setName("image3");

    obj.layout153 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.scrollBox10);
    obj.layout153:setLeft(620);
    obj.layout153:setTop(10);
    obj.layout153:setWidth(200);
    obj.layout153:setHeight(150);
    obj.layout153:setName("layout153");

    obj.rectangle139 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle139:setParent(obj.layout153);
    obj.rectangle139:setLeft(0);
    obj.rectangle139:setTop(0);
    obj.rectangle139:setWidth(200);
    obj.rectangle139:setHeight(150);
    obj.rectangle139:setColor("black");
    obj.rectangle139:setXradius(15);
    obj.rectangle139:setYradius(15);
    obj.rectangle139:setCornerType("round");
    obj.rectangle139:setName("rectangle139");

    obj.label464 = gui.fromHandle(_obj_newObject("label"));
    obj.label464:setParent(obj.layout153);
    obj.label464:setLeft(0);
    obj.label464:setTop(10);
    obj.label464:setWidth(200);
    obj.label464:setHeight(20);
    obj.label464:setText("Programador: Vinny (Ambesek)");
    obj.label464:setHorzTextAlign("center");
    obj.label464:setName("label464");

    obj.label465 = gui.fromHandle(_obj_newObject("label"));
    obj.label465:setParent(obj.layout153);
    obj.label465:setLeft(0);
    obj.label465:setTop(35);
    obj.label465:setWidth(200);
    obj.label465:setHeight(20);
    obj.label465:setText("Arte: Nefer (Nefertyne)");
    obj.label465:setHorzTextAlign("center");
    obj.label465:setName("label465");

    obj.layout154 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.scrollBox10);
    obj.layout154:setLeft(830);
    obj.layout154:setTop(0);
    obj.layout154:setWidth(400);
    obj.layout154:setHeight(350);
    obj.layout154:setName("layout154");

    obj.rectangle140 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle140:setParent(obj.layout154);
    obj.rectangle140:setAlign("client");
    obj.rectangle140:setColor("black");
    obj.rectangle140:setName("rectangle140");

    obj.label466 = gui.fromHandle(_obj_newObject("label"));
    obj.label466:setParent(obj.layout154);
    obj.label466:setLeft(0);
    obj.label466:setTop(0);
    obj.label466:setWidth(400);
    obj.label466:setHeight(20);
    obj.label466:setText("ANOTAÇÕES DO MESTRE");
    obj.label466:setHorzTextAlign("center");
    obj.label466:setName("label466");

    obj.textEditor70 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor70:setParent(obj.layout154);
    obj.textEditor70:setLeft(10);
    obj.textEditor70:setTop(25);
    obj.textEditor70:setWidth(380);
    obj.textEditor70:setHeight(320);
    obj.textEditor70:setField("anotacoes_do_mestre");
    obj.textEditor70:setName("textEditor70");

    obj.label467 = gui.fromHandle(_obj_newObject("label"));
    obj.label467:setParent(obj.scrollBox10);
    obj.label467:setLeft(620);
    obj.label467:setTop(375);
    obj.label467:setWidth(200);
    obj.label467:setHeight(20);
    obj.label467:setText("SUA VERSÃO:");
    obj.label467:setField("versionInstalled");
    obj.label467:setName("label467");

    obj.label468 = gui.fromHandle(_obj_newObject("label"));
    obj.label468:setParent(obj.scrollBox10);
    obj.label468:setLeft(620);
    obj.label468:setTop(400);
    obj.label468:setWidth(200);
    obj.label468:setHeight(20);
    obj.label468:setText("VERSÃO ATUAL:");
    obj.label468:setField("versionDownloaded");
    obj.label468:setName("label468");

    obj.checkBox33 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.scrollBox10);
    obj.checkBox33:setLeft(620);
    obj.checkBox33:setTop(425);
    obj.checkBox33:setWidth(200);
    obj.checkBox33:setHeight(20);
    obj.checkBox33:setField("noUpdate");
    obj.checkBox33:setText("Não pedir para atualizar.");
    obj.checkBox33:setName("checkBox33");

    obj.button47 = gui.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.scrollBox10);
    obj.button47:setLeft(620);
    obj.button47:setTop(475);
    obj.button47:setWidth(100);
    obj.button47:setText("Change Log");
    obj.button47:setName("button47");

    obj.button48 = gui.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.scrollBox10);
    obj.button48:setLeft(730);
    obj.button48:setTop(475);
    obj.button48:setWidth(100);
    obj.button48:setText("Atualizar");
    obj.button48:setName("button48");

    obj.button49 = gui.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.scrollBox10);
    obj.button49:setLeft(840);
    obj.button49:setTop(475);
    obj.button49:setWidth(100);
    obj.button49:setText("Tutorial");
    obj.button49:setName("button49");

    obj.label469 = gui.fromHandle(_obj_newObject("label"));
    obj.label469:setParent(obj.scrollBox10);
    obj.label469:setLeft(620);
    obj.label469:setTop(525);
    obj.label469:setWidth(120);
    obj.label469:setHeight(20);
    obj.label469:setText("CONHEÇA A MESA:");
    obj.label469:setFontSize(11);
    obj.label469:setName("label469");

    obj.button50 = gui.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.scrollBox10);
    obj.button50:setLeft(730);
    obj.button50:setTop(525);
    obj.button50:setWidth(100);
    obj.button50:setText("RPGmeister");
    obj.button50:setName("button50");

    obj.button51 = gui.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.scrollBox10);
    obj.button51:setLeft(840);
    obj.button51:setTop(525);
    obj.button51:setWidth(100);
    obj.button51:setHeight(20);
    obj.button51:setText("Exportar Ficha");
    obj.button51:setName("button51");

    obj.button52 = gui.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.scrollBox10);
    obj.button52:setLeft(950);
    obj.button52:setTop(525);
    obj.button52:setWidth(100);
    obj.button52:setHeight(20);
    obj.button52:setText("Importar Ficha");
    obj.button52:setName("button52");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Anima%20RPG/output/Ficha%20Anima%20RPG.rpk?raw=true",
                        function(stream, contentType)
                            local info = rrpg.plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = rrpg.plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão (".. info.version .. ") da Ficha Anima. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Anima%20RPG/output/Ficha%20Anima%20RPG.rpk?raw=true');
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
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando For");
            							index = index + 1;
            						end;
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
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Des");
            							index = index + 1;
            						end;
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
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Con");
            							index = index + 1;
            						end;
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
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Int");
            							index = index + 1;
            						end;
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
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Sab");
            							index = index + 1;
            						end;
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
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Car");
            							index = index + 1;
            						end;
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
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						local tr = 	(tonumber(sheet.ajuste) or 0) + 
            									(tonumber(sheet.efetModFor) or 0) + 
            									(tonumber(sheet.efetModCon) or 0) + 
            									(tonumber(sheet.magiaFort) or 0) + 
            									(tonumber(sheet.variavelFort) or 0) + 
            									(tonumber(sheet.temporarioFort) or 0) + 
            									(tonumber(sheet.outrosFort) or 0) + 10;
            						sheet.trFort = tr;
            					end;
        end, obj);

    obj._e_event8 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						local tr = 	(tonumber(sheet.ajuste) or 0) + 
            									(tonumber(sheet.efetModDes) or 0) + 
            									(tonumber(sheet.efetModInt) or 0) + 
            									(tonumber(sheet.magiaRef) or 0) + 
            									(tonumber(sheet.variavelRef) or 0) + 
            									(tonumber(sheet.temporarioRef) or 0) + 
            									(tonumber(sheet.outrosRef) or 0) + 10;
            						sheet.trRef = tr;
            					end;
        end, obj);

    obj._e_event9 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						local tr = 	(tonumber(sheet.ajuste) or 0) + 
            									(tonumber(sheet.efetModDes) or 0) + 
            									(tonumber(sheet.efetModInt) or 0) + 
            									(tonumber(sheet.magiaRefT) or 0) + 
            									(tonumber(sheet.variavelRefT) or 0) + 
            									(tonumber(sheet.temporarioRefT) or 0) + 
            									(tonumber(sheet.outrosRefT) or 0) + 10;
            						sheet.trRefT = tr;
            					end;
        end, obj);

    obj._e_event10 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            						local tr = 	(tonumber(sheet.ajuste) or 0) + 
            									(tonumber(sheet.efetModSab) or 0) + 
            									(tonumber(sheet.efetModCar) or 0) + 
            									(tonumber(sheet.magiaVon) or 0) + 
            									(tonumber(sheet.variavelVon) or 0) + 
            									(tonumber(sheet.temporarioVon) or 0) + 
            									(tonumber(sheet.outrosVon) or 0) + 10;
            						sheet.trVon = tr;
            					end;
        end, obj);

    obj._e_event11 = obj.button1:addEventListener("onClick",
        function (self)
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

    obj._e_event12 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
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
            						local xpAlvo = 50;
            						local xpAlvoOld = 0;
            						local nivel = 1;
            						while mod>=xpAlvo do
            							local aux = xpAlvo;
            							xpAlvo = 2 * xpAlvo - xpAlvoOld + 10 * 2 ^ math.max(math.floor((nivel - 1)/5), 0);
            							xpAlvoOld = aux;
            							local mesa = rrpg.getMesaDe(sheet);
            							nivel = nivel+1;
            						end
            						xpAlvo = math.floor(xpAlvo);
            						
            						while true do  
            							xpAlvo, k = string.gsub(xpAlvo, "^(-?%d+)(%d%d%d)", '%1,%2')
            							if (k==0) then
            							  break
            							end
            						end
            						xpAlvo = string.gsub(xpAlvo, ",", ".");
            						
            						sheet.xpNivel = xpAlvo .. "XP";
            						sheet.nep = nivel;
            
            						local ajuste = math.floor((nivel-1)/5);
            						sheet.ajuste = ajuste;
            
            						local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
            						for i=1, #nodes, 1 do
            							nodes[i].ajuste = ajuste;
            						end
            
            						local nodes = ndb.getChildNodes(sheet.attackList); 
            						for i=1, #nodes, 1 do
            							nodes[i].ajuste = ajuste;
            						end
            					end;
        end, obj);

    obj._e_event13 = obj.button2:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 " .. (sheet.efetModFor) or 0);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Força de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event14 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador real de For");
            							index = index + 1;
            						end;
            						sheet.realModFor = getMOD(sheet.realFor);  
            					end;
        end, obj);

    obj._e_event15 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador efetivo de For");
            							index = index + 1;
            						end;
            						sheet.efetModFor = getMOD(sheet.efetFor);
            						updateAtributes(1);
            					end;
        end, obj);

    obj._e_event16 = obj.button3:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 " .. (sheet.efetModDes) or 0);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Destreza de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event17 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador real de Des");
            							index = index + 1;
            						end;
            						sheet.realModDes = getMOD(sheet.realDes);  
            					end;
        end, obj);

    obj._e_event18 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador efetivo de Des");
            							index = index + 1;
            						end;
            						sheet.efetModDes = getMOD(sheet.efetDes);
            						updateAtributes(2);
            					end;
        end, obj);

    obj._e_event19 = obj.button4:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 " .. (sheet.efetModCon) or 0);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Constituição de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event20 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador real de Con");
            							index = index + 1;
            						end;
            						sheet.realModCon = getMOD(sheet.realCon);  
            					end;
        end, obj);

    obj._e_event21 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador efetivo de Con");
            							index = index + 1;
            						end;
            						sheet.efetModCon = getMOD(sheet.efetCon);
            						updateAtributes(3);
            					end;
        end, obj);

    obj._e_event22 = obj.button5:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 " .. (sheet.efetModInt) or 0);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Inteligência de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event23 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador real de Int");
            							index = index + 1;
            						end;
            						sheet.realModInt = getMOD(sheet.realInt);  
            					end;
        end, obj);

    obj._e_event24 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador efetivo de Int");
            							index = index + 1;
            						end;
            						sheet.efetModInt = getMOD(sheet.efetInt);
            						updateAtributes(4);
            					end;
        end, obj);

    obj._e_event25 = obj.button6:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 " .. (sheet.efetModSab) or 0);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Sabedoria de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event26 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador real de Sab");
            							index = index + 1;
            						end;
            						sheet.realModSab = getMOD(sheet.realSab);  
            					end;
        end, obj);

    obj._e_event27 = obj.dataLink27:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador efetivo de Sab");
            							index = index + 1;
            						end;
            						sheet.efetModSab = getMOD(sheet.efetSab);
            						updateAtributes(5);
            					end;
        end, obj);

    obj._e_event28 = obj.button7:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 " .. (sheet.efetModCar) or 0);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Carisma de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event29 = obj.dataLink28:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador real de Car");
            							index = index + 1;
            						end;
            						sheet.realModCar = getMOD(sheet.realCar);  
            					end;
        end, obj);

    obj._e_event30 = obj.dataLink29:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador efetivo de Car");
            							index = index + 1;
            						end;
            						sheet.efetModCar = getMOD(sheet.efetCar);
            						updateAtributes(6);
            					end;
        end, obj);

    obj._e_event31 = obj.AtrBut:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("popAtributo");
            				
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("rightCenter", self.AtrBut);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup de atributos para exibir");
            					end;
        end, obj);

    obj._e_event32 = obj.dataLink30:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslTerrestre ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Deslocamento em quadrados.");
            							index = index + 1;
            						end;
            
            						local mod = sheet.deslTerrestre;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslTerrestreQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event33 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslVoo ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Deslocamento em quadrados.");
            							index = index + 1;
            						end;
            
            						local mod = sheet.deslVoo;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslVooQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event34 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslNatacao ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Deslocamento em quadrados.");
            							index = index + 1;
            						end;
            
            						local mod = sheet.deslNatacao;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslNatacaoQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event35 = obj.dataLink33:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslEscalar ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Deslocamento em quadrados.");
            							index = index + 1;
            						end;
            
            						local mod = sheet.deslEscalar;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslEscalarQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event36 = obj.dataLink34:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil and sheet.deslEscavar ~= nil then
            						if debug then
            							local mesa = rrpg.getMesaDe(sheet);
            							mesa.activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Deslocamento em quadrados.");
            							index = index + 1;
            						end;
            
            						local mod = sheet.deslEscavar;
            						mod = string.gsub(mod, "m", "");
            						mod = string.gsub(mod, ",", ".");
            
            						mod = math.floor((tonumber(mod) or 0) / 1.5);
            						sheet.deslEscavarQuadrados = mod .. "q";
            					end;
        end, obj);

    obj._e_event37 = obj.button8:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 " .. (sheet.iniciativa or "+0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Iniciativa de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event38 = obj.dataLink35:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet== nil then return end;
            					local modIniciativa = math.max((tonumber(sheet.efetModDes) or 0), (tonumber(sheet.efetModInt) or 0), (tonumber(sheet.efetModSab) or 0)) + 
            											(tonumber(sheet.iniVariado) or 0) + 
            											(tonumber(sheet.ajuste) or 0);
            					sheet.modIniciativa = modIniciativa;
            
            					local mod = modIniciativa + (tonumber(sheet.iniVariado) or 0);
            					if (mod >= 0) then
            							mod = "+" .. mod;
            					end;					   
            					sheet.iniciativa = mod;
        end, obj);

    obj._e_event39 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            					local pv = 10 + (tonumber(sheet.nep) or 0) * 5 +
            									(tonumber(sheet.efetCon) or 0) +
            									(tonumber(sheet.pvExtra) or 0);
            					sheet.pvTotal = pv;
        end, obj);

    obj._e_event40 = obj.button9:addEventListener("onClick",
        function (self)
            caSecreta();
        end, obj);

    obj._e_event41 = obj.button10:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 +" .. (sheet.trFort) or "0");
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Fortitude de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event42 = obj.button11:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 +" .. (sheet.trRef) or "0");
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Reflexos de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event43 = obj.button12:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 +" .. (sheet.trRefT) or "0");
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Reflexos (Toque) de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event44 = obj.button13:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 +" .. (sheet.trVon) or "0");
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de Vontade de " .. (sheet.nome or "NOME"));
        end, obj);

    obj._e_event45 = obj.TrBut:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("popResistencia");
            				
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("rightCenter", self.TrBut);
            					else
            						showMessage("Ops, bug.. nao encontrei o popup de resistencias para exibir");
            					end;
        end, obj);

    obj._e_event46 = obj.image1:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event47 = obj.attackList:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then 
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
            				elseif nodeA.enabled then
            					return -1;
            				elseif nodeB.enabled then
            					return 1;
            				end;
        end, obj);

    obj._e_event48 = obj.dataLink37:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            				local addWeapon = tonumber(sheet.addWeapon) or 0;
            				if addWeapon>0 then
            					sheet.addWeapon = 0;
            					local item = self.attackList:append();
            					item.enabled = false;
            				end;
        end, obj);

    obj._e_event49 = obj.rclListaDasPericias:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nomePericia, nodeB.nomePericia);
        end, obj);

    obj._e_event50 = obj.rclListaDosIdiomas:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nomeIdioma, nodeB.nomeIdioma);
        end, obj);

    obj._e_event51 = obj.button14:addEventListener("onClick",
        function (self)
            self.rclListaDasPericias:append();
        end, obj);

    obj._e_event52 = obj.button15:addEventListener("onClick",
        function (self)
            local idioma = self.rclListaDosIdiomas:append();
            					idioma.conversarIdioma = true;
            					idioma.escritaIdioma = true;
        end, obj);

    obj._e_event53 = obj.button16:addEventListener("onClick",
        function (self)
            animaSkills();
        end, obj);

    obj._e_event54 = obj.dataLink38:addEventListener("onChange",
        function (self, field, oldValue, newValue)
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

    obj._e_event55 = obj.rclListaDosTalentos:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event56 = obj.rclListaDosOutros:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event57 = obj.rclListaDasCaracteristicasClasse:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event58 = obj.button17:addEventListener("onClick",
        function (self)
            self.rclListaDosTalentos:append();
        end, obj);

    obj._e_event59 = obj.button18:addEventListener("onClick",
        function (self)
            self.rclListaDosOutros:append();
        end, obj);

    obj._e_event60 = obj.button19:addEventListener("onClick",
        function (self)
            self.rclListaDasCaracteristicasClasse:append();
        end, obj);

    obj._e_event61 = obj.button20:addEventListener("onClick",
        function (self)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event62 = obj.rclListaDosItens:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosItens.selectedNode;
            				self.boxDetalhesDoItem.node = node;
            				self.boxDetalhesDoItem.visible = (node ~= nil);
            				limpar();
        end, obj);

    obj._e_event63 = obj.rclListaDosItens:addEventListener("onEndEnumeration",
        function (self)
            if self.rclListaDosItens.selectedNode == nil and sheet ~= nil then
            					local nodes = ndb.getChildNodes(sheet.campoDosItens);               
            					if #nodes > 0 then
            						self.rclListaDosItens.selectedNode = nodes[1];
            					end;
            					limpar();
            				end;
        end, obj);

    obj._e_event64 = obj.button21:addEventListener("onClick",
        function (self)
            local rolagem = rrpg.interpretarRolagem("1d20 +" .. self.boxDetalhesDoItem.node.NC);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de conjurador de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event65 = obj.dataLink39:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            								if debug then
            									rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Paginas do Grimorio.");
            									index = index + 1;
            								end;
            								local mod = (tonumber(self.boxDetalhesDoItem.node.conhecidas0) or 0) + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas1) or 0) + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas2) or 0)*2 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas3) or 0)*3 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas4) or 0)*4 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas5) or 0)*5 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas6) or 0)*6 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas7) or 0)*7 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas8) or 0)*8 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas9) or 0)*9;
            								self.boxDetalhesDoItem.node.grimorio = mod;
            							end;
        end, obj);

    obj._e_event66 = obj.dataLink40:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base0==nil then 
            							node.total0 = nil;
            						else
            							node.total0 = 	(tonumber(node.base0) or 0) + 
            												(tonumber(node.bonus0) or 0);
            						end;
        end, obj);

    obj._e_event67 = obj.dataLink41:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 0;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus0 = resultado;
            						end;
        end, obj);

    obj._e_event68 = obj.dataLink42:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 0;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd0 = mod;
            						end;
        end, obj);

    obj._e_event69 = obj.dataLink43:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base1==nil then 
            							node.total1 = nil;
            						else
            							node.total1 = 	(tonumber(node.base1) or 0) + 
            												(tonumber(node.bonus1) or 0);
            						end;
        end, obj);

    obj._e_event70 = obj.dataLink44:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 1;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus1 = resultado;
            						end;
        end, obj);

    obj._e_event71 = obj.dataLink45:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 1;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd1 = mod;
            						end;
        end, obj);

    obj._e_event72 = obj.dataLink46:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base2==nil then 
            							node.total2 = nil;
            						else
            							node.total2 = 	(tonumber(node.base2) or 0) + 
            												(tonumber(node.bonus2) or 0);
            						end;
        end, obj);

    obj._e_event73 = obj.dataLink47:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 2;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus2 = resultado;
            						end;
        end, obj);

    obj._e_event74 = obj.dataLink48:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 2;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd2 = mod;
            						end;
        end, obj);

    obj._e_event75 = obj.dataLink49:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base3==nil then 
            							node.total3 = nil;
            						else
            							node.total3 = 	(tonumber(node.base3) or 0) + 
            												(tonumber(node.bonus3) or 0);
            						end;
        end, obj);

    obj._e_event76 = obj.dataLink50:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 3;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus3 = resultado;
            						end;
        end, obj);

    obj._e_event77 = obj.dataLink51:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 3;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd3 = mod;
            						end;
        end, obj);

    obj._e_event78 = obj.dataLink52:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base4==nil then 
            							node.total4 = nil;
            						else
            							node.total4 = 	(tonumber(node.base4) or 0) + 
            												(tonumber(node.bonus4) or 0);
            						end;
        end, obj);

    obj._e_event79 = obj.dataLink53:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 4;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus4 = resultado;
            						end;
        end, obj);

    obj._e_event80 = obj.dataLink54:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 4;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd4 = mod;
            						end;
        end, obj);

    obj._e_event81 = obj.dataLink55:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base5==nil then 
            							node.total5 = nil;
            						else
            							node.total5 = 	(tonumber(node.base5) or 0) + 
            												(tonumber(node.bonus5) or 0);
            						end;
        end, obj);

    obj._e_event82 = obj.dataLink56:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 5;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus5 = resultado;
            						end;
        end, obj);

    obj._e_event83 = obj.dataLink57:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 5;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd5 = mod;
            						end;
        end, obj);

    obj._e_event84 = obj.dataLink58:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base6==nil then 
            							node.total6 = nil;
            						else
            							node.total6 = 	(tonumber(node.base6) or 0) + 
            												(tonumber(node.bonus6) or 0);
            						end;
        end, obj);

    obj._e_event85 = obj.dataLink59:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 6;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus6 = resultado;
            						end;
        end, obj);

    obj._e_event86 = obj.dataLink60:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 6;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd6 = mod;
            						end;
        end, obj);

    obj._e_event87 = obj.dataLink61:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base7==nil then 
            							node.total7 = nil;
            						else
            							node.total7 = 	(tonumber(node.base7) or 0) + 
            												(tonumber(node.bonus7) or 0);
            						end;
        end, obj);

    obj._e_event88 = obj.dataLink62:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 7;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus7 = resultado;
            						end;
        end, obj);

    obj._e_event89 = obj.dataLink63:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 7;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd7 = mod;
            						end;
        end, obj);

    obj._e_event90 = obj.dataLink64:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base8==nil then 
            							node.total8 = nil;
            						else
            							node.total8 = 	(tonumber(node.base8) or 0) + 
            												(tonumber(node.bonus8) or 0);
            						end;
        end, obj);

    obj._e_event91 = obj.dataLink65:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 8;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus8 = resultado;
            						end;
        end, obj);

    obj._e_event92 = obj.dataLink66:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 8;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd8 = mod;
            						end;
        end, obj);

    obj._e_event93 = obj.dataLink67:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base9==nil then 
            							node.total9 = nil;
            						else
            							node.total9 = 	(tonumber(node.base9) or 0) + 
            												(tonumber(node.bonus9) or 0);
            						end;
        end, obj);

    obj._e_event94 = obj.dataLink68:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 9;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus9 = resultado;
            						end;
        end, obj);

    obj._e_event95 = obj.dataLink69:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 9;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd9 = mod;
            						end;
        end, obj);

    obj._e_event96 = obj.dataLink70:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD signos");
            								index = index + 1;
            							end;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							
            							self.boxDetalhesDoItem.node.cdSignos = (10+mod+1) .. "  " .. (10+mod+3) .. "  " .. (10+mod+5) .. "  " .. (10+mod+7) .. "  " .. (10+mod+9);
            						end;
        end, obj);

    obj._e_event97 = obj.dataLink71:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            								if debug then
            									rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Paginas do grimorio.");
            									index = index + 1;
            								end;
            								local mod = (tonumber(self.boxDetalhesDoItem.node.conhecidas0) or 0) + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas1) or 0) + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas2) or 0)*2 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas3) or 0)*3 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas4) or 0)*4 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas5) or 0)*5 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas6) or 0)*6 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas7) or 0)*7 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas8) or 0)*8 + 
            											(tonumber(self.boxDetalhesDoItem.node.conhecidas9) or 0)*9;
            								self.boxDetalhesDoItem.node.grimorio = mod;
            							end;
        end, obj);

    obj._e_event98 = obj.dataLink72:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base0==nil then 
            							node.total0 = nil;
            						else
            							node.total0 = 	(tonumber(node.base0) or 0) + 
            												(tonumber(node.bonus0) or 0);
            						end;
        end, obj);

    obj._e_event99 = obj.dataLink73:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 0;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus0 = resultado;
            						end;
        end, obj);

    obj._e_event100 = obj.dataLink74:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 0;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd0 = mod;
            						end;
        end, obj);

    obj._e_event101 = obj.dataLink75:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base1==nil then 
            							node.total1 = nil;
            						else
            							node.total1 = 	(tonumber(node.base1) or 0) + 
            												(tonumber(node.bonus1) or 0);
            						end;
        end, obj);

    obj._e_event102 = obj.dataLink76:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 1;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus1 = resultado;
            						end;
        end, obj);

    obj._e_event103 = obj.dataLink77:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 1;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd1 = mod;
            						end;
        end, obj);

    obj._e_event104 = obj.dataLink78:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base2==nil then 
            							node.total2 = nil;
            						else
            							node.total2 = 	(tonumber(node.base2) or 0) + 
            												(tonumber(node.bonus2) or 0);
            						end;
        end, obj);

    obj._e_event105 = obj.dataLink79:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 2;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus2 = resultado;
            						end;
        end, obj);

    obj._e_event106 = obj.dataLink80:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 2;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd2 = mod;
            						end;
        end, obj);

    obj._e_event107 = obj.dataLink81:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base3==nil then 
            							node.total3 = nil;
            						else
            							node.total3 = 	(tonumber(node.base3) or 0) + 
            												(tonumber(node.bonus3) or 0);
            						end;
        end, obj);

    obj._e_event108 = obj.dataLink82:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 3;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus3 = resultado;
            						end;
        end, obj);

    obj._e_event109 = obj.dataLink83:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 3;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd3 = mod;
            						end;
        end, obj);

    obj._e_event110 = obj.dataLink84:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base4==nil then 
            							node.total4 = nil;
            						else
            							node.total4 = 	(tonumber(node.base4) or 0) + 
            												(tonumber(node.bonus4) or 0);
            						end;
        end, obj);

    obj._e_event111 = obj.dataLink85:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 4;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus4 = resultado;
            						end;
        end, obj);

    obj._e_event112 = obj.dataLink86:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 4;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd4 = mod;
            						end;
        end, obj);

    obj._e_event113 = obj.dataLink87:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base5==nil then 
            							node.total5 = nil;
            						else
            							node.total5 = 	(tonumber(node.base5) or 0) + 
            												(tonumber(node.bonus5) or 0);
            						end;
        end, obj);

    obj._e_event114 = obj.dataLink88:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 5;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus5 = resultado;
            						end;
        end, obj);

    obj._e_event115 = obj.dataLink89:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 5;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd5 = mod;
            						end;
        end, obj);

    obj._e_event116 = obj.dataLink90:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base6==nil then 
            							node.total6 = nil;
            						else
            							node.total6 = 	(tonumber(node.base6) or 0) + 
            												(tonumber(node.bonus6) or 0);
            						end;
        end, obj);

    obj._e_event117 = obj.dataLink91:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 6;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus6 = resultado;
            						end;
        end, obj);

    obj._e_event118 = obj.dataLink92:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 6;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd6 = mod;
            						end;
        end, obj);

    obj._e_event119 = obj.dataLink93:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base7==nil then 
            							node.total7 = nil;
            						else
            							node.total7 = 	(tonumber(node.base7) or 0) + 
            												(tonumber(node.bonus7) or 0);
            						end;
        end, obj);

    obj._e_event120 = obj.dataLink94:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 7;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus7 = resultado;
            						end;
        end, obj);

    obj._e_event121 = obj.dataLink95:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 7;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd7 = mod;
            						end;
        end, obj);

    obj._e_event122 = obj.dataLink96:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base8==nil then 
            							node.total8 = nil;
            						else
            							node.total8 = 	(tonumber(node.base8) or 0) + 
            												(tonumber(node.bonus8) or 0);
            						end;
        end, obj);

    obj._e_event123 = obj.dataLink97:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 8;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus8 = resultado;
            						end;
        end, obj);

    obj._e_event124 = obj.dataLink98:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 8;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd8 = mod;
            						end;
        end, obj);

    obj._e_event125 = obj.dataLink99:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base9==nil then 
            							node.total9 = nil;
            						else
            							node.total9 = 	(tonumber(node.base9) or 0) + 
            												(tonumber(node.bonus9) or 0);
            						end;
        end, obj);

    obj._e_event126 = obj.dataLink100:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 9;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus9 = resultado;
            						end;
        end, obj);

    obj._e_event127 = obj.dataLink101:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 9;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd9 = mod;
            						end;
        end, obj);

    obj._e_event128 = obj.button22:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias6:append();
        end, obj);

    obj._e_event129 = obj.rclListaDasMagias6:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event130 = obj.button23:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias0:append();
        end, obj);

    obj._e_event131 = obj.rclListaDasMagias0:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event132 = obj.button24:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias3:append();
        end, obj);

    obj._e_event133 = obj.rclListaDasMagias3:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event134 = obj.button25:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias7:append();
        end, obj);

    obj._e_event135 = obj.rclListaDasMagias7:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event136 = obj.button26:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias1:append();
        end, obj);

    obj._e_event137 = obj.rclListaDasMagias1:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event138 = obj.button27:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias4:append();
        end, obj);

    obj._e_event139 = obj.rclListaDasMagias4:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event140 = obj.button28:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias8:append();
        end, obj);

    obj._e_event141 = obj.rclListaDasMagias8:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event142 = obj.button29:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias2:append();
        end, obj);

    obj._e_event143 = obj.rclListaDasMagias2:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event144 = obj.button30:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias5:append();
        end, obj);

    obj._e_event145 = obj.rclListaDasMagias5:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event146 = obj.button31:addEventListener("onClick",
        function (self)
            self.rclListaDasMagias9:append();
        end, obj);

    obj._e_event147 = obj.rclListaDasMagias9:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.dispMagia) or 0) < (tonumber(nodeB.dispMagia) or 0) then
            					        return 1;
            					    elseif (tonumber(nodeA.dispMagia )or 0) > (tonumber(nodeB.dispMagia) or 0) then
            					        return -1;
            					    else   
            					        return utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            					    end;
        end, obj);

    obj._e_event148 = obj.dataLink102:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base10==nil then 
            							node.total10 = nil;
            						else
            							node.total10 = 	(tonumber(node.base10) or 0) + 
            												(tonumber(node.bonus10) or 0);
            						end;
        end, obj);

    obj._e_event149 = obj.dataLink103:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 10;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus10 = resultado;
            						end;
        end, obj);

    obj._e_event150 = obj.dataLink104:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 10;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd10 = mod;
            						end;
        end, obj);

    obj._e_event151 = obj.dataLink105:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base11==nil then 
            							node.total11 = nil;
            						else
            							node.total11 = 	(tonumber(node.base11) or 0) + 
            												(tonumber(node.bonus11) or 0);
            						end;
        end, obj);

    obj._e_event152 = obj.dataLink106:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 11;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus11 = resultado;
            						end;
        end, obj);

    obj._e_event153 = obj.dataLink107:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 11;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd11 = mod;
            						end;
        end, obj);

    obj._e_event154 = obj.dataLink108:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base12==nil then 
            							node.total12 = nil;
            						else
            							node.total12 = 	(tonumber(node.base12) or 0) + 
            												(tonumber(node.bonus12) or 0);
            						end;
        end, obj);

    obj._e_event155 = obj.dataLink109:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 12;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus12 = resultado;
            						end;
        end, obj);

    obj._e_event156 = obj.dataLink110:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 12;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd12 = mod;
            						end;
        end, obj);

    obj._e_event157 = obj.dataLink111:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base13==nil then 
            							node.total13 = nil;
            						else
            							node.total13 = 	(tonumber(node.base13) or 0) + 
            												(tonumber(node.bonus13) or 0);
            						end;
        end, obj);

    obj._e_event158 = obj.dataLink112:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 13;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus13 = resultado;
            						end;
        end, obj);

    obj._e_event159 = obj.dataLink113:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 13;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd13 = mod;
            						end;
        end, obj);

    obj._e_event160 = obj.dataLink114:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base14==nil then 
            							node.total14 = nil;
            						else
            							node.total14 = 	(tonumber(node.base14) or 0) + 
            												(tonumber(node.bonus14) or 0);
            						end;
        end, obj);

    obj._e_event161 = obj.dataLink115:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 14;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus14 = resultado;
            						end;
        end, obj);

    obj._e_event162 = obj.dataLink116:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 14;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd14 = mod;
            						end;
        end, obj);

    obj._e_event163 = obj.dataLink117:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base15==nil then 
            							node.total15 = nil;
            						else
            							node.total15 = 	(tonumber(node.base15) or 0) + 
            												(tonumber(node.bonus15) or 0);
            						end;
        end, obj);

    obj._e_event164 = obj.dataLink118:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 15;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus15 = resultado;
            						end;
        end, obj);

    obj._e_event165 = obj.dataLink119:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 15;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd15 = mod;
            						end;
        end, obj);

    obj._e_event166 = obj.dataLink120:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base16==nil then 
            							node.total16 = nil;
            						else
            							node.total16 = 	(tonumber(node.base16) or 0) + 
            												(tonumber(node.bonus16) or 0);
            						end;
        end, obj);

    obj._e_event167 = obj.dataLink121:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 16;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus16 = resultado;
            						end;
        end, obj);

    obj._e_event168 = obj.dataLink122:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 16;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd16 = mod;
            						end;
        end, obj);

    obj._e_event169 = obj.dataLink123:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base17==nil then 
            							node.total17 = nil;
            						else
            							node.total17 = 	(tonumber(node.base17) or 0) + 
            												(tonumber(node.bonus17) or 0);
            						end;
        end, obj);

    obj._e_event170 = obj.dataLink124:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 17;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus17 = resultado;
            						end;
        end, obj);

    obj._e_event171 = obj.dataLink125:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 17;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd17 = mod;
            						end;
        end, obj);

    obj._e_event172 = obj.dataLink126:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base18==nil then 
            							node.total18 = nil;
            						else
            							node.total18 = 	(tonumber(node.base18) or 0) + 
            												(tonumber(node.bonus18) or 0);
            						end;
        end, obj);

    obj._e_event173 = obj.dataLink127:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 18;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus18 = resultado;
            						end;
        end, obj);

    obj._e_event174 = obj.dataLink128:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 18;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd18 = mod;
            						end;
        end, obj);

    obj._e_event175 = obj.dataLink129:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local node = self.boxDetalhesDoItem.node;
            						if node.base19==nil then 
            							node.total19 = nil;
            						else
            							node.total19 = 	(tonumber(node.base19) or 0) + 
            												(tonumber(node.bonus19) or 0);
            						end;
        end, obj);

    obj._e_event176 = obj.dataLink130:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Bonus Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoBonus;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 19;
            							
            							if nivel==0 then
            								resultado = 0;
            							else 
            								if (nivel>mod) then
            									result = 0;
            								else
            									resultado = mod + 4 - nivel;
            									resultado = math.floor(resultado/4);
            								end;
            							end;
            							
            							self.boxDetalhesDoItem.node.bonus19 = resultado;
            						end;
        end, obj);

    obj._e_event177 = obj.dataLink131:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            							if debug then
            								rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando CD de Magia.");
            								index = index + 1;
            							end;
            							local resultado = 0;
            							local mod = 0;
            							local ctrl = self.boxDetalhesDoItem.node.atributoCD;
            							
            							if ctrl=='1' then
            								mod = getFOR();
            							elseif ctrl=='2' then
            								mod = getDES();
            							elseif ctrl=='3' then
            								mod = getCON();
            							elseif ctrl=='4' then
            								mod = getINT();
            							elseif ctrl=='5' then
            								mod = getSAB();
            							elseif ctrl=='6' then
            								mod = getCAR();
            							end;
            							local nivel = 19;
            							
            							mod = 10 + mod + nivel;
            
            							self.boxDetalhesDoItem.node.cd19 = mod;
            						end;
        end, obj);

    obj._e_event178 = obj.comboBox9:addEventListener("onChange",
        function (self)
            limpar();
        end, obj);

    obj._e_event179 = obj.button32:addEventListener("onClick",
        function (self)
            self.rclListaDasArmas:append();
        end, obj);

    obj._e_event180 = obj.dataLink132:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            					if debug then
            						rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Gastos em PO");
            						index = index + 1;
            					end;
            
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

    obj._e_event181 = obj.dataLink133:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local penalidade = (tonumber(sheet.penalidade) or 0)
            					
            					local nodes = ndb.getChildNodes(sheet.campoDasPericias); 
            					for i=1, #nodes, 1 do
            						nodes[i].penalidade = penalidade;
            					end
        end, obj);

    obj._e_event182 = obj.dataLink134:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~= nil then
            					if debug then
            						rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Carga");
            						index = index + 1;
            					end;
            
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

    obj._e_event183 = obj.dataLink135:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					if debug then
            						rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Carga");
            						index = index + 1;
            					end;
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

    obj._e_event184 = obj.button33:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. (node.iniciativaComp or 0));
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de iniciativa de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event185 = obj.button34:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. (node.agarrarComp or 0));
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de agarrar de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event186 = obj.button35:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.forModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de força de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event187 = obj.edit371:addEventListener("onChange",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						if debug then
            							rrpg.getMesaDe(node).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador de Atributo do Companheiro. ");
            							index = index + 1;
            						end;
            						local mod = (tonumber(node.forComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.forModComp = mod;
            					end;
        end, obj);

    obj._e_event188 = obj.button36:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.desModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de destreza de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event189 = obj.edit373:addEventListener("onChange",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						if debug then
            							rrpg.getMesaDe(node).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador de Atributo do Companheiro. ");
            							index = index + 1;
            						end;
            						local mod = (tonumber(node.desComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.desModComp = mod;
            					end;
        end, obj);

    obj._e_event190 = obj.button37:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.conModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de constituição de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event191 = obj.edit375:addEventListener("onChange",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						if debug then
            							rrpg.getMesaDe(node).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador de Atributo do Companheiro. ");
            							index = index + 1;
            						end;
            						local mod = (tonumber(node.conComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.conModComp = mod;
            					end;
        end, obj);

    obj._e_event192 = obj.button38:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.intModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de inteligência de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event193 = obj.edit377:addEventListener("onChange",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						if debug then
            							rrpg.getMesaDe(node).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador de Atributo do Companheiro. ");
            							index = index + 1;
            						end;
            						local mod = (tonumber(node.intComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.intModComp = mod;
            					end;
        end, obj);

    obj._e_event194 = obj.button39:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.sabModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de sabedoria de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event195 = obj.edit379:addEventListener("onChange",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						if debug then
            							rrpg.getMesaDe(node).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador de Atributo do Companheiro. ");
            							index = index + 1;
            						end;
            						local mod = (tonumber(node.sabComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.sabModComp = mod;
            					end;
        end, obj);

    obj._e_event196 = obj.button40:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.carModComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de carisma de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event197 = obj.edit381:addEventListener("onChange",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					if node~=nil then
            						if debug then
            							rrpg.getMesaDe(node).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Modificador de Atributo do Companheiro. ");
            							index = index + 1;
            						end;
            						local mod = (tonumber(node.carComp) or 0);
            						mod = math.floor((mod-10)/2);
            						if mod >=0 then
            							mod = "+" .. mod;
            						end;
            						node.carModComp = mod;
            					end;
        end, obj);

    obj._e_event198 = obj.button41:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.fortComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de fortitude de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event199 = obj.button42:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.refComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de reflexos de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event200 = obj.button43:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            					local dado = "1d20 ";
            					local bonus = tonumber(node.vonComp) or 0;
            					if bonus >= 0 then
            						dado = "1d20 + ";
            					end;
            					local rolagem = rrpg.interpretarRolagem(dado .. bonus);
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de vontade de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event201 = obj.dataLink136:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nodes = ndb.getChildNodes(sheet.campoDosCompanheiros);   
            					local total = 0;
            					for i=1, #nodes, 1 do
            						total = total + (getNumber(nodes[i].precoInventorioComp) or 0);
            					end
            					sheet.precoInventorioComp = total;
        end, obj);

    obj._e_event202 = obj.button44:addEventListener("onClick",
        function (self)
            local macro = self.boxDetalhesDoCompanheiro.node.macro;
            						if macro~=nil then
            							local macros = lines(macro);
            							local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            							for i=1, #macros, 1 do
            								mesaDoPersonagem.activeChat:enviarMensagem(macros[i]);
            							end;
            						end;
        end, obj);

    obj._e_event203 = obj.image2:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.rclListaDosCompanheiros.selectedNode.avatarComp);
        end, obj);

    obj._e_event204 = obj.button45:addEventListener("onClick",
        function (self)
            self.rclListaDosCompanheiros:append();
        end, obj);

    obj._e_event205 = obj.rclListaDosCompanheiros:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            				self.boxDetalhesDoCompanheiro.node = node;
            				self.boxDetalhesDoCompanheiro.visible = (node ~= nil);
        end, obj);

    obj._e_event206 = obj.rclListaDosCompanheiros:addEventListener("onEndEnumeration",
        function (self)
            if self.rclListaDosCompanheiros.selectedNode == nil and sheet ~= nil then
            					local nodes = ndb.getChildNodes(sheet.campoDosCompanheiros);               
            					if #nodes > 0 then
            						self.rclListaDosCompanheiros.selectedNode = nodes[1];
            					end;
            				end;
        end, obj);

    obj._e_event207 = obj.dataLink137:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            					if debug then
            						rrpg.getMesaDe(sheet).activeChat:enviarMensagem("Debug #:" .. index .. ": Atualizando Tamanho. ");
            						index = index + 1;
            					end;
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
            
            					local load = ndb.load("loads.xml");
            
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

    obj._e_event208 = obj.button46:addEventListener("onClick",
        function (self)
            System.setClipboardText(sheet.historia);
        end, obj);

    obj._e_event209 = obj.button47:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Anima%20RPG/README.md')
        end, obj);

    obj._e_event210 = obj.button48:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Anima%20RPG/output/Ficha%20Anima%20RPG.rpk?raw=true')
        end, obj);

    obj._e_event211 = obj.button49:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20RPG%20meister/__Tutorial/Ficha%20RPG%20meister%20-%20Tutorial.docx?raw=true')
        end, obj);

    obj._e_event212 = obj.button50:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event213 = obj.button51:addEventListener("onClick",
        function (self)
            local export = ndb.load("export.xml");
            				export.clone = sheet;
            
            				setTimeout(
            						function ()
            							local stream = vhd.openFile("export.xml");
            							Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml",
            								function()
            									stream:close();
            									showMessage("Ficha Exportada.");
            								end);
            						end, 
            						2500
            					);
        end, obj);

    obj._e_event214 = obj.button52:addEventListener("onClick",
        function (self)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            
            						-- Testar se deletar o arquivo funciona bem...
            		                if vhd.fileExists("import.xml") then
            		                    vhd.deleteFile("import.xml");
            		                end;
            						
            						local stream = vhd.openFile("import.xml", "w");
            						stream:copyFrom(arq.stream, arq.stream.size);
            
            						setTimeout(
            								function ()
            									stream:close();
            									local import = ndb.load("import.xml");
            									
            									local allAtts = ndb.getAttributes(import.clone);
            
            									local mesa = rrpg.getMesaDe(sheet);
            									for k, v in pairs(allAtts) do
            										sheet[k] = v;
            									end;
            									
            									sheet.campoDosAtaques = import.clone.campoDosAtaques;
            
            									sheet.campoDasPericias = import.clone.campoDasPericias;
            									sheet.campoDosIdiomas = import.clone.campoDosIdiomas;
            
            									sheet.campoDosTalentos = import.clone.campoDosTalentos;
            									sheet.campoDosOutros = import.clone.campoDosOutros;
            									sheet.campoDasCaracteristicasClasse = import.clone.campoDasCaracteristicasClasse;
            
            									sheet.campoDosItens = import.clone.campoDosItens;
            
            									sheet.campoDasArmas = import.clone.campoDasArmas;
            									sheet.itensConsumiveis = import.clone.itensConsumiveis;
            
            									sheet.campoDosCompanheiros = import.clone.campoDosCompanheiros;
            
            									import = {};
            
            									showMessage("Ficha Importada.");
            								end, 
            								3000
            							);
            
            					end);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
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
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.label327 ~= nil then self.label327:destroy(); self.label327 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label338 ~= nil then self.label338:destroy(); self.label338 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label399 ~= nil then self.label399:destroy(); self.label399 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.rectangle138 ~= nil then self.rectangle138:destroy(); self.rectangle138 = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.frmFichaRPGmeister1_svg ~= nil then self.frmFichaRPGmeister1_svg:destroy(); self.frmFichaRPGmeister1_svg = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label331 ~= nil then self.label331:destroy(); self.label331 = nil; end;
        if self.flowPart241 ~= nil then self.flowPart241:destroy(); self.flowPart241 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit400 ~= nil then self.edit400:destroy(); self.edit400 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label465 ~= nil then self.label465:destroy(); self.label465 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label307 ~= nil then self.label307:destroy(); self.label307 = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.label455 ~= nil then self.label455:destroy(); self.label455 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.flowPart236 ~= nil then self.flowPart236:destroy(); self.flowPart236 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label378 ~= nil then self.label378:destroy(); self.label378 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.label324 ~= nil then self.label324:destroy(); self.label324 = nil; end;
        if self.dataLink107 ~= nil then self.dataLink107:destroy(); self.dataLink107 = nil; end;
        if self.label332 ~= nil then self.label332:destroy(); self.label332 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.label334 ~= nil then self.label334:destroy(); self.label334 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label401 ~= nil then self.label401:destroy(); self.label401 = nil; end;
        if self.label375 ~= nil then self.label375:destroy(); self.label375 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rclListaDasMagias0 ~= nil then self.rclListaDasMagias0:destroy(); self.rclListaDasMagias0 = nil; end;
        if self.flowPart142 ~= nil then self.flowPart142:destroy(); self.flowPart142 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.label323 ~= nil then self.label323:destroy(); self.label323 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.textEditor54 ~= nil then self.textEditor54:destroy(); self.textEditor54 = nil; end;
        if self.textEditor43 ~= nil then self.textEditor43:destroy(); self.textEditor43 = nil; end;
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
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.rclListaDosCompanheiros ~= nil then self.rclListaDosCompanheiros:destroy(); self.rclListaDosCompanheiros = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
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
        if self.dataLink128 ~= nil then self.dataLink128:destroy(); self.dataLink128 = nil; end;
        if self.textEditor40 ~= nil then self.textEditor40:destroy(); self.textEditor40 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.flowPart183 ~= nil then self.flowPart183:destroy(); self.flowPart183 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.label380 ~= nil then self.label380:destroy(); self.label380 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.popArma ~= nil then self.popArma:destroy(); self.popArma = nil; end;
        if self.flowPart232 ~= nil then self.flowPart232:destroy(); self.flowPart232 = nil; end;
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
        if self.flowPart222 ~= nil then self.flowPart222:destroy(); self.flowPart222 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.flowPart234 ~= nil then self.flowPart234:destroy(); self.flowPart234 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.flowPart180 ~= nil then self.flowPart180:destroy(); self.flowPart180 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.label341 ~= nil then self.label341:destroy(); self.label341 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.layoutSignos ~= nil then self.layoutSignos:destroy(); self.layoutSignos = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.edit398 ~= nil then self.edit398:destroy(); self.edit398 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label439 ~= nil then self.label439:destroy(); self.label439 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label357 ~= nil then self.label357:destroy(); self.label357 = nil; end;
        if self.edit393 ~= nil then self.edit393:destroy(); self.edit393 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.label413 ~= nil then self.label413:destroy(); self.label413 = nil; end;
        if self.label298 ~= nil then self.label298:destroy(); self.label298 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.label365 ~= nil then self.label365:destroy(); self.label365 = nil; end;
        if self.textEditor66 ~= nil then self.textEditor66:destroy(); self.textEditor66 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.label434 ~= nil then self.label434:destroy(); self.label434 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.textEditor46 ~= nil then self.textEditor46:destroy(); self.textEditor46 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.flowPart155 ~= nil then self.flowPart155:destroy(); self.flowPart155 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.alvo4 ~= nil then self.alvo4:destroy(); self.alvo4 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.label425 ~= nil then self.label425:destroy(); self.label425 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.dataLink108 ~= nil then self.dataLink108:destroy(); self.dataLink108 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.flowPart248 ~= nil then self.flowPart248:destroy(); self.flowPart248 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.edit397 ~= nil then self.edit397:destroy(); self.edit397 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.label301 ~= nil then self.label301:destroy(); self.label301 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.flowPart230 ~= nil then self.flowPart230:destroy(); self.flowPart230 = nil; end;
        if self.rectangle140 ~= nil then self.rectangle140:destroy(); self.rectangle140 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.popResistencia ~= nil then self.popResistencia:destroy(); self.popResistencia = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.textEditor35 ~= nil then self.textEditor35:destroy(); self.textEditor35 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.dataLink112 ~= nil then self.dataLink112:destroy(); self.dataLink112 = nil; end;
        if self.textEditor52 ~= nil then self.textEditor52:destroy(); self.textEditor52 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.flowPart202 ~= nil then self.flowPart202:destroy(); self.flowPart202 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.flowPart237 ~= nil then self.flowPart237:destroy(); self.flowPart237 = nil; end;
        if self.flowPart174 ~= nil then self.flowPart174:destroy(); self.flowPart174 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.dataLink127 ~= nil then self.dataLink127:destroy(); self.dataLink127 = nil; end;
        if self.label379 ~= nil then self.label379:destroy(); self.label379 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.flowPart252 ~= nil then self.flowPart252:destroy(); self.flowPart252 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.flowPart214 ~= nil then self.flowPart214:destroy(); self.flowPart214 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.flowPart197 ~= nil then self.flowPart197:destroy(); self.flowPart197 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.textEditor26 ~= nil then self.textEditor26:destroy(); self.textEditor26 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.label396 ~= nil then self.label396:destroy(); self.label396 = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.label345 ~= nil then self.label345:destroy(); self.label345 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label303 ~= nil then self.label303:destroy(); self.label303 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.textEditor45 ~= nil then self.textEditor45:destroy(); self.textEditor45 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.alvo1 ~= nil then self.alvo1:destroy(); self.alvo1 = nil; end;
        if self.label457 ~= nil then self.label457:destroy(); self.label457 = nil; end;
        if self.label344 ~= nil then self.label344:destroy(); self.label344 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.flowPart210 ~= nil then self.flowPart210:destroy(); self.flowPart210 = nil; end;
        if self.textEditor63 ~= nil then self.textEditor63:destroy(); self.textEditor63 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label353 ~= nil then self.label353:destroy(); self.label353 = nil; end;
        if self.label412 ~= nil then self.label412:destroy(); self.label412 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowPart204 ~= nil then self.flowPart204:destroy(); self.flowPart204 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.flowPart179 ~= nil then self.flowPart179:destroy(); self.flowPart179 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.label356 ~= nil then self.label356:destroy(); self.label356 = nil; end;
        if self.label383 ~= nil then self.label383:destroy(); self.label383 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.label414 ~= nil then self.label414:destroy(); self.label414 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.label400 ~= nil then self.label400:destroy(); self.label400 = nil; end;
        if self.frmFichaRPGmeister2_svg ~= nil then self.frmFichaRPGmeister2_svg:destroy(); self.frmFichaRPGmeister2_svg = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.flowPart153 ~= nil then self.flowPart153:destroy(); self.flowPart153 = nil; end;
        if self.frmFichaRPGmeister8_svg ~= nil then self.frmFichaRPGmeister8_svg:destroy(); self.frmFichaRPGmeister8_svg = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label385 ~= nil then self.label385:destroy(); self.label385 = nil; end;
        if self.flowPart167 ~= nil then self.flowPart167:destroy(); self.flowPart167 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label314 ~= nil then self.label314:destroy(); self.label314 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.flowPart134 ~= nil then self.flowPart134:destroy(); self.flowPart134 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.dataLink118 ~= nil then self.dataLink118:destroy(); self.dataLink118 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.flowPart151 ~= nil then self.flowPart151:destroy(); self.flowPart151 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label322 ~= nil then self.label322:destroy(); self.label322 = nil; end;
        if self.label427 ~= nil then self.label427:destroy(); self.label427 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.edit395 ~= nil then self.edit395:destroy(); self.edit395 = nil; end;
        if self.textEditor69 ~= nil then self.textEditor69:destroy(); self.textEditor69 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.flowPart165 ~= nil then self.flowPart165:destroy(); self.flowPart165 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.flowPart184 ~= nil then self.flowPart184:destroy(); self.flowPart184 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.textEditor61 ~= nil then self.textEditor61:destroy(); self.textEditor61 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.layoutListaMagias ~= nil then self.layoutListaMagias:destroy(); self.layoutListaMagias = nil; end;
        if self.edit396 ~= nil then self.edit396:destroy(); self.edit396 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.label299 ~= nil then self.label299:destroy(); self.label299 = nil; end;
        if self.flowPart181 ~= nil then self.flowPart181:destroy(); self.flowPart181 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.flowPart178 ~= nil then self.flowPart178:destroy(); self.flowPart178 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.label328 ~= nil then self.label328:destroy(); self.label328 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.label428 ~= nil then self.label428:destroy(); self.label428 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.label462 ~= nil then self.label462:destroy(); self.label462 = nil; end;
        if self.flowPart225 ~= nil then self.flowPart225:destroy(); self.flowPart225 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.flowPart223 ~= nil then self.flowPart223:destroy(); self.flowPart223 = nil; end;
        if self.label359 ~= nil then self.label359:destroy(); self.label359 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.rclListaDasMagias5 ~= nil then self.rclListaDasMagias5:destroy(); self.rclListaDasMagias5 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.label446 ~= nil then self.label446:destroy(); self.label446 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.flowPart150 ~= nil then self.flowPart150:destroy(); self.flowPart150 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
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
        if self.layoutMagias ~= nil then self.layoutMagias:destroy(); self.layoutMagias = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.frmFichaRPGmeister3_svg ~= nil then self.frmFichaRPGmeister3_svg:destroy(); self.frmFichaRPGmeister3_svg = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.label445 ~= nil then self.label445:destroy(); self.label445 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.flowPart240 ~= nil then self.flowPart240:destroy(); self.flowPart240 = nil; end;
        if self.popPericia ~= nil then self.popPericia:destroy(); self.popPericia = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.label321 ~= nil then self.label321:destroy(); self.label321 = nil; end;
        if self.textEditor36 ~= nil then self.textEditor36:destroy(); self.textEditor36 = nil; end;
        if self.dataLink114 ~= nil then self.dataLink114:destroy(); self.dataLink114 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.flowPart231 ~= nil then self.flowPart231:destroy(); self.flowPart231 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rclListaDasMagias4 ~= nil then self.rclListaDasMagias4:destroy(); self.rclListaDasMagias4 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit385 ~= nil then self.edit385:destroy(); self.edit385 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.flowPart209 ~= nil then self.flowPart209:destroy(); self.flowPart209 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.rclListaDosTalentos ~= nil then self.rclListaDosTalentos:destroy(); self.rclListaDosTalentos = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.flowPart253 ~= nil then self.flowPart253:destroy(); self.flowPart253 = nil; end;
        if self.edit388 ~= nil then self.edit388:destroy(); self.edit388 = nil; end;
        if self.label305 ~= nil then self.label305:destroy(); self.label305 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.label418 ~= nil then self.label418:destroy(); self.label418 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label358 ~= nil then self.label358:destroy(); self.label358 = nil; end;
        if self.flowPart220 ~= nil then self.flowPart220:destroy(); self.flowPart220 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.frmFichaRPGmeister7_svg ~= nil then self.frmFichaRPGmeister7_svg:destroy(); self.frmFichaRPGmeister7_svg = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.label295 ~= nil then self.label295:destroy(); self.label295 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.flowPart244 ~= nil then self.flowPart244:destroy(); self.flowPart244 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.edit387 ~= nil then self.edit387:destroy(); self.edit387 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.label360 ~= nil then self.label360:destroy(); self.label360 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.flowPart189 ~= nil then self.flowPart189:destroy(); self.flowPart189 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.label424 ~= nil then self.label424:destroy(); self.label424 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label342 ~= nil then self.label342:destroy(); self.label342 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.textEditor59 ~= nil then self.textEditor59:destroy(); self.textEditor59 = nil; end;
        if self.flowPart249 ~= nil then self.flowPart249:destroy(); self.flowPart249 = nil; end;
        if self.label467 ~= nil then self.label467:destroy(); self.label467 = nil; end;
        if self.label371 ~= nil then self.label371:destroy(); self.label371 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.label408 ~= nil then self.label408:destroy(); self.label408 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowPart216 ~= nil then self.flowPart216:destroy(); self.flowPart216 = nil; end;
        if self.flowPart149 ~= nil then self.flowPart149:destroy(); self.flowPart149 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.textEditor62 ~= nil then self.textEditor62:destroy(); self.textEditor62 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.label309 ~= nil then self.label309:destroy(); self.label309 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.flowPart239 ~= nil then self.flowPart239:destroy(); self.flowPart239 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.label442 ~= nil then self.label442:destroy(); self.label442 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label297 ~= nil then self.label297:destroy(); self.label297 = nil; end;
        if self.flowPart228 ~= nil then self.flowPart228:destroy(); self.flowPart228 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.label391 ~= nil then self.label391:destroy(); self.label391 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
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
        if self.label432 ~= nil then self.label432:destroy(); self.label432 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.textEditor60 ~= nil then self.textEditor60:destroy(); self.textEditor60 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.alvo2 ~= nil then self.alvo2:destroy(); self.alvo2 = nil; end;
        if self.flowPart166 ~= nil then self.flowPart166:destroy(); self.flowPart166 = nil; end;
        if self.dataLink130 ~= nil then self.dataLink130:destroy(); self.dataLink130 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.dataLink131 ~= nil then self.dataLink131:destroy(); self.dataLink131 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.dataLink103 ~= nil then self.dataLink103:destroy(); self.dataLink103 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.flowPart170 ~= nil then self.flowPart170:destroy(); self.flowPart170 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.dataLink134 ~= nil then self.dataLink134:destroy(); self.dataLink134 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.flowPart245 ~= nil then self.flowPart245:destroy(); self.flowPart245 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.flowPart143 ~= nil then self.flowPart143:destroy(); self.flowPart143 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.edit381 ~= nil then self.edit381:destroy(); self.edit381 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label452 ~= nil then self.label452:destroy(); self.label452 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.attackList ~= nil then self.attackList:destroy(); self.attackList = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor41 ~= nil then self.textEditor41:destroy(); self.textEditor41 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label398 ~= nil then self.label398:destroy(); self.label398 = nil; end;
        if self.flowPart186 ~= nil then self.flowPart186:destroy(); self.flowPart186 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.label438 ~= nil then self.label438:destroy(); self.label438 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.label369 ~= nil then self.label369:destroy(); self.label369 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.textEditor33 ~= nil then self.textEditor33:destroy(); self.textEditor33 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.dataLink129 ~= nil then self.dataLink129:destroy(); self.dataLink129 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label346 ~= nil then self.label346:destroy(); self.label346 = nil; end;
        if self.flowPart212 ~= nil then self.flowPart212:destroy(); self.flowPart212 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.label316 ~= nil then self.label316:destroy(); self.label316 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.textEditor70 ~= nil then self.textEditor70:destroy(); self.textEditor70 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.flowPart201 ~= nil then self.flowPart201:destroy(); self.flowPart201 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.flowPart164 ~= nil then self.flowPart164:destroy(); self.flowPart164 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.rclListaDasMagias8 ~= nil then self.rclListaDasMagias8:destroy(); self.rclListaDasMagias8 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.flowPart172 ~= nil then self.flowPart172:destroy(); self.flowPart172 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink132 ~= nil then self.dataLink132:destroy(); self.dataLink132 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.flowPart221 ~= nil then self.flowPart221:destroy(); self.flowPart221 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.rectangle136 ~= nil then self.rectangle136:destroy(); self.rectangle136 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.label311 ~= nil then self.label311:destroy(); self.label311 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layoutMagiasAprimoradas ~= nil then self.layoutMagiasAprimoradas:destroy(); self.layoutMagiasAprimoradas = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink125 ~= nil then self.dataLink125:destroy(); self.dataLink125 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label441 ~= nil then self.label441:destroy(); self.label441 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.flowPart182 ~= nil then self.flowPart182:destroy(); self.flowPart182 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.textEditor44 ~= nil then self.textEditor44:destroy(); self.textEditor44 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.label407 ~= nil then self.label407:destroy(); self.label407 = nil; end;
        if self.flowPart194 ~= nil then self.flowPart194:destroy(); self.flowPart194 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit383 ~= nil then self.edit383:destroy(); self.edit383 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.label392 ~= nil then self.label392:destroy(); self.label392 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.rclListaDosIdiomas ~= nil then self.rclListaDosIdiomas:destroy(); self.rclListaDosIdiomas = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.flowPart238 ~= nil then self.flowPart238:destroy(); self.flowPart238 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink124 ~= nil then self.dataLink124:destroy(); self.dataLink124 = nil; end;
        if self.label421 ~= nil then self.label421:destroy(); self.label421 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.label451 ~= nil then self.label451:destroy(); self.label451 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.label388 ~= nil then self.label388:destroy(); self.label388 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.popManeuver ~= nil then self.popManeuver:destroy(); self.popManeuver = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.rclListaDosOutros ~= nil then self.rclListaDosOutros:destroy(); self.rclListaDosOutros = nil; end;
        if self.flowPart146 ~= nil then self.flowPart146:destroy(); self.flowPart146 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.rclListaDasMagias9 ~= nil then self.rclListaDasMagias9:destroy(); self.rclListaDasMagias9 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart171 ~= nil then self.flowPart171:destroy(); self.flowPart171 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.edit392 ~= nil then self.edit392:destroy(); self.edit392 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.label397 ~= nil then self.label397:destroy(); self.label397 = nil; end;
        if self.label406 ~= nil then self.label406:destroy(); self.label406 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.textEditor53 ~= nil then self.textEditor53:destroy(); self.textEditor53 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.AtrBut ~= nil then self.AtrBut:destroy(); self.AtrBut = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.textEditor28 ~= nil then self.textEditor28:destroy(); self.textEditor28 = nil; end;
        if self.label429 ~= nil then self.label429:destroy(); self.label429 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.flowPart251 ~= nil then self.flowPart251:destroy(); self.flowPart251 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.label423 ~= nil then self.label423:destroy(); self.label423 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.label419 ~= nil then self.label419:destroy(); self.label419 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.label329 ~= nil then self.label329:destroy(); self.label329 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
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
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label430 ~= nil then self.label430:destroy(); self.label430 = nil; end;
        if self.flowPart193 ~= nil then self.flowPart193:destroy(); self.flowPart193 = nil; end;
        if self.frmFichaRPGmeister4_svg ~= nil then self.frmFichaRPGmeister4_svg:destroy(); self.frmFichaRPGmeister4_svg = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.textEditor38 ~= nil then self.textEditor38:destroy(); self.textEditor38 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.flowPart243 ~= nil then self.flowPart243:destroy(); self.flowPart243 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.label367 ~= nil then self.label367:destroy(); self.label367 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.textEditor27 ~= nil then self.textEditor27:destroy(); self.textEditor27 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label417 ~= nil then self.label417:destroy(); self.label417 = nil; end;
        if self.dataLink102 ~= nil then self.dataLink102:destroy(); self.dataLink102 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.textEditor48 ~= nil then self.textEditor48:destroy(); self.textEditor48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label386 ~= nil then self.label386:destroy(); self.label386 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.label340 ~= nil then self.label340:destroy(); self.label340 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.flowPart219 ~= nil then self.flowPart219:destroy(); self.flowPart219 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
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
        if self.label381 ~= nil then self.label381:destroy(); self.label381 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.textEditor58 ~= nil then self.textEditor58:destroy(); self.textEditor58 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.label335 ~= nil then self.label335:destroy(); self.label335 = nil; end;
        if self.flowPart145 ~= nil then self.flowPart145:destroy(); self.flowPart145 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label382 ~= nil then self.label382:destroy(); self.label382 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.dataLink111 ~= nil then self.dataLink111:destroy(); self.dataLink111 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.flowPart246 ~= nil then self.flowPart246:destroy(); self.flowPart246 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.label403 ~= nil then self.label403:destroy(); self.label403 = nil; end;
        if self.flowPart215 ~= nil then self.flowPart215:destroy(); self.flowPart215 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
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
        if self.label440 ~= nil then self.label440:destroy(); self.label440 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.textEditor55 ~= nil then self.textEditor55:destroy(); self.textEditor55 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
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
        if self.label361 ~= nil then self.label361:destroy(); self.label361 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.textEditor47 ~= nil then self.textEditor47:destroy(); self.textEditor47 = nil; end;
        if self.dataLink120 ~= nil then self.dataLink120:destroy(); self.dataLink120 = nil; end;
        if self.dataLink113 ~= nil then self.dataLink113:destroy(); self.dataLink113 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.textEditor67 ~= nil then self.textEditor67:destroy(); self.textEditor67 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.flowPart205 ~= nil then self.flowPart205:destroy(); self.flowPart205 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.label330 ~= nil then self.label330:destroy(); self.label330 = nil; end;
        if self.label339 ~= nil then self.label339:destroy(); self.label339 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.label448 ~= nil then self.label448:destroy(); self.label448 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label333 ~= nil then self.label333:destroy(); self.label333 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.flowPart195 ~= nil then self.flowPart195:destroy(); self.flowPart195 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.flowPart188 ~= nil then self.flowPart188:destroy(); self.flowPart188 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.edit389 ~= nil then self.edit389:destroy(); self.edit389 = nil; end;
        if self.textEditor51 ~= nil then self.textEditor51:destroy(); self.textEditor51 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
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
        if self.rclListaDasMagias2 ~= nil then self.rclListaDasMagias2:destroy(); self.rclListaDasMagias2 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.dataLink133 ~= nil then self.dataLink133:destroy(); self.dataLink133 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.rclListaDasMagias3 ~= nil then self.rclListaDasMagias3:destroy(); self.rclListaDasMagias3 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.flowPart224 ~= nil then self.flowPart224:destroy(); self.flowPart224 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.boxDetalhesDoCompanheiro ~= nil then self.boxDetalhesDoCompanheiro:destroy(); self.boxDetalhesDoCompanheiro = nil; end;
        if self.textEditor32 ~= nil then self.textEditor32:destroy(); self.textEditor32 = nil; end;
        if self.popCA ~= nil then self.popCA:destroy(); self.popCA = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label458 ~= nil then self.label458:destroy(); self.label458 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.flowPart198 ~= nil then self.flowPart198:destroy(); self.flowPart198 = nil; end;
        if self.flowPart187 ~= nil then self.flowPart187:destroy(); self.flowPart187 = nil; end;
        if self.flowPart192 ~= nil then self.flowPart192:destroy(); self.flowPart192 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.dataLink117 ~= nil then self.dataLink117:destroy(); self.dataLink117 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.rectangle137 ~= nil then self.rectangle137:destroy(); self.rectangle137 = nil; end;
        if self.textEditor42 ~= nil then self.textEditor42:destroy(); self.textEditor42 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit382 ~= nil then self.edit382:destroy(); self.edit382 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.dataLink123 ~= nil then self.dataLink123:destroy(); self.dataLink123 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.label362 ~= nil then self.label362:destroy(); self.label362 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.textEditor49 ~= nil then self.textEditor49:destroy(); self.textEditor49 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.edit391 ~= nil then self.edit391:destroy(); self.edit391 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
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
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowPart254 ~= nil then self.flowPart254:destroy(); self.flowPart254 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.dataLink135 ~= nil then self.dataLink135:destroy(); self.dataLink135 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.dataLink116 ~= nil then self.dataLink116:destroy(); self.dataLink116 = nil; end;
        if self.frmFichaRPGmeister5M_svg ~= nil then self.frmFichaRPGmeister5M_svg:destroy(); self.frmFichaRPGmeister5M_svg = nil; end;
        if self.flowPart250 ~= nil then self.flowPart250:destroy(); self.flowPart250 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.label318 ~= nil then self.label318:destroy(); self.label318 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.textEditor34 ~= nil then self.textEditor34:destroy(); self.textEditor34 = nil; end;
        if self.flowPart191 ~= nil then self.flowPart191:destroy(); self.flowPart191 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.flowPart242 ~= nil then self.flowPart242:destroy(); self.flowPart242 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.flowPart218 ~= nil then self.flowPart218:destroy(); self.flowPart218 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label374 ~= nil then self.label374:destroy(); self.label374 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit384 ~= nil then self.edit384:destroy(); self.edit384 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.dataLink136 ~= nil then self.dataLink136:destroy(); self.dataLink136 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.dataLink105 ~= nil then self.dataLink105:destroy(); self.dataLink105 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label464 ~= nil then self.label464:destroy(); self.label464 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.label384 ~= nil then self.label384:destroy(); self.label384 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.label300 ~= nil then self.label300:destroy(); self.label300 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.flowPart156 ~= nil then self.flowPart156:destroy(); self.flowPart156 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.flowPart148 ~= nil then self.flowPart148:destroy(); self.flowPart148 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.popAtributo ~= nil then self.popAtributo:destroy(); self.popAtributo = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label410 ~= nil then self.label410:destroy(); self.label410 = nil; end;
        if self.label308 ~= nil then self.label308:destroy(); self.label308 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.label450 ~= nil then self.label450:destroy(); self.label450 = nil; end;
        if self.flowPart177 ~= nil then self.flowPart177:destroy(); self.flowPart177 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.flowPart211 ~= nil then self.flowPart211:destroy(); self.flowPart211 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.rclListaDasArmas ~= nil then self.rclListaDasArmas:destroy(); self.rclListaDasArmas = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.label447 ~= nil then self.label447:destroy(); self.label447 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.flowPart217 ~= nil then self.flowPart217:destroy(); self.flowPart217 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit399 ~= nil then self.edit399:destroy(); self.edit399 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.label404 ~= nil then self.label404:destroy(); self.label404 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.popIdioma ~= nil then self.popIdioma:destroy(); self.popIdioma = nil; end;
        if self.textEditor57 ~= nil then self.textEditor57:destroy(); self.textEditor57 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.flowPart200 ~= nil then self.flowPart200:destroy(); self.flowPart200 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rclListaDasMagias6 ~= nil then self.rclListaDasMagias6:destroy(); self.rclListaDasMagias6 = nil; end;
        if self.edit394 ~= nil then self.edit394:destroy(); self.edit394 = nil; end;
        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.label422 ~= nil then self.label422:destroy(); self.label422 = nil; end;
        if self.rclListaDasMagias1 ~= nil then self.rclListaDasMagias1:destroy(); self.rclListaDasMagias1 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.label466 ~= nil then self.label466:destroy(); self.label466 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.flowPart247 ~= nil then self.flowPart247:destroy(); self.flowPart247 = nil; end;
        if self.label350 ~= nil then self.label350:destroy(); self.label350 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label456 ~= nil then self.label456:destroy(); self.label456 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.flowPart157 ~= nil then self.flowPart157:destroy(); self.flowPart157 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label351 ~= nil then self.label351:destroy(); self.label351 = nil; end;
        if self.edit386 ~= nil then self.edit386:destroy(); self.edit386 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart203 ~= nil then self.flowPart203:destroy(); self.flowPart203 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.flowPart233 ~= nil then self.flowPart233:destroy(); self.flowPart233 = nil; end;
        if self.flowPart161 ~= nil then self.flowPart161:destroy(); self.flowPart161 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label319 ~= nil then self.label319:destroy(); self.label319 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
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
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
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
        if self.label366 ~= nil then self.label366:destroy(); self.label366 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.label433 ~= nil then self.label433:destroy(); self.label433 = nil; end;
        if self.edit401 ~= nil then self.edit401:destroy(); self.edit401 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.label435 ~= nil then self.label435:destroy(); self.label435 = nil; end;
        if self.label409 ~= nil then self.label409:destroy(); self.label409 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label376 ~= nil then self.label376:destroy(); self.label376 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.textEditor56 ~= nil then self.textEditor56:destroy(); self.textEditor56 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.label377 ~= nil then self.label377:destroy(); self.label377 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
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
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.dataLink121 ~= nil then self.dataLink121:destroy(); self.dataLink121 = nil; end;
        if self.flowPart235 ~= nil then self.flowPart235:destroy(); self.flowPart235 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label411 ~= nil then self.label411:destroy(); self.label411 = nil; end;
        if self.textEditor30 ~= nil then self.textEditor30:destroy(); self.textEditor30 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label389 ~= nil then self.label389:destroy(); self.label389 = nil; end;
        if self.dataLink119 ~= nil then self.dataLink119:destroy(); self.dataLink119 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.flowPart127 ~= nil then self.flowPart127:destroy(); self.flowPart127 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.flowPart147 ~= nil then self.flowPart147:destroy(); self.flowPart147 = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.flowPart158 ~= nil then self.flowPart158:destroy(); self.flowPart158 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.label402 ~= nil then self.label402:destroy(); self.label402 = nil; end;
        if self.flowPart162 ~= nil then self.flowPart162:destroy(); self.flowPart162 = nil; end;
        if self.flowPart176 ~= nil then self.flowPart176:destroy(); self.flowPart176 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.flowPart208 ~= nil then self.flowPart208:destroy(); self.flowPart208 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.dataLink137 ~= nil then self.dataLink137:destroy(); self.dataLink137 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.textEditor68 ~= nil then self.textEditor68:destroy(); self.textEditor68 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label436 ~= nil then self.label436:destroy(); self.label436 = nil; end;
        if self.label449 ~= nil then self.label449:destroy(); self.label449 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.flowPart163 ~= nil then self.flowPart163:destroy(); self.flowPart163 = nil; end;
        if self.flowPart226 ~= nil then self.flowPart226:destroy(); self.flowPart226 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.label312 ~= nil then self.label312:destroy(); self.label312 = nil; end;
        if self.label310 ~= nil then self.label310:destroy(); self.label310 = nil; end;
        if self.textEditor50 ~= nil then self.textEditor50:destroy(); self.textEditor50 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.textEditor65 ~= nil then self.textEditor65:destroy(); self.textEditor65 = nil; end;
        if self.dataLink110 ~= nil then self.dataLink110:destroy(); self.dataLink110 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.dataLink126 ~= nil then self.dataLink126:destroy(); self.dataLink126 = nil; end;
        if self.label461 ~= nil then self.label461:destroy(); self.label461 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.flowPart173 ~= nil then self.flowPart173:destroy(); self.flowPart173 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label415 ~= nil then self.label415:destroy(); self.label415 = nil; end;
        if self.label394 ~= nil then self.label394:destroy(); self.label394 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.flowPart154 ~= nil then self.flowPart154:destroy(); self.flowPart154 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.label343 ~= nil then self.label343:destroy(); self.label343 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.flowPart227 ~= nil then self.flowPart227:destroy(); self.flowPart227 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink122 ~= nil then self.dataLink122:destroy(); self.dataLink122 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.label352 ~= nil then self.label352:destroy(); self.label352 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.dataLink115 ~= nil then self.dataLink115:destroy(); self.dataLink115 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flowPart160 ~= nil then self.flowPart160:destroy(); self.flowPart160 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.popGrapple ~= nil then self.popGrapple:destroy(); self.popGrapple = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.label426 ~= nil then self.label426:destroy(); self.label426 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.dataLink104 ~= nil then self.dataLink104:destroy(); self.dataLink104 = nil; end;
        if self.layoutMagiasEpicas ~= nil then self.layoutMagiasEpicas:destroy(); self.layoutMagiasEpicas = nil; end;
        if self.label387 ~= nil then self.label387:destroy(); self.label387 = nil; end;
        if self.textEditor29 ~= nil then self.textEditor29:destroy(); self.textEditor29 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.label349 ~= nil then self.label349:destroy(); self.label349 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.label370 ~= nil then self.label370:destroy(); self.label370 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label460 ~= nil then self.label460:destroy(); self.label460 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.textEditor31 ~= nil then self.textEditor31:destroy(); self.textEditor31 = nil; end;
        if self.alvo3 ~= nil then self.alvo3:destroy(); self.alvo3 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.textEditor39 ~= nil then self.textEditor39:destroy(); self.textEditor39 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.label395 ~= nil then self.label395:destroy(); self.label395 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.label337 ~= nil then self.label337:destroy(); self.label337 = nil; end;
        if self.label416 ~= nil then self.label416:destroy(); self.label416 = nil; end;
        if self.label453 ~= nil then self.label453:destroy(); self.label453 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.textEditor64 ~= nil then self.textEditor64:destroy(); self.textEditor64 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.rclListaDasPericias ~= nil then self.rclListaDasPericias:destroy(); self.rclListaDasPericias = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label354 ~= nil then self.label354:destroy(); self.label354 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.rclListaDasMagias7 ~= nil then self.rclListaDasMagias7:destroy(); self.rclListaDasMagias7 = nil; end;
        if self.dataLink106 ~= nil then self.dataLink106:destroy(); self.dataLink106 = nil; end;
        if self.flowPart175 ~= nil then self.flowPart175:destroy(); self.flowPart175 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.textEditor37 ~= nil then self.textEditor37:destroy(); self.textEditor37 = nil; end;
        if self.label405 ~= nil then self.label405:destroy(); self.label405 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.label463 ~= nil then self.label463:destroy(); self.label463 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.label320 ~= nil then self.label320:destroy(); self.label320 = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.flowPart229 ~= nil then self.flowPart229:destroy(); self.flowPart229 = nil; end;
        if self.flowPart168 ~= nil then self.flowPart168:destroy(); self.flowPart168 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.flowPart159 ~= nil then self.flowPart159:destroy(); self.flowPart159 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.rectangle139 ~= nil then self.rectangle139:destroy(); self.rectangle139 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.label443 ~= nil then self.label443:destroy(); self.label443 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.flowPart185 ~= nil then self.flowPart185:destroy(); self.flowPart185 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.flowPart196 ~= nil then self.flowPart196:destroy(); self.flowPart196 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.label373 ~= nil then self.label373:destroy(); self.label373 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.label431 ~= nil then self.label431:destroy(); self.label431 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.dataLink109 ~= nil then self.dataLink109:destroy(); self.dataLink109 = nil; end;
        if self.label363 ~= nil then self.label363:destroy(); self.label363 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.flowPart213 ~= nil then self.flowPart213:destroy(); self.flowPart213 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label296 ~= nil then self.label296:destroy(); self.label296 = nil; end;
        if self.flowPart206 ~= nil then self.flowPart206:destroy(); self.flowPart206 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.label368 ~= nil then self.label368:destroy(); self.label368 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaAnima = {
    newEditor = newfrmFichaAnima, 
    new = newfrmFichaAnima, 
    name = "frmFichaAnima", 
    dataType = "Ambesek.Anima", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Anima", 
    description=""};

frmFichaAnima = _frmFichaAnima;
rrpg.registrarForm(_frmFichaAnima);
rrpg.registrarDataType(_frmFichaAnima);

return _frmFichaAnima;
