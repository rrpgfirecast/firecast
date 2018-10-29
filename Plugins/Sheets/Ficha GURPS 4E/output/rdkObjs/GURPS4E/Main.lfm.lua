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
    obj:setDataType("Ambesek.Nefertyne.GURPS");
    obj:setTitle("Ficha GURPS 4E");
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
        


    obj.popDetails = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDetails:setParent(obj);
    obj.popDetails:setName("popDetails");
    obj.popDetails:setWidth(250);
    obj.popDetails:setHeight(250);
    obj.popDetails:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popDetails, "autoScopeNode",  "false");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.popDetails);
    obj.label1:setAlign("top");
    obj.label1:setField("title");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontColor("white");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popDetails);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setVertAlign("leading");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(30);
    obj.flowPart1:setMaxWidth(400);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart1);
    obj.label2:setAlign("top");
    obj.label2:setFontSize(10);
    obj.label2:setText("CUSTO");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");
    obj.label2:setFontColor("#D0D0D0");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("custo");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("white");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popDetails);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.popDetails);
    obj.dataLink1:setField("custo");
    obj.dataLink1:setName("dataLink1");


            function pointCount()
                if sheet==nil then return end;

                local pontos = (tonumber(sheet.totalPontos) or 0)
                                - (tonumber(sheet.atributos_st) or 0)
                                - (tonumber(sheet.atributos_ht) or 0)
                                - (tonumber(sheet.atributos_dx) or 0)
                                - (tonumber(sheet.atributos_vt) or 0)
                                - (tonumber(sheet.atributos_iq) or 0)
                                - (tonumber(sheet.atributos_per) or 0)
                                - (tonumber(sheet.atributos_pv) or 0)
                                - (tonumber(sheet.atributos_pf) or 0)
                                - (tonumber(sheet.atributos_velocidade) or 0)
                                - (tonumber(sheet.atributos_deslocamento) or 0)
                                - (tonumber(sheet.vantagens_pontos) or 0)
                                - (tonumber(sheet.desvantagens_pontos) or 0)
                                - (tonumber(sheet.familiaridade_cultural) or 0)
                                - (tonumber(sheet.arquetipo_pontos) or 0)
                                - (tonumber(sheet.idiomas_pontos) or 0);

                local objetos = ndb.getChildNodes(sheet.listaDePericias);
                local custo = 0;
                for i=1, #objetos, 1 do
                    custo = custo + (tonumber(objetos[i].pts) or 0);
                end;
                pontos = pontos - custo;

                local objetos = ndb.getChildNodes(sheet.listaDeTecnicas);
                local custo = 0;
                for i=1, #objetos, 1 do
                    custo = custo + (tonumber(objetos[i].custo) or 0);
                end;
                sheet.custoTecnicas = custo;
                pontos = pontos - custo;

                local objetos = ndb.getChildNodes(sheet.listaDeMagias);
                local custo = 0;
                for i=1, #objetos, 1 do
                    custo = custo + (tonumber(objetos[i].custo) or 0);
                end;
                sheet.custoMagias = custo;
                pontos = pontos - custo;


                sheet.pontosRestantes = pontos;
            end;
        


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);

    obj.pgcPrincipal = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj.rectangle1);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
    obj.tab1:setTitle("Habilidades");
    obj.tab1:setName("tab1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.tab1);
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#40000000");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle2);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.fraFrenteLayoutNew = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraFrenteLayoutNew:setParent(obj.scrollBox1);
    obj.fraFrenteLayoutNew:setAlign("top");
    obj.fraFrenteLayoutNew:setHeight(500);
    obj.fraFrenteLayoutNew:setMargins({left=10, right=10, top=10});
    obj.fraFrenteLayoutNew:setAutoHeight(true);
    obj.fraFrenteLayoutNew:setHorzAlign("center");
    obj.fraFrenteLayoutNew:setLineSpacing(2);
    obj.fraFrenteLayoutNew:setName("fraFrenteLayoutNew");
    obj.fraFrenteLayoutNew:setMaxControlsPerLine(2);
    obj.fraFrenteLayoutNew:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraFrenteLayoutNew:setMinScaledWidth(150);
    obj.fraFrenteLayoutNew:setVertAlign("leading");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraFrenteLayoutNew);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMinScaledWidth(290);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout2:setVertAlign("leading");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flowLayout2);
    obj.flowLayout3:setVertAlign("leading");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMinScaledWidth(290);
    obj.flowLayout3:setMaxControlsPerLine(2);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setLineSpacing(10);
    obj.flowLayout3:setMargins({left=2, top=0, right=16, bottom=4});
    obj.flowLayout3:setAvoidScale(true);
    obj.flowLayout3:setFrameStyle("frames/panel1/frame.xml");
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setStepSizes({310, 420, 640, 760, 1150});

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout3);
    obj.flowPart2:setStepSizes({130});
    obj.flowPart2:setMinScaledWidth(130);
    obj.flowPart2:setHeight(160);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart2:setVertAlign("leading");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setLeft(0);
    obj.edit2:setTop(10);
    obj.edit2:setWidth(40);
    obj.edit2:setHeight(25);
    obj.edit2:setField("atributos_st");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");
    obj.edit2:setFontSize(15);
    obj.edit2:setFontColor("white");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart2);
    obj.label3:setLeft(40);
    obj.label3:setTop(10);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setText("ST");
    obj.label3:setFontSize(10);
    obj.label3:setWordWrap(true);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setTextTrimming("none");
    obj.label3:setName("label3");
    obj.label3:setFontColor("white");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart2);
    obj.edit3:setLeft(90);
    obj.edit3:setTop(10);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(25);
    obj.edit3:setField("atributos_mod_st");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setTransparent(true);
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(15);
    obj.edit3:setFontColor("white");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart2);
    obj.edit4:setLeft(0);
    obj.edit4:setTop(35);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("atributos_dx");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setTransparent(true);
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(15);
    obj.edit4:setFontColor("white");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart2);
    obj.label4:setLeft(40);
    obj.label4:setTop(35);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setText("DX");
    obj.label4:setFontSize(10);
    obj.label4:setWordWrap(true);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setTextTrimming("none");
    obj.label4:setName("label4");
    obj.label4:setFontColor("white");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart2);
    obj.edit5:setLeft(90);
    obj.edit5:setTop(35);
    obj.edit5:setWidth(40);
    obj.edit5:setHeight(25);
    obj.edit5:setField("atributos_mod_dx");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setTransparent(true);
    obj.edit5:setName("edit5");
    obj.edit5:setFontSize(15);
    obj.edit5:setFontColor("white");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart2);
    obj.edit6:setLeft(0);
    obj.edit6:setTop(60);
    obj.edit6:setWidth(40);
    obj.edit6:setHeight(25);
    obj.edit6:setField("atributos_iq");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setTransparent(true);
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(15);
    obj.edit6:setFontColor("white");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart2);
    obj.label5:setLeft(40);
    obj.label5:setTop(60);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setText("IQ");
    obj.label5:setFontSize(10);
    obj.label5:setWordWrap(true);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setTextTrimming("none");
    obj.label5:setName("label5");
    obj.label5:setFontColor("white");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart2);
    obj.edit7:setLeft(90);
    obj.edit7:setTop(60);
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(25);
    obj.edit7:setField("atributos_mod_iq");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setTransparent(true);
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(15);
    obj.edit7:setFontColor("white");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart2);
    obj.edit8:setLeft(0);
    obj.edit8:setTop(85);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(25);
    obj.edit8:setField("atributos_ht");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setTransparent(true);
    obj.edit8:setName("edit8");
    obj.edit8:setFontSize(15);
    obj.edit8:setFontColor("white");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart2);
    obj.label6:setLeft(40);
    obj.label6:setTop(85);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setText("HT");
    obj.label6:setFontSize(10);
    obj.label6:setWordWrap(true);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setTextTrimming("none");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart2);
    obj.edit9:setLeft(90);
    obj.edit9:setTop(85);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(25);
    obj.edit9:setField("atributos_mod_ht");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setTransparent(true);
    obj.edit9:setName("edit9");
    obj.edit9:setFontSize(15);
    obj.edit9:setFontColor("white");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart2);
    obj.edit10:setLeft(0);
    obj.edit10:setTop(110);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(25);
    obj.edit10:setField("atributos_per");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setTransparent(true);
    obj.edit10:setName("edit10");
    obj.edit10:setFontSize(15);
    obj.edit10:setFontColor("white");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart2);
    obj.label7:setLeft(40);
    obj.label7:setTop(110);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setText("Per");
    obj.label7:setFontSize(10);
    obj.label7:setWordWrap(true);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setTextTrimming("none");
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart2);
    obj.edit11:setLeft(90);
    obj.edit11:setTop(110);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(25);
    obj.edit11:setField("atributos_mod_per");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setTransparent(true);
    obj.edit11:setName("edit11");
    obj.edit11:setFontSize(15);
    obj.edit11:setFontColor("white");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart2);
    obj.edit12:setLeft(0);
    obj.edit12:setTop(135);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(25);
    obj.edit12:setField("atributos_vt");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setTransparent(true);
    obj.edit12:setName("edit12");
    obj.edit12:setFontSize(15);
    obj.edit12:setFontColor("white");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart2);
    obj.label8:setLeft(40);
    obj.label8:setTop(135);
    obj.label8:setWidth(50);
    obj.label8:setHeight(25);
    obj.label8:setText("Vont");
    obj.label8:setFontSize(10);
    obj.label8:setWordWrap(true);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setTextTrimming("none");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart2);
    obj.edit13:setLeft(90);
    obj.edit13:setTop(135);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(25);
    obj.edit13:setField("atributos_mod_vt");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setTransparent(true);
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(15);
    obj.edit13:setFontColor("white");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout3);
    obj.flowPart3:setStepSizes({130});
    obj.flowPart3:setMinScaledWidth(130);
    obj.flowPart3:setHeight(160);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart3);
    obj.edit14:setLeft(0);
    obj.edit14:setTop(10);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setField("atributos_deslocamento");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setTransparent(true);
    obj.edit14:setName("edit14");
    obj.edit14:setFontSize(15);
    obj.edit14:setFontColor("white");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart3);
    obj.label9:setLeft(40);
    obj.label9:setTop(10);
    obj.label9:setWidth(50);
    obj.label9:setHeight(25);
    obj.label9:setText("Desloc.");
    obj.label9:setFontSize(10);
    obj.label9:setWordWrap(true);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setTextTrimming("none");
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart3);
    obj.edit15:setLeft(90);
    obj.edit15:setTop(10);
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(25);
    obj.edit15:setField("atributos_mod_deslocamento");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setTransparent(true);
    obj.edit15:setName("edit15");
    obj.edit15:setFontSize(15);
    obj.edit15:setFontColor("white");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart3);
    obj.label10:setLeft(40);
    obj.label10:setTop(35);
    obj.label10:setWidth(50);
    obj.label10:setHeight(25);
    obj.label10:setText("Esquiva");
    obj.label10:setFontSize(10);
    obj.label10:setWordWrap(true);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setTextTrimming("none");
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart3);
    obj.label11:setLeft(90);
    obj.label11:setTop(35);
    obj.label11:setWidth(40);
    obj.label11:setHeight(25);
    obj.label11:setField("dodge");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");
    obj.label11:setFontColor("white");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flowPart3);
    obj.dataLink2:setField("atributos_mod_velocidade");
    obj.dataLink2:setName("dataLink2");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart3);
    obj.edit16:setLeft(0);
    obj.edit16:setTop(60);
    obj.edit16:setWidth(40);
    obj.edit16:setHeight(25);
    obj.edit16:setField("atributos_velocidade");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setTransparent(true);
    obj.edit16:setName("edit16");
    obj.edit16:setFontSize(15);
    obj.edit16:setFontColor("white");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart3);
    obj.label12:setLeft(40);
    obj.label12:setTop(60);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setText("Velocidade");
    obj.label12:setFontSize(10);
    obj.label12:setWordWrap(true);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setTextTrimming("none");
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart3);
    obj.edit17:setLeft(90);
    obj.edit17:setTop(60);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(25);
    obj.edit17:setField("atributos_mod_velocidade");
    obj.edit17:setType("float");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setTransparent(true);
    obj.edit17:setName("edit17");
    obj.edit17:setFontSize(15);
    obj.edit17:setFontColor("white");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart3);
    obj.label13:setLeft(40);
    obj.label13:setTop(85);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setText("Carga Base");
    obj.label13:setFontSize(10);
    obj.label13:setWordWrap(true);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setTextTrimming("none");
    obj.label13:setName("label13");
    obj.label13:setFontColor("white");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart3);
    obj.edit18:setLeft(90);
    obj.edit18:setTop(85);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(25);
    obj.edit18:setField("carga");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setTransparent(true);
    obj.edit18:setName("edit18");
    obj.edit18:setFontSize(15);
    obj.edit18:setFontColor("white");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart3);
    obj.label14:setLeft(40);
    obj.label14:setTop(110);
    obj.label14:setWidth(50);
    obj.label14:setHeight(25);
    obj.label14:setText("GdP");
    obj.label14:setFontSize(10);
    obj.label14:setWordWrap(true);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setTextTrimming("none");
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart3);
    obj.edit19:setLeft(90);
    obj.edit19:setTop(110);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(25);
    obj.edit19:setField("gdp");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setTransparent(true);
    obj.edit19:setName("edit19");
    obj.edit19:setFontSize(15);
    obj.edit19:setFontColor("white");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart3);
    obj.label15:setLeft(40);
    obj.label15:setTop(135);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setText("GeB");
    obj.label15:setFontSize(10);
    obj.label15:setWordWrap(true);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setTextTrimming("none");
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart3);
    obj.edit20:setLeft(90);
    obj.edit20:setTop(135);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(25);
    obj.edit20:setField("gdb");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setTransparent(true);
    obj.edit20:setName("edit20");
    obj.edit20:setFontSize(15);
    obj.edit20:setFontColor("white");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.flowLayout2);
    obj.dataLink3:setFields({'atributos_st','atributos_ht','atributos_dx','atributos_vt','atributos_iq','atributos_per','atributos_velocidade','atributos_deslocamento'});
    obj.dataLink3:setDefaultValues({'+0','+0','+0','+0','+0','+0','+0','+0'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowLayout2);
    obj.dataLink4:setFields({'atributos_mod_st','atributos_mod_dx','atributos_mod_iq','atributos_mod_ht','atributos_mod_vt','atributos_mod_per'});
    obj.dataLink4:setDefaultValues({10,10,10,10,10,10});
    obj.dataLink4:setName("dataLink4");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowLayout2);
    obj.flowLayout4:setVertAlign("leading");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMinScaledWidth(290);
    obj.flowLayout4:setMaxControlsPerLine(2);
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setLineSpacing(10);
    obj.flowLayout4:setMargins({left=2, top=2, right=16, bottom=4});
    obj.flowLayout4:setAvoidScale(true);
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setStepSizes({310, 420, 640, 760, 1150});

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout4);
    obj.flowPart4:setHeight(140);
    obj.flowPart4:setMinWidth(120);
    obj.flowPart4:setMaxWidth(120);
    obj.flowPart4:setMinScaledWidth(120);
    obj.flowPart4:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart4:setVertAlign("leading");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart4);
    obj.layout1:setLeft(6);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(116);
    obj.layout1:setHeight(115);
    obj.layout1:setName("layout1");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout1);
    obj.edit21:setAlign("top");
    obj.edit21:setMargins({left=25, right=30});
    obj.edit21:setField("atributos_pv");
    obj.edit21:setHeight(30);
    obj.edit21:setType("number");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setName("edit21");
    obj.edit21:setTransparent(true);
    obj.edit21:setFontSize(15);
    obj.edit21:setFontColor("white");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart4);
    obj.edit22:setFrameRegion("modificador");
    obj.edit22:setField("atributos_mod_pv");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setFontSize(46);
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setTransparent(true);
    obj.edit22:setMin(3);
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("white");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart4);
    obj.label16:setFrameRegion("titulo");
    obj.label16:setText("PV");
    obj.label16:setVertTextAlign("center");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");
    obj.label16:setFontColor("white");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout4);
    obj.flowPart5:setHeight(140);
    obj.flowPart5:setMinWidth(120);
    obj.flowPart5:setMaxWidth(120);
    obj.flowPart5:setMinScaledWidth(120);
    obj.flowPart5:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart5:setVertAlign("leading");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart5);
    obj.layout2:setLeft(6);
    obj.layout2:setTop(12);
    obj.layout2:setWidth(116);
    obj.layout2:setHeight(115);
    obj.layout2:setName("layout2");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout2);
    obj.edit23:setAlign("top");
    obj.edit23:setMargins({left=25, right=30});
    obj.edit23:setField("atributos_pf");
    obj.edit23:setHeight(30);
    obj.edit23:setType("number");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setName("edit23");
    obj.edit23:setTransparent(true);
    obj.edit23:setFontSize(15);
    obj.edit23:setFontColor("white");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart5);
    obj.edit24:setFrameRegion("modificador");
    obj.edit24:setField("atributos_mod_pf");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setFontSize(46);
    lfm_setPropAsString(obj.edit24, "fontStyle",  "bold");
    obj.edit24:setTransparent(true);
    obj.edit24:setMin(3);
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("white");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart5);
    obj.label17:setFrameRegion("titulo");
    obj.label17:setText("PF");
    obj.label17:setVertTextAlign("center");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout2);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout2);
    obj.button1:setMargins({top=5,bottom=5});
    obj.button1:setAlign("top");
    obj.button1:setText("Arquétipo");
    obj.button1:setWidth(250);
    obj.button1:setName("button1");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout2);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout2);
    obj.button2:setMargins({top=5,bottom=5});
    obj.button2:setAlign("top");
    obj.button2:setText("Vantagens");
    obj.button2:setWidth(250);
    obj.button2:setName("button2");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout2);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout2);
    obj.button3:setMargins({top=5,bottom=5});
    obj.button3:setAlign("top");
    obj.button3:setText("Desvantagens");
    obj.button3:setWidth(250);
    obj.button3:setName("button3");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout2);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout2);
    obj.button4:setMargins({top=5,bottom=5});
    obj.button4:setAlign("top");
    obj.button4:setText("Familiaridades Culturais");
    obj.button4:setWidth(250);
    obj.button4:setName("button4");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout2);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowLayout2);
    obj.button5:setMargins({top=5,bottom=5});
    obj.button5:setAlign("top");
    obj.button5:setText("Idiomas");
    obj.button5:setWidth(250);
    obj.button5:setName("button5");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flowLayout2);
    obj.dataLink5:setFields({'vantagens_pontos', 'desvantagens_pontos', 'familiaridade_cultural','arquetipo_pontos','idiomas_pontos'});
    obj.dataLink5:setName("dataLink5");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout2);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout2);
    obj.flowPart6:setStepSizes({120});
    obj.flowPart6:setMinScaledWidth(120);
    obj.flowPart6:setMargins({top=5});
    obj.flowPart6:setHeight(145);
    obj.flowPart6:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setVertAlign("leading");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart6);
    obj.label18:setLeft(15);
    obj.label18:setTop(10);
    obj.label18:setWidth(90);
    obj.label18:setHeight(25);
    obj.label18:setField("bc_0");
    obj.label18:setFontSize(10);
    obj.label18:setWordWrap(true);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setTextTrimming("none");
    obj.label18:setName("label18");
    obj.label18:setFontColor("white");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart6);
    obj.label19:setLeft(15);
    obj.label19:setTop(35);
    obj.label19:setWidth(90);
    obj.label19:setHeight(25);
    obj.label19:setField("bc_1");
    obj.label19:setFontSize(10);
    obj.label19:setWordWrap(true);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setTextTrimming("none");
    obj.label19:setName("label19");
    obj.label19:setFontColor("white");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart6);
    obj.label20:setLeft(15);
    obj.label20:setTop(60);
    obj.label20:setWidth(90);
    obj.label20:setHeight(25);
    obj.label20:setField("bc_2");
    obj.label20:setFontSize(10);
    obj.label20:setWordWrap(true);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setTextTrimming("none");
    obj.label20:setName("label20");
    obj.label20:setFontColor("white");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart6);
    obj.label21:setLeft(15);
    obj.label21:setTop(85);
    obj.label21:setWidth(90);
    obj.label21:setHeight(25);
    obj.label21:setField("bc_3");
    obj.label21:setFontSize(10);
    obj.label21:setWordWrap(true);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setTextTrimming("none");
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart6);
    obj.label22:setLeft(15);
    obj.label22:setTop(110);
    obj.label22:setWidth(90);
    obj.label22:setHeight(25);
    obj.label22:setField("bc_4");
    obj.label22:setFontSize(10);
    obj.label22:setWordWrap(true);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setTextTrimming("none");
    obj.label22:setName("label22");
    obj.label22:setFontColor("white");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowLayout2);
    obj.dataLink6:setField("carga");
    obj.dataLink6:setName("dataLink6");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout2);
    obj.flowPart7:setStepSizes({120});
    obj.flowPart7:setMinScaledWidth(120);
    obj.flowPart7:setMargins({top=5});
    obj.flowPart7:setHeight(145);
    obj.flowPart7:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setVertAlign("leading");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart7);
    obj.label23:setLeft(15);
    obj.label23:setTop(10);
    obj.label23:setWidth(90);
    obj.label23:setHeight(25);
    obj.label23:setField("db_0");
    obj.label23:setFontSize(10);
    obj.label23:setWordWrap(true);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setTextTrimming("none");
    obj.label23:setName("label23");
    obj.label23:setFontColor("white");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart7);
    obj.label24:setLeft(15);
    obj.label24:setTop(35);
    obj.label24:setWidth(90);
    obj.label24:setHeight(25);
    obj.label24:setField("db_1");
    obj.label24:setFontSize(10);
    obj.label24:setWordWrap(true);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setTextTrimming("none");
    obj.label24:setName("label24");
    obj.label24:setFontColor("white");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart7);
    obj.label25:setLeft(15);
    obj.label25:setTop(60);
    obj.label25:setWidth(90);
    obj.label25:setHeight(25);
    obj.label25:setField("db_2");
    obj.label25:setFontSize(10);
    obj.label25:setWordWrap(true);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setTextTrimming("none");
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart7);
    obj.label26:setLeft(15);
    obj.label26:setTop(85);
    obj.label26:setWidth(90);
    obj.label26:setHeight(25);
    obj.label26:setField("db_3");
    obj.label26:setFontSize(10);
    obj.label26:setWordWrap(true);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setTextTrimming("none");
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart7);
    obj.label27:setLeft(15);
    obj.label27:setTop(110);
    obj.label27:setWidth(90);
    obj.label27:setHeight(25);
    obj.label27:setField("db_4");
    obj.label27:setFontSize(10);
    obj.label27:setWordWrap(true);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setTextTrimming("none");
    obj.label27:setName("label27");
    obj.label27:setFontColor("white");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowLayout2);
    obj.dataLink7:setField("atributos_mod_deslocamento");
    obj.dataLink7:setName("dataLink7");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout2);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.upperGridMagicBox1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox1:setParent(obj.flowLayout2);
    obj.upperGridMagicBox1:setHeight(50);
    obj.upperGridMagicBox1:setMinScaledWidth(100);
    obj.upperGridMagicBox1:setMinWidth(100);
    obj.upperGridMagicBox1:setMaxWidth(160);
    obj.upperGridMagicBox1:setMaxScaledWidth(160);
    obj.upperGridMagicBox1:setAvoidScale(true);
    obj.upperGridMagicBox1:setName("upperGridMagicBox1");
    obj.upperGridMagicBox1:setVertAlign("leading");
    obj.upperGridMagicBox1:setMargins({left=0, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicBox1, "_RecalcSize", 
						function ()
							self.upperGridMagicBox1:setHeight(self.panupperGridMagicBox1:getHeight() + self.labupperGridMagicBox1:getHeight());
						end);														
				


    obj.panupperGridMagicBox1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox1:setParent(obj.upperGridMagicBox1);
    obj.panupperGridMagicBox1:setName("panupperGridMagicBox1");
    obj.panupperGridMagicBox1:setAlign("top");
    obj.panupperGridMagicBox1:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicBox1:setHeight(60);

    obj.labupperGridMagicBox1val = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox1val:setParent(obj.panupperGridMagicBox1);
    obj.labupperGridMagicBox1val:setName("labupperGridMagicBox1val");
    obj.labupperGridMagicBox1val:setFrameRegion("ContentRegion");
    obj.labupperGridMagicBox1val:setField("pontosRestantes");
    obj.labupperGridMagicBox1val:setFontSize(22);
    obj.labupperGridMagicBox1val:setVertTextAlign("center");
    obj.labupperGridMagicBox1val:setHorzTextAlign("center");
    obj.labupperGridMagicBox1val:setFontColor("white");

    obj.labupperGridMagicBox1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox1:setParent(obj.upperGridMagicBox1);
    obj.labupperGridMagicBox1:setName("labupperGridMagicBox1");
    obj.labupperGridMagicBox1:setAlign("top");
    obj.labupperGridMagicBox1:setAutoSize(true);
    obj.labupperGridMagicBox1:setText("PONTOS RESTANTES");
    obj.labupperGridMagicBox1:setHorzTextAlign("center");
    obj.labupperGridMagicBox1:setVertTextAlign("leading");
    obj.labupperGridMagicBox1:setWordWrap(true);
    obj.labupperGridMagicBox1:setTextTrimming("none");
    obj.labupperGridMagicBox1:setFontSize(12);
    obj.labupperGridMagicBox1:setFontColor("#D0D0D0");

self.upperGridMagicBox1._RecalcSize();	


    obj.upperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox1:setParent(obj.flowLayout2);
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
				


    obj.panupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox1:setParent(obj.upperGridMagicEditBox1);
    obj.panupperGridMagicEditBox1:setName("panupperGridMagicEditBox1");
    obj.panupperGridMagicEditBox1:setAlign("top");
    obj.panupperGridMagicEditBox1:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox1:setHeight(60);

    obj.edtupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox1:setParent(obj.panupperGridMagicEditBox1);
    obj.edtupperGridMagicEditBox1:setName("edtupperGridMagicEditBox1");
    obj.edtupperGridMagicEditBox1:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox1:setField("totalPontos");
    obj.edtupperGridMagicEditBox1:setFontSize(22);
    obj.edtupperGridMagicEditBox1:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox1:setFontColor("white");
    obj.edtupperGridMagicEditBox1:setTransparent(true);

    obj.labupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox1:setParent(obj.upperGridMagicEditBox1);
    obj.labupperGridMagicEditBox1:setName("labupperGridMagicEditBox1");
    obj.labupperGridMagicEditBox1:setAlign("top");
    obj.labupperGridMagicEditBox1:setAutoSize(true);
    obj.labupperGridMagicEditBox1:setText("TOTAL DE PONTOS");
    obj.labupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox1:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox1:setWordWrap(true);
    obj.labupperGridMagicEditBox1:setTextTrimming("none");
    obj.labupperGridMagicEditBox1:setFontSize(12);
    obj.labupperGridMagicEditBox1:setFontColor("#D0D0D0");

self.upperGridMagicEditBox1._RecalcSize();	


    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.fraFrenteLayoutNew);
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMinScaledWidth(290);
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout5:setVertAlign("leading");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout5);
    obj.flowPart8:setMinWidth(280);
    obj.flowPart8:setMaxWidth(800);
    obj.flowPart8:setMargins({top=10});
    obj.flowPart8:setHeight(64);
    obj.flowPart8:setFrameStyle("frames/posCaptionEdit1/frame.xml");
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setVertAlign("leading");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart8);
    obj.edit25:setAlign("left");
    obj.edit25:setField("nt_total");
    obj.edit25:setWidth(65);
    obj.edit25:setName("edit25");
    obj.edit25:setTransparent(true);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(15);
    obj.edit25:setFontColor("white");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart8);
    obj.label28:setAlign("client");
    obj.label28:setText("Nível Tecnológico");
    obj.label28:setMargins({left=10});
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");
    obj.label28:setFontSize(12);
    obj.label28:setFontColor("#D0D0D0");

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout5);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout5);
    obj.flowPart9:setHeight(515);
    obj.flowPart9:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart9:setMargins({left = 4, right = 4});
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setStepSizes({});
    obj.flowPart9:setMinWidth(300);
    obj.flowPart9:setMaxWidth(1600);
    obj.flowPart9:setMinScaledWidth(300);
    obj.flowPart9:setVertAlign("leading");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart9);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout3);
    obj.label29:setAlign("top");
    obj.label29:setAutoSize(true);
    obj.label29:setText("PERÍCIAS");
    obj.label29:setFontSize(12);
    obj.label29:setVertTextAlign("center");
    obj.label29:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setName("label29");
    obj.label29:setFontColor("white");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setAlign("left");
    obj.button6:setText("+");
    obj.button6:setWidth(25);
    obj.button6:setHint("Adiciona uma perícia.");
    obj.button6:setHorzTextAlign("center");
    obj.button6:setMargins({top=-10});
    obj.button6:setName("button6");

    obj.rclSkillsNew = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSkillsNew:setParent(obj.flowPart9);
    obj.rclSkillsNew:setAlign("client");
    obj.rclSkillsNew:setName("rclSkillsNew");
    obj.rclSkillsNew:setField("listaDePericias");
    obj.rclSkillsNew:setTemplateForm("frmSkillItem");
    obj.rclSkillsNew:setLayout("vertical");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout5);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout5);
    obj.flowPart10:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setAvoidScale(true);
    obj.flowPart10:setMinScaledWidth(280);
    obj.flowPart10:setMinWidth(300);
    obj.flowPart10:setMaxWidth(600);
    obj.flowPart10:setHeight(80);
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart10);
    obj.edit26:setFrameRegion("RegiaoConteudo1");
    obj.edit26:setField("left_a");
    obj.edit26:setName("edit26");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setFontSize(18);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontColor("white");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart10);
    obj.edit27:setFrameRegion("RegiaoConteudo2");
    obj.edit27:setField("right_a");
    obj.edit27:setName("edit27");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setFontSize(18);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontColor("white");

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout5);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout5);
    obj.flowPart11:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setAvoidScale(true);
    obj.flowPart11:setMinScaledWidth(280);
    obj.flowPart11:setMinWidth(300);
    obj.flowPart11:setMaxWidth(600);
    obj.flowPart11:setHeight(80);
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart11);
    obj.edit28:setFrameRegion("RegiaoConteudo1");
    obj.edit28:setField("left_b");
    obj.edit28:setName("edit28");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setFontSize(18);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontColor("white");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart11);
    obj.edit29:setFrameRegion("RegiaoConteudo2");
    obj.edit29:setField("right_b");
    obj.edit29:setName("edit29");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setFontSize(18);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontColor("white");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout5);
    obj.dataLink8:setFields({'totalPontos', 'atributos_st', 'atributos_ht', 'atributos_dx', 'atributos_vt', 'atributos_iq', 'atributos_per', 'atributos_pv', 'atributos_pf', 'atributos_velocidade', 'atributos_deslocamento'});
    obj.dataLink8:setName("dataLink8");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Descrição");
    obj.tab2:setName("tab2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.tab2);
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#40000000");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle3);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.fraCaracteristicasLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraCaracteristicasLayout:setParent(obj.scrollBox2);
    obj.fraCaracteristicasLayout:setAlign("top");
    obj.fraCaracteristicasLayout:setHeight(500);
    obj.fraCaracteristicasLayout:setMargins({left=10, right=10, top=10});
    obj.fraCaracteristicasLayout:setAutoHeight(true);
    obj.fraCaracteristicasLayout:setHorzAlign("center");
    obj.fraCaracteristicasLayout:setLineSpacing(3);
    obj.fraCaracteristicasLayout:setName("fraCaracteristicasLayout");
    obj.fraCaracteristicasLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraCaracteristicasLayout:setMinScaledWidth(150);
    obj.fraCaracteristicasLayout:setVertAlign("leading");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMinScaledWidth(290);
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout6:setVertAlign("leading");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout6);
    obj.flowPart12:setMinWidth(320);
    obj.flowPart12:setMaxWidth(1600);
    obj.flowPart12:setFrameStyle("frames/banner/dragon.xml");
    obj.flowPart12:setHeight(175);
    obj.flowPart12:setVertAlign("center");
    obj.flowPart12:setAvoidScale(true);
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart12:setMinScaledWidth(150);
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart12);
    obj.layout4:setAlign("client");
    obj.layout4:setName("layout4");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout4);
    obj.edit30:setField("nome");
    obj.edit30:setFontSize(17);
    obj.edit30:setAlign("client");
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("white");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setTransparent(true);

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout4);
    obj.label30:setAlign("bottom");
    obj.label30:setText("NOME DO PERSONAGEM");
    obj.label30:setAutoSize(true);
    obj.label30:setMargins({left=3});
    obj.label30:setName("label30");
    obj.label30:setFontSize(12);
    obj.label30:setFontColor("#D0D0D0");

    obj.fraUpperGridCaracteristicas = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridCaracteristicas:setParent(obj.flowLayout6);
    obj.fraUpperGridCaracteristicas:setMinWidth(320);
    obj.fraUpperGridCaracteristicas:setMaxWidth(1600);
    obj.fraUpperGridCaracteristicas:setName("fraUpperGridCaracteristicas");
    obj.fraUpperGridCaracteristicas:setAvoidScale(true);
    obj.fraUpperGridCaracteristicas:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridCaracteristicas:setAutoHeight(true);
    obj.fraUpperGridCaracteristicas:setVertAlign("trailing");
    obj.fraUpperGridCaracteristicas:setMaxControlsPerLine(3);
    obj.fraUpperGridCaracteristicas:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraUpperGridCaracteristicas:setMinScaledWidth(150);
    obj.fraUpperGridCaracteristicas:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo1:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo1:setHeight(50);
    obj.UpperGridCampo1:setMinScaledWidth(100);
    obj.UpperGridCampo1:setMinWidth(100);
    obj.UpperGridCampo1:setMaxWidth(233);
    obj.UpperGridCampo1:setMaxScaledWidth(233);
    obj.UpperGridCampo1:setAvoidScale(true);
    obj.UpperGridCampo1:setName("UpperGridCampo1");
    obj.UpperGridCampo1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo1:setVertAlign("leading");

    obj.edtUpperGridCampo1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.edtUpperGridCampo1:setName("edtUpperGridCampo1");
    obj.edtUpperGridCampo1:setAlign("top");
    obj.edtUpperGridCampo1:setField("idade");
    obj.edtUpperGridCampo1:setFontSize(13);
    obj.edtUpperGridCampo1:setHeight(30);
    obj.edtUpperGridCampo1:setTransparent(true);
    obj.edtUpperGridCampo1:setVertTextAlign("trailing");
    obj.edtUpperGridCampo1:setWidth(195);
    obj.edtUpperGridCampo1:setFontColor("white");

    obj.linUpperGridCampo1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.linUpperGridCampo1:setName("linUpperGridCampo1");
    obj.linUpperGridCampo1:setAlign("top");
    obj.linUpperGridCampo1:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo1:setStrokeSize(1);

    obj.labUpperGridCampo1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.labUpperGridCampo1:setName("labUpperGridCampo1");
    obj.labUpperGridCampo1:setAlign("top");
    obj.labUpperGridCampo1:setText("IDADE");
    obj.labUpperGridCampo1:setVertTextAlign("leading");
    obj.labUpperGridCampo1:setWordWrap(true);
    obj.labUpperGridCampo1:setTextTrimming("none");
    obj.labUpperGridCampo1:setFontSize(12);
    obj.labUpperGridCampo1:setFontColor("#D0D0D0");

    self.UpperGridCampo1:setHeight(self.edtUpperGridCampo1:getHeight() + self.labUpperGridCampo1:getHeight() + self.linUpperGridCampo1:getHeight());


    obj.UpperGridCampo2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo2:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo2:setHeight(50);
    obj.UpperGridCampo2:setMinScaledWidth(100);
    obj.UpperGridCampo2:setMinWidth(100);
    obj.UpperGridCampo2:setMaxWidth(233);
    obj.UpperGridCampo2:setMaxScaledWidth(233);
    obj.UpperGridCampo2:setAvoidScale(true);
    obj.UpperGridCampo2:setName("UpperGridCampo2");
    obj.UpperGridCampo2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo2:setVertAlign("leading");

    obj.edtUpperGridCampo2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.edtUpperGridCampo2:setName("edtUpperGridCampo2");
    obj.edtUpperGridCampo2:setAlign("top");
    obj.edtUpperGridCampo2:setField("altura");
    obj.edtUpperGridCampo2:setFontSize(13);
    obj.edtUpperGridCampo2:setHeight(30);
    obj.edtUpperGridCampo2:setTransparent(true);
    obj.edtUpperGridCampo2:setVertTextAlign("trailing");
    obj.edtUpperGridCampo2:setWidth(195);
    obj.edtUpperGridCampo2:setFontColor("white");

    obj.linUpperGridCampo2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.linUpperGridCampo2:setName("linUpperGridCampo2");
    obj.linUpperGridCampo2:setAlign("top");
    obj.linUpperGridCampo2:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo2:setStrokeSize(1);

    obj.labUpperGridCampo2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.labUpperGridCampo2:setName("labUpperGridCampo2");
    obj.labUpperGridCampo2:setAlign("top");
    obj.labUpperGridCampo2:setText("ALTURA");
    obj.labUpperGridCampo2:setVertTextAlign("leading");
    obj.labUpperGridCampo2:setWordWrap(true);
    obj.labUpperGridCampo2:setTextTrimming("none");
    obj.labUpperGridCampo2:setFontSize(12);
    obj.labUpperGridCampo2:setFontColor("#D0D0D0");

    self.UpperGridCampo2:setHeight(self.edtUpperGridCampo2:getHeight() + self.labUpperGridCampo2:getHeight() + self.linUpperGridCampo2:getHeight());


    obj.UpperGridCampo3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo3:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo3:setHeight(50);
    obj.UpperGridCampo3:setMinScaledWidth(100);
    obj.UpperGridCampo3:setMinWidth(100);
    obj.UpperGridCampo3:setMaxWidth(233);
    obj.UpperGridCampo3:setMaxScaledWidth(233);
    obj.UpperGridCampo3:setAvoidScale(true);
    obj.UpperGridCampo3:setName("UpperGridCampo3");
    obj.UpperGridCampo3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo3:setVertAlign("leading");

    obj.edtUpperGridCampo3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.edtUpperGridCampo3:setName("edtUpperGridCampo3");
    obj.edtUpperGridCampo3:setAlign("top");
    obj.edtUpperGridCampo3:setField("peso");
    obj.edtUpperGridCampo3:setFontSize(13);
    obj.edtUpperGridCampo3:setHeight(30);
    obj.edtUpperGridCampo3:setTransparent(true);
    obj.edtUpperGridCampo3:setVertTextAlign("trailing");
    obj.edtUpperGridCampo3:setWidth(195);
    obj.edtUpperGridCampo3:setFontColor("white");

    obj.linUpperGridCampo3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.linUpperGridCampo3:setName("linUpperGridCampo3");
    obj.linUpperGridCampo3:setAlign("top");
    obj.linUpperGridCampo3:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo3:setStrokeSize(1);

    obj.labUpperGridCampo3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.labUpperGridCampo3:setName("labUpperGridCampo3");
    obj.labUpperGridCampo3:setAlign("top");
    obj.labUpperGridCampo3:setText("PESO");
    obj.labUpperGridCampo3:setVertTextAlign("leading");
    obj.labUpperGridCampo3:setWordWrap(true);
    obj.labUpperGridCampo3:setTextTrimming("none");
    obj.labUpperGridCampo3:setFontSize(12);
    obj.labUpperGridCampo3:setFontColor("#D0D0D0");

    self.UpperGridCampo3:setHeight(self.edtUpperGridCampo3:getHeight() + self.labUpperGridCampo3:getHeight() + self.linUpperGridCampo3:getHeight());


    obj.UpperGridCampo4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo4:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo4:setHeight(50);
    obj.UpperGridCampo4:setMinScaledWidth(100);
    obj.UpperGridCampo4:setMinWidth(100);
    obj.UpperGridCampo4:setMaxWidth(233);
    obj.UpperGridCampo4:setMaxScaledWidth(233);
    obj.UpperGridCampo4:setAvoidScale(true);
    obj.UpperGridCampo4:setName("UpperGridCampo4");
    obj.UpperGridCampo4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo4:setVertAlign("leading");

    obj.edtUpperGridCampo4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.edtUpperGridCampo4:setName("edtUpperGridCampo4");
    obj.edtUpperGridCampo4:setAlign("top");
    obj.edtUpperGridCampo4:setField("olhos");
    obj.edtUpperGridCampo4:setFontSize(13);
    obj.edtUpperGridCampo4:setHeight(30);
    obj.edtUpperGridCampo4:setTransparent(true);
    obj.edtUpperGridCampo4:setVertTextAlign("trailing");
    obj.edtUpperGridCampo4:setWidth(195);
    obj.edtUpperGridCampo4:setFontColor("white");

    obj.linUpperGridCampo4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.linUpperGridCampo4:setName("linUpperGridCampo4");
    obj.linUpperGridCampo4:setAlign("top");
    obj.linUpperGridCampo4:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo4:setStrokeSize(1);

    obj.labUpperGridCampo4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.labUpperGridCampo4:setName("labUpperGridCampo4");
    obj.labUpperGridCampo4:setAlign("top");
    obj.labUpperGridCampo4:setText("JOGADOR");
    obj.labUpperGridCampo4:setVertTextAlign("leading");
    obj.labUpperGridCampo4:setWordWrap(true);
    obj.labUpperGridCampo4:setTextTrimming("none");
    obj.labUpperGridCampo4:setFontSize(12);
    obj.labUpperGridCampo4:setFontColor("#D0D0D0");

    self.UpperGridCampo4:setHeight(self.edtUpperGridCampo4:getHeight() + self.labUpperGridCampo4:getHeight() + self.linUpperGridCampo4:getHeight());


    obj.UpperGridCampo5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo5:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo5:setHeight(50);
    obj.UpperGridCampo5:setMinScaledWidth(100);
    obj.UpperGridCampo5:setMinWidth(100);
    obj.UpperGridCampo5:setMaxWidth(233);
    obj.UpperGridCampo5:setMaxScaledWidth(233);
    obj.UpperGridCampo5:setAvoidScale(true);
    obj.UpperGridCampo5:setName("UpperGridCampo5");
    obj.UpperGridCampo5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo5:setVertAlign("leading");

    obj.edtUpperGridCampo5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.edtUpperGridCampo5:setName("edtUpperGridCampo5");
    obj.edtUpperGridCampo5:setAlign("top");
    obj.edtUpperGridCampo5:setField("pele");
    obj.edtUpperGridCampo5:setFontSize(13);
    obj.edtUpperGridCampo5:setHeight(30);
    obj.edtUpperGridCampo5:setTransparent(true);
    obj.edtUpperGridCampo5:setVertTextAlign("trailing");
    obj.edtUpperGridCampo5:setWidth(195);
    obj.edtUpperGridCampo5:setFontColor("white");

    obj.linUpperGridCampo5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.linUpperGridCampo5:setName("linUpperGridCampo5");
    obj.linUpperGridCampo5:setAlign("top");
    obj.linUpperGridCampo5:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo5:setStrokeSize(1);

    obj.labUpperGridCampo5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.labUpperGridCampo5:setName("labUpperGridCampo5");
    obj.labUpperGridCampo5:setAlign("top");
    obj.labUpperGridCampo5:setText("TAMANHO");
    obj.labUpperGridCampo5:setVertTextAlign("leading");
    obj.labUpperGridCampo5:setWordWrap(true);
    obj.labUpperGridCampo5:setTextTrimming("none");
    obj.labUpperGridCampo5:setFontSize(12);
    obj.labUpperGridCampo5:setFontColor("#D0D0D0");

    self.UpperGridCampo5:setHeight(self.edtUpperGridCampo5:getHeight() + self.labUpperGridCampo5:getHeight() + self.linUpperGridCampo5:getHeight());


    obj.UpperGridCampo6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo6:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo6:setHeight(50);
    obj.UpperGridCampo6:setMinScaledWidth(100);
    obj.UpperGridCampo6:setMinWidth(100);
    obj.UpperGridCampo6:setMaxWidth(233);
    obj.UpperGridCampo6:setMaxScaledWidth(233);
    obj.UpperGridCampo6:setAvoidScale(true);
    obj.UpperGridCampo6:setName("UpperGridCampo6");
    obj.UpperGridCampo6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo6:setVertAlign("leading");

    obj.edtUpperGridCampo6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.edtUpperGridCampo6:setName("edtUpperGridCampo6");
    obj.edtUpperGridCampo6:setAlign("top");
    obj.edtUpperGridCampo6:setField("cabelo");
    obj.edtUpperGridCampo6:setFontSize(13);
    obj.edtUpperGridCampo6:setHeight(30);
    obj.edtUpperGridCampo6:setTransparent(true);
    obj.edtUpperGridCampo6:setVertTextAlign("trailing");
    obj.edtUpperGridCampo6:setWidth(195);
    obj.edtUpperGridCampo6:setFontColor("white");

    obj.linUpperGridCampo6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.linUpperGridCampo6:setName("linUpperGridCampo6");
    obj.linUpperGridCampo6:setAlign("top");
    obj.linUpperGridCampo6:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo6:setStrokeSize(1);

    obj.labUpperGridCampo6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.labUpperGridCampo6:setName("labUpperGridCampo6");
    obj.labUpperGridCampo6:setAlign("top");
    obj.labUpperGridCampo6:setText("APARÊNCIA");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.flowLineBreak12 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.fraCaracteristicasLayout);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMinScaledWidth(290);
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setLineSpacing(10);
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout7:setVertAlign("leading");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowLayout7);
    obj.flowLayout8:setMaxControlsPerLine(1);
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setLineSpacing(10);
    obj.flowLayout8:setMargins({left = 4, right = 4});
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setStepSizes({});
    obj.flowLayout8:setMinWidth(300);
    obj.flowLayout8:setMaxWidth(1600);
    obj.flowLayout8:setMinScaledWidth(300);
    obj.flowLayout8:setVertAlign("leading");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout8);
    obj.flowPart13:setHeight(390);
    obj.flowPart13:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart13:setMargins({left = 0, right = 4});
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setStepSizes({});
    obj.flowPart13:setMinWidth(300);
    obj.flowPart13:setMaxWidth(1600);
    obj.flowPart13:setMinScaledWidth(300);
    obj.flowPart13:setVertAlign("leading");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.flowPart13);
    obj.image1:setAlign("client");
    obj.image1:setStyle("autoFit");
    obj.image1:setField("imagens.aparencia");
    obj.image1:setMargins({top=2});
    obj.image1:setEditable(true);
    obj.image1:setName("image1");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart13);
    obj.label31:setAlign("bottom");
    obj.label31:setAutoSize(true);
    obj.label31:setText("APARÊNCIA");
    obj.label31:setFontSize(12);
    obj.label31:setVertTextAlign("center");
    obj.label31:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout8);
    obj.flowPart14:setHeight(115);
    obj.flowPart14:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart14:setMargins({left = 4, right = 0});
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setStepSizes({});
    obj.flowPart14:setMinWidth(300);
    obj.flowPart14:setMaxWidth(1600);
    obj.flowPart14:setMinScaledWidth(300);
    obj.flowPart14:setVertAlign("leading");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.flowPart14);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("reacao");
    obj.textEditor2:setMargins({top=2});
    obj.textEditor2:setFontSize(16);
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setTransparent(true);

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart14);
    obj.label32:setAlign("bottom");
    obj.label32:setAutoSize(true);
    obj.label32:setText("REAÇÃO");
    obj.label32:setFontSize(12);
    obj.label32:setVertTextAlign("center");
    obj.label32:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowLayout7);
    obj.flowLayout9:setMaxControlsPerLine(1);
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setLineSpacing(10);
    obj.flowLayout9:setMargins({left=4, right=4});
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setStepSizes({});
    obj.flowLayout9:setMinWidth(300);
    obj.flowLayout9:setMaxWidth(1600);
    obj.flowLayout9:setMinScaledWidth(300);
    obj.flowLayout9:setVertAlign("leading");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout9);
    obj.flowPart15:setHeight(140);
    obj.flowPart15:setFrameStyle("frames/panel5/topPanel.xml");
    obj.flowPart15:setMargins({left = 4, right = 4});
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setStepSizes({});
    obj.flowPart15:setMinWidth(300);
    obj.flowPart15:setMaxWidth(1600);
    obj.flowPart15:setMinScaledWidth(300);
    obj.flowPart15:setVertAlign("leading");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.flowPart15);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("tracosPersonalidade");
    obj.textEditor3:setMargins({top=2});
    obj.textEditor3:setFontSize(16);
    obj.textEditor3:setName("textEditor3");
    obj.textEditor3:setTransparent(true);

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart15);
    obj.label33:setAlign("bottom");
    obj.label33:setAutoSize(true);
    obj.label33:setText("TRAÇOS DE PERSONALIDADE");
    obj.label33:setFontSize(12);
    obj.label33:setVertTextAlign("center");
    obj.label33:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setName("label33");
    obj.label33:setFontColor("white");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout9);
    obj.flowPart16:setHeight(115);
    obj.flowPart16:setFrameStyle("frames/panel5/centerPanel.xml");
    obj.flowPart16:setMargins({left = 4, right = 4});
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setStepSizes({});
    obj.flowPart16:setMinWidth(300);
    obj.flowPart16:setMaxWidth(1600);
    obj.flowPart16:setMinScaledWidth(300);
    obj.flowPart16:setVertAlign("leading");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.flowPart16);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("qualidades");
    obj.textEditor4:setMargins({top=2});
    obj.textEditor4:setFontSize(16);
    obj.textEditor4:setName("textEditor4");
    obj.textEditor4:setTransparent(true);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart16);
    obj.label34:setAlign("bottom");
    obj.label34:setAutoSize(true);
    obj.label34:setText("QUALIDADES");
    obj.label34:setFontSize(12);
    obj.label34:setVertTextAlign("center");
    obj.label34:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setName("label34");
    obj.label34:setFontColor("white");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout9);
    obj.flowPart17:setHeight(115);
    obj.flowPart17:setFrameStyle("frames/panel5/centerPanel.xml");
    obj.flowPart17:setMargins({left = 4, right = 4});
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setStepSizes({});
    obj.flowPart17:setMinWidth(300);
    obj.flowPart17:setMaxWidth(1600);
    obj.flowPart17:setMinScaledWidth(300);
    obj.flowPart17:setVertAlign("leading");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.flowPart17);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("peculiaridades");
    obj.textEditor5:setMargins({top=2});
    obj.textEditor5:setFontSize(16);
    obj.textEditor5:setName("textEditor5");
    obj.textEditor5:setTransparent(true);

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart17);
    obj.label35:setAlign("bottom");
    obj.label35:setAutoSize(true);
    obj.label35:setText("PECULIARIDADES");
    obj.label35:setFontSize(12);
    obj.label35:setVertTextAlign("center");
    obj.label35:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setName("label35");
    obj.label35:setFontColor("white");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout9);
    obj.flowPart18:setHeight(115);
    obj.flowPart18:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.flowPart18:setMargins({left = 4, right = 4});
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setStepSizes({});
    obj.flowPart18:setMinWidth(300);
    obj.flowPart18:setMaxWidth(1600);
    obj.flowPart18:setMinScaledWidth(300);
    obj.flowPart18:setVertAlign("leading");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.flowPart18);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("vinculos");
    obj.textEditor6:setMargins({top=2});
    obj.textEditor6:setFontSize(16);
    obj.textEditor6:setName("textEditor6");
    obj.textEditor6:setTransparent(true);

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart18);
    obj.label36:setAlign("bottom");
    obj.label36:setAutoSize(true);
    obj.label36:setText("VINCULOS");
    obj.label36:setFontSize(12);
    obj.label36:setVertTextAlign("center");
    obj.label36:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setName("label36");
    obj.label36:setFontColor("white");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout7);
    obj.flowPart19:setHeight(515);
    obj.flowPart19:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart19:setMargins({left = 4, right = 4});
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setStepSizes({});
    obj.flowPart19:setMinWidth(300);
    obj.flowPart19:setMaxWidth(1600);
    obj.flowPart19:setMinScaledWidth(300);
    obj.flowPart19:setVertAlign("leading");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.flowPart19);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("caracteristicasETracoes");
    obj.textEditor7:setMargins({top=2});
    obj.textEditor7:setFontSize(16);
    obj.textEditor7:setName("textEditor7");
    obj.textEditor7:setTransparent(true);

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart19);
    obj.label37:setAlign("bottom");
    obj.label37:setAutoSize(true);
    obj.label37:setText("CARACTERÍSTICAS E TRAÇOS");
    obj.label37:setFontSize(12);
    obj.label37:setVertTextAlign("center");
    obj.label37:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setName("label37");
    obj.label37:setFontColor("white");

    obj.flowLineBreak13 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.fraCaracteristicasLayout);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMinScaledWidth(290);
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setLineSpacing(10);
    obj.flowLayout10:setMargins({top=5});
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout10:setVertAlign("leading");

    obj.fraAliadosOrganizacoes = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraAliadosOrganizacoes:setParent(obj.flowLayout10);
    obj.fraAliadosOrganizacoes:setName("fraAliadosOrganizacoes");
    obj.fraAliadosOrganizacoes:setAutoHeight(true);
    obj.fraAliadosOrganizacoes:setFrameStyle("frames/panel5/frame.xml");
    obj.fraAliadosOrganizacoes:setMargins({left = 4, right = 4});
    obj.fraAliadosOrganizacoes:setHorzAlign("center");
    obj.fraAliadosOrganizacoes:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraAliadosOrganizacoes:setMinScaledWidth(150);
    obj.fraAliadosOrganizacoes:setVertAlign("leading");

    obj.prtAliados = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.prtAliados:setParent(obj.fraAliadosOrganizacoes);
    obj.prtAliados:setName("prtAliados");
    obj.prtAliados:setMinWidth(300);
    obj.prtAliados:setMaxWidth(1600);
    obj.prtAliados:setMinScaledWidth(290);
    obj.prtAliados:setHeight(420);
    obj.prtAliados:setAvoidScale(true);
    obj.prtAliados:setMargins({left=1, right=1, top=2, bottom=2});
    obj.prtAliados:setVertAlign("leading");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.prtAliados);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("aliados.aliadosEOrganizacoes");
    obj.textEditor8:setMargins({top=2, left=4, right=4});
    obj.textEditor8:setFontSize(16);
    obj.textEditor8:setName("textEditor8");
    obj.textEditor8:setTransparent(true);

    obj.prtFaccao = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.prtFaccao:setParent(obj.fraAliadosOrganizacoes);
    obj.prtFaccao:setName("prtFaccao");
    obj.prtFaccao:setStepSizes({260, 310});
    obj.prtFaccao:setMaxScaledWidth(310);
    obj.prtFaccao:setAvoidScale(true);
    obj.prtFaccao:setHeight(350);
    obj.prtFaccao:setFrameStyle("frames/panel4transp/frame.xml");
    obj.prtFaccao:setMargins({left=4, right=4, bottom=4, top=4});
    obj.prtFaccao:setMinScaledWidth(300);
    obj.prtFaccao:setVertAlign("leading");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.prtFaccao);
    obj.label38:setAlign("top");
    obj.label38:setHorzTextAlign("leading");
    obj.label38:setText("FACÇÃO");
    obj.label38:setFontSize(11);
    obj.label38:setFontColor("gray");
    obj.label38:setMargins({left=4, right=4});
    obj.label38:setName("label38");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.prtFaccao);
    obj.edit31:setAlign("top");
    obj.edit31:setField("aliados.faccao.nome");
    obj.edit31:setMargins({left=4, right=4});
    obj.edit31:setName("edit31");
    obj.edit31:setFontSize(15);
    obj.edit31:setFontColor("white");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.prtFaccao);
    obj.image2:setAlign("client");
    obj.image2:setField("aliados.faccao.simbolo");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setMargins({left=4, right=4});
    obj.image2:setName("image2");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.prtFaccao);
    obj.label39:setAlign("bottom");
    obj.label39:setAutoSize(true);
    obj.label39:setText("SÍMBOLO DA FACÇÃO");
    obj.label39:setFontSize(12);
    obj.label39:setVertTextAlign("center");
    obj.label39:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setName("label39");
    obj.label39:setFontColor("white");

    obj.flowLineBreak14 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.fraAliadosOrganizacoes);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.fraAliadosOrganizacoes);
    obj.flowPart20:setMinWidth(200);
    obj.flowPart20:setMaxWidth(1800);
    obj.flowPart20:setHeight(16);
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart20:setVertAlign("leading");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart20);
    obj.label40:setAlign("client");
    obj.label40:setAutoSize(true);
    obj.label40:setText("ALIADOS E ORGANIZAÇÕES");
    obj.label40:setFontSize(12);
    obj.label40:setVertTextAlign("center");
    obj.label40:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setName("label40");
    obj.label40:setFontColor("white");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout10);
    obj.flowPart21:setHeight(515);
    obj.flowPart21:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart21:setMargins({left = 4, right = 4});
    obj.flowPart21:setAdjustHeightToLine(true);
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart21:setMinScaledWidth(150);
    obj.flowPart21:setVertAlign("leading");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.flowPart21);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart21);
    obj.label41:setAlign("bottom");
    obj.label41:setAutoSize(true);
    obj.label41:setText("HISTÓRIA");
    obj.label41:setFontSize(12);
    obj.label41:setVertTextAlign("center");
    obj.label41:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setName("label41");
    obj.label41:setFontColor("white");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pgcPrincipal);
    obj.tab3:setTitle("Capacidades");
    obj.tab3:setName("tab3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.tab3);
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#40000000");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);

    obj.popPower = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPower:setParent(obj.rectangle4);
    obj.popPower:setName("popPower");
    obj.popPower:setWidth(250);
    obj.popPower:setHeight(250);
    obj.popPower:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popPower, "autoScopeNode",  "false");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.popPower);
    obj.edit32:setAlign("top");
    obj.edit32:setField("nome");
    obj.edit32:setTextPrompt("NOME DA MAGIA");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");
    obj.edit32:setFontSize(15);
    obj.edit32:setFontColor("white");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.popPower);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxControlsPerLine(2);
    obj.flowLayout11:setMargins({bottom=4});
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setVertAlign("leading");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout11);
    obj.flowPart22:setMinWidth(30);
    obj.flowPart22:setMaxWidth(400);
    obj.flowPart22:setHeight(35);
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart22:setVertAlign("leading");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart22);
    obj.label42:setAlign("top");
    obj.label42:setFontSize(10);
    obj.label42:setText("TIPO");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setWordWrap(true);
    obj.label42:setTextTrimming("none");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");
    obj.label42:setFontColor("#D0D0D0");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart22);
    obj.edit33:setAlign("client");
    obj.edit33:setField("tipo");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setFontSize(12);
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("white");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout11);
    obj.flowPart23:setMinWidth(30);
    obj.flowPart23:setMaxWidth(400);
    obj.flowPart23:setHeight(35);
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart23:setVertAlign("leading");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart23);
    obj.label43:setAlign("top");
    obj.label43:setFontSize(10);
    obj.label43:setText("CUSTO");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setWordWrap(true);
    obj.label43:setTextTrimming("none");
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");
    obj.label43:setFontColor("#D0D0D0");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart23);
    obj.edit34:setAlign("client");
    obj.edit34:setField("custo");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(12);
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("white");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.popPower);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("descricao");
    obj.textEditor9:setName("textEditor9");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.rectangle4);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.fraPoderesLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraPoderesLayout:setParent(obj.scrollBox3);
    obj.fraPoderesLayout:setAlign("top");
    obj.fraPoderesLayout:setHeight(500);
    obj.fraPoderesLayout:setMargins({left=10, right=10, top=10});
    obj.fraPoderesLayout:setAutoHeight(true);
    obj.fraPoderesLayout:setHorzAlign("center");
    obj.fraPoderesLayout:setLineSpacing(3);
    obj.fraPoderesLayout:setName("fraPoderesLayout");
    obj.fraPoderesLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraPoderesLayout:setMinScaledWidth(150);
    obj.fraPoderesLayout:setVertAlign("leading");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.fraPoderesLayout);
    obj.flowLayout12:setHeight(100);
    obj.flowLayout12:setAvoidScale(true);
    obj.flowLayout12:setMaxControlsPerLine(1);
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout12:setStepSizes({310, 360, 420, 600});
    obj.flowLayout12:setMinScaledWidth(300);
    obj.flowLayout12:setMaxScaledWidth(600);
    obj.flowLayout12:setVertAlign("leading");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout12);
    obj.flowPart24:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setAvoidScale(true);
    obj.flowPart24:setMinScaledWidth(280);
    obj.flowPart24:setMinWidth(300);
    obj.flowPart24:setMaxWidth(600);
    obj.flowPart24:setHeight(80);
    obj.flowPart24:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart24:setVertAlign("leading");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart24);
    obj.label44:setFrameRegion("RegiaoSmallTitulo");
    obj.label44:setField("custoTecnicas");
    obj.label44:setName("label44");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setVertTextAlign("center");
    obj.label44:setFontSize(18);
    obj.label44:setFontColor("white");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart24);
    obj.label45:setFrameRegion("RegiaoConteudo");
    obj.label45:setText("TÉCNICAS");
    obj.label45:setFontSize(15);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setVertTextAlign("center");
    obj.label45:setName("label45");
    obj.label45:setFontColor("white");

    obj.flwMagicRecordList1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList1:setParent(obj.flowLayout12);
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
				


    obj.rclflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList1:setParent(obj.flwMagicRecordList1);
    obj.rclflwMagicRecordList1:setName("rclflwMagicRecordList1");
    obj.rclflwMagicRecordList1:setAlign("top");
    obj.rclflwMagicRecordList1:setField("listaDeTecnicas");
    obj.rclflwMagicRecordList1:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclflwMagicRecordList1:setAutoHeight(true);
    obj.rclflwMagicRecordList1:setMinHeight(5);
    obj.rclflwMagicRecordList1:setHitTest(false);
    obj.rclflwMagicRecordList1:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList1:setParent(obj.flwMagicRecordList1);
    obj.layBottomflwMagicRecordList1:setName("layBottomflwMagicRecordList1");
    obj.layBottomflwMagicRecordList1:setAlign("top");
    obj.layBottomflwMagicRecordList1:setHeight(36);

    obj.btnNovoflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList1:setParent(obj.layBottomflwMagicRecordList1);
    obj.btnNovoflwMagicRecordList1:setName("btnNovoflwMagicRecordList1");
    obj.btnNovoflwMagicRecordList1:setAlign("left");
    obj.btnNovoflwMagicRecordList1:setText("Nova Técnica");
    obj.btnNovoflwMagicRecordList1:setWidth(160);
    obj.btnNovoflwMagicRecordList1:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList1._recalcHeight();


    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.fraPoderesLayout);
    obj.flowLayout13:setHeight(100);
    obj.flowLayout13:setAvoidScale(true);
    obj.flowLayout13:setMaxControlsPerLine(1);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout13:setStepSizes({310, 360, 420, 600});
    obj.flowLayout13:setMinScaledWidth(300);
    obj.flowLayout13:setMaxScaledWidth(600);
    obj.flowLayout13:setVertAlign("leading");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout13);
    obj.flowPart25:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setAvoidScale(true);
    obj.flowPart25:setMinScaledWidth(280);
    obj.flowPart25:setMinWidth(300);
    obj.flowPart25:setMaxWidth(600);
    obj.flowPart25:setHeight(80);
    obj.flowPart25:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart25:setVertAlign("leading");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart25);
    obj.label46:setFrameRegion("RegiaoSmallTitulo");
    obj.label46:setField("custoMagias");
    obj.label46:setName("label46");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setVertTextAlign("center");
    obj.label46:setFontSize(18);
    obj.label46:setFontColor("white");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart25);
    obj.label47:setFrameRegion("RegiaoConteudo");
    obj.label47:setText("MAGIAS");
    obj.label47:setFontSize(15);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    obj.label47:setName("label47");
    obj.label47:setFontColor("white");

    obj.flwMagicRecordList2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList2:setParent(obj.flowLayout13);
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
				


    obj.rclflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList2:setParent(obj.flwMagicRecordList2);
    obj.rclflwMagicRecordList2:setName("rclflwMagicRecordList2");
    obj.rclflwMagicRecordList2:setAlign("top");
    obj.rclflwMagicRecordList2:setField("listaDeMagias");
    obj.rclflwMagicRecordList2:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclflwMagicRecordList2:setAutoHeight(true);
    obj.rclflwMagicRecordList2:setMinHeight(5);
    obj.rclflwMagicRecordList2:setHitTest(false);
    obj.rclflwMagicRecordList2:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList2:setParent(obj.flwMagicRecordList2);
    obj.layBottomflwMagicRecordList2:setName("layBottomflwMagicRecordList2");
    obj.layBottomflwMagicRecordList2:setAlign("top");
    obj.layBottomflwMagicRecordList2:setHeight(36);

    obj.btnNovoflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList2:setParent(obj.layBottomflwMagicRecordList2);
    obj.btnNovoflwMagicRecordList2:setName("btnNovoflwMagicRecordList2");
    obj.btnNovoflwMagicRecordList2:setAlign("left");
    obj.btnNovoflwMagicRecordList2:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList2:setWidth(160);
    obj.btnNovoflwMagicRecordList2:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList2._recalcHeight();


    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.pgcPrincipal);
    obj.tab4:setTitle("Inventario");
    obj.tab4:setName("tab4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.tab4);
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#40000000");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);


			local function recalcularTamanhoEquipsEAtaques_()
			end;
			
			local function recalcularTamanhoEquipsDefesa_()
			end;
		
			local function recalcularTamanhoEquipsEAtaques()
				self.flwPartEquipAtack.height = self.rclEquips.height + self.labEquipAtackTit.height +
												self.layEquipAtackBottom.height + 
												self.flwPartEquipAtack.padding.top + self.flwPartEquipAtack.padding.bottom + 7;
			end;
			
			local function recalcularTamanhoEquipsDefesa()
				self.flwPartEquipDefense.height = self.rclEquipsDefense.height + self.labEquipDefense.height +
												self.layEquipDefenseBottom.height + 
												self.flwPartEquipDefense.padding.top + self.flwPartEquipDefense.padding.bottom + 7;
			end;			
		


    obj.popBag = GUI.fromHandle(_obj_newObject("popup"));
    obj.popBag:setParent(obj.rectangle5);
    obj.popBag:setName("popBag");
    obj.popBag:setWidth(250);
    obj.popBag:setHeight(250);
    obj.popBag:setBackOpacity(0.4);

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.popBag);
    obj.edit35:setAlign("top");
    obj.edit35:setField("nome");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");
    obj.edit35:setFontSize(15);
    obj.edit35:setFontColor("white");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.popBag);
    obj.flowLayout14:setAlign("top");
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxControlsPerLine(2);
    obj.flowLayout14:setMargins({bottom=4});
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setName("flowLayout14");
    obj.flowLayout14:setVertAlign("leading");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout14);
    obj.flowPart26:setMinWidth(30);
    obj.flowPart26:setMaxWidth(400);
    obj.flowPart26:setHeight(35);
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart26:setVertAlign("leading");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart26);
    obj.label48:setAlign("top");
    obj.label48:setFontSize(10);
    obj.label48:setText("PESO");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setWordWrap(true);
    obj.label48:setTextTrimming("none");
    obj.label48:setAutoSize(true);
    obj.label48:setName("label48");
    obj.label48:setFontColor("#D0D0D0");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart26);
    obj.edit36:setAlign("client");
    obj.edit36:setField("peso");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setFontSize(12);
    obj.edit36:setName("edit36");
    obj.edit36:setFontColor("white");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout14);
    obj.flowPart27:setMinWidth(30);
    obj.flowPart27:setMaxWidth(400);
    obj.flowPart27:setHeight(35);
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart27:setVertAlign("leading");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart27);
    obj.label49:setAlign("top");
    obj.label49:setFontSize(10);
    obj.label49:setText("CUSTO");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setWordWrap(true);
    obj.label49:setTextTrimming("none");
    obj.label49:setAutoSize(true);
    obj.label49:setName("label49");
    obj.label49:setFontColor("#D0D0D0");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart27);
    obj.edit37:setAlign("client");
    obj.edit37:setField("custo");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(12);
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("white");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.popBag);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setField("descricao");
    obj.textEditor10:setName("textEditor10");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.rectangle5);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.fraEquipamentoLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraEquipamentoLayout:setParent(obj.scrollBox4);
    obj.fraEquipamentoLayout:setAlign("top");
    obj.fraEquipamentoLayout:setHeight(500);
    obj.fraEquipamentoLayout:setMargins({left=10, right=10, top=10});
    obj.fraEquipamentoLayout:setAutoHeight(true);
    obj.fraEquipamentoLayout:setHorzAlign("center");
    obj.fraEquipamentoLayout:setLineSpacing(3);
    obj.fraEquipamentoLayout:setName("fraEquipamentoLayout");
    obj.fraEquipamentoLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraEquipamentoLayout:setMinScaledWidth(150);
    obj.fraEquipamentoLayout:setVertAlign("leading");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.fraEquipamentoLayout);
    obj.flowPart28:setHeight(600);
    obj.flowPart28:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart28:setMargins({left = 4, right = 4});
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setStepSizes({});
    obj.flowPart28:setMinWidth(300);
    obj.flowPart28:setMaxWidth(1600);
    obj.flowPart28:setMinScaledWidth(300);
    obj.flowPart28:setVertAlign("leading");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart28);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout5);
    obj.label50:setAlign("top");
    obj.label50:setAutoSize(true);
    obj.label50:setText("MOCHILA");
    obj.label50:setFontSize(12);
    obj.label50:setVertTextAlign("center");
    obj.label50:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setName("label50");
    obj.label50:setFontColor("white");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout5);
    obj.button7:setAlign("left");
    obj.button7:setText("+");
    obj.button7:setWidth(25);
    obj.button7:setHint("");
    obj.button7:setHorzTextAlign("center");
    obj.button7:setMargins({top=-10});
    obj.button7:setName("button7");

    obj.rclBackpack = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclBackpack:setParent(obj.flowPart28);
    obj.rclBackpack:setAlign("client");
    obj.rclBackpack:setName("rclBackpack");
    obj.rclBackpack:setField("listaDeItens");
    obj.rclBackpack:setTemplateForm("frmBackpackItem");
    obj.rclBackpack:setLayout("vertical");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.fraEquipamentoLayout);
    obj.flowPart29:setHeight(600);
    obj.flowPart29:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart29:setMargins({left = 4, right = 4});
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setStepSizes({});
    obj.flowPart29:setMinWidth(300);
    obj.flowPart29:setMaxWidth(1600);
    obj.flowPart29:setMinScaledWidth(300);
    obj.flowPart29:setVertAlign("leading");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart29);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout6);
    obj.label51:setAlign("top");
    obj.label51:setAutoSize(true);
    obj.label51:setText("EQUIPAMENTOS E OBJETOS");
    obj.label51:setFontSize(12);
    obj.label51:setVertTextAlign("center");
    obj.label51:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setName("label51");
    obj.label51:setFontColor("white");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout6);
    obj.button8:setAlign("left");
    obj.button8:setText("+");
    obj.button8:setWidth(25);
    obj.button8:setHint("");
    obj.button8:setHorzTextAlign("center");
    obj.button8:setMargins({top=-10});
    obj.button8:setName("button8");

    obj.rclEquipments = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipments:setParent(obj.flowPart29);
    obj.rclEquipments:setAlign("client");
    obj.rclEquipments:setName("rclEquipments");
    obj.rclEquipments:setField("listaDeEquipamentos");
    obj.rclEquipments:setTemplateForm("frmBackpackItem");
    obj.rclEquipments:setLayout("vertical");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.fraEquipamentoLayout);
    obj.flowPart30:setHeight(600);
    obj.flowPart30:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart30:setMargins({left = 4, right = 4});
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setStepSizes({});
    obj.flowPart30:setMinWidth(300);
    obj.flowPart30:setMaxWidth(1600);
    obj.flowPart30:setMinScaledWidth(300);
    obj.flowPart30:setVertAlign("leading");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart30);
    obj.label52:setAlign("top");
    obj.label52:setAutoSize(true);
    obj.label52:setText("EQUIPAMENTOS E POSSES");
    obj.label52:setFontSize(12);
    obj.label52:setVertTextAlign("center");
    obj.label52:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setName("label52");
    obj.label52:setFontColor("white");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.flowPart30);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("outrosEquipamentos");
    obj.textEditor11:setMargins({top=2});
    obj.textEditor11:setFontSize(16);
    obj.textEditor11:setName("textEditor11");
    obj.textEditor11:setTransparent(true);

    obj.flowLineBreak15 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.fraEquipamentoLayout);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.flwPartEquipAtack = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwPartEquipAtack:setParent(obj.fraEquipamentoLayout);
    obj.flwPartEquipAtack:setName("flwPartEquipAtack");
    obj.flwPartEquipAtack:setHeight(500);
    obj.flwPartEquipAtack:setFrameStyle("frames/panel5/frame.xml");
    obj.flwPartEquipAtack:setMinScaledWidth(290);
    obj.flwPartEquipAtack:setStepSizes({310, 420, 640, 760, 1150});
    obj.flwPartEquipAtack:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwPartEquipAtack:setVertAlign("leading");

    obj.labEquipAtackTit = GUI.fromHandle(_obj_newObject("label"));
    obj.labEquipAtackTit:setParent(obj.flwPartEquipAtack);
    obj.labEquipAtackTit:setName("labEquipAtackTit");
    obj.labEquipAtackTit:setAlign("top");
    obj.labEquipAtackTit:setAutoSize(true);
    obj.labEquipAtackTit:setText("EQUIPAMENTOS E ATAQUES");
    obj.labEquipAtackTit:setFontSize(12);
    obj.labEquipAtackTit:setVertTextAlign("center");
    obj.labEquipAtackTit:setHorzTextAlign("center");
    lfm_setPropAsString(obj.labEquipAtackTit, "fontStyle",  "bold");
    obj.labEquipAtackTit:setFontColor("white");

    obj.rclEquips = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquips:setParent(obj.flwPartEquipAtack);
    obj.rclEquips:setName("rclEquips");
    obj.rclEquips:setAlign("top");
    obj.rclEquips:setField("equipamentos.ataques");
    obj.rclEquips:setTemplateForm("frmEquipamentoItem");
    obj.rclEquips:setAutoHeight(true);
    obj.rclEquips:setMinHeight(5);
    obj.rclEquips:setMinQt(1);
    obj.rclEquips:setHitTest(false);

    obj.layEquipAtackBottom = GUI.fromHandle(_obj_newObject("layout"));
    obj.layEquipAtackBottom:setParent(obj.flwPartEquipAtack);
    obj.layEquipAtackBottom:setName("layEquipAtackBottom");
    obj.layEquipAtackBottom:setAlign("top");
    obj.layEquipAtackBottom:setHeight(40);

    obj.btnEquipAtackNew = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEquipAtackNew:setParent(obj.layEquipAtackBottom);
    obj.btnEquipAtackNew:setName("btnEquipAtackNew");
    obj.btnEquipAtackNew:setAlign("left");
    obj.btnEquipAtackNew:setText("Novo Item");
    obj.btnEquipAtackNew:setWidth(160);
    obj.btnEquipAtackNew:setMargins({top=4, bottom=4});

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.pgcPrincipal);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmBlank = GUI.fromHandle(_obj_newObject("form"));
    obj.frmBlank:setParent(obj.tab5);
    obj.frmBlank:setName("frmBlank");
    obj.frmBlank:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmBlank);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.scrollBox5);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("anotacoesLivres");
    obj.textEditor12:setName("textEditor12");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.pgcPrincipal);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab6);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.frmTemplateCreditos);
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#40000000");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.rectangle6);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox6);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(500);
    obj.image3:setHeight(345);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/GURPS4E/images/GURPS4E.png");
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox6);
    obj.image4:setLeft(550);
    obj.image4:setTop(0);
    obj.image4:setWidth(250);
    obj.image4:setHeight(250);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/GURPS4E/images/RPGmeister.jpg");
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox6);
    obj.image5:setLeft(850);
    obj.image5:setTop(0);
    obj.image5:setWidth(250);
    obj.image5:setHeight(250);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("/GURPS4E/images/Capa.png");
    obj.image5:setName("image5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox6);
    obj.layout7:setLeft(150);
    obj.layout7:setTop(250);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(160);
    obj.layout7:setName("layout7");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout7);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(15);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setName("rectangle7");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout7);
    obj.label53:setLeft(0);
    obj.label53:setTop(10);
    obj.label53:setWidth(200);
    obj.label53:setHeight(20);
    obj.label53:setText("Programador: Vinny (Ambesek)");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");
    obj.label53:setFontColor("white");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout7);
    obj.label54:setLeft(0);
    obj.label54:setTop(35);
    obj.label54:setWidth(200);
    obj.label54:setHeight(20);
    obj.label54:setText("Consultor: rexLiterate");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");
    obj.label54:setFontColor("white");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.scrollBox6);
    obj.label55:setLeft(555);
    obj.label55:setTop(300);
    obj.label55:setWidth(200);
    obj.label55:setHeight(20);
    obj.label55:setText("Versão Atual: ");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setField("versionInstalled");
    obj.label55:setName("label55");
    obj.label55:setFontColor("white");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.scrollBox6);
    obj.label56:setLeft(555);
    obj.label56:setTop(325);
    obj.label56:setWidth(200);
    obj.label56:setHeight(20);
    obj.label56:setText("Sua Versão: ");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setField("versionDownloaded");
    obj.label56:setName("label56");
    obj.label56:setFontColor("white");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox6);
    obj.button9:setLeft(555);
    obj.button9:setTop(350);
    obj.button9:setWidth(100);
    obj.button9:setText("Change Log");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox6);
    obj.button10:setLeft(667);
    obj.button10:setTop(350);
    obj.button10:setWidth(100);
    obj.button10:setText("Atualizar");
    obj.button10:setName("button10");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.scrollBox6);
    obj.label57:setLeft(555);
    obj.label57:setTop(400);
    obj.label57:setWidth(200);
    obj.label57:setHeight(20);
    obj.label57:setText("Conheça as Mesas:");
    obj.label57:setName("label57");
    obj.label57:setFontColor("white");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox6);
    obj.button11:setLeft(555);
    obj.button11:setTop(425);
    obj.button11:setWidth(100);
    obj.button11:setText("RPGmeister");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.scrollBox6);
    obj.button12:setLeft(667);
    obj.button12:setTop(425);
    obj.button12:setWidth(125);
    obj.button12:setText("[A] Homebound");
    obj.button12:setName("button12");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20GURPS%204E/output/Ficha%20GURPS%204E.rpk?raw=true",
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
                                Dialogs.choose("Há uma nova versão (" .. info.version .. ") do plugin de FURPS 4E. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20GURPS%204E/output/Ficha%20GURPS%204E.rpk?raw=true');
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

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
                            if sheet.arquetipo ~= nil then
                                sheet.arquetipo_pontos = sheet.arquetipo.custo;
                            end;
                            if sheet.advantages ~= nil then
                                sheet.vantagens_pontos = sheet.advantages.custo;
                            end;
                            if sheet.disadvantages ~= nil then
                                sheet.desvantagens_pontos = sheet.disadvantages.custo;
                            end;
                            if sheet.familiaridades ~= nil then
                                sheet.familiaridade_cultural = sheet.familiaridades.custo;
                            end;
                            if sheet.idiomas ~= nil then
                                sheet.idiomas_pontos = sheet.idiomas.custo;
                            end;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            								local vel = math.floor(tonumber(sheet.atributos_mod_velocidade) or 0);
            								sheet.dodge = vel + 3;
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popDetails");
            					
            							if sheet.arquetipo == nil then
            								sheet.arquetipo = {};
            								sheet.arquetipo.title = "Arquétipo";
            							else
            								sheet.arquetipo.title = "Arquétipo";
            							end;
            
            							if pop ~= nil then
            								pop:setNodeObject(sheet.arquetipo);
            								pop:showPopupEx("center", self);
            							elseif sheet.arquetipo == nil then
            								showMessage(sheet.arquetipo);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup para exibir");
            							end;
        end, obj);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popDetails");
            				
            						if sheet.advantages == nil then
            							sheet.advantages = {};
            							sheet.advantages.title = "Vantagens";
            						else
            							sheet.advantages.title = "Vantagens";
            						end;
            
            						if pop ~= nil then
            							pop:setNodeObject(sheet.advantages);
            							pop:showPopupEx("center", self);
            						elseif sheet.advantages == nil then
            							showMessage(sheet.advantages);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup para exibir");
            						end;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popDetails");
            				
            						if sheet.disadvantages == nil then
            							sheet.disadvantages = {};
            							sheet.disadvantages.title = "Desvantagens";
            						else
            							sheet.disadvantages.title = "Desvantagens";
            						end;
            
            						if pop ~= nil then
            							pop:setNodeObject(sheet.disadvantages);
            							pop:showPopupEx("center", self);
            						elseif sheet.disadvantages == nil then
            							showMessage(sheet.disadvantages);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup para exibir");
            						end;
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popDetails");
            					
            							if sheet.familiaridades == nil then
            								sheet.familiaridades = {};
            								sheet.familiaridades.title = "Familiaridades Culturais";
            							else
            								sheet.familiaridades.title = "Familiaridades Culturais";
            							end;
            
            							if pop ~= nil then
            								pop:setNodeObject(sheet.familiaridades);
            								pop:showPopupEx("center", self);
            							elseif sheet.familiaridades == nil then
            								showMessage(sheet.familiaridades);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup para exibir");
            							end;
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popDetails");
            					
            							if sheet.idiomas == nil then
            								sheet.idiomas = {};
            								sheet.idiomas.title = "Idiomas";
            							else
            								sheet.idiomas.title = "Idiomas";
            							end;
            
            							if pop ~= nil then
            								pop:setNodeObject(sheet.idiomas);
            								pop:showPopupEx("center", self);
            							elseif sheet.idiomas == nil then
            								showMessage(sheet.idiomas);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup para exibir");
            							end;
        end, obj);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            pointCount();
        end, obj);

    obj._e_event9 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            							local carga = tonumber(sheet.carga) or 0;
            
            							sheet.bc_0 = "Nenhuma (BC): " .. (carga);
            							sheet.bc_1 = "Leve (BCx2): " .. (carga*2);
            							sheet.bc_2 = "Média (BCx3): " .. (carga*3);
            							sheet.bc_3 = "Pesada (BCx6): " .. (carga*6);
            							sheet.bc_4 = "Muito Pesada (BCx10): " .. (carga*10);
        end, obj);

    obj._e_event10 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            							local velocidade = tonumber(sheet.atributos_mod_deslocamento) or 0;
            
            							sheet.db_0 = "DBx1: " .. (velocidade);
            							sheet.db_1 = "DBx0,8: " .. math.floor(velocidade*0.8);
            							sheet.db_2 = "DBx0,6: " .. math.floor(velocidade*0.6);
            							sheet.db_3 = "DBx0,4: " .. math.floor(velocidade*0.4);
            							sheet.db_4 = "DBx0,2: " .. math.floor(velocidade*0.2);
        end, obj);

    obj._e_event11 = obj.labupperGridMagicBox1:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox1._RecalcSize();
        end, obj);

    obj._e_event12 = obj.labupperGridMagicEditBox1:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox1._RecalcSize();
        end, obj);

    obj._e_event13 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclSkillsNew:append();
        end, obj);

    obj._e_event14 = obj.rclSkillsNew:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event15 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            pointCount();
        end, obj);

    obj._e_event16 = obj.fraAliadosOrganizacoes:addEventListener("onBeforeLayoutCalc",
        function (_)
            if self.fraAliadosOrganizacoes:getWidth() <= 500 then
            									self.prtAliados:setHeight(200);
            									self.prtFaccao:setHeight(200);									
            								else
            									self.prtAliados:setHeight(420);
            									self.prtFaccao:setHeight(350);
            								end;
        end, obj);

    obj._e_event17 = obj.rclflwMagicRecordList1:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList1._recalcHeight();
        end, obj);

    obj._e_event18 = obj.rclflwMagicRecordList1:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event19 = obj.btnNovoflwMagicRecordList1:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList1:append();
        end, obj);

    obj._e_event20 = obj.rclflwMagicRecordList2:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList2._recalcHeight();
        end, obj);

    obj._e_event21 = obj.rclflwMagicRecordList2:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event22 = obj.btnNovoflwMagicRecordList2:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList2:append();
        end, obj);

    obj._e_event23 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclBackpack:append();
        end, obj);

    obj._e_event24 = obj.rclBackpack:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event25 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclEquipments:append();
        end, obj);

    obj._e_event26 = obj.rclEquipments:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event27 = obj.labEquipAtackTit:addEventListener("onResize",
        function (_)
            recalcularTamanhoEquipsEAtaques();
        end, obj);

    obj._e_event28 = obj.rclEquips:addEventListener("onResize",
        function (_)
            recalcularTamanhoEquipsEAtaques();
        end, obj);

    obj._e_event29 = obj.rclEquips:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event30 = obj.btnEquipAtackNew:addEventListener("onClick",
        function (_)
            self.rclEquips:append();
        end, obj);

    obj._e_event31 = obj.button9:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20GURPS%204E/README.md')
        end, obj);

    obj._e_event32 = obj.button10:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20GURPS%204E/output/Ficha%20GURPS%204E.rpk?raw=true')
        end, obj);

    obj._e_event33 = obj.button11:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event34 = obj.button12:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=131156');
        end, obj);

    function obj:_releaseEvents()
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

        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.fraPoderesLayout ~= nil then self.fraPoderesLayout:destroy(); self.fraPoderesLayout = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.layEquipAtackBottom ~= nil then self.layEquipAtackBottom:destroy(); self.layEquipAtackBottom = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.prtAliados ~= nil then self.prtAliados:destroy(); self.prtAliados = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rclEquips ~= nil then self.rclEquips:destroy(); self.rclEquips = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.frmBlank ~= nil then self.frmBlank:destroy(); self.frmBlank = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.flwPartEquipAtack ~= nil then self.flwPartEquipAtack:destroy(); self.flwPartEquipAtack = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.fraCaracteristicasLayout ~= nil then self.fraCaracteristicasLayout:destroy(); self.fraCaracteristicasLayout = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flwMagicRecordList2 ~= nil then self.flwMagicRecordList2:destroy(); self.flwMagicRecordList2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.fraUpperGridCaracteristicas ~= nil then self.fraUpperGridCaracteristicas:destroy(); self.fraUpperGridCaracteristicas = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.popBag ~= nil then self.popBag:destroy(); self.popBag = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.btnEquipAtackNew ~= nil then self.btnEquipAtackNew:destroy(); self.btnEquipAtackNew = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.upperGridMagicBox1 ~= nil then self.upperGridMagicBox1:destroy(); self.upperGridMagicBox1 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.panupperGridMagicBox1 ~= nil then self.panupperGridMagicBox1:destroy(); self.panupperGridMagicBox1 = nil; end;
        if self.panupperGridMagicEditBox1 ~= nil then self.panupperGridMagicEditBox1:destroy(); self.panupperGridMagicEditBox1 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.rclSkillsNew ~= nil then self.rclSkillsNew:destroy(); self.rclSkillsNew = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.rclBackpack ~= nil then self.rclBackpack:destroy(); self.rclBackpack = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.labupperGridMagicBox1 ~= nil then self.labupperGridMagicBox1:destroy(); self.labupperGridMagicBox1 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.upperGridMagicEditBox1 ~= nil then self.upperGridMagicEditBox1:destroy(); self.upperGridMagicEditBox1 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rclflwMagicRecordList1 ~= nil then self.rclflwMagicRecordList1:destroy(); self.rclflwMagicRecordList1 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.popPower ~= nil then self.popPower:destroy(); self.popPower = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.rclflwMagicRecordList2 ~= nil then self.rclflwMagicRecordList2:destroy(); self.rclflwMagicRecordList2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.labEquipAtackTit ~= nil then self.labEquipAtackTit:destroy(); self.labEquipAtackTit = nil; end;
        if self.rclEquipments ~= nil then self.rclEquipments:destroy(); self.rclEquipments = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.fraFrenteLayoutNew ~= nil then self.fraFrenteLayoutNew:destroy(); self.fraFrenteLayoutNew = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.fraAliadosOrganizacoes ~= nil then self.fraAliadosOrganizacoes:destroy(); self.fraAliadosOrganizacoes = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.flwMagicRecordList1 ~= nil then self.flwMagicRecordList1:destroy(); self.flwMagicRecordList1 = nil; end;
        if self.layBottomflwMagicRecordList1 ~= nil then self.layBottomflwMagicRecordList1:destroy(); self.layBottomflwMagicRecordList1 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layBottomflwMagicRecordList2 ~= nil then self.layBottomflwMagicRecordList2:destroy(); self.layBottomflwMagicRecordList2 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.fraEquipamentoLayout ~= nil then self.fraEquipamentoLayout:destroy(); self.fraEquipamentoLayout = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.prtFaccao ~= nil then self.prtFaccao:destroy(); self.prtFaccao = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.popDetails ~= nil then self.popDetails:destroy(); self.popDetails = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.btnNovoflwMagicRecordList2 ~= nil then self.btnNovoflwMagicRecordList2:destroy(); self.btnNovoflwMagicRecordList2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.btnNovoflwMagicRecordList1 ~= nil then self.btnNovoflwMagicRecordList1:destroy(); self.btnNovoflwMagicRecordList1 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.labupperGridMagicBox1val ~= nil then self.labupperGridMagicBox1val:destroy(); self.labupperGridMagicBox1val = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.labupperGridMagicEditBox1 ~= nil then self.labupperGridMagicEditBox1:destroy(); self.labupperGridMagicEditBox1 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edtupperGridMagicEditBox1 ~= nil then self.edtupperGridMagicEditBox1:destroy(); self.edtupperGridMagicEditBox1 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
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
    dataType = "Ambesek.Nefertyne.GURPS", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha GURPS 4E", 
    description=""};

frmTemplate = _frmTemplate;
Firecast.registrarForm(_frmTemplate);
Firecast.registrarDataType(_frmTemplate);

return _frmTemplate;
