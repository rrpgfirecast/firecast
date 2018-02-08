require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmTemplate()
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
    obj:setName("frmTemplate");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.GURPS");
    obj:setTitle("Ficha GURPS 4E");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.pgcPrincipal = gui.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.frmAtributes = gui.fromHandle(_obj_newObject("form"));
    obj.frmAtributes:setParent(obj.tab1);
    obj.frmAtributes:setName("frmAtributes");
    obj.frmAtributes:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmAtributes);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.fraFrenteLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraFrenteLayout:setParent(obj.scrollBox1);
    obj.fraFrenteLayout:setAlign("top");
    obj.fraFrenteLayout:setHeight(500);
    obj.fraFrenteLayout:setMargins({left=10, right=10, top=10});
    obj.fraFrenteLayout:setAutoHeight(true);
    obj.fraFrenteLayout:setHorzAlign("center");
    obj.fraFrenteLayout:setLineSpacing(2);
    obj.fraFrenteLayout:setName("fraFrenteLayout");
    obj.fraFrenteLayout:setStepSizes({320, 400});
    obj.fraFrenteLayout:setMinScaledWidth(150);
    obj.fraFrenteLayout:setVertAlign("leading");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.fraFrenteLayout);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMinScaledWidth(290);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setStepSizes({310, 420, 640, 760, 1150});
    obj.flowLayout1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout1:setVertAlign("leading");

    obj.fraLayAtributos = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayAtributos:setParent(obj.flowLayout1);
    obj.fraLayAtributos:setName("fraLayAtributos");
    obj.fraLayAtributos:setVertAlign("leading");
    obj.fraLayAtributos:setAutoHeight(true);
    obj.fraLayAtributos:setMinScaledWidth(290);
    obj.fraLayAtributos:setMaxControlsPerLine(2);
    obj.fraLayAtributos:setHorzAlign("center");
    obj.fraLayAtributos:setLineSpacing(10);
    obj.fraLayAtributos:setFrameStyle("frames/panel1/frame.xml");
    obj.fraLayAtributos:setMargins({left=2, top=2, right=16, bottom=4});
    obj.fraLayAtributos:setAvoidScale(true);
    obj.fraLayAtributos:setStepSizes({320, 400});

    obj.flowPart1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.fraLayAtributos);
    obj.flowPart1:setHeight(140);
    obj.flowPart1:setMinWidth(120);
    obj.flowPart1:setMaxWidth(120);
    obj.flowPart1:setMinScaledWidth(120);
    obj.flowPart1:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart1);
    obj.layout1:setLeft(6);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(116);
    obj.layout1:setHeight(115);
    obj.layout1:setName("layout1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("top");
    obj.edit1:setMargins({left=25, right=30});
    obj.edit1:setField("atributos_st");
    obj.edit1:setHeight(30);
    obj.edit1:setType("number");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(15);
    obj.edit1:setFontColor("white");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart1);
    obj.edit2:setFrameRegion("modificador");
    obj.edit2:setField("atributos_mod_st");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setFontSize(46);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("white");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setFrameRegion("titulo");
    obj.label1:setText("ST");
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontColor("white");

    obj.flowPart2 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.fraLayAtributos);
    obj.flowPart2:setHeight(140);
    obj.flowPart2:setMinWidth(120);
    obj.flowPart2:setMaxWidth(120);
    obj.flowPart2:setMinScaledWidth(120);
    obj.flowPart2:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart2:setVertAlign("leading");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart2);
    obj.layout2:setLeft(6);
    obj.layout2:setTop(12);
    obj.layout2:setWidth(116);
    obj.layout2:setHeight(115);
    obj.layout2:setName("layout2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setAlign("top");
    obj.edit3:setMargins({left=25, right=30});
    obj.edit3:setField("atributos_ht");
    obj.edit3:setHeight(30);
    obj.edit3:setType("number");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(15);
    obj.edit3:setFontColor("white");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart2);
    obj.edit4:setFrameRegion("modificador");
    obj.edit4:setField("atributos_mod_ht");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setFontSize(46);
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setTransparent(true);
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("white");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setFrameRegion("titulo");
    obj.label2:setText("HT");
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");
    obj.label2:setFontColor("white");

    obj.flowPart3 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.fraLayAtributos);
    obj.flowPart3:setHeight(140);
    obj.flowPart3:setMinWidth(120);
    obj.flowPart3:setMaxWidth(120);
    obj.flowPart3:setMinScaledWidth(120);
    obj.flowPart3:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart3);
    obj.layout3:setLeft(6);
    obj.layout3:setTop(12);
    obj.layout3:setWidth(116);
    obj.layout3:setHeight(115);
    obj.layout3:setName("layout3");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setAlign("top");
    obj.edit5:setMargins({left=25, right=30});
    obj.edit5:setField("atributos_dx");
    obj.edit5:setHeight(30);
    obj.edit5:setType("number");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(15);
    obj.edit5:setFontColor("white");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart3);
    obj.edit6:setFrameRegion("modificador");
    obj.edit6:setField("atributos_mod_dx");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setFontSize(46);
    lfm_setPropAsString(obj.edit6, "fontStyle",  "bold");
    obj.edit6:setTransparent(true);
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("white");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setFrameRegion("titulo");
    obj.label3:setText("DX");
    obj.label3:setVertTextAlign("center");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");
    obj.label3:setFontColor("white");

    obj.flowPart4 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.fraLayAtributos);
    obj.flowPart4:setHeight(140);
    obj.flowPart4:setMinWidth(120);
    obj.flowPart4:setMaxWidth(120);
    obj.flowPart4:setMinScaledWidth(120);
    obj.flowPart4:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart4:setVertAlign("leading");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart4);
    obj.layout4:setLeft(6);
    obj.layout4:setTop(12);
    obj.layout4:setWidth(116);
    obj.layout4:setHeight(115);
    obj.layout4:setName("layout4");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setAlign("top");
    obj.edit7:setMargins({left=25, right=30});
    obj.edit7:setField("atributos_vt");
    obj.edit7:setHeight(30);
    obj.edit7:setType("number");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setName("edit7");
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(15);
    obj.edit7:setFontColor("white");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart4);
    obj.edit8:setFrameRegion("modificador");
    obj.edit8:setField("atributos_mod_vt");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setFontSize(46);
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");
    obj.edit8:setTransparent(true);
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("white");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setFrameRegion("titulo");
    obj.label4:setText("VT ");
    obj.label4:setVertTextAlign("center");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");
    obj.label4:setFontColor("white");

    obj.flowPart5 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.fraLayAtributos);
    obj.flowPart5:setHeight(140);
    obj.flowPart5:setMinWidth(120);
    obj.flowPart5:setMaxWidth(120);
    obj.flowPart5:setMinScaledWidth(120);
    obj.flowPart5:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart5:setVertAlign("leading");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart5);
    obj.layout5:setLeft(6);
    obj.layout5:setTop(12);
    obj.layout5:setWidth(116);
    obj.layout5:setHeight(115);
    obj.layout5:setName("layout5");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setAlign("top");
    obj.edit9:setMargins({left=25, right=30});
    obj.edit9:setField("atributos_iq");
    obj.edit9:setHeight(30);
    obj.edit9:setType("number");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(15);
    obj.edit9:setFontColor("white");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart5);
    obj.edit10:setFrameRegion("modificador");
    obj.edit10:setField("atributos_mod_iq");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setFontSize(46);
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");
    obj.edit10:setTransparent(true);
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("white");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setFrameRegion("titulo");
    obj.label5:setText("IQ");
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");
    obj.label5:setFontColor("white");

    obj.flowPart6 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.fraLayAtributos);
    obj.flowPart6:setHeight(140);
    obj.flowPart6:setMinWidth(120);
    obj.flowPart6:setMaxWidth(120);
    obj.flowPart6:setMinScaledWidth(120);
    obj.flowPart6:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart6:setVertAlign("leading");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart6);
    obj.layout6:setLeft(6);
    obj.layout6:setTop(12);
    obj.layout6:setWidth(116);
    obj.layout6:setHeight(115);
    obj.layout6:setName("layout6");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout6);
    obj.edit11:setAlign("top");
    obj.edit11:setMargins({left=25, right=30});
    obj.edit11:setField("atributos_per");
    obj.edit11:setHeight(30);
    obj.edit11:setType("number");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(15);
    obj.edit11:setFontColor("white");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart6);
    obj.edit12:setFrameRegion("modificador");
    obj.edit12:setField("atributos_mod_per");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setFontSize(46);
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");
    obj.edit12:setTransparent(true);
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("white");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart6);
    obj.label6:setFrameRegion("titulo");
    obj.label6:setText("PER ");
    obj.label6:setVertTextAlign("center");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");

    obj.flowPart7 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.fraLayAtributos);
    obj.flowPart7:setHeight(140);
    obj.flowPart7:setMinWidth(120);
    obj.flowPart7:setMaxWidth(120);
    obj.flowPart7:setMinScaledWidth(120);
    obj.flowPart7:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart7:setVertAlign("leading");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart7);
    obj.layout7:setLeft(6);
    obj.layout7:setTop(12);
    obj.layout7:setWidth(116);
    obj.layout7:setHeight(115);
    obj.layout7:setName("layout7");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout7);
    obj.edit13:setAlign("top");
    obj.edit13:setMargins({left=25, right=30});
    obj.edit13:setField("atributos_pv");
    obj.edit13:setHeight(30);
    obj.edit13:setType("number");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setName("edit13");
    obj.edit13:setTransparent(true);
    obj.edit13:setFontSize(15);
    obj.edit13:setFontColor("white");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart7);
    obj.edit14:setFrameRegion("modificador");
    obj.edit14:setField("atributos_mod_pv");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setFontSize(46);
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");
    obj.edit14:setTransparent(true);
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("white");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart7);
    obj.label7:setFrameRegion("titulo");
    obj.label7:setText("PV");
    obj.label7:setVertTextAlign("center");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");

    obj.flowPart8 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.fraLayAtributos);
    obj.flowPart8:setHeight(140);
    obj.flowPart8:setMinWidth(120);
    obj.flowPart8:setMaxWidth(120);
    obj.flowPart8:setMinScaledWidth(120);
    obj.flowPart8:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart8:setVertAlign("leading");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowPart8);
    obj.layout8:setLeft(6);
    obj.layout8:setTop(12);
    obj.layout8:setWidth(116);
    obj.layout8:setHeight(115);
    obj.layout8:setName("layout8");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout8);
    obj.edit15:setAlign("top");
    obj.edit15:setMargins({left=25, right=30});
    obj.edit15:setField("atributos_pf");
    obj.edit15:setHeight(30);
    obj.edit15:setType("number");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(15);
    obj.edit15:setFontColor("white");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart8);
    obj.edit16:setFrameRegion("modificador");
    obj.edit16:setField("atributos_mod_pf");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setFontSize(46);
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");
    obj.edit16:setTransparent(true);
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("white");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart8);
    obj.label8:setFrameRegion("titulo");
    obj.label8:setText("PF");
    obj.label8:setVertTextAlign("center");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");

    obj.fraLayAtributos2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraLayAtributos2:setParent(obj.flowLayout1);
    obj.fraLayAtributos2:setName("fraLayAtributos2");
    obj.fraLayAtributos2:setVertAlign("leading");
    obj.fraLayAtributos2:setAutoHeight(true);
    obj.fraLayAtributos2:setMinScaledWidth(290);
    obj.fraLayAtributos2:setMaxControlsPerLine(3);
    obj.fraLayAtributos2:setHorzAlign("center");
    obj.fraLayAtributos2:setLineSpacing(10);
    obj.fraLayAtributos2:setFrameStyle("frames/panel1/frame.xml");
    obj.fraLayAtributos2:setMargins({left=2, top=2, right=16, bottom=4});
    obj.fraLayAtributos2:setAvoidScale(true);
    obj.fraLayAtributos2:setStepSizes({320, 400});

    obj.flowPart9 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.fraLayAtributos2);
    obj.flowPart9:setStepSizes({120});
    obj.flowPart9:setMinScaledWidth(120);
    obj.flowPart9:setHeight(145);
    obj.flowPart9:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart9:setVertAlign("leading");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart9);
    obj.label9:setAlign("top");
    obj.label9:setText("CARGA BASE");
    obj.label9:setHeight(20);
    obj.label9:setFontSize(9);
    obj.label9:setWordWrap(true);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setTextTrimming("none");
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart9);
    obj.edit17:setAlign("client");
    obj.edit17:setField("carga");
    obj.edit17:setFontSize(30);
    obj.edit17:setName("edit17");
    obj.edit17:setTransparent(true);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontColor("white");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.fraLayAtributos2);
    obj.dataLink1:setField("carga");
    obj.dataLink1:setName("dataLink1");

    obj.flowPart10 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.fraLayAtributos2);
    obj.flowPart10:setHeight(140);
    obj.flowPart10:setMinWidth(120);
    obj.flowPart10:setMaxWidth(120);
    obj.flowPart10:setMinScaledWidth(120);
    obj.flowPart10:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart10);
    obj.layout9:setLeft(6);
    obj.layout9:setTop(12);
    obj.layout9:setWidth(116);
    obj.layout9:setHeight(115);
    obj.layout9:setName("layout9");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout9);
    obj.edit18:setAlign("top");
    obj.edit18:setMargins({left=25, right=30});
    obj.edit18:setField("atributos_velocidade");
    obj.edit18:setHeight(30);
    obj.edit18:setType("number");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setName("edit18");
    obj.edit18:setTransparent(true);
    obj.edit18:setFontSize(15);
    obj.edit18:setFontColor("white");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart10);
    obj.edit19:setFrameRegion("modificador");
    obj.edit19:setField("atributos_mod_velocidade");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setFontSize(46);
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setTransparent(true);
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("white");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart10);
    obj.label10:setFrameRegion("titulo");
    obj.label10:setText("VELOCIDADE");
    obj.label10:setVertTextAlign("center");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.fraLayAtributos2);
    obj.dataLink2:setField("atributos_mod_velocidade");
    obj.dataLink2:setName("dataLink2");

    obj.flowPart11 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.fraLayAtributos2);
    obj.flowPart11:setHeight(140);
    obj.flowPart11:setMinWidth(120);
    obj.flowPart11:setMaxWidth(120);
    obj.flowPart11:setMinScaledWidth(120);
    obj.flowPart11:setFrameStyle("frames/atributeFrame/frame.xml");
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowPart11);
    obj.layout10:setLeft(6);
    obj.layout10:setTop(12);
    obj.layout10:setWidth(116);
    obj.layout10:setHeight(115);
    obj.layout10:setName("layout10");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout10);
    obj.edit20:setAlign("top");
    obj.edit20:setMargins({left=25, right=30});
    obj.edit20:setField("atributos_deslocamento");
    obj.edit20:setHeight(30);
    obj.edit20:setType("number");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setName("edit20");
    obj.edit20:setTransparent(true);
    obj.edit20:setFontSize(15);
    obj.edit20:setFontColor("white");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart11);
    obj.edit21:setFrameRegion("modificador");
    obj.edit21:setField("atributos_mod_deslocamento");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setFontSize(46);
    lfm_setPropAsString(obj.edit21, "fontStyle",  "bold");
    obj.edit21:setTransparent(true);
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("white");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart11);
    obj.label11:setFrameRegion("titulo");
    obj.label11:setText("DESLOCAMENTO");
    obj.label11:setVertTextAlign("center");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");
    obj.label11:setFontColor("white");

    obj.flowPart12 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.fraLayAtributos2);
    obj.flowPart12:setStepSizes({120});
    obj.flowPart12:setMinScaledWidth(120);
    obj.flowPart12:setHeight(145);
    obj.flowPart12:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart12:setVertAlign("leading");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart12);
    obj.label12:setLeft(15);
    obj.label12:setTop(10);
    obj.label12:setWidth(90);
    obj.label12:setHeight(25);
    obj.label12:setField("bc_0");
    obj.label12:setFontSize(10);
    obj.label12:setWordWrap(true);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setTextTrimming("none");
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart12);
    obj.label13:setLeft(15);
    obj.label13:setTop(35);
    obj.label13:setWidth(90);
    obj.label13:setHeight(25);
    obj.label13:setField("bc_1");
    obj.label13:setFontSize(10);
    obj.label13:setWordWrap(true);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setTextTrimming("none");
    obj.label13:setName("label13");
    obj.label13:setFontColor("white");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart12);
    obj.label14:setLeft(15);
    obj.label14:setTop(60);
    obj.label14:setWidth(90);
    obj.label14:setHeight(25);
    obj.label14:setField("bc_2");
    obj.label14:setFontSize(10);
    obj.label14:setWordWrap(true);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setTextTrimming("none");
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart12);
    obj.label15:setLeft(15);
    obj.label15:setTop(85);
    obj.label15:setWidth(90);
    obj.label15:setHeight(25);
    obj.label15:setField("bc_3");
    obj.label15:setFontSize(10);
    obj.label15:setWordWrap(true);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setTextTrimming("none");
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart12);
    obj.label16:setLeft(15);
    obj.label16:setTop(110);
    obj.label16:setWidth(90);
    obj.label16:setHeight(25);
    obj.label16:setField("bc_4");
    obj.label16:setFontSize(10);
    obj.label16:setWordWrap(true);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setTextTrimming("none");
    obj.label16:setName("label16");
    obj.label16:setFontColor("white");

    obj.flowPart13 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.fraLayAtributos2);
    obj.flowPart13:setStepSizes({120});
    obj.flowPart13:setMinScaledWidth(120);
    obj.flowPart13:setHeight(145);
    obj.flowPart13:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart13:setVertAlign("leading");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart13);
    obj.label17:setLeft(15);
    obj.label17:setTop(10);
    obj.label17:setWidth(90);
    obj.label17:setHeight(25);
    obj.label17:setField("db_0");
    obj.label17:setFontSize(10);
    obj.label17:setWordWrap(true);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setTextTrimming("none");
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart13);
    obj.label18:setLeft(15);
    obj.label18:setTop(35);
    obj.label18:setWidth(90);
    obj.label18:setHeight(25);
    obj.label18:setField("db_1");
    obj.label18:setFontSize(10);
    obj.label18:setWordWrap(true);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setTextTrimming("none");
    obj.label18:setName("label18");
    obj.label18:setFontColor("white");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart13);
    obj.label19:setLeft(15);
    obj.label19:setTop(60);
    obj.label19:setWidth(90);
    obj.label19:setHeight(25);
    obj.label19:setField("db_2");
    obj.label19:setFontSize(10);
    obj.label19:setWordWrap(true);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setTextTrimming("none");
    obj.label19:setName("label19");
    obj.label19:setFontColor("white");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart13);
    obj.label20:setLeft(15);
    obj.label20:setTop(85);
    obj.label20:setWidth(90);
    obj.label20:setHeight(25);
    obj.label20:setField("db_3");
    obj.label20:setFontSize(10);
    obj.label20:setWordWrap(true);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setTextTrimming("none");
    obj.label20:setName("label20");
    obj.label20:setFontColor("white");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart13);
    obj.label21:setLeft(15);
    obj.label21:setTop(110);
    obj.label21:setWidth(90);
    obj.label21:setHeight(25);
    obj.label21:setField("db_4");
    obj.label21:setFontSize(10);
    obj.label21:setWordWrap(true);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setTextTrimming("none");
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");

    obj.flowPart14 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.fraLayAtributos2);
    obj.flowPart14:setStepSizes({120});
    obj.flowPart14:setMinScaledWidth(120);
    obj.flowPart14:setHeight(145);
    obj.flowPart14:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart14:setVertAlign("leading");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart14);
    obj.label22:setLeft(15);
    obj.label22:setTop(10);
    obj.label22:setWidth(70);
    obj.label22:setHeight(25);
    obj.label22:setText("Esquiva");
    obj.label22:setFontSize(10);
    obj.label22:setWordWrap(true);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setTextTrimming("none");
    obj.label22:setName("label22");
    obj.label22:setFontColor("white");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart14);
    obj.edit22:setLeft(75);
    obj.edit22:setTop(15);
    obj.edit22:setWidth(20);
    obj.edit22:setHeight(20);
    obj.edit22:setFontSize(10);
    obj.edit22:setField("esq_0");
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("white");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart14);
    obj.label23:setLeft(15);
    obj.label23:setTop(35);
    obj.label23:setWidth(90);
    obj.label23:setHeight(25);
    obj.label23:setField("esq_1");
    obj.label23:setFontSize(10);
    obj.label23:setWordWrap(true);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setTextTrimming("none");
    obj.label23:setName("label23");
    obj.label23:setFontColor("white");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart14);
    obj.label24:setLeft(15);
    obj.label24:setTop(60);
    obj.label24:setWidth(90);
    obj.label24:setHeight(25);
    obj.label24:setField("esq_2");
    obj.label24:setFontSize(10);
    obj.label24:setWordWrap(true);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setTextTrimming("none");
    obj.label24:setName("label24");
    obj.label24:setFontColor("white");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart14);
    obj.label25:setLeft(15);
    obj.label25:setTop(85);
    obj.label25:setWidth(90);
    obj.label25:setHeight(25);
    obj.label25:setField("esq_3");
    obj.label25:setFontSize(10);
    obj.label25:setWordWrap(true);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setTextTrimming("none");
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart14);
    obj.label26:setLeft(15);
    obj.label26:setTop(110);
    obj.label26:setWidth(90);
    obj.label26:setHeight(25);
    obj.label26:setField("esq_4");
    obj.label26:setFontSize(10);
    obj.label26:setWordWrap(true);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setTextTrimming("none");
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.fraLayAtributos2);
    obj.dataLink3:setField("esq_0");
    obj.dataLink3:setName("dataLink3");

    obj.flowPart15 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.fraLayAtributos2);
    obj.flowPart15:setStepSizes({120});
    obj.flowPart15:setMinScaledWidth(120);
    obj.flowPart15:setHeight(145);
    obj.flowPart15:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart15:setVertAlign("leading");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart15);
    obj.label27:setAlign("top");
    obj.label27:setText("GdP");
    obj.label27:setHeight(20);
    obj.label27:setFontSize(9);
    obj.label27:setWordWrap(true);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setTextTrimming("none");
    obj.label27:setName("label27");
    obj.label27:setFontColor("white");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart15);
    obj.edit23:setAlign("client");
    obj.edit23:setField("gdp");
    obj.edit23:setFontSize(30);
    obj.edit23:setName("edit23");
    obj.edit23:setTransparent(true);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setFontColor("white");

    obj.flowPart16 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.fraLayAtributos2);
    obj.flowPart16:setStepSizes({120});
    obj.flowPart16:setMinScaledWidth(120);
    obj.flowPart16:setHeight(145);
    obj.flowPart16:setFrameStyle("frames/panel4transp/frame.xml");
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart16:setVertAlign("leading");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart16);
    obj.label28:setAlign("top");
    obj.label28:setText("GdB");
    obj.label28:setHeight(20);
    obj.label28:setFontSize(9);
    obj.label28:setWordWrap(true);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setTextTrimming("none");
    obj.label28:setName("label28");
    obj.label28:setFontColor("white");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart16);
    obj.edit24:setAlign("client");
    obj.edit24:setField("gdb");
    obj.edit24:setFontSize(30);
    obj.edit24:setName("edit24");
    obj.edit24:setTransparent(true);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setFontColor("white");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Descrição");
    obj.tab2:setName("tab2");

    obj.frmCharacteristics = gui.fromHandle(_obj_newObject("form"));
    obj.frmCharacteristics:setParent(obj.tab2);
    obj.frmCharacteristics:setName("frmCharacteristics");
    obj.frmCharacteristics:setAlign("client");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmCharacteristics);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.fraCaracteristicasLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraCaracteristicasLayout:setParent(obj.scrollBox2);
    obj.fraCaracteristicasLayout:setAlign("top");
    obj.fraCaracteristicasLayout:setHeight(500);
    obj.fraCaracteristicasLayout:setMargins({left=10, right=10, top=10});
    obj.fraCaracteristicasLayout:setAutoHeight(true);
    obj.fraCaracteristicasLayout:setHorzAlign("center");
    obj.fraCaracteristicasLayout:setLineSpacing(3);
    obj.fraCaracteristicasLayout:setName("fraCaracteristicasLayout");
    obj.fraCaracteristicasLayout:setStepSizes({320, 400});
    obj.fraCaracteristicasLayout:setMinScaledWidth(150);
    obj.fraCaracteristicasLayout:setVertAlign("leading");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMinScaledWidth(290);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout2:setVertAlign("leading");

    obj.flowPart17 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(320);
    obj.flowPart17:setMaxWidth(1600);
    obj.flowPart17:setFrameStyle("frames/banner/heroGroup.xml");
    obj.flowPart17:setHeight(175);
    obj.flowPart17:setVertAlign("center");
    obj.flowPart17:setAvoidScale(true);
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setStepSizes({320, 400});
    obj.flowPart17:setMinScaledWidth(150);
    obj.flowPart17:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart17);
    obj.layout11:setAlign("client");
    obj.layout11:setName("layout11");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout11);
    obj.edit25:setField("nome");
    obj.edit25:setFontSize(17);
    obj.edit25:setAlign("client");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("white");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setTransparent(true);

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout11);
    obj.label29:setAlign("bottom");
    obj.label29:setText("NOME DO PERSONAGEM");
    obj.label29:setAutoSize(true);
    obj.label29:setMargins({left=3});
    obj.label29:setName("label29");
    obj.label29:setFontSize(12);
    obj.label29:setFontColor("#D0D0D0");

    obj.fraUpperGridCaracteristicas = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridCaracteristicas:setParent(obj.flowLayout2);
    obj.fraUpperGridCaracteristicas:setMinWidth(320);
    obj.fraUpperGridCaracteristicas:setMaxWidth(1600);
    obj.fraUpperGridCaracteristicas:setName("fraUpperGridCaracteristicas");
    obj.fraUpperGridCaracteristicas:setAvoidScale(true);
    obj.fraUpperGridCaracteristicas:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridCaracteristicas:setAutoHeight(true);
    obj.fraUpperGridCaracteristicas:setVertAlign("trailing");
    obj.fraUpperGridCaracteristicas:setMaxControlsPerLine(3);
    obj.fraUpperGridCaracteristicas:setStepSizes({320, 400});
    obj.fraUpperGridCaracteristicas:setMinScaledWidth(150);
    obj.fraUpperGridCaracteristicas:setMargins({left=1, right=1, top=2, bottom=2});

    obj.UpperGridCampo1 = gui.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.edtUpperGridCampo1:setName("edtUpperGridCampo1");
    obj.edtUpperGridCampo1:setAlign("top");
    obj.edtUpperGridCampo1:setField("caracteristicas.idade");
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
    obj.labUpperGridCampo1:setText("IDADE");
    obj.labUpperGridCampo1:setVertTextAlign("leading");
    obj.labUpperGridCampo1:setWordWrap(true);
    obj.labUpperGridCampo1:setTextTrimming("none");
    obj.labUpperGridCampo1:setFontSize(12);
    obj.labUpperGridCampo1:setFontColor("#D0D0D0");

    self.UpperGridCampo1:setHeight(self.edtUpperGridCampo1:getHeight() + self.labUpperGridCampo1:getHeight() + self.linUpperGridCampo1:getHeight());


    obj.UpperGridCampo2 = gui.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.edtUpperGridCampo2:setName("edtUpperGridCampo2");
    obj.edtUpperGridCampo2:setAlign("top");
    obj.edtUpperGridCampo2:setField("caracteristicas.altura");
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
    obj.labUpperGridCampo2:setText("ALTURA");
    obj.labUpperGridCampo2:setVertTextAlign("leading");
    obj.labUpperGridCampo2:setWordWrap(true);
    obj.labUpperGridCampo2:setTextTrimming("none");
    obj.labUpperGridCampo2:setFontSize(12);
    obj.labUpperGridCampo2:setFontColor("#D0D0D0");

    self.UpperGridCampo2:setHeight(self.edtUpperGridCampo2:getHeight() + self.labUpperGridCampo2:getHeight() + self.linUpperGridCampo2:getHeight());


    obj.UpperGridCampo3 = gui.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.edtUpperGridCampo3:setName("edtUpperGridCampo3");
    obj.edtUpperGridCampo3:setAlign("top");
    obj.edtUpperGridCampo3:setField("caracteristicas.peso");
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
    obj.labUpperGridCampo3:setText("PESO");
    obj.labUpperGridCampo3:setVertTextAlign("leading");
    obj.labUpperGridCampo3:setWordWrap(true);
    obj.labUpperGridCampo3:setTextTrimming("none");
    obj.labUpperGridCampo3:setFontSize(12);
    obj.labUpperGridCampo3:setFontColor("#D0D0D0");

    self.UpperGridCampo3:setHeight(self.edtUpperGridCampo3:getHeight() + self.labUpperGridCampo3:getHeight() + self.linUpperGridCampo3:getHeight());


    obj.UpperGridCampo4 = gui.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.edtUpperGridCampo4:setName("edtUpperGridCampo4");
    obj.edtUpperGridCampo4:setAlign("top");
    obj.edtUpperGridCampo4:setField("caracteristicas.olhos");
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
    obj.labUpperGridCampo4:setText("OLHOS");
    obj.labUpperGridCampo4:setVertTextAlign("leading");
    obj.labUpperGridCampo4:setWordWrap(true);
    obj.labUpperGridCampo4:setTextTrimming("none");
    obj.labUpperGridCampo4:setFontSize(12);
    obj.labUpperGridCampo4:setFontColor("#D0D0D0");

    self.UpperGridCampo4:setHeight(self.edtUpperGridCampo4:getHeight() + self.labUpperGridCampo4:getHeight() + self.linUpperGridCampo4:getHeight());


    obj.UpperGridCampo5 = gui.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.edtUpperGridCampo5:setName("edtUpperGridCampo5");
    obj.edtUpperGridCampo5:setAlign("top");
    obj.edtUpperGridCampo5:setField("caracteristicas.pele");
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
    obj.labUpperGridCampo5:setText("PELE");
    obj.labUpperGridCampo5:setVertTextAlign("leading");
    obj.labUpperGridCampo5:setWordWrap(true);
    obj.labUpperGridCampo5:setTextTrimming("none");
    obj.labUpperGridCampo5:setFontSize(12);
    obj.labUpperGridCampo5:setFontColor("#D0D0D0");

    self.UpperGridCampo5:setHeight(self.edtUpperGridCampo5:getHeight() + self.labUpperGridCampo5:getHeight() + self.linUpperGridCampo5:getHeight());


    obj.UpperGridCampo6 = gui.fromHandle(_obj_newObject("flowPart"));
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

    obj.edtUpperGridCampo6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.edtUpperGridCampo6:setName("edtUpperGridCampo6");
    obj.edtUpperGridCampo6:setAlign("top");
    obj.edtUpperGridCampo6:setField("caracteristicas.cabelo");
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
    obj.labUpperGridCampo6:setText("CABELO");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart18 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setHeight(515);
    obj.flowPart18:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart18:setMargins({left = 4, right = 4});
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setStepSizes({});
    obj.flowPart18:setMinWidth(300);
    obj.flowPart18:setMaxWidth(1600);
    obj.flowPart18:setMinScaledWidth(300);
    obj.flowPart18:setVertAlign("leading");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.flowPart18);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart18);
    obj.label30:setAlign("bottom");
    obj.label30:setAutoSize(true);
    obj.label30:setText("HISTORIA");
    obj.label30:setFontSize(12);
    obj.label30:setVertTextAlign("center");
    obj.label30:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setName("label30");
    obj.label30:setFontColor("white");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pgcPrincipal);
    obj.tab3:setTitle("Habilidades");
    obj.tab3:setName("tab3");

    obj.frmAbilities = gui.fromHandle(_obj_newObject("form"));
    obj.frmAbilities:setParent(obj.tab3);
    obj.frmAbilities:setName("frmAbilities");
    obj.frmAbilities:setAlign("client");

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmAbilities);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.fraHabilidadesLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraHabilidadesLayout:setParent(obj.scrollBox3);
    obj.fraHabilidadesLayout:setAlign("top");
    obj.fraHabilidadesLayout:setHeight(500);
    obj.fraHabilidadesLayout:setMargins({left=10, right=10, top=10});
    obj.fraHabilidadesLayout:setAutoHeight(true);
    obj.fraHabilidadesLayout:setHorzAlign("center");
    obj.fraHabilidadesLayout:setLineSpacing(3);
    obj.fraHabilidadesLayout:setName("fraHabilidadesLayout");
    obj.fraHabilidadesLayout:setStepSizes({320, 400});
    obj.fraHabilidadesLayout:setMinScaledWidth(150);
    obj.fraHabilidadesLayout:setVertAlign("leading");

    obj.flowPart19 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.fraHabilidadesLayout);
    obj.flowPart19:setHeight(515);
    obj.flowPart19:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart19:setMargins({left = 4, right = 4});
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setStepSizes({});
    obj.flowPart19:setMinWidth(300);
    obj.flowPart19:setMaxWidth(1600);
    obj.flowPart19:setMinScaledWidth(300);
    obj.flowPart19:setVertAlign("leading");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowPart19);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("vantagens");
    obj.textEditor1:setMargins({top=2});
    obj.textEditor1:setFontSize(16);
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setTransparent(true);

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart19);
    obj.layout12:setAlign("bottom");
    obj.layout12:setName("layout12");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout12);
    obj.label31:setAlign("bottom");
    obj.label31:setAutoSize(true);
    obj.label31:setText("VANTAGENS");
    obj.label31:setFontSize(12);
    obj.label31:setVertTextAlign("center");
    obj.label31:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout12);
    obj.edit26:setAlign("right");
    obj.edit26:setField("vantagens_pontos");
    obj.edit26:setWidth(50);
    obj.edit26:setName("edit26");
    obj.edit26:setFontSize(15);
    obj.edit26:setFontColor("white");

    obj.flowPart20 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.fraHabilidadesLayout);
    obj.flowPart20:setHeight(515);
    obj.flowPart20:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart20:setMargins({left = 4, right = 4});
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setStepSizes({});
    obj.flowPart20:setMinWidth(300);
    obj.flowPart20:setMaxWidth(1600);
    obj.flowPart20:setMinScaledWidth(300);
    obj.flowPart20:setVertAlign("leading");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.flowPart20);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("desvantagens");
    obj.textEditor2:setMargins({top=2});
    obj.textEditor2:setFontSize(16);
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setTransparent(true);

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart20);
    obj.layout13:setAlign("bottom");
    obj.layout13:setName("layout13");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout13);
    obj.label32:setAlign("bottom");
    obj.label32:setAutoSize(true);
    obj.label32:setText("DESVANTAGENS");
    obj.label32:setFontSize(12);
    obj.label32:setVertTextAlign("center");
    obj.label32:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout13);
    obj.edit27:setAlign("right");
    obj.edit27:setField("desvantagens_pontos");
    obj.edit27:setWidth(50);
    obj.edit27:setName("edit27");
    obj.edit27:setFontSize(15);
    obj.edit27:setFontColor("white");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.pgcPrincipal);
    obj.tab4:setTitle("Perícias");
    obj.tab4:setName("tab4");

    obj.frmSkills = gui.fromHandle(_obj_newObject("form"));
    obj.frmSkills:setParent(obj.tab4);
    obj.frmSkills:setName("frmSkills");
    obj.frmSkills:setAlign("client");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmSkills);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.fraPericiasLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraPericiasLayout:setParent(obj.scrollBox4);
    obj.fraPericiasLayout:setAlign("top");
    obj.fraPericiasLayout:setHeight(500);
    obj.fraPericiasLayout:setMargins({left=10, right=10, top=10});
    obj.fraPericiasLayout:setAutoHeight(true);
    obj.fraPericiasLayout:setHorzAlign("center");
    obj.fraPericiasLayout:setLineSpacing(3);
    obj.fraPericiasLayout:setName("fraPericiasLayout");
    obj.fraPericiasLayout:setStepSizes({320, 400});
    obj.fraPericiasLayout:setMinScaledWidth(150);
    obj.fraPericiasLayout:setVertAlign("leading");

    obj.flowPart21 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.fraPericiasLayout);
    obj.flowPart21:setHeight(600);
    obj.flowPart21:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart21:setMargins({left = 4, right = 4});
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setStepSizes({});
    obj.flowPart21:setMinWidth(300);
    obj.flowPart21:setMaxWidth(1600);
    obj.flowPart21:setMinScaledWidth(300);
    obj.flowPart21:setVertAlign("leading");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart21);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout14);
    obj.label33:setAlign("top");
    obj.label33:setAutoSize(true);
    obj.label33:setText("PERÍCIAS");
    obj.label33:setFontSize(12);
    obj.label33:setVertTextAlign("center");
    obj.label33:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setName("label33");
    obj.label33:setFontColor("white");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout14);
    obj.button1:setAlign("left");
    obj.button1:setText("+");
    obj.button1:setWidth(25);
    obj.button1:setHint("Adiciona uma perícia.");
    obj.button1:setHorzTextAlign("center");
    obj.button1:setMargins({top=-10});
    obj.button1:setName("button1");

    obj.rclSkills = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSkills:setParent(obj.flowPart21);
    obj.rclSkills:setAlign("client");
    obj.rclSkills:setName("rclSkills");
    obj.rclSkills:setField("listaDePericias");
    obj.rclSkills:setTemplateForm("frmSkillItem");
    obj.rclSkills:setLayout("verticalTiles");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.pgcPrincipal);
    obj.tab5:setTitle("Creditos");
    obj.tab5:setName("tab5");

    obj.frmTemplateCreditos = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab5);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateCreditos);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox5);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(500);
    obj.image1:setHeight(345);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("/GURPS4E/images/GURPS4E.png");
    obj.image1:setName("image1");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox5);
    obj.image2:setLeft(550);
    obj.image2:setTop(0);
    obj.image2:setWidth(250);
    obj.image2:setHeight(250);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/GURPS4E/images/RPGmeister.jpg");
    obj.image2:setName("image2");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox5);
    obj.layout15:setLeft(850);
    obj.layout15:setTop(0);
    obj.layout15:setWidth(200);
    obj.layout15:setHeight(160);
    obj.layout15:setName("layout15");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout15);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout15);
    obj.label34:setLeft(0);
    obj.label34:setTop(10);
    obj.label34:setWidth(200);
    obj.label34:setHeight(20);
    obj.label34:setText("Programador: Vinny (Ambesek)");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");
    obj.label34:setFontColor("white");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout15);
    obj.label35:setLeft(0);
    obj.label35:setTop(35);
    obj.label35:setWidth(200);
    obj.label35:setHeight(20);
    obj.label35:setText("Consultor: rexLiterate");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");
    obj.label35:setFontColor("white");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.scrollBox5);
    obj.label36:setLeft(555);
    obj.label36:setTop(300);
    obj.label36:setWidth(100);
    obj.label36:setHeight(20);
    obj.label36:setText("Versão Atual: ");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");
    obj.label36:setFontColor("white");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox5);
    obj.image3:setLeft(667);
    obj.image3:setTop(300);
    obj.image3:setWidth(100);
    obj.image3:setHeight(20);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("link versao atual");
    obj.image3:setName("image3");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.scrollBox5);
    obj.label37:setLeft(555);
    obj.label37:setTop(325);
    obj.label37:setWidth(100);
    obj.label37:setHeight(20);
    obj.label37:setText("Ultima Versão: ");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");
    obj.label37:setFontColor("white");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox5);
    obj.image4:setLeft(667);
    obj.image4:setTop(325);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao01.png");
    obj.image4:setName("image4");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox5);
    obj.button2:setLeft(555);
    obj.button2:setTop(350);
    obj.button2:setWidth(100);
    obj.button2:setText("Change Log");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox5);
    obj.button3:setLeft(667);
    obj.button3:setTop(350);
    obj.button3:setWidth(100);
    obj.button3:setText("Atualizar");
    obj.button3:setName("button3");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.scrollBox5);
    obj.label38:setLeft(555);
    obj.label38:setTop(400);
    obj.label38:setWidth(200);
    obj.label38:setHeight(20);
    obj.label38:setText("Conheça as Mesas:");
    obj.label38:setName("label38");
    obj.label38:setFontColor("white");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox5);
    obj.button4:setLeft(555);
    obj.button4:setTop(425);
    obj.button4:setWidth(100);
    obj.button4:setText("RPGmeister");
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox5);
    obj.button5:setLeft(667);
    obj.button5:setTop(425);
    obj.button5:setWidth(125);
    obj.button5:setText("O Trono de Sol");
    obj.button5:setName("button5");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            							local carga = tonumber(sheet.carga) or 0;
            
            							sheet.bc_0 = "Nenhuma (BC): " .. (carga);
            							sheet.bc_1 = "Leve (BCx2): " .. (carga*2);
            							sheet.bc_2 = "Média (BCx3): " .. (carga*3);
            							sheet.bc_3 = "Pesada (BCx6): " .. (carga*6);
            							sheet.bc_4 = "Muito Pesada (BCx10): " .. (carga*10);
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            							local velocidade = tonumber(sheet.atributos_mod_velocidade) or 0;
            
            							sheet.db_0 = "DBx1: " .. (velocidade);
            							sheet.db_1 = "DBx0,8: " .. (velocidade*0.8);
            							sheet.db_2 = "DBx0,6: " .. (velocidade*0.6);
            							sheet.db_3 = "DBx0,4: " .. (velocidade*0.4);
            							sheet.db_4 = "DBx0,2: " .. (velocidade*0.2);
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            							local esquiva = tonumber(sheet.esq_0) or 0;
            
            							sheet.esq_1 = "Esquiva-1: " .. math.max(esquiva-1, 3);
            							sheet.esq_2 = "Esquiva-2: " .. math.max(esquiva-2, 3);
            							sheet.esq_3 = "Esquiva-3: " .. math.max(esquiva-3, 3);
            							sheet.esq_4 = "Esquiva-4: " .. math.max(esquiva-4, 3);
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclSkills:append();
        end, obj);

    obj._e_event4 = obj.rclSkills:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            						return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (self)
            gui.openInBrowser('link change log')
        end, obj);

    obj._e_event6 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('link atualizar')
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=133655');
        end, obj);

    function obj:_releaseEvents()
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
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.fraLayAtributos2 ~= nil then self.fraLayAtributos2:destroy(); self.fraLayAtributos2 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.fraHabilidadesLayout ~= nil then self.fraHabilidadesLayout:destroy(); self.fraHabilidadesLayout = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.fraCaracteristicasLayout ~= nil then self.fraCaracteristicasLayout:destroy(); self.fraCaracteristicasLayout = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.frmAtributes ~= nil then self.frmAtributes:destroy(); self.frmAtributes = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.frmAbilities ~= nil then self.frmAbilities:destroy(); self.frmAbilities = nil; end;
        if self.frmSkills ~= nil then self.frmSkills:destroy(); self.frmSkills = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.fraUpperGridCaracteristicas ~= nil then self.fraUpperGridCaracteristicas:destroy(); self.fraUpperGridCaracteristicas = nil; end;
        if self.frmCharacteristics ~= nil then self.frmCharacteristics:destroy(); self.frmCharacteristics = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.fraLayAtributos ~= nil then self.fraLayAtributos:destroy(); self.fraLayAtributos = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.fraPericiasLayout ~= nil then self.fraPericiasLayout:destroy(); self.fraPericiasLayout = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.rclSkills ~= nil then self.rclSkills:destroy(); self.rclSkills = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_frmTemplate);
rrpg.registrarDataType(_frmTemplate);

return _frmTemplate;
