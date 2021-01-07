require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaSW5e()
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
    obj:setName("frmFichaSW5e");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.FichaSW5e");
    obj:setTitle("Ficha Star Wars 5e");
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

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.tab1);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.fraFrenteLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraFrenteLayout:setParent(obj.scrollBox1);
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

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.fraFrenteLayout);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMinScaledWidth(290);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout1:setVertAlign("leading");

    obj.flwNome1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwNome1:setParent(obj.flowLayout1);
    obj.flwNome1:setName("flwNome1");
    obj.flwNome1:setMinWidth(320);
    obj.flwNome1:setMaxWidth(1600);
    obj.flwNome1:setFrameStyle("frames/banner/heroGroup.xml");
    obj.flwNome1:setHeight(175);
    obj.flwNome1:setVertAlign("center");
    obj.flwNome1:setAvoidScale(true);
    obj.flwNome1:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layNomeHolderFrente = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNomeHolderFrente:setParent(obj.flwNome1);
    obj.layNomeHolderFrente:setAlign("client");
    obj.layNomeHolderFrente:setName("layNomeHolderFrente");

    obj.edtNome1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNome1:setParent(obj.layNomeHolderFrente);
    obj.edtNome1:setName("edtNome1");
    obj.edtNome1:setField("nome");
    obj.edtNome1:setFontSize(17);
    obj.edtNome1:setAlign("client");
    obj.edtNome1:setFontColor("white");
    obj.edtNome1:setVertTextAlign("center");
    obj.edtNome1:setTransparent(true);

    obj.labNome1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labNome1:setParent(obj.layNomeHolderFrente);
    obj.labNome1:setMargins({left=3});
    obj.labNome1:setName("labNome1");
    obj.labNome1:setAlign("bottom");
    obj.labNome1:setText("NOME DO PERSONAGEM");
    obj.labNome1:setAutoSize(true);
    obj.labNome1:setFontSize(12);
    obj.labNome1:setFontColor("#D0D0D0");

    obj.fraUpperGridFrente = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridFrente:setParent(obj.flowLayout1);
    obj.fraUpperGridFrente:setMinWidth(320);
    obj.fraUpperGridFrente:setMaxWidth(1600);
    obj.fraUpperGridFrente:setName("fraUpperGridFrente");
    obj.fraUpperGridFrente:setAvoidScale(true);
    obj.fraUpperGridFrente:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridFrente:setAutoHeight(true);
    obj.fraUpperGridFrente:setVertAlign("trailing");
    obj.fraUpperGridFrente:setMaxControlsPerLine(3);
    obj.fraUpperGridFrente:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo1 = GUI.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo1 = GUI.fromHandle(_obj_newObject("edit"));
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
    obj.labUpperGridCampo1:setText("CLASSE E NIVEL");
    obj.labUpperGridCampo1:setVertTextAlign("leading");
    obj.labUpperGridCampo1:setWordWrap(true);
    obj.labUpperGridCampo1:setTextTrimming("none");
    obj.labUpperGridCampo1:setFontSize(12);
    obj.labUpperGridCampo1:setFontColor("#D0D0D0");

    self.UpperGridCampo1:setHeight(self.edtUpperGridCampo1:getHeight() + self.labUpperGridCampo1:getHeight() + self.linUpperGridCampo1:getHeight());


    obj.UpperGridCampo2 = GUI.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo2 = GUI.fromHandle(_obj_newObject("edit"));
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
    obj.labUpperGridCampo2:setText("ANTECEDENTES");
    obj.labUpperGridCampo2:setVertTextAlign("leading");
    obj.labUpperGridCampo2:setWordWrap(true);
    obj.labUpperGridCampo2:setTextTrimming("none");
    obj.labUpperGridCampo2:setFontSize(12);
    obj.labUpperGridCampo2:setFontColor("#D0D0D0");

    self.UpperGridCampo2:setHeight(self.edtUpperGridCampo2:getHeight() + self.labUpperGridCampo2:getHeight() + self.linUpperGridCampo2:getHeight());


    obj.UpperGridCampo3 = GUI.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo3 = GUI.fromHandle(_obj_newObject("edit"));
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
    obj.labUpperGridCampo3:setText("JOGADOR");
    obj.labUpperGridCampo3:setVertTextAlign("leading");
    obj.labUpperGridCampo3:setWordWrap(true);
    obj.labUpperGridCampo3:setTextTrimming("none");
    obj.labUpperGridCampo3:setFontSize(12);
    obj.labUpperGridCampo3:setFontColor("#D0D0D0");

    self.UpperGridCampo3:setHeight(self.edtUpperGridCampo3:getHeight() + self.labUpperGridCampo3:getHeight() + self.linUpperGridCampo3:getHeight());


    obj.UpperGridCampo4 = GUI.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo4 = GUI.fromHandle(_obj_newObject("edit"));
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
    obj.labUpperGridCampo4:setText("ESPECIE");
    obj.labUpperGridCampo4:setVertTextAlign("leading");
    obj.labUpperGridCampo4:setWordWrap(true);
    obj.labUpperGridCampo4:setTextTrimming("none");
    obj.labUpperGridCampo4:setFontSize(12);
    obj.labUpperGridCampo4:setFontColor("#D0D0D0");

    self.UpperGridCampo4:setHeight(self.edtUpperGridCampo4:getHeight() + self.labUpperGridCampo4:getHeight() + self.linUpperGridCampo4:getHeight());


    obj.UpperGridCampo5 = GUI.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo5 = GUI.fromHandle(_obj_newObject("edit"));
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
    obj.labUpperGridCampo5:setText("TENDÊNCIA");
    obj.labUpperGridCampo5:setVertTextAlign("leading");
    obj.labUpperGridCampo5:setWordWrap(true);
    obj.labUpperGridCampo5:setTextTrimming("none");
    obj.labUpperGridCampo5:setFontSize(12);
    obj.labUpperGridCampo5:setFontColor("#D0D0D0");

    self.UpperGridCampo5:setHeight(self.edtUpperGridCampo5:getHeight() + self.labUpperGridCampo5:getHeight() + self.linUpperGridCampo5:getHeight());


    obj.UpperGridCampo6 = GUI.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo6 = GUI.fromHandle(_obj_newObject("edit"));
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
    obj.labUpperGridCampo6:setText("EXPERIÊNCIA");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraFrenteLayout);
    obj.flowLayout2:setHorzAlign("justify");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout2:setMinScaledWidth(300);
    obj.flowLayout2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout2:setVertAlign("leading");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout2);
    obj.flowPart1:setMinWidth(280);
    obj.flowPart1:setMaxWidth(800);
    obj.flowPart1:setHeight(64);
    obj.flowPart1:setFrameStyle("frames/posCaptionEdit1/frame.xml");
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("inspiracao");
    obj.edit1:setWidth(65);
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(15);
    obj.edit1:setFontColor("white");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("client");
    obj.label1:setText("INSPIRAÇÃO");
    obj.label1:setMargins({left=10});
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontSize(12);
    obj.label1:setFontColor("#D0D0D0");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMinWidth(280);
    obj.flowPart2:setMaxWidth(800);
    obj.flowPart2:setHeight(64);
    obj.flowPart2:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart2:setVertAlign("leading");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("left");
    obj.edit2:setField("bonusProficiencia");
    obj.edit2:setWidth(70);
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontSize(15);
    obj.edit2:setFontColor("white");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("client");
    obj.label2:setText("BONUS DE PROFICIÊNCIA");
    obj.label2:setMargins({left=10});
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#D0D0D0");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setMinWidth(280);
    obj.flowPart3:setMaxWidth(800);
    obj.flowPart3:setHeight(64);
    obj.flowPart3:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("left");
    obj.edit3:setField("sabedoriaPassiva");
    obj.edit3:setWidth(70);
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(15);
    obj.edit3:setFontColor("white");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("client");
    obj.label3:setText("SABEDORIA PASSIVA (PERCEPÇÃO)");
    obj.label3:setTextTrimming("none");
    obj.label3:setWordWrap(true);
    obj.label3:setMargins({left=10});
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");
    obj.label3:setFontSize(12);
    obj.label3:setFontColor("#D0D0D0");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.fraFrenteLayout);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMinScaledWidth(290);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout3:setVertAlign("leading");

    obj.fraLayAtributos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayAtributos:setParent(obj.flowLayout3);
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

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.fraLayAtributos);
    obj.dataLink1:setField("atributos.forca");
    obj.dataLink1:setName("dataLink1");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.fraLayAtributos);
    obj.flowPart4:setHeight(140);
    obj.flowPart4:setMinWidth(128);
    obj.flowPart4:setMaxWidth(128);
    obj.flowPart4:setMinScaledWidth(128);
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

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setAlign("top");
    obj.edit4:setMargins({left=30, right=30});
    obj.edit4:setField("atributos.forca");
    obj.edit4:setHeight(30);
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setMax(99);
    obj.edit4:setName("edit4");
    obj.edit4:setTransparent(true);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(15);
    obj.edit4:setFontColor("white");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setFrameRegion("modificador");
    obj.label4:setField("atributos.modforcastr");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setVertTextAlign("center");
    obj.label4:setFontSize(46);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");
    obj.label4:setFontColor("white");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart4);
    obj.label5:setFrameRegion("titulo");
    obj.label5:setText("FORÇA");
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");
    obj.label5:setFontColor("white");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.fraLayAtributos);
    obj.dataLink2:setField("atributos.destreza");
    obj.dataLink2:setName("dataLink2");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.fraLayAtributos);
    obj.flowPart5:setHeight(140);
    obj.flowPart5:setMinWidth(128);
    obj.flowPart5:setMaxWidth(128);
    obj.flowPart5:setMinScaledWidth(128);
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

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setAlign("top");
    obj.edit5:setMargins({left=30, right=30});
    obj.edit5:setField("atributos.destreza");
    obj.edit5:setHeight(30);
    obj.edit5:setType("number");
    obj.edit5:setMin(0);
    obj.edit5:setMax(99);
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontSize(15);
    obj.edit5:setFontColor("white");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart5);
    obj.label6:setFrameRegion("modificador");
    obj.label6:setField("atributos.moddestrezastr");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setVertTextAlign("center");
    obj.label6:setFontSize(46);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart5);
    obj.label7:setFrameRegion("titulo");
    obj.label7:setText("DESTREZA");
    obj.label7:setVertTextAlign("center");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.fraLayAtributos);
    obj.dataLink3:setField("atributos.constituicao");
    obj.dataLink3:setName("dataLink3");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.fraLayAtributos);
    obj.flowPart6:setHeight(140);
    obj.flowPart6:setMinWidth(128);
    obj.flowPart6:setMaxWidth(128);
    obj.flowPart6:setMinScaledWidth(128);
    obj.flowPart6:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart6:setVertAlign("leading");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart6);
    obj.layout3:setLeft(6);
    obj.layout3:setTop(12);
    obj.layout3:setWidth(116);
    obj.layout3:setHeight(115);
    obj.layout3:setName("layout3");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setAlign("top");
    obj.edit6:setMargins({left=30, right=30});
    obj.edit6:setField("atributos.constituicao");
    obj.edit6:setHeight(30);
    obj.edit6:setType("number");
    obj.edit6:setMin(0);
    obj.edit6:setMax(99);
    obj.edit6:setName("edit6");
    obj.edit6:setTransparent(true);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontSize(15);
    obj.edit6:setFontColor("white");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart6);
    obj.label8:setFrameRegion("modificador");
    obj.label8:setField("atributos.modconstituicaostr");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("center");
    obj.label8:setFontSize(46);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart6);
    obj.label9:setFrameRegion("titulo");
    obj.label9:setText("CONSTITUIÇÃO");
    obj.label9:setVertTextAlign("center");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.fraLayAtributos);
    obj.dataLink4:setField("atributos.inteligencia");
    obj.dataLink4:setName("dataLink4");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.fraLayAtributos);
    obj.flowPart7:setHeight(140);
    obj.flowPart7:setMinWidth(128);
    obj.flowPart7:setMaxWidth(128);
    obj.flowPart7:setMinScaledWidth(128);
    obj.flowPart7:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart7:setVertAlign("leading");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart7);
    obj.layout4:setLeft(6);
    obj.layout4:setTop(12);
    obj.layout4:setWidth(116);
    obj.layout4:setHeight(115);
    obj.layout4:setName("layout4");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setAlign("top");
    obj.edit7:setMargins({left=30, right=30});
    obj.edit7:setField("atributos.inteligencia");
    obj.edit7:setHeight(30);
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setMax(99);
    obj.edit7:setName("edit7");
    obj.edit7:setTransparent(true);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(15);
    obj.edit7:setFontColor("white");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart7);
    obj.label10:setFrameRegion("modificador");
    obj.label10:setField("atributos.modinteligenciastr");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("center");
    obj.label10:setFontSize(46);
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart7);
    obj.label11:setFrameRegion("titulo");
    obj.label11:setText("INTELIGÊNCIA");
    obj.label11:setVertTextAlign("center");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");
    obj.label11:setFontColor("white");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.fraLayAtributos);
    obj.dataLink5:setField("atributos.sabedoria");
    obj.dataLink5:setName("dataLink5");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.fraLayAtributos);
    obj.flowPart8:setHeight(140);
    obj.flowPart8:setMinWidth(128);
    obj.flowPart8:setMaxWidth(128);
    obj.flowPart8:setMinScaledWidth(128);
    obj.flowPart8:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart8:setVertAlign("leading");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart8);
    obj.layout5:setLeft(6);
    obj.layout5:setTop(12);
    obj.layout5:setWidth(116);
    obj.layout5:setHeight(115);
    obj.layout5:setName("layout5");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout5);
    obj.edit8:setAlign("top");
    obj.edit8:setMargins({left=30, right=30});
    obj.edit8:setField("atributos.sabedoria");
    obj.edit8:setHeight(30);
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setMax(99);
    obj.edit8:setName("edit8");
    obj.edit8:setTransparent(true);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(15);
    obj.edit8:setFontColor("white");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart8);
    obj.label12:setFrameRegion("modificador");
    obj.label12:setField("atributos.modsabedoriastr");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("center");
    obj.label12:setFontSize(46);
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart8);
    obj.label13:setFrameRegion("titulo");
    obj.label13:setText("SABEDORIA");
    obj.label13:setVertTextAlign("center");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");
    obj.label13:setFontColor("white");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.fraLayAtributos);
    obj.dataLink6:setField("atributos.carisma");
    obj.dataLink6:setName("dataLink6");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.fraLayAtributos);
    obj.flowPart9:setHeight(140);
    obj.flowPart9:setMinWidth(128);
    obj.flowPart9:setMaxWidth(128);
    obj.flowPart9:setMinScaledWidth(128);
    obj.flowPart9:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart9:setVertAlign("leading");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart9);
    obj.layout6:setLeft(6);
    obj.layout6:setTop(12);
    obj.layout6:setWidth(116);
    obj.layout6:setHeight(115);
    obj.layout6:setName("layout6");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout6);
    obj.edit9:setAlign("top");
    obj.edit9:setMargins({left=30, right=30});
    obj.edit9:setField("atributos.carisma");
    obj.edit9:setHeight(30);
    obj.edit9:setType("number");
    obj.edit9:setMin(0);
    obj.edit9:setMax(99);
    obj.edit9:setName("edit9");
    obj.edit9:setTransparent(true);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(15);
    obj.edit9:setFontColor("white");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart9);
    obj.label14:setFrameRegion("modificador");
    obj.label14:setField("atributos.modcarismastr");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("center");
    obj.label14:setFontSize(46);
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart9);
    obj.label15:setFrameRegion("titulo");
    obj.label15:setText("CARISMA");
    obj.label15:setVertTextAlign("center");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowLayout3);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setVertAlign("leading");
    obj.flowLayout4:setMaxControlsPerLine(1);
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setStepSizes({310, 360});
    obj.flowLayout4:setMinScaledWidth(300);
    obj.flowLayout4:setMaxScaledWidth(340);
    obj.flowLayout4:setAvoidScale(true);
    obj.flowLayout4:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowLayout4);
    obj.flowLayout5:setMinWidth(235);
    obj.flowLayout5:setMaxWidth(475);
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setAvoidScale(false);
    obj.flowLayout5:setVertAlign("center");
    obj.flowLayout5:setHorzAlign("justify");
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout5);
    obj.flowPart10:setStepSizes({105});
    obj.flowPart10:setMinScaledWidth(75);
    obj.flowPart10:setHeight(120);
    obj.flowPart10:setFrameStyle("frames/shield/frame.xml");
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart10);
    obj.label16:setAlign("top");
    obj.label16:setText("CLASSE DE ARMADURA");
    obj.label16:setHeight(20);
    obj.label16:setFontSize(9);
    obj.label16:setWordWrap(true);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setTextTrimming("none");
    obj.label16:setName("label16");
    obj.label16:setFontColor("white");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart10);
    obj.edit10:setAlign("client");
    obj.edit10:setField("CA");
    obj.edit10:setFontSize(30);
    obj.edit10:setName("edit10");
    obj.edit10:setTransparent(true);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontColor("white");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout5);
    obj.flowPart11:setStepSizes({105});
    obj.flowPart11:setMinScaledWidth(75);
    obj.flowPart11:setHeight(120);
    obj.flowPart11:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart11);
    obj.label17:setAlign("top");
    obj.label17:setText("INICIATIVA");
    obj.label17:setHeight(20);
    obj.label17:setFontSize(9);
    obj.label17:setWordWrap(true);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setTextTrimming("none");
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart11);
    obj.edit11:setAlign("client");
    obj.edit11:setField("iniciativa");
    obj.edit11:setFontSize(30);
    obj.edit11:setName("edit11");
    obj.edit11:setTransparent(true);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontColor("white");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout5);
    obj.flowPart12:setStepSizes({105});
    obj.flowPart12:setMinScaledWidth(75);
    obj.flowPart12:setHeight(120);
    obj.flowPart12:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart12:setVertAlign("leading");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart12);
    obj.label18:setAlign("top");
    obj.label18:setText("VISÂO");
    obj.label18:setHeight(20);
    obj.label18:setFontSize(9);
    obj.label18:setWordWrap(true);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setTextTrimming("none");
    obj.label18:setName("label18");
    obj.label18:setFontColor("white");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart12);
    obj.edit12:setAlign("client");
    obj.edit12:setField("visao");
    obj.edit12:setFontSize(30);
    obj.edit12:setName("edit12");
    obj.edit12:setTransparent(true);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("white");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout4);
    obj.flowPart13:setMinWidth(235);
    obj.flowPart13:setMaxWidth(475);
    obj.flowPart13:setMinScaledWidth(200);
    obj.flowPart13:setHeight(175);
    obj.flowPart13:setMargins({left=2, right=2, top=4, bottom=8});
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setVertAlign("leading");

    obj.frame1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame1:setParent(obj.flowPart13);
    obj.frame1:setAlign("client");
    obj.frame1:setFrameStyle("frames/panel5/topPanel.xml");
    obj.frame1:setMargins({left = 4, right = 4, bottom=4});
    obj.frame1:setName("frame1");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.frame1);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout7);
    obj.label19:setAlign("left");
    obj.label19:setAutoSize(true);
    obj.label19:setText("PONTOS DE VIDA MÁXIMO:");
    obj.label19:setTextTrimming("none");
    obj.label19:setWordWrap(false);
    obj.label19:setFontSize(12);
    obj.label19:setHorzTextAlign("trailing");
    obj.label19:setName("label19");
    obj.label19:setFontColor("#D0D0D0");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("client");
    obj.layout8:setMargins({left=5, right=3});
    obj.layout8:setName("layout8");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout8);
    obj.edit13:setAlign("client");
    obj.edit13:setField("PVMax");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(15);
    obj.edit13:setFontColor("white");
    obj.edit13:setTransparent(true);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout8);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeColor("gray");
    obj.horzLine1:setName("horzLine1");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.frame1);
    obj.edit14:setAlign("client");
    obj.edit14:setField("PV");
    obj.edit14:setMargins({top=2});
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setFontSize(36);
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("white");
    obj.edit14:setTransparent(true);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.frame1);
    obj.label20:setAlign("bottom");
    obj.label20:setAutoSize(true);
    obj.label20:setText("PONTOS DE VIDA ATUAL");
    obj.label20:setFontSize(11);
    obj.label20:setVertTextAlign("center");
    obj.label20:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setName("label20");
    obj.label20:setFontColor("white");

    obj.frame2 = GUI.fromHandle(_obj_newObject("frame"));
    obj.frame2:setParent(obj.flowPart13);
    obj.frame2:setAlign("bottom");
    obj.frame2:setHeight(70);
    obj.frame2:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.frame2:setMargins({left = 4, right = 4});
    obj.frame2:setName("frame2");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.frame2);
    obj.edit15:setAlign("client");
    obj.edit15:setField("PVTemporario");
    obj.edit15:setMargins({top=2});
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setFontSize(36);
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("white");
    obj.edit15:setTransparent(true);

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.frame2);
    obj.label21:setAlign("bottom");
    obj.label21:setAutoSize(true);
    obj.label21:setText("PONTOS DE VIDA TEMPORÁRIOS");
    obj.label21:setFontSize(11);
    obj.label21:setVertTextAlign("center");
    obj.label21:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowLayout4);
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMinWidth(235);
    obj.flowLayout6:setMaxWidth(475);
    obj.flowLayout6:setMinScaledWidth(235);
    obj.flowLayout6:setHorzAlign("justify");
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout6:setVertAlign("leading");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout6);
    obj.flowPart14:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart14:setStepSizes({130, 150, 160});
    obj.flowPart14:setHeight(100);
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart14:setVertAlign("leading");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart14);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout9);
    obj.label22:setAlign("left");
    obj.label22:setAutoSize(true);
    obj.label22:setText("TOTAL:");
    obj.label22:setTextTrimming("none");
    obj.label22:setWordWrap(false);
    obj.label22:setFontSize(10);
    obj.label22:setHorzTextAlign("trailing");
    obj.label22:setName("label22");
    obj.label22:setFontColor("#D0D0D0");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("client");
    obj.layout10:setMargins({left=5, right=3});
    obj.layout10:setName("layout10");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout10);
    obj.edit16:setAlign("client");
    obj.edit16:setField("DadosDeVidaTotal");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");
    obj.edit16:setFontSize(15);
    obj.edit16:setFontColor("white");
    obj.edit16:setTransparent(true);

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout10);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setStrokeColor("gray");
    obj.horzLine2:setName("horzLine2");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart14);
    obj.edit17:setAlign("client");
    obj.edit17:setField("DadosDeVida");
    obj.edit17:setMargins({top=2});
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setFontSize(21);
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("white");
    obj.edit17:setTransparent(true);

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart14);
    obj.label23:setAlign("bottom");
    obj.label23:setAutoSize(true);
    obj.label23:setText("DADOS DE VIDA");
    obj.label23:setFontSize(11);
    obj.label23:setVertTextAlign("center");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");
    obj.label23:setFontColor("white");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout6);
    obj.flowPart15:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart15:setStepSizes({170, 170});
    obj.flowPart15:setHeight(100);
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart15:setVertAlign("leading");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart15);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setMargins({left=2});
    obj.layout11:setName("layout11");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout11);
    obj.label24:setAlign("client");
    obj.label24:setAutoSize(true);
    obj.label24:setFontSize(10);
    obj.label24:setText("SUCESSOS");
    obj.label24:setWordWrap(false);
    obj.label24:setVertTextAlign("center");
    obj.label24:setHorzTextAlign("trailing");
    obj.label24:setMargins({right=6});
    obj.label24:setName("label24");
    obj.label24:setFontColor("white");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout11);
    obj.imageCheckBox1:setAlign("right");
    obj.imageCheckBox1:setWidth(25);
    obj.imageCheckBox1:setMargins({right=2});
    obj.imageCheckBox1:setField("testesContraMorte.s0");
    obj.imageCheckBox1:setOptimize(false);
    obj.imageCheckBox1:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox1:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox1:setName("imageCheckBox1");
    obj.imageCheckBox1:setHeight(20);

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout11);
    obj.imageCheckBox2:setAlign("right");
    obj.imageCheckBox2:setWidth(25);
    obj.imageCheckBox2:setMargins({right=2});
    obj.imageCheckBox2:setField("testesContraMorte.s1");
    obj.imageCheckBox2:setOptimize(false);
    obj.imageCheckBox2:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox2:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox2:setName("imageCheckBox2");
    obj.imageCheckBox2:setHeight(20);

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout11);
    obj.imageCheckBox3:setAlign("right");
    obj.imageCheckBox3:setWidth(25);
    obj.imageCheckBox3:setMargins({right=6});
    obj.imageCheckBox3:setField("testesContraMorte.s2");
    obj.imageCheckBox3:setOptimize(false);
    obj.imageCheckBox3:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox3:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox3:setName("imageCheckBox3");
    obj.imageCheckBox3:setHeight(20);

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart15);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setMargins({left=2, top = 4});
    obj.layout12:setName("layout12");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout12);
    obj.label25:setAlign("client");
    obj.label25:setAutoSize(true);
    obj.label25:setFontSize(10);
    obj.label25:setText("FALHAS");
    obj.label25:setVertTextAlign("center");
    obj.label25:setHorzTextAlign("trailing");
    obj.label25:setMargins({right=6});
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout12);
    obj.imageCheckBox4:setAlign("right");
    obj.imageCheckBox4:setWidth(25);
    obj.imageCheckBox4:setMargins({right=2});
    obj.imageCheckBox4:setField("testesContraMorte.f0");
    obj.imageCheckBox4:setOptimize(false);
    obj.imageCheckBox4:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox4:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox4:setName("imageCheckBox4");
    obj.imageCheckBox4:setHeight(20);

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout12);
    obj.imageCheckBox5:setAlign("right");
    obj.imageCheckBox5:setWidth(25);
    obj.imageCheckBox5:setMargins({right=2});
    obj.imageCheckBox5:setField("testesContraMorte.f1");
    obj.imageCheckBox5:setOptimize(false);
    obj.imageCheckBox5:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox5:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox5:setName("imageCheckBox5");
    obj.imageCheckBox5:setHeight(20);

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout12);
    obj.imageCheckBox6:setAlign("right");
    obj.imageCheckBox6:setWidth(25);
    obj.imageCheckBox6:setMargins({right=6});
    obj.imageCheckBox6:setField("testesContraMorte.f2");
    obj.imageCheckBox6:setOptimize(false);
    obj.imageCheckBox6:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox6:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox6:setName("imageCheckBox6");
    obj.imageCheckBox6:setHeight(20);

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart15);
    obj.label26:setAlign("bottom");
    obj.label26:setAutoSize(true);
    obj.label26:setText("TESTE CONTRA MORTE");
    obj.label26:setFontSize(11);
    obj.label26:setVertTextAlign("center");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowLayout4);
    obj.flowLayout7:setMinWidth(235);
    obj.flowLayout7:setMaxWidth(475);
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setAvoidScale(false);
    obj.flowLayout7:setVertAlign("center");
    obj.flowLayout7:setHorzAlign("justify");
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout7);
    obj.flowPart16:setStepSizes({105});
    obj.flowPart16:setMinScaledWidth(75);
    obj.flowPart16:setHeight(120);
    obj.flowPart16:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart16:setVertAlign("leading");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart16);
    obj.label27:setAlign("top");
    obj.label27:setText("BASE");
    obj.label27:setHeight(20);
    obj.label27:setFontSize(9);
    obj.label27:setWordWrap(true);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setTextTrimming("none");
    obj.label27:setName("label27");
    obj.label27:setFontColor("white");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart16);
    obj.edit18:setAlign("client");
    obj.edit18:setField("deslocamento_base");
    obj.edit18:setFontSize(30);
    obj.edit18:setName("edit18");
    obj.edit18:setTransparent(true);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontColor("white");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout7);
    obj.flowPart17:setStepSizes({105});
    obj.flowPart17:setMinScaledWidth(75);
    obj.flowPart17:setHeight(120);
    obj.flowPart17:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart17:setVertAlign("leading");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart17);
    obj.label28:setAlign("top");
    obj.label28:setText("HORA");
    obj.label28:setHeight(20);
    obj.label28:setFontSize(9);
    obj.label28:setWordWrap(true);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setTextTrimming("none");
    obj.label28:setName("label28");
    obj.label28:setFontColor("white");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart17);
    obj.edit19:setAlign("client");
    obj.edit19:setField("deslocamento_hora");
    obj.edit19:setFontSize(30);
    obj.edit19:setName("edit19");
    obj.edit19:setTransparent(true);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontColor("white");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout7);
    obj.flowPart18:setStepSizes({105});
    obj.flowPart18:setMinScaledWidth(75);
    obj.flowPart18:setHeight(120);
    obj.flowPart18:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart18:setVertAlign("leading");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart18);
    obj.label29:setAlign("top");
    obj.label29:setText("DIA");
    obj.label29:setHeight(20);
    obj.label29:setFontSize(9);
    obj.label29:setWordWrap(true);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setTextTrimming("none");
    obj.label29:setName("label29");
    obj.label29:setFontColor("white");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart18);
    obj.edit20:setAlign("client");
    obj.edit20:setField("deslocamento_dia");
    obj.edit20:setFontSize(30);
    obj.edit20:setName("edit20");
    obj.edit20:setTransparent(true);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontColor("white");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowLayout3);
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setHorzAlign("center");
    obj.flowLayout8:setVertAlign("leading");
    obj.flowLayout8:setMaxControlsPerLine(1);
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setStepSizes({310, 360});
    obj.flowLayout8:setMinScaledWidth(300);
    obj.flowLayout8:setMaxScaledWidth(340);
    obj.flowLayout8:setAvoidScale(true);
    obj.flowLayout8:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout8);
    obj.flowPart19:setHeight(300);
    obj.flowPart19:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart19:setMargins({left = 0, right = 4});
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setStepSizes({});
    obj.flowPart19:setMinWidth(300);
    obj.flowPart19:setMaxWidth(1600);
    obj.flowPart19:setMinScaledWidth(300);
    obj.flowPart19:setVertAlign("leading");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.flowPart19);
    obj.image1:setAlign("client");
    obj.image1:setStyle("autoFit");
    obj.image1:setField("imagens.aparencia");
    obj.image1:setMargins({top=2});
    obj.image1:setEditable(true);
    obj.image1:setName("image1");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart19);
    obj.label30:setAlign("bottom");
    obj.label30:setAutoSize(true);
    obj.label30:setText("APARÊNCIA");
    obj.label30:setFontSize(12);
    obj.label30:setVertTextAlign("center");
    obj.label30:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setName("label30");
    obj.label30:setFontColor("white");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout8);
    obj.flowPart20:setHeight(300);
    obj.flowPart20:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart20:setMargins({left = 0, right = 4});
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setStepSizes({});
    obj.flowPart20:setMinWidth(300);
    obj.flowPart20:setMaxWidth(1600);
    obj.flowPart20:setMinScaledWidth(300);
    obj.flowPart20:setVertAlign("leading");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowPart20);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("notes0");
    obj.textEditor1:setMargins({top=2});
    obj.textEditor1:setFontSize(16);
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setTransparent(true);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart20);
    obj.label31:setAlign("bottom");
    obj.label31:setAutoSize(true);
    obj.label31:setText("OUTROS");
    obj.label31:setFontSize(12);
    obj.label31:setVertTextAlign("center");
    obj.label31:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Ataques");
    obj.tab2:setName("tab2");

    obj.frmAtaques = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAtaques:setParent(obj.tab2);
    obj.frmAtaques:setName("frmAtaques");
    obj.frmAtaques:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmAtaques);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.scrollBox2);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxColumns(3);
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setOrientation("vertical");
    obj.flowLayout9:setAvoidScale(true);
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout9:setVertAlign("leading");

    obj.campoDosAtaquesPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosAtaquesPart:setParent(obj.flowLayout9);
    obj.campoDosAtaquesPart:setMinWidth(300);
    obj.campoDosAtaquesPart:setMaxWidth(600);
    obj.campoDosAtaquesPart:setHeight(25);
    obj.campoDosAtaquesPart:setMinScaledWidth(280);
    obj.campoDosAtaquesPart:setName("campoDosAtaquesPart");
    obj.campoDosAtaquesPart:setAdjustHeightToLine(false);
    obj.campoDosAtaquesPart:setMargins({left=5});
    obj.campoDosAtaquesPart:setVertAlign("leading");


					rawset(self.campoDosAtaquesPart, "_recalcHeight", 					
						function ()
							self.campoDosAtaquesPart.height = self.campoDosAtaques.height + 25;
						end);
				


    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.campoDosAtaquesPart);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout13);
    obj.button1:setText("+");
    obj.button1:setAlign("left");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout13);
    obj.label32:setText("ATAQUES");
    obj.label32:setAlign("left");
    obj.label32:setWidth(225);
    obj.label32:setMargins({left=5});
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");

    obj.campoDosAtaques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosAtaques:setParent(obj.campoDosAtaquesPart);
    obj.campoDosAtaques:setName("campoDosAtaques");
    obj.campoDosAtaques:setField("campoDosAtaques");
    obj.campoDosAtaques:setTemplateForm("frmAtaque");
    obj.campoDosAtaques:setAlign("top");
    obj.campoDosAtaques:setLayout("vertical");
    obj.campoDosAtaques:setAutoHeight(true);
    obj.campoDosAtaques:setHitTest(false);
    obj.campoDosAtaques:setMinQt(1);

    obj.campoDosPoderesDeAtaquePart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosPoderesDeAtaquePart:setParent(obj.flowLayout9);
    obj.campoDosPoderesDeAtaquePart:setMinWidth(300);
    obj.campoDosPoderesDeAtaquePart:setMaxWidth(600);
    obj.campoDosPoderesDeAtaquePart:setHeight(25);
    obj.campoDosPoderesDeAtaquePart:setMinScaledWidth(280);
    obj.campoDosPoderesDeAtaquePart:setName("campoDosPoderesDeAtaquePart");
    obj.campoDosPoderesDeAtaquePart:setAdjustHeightToLine(false);
    obj.campoDosPoderesDeAtaquePart:setMargins({left=5});
    obj.campoDosPoderesDeAtaquePart:setVertAlign("leading");


					rawset(self.campoDosPoderesDeAtaquePart, "_recalcHeight", 					
						function ()
							self.campoDosPoderesDeAtaquePart.height = self.campoDosPoderesDeAtaque.height + 25;
						end);
				


    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.campoDosPoderesDeAtaquePart);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout14);
    obj.button2:setText("+");
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setName("button2");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout14);
    obj.label33:setText("PODERES DE COMBATE");
    obj.label33:setAlign("left");
    obj.label33:setWidth(225);
    obj.label33:setMargins({left=5});
    obj.label33:setName("label33");
    obj.label33:setFontColor("white");

    obj.campoDosPoderesDeAtaque = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosPoderesDeAtaque:setParent(obj.campoDosPoderesDeAtaquePart);
    obj.campoDosPoderesDeAtaque:setName("campoDosPoderesDeAtaque");
    obj.campoDosPoderesDeAtaque:setField("campoDosPoderesDeAtaque");
    obj.campoDosPoderesDeAtaque:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDosPoderesDeAtaque:setAlign("top");
    obj.campoDosPoderesDeAtaque:setLayout("vertical");
    obj.campoDosPoderesDeAtaque:setAutoHeight(true);
    obj.campoDosPoderesDeAtaque:setHitTest(false);
    obj.campoDosPoderesDeAtaque:setMinQt(1);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Proficiências");
    obj.tab3:setName("tab3");

    obj.frmDnDNext_proficiencias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDnDNext_proficiencias:setParent(obj.tab3);
    obj.frmDnDNext_proficiencias:setName("frmDnDNext_proficiencias");
    obj.frmDnDNext_proficiencias:setAlign("client");
    obj.frmDnDNext_proficiencias:setTheme("dark");
    obj.frmDnDNext_proficiencias:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmDnDNext_proficiencias);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox3);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#0000007F");
    obj.rectangle2:setName("rectangle2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle2);
    obj.button3:setText("+");
    obj.button3:setAlign("top");
    obj.button3:setHeight(50);
    obj.button3:setName("button3");

    obj.rclListaDasProficiencias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasProficiencias:setParent(obj.rectangle2);
    obj.rclListaDasProficiencias:setName("rclListaDasProficiencias");
    obj.rclListaDasProficiencias:setField("campoDasProficiencias");
    obj.rclListaDasProficiencias:setTemplateForm("frmDnDNext_proficiencias_proficiencia");
    obj.rclListaDasProficiencias:setAlign("client");
    obj.rclListaDasProficiencias:setLayout("verticalTiles");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle2);
    obj.dataLink7:setFields({'bonusProficiencia','atributos.modforca','atributos.moddestreza','atributos.modconstituicao','atributos.modinteligencia','atributos.modsabedoria','atributos.modcarisma'});
    obj.dataLink7:setName("dataLink7");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Habilidades");
    obj.tab4:setName("tab4");

    obj.frmHabilidades = GUI.fromHandle(_obj_newObject("form"));
    obj.frmHabilidades:setParent(obj.tab4);
    obj.frmHabilidades:setName("frmHabilidades");
    obj.frmHabilidades:setAlign("client");

    obj.popHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.frmHabilidades);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(300);
    obj.popHabilidade:setHeight(240);
    obj.popHabilidade:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHabilidade, "autoScopeNode",  "false");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.popHabilidade);
    obj.flowLayout10:setAlign("top");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxControlsPerLine(3);
    obj.flowLayout10:setMargins({bottom=4});
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setVertAlign("leading");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout10);
    obj.flowPart21:setMinWidth(90);
    obj.flowPart21:setMaxWidth(100);
    obj.flowPart21:setHeight(35);
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart21:setVertAlign("leading");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart21);
    obj.label34:setAlign("top");
    obj.label34:setFontSize(10);
    obj.label34:setText("Nível");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setWordWrap(true);
    obj.label34:setTextTrimming("none");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");
    obj.label34:setFontColor("#D0D0D0");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart21);
    obj.edit21:setAlign("client");
    obj.edit21:setField("nivelHabilidade");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(12);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("white");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout10);
    obj.flowPart22:setMinWidth(180);
    obj.flowPart22:setMaxWidth(200);
    obj.flowPart22:setHeight(35);
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart22:setVertAlign("leading");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart22);
    obj.label35:setAlign("top");
    obj.label35:setFontSize(10);
    obj.label35:setText("Obtido");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setWordWrap(true);
    obj.label35:setTextTrimming("none");
    obj.label35:setAutoSize(true);
    obj.label35:setName("label35");
    obj.label35:setFontColor("#D0D0D0");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart22);
    obj.edit22:setAlign("client");
    obj.edit22:setField("obtencaoHabilidade");
    obj.edit22:setFontSize(12);
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("white");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout10);
    obj.flowPart23:setMinWidth(90);
    obj.flowPart23:setMaxWidth(100);
    obj.flowPart23:setHeight(35);
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart23:setVertAlign("leading");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart23);
    obj.label36:setAlign("top");
    obj.label36:setFontSize(10);
    obj.label36:setText("Página");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWordWrap(true);
    obj.label36:setTextTrimming("none");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");
    obj.label36:setFontColor("#D0D0D0");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart23);
    obj.edit23:setAlign("client");
    obj.edit23:setField("paginaHabilidade");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(12);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("white");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout10);
    obj.flowPart24:setMinWidth(180);
    obj.flowPart24:setMaxWidth(200);
    obj.flowPart24:setHeight(35);
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart24:setVertAlign("leading");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart24);
    obj.label37:setAlign("top");
    obj.label37:setFontSize(10);
    obj.label37:setText("Livro");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setWordWrap(true);
    obj.label37:setTextTrimming("none");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");
    obj.label37:setFontColor("#D0D0D0");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart24);
    obj.edit24:setAlign("client");
    obj.edit24:setField("livroHabilidade");
    obj.edit24:setFontSize(12);
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("white");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout10);
    obj.dataLink8:setField("nivelHabilidade");
    obj.dataLink8:setName("dataLink8");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popHabilidade);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.BarPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.BarPopup:setParent(obj.frmHabilidades);
    obj.BarPopup:setName("BarPopup");
    obj.BarPopup:setWidth(140);
    obj.BarPopup:setHeight(66);
    obj.BarPopup:setBackOpacity(0);
    obj.BarPopup:setMargins({left=4, right=4, top=4, bottom=4});
    lfm_setPropAsString(obj.BarPopup, "autoScopeNode",  "false");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.BarPopup);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("white");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setName("rectangle3");

    obj.PopupBarColor = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.PopupBarColor:setParent(obj.rectangle3);
    obj.PopupBarColor:setAlign("client");
    obj.PopupBarColor:setName("PopupBarColor");
    obj.PopupBarColor:setColor("#808080");
    obj.PopupBarColor:setXradius(5);
    obj.PopupBarColor:setYradius(5);
    obj.PopupBarColor:setOpacity(0.9);

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.PopupBarColor);
    obj.label38:setFontColor("black");
    obj.label38:setMargins({left=6, top=2});
    obj.label38:setAlign("top");
    obj.label38:setText("Valor");
    obj.label38:setField("AtributoBarrinha");
    obj.label38:setFontSize(12);
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setTextTrimming("character");
    obj.label38:setName("label38");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.PopupBarColor);
    obj.layout15:setAlign("client");
    obj.layout15:setMargins({top=2, left=4});
    obj.layout15:setName("layout15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(18);
    obj.layout16:setName("layout16");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout16);
    obj.label39:setFontColor("black");
    obj.label39:setAlign("left");
    obj.label39:setText("Atual:  ");
    obj.label39:setHorzTextAlign("trailing");
    obj.label39:setWidth(34);
    obj.label39:setMargins({right=2});
    obj.label39:setFontSize(12);
    obj.label39:setName("label39");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout16);
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setMargins({left=2});
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setTransparent(false);
    obj.comboBox1:setWidth(40);
    obj.comboBox1:setField("ModificadorBarrinha");
    obj.comboBox1:setItems({'=', '+', '-'});
    obj.comboBox1:setValues({'igual', 'mais', 'menos'});
    obj.comboBox1:setValue("igual");
    obj.comboBox1:setName("comboBox1");

    obj.currentBarValue = GUI.fromHandle(_obj_newObject("edit"));
    obj.currentBarValue:setParent(obj.layout16);
    obj.currentBarValue:setFontColor("white");
    obj.currentBarValue:setMargins({left=2, right=4});
    obj.currentBarValue:setType("number");
    obj.currentBarValue:setAlign("client");
    obj.currentBarValue:setField("ValorMudadoAtualBarrinha");
    obj.currentBarValue:setName("currentBarValue");
    obj.currentBarValue:setFontSize(15);

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(18);
    obj.layout17:setName("layout17");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout17);
    obj.label40:setFontColor("black");
    obj.label40:setAlign("left");
    obj.label40:setText("Max:  ");
    obj.label40:setHorzTextAlign("trailing");
    obj.label40:setWidth(34);
    obj.label40:setMargins({right=2});
    obj.label40:setFontSize(12);
    obj.label40:setName("label40");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout17);
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setMargins({left=2});
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setTransparent(false);
    obj.comboBox2:setWidth(40);
    obj.comboBox2:setField("ModificadorBarrinhaMax");
    obj.comboBox2:setItems({'=', '+', '-'});
    obj.comboBox2:setValues({'igual', 'mais', 'menos'});
    obj.comboBox2:setValue("igual");
    obj.comboBox2:setName("comboBox2");

    obj.maxBarValue = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxBarValue:setParent(obj.layout17);
    obj.maxBarValue:setFontColor("white");
    obj.maxBarValue:setMargins({left=2, right=4});
    obj.maxBarValue:setType("number");
    obj.maxBarValue:setAlign("client");
    obj.maxBarValue:setField("ValorMudadoMaxBarrinha");
    obj.maxBarValue:setName("maxBarValue");
    obj.maxBarValue:setFontSize(15);

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmHabilidades);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.scrollBox4);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxColumns(3);
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setOrientation("vertical");
    obj.flowLayout11:setAvoidScale(true);
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout11:setVertAlign("leading");

    obj.campoDosTalentosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosTalentosPart:setParent(obj.flowLayout11);
    obj.campoDosTalentosPart:setMinWidth(300);
    obj.campoDosTalentosPart:setMaxWidth(600);
    obj.campoDosTalentosPart:setHeight(25);
    obj.campoDosTalentosPart:setMinScaledWidth(280);
    obj.campoDosTalentosPart:setName("campoDosTalentosPart");
    obj.campoDosTalentosPart:setAdjustHeightToLine(false);
    obj.campoDosTalentosPart:setMargins({left=5});
    obj.campoDosTalentosPart:setVertAlign("leading");


					rawset(self.campoDosTalentosPart, "_recalcHeight", 					
						function ()
							self.campoDosTalentosPart.height = self.campoDosTalentos.height + 25;
						end);
				


    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.campoDosTalentosPart);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout18);
    obj.button4:setText("+");
    obj.button4:setAlign("left");
    obj.button4:setWidth(30);
    obj.button4:setName("button4");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout18);
    obj.label41:setText("TALENTOS");
    obj.label41:setAlign("left");
    obj.label41:setWidth(225);
    obj.label41:setMargins({left=5});
    obj.label41:setName("label41");
    obj.label41:setFontColor("white");

    obj.campoDosTalentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosTalentos:setParent(obj.campoDosTalentosPart);
    obj.campoDosTalentos:setName("campoDosTalentos");
    obj.campoDosTalentos:setField("campoDosTalentos");
    obj.campoDosTalentos:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDosTalentos:setAlign("top");
    obj.campoDosTalentos:setLayout("vertical");
    obj.campoDosTalentos:setAutoHeight(true);
    obj.campoDosTalentos:setHitTest(false);
    obj.campoDosTalentos:setMinQt(1);

    obj.campoDosOutrosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosOutrosPart:setParent(obj.flowLayout11);
    obj.campoDosOutrosPart:setMinWidth(300);
    obj.campoDosOutrosPart:setMaxWidth(600);
    obj.campoDosOutrosPart:setHeight(25);
    obj.campoDosOutrosPart:setMinScaledWidth(280);
    obj.campoDosOutrosPart:setName("campoDosOutrosPart");
    obj.campoDosOutrosPart:setAdjustHeightToLine(false);
    obj.campoDosOutrosPart:setMargins({left=5});
    obj.campoDosOutrosPart:setVertAlign("leading");


					rawset(self.campoDosOutrosPart, "_recalcHeight", 					
						function ()
							self.campoDosOutrosPart.height = self.campoDosOutros.height + 25;
						end);
				


    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.campoDosOutrosPart);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout19);
    obj.button5:setText("+");
    obj.button5:setAlign("left");
    obj.button5:setWidth(30);
    obj.button5:setName("button5");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout19);
    obj.label42:setText("OUTROS");
    obj.label42:setAlign("left");
    obj.label42:setWidth(225);
    obj.label42:setMargins({left=5});
    obj.label42:setName("label42");
    obj.label42:setFontColor("white");

    obj.campoDosOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosOutros:setParent(obj.campoDosOutrosPart);
    obj.campoDosOutros:setName("campoDosOutros");
    obj.campoDosOutros:setField("campoDosOutros");
    obj.campoDosOutros:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDosOutros:setAlign("top");
    obj.campoDosOutros:setLayout("vertical");
    obj.campoDosOutros:setAutoHeight(true);
    obj.campoDosOutros:setHitTest(false);
    obj.campoDosOutros:setMinQt(1);

    obj.campoDasRacasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasRacasPart:setParent(obj.flowLayout11);
    obj.campoDasRacasPart:setMinWidth(300);
    obj.campoDasRacasPart:setMaxWidth(600);
    obj.campoDasRacasPart:setHeight(25);
    obj.campoDasRacasPart:setMinScaledWidth(280);
    obj.campoDasRacasPart:setName("campoDasRacasPart");
    obj.campoDasRacasPart:setAdjustHeightToLine(false);
    obj.campoDasRacasPart:setMargins({left=5});
    obj.campoDasRacasPart:setVertAlign("leading");


					rawset(self.campoDasRacasPart, "_recalcHeight", 					
						function ()
							self.campoDasRacasPart.height = self.campoDasRacas.height + 25;
						end);
				


    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.campoDasRacasPart);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout20);
    obj.button6:setText("+");
    obj.button6:setAlign("left");
    obj.button6:setWidth(30);
    obj.button6:setName("button6");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout20);
    obj.label43:setText("CARACTERISTICAS RACIAIS");
    obj.label43:setAlign("left");
    obj.label43:setWidth(225);
    obj.label43:setMargins({left=5});
    obj.label43:setName("label43");
    obj.label43:setFontColor("white");

    obj.campoDasRacas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasRacas:setParent(obj.campoDasRacasPart);
    obj.campoDasRacas:setName("campoDasRacas");
    obj.campoDasRacas:setField("campoDasRacas");
    obj.campoDasRacas:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDasRacas:setAlign("top");
    obj.campoDasRacas:setLayout("vertical");
    obj.campoDasRacas:setAutoHeight(true);
    obj.campoDasRacas:setHitTest(false);
    obj.campoDasRacas:setMinQt(1);

    obj.campoDasCaracteristicasClassePart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasCaracteristicasClassePart:setParent(obj.flowLayout11);
    obj.campoDasCaracteristicasClassePart:setMinWidth(300);
    obj.campoDasCaracteristicasClassePart:setMaxWidth(600);
    obj.campoDasCaracteristicasClassePart:setHeight(25);
    obj.campoDasCaracteristicasClassePart:setMinScaledWidth(280);
    obj.campoDasCaracteristicasClassePart:setName("campoDasCaracteristicasClassePart");
    obj.campoDasCaracteristicasClassePart:setAdjustHeightToLine(false);
    obj.campoDasCaracteristicasClassePart:setMargins({left=5});
    obj.campoDasCaracteristicasClassePart:setVertAlign("leading");


					rawset(self.campoDasCaracteristicasClassePart, "_recalcHeight", 					
						function ()
							self.campoDasCaracteristicasClassePart.height = self.campoDasCaracteristicasClasse.height + 25;
						end);
				


    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.campoDasCaracteristicasClassePart);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout21);
    obj.button7:setText("+");
    obj.button7:setAlign("left");
    obj.button7:setWidth(30);
    obj.button7:setName("button7");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout21);
    obj.label44:setText("CARACTERISTICAS DE CLASSE");
    obj.label44:setAlign("left");
    obj.label44:setWidth(225);
    obj.label44:setMargins({left=5});
    obj.label44:setName("label44");
    obj.label44:setFontColor("white");

    obj.campoDasCaracteristicasClasse = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasCaracteristicasClasse:setParent(obj.campoDasCaracteristicasClassePart);
    obj.campoDasCaracteristicasClasse:setName("campoDasCaracteristicasClasse");
    obj.campoDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.campoDasCaracteristicasClasse:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDasCaracteristicasClasse:setAlign("top");
    obj.campoDasCaracteristicasClasse:setLayout("vertical");
    obj.campoDasCaracteristicasClasse:setAutoHeight(true);
    obj.campoDasCaracteristicasClasse:setHitTest(false);
    obj.campoDasCaracteristicasClasse:setMinQt(1);

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Força");
    obj.tab5:setName("tab5");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.tab5);
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#40000000");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);

    obj.popMagia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj.rectangle4);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setWidth(250);
    obj.popMagia:setHeight(250);
    obj.popMagia:setBackOpacity(0.4);

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.popMagia);
    obj.edit25:setAlign("top");
    obj.edit25:setField("nome");
    obj.edit25:setTextPrompt("NOME DA MAGIA");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");
    obj.edit25:setFontSize(15);
    obj.edit25:setFontColor("white");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.popMagia);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMaxControlsPerLine(2);
    obj.flowLayout12:setMargins({bottom=4});
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setVertAlign("leading");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout12);
    obj.flowPart25:setMinWidth(30);
    obj.flowPart25:setMaxWidth(400);
    obj.flowPart25:setHeight(35);
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart25:setVertAlign("leading");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart25);
    obj.label45:setAlign("top");
    obj.label45:setFontSize(10);
    obj.label45:setText("TEMPO FORMULAÇÃO");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWordWrap(true);
    obj.label45:setTextTrimming("none");
    obj.label45:setAutoSize(true);
    obj.label45:setName("label45");
    obj.label45:setFontColor("#D0D0D0");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart25);
    obj.edit26:setAlign("client");
    obj.edit26:setField("tempoDeFormulacao");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setFontSize(12);
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("white");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout12);
    obj.flowPart26:setMinWidth(30);
    obj.flowPart26:setMaxWidth(400);
    obj.flowPart26:setHeight(35);
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart26:setVertAlign("leading");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart26);
    obj.label46:setAlign("top");
    obj.label46:setFontSize(10);
    obj.label46:setText("ALCANCE");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setWordWrap(true);
    obj.label46:setTextTrimming("none");
    obj.label46:setAutoSize(true);
    obj.label46:setName("label46");
    obj.label46:setFontColor("#D0D0D0");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart26);
    obj.edit27:setAlign("client");
    obj.edit27:setField("alcance");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(12);
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("white");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout12);
    obj.flowPart27:setMinWidth(30);
    obj.flowPart27:setMaxWidth(400);
    obj.flowPart27:setHeight(35);
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart27:setVertAlign("leading");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart27);
    obj.label47:setAlign("top");
    obj.label47:setFontSize(10);
    obj.label47:setText("COMPONENTES");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setWordWrap(true);
    obj.label47:setTextTrimming("none");
    obj.label47:setAutoSize(true);
    obj.label47:setName("label47");
    obj.label47:setFontColor("#D0D0D0");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart27);
    obj.edit28:setAlign("client");
    obj.edit28:setField("componentes");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(12);
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("white");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout12);
    obj.flowPart28:setMinWidth(30);
    obj.flowPart28:setMaxWidth(400);
    obj.flowPart28:setHeight(35);
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart28:setVertAlign("leading");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart28);
    obj.label48:setAlign("top");
    obj.label48:setFontSize(10);
    obj.label48:setText("DURAÇÃO");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setWordWrap(true);
    obj.label48:setTextTrimming("none");
    obj.label48:setAutoSize(true);
    obj.label48:setName("label48");
    obj.label48:setFontColor("#D0D0D0");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart28);
    obj.edit29:setAlign("client");
    obj.edit29:setField("duracao");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setFontSize(12);
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("white");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popMagia);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("descricao");
    obj.textEditor3:setName("textEditor3");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle4);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.fraMagiasLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraMagiasLayout:setParent(obj.scrollBox5);
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

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.fraMagiasLayout);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMinScaledWidth(290);
    obj.flowLayout13:setHorzAlign("center");
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout13:setVertAlign("leading");

    obj.fraUpperGridMagias = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridMagias:setParent(obj.flowLayout13);
    obj.fraUpperGridMagias:setMinWidth(320);
    obj.fraUpperGridMagias:setMaxWidth(1600);
    obj.fraUpperGridMagias:setName("fraUpperGridMagias");
    obj.fraUpperGridMagias:setAvoidScale(true);
    obj.fraUpperGridMagias:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridMagias:setAutoHeight(true);
    obj.fraUpperGridMagias:setVertAlign("trailing");
    obj.fraUpperGridMagias:setMaxControlsPerLine(3);
    obj.fraUpperGridMagias:setHorzAlign("center");
    obj.fraUpperGridMagias:setLineSpacing(8);
    obj.fraUpperGridMagias:setStepSizes({310, 360, 420});
    obj.fraUpperGridMagias:setMinScaledWidth(300);
    obj.fraUpperGridMagias:setMaxScaledWidth(340);
    obj.fraUpperGridMagias:setMargins({left=1, right=1, top=2, bottom=2});

    obj.upperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("flowPart"));
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
    obj.edtupperGridMagicEditBox1:setField("forca.cdDaMagia");
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
    obj.labupperGridMagicEditBox1:setText("CD");
    obj.labupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox1:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox1:setWordWrap(true);
    obj.labupperGridMagicEditBox1:setTextTrimming("none");
    obj.labupperGridMagicEditBox1:setFontSize(12);
    obj.labupperGridMagicEditBox1:setFontColor("#D0D0D0");

self.upperGridMagicEditBox1._RecalcSize();	


    obj.upperGridMagicEditBox2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox2:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicEditBox2:setHeight(50);
    obj.upperGridMagicEditBox2:setMinScaledWidth(100);
    obj.upperGridMagicEditBox2:setMinWidth(100);
    obj.upperGridMagicEditBox2:setMaxWidth(160);
    obj.upperGridMagicEditBox2:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox2:setAvoidScale(true);
    obj.upperGridMagicEditBox2:setName("upperGridMagicEditBox2");
    obj.upperGridMagicEditBox2:setVertAlign("leading");
    obj.upperGridMagicEditBox2:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox2, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox2:setHeight(self.panupperGridMagicEditBox2:getHeight() + self.labupperGridMagicEditBox2:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox2 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox2:setParent(obj.upperGridMagicEditBox2);
    obj.panupperGridMagicEditBox2:setName("panupperGridMagicEditBox2");
    obj.panupperGridMagicEditBox2:setAlign("top");
    obj.panupperGridMagicEditBox2:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox2:setHeight(60);

    obj.edtupperGridMagicEditBox2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox2:setParent(obj.panupperGridMagicEditBox2);
    obj.edtupperGridMagicEditBox2:setName("edtupperGridMagicEditBox2");
    obj.edtupperGridMagicEditBox2:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox2:setField("forca.bonusAtaqueSTR");
    obj.edtupperGridMagicEditBox2:setFontSize(22);
    obj.edtupperGridMagicEditBox2:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox2:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox2:setFontColor("white");
    obj.edtupperGridMagicEditBox2:setTransparent(true);

    obj.labupperGridMagicEditBox2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox2:setParent(obj.upperGridMagicEditBox2);
    obj.labupperGridMagicEditBox2:setName("labupperGridMagicEditBox2");
    obj.labupperGridMagicEditBox2:setAlign("top");
    obj.labupperGridMagicEditBox2:setAutoSize(true);
    obj.labupperGridMagicEditBox2:setText("BÔNUS DE ATAQUE");
    obj.labupperGridMagicEditBox2:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox2:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox2:setWordWrap(true);
    obj.labupperGridMagicEditBox2:setTextTrimming("none");
    obj.labupperGridMagicEditBox2:setFontSize(12);
    obj.labupperGridMagicEditBox2:setFontColor("#D0D0D0");

self.upperGridMagicEditBox2._RecalcSize();	


    obj.upperGridMagicEditBox3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox3:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicEditBox3:setHeight(50);
    obj.upperGridMagicEditBox3:setMinScaledWidth(100);
    obj.upperGridMagicEditBox3:setMinWidth(100);
    obj.upperGridMagicEditBox3:setMaxWidth(160);
    obj.upperGridMagicEditBox3:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox3:setAvoidScale(true);
    obj.upperGridMagicEditBox3:setName("upperGridMagicEditBox3");
    obj.upperGridMagicEditBox3:setVertAlign("leading");
    obj.upperGridMagicEditBox3:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox3, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox3:setHeight(self.panupperGridMagicEditBox3:getHeight() + self.labupperGridMagicEditBox3:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox3 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox3:setParent(obj.upperGridMagicEditBox3);
    obj.panupperGridMagicEditBox3:setName("panupperGridMagicEditBox3");
    obj.panupperGridMagicEditBox3:setAlign("top");
    obj.panupperGridMagicEditBox3:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox3:setHeight(60);

    obj.edtupperGridMagicEditBox3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox3:setParent(obj.panupperGridMagicEditBox3);
    obj.edtupperGridMagicEditBox3:setName("edtupperGridMagicEditBox3");
    obj.edtupperGridMagicEditBox3:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox3:setField("forca.points");
    obj.edtupperGridMagicEditBox3:setFontSize(22);
    obj.edtupperGridMagicEditBox3:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox3:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox3:setFontColor("white");
    obj.edtupperGridMagicEditBox3:setTransparent(true);

    obj.labupperGridMagicEditBox3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox3:setParent(obj.upperGridMagicEditBox3);
    obj.labupperGridMagicEditBox3:setName("labupperGridMagicEditBox3");
    obj.labupperGridMagicEditBox3:setAlign("top");
    obj.labupperGridMagicEditBox3:setAutoSize(true);
    obj.labupperGridMagicEditBox3:setText("PONTOS DE FORÇA");
    obj.labupperGridMagicEditBox3:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox3:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox3:setWordWrap(true);
    obj.labupperGridMagicEditBox3:setTextTrimming("none");
    obj.labupperGridMagicEditBox3:setFontSize(12);
    obj.labupperGridMagicEditBox3:setFontColor("#D0D0D0");

self.upperGridMagicEditBox3._RecalcSize();	


    obj.upperGridMagicEditBox4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox4:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicEditBox4:setHeight(50);
    obj.upperGridMagicEditBox4:setMinScaledWidth(100);
    obj.upperGridMagicEditBox4:setMinWidth(100);
    obj.upperGridMagicEditBox4:setMaxWidth(160);
    obj.upperGridMagicEditBox4:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox4:setAvoidScale(true);
    obj.upperGridMagicEditBox4:setName("upperGridMagicEditBox4");
    obj.upperGridMagicEditBox4:setVertAlign("leading");
    obj.upperGridMagicEditBox4:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox4, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox4:setHeight(self.panupperGridMagicEditBox4:getHeight() + self.labupperGridMagicEditBox4:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox4 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox4:setParent(obj.upperGridMagicEditBox4);
    obj.panupperGridMagicEditBox4:setName("panupperGridMagicEditBox4");
    obj.panupperGridMagicEditBox4:setAlign("top");
    obj.panupperGridMagicEditBox4:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox4:setHeight(60);

    obj.edtupperGridMagicEditBox4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox4:setParent(obj.panupperGridMagicEditBox4);
    obj.edtupperGridMagicEditBox4:setName("edtupperGridMagicEditBox4");
    obj.edtupperGridMagicEditBox4:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox4:setField("forca.light");
    obj.edtupperGridMagicEditBox4:setFontSize(22);
    obj.edtupperGridMagicEditBox4:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox4:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox4:setFontColor("white");
    obj.edtupperGridMagicEditBox4:setTransparent(true);

    obj.labupperGridMagicEditBox4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox4:setParent(obj.upperGridMagicEditBox4);
    obj.labupperGridMagicEditBox4:setName("labupperGridMagicEditBox4");
    obj.labupperGridMagicEditBox4:setAlign("top");
    obj.labupperGridMagicEditBox4:setAutoSize(true);
    obj.labupperGridMagicEditBox4:setText("LADO LUMINOSO");
    obj.labupperGridMagicEditBox4:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox4:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox4:setWordWrap(true);
    obj.labupperGridMagicEditBox4:setTextTrimming("none");
    obj.labupperGridMagicEditBox4:setFontSize(12);
    obj.labupperGridMagicEditBox4:setFontColor("#D0D0D0");

self.upperGridMagicEditBox4._RecalcSize();	


    obj.upperGridMagicEditBox5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox5:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicEditBox5:setHeight(50);
    obj.upperGridMagicEditBox5:setMinScaledWidth(100);
    obj.upperGridMagicEditBox5:setMinWidth(100);
    obj.upperGridMagicEditBox5:setMaxWidth(160);
    obj.upperGridMagicEditBox5:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox5:setAvoidScale(true);
    obj.upperGridMagicEditBox5:setName("upperGridMagicEditBox5");
    obj.upperGridMagicEditBox5:setVertAlign("leading");
    obj.upperGridMagicEditBox5:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox5, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox5:setHeight(self.panupperGridMagicEditBox5:getHeight() + self.labupperGridMagicEditBox5:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox5 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox5:setParent(obj.upperGridMagicEditBox5);
    obj.panupperGridMagicEditBox5:setName("panupperGridMagicEditBox5");
    obj.panupperGridMagicEditBox5:setAlign("top");
    obj.panupperGridMagicEditBox5:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox5:setHeight(60);

    obj.edtupperGridMagicEditBox5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox5:setParent(obj.panupperGridMagicEditBox5);
    obj.edtupperGridMagicEditBox5:setName("edtupperGridMagicEditBox5");
    obj.edtupperGridMagicEditBox5:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox5:setField("forca.dark");
    obj.edtupperGridMagicEditBox5:setFontSize(22);
    obj.edtupperGridMagicEditBox5:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox5:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox5:setFontColor("white");
    obj.edtupperGridMagicEditBox5:setTransparent(true);

    obj.labupperGridMagicEditBox5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox5:setParent(obj.upperGridMagicEditBox5);
    obj.labupperGridMagicEditBox5:setName("labupperGridMagicEditBox5");
    obj.labupperGridMagicEditBox5:setAlign("top");
    obj.labupperGridMagicEditBox5:setAutoSize(true);
    obj.labupperGridMagicEditBox5:setText("LADO SOMBRIO");
    obj.labupperGridMagicEditBox5:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox5:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox5:setWordWrap(true);
    obj.labupperGridMagicEditBox5:setTextTrimming("none");
    obj.labupperGridMagicEditBox5:setFontSize(12);
    obj.labupperGridMagicEditBox5:setFontColor("#D0D0D0");

self.upperGridMagicEditBox5._RecalcSize();	


    obj.upperGridMagicEditBox6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox6:setParent(obj.fraUpperGridMagias);
    obj.upperGridMagicEditBox6:setHeight(50);
    obj.upperGridMagicEditBox6:setMinScaledWidth(100);
    obj.upperGridMagicEditBox6:setMinWidth(100);
    obj.upperGridMagicEditBox6:setMaxWidth(160);
    obj.upperGridMagicEditBox6:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox6:setAvoidScale(true);
    obj.upperGridMagicEditBox6:setName("upperGridMagicEditBox6");
    obj.upperGridMagicEditBox6:setVertAlign("leading");
    obj.upperGridMagicEditBox6:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox6, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox6:setHeight(self.panupperGridMagicEditBox6:getHeight() + self.labupperGridMagicEditBox6:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox6 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox6:setParent(obj.upperGridMagicEditBox6);
    obj.panupperGridMagicEditBox6:setName("panupperGridMagicEditBox6");
    obj.panupperGridMagicEditBox6:setAlign("top");
    obj.panupperGridMagicEditBox6:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox6:setHeight(60);

    obj.edtupperGridMagicEditBox6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox6:setParent(obj.panupperGridMagicEditBox6);
    obj.edtupperGridMagicEditBox6:setName("edtupperGridMagicEditBox6");
    obj.edtupperGridMagicEditBox6:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox6:setField("forca.universal");
    obj.edtupperGridMagicEditBox6:setFontSize(22);
    obj.edtupperGridMagicEditBox6:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox6:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox6:setFontColor("white");
    obj.edtupperGridMagicEditBox6:setTransparent(true);

    obj.labupperGridMagicEditBox6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox6:setParent(obj.upperGridMagicEditBox6);
    obj.labupperGridMagicEditBox6:setName("labupperGridMagicEditBox6");
    obj.labupperGridMagicEditBox6:setAlign("top");
    obj.labupperGridMagicEditBox6:setAutoSize(true);
    obj.labupperGridMagicEditBox6:setText("UNIVERSAL");
    obj.labupperGridMagicEditBox6:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox6:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox6:setWordWrap(true);
    obj.labupperGridMagicEditBox6:setTextTrimming("none");
    obj.labupperGridMagicEditBox6:setFontSize(12);
    obj.labupperGridMagicEditBox6:setFontColor("#D0D0D0");

self.upperGridMagicEditBox6._RecalcSize();	


    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.fraMagiasLayout);
    obj.dataLink9:setFields({'magias.habilidadeDeConjuracao', 'atributos.modInteligencia', 'atributos.modSabedoria', 'atributos.modCarisma', 'bonusProficiencia'});
    obj.dataLink9:setName("dataLink9");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.fraMagiasLayout);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.fraMagiasLayout);
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxColumns(3);
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setOrientation("vertical");
    obj.flowLayout14:setName("flowLayout14");
    obj.flowLayout14:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout14:setMinScaledWidth(300);
    obj.flowLayout14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout14:setVertAlign("leading");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.flowLayout14);
    obj.flowLayout15:setHeight(100);
    obj.flowLayout15:setAvoidScale(true);
    obj.flowLayout15:setMaxControlsPerLine(1);
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setName("flowLayout15");
    obj.flowLayout15:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout15:setStepSizes({310, 360, 420, 600});
    obj.flowLayout15:setMinScaledWidth(300);
    obj.flowLayout15:setMaxScaledWidth(600);
    obj.flowLayout15:setVertAlign("leading");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout15);
    obj.flowPart29:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setAvoidScale(true);
    obj.flowPart29:setMinScaledWidth(280);
    obj.flowPart29:setMinWidth(300);
    obj.flowPart29:setMaxWidth(600);
    obj.flowPart29:setHeight(80);
    obj.flowPart29:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart29:setVertAlign("leading");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart29);
    obj.label49:setFrameRegion("RegiaoSmallTitulo");
    obj.label49:setText("0");
    obj.label49:setName("label49");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setVertTextAlign("center");
    obj.label49:setFontSize(18);
    obj.label49:setFontColor("white");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart29);
    obj.label50:setFrameRegion("RegiaoConteudo");
    obj.label50:setText("LIVRES");
    obj.label50:setFontSize(15);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");
    obj.label50:setName("label50");
    obj.label50:setFontColor("white");

    obj.flwMagicRecordList1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList1:setParent(obj.flowLayout15);
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
    obj.rclflwMagicRecordList1:setField("magias.magias.nivel0");
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
    obj.btnNovoflwMagicRecordList1:setText("Novo");
    obj.btnNovoflwMagicRecordList1:setWidth(160);
    obj.btnNovoflwMagicRecordList1:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList1._recalcHeight();


    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.flowLayout14);
    obj.flowLayout16:setHeight(100);
    obj.flowLayout16:setAvoidScale(true);
    obj.flowLayout16:setMaxControlsPerLine(1);
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setName("flowLayout16");
    obj.flowLayout16:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout16:setStepSizes({310, 360, 420, 600});
    obj.flowLayout16:setMinScaledWidth(300);
    obj.flowLayout16:setMaxScaledWidth(600);
    obj.flowLayout16:setVertAlign("leading");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout16);
    obj.flowPart30:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setAvoidScale(true);
    obj.flowPart30:setMinScaledWidth(280);
    obj.flowPart30:setMinWidth(300);
    obj.flowPart30:setMaxWidth(600);
    obj.flowPart30:setHeight(80);
    obj.flowPart30:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart30:setVertAlign("leading");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart30);
    obj.label51:setFrameRegion("RegiaoSmallTitulo");
    obj.label51:setText("1");
    obj.label51:setName("label51");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setVertTextAlign("center");
    obj.label51:setFontSize(18);
    obj.label51:setFontColor("white");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart30);
    obj.edit30:setFrameRegion("RegiaoConteudo1");
    obj.edit30:setField("magias.espacosTotais1");
    obj.edit30:setName("edit30");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setFontSize(18);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontColor("white");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart30);
    obj.edit31:setFrameRegion("RegiaoConteudo2");
    obj.edit31:setField("magias.espacosGastos1");
    obj.edit31:setName("edit31");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setFontSize(18);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontColor("white");

    obj.flwMagicRecordList2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList2:setParent(obj.flowLayout16);
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
    obj.rclflwMagicRecordList2:setField("magias.magias.nivel1");
    obj.rclflwMagicRecordList2:setTemplateForm("frmMagiaItemComCheckbox");
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
    obj.btnNovoflwMagicRecordList2:setText("Novo");
    obj.btnNovoflwMagicRecordList2:setWidth(160);
    obj.btnNovoflwMagicRecordList2:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList2._recalcHeight();


    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowLayout14);
    obj.flowLayout17:setHeight(100);
    obj.flowLayout17:setAvoidScale(true);
    obj.flowLayout17:setMaxControlsPerLine(1);
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setName("flowLayout17");
    obj.flowLayout17:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout17:setStepSizes({310, 360, 420, 600});
    obj.flowLayout17:setMinScaledWidth(300);
    obj.flowLayout17:setMaxScaledWidth(600);
    obj.flowLayout17:setVertAlign("leading");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout17);
    obj.flowPart31:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setAvoidScale(true);
    obj.flowPart31:setMinScaledWidth(280);
    obj.flowPart31:setMinWidth(300);
    obj.flowPart31:setMaxWidth(600);
    obj.flowPart31:setHeight(80);
    obj.flowPart31:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart31:setVertAlign("leading");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart31);
    obj.label52:setFrameRegion("RegiaoSmallTitulo");
    obj.label52:setText("2");
    obj.label52:setName("label52");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setVertTextAlign("center");
    obj.label52:setFontSize(18);
    obj.label52:setFontColor("white");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart31);
    obj.edit32:setFrameRegion("RegiaoConteudo1");
    obj.edit32:setField("magias.espacosTotais2");
    obj.edit32:setName("edit32");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setFontSize(18);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontColor("white");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart31);
    obj.edit33:setFrameRegion("RegiaoConteudo2");
    obj.edit33:setField("magias.espacosGastos2");
    obj.edit33:setName("edit33");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setFontSize(18);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontColor("white");

    obj.flwMagicRecordList3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList3:setParent(obj.flowLayout17);
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
				


    obj.rclflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList3:setParent(obj.flwMagicRecordList3);
    obj.rclflwMagicRecordList3:setName("rclflwMagicRecordList3");
    obj.rclflwMagicRecordList3:setAlign("top");
    obj.rclflwMagicRecordList3:setField("magias.magias.nivel2");
    obj.rclflwMagicRecordList3:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList3:setAutoHeight(true);
    obj.rclflwMagicRecordList3:setMinHeight(5);
    obj.rclflwMagicRecordList3:setHitTest(false);
    obj.rclflwMagicRecordList3:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList3:setParent(obj.flwMagicRecordList3);
    obj.layBottomflwMagicRecordList3:setName("layBottomflwMagicRecordList3");
    obj.layBottomflwMagicRecordList3:setAlign("top");
    obj.layBottomflwMagicRecordList3:setHeight(36);

    obj.btnNovoflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList3:setParent(obj.layBottomflwMagicRecordList3);
    obj.btnNovoflwMagicRecordList3:setName("btnNovoflwMagicRecordList3");
    obj.btnNovoflwMagicRecordList3:setAlign("left");
    obj.btnNovoflwMagicRecordList3:setText("Novo");
    obj.btnNovoflwMagicRecordList3:setWidth(160);
    obj.btnNovoflwMagicRecordList3:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList3._recalcHeight();


    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowLayout14);
    obj.flowLayout18:setHeight(100);
    obj.flowLayout18:setAvoidScale(true);
    obj.flowLayout18:setMaxControlsPerLine(1);
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setName("flowLayout18");
    obj.flowLayout18:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout18:setStepSizes({310, 360, 420, 600});
    obj.flowLayout18:setMinScaledWidth(300);
    obj.flowLayout18:setMaxScaledWidth(600);
    obj.flowLayout18:setVertAlign("leading");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout18);
    obj.flowPart32:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setAvoidScale(true);
    obj.flowPart32:setMinScaledWidth(280);
    obj.flowPart32:setMinWidth(300);
    obj.flowPart32:setMaxWidth(600);
    obj.flowPart32:setHeight(80);
    obj.flowPart32:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart32:setVertAlign("leading");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart32);
    obj.label53:setFrameRegion("RegiaoSmallTitulo");
    obj.label53:setText("3");
    obj.label53:setName("label53");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");
    obj.label53:setFontSize(18);
    obj.label53:setFontColor("white");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart32);
    obj.edit34:setFrameRegion("RegiaoConteudo1");
    obj.edit34:setField("magias.espacosTotais3");
    obj.edit34:setName("edit34");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setFontSize(18);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontColor("white");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart32);
    obj.edit35:setFrameRegion("RegiaoConteudo2");
    obj.edit35:setField("magias.espacosGastos3");
    obj.edit35:setName("edit35");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setFontSize(18);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontColor("white");

    obj.flwMagicRecordList4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList4:setParent(obj.flowLayout18);
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
				


    obj.rclflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList4:setParent(obj.flwMagicRecordList4);
    obj.rclflwMagicRecordList4:setName("rclflwMagicRecordList4");
    obj.rclflwMagicRecordList4:setAlign("top");
    obj.rclflwMagicRecordList4:setField("magias.magias.nivel3");
    obj.rclflwMagicRecordList4:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList4:setAutoHeight(true);
    obj.rclflwMagicRecordList4:setMinHeight(5);
    obj.rclflwMagicRecordList4:setHitTest(false);
    obj.rclflwMagicRecordList4:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList4:setParent(obj.flwMagicRecordList4);
    obj.layBottomflwMagicRecordList4:setName("layBottomflwMagicRecordList4");
    obj.layBottomflwMagicRecordList4:setAlign("top");
    obj.layBottomflwMagicRecordList4:setHeight(36);

    obj.btnNovoflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList4:setParent(obj.layBottomflwMagicRecordList4);
    obj.btnNovoflwMagicRecordList4:setName("btnNovoflwMagicRecordList4");
    obj.btnNovoflwMagicRecordList4:setAlign("left");
    obj.btnNovoflwMagicRecordList4:setText("Novo");
    obj.btnNovoflwMagicRecordList4:setWidth(160);
    obj.btnNovoflwMagicRecordList4:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList4._recalcHeight();


    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.flowLayout14);
    obj.flowLayout19:setHeight(100);
    obj.flowLayout19:setAvoidScale(true);
    obj.flowLayout19:setMaxControlsPerLine(1);
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setName("flowLayout19");
    obj.flowLayout19:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout19:setStepSizes({310, 360, 420, 600});
    obj.flowLayout19:setMinScaledWidth(300);
    obj.flowLayout19:setMaxScaledWidth(600);
    obj.flowLayout19:setVertAlign("leading");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout19);
    obj.flowPart33:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setAvoidScale(true);
    obj.flowPart33:setMinScaledWidth(280);
    obj.flowPart33:setMinWidth(300);
    obj.flowPart33:setMaxWidth(600);
    obj.flowPart33:setHeight(80);
    obj.flowPart33:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart33:setVertAlign("leading");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart33);
    obj.label54:setFrameRegion("RegiaoSmallTitulo");
    obj.label54:setText("4");
    obj.label54:setName("label54");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setVertTextAlign("center");
    obj.label54:setFontSize(18);
    obj.label54:setFontColor("white");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart33);
    obj.edit36:setFrameRegion("RegiaoConteudo1");
    obj.edit36:setField("magias.espacosTotais4");
    obj.edit36:setName("edit36");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setFontSize(18);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontColor("white");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart33);
    obj.edit37:setFrameRegion("RegiaoConteudo2");
    obj.edit37:setField("magias.espacosGastos4");
    obj.edit37:setName("edit37");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setFontSize(18);
    obj.edit37:setTransparent(true);
    obj.edit37:setFontColor("white");

    obj.flwMagicRecordList5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList5:setParent(obj.flowLayout19);
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
				


    obj.rclflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList5:setParent(obj.flwMagicRecordList5);
    obj.rclflwMagicRecordList5:setName("rclflwMagicRecordList5");
    obj.rclflwMagicRecordList5:setAlign("top");
    obj.rclflwMagicRecordList5:setField("magias.magias.nivel4");
    obj.rclflwMagicRecordList5:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList5:setAutoHeight(true);
    obj.rclflwMagicRecordList5:setMinHeight(5);
    obj.rclflwMagicRecordList5:setHitTest(false);
    obj.rclflwMagicRecordList5:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList5:setParent(obj.flwMagicRecordList5);
    obj.layBottomflwMagicRecordList5:setName("layBottomflwMagicRecordList5");
    obj.layBottomflwMagicRecordList5:setAlign("top");
    obj.layBottomflwMagicRecordList5:setHeight(36);

    obj.btnNovoflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList5:setParent(obj.layBottomflwMagicRecordList5);
    obj.btnNovoflwMagicRecordList5:setName("btnNovoflwMagicRecordList5");
    obj.btnNovoflwMagicRecordList5:setAlign("left");
    obj.btnNovoflwMagicRecordList5:setText("Novo");
    obj.btnNovoflwMagicRecordList5:setWidth(160);
    obj.btnNovoflwMagicRecordList5:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList5._recalcHeight();


    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowLayout14);
    obj.flowLayout20:setHeight(100);
    obj.flowLayout20:setAvoidScale(true);
    obj.flowLayout20:setMaxControlsPerLine(1);
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setName("flowLayout20");
    obj.flowLayout20:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout20:setStepSizes({310, 360, 420, 600});
    obj.flowLayout20:setMinScaledWidth(300);
    obj.flowLayout20:setMaxScaledWidth(600);
    obj.flowLayout20:setVertAlign("leading");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout20);
    obj.flowPart34:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setAvoidScale(true);
    obj.flowPart34:setMinScaledWidth(280);
    obj.flowPart34:setMinWidth(300);
    obj.flowPart34:setMaxWidth(600);
    obj.flowPart34:setHeight(80);
    obj.flowPart34:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart34:setVertAlign("leading");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart34);
    obj.label55:setFrameRegion("RegiaoSmallTitulo");
    obj.label55:setText("5");
    obj.label55:setName("label55");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setVertTextAlign("center");
    obj.label55:setFontSize(18);
    obj.label55:setFontColor("white");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart34);
    obj.edit38:setFrameRegion("RegiaoConteudo1");
    obj.edit38:setField("magias.espacosTotais5");
    obj.edit38:setName("edit38");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setFontSize(18);
    obj.edit38:setTransparent(true);
    obj.edit38:setFontColor("white");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart34);
    obj.edit39:setFrameRegion("RegiaoConteudo2");
    obj.edit39:setField("magias.espacosGastos5");
    obj.edit39:setName("edit39");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setFontSize(18);
    obj.edit39:setTransparent(true);
    obj.edit39:setFontColor("white");

    obj.flwMagicRecordList6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList6:setParent(obj.flowLayout20);
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
				


    obj.rclflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList6:setParent(obj.flwMagicRecordList6);
    obj.rclflwMagicRecordList6:setName("rclflwMagicRecordList6");
    obj.rclflwMagicRecordList6:setAlign("top");
    obj.rclflwMagicRecordList6:setField("magias.magias.nivel5");
    obj.rclflwMagicRecordList6:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList6:setAutoHeight(true);
    obj.rclflwMagicRecordList6:setMinHeight(5);
    obj.rclflwMagicRecordList6:setHitTest(false);
    obj.rclflwMagicRecordList6:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList6:setParent(obj.flwMagicRecordList6);
    obj.layBottomflwMagicRecordList6:setName("layBottomflwMagicRecordList6");
    obj.layBottomflwMagicRecordList6:setAlign("top");
    obj.layBottomflwMagicRecordList6:setHeight(36);

    obj.btnNovoflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList6:setParent(obj.layBottomflwMagicRecordList6);
    obj.btnNovoflwMagicRecordList6:setName("btnNovoflwMagicRecordList6");
    obj.btnNovoflwMagicRecordList6:setAlign("left");
    obj.btnNovoflwMagicRecordList6:setText("Novo");
    obj.btnNovoflwMagicRecordList6:setWidth(160);
    obj.btnNovoflwMagicRecordList6:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList6._recalcHeight();


    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.flowLayout14);
    obj.flowLayout21:setHeight(100);
    obj.flowLayout21:setAvoidScale(true);
    obj.flowLayout21:setMaxControlsPerLine(1);
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setName("flowLayout21");
    obj.flowLayout21:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout21:setStepSizes({310, 360, 420, 600});
    obj.flowLayout21:setMinScaledWidth(300);
    obj.flowLayout21:setMaxScaledWidth(600);
    obj.flowLayout21:setVertAlign("leading");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout21);
    obj.flowPart35:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setAvoidScale(true);
    obj.flowPart35:setMinScaledWidth(280);
    obj.flowPart35:setMinWidth(300);
    obj.flowPart35:setMaxWidth(600);
    obj.flowPart35:setHeight(80);
    obj.flowPart35:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart35:setVertAlign("leading");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart35);
    obj.label56:setFrameRegion("RegiaoSmallTitulo");
    obj.label56:setText("6");
    obj.label56:setName("label56");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setVertTextAlign("center");
    obj.label56:setFontSize(18);
    obj.label56:setFontColor("white");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart35);
    obj.edit40:setFrameRegion("RegiaoConteudo1");
    obj.edit40:setField("magias.espacosTotais6");
    obj.edit40:setName("edit40");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setFontSize(18);
    obj.edit40:setTransparent(true);
    obj.edit40:setFontColor("white");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart35);
    obj.edit41:setFrameRegion("RegiaoConteudo2");
    obj.edit41:setField("magias.espacosGastos6");
    obj.edit41:setName("edit41");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setFontSize(18);
    obj.edit41:setTransparent(true);
    obj.edit41:setFontColor("white");

    obj.flwMagicRecordList7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList7:setParent(obj.flowLayout21);
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
				


    obj.rclflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList7:setParent(obj.flwMagicRecordList7);
    obj.rclflwMagicRecordList7:setName("rclflwMagicRecordList7");
    obj.rclflwMagicRecordList7:setAlign("top");
    obj.rclflwMagicRecordList7:setField("magias.magias.nivel6");
    obj.rclflwMagicRecordList7:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList7:setAutoHeight(true);
    obj.rclflwMagicRecordList7:setMinHeight(5);
    obj.rclflwMagicRecordList7:setHitTest(false);
    obj.rclflwMagicRecordList7:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList7:setParent(obj.flwMagicRecordList7);
    obj.layBottomflwMagicRecordList7:setName("layBottomflwMagicRecordList7");
    obj.layBottomflwMagicRecordList7:setAlign("top");
    obj.layBottomflwMagicRecordList7:setHeight(36);

    obj.btnNovoflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList7:setParent(obj.layBottomflwMagicRecordList7);
    obj.btnNovoflwMagicRecordList7:setName("btnNovoflwMagicRecordList7");
    obj.btnNovoflwMagicRecordList7:setAlign("left");
    obj.btnNovoflwMagicRecordList7:setText("Novo");
    obj.btnNovoflwMagicRecordList7:setWidth(160);
    obj.btnNovoflwMagicRecordList7:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList7._recalcHeight();


    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowLayout14);
    obj.flowLayout22:setHeight(100);
    obj.flowLayout22:setAvoidScale(true);
    obj.flowLayout22:setMaxControlsPerLine(1);
    obj.flowLayout22:setAutoHeight(true);
    obj.flowLayout22:setName("flowLayout22");
    obj.flowLayout22:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout22:setStepSizes({310, 360, 420, 600});
    obj.flowLayout22:setMinScaledWidth(300);
    obj.flowLayout22:setMaxScaledWidth(600);
    obj.flowLayout22:setVertAlign("leading");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout22);
    obj.flowPart36:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setAvoidScale(true);
    obj.flowPart36:setMinScaledWidth(280);
    obj.flowPart36:setMinWidth(300);
    obj.flowPart36:setMaxWidth(600);
    obj.flowPart36:setHeight(80);
    obj.flowPart36:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart36:setVertAlign("leading");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart36);
    obj.label57:setFrameRegion("RegiaoSmallTitulo");
    obj.label57:setText("7");
    obj.label57:setName("label57");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setVertTextAlign("center");
    obj.label57:setFontSize(18);
    obj.label57:setFontColor("white");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart36);
    obj.edit42:setFrameRegion("RegiaoConteudo1");
    obj.edit42:setField("magias.espacosTotais7");
    obj.edit42:setName("edit42");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setFontSize(18);
    obj.edit42:setTransparent(true);
    obj.edit42:setFontColor("white");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart36);
    obj.edit43:setFrameRegion("RegiaoConteudo2");
    obj.edit43:setField("magias.espacosGastos7");
    obj.edit43:setName("edit43");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setFontSize(18);
    obj.edit43:setTransparent(true);
    obj.edit43:setFontColor("white");

    obj.flwMagicRecordList8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList8:setParent(obj.flowLayout22);
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
				


    obj.rclflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList8:setParent(obj.flwMagicRecordList8);
    obj.rclflwMagicRecordList8:setName("rclflwMagicRecordList8");
    obj.rclflwMagicRecordList8:setAlign("top");
    obj.rclflwMagicRecordList8:setField("magias.magias.nivel7");
    obj.rclflwMagicRecordList8:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList8:setAutoHeight(true);
    obj.rclflwMagicRecordList8:setMinHeight(5);
    obj.rclflwMagicRecordList8:setHitTest(false);
    obj.rclflwMagicRecordList8:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList8:setParent(obj.flwMagicRecordList8);
    obj.layBottomflwMagicRecordList8:setName("layBottomflwMagicRecordList8");
    obj.layBottomflwMagicRecordList8:setAlign("top");
    obj.layBottomflwMagicRecordList8:setHeight(36);

    obj.btnNovoflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList8:setParent(obj.layBottomflwMagicRecordList8);
    obj.btnNovoflwMagicRecordList8:setName("btnNovoflwMagicRecordList8");
    obj.btnNovoflwMagicRecordList8:setAlign("left");
    obj.btnNovoflwMagicRecordList8:setText("Novo");
    obj.btnNovoflwMagicRecordList8:setWidth(160);
    obj.btnNovoflwMagicRecordList8:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList8._recalcHeight();


    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.flowLayout14);
    obj.flowLayout23:setHeight(100);
    obj.flowLayout23:setAvoidScale(true);
    obj.flowLayout23:setMaxControlsPerLine(1);
    obj.flowLayout23:setAutoHeight(true);
    obj.flowLayout23:setName("flowLayout23");
    obj.flowLayout23:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout23:setStepSizes({310, 360, 420, 600});
    obj.flowLayout23:setMinScaledWidth(300);
    obj.flowLayout23:setMaxScaledWidth(600);
    obj.flowLayout23:setVertAlign("leading");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout23);
    obj.flowPart37:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setAvoidScale(true);
    obj.flowPart37:setMinScaledWidth(280);
    obj.flowPart37:setMinWidth(300);
    obj.flowPart37:setMaxWidth(600);
    obj.flowPart37:setHeight(80);
    obj.flowPart37:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart37:setVertAlign("leading");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart37);
    obj.label58:setFrameRegion("RegiaoSmallTitulo");
    obj.label58:setText("8");
    obj.label58:setName("label58");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setVertTextAlign("center");
    obj.label58:setFontSize(18);
    obj.label58:setFontColor("white");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart37);
    obj.edit44:setFrameRegion("RegiaoConteudo1");
    obj.edit44:setField("magias.espacosTotais8");
    obj.edit44:setName("edit44");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setFontSize(18);
    obj.edit44:setTransparent(true);
    obj.edit44:setFontColor("white");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart37);
    obj.edit45:setFrameRegion("RegiaoConteudo2");
    obj.edit45:setField("magias.espacosGastos8");
    obj.edit45:setName("edit45");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setFontSize(18);
    obj.edit45:setTransparent(true);
    obj.edit45:setFontColor("white");

    obj.flwMagicRecordList9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList9:setParent(obj.flowLayout23);
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
				


    obj.rclflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList9:setParent(obj.flwMagicRecordList9);
    obj.rclflwMagicRecordList9:setName("rclflwMagicRecordList9");
    obj.rclflwMagicRecordList9:setAlign("top");
    obj.rclflwMagicRecordList9:setField("magias.magias.nivel8");
    obj.rclflwMagicRecordList9:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList9:setAutoHeight(true);
    obj.rclflwMagicRecordList9:setMinHeight(5);
    obj.rclflwMagicRecordList9:setHitTest(false);
    obj.rclflwMagicRecordList9:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList9:setParent(obj.flwMagicRecordList9);
    obj.layBottomflwMagicRecordList9:setName("layBottomflwMagicRecordList9");
    obj.layBottomflwMagicRecordList9:setAlign("top");
    obj.layBottomflwMagicRecordList9:setHeight(36);

    obj.btnNovoflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList9:setParent(obj.layBottomflwMagicRecordList9);
    obj.btnNovoflwMagicRecordList9:setName("btnNovoflwMagicRecordList9");
    obj.btnNovoflwMagicRecordList9:setAlign("left");
    obj.btnNovoflwMagicRecordList9:setText("Novo");
    obj.btnNovoflwMagicRecordList9:setWidth(160);
    obj.btnNovoflwMagicRecordList9:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList9._recalcHeight();


    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowLayout14);
    obj.flowLayout24:setHeight(100);
    obj.flowLayout24:setAvoidScale(true);
    obj.flowLayout24:setMaxControlsPerLine(1);
    obj.flowLayout24:setAutoHeight(true);
    obj.flowLayout24:setName("flowLayout24");
    obj.flowLayout24:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout24:setStepSizes({310, 360, 420, 600});
    obj.flowLayout24:setMinScaledWidth(300);
    obj.flowLayout24:setMaxScaledWidth(600);
    obj.flowLayout24:setVertAlign("leading");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout24);
    obj.flowPart38:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setAvoidScale(true);
    obj.flowPart38:setMinScaledWidth(280);
    obj.flowPart38:setMinWidth(300);
    obj.flowPart38:setMaxWidth(600);
    obj.flowPart38:setHeight(80);
    obj.flowPart38:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart38:setVertAlign("leading");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart38);
    obj.label59:setFrameRegion("RegiaoSmallTitulo");
    obj.label59:setText("9");
    obj.label59:setName("label59");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setVertTextAlign("center");
    obj.label59:setFontSize(18);
    obj.label59:setFontColor("white");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart38);
    obj.edit46:setFrameRegion("RegiaoConteudo1");
    obj.edit46:setField("magias.espacosTotais9");
    obj.edit46:setName("edit46");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setFontSize(18);
    obj.edit46:setTransparent(true);
    obj.edit46:setFontColor("white");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart38);
    obj.edit47:setFrameRegion("RegiaoConteudo2");
    obj.edit47:setField("magias.espacosGastos9");
    obj.edit47:setName("edit47");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setFontSize(18);
    obj.edit47:setTransparent(true);
    obj.edit47:setFontColor("white");

    obj.flwMagicRecordList10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList10:setParent(obj.flowLayout24);
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
				


    obj.rclflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList10:setParent(obj.flwMagicRecordList10);
    obj.rclflwMagicRecordList10:setName("rclflwMagicRecordList10");
    obj.rclflwMagicRecordList10:setAlign("top");
    obj.rclflwMagicRecordList10:setField("magias.magias.nivel9");
    obj.rclflwMagicRecordList10:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList10:setAutoHeight(true);
    obj.rclflwMagicRecordList10:setMinHeight(5);
    obj.rclflwMagicRecordList10:setHitTest(false);
    obj.rclflwMagicRecordList10:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList10:setParent(obj.flwMagicRecordList10);
    obj.layBottomflwMagicRecordList10:setName("layBottomflwMagicRecordList10");
    obj.layBottomflwMagicRecordList10:setAlign("top");
    obj.layBottomflwMagicRecordList10:setHeight(36);

    obj.btnNovoflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList10:setParent(obj.layBottomflwMagicRecordList10);
    obj.btnNovoflwMagicRecordList10:setName("btnNovoflwMagicRecordList10");
    obj.btnNovoflwMagicRecordList10:setAlign("left");
    obj.btnNovoflwMagicRecordList10:setText("Novo");
    obj.btnNovoflwMagicRecordList10:setWidth(160);
    obj.btnNovoflwMagicRecordList10:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList10._recalcHeight();


    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Tecnologia");
    obj.tab6:setName("tab6");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.tab6);
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#40000000");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.rectangle5);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.fraTechLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraTechLayout:setParent(obj.scrollBox6);
    obj.fraTechLayout:setAlign("top");
    obj.fraTechLayout:setHeight(500);
    obj.fraTechLayout:setMargins({left=10, right=10, top=10});
    obj.fraTechLayout:setAutoHeight(true);
    obj.fraTechLayout:setHorzAlign("center");
    obj.fraTechLayout:setLineSpacing(3);
    obj.fraTechLayout:setName("fraTechLayout");
    obj.fraTechLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraTechLayout:setMinScaledWidth(300);
    obj.fraTechLayout:setVertAlign("leading");

    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.fraTechLayout);
    obj.flowLayout25:setAutoHeight(true);
    obj.flowLayout25:setMinScaledWidth(290);
    obj.flowLayout25:setHorzAlign("center");
    obj.flowLayout25:setName("flowLayout25");
    obj.flowLayout25:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout25:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout25:setVertAlign("leading");

    obj.fraUpperGridTech = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridTech:setParent(obj.flowLayout25);
    obj.fraUpperGridTech:setMinWidth(320);
    obj.fraUpperGridTech:setMaxWidth(1600);
    obj.fraUpperGridTech:setName("fraUpperGridTech");
    obj.fraUpperGridTech:setAvoidScale(true);
    obj.fraUpperGridTech:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridTech:setAutoHeight(true);
    obj.fraUpperGridTech:setVertAlign("trailing");
    obj.fraUpperGridTech:setMaxControlsPerLine(3);
    obj.fraUpperGridTech:setHorzAlign("center");
    obj.fraUpperGridTech:setLineSpacing(8);
    obj.fraUpperGridTech:setStepSizes({310, 360, 420});
    obj.fraUpperGridTech:setMinScaledWidth(300);
    obj.fraUpperGridTech:setMaxScaledWidth(340);
    obj.fraUpperGridTech:setMargins({left=1, right=1, top=2, bottom=2});

    obj.upperGridMagicEditBox7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox7:setParent(obj.fraUpperGridTech);
    obj.upperGridMagicEditBox7:setHeight(50);
    obj.upperGridMagicEditBox7:setMinScaledWidth(100);
    obj.upperGridMagicEditBox7:setMinWidth(100);
    obj.upperGridMagicEditBox7:setMaxWidth(160);
    obj.upperGridMagicEditBox7:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox7:setAvoidScale(true);
    obj.upperGridMagicEditBox7:setName("upperGridMagicEditBox7");
    obj.upperGridMagicEditBox7:setVertAlign("leading");
    obj.upperGridMagicEditBox7:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox7, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox7:setHeight(self.panupperGridMagicEditBox7:getHeight() + self.labupperGridMagicEditBox7:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox7 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox7:setParent(obj.upperGridMagicEditBox7);
    obj.panupperGridMagicEditBox7:setName("panupperGridMagicEditBox7");
    obj.panupperGridMagicEditBox7:setAlign("top");
    obj.panupperGridMagicEditBox7:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox7:setHeight(60);

    obj.edtupperGridMagicEditBox7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox7:setParent(obj.panupperGridMagicEditBox7);
    obj.edtupperGridMagicEditBox7:setName("edtupperGridMagicEditBox7");
    obj.edtupperGridMagicEditBox7:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox7:setField("forca.cdDaMagia");
    obj.edtupperGridMagicEditBox7:setFontSize(22);
    obj.edtupperGridMagicEditBox7:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox7:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox7:setFontColor("white");
    obj.edtupperGridMagicEditBox7:setTransparent(true);

    obj.labupperGridMagicEditBox7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox7:setParent(obj.upperGridMagicEditBox7);
    obj.labupperGridMagicEditBox7:setName("labupperGridMagicEditBox7");
    obj.labupperGridMagicEditBox7:setAlign("top");
    obj.labupperGridMagicEditBox7:setAutoSize(true);
    obj.labupperGridMagicEditBox7:setText("CD");
    obj.labupperGridMagicEditBox7:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox7:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox7:setWordWrap(true);
    obj.labupperGridMagicEditBox7:setTextTrimming("none");
    obj.labupperGridMagicEditBox7:setFontSize(12);
    obj.labupperGridMagicEditBox7:setFontColor("#D0D0D0");

self.upperGridMagicEditBox7._RecalcSize();	


    obj.upperGridMagicEditBox8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox8:setParent(obj.fraUpperGridTech);
    obj.upperGridMagicEditBox8:setHeight(50);
    obj.upperGridMagicEditBox8:setMinScaledWidth(100);
    obj.upperGridMagicEditBox8:setMinWidth(100);
    obj.upperGridMagicEditBox8:setMaxWidth(160);
    obj.upperGridMagicEditBox8:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox8:setAvoidScale(true);
    obj.upperGridMagicEditBox8:setName("upperGridMagicEditBox8");
    obj.upperGridMagicEditBox8:setVertAlign("leading");
    obj.upperGridMagicEditBox8:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox8, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox8:setHeight(self.panupperGridMagicEditBox8:getHeight() + self.labupperGridMagicEditBox8:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox8 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox8:setParent(obj.upperGridMagicEditBox8);
    obj.panupperGridMagicEditBox8:setName("panupperGridMagicEditBox8");
    obj.panupperGridMagicEditBox8:setAlign("top");
    obj.panupperGridMagicEditBox8:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox8:setHeight(60);

    obj.edtupperGridMagicEditBox8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox8:setParent(obj.panupperGridMagicEditBox8);
    obj.edtupperGridMagicEditBox8:setName("edtupperGridMagicEditBox8");
    obj.edtupperGridMagicEditBox8:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox8:setField("forca.bonusAtaqueSTR");
    obj.edtupperGridMagicEditBox8:setFontSize(22);
    obj.edtupperGridMagicEditBox8:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox8:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox8:setFontColor("white");
    obj.edtupperGridMagicEditBox8:setTransparent(true);

    obj.labupperGridMagicEditBox8 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox8:setParent(obj.upperGridMagicEditBox8);
    obj.labupperGridMagicEditBox8:setName("labupperGridMagicEditBox8");
    obj.labupperGridMagicEditBox8:setAlign("top");
    obj.labupperGridMagicEditBox8:setAutoSize(true);
    obj.labupperGridMagicEditBox8:setText("BÔNUS DE ATAQUE");
    obj.labupperGridMagicEditBox8:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox8:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox8:setWordWrap(true);
    obj.labupperGridMagicEditBox8:setTextTrimming("none");
    obj.labupperGridMagicEditBox8:setFontSize(12);
    obj.labupperGridMagicEditBox8:setFontColor("#D0D0D0");

self.upperGridMagicEditBox8._RecalcSize();	


    obj.upperGridMagicEditBox9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox9:setParent(obj.fraUpperGridTech);
    obj.upperGridMagicEditBox9:setHeight(50);
    obj.upperGridMagicEditBox9:setMinScaledWidth(100);
    obj.upperGridMagicEditBox9:setMinWidth(100);
    obj.upperGridMagicEditBox9:setMaxWidth(160);
    obj.upperGridMagicEditBox9:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox9:setAvoidScale(true);
    obj.upperGridMagicEditBox9:setName("upperGridMagicEditBox9");
    obj.upperGridMagicEditBox9:setVertAlign("leading");
    obj.upperGridMagicEditBox9:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox9, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox9:setHeight(self.panupperGridMagicEditBox9:getHeight() + self.labupperGridMagicEditBox9:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox9 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox9:setParent(obj.upperGridMagicEditBox9);
    obj.panupperGridMagicEditBox9:setName("panupperGridMagicEditBox9");
    obj.panupperGridMagicEditBox9:setAlign("top");
    obj.panupperGridMagicEditBox9:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox9:setHeight(60);

    obj.edtupperGridMagicEditBox9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox9:setParent(obj.panupperGridMagicEditBox9);
    obj.edtupperGridMagicEditBox9:setName("edtupperGridMagicEditBox9");
    obj.edtupperGridMagicEditBox9:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox9:setField("forca.points");
    obj.edtupperGridMagicEditBox9:setFontSize(22);
    obj.edtupperGridMagicEditBox9:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox9:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox9:setFontColor("white");
    obj.edtupperGridMagicEditBox9:setTransparent(true);

    obj.labupperGridMagicEditBox9 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox9:setParent(obj.upperGridMagicEditBox9);
    obj.labupperGridMagicEditBox9:setName("labupperGridMagicEditBox9");
    obj.labupperGridMagicEditBox9:setAlign("top");
    obj.labupperGridMagicEditBox9:setAutoSize(true);
    obj.labupperGridMagicEditBox9:setText("PONTOS DE FORÇA");
    obj.labupperGridMagicEditBox9:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox9:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox9:setWordWrap(true);
    obj.labupperGridMagicEditBox9:setTextTrimming("none");
    obj.labupperGridMagicEditBox9:setFontSize(12);
    obj.labupperGridMagicEditBox9:setFontColor("#D0D0D0");

self.upperGridMagicEditBox9._RecalcSize();	


    obj.upperGridMagicEditBox10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox10:setParent(obj.fraUpperGridTech);
    obj.upperGridMagicEditBox10:setHeight(50);
    obj.upperGridMagicEditBox10:setMinScaledWidth(100);
    obj.upperGridMagicEditBox10:setMinWidth(100);
    obj.upperGridMagicEditBox10:setMaxWidth(160);
    obj.upperGridMagicEditBox10:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox10:setAvoidScale(true);
    obj.upperGridMagicEditBox10:setName("upperGridMagicEditBox10");
    obj.upperGridMagicEditBox10:setVertAlign("leading");
    obj.upperGridMagicEditBox10:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox10, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox10:setHeight(self.panupperGridMagicEditBox10:getHeight() + self.labupperGridMagicEditBox10:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox10 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox10:setParent(obj.upperGridMagicEditBox10);
    obj.panupperGridMagicEditBox10:setName("panupperGridMagicEditBox10");
    obj.panupperGridMagicEditBox10:setAlign("top");
    obj.panupperGridMagicEditBox10:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox10:setHeight(60);

    obj.edtupperGridMagicEditBox10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox10:setParent(obj.panupperGridMagicEditBox10);
    obj.edtupperGridMagicEditBox10:setName("edtupperGridMagicEditBox10");
    obj.edtupperGridMagicEditBox10:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox10:setField("forca.light");
    obj.edtupperGridMagicEditBox10:setFontSize(22);
    obj.edtupperGridMagicEditBox10:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox10:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox10:setFontColor("white");
    obj.edtupperGridMagicEditBox10:setTransparent(true);

    obj.labupperGridMagicEditBox10 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox10:setParent(obj.upperGridMagicEditBox10);
    obj.labupperGridMagicEditBox10:setName("labupperGridMagicEditBox10");
    obj.labupperGridMagicEditBox10:setAlign("top");
    obj.labupperGridMagicEditBox10:setAutoSize(true);
    obj.labupperGridMagicEditBox10:setText("LADO LUMINOSO");
    obj.labupperGridMagicEditBox10:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox10:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox10:setWordWrap(true);
    obj.labupperGridMagicEditBox10:setTextTrimming("none");
    obj.labupperGridMagicEditBox10:setFontSize(12);
    obj.labupperGridMagicEditBox10:setFontColor("#D0D0D0");

self.upperGridMagicEditBox10._RecalcSize();	


    obj.upperGridMagicEditBox11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox11:setParent(obj.fraUpperGridTech);
    obj.upperGridMagicEditBox11:setHeight(50);
    obj.upperGridMagicEditBox11:setMinScaledWidth(100);
    obj.upperGridMagicEditBox11:setMinWidth(100);
    obj.upperGridMagicEditBox11:setMaxWidth(160);
    obj.upperGridMagicEditBox11:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox11:setAvoidScale(true);
    obj.upperGridMagicEditBox11:setName("upperGridMagicEditBox11");
    obj.upperGridMagicEditBox11:setVertAlign("leading");
    obj.upperGridMagicEditBox11:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox11, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox11:setHeight(self.panupperGridMagicEditBox11:getHeight() + self.labupperGridMagicEditBox11:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox11 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox11:setParent(obj.upperGridMagicEditBox11);
    obj.panupperGridMagicEditBox11:setName("panupperGridMagicEditBox11");
    obj.panupperGridMagicEditBox11:setAlign("top");
    obj.panupperGridMagicEditBox11:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox11:setHeight(60);

    obj.edtupperGridMagicEditBox11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox11:setParent(obj.panupperGridMagicEditBox11);
    obj.edtupperGridMagicEditBox11:setName("edtupperGridMagicEditBox11");
    obj.edtupperGridMagicEditBox11:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox11:setField("forca.dark");
    obj.edtupperGridMagicEditBox11:setFontSize(22);
    obj.edtupperGridMagicEditBox11:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox11:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox11:setFontColor("white");
    obj.edtupperGridMagicEditBox11:setTransparent(true);

    obj.labupperGridMagicEditBox11 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox11:setParent(obj.upperGridMagicEditBox11);
    obj.labupperGridMagicEditBox11:setName("labupperGridMagicEditBox11");
    obj.labupperGridMagicEditBox11:setAlign("top");
    obj.labupperGridMagicEditBox11:setAutoSize(true);
    obj.labupperGridMagicEditBox11:setText("LADO SOMBRIO");
    obj.labupperGridMagicEditBox11:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox11:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox11:setWordWrap(true);
    obj.labupperGridMagicEditBox11:setTextTrimming("none");
    obj.labupperGridMagicEditBox11:setFontSize(12);
    obj.labupperGridMagicEditBox11:setFontColor("#D0D0D0");

self.upperGridMagicEditBox11._RecalcSize();	


    obj.upperGridMagicEditBox12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox12:setParent(obj.fraUpperGridTech);
    obj.upperGridMagicEditBox12:setHeight(50);
    obj.upperGridMagicEditBox12:setMinScaledWidth(100);
    obj.upperGridMagicEditBox12:setMinWidth(100);
    obj.upperGridMagicEditBox12:setMaxWidth(160);
    obj.upperGridMagicEditBox12:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox12:setAvoidScale(true);
    obj.upperGridMagicEditBox12:setName("upperGridMagicEditBox12");
    obj.upperGridMagicEditBox12:setVertAlign("leading");
    obj.upperGridMagicEditBox12:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox12, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox12:setHeight(self.panupperGridMagicEditBox12:getHeight() + self.labupperGridMagicEditBox12:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox12 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox12:setParent(obj.upperGridMagicEditBox12);
    obj.panupperGridMagicEditBox12:setName("panupperGridMagicEditBox12");
    obj.panupperGridMagicEditBox12:setAlign("top");
    obj.panupperGridMagicEditBox12:setFrameStyle("frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox12:setHeight(60);

    obj.edtupperGridMagicEditBox12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox12:setParent(obj.panupperGridMagicEditBox12);
    obj.edtupperGridMagicEditBox12:setName("edtupperGridMagicEditBox12");
    obj.edtupperGridMagicEditBox12:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox12:setField("forca.universal");
    obj.edtupperGridMagicEditBox12:setFontSize(22);
    obj.edtupperGridMagicEditBox12:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox12:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox12:setFontColor("white");
    obj.edtupperGridMagicEditBox12:setTransparent(true);

    obj.labupperGridMagicEditBox12 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox12:setParent(obj.upperGridMagicEditBox12);
    obj.labupperGridMagicEditBox12:setName("labupperGridMagicEditBox12");
    obj.labupperGridMagicEditBox12:setAlign("top");
    obj.labupperGridMagicEditBox12:setAutoSize(true);
    obj.labupperGridMagicEditBox12:setText("UNIVERSAL");
    obj.labupperGridMagicEditBox12:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox12:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox12:setWordWrap(true);
    obj.labupperGridMagicEditBox12:setTextTrimming("none");
    obj.labupperGridMagicEditBox12:setFontSize(12);
    obj.labupperGridMagicEditBox12:setFontColor("#D0D0D0");

self.upperGridMagicEditBox12._RecalcSize();	


    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.fraTechLayout);
    obj.dataLink10:setFields({'magias.habilidadeDeConjuracao', 'atributos.modInteligencia', 'atributos.modSabedoria', 'atributos.modCarisma', 'bonusProficiencia'});
    obj.dataLink10:setName("dataLink10");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.fraTechLayout);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.fraTechLayout);
    obj.flowLayout26:setAutoHeight(true);
    obj.flowLayout26:setMaxColumns(3);
    obj.flowLayout26:setHorzAlign("center");
    obj.flowLayout26:setOrientation("vertical");
    obj.flowLayout26:setName("flowLayout26");
    obj.flowLayout26:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout26:setMinScaledWidth(300);
    obj.flowLayout26:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout26:setVertAlign("leading");

    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.flowLayout26);
    obj.flowLayout27:setHeight(100);
    obj.flowLayout27:setAvoidScale(true);
    obj.flowLayout27:setMaxControlsPerLine(1);
    obj.flowLayout27:setAutoHeight(true);
    obj.flowLayout27:setName("flowLayout27");
    obj.flowLayout27:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout27:setStepSizes({310, 360, 420, 600});
    obj.flowLayout27:setMinScaledWidth(300);
    obj.flowLayout27:setMaxScaledWidth(600);
    obj.flowLayout27:setVertAlign("leading");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout27);
    obj.flowPart39:setFrameStyle("frames/magicHeader/header0.xml");
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setAvoidScale(true);
    obj.flowPart39:setMinScaledWidth(280);
    obj.flowPart39:setMinWidth(300);
    obj.flowPart39:setMaxWidth(600);
    obj.flowPart39:setHeight(80);
    obj.flowPart39:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart39:setVertAlign("leading");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart39);
    obj.label60:setFrameRegion("RegiaoSmallTitulo");
    obj.label60:setText("0");
    obj.label60:setName("label60");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setVertTextAlign("center");
    obj.label60:setFontSize(18);
    obj.label60:setFontColor("white");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart39);
    obj.label61:setFrameRegion("RegiaoConteudo");
    obj.label61:setText("LIVRES");
    obj.label61:setFontSize(15);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setVertTextAlign("center");
    obj.label61:setName("label61");
    obj.label61:setFontColor("white");

    obj.flwMagicRecordList11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList11:setParent(obj.flowLayout27);
    obj.flwMagicRecordList11:setMinWidth(300);
    obj.flwMagicRecordList11:setMaxWidth(600);
    obj.flwMagicRecordList11:setMinScaledWidth(280);
    obj.flwMagicRecordList11:setName("flwMagicRecordList11");
    obj.flwMagicRecordList11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList11:setVertAlign("leading");


					rawset(self.flwMagicRecordList11, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList11.height = self.rclflwMagicRecordList11.height +
														self.layBottomflwMagicRecordList11.height + 
														self.flwMagicRecordList11.padding.top + self.flwMagicRecordList11.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList11 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList11:setParent(obj.flwMagicRecordList11);
    obj.rclflwMagicRecordList11:setName("rclflwMagicRecordList11");
    obj.rclflwMagicRecordList11:setAlign("top");
    obj.rclflwMagicRecordList11:setField("magias.magias.nivel0");
    obj.rclflwMagicRecordList11:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclflwMagicRecordList11:setAutoHeight(true);
    obj.rclflwMagicRecordList11:setMinHeight(5);
    obj.rclflwMagicRecordList11:setHitTest(false);
    obj.rclflwMagicRecordList11:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList11:setParent(obj.flwMagicRecordList11);
    obj.layBottomflwMagicRecordList11:setName("layBottomflwMagicRecordList11");
    obj.layBottomflwMagicRecordList11:setAlign("top");
    obj.layBottomflwMagicRecordList11:setHeight(36);

    obj.btnNovoflwMagicRecordList11 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList11:setParent(obj.layBottomflwMagicRecordList11);
    obj.btnNovoflwMagicRecordList11:setName("btnNovoflwMagicRecordList11");
    obj.btnNovoflwMagicRecordList11:setAlign("left");
    obj.btnNovoflwMagicRecordList11:setText("Novo");
    obj.btnNovoflwMagicRecordList11:setWidth(160);
    obj.btnNovoflwMagicRecordList11:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList11._recalcHeight();


    obj.flowLayout28 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.flowLayout26);
    obj.flowLayout28:setHeight(100);
    obj.flowLayout28:setAvoidScale(true);
    obj.flowLayout28:setMaxControlsPerLine(1);
    obj.flowLayout28:setAutoHeight(true);
    obj.flowLayout28:setName("flowLayout28");
    obj.flowLayout28:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout28:setStepSizes({310, 360, 420, 600});
    obj.flowLayout28:setMinScaledWidth(300);
    obj.flowLayout28:setMaxScaledWidth(600);
    obj.flowLayout28:setVertAlign("leading");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout28);
    obj.flowPart40:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setAvoidScale(true);
    obj.flowPart40:setMinScaledWidth(280);
    obj.flowPart40:setMinWidth(300);
    obj.flowPart40:setMaxWidth(600);
    obj.flowPart40:setHeight(80);
    obj.flowPart40:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart40:setVertAlign("leading");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart40);
    obj.label62:setFrameRegion("RegiaoSmallTitulo");
    obj.label62:setText("1");
    obj.label62:setName("label62");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setVertTextAlign("center");
    obj.label62:setFontSize(18);
    obj.label62:setFontColor("white");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart40);
    obj.edit48:setFrameRegion("RegiaoConteudo1");
    obj.edit48:setField("magias.espacosTotais1");
    obj.edit48:setName("edit48");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setFontSize(18);
    obj.edit48:setTransparent(true);
    obj.edit48:setFontColor("white");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart40);
    obj.edit49:setFrameRegion("RegiaoConteudo2");
    obj.edit49:setField("magias.espacosGastos1");
    obj.edit49:setName("edit49");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setFontSize(18);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontColor("white");

    obj.flwMagicRecordList12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList12:setParent(obj.flowLayout28);
    obj.flwMagicRecordList12:setMinWidth(300);
    obj.flwMagicRecordList12:setMaxWidth(600);
    obj.flwMagicRecordList12:setMinScaledWidth(280);
    obj.flwMagicRecordList12:setName("flwMagicRecordList12");
    obj.flwMagicRecordList12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList12:setVertAlign("leading");


					rawset(self.flwMagicRecordList12, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList12.height = self.rclflwMagicRecordList12.height +
														self.layBottomflwMagicRecordList12.height + 
														self.flwMagicRecordList12.padding.top + self.flwMagicRecordList12.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList12 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList12:setParent(obj.flwMagicRecordList12);
    obj.rclflwMagicRecordList12:setName("rclflwMagicRecordList12");
    obj.rclflwMagicRecordList12:setAlign("top");
    obj.rclflwMagicRecordList12:setField("magias.magias.nivel1");
    obj.rclflwMagicRecordList12:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList12:setAutoHeight(true);
    obj.rclflwMagicRecordList12:setMinHeight(5);
    obj.rclflwMagicRecordList12:setHitTest(false);
    obj.rclflwMagicRecordList12:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList12:setParent(obj.flwMagicRecordList12);
    obj.layBottomflwMagicRecordList12:setName("layBottomflwMagicRecordList12");
    obj.layBottomflwMagicRecordList12:setAlign("top");
    obj.layBottomflwMagicRecordList12:setHeight(36);

    obj.btnNovoflwMagicRecordList12 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList12:setParent(obj.layBottomflwMagicRecordList12);
    obj.btnNovoflwMagicRecordList12:setName("btnNovoflwMagicRecordList12");
    obj.btnNovoflwMagicRecordList12:setAlign("left");
    obj.btnNovoflwMagicRecordList12:setText("Novo");
    obj.btnNovoflwMagicRecordList12:setWidth(160);
    obj.btnNovoflwMagicRecordList12:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList12._recalcHeight();


    obj.flowLayout29 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.flowLayout26);
    obj.flowLayout29:setHeight(100);
    obj.flowLayout29:setAvoidScale(true);
    obj.flowLayout29:setMaxControlsPerLine(1);
    obj.flowLayout29:setAutoHeight(true);
    obj.flowLayout29:setName("flowLayout29");
    obj.flowLayout29:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout29:setStepSizes({310, 360, 420, 600});
    obj.flowLayout29:setMinScaledWidth(300);
    obj.flowLayout29:setMaxScaledWidth(600);
    obj.flowLayout29:setVertAlign("leading");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout29);
    obj.flowPart41:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setAvoidScale(true);
    obj.flowPart41:setMinScaledWidth(280);
    obj.flowPart41:setMinWidth(300);
    obj.flowPart41:setMaxWidth(600);
    obj.flowPart41:setHeight(80);
    obj.flowPart41:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart41:setVertAlign("leading");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart41);
    obj.label63:setFrameRegion("RegiaoSmallTitulo");
    obj.label63:setText("2");
    obj.label63:setName("label63");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setVertTextAlign("center");
    obj.label63:setFontSize(18);
    obj.label63:setFontColor("white");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart41);
    obj.edit50:setFrameRegion("RegiaoConteudo1");
    obj.edit50:setField("magias.espacosTotais2");
    obj.edit50:setName("edit50");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setFontSize(18);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontColor("white");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart41);
    obj.edit51:setFrameRegion("RegiaoConteudo2");
    obj.edit51:setField("magias.espacosGastos2");
    obj.edit51:setName("edit51");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setFontSize(18);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontColor("white");

    obj.flwMagicRecordList13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList13:setParent(obj.flowLayout29);
    obj.flwMagicRecordList13:setMinWidth(300);
    obj.flwMagicRecordList13:setMaxWidth(600);
    obj.flwMagicRecordList13:setMinScaledWidth(280);
    obj.flwMagicRecordList13:setName("flwMagicRecordList13");
    obj.flwMagicRecordList13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList13:setVertAlign("leading");


					rawset(self.flwMagicRecordList13, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList13.height = self.rclflwMagicRecordList13.height +
														self.layBottomflwMagicRecordList13.height + 
														self.flwMagicRecordList13.padding.top + self.flwMagicRecordList13.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList13 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList13:setParent(obj.flwMagicRecordList13);
    obj.rclflwMagicRecordList13:setName("rclflwMagicRecordList13");
    obj.rclflwMagicRecordList13:setAlign("top");
    obj.rclflwMagicRecordList13:setField("magias.magias.nivel2");
    obj.rclflwMagicRecordList13:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList13:setAutoHeight(true);
    obj.rclflwMagicRecordList13:setMinHeight(5);
    obj.rclflwMagicRecordList13:setHitTest(false);
    obj.rclflwMagicRecordList13:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList13:setParent(obj.flwMagicRecordList13);
    obj.layBottomflwMagicRecordList13:setName("layBottomflwMagicRecordList13");
    obj.layBottomflwMagicRecordList13:setAlign("top");
    obj.layBottomflwMagicRecordList13:setHeight(36);

    obj.btnNovoflwMagicRecordList13 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList13:setParent(obj.layBottomflwMagicRecordList13);
    obj.btnNovoflwMagicRecordList13:setName("btnNovoflwMagicRecordList13");
    obj.btnNovoflwMagicRecordList13:setAlign("left");
    obj.btnNovoflwMagicRecordList13:setText("Novo");
    obj.btnNovoflwMagicRecordList13:setWidth(160);
    obj.btnNovoflwMagicRecordList13:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList13._recalcHeight();


    obj.flowLayout30 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.flowLayout26);
    obj.flowLayout30:setHeight(100);
    obj.flowLayout30:setAvoidScale(true);
    obj.flowLayout30:setMaxControlsPerLine(1);
    obj.flowLayout30:setAutoHeight(true);
    obj.flowLayout30:setName("flowLayout30");
    obj.flowLayout30:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout30:setStepSizes({310, 360, 420, 600});
    obj.flowLayout30:setMinScaledWidth(300);
    obj.flowLayout30:setMaxScaledWidth(600);
    obj.flowLayout30:setVertAlign("leading");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout30);
    obj.flowPart42:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart42:setName("flowPart42");
    obj.flowPart42:setAvoidScale(true);
    obj.flowPart42:setMinScaledWidth(280);
    obj.flowPart42:setMinWidth(300);
    obj.flowPart42:setMaxWidth(600);
    obj.flowPart42:setHeight(80);
    obj.flowPart42:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart42:setVertAlign("leading");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart42);
    obj.label64:setFrameRegion("RegiaoSmallTitulo");
    obj.label64:setText("3");
    obj.label64:setName("label64");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setVertTextAlign("center");
    obj.label64:setFontSize(18);
    obj.label64:setFontColor("white");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart42);
    obj.edit52:setFrameRegion("RegiaoConteudo1");
    obj.edit52:setField("magias.espacosTotais3");
    obj.edit52:setName("edit52");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setFontSize(18);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontColor("white");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart42);
    obj.edit53:setFrameRegion("RegiaoConteudo2");
    obj.edit53:setField("magias.espacosGastos3");
    obj.edit53:setName("edit53");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setFontSize(18);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontColor("white");

    obj.flwMagicRecordList14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList14:setParent(obj.flowLayout30);
    obj.flwMagicRecordList14:setMinWidth(300);
    obj.flwMagicRecordList14:setMaxWidth(600);
    obj.flwMagicRecordList14:setMinScaledWidth(280);
    obj.flwMagicRecordList14:setName("flwMagicRecordList14");
    obj.flwMagicRecordList14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList14:setVertAlign("leading");


					rawset(self.flwMagicRecordList14, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList14.height = self.rclflwMagicRecordList14.height +
														self.layBottomflwMagicRecordList14.height + 
														self.flwMagicRecordList14.padding.top + self.flwMagicRecordList14.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList14 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList14:setParent(obj.flwMagicRecordList14);
    obj.rclflwMagicRecordList14:setName("rclflwMagicRecordList14");
    obj.rclflwMagicRecordList14:setAlign("top");
    obj.rclflwMagicRecordList14:setField("magias.magias.nivel3");
    obj.rclflwMagicRecordList14:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList14:setAutoHeight(true);
    obj.rclflwMagicRecordList14:setMinHeight(5);
    obj.rclflwMagicRecordList14:setHitTest(false);
    obj.rclflwMagicRecordList14:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList14:setParent(obj.flwMagicRecordList14);
    obj.layBottomflwMagicRecordList14:setName("layBottomflwMagicRecordList14");
    obj.layBottomflwMagicRecordList14:setAlign("top");
    obj.layBottomflwMagicRecordList14:setHeight(36);

    obj.btnNovoflwMagicRecordList14 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList14:setParent(obj.layBottomflwMagicRecordList14);
    obj.btnNovoflwMagicRecordList14:setName("btnNovoflwMagicRecordList14");
    obj.btnNovoflwMagicRecordList14:setAlign("left");
    obj.btnNovoflwMagicRecordList14:setText("Novo");
    obj.btnNovoflwMagicRecordList14:setWidth(160);
    obj.btnNovoflwMagicRecordList14:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList14._recalcHeight();


    obj.flowLayout31 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.flowLayout26);
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

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout31);
    obj.flowPart43:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart43:setName("flowPart43");
    obj.flowPart43:setAvoidScale(true);
    obj.flowPart43:setMinScaledWidth(280);
    obj.flowPart43:setMinWidth(300);
    obj.flowPart43:setMaxWidth(600);
    obj.flowPart43:setHeight(80);
    obj.flowPart43:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart43:setVertAlign("leading");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart43);
    obj.label65:setFrameRegion("RegiaoSmallTitulo");
    obj.label65:setText("4");
    obj.label65:setName("label65");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setVertTextAlign("center");
    obj.label65:setFontSize(18);
    obj.label65:setFontColor("white");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart43);
    obj.edit54:setFrameRegion("RegiaoConteudo1");
    obj.edit54:setField("magias.espacosTotais4");
    obj.edit54:setName("edit54");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setFontSize(18);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontColor("white");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart43);
    obj.edit55:setFrameRegion("RegiaoConteudo2");
    obj.edit55:setField("magias.espacosGastos4");
    obj.edit55:setName("edit55");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setFontSize(18);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontColor("white");

    obj.flwMagicRecordList15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList15:setParent(obj.flowLayout31);
    obj.flwMagicRecordList15:setMinWidth(300);
    obj.flwMagicRecordList15:setMaxWidth(600);
    obj.flwMagicRecordList15:setMinScaledWidth(280);
    obj.flwMagicRecordList15:setName("flwMagicRecordList15");
    obj.flwMagicRecordList15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList15:setVertAlign("leading");


					rawset(self.flwMagicRecordList15, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList15.height = self.rclflwMagicRecordList15.height +
														self.layBottomflwMagicRecordList15.height + 
														self.flwMagicRecordList15.padding.top + self.flwMagicRecordList15.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList15 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList15:setParent(obj.flwMagicRecordList15);
    obj.rclflwMagicRecordList15:setName("rclflwMagicRecordList15");
    obj.rclflwMagicRecordList15:setAlign("top");
    obj.rclflwMagicRecordList15:setField("magias.magias.nivel4");
    obj.rclflwMagicRecordList15:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList15:setAutoHeight(true);
    obj.rclflwMagicRecordList15:setMinHeight(5);
    obj.rclflwMagicRecordList15:setHitTest(false);
    obj.rclflwMagicRecordList15:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList15:setParent(obj.flwMagicRecordList15);
    obj.layBottomflwMagicRecordList15:setName("layBottomflwMagicRecordList15");
    obj.layBottomflwMagicRecordList15:setAlign("top");
    obj.layBottomflwMagicRecordList15:setHeight(36);

    obj.btnNovoflwMagicRecordList15 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList15:setParent(obj.layBottomflwMagicRecordList15);
    obj.btnNovoflwMagicRecordList15:setName("btnNovoflwMagicRecordList15");
    obj.btnNovoflwMagicRecordList15:setAlign("left");
    obj.btnNovoflwMagicRecordList15:setText("Novo");
    obj.btnNovoflwMagicRecordList15:setWidth(160);
    obj.btnNovoflwMagicRecordList15:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList15._recalcHeight();


    obj.flowLayout32 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.flowLayout26);
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

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout32);
    obj.flowPart44:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart44:setName("flowPart44");
    obj.flowPart44:setAvoidScale(true);
    obj.flowPart44:setMinScaledWidth(280);
    obj.flowPart44:setMinWidth(300);
    obj.flowPart44:setMaxWidth(600);
    obj.flowPart44:setHeight(80);
    obj.flowPart44:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart44:setVertAlign("leading");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart44);
    obj.label66:setFrameRegion("RegiaoSmallTitulo");
    obj.label66:setText("5");
    obj.label66:setName("label66");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setVertTextAlign("center");
    obj.label66:setFontSize(18);
    obj.label66:setFontColor("white");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart44);
    obj.edit56:setFrameRegion("RegiaoConteudo1");
    obj.edit56:setField("magias.espacosTotais5");
    obj.edit56:setName("edit56");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setFontSize(18);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontColor("white");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart44);
    obj.edit57:setFrameRegion("RegiaoConteudo2");
    obj.edit57:setField("magias.espacosGastos5");
    obj.edit57:setName("edit57");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setFontSize(18);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontColor("white");

    obj.flwMagicRecordList16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList16:setParent(obj.flowLayout32);
    obj.flwMagicRecordList16:setMinWidth(300);
    obj.flwMagicRecordList16:setMaxWidth(600);
    obj.flwMagicRecordList16:setMinScaledWidth(280);
    obj.flwMagicRecordList16:setName("flwMagicRecordList16");
    obj.flwMagicRecordList16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList16:setVertAlign("leading");


					rawset(self.flwMagicRecordList16, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList16.height = self.rclflwMagicRecordList16.height +
														self.layBottomflwMagicRecordList16.height + 
														self.flwMagicRecordList16.padding.top + self.flwMagicRecordList16.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList16 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList16:setParent(obj.flwMagicRecordList16);
    obj.rclflwMagicRecordList16:setName("rclflwMagicRecordList16");
    obj.rclflwMagicRecordList16:setAlign("top");
    obj.rclflwMagicRecordList16:setField("magias.magias.nivel5");
    obj.rclflwMagicRecordList16:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList16:setAutoHeight(true);
    obj.rclflwMagicRecordList16:setMinHeight(5);
    obj.rclflwMagicRecordList16:setHitTest(false);
    obj.rclflwMagicRecordList16:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList16:setParent(obj.flwMagicRecordList16);
    obj.layBottomflwMagicRecordList16:setName("layBottomflwMagicRecordList16");
    obj.layBottomflwMagicRecordList16:setAlign("top");
    obj.layBottomflwMagicRecordList16:setHeight(36);

    obj.btnNovoflwMagicRecordList16 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList16:setParent(obj.layBottomflwMagicRecordList16);
    obj.btnNovoflwMagicRecordList16:setName("btnNovoflwMagicRecordList16");
    obj.btnNovoflwMagicRecordList16:setAlign("left");
    obj.btnNovoflwMagicRecordList16:setText("Novo");
    obj.btnNovoflwMagicRecordList16:setWidth(160);
    obj.btnNovoflwMagicRecordList16:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList16._recalcHeight();


    obj.flowLayout33 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.flowLayout26);
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

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout33);
    obj.flowPart45:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart45:setName("flowPart45");
    obj.flowPart45:setAvoidScale(true);
    obj.flowPart45:setMinScaledWidth(280);
    obj.flowPart45:setMinWidth(300);
    obj.flowPart45:setMaxWidth(600);
    obj.flowPart45:setHeight(80);
    obj.flowPart45:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart45:setVertAlign("leading");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart45);
    obj.label67:setFrameRegion("RegiaoSmallTitulo");
    obj.label67:setText("6");
    obj.label67:setName("label67");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setVertTextAlign("center");
    obj.label67:setFontSize(18);
    obj.label67:setFontColor("white");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart45);
    obj.edit58:setFrameRegion("RegiaoConteudo1");
    obj.edit58:setField("magias.espacosTotais6");
    obj.edit58:setName("edit58");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setFontSize(18);
    obj.edit58:setTransparent(true);
    obj.edit58:setFontColor("white");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart45);
    obj.edit59:setFrameRegion("RegiaoConteudo2");
    obj.edit59:setField("magias.espacosGastos6");
    obj.edit59:setName("edit59");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setFontSize(18);
    obj.edit59:setTransparent(true);
    obj.edit59:setFontColor("white");

    obj.flwMagicRecordList17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList17:setParent(obj.flowLayout33);
    obj.flwMagicRecordList17:setMinWidth(300);
    obj.flwMagicRecordList17:setMaxWidth(600);
    obj.flwMagicRecordList17:setMinScaledWidth(280);
    obj.flwMagicRecordList17:setName("flwMagicRecordList17");
    obj.flwMagicRecordList17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList17:setVertAlign("leading");


					rawset(self.flwMagicRecordList17, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList17.height = self.rclflwMagicRecordList17.height +
														self.layBottomflwMagicRecordList17.height + 
														self.flwMagicRecordList17.padding.top + self.flwMagicRecordList17.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList17 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList17:setParent(obj.flwMagicRecordList17);
    obj.rclflwMagicRecordList17:setName("rclflwMagicRecordList17");
    obj.rclflwMagicRecordList17:setAlign("top");
    obj.rclflwMagicRecordList17:setField("magias.magias.nivel6");
    obj.rclflwMagicRecordList17:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList17:setAutoHeight(true);
    obj.rclflwMagicRecordList17:setMinHeight(5);
    obj.rclflwMagicRecordList17:setHitTest(false);
    obj.rclflwMagicRecordList17:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList17:setParent(obj.flwMagicRecordList17);
    obj.layBottomflwMagicRecordList17:setName("layBottomflwMagicRecordList17");
    obj.layBottomflwMagicRecordList17:setAlign("top");
    obj.layBottomflwMagicRecordList17:setHeight(36);

    obj.btnNovoflwMagicRecordList17 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList17:setParent(obj.layBottomflwMagicRecordList17);
    obj.btnNovoflwMagicRecordList17:setName("btnNovoflwMagicRecordList17");
    obj.btnNovoflwMagicRecordList17:setAlign("left");
    obj.btnNovoflwMagicRecordList17:setText("Novo");
    obj.btnNovoflwMagicRecordList17:setWidth(160);
    obj.btnNovoflwMagicRecordList17:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList17._recalcHeight();


    obj.flowLayout34 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.flowLayout26);
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

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout34);
    obj.flowPart46:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart46:setName("flowPart46");
    obj.flowPart46:setAvoidScale(true);
    obj.flowPart46:setMinScaledWidth(280);
    obj.flowPart46:setMinWidth(300);
    obj.flowPart46:setMaxWidth(600);
    obj.flowPart46:setHeight(80);
    obj.flowPart46:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart46:setVertAlign("leading");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart46);
    obj.label68:setFrameRegion("RegiaoSmallTitulo");
    obj.label68:setText("7");
    obj.label68:setName("label68");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setVertTextAlign("center");
    obj.label68:setFontSize(18);
    obj.label68:setFontColor("white");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart46);
    obj.edit60:setFrameRegion("RegiaoConteudo1");
    obj.edit60:setField("magias.espacosTotais7");
    obj.edit60:setName("edit60");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setFontSize(18);
    obj.edit60:setTransparent(true);
    obj.edit60:setFontColor("white");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart46);
    obj.edit61:setFrameRegion("RegiaoConteudo2");
    obj.edit61:setField("magias.espacosGastos7");
    obj.edit61:setName("edit61");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setFontSize(18);
    obj.edit61:setTransparent(true);
    obj.edit61:setFontColor("white");

    obj.flwMagicRecordList18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList18:setParent(obj.flowLayout34);
    obj.flwMagicRecordList18:setMinWidth(300);
    obj.flwMagicRecordList18:setMaxWidth(600);
    obj.flwMagicRecordList18:setMinScaledWidth(280);
    obj.flwMagicRecordList18:setName("flwMagicRecordList18");
    obj.flwMagicRecordList18:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList18:setVertAlign("leading");


					rawset(self.flwMagicRecordList18, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList18.height = self.rclflwMagicRecordList18.height +
														self.layBottomflwMagicRecordList18.height + 
														self.flwMagicRecordList18.padding.top + self.flwMagicRecordList18.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList18 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList18:setParent(obj.flwMagicRecordList18);
    obj.rclflwMagicRecordList18:setName("rclflwMagicRecordList18");
    obj.rclflwMagicRecordList18:setAlign("top");
    obj.rclflwMagicRecordList18:setField("magias.magias.nivel7");
    obj.rclflwMagicRecordList18:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList18:setAutoHeight(true);
    obj.rclflwMagicRecordList18:setMinHeight(5);
    obj.rclflwMagicRecordList18:setHitTest(false);
    obj.rclflwMagicRecordList18:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList18:setParent(obj.flwMagicRecordList18);
    obj.layBottomflwMagicRecordList18:setName("layBottomflwMagicRecordList18");
    obj.layBottomflwMagicRecordList18:setAlign("top");
    obj.layBottomflwMagicRecordList18:setHeight(36);

    obj.btnNovoflwMagicRecordList18 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList18:setParent(obj.layBottomflwMagicRecordList18);
    obj.btnNovoflwMagicRecordList18:setName("btnNovoflwMagicRecordList18");
    obj.btnNovoflwMagicRecordList18:setAlign("left");
    obj.btnNovoflwMagicRecordList18:setText("Novo");
    obj.btnNovoflwMagicRecordList18:setWidth(160);
    obj.btnNovoflwMagicRecordList18:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList18._recalcHeight();


    obj.flowLayout35 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout35:setParent(obj.flowLayout26);
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

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout35);
    obj.flowPart47:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setAvoidScale(true);
    obj.flowPart47:setMinScaledWidth(280);
    obj.flowPart47:setMinWidth(300);
    obj.flowPart47:setMaxWidth(600);
    obj.flowPart47:setHeight(80);
    obj.flowPart47:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart47:setVertAlign("leading");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart47);
    obj.label69:setFrameRegion("RegiaoSmallTitulo");
    obj.label69:setText("8");
    obj.label69:setName("label69");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setVertTextAlign("center");
    obj.label69:setFontSize(18);
    obj.label69:setFontColor("white");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart47);
    obj.edit62:setFrameRegion("RegiaoConteudo1");
    obj.edit62:setField("magias.espacosTotais8");
    obj.edit62:setName("edit62");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setFontSize(18);
    obj.edit62:setTransparent(true);
    obj.edit62:setFontColor("white");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart47);
    obj.edit63:setFrameRegion("RegiaoConteudo2");
    obj.edit63:setField("magias.espacosGastos8");
    obj.edit63:setName("edit63");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setFontSize(18);
    obj.edit63:setTransparent(true);
    obj.edit63:setFontColor("white");

    obj.flwMagicRecordList19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList19:setParent(obj.flowLayout35);
    obj.flwMagicRecordList19:setMinWidth(300);
    obj.flwMagicRecordList19:setMaxWidth(600);
    obj.flwMagicRecordList19:setMinScaledWidth(280);
    obj.flwMagicRecordList19:setName("flwMagicRecordList19");
    obj.flwMagicRecordList19:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList19:setVertAlign("leading");


					rawset(self.flwMagicRecordList19, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList19.height = self.rclflwMagicRecordList19.height +
														self.layBottomflwMagicRecordList19.height + 
														self.flwMagicRecordList19.padding.top + self.flwMagicRecordList19.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList19 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList19:setParent(obj.flwMagicRecordList19);
    obj.rclflwMagicRecordList19:setName("rclflwMagicRecordList19");
    obj.rclflwMagicRecordList19:setAlign("top");
    obj.rclflwMagicRecordList19:setField("magias.magias.nivel8");
    obj.rclflwMagicRecordList19:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList19:setAutoHeight(true);
    obj.rclflwMagicRecordList19:setMinHeight(5);
    obj.rclflwMagicRecordList19:setHitTest(false);
    obj.rclflwMagicRecordList19:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList19:setParent(obj.flwMagicRecordList19);
    obj.layBottomflwMagicRecordList19:setName("layBottomflwMagicRecordList19");
    obj.layBottomflwMagicRecordList19:setAlign("top");
    obj.layBottomflwMagicRecordList19:setHeight(36);

    obj.btnNovoflwMagicRecordList19 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList19:setParent(obj.layBottomflwMagicRecordList19);
    obj.btnNovoflwMagicRecordList19:setName("btnNovoflwMagicRecordList19");
    obj.btnNovoflwMagicRecordList19:setAlign("left");
    obj.btnNovoflwMagicRecordList19:setText("Novo");
    obj.btnNovoflwMagicRecordList19:setWidth(160);
    obj.btnNovoflwMagicRecordList19:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList19._recalcHeight();


    obj.flowLayout36 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout36:setParent(obj.flowLayout26);
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

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout36);
    obj.flowPart48:setFrameStyle("frames/magicHeader/header1.xml");
    obj.flowPart48:setName("flowPart48");
    obj.flowPart48:setAvoidScale(true);
    obj.flowPart48:setMinScaledWidth(280);
    obj.flowPart48:setMinWidth(300);
    obj.flowPart48:setMaxWidth(600);
    obj.flowPart48:setHeight(80);
    obj.flowPart48:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart48:setVertAlign("leading");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart48);
    obj.label70:setFrameRegion("RegiaoSmallTitulo");
    obj.label70:setText("9");
    obj.label70:setName("label70");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setVertTextAlign("center");
    obj.label70:setFontSize(18);
    obj.label70:setFontColor("white");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart48);
    obj.edit64:setFrameRegion("RegiaoConteudo1");
    obj.edit64:setField("magias.espacosTotais9");
    obj.edit64:setName("edit64");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setFontSize(18);
    obj.edit64:setTransparent(true);
    obj.edit64:setFontColor("white");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart48);
    obj.edit65:setFrameRegion("RegiaoConteudo2");
    obj.edit65:setField("magias.espacosGastos9");
    obj.edit65:setName("edit65");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setFontSize(18);
    obj.edit65:setTransparent(true);
    obj.edit65:setFontColor("white");

    obj.flwMagicRecordList20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList20:setParent(obj.flowLayout36);
    obj.flwMagicRecordList20:setMinWidth(300);
    obj.flwMagicRecordList20:setMaxWidth(600);
    obj.flwMagicRecordList20:setMinScaledWidth(280);
    obj.flwMagicRecordList20:setName("flwMagicRecordList20");
    obj.flwMagicRecordList20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList20:setVertAlign("leading");


					rawset(self.flwMagicRecordList20, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList20.height = self.rclflwMagicRecordList20.height +
														self.layBottomflwMagicRecordList20.height + 
														self.flwMagicRecordList20.padding.top + self.flwMagicRecordList20.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList20 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList20:setParent(obj.flwMagicRecordList20);
    obj.rclflwMagicRecordList20:setName("rclflwMagicRecordList20");
    obj.rclflwMagicRecordList20:setAlign("top");
    obj.rclflwMagicRecordList20:setField("magias.magias.nivel9");
    obj.rclflwMagicRecordList20:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList20:setAutoHeight(true);
    obj.rclflwMagicRecordList20:setMinHeight(5);
    obj.rclflwMagicRecordList20:setHitTest(false);
    obj.rclflwMagicRecordList20:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList20:setParent(obj.flwMagicRecordList20);
    obj.layBottomflwMagicRecordList20:setName("layBottomflwMagicRecordList20");
    obj.layBottomflwMagicRecordList20:setAlign("top");
    obj.layBottomflwMagicRecordList20:setHeight(36);

    obj.btnNovoflwMagicRecordList20 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList20:setParent(obj.layBottomflwMagicRecordList20);
    obj.btnNovoflwMagicRecordList20:setName("btnNovoflwMagicRecordList20");
    obj.btnNovoflwMagicRecordList20:setAlign("left");
    obj.btnNovoflwMagicRecordList20:setText("Novo");
    obj.btnNovoflwMagicRecordList20:setWidth(160);
    obj.btnNovoflwMagicRecordList20:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList20._recalcHeight();


    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Inventario");
    obj.tab7:setName("tab7");

    obj.frmInventario = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInventario:setParent(obj.tab7);
    obj.frmInventario:setName("frmInventario");
    obj.frmInventario:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmInventario);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.flowLayout37 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout37:setParent(obj.scrollBox7);
    obj.flowLayout37:setAlign("top");
    obj.flowLayout37:setAutoHeight(true);
    obj.flowLayout37:setMaxColumns(3);
    obj.flowLayout37:setHorzAlign("center");
    obj.flowLayout37:setOrientation("vertical");
    obj.flowLayout37:setAvoidScale(true);
    obj.flowLayout37:setName("flowLayout37");
    obj.flowLayout37:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout37:setVertAlign("leading");

    obj.campoDosItensPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosItensPart:setParent(obj.flowLayout37);
    obj.campoDosItensPart:setMinWidth(300);
    obj.campoDosItensPart:setMaxWidth(600);
    obj.campoDosItensPart:setHeight(25);
    obj.campoDosItensPart:setMinScaledWidth(280);
    obj.campoDosItensPart:setName("campoDosItensPart");
    obj.campoDosItensPart:setAdjustHeightToLine(false);
    obj.campoDosItensPart:setMargins({left=5});
    obj.campoDosItensPart:setVertAlign("leading");


					rawset(self.campoDosItensPart, "_recalcHeight", 					
						function ()
							self.campoDosItensPart.height = self.campoDosItens.height + 25;
						end);
				


    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.campoDosItensPart);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout22);
    obj.button8:setText("+");
    obj.button8:setAlign("left");
    obj.button8:setWidth(30);
    obj.button8:setName("button8");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout22);
    obj.label71:setText("ITENS");
    obj.label71:setAlign("left");
    obj.label71:setWidth(225);
    obj.label71:setMargins({left=5});
    obj.label71:setName("label71");
    obj.label71:setFontColor("white");

    obj.campoDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosItens:setParent(obj.campoDosItensPart);
    obj.campoDosItens:setName("campoDosItens");
    obj.campoDosItens:setField("campoDosItens");
    obj.campoDosItens:setTemplateForm("frmEquipamento");
    obj.campoDosItens:setAlign("top");
    obj.campoDosItens:setLayout("vertical");
    obj.campoDosItens:setAutoHeight(true);
    obj.campoDosItens:setHitTest(false);
    obj.campoDosItens:setMinQt(1);

    obj.campoDosCreditosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosCreditosPart:setParent(obj.flowLayout37);
    obj.campoDosCreditosPart:setMinWidth(300);
    obj.campoDosCreditosPart:setMaxWidth(600);
    obj.campoDosCreditosPart:setHeight(25);
    obj.campoDosCreditosPart:setMinScaledWidth(280);
    obj.campoDosCreditosPart:setName("campoDosCreditosPart");
    obj.campoDosCreditosPart:setAdjustHeightToLine(false);
    obj.campoDosCreditosPart:setMargins({left=5});
    obj.campoDosCreditosPart:setVertAlign("leading");


					rawset(self.campoDosCreditosPart, "_recalcHeight", 					
						function ()
							self.campoDosCreditosPart.height = self.campoDosCreditos.height + 25;
						end);
				


    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.campoDosCreditosPart);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout23);
    obj.button9:setText("+");
    obj.button9:setAlign("left");
    obj.button9:setWidth(30);
    obj.button9:setName("button9");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout23);
    obj.label72:setText("CREDITOS");
    obj.label72:setAlign("left");
    obj.label72:setWidth(225);
    obj.label72:setMargins({left=5});
    obj.label72:setName("label72");
    obj.label72:setFontColor("white");

    obj.campoDosCreditos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosCreditos:setParent(obj.campoDosCreditosPart);
    obj.campoDosCreditos:setName("campoDosCreditos");
    obj.campoDosCreditos:setField("campoDosCreditos");
    obj.campoDosCreditos:setTemplateForm("frmItem");
    obj.campoDosCreditos:setAlign("top");
    obj.campoDosCreditos:setLayout("vertical");
    obj.campoDosCreditos:setAutoHeight(true);
    obj.campoDosCreditos:setHitTest(false);
    obj.campoDosCreditos:setMinQt(1);

    obj.CampoDosTesourosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.CampoDosTesourosPart:setParent(obj.flowLayout37);
    obj.CampoDosTesourosPart:setMinWidth(300);
    obj.CampoDosTesourosPart:setMaxWidth(600);
    obj.CampoDosTesourosPart:setHeight(25);
    obj.CampoDosTesourosPart:setMinScaledWidth(280);
    obj.CampoDosTesourosPart:setName("CampoDosTesourosPart");
    obj.CampoDosTesourosPart:setAdjustHeightToLine(false);
    obj.CampoDosTesourosPart:setMargins({left=5});
    obj.CampoDosTesourosPart:setVertAlign("leading");


					rawset(self.CampoDosTesourosPart, "_recalcHeight", 					
						function ()
							self.CampoDosTesourosPart.height = self.CampoDosTesouros.height + 25;
						end);
				


    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.CampoDosTesourosPart);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout24);
    obj.button10:setText("+");
    obj.button10:setAlign("left");
    obj.button10:setWidth(30);
    obj.button10:setName("button10");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout24);
    obj.label73:setText("GEMAS E TESOUROS");
    obj.label73:setAlign("left");
    obj.label73:setWidth(225);
    obj.label73:setMargins({left=5});
    obj.label73:setName("label73");
    obj.label73:setFontColor("white");

    obj.CampoDosTesouros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.CampoDosTesouros:setParent(obj.CampoDosTesourosPart);
    obj.CampoDosTesouros:setName("CampoDosTesouros");
    obj.CampoDosTesouros:setField("CampoDosTesouros");
    obj.CampoDosTesouros:setTemplateForm("frmItem");
    obj.CampoDosTesouros:setAlign("top");
    obj.CampoDosTesouros:setLayout("vertical");
    obj.CampoDosTesouros:setAutoHeight(true);
    obj.CampoDosTesouros:setHitTest(false);
    obj.CampoDosTesouros:setMinQt(1);

    obj.campoDosDepositosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosDepositosPart:setParent(obj.flowLayout37);
    obj.campoDosDepositosPart:setMinWidth(300);
    obj.campoDosDepositosPart:setMaxWidth(600);
    obj.campoDosDepositosPart:setHeight(25);
    obj.campoDosDepositosPart:setMinScaledWidth(280);
    obj.campoDosDepositosPart:setName("campoDosDepositosPart");
    obj.campoDosDepositosPart:setAdjustHeightToLine(false);
    obj.campoDosDepositosPart:setMargins({left=5});
    obj.campoDosDepositosPart:setVertAlign("leading");


					rawset(self.campoDosDepositosPart, "_recalcHeight", 					
						function ()
							self.campoDosDepositosPart.height = self.campoDosDepositos.height + 25;
						end);
				


    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.campoDosDepositosPart);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout25);
    obj.button11:setText("+");
    obj.button11:setAlign("left");
    obj.button11:setWidth(30);
    obj.button11:setName("button11");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout25);
    obj.label74:setText("DEPOSITOS");
    obj.label74:setAlign("left");
    obj.label74:setWidth(225);
    obj.label74:setMargins({left=5});
    obj.label74:setName("label74");
    obj.label74:setFontColor("white");

    obj.campoDosDepositos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosDepositos:setParent(obj.campoDosDepositosPart);
    obj.campoDosDepositos:setName("campoDosDepositos");
    obj.campoDosDepositos:setField("campoDosDepositos");
    obj.campoDosDepositos:setTemplateForm("frmItemDepositado");
    obj.campoDosDepositos:setAlign("top");
    obj.campoDosDepositos:setLayout("vertical");
    obj.campoDosDepositos:setAutoHeight(true);
    obj.campoDosDepositos:setHitTest(false);
    obj.campoDosDepositos:setMinQt(1);

    obj.campoDosItensArmazenadosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosItensArmazenadosPart:setParent(obj.flowLayout37);
    obj.campoDosItensArmazenadosPart:setMinWidth(300);
    obj.campoDosItensArmazenadosPart:setMaxWidth(600);
    obj.campoDosItensArmazenadosPart:setHeight(25);
    obj.campoDosItensArmazenadosPart:setMinScaledWidth(280);
    obj.campoDosItensArmazenadosPart:setName("campoDosItensArmazenadosPart");
    obj.campoDosItensArmazenadosPart:setAdjustHeightToLine(false);
    obj.campoDosItensArmazenadosPart:setMargins({left=5});
    obj.campoDosItensArmazenadosPart:setVertAlign("leading");


					rawset(self.campoDosItensArmazenadosPart, "_recalcHeight", 					
						function ()
							self.campoDosItensArmazenadosPart.height = self.campoDosItensArmazenados.height + 25;
						end);
				


    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.campoDosItensArmazenadosPart);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout26);
    obj.button12:setText("+");
    obj.button12:setAlign("left");
    obj.button12:setWidth(30);
    obj.button12:setName("button12");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout26);
    obj.label75:setText("ARMAZENAMENTO");
    obj.label75:setAlign("left");
    obj.label75:setWidth(225);
    obj.label75:setMargins({left=5});
    obj.label75:setName("label75");
    obj.label75:setFontColor("white");

    obj.campoDosItensArmazenados = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosItensArmazenados:setParent(obj.campoDosItensArmazenadosPart);
    obj.campoDosItensArmazenados:setName("campoDosItensArmazenados");
    obj.campoDosItensArmazenados:setField("campoDosItensArmazenados");
    obj.campoDosItensArmazenados:setTemplateForm("frmItemDepositado");
    obj.campoDosItensArmazenados:setAlign("top");
    obj.campoDosItensArmazenados:setLayout("vertical");
    obj.campoDosItensArmazenados:setAutoHeight(true);
    obj.campoDosItensArmazenados:setHitTest(false);
    obj.campoDosItensArmazenados:setMinQt(1);

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Descrição");
    obj.tab8:setName("tab8");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.tab8);
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#40000000");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.rectangle6);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.fraCaracteristicasLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraCaracteristicasLayout:setParent(obj.scrollBox8);
    obj.fraCaracteristicasLayout:setAlign("top");
    obj.fraCaracteristicasLayout:setHeight(500);
    obj.fraCaracteristicasLayout:setMargins({left=10, right=10, top=10});
    obj.fraCaracteristicasLayout:setAutoHeight(true);
    obj.fraCaracteristicasLayout:setHorzAlign("center");
    obj.fraCaracteristicasLayout:setLineSpacing(3);
    obj.fraCaracteristicasLayout:setName("fraCaracteristicasLayout");
    obj.fraCaracteristicasLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraCaracteristicasLayout:setMinScaledWidth(300);
    obj.fraCaracteristicasLayout:setVertAlign("leading");

    obj.flowLayout38 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout38:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout38:setAutoHeight(true);
    obj.flowLayout38:setMinScaledWidth(290);
    obj.flowLayout38:setHorzAlign("center");
    obj.flowLayout38:setName("flowLayout38");
    obj.flowLayout38:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout38:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout38:setVertAlign("leading");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout38);
    obj.flowPart49:setMinWidth(320);
    obj.flowPart49:setMaxWidth(1600);
    obj.flowPart49:setFrameStyle("frames/banner/heroGroup.xml");
    obj.flowPart49:setHeight(175);
    obj.flowPart49:setVertAlign("center");
    obj.flowPart49:setAvoidScale(true);
    obj.flowPart49:setName("flowPart49");
    obj.flowPart49:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart49:setMinScaledWidth(300);
    obj.flowPart49:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowPart49);
    obj.layout27:setAlign("client");
    obj.layout27:setName("layout27");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout27);
    obj.edit66:setField("nome");
    obj.edit66:setFontSize(17);
    obj.edit66:setAlign("client");
    obj.edit66:setName("edit66");
    obj.edit66:setFontColor("white");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setTransparent(true);

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout27);
    obj.label76:setAlign("bottom");
    obj.label76:setText("NOME DO PERSONAGEM");
    obj.label76:setAutoSize(true);
    obj.label76:setMargins({left=3});
    obj.label76:setName("label76");
    obj.label76:setFontSize(12);
    obj.label76:setFontColor("#D0D0D0");

    obj.fraUpperGridCaracteristicas = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridCaracteristicas:setParent(obj.flowLayout38);
    obj.fraUpperGridCaracteristicas:setMinWidth(320);
    obj.fraUpperGridCaracteristicas:setMaxWidth(1600);
    obj.fraUpperGridCaracteristicas:setName("fraUpperGridCaracteristicas");
    obj.fraUpperGridCaracteristicas:setAvoidScale(true);
    obj.fraUpperGridCaracteristicas:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridCaracteristicas:setAutoHeight(true);
    obj.fraUpperGridCaracteristicas:setVertAlign("trailing");
    obj.fraUpperGridCaracteristicas:setMaxControlsPerLine(3);
    obj.fraUpperGridCaracteristicas:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraUpperGridCaracteristicas:setMinScaledWidth(300);
    obj.fraUpperGridCaracteristicas:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo7:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo7:setHeight(50);
    obj.UpperGridCampo7:setMinScaledWidth(100);
    obj.UpperGridCampo7:setMinWidth(100);
    obj.UpperGridCampo7:setMaxWidth(233);
    obj.UpperGridCampo7:setMaxScaledWidth(233);
    obj.UpperGridCampo7:setAvoidScale(true);
    obj.UpperGridCampo7:setName("UpperGridCampo7");
    obj.UpperGridCampo7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo7:setVertAlign("leading");

    obj.edtUpperGridCampo7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.edtUpperGridCampo7:setName("edtUpperGridCampo7");
    obj.edtUpperGridCampo7:setAlign("top");
    obj.edtUpperGridCampo7:setField("caracteristicas.idade");
    obj.edtUpperGridCampo7:setFontSize(13);
    obj.edtUpperGridCampo7:setHeight(30);
    obj.edtUpperGridCampo7:setTransparent(true);
    obj.edtUpperGridCampo7:setVertTextAlign("trailing");
    obj.edtUpperGridCampo7:setWidth(195);
    obj.edtUpperGridCampo7:setFontColor("white");

    obj.linUpperGridCampo7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.linUpperGridCampo7:setName("linUpperGridCampo7");
    obj.linUpperGridCampo7:setAlign("top");
    obj.linUpperGridCampo7:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo7:setStrokeSize(1);

    obj.labUpperGridCampo7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.labUpperGridCampo7:setName("labUpperGridCampo7");
    obj.labUpperGridCampo7:setAlign("top");
    obj.labUpperGridCampo7:setText("IDADE");
    obj.labUpperGridCampo7:setVertTextAlign("leading");
    obj.labUpperGridCampo7:setWordWrap(true);
    obj.labUpperGridCampo7:setTextTrimming("none");
    obj.labUpperGridCampo7:setFontSize(12);
    obj.labUpperGridCampo7:setFontColor("#D0D0D0");

    self.UpperGridCampo7:setHeight(self.edtUpperGridCampo7:getHeight() + self.labUpperGridCampo7:getHeight() + self.linUpperGridCampo7:getHeight());


    obj.UpperGridCampo8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo8:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo8:setHeight(50);
    obj.UpperGridCampo8:setMinScaledWidth(100);
    obj.UpperGridCampo8:setMinWidth(100);
    obj.UpperGridCampo8:setMaxWidth(233);
    obj.UpperGridCampo8:setMaxScaledWidth(233);
    obj.UpperGridCampo8:setAvoidScale(true);
    obj.UpperGridCampo8:setName("UpperGridCampo8");
    obj.UpperGridCampo8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo8:setVertAlign("leading");

    obj.edtUpperGridCampo8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.edtUpperGridCampo8:setName("edtUpperGridCampo8");
    obj.edtUpperGridCampo8:setAlign("top");
    obj.edtUpperGridCampo8:setField("caracteristicas.altura");
    obj.edtUpperGridCampo8:setFontSize(13);
    obj.edtUpperGridCampo8:setHeight(30);
    obj.edtUpperGridCampo8:setTransparent(true);
    obj.edtUpperGridCampo8:setVertTextAlign("trailing");
    obj.edtUpperGridCampo8:setWidth(195);
    obj.edtUpperGridCampo8:setFontColor("white");

    obj.linUpperGridCampo8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.linUpperGridCampo8:setName("linUpperGridCampo8");
    obj.linUpperGridCampo8:setAlign("top");
    obj.linUpperGridCampo8:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo8:setStrokeSize(1);

    obj.labUpperGridCampo8 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.labUpperGridCampo8:setName("labUpperGridCampo8");
    obj.labUpperGridCampo8:setAlign("top");
    obj.labUpperGridCampo8:setText("ALTURA");
    obj.labUpperGridCampo8:setVertTextAlign("leading");
    obj.labUpperGridCampo8:setWordWrap(true);
    obj.labUpperGridCampo8:setTextTrimming("none");
    obj.labUpperGridCampo8:setFontSize(12);
    obj.labUpperGridCampo8:setFontColor("#D0D0D0");

    self.UpperGridCampo8:setHeight(self.edtUpperGridCampo8:getHeight() + self.labUpperGridCampo8:getHeight() + self.linUpperGridCampo8:getHeight());


    obj.UpperGridCampo9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo9:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo9:setHeight(50);
    obj.UpperGridCampo9:setMinScaledWidth(100);
    obj.UpperGridCampo9:setMinWidth(100);
    obj.UpperGridCampo9:setMaxWidth(233);
    obj.UpperGridCampo9:setMaxScaledWidth(233);
    obj.UpperGridCampo9:setAvoidScale(true);
    obj.UpperGridCampo9:setName("UpperGridCampo9");
    obj.UpperGridCampo9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo9:setVertAlign("leading");

    obj.edtUpperGridCampo9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.edtUpperGridCampo9:setName("edtUpperGridCampo9");
    obj.edtUpperGridCampo9:setAlign("top");
    obj.edtUpperGridCampo9:setField("caracteristicas.peso");
    obj.edtUpperGridCampo9:setFontSize(13);
    obj.edtUpperGridCampo9:setHeight(30);
    obj.edtUpperGridCampo9:setTransparent(true);
    obj.edtUpperGridCampo9:setVertTextAlign("trailing");
    obj.edtUpperGridCampo9:setWidth(195);
    obj.edtUpperGridCampo9:setFontColor("white");

    obj.linUpperGridCampo9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.linUpperGridCampo9:setName("linUpperGridCampo9");
    obj.linUpperGridCampo9:setAlign("top");
    obj.linUpperGridCampo9:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo9:setStrokeSize(1);

    obj.labUpperGridCampo9 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.labUpperGridCampo9:setName("labUpperGridCampo9");
    obj.labUpperGridCampo9:setAlign("top");
    obj.labUpperGridCampo9:setText("PESO");
    obj.labUpperGridCampo9:setVertTextAlign("leading");
    obj.labUpperGridCampo9:setWordWrap(true);
    obj.labUpperGridCampo9:setTextTrimming("none");
    obj.labUpperGridCampo9:setFontSize(12);
    obj.labUpperGridCampo9:setFontColor("#D0D0D0");

    self.UpperGridCampo9:setHeight(self.edtUpperGridCampo9:getHeight() + self.labUpperGridCampo9:getHeight() + self.linUpperGridCampo9:getHeight());


    obj.UpperGridCampo10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo10:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo10:setHeight(50);
    obj.UpperGridCampo10:setMinScaledWidth(100);
    obj.UpperGridCampo10:setMinWidth(100);
    obj.UpperGridCampo10:setMaxWidth(233);
    obj.UpperGridCampo10:setMaxScaledWidth(233);
    obj.UpperGridCampo10:setAvoidScale(true);
    obj.UpperGridCampo10:setName("UpperGridCampo10");
    obj.UpperGridCampo10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo10:setVertAlign("leading");

    obj.edtUpperGridCampo10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.edtUpperGridCampo10:setName("edtUpperGridCampo10");
    obj.edtUpperGridCampo10:setAlign("top");
    obj.edtUpperGridCampo10:setField("caracteristicas.olhos");
    obj.edtUpperGridCampo10:setFontSize(13);
    obj.edtUpperGridCampo10:setHeight(30);
    obj.edtUpperGridCampo10:setTransparent(true);
    obj.edtUpperGridCampo10:setVertTextAlign("trailing");
    obj.edtUpperGridCampo10:setWidth(195);
    obj.edtUpperGridCampo10:setFontColor("white");

    obj.linUpperGridCampo10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.linUpperGridCampo10:setName("linUpperGridCampo10");
    obj.linUpperGridCampo10:setAlign("top");
    obj.linUpperGridCampo10:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo10:setStrokeSize(1);

    obj.labUpperGridCampo10 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.labUpperGridCampo10:setName("labUpperGridCampo10");
    obj.labUpperGridCampo10:setAlign("top");
    obj.labUpperGridCampo10:setText("OLHOS");
    obj.labUpperGridCampo10:setVertTextAlign("leading");
    obj.labUpperGridCampo10:setWordWrap(true);
    obj.labUpperGridCampo10:setTextTrimming("none");
    obj.labUpperGridCampo10:setFontSize(12);
    obj.labUpperGridCampo10:setFontColor("#D0D0D0");

    self.UpperGridCampo10:setHeight(self.edtUpperGridCampo10:getHeight() + self.labUpperGridCampo10:getHeight() + self.linUpperGridCampo10:getHeight());


    obj.UpperGridCampo11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo11:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo11:setHeight(50);
    obj.UpperGridCampo11:setMinScaledWidth(100);
    obj.UpperGridCampo11:setMinWidth(100);
    obj.UpperGridCampo11:setMaxWidth(233);
    obj.UpperGridCampo11:setMaxScaledWidth(233);
    obj.UpperGridCampo11:setAvoidScale(true);
    obj.UpperGridCampo11:setName("UpperGridCampo11");
    obj.UpperGridCampo11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo11:setVertAlign("leading");

    obj.edtUpperGridCampo11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.edtUpperGridCampo11:setName("edtUpperGridCampo11");
    obj.edtUpperGridCampo11:setAlign("top");
    obj.edtUpperGridCampo11:setField("caracteristicas.pele");
    obj.edtUpperGridCampo11:setFontSize(13);
    obj.edtUpperGridCampo11:setHeight(30);
    obj.edtUpperGridCampo11:setTransparent(true);
    obj.edtUpperGridCampo11:setVertTextAlign("trailing");
    obj.edtUpperGridCampo11:setWidth(195);
    obj.edtUpperGridCampo11:setFontColor("white");

    obj.linUpperGridCampo11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.linUpperGridCampo11:setName("linUpperGridCampo11");
    obj.linUpperGridCampo11:setAlign("top");
    obj.linUpperGridCampo11:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo11:setStrokeSize(1);

    obj.labUpperGridCampo11 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.labUpperGridCampo11:setName("labUpperGridCampo11");
    obj.labUpperGridCampo11:setAlign("top");
    obj.labUpperGridCampo11:setText("PELE");
    obj.labUpperGridCampo11:setVertTextAlign("leading");
    obj.labUpperGridCampo11:setWordWrap(true);
    obj.labUpperGridCampo11:setTextTrimming("none");
    obj.labUpperGridCampo11:setFontSize(12);
    obj.labUpperGridCampo11:setFontColor("#D0D0D0");

    self.UpperGridCampo11:setHeight(self.edtUpperGridCampo11:getHeight() + self.labUpperGridCampo11:getHeight() + self.linUpperGridCampo11:getHeight());


    obj.UpperGridCampo12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo12:setParent(obj.fraUpperGridCaracteristicas);
    obj.UpperGridCampo12:setHeight(50);
    obj.UpperGridCampo12:setMinScaledWidth(100);
    obj.UpperGridCampo12:setMinWidth(100);
    obj.UpperGridCampo12:setMaxWidth(233);
    obj.UpperGridCampo12:setMaxScaledWidth(233);
    obj.UpperGridCampo12:setAvoidScale(true);
    obj.UpperGridCampo12:setName("UpperGridCampo12");
    obj.UpperGridCampo12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.UpperGridCampo12:setVertAlign("leading");

    obj.edtUpperGridCampo12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.edtUpperGridCampo12:setName("edtUpperGridCampo12");
    obj.edtUpperGridCampo12:setAlign("top");
    obj.edtUpperGridCampo12:setField("caracteristicas.cabelo");
    obj.edtUpperGridCampo12:setFontSize(13);
    obj.edtUpperGridCampo12:setHeight(30);
    obj.edtUpperGridCampo12:setTransparent(true);
    obj.edtUpperGridCampo12:setVertTextAlign("trailing");
    obj.edtUpperGridCampo12:setWidth(195);
    obj.edtUpperGridCampo12:setFontColor("white");

    obj.linUpperGridCampo12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.linUpperGridCampo12:setName("linUpperGridCampo12");
    obj.linUpperGridCampo12:setAlign("top");
    obj.linUpperGridCampo12:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo12:setStrokeSize(1);

    obj.labUpperGridCampo12 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.labUpperGridCampo12:setName("labUpperGridCampo12");
    obj.labUpperGridCampo12:setAlign("top");
    obj.labUpperGridCampo12:setText("CABELO");
    obj.labUpperGridCampo12:setVertTextAlign("leading");
    obj.labUpperGridCampo12:setWordWrap(true);
    obj.labUpperGridCampo12:setTextTrimming("none");
    obj.labUpperGridCampo12:setFontSize(12);
    obj.labUpperGridCampo12:setFontColor("#D0D0D0");

    self.UpperGridCampo12:setHeight(self.edtUpperGridCampo12:getHeight() + self.labUpperGridCampo12:getHeight() + self.linUpperGridCampo12:getHeight());


    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.fraCaracteristicasLayout);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowLayout39 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout39:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout39:setAutoHeight(true);
    obj.flowLayout39:setMinScaledWidth(290);
    obj.flowLayout39:setHorzAlign("center");
    obj.flowLayout39:setLineSpacing(10);
    obj.flowLayout39:setName("flowLayout39");
    obj.flowLayout39:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout39:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout39:setVertAlign("leading");

    obj.flowLayout40 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout40:setParent(obj.flowLayout39);
    obj.flowLayout40:setMaxControlsPerLine(1);
    obj.flowLayout40:setAutoHeight(true);
    obj.flowLayout40:setLineSpacing(10);
    obj.flowLayout40:setMargins({left = 4, right = 4});
    obj.flowLayout40:setName("flowLayout40");
    obj.flowLayout40:setStepSizes({});
    obj.flowLayout40:setMinWidth(300);
    obj.flowLayout40:setMaxWidth(1600);
    obj.flowLayout40:setMinScaledWidth(300);
    obj.flowLayout40:setVertAlign("leading");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout40);
    obj.flowPart50:setHeight(390);
    obj.flowPart50:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart50:setMargins({left = 0, right = 4});
    obj.flowPart50:setName("flowPart50");
    obj.flowPart50:setStepSizes({});
    obj.flowPart50:setMinWidth(300);
    obj.flowPart50:setMaxWidth(1600);
    obj.flowPart50:setMinScaledWidth(300);
    obj.flowPart50:setVertAlign("leading");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowPart50);
    obj.image2:setAlign("client");
    obj.image2:setStyle("autoFit");
    obj.image2:setField("imagens.aparencia");
    obj.image2:setMargins({top=2});
    obj.image2:setEditable(true);
    obj.image2:setName("image2");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart50);
    obj.label77:setAlign("bottom");
    obj.label77:setAutoSize(true);
    obj.label77:setText("APARÊNCIA");
    obj.label77:setFontSize(12);
    obj.label77:setVertTextAlign("center");
    obj.label77:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setName("label77");
    obj.label77:setFontColor("white");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout40);
    obj.flowPart51:setHeight(115);
    obj.flowPart51:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart51:setMargins({left = 4, right = 0});
    obj.flowPart51:setName("flowPart51");
    obj.flowPart51:setStepSizes({});
    obj.flowPart51:setMinWidth(300);
    obj.flowPart51:setMaxWidth(1600);
    obj.flowPart51:setMinScaledWidth(300);
    obj.flowPart51:setVertAlign("leading");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.flowPart51);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("idiomas");
    obj.textEditor4:setMargins({top=2});
    obj.textEditor4:setFontSize(16);
    obj.textEditor4:setName("textEditor4");
    obj.textEditor4:setTransparent(true);

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.flowPart51);
    obj.label78:setAlign("bottom");
    obj.label78:setAutoSize(true);
    obj.label78:setText("IDIOMAS");
    obj.label78:setFontSize(12);
    obj.label78:setVertTextAlign("center");
    obj.label78:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setName("label78");
    obj.label78:setFontColor("white");

    obj.flowLayout41 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout41:setParent(obj.flowLayout39);
    obj.flowLayout41:setMaxControlsPerLine(1);
    obj.flowLayout41:setAutoHeight(true);
    obj.flowLayout41:setLineSpacing(10);
    obj.flowLayout41:setMargins({left=4, right=4});
    obj.flowLayout41:setName("flowLayout41");
    obj.flowLayout41:setStepSizes({});
    obj.flowLayout41:setMinWidth(300);
    obj.flowLayout41:setMaxWidth(1600);
    obj.flowLayout41:setMinScaledWidth(300);
    obj.flowLayout41:setVertAlign("leading");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout41);
    obj.flowPart52:setHeight(140);
    obj.flowPart52:setFrameStyle("frames/panel5/topPanel.xml");
    obj.flowPart52:setMargins({left = 4, right = 4});
    obj.flowPart52:setName("flowPart52");
    obj.flowPart52:setStepSizes({});
    obj.flowPart52:setMinWidth(300);
    obj.flowPart52:setMaxWidth(1600);
    obj.flowPart52:setMinScaledWidth(300);
    obj.flowPart52:setVertAlign("leading");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.flowPart52);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("caracteristicas.tracosPersonalidade");
    obj.textEditor5:setMargins({top=2});
    obj.textEditor5:setFontSize(16);
    obj.textEditor5:setName("textEditor5");
    obj.textEditor5:setTransparent(true);

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowPart52);
    obj.label79:setAlign("bottom");
    obj.label79:setAutoSize(true);
    obj.label79:setText("TRAÇOS DE PERSONALIDADE");
    obj.label79:setFontSize(12);
    obj.label79:setVertTextAlign("center");
    obj.label79:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setName("label79");
    obj.label79:setFontColor("white");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout41);
    obj.flowPart53:setHeight(115);
    obj.flowPart53:setFrameStyle("frames/panel5/centerPanel.xml");
    obj.flowPart53:setMargins({left = 4, right = 4});
    obj.flowPart53:setName("flowPart53");
    obj.flowPart53:setStepSizes({});
    obj.flowPart53:setMinWidth(300);
    obj.flowPart53:setMaxWidth(1600);
    obj.flowPart53:setMinScaledWidth(300);
    obj.flowPart53:setVertAlign("leading");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.flowPart53);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("caracteristicas.ideais");
    obj.textEditor6:setMargins({top=2});
    obj.textEditor6:setFontSize(16);
    obj.textEditor6:setName("textEditor6");
    obj.textEditor6:setTransparent(true);

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowPart53);
    obj.label80:setAlign("bottom");
    obj.label80:setAutoSize(true);
    obj.label80:setText("IDEAIS");
    obj.label80:setFontSize(12);
    obj.label80:setVertTextAlign("center");
    obj.label80:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setName("label80");
    obj.label80:setFontColor("white");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout41);
    obj.flowPart54:setHeight(115);
    obj.flowPart54:setFrameStyle("frames/panel5/centerPanel.xml");
    obj.flowPart54:setMargins({left = 4, right = 4});
    obj.flowPart54:setName("flowPart54");
    obj.flowPart54:setStepSizes({});
    obj.flowPart54:setMinWidth(300);
    obj.flowPart54:setMaxWidth(1600);
    obj.flowPart54:setMinScaledWidth(300);
    obj.flowPart54:setVertAlign("leading");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.flowPart54);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("caracteristicas.vinculos");
    obj.textEditor7:setMargins({top=2});
    obj.textEditor7:setFontSize(16);
    obj.textEditor7:setName("textEditor7");
    obj.textEditor7:setTransparent(true);

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart54);
    obj.label81:setAlign("bottom");
    obj.label81:setAutoSize(true);
    obj.label81:setText("VÍNCULOS");
    obj.label81:setFontSize(12);
    obj.label81:setVertTextAlign("center");
    obj.label81:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setName("label81");
    obj.label81:setFontColor("white");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout41);
    obj.flowPart55:setHeight(115);
    obj.flowPart55:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.flowPart55:setMargins({left = 4, right = 4});
    obj.flowPart55:setName("flowPart55");
    obj.flowPart55:setStepSizes({});
    obj.flowPart55:setMinWidth(300);
    obj.flowPart55:setMaxWidth(1600);
    obj.flowPart55:setMinScaledWidth(300);
    obj.flowPart55:setVertAlign("leading");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.flowPart55);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("caracteristicas.fraquezas");
    obj.textEditor8:setMargins({top=2});
    obj.textEditor8:setFontSize(16);
    obj.textEditor8:setName("textEditor8");
    obj.textEditor8:setTransparent(true);

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowPart55);
    obj.label82:setAlign("bottom");
    obj.label82:setAutoSize(true);
    obj.label82:setText("FRAQUEZAS");
    obj.label82:setFontSize(12);
    obj.label82:setVertTextAlign("center");
    obj.label82:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setName("label82");
    obj.label82:setFontColor("white");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout39);
    obj.flowPart56:setHeight(515);
    obj.flowPart56:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart56:setMargins({left = 4, right = 4});
    obj.flowPart56:setName("flowPart56");
    obj.flowPart56:setStepSizes({});
    obj.flowPart56:setMinWidth(300);
    obj.flowPart56:setMaxWidth(1600);
    obj.flowPart56:setMinScaledWidth(300);
    obj.flowPart56:setVertAlign("leading");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.flowPart56);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("caracteristicas.caracteristicasETracoes");
    obj.textEditor9:setMargins({top=2});
    obj.textEditor9:setFontSize(16);
    obj.textEditor9:setName("textEditor9");
    obj.textEditor9:setTransparent(true);

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart56);
    obj.label83:setAlign("bottom");
    obj.label83:setAutoSize(true);
    obj.label83:setText("CARACTERÍSTICAS E TRAÇOS");
    obj.label83:setFontSize(12);
    obj.label83:setVertTextAlign("center");
    obj.label83:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setName("label83");
    obj.label83:setFontColor("white");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.fraCaracteristicasLayout);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flowLayout42 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout42:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout42:setAutoHeight(true);
    obj.flowLayout42:setMinScaledWidth(290);
    obj.flowLayout42:setHorzAlign("center");
    obj.flowLayout42:setLineSpacing(10);
    obj.flowLayout42:setMargins({top=5});
    obj.flowLayout42:setName("flowLayout42");
    obj.flowLayout42:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout42:setVertAlign("leading");

    obj.fraAliadosOrganizacoes = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraAliadosOrganizacoes:setParent(obj.flowLayout42);
    obj.fraAliadosOrganizacoes:setName("fraAliadosOrganizacoes");
    obj.fraAliadosOrganizacoes:setAutoHeight(true);
    obj.fraAliadosOrganizacoes:setFrameStyle("frames/panel5/frame.xml");
    obj.fraAliadosOrganizacoes:setMargins({left = 4, right = 4});
    obj.fraAliadosOrganizacoes:setHorzAlign("center");
    obj.fraAliadosOrganizacoes:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraAliadosOrganizacoes:setMinScaledWidth(300);
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

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.prtAliados);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setField("aliados.aliadosEOrganizacoes");
    obj.textEditor10:setMargins({top=2, left=4, right=4});
    obj.textEditor10:setFontSize(16);
    obj.textEditor10:setName("textEditor10");
    obj.textEditor10:setTransparent(true);

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

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.prtFaccao);
    obj.label84:setAlign("top");
    obj.label84:setHorzTextAlign("leading");
    obj.label84:setText("FACÇÃO");
    obj.label84:setFontSize(11);
    obj.label84:setFontColor("gray");
    obj.label84:setMargins({left=4, right=4});
    obj.label84:setName("label84");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.prtFaccao);
    obj.edit67:setAlign("top");
    obj.edit67:setField("aliados.faccao.nome");
    obj.edit67:setMargins({left=4, right=4});
    obj.edit67:setName("edit67");
    obj.edit67:setFontSize(15);
    obj.edit67:setFontColor("white");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.prtFaccao);
    obj.image3:setAlign("client");
    obj.image3:setField("aliados.faccao.simbolo");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setMargins({left=4, right=4});
    obj.image3:setName("image3");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.prtFaccao);
    obj.label85:setAlign("bottom");
    obj.label85:setAutoSize(true);
    obj.label85:setText("SÍMBOLO DA FACÇÃO");
    obj.label85:setFontSize(12);
    obj.label85:setVertTextAlign("center");
    obj.label85:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setName("label85");
    obj.label85:setFontColor("white");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.fraAliadosOrganizacoes);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.fraAliadosOrganizacoes);
    obj.flowPart57:setMinWidth(200);
    obj.flowPart57:setMaxWidth(1800);
    obj.flowPart57:setHeight(16);
    obj.flowPart57:setName("flowPart57");
    obj.flowPart57:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart57:setVertAlign("leading");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowPart57);
    obj.label86:setAlign("client");
    obj.label86:setAutoSize(true);
    obj.label86:setText("ALIADOS E ORGANIZAÇÕES");
    obj.label86:setFontSize(12);
    obj.label86:setVertTextAlign("center");
    obj.label86:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setName("label86");
    obj.label86:setFontColor("white");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout42);
    obj.flowPart58:setHeight(515);
    obj.flowPart58:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart58:setMargins({left = 4, right = 4});
    obj.flowPart58:setAdjustHeightToLine(true);
    obj.flowPart58:setName("flowPart58");
    obj.flowPart58:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowPart58:setMinScaledWidth(300);
    obj.flowPart58:setVertAlign("leading");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.flowPart58);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("historia.texto");
    obj.textEditor11:setMargins({top=2});
    obj.textEditor11:setFontSize(16);
    obj.textEditor11:setName("textEditor11");
    obj.textEditor11:setTransparent(true);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart58);
    obj.label87:setAlign("bottom");
    obj.label87:setAutoSize(true);
    obj.label87:setText("HISTÓRIA DO PERSONAGEM");
    obj.label87:setFontSize(12);
    obj.label87:setVertTextAlign("center");
    obj.label87:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setName("label87");
    obj.label87:setFontColor("white");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Anotações");
    obj.tab9:setName("tab9");

    obj.frmFichaRPGmeister10_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab9);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");
    obj.frmFichaRPGmeister10_svg:setTheme("dark");

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmFichaRPGmeister10_svg);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox9);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(0);
    obj.layout28:setWidth(400);
    obj.layout28:setHeight(605);
    obj.layout28:setName("layout28");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout28);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout28);
    obj.label88:setLeft(0);
    obj.label88:setTop(0);
    obj.label88:setWidth(400);
    obj.label88:setHeight(20);
    obj.label88:setText("ANOTAÇÕES");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");
    obj.label88:setFontColor("white");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout28);
    obj.textEditor12:setLeft(10);
    obj.textEditor12:setTop(25);
    obj.textEditor12:setWidth(380);
    obj.textEditor12:setHeight(575);
    obj.textEditor12:setField("anotacoes1");
    obj.textEditor12:setName("textEditor12");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox9);
    obj.layout29:setLeft(405);
    obj.layout29:setTop(0);
    obj.layout29:setWidth(400);
    obj.layout29:setHeight(605);
    obj.layout29:setName("layout29");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout29);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout29);
    obj.label89:setLeft(0);
    obj.label89:setTop(0);
    obj.label89:setWidth(400);
    obj.label89:setHeight(20);
    obj.label89:setText("ANOTAÇÕES");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");
    obj.label89:setFontColor("white");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout29);
    obj.textEditor13:setLeft(10);
    obj.textEditor13:setTop(25);
    obj.textEditor13:setWidth(380);
    obj.textEditor13:setHeight(575);
    obj.textEditor13:setField("anotacoes2");
    obj.textEditor13:setName("textEditor13");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox9);
    obj.layout30:setLeft(810);
    obj.layout30:setTop(0);
    obj.layout30:setWidth(400);
    obj.layout30:setHeight(605);
    obj.layout30:setName("layout30");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout30);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout30);
    obj.label90:setLeft(0);
    obj.label90:setTop(0);
    obj.label90:setWidth(400);
    obj.label90:setHeight(20);
    obj.label90:setText("ANOTAÇÕES");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");
    obj.label90:setFontColor("white");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout30);
    obj.textEditor14:setLeft(10);
    obj.textEditor14:setTop(25);
    obj.textEditor14:setWidth(380);
    obj.textEditor14:setHeight(575);
    obj.textEditor14:setField("anotacoes3");
    obj.textEditor14:setName("textEditor14");

    obj.tab10 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab10:setParent(obj.tabControl1);
    obj.tab10:setTitle("Creditos");
    obj.tab10:setName("tab10");

    obj.frmFichaRPGmeister11_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab10);
    obj.frmFichaRPGmeister11_svg:setName("frmFichaRPGmeister11_svg");
    obj.frmFichaRPGmeister11_svg:setAlign("client");
    obj.frmFichaRPGmeister11_svg:setTheme("dark");

    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmFichaRPGmeister11_svg);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox10);
    obj.image4:setLeft(0);
    obj.image4:setTop(0);
    obj.image4:setWidth(600);
    obj.image4:setHeight(600);
    obj.image4:setSRC("images/RPGmeister.jpg");
    obj.image4:setStyle("stretch");
    obj.image4:setOptimize(true);
    obj.image4:setName("image4");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox10);
    obj.layout31:setLeft(620);
    obj.layout31:setTop(10);
    obj.layout31:setWidth(200);
    obj.layout31:setHeight(150);
    obj.layout31:setName("layout31");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout31);
    obj.rectangle10:setLeft(0);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(200);
    obj.rectangle10:setHeight(150);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(15);
    obj.rectangle10:setYradius(15);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout31);
    obj.label91:setLeft(0);
    obj.label91:setTop(10);
    obj.label91:setWidth(200);
    obj.label91:setHeight(20);
    obj.label91:setText("Programador: Vinny (Ambesek)");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");
    obj.label91:setFontColor("white");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout31);
    obj.label92:setLeft(0);
    obj.label92:setTop(35);
    obj.label92:setWidth(200);
    obj.label92:setHeight(20);
    obj.label92:setText("Base 5e: AlyssonRRPG ");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");
    obj.label92:setFontColor("white");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout31);
    obj.label93:setLeft(0);
    obj.label93:setTop(60);
    obj.label93:setWidth(200);
    obj.label93:setHeight(20);
    obj.label93:setText("Consultor: Nautilus");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");
    obj.label93:setFontColor("white");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout31);
    obj.label94:setLeft(0);
    obj.label94:setTop(95);
    obj.label94:setWidth(200);
    obj.label94:setHeight(20);
    obj.label94:setText("Ficha feita para a mesa: ");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");
    obj.label94:setFontColor("white");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout31);
    obj.label95:setLeft(0);
    obj.label95:setTop(120);
    obj.label95:setWidth(200);
    obj.label95:setHeight(20);
    obj.label95:setText("Star Wars 5e");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setFontSize(11);
    obj.label95:setName("label95");
    obj.label95:setFontColor("white");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.scrollBox10);
    obj.label96:setLeft(620);
    obj.label96:setTop(375);
    obj.label96:setWidth(200);
    obj.label96:setHeight(20);
    obj.label96:setText("SUA VERSÃO:");
    obj.label96:setField("versionInstalled");
    obj.label96:setName("label96");
    obj.label96:setFontColor("white");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.scrollBox10);
    obj.label97:setLeft(620);
    obj.label97:setTop(400);
    obj.label97:setWidth(200);
    obj.label97:setHeight(20);
    obj.label97:setText("VERSÃO ATUAL:");
    obj.label97:setField("versionDownloaded");
    obj.label97:setName("label97");
    obj.label97:setFontColor("white");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox10);
    obj.checkBox1:setLeft(620);
    obj.checkBox1:setTop(425);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox10);
    obj.button13:setLeft(620);
    obj.button13:setTop(475);
    obj.button13:setWidth(100);
    obj.button13:setText("Change Log");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox10);
    obj.button14:setLeft(730);
    obj.button14:setTop(475);
    obj.button14:setWidth(100);
    obj.button14:setText("Atualizar");
    obj.button14:setName("button14");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.scrollBox10);
    obj.label98:setLeft(620);
    obj.label98:setTop(525);
    obj.label98:setWidth(120);
    obj.label98:setHeight(20);
    obj.label98:setText("CONHEÇA AS MESAS:");
    obj.label98:setFontSize(11);
    obj.label98:setName("label98");
    obj.label98:setFontColor("white");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox10);
    obj.button15:setLeft(730);
    obj.button15:setTop(525);
    obj.button15:setWidth(100);
    obj.button15:setText("RPGmeister");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox10);
    obj.button16:setLeft(840);
    obj.button16:setTop(525);
    obj.button16:setWidth(100);
    obj.button16:setText("Star Wars 5e");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.scrollBox10);
    obj.button17:setLeft(730);
    obj.button17:setTop(550);
    obj.button17:setWidth(100);
    obj.button17:setHeight(20);
    obj.button17:setText("Exportar Ficha");
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.scrollBox10);
    obj.button18:setLeft(840);
    obj.button18:setTop(550);
    obj.button18:setWidth(100);
    obj.button18:setHeight(20);
    obj.button18:setText("Importar Ficha");
    obj.button18:setName("button18");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Star%20Wars%205e/output/Ficha%20Star%20Wars%205e.rpk?raw=true",
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
                                            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Star%20Wars%205e/output/Ficha%20Star%20Wars%205e.rpk?raw=true');
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

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event5 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event6 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event7 = obj.button1:addEventListener("onClick",
        function (_)
            self.campoDosAtaques:append();
        end, obj);

    obj._e_event8 = obj.campoDosAtaques:addEventListener("onResize",
        function (_)
            self.campoDosAtaquesPart._recalcHeight();
        end, obj);

    obj._e_event9 = obj.campoDosAtaques:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event10 = obj.button2:addEventListener("onClick",
        function (_)
            self.campoDosPoderesDeAtaque:append();
        end, obj);

    obj._e_event11 = obj.campoDosPoderesDeAtaque:addEventListener("onResize",
        function (_)
            self.campoDosPoderesDeAtaquePart._recalcHeight();
        end, obj);

    obj._e_event12 = obj.campoDosPoderesDeAtaque:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event13 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclListaDasProficiencias:append();
        end, obj);

    obj._e_event14 = obj.rclListaDasProficiencias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.atr) or 0) - (tonumber(nodeB.atr) or 0));
        end, obj);

    obj._e_event15 = obj.rclListaDasProficiencias:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            						local nodes = NDB.getChildNodes(sheet.campoDasProficiencias);               
            						if #nodes > 0 then return end;
            
            						local prof = {};
            						prof[1] = {losango=true,atr=1,nome="TR de Força"};
            						prof[2] = {losango=true,atr=2,nome="TR de Destreza"};
            						prof[3] = {losango=true,atr=3,nome="TR de Constitução"};
            						prof[4] = {losango=true,atr=4,nome="TR de Inteligência"};
            						prof[5] = {losango=true,atr=5,nome="TR de Sabedoria"};
            						prof[6] = {losango=true,atr=6,nome="TR de Carisma"};
            						prof[7] = {losango=false,atr=1,nome="Atletismo"};
            						prof[8] = {losango=false,atr=2,nome="Acrobacia"};
            						prof[9] = {losango=false,atr=2,nome="Furtividade"};
            						prof[10] = {losango=false,atr=2,nome="Prestidigitação"};
            						prof[11] = {losango=false,atr=4,nome="Tecnologia"};
            						prof[12] = {losango=false,atr=4,nome="História"};
            						prof[13] = {losango=false,atr=4,nome="Investigação"};
            						prof[14] = {losango=false,atr=4,nome="Natureza"};
            						prof[15] = {losango=false,atr=4,nome="Pilotar"};
            						prof[16] = {losango=false,atr=5,nome="Adestrar Animais"};
            						prof[17] = {losango=false,atr=5,nome="Intuição"};
            						prof[18] = {losango=false,atr=5,nome="Medicina"};
            						prof[19] = {losango=false,atr=5,nome="Percepção"};
            						prof[20] = {losango=false,atr=5,nome="Sobrevivência"};
            						prof[21] = {losango=false,atr=6,nome="Atuação"};
            						prof[22] = {losango=false,atr=6,nome="Enganação"};
            						prof[23] = {losango=false,atr=6,nome="Intimidação"};
            						prof[24] = {losango=false,atr=6,nome="Persuasão"};
            
            						for i=1, #prof, 1 do
            							local item = self.rclListaDasProficiencias:append();
            							item.losango = prof[i].losango;
            							item.atr = prof[i].atr;
            							item.nome = prof[i].nome;
            						end;
        end, obj);

    obj._e_event16 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            						local nodes = ndb.getChildNodes(sheet.campoDasProficiencias); 
            
            						for i=1, #nodes, 1 do
            							local bonus = 0;
            							if nodes[i].x1 then
            								bonus = tonumber(sheet.bonusProficiencia) or 0;
            							elseif nodes[i].x2 then
            								bonus = (tonumber(sheet.bonusProficiencia) or 0) * 2;
            							end;
            
            							local atr = {"forca","destreza","constituicao","inteligencia","sabedoria","carisma", ""};
            							local atrNum = tonumber(nodes[i].atr) or 7;
            							local atribute = atr[atrNum] or "";
            							mod = tonumber(sheet.atributos["mod" .. atribute]) or 0;
            
            							nodes[i].total = bonus + mod;
            						end;
        end, obj);

    obj._e_event17 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local rcl = self:findControlByName("rclListaDosTalentos");
            						if rcl~= nil then
            							rcl:sort();
            						end;
            						local rcl = self:findControlByName("rclListaDasProezas");
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

    obj._e_event18 = obj.BarPopup:addEventListener("onClose",
        function (_, canceled)
            setTimeout( function()
            				if (self.BarPopup.scopeNode.ModificadorBarrinha == "igual") then
            					self.BarPopup.scopeNode.ValorTempAtualBarrinha = tonumber(self.BarPopup.scopeNode.ValorMudadoAtualBarrinha or 0);
            				elseif (self.BarPopup.scopeNode.ModificadorBarrinha == "mais") then
            					self.BarPopup.scopeNode.ValorTempAtualBarrinha = tonumber(self.BarPopup.scopeNode.ValorTempAtualBarrinha or 0) + tonumber(self.BarPopup.scopeNode.ValorMudadoAtualBarrinha or 0);
            				elseif (self.BarPopup.scopeNode.ModificadorBarrinha == "menos") then
            					self.BarPopup.scopeNode.ValorTempAtualBarrinha = tonumber(self.BarPopup.scopeNode.ValorTempAtualBarrinha or 0) - tonumber(self.BarPopup.scopeNode.ValorMudadoAtualBarrinha or 0);
            				end;
            				
            				if (self.BarPopup.scopeNode.ModificadorBarrinhaMax == "igual") then
            					self.BarPopup.scopeNode.ValorTempMaxBarrinha = tonumber(self.BarPopup.scopeNode.ValorMudadoMaxBarrinha or 0);
            				elseif (self.BarPopup.scopeNode.ModificadorBarrinhaMax == "mais") then
            					self.BarPopup.scopeNode.ValorTempMaxBarrinha = tonumber(self.BarPopup.scopeNode.ValorTempMaxBarrinha or 0) + tonumber(self.BarPopup.scopeNode.ValorMudadoMaxBarrinha or 0);
            				elseif (self.BarPopup.scopeNode.ModificadorBarrinhaMax == "menos") then
            					self.BarPopup.scopeNode.ValorTempMaxBarrinha = tonumber(self.BarPopup.scopeNode.ValorTempMaxBarrinha or 0) - tonumber(self.BarPopup.scopeNode.ValorMudadoMaxBarrinha or 0);
            				end;
            				
            				local barrinhapc = 0
            				local barrinhapcmax = 0
            				local porcentagem = 0
            				local porcentagemmax = 0
            
            				barrinhapc = (self.BarPopup.scopeNode.ValorTempAtualBarrinha - (self.BarPopup.scopeNode.BarrinhaValor or 0));
            				barrinhapcmax = (self.BarPopup.scopeNode.ValorTempMaxBarrinha - (self.BarPopup.scopeNode.BarrinhaValorMax or 0));
            				self.BarPopup.scopeNode.BarrinhaValor = self.BarPopup.scopeNode.ValorTempAtualBarrinha;
            				self.BarPopup.scopeNode.BarrinhaValorMax = self.BarPopup.scopeNode.ValorTempMaxBarrinha;
            				
            				if ((barrinhapc ~= 0) or (barrinhapcmax ~= 0)) then
            					local nome = self.BarPopup.scopeNode.AtributoBarrinha or "Equipamento";
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
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then
            						   mesaDoPersonagem.activeChat:enviarMensagem(text);
            					end;
            				end;
            			end, 100);
        end, obj);

    obj._e_event19 = obj.currentBarValue:addEventListener("onKeyDown",
        function (_, event)
            local oenter = (event.keyCode == 13)
            								if oenter then
            									self.BarPopup:close();
            								end;
        end, obj);

    obj._e_event20 = obj.maxBarValue:addEventListener("onKeyDown",
        function (_, event)
            local oenter = (event.keyCode == 13);
            								if oenter then
            									self.BarPopup:close();
            								end;
        end, obj);

    obj._e_event21 = obj.button4:addEventListener("onClick",
        function (_)
            self.campoDosTalentos:append();
        end, obj);

    obj._e_event22 = obj.campoDosTalentos:addEventListener("onResize",
        function (_)
            self.campoDosTalentosPart._recalcHeight();
        end, obj);

    obj._e_event23 = obj.campoDosTalentos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event24 = obj.button5:addEventListener("onClick",
        function (_)
            self.campoDosOutros:append();
        end, obj);

    obj._e_event25 = obj.campoDosOutros:addEventListener("onResize",
        function (_)
            self.campoDosOutrosPart._recalcHeight();
        end, obj);

    obj._e_event26 = obj.campoDosOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event27 = obj.button6:addEventListener("onClick",
        function (_)
            self.campoDasRacas:append();
        end, obj);

    obj._e_event28 = obj.campoDasRacas:addEventListener("onResize",
        function (_)
            self.campoDasRacasPart._recalcHeight();
        end, obj);

    obj._e_event29 = obj.campoDasRacas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event30 = obj.button7:addEventListener("onClick",
        function (_)
            self.campoDasCaracteristicasClasse:append();
        end, obj);

    obj._e_event31 = obj.campoDasCaracteristicasClasse:addEventListener("onResize",
        function (_)
            self.campoDasCaracteristicasClassePart._recalcHeight();
        end, obj);

    obj._e_event32 = obj.campoDasCaracteristicasClasse:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event33 = obj.labupperGridMagicEditBox1:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox1._RecalcSize();
        end, obj);

    obj._e_event34 = obj.labupperGridMagicEditBox2:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox2._RecalcSize();
        end, obj);

    obj._e_event35 = obj.labupperGridMagicEditBox3:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox3._RecalcSize();
        end, obj);

    obj._e_event36 = obj.labupperGridMagicEditBox4:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox4._RecalcSize();
        end, obj);

    obj._e_event37 = obj.labupperGridMagicEditBox5:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox5._RecalcSize();
        end, obj);

    obj._e_event38 = obj.labupperGridMagicEditBox6:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox6._RecalcSize();
        end, obj);

    obj._e_event39 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event40 = obj.rclflwMagicRecordList1:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList1._recalcHeight();
        end, obj);

    obj._e_event41 = obj.btnNovoflwMagicRecordList1:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList1:append();
        end, obj);

    obj._e_event42 = obj.rclflwMagicRecordList2:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList2._recalcHeight();
        end, obj);

    obj._e_event43 = obj.btnNovoflwMagicRecordList2:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList2:append();
        end, obj);

    obj._e_event44 = obj.rclflwMagicRecordList3:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList3._recalcHeight();
        end, obj);

    obj._e_event45 = obj.btnNovoflwMagicRecordList3:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList3:append();
        end, obj);

    obj._e_event46 = obj.rclflwMagicRecordList4:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList4._recalcHeight();
        end, obj);

    obj._e_event47 = obj.btnNovoflwMagicRecordList4:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList4:append();
        end, obj);

    obj._e_event48 = obj.rclflwMagicRecordList5:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList5._recalcHeight();
        end, obj);

    obj._e_event49 = obj.btnNovoflwMagicRecordList5:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList5:append();
        end, obj);

    obj._e_event50 = obj.rclflwMagicRecordList6:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList6._recalcHeight();
        end, obj);

    obj._e_event51 = obj.btnNovoflwMagicRecordList6:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList6:append();
        end, obj);

    obj._e_event52 = obj.rclflwMagicRecordList7:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList7._recalcHeight();
        end, obj);

    obj._e_event53 = obj.btnNovoflwMagicRecordList7:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList7:append();
        end, obj);

    obj._e_event54 = obj.rclflwMagicRecordList8:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList8._recalcHeight();
        end, obj);

    obj._e_event55 = obj.btnNovoflwMagicRecordList8:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList8:append();
        end, obj);

    obj._e_event56 = obj.rclflwMagicRecordList9:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList9._recalcHeight();
        end, obj);

    obj._e_event57 = obj.btnNovoflwMagicRecordList9:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList9:append();
        end, obj);

    obj._e_event58 = obj.rclflwMagicRecordList10:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList10._recalcHeight();
        end, obj);

    obj._e_event59 = obj.btnNovoflwMagicRecordList10:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList10:append();
        end, obj);

    obj._e_event60 = obj.labupperGridMagicEditBox7:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox7._RecalcSize();
        end, obj);

    obj._e_event61 = obj.labupperGridMagicEditBox8:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox8._RecalcSize();
        end, obj);

    obj._e_event62 = obj.labupperGridMagicEditBox9:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox9._RecalcSize();
        end, obj);

    obj._e_event63 = obj.labupperGridMagicEditBox10:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox10._RecalcSize();
        end, obj);

    obj._e_event64 = obj.labupperGridMagicEditBox11:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox11._RecalcSize();
        end, obj);

    obj._e_event65 = obj.labupperGridMagicEditBox12:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox12._RecalcSize();
        end, obj);

    obj._e_event66 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event67 = obj.rclflwMagicRecordList11:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList11._recalcHeight();
        end, obj);

    obj._e_event68 = obj.btnNovoflwMagicRecordList11:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList11:append();
        end, obj);

    obj._e_event69 = obj.rclflwMagicRecordList12:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList12._recalcHeight();
        end, obj);

    obj._e_event70 = obj.btnNovoflwMagicRecordList12:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList12:append();
        end, obj);

    obj._e_event71 = obj.rclflwMagicRecordList13:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList13._recalcHeight();
        end, obj);

    obj._e_event72 = obj.btnNovoflwMagicRecordList13:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList13:append();
        end, obj);

    obj._e_event73 = obj.rclflwMagicRecordList14:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList14._recalcHeight();
        end, obj);

    obj._e_event74 = obj.btnNovoflwMagicRecordList14:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList14:append();
        end, obj);

    obj._e_event75 = obj.rclflwMagicRecordList15:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList15._recalcHeight();
        end, obj);

    obj._e_event76 = obj.btnNovoflwMagicRecordList15:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList15:append();
        end, obj);

    obj._e_event77 = obj.rclflwMagicRecordList16:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList16._recalcHeight();
        end, obj);

    obj._e_event78 = obj.btnNovoflwMagicRecordList16:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList16:append();
        end, obj);

    obj._e_event79 = obj.rclflwMagicRecordList17:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList17._recalcHeight();
        end, obj);

    obj._e_event80 = obj.btnNovoflwMagicRecordList17:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList17:append();
        end, obj);

    obj._e_event81 = obj.rclflwMagicRecordList18:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList18._recalcHeight();
        end, obj);

    obj._e_event82 = obj.btnNovoflwMagicRecordList18:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList18:append();
        end, obj);

    obj._e_event83 = obj.rclflwMagicRecordList19:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList19._recalcHeight();
        end, obj);

    obj._e_event84 = obj.btnNovoflwMagicRecordList19:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList19:append();
        end, obj);

    obj._e_event85 = obj.rclflwMagicRecordList20:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList20._recalcHeight();
        end, obj);

    obj._e_event86 = obj.btnNovoflwMagicRecordList20:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList20:append();
        end, obj);

    obj._e_event87 = obj.button8:addEventListener("onClick",
        function (_)
            self.campoDosItens:append();
        end, obj);

    obj._e_event88 = obj.campoDosItens:addEventListener("onResize",
        function (_)
            self.campoDosItensPart._recalcHeight();
        end, obj);

    obj._e_event89 = obj.campoDosItens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event90 = obj.button9:addEventListener("onClick",
        function (_)
            self.campoDosCreditos:append();
        end, obj);

    obj._e_event91 = obj.campoDosCreditos:addEventListener("onResize",
        function (_)
            self.campoDosCreditosPart._recalcHeight();
        end, obj);

    obj._e_event92 = obj.campoDosCreditos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event93 = obj.button10:addEventListener("onClick",
        function (_)
            self.CampoDosTesouros:append();
        end, obj);

    obj._e_event94 = obj.CampoDosTesouros:addEventListener("onResize",
        function (_)
            self.CampoDosTesourosPart._recalcHeight();
        end, obj);

    obj._e_event95 = obj.CampoDosTesouros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event96 = obj.button11:addEventListener("onClick",
        function (_)
            self.campoDosDepositos:append();
        end, obj);

    obj._e_event97 = obj.campoDosDepositos:addEventListener("onResize",
        function (_)
            self.campoDosDepositosPart._recalcHeight();
        end, obj);

    obj._e_event98 = obj.campoDosDepositos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event99 = obj.button12:addEventListener("onClick",
        function (_)
            self.campoDosItensArmazenados:append();
        end, obj);

    obj._e_event100 = obj.campoDosItensArmazenados:addEventListener("onResize",
        function (_)
            self.campoDosItensArmazenadosPart._recalcHeight();
        end, obj);

    obj._e_event101 = obj.campoDosItensArmazenados:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event102 = obj.fraAliadosOrganizacoes:addEventListener("onBeforeLayoutCalc",
        function (_)
            if self.fraAliadosOrganizacoes:getWidth() <= 500 then
            									self.prtAliados:setHeight(200);
            									self.prtFaccao:setHeight(200);									
            								else
            									self.prtAliados:setHeight(420);
            									self.prtFaccao:setHeight(350);
            								end;
        end, obj);

    obj._e_event103 = obj.button13:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Star%20Wars%205e/README.md')
        end, obj);

    obj._e_event104 = obj.button14:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Star%20Wars%205e/output/Ficha%20Star%20Wars%205e.rpk?raw=true')
        end, obj);

    obj._e_event105 = obj.button15:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event106 = obj.button16:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=175625');
        end, obj);

    obj._e_event107 = obj.button17:addEventListener("onClick",
        function (_)
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

    obj._e_event108 = obj.button18:addEventListener("onClick",
        function (_)
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

        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.campoDasCaracteristicasClassePart ~= nil then self.campoDasCaracteristicasClassePart:destroy(); self.campoDasCaracteristicasClassePart = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.edtupperGridMagicEditBox2 ~= nil then self.edtupperGridMagicEditBox2:destroy(); self.edtupperGridMagicEditBox2 = nil; end;
        if self.rclflwMagicRecordList7 ~= nil then self.rclflwMagicRecordList7:destroy(); self.rclflwMagicRecordList7 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.rclflwMagicRecordList20 ~= nil then self.rclflwMagicRecordList20:destroy(); self.rclflwMagicRecordList20 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.campoDosTalentos ~= nil then self.campoDosTalentos:destroy(); self.campoDosTalentos = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.upperGridMagicEditBox2 ~= nil then self.upperGridMagicEditBox2:destroy(); self.upperGridMagicEditBox2 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.flwMagicRecordList6 ~= nil then self.flwMagicRecordList6:destroy(); self.flwMagicRecordList6 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.btnNovoflwMagicRecordList14 ~= nil then self.btnNovoflwMagicRecordList14:destroy(); self.btnNovoflwMagicRecordList14 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.upperGridMagicEditBox9 ~= nil then self.upperGridMagicEditBox9:destroy(); self.upperGridMagicEditBox9 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.flwMagicRecordList5 ~= nil then self.flwMagicRecordList5:destroy(); self.flwMagicRecordList5 = nil; end;
        if self.flwMagicRecordList15 ~= nil then self.flwMagicRecordList15:destroy(); self.flwMagicRecordList15 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.prtAliados ~= nil then self.prtAliados:destroy(); self.prtAliados = nil; end;
        if self.labupperGridMagicEditBox5 ~= nil then self.labupperGridMagicEditBox5:destroy(); self.labupperGridMagicEditBox5 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.linUpperGridCampo7 ~= nil then self.linUpperGridCampo7:destroy(); self.linUpperGridCampo7 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.btnNovoflwMagicRecordList10 ~= nil then self.btnNovoflwMagicRecordList10:destroy(); self.btnNovoflwMagicRecordList10 = nil; end;
        if self.labUpperGridCampo11 ~= nil then self.labUpperGridCampo11:destroy(); self.labUpperGridCampo11 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.fraCaracteristicasLayout ~= nil then self.fraCaracteristicasLayout:destroy(); self.fraCaracteristicasLayout = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.layBottomflwMagicRecordList18 ~= nil then self.layBottomflwMagicRecordList18:destroy(); self.layBottomflwMagicRecordList18 = nil; end;
        if self.edtupperGridMagicEditBox8 ~= nil then self.edtupperGridMagicEditBox8:destroy(); self.edtupperGridMagicEditBox8 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.flwMagicRecordList2 ~= nil then self.flwMagicRecordList2:destroy(); self.flwMagicRecordList2 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.btnNovoflwMagicRecordList9 ~= nil then self.btnNovoflwMagicRecordList9:destroy(); self.btnNovoflwMagicRecordList9 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.fraUpperGridFrente ~= nil then self.fraUpperGridFrente:destroy(); self.fraUpperGridFrente = nil; end;
        if self.frmAtaques ~= nil then self.frmAtaques:destroy(); self.frmAtaques = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.campoDosAtaquesPart ~= nil then self.campoDosAtaquesPart:destroy(); self.campoDosAtaquesPart = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.fraUpperGridCaracteristicas ~= nil then self.fraUpperGridCaracteristicas:destroy(); self.fraUpperGridCaracteristicas = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flwMagicRecordList17 ~= nil then self.flwMagicRecordList17:destroy(); self.flwMagicRecordList17 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.btnNovoflwMagicRecordList3 ~= nil then self.btnNovoflwMagicRecordList3:destroy(); self.btnNovoflwMagicRecordList3 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.currentBarValue ~= nil then self.currentBarValue:destroy(); self.currentBarValue = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.btnNovoflwMagicRecordList6 ~= nil then self.btnNovoflwMagicRecordList6:destroy(); self.btnNovoflwMagicRecordList6 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.btnNovoflwMagicRecordList19 ~= nil then self.btnNovoflwMagicRecordList19:destroy(); self.btnNovoflwMagicRecordList19 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.btnNovoflwMagicRecordList11 ~= nil then self.btnNovoflwMagicRecordList11:destroy(); self.btnNovoflwMagicRecordList11 = nil; end;
        if self.tab10 ~= nil then self.tab10:destroy(); self.tab10 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edtupperGridMagicEditBox7 ~= nil then self.edtupperGridMagicEditBox7:destroy(); self.edtupperGridMagicEditBox7 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.btnNovoflwMagicRecordList17 ~= nil then self.btnNovoflwMagicRecordList17:destroy(); self.btnNovoflwMagicRecordList17 = nil; end;
        if self.flwMagicRecordList20 ~= nil then self.flwMagicRecordList20:destroy(); self.flwMagicRecordList20 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.edtupperGridMagicEditBox4 ~= nil then self.edtupperGridMagicEditBox4:destroy(); self.edtupperGridMagicEditBox4 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.labUpperGridCampo10 ~= nil then self.labUpperGridCampo10:destroy(); self.labUpperGridCampo10 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.frmInventario ~= nil then self.frmInventario:destroy(); self.frmInventario = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.upperGridMagicEditBox10 ~= nil then self.upperGridMagicEditBox10:destroy(); self.upperGridMagicEditBox10 = nil; end;
        if self.flwMagicRecordList4 ~= nil then self.flwMagicRecordList4:destroy(); self.flwMagicRecordList4 = nil; end;
        if self.PopupBarColor ~= nil then self.PopupBarColor:destroy(); self.PopupBarColor = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.btnNovoflwMagicRecordList13 ~= nil then self.btnNovoflwMagicRecordList13:destroy(); self.btnNovoflwMagicRecordList13 = nil; end;
        if self.layBottomflwMagicRecordList17 ~= nil then self.layBottomflwMagicRecordList17:destroy(); self.layBottomflwMagicRecordList17 = nil; end;
        if self.edtupperGridMagicEditBox5 ~= nil then self.edtupperGridMagicEditBox5:destroy(); self.edtupperGridMagicEditBox5 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.campoDosItensArmazenadosPart ~= nil then self.campoDosItensArmazenadosPart:destroy(); self.campoDosItensArmazenadosPart = nil; end;
        if self.rclListaDasProficiencias ~= nil then self.rclListaDasProficiencias:destroy(); self.rclListaDasProficiencias = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flwMagicRecordList18 ~= nil then self.flwMagicRecordList18:destroy(); self.flwMagicRecordList18 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.flwMagicRecordList16 ~= nil then self.flwMagicRecordList16:destroy(); self.flwMagicRecordList16 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.campoDasRacasPart ~= nil then self.campoDasRacasPart:destroy(); self.campoDasRacasPart = nil; end;
        if self.UpperGridCampo10 ~= nil then self.UpperGridCampo10:destroy(); self.UpperGridCampo10 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.upperGridMagicEditBox1 ~= nil then self.upperGridMagicEditBox1:destroy(); self.upperGridMagicEditBox1 = nil; end;
        if self.layBottomflwMagicRecordList16 ~= nil then self.layBottomflwMagicRecordList16:destroy(); self.layBottomflwMagicRecordList16 = nil; end;
        if self.upperGridMagicEditBox12 ~= nil then self.upperGridMagicEditBox12:destroy(); self.upperGridMagicEditBox12 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layBottomflwMagicRecordList6 ~= nil then self.layBottomflwMagicRecordList6:destroy(); self.layBottomflwMagicRecordList6 = nil; end;
        if self.layBottomflwMagicRecordList9 ~= nil then self.layBottomflwMagicRecordList9:destroy(); self.layBottomflwMagicRecordList9 = nil; end;
        if self.labUpperGridCampo12 ~= nil then self.labUpperGridCampo12:destroy(); self.labUpperGridCampo12 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flwMagicRecordList9 ~= nil then self.flwMagicRecordList9:destroy(); self.flwMagicRecordList9 = nil; end;
        if self.rclflwMagicRecordList18 ~= nil then self.rclflwMagicRecordList18:destroy(); self.rclflwMagicRecordList18 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.edtUpperGridCampo8 ~= nil then self.edtUpperGridCampo8:destroy(); self.edtUpperGridCampo8 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.rclflwMagicRecordList2 ~= nil then self.rclflwMagicRecordList2:destroy(); self.rclflwMagicRecordList2 = nil; end;
        if self.edtNome1 ~= nil then self.edtNome1:destroy(); self.edtNome1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.campoDosOutrosPart ~= nil then self.campoDosOutrosPart:destroy(); self.campoDosOutrosPart = nil; end;
        if self.upperGridMagicEditBox11 ~= nil then self.upperGridMagicEditBox11:destroy(); self.upperGridMagicEditBox11 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layBottomflwMagicRecordList3 ~= nil then self.layBottomflwMagicRecordList3:destroy(); self.layBottomflwMagicRecordList3 = nil; end;
        if self.panupperGridMagicEditBox9 ~= nil then self.panupperGridMagicEditBox9:destroy(); self.panupperGridMagicEditBox9 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.flwMagicRecordList1 ~= nil then self.flwMagicRecordList1:destroy(); self.flwMagicRecordList1 = nil; end;
        if self.edtupperGridMagicEditBox6 ~= nil then self.edtupperGridMagicEditBox6:destroy(); self.edtupperGridMagicEditBox6 = nil; end;
        if self.frame1 ~= nil then self.frame1:destroy(); self.frame1 = nil; end;
        if self.layBottomflwMagicRecordList11 ~= nil then self.layBottomflwMagicRecordList11:destroy(); self.layBottomflwMagicRecordList11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edtupperGridMagicEditBox11 ~= nil then self.edtupperGridMagicEditBox11:destroy(); self.edtupperGridMagicEditBox11 = nil; end;
        if self.edtupperGridMagicEditBox3 ~= nil then self.edtupperGridMagicEditBox3:destroy(); self.edtupperGridMagicEditBox3 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.rclflwMagicRecordList15 ~= nil then self.rclflwMagicRecordList15:destroy(); self.rclflwMagicRecordList15 = nil; end;
        if self.labupperGridMagicEditBox2 ~= nil then self.labupperGridMagicEditBox2:destroy(); self.labupperGridMagicEditBox2 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.layBottomflwMagicRecordList2 ~= nil then self.layBottomflwMagicRecordList2:destroy(); self.layBottomflwMagicRecordList2 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.panupperGridMagicEditBox11 ~= nil then self.panupperGridMagicEditBox11:destroy(); self.panupperGridMagicEditBox11 = nil; end;
        if self.campoDosItensArmazenados ~= nil then self.campoDosItensArmazenados:destroy(); self.campoDosItensArmazenados = nil; end;
        if self.rclflwMagicRecordList19 ~= nil then self.rclflwMagicRecordList19:destroy(); self.rclflwMagicRecordList19 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.campoDosItens ~= nil then self.campoDosItens:destroy(); self.campoDosItens = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.flwMagicRecordList8 ~= nil then self.flwMagicRecordList8:destroy(); self.flwMagicRecordList8 = nil; end;
        if self.layBottomflwMagicRecordList13 ~= nil then self.layBottomflwMagicRecordList13:destroy(); self.layBottomflwMagicRecordList13 = nil; end;
        if self.layBottomflwMagicRecordList19 ~= nil then self.layBottomflwMagicRecordList19:destroy(); self.layBottomflwMagicRecordList19 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.panupperGridMagicEditBox8 ~= nil then self.panupperGridMagicEditBox8:destroy(); self.panupperGridMagicEditBox8 = nil; end;
        if self.edtUpperGridCampo10 ~= nil then self.edtUpperGridCampo10:destroy(); self.edtUpperGridCampo10 = nil; end;
        if self.frame2 ~= nil then self.frame2:destroy(); self.frame2 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.btnNovoflwMagicRecordList12 ~= nil then self.btnNovoflwMagicRecordList12:destroy(); self.btnNovoflwMagicRecordList12 = nil; end;
        if self.edtUpperGridCampo7 ~= nil then self.edtUpperGridCampo7:destroy(); self.edtUpperGridCampo7 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layBottomflwMagicRecordList4 ~= nil then self.layBottomflwMagicRecordList4:destroy(); self.layBottomflwMagicRecordList4 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layNomeHolderFrente ~= nil then self.layNomeHolderFrente:destroy(); self.layNomeHolderFrente = nil; end;
        if self.fraLayAtributos ~= nil then self.fraLayAtributos:destroy(); self.fraLayAtributos = nil; end;
        if self.upperGridMagicEditBox4 ~= nil then self.upperGridMagicEditBox4:destroy(); self.upperGridMagicEditBox4 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.panupperGridMagicEditBox3 ~= nil then self.panupperGridMagicEditBox3:destroy(); self.panupperGridMagicEditBox3 = nil; end;
        if self.panupperGridMagicEditBox7 ~= nil then self.panupperGridMagicEditBox7:destroy(); self.panupperGridMagicEditBox7 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowLayout36 ~= nil then self.flowLayout36:destroy(); self.flowLayout36 = nil; end;
        if self.upperGridMagicEditBox7 ~= nil then self.upperGridMagicEditBox7:destroy(); self.upperGridMagicEditBox7 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.layBottomflwMagicRecordList8 ~= nil then self.layBottomflwMagicRecordList8:destroy(); self.layBottomflwMagicRecordList8 = nil; end;
        if self.btnNovoflwMagicRecordList15 ~= nil then self.btnNovoflwMagicRecordList15:destroy(); self.btnNovoflwMagicRecordList15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.campoDosDepositos ~= nil then self.campoDosDepositos:destroy(); self.campoDosDepositos = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.flowLayout38 ~= nil then self.flowLayout38:destroy(); self.flowLayout38 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.flwMagicRecordList11 ~= nil then self.flwMagicRecordList11:destroy(); self.flwMagicRecordList11 = nil; end;
        if self.flwMagicRecordList13 ~= nil then self.flwMagicRecordList13:destroy(); self.flwMagicRecordList13 = nil; end;
        if self.campoDosOutros ~= nil then self.campoDosOutros:destroy(); self.campoDosOutros = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowLayout37 ~= nil then self.flowLayout37:destroy(); self.flowLayout37 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.panupperGridMagicEditBox6 ~= nil then self.panupperGridMagicEditBox6:destroy(); self.panupperGridMagicEditBox6 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layBottomflwMagicRecordList12 ~= nil then self.layBottomflwMagicRecordList12:destroy(); self.layBottomflwMagicRecordList12 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.linUpperGridCampo8 ~= nil then self.linUpperGridCampo8:destroy(); self.linUpperGridCampo8 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.BarPopup ~= nil then self.BarPopup:destroy(); self.BarPopup = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.panupperGridMagicEditBox2 ~= nil then self.panupperGridMagicEditBox2:destroy(); self.panupperGridMagicEditBox2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.linUpperGridCampo9 ~= nil then self.linUpperGridCampo9:destroy(); self.linUpperGridCampo9 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.campoDosAtaques ~= nil then self.campoDosAtaques:destroy(); self.campoDosAtaques = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.flwMagicRecordList14 ~= nil then self.flwMagicRecordList14:destroy(); self.flwMagicRecordList14 = nil; end;
        if self.campoDasCaracteristicasClasse ~= nil then self.campoDasCaracteristicasClasse:destroy(); self.campoDasCaracteristicasClasse = nil; end;
        if self.flwMagicRecordList19 ~= nil then self.flwMagicRecordList19:destroy(); self.flwMagicRecordList19 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.flowLayout39 ~= nil then self.flowLayout39:destroy(); self.flowLayout39 = nil; end;
        if self.flwMagicRecordList3 ~= nil then self.flwMagicRecordList3:destroy(); self.flwMagicRecordList3 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.upperGridMagicEditBox3 ~= nil then self.upperGridMagicEditBox3:destroy(); self.upperGridMagicEditBox3 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.rclflwMagicRecordList5 ~= nil then self.rclflwMagicRecordList5:destroy(); self.rclflwMagicRecordList5 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.fraTechLayout ~= nil then self.fraTechLayout:destroy(); self.fraTechLayout = nil; end;
        if self.rclflwMagicRecordList9 ~= nil then self.rclflwMagicRecordList9:destroy(); self.rclflwMagicRecordList9 = nil; end;
        if self.labupperGridMagicEditBox8 ~= nil then self.labupperGridMagicEditBox8:destroy(); self.labupperGridMagicEditBox8 = nil; end;
        if self.labUpperGridCampo9 ~= nil then self.labUpperGridCampo9:destroy(); self.labUpperGridCampo9 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.btnNovoflwMagicRecordList7 ~= nil then self.btnNovoflwMagicRecordList7:destroy(); self.btnNovoflwMagicRecordList7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rclflwMagicRecordList17 ~= nil then self.rclflwMagicRecordList17:destroy(); self.rclflwMagicRecordList17 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.campoDosTalentosPart ~= nil then self.campoDosTalentosPart:destroy(); self.campoDosTalentosPart = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.panupperGridMagicEditBox12 ~= nil then self.panupperGridMagicEditBox12:destroy(); self.panupperGridMagicEditBox12 = nil; end;
        if self.rclflwMagicRecordList14 ~= nil then self.rclflwMagicRecordList14:destroy(); self.rclflwMagicRecordList14 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.flowLayout35 ~= nil then self.flowLayout35:destroy(); self.flowLayout35 = nil; end;
        if self.edtUpperGridCampo9 ~= nil then self.edtUpperGridCampo9:destroy(); self.edtUpperGridCampo9 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.flowLayout40 ~= nil then self.flowLayout40:destroy(); self.flowLayout40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flwMagicRecordList12 ~= nil then self.flwMagicRecordList12:destroy(); self.flwMagicRecordList12 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.flwMagicRecordList7 ~= nil then self.flwMagicRecordList7:destroy(); self.flwMagicRecordList7 = nil; end;
        if self.layBottomflwMagicRecordList5 ~= nil then self.layBottomflwMagicRecordList5:destroy(); self.layBottomflwMagicRecordList5 = nil; end;
        if self.labupperGridMagicEditBox12 ~= nil then self.labupperGridMagicEditBox12:destroy(); self.labupperGridMagicEditBox12 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.edtupperGridMagicEditBox9 ~= nil then self.edtupperGridMagicEditBox9:destroy(); self.edtupperGridMagicEditBox9 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.labupperGridMagicEditBox11 ~= nil then self.labupperGridMagicEditBox11:destroy(); self.labupperGridMagicEditBox11 = nil; end;
        if self.campoDosCreditos ~= nil then self.campoDosCreditos:destroy(); self.campoDosCreditos = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.btnNovoflwMagicRecordList5 ~= nil then self.btnNovoflwMagicRecordList5:destroy(); self.btnNovoflwMagicRecordList5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.campoDosPoderesDeAtaquePart ~= nil then self.campoDosPoderesDeAtaquePart:destroy(); self.campoDosPoderesDeAtaquePart = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.rclflwMagicRecordList10 ~= nil then self.rclflwMagicRecordList10:destroy(); self.rclflwMagicRecordList10 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.panupperGridMagicEditBox5 ~= nil then self.panupperGridMagicEditBox5:destroy(); self.panupperGridMagicEditBox5 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.maxBarValue ~= nil then self.maxBarValue:destroy(); self.maxBarValue = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.panupperGridMagicEditBox1 ~= nil then self.panupperGridMagicEditBox1:destroy(); self.panupperGridMagicEditBox1 = nil; end;
        if self.layBottomflwMagicRecordList15 ~= nil then self.layBottomflwMagicRecordList15:destroy(); self.layBottomflwMagicRecordList15 = nil; end;
        if self.linUpperGridCampo11 ~= nil then self.linUpperGridCampo11:destroy(); self.linUpperGridCampo11 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rclflwMagicRecordList6 ~= nil then self.rclflwMagicRecordList6:destroy(); self.rclflwMagicRecordList6 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.rclflwMagicRecordList16 ~= nil then self.rclflwMagicRecordList16:destroy(); self.rclflwMagicRecordList16 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rclflwMagicRecordList1 ~= nil then self.rclflwMagicRecordList1:destroy(); self.rclflwMagicRecordList1 = nil; end;
        if self.UpperGridCampo11 ~= nil then self.UpperGridCampo11:destroy(); self.UpperGridCampo11 = nil; end;
        if self.frmDnDNext_proficiencias ~= nil then self.frmDnDNext_proficiencias:destroy(); self.frmDnDNext_proficiencias = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.frmHabilidades ~= nil then self.frmHabilidades:destroy(); self.frmHabilidades = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rclflwMagicRecordList12 ~= nil then self.rclflwMagicRecordList12:destroy(); self.rclflwMagicRecordList12 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rclflwMagicRecordList11 ~= nil then self.rclflwMagicRecordList11:destroy(); self.rclflwMagicRecordList11 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.flowLayout41 ~= nil then self.flowLayout41:destroy(); self.flowLayout41 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.upperGridMagicEditBox5 ~= nil then self.upperGridMagicEditBox5:destroy(); self.upperGridMagicEditBox5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.panupperGridMagicEditBox4 ~= nil then self.panupperGridMagicEditBox4:destroy(); self.panupperGridMagicEditBox4 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.labupperGridMagicEditBox10 ~= nil then self.labupperGridMagicEditBox10:destroy(); self.labupperGridMagicEditBox10 = nil; end;
        if self.campoDosCreditosPart ~= nil then self.campoDosCreditosPart:destroy(); self.campoDosCreditosPart = nil; end;
        if self.edtupperGridMagicEditBox10 ~= nil then self.edtupperGridMagicEditBox10:destroy(); self.edtupperGridMagicEditBox10 = nil; end;
        if self.UpperGridCampo8 ~= nil then self.UpperGridCampo8:destroy(); self.UpperGridCampo8 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.btnNovoflwMagicRecordList16 ~= nil then self.btnNovoflwMagicRecordList16:destroy(); self.btnNovoflwMagicRecordList16 = nil; end;
        if self.layBottomflwMagicRecordList20 ~= nil then self.layBottomflwMagicRecordList20:destroy(); self.layBottomflwMagicRecordList20 = nil; end;
        if self.CampoDosTesourosPart ~= nil then self.CampoDosTesourosPart:destroy(); self.CampoDosTesourosPart = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.labUpperGridCampo8 ~= nil then self.labUpperGridCampo8:destroy(); self.labUpperGridCampo8 = nil; end;
        if self.linUpperGridCampo12 ~= nil then self.linUpperGridCampo12:destroy(); self.linUpperGridCampo12 = nil; end;
        if self.UpperGridCampo7 ~= nil then self.UpperGridCampo7:destroy(); self.UpperGridCampo7 = nil; end;
        if self.fraAliadosOrganizacoes ~= nil then self.fraAliadosOrganizacoes:destroy(); self.fraAliadosOrganizacoes = nil; end;
        if self.layBottomflwMagicRecordList1 ~= nil then self.layBottomflwMagicRecordList1:destroy(); self.layBottomflwMagicRecordList1 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.campoDosDepositosPart ~= nil then self.campoDosDepositosPart:destroy(); self.campoDosDepositosPart = nil; end;
        if self.labupperGridMagicEditBox7 ~= nil then self.labupperGridMagicEditBox7:destroy(); self.labupperGridMagicEditBox7 = nil; end;
        if self.rclflwMagicRecordList8 ~= nil then self.rclflwMagicRecordList8:destroy(); self.rclflwMagicRecordList8 = nil; end;
        if self.layBottomflwMagicRecordList7 ~= nil then self.layBottomflwMagicRecordList7:destroy(); self.layBottomflwMagicRecordList7 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.fraMagiasLayout ~= nil then self.fraMagiasLayout:destroy(); self.fraMagiasLayout = nil; end;
        if self.edtUpperGridCampo11 ~= nil then self.edtUpperGridCampo11:destroy(); self.edtUpperGridCampo11 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.btnNovoflwMagicRecordList20 ~= nil then self.btnNovoflwMagicRecordList20:destroy(); self.btnNovoflwMagicRecordList20 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.labupperGridMagicEditBox3 ~= nil then self.labupperGridMagicEditBox3:destroy(); self.labupperGridMagicEditBox3 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.campoDosPoderesDeAtaque ~= nil then self.campoDosPoderesDeAtaque:destroy(); self.campoDosPoderesDeAtaque = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edtupperGridMagicEditBox12 ~= nil then self.edtupperGridMagicEditBox12:destroy(); self.edtupperGridMagicEditBox12 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.labUpperGridCampo7 ~= nil then self.labUpperGridCampo7:destroy(); self.labUpperGridCampo7 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.flowLayout42 ~= nil then self.flowLayout42:destroy(); self.flowLayout42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.btnNovoflwMagicRecordList4 ~= nil then self.btnNovoflwMagicRecordList4:destroy(); self.btnNovoflwMagicRecordList4 = nil; end;
        if self.panupperGridMagicEditBox10 ~= nil then self.panupperGridMagicEditBox10:destroy(); self.panupperGridMagicEditBox10 = nil; end;
        if self.upperGridMagicEditBox6 ~= nil then self.upperGridMagicEditBox6:destroy(); self.upperGridMagicEditBox6 = nil; end;
        if self.labupperGridMagicEditBox6 ~= nil then self.labupperGridMagicEditBox6:destroy(); self.labupperGridMagicEditBox6 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.labNome1 ~= nil then self.labNome1:destroy(); self.labNome1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.prtFaccao ~= nil then self.prtFaccao:destroy(); self.prtFaccao = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rclflwMagicRecordList13 ~= nil then self.rclflwMagicRecordList13:destroy(); self.rclflwMagicRecordList13 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.btnNovoflwMagicRecordList2 ~= nil then self.btnNovoflwMagicRecordList2:destroy(); self.btnNovoflwMagicRecordList2 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.btnNovoflwMagicRecordList1 ~= nil then self.btnNovoflwMagicRecordList1:destroy(); self.btnNovoflwMagicRecordList1 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.layBottomflwMagicRecordList14 ~= nil then self.layBottomflwMagicRecordList14:destroy(); self.layBottomflwMagicRecordList14 = nil; end;
        if self.layBottomflwMagicRecordList10 ~= nil then self.layBottomflwMagicRecordList10:destroy(); self.layBottomflwMagicRecordList10 = nil; end;
        if self.rclflwMagicRecordList3 ~= nil then self.rclflwMagicRecordList3:destroy(); self.rclflwMagicRecordList3 = nil; end;
        if self.upperGridMagicEditBox8 ~= nil then self.upperGridMagicEditBox8:destroy(); self.upperGridMagicEditBox8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.labupperGridMagicEditBox9 ~= nil then self.labupperGridMagicEditBox9:destroy(); self.labupperGridMagicEditBox9 = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.btnNovoflwMagicRecordList18 ~= nil then self.btnNovoflwMagicRecordList18:destroy(); self.btnNovoflwMagicRecordList18 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.campoDosItensPart ~= nil then self.campoDosItensPart:destroy(); self.campoDosItensPart = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.linUpperGridCampo10 ~= nil then self.linUpperGridCampo10:destroy(); self.linUpperGridCampo10 = nil; end;
        if self.UpperGridCampo12 ~= nil then self.UpperGridCampo12:destroy(); self.UpperGridCampo12 = nil; end;
        if self.campoDasRacas ~= nil then self.campoDasRacas:destroy(); self.campoDasRacas = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.btnNovoflwMagicRecordList8 ~= nil then self.btnNovoflwMagicRecordList8:destroy(); self.btnNovoflwMagicRecordList8 = nil; end;
        if self.flwMagicRecordList10 ~= nil then self.flwMagicRecordList10:destroy(); self.flwMagicRecordList10 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.labupperGridMagicEditBox1 ~= nil then self.labupperGridMagicEditBox1:destroy(); self.labupperGridMagicEditBox1 = nil; end;
        if self.labupperGridMagicEditBox4 ~= nil then self.labupperGridMagicEditBox4:destroy(); self.labupperGridMagicEditBox4 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.UpperGridCampo9 ~= nil then self.UpperGridCampo9:destroy(); self.UpperGridCampo9 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.flwNome1 ~= nil then self.flwNome1:destroy(); self.flwNome1 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rclflwMagicRecordList4 ~= nil then self.rclflwMagicRecordList4:destroy(); self.rclflwMagicRecordList4 = nil; end;
        if self.fraUpperGridTech ~= nil then self.fraUpperGridTech:destroy(); self.fraUpperGridTech = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.CampoDosTesouros ~= nil then self.CampoDosTesouros:destroy(); self.CampoDosTesouros = nil; end;
        if self.edtUpperGridCampo12 ~= nil then self.edtUpperGridCampo12:destroy(); self.edtUpperGridCampo12 = nil; end;
        if self.edtupperGridMagicEditBox1 ~= nil then self.edtupperGridMagicEditBox1:destroy(); self.edtupperGridMagicEditBox1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.fraUpperGridMagias ~= nil then self.fraUpperGridMagias:destroy(); self.fraUpperGridMagias = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaSW5e()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaSW5e();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaSW5e = {
    newEditor = newfrmFichaSW5e, 
    new = newfrmFichaSW5e, 
    name = "frmFichaSW5e", 
    dataType = "Ambesek.FichaSW5e", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Star Wars 5e", 
    description=""};

frmFichaSW5e = _frmFichaSW5e;
Firecast.registrarForm(_frmFichaSW5e);
Firecast.registrarDataType(_frmFichaSW5e);

return _frmFichaSW5e;
