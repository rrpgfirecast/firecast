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
                                - (tonumber(sheet.familiaridade_cultural) or 0);

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
                pontos = pontos - custo;

                local objetos = ndb.getChildNodes(sheet.listaDeMagias);
                local custo = 0;
                for i=1, #objetos, 1 do
                    custo = custo + (tonumber(objetos[i].custo) or 0);
                end;
                pontos = pontos - custo;


                sheet.pontosRestantes = pontos;
            end;
        


    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);

    obj.pgcPrincipal = gui.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj.rectangle1);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.tab1);
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#40000000");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle2);
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
    obj.edit2:setMin(3);
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
    obj.edit4:setMin(3);
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
    obj.edit6:setMin(3);
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
    obj.edit8:setMin(3);
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("white");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setFrameRegion("titulo");
    obj.label4:setText("VONT ");
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
    obj.edit10:setMin(3);
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
    obj.edit12:setMin(3);
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
    obj.edit14:setMin(3);
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
    obj.edit16:setMin(3);
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
    obj.edit19:setMin(3);
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
    obj.edit21:setMin(3);
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

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.fraLayAtributos2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.upperGridMagicBox1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox1:setParent(obj.fraLayAtributos2);
    obj.upperGridMagicBox1:setHeight(50);
    obj.upperGridMagicBox1:setMinScaledWidth(100);
    obj.upperGridMagicBox1:setMinWidth(100);
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

    obj.labupperGridMagicBox1val = gui.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox1val:setParent(obj.panupperGridMagicBox1);
    obj.labupperGridMagicBox1val:setName("labupperGridMagicBox1val");
    obj.labupperGridMagicBox1val:setFrameRegion("ContentRegion");
    obj.labupperGridMagicBox1val:setField("pontosRestantes");
    obj.labupperGridMagicBox1val:setFontSize(22);
    obj.labupperGridMagicBox1val:setVertTextAlign("center");
    obj.labupperGridMagicBox1val:setHorzTextAlign("center");
    obj.labupperGridMagicBox1val:setFontColor("white");

    obj.labupperGridMagicBox1 = gui.fromHandle(_obj_newObject("label"));
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


    obj.upperGridMagicEditBox1 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox1:setParent(obj.fraLayAtributos2);
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
    obj.edtupperGridMagicEditBox1:setField("totalPontos");
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
    obj.labupperGridMagicEditBox1:setText("TOTAL DE PONTOS");
    obj.labupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox1:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox1:setWordWrap(true);
    obj.labupperGridMagicEditBox1:setTextTrimming("none");
    obj.labupperGridMagicEditBox1:setFontSize(12);
    obj.labupperGridMagicEditBox1:setFontColor("#D0D0D0");

self.upperGridMagicEditBox1._RecalcSize();	


    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.fraLayAtributos2);
    obj.dataLink4:setFields({'totalPontos', 'atributos_st', 'atributos_ht', 'atributos_dx', 'atributos_vt', 'atributos_iq', 'atributos_per', 'atributos_pv', 'atributos_pf', 'atributos_velocidade', 'atributos_deslocamento'});
    obj.dataLink4:setName("dataLink4");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.tab2);
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#40000000");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle3);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.fraHabilidadesLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraHabilidadesLayout:setParent(obj.scrollBox2);
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

    obj.flowPart17 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.fraHabilidadesLayout);
    obj.flowPart17:setHeight(400);
    obj.flowPart17:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart17:setMargins({left = 4, right = 4});
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setStepSizes({});
    obj.flowPart17:setMinWidth(300);
    obj.flowPart17:setMaxWidth(1600);
    obj.flowPart17:setMinScaledWidth(300);
    obj.flowPart17:setVertAlign("leading");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowPart17);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("vantagens");
    obj.textEditor1:setMargins({top=2, left=5, right=5});
    obj.textEditor1:setFontSize(16);
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setTransparent(true);

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart17);
    obj.layout11:setAlign("bottom");
    obj.layout11:setName("layout11");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout11);
    obj.label29:setAlign("bottom");
    obj.label29:setAutoSize(true);
    obj.label29:setText("VANTAGENS & QUALIDADES");
    obj.label29:setFontSize(12);
    obj.label29:setVertTextAlign("center");
    obj.label29:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setName("label29");
    obj.label29:setFontColor("white");

    obj.frame1 = gui.fromHandle(_obj_newObject("frame"));
    obj.frame1:setParent(obj.layout11);
    obj.frame1:setAlign("right");
    obj.frame1:setFrameStyle("frames/panel6/panel6.xml");
    obj.frame1:setHeight(60);
    obj.frame1:setName("frame1");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.frame1);
    obj.edit25:setField("vantagens_pontos");
    obj.edit25:setHeight(25);
    obj.edit25:setWidth(50);
    obj.edit25:setTransparent(true);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");
    obj.edit25:setFontSize(15);
    obj.edit25:setFontColor("white");

    obj.flowPart18 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.fraHabilidadesLayout);
    obj.flowPart18:setHeight(400);
    obj.flowPart18:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart18:setMargins({left = 4, right = 4});
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setStepSizes({});
    obj.flowPart18:setMinWidth(300);
    obj.flowPart18:setMaxWidth(1600);
    obj.flowPart18:setMinScaledWidth(300);
    obj.flowPart18:setVertAlign("leading");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.flowPart18);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("desvantagens");
    obj.textEditor2:setMargins({top=2, left=5, right=5});
    obj.textEditor2:setFontSize(16);
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setTransparent(true);

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart18);
    obj.layout12:setAlign("bottom");
    obj.layout12:setName("layout12");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout12);
    obj.label30:setAlign("bottom");
    obj.label30:setAutoSize(true);
    obj.label30:setText("DESVANTAGENS & PECULIARIDADES");
    obj.label30:setFontSize(12);
    obj.label30:setVertTextAlign("center");
    obj.label30:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setName("label30");
    obj.label30:setFontColor("white");

    obj.frame2 = gui.fromHandle(_obj_newObject("frame"));
    obj.frame2:setParent(obj.layout12);
    obj.frame2:setAlign("right");
    obj.frame2:setFrameStyle("frames/panel6/panel6.xml");
    obj.frame2:setHeight(60);
    obj.frame2:setName("frame2");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.frame2);
    obj.edit26:setField("desvantagens_pontos");
    obj.edit26:setHeight(25);
    obj.edit26:setWidth(50);
    obj.edit26:setTransparent(true);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");
    obj.edit26:setFontSize(15);
    obj.edit26:setFontColor("white");

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.fraHabilidadesLayout);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraHabilidadesLayout);
    obj.flowLayout2:setMaxControlsPerLine(1);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setLineSpacing(10);
    obj.flowLayout2:setMargins({left=4, right=4});
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setStepSizes({});
    obj.flowLayout2:setMinWidth(300);
    obj.flowLayout2:setMaxWidth(1600);
    obj.flowLayout2:setMinScaledWidth(300);
    obj.flowLayout2:setVertAlign("leading");

    obj.flowPart19 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setHeight(250);
    obj.flowPart19:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart19:setMargins({left = 4, right = 4});
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setStepSizes({});
    obj.flowPart19:setMinWidth(300);
    obj.flowPart19:setMaxWidth(1600);
    obj.flowPart19:setMinScaledWidth(300);
    obj.flowPart19:setVertAlign("leading");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart19);
    obj.label31:setAlign("top");
    obj.label31:setAutoSize(true);
    obj.label31:setText("LÍNGUAS");
    obj.label31:setFontSize(12);
    obj.label31:setVertTextAlign("center");
    obj.label31:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.flowPart19);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("linguas");
    obj.textEditor3:setMargins({top=2});
    obj.textEditor3:setFontSize(16);
    obj.textEditor3:setName("textEditor3");
    obj.textEditor3:setTransparent(true);

    obj.flowPart20 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setHeight(250);
    obj.flowPart20:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart20:setMargins({left = 4, right = 4});
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setStepSizes({});
    obj.flowPart20:setMinWidth(300);
    obj.flowPart20:setMaxWidth(1600);
    obj.flowPart20:setMinScaledWidth(300);
    obj.flowPart20:setVertAlign("leading");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart20);
    obj.label32:setAlign("top");
    obj.label32:setAutoSize(true);
    obj.label32:setText("FAMILIARIDADES CULTURAIS");
    obj.label32:setFontSize(12);
    obj.label32:setVertTextAlign("center");
    obj.label32:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.flowPart20);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("cultura");
    obj.textEditor4:setMargins({top=2});
    obj.textEditor4:setFontSize(16);
    obj.textEditor4:setName("textEditor4");
    obj.textEditor4:setTransparent(true);

    obj.flowPart21 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.fraHabilidadesLayout);
    obj.flowPart21:setHeight(515);
    obj.flowPart21:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart21:setMargins({left = 4, right = 4});
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setStepSizes({});
    obj.flowPart21:setMinWidth(300);
    obj.flowPart21:setMaxWidth(1600);
    obj.flowPart21:setMinScaledWidth(300);
    obj.flowPart21:setVertAlign("leading");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart21);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout13);
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
    obj.button1:setParent(obj.layout13);
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
    obj.rclSkills:setLayout("vertical");

    obj.flowLineBreak3 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.fraHabilidadesLayout);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart22 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.fraHabilidadesLayout);
    obj.flowPart22:setMinWidth(280);
    obj.flowPart22:setMaxWidth(800);
    obj.flowPart22:setHeight(64);
    obj.flowPart22:setFrameStyle("frames/posCaptionEdit1/frame.xml");
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart22:setVertAlign("leading");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart22);
    obj.edit27:setAlign("left");
    obj.edit27:setField("nt_total");
    obj.edit27:setWidth(65);
    obj.edit27:setName("edit27");
    obj.edit27:setTransparent(true);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setFontSize(15);
    obj.edit27:setFontColor("white");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart22);
    obj.label34:setAlign("client");
    obj.label34:setText("Nível Tecnológico");
    obj.label34:setMargins({left=10});
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");
    obj.label34:setFontSize(12);
    obj.label34:setFontColor("#D0D0D0");

    obj.flowPart23 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.fraHabilidadesLayout);
    obj.flowPart23:setMinWidth(280);
    obj.flowPart23:setMaxWidth(800);
    obj.flowPart23:setHeight(64);
    obj.flowPart23:setFrameStyle("frames/posCaptionEdit1/frame.xml");
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart23:setVertAlign("leading");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart23);
    obj.edit28:setAlign("left");
    obj.edit28:setField("familiaridade_cultural");
    obj.edit28:setWidth(65);
    obj.edit28:setName("edit28");
    obj.edit28:setTransparent(true);
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(15);
    obj.edit28:setFontColor("white");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart23);
    obj.label35:setAlign("client");
    obj.label35:setText("Familiaridades Culturais & Línguas");
    obj.label35:setMargins({left=10});
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");
    obj.label35:setFontSize(12);
    obj.label35:setFontColor("#D0D0D0");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle3);
    obj.dataLink5:setFields({'vantagens_pontos', 'desvantagens_pontos', 'familiaridade_cultural'});
    obj.dataLink5:setName("dataLink5");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pgcPrincipal);
    obj.tab3:setTitle("Descrição");
    obj.tab3:setName("tab3");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.tab3);
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#40000000");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.rectangle4);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.fraCaracteristicasLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraCaracteristicasLayout:setParent(obj.scrollBox3);
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

    obj.flowLayout3 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMinScaledWidth(290);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout3:setVertAlign("leading");

    obj.flowPart24 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout3);
    obj.flowPart24:setMinWidth(320);
    obj.flowPart24:setHeight(175);
    obj.flowPart24:setMaxWidth(1600);
    obj.flowPart24:setFrameStyle("frames/banner/dragon.xml");
    obj.flowPart24:setVertAlign("center");
    obj.flowPart24:setAvoidScale(true);
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setStepSizes({320, 400, 480, 560, 640});
    obj.flowPart24:setMinScaledWidth(150);
    obj.flowPart24:setMargins({left=1, right=1, top=2, bottom=2});

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart24);
    obj.layout14:setAlign("client");
    obj.layout14:setName("layout14");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout14);
    obj.edit29:setField("nome");
    obj.edit29:setFontSize(17);
    obj.edit29:setAlign("client");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("white");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setTransparent(true);

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout14);
    obj.label36:setAlign("bottom");
    obj.label36:setText("NOME DO PERSONAGEM");
    obj.label36:setAutoSize(true);
    obj.label36:setMargins({left=3});
    obj.label36:setName("label36");
    obj.label36:setFontSize(12);
    obj.label36:setFontColor("#D0D0D0");

    obj.fraUpperGridCaracteristicas = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraUpperGridCaracteristicas:setParent(obj.flowLayout3);
    obj.fraUpperGridCaracteristicas:setMinWidth(320);
    obj.fraUpperGridCaracteristicas:setMaxWidth(1600);
    obj.fraUpperGridCaracteristicas:setName("fraUpperGridCaracteristicas");
    obj.fraUpperGridCaracteristicas:setAvoidScale(true);
    obj.fraUpperGridCaracteristicas:setFrameStyle("frames/upperInfoGrid/frame.xml");
    obj.fraUpperGridCaracteristicas:setAutoHeight(true);
    obj.fraUpperGridCaracteristicas:setVertAlign("trailing");
    obj.fraUpperGridCaracteristicas:setMaxControlsPerLine(3);
    obj.fraUpperGridCaracteristicas:setStepSizes({320, 400, 480, 560, 640});
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
    obj.edtUpperGridCampo1:setField("idade");
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
    obj.edtUpperGridCampo2:setField("altura");
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
    obj.edtUpperGridCampo3:setField("peso");
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
    obj.edtUpperGridCampo4:setField("olhos");
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
    obj.labUpperGridCampo4:setText("JOGADOR");
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
    obj.edtUpperGridCampo5:setField("pele");
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
    obj.labUpperGridCampo5:setText("TAMANHO");
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
    obj.edtUpperGridCampo6:setField("cabelo");
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
    obj.labUpperGridCampo6:setText("REAÇÃO");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.flowLineBreak4 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.fraCaracteristicasLayout);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowLayout4 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.fraCaracteristicasLayout);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMinScaledWidth(290);
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setLineSpacing(10);
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout4:setVertAlign("leading");

    obj.flowPart25 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout4);
    obj.flowPart25:setHeight(515);
    obj.flowPart25:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart25:setMargins({left = 4, right = 4});
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setStepSizes({});
    obj.flowPart25:setMinWidth(300);
    obj.flowPart25:setMaxWidth(1600);
    obj.flowPart25:setMinScaledWidth(300);
    obj.flowPart25:setVertAlign("leading");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.flowPart25);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart25);
    obj.label37:setAlign("bottom");
    obj.label37:setAutoSize(true);
    obj.label37:setText("HISTORIA");
    obj.label37:setFontSize(12);
    obj.label37:setVertTextAlign("center");
    obj.label37:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setName("label37");
    obj.label37:setFontColor("white");

    obj.flowLayout5 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowLayout4);
    obj.flowLayout5:setMaxControlsPerLine(1);
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setLineSpacing(10);
    obj.flowLayout5:setMargins({left=4, right=4});
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setStepSizes({});
    obj.flowLayout5:setMinWidth(300);
    obj.flowLayout5:setMaxWidth(1600);
    obj.flowLayout5:setMinScaledWidth(300);
    obj.flowLayout5:setVertAlign("leading");

    obj.flowPart26 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout5);
    obj.flowPart26:setHeight(170);
    obj.flowPart26:setFrameStyle("frames/panel5/topPanel.xml");
    obj.flowPart26:setMargins({left = 4, right = 4});
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setStepSizes({});
    obj.flowPart26:setMinWidth(300);
    obj.flowPart26:setMaxWidth(1600);
    obj.flowPart26:setMinScaledWidth(300);
    obj.flowPart26:setVertAlign("leading");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart26);
    obj.label38:setAlign("top");
    obj.label38:setAutoSize(true);
    obj.label38:setText("APARÊNCIA");
    obj.label38:setFontSize(12);
    obj.label38:setVertTextAlign("center");
    obj.label38:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setName("label38");
    obj.label38:setFontColor("white");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.flowPart26);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("aparencia");
    obj.textEditor5:setMargins({top=2});
    obj.textEditor5:setFontSize(16);
    obj.textEditor5:setName("textEditor5");
    obj.textEditor5:setTransparent(true);

    obj.flowPart27 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout5);
    obj.flowPart27:setHeight(170);
    obj.flowPart27:setFrameStyle("frames/panel5/centerPanel.xml");
    obj.flowPart27:setMargins({left = 4, right = 4});
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setStepSizes({});
    obj.flowPart27:setMinWidth(300);
    obj.flowPart27:setMaxWidth(1600);
    obj.flowPart27:setMinScaledWidth(300);
    obj.flowPart27:setVertAlign("leading");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart27);
    obj.label39:setAlign("top");
    obj.label39:setAutoSize(true);
    obj.label39:setText("QUALIDADES");
    obj.label39:setFontSize(12);
    obj.label39:setVertTextAlign("center");
    obj.label39:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setName("label39");
    obj.label39:setFontColor("white");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.flowPart27);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("anotacoes");
    obj.textEditor6:setMargins({top=2});
    obj.textEditor6:setFontSize(16);
    obj.textEditor6:setName("textEditor6");
    obj.textEditor6:setTransparent(true);

    obj.flowPart28 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout5);
    obj.flowPart28:setHeight(155);
    obj.flowPart28:setFrameStyle("frames/panel5/bottomPanel.xml");
    obj.flowPart28:setMargins({left = 4, right = 4});
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setStepSizes({});
    obj.flowPart28:setMinWidth(300);
    obj.flowPart28:setMaxWidth(1600);
    obj.flowPart28:setMinScaledWidth(300);
    obj.flowPart28:setVertAlign("leading");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart28);
    obj.label40:setAlign("top");
    obj.label40:setAutoSize(true);
    obj.label40:setText("PECULIARIDADES");
    obj.label40:setFontSize(12);
    obj.label40:setVertTextAlign("center");
    obj.label40:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setName("label40");
    obj.label40:setFontColor("white");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.flowPart28);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("peculiaridades");
    obj.textEditor7:setMargins({top=2});
    obj.textEditor7:setFontSize(16);
    obj.textEditor7:setName("textEditor7");
    obj.textEditor7:setTransparent(true);

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.pgcPrincipal);
    obj.tab4:setTitle("Capacidades");
    obj.tab4:setName("tab4");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.tab4);
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#40000000");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);

    obj.popPower = gui.fromHandle(_obj_newObject("popup"));
    obj.popPower:setParent(obj.rectangle5);
    obj.popPower:setName("popPower");
    obj.popPower:setWidth(250);
    obj.popPower:setHeight(250);
    obj.popPower:setBackOpacity(0.4);

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.popPower);
    obj.edit30:setAlign("top");
    obj.edit30:setField("nome");
    obj.edit30:setTextPrompt("NOME DA MAGIA");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");
    obj.edit30:setFontSize(15);
    obj.edit30:setFontColor("white");

    obj.flowLayout6 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.popPower);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxControlsPerLine(2);
    obj.flowLayout6:setMargins({bottom=4});
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setVertAlign("leading");

    obj.flowPart29 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout6);
    obj.flowPart29:setMinWidth(30);
    obj.flowPart29:setMaxWidth(400);
    obj.flowPart29:setHeight(35);
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart29:setVertAlign("leading");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart29);
    obj.label41:setAlign("top");
    obj.label41:setFontSize(10);
    obj.label41:setText("TIPO");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setWordWrap(true);
    obj.label41:setTextTrimming("none");
    obj.label41:setAutoSize(true);
    obj.label41:setName("label41");
    obj.label41:setFontColor("#D0D0D0");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart29);
    obj.edit31:setAlign("client");
    obj.edit31:setField("tipo");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(12);
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("white");

    obj.flowPart30 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout6);
    obj.flowPart30:setMinWidth(30);
    obj.flowPart30:setMaxWidth(400);
    obj.flowPart30:setHeight(35);
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart30:setVertAlign("leading");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart30);
    obj.label42:setAlign("top");
    obj.label42:setFontSize(10);
    obj.label42:setText("CUSTO");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setWordWrap(true);
    obj.label42:setTextTrimming("none");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");
    obj.label42:setFontColor("#D0D0D0");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart30);
    obj.edit32:setAlign("client");
    obj.edit32:setField("custo");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setFontSize(12);
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("white");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.popPower);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("descricao");
    obj.textEditor8:setName("textEditor8");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.rectangle5);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.fraPoderesLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraPoderesLayout:setParent(obj.scrollBox4);
    obj.fraPoderesLayout:setAlign("top");
    obj.fraPoderesLayout:setHeight(500);
    obj.fraPoderesLayout:setMargins({left=10, right=10, top=10});
    obj.fraPoderesLayout:setAutoHeight(true);
    obj.fraPoderesLayout:setHorzAlign("center");
    obj.fraPoderesLayout:setLineSpacing(3);
    obj.fraPoderesLayout:setName("fraPoderesLayout");
    obj.fraPoderesLayout:setStepSizes({320, 400});
    obj.fraPoderesLayout:setMinScaledWidth(150);
    obj.fraPoderesLayout:setVertAlign("leading");

    obj.flowPart31 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.fraPoderesLayout);
    obj.flowPart31:setHeight(600);
    obj.flowPart31:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart31:setMargins({left = 4, right = 4});
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setStepSizes({});
    obj.flowPart31:setMinWidth(300);
    obj.flowPart31:setMaxWidth(1600);
    obj.flowPart31:setMinScaledWidth(300);
    obj.flowPart31:setVertAlign("leading");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart31);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout15);
    obj.label43:setAlign("top");
    obj.label43:setAutoSize(true);
    obj.label43:setText("TECNICAS");
    obj.label43:setFontSize(12);
    obj.label43:setVertTextAlign("center");
    obj.label43:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setName("label43");
    obj.label43:setFontColor("white");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout15);
    obj.button2:setAlign("left");
    obj.button2:setText("+");
    obj.button2:setWidth(25);
    obj.button2:setHint("Adiciona uma tecnica.");
    obj.button2:setHorzTextAlign("center");
    obj.button2:setMargins({top=-10});
    obj.button2:setName("button2");

    obj.rclTech = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclTech:setParent(obj.flowPart31);
    obj.rclTech:setAlign("top");
    obj.rclTech:setHeight(575);
    obj.rclTech:setName("rclTech");
    obj.rclTech:setField("listaDeTecnicas");
    obj.rclTech:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclTech:setLayout("vertical");

    obj.flowPart32 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.fraPoderesLayout);
    obj.flowPart32:setHeight(600);
    obj.flowPart32:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart32:setMargins({left = 4, right = 4});
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setStepSizes({});
    obj.flowPart32:setMinWidth(300);
    obj.flowPart32:setMaxWidth(1600);
    obj.flowPart32:setMinScaledWidth(300);
    obj.flowPart32:setVertAlign("leading");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowPart32);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout16);
    obj.label44:setAlign("top");
    obj.label44:setAutoSize(true);
    obj.label44:setText("MAGIAS");
    obj.label44:setFontSize(12);
    obj.label44:setVertTextAlign("center");
    obj.label44:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setName("label44");
    obj.label44:setFontColor("white");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout16);
    obj.button3:setAlign("left");
    obj.button3:setText("+");
    obj.button3:setWidth(25);
    obj.button3:setHint("Adiciona uma tecnica.");
    obj.button3:setHorzTextAlign("center");
    obj.button3:setMargins({top=-10});
    obj.button3:setName("button3");

    obj.rclMagic = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMagic:setParent(obj.flowPart32);
    obj.rclMagic:setAlign("top");
    obj.rclMagic:setHeight(575);
    obj.rclMagic:setName("rclMagic");
    obj.rclMagic:setField("listaDeMagias");
    obj.rclMagic:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclMagic:setLayout("vertical");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.pgcPrincipal);
    obj.tab5:setTitle("Inventario");
    obj.tab5:setName("tab5");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.tab5);
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#40000000");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle6);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.fraInventarioLayout = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.fraInventarioLayout:setParent(obj.scrollBox5);
    obj.fraInventarioLayout:setAlign("top");
    obj.fraInventarioLayout:setHeight(500);
    obj.fraInventarioLayout:setMargins({left=10, right=10, top=10});
    obj.fraInventarioLayout:setAutoHeight(true);
    obj.fraInventarioLayout:setHorzAlign("center");
    obj.fraInventarioLayout:setLineSpacing(3);
    obj.fraInventarioLayout:setName("fraInventarioLayout");
    obj.fraInventarioLayout:setStepSizes({320, 400});
    obj.fraInventarioLayout:setMinScaledWidth(150);
    obj.fraInventarioLayout:setVertAlign("leading");

    obj.flowPart33 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.fraInventarioLayout);
    obj.flowPart33:setHeight(600);
    obj.flowPart33:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart33:setMargins({left = 4, right = 4});
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setStepSizes({});
    obj.flowPart33:setMinWidth(300);
    obj.flowPart33:setMaxWidth(1600);
    obj.flowPart33:setMinScaledWidth(300);
    obj.flowPart33:setVertAlign("leading");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowPart33);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout17);
    obj.label45:setAlign("top");
    obj.label45:setAutoSize(true);
    obj.label45:setText("MOCHILA");
    obj.label45:setFontSize(12);
    obj.label45:setVertTextAlign("center");
    obj.label45:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setName("label45");
    obj.label45:setFontColor("white");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout17);
    obj.button4:setAlign("left");
    obj.button4:setText("+");
    obj.button4:setWidth(25);
    obj.button4:setHint("");
    obj.button4:setHorzTextAlign("center");
    obj.button4:setMargins({top=-10});
    obj.button4:setName("button4");

    obj.rclBackpack = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclBackpack:setParent(obj.flowPart33);
    obj.rclBackpack:setAlign("client");
    obj.rclBackpack:setName("rclBackpack");
    obj.rclBackpack:setField("listaDeItens");
    obj.rclBackpack:setTemplateForm("frmBackpackItem");
    obj.rclBackpack:setLayout("vertical");
    obj.rclBackpack:setMinQt(3);

    obj.flowPart34 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.fraInventarioLayout);
    obj.flowPart34:setHeight(600);
    obj.flowPart34:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart34:setMargins({left = 4, right = 4});
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setStepSizes({});
    obj.flowPart34:setMinWidth(300);
    obj.flowPart34:setMaxWidth(1600);
    obj.flowPart34:setMinScaledWidth(300);
    obj.flowPart34:setVertAlign("leading");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowPart34);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout18);
    obj.label46:setAlign("top");
    obj.label46:setAutoSize(true);
    obj.label46:setText("EQUIPAMENTOS E OBJETOS");
    obj.label46:setFontSize(12);
    obj.label46:setVertTextAlign("center");
    obj.label46:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setName("label46");
    obj.label46:setFontColor("white");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout18);
    obj.button5:setAlign("left");
    obj.button5:setText("+");
    obj.button5:setWidth(25);
    obj.button5:setHint("");
    obj.button5:setHorzTextAlign("center");
    obj.button5:setMargins({top=-10});
    obj.button5:setName("button5");

    obj.rclEquipments = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipments:setParent(obj.flowPart34);
    obj.rclEquipments:setAlign("client");
    obj.rclEquipments:setName("rclEquipments");
    obj.rclEquipments:setField("listaDeEquipamentos");
    obj.rclEquipments:setTemplateForm("frmBackpackItem");
    obj.rclEquipments:setLayout("vertical");

    obj.flowPart35 = gui.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.fraInventarioLayout);
    obj.flowPart35:setHeight(600);
    obj.flowPart35:setFrameStyle("frames/panel5/frame.xml");
    obj.flowPart35:setMargins({left = 4, right = 4});
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setStepSizes({});
    obj.flowPart35:setMinWidth(300);
    obj.flowPart35:setMaxWidth(1600);
    obj.flowPart35:setMinScaledWidth(300);
    obj.flowPart35:setVertAlign("leading");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart35);
    obj.label47:setAlign("top");
    obj.label47:setAutoSize(true);
    obj.label47:setText("EQUIPAMENTOS E POSSES");
    obj.label47:setFontSize(12);
    obj.label47:setVertTextAlign("center");
    obj.label47:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setName("label47");
    obj.label47:setFontColor("white");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.flowPart35);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("outrosEquipamentos");
    obj.textEditor9:setMargins({top=2});
    obj.textEditor9:setFontSize(16);
    obj.textEditor9:setName("textEditor9");
    obj.textEditor9:setTransparent(true);

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.pgcPrincipal);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmTemplateCreditos = gui.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab6);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.frmTemplateCreditos);
    obj.rectangle7:setName("rectangle7");
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("#40000000");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.rectangle7);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox6);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(500);
    obj.image1:setHeight(345);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("/GURPS4E/images/GURPS4E.png");
    obj.image1:setName("image1");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox6);
    obj.image2:setLeft(550);
    obj.image2:setTop(0);
    obj.image2:setWidth(250);
    obj.image2:setHeight(250);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/GURPS4E/images/RPGmeister.jpg");
    obj.image2:setName("image2");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox6);
    obj.image3:setLeft(850);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/GURPS4E/images/Capa.png");
    obj.image3:setName("image3");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox6);
    obj.layout19:setLeft(150);
    obj.layout19:setTop(250);
    obj.layout19:setWidth(200);
    obj.layout19:setHeight(160);
    obj.layout19:setName("layout19");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout19);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(5);
    obj.rectangle8:setYradius(15);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout19);
    obj.label48:setLeft(0);
    obj.label48:setTop(10);
    obj.label48:setWidth(200);
    obj.label48:setHeight(20);
    obj.label48:setText("Programador: Vinny (Ambesek)");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");
    obj.label48:setFontColor("white");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout19);
    obj.label49:setLeft(0);
    obj.label49:setTop(35);
    obj.label49:setWidth(200);
    obj.label49:setHeight(20);
    obj.label49:setText("Consultor: rexLiterate");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");
    obj.label49:setFontColor("white");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.scrollBox6);
    obj.label50:setLeft(555);
    obj.label50:setTop(300);
    obj.label50:setWidth(100);
    obj.label50:setHeight(20);
    obj.label50:setText("Versão Atual: ");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");
    obj.label50:setFontColor("white");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox6);
    obj.image4:setLeft(667);
    obj.image4:setTop(300);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20GURPS%204E/release.png");
    obj.image4:setName("image4");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.scrollBox6);
    obj.label51:setLeft(555);
    obj.label51:setTop(325);
    obj.label51:setWidth(100);
    obj.label51:setHeight(20);
    obj.label51:setText("Sua Versão: ");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");
    obj.label51:setFontColor("white");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox6);
    obj.image5:setLeft(667);
    obj.image5:setTop(325);
    obj.image5:setWidth(100);
    obj.image5:setHeight(20);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao03.png");
    obj.image5:setName("image5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox6);
    obj.button6:setLeft(555);
    obj.button6:setTop(350);
    obj.button6:setWidth(100);
    obj.button6:setText("Change Log");
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox6);
    obj.button7:setLeft(667);
    obj.button7:setTop(350);
    obj.button7:setWidth(100);
    obj.button7:setText("Atualizar");
    obj.button7:setName("button7");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.scrollBox6);
    obj.label52:setLeft(555);
    obj.label52:setTop(400);
    obj.label52:setWidth(200);
    obj.label52:setHeight(20);
    obj.label52:setText("Conheça as Mesas:");
    obj.label52:setName("label52");
    obj.label52:setFontColor("white");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox6);
    obj.button8:setLeft(555);
    obj.button8:setTop(425);
    obj.button8:setWidth(100);
    obj.button8:setText("RPGmeister");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox6);
    obj.button9:setLeft(667);
    obj.button9:setTop(425);
    obj.button9:setWidth(125);
    obj.button9:setText("[A] Homebound");
    obj.button9:setName("button9");

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

    obj._e_event3 = obj.labupperGridMagicBox1:addEventListener("onResize",
        function (self)
            self.upperGridMagicBox1._RecalcSize();
        end, obj);

    obj._e_event4 = obj.labupperGridMagicEditBox1:addEventListener("onResize",
        function (self)
            self.upperGridMagicEditBox1._RecalcSize();
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            pointCount();
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclSkills:append();
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            pointCount();
        end, obj);

    obj._e_event8 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclTech:append();
        end, obj);

    obj._e_event9 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclMagic:append();
        end, obj);

    obj._e_event10 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclBackpack:append();
        end, obj);

    obj._e_event11 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclEquipments:append();
        end, obj);

    obj._e_event12 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20GURPS%204E/README.md')
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20GURPS%204E/Ficha%20GURPS%204E.rpk')
        end, obj);

    obj._e_event14 = obj.button8:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event15 = obj.button9:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=131156');
        end, obj);

    function obj:_releaseEvents()
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
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.fraPoderesLayout ~= nil then self.fraPoderesLayout:destroy(); self.fraPoderesLayout = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.fraLayAtributos2 ~= nil then self.fraLayAtributos2:destroy(); self.fraLayAtributos2 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.fraCaracteristicasLayout ~= nil then self.fraCaracteristicasLayout:destroy(); self.fraCaracteristicasLayout = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.fraUpperGridCaracteristicas ~= nil then self.fraUpperGridCaracteristicas:destroy(); self.fraUpperGridCaracteristicas = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.rclSkills ~= nil then self.rclSkills:destroy(); self.rclSkills = nil; end;
        if self.rclTech ~= nil then self.rclTech:destroy(); self.rclTech = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.upperGridMagicBox1 ~= nil then self.upperGridMagicBox1:destroy(); self.upperGridMagicBox1 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.panupperGridMagicBox1 ~= nil then self.panupperGridMagicBox1:destroy(); self.panupperGridMagicBox1 = nil; end;
        if self.panupperGridMagicEditBox1 ~= nil then self.panupperGridMagicEditBox1:destroy(); self.panupperGridMagicEditBox1 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.rclBackpack ~= nil then self.rclBackpack:destroy(); self.rclBackpack = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.labupperGridMagicBox1 ~= nil then self.labupperGridMagicBox1:destroy(); self.labupperGridMagicBox1 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.upperGridMagicEditBox1 ~= nil then self.upperGridMagicEditBox1:destroy(); self.upperGridMagicEditBox1 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.popPower ~= nil then self.popPower:destroy(); self.popPower = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.fraHabilidadesLayout ~= nil then self.fraHabilidadesLayout:destroy(); self.fraHabilidadesLayout = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.rclEquipments ~= nil then self.rclEquipments:destroy(); self.rclEquipments = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.frame1 ~= nil then self.frame1:destroy(); self.frame1 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.frame2 ~= nil then self.frame2:destroy(); self.frame2 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.fraLayAtributos ~= nil then self.fraLayAtributos:destroy(); self.fraLayAtributos = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.labupperGridMagicBox1val ~= nil then self.labupperGridMagicBox1val:destroy(); self.labupperGridMagicBox1val = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
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
        if self.rclMagic ~= nil then self.rclMagic:destroy(); self.rclMagic = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.fraInventarioLayout ~= nil then self.fraInventarioLayout:destroy(); self.fraInventarioLayout = nil; end;
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
