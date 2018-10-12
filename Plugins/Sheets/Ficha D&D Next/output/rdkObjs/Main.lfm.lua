require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaDnDNext()
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
    obj:setName("frmFichaDnDNext");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.FichaDnDNext");
    obj:setTitle("Ficha D&D Next");
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
    obj.flowLayout1:setVertAlign("leading");

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(50);
    obj.flowPart1:setHeight(15);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

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
    obj.label1:setFontColor("#D0D0D0");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(50);
    obj.flowPart2:setMaxWidth(50);
    obj.flowPart2:setHeight(15);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart2:setVertAlign("leading");

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
    obj.label2:setFontColor("#D0D0D0");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(50);
    obj.flowPart3:setMaxWidth(50);
    obj.flowPart3:setHeight(15);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

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
    obj.label3:setFontColor("#D0D0D0");

    obj.flowPart4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(50);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(15);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart4:setVertAlign("leading");

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
    obj.label4:setFontColor("#D0D0D0");

    obj.flowPart5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(50);
    obj.flowPart5:setMaxWidth(50);
    obj.flowPart5:setHeight(15);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart5:setVertAlign("leading");

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
    obj.label5:setFontColor("#D0D0D0");

    obj.flowPart6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(50);
    obj.flowPart6:setMaxWidth(50);
    obj.flowPart6:setHeight(15);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart6:setVertAlign("leading");

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
    obj.label6:setFontColor("#D0D0D0");

    obj.flowPart7 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(20);
    obj.flowPart7:setMaxWidth(20);
    obj.flowPart7:setHeight(15);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart7:setVertAlign("leading");

    obj.flowPart8 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(50);
    obj.flowPart8:setMaxWidth(75);
    obj.flowPart8:setHeight(15);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart8:setVertAlign("leading");

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
    obj.flowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart9:setVertAlign("leading");

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
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

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
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

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
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart12:setVertAlign("leading");

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
    obj.flowPart13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart13:setVertAlign("leading");

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
    obj.flowLayout2:setVertAlign("leading");

    obj.flowPart14 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setMinWidth(50);
    obj.flowPart14:setMaxWidth(50);
    obj.flowPart14:setHeight(20);
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart14:setVertAlign("leading");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart14);
    obj.edit1:setAlign("client");
    obj.edit1:setField("inicialFor");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("white");

    obj.flowPart15 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(50);
    obj.flowPart15:setMaxWidth(50);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart15:setVertAlign("leading");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart15);
    obj.edit2:setAlign("client");
    obj.edit2:setField("racaFor");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(12);
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("white");

    obj.flowPart16 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(50);
    obj.flowPart16:setMaxWidth(50);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart16:setVertAlign("leading");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart16);
    obj.edit3:setAlign("client");
    obj.edit3:setField("nepFor");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("white");

    obj.flowPart17 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(50);
    obj.flowPart17:setMaxWidth(50);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart17:setVertAlign("leading");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart17);
    obj.edit4:setAlign("client");
    obj.edit4:setField("inerenteFor");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(12);
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("white");

    obj.flowPart18 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setMinWidth(50);
    obj.flowPart18:setMaxWidth(50);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart18:setVertAlign("leading");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart18);
    obj.edit5:setAlign("client");
    obj.edit5:setField("tamanhoFor");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(12);
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("white");

    obj.flowPart19 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setMinWidth(50);
    obj.flowPart19:setMaxWidth(50);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart19:setVertAlign("leading");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart19);
    obj.edit6:setAlign("client");
    obj.edit6:setField("outrosFor");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(12);
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("white");

    obj.flowPart20 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setMinWidth(20);
    obj.flowPart20:setMaxWidth(20);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart20:setVertAlign("leading");

    obj.flowPart21 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setMinWidth(50);
    obj.flowPart21:setMaxWidth(75);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart21:setVertAlign("leading");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart21);
    obj.edit7:setAlign("client");
    obj.edit7:setField("melhoriaFor");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(12);
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("white");

    obj.flowPart22 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setMinWidth(50);
    obj.flowPart22:setMaxWidth(75);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart22:setVertAlign("leading");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart22);
    obj.edit8:setAlign("client");
    obj.edit8:setField("danoTempFor");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(12);
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("white");

    obj.flowPart23 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout2);
    obj.flowPart23:setMinWidth(50);
    obj.flowPart23:setMaxWidth(75);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart23:setVertAlign("leading");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart23);
    obj.edit9:setAlign("client");
    obj.edit9:setField("danoPermFor");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(12);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("white");

    obj.flowPart24 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout2);
    obj.flowPart24:setMinWidth(50);
    obj.flowPart24:setMaxWidth(75);
    obj.flowPart24:setHeight(20);
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart24:setVertAlign("leading");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart24);
    obj.edit10:setAlign("client");
    obj.edit10:setField("temporarioFor");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(12);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("white");

    obj.flowPart25 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout2);
    obj.flowPart25:setMinWidth(50);
    obj.flowPart25:setMaxWidth(75);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart25:setVertAlign("leading");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart25);
    obj.edit11:setAlign("client");
    obj.edit11:setField("magiaFor");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(12);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("white");

    obj.flowPart26 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout2);
    obj.flowPart26:setMinWidth(50);
    obj.flowPart26:setMaxWidth(75);
    obj.flowPart26:setHeight(20);
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart26:setVertAlign("leading");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart26);
    obj.edit12:setAlign("client");
    obj.edit12:setField("classeFor");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(12);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("white");

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
    obj.flowLayout3:setVertAlign("leading");

    obj.flowPart27 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout3);
    obj.flowPart27:setMinWidth(50);
    obj.flowPart27:setMaxWidth(50);
    obj.flowPart27:setHeight(20);
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart27:setVertAlign("leading");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart27);
    obj.edit13:setAlign("client");
    obj.edit13:setField("inicialDes");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(12);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("white");

    obj.flowPart28 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout3);
    obj.flowPart28:setMinWidth(50);
    obj.flowPart28:setMaxWidth(50);
    obj.flowPart28:setHeight(20);
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart28:setVertAlign("leading");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart28);
    obj.edit14:setAlign("client");
    obj.edit14:setField("racaDes");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(12);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("white");

    obj.flowPart29 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout3);
    obj.flowPart29:setMinWidth(50);
    obj.flowPart29:setMaxWidth(50);
    obj.flowPart29:setHeight(20);
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart29:setVertAlign("leading");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart29);
    obj.edit15:setAlign("client");
    obj.edit15:setField("nepDes");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(12);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("white");

    obj.flowPart30 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout3);
    obj.flowPart30:setMinWidth(50);
    obj.flowPart30:setMaxWidth(50);
    obj.flowPart30:setHeight(20);
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart30:setVertAlign("leading");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart30);
    obj.edit16:setAlign("client");
    obj.edit16:setField("inerenteDes");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(12);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("white");

    obj.flowPart31 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout3);
    obj.flowPart31:setMinWidth(50);
    obj.flowPart31:setMaxWidth(50);
    obj.flowPart31:setHeight(20);
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart31:setVertAlign("leading");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart31);
    obj.edit17:setAlign("client");
    obj.edit17:setField("tamanhoDes");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(12);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("white");

    obj.flowPart32 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout3);
    obj.flowPart32:setMinWidth(50);
    obj.flowPart32:setMaxWidth(50);
    obj.flowPart32:setHeight(20);
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart32:setVertAlign("leading");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart32);
    obj.edit18:setAlign("client");
    obj.edit18:setField("outrosDes");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(12);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("white");

    obj.flowPart33 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout3);
    obj.flowPart33:setMinWidth(20);
    obj.flowPart33:setMaxWidth(20);
    obj.flowPart33:setHeight(20);
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart33:setVertAlign("leading");

    obj.flowPart34 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout3);
    obj.flowPart34:setMinWidth(50);
    obj.flowPart34:setMaxWidth(75);
    obj.flowPart34:setHeight(20);
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart34:setVertAlign("leading");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart34);
    obj.edit19:setAlign("client");
    obj.edit19:setField("melhoriaDes");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(12);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("white");

    obj.flowPart35 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout3);
    obj.flowPart35:setMinWidth(50);
    obj.flowPart35:setMaxWidth(75);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart35:setVertAlign("leading");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart35);
    obj.edit20:setAlign("client");
    obj.edit20:setField("danoTempDes");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(12);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");
    obj.edit20:setFontColor("white");

    obj.flowPart36 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout3);
    obj.flowPart36:setMinWidth(50);
    obj.flowPart36:setMaxWidth(75);
    obj.flowPart36:setHeight(20);
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart36:setVertAlign("leading");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart36);
    obj.edit21:setAlign("client");
    obj.edit21:setField("danoPermDes");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(12);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("white");

    obj.flowPart37 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout3);
    obj.flowPart37:setMinWidth(50);
    obj.flowPart37:setMaxWidth(75);
    obj.flowPart37:setHeight(20);
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart37:setVertAlign("leading");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart37);
    obj.edit22:setAlign("client");
    obj.edit22:setField("temporarioDes");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(12);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("white");

    obj.flowPart38 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout3);
    obj.flowPart38:setMinWidth(50);
    obj.flowPart38:setMaxWidth(75);
    obj.flowPart38:setHeight(20);
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart38:setVertAlign("leading");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart38);
    obj.edit23:setAlign("client");
    obj.edit23:setField("magiaDes");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(12);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("white");

    obj.flowPart39 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout3);
    obj.flowPart39:setMinWidth(50);
    obj.flowPart39:setMaxWidth(75);
    obj.flowPart39:setHeight(20);
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart39:setVertAlign("leading");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart39);
    obj.edit24:setAlign("client");
    obj.edit24:setField("classeDes");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(12);
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("white");

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
    obj.flowLayout4:setVertAlign("leading");

    obj.flowPart40 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout4);
    obj.flowPart40:setMinWidth(50);
    obj.flowPart40:setMaxWidth(50);
    obj.flowPart40:setHeight(20);
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart40:setVertAlign("leading");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart40);
    obj.edit25:setAlign("client");
    obj.edit25:setField("inicialCon");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(12);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("white");

    obj.flowPart41 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout4);
    obj.flowPart41:setMinWidth(50);
    obj.flowPart41:setMaxWidth(50);
    obj.flowPart41:setHeight(20);
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart41:setVertAlign("leading");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart41);
    obj.edit26:setAlign("client");
    obj.edit26:setField("racaCon");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(12);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("white");

    obj.flowPart42 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout4);
    obj.flowPart42:setMinWidth(50);
    obj.flowPart42:setMaxWidth(50);
    obj.flowPart42:setHeight(20);
    obj.flowPart42:setName("flowPart42");
    obj.flowPart42:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart42:setVertAlign("leading");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart42);
    obj.edit27:setAlign("client");
    obj.edit27:setField("nepCon");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(12);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("white");

    obj.flowPart43 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout4);
    obj.flowPart43:setMinWidth(50);
    obj.flowPart43:setMaxWidth(50);
    obj.flowPart43:setHeight(20);
    obj.flowPart43:setName("flowPart43");
    obj.flowPart43:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart43:setVertAlign("leading");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart43);
    obj.edit28:setAlign("client");
    obj.edit28:setField("inerenteCon");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(12);
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("white");

    obj.flowPart44 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout4);
    obj.flowPart44:setMinWidth(50);
    obj.flowPart44:setMaxWidth(50);
    obj.flowPart44:setHeight(20);
    obj.flowPart44:setName("flowPart44");
    obj.flowPart44:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart44:setVertAlign("leading");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart44);
    obj.edit29:setAlign("client");
    obj.edit29:setField("tamanhoCon");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(12);
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("white");

    obj.flowPart45 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout4);
    obj.flowPart45:setMinWidth(50);
    obj.flowPart45:setMaxWidth(50);
    obj.flowPart45:setHeight(20);
    obj.flowPart45:setName("flowPart45");
    obj.flowPart45:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart45:setVertAlign("leading");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart45);
    obj.edit30:setAlign("client");
    obj.edit30:setField("outrosCon");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setFontSize(12);
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("white");

    obj.flowPart46 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout4);
    obj.flowPart46:setMinWidth(20);
    obj.flowPart46:setMaxWidth(20);
    obj.flowPart46:setHeight(20);
    obj.flowPart46:setName("flowPart46");
    obj.flowPart46:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart46:setVertAlign("leading");

    obj.flowPart47 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout4);
    obj.flowPart47:setMinWidth(50);
    obj.flowPart47:setMaxWidth(75);
    obj.flowPart47:setHeight(20);
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart47:setVertAlign("leading");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart47);
    obj.edit31:setAlign("client");
    obj.edit31:setField("melhoriaCon");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(12);
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("white");

    obj.flowPart48 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout4);
    obj.flowPart48:setMinWidth(50);
    obj.flowPart48:setMaxWidth(75);
    obj.flowPart48:setHeight(20);
    obj.flowPart48:setName("flowPart48");
    obj.flowPart48:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart48:setVertAlign("leading");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart48);
    obj.edit32:setAlign("client");
    obj.edit32:setField("danoTempCon");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(12);
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("white");

    obj.flowPart49 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout4);
    obj.flowPart49:setMinWidth(50);
    obj.flowPart49:setMaxWidth(75);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setName("flowPart49");
    obj.flowPart49:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart49:setVertAlign("leading");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart49);
    obj.edit33:setAlign("client");
    obj.edit33:setField("danoPermCon");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(12);
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("white");

    obj.flowPart50 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout4);
    obj.flowPart50:setMinWidth(50);
    obj.flowPart50:setMaxWidth(75);
    obj.flowPart50:setHeight(20);
    obj.flowPart50:setName("flowPart50");
    obj.flowPart50:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart50:setVertAlign("leading");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart50);
    obj.edit34:setAlign("client");
    obj.edit34:setField("temporarioCon");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(12);
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("white");

    obj.flowPart51 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout4);
    obj.flowPart51:setMinWidth(50);
    obj.flowPart51:setMaxWidth(75);
    obj.flowPart51:setHeight(20);
    obj.flowPart51:setName("flowPart51");
    obj.flowPart51:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart51:setVertAlign("leading");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart51);
    obj.edit35:setAlign("client");
    obj.edit35:setField("magiaCon");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setFontSize(12);
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("white");

    obj.flowPart52 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout4);
    obj.flowPart52:setMinWidth(50);
    obj.flowPart52:setMaxWidth(75);
    obj.flowPart52:setHeight(20);
    obj.flowPart52:setName("flowPart52");
    obj.flowPart52:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart52:setVertAlign("leading");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart52);
    obj.edit36:setAlign("client");
    obj.edit36:setField("classeCon");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontSize(12);
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");
    obj.edit36:setFontColor("white");

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
    obj.flowLayout5:setVertAlign("leading");

    obj.flowPart53 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout5);
    obj.flowPart53:setMinWidth(50);
    obj.flowPart53:setMaxWidth(50);
    obj.flowPart53:setHeight(20);
    obj.flowPart53:setName("flowPart53");
    obj.flowPart53:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart53:setVertAlign("leading");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart53);
    obj.edit37:setAlign("client");
    obj.edit37:setField("inicialInt");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(12);
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("white");

    obj.flowPart54 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout5);
    obj.flowPart54:setMinWidth(50);
    obj.flowPart54:setMaxWidth(50);
    obj.flowPart54:setHeight(20);
    obj.flowPart54:setName("flowPart54");
    obj.flowPart54:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart54:setVertAlign("leading");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart54);
    obj.edit38:setAlign("client");
    obj.edit38:setField("racaInt");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setFontSize(12);
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");
    obj.edit38:setFontColor("white");

    obj.flowPart55 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout5);
    obj.flowPart55:setMinWidth(50);
    obj.flowPart55:setMaxWidth(50);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setName("flowPart55");
    obj.flowPart55:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart55:setVertAlign("leading");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart55);
    obj.edit39:setAlign("client");
    obj.edit39:setField("nepInt");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setFontSize(12);
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");
    obj.edit39:setFontColor("white");

    obj.flowPart56 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout5);
    obj.flowPart56:setMinWidth(50);
    obj.flowPart56:setMaxWidth(50);
    obj.flowPart56:setHeight(20);
    obj.flowPart56:setName("flowPart56");
    obj.flowPart56:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart56:setVertAlign("leading");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart56);
    obj.edit40:setAlign("client");
    obj.edit40:setField("inerenteInt");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontSize(12);
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");
    obj.edit40:setFontColor("white");

    obj.flowPart57 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout5);
    obj.flowPart57:setMinWidth(50);
    obj.flowPart57:setMaxWidth(50);
    obj.flowPart57:setHeight(20);
    obj.flowPart57:setName("flowPart57");
    obj.flowPart57:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart57:setVertAlign("leading");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart57);
    obj.edit41:setAlign("client");
    obj.edit41:setField("tamanhoInt");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setFontSize(12);
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");
    obj.edit41:setFontColor("white");

    obj.flowPart58 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout5);
    obj.flowPart58:setMinWidth(50);
    obj.flowPart58:setMaxWidth(50);
    obj.flowPart58:setHeight(20);
    obj.flowPart58:setName("flowPart58");
    obj.flowPart58:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart58:setVertAlign("leading");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart58);
    obj.edit42:setAlign("client");
    obj.edit42:setField("outrosInt");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setFontSize(12);
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");
    obj.edit42:setFontColor("white");

    obj.flowPart59 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout5);
    obj.flowPart59:setMinWidth(20);
    obj.flowPart59:setMaxWidth(20);
    obj.flowPart59:setHeight(20);
    obj.flowPart59:setName("flowPart59");
    obj.flowPart59:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart59:setVertAlign("leading");

    obj.flowPart60 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout5);
    obj.flowPart60:setMinWidth(50);
    obj.flowPart60:setMaxWidth(75);
    obj.flowPart60:setHeight(20);
    obj.flowPart60:setName("flowPart60");
    obj.flowPart60:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart60:setVertAlign("leading");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart60);
    obj.edit43:setAlign("client");
    obj.edit43:setField("melhoriaInt");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(12);
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");
    obj.edit43:setFontColor("white");

    obj.flowPart61 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout5);
    obj.flowPart61:setMinWidth(50);
    obj.flowPart61:setMaxWidth(75);
    obj.flowPart61:setHeight(20);
    obj.flowPart61:setName("flowPart61");
    obj.flowPart61:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart61:setVertAlign("leading");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart61);
    obj.edit44:setAlign("client");
    obj.edit44:setField("danoTempInt");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(12);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");
    obj.edit44:setFontColor("white");

    obj.flowPart62 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout5);
    obj.flowPart62:setMinWidth(50);
    obj.flowPart62:setMaxWidth(75);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setName("flowPart62");
    obj.flowPart62:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart62:setVertAlign("leading");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart62);
    obj.edit45:setAlign("client");
    obj.edit45:setField("danoPermInt");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontSize(12);
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");
    obj.edit45:setFontColor("white");

    obj.flowPart63 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout5);
    obj.flowPart63:setMinWidth(50);
    obj.flowPart63:setMaxWidth(75);
    obj.flowPart63:setHeight(20);
    obj.flowPart63:setName("flowPart63");
    obj.flowPart63:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart63:setVertAlign("leading");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart63);
    obj.edit46:setAlign("client");
    obj.edit46:setField("temporarioInt");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(12);
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");
    obj.edit46:setFontColor("white");

    obj.flowPart64 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout5);
    obj.flowPart64:setMinWidth(50);
    obj.flowPart64:setMaxWidth(75);
    obj.flowPart64:setHeight(20);
    obj.flowPart64:setName("flowPart64");
    obj.flowPart64:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart64:setVertAlign("leading");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart64);
    obj.edit47:setAlign("client");
    obj.edit47:setField("magiaInt");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontSize(12);
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");
    obj.edit47:setFontColor("white");

    obj.flowPart65 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout5);
    obj.flowPart65:setMinWidth(50);
    obj.flowPart65:setMaxWidth(75);
    obj.flowPart65:setHeight(20);
    obj.flowPart65:setName("flowPart65");
    obj.flowPart65:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart65:setVertAlign("leading");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart65);
    obj.edit48:setAlign("client");
    obj.edit48:setField("classeInt");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontSize(12);
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");
    obj.edit48:setFontColor("white");

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
    obj.flowLayout6:setVertAlign("leading");

    obj.flowPart66 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout6);
    obj.flowPart66:setMinWidth(50);
    obj.flowPart66:setMaxWidth(50);
    obj.flowPart66:setHeight(20);
    obj.flowPart66:setName("flowPart66");
    obj.flowPart66:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart66:setVertAlign("leading");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart66);
    obj.edit49:setAlign("client");
    obj.edit49:setField("inicialSab");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontSize(12);
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");
    obj.edit49:setFontColor("white");

    obj.flowPart67 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout6);
    obj.flowPart67:setMinWidth(50);
    obj.flowPart67:setMaxWidth(50);
    obj.flowPart67:setHeight(20);
    obj.flowPart67:setName("flowPart67");
    obj.flowPart67:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart67:setVertAlign("leading");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart67);
    obj.edit50:setAlign("client");
    obj.edit50:setField("racaSab");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontSize(12);
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");
    obj.edit50:setFontColor("white");

    obj.flowPart68 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout6);
    obj.flowPart68:setMinWidth(50);
    obj.flowPart68:setMaxWidth(50);
    obj.flowPart68:setHeight(20);
    obj.flowPart68:setName("flowPart68");
    obj.flowPart68:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart68:setVertAlign("leading");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart68);
    obj.edit51:setAlign("client");
    obj.edit51:setField("nepSab");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setFontSize(12);
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");
    obj.edit51:setFontColor("white");

    obj.flowPart69 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout6);
    obj.flowPart69:setMinWidth(50);
    obj.flowPart69:setMaxWidth(50);
    obj.flowPart69:setHeight(20);
    obj.flowPart69:setName("flowPart69");
    obj.flowPart69:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart69:setVertAlign("leading");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart69);
    obj.edit52:setAlign("client");
    obj.edit52:setField("inerenteSab");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontSize(12);
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");
    obj.edit52:setFontColor("white");

    obj.flowPart70 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout6);
    obj.flowPart70:setMinWidth(50);
    obj.flowPart70:setMaxWidth(50);
    obj.flowPart70:setHeight(20);
    obj.flowPart70:setName("flowPart70");
    obj.flowPart70:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart70:setVertAlign("leading");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart70);
    obj.edit53:setAlign("client");
    obj.edit53:setField("tamanhoSab");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setFontSize(12);
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");
    obj.edit53:setFontColor("white");

    obj.flowPart71 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout6);
    obj.flowPart71:setMinWidth(50);
    obj.flowPart71:setMaxWidth(50);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setName("flowPart71");
    obj.flowPart71:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart71:setVertAlign("leading");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart71);
    obj.edit54:setAlign("client");
    obj.edit54:setField("outrosSab");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontSize(12);
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");
    obj.edit54:setFontColor("white");

    obj.flowPart72 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout6);
    obj.flowPart72:setMinWidth(20);
    obj.flowPart72:setMaxWidth(20);
    obj.flowPart72:setHeight(20);
    obj.flowPart72:setName("flowPart72");
    obj.flowPart72:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart72:setVertAlign("leading");

    obj.flowPart73 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout6);
    obj.flowPart73:setMinWidth(50);
    obj.flowPart73:setMaxWidth(75);
    obj.flowPart73:setHeight(20);
    obj.flowPart73:setName("flowPart73");
    obj.flowPart73:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart73:setVertAlign("leading");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart73);
    obj.edit55:setAlign("client");
    obj.edit55:setField("melhoriaSab");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setFontSize(12);
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");
    obj.edit55:setFontColor("white");

    obj.flowPart74 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout6);
    obj.flowPart74:setMinWidth(50);
    obj.flowPart74:setMaxWidth(75);
    obj.flowPart74:setHeight(20);
    obj.flowPart74:setName("flowPart74");
    obj.flowPart74:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart74:setVertAlign("leading");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart74);
    obj.edit56:setAlign("client");
    obj.edit56:setField("danoTempSab");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setFontSize(12);
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");
    obj.edit56:setFontColor("white");

    obj.flowPart75 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout6);
    obj.flowPart75:setMinWidth(50);
    obj.flowPart75:setMaxWidth(75);
    obj.flowPart75:setHeight(20);
    obj.flowPart75:setName("flowPart75");
    obj.flowPart75:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart75:setVertAlign("leading");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart75);
    obj.edit57:setAlign("client");
    obj.edit57:setField("danoPermSab");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setFontSize(12);
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");
    obj.edit57:setFontColor("white");

    obj.flowPart76 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout6);
    obj.flowPart76:setMinWidth(50);
    obj.flowPart76:setMaxWidth(75);
    obj.flowPart76:setHeight(20);
    obj.flowPart76:setName("flowPart76");
    obj.flowPart76:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart76:setVertAlign("leading");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart76);
    obj.edit58:setAlign("client");
    obj.edit58:setField("temporarioSab");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(12);
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");
    obj.edit58:setFontColor("white");

    obj.flowPart77 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout6);
    obj.flowPart77:setMinWidth(50);
    obj.flowPart77:setMaxWidth(75);
    obj.flowPart77:setHeight(20);
    obj.flowPart77:setName("flowPart77");
    obj.flowPart77:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart77:setVertAlign("leading");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart77);
    obj.edit59:setAlign("client");
    obj.edit59:setField("magiaSab");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setFontSize(12);
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");
    obj.edit59:setFontColor("white");

    obj.flowPart78 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout6);
    obj.flowPart78:setMinWidth(50);
    obj.flowPart78:setMaxWidth(75);
    obj.flowPart78:setHeight(20);
    obj.flowPart78:setName("flowPart78");
    obj.flowPart78:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart78:setVertAlign("leading");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart78);
    obj.edit60:setAlign("client");
    obj.edit60:setField("classeSab");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(12);
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");
    obj.edit60:setFontColor("white");

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
    obj.flowLayout7:setVertAlign("leading");

    obj.flowPart79 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout7);
    obj.flowPart79:setMinWidth(50);
    obj.flowPart79:setMaxWidth(50);
    obj.flowPart79:setHeight(20);
    obj.flowPart79:setName("flowPart79");
    obj.flowPart79:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart79:setVertAlign("leading");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart79);
    obj.edit61:setAlign("client");
    obj.edit61:setField("inicialCar");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontSize(12);
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");
    obj.edit61:setFontColor("white");

    obj.flowPart80 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout7);
    obj.flowPart80:setMinWidth(50);
    obj.flowPart80:setMaxWidth(50);
    obj.flowPart80:setHeight(20);
    obj.flowPart80:setName("flowPart80");
    obj.flowPart80:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart80:setVertAlign("leading");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart80);
    obj.edit62:setAlign("client");
    obj.edit62:setField("racaCar");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setFontSize(12);
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");
    obj.edit62:setFontColor("white");

    obj.flowPart81 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout7);
    obj.flowPart81:setMinWidth(50);
    obj.flowPart81:setMaxWidth(50);
    obj.flowPart81:setHeight(20);
    obj.flowPart81:setName("flowPart81");
    obj.flowPart81:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart81:setVertAlign("leading");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart81);
    obj.edit63:setAlign("client");
    obj.edit63:setField("nepCar");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setFontSize(12);
    obj.edit63:setType("number");
    obj.edit63:setName("edit63");
    obj.edit63:setFontColor("white");

    obj.flowPart82 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout7);
    obj.flowPart82:setMinWidth(50);
    obj.flowPart82:setMaxWidth(50);
    obj.flowPart82:setHeight(20);
    obj.flowPart82:setName("flowPart82");
    obj.flowPart82:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart82:setVertAlign("leading");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart82);
    obj.edit64:setAlign("client");
    obj.edit64:setField("inerenteCar");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontSize(12);
    obj.edit64:setType("number");
    obj.edit64:setName("edit64");
    obj.edit64:setFontColor("white");

    obj.flowPart83 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout7);
    obj.flowPart83:setMinWidth(50);
    obj.flowPart83:setMaxWidth(50);
    obj.flowPart83:setHeight(20);
    obj.flowPart83:setName("flowPart83");
    obj.flowPart83:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart83:setVertAlign("leading");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart83);
    obj.edit65:setAlign("client");
    obj.edit65:setField("tamanhoCar");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setFontSize(12);
    obj.edit65:setType("number");
    obj.edit65:setName("edit65");
    obj.edit65:setFontColor("white");

    obj.flowPart84 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout7);
    obj.flowPart84:setMinWidth(50);
    obj.flowPart84:setMaxWidth(50);
    obj.flowPart84:setHeight(20);
    obj.flowPart84:setName("flowPart84");
    obj.flowPart84:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart84:setVertAlign("leading");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.flowPart84);
    obj.edit66:setAlign("client");
    obj.edit66:setField("outrosCar");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setFontSize(12);
    obj.edit66:setType("number");
    obj.edit66:setName("edit66");
    obj.edit66:setFontColor("white");

    obj.flowPart85 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout7);
    obj.flowPart85:setMinWidth(20);
    obj.flowPart85:setMaxWidth(20);
    obj.flowPart85:setHeight(20);
    obj.flowPart85:setName("flowPart85");
    obj.flowPart85:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart85:setVertAlign("leading");

    obj.flowPart86 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout7);
    obj.flowPart86:setMinWidth(50);
    obj.flowPart86:setMaxWidth(75);
    obj.flowPart86:setHeight(20);
    obj.flowPart86:setName("flowPart86");
    obj.flowPart86:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart86:setVertAlign("leading");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.flowPart86);
    obj.edit67:setAlign("client");
    obj.edit67:setField("melhoriaCar");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontSize(12);
    obj.edit67:setType("number");
    obj.edit67:setName("edit67");
    obj.edit67:setFontColor("white");

    obj.flowPart87 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout7);
    obj.flowPart87:setMinWidth(50);
    obj.flowPart87:setMaxWidth(75);
    obj.flowPart87:setHeight(20);
    obj.flowPart87:setName("flowPart87");
    obj.flowPart87:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart87:setVertAlign("leading");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.flowPart87);
    obj.edit68:setAlign("client");
    obj.edit68:setField("danoTempCar");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setFontSize(12);
    obj.edit68:setType("number");
    obj.edit68:setName("edit68");
    obj.edit68:setFontColor("white");

    obj.flowPart88 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout7);
    obj.flowPart88:setMinWidth(50);
    obj.flowPart88:setMaxWidth(75);
    obj.flowPart88:setHeight(20);
    obj.flowPart88:setName("flowPart88");
    obj.flowPart88:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart88:setVertAlign("leading");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart88);
    obj.edit69:setAlign("client");
    obj.edit69:setField("danoPermCar");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setFontSize(12);
    obj.edit69:setType("number");
    obj.edit69:setName("edit69");
    obj.edit69:setFontColor("white");

    obj.flowPart89 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout7);
    obj.flowPart89:setMinWidth(50);
    obj.flowPart89:setMaxWidth(75);
    obj.flowPart89:setHeight(20);
    obj.flowPart89:setName("flowPart89");
    obj.flowPart89:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart89:setVertAlign("leading");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart89);
    obj.edit70:setAlign("client");
    obj.edit70:setField("temporarioCar");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontSize(12);
    obj.edit70:setType("number");
    obj.edit70:setName("edit70");
    obj.edit70:setFontColor("white");

    obj.flowPart90 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout7);
    obj.flowPart90:setMinWidth(50);
    obj.flowPart90:setMaxWidth(75);
    obj.flowPart90:setHeight(20);
    obj.flowPart90:setName("flowPart90");
    obj.flowPart90:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart90:setVertAlign("leading");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart90);
    obj.edit71:setAlign("client");
    obj.edit71:setField("magiaCar");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setFontSize(12);
    obj.edit71:setType("number");
    obj.edit71:setName("edit71");
    obj.edit71:setFontColor("white");

    obj.flowPart91 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout7);
    obj.flowPart91:setMinWidth(50);
    obj.flowPart91:setMaxWidth(75);
    obj.flowPart91:setHeight(20);
    obj.flowPart91:setName("flowPart91");
    obj.flowPart91:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart91:setVertAlign("leading");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart91);
    obj.edit72:setAlign("client");
    obj.edit72:setField("classeCar");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setFontSize(12);
    obj.edit72:setType("number");
    obj.edit72:setName("edit72");
    obj.edit72:setFontColor("white");

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
    obj.popResistencia:setHeight(150);
    obj.popResistencia:setBackOpacity(0.4);

    obj.flowLayout8 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.popResistencia);
    obj.flowLayout8:setAlign("top");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setMaxControlsPerLine(11);
    obj.flowLayout8:setMargins({bottom=4});
    obj.flowLayout8:setHorzAlign("center");
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setVertAlign("leading");

    obj.flowPart92 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout8);
    obj.flowPart92:setMinWidth(50);
    obj.flowPart92:setMaxWidth(50);
    obj.flowPart92:setHeight(15);
    obj.flowPart92:setName("flowPart92");
    obj.flowPart92:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart92:setVertAlign("leading");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart92);
    obj.label7:setAlign("top");
    obj.label7:setFontSize(10);
    obj.label7:setText("Base");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");
    obj.label7:setFontColor("#D0D0D0");

    obj.flowPart93 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout8);
    obj.flowPart93:setMinWidth(50);
    obj.flowPart93:setMaxWidth(50);
    obj.flowPart93:setHeight(15);
    obj.flowPart93:setName("flowPart93");
    obj.flowPart93:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart93:setVertAlign("leading");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart93);
    obj.label8:setAlign("top");
    obj.label8:setFontSize(10);
    obj.label8:setText("Atributo");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");
    obj.label8:setFontColor("#D0D0D0");

    obj.flowPart94 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout8);
    obj.flowPart94:setMinWidth(50);
    obj.flowPart94:setMaxWidth(50);
    obj.flowPart94:setHeight(15);
    obj.flowPart94:setName("flowPart94");
    obj.flowPart94:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart94:setVertAlign("leading");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart94);
    obj.label9:setAlign("top");
    obj.label9:setFontSize(10);
    obj.label9:setText("Magia");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");
    obj.label9:setFontColor("#D0D0D0");

    obj.flowPart95 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout8);
    obj.flowPart95:setMinWidth(50);
    obj.flowPart95:setMaxWidth(50);
    obj.flowPart95:setHeight(15);
    obj.flowPart95:setName("flowPart95");
    obj.flowPart95:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart95:setVertAlign("leading");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart95);
    obj.label10:setAlign("top");
    obj.label10:setFontSize(10);
    obj.label10:setText("Melhoria");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");
    obj.label10:setFontColor("#D0D0D0");

    obj.flowPart96 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout8);
    obj.flowPart96:setMinWidth(50);
    obj.flowPart96:setMaxWidth(50);
    obj.flowPart96:setHeight(15);
    obj.flowPart96:setName("flowPart96");
    obj.flowPart96:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart96:setVertAlign("leading");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart96);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(10);
    obj.label11:setText("Temp.");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");
    obj.label11:setFontColor("#D0D0D0");

    obj.flowPart97 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout8);
    obj.flowPart97:setMinWidth(50);
    obj.flowPart97:setMaxWidth(50);
    obj.flowPart97:setHeight(15);
    obj.flowPart97:setName("flowPart97");
    obj.flowPart97:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart97:setVertAlign("leading");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart97);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(10);
    obj.label12:setText("Outros");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");
    obj.label12:setFontColor("#D0D0D0");

    obj.flowPart98 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout8);
    obj.flowPart98:setMinWidth(50);
    obj.flowPart98:setMaxWidth(50);
    obj.flowPart98:setHeight(15);
    obj.flowPart98:setName("flowPart98");
    obj.flowPart98:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart98:setVertAlign("leading");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart98);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(10);
    obj.label13:setText("");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");
    obj.label13:setFontColor("#D0D0D0");

    obj.flowLayout9 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.popResistencia);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxControlsPerLine(11);
    obj.flowLayout9:setMargins({bottom=4});
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setVertAlign("leading");

    obj.flowPart99 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout9);
    obj.flowPart99:setMinWidth(50);
    obj.flowPart99:setMaxWidth(50);
    obj.flowPart99:setHeight(20);
    obj.flowPart99:setName("flowPart99");
    obj.flowPart99:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart99:setVertAlign("leading");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart99);
    obj.edit73:setAlign("client");
    obj.edit73:setField("baseFort");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontSize(12);
    obj.edit73:setType("number");
    obj.edit73:setName("edit73");
    obj.edit73:setFontColor("white");

    obj.flowPart100 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout9);
    obj.flowPart100:setMinWidth(50);
    obj.flowPart100:setMaxWidth(50);
    obj.flowPart100:setHeight(20);
    obj.flowPart100:setName("flowPart100");
    obj.flowPart100:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart100:setVertAlign("leading");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart100);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart100);
    obj.label14:setAlign("client");
    obj.label14:setField("atrModFort");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontSize(12);
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.flowPart101 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout9);
    obj.flowPart101:setMinWidth(50);
    obj.flowPart101:setMaxWidth(50);
    obj.flowPart101:setHeight(20);
    obj.flowPart101:setName("flowPart101");
    obj.flowPart101:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart101:setVertAlign("leading");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart101);
    obj.edit74:setAlign("client");
    obj.edit74:setField("magiaFort");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setFontSize(12);
    obj.edit74:setType("number");
    obj.edit74:setName("edit74");
    obj.edit74:setFontColor("white");

    obj.flowPart102 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout9);
    obj.flowPart102:setMinWidth(50);
    obj.flowPart102:setMaxWidth(50);
    obj.flowPart102:setHeight(20);
    obj.flowPart102:setName("flowPart102");
    obj.flowPart102:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart102:setVertAlign("leading");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.flowPart102);
    obj.edit75:setAlign("client");
    obj.edit75:setField("variavelFort");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setFontSize(12);
    obj.edit75:setType("number");
    obj.edit75:setName("edit75");
    obj.edit75:setFontColor("white");

    obj.flowPart103 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout9);
    obj.flowPart103:setMinWidth(50);
    obj.flowPart103:setMaxWidth(50);
    obj.flowPart103:setHeight(20);
    obj.flowPart103:setName("flowPart103");
    obj.flowPart103:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart103:setVertAlign("leading");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.flowPart103);
    obj.edit76:setAlign("client");
    obj.edit76:setField("temporarioFort");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontSize(12);
    obj.edit76:setType("number");
    obj.edit76:setName("edit76");
    obj.edit76:setFontColor("white");

    obj.flowPart104 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout9);
    obj.flowPart104:setMinWidth(50);
    obj.flowPart104:setMaxWidth(50);
    obj.flowPart104:setHeight(20);
    obj.flowPart104:setName("flowPart104");
    obj.flowPart104:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart104:setVertAlign("leading");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.flowPart104);
    obj.edit77:setAlign("client");
    obj.edit77:setField("outrosFort");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setFontSize(12);
    obj.edit77:setType("number");
    obj.edit77:setName("edit77");
    obj.edit77:setFontColor("white");

    obj.flowPart105 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout9);
    obj.flowPart105:setMinWidth(60);
    obj.flowPart105:setMaxWidth(60);
    obj.flowPart105:setHeight(20);
    obj.flowPart105:setName("flowPart105");
    obj.flowPart105:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart105:setVertAlign("leading");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowPart105);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setField("atrTrFort");
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.popResistencia);
    obj.dataLink13:setFields({'baseFort', 'atrModFort', 'magiaFort', 'variavelFort', 'temporarioFort', 'outrosFort'});
    obj.dataLink13:setName("dataLink13");

    obj.flowLayout10 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.popResistencia);
    obj.flowLayout10:setAlign("top");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxControlsPerLine(11);
    obj.flowLayout10:setMargins({bottom=4});
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setVertAlign("leading");

    obj.flowPart106 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout10);
    obj.flowPart106:setMinWidth(50);
    obj.flowPart106:setMaxWidth(50);
    obj.flowPart106:setHeight(20);
    obj.flowPart106:setName("flowPart106");
    obj.flowPart106:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart106:setVertAlign("leading");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.flowPart106);
    obj.edit78:setAlign("client");
    obj.edit78:setField("baseRef");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setFontSize(12);
    obj.edit78:setType("number");
    obj.edit78:setName("edit78");
    obj.edit78:setFontColor("white");

    obj.flowPart107 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout10);
    obj.flowPart107:setMinWidth(50);
    obj.flowPart107:setMaxWidth(50);
    obj.flowPart107:setHeight(20);
    obj.flowPart107:setName("flowPart107");
    obj.flowPart107:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart107:setVertAlign("leading");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowPart107);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart107);
    obj.label15:setAlign("client");
    obj.label15:setField("atrModRef");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontSize(12);
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");

    obj.flowPart108 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout10);
    obj.flowPart108:setMinWidth(50);
    obj.flowPart108:setMaxWidth(50);
    obj.flowPart108:setHeight(20);
    obj.flowPart108:setName("flowPart108");
    obj.flowPart108:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart108:setVertAlign("leading");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.flowPart108);
    obj.edit79:setAlign("client");
    obj.edit79:setField("magiaRef");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setFontSize(12);
    obj.edit79:setType("number");
    obj.edit79:setName("edit79");
    obj.edit79:setFontColor("white");

    obj.flowPart109 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout10);
    obj.flowPart109:setMinWidth(50);
    obj.flowPart109:setMaxWidth(50);
    obj.flowPart109:setHeight(20);
    obj.flowPart109:setName("flowPart109");
    obj.flowPart109:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart109:setVertAlign("leading");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.flowPart109);
    obj.edit80:setAlign("client");
    obj.edit80:setField("variavelRef");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setFontSize(12);
    obj.edit80:setType("number");
    obj.edit80:setName("edit80");
    obj.edit80:setFontColor("white");

    obj.flowPart110 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout10);
    obj.flowPart110:setMinWidth(50);
    obj.flowPart110:setMaxWidth(50);
    obj.flowPart110:setHeight(20);
    obj.flowPart110:setName("flowPart110");
    obj.flowPart110:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart110:setVertAlign("leading");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.flowPart110);
    obj.edit81:setAlign("client");
    obj.edit81:setField("temporarioRef");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setFontSize(12);
    obj.edit81:setType("number");
    obj.edit81:setName("edit81");
    obj.edit81:setFontColor("white");

    obj.flowPart111 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout10);
    obj.flowPart111:setMinWidth(50);
    obj.flowPart111:setMaxWidth(50);
    obj.flowPart111:setHeight(20);
    obj.flowPart111:setName("flowPart111");
    obj.flowPart111:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart111:setVertAlign("leading");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.flowPart111);
    obj.edit82:setAlign("client");
    obj.edit82:setField("outrosRef");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setFontSize(12);
    obj.edit82:setType("number");
    obj.edit82:setName("edit82");
    obj.edit82:setFontColor("white");

    obj.flowPart112 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.flowLayout10);
    obj.flowPart112:setMinWidth(60);
    obj.flowPart112:setMaxWidth(60);
    obj.flowPart112:setHeight(20);
    obj.flowPart112:setName("flowPart112");
    obj.flowPart112:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart112:setVertAlign("leading");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart112);
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setField("atrTrRef");
    obj.comboBox2:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.popResistencia);
    obj.dataLink14:setFields({'baseRef', 'atrModRef', 'magiaRef', 'variavelRef', 'temporarioRef', 'outrosRef'});
    obj.dataLink14:setName("dataLink14");

    obj.flowLayout11 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.popResistencia);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxControlsPerLine(11);
    obj.flowLayout11:setMargins({bottom=4});
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setVertAlign("leading");

    obj.flowPart113 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.flowLayout11);
    obj.flowPart113:setMinWidth(50);
    obj.flowPart113:setMaxWidth(50);
    obj.flowPart113:setHeight(20);
    obj.flowPart113:setName("flowPart113");
    obj.flowPart113:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart113:setVertAlign("leading");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.flowPart113);
    obj.edit83:setAlign("client");
    obj.edit83:setField("baseVon");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setFontSize(12);
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");
    obj.edit83:setFontColor("white");

    obj.flowPart114 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.flowLayout11);
    obj.flowPart114:setMinWidth(50);
    obj.flowPart114:setMaxWidth(50);
    obj.flowPart114:setHeight(20);
    obj.flowPart114:setName("flowPart114");
    obj.flowPart114:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart114:setVertAlign("leading");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart114);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart114);
    obj.label16:setAlign("client");
    obj.label16:setField("atrModVon");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(12);
    obj.label16:setName("label16");
    obj.label16:setFontColor("white");

    obj.flowPart115 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.flowLayout11);
    obj.flowPart115:setMinWidth(50);
    obj.flowPart115:setMaxWidth(50);
    obj.flowPart115:setHeight(20);
    obj.flowPart115:setName("flowPart115");
    obj.flowPart115:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart115:setVertAlign("leading");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.flowPart115);
    obj.edit84:setAlign("client");
    obj.edit84:setField("magiaVon");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setFontSize(12);
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");
    obj.edit84:setFontColor("white");

    obj.flowPart116 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.flowLayout11);
    obj.flowPart116:setMinWidth(50);
    obj.flowPart116:setMaxWidth(50);
    obj.flowPart116:setHeight(20);
    obj.flowPart116:setName("flowPart116");
    obj.flowPart116:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart116:setVertAlign("leading");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.flowPart116);
    obj.edit85:setAlign("client");
    obj.edit85:setField("variavelVon");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setFontSize(12);
    obj.edit85:setType("number");
    obj.edit85:setName("edit85");
    obj.edit85:setFontColor("white");

    obj.flowPart117 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.flowLayout11);
    obj.flowPart117:setMinWidth(50);
    obj.flowPart117:setMaxWidth(50);
    obj.flowPart117:setHeight(20);
    obj.flowPart117:setName("flowPart117");
    obj.flowPart117:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart117:setVertAlign("leading");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.flowPart117);
    obj.edit86:setAlign("client");
    obj.edit86:setField("temporarioVon");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setFontSize(12);
    obj.edit86:setType("number");
    obj.edit86:setName("edit86");
    obj.edit86:setFontColor("white");

    obj.flowPart118 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.flowLayout11);
    obj.flowPart118:setMinWidth(50);
    obj.flowPart118:setMaxWidth(50);
    obj.flowPart118:setHeight(20);
    obj.flowPart118:setName("flowPart118");
    obj.flowPart118:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart118:setVertAlign("leading");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.flowPart118);
    obj.edit87:setAlign("client");
    obj.edit87:setField("outrosVon");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setFontSize(12);
    obj.edit87:setType("number");
    obj.edit87:setName("edit87");
    obj.edit87:setFontColor("white");

    obj.flowPart119 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.flowLayout11);
    obj.flowPart119:setMinWidth(60);
    obj.flowPart119:setMaxWidth(60);
    obj.flowPart119:setHeight(20);
    obj.flowPart119:setName("flowPart119");
    obj.flowPart119:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart119:setVertAlign("leading");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowPart119);
    obj.comboBox3:setAlign("client");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setField("atrTrVon");
    obj.comboBox3:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR', '-'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.popResistencia);
    obj.dataLink15:setFields({'baseVon', 'atrModVon', 'magiaVon', 'variavelVon', 'temporarioVon', 'outrosVon'});
    obj.dataLink15:setName("dataLink15");

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

    obj.flowLayout12 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.popCA);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMargins({bottom=4});
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setVertAlign("leading");

    obj.flowPart120 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.flowLayout12);
    obj.flowPart120:setMinWidth(50);
    obj.flowPart120:setMaxWidth(50);
    obj.flowPart120:setHeight(15);
    obj.flowPart120:setName("flowPart120");
    obj.flowPart120:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart120:setVertAlign("leading");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart120);
    obj.label17:setAlign("top");
    obj.label17:setFontSize(10);
    obj.label17:setText("Armadura");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setWordWrap(true);
    obj.label17:setTextTrimming("none");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");
    obj.label17:setFontColor("#D0D0D0");

    obj.flowPart121 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout12);
    obj.flowPart121:setMinWidth(50);
    obj.flowPart121:setMaxWidth(50);
    obj.flowPart121:setHeight(20);
    obj.flowPart121:setName("flowPart121");
    obj.flowPart121:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart121:setVertAlign("leading");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.flowPart121);
    obj.edit88:setAlign("client");
    obj.edit88:setField("armaduraCa");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setFontSize(12);
    obj.edit88:setType("number");
    obj.edit88:setName("edit88");
    obj.edit88:setFontColor("white");

    obj.flowPart122 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.flowLayout12);
    obj.flowPart122:setMinWidth(140);
    obj.flowPart122:setMaxWidth(150);
    obj.flowPart122:setHeight(20);
    obj.flowPart122:setName("flowPart122");
    obj.flowPart122:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart122:setVertAlign("leading");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.flowPart122);
    obj.edit89:setAlign("client");
    obj.edit89:setField("armaduraCa2");
    obj.edit89:setFontSize(12);
    obj.edit89:setName("edit89");
    obj.edit89:setFontColor("white");

    obj.flowPart123 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.flowLayout12);
    obj.flowPart123:setMinWidth(50);
    obj.flowPart123:setMaxWidth(60);
    obj.flowPart123:setHeight(20);
    obj.flowPart123:setName("flowPart123");
    obj.flowPart123:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart123:setVertAlign("leading");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowPart123);
    obj.checkBox7:setField("armaduraCaSurp");
    obj.checkBox7:setText("Surpresa");
    obj.checkBox7:setFontSize(10);
    obj.checkBox7:setHeight(20);
    obj.checkBox7:setName("checkBox7");

    obj.flowPart124 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.flowLayout12);
    obj.flowPart124:setMinWidth(50);
    obj.flowPart124:setMaxWidth(60);
    obj.flowPart124:setHeight(20);
    obj.flowPart124:setName("flowPart124");
    obj.flowPart124:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart124:setVertAlign("leading");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowPart124);
    obj.checkBox8:setField("armaduraCaToque");
    obj.checkBox8:setText("Toque");
    obj.checkBox8:setFontSize(10);
    obj.checkBox8:setHeight(15);
    obj.checkBox8:setName("checkBox8");

    obj.flowPart125 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.flowLayout12);
    obj.flowPart125:setMinWidth(10);
    obj.flowPart125:setMaxWidth(20);
    obj.flowPart125:setHeight(15);
    obj.flowPart125:setName("flowPart125");
    obj.flowPart125:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart125:setVertAlign("leading");

    obj.flowPart126 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.flowLayout12);
    obj.flowPart126:setMinWidth(50);
    obj.flowPart126:setMaxWidth(50);
    obj.flowPart126:setHeight(15);
    obj.flowPart126:setName("flowPart126");
    obj.flowPart126:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart126:setVertAlign("leading");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart126);
    obj.label18:setAlign("top");
    obj.label18:setFontSize(10);
    obj.label18:setText("Penalidade");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWordWrap(true);
    obj.label18:setTextTrimming("none");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");
    obj.label18:setFontColor("#D0D0D0");

    obj.flowPart127 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.flowLayout12);
    obj.flowPart127:setMinWidth(50);
    obj.flowPart127:setMaxWidth(50);
    obj.flowPart127:setHeight(20);
    obj.flowPart127:setName("flowPart127");
    obj.flowPart127:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart127:setVertAlign("leading");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowPart127);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart127);
    obj.label19:setAlign("client");
    obj.label19:setField("equipamentoCorpoPen");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontSize(12);
    obj.label19:setName("label19");
    obj.label19:setFontColor("white");

    obj.flowPart128 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.flowLayout12);
    obj.flowPart128:setMinWidth(50);
    obj.flowPart128:setMaxWidth(50);
    obj.flowPart128:setHeight(15);
    obj.flowPart128:setName("flowPart128");
    obj.flowPart128:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart128:setVertAlign("leading");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart128);
    obj.label20:setAlign("top");
    obj.label20:setFontSize(10);
    obj.label20:setText("Falha");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWordWrap(true);
    obj.label20:setTextTrimming("none");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");
    obj.label20:setFontColor("#D0D0D0");

    obj.flowPart129 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.flowLayout12);
    obj.flowPart129:setMinWidth(50);
    obj.flowPart129:setMaxWidth(50);
    obj.flowPart129:setHeight(20);
    obj.flowPart129:setName("flowPart129");
    obj.flowPart129:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart129:setVertAlign("leading");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.flowPart129);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart129);
    obj.label21:setAlign("client");
    obj.label21:setField("equipamentoCorpoFalha");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(12);
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout12);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart130 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.flowLayout12);
    obj.flowPart130:setMinWidth(50);
    obj.flowPart130:setMaxWidth(50);
    obj.flowPart130:setHeight(15);
    obj.flowPart130:setName("flowPart130");
    obj.flowPart130:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart130:setVertAlign("leading");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart130);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(10);
    obj.label22:setText("Escudo");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");
    obj.label22:setFontColor("#D0D0D0");

    obj.flowPart131 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.flowLayout12);
    obj.flowPart131:setMinWidth(50);
    obj.flowPart131:setMaxWidth(50);
    obj.flowPart131:setHeight(20);
    obj.flowPart131:setName("flowPart131");
    obj.flowPart131:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart131:setVertAlign("leading");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.flowPart131);
    obj.edit90:setAlign("client");
    obj.edit90:setField("escudoCa");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setFontSize(12);
    obj.edit90:setType("number");
    obj.edit90:setName("edit90");
    obj.edit90:setFontColor("white");

    obj.flowPart132 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.flowLayout12);
    obj.flowPart132:setMinWidth(140);
    obj.flowPart132:setMaxWidth(150);
    obj.flowPart132:setHeight(20);
    obj.flowPart132:setName("flowPart132");
    obj.flowPart132:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart132:setVertAlign("leading");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.flowPart132);
    obj.edit91:setAlign("client");
    obj.edit91:setField("escudoCa2");
    obj.edit91:setFontSize(12);
    obj.edit91:setName("edit91");
    obj.edit91:setFontColor("white");

    obj.flowPart133 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.flowLayout12);
    obj.flowPart133:setMinWidth(50);
    obj.flowPart133:setMaxWidth(60);
    obj.flowPart133:setHeight(20);
    obj.flowPart133:setName("flowPart133");
    obj.flowPart133:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart133:setVertAlign("leading");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowPart133);
    obj.checkBox9:setField("escudoCaSurp");
    obj.checkBox9:setText("Surpresa");
    obj.checkBox9:setFontSize(10);
    obj.checkBox9:setHeight(20);
    obj.checkBox9:setName("checkBox9");

    obj.flowPart134 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.flowLayout12);
    obj.flowPart134:setMinWidth(50);
    obj.flowPart134:setMaxWidth(60);
    obj.flowPart134:setHeight(20);
    obj.flowPart134:setName("flowPart134");
    obj.flowPart134:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart134:setVertAlign("leading");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowPart134);
    obj.checkBox10:setField("escudoCaToque");
    obj.checkBox10:setText("Toque");
    obj.checkBox10:setFontSize(10);
    obj.checkBox10:setHeight(15);
    obj.checkBox10:setName("checkBox10");

    obj.flowPart135 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.flowLayout12);
    obj.flowPart135:setMinWidth(10);
    obj.flowPart135:setMaxWidth(20);
    obj.flowPart135:setHeight(15);
    obj.flowPart135:setName("flowPart135");
    obj.flowPart135:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart135:setVertAlign("leading");

    obj.flowPart136 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.flowLayout12);
    obj.flowPart136:setMinWidth(50);
    obj.flowPart136:setMaxWidth(50);
    obj.flowPart136:setHeight(15);
    obj.flowPart136:setName("flowPart136");
    obj.flowPart136:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart136:setVertAlign("leading");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart136);
    obj.label23:setAlign("top");
    obj.label23:setFontSize(10);
    obj.label23:setText("Penalidade");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setWordWrap(true);
    obj.label23:setTextTrimming("none");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");
    obj.label23:setFontColor("#D0D0D0");

    obj.flowPart137 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.flowLayout12);
    obj.flowPart137:setMinWidth(50);
    obj.flowPart137:setMaxWidth(50);
    obj.flowPart137:setHeight(20);
    obj.flowPart137:setName("flowPart137");
    obj.flowPart137:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart137:setVertAlign("leading");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.flowPart137);
    obj.edit92:setAlign("client");
    obj.edit92:setField("escudoPen");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setFontSize(12);
    obj.edit92:setType("number");
    obj.edit92:setName("edit92");
    obj.edit92:setFontColor("white");

    obj.flowPart138 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.flowLayout12);
    obj.flowPart138:setMinWidth(50);
    obj.flowPart138:setMaxWidth(50);
    obj.flowPart138:setHeight(15);
    obj.flowPart138:setName("flowPart138");
    obj.flowPart138:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart138:setVertAlign("leading");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart138);
    obj.label24:setAlign("top");
    obj.label24:setFontSize(10);
    obj.label24:setText("Falha");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");
    obj.label24:setFontColor("#D0D0D0");

    obj.flowPart139 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.flowLayout12);
    obj.flowPart139:setMinWidth(50);
    obj.flowPart139:setMaxWidth(50);
    obj.flowPart139:setHeight(20);
    obj.flowPart139:setName("flowPart139");
    obj.flowPart139:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart139:setVertAlign("leading");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.flowPart139);
    obj.edit93:setAlign("client");
    obj.edit93:setField("escudoFalha");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setFontSize(12);
    obj.edit93:setType("number");
    obj.edit93:setName("edit93");
    obj.edit93:setFontColor("white");

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout12);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart140 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.flowLayout12);
    obj.flowPart140:setMinWidth(50);
    obj.flowPart140:setMaxWidth(50);
    obj.flowPart140:setHeight(15);
    obj.flowPart140:setName("flowPart140");
    obj.flowPart140:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart140:setVertAlign("leading");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart140);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(10);
    obj.label25:setText("Destreza");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setWordWrap(true);
    obj.label25:setTextTrimming("none");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");
    obj.label25:setFontColor("#D0D0D0");

    obj.flowPart141 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.flowLayout12);
    obj.flowPart141:setMinWidth(50);
    obj.flowPart141:setMaxWidth(50);
    obj.flowPart141:setHeight(20);
    obj.flowPart141:setName("flowPart141");
    obj.flowPart141:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart141:setVertAlign("leading");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.flowPart141);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart141);
    obj.label26:setAlign("client");
    obj.label26:setField("efetModDes");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setFontSize(12);
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");

    obj.flowPart142 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart142:setParent(obj.flowLayout12);
    obj.flowPart142:setMinWidth(140);
    obj.flowPart142:setMaxWidth(150);
    obj.flowPart142:setHeight(20);
    obj.flowPart142:setName("flowPart142");
    obj.flowPart142:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart142:setVertAlign("leading");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.flowPart142);
    obj.edit94:setAlign("client");
    obj.edit94:setField("destrezaCa2");
    obj.edit94:setFontSize(12);
    obj.edit94:setName("edit94");
    obj.edit94:setFontColor("white");

    obj.flowPart143 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart143:setParent(obj.flowLayout12);
    obj.flowPart143:setMinWidth(50);
    obj.flowPart143:setMaxWidth(60);
    obj.flowPart143:setHeight(20);
    obj.flowPart143:setName("flowPart143");
    obj.flowPart143:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart143:setVertAlign("leading");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowPart143);
    obj.checkBox11:setField("destrezaCaSurp");
    obj.checkBox11:setText("Surpresa");
    obj.checkBox11:setFontSize(10);
    obj.checkBox11:setHeight(20);
    obj.checkBox11:setName("checkBox11");

    obj.flowPart144 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart144:setParent(obj.flowLayout12);
    obj.flowPart144:setMinWidth(50);
    obj.flowPart144:setMaxWidth(60);
    obj.flowPart144:setHeight(20);
    obj.flowPart144:setName("flowPart144");
    obj.flowPart144:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart144:setVertAlign("leading");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowPart144);
    obj.checkBox12:setField("destrezaCaToque");
    obj.checkBox12:setText("Toque");
    obj.checkBox12:setFontSize(10);
    obj.checkBox12:setHeight(15);
    obj.checkBox12:setName("checkBox12");

    obj.flowLineBreak3 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout12);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart145 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart145:setParent(obj.flowLayout12);
    obj.flowPart145:setMinWidth(50);
    obj.flowPart145:setMaxWidth(50);
    obj.flowPart145:setHeight(15);
    obj.flowPart145:setName("flowPart145");
    obj.flowPart145:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart145:setVertAlign("leading");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart145);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(10);
    obj.label27:setText("Tamanho");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");
    obj.label27:setFontColor("#D0D0D0");

    obj.flowPart146 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart146:setParent(obj.flowLayout12);
    obj.flowPart146:setMinWidth(50);
    obj.flowPart146:setMaxWidth(50);
    obj.flowPart146:setHeight(20);
    obj.flowPart146:setName("flowPart146");
    obj.flowPart146:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart146:setVertAlign("leading");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.flowPart146);
    obj.edit95:setAlign("client");
    obj.edit95:setField("tamanhoCa");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setFontSize(12);
    obj.edit95:setType("number");
    obj.edit95:setName("edit95");
    obj.edit95:setFontColor("white");

    obj.flowPart147 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart147:setParent(obj.flowLayout12);
    obj.flowPart147:setMinWidth(140);
    obj.flowPart147:setMaxWidth(150);
    obj.flowPart147:setHeight(20);
    obj.flowPart147:setName("flowPart147");
    obj.flowPart147:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart147:setVertAlign("leading");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.flowPart147);
    obj.edit96:setAlign("client");
    obj.edit96:setField("tamanhoCa2");
    obj.edit96:setFontSize(12);
    obj.edit96:setName("edit96");
    obj.edit96:setFontColor("white");

    obj.flowPart148 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart148:setParent(obj.flowLayout12);
    obj.flowPart148:setMinWidth(50);
    obj.flowPart148:setMaxWidth(60);
    obj.flowPart148:setHeight(20);
    obj.flowPart148:setName("flowPart148");
    obj.flowPart148:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart148:setVertAlign("leading");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.flowPart148);
    obj.checkBox13:setField("tamanhoCaSurp");
    obj.checkBox13:setText("Surpresa");
    obj.checkBox13:setFontSize(10);
    obj.checkBox13:setHeight(20);
    obj.checkBox13:setName("checkBox13");

    obj.flowPart149 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart149:setParent(obj.flowLayout12);
    obj.flowPart149:setMinWidth(50);
    obj.flowPart149:setMaxWidth(60);
    obj.flowPart149:setHeight(20);
    obj.flowPart149:setName("flowPart149");
    obj.flowPart149:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart149:setVertAlign("leading");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.flowPart149);
    obj.checkBox14:setField("tamanhoCaToque");
    obj.checkBox14:setText("Toque");
    obj.checkBox14:setFontSize(10);
    obj.checkBox14:setHeight(15);
    obj.checkBox14:setName("checkBox14");

    obj.flowLineBreak4 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout12);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart150 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart150:setParent(obj.flowLayout12);
    obj.flowPart150:setMinWidth(50);
    obj.flowPart150:setMaxWidth(50);
    obj.flowPart150:setHeight(15);
    obj.flowPart150:setName("flowPart150");
    obj.flowPart150:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart150:setVertAlign("leading");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart150);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(10);
    obj.label28:setText("Natural");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");
    obj.label28:setFontColor("#D0D0D0");

    obj.flowPart151 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart151:setParent(obj.flowLayout12);
    obj.flowPart151:setMinWidth(50);
    obj.flowPart151:setMaxWidth(50);
    obj.flowPart151:setHeight(20);
    obj.flowPart151:setName("flowPart151");
    obj.flowPart151:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart151:setVertAlign("leading");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.flowPart151);
    obj.edit97:setAlign("client");
    obj.edit97:setField("naturalCa");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setFontSize(12);
    obj.edit97:setType("number");
    obj.edit97:setName("edit97");
    obj.edit97:setFontColor("white");

    obj.flowPart152 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart152:setParent(obj.flowLayout12);
    obj.flowPart152:setMinWidth(140);
    obj.flowPart152:setMaxWidth(150);
    obj.flowPart152:setHeight(20);
    obj.flowPart152:setName("flowPart152");
    obj.flowPart152:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart152:setVertAlign("leading");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.flowPart152);
    obj.edit98:setAlign("client");
    obj.edit98:setField("naturalCa2");
    obj.edit98:setFontSize(12);
    obj.edit98:setName("edit98");
    obj.edit98:setFontColor("white");

    obj.flowPart153 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart153:setParent(obj.flowLayout12);
    obj.flowPart153:setMinWidth(50);
    obj.flowPart153:setMaxWidth(60);
    obj.flowPart153:setHeight(20);
    obj.flowPart153:setName("flowPart153");
    obj.flowPart153:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart153:setVertAlign("leading");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.flowPart153);
    obj.checkBox15:setField("naturalCaSurp");
    obj.checkBox15:setText("Surpresa");
    obj.checkBox15:setFontSize(10);
    obj.checkBox15:setHeight(20);
    obj.checkBox15:setName("checkBox15");

    obj.flowPart154 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart154:setParent(obj.flowLayout12);
    obj.flowPart154:setMinWidth(50);
    obj.flowPart154:setMaxWidth(60);
    obj.flowPart154:setHeight(20);
    obj.flowPart154:setName("flowPart154");
    obj.flowPart154:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart154:setVertAlign("leading");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.flowPart154);
    obj.checkBox16:setField("naturalCaToque");
    obj.checkBox16:setText("Toque");
    obj.checkBox16:setFontSize(10);
    obj.checkBox16:setHeight(15);
    obj.checkBox16:setName("checkBox16");

    obj.flowLineBreak5 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout12);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart155 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart155:setParent(obj.flowLayout12);
    obj.flowPart155:setMinWidth(50);
    obj.flowPart155:setMaxWidth(50);
    obj.flowPart155:setHeight(15);
    obj.flowPart155:setName("flowPart155");
    obj.flowPart155:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart155:setVertAlign("leading");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart155);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Deflexao");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");
    obj.label29:setFontColor("#D0D0D0");

    obj.flowPart156 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart156:setParent(obj.flowLayout12);
    obj.flowPart156:setMinWidth(50);
    obj.flowPart156:setMaxWidth(50);
    obj.flowPart156:setHeight(20);
    obj.flowPart156:setName("flowPart156");
    obj.flowPart156:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart156:setVertAlign("leading");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.flowPart156);
    obj.edit99:setAlign("client");
    obj.edit99:setField("deflexaoCa");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setFontSize(12);
    obj.edit99:setType("number");
    obj.edit99:setName("edit99");
    obj.edit99:setFontColor("white");

    obj.flowPart157 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart157:setParent(obj.flowLayout12);
    obj.flowPart157:setMinWidth(140);
    obj.flowPart157:setMaxWidth(150);
    obj.flowPart157:setHeight(20);
    obj.flowPart157:setName("flowPart157");
    obj.flowPart157:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart157:setVertAlign("leading");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.flowPart157);
    obj.edit100:setAlign("client");
    obj.edit100:setField("deflexaoCa2");
    obj.edit100:setFontSize(12);
    obj.edit100:setName("edit100");
    obj.edit100:setFontColor("white");

    obj.flowPart158 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart158:setParent(obj.flowLayout12);
    obj.flowPart158:setMinWidth(50);
    obj.flowPart158:setMaxWidth(60);
    obj.flowPart158:setHeight(20);
    obj.flowPart158:setName("flowPart158");
    obj.flowPart158:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart158:setVertAlign("leading");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.flowPart158);
    obj.checkBox17:setField("deflexaoCaSurp");
    obj.checkBox17:setText("Surpresa");
    obj.checkBox17:setFontSize(10);
    obj.checkBox17:setHeight(20);
    obj.checkBox17:setName("checkBox17");

    obj.flowPart159 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart159:setParent(obj.flowLayout12);
    obj.flowPart159:setMinWidth(50);
    obj.flowPart159:setMaxWidth(60);
    obj.flowPart159:setHeight(20);
    obj.flowPart159:setName("flowPart159");
    obj.flowPart159:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart159:setVertAlign("leading");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.flowPart159);
    obj.checkBox18:setField("deflexaoCaToque");
    obj.checkBox18:setText("Toque");
    obj.checkBox18:setFontSize(10);
    obj.checkBox18:setHeight(15);
    obj.checkBox18:setName("checkBox18");

    obj.flowLineBreak6 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout12);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flowPart160 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart160:setParent(obj.flowLayout12);
    obj.flowPart160:setMinWidth(50);
    obj.flowPart160:setMaxWidth(50);
    obj.flowPart160:setHeight(15);
    obj.flowPart160:setName("flowPart160");
    obj.flowPart160:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart160:setVertAlign("leading");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart160);
    obj.label30:setAlign("top");
    obj.label30:setFontSize(10);
    obj.label30:setText("Esquiva");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWordWrap(true);
    obj.label30:setTextTrimming("none");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");
    obj.label30:setFontColor("#D0D0D0");

    obj.flowPart161 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart161:setParent(obj.flowLayout12);
    obj.flowPart161:setMinWidth(50);
    obj.flowPart161:setMaxWidth(50);
    obj.flowPart161:setHeight(20);
    obj.flowPart161:setName("flowPart161");
    obj.flowPart161:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart161:setVertAlign("leading");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.flowPart161);
    obj.edit101:setAlign("client");
    obj.edit101:setField("esquivaCa");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setFontSize(12);
    obj.edit101:setType("number");
    obj.edit101:setName("edit101");
    obj.edit101:setFontColor("white");

    obj.flowPart162 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart162:setParent(obj.flowLayout12);
    obj.flowPart162:setMinWidth(140);
    obj.flowPart162:setMaxWidth(150);
    obj.flowPart162:setHeight(20);
    obj.flowPart162:setName("flowPart162");
    obj.flowPart162:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart162:setVertAlign("leading");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.flowPart162);
    obj.edit102:setAlign("client");
    obj.edit102:setField("esquivaCa2");
    obj.edit102:setFontSize(12);
    obj.edit102:setName("edit102");
    obj.edit102:setFontColor("white");

    obj.flowPart163 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart163:setParent(obj.flowLayout12);
    obj.flowPart163:setMinWidth(50);
    obj.flowPart163:setMaxWidth(60);
    obj.flowPart163:setHeight(20);
    obj.flowPart163:setName("flowPart163");
    obj.flowPart163:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart163:setVertAlign("leading");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.flowPart163);
    obj.checkBox19:setField("esquivaCaSurp");
    obj.checkBox19:setText("Surpresa");
    obj.checkBox19:setFontSize(10);
    obj.checkBox19:setHeight(20);
    obj.checkBox19:setName("checkBox19");

    obj.flowPart164 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart164:setParent(obj.flowLayout12);
    obj.flowPart164:setMinWidth(50);
    obj.flowPart164:setMaxWidth(60);
    obj.flowPart164:setHeight(20);
    obj.flowPart164:setName("flowPart164");
    obj.flowPart164:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart164:setVertAlign("leading");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.flowPart164);
    obj.checkBox20:setField("esquivaCaToque");
    obj.checkBox20:setText("Toque");
    obj.checkBox20:setFontSize(10);
    obj.checkBox20:setHeight(15);
    obj.checkBox20:setName("checkBox20");

    obj.flowLineBreak7 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout12);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart165 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart165:setParent(obj.flowLayout12);
    obj.flowPart165:setMinWidth(50);
    obj.flowPart165:setMaxWidth(50);
    obj.flowPart165:setHeight(15);
    obj.flowPart165:setName("flowPart165");
    obj.flowPart165:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart165:setVertAlign("leading");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart165);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(10);
    obj.label31:setText("Sorte");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");
    obj.label31:setFontColor("#D0D0D0");

    obj.flowPart166 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart166:setParent(obj.flowLayout12);
    obj.flowPart166:setMinWidth(50);
    obj.flowPart166:setMaxWidth(50);
    obj.flowPart166:setHeight(20);
    obj.flowPart166:setName("flowPart166");
    obj.flowPart166:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart166:setVertAlign("leading");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.flowPart166);
    obj.edit103:setAlign("client");
    obj.edit103:setField("sorteCa");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setFontSize(12);
    obj.edit103:setType("number");
    obj.edit103:setName("edit103");
    obj.edit103:setFontColor("white");

    obj.flowPart167 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart167:setParent(obj.flowLayout12);
    obj.flowPart167:setMinWidth(140);
    obj.flowPart167:setMaxWidth(150);
    obj.flowPart167:setHeight(20);
    obj.flowPart167:setName("flowPart167");
    obj.flowPart167:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart167:setVertAlign("leading");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.flowPart167);
    obj.edit104:setAlign("client");
    obj.edit104:setField("sorteCa2");
    obj.edit104:setFontSize(12);
    obj.edit104:setName("edit104");
    obj.edit104:setFontColor("white");

    obj.flowPart168 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart168:setParent(obj.flowLayout12);
    obj.flowPart168:setMinWidth(50);
    obj.flowPart168:setMaxWidth(60);
    obj.flowPart168:setHeight(20);
    obj.flowPart168:setName("flowPart168");
    obj.flowPart168:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart168:setVertAlign("leading");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.flowPart168);
    obj.checkBox21:setField("sorteCaSurp");
    obj.checkBox21:setText("Surpresa");
    obj.checkBox21:setFontSize(10);
    obj.checkBox21:setHeight(20);
    obj.checkBox21:setName("checkBox21");

    obj.flowPart169 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart169:setParent(obj.flowLayout12);
    obj.flowPart169:setMinWidth(50);
    obj.flowPart169:setMaxWidth(60);
    obj.flowPart169:setHeight(20);
    obj.flowPart169:setName("flowPart169");
    obj.flowPart169:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart169:setVertAlign("leading");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.flowPart169);
    obj.checkBox22:setField("sorteCaToque");
    obj.checkBox22:setText("Toque");
    obj.checkBox22:setFontSize(10);
    obj.checkBox22:setHeight(15);
    obj.checkBox22:setName("checkBox22");

    obj.flowLineBreak8 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout12);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.flowPart170 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart170:setParent(obj.flowLayout12);
    obj.flowPart170:setMinWidth(50);
    obj.flowPart170:setMaxWidth(50);
    obj.flowPart170:setHeight(15);
    obj.flowPart170:setName("flowPart170");
    obj.flowPart170:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart170:setVertAlign("leading");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart170);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(10);
    obj.label32:setText("Outros");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");
    obj.label32:setFontColor("#D0D0D0");

    obj.flowPart171 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart171:setParent(obj.flowLayout12);
    obj.flowPart171:setMinWidth(50);
    obj.flowPart171:setMaxWidth(50);
    obj.flowPart171:setHeight(20);
    obj.flowPart171:setName("flowPart171");
    obj.flowPart171:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart171:setVertAlign("leading");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.flowPart171);
    obj.edit105:setAlign("client");
    obj.edit105:setField("outrosCa");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setFontSize(12);
    obj.edit105:setType("number");
    obj.edit105:setName("edit105");
    obj.edit105:setFontColor("white");

    obj.flowPart172 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart172:setParent(obj.flowLayout12);
    obj.flowPart172:setMinWidth(140);
    obj.flowPart172:setMaxWidth(150);
    obj.flowPart172:setHeight(20);
    obj.flowPart172:setName("flowPart172");
    obj.flowPart172:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart172:setVertAlign("leading");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.flowPart172);
    obj.edit106:setAlign("client");
    obj.edit106:setField("outrosCa2");
    obj.edit106:setFontSize(12);
    obj.edit106:setName("edit106");
    obj.edit106:setFontColor("white");

    obj.flowPart173 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart173:setParent(obj.flowLayout12);
    obj.flowPart173:setMinWidth(50);
    obj.flowPart173:setMaxWidth(60);
    obj.flowPart173:setHeight(20);
    obj.flowPart173:setName("flowPart173");
    obj.flowPart173:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart173:setVertAlign("leading");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.flowPart173);
    obj.checkBox23:setField("outrosCaSurp");
    obj.checkBox23:setText("Surpresa");
    obj.checkBox23:setFontSize(10);
    obj.checkBox23:setHeight(20);
    obj.checkBox23:setName("checkBox23");

    obj.flowPart174 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart174:setParent(obj.flowLayout12);
    obj.flowPart174:setMinWidth(50);
    obj.flowPart174:setMaxWidth(60);
    obj.flowPart174:setHeight(20);
    obj.flowPart174:setName("flowPart174");
    obj.flowPart174:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart174:setVertAlign("leading");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.flowPart174);
    obj.checkBox24:setField("outrosCaToque");
    obj.checkBox24:setText("Toque");
    obj.checkBox24:setFontSize(10);
    obj.checkBox24:setHeight(15);
    obj.checkBox24:setName("checkBox24");

    obj.flowLineBreak9 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout12);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart175 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart175:setParent(obj.flowLayout12);
    obj.flowPart175:setMinWidth(50);
    obj.flowPart175:setMaxWidth(50);
    obj.flowPart175:setHeight(15);
    obj.flowPart175:setName("flowPart175");
    obj.flowPart175:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart175:setVertAlign("leading");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart175);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(10);
    obj.label33:setText("Variados");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");
    obj.label33:setFontColor("#D0D0D0");

    obj.flowPart176 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart176:setParent(obj.flowLayout12);
    obj.flowPart176:setMinWidth(50);
    obj.flowPart176:setMaxWidth(50);
    obj.flowPart176:setHeight(20);
    obj.flowPart176:setName("flowPart176");
    obj.flowPart176:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart176:setVertAlign("leading");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.flowPart176);
    obj.edit107:setAlign("client");
    obj.edit107:setField("variadosCa");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setFontSize(12);
    obj.edit107:setType("number");
    obj.edit107:setName("edit107");
    obj.edit107:setFontColor("white");

    obj.flowPart177 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart177:setParent(obj.flowLayout12);
    obj.flowPart177:setMinWidth(140);
    obj.flowPart177:setMaxWidth(150);
    obj.flowPart177:setHeight(20);
    obj.flowPart177:setName("flowPart177");
    obj.flowPart177:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart177:setVertAlign("leading");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.flowPart177);
    obj.edit108:setAlign("client");
    obj.edit108:setField("variadosCa2");
    obj.edit108:setFontSize(12);
    obj.edit108:setName("edit108");
    obj.edit108:setFontColor("white");

    obj.flowPart178 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart178:setParent(obj.flowLayout12);
    obj.flowPart178:setMinWidth(50);
    obj.flowPart178:setMaxWidth(60);
    obj.flowPart178:setHeight(20);
    obj.flowPart178:setName("flowPart178");
    obj.flowPart178:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart178:setVertAlign("leading");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.flowPart178);
    obj.checkBox25:setField("variadosCaSurp");
    obj.checkBox25:setText("Surpresa");
    obj.checkBox25:setFontSize(10);
    obj.checkBox25:setHeight(20);
    obj.checkBox25:setName("checkBox25");

    obj.flowPart179 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart179:setParent(obj.flowLayout12);
    obj.flowPart179:setMinWidth(50);
    obj.flowPart179:setMaxWidth(60);
    obj.flowPart179:setHeight(20);
    obj.flowPart179:setName("flowPart179");
    obj.flowPart179:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart179:setVertAlign("leading");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.flowPart179);
    obj.checkBox26:setField("variadosCaToque");
    obj.checkBox26:setText("Toque");
    obj.checkBox26:setFontSize(10);
    obj.checkBox26:setHeight(15);
    obj.checkBox26:setName("checkBox26");

    obj.flowLineBreak10 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout12);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.popGrapple = gui.fromHandle(_obj_newObject("popup"));
    obj.popGrapple:setParent(obj.scrollBox1);
    obj.popGrapple:setName("popGrapple");
    obj.popGrapple:setWidth(225);
    obj.popGrapple:setHeight(50);
    obj.popGrapple:setBackOpacity(0.4);

    obj.flowLayout13 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.popGrapple);
    obj.flowLayout13:setAlign("top");
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMaxControlsPerLine(4);
    obj.flowLayout13:setMargins({bottom=4});
    obj.flowLayout13:setHorzAlign("center");
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setVertAlign("leading");

    obj.flowPart180 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart180:setParent(obj.flowLayout13);
    obj.flowPart180:setMinWidth(50);
    obj.flowPart180:setMaxWidth(50);
    obj.flowPart180:setHeight(15);
    obj.flowPart180:setName("flowPart180");
    obj.flowPart180:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart180:setVertAlign("leading");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart180);
    obj.label34:setAlign("top");
    obj.label34:setFontSize(10);
    obj.label34:setText("BBA");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setWordWrap(true);
    obj.label34:setTextTrimming("none");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");
    obj.label34:setFontColor("#D0D0D0");

    obj.flowPart181 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart181:setParent(obj.flowLayout13);
    obj.flowPart181:setMinWidth(50);
    obj.flowPart181:setMaxWidth(50);
    obj.flowPart181:setHeight(15);
    obj.flowPart181:setName("flowPart181");
    obj.flowPart181:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart181:setVertAlign("leading");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart181);
    obj.label35:setAlign("top");
    obj.label35:setFontSize(10);
    obj.label35:setText("Força");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setWordWrap(true);
    obj.label35:setTextTrimming("none");
    obj.label35:setAutoSize(true);
    obj.label35:setName("label35");
    obj.label35:setFontColor("#D0D0D0");

    obj.flowPart182 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart182:setParent(obj.flowLayout13);
    obj.flowPart182:setMinWidth(50);
    obj.flowPart182:setMaxWidth(50);
    obj.flowPart182:setHeight(15);
    obj.flowPart182:setName("flowPart182");
    obj.flowPart182:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart182:setVertAlign("leading");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart182);
    obj.label36:setAlign("top");
    obj.label36:setFontSize(10);
    obj.label36:setText("Tamanho");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWordWrap(true);
    obj.label36:setTextTrimming("none");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");
    obj.label36:setFontColor("#D0D0D0");

    obj.flowPart183 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart183:setParent(obj.flowLayout13);
    obj.flowPart183:setMinWidth(50);
    obj.flowPart183:setMaxWidth(50);
    obj.flowPart183:setHeight(15);
    obj.flowPart183:setName("flowPart183");
    obj.flowPart183:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart183:setVertAlign("leading");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart183);
    obj.label37:setAlign("top");
    obj.label37:setFontSize(10);
    obj.label37:setText("Outros");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setWordWrap(true);
    obj.label37:setTextTrimming("none");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");
    obj.label37:setFontColor("#D0D0D0");

    obj.flowPart184 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart184:setParent(obj.flowLayout13);
    obj.flowPart184:setMinWidth(50);
    obj.flowPart184:setMaxWidth(50);
    obj.flowPart184:setHeight(20);
    obj.flowPart184:setName("flowPart184");
    obj.flowPart184:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart184:setVertAlign("leading");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.flowPart184);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart184);
    obj.label38:setAlign("client");
    obj.label38:setField("bba");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setFontSize(12);
    obj.label38:setName("label38");
    obj.label38:setFontColor("white");

    obj.flowPart185 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart185:setParent(obj.flowLayout13);
    obj.flowPart185:setMinWidth(50);
    obj.flowPart185:setMaxWidth(50);
    obj.flowPart185:setHeight(20);
    obj.flowPart185:setName("flowPart185");
    obj.flowPart185:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart185:setVertAlign("leading");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowPart185);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart185);
    obj.label39:setAlign("client");
    obj.label39:setField("efetModFor");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontSize(12);
    obj.label39:setName("label39");
    obj.label39:setFontColor("white");

    obj.flowPart186 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart186:setParent(obj.flowLayout13);
    obj.flowPart186:setMinWidth(50);
    obj.flowPart186:setMaxWidth(50);
    obj.flowPart186:setHeight(20);
    obj.flowPart186:setName("flowPart186");
    obj.flowPart186:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart186:setVertAlign("leading");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.flowPart186);
    obj.edit109:setAlign("client");
    obj.edit109:setField("agarrarTam");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setFontSize(12);
    obj.edit109:setType("number");
    obj.edit109:setName("edit109");
    obj.edit109:setFontColor("white");

    obj.flowPart187 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart187:setParent(obj.flowLayout13);
    obj.flowPart187:setMinWidth(50);
    obj.flowPart187:setMaxWidth(50);
    obj.flowPart187:setHeight(20);
    obj.flowPart187:setName("flowPart187");
    obj.flowPart187:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart187:setVertAlign("leading");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.flowPart187);
    obj.edit110:setAlign("client");
    obj.edit110:setField("agarrarVar");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setFontSize(12);
    obj.edit110:setType("number");
    obj.edit110:setName("edit110");
    obj.edit110:setFontColor("white");

    obj.popManeuver = gui.fromHandle(_obj_newObject("popup"));
    obj.popManeuver:setParent(obj.scrollBox1);
    obj.popManeuver:setName("popManeuver");
    obj.popManeuver:setWidth(380);
    obj.popManeuver:setHeight(65);
    obj.popManeuver:setBackOpacity(0.4);

    obj.flowLayout14 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.popManeuver);
    obj.flowLayout14:setAlign("top");
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxControlsPerLine(7);
    obj.flowLayout14:setMargins({bottom=4});
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setName("flowLayout14");
    obj.flowLayout14:setVertAlign("leading");

    obj.flowPart188 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart188:setParent(obj.flowLayout14);
    obj.flowPart188:setMinWidth(50);
    obj.flowPart188:setMaxWidth(50);
    obj.flowPart188:setHeight(15);
    obj.flowPart188:setName("flowPart188");
    obj.flowPart188:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart188:setVertAlign("leading");

    obj.flowPart189 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart189:setParent(obj.flowLayout14);
    obj.flowPart189:setMinWidth(50);
    obj.flowPart189:setMaxWidth(50);
    obj.flowPart189:setHeight(15);
    obj.flowPart189:setName("flowPart189");
    obj.flowPart189:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart189:setVertAlign("leading");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart189);
    obj.label40:setAlign("top");
    obj.label40:setFontSize(10);
    obj.label40:setText("BBA");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setWordWrap(true);
    obj.label40:setTextTrimming("none");
    obj.label40:setAutoSize(true);
    obj.label40:setName("label40");
    obj.label40:setFontColor("#D0D0D0");

    obj.flowPart190 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart190:setParent(obj.flowLayout14);
    obj.flowPart190:setMinWidth(50);
    obj.flowPart190:setMaxWidth(50);
    obj.flowPart190:setHeight(15);
    obj.flowPart190:setName("flowPart190");
    obj.flowPart190:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart190:setVertAlign("leading");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart190);
    obj.label41:setAlign("top");
    obj.label41:setFontSize(10);
    obj.label41:setText("Força");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setWordWrap(true);
    obj.label41:setTextTrimming("none");
    obj.label41:setAutoSize(true);
    obj.label41:setName("label41");
    obj.label41:setFontColor("#D0D0D0");

    obj.flowPart191 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart191:setParent(obj.flowLayout14);
    obj.flowPart191:setMinWidth(50);
    obj.flowPart191:setMaxWidth(50);
    obj.flowPart191:setHeight(15);
    obj.flowPart191:setName("flowPart191");
    obj.flowPart191:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart191:setVertAlign("leading");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart191);
    obj.label42:setAlign("top");
    obj.label42:setFontSize(10);
    obj.label42:setText("Tamanho");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setWordWrap(true);
    obj.label42:setTextTrimming("none");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");
    obj.label42:setFontColor("#D0D0D0");

    obj.flowPart192 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart192:setParent(obj.flowLayout14);
    obj.flowPart192:setMinWidth(50);
    obj.flowPart192:setMaxWidth(50);
    obj.flowPart192:setHeight(15);
    obj.flowPart192:setName("flowPart192");
    obj.flowPart192:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart192:setVertAlign("leading");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart192);
    obj.label43:setAlign("top");
    obj.label43:setFontSize(10);
    obj.label43:setText("Outros");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setWordWrap(true);
    obj.label43:setTextTrimming("none");
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");
    obj.label43:setFontColor("#D0D0D0");

    obj.flowPart193 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart193:setParent(obj.flowLayout14);
    obj.flowPart193:setMinWidth(50);
    obj.flowPart193:setMaxWidth(50);
    obj.flowPart193:setHeight(15);
    obj.flowPart193:setName("flowPart193");
    obj.flowPart193:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart193:setVertAlign("leading");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart193);
    obj.label44:setAlign("top");
    obj.label44:setFontSize(10);
    obj.label44:setText("Destreza");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setWordWrap(true);
    obj.label44:setTextTrimming("none");
    obj.label44:setAutoSize(true);
    obj.label44:setName("label44");
    obj.label44:setFontColor("#D0D0D0");

    obj.flowPart194 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart194:setParent(obj.flowLayout14);
    obj.flowPart194:setMinWidth(50);
    obj.flowPart194:setMaxWidth(50);
    obj.flowPart194:setHeight(15);
    obj.flowPart194:setName("flowPart194");
    obj.flowPart194:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart194:setVertAlign("leading");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart194);
    obj.label45:setAlign("top");
    obj.label45:setFontSize(10);
    obj.label45:setText("Diversos");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWordWrap(true);
    obj.label45:setTextTrimming("none");
    obj.label45:setAutoSize(true);
    obj.label45:setName("label45");
    obj.label45:setFontColor("#D0D0D0");

    obj.flowLineBreak11 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout14);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.flowPart195 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart195:setParent(obj.flowLayout14);
    obj.flowPart195:setMinWidth(50);
    obj.flowPart195:setMaxWidth(50);
    obj.flowPart195:setHeight(15);
    obj.flowPart195:setName("flowPart195");
    obj.flowPart195:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart195:setVertAlign("leading");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart195);
    obj.label46:setAlign("top");
    obj.label46:setFontSize(10);
    obj.label46:setText("BMC");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setWordWrap(true);
    obj.label46:setTextTrimming("none");
    obj.label46:setAutoSize(true);
    obj.label46:setName("label46");
    obj.label46:setFontColor("#D0D0D0");

    obj.flowPart196 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart196:setParent(obj.flowLayout14);
    obj.flowPart196:setMinWidth(50);
    obj.flowPart196:setMaxWidth(50);
    obj.flowPart196:setHeight(20);
    obj.flowPart196:setName("flowPart196");
    obj.flowPart196:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart196:setVertAlign("leading");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowPart196);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart196);
    obj.label47:setAlign("client");
    obj.label47:setField("bba");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontSize(12);
    obj.label47:setName("label47");
    obj.label47:setFontColor("white");

    obj.flowPart197 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart197:setParent(obj.flowLayout14);
    obj.flowPart197:setMinWidth(50);
    obj.flowPart197:setMaxWidth(50);
    obj.flowPart197:setHeight(20);
    obj.flowPart197:setName("flowPart197");
    obj.flowPart197:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart197:setVertAlign("leading");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.flowPart197);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart197);
    obj.label48:setAlign("client");
    obj.label48:setField("efetModFor");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setFontSize(12);
    obj.label48:setName("label48");
    obj.label48:setFontColor("white");

    obj.flowPart198 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart198:setParent(obj.flowLayout14);
    obj.flowPart198:setMinWidth(50);
    obj.flowPart198:setMaxWidth(50);
    obj.flowPart198:setHeight(20);
    obj.flowPart198:setName("flowPart198");
    obj.flowPart198:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart198:setVertAlign("leading");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.flowPart198);
    obj.edit111:setAlign("client");
    obj.edit111:setField("bmcTamanho");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setFontSize(12);
    obj.edit111:setType("number");
    obj.edit111:setName("edit111");
    obj.edit111:setFontColor("white");

    obj.flowPart199 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart199:setParent(obj.flowLayout14);
    obj.flowPart199:setMinWidth(50);
    obj.flowPart199:setMaxWidth(50);
    obj.flowPart199:setHeight(20);
    obj.flowPart199:setName("flowPart199");
    obj.flowPart199:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart199:setVertAlign("leading");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.flowPart199);
    obj.edit112:setAlign("client");
    obj.edit112:setField("bmcOutros");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setFontSize(12);
    obj.edit112:setType("number");
    obj.edit112:setName("edit112");
    obj.edit112:setFontColor("white");

    obj.flowPart200 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart200:setParent(obj.flowLayout14);
    obj.flowPart200:setMinWidth(50);
    obj.flowPart200:setMaxWidth(50);
    obj.flowPart200:setHeight(20);
    obj.flowPart200:setName("flowPart200");
    obj.flowPart200:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart200:setVertAlign("leading");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.flowPart200);
    obj.checkBox27:setField("destrezaBMC");
    obj.checkBox27:setLeft(15);
    obj.checkBox27:setFontSize(10);
    obj.checkBox27:setHeight(20);
    obj.checkBox27:setName("checkBox27");

    obj.flowPart201 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart201:setParent(obj.flowLayout14);
    obj.flowPart201:setMinWidth(50);
    obj.flowPart201:setMaxWidth(50);
    obj.flowPart201:setHeight(20);
    obj.flowPart201:setName("flowPart201");
    obj.flowPart201:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart201:setVertAlign("leading");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.flowPart201);
    obj.edit113:setAlign("client");
    obj.edit113:setField("bmcDiversos");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setFontSize(12);
    obj.edit113:setType("number");
    obj.edit113:setName("edit113");
    obj.edit113:setFontColor("white");

    obj.flowLineBreak12 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout14);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.flowPart202 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart202:setParent(obj.flowLayout14);
    obj.flowPart202:setMinWidth(50);
    obj.flowPart202:setMaxWidth(50);
    obj.flowPart202:setHeight(15);
    obj.flowPart202:setName("flowPart202");
    obj.flowPart202:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart202:setVertAlign("leading");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart202);
    obj.label49:setAlign("top");
    obj.label49:setFontSize(10);
    obj.label49:setText("BMD");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setWordWrap(true);
    obj.label49:setTextTrimming("none");
    obj.label49:setAutoSize(true);
    obj.label49:setName("label49");
    obj.label49:setFontColor("#D0D0D0");

    obj.flowPart203 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart203:setParent(obj.flowLayout14);
    obj.flowPart203:setMinWidth(50);
    obj.flowPart203:setMaxWidth(50);
    obj.flowPart203:setHeight(20);
    obj.flowPart203:setName("flowPart203");
    obj.flowPart203:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart203:setVertAlign("leading");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.flowPart203);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart203);
    obj.label50:setAlign("client");
    obj.label50:setField("bba");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setFontSize(12);
    obj.label50:setName("label50");
    obj.label50:setFontColor("white");

    obj.flowPart204 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart204:setParent(obj.flowLayout14);
    obj.flowPart204:setMinWidth(50);
    obj.flowPart204:setMaxWidth(50);
    obj.flowPart204:setHeight(20);
    obj.flowPart204:setName("flowPart204");
    obj.flowPart204:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart204:setVertAlign("leading");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.flowPart204);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart204);
    obj.label51:setAlign("client");
    obj.label51:setField("efetModFor");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setFontSize(12);
    obj.label51:setName("label51");
    obj.label51:setFontColor("white");

    obj.flowPart205 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart205:setParent(obj.flowLayout14);
    obj.flowPart205:setMinWidth(50);
    obj.flowPart205:setMaxWidth(50);
    obj.flowPart205:setHeight(20);
    obj.flowPart205:setName("flowPart205");
    obj.flowPart205:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart205:setVertAlign("leading");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.flowPart205);
    obj.edit114:setAlign("client");
    obj.edit114:setField("bmdTamanho");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setFontSize(12);
    obj.edit114:setType("number");
    obj.edit114:setName("edit114");
    obj.edit114:setFontColor("white");

    obj.flowPart206 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart206:setParent(obj.flowLayout14);
    obj.flowPart206:setMinWidth(50);
    obj.flowPart206:setMaxWidth(50);
    obj.flowPart206:setHeight(20);
    obj.flowPart206:setName("flowPart206");
    obj.flowPart206:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart206:setVertAlign("leading");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.flowPart206);
    obj.edit115:setAlign("client");
    obj.edit115:setField("bmdOutros");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setFontSize(12);
    obj.edit115:setType("number");
    obj.edit115:setName("edit115");
    obj.edit115:setFontColor("white");

    obj.flowPart207 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart207:setParent(obj.flowLayout14);
    obj.flowPart207:setMinWidth(50);
    obj.flowPart207:setMaxWidth(50);
    obj.flowPart207:setHeight(20);
    obj.flowPart207:setName("flowPart207");
    obj.flowPart207:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart207:setVertAlign("leading");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.flowPart207);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart207);
    obj.label52:setAlign("client");
    obj.label52:setField("efetModDes");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setFontSize(12);
    obj.label52:setName("label52");
    obj.label52:setFontColor("white");

    obj.flowPart208 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart208:setParent(obj.flowLayout14);
    obj.flowPart208:setMinWidth(50);
    obj.flowPart208:setMaxWidth(50);
    obj.flowPart208:setHeight(20);
    obj.flowPart208:setName("flowPart208");
    obj.flowPart208:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart208:setVertAlign("leading");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.flowPart208);
    obj.edit116:setAlign("client");
    obj.edit116:setField("bmdDiversos");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setFontSize(12);
    obj.edit116:setType("number");
    obj.edit116:setName("edit116");
    obj.edit116:setFontColor("white");


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
			


    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.scrollBox1);
    obj.rectangle14:setAlign("top");
    obj.rectangle14:setHeight(110);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle14);
    obj.label53:setLeft(5);
    obj.label53:setTop(5);
    obj.label53:setWidth(50);
    obj.label53:setHeight(25);
    obj.label53:setText("CLASSE");
    obj.label53:setName("label53");
    obj.label53:setFontColor("white");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.rectangle14);
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(60);
    obj.edit117:setTop(5);
    obj.edit117:setWidth(380);
    obj.edit117:setHeight(25);
    obj.edit117:setField("classe1");
    obj.edit117:setName("edit117");
    obj.edit117:setFontSize(15);
    obj.edit117:setFontColor("white");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle14);
    obj.label54:setLeft(5);
    obj.label54:setTop(30);
    obj.label54:setWidth(50);
    obj.label54:setHeight(25);
    obj.label54:setText("RAÇA");
    obj.label54:setName("label54");
    obj.label54:setFontColor("white");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.rectangle14);
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(60);
    obj.edit118:setTop(30);
    obj.edit118:setWidth(380);
    obj.edit118:setHeight(25);
    obj.edit118:setField("raca");
    obj.edit118:setName("edit118");
    obj.edit118:setFontSize(15);
    obj.edit118:setFontColor("white");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle14);
    obj.label55:setLeft(5);
    obj.label55:setTop(55);
    obj.label55:setWidth(50);
    obj.label55:setHeight(25);
    obj.label55:setText("TIPO");
    obj.label55:setName("label55");
    obj.label55:setFontColor("white");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.rectangle14);
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(60);
    obj.edit119:setTop(55);
    obj.edit119:setWidth(380);
    obj.edit119:setHeight(25);
    obj.edit119:setField("tipo");
    obj.edit119:setName("edit119");
    obj.edit119:setFontSize(15);
    obj.edit119:setFontColor("white");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle14);
    obj.label56:setLeft(5);
    obj.label56:setTop(80);
    obj.label56:setWidth(70);
    obj.label56:setHeight(25);
    obj.label56:setText("SUBTIPO");
    obj.label56:setName("label56");
    obj.label56:setFontColor("white");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.rectangle14);
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(60);
    obj.edit120:setTop(80);
    obj.edit120:setWidth(380);
    obj.edit120:setHeight(25);
    obj.edit120:setField("subtipo");
    obj.edit120:setName("edit120");
    obj.edit120:setFontSize(15);
    obj.edit120:setFontColor("white");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle14);
    obj.label57:setLeft(445);
    obj.label57:setTop(5);
    obj.label57:setWidth(50);
    obj.label57:setHeight(25);
    obj.label57:setText("NOME");
    obj.label57:setName("label57");
    obj.label57:setFontColor("white");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.rectangle14);
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(520);
    obj.edit121:setTop(5);
    obj.edit121:setWidth(290);
    obj.edit121:setHeight(25);
    obj.edit121:setField("nome");
    obj.edit121:setName("edit121");
    obj.edit121:setFontSize(15);
    obj.edit121:setFontColor("white");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle14);
    obj.label58:setLeft(445);
    obj.label58:setTop(30);
    obj.label58:setWidth(70);
    obj.label58:setHeight(25);
    obj.label58:setText("TENDÊNCIA");
    obj.label58:setName("label58");
    obj.label58:setFontColor("white");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.rectangle14);
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(520);
    obj.edit122:setTop(30);
    obj.edit122:setWidth(290);
    obj.edit122:setHeight(25);
    obj.edit122:setField("tendencia");
    obj.edit122:setName("edit122");
    obj.edit122:setFontSize(15);
    obj.edit122:setFontColor("white");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle14);
    obj.label59:setLeft(445);
    obj.label59:setTop(55);
    obj.label59:setWidth(70);
    obj.label59:setHeight(25);
    obj.label59:setText("CULTO");
    obj.label59:setName("label59");
    obj.label59:setFontColor("white");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.rectangle14);
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(520);
    obj.edit123:setTop(55);
    obj.edit123:setWidth(290);
    obj.edit123:setHeight(25);
    obj.edit123:setField("culto");
    obj.edit123:setName("edit123");
    obj.edit123:setFontSize(15);
    obj.edit123:setFontColor("white");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle14);
    obj.label60:setLeft(445);
    obj.label60:setTop(80);
    obj.label60:setWidth(70);
    obj.label60:setHeight(25);
    obj.label60:setText("TITULO");
    obj.label60:setName("label60");
    obj.label60:setFontColor("white");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.rectangle14);
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(520);
    obj.edit124:setTop(80);
    obj.edit124:setWidth(290);
    obj.edit124:setHeight(25);
    obj.edit124:setField("posto");
    obj.edit124:setName("edit124");
    obj.edit124:setFontSize(15);
    obj.edit124:setFontColor("white");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle14);
    obj.label61:setLeft(815);
    obj.label61:setTop(5);
    obj.label61:setWidth(70);
    obj.label61:setHeight(25);
    obj.label61:setText("NEP");
    obj.label61:setName("label61");
    obj.label61:setFontColor("white");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle14);
    obj.rectangle15:setLeft(890);
    obj.rectangle15:setTop(5);
    obj.rectangle15:setWidth(70);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle14);
    obj.label62:setField("nep");
    obj.label62:setLeft(890);
    obj.label62:setTop(5);
    obj.label62:setWidth(70);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");
    obj.label62:setFontColor("white");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle14);
    obj.label63:setLeft(975);
    obj.label63:setTop(5);
    obj.label63:setWidth(60);
    obj.label63:setHeight(25);
    obj.label63:setText("AJUSTE");
    obj.label63:setName("label63");
    obj.label63:setFontColor("white");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.rectangle14);
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(1030);
    obj.edit125:setTop(5);
    obj.edit125:setWidth(70);
    obj.edit125:setHeight(25);
    obj.edit125:setField("ajuste");
    obj.edit125:setName("edit125");
    obj.edit125:setFontSize(15);
    obj.edit125:setFontColor("white");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle14);
    obj.label64:setLeft(815);
    obj.label64:setTop(30);
    obj.label64:setWidth(70);
    obj.label64:setHeight(25);
    obj.label64:setText("XP ATUAL");
    obj.label64:setName("label64");
    obj.label64:setFontColor("white");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.rectangle14);
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(890);
    obj.edit126:setTop(30);
    obj.edit126:setWidth(210);
    obj.edit126:setHeight(25);
    obj.edit126:setField("xpAtual");
    obj.edit126:setName("edit126");
    obj.edit126:setFontSize(15);
    obj.edit126:setFontColor("white");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle14);
    obj.button1:setLeft(815);
    obj.button1:setTop(56);
    obj.button1:setWidth(50);
    obj.button1:setText("ADD");
    obj.button1:setName("button1");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.rectangle14);
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(890);
    obj.edit127:setTop(55);
    obj.edit127:setWidth(210);
    obj.edit127:setHeight(25);
    obj.edit127:setField("xpNova");
    obj.edit127:setName("edit127");
    obj.edit127:setFontSize(15);
    obj.edit127:setFontColor("white");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle14);
    obj.label65:setLeft(815);
    obj.label65:setTop(80);
    obj.label65:setWidth(70);
    obj.label65:setHeight(25);
    obj.label65:setText("XP ALVO");
    obj.label65:setName("label65");
    obj.label65:setFontColor("white");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle14);
    obj.rectangle16:setLeft(890);
    obj.rectangle16:setTop(80);
    obj.rectangle16:setWidth(210);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle14);
    obj.label66:setField("xpNivel");
    obj.label66:setLeft(890);
    obj.label66:setTop(80);
    obj.label66:setWidth(210);
    obj.label66:setHeight(25);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");
    obj.label66:setFontColor("white");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle14);
    obj.dataLink16:setField("xpAtual");
    obj.dataLink16:setName("dataLink16");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.scrollBox1);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle17);
    obj.rectangle18:setName("rectangle18");
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("#40000000");
    obj.rectangle18:setXradius(10);
    obj.rectangle18:setYradius(10);

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle18);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.fraFrenteLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraFrenteLayout:setParent(obj.scrollBox2);
    obj.fraFrenteLayout:setAlign("top");
    obj.fraFrenteLayout:setHeight(500);
    obj.fraFrenteLayout:setMargins({left=10, right=10, top=10});
    obj.fraFrenteLayout:setAutoHeight(true);
    obj.fraFrenteLayout:setHorzAlign("center");
    obj.fraFrenteLayout:setLineSpacing(2);
    obj.fraFrenteLayout:setName("fraFrenteLayout");
    obj.fraFrenteLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraFrenteLayout:setMinScaledWidth(300);
    obj.fraFrenteLayout:setVertAlign("leading");

    obj.flowLayout15 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.fraFrenteLayout);
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setMinScaledWidth(290);
    obj.flowLayout15:setHorzAlign("center");
    obj.flowLayout15:setName("flowLayout15");
    obj.flowLayout15:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout15:setVertAlign("leading");

    obj.flwNome1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwNome1:setParent(obj.flowLayout15);
    obj.flwNome1:setName("flwNome1");
    obj.flwNome1:setMinWidth(320);
    obj.flwNome1:setMaxWidth(1600);
    obj.flwNome1:setFrameStyle("frames/banner/dragon.xml");
    obj.flwNome1:setHeight(175);
    obj.flwNome1:setVertAlign("center");
    obj.flwNome1:setAvoidScale(true);
    obj.flwNome1:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layNomeHolderFrente = gui.fromHandle(_obj_newObject("layout"));
    obj.layNomeHolderFrente:setParent(obj.flwNome1);
    obj.layNomeHolderFrente:setAlign("client");
    obj.layNomeHolderFrente:setName("layNomeHolderFrente");

    obj.edtNome1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtNome1:setParent(obj.layNomeHolderFrente);
    obj.edtNome1:setName("edtNome1");
    obj.edtNome1:setField("nome");
    obj.edtNome1:setFontSize(17);
    obj.edtNome1:setAlign("client");
    obj.edtNome1:setFontColor("white");
    obj.edtNome1:setVertTextAlign("center");
    obj.edtNome1:setTransparent(true);

    obj.labNome1 = gui.fromHandle(_obj_newObject("label"));
    obj.labNome1:setParent(obj.layNomeHolderFrente);
    obj.labNome1:setMargins({left=3});
    obj.labNome1:setName("labNome1");
    obj.labNome1:setAlign("bottom");
    obj.labNome1:setText("NOME DO PERSONAGEM");
    obj.labNome1:setAutoSize(true);
    obj.labNome1:setFontSize(12);
    obj.labNome1:setFontColor("#D0D0D0");

    obj.fraUpperGridFrente = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridFrente:setParent(obj.flowLayout15);
    obj.fraUpperGridFrente:setMinWidth(320);
    obj.fraUpperGridFrente:setMaxWidth(1600);
    obj.fraUpperGridFrente:setName("fraUpperGridFrente");
    obj.fraUpperGridFrente:setAvoidScale(true);
    obj.fraUpperGridFrente:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridFrente:setAutoHeight(true);
    obj.fraUpperGridFrente:setVertAlign("trailing");
    obj.fraUpperGridFrente:setMaxControlsPerLine(3);
    obj.fraUpperGridFrente:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo1:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo1:setHeight(50);
    obj.UpperGridCampo1:setMinScaledWidth(100);
    obj.UpperGridCampo1:setMinWidth(100);
    obj.UpperGridCampo1:setMaxWidth(233);
    obj.UpperGridCampo1:setMaxScaledWidth(233);
    obj.UpperGridCampo1:setAvoidScale(true);
    obj.UpperGridCampo1:setName("UpperGridCampo1");
    obj.UpperGridCampo1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo1:setVertAlign("leading");

    obj.edtUpperGridCampo1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.edtUpperGridCampo1:setName("edtUpperGridCampo1");
    obj.edtUpperGridCampo1:setAlign("top");
    obj.edtUpperGridCampo1:setField("classeENivel");
    obj.edtUpperGridCampo1:setFontSize(13);
    obj.edtUpperGridCampo1:setHeight(30);
    obj.edtUpperGridCampo1:setTransparent(true);
    obj.edtUpperGridCampo1:setVertTextAlign("trailing");
    obj.edtUpperGridCampo1:setWidth(195);
    obj.edtUpperGridCampo1:setFontColor("white");

    obj.linUpperGridCampo1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.linUpperGridCampo1:setName("linUpperGridCampo1");
    obj.linUpperGridCampo1:setAlign("top");
    obj.linUpperGridCampo1:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo1:setStrokeSize(1);

    obj.labUpperGridCampo1 = gui.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.labUpperGridCampo1:setName("labUpperGridCampo1");
    obj.labUpperGridCampo1:setAlign("top");
    obj.labUpperGridCampo1:setText("CLASSE E NIVEL");
    obj.labUpperGridCampo1:setVertTextAlign("leading");
    obj.labUpperGridCampo1:setWordWrap(true);
    obj.labUpperGridCampo1:setTextTrimming("none");
    obj.labUpperGridCampo1:setFontSize(12);
    obj.labUpperGridCampo1:setFontColor("#D0D0D0");

    self.UpperGridCampo1:setHeight(self.edtUpperGridCampo1:getHeight() + self.labUpperGridCampo1:getHeight() + self.linUpperGridCampo1:getHeight());


    obj.UpperGridCampo2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo2:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo2:setHeight(50);
    obj.UpperGridCampo2:setMinScaledWidth(100);
    obj.UpperGridCampo2:setMinWidth(100);
    obj.UpperGridCampo2:setMaxWidth(233);
    obj.UpperGridCampo2:setMaxScaledWidth(233);
    obj.UpperGridCampo2:setAvoidScale(true);
    obj.UpperGridCampo2:setName("UpperGridCampo2");
    obj.UpperGridCampo2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo2:setVertAlign("leading");

    obj.edtUpperGridCampo2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.edtUpperGridCampo2:setName("edtUpperGridCampo2");
    obj.edtUpperGridCampo2:setAlign("top");
    obj.edtUpperGridCampo2:setField("antecedentes");
    obj.edtUpperGridCampo2:setFontSize(13);
    obj.edtUpperGridCampo2:setHeight(30);
    obj.edtUpperGridCampo2:setTransparent(true);
    obj.edtUpperGridCampo2:setVertTextAlign("trailing");
    obj.edtUpperGridCampo2:setWidth(195);
    obj.edtUpperGridCampo2:setFontColor("white");

    obj.linUpperGridCampo2 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.linUpperGridCampo2:setName("linUpperGridCampo2");
    obj.linUpperGridCampo2:setAlign("top");
    obj.linUpperGridCampo2:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo2:setStrokeSize(1);

    obj.labUpperGridCampo2 = gui.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.labUpperGridCampo2:setName("labUpperGridCampo2");
    obj.labUpperGridCampo2:setAlign("top");
    obj.labUpperGridCampo2:setText("ANTECEDENTES");
    obj.labUpperGridCampo2:setVertTextAlign("leading");
    obj.labUpperGridCampo2:setWordWrap(true);
    obj.labUpperGridCampo2:setTextTrimming("none");
    obj.labUpperGridCampo2:setFontSize(12);
    obj.labUpperGridCampo2:setFontColor("#D0D0D0");

    self.UpperGridCampo2:setHeight(self.edtUpperGridCampo2:getHeight() + self.labUpperGridCampo2:getHeight() + self.linUpperGridCampo2:getHeight());


    obj.UpperGridCampo3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo3:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo3:setHeight(50);
    obj.UpperGridCampo3:setMinScaledWidth(100);
    obj.UpperGridCampo3:setMinWidth(100);
    obj.UpperGridCampo3:setMaxWidth(233);
    obj.UpperGridCampo3:setMaxScaledWidth(233);
    obj.UpperGridCampo3:setAvoidScale(true);
    obj.UpperGridCampo3:setName("UpperGridCampo3");
    obj.UpperGridCampo3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo3:setVertAlign("leading");

    obj.edtUpperGridCampo3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.edtUpperGridCampo3:setName("edtUpperGridCampo3");
    obj.edtUpperGridCampo3:setAlign("top");
    obj.edtUpperGridCampo3:setField("nomeDoJogador");
    obj.edtUpperGridCampo3:setFontSize(13);
    obj.edtUpperGridCampo3:setHeight(30);
    obj.edtUpperGridCampo3:setTransparent(true);
    obj.edtUpperGridCampo3:setVertTextAlign("trailing");
    obj.edtUpperGridCampo3:setWidth(195);
    obj.edtUpperGridCampo3:setFontColor("white");

    obj.linUpperGridCampo3 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.linUpperGridCampo3:setName("linUpperGridCampo3");
    obj.linUpperGridCampo3:setAlign("top");
    obj.linUpperGridCampo3:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo3:setStrokeSize(1);

    obj.labUpperGridCampo3 = gui.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.labUpperGridCampo3:setName("labUpperGridCampo3");
    obj.labUpperGridCampo3:setAlign("top");
    obj.labUpperGridCampo3:setText("JOGADOR");
    obj.labUpperGridCampo3:setVertTextAlign("leading");
    obj.labUpperGridCampo3:setWordWrap(true);
    obj.labUpperGridCampo3:setTextTrimming("none");
    obj.labUpperGridCampo3:setFontSize(12);
    obj.labUpperGridCampo3:setFontColor("#D0D0D0");

    self.UpperGridCampo3:setHeight(self.edtUpperGridCampo3:getHeight() + self.labUpperGridCampo3:getHeight() + self.linUpperGridCampo3:getHeight());


    obj.UpperGridCampo4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo4:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo4:setHeight(50);
    obj.UpperGridCampo4:setMinScaledWidth(100);
    obj.UpperGridCampo4:setMinWidth(100);
    obj.UpperGridCampo4:setMaxWidth(233);
    obj.UpperGridCampo4:setMaxScaledWidth(233);
    obj.UpperGridCampo4:setAvoidScale(true);
    obj.UpperGridCampo4:setName("UpperGridCampo4");
    obj.UpperGridCampo4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo4:setVertAlign("leading");

    obj.edtUpperGridCampo4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.edtUpperGridCampo4:setName("edtUpperGridCampo4");
    obj.edtUpperGridCampo4:setAlign("top");
    obj.edtUpperGridCampo4:setField("raca");
    obj.edtUpperGridCampo4:setFontSize(13);
    obj.edtUpperGridCampo4:setHeight(30);
    obj.edtUpperGridCampo4:setTransparent(true);
    obj.edtUpperGridCampo4:setVertTextAlign("trailing");
    obj.edtUpperGridCampo4:setWidth(195);
    obj.edtUpperGridCampo4:setFontColor("white");

    obj.linUpperGridCampo4 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.linUpperGridCampo4:setName("linUpperGridCampo4");
    obj.linUpperGridCampo4:setAlign("top");
    obj.linUpperGridCampo4:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo4:setStrokeSize(1);

    obj.labUpperGridCampo4 = gui.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.labUpperGridCampo4:setName("labUpperGridCampo4");
    obj.labUpperGridCampo4:setAlign("top");
    obj.labUpperGridCampo4:setText("RAÇA");
    obj.labUpperGridCampo4:setVertTextAlign("leading");
    obj.labUpperGridCampo4:setWordWrap(true);
    obj.labUpperGridCampo4:setTextTrimming("none");
    obj.labUpperGridCampo4:setFontSize(12);
    obj.labUpperGridCampo4:setFontColor("#D0D0D0");

    self.UpperGridCampo4:setHeight(self.edtUpperGridCampo4:getHeight() + self.labUpperGridCampo4:getHeight() + self.linUpperGridCampo4:getHeight());


    obj.UpperGridCampo5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo5:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo5:setHeight(50);
    obj.UpperGridCampo5:setMinScaledWidth(100);
    obj.UpperGridCampo5:setMinWidth(100);
    obj.UpperGridCampo5:setMaxWidth(233);
    obj.UpperGridCampo5:setMaxScaledWidth(233);
    obj.UpperGridCampo5:setAvoidScale(true);
    obj.UpperGridCampo5:setName("UpperGridCampo5");
    obj.UpperGridCampo5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo5:setVertAlign("leading");

    obj.edtUpperGridCampo5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.edtUpperGridCampo5:setName("edtUpperGridCampo5");
    obj.edtUpperGridCampo5:setAlign("top");
    obj.edtUpperGridCampo5:setField("tendencia");
    obj.edtUpperGridCampo5:setFontSize(13);
    obj.edtUpperGridCampo5:setHeight(30);
    obj.edtUpperGridCampo5:setTransparent(true);
    obj.edtUpperGridCampo5:setVertTextAlign("trailing");
    obj.edtUpperGridCampo5:setWidth(195);
    obj.edtUpperGridCampo5:setFontColor("white");

    obj.linUpperGridCampo5 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.linUpperGridCampo5:setName("linUpperGridCampo5");
    obj.linUpperGridCampo5:setAlign("top");
    obj.linUpperGridCampo5:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo5:setStrokeSize(1);

    obj.labUpperGridCampo5 = gui.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.labUpperGridCampo5:setName("labUpperGridCampo5");
    obj.labUpperGridCampo5:setAlign("top");
    obj.labUpperGridCampo5:setText("TENDÊNCIA");
    obj.labUpperGridCampo5:setVertTextAlign("leading");
    obj.labUpperGridCampo5:setWordWrap(true);
    obj.labUpperGridCampo5:setTextTrimming("none");
    obj.labUpperGridCampo5:setFontSize(12);
    obj.labUpperGridCampo5:setFontColor("#D0D0D0");

    self.UpperGridCampo5:setHeight(self.edtUpperGridCampo5:getHeight() + self.labUpperGridCampo5:getHeight() + self.linUpperGridCampo5:getHeight());


    obj.UpperGridCampo6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo6:setParent(obj.fraUpperGridFrente);
    obj.UpperGridCampo6:setHeight(50);
    obj.UpperGridCampo6:setMinScaledWidth(100);
    obj.UpperGridCampo6:setMinWidth(100);
    obj.UpperGridCampo6:setMaxWidth(233);
    obj.UpperGridCampo6:setMaxScaledWidth(233);
    obj.UpperGridCampo6:setAvoidScale(true);
    obj.UpperGridCampo6:setName("UpperGridCampo6");
    obj.UpperGridCampo6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo6:setVertAlign("leading");

    obj.edtUpperGridCampo6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.edtUpperGridCampo6:setName("edtUpperGridCampo6");
    obj.edtUpperGridCampo6:setAlign("top");
    obj.edtUpperGridCampo6:setField("experiencia.valor");
    obj.edtUpperGridCampo6:setFontSize(13);
    obj.edtUpperGridCampo6:setHeight(30);
    obj.edtUpperGridCampo6:setTransparent(true);
    obj.edtUpperGridCampo6:setVertTextAlign("trailing");
    obj.edtUpperGridCampo6:setWidth(195);
    obj.edtUpperGridCampo6:setFontColor("white");

    obj.linUpperGridCampo6 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.linUpperGridCampo6:setName("linUpperGridCampo6");
    obj.linUpperGridCampo6:setAlign("top");
    obj.linUpperGridCampo6:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo6:setStrokeSize(1);

    obj.labUpperGridCampo6 = gui.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.labUpperGridCampo6:setName("labUpperGridCampo6");
    obj.labUpperGridCampo6:setAlign("top");
    obj.labUpperGridCampo6:setText("EXPERIÊNCIA");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.flowLineBreak13 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.flowLayout16 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.fraFrenteLayout);
    obj.flowLayout16:setHorzAlign("justify");
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setAvoidScale(true);
    obj.flowLayout16:setName("flowLayout16");
    obj.flowLayout16:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout16:setMinScaledWidth(300);
    obj.flowLayout16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout16:setVertAlign("leading");

    obj.flowPart209 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart209:setParent(obj.flowLayout16);
    obj.flowPart209:setMinWidth(280);
    obj.flowPart209:setMaxWidth(800);
    obj.flowPart209:setHeight(64);
    obj.flowPart209:setFrameStyle("frames/posCaptionEdit1/frame.xml");
    obj.flowPart209:setName("flowPart209");
    obj.flowPart209:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart209:setVertAlign("leading");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.flowPart209);
    obj.edit128:setAlign("left");
    obj.edit128:setField("inspiracao");
    obj.edit128:setWidth(65);
    obj.edit128:setName("edit128");
    obj.edit128:setTransparent(true);
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setFontSize(15);
    obj.edit128:setFontColor("white");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart209);
    obj.label67:setAlign("client");
    obj.label67:setText("INSPIRAÇÃO");
    obj.label67:setMargins({left=10});
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");
    obj.label67:setFontSize(12);
    obj.label67:setFontColor("#D0D0D0");

    obj.flowPart210 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart210:setParent(obj.flowLayout16);
    obj.flowPart210:setMinWidth(280);
    obj.flowPart210:setMaxWidth(800);
    obj.flowPart210:setHeight(64);
    obj.flowPart210:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart210:setName("flowPart210");
    obj.flowPart210:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart210:setVertAlign("leading");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.flowPart210);
    obj.edit129:setAlign("left");
    obj.edit129:setField("bonusProficiencia");
    obj.edit129:setWidth(70);
    obj.edit129:setName("edit129");
    obj.edit129:setTransparent(true);
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setFontSize(15);
    obj.edit129:setFontColor("white");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart210);
    obj.label68:setAlign("client");
    obj.label68:setText("BONUS DE PROFICIÊNCIA");
    obj.label68:setMargins({left=10});
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");
    obj.label68:setFontSize(12);
    obj.label68:setFontColor("#D0D0D0");

    obj.flowPart211 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart211:setParent(obj.flowLayout16);
    obj.flowPart211:setMinWidth(280);
    obj.flowPart211:setMaxWidth(800);
    obj.flowPart211:setHeight(64);
    obj.flowPart211:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart211:setName("flowPart211");
    obj.flowPart211:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart211:setVertAlign("leading");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.flowPart211);
    obj.edit130:setAlign("left");
    obj.edit130:setField("sabedoriaPassiva");
    obj.edit130:setWidth(70);
    obj.edit130:setName("edit130");
    obj.edit130:setTransparent(true);
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setFontSize(15);
    obj.edit130:setFontColor("white");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart211);
    obj.label69:setAlign("client");
    obj.label69:setText("SABEDORIA PASSIVA (PERCEPÇÃO)");
    obj.label69:setTextTrimming("none");
    obj.label69:setWordWrap(true);
    obj.label69:setMargins({left=10});
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");
    obj.label69:setFontSize(12);
    obj.label69:setFontColor("#D0D0D0");

    obj.flowLineBreak14 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.flowLayout17 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.fraFrenteLayout);
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setMinScaledWidth(290);
    obj.flowLayout17:setHorzAlign("center");
    obj.flowLayout17:setName("flowLayout17");
    obj.flowLayout17:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout17:setVertAlign("leading");

    obj.fraLayAtributos = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayAtributos:setParent(obj.flowLayout17);
    obj.fraLayAtributos:setName("fraLayAtributos");
    obj.fraLayAtributos:setVertAlign("leading");
    obj.fraLayAtributos:setAutoHeight(true);
    obj.fraLayAtributos:setMinScaledWidth(290);
    obj.fraLayAtributos:setMaxControlsPerLine(3);
    obj.fraLayAtributos:setHorzAlign("center");
    obj.fraLayAtributos:setLineSpacing(10);
    obj.fraLayAtributos:setFrameStyle("frames/panel1/frame.xml");
    obj.fraLayAtributos:setMargins({left=2, top=2, right=16, bottom=4});
    obj.fraLayAtributos:setAvoidScale(true);
    obj.fraLayAtributos:setStepSizes({310, 420, 640, 760, 1150});

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.fraLayAtributos);
    obj.dataLink17:setField("atributos.forca");
    obj.dataLink17:setName("dataLink17");

    obj.flowPart212 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart212:setParent(obj.fraLayAtributos);
    obj.flowPart212:setHeight(140);
    obj.flowPart212:setMinWidth(320);
    obj.flowPart212:setMaxWidth(420);
    obj.flowPart212:setMinScaledWidth(305);
    obj.flowPart212:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart212:setName("flowPart212");
    obj.flowPart212:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart212:setVertAlign("leading");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart212);
    obj.layout1:setLeft(6);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(116);
    obj.layout1:setHeight(115);
    obj.layout1:setName("layout1");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout1);
    obj.edit131:setAlign("top");
    obj.edit131:setMargins({left=30, right=30});
    obj.edit131:setField("atributos.forca");
    obj.edit131:setHeight(30);
    obj.edit131:setType("number");
    obj.edit131:setMin(0);
    obj.edit131:setMax(99);
    obj.edit131:setName("edit131");
    obj.edit131:setTransparent(true);
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setFontSize(15);
    obj.edit131:setFontColor("white");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart212);
    obj.label70:setFrameRegion("modificador");
    obj.label70:setField("atributos.modforcastr");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setVertTextAlign("center");
    obj.label70:setFontSize(46);
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setName("label70");
    obj.label70:setFontColor("white");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart212);
    obj.label71:setFrameRegion("titulo");
    obj.label71:setText("FORÇA");
    obj.label71:setVertTextAlign("center");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");
    obj.label71:setFontColor("white");

    obj.flowLayout18 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowPart212);
    obj.flowLayout18:setFrameRegion("RegiaoDePericias");
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setLineSpacing(0);
    obj.flowLayout18:setHorzAlign("leading");
    obj.flowLayout18:setName("flowLayout18");
    obj.flowLayout18:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout18:setVertAlign("leading");

    obj.flowPart213 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart213:setParent(obj.flowLayout18);
    obj.flowPart213:setMinWidth(206);
    obj.flowPart213:setMaxWidth(250);
    obj.flowPart213:setHeight(17);
    obj.flowPart213:setName("flowPart213");
    obj.flowPart213:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart213:setVertAlign("leading");

    obj.imageCheckBox1 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.flowPart213);
    obj.imageCheckBox1:setAlign("left");
    obj.imageCheckBox1:setWidth(20);
    obj.imageCheckBox1:setMargins({});
    obj.imageCheckBox1:setField("resistencias.forca");
    obj.imageCheckBox1:setOptimize(false);
    obj.imageCheckBox1:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox1:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox1:setName("imageCheckBox1");
    obj.imageCheckBox1:setHeight(20);

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart213);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(26);
    obj.layout2:setMargins({left=2});
    obj.layout2:setName("layout2");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout2);
    obj.label72:setField("resistencias.bonusforcastr");
    obj.label72:setAlign("client");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setVertTextAlign("trailing");
    obj.label72:setTextTrimming("none");
    obj.label72:setName("label72");
    obj.label72:setFontColor("white");

    obj.horzLine1 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout2);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setName("horzLine1");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowPart213);
    obj.label73:setAlign("client");
    obj.label73:setText("Teste de Resistência");
    obj.label73:setVertTextAlign("trailing");
    obj.label73:setMargins({left=5});
    obj.label73:setAutoSize(true);
    obj.label73:setWordWrap(false);
    obj.label73:setName("label73");
    obj.label73:setFontColor("white");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.flowLayout18);
    obj.dataLink18:setFields({'atributos.modforca', 'bonusProficiencia', 'resistencias.forca'});
    obj.dataLink18:setName("dataLink18");

    obj.flowPart214 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart214:setParent(obj.flowLayout18);
    obj.flowPart214:setMinWidth(206);
    obj.flowPart214:setMaxWidth(250);
    obj.flowPart214:setHeight(17);
    obj.flowPart214:setName("flowPart214");
    obj.flowPart214:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart214:setVertAlign("leading");

    obj.imageCheckBox2 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.flowPart214);
    obj.imageCheckBox2:setAlign("left");
    obj.imageCheckBox2:setWidth(20);
    obj.imageCheckBox2:setMargins({});
    obj.imageCheckBox2:setField("pericias.atletismo");
    obj.imageCheckBox2:setOptimize(false);
    obj.imageCheckBox2:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox2:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox2:setName("imageCheckBox2");
    obj.imageCheckBox2:setHeight(20);

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart214);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(26);
    obj.layout3:setMargins({left=2});
    obj.layout3:setName("layout3");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout3);
    obj.label74:setField("pericias.bonusatletismostr");
    obj.label74:setAlign("client");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setVertTextAlign("trailing");
    obj.label74:setTextTrimming("none");
    obj.label74:setName("label74");
    obj.label74:setFontColor("white");

    obj.horzLine2 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout3);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setName("horzLine2");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowPart214);
    obj.label75:setAlign("client");
    obj.label75:setText("Atletismo");
    obj.label75:setVertTextAlign("trailing");
    obj.label75:setMargins({left=5});
    obj.label75:setAutoSize(true);
    obj.label75:setWordWrap(false);
    obj.label75:setName("label75");
    obj.label75:setFontColor("white");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.flowLayout18);
    obj.dataLink19:setFields({'atributos.modforca', 'bonusProficiencia', 'pericias.atletismo'});
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.fraLayAtributos);
    obj.dataLink20:setField("atributos.destreza");
    obj.dataLink20:setName("dataLink20");

    obj.flowPart215 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart215:setParent(obj.fraLayAtributos);
    obj.flowPart215:setHeight(140);
    obj.flowPart215:setMinWidth(320);
    obj.flowPart215:setMaxWidth(420);
    obj.flowPart215:setMinScaledWidth(305);
    obj.flowPart215:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart215:setName("flowPart215");
    obj.flowPart215:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart215:setVertAlign("leading");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart215);
    obj.layout4:setLeft(6);
    obj.layout4:setTop(12);
    obj.layout4:setWidth(116);
    obj.layout4:setHeight(115);
    obj.layout4:setName("layout4");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout4);
    obj.edit132:setAlign("top");
    obj.edit132:setMargins({left=30, right=30});
    obj.edit132:setField("atributos.destreza");
    obj.edit132:setHeight(30);
    obj.edit132:setType("number");
    obj.edit132:setMin(0);
    obj.edit132:setMax(99);
    obj.edit132:setName("edit132");
    obj.edit132:setTransparent(true);
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setFontSize(15);
    obj.edit132:setFontColor("white");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowPart215);
    obj.label76:setFrameRegion("modificador");
    obj.label76:setField("atributos.moddestrezastr");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setVertTextAlign("center");
    obj.label76:setFontSize(46);
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setName("label76");
    obj.label76:setFontColor("white");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart215);
    obj.label77:setFrameRegion("titulo");
    obj.label77:setText("DESTREZA");
    obj.label77:setVertTextAlign("center");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");
    obj.label77:setFontColor("white");

    obj.flowLayout19 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.flowPart215);
    obj.flowLayout19:setFrameRegion("RegiaoDePericias");
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setLineSpacing(0);
    obj.flowLayout19:setHorzAlign("leading");
    obj.flowLayout19:setName("flowLayout19");
    obj.flowLayout19:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout19:setVertAlign("leading");

    obj.flowPart216 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart216:setParent(obj.flowLayout19);
    obj.flowPart216:setMinWidth(206);
    obj.flowPart216:setMaxWidth(250);
    obj.flowPart216:setHeight(17);
    obj.flowPart216:setName("flowPart216");
    obj.flowPart216:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart216:setVertAlign("leading");

    obj.imageCheckBox3 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.flowPart216);
    obj.imageCheckBox3:setAlign("left");
    obj.imageCheckBox3:setWidth(20);
    obj.imageCheckBox3:setMargins({});
    obj.imageCheckBox3:setField("resistencias.destreza");
    obj.imageCheckBox3:setOptimize(false);
    obj.imageCheckBox3:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox3:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox3:setName("imageCheckBox3");
    obj.imageCheckBox3:setHeight(20);

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart216);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(26);
    obj.layout5:setMargins({left=2});
    obj.layout5:setName("layout5");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout5);
    obj.label78:setField("resistencias.bonusdestrezastr");
    obj.label78:setAlign("client");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("trailing");
    obj.label78:setTextTrimming("none");
    obj.label78:setName("label78");
    obj.label78:setFontColor("white");

    obj.horzLine3 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout5);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setAlign("bottom");
    obj.horzLine3:setName("horzLine3");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowPart216);
    obj.label79:setAlign("client");
    obj.label79:setText("Teste de Resistência");
    obj.label79:setVertTextAlign("trailing");
    obj.label79:setMargins({left=5});
    obj.label79:setAutoSize(true);
    obj.label79:setWordWrap(false);
    obj.label79:setName("label79");
    obj.label79:setFontColor("white");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.flowLayout19);
    obj.dataLink21:setFields({'atributos.moddestreza', 'bonusProficiencia', 'resistencias.destreza'});
    obj.dataLink21:setName("dataLink21");

    obj.flowPart217 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart217:setParent(obj.flowLayout19);
    obj.flowPart217:setMinWidth(206);
    obj.flowPart217:setMaxWidth(250);
    obj.flowPart217:setHeight(17);
    obj.flowPart217:setName("flowPart217");
    obj.flowPart217:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart217:setVertAlign("leading");

    obj.imageCheckBox4 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.flowPart217);
    obj.imageCheckBox4:setAlign("left");
    obj.imageCheckBox4:setWidth(20);
    obj.imageCheckBox4:setMargins({});
    obj.imageCheckBox4:setField("pericias.acrobacia");
    obj.imageCheckBox4:setOptimize(false);
    obj.imageCheckBox4:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox4:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox4:setName("imageCheckBox4");
    obj.imageCheckBox4:setHeight(20);

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart217);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(26);
    obj.layout6:setMargins({left=2});
    obj.layout6:setName("layout6");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout6);
    obj.label80:setField("pericias.bonusacrobaciastr");
    obj.label80:setAlign("client");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setVertTextAlign("trailing");
    obj.label80:setTextTrimming("none");
    obj.label80:setName("label80");
    obj.label80:setFontColor("white");

    obj.horzLine4 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout6);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setAlign("bottom");
    obj.horzLine4:setName("horzLine4");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart217);
    obj.label81:setAlign("client");
    obj.label81:setText("Acrobacia");
    obj.label81:setVertTextAlign("trailing");
    obj.label81:setMargins({left=5});
    obj.label81:setAutoSize(true);
    obj.label81:setWordWrap(false);
    obj.label81:setName("label81");
    obj.label81:setFontColor("white");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.flowLayout19);
    obj.dataLink22:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.acrobacia'});
    obj.dataLink22:setName("dataLink22");

    obj.flowPart218 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart218:setParent(obj.flowLayout19);
    obj.flowPart218:setMinWidth(206);
    obj.flowPart218:setMaxWidth(250);
    obj.flowPart218:setHeight(17);
    obj.flowPart218:setName("flowPart218");
    obj.flowPart218:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart218:setVertAlign("leading");

    obj.imageCheckBox5 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.flowPart218);
    obj.imageCheckBox5:setAlign("left");
    obj.imageCheckBox5:setWidth(20);
    obj.imageCheckBox5:setMargins({});
    obj.imageCheckBox5:setField("pericias.furtividade");
    obj.imageCheckBox5:setOptimize(false);
    obj.imageCheckBox5:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox5:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox5:setName("imageCheckBox5");
    obj.imageCheckBox5:setHeight(20);

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart218);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(26);
    obj.layout7:setMargins({left=2});
    obj.layout7:setName("layout7");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout7);
    obj.label82:setField("pericias.bonusfurtividadestr");
    obj.label82:setAlign("client");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setVertTextAlign("trailing");
    obj.label82:setTextTrimming("none");
    obj.label82:setName("label82");
    obj.label82:setFontColor("white");

    obj.horzLine5 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout7);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setAlign("bottom");
    obj.horzLine5:setName("horzLine5");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart218);
    obj.label83:setAlign("client");
    obj.label83:setText("Furtividade");
    obj.label83:setVertTextAlign("trailing");
    obj.label83:setMargins({left=5});
    obj.label83:setAutoSize(true);
    obj.label83:setWordWrap(false);
    obj.label83:setName("label83");
    obj.label83:setFontColor("white");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.flowLayout19);
    obj.dataLink23:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.furtividade'});
    obj.dataLink23:setName("dataLink23");

    obj.flowPart219 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart219:setParent(obj.flowLayout19);
    obj.flowPart219:setMinWidth(206);
    obj.flowPart219:setMaxWidth(250);
    obj.flowPart219:setHeight(17);
    obj.flowPart219:setName("flowPart219");
    obj.flowPart219:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart219:setVertAlign("leading");

    obj.imageCheckBox6 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.flowPart219);
    obj.imageCheckBox6:setAlign("left");
    obj.imageCheckBox6:setWidth(20);
    obj.imageCheckBox6:setMargins({});
    obj.imageCheckBox6:setField("pericias.prestidigitacao");
    obj.imageCheckBox6:setOptimize(false);
    obj.imageCheckBox6:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox6:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox6:setName("imageCheckBox6");
    obj.imageCheckBox6:setHeight(20);

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowPart219);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(26);
    obj.layout8:setMargins({left=2});
    obj.layout8:setName("layout8");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout8);
    obj.label84:setField("pericias.bonusprestidigitacaostr");
    obj.label84:setAlign("client");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setVertTextAlign("trailing");
    obj.label84:setTextTrimming("none");
    obj.label84:setName("label84");
    obj.label84:setFontColor("white");

    obj.horzLine6 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout8);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setAlign("bottom");
    obj.horzLine6:setName("horzLine6");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart219);
    obj.label85:setAlign("client");
    obj.label85:setText("Prestidigitação");
    obj.label85:setVertTextAlign("trailing");
    obj.label85:setMargins({left=5});
    obj.label85:setAutoSize(true);
    obj.label85:setWordWrap(false);
    obj.label85:setName("label85");
    obj.label85:setFontColor("white");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.flowLayout19);
    obj.dataLink24:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.prestidigitacao'});
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.fraLayAtributos);
    obj.dataLink25:setField("atributos.constituicao");
    obj.dataLink25:setName("dataLink25");

    obj.flowPart220 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart220:setParent(obj.fraLayAtributos);
    obj.flowPart220:setHeight(140);
    obj.flowPart220:setMinWidth(320);
    obj.flowPart220:setMaxWidth(420);
    obj.flowPart220:setMinScaledWidth(305);
    obj.flowPart220:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart220:setName("flowPart220");
    obj.flowPart220:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart220:setVertAlign("leading");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart220);
    obj.layout9:setLeft(6);
    obj.layout9:setTop(12);
    obj.layout9:setWidth(116);
    obj.layout9:setHeight(115);
    obj.layout9:setName("layout9");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout9);
    obj.edit133:setAlign("top");
    obj.edit133:setMargins({left=30, right=30});
    obj.edit133:setField("atributos.constituicao");
    obj.edit133:setHeight(30);
    obj.edit133:setType("number");
    obj.edit133:setMin(0);
    obj.edit133:setMax(99);
    obj.edit133:setName("edit133");
    obj.edit133:setTransparent(true);
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setFontSize(15);
    obj.edit133:setFontColor("white");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowPart220);
    obj.label86:setFrameRegion("modificador");
    obj.label86:setField("atributos.modconstituicaostr");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setVertTextAlign("center");
    obj.label86:setFontSize(46);
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setName("label86");
    obj.label86:setFontColor("white");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart220);
    obj.label87:setFrameRegion("titulo");
    obj.label87:setText("CONSTITUIÇÃO");
    obj.label87:setVertTextAlign("center");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");
    obj.label87:setFontColor("white");

    obj.flowLayout20 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowPart220);
    obj.flowLayout20:setFrameRegion("RegiaoDePericias");
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setLineSpacing(0);
    obj.flowLayout20:setHorzAlign("leading");
    obj.flowLayout20:setName("flowLayout20");
    obj.flowLayout20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout20:setVertAlign("leading");

    obj.flowPart221 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart221:setParent(obj.flowLayout20);
    obj.flowPart221:setMinWidth(206);
    obj.flowPart221:setMaxWidth(250);
    obj.flowPart221:setHeight(17);
    obj.flowPart221:setName("flowPart221");
    obj.flowPart221:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart221:setVertAlign("leading");

    obj.imageCheckBox7 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.flowPart221);
    obj.imageCheckBox7:setAlign("left");
    obj.imageCheckBox7:setWidth(20);
    obj.imageCheckBox7:setMargins({});
    obj.imageCheckBox7:setField("resistencias.constituicao");
    obj.imageCheckBox7:setOptimize(false);
    obj.imageCheckBox7:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox7:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox7:setName("imageCheckBox7");
    obj.imageCheckBox7:setHeight(20);

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowPart221);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(26);
    obj.layout10:setMargins({left=2});
    obj.layout10:setName("layout10");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout10);
    obj.label88:setField("resistencias.bonusconstituicaostr");
    obj.label88:setAlign("client");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setVertTextAlign("trailing");
    obj.label88:setTextTrimming("none");
    obj.label88:setName("label88");
    obj.label88:setFontColor("white");

    obj.horzLine7 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout10);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setAlign("bottom");
    obj.horzLine7:setName("horzLine7");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.flowPart221);
    obj.label89:setAlign("client");
    obj.label89:setText("Teste de Resistência");
    obj.label89:setVertTextAlign("trailing");
    obj.label89:setMargins({left=5});
    obj.label89:setAutoSize(true);
    obj.label89:setWordWrap(false);
    obj.label89:setName("label89");
    obj.label89:setFontColor("white");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.flowLayout20);
    obj.dataLink26:setFields({'atributos.modconstituicao', 'bonusProficiencia', 'resistencias.constituicao'});
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.fraLayAtributos);
    obj.dataLink27:setField("atributos.inteligencia");
    obj.dataLink27:setName("dataLink27");

    obj.flowPart222 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart222:setParent(obj.fraLayAtributos);
    obj.flowPart222:setHeight(140);
    obj.flowPart222:setMinWidth(320);
    obj.flowPart222:setMaxWidth(420);
    obj.flowPart222:setMinScaledWidth(305);
    obj.flowPart222:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart222:setName("flowPart222");
    obj.flowPart222:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart222:setVertAlign("leading");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart222);
    obj.layout11:setLeft(6);
    obj.layout11:setTop(12);
    obj.layout11:setWidth(116);
    obj.layout11:setHeight(115);
    obj.layout11:setName("layout11");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout11);
    obj.edit134:setAlign("top");
    obj.edit134:setMargins({left=30, right=30});
    obj.edit134:setField("atributos.inteligencia");
    obj.edit134:setHeight(30);
    obj.edit134:setType("number");
    obj.edit134:setMin(0);
    obj.edit134:setMax(99);
    obj.edit134:setName("edit134");
    obj.edit134:setTransparent(true);
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setFontSize(15);
    obj.edit134:setFontColor("white");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.flowPart222);
    obj.label90:setFrameRegion("modificador");
    obj.label90:setField("atributos.modinteligenciastr");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setVertTextAlign("center");
    obj.label90:setFontSize(46);
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setName("label90");
    obj.label90:setFontColor("white");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.flowPart222);
    obj.label91:setFrameRegion("titulo");
    obj.label91:setText("INTELIGÊNCIA");
    obj.label91:setVertTextAlign("center");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");
    obj.label91:setFontColor("white");

    obj.flowLayout21 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.flowPart222);
    obj.flowLayout21:setFrameRegion("RegiaoDePericias");
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setLineSpacing(0);
    obj.flowLayout21:setHorzAlign("leading");
    obj.flowLayout21:setName("flowLayout21");
    obj.flowLayout21:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout21:setVertAlign("leading");

    obj.flowPart223 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart223:setParent(obj.flowLayout21);
    obj.flowPart223:setMinWidth(206);
    obj.flowPart223:setMaxWidth(250);
    obj.flowPart223:setHeight(17);
    obj.flowPart223:setName("flowPart223");
    obj.flowPart223:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart223:setVertAlign("leading");

    obj.imageCheckBox8 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.flowPart223);
    obj.imageCheckBox8:setAlign("left");
    obj.imageCheckBox8:setWidth(20);
    obj.imageCheckBox8:setMargins({});
    obj.imageCheckBox8:setField("resistencias.inteligencia");
    obj.imageCheckBox8:setOptimize(false);
    obj.imageCheckBox8:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox8:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox8:setName("imageCheckBox8");
    obj.imageCheckBox8:setHeight(20);

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart223);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(26);
    obj.layout12:setMargins({left=2});
    obj.layout12:setName("layout12");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout12);
    obj.label92:setField("resistencias.bonusinteligenciastr");
    obj.label92:setAlign("client");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setVertTextAlign("trailing");
    obj.label92:setTextTrimming("none");
    obj.label92:setName("label92");
    obj.label92:setFontColor("white");

    obj.horzLine8 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout12);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setAlign("bottom");
    obj.horzLine8:setName("horzLine8");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.flowPart223);
    obj.label93:setAlign("client");
    obj.label93:setText("Teste de Resistência");
    obj.label93:setVertTextAlign("trailing");
    obj.label93:setMargins({left=5});
    obj.label93:setAutoSize(true);
    obj.label93:setWordWrap(false);
    obj.label93:setName("label93");
    obj.label93:setFontColor("white");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.flowLayout21);
    obj.dataLink28:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'resistencias.inteligencia'});
    obj.dataLink28:setName("dataLink28");

    obj.flowPart224 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart224:setParent(obj.flowLayout21);
    obj.flowPart224:setMinWidth(206);
    obj.flowPart224:setMaxWidth(250);
    obj.flowPart224:setHeight(17);
    obj.flowPart224:setName("flowPart224");
    obj.flowPart224:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart224:setVertAlign("leading");

    obj.imageCheckBox9 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.flowPart224);
    obj.imageCheckBox9:setAlign("left");
    obj.imageCheckBox9:setWidth(20);
    obj.imageCheckBox9:setMargins({});
    obj.imageCheckBox9:setField("pericias.arcanismo");
    obj.imageCheckBox9:setOptimize(false);
    obj.imageCheckBox9:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox9:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox9:setName("imageCheckBox9");
    obj.imageCheckBox9:setHeight(20);

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart224);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(26);
    obj.layout13:setMargins({left=2});
    obj.layout13:setName("layout13");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout13);
    obj.label94:setField("pericias.bonusarcanismostr");
    obj.label94:setAlign("client");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setVertTextAlign("trailing");
    obj.label94:setTextTrimming("none");
    obj.label94:setName("label94");
    obj.label94:setFontColor("white");

    obj.horzLine9 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout13);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setAlign("bottom");
    obj.horzLine9:setName("horzLine9");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.flowPart224);
    obj.label95:setAlign("client");
    obj.label95:setText("Arcanismo");
    obj.label95:setVertTextAlign("trailing");
    obj.label95:setMargins({left=5});
    obj.label95:setAutoSize(true);
    obj.label95:setWordWrap(false);
    obj.label95:setName("label95");
    obj.label95:setFontColor("white");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.flowLayout21);
    obj.dataLink29:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.arcanismo'});
    obj.dataLink29:setName("dataLink29");

    obj.flowPart225 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart225:setParent(obj.flowLayout21);
    obj.flowPart225:setMinWidth(206);
    obj.flowPart225:setMaxWidth(250);
    obj.flowPart225:setHeight(17);
    obj.flowPart225:setName("flowPart225");
    obj.flowPart225:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart225:setVertAlign("leading");

    obj.imageCheckBox10 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.flowPart225);
    obj.imageCheckBox10:setAlign("left");
    obj.imageCheckBox10:setWidth(20);
    obj.imageCheckBox10:setMargins({});
    obj.imageCheckBox10:setField("pericias.historia");
    obj.imageCheckBox10:setOptimize(false);
    obj.imageCheckBox10:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox10:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox10:setName("imageCheckBox10");
    obj.imageCheckBox10:setHeight(20);

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart225);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(26);
    obj.layout14:setMargins({left=2});
    obj.layout14:setName("layout14");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout14);
    obj.label96:setField("pericias.bonushistoriastr");
    obj.label96:setAlign("client");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setVertTextAlign("trailing");
    obj.label96:setTextTrimming("none");
    obj.label96:setName("label96");
    obj.label96:setFontColor("white");

    obj.horzLine10 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout14);
    obj.horzLine10:setStrokeColor("white");
    obj.horzLine10:setStrokeSize(1);
    obj.horzLine10:setAlign("bottom");
    obj.horzLine10:setName("horzLine10");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.flowPart225);
    obj.label97:setAlign("client");
    obj.label97:setText("História");
    obj.label97:setVertTextAlign("trailing");
    obj.label97:setMargins({left=5});
    obj.label97:setAutoSize(true);
    obj.label97:setWordWrap(false);
    obj.label97:setName("label97");
    obj.label97:setFontColor("white");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.flowLayout21);
    obj.dataLink30:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.historia'});
    obj.dataLink30:setName("dataLink30");

    obj.flowPart226 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart226:setParent(obj.flowLayout21);
    obj.flowPart226:setMinWidth(206);
    obj.flowPart226:setMaxWidth(250);
    obj.flowPart226:setHeight(17);
    obj.flowPart226:setName("flowPart226");
    obj.flowPart226:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart226:setVertAlign("leading");

    obj.imageCheckBox11 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.flowPart226);
    obj.imageCheckBox11:setAlign("left");
    obj.imageCheckBox11:setWidth(20);
    obj.imageCheckBox11:setMargins({});
    obj.imageCheckBox11:setField("pericias.investigacao");
    obj.imageCheckBox11:setOptimize(false);
    obj.imageCheckBox11:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox11:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox11:setName("imageCheckBox11");
    obj.imageCheckBox11:setHeight(20);

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart226);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(26);
    obj.layout15:setMargins({left=2});
    obj.layout15:setName("layout15");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout15);
    obj.label98:setField("pericias.bonusinvestigacaostr");
    obj.label98:setAlign("client");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setVertTextAlign("trailing");
    obj.label98:setTextTrimming("none");
    obj.label98:setName("label98");
    obj.label98:setFontColor("white");

    obj.horzLine11 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout15);
    obj.horzLine11:setStrokeColor("white");
    obj.horzLine11:setStrokeSize(1);
    obj.horzLine11:setAlign("bottom");
    obj.horzLine11:setName("horzLine11");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.flowPart226);
    obj.label99:setAlign("client");
    obj.label99:setText("Investigação");
    obj.label99:setVertTextAlign("trailing");
    obj.label99:setMargins({left=5});
    obj.label99:setAutoSize(true);
    obj.label99:setWordWrap(false);
    obj.label99:setName("label99");
    obj.label99:setFontColor("white");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.flowLayout21);
    obj.dataLink31:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.investigacao'});
    obj.dataLink31:setName("dataLink31");

    obj.flowPart227 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart227:setParent(obj.flowLayout21);
    obj.flowPart227:setMinWidth(206);
    obj.flowPart227:setMaxWidth(250);
    obj.flowPart227:setHeight(17);
    obj.flowPart227:setName("flowPart227");
    obj.flowPart227:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart227:setVertAlign("leading");

    obj.imageCheckBox12 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.flowPart227);
    obj.imageCheckBox12:setAlign("left");
    obj.imageCheckBox12:setWidth(20);
    obj.imageCheckBox12:setMargins({});
    obj.imageCheckBox12:setField("pericias.natureza");
    obj.imageCheckBox12:setOptimize(false);
    obj.imageCheckBox12:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox12:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox12:setName("imageCheckBox12");
    obj.imageCheckBox12:setHeight(20);

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowPart227);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(26);
    obj.layout16:setMargins({left=2});
    obj.layout16:setName("layout16");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout16);
    obj.label100:setField("pericias.bonusnaturezastr");
    obj.label100:setAlign("client");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setVertTextAlign("trailing");
    obj.label100:setTextTrimming("none");
    obj.label100:setName("label100");
    obj.label100:setFontColor("white");

    obj.horzLine12 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout16);
    obj.horzLine12:setStrokeColor("white");
    obj.horzLine12:setStrokeSize(1);
    obj.horzLine12:setAlign("bottom");
    obj.horzLine12:setName("horzLine12");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.flowPart227);
    obj.label101:setAlign("client");
    obj.label101:setText("Natureza");
    obj.label101:setVertTextAlign("trailing");
    obj.label101:setMargins({left=5});
    obj.label101:setAutoSize(true);
    obj.label101:setWordWrap(false);
    obj.label101:setName("label101");
    obj.label101:setFontColor("white");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.flowLayout21);
    obj.dataLink32:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.natureza'});
    obj.dataLink32:setName("dataLink32");

    obj.flowPart228 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart228:setParent(obj.flowLayout21);
    obj.flowPart228:setMinWidth(206);
    obj.flowPart228:setMaxWidth(250);
    obj.flowPart228:setHeight(17);
    obj.flowPart228:setName("flowPart228");
    obj.flowPart228:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart228:setVertAlign("leading");

    obj.imageCheckBox13 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.flowPart228);
    obj.imageCheckBox13:setAlign("left");
    obj.imageCheckBox13:setWidth(20);
    obj.imageCheckBox13:setMargins({});
    obj.imageCheckBox13:setField("pericias.religiao");
    obj.imageCheckBox13:setOptimize(false);
    obj.imageCheckBox13:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox13:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox13:setName("imageCheckBox13");
    obj.imageCheckBox13:setHeight(20);

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowPart228);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(26);
    obj.layout17:setMargins({left=2});
    obj.layout17:setName("layout17");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout17);
    obj.label102:setField("pericias.bonusreligiaostr");
    obj.label102:setAlign("client");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setVertTextAlign("trailing");
    obj.label102:setTextTrimming("none");
    obj.label102:setName("label102");
    obj.label102:setFontColor("white");

    obj.horzLine13 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.layout17);
    obj.horzLine13:setStrokeColor("white");
    obj.horzLine13:setStrokeSize(1);
    obj.horzLine13:setAlign("bottom");
    obj.horzLine13:setName("horzLine13");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.flowPart228);
    obj.label103:setAlign("client");
    obj.label103:setText("Religião");
    obj.label103:setVertTextAlign("trailing");
    obj.label103:setMargins({left=5});
    obj.label103:setAutoSize(true);
    obj.label103:setWordWrap(false);
    obj.label103:setName("label103");
    obj.label103:setFontColor("white");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.flowLayout21);
    obj.dataLink33:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.religiao'});
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.fraLayAtributos);
    obj.dataLink34:setField("atributos.sabedoria");
    obj.dataLink34:setName("dataLink34");

    obj.flowPart229 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart229:setParent(obj.fraLayAtributos);
    obj.flowPart229:setHeight(140);
    obj.flowPart229:setMinWidth(320);
    obj.flowPart229:setMaxWidth(420);
    obj.flowPart229:setMinScaledWidth(305);
    obj.flowPart229:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart229:setName("flowPart229");
    obj.flowPart229:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart229:setVertAlign("leading");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowPart229);
    obj.layout18:setLeft(6);
    obj.layout18:setTop(12);
    obj.layout18:setWidth(116);
    obj.layout18:setHeight(115);
    obj.layout18:setName("layout18");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout18);
    obj.edit135:setAlign("top");
    obj.edit135:setMargins({left=30, right=30});
    obj.edit135:setField("atributos.sabedoria");
    obj.edit135:setHeight(30);
    obj.edit135:setType("number");
    obj.edit135:setMin(0);
    obj.edit135:setMax(99);
    obj.edit135:setName("edit135");
    obj.edit135:setTransparent(true);
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setFontSize(15);
    obj.edit135:setFontColor("white");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.flowPart229);
    obj.label104:setFrameRegion("modificador");
    obj.label104:setField("atributos.modsabedoriastr");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setVertTextAlign("center");
    obj.label104:setFontSize(46);
    lfm_setPropAsString(obj.label104, "fontStyle",  "bold");
    obj.label104:setName("label104");
    obj.label104:setFontColor("white");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.flowPart229);
    obj.label105:setFrameRegion("titulo");
    obj.label105:setText("SABEDORIA");
    obj.label105:setVertTextAlign("center");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");
    obj.label105:setFontColor("white");

    obj.flowLayout22 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowPart229);
    obj.flowLayout22:setFrameRegion("RegiaoDePericias");
    obj.flowLayout22:setAutoHeight(true);
    obj.flowLayout22:setLineSpacing(0);
    obj.flowLayout22:setHorzAlign("leading");
    obj.flowLayout22:setName("flowLayout22");
    obj.flowLayout22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout22:setVertAlign("leading");

    obj.flowPart230 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart230:setParent(obj.flowLayout22);
    obj.flowPart230:setMinWidth(206);
    obj.flowPart230:setMaxWidth(250);
    obj.flowPart230:setHeight(17);
    obj.flowPart230:setName("flowPart230");
    obj.flowPart230:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart230:setVertAlign("leading");

    obj.imageCheckBox14 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.flowPart230);
    obj.imageCheckBox14:setAlign("left");
    obj.imageCheckBox14:setWidth(20);
    obj.imageCheckBox14:setMargins({});
    obj.imageCheckBox14:setField("resistencias.sabedoria");
    obj.imageCheckBox14:setOptimize(false);
    obj.imageCheckBox14:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox14:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox14:setName("imageCheckBox14");
    obj.imageCheckBox14:setHeight(20);

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flowPart230);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(26);
    obj.layout19:setMargins({left=2});
    obj.layout19:setName("layout19");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout19);
    obj.label106:setField("resistencias.bonussabedoriastr");
    obj.label106:setAlign("client");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setVertTextAlign("trailing");
    obj.label106:setTextTrimming("none");
    obj.label106:setName("label106");
    obj.label106:setFontColor("white");

    obj.horzLine14 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout19);
    obj.horzLine14:setStrokeColor("white");
    obj.horzLine14:setStrokeSize(1);
    obj.horzLine14:setAlign("bottom");
    obj.horzLine14:setName("horzLine14");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.flowPart230);
    obj.label107:setAlign("client");
    obj.label107:setText("Teste de Resistência");
    obj.label107:setVertTextAlign("trailing");
    obj.label107:setMargins({left=5});
    obj.label107:setAutoSize(true);
    obj.label107:setWordWrap(false);
    obj.label107:setName("label107");
    obj.label107:setFontColor("white");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.flowLayout22);
    obj.dataLink35:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'resistencias.sabedoria'});
    obj.dataLink35:setName("dataLink35");

    obj.flowPart231 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart231:setParent(obj.flowLayout22);
    obj.flowPart231:setMinWidth(206);
    obj.flowPart231:setMaxWidth(250);
    obj.flowPart231:setHeight(17);
    obj.flowPart231:setName("flowPart231");
    obj.flowPart231:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart231:setVertAlign("leading");

    obj.imageCheckBox15 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.flowPart231);
    obj.imageCheckBox15:setAlign("left");
    obj.imageCheckBox15:setWidth(20);
    obj.imageCheckBox15:setMargins({});
    obj.imageCheckBox15:setField("pericias.adestrarAnimais");
    obj.imageCheckBox15:setOptimize(false);
    obj.imageCheckBox15:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox15:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox15:setName("imageCheckBox15");
    obj.imageCheckBox15:setHeight(20);

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flowPart231);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(26);
    obj.layout20:setMargins({left=2});
    obj.layout20:setName("layout20");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout20);
    obj.label108:setField("pericias.bonusadestrarAnimaisstr");
    obj.label108:setAlign("client");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setVertTextAlign("trailing");
    obj.label108:setTextTrimming("none");
    obj.label108:setName("label108");
    obj.label108:setFontColor("white");

    obj.horzLine15 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout20);
    obj.horzLine15:setStrokeColor("white");
    obj.horzLine15:setStrokeSize(1);
    obj.horzLine15:setAlign("bottom");
    obj.horzLine15:setName("horzLine15");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.flowPart231);
    obj.label109:setAlign("client");
    obj.label109:setText("Adestrar Animais");
    obj.label109:setVertTextAlign("trailing");
    obj.label109:setMargins({left=5});
    obj.label109:setAutoSize(true);
    obj.label109:setWordWrap(false);
    obj.label109:setName("label109");
    obj.label109:setFontColor("white");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.flowLayout22);
    obj.dataLink36:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.adestrarAnimais'});
    obj.dataLink36:setName("dataLink36");

    obj.flowPart232 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart232:setParent(obj.flowLayout22);
    obj.flowPart232:setMinWidth(206);
    obj.flowPart232:setMaxWidth(250);
    obj.flowPart232:setHeight(17);
    obj.flowPart232:setName("flowPart232");
    obj.flowPart232:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart232:setVertAlign("leading");

    obj.imageCheckBox16 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.flowPart232);
    obj.imageCheckBox16:setAlign("left");
    obj.imageCheckBox16:setWidth(20);
    obj.imageCheckBox16:setMargins({});
    obj.imageCheckBox16:setField("pericias.intuicao");
    obj.imageCheckBox16:setOptimize(false);
    obj.imageCheckBox16:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox16:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox16:setName("imageCheckBox16");
    obj.imageCheckBox16:setHeight(20);

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.flowPart232);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(26);
    obj.layout21:setMargins({left=2});
    obj.layout21:setName("layout21");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout21);
    obj.label110:setField("pericias.bonusintuicaostr");
    obj.label110:setAlign("client");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setVertTextAlign("trailing");
    obj.label110:setTextTrimming("none");
    obj.label110:setName("label110");
    obj.label110:setFontColor("white");

    obj.horzLine16 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout21);
    obj.horzLine16:setStrokeColor("white");
    obj.horzLine16:setStrokeSize(1);
    obj.horzLine16:setAlign("bottom");
    obj.horzLine16:setName("horzLine16");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.flowPart232);
    obj.label111:setAlign("client");
    obj.label111:setText("Intuição");
    obj.label111:setVertTextAlign("trailing");
    obj.label111:setMargins({left=5});
    obj.label111:setAutoSize(true);
    obj.label111:setWordWrap(false);
    obj.label111:setName("label111");
    obj.label111:setFontColor("white");

    obj.dataLink37 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.flowLayout22);
    obj.dataLink37:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.intuicao'});
    obj.dataLink37:setName("dataLink37");

    obj.flowPart233 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart233:setParent(obj.flowLayout22);
    obj.flowPart233:setMinWidth(206);
    obj.flowPart233:setMaxWidth(250);
    obj.flowPart233:setHeight(17);
    obj.flowPart233:setName("flowPart233");
    obj.flowPart233:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart233:setVertAlign("leading");

    obj.imageCheckBox17 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.flowPart233);
    obj.imageCheckBox17:setAlign("left");
    obj.imageCheckBox17:setWidth(20);
    obj.imageCheckBox17:setMargins({});
    obj.imageCheckBox17:setField("pericias.medicina");
    obj.imageCheckBox17:setOptimize(false);
    obj.imageCheckBox17:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox17:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox17:setName("imageCheckBox17");
    obj.imageCheckBox17:setHeight(20);

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.flowPart233);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(26);
    obj.layout22:setMargins({left=2});
    obj.layout22:setName("layout22");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout22);
    obj.label112:setField("pericias.bonusmedicinastr");
    obj.label112:setAlign("client");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setVertTextAlign("trailing");
    obj.label112:setTextTrimming("none");
    obj.label112:setName("label112");
    obj.label112:setFontColor("white");

    obj.horzLine17 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.layout22);
    obj.horzLine17:setStrokeColor("white");
    obj.horzLine17:setStrokeSize(1);
    obj.horzLine17:setAlign("bottom");
    obj.horzLine17:setName("horzLine17");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.flowPart233);
    obj.label113:setAlign("client");
    obj.label113:setText("Medicina");
    obj.label113:setVertTextAlign("trailing");
    obj.label113:setMargins({left=5});
    obj.label113:setAutoSize(true);
    obj.label113:setWordWrap(false);
    obj.label113:setName("label113");
    obj.label113:setFontColor("white");

    obj.dataLink38 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.flowLayout22);
    obj.dataLink38:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.medicina'});
    obj.dataLink38:setName("dataLink38");

    obj.flowPart234 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart234:setParent(obj.flowLayout22);
    obj.flowPart234:setMinWidth(206);
    obj.flowPart234:setMaxWidth(250);
    obj.flowPart234:setHeight(17);
    obj.flowPart234:setName("flowPart234");
    obj.flowPart234:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart234:setVertAlign("leading");

    obj.imageCheckBox18 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.flowPart234);
    obj.imageCheckBox18:setAlign("left");
    obj.imageCheckBox18:setWidth(20);
    obj.imageCheckBox18:setMargins({});
    obj.imageCheckBox18:setField("pericias.percepcao");
    obj.imageCheckBox18:setOptimize(false);
    obj.imageCheckBox18:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox18:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox18:setName("imageCheckBox18");
    obj.imageCheckBox18:setHeight(20);

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.flowPart234);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(26);
    obj.layout23:setMargins({left=2});
    obj.layout23:setName("layout23");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout23);
    obj.label114:setField("pericias.bonuspercepcaostr");
    obj.label114:setAlign("client");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setVertTextAlign("trailing");
    obj.label114:setTextTrimming("none");
    obj.label114:setName("label114");
    obj.label114:setFontColor("white");

    obj.horzLine18 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.layout23);
    obj.horzLine18:setStrokeColor("white");
    obj.horzLine18:setStrokeSize(1);
    obj.horzLine18:setAlign("bottom");
    obj.horzLine18:setName("horzLine18");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.flowPart234);
    obj.label115:setAlign("client");
    obj.label115:setText("Percepção");
    obj.label115:setVertTextAlign("trailing");
    obj.label115:setMargins({left=5});
    obj.label115:setAutoSize(true);
    obj.label115:setWordWrap(false);
    obj.label115:setName("label115");
    obj.label115:setFontColor("white");

    obj.dataLink39 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.flowLayout22);
    obj.dataLink39:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.percepcao'});
    obj.dataLink39:setName("dataLink39");

    obj.flowPart235 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart235:setParent(obj.flowLayout22);
    obj.flowPart235:setMinWidth(206);
    obj.flowPart235:setMaxWidth(250);
    obj.flowPart235:setHeight(17);
    obj.flowPart235:setName("flowPart235");
    obj.flowPart235:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart235:setVertAlign("leading");

    obj.imageCheckBox19 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox19:setParent(obj.flowPart235);
    obj.imageCheckBox19:setAlign("left");
    obj.imageCheckBox19:setWidth(20);
    obj.imageCheckBox19:setMargins({});
    obj.imageCheckBox19:setField("pericias.sobrevivencia");
    obj.imageCheckBox19:setOptimize(false);
    obj.imageCheckBox19:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox19:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox19:setName("imageCheckBox19");
    obj.imageCheckBox19:setHeight(20);

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.flowPart235);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(26);
    obj.layout24:setMargins({left=2});
    obj.layout24:setName("layout24");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout24);
    obj.label116:setField("pericias.bonussobrevivenciastr");
    obj.label116:setAlign("client");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setVertTextAlign("trailing");
    obj.label116:setTextTrimming("none");
    obj.label116:setName("label116");
    obj.label116:setFontColor("white");

    obj.horzLine19 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.layout24);
    obj.horzLine19:setStrokeColor("white");
    obj.horzLine19:setStrokeSize(1);
    obj.horzLine19:setAlign("bottom");
    obj.horzLine19:setName("horzLine19");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.flowPart235);
    obj.label117:setAlign("client");
    obj.label117:setText("Sobrevivência");
    obj.label117:setVertTextAlign("trailing");
    obj.label117:setMargins({left=5});
    obj.label117:setAutoSize(true);
    obj.label117:setWordWrap(false);
    obj.label117:setName("label117");
    obj.label117:setFontColor("white");

    obj.dataLink40 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.flowLayout22);
    obj.dataLink40:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.sobrevivencia'});
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.fraLayAtributos);
    obj.dataLink41:setField("atributos.carisma");
    obj.dataLink41:setName("dataLink41");

    obj.flowPart236 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart236:setParent(obj.fraLayAtributos);
    obj.flowPart236:setHeight(140);
    obj.flowPart236:setMinWidth(320);
    obj.flowPart236:setMaxWidth(420);
    obj.flowPart236:setMinScaledWidth(305);
    obj.flowPart236:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart236:setName("flowPart236");
    obj.flowPart236:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart236:setVertAlign("leading");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flowPart236);
    obj.layout25:setLeft(6);
    obj.layout25:setTop(12);
    obj.layout25:setWidth(116);
    obj.layout25:setHeight(115);
    obj.layout25:setName("layout25");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout25);
    obj.edit136:setAlign("top");
    obj.edit136:setMargins({left=30, right=30});
    obj.edit136:setField("atributos.carisma");
    obj.edit136:setHeight(30);
    obj.edit136:setType("number");
    obj.edit136:setMin(0);
    obj.edit136:setMax(99);
    obj.edit136:setName("edit136");
    obj.edit136:setTransparent(true);
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setFontSize(15);
    obj.edit136:setFontColor("white");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.flowPart236);
    obj.label118:setFrameRegion("modificador");
    obj.label118:setField("atributos.modcarismastr");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setVertTextAlign("center");
    obj.label118:setFontSize(46);
    lfm_setPropAsString(obj.label118, "fontStyle",  "bold");
    obj.label118:setName("label118");
    obj.label118:setFontColor("white");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.flowPart236);
    obj.label119:setFrameRegion("titulo");
    obj.label119:setText("CARISMA");
    obj.label119:setVertTextAlign("center");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");
    obj.label119:setFontColor("white");

    obj.flowLayout23 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.flowPart236);
    obj.flowLayout23:setFrameRegion("RegiaoDePericias");
    obj.flowLayout23:setAutoHeight(true);
    obj.flowLayout23:setLineSpacing(0);
    obj.flowLayout23:setHorzAlign("leading");
    obj.flowLayout23:setName("flowLayout23");
    obj.flowLayout23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout23:setVertAlign("leading");

    obj.flowPart237 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart237:setParent(obj.flowLayout23);
    obj.flowPart237:setMinWidth(206);
    obj.flowPart237:setMaxWidth(250);
    obj.flowPart237:setHeight(17);
    obj.flowPart237:setName("flowPart237");
    obj.flowPart237:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart237:setVertAlign("leading");

    obj.imageCheckBox20 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox20:setParent(obj.flowPart237);
    obj.imageCheckBox20:setAlign("left");
    obj.imageCheckBox20:setWidth(20);
    obj.imageCheckBox20:setMargins({});
    obj.imageCheckBox20:setField("resistencias.carisma");
    obj.imageCheckBox20:setOptimize(false);
    obj.imageCheckBox20:setImageChecked("images/checkbox2_checked.png");
    obj.imageCheckBox20:setImageUnchecked("images/checkbox2_unchecked.png");
    obj.imageCheckBox20:setName("imageCheckBox20");
    obj.imageCheckBox20:setHeight(20);

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowPart237);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(26);
    obj.layout26:setMargins({left=2});
    obj.layout26:setName("layout26");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout26);
    obj.label120:setField("resistencias.bonuscarismastr");
    obj.label120:setAlign("client");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setVertTextAlign("trailing");
    obj.label120:setTextTrimming("none");
    obj.label120:setName("label120");
    obj.label120:setFontColor("white");

    obj.horzLine20 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine20:setParent(obj.layout26);
    obj.horzLine20:setStrokeColor("white");
    obj.horzLine20:setStrokeSize(1);
    obj.horzLine20:setAlign("bottom");
    obj.horzLine20:setName("horzLine20");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.flowPart237);
    obj.label121:setAlign("client");
    obj.label121:setText("Teste de Resistência");
    obj.label121:setVertTextAlign("trailing");
    obj.label121:setMargins({left=5});
    obj.label121:setAutoSize(true);
    obj.label121:setWordWrap(false);
    obj.label121:setName("label121");
    obj.label121:setFontColor("white");

    obj.dataLink42 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.flowLayout23);
    obj.dataLink42:setFields({'atributos.modcarisma', 'bonusProficiencia', 'resistencias.carisma'});
    obj.dataLink42:setName("dataLink42");

    obj.flowPart238 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart238:setParent(obj.flowLayout23);
    obj.flowPart238:setMinWidth(206);
    obj.flowPart238:setMaxWidth(250);
    obj.flowPart238:setHeight(17);
    obj.flowPart238:setName("flowPart238");
    obj.flowPart238:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart238:setVertAlign("leading");

    obj.imageCheckBox21 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox21:setParent(obj.flowPart238);
    obj.imageCheckBox21:setAlign("left");
    obj.imageCheckBox21:setWidth(20);
    obj.imageCheckBox21:setMargins({});
    obj.imageCheckBox21:setField("pericias.atuacao");
    obj.imageCheckBox21:setOptimize(false);
    obj.imageCheckBox21:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox21:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox21:setName("imageCheckBox21");
    obj.imageCheckBox21:setHeight(20);

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowPart238);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(26);
    obj.layout27:setMargins({left=2});
    obj.layout27:setName("layout27");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout27);
    obj.label122:setField("pericias.bonusatuacaostr");
    obj.label122:setAlign("client");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setVertTextAlign("trailing");
    obj.label122:setTextTrimming("none");
    obj.label122:setName("label122");
    obj.label122:setFontColor("white");

    obj.horzLine21 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine21:setParent(obj.layout27);
    obj.horzLine21:setStrokeColor("white");
    obj.horzLine21:setStrokeSize(1);
    obj.horzLine21:setAlign("bottom");
    obj.horzLine21:setName("horzLine21");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.flowPart238);
    obj.label123:setAlign("client");
    obj.label123:setText("Atuação");
    obj.label123:setVertTextAlign("trailing");
    obj.label123:setMargins({left=5});
    obj.label123:setAutoSize(true);
    obj.label123:setWordWrap(false);
    obj.label123:setName("label123");
    obj.label123:setFontColor("white");

    obj.dataLink43 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.flowLayout23);
    obj.dataLink43:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.atuacao'});
    obj.dataLink43:setName("dataLink43");

    obj.flowPart239 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart239:setParent(obj.flowLayout23);
    obj.flowPart239:setMinWidth(206);
    obj.flowPart239:setMaxWidth(250);
    obj.flowPart239:setHeight(17);
    obj.flowPart239:setName("flowPart239");
    obj.flowPart239:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart239:setVertAlign("leading");

    obj.imageCheckBox22 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox22:setParent(obj.flowPart239);
    obj.imageCheckBox22:setAlign("left");
    obj.imageCheckBox22:setWidth(20);
    obj.imageCheckBox22:setMargins({});
    obj.imageCheckBox22:setField("pericias.enganacao");
    obj.imageCheckBox22:setOptimize(false);
    obj.imageCheckBox22:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox22:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox22:setName("imageCheckBox22");
    obj.imageCheckBox22:setHeight(20);

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flowPart239);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(26);
    obj.layout28:setMargins({left=2});
    obj.layout28:setName("layout28");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout28);
    obj.label124:setField("pericias.bonusenganacaostr");
    obj.label124:setAlign("client");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setVertTextAlign("trailing");
    obj.label124:setTextTrimming("none");
    obj.label124:setName("label124");
    obj.label124:setFontColor("white");

    obj.horzLine22 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine22:setParent(obj.layout28);
    obj.horzLine22:setStrokeColor("white");
    obj.horzLine22:setStrokeSize(1);
    obj.horzLine22:setAlign("bottom");
    obj.horzLine22:setName("horzLine22");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.flowPart239);
    obj.label125:setAlign("client");
    obj.label125:setText("Enganação");
    obj.label125:setVertTextAlign("trailing");
    obj.label125:setMargins({left=5});
    obj.label125:setAutoSize(true);
    obj.label125:setWordWrap(false);
    obj.label125:setName("label125");
    obj.label125:setFontColor("white");

    obj.dataLink44 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.flowLayout23);
    obj.dataLink44:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.enganacao'});
    obj.dataLink44:setName("dataLink44");

    obj.flowPart240 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart240:setParent(obj.flowLayout23);
    obj.flowPart240:setMinWidth(206);
    obj.flowPart240:setMaxWidth(250);
    obj.flowPart240:setHeight(17);
    obj.flowPart240:setName("flowPart240");
    obj.flowPart240:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart240:setVertAlign("leading");

    obj.imageCheckBox23 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox23:setParent(obj.flowPart240);
    obj.imageCheckBox23:setAlign("left");
    obj.imageCheckBox23:setWidth(20);
    obj.imageCheckBox23:setMargins({});
    obj.imageCheckBox23:setField("pericias.intimidacao");
    obj.imageCheckBox23:setOptimize(false);
    obj.imageCheckBox23:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox23:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox23:setName("imageCheckBox23");
    obj.imageCheckBox23:setHeight(20);

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.flowPart240);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(26);
    obj.layout29:setMargins({left=2});
    obj.layout29:setName("layout29");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout29);
    obj.label126:setField("pericias.bonusintimidacaostr");
    obj.label126:setAlign("client");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setVertTextAlign("trailing");
    obj.label126:setTextTrimming("none");
    obj.label126:setName("label126");
    obj.label126:setFontColor("white");

    obj.horzLine23 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine23:setParent(obj.layout29);
    obj.horzLine23:setStrokeColor("white");
    obj.horzLine23:setStrokeSize(1);
    obj.horzLine23:setAlign("bottom");
    obj.horzLine23:setName("horzLine23");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.flowPart240);
    obj.label127:setAlign("client");
    obj.label127:setText("Intimidação");
    obj.label127:setVertTextAlign("trailing");
    obj.label127:setMargins({left=5});
    obj.label127:setAutoSize(true);
    obj.label127:setWordWrap(false);
    obj.label127:setName("label127");
    obj.label127:setFontColor("white");

    obj.dataLink45 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.flowLayout23);
    obj.dataLink45:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.intimidacao'});
    obj.dataLink45:setName("dataLink45");

    obj.flowPart241 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart241:setParent(obj.flowLayout23);
    obj.flowPart241:setMinWidth(206);
    obj.flowPart241:setMaxWidth(250);
    obj.flowPart241:setHeight(17);
    obj.flowPart241:setName("flowPart241");
    obj.flowPart241:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart241:setVertAlign("leading");

    obj.imageCheckBox24 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox24:setParent(obj.flowPart241);
    obj.imageCheckBox24:setAlign("left");
    obj.imageCheckBox24:setWidth(20);
    obj.imageCheckBox24:setMargins({});
    obj.imageCheckBox24:setField("pericias.persuasao");
    obj.imageCheckBox24:setOptimize(false);
    obj.imageCheckBox24:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox24:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox24:setName("imageCheckBox24");
    obj.imageCheckBox24:setHeight(20);

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowPart241);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(26);
    obj.layout30:setMargins({left=2});
    obj.layout30:setName("layout30");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout30);
    obj.label128:setField("pericias.bonuspersuasaostr");
    obj.label128:setAlign("client");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setVertTextAlign("trailing");
    obj.label128:setTextTrimming("none");
    obj.label128:setName("label128");
    obj.label128:setFontColor("white");

    obj.horzLine24 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine24:setParent(obj.layout30);
    obj.horzLine24:setStrokeColor("white");
    obj.horzLine24:setStrokeSize(1);
    obj.horzLine24:setAlign("bottom");
    obj.horzLine24:setName("horzLine24");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.flowPart241);
    obj.label129:setAlign("client");
    obj.label129:setText("Persuasão");
    obj.label129:setVertTextAlign("trailing");
    obj.label129:setMargins({left=5});
    obj.label129:setAutoSize(true);
    obj.label129:setWordWrap(false);
    obj.label129:setName("label129");
    obj.label129:setFontColor("white");

    obj.dataLink46 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.flowLayout23);
    obj.dataLink46:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.persuasao'});
    obj.dataLink46:setName("dataLink46");

    obj.flowLayout24 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowLayout17);
    obj.flowLayout24:setAutoHeight(true);
    obj.flowLayout24:setHorzAlign("center");
    obj.flowLayout24:setVertAlign("leading");
    obj.flowLayout24:setMaxControlsPerLine(1);
    obj.flowLayout24:setName("flowLayout24");
    obj.flowLayout24:setStepSizes({310, 360});
    obj.flowLayout24:setMinScaledWidth(300);
    obj.flowLayout24:setMaxScaledWidth(340);
    obj.flowLayout24:setAvoidScale(true);
    obj.flowLayout24:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowLayout25 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.flowLayout24);
    obj.flowLayout25:setMinWidth(235);
    obj.flowLayout25:setMaxWidth(475);
    obj.flowLayout25:setAutoHeight(true);
    obj.flowLayout25:setAvoidScale(false);
    obj.flowLayout25:setVertAlign("center");
    obj.flowLayout25:setHorzAlign("justify");
    obj.flowLayout25:setName("flowLayout25");
    obj.flowLayout25:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowPart242 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart242:setParent(obj.flowLayout25);
    obj.flowPart242:setStepSizes({105});
    obj.flowPart242:setMinScaledWidth(75);
    obj.flowPart242:setHeight(120);
    obj.flowPart242:setFrameStyle("frames/shield/frame.xml");
    obj.flowPart242:setName("flowPart242");
    obj.flowPart242:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart242:setVertAlign("leading");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.flowPart242);
    obj.label130:setAlign("top");
    obj.label130:setText("CLASSE DE ARMADURA");
    obj.label130:setHeight(20);
    obj.label130:setFontSize(9);
    obj.label130:setWordWrap(true);
    obj.label130:setHorzTextAlign("center");
    obj.label130:setTextTrimming("none");
    obj.label130:setName("label130");
    obj.label130:setFontColor("white");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.flowPart242);
    obj.edit137:setAlign("client");
    obj.edit137:setField("CA");
    obj.edit137:setFontSize(30);
    obj.edit137:setName("edit137");
    obj.edit137:setTransparent(true);
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setFontColor("white");

    obj.flowPart243 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart243:setParent(obj.flowLayout25);
    obj.flowPart243:setStepSizes({105});
    obj.flowPart243:setMinScaledWidth(75);
    obj.flowPart243:setHeight(120);
    obj.flowPart243:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart243:setName("flowPart243");
    obj.flowPart243:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart243:setVertAlign("leading");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.flowPart243);
    obj.label131:setAlign("top");
    obj.label131:setText("INICIATIVA");
    obj.label131:setHeight(20);
    obj.label131:setFontSize(9);
    obj.label131:setWordWrap(true);
    obj.label131:setHorzTextAlign("center");
    obj.label131:setTextTrimming("none");
    obj.label131:setName("label131");
    obj.label131:setFontColor("white");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.flowPart243);
    obj.edit138:setAlign("client");
    obj.edit138:setField("iniciativa");
    obj.edit138:setFontSize(30);
    obj.edit138:setName("edit138");
    obj.edit138:setTransparent(true);
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setFontColor("white");

    obj.flowPart244 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart244:setParent(obj.flowLayout25);
    obj.flowPart244:setStepSizes({105});
    obj.flowPart244:setMinScaledWidth(75);
    obj.flowPart244:setHeight(120);
    obj.flowPart244:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart244:setName("flowPart244");
    obj.flowPart244:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart244:setVertAlign("leading");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.flowPart244);
    obj.label132:setAlign("top");
    obj.label132:setText("DESLOCAMENTO");
    obj.label132:setHeight(20);
    obj.label132:setFontSize(9);
    obj.label132:setWordWrap(true);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setTextTrimming("none");
    obj.label132:setName("label132");
    obj.label132:setFontColor("white");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.flowPart244);
    obj.edit139:setAlign("client");
    obj.edit139:setField("deslocamento");
    obj.edit139:setFontSize(30);
    obj.edit139:setName("edit139");
    obj.edit139:setTransparent(true);
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setFontColor("white");

    obj.flowPart245 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart245:setParent(obj.flowLayout24);
    obj.flowPart245:setMinWidth(235);
    obj.flowPart245:setMaxWidth(475);
    obj.flowPart245:setMinScaledWidth(200);
    obj.flowPart245:setHeight(175);
    obj.flowPart245:setMargins({left=2, right=2, top=4, bottom=8});
    obj.flowPart245:setName("flowPart245");
    obj.flowPart245:setVertAlign("leading");

    obj.frame1 = gui.fromHandle(_obj_newObject("frame"));
    obj.frame1:setParent(obj.flowPart245);
    obj.frame1:setAlign("client");
    obj.frame1:setFrameStyle("frames/panel5/topPanel.xml");
    obj.frame1:setMargins({left = 4, right = 4, bottom=4});
    obj.frame1:setName("frame1");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.frame1);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout31);
    obj.label133:setAlign("left");
    obj.label133:setAutoSize(true);
    obj.label133:setText("PONTOS DE VIDA MÁXIMO:");
    obj.label133:setTextTrimming("none");
    obj.label133:setWordWrap(false);
    obj.label133:setFontSize(12);
    obj.label133:setHorzTextAlign("trailing");
    obj.label133:setName("label133");
    obj.label133:setFontColor("#D0D0D0");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setAlign("client");
    obj.layout32:setMargins({left=5, right=3});
    obj.layout32:setName("layout32");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout32);
    obj.edit140:setAlign("client");
    obj.edit140:setField("PVMax");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setName("edit140");
    obj.edit140:setFontSize(15);
    obj.edit140:setFontColor("white");
    obj.edit140:setTransparent(true);

    obj.horzLine25 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine25:setParent(obj.layout32);
    obj.horzLine25:setAlign("bottom");
    obj.horzLine25:setStrokeColor("gray");
    obj.horzLine25:setName("horzLine25");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.frame1);
    obj.edit141:setAlign("client");
    obj.edit141:setField("PV");
    obj.edit141:setMargins({top=2});
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setFontSize(36);
    lfm_setPropAsString(obj.edit141, "fontStyle",  "bold");
    obj.edit141:setName("edit141");
    obj.edit141:setFontColor("white");
    obj.edit141:setTransparent(true);

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.frame1);
    obj.label134:setAlign("bottom");
    obj.label134:setAutoSize(true);
    obj.label134:setText("PONTOS DE VIDA ATUAL");
    obj.label134:setFontSize(11);
    obj.label134:setVertTextAlign("center");
    obj.label134:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label134, "fontStyle",  "bold");
    obj.label134:setName("label134");
    obj.label134:setFontColor("white");

    obj.frame2 = gui.fromHandle(_obj_newObject("frame"));
    obj.frame2:setParent(obj.flowPart245);
    obj.frame2:setAlign("bottom");
    obj.frame2:setHeight(70);
    obj.frame2:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.frame2:setMargins({left = 4, right = 4});
    obj.frame2:setName("frame2");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.frame2);
    obj.edit142:setAlign("client");
    obj.edit142:setField("PVTemporario");
    obj.edit142:setMargins({top=2});
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setFontSize(36);
    lfm_setPropAsString(obj.edit142, "fontStyle",  "bold");
    obj.edit142:setName("edit142");
    obj.edit142:setFontColor("white");
    obj.edit142:setTransparent(true);

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.frame2);
    obj.label135:setAlign("bottom");
    obj.label135:setAutoSize(true);
    obj.label135:setText("PONTOS DE VIDA TEMPORÁRIOS");
    obj.label135:setFontSize(11);
    obj.label135:setVertTextAlign("center");
    obj.label135:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label135, "fontStyle",  "bold");
    obj.label135:setName("label135");
    obj.label135:setFontColor("white");

    obj.flowLayout26 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.flowLayout24);
    obj.flowLayout26:setAutoHeight(true);
    obj.flowLayout26:setMinWidth(235);
    obj.flowLayout26:setMaxWidth(475);
    obj.flowLayout26:setMinScaledWidth(235);
    obj.flowLayout26:setHorzAlign("justify");
    obj.flowLayout26:setName("flowLayout26");
    obj.flowLayout26:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout26:setVertAlign("leading");

    obj.flowPart246 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart246:setParent(obj.flowLayout26);
    obj.flowPart246:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart246:setStepSizes({130, 150, 160});
    obj.flowPart246:setHeight(100);
    obj.flowPart246:setName("flowPart246");
    obj.flowPart246:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart246:setVertAlign("leading");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.flowPart246);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout33);
    obj.label136:setAlign("left");
    obj.label136:setAutoSize(true);
    obj.label136:setText("TOTAL:");
    obj.label136:setTextTrimming("none");
    obj.label136:setWordWrap(false);
    obj.label136:setFontSize(10);
    obj.label136:setHorzTextAlign("trailing");
    obj.label136:setName("label136");
    obj.label136:setFontColor("#D0D0D0");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setAlign("client");
    obj.layout34:setMargins({left=5, right=3});
    obj.layout34:setName("layout34");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout34);
    obj.edit143:setAlign("client");
    obj.edit143:setField("DadosDeVidaTotal");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setName("edit143");
    obj.edit143:setFontSize(15);
    obj.edit143:setFontColor("white");
    obj.edit143:setTransparent(true);

    obj.horzLine26 = gui.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine26:setParent(obj.layout34);
    obj.horzLine26:setAlign("bottom");
    obj.horzLine26:setStrokeColor("gray");
    obj.horzLine26:setName("horzLine26");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.flowPart246);
    obj.edit144:setAlign("client");
    obj.edit144:setField("DadosDeVida");
    obj.edit144:setMargins({top=2});
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setFontSize(21);
    obj.edit144:setName("edit144");
    obj.edit144:setFontColor("white");
    obj.edit144:setTransparent(true);

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.flowPart246);
    obj.label137:setAlign("bottom");
    obj.label137:setAutoSize(true);
    obj.label137:setText("DADOS DE VIDA");
    obj.label137:setFontSize(11);
    obj.label137:setVertTextAlign("center");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");
    obj.label137:setFontColor("white");

    obj.flowPart247 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart247:setParent(obj.flowLayout26);
    obj.flowPart247:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart247:setStepSizes({170, 170});
    obj.flowPart247:setHeight(100);
    obj.flowPart247:setName("flowPart247");
    obj.flowPart247:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart247:setVertAlign("leading");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.flowPart247);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(25);
    obj.layout35:setMargins({left=2});
    obj.layout35:setName("layout35");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout35);
    obj.label138:setAlign("client");
    obj.label138:setAutoSize(true);
    obj.label138:setFontSize(10);
    obj.label138:setText("SUCESSOS");
    obj.label138:setWordWrap(false);
    obj.label138:setVertTextAlign("center");
    obj.label138:setHorzTextAlign("trailing");
    obj.label138:setMargins({right=6});
    obj.label138:setName("label138");
    obj.label138:setFontColor("white");

    obj.imageCheckBox25 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox25:setParent(obj.layout35);
    obj.imageCheckBox25:setAlign("right");
    obj.imageCheckBox25:setWidth(25);
    obj.imageCheckBox25:setMargins({right=2});
    obj.imageCheckBox25:setField("testesContraMorte.s0");
    obj.imageCheckBox25:setOptimize(false);
    obj.imageCheckBox25:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox25:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox25:setName("imageCheckBox25");
    obj.imageCheckBox25:setHeight(20);

    obj.imageCheckBox26 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox26:setParent(obj.layout35);
    obj.imageCheckBox26:setAlign("right");
    obj.imageCheckBox26:setWidth(25);
    obj.imageCheckBox26:setMargins({right=2});
    obj.imageCheckBox26:setField("testesContraMorte.s1");
    obj.imageCheckBox26:setOptimize(false);
    obj.imageCheckBox26:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox26:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox26:setName("imageCheckBox26");
    obj.imageCheckBox26:setHeight(20);

    obj.imageCheckBox27 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox27:setParent(obj.layout35);
    obj.imageCheckBox27:setAlign("right");
    obj.imageCheckBox27:setWidth(25);
    obj.imageCheckBox27:setMargins({right=6});
    obj.imageCheckBox27:setField("testesContraMorte.s2");
    obj.imageCheckBox27:setOptimize(false);
    obj.imageCheckBox27:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox27:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox27:setName("imageCheckBox27");
    obj.imageCheckBox27:setHeight(20);

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.flowPart247);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setMargins({left=2, top = 4});
    obj.layout36:setName("layout36");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout36);
    obj.label139:setAlign("client");
    obj.label139:setAutoSize(true);
    obj.label139:setFontSize(10);
    obj.label139:setText("FALHAS");
    obj.label139:setVertTextAlign("center");
    obj.label139:setHorzTextAlign("trailing");
    obj.label139:setMargins({right=6});
    obj.label139:setName("label139");
    obj.label139:setFontColor("white");

    obj.imageCheckBox28 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox28:setParent(obj.layout36);
    obj.imageCheckBox28:setAlign("right");
    obj.imageCheckBox28:setWidth(25);
    obj.imageCheckBox28:setMargins({right=2});
    obj.imageCheckBox28:setField("testesContraMorte.f0");
    obj.imageCheckBox28:setOptimize(false);
    obj.imageCheckBox28:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox28:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox28:setName("imageCheckBox28");
    obj.imageCheckBox28:setHeight(20);

    obj.imageCheckBox29 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox29:setParent(obj.layout36);
    obj.imageCheckBox29:setAlign("right");
    obj.imageCheckBox29:setWidth(25);
    obj.imageCheckBox29:setMargins({right=2});
    obj.imageCheckBox29:setField("testesContraMorte.f1");
    obj.imageCheckBox29:setOptimize(false);
    obj.imageCheckBox29:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox29:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox29:setName("imageCheckBox29");
    obj.imageCheckBox29:setHeight(20);

    obj.imageCheckBox30 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox30:setParent(obj.layout36);
    obj.imageCheckBox30:setAlign("right");
    obj.imageCheckBox30:setWidth(25);
    obj.imageCheckBox30:setMargins({right=6});
    obj.imageCheckBox30:setField("testesContraMorte.f2");
    obj.imageCheckBox30:setOptimize(false);
    obj.imageCheckBox30:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox30:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox30:setName("imageCheckBox30");
    obj.imageCheckBox30:setHeight(20);

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.flowPart247);
    obj.label140:setAlign("bottom");
    obj.label140:setAutoSize(true);
    obj.label140:setText("TESTE CONTRA MORTE");
    obj.label140:setFontSize(11);
    obj.label140:setVertTextAlign("center");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");
    obj.label140:setFontColor("white");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.frmFichaRPGmeister4_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister4_svg:setParent(obj.tab2);
    obj.frmFichaRPGmeister4_svg:setName("frmFichaRPGmeister4_svg");
    obj.frmFichaRPGmeister4_svg:setAlign("client");
    obj.frmFichaRPGmeister4_svg:setTheme("dark");
    obj.frmFichaRPGmeister4_svg:setMargins({top=1});

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmFichaRPGmeister4_svg);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.popHabilidade = gui.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.scrollBox3);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(300);
    obj.popHabilidade:setHeight(240);
    obj.popHabilidade:setBackOpacity(0.4);

    obj.flowLayout27 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.popHabilidade);
    obj.flowLayout27:setAlign("top");
    obj.flowLayout27:setAutoHeight(true);
    obj.flowLayout27:setMaxControlsPerLine(3);
    obj.flowLayout27:setMargins({bottom=4});
    obj.flowLayout27:setHorzAlign("center");
    obj.flowLayout27:setName("flowLayout27");
    obj.flowLayout27:setVertAlign("leading");

    obj.flowPart248 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart248:setParent(obj.flowLayout27);
    obj.flowPart248:setMinWidth(90);
    obj.flowPart248:setMaxWidth(100);
    obj.flowPart248:setHeight(35);
    obj.flowPart248:setName("flowPart248");
    obj.flowPart248:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart248:setVertAlign("leading");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.flowPart248);
    obj.label141:setAlign("top");
    obj.label141:setFontSize(10);
    obj.label141:setText("Nível");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setWordWrap(true);
    obj.label141:setTextTrimming("none");
    obj.label141:setAutoSize(true);
    obj.label141:setName("label141");
    obj.label141:setFontColor("#D0D0D0");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.flowPart248);
    obj.edit145:setAlign("client");
    obj.edit145:setField("nivelHabilidade");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setFontSize(12);
    obj.edit145:setType("number");
    obj.edit145:setName("edit145");
    obj.edit145:setFontColor("white");

    obj.flowPart249 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart249:setParent(obj.flowLayout27);
    obj.flowPart249:setMinWidth(180);
    obj.flowPart249:setMaxWidth(200);
    obj.flowPart249:setHeight(35);
    obj.flowPart249:setName("flowPart249");
    obj.flowPart249:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart249:setVertAlign("leading");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.flowPart249);
    obj.label142:setAlign("top");
    obj.label142:setFontSize(10);
    obj.label142:setText("Obtido");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setWordWrap(true);
    obj.label142:setTextTrimming("none");
    obj.label142:setAutoSize(true);
    obj.label142:setName("label142");
    obj.label142:setFontColor("#D0D0D0");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.flowPart249);
    obj.edit146:setAlign("client");
    obj.edit146:setField("obtencaoHabilidade");
    obj.edit146:setFontSize(12);
    obj.edit146:setName("edit146");
    obj.edit146:setFontColor("white");

    obj.flowPart250 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart250:setParent(obj.flowLayout27);
    obj.flowPart250:setMinWidth(90);
    obj.flowPart250:setMaxWidth(100);
    obj.flowPart250:setHeight(35);
    obj.flowPart250:setName("flowPart250");
    obj.flowPart250:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart250:setVertAlign("leading");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.flowPart250);
    obj.label143:setAlign("top");
    obj.label143:setFontSize(10);
    obj.label143:setText("Página");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setWordWrap(true);
    obj.label143:setTextTrimming("none");
    obj.label143:setAutoSize(true);
    obj.label143:setName("label143");
    obj.label143:setFontColor("#D0D0D0");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.flowPart250);
    obj.edit147:setAlign("client");
    obj.edit147:setField("paginaHabilidade");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setFontSize(12);
    obj.edit147:setType("number");
    obj.edit147:setName("edit147");
    obj.edit147:setFontColor("white");

    obj.flowPart251 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart251:setParent(obj.flowLayout27);
    obj.flowPart251:setMinWidth(180);
    obj.flowPart251:setMaxWidth(200);
    obj.flowPart251:setHeight(35);
    obj.flowPart251:setName("flowPart251");
    obj.flowPart251:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart251:setVertAlign("leading");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.flowPart251);
    obj.label144:setAlign("top");
    obj.label144:setFontSize(10);
    obj.label144:setText("Livro");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setWordWrap(true);
    obj.label144:setTextTrimming("none");
    obj.label144:setAutoSize(true);
    obj.label144:setName("label144");
    obj.label144:setFontColor("#D0D0D0");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.flowPart251);
    obj.edit148:setAlign("client");
    obj.edit148:setField("livroHabilidade");
    obj.edit148:setFontSize(12);
    obj.edit148:setName("edit148");
    obj.edit148:setFontColor("white");

    obj.dataLink47 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.flowLayout27);
    obj.dataLink47:setField("nivelHabilidade");
    obj.dataLink47:setName("dataLink47");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popHabilidade);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox3);
    obj.layout37:setLeft(0);
    obj.layout37:setTop(0);
    obj.layout37:setWidth(380);
    obj.layout37:setHeight(600);
    obj.layout37:setName("layout37");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout37);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("#0000007F");
    obj.rectangle19:setName("rectangle19");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout37);
    obj.label145:setLeft(0);
    obj.label145:setTop(0);
    obj.label145:setWidth(380);
    obj.label145:setHeight(20);
    obj.label145:setText("TALENTOS");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");
    obj.label145:setFontColor("white");

    obj.rclListaDosTalentos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTalentos:setParent(obj.layout37);
    obj.rclListaDosTalentos:setName("rclListaDosTalentos");
    obj.rclListaDosTalentos:setField("campoDosTalentos");
    obj.rclListaDosTalentos:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosTalentos:setLeft(5);
    obj.rclListaDosTalentos:setTop(25);
    obj.rclListaDosTalentos:setWidth(370);
    obj.rclListaDosTalentos:setHeight(570);
    obj.rclListaDosTalentos:setLayout("vertical");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox3);
    obj.layout38:setLeft(395);
    obj.layout38:setTop(0);
    obj.layout38:setWidth(380);
    obj.layout38:setHeight(600);
    obj.layout38:setName("layout38");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout38);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("#0000007F");
    obj.rectangle20:setName("rectangle20");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout38);
    obj.label146:setLeft(0);
    obj.label146:setTop(0);
    obj.label146:setWidth(380);
    obj.label146:setHeight(20);
    obj.label146:setText("OUTROS");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");
    obj.label146:setFontColor("white");

    obj.rclListaDosOutros = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros:setParent(obj.layout38);
    obj.rclListaDosOutros:setName("rclListaDosOutros");
    obj.rclListaDosOutros:setField("campoDosOutros");
    obj.rclListaDosOutros:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosOutros:setLeft(5);
    obj.rclListaDosOutros:setTop(25);
    obj.rclListaDosOutros:setWidth(370);
    obj.rclListaDosOutros:setHeight(570);
    obj.rclListaDosOutros:setLayout("vertical");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox3);
    obj.layout39:setLeft(790);
    obj.layout39:setTop(0);
    obj.layout39:setWidth(380);
    obj.layout39:setHeight(600);
    obj.layout39:setName("layout39");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout39);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("#0000007F");
    obj.rectangle21:setName("rectangle21");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout39);
    obj.label147:setLeft(0);
    obj.label147:setTop(0);
    obj.label147:setWidth(380);
    obj.label147:setHeight(20);
    obj.label147:setText("CARACTERISTICAS DE CLASSE");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");
    obj.label147:setFontColor("white");

    obj.rclListaDasCaracteristicasClasse = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasCaracteristicasClasse:setParent(obj.layout39);
    obj.rclListaDasCaracteristicasClasse:setName("rclListaDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDasCaracteristicasClasse:setLeft(5);
    obj.rclListaDasCaracteristicasClasse:setTop(25);
    obj.rclListaDasCaracteristicasClasse:setWidth(370);
    obj.rclListaDasCaracteristicasClasse:setHeight(570);
    obj.rclListaDasCaracteristicasClasse:setLayout("vertical");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox3);
    obj.layout40:setLeft(1180);
    obj.layout40:setTop(0);
    obj.layout40:setWidth(135);
    obj.layout40:setHeight(600);
    obj.layout40:setName("layout40");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout40);
    obj.button2:setText("Novo Talento");
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setWidth(125);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout40);
    obj.button3:setText("Novo Outros");
    obj.button3:setLeft(0);
    obj.button3:setTop(25);
    obj.button3:setWidth(125);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout40);
    obj.button4:setText("Nova Caracteristica");
    obj.button4:setLeft(0);
    obj.button4:setTop(50);
    obj.button4:setWidth(125);
    obj.button4:setHeight(25);
    obj.button4:setName("button4");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Magias");
    obj.tab3:setName("tab3");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.tab3);
    obj.rectangle22:setName("rectangle22");
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("#40000000");
    obj.rectangle22:setXradius(10);
    obj.rectangle22:setYradius(10);

    obj.popMagia = gui.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj.rectangle22);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setWidth(250);
    obj.popMagia:setHeight(250);
    obj.popMagia:setBackOpacity(0.4);

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.popMagia);
    obj.edit149:setAlign("top");
    obj.edit149:setField("nome");
    obj.edit149:setTextPrompt("NOME DA MAGIA");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setName("edit149");
    obj.edit149:setFontSize(15);
    obj.edit149:setFontColor("white");

    obj.flowLayout28 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.popMagia);
    obj.flowLayout28:setAlign("top");
    obj.flowLayout28:setAutoHeight(true);
    obj.flowLayout28:setMaxControlsPerLine(2);
    obj.flowLayout28:setMargins({bottom=4});
    obj.flowLayout28:setHorzAlign("center");
    obj.flowLayout28:setName("flowLayout28");
    obj.flowLayout28:setVertAlign("leading");

    obj.flowPart252 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart252:setParent(obj.flowLayout28);
    obj.flowPart252:setMinWidth(30);
    obj.flowPart252:setMaxWidth(400);
    obj.flowPart252:setHeight(35);
    obj.flowPart252:setName("flowPart252");
    obj.flowPart252:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart252:setVertAlign("leading");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.flowPart252);
    obj.label148:setAlign("top");
    obj.label148:setFontSize(10);
    obj.label148:setText("TEMPO FORMULAÇÃO");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setWordWrap(true);
    obj.label148:setTextTrimming("none");
    obj.label148:setAutoSize(true);
    obj.label148:setName("label148");
    obj.label148:setFontColor("#D0D0D0");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.flowPart252);
    obj.edit150:setAlign("client");
    obj.edit150:setField("tempoDeFormulacao");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setFontSize(12);
    obj.edit150:setName("edit150");
    obj.edit150:setFontColor("white");

    obj.flowPart253 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart253:setParent(obj.flowLayout28);
    obj.flowPart253:setMinWidth(30);
    obj.flowPart253:setMaxWidth(400);
    obj.flowPart253:setHeight(35);
    obj.flowPart253:setName("flowPart253");
    obj.flowPart253:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart253:setVertAlign("leading");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.flowPart253);
    obj.label149:setAlign("top");
    obj.label149:setFontSize(10);
    obj.label149:setText("ALCANCE");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setWordWrap(true);
    obj.label149:setTextTrimming("none");
    obj.label149:setAutoSize(true);
    obj.label149:setName("label149");
    obj.label149:setFontColor("#D0D0D0");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.flowPart253);
    obj.edit151:setAlign("client");
    obj.edit151:setField("alcance");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setFontSize(12);
    obj.edit151:setName("edit151");
    obj.edit151:setFontColor("white");

    obj.flowPart254 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart254:setParent(obj.flowLayout28);
    obj.flowPart254:setMinWidth(30);
    obj.flowPart254:setMaxWidth(400);
    obj.flowPart254:setHeight(35);
    obj.flowPart254:setName("flowPart254");
    obj.flowPart254:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart254:setVertAlign("leading");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.flowPart254);
    obj.label150:setAlign("top");
    obj.label150:setFontSize(10);
    obj.label150:setText("COMPONENTES");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setWordWrap(true);
    obj.label150:setTextTrimming("none");
    obj.label150:setAutoSize(true);
    obj.label150:setName("label150");
    obj.label150:setFontColor("#D0D0D0");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.flowPart254);
    obj.edit152:setAlign("client");
    obj.edit152:setField("componentes");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setFontSize(12);
    obj.edit152:setName("edit152");
    obj.edit152:setFontColor("white");

    obj.flowPart255 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart255:setParent(obj.flowLayout28);
    obj.flowPart255:setMinWidth(30);
    obj.flowPart255:setMaxWidth(400);
    obj.flowPart255:setHeight(35);
    obj.flowPart255:setName("flowPart255");
    obj.flowPart255:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart255:setVertAlign("leading");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.flowPart255);
    obj.label151:setAlign("top");
    obj.label151:setFontSize(10);
    obj.label151:setText("DURAÇÃO");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setWordWrap(true);
    obj.label151:setTextTrimming("none");
    obj.label151:setAutoSize(true);
    obj.label151:setName("label151");
    obj.label151:setFontColor("#D0D0D0");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.flowPart255);
    obj.edit153:setAlign("client");
    obj.edit153:setField("duracao");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setFontSize(12);
    obj.edit153:setName("edit153");
    obj.edit153:setFontColor("white");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popMagia);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("descricao");
    obj.textEditor3:setName("textEditor3");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.rectangle22);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.fraMagiasLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraMagiasLayout:setParent(obj.scrollBox4);
    obj.fraMagiasLayout:setAlign("top");
    obj.fraMagiasLayout:setHeight(500);
    obj.fraMagiasLayout:setMargins({left=10, right=10, top=10});
    obj.fraMagiasLayout:setAutoHeight(true);
    obj.fraMagiasLayout:setHorzAlign("center");
    obj.fraMagiasLayout:setLineSpacing(3);
    obj.fraMagiasLayout:setName("fraMagiasLayout");
    obj.fraMagiasLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraMagiasLayout:setMinScaledWidth(300);
    obj.fraMagiasLayout:setVertAlign("leading");

    obj.flowLayout29 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.fraMagiasLayout);
    obj.flowLayout29:setAutoHeight(true);
    obj.flowLayout29:setMinScaledWidth(290);
    obj.flowLayout29:setHorzAlign("center");
    obj.flowLayout29:setName("flowLayout29");
    obj.flowLayout29:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout29:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout29:setVertAlign("leading");

    obj.flowPart256 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart256:setParent(obj.flowLayout29);
    obj.flowPart256:setMinWidth(320);
    obj.flowPart256:setMaxWidth(1600);
    obj.flowPart256:setFrameStyle("frames/banner/magicGroup.xml");
    obj.flowPart256:setHeight(175);
    obj.flowPart256:setVertAlign("center");
    obj.flowPart256:setAvoidScale(true);
    obj.flowPart256:setName("flowPart256");
    obj.flowPart256:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart256:setMinScaledWidth(300);
    obj.flowPart256:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.flowPart256);
    obj.layout41:setAlign("client");
    obj.layout41:setName("layout41");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout41);
    obj.edit154:setField("magias.classeConjuradora");
    obj.edit154:setFontSize(17);
    obj.edit154:setAlign("client");
    obj.edit154:setName("edit154");
    obj.edit154:setFontColor("white");
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setTransparent(true);

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout41);
    obj.label152:setAlign("bottom");
    obj.label152:setText("CLASSE CONJURADORA");
    obj.label152:setAutoSize(true);
    obj.label152:setMargins({left=3});
    obj.label152:setName("label152");
    obj.label152:setFontSize(12);
    obj.label152:setFontColor("#D0D0D0");

    obj.fraUpperGridMagias = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridMagias:setParent(obj.flowLayout29);
    obj.fraUpperGridMagias:setMinWidth(320);
    obj.fraUpperGridMagias:setMaxWidth(1600);
    obj.fraUpperGridMagias:setName("fraUpperGridMagias");
    obj.fraUpperGridMagias:setAvoidScale(true);
    obj.fraUpperGridMagias:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridMagias:setAutoHeight(true);
    obj.fraUpperGridMagias:setVertAlign("trailing");
    obj.fraUpperGridMagias:setMaxControlsPerLine(2);
    obj.fraUpperGridMagias:setHorzAlign("center");
    obj.fraUpperGridMagias:setLineSpacing(8);
    obj.fraUpperGridMagias:setStepSizes({310, 360, 420});
    obj.fraUpperGridMagias:setMinScaledWidth(300);
    obj.fraUpperGridMagias:setMaxScaledWidth(340);
    obj.fraUpperGridMagias:setMargins({left=1, right=1, top=2, bottom=2});

    obj.upperGridMagicBox1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox1:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicBox1:setHeight(50);
    obj.upperGridMagicBox1:setMinScaledWidth(145);
    obj.upperGridMagicBox1:setMinWidth(145);
    obj.upperGridMagicBox1:setMaxWidth(160);
    obj.upperGridMagicBox1:setMaxScaledWidth(160);
    obj.upperGridMagicBox1:setAvoidScale(true);
    obj.upperGridMagicBox1:setName("upperGridMagicBox1");
    obj.upperGridMagicBox1:setVertAlign("leading");
    obj.upperGridMagicBox1:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicBox1, "_RecalcSize", 
						function ()
							self.upperGridMagicBox1:setHeight(self.panupperGridMagicBox1:getHeight() + self.labupperGridMagicBox1:getHeight());
						end);														
				


    obj.panupperGridMagicBox1 = gui.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox1:setParent(obj.upperGridMagicBox1);
    obj.panupperGridMagicBox1:setName("panupperGridMagicBox1");
    obj.panupperGridMagicBox1:setAlign("top");
    obj.panupperGridMagicBox1:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox1:setHeight(60);

    obj.cmbupperGridMagicBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.cmbupperGridMagicBox1:setParent(obj.panupperGridMagicBox1);
    obj.cmbupperGridMagicBox1:setName("cmbupperGridMagicBox1");
    obj.cmbupperGridMagicBox1:setFrameRegion("ContentRegion");
    obj.cmbupperGridMagicBox1:setField("magias.habilidadeDeConjuracao");
    obj.cmbupperGridMagicBox1:setItems({'', 'INTELIGÊNCIA', 'SABEDORIA', 'CARISMA'});
    obj.cmbupperGridMagicBox1:setValues({'', 'int', 'sab', 'car'});
    obj.cmbupperGridMagicBox1:setHorzTextAlign("center");
    obj.cmbupperGridMagicBox1:setVertTextAlign("center");
    obj.cmbupperGridMagicBox1:setFontSize(13);
    obj.cmbupperGridMagicBox1:setTransparent(true);

    obj.labupperGridMagicBox1 = gui.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox1:setParent(obj.upperGridMagicBox1);
    obj.labupperGridMagicBox1:setName("labupperGridMagicBox1");
    obj.labupperGridMagicBox1:setAlign("top");
    obj.labupperGridMagicBox1:setAutoSize(true);
    obj.labupperGridMagicBox1:setText("HABILIDADE DE CONJURAÇÃO");
    obj.labupperGridMagicBox1:setHorzTextAlign("center");
    obj.labupperGridMagicBox1:setVertTextAlign("leading");
    obj.labupperGridMagicBox1:setWordWrap(true);
    obj.labupperGridMagicBox1:setTextTrimming("none");
    obj.labupperGridMagicBox1:setFontSize(12);
    obj.labupperGridMagicBox1:setFontColor("#D0D0D0");

self.upperGridMagicBox1._RecalcSize();	


    obj.upperGridMagicBox2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox2:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicBox2:setHeight(50);
    obj.upperGridMagicBox2:setMinScaledWidth(100);
    obj.upperGridMagicBox2:setMinWidth(100);
    obj.upperGridMagicBox2:setMaxWidth(160);
    obj.upperGridMagicBox2:setMaxScaledWidth(160);
    obj.upperGridMagicBox2:setAvoidScale(true);
    obj.upperGridMagicBox2:setName("upperGridMagicBox2");
    obj.upperGridMagicBox2:setVertAlign("leading");
    obj.upperGridMagicBox2:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicBox2, "_RecalcSize", 
						function ()
							self.upperGridMagicBox2:setHeight(self.panupperGridMagicBox2:getHeight() + self.labupperGridMagicBox2:getHeight());
						end);														
				


    obj.panupperGridMagicBox2 = gui.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox2:setParent(obj.upperGridMagicBox2);
    obj.panupperGridMagicBox2:setName("panupperGridMagicBox2");
    obj.panupperGridMagicBox2:setAlign("top");
    obj.panupperGridMagicBox2:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox2:setHeight(60);

    obj.labupperGridMagicBox2val = gui.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox2val:setParent(obj.panupperGridMagicBox2);
    obj.labupperGridMagicBox2val:setName("labupperGridMagicBox2val");
    obj.labupperGridMagicBox2val:setFrameRegion("ContentRegion");
    obj.labupperGridMagicBox2val:setField("magias.cdDaMagia");
    obj.labupperGridMagicBox2val:setFontSize(22);
    obj.labupperGridMagicBox2val:setVertTextAlign("center");
    obj.labupperGridMagicBox2val:setHorzTextAlign("center");
    obj.labupperGridMagicBox2val:setFontColor("white");

    obj.labupperGridMagicBox2 = gui.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox2:setParent(obj.upperGridMagicBox2);
    obj.labupperGridMagicBox2:setName("labupperGridMagicBox2");
    obj.labupperGridMagicBox2:setAlign("top");
    obj.labupperGridMagicBox2:setAutoSize(true);
    obj.labupperGridMagicBox2:setText("CD DA MAGIA");
    obj.labupperGridMagicBox2:setHorzTextAlign("center");
    obj.labupperGridMagicBox2:setVertTextAlign("leading");
    obj.labupperGridMagicBox2:setWordWrap(true);
    obj.labupperGridMagicBox2:setTextTrimming("none");
    obj.labupperGridMagicBox2:setFontSize(12);
    obj.labupperGridMagicBox2:setFontColor("#D0D0D0");

self.upperGridMagicBox2._RecalcSize();	


    obj.upperGridMagicBox3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox3:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicBox3:setHeight(50);
    obj.upperGridMagicBox3:setMinScaledWidth(100);
    obj.upperGridMagicBox3:setMinWidth(100);
    obj.upperGridMagicBox3:setMaxWidth(160);
    obj.upperGridMagicBox3:setMaxScaledWidth(160);
    obj.upperGridMagicBox3:setAvoidScale(true);
    obj.upperGridMagicBox3:setName("upperGridMagicBox3");
    obj.upperGridMagicBox3:setVertAlign("leading");
    obj.upperGridMagicBox3:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicBox3, "_RecalcSize", 
						function ()
							self.upperGridMagicBox3:setHeight(self.panupperGridMagicBox3:getHeight() + self.labupperGridMagicBox3:getHeight());
						end);														
				


    obj.panupperGridMagicBox3 = gui.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox3:setParent(obj.upperGridMagicBox3);
    obj.panupperGridMagicBox3:setName("panupperGridMagicBox3");
    obj.panupperGridMagicBox3:setAlign("top");
    obj.panupperGridMagicBox3:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox3:setHeight(60);

    obj.labupperGridMagicBox3val = gui.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox3val:setParent(obj.panupperGridMagicBox3);
    obj.labupperGridMagicBox3val:setName("labupperGridMagicBox3val");
    obj.labupperGridMagicBox3val:setFrameRegion("ContentRegion");
    obj.labupperGridMagicBox3val:setField("magias.bonusAtaqueSTR");
    obj.labupperGridMagicBox3val:setFontSize(22);
    obj.labupperGridMagicBox3val:setVertTextAlign("center");
    obj.labupperGridMagicBox3val:setHorzTextAlign("center");
    obj.labupperGridMagicBox3val:setFontColor("white");

    obj.labupperGridMagicBox3 = gui.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox3:setParent(obj.upperGridMagicBox3);
    obj.labupperGridMagicBox3:setName("labupperGridMagicBox3");
    obj.labupperGridMagicBox3:setAlign("top");
    obj.labupperGridMagicBox3:setAutoSize(true);
    obj.labupperGridMagicBox3:setText("BÔNUS DE ATAQUE DE MAGIA");
    obj.labupperGridMagicBox3:setHorzTextAlign("center");
    obj.labupperGridMagicBox3:setVertTextAlign("leading");
    obj.labupperGridMagicBox3:setWordWrap(true);
    obj.labupperGridMagicBox3:setTextTrimming("none");
    obj.labupperGridMagicBox3:setFontSize(12);
    obj.labupperGridMagicBox3:setFontColor("#D0D0D0");

self.upperGridMagicBox3._RecalcSize();	


    obj.upperGridMagicEditBox1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox1:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicEditBox1:setHeight(50);
    obj.upperGridMagicEditBox1:setMinScaledWidth(100);
    obj.upperGridMagicEditBox1:setMinWidth(100);
    obj.upperGridMagicEditBox1:setMaxWidth(160);
    obj.upperGridMagicEditBox1:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox1:setAvoidScale(true);
    obj.upperGridMagicEditBox1:setName("upperGridMagicEditBox1");
    obj.upperGridMagicEditBox1:setVertAlign("leading");
    obj.upperGridMagicEditBox1:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox1, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox1:setHeight(self.panupperGridMagicEditBox1:getHeight() + self.labupperGridMagicEditBox1:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox1 = gui.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox1:setParent(obj.upperGridMagicEditBox1);
    obj.panupperGridMagicEditBox1:setName("panupperGridMagicEditBox1");
    obj.panupperGridMagicEditBox1:setAlign("top");
    obj.panupperGridMagicEditBox1:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox1:setHeight(60);

    obj.edtupperGridMagicEditBox1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox1:setParent(obj.panupperGridMagicEditBox1);
    obj.edtupperGridMagicEditBox1:setName("edtupperGridMagicEditBox1");
    obj.edtupperGridMagicEditBox1:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox1:setField("magias.spKi");
    obj.edtupperGridMagicEditBox1:setFontSize(22);
    obj.edtupperGridMagicEditBox1:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox1:setFontColor("white");
    obj.edtupperGridMagicEditBox1:setTransparent(true);

    obj.labupperGridMagicEditBox1 = gui.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox1:setParent(obj.upperGridMagicEditBox1);
    obj.labupperGridMagicEditBox1:setName("labupperGridMagicEditBox1");
    obj.labupperGridMagicEditBox1:setAlign("top");
    obj.labupperGridMagicEditBox1:setAutoSize(true);
    obj.labupperGridMagicEditBox1:setText("SP/Ki");
    obj.labupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox1:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox1:setWordWrap(true);
    obj.labupperGridMagicEditBox1:setTextTrimming("none");
    obj.labupperGridMagicEditBox1:setFontSize(12);
    obj.labupperGridMagicEditBox1:setFontColor("#D0D0D0");

self.upperGridMagicEditBox1._RecalcSize();	


    obj.dataLink48 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.fraMagiasLayout);
    obj.dataLink48:setFields({'magias.habilidadeDeConjuracao', 'atributos.modInteligencia', 'atributos.modSabedoria', 'atributos.modCarisma', 'bonusProficiencia'});
    obj.dataLink48:setName("dataLink48");

    obj.flowLineBreak15 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.fraMagiasLayout);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.flowLayout30 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.fraMagiasLayout);
    obj.flowLayout30:setAutoHeight(true);
    obj.flowLayout30:setMaxColumns(3);
    obj.flowLayout30:setHorzAlign("center");
    obj.flowLayout30:setOrientation("vertical");
    obj.flowLayout30:setName("flowLayout30");
    obj.flowLayout30:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout30:setMinScaledWidth(300);
    obj.flowLayout30:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout30:setVertAlign("leading");

    obj.flowLayout31 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.flowLayout30);
    obj.flowLayout31:setHeight(100);
    obj.flowLayout31:setAvoidScale(true);
    obj.flowLayout31:setMaxControlsPerLine(1);
    obj.flowLayout31:setAutoHeight(true);
    obj.flowLayout31:setName("flowLayout31");
    obj.flowLayout31:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout31:setStepSizes({310, 360, 420, 600});
    obj.flowLayout31:setMinScaledWidth(300);
    obj.flowLayout31:setMaxScaledWidth(600);
    obj.flowLayout31:setVertAlign("leading");

    obj.flowPart257 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart257:setParent(obj.flowLayout31);
    obj.flowPart257:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart257:setName("flowPart257");
    obj.flowPart257:setAvoidScale(true);
    obj.flowPart257:setMinScaledWidth(280);
    obj.flowPart257:setMinWidth(300);
    obj.flowPart257:setMaxWidth(600);
    obj.flowPart257:setHeight(80);
    obj.flowPart257:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart257:setVertAlign("leading");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.flowPart257);
    obj.label153:setFrameRegion("RegiaoSmallTitulo");
    obj.label153:setText("0");
    obj.label153:setName("label153");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setVertTextAlign("center");
    obj.label153:setFontSize(18);
    obj.label153:setFontColor("white");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.flowPart257);
    obj.label154:setFrameRegion("RegiaoConteudo");
    obj.label154:setText("PRECES E TRUQUES");
    obj.label154:setFontSize(15);
    obj.label154:setHorzTextAlign("center");
    obj.label154:setVertTextAlign("center");
    obj.label154:setName("label154");
    obj.label154:setFontColor("white");

    obj.flwMagicRecordList1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList1:setParent(obj.flowLayout31);
    obj.flwMagicRecordList1:setMinWidth(300);
    obj.flwMagicRecordList1:setMaxWidth(600);
    obj.flwMagicRecordList1:setMinScaledWidth(280);
    obj.flwMagicRecordList1:setName("flwMagicRecordList1");
    obj.flwMagicRecordList1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList1:setVertAlign("leading");


					rawset(self.flwMagicRecordList1, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList1.height = self.rclflwMagicRecordList1.height +
														self.layBottomflwMagicRecordList1.height + 
														self.flwMagicRecordList1.padding.top + self.flwMagicRecordList1.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList1 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList1:setParent(obj.flwMagicRecordList1);
    obj.rclflwMagicRecordList1:setName("rclflwMagicRecordList1");
    obj.rclflwMagicRecordList1:setAlign("top");
    obj.rclflwMagicRecordList1:setField("magias.magias.nivel0");
    obj.rclflwMagicRecordList1:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclflwMagicRecordList1:setAutoHeight(true);
    obj.rclflwMagicRecordList1:setMinHeight(5);
    obj.rclflwMagicRecordList1:setHitTest(false);
    obj.rclflwMagicRecordList1:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList1:setParent(obj.flwMagicRecordList1);
    obj.layBottomflwMagicRecordList1:setName("layBottomflwMagicRecordList1");
    obj.layBottomflwMagicRecordList1:setAlign("top");
    obj.layBottomflwMagicRecordList1:setHeight(36);

    obj.btnNovoflwMagicRecordList1 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList1:setParent(obj.layBottomflwMagicRecordList1);
    obj.btnNovoflwMagicRecordList1:setName("btnNovoflwMagicRecordList1");
    obj.btnNovoflwMagicRecordList1:setAlign("left");
    obj.btnNovoflwMagicRecordList1:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList1:setWidth(160);
    obj.btnNovoflwMagicRecordList1:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList1._recalcHeight();


    obj.flowLayout32 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.flowLayout30);
    obj.flowLayout32:setHeight(100);
    obj.flowLayout32:setAvoidScale(true);
    obj.flowLayout32:setMaxControlsPerLine(1);
    obj.flowLayout32:setAutoHeight(true);
    obj.flowLayout32:setName("flowLayout32");
    obj.flowLayout32:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout32:setStepSizes({310, 360, 420, 600});
    obj.flowLayout32:setMinScaledWidth(300);
    obj.flowLayout32:setMaxScaledWidth(600);
    obj.flowLayout32:setVertAlign("leading");

    obj.flowPart258 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart258:setParent(obj.flowLayout32);
    obj.flowPart258:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart258:setName("flowPart258");
    obj.flowPart258:setAvoidScale(true);
    obj.flowPart258:setMinScaledWidth(280);
    obj.flowPart258:setMinWidth(300);
    obj.flowPart258:setMaxWidth(600);
    obj.flowPart258:setHeight(80);
    obj.flowPart258:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart258:setVertAlign("leading");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.flowPart258);
    obj.label155:setFrameRegion("RegiaoSmallTitulo");
    obj.label155:setText("1");
    obj.label155:setName("label155");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setVertTextAlign("center");
    obj.label155:setFontSize(18);
    obj.label155:setFontColor("white");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.flowPart258);
    obj.edit155:setFrameRegion("RegiaoConteudo1");
    obj.edit155:setField("magias.espacosTotais1");
    obj.edit155:setName("edit155");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setFontSize(18);
    obj.edit155:setTransparent(true);
    obj.edit155:setFontColor("white");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.flowPart258);
    obj.edit156:setFrameRegion("RegiaoConteudo2");
    obj.edit156:setField("magias.espacosGastos1");
    obj.edit156:setName("edit156");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setFontSize(18);
    obj.edit156:setTransparent(true);
    obj.edit156:setFontColor("white");

    obj.flwMagicRecordList2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList2:setParent(obj.flowLayout32);
    obj.flwMagicRecordList2:setMinWidth(300);
    obj.flwMagicRecordList2:setMaxWidth(600);
    obj.flwMagicRecordList2:setMinScaledWidth(280);
    obj.flwMagicRecordList2:setName("flwMagicRecordList2");
    obj.flwMagicRecordList2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList2:setVertAlign("leading");


					rawset(self.flwMagicRecordList2, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList2.height = self.rclflwMagicRecordList2.height +
														self.layBottomflwMagicRecordList2.height + 
														self.flwMagicRecordList2.padding.top + self.flwMagicRecordList2.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList2 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList2:setParent(obj.flwMagicRecordList2);
    obj.rclflwMagicRecordList2:setName("rclflwMagicRecordList2");
    obj.rclflwMagicRecordList2:setAlign("top");
    obj.rclflwMagicRecordList2:setField("magias.magias.nivel1");
    obj.rclflwMagicRecordList2:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList2:setAutoHeight(true);
    obj.rclflwMagicRecordList2:setMinHeight(5);
    obj.rclflwMagicRecordList2:setHitTest(false);
    obj.rclflwMagicRecordList2:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList2:setParent(obj.flwMagicRecordList2);
    obj.layBottomflwMagicRecordList2:setName("layBottomflwMagicRecordList2");
    obj.layBottomflwMagicRecordList2:setAlign("top");
    obj.layBottomflwMagicRecordList2:setHeight(36);

    obj.btnNovoflwMagicRecordList2 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList2:setParent(obj.layBottomflwMagicRecordList2);
    obj.btnNovoflwMagicRecordList2:setName("btnNovoflwMagicRecordList2");
    obj.btnNovoflwMagicRecordList2:setAlign("left");
    obj.btnNovoflwMagicRecordList2:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList2:setWidth(160);
    obj.btnNovoflwMagicRecordList2:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList2._recalcHeight();


    obj.flowLayout33 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.flowLayout30);
    obj.flowLayout33:setHeight(100);
    obj.flowLayout33:setAvoidScale(true);
    obj.flowLayout33:setMaxControlsPerLine(1);
    obj.flowLayout33:setAutoHeight(true);
    obj.flowLayout33:setName("flowLayout33");
    obj.flowLayout33:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout33:setStepSizes({310, 360, 420, 600});
    obj.flowLayout33:setMinScaledWidth(300);
    obj.flowLayout33:setMaxScaledWidth(600);
    obj.flowLayout33:setVertAlign("leading");

    obj.flowPart259 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart259:setParent(obj.flowLayout33);
    obj.flowPart259:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart259:setName("flowPart259");
    obj.flowPart259:setAvoidScale(true);
    obj.flowPart259:setMinScaledWidth(280);
    obj.flowPart259:setMinWidth(300);
    obj.flowPart259:setMaxWidth(600);
    obj.flowPart259:setHeight(80);
    obj.flowPart259:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart259:setVertAlign("leading");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.flowPart259);
    obj.label156:setFrameRegion("RegiaoSmallTitulo");
    obj.label156:setText("2");
    obj.label156:setName("label156");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setVertTextAlign("center");
    obj.label156:setFontSize(18);
    obj.label156:setFontColor("white");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.flowPart259);
    obj.edit157:setFrameRegion("RegiaoConteudo1");
    obj.edit157:setField("magias.espacosTotais2");
    obj.edit157:setName("edit157");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setFontSize(18);
    obj.edit157:setTransparent(true);
    obj.edit157:setFontColor("white");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.flowPart259);
    obj.edit158:setFrameRegion("RegiaoConteudo2");
    obj.edit158:setField("magias.espacosGastos2");
    obj.edit158:setName("edit158");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setFontSize(18);
    obj.edit158:setTransparent(true);
    obj.edit158:setFontColor("white");

    obj.flwMagicRecordList3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList3:setParent(obj.flowLayout33);
    obj.flwMagicRecordList3:setMinWidth(300);
    obj.flwMagicRecordList3:setMaxWidth(600);
    obj.flwMagicRecordList3:setMinScaledWidth(280);
    obj.flwMagicRecordList3:setName("flwMagicRecordList3");
    obj.flwMagicRecordList3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList3:setVertAlign("leading");


					rawset(self.flwMagicRecordList3, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList3.height = self.rclflwMagicRecordList3.height +
														self.layBottomflwMagicRecordList3.height + 
														self.flwMagicRecordList3.padding.top + self.flwMagicRecordList3.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList3 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList3:setParent(obj.flwMagicRecordList3);
    obj.rclflwMagicRecordList3:setName("rclflwMagicRecordList3");
    obj.rclflwMagicRecordList3:setAlign("top");
    obj.rclflwMagicRecordList3:setField("magias.magias.nivel2");
    obj.rclflwMagicRecordList3:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList3:setAutoHeight(true);
    obj.rclflwMagicRecordList3:setMinHeight(5);
    obj.rclflwMagicRecordList3:setHitTest(false);
    obj.rclflwMagicRecordList3:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList3:setParent(obj.flwMagicRecordList3);
    obj.layBottomflwMagicRecordList3:setName("layBottomflwMagicRecordList3");
    obj.layBottomflwMagicRecordList3:setAlign("top");
    obj.layBottomflwMagicRecordList3:setHeight(36);

    obj.btnNovoflwMagicRecordList3 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList3:setParent(obj.layBottomflwMagicRecordList3);
    obj.btnNovoflwMagicRecordList3:setName("btnNovoflwMagicRecordList3");
    obj.btnNovoflwMagicRecordList3:setAlign("left");
    obj.btnNovoflwMagicRecordList3:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList3:setWidth(160);
    obj.btnNovoflwMagicRecordList3:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList3._recalcHeight();


    obj.flowLayout34 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.flowLayout30);
    obj.flowLayout34:setHeight(100);
    obj.flowLayout34:setAvoidScale(true);
    obj.flowLayout34:setMaxControlsPerLine(1);
    obj.flowLayout34:setAutoHeight(true);
    obj.flowLayout34:setName("flowLayout34");
    obj.flowLayout34:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout34:setStepSizes({310, 360, 420, 600});
    obj.flowLayout34:setMinScaledWidth(300);
    obj.flowLayout34:setMaxScaledWidth(600);
    obj.flowLayout34:setVertAlign("leading");

    obj.flowPart260 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart260:setParent(obj.flowLayout34);
    obj.flowPart260:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart260:setName("flowPart260");
    obj.flowPart260:setAvoidScale(true);
    obj.flowPart260:setMinScaledWidth(280);
    obj.flowPart260:setMinWidth(300);
    obj.flowPart260:setMaxWidth(600);
    obj.flowPart260:setHeight(80);
    obj.flowPart260:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart260:setVertAlign("leading");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.flowPart260);
    obj.label157:setFrameRegion("RegiaoSmallTitulo");
    obj.label157:setText("3");
    obj.label157:setName("label157");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setVertTextAlign("center");
    obj.label157:setFontSize(18);
    obj.label157:setFontColor("white");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.flowPart260);
    obj.edit159:setFrameRegion("RegiaoConteudo1");
    obj.edit159:setField("magias.espacosTotais3");
    obj.edit159:setName("edit159");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setFontSize(18);
    obj.edit159:setTransparent(true);
    obj.edit159:setFontColor("white");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.flowPart260);
    obj.edit160:setFrameRegion("RegiaoConteudo2");
    obj.edit160:setField("magias.espacosGastos3");
    obj.edit160:setName("edit160");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setFontSize(18);
    obj.edit160:setTransparent(true);
    obj.edit160:setFontColor("white");

    obj.flwMagicRecordList4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList4:setParent(obj.flowLayout34);
    obj.flwMagicRecordList4:setMinWidth(300);
    obj.flwMagicRecordList4:setMaxWidth(600);
    obj.flwMagicRecordList4:setMinScaledWidth(280);
    obj.flwMagicRecordList4:setName("flwMagicRecordList4");
    obj.flwMagicRecordList4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList4:setVertAlign("leading");


					rawset(self.flwMagicRecordList4, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList4.height = self.rclflwMagicRecordList4.height +
														self.layBottomflwMagicRecordList4.height + 
														self.flwMagicRecordList4.padding.top + self.flwMagicRecordList4.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList4 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList4:setParent(obj.flwMagicRecordList4);
    obj.rclflwMagicRecordList4:setName("rclflwMagicRecordList4");
    obj.rclflwMagicRecordList4:setAlign("top");
    obj.rclflwMagicRecordList4:setField("magias.magias.nivel3");
    obj.rclflwMagicRecordList4:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList4:setAutoHeight(true);
    obj.rclflwMagicRecordList4:setMinHeight(5);
    obj.rclflwMagicRecordList4:setHitTest(false);
    obj.rclflwMagicRecordList4:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList4:setParent(obj.flwMagicRecordList4);
    obj.layBottomflwMagicRecordList4:setName("layBottomflwMagicRecordList4");
    obj.layBottomflwMagicRecordList4:setAlign("top");
    obj.layBottomflwMagicRecordList4:setHeight(36);

    obj.btnNovoflwMagicRecordList4 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList4:setParent(obj.layBottomflwMagicRecordList4);
    obj.btnNovoflwMagicRecordList4:setName("btnNovoflwMagicRecordList4");
    obj.btnNovoflwMagicRecordList4:setAlign("left");
    obj.btnNovoflwMagicRecordList4:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList4:setWidth(160);
    obj.btnNovoflwMagicRecordList4:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList4._recalcHeight();


    obj.flowLayout35 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout35:setParent(obj.flowLayout30);
    obj.flowLayout35:setHeight(100);
    obj.flowLayout35:setAvoidScale(true);
    obj.flowLayout35:setMaxControlsPerLine(1);
    obj.flowLayout35:setAutoHeight(true);
    obj.flowLayout35:setName("flowLayout35");
    obj.flowLayout35:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout35:setStepSizes({310, 360, 420, 600});
    obj.flowLayout35:setMinScaledWidth(300);
    obj.flowLayout35:setMaxScaledWidth(600);
    obj.flowLayout35:setVertAlign("leading");

    obj.flowPart261 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart261:setParent(obj.flowLayout35);
    obj.flowPart261:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart261:setName("flowPart261");
    obj.flowPart261:setAvoidScale(true);
    obj.flowPart261:setMinScaledWidth(280);
    obj.flowPart261:setMinWidth(300);
    obj.flowPart261:setMaxWidth(600);
    obj.flowPart261:setHeight(80);
    obj.flowPart261:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart261:setVertAlign("leading");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.flowPart261);
    obj.label158:setFrameRegion("RegiaoSmallTitulo");
    obj.label158:setText("4");
    obj.label158:setName("label158");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setVertTextAlign("center");
    obj.label158:setFontSize(18);
    obj.label158:setFontColor("white");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.flowPart261);
    obj.edit161:setFrameRegion("RegiaoConteudo1");
    obj.edit161:setField("magias.espacosTotais4");
    obj.edit161:setName("edit161");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setFontSize(18);
    obj.edit161:setTransparent(true);
    obj.edit161:setFontColor("white");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.flowPart261);
    obj.edit162:setFrameRegion("RegiaoConteudo2");
    obj.edit162:setField("magias.espacosGastos4");
    obj.edit162:setName("edit162");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setFontSize(18);
    obj.edit162:setTransparent(true);
    obj.edit162:setFontColor("white");

    obj.flwMagicRecordList5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList5:setParent(obj.flowLayout35);
    obj.flwMagicRecordList5:setMinWidth(300);
    obj.flwMagicRecordList5:setMaxWidth(600);
    obj.flwMagicRecordList5:setMinScaledWidth(280);
    obj.flwMagicRecordList5:setName("flwMagicRecordList5");
    obj.flwMagicRecordList5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList5:setVertAlign("leading");


					rawset(self.flwMagicRecordList5, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList5.height = self.rclflwMagicRecordList5.height +
														self.layBottomflwMagicRecordList5.height + 
														self.flwMagicRecordList5.padding.top + self.flwMagicRecordList5.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList5 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList5:setParent(obj.flwMagicRecordList5);
    obj.rclflwMagicRecordList5:setName("rclflwMagicRecordList5");
    obj.rclflwMagicRecordList5:setAlign("top");
    obj.rclflwMagicRecordList5:setField("magias.magias.nivel4");
    obj.rclflwMagicRecordList5:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList5:setAutoHeight(true);
    obj.rclflwMagicRecordList5:setMinHeight(5);
    obj.rclflwMagicRecordList5:setHitTest(false);
    obj.rclflwMagicRecordList5:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList5:setParent(obj.flwMagicRecordList5);
    obj.layBottomflwMagicRecordList5:setName("layBottomflwMagicRecordList5");
    obj.layBottomflwMagicRecordList5:setAlign("top");
    obj.layBottomflwMagicRecordList5:setHeight(36);

    obj.btnNovoflwMagicRecordList5 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList5:setParent(obj.layBottomflwMagicRecordList5);
    obj.btnNovoflwMagicRecordList5:setName("btnNovoflwMagicRecordList5");
    obj.btnNovoflwMagicRecordList5:setAlign("left");
    obj.btnNovoflwMagicRecordList5:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList5:setWidth(160);
    obj.btnNovoflwMagicRecordList5:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList5._recalcHeight();


    obj.flowLayout36 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout36:setParent(obj.flowLayout30);
    obj.flowLayout36:setHeight(100);
    obj.flowLayout36:setAvoidScale(true);
    obj.flowLayout36:setMaxControlsPerLine(1);
    obj.flowLayout36:setAutoHeight(true);
    obj.flowLayout36:setName("flowLayout36");
    obj.flowLayout36:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout36:setStepSizes({310, 360, 420, 600});
    obj.flowLayout36:setMinScaledWidth(300);
    obj.flowLayout36:setMaxScaledWidth(600);
    obj.flowLayout36:setVertAlign("leading");

    obj.flowPart262 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart262:setParent(obj.flowLayout36);
    obj.flowPart262:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart262:setName("flowPart262");
    obj.flowPart262:setAvoidScale(true);
    obj.flowPart262:setMinScaledWidth(280);
    obj.flowPart262:setMinWidth(300);
    obj.flowPart262:setMaxWidth(600);
    obj.flowPart262:setHeight(80);
    obj.flowPart262:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart262:setVertAlign("leading");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.flowPart262);
    obj.label159:setFrameRegion("RegiaoSmallTitulo");
    obj.label159:setText("5");
    obj.label159:setName("label159");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setVertTextAlign("center");
    obj.label159:setFontSize(18);
    obj.label159:setFontColor("white");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.flowPart262);
    obj.edit163:setFrameRegion("RegiaoConteudo1");
    obj.edit163:setField("magias.espacosTotais5");
    obj.edit163:setName("edit163");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setFontSize(18);
    obj.edit163:setTransparent(true);
    obj.edit163:setFontColor("white");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.flowPart262);
    obj.edit164:setFrameRegion("RegiaoConteudo2");
    obj.edit164:setField("magias.espacosGastos5");
    obj.edit164:setName("edit164");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setFontSize(18);
    obj.edit164:setTransparent(true);
    obj.edit164:setFontColor("white");

    obj.flwMagicRecordList6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList6:setParent(obj.flowLayout36);
    obj.flwMagicRecordList6:setMinWidth(300);
    obj.flwMagicRecordList6:setMaxWidth(600);
    obj.flwMagicRecordList6:setMinScaledWidth(280);
    obj.flwMagicRecordList6:setName("flwMagicRecordList6");
    obj.flwMagicRecordList6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList6:setVertAlign("leading");


					rawset(self.flwMagicRecordList6, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList6.height = self.rclflwMagicRecordList6.height +
														self.layBottomflwMagicRecordList6.height + 
														self.flwMagicRecordList6.padding.top + self.flwMagicRecordList6.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList6 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList6:setParent(obj.flwMagicRecordList6);
    obj.rclflwMagicRecordList6:setName("rclflwMagicRecordList6");
    obj.rclflwMagicRecordList6:setAlign("top");
    obj.rclflwMagicRecordList6:setField("magias.magias.nivel5");
    obj.rclflwMagicRecordList6:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList6:setAutoHeight(true);
    obj.rclflwMagicRecordList6:setMinHeight(5);
    obj.rclflwMagicRecordList6:setHitTest(false);
    obj.rclflwMagicRecordList6:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList6:setParent(obj.flwMagicRecordList6);
    obj.layBottomflwMagicRecordList6:setName("layBottomflwMagicRecordList6");
    obj.layBottomflwMagicRecordList6:setAlign("top");
    obj.layBottomflwMagicRecordList6:setHeight(36);

    obj.btnNovoflwMagicRecordList6 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList6:setParent(obj.layBottomflwMagicRecordList6);
    obj.btnNovoflwMagicRecordList6:setName("btnNovoflwMagicRecordList6");
    obj.btnNovoflwMagicRecordList6:setAlign("left");
    obj.btnNovoflwMagicRecordList6:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList6:setWidth(160);
    obj.btnNovoflwMagicRecordList6:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList6._recalcHeight();


    obj.flowLayout37 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout37:setParent(obj.flowLayout30);
    obj.flowLayout37:setHeight(100);
    obj.flowLayout37:setAvoidScale(true);
    obj.flowLayout37:setMaxControlsPerLine(1);
    obj.flowLayout37:setAutoHeight(true);
    obj.flowLayout37:setName("flowLayout37");
    obj.flowLayout37:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout37:setStepSizes({310, 360, 420, 600});
    obj.flowLayout37:setMinScaledWidth(300);
    obj.flowLayout37:setMaxScaledWidth(600);
    obj.flowLayout37:setVertAlign("leading");

    obj.flowPart263 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart263:setParent(obj.flowLayout37);
    obj.flowPart263:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart263:setName("flowPart263");
    obj.flowPart263:setAvoidScale(true);
    obj.flowPart263:setMinScaledWidth(280);
    obj.flowPart263:setMinWidth(300);
    obj.flowPart263:setMaxWidth(600);
    obj.flowPart263:setHeight(80);
    obj.flowPart263:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart263:setVertAlign("leading");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.flowPart263);
    obj.label160:setFrameRegion("RegiaoSmallTitulo");
    obj.label160:setText("6");
    obj.label160:setName("label160");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setVertTextAlign("center");
    obj.label160:setFontSize(18);
    obj.label160:setFontColor("white");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.flowPart263);
    obj.edit165:setFrameRegion("RegiaoConteudo1");
    obj.edit165:setField("magias.espacosTotais6");
    obj.edit165:setName("edit165");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setFontSize(18);
    obj.edit165:setTransparent(true);
    obj.edit165:setFontColor("white");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.flowPart263);
    obj.edit166:setFrameRegion("RegiaoConteudo2");
    obj.edit166:setField("magias.espacosGastos6");
    obj.edit166:setName("edit166");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setFontSize(18);
    obj.edit166:setTransparent(true);
    obj.edit166:setFontColor("white");

    obj.flwMagicRecordList7 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList7:setParent(obj.flowLayout37);
    obj.flwMagicRecordList7:setMinWidth(300);
    obj.flwMagicRecordList7:setMaxWidth(600);
    obj.flwMagicRecordList7:setMinScaledWidth(280);
    obj.flwMagicRecordList7:setName("flwMagicRecordList7");
    obj.flwMagicRecordList7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList7:setVertAlign("leading");


					rawset(self.flwMagicRecordList7, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList7.height = self.rclflwMagicRecordList7.height +
														self.layBottomflwMagicRecordList7.height + 
														self.flwMagicRecordList7.padding.top + self.flwMagicRecordList7.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList7 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList7:setParent(obj.flwMagicRecordList7);
    obj.rclflwMagicRecordList7:setName("rclflwMagicRecordList7");
    obj.rclflwMagicRecordList7:setAlign("top");
    obj.rclflwMagicRecordList7:setField("magias.magias.nivel6");
    obj.rclflwMagicRecordList7:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList7:setAutoHeight(true);
    obj.rclflwMagicRecordList7:setMinHeight(5);
    obj.rclflwMagicRecordList7:setHitTest(false);
    obj.rclflwMagicRecordList7:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList7:setParent(obj.flwMagicRecordList7);
    obj.layBottomflwMagicRecordList7:setName("layBottomflwMagicRecordList7");
    obj.layBottomflwMagicRecordList7:setAlign("top");
    obj.layBottomflwMagicRecordList7:setHeight(36);

    obj.btnNovoflwMagicRecordList7 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList7:setParent(obj.layBottomflwMagicRecordList7);
    obj.btnNovoflwMagicRecordList7:setName("btnNovoflwMagicRecordList7");
    obj.btnNovoflwMagicRecordList7:setAlign("left");
    obj.btnNovoflwMagicRecordList7:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList7:setWidth(160);
    obj.btnNovoflwMagicRecordList7:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList7._recalcHeight();


    obj.flowLayout38 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout38:setParent(obj.flowLayout30);
    obj.flowLayout38:setHeight(100);
    obj.flowLayout38:setAvoidScale(true);
    obj.flowLayout38:setMaxControlsPerLine(1);
    obj.flowLayout38:setAutoHeight(true);
    obj.flowLayout38:setName("flowLayout38");
    obj.flowLayout38:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout38:setStepSizes({310, 360, 420, 600});
    obj.flowLayout38:setMinScaledWidth(300);
    obj.flowLayout38:setMaxScaledWidth(600);
    obj.flowLayout38:setVertAlign("leading");

    obj.flowPart264 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart264:setParent(obj.flowLayout38);
    obj.flowPart264:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart264:setName("flowPart264");
    obj.flowPart264:setAvoidScale(true);
    obj.flowPart264:setMinScaledWidth(280);
    obj.flowPart264:setMinWidth(300);
    obj.flowPart264:setMaxWidth(600);
    obj.flowPart264:setHeight(80);
    obj.flowPart264:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart264:setVertAlign("leading");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.flowPart264);
    obj.label161:setFrameRegion("RegiaoSmallTitulo");
    obj.label161:setText("7");
    obj.label161:setName("label161");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setVertTextAlign("center");
    obj.label161:setFontSize(18);
    obj.label161:setFontColor("white");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.flowPart264);
    obj.edit167:setFrameRegion("RegiaoConteudo1");
    obj.edit167:setField("magias.espacosTotais7");
    obj.edit167:setName("edit167");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setFontSize(18);
    obj.edit167:setTransparent(true);
    obj.edit167:setFontColor("white");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.flowPart264);
    obj.edit168:setFrameRegion("RegiaoConteudo2");
    obj.edit168:setField("magias.espacosGastos7");
    obj.edit168:setName("edit168");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setFontSize(18);
    obj.edit168:setTransparent(true);
    obj.edit168:setFontColor("white");

    obj.flwMagicRecordList8 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList8:setParent(obj.flowLayout38);
    obj.flwMagicRecordList8:setMinWidth(300);
    obj.flwMagicRecordList8:setMaxWidth(600);
    obj.flwMagicRecordList8:setMinScaledWidth(280);
    obj.flwMagicRecordList8:setName("flwMagicRecordList8");
    obj.flwMagicRecordList8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList8:setVertAlign("leading");


					rawset(self.flwMagicRecordList8, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList8.height = self.rclflwMagicRecordList8.height +
														self.layBottomflwMagicRecordList8.height + 
														self.flwMagicRecordList8.padding.top + self.flwMagicRecordList8.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList8 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList8:setParent(obj.flwMagicRecordList8);
    obj.rclflwMagicRecordList8:setName("rclflwMagicRecordList8");
    obj.rclflwMagicRecordList8:setAlign("top");
    obj.rclflwMagicRecordList8:setField("magias.magias.nivel7");
    obj.rclflwMagicRecordList8:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList8:setAutoHeight(true);
    obj.rclflwMagicRecordList8:setMinHeight(5);
    obj.rclflwMagicRecordList8:setHitTest(false);
    obj.rclflwMagicRecordList8:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList8:setParent(obj.flwMagicRecordList8);
    obj.layBottomflwMagicRecordList8:setName("layBottomflwMagicRecordList8");
    obj.layBottomflwMagicRecordList8:setAlign("top");
    obj.layBottomflwMagicRecordList8:setHeight(36);

    obj.btnNovoflwMagicRecordList8 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList8:setParent(obj.layBottomflwMagicRecordList8);
    obj.btnNovoflwMagicRecordList8:setName("btnNovoflwMagicRecordList8");
    obj.btnNovoflwMagicRecordList8:setAlign("left");
    obj.btnNovoflwMagicRecordList8:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList8:setWidth(160);
    obj.btnNovoflwMagicRecordList8:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList8._recalcHeight();


    obj.flowLayout39 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout39:setParent(obj.flowLayout30);
    obj.flowLayout39:setHeight(100);
    obj.flowLayout39:setAvoidScale(true);
    obj.flowLayout39:setMaxControlsPerLine(1);
    obj.flowLayout39:setAutoHeight(true);
    obj.flowLayout39:setName("flowLayout39");
    obj.flowLayout39:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout39:setStepSizes({310, 360, 420, 600});
    obj.flowLayout39:setMinScaledWidth(300);
    obj.flowLayout39:setMaxScaledWidth(600);
    obj.flowLayout39:setVertAlign("leading");

    obj.flowPart265 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart265:setParent(obj.flowLayout39);
    obj.flowPart265:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart265:setName("flowPart265");
    obj.flowPart265:setAvoidScale(true);
    obj.flowPart265:setMinScaledWidth(280);
    obj.flowPart265:setMinWidth(300);
    obj.flowPart265:setMaxWidth(600);
    obj.flowPart265:setHeight(80);
    obj.flowPart265:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart265:setVertAlign("leading");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.flowPart265);
    obj.label162:setFrameRegion("RegiaoSmallTitulo");
    obj.label162:setText("8");
    obj.label162:setName("label162");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setVertTextAlign("center");
    obj.label162:setFontSize(18);
    obj.label162:setFontColor("white");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.flowPart265);
    obj.edit169:setFrameRegion("RegiaoConteudo1");
    obj.edit169:setField("magias.espacosTotais8");
    obj.edit169:setName("edit169");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setFontSize(18);
    obj.edit169:setTransparent(true);
    obj.edit169:setFontColor("white");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.flowPart265);
    obj.edit170:setFrameRegion("RegiaoConteudo2");
    obj.edit170:setField("magias.espacosGastos8");
    obj.edit170:setName("edit170");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setFontSize(18);
    obj.edit170:setTransparent(true);
    obj.edit170:setFontColor("white");

    obj.flwMagicRecordList9 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList9:setParent(obj.flowLayout39);
    obj.flwMagicRecordList9:setMinWidth(300);
    obj.flwMagicRecordList9:setMaxWidth(600);
    obj.flwMagicRecordList9:setMinScaledWidth(280);
    obj.flwMagicRecordList9:setName("flwMagicRecordList9");
    obj.flwMagicRecordList9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList9:setVertAlign("leading");


					rawset(self.flwMagicRecordList9, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList9.height = self.rclflwMagicRecordList9.height +
														self.layBottomflwMagicRecordList9.height + 
														self.flwMagicRecordList9.padding.top + self.flwMagicRecordList9.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList9 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList9:setParent(obj.flwMagicRecordList9);
    obj.rclflwMagicRecordList9:setName("rclflwMagicRecordList9");
    obj.rclflwMagicRecordList9:setAlign("top");
    obj.rclflwMagicRecordList9:setField("magias.magias.nivel8");
    obj.rclflwMagicRecordList9:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList9:setAutoHeight(true);
    obj.rclflwMagicRecordList9:setMinHeight(5);
    obj.rclflwMagicRecordList9:setHitTest(false);
    obj.rclflwMagicRecordList9:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList9:setParent(obj.flwMagicRecordList9);
    obj.layBottomflwMagicRecordList9:setName("layBottomflwMagicRecordList9");
    obj.layBottomflwMagicRecordList9:setAlign("top");
    obj.layBottomflwMagicRecordList9:setHeight(36);

    obj.btnNovoflwMagicRecordList9 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList9:setParent(obj.layBottomflwMagicRecordList9);
    obj.btnNovoflwMagicRecordList9:setName("btnNovoflwMagicRecordList9");
    obj.btnNovoflwMagicRecordList9:setAlign("left");
    obj.btnNovoflwMagicRecordList9:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList9:setWidth(160);
    obj.btnNovoflwMagicRecordList9:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList9._recalcHeight();


    obj.flowLayout40 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout40:setParent(obj.flowLayout30);
    obj.flowLayout40:setHeight(100);
    obj.flowLayout40:setAvoidScale(true);
    obj.flowLayout40:setMaxControlsPerLine(1);
    obj.flowLayout40:setAutoHeight(true);
    obj.flowLayout40:setName("flowLayout40");
    obj.flowLayout40:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout40:setStepSizes({310, 360, 420, 600});
    obj.flowLayout40:setMinScaledWidth(300);
    obj.flowLayout40:setMaxScaledWidth(600);
    obj.flowLayout40:setVertAlign("leading");

    obj.flowPart266 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart266:setParent(obj.flowLayout40);
    obj.flowPart266:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart266:setName("flowPart266");
    obj.flowPart266:setAvoidScale(true);
    obj.flowPart266:setMinScaledWidth(280);
    obj.flowPart266:setMinWidth(300);
    obj.flowPart266:setMaxWidth(600);
    obj.flowPart266:setHeight(80);
    obj.flowPart266:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart266:setVertAlign("leading");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.flowPart266);
    obj.label163:setFrameRegion("RegiaoSmallTitulo");
    obj.label163:setText("9");
    obj.label163:setName("label163");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setVertTextAlign("center");
    obj.label163:setFontSize(18);
    obj.label163:setFontColor("white");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.flowPart266);
    obj.edit171:setFrameRegion("RegiaoConteudo1");
    obj.edit171:setField("magias.espacosTotais9");
    obj.edit171:setName("edit171");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setFontSize(18);
    obj.edit171:setTransparent(true);
    obj.edit171:setFontColor("white");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.flowPart266);
    obj.edit172:setFrameRegion("RegiaoConteudo2");
    obj.edit172:setField("magias.espacosGastos9");
    obj.edit172:setName("edit172");
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setFontSize(18);
    obj.edit172:setTransparent(true);
    obj.edit172:setFontColor("white");

    obj.flwMagicRecordList10 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList10:setParent(obj.flowLayout40);
    obj.flwMagicRecordList10:setMinWidth(300);
    obj.flwMagicRecordList10:setMaxWidth(600);
    obj.flwMagicRecordList10:setMinScaledWidth(280);
    obj.flwMagicRecordList10:setName("flwMagicRecordList10");
    obj.flwMagicRecordList10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList10:setVertAlign("leading");


					rawset(self.flwMagicRecordList10, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList10.height = self.rclflwMagicRecordList10.height +
														self.layBottomflwMagicRecordList10.height + 
														self.flwMagicRecordList10.padding.top + self.flwMagicRecordList10.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList10 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList10:setParent(obj.flwMagicRecordList10);
    obj.rclflwMagicRecordList10:setName("rclflwMagicRecordList10");
    obj.rclflwMagicRecordList10:setAlign("top");
    obj.rclflwMagicRecordList10:setField("magias.magias.nivel9");
    obj.rclflwMagicRecordList10:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList10:setAutoHeight(true);
    obj.rclflwMagicRecordList10:setMinHeight(5);
    obj.rclflwMagicRecordList10:setHitTest(false);
    obj.rclflwMagicRecordList10:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList10:setParent(obj.flwMagicRecordList10);
    obj.layBottomflwMagicRecordList10:setName("layBottomflwMagicRecordList10");
    obj.layBottomflwMagicRecordList10:setAlign("top");
    obj.layBottomflwMagicRecordList10:setHeight(36);

    obj.btnNovoflwMagicRecordList10 = gui.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList10:setParent(obj.layBottomflwMagicRecordList10);
    obj.btnNovoflwMagicRecordList10:setName("btnNovoflwMagicRecordList10");
    obj.btnNovoflwMagicRecordList10:setAlign("left");
    obj.btnNovoflwMagicRecordList10:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList10:setWidth(160);
    obj.btnNovoflwMagicRecordList10:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList10._recalcHeight();


    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Equipamentos");
    obj.tab4:setName("tab4");

    obj.frmFichaRPGmeister6_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister6_svg:setParent(obj.tab4);
    obj.frmFichaRPGmeister6_svg:setName("frmFichaRPGmeister6_svg");
    obj.frmFichaRPGmeister6_svg:setAlign("client");
    obj.frmFichaRPGmeister6_svg:setTheme("dark");
    obj.frmFichaRPGmeister6_svg:setMargins({top=1});

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmFichaRPGmeister6_svg);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox5);
    obj.image1:setLeft(506);
    obj.image1:setTop(70);
    obj.image1:setWidth(200);
    obj.image1:setHeight(600);
    obj.image1:setSRC("http://blob.firecast.com.br/blobs/GADIAGUF_607701/slots.png");
    obj.image1:setField("imgSlots");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");


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

			function EnviarMudanca(valor, valormax)
				if sheet ~= nil then
					local nome = sheet.AtributoBarrinha or "Equipamento";
					local personagem = sheet.nome or "nome";
					local text = "[§K2]" .. nome .. "[§K3] de [§K2]" .. personagem.. "[§K3]: ";
					
					if tonumber(valor) >= 0 then
						valor = "+" .. tostring(valor);
					end;
					if tonumber(valormax) >= 0 then
						valormax = "+" .. tostring(valormax);
					end;
					
					if tonumber(valormax) == 0 then
						text = text .. valor;
					else
						text = text .. valor .. "/" .. valormax;
					end;
					
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					if mesaDoPersonagem ~= nil then
						   mesaDoPersonagem.activeChat:enviarMensagem(text);
					end;
				end;
			end;
			
			function RequestReload(mode)
				if sheet ~= nil then
					if mode == "begin" then
						self.rclListaDeNPC:beginUpdate();
						self.rclListaDeNPC.visible = false;
					elseif mode == "end" then
						self.rclListaDeNPC.visible = true;
						self.rclListaDeNPC:endUpdate();
					end;
				end;
			end;

			local function resetImgSlot()
				if sheet==nil then return end;
				sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/slots.png";
			end;
		


    obj.BarrinhaPopup = gui.fromHandle(_obj_newObject("popup"));
    obj.BarrinhaPopup:setParent(obj.scrollBox5);
    obj.BarrinhaPopup:setName("BarrinhaPopup");
    obj.BarrinhaPopup:setWidth(140);
    obj.BarrinhaPopup:setHeight(66);
    obj.BarrinhaPopup:setBackOpacity(0);
    obj.BarrinhaPopup:setMargins({left=4, right=4, top=4, bottom=4});

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.BarrinhaPopup);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("white");
    obj.rectangle23:setXradius(5);
    obj.rectangle23:setYradius(5);
    obj.rectangle23:setName("rectangle23");

    obj.CorPopupBarrinhas = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorPopupBarrinhas:setParent(obj.rectangle23);
    obj.CorPopupBarrinhas:setAlign("client");
    obj.CorPopupBarrinhas:setName("CorPopupBarrinhas");
    obj.CorPopupBarrinhas:setColor("#808080");
    obj.CorPopupBarrinhas:setXradius(5);
    obj.CorPopupBarrinhas:setYradius(5);
    obj.CorPopupBarrinhas:setOpacity(0.9);

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.CorPopupBarrinhas);
    obj.label164:setFontColor("black");
    obj.label164:setMargins({left=6, top=2});
    obj.label164:setAlign("top");
    obj.label164:setText("Valor");
    obj.label164:setField("AtributoBarrinha");
    obj.label164:setFontSize(12);
    lfm_setPropAsString(obj.label164, "fontStyle",  "bold");
    obj.label164:setTextTrimming("character");
    obj.label164:setName("label164");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.CorPopupBarrinhas);
    obj.layout42:setAlign("client");
    obj.layout42:setMargins({top=2, left=4});
    obj.layout42:setName("layout42");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(18);
    obj.layout43:setName("layout43");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout43);
    obj.label165:setFontColor("black");
    obj.label165:setAlign("left");
    obj.label165:setText("Atual:  ");
    obj.label165:setHorzTextAlign("trailing");
    obj.label165:setWidth(34);
    obj.label165:setMargins({right=2});
    obj.label165:setFontSize(12);
    obj.label165:setName("label165");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout43);
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setMargins({left=2});
    obj.comboBox4:setAlign("left");
    obj.comboBox4:setTransparent(false);
    obj.comboBox4:setWidth(40);
    obj.comboBox4:setField("ModificadorBarrinha");
    obj.comboBox4:setItems({'=', '+', '-'});
    obj.comboBox4:setValues({'igual', 'mais', 'menos'});
    obj.comboBox4:setValue("igual");
    obj.comboBox4:setName("comboBox4");

    obj.ValorAtualBarrinha = gui.fromHandle(_obj_newObject("edit"));
    obj.ValorAtualBarrinha:setParent(obj.layout43);
    obj.ValorAtualBarrinha:setFontColor("white");
    obj.ValorAtualBarrinha:setMargins({left=2, right=4});
    obj.ValorAtualBarrinha:setType("number");
    obj.ValorAtualBarrinha:setAlign("client");
    obj.ValorAtualBarrinha:setField("ValorMudadoAtualBarrinha");
    obj.ValorAtualBarrinha:setName("ValorAtualBarrinha");
    obj.ValorAtualBarrinha:setFontSize(15);

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout42);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(18);
    obj.layout44:setName("layout44");

    obj.label166 = gui.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout44);
    obj.label166:setFontColor("black");
    obj.label166:setAlign("left");
    obj.label166:setText("Max:  ");
    obj.label166:setHorzTextAlign("trailing");
    obj.label166:setWidth(34);
    obj.label166:setMargins({right=2});
    obj.label166:setFontSize(12);
    obj.label166:setName("label166");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout44);
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setMargins({left=2});
    obj.comboBox5:setAlign("left");
    obj.comboBox5:setTransparent(false);
    obj.comboBox5:setWidth(40);
    obj.comboBox5:setField("ModificadorBarrinhaMax");
    obj.comboBox5:setItems({'=', '+', '-'});
    obj.comboBox5:setValues({'igual', 'mais', 'menos'});
    obj.comboBox5:setValue("igual");
    obj.comboBox5:setName("comboBox5");

    obj.ValorMaxBarrinha = gui.fromHandle(_obj_newObject("edit"));
    obj.ValorMaxBarrinha:setParent(obj.layout44);
    obj.ValorMaxBarrinha:setFontColor("white");
    obj.ValorMaxBarrinha:setMargins({left=2, right=4});
    obj.ValorMaxBarrinha:setType("number");
    obj.ValorMaxBarrinha:setAlign("client");
    obj.ValorMaxBarrinha:setField("ValorMudadoMaxBarrinha");
    obj.ValorMaxBarrinha:setName("ValorMaxBarrinha");
    obj.ValorMaxBarrinha:setFontSize(15);

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.scrollBox5);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("#00000000");
    obj.rectangle24:setOpacity(0);
    obj.rectangle24:setName("rectangle24");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox5);
    obj.layout45:setLeft(1);
    obj.layout45:setTop(1);
    obj.layout45:setWidth(250);
    obj.layout45:setHeight(222);
    obj.layout45:setName("layout45");


				local function loadImgSlotCabeca()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/cabeca.png";
				end;
			


    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout45);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setName("rectangle25");

    obj.label167 = gui.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout45);
    obj.label167:setLeft(5);
    obj.label167:setTop(1);
    obj.label167:setWidth(200);
    obj.label167:setHeight(20);
    obj.label167:setText("CABEÇA");
    obj.label167:setName("label167");
    obj.label167:setFontColor("white");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout45);
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setLeft(5);
    obj.edit173:setTop(20);
    obj.edit173:setWidth(240);
    obj.edit173:setHeight(25);
    obj.edit173:setField("equipamentoCabeca");
    obj.edit173:setName("edit173");
    obj.edit173:setFontSize(15);
    obj.edit173:setFontColor("white");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout45);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(47);
    obj.textEditor4:setWidth(240);
    obj.textEditor4:setHeight(140);
    obj.textEditor4:setField("descricaoCabeca");
    obj.textEditor4:setName("textEditor4");

    obj.label168 = gui.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout45);
    obj.label168:setLeft(70);
    obj.label168:setTop(193);
    obj.label168:setWidth(50);
    obj.label168:setHeight(20);
    obj.label168:setText("Kg");
    obj.label168:setName("label168");
    obj.label168:setFontColor("white");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout45);
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setLeft(90);
    obj.edit174:setTop(190);
    obj.edit174:setWidth(50);
    obj.edit174:setHeight(25);
    obj.edit174:setField("pesoCabeca");
    obj.edit174:setName("edit174");
    obj.edit174:setFontSize(15);
    obj.edit174:setFontColor("white");

    obj.label169 = gui.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout45);
    obj.label169:setLeft(147);
    obj.label169:setTop(193);
    obj.label169:setWidth(50);
    obj.label169:setHeight(20);
    obj.label169:setText("$");
    obj.label169:setName("label169");
    obj.label169:setFontColor("white");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout45);
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setLeft(160);
    obj.edit175:setTop(190);
    obj.edit175:setWidth(84);
    obj.edit175:setHeight(25);
    obj.edit175:setField("precoCabeca");
    obj.edit175:setName("edit175");
    obj.edit175:setFontSize(15);
    obj.edit175:setFontColor("white");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setLeft(5);
    obj.layout46:setTop(195);
    obj.layout46:setHeight(15);
    obj.layout46:setWidth(64);
    obj.layout46:setName("layout46");

    obj.imageCheckBox31 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox31:setParent(obj.layout46);
    obj.imageCheckBox31:setAlign("client");
    obj.imageCheckBox31:setName("imageCheckBox31");

    obj.Barrinha0 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha0:setParent(obj.imageCheckBox31);
    obj.Barrinha0:setColorMode("hl");
    obj.Barrinha0:setWidth(50);
    obj.Barrinha0:setHeight(15);
    obj.Barrinha0:setHitTest(true);
    obj.Barrinha0:setMouseGlow(true);
    obj.Barrinha0:setColor("Green");
    obj.Barrinha0:setName("Barrinha0");
    obj.Barrinha0:setField("Barrinha0Valor");
    obj.Barrinha0:setFieldMax("Barrinha0ValorMax");

    obj.ValoresBarrinha0 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha0:setParent(obj.layout45);
    obj.ValoresBarrinha0:setLeft(55);
    obj.ValoresBarrinha0:setTop(195);
    obj.ValoresBarrinha0:setWidth(90);
    obj.ValoresBarrinha0:setHeight(14);
    obj.ValoresBarrinha0:setVisible(false);
    obj.ValoresBarrinha0:setName("ValoresBarrinha0");

    obj.CorBarrinha0 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha0:setParent(obj.ValoresBarrinha0);
    obj.CorBarrinha0:setAlign("client");
    obj.CorBarrinha0:setXradius(2);
    obj.CorBarrinha0:setYradius(2);
    obj.CorBarrinha0:setName("CorBarrinha0");
    obj.CorBarrinha0:setColor("Green");

    obj.InfoBarrinha0 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha0:setParent(obj.CorBarrinha0);
    obj.InfoBarrinha0:setAlign("left");
    obj.InfoBarrinha0:setFontColor("white");
    obj.InfoBarrinha0:setFontSize(12);
    obj.InfoBarrinha0:setAutoSize(true);
    obj.InfoBarrinha0:setTextTrimming("none");
    obj.InfoBarrinha0:setWordWrap(false);
    obj.InfoBarrinha0:setName("InfoBarrinha0");
    obj.InfoBarrinha0:setField("InfoBarrinha0");
    obj.InfoBarrinha0:setHorzTextAlign("center");
    obj.InfoBarrinha0:setText("0/0");

    obj.dataLink49 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout45);
    obj.dataLink49:setField("CorBarrinha0");
    obj.dataLink49:setDefaultValue("Green");
    obj.dataLink49:setName("dataLink49");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox5);
    obj.layout47:setLeft(252);
    obj.layout47:setTop(1);
    obj.layout47:setWidth(250);
    obj.layout47:setHeight(222);
    obj.layout47:setName("layout47");


				local function loadImgSlotOlhos()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/olhos.png";
				end;
			


    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout47);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setName("rectangle26");

    obj.label170 = gui.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout47);
    obj.label170:setLeft(5);
    obj.label170:setTop(1);
    obj.label170:setWidth(200);
    obj.label170:setHeight(20);
    obj.label170:setText("OLHOS");
    obj.label170:setName("label170");
    obj.label170:setFontColor("white");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout47);
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(5);
    obj.edit176:setTop(20);
    obj.edit176:setWidth(240);
    obj.edit176:setHeight(25);
    obj.edit176:setField("equipamentoOlhos");
    obj.edit176:setName("edit176");
    obj.edit176:setFontSize(15);
    obj.edit176:setFontColor("white");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout47);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(47);
    obj.textEditor5:setWidth(240);
    obj.textEditor5:setHeight(140);
    obj.textEditor5:setField("descricaoOlhos");
    obj.textEditor5:setName("textEditor5");

    obj.label171 = gui.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout47);
    obj.label171:setLeft(70);
    obj.label171:setTop(193);
    obj.label171:setWidth(50);
    obj.label171:setHeight(20);
    obj.label171:setText("Kg");
    obj.label171:setName("label171");
    obj.label171:setFontColor("white");

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout47);
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(90);
    obj.edit177:setTop(190);
    obj.edit177:setWidth(50);
    obj.edit177:setHeight(25);
    obj.edit177:setField("pesoOlhos");
    obj.edit177:setName("edit177");
    obj.edit177:setFontSize(15);
    obj.edit177:setFontColor("white");

    obj.label172 = gui.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout47);
    obj.label172:setLeft(147);
    obj.label172:setTop(193);
    obj.label172:setWidth(50);
    obj.label172:setHeight(20);
    obj.label172:setText("$");
    obj.label172:setName("label172");
    obj.label172:setFontColor("white");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout47);
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(160);
    obj.edit178:setTop(190);
    obj.edit178:setWidth(84);
    obj.edit178:setHeight(25);
    obj.edit178:setField("precoOlhos");
    obj.edit178:setName("edit178");
    obj.edit178:setFontSize(15);
    obj.edit178:setFontColor("white");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48:setLeft(5);
    obj.layout48:setTop(195);
    obj.layout48:setHeight(15);
    obj.layout48:setWidth(64);
    obj.layout48:setName("layout48");

    obj.imageCheckBox32 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox32:setParent(obj.layout48);
    obj.imageCheckBox32:setAlign("client");
    obj.imageCheckBox32:setName("imageCheckBox32");

    obj.Barrinha1 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha1:setParent(obj.imageCheckBox32);
    obj.Barrinha1:setColorMode("hl");
    obj.Barrinha1:setWidth(50);
    obj.Barrinha1:setHeight(15);
    obj.Barrinha1:setHitTest(true);
    obj.Barrinha1:setMouseGlow(true);
    obj.Barrinha1:setColor("Green");
    obj.Barrinha1:setName("Barrinha1");
    obj.Barrinha1:setField("Barrinha1Valor");
    obj.Barrinha1:setFieldMax("Barrinha1ValorMax");

    obj.ValoresBarrinha1 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha1:setParent(obj.layout47);
    obj.ValoresBarrinha1:setLeft(55);
    obj.ValoresBarrinha1:setTop(195);
    obj.ValoresBarrinha1:setWidth(90);
    obj.ValoresBarrinha1:setHeight(14);
    obj.ValoresBarrinha1:setVisible(false);
    obj.ValoresBarrinha1:setName("ValoresBarrinha1");

    obj.CorBarrinha1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.ValoresBarrinha1);
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setXradius(2);
    obj.CorBarrinha1:setYradius(2);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("Green");

    obj.InfoBarrinha1 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha1:setParent(obj.CorBarrinha1);
    obj.InfoBarrinha1:setAlign("left");
    obj.InfoBarrinha1:setFontColor("white");
    obj.InfoBarrinha1:setFontSize(12);
    obj.InfoBarrinha1:setAutoSize(true);
    obj.InfoBarrinha1:setTextTrimming("none");
    obj.InfoBarrinha1:setWordWrap(false);
    obj.InfoBarrinha1:setName("InfoBarrinha1");
    obj.InfoBarrinha1:setField("InfoBarrinha1");
    obj.InfoBarrinha1:setHorzTextAlign("center");
    obj.InfoBarrinha1:setText("0/0");

    obj.dataLink50 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout47);
    obj.dataLink50:setField("CorBarrinha1");
    obj.dataLink50:setDefaultValue("Green");
    obj.dataLink50:setName("dataLink50");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox5);
    obj.layout49:setLeft(710);
    obj.layout49:setTop(1);
    obj.layout49:setWidth(250);
    obj.layout49:setHeight(222);
    obj.layout49:setName("layout49");


				local function loadImgSlotPescoco()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/pescoco.png";
				end;
			


    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout49);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.label173 = gui.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout49);
    obj.label173:setLeft(5);
    obj.label173:setTop(1);
    obj.label173:setWidth(200);
    obj.label173:setHeight(20);
    obj.label173:setText("PESCOÇO");
    obj.label173:setName("label173");
    obj.label173:setFontColor("white");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout49);
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(5);
    obj.edit179:setTop(20);
    obj.edit179:setWidth(240);
    obj.edit179:setHeight(25);
    obj.edit179:setField("equipamentoPescoco");
    obj.edit179:setName("edit179");
    obj.edit179:setFontSize(15);
    obj.edit179:setFontColor("white");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout49);
    obj.textEditor6:setLeft(5);
    obj.textEditor6:setTop(47);
    obj.textEditor6:setWidth(240);
    obj.textEditor6:setHeight(140);
    obj.textEditor6:setField("descricaoPescoco");
    obj.textEditor6:setName("textEditor6");

    obj.label174 = gui.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout49);
    obj.label174:setLeft(70);
    obj.label174:setTop(193);
    obj.label174:setWidth(50);
    obj.label174:setHeight(20);
    obj.label174:setText("Kg");
    obj.label174:setName("label174");
    obj.label174:setFontColor("white");

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout49);
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(90);
    obj.edit180:setTop(190);
    obj.edit180:setWidth(50);
    obj.edit180:setHeight(25);
    obj.edit180:setField("pesoPescoco");
    obj.edit180:setName("edit180");
    obj.edit180:setFontSize(15);
    obj.edit180:setFontColor("white");

    obj.label175 = gui.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout49);
    obj.label175:setLeft(147);
    obj.label175:setTop(193);
    obj.label175:setWidth(50);
    obj.label175:setHeight(20);
    obj.label175:setText("$");
    obj.label175:setName("label175");
    obj.label175:setFontColor("white");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout49);
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(160);
    obj.edit181:setTop(190);
    obj.edit181:setWidth(84);
    obj.edit181:setHeight(25);
    obj.edit181:setField("precoPescoco");
    obj.edit181:setName("edit181");
    obj.edit181:setFontSize(15);
    obj.edit181:setFontColor("white");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setLeft(5);
    obj.layout50:setTop(195);
    obj.layout50:setHeight(15);
    obj.layout50:setWidth(64);
    obj.layout50:setName("layout50");

    obj.imageCheckBox33 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox33:setParent(obj.layout50);
    obj.imageCheckBox33:setAlign("client");
    obj.imageCheckBox33:setName("imageCheckBox33");

    obj.Barrinha2 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha2:setParent(obj.imageCheckBox33);
    obj.Barrinha2:setColorMode("hl");
    obj.Barrinha2:setWidth(50);
    obj.Barrinha2:setHeight(15);
    obj.Barrinha2:setHitTest(true);
    obj.Barrinha2:setMouseGlow(true);
    obj.Barrinha2:setColor("Green");
    obj.Barrinha2:setName("Barrinha2");
    obj.Barrinha2:setField("Barrinha2Valor");
    obj.Barrinha2:setFieldMax("Barrinha2ValorMax");

    obj.ValoresBarrinha2 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha2:setParent(obj.layout49);
    obj.ValoresBarrinha2:setLeft(55);
    obj.ValoresBarrinha2:setTop(195);
    obj.ValoresBarrinha2:setWidth(90);
    obj.ValoresBarrinha2:setHeight(14);
    obj.ValoresBarrinha2:setVisible(false);
    obj.ValoresBarrinha2:setName("ValoresBarrinha2");

    obj.CorBarrinha2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.ValoresBarrinha2);
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setXradius(2);
    obj.CorBarrinha2:setYradius(2);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("Green");

    obj.InfoBarrinha2 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha2:setParent(obj.CorBarrinha2);
    obj.InfoBarrinha2:setAlign("left");
    obj.InfoBarrinha2:setFontColor("white");
    obj.InfoBarrinha2:setFontSize(12);
    obj.InfoBarrinha2:setAutoSize(true);
    obj.InfoBarrinha2:setTextTrimming("none");
    obj.InfoBarrinha2:setWordWrap(false);
    obj.InfoBarrinha2:setName("InfoBarrinha2");
    obj.InfoBarrinha2:setField("InfoBarrinha2");
    obj.InfoBarrinha2:setHorzTextAlign("center");
    obj.InfoBarrinha2:setText("0/0");

    obj.dataLink51 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout49);
    obj.dataLink51:setField("CorBarrinha2");
    obj.dataLink51:setDefaultValue("Green");
    obj.dataLink51:setName("dataLink51");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox5);
    obj.layout51:setLeft(961);
    obj.layout51:setTop(1);
    obj.layout51:setWidth(250);
    obj.layout51:setHeight(222);
    obj.layout51:setName("layout51");


				local function loadImgSlotOmbros()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/ombros.png";
				end;
			


    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout51);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.label176 = gui.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout51);
    obj.label176:setLeft(5);
    obj.label176:setTop(1);
    obj.label176:setWidth(200);
    obj.label176:setHeight(20);
    obj.label176:setText("OMBROS");
    obj.label176:setName("label176");
    obj.label176:setFontColor("white");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout51);
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(5);
    obj.edit182:setTop(20);
    obj.edit182:setWidth(240);
    obj.edit182:setHeight(25);
    obj.edit182:setField("equipamentoOmbros");
    obj.edit182:setName("edit182");
    obj.edit182:setFontSize(15);
    obj.edit182:setFontColor("white");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout51);
    obj.textEditor7:setLeft(5);
    obj.textEditor7:setTop(47);
    obj.textEditor7:setWidth(240);
    obj.textEditor7:setHeight(140);
    obj.textEditor7:setField("descricaoOmbros");
    obj.textEditor7:setName("textEditor7");

    obj.label177 = gui.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout51);
    obj.label177:setLeft(70);
    obj.label177:setTop(193);
    obj.label177:setWidth(50);
    obj.label177:setHeight(20);
    obj.label177:setText("Kg");
    obj.label177:setName("label177");
    obj.label177:setFontColor("white");

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout51);
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(90);
    obj.edit183:setTop(190);
    obj.edit183:setWidth(50);
    obj.edit183:setHeight(25);
    obj.edit183:setField("pesoOmbros");
    obj.edit183:setName("edit183");
    obj.edit183:setFontSize(15);
    obj.edit183:setFontColor("white");

    obj.label178 = gui.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout51);
    obj.label178:setLeft(147);
    obj.label178:setTop(193);
    obj.label178:setWidth(50);
    obj.label178:setHeight(20);
    obj.label178:setText("$");
    obj.label178:setName("label178");
    obj.label178:setFontColor("white");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout51);
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(160);
    obj.edit184:setTop(190);
    obj.edit184:setWidth(84);
    obj.edit184:setHeight(25);
    obj.edit184:setField("precoOmbros");
    obj.edit184:setName("edit184");
    obj.edit184:setFontSize(15);
    obj.edit184:setFontColor("white");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout51);
    obj.layout52:setLeft(5);
    obj.layout52:setTop(195);
    obj.layout52:setHeight(15);
    obj.layout52:setWidth(64);
    obj.layout52:setName("layout52");

    obj.imageCheckBox34 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox34:setParent(obj.layout52);
    obj.imageCheckBox34:setAlign("client");
    obj.imageCheckBox34:setName("imageCheckBox34");

    obj.Barrinha3 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha3:setParent(obj.imageCheckBox34);
    obj.Barrinha3:setColorMode("hl");
    obj.Barrinha3:setWidth(50);
    obj.Barrinha3:setHeight(15);
    obj.Barrinha3:setHitTest(true);
    obj.Barrinha3:setMouseGlow(true);
    obj.Barrinha3:setColor("Green");
    obj.Barrinha3:setName("Barrinha3");
    obj.Barrinha3:setField("Barrinha3Valor");
    obj.Barrinha3:setFieldMax("Barrinha3ValorMax");

    obj.ValoresBarrinha3 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha3:setParent(obj.layout51);
    obj.ValoresBarrinha3:setLeft(55);
    obj.ValoresBarrinha3:setTop(195);
    obj.ValoresBarrinha3:setWidth(90);
    obj.ValoresBarrinha3:setHeight(14);
    obj.ValoresBarrinha3:setVisible(false);
    obj.ValoresBarrinha3:setName("ValoresBarrinha3");

    obj.CorBarrinha3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.ValoresBarrinha3);
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setXradius(2);
    obj.CorBarrinha3:setYradius(2);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("Green");

    obj.InfoBarrinha3 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha3:setParent(obj.CorBarrinha3);
    obj.InfoBarrinha3:setAlign("left");
    obj.InfoBarrinha3:setFontColor("white");
    obj.InfoBarrinha3:setFontSize(12);
    obj.InfoBarrinha3:setAutoSize(true);
    obj.InfoBarrinha3:setTextTrimming("none");
    obj.InfoBarrinha3:setWordWrap(false);
    obj.InfoBarrinha3:setName("InfoBarrinha3");
    obj.InfoBarrinha3:setField("InfoBarrinha3");
    obj.InfoBarrinha3:setHorzTextAlign("center");
    obj.InfoBarrinha3:setText("0/0");

    obj.dataLink52 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout51);
    obj.dataLink52:setField("CorBarrinha3");
    obj.dataLink52:setDefaultValue("Green");
    obj.dataLink52:setName("dataLink52");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox5);
    obj.layout53:setLeft(1);
    obj.layout53:setTop(224);
    obj.layout53:setWidth(250);
    obj.layout53:setHeight(222);
    obj.layout53:setName("layout53");


				local function loadImgSlotTorso()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/torso.png";
				end;
			


    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout53);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setName("rectangle29");

    obj.label179 = gui.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout53);
    obj.label179:setLeft(5);
    obj.label179:setTop(1);
    obj.label179:setWidth(200);
    obj.label179:setHeight(20);
    obj.label179:setText("TORSO");
    obj.label179:setName("label179");
    obj.label179:setFontColor("white");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout53);
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(5);
    obj.edit185:setTop(20);
    obj.edit185:setWidth(240);
    obj.edit185:setHeight(25);
    obj.edit185:setField("equipamentoTorso");
    obj.edit185:setName("edit185");
    obj.edit185:setFontSize(15);
    obj.edit185:setFontColor("white");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout53);
    obj.textEditor8:setLeft(5);
    obj.textEditor8:setTop(47);
    obj.textEditor8:setWidth(240);
    obj.textEditor8:setHeight(140);
    obj.textEditor8:setField("descricaoTorso");
    obj.textEditor8:setName("textEditor8");

    obj.label180 = gui.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout53);
    obj.label180:setLeft(70);
    obj.label180:setTop(193);
    obj.label180:setWidth(50);
    obj.label180:setHeight(20);
    obj.label180:setText("Kg");
    obj.label180:setName("label180");
    obj.label180:setFontColor("white");

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout53);
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(90);
    obj.edit186:setTop(190);
    obj.edit186:setWidth(50);
    obj.edit186:setHeight(25);
    obj.edit186:setField("pesoTorso");
    obj.edit186:setName("edit186");
    obj.edit186:setFontSize(15);
    obj.edit186:setFontColor("white");

    obj.label181 = gui.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout53);
    obj.label181:setLeft(147);
    obj.label181:setTop(193);
    obj.label181:setWidth(50);
    obj.label181:setHeight(20);
    obj.label181:setText("$");
    obj.label181:setName("label181");
    obj.label181:setFontColor("white");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout53);
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(160);
    obj.edit187:setTop(190);
    obj.edit187:setWidth(84);
    obj.edit187:setHeight(25);
    obj.edit187:setField("precoTorso");
    obj.edit187:setName("edit187");
    obj.edit187:setFontSize(15);
    obj.edit187:setFontColor("white");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout53);
    obj.layout54:setLeft(5);
    obj.layout54:setTop(195);
    obj.layout54:setHeight(15);
    obj.layout54:setWidth(64);
    obj.layout54:setName("layout54");

    obj.imageCheckBox35 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox35:setParent(obj.layout54);
    obj.imageCheckBox35:setAlign("client");
    obj.imageCheckBox35:setName("imageCheckBox35");

    obj.Barrinha4 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha4:setParent(obj.imageCheckBox35);
    obj.Barrinha4:setColorMode("hl");
    obj.Barrinha4:setWidth(50);
    obj.Barrinha4:setHeight(15);
    obj.Barrinha4:setHitTest(true);
    obj.Barrinha4:setMouseGlow(true);
    obj.Barrinha4:setColor("Green");
    obj.Barrinha4:setName("Barrinha4");
    obj.Barrinha4:setField("Barrinha4Valor");
    obj.Barrinha4:setFieldMax("Barrinha4ValorMax");

    obj.ValoresBarrinha4 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha4:setParent(obj.layout53);
    obj.ValoresBarrinha4:setLeft(55);
    obj.ValoresBarrinha4:setTop(195);
    obj.ValoresBarrinha4:setWidth(90);
    obj.ValoresBarrinha4:setHeight(14);
    obj.ValoresBarrinha4:setVisible(false);
    obj.ValoresBarrinha4:setName("ValoresBarrinha4");

    obj.CorBarrinha4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha4:setParent(obj.ValoresBarrinha4);
    obj.CorBarrinha4:setAlign("client");
    obj.CorBarrinha4:setXradius(2);
    obj.CorBarrinha4:setYradius(2);
    obj.CorBarrinha4:setName("CorBarrinha4");
    obj.CorBarrinha4:setColor("Green");

    obj.InfoBarrinha4 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha4:setParent(obj.CorBarrinha4);
    obj.InfoBarrinha4:setAlign("left");
    obj.InfoBarrinha4:setFontColor("white");
    obj.InfoBarrinha4:setFontSize(12);
    obj.InfoBarrinha4:setAutoSize(true);
    obj.InfoBarrinha4:setTextTrimming("none");
    obj.InfoBarrinha4:setWordWrap(false);
    obj.InfoBarrinha4:setName("InfoBarrinha4");
    obj.InfoBarrinha4:setField("InfoBarrinha4");
    obj.InfoBarrinha4:setHorzTextAlign("center");
    obj.InfoBarrinha4:setText("0/0");

    obj.dataLink53 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout53);
    obj.dataLink53:setField("CorBarrinha4");
    obj.dataLink53:setDefaultValue("Green");
    obj.dataLink53:setName("dataLink53");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.scrollBox5);
    obj.layout55:setLeft(252);
    obj.layout55:setTop(224);
    obj.layout55:setWidth(250);
    obj.layout55:setHeight(222);
    obj.layout55:setName("layout55");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout55);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.label182 = gui.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout55);
    obj.label182:setLeft(5);
    obj.label182:setTop(1);
    obj.label182:setWidth(200);
    obj.label182:setHeight(20);
    obj.label182:setText("CORPO (ARMADURA)");
    obj.label182:setName("label182");
    obj.label182:setFontColor("white");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout55);
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(5);
    obj.edit188:setTop(20);
    obj.edit188:setWidth(240);
    obj.edit188:setHeight(25);
    obj.edit188:setField("equipamentoCorpo");
    obj.edit188:setName("edit188");
    obj.edit188:setFontSize(15);
    obj.edit188:setFontColor("white");

    obj.label183 = gui.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout55);
    obj.label183:setLeft(5);
    obj.label183:setTop(50);
    obj.label183:setWidth(50);
    obj.label183:setHeight(20);
    obj.label183:setText("CA");
    obj.label183:setName("label183");
    obj.label183:setFontColor("white");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout55);
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(25);
    obj.edit189:setTop(50);
    obj.edit189:setWidth(40);
    obj.edit189:setHeight(20);
    obj.edit189:setField("equipamentoCorpoCA");
    obj.edit189:setName("edit189");
    obj.edit189:setFontSize(15);
    obj.edit189:setFontColor("white");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout55);
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(65);
    obj.edit190:setTop(50);
    obj.edit190:setWidth(40);
    obj.edit190:setHeight(20);
    obj.edit190:setField("equipamentoCorpoCAmelhoria");
    obj.edit190:setName("edit190");
    obj.edit190:setFontSize(15);
    obj.edit190:setFontColor("white");

    obj.label184 = gui.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout55);
    obj.label184:setLeft(110);
    obj.label184:setTop(50);
    obj.label184:setWidth(50);
    obj.label184:setHeight(20);
    obj.label184:setText("CAT");
    obj.label184:setName("label184");
    obj.label184:setFontColor("white");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout55);
    obj.comboBox6:setLeft(140);
    obj.comboBox6:setTop(50);
    obj.comboBox6:setWidth(105);
    obj.comboBox6:setHeight(20);
    obj.comboBox6:setField("equipamentoCorpoCategoria");
    obj.comboBox6:setItems({'Leve', 'Média', 'Pesada', 'Massiva'});
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setName("comboBox6");

    obj.label185 = gui.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout55);
    obj.label185:setLeft(10);
    obj.label185:setTop(75);
    obj.label185:setWidth(50);
    obj.label185:setHeight(20);
    obj.label185:setText("DES");
    obj.label185:setName("label185");
    obj.label185:setFontColor("white");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout55);
    obj.edit191:setVertTextAlign("center");
    obj.edit191:setLeft(45);
    obj.edit191:setTop(75);
    obj.edit191:setWidth(40);
    obj.edit191:setHeight(20);
    obj.edit191:setField("equipamentoCorpoDesMax");
    obj.edit191:setName("edit191");
    obj.edit191:setFontSize(15);
    obj.edit191:setFontColor("white");

    obj.label186 = gui.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout55);
    obj.label186:setLeft(90);
    obj.label186:setTop(75);
    obj.label186:setWidth(50);
    obj.label186:setHeight(20);
    obj.label186:setText("PEN");
    obj.label186:setName("label186");
    obj.label186:setFontColor("white");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout55);
    obj.edit192:setVertTextAlign("center");
    obj.edit192:setLeft(125);
    obj.edit192:setTop(75);
    obj.edit192:setWidth(40);
    obj.edit192:setHeight(20);
    obj.edit192:setField("equipamentoCorpoPen");
    obj.edit192:setName("edit192");
    obj.edit192:setFontSize(15);
    obj.edit192:setFontColor("white");

    obj.label187 = gui.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout55);
    obj.label187:setLeft(170);
    obj.label187:setTop(75);
    obj.label187:setWidth(50);
    obj.label187:setHeight(20);
    obj.label187:setText("Falha");
    obj.label187:setFontSize(13);
    obj.label187:setName("label187");
    obj.label187:setFontColor("white");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout55);
    obj.edit193:setVertTextAlign("center");
    obj.edit193:setLeft(205);
    obj.edit193:setTop(75);
    obj.edit193:setWidth(40);
    obj.edit193:setHeight(20);
    obj.edit193:setField("equipamentoCorpoFalha");
    obj.edit193:setName("edit193");
    obj.edit193:setFontSize(15);
    obj.edit193:setFontColor("white");

    obj.label188 = gui.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout55);
    obj.label188:setLeft(10);
    obj.label188:setTop(100);
    obj.label188:setWidth(50);
    obj.label188:setHeight(20);
    obj.label188:setText("Desl");
    obj.label188:setName("label188");
    obj.label188:setFontColor("white");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout55);
    obj.edit194:setVertTextAlign("center");
    obj.edit194:setLeft(45);
    obj.edit194:setTop(100);
    obj.edit194:setWidth(40);
    obj.edit194:setHeight(20);
    obj.edit194:setField("equipamentoCorpoDesl");
    obj.edit194:setName("edit194");
    obj.edit194:setFontSize(15);
    obj.edit194:setFontColor("white");

    obj.label189 = gui.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout55);
    obj.label189:setLeft(170);
    obj.label189:setTop(100);
    obj.label189:setWidth(50);
    obj.label189:setHeight(20);
    obj.label189:setText("Correr");
    obj.label189:setFontSize(12);
    obj.label189:setName("label189");
    obj.label189:setFontColor("white");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout55);
    obj.edit195:setVertTextAlign("center");
    obj.edit195:setLeft(205);
    obj.edit195:setTop(100);
    obj.edit195:setWidth(40);
    obj.edit195:setHeight(20);
    obj.edit195:setField("equipamentoCorpoCorrer");
    obj.edit195:setName("edit195");
    obj.edit195:setFontSize(15);
    obj.edit195:setFontColor("white");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout55);
    obj.textEditor9:setLeft(5);
    obj.textEditor9:setTop(122);
    obj.textEditor9:setWidth(240);
    obj.textEditor9:setHeight(65);
    obj.textEditor9:setField("descricaoCorpo");
    obj.textEditor9:setName("textEditor9");

    obj.label190 = gui.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout55);
    obj.label190:setLeft(70);
    obj.label190:setTop(193);
    obj.label190:setWidth(50);
    obj.label190:setHeight(20);
    obj.label190:setText("Kg");
    obj.label190:setName("label190");
    obj.label190:setFontColor("white");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout55);
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setVertTextAlign("center");
    obj.edit196:setLeft(90);
    obj.edit196:setTop(190);
    obj.edit196:setWidth(50);
    obj.edit196:setHeight(25);
    obj.edit196:setField("pesoCorpo");
    obj.edit196:setName("edit196");
    obj.edit196:setFontSize(15);
    obj.edit196:setFontColor("white");

    obj.label191 = gui.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout55);
    obj.label191:setLeft(147);
    obj.label191:setTop(193);
    obj.label191:setWidth(50);
    obj.label191:setHeight(20);
    obj.label191:setText("$");
    obj.label191:setName("label191");
    obj.label191:setFontColor("white");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout55);
    obj.edit197:setHorzTextAlign("center");
    obj.edit197:setVertTextAlign("center");
    obj.edit197:setLeft(160);
    obj.edit197:setTop(190);
    obj.edit197:setWidth(84);
    obj.edit197:setHeight(25);
    obj.edit197:setField("precoCorpo");
    obj.edit197:setName("edit197");
    obj.edit197:setFontSize(15);
    obj.edit197:setFontColor("white");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout55);
    obj.layout56:setLeft(5);
    obj.layout56:setTop(195);
    obj.layout56:setHeight(15);
    obj.layout56:setWidth(64);
    obj.layout56:setName("layout56");

    obj.imageCheckBox36 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox36:setParent(obj.layout56);
    obj.imageCheckBox36:setAlign("client");
    obj.imageCheckBox36:setName("imageCheckBox36");

    obj.Barrinha5 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha5:setParent(obj.imageCheckBox36);
    obj.Barrinha5:setColorMode("hl");
    obj.Barrinha5:setWidth(50);
    obj.Barrinha5:setHeight(15);
    obj.Barrinha5:setHitTest(true);
    obj.Barrinha5:setMouseGlow(true);
    obj.Barrinha5:setColor("Green");
    obj.Barrinha5:setName("Barrinha5");
    obj.Barrinha5:setField("Barrinha5Valor");
    obj.Barrinha5:setFieldMax("Barrinha5ValorMax");

    obj.ValoresBarrinha5 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha5:setParent(obj.layout55);
    obj.ValoresBarrinha5:setLeft(55);
    obj.ValoresBarrinha5:setTop(195);
    obj.ValoresBarrinha5:setWidth(90);
    obj.ValoresBarrinha5:setHeight(14);
    obj.ValoresBarrinha5:setVisible(false);
    obj.ValoresBarrinha5:setName("ValoresBarrinha5");

    obj.CorBarrinha5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha5:setParent(obj.ValoresBarrinha5);
    obj.CorBarrinha5:setAlign("client");
    obj.CorBarrinha5:setXradius(2);
    obj.CorBarrinha5:setYradius(2);
    obj.CorBarrinha5:setName("CorBarrinha5");
    obj.CorBarrinha5:setColor("Green");

    obj.InfoBarrinha5 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha5:setParent(obj.CorBarrinha5);
    obj.InfoBarrinha5:setAlign("left");
    obj.InfoBarrinha5:setFontColor("white");
    obj.InfoBarrinha5:setFontSize(12);
    obj.InfoBarrinha5:setAutoSize(true);
    obj.InfoBarrinha5:setTextTrimming("none");
    obj.InfoBarrinha5:setWordWrap(false);
    obj.InfoBarrinha5:setName("InfoBarrinha5");
    obj.InfoBarrinha5:setField("InfoBarrinha5");
    obj.InfoBarrinha5:setHorzTextAlign("center");
    obj.InfoBarrinha5:setText("0/0");

    obj.dataLink54 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout55);
    obj.dataLink54:setField("CorBarrinha5");
    obj.dataLink54:setDefaultValue("Green");
    obj.dataLink54:setName("dataLink54");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.scrollBox5);
    obj.layout57:setLeft(710);
    obj.layout57:setTop(224);
    obj.layout57:setWidth(250);
    obj.layout57:setHeight(222);
    obj.layout57:setName("layout57");


				local function loadImgSlotPunhos()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/punhos.png";
				end;
			


    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout57);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.label192 = gui.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout57);
    obj.label192:setLeft(5);
    obj.label192:setTop(1);
    obj.label192:setWidth(200);
    obj.label192:setHeight(20);
    obj.label192:setText("PUNHOS");
    obj.label192:setName("label192");
    obj.label192:setFontColor("white");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout57);
    obj.edit198:setVertTextAlign("center");
    obj.edit198:setLeft(5);
    obj.edit198:setTop(20);
    obj.edit198:setWidth(240);
    obj.edit198:setHeight(25);
    obj.edit198:setField("equipamentoPunhos");
    obj.edit198:setName("edit198");
    obj.edit198:setFontSize(15);
    obj.edit198:setFontColor("white");

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout57);
    obj.textEditor10:setLeft(5);
    obj.textEditor10:setTop(47);
    obj.textEditor10:setWidth(240);
    obj.textEditor10:setHeight(140);
    obj.textEditor10:setField("descricaoPunhos");
    obj.textEditor10:setName("textEditor10");

    obj.label193 = gui.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout57);
    obj.label193:setLeft(70);
    obj.label193:setTop(193);
    obj.label193:setWidth(50);
    obj.label193:setHeight(20);
    obj.label193:setText("Kg");
    obj.label193:setName("label193");
    obj.label193:setFontColor("white");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout57);
    obj.edit199:setHorzTextAlign("center");
    obj.edit199:setVertTextAlign("center");
    obj.edit199:setLeft(90);
    obj.edit199:setTop(190);
    obj.edit199:setWidth(50);
    obj.edit199:setHeight(25);
    obj.edit199:setField("pesoPunhos");
    obj.edit199:setName("edit199");
    obj.edit199:setFontSize(15);
    obj.edit199:setFontColor("white");

    obj.label194 = gui.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout57);
    obj.label194:setLeft(147);
    obj.label194:setTop(193);
    obj.label194:setWidth(50);
    obj.label194:setHeight(20);
    obj.label194:setText("$");
    obj.label194:setName("label194");
    obj.label194:setFontColor("white");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout57);
    obj.edit200:setHorzTextAlign("center");
    obj.edit200:setVertTextAlign("center");
    obj.edit200:setLeft(160);
    obj.edit200:setTop(190);
    obj.edit200:setWidth(84);
    obj.edit200:setHeight(25);
    obj.edit200:setField("precoPunhos");
    obj.edit200:setName("edit200");
    obj.edit200:setFontSize(15);
    obj.edit200:setFontColor("white");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout57);
    obj.layout58:setLeft(5);
    obj.layout58:setTop(195);
    obj.layout58:setHeight(15);
    obj.layout58:setWidth(64);
    obj.layout58:setName("layout58");

    obj.imageCheckBox37 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox37:setParent(obj.layout58);
    obj.imageCheckBox37:setAlign("client");
    obj.imageCheckBox37:setName("imageCheckBox37");

    obj.Barrinha6 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha6:setParent(obj.imageCheckBox37);
    obj.Barrinha6:setColorMode("hl");
    obj.Barrinha6:setWidth(50);
    obj.Barrinha6:setHeight(15);
    obj.Barrinha6:setHitTest(true);
    obj.Barrinha6:setMouseGlow(true);
    obj.Barrinha6:setColor("Green");
    obj.Barrinha6:setName("Barrinha6");
    obj.Barrinha6:setField("Barrinha6Valor");
    obj.Barrinha6:setFieldMax("Barrinha6ValorMax");

    obj.ValoresBarrinha6 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha6:setParent(obj.layout57);
    obj.ValoresBarrinha6:setLeft(55);
    obj.ValoresBarrinha6:setTop(195);
    obj.ValoresBarrinha6:setWidth(90);
    obj.ValoresBarrinha6:setHeight(14);
    obj.ValoresBarrinha6:setVisible(false);
    obj.ValoresBarrinha6:setName("ValoresBarrinha6");

    obj.CorBarrinha6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha6:setParent(obj.ValoresBarrinha6);
    obj.CorBarrinha6:setAlign("client");
    obj.CorBarrinha6:setXradius(2);
    obj.CorBarrinha6:setYradius(2);
    obj.CorBarrinha6:setName("CorBarrinha6");
    obj.CorBarrinha6:setColor("Green");

    obj.InfoBarrinha6 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha6:setParent(obj.CorBarrinha6);
    obj.InfoBarrinha6:setAlign("left");
    obj.InfoBarrinha6:setFontColor("white");
    obj.InfoBarrinha6:setFontSize(12);
    obj.InfoBarrinha6:setAutoSize(true);
    obj.InfoBarrinha6:setTextTrimming("none");
    obj.InfoBarrinha6:setWordWrap(false);
    obj.InfoBarrinha6:setName("InfoBarrinha6");
    obj.InfoBarrinha6:setField("InfoBarrinha6");
    obj.InfoBarrinha6:setHorzTextAlign("center");
    obj.InfoBarrinha6:setText("0/0");

    obj.dataLink55 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout57);
    obj.dataLink55:setField("CorBarrinha6");
    obj.dataLink55:setDefaultValue("Green");
    obj.dataLink55:setName("dataLink55");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.scrollBox5);
    obj.layout59:setLeft(961);
    obj.layout59:setTop(224);
    obj.layout59:setWidth(250);
    obj.layout59:setHeight(222);
    obj.layout59:setName("layout59");


				local function loadImgSlotCintura()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/cintura.png";
				end;
			


    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout59);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.label195 = gui.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout59);
    obj.label195:setLeft(5);
    obj.label195:setTop(1);
    obj.label195:setWidth(200);
    obj.label195:setHeight(20);
    obj.label195:setText("CINTURA");
    obj.label195:setName("label195");
    obj.label195:setFontColor("white");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout59);
    obj.edit201:setVertTextAlign("center");
    obj.edit201:setLeft(5);
    obj.edit201:setTop(20);
    obj.edit201:setWidth(240);
    obj.edit201:setHeight(25);
    obj.edit201:setField("equipamentoCintura");
    obj.edit201:setName("edit201");
    obj.edit201:setFontSize(15);
    obj.edit201:setFontColor("white");

    obj.textEditor11 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout59);
    obj.textEditor11:setLeft(5);
    obj.textEditor11:setTop(47);
    obj.textEditor11:setWidth(240);
    obj.textEditor11:setHeight(140);
    obj.textEditor11:setField("descricaoCintura");
    obj.textEditor11:setName("textEditor11");

    obj.label196 = gui.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout59);
    obj.label196:setLeft(70);
    obj.label196:setTop(193);
    obj.label196:setWidth(50);
    obj.label196:setHeight(20);
    obj.label196:setText("Kg");
    obj.label196:setName("label196");
    obj.label196:setFontColor("white");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout59);
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setVertTextAlign("center");
    obj.edit202:setLeft(90);
    obj.edit202:setTop(190);
    obj.edit202:setWidth(50);
    obj.edit202:setHeight(25);
    obj.edit202:setField("pesoCintura");
    obj.edit202:setName("edit202");
    obj.edit202:setFontSize(15);
    obj.edit202:setFontColor("white");

    obj.label197 = gui.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout59);
    obj.label197:setLeft(147);
    obj.label197:setTop(193);
    obj.label197:setWidth(50);
    obj.label197:setHeight(20);
    obj.label197:setText("$");
    obj.label197:setName("label197");
    obj.label197:setFontColor("white");

    obj.edit203 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout59);
    obj.edit203:setHorzTextAlign("center");
    obj.edit203:setVertTextAlign("center");
    obj.edit203:setLeft(160);
    obj.edit203:setTop(190);
    obj.edit203:setWidth(84);
    obj.edit203:setHeight(25);
    obj.edit203:setField("precoCintura");
    obj.edit203:setName("edit203");
    obj.edit203:setFontSize(15);
    obj.edit203:setFontColor("white");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout59);
    obj.layout60:setLeft(5);
    obj.layout60:setTop(195);
    obj.layout60:setHeight(15);
    obj.layout60:setWidth(64);
    obj.layout60:setName("layout60");

    obj.imageCheckBox38 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox38:setParent(obj.layout60);
    obj.imageCheckBox38:setAlign("client");
    obj.imageCheckBox38:setName("imageCheckBox38");

    obj.Barrinha7 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha7:setParent(obj.imageCheckBox38);
    obj.Barrinha7:setColorMode("hl");
    obj.Barrinha7:setWidth(50);
    obj.Barrinha7:setHeight(15);
    obj.Barrinha7:setHitTest(true);
    obj.Barrinha7:setMouseGlow(true);
    obj.Barrinha7:setColor("Green");
    obj.Barrinha7:setName("Barrinha7");
    obj.Barrinha7:setField("Barrinha7Valor");
    obj.Barrinha7:setFieldMax("Barrinha7ValorMax");

    obj.ValoresBarrinha7 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha7:setParent(obj.layout59);
    obj.ValoresBarrinha7:setLeft(55);
    obj.ValoresBarrinha7:setTop(195);
    obj.ValoresBarrinha7:setWidth(90);
    obj.ValoresBarrinha7:setHeight(14);
    obj.ValoresBarrinha7:setVisible(false);
    obj.ValoresBarrinha7:setName("ValoresBarrinha7");

    obj.CorBarrinha7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha7:setParent(obj.ValoresBarrinha7);
    obj.CorBarrinha7:setAlign("client");
    obj.CorBarrinha7:setXradius(2);
    obj.CorBarrinha7:setYradius(2);
    obj.CorBarrinha7:setName("CorBarrinha7");
    obj.CorBarrinha7:setColor("Green");

    obj.InfoBarrinha7 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha7:setParent(obj.CorBarrinha7);
    obj.InfoBarrinha7:setAlign("left");
    obj.InfoBarrinha7:setFontColor("white");
    obj.InfoBarrinha7:setFontSize(12);
    obj.InfoBarrinha7:setAutoSize(true);
    obj.InfoBarrinha7:setTextTrimming("none");
    obj.InfoBarrinha7:setWordWrap(false);
    obj.InfoBarrinha7:setName("InfoBarrinha7");
    obj.InfoBarrinha7:setField("InfoBarrinha7");
    obj.InfoBarrinha7:setHorzTextAlign("center");
    obj.InfoBarrinha7:setText("0/0");

    obj.dataLink56 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout59);
    obj.dataLink56:setField("CorBarrinha7");
    obj.dataLink56:setDefaultValue("Green");
    obj.dataLink56:setName("dataLink56");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.scrollBox5);
    obj.layout61:setLeft(1);
    obj.layout61:setTop(447);
    obj.layout61:setWidth(250);
    obj.layout61:setHeight(222);
    obj.layout61:setName("layout61");


				local function loadImgSlotMaos()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/maos.png";
				end;
			


    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout61);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.label198 = gui.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout61);
    obj.label198:setLeft(5);
    obj.label198:setTop(1);
    obj.label198:setWidth(200);
    obj.label198:setHeight(20);
    obj.label198:setText("MÃOS");
    obj.label198:setName("label198");
    obj.label198:setFontColor("white");

    obj.edit204 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout61);
    obj.edit204:setVertTextAlign("center");
    obj.edit204:setLeft(5);
    obj.edit204:setTop(20);
    obj.edit204:setWidth(240);
    obj.edit204:setHeight(25);
    obj.edit204:setField("equipamentoMaos");
    obj.edit204:setName("edit204");
    obj.edit204:setFontSize(15);
    obj.edit204:setFontColor("white");

    obj.textEditor12 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout61);
    obj.textEditor12:setLeft(5);
    obj.textEditor12:setTop(47);
    obj.textEditor12:setWidth(240);
    obj.textEditor12:setHeight(140);
    obj.textEditor12:setField("descricaoMaos");
    obj.textEditor12:setName("textEditor12");

    obj.label199 = gui.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout61);
    obj.label199:setLeft(70);
    obj.label199:setTop(193);
    obj.label199:setWidth(50);
    obj.label199:setHeight(20);
    obj.label199:setText("Kg");
    obj.label199:setName("label199");
    obj.label199:setFontColor("white");

    obj.edit205 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout61);
    obj.edit205:setHorzTextAlign("center");
    obj.edit205:setVertTextAlign("center");
    obj.edit205:setLeft(90);
    obj.edit205:setTop(190);
    obj.edit205:setWidth(50);
    obj.edit205:setHeight(25);
    obj.edit205:setField("pesoMaos");
    obj.edit205:setName("edit205");
    obj.edit205:setFontSize(15);
    obj.edit205:setFontColor("white");

    obj.label200 = gui.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout61);
    obj.label200:setLeft(147);
    obj.label200:setTop(193);
    obj.label200:setWidth(50);
    obj.label200:setHeight(20);
    obj.label200:setText("$");
    obj.label200:setName("label200");
    obj.label200:setFontColor("white");

    obj.edit206 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout61);
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setVertTextAlign("center");
    obj.edit206:setLeft(160);
    obj.edit206:setTop(190);
    obj.edit206:setWidth(84);
    obj.edit206:setHeight(25);
    obj.edit206:setField("precoMaos");
    obj.edit206:setName("edit206");
    obj.edit206:setFontSize(15);
    obj.edit206:setFontColor("white");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout61);
    obj.layout62:setLeft(5);
    obj.layout62:setTop(195);
    obj.layout62:setHeight(15);
    obj.layout62:setWidth(64);
    obj.layout62:setName("layout62");

    obj.imageCheckBox39 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox39:setParent(obj.layout62);
    obj.imageCheckBox39:setAlign("client");
    obj.imageCheckBox39:setName("imageCheckBox39");

    obj.Barrinha8 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha8:setParent(obj.imageCheckBox39);
    obj.Barrinha8:setColorMode("hl");
    obj.Barrinha8:setWidth(50);
    obj.Barrinha8:setHeight(15);
    obj.Barrinha8:setHitTest(true);
    obj.Barrinha8:setMouseGlow(true);
    obj.Barrinha8:setColor("Green");
    obj.Barrinha8:setName("Barrinha8");
    obj.Barrinha8:setField("Barrinha8Valor");
    obj.Barrinha8:setFieldMax("Barrinha8ValorMax");

    obj.ValoresBarrinha8 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha8:setParent(obj.layout61);
    obj.ValoresBarrinha8:setLeft(55);
    obj.ValoresBarrinha8:setTop(195);
    obj.ValoresBarrinha8:setWidth(90);
    obj.ValoresBarrinha8:setHeight(14);
    obj.ValoresBarrinha8:setVisible(false);
    obj.ValoresBarrinha8:setName("ValoresBarrinha8");

    obj.CorBarrinha8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha8:setParent(obj.ValoresBarrinha8);
    obj.CorBarrinha8:setAlign("client");
    obj.CorBarrinha8:setXradius(2);
    obj.CorBarrinha8:setYradius(2);
    obj.CorBarrinha8:setName("CorBarrinha8");
    obj.CorBarrinha8:setColor("Green");

    obj.InfoBarrinha8 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha8:setParent(obj.CorBarrinha8);
    obj.InfoBarrinha8:setAlign("left");
    obj.InfoBarrinha8:setFontColor("white");
    obj.InfoBarrinha8:setFontSize(12);
    obj.InfoBarrinha8:setAutoSize(true);
    obj.InfoBarrinha8:setTextTrimming("none");
    obj.InfoBarrinha8:setWordWrap(false);
    obj.InfoBarrinha8:setName("InfoBarrinha8");
    obj.InfoBarrinha8:setField("InfoBarrinha8");
    obj.InfoBarrinha8:setHorzTextAlign("center");
    obj.InfoBarrinha8:setText("0/0");

    obj.dataLink57 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout61);
    obj.dataLink57:setField("CorBarrinha8");
    obj.dataLink57:setDefaultValue("Green");
    obj.dataLink57:setName("dataLink57");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.scrollBox5);
    obj.layout63:setLeft(252);
    obj.layout63:setTop(447);
    obj.layout63:setWidth(250);
    obj.layout63:setHeight(222);
    obj.layout63:setName("layout63");


				local function loadImgSlotDedosI()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/dedoI.png";
				end;
			


    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout63);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setName("rectangle34");

    obj.label201 = gui.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout63);
    obj.label201:setLeft(5);
    obj.label201:setTop(1);
    obj.label201:setWidth(200);
    obj.label201:setHeight(20);
    obj.label201:setText("DEDO I");
    obj.label201:setName("label201");
    obj.label201:setFontColor("white");

    obj.edit207 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout63);
    obj.edit207:setVertTextAlign("center");
    obj.edit207:setLeft(5);
    obj.edit207:setTop(20);
    obj.edit207:setWidth(240);
    obj.edit207:setHeight(25);
    obj.edit207:setField("equipamentoDedosI");
    obj.edit207:setName("edit207");
    obj.edit207:setFontSize(15);
    obj.edit207:setFontColor("white");

    obj.textEditor13 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout63);
    obj.textEditor13:setLeft(5);
    obj.textEditor13:setTop(47);
    obj.textEditor13:setWidth(240);
    obj.textEditor13:setHeight(140);
    obj.textEditor13:setField("descricaoDedosI");
    obj.textEditor13:setName("textEditor13");

    obj.label202 = gui.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout63);
    obj.label202:setLeft(70);
    obj.label202:setTop(193);
    obj.label202:setWidth(50);
    obj.label202:setHeight(20);
    obj.label202:setText("Kg");
    obj.label202:setName("label202");
    obj.label202:setFontColor("white");

    obj.edit208 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout63);
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setVertTextAlign("center");
    obj.edit208:setLeft(90);
    obj.edit208:setTop(190);
    obj.edit208:setWidth(50);
    obj.edit208:setHeight(25);
    obj.edit208:setField("pesoDedosI");
    obj.edit208:setName("edit208");
    obj.edit208:setFontSize(15);
    obj.edit208:setFontColor("white");

    obj.label203 = gui.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout63);
    obj.label203:setLeft(147);
    obj.label203:setTop(193);
    obj.label203:setWidth(50);
    obj.label203:setHeight(20);
    obj.label203:setText("$");
    obj.label203:setName("label203");
    obj.label203:setFontColor("white");

    obj.edit209 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout63);
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setVertTextAlign("center");
    obj.edit209:setLeft(160);
    obj.edit209:setTop(190);
    obj.edit209:setWidth(84);
    obj.edit209:setHeight(25);
    obj.edit209:setField("precoDedosI");
    obj.edit209:setName("edit209");
    obj.edit209:setFontSize(15);
    obj.edit209:setFontColor("white");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout63);
    obj.layout64:setLeft(5);
    obj.layout64:setTop(195);
    obj.layout64:setHeight(15);
    obj.layout64:setWidth(64);
    obj.layout64:setName("layout64");

    obj.imageCheckBox40 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox40:setParent(obj.layout64);
    obj.imageCheckBox40:setAlign("client");
    obj.imageCheckBox40:setName("imageCheckBox40");

    obj.Barrinha9 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha9:setParent(obj.imageCheckBox40);
    obj.Barrinha9:setColorMode("hl");
    obj.Barrinha9:setWidth(50);
    obj.Barrinha9:setHeight(15);
    obj.Barrinha9:setHitTest(true);
    obj.Barrinha9:setMouseGlow(true);
    obj.Barrinha9:setColor("Green");
    obj.Barrinha9:setName("Barrinha9");
    obj.Barrinha9:setField("Barrinha9Valor");
    obj.Barrinha9:setFieldMax("Barrinha9ValorMax");

    obj.ValoresBarrinha9 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha9:setParent(obj.layout63);
    obj.ValoresBarrinha9:setLeft(55);
    obj.ValoresBarrinha9:setTop(195);
    obj.ValoresBarrinha9:setWidth(90);
    obj.ValoresBarrinha9:setHeight(14);
    obj.ValoresBarrinha9:setVisible(false);
    obj.ValoresBarrinha9:setName("ValoresBarrinha9");

    obj.CorBarrinha9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha9:setParent(obj.ValoresBarrinha9);
    obj.CorBarrinha9:setAlign("client");
    obj.CorBarrinha9:setXradius(2);
    obj.CorBarrinha9:setYradius(2);
    obj.CorBarrinha9:setName("CorBarrinha9");
    obj.CorBarrinha9:setColor("Green");

    obj.InfoBarrinha9 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha9:setParent(obj.CorBarrinha9);
    obj.InfoBarrinha9:setAlign("left");
    obj.InfoBarrinha9:setFontColor("white");
    obj.InfoBarrinha9:setFontSize(12);
    obj.InfoBarrinha9:setAutoSize(true);
    obj.InfoBarrinha9:setTextTrimming("none");
    obj.InfoBarrinha9:setWordWrap(false);
    obj.InfoBarrinha9:setName("InfoBarrinha9");
    obj.InfoBarrinha9:setField("InfoBarrinha9");
    obj.InfoBarrinha9:setHorzTextAlign("center");
    obj.InfoBarrinha9:setText("0/0");

    obj.dataLink58 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout63);
    obj.dataLink58:setField("CorBarrinha9");
    obj.dataLink58:setDefaultValue("Green");
    obj.dataLink58:setName("dataLink58");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.scrollBox5);
    obj.layout65:setLeft(710);
    obj.layout65:setTop(447);
    obj.layout65:setWidth(250);
    obj.layout65:setHeight(222);
    obj.layout65:setName("layout65");


				local function loadImgSlotDesdosII()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/dedoII.png";
				end;
			


    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout65);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.label204 = gui.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout65);
    obj.label204:setLeft(5);
    obj.label204:setTop(1);
    obj.label204:setWidth(200);
    obj.label204:setHeight(20);
    obj.label204:setText("DEDO II");
    obj.label204:setName("label204");
    obj.label204:setFontColor("white");

    obj.edit210 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout65);
    obj.edit210:setVertTextAlign("center");
    obj.edit210:setLeft(5);
    obj.edit210:setTop(20);
    obj.edit210:setWidth(240);
    obj.edit210:setHeight(25);
    obj.edit210:setField("equipamentoDesdosII");
    obj.edit210:setName("edit210");
    obj.edit210:setFontSize(15);
    obj.edit210:setFontColor("white");

    obj.textEditor14 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout65);
    obj.textEditor14:setLeft(5);
    obj.textEditor14:setTop(47);
    obj.textEditor14:setWidth(240);
    obj.textEditor14:setHeight(140);
    obj.textEditor14:setField("descricaoDesdosII");
    obj.textEditor14:setName("textEditor14");

    obj.label205 = gui.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout65);
    obj.label205:setLeft(70);
    obj.label205:setTop(193);
    obj.label205:setWidth(50);
    obj.label205:setHeight(20);
    obj.label205:setText("Kg");
    obj.label205:setName("label205");
    obj.label205:setFontColor("white");

    obj.edit211 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout65);
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setVertTextAlign("center");
    obj.edit211:setLeft(90);
    obj.edit211:setTop(190);
    obj.edit211:setWidth(50);
    obj.edit211:setHeight(25);
    obj.edit211:setField("pesoDesdosII");
    obj.edit211:setName("edit211");
    obj.edit211:setFontSize(15);
    obj.edit211:setFontColor("white");

    obj.label206 = gui.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout65);
    obj.label206:setLeft(147);
    obj.label206:setTop(193);
    obj.label206:setWidth(50);
    obj.label206:setHeight(20);
    obj.label206:setText("$");
    obj.label206:setName("label206");
    obj.label206:setFontColor("white");

    obj.edit212 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout65);
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setVertTextAlign("center");
    obj.edit212:setLeft(160);
    obj.edit212:setTop(190);
    obj.edit212:setWidth(84);
    obj.edit212:setHeight(25);
    obj.edit212:setField("precoDesdosII");
    obj.edit212:setName("edit212");
    obj.edit212:setFontSize(15);
    obj.edit212:setFontColor("white");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout65);
    obj.layout66:setLeft(5);
    obj.layout66:setTop(195);
    obj.layout66:setHeight(15);
    obj.layout66:setWidth(64);
    obj.layout66:setName("layout66");

    obj.imageCheckBox41 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox41:setParent(obj.layout66);
    obj.imageCheckBox41:setAlign("client");
    obj.imageCheckBox41:setName("imageCheckBox41");

    obj.Barrinha10 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha10:setParent(obj.imageCheckBox41);
    obj.Barrinha10:setColorMode("hl");
    obj.Barrinha10:setWidth(50);
    obj.Barrinha10:setHeight(15);
    obj.Barrinha10:setHitTest(true);
    obj.Barrinha10:setMouseGlow(true);
    obj.Barrinha10:setColor("Green");
    obj.Barrinha10:setName("Barrinha10");
    obj.Barrinha10:setField("Barrinha10Valor");
    obj.Barrinha10:setFieldMax("Barrinha10ValorMax");

    obj.ValoresBarrinha10 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha10:setParent(obj.layout65);
    obj.ValoresBarrinha10:setLeft(55);
    obj.ValoresBarrinha10:setTop(195);
    obj.ValoresBarrinha10:setWidth(90);
    obj.ValoresBarrinha10:setHeight(14);
    obj.ValoresBarrinha10:setVisible(false);
    obj.ValoresBarrinha10:setName("ValoresBarrinha10");

    obj.CorBarrinha10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha10:setParent(obj.ValoresBarrinha10);
    obj.CorBarrinha10:setAlign("client");
    obj.CorBarrinha10:setXradius(2);
    obj.CorBarrinha10:setYradius(2);
    obj.CorBarrinha10:setName("CorBarrinha10");
    obj.CorBarrinha10:setColor("Green");

    obj.InfoBarrinha10 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha10:setParent(obj.CorBarrinha10);
    obj.InfoBarrinha10:setAlign("left");
    obj.InfoBarrinha10:setFontColor("white");
    obj.InfoBarrinha10:setFontSize(12);
    obj.InfoBarrinha10:setAutoSize(true);
    obj.InfoBarrinha10:setTextTrimming("none");
    obj.InfoBarrinha10:setWordWrap(false);
    obj.InfoBarrinha10:setName("InfoBarrinha10");
    obj.InfoBarrinha10:setField("InfoBarrinha10");
    obj.InfoBarrinha10:setHorzTextAlign("center");
    obj.InfoBarrinha10:setText("0/0");

    obj.dataLink59 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout65);
    obj.dataLink59:setField("CorBarrinha10");
    obj.dataLink59:setDefaultValue("Green");
    obj.dataLink59:setName("dataLink59");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.scrollBox5);
    obj.layout67:setLeft(961);
    obj.layout67:setTop(447);
    obj.layout67:setWidth(250);
    obj.layout67:setHeight(222);
    obj.layout67:setName("layout67");


				local function loadImgSlotPes()
					if sheet==nil then return end;
					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/pes.png";
				end;
			


    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout67);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.label207 = gui.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout67);
    obj.label207:setLeft(5);
    obj.label207:setTop(1);
    obj.label207:setWidth(200);
    obj.label207:setHeight(20);
    obj.label207:setText("PÉS");
    obj.label207:setName("label207");
    obj.label207:setFontColor("white");

    obj.edit213 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout67);
    obj.edit213:setVertTextAlign("center");
    obj.edit213:setLeft(5);
    obj.edit213:setTop(20);
    obj.edit213:setWidth(240);
    obj.edit213:setHeight(25);
    obj.edit213:setField("equipamentoPes");
    obj.edit213:setName("edit213");
    obj.edit213:setFontSize(15);
    obj.edit213:setFontColor("white");

    obj.textEditor15 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout67);
    obj.textEditor15:setLeft(5);
    obj.textEditor15:setTop(47);
    obj.textEditor15:setWidth(240);
    obj.textEditor15:setHeight(140);
    obj.textEditor15:setField("descricaoPes");
    obj.textEditor15:setName("textEditor15");

    obj.label208 = gui.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout67);
    obj.label208:setLeft(70);
    obj.label208:setTop(193);
    obj.label208:setWidth(50);
    obj.label208:setHeight(20);
    obj.label208:setText("Kg");
    obj.label208:setName("label208");
    obj.label208:setFontColor("white");

    obj.edit214 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout67);
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setVertTextAlign("center");
    obj.edit214:setLeft(90);
    obj.edit214:setTop(190);
    obj.edit214:setWidth(50);
    obj.edit214:setHeight(25);
    obj.edit214:setField("pesoPes");
    obj.edit214:setName("edit214");
    obj.edit214:setFontSize(15);
    obj.edit214:setFontColor("white");

    obj.label209 = gui.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout67);
    obj.label209:setLeft(147);
    obj.label209:setTop(193);
    obj.label209:setWidth(50);
    obj.label209:setHeight(20);
    obj.label209:setText("$");
    obj.label209:setName("label209");
    obj.label209:setFontColor("white");

    obj.edit215 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout67);
    obj.edit215:setHorzTextAlign("center");
    obj.edit215:setVertTextAlign("center");
    obj.edit215:setLeft(160);
    obj.edit215:setTop(190);
    obj.edit215:setWidth(84);
    obj.edit215:setHeight(25);
    obj.edit215:setField("precoPes");
    obj.edit215:setName("edit215");
    obj.edit215:setFontSize(15);
    obj.edit215:setFontColor("white");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout67);
    obj.layout68:setLeft(5);
    obj.layout68:setTop(195);
    obj.layout68:setHeight(15);
    obj.layout68:setWidth(64);
    obj.layout68:setName("layout68");

    obj.imageCheckBox42 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox42:setParent(obj.layout68);
    obj.imageCheckBox42:setAlign("client");
    obj.imageCheckBox42:setName("imageCheckBox42");

    obj.Barrinha11 = gui.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha11:setParent(obj.imageCheckBox42);
    obj.Barrinha11:setColorMode("hl");
    obj.Barrinha11:setWidth(50);
    obj.Barrinha11:setHeight(15);
    obj.Barrinha11:setHitTest(true);
    obj.Barrinha11:setMouseGlow(true);
    obj.Barrinha11:setColor("Green");
    obj.Barrinha11:setName("Barrinha11");
    obj.Barrinha11:setField("Barrinha11Valor");
    obj.Barrinha11:setFieldMax("Barrinha11ValorMax");

    obj.ValoresBarrinha11 = gui.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha11:setParent(obj.layout67);
    obj.ValoresBarrinha11:setLeft(55);
    obj.ValoresBarrinha11:setTop(195);
    obj.ValoresBarrinha11:setWidth(90);
    obj.ValoresBarrinha11:setHeight(14);
    obj.ValoresBarrinha11:setVisible(false);
    obj.ValoresBarrinha11:setName("ValoresBarrinha11");

    obj.CorBarrinha11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha11:setParent(obj.ValoresBarrinha11);
    obj.CorBarrinha11:setAlign("client");
    obj.CorBarrinha11:setXradius(2);
    obj.CorBarrinha11:setYradius(2);
    obj.CorBarrinha11:setName("CorBarrinha11");
    obj.CorBarrinha11:setColor("Green");

    obj.InfoBarrinha11 = gui.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha11:setParent(obj.CorBarrinha11);
    obj.InfoBarrinha11:setAlign("left");
    obj.InfoBarrinha11:setFontColor("white");
    obj.InfoBarrinha11:setFontSize(12);
    obj.InfoBarrinha11:setAutoSize(true);
    obj.InfoBarrinha11:setTextTrimming("none");
    obj.InfoBarrinha11:setWordWrap(false);
    obj.InfoBarrinha11:setName("InfoBarrinha11");
    obj.InfoBarrinha11:setField("InfoBarrinha11");
    obj.InfoBarrinha11:setHorzTextAlign("center");
    obj.InfoBarrinha11:setText("0/0");

    obj.dataLink60 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout67);
    obj.dataLink60:setField("CorBarrinha11");
    obj.dataLink60:setDefaultValue("Green");
    obj.dataLink60:setName("dataLink60");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Inventario");
    obj.tab5:setName("tab5");

    obj.frmFichaRPGmeister7_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister7_svg:setParent(obj.tab5);
    obj.frmFichaRPGmeister7_svg:setName("frmFichaRPGmeister7_svg");
    obj.frmFichaRPGmeister7_svg:setAlign("client");
    obj.frmFichaRPGmeister7_svg:setTheme("dark");
    obj.frmFichaRPGmeister7_svg:setMargins({top=1});

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmFichaRPGmeister7_svg);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.scrollBox6);
    obj.layout69:setLeft(0);
    obj.layout69:setTop(0);
    obj.layout69:setWidth(475);
    obj.layout69:setHeight(330);
    obj.layout69:setName("layout69");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout69);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("black");
    obj.rectangle37:setName("rectangle37");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout69);
    obj.button5:setText("+");
    obj.button5:setLeft(5);
    obj.button5:setTop(5);
    obj.button5:setWidth(20);
    obj.button5:setHeight(20);
    obj.button5:setName("button5");

    obj.label210 = gui.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout69);
    obj.label210:setLeft(30);
    obj.label210:setTop(5);
    obj.label210:setWidth(435);
    obj.label210:setHeight(20);
    obj.label210:setText("ARMAS E ESCUDOS                                     Kg         $");
    obj.label210:setName("label210");
    obj.label210:setFontColor("white");

    obj.rclListaDasArmas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasArmas:setParent(obj.layout69);
    obj.rclListaDasArmas:setName("rclListaDasArmas");
    obj.rclListaDasArmas:setField("campoDasArmas");
    obj.rclListaDasArmas:setTemplateForm("frmFichaRPGmeister7A_svg");
    obj.rclListaDasArmas:setLeft(5);
    obj.rclListaDasArmas:setTop(25);
    obj.rclListaDasArmas:setWidth(465);
    obj.rclListaDasArmas:setHeight(275);
    obj.rclListaDasArmas:setLayout("vertical");
    obj.rclListaDasArmas:setMinQt(1);

    obj.label211 = gui.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout69);
    obj.label211:setLeft(260);
    obj.label211:setTop(305);
    obj.label211:setWidth(50);
    obj.label211:setHeight(20);
    obj.label211:setText("Kg");
    obj.label211:setName("label211");
    obj.label211:setFontColor("white");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout69);
    obj.rectangle38:setLeft(280);
    obj.rectangle38:setTop(305);
    obj.rectangle38:setWidth(70);
    obj.rectangle38:setHeight(20);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label212 = gui.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout69);
    obj.label212:setVertTextAlign("center");
    obj.label212:setHorzTextAlign("center");
    obj.label212:setLeft(280);
    obj.label212:setTop(305);
    obj.label212:setWidth(70);
    obj.label212:setHeight(20);
    obj.label212:setField("pesoArmas");
    obj.label212:setName("label212");
    obj.label212:setFontColor("white");

    obj.label213 = gui.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout69);
    obj.label213:setLeft(360);
    obj.label213:setTop(305);
    obj.label213:setWidth(50);
    obj.label213:setHeight(20);
    obj.label213:setText("$");
    obj.label213:setName("label213");
    obj.label213:setFontColor("white");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout69);
    obj.rectangle39:setLeft(375);
    obj.rectangle39:setTop(305);
    obj.rectangle39:setWidth(91);
    obj.rectangle39:setHeight(20);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label214 = gui.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout69);
    obj.label214:setVertTextAlign("center");
    obj.label214:setHorzTextAlign("center");
    obj.label214:setLeft(375);
    obj.label214:setTop(305);
    obj.label214:setWidth(91);
    obj.label214:setHeight(20);
    obj.label214:setField("precoArmas");
    obj.label214:setName("label214");
    obj.label214:setFontColor("white");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.scrollBox6);
    obj.layout70:setLeft(0);
    obj.layout70:setTop(335);
    obj.layout70:setWidth(475);
    obj.layout70:setHeight(335);
    obj.layout70:setName("layout70");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout70);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setName("rectangle40");

    obj.label215 = gui.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout70);
    obj.label215:setLeft(5);
    obj.label215:setTop(1);
    obj.label215:setWidth(200);
    obj.label215:setHeight(20);
    obj.label215:setText("MOCHILA");
    obj.label215:setName("label215");
    obj.label215:setFontColor("white");

    obj.textEditor16 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout70);
    obj.textEditor16:setLeft(5);
    obj.textEditor16:setTop(25);
    obj.textEditor16:setWidth(465);
    obj.textEditor16:setHeight(280);
    obj.textEditor16:setField("mochila");
    obj.textEditor16:setName("textEditor16");

    obj.label216 = gui.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout70);
    obj.label216:setLeft(280);
    obj.label216:setTop(310);
    obj.label216:setWidth(50);
    obj.label216:setHeight(20);
    obj.label216:setText("Kg");
    obj.label216:setName("label216");
    obj.label216:setFontColor("white");

    obj.edit216 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout70);
    obj.edit216:setVertTextAlign("center");
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setLeft(300);
    obj.edit216:setTop(310);
    obj.edit216:setWidth(70);
    obj.edit216:setHeight(20);
    obj.edit216:setField("pesoMochila");
    obj.edit216:setName("edit216");
    obj.edit216:setFontSize(15);
    obj.edit216:setFontColor("white");

    obj.label217 = gui.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout70);
    obj.label217:setLeft(380);
    obj.label217:setTop(310);
    obj.label217:setWidth(50);
    obj.label217:setHeight(20);
    obj.label217:setText("$");
    obj.label217:setName("label217");
    obj.label217:setFontColor("white");

    obj.edit217 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout70);
    obj.edit217:setVertTextAlign("center");
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setLeft(395);
    obj.edit217:setTop(310);
    obj.edit217:setWidth(71);
    obj.edit217:setHeight(20);
    obj.edit217:setField("precoMochila");
    obj.edit217:setName("edit217");
    obj.edit217:setFontSize(15);
    obj.edit217:setFontColor("white");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.scrollBox6);
    obj.layout71:setLeft(480);
    obj.layout71:setTop(0);
    obj.layout71:setWidth(200);
    obj.layout71:setHeight(220);
    obj.layout71:setName("layout71");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout71);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setName("rectangle41");

    obj.label218 = gui.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout71);
    obj.label218:setLeft(5);
    obj.label218:setTop(1);
    obj.label218:setWidth(150);
    obj.label218:setHeight(20);
    obj.label218:setText("PERMANENCIAS");
    obj.label218:setName("label218");
    obj.label218:setFontColor("white");

    obj.textEditor17 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout71);
    obj.textEditor17:setLeft(5);
    obj.textEditor17:setTop(25);
    obj.textEditor17:setWidth(190);
    obj.textEditor17:setHeight(165);
    obj.textEditor17:setField("permanencias");
    obj.textEditor17:setName("textEditor17");

    obj.label219 = gui.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout71);
    obj.label219:setLeft(5);
    obj.label219:setTop(195);
    obj.label219:setWidth(50);
    obj.label219:setHeight(20);
    obj.label219:setText("Kg");
    obj.label219:setName("label219");
    obj.label219:setFontColor("white");

    obj.edit218 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout71);
    obj.edit218:setVertTextAlign("center");
    obj.edit218:setHorzTextAlign("center");
    obj.edit218:setLeft(25);
    obj.edit218:setTop(195);
    obj.edit218:setWidth(70);
    obj.edit218:setHeight(20);
    obj.edit218:setField("pesoPermanencias");
    obj.edit218:setName("edit218");
    obj.edit218:setFontSize(15);
    obj.edit218:setFontColor("white");

    obj.label220 = gui.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout71);
    obj.label220:setLeft(105);
    obj.label220:setTop(195);
    obj.label220:setWidth(50);
    obj.label220:setHeight(20);
    obj.label220:setText("$");
    obj.label220:setName("label220");
    obj.label220:setFontColor("white");

    obj.edit219 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout71);
    obj.edit219:setVertTextAlign("center");
    obj.edit219:setHorzTextAlign("center");
    obj.edit219:setLeft(120);
    obj.edit219:setTop(195);
    obj.edit219:setWidth(70);
    obj.edit219:setHeight(20);
    obj.edit219:setField("precoPermanencias");
    obj.edit219:setName("edit219");
    obj.edit219:setFontSize(15);
    obj.edit219:setFontColor("white");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.scrollBox6);
    obj.layout72:setLeft(685);
    obj.layout72:setTop(0);
    obj.layout72:setWidth(200);
    obj.layout72:setHeight(220);
    obj.layout72:setName("layout72");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout72);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.label221 = gui.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout72);
    obj.label221:setLeft(5);
    obj.label221:setTop(1);
    obj.label221:setWidth(150);
    obj.label221:setHeight(20);
    obj.label221:setText("LIVRES");
    obj.label221:setName("label221");
    obj.label221:setFontColor("white");

    obj.textEditor18 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout72);
    obj.textEditor18:setLeft(5);
    obj.textEditor18:setTop(25);
    obj.textEditor18:setWidth(190);
    obj.textEditor18:setHeight(165);
    obj.textEditor18:setField("livres");
    obj.textEditor18:setName("textEditor18");

    obj.label222 = gui.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout72);
    obj.label222:setLeft(5);
    obj.label222:setTop(195);
    obj.label222:setWidth(50);
    obj.label222:setHeight(20);
    obj.label222:setText("Kg");
    obj.label222:setName("label222");
    obj.label222:setFontColor("white");

    obj.edit220 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout72);
    obj.edit220:setVertTextAlign("center");
    obj.edit220:setHorzTextAlign("center");
    obj.edit220:setLeft(25);
    obj.edit220:setTop(195);
    obj.edit220:setWidth(70);
    obj.edit220:setHeight(20);
    obj.edit220:setField("pesoLivres");
    obj.edit220:setName("edit220");
    obj.edit220:setFontSize(15);
    obj.edit220:setFontColor("white");

    obj.label223 = gui.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout72);
    obj.label223:setLeft(105);
    obj.label223:setTop(195);
    obj.label223:setWidth(50);
    obj.label223:setHeight(20);
    obj.label223:setText("$");
    obj.label223:setName("label223");
    obj.label223:setFontColor("white");

    obj.edit221 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout72);
    obj.edit221:setVertTextAlign("center");
    obj.edit221:setHorzTextAlign("center");
    obj.edit221:setLeft(120);
    obj.edit221:setTop(195);
    obj.edit221:setWidth(70);
    obj.edit221:setHeight(20);
    obj.edit221:setField("precoLivres");
    obj.edit221:setName("edit221");
    obj.edit221:setFontSize(15);
    obj.edit221:setFontColor("white");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.scrollBox6);
    obj.layout73:setLeft(480);
    obj.layout73:setTop(225);
    obj.layout73:setWidth(200);
    obj.layout73:setHeight(220);
    obj.layout73:setName("layout73");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout73);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("black");
    obj.rectangle43:setName("rectangle43");

    obj.label224 = gui.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout73);
    obj.label224:setLeft(5);
    obj.label224:setTop(1);
    obj.label224:setWidth(150);
    obj.label224:setHeight(20);
    obj.label224:setText("OUTROS");
    obj.label224:setName("label224");
    obj.label224:setFontColor("white");

    obj.textEditor19 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout73);
    obj.textEditor19:setLeft(5);
    obj.textEditor19:setTop(25);
    obj.textEditor19:setWidth(190);
    obj.textEditor19:setHeight(165);
    obj.textEditor19:setField("outros");
    obj.textEditor19:setName("textEditor19");

    obj.label225 = gui.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout73);
    obj.label225:setLeft(5);
    obj.label225:setTop(195);
    obj.label225:setWidth(50);
    obj.label225:setHeight(20);
    obj.label225:setText("Kg");
    obj.label225:setName("label225");
    obj.label225:setFontColor("white");

    obj.edit222 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout73);
    obj.edit222:setVertTextAlign("center");
    obj.edit222:setHorzTextAlign("center");
    obj.edit222:setLeft(25);
    obj.edit222:setTop(195);
    obj.edit222:setWidth(70);
    obj.edit222:setHeight(20);
    obj.edit222:setField("pesoOutros");
    obj.edit222:setName("edit222");
    obj.edit222:setFontSize(15);
    obj.edit222:setFontColor("white");

    obj.label226 = gui.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout73);
    obj.label226:setLeft(105);
    obj.label226:setTop(195);
    obj.label226:setWidth(50);
    obj.label226:setHeight(20);
    obj.label226:setText("$");
    obj.label226:setName("label226");
    obj.label226:setFontColor("white");

    obj.edit223 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout73);
    obj.edit223:setVertTextAlign("center");
    obj.edit223:setHorzTextAlign("center");
    obj.edit223:setLeft(120);
    obj.edit223:setTop(195);
    obj.edit223:setWidth(70);
    obj.edit223:setHeight(20);
    obj.edit223:setField("precoOutros");
    obj.edit223:setName("edit223");
    obj.edit223:setFontSize(15);
    obj.edit223:setFontColor("white");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.scrollBox6);
    obj.layout74:setLeft(685);
    obj.layout74:setTop(225);
    obj.layout74:setWidth(200);
    obj.layout74:setHeight(220);
    obj.layout74:setName("layout74");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout74);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setName("rectangle44");

    obj.label227 = gui.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout74);
    obj.label227:setLeft(5);
    obj.label227:setTop(1);
    obj.label227:setWidth(150);
    obj.label227:setHeight(20);
    obj.label227:setText("MUNIÇÕES");
    obj.label227:setName("label227");
    obj.label227:setFontColor("white");

    obj.textEditor20 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.layout74);
    obj.textEditor20:setLeft(5);
    obj.textEditor20:setTop(25);
    obj.textEditor20:setWidth(190);
    obj.textEditor20:setHeight(165);
    obj.textEditor20:setField("municoes");
    obj.textEditor20:setName("textEditor20");

    obj.label228 = gui.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout74);
    obj.label228:setLeft(5);
    obj.label228:setTop(195);
    obj.label228:setWidth(50);
    obj.label228:setHeight(20);
    obj.label228:setText("Kg");
    obj.label228:setName("label228");
    obj.label228:setFontColor("white");

    obj.edit224 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout74);
    obj.edit224:setVertTextAlign("center");
    obj.edit224:setHorzTextAlign("center");
    obj.edit224:setLeft(25);
    obj.edit224:setTop(195);
    obj.edit224:setWidth(70);
    obj.edit224:setHeight(20);
    obj.edit224:setField("pesoMunicoes");
    obj.edit224:setName("edit224");
    obj.edit224:setFontSize(15);
    obj.edit224:setFontColor("white");

    obj.label229 = gui.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout74);
    obj.label229:setLeft(105);
    obj.label229:setTop(195);
    obj.label229:setWidth(50);
    obj.label229:setHeight(20);
    obj.label229:setText("$");
    obj.label229:setName("label229");
    obj.label229:setFontColor("white");

    obj.edit225 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout74);
    obj.edit225:setVertTextAlign("center");
    obj.edit225:setHorzTextAlign("center");
    obj.edit225:setLeft(120);
    obj.edit225:setTop(195);
    obj.edit225:setWidth(70);
    obj.edit225:setHeight(20);
    obj.edit225:setField("precoMunicoes");
    obj.edit225:setName("edit225");
    obj.edit225:setFontSize(15);
    obj.edit225:setFontColor("white");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.scrollBox6);
    obj.layout75:setLeft(480);
    obj.layout75:setTop(450);
    obj.layout75:setWidth(200);
    obj.layout75:setHeight(221);
    obj.layout75:setName("layout75");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout75);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setName("rectangle45");

    obj.label230 = gui.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout75);
    obj.label230:setLeft(5);
    obj.label230:setTop(1);
    obj.label230:setWidth(150);
    obj.label230:setHeight(20);
    obj.label230:setText("BOLSOS");
    obj.label230:setName("label230");
    obj.label230:setFontColor("white");

    obj.textEditor21 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.layout75);
    obj.textEditor21:setLeft(5);
    obj.textEditor21:setTop(25);
    obj.textEditor21:setWidth(190);
    obj.textEditor21:setHeight(165);
    obj.textEditor21:setField("bolsos");
    obj.textEditor21:setName("textEditor21");

    obj.label231 = gui.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout75);
    obj.label231:setLeft(5);
    obj.label231:setTop(195);
    obj.label231:setWidth(50);
    obj.label231:setHeight(20);
    obj.label231:setText("Kg");
    obj.label231:setName("label231");
    obj.label231:setFontColor("white");

    obj.edit226 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout75);
    obj.edit226:setVertTextAlign("center");
    obj.edit226:setHorzTextAlign("center");
    obj.edit226:setLeft(25);
    obj.edit226:setTop(195);
    obj.edit226:setWidth(70);
    obj.edit226:setHeight(20);
    obj.edit226:setField("pesoBolsos");
    obj.edit226:setName("edit226");
    obj.edit226:setFontSize(15);
    obj.edit226:setFontColor("white");

    obj.label232 = gui.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout75);
    obj.label232:setLeft(105);
    obj.label232:setTop(195);
    obj.label232:setWidth(50);
    obj.label232:setHeight(20);
    obj.label232:setText("$");
    obj.label232:setName("label232");
    obj.label232:setFontColor("white");

    obj.edit227 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout75);
    obj.edit227:setVertTextAlign("center");
    obj.edit227:setHorzTextAlign("center");
    obj.edit227:setLeft(120);
    obj.edit227:setTop(195);
    obj.edit227:setWidth(70);
    obj.edit227:setHeight(20);
    obj.edit227:setField("precoBolsos");
    obj.edit227:setName("edit227");
    obj.edit227:setFontSize(15);
    obj.edit227:setFontColor("white");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.scrollBox6);
    obj.layout76:setLeft(685);
    obj.layout76:setTop(450);
    obj.layout76:setWidth(200);
    obj.layout76:setHeight(221);
    obj.layout76:setName("layout76");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout76);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setName("rectangle46");

    obj.label233 = gui.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout76);
    obj.label233:setLeft(5);
    obj.label233:setTop(1);
    obj.label233:setWidth(150);
    obj.label233:setHeight(20);
    obj.label233:setText("IMOVEIS");
    obj.label233:setName("label233");
    obj.label233:setFontColor("white");

    obj.textEditor22 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.layout76);
    obj.textEditor22:setLeft(5);
    obj.textEditor22:setTop(25);
    obj.textEditor22:setWidth(190);
    obj.textEditor22:setHeight(165);
    obj.textEditor22:setField("moveis");
    obj.textEditor22:setName("textEditor22");

    obj.label234 = gui.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout76);
    obj.label234:setLeft(5);
    obj.label234:setTop(195);
    obj.label234:setWidth(50);
    obj.label234:setHeight(20);
    obj.label234:setText("Kg");
    obj.label234:setName("label234");
    obj.label234:setFontColor("white");

    obj.edit228 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout76);
    obj.edit228:setVertTextAlign("center");
    obj.edit228:setHorzTextAlign("center");
    obj.edit228:setLeft(25);
    obj.edit228:setTop(195);
    obj.edit228:setWidth(70);
    obj.edit228:setHeight(20);
    obj.edit228:setField("pesoImoveis");
    obj.edit228:setName("edit228");
    obj.edit228:setFontSize(15);
    obj.edit228:setFontColor("white");

    obj.label235 = gui.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout76);
    obj.label235:setLeft(105);
    obj.label235:setTop(195);
    obj.label235:setWidth(50);
    obj.label235:setHeight(20);
    obj.label235:setText("$");
    obj.label235:setName("label235");
    obj.label235:setFontColor("white");

    obj.edit229 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout76);
    obj.edit229:setVertTextAlign("center");
    obj.edit229:setHorzTextAlign("center");
    obj.edit229:setLeft(120);
    obj.edit229:setTop(195);
    obj.edit229:setWidth(70);
    obj.edit229:setHeight(20);
    obj.edit229:setField("precoImoveis");
    obj.edit229:setName("edit229");
    obj.edit229:setFontSize(15);
    obj.edit229:setFontColor("white");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.scrollBox6);
    obj.layout77:setLeft(890);
    obj.layout77:setTop(0);
    obj.layout77:setWidth(315);
    obj.layout77:setHeight(480);
    obj.layout77:setName("layout77");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout77);
    obj.rectangle47:setAlign("client");
    obj.rectangle47:setColor("#0000007F");
    obj.rectangle47:setStrokeColor("black");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout77);
    obj.button6:setLeft(5);
    obj.button6:setTop(5);
    obj.button6:setHeight(20);
    obj.button6:setWidth(305);
    obj.button6:setText("Novo Item");
    obj.button6:setName("button6");

    obj.rclConsumiveis = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclConsumiveis:setParent(obj.layout77);
    obj.rclConsumiveis:setLeft(5);
    obj.rclConsumiveis:setTop(30);
    obj.rclConsumiveis:setWidth(305);
    obj.rclConsumiveis:setHeight(445);
    obj.rclConsumiveis:setName("rclConsumiveis");
    obj.rclConsumiveis:setField("itensConsumiveis");
    obj.rclConsumiveis:setTemplateForm("frmConsumiveis");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.scrollBox6);
    obj.layout78:setLeft(890);
    obj.layout78:setTop(485);
    obj.layout78:setWidth(155);
    obj.layout78:setHeight(185);
    obj.layout78:setName("layout78");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout78);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setName("rectangle48");

    obj.label236 = gui.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout78);
    obj.label236:setLeft(5);
    obj.label236:setTop(1);
    obj.label236:setWidth(200);
    obj.label236:setHeight(20);
    obj.label236:setText("DINHEIRO");
    obj.label236:setName("label236");
    obj.label236:setFontColor("white");

    obj.textEditor23 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.layout78);
    obj.textEditor23:setLeft(5);
    obj.textEditor23:setTop(25);
    obj.textEditor23:setWidth(145);
    obj.textEditor23:setHeight(80);
    obj.textEditor23:setField("dinheiro");
    obj.textEditor23:setName("textEditor23");

    obj.label237 = gui.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout78);
    obj.label237:setLeft(10);
    obj.label237:setTop(110);
    obj.label237:setWidth(50);
    obj.label237:setHeight(20);
    obj.label237:setText("TOTAL");
    obj.label237:setName("label237");
    obj.label237:setFontColor("white");

    obj.edit230 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout78);
    obj.edit230:setField("dinheiroTotal");
    obj.edit230:setLeft(65);
    obj.edit230:setTop(110);
    obj.edit230:setWidth(85);
    obj.edit230:setHeight(20);
    obj.edit230:setFontSize(11);
    obj.edit230:setName("edit230");
    obj.edit230:setFontColor("white");

    obj.label238 = gui.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout78);
    obj.label238:setLeft(10);
    obj.label238:setTop(135);
    obj.label238:setWidth(50);
    obj.label238:setHeight(20);
    obj.label238:setText("GASTOS");
    obj.label238:setName("label238");
    obj.label238:setFontColor("white");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout78);
    obj.rectangle49:setLeft(65);
    obj.rectangle49:setTop(135);
    obj.rectangle49:setWidth(85);
    obj.rectangle49:setHeight(20);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label239 = gui.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout78);
    obj.label239:setField("gastos");
    obj.label239:setText("0");
    obj.label239:setLeft(65);
    obj.label239:setTop(135);
    obj.label239:setWidth(85);
    obj.label239:setHeight(20);
    obj.label239:setHorzTextAlign("center");
    obj.label239:setFontSize(11);
    obj.label239:setName("label239");
    obj.label239:setFontColor("white");

    obj.label240 = gui.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout78);
    obj.label240:setLeft(10);
    obj.label240:setTop(160);
    obj.label240:setWidth(50);
    obj.label240:setHeight(20);
    obj.label240:setText("RESTANTE");
    obj.label240:setFontSize(10);
    obj.label240:setName("label240");
    obj.label240:setFontColor("white");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout78);
    obj.rectangle50:setLeft(65);
    obj.rectangle50:setTop(160);
    obj.rectangle50:setWidth(85);
    obj.rectangle50:setHeight(20);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label241 = gui.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.layout78);
    obj.label241:setField("dinheiroRestante");
    obj.label241:setText("0");
    obj.label241:setLeft(65);
    obj.label241:setTop(160);
    obj.label241:setWidth(85);
    obj.label241:setHeight(20);
    obj.label241:setHorzTextAlign("center");
    obj.label241:setFontSize(11);
    obj.label241:setName("label241");
    obj.label241:setFontColor("white");

    obj.dataLink61 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.scrollBox6);
    obj.dataLink61:setFields({'precoCabeca', 'precoOlhos', 'precoPescoco', 'precoOmbros', 'precoTorso', 'precoCorpo', 'precoPunhos', 'precoCintura', 'precoMaos', 'precoDedosI', 'precoDesdosII', 'precoPes', 'precoArmas', 'precoMochila', 'precoPermanencias', 'precoLivres', 'precoOutros', 'precoMunicoes', 'precoBolsos', 'precoImoveis', 'precoInventorioComp', 'dinheiroTotal'});
    obj.dataLink61:setName("dataLink61");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.scrollBox6);
    obj.layout79:setLeft(1050);
    obj.layout79:setTop(485);
    obj.layout79:setWidth(155);
    obj.layout79:setHeight(185);
    obj.layout79:setName("layout79");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout79);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setName("rectangle51");

    obj.label242 = gui.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.layout79);
    obj.label242:setLeft(5);
    obj.label242:setTop(1);
    obj.label242:setWidth(150);
    obj.label242:setHeight(20);
    obj.label242:setText("CARGA");
    obj.label242:setName("label242");
    obj.label242:setFontColor("white");

    obj.label243 = gui.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.layout79);
    obj.label243:setLeft(20);
    obj.label243:setTop(25);
    obj.label243:setWidth(50);
    obj.label243:setHeight(20);
    obj.label243:setText("LEVE");
    obj.label243:setName("label243");
    obj.label243:setFontColor("white");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout79);
    obj.rectangle52:setLeft(80);
    obj.rectangle52:setTop(25);
    obj.rectangle52:setWidth(70);
    obj.rectangle52:setHeight(20);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label244 = gui.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.layout79);
    obj.label244:setLeft(80);
    obj.label244:setTop(25);
    obj.label244:setWidth(70);
    obj.label244:setHeight(20);
    obj.label244:setField("cargaLeve");
    obj.label244:setHorzTextAlign("center");
    obj.label244:setName("label244");
    obj.label244:setFontColor("white");

    obj.label245 = gui.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.layout79);
    obj.label245:setLeft(20);
    obj.label245:setTop(47);
    obj.label245:setWidth(50);
    obj.label245:setHeight(20);
    obj.label245:setText("MÉDIA");
    obj.label245:setName("label245");
    obj.label245:setFontColor("white");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout79);
    obj.rectangle53:setLeft(80);
    obj.rectangle53:setTop(47);
    obj.rectangle53:setWidth(70);
    obj.rectangle53:setHeight(20);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label246 = gui.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.layout79);
    obj.label246:setLeft(80);
    obj.label246:setTop(47);
    obj.label246:setWidth(70);
    obj.label246:setHeight(20);
    obj.label246:setField("cargaMedia");
    obj.label246:setHorzTextAlign("center");
    obj.label246:setName("label246");
    obj.label246:setFontColor("white");

    obj.label247 = gui.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.layout79);
    obj.label247:setLeft(20);
    obj.label247:setTop(69);
    obj.label247:setWidth(50);
    obj.label247:setHeight(20);
    obj.label247:setText("PESADA");
    obj.label247:setName("label247");
    obj.label247:setFontColor("white");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout79);
    obj.rectangle54:setLeft(80);
    obj.rectangle54:setTop(69);
    obj.rectangle54:setWidth(70);
    obj.rectangle54:setHeight(20);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label248 = gui.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.layout79);
    obj.label248:setLeft(80);
    obj.label248:setTop(69);
    obj.label248:setWidth(70);
    obj.label248:setHeight(20);
    obj.label248:setField("cargaPesada");
    obj.label248:setHorzTextAlign("center");
    obj.label248:setName("label248");
    obj.label248:setFontColor("white");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout79);
    obj.rectangle55:setWidth(70);
    obj.rectangle55:setHeight(20);
    obj.rectangle55:setLeft(80);
    obj.rectangle55:setTop(91);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label249 = gui.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.layout79);
    obj.label249:setLeft(20);
    obj.label249:setTop(91);
    obj.label249:setWidth(50);
    obj.label249:setHeight(20);
    obj.label249:setText("ERGUER");
    obj.label249:setName("label249");
    obj.label249:setFontColor("white");

    obj.label250 = gui.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.layout79);
    obj.label250:setField("cargaErguer");
    obj.label250:setText("valor");
    obj.label250:setWidth(70);
    obj.label250:setHeight(20);
    obj.label250:setLeft(80);
    obj.label250:setTop(91);
    obj.label250:setHorzTextAlign("center");
    obj.label250:setName("label250");
    obj.label250:setFontColor("white");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout79);
    obj.rectangle56:setWidth(70);
    obj.rectangle56:setHeight(20);
    obj.rectangle56:setLeft(80);
    obj.rectangle56:setTop(113);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label251 = gui.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.layout79);
    obj.label251:setLeft(10);
    obj.label251:setTop(113);
    obj.label251:setWidth(70);
    obj.label251:setHeight(20);
    obj.label251:setText("EMPURRAR");
    obj.label251:setName("label251");
    obj.label251:setFontColor("white");

    obj.label252 = gui.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.layout79);
    obj.label252:setField("cargaLevantar");
    obj.label252:setText("valor");
    obj.label252:setWidth(70);
    obj.label252:setHeight(20);
    obj.label252:setLeft(80);
    obj.label252:setTop(113);
    obj.label252:setHorzTextAlign("center");
    obj.label252:setName("label252");
    obj.label252:setFontColor("white");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout79);
    obj.rectangle57:setWidth(70);
    obj.rectangle57:setHeight(20);
    obj.rectangle57:setLeft(80);
    obj.rectangle57:setTop(135);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label253 = gui.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.layout79);
    obj.label253:setLeft(10);
    obj.label253:setTop(135);
    obj.label253:setWidth(65);
    obj.label253:setHeight(20);
    obj.label253:setText("LEVANTAR");
    obj.label253:setName("label253");
    obj.label253:setFontColor("white");

    obj.label254 = gui.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.layout79);
    obj.label254:setField("cargaEmpurrar");
    obj.label254:setText("valor");
    obj.label254:setWidth(70);
    obj.label254:setHeight(20);
    obj.label254:setLeft(80);
    obj.label254:setTop(135);
    obj.label254:setHorzTextAlign("center");
    obj.label254:setName("label254");
    obj.label254:setFontColor("white");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout79);
    obj.rectangle58:setWidth(70);
    obj.rectangle58:setHeight(20);
    obj.rectangle58:setLeft(80);
    obj.rectangle58:setTop(160);
    obj.rectangle58:setColor("#404040");
    obj.rectangle58:setName("rectangle58");

    obj.label255 = gui.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.layout79);
    obj.label255:setLeft(20);
    obj.label255:setTop(160);
    obj.label255:setWidth(65);
    obj.label255:setHeight(20);
    obj.label255:setText("ATUAL");
    obj.label255:setName("label255");
    obj.label255:setFontColor("white");

    obj.label256 = gui.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.layout79);
    obj.label256:setField("cargaAtual");
    obj.label256:setWidth(70);
    obj.label256:setHeight(20);
    obj.label256:setLeft(80);
    obj.label256:setTop(160);
    obj.label256:setHorzTextAlign("center");
    obj.label256:setFontColor("white");
    obj.label256:setName("label256");

    obj.dataLink62 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.scrollBox6);
    obj.dataLink62:setField("cargaPesada");
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.scrollBox6);
    obj.dataLink63:setFields({'pesoCabeca', 'pesoOlhos', 'pesoPescoco', 'pesoOmbros', 'pesoTorso', 'pesoCorpo', 'pesoPunhos', 'pesoCintura', 'pesoMaos', 'pesoDedosI', 'pesoDesdosII', 'pesoPes', 'pesoArmas', 'pesoMochila', 'pesoPermanencias', 'pesoLivres', 'pesoOutros', 'pesoMunicoes', 'pesoBolsos', 'pesoImoveis', 'pesoInventorioComp'});
    obj.dataLink63:setName("dataLink63");

    obj.popArma = gui.fromHandle(_obj_newObject("popup"));
    obj.popArma:setParent(obj.scrollBox6);
    obj.popArma:setName("popArma");
    obj.popArma:setWidth(300);
    obj.popArma:setHeight(400);
    obj.popArma:setBackOpacity(0.4);

    obj.flowLayout41 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout41:setParent(obj.popArma);
    obj.flowLayout41:setAlign("top");
    obj.flowLayout41:setAutoHeight(true);
    obj.flowLayout41:setMaxControlsPerLine(3);
    obj.flowLayout41:setMargins({bottom=4});
    obj.flowLayout41:setHorzAlign("center");
    obj.flowLayout41:setName("flowLayout41");
    obj.flowLayout41:setVertAlign("leading");

    obj.flowPart267 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart267:setParent(obj.flowLayout41);
    obj.flowPart267:setMinWidth(90);
    obj.flowPart267:setMaxWidth(100);
    obj.flowPart267:setHeight(35);
    obj.flowPart267:setName("flowPart267");
    obj.flowPart267:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart267:setVertAlign("leading");

    obj.label257 = gui.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.flowPart267);
    obj.label257:setAlign("top");
    obj.label257:setFontSize(10);
    obj.label257:setText("NOME");
    obj.label257:setHorzTextAlign("center");
    obj.label257:setWordWrap(true);
    obj.label257:setTextTrimming("none");
    obj.label257:setAutoSize(true);
    obj.label257:setHint("Se a arma possui um nome de batismo ponha ele aqui.");
    obj.label257:setHitTest(true);
    obj.label257:setName("label257");
    obj.label257:setFontColor("#D0D0D0");

    obj.edit231 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.flowPart267);
    obj.edit231:setAlign("client");
    obj.edit231:setField("batismo");
    obj.edit231:setFontSize(12);
    obj.edit231:setName("edit231");
    obj.edit231:setFontColor("white");

    obj.flowPart268 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart268:setParent(obj.flowLayout41);
    obj.flowPart268:setMinWidth(90);
    obj.flowPart268:setMaxWidth(100);
    obj.flowPart268:setHeight(35);
    obj.flowPart268:setName("flowPart268");
    obj.flowPart268:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart268:setVertAlign("leading");

    obj.label258 = gui.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.flowPart268);
    obj.label258:setAlign("top");
    obj.label258:setFontSize(10);
    obj.label258:setText("ARMA");
    obj.label258:setHorzTextAlign("center");
    obj.label258:setWordWrap(true);
    obj.label258:setTextTrimming("none");
    obj.label258:setAutoSize(true);
    obj.label258:setHint("Qual a arma? Espada Longa? Machado de Batalha? Arco Longo?");
    obj.label258:setHitTest(true);
    obj.label258:setName("label258");
    obj.label258:setFontColor("#D0D0D0");

    obj.edit232 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.flowPart268);
    obj.edit232:setAlign("client");
    obj.edit232:setField("arma");
    obj.edit232:setFontSize(12);
    obj.edit232:setName("edit232");
    obj.edit232:setFontColor("white");

    obj.flowPart269 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart269:setParent(obj.flowLayout41);
    obj.flowPart269:setMinWidth(90);
    obj.flowPart269:setMaxWidth(100);
    obj.flowPart269:setHeight(35);
    obj.flowPart269:setName("flowPart269");
    obj.flowPart269:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart269:setVertAlign("leading");

    obj.label259 = gui.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.flowPart269);
    obj.label259:setAlign("top");
    obj.label259:setFontSize(10);
    obj.label259:setText("TAMANHO");
    obj.label259:setHorzTextAlign("center");
    obj.label259:setWordWrap(true);
    obj.label259:setTextTrimming("none");
    obj.label259:setAutoSize(true);
    obj.label259:setHint("Essa arma foi feita para um personagem de que tamanho? Médio? Pequeno? Grande?");
    obj.label259:setHitTest(true);
    obj.label259:setName("label259");
    obj.label259:setFontColor("#D0D0D0");

    obj.edit233 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.flowPart269);
    obj.edit233:setAlign("client");
    obj.edit233:setField("tamanho");
    obj.edit233:setFontSize(12);
    obj.edit233:setName("edit233");
    obj.edit233:setFontColor("white");

    obj.flowPart270 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart270:setParent(obj.flowLayout41);
    obj.flowPart270:setMinWidth(90);
    obj.flowPart270:setMaxWidth(100);
    obj.flowPart270:setHeight(35);
    obj.flowPart270:setName("flowPart270");
    obj.flowPart270:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart270:setVertAlign("leading");

    obj.label260 = gui.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.flowPart270);
    obj.label260:setAlign("top");
    obj.label260:setFontSize(10);
    obj.label260:setText("MATERIAL");
    obj.label260:setHorzTextAlign("center");
    obj.label260:setWordWrap(true);
    obj.label260:setTextTrimming("none");
    obj.label260:setAutoSize(true);
    obj.label260:setHint("Essa arma foi feita de um material especial? Adamante? Prata?");
    obj.label260:setHitTest(true);
    obj.label260:setName("label260");
    obj.label260:setFontColor("#D0D0D0");

    obj.edit234 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.flowPart270);
    obj.edit234:setAlign("client");
    obj.edit234:setField("material");
    obj.edit234:setFontSize(12);
    obj.edit234:setName("edit234");
    obj.edit234:setFontColor("white");

    obj.flowPart271 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart271:setParent(obj.flowLayout41);
    obj.flowPart271:setMinWidth(90);
    obj.flowPart271:setMaxWidth(100);
    obj.flowPart271:setHeight(35);
    obj.flowPart271:setName("flowPart271");
    obj.flowPart271:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart271:setVertAlign("leading");

    obj.label261 = gui.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.flowPart271);
    obj.label261:setAlign("top");
    obj.label261:setFontSize(10);
    obj.label261:setText("QUALIDADE");
    obj.label261:setHorzTextAlign("center");
    obj.label261:setWordWrap(true);
    obj.label261:setTextTrimming("none");
    obj.label261:setAutoSize(true);
    obj.label261:setHint("Essa arma é Obra-Prima? +1? +2?");
    obj.label261:setHitTest(true);
    obj.label261:setName("label261");
    obj.label261:setFontColor("#D0D0D0");

    obj.edit235 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.flowPart271);
    obj.edit235:setAlign("client");
    obj.edit235:setField("qualidade");
    obj.edit235:setHorzTextAlign("center");
    obj.edit235:setFontSize(12);
    obj.edit235:setName("edit235");
    obj.edit235:setFontColor("white");

    obj.flowPart272 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart272:setParent(obj.flowLayout41);
    obj.flowPart272:setMinWidth(90);
    obj.flowPart272:setMaxWidth(100);
    obj.flowPart272:setHeight(35);
    obj.flowPart272:setName("flowPart272");
    obj.flowPart272:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart272:setVertAlign("leading");

    obj.label262 = gui.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.flowPart272);
    obj.label262:setAlign("top");
    obj.label262:setFontSize(10);
    obj.label262:setText("CATEGORIA");
    obj.label262:setHorzTextAlign("center");
    obj.label262:setWordWrap(true);
    obj.label262:setTextTrimming("none");
    obj.label262:setAutoSize(true);
    obj.label262:setHint("Essa arma é Simples? Comum? Exotica?");
    obj.label262:setHitTest(true);
    obj.label262:setName("label262");
    obj.label262:setFontColor("#D0D0D0");

    obj.edit236 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.flowPart272);
    obj.edit236:setAlign("client");
    obj.edit236:setField("categoria");
    obj.edit236:setFontSize(12);
    obj.edit236:setName("edit236");
    obj.edit236:setFontColor("white");

    obj.flowPart273 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart273:setParent(obj.flowLayout41);
    obj.flowPart273:setMinWidth(90);
    obj.flowPart273:setMaxWidth(100);
    obj.flowPart273:setHeight(35);
    obj.flowPart273:setName("flowPart273");
    obj.flowPart273:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart273:setVertAlign("leading");

    obj.label263 = gui.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.flowPart273);
    obj.label263:setAlign("top");
    obj.label263:setFontSize(10);
    obj.label263:setText("DANO");
    obj.label263:setHorzTextAlign("center");
    obj.label263:setWordWrap(true);
    obj.label263:setTextTrimming("none");
    obj.label263:setAutoSize(true);
    obj.label263:setHint("Qual o dado de dano dessa arma?");
    obj.label263:setHitTest(true);
    obj.label263:setName("label263");
    obj.label263:setFontColor("#D0D0D0");

    obj.edit237 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.flowPart273);
    obj.edit237:setAlign("client");
    obj.edit237:setField("dano");
    obj.edit237:setHorzTextAlign("center");
    obj.edit237:setFontSize(12);
    obj.edit237:setName("edit237");
    obj.edit237:setFontColor("white");

    obj.flowPart274 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart274:setParent(obj.flowLayout41);
    obj.flowPart274:setMinWidth(90);
    obj.flowPart274:setMaxWidth(100);
    obj.flowPart274:setHeight(35);
    obj.flowPart274:setName("flowPart274");
    obj.flowPart274:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart274:setVertAlign("leading");

    obj.label264 = gui.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.flowPart274);
    obj.label264:setAlign("top");
    obj.label264:setFontSize(10);
    obj.label264:setText("DECISIVO");
    obj.label264:setHorzTextAlign("center");
    obj.label264:setWordWrap(true);
    obj.label264:setTextTrimming("none");
    obj.label264:setAutoSize(true);
    obj.label264:setHint("Quando a margem de ameaça dessa arma?20? 19-20?");
    obj.label264:setHitTest(true);
    obj.label264:setName("label264");
    obj.label264:setFontColor("#D0D0D0");

    obj.edit238 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.flowPart274);
    obj.edit238:setAlign("client");
    obj.edit238:setField("decisivo");
    obj.edit238:setHorzTextAlign("center");
    obj.edit238:setFontSize(12);
    obj.edit238:setName("edit238");
    obj.edit238:setFontColor("white");

    obj.flowPart275 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart275:setParent(obj.flowLayout41);
    obj.flowPart275:setMinWidth(90);
    obj.flowPart275:setMaxWidth(100);
    obj.flowPart275:setHeight(35);
    obj.flowPart275:setName("flowPart275");
    obj.flowPart275:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart275:setVertAlign("leading");

    obj.label265 = gui.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.flowPart275);
    obj.label265:setAlign("top");
    obj.label265:setFontSize(10);
    obj.label265:setText("MULTIPLICADOR");
    obj.label265:setHorzTextAlign("center");
    obj.label265:setWordWrap(true);
    obj.label265:setTextTrimming("none");
    obj.label265:setAutoSize(true);
    obj.label265:setHint("Em um decisivo por quanto é multiplicado o dano dessa arma?");
    obj.label265:setHitTest(true);
    obj.label265:setName("label265");
    obj.label265:setFontColor("#D0D0D0");

    obj.edit239 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.flowPart275);
    obj.edit239:setAlign("client");
    obj.edit239:setField("multiplicador");
    obj.edit239:setHorzTextAlign("center");
    obj.edit239:setFontSize(12);
    obj.edit239:setName("edit239");
    obj.edit239:setFontColor("white");

    obj.flowPart276 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart276:setParent(obj.flowLayout41);
    obj.flowPart276:setMinWidth(90);
    obj.flowPart276:setMaxWidth(100);
    obj.flowPart276:setHeight(35);
    obj.flowPart276:setName("flowPart276");
    obj.flowPart276:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart276:setVertAlign("leading");

    obj.label266 = gui.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.flowPart276);
    obj.label266:setAlign("top");
    obj.label266:setFontSize(10);
    obj.label266:setText("ALCANCE");
    obj.label266:setHorzTextAlign("center");
    obj.label266:setWordWrap(true);
    obj.label266:setTextTrimming("none");
    obj.label266:setAutoSize(true);
    obj.label266:setHint("Qual o alcance em metros da arma? Normalmente usado apenas em armas de ataque a distancia. ");
    obj.label266:setHitTest(true);
    obj.label266:setName("label266");
    obj.label266:setFontColor("#D0D0D0");

    obj.edit240 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.flowPart276);
    obj.edit240:setAlign("client");
    obj.edit240:setField("alcance");
    obj.edit240:setFontSize(12);
    obj.edit240:setName("edit240");
    obj.edit240:setFontColor("white");

    obj.flowPart277 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart277:setParent(obj.flowLayout41);
    obj.flowPart277:setMinWidth(90);
    obj.flowPart277:setMaxWidth(100);
    obj.flowPart277:setHeight(35);
    obj.flowPart277:setName("flowPart277");
    obj.flowPart277:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart277:setVertAlign("leading");

    obj.label267 = gui.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.flowPart277);
    obj.label267:setAlign("top");
    obj.label267:setFontSize(10);
    obj.label267:setText("ESPECIAL");
    obj.label267:setHorzTextAlign("center");
    obj.label267:setWordWrap(true);
    obj.label267:setTextTrimming("none");
    obj.label267:setAutoSize(true);
    obj.label267:setHint("Essa arma tem efeitos especiais? Pode ser usada em derrubar? desarmar? Pode ser preparada contra investida?");
    obj.label267:setHitTest(true);
    obj.label267:setName("label267");
    obj.label267:setFontColor("#D0D0D0");

    obj.edit241 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.flowPart277);
    obj.edit241:setAlign("client");
    obj.edit241:setField("especial");
    obj.edit241:setFontSize(12);
    obj.edit241:setName("edit241");
    obj.edit241:setFontColor("white");

    obj.flowPart278 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart278:setParent(obj.flowLayout41);
    obj.flowPart278:setMinWidth(90);
    obj.flowPart278:setMaxWidth(100);
    obj.flowPart278:setHeight(35);
    obj.flowPart278:setName("flowPart278");
    obj.flowPart278:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart278:setVertAlign("leading");

    obj.label268 = gui.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.flowPart278);
    obj.label268:setAlign("top");
    obj.label268:setFontSize(10);
    obj.label268:setText("TIPO");
    obj.label268:setHorzTextAlign("center");
    obj.label268:setWordWrap(true);
    obj.label268:setTextTrimming("none");
    obj.label268:setAutoSize(true);
    obj.label268:setHint("Qual o tipo de dano que essa arma causa? Concusivo? Cortante?");
    obj.label268:setHitTest(true);
    obj.label268:setName("label268");
    obj.label268:setFontColor("#D0D0D0");

    obj.edit242 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.flowPart278);
    obj.edit242:setAlign("client");
    obj.edit242:setField("tipo");
    obj.edit242:setFontSize(12);
    obj.edit242:setName("edit242");
    obj.edit242:setFontColor("white");

    obj.flowPart279 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart279:setParent(obj.flowLayout41);
    obj.flowPart279:setMinWidth(290);
    obj.flowPart279:setMaxWidth(300);
    obj.flowPart279:setHeight(35);
    obj.flowPart279:setName("flowPart279");
    obj.flowPart279:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart279:setVertAlign("leading");

    obj.label269 = gui.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.flowPart279);
    obj.label269:setAlign("top");
    obj.label269:setFontSize(10);
    obj.label269:setText("EFEITOS");
    obj.label269:setHorzTextAlign("center");
    obj.label269:setWordWrap(true);
    obj.label269:setTextTrimming("none");
    obj.label269:setAutoSize(true);
    obj.label269:setHint("Essa arma tem efeitos mágicos? Flamejante? Vorpal?");
    obj.label269:setHitTest(true);
    obj.label269:setName("label269");
    obj.label269:setFontColor("#D0D0D0");

    obj.edit243 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.flowPart279);
    obj.edit243:setAlign("client");
    obj.edit243:setField("efeitos");
    obj.edit243:setFontSize(12);
    obj.edit243:setName("edit243");
    obj.edit243:setFontColor("white");

    obj.flowPart280 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart280:setParent(obj.flowLayout41);
    obj.flowPart280:setMinWidth(90);
    obj.flowPart280:setMaxWidth(100);
    obj.flowPart280:setHeight(35);
    obj.flowPart280:setName("flowPart280");
    obj.flowPart280:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart280:setVertAlign("leading");

    obj.label270 = gui.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.flowPart280);
    obj.label270:setAlign("top");
    obj.label270:setFontSize(10);
    obj.label270:setText("CA");
    obj.label270:setHorzTextAlign("center");
    obj.label270:setWordWrap(true);
    obj.label270:setTextTrimming("none");
    obj.label270:setAutoSize(true);
    obj.label270:setHint("Para escudos: qual o bonus que ele fornece na CA?");
    obj.label270:setHitTest(true);
    obj.label270:setName("label270");
    obj.label270:setFontColor("#D0D0D0");

    obj.edit244 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.flowPart280);
    obj.edit244:setAlign("client");
    obj.edit244:setField("ca");
    obj.edit244:setHorzTextAlign("center");
    obj.edit244:setFontSize(12);
    obj.edit244:setName("edit244");
    obj.edit244:setFontColor("white");

    obj.flowPart281 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart281:setParent(obj.flowLayout41);
    obj.flowPart281:setMinWidth(90);
    obj.flowPart281:setMaxWidth(100);
    obj.flowPart281:setHeight(35);
    obj.flowPart281:setName("flowPart281");
    obj.flowPart281:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart281:setVertAlign("leading");

    obj.label271 = gui.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.flowPart281);
    obj.label271:setAlign("top");
    obj.label271:setFontSize(10);
    obj.label271:setText("PEN");
    obj.label271:setHorzTextAlign("center");
    obj.label271:setWordWrap(true);
    obj.label271:setTextTrimming("none");
    obj.label271:setAutoSize(true);
    obj.label271:setHint("Para escudos: qual a penalidade do escudo?");
    obj.label271:setHitTest(true);
    obj.label271:setName("label271");
    obj.label271:setFontColor("#D0D0D0");

    obj.edit245 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.flowPart281);
    obj.edit245:setAlign("client");
    obj.edit245:setField("penalidade");
    obj.edit245:setHorzTextAlign("center");
    obj.edit245:setFontSize(12);
    obj.edit245:setName("edit245");
    obj.edit245:setFontColor("white");

    obj.flowPart282 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart282:setParent(obj.flowLayout41);
    obj.flowPart282:setMinWidth(90);
    obj.flowPart282:setMaxWidth(100);
    obj.flowPart282:setHeight(35);
    obj.flowPart282:setName("flowPart282");
    obj.flowPart282:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart282:setVertAlign("leading");

    obj.label272 = gui.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.flowPart282);
    obj.label272:setAlign("top");
    obj.label272:setFontSize(10);
    obj.label272:setText("FALHA");
    obj.label272:setHorzTextAlign("center");
    obj.label272:setWordWrap(true);
    obj.label272:setTextTrimming("none");
    obj.label272:setAutoSize(true);
    obj.label272:setHint("Para escudos: qual a falha arcana?");
    obj.label272:setHitTest(true);
    obj.label272:setName("label272");
    obj.label272:setFontColor("#D0D0D0");

    obj.edit246 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.flowPart282);
    obj.edit246:setAlign("client");
    obj.edit246:setField("falha");
    obj.edit246:setHorzTextAlign("center");
    obj.edit246:setFontSize(12);
    obj.edit246:setName("edit246");
    obj.edit246:setFontColor("white");

    obj.textEditor24 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.popArma);
    obj.textEditor24:setAlign("client");
    obj.textEditor24:setField("descricao");
    obj.textEditor24:setName("textEditor24");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Descrição");
    obj.tab6:setName("tab6");

    obj.frmFichaRPGmeister9_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister9_svg:setParent(obj.tab6);
    obj.frmFichaRPGmeister9_svg:setName("frmFichaRPGmeister9_svg");
    obj.frmFichaRPGmeister9_svg:setAlign("client");
    obj.frmFichaRPGmeister9_svg:setTheme("dark");
    obj.frmFichaRPGmeister9_svg:setMargins({top=1});

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmFichaRPGmeister9_svg);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.scrollBox7);
    obj.rectangle59:setLeft(0);
    obj.rectangle59:setTop(0);
    obj.rectangle59:setWidth(1205);
    obj.rectangle59:setHeight(105);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setName("rectangle59");

    obj.label273 = gui.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.rectangle59);
    obj.label273:setLeft(3);
    obj.label273:setTop(1);
    obj.label273:setWidth(100);
    obj.label273:setHeight(20);
    obj.label273:setText("DESCRIÇÃO");
    obj.label273:setName("label273");
    obj.label273:setFontColor("white");

    obj.label274 = gui.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.rectangle59);
    obj.label274:setLeft(10);
    obj.label274:setTop(25);
    obj.label274:setWidth(90);
    obj.label274:setHeight(20);
    obj.label274:setText("TAMANHO");
    obj.label274:setHorzTextAlign("center");
    obj.label274:setName("label274");
    obj.label274:setFontColor("white");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle59);
    obj.comboBox7:setLeft(100);
    obj.comboBox7:setTop(25);
    obj.comboBox7:setWidth(100);
    obj.comboBox7:setField("tamanho");
    obj.comboBox7:setFontColor("white");
    obj.comboBox7:setItems({'Minúsculo', 'Diminuto', 'Miúdo', 'Pequeno', 'Médio', 'Grande', 'Enorme', 'Imenso', 'Colossal'});
    obj.comboBox7:setValues({'-4','-3','-2','-1','0','1','2','3','4'});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setName("comboBox7");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.rectangle59);
    obj.checkBox28:setLeft(200);
    obj.checkBox28:setTop(25);
    obj.checkBox28:setWidth(100);
    obj.checkBox28:setField("quadrupede");
    obj.checkBox28:setText("Quadrúpede");
    obj.checkBox28:setName("checkBox28");

    obj.label275 = gui.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.rectangle59);
    obj.label275:setLeft(10);
    obj.label275:setTop(50);
    obj.label275:setWidth(90);
    obj.label275:setHeight(20);
    obj.label275:setText("ALTURA");
    obj.label275:setHorzTextAlign("center");
    obj.label275:setName("label275");
    obj.label275:setFontColor("white");

    obj.edit247 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.rectangle59);
    obj.edit247:setLeft(100);
    obj.edit247:setTop(50);
    obj.edit247:setWidth(200);
    obj.edit247:setHeight(25);
    obj.edit247:setField("altura");
    obj.edit247:setVertTextAlign("center");
    obj.edit247:setName("edit247");
    obj.edit247:setFontSize(15);
    obj.edit247:setFontColor("white");

    obj.label276 = gui.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.rectangle59);
    obj.label276:setLeft(10);
    obj.label276:setTop(75);
    obj.label276:setWidth(90);
    obj.label276:setHeight(20);
    obj.label276:setText("PESO");
    obj.label276:setHorzTextAlign("center");
    obj.label276:setName("label276");
    obj.label276:setFontColor("white");

    obj.edit248 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.rectangle59);
    obj.edit248:setLeft(100);
    obj.edit248:setTop(75);
    obj.edit248:setWidth(200);
    obj.edit248:setHeight(25);
    obj.edit248:setField("peso");
    obj.edit248:setVertTextAlign("center");
    obj.edit248:setName("edit248");
    obj.edit248:setFontSize(15);
    obj.edit248:setFontColor("white");

    obj.label277 = gui.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.rectangle59);
    obj.label277:setLeft(310);
    obj.label277:setTop(25);
    obj.label277:setWidth(90);
    obj.label277:setHeight(20);
    obj.label277:setText("IDADE");
    obj.label277:setHorzTextAlign("center");
    obj.label277:setName("label277");
    obj.label277:setFontColor("white");

    obj.edit249 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.rectangle59);
    obj.edit249:setLeft(400);
    obj.edit249:setTop(25);
    obj.edit249:setWidth(200);
    obj.edit249:setHeight(25);
    obj.edit249:setField("idade");
    obj.edit249:setVertTextAlign("center");
    obj.edit249:setName("edit249");
    obj.edit249:setFontSize(15);
    obj.edit249:setFontColor("white");

    obj.label278 = gui.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.rectangle59);
    obj.label278:setLeft(310);
    obj.label278:setTop(50);
    obj.label278:setWidth(90);
    obj.label278:setHeight(20);
    obj.label278:setText("SEXO");
    obj.label278:setHorzTextAlign("center");
    obj.label278:setName("label278");
    obj.label278:setFontColor("white");

    obj.edit250 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.rectangle59);
    obj.edit250:setLeft(400);
    obj.edit250:setTop(50);
    obj.edit250:setWidth(200);
    obj.edit250:setHeight(25);
    obj.edit250:setField("sexo");
    obj.edit250:setVertTextAlign("center");
    obj.edit250:setName("edit250");
    obj.edit250:setFontSize(15);
    obj.edit250:setFontColor("white");

    obj.label279 = gui.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.rectangle59);
    obj.label279:setLeft(310);
    obj.label279:setTop(75);
    obj.label279:setWidth(90);
    obj.label279:setHeight(20);
    obj.label279:setText("OUTROS");
    obj.label279:setHorzTextAlign("center");
    obj.label279:setName("label279");
    obj.label279:setFontColor("white");

    obj.edit251 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.rectangle59);
    obj.edit251:setLeft(400);
    obj.edit251:setTop(75);
    obj.edit251:setWidth(200);
    obj.edit251:setHeight(25);
    obj.edit251:setField("aparenciaOutros");
    obj.edit251:setVertTextAlign("center");
    obj.edit251:setName("edit251");
    obj.edit251:setFontSize(15);
    obj.edit251:setFontColor("white");

    obj.label280 = gui.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.rectangle59);
    obj.label280:setLeft(610);
    obj.label280:setTop(25);
    obj.label280:setWidth(90);
    obj.label280:setHeight(20);
    obj.label280:setText("OLHOS");
    obj.label280:setHorzTextAlign("center");
    obj.label280:setName("label280");
    obj.label280:setFontColor("white");

    obj.edit252 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.rectangle59);
    obj.edit252:setLeft(700);
    obj.edit252:setTop(25);
    obj.edit252:setWidth(200);
    obj.edit252:setHeight(25);
    obj.edit252:setField("aparenciaOlhos");
    obj.edit252:setVertTextAlign("center");
    obj.edit252:setName("edit252");
    obj.edit252:setFontSize(15);
    obj.edit252:setFontColor("white");

    obj.label281 = gui.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.rectangle59);
    obj.label281:setLeft(610);
    obj.label281:setTop(50);
    obj.label281:setWidth(90);
    obj.label281:setHeight(20);
    obj.label281:setText("PELE");
    obj.label281:setHorzTextAlign("center");
    obj.label281:setName("label281");
    obj.label281:setFontColor("white");

    obj.edit253 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.rectangle59);
    obj.edit253:setLeft(700);
    obj.edit253:setTop(50);
    obj.edit253:setWidth(200);
    obj.edit253:setHeight(25);
    obj.edit253:setField("pele");
    obj.edit253:setVertTextAlign("center");
    obj.edit253:setName("edit253");
    obj.edit253:setFontSize(15);
    obj.edit253:setFontColor("white");

    obj.label282 = gui.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.rectangle59);
    obj.label282:setLeft(610);
    obj.label282:setTop(75);
    obj.label282:setWidth(90);
    obj.label282:setHeight(20);
    obj.label282:setText("CABELO");
    obj.label282:setHorzTextAlign("center");
    obj.label282:setName("label282");
    obj.label282:setFontColor("white");

    obj.edit254 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.rectangle59);
    obj.edit254:setLeft(700);
    obj.edit254:setTop(75);
    obj.edit254:setWidth(200);
    obj.edit254:setHeight(25);
    obj.edit254:setField("cabelo");
    obj.edit254:setVertTextAlign("center");
    obj.edit254:setName("edit254");
    obj.edit254:setFontSize(15);
    obj.edit254:setFontColor("white");

    obj.label283 = gui.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.rectangle59);
    obj.label283:setLeft(910);
    obj.label283:setTop(25);
    obj.label283:setWidth(90);
    obj.label283:setHeight(20);
    obj.label283:setText("PLANO");
    obj.label283:setHorzTextAlign("center");
    obj.label283:setName("label283");
    obj.label283:setFontColor("white");

    obj.edit255 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.rectangle59);
    obj.edit255:setLeft(1000);
    obj.edit255:setTop(25);
    obj.edit255:setWidth(200);
    obj.edit255:setHeight(25);
    obj.edit255:setField("plano");
    obj.edit255:setVertTextAlign("center");
    obj.edit255:setName("edit255");
    obj.edit255:setFontSize(15);
    obj.edit255:setFontColor("white");

    obj.label284 = gui.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.rectangle59);
    obj.label284:setLeft(910);
    obj.label284:setTop(50);
    obj.label284:setWidth(90);
    obj.label284:setHeight(20);
    obj.label284:setText("REGIÃO");
    obj.label284:setHorzTextAlign("center");
    obj.label284:setName("label284");
    obj.label284:setFontColor("white");

    obj.edit256 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.rectangle59);
    obj.edit256:setLeft(1000);
    obj.edit256:setTop(50);
    obj.edit256:setWidth(200);
    obj.edit256:setHeight(25);
    obj.edit256:setField("regiao");
    obj.edit256:setVertTextAlign("center");
    obj.edit256:setName("edit256");
    obj.edit256:setFontSize(15);
    obj.edit256:setFontColor("white");

    obj.label285 = gui.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.rectangle59);
    obj.label285:setLeft(910);
    obj.label285:setTop(75);
    obj.label285:setWidth(90);
    obj.label285:setHeight(20);
    obj.label285:setText("REINO");
    obj.label285:setHorzTextAlign("center");
    obj.label285:setName("label285");
    obj.label285:setFontColor("white");

    obj.edit257 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.rectangle59);
    obj.edit257:setLeft(1000);
    obj.edit257:setTop(75);
    obj.edit257:setWidth(200);
    obj.edit257:setHeight(25);
    obj.edit257:setField("reino");
    obj.edit257:setVertTextAlign("center");
    obj.edit257:setName("edit257");
    obj.edit257:setFontSize(15);
    obj.edit257:setFontColor("white");

    obj.dataLink64 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.scrollBox7);
    obj.dataLink64:setFields({'tamanho', 'quadrupede', 'efetFor'});
    obj.dataLink64:setName("dataLink64");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.scrollBox7);
    obj.layout80:setLeft(0);
    obj.layout80:setTop(110);
    obj.layout80:setWidth(375);
    obj.layout80:setHeight(240);
    obj.layout80:setName("layout80");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout80);
    obj.rectangle60:setAlign("client");
    obj.rectangle60:setColor("black");
    obj.rectangle60:setName("rectangle60");

    obj.label286 = gui.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.layout80);
    obj.label286:setLeft(5);
    obj.label286:setTop(1);
    obj.label286:setWidth(100);
    obj.label286:setHeight(20);
    obj.label286:setText("APARÊNCIA");
    obj.label286:setName("label286");
    obj.label286:setFontColor("white");

    obj.textEditor25 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.layout80);
    obj.textEditor25:setLeft(5);
    obj.textEditor25:setTop(25);
    obj.textEditor25:setWidth(365);
    obj.textEditor25:setHeight(210);
    obj.textEditor25:setField("aparencia");
    obj.textEditor25:setName("textEditor25");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.scrollBox7);
    obj.layout81:setLeft(0);
    obj.layout81:setTop(355);
    obj.layout81:setWidth(375);
    obj.layout81:setHeight(250);
    obj.layout81:setName("layout81");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout81);
    obj.rectangle61:setAlign("client");
    obj.rectangle61:setColor("black");
    obj.rectangle61:setName("rectangle61");

    obj.label287 = gui.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.layout81);
    obj.label287:setLeft(5);
    obj.label287:setTop(1);
    obj.label287:setWidth(100);
    obj.label287:setHeight(20);
    obj.label287:setText("PERSONALIDADE");
    obj.label287:setName("label287");
    obj.label287:setFontColor("white");

    obj.textEditor26 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor26:setParent(obj.layout81);
    obj.textEditor26:setLeft(5);
    obj.textEditor26:setTop(25);
    obj.textEditor26:setWidth(365);
    obj.textEditor26:setHeight(220);
    obj.textEditor26:setField("personalidade");
    obj.textEditor26:setName("textEditor26");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox7);
    obj.layout82:setLeft(380);
    obj.layout82:setTop(110);
    obj.layout82:setWidth(825);
    obj.layout82:setHeight(495);
    obj.layout82:setName("layout82");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout82);
    obj.rectangle62:setAlign("client");
    obj.rectangle62:setColor("black");
    obj.rectangle62:setName("rectangle62");

    obj.label288 = gui.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.layout82);
    obj.label288:setLeft(5);
    obj.label288:setTop(1);
    obj.label288:setWidth(100);
    obj.label288:setHeight(20);
    obj.label288:setText("HISTORIA");
    obj.label288:setName("label288");
    obj.label288:setFontColor("white");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout82);
    obj.button7:setLeft(720);
    obj.button7:setTop(1);
    obj.button7:setWidth(100);
    obj.button7:setHeight(20);
    obj.button7:setText("Copiar Antigo");
    obj.button7:setName("button7");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout82);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Anotações");
    obj.tab7:setName("tab7");

    obj.frmFichaRPGmeister10_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab7);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");
    obj.frmFichaRPGmeister10_svg:setTheme("dark");

    obj.scrollBox8 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmFichaRPGmeister10_svg);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.scrollBox8);
    obj.layout83:setLeft(0);
    obj.layout83:setTop(0);
    obj.layout83:setWidth(400);
    obj.layout83:setHeight(605);
    obj.layout83:setName("layout83");

    obj.rectangle63 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout83);
    obj.rectangle63:setAlign("client");
    obj.rectangle63:setColor("black");
    obj.rectangle63:setName("rectangle63");

    obj.label289 = gui.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.layout83);
    obj.label289:setLeft(0);
    obj.label289:setTop(0);
    obj.label289:setWidth(400);
    obj.label289:setHeight(20);
    obj.label289:setText("ANOTAÇÕES");
    obj.label289:setHorzTextAlign("center");
    obj.label289:setName("label289");
    obj.label289:setFontColor("white");

    obj.textEditor27 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor27:setParent(obj.layout83);
    obj.textEditor27:setLeft(10);
    obj.textEditor27:setTop(25);
    obj.textEditor27:setWidth(380);
    obj.textEditor27:setHeight(575);
    obj.textEditor27:setField("anotacoes1");
    obj.textEditor27:setName("textEditor27");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.scrollBox8);
    obj.layout84:setLeft(405);
    obj.layout84:setTop(0);
    obj.layout84:setWidth(400);
    obj.layout84:setHeight(605);
    obj.layout84:setName("layout84");

    obj.rectangle64 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout84);
    obj.rectangle64:setAlign("client");
    obj.rectangle64:setColor("black");
    obj.rectangle64:setName("rectangle64");

    obj.label290 = gui.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.layout84);
    obj.label290:setLeft(0);
    obj.label290:setTop(0);
    obj.label290:setWidth(400);
    obj.label290:setHeight(20);
    obj.label290:setText("ANOTAÇÕES");
    obj.label290:setHorzTextAlign("center");
    obj.label290:setName("label290");
    obj.label290:setFontColor("white");

    obj.textEditor28 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor28:setParent(obj.layout84);
    obj.textEditor28:setLeft(10);
    obj.textEditor28:setTop(25);
    obj.textEditor28:setWidth(380);
    obj.textEditor28:setHeight(575);
    obj.textEditor28:setField("anotacoes2");
    obj.textEditor28:setName("textEditor28");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.scrollBox8);
    obj.layout85:setLeft(810);
    obj.layout85:setTop(0);
    obj.layout85:setWidth(400);
    obj.layout85:setHeight(605);
    obj.layout85:setName("layout85");

    obj.rectangle65 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout85);
    obj.rectangle65:setAlign("client");
    obj.rectangle65:setColor("black");
    obj.rectangle65:setName("rectangle65");

    obj.label291 = gui.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.layout85);
    obj.label291:setLeft(0);
    obj.label291:setTop(0);
    obj.label291:setWidth(400);
    obj.label291:setHeight(20);
    obj.label291:setText("ANOTAÇÕES");
    obj.label291:setHorzTextAlign("center");
    obj.label291:setName("label291");
    obj.label291:setFontColor("white");

    obj.textEditor29 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor29:setParent(obj.layout85);
    obj.textEditor29:setLeft(10);
    obj.textEditor29:setTop(25);
    obj.textEditor29:setWidth(380);
    obj.textEditor29:setHeight(575);
    obj.textEditor29:setField("anotacoes3");
    obj.textEditor29:setName("textEditor29");

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Companheiro");
    obj.tab8:setName("tab8");

    obj.frmFichaRPGmeister8_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister8_svg:setParent(obj.tab8);
    obj.frmFichaRPGmeister8_svg:setName("frmFichaRPGmeister8_svg");
    obj.frmFichaRPGmeister8_svg:setAlign("client");
    obj.frmFichaRPGmeister8_svg:setTheme("dark");
    obj.frmFichaRPGmeister8_svg:setMargins({top=1});

    obj.scrollBox9 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmFichaRPGmeister8_svg);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.boxDetalhesDoCompanheiro = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoCompanheiro:setParent(obj.scrollBox9);
    obj.boxDetalhesDoCompanheiro:setName("boxDetalhesDoCompanheiro");
    obj.boxDetalhesDoCompanheiro:setVisible(false);
    obj.boxDetalhesDoCompanheiro:setLeft(0);
    obj.boxDetalhesDoCompanheiro:setTop(0);
    obj.boxDetalhesDoCompanheiro:setWidth(1335);
    obj.boxDetalhesDoCompanheiro:setHeight(620);

    obj.rectangle66 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle66:setLeft(0);
    obj.rectangle66:setTop(0);
    obj.rectangle66:setWidth(200);
    obj.rectangle66:setHeight(135);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setName("rectangle66");

    obj.label292 = gui.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.rectangle66);
    obj.label292:setLeft(5);
    obj.label292:setTop(10);
    obj.label292:setWidth(70);
    obj.label292:setHeight(20);
    obj.label292:setText("Nome");
    obj.label292:setName("label292");
    obj.label292:setFontColor("white");

    obj.edit258 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.rectangle66);
    obj.edit258:setLeft(70);
    obj.edit258:setTop(5);
    obj.edit258:setWidth(125);
    obj.edit258:setHeight(25);
    obj.edit258:setField("nomeComp");
    obj.edit258:setName("edit258");
    obj.edit258:setFontSize(15);
    obj.edit258:setFontColor("white");

    obj.label293 = gui.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.rectangle66);
    obj.label293:setLeft(5);
    obj.label293:setTop(35);
    obj.label293:setWidth(70);
    obj.label293:setHeight(20);
    obj.label293:setText("Raça");
    obj.label293:setName("label293");
    obj.label293:setFontColor("white");

    obj.edit259 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.rectangle66);
    obj.edit259:setLeft(70);
    obj.edit259:setTop(30);
    obj.edit259:setWidth(125);
    obj.edit259:setHeight(25);
    obj.edit259:setField("racaComp");
    obj.edit259:setName("edit259");
    obj.edit259:setFontSize(15);
    obj.edit259:setFontColor("white");

    obj.label294 = gui.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.rectangle66);
    obj.label294:setLeft(5);
    obj.label294:setTop(60);
    obj.label294:setWidth(70);
    obj.label294:setHeight(20);
    obj.label294:setText("Tipo");
    obj.label294:setName("label294");
    obj.label294:setFontColor("white");

    obj.edit260 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.rectangle66);
    obj.edit260:setLeft(70);
    obj.edit260:setTop(55);
    obj.edit260:setWidth(125);
    obj.edit260:setHeight(25);
    obj.edit260:setField("tipoComp");
    obj.edit260:setName("edit260");
    obj.edit260:setFontSize(15);
    obj.edit260:setFontColor("white");

    obj.label295 = gui.fromHandle(_obj_newObject("label"));
    obj.label295:setParent(obj.rectangle66);
    obj.label295:setLeft(5);
    obj.label295:setTop(85);
    obj.label295:setWidth(70);
    obj.label295:setHeight(20);
    obj.label295:setText("Subtipos");
    obj.label295:setName("label295");
    obj.label295:setFontColor("white");

    obj.edit261 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.rectangle66);
    obj.edit261:setLeft(70);
    obj.edit261:setTop(80);
    obj.edit261:setWidth(125);
    obj.edit261:setHeight(25);
    obj.edit261:setField("subtiposComp");
    obj.edit261:setName("edit261");
    obj.edit261:setFontSize(15);
    obj.edit261:setFontColor("white");

    obj.label296 = gui.fromHandle(_obj_newObject("label"));
    obj.label296:setParent(obj.rectangle66);
    obj.label296:setLeft(5);
    obj.label296:setTop(110);
    obj.label296:setWidth(70);
    obj.label296:setHeight(20);
    obj.label296:setText("Tamanho");
    obj.label296:setName("label296");
    obj.label296:setFontColor("white");

    obj.edit262 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.rectangle66);
    obj.edit262:setLeft(70);
    obj.edit262:setTop(105);
    obj.edit262:setWidth(125);
    obj.edit262:setHeight(25);
    obj.edit262:setField("tamanhoComp");
    obj.edit262:setName("edit262");
    obj.edit262:setFontSize(15);
    obj.edit262:setFontColor("white");

    obj.rectangle67 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle67:setLeft(0);
    obj.rectangle67:setTop(138);
    obj.rectangle67:setWidth(200);
    obj.rectangle67:setHeight(110);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setName("rectangle67");

    obj.label297 = gui.fromHandle(_obj_newObject("label"));
    obj.label297:setParent(obj.rectangle67);
    obj.label297:setLeft(5);
    obj.label297:setTop(10);
    obj.label297:setWidth(40);
    obj.label297:setHeight(20);
    obj.label297:setText("DVs");
    obj.label297:setName("label297");
    obj.label297:setFontColor("white");

    obj.edit263 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.rectangle67);
    obj.edit263:setLeft(35);
    obj.edit263:setTop(5);
    obj.edit263:setWidth(70);
    obj.edit263:setHeight(25);
    obj.edit263:setField("dvsComp");
    obj.edit263:setName("edit263");
    obj.edit263:setFontSize(15);
    obj.edit263:setFontColor("white");

    obj.label298 = gui.fromHandle(_obj_newObject("label"));
    obj.label298:setParent(obj.rectangle67);
    obj.label298:setLeft(110);
    obj.label298:setTop(8);
    obj.label298:setWidth(40);
    obj.label298:setHeight(20);
    obj.label298:setText("PVs");
    obj.label298:setName("label298");
    obj.label298:setFontColor("white");

    obj.edit264 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.rectangle67);
    obj.edit264:setLeft(140);
    obj.edit264:setTop(5);
    obj.edit264:setWidth(55);
    obj.edit264:setHeight(25);
    obj.edit264:setField("pvsComp");
    obj.edit264:setName("edit264");
    obj.edit264:setFontSize(15);
    obj.edit264:setFontColor("white");

    obj.label299 = gui.fromHandle(_obj_newObject("label"));
    obj.label299:setParent(obj.rectangle67);
    obj.label299:setLeft(5);
    obj.label299:setTop(35);
    obj.label299:setWidth(60);
    obj.label299:setHeight(20);
    obj.label299:setText("CA");
    obj.label299:setName("label299");
    obj.label299:setFontColor("white");

    obj.edit265 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.rectangle67);
    obj.edit265:setLeft(70);
    obj.edit265:setTop(30);
    obj.edit265:setWidth(35);
    obj.edit265:setHeight(25);
    obj.edit265:setField("caComp");
    obj.edit265:setName("edit265");
    obj.edit265:setFontSize(15);
    obj.edit265:setFontColor("white");

    obj.label300 = gui.fromHandle(_obj_newObject("label"));
    obj.label300:setParent(obj.rectangle67);
    obj.label300:setLeft(5);
    obj.label300:setTop(60);
    obj.label300:setWidth(60);
    obj.label300:setHeight(20);
    obj.label300:setText("Toque");
    obj.label300:setName("label300");
    obj.label300:setFontColor("white");

    obj.edit266 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.rectangle67);
    obj.edit266:setLeft(70);
    obj.edit266:setTop(55);
    obj.edit266:setWidth(35);
    obj.edit266:setHeight(25);
    obj.edit266:setField("toqueComp");
    obj.edit266:setName("edit266");
    obj.edit266:setFontSize(15);
    obj.edit266:setFontColor("white");

    obj.label301 = gui.fromHandle(_obj_newObject("label"));
    obj.label301:setParent(obj.rectangle67);
    obj.label301:setLeft(5);
    obj.label301:setTop(85);
    obj.label301:setWidth(60);
    obj.label301:setHeight(20);
    obj.label301:setText("Surpresa");
    obj.label301:setName("label301");
    obj.label301:setFontColor("white");

    obj.edit267 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.rectangle67);
    obj.edit267:setLeft(70);
    obj.edit267:setTop(80);
    obj.edit267:setWidth(35);
    obj.edit267:setHeight(25);
    obj.edit267:setField("surpresaComp");
    obj.edit267:setName("edit267");
    obj.edit267:setFontSize(15);
    obj.edit267:setFontColor("white");

    obj.textEditor30 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor30:setParent(obj.rectangle67);
    obj.textEditor30:setLeft(105);
    obj.textEditor30:setTop(30);
    obj.textEditor30:setWidth(90);
    obj.textEditor30:setHeight(75);
    obj.textEditor30:setField("caCompDesc");
    obj.textEditor30:setName("textEditor30");

    obj.rectangle68 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle68:setLeft(0);
    obj.rectangle68:setTop(251);
    obj.rectangle68:setWidth(200);
    obj.rectangle68:setHeight(110);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setName("rectangle68");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle68);
    obj.button8:setLeft(5);
    obj.button8:setTop(8);
    obj.button8:setWidth(70);
    obj.button8:setHeight(20);
    obj.button8:setText("Iniciativa");
    obj.button8:setName("button8");

    obj.edit268 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.rectangle68);
    obj.edit268:setLeft(80);
    obj.edit268:setTop(5);
    obj.edit268:setWidth(30);
    obj.edit268:setHeight(25);
    obj.edit268:setField("iniciativaComp");
    obj.edit268:setName("edit268");
    obj.edit268:setFontSize(15);
    obj.edit268:setFontColor("white");

    obj.edit269 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.rectangle68);
    obj.edit269:setLeft(110);
    obj.edit269:setTop(5);
    obj.edit269:setWidth(85);
    obj.edit269:setHeight(25);
    obj.edit269:setField("iniciativaCompDesc");
    obj.edit269:setName("edit269");
    obj.edit269:setFontSize(15);
    obj.edit269:setFontColor("white");

    obj.label302 = gui.fromHandle(_obj_newObject("label"));
    obj.label302:setParent(obj.rectangle68);
    obj.label302:setLeft(2);
    obj.label302:setTop(35);
    obj.label302:setWidth(85);
    obj.label302:setHeight(20);
    obj.label302:setText("Deslocamento");
    obj.label302:setFontSize(12);
    obj.label302:setName("label302");
    obj.label302:setFontColor("white");

    obj.edit270 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.rectangle68);
    obj.edit270:setLeft(80);
    obj.edit270:setTop(30);
    obj.edit270:setWidth(115);
    obj.edit270:setHeight(25);
    obj.edit270:setField("deslocamentoComp");
    obj.edit270:setName("edit270");
    obj.edit270:setFontSize(15);
    obj.edit270:setFontColor("white");

    obj.label303 = gui.fromHandle(_obj_newObject("label"));
    obj.label303:setParent(obj.rectangle68);
    obj.label303:setLeft(5);
    obj.label303:setTop(60);
    obj.label303:setWidth(40);
    obj.label303:setHeight(20);
    obj.label303:setText("BBA");
    obj.label303:setName("label303");
    obj.label303:setFontColor("white");

    obj.edit271 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.rectangle68);
    obj.edit271:setLeft(35);
    obj.edit271:setTop(55);
    obj.edit271:setWidth(55);
    obj.edit271:setHeight(25);
    obj.edit271:setField("bbaComp");
    obj.edit271:setName("edit271");
    obj.edit271:setFontSize(15);
    obj.edit271:setFontColor("white");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle68);
    obj.button9:setLeft(90);
    obj.button9:setTop(58);
    obj.button9:setWidth(60);
    obj.button9:setHeight(20);
    obj.button9:setText("Agarrar");
    obj.button9:setName("button9");

    obj.edit272 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.rectangle68);
    obj.edit272:setLeft(150);
    obj.edit272:setTop(55);
    obj.edit272:setWidth(45);
    obj.edit272:setHeight(25);
    obj.edit272:setField("agarrarComp");
    obj.edit272:setName("edit272");
    obj.edit272:setFontSize(15);
    obj.edit272:setFontColor("white");

    obj.label304 = gui.fromHandle(_obj_newObject("label"));
    obj.label304:setParent(obj.rectangle68);
    obj.label304:setLeft(5);
    obj.label304:setTop(85);
    obj.label304:setWidth(40);
    obj.label304:setHeight(20);
    obj.label304:setText("Esp.");
    obj.label304:setName("label304");
    obj.label304:setFontColor("white");

    obj.edit273 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.rectangle68);
    obj.edit273:setLeft(35);
    obj.edit273:setTop(80);
    obj.edit273:setWidth(35);
    obj.edit273:setHeight(25);
    obj.edit273:setField("esp1Comp");
    obj.edit273:setName("edit273");
    obj.edit273:setFontSize(15);
    obj.edit273:setFontColor("white");

    obj.edit274 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.rectangle68);
    obj.edit274:setLeft(70);
    obj.edit274:setTop(80);
    obj.edit274:setWidth(35);
    obj.edit274:setHeight(25);
    obj.edit274:setField("esp2Comp");
    obj.edit274:setName("edit274");
    obj.edit274:setFontSize(15);
    obj.edit274:setFontColor("white");

    obj.label305 = gui.fromHandle(_obj_newObject("label"));
    obj.label305:setParent(obj.rectangle68);
    obj.label305:setLeft(110);
    obj.label305:setTop(85);
    obj.label305:setWidth(40);
    obj.label305:setHeight(20);
    obj.label305:setText("Alc.");
    obj.label305:setName("label305");
    obj.label305:setFontColor("white");

    obj.edit275 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.rectangle68);
    obj.edit275:setLeft(140);
    obj.edit275:setTop(80);
    obj.edit275:setWidth(55);
    obj.edit275:setHeight(25);
    obj.edit275:setField("alcanceComp");
    obj.edit275:setName("edit275");
    obj.edit275:setFontSize(15);
    obj.edit275:setFontColor("white");

    obj.rectangle69 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle69:setLeft(0);
    obj.rectangle69:setTop(364);
    obj.rectangle69:setWidth(200);
    obj.rectangle69:setHeight(160);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setName("rectangle69");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle69);
    obj.layout86:setLeft(5);
    obj.layout86:setTop(5);
    obj.layout86:setWidth(195);
    obj.layout86:setHeight(25);
    obj.layout86:setName("layout86");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout86);
    obj.button10:setLeft(0);
    obj.button10:setTop(3);
    obj.button10:setWidth(42);
    obj.button10:setHeight(20);
    obj.button10:setText("FOR");
    obj.button10:setName("button10");

    obj.edit276 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout86);
    obj.edit276:setLeft(45);
    obj.edit276:setTop(0);
    obj.edit276:setWidth(30);
    obj.edit276:setHeight(25);
    obj.edit276:setField("forComp");
    obj.edit276:setName("edit276");
    obj.edit276:setFontSize(15);
    obj.edit276:setFontColor("white");

    obj.rectangle70 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout86);
    obj.rectangle70:setLeft(80);
    obj.rectangle70:setTop(0);
    obj.rectangle70:setWidth(30);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.label306 = gui.fromHandle(_obj_newObject("label"));
    obj.label306:setParent(obj.layout86);
    obj.label306:setLeft(80);
    obj.label306:setTop(0);
    obj.label306:setWidth(30);
    obj.label306:setHeight(25);
    obj.label306:setField("forModComp");
    obj.label306:setHorzTextAlign("center");
    obj.label306:setName("label306");
    obj.label306:setFontColor("white");

    obj.edit277 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout86);
    obj.edit277:setLeft(115);
    obj.edit277:setTop(0);
    obj.edit277:setWidth(75);
    obj.edit277:setHeight(25);
    obj.edit277:setField("forCompDesc");
    obj.edit277:setName("edit277");
    obj.edit277:setFontSize(15);
    obj.edit277:setFontColor("white");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle69);
    obj.layout87:setLeft(5);
    obj.layout87:setTop(30);
    obj.layout87:setWidth(195);
    obj.layout87:setHeight(25);
    obj.layout87:setName("layout87");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout87);
    obj.button11:setLeft(0);
    obj.button11:setTop(3);
    obj.button11:setWidth(42);
    obj.button11:setHeight(20);
    obj.button11:setText("DES");
    obj.button11:setName("button11");

    obj.edit278 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout87);
    obj.edit278:setLeft(45);
    obj.edit278:setTop(0);
    obj.edit278:setWidth(30);
    obj.edit278:setHeight(25);
    obj.edit278:setField("desComp");
    obj.edit278:setName("edit278");
    obj.edit278:setFontSize(15);
    obj.edit278:setFontColor("white");

    obj.rectangle71 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout87);
    obj.rectangle71:setLeft(80);
    obj.rectangle71:setTop(0);
    obj.rectangle71:setWidth(30);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label307 = gui.fromHandle(_obj_newObject("label"));
    obj.label307:setParent(obj.layout87);
    obj.label307:setLeft(80);
    obj.label307:setTop(0);
    obj.label307:setWidth(30);
    obj.label307:setHeight(25);
    obj.label307:setField("desModComp");
    obj.label307:setHorzTextAlign("center");
    obj.label307:setName("label307");
    obj.label307:setFontColor("white");

    obj.edit279 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout87);
    obj.edit279:setLeft(115);
    obj.edit279:setTop(0);
    obj.edit279:setWidth(75);
    obj.edit279:setHeight(25);
    obj.edit279:setField("desCompDesc");
    obj.edit279:setName("edit279");
    obj.edit279:setFontSize(15);
    obj.edit279:setFontColor("white");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle69);
    obj.layout88:setLeft(5);
    obj.layout88:setTop(55);
    obj.layout88:setWidth(195);
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout88);
    obj.button12:setLeft(0);
    obj.button12:setTop(3);
    obj.button12:setWidth(42);
    obj.button12:setHeight(20);
    obj.button12:setText("CON");
    obj.button12:setName("button12");

    obj.edit280 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout88);
    obj.edit280:setLeft(45);
    obj.edit280:setTop(0);
    obj.edit280:setWidth(30);
    obj.edit280:setHeight(25);
    obj.edit280:setField("conComp");
    obj.edit280:setName("edit280");
    obj.edit280:setFontSize(15);
    obj.edit280:setFontColor("white");

    obj.rectangle72 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout88);
    obj.rectangle72:setLeft(80);
    obj.rectangle72:setTop(0);
    obj.rectangle72:setWidth(30);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label308 = gui.fromHandle(_obj_newObject("label"));
    obj.label308:setParent(obj.layout88);
    obj.label308:setLeft(80);
    obj.label308:setTop(0);
    obj.label308:setWidth(30);
    obj.label308:setHeight(25);
    obj.label308:setField("conModComp");
    obj.label308:setHorzTextAlign("center");
    obj.label308:setName("label308");
    obj.label308:setFontColor("white");

    obj.edit281 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout88);
    obj.edit281:setLeft(115);
    obj.edit281:setTop(0);
    obj.edit281:setWidth(75);
    obj.edit281:setHeight(25);
    obj.edit281:setField("conCompDesc");
    obj.edit281:setName("edit281");
    obj.edit281:setFontSize(15);
    obj.edit281:setFontColor("white");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle69);
    obj.layout89:setLeft(5);
    obj.layout89:setTop(80);
    obj.layout89:setWidth(195);
    obj.layout89:setHeight(25);
    obj.layout89:setName("layout89");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout89);
    obj.button13:setLeft(0);
    obj.button13:setTop(3);
    obj.button13:setWidth(42);
    obj.button13:setHeight(20);
    obj.button13:setText("INT");
    obj.button13:setName("button13");

    obj.edit282 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout89);
    obj.edit282:setLeft(45);
    obj.edit282:setTop(0);
    obj.edit282:setWidth(30);
    obj.edit282:setHeight(25);
    obj.edit282:setField("intComp");
    obj.edit282:setName("edit282");
    obj.edit282:setFontSize(15);
    obj.edit282:setFontColor("white");

    obj.rectangle73 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout89);
    obj.rectangle73:setLeft(80);
    obj.rectangle73:setTop(0);
    obj.rectangle73:setWidth(30);
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label309 = gui.fromHandle(_obj_newObject("label"));
    obj.label309:setParent(obj.layout89);
    obj.label309:setLeft(80);
    obj.label309:setTop(0);
    obj.label309:setWidth(30);
    obj.label309:setHeight(25);
    obj.label309:setField("intModComp");
    obj.label309:setHorzTextAlign("center");
    obj.label309:setName("label309");
    obj.label309:setFontColor("white");

    obj.edit283 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout89);
    obj.edit283:setLeft(115);
    obj.edit283:setTop(0);
    obj.edit283:setWidth(75);
    obj.edit283:setHeight(25);
    obj.edit283:setField("intCompDesc");
    obj.edit283:setName("edit283");
    obj.edit283:setFontSize(15);
    obj.edit283:setFontColor("white");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle69);
    obj.layout90:setLeft(5);
    obj.layout90:setTop(105);
    obj.layout90:setWidth(195);
    obj.layout90:setHeight(25);
    obj.layout90:setName("layout90");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout90);
    obj.button14:setLeft(0);
    obj.button14:setTop(3);
    obj.button14:setWidth(42);
    obj.button14:setHeight(20);
    obj.button14:setText("SAB");
    obj.button14:setName("button14");

    obj.edit284 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout90);
    obj.edit284:setLeft(45);
    obj.edit284:setTop(0);
    obj.edit284:setWidth(30);
    obj.edit284:setHeight(25);
    obj.edit284:setField("sabComp");
    obj.edit284:setName("edit284");
    obj.edit284:setFontSize(15);
    obj.edit284:setFontColor("white");

    obj.rectangle74 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout90);
    obj.rectangle74:setLeft(80);
    obj.rectangle74:setTop(0);
    obj.rectangle74:setWidth(30);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label310 = gui.fromHandle(_obj_newObject("label"));
    obj.label310:setParent(obj.layout90);
    obj.label310:setLeft(80);
    obj.label310:setTop(0);
    obj.label310:setWidth(30);
    obj.label310:setHeight(25);
    obj.label310:setField("sabModComp");
    obj.label310:setHorzTextAlign("center");
    obj.label310:setName("label310");
    obj.label310:setFontColor("white");

    obj.edit285 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout90);
    obj.edit285:setLeft(115);
    obj.edit285:setTop(0);
    obj.edit285:setWidth(75);
    obj.edit285:setHeight(25);
    obj.edit285:setField("sabCompDesc");
    obj.edit285:setName("edit285");
    obj.edit285:setFontSize(15);
    obj.edit285:setFontColor("white");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle69);
    obj.layout91:setLeft(5);
    obj.layout91:setTop(130);
    obj.layout91:setWidth(195);
    obj.layout91:setHeight(25);
    obj.layout91:setName("layout91");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout91);
    obj.button15:setLeft(0);
    obj.button15:setTop(3);
    obj.button15:setWidth(42);
    obj.button15:setHeight(20);
    obj.button15:setText("CAR");
    obj.button15:setName("button15");

    obj.edit286 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout91);
    obj.edit286:setLeft(45);
    obj.edit286:setTop(0);
    obj.edit286:setWidth(30);
    obj.edit286:setHeight(25);
    obj.edit286:setField("carComp");
    obj.edit286:setName("edit286");
    obj.edit286:setFontSize(15);
    obj.edit286:setFontColor("white");

    obj.rectangle75 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout91);
    obj.rectangle75:setLeft(80);
    obj.rectangle75:setTop(0);
    obj.rectangle75:setWidth(30);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label311 = gui.fromHandle(_obj_newObject("label"));
    obj.label311:setParent(obj.layout91);
    obj.label311:setLeft(80);
    obj.label311:setTop(0);
    obj.label311:setWidth(30);
    obj.label311:setHeight(25);
    obj.label311:setField("carModComp");
    obj.label311:setHorzTextAlign("center");
    obj.label311:setName("label311");
    obj.label311:setFontColor("white");

    obj.edit287 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout91);
    obj.edit287:setLeft(115);
    obj.edit287:setTop(0);
    obj.edit287:setWidth(75);
    obj.edit287:setHeight(25);
    obj.edit287:setField("carCompDesc");
    obj.edit287:setName("edit287");
    obj.edit287:setFontSize(15);
    obj.edit287:setFontColor("white");

    obj.rectangle76 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle76:setLeft(0);
    obj.rectangle76:setTop(527);
    obj.rectangle76:setWidth(200);
    obj.rectangle76:setHeight(85);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setName("rectangle76");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle76);
    obj.layout92:setLeft(5);
    obj.layout92:setTop(5);
    obj.layout92:setWidth(195);
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout92);
    obj.button16:setLeft(0);
    obj.button16:setTop(3);
    obj.button16:setWidth(42);
    obj.button16:setHeight(20);
    obj.button16:setText("FORT");
    obj.button16:setName("button16");

    obj.edit288 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout92);
    obj.edit288:setLeft(45);
    obj.edit288:setTop(0);
    obj.edit288:setWidth(30);
    obj.edit288:setHeight(25);
    obj.edit288:setField("fortComp");
    obj.edit288:setName("edit288");
    obj.edit288:setFontSize(15);
    obj.edit288:setFontColor("white");

    obj.edit289 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout92);
    obj.edit289:setLeft(80);
    obj.edit289:setTop(0);
    obj.edit289:setWidth(110);
    obj.edit289:setHeight(25);
    obj.edit289:setField("fortCompDesc");
    obj.edit289:setName("edit289");
    obj.edit289:setFontSize(15);
    obj.edit289:setFontColor("white");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle76);
    obj.layout93:setLeft(5);
    obj.layout93:setTop(30);
    obj.layout93:setWidth(195);
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout93);
    obj.button17:setLeft(0);
    obj.button17:setTop(3);
    obj.button17:setWidth(42);
    obj.button17:setHeight(20);
    obj.button17:setText("REF");
    obj.button17:setName("button17");

    obj.edit290 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout93);
    obj.edit290:setLeft(45);
    obj.edit290:setTop(0);
    obj.edit290:setWidth(30);
    obj.edit290:setHeight(25);
    obj.edit290:setField("refComp");
    obj.edit290:setName("edit290");
    obj.edit290:setFontSize(15);
    obj.edit290:setFontColor("white");

    obj.edit291 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout93);
    obj.edit291:setLeft(80);
    obj.edit291:setTop(0);
    obj.edit291:setWidth(110);
    obj.edit291:setHeight(25);
    obj.edit291:setField("refCompDesc");
    obj.edit291:setName("edit291");
    obj.edit291:setFontSize(15);
    obj.edit291:setFontColor("white");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle76);
    obj.layout94:setLeft(5);
    obj.layout94:setTop(55);
    obj.layout94:setWidth(195);
    obj.layout94:setHeight(25);
    obj.layout94:setName("layout94");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout94);
    obj.button18:setLeft(0);
    obj.button18:setTop(3);
    obj.button18:setWidth(42);
    obj.button18:setHeight(20);
    obj.button18:setText("VON");
    obj.button18:setName("button18");

    obj.edit292 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout94);
    obj.edit292:setLeft(45);
    obj.edit292:setTop(0);
    obj.edit292:setWidth(30);
    obj.edit292:setHeight(25);
    obj.edit292:setField("vonComp");
    obj.edit292:setName("edit292");
    obj.edit292:setFontSize(15);
    obj.edit292:setFontColor("white");

    obj.edit293 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout94);
    obj.edit293:setLeft(80);
    obj.edit293:setTop(0);
    obj.edit293:setWidth(110);
    obj.edit293:setHeight(25);
    obj.edit293:setField("vonCompDesc");
    obj.edit293:setName("edit293");
    obj.edit293:setFontSize(15);
    obj.edit293:setFontColor("white");

    obj.rectangle77 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle77:setLeft(205);
    obj.rectangle77:setTop(0);
    obj.rectangle77:setWidth(300);
    obj.rectangle77:setHeight(300);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setName("rectangle77");

    obj.label312 = gui.fromHandle(_obj_newObject("label"));
    obj.label312:setParent(obj.rectangle77);
    obj.label312:setLeft(0);
    obj.label312:setTop(0);
    obj.label312:setWidth(300);
    obj.label312:setHeight(25);
    obj.label312:setText("PERÍCIAS");
    obj.label312:setHorzTextAlign("center");
    obj.label312:setName("label312");
    obj.label312:setFontColor("white");

    obj.textEditor31 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor31:setParent(obj.rectangle77);
    obj.textEditor31:setLeft(5);
    obj.textEditor31:setTop(30);
    obj.textEditor31:setWidth(290);
    obj.textEditor31:setHeight(265);
    obj.textEditor31:setField("periciasComp");
    obj.textEditor31:setName("textEditor31");

    obj.rectangle78 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle78:setLeft(510);
    obj.rectangle78:setTop(0);
    obj.rectangle78:setWidth(300);
    obj.rectangle78:setHeight(300);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setName("rectangle78");

    obj.label313 = gui.fromHandle(_obj_newObject("label"));
    obj.label313:setParent(obj.rectangle78);
    obj.label313:setLeft(0);
    obj.label313:setTop(0);
    obj.label313:setWidth(300);
    obj.label313:setHeight(25);
    obj.label313:setText("TALENTOS");
    obj.label313:setHorzTextAlign("center");
    obj.label313:setName("label313");
    obj.label313:setFontColor("white");

    obj.textEditor32 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor32:setParent(obj.rectangle78);
    obj.textEditor32:setLeft(5);
    obj.textEditor32:setTop(30);
    obj.textEditor32:setWidth(290);
    obj.textEditor32:setHeight(265);
    obj.textEditor32:setField("talentosComp");
    obj.textEditor32:setName("textEditor32");

    obj.rectangle79 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle79:setLeft(815);
    obj.rectangle79:setTop(0);
    obj.rectangle79:setWidth(300);
    obj.rectangle79:setHeight(300);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setName("rectangle79");

    obj.label314 = gui.fromHandle(_obj_newObject("label"));
    obj.label314:setParent(obj.rectangle79);
    obj.label314:setLeft(0);
    obj.label314:setTop(0);
    obj.label314:setWidth(300);
    obj.label314:setHeight(25);
    obj.label314:setText("HABILIDADES");
    obj.label314:setHorzTextAlign("center");
    obj.label314:setName("label314");
    obj.label314:setFontColor("white");

    obj.textEditor33 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor33:setParent(obj.rectangle79);
    obj.textEditor33:setLeft(5);
    obj.textEditor33:setTop(30);
    obj.textEditor33:setWidth(290);
    obj.textEditor33:setHeight(265);
    obj.textEditor33:setField("habilidadesComp");
    obj.textEditor33:setName("textEditor33");

    obj.rectangle80 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle80:setLeft(205);
    obj.rectangle80:setTop(305);
    obj.rectangle80:setWidth(300);
    obj.rectangle80:setHeight(300);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setName("rectangle80");

    obj.label315 = gui.fromHandle(_obj_newObject("label"));
    obj.label315:setParent(obj.rectangle80);
    obj.label315:setLeft(0);
    obj.label315:setTop(0);
    obj.label315:setWidth(300);
    obj.label315:setHeight(25);
    obj.label315:setText("INVENTARIO");
    obj.label315:setHorzTextAlign("center");
    obj.label315:setName("label315");
    obj.label315:setFontColor("white");

    obj.textEditor34 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor34:setParent(obj.rectangle80);
    obj.textEditor34:setLeft(5);
    obj.textEditor34:setTop(30);
    obj.textEditor34:setWidth(290);
    obj.textEditor34:setHeight(240);
    obj.textEditor34:setField("inventarioComp");
    obj.textEditor34:setName("textEditor34");

    obj.label316 = gui.fromHandle(_obj_newObject("label"));
    obj.label316:setParent(obj.rectangle80);
    obj.label316:setLeft(55);
    obj.label316:setTop(275);
    obj.label316:setWidth(50);
    obj.label316:setHeight(20);
    obj.label316:setText("PESO");
    obj.label316:setName("label316");
    obj.label316:setFontColor("white");

    obj.edit294 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.rectangle80);
    obj.edit294:setLeft(95);
    obj.edit294:setTop(270);
    obj.edit294:setWidth(70);
    obj.edit294:setHeight(25);
    obj.edit294:setField("pesoInventorioComp");
    obj.edit294:setVertTextAlign("center");
    obj.edit294:setHorzTextAlign("center");
    obj.edit294:setName("edit294");
    obj.edit294:setFontSize(15);
    obj.edit294:setFontColor("white");

    obj.label317 = gui.fromHandle(_obj_newObject("label"));
    obj.label317:setParent(obj.rectangle80);
    obj.label317:setLeft(175);
    obj.label317:setTop(275);
    obj.label317:setWidth(50);
    obj.label317:setHeight(20);
    obj.label317:setText("PREÇO");
    obj.label317:setName("label317");
    obj.label317:setFontColor("white");

    obj.edit295 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.rectangle80);
    obj.edit295:setLeft(225);
    obj.edit295:setTop(270);
    obj.edit295:setWidth(70);
    obj.edit295:setHeight(25);
    obj.edit295:setField("precoInventorioComp");
    obj.edit295:setVertTextAlign("center");
    obj.edit295:setHorzTextAlign("center");
    obj.edit295:setName("edit295");
    obj.edit295:setFontSize(15);
    obj.edit295:setFontColor("white");

    obj.dataLink65 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.boxDetalhesDoCompanheiro);
    obj.dataLink65:setField("precoInventorioComp");
    obj.dataLink65:setName("dataLink65");

    obj.rectangle81 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle81:setLeft(510);
    obj.rectangle81:setTop(305);
    obj.rectangle81:setWidth(300);
    obj.rectangle81:setHeight(300);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setName("rectangle81");

    obj.label318 = gui.fromHandle(_obj_newObject("label"));
    obj.label318:setParent(obj.rectangle81);
    obj.label318:setLeft(0);
    obj.label318:setTop(0);
    obj.label318:setWidth(300);
    obj.label318:setHeight(25);
    obj.label318:setText("ATAQUES");
    obj.label318:setHorzTextAlign("center");
    obj.label318:setName("label318");
    obj.label318:setFontColor("white");

    obj.textEditor35 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor35:setParent(obj.rectangle81);
    obj.textEditor35:setLeft(5);
    obj.textEditor35:setTop(30);
    obj.textEditor35:setWidth(290);
    obj.textEditor35:setHeight(120);
    obj.textEditor35:setField("ataquesComp");
    obj.textEditor35:setName("textEditor35");

    obj.label319 = gui.fromHandle(_obj_newObject("label"));
    obj.label319:setParent(obj.rectangle81);
    obj.label319:setLeft(5);
    obj.label319:setTop(150);
    obj.label319:setWidth(100);
    obj.label319:setHeight(20);
    obj.label319:setText("Macro");
    obj.label319:setName("label319");
    obj.label319:setFontColor("white");


					local function lines(str)
					   local t = {}
					   local function helper(line)
					      table.insert(t, line)
					      return ""
					   end
					   helper((str:gsub("(.-)\r?\n", helper)))
					   return t
					end
				


    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle81);
    obj.button19:setLeft(55);
    obj.button19:setTop(150);
    obj.button19:setWidth(50);
    obj.button19:setHeight(20);
    obj.button19:setHint("Envia tudo do segundo espaço para ataques no chat.");
    obj.button19:setText("Atacar");
    obj.button19:setName("button19");

    obj.textEditor36 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor36:setParent(obj.rectangle81);
    obj.textEditor36:setLeft(5);
    obj.textEditor36:setTop(170);
    obj.textEditor36:setWidth(290);
    obj.textEditor36:setHeight(120);
    obj.textEditor36:setField("macro");
    obj.textEditor36:setName("textEditor36");

    obj.rectangle82 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle82:setLeft(815);
    obj.rectangle82:setTop(305);
    obj.rectangle82:setWidth(300);
    obj.rectangle82:setHeight(300);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setName("rectangle82");

    obj.label320 = gui.fromHandle(_obj_newObject("label"));
    obj.label320:setParent(obj.rectangle82);
    obj.label320:setLeft(0);
    obj.label320:setTop(0);
    obj.label320:setWidth(300);
    obj.label320:setHeight(25);
    obj.label320:setText("OUTROS");
    obj.label320:setHorzTextAlign("center");
    obj.label320:setName("label320");
    obj.label320:setFontColor("white");

    obj.textEditor37 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor37:setParent(obj.rectangle82);
    obj.textEditor37:setLeft(5);
    obj.textEditor37:setTop(30);
    obj.textEditor37:setWidth(290);
    obj.textEditor37:setHeight(265);
    obj.textEditor37:setField("outrosComp");
    obj.textEditor37:setName("textEditor37");

    obj.rectangle83 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.boxDetalhesDoCompanheiro);
    obj.rectangle83:setLeft(1120);
    obj.rectangle83:setTop(0);
    obj.rectangle83:setWidth(202);
    obj.rectangle83:setHeight(202);
    obj.rectangle83:setColor("black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

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

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.scrollBox9);
    obj.button20:setText("Novo Companheiro");
    obj.button20:setLeft(1140);
    obj.button20:setTop(206);
    obj.button20:setWidth(160);
    obj.button20:setHeight(20);
    obj.button20:setName("button20");

    obj.rectangle84 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.scrollBox9);
    obj.rectangle84:setLeft(1119);
    obj.rectangle84:setTop(229);
    obj.rectangle84:setWidth(202);
    obj.rectangle84:setHeight(362);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.rclListaDosCompanheiros = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosCompanheiros:setParent(obj.scrollBox9);
    obj.rclListaDosCompanheiros:setName("rclListaDosCompanheiros");
    obj.rclListaDosCompanheiros:setField("campoDosCompanheiros");
    obj.rclListaDosCompanheiros:setTemplateForm("frmFichaRPGmeister8CS_svg");
    obj.rclListaDosCompanheiros:setLeft(1120);
    obj.rclListaDosCompanheiros:setTop(230);
    obj.rclListaDosCompanheiros:setWidth(200);
    obj.rclListaDosCompanheiros:setHeight(360);
    obj.rclListaDosCompanheiros:setSelectable(true);
    obj.rclListaDosCompanheiros:setLayout("vertical");

    obj.tab9 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Creditos");
    obj.tab9:setName("tab9");

    obj.frmFichaRPGmeister11_svg = gui.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab9);
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
    obj.image3:setSRC("images/RPGmeister.jpg");
    obj.image3:setStyle("stretch");
    obj.image3:setOptimize(true);
    obj.image3:setName("image3");

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.scrollBox10);
    obj.layout95:setLeft(620);
    obj.layout95:setTop(10);
    obj.layout95:setWidth(200);
    obj.layout95:setHeight(150);
    obj.layout95:setName("layout95");

    obj.rectangle85 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout95);
    obj.rectangle85:setLeft(0);
    obj.rectangle85:setTop(0);
    obj.rectangle85:setWidth(200);
    obj.rectangle85:setHeight(150);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setXradius(15);
    obj.rectangle85:setYradius(15);
    obj.rectangle85:setCornerType("round");
    obj.rectangle85:setName("rectangle85");

    obj.label321 = gui.fromHandle(_obj_newObject("label"));
    obj.label321:setParent(obj.layout95);
    obj.label321:setLeft(0);
    obj.label321:setTop(10);
    obj.label321:setWidth(200);
    obj.label321:setHeight(20);
    obj.label321:setText("Programador: Vinny (Ambesek)");
    obj.label321:setHorzTextAlign("center");
    obj.label321:setName("label321");
    obj.label321:setFontColor("white");

    obj.label322 = gui.fromHandle(_obj_newObject("label"));
    obj.label322:setParent(obj.layout95);
    obj.label322:setLeft(0);
    obj.label322:setTop(35);
    obj.label322:setWidth(200);
    obj.label322:setHeight(20);
    obj.label322:setText("Arte: Nefer (Nefertyne)");
    obj.label322:setHorzTextAlign("center");
    obj.label322:setName("label322");
    obj.label322:setFontColor("white");

    obj.label323 = gui.fromHandle(_obj_newObject("label"));
    obj.label323:setParent(obj.layout95);
    obj.label323:setLeft(0);
    obj.label323:setTop(95);
    obj.label323:setWidth(200);
    obj.label323:setHeight(20);
    obj.label323:setText("Ficha feita para a mesa: ");
    obj.label323:setHorzTextAlign("center");
    obj.label323:setName("label323");
    obj.label323:setFontColor("white");

    obj.label324 = gui.fromHandle(_obj_newObject("label"));
    obj.label324:setParent(obj.layout95);
    obj.label324:setLeft(0);
    obj.label324:setTop(120);
    obj.label324:setWidth(200);
    obj.label324:setHeight(20);
    obj.label324:setText("RPGmeister");
    obj.label324:setHorzTextAlign("center");
    obj.label324:setName("label324");
    obj.label324:setFontColor("white");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.scrollBox10);
    obj.layout96:setLeft(830);
    obj.layout96:setTop(0);
    obj.layout96:setWidth(400);
    obj.layout96:setHeight(350);
    obj.layout96:setName("layout96");

    obj.rectangle86 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout96);
    obj.rectangle86:setAlign("client");
    obj.rectangle86:setColor("black");
    obj.rectangle86:setName("rectangle86");

    obj.label325 = gui.fromHandle(_obj_newObject("label"));
    obj.label325:setParent(obj.layout96);
    obj.label325:setLeft(0);
    obj.label325:setTop(0);
    obj.label325:setWidth(400);
    obj.label325:setHeight(20);
    obj.label325:setText("ANOTAÇÕES DO MESTRE");
    obj.label325:setHorzTextAlign("center");
    obj.label325:setName("label325");
    obj.label325:setFontColor("white");

    obj.textEditor38 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor38:setParent(obj.layout96);
    obj.textEditor38:setLeft(10);
    obj.textEditor38:setTop(25);
    obj.textEditor38:setWidth(380);
    obj.textEditor38:setHeight(320);
    obj.textEditor38:setField("anotacoes_do_mestre");
    obj.textEditor38:setName("textEditor38");

    obj.label326 = gui.fromHandle(_obj_newObject("label"));
    obj.label326:setParent(obj.scrollBox10);
    obj.label326:setLeft(620);
    obj.label326:setTop(375);
    obj.label326:setWidth(200);
    obj.label326:setHeight(20);
    obj.label326:setText("SUA VERSÃO:");
    obj.label326:setField("versionInstalled");
    obj.label326:setName("label326");
    obj.label326:setFontColor("white");

    obj.label327 = gui.fromHandle(_obj_newObject("label"));
    obj.label327:setParent(obj.scrollBox10);
    obj.label327:setLeft(620);
    obj.label327:setTop(400);
    obj.label327:setWidth(200);
    obj.label327:setHeight(20);
    obj.label327:setText("VERSÃO ATUAL:");
    obj.label327:setField("versionDownloaded");
    obj.label327:setName("label327");
    obj.label327:setFontColor("white");

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.scrollBox10);
    obj.checkBox29:setLeft(620);
    obj.checkBox29:setTop(425);
    obj.checkBox29:setWidth(200);
    obj.checkBox29:setHeight(20);
    obj.checkBox29:setField("noUpdate");
    obj.checkBox29:setText("Não pedir para atualizar.");
    obj.checkBox29:setName("checkBox29");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.scrollBox10);
    obj.button21:setLeft(620);
    obj.button21:setTop(475);
    obj.button21:setWidth(100);
    obj.button21:setText("Change Log");
    obj.button21:setName("button21");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.scrollBox10);
    obj.button22:setLeft(730);
    obj.button22:setTop(475);
    obj.button22:setWidth(100);
    obj.button22:setText("Atualizar");
    obj.button22:setName("button22");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.scrollBox10);
    obj.button23:setLeft(840);
    obj.button23:setTop(475);
    obj.button23:setWidth(100);
    obj.button23:setText("Tutorial");
    obj.button23:setName("button23");

    obj.label328 = gui.fromHandle(_obj_newObject("label"));
    obj.label328:setParent(obj.scrollBox10);
    obj.label328:setLeft(620);
    obj.label328:setTop(525);
    obj.label328:setWidth(120);
    obj.label328:setHeight(20);
    obj.label328:setText("CONHEÇA A MESA:");
    obj.label328:setFontSize(11);
    obj.label328:setName("label328");
    obj.label328:setFontColor("white");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.scrollBox10);
    obj.button24:setLeft(730);
    obj.button24:setTop(525);
    obj.button24:setWidth(100);
    obj.button24:setText("RPGmeister");
    obj.button24:setName("button24");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.scrollBox10);
    obj.button25:setLeft(840);
    obj.button25:setTop(525);
    obj.button25:setWidth(100);
    obj.button25:setHeight(20);
    obj.button25:setText("Exportar Ficha");
    obj.button25:setName("button25");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.scrollBox10);
    obj.button26:setLeft(950);
    obj.button26:setTop(525);
    obj.button26:setWidth(100);
    obj.button26:setHeight(20);
    obj.button26:setText("Importar Ficha");
    obj.button26:setName("button26");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20RPG%20meister/output/Ficha%20RPG%20meister.rpk?raw=true",
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
                                Dialogs.choose("Há uma nova versão (".. info.version .. ") da Ficha RPG meister. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20RPG%20meister/output/Ficha%20RPG%20meister.rpk?raw=true');
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
        function (self, field, oldValue, newValue)
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
        function (self, field, oldValue, newValue)
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

    obj._e_event11 = obj.dataLink16:addEventListener("onChange",
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
        function (self, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero = nil;
            				
            				if numAsStrg ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modforca = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modforcastr = "+" .. modificador;
            					else	
            						sheet.atributos.modforcastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modforca = nil;
            					sheet.atributos.modforcastr = nil;
            				end;
        end, obj);

    obj._e_event13 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modforca;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.forca or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusforca = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusforcastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusforcastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusforca = nil;
            								sheet.resistencias.bonusforcastr = nil;
            							end;
        end, obj);

    obj._e_event14 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modforca;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.atletismo or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusatletismo	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusatletismostr = "+" .. valor;
            								else
            									sheet.pericias.bonusatletismostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusatletismo = nil;
            								sheet.pericias.bonusatletismostr = nil;
            							end;
        end, obj);

    obj._e_event15 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero = nil;
            				
            				if numAsStrg ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.moddestreza = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.moddestrezastr = "+" .. modificador;
            					else	
            						sheet.atributos.moddestrezastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.moddestreza = nil;
            					sheet.atributos.moddestrezastr = nil;
            				end;
        end, obj);

    obj._e_event16 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.moddestreza;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.destreza or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusdestreza = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusdestrezastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusdestrezastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusdestreza = nil;
            								sheet.resistencias.bonusdestrezastr = nil;
            							end;
        end, obj);

    obj._e_event17 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.moddestreza;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.acrobacia or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusacrobacia	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusacrobaciastr = "+" .. valor;
            								else
            									sheet.pericias.bonusacrobaciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusacrobacia = nil;
            								sheet.pericias.bonusacrobaciastr = nil;
            							end;
        end, obj);

    obj._e_event18 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.moddestreza;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.furtividade or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusfurtividade	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusfurtividadestr = "+" .. valor;
            								else
            									sheet.pericias.bonusfurtividadestr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusfurtividade = nil;
            								sheet.pericias.bonusfurtividadestr = nil;
            							end;
        end, obj);

    obj._e_event19 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.moddestreza;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.prestidigitacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusprestidigitacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusprestidigitacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusprestidigitacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusprestidigitacao = nil;
            								sheet.pericias.bonusprestidigitacaostr = nil;
            							end;
        end, obj);

    obj._e_event20 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero = nil;
            				
            				if numAsStrg ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modconstituicao = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modconstituicaostr = "+" .. modificador;
            					else	
            						sheet.atributos.modconstituicaostr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modconstituicao = nil;
            					sheet.atributos.modconstituicaostr = nil;
            				end;
        end, obj);

    obj._e_event21 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modconstituicao;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.constituicao or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusconstituicao = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusconstituicaostr = "+" .. valor;
            								else
            									sheet.resistencias.bonusconstituicaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusconstituicao = nil;
            								sheet.resistencias.bonusconstituicaostr = nil;
            							end;
        end, obj);

    obj._e_event22 = obj.dataLink27:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero = nil;
            				
            				if numAsStrg ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modinteligencia = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modinteligenciastr = "+" .. modificador;
            					else	
            						sheet.atributos.modinteligenciastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modinteligencia = nil;
            					sheet.atributos.modinteligenciastr = nil;
            				end;
        end, obj);

    obj._e_event23 = obj.dataLink28:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.inteligencia or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonusinteligencia = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonusinteligenciastr = "+" .. valor;
            								else
            									sheet.resistencias.bonusinteligenciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonusinteligencia = nil;
            								sheet.resistencias.bonusinteligenciastr = nil;
            							end;
        end, obj);

    obj._e_event24 = obj.dataLink29:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.arcanismo or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusarcanismo	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusarcanismostr = "+" .. valor;
            								else
            									sheet.pericias.bonusarcanismostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusarcanismo = nil;
            								sheet.pericias.bonusarcanismostr = nil;
            							end;
        end, obj);

    obj._e_event25 = obj.dataLink30:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.historia or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonushistoria	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonushistoriastr = "+" .. valor;
            								else
            									sheet.pericias.bonushistoriastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonushistoria = nil;
            								sheet.pericias.bonushistoriastr = nil;
            							end;
        end, obj);

    obj._e_event26 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.investigacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusinvestigacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusinvestigacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusinvestigacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusinvestigacao = nil;
            								sheet.pericias.bonusinvestigacaostr = nil;
            							end;
        end, obj);

    obj._e_event27 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.natureza or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusnatureza	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusnaturezastr = "+" .. valor;
            								else
            									sheet.pericias.bonusnaturezastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusnatureza = nil;
            								sheet.pericias.bonusnaturezastr = nil;
            							end;
        end, obj);

    obj._e_event28 = obj.dataLink33:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modinteligencia;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.religiao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusreligiao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusreligiaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusreligiaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusreligiao = nil;
            								sheet.pericias.bonusreligiaostr = nil;
            							end;
        end, obj);

    obj._e_event29 = obj.dataLink34:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero = nil;
            				
            				if numAsStrg ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modsabedoria = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modsabedoriastr = "+" .. modificador;
            					else	
            						sheet.atributos.modsabedoriastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modsabedoria = nil;
            					sheet.atributos.modsabedoriastr = nil;
            				end;
        end, obj);

    obj._e_event30 = obj.dataLink35:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.sabedoria or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonussabedoria = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonussabedoriastr = "+" .. valor;
            								else
            									sheet.resistencias.bonussabedoriastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonussabedoria = nil;
            								sheet.resistencias.bonussabedoriastr = nil;
            							end;
        end, obj);

    obj._e_event31 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.adestrarAnimais or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusadestrarAnimais	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusadestrarAnimaisstr = "+" .. valor;
            								else
            									sheet.pericias.bonusadestrarAnimaisstr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusadestrarAnimais = nil;
            								sheet.pericias.bonusadestrarAnimaisstr = nil;
            							end;
        end, obj);

    obj._e_event32 = obj.dataLink37:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.intuicao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusintuicao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusintuicaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusintuicaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusintuicao = nil;
            								sheet.pericias.bonusintuicaostr = nil;
            							end;
        end, obj);

    obj._e_event33 = obj.dataLink38:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.medicina or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusmedicina	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusmedicinastr = "+" .. valor;
            								else
            									sheet.pericias.bonusmedicinastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusmedicina = nil;
            								sheet.pericias.bonusmedicinastr = nil;
            							end;
        end, obj);

    obj._e_event34 = obj.dataLink39:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.percepcao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonuspercepcao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonuspercepcaostr = "+" .. valor;
            								else
            									sheet.pericias.bonuspercepcaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonuspercepcao = nil;
            								sheet.pericias.bonuspercepcaostr = nil;
            							end;
        end, obj);

    obj._e_event35 = obj.dataLink40:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modsabedoria;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.sobrevivencia or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonussobrevivencia	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonussobrevivenciastr = "+" .. valor;
            								else
            									sheet.pericias.bonussobrevivenciastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonussobrevivencia = nil;
            								sheet.pericias.bonussobrevivenciastr = nil;
            							end;
        end, obj);

    obj._e_event36 = obj.dataLink41:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            				local numero = nil;
            				
            				if numAsStrg ~= "" then
            					numero = tonumber(newValue);
            				else
            					numero = nil;
            				end;
            
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;				
            				
            				if type(numero) == 'number' then
            					local modificador = math.floor(numero / 2) - 5;								
            					sheet.atributos.modcarisma = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modcarismastr = "+" .. modificador;
            					else	
            						sheet.atributos.modcarismastr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modcarisma = nil;
            					sheet.atributos.modcarismastr = nil;
            				end;
        end, obj);

    obj._e_event37 = obj.dataLink42:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temResistencia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.resistencias ~= nil then
            								temResistencia = sheet.resistencias.carisma or false;
            							else
            								temResistencia = false;
            								sheet.resistencias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temResistencia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.resistencias.bonuscarisma = valor;
            								
            								if valor >= 0 then
            									sheet.resistencias.bonuscarismastr = "+" .. valor;
            								else
            									sheet.resistencias.bonuscarismastr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.resistencias.bonuscarisma = nil;
            								sheet.resistencias.bonuscarismastr = nil;
            							end;
        end, obj);

    obj._e_event38 = obj.dataLink43:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.atuacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusatuacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusatuacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusatuacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusatuacao = nil;
            								sheet.pericias.bonusatuacaostr = nil;
            							end;
        end, obj);

    obj._e_event39 = obj.dataLink44:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.enganacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusenganacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusenganacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusenganacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusenganacao = nil;
            								sheet.pericias.bonusenganacaostr = nil;
            							end;
        end, obj);

    obj._e_event40 = obj.dataLink45:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.intimidacao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonusintimidacao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusintimidacaostr = "+" .. valor;
            								else
            									sheet.pericias.bonusintimidacaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusintimidacao = nil;
            								sheet.pericias.bonusintimidacaostr = nil;
            							end;
        end, obj);

    obj._e_event41 = obj.dataLink46:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modcarisma;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.persuasao or false;
            							else
            								temPericia = false;
            								sheet.pericias = {};
            							end;
            													
            							
            							if modificador ~= nil then
            								local valor;
            							
            								if temPericia then
            									valor = modificador	+ (tonumber(sheet.bonusProficiencia) or 0)						
            								else
            									valor = modificador;
            								end;								
            								
            								valor = math.tointeger(valor);
            								
            								sheet.pericias.bonuspersuasao	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonuspersuasaostr = "+" .. valor;
            								else
            									sheet.pericias.bonuspersuasaostr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonuspersuasao = nil;
            								sheet.pericias.bonuspersuasaostr = nil;
            							end;
        end, obj);

    obj._e_event42 = obj.dataLink47:addEventListener("onChange",
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

    obj._e_event43 = obj.rclListaDosTalentos:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event44 = obj.rclListaDosOutros:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event45 = obj.rclListaDasCaracteristicasClasse:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event46 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclListaDosTalentos:append();
        end, obj);

    obj._e_event47 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclListaDosOutros:append();
        end, obj);

    obj._e_event48 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclListaDasCaracteristicasClasse:append();
        end, obj);

    obj._e_event49 = obj.labupperGridMagicBox1:addEventListener("onResize",
        function (self)
            self.upperGridMagicBox1._RecalcSize();
        end, obj);

    obj._e_event50 = obj.labupperGridMagicBox2:addEventListener("onResize",
        function (self)
            self.upperGridMagicBox2._RecalcSize();
        end, obj);

    obj._e_event51 = obj.labupperGridMagicBox3:addEventListener("onResize",
        function (self)
            self.upperGridMagicBox3._RecalcSize();
        end, obj);

    obj._e_event52 = obj.labupperGridMagicEditBox1:addEventListener("onResize",
        function (self)
            self.upperGridMagicEditBox1._RecalcSize();
        end, obj);

    obj._e_event53 = obj.dataLink48:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local hab = nil;
            					local bonusProficiencia = nil;
            					local spellSaveValue = nil;
            					local spellAttackValue = nil;
            					local modHab = nil;
            					
            					if sheet.magias == nil then	
            						sheet.magias = {};											
            					end;
            					
            					if sheet.atributos == nil then
            						sheet.atributos = {};
            					end;
            					
            					hab = sheet.magias.habilidadeDeConjuracao;
            					
            					if hab == "int" then
            						modHab = tonumber(sheet.atributos.modInteligencia);
            					elseif hab == "sab" then
            						modHab = tonumber(sheet.atributos.modSabedoria);
            					elseif hab == "car" then
            						modHab = tonumber(sheet.atributos.modCarisma);
            					end;
            					
            					bonusProficiencia = tonumber(sheet.bonusProficiencia);
            					
            					if bonusProficiencia == nil then
            						bonusProficiencia = 0;
            					end;
            					
            					if modHab ~= nil then
            						spellSaveValue = 8 + modHab + bonusProficiencia;
            						spellAttackValue = modHab + bonusProficiencia;
            					end;
            					
            					sheet.magias.cdDaMagia = spellSaveValue;
            					sheet.magias.bonusAtaque = spellAttackValue;
            					
            					if spellAttackValue ~= nil then	
            						if spellAttackValue >= 0 then
            							sheet.magias.bonusAtaqueSTR = "+" .. spellAttackValue;
            						else
            							sheet.magias.bonusAtaqueSTR = spellAttackValue;
            						end;
            					else	
            						sheet.magias.bonusAtaqueSTR = nil;
            					end;
        end, obj);

    obj._e_event54 = obj.rclflwMagicRecordList1:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList1._recalcHeight();
        end, obj);

    obj._e_event55 = obj.btnNovoflwMagicRecordList1:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList1:append();
        end, obj);

    obj._e_event56 = obj.rclflwMagicRecordList2:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList2._recalcHeight();
        end, obj);

    obj._e_event57 = obj.btnNovoflwMagicRecordList2:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList2:append();
        end, obj);

    obj._e_event58 = obj.rclflwMagicRecordList3:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList3._recalcHeight();
        end, obj);

    obj._e_event59 = obj.btnNovoflwMagicRecordList3:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList3:append();
        end, obj);

    obj._e_event60 = obj.rclflwMagicRecordList4:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList4._recalcHeight();
        end, obj);

    obj._e_event61 = obj.btnNovoflwMagicRecordList4:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList4:append();
        end, obj);

    obj._e_event62 = obj.rclflwMagicRecordList5:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList5._recalcHeight();
        end, obj);

    obj._e_event63 = obj.btnNovoflwMagicRecordList5:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList5:append();
        end, obj);

    obj._e_event64 = obj.rclflwMagicRecordList6:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList6._recalcHeight();
        end, obj);

    obj._e_event65 = obj.btnNovoflwMagicRecordList6:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList6:append();
        end, obj);

    obj._e_event66 = obj.rclflwMagicRecordList7:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList7._recalcHeight();
        end, obj);

    obj._e_event67 = obj.btnNovoflwMagicRecordList7:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList7:append();
        end, obj);

    obj._e_event68 = obj.rclflwMagicRecordList8:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList8._recalcHeight();
        end, obj);

    obj._e_event69 = obj.btnNovoflwMagicRecordList8:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList8:append();
        end, obj);

    obj._e_event70 = obj.rclflwMagicRecordList9:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList9._recalcHeight();
        end, obj);

    obj._e_event71 = obj.btnNovoflwMagicRecordList9:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList9:append();
        end, obj);

    obj._e_event72 = obj.rclflwMagicRecordList10:addEventListener("onResize",
        function (self)
            self.flwMagicRecordList10._recalcHeight();
        end, obj);

    obj._e_event73 = obj.btnNovoflwMagicRecordList10:addEventListener("onClick",
        function (self)
            self.rclflwMagicRecordList10:append();
        end, obj);

    obj._e_event74 = obj.BarrinhaPopup:addEventListener("onClose",
        function (self, canceled)
            setTimeout( function()
            					if (sheet.ModificadorBarrinha == "igual") then
            						sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            					elseif (sheet.ModificadorBarrinha == "mais") then
            						sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorTempAtualBarrinha or 0) + tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            					elseif (sheet.ModificadorBarrinha == "menos") then
            						sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorTempAtualBarrinha or 0) - tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            					end;
            					
            					if (sheet.ModificadorBarrinhaMax == "igual") then
            						sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            					elseif (sheet.ModificadorBarrinhaMax == "mais") then
            						sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorTempMaxBarrinha or 0) + tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            					elseif (sheet.ModificadorBarrinhaMax == "menos") then
            						sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorTempMaxBarrinha or 0) - tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            					end;
            					
            					local barrinhapc = 0
            					local barrinhapcmax = 0
            					local porcentagem = 0
            					local porcentagemmax = 0
            
            					barrinhapc = (sheet.ValorTempAtualBarrinha - (sheet["Barrinha" .. (sheet.barrinhaID or 12) .. "Valor"] or 0));
            					barrinhapcmax = (sheet.ValorTempMaxBarrinha - (sheet["Barrinha" .. (sheet.barrinhaID or 12) .. "ValorMax"] or 0));
            					sheet["Barrinha" .. (sheet.barrinhaID or 12) .. "Valor"] = sheet.ValorTempAtualBarrinha;
            					sheet["Barrinha" .. (sheet.barrinhaID or 12) .. "ValorMax"] = sheet.ValorTempMaxBarrinha;
            					
            					if ((barrinhapc ~= 0) or (barrinhapcmax ~= 0)) then
            						local nome = sheet.AtributoBarrinha or "Equipamento";
            						local personagem = sheet.nome or "nome";
            						local text = "[§K2]" .. nome .. "[§K3] de [§K2]" .. personagem.. "[§K3]: ";
            						local valor = barrinhapc;
            						local valormax = barrinhapcmax;
            						
            						if tonumber(barrinhapc) >= 0 then
            							valor = "+" .. tostring(barrinhapc);
            						end;
            						if tonumber(barrinhapcmax) >= 0 then
            							valormax = "+" .. tostring(barrinhapcmax);
            						end;
            						
            						if tonumber(valormax) == 0 then
            							text = text .. valor;
            						else
            							text = text .. valor .. "/" .. valormax;
            						end;
            						
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						if mesaDoPersonagem ~= nil then
            							   mesaDoPersonagem.activeChat:enviarMensagem(text);
            						end;
            					end;
            				end, 100);
        end, obj);

    obj._e_event75 = obj.ValorAtualBarrinha:addEventListener("onKeyDown",
        function (self, event)
            local oenter = (event.keyCode == 13)
            									if oenter then
            										self.BarrinhaPopup:close();
            									end;
        end, obj);

    obj._e_event76 = obj.ValorMaxBarrinha:addEventListener("onKeyDown",
        function (self, event)
            local oenter = (event.keyCode == 13);
            									if oenter then
            										self.BarrinhaPopup:close();
            									end;
        end, obj);

    obj._e_event77 = obj.rectangle24:addEventListener("onMouseEnter",
        function (self)
            resetImgSlot()
        end, obj);

    obj._e_event78 = obj.rectangle25:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCabeca()
        end, obj);

    obj._e_event79 = obj.edit173:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCabeca()
        end, obj);

    obj._e_event80 = obj.textEditor4:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCabeca()
        end, obj);

    obj._e_event81 = obj.edit174:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCabeca()
        end, obj);

    obj._e_event82 = obj.edit175:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCabeca()
        end, obj);

    obj._e_event83 = obj.Barrinha0:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCabeca();
            							self.CorBarrinha0.color = "Green";
            							self.ValoresBarrinha0.visible = true;
            							sheet.InfoBarrinha0 = (sheet.Barrinha0Valor or 0) .. "/"	.. (sheet.Barrinha0ValorMax or 0);
        end, obj);

    obj._e_event84 = obj.Barrinha0:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha0.visible = false;
        end, obj);

    obj._e_event85 = obj.Barrinha0:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 0;
            							sheet.AtributoBarrinha = sheet.equipamentoCabeca;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha0Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha0ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha0Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha0ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha0);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event86 = obj.InfoBarrinha0:addEventListener("onResize",
        function (self)
            self.InfoBarrinha0.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event87 = obj.dataLink49:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha0.color = "Green";
        end, obj);

    obj._e_event88 = obj.rectangle26:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOlhos()
        end, obj);

    obj._e_event89 = obj.edit176:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOlhos()
        end, obj);

    obj._e_event90 = obj.textEditor5:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOlhos()
        end, obj);

    obj._e_event91 = obj.edit177:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOlhos()
        end, obj);

    obj._e_event92 = obj.edit178:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOlhos()
        end, obj);

    obj._e_event93 = obj.Barrinha1:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOlhos();
            							self.CorBarrinha1.color = "Green";
            							self.ValoresBarrinha1.visible = true;
            							sheet.InfoBarrinha1 = (sheet.Barrinha1Valor or 0) .. "/"	.. (sheet.Barrinha1ValorMax or 0);
        end, obj);

    obj._e_event94 = obj.Barrinha1:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha1.visible = false;
        end, obj);

    obj._e_event95 = obj.Barrinha1:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 1;
            							sheet.AtributoBarrinha = sheet.equipamentoOlhos;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha1Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha1ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha1Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha1ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha1);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event96 = obj.InfoBarrinha1:addEventListener("onResize",
        function (self)
            self.InfoBarrinha1.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event97 = obj.dataLink50:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha1.color = "Green";
        end, obj);

    obj._e_event98 = obj.rectangle27:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPescoco()
        end, obj);

    obj._e_event99 = obj.edit179:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPescoco()
        end, obj);

    obj._e_event100 = obj.textEditor6:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPescoco()
        end, obj);

    obj._e_event101 = obj.edit180:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPescoco()
        end, obj);

    obj._e_event102 = obj.edit181:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPescoco()
        end, obj);

    obj._e_event103 = obj.Barrinha2:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPescoco();
            							self.CorBarrinha2.color = "Green";
            							self.ValoresBarrinha2.visible = true;
            							sheet.InfoBarrinha2 = (sheet.Barrinha2Valor or 0) .. "/"	.. (sheet.Barrinha2ValorMax or 0);
        end, obj);

    obj._e_event104 = obj.Barrinha2:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha2.visible = false;
        end, obj);

    obj._e_event105 = obj.Barrinha2:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 2;
            							sheet.AtributoBarrinha = sheet.equipamentoPescoco;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha2Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha2ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha2Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha2ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha2);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event106 = obj.InfoBarrinha2:addEventListener("onResize",
        function (self)
            self.InfoBarrinha2.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event107 = obj.dataLink51:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha2.color = "Green";
        end, obj);

    obj._e_event108 = obj.rectangle28:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOmbros()
        end, obj);

    obj._e_event109 = obj.edit182:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOmbros()
        end, obj);

    obj._e_event110 = obj.textEditor7:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOmbros()
        end, obj);

    obj._e_event111 = obj.edit183:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOmbros()
        end, obj);

    obj._e_event112 = obj.edit184:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOmbros()
        end, obj);

    obj._e_event113 = obj.Barrinha3:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotOmbros();
            							self.CorBarrinha3.color = "Green";
            							self.ValoresBarrinha3.visible = true;
            							sheet.InfoBarrinha3 = (sheet.Barrinha3Valor or 0) .. "/"	.. (sheet.Barrinha3ValorMax or 0);
        end, obj);

    obj._e_event114 = obj.Barrinha3:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha3.visible = false;
        end, obj);

    obj._e_event115 = obj.Barrinha3:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 3;
            							sheet.AtributoBarrinha = sheet.equipamentoOmbros;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha3Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha3ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha3Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha3ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha3);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event116 = obj.InfoBarrinha3:addEventListener("onResize",
        function (self)
            self.InfoBarrinha3.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event117 = obj.dataLink52:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha3.color = "Green";
        end, obj);

    obj._e_event118 = obj.rectangle29:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotTorso()
        end, obj);

    obj._e_event119 = obj.edit185:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotTorso()
        end, obj);

    obj._e_event120 = obj.textEditor8:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotTorso()
        end, obj);

    obj._e_event121 = obj.edit186:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotTorso()
        end, obj);

    obj._e_event122 = obj.edit187:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotTorso()
        end, obj);

    obj._e_event123 = obj.Barrinha4:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotTorso();
            							self.CorBarrinha4.color = "Green";
            							self.ValoresBarrinha4.visible = true;
            							sheet.InfoBarrinha4 = (sheet.Barrinha4Valor or 0) .. "/"	.. (sheet.Barrinha4ValorMax or 0);
        end, obj);

    obj._e_event124 = obj.Barrinha4:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha4.visible = false;
        end, obj);

    obj._e_event125 = obj.Barrinha4:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 4;
            							sheet.AtributoBarrinha = sheet.equipamentoTorso;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha4Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha4ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha4Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha4ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha4);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event126 = obj.InfoBarrinha4:addEventListener("onResize",
        function (self)
            self.InfoBarrinha4.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event127 = obj.dataLink53:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha4.color = "Green";
        end, obj);

    obj._e_event128 = obj.rectangle30:addEventListener("onMouseEnter",
        function (self)
            if sheet==nil then return end;
            					sheet.imgSlots = "http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20RPG%20meister%20releases/images/corpo.png";
        end, obj);

    obj._e_event129 = obj.Barrinha5:addEventListener("onMouseEnter",
        function (self)
            self.CorBarrinha5.color = "Green";
            							self.ValoresBarrinha5.visible = true;
            							sheet.InfoBarrinha5 = (sheet.Barrinha5Valor or 0) .. "/"	.. (sheet.Barrinha5ValorMax or 0);
        end, obj);

    obj._e_event130 = obj.Barrinha5:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha5.visible = false;
        end, obj);

    obj._e_event131 = obj.Barrinha5:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 5;
            							sheet.AtributoBarrinha = sheet.equipamentoCorpo;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha5Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha5ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha5Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha5ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha5);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event132 = obj.InfoBarrinha5:addEventListener("onResize",
        function (self)
            self.InfoBarrinha5.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event133 = obj.dataLink54:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha5.color = "Green";
        end, obj);

    obj._e_event134 = obj.rectangle31:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPunhos()
        end, obj);

    obj._e_event135 = obj.edit198:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPunhos()
        end, obj);

    obj._e_event136 = obj.textEditor10:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPunhos()
        end, obj);

    obj._e_event137 = obj.edit199:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPunhos()
        end, obj);

    obj._e_event138 = obj.edit200:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPunhos()
        end, obj);

    obj._e_event139 = obj.Barrinha6:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPunhos();
            							self.CorBarrinha6.color = "Green";
            							self.ValoresBarrinha6.visible = true;
            							sheet.InfoBarrinha6 = (sheet.Barrinha6Valor or 0) .. "/"	.. (sheet.Barrinha6ValorMax or 0);
        end, obj);

    obj._e_event140 = obj.Barrinha6:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha6.visible = false;
        end, obj);

    obj._e_event141 = obj.Barrinha6:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 6;
            							sheet.AtributoBarrinha = sheet.equipamentoPunhos;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha6Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha6ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha6Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha6ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha6);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event142 = obj.InfoBarrinha6:addEventListener("onResize",
        function (self)
            self.InfoBarrinha6.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event143 = obj.dataLink55:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha6.color = "Green";
        end, obj);

    obj._e_event144 = obj.rectangle32:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCintura()
        end, obj);

    obj._e_event145 = obj.edit201:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCintura()
        end, obj);

    obj._e_event146 = obj.textEditor11:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCintura()
        end, obj);

    obj._e_event147 = obj.edit202:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCintura()
        end, obj);

    obj._e_event148 = obj.edit203:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCintura()
        end, obj);

    obj._e_event149 = obj.Barrinha7:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotCintura();
            							self.CorBarrinha7.color = "Green";
            							self.ValoresBarrinha7.visible = true;
            							sheet.InfoBarrinha7 = (sheet.Barrinha7Valor or 0) .. "/"	.. (sheet.Barrinha7ValorMax or 0);
        end, obj);

    obj._e_event150 = obj.Barrinha7:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha7.visible = false;
        end, obj);

    obj._e_event151 = obj.Barrinha7:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 7;
            							sheet.AtributoBarrinha = sheet.equipamentoCintura;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha7Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha7ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha7Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha7ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha7);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event152 = obj.InfoBarrinha7:addEventListener("onResize",
        function (self)
            self.InfoBarrinha7.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event153 = obj.dataLink56:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha7.color = "Green";
        end, obj);

    obj._e_event154 = obj.rectangle33:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotMaos()
        end, obj);

    obj._e_event155 = obj.edit204:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotMaos()
        end, obj);

    obj._e_event156 = obj.textEditor12:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotMaos()
        end, obj);

    obj._e_event157 = obj.edit205:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotMaos()
        end, obj);

    obj._e_event158 = obj.edit206:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotMaos()
        end, obj);

    obj._e_event159 = obj.Barrinha8:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotMaos();
            							self.CorBarrinha8.color = "Green";
            							self.ValoresBarrinha8.visible = true;
            							sheet.InfoBarrinha8 = (sheet.Barrinha8Valor or 0) .. "/"	.. (sheet.Barrinha8ValorMax or 0);
        end, obj);

    obj._e_event160 = obj.Barrinha8:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha8.visible = false;
        end, obj);

    obj._e_event161 = obj.Barrinha8:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 8;
            							sheet.AtributoBarrinha = sheet.equipamentoMaos;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha8Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha8ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha8Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha8ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha8);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event162 = obj.InfoBarrinha8:addEventListener("onResize",
        function (self)
            self.InfoBarrinha8.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event163 = obj.dataLink57:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha8.color = "Green";
        end, obj);

    obj._e_event164 = obj.rectangle34:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDedosI()
        end, obj);

    obj._e_event165 = obj.edit207:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDedosI()
        end, obj);

    obj._e_event166 = obj.textEditor13:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDedosI()
        end, obj);

    obj._e_event167 = obj.edit208:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDedosI()
        end, obj);

    obj._e_event168 = obj.edit209:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDedosI()
        end, obj);

    obj._e_event169 = obj.Barrinha9:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDedosI();
            							self.CorBarrinha9.color = "Green";
            							self.ValoresBarrinha9.visible = true;
            							sheet.InfoBarrinha9 = (sheet.Barrinha9Valor or 0) .. "/"	.. (sheet.Barrinha9ValorMax or 0);
        end, obj);

    obj._e_event170 = obj.Barrinha9:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha9.visible = false;
        end, obj);

    obj._e_event171 = obj.Barrinha9:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 9;
            							sheet.AtributoBarrinha = sheet.equipamentoDedosI;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha9Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha9ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha9Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha9ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha9);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event172 = obj.InfoBarrinha9:addEventListener("onResize",
        function (self)
            self.InfoBarrinha9.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event173 = obj.dataLink58:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha9.color = "Green";
        end, obj);

    obj._e_event174 = obj.rectangle35:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDesdosII()
        end, obj);

    obj._e_event175 = obj.edit210:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDesdosII()
        end, obj);

    obj._e_event176 = obj.textEditor14:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDesdosII()
        end, obj);

    obj._e_event177 = obj.edit211:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDesdosII()
        end, obj);

    obj._e_event178 = obj.edit212:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDesdosII()
        end, obj);

    obj._e_event179 = obj.Barrinha10:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotDesdosII();
            							self.CorBarrinha10.color = "Green";
            							self.ValoresBarrinha10.visible = true;
            							sheet.InfoBarrinha10 = (sheet.Barrinha10Valor or 0) .. "/"	.. (sheet.Barrinha10ValorMax or 0);
        end, obj);

    obj._e_event180 = obj.Barrinha10:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha10.visible = false;
        end, obj);

    obj._e_event181 = obj.Barrinha10:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 10;
            							sheet.AtributoBarrinha = sheet.equipamentoDesdosII;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha10Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha10ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha10Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha10ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha10);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event182 = obj.InfoBarrinha10:addEventListener("onResize",
        function (self)
            self.InfoBarrinha10.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event183 = obj.dataLink59:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha10.color = "Green";
        end, obj);

    obj._e_event184 = obj.rectangle36:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPes()
        end, obj);

    obj._e_event185 = obj.edit213:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPes()
        end, obj);

    obj._e_event186 = obj.textEditor15:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPes()
        end, obj);

    obj._e_event187 = obj.edit214:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPes()
        end, obj);

    obj._e_event188 = obj.edit215:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPes()
        end, obj);

    obj._e_event189 = obj.Barrinha11:addEventListener("onMouseEnter",
        function (self)
            loadImgSlotPes();
            							self.CorBarrinha11.color = "Green";
            							self.ValoresBarrinha11.visible = true;
            							sheet.InfoBarrinha11 = (sheet.Barrinha11Valor or 0) .. "/"	.. (sheet.Barrinha11ValorMax or 0);
        end, obj);

    obj._e_event190 = obj.Barrinha11:addEventListener("onMouseLeave",
        function (self)
            self.ValoresBarrinha11.visible = false;
        end, obj);

    obj._e_event191 = obj.Barrinha11:addEventListener("onDblClick",
        function (self)
            sheet.BarrinhaID = 11;
            							sheet.AtributoBarrinha = sheet.equipamentoPes;
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha11Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha11ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha11Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha11ValorMax;
            							self.CorPopupBarrinhas.color = "Green";
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show("top", self.Barrinha11);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
        end, obj);

    obj._e_event192 = obj.InfoBarrinha11:addEventListener("onResize",
        function (self)
            self.InfoBarrinha11.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event193 = obj.dataLink60:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Barrinha11.color = "Green";
        end, obj);

    obj._e_event194 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclListaDasArmas:append();
        end, obj);

    obj._e_event195 = obj.button6:addEventListener("onClick",
        function (self)
            self.rclConsumiveis:append();
        end, obj);

    obj._e_event196 = obj.dataLink61:addEventListener("onChange",
        function (self, field, oldValue, newValue)
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
            					sheet.gastos = mod .. "PO";
            
            					restante = string.gsub(restante, "%.", "_");
            					while true do  
            						restante, k = string.gsub(restante, "^(-?%d+)(%d%d%d)", '%1,%2')
            						if (k==0) then
            							break
            							end
            						end
            					restante = string.gsub(restante, ",", ".");
            					restante = string.gsub(restante, "_", ",");
            					sheet.dinheiroRestante = restante .. "PO";
            
            
            				end;
        end, obj);

    obj._e_event197 = obj.dataLink62:addEventListener("onChange",
        function (self, field, oldValue, newValue)
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

    obj._e_event198 = obj.dataLink63:addEventListener("onChange",
        function (self, field, oldValue, newValue)
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

    obj._e_event199 = obj.dataLink64:addEventListener("onChange",
        function (self, field, oldValue, newValue)
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

    obj._e_event200 = obj.button7:addEventListener("onClick",
        function (self)
            System.setClipboardText(sheet.historia);
        end, obj);

    obj._e_event201 = obj.button8:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. (node.iniciativaComp or 0));
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de iniciativa de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event202 = obj.button9:addEventListener("onClick",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. (node.agarrarComp or 0));
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de agarrar de " .. (node.nomeComp or "Companheiro"));
        end, obj);

    obj._e_event203 = obj.button10:addEventListener("onClick",
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

    obj._e_event204 = obj.edit276:addEventListener("onChange",
        function (self)
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

    obj._e_event205 = obj.button11:addEventListener("onClick",
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

    obj._e_event206 = obj.edit278:addEventListener("onChange",
        function (self)
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

    obj._e_event207 = obj.button12:addEventListener("onClick",
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

    obj._e_event208 = obj.edit280:addEventListener("onChange",
        function (self)
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

    obj._e_event209 = obj.button13:addEventListener("onClick",
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

    obj._e_event210 = obj.edit282:addEventListener("onChange",
        function (self)
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

    obj._e_event211 = obj.button14:addEventListener("onClick",
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

    obj._e_event212 = obj.edit284:addEventListener("onChange",
        function (self)
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

    obj._e_event213 = obj.button15:addEventListener("onClick",
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

    obj._e_event214 = obj.edit286:addEventListener("onChange",
        function (self)
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

    obj._e_event215 = obj.button16:addEventListener("onClick",
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

    obj._e_event216 = obj.button17:addEventListener("onClick",
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

    obj._e_event217 = obj.button18:addEventListener("onClick",
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

    obj._e_event218 = obj.dataLink65:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nodes = ndb.getChildNodes(sheet.campoDosCompanheiros);   
            					local total = 0;
            					for i=1, #nodes, 1 do
            						total = total + (getNumber(nodes[i].precoInventorioComp) or 0);
            					end
            					sheet.precoInventorioComp = total;
        end, obj);

    obj._e_event219 = obj.button19:addEventListener("onClick",
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

    obj._e_event220 = obj.image2:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", self.rclListaDosCompanheiros.selectedNode.avatarComp);
        end, obj);

    obj._e_event221 = obj.button20:addEventListener("onClick",
        function (self)
            self.rclListaDosCompanheiros:append();
        end, obj);

    obj._e_event222 = obj.rclListaDosCompanheiros:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDosCompanheiros.selectedNode;
            				self.boxDetalhesDoCompanheiro.node = node;
            				self.boxDetalhesDoCompanheiro.visible = (node ~= nil);
        end, obj);

    obj._e_event223 = obj.rclListaDosCompanheiros:addEventListener("onEndEnumeration",
        function (self)
            if self.rclListaDosCompanheiros.selectedNode == nil and sheet ~= nil then
            					local nodes = ndb.getChildNodes(sheet.campoDosCompanheiros);               
            					if #nodes > 0 then
            						self.rclListaDosCompanheiros.selectedNode = nodes[1];
            					end;
            				end;
        end, obj);

    obj._e_event224 = obj.button21:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20RPG%20meister/README.md')
        end, obj);

    obj._e_event225 = obj.button22:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20RPG%20meister/output/Ficha%20RPG%20meister.rpk?raw=true')
        end, obj);

    obj._e_event226 = obj.button23:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20RPG%20meister/__Tutorial/Ficha%20RPG%20meister%20-%20Tutorial.docx?raw=true')
        end, obj);

    obj._e_event227 = obj.button24:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event228 = obj.button25:addEventListener("onClick",
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

    obj._e_event229 = obj.button26:addEventListener("onClick",
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
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
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
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.label327 ~= nil then self.label327:destroy(); self.label327 = nil; end;
        if self.rclflwMagicRecordList7 ~= nil then self.rclflwMagicRecordList7:destroy(); self.rclflwMagicRecordList7 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.flowPart260 ~= nil then self.flowPart260:destroy(); self.flowPart260 = nil; end;
        if self.flowPart259 ~= nil then self.flowPart259:destroy(); self.flowPart259 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.frmFichaRPGmeister1_svg ~= nil then self.frmFichaRPGmeister1_svg:destroy(); self.frmFichaRPGmeister1_svg = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.frmFichaRPGmeister6_svg ~= nil then self.frmFichaRPGmeister6_svg:destroy(); self.frmFichaRPGmeister6_svg = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.flowPart241 ~= nil then self.flowPart241:destroy(); self.flowPart241 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.InfoBarrinha6 ~= nil then self.InfoBarrinha6:destroy(); self.InfoBarrinha6 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label307 ~= nil then self.label307:destroy(); self.label307 = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.flowPart236 ~= nil then self.flowPart236:destroy(); self.flowPart236 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.btnNovoflwMagicRecordList6 ~= nil then self.btnNovoflwMagicRecordList6:destroy(); self.btnNovoflwMagicRecordList6 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.panupperGridMagicBox3 ~= nil then self.panupperGridMagicBox3:destroy(); self.panupperGridMagicBox3 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.label324 ~= nil then self.label324:destroy(); self.label324 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.imageCheckBox28 ~= nil then self.imageCheckBox28:destroy(); self.imageCheckBox28 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.BarrinhaPopup ~= nil then self.BarrinhaPopup:destroy(); self.BarrinhaPopup = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.panupperGridMagicBox1 ~= nil then self.panupperGridMagicBox1:destroy(); self.panupperGridMagicBox1 = nil; end;
        if self.flowPart142 ~= nil then self.flowPart142:destroy(); self.flowPart142 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.label323 ~= nil then self.label323:destroy(); self.label323 = nil; end;
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
        if self.upperGridMagicEditBox1 ~= nil then self.upperGridMagicEditBox1:destroy(); self.upperGridMagicEditBox1 = nil; end;
        if self.label306 ~= nil then self.label306:destroy(); self.label306 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.rclListaDosCompanheiros ~= nil then self.rclListaDosCompanheiros:destroy(); self.rclListaDosCompanheiros = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.imageCheckBox39 ~= nil then self.imageCheckBox39:destroy(); self.imageCheckBox39 = nil; end;
        if self.InfoBarrinha8 ~= nil then self.InfoBarrinha8:destroy(); self.InfoBarrinha8 = nil; end;
        if self.flowPart144 ~= nil then self.flowPart144:destroy(); self.flowPart144 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.edtNome1 ~= nil then self.edtNome1:destroy(); self.edtNome1 = nil; end;
        if self.rclflwMagicRecordList2 ~= nil then self.rclflwMagicRecordList2:destroy(); self.rclflwMagicRecordList2 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.flowPart183 ~= nil then self.flowPart183:destroy(); self.flowPart183 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.horzLine22 ~= nil then self.horzLine22:destroy(); self.horzLine22 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.imageCheckBox23 ~= nil then self.imageCheckBox23:destroy(); self.imageCheckBox23 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.flowPart274 ~= nil then self.flowPart274:destroy(); self.flowPart274 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.popArma ~= nil then self.popArma:destroy(); self.popArma = nil; end;
        if self.flowPart232 ~= nil then self.flowPart232:destroy(); self.flowPart232 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rclListaDasCaracteristicasClasse ~= nil then self.rclListaDasCaracteristicasClasse:destroy(); self.rclListaDasCaracteristicasClasse = nil; end;
        if self.label317 ~= nil then self.label317:destroy(); self.label317 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.flowPart257 ~= nil then self.flowPart257:destroy(); self.flowPart257 = nil; end;
        if self.flowPart222 ~= nil then self.flowPart222:destroy(); self.flowPart222 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.flowPart234 ~= nil then self.flowPart234:destroy(); self.flowPart234 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.flwMagicRecordList8 ~= nil then self.flwMagicRecordList8:destroy(); self.flwMagicRecordList8 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.frame2 ~= nil then self.frame2:destroy(); self.frame2 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.flowPart180 ~= nil then self.flowPart180:destroy(); self.flowPart180 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.CorBarrinha1 ~= nil then self.CorBarrinha1:destroy(); self.CorBarrinha1 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.layBottomflwMagicRecordList8 ~= nil then self.layBottomflwMagicRecordList8:destroy(); self.layBottomflwMagicRecordList8 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.InfoBarrinha11 ~= nil then self.InfoBarrinha11:destroy(); self.InfoBarrinha11 = nil; end;
        if self.label298 ~= nil then self.label298:destroy(); self.label298 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.Barrinha3 ~= nil then self.Barrinha3:destroy(); self.Barrinha3 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.flowPart155 ~= nil then self.flowPart155:destroy(); self.flowPart155 = nil; end;
        if self.flowPart261 ~= nil then self.flowPart261:destroy(); self.flowPart261 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.flowPart248 ~= nil then self.flowPart248:destroy(); self.flowPart248 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label301 ~= nil then self.label301:destroy(); self.label301 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.CorBarrinha4 ~= nil then self.CorBarrinha4:destroy(); self.CorBarrinha4 = nil; end;
        if self.flowPart230 ~= nil then self.flowPart230:destroy(); self.flowPart230 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.flowLayout39 ~= nil then self.flowLayout39:destroy(); self.flowLayout39 = nil; end;
        if self.popResistencia ~= nil then self.popResistencia:destroy(); self.popResistencia = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclflwMagicRecordList9 ~= nil then self.rclflwMagicRecordList9:destroy(); self.rclflwMagicRecordList9 = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.textEditor35 ~= nil then self.textEditor35:destroy(); self.textEditor35 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.flowPart202 ~= nil then self.flowPart202:destroy(); self.flowPart202 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.flowPart237 ~= nil then self.flowPart237:destroy(); self.flowPart237 = nil; end;
        if self.flowPart174 ~= nil then self.flowPart174:destroy(); self.flowPart174 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.flowPart252 ~= nil then self.flowPart252:destroy(); self.flowPart252 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.flowPart214 ~= nil then self.flowPart214:destroy(); self.flowPart214 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.flowPart197 ~= nil then self.flowPart197:destroy(); self.flowPart197 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.flowLayout40 ~= nil then self.flowLayout40:destroy(); self.flowLayout40 = nil; end;
        if self.textEditor26 ~= nil then self.textEditor26:destroy(); self.textEditor26 = nil; end;
        if self.imageCheckBox26 ~= nil then self.imageCheckBox26:destroy(); self.imageCheckBox26 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.btnNovoflwMagicRecordList5 ~= nil then self.btnNovoflwMagicRecordList5:destroy(); self.btnNovoflwMagicRecordList5 = nil; end;
        if self.horzLine25 ~= nil then self.horzLine25:destroy(); self.horzLine25 = nil; end;
        if self.ValorAtualBarrinha ~= nil then self.ValorAtualBarrinha:destroy(); self.ValorAtualBarrinha = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.upperGridMagicBox1 ~= nil then self.upperGridMagicBox1:destroy(); self.upperGridMagicBox1 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label303 ~= nil then self.label303:destroy(); self.label303 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.flowPart210 ~= nil then self.flowPart210:destroy(); self.flowPart210 = nil; end;
        if self.cmbupperGridMagicBox1 ~= nil then self.cmbupperGridMagicBox1:destroy(); self.cmbupperGridMagicBox1 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowPart204 ~= nil then self.flowPart204:destroy(); self.flowPart204 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.flowPart179 ~= nil then self.flowPart179:destroy(); self.flowPart179 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.CorBarrinha8 ~= nil then self.CorBarrinha8:destroy(); self.CorBarrinha8 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.rclflwMagicRecordList8 ~= nil then self.rclflwMagicRecordList8:destroy(); self.rclflwMagicRecordList8 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.frmFichaRPGmeister8_svg ~= nil then self.frmFichaRPGmeister8_svg:destroy(); self.frmFichaRPGmeister8_svg = nil; end;
        if self.flowPart153 ~= nil then self.flowPart153:destroy(); self.flowPart153 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
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
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.btnNovoflwMagicRecordList1 ~= nil then self.btnNovoflwMagicRecordList1:destroy(); self.btnNovoflwMagicRecordList1 = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.flowPart151 ~= nil then self.flowPart151:destroy(); self.flowPart151 = nil; end;
        if self.rclflwMagicRecordList3 ~= nil then self.rclflwMagicRecordList3:destroy(); self.rclflwMagicRecordList3 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label322 ~= nil then self.label322:destroy(); self.label322 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.labupperGridMagicEditBox1 ~= nil then self.labupperGridMagicEditBox1:destroy(); self.labupperGridMagicEditBox1 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.flwNome1 ~= nil then self.flwNome1:destroy(); self.flwNome1 = nil; end;
        if self.flowPart165 ~= nil then self.flowPart165:destroy(); self.flowPart165 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.flowPart184 ~= nil then self.flowPart184:destroy(); self.flowPart184 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.CorBarrinha11 ~= nil then self.CorBarrinha11:destroy(); self.CorBarrinha11 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.fraUpperGridMagias ~= nil then self.fraUpperGridMagias:destroy(); self.fraUpperGridMagias = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.label299 ~= nil then self.label299:destroy(); self.label299 = nil; end;
        if self.flowPart181 ~= nil then self.flowPart181:destroy(); self.flowPart181 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.upperGridMagicBox2 ~= nil then self.upperGridMagicBox2:destroy(); self.upperGridMagicBox2 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flwMagicRecordList6 ~= nil then self.flwMagicRecordList6:destroy(); self.flwMagicRecordList6 = nil; end;
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
        if self.flowPart272 ~= nil then self.flowPart272:destroy(); self.flowPart272 = nil; end;
        if self.flowPart225 ~= nil then self.flowPart225:destroy(); self.flowPart225 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.flowPart223 ~= nil then self.flowPart223:destroy(); self.flowPart223 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.flowPart150 ~= nil then self.flowPart150:destroy(); self.flowPart150 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart190 ~= nil then self.flowPart190:destroy(); self.flowPart190 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.label302 ~= nil then self.label302:destroy(); self.label302 = nil; end;
        if self.btnNovoflwMagicRecordList9 ~= nil then self.btnNovoflwMagicRecordList9:destroy(); self.btnNovoflwMagicRecordList9 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.flowPart240 ~= nil then self.flowPart240:destroy(); self.flowPart240 = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.label321 ~= nil then self.label321:destroy(); self.label321 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.textEditor36 ~= nil then self.textEditor36:destroy(); self.textEditor36 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.flowPart231 ~= nil then self.flowPart231:destroy(); self.flowPart231 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.CorPopupBarrinhas ~= nil then self.CorPopupBarrinhas:destroy(); self.CorPopupBarrinhas = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.flowPart209 ~= nil then self.flowPart209:destroy(); self.flowPart209 = nil; end;
        if self.ValoresBarrinha11 ~= nil then self.ValoresBarrinha11:destroy(); self.ValoresBarrinha11 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.CorBarrinha5 ~= nil then self.CorBarrinha5:destroy(); self.CorBarrinha5 = nil; end;
        if self.flwMagicRecordList4 ~= nil then self.flwMagicRecordList4:destroy(); self.flwMagicRecordList4 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.rclListaDosTalentos ~= nil then self.rclListaDosTalentos:destroy(); self.rclListaDosTalentos = nil; end;
        if self.flowPart253 ~= nil then self.flowPart253:destroy(); self.flowPart253 = nil; end;
        if self.label305 ~= nil then self.label305:destroy(); self.label305 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.InfoBarrinha9 ~= nil then self.InfoBarrinha9:destroy(); self.InfoBarrinha9 = nil; end;
        if self.InfoBarrinha7 ~= nil then self.InfoBarrinha7:destroy(); self.InfoBarrinha7 = nil; end;
        if self.labupperGridMagicBox1 ~= nil then self.labupperGridMagicBox1:destroy(); self.labupperGridMagicBox1 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.layBottomflwMagicRecordList6 ~= nil then self.layBottomflwMagicRecordList6:destroy(); self.layBottomflwMagicRecordList6 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.flowPart220 ~= nil then self.flowPart220:destroy(); self.flowPart220 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.flowPart280 ~= nil then self.flowPart280:destroy(); self.flowPart280 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.frmFichaRPGmeister7_svg ~= nil then self.frmFichaRPGmeister7_svg:destroy(); self.frmFichaRPGmeister7_svg = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.horzLine23 ~= nil then self.horzLine23:destroy(); self.horzLine23 = nil; end;
        if self.imageCheckBox38 ~= nil then self.imageCheckBox38:destroy(); self.imageCheckBox38 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.layBottomflwMagicRecordList3 ~= nil then self.layBottomflwMagicRecordList3:destroy(); self.layBottomflwMagicRecordList3 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.label295 ~= nil then self.label295:destroy(); self.label295 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.flowPart244 ~= nil then self.flowPart244:destroy(); self.flowPart244 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.flowPart189 ~= nil then self.flowPart189:destroy(); self.flowPart189 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.flowPart249 ~= nil then self.flowPart249:destroy(); self.flowPart249 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.ValoresBarrinha6 ~= nil then self.ValoresBarrinha6:destroy(); self.ValoresBarrinha6 = nil; end;
        if self.flowPart216 ~= nil then self.flowPart216:destroy(); self.flowPart216 = nil; end;
        if self.flowPart149 ~= nil then self.flowPart149:destroy(); self.flowPart149 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.label309 ~= nil then self.label309:destroy(); self.label309 = nil; end;
        if self.flowPart270 ~= nil then self.flowPart270:destroy(); self.flowPart270 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.flowPart239 ~= nil then self.flowPart239:destroy(); self.flowPart239 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label297 ~= nil then self.label297:destroy(); self.label297 = nil; end;
        if self.flowPart228 ~= nil then self.flowPart228:destroy(); self.flowPart228 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.label326 ~= nil then self.label326:destroy(); self.label326 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.flowPart207 ~= nil then self.flowPart207:destroy(); self.flowPart207 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart166 ~= nil then self.flowPart166:destroy(); self.flowPart166 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.flowPart170 ~= nil then self.flowPart170:destroy(); self.flowPart170 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.flowPart267 ~= nil then self.flowPart267:destroy(); self.flowPart267 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.flowPart245 ~= nil then self.flowPart245:destroy(); self.flowPart245 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.flowPart143 ~= nil then self.flowPart143:destroy(); self.flowPart143 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.flowPart275 ~= nil then self.flowPart275:destroy(); self.flowPart275 = nil; end;
        if self.Barrinha4 ~= nil then self.Barrinha4:destroy(); self.Barrinha4 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.btnNovoflwMagicRecordList7 ~= nil then self.btnNovoflwMagicRecordList7:destroy(); self.btnNovoflwMagicRecordList7 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.flowLayout35 ~= nil then self.flowLayout35:destroy(); self.flowLayout35 = nil; end;
        if self.imageCheckBox24 ~= nil then self.imageCheckBox24:destroy(); self.imageCheckBox24 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.CorBarrinha9 ~= nil then self.CorBarrinha9:destroy(); self.CorBarrinha9 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.flowPart258 ~= nil then self.flowPart258:destroy(); self.flowPart258 = nil; end;
        if self.flowPart186 ~= nil then self.flowPart186:destroy(); self.flowPart186 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.textEditor33 ~= nil then self.textEditor33:destroy(); self.textEditor33 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.rclflwMagicRecordList10 ~= nil then self.rclflwMagicRecordList10:destroy(); self.rclflwMagicRecordList10 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.rclflwMagicRecordList6 ~= nil then self.rclflwMagicRecordList6:destroy(); self.rclflwMagicRecordList6 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.flowPart212 ~= nil then self.flowPart212:destroy(); self.flowPart212 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label316 ~= nil then self.label316:destroy(); self.label316 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.labupperGridMagicBox2 ~= nil then self.labupperGridMagicBox2:destroy(); self.labupperGridMagicBox2 = nil; end;
        if self.flowPart201 ~= nil then self.flowPart201:destroy(); self.flowPart201 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.ValoresBarrinha3 ~= nil then self.ValoresBarrinha3:destroy(); self.ValoresBarrinha3 = nil; end;
        if self.flowPart164 ~= nil then self.flowPart164:destroy(); self.flowPart164 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.ValoresBarrinha8 ~= nil then self.ValoresBarrinha8:destroy(); self.ValoresBarrinha8 = nil; end;
        if self.ValoresBarrinha5 ~= nil then self.ValoresBarrinha5:destroy(); self.ValoresBarrinha5 = nil; end;
        if self.flowPart172 ~= nil then self.flowPart172:destroy(); self.flowPart172 = nil; end;
        if self.ValoresBarrinha0 ~= nil then self.ValoresBarrinha0:destroy(); self.ValoresBarrinha0 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.flowPart221 ~= nil then self.flowPart221:destroy(); self.flowPart221 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.label311 ~= nil then self.label311:destroy(); self.label311 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.flowPart265 ~= nil then self.flowPart265:destroy(); self.flowPart265 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.flowPart182 ~= nil then self.flowPart182:destroy(); self.flowPart182 = nil; end;
        if self.layBottomflwMagicRecordList7 ~= nil then self.layBottomflwMagicRecordList7:destroy(); self.layBottomflwMagicRecordList7 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.flowPart194 ~= nil then self.flowPart194:destroy(); self.flowPart194 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.imageCheckBox19 ~= nil then self.imageCheckBox19:destroy(); self.imageCheckBox19 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.btnNovoflwMagicRecordList4 ~= nil then self.btnNovoflwMagicRecordList4:destroy(); self.btnNovoflwMagicRecordList4 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.flowPart238 ~= nil then self.flowPart238:destroy(); self.flowPart238 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.popManeuver ~= nil then self.popManeuver:destroy(); self.popManeuver = nil; end;
        if self.rclConsumiveis ~= nil then self.rclConsumiveis:destroy(); self.rclConsumiveis = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.rclListaDosOutros ~= nil then self.rclListaDosOutros:destroy(); self.rclListaDosOutros = nil; end;
        if self.flowPart146 ~= nil then self.flowPart146:destroy(); self.flowPart146 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart171 ~= nil then self.flowPart171:destroy(); self.flowPart171 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.flwMagicRecordList10 ~= nil then self.flwMagicRecordList10:destroy(); self.flwMagicRecordList10 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.textEditor28 ~= nil then self.textEditor28:destroy(); self.textEditor28 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.flowPart251 ~= nil then self.flowPart251:destroy(); self.flowPart251 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.InfoBarrinha3 ~= nil then self.InfoBarrinha3:destroy(); self.InfoBarrinha3 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.CorBarrinha6 ~= nil then self.CorBarrinha6:destroy(); self.CorBarrinha6 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.flowPart129 ~= nil then self.flowPart129:destroy(); self.flowPart129 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.flowPart193 ~= nil then self.flowPart193:destroy(); self.flowPart193 = nil; end;
        if self.frmFichaRPGmeister4_svg ~= nil then self.frmFichaRPGmeister4_svg:destroy(); self.frmFichaRPGmeister4_svg = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.flowPart268 ~= nil then self.flowPart268:destroy(); self.flowPart268 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.textEditor38 ~= nil then self.textEditor38:destroy(); self.textEditor38 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.flowPart243 ~= nil then self.flowPart243:destroy(); self.flowPart243 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.Barrinha9 ~= nil then self.Barrinha9:destroy(); self.Barrinha9 = nil; end;
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
        if self.upperGridMagicBox3 ~= nil then self.upperGridMagicBox3:destroy(); self.upperGridMagicBox3 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.fraUpperGridFrente ~= nil then self.fraUpperGridFrente:destroy(); self.fraUpperGridFrente = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flowPart219 ~= nil then self.flowPart219:destroy(); self.flowPart219 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.imageCheckBox21 ~= nil then self.imageCheckBox21:destroy(); self.imageCheckBox21 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.flowPart145 ~= nil then self.flowPart145:destroy(); self.flowPart145 = nil; end;
        if self.imageCheckBox33 ~= nil then self.imageCheckBox33:destroy(); self.imageCheckBox33 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.labupperGridMagicBox3 ~= nil then self.labupperGridMagicBox3:destroy(); self.labupperGridMagicBox3 = nil; end;
        if self.Barrinha11 ~= nil then self.Barrinha11:destroy(); self.Barrinha11 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.flowPart246 ~= nil then self.flowPart246:destroy(); self.flowPart246 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.flowPart215 ~= nil then self.flowPart215:destroy(); self.flowPart215 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.flowPart199 ~= nil then self.flowPart199:destroy(); self.flowPart199 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.frmFichaRPGmeister9_svg ~= nil then self.frmFichaRPGmeister9_svg:destroy(); self.frmFichaRPGmeister9_svg = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layBottomflwMagicRecordList9 ~= nil then self.layBottomflwMagicRecordList9:destroy(); self.layBottomflwMagicRecordList9 = nil; end;
        if self.flwMagicRecordList9 ~= nil then self.flwMagicRecordList9:destroy(); self.flwMagicRecordList9 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.label325 ~= nil then self.label325:destroy(); self.label325 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.imageCheckBox36 ~= nil then self.imageCheckBox36:destroy(); self.imageCheckBox36 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.imageCheckBox32 ~= nil then self.imageCheckBox32:destroy(); self.imageCheckBox32 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.flwMagicRecordList1 ~= nil then self.flwMagicRecordList1:destroy(); self.flwMagicRecordList1 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.InfoBarrinha1 ~= nil then self.InfoBarrinha1:destroy(); self.InfoBarrinha1 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.layBottomflwMagicRecordList2 ~= nil then self.layBottomflwMagicRecordList2:destroy(); self.layBottomflwMagicRecordList2 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.flowPart205 ~= nil then self.flowPart205:destroy(); self.flowPart205 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.imageCheckBox22 ~= nil then self.imageCheckBox22:destroy(); self.imageCheckBox22 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.flowPart195 ~= nil then self.flowPart195:destroy(); self.flowPart195 = nil; end;
        if self.flowPart188 ~= nil then self.flowPart188:destroy(); self.flowPart188 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.flowPart276 ~= nil then self.flowPart276:destroy(); self.flowPart276 = nil; end;
        if self.imageCheckBox29 ~= nil then self.imageCheckBox29:destroy(); self.imageCheckBox29 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.layBottomflwMagicRecordList4 ~= nil then self.layBottomflwMagicRecordList4:destroy(); self.layBottomflwMagicRecordList4 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.fraLayAtributos ~= nil then self.fraLayAtributos:destroy(); self.fraLayAtributos = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.label304 ~= nil then self.label304:destroy(); self.label304 = nil; end;
        if self.CorBarrinha7 ~= nil then self.CorBarrinha7:destroy(); self.CorBarrinha7 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.ValoresBarrinha9 ~= nil then self.ValoresBarrinha9:destroy(); self.ValoresBarrinha9 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.horzLine26 ~= nil then self.horzLine26:destroy(); self.horzLine26 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.flowPart271 ~= nil then self.flowPart271:destroy(); self.flowPart271 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.flowLayout36 ~= nil then self.flowLayout36:destroy(); self.flowLayout36 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.Barrinha7 ~= nil then self.Barrinha7:destroy(); self.Barrinha7 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.flowLayout37 ~= nil then self.flowLayout37:destroy(); self.flowLayout37 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.flowPart224 ~= nil then self.flowPart224:destroy(); self.flowPart224 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.boxDetalhesDoCompanheiro ~= nil then self.boxDetalhesDoCompanheiro:destroy(); self.boxDetalhesDoCompanheiro = nil; end;
        if self.textEditor32 ~= nil then self.textEditor32:destroy(); self.textEditor32 = nil; end;
        if self.popCA ~= nil then self.popCA:destroy(); self.popCA = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.flowPart198 ~= nil then self.flowPart198:destroy(); self.flowPart198 = nil; end;
        if self.flowPart187 ~= nil then self.flowPart187:destroy(); self.flowPart187 = nil; end;
        if self.flowPart192 ~= nil then self.flowPart192:destroy(); self.flowPart192 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.Barrinha1 ~= nil then self.Barrinha1:destroy(); self.Barrinha1 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.flwMagicRecordList3 ~= nil then self.flwMagicRecordList3:destroy(); self.flwMagicRecordList3 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.rclflwMagicRecordList5 ~= nil then self.rclflwMagicRecordList5:destroy(); self.rclflwMagicRecordList5 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.flowPart263 ~= nil then self.flowPart263:destroy(); self.flowPart263 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.imageCheckBox31 ~= nil then self.imageCheckBox31:destroy(); self.imageCheckBox31 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.InfoBarrinha2 ~= nil then self.InfoBarrinha2:destroy(); self.InfoBarrinha2 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowPart254 ~= nil then self.flowPart254:destroy(); self.flowPart254 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.flwMagicRecordList7 ~= nil then self.flwMagicRecordList7:destroy(); self.flwMagicRecordList7 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.flowPart279 ~= nil then self.flowPart279:destroy(); self.flowPart279 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.flowPart250 ~= nil then self.flowPart250:destroy(); self.flowPart250 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.label318 ~= nil then self.label318:destroy(); self.label318 = nil; end;
        if self.ValoresBarrinha2 ~= nil then self.ValoresBarrinha2:destroy(); self.ValoresBarrinha2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.ValoresBarrinha10 ~= nil then self.ValoresBarrinha10:destroy(); self.ValoresBarrinha10 = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.panupperGridMagicEditBox1 ~= nil then self.panupperGridMagicEditBox1:destroy(); self.panupperGridMagicEditBox1 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.Barrinha5 ~= nil then self.Barrinha5:destroy(); self.Barrinha5 = nil; end;
        if self.flowPart191 ~= nil then self.flowPart191:destroy(); self.flowPart191 = nil; end;
        if self.textEditor34 ~= nil then self.textEditor34:destroy(); self.textEditor34 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.Barrinha8 ~= nil then self.Barrinha8:destroy(); self.Barrinha8 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.Barrinha0 ~= nil then self.Barrinha0:destroy(); self.Barrinha0 = nil; end;
        if self.imageCheckBox35 ~= nil then self.imageCheckBox35:destroy(); self.imageCheckBox35 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.flowPart242 ~= nil then self.flowPart242:destroy(); self.flowPart242 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.flowPart218 ~= nil then self.flowPart218:destroy(); self.flowPart218 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.labupperGridMagicBox3val ~= nil then self.labupperGridMagicBox3val:destroy(); self.labupperGridMagicBox3val = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.imageCheckBox30 ~= nil then self.imageCheckBox30:destroy(); self.imageCheckBox30 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.horzLine21 ~= nil then self.horzLine21:destroy(); self.horzLine21 = nil; end;
        if self.label300 ~= nil then self.label300:destroy(); self.label300 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.flowPart156 ~= nil then self.flowPart156:destroy(); self.flowPart156 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.layBottomflwMagicRecordList1 ~= nil then self.layBottomflwMagicRecordList1:destroy(); self.layBottomflwMagicRecordList1 = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.flowPart148 ~= nil then self.flowPart148:destroy(); self.flowPart148 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.popAtributo ~= nil then self.popAtributo:destroy(); self.popAtributo = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label308 ~= nil then self.label308:destroy(); self.label308 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.flowPart177 ~= nil then self.flowPart177:destroy(); self.flowPart177 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.imageCheckBox25 ~= nil then self.imageCheckBox25:destroy(); self.imageCheckBox25 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.flowPart211 ~= nil then self.flowPart211:destroy(); self.flowPart211 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.rclListaDasArmas ~= nil then self.rclListaDasArmas:destroy(); self.rclListaDasArmas = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.InfoBarrinha10 ~= nil then self.InfoBarrinha10:destroy(); self.InfoBarrinha10 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.imageCheckBox27 ~= nil then self.imageCheckBox27:destroy(); self.imageCheckBox27 = nil; end;
        if self.flowPart217 ~= nil then self.flowPart217:destroy(); self.flowPart217 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.flowPart200 ~= nil then self.flowPart200:destroy(); self.flowPart200 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.rclflwMagicRecordList4 ~= nil then self.rclflwMagicRecordList4:destroy(); self.rclflwMagicRecordList4 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.ValoresBarrinha4 ~= nil then self.ValoresBarrinha4:destroy(); self.ValoresBarrinha4 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.flowPart247 ~= nil then self.flowPart247:destroy(); self.flowPart247 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.flwMagicRecordList5 ~= nil then self.flwMagicRecordList5:destroy(); self.flwMagicRecordList5 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.flowPart157 ~= nil then self.flowPart157:destroy(); self.flowPart157 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart203 ~= nil then self.flowPart203:destroy(); self.flowPart203 = nil; end;
        if self.flowPart233 ~= nil then self.flowPart233:destroy(); self.flowPart233 = nil; end;
        if self.flowPart161 ~= nil then self.flowPart161:destroy(); self.flowPart161 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.btnNovoflwMagicRecordList10 ~= nil then self.btnNovoflwMagicRecordList10:destroy(); self.btnNovoflwMagicRecordList10 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label319 ~= nil then self.label319:destroy(); self.label319 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.flwMagicRecordList2 ~= nil then self.flwMagicRecordList2:destroy(); self.flwMagicRecordList2 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.CorBarrinha10 ~= nil then self.CorBarrinha10:destroy(); self.CorBarrinha10 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.btnNovoflwMagicRecordList3 ~= nil then self.btnNovoflwMagicRecordList3:destroy(); self.btnNovoflwMagicRecordList3 = nil; end;
        if self.imageCheckBox37 ~= nil then self.imageCheckBox37:destroy(); self.imageCheckBox37 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.labupperGridMagicBox2val ~= nil then self.labupperGridMagicBox2val:destroy(); self.labupperGridMagicBox2val = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.CorBarrinha0 ~= nil then self.CorBarrinha0:destroy(); self.CorBarrinha0 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart132 ~= nil then self.flowPart132:destroy(); self.flowPart132 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.imageCheckBox20 ~= nil then self.imageCheckBox20:destroy(); self.imageCheckBox20 = nil; end;
        if self.label313 ~= nil then self.label313:destroy(); self.label313 = nil; end;
        if self.InfoBarrinha4 ~= nil then self.InfoBarrinha4:destroy(); self.InfoBarrinha4 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.flowPart235 ~= nil then self.flowPart235:destroy(); self.flowPart235 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.flowPart256 ~= nil then self.flowPart256:destroy(); self.flowPart256 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.Barrinha10 ~= nil then self.Barrinha10:destroy(); self.Barrinha10 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.textEditor30 ~= nil then self.textEditor30:destroy(); self.textEditor30 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.frame1 ~= nil then self.frame1:destroy(); self.frame1 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
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
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.flowPart162 ~= nil then self.flowPart162:destroy(); self.flowPart162 = nil; end;
        if self.flowPart176 ~= nil then self.flowPart176:destroy(); self.flowPart176 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.flowPart208 ~= nil then self.flowPart208:destroy(); self.flowPart208 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.flowPart281 ~= nil then self.flowPart281:destroy(); self.flowPart281 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.horzLine20 ~= nil then self.horzLine20:destroy(); self.horzLine20 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layNomeHolderFrente ~= nil then self.layNomeHolderFrente:destroy(); self.layNomeHolderFrente = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.Barrinha2 ~= nil then self.Barrinha2:destroy(); self.Barrinha2 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.flowPart163 ~= nil then self.flowPart163:destroy(); self.flowPart163 = nil; end;
        if self.flowPart226 ~= nil then self.flowPart226:destroy(); self.flowPart226 = nil; end;
        if self.flowLayout38 ~= nil then self.flowLayout38:destroy(); self.flowLayout38 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.label312 ~= nil then self.label312:destroy(); self.label312 = nil; end;
        if self.label310 ~= nil then self.label310:destroy(); self.label310 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.flowPart173 ~= nil then self.flowPart173:destroy(); self.flowPart173 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.flowPart255 ~= nil then self.flowPart255:destroy(); self.flowPart255 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.flowPart154 ~= nil then self.flowPart154:destroy(); self.flowPart154 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.InfoBarrinha5 ~= nil then self.InfoBarrinha5:destroy(); self.InfoBarrinha5 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.flowPart227 ~= nil then self.flowPart227:destroy(); self.flowPart227 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.flowPart278 ~= nil then self.flowPart278:destroy(); self.flowPart278 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flowPart160 ~= nil then self.flowPart160:destroy(); self.flowPart160 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.ValoresBarrinha7 ~= nil then self.ValoresBarrinha7:destroy(); self.ValoresBarrinha7 = nil; end;
        if self.imageCheckBox34 ~= nil then self.imageCheckBox34:destroy(); self.imageCheckBox34 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.popGrapple ~= nil then self.popGrapple:destroy(); self.popGrapple = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.flowPart273 ~= nil then self.flowPart273:destroy(); self.flowPart273 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.textEditor29 ~= nil then self.textEditor29:destroy(); self.textEditor29 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.CorBarrinha3 ~= nil then self.CorBarrinha3:destroy(); self.CorBarrinha3 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.flowPart262 ~= nil then self.flowPart262:destroy(); self.flowPart262 = nil; end;
        if self.ValorMaxBarrinha ~= nil then self.ValorMaxBarrinha:destroy(); self.ValorMaxBarrinha = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layBottomflwMagicRecordList5 ~= nil then self.layBottomflwMagicRecordList5:destroy(); self.layBottomflwMagicRecordList5 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.textEditor31 ~= nil then self.textEditor31:destroy(); self.textEditor31 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.ValoresBarrinha1 ~= nil then self.ValoresBarrinha1:destroy(); self.ValoresBarrinha1 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.flowPart277 ~= nil then self.flowPart277:destroy(); self.flowPart277 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.InfoBarrinha0 ~= nil then self.InfoBarrinha0:destroy(); self.InfoBarrinha0 = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.rclflwMagicRecordList1 ~= nil then self.rclflwMagicRecordList1:destroy(); self.rclflwMagicRecordList1 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.flowPart175 ~= nil then self.flowPart175:destroy(); self.flowPart175 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.panupperGridMagicBox2 ~= nil then self.panupperGridMagicBox2:destroy(); self.panupperGridMagicBox2 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.flowLayout41 ~= nil then self.flowLayout41:destroy(); self.flowLayout41 = nil; end;
        if self.textEditor37 ~= nil then self.textEditor37:destroy(); self.textEditor37 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.label320 ~= nil then self.label320:destroy(); self.label320 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.flowPart229 ~= nil then self.flowPart229:destroy(); self.flowPart229 = nil; end;
        if self.flowPart168 ~= nil then self.flowPart168:destroy(); self.flowPart168 = nil; end;
        if self.imageCheckBox41 ~= nil then self.imageCheckBox41:destroy(); self.imageCheckBox41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.fraMagiasLayout ~= nil then self.fraMagiasLayout:destroy(); self.fraMagiasLayout = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.Barrinha6 ~= nil then self.Barrinha6:destroy(); self.Barrinha6 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.flowPart269 ~= nil then self.flowPart269:destroy(); self.flowPart269 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.flowPart159 ~= nil then self.flowPart159:destroy(); self.flowPart159 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.flowPart264 ~= nil then self.flowPart264:destroy(); self.flowPart264 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.labNome1 ~= nil then self.labNome1:destroy(); self.labNome1 = nil; end;
        if self.imageCheckBox42 ~= nil then self.imageCheckBox42:destroy(); self.imageCheckBox42 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.flowPart185 ~= nil then self.flowPart185:destroy(); self.flowPart185 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.flowPart196 ~= nil then self.flowPart196:destroy(); self.flowPart196 = nil; end;
        if self.btnNovoflwMagicRecordList2 ~= nil then self.btnNovoflwMagicRecordList2:destroy(); self.btnNovoflwMagicRecordList2 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layBottomflwMagicRecordList10 ~= nil then self.layBottomflwMagicRecordList10:destroy(); self.layBottomflwMagicRecordList10 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.flowPart282 ~= nil then self.flowPart282:destroy(); self.flowPart282 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.btnNovoflwMagicRecordList8 ~= nil then self.btnNovoflwMagicRecordList8:destroy(); self.btnNovoflwMagicRecordList8 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.flowPart213 ~= nil then self.flowPart213:destroy(); self.flowPart213 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.flowPart266 ~= nil then self.flowPart266:destroy(); self.flowPart266 = nil; end;
        if self.label296 ~= nil then self.label296:destroy(); self.label296 = nil; end;
        if self.horzLine24 ~= nil then self.horzLine24:destroy(); self.horzLine24 = nil; end;
        if self.flowPart206 ~= nil then self.flowPart206:destroy(); self.flowPart206 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edtupperGridMagicEditBox1 ~= nil then self.edtupperGridMagicEditBox1:destroy(); self.edtupperGridMagicEditBox1 = nil; end;
        if self.imageCheckBox40 ~= nil then self.imageCheckBox40:destroy(); self.imageCheckBox40 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaDnDNext = {
    newEditor = newfrmFichaDnDNext, 
    new = newfrmFichaDnDNext, 
    name = "frmFichaDnDNext", 
    dataType = "Ambesek.FichaDnDNext", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha D&D Next", 
    description=""};

frmFichaDnDNext = _frmFichaDnDNext;
rrpg.registrarForm(_frmFichaDnDNext);
rrpg.registrarDataType(_frmFichaDnDNext);

return _frmFichaDnDNext;
