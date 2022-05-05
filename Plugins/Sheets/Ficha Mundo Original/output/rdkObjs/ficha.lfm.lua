require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_MundoOriginal()
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
    obj:setDataType("Ambesek.FMO");
    obj:setFormType("sheetTemplate");
    obj:setTitle("Ficha Mundo Original");
    obj:setName("MundoOriginal");
    obj:setTheme("dark");

    obj.pgcPrincipal = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
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
    obj.flwNome1:setFrameStyle("frames/banner/dragon.xml");
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
    obj.edtUpperGridCampo1:setField("classe");
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
    obj.labUpperGridCampo1:setText("CLASSE");
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
    obj.edtUpperGridCampo2:setField("nivel");
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
    obj.labUpperGridCampo2:setText("NÍVEL");
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
    obj.labUpperGridCampo4:setText("RAÇA");
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

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.fraFrenteLayout);
    obj.flowPart1:setMinWidth(280);
    obj.flowPart1:setMaxWidth(800);
    obj.flowPart1:setHeight(64);
    obj.flowPart1:setFrameStyle("frames/posCaptionEdit2/frame.xml");
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("heranca");
    obj.edit1:setWidth(70);
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(15);
    obj.edit1:setFontColor("white");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("client");
    obj.label1:setText("BÔNUS DE HERANÇA");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(true);
    obj.label1:setMargins({left=10});
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontSize(12);
    obj.label1:setFontColor("#D0D0D0");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.fraFrenteLayout);
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
    obj.edit2:setField("souls");
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
    obj.label2:setText("Quantidade de Souls");
    obj.label2:setTextTrimming("none");
    obj.label2:setWordWrap(true);
    obj.label2:setMargins({left=10});
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#D0D0D0");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraFrenteLayout);
    obj.flowLayout2:setMinWidth(235);
    obj.flowLayout2:setMaxWidth(1200);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAvoidScale(false);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setMaxControlsPerLine(12);
    obj.flowLayout2:setMargins({top=0});
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setVertAlign("leading");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setStepSizes({105});
    obj.flowPart3:setMinScaledWidth(75);
    obj.flowPart3:setHeight(120);
    obj.flowPart3:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setText("Água");
    obj.label3:setHeight(20);
    obj.label3:setFontSize(9);
    obj.label3:setWordWrap(true);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setTextTrimming("none");
    obj.label3:setName("label3");
    obj.label3:setFontColor("white");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("aguaResistancia");
    obj.edit3:setFontSize(30);
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontColor("white");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout2);
    obj.flowPart4:setStepSizes({105});
    obj.flowPart4:setMinScaledWidth(75);
    obj.flowPart4:setHeight(120);
    obj.flowPart4:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart4:setVertAlign("leading");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setText("Fogo");
    obj.label4:setHeight(20);
    obj.label4:setFontSize(9);
    obj.label4:setWordWrap(true);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setTextTrimming("none");
    obj.label4:setName("label4");
    obj.label4:setFontColor("white");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("fogoResistancia");
    obj.edit4:setFontSize(30);
    obj.edit4:setName("edit4");
    obj.edit4:setTransparent(true);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("white");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout2);
    obj.flowPart5:setStepSizes({105});
    obj.flowPart5:setMinScaledWidth(75);
    obj.flowPart5:setHeight(120);
    obj.flowPart5:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart5:setVertAlign("leading");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setText("Raio");
    obj.label5:setHeight(20);
    obj.label5:setFontSize(9);
    obj.label5:setWordWrap(true);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setTextTrimming("none");
    obj.label5:setName("label5");
    obj.label5:setFontColor("white");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart5);
    obj.edit5:setAlign("client");
    obj.edit5:setField("raioResistancia");
    obj.edit5:setFontSize(30);
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontColor("white");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout2);
    obj.flowPart6:setStepSizes({105});
    obj.flowPart6:setMinScaledWidth(75);
    obj.flowPart6:setHeight(120);
    obj.flowPart6:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart6:setVertAlign("leading");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart6);
    obj.label6:setAlign("top");
    obj.label6:setText("Ar");
    obj.label6:setHeight(20);
    obj.label6:setFontSize(9);
    obj.label6:setWordWrap(true);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setTextTrimming("none");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart6);
    obj.edit6:setAlign("client");
    obj.edit6:setField("arResistancia");
    obj.edit6:setFontSize(30);
    obj.edit6:setName("edit6");
    obj.edit6:setTransparent(true);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontColor("white");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout2);
    obj.flowPart7:setStepSizes({105});
    obj.flowPart7:setMinScaledWidth(75);
    obj.flowPart7:setHeight(120);
    obj.flowPart7:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart7:setVertAlign("leading");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart7);
    obj.label7:setAlign("top");
    obj.label7:setText("Gelo");
    obj.label7:setHeight(20);
    obj.label7:setFontSize(9);
    obj.label7:setWordWrap(true);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setTextTrimming("none");
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart7);
    obj.edit7:setAlign("client");
    obj.edit7:setField("geloResistancia");
    obj.edit7:setFontSize(30);
    obj.edit7:setName("edit7");
    obj.edit7:setTransparent(true);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontColor("white");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout2);
    obj.flowPart8:setStepSizes({105});
    obj.flowPart8:setMinScaledWidth(75);
    obj.flowPart8:setHeight(120);
    obj.flowPart8:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart8:setVertAlign("leading");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart8);
    obj.label8:setAlign("top");
    obj.label8:setText("Lava");
    obj.label8:setHeight(20);
    obj.label8:setFontSize(9);
    obj.label8:setWordWrap(true);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setTextTrimming("none");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart8);
    obj.edit8:setAlign("client");
    obj.edit8:setField("lavaResistancia");
    obj.edit8:setFontSize(30);
    obj.edit8:setName("edit8");
    obj.edit8:setTransparent(true);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontColor("white");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setStepSizes({105});
    obj.flowPart9:setMinScaledWidth(75);
    obj.flowPart9:setHeight(120);
    obj.flowPart9:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart9:setVertAlign("leading");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart9);
    obj.label9:setAlign("top");
    obj.label9:setText("Chaos");
    obj.label9:setHeight(20);
    obj.label9:setFontSize(9);
    obj.label9:setWordWrap(true);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setTextTrimming("none");
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart9);
    obj.edit9:setAlign("client");
    obj.edit9:setField("chaosResistancia");
    obj.edit9:setFontSize(30);
    obj.edit9:setName("edit9");
    obj.edit9:setTransparent(true);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontColor("white");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout2);
    obj.flowPart10:setStepSizes({105});
    obj.flowPart10:setMinScaledWidth(75);
    obj.flowPart10:setHeight(120);
    obj.flowPart10:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart10);
    obj.label10:setAlign("top");
    obj.label10:setText("Veneno");
    obj.label10:setHeight(20);
    obj.label10:setFontSize(9);
    obj.label10:setWordWrap(true);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setTextTrimming("none");
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart10);
    obj.edit10:setAlign("client");
    obj.edit10:setField("venenoResistancia");
    obj.edit10:setFontSize(30);
    obj.edit10:setName("edit10");
    obj.edit10:setTransparent(true);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontColor("white");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout2);
    obj.flowPart11:setStepSizes({105});
    obj.flowPart11:setMinScaledWidth(75);
    obj.flowPart11:setHeight(120);
    obj.flowPart11:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart11);
    obj.label11:setAlign("top");
    obj.label11:setText("Luz");
    obj.label11:setHeight(20);
    obj.label11:setFontSize(9);
    obj.label11:setWordWrap(true);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setTextTrimming("none");
    obj.label11:setName("label11");
    obj.label11:setFontColor("white");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart11);
    obj.edit11:setAlign("client");
    obj.edit11:setField("luzResistancia");
    obj.edit11:setFontSize(30);
    obj.edit11:setName("edit11");
    obj.edit11:setTransparent(true);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontColor("white");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout2);
    obj.flowPart12:setStepSizes({105});
    obj.flowPart12:setMinScaledWidth(75);
    obj.flowPart12:setHeight(120);
    obj.flowPart12:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart12:setVertAlign("leading");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart12);
    obj.label12:setAlign("top");
    obj.label12:setText("Escuridão");
    obj.label12:setHeight(20);
    obj.label12:setFontSize(9);
    obj.label12:setWordWrap(true);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setTextTrimming("none");
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart12);
    obj.edit12:setAlign("client");
    obj.edit12:setField("escuridaoResistancia");
    obj.edit12:setFontSize(30);
    obj.edit12:setName("edit12");
    obj.edit12:setTransparent(true);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontColor("white");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout2);
    obj.flowPart13:setStepSizes({105});
    obj.flowPart13:setMinScaledWidth(75);
    obj.flowPart13:setHeight(120);
    obj.flowPart13:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart13:setVertAlign("leading");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart13);
    obj.label13:setAlign("top");
    obj.label13:setText("Físico");
    obj.label13:setHeight(20);
    obj.label13:setFontSize(9);
    obj.label13:setWordWrap(true);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setTextTrimming("none");
    obj.label13:setName("label13");
    obj.label13:setFontColor("white");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart13);
    obj.edit13:setAlign("client");
    obj.edit13:setField("fisicoResistancia");
    obj.edit13:setFontSize(30);
    obj.edit13:setName("edit13");
    obj.edit13:setTransparent(true);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontColor("white");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setStepSizes({105});
    obj.flowPart14:setMinScaledWidth(75);
    obj.flowPart14:setHeight(120);
    obj.flowPart14:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart14:setVertAlign("leading");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart14);
    obj.label14:setAlign("top");
    obj.label14:setText("Magico");
    obj.label14:setHeight(20);
    obj.label14:setFontSize(9);
    obj.label14:setWordWrap(true);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setTextTrimming("none");
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart14);
    obj.edit14:setAlign("client");
    obj.edit14:setField("magicoResistancia");
    obj.edit14:setFontSize(30);
    obj.edit14:setName("edit14");
    obj.edit14:setTransparent(true);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontColor("white");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak3:setName("flowLineBreak3");

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
    obj.dataLink1:setFields({'atributos.forca','atributos.amplificador'});
    obj.dataLink1:setName("dataLink1");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.fraLayAtributos);
    obj.flowPart15:setHeight(140);
    obj.flowPart15:setMinWidth(320);
    obj.flowPart15:setMaxWidth(420);
    obj.flowPart15:setMinScaledWidth(305);
    obj.flowPart15:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart15:setVertAlign("leading");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart15);
    obj.layout1:setLeft(6);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(116);
    obj.layout1:setHeight(115);
    obj.layout1:setName("layout1");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout1);
    obj.edit15:setAlign("top");
    obj.edit15:setMargins({left=30, right=30});
    obj.edit15:setField("atributos.forca");
    obj.edit15:setHeight(30);
    obj.edit15:setType("number");
    obj.edit15:setMin(0);
    obj.edit15:setName("edit15");
    obj.edit15:setTransparent(true);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(15);
    obj.edit15:setFontColor("white");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart15);
    obj.label15:setFrameRegion("modificador");
    obj.label15:setField("atributos.modforcastr");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setVertTextAlign("center");
    obj.label15:setFontSize(36);
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart15);
    obj.label16:setFrameRegion("titulo");
    obj.label16:setText("FORÇA");
    obj.label16:setVertTextAlign("center");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");
    obj.label16:setFontColor("white");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowPart15);
    obj.flowLayout4:setFrameRegion("RegiaoDePericias");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setLineSpacing(0);
    obj.flowLayout4:setHorzAlign("leading");
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout4:setVertAlign("leading");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout4);
    obj.flowPart16:setMinWidth(206);
    obj.flowPart16:setMaxWidth(250);
    obj.flowPart16:setHeight(17);
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart16:setVertAlign("leading");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.flowPart16);
    obj.imageCheckBox1:setAlign("left");
    obj.imageCheckBox1:setWidth(20);
    obj.imageCheckBox1:setMargins({});
    obj.imageCheckBox1:setField("pericias.atletismo");
    obj.imageCheckBox1:setOptimize(false);
    obj.imageCheckBox1:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox1:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox1:setName("imageCheckBox1");
    obj.imageCheckBox1:setHeight(20);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart16);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(52);
    obj.layout2:setMargins({left=2});
    obj.layout2:setName("layout2");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setField("pericias.bonusatletismostr");
    obj.label17:setAlign("client");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setVertTextAlign("trailing");
    obj.label17:setTextTrimming("none");
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout2);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setName("horzLine1");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart16);
    obj.label18:setAlign("client");
    obj.label18:setText("Atletismo");
    obj.label18:setVertTextAlign("trailing");
    obj.label18:setMargins({left=5});
    obj.label18:setAutoSize(true);
    obj.label18:setWordWrap(false);
    obj.label18:setName("label18");
    obj.label18:setFontColor("white");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flowLayout4);
    obj.dataLink2:setFields({'atributos.modforca', 'bonusProficiencia', 'pericias.atletismo'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.fraLayAtributos);
    obj.dataLink3:setFields({'atributos.destreza','atributos.amplificador'});
    obj.dataLink3:setName("dataLink3");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.fraLayAtributos);
    obj.flowPart17:setHeight(140);
    obj.flowPart17:setMinWidth(320);
    obj.flowPart17:setMaxWidth(420);
    obj.flowPart17:setMinScaledWidth(305);
    obj.flowPart17:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart17:setVertAlign("leading");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart17);
    obj.layout3:setLeft(6);
    obj.layout3:setTop(12);
    obj.layout3:setWidth(116);
    obj.layout3:setHeight(115);
    obj.layout3:setName("layout3");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout3);
    obj.edit16:setAlign("top");
    obj.edit16:setMargins({left=30, right=30});
    obj.edit16:setField("atributos.destreza");
    obj.edit16:setHeight(30);
    obj.edit16:setType("number");
    obj.edit16:setMin(0);
    obj.edit16:setName("edit16");
    obj.edit16:setTransparent(true);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(15);
    obj.edit16:setFontColor("white");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart17);
    obj.label19:setFrameRegion("modificador");
    obj.label19:setField("atributos.moddestrezastr");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setVertTextAlign("center");
    obj.label19:setFontSize(36);
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setName("label19");
    obj.label19:setFontColor("white");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart17);
    obj.label20:setFrameRegion("titulo");
    obj.label20:setText("DESTREZA");
    obj.label20:setVertTextAlign("center");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");
    obj.label20:setFontColor("white");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowPart17);
    obj.flowLayout5:setFrameRegion("RegiaoDePericias");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setLineSpacing(0);
    obj.flowLayout5:setHorzAlign("leading");
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout5:setVertAlign("leading");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout5);
    obj.flowPart18:setMinWidth(206);
    obj.flowPart18:setMaxWidth(250);
    obj.flowPart18:setHeight(17);
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart18:setVertAlign("leading");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.flowPart18);
    obj.imageCheckBox2:setAlign("left");
    obj.imageCheckBox2:setWidth(20);
    obj.imageCheckBox2:setMargins({});
    obj.imageCheckBox2:setField("pericias.acrobacia");
    obj.imageCheckBox2:setOptimize(false);
    obj.imageCheckBox2:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox2:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox2:setName("imageCheckBox2");
    obj.imageCheckBox2:setHeight(20);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart18);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(52);
    obj.layout4:setMargins({left=2});
    obj.layout4:setName("layout4");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout4);
    obj.label21:setField("pericias.bonusacrobaciastr");
    obj.label21:setAlign("client");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setVertTextAlign("trailing");
    obj.label21:setTextTrimming("none");
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout4);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setName("horzLine2");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart18);
    obj.label22:setAlign("client");
    obj.label22:setText("Acrobacia");
    obj.label22:setVertTextAlign("trailing");
    obj.label22:setMargins({left=5});
    obj.label22:setAutoSize(true);
    obj.label22:setWordWrap(false);
    obj.label22:setName("label22");
    obj.label22:setFontColor("white");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowLayout5);
    obj.dataLink4:setFields({'atributos.moddestreza', 'bonusProficiencia', 'pericias.acrobacia'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.fraLayAtributos);
    obj.dataLink5:setFields({'atributos.agilidade','atributos.amplificador'});
    obj.dataLink5:setName("dataLink5");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.fraLayAtributos);
    obj.flowPart19:setHeight(140);
    obj.flowPart19:setMinWidth(320);
    obj.flowPart19:setMaxWidth(420);
    obj.flowPart19:setMinScaledWidth(305);
    obj.flowPart19:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart19:setVertAlign("leading");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart19);
    obj.layout5:setLeft(6);
    obj.layout5:setTop(12);
    obj.layout5:setWidth(116);
    obj.layout5:setHeight(115);
    obj.layout5:setName("layout5");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout5);
    obj.edit17:setAlign("top");
    obj.edit17:setMargins({left=30, right=30});
    obj.edit17:setField("atributos.agilidade");
    obj.edit17:setHeight(30);
    obj.edit17:setType("number");
    obj.edit17:setMin(0);
    obj.edit17:setName("edit17");
    obj.edit17:setTransparent(true);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontSize(15);
    obj.edit17:setFontColor("white");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart19);
    obj.label23:setFrameRegion("modificador");
    obj.label23:setField("atributos.modagilidadestr");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setVertTextAlign("center");
    obj.label23:setFontSize(36);
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setName("label23");
    obj.label23:setFontColor("white");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart19);
    obj.label24:setFrameRegion("titulo");
    obj.label24:setText("AGILIDADE");
    obj.label24:setVertTextAlign("center");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");
    obj.label24:setFontColor("white");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowPart19);
    obj.flowLayout6:setFrameRegion("RegiaoDePericias");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setLineSpacing(0);
    obj.flowLayout6:setHorzAlign("leading");
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout6:setVertAlign("leading");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout6);
    obj.flowPart20:setMinWidth(206);
    obj.flowPart20:setMaxWidth(250);
    obj.flowPart20:setHeight(17);
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart20:setVertAlign("leading");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.flowPart20);
    obj.imageCheckBox3:setAlign("left");
    obj.imageCheckBox3:setWidth(20);
    obj.imageCheckBox3:setMargins({});
    obj.imageCheckBox3:setField("pericias.furtividade");
    obj.imageCheckBox3:setOptimize(false);
    obj.imageCheckBox3:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox3:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox3:setName("imageCheckBox3");
    obj.imageCheckBox3:setHeight(20);

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart20);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(52);
    obj.layout6:setMargins({left=2});
    obj.layout6:setName("layout6");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout6);
    obj.label25:setField("pericias.bonusfurtividadestr");
    obj.label25:setAlign("client");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setVertTextAlign("trailing");
    obj.label25:setTextTrimming("none");
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout6);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setAlign("bottom");
    obj.horzLine3:setName("horzLine3");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart20);
    obj.label26:setAlign("client");
    obj.label26:setText("Furtividade");
    obj.label26:setVertTextAlign("trailing");
    obj.label26:setMargins({left=5});
    obj.label26:setAutoSize(true);
    obj.label26:setWordWrap(false);
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowLayout6);
    obj.dataLink6:setFields({'atributos.modagilidade', 'bonusProficiencia', 'pericias.furtividade'});
    obj.dataLink6:setName("dataLink6");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout6);
    obj.flowPart21:setMinWidth(206);
    obj.flowPart21:setMaxWidth(250);
    obj.flowPart21:setHeight(17);
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart21:setVertAlign("leading");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.flowPart21);
    obj.imageCheckBox4:setAlign("left");
    obj.imageCheckBox4:setWidth(20);
    obj.imageCheckBox4:setMargins({});
    obj.imageCheckBox4:setField("pericias.ladinagem");
    obj.imageCheckBox4:setOptimize(false);
    obj.imageCheckBox4:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox4:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox4:setName("imageCheckBox4");
    obj.imageCheckBox4:setHeight(20);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart21);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(52);
    obj.layout7:setMargins({left=2});
    obj.layout7:setName("layout7");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout7);
    obj.label27:setField("pericias.bonusladinagemstr");
    obj.label27:setAlign("client");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setVertTextAlign("trailing");
    obj.label27:setTextTrimming("none");
    obj.label27:setName("label27");
    obj.label27:setFontColor("white");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout7);
    obj.horzLine4:setStrokeColor("white");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setAlign("bottom");
    obj.horzLine4:setName("horzLine4");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart21);
    obj.label28:setAlign("client");
    obj.label28:setText("Ladinagem");
    obj.label28:setVertTextAlign("trailing");
    obj.label28:setMargins({left=5});
    obj.label28:setAutoSize(true);
    obj.label28:setWordWrap(false);
    obj.label28:setName("label28");
    obj.label28:setFontColor("white");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowLayout6);
    obj.dataLink7:setFields({'atributos.modagilidade', 'bonusProficiencia', 'pericias.ladinagem'});
    obj.dataLink7:setName("dataLink7");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout6);
    obj.flowPart22:setMinWidth(206);
    obj.flowPart22:setMaxWidth(250);
    obj.flowPart22:setHeight(17);
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart22:setVertAlign("leading");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.flowPart22);
    obj.imageCheckBox5:setAlign("left");
    obj.imageCheckBox5:setWidth(20);
    obj.imageCheckBox5:setMargins({});
    obj.imageCheckBox5:setField("pericias.percepcao");
    obj.imageCheckBox5:setOptimize(false);
    obj.imageCheckBox5:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox5:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox5:setName("imageCheckBox5");
    obj.imageCheckBox5:setHeight(20);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowPart22);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(52);
    obj.layout8:setMargins({left=2});
    obj.layout8:setName("layout8");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout8);
    obj.label29:setField("pericias.bonuspercepcaostr");
    obj.label29:setAlign("client");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setVertTextAlign("trailing");
    obj.label29:setTextTrimming("none");
    obj.label29:setName("label29");
    obj.label29:setFontColor("white");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout8);
    obj.horzLine5:setStrokeColor("white");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setAlign("bottom");
    obj.horzLine5:setName("horzLine5");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart22);
    obj.label30:setAlign("client");
    obj.label30:setText("Percepção");
    obj.label30:setVertTextAlign("trailing");
    obj.label30:setMargins({left=5});
    obj.label30:setAutoSize(true);
    obj.label30:setWordWrap(false);
    obj.label30:setName("label30");
    obj.label30:setFontColor("white");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout6);
    obj.dataLink8:setFields({'atributos.modagilidade', 'bonusProficiencia', 'pericias.percepcao'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.fraLayAtributos);
    obj.dataLink9:setFields({'atributos.constituicao','atributos.amplificador'});
    obj.dataLink9:setName("dataLink9");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.fraLayAtributos);
    obj.flowPart23:setHeight(140);
    obj.flowPart23:setMinWidth(320);
    obj.flowPart23:setMaxWidth(420);
    obj.flowPart23:setMinScaledWidth(305);
    obj.flowPart23:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart23:setVertAlign("leading");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart23);
    obj.layout9:setLeft(6);
    obj.layout9:setTop(12);
    obj.layout9:setWidth(116);
    obj.layout9:setHeight(115);
    obj.layout9:setName("layout9");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout9);
    obj.edit18:setAlign("top");
    obj.edit18:setMargins({left=30, right=30});
    obj.edit18:setField("atributos.constituicao");
    obj.edit18:setHeight(30);
    obj.edit18:setType("number");
    obj.edit18:setMin(0);
    obj.edit18:setName("edit18");
    obj.edit18:setTransparent(true);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setFontSize(15);
    obj.edit18:setFontColor("white");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart23);
    obj.label31:setFrameRegion("modificador");
    obj.label31:setField("atributos.modconstituicaostr");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setVertTextAlign("center");
    obj.label31:setFontSize(36);
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart23);
    obj.label32:setFrameRegion("titulo");
    obj.label32:setText("CONSTITUIÇÃO");
    obj.label32:setVertTextAlign("center");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowPart23);
    obj.flowLayout7:setFrameRegion("RegiaoDePericias");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setLineSpacing(0);
    obj.flowLayout7:setHorzAlign("leading");
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout7:setVertAlign("leading");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout7);
    obj.flowPart24:setMinWidth(206);
    obj.flowPart24:setMaxWidth(250);
    obj.flowPart24:setHeight(17);
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart24:setVertAlign("leading");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.flowPart24);
    obj.imageCheckBox6:setAlign("left");
    obj.imageCheckBox6:setWidth(20);
    obj.imageCheckBox6:setMargins({});
    obj.imageCheckBox6:setField("pericias.tr");
    obj.imageCheckBox6:setOptimize(false);
    obj.imageCheckBox6:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox6:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox6:setName("imageCheckBox6");
    obj.imageCheckBox6:setHeight(20);

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowPart24);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(52);
    obj.layout10:setMargins({left=2});
    obj.layout10:setName("layout10");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout10);
    obj.label33:setField("pericias.bonustrstr");
    obj.label33:setAlign("client");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setVertTextAlign("trailing");
    obj.label33:setTextTrimming("none");
    obj.label33:setName("label33");
    obj.label33:setFontColor("white");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout10);
    obj.horzLine6:setStrokeColor("white");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setAlign("bottom");
    obj.horzLine6:setName("horzLine6");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart24);
    obj.label34:setAlign("client");
    obj.label34:setText("Teste de Resistencia");
    obj.label34:setVertTextAlign("trailing");
    obj.label34:setMargins({left=5});
    obj.label34:setAutoSize(true);
    obj.label34:setWordWrap(false);
    obj.label34:setName("label34");
    obj.label34:setFontColor("white");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowLayout7);
    obj.dataLink10:setFields({'atributos.modconstituicao', 'bonusProficiencia', 'pericias.tr'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.fraLayAtributos);
    obj.dataLink11:setFields({'atributos.inteligencia','atributos.amplificador'});
    obj.dataLink11:setName("dataLink11");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.fraLayAtributos);
    obj.flowPart25:setHeight(140);
    obj.flowPart25:setMinWidth(320);
    obj.flowPart25:setMaxWidth(420);
    obj.flowPart25:setMinScaledWidth(305);
    obj.flowPart25:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart25:setVertAlign("leading");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart25);
    obj.layout11:setLeft(6);
    obj.layout11:setTop(12);
    obj.layout11:setWidth(116);
    obj.layout11:setHeight(115);
    obj.layout11:setName("layout11");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout11);
    obj.edit19:setAlign("top");
    obj.edit19:setMargins({left=30, right=30});
    obj.edit19:setField("atributos.inteligencia");
    obj.edit19:setHeight(30);
    obj.edit19:setType("number");
    obj.edit19:setMin(0);
    obj.edit19:setName("edit19");
    obj.edit19:setTransparent(true);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(15);
    obj.edit19:setFontColor("white");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart25);
    obj.label35:setFrameRegion("modificador");
    obj.label35:setField("atributos.modinteligenciastr");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setVertTextAlign("center");
    obj.label35:setFontSize(36);
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setName("label35");
    obj.label35:setFontColor("white");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart25);
    obj.label36:setFrameRegion("titulo");
    obj.label36:setText("INTELIGÊNCIA");
    obj.label36:setVertTextAlign("center");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");
    obj.label36:setFontColor("white");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowPart25);
    obj.flowLayout8:setFrameRegion("RegiaoDePericias");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setLineSpacing(0);
    obj.flowLayout8:setHorzAlign("leading");
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout8:setVertAlign("leading");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout8);
    obj.flowPart26:setMinWidth(206);
    obj.flowPart26:setMaxWidth(250);
    obj.flowPart26:setHeight(17);
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart26:setVertAlign("leading");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.flowPart26);
    obj.imageCheckBox7:setAlign("left");
    obj.imageCheckBox7:setWidth(20);
    obj.imageCheckBox7:setMargins({});
    obj.imageCheckBox7:setField("pericias.arcanismo");
    obj.imageCheckBox7:setOptimize(false);
    obj.imageCheckBox7:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox7:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox7:setName("imageCheckBox7");
    obj.imageCheckBox7:setHeight(20);

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart26);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(52);
    obj.layout12:setMargins({left=2});
    obj.layout12:setName("layout12");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout12);
    obj.label37:setField("pericias.bonusarcanismostr");
    obj.label37:setAlign("client");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setVertTextAlign("trailing");
    obj.label37:setTextTrimming("none");
    obj.label37:setName("label37");
    obj.label37:setFontColor("white");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout12);
    obj.horzLine7:setStrokeColor("white");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setAlign("bottom");
    obj.horzLine7:setName("horzLine7");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart26);
    obj.label38:setAlign("client");
    obj.label38:setText("Arcanismo");
    obj.label38:setVertTextAlign("trailing");
    obj.label38:setMargins({left=5});
    obj.label38:setAutoSize(true);
    obj.label38:setWordWrap(false);
    obj.label38:setName("label38");
    obj.label38:setFontColor("white");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.flowLayout8);
    obj.dataLink12:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.arcanismo'});
    obj.dataLink12:setName("dataLink12");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout8);
    obj.flowPart27:setMinWidth(206);
    obj.flowPart27:setMaxWidth(250);
    obj.flowPart27:setHeight(17);
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart27:setVertAlign("leading");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.flowPart27);
    obj.imageCheckBox8:setAlign("left");
    obj.imageCheckBox8:setWidth(20);
    obj.imageCheckBox8:setMargins({});
    obj.imageCheckBox8:setField("pericias.investigacao");
    obj.imageCheckBox8:setOptimize(false);
    obj.imageCheckBox8:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox8:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox8:setName("imageCheckBox8");
    obj.imageCheckBox8:setHeight(20);

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart27);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(52);
    obj.layout13:setMargins({left=2});
    obj.layout13:setName("layout13");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout13);
    obj.label39:setField("pericias.bonusinvestigacaostr");
    obj.label39:setAlign("client");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setVertTextAlign("trailing");
    obj.label39:setTextTrimming("none");
    obj.label39:setName("label39");
    obj.label39:setFontColor("white");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout13);
    obj.horzLine8:setStrokeColor("white");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setAlign("bottom");
    obj.horzLine8:setName("horzLine8");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart27);
    obj.label40:setAlign("client");
    obj.label40:setText("Investigação");
    obj.label40:setVertTextAlign("trailing");
    obj.label40:setMargins({left=5});
    obj.label40:setAutoSize(true);
    obj.label40:setWordWrap(false);
    obj.label40:setName("label40");
    obj.label40:setFontColor("white");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.flowLayout8);
    obj.dataLink13:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.investigacao'});
    obj.dataLink13:setName("dataLink13");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout8);
    obj.flowPart28:setMinWidth(206);
    obj.flowPart28:setMaxWidth(250);
    obj.flowPart28:setHeight(17);
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart28:setVertAlign("leading");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.flowPart28);
    obj.imageCheckBox9:setAlign("left");
    obj.imageCheckBox9:setWidth(20);
    obj.imageCheckBox9:setMargins({});
    obj.imageCheckBox9:setField("pericias.sobrevivencia");
    obj.imageCheckBox9:setOptimize(false);
    obj.imageCheckBox9:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox9:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox9:setName("imageCheckBox9");
    obj.imageCheckBox9:setHeight(20);

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart28);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(52);
    obj.layout14:setMargins({left=2});
    obj.layout14:setName("layout14");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout14);
    obj.label41:setField("pericias.bonussobrevivenciastr");
    obj.label41:setAlign("client");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("trailing");
    obj.label41:setTextTrimming("none");
    obj.label41:setName("label41");
    obj.label41:setFontColor("white");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout14);
    obj.horzLine9:setStrokeColor("white");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setAlign("bottom");
    obj.horzLine9:setName("horzLine9");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart28);
    obj.label42:setAlign("client");
    obj.label42:setText("Sobrevivência");
    obj.label42:setVertTextAlign("trailing");
    obj.label42:setMargins({left=5});
    obj.label42:setAutoSize(true);
    obj.label42:setWordWrap(false);
    obj.label42:setName("label42");
    obj.label42:setFontColor("white");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.flowLayout8);
    obj.dataLink14:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.sobrevivencia'});
    obj.dataLink14:setName("dataLink14");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout8);
    obj.flowPart29:setMinWidth(206);
    obj.flowPart29:setMaxWidth(250);
    obj.flowPart29:setHeight(17);
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart29:setVertAlign("leading");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.flowPart29);
    obj.imageCheckBox10:setAlign("left");
    obj.imageCheckBox10:setWidth(20);
    obj.imageCheckBox10:setMargins({});
    obj.imageCheckBox10:setField("pericias.intuicao");
    obj.imageCheckBox10:setOptimize(false);
    obj.imageCheckBox10:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox10:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox10:setName("imageCheckBox10");
    obj.imageCheckBox10:setHeight(20);

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart29);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(52);
    obj.layout15:setMargins({left=2});
    obj.layout15:setName("layout15");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout15);
    obj.label43:setField("pericias.bonusintuicaostr");
    obj.label43:setAlign("client");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setVertTextAlign("trailing");
    obj.label43:setTextTrimming("none");
    obj.label43:setName("label43");
    obj.label43:setFontColor("white");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout15);
    obj.horzLine10:setStrokeColor("white");
    obj.horzLine10:setStrokeSize(1);
    obj.horzLine10:setAlign("bottom");
    obj.horzLine10:setName("horzLine10");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart29);
    obj.label44:setAlign("client");
    obj.label44:setText("Intuição");
    obj.label44:setVertTextAlign("trailing");
    obj.label44:setMargins({left=5});
    obj.label44:setAutoSize(true);
    obj.label44:setWordWrap(false);
    obj.label44:setName("label44");
    obj.label44:setFontColor("white");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.flowLayout8);
    obj.dataLink15:setFields({'atributos.modinteligencia', 'bonusProficiencia', 'pericias.intuicao'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.fraLayAtributos);
    obj.dataLink16:setFields({'atributos.sabedoria','atributos.amplificador'});
    obj.dataLink16:setName("dataLink16");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.fraLayAtributos);
    obj.flowPart30:setHeight(140);
    obj.flowPart30:setMinWidth(320);
    obj.flowPart30:setMaxWidth(420);
    obj.flowPart30:setMinScaledWidth(305);
    obj.flowPart30:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart30:setVertAlign("leading");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowPart30);
    obj.layout16:setLeft(6);
    obj.layout16:setTop(12);
    obj.layout16:setWidth(116);
    obj.layout16:setHeight(115);
    obj.layout16:setName("layout16");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setAlign("top");
    obj.edit20:setMargins({left=30, right=30});
    obj.edit20:setField("atributos.sabedoria");
    obj.edit20:setHeight(30);
    obj.edit20:setType("number");
    obj.edit20:setMin(0);
    obj.edit20:setName("edit20");
    obj.edit20:setTransparent(true);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setFontSize(15);
    obj.edit20:setFontColor("white");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart30);
    obj.label45:setFrameRegion("modificador");
    obj.label45:setField("atributos.modsabedoriastr");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setVertTextAlign("center");
    obj.label45:setFontSize(36);
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setName("label45");
    obj.label45:setFontColor("white");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart30);
    obj.label46:setFrameRegion("titulo");
    obj.label46:setText("SABEDORIA");
    obj.label46:setVertTextAlign("center");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");
    obj.label46:setFontColor("white");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowPart30);
    obj.flowLayout9:setFrameRegion("RegiaoDePericias");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setLineSpacing(0);
    obj.flowLayout9:setHorzAlign("leading");
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout9:setVertAlign("leading");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout9);
    obj.flowPart31:setMinWidth(206);
    obj.flowPart31:setMaxWidth(250);
    obj.flowPart31:setHeight(17);
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart31:setVertAlign("leading");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.flowPart31);
    obj.imageCheckBox11:setAlign("left");
    obj.imageCheckBox11:setWidth(20);
    obj.imageCheckBox11:setMargins({});
    obj.imageCheckBox11:setField("pericias.adestrarAnimais");
    obj.imageCheckBox11:setOptimize(false);
    obj.imageCheckBox11:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox11:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox11:setName("imageCheckBox11");
    obj.imageCheckBox11:setHeight(20);

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowPart31);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(52);
    obj.layout17:setMargins({left=2});
    obj.layout17:setName("layout17");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout17);
    obj.label47:setField("pericias.bonusadestrarAnimaisstr");
    obj.label47:setAlign("client");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("trailing");
    obj.label47:setTextTrimming("none");
    obj.label47:setName("label47");
    obj.label47:setFontColor("white");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout17);
    obj.horzLine11:setStrokeColor("white");
    obj.horzLine11:setStrokeSize(1);
    obj.horzLine11:setAlign("bottom");
    obj.horzLine11:setName("horzLine11");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart31);
    obj.label48:setAlign("client");
    obj.label48:setText("Adestrar Animais");
    obj.label48:setVertTextAlign("trailing");
    obj.label48:setMargins({left=5});
    obj.label48:setAutoSize(true);
    obj.label48:setWordWrap(false);
    obj.label48:setName("label48");
    obj.label48:setFontColor("white");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.flowLayout9);
    obj.dataLink17:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.adestrarAnimais'});
    obj.dataLink17:setName("dataLink17");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout9);
    obj.flowPart32:setMinWidth(206);
    obj.flowPart32:setMaxWidth(250);
    obj.flowPart32:setHeight(17);
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart32:setVertAlign("leading");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.flowPart32);
    obj.imageCheckBox12:setAlign("left");
    obj.imageCheckBox12:setWidth(20);
    obj.imageCheckBox12:setMargins({});
    obj.imageCheckBox12:setField("pericias.religiao");
    obj.imageCheckBox12:setOptimize(false);
    obj.imageCheckBox12:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox12:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox12:setName("imageCheckBox12");
    obj.imageCheckBox12:setHeight(20);

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowPart32);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(52);
    obj.layout18:setMargins({left=2});
    obj.layout18:setName("layout18");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout18);
    obj.label49:setField("pericias.bonusreligiaostr");
    obj.label49:setAlign("client");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setVertTextAlign("trailing");
    obj.label49:setTextTrimming("none");
    obj.label49:setName("label49");
    obj.label49:setFontColor("white");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout18);
    obj.horzLine12:setStrokeColor("white");
    obj.horzLine12:setStrokeSize(1);
    obj.horzLine12:setAlign("bottom");
    obj.horzLine12:setName("horzLine12");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart32);
    obj.label50:setAlign("client");
    obj.label50:setText("Religião");
    obj.label50:setVertTextAlign("trailing");
    obj.label50:setMargins({left=5});
    obj.label50:setAutoSize(true);
    obj.label50:setWordWrap(false);
    obj.label50:setName("label50");
    obj.label50:setFontColor("white");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.flowLayout9);
    obj.dataLink18:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.religiao'});
    obj.dataLink18:setName("dataLink18");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout9);
    obj.flowPart33:setMinWidth(206);
    obj.flowPart33:setMaxWidth(250);
    obj.flowPart33:setHeight(17);
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart33:setVertAlign("leading");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.flowPart33);
    obj.imageCheckBox13:setAlign("left");
    obj.imageCheckBox13:setWidth(20);
    obj.imageCheckBox13:setMargins({});
    obj.imageCheckBox13:setField("pericias.medicina");
    obj.imageCheckBox13:setOptimize(false);
    obj.imageCheckBox13:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox13:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox13:setName("imageCheckBox13");
    obj.imageCheckBox13:setHeight(20);

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flowPart33);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(52);
    obj.layout19:setMargins({left=2});
    obj.layout19:setName("layout19");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout19);
    obj.label51:setField("pericias.bonusmedicinastr");
    obj.label51:setAlign("client");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setVertTextAlign("trailing");
    obj.label51:setTextTrimming("none");
    obj.label51:setName("label51");
    obj.label51:setFontColor("white");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.layout19);
    obj.horzLine13:setStrokeColor("white");
    obj.horzLine13:setStrokeSize(1);
    obj.horzLine13:setAlign("bottom");
    obj.horzLine13:setName("horzLine13");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart33);
    obj.label52:setAlign("client");
    obj.label52:setText("Medicina");
    obj.label52:setVertTextAlign("trailing");
    obj.label52:setMargins({left=5});
    obj.label52:setAutoSize(true);
    obj.label52:setWordWrap(false);
    obj.label52:setName("label52");
    obj.label52:setFontColor("white");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.flowLayout9);
    obj.dataLink19:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.medicina'});
    obj.dataLink19:setName("dataLink19");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout9);
    obj.flowPart34:setMinWidth(206);
    obj.flowPart34:setMaxWidth(250);
    obj.flowPart34:setHeight(17);
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart34:setVertAlign("leading");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.flowPart34);
    obj.imageCheckBox14:setAlign("left");
    obj.imageCheckBox14:setWidth(20);
    obj.imageCheckBox14:setMargins({});
    obj.imageCheckBox14:setField("pericias.historia");
    obj.imageCheckBox14:setOptimize(false);
    obj.imageCheckBox14:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox14:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox14:setName("imageCheckBox14");
    obj.imageCheckBox14:setHeight(20);

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flowPart34);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(52);
    obj.layout20:setMargins({left=2});
    obj.layout20:setName("layout20");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout20);
    obj.label53:setField("pericias.bonushistoriastr");
    obj.label53:setAlign("client");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("trailing");
    obj.label53:setTextTrimming("none");
    obj.label53:setName("label53");
    obj.label53:setFontColor("white");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout20);
    obj.horzLine14:setStrokeColor("white");
    obj.horzLine14:setStrokeSize(1);
    obj.horzLine14:setAlign("bottom");
    obj.horzLine14:setName("horzLine14");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart34);
    obj.label54:setAlign("client");
    obj.label54:setText("Historia");
    obj.label54:setVertTextAlign("trailing");
    obj.label54:setMargins({left=5});
    obj.label54:setAutoSize(true);
    obj.label54:setWordWrap(false);
    obj.label54:setName("label54");
    obj.label54:setFontColor("white");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.flowLayout9);
    obj.dataLink20:setFields({'atributos.modsabedoria', 'bonusProficiencia', 'pericias.historia'});
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.fraLayAtributos);
    obj.dataLink21:setFields({'atributos.carisma','atributos.amplificador'});
    obj.dataLink21:setName("dataLink21");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.fraLayAtributos);
    obj.flowPart35:setHeight(140);
    obj.flowPart35:setMinWidth(320);
    obj.flowPart35:setMaxWidth(420);
    obj.flowPart35:setMinScaledWidth(305);
    obj.flowPart35:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart35:setVertAlign("leading");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.flowPart35);
    obj.layout21:setLeft(6);
    obj.layout21:setTop(12);
    obj.layout21:setWidth(116);
    obj.layout21:setHeight(115);
    obj.layout21:setName("layout21");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout21);
    obj.edit21:setAlign("top");
    obj.edit21:setMargins({left=30, right=30});
    obj.edit21:setField("atributos.carisma");
    obj.edit21:setHeight(30);
    obj.edit21:setType("number");
    obj.edit21:setMin(0);
    obj.edit21:setName("edit21");
    obj.edit21:setTransparent(true);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setFontSize(15);
    obj.edit21:setFontColor("white");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart35);
    obj.label55:setFrameRegion("modificador");
    obj.label55:setField("atributos.modcarismastr");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setVertTextAlign("center");
    obj.label55:setFontSize(36);
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setName("label55");
    obj.label55:setFontColor("white");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart35);
    obj.label56:setFrameRegion("titulo");
    obj.label56:setText("CARISMA");
    obj.label56:setVertTextAlign("center");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");
    obj.label56:setFontColor("white");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowPart35);
    obj.flowLayout10:setFrameRegion("RegiaoDePericias");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setLineSpacing(0);
    obj.flowLayout10:setHorzAlign("leading");
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout10:setVertAlign("leading");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout10);
    obj.flowPart36:setMinWidth(206);
    obj.flowPart36:setMaxWidth(250);
    obj.flowPart36:setHeight(17);
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart36:setVertAlign("leading");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.flowPart36);
    obj.imageCheckBox15:setAlign("left");
    obj.imageCheckBox15:setWidth(20);
    obj.imageCheckBox15:setMargins({});
    obj.imageCheckBox15:setField("pericias.atuacao");
    obj.imageCheckBox15:setOptimize(false);
    obj.imageCheckBox15:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox15:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox15:setName("imageCheckBox15");
    obj.imageCheckBox15:setHeight(20);

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.flowPart36);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(52);
    obj.layout22:setMargins({left=2});
    obj.layout22:setName("layout22");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout22);
    obj.label57:setField("pericias.bonusatuacaostr");
    obj.label57:setAlign("client");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setVertTextAlign("trailing");
    obj.label57:setTextTrimming("none");
    obj.label57:setName("label57");
    obj.label57:setFontColor("white");

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout22);
    obj.horzLine15:setStrokeColor("white");
    obj.horzLine15:setStrokeSize(1);
    obj.horzLine15:setAlign("bottom");
    obj.horzLine15:setName("horzLine15");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart36);
    obj.label58:setAlign("client");
    obj.label58:setText("Atuação");
    obj.label58:setVertTextAlign("trailing");
    obj.label58:setMargins({left=5});
    obj.label58:setAutoSize(true);
    obj.label58:setWordWrap(false);
    obj.label58:setName("label58");
    obj.label58:setFontColor("white");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.flowLayout10);
    obj.dataLink22:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.atuacao'});
    obj.dataLink22:setName("dataLink22");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout10);
    obj.flowPart37:setMinWidth(206);
    obj.flowPart37:setMaxWidth(250);
    obj.flowPart37:setHeight(17);
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart37:setVertAlign("leading");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.flowPart37);
    obj.imageCheckBox16:setAlign("left");
    obj.imageCheckBox16:setWidth(20);
    obj.imageCheckBox16:setMargins({});
    obj.imageCheckBox16:setField("pericias.enganacao");
    obj.imageCheckBox16:setOptimize(false);
    obj.imageCheckBox16:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox16:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox16:setName("imageCheckBox16");
    obj.imageCheckBox16:setHeight(20);

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.flowPart37);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(52);
    obj.layout23:setMargins({left=2});
    obj.layout23:setName("layout23");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout23);
    obj.label59:setField("pericias.bonusenganacaostr");
    obj.label59:setAlign("client");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setVertTextAlign("trailing");
    obj.label59:setTextTrimming("none");
    obj.label59:setName("label59");
    obj.label59:setFontColor("white");

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout23);
    obj.horzLine16:setStrokeColor("white");
    obj.horzLine16:setStrokeSize(1);
    obj.horzLine16:setAlign("bottom");
    obj.horzLine16:setName("horzLine16");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart37);
    obj.label60:setAlign("client");
    obj.label60:setText("Enganação");
    obj.label60:setVertTextAlign("trailing");
    obj.label60:setMargins({left=5});
    obj.label60:setAutoSize(true);
    obj.label60:setWordWrap(false);
    obj.label60:setName("label60");
    obj.label60:setFontColor("white");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.flowLayout10);
    obj.dataLink23:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.enganacao'});
    obj.dataLink23:setName("dataLink23");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout10);
    obj.flowPart38:setMinWidth(206);
    obj.flowPart38:setMaxWidth(250);
    obj.flowPart38:setHeight(17);
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart38:setVertAlign("leading");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.flowPart38);
    obj.imageCheckBox17:setAlign("left");
    obj.imageCheckBox17:setWidth(20);
    obj.imageCheckBox17:setMargins({});
    obj.imageCheckBox17:setField("pericias.intimidacao");
    obj.imageCheckBox17:setOptimize(false);
    obj.imageCheckBox17:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox17:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox17:setName("imageCheckBox17");
    obj.imageCheckBox17:setHeight(20);

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.flowPart38);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(52);
    obj.layout24:setMargins({left=2});
    obj.layout24:setName("layout24");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout24);
    obj.label61:setField("pericias.bonusintimidacaostr");
    obj.label61:setAlign("client");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setVertTextAlign("trailing");
    obj.label61:setTextTrimming("none");
    obj.label61:setName("label61");
    obj.label61:setFontColor("white");

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.layout24);
    obj.horzLine17:setStrokeColor("white");
    obj.horzLine17:setStrokeSize(1);
    obj.horzLine17:setAlign("bottom");
    obj.horzLine17:setName("horzLine17");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart38);
    obj.label62:setAlign("client");
    obj.label62:setText("Intimidação");
    obj.label62:setVertTextAlign("trailing");
    obj.label62:setMargins({left=5});
    obj.label62:setAutoSize(true);
    obj.label62:setWordWrap(false);
    obj.label62:setName("label62");
    obj.label62:setFontColor("white");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.flowLayout10);
    obj.dataLink24:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.intimidacao'});
    obj.dataLink24:setName("dataLink24");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout10);
    obj.flowPart39:setMinWidth(206);
    obj.flowPart39:setMaxWidth(250);
    obj.flowPart39:setHeight(17);
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart39:setVertAlign("leading");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.flowPart39);
    obj.imageCheckBox18:setAlign("left");
    obj.imageCheckBox18:setWidth(20);
    obj.imageCheckBox18:setMargins({});
    obj.imageCheckBox18:setField("pericias.persuasao");
    obj.imageCheckBox18:setOptimize(false);
    obj.imageCheckBox18:setImageChecked("images/checkbox1_checked.png");
    obj.imageCheckBox18:setImageUnchecked("images/checkbox1_unchecked.png");
    obj.imageCheckBox18:setName("imageCheckBox18");
    obj.imageCheckBox18:setHeight(20);

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flowPart39);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(52);
    obj.layout25:setMargins({left=2});
    obj.layout25:setName("layout25");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout25);
    obj.label63:setField("pericias.bonuspersuasaostr");
    obj.label63:setAlign("client");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setVertTextAlign("trailing");
    obj.label63:setTextTrimming("none");
    obj.label63:setName("label63");
    obj.label63:setFontColor("white");

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.layout25);
    obj.horzLine18:setStrokeColor("white");
    obj.horzLine18:setStrokeSize(1);
    obj.horzLine18:setAlign("bottom");
    obj.horzLine18:setName("horzLine18");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart39);
    obj.label64:setAlign("client");
    obj.label64:setText("Persuasão");
    obj.label64:setVertTextAlign("trailing");
    obj.label64:setMargins({left=5});
    obj.label64:setAutoSize(true);
    obj.label64:setWordWrap(false);
    obj.label64:setName("label64");
    obj.label64:setFontColor("white");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.flowLayout10);
    obj.dataLink25:setFields({'atributos.modcarisma', 'bonusProficiencia', 'pericias.persuasao'});
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.fraLayAtributos);
    obj.dataLink26:setFields({'atributos.vontade','atributos.amplificador'});
    obj.dataLink26:setName("dataLink26");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.fraLayAtributos);
    obj.flowPart40:setHeight(140);
    obj.flowPart40:setMinWidth(320);
    obj.flowPart40:setMaxWidth(420);
    obj.flowPart40:setMinScaledWidth(305);
    obj.flowPart40:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart40:setVertAlign("leading");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowPart40);
    obj.layout26:setLeft(6);
    obj.layout26:setTop(12);
    obj.layout26:setWidth(116);
    obj.layout26:setHeight(115);
    obj.layout26:setName("layout26");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout26);
    obj.edit22:setAlign("top");
    obj.edit22:setMargins({left=30, right=30});
    obj.edit22:setField("atributos.vontade");
    obj.edit22:setHeight(30);
    obj.edit22:setType("number");
    obj.edit22:setMin(0);
    obj.edit22:setName("edit22");
    obj.edit22:setTransparent(true);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(15);
    obj.edit22:setFontColor("white");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart40);
    obj.label65:setFrameRegion("modificador");
    obj.label65:setField("atributos.modvontadestr");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setVertTextAlign("center");
    obj.label65:setFontSize(36);
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setName("label65");
    obj.label65:setFontColor("white");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart40);
    obj.label66:setFrameRegion("titulo");
    obj.label66:setText("VONTADE");
    obj.label66:setVertTextAlign("center");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");
    obj.label66:setFontColor("white");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowPart40);
    obj.flowLayout11:setFrameRegion("RegiaoDePericias");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setLineSpacing(0);
    obj.flowLayout11:setHorzAlign("leading");
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout11:setVertAlign("leading");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.fraLayAtributos);
    obj.dataLink27:setField("atributos.chanceCritico");
    obj.dataLink27:setName("dataLink27");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.fraLayAtributos);
    obj.flowPart41:setHeight(140);
    obj.flowPart41:setMinWidth(320);
    obj.flowPart41:setMaxWidth(420);
    obj.flowPart41:setMinScaledWidth(305);
    obj.flowPart41:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart41:setVertAlign("leading");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowPart41);
    obj.layout27:setLeft(6);
    obj.layout27:setTop(12);
    obj.layout27:setWidth(116);
    obj.layout27:setHeight(115);
    obj.layout27:setName("layout27");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout27);
    obj.edit23:setAlign("top");
    obj.edit23:setMargins({left=30, right=30});
    obj.edit23:setField("atributos.chanceCritico");
    obj.edit23:setHeight(30);
    obj.edit23:setType("number");
    obj.edit23:setMin(0);
    obj.edit23:setName("edit23");
    obj.edit23:setTransparent(true);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontSize(15);
    obj.edit23:setFontColor("white");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart41);
    obj.label67:setFrameRegion("modificador");
    obj.label67:setField("atributos.modchanceCriticostr");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setVertTextAlign("center");
    obj.label67:setFontSize(36);
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setName("label67");
    obj.label67:setFontColor("white");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart41);
    obj.label68:setFrameRegion("titulo");
    obj.label68:setText("CHANCE DE CRÍTICO");
    obj.label68:setVertTextAlign("center");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setFontSize(11);
    obj.label68:setName("label68");
    obj.label68:setFontColor("white");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.fraLayAtributos);
    obj.dataLink28:setField("atributos.danoCritico");
    obj.dataLink28:setName("dataLink28");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.fraLayAtributos);
    obj.flowPart42:setHeight(140);
    obj.flowPart42:setMinWidth(320);
    obj.flowPart42:setMaxWidth(420);
    obj.flowPart42:setMinScaledWidth(305);
    obj.flowPart42:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart42:setName("flowPart42");
    obj.flowPart42:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart42:setVertAlign("leading");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flowPart42);
    obj.layout28:setLeft(6);
    obj.layout28:setTop(12);
    obj.layout28:setWidth(116);
    obj.layout28:setHeight(115);
    obj.layout28:setName("layout28");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout28);
    obj.edit24:setAlign("top");
    obj.edit24:setMargins({left=30, right=30});
    obj.edit24:setField("atributos.danoCritico");
    obj.edit24:setHeight(30);
    obj.edit24:setType("number");
    obj.edit24:setMin(0);
    obj.edit24:setName("edit24");
    obj.edit24:setTransparent(true);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontSize(15);
    obj.edit24:setFontColor("white");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart42);
    obj.label69:setFrameRegion("modificador");
    obj.label69:setField("atributos.moddanoCriticostr");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setVertTextAlign("center");
    obj.label69:setFontSize(36);
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setName("label69");
    obj.label69:setFontColor("white");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart42);
    obj.label70:setFrameRegion("titulo");
    obj.label70:setText("DANO CRÍTICO");
    obj.label70:setVertTextAlign("center");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");
    obj.label70:setFontColor("white");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.fraLayAtributos);
    obj.dataLink29:setField("atributos.amplificador");
    obj.dataLink29:setName("dataLink29");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.fraLayAtributos);
    obj.flowPart43:setHeight(140);
    obj.flowPart43:setMinWidth(320);
    obj.flowPart43:setMaxWidth(420);
    obj.flowPart43:setMinScaledWidth(305);
    obj.flowPart43:setFrameStyle("frames/atributeFrame2/frame.xml");
    obj.flowPart43:setName("flowPart43");
    obj.flowPart43:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart43:setVertAlign("leading");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.flowPart43);
    obj.layout29:setLeft(6);
    obj.layout29:setTop(12);
    obj.layout29:setWidth(116);
    obj.layout29:setHeight(115);
    obj.layout29:setName("layout29");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout29);
    obj.edit25:setAlign("top");
    obj.edit25:setMargins({left=30, right=30});
    obj.edit25:setField("atributos.amplificador");
    obj.edit25:setHeight(30);
    obj.edit25:setType("number");
    obj.edit25:setMin(0);
    obj.edit25:setName("edit25");
    obj.edit25:setTransparent(true);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(15);
    obj.edit25:setFontColor("white");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart43);
    obj.label71:setFrameRegion("modificador");
    obj.label71:setField("atributos.modamplificadorstr");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setVertTextAlign("center");
    obj.label71:setFontSize(36);
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setName("label71");
    obj.label71:setFontColor("white");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowPart43);
    obj.label72:setFrameRegion("titulo");
    obj.label72:setText("AMPLIFICADOR");
    obj.label72:setVertTextAlign("center");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");
    obj.label72:setFontColor("white");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.fraLayAtributos);
    obj.dataLink30:setFields({'atributos.modforca','atributos.moddestreza','atributos.modagilidade','atributos.modconstituicao','atributos.modinteligencia','atributos.modsabedoria','atributos.modcarisma','atributos.modvontade'});
    obj.dataLink30:setName("dataLink30");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.flowLayout3);
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setVertAlign("leading");
    obj.flowLayout12:setMaxControlsPerLine(2);
    obj.flowLayout12:setMaxWidth(600);
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setStepSizes({310, 360});
    obj.flowLayout12:setMinScaledWidth(300);
    obj.flowLayout12:setMaxScaledWidth(340);
    obj.flowLayout12:setAvoidScale(true);
    obj.flowLayout12:setMargins({left=1, right=1, top=2, bottom=2});

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowLayout12);
    obj.flowLayout13:setMinWidth(202);
    obj.flowLayout13:setMaxWidth(202);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setAvoidScale(false);
    obj.flowLayout13:setVertAlign("center");
    obj.flowLayout13:setHorzAlign("center");
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setMargins({left=1, right=1, top=2, bottom=2});

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowLayout13);
    obj.rectangle2:setWidth(202);
    obj.rectangle2:setHeight(602);
    obj.rectangle2:setPadding({left=1,right=1,top=1,bottom=1});
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setWidth(200);
    obj.image1:setHeight(600);
    obj.image1:setField("avatarHead");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setWidth(200);
    obj.image2:setHeight(600);
    obj.image2:setField("avatarBody");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle2);
    obj.image3:setWidth(200);
    obj.image3:setHeight(600);
    obj.image3:setField("avatarArms");
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle2);
    obj.image4:setWidth(200);
    obj.image4:setHeight(600);
    obj.image4:setField("avatarLegs");
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle2);
    obj.image5:setWidth(200);
    obj.image5:setHeight(600);
    obj.image5:setField("avatarBoot");
    obj.image5:setName("image5");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.flowLayout12);
    obj.flowLayout14:setMinWidth(202);
    obj.flowLayout14:setMaxWidth(202);
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setAvoidScale(false);
    obj.flowLayout14:setVertAlign("center");
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setName("flowLayout14");
    obj.flowLayout14:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowLayout14);
    obj.layout30:setLeft(202);
    obj.layout30:setWidth(200);
    obj.layout30:setHeight(602);
    obj.layout30:setName("layout30");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout30);
    obj.label73:setAlign("top");
    obj.label73:setHeight(25);
    obj.label73:setText("Capacete");
    obj.label73:setName("label73");
    obj.label73:setFontColor("white");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout30);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setItems({'Água','Fogo','Raio','Ar','Gelo','Lava','Chaos','Veneno','Luz','Escuridão','Físico','Magico','Nenhum'});
    obj.comboBox1:setValues({'head/Agua.png','head/Fogo.png','head/Raio.png','head/Ar.png','head/Gelo.png','head/Lava.png','head/Chaos.png','head/Veneno.png','head/Luz.png','head/Escuridao.png','head/Fisico.png','head/Magico.png','head/'});
    obj.comboBox1:setField("cabecaComboBox");
    obj.comboBox1:setName("comboBox1");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout30);
    obj.edit26:setAlign("top");
    obj.edit26:setHeight(25);
    obj.edit26:setField("cabecaEdit");
    obj.edit26:setName("edit26");
    obj.edit26:setFontSize(15);
    obj.edit26:setFontColor("white");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout30);
    obj.dataLink31:setField("cabecaComboBox");
    obj.dataLink31:setName("dataLink31");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout30);
    obj.label74:setAlign("top");
    obj.label74:setHeight(25);
    obj.label74:setText("Peitoral");
    obj.label74:setName("label74");
    obj.label74:setFontColor("white");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout30);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setItems({'Água','Fogo','Raio','Ar','Gelo','Lava','Chaos','Veneno','Luz','Escuridão','Físico','Magico','Nenhum'});
    obj.comboBox2:setValues({'body/Agua.png','body/Fogo.png','body/Raio.png','body/Ar.png','body/Gelo.png','body/Lava.png','body/Chaos.png','body/Veneno.png','body/Luz.png','body/Escuridao.png','body/Fisico.png','body/Magico.png','body/'});
    obj.comboBox2:setField("corpoComboBox");
    obj.comboBox2:setName("comboBox2");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout30);
    obj.edit27:setAlign("top");
    obj.edit27:setHeight(25);
    obj.edit27:setField("corpoEdit");
    obj.edit27:setName("edit27");
    obj.edit27:setFontSize(15);
    obj.edit27:setFontColor("white");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout30);
    obj.dataLink32:setField("corpoComboBox");
    obj.dataLink32:setName("dataLink32");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout30);
    obj.label75:setAlign("top");
    obj.label75:setHeight(25);
    obj.label75:setText("Luva");
    obj.label75:setName("label75");
    obj.label75:setFontColor("white");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout30);
    obj.comboBox3:setAlign("top");
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setItems({'Água','Fogo','Raio','Ar','Gelo','Lava','Chaos','Veneno','Luz','Escuridão','Físico','Magico','Nenhum'});
    obj.comboBox3:setValues({'arms/Agua.png','arms/Fogo.png','arms/Raio.png','arms/Ar.png','arms/Gelo.png','arms/Lava.png','arms/Chaos.png','arms/Veneno.png','arms/Luz.png','arms/Escuridao.png','arms/Fisico.png','arms/Magico.png','arms/'});
    obj.comboBox3:setField("bracosComboBox");
    obj.comboBox3:setName("comboBox3");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout30);
    obj.edit28:setAlign("top");
    obj.edit28:setHeight(25);
    obj.edit28:setField("bracosEdit");
    obj.edit28:setName("edit28");
    obj.edit28:setFontSize(15);
    obj.edit28:setFontColor("white");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout30);
    obj.dataLink33:setField("bracosComboBox");
    obj.dataLink33:setName("dataLink33");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout30);
    obj.label76:setAlign("top");
    obj.label76:setHeight(25);
    obj.label76:setText("Calça");
    obj.label76:setName("label76");
    obj.label76:setFontColor("white");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout30);
    obj.comboBox4:setAlign("top");
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setItems({'Água','Fogo','Raio','Ar','Gelo','Lava','Chaos','Veneno','Luz','Escuridão','Físico','Magico','Nenhum'});
    obj.comboBox4:setValues({'legs/Agua.png','legs/Fogo.png','legs/Raio.png','legs/Ar.png','legs/Gelo.png','legs/Lava.png','legs/Chaos.png','legs/Veneno.png','legs/Luz.png','legs/Escuridao.png','legs/Fisico.png','legs/Magico.png','legs/'});
    obj.comboBox4:setField("pernasComboBox");
    obj.comboBox4:setName("comboBox4");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout30);
    obj.edit29:setAlign("top");
    obj.edit29:setHeight(25);
    obj.edit29:setField("pernasEdit");
    obj.edit29:setName("edit29");
    obj.edit29:setFontSize(15);
    obj.edit29:setFontColor("white");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout30);
    obj.dataLink34:setField("pernasComboBox");
    obj.dataLink34:setName("dataLink34");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout30);
    obj.label77:setAlign("top");
    obj.label77:setHeight(25);
    obj.label77:setText("Bota");
    obj.label77:setName("label77");
    obj.label77:setFontColor("white");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout30);
    obj.comboBox5:setAlign("top");
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setItems({'Água','Fogo','Raio','Ar','Gelo','Lava','Chaos','Veneno','Luz','Escuridão','Físico','Magico','Nenhum'});
    obj.comboBox5:setValues({'boot/Agua.png','boot/Fogo.png','boot/Raio.png','boot/Ar.png','boot/Gelo.png','boot/Lava.png','boot/Chaos.png','boot/Veneno.png','boot/Luz.png','boot/Escuridao.png','boot/Fisico.png','boot/Magico.png','boot/'});
    obj.comboBox5:setField("pesComboBox");
    obj.comboBox5:setName("comboBox5");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout30);
    obj.edit30:setAlign("top");
    obj.edit30:setHeight(25);
    obj.edit30:setField("pesEdit");
    obj.edit30:setName("edit30");
    obj.edit30:setFontSize(15);
    obj.edit30:setFontColor("white");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout30);
    obj.dataLink35:setField("pesComboBox");
    obj.dataLink35:setName("dataLink35");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Equipamento");
    obj.tab2:setName("tab2");

    obj.equipamento = GUI.fromHandle(_obj_newObject("form"));
    obj.equipamento:setParent(obj.tab2);
    obj.equipamento:setName("equipamento");
    obj.equipamento:setWidth(700);
    obj.equipamento:setHeight(1000);
    obj.equipamento:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.equipamento);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.scrollBox2);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("equipamento");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pgcPrincipal);
    obj.tab3:setTitle("Habilidades");
    obj.tab3:setName("tab3");

    obj.habilidades = GUI.fromHandle(_obj_newObject("form"));
    obj.habilidades:setParent(obj.tab3);
    obj.habilidades:setName("habilidades");
    obj.habilidades:setWidth(700);
    obj.habilidades:setHeight(1000);
    obj.habilidades:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.habilidades);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.scrollBox3);
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setField("habilidades");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit2, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setName("richEdit2");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.pgcPrincipal);
    obj.tab4:setTitle("Extenção");
    obj.tab4:setName("tab4");

    obj.extencao = GUI.fromHandle(_obj_newObject("form"));
    obj.extencao:setParent(obj.tab4);
    obj.extencao:setName("extencao");
    obj.extencao:setWidth(700);
    obj.extencao:setHeight(1000);
    obj.extencao:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.extencao);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.scrollBox4);
    obj.richEdit3:setAlign("client");
    obj.richEdit3:setField("extencao");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit3, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "white");
    obj.richEdit3:setName("richEdit3");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.pgcPrincipal);
    obj.tab5:setTitle("Creditos");
    obj.tab5:setName("tab5");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab5);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				if node:getClassName() == "recordList" then
					children = rclKids(node);
					--write(children[1]:getClassName());

					children = rclKids(children[1]);
				end;
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
			end;

			function rclKids(rcl)
				local ret = {};
				local i;
				local childCount = _obj_getProp(rcl.handle, "ChildrenCount");
				local child;
				local childHandle;
				local idxDest = 1;
					
				for i = 0, childCount - 1, 1 do
					childHandle = _gui_getChild(rcl.handle, i);
					
					if (childHandle ~= nil) then							
						child = gui.fromHandle(childHandle);
						
						if (type(child) == "table") then							
							ret[idxDest] = child;
							idxDest = idxDest + 1;
						end
					end;	
				end
				
				return ret;
			end;

			local function findAllControls()
				local controlsList = {self};
				recursiveFindControls(self, controlsList);
				
				return controlsList;
			end;

			local function filterByClass(className, controls)
				local controlsFromClass = {};

				for i=1, #controls, 1 do
					if controls[i]:getClassName() == className then
						controlsFromClass[#controlsFromClass + 1] = controls[i];
					end;
				end;

				return controlsFromClass;
			end;

			local function findClass(className)
				local controls = findAllControls();
				return filterByClass(className, controls);
			end;

		


    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateCreditos);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox5);
    obj.image6:setLeft(0);
    obj.image6:setTop(0);
    obj.image6:setWidth(500);
    obj.image6:setHeight(500);
    obj.image6:setStyle("autoFit");
    obj.image6:setSRC("logo");
    obj.image6:setName("image6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox5);
    obj.image7:setLeft(550);
    obj.image7:setTop(0);
    obj.image7:setWidth(250);
    obj.image7:setHeight(250);
    obj.image7:setStyle("autoFit");
    obj.image7:setSRC("images/RPGmeister.jpg");
    obj.image7:setName("image7");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox5);
    obj.layout31:setLeft(850);
    obj.layout31:setTop(0);
    obj.layout31:setWidth(200);
    obj.layout31:setHeight(160);
    obj.layout31:setName("layout31");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout31);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout31);
    obj.label78:setLeft(0);
    obj.label78:setTop(10);
    obj.label78:setWidth(200);
    obj.label78:setHeight(20);
    obj.label78:setText("Programado por: ");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");
    obj.label78:setFontColor("white");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout31);
    obj.label79:setLeft(0);
    obj.label79:setTop(35);
    obj.label79:setWidth(200);
    obj.label79:setHeight(20);
    obj.label79:setText("Vinny (Ambesek)");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");
    obj.label79:setFontColor("white");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout31);
    obj.label80:setLeft(0);
    obj.label80:setTop(60);
    obj.label80:setWidth(200);
    obj.label80:setHeight(20);
    obj.label80:setText("Consultor: ");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");
    obj.label80:setFontColor("white");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox5);
    obj.layout32:setLeft(850);
    obj.layout32:setTop(200);
    obj.layout32:setWidth(200);
    obj.layout32:setHeight(150);
    obj.layout32:setName("layout32");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout32);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setHeight(150);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout32);
    obj.label81:setLeft(0);
    obj.label81:setTop(10);
    obj.label81:setWidth(80);
    obj.label81:setHeight(20);
    obj.label81:setText("Tema:");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");
    obj.label81:setFontColor("white");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout32);
    obj.comboBox6:setLeft(95);
    obj.comboBox6:setTop(10);
    obj.comboBox6:setWidth(90);
    obj.comboBox6:setField("theme");
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setItems({'Escuro', 'Claro'});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setName("comboBox6");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout32);
    obj.dataLink36:setField("theme");
    obj.dataLink36:setDefaultValue("Escuro");
    obj.dataLink36:setName("dataLink36");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout32);
    obj.label82:setLeft(0);
    obj.label82:setTop(35);
    obj.label82:setWidth(90);
    obj.label82:setHeight(20);
    obj.label82:setText("Cores: ");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");
    obj.label82:setFontColor("white");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout32);
    obj.label83:setLeft(0);
    obj.label83:setTop(60);
    obj.label83:setWidth(90);
    obj.label83:setHeight(20);
    obj.label83:setText("Fundo ");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");
    obj.label83:setFontColor("white");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout32);
    obj.comboBox7:setLeft(95);
    obj.comboBox7:setTop(60);
    obj.comboBox7:setWidth(90);
    obj.comboBox7:setField("colorBackground");
    obj.comboBox7:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox7:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout32);
    obj.dataLink37:setField("colorBackground");
    obj.dataLink37:setDefaultValue("#000000");
    obj.dataLink37:setName("dataLink37");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout32);
    obj.label84:setLeft(0);
    obj.label84:setTop(85);
    obj.label84:setWidth(90);
    obj.label84:setHeight(20);
    obj.label84:setText("Linhas ");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");
    obj.label84:setFontColor("white");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout32);
    obj.comboBox8:setLeft(95);
    obj.comboBox8:setTop(85);
    obj.comboBox8:setWidth(90);
    obj.comboBox8:setField("colorStroke");
    obj.comboBox8:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox8:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox8:setName("comboBox8");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout32);
    obj.dataLink38:setField("colorStroke");
    obj.dataLink38:setDefaultValue("#FFFFFF");
    obj.dataLink38:setName("dataLink38");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout32);
    obj.label85:setLeft(0);
    obj.label85:setTop(110);
    obj.label85:setWidth(90);
    obj.label85:setHeight(20);
    obj.label85:setText("Fonte ");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");
    obj.label85:setFontColor("white");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout32);
    obj.comboBox9:setLeft(95);
    obj.comboBox9:setTop(110);
    obj.comboBox9:setWidth(90);
    obj.comboBox9:setField("colorFont");
    obj.comboBox9:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox9:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox9:setName("comboBox9");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout32);
    obj.dataLink39:setField("colorFont");
    obj.dataLink39:setDefaultValue("#FFFFFF");
    obj.dataLink39:setName("dataLink39");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.scrollBox5);
    obj.label86:setLeft(555);
    obj.label86:setTop(275);
    obj.label86:setWidth(200);
    obj.label86:setHeight(20);
    obj.label86:setText("Versão Atual: ");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setField("versionInstalled");
    obj.label86:setName("label86");
    obj.label86:setFontColor("white");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.scrollBox5);
    obj.label87:setLeft(555);
    obj.label87:setTop(300);
    obj.label87:setWidth(200);
    obj.label87:setHeight(20);
    obj.label87:setText("Sua Versão: ");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setField("versionDownloaded");
    obj.label87:setName("label87");
    obj.label87:setFontColor("white");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox5);
    obj.checkBox1:setLeft(555);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox5);
    obj.button1:setLeft(555);
    obj.button1:setTop(350);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox5);
    obj.button2:setLeft(667);
    obj.button2:setTop(350);
    obj.button2:setWidth(100);
    obj.button2:setText("Atualizar");
    obj.button2:setName("button2");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.scrollBox5);
    obj.label88:setLeft(555);
    obj.label88:setTop(400);
    obj.label88:setWidth(200);
    obj.label88:setHeight(20);
    obj.label88:setText("Conheça as Mesas:");
    obj.label88:setName("label88");
    obj.label88:setFontColor("white");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox5);
    obj.button3:setLeft(555);
    obj.button3:setTop(425);
    obj.button3:setWidth(100);
    obj.button3:setText("RPGmeister");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox5);
    obj.button4:setLeft(667);
    obj.button4:setTop(425);
    obj.button4:setWidth(125);
    obj.button4:setText("");
    obj.button4:setName("button4");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				local numero = tonumber(sheet.atributos.forca);			
            				
            				if type(numero) == 'number' then
            					local amp = 1 + math.floor( (tonumber(sheet.atributos.amplificador) or 0) /10) /100;
            
            
            					local modificador = math.floor((math.floor(numero/2) - 5) * amp);
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

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				local numero = tonumber(sheet.atributos.destreza);			
            				
            				if type(numero) == 'number' then
            					local amp = 1 + math.floor( (tonumber(sheet.atributos.amplificador) or 0) /10) /100;
            
            
            					local modificador = math.floor((math.floor(numero/2) - 5) * amp);
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

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				local numero = tonumber(sheet.atributos.agilidade);			
            				
            				if type(numero) == 'number' then
            					local amp = 1 + math.floor( (tonumber(sheet.atributos.amplificador) or 0) /10) /100;
            
            
            					local modificador = math.floor((math.floor(numero/2) - 5) * amp);
            					sheet.atributos.modagilidade = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modagilidadestr = "+" .. modificador;
            					else	
            						sheet.atributos.modagilidadestr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modagilidade = nil;
            					sheet.atributos.modagilidadestr = nil;
            				end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modagilidade;
            								
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

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modagilidade;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.ladinagem or false;
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
            								
            								sheet.pericias.bonusladinagem	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonusladinagemstr = "+" .. valor;
            								else
            									sheet.pericias.bonusladinagemstr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonusladinagem = nil;
            								sheet.pericias.bonusladinagemstr = nil;
            							end;
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modagilidade;
            								
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

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				local numero = tonumber(sheet.atributos.constituicao);			
            				
            				if type(numero) == 'number' then
            					local amp = 1 + math.floor( (tonumber(sheet.atributos.amplificador) or 0) /10) /100;
            
            
            					local modificador = math.floor((math.floor(numero/2) - 5) * amp);
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

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local modificador;
            							local temPericia;
            									
            							if sheet.atributos ~= nil then
            								modificador = sheet.atributos.modconstituicao;
            								
            								if modificador ~= nil then
            									modificador = tonumber(modificador);
            								end;
            							else
            								modificador = nil;
            							end;
            							
            							if sheet.pericias ~= nil then
            								temPericia = sheet.pericias.tr or false;
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
            								
            								sheet.pericias.bonustr	= valor;
            								
            								if valor >= 0 then
            									sheet.pericias.bonustrstr = "+" .. valor;
            								else
            									sheet.pericias.bonustrstr = "-" .. math.abs(valor);
            								end;
            							else
            								sheet.pericias.bonustr = nil;
            								sheet.pericias.bonustrstr = nil;
            							end;
        end, obj);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				local numero = tonumber(sheet.atributos.inteligencia);			
            				
            				if type(numero) == 'number' then
            					local amp = 1 + math.floor( (tonumber(sheet.atributos.amplificador) or 0) /10) /100;
            
            
            					local modificador = math.floor((math.floor(numero/2) - 5) * amp);
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

    obj._e_event11 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event12 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event13 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event14 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event15 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				local numero = tonumber(sheet.atributos.sabedoria);			
            				
            				if type(numero) == 'number' then
            					local amp = 1 + math.floor( (tonumber(sheet.atributos.amplificador) or 0) /10) /100;
            
            
            					local modificador = math.floor((math.floor(numero/2) - 5) * amp);
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

    obj._e_event16 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event17 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event18 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event19 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event20 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				local numero = tonumber(sheet.atributos.carisma);			
            				
            				if type(numero) == 'number' then
            					local amp = 1 + math.floor( (tonumber(sheet.atributos.amplificador) or 0) /10) /100;
            
            
            					local modificador = math.floor((math.floor(numero/2) - 5) * amp);
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

    obj._e_event21 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event22 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event23 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event24 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event25 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				if type(sheet.atributos) ~= 'table' then
            					sheet.atributos = {};
            				end;
            
            				local numero = tonumber(sheet.atributos.vontade);			
            				
            				if type(numero) == 'number' then
            					local amp = 1 + math.floor( (tonumber(sheet.atributos.amplificador) or 0) /10) /100;
            
            
            					local modificador = math.floor((math.floor(numero/2) - 5) * amp);
            					sheet.atributos.modvontade = modificador;	
            				
            					if modificador >= 0 then
            						sheet.atributos.modvontadestr = "+" .. modificador;
            					else	
            						sheet.atributos.modvontadestr = "-" .. math.abs(modificador);
            					end;	
            				else
            					sheet.atributos.modvontade = nil;
            					sheet.atributos.modvontadestr = nil;
            				end;
        end, obj);

    obj._e_event26 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            							local numero;
            							
            							if numAsStr ~= "" then
            								numero = tonumber(newValue);
            							else
            								numero = nil;
            							end;
            
            							if type(sheet.atributos) ~= 'table' then
            								sheet.atributos = {};
            							end;				
            							
            							if type(numero) == 'number' then
            								local modificador = math.floor(numero / 3);								
            								sheet.atributos.modchanceCritico = modificador;	
            								sheet.atributos.modchanceCriticostr = modificador .. "%";	
            							else
            								sheet.atributos.modchanceCritico = nil;
            								sheet.atributos.modchanceCriticostr = nil;
            							end;
        end, obj);

    obj._e_event27 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            							local numero;
            							
            							if numAsStr ~= "" then
            								numero = tonumber(newValue);
            							else
            								numero = nil;
            							end;
            
            							if type(sheet.atributos) ~= 'table' then
            								sheet.atributos = {};
            							end;				
            							
            							if type(numero) == 'number' then
            								local modificador = math.floor(numero / 2.5);								
            								sheet.atributos.moddanoCritico = modificador;	
            								sheet.atributos.moddanoCriticostr = modificador .. "%";	
            							else
            								sheet.atributos.moddanoCritico = nil;
            								sheet.atributos.moddanoCriticostr = nil;
            							end;
        end, obj);

    obj._e_event28 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local numAsStr = tostring(newValue);
            							local numero;
            							
            							if numAsStr ~= "" then
            								numero = tonumber(newValue);
            							else
            								numero = nil;
            							end;
            
            							if type(sheet.atributos) ~= 'table' then
            								sheet.atributos = {};
            							end;				
            							
            							if type(numero) == 'number' then
            								local modificador = math.floor(numero / 10);								
            								sheet.atributos.modamplificador = modificador;	
            								sheet.atributos.modamplificadorstr = modificador .. "%";	
            							else
            								sheet.atributos.modamplificador = nil;
            								sheet.atributos.modamplificadorstr = nil;
            							end;
        end, obj);

    obj._e_event29 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            							if sheet.atributos==nil then return end;
            							local forca = string.gsub(sheet.atributos.modforca or "", "+", "");
            							local destreza = string.gsub(sheet.atributos.moddestreza or "", "+", "");
            							local agilidade = string.gsub(sheet.atributos.modagilidade or "", "+", "");
            							local constituicao = string.gsub(sheet.atributos.modconstituicao or "", "+", "");
            							local inteligencia = string.gsub(sheet.atributos.modinteligencia or "", "+", "");
            							local sabedoria = string.gsub(sheet.atributos.modsabedoria or "", "+", "");
            							local carisma = string.gsub(sheet.atributos.modcarisma or "", "+", "");
            							local vontade = string.gsub(sheet.atributos.modvontade or "", "+", "");
            
            							sheet.souls = 	(tonumber(forca) or 0) + 
            											(tonumber(destreza) or 0) + 
            											(tonumber(agilidade) or 0) + 
            											(tonumber(constituicao) or 0) + 
            											(tonumber(inteligencia) or 0) + 
            											(tonumber(sabedoria) or 0) + 
            											(tonumber(carisma) or 0) + 
            											(tonumber(vontade) or 0);
        end, obj);

    obj._e_event30 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.avatarHead = "https://github.com/rrpgfirecast/firecast/raw/master/Plugins/Sheets/Ficha".. "%" .. "20Mundo" .. "%" .."20Original/images/" .. (sheet.cabecaComboBox or "");
        end, obj);

    obj._e_event31 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.avatarBody = "https://github.com/rrpgfirecast/firecast/raw/master/Plugins/Sheets/Ficha".. "%" .. "20Mundo" .. "%" .."20Original/images/" .. (sheet.corpoComboBox or "");
        end, obj);

    obj._e_event32 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.avatarArms = "https://github.com/rrpgfirecast/firecast/raw/master/Plugins/Sheets/Ficha".. "%" .. "20Mundo" .. "%" .."20Original/images/" .. (sheet.bracosComboBox or "");
        end, obj);

    obj._e_event33 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.avatarLegs = "https://github.com/rrpgfirecast/firecast/raw/master/Plugins/Sheets/Ficha".. "%" .. "20Mundo" .. "%" .."20Original/images/" .. (sheet.pernasComboBox or "");
        end, obj);

    obj._e_event34 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.avatarBoot = "https://github.com/rrpgfirecast/firecast/raw/master/Plugins/Sheets/Ficha".. "%" .. "20Mundo" .. "%" .."20Original/images/" .. (sheet.pesComboBox or "");
        end, obj);

    obj._e_event35 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local theme = sheet.theme;
            					if theme == "Claro" then
            						theme = "light";
            					else
            						theme = "dark";
            					end;
            
            					local forms = findClass("form");
            
            					for i=1, #forms, 1 do 
            						forms[i].theme = theme;
            					end;
        end, obj);

    obj._e_event36 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event37 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event38 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fontColor = sheet.colorFont or "#FFFFFF";
            
            					local controls = findAllControls();
            					
            					local edits = filterByClass("edit", controls);
            					for i=1, #edits, 1 do 
            						edits[i].fontColor = fontColor;
            					end;
            
            					local labels = filterByClass("label", controls);
            					for i=1, #labels, 1 do 
            						labels[i].fontColor = fontColor;
            					end;
            
            					local comboBoxs = filterByClass("comboBox", controls);
            					for i=1, #comboBoxs, 1 do 
            						comboBoxs[i].fontColor = fontColor;
            					end;
            
            					local textEditors = filterByClass("textEditor", controls);
            					for i=1, #textEditors, 1 do 
            						textEditors[i].fontColor = fontColor;
            					end;
            
            					local checkBoxs = filterByClass("checkBox", controls);
            					for i=1, #checkBoxs, 1 do 
            						checkBoxs[i].fontColor = fontColor;
            					end;
            
            					local buttons = filterByClass("button", controls);
            					for i=1, #buttons, 1 do 
            						buttons[i].fontColor = fontColor;
            					end;
        end, obj);

    obj._e_event39 = obj.button1:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('README.md')
        end, obj);

    obj._e_event40 = obj.button2:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Mundo%20Original/output/Ficha%20Mundo%20Original.rpk?raw=true')
        end, obj);

    obj._e_event41 = obj.button3:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event42 = obj.button4:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=');
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.fraUpperGridFrente ~= nil then self.fraUpperGridFrente:destroy(); self.fraUpperGridFrente = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.extencao ~= nil then self.extencao:destroy(); self.extencao = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.habilidades ~= nil then self.habilidades:destroy(); self.habilidades = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edtNome1 ~= nil then self.edtNome1:destroy(); self.edtNome1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.equipamento ~= nil then self.equipamento:destroy(); self.equipamento = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.labNome1 ~= nil then self.labNome1:destroy(); self.labNome1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layNomeHolderFrente ~= nil then self.layNomeHolderFrente:destroy(); self.layNomeHolderFrente = nil; end;
        if self.fraLayAtributos ~= nil then self.fraLayAtributos:destroy(); self.fraLayAtributos = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.flwNome1 ~= nil then self.flwNome1:destroy(); self.flwNome1 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newMundoOriginal()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_MundoOriginal();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _MundoOriginal = {
    newEditor = newMundoOriginal, 
    new = newMundoOriginal, 
    name = "MundoOriginal", 
    dataType = "Ambesek.FMO", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Mundo Original", 
    description=""};

MundoOriginal = _MundoOriginal;
Firecast.registrarForm(_MundoOriginal);
Firecast.registrarDataType(_MundoOriginal);

return _MundoOriginal;
