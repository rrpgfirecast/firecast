require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha123_svg()
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
    obj:setName("frmFicha123_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setSRC("/imagens/paginaNaves.png");
    obj.image1:setWidth(868);
    obj.image1:setHeight(538);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setSRC("/imagens/Reseta.png");
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(70);
    obj.image2:setHeight(70);
    obj.image2:setCursor("handPoint");
    obj.image2:setHitTest(true);
    obj.image2:setName("image2");

    obj.RNP10 = GUI.fromHandle(_obj_newObject("image"));
    obj.RNP10:setParent(obj.scrollBox1);
    obj.RNP10:setName("RNP10");
    obj.RNP10:setSRC("/imagens/RNP.png");
    obj.RNP10:setWidth(32);
    obj.RNP10:setHeight(32);
    obj.RNP10:setLeft(302);
    obj.RNP10:setTop(417);
    obj.RNP10:setHitTest(true);
    obj.RNP10:setCursor("handPoint");

    obj.RNP11 = GUI.fromHandle(_obj_newObject("image"));
    obj.RNP11:setParent(obj.scrollBox1);
    obj.RNP11:setName("RNP11");
    obj.RNP11:setSRC("/imagens/RNP.png");
    obj.RNP11:setWidth(32);
    obj.RNP11:setHeight(32);
    obj.RNP11:setLeft(336);
    obj.RNP11:setTop(417);
    obj.RNP11:setHitTest(true);
    obj.RNP11:setCursor("handPoint");

    obj.RNP12 = GUI.fromHandle(_obj_newObject("image"));
    obj.RNP12:setParent(obj.scrollBox1);
    obj.RNP12:setName("RNP12");
    obj.RNP12:setSRC("/imagens/RNP.png");
    obj.RNP12:setWidth(32);
    obj.RNP12:setHeight(32);
    obj.RNP12:setLeft(371);
    obj.RNP12:setTop(417);
    obj.RNP12:setHitTest(true);
    obj.RNP12:setCursor("handPoint");

    obj.RNP13 = GUI.fromHandle(_obj_newObject("image"));
    obj.RNP13:setParent(obj.scrollBox1);
    obj.RNP13:setName("RNP13");
    obj.RNP13:setSRC("/imagens/RNP.png");
    obj.RNP13:setWidth(32);
    obj.RNP13:setHeight(32);
    obj.RNP13:setLeft(406);
    obj.RNP13:setTop(417);
    obj.RNP13:setHitTest(true);
    obj.RNP13:setCursor("handPoint");

    obj.RP10 = GUI.fromHandle(_obj_newObject("image"));
    obj.RP10:setParent(obj.scrollBox1);
    obj.RP10:setName("RP10");
    obj.RP10:setSRC("/imagens/RP.png");
    obj.RP10:setWidth(32);
    obj.RP10:setHeight(32);
    obj.RP10:setLeft(302);
    obj.RP10:setTop(417);
    obj.RP10:setHitTest(true);
    obj.RP10:setCursor("handPoint");
    obj.RP10:setVisible(false);

    obj.RP11 = GUI.fromHandle(_obj_newObject("image"));
    obj.RP11:setParent(obj.scrollBox1);
    obj.RP11:setName("RP11");
    obj.RP11:setSRC("/imagens/RP.png");
    obj.RP11:setWidth(32);
    obj.RP11:setHeight(32);
    obj.RP11:setLeft(336);
    obj.RP11:setTop(417);
    obj.RP11:setHitTest(true);
    obj.RP11:setCursor("handPoint");
    obj.RP11:setVisible(false);

    obj.RP12 = GUI.fromHandle(_obj_newObject("image"));
    obj.RP12:setParent(obj.scrollBox1);
    obj.RP12:setName("RP12");
    obj.RP12:setSRC("/imagens/RP.png");
    obj.RP12:setWidth(32);
    obj.RP12:setHeight(32);
    obj.RP12:setLeft(371);
    obj.RP12:setTop(417);
    obj.RP12:setHitTest(true);
    obj.RP12:setCursor("handPoint");
    obj.RP12:setVisible(false);

    obj.RP13 = GUI.fromHandle(_obj_newObject("image"));
    obj.RP13:setParent(obj.scrollBox1);
    obj.RP13:setName("RP13");
    obj.RP13:setSRC("/imagens/RP.png");
    obj.RP13:setWidth(32);
    obj.RP13:setHeight(32);
    obj.RP13:setLeft(406);
    obj.RP13:setTop(417);
    obj.RP13:setHitTest(true);
    obj.RP13:setCursor("handPoint");
    obj.RP13:setVisible(false);

    obj.Lnave1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Lnave1:setParent(obj.scrollBox1);
    obj.Lnave1:setName("Lnave1");
    obj.Lnave1:setAlign("client");
    obj.Lnave1:setVisible(false);

    obj.HjQNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.HjQNave:setParent(obj.Lnave1);
    obj.HjQNave:setName("HjQNave");
    obj.HjQNave:setAlign("client");
    obj.HjQNave:setVisible(false);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.HjQNave);
    obj.image3:setSRC("/imagens/fundo.png");
    obj.image3:setLeft(333);
    obj.image3:setTop(62);
    obj.image3:setWidth(452);
    obj.image3:setHeight(323);
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.HjQNave);
    obj.image4:setSRC("/imagens/CirculoNave.png");
    obj.image4:setWidth(459);
    obj.image4:setHeight(330);
    obj.image4:setLeft(330.50);
    obj.image4:setTop(60);
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.HjQNave);
    obj.image5:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image5:setLeft(50);
    obj.image5:setTop(94);
    obj.image5:setWidth(279);
    obj.image5:setHeight(54);
    obj.image5:setName("image5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.HjQNave);
    obj.image6:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image6:setLeft(50);
    obj.image6:setTop(148);
    obj.image6:setWidth(279);
    obj.image6:setHeight(54);
    obj.image6:setName("image6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.HjQNave);
    obj.image7:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image7:setLeft(50);
    obj.image7:setTop(201);
    obj.image7:setWidth(279);
    obj.image7:setHeight(54);
    obj.image7:setName("image7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.HjQNave);
    obj.image8:setSRC("/imagens/model.png");
    obj.image8:setLeft(59);
    obj.image8:setTop(110);
    obj.image8:setWidth(91);
    obj.image8:setHeight(19);
    obj.image8:setName("image8");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.HjQNave);
    obj.image9:setSRC("/imagens/nome.png");
    obj.image9:setLeft(59);
    obj.image9:setTop(168);
    obj.image9:setWidth(74);
    obj.image9:setHeight(19);
    obj.image9:setName("image9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.HjQNave);
    obj.image10:setSRC("/imagens/nivelNave.png");
    obj.image10:setLeft(59);
    obj.image10:setTop(216);
    obj.image10:setWidth(71);
    obj.image10:setHeight(25);
    obj.image10:setName("image10");

    obj.HjQ1 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjQ1:setParent(obj.HjQNave);
    obj.HjQ1:setName("HjQ1");
    obj.HjQ1:setSRC("/Naves/H/1 - HjQ/1.png");
    obj.HjQ1:setLeft(500);
    obj.HjQ1:setTop(165);
    obj.HjQ1:setWidth(95);
    obj.HjQ1:setHeight(104);
    obj.HjQ1:setVisible(false);

    obj.HjQ2 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjQ2:setParent(obj.HjQNave);
    obj.HjQ2:setName("HjQ2");
    obj.HjQ2:setSRC("/Naves/H/1 - HjQ/2.png");
    obj.HjQ2:setLeft(500);
    obj.HjQ2:setTop(165);
    obj.HjQ2:setWidth(120);
    obj.HjQ2:setHeight(114);
    obj.HjQ2:setVisible(false);

    obj.HjQ3 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjQ3:setParent(obj.HjQNave);
    obj.HjQ3:setName("HjQ3");
    obj.HjQ3:setSRC("/Naves/H/1 - HjQ/3.png");
    obj.HjQ3:setLeft(500);
    obj.HjQ3:setTop(165);
    obj.HjQ3:setWidth(120);
    obj.HjQ3:setHeight(106);
    obj.HjQ3:setVisible(false);

    obj.HjQ4 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjQ4:setParent(obj.HjQNave);
    obj.HjQ4:setName("HjQ4");
    obj.HjQ4:setSRC("/Naves/H/1 - HjQ/4.png");
    obj.HjQ4:setLeft(500);
    obj.HjQ4:setTop(165);
    obj.HjQ4:setWidth(120);
    obj.HjQ4:setHeight(104);
    obj.HjQ4:setVisible(false);

    obj.HjQ5 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjQ5:setParent(obj.HjQNave);
    obj.HjQ5:setName("HjQ5");
    obj.HjQ5:setSRC("/Naves/H/1 - HjQ/5.png");
    obj.HjQ5:setLeft(500);
    obj.HjQ5:setTop(165);
    obj.HjQ5:setWidth(100);
    obj.HjQ5:setHeight(104);
    obj.HjQ5:setVisible(false);

    obj.HjQ6 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjQ6:setParent(obj.HjQNave);
    obj.HjQ6:setName("HjQ6");
    obj.HjQ6:setSRC("/Naves/H/1 - HjQ/6.png");
    obj.HjQ6:setLeft(500);
    obj.HjQ6:setTop(165);
    obj.HjQ6:setWidth(95);
    obj.HjQ6:setHeight(104);
    obj.HjQ6:setVisible(false);

    obj.HjQ7 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjQ7:setParent(obj.HjQNave);
    obj.HjQ7:setName("HjQ7");
    obj.HjQ7:setSRC("/Naves/H/1 - HjQ/7.png");
    obj.HjQ7:setLeft(500);
    obj.HjQ7:setTop(165);
    obj.HjQ7:setWidth(100);
    obj.HjQ7:setHeight(120);
    obj.HjQ7:setVisible(false);

    obj.HjQ8 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjQ8:setParent(obj.HjQNave);
    obj.HjQ8:setName("HjQ8");
    obj.HjQ8:setSRC("/Naves/H/1 - HjQ/8.png");
    obj.HjQ8:setLeft(500);
    obj.HjQ8:setTop(165);
    obj.HjQ8:setWidth(100);
    obj.HjQ8:setHeight(120);
    obj.HjQ8:setVisible(false);

    obj.model1 = GUI.fromHandle(_obj_newObject("label"));
    obj.model1:setParent(obj.HjQNave);
    obj.model1:setName("model1");
    obj.model1:setLeft(153.13);
    obj.model1:setTop(95.50);
    obj.model1:setWidth(173.63);
    obj.model1:setHeight(47.25);
    obj.model1:setHorzTextAlign("center");
    obj.model1:setFontSize(30);
    lfm_setPropAsString(obj.model1, "fontStyle",  "bold");
    obj.model1:setText("HjQ");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.HjQNave);
    obj.edit1:setField("nomeNave1");
    obj.edit1:setLeft(153.12);
    obj.edit1:setTop(149.50);
    obj.edit1:setWidth(173.62);
    obj.edit1:setHeight(47.25);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(30);
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.HjQNave);
    obj.label1:setField("nivelNave1");
    obj.label1:setLeft(153.12);
    obj.label1:setTop(203.50);
    obj.label1:setWidth(173.62);
    obj.label1:setHeight(47.25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(30);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setName("label1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.HjQNave);
    obj.textEditor1:setField("Textoanotacao1");
    obj.textEditor1:setLeft(334.25);
    obj.textEditor1:setTop(276.25);
    obj.textEditor1:setWidth(222);
    obj.textEditor1:setHeight(111);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.HjQNave);
    obj.textEditor2:setField("Textoanotacao2");
    obj.textEditor2:setLeft(558.25);
    obj.textEditor2:setTop(276.25);
    obj.textEditor2:setWidth(229);
    obj.textEditor2:setHeight(111);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.HjQNave);
    obj.button1:setText("UP");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setFontColor("yellow");
    obj.button1:setLeft(148.75);
    obj.button1:setTop(265.50);
    obj.button1:setWidth(30);
    obj.button1:setHeight(27);
    obj.button1:setName("button1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.HjQNave);
    obj.layout1:setLeft(1);
    obj.layout1:setTop(1);
    obj.layout1:setWidth(250);
    obj.layout1:setHeight(222);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setType("number");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(519);
    obj.edit2:setTop(112);
    obj.edit2:setWidth(25);
    obj.edit2:setHeight(25);
    obj.edit2:setField("minMin1");
    obj.edit2:setName("edit2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("minMin1");
    obj.dataLink1:setName("dataLink1");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setType("number");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setLeft(548);
    obj.edit3:setTop(112);
    obj.edit3:setWidth(25);
    obj.edit3:setHeight(25);
    obj.edit3:setField("maxMin1");
    obj.edit3:setName("edit3");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout1);
    obj.progressBar1:setLeft(495);
    obj.progressBar1:setTop(138);
    obj.progressBar1:setWidth(105);
    obj.progressBar1:setHeight(20.50);
    obj.progressBar1:setColor("red");
    obj.progressBar1:setHitTest(true);
    obj.progressBar1:setMax(1);
    obj.progressBar1:setField("usosMin1");
    obj.progressBar1:setName("progressBar1");

    obj.HnmNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.HnmNave:setParent(obj.Lnave1);
    obj.HnmNave:setName("HnmNave");
    obj.HnmNave:setAlign("client");
    obj.HnmNave:setVisible(false);

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.HnmNave);
    obj.image11:setSRC("/imagens/fundo.png");
    obj.image11:setLeft(333);
    obj.image11:setTop(62);
    obj.image11:setWidth(452);
    obj.image11:setHeight(323);
    obj.image11:setName("image11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.HnmNave);
    obj.image12:setSRC("/imagens/CirculoNave.png");
    obj.image12:setWidth(459);
    obj.image12:setHeight(330);
    obj.image12:setLeft(330.50);
    obj.image12:setTop(60);
    obj.image12:setName("image12");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.HnmNave);
    obj.image13:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image13:setLeft(50);
    obj.image13:setTop(94);
    obj.image13:setWidth(279);
    obj.image13:setHeight(54);
    obj.image13:setName("image13");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.HnmNave);
    obj.image14:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image14:setLeft(50);
    obj.image14:setTop(148);
    obj.image14:setWidth(279);
    obj.image14:setHeight(54);
    obj.image14:setName("image14");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.HnmNave);
    obj.image15:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image15:setLeft(50);
    obj.image15:setTop(201);
    obj.image15:setWidth(279);
    obj.image15:setHeight(54);
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.HnmNave);
    obj.image16:setSRC("/imagens/model.png");
    obj.image16:setLeft(59);
    obj.image16:setTop(110);
    obj.image16:setWidth(91);
    obj.image16:setHeight(19);
    obj.image16:setName("image16");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.HnmNave);
    obj.image17:setSRC("/imagens/nome.png");
    obj.image17:setLeft(59);
    obj.image17:setTop(168);
    obj.image17:setWidth(74);
    obj.image17:setHeight(19);
    obj.image17:setName("image17");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.HnmNave);
    obj.image18:setSRC("/imagens/nivelNave.png");
    obj.image18:setLeft(59);
    obj.image18:setTop(216);
    obj.image18:setWidth(71);
    obj.image18:setHeight(25);
    obj.image18:setName("image18");

    obj.Hnm1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hnm1:setParent(obj.HnmNave);
    obj.Hnm1:setName("Hnm1");
    obj.Hnm1:setSRC("/Naves/H/2 - Hnm/1.png");
    obj.Hnm1:setLeft(500);
    obj.Hnm1:setTop(165);
    obj.Hnm1:setWidth(95);
    obj.Hnm1:setHeight(104);
    obj.Hnm1:setVisible(false);

    obj.Hnm2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hnm2:setParent(obj.HnmNave);
    obj.Hnm2:setName("Hnm2");
    obj.Hnm2:setSRC("/Naves/H/2 - Hnm/2.png");
    obj.Hnm2:setLeft(500);
    obj.Hnm2:setTop(165);
    obj.Hnm2:setWidth(120);
    obj.Hnm2:setHeight(114);
    obj.Hnm2:setVisible(false);

    obj.Hnm3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hnm3:setParent(obj.HnmNave);
    obj.Hnm3:setName("Hnm3");
    obj.Hnm3:setSRC("/Naves/H/2 - Hnm/3.png");
    obj.Hnm3:setLeft(500);
    obj.Hnm3:setTop(165);
    obj.Hnm3:setWidth(120);
    obj.Hnm3:setHeight(106);
    obj.Hnm3:setVisible(false);

    obj.Hnm4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hnm4:setParent(obj.HnmNave);
    obj.Hnm4:setName("Hnm4");
    obj.Hnm4:setSRC("/Naves/H/2 - Hnm/4.png");
    obj.Hnm4:setLeft(500);
    obj.Hnm4:setTop(165);
    obj.Hnm4:setWidth(120);
    obj.Hnm4:setHeight(104);
    obj.Hnm4:setVisible(false);

    obj.Hnm5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hnm5:setParent(obj.HnmNave);
    obj.Hnm5:setName("Hnm5");
    obj.Hnm5:setSRC("/Naves/H/2 - Hnm/5.png");
    obj.Hnm5:setLeft(500);
    obj.Hnm5:setTop(165);
    obj.Hnm5:setWidth(100);
    obj.Hnm5:setHeight(104);
    obj.Hnm5:setVisible(false);

    obj.Hnm6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hnm6:setParent(obj.HnmNave);
    obj.Hnm6:setName("Hnm6");
    obj.Hnm6:setSRC("/Naves/H/2 - Hnm/6.png");
    obj.Hnm6:setLeft(500);
    obj.Hnm6:setTop(165);
    obj.Hnm6:setWidth(95);
    obj.Hnm6:setHeight(104);
    obj.Hnm6:setVisible(false);

    obj.Hnm7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hnm7:setParent(obj.HnmNave);
    obj.Hnm7:setName("Hnm7");
    obj.Hnm7:setSRC("/Naves/H/2 - Hnm/7.png");
    obj.Hnm7:setLeft(500);
    obj.Hnm7:setTop(165);
    obj.Hnm7:setWidth(100);
    obj.Hnm7:setHeight(120);
    obj.Hnm7:setVisible(false);

    obj.Hnm8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hnm8:setParent(obj.HnmNave);
    obj.Hnm8:setName("Hnm8");
    obj.Hnm8:setSRC("/Naves/H/2 - Hnm/8.png");
    obj.Hnm8:setLeft(500);
    obj.Hnm8:setTop(165);
    obj.Hnm8:setWidth(100);
    obj.Hnm8:setHeight(120);
    obj.Hnm8:setVisible(false);

    obj.model2 = GUI.fromHandle(_obj_newObject("label"));
    obj.model2:setParent(obj.HnmNave);
    obj.model2:setName("model2");
    obj.model2:setLeft(153.13);
    obj.model2:setTop(95.50);
    obj.model2:setWidth(173.63);
    obj.model2:setHeight(47.25);
    obj.model2:setHorzTextAlign("center");
    obj.model2:setFontSize(30);
    lfm_setPropAsString(obj.model2, "fontStyle",  "bold");
    obj.model2:setText("Hnm");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.HnmNave);
    obj.edit4:setField("nomeNave2");
    obj.edit4:setLeft(153.12);
    obj.edit4:setTop(149.50);
    obj.edit4:setWidth(173.62);
    obj.edit4:setHeight(47.25);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontSize(30);
    lfm_setPropAsString(obj.edit4, "fontStyle",  "bold");
    obj.edit4:setTransparent(true);
    obj.edit4:setName("edit4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.HnmNave);
    obj.label2:setField("nivelNave2");
    obj.label2:setLeft(153.12);
    obj.label2:setTop(203.50);
    obj.label2:setWidth(173.62);
    obj.label2:setHeight(47.25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(30);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setName("label2");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.HnmNave);
    obj.textEditor3:setField("Textoanotacao3");
    obj.textEditor3:setLeft(334.25);
    obj.textEditor3:setTop(276.25);
    obj.textEditor3:setWidth(222);
    obj.textEditor3:setHeight(111);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setName("textEditor3");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.HnmNave);
    obj.textEditor4:setField("Textoanotacao4");
    obj.textEditor4:setLeft(558.25);
    obj.textEditor4:setTop(276.25);
    obj.textEditor4:setWidth(229);
    obj.textEditor4:setHeight(111);
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setName("textEditor4");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.HnmNave);
    obj.button2:setText("UP");
    lfm_setPropAsString(obj.button2, "fontStyle",  "bold");
    obj.button2:setFontColor("yellow");
    obj.button2:setLeft(148.75);
    obj.button2:setTop(265.50);
    obj.button2:setWidth(30);
    obj.button2:setHeight(27);
    obj.button2:setName("button2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.HnmNave);
    obj.layout2:setLeft(1);
    obj.layout2:setTop(1);
    obj.layout2:setWidth(250);
    obj.layout2:setHeight(222);
    obj.layout2:setAlign("client");
    obj.layout2:setName("layout2");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setType("number");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setLeft(519);
    obj.edit5:setTop(112);
    obj.edit5:setWidth(25);
    obj.edit5:setHeight(25);
    obj.edit5:setField("minMin2");
    obj.edit5:setName("edit5");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setField("minMin2");
    obj.dataLink2:setName("dataLink2");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setType("number");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setLeft(548);
    obj.edit6:setTop(112);
    obj.edit6:setWidth(25);
    obj.edit6:setHeight(25);
    obj.edit6:setField("maxMin2");
    obj.edit6:setName("edit6");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.layout2);
    obj.progressBar2:setLeft(495);
    obj.progressBar2:setTop(138);
    obj.progressBar2:setWidth(105);
    obj.progressBar2:setHeight(20.50);
    obj.progressBar2:setColor("red");
    obj.progressBar2:setHitTest(true);
    obj.progressBar2:setMax(1);
    obj.progressBar2:setField("usosMin2");
    obj.progressBar2:setName("progressBar2");

    obj.HppNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.HppNave:setParent(obj.Lnave1);
    obj.HppNave:setName("HppNave");
    obj.HppNave:setAlign("client");
    obj.HppNave:setVisible(false);

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.HppNave);
    obj.image19:setSRC("/imagens/fundo.png");
    obj.image19:setLeft(333);
    obj.image19:setTop(62);
    obj.image19:setWidth(452);
    obj.image19:setHeight(323);
    obj.image19:setName("image19");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.HppNave);
    obj.image20:setSRC("/imagens/CirculoNave.png");
    obj.image20:setWidth(459);
    obj.image20:setHeight(330);
    obj.image20:setLeft(330.50);
    obj.image20:setTop(60);
    obj.image20:setName("image20");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.HppNave);
    obj.image21:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image21:setLeft(50);
    obj.image21:setTop(94);
    obj.image21:setWidth(279);
    obj.image21:setHeight(54);
    obj.image21:setName("image21");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.HppNave);
    obj.image22:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image22:setLeft(50);
    obj.image22:setTop(148);
    obj.image22:setWidth(279);
    obj.image22:setHeight(54);
    obj.image22:setName("image22");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.HppNave);
    obj.image23:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image23:setLeft(50);
    obj.image23:setTop(201);
    obj.image23:setWidth(279);
    obj.image23:setHeight(54);
    obj.image23:setName("image23");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.HppNave);
    obj.image24:setSRC("/imagens/model.png");
    obj.image24:setLeft(59);
    obj.image24:setTop(110);
    obj.image24:setWidth(91);
    obj.image24:setHeight(19);
    obj.image24:setName("image24");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.HppNave);
    obj.image25:setSRC("/imagens/nome.png");
    obj.image25:setLeft(59);
    obj.image25:setTop(168);
    obj.image25:setWidth(74);
    obj.image25:setHeight(19);
    obj.image25:setName("image25");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.HppNave);
    obj.image26:setSRC("/imagens/nivelNave.png");
    obj.image26:setLeft(59);
    obj.image26:setTop(216);
    obj.image26:setWidth(71);
    obj.image26:setHeight(25);
    obj.image26:setName("image26");

    obj.Hpp1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hpp1:setParent(obj.HppNave);
    obj.Hpp1:setName("Hpp1");
    obj.Hpp1:setSRC("/Naves/H/3 - Hpp/1.png");
    obj.Hpp1:setLeft(500);
    obj.Hpp1:setTop(165);
    obj.Hpp1:setWidth(95);
    obj.Hpp1:setHeight(104);
    obj.Hpp1:setVisible(false);

    obj.Hpp2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hpp2:setParent(obj.HppNave);
    obj.Hpp2:setName("Hpp2");
    obj.Hpp2:setSRC("/Naves/H/3 - Hpp/2.png");
    obj.Hpp2:setLeft(500);
    obj.Hpp2:setTop(165);
    obj.Hpp2:setWidth(120);
    obj.Hpp2:setHeight(114);
    obj.Hpp2:setVisible(false);

    obj.Hpp3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hpp3:setParent(obj.HppNave);
    obj.Hpp3:setName("Hpp3");
    obj.Hpp3:setSRC("/Naves/H/3 - Hpp/3.png");
    obj.Hpp3:setLeft(500);
    obj.Hpp3:setTop(165);
    obj.Hpp3:setWidth(120);
    obj.Hpp3:setHeight(106);
    obj.Hpp3:setVisible(false);

    obj.Hpp4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hpp4:setParent(obj.HppNave);
    obj.Hpp4:setName("Hpp4");
    obj.Hpp4:setSRC("/Naves/H/3 - Hpp/4.png");
    obj.Hpp4:setLeft(500);
    obj.Hpp4:setTop(165);
    obj.Hpp4:setWidth(120);
    obj.Hpp4:setHeight(104);
    obj.Hpp4:setVisible(false);

    obj.Hpp5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hpp5:setParent(obj.HppNave);
    obj.Hpp5:setName("Hpp5");
    obj.Hpp5:setSRC("/Naves/H/3 - Hpp/5.png");
    obj.Hpp5:setLeft(500);
    obj.Hpp5:setTop(165);
    obj.Hpp5:setWidth(100);
    obj.Hpp5:setHeight(104);
    obj.Hpp5:setVisible(false);

    obj.Hpp6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hpp6:setParent(obj.HppNave);
    obj.Hpp6:setName("Hpp6");
    obj.Hpp6:setSRC("/Naves/H/3 - Hpp/6.png");
    obj.Hpp6:setLeft(500);
    obj.Hpp6:setTop(165);
    obj.Hpp6:setWidth(95);
    obj.Hpp6:setHeight(104);
    obj.Hpp6:setVisible(false);

    obj.Hpp7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hpp7:setParent(obj.HppNave);
    obj.Hpp7:setName("Hpp7");
    obj.Hpp7:setSRC("/Naves/H/3 - Hpp/7.png");
    obj.Hpp7:setLeft(500);
    obj.Hpp7:setTop(165);
    obj.Hpp7:setWidth(100);
    obj.Hpp7:setHeight(120);
    obj.Hpp7:setVisible(false);

    obj.Hpp8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Hpp8:setParent(obj.HppNave);
    obj.Hpp8:setName("Hpp8");
    obj.Hpp8:setSRC("/Naves/H/3 - Hpp/8.png");
    obj.Hpp8:setLeft(500);
    obj.Hpp8:setTop(165);
    obj.Hpp8:setWidth(100);
    obj.Hpp8:setHeight(120);
    obj.Hpp8:setVisible(false);

    obj.model3 = GUI.fromHandle(_obj_newObject("label"));
    obj.model3:setParent(obj.HppNave);
    obj.model3:setName("model3");
    obj.model3:setLeft(153.13);
    obj.model3:setTop(95.50);
    obj.model3:setWidth(173.63);
    obj.model3:setHeight(47.25);
    obj.model3:setHorzTextAlign("center");
    obj.model3:setFontSize(30);
    lfm_setPropAsString(obj.model3, "fontStyle",  "bold");
    obj.model3:setText("Hpp");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.HppNave);
    obj.edit7:setField("nomeNave3");
    obj.edit7:setLeft(153.12);
    obj.edit7:setTop(149.50);
    obj.edit7:setWidth(173.62);
    obj.edit7:setHeight(47.25);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontSize(30);
    lfm_setPropAsString(obj.edit7, "fontStyle",  "bold");
    obj.edit7:setTransparent(true);
    obj.edit7:setName("edit7");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.HppNave);
    obj.label3:setField("nivelNave3");
    obj.label3:setLeft(153.12);
    obj.label3:setTop(203.50);
    obj.label3:setWidth(173.62);
    obj.label3:setHeight(47.25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontSize(30);
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setName("label3");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.HppNave);
    obj.textEditor5:setField("Textoanotacao5");
    obj.textEditor5:setLeft(334.25);
    obj.textEditor5:setTop(276.25);
    obj.textEditor5:setWidth(222);
    obj.textEditor5:setHeight(111);
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setName("textEditor5");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.HppNave);
    obj.textEditor6:setField("Textoanotacao6");
    obj.textEditor6:setLeft(558.25);
    obj.textEditor6:setTop(276.25);
    obj.textEditor6:setWidth(229);
    obj.textEditor6:setHeight(111);
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setName("textEditor6");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.HppNave);
    obj.button3:setText("UP");
    lfm_setPropAsString(obj.button3, "fontStyle",  "bold");
    obj.button3:setFontColor("yellow");
    obj.button3:setLeft(148.75);
    obj.button3:setTop(265.50);
    obj.button3:setWidth(30);
    obj.button3:setHeight(27);
    obj.button3:setName("button3");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.HppNave);
    obj.layout3:setLeft(1);
    obj.layout3:setTop(1);
    obj.layout3:setWidth(250);
    obj.layout3:setHeight(222);
    obj.layout3:setAlign("client");
    obj.layout3:setName("layout3");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setType("number");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setLeft(519);
    obj.edit8:setTop(112);
    obj.edit8:setWidth(25);
    obj.edit8:setHeight(25);
    obj.edit8:setField("minMin3");
    obj.edit8:setName("edit8");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout3);
    obj.dataLink3:setField("minMin3");
    obj.dataLink3:setName("dataLink3");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setType("number");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setLeft(548);
    obj.edit9:setTop(112);
    obj.edit9:setWidth(25);
    obj.edit9:setHeight(25);
    obj.edit9:setField("maxMin3");
    obj.edit9:setName("edit9");

    obj.progressBar3 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar3:setParent(obj.layout3);
    obj.progressBar3:setLeft(495);
    obj.progressBar3:setTop(138);
    obj.progressBar3:setWidth(105);
    obj.progressBar3:setHeight(20.50);
    obj.progressBar3:setColor("red");
    obj.progressBar3:setHitTest(true);
    obj.progressBar3:setMax(1);
    obj.progressBar3:setField("usosMin3");
    obj.progressBar3:setName("progressBar3");

    obj.HjKLNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.HjKLNave:setParent(obj.Lnave1);
    obj.HjKLNave:setName("HjKLNave");
    obj.HjKLNave:setAlign("client");
    obj.HjKLNave:setVisible(false);

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.HjKLNave);
    obj.image27:setSRC("/imagens/fundo.png");
    obj.image27:setLeft(333);
    obj.image27:setTop(62);
    obj.image27:setWidth(452);
    obj.image27:setHeight(323);
    obj.image27:setName("image27");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.HjKLNave);
    obj.image28:setSRC("/imagens/CirculoNave.png");
    obj.image28:setWidth(459);
    obj.image28:setHeight(330);
    obj.image28:setLeft(330.50);
    obj.image28:setTop(60);
    obj.image28:setName("image28");

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.HjKLNave);
    obj.image29:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image29:setLeft(50);
    obj.image29:setTop(94);
    obj.image29:setWidth(279);
    obj.image29:setHeight(54);
    obj.image29:setName("image29");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.HjKLNave);
    obj.image30:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image30:setLeft(50);
    obj.image30:setTop(148);
    obj.image30:setWidth(279);
    obj.image30:setHeight(54);
    obj.image30:setName("image30");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.HjKLNave);
    obj.image31:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image31:setLeft(50);
    obj.image31:setTop(201);
    obj.image31:setWidth(279);
    obj.image31:setHeight(54);
    obj.image31:setName("image31");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.HjKLNave);
    obj.image32:setSRC("/imagens/model.png");
    obj.image32:setLeft(59);
    obj.image32:setTop(110);
    obj.image32:setWidth(91);
    obj.image32:setHeight(19);
    obj.image32:setName("image32");

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.HjKLNave);
    obj.image33:setSRC("/imagens/nome.png");
    obj.image33:setLeft(59);
    obj.image33:setTop(168);
    obj.image33:setWidth(74);
    obj.image33:setHeight(19);
    obj.image33:setName("image33");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.HjKLNave);
    obj.image34:setSRC("/imagens/nivelNave.png");
    obj.image34:setLeft(59);
    obj.image34:setTop(216);
    obj.image34:setWidth(71);
    obj.image34:setHeight(25);
    obj.image34:setName("image34");

    obj.HjKL1 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjKL1:setParent(obj.HjKLNave);
    obj.HjKL1:setName("HjKL1");
    obj.HjKL1:setSRC("/Naves/H/4 - HjKL/1.png");
    obj.HjKL1:setLeft(500);
    obj.HjKL1:setTop(165);
    obj.HjKL1:setWidth(95);
    obj.HjKL1:setHeight(104);
    obj.HjKL1:setVisible(false);

    obj.HjKL2 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjKL2:setParent(obj.HjKLNave);
    obj.HjKL2:setName("HjKL2");
    obj.HjKL2:setSRC("/Naves/H/4 - HjKL/2.png");
    obj.HjKL2:setLeft(500);
    obj.HjKL2:setTop(165);
    obj.HjKL2:setWidth(120);
    obj.HjKL2:setHeight(114);
    obj.HjKL2:setVisible(false);

    obj.HjKL3 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjKL3:setParent(obj.HjKLNave);
    obj.HjKL3:setName("HjKL3");
    obj.HjKL3:setSRC("/Naves/H/4 - HjKL/3.png");
    obj.HjKL3:setLeft(500);
    obj.HjKL3:setTop(165);
    obj.HjKL3:setWidth(120);
    obj.HjKL3:setHeight(106);
    obj.HjKL3:setVisible(false);

    obj.HjKL4 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjKL4:setParent(obj.HjKLNave);
    obj.HjKL4:setName("HjKL4");
    obj.HjKL4:setSRC("/Naves/H/4 - HjKL/4.png");
    obj.HjKL4:setLeft(500);
    obj.HjKL4:setTop(165);
    obj.HjKL4:setWidth(120);
    obj.HjKL4:setHeight(104);
    obj.HjKL4:setVisible(false);

    obj.HjKL5 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjKL5:setParent(obj.HjKLNave);
    obj.HjKL5:setName("HjKL5");
    obj.HjKL5:setSRC("/Naves/H/4 - HjKL/5.png");
    obj.HjKL5:setLeft(500);
    obj.HjKL5:setTop(165);
    obj.HjKL5:setWidth(100);
    obj.HjKL5:setHeight(104);
    obj.HjKL5:setVisible(false);

    obj.HjKL6 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjKL6:setParent(obj.HjKLNave);
    obj.HjKL6:setName("HjKL6");
    obj.HjKL6:setSRC("/Naves/H/4 - HjKL/6.png");
    obj.HjKL6:setLeft(500);
    obj.HjKL6:setTop(165);
    obj.HjKL6:setWidth(95);
    obj.HjKL6:setHeight(104);
    obj.HjKL6:setVisible(false);

    obj.HjKL7 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjKL7:setParent(obj.HjKLNave);
    obj.HjKL7:setName("HjKL7");
    obj.HjKL7:setSRC("/Naves/H/4 - HjKL/7.png");
    obj.HjKL7:setLeft(500);
    obj.HjKL7:setTop(165);
    obj.HjKL7:setWidth(100);
    obj.HjKL7:setHeight(120);
    obj.HjKL7:setVisible(false);

    obj.HjKL8 = GUI.fromHandle(_obj_newObject("image"));
    obj.HjKL8:setParent(obj.HjKLNave);
    obj.HjKL8:setName("HjKL8");
    obj.HjKL8:setSRC("/Naves/H/4 - HjKL/8.png");
    obj.HjKL8:setLeft(500);
    obj.HjKL8:setTop(165);
    obj.HjKL8:setWidth(100);
    obj.HjKL8:setHeight(120);
    obj.HjKL8:setVisible(false);

    obj.model4 = GUI.fromHandle(_obj_newObject("label"));
    obj.model4:setParent(obj.HjKLNave);
    obj.model4:setName("model4");
    obj.model4:setLeft(153.13);
    obj.model4:setTop(95.50);
    obj.model4:setWidth(173.63);
    obj.model4:setHeight(47.25);
    obj.model4:setHorzTextAlign("center");
    obj.model4:setFontSize(30);
    lfm_setPropAsString(obj.model4, "fontStyle",  "bold");
    obj.model4:setText("HjKL");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.HjKLNave);
    obj.edit10:setField("nomeNave4");
    obj.edit10:setLeft(153.12);
    obj.edit10:setTop(149.50);
    obj.edit10:setWidth(173.62);
    obj.edit10:setHeight(47.25);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(30);
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");
    obj.edit10:setTransparent(true);
    obj.edit10:setName("edit10");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.HjKLNave);
    obj.label4:setField("nivelNave4");
    obj.label4:setLeft(153.12);
    obj.label4:setTop(203.50);
    obj.label4:setWidth(173.62);
    obj.label4:setHeight(47.25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(30);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setText("0");
    obj.label4:setName("label4");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.HjKLNave);
    obj.textEditor7:setField("Textoanotacao7");
    obj.textEditor7:setLeft(334.25);
    obj.textEditor7:setTop(276.25);
    obj.textEditor7:setWidth(222);
    obj.textEditor7:setHeight(111);
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setName("textEditor7");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.HjKLNave);
    obj.textEditor8:setField("Textoanotacao8");
    obj.textEditor8:setLeft(558.25);
    obj.textEditor8:setTop(276.25);
    obj.textEditor8:setWidth(229);
    obj.textEditor8:setHeight(111);
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setName("textEditor8");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.HjKLNave);
    obj.button4:setText("UP");
    lfm_setPropAsString(obj.button4, "fontStyle",  "bold");
    obj.button4:setFontColor("yellow");
    obj.button4:setLeft(148.75);
    obj.button4:setTop(265.50);
    obj.button4:setWidth(30);
    obj.button4:setHeight(27);
    obj.button4:setName("button4");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.HjKLNave);
    obj.layout4:setLeft(1);
    obj.layout4:setTop(1);
    obj.layout4:setWidth(250);
    obj.layout4:setHeight(222);
    obj.layout4:setAlign("client");
    obj.layout4:setName("layout4");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout4);
    obj.edit11:setType("number");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setLeft(519);
    obj.edit11:setTop(112);
    obj.edit11:setWidth(25);
    obj.edit11:setHeight(25);
    obj.edit11:setField("minMin4");
    obj.edit11:setName("edit11");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout4);
    obj.dataLink4:setField("minMin4");
    obj.dataLink4:setName("dataLink4");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout4);
    obj.edit12:setType("number");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setLeft(548);
    obj.edit12:setTop(112);
    obj.edit12:setWidth(25);
    obj.edit12:setHeight(25);
    obj.edit12:setField("maxMin4");
    obj.edit12:setName("edit12");

    obj.progressBar4 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar4:setParent(obj.layout4);
    obj.progressBar4:setLeft(495);
    obj.progressBar4:setTop(138);
    obj.progressBar4:setWidth(105);
    obj.progressBar4:setHeight(20.50);
    obj.progressBar4:setColor("red");
    obj.progressBar4:setHitTest(true);
    obj.progressBar4:setMax(1);
    obj.progressBar4:setField("usosMin4");
    obj.progressBar4:setName("progressBar4");

    obj.HccDNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.HccDNave:setParent(obj.Lnave1);
    obj.HccDNave:setName("HccDNave");
    obj.HccDNave:setAlign("client");
    obj.HccDNave:setVisible(false);

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.HccDNave);
    obj.image35:setSRC("/imagens/fundo.png");
    obj.image35:setLeft(333);
    obj.image35:setTop(62);
    obj.image35:setWidth(452);
    obj.image35:setHeight(323);
    obj.image35:setName("image35");

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.HccDNave);
    obj.image36:setSRC("/imagens/CirculoNave.png");
    obj.image36:setWidth(459);
    obj.image36:setHeight(330);
    obj.image36:setLeft(330.50);
    obj.image36:setTop(60);
    obj.image36:setName("image36");

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.HccDNave);
    obj.image37:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image37:setLeft(50);
    obj.image37:setTop(94);
    obj.image37:setWidth(279);
    obj.image37:setHeight(54);
    obj.image37:setName("image37");

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.HccDNave);
    obj.image38:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image38:setLeft(50);
    obj.image38:setTop(148);
    obj.image38:setWidth(279);
    obj.image38:setHeight(54);
    obj.image38:setName("image38");

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.HccDNave);
    obj.image39:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image39:setLeft(50);
    obj.image39:setTop(201);
    obj.image39:setWidth(279);
    obj.image39:setHeight(54);
    obj.image39:setName("image39");

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.HccDNave);
    obj.image40:setSRC("/imagens/model.png");
    obj.image40:setLeft(59);
    obj.image40:setTop(110);
    obj.image40:setWidth(91);
    obj.image40:setHeight(19);
    obj.image40:setName("image40");

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.HccDNave);
    obj.image41:setSRC("/imagens/nome.png");
    obj.image41:setLeft(59);
    obj.image41:setTop(168);
    obj.image41:setWidth(74);
    obj.image41:setHeight(19);
    obj.image41:setName("image41");

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.HccDNave);
    obj.image42:setSRC("/imagens/nivelNave.png");
    obj.image42:setLeft(59);
    obj.image42:setTop(216);
    obj.image42:setWidth(71);
    obj.image42:setHeight(25);
    obj.image42:setName("image42");

    obj.HccD1 = GUI.fromHandle(_obj_newObject("image"));
    obj.HccD1:setParent(obj.HccDNave);
    obj.HccD1:setName("HccD1");
    obj.HccD1:setSRC("/Naves/H/5 - HccD/1.png");
    obj.HccD1:setLeft(500);
    obj.HccD1:setTop(165);
    obj.HccD1:setWidth(95);
    obj.HccD1:setHeight(104);
    obj.HccD1:setVisible(false);

    obj.HccD2 = GUI.fromHandle(_obj_newObject("image"));
    obj.HccD2:setParent(obj.HccDNave);
    obj.HccD2:setName("HccD2");
    obj.HccD2:setSRC("/Naves/H/5 - HccD/2.png");
    obj.HccD2:setLeft(500);
    obj.HccD2:setTop(165);
    obj.HccD2:setWidth(120);
    obj.HccD2:setHeight(114);
    obj.HccD2:setVisible(false);

    obj.HccD3 = GUI.fromHandle(_obj_newObject("image"));
    obj.HccD3:setParent(obj.HccDNave);
    obj.HccD3:setName("HccD3");
    obj.HccD3:setSRC("/Naves/H/5 - HccD/3.png");
    obj.HccD3:setLeft(500);
    obj.HccD3:setTop(165);
    obj.HccD3:setWidth(120);
    obj.HccD3:setHeight(106);
    obj.HccD3:setVisible(false);

    obj.HccD4 = GUI.fromHandle(_obj_newObject("image"));
    obj.HccD4:setParent(obj.HccDNave);
    obj.HccD4:setName("HccD4");
    obj.HccD4:setSRC("/Naves/H/5 - HccD/4.png");
    obj.HccD4:setLeft(500);
    obj.HccD4:setTop(165);
    obj.HccD4:setWidth(120);
    obj.HccD4:setHeight(104);
    obj.HccD4:setVisible(false);

    obj.HccD5 = GUI.fromHandle(_obj_newObject("image"));
    obj.HccD5:setParent(obj.HccDNave);
    obj.HccD5:setName("HccD5");
    obj.HccD5:setSRC("/Naves/H/5 - HccD/5.png");
    obj.HccD5:setLeft(500);
    obj.HccD5:setTop(165);
    obj.HccD5:setWidth(100);
    obj.HccD5:setHeight(104);
    obj.HccD5:setVisible(false);

    obj.HccD6 = GUI.fromHandle(_obj_newObject("image"));
    obj.HccD6:setParent(obj.HccDNave);
    obj.HccD6:setName("HccD6");
    obj.HccD6:setSRC("/Naves/H/5 - HccD/6.png");
    obj.HccD6:setLeft(500);
    obj.HccD6:setTop(165);
    obj.HccD6:setWidth(95);
    obj.HccD6:setHeight(104);
    obj.HccD6:setVisible(false);

    obj.HccD7 = GUI.fromHandle(_obj_newObject("image"));
    obj.HccD7:setParent(obj.HccDNave);
    obj.HccD7:setName("HccD7");
    obj.HccD7:setSRC("/Naves/H/5 - HccD/7.png");
    obj.HccD7:setLeft(500);
    obj.HccD7:setTop(165);
    obj.HccD7:setWidth(100);
    obj.HccD7:setHeight(120);
    obj.HccD7:setVisible(false);

    obj.HccD8 = GUI.fromHandle(_obj_newObject("image"));
    obj.HccD8:setParent(obj.HccDNave);
    obj.HccD8:setName("HccD8");
    obj.HccD8:setSRC("/Naves/H/5 - HccD/8.png");
    obj.HccD8:setLeft(500);
    obj.HccD8:setTop(165);
    obj.HccD8:setWidth(100);
    obj.HccD8:setHeight(120);
    obj.HccD8:setVisible(false);

    obj.model5 = GUI.fromHandle(_obj_newObject("label"));
    obj.model5:setParent(obj.HccDNave);
    obj.model5:setName("model5");
    obj.model5:setLeft(153.13);
    obj.model5:setTop(95.50);
    obj.model5:setWidth(173.63);
    obj.model5:setHeight(47.25);
    obj.model5:setHorzTextAlign("center");
    obj.model5:setFontSize(30);
    lfm_setPropAsString(obj.model5, "fontStyle",  "bold");
    obj.model5:setText("HccD");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.HccDNave);
    obj.edit13:setField("nomeNave5");
    obj.edit13:setLeft(153.12);
    obj.edit13:setTop(149.50);
    obj.edit13:setWidth(173.62);
    obj.edit13:setHeight(47.25);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(30);
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setTransparent(true);
    obj.edit13:setName("edit13");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.HccDNave);
    obj.label5:setField("nivelNave5");
    obj.label5:setLeft(153.12);
    obj.label5:setTop(203.50);
    obj.label5:setWidth(173.62);
    obj.label5:setHeight(47.25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontSize(30);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setText("0");
    obj.label5:setName("label5");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.HccDNave);
    obj.textEditor9:setField("Textoanotacao8");
    obj.textEditor9:setLeft(334.25);
    obj.textEditor9:setTop(276.25);
    obj.textEditor9:setWidth(222);
    obj.textEditor9:setHeight(111);
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setName("textEditor9");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.HccDNave);
    obj.textEditor10:setField("Textoanotacao9");
    obj.textEditor10:setLeft(558.25);
    obj.textEditor10:setTop(276.25);
    obj.textEditor10:setWidth(229);
    obj.textEditor10:setHeight(111);
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setName("textEditor10");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.HccDNave);
    obj.button5:setText("UP");
    lfm_setPropAsString(obj.button5, "fontStyle",  "bold");
    obj.button5:setFontColor("yellow");
    obj.button5:setLeft(148.75);
    obj.button5:setTop(265.50);
    obj.button5:setWidth(30);
    obj.button5:setHeight(27);
    obj.button5:setName("button5");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.HccDNave);
    obj.layout5:setLeft(1);
    obj.layout5:setTop(1);
    obj.layout5:setWidth(250);
    obj.layout5:setHeight(222);
    obj.layout5:setAlign("client");
    obj.layout5:setName("layout5");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout5);
    obj.edit14:setType("number");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setLeft(519);
    obj.edit14:setTop(112);
    obj.edit14:setWidth(25);
    obj.edit14:setHeight(25);
    obj.edit14:setField("minMin5");
    obj.edit14:setName("edit14");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout5);
    obj.dataLink5:setField("minMin5");
    obj.dataLink5:setName("dataLink5");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout5);
    obj.edit15:setType("number");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setLeft(548);
    obj.edit15:setTop(112);
    obj.edit15:setWidth(25);
    obj.edit15:setHeight(25);
    obj.edit15:setField("maxMin5");
    obj.edit15:setName("edit15");

    obj.progressBar5 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar5:setParent(obj.layout5);
    obj.progressBar5:setLeft(495);
    obj.progressBar5:setTop(138);
    obj.progressBar5:setWidth(105);
    obj.progressBar5:setHeight(20.50);
    obj.progressBar5:setColor("red");
    obj.progressBar5:setHitTest(true);
    obj.progressBar5:setMax(1);
    obj.progressBar5:setField("usosMin5");
    obj.progressBar5:setName("progressBar5");

    obj.H2bNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.H2bNave:setParent(obj.Lnave1);
    obj.H2bNave:setName("H2bNave");
    obj.H2bNave:setAlign("client");
    obj.H2bNave:setVisible(false);

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.H2bNave);
    obj.image43:setSRC("/imagens/fundo.png");
    obj.image43:setLeft(333);
    obj.image43:setTop(62);
    obj.image43:setWidth(452);
    obj.image43:setHeight(323);
    obj.image43:setName("image43");

    obj.image44 = GUI.fromHandle(_obj_newObject("image"));
    obj.image44:setParent(obj.H2bNave);
    obj.image44:setSRC("/imagens/CirculoNave.png");
    obj.image44:setWidth(459);
    obj.image44:setHeight(330);
    obj.image44:setLeft(330.50);
    obj.image44:setTop(60);
    obj.image44:setName("image44");

    obj.image45 = GUI.fromHandle(_obj_newObject("image"));
    obj.image45:setParent(obj.H2bNave);
    obj.image45:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image45:setLeft(50);
    obj.image45:setTop(94);
    obj.image45:setWidth(279);
    obj.image45:setHeight(54);
    obj.image45:setName("image45");

    obj.image46 = GUI.fromHandle(_obj_newObject("image"));
    obj.image46:setParent(obj.H2bNave);
    obj.image46:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image46:setLeft(50);
    obj.image46:setTop(148);
    obj.image46:setWidth(279);
    obj.image46:setHeight(54);
    obj.image46:setName("image46");

    obj.image47 = GUI.fromHandle(_obj_newObject("image"));
    obj.image47:setParent(obj.H2bNave);
    obj.image47:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image47:setLeft(50);
    obj.image47:setTop(201);
    obj.image47:setWidth(279);
    obj.image47:setHeight(54);
    obj.image47:setName("image47");

    obj.image48 = GUI.fromHandle(_obj_newObject("image"));
    obj.image48:setParent(obj.H2bNave);
    obj.image48:setSRC("/imagens/model.png");
    obj.image48:setLeft(59);
    obj.image48:setTop(110);
    obj.image48:setWidth(91);
    obj.image48:setHeight(19);
    obj.image48:setName("image48");

    obj.image49 = GUI.fromHandle(_obj_newObject("image"));
    obj.image49:setParent(obj.H2bNave);
    obj.image49:setSRC("/imagens/nome.png");
    obj.image49:setLeft(59);
    obj.image49:setTop(168);
    obj.image49:setWidth(74);
    obj.image49:setHeight(19);
    obj.image49:setName("image49");

    obj.image50 = GUI.fromHandle(_obj_newObject("image"));
    obj.image50:setParent(obj.H2bNave);
    obj.image50:setSRC("/imagens/nivelNave.png");
    obj.image50:setLeft(59);
    obj.image50:setTop(216);
    obj.image50:setWidth(71);
    obj.image50:setHeight(25);
    obj.image50:setName("image50");

    obj.H2b1 = GUI.fromHandle(_obj_newObject("image"));
    obj.H2b1:setParent(obj.H2bNave);
    obj.H2b1:setName("H2b1");
    obj.H2b1:setSRC("/Naves/H/6 - H2b/1.png");
    obj.H2b1:setLeft(500);
    obj.H2b1:setTop(165);
    obj.H2b1:setWidth(95);
    obj.H2b1:setHeight(104);
    obj.H2b1:setVisible(false);

    obj.H2b2 = GUI.fromHandle(_obj_newObject("image"));
    obj.H2b2:setParent(obj.H2bNave);
    obj.H2b2:setName("H2b2");
    obj.H2b2:setSRC("/Naves/H/6 - H2b/2.png");
    obj.H2b2:setLeft(500);
    obj.H2b2:setTop(165);
    obj.H2b2:setWidth(120);
    obj.H2b2:setHeight(114);
    obj.H2b2:setVisible(false);

    obj.H2b3 = GUI.fromHandle(_obj_newObject("image"));
    obj.H2b3:setParent(obj.H2bNave);
    obj.H2b3:setName("H2b3");
    obj.H2b3:setSRC("/Naves/H/6 - H2b/3.png");
    obj.H2b3:setLeft(500);
    obj.H2b3:setTop(165);
    obj.H2b3:setWidth(120);
    obj.H2b3:setHeight(106);
    obj.H2b3:setVisible(false);

    obj.H2b4 = GUI.fromHandle(_obj_newObject("image"));
    obj.H2b4:setParent(obj.H2bNave);
    obj.H2b4:setName("H2b4");
    obj.H2b4:setSRC("/Naves/H/6 - H2b/4.png");
    obj.H2b4:setLeft(500);
    obj.H2b4:setTop(165);
    obj.H2b4:setWidth(120);
    obj.H2b4:setHeight(104);
    obj.H2b4:setVisible(false);

    obj.H2b5 = GUI.fromHandle(_obj_newObject("image"));
    obj.H2b5:setParent(obj.H2bNave);
    obj.H2b5:setName("H2b5");
    obj.H2b5:setSRC("/Naves/H/6 - H2b/5.png");
    obj.H2b5:setLeft(500);
    obj.H2b5:setTop(165);
    obj.H2b5:setWidth(100);
    obj.H2b5:setHeight(104);
    obj.H2b5:setVisible(false);

    obj.H2b6 = GUI.fromHandle(_obj_newObject("image"));
    obj.H2b6:setParent(obj.H2bNave);
    obj.H2b6:setName("H2b6");
    obj.H2b6:setSRC("/Naves/H/6 - H2b/6.png");
    obj.H2b6:setLeft(500);
    obj.H2b6:setTop(165);
    obj.H2b6:setWidth(95);
    obj.H2b6:setHeight(104);
    obj.H2b6:setVisible(false);

    obj.H2b7 = GUI.fromHandle(_obj_newObject("image"));
    obj.H2b7:setParent(obj.H2bNave);
    obj.H2b7:setName("H2b7");
    obj.H2b7:setSRC("/Naves/H/6 - H2b/7.png");
    obj.H2b7:setLeft(500);
    obj.H2b7:setTop(165);
    obj.H2b7:setWidth(100);
    obj.H2b7:setHeight(120);
    obj.H2b7:setVisible(false);

    obj.H2b8 = GUI.fromHandle(_obj_newObject("image"));
    obj.H2b8:setParent(obj.H2bNave);
    obj.H2b8:setName("H2b8");
    obj.H2b8:setSRC("/Naves/H/6 - H2b/8.png");
    obj.H2b8:setLeft(500);
    obj.H2b8:setTop(165);
    obj.H2b8:setWidth(100);
    obj.H2b8:setHeight(120);
    obj.H2b8:setVisible(false);

    obj.model6 = GUI.fromHandle(_obj_newObject("label"));
    obj.model6:setParent(obj.H2bNave);
    obj.model6:setName("model6");
    obj.model6:setLeft(153.13);
    obj.model6:setTop(95.50);
    obj.model6:setWidth(173.63);
    obj.model6:setHeight(47.25);
    obj.model6:setHorzTextAlign("center");
    obj.model6:setFontSize(30);
    lfm_setPropAsString(obj.model6, "fontStyle",  "bold");
    obj.model6:setText("H2b");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.H2bNave);
    obj.edit16:setField("nomeNave6");
    obj.edit16:setLeft(153.12);
    obj.edit16:setTop(149.50);
    obj.edit16:setWidth(173.62);
    obj.edit16:setHeight(47.25);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setFontSize(30);
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");
    obj.edit16:setTransparent(true);
    obj.edit16:setName("edit16");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.H2bNave);
    obj.label6:setField("nivelNave6");
    obj.label6:setLeft(153.12);
    obj.label6:setTop(203.50);
    obj.label6:setWidth(173.62);
    obj.label6:setHeight(47.25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontSize(30);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setText("0");
    obj.label6:setName("label6");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.H2bNave);
    obj.textEditor11:setField("Textoanotacao10");
    obj.textEditor11:setLeft(334.25);
    obj.textEditor11:setTop(276.25);
    obj.textEditor11:setWidth(222);
    obj.textEditor11:setHeight(111);
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setName("textEditor11");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.H2bNave);
    obj.textEditor12:setField("Textoanotacao11");
    obj.textEditor12:setLeft(558.25);
    obj.textEditor12:setTop(276.25);
    obj.textEditor12:setWidth(229);
    obj.textEditor12:setHeight(111);
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setName("textEditor12");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.H2bNave);
    obj.button6:setText("UP");
    lfm_setPropAsString(obj.button6, "fontStyle",  "bold");
    obj.button6:setFontColor("yellow");
    obj.button6:setLeft(148.75);
    obj.button6:setTop(265.50);
    obj.button6:setWidth(30);
    obj.button6:setHeight(27);
    obj.button6:setName("button6");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.H2bNave);
    obj.layout6:setLeft(1);
    obj.layout6:setTop(1);
    obj.layout6:setWidth(250);
    obj.layout6:setHeight(222);
    obj.layout6:setAlign("client");
    obj.layout6:setName("layout6");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout6);
    obj.edit17:setType("number");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setLeft(519);
    obj.edit17:setTop(112);
    obj.edit17:setWidth(25);
    obj.edit17:setHeight(25);
    obj.edit17:setField("minMin6");
    obj.edit17:setName("edit17");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout6);
    obj.dataLink6:setField("minMin6");
    obj.dataLink6:setName("dataLink6");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout6);
    obj.edit18:setType("number");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setLeft(548);
    obj.edit18:setTop(112);
    obj.edit18:setWidth(25);
    obj.edit18:setHeight(25);
    obj.edit18:setField("maxMin6");
    obj.edit18:setName("edit18");

    obj.progressBar6 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar6:setParent(obj.layout6);
    obj.progressBar6:setLeft(495);
    obj.progressBar6:setTop(138);
    obj.progressBar6:setWidth(105);
    obj.progressBar6:setHeight(20.50);
    obj.progressBar6:setColor("red");
    obj.progressBar6:setHitTest(true);
    obj.progressBar6:setMax(1);
    obj.progressBar6:setField("usosMin6");
    obj.progressBar6:setName("progressBar6");

    obj.HhOpNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.HhOpNave:setParent(obj.Lnave1);
    obj.HhOpNave:setName("HhOpNave");
    obj.HhOpNave:setAlign("client");
    obj.HhOpNave:setVisible(false);

    obj.image51 = GUI.fromHandle(_obj_newObject("image"));
    obj.image51:setParent(obj.HhOpNave);
    obj.image51:setSRC("/imagens/fundo.png");
    obj.image51:setLeft(333);
    obj.image51:setTop(62);
    obj.image51:setWidth(452);
    obj.image51:setHeight(323);
    obj.image51:setName("image51");

    obj.image52 = GUI.fromHandle(_obj_newObject("image"));
    obj.image52:setParent(obj.HhOpNave);
    obj.image52:setSRC("/imagens/CirculoNave.png");
    obj.image52:setWidth(459);
    obj.image52:setHeight(330);
    obj.image52:setLeft(330.50);
    obj.image52:setTop(60);
    obj.image52:setName("image52");

    obj.image53 = GUI.fromHandle(_obj_newObject("image"));
    obj.image53:setParent(obj.HhOpNave);
    obj.image53:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image53:setLeft(50);
    obj.image53:setTop(94);
    obj.image53:setWidth(279);
    obj.image53:setHeight(54);
    obj.image53:setName("image53");

    obj.image54 = GUI.fromHandle(_obj_newObject("image"));
    obj.image54:setParent(obj.HhOpNave);
    obj.image54:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image54:setLeft(50);
    obj.image54:setTop(148);
    obj.image54:setWidth(279);
    obj.image54:setHeight(54);
    obj.image54:setName("image54");

    obj.image55 = GUI.fromHandle(_obj_newObject("image"));
    obj.image55:setParent(obj.HhOpNave);
    obj.image55:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image55:setLeft(50);
    obj.image55:setTop(201);
    obj.image55:setWidth(279);
    obj.image55:setHeight(54);
    obj.image55:setName("image55");

    obj.image56 = GUI.fromHandle(_obj_newObject("image"));
    obj.image56:setParent(obj.HhOpNave);
    obj.image56:setSRC("/imagens/model.png");
    obj.image56:setLeft(59);
    obj.image56:setTop(110);
    obj.image56:setWidth(91);
    obj.image56:setHeight(19);
    obj.image56:setName("image56");

    obj.image57 = GUI.fromHandle(_obj_newObject("image"));
    obj.image57:setParent(obj.HhOpNave);
    obj.image57:setSRC("/imagens/nome.png");
    obj.image57:setLeft(59);
    obj.image57:setTop(168);
    obj.image57:setWidth(74);
    obj.image57:setHeight(19);
    obj.image57:setName("image57");

    obj.image58 = GUI.fromHandle(_obj_newObject("image"));
    obj.image58:setParent(obj.HhOpNave);
    obj.image58:setSRC("/imagens/nivelNave.png");
    obj.image58:setLeft(59);
    obj.image58:setTop(216);
    obj.image58:setWidth(71);
    obj.image58:setHeight(25);
    obj.image58:setName("image58");

    obj.HhOp1 = GUI.fromHandle(_obj_newObject("image"));
    obj.HhOp1:setParent(obj.HhOpNave);
    obj.HhOp1:setName("HhOp1");
    obj.HhOp1:setSRC("/Naves/H/7 - HhOp/1.png");
    obj.HhOp1:setLeft(500);
    obj.HhOp1:setTop(165);
    obj.HhOp1:setWidth(95);
    obj.HhOp1:setHeight(104);
    obj.HhOp1:setVisible(false);

    obj.HhOp2 = GUI.fromHandle(_obj_newObject("image"));
    obj.HhOp2:setParent(obj.HhOpNave);
    obj.HhOp2:setName("HhOp2");
    obj.HhOp2:setSRC("/Naves/H/7 - HhOp/2.png");
    obj.HhOp2:setLeft(500);
    obj.HhOp2:setTop(165);
    obj.HhOp2:setWidth(120);
    obj.HhOp2:setHeight(114);
    obj.HhOp2:setVisible(false);

    obj.HhOp3 = GUI.fromHandle(_obj_newObject("image"));
    obj.HhOp3:setParent(obj.HhOpNave);
    obj.HhOp3:setName("HhOp3");
    obj.HhOp3:setSRC("/Naves/H/7 - HhOp/3.png");
    obj.HhOp3:setLeft(500);
    obj.HhOp3:setTop(165);
    obj.HhOp3:setWidth(120);
    obj.HhOp3:setHeight(106);
    obj.HhOp3:setVisible(false);

    obj.HhOp4 = GUI.fromHandle(_obj_newObject("image"));
    obj.HhOp4:setParent(obj.HhOpNave);
    obj.HhOp4:setName("HhOp4");
    obj.HhOp4:setSRC("/Naves/H/7 - HhOp/4.png");
    obj.HhOp4:setLeft(500);
    obj.HhOp4:setTop(165);
    obj.HhOp4:setWidth(120);
    obj.HhOp4:setHeight(104);
    obj.HhOp4:setVisible(false);

    obj.HhOp5 = GUI.fromHandle(_obj_newObject("image"));
    obj.HhOp5:setParent(obj.HhOpNave);
    obj.HhOp5:setName("HhOp5");
    obj.HhOp5:setSRC("/Naves/H/7 - HhOp/5.png");
    obj.HhOp5:setLeft(500);
    obj.HhOp5:setTop(165);
    obj.HhOp5:setWidth(100);
    obj.HhOp5:setHeight(104);
    obj.HhOp5:setVisible(false);

    obj.HhOp6 = GUI.fromHandle(_obj_newObject("image"));
    obj.HhOp6:setParent(obj.HhOpNave);
    obj.HhOp6:setName("HhOp6");
    obj.HhOp6:setSRC("/Naves/H/7 - HhOp/6.png");
    obj.HhOp6:setLeft(500);
    obj.HhOp6:setTop(165);
    obj.HhOp6:setWidth(95);
    obj.HhOp6:setHeight(104);
    obj.HhOp6:setVisible(false);

    obj.HhOp7 = GUI.fromHandle(_obj_newObject("image"));
    obj.HhOp7:setParent(obj.HhOpNave);
    obj.HhOp7:setName("HhOp7");
    obj.HhOp7:setSRC("/Naves/H/7 - HhOp/7.png");
    obj.HhOp7:setLeft(500);
    obj.HhOp7:setTop(165);
    obj.HhOp7:setWidth(100);
    obj.HhOp7:setHeight(120);
    obj.HhOp7:setVisible(false);

    obj.HhOp8 = GUI.fromHandle(_obj_newObject("image"));
    obj.HhOp8:setParent(obj.HhOpNave);
    obj.HhOp8:setName("HhOp8");
    obj.HhOp8:setSRC("/Naves/H/7 - HhOp/8.png");
    obj.HhOp8:setLeft(500);
    obj.HhOp8:setTop(165);
    obj.HhOp8:setWidth(100);
    obj.HhOp8:setHeight(120);
    obj.HhOp8:setVisible(false);

    obj.model7 = GUI.fromHandle(_obj_newObject("label"));
    obj.model7:setParent(obj.HhOpNave);
    obj.model7:setName("model7");
    obj.model7:setLeft(153.13);
    obj.model7:setTop(95.50);
    obj.model7:setWidth(173.63);
    obj.model7:setHeight(47.25);
    obj.model7:setHorzTextAlign("center");
    obj.model7:setFontSize(30);
    lfm_setPropAsString(obj.model7, "fontStyle",  "bold");
    obj.model7:setText("HhOp");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.HhOpNave);
    obj.edit19:setField("nomeNave7");
    obj.edit19:setLeft(153.12);
    obj.edit19:setTop(149.50);
    obj.edit19:setWidth(173.62);
    obj.edit19:setHeight(47.25);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setFontSize(30);
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setTransparent(true);
    obj.edit19:setName("edit19");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.HhOpNave);
    obj.label7:setField("nivelNave7");
    obj.label7:setLeft(153.12);
    obj.label7:setTop(203.50);
    obj.label7:setWidth(173.62);
    obj.label7:setHeight(47.25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontSize(30);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setText("0");
    obj.label7:setName("label7");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.HhOpNave);
    obj.textEditor13:setField("Textoanotacao12");
    obj.textEditor13:setLeft(334.25);
    obj.textEditor13:setTop(276.25);
    obj.textEditor13:setWidth(222);
    obj.textEditor13:setHeight(111);
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setName("textEditor13");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.HhOpNave);
    obj.textEditor14:setField("Textoanotacao13");
    obj.textEditor14:setLeft(558.25);
    obj.textEditor14:setTop(276.25);
    obj.textEditor14:setWidth(229);
    obj.textEditor14:setHeight(111);
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setName("textEditor14");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.HhOpNave);
    obj.button7:setText("UP");
    lfm_setPropAsString(obj.button7, "fontStyle",  "bold");
    obj.button7:setFontColor("yellow");
    obj.button7:setLeft(148.75);
    obj.button7:setTop(265.50);
    obj.button7:setWidth(30);
    obj.button7:setHeight(27);
    obj.button7:setName("button7");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.HhOpNave);
    obj.layout7:setLeft(1);
    obj.layout7:setTop(1);
    obj.layout7:setWidth(250);
    obj.layout7:setHeight(222);
    obj.layout7:setAlign("client");
    obj.layout7:setName("layout7");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout7);
    obj.edit20:setType("number");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setLeft(519);
    obj.edit20:setTop(112);
    obj.edit20:setWidth(25);
    obj.edit20:setHeight(25);
    obj.edit20:setField("minMin7");
    obj.edit20:setName("edit20");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout7);
    obj.dataLink7:setField("minMin7");
    obj.dataLink7:setName("dataLink7");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout7);
    obj.edit21:setType("number");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setLeft(548);
    obj.edit21:setTop(112);
    obj.edit21:setWidth(25);
    obj.edit21:setHeight(25);
    obj.edit21:setField("maxMin7");
    obj.edit21:setName("edit21");

    obj.progressBar7 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar7:setParent(obj.layout7);
    obj.progressBar7:setLeft(495);
    obj.progressBar7:setTop(138);
    obj.progressBar7:setWidth(105);
    obj.progressBar7:setHeight(20.50);
    obj.progressBar7:setColor("red");
    obj.progressBar7:setHitTest(true);
    obj.progressBar7:setMax(1);
    obj.progressBar7:setField("usosMin7");
    obj.progressBar7:setName("progressBar7");

    obj.H3oNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.H3oNave:setParent(obj.Lnave1);
    obj.H3oNave:setName("H3oNave");
    obj.H3oNave:setAlign("client");
    obj.H3oNave:setVisible(false);

    obj.image59 = GUI.fromHandle(_obj_newObject("image"));
    obj.image59:setParent(obj.H3oNave);
    obj.image59:setSRC("/imagens/fundo.png");
    obj.image59:setLeft(333);
    obj.image59:setTop(62);
    obj.image59:setWidth(452);
    obj.image59:setHeight(323);
    obj.image59:setName("image59");

    obj.image60 = GUI.fromHandle(_obj_newObject("image"));
    obj.image60:setParent(obj.H3oNave);
    obj.image60:setSRC("/imagens/CirculoNave.png");
    obj.image60:setWidth(459);
    obj.image60:setHeight(330);
    obj.image60:setLeft(330.50);
    obj.image60:setTop(60);
    obj.image60:setName("image60");

    obj.image61 = GUI.fromHandle(_obj_newObject("image"));
    obj.image61:setParent(obj.H3oNave);
    obj.image61:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image61:setLeft(50);
    obj.image61:setTop(94);
    obj.image61:setWidth(279);
    obj.image61:setHeight(54);
    obj.image61:setName("image61");

    obj.image62 = GUI.fromHandle(_obj_newObject("image"));
    obj.image62:setParent(obj.H3oNave);
    obj.image62:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image62:setLeft(50);
    obj.image62:setTop(148);
    obj.image62:setWidth(279);
    obj.image62:setHeight(54);
    obj.image62:setName("image62");

    obj.image63 = GUI.fromHandle(_obj_newObject("image"));
    obj.image63:setParent(obj.H3oNave);
    obj.image63:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image63:setLeft(50);
    obj.image63:setTop(201);
    obj.image63:setWidth(279);
    obj.image63:setHeight(54);
    obj.image63:setName("image63");

    obj.image64 = GUI.fromHandle(_obj_newObject("image"));
    obj.image64:setParent(obj.H3oNave);
    obj.image64:setSRC("/imagens/model.png");
    obj.image64:setLeft(59);
    obj.image64:setTop(110);
    obj.image64:setWidth(91);
    obj.image64:setHeight(19);
    obj.image64:setName("image64");

    obj.image65 = GUI.fromHandle(_obj_newObject("image"));
    obj.image65:setParent(obj.H3oNave);
    obj.image65:setSRC("/imagens/nome.png");
    obj.image65:setLeft(59);
    obj.image65:setTop(168);
    obj.image65:setWidth(74);
    obj.image65:setHeight(19);
    obj.image65:setName("image65");

    obj.image66 = GUI.fromHandle(_obj_newObject("image"));
    obj.image66:setParent(obj.H3oNave);
    obj.image66:setSRC("/imagens/nivelNave.png");
    obj.image66:setLeft(59);
    obj.image66:setTop(216);
    obj.image66:setWidth(71);
    obj.image66:setHeight(25);
    obj.image66:setName("image66");

    obj.H3o1 = GUI.fromHandle(_obj_newObject("image"));
    obj.H3o1:setParent(obj.H3oNave);
    obj.H3o1:setName("H3o1");
    obj.H3o1:setSRC("/Naves/H/8 - H3o/1.png");
    obj.H3o1:setLeft(500);
    obj.H3o1:setTop(165);
    obj.H3o1:setWidth(95);
    obj.H3o1:setHeight(104);
    obj.H3o1:setVisible(false);

    obj.H3o2 = GUI.fromHandle(_obj_newObject("image"));
    obj.H3o2:setParent(obj.H3oNave);
    obj.H3o2:setName("H3o2");
    obj.H3o2:setSRC("/Naves/H/8 - H3o/2.png");
    obj.H3o2:setLeft(500);
    obj.H3o2:setTop(165);
    obj.H3o2:setWidth(120);
    obj.H3o2:setHeight(114);
    obj.H3o2:setVisible(false);

    obj.H3o3 = GUI.fromHandle(_obj_newObject("image"));
    obj.H3o3:setParent(obj.H3oNave);
    obj.H3o3:setName("H3o3");
    obj.H3o3:setSRC("/Naves/H/8 - H3o/3.png");
    obj.H3o3:setLeft(500);
    obj.H3o3:setTop(165);
    obj.H3o3:setWidth(120);
    obj.H3o3:setHeight(106);
    obj.H3o3:setVisible(false);

    obj.H3o4 = GUI.fromHandle(_obj_newObject("image"));
    obj.H3o4:setParent(obj.H3oNave);
    obj.H3o4:setName("H3o4");
    obj.H3o4:setSRC("/Naves/H/8 - H3o/4.png");
    obj.H3o4:setLeft(500);
    obj.H3o4:setTop(165);
    obj.H3o4:setWidth(120);
    obj.H3o4:setHeight(104);
    obj.H3o4:setVisible(false);

    obj.H3o5 = GUI.fromHandle(_obj_newObject("image"));
    obj.H3o5:setParent(obj.H3oNave);
    obj.H3o5:setName("H3o5");
    obj.H3o5:setSRC("/Naves/H/8 - H3o/5.png");
    obj.H3o5:setLeft(500);
    obj.H3o5:setTop(165);
    obj.H3o5:setWidth(100);
    obj.H3o5:setHeight(104);
    obj.H3o5:setVisible(false);

    obj.H3o6 = GUI.fromHandle(_obj_newObject("image"));
    obj.H3o6:setParent(obj.H3oNave);
    obj.H3o6:setName("H3o6");
    obj.H3o6:setSRC("/Naves/H/8 - H3o/6.png");
    obj.H3o6:setLeft(500);
    obj.H3o6:setTop(165);
    obj.H3o6:setWidth(95);
    obj.H3o6:setHeight(104);
    obj.H3o6:setVisible(false);

    obj.H3o7 = GUI.fromHandle(_obj_newObject("image"));
    obj.H3o7:setParent(obj.H3oNave);
    obj.H3o7:setName("H3o7");
    obj.H3o7:setSRC("/Naves/H/8 - H3o/7.png");
    obj.H3o7:setLeft(500);
    obj.H3o7:setTop(165);
    obj.H3o7:setWidth(100);
    obj.H3o7:setHeight(120);
    obj.H3o7:setVisible(false);

    obj.H3o8 = GUI.fromHandle(_obj_newObject("image"));
    obj.H3o8:setParent(obj.H3oNave);
    obj.H3o8:setName("H3o8");
    obj.H3o8:setSRC("/Naves/H/8 - H3o/8.png");
    obj.H3o8:setLeft(500);
    obj.H3o8:setTop(165);
    obj.H3o8:setWidth(100);
    obj.H3o8:setHeight(120);
    obj.H3o8:setVisible(false);

    obj.model8 = GUI.fromHandle(_obj_newObject("label"));
    obj.model8:setParent(obj.H3oNave);
    obj.model8:setName("model8");
    obj.model8:setLeft(153.13);
    obj.model8:setTop(95.50);
    obj.model8:setWidth(173.63);
    obj.model8:setHeight(47.25);
    obj.model8:setHorzTextAlign("center");
    obj.model8:setFontSize(30);
    lfm_setPropAsString(obj.model8, "fontStyle",  "bold");
    obj.model8:setText("H3o");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.H3oNave);
    obj.edit22:setField("nomeNave8");
    obj.edit22:setLeft(153.12);
    obj.edit22:setTop(149.50);
    obj.edit22:setWidth(173.62);
    obj.edit22:setHeight(47.25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setFontSize(30);
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setTransparent(true);
    obj.edit22:setName("edit22");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.H3oNave);
    obj.label8:setField("nivelNave8");
    obj.label8:setLeft(153.12);
    obj.label8:setTop(203.50);
    obj.label8:setWidth(173.62);
    obj.label8:setHeight(47.25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontSize(30);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setText("0");
    obj.label8:setName("label8");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.H3oNave);
    obj.textEditor15:setField("Textoanotacao14");
    obj.textEditor15:setLeft(334.25);
    obj.textEditor15:setTop(276.25);
    obj.textEditor15:setWidth(222);
    obj.textEditor15:setHeight(111);
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setName("textEditor15");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.H3oNave);
    obj.textEditor16:setField("Textoanotacao15");
    obj.textEditor16:setLeft(558.25);
    obj.textEditor16:setTop(276.25);
    obj.textEditor16:setWidth(229);
    obj.textEditor16:setHeight(111);
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setName("textEditor16");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.H3oNave);
    obj.button8:setText("UP");
    lfm_setPropAsString(obj.button8, "fontStyle",  "bold");
    obj.button8:setFontColor("yellow");
    obj.button8:setLeft(148.75);
    obj.button8:setTop(265.50);
    obj.button8:setWidth(30);
    obj.button8:setHeight(27);
    obj.button8:setName("button8");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.H3oNave);
    obj.layout8:setLeft(1);
    obj.layout8:setTop(1);
    obj.layout8:setWidth(250);
    obj.layout8:setHeight(222);
    obj.layout8:setAlign("client");
    obj.layout8:setName("layout8");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout8);
    obj.edit23:setType("number");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setLeft(519);
    obj.edit23:setTop(112);
    obj.edit23:setWidth(25);
    obj.edit23:setHeight(25);
    obj.edit23:setField("minMin8");
    obj.edit23:setName("edit23");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout8);
    obj.dataLink8:setField("minMin8");
    obj.dataLink8:setName("dataLink8");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout8);
    obj.edit24:setType("number");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setLeft(548);
    obj.edit24:setTop(112);
    obj.edit24:setWidth(25);
    obj.edit24:setHeight(25);
    obj.edit24:setField("maxMin8");
    obj.edit24:setName("edit24");

    obj.progressBar8 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar8:setParent(obj.layout8);
    obj.progressBar8:setLeft(495);
    obj.progressBar8:setTop(138);
    obj.progressBar8:setWidth(105);
    obj.progressBar8:setHeight(20.50);
    obj.progressBar8:setColor("red");
    obj.progressBar8:setHitTest(true);
    obj.progressBar8:setMax(1);
    obj.progressBar8:setField("usosMin8");
    obj.progressBar8:setName("progressBar8");

    obj.BotaoNaveN1 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN1:setParent(obj.Lnave1);
    obj.BotaoNaveN1:setName("BotaoNaveN1");
    obj.BotaoNaveN1:setText("HjQ");
    obj.BotaoNaveN1:setLeft(63.75);
    obj.BotaoNaveN1:setTop(301);
    obj.BotaoNaveN1:setWidth(70.25);
    obj.BotaoNaveN1:setHeight(27);
    obj.BotaoNaveN1:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN1, "fontStyle",  "bold");

    obj.BotaoNaveN2 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN2:setParent(obj.Lnave1);
    obj.BotaoNaveN2:setName("BotaoNaveN2");
    obj.BotaoNaveN2:setText("Hnm");
    obj.BotaoNaveN2:setLeft(138);
    obj.BotaoNaveN2:setTop(301);
    obj.BotaoNaveN2:setWidth(70.25);
    obj.BotaoNaveN2:setHeight(27);
    obj.BotaoNaveN2:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN2, "fontStyle",  "bold");

    obj.BotaoNaveN3 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN3:setParent(obj.Lnave1);
    obj.BotaoNaveN3:setName("BotaoNaveN3");
    obj.BotaoNaveN3:setText("Hpp");
    obj.BotaoNaveN3:setLeft(213);
    obj.BotaoNaveN3:setTop(301);
    obj.BotaoNaveN3:setWidth(70.25);
    obj.BotaoNaveN3:setHeight(27);
    obj.BotaoNaveN3:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN3, "fontStyle",  "bold");

    obj.BotaoNaveN4 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN4:setParent(obj.Lnave1);
    obj.BotaoNaveN4:setName("BotaoNaveN4");
    obj.BotaoNaveN4:setText("HjKL");
    obj.BotaoNaveN4:setLeft(63.75);
    obj.BotaoNaveN4:setTop(333);
    obj.BotaoNaveN4:setWidth(70.25);
    obj.BotaoNaveN4:setHeight(27);
    obj.BotaoNaveN4:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN4, "fontStyle",  "bold");

    obj.BotaoNaveN5 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN5:setParent(obj.Lnave1);
    obj.BotaoNaveN5:setName("BotaoNaveN5");
    obj.BotaoNaveN5:setText("HccD");
    obj.BotaoNaveN5:setLeft(138);
    obj.BotaoNaveN5:setTop(333);
    obj.BotaoNaveN5:setWidth(70.25);
    obj.BotaoNaveN5:setHeight(27);
    obj.BotaoNaveN5:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN5, "fontStyle",  "bold");

    obj.BotaoNaveN6 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN6:setParent(obj.Lnave1);
    obj.BotaoNaveN6:setName("BotaoNaveN6");
    obj.BotaoNaveN6:setText("H2b");
    obj.BotaoNaveN6:setLeft(213);
    obj.BotaoNaveN6:setTop(333);
    obj.BotaoNaveN6:setWidth(70.25);
    obj.BotaoNaveN6:setHeight(27);
    obj.BotaoNaveN6:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN6, "fontStyle",  "bold");

    obj.BotaoNaveN7 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN7:setParent(obj.Lnave1);
    obj.BotaoNaveN7:setName("BotaoNaveN7");
    obj.BotaoNaveN7:setText("HhOp");
    obj.BotaoNaveN7:setLeft(63.75);
    obj.BotaoNaveN7:setTop(365);
    obj.BotaoNaveN7:setWidth(70.25);
    obj.BotaoNaveN7:setHeight(27);
    obj.BotaoNaveN7:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN7, "fontStyle",  "bold");

    obj.BotaoNaveN8 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN8:setParent(obj.Lnave1);
    obj.BotaoNaveN8:setName("BotaoNaveN8");
    obj.BotaoNaveN8:setText("H3o");
    obj.BotaoNaveN8:setLeft(138);
    obj.BotaoNaveN8:setTop(365);
    obj.BotaoNaveN8:setWidth(70.25);
    obj.BotaoNaveN8:setHeight(27);
    obj.BotaoNaveN8:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN8, "fontStyle",  "bold");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.Lnave1);
    obj.dataLink9:setField("nivelNave1");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.Lnave1);
    obj.dataLink10:setField("nivelNave2");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.Lnave1);
    obj.dataLink11:setField("nivelNave3");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.Lnave1);
    obj.dataLink12:setField("nivelNave4");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.Lnave1);
    obj.dataLink13:setField("nivelNave5");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.Lnave1);
    obj.dataLink14:setField("nivelNave6");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.Lnave1);
    obj.dataLink15:setField("nivelNave7");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.Lnave1);
    obj.dataLink16:setField("nivelNave8");
    obj.dataLink16:setName("dataLink16");

    obj.Lnave2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Lnave2:setParent(obj.scrollBox1);
    obj.Lnave2:setName("Lnave2");
    obj.Lnave2:setAlign("client");
    obj.Lnave2:setVisible(false);

    obj.LqwNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.LqwNave:setParent(obj.Lnave2);
    obj.LqwNave:setName("LqwNave");
    obj.LqwNave:setAlign("client");
    obj.LqwNave:setVisible(false);

    obj.image67 = GUI.fromHandle(_obj_newObject("image"));
    obj.image67:setParent(obj.LqwNave);
    obj.image67:setSRC("/imagens/fundo.png");
    obj.image67:setLeft(333);
    obj.image67:setTop(62);
    obj.image67:setWidth(452);
    obj.image67:setHeight(323);
    obj.image67:setName("image67");

    obj.image68 = GUI.fromHandle(_obj_newObject("image"));
    obj.image68:setParent(obj.LqwNave);
    obj.image68:setSRC("/imagens/CirculoNave.png");
    obj.image68:setWidth(459);
    obj.image68:setHeight(330);
    obj.image68:setLeft(330.50);
    obj.image68:setTop(60);
    obj.image68:setName("image68");

    obj.image69 = GUI.fromHandle(_obj_newObject("image"));
    obj.image69:setParent(obj.LqwNave);
    obj.image69:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image69:setLeft(50);
    obj.image69:setTop(94);
    obj.image69:setWidth(279);
    obj.image69:setHeight(54);
    obj.image69:setName("image69");

    obj.image70 = GUI.fromHandle(_obj_newObject("image"));
    obj.image70:setParent(obj.LqwNave);
    obj.image70:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image70:setLeft(50);
    obj.image70:setTop(148);
    obj.image70:setWidth(279);
    obj.image70:setHeight(54);
    obj.image70:setName("image70");

    obj.image71 = GUI.fromHandle(_obj_newObject("image"));
    obj.image71:setParent(obj.LqwNave);
    obj.image71:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image71:setLeft(50);
    obj.image71:setTop(201);
    obj.image71:setWidth(279);
    obj.image71:setHeight(54);
    obj.image71:setName("image71");

    obj.image72 = GUI.fromHandle(_obj_newObject("image"));
    obj.image72:setParent(obj.LqwNave);
    obj.image72:setSRC("/imagens/model.png");
    obj.image72:setLeft(59);
    obj.image72:setTop(110);
    obj.image72:setWidth(91);
    obj.image72:setHeight(19);
    obj.image72:setName("image72");

    obj.image73 = GUI.fromHandle(_obj_newObject("image"));
    obj.image73:setParent(obj.LqwNave);
    obj.image73:setSRC("/imagens/nome.png");
    obj.image73:setLeft(59);
    obj.image73:setTop(168);
    obj.image73:setWidth(74);
    obj.image73:setHeight(19);
    obj.image73:setName("image73");

    obj.image74 = GUI.fromHandle(_obj_newObject("image"));
    obj.image74:setParent(obj.LqwNave);
    obj.image74:setSRC("/imagens/nivelNave.png");
    obj.image74:setLeft(59);
    obj.image74:setTop(216);
    obj.image74:setWidth(71);
    obj.image74:setHeight(25);
    obj.image74:setName("image74");

    obj.Lqw1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lqw1:setParent(obj.LqwNave);
    obj.Lqw1:setName("Lqw1");
    obj.Lqw1:setSRC("/Naves/L/1 - Lqw/1.png");
    obj.Lqw1:setLeft(500);
    obj.Lqw1:setTop(165);
    obj.Lqw1:setWidth(95);
    obj.Lqw1:setHeight(104);
    obj.Lqw1:setVisible(false);

    obj.Lqw2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lqw2:setParent(obj.LqwNave);
    obj.Lqw2:setName("Lqw2");
    obj.Lqw2:setSRC("/Naves/L/1 - Lqw/2.png");
    obj.Lqw2:setLeft(500);
    obj.Lqw2:setTop(165);
    obj.Lqw2:setWidth(120);
    obj.Lqw2:setHeight(114);
    obj.Lqw2:setVisible(false);

    obj.Lqw3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lqw3:setParent(obj.LqwNave);
    obj.Lqw3:setName("Lqw3");
    obj.Lqw3:setSRC("/Naves/L/1 - Lqw/3.png");
    obj.Lqw3:setLeft(500);
    obj.Lqw3:setTop(165);
    obj.Lqw3:setWidth(120);
    obj.Lqw3:setHeight(106);
    obj.Lqw3:setVisible(false);

    obj.Lqw4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lqw4:setParent(obj.LqwNave);
    obj.Lqw4:setName("Lqw4");
    obj.Lqw4:setSRC("/Naves/L/1 - Lqw/4.png");
    obj.Lqw4:setLeft(500);
    obj.Lqw4:setTop(165);
    obj.Lqw4:setWidth(120);
    obj.Lqw4:setHeight(104);
    obj.Lqw4:setVisible(false);

    obj.Lqw5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lqw5:setParent(obj.LqwNave);
    obj.Lqw5:setName("Lqw5");
    obj.Lqw5:setSRC("/Naves/L/1 - Lqw/5.png");
    obj.Lqw5:setLeft(500);
    obj.Lqw5:setTop(165);
    obj.Lqw5:setWidth(100);
    obj.Lqw5:setHeight(104);
    obj.Lqw5:setVisible(false);

    obj.Lqw6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lqw6:setParent(obj.LqwNave);
    obj.Lqw6:setName("Lqw6");
    obj.Lqw6:setSRC("/Naves/L/1 - Lqw/6.png");
    obj.Lqw6:setLeft(500);
    obj.Lqw6:setTop(165);
    obj.Lqw6:setWidth(95);
    obj.Lqw6:setHeight(104);
    obj.Lqw6:setVisible(false);

    obj.Lqw7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lqw7:setParent(obj.LqwNave);
    obj.Lqw7:setName("Lqw7");
    obj.Lqw7:setSRC("/Naves/L/1 - Lqw/7.png");
    obj.Lqw7:setLeft(500);
    obj.Lqw7:setTop(165);
    obj.Lqw7:setWidth(100);
    obj.Lqw7:setHeight(120);
    obj.Lqw7:setVisible(false);

    obj.Lqw8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lqw8:setParent(obj.LqwNave);
    obj.Lqw8:setName("Lqw8");
    obj.Lqw8:setSRC("/Naves/L/1 - Lqw/8.png");
    obj.Lqw8:setLeft(500);
    obj.Lqw8:setTop(165);
    obj.Lqw8:setWidth(100);
    obj.Lqw8:setHeight(120);
    obj.Lqw8:setVisible(false);

    obj.model9 = GUI.fromHandle(_obj_newObject("label"));
    obj.model9:setParent(obj.LqwNave);
    obj.model9:setName("model9");
    obj.model9:setLeft(153.13);
    obj.model9:setTop(95.50);
    obj.model9:setWidth(173.63);
    obj.model9:setHeight(47.25);
    obj.model9:setHorzTextAlign("center");
    obj.model9:setFontSize(30);
    lfm_setPropAsString(obj.model9, "fontStyle",  "bold");
    obj.model9:setText("Lqw");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.LqwNave);
    obj.edit25:setField("nomeNave9");
    obj.edit25:setLeft(153.12);
    obj.edit25:setTop(149.50);
    obj.edit25:setWidth(173.62);
    obj.edit25:setHeight(47.25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setFontSize(30);
    lfm_setPropAsString(obj.edit25, "fontStyle",  "bold");
    obj.edit25:setTransparent(true);
    obj.edit25:setName("edit25");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.LqwNave);
    obj.textEditor17:setField("Textoanotacao16");
    obj.textEditor17:setLeft(334.25);
    obj.textEditor17:setTop(276.25);
    obj.textEditor17:setWidth(222);
    obj.textEditor17:setHeight(111);
    obj.textEditor17:setTransparent(true);
    obj.textEditor17:setName("textEditor17");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.LqwNave);
    obj.textEditor18:setField("Textoanotacao17");
    obj.textEditor18:setLeft(558.25);
    obj.textEditor18:setTop(276.25);
    obj.textEditor18:setWidth(229);
    obj.textEditor18:setHeight(111);
    obj.textEditor18:setTransparent(true);
    obj.textEditor18:setName("textEditor18");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.LqwNave);
    obj.label9:setField("nivelNave9");
    obj.label9:setLeft(153.12);
    obj.label9:setTop(203.50);
    obj.label9:setWidth(173.62);
    obj.label9:setHeight(47.25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontSize(30);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setHitTest(true);
    obj.label9:setName("label9");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.LqwNave);
    obj.button9:setText("UP");
    lfm_setPropAsString(obj.button9, "fontStyle",  "bold");
    obj.button9:setFontColor("yellow");
    obj.button9:setLeft(148.75);
    obj.button9:setTop(265.50);
    obj.button9:setWidth(30);
    obj.button9:setHeight(27);
    obj.button9:setName("button9");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.LqwNave);
    obj.layout9:setLeft(1);
    obj.layout9:setTop(1);
    obj.layout9:setWidth(250);
    obj.layout9:setHeight(222);
    obj.layout9:setAlign("client");
    obj.layout9:setName("layout9");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout9);
    obj.edit26:setType("number");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setLeft(519);
    obj.edit26:setTop(112);
    obj.edit26:setWidth(25);
    obj.edit26:setHeight(25);
    obj.edit26:setField("minMin9");
    obj.edit26:setName("edit26");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout9);
    obj.dataLink17:setField("minMin9");
    obj.dataLink17:setName("dataLink17");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout9);
    obj.edit27:setType("number");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setLeft(548);
    obj.edit27:setTop(112);
    obj.edit27:setWidth(25);
    obj.edit27:setHeight(25);
    obj.edit27:setField("maxMin9");
    obj.edit27:setName("edit27");

    obj.progressBar9 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar9:setParent(obj.layout9);
    obj.progressBar9:setLeft(495);
    obj.progressBar9:setTop(138);
    obj.progressBar9:setWidth(105);
    obj.progressBar9:setHeight(20.50);
    obj.progressBar9:setColor("red");
    obj.progressBar9:setHitTest(true);
    obj.progressBar9:setMax(1);
    obj.progressBar9:setField("usosMin9");
    obj.progressBar9:setName("progressBar9");

    obj.LDaNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.LDaNave:setParent(obj.Lnave2);
    obj.LDaNave:setName("LDaNave");
    obj.LDaNave:setAlign("client");
    obj.LDaNave:setVisible(false);

    obj.image75 = GUI.fromHandle(_obj_newObject("image"));
    obj.image75:setParent(obj.LDaNave);
    obj.image75:setSRC("/imagens/fundo.png");
    obj.image75:setLeft(333);
    obj.image75:setTop(62);
    obj.image75:setWidth(452);
    obj.image75:setHeight(323);
    obj.image75:setName("image75");

    obj.image76 = GUI.fromHandle(_obj_newObject("image"));
    obj.image76:setParent(obj.LDaNave);
    obj.image76:setSRC("/imagens/CirculoNave.png");
    obj.image76:setWidth(459);
    obj.image76:setHeight(330);
    obj.image76:setLeft(330.50);
    obj.image76:setTop(60);
    obj.image76:setName("image76");

    obj.image77 = GUI.fromHandle(_obj_newObject("image"));
    obj.image77:setParent(obj.LDaNave);
    obj.image77:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image77:setLeft(50);
    obj.image77:setTop(94);
    obj.image77:setWidth(279);
    obj.image77:setHeight(54);
    obj.image77:setName("image77");

    obj.image78 = GUI.fromHandle(_obj_newObject("image"));
    obj.image78:setParent(obj.LDaNave);
    obj.image78:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image78:setLeft(50);
    obj.image78:setTop(148);
    obj.image78:setWidth(279);
    obj.image78:setHeight(54);
    obj.image78:setName("image78");

    obj.image79 = GUI.fromHandle(_obj_newObject("image"));
    obj.image79:setParent(obj.LDaNave);
    obj.image79:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image79:setLeft(50);
    obj.image79:setTop(201);
    obj.image79:setWidth(279);
    obj.image79:setHeight(54);
    obj.image79:setName("image79");

    obj.image80 = GUI.fromHandle(_obj_newObject("image"));
    obj.image80:setParent(obj.LDaNave);
    obj.image80:setSRC("/imagens/model.png");
    obj.image80:setLeft(59);
    obj.image80:setTop(110);
    obj.image80:setWidth(91);
    obj.image80:setHeight(19);
    obj.image80:setName("image80");

    obj.image81 = GUI.fromHandle(_obj_newObject("image"));
    obj.image81:setParent(obj.LDaNave);
    obj.image81:setSRC("/imagens/nome.png");
    obj.image81:setLeft(59);
    obj.image81:setTop(168);
    obj.image81:setWidth(74);
    obj.image81:setHeight(19);
    obj.image81:setName("image81");

    obj.image82 = GUI.fromHandle(_obj_newObject("image"));
    obj.image82:setParent(obj.LDaNave);
    obj.image82:setSRC("/imagens/nivelNave.png");
    obj.image82:setLeft(59);
    obj.image82:setTop(216);
    obj.image82:setWidth(71);
    obj.image82:setHeight(25);
    obj.image82:setName("image82");

    obj.LDa1 = GUI.fromHandle(_obj_newObject("image"));
    obj.LDa1:setParent(obj.LDaNave);
    obj.LDa1:setName("LDa1");
    obj.LDa1:setSRC("/Naves/L/2 - LDa/1.png");
    obj.LDa1:setLeft(500);
    obj.LDa1:setTop(165);
    obj.LDa1:setWidth(95);
    obj.LDa1:setHeight(104);
    obj.LDa1:setVisible(false);

    obj.LDa2 = GUI.fromHandle(_obj_newObject("image"));
    obj.LDa2:setParent(obj.LDaNave);
    obj.LDa2:setName("LDa2");
    obj.LDa2:setSRC("/Naves/L/2 - LDa/2.png");
    obj.LDa2:setLeft(500);
    obj.LDa2:setTop(165);
    obj.LDa2:setWidth(120);
    obj.LDa2:setHeight(114);
    obj.LDa2:setVisible(false);

    obj.LDa3 = GUI.fromHandle(_obj_newObject("image"));
    obj.LDa3:setParent(obj.LDaNave);
    obj.LDa3:setName("LDa3");
    obj.LDa3:setSRC("/Naves/L/2 - LDa/3.png");
    obj.LDa3:setLeft(500);
    obj.LDa3:setTop(165);
    obj.LDa3:setWidth(120);
    obj.LDa3:setHeight(106);
    obj.LDa3:setVisible(false);

    obj.LDa4 = GUI.fromHandle(_obj_newObject("image"));
    obj.LDa4:setParent(obj.LDaNave);
    obj.LDa4:setName("LDa4");
    obj.LDa4:setSRC("/Naves/L/2 - LDa/4.png");
    obj.LDa4:setLeft(500);
    obj.LDa4:setTop(165);
    obj.LDa4:setWidth(120);
    obj.LDa4:setHeight(104);
    obj.LDa4:setVisible(false);

    obj.LDa5 = GUI.fromHandle(_obj_newObject("image"));
    obj.LDa5:setParent(obj.LDaNave);
    obj.LDa5:setName("LDa5");
    obj.LDa5:setSRC("/Naves/L/2 - LDa/5.png");
    obj.LDa5:setLeft(500);
    obj.LDa5:setTop(165);
    obj.LDa5:setWidth(100);
    obj.LDa5:setHeight(104);
    obj.LDa5:setVisible(false);

    obj.LDa6 = GUI.fromHandle(_obj_newObject("image"));
    obj.LDa6:setParent(obj.LDaNave);
    obj.LDa6:setName("LDa6");
    obj.LDa6:setSRC("/Naves/L/2 - LDa/6.png");
    obj.LDa6:setLeft(500);
    obj.LDa6:setTop(165);
    obj.LDa6:setWidth(95);
    obj.LDa6:setHeight(104);
    obj.LDa6:setVisible(false);

    obj.LDa7 = GUI.fromHandle(_obj_newObject("image"));
    obj.LDa7:setParent(obj.LDaNave);
    obj.LDa7:setName("LDa7");
    obj.LDa7:setSRC("/Naves/L/2 - LDa/7.png");
    obj.LDa7:setLeft(500);
    obj.LDa7:setTop(165);
    obj.LDa7:setWidth(100);
    obj.LDa7:setHeight(120);
    obj.LDa7:setVisible(false);

    obj.LDa8 = GUI.fromHandle(_obj_newObject("image"));
    obj.LDa8:setParent(obj.LDaNave);
    obj.LDa8:setName("LDa8");
    obj.LDa8:setSRC("/Naves/L/2 - LDa/8.png");
    obj.LDa8:setLeft(500);
    obj.LDa8:setTop(165);
    obj.LDa8:setWidth(100);
    obj.LDa8:setHeight(120);
    obj.LDa8:setVisible(false);

    obj.model10 = GUI.fromHandle(_obj_newObject("label"));
    obj.model10:setParent(obj.LDaNave);
    obj.model10:setName("model10");
    obj.model10:setLeft(153.13);
    obj.model10:setTop(95.50);
    obj.model10:setWidth(173.63);
    obj.model10:setHeight(47.25);
    obj.model10:setHorzTextAlign("center");
    obj.model10:setFontSize(30);
    lfm_setPropAsString(obj.model10, "fontStyle",  "bold");
    obj.model10:setText("LDa");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.LDaNave);
    obj.edit28:setField("nomeNave10");
    obj.edit28:setLeft(153.12);
    obj.edit28:setTop(149.50);
    obj.edit28:setWidth(173.62);
    obj.edit28:setHeight(47.25);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setFontSize(30);
    lfm_setPropAsString(obj.edit28, "fontStyle",  "bold");
    obj.edit28:setTransparent(true);
    obj.edit28:setName("edit28");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.LDaNave);
    obj.textEditor19:setField("Textoanotacao18");
    obj.textEditor19:setLeft(334.25);
    obj.textEditor19:setTop(276.25);
    obj.textEditor19:setWidth(222);
    obj.textEditor19:setHeight(111);
    obj.textEditor19:setTransparent(true);
    obj.textEditor19:setName("textEditor19");

    obj.textEditor20 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.LDaNave);
    obj.textEditor20:setField("Textoanotacao19");
    obj.textEditor20:setLeft(558.25);
    obj.textEditor20:setTop(276.25);
    obj.textEditor20:setWidth(229);
    obj.textEditor20:setHeight(111);
    obj.textEditor20:setTransparent(true);
    obj.textEditor20:setName("textEditor20");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.LDaNave);
    obj.label10:setField("nivelNave10");
    obj.label10:setLeft(153.12);
    obj.label10:setTop(203.50);
    obj.label10:setWidth(173.62);
    obj.label10:setHeight(47.25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontSize(30);
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setHitTest(true);
    obj.label10:setName("label10");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.LDaNave);
    obj.button10:setText("UP");
    lfm_setPropAsString(obj.button10, "fontStyle",  "bold");
    obj.button10:setFontColor("yellow");
    obj.button10:setLeft(148.75);
    obj.button10:setTop(265.50);
    obj.button10:setWidth(30);
    obj.button10:setHeight(27);
    obj.button10:setName("button10");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.LDaNave);
    obj.layout10:setLeft(1);
    obj.layout10:setTop(1);
    obj.layout10:setWidth(250);
    obj.layout10:setHeight(222);
    obj.layout10:setAlign("client");
    obj.layout10:setName("layout10");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout10);
    obj.edit29:setType("number");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setLeft(519);
    obj.edit29:setTop(112);
    obj.edit29:setWidth(25);
    obj.edit29:setHeight(25);
    obj.edit29:setField("minMin10");
    obj.edit29:setName("edit29");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout10);
    obj.dataLink18:setField("minMin10");
    obj.dataLink18:setName("dataLink18");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout10);
    obj.edit30:setType("number");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setLeft(548);
    obj.edit30:setTop(112);
    obj.edit30:setWidth(25);
    obj.edit30:setHeight(25);
    obj.edit30:setField("maxMin10");
    obj.edit30:setName("edit30");

    obj.progressBar10 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar10:setParent(obj.layout10);
    obj.progressBar10:setLeft(495);
    obj.progressBar10:setTop(138);
    obj.progressBar10:setWidth(105);
    obj.progressBar10:setHeight(20.50);
    obj.progressBar10:setColor("red");
    obj.progressBar10:setHitTest(true);
    obj.progressBar10:setMax(1);
    obj.progressBar10:setField("usosMin10");
    obj.progressBar10:setName("progressBar10");

    obj.LhnNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.LhnNave:setParent(obj.Lnave2);
    obj.LhnNave:setName("LhnNave");
    obj.LhnNave:setAlign("client");
    obj.LhnNave:setVisible(false);

    obj.image83 = GUI.fromHandle(_obj_newObject("image"));
    obj.image83:setParent(obj.LhnNave);
    obj.image83:setSRC("/imagens/fundo.png");
    obj.image83:setLeft(333);
    obj.image83:setTop(62);
    obj.image83:setWidth(452);
    obj.image83:setHeight(323);
    obj.image83:setName("image83");

    obj.image84 = GUI.fromHandle(_obj_newObject("image"));
    obj.image84:setParent(obj.LhnNave);
    obj.image84:setSRC("/imagens/CirculoNave.png");
    obj.image84:setWidth(459);
    obj.image84:setHeight(330);
    obj.image84:setLeft(330.50);
    obj.image84:setTop(60);
    obj.image84:setName("image84");

    obj.image85 = GUI.fromHandle(_obj_newObject("image"));
    obj.image85:setParent(obj.LhnNave);
    obj.image85:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image85:setLeft(50);
    obj.image85:setTop(94);
    obj.image85:setWidth(279);
    obj.image85:setHeight(54);
    obj.image85:setName("image85");

    obj.image86 = GUI.fromHandle(_obj_newObject("image"));
    obj.image86:setParent(obj.LhnNave);
    obj.image86:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image86:setLeft(50);
    obj.image86:setTop(148);
    obj.image86:setWidth(279);
    obj.image86:setHeight(54);
    obj.image86:setName("image86");

    obj.image87 = GUI.fromHandle(_obj_newObject("image"));
    obj.image87:setParent(obj.LhnNave);
    obj.image87:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image87:setLeft(50);
    obj.image87:setTop(201);
    obj.image87:setWidth(279);
    obj.image87:setHeight(54);
    obj.image87:setName("image87");

    obj.image88 = GUI.fromHandle(_obj_newObject("image"));
    obj.image88:setParent(obj.LhnNave);
    obj.image88:setSRC("/imagens/model.png");
    obj.image88:setLeft(59);
    obj.image88:setTop(110);
    obj.image88:setWidth(91);
    obj.image88:setHeight(19);
    obj.image88:setName("image88");

    obj.image89 = GUI.fromHandle(_obj_newObject("image"));
    obj.image89:setParent(obj.LhnNave);
    obj.image89:setSRC("/imagens/nome.png");
    obj.image89:setLeft(59);
    obj.image89:setTop(168);
    obj.image89:setWidth(74);
    obj.image89:setHeight(19);
    obj.image89:setName("image89");

    obj.image90 = GUI.fromHandle(_obj_newObject("image"));
    obj.image90:setParent(obj.LhnNave);
    obj.image90:setSRC("/imagens/nivelNave.png");
    obj.image90:setLeft(59);
    obj.image90:setTop(216);
    obj.image90:setWidth(71);
    obj.image90:setHeight(25);
    obj.image90:setName("image90");

    obj.Lhn1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lhn1:setParent(obj.LhnNave);
    obj.Lhn1:setName("Lhn1");
    obj.Lhn1:setSRC("/Naves/L/3 - Lhn/1.png");
    obj.Lhn1:setLeft(500);
    obj.Lhn1:setTop(165);
    obj.Lhn1:setWidth(95);
    obj.Lhn1:setHeight(104);
    obj.Lhn1:setVisible(false);

    obj.Lhn2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lhn2:setParent(obj.LhnNave);
    obj.Lhn2:setName("Lhn2");
    obj.Lhn2:setSRC("/Naves/L/3 - Lhn/2.png");
    obj.Lhn2:setLeft(500);
    obj.Lhn2:setTop(165);
    obj.Lhn2:setWidth(120);
    obj.Lhn2:setHeight(114);
    obj.Lhn2:setVisible(false);

    obj.Lhn3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lhn3:setParent(obj.LhnNave);
    obj.Lhn3:setName("Lhn3");
    obj.Lhn3:setSRC("/Naves/L/3 - Lhn/3.png");
    obj.Lhn3:setLeft(500);
    obj.Lhn3:setTop(165);
    obj.Lhn3:setWidth(120);
    obj.Lhn3:setHeight(106);
    obj.Lhn3:setVisible(false);

    obj.Lhn4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lhn4:setParent(obj.LhnNave);
    obj.Lhn4:setName("Lhn4");
    obj.Lhn4:setSRC("/Naves/L/3 - Lhn/4.png");
    obj.Lhn4:setLeft(500);
    obj.Lhn4:setTop(165);
    obj.Lhn4:setWidth(120);
    obj.Lhn4:setHeight(104);
    obj.Lhn4:setVisible(false);

    obj.Lhn5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lhn5:setParent(obj.LhnNave);
    obj.Lhn5:setName("Lhn5");
    obj.Lhn5:setSRC("/Naves/L/3 - Lhn/5.png");
    obj.Lhn5:setLeft(500);
    obj.Lhn5:setTop(165);
    obj.Lhn5:setWidth(100);
    obj.Lhn5:setHeight(104);
    obj.Lhn5:setVisible(false);

    obj.Lhn6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lhn6:setParent(obj.LhnNave);
    obj.Lhn6:setName("Lhn6");
    obj.Lhn6:setSRC("/Naves/L/3 - Lhn/6.png");
    obj.Lhn6:setLeft(500);
    obj.Lhn6:setTop(165);
    obj.Lhn6:setWidth(95);
    obj.Lhn6:setHeight(104);
    obj.Lhn6:setVisible(false);

    obj.Lhn7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lhn7:setParent(obj.LhnNave);
    obj.Lhn7:setName("Lhn7");
    obj.Lhn7:setSRC("/Naves/L/3 - Lhn/7.png");
    obj.Lhn7:setLeft(500);
    obj.Lhn7:setTop(165);
    obj.Lhn7:setWidth(100);
    obj.Lhn7:setHeight(120);
    obj.Lhn7:setVisible(false);

    obj.Lhn8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Lhn8:setParent(obj.LhnNave);
    obj.Lhn8:setName("Lhn8");
    obj.Lhn8:setSRC("/Naves/L/3 - Lhn/8.png");
    obj.Lhn8:setLeft(500);
    obj.Lhn8:setTop(165);
    obj.Lhn8:setWidth(100);
    obj.Lhn8:setHeight(120);
    obj.Lhn8:setVisible(false);

    obj.model11 = GUI.fromHandle(_obj_newObject("label"));
    obj.model11:setParent(obj.LhnNave);
    obj.model11:setName("model11");
    obj.model11:setLeft(153.13);
    obj.model11:setTop(95.50);
    obj.model11:setWidth(173.63);
    obj.model11:setHeight(47.25);
    obj.model11:setHorzTextAlign("center");
    obj.model11:setFontSize(30);
    lfm_setPropAsString(obj.model11, "fontStyle",  "bold");
    obj.model11:setText("Lhn");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.LhnNave);
    obj.edit31:setField("nomeNave11");
    obj.edit31:setLeft(153.12);
    obj.edit31:setTop(149.50);
    obj.edit31:setWidth(173.62);
    obj.edit31:setHeight(47.25);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setFontSize(30);
    lfm_setPropAsString(obj.edit31, "fontStyle",  "bold");
    obj.edit31:setTransparent(true);
    obj.edit31:setName("edit31");

    obj.textEditor21 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.LhnNave);
    obj.textEditor21:setField("Textoanotacao20");
    obj.textEditor21:setLeft(334.25);
    obj.textEditor21:setTop(276.25);
    obj.textEditor21:setWidth(222);
    obj.textEditor21:setHeight(111);
    obj.textEditor21:setTransparent(true);
    obj.textEditor21:setName("textEditor21");

    obj.textEditor22 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor22:setParent(obj.LhnNave);
    obj.textEditor22:setField("Textoanotacao21");
    obj.textEditor22:setLeft(558.25);
    obj.textEditor22:setTop(276.25);
    obj.textEditor22:setWidth(229);
    obj.textEditor22:setHeight(111);
    obj.textEditor22:setTransparent(true);
    obj.textEditor22:setName("textEditor22");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.LhnNave);
    obj.label11:setField("nivelNave11");
    obj.label11:setLeft(153.12);
    obj.label11:setTop(203.50);
    obj.label11:setWidth(173.62);
    obj.label11:setHeight(47.25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(30);
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setHitTest(true);
    obj.label11:setName("label11");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.LhnNave);
    obj.button11:setText("UP");
    lfm_setPropAsString(obj.button11, "fontStyle",  "bold");
    obj.button11:setFontColor("yellow");
    obj.button11:setLeft(148.75);
    obj.button11:setTop(265.50);
    obj.button11:setWidth(30);
    obj.button11:setHeight(27);
    obj.button11:setName("button11");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.LhnNave);
    obj.layout11:setLeft(1);
    obj.layout11:setTop(1);
    obj.layout11:setWidth(250);
    obj.layout11:setHeight(222);
    obj.layout11:setAlign("client");
    obj.layout11:setName("layout11");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout11);
    obj.edit32:setType("number");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setLeft(519);
    obj.edit32:setTop(112);
    obj.edit32:setWidth(25);
    obj.edit32:setHeight(25);
    obj.edit32:setField("minMin11");
    obj.edit32:setName("edit32");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout11);
    obj.dataLink19:setField("minMin11");
    obj.dataLink19:setName("dataLink19");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout11);
    obj.edit33:setType("number");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setLeft(548);
    obj.edit33:setTop(112);
    obj.edit33:setWidth(25);
    obj.edit33:setHeight(25);
    obj.edit33:setField("maxMin11");
    obj.edit33:setName("edit33");

    obj.progressBar11 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar11:setParent(obj.layout11);
    obj.progressBar11:setLeft(495);
    obj.progressBar11:setTop(138);
    obj.progressBar11:setWidth(105);
    obj.progressBar11:setHeight(20.50);
    obj.progressBar11:setColor("red");
    obj.progressBar11:setHitTest(true);
    obj.progressBar11:setMax(1);
    obj.progressBar11:setField("usosMin11");
    obj.progressBar11:setName("progressBar11");

    obj.LjNNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.LjNNave:setParent(obj.Lnave2);
    obj.LjNNave:setName("LjNNave");
    obj.LjNNave:setAlign("client");
    obj.LjNNave:setVisible(false);

    obj.image91 = GUI.fromHandle(_obj_newObject("image"));
    obj.image91:setParent(obj.LjNNave);
    obj.image91:setSRC("/imagens/fundo.png");
    obj.image91:setLeft(333);
    obj.image91:setTop(62);
    obj.image91:setWidth(452);
    obj.image91:setHeight(323);
    obj.image91:setName("image91");

    obj.image92 = GUI.fromHandle(_obj_newObject("image"));
    obj.image92:setParent(obj.LjNNave);
    obj.image92:setSRC("/imagens/CirculoNave.png");
    obj.image92:setWidth(459);
    obj.image92:setHeight(330);
    obj.image92:setLeft(330.50);
    obj.image92:setTop(60);
    obj.image92:setName("image92");

    obj.image93 = GUI.fromHandle(_obj_newObject("image"));
    obj.image93:setParent(obj.LjNNave);
    obj.image93:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image93:setLeft(50);
    obj.image93:setTop(94);
    obj.image93:setWidth(279);
    obj.image93:setHeight(54);
    obj.image93:setName("image93");

    obj.image94 = GUI.fromHandle(_obj_newObject("image"));
    obj.image94:setParent(obj.LjNNave);
    obj.image94:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image94:setLeft(50);
    obj.image94:setTop(148);
    obj.image94:setWidth(279);
    obj.image94:setHeight(54);
    obj.image94:setName("image94");

    obj.image95 = GUI.fromHandle(_obj_newObject("image"));
    obj.image95:setParent(obj.LjNNave);
    obj.image95:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image95:setLeft(50);
    obj.image95:setTop(201);
    obj.image95:setWidth(279);
    obj.image95:setHeight(54);
    obj.image95:setName("image95");

    obj.image96 = GUI.fromHandle(_obj_newObject("image"));
    obj.image96:setParent(obj.LjNNave);
    obj.image96:setSRC("/imagens/model.png");
    obj.image96:setLeft(59);
    obj.image96:setTop(110);
    obj.image96:setWidth(91);
    obj.image96:setHeight(19);
    obj.image96:setName("image96");

    obj.image97 = GUI.fromHandle(_obj_newObject("image"));
    obj.image97:setParent(obj.LjNNave);
    obj.image97:setSRC("/imagens/nome.png");
    obj.image97:setLeft(59);
    obj.image97:setTop(168);
    obj.image97:setWidth(74);
    obj.image97:setHeight(19);
    obj.image97:setName("image97");

    obj.image98 = GUI.fromHandle(_obj_newObject("image"));
    obj.image98:setParent(obj.LjNNave);
    obj.image98:setSRC("/imagens/nivelNave.png");
    obj.image98:setLeft(59);
    obj.image98:setTop(216);
    obj.image98:setWidth(71);
    obj.image98:setHeight(25);
    obj.image98:setName("image98");

    obj.LjN1 = GUI.fromHandle(_obj_newObject("image"));
    obj.LjN1:setParent(obj.LjNNave);
    obj.LjN1:setName("LjN1");
    obj.LjN1:setSRC("/Naves/L/4 - LjN/1.png");
    obj.LjN1:setLeft(500);
    obj.LjN1:setTop(165);
    obj.LjN1:setWidth(95);
    obj.LjN1:setHeight(104);
    obj.LjN1:setVisible(false);

    obj.LjN2 = GUI.fromHandle(_obj_newObject("image"));
    obj.LjN2:setParent(obj.LjNNave);
    obj.LjN2:setName("LjN2");
    obj.LjN2:setSRC("/Naves/L/4 - LjN/2.png");
    obj.LjN2:setLeft(500);
    obj.LjN2:setTop(165);
    obj.LjN2:setWidth(120);
    obj.LjN2:setHeight(114);
    obj.LjN2:setVisible(false);

    obj.LjN3 = GUI.fromHandle(_obj_newObject("image"));
    obj.LjN3:setParent(obj.LjNNave);
    obj.LjN3:setName("LjN3");
    obj.LjN3:setSRC("/Naves/L/4 - LjN/3.png");
    obj.LjN3:setLeft(500);
    obj.LjN3:setTop(165);
    obj.LjN3:setWidth(120);
    obj.LjN3:setHeight(106);
    obj.LjN3:setVisible(false);

    obj.LjN4 = GUI.fromHandle(_obj_newObject("image"));
    obj.LjN4:setParent(obj.LjNNave);
    obj.LjN4:setName("LjN4");
    obj.LjN4:setSRC("/Naves/L/4 - LjN/4.png");
    obj.LjN4:setLeft(500);
    obj.LjN4:setTop(165);
    obj.LjN4:setWidth(120);
    obj.LjN4:setHeight(104);
    obj.LjN4:setVisible(false);

    obj.LjN5 = GUI.fromHandle(_obj_newObject("image"));
    obj.LjN5:setParent(obj.LjNNave);
    obj.LjN5:setName("LjN5");
    obj.LjN5:setSRC("/Naves/L/4 - LjN/5.png");
    obj.LjN5:setLeft(500);
    obj.LjN5:setTop(165);
    obj.LjN5:setWidth(100);
    obj.LjN5:setHeight(104);
    obj.LjN5:setVisible(false);

    obj.LjN6 = GUI.fromHandle(_obj_newObject("image"));
    obj.LjN6:setParent(obj.LjNNave);
    obj.LjN6:setName("LjN6");
    obj.LjN6:setSRC("/Naves/L/4 - LjN/6.png");
    obj.LjN6:setLeft(500);
    obj.LjN6:setTop(165);
    obj.LjN6:setWidth(95);
    obj.LjN6:setHeight(104);
    obj.LjN6:setVisible(false);

    obj.LjN7 = GUI.fromHandle(_obj_newObject("image"));
    obj.LjN7:setParent(obj.LjNNave);
    obj.LjN7:setName("LjN7");
    obj.LjN7:setSRC("/Naves/L/4 - LjN/7.png");
    obj.LjN7:setLeft(500);
    obj.LjN7:setTop(165);
    obj.LjN7:setWidth(100);
    obj.LjN7:setHeight(120);
    obj.LjN7:setVisible(false);

    obj.LjN8 = GUI.fromHandle(_obj_newObject("image"));
    obj.LjN8:setParent(obj.LjNNave);
    obj.LjN8:setName("LjN8");
    obj.LjN8:setSRC("/Naves/L/4 - LjN/8.png");
    obj.LjN8:setLeft(500);
    obj.LjN8:setTop(165);
    obj.LjN8:setWidth(100);
    obj.LjN8:setHeight(120);
    obj.LjN8:setVisible(false);

    obj.model12 = GUI.fromHandle(_obj_newObject("label"));
    obj.model12:setParent(obj.LjNNave);
    obj.model12:setName("model12");
    obj.model12:setLeft(153.13);
    obj.model12:setTop(95.50);
    obj.model12:setWidth(173.63);
    obj.model12:setHeight(47.25);
    obj.model12:setHorzTextAlign("center");
    obj.model12:setFontSize(30);
    lfm_setPropAsString(obj.model12, "fontStyle",  "bold");
    obj.model12:setText("LjN");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.LjNNave);
    obj.edit34:setField("nomeNave12");
    obj.edit34:setLeft(153.12);
    obj.edit34:setTop(149.50);
    obj.edit34:setWidth(173.62);
    obj.edit34:setHeight(47.25);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setFontSize(30);
    lfm_setPropAsString(obj.edit34, "fontStyle",  "bold");
    obj.edit34:setTransparent(true);
    obj.edit34:setName("edit34");

    obj.textEditor23 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor23:setParent(obj.LjNNave);
    obj.textEditor23:setField("Textoanotacao22");
    obj.textEditor23:setLeft(334.25);
    obj.textEditor23:setTop(276.25);
    obj.textEditor23:setWidth(222);
    obj.textEditor23:setHeight(111);
    obj.textEditor23:setTransparent(true);
    obj.textEditor23:setName("textEditor23");

    obj.textEditor24 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor24:setParent(obj.LjNNave);
    obj.textEditor24:setField("Textoanotacao23");
    obj.textEditor24:setLeft(558.25);
    obj.textEditor24:setTop(276.25);
    obj.textEditor24:setWidth(229);
    obj.textEditor24:setHeight(111);
    obj.textEditor24:setTransparent(true);
    obj.textEditor24:setName("textEditor24");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.LjNNave);
    obj.label12:setField("nivelNave12");
    obj.label12:setLeft(153.12);
    obj.label12:setTop(203.50);
    obj.label12:setWidth(173.62);
    obj.label12:setHeight(47.25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(30);
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setText("0");
    obj.label12:setHitTest(true);
    obj.label12:setName("label12");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.LjNNave);
    obj.button12:setText("UP");
    lfm_setPropAsString(obj.button12, "fontStyle",  "bold");
    obj.button12:setFontColor("yellow");
    obj.button12:setLeft(148.75);
    obj.button12:setTop(265.50);
    obj.button12:setWidth(30);
    obj.button12:setHeight(27);
    obj.button12:setName("button12");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.LjNNave);
    obj.layout12:setLeft(1);
    obj.layout12:setTop(1);
    obj.layout12:setWidth(250);
    obj.layout12:setHeight(222);
    obj.layout12:setAlign("client");
    obj.layout12:setName("layout12");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout12);
    obj.edit35:setType("number");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setLeft(519);
    obj.edit35:setTop(112);
    obj.edit35:setWidth(25);
    obj.edit35:setHeight(25);
    obj.edit35:setField("minMin12");
    obj.edit35:setName("edit35");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout12);
    obj.dataLink20:setField("minMin12");
    obj.dataLink20:setName("dataLink20");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout12);
    obj.edit36:setType("number");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setLeft(548);
    obj.edit36:setTop(112);
    obj.edit36:setWidth(25);
    obj.edit36:setHeight(25);
    obj.edit36:setField("maxMin12");
    obj.edit36:setName("edit36");

    obj.progressBar12 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar12:setParent(obj.layout12);
    obj.progressBar12:setLeft(495);
    obj.progressBar12:setTop(138);
    obj.progressBar12:setWidth(105);
    obj.progressBar12:setHeight(20.50);
    obj.progressBar12:setColor("red");
    obj.progressBar12:setHitTest(true);
    obj.progressBar12:setMax(1);
    obj.progressBar12:setField("usosMin12");
    obj.progressBar12:setName("progressBar12");

    obj.LaHNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.LaHNave:setParent(obj.Lnave2);
    obj.LaHNave:setName("LaHNave");
    obj.LaHNave:setAlign("client");
    obj.LaHNave:setVisible(false);

    obj.image99 = GUI.fromHandle(_obj_newObject("image"));
    obj.image99:setParent(obj.LaHNave);
    obj.image99:setSRC("/imagens/fundo.png");
    obj.image99:setLeft(333);
    obj.image99:setTop(62);
    obj.image99:setWidth(452);
    obj.image99:setHeight(323);
    obj.image99:setName("image99");

    obj.image100 = GUI.fromHandle(_obj_newObject("image"));
    obj.image100:setParent(obj.LaHNave);
    obj.image100:setSRC("/imagens/CirculoNave.png");
    obj.image100:setWidth(459);
    obj.image100:setHeight(330);
    obj.image100:setLeft(330.50);
    obj.image100:setTop(60);
    obj.image100:setName("image100");

    obj.image101 = GUI.fromHandle(_obj_newObject("image"));
    obj.image101:setParent(obj.LaHNave);
    obj.image101:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image101:setLeft(50);
    obj.image101:setTop(94);
    obj.image101:setWidth(279);
    obj.image101:setHeight(54);
    obj.image101:setName("image101");

    obj.image102 = GUI.fromHandle(_obj_newObject("image"));
    obj.image102:setParent(obj.LaHNave);
    obj.image102:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image102:setLeft(50);
    obj.image102:setTop(148);
    obj.image102:setWidth(279);
    obj.image102:setHeight(54);
    obj.image102:setName("image102");

    obj.image103 = GUI.fromHandle(_obj_newObject("image"));
    obj.image103:setParent(obj.LaHNave);
    obj.image103:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image103:setLeft(50);
    obj.image103:setTop(201);
    obj.image103:setWidth(279);
    obj.image103:setHeight(54);
    obj.image103:setName("image103");

    obj.image104 = GUI.fromHandle(_obj_newObject("image"));
    obj.image104:setParent(obj.LaHNave);
    obj.image104:setSRC("/imagens/model.png");
    obj.image104:setLeft(59);
    obj.image104:setTop(110);
    obj.image104:setWidth(91);
    obj.image104:setHeight(19);
    obj.image104:setName("image104");

    obj.image105 = GUI.fromHandle(_obj_newObject("image"));
    obj.image105:setParent(obj.LaHNave);
    obj.image105:setSRC("/imagens/nome.png");
    obj.image105:setLeft(59);
    obj.image105:setTop(168);
    obj.image105:setWidth(74);
    obj.image105:setHeight(19);
    obj.image105:setName("image105");

    obj.image106 = GUI.fromHandle(_obj_newObject("image"));
    obj.image106:setParent(obj.LaHNave);
    obj.image106:setSRC("/imagens/nivelNave.png");
    obj.image106:setLeft(59);
    obj.image106:setTop(216);
    obj.image106:setWidth(71);
    obj.image106:setHeight(25);
    obj.image106:setName("image106");

    obj.LaH1 = GUI.fromHandle(_obj_newObject("image"));
    obj.LaH1:setParent(obj.LaHNave);
    obj.LaH1:setName("LaH1");
    obj.LaH1:setSRC("/Naves/L/5 - LaH/1.png");
    obj.LaH1:setLeft(500);
    obj.LaH1:setTop(165);
    obj.LaH1:setWidth(95);
    obj.LaH1:setHeight(104);
    obj.LaH1:setVisible(false);

    obj.LaH2 = GUI.fromHandle(_obj_newObject("image"));
    obj.LaH2:setParent(obj.LaHNave);
    obj.LaH2:setName("LaH2");
    obj.LaH2:setSRC("/Naves/L/5 - LaH/2.png");
    obj.LaH2:setLeft(500);
    obj.LaH2:setTop(165);
    obj.LaH2:setWidth(120);
    obj.LaH2:setHeight(114);
    obj.LaH2:setVisible(false);

    obj.LaH3 = GUI.fromHandle(_obj_newObject("image"));
    obj.LaH3:setParent(obj.LaHNave);
    obj.LaH3:setName("LaH3");
    obj.LaH3:setSRC("/Naves/L/5 - LaH/3.png");
    obj.LaH3:setLeft(500);
    obj.LaH3:setTop(165);
    obj.LaH3:setWidth(120);
    obj.LaH3:setHeight(106);
    obj.LaH3:setVisible(false);

    obj.LaH4 = GUI.fromHandle(_obj_newObject("image"));
    obj.LaH4:setParent(obj.LaHNave);
    obj.LaH4:setName("LaH4");
    obj.LaH4:setSRC("/Naves/L/5 - LaH/4.png");
    obj.LaH4:setLeft(500);
    obj.LaH4:setTop(165);
    obj.LaH4:setWidth(120);
    obj.LaH4:setHeight(104);
    obj.LaH4:setVisible(false);

    obj.LaH5 = GUI.fromHandle(_obj_newObject("image"));
    obj.LaH5:setParent(obj.LaHNave);
    obj.LaH5:setName("LaH5");
    obj.LaH5:setSRC("/Naves/L/5 - LaH/5.png");
    obj.LaH5:setLeft(500);
    obj.LaH5:setTop(165);
    obj.LaH5:setWidth(100);
    obj.LaH5:setHeight(104);
    obj.LaH5:setVisible(false);

    obj.LaH6 = GUI.fromHandle(_obj_newObject("image"));
    obj.LaH6:setParent(obj.LaHNave);
    obj.LaH6:setName("LaH6");
    obj.LaH6:setSRC("/Naves/L/5 - LaH/6.png");
    obj.LaH6:setLeft(500);
    obj.LaH6:setTop(165);
    obj.LaH6:setWidth(95);
    obj.LaH6:setHeight(104);
    obj.LaH6:setVisible(false);

    obj.LaH7 = GUI.fromHandle(_obj_newObject("image"));
    obj.LaH7:setParent(obj.LaHNave);
    obj.LaH7:setName("LaH7");
    obj.LaH7:setSRC("/Naves/L/5 - LaH/7.png");
    obj.LaH7:setLeft(500);
    obj.LaH7:setTop(165);
    obj.LaH7:setWidth(100);
    obj.LaH7:setHeight(120);
    obj.LaH7:setVisible(false);

    obj.LaH8 = GUI.fromHandle(_obj_newObject("image"));
    obj.LaH8:setParent(obj.LaHNave);
    obj.LaH8:setName("LaH8");
    obj.LaH8:setSRC("/Naves/L/5 - LaH/8.png");
    obj.LaH8:setLeft(500);
    obj.LaH8:setTop(165);
    obj.LaH8:setWidth(100);
    obj.LaH8:setHeight(120);
    obj.LaH8:setVisible(false);

    obj.model13 = GUI.fromHandle(_obj_newObject("label"));
    obj.model13:setParent(obj.LaHNave);
    obj.model13:setName("model13");
    obj.model13:setLeft(153.13);
    obj.model13:setTop(95.50);
    obj.model13:setWidth(173.63);
    obj.model13:setHeight(47.25);
    obj.model13:setHorzTextAlign("center");
    obj.model13:setFontSize(30);
    lfm_setPropAsString(obj.model13, "fontStyle",  "bold");
    obj.model13:setText("LaH");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.LaHNave);
    obj.edit37:setField("nomeNave13");
    obj.edit37:setLeft(153.12);
    obj.edit37:setTop(149.50);
    obj.edit37:setWidth(173.62);
    obj.edit37:setHeight(47.25);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setFontSize(30);
    lfm_setPropAsString(obj.edit37, "fontStyle",  "bold");
    obj.edit37:setTransparent(true);
    obj.edit37:setName("edit37");

    obj.textEditor25 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor25:setParent(obj.LaHNave);
    obj.textEditor25:setField("Textoanotacao24");
    obj.textEditor25:setLeft(334.25);
    obj.textEditor25:setTop(276.25);
    obj.textEditor25:setWidth(222);
    obj.textEditor25:setHeight(111);
    obj.textEditor25:setTransparent(true);
    obj.textEditor25:setName("textEditor25");

    obj.textEditor26 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor26:setParent(obj.LaHNave);
    obj.textEditor26:setField("Textoanotacao25");
    obj.textEditor26:setLeft(558.25);
    obj.textEditor26:setTop(276.25);
    obj.textEditor26:setWidth(229);
    obj.textEditor26:setHeight(111);
    obj.textEditor26:setTransparent(true);
    obj.textEditor26:setName("textEditor26");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.LaHNave);
    obj.label13:setField("nivelNave13");
    obj.label13:setLeft(153.12);
    obj.label13:setTop(203.50);
    obj.label13:setWidth(173.62);
    obj.label13:setHeight(47.25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setFontSize(30);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setText("0");
    obj.label13:setHitTest(true);
    obj.label13:setName("label13");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.LaHNave);
    obj.button13:setText("UP");
    lfm_setPropAsString(obj.button13, "fontStyle",  "bold");
    obj.button13:setFontColor("yellow");
    obj.button13:setLeft(148.75);
    obj.button13:setTop(265.50);
    obj.button13:setWidth(30);
    obj.button13:setHeight(27);
    obj.button13:setName("button13");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.LaHNave);
    obj.layout13:setLeft(1);
    obj.layout13:setTop(1);
    obj.layout13:setWidth(250);
    obj.layout13:setHeight(222);
    obj.layout13:setAlign("client");
    obj.layout13:setName("layout13");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout13);
    obj.edit38:setType("number");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setLeft(519);
    obj.edit38:setTop(112);
    obj.edit38:setWidth(25);
    obj.edit38:setHeight(25);
    obj.edit38:setField("minMin13");
    obj.edit38:setName("edit38");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout13);
    obj.dataLink21:setField("minMin13");
    obj.dataLink21:setName("dataLink21");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout13);
    obj.edit39:setType("number");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setLeft(548);
    obj.edit39:setTop(112);
    obj.edit39:setWidth(25);
    obj.edit39:setHeight(25);
    obj.edit39:setField("maxMin13");
    obj.edit39:setName("edit39");

    obj.progressBar13 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar13:setParent(obj.layout13);
    obj.progressBar13:setLeft(495);
    obj.progressBar13:setTop(138);
    obj.progressBar13:setWidth(105);
    obj.progressBar13:setHeight(20.50);
    obj.progressBar13:setColor("red");
    obj.progressBar13:setHitTest(true);
    obj.progressBar13:setMax(1);
    obj.progressBar13:setField("usosMin13");
    obj.progressBar13:setName("progressBar13");

    obj.LmHNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.LmHNave:setParent(obj.Lnave2);
    obj.LmHNave:setName("LmHNave");
    obj.LmHNave:setAlign("client");
    obj.LmHNave:setVisible(false);

    obj.image107 = GUI.fromHandle(_obj_newObject("image"));
    obj.image107:setParent(obj.LmHNave);
    obj.image107:setSRC("/imagens/fundo.png");
    obj.image107:setLeft(333);
    obj.image107:setTop(62);
    obj.image107:setWidth(452);
    obj.image107:setHeight(323);
    obj.image107:setName("image107");

    obj.image108 = GUI.fromHandle(_obj_newObject("image"));
    obj.image108:setParent(obj.LmHNave);
    obj.image108:setSRC("/imagens/CirculoNave.png");
    obj.image108:setWidth(459);
    obj.image108:setHeight(330);
    obj.image108:setLeft(330.50);
    obj.image108:setTop(60);
    obj.image108:setName("image108");

    obj.image109 = GUI.fromHandle(_obj_newObject("image"));
    obj.image109:setParent(obj.LmHNave);
    obj.image109:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image109:setLeft(50);
    obj.image109:setTop(94);
    obj.image109:setWidth(279);
    obj.image109:setHeight(54);
    obj.image109:setName("image109");

    obj.image110 = GUI.fromHandle(_obj_newObject("image"));
    obj.image110:setParent(obj.LmHNave);
    obj.image110:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image110:setLeft(50);
    obj.image110:setTop(148);
    obj.image110:setWidth(279);
    obj.image110:setHeight(54);
    obj.image110:setName("image110");

    obj.image111 = GUI.fromHandle(_obj_newObject("image"));
    obj.image111:setParent(obj.LmHNave);
    obj.image111:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image111:setLeft(50);
    obj.image111:setTop(201);
    obj.image111:setWidth(279);
    obj.image111:setHeight(54);
    obj.image111:setName("image111");

    obj.image112 = GUI.fromHandle(_obj_newObject("image"));
    obj.image112:setParent(obj.LmHNave);
    obj.image112:setSRC("/imagens/model.png");
    obj.image112:setLeft(59);
    obj.image112:setTop(110);
    obj.image112:setWidth(91);
    obj.image112:setHeight(19);
    obj.image112:setName("image112");

    obj.image113 = GUI.fromHandle(_obj_newObject("image"));
    obj.image113:setParent(obj.LmHNave);
    obj.image113:setSRC("/imagens/nome.png");
    obj.image113:setLeft(59);
    obj.image113:setTop(168);
    obj.image113:setWidth(74);
    obj.image113:setHeight(19);
    obj.image113:setName("image113");

    obj.image114 = GUI.fromHandle(_obj_newObject("image"));
    obj.image114:setParent(obj.LmHNave);
    obj.image114:setSRC("/imagens/nivelNave.png");
    obj.image114:setLeft(59);
    obj.image114:setTop(216);
    obj.image114:setWidth(71);
    obj.image114:setHeight(25);
    obj.image114:setName("image114");

    obj.LmH1 = GUI.fromHandle(_obj_newObject("image"));
    obj.LmH1:setParent(obj.LmHNave);
    obj.LmH1:setName("LmH1");
    obj.LmH1:setSRC("/Naves/L/6 - LmH/1.png");
    obj.LmH1:setLeft(500);
    obj.LmH1:setTop(165);
    obj.LmH1:setWidth(95);
    obj.LmH1:setHeight(104);
    obj.LmH1:setVisible(false);

    obj.LmH2 = GUI.fromHandle(_obj_newObject("image"));
    obj.LmH2:setParent(obj.LmHNave);
    obj.LmH2:setName("LmH2");
    obj.LmH2:setSRC("/Naves/L/6 - LmH/2.png");
    obj.LmH2:setLeft(500);
    obj.LmH2:setTop(165);
    obj.LmH2:setWidth(120);
    obj.LmH2:setHeight(114);
    obj.LmH2:setVisible(false);

    obj.LmH3 = GUI.fromHandle(_obj_newObject("image"));
    obj.LmH3:setParent(obj.LmHNave);
    obj.LmH3:setName("LmH3");
    obj.LmH3:setSRC("/Naves/L/6 - LmH/3.png");
    obj.LmH3:setLeft(500);
    obj.LmH3:setTop(165);
    obj.LmH3:setWidth(120);
    obj.LmH3:setHeight(106);
    obj.LmH3:setVisible(false);

    obj.LmH4 = GUI.fromHandle(_obj_newObject("image"));
    obj.LmH4:setParent(obj.LmHNave);
    obj.LmH4:setName("LmH4");
    obj.LmH4:setSRC("/Naves/L/6 - LmH/4.png");
    obj.LmH4:setLeft(500);
    obj.LmH4:setTop(165);
    obj.LmH4:setWidth(120);
    obj.LmH4:setHeight(104);
    obj.LmH4:setVisible(false);

    obj.LmH5 = GUI.fromHandle(_obj_newObject("image"));
    obj.LmH5:setParent(obj.LmHNave);
    obj.LmH5:setName("LmH5");
    obj.LmH5:setSRC("/Naves/L/6 - LmH/5.png");
    obj.LmH5:setLeft(500);
    obj.LmH5:setTop(165);
    obj.LmH5:setWidth(100);
    obj.LmH5:setHeight(104);
    obj.LmH5:setVisible(false);

    obj.LmH6 = GUI.fromHandle(_obj_newObject("image"));
    obj.LmH6:setParent(obj.LmHNave);
    obj.LmH6:setName("LmH6");
    obj.LmH6:setSRC("/Naves/L/6 - LmH/6.png");
    obj.LmH6:setLeft(500);
    obj.LmH6:setTop(165);
    obj.LmH6:setWidth(95);
    obj.LmH6:setHeight(104);
    obj.LmH6:setVisible(false);

    obj.LmH7 = GUI.fromHandle(_obj_newObject("image"));
    obj.LmH7:setParent(obj.LmHNave);
    obj.LmH7:setName("LmH7");
    obj.LmH7:setSRC("/Naves/L/6 - LmH/7.png");
    obj.LmH7:setLeft(500);
    obj.LmH7:setTop(165);
    obj.LmH7:setWidth(100);
    obj.LmH7:setHeight(120);
    obj.LmH7:setVisible(false);

    obj.LmH8 = GUI.fromHandle(_obj_newObject("image"));
    obj.LmH8:setParent(obj.LmHNave);
    obj.LmH8:setName("LmH8");
    obj.LmH8:setSRC("/Naves/L/6 - LmH/8.png");
    obj.LmH8:setLeft(500);
    obj.LmH8:setTop(165);
    obj.LmH8:setWidth(100);
    obj.LmH8:setHeight(120);
    obj.LmH8:setVisible(false);

    obj.model14 = GUI.fromHandle(_obj_newObject("label"));
    obj.model14:setParent(obj.LmHNave);
    obj.model14:setName("model14");
    obj.model14:setLeft(153.13);
    obj.model14:setTop(95.50);
    obj.model14:setWidth(173.63);
    obj.model14:setHeight(47.25);
    obj.model14:setHorzTextAlign("center");
    obj.model14:setFontSize(30);
    lfm_setPropAsString(obj.model14, "fontStyle",  "bold");
    obj.model14:setText("LmH");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.LmHNave);
    obj.edit40:setField("nomeNave14");
    obj.edit40:setLeft(153.12);
    obj.edit40:setTop(149.50);
    obj.edit40:setWidth(173.62);
    obj.edit40:setHeight(47.25);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setFontSize(30);
    lfm_setPropAsString(obj.edit40, "fontStyle",  "bold");
    obj.edit40:setTransparent(true);
    obj.edit40:setName("edit40");

    obj.textEditor27 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor27:setParent(obj.LmHNave);
    obj.textEditor27:setField("Textoanotacao26");
    obj.textEditor27:setLeft(334.25);
    obj.textEditor27:setTop(276.25);
    obj.textEditor27:setWidth(222);
    obj.textEditor27:setHeight(111);
    obj.textEditor27:setTransparent(true);
    obj.textEditor27:setName("textEditor27");

    obj.textEditor28 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor28:setParent(obj.LmHNave);
    obj.textEditor28:setField("Textoanotacao27");
    obj.textEditor28:setLeft(558.25);
    obj.textEditor28:setTop(276.25);
    obj.textEditor28:setWidth(229);
    obj.textEditor28:setHeight(111);
    obj.textEditor28:setTransparent(true);
    obj.textEditor28:setName("textEditor28");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.LmHNave);
    obj.label14:setField("nivelNave14");
    obj.label14:setLeft(153.12);
    obj.label14:setTop(203.50);
    obj.label14:setWidth(173.62);
    obj.label14:setHeight(47.25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontSize(30);
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setText("0");
    obj.label14:setHitTest(true);
    obj.label14:setName("label14");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.LmHNave);
    obj.button14:setText("UP");
    lfm_setPropAsString(obj.button14, "fontStyle",  "bold");
    obj.button14:setFontColor("yellow");
    obj.button14:setLeft(148.75);
    obj.button14:setTop(265.50);
    obj.button14:setWidth(30);
    obj.button14:setHeight(27);
    obj.button14:setName("button14");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.LmHNave);
    obj.layout14:setLeft(1);
    obj.layout14:setTop(1);
    obj.layout14:setWidth(250);
    obj.layout14:setHeight(222);
    obj.layout14:setAlign("client");
    obj.layout14:setName("layout14");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout14);
    obj.edit41:setType("number");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setLeft(519);
    obj.edit41:setTop(112);
    obj.edit41:setWidth(25);
    obj.edit41:setHeight(25);
    obj.edit41:setField("minMin14");
    obj.edit41:setName("edit41");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout14);
    obj.dataLink22:setField("minMin14");
    obj.dataLink22:setName("dataLink22");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout14);
    obj.edit42:setType("number");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setLeft(548);
    obj.edit42:setTop(112);
    obj.edit42:setWidth(25);
    obj.edit42:setHeight(25);
    obj.edit42:setField("maxMin14");
    obj.edit42:setName("edit42");

    obj.progressBar14 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar14:setParent(obj.layout14);
    obj.progressBar14:setLeft(495);
    obj.progressBar14:setTop(138);
    obj.progressBar14:setWidth(105);
    obj.progressBar14:setHeight(20.50);
    obj.progressBar14:setColor("red");
    obj.progressBar14:setHitTest(true);
    obj.progressBar14:setMax(1);
    obj.progressBar14:setField("usosMin14");
    obj.progressBar14:setName("progressBar14");

    obj.LbAnNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.LbAnNave:setParent(obj.Lnave2);
    obj.LbAnNave:setName("LbAnNave");
    obj.LbAnNave:setAlign("client");
    obj.LbAnNave:setVisible(false);

    obj.image115 = GUI.fromHandle(_obj_newObject("image"));
    obj.image115:setParent(obj.LbAnNave);
    obj.image115:setSRC("/imagens/fundo.png");
    obj.image115:setLeft(333);
    obj.image115:setTop(62);
    obj.image115:setWidth(452);
    obj.image115:setHeight(323);
    obj.image115:setName("image115");

    obj.image116 = GUI.fromHandle(_obj_newObject("image"));
    obj.image116:setParent(obj.LbAnNave);
    obj.image116:setSRC("/imagens/CirculoNave.png");
    obj.image116:setWidth(459);
    obj.image116:setHeight(330);
    obj.image116:setLeft(330.50);
    obj.image116:setTop(60);
    obj.image116:setName("image116");

    obj.image117 = GUI.fromHandle(_obj_newObject("image"));
    obj.image117:setParent(obj.LbAnNave);
    obj.image117:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image117:setLeft(50);
    obj.image117:setTop(94);
    obj.image117:setWidth(279);
    obj.image117:setHeight(54);
    obj.image117:setName("image117");

    obj.image118 = GUI.fromHandle(_obj_newObject("image"));
    obj.image118:setParent(obj.LbAnNave);
    obj.image118:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image118:setLeft(50);
    obj.image118:setTop(148);
    obj.image118:setWidth(279);
    obj.image118:setHeight(54);
    obj.image118:setName("image118");

    obj.image119 = GUI.fromHandle(_obj_newObject("image"));
    obj.image119:setParent(obj.LbAnNave);
    obj.image119:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image119:setLeft(50);
    obj.image119:setTop(201);
    obj.image119:setWidth(279);
    obj.image119:setHeight(54);
    obj.image119:setName("image119");

    obj.image120 = GUI.fromHandle(_obj_newObject("image"));
    obj.image120:setParent(obj.LbAnNave);
    obj.image120:setSRC("/imagens/model.png");
    obj.image120:setLeft(59);
    obj.image120:setTop(110);
    obj.image120:setWidth(91);
    obj.image120:setHeight(19);
    obj.image120:setName("image120");

    obj.image121 = GUI.fromHandle(_obj_newObject("image"));
    obj.image121:setParent(obj.LbAnNave);
    obj.image121:setSRC("/imagens/nome.png");
    obj.image121:setLeft(59);
    obj.image121:setTop(168);
    obj.image121:setWidth(74);
    obj.image121:setHeight(19);
    obj.image121:setName("image121");

    obj.image122 = GUI.fromHandle(_obj_newObject("image"));
    obj.image122:setParent(obj.LbAnNave);
    obj.image122:setSRC("/imagens/nivelNave.png");
    obj.image122:setLeft(59);
    obj.image122:setTop(216);
    obj.image122:setWidth(71);
    obj.image122:setHeight(25);
    obj.image122:setName("image122");

    obj.LbAn1 = GUI.fromHandle(_obj_newObject("image"));
    obj.LbAn1:setParent(obj.LbAnNave);
    obj.LbAn1:setName("LbAn1");
    obj.LbAn1:setSRC("/Naves/L/7 - LbAn/1.png");
    obj.LbAn1:setLeft(500);
    obj.LbAn1:setTop(165);
    obj.LbAn1:setWidth(95);
    obj.LbAn1:setHeight(104);
    obj.LbAn1:setVisible(false);

    obj.LbAn2 = GUI.fromHandle(_obj_newObject("image"));
    obj.LbAn2:setParent(obj.LbAnNave);
    obj.LbAn2:setName("LbAn2");
    obj.LbAn2:setSRC("/Naves/L/7 - LbAn/2.png");
    obj.LbAn2:setLeft(500);
    obj.LbAn2:setTop(165);
    obj.LbAn2:setWidth(120);
    obj.LbAn2:setHeight(114);
    obj.LbAn2:setVisible(false);

    obj.LbAn3 = GUI.fromHandle(_obj_newObject("image"));
    obj.LbAn3:setParent(obj.LbAnNave);
    obj.LbAn3:setName("LbAn3");
    obj.LbAn3:setSRC("/Naves/L/7 - LbAn/3.png");
    obj.LbAn3:setLeft(500);
    obj.LbAn3:setTop(165);
    obj.LbAn3:setWidth(120);
    obj.LbAn3:setHeight(106);
    obj.LbAn3:setVisible(false);

    obj.LbAn4 = GUI.fromHandle(_obj_newObject("image"));
    obj.LbAn4:setParent(obj.LbAnNave);
    obj.LbAn4:setName("LbAn4");
    obj.LbAn4:setSRC("/Naves/L/7 - LbAn/4.png");
    obj.LbAn4:setLeft(500);
    obj.LbAn4:setTop(165);
    obj.LbAn4:setWidth(120);
    obj.LbAn4:setHeight(104);
    obj.LbAn4:setVisible(false);

    obj.LbAn5 = GUI.fromHandle(_obj_newObject("image"));
    obj.LbAn5:setParent(obj.LbAnNave);
    obj.LbAn5:setName("LbAn5");
    obj.LbAn5:setSRC("/Naves/L/7 - LbAn/5.png");
    obj.LbAn5:setLeft(500);
    obj.LbAn5:setTop(165);
    obj.LbAn5:setWidth(100);
    obj.LbAn5:setHeight(104);
    obj.LbAn5:setVisible(false);

    obj.LbAn6 = GUI.fromHandle(_obj_newObject("image"));
    obj.LbAn6:setParent(obj.LbAnNave);
    obj.LbAn6:setName("LbAn6");
    obj.LbAn6:setSRC("/Naves/L/7 - LbAn/6.png");
    obj.LbAn6:setLeft(500);
    obj.LbAn6:setTop(165);
    obj.LbAn6:setWidth(95);
    obj.LbAn6:setHeight(104);
    obj.LbAn6:setVisible(false);

    obj.LbAn7 = GUI.fromHandle(_obj_newObject("image"));
    obj.LbAn7:setParent(obj.LbAnNave);
    obj.LbAn7:setName("LbAn7");
    obj.LbAn7:setSRC("/Naves/L/7 - LbAn/7.png");
    obj.LbAn7:setLeft(500);
    obj.LbAn7:setTop(165);
    obj.LbAn7:setWidth(100);
    obj.LbAn7:setHeight(120);
    obj.LbAn7:setVisible(false);

    obj.LbAn8 = GUI.fromHandle(_obj_newObject("image"));
    obj.LbAn8:setParent(obj.LbAnNave);
    obj.LbAn8:setName("LbAn8");
    obj.LbAn8:setSRC("/Naves/L/7 - LbAn/8.png");
    obj.LbAn8:setLeft(500);
    obj.LbAn8:setTop(165);
    obj.LbAn8:setWidth(100);
    obj.LbAn8:setHeight(120);
    obj.LbAn8:setVisible(false);

    obj.model15 = GUI.fromHandle(_obj_newObject("label"));
    obj.model15:setParent(obj.LbAnNave);
    obj.model15:setName("model15");
    obj.model15:setLeft(153.13);
    obj.model15:setTop(95.50);
    obj.model15:setWidth(173.63);
    obj.model15:setHeight(47.25);
    obj.model15:setHorzTextAlign("center");
    obj.model15:setFontSize(30);
    lfm_setPropAsString(obj.model15, "fontStyle",  "bold");
    obj.model15:setText("LbAn");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.LbAnNave);
    obj.edit43:setField("nomeNave15");
    obj.edit43:setLeft(153.12);
    obj.edit43:setTop(149.50);
    obj.edit43:setWidth(173.62);
    obj.edit43:setHeight(47.25);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setFontSize(30);
    lfm_setPropAsString(obj.edit43, "fontStyle",  "bold");
    obj.edit43:setTransparent(true);
    obj.edit43:setName("edit43");

    obj.textEditor29 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor29:setParent(obj.LbAnNave);
    obj.textEditor29:setField("Textoanotacao28");
    obj.textEditor29:setLeft(334.25);
    obj.textEditor29:setTop(276.25);
    obj.textEditor29:setWidth(222);
    obj.textEditor29:setHeight(111);
    obj.textEditor29:setTransparent(true);
    obj.textEditor29:setName("textEditor29");

    obj.textEditor30 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor30:setParent(obj.LbAnNave);
    obj.textEditor30:setField("Textoanotacao29");
    obj.textEditor30:setLeft(558.25);
    obj.textEditor30:setTop(276.25);
    obj.textEditor30:setWidth(229);
    obj.textEditor30:setHeight(111);
    obj.textEditor30:setTransparent(true);
    obj.textEditor30:setName("textEditor30");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.LbAnNave);
    obj.label15:setField("nivelNave15");
    obj.label15:setLeft(153.12);
    obj.label15:setTop(203.50);
    obj.label15:setWidth(173.62);
    obj.label15:setHeight(47.25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontSize(30);
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setText("0");
    obj.label15:setHitTest(true);
    obj.label15:setName("label15");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.LbAnNave);
    obj.button15:setText("UP");
    lfm_setPropAsString(obj.button15, "fontStyle",  "bold");
    obj.button15:setFontColor("yellow");
    obj.button15:setLeft(148.75);
    obj.button15:setTop(265.50);
    obj.button15:setWidth(30);
    obj.button15:setHeight(27);
    obj.button15:setName("button15");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.LbAnNave);
    obj.layout15:setLeft(1);
    obj.layout15:setTop(1);
    obj.layout15:setWidth(250);
    obj.layout15:setHeight(222);
    obj.layout15:setAlign("client");
    obj.layout15:setName("layout15");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout15);
    obj.edit44:setType("number");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setLeft(519);
    obj.edit44:setTop(112);
    obj.edit44:setWidth(25);
    obj.edit44:setHeight(25);
    obj.edit44:setField("minMin15");
    obj.edit44:setName("edit44");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout15);
    obj.dataLink23:setField("minMin15");
    obj.dataLink23:setName("dataLink23");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout15);
    obj.edit45:setType("number");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setLeft(548);
    obj.edit45:setTop(112);
    obj.edit45:setWidth(25);
    obj.edit45:setHeight(25);
    obj.edit45:setField("maxMin15");
    obj.edit45:setName("edit45");

    obj.progressBar15 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar15:setParent(obj.layout15);
    obj.progressBar15:setLeft(495);
    obj.progressBar15:setTop(138);
    obj.progressBar15:setWidth(105);
    obj.progressBar15:setHeight(20.50);
    obj.progressBar15:setColor("red");
    obj.progressBar15:setHitTest(true);
    obj.progressBar15:setMax(1);
    obj.progressBar15:setField("usosMin15");
    obj.progressBar15:setName("progressBar15");

    obj.LgUNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.LgUNave:setParent(obj.Lnave2);
    obj.LgUNave:setName("LgUNave");
    obj.LgUNave:setAlign("client");
    obj.LgUNave:setVisible(false);

    obj.image123 = GUI.fromHandle(_obj_newObject("image"));
    obj.image123:setParent(obj.LgUNave);
    obj.image123:setSRC("/imagens/fundo.png");
    obj.image123:setLeft(333);
    obj.image123:setTop(62);
    obj.image123:setWidth(452);
    obj.image123:setHeight(323);
    obj.image123:setName("image123");

    obj.image124 = GUI.fromHandle(_obj_newObject("image"));
    obj.image124:setParent(obj.LgUNave);
    obj.image124:setSRC("/imagens/CirculoNave.png");
    obj.image124:setWidth(459);
    obj.image124:setHeight(330);
    obj.image124:setLeft(330.50);
    obj.image124:setTop(60);
    obj.image124:setName("image124");

    obj.image125 = GUI.fromHandle(_obj_newObject("image"));
    obj.image125:setParent(obj.LgUNave);
    obj.image125:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image125:setLeft(50);
    obj.image125:setTop(94);
    obj.image125:setWidth(279);
    obj.image125:setHeight(54);
    obj.image125:setName("image125");

    obj.image126 = GUI.fromHandle(_obj_newObject("image"));
    obj.image126:setParent(obj.LgUNave);
    obj.image126:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image126:setLeft(50);
    obj.image126:setTop(148);
    obj.image126:setWidth(279);
    obj.image126:setHeight(54);
    obj.image126:setName("image126");

    obj.image127 = GUI.fromHandle(_obj_newObject("image"));
    obj.image127:setParent(obj.LgUNave);
    obj.image127:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image127:setLeft(50);
    obj.image127:setTop(201);
    obj.image127:setWidth(279);
    obj.image127:setHeight(54);
    obj.image127:setName("image127");

    obj.image128 = GUI.fromHandle(_obj_newObject("image"));
    obj.image128:setParent(obj.LgUNave);
    obj.image128:setSRC("/imagens/model.png");
    obj.image128:setLeft(59);
    obj.image128:setTop(110);
    obj.image128:setWidth(91);
    obj.image128:setHeight(19);
    obj.image128:setName("image128");

    obj.image129 = GUI.fromHandle(_obj_newObject("image"));
    obj.image129:setParent(obj.LgUNave);
    obj.image129:setSRC("/imagens/nome.png");
    obj.image129:setLeft(59);
    obj.image129:setTop(168);
    obj.image129:setWidth(74);
    obj.image129:setHeight(19);
    obj.image129:setName("image129");

    obj.image130 = GUI.fromHandle(_obj_newObject("image"));
    obj.image130:setParent(obj.LgUNave);
    obj.image130:setSRC("/imagens/nivelNave.png");
    obj.image130:setLeft(59);
    obj.image130:setTop(216);
    obj.image130:setWidth(71);
    obj.image130:setHeight(25);
    obj.image130:setName("image130");

    obj.LgU1 = GUI.fromHandle(_obj_newObject("image"));
    obj.LgU1:setParent(obj.LgUNave);
    obj.LgU1:setName("LgU1");
    obj.LgU1:setSRC("/Naves/L/8 - LgU/1.png");
    obj.LgU1:setLeft(500);
    obj.LgU1:setTop(165);
    obj.LgU1:setWidth(95);
    obj.LgU1:setHeight(104);
    obj.LgU1:setVisible(false);

    obj.LgU2 = GUI.fromHandle(_obj_newObject("image"));
    obj.LgU2:setParent(obj.LgUNave);
    obj.LgU2:setName("LgU2");
    obj.LgU2:setSRC("/Naves/L/8 - LgU/2.png");
    obj.LgU2:setLeft(500);
    obj.LgU2:setTop(165);
    obj.LgU2:setWidth(120);
    obj.LgU2:setHeight(114);
    obj.LgU2:setVisible(false);

    obj.LgU3 = GUI.fromHandle(_obj_newObject("image"));
    obj.LgU3:setParent(obj.LgUNave);
    obj.LgU3:setName("LgU3");
    obj.LgU3:setSRC("/Naves/L/8 - LgU/3.png");
    obj.LgU3:setLeft(500);
    obj.LgU3:setTop(165);
    obj.LgU3:setWidth(120);
    obj.LgU3:setHeight(106);
    obj.LgU3:setVisible(false);

    obj.LgU4 = GUI.fromHandle(_obj_newObject("image"));
    obj.LgU4:setParent(obj.LgUNave);
    obj.LgU4:setName("LgU4");
    obj.LgU4:setSRC("/Naves/L/8 - LgU/4.png");
    obj.LgU4:setLeft(500);
    obj.LgU4:setTop(165);
    obj.LgU4:setWidth(120);
    obj.LgU4:setHeight(104);
    obj.LgU4:setVisible(false);

    obj.LgU5 = GUI.fromHandle(_obj_newObject("image"));
    obj.LgU5:setParent(obj.LgUNave);
    obj.LgU5:setName("LgU5");
    obj.LgU5:setSRC("/Naves/L/8 - LgU/5.png");
    obj.LgU5:setLeft(500);
    obj.LgU5:setTop(165);
    obj.LgU5:setWidth(100);
    obj.LgU5:setHeight(104);
    obj.LgU5:setVisible(false);

    obj.LgU6 = GUI.fromHandle(_obj_newObject("image"));
    obj.LgU6:setParent(obj.LgUNave);
    obj.LgU6:setName("LgU6");
    obj.LgU6:setSRC("/Naves/L/8 - LgU/6.png");
    obj.LgU6:setLeft(500);
    obj.LgU6:setTop(165);
    obj.LgU6:setWidth(95);
    obj.LgU6:setHeight(104);
    obj.LgU6:setVisible(false);

    obj.LgU7 = GUI.fromHandle(_obj_newObject("image"));
    obj.LgU7:setParent(obj.LgUNave);
    obj.LgU7:setName("LgU7");
    obj.LgU7:setSRC("/Naves/L/8 - LgU/7.png");
    obj.LgU7:setLeft(500);
    obj.LgU7:setTop(165);
    obj.LgU7:setWidth(100);
    obj.LgU7:setHeight(120);
    obj.LgU7:setVisible(false);

    obj.LgU8 = GUI.fromHandle(_obj_newObject("image"));
    obj.LgU8:setParent(obj.LgUNave);
    obj.LgU8:setName("LgU8");
    obj.LgU8:setSRC("/Naves/L/8 - LgU/8.png");
    obj.LgU8:setLeft(500);
    obj.LgU8:setTop(165);
    obj.LgU8:setWidth(100);
    obj.LgU8:setHeight(120);
    obj.LgU8:setVisible(false);

    obj.model16 = GUI.fromHandle(_obj_newObject("label"));
    obj.model16:setParent(obj.LgUNave);
    obj.model16:setName("model16");
    obj.model16:setLeft(153.13);
    obj.model16:setTop(95.50);
    obj.model16:setWidth(173.63);
    obj.model16:setHeight(47.25);
    obj.model16:setHorzTextAlign("center");
    obj.model16:setFontSize(30);
    lfm_setPropAsString(obj.model16, "fontStyle",  "bold");
    obj.model16:setText("LgU");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.LgUNave);
    obj.edit46:setField("nomeNave16");
    obj.edit46:setLeft(153.12);
    obj.edit46:setTop(149.50);
    obj.edit46:setWidth(173.62);
    obj.edit46:setHeight(47.25);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(30);
    lfm_setPropAsString(obj.edit46, "fontStyle",  "bold");
    obj.edit46:setTransparent(true);
    obj.edit46:setName("edit46");

    obj.textEditor31 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor31:setParent(obj.LgUNave);
    obj.textEditor31:setField("Textoanotacao30");
    obj.textEditor31:setLeft(334.25);
    obj.textEditor31:setTop(276.25);
    obj.textEditor31:setWidth(222);
    obj.textEditor31:setHeight(111);
    obj.textEditor31:setTransparent(true);
    obj.textEditor31:setName("textEditor31");

    obj.textEditor32 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor32:setParent(obj.LgUNave);
    obj.textEditor32:setField("Textoanotacao31");
    obj.textEditor32:setLeft(558.25);
    obj.textEditor32:setTop(276.25);
    obj.textEditor32:setWidth(229);
    obj.textEditor32:setHeight(111);
    obj.textEditor32:setTransparent(true);
    obj.textEditor32:setName("textEditor32");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.LgUNave);
    obj.label16:setField("nivelNave16");
    obj.label16:setLeft(153.12);
    obj.label16:setTop(203.50);
    obj.label16:setWidth(173.62);
    obj.label16:setHeight(47.25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(30);
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setText("0");
    obj.label16:setHitTest(true);
    obj.label16:setName("label16");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.LgUNave);
    obj.button16:setText("UP");
    lfm_setPropAsString(obj.button16, "fontStyle",  "bold");
    obj.button16:setFontColor("yellow");
    obj.button16:setLeft(148.75);
    obj.button16:setTop(265.50);
    obj.button16:setWidth(30);
    obj.button16:setHeight(27);
    obj.button16:setName("button16");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.LgUNave);
    obj.layout16:setLeft(1);
    obj.layout16:setTop(1);
    obj.layout16:setWidth(250);
    obj.layout16:setHeight(222);
    obj.layout16:setAlign("client");
    obj.layout16:setName("layout16");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout16);
    obj.edit47:setType("number");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setLeft(519);
    obj.edit47:setTop(112);
    obj.edit47:setWidth(25);
    obj.edit47:setHeight(25);
    obj.edit47:setField("minMin16");
    obj.edit47:setName("edit47");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout16);
    obj.dataLink24:setField("minMin16");
    obj.dataLink24:setName("dataLink24");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout16);
    obj.edit48:setType("number");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setLeft(548);
    obj.edit48:setTop(112);
    obj.edit48:setWidth(25);
    obj.edit48:setHeight(25);
    obj.edit48:setField("maxMin16");
    obj.edit48:setName("edit48");

    obj.progressBar16 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar16:setParent(obj.layout16);
    obj.progressBar16:setLeft(495);
    obj.progressBar16:setTop(138);
    obj.progressBar16:setWidth(105);
    obj.progressBar16:setHeight(20.50);
    obj.progressBar16:setColor("red");
    obj.progressBar16:setHitTest(true);
    obj.progressBar16:setMax(1);
    obj.progressBar16:setField("usosMin16");
    obj.progressBar16:setName("progressBar16");

    obj.BotaoNaveN9 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN9:setParent(obj.Lnave2);
    obj.BotaoNaveN9:setName("BotaoNaveN9");
    obj.BotaoNaveN9:setText("Lqw");
    obj.BotaoNaveN9:setLeft(63.75);
    obj.BotaoNaveN9:setTop(301);
    obj.BotaoNaveN9:setWidth(70.25);
    obj.BotaoNaveN9:setHeight(27);
    obj.BotaoNaveN9:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN9, "fontStyle",  "bold");

    obj.BotaoNaveN10 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN10:setParent(obj.Lnave2);
    obj.BotaoNaveN10:setName("BotaoNaveN10");
    obj.BotaoNaveN10:setText("LDa");
    obj.BotaoNaveN10:setLeft(138);
    obj.BotaoNaveN10:setTop(301);
    obj.BotaoNaveN10:setWidth(70.25);
    obj.BotaoNaveN10:setHeight(27);
    obj.BotaoNaveN10:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN10, "fontStyle",  "bold");

    obj.BotaoNaveN11 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN11:setParent(obj.Lnave2);
    obj.BotaoNaveN11:setName("BotaoNaveN11");
    obj.BotaoNaveN11:setText("Lhn");
    obj.BotaoNaveN11:setLeft(213);
    obj.BotaoNaveN11:setTop(301);
    obj.BotaoNaveN11:setWidth(70.25);
    obj.BotaoNaveN11:setHeight(27);
    obj.BotaoNaveN11:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN11, "fontStyle",  "bold");

    obj.BotaoNaveN12 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN12:setParent(obj.Lnave2);
    obj.BotaoNaveN12:setName("BotaoNaveN12");
    obj.BotaoNaveN12:setText("LjN");
    obj.BotaoNaveN12:setLeft(63.75);
    obj.BotaoNaveN12:setTop(333);
    obj.BotaoNaveN12:setWidth(70.25);
    obj.BotaoNaveN12:setHeight(27);
    obj.BotaoNaveN12:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN12, "fontStyle",  "bold");

    obj.BotaoNaveN13 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN13:setParent(obj.Lnave2);
    obj.BotaoNaveN13:setName("BotaoNaveN13");
    obj.BotaoNaveN13:setText("LaH");
    obj.BotaoNaveN13:setLeft(138);
    obj.BotaoNaveN13:setTop(333);
    obj.BotaoNaveN13:setWidth(70.25);
    obj.BotaoNaveN13:setHeight(27);
    obj.BotaoNaveN13:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN13, "fontStyle",  "bold");

    obj.BotaoNaveN14 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN14:setParent(obj.Lnave2);
    obj.BotaoNaveN14:setName("BotaoNaveN14");
    obj.BotaoNaveN14:setText("LmH");
    obj.BotaoNaveN14:setLeft(213);
    obj.BotaoNaveN14:setTop(333);
    obj.BotaoNaveN14:setWidth(70.25);
    obj.BotaoNaveN14:setHeight(27);
    obj.BotaoNaveN14:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN14, "fontStyle",  "bold");

    obj.BotaoNaveN15 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN15:setParent(obj.Lnave2);
    obj.BotaoNaveN15:setName("BotaoNaveN15");
    obj.BotaoNaveN15:setText("LbAn");
    obj.BotaoNaveN15:setLeft(63.75);
    obj.BotaoNaveN15:setTop(365);
    obj.BotaoNaveN15:setWidth(70.25);
    obj.BotaoNaveN15:setHeight(27);
    obj.BotaoNaveN15:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN15, "fontStyle",  "bold");

    obj.BotaoNaveN16 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN16:setParent(obj.Lnave2);
    obj.BotaoNaveN16:setName("BotaoNaveN16");
    obj.BotaoNaveN16:setText("LgU");
    obj.BotaoNaveN16:setLeft(138);
    obj.BotaoNaveN16:setTop(365);
    obj.BotaoNaveN16:setWidth(70.25);
    obj.BotaoNaveN16:setHeight(27);
    obj.BotaoNaveN16:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN16, "fontStyle",  "bold");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.Lnave2);
    obj.dataLink25:setField("nivelNave9");
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.Lnave2);
    obj.dataLink26:setField("nivelNave10");
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.Lnave2);
    obj.dataLink27:setField("nivelNave11");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.Lnave2);
    obj.dataLink28:setField("nivelNave12");
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.Lnave2);
    obj.dataLink29:setField("nivelNave13");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.Lnave2);
    obj.dataLink30:setField("nivelNave14");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.Lnave2);
    obj.dataLink31:setField("nivelNave15");
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.Lnave2);
    obj.dataLink32:setField("nivelNave16");
    obj.dataLink32:setName("dataLink32");

    obj.Lnave3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Lnave3:setParent(obj.scrollBox1);
    obj.Lnave3:setName("Lnave3");
    obj.Lnave3:setAlign("client");
    obj.Lnave3:setVisible(false);

    obj.NkoNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.NkoNave:setParent(obj.Lnave3);
    obj.NkoNave:setName("NkoNave");
    obj.NkoNave:setAlign("client");
    obj.NkoNave:setVisible(false);

    obj.image131 = GUI.fromHandle(_obj_newObject("image"));
    obj.image131:setParent(obj.NkoNave);
    obj.image131:setSRC("/imagens/fundo.png");
    obj.image131:setLeft(333);
    obj.image131:setTop(62);
    obj.image131:setWidth(452);
    obj.image131:setHeight(323);
    obj.image131:setName("image131");

    obj.image132 = GUI.fromHandle(_obj_newObject("image"));
    obj.image132:setParent(obj.NkoNave);
    obj.image132:setSRC("/imagens/CirculoNave.png");
    obj.image132:setWidth(459);
    obj.image132:setHeight(330);
    obj.image132:setLeft(330.50);
    obj.image132:setTop(60);
    obj.image132:setName("image132");

    obj.image133 = GUI.fromHandle(_obj_newObject("image"));
    obj.image133:setParent(obj.NkoNave);
    obj.image133:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image133:setLeft(50);
    obj.image133:setTop(94);
    obj.image133:setWidth(279);
    obj.image133:setHeight(54);
    obj.image133:setName("image133");

    obj.image134 = GUI.fromHandle(_obj_newObject("image"));
    obj.image134:setParent(obj.NkoNave);
    obj.image134:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image134:setLeft(50);
    obj.image134:setTop(148);
    obj.image134:setWidth(279);
    obj.image134:setHeight(54);
    obj.image134:setName("image134");

    obj.image135 = GUI.fromHandle(_obj_newObject("image"));
    obj.image135:setParent(obj.NkoNave);
    obj.image135:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image135:setLeft(50);
    obj.image135:setTop(201);
    obj.image135:setWidth(279);
    obj.image135:setHeight(54);
    obj.image135:setName("image135");

    obj.image136 = GUI.fromHandle(_obj_newObject("image"));
    obj.image136:setParent(obj.NkoNave);
    obj.image136:setSRC("/imagens/model.png");
    obj.image136:setLeft(59);
    obj.image136:setTop(110);
    obj.image136:setWidth(91);
    obj.image136:setHeight(19);
    obj.image136:setName("image136");

    obj.image137 = GUI.fromHandle(_obj_newObject("image"));
    obj.image137:setParent(obj.NkoNave);
    obj.image137:setSRC("/imagens/nome.png");
    obj.image137:setLeft(59);
    obj.image137:setTop(168);
    obj.image137:setWidth(74);
    obj.image137:setHeight(19);
    obj.image137:setName("image137");

    obj.image138 = GUI.fromHandle(_obj_newObject("image"));
    obj.image138:setParent(obj.NkoNave);
    obj.image138:setSRC("/imagens/nivelNave.png");
    obj.image138:setLeft(59);
    obj.image138:setTop(216);
    obj.image138:setWidth(71);
    obj.image138:setHeight(25);
    obj.image138:setName("image138");

    obj.Nko1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nko1:setParent(obj.NkoNave);
    obj.Nko1:setName("Nko1");
    obj.Nko1:setSRC("/Naves/N/1 - Nko/1.png");
    obj.Nko1:setLeft(500);
    obj.Nko1:setTop(165);
    obj.Nko1:setWidth(95);
    obj.Nko1:setHeight(104);
    obj.Nko1:setVisible(false);

    obj.Nko2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nko2:setParent(obj.NkoNave);
    obj.Nko2:setName("Nko2");
    obj.Nko2:setSRC("/Naves/N/1 - Nko/2.png");
    obj.Nko2:setLeft(500);
    obj.Nko2:setTop(165);
    obj.Nko2:setWidth(120);
    obj.Nko2:setHeight(114);
    obj.Nko2:setVisible(false);

    obj.Nko3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nko3:setParent(obj.NkoNave);
    obj.Nko3:setName("Nko3");
    obj.Nko3:setSRC("/Naves/N/1 - Nko/3.png");
    obj.Nko3:setLeft(500);
    obj.Nko3:setTop(165);
    obj.Nko3:setWidth(120);
    obj.Nko3:setHeight(106);
    obj.Nko3:setVisible(false);

    obj.Nko4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nko4:setParent(obj.NkoNave);
    obj.Nko4:setName("Nko4");
    obj.Nko4:setSRC("/Naves/N/1 - Nko/4.png");
    obj.Nko4:setLeft(500);
    obj.Nko4:setTop(165);
    obj.Nko4:setWidth(120);
    obj.Nko4:setHeight(104);
    obj.Nko4:setVisible(false);

    obj.Nko5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nko5:setParent(obj.NkoNave);
    obj.Nko5:setName("Nko5");
    obj.Nko5:setSRC("/Naves/N/1 - Nko/5.png");
    obj.Nko5:setLeft(500);
    obj.Nko5:setTop(165);
    obj.Nko5:setWidth(100);
    obj.Nko5:setHeight(104);
    obj.Nko5:setVisible(false);

    obj.Nko6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nko6:setParent(obj.NkoNave);
    obj.Nko6:setName("Nko6");
    obj.Nko6:setSRC("/Naves/N/1 - Nko/6.png");
    obj.Nko6:setLeft(500);
    obj.Nko6:setTop(165);
    obj.Nko6:setWidth(95);
    obj.Nko6:setHeight(104);
    obj.Nko6:setVisible(false);

    obj.Nko7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nko7:setParent(obj.NkoNave);
    obj.Nko7:setName("Nko7");
    obj.Nko7:setSRC("/Naves/N/1 - Nko/7.png");
    obj.Nko7:setLeft(500);
    obj.Nko7:setTop(165);
    obj.Nko7:setWidth(100);
    obj.Nko7:setHeight(120);
    obj.Nko7:setVisible(false);

    obj.Nko8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nko8:setParent(obj.NkoNave);
    obj.Nko8:setName("Nko8");
    obj.Nko8:setSRC("/Naves/N/1 - Nko/8.png");
    obj.Nko8:setLeft(500);
    obj.Nko8:setTop(165);
    obj.Nko8:setWidth(100);
    obj.Nko8:setHeight(120);
    obj.Nko8:setVisible(false);

    obj.model17 = GUI.fromHandle(_obj_newObject("label"));
    obj.model17:setParent(obj.NkoNave);
    obj.model17:setName("model17");
    obj.model17:setLeft(153.13);
    obj.model17:setTop(95.50);
    obj.model17:setWidth(173.63);
    obj.model17:setHeight(47.25);
    obj.model17:setHorzTextAlign("center");
    obj.model17:setFontSize(30);
    lfm_setPropAsString(obj.model17, "fontStyle",  "bold");
    obj.model17:setText("Nko");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.NkoNave);
    obj.edit49:setField("nomeNave17");
    obj.edit49:setLeft(153.12);
    obj.edit49:setTop(149.50);
    obj.edit49:setWidth(173.62);
    obj.edit49:setHeight(47.25);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setFontSize(30);
    lfm_setPropAsString(obj.edit49, "fontStyle",  "bold");
    obj.edit49:setTransparent(true);
    obj.edit49:setName("edit49");

    obj.textEditor33 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor33:setParent(obj.NkoNave);
    obj.textEditor33:setField("Textoanotacao32");
    obj.textEditor33:setLeft(334.25);
    obj.textEditor33:setTop(276.25);
    obj.textEditor33:setWidth(222);
    obj.textEditor33:setHeight(111);
    obj.textEditor33:setTransparent(true);
    obj.textEditor33:setName("textEditor33");

    obj.textEditor34 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor34:setParent(obj.NkoNave);
    obj.textEditor34:setField("Textoanotacao33");
    obj.textEditor34:setLeft(558.25);
    obj.textEditor34:setTop(276.25);
    obj.textEditor34:setWidth(229);
    obj.textEditor34:setHeight(111);
    obj.textEditor34:setTransparent(true);
    obj.textEditor34:setName("textEditor34");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.NkoNave);
    obj.label17:setField("nivelNave17");
    obj.label17:setLeft(153.12);
    obj.label17:setTop(203.50);
    obj.label17:setWidth(173.62);
    obj.label17:setHeight(47.25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(30);
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setHitTest(true);
    obj.label17:setName("label17");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.NkoNave);
    obj.button17:setText("UP");
    lfm_setPropAsString(obj.button17, "fontStyle",  "bold");
    obj.button17:setFontColor("yellow");
    obj.button17:setLeft(148.75);
    obj.button17:setTop(265.50);
    obj.button17:setWidth(30);
    obj.button17:setHeight(27);
    obj.button17:setName("button17");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.NkoNave);
    obj.layout17:setLeft(1);
    obj.layout17:setTop(1);
    obj.layout17:setWidth(250);
    obj.layout17:setHeight(222);
    obj.layout17:setAlign("client");
    obj.layout17:setName("layout17");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout17);
    obj.edit50:setType("number");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setLeft(519);
    obj.edit50:setTop(112);
    obj.edit50:setWidth(25);
    obj.edit50:setHeight(25);
    obj.edit50:setField("minMin17");
    obj.edit50:setName("edit50");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout17);
    obj.dataLink33:setField("minMin17");
    obj.dataLink33:setName("dataLink33");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout17);
    obj.edit51:setType("number");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setLeft(548);
    obj.edit51:setTop(112);
    obj.edit51:setWidth(25);
    obj.edit51:setHeight(25);
    obj.edit51:setField("maxMin17");
    obj.edit51:setName("edit51");

    obj.progressBar17 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar17:setParent(obj.layout17);
    obj.progressBar17:setLeft(495);
    obj.progressBar17:setTop(138);
    obj.progressBar17:setWidth(105);
    obj.progressBar17:setHeight(20.50);
    obj.progressBar17:setColor("red");
    obj.progressBar17:setHitTest(true);
    obj.progressBar17:setMax(1);
    obj.progressBar17:setField("usosMin17");
    obj.progressBar17:setName("progressBar17");

    obj.NnpNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.NnpNave:setParent(obj.Lnave3);
    obj.NnpNave:setName("NnpNave");
    obj.NnpNave:setAlign("client");
    obj.NnpNave:setVisible(false);

    obj.image139 = GUI.fromHandle(_obj_newObject("image"));
    obj.image139:setParent(obj.NnpNave);
    obj.image139:setSRC("/imagens/fundo.png");
    obj.image139:setLeft(333);
    obj.image139:setTop(62);
    obj.image139:setWidth(452);
    obj.image139:setHeight(323);
    obj.image139:setName("image139");

    obj.image140 = GUI.fromHandle(_obj_newObject("image"));
    obj.image140:setParent(obj.NnpNave);
    obj.image140:setSRC("/imagens/CirculoNave.png");
    obj.image140:setWidth(459);
    obj.image140:setHeight(330);
    obj.image140:setLeft(330.50);
    obj.image140:setTop(60);
    obj.image140:setName("image140");

    obj.image141 = GUI.fromHandle(_obj_newObject("image"));
    obj.image141:setParent(obj.NnpNave);
    obj.image141:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image141:setLeft(50);
    obj.image141:setTop(94);
    obj.image141:setWidth(279);
    obj.image141:setHeight(54);
    obj.image141:setName("image141");

    obj.image142 = GUI.fromHandle(_obj_newObject("image"));
    obj.image142:setParent(obj.NnpNave);
    obj.image142:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image142:setLeft(50);
    obj.image142:setTop(148);
    obj.image142:setWidth(279);
    obj.image142:setHeight(54);
    obj.image142:setName("image142");

    obj.image143 = GUI.fromHandle(_obj_newObject("image"));
    obj.image143:setParent(obj.NnpNave);
    obj.image143:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image143:setLeft(50);
    obj.image143:setTop(201);
    obj.image143:setWidth(279);
    obj.image143:setHeight(54);
    obj.image143:setName("image143");

    obj.image144 = GUI.fromHandle(_obj_newObject("image"));
    obj.image144:setParent(obj.NnpNave);
    obj.image144:setSRC("/imagens/model.png");
    obj.image144:setLeft(59);
    obj.image144:setTop(110);
    obj.image144:setWidth(91);
    obj.image144:setHeight(19);
    obj.image144:setName("image144");

    obj.image145 = GUI.fromHandle(_obj_newObject("image"));
    obj.image145:setParent(obj.NnpNave);
    obj.image145:setSRC("/imagens/nome.png");
    obj.image145:setLeft(59);
    obj.image145:setTop(168);
    obj.image145:setWidth(74);
    obj.image145:setHeight(19);
    obj.image145:setName("image145");

    obj.image146 = GUI.fromHandle(_obj_newObject("image"));
    obj.image146:setParent(obj.NnpNave);
    obj.image146:setSRC("/imagens/nivelNave.png");
    obj.image146:setLeft(59);
    obj.image146:setTop(216);
    obj.image146:setWidth(71);
    obj.image146:setHeight(25);
    obj.image146:setName("image146");

    obj.Nnp1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nnp1:setParent(obj.NnpNave);
    obj.Nnp1:setName("Nnp1");
    obj.Nnp1:setSRC("/Naves/N/2 - Nnp/1.png");
    obj.Nnp1:setLeft(500);
    obj.Nnp1:setTop(165);
    obj.Nnp1:setWidth(95);
    obj.Nnp1:setHeight(104);
    obj.Nnp1:setVisible(false);

    obj.Nnp2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nnp2:setParent(obj.NnpNave);
    obj.Nnp2:setName("Nnp2");
    obj.Nnp2:setSRC("/Naves/N/2 - Nnp/2.png");
    obj.Nnp2:setLeft(500);
    obj.Nnp2:setTop(165);
    obj.Nnp2:setWidth(120);
    obj.Nnp2:setHeight(114);
    obj.Nnp2:setVisible(false);

    obj.Nnp3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nnp3:setParent(obj.NnpNave);
    obj.Nnp3:setName("Nnp3");
    obj.Nnp3:setSRC("/Naves/N/2 - Nnp/3.png");
    obj.Nnp3:setLeft(500);
    obj.Nnp3:setTop(165);
    obj.Nnp3:setWidth(120);
    obj.Nnp3:setHeight(106);
    obj.Nnp3:setVisible(false);

    obj.Nnp4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nnp4:setParent(obj.NnpNave);
    obj.Nnp4:setName("Nnp4");
    obj.Nnp4:setSRC("/Naves/N/2 - Nnp/4.png");
    obj.Nnp4:setLeft(500);
    obj.Nnp4:setTop(165);
    obj.Nnp4:setWidth(120);
    obj.Nnp4:setHeight(104);
    obj.Nnp4:setVisible(false);

    obj.Nnp5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nnp5:setParent(obj.NnpNave);
    obj.Nnp5:setName("Nnp5");
    obj.Nnp5:setSRC("/Naves/N/2 - Nnp/5.png");
    obj.Nnp5:setLeft(500);
    obj.Nnp5:setTop(165);
    obj.Nnp5:setWidth(100);
    obj.Nnp5:setHeight(104);
    obj.Nnp5:setVisible(false);

    obj.Nnp6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nnp6:setParent(obj.NnpNave);
    obj.Nnp6:setName("Nnp6");
    obj.Nnp6:setSRC("/Naves/N/2 - Nnp/6.png");
    obj.Nnp6:setLeft(500);
    obj.Nnp6:setTop(165);
    obj.Nnp6:setWidth(95);
    obj.Nnp6:setHeight(104);
    obj.Nnp6:setVisible(false);

    obj.Nnp7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nnp7:setParent(obj.NnpNave);
    obj.Nnp7:setName("Nnp7");
    obj.Nnp7:setSRC("/Naves/N/2 - Nnp/7.png");
    obj.Nnp7:setLeft(500);
    obj.Nnp7:setTop(165);
    obj.Nnp7:setWidth(100);
    obj.Nnp7:setHeight(120);
    obj.Nnp7:setVisible(false);

    obj.Nnp8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nnp8:setParent(obj.NnpNave);
    obj.Nnp8:setName("Nnp8");
    obj.Nnp8:setSRC("/Naves/N/2 - Nnp/8.png");
    obj.Nnp8:setLeft(500);
    obj.Nnp8:setTop(165);
    obj.Nnp8:setWidth(100);
    obj.Nnp8:setHeight(120);
    obj.Nnp8:setVisible(false);

    obj.model18 = GUI.fromHandle(_obj_newObject("label"));
    obj.model18:setParent(obj.NnpNave);
    obj.model18:setName("model18");
    obj.model18:setLeft(153.13);
    obj.model18:setTop(95.50);
    obj.model18:setWidth(173.63);
    obj.model18:setHeight(47.25);
    obj.model18:setHorzTextAlign("center");
    obj.model18:setFontSize(30);
    lfm_setPropAsString(obj.model18, "fontStyle",  "bold");
    obj.model18:setText("Nnp");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.NnpNave);
    obj.edit52:setField("nomeNave18");
    obj.edit52:setLeft(153.12);
    obj.edit52:setTop(149.50);
    obj.edit52:setWidth(173.62);
    obj.edit52:setHeight(47.25);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontSize(30);
    lfm_setPropAsString(obj.edit52, "fontStyle",  "bold");
    obj.edit52:setTransparent(true);
    obj.edit52:setName("edit52");

    obj.textEditor35 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor35:setParent(obj.NnpNave);
    obj.textEditor35:setField("Textoanotacao34");
    obj.textEditor35:setLeft(334.25);
    obj.textEditor35:setTop(276.25);
    obj.textEditor35:setWidth(222);
    obj.textEditor35:setHeight(111);
    obj.textEditor35:setTransparent(true);
    obj.textEditor35:setName("textEditor35");

    obj.textEditor36 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor36:setParent(obj.NnpNave);
    obj.textEditor36:setField("Textoanotacao35");
    obj.textEditor36:setLeft(558.25);
    obj.textEditor36:setTop(276.25);
    obj.textEditor36:setWidth(229);
    obj.textEditor36:setHeight(111);
    obj.textEditor36:setTransparent(true);
    obj.textEditor36:setName("textEditor36");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.NnpNave);
    obj.label18:setField("nivelNave18");
    obj.label18:setLeft(153.12);
    obj.label18:setTop(203.50);
    obj.label18:setWidth(173.62);
    obj.label18:setHeight(47.25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontSize(30);
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setHitTest(true);
    obj.label18:setName("label18");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.NnpNave);
    obj.button18:setText("UP");
    lfm_setPropAsString(obj.button18, "fontStyle",  "bold");
    obj.button18:setFontColor("yellow");
    obj.button18:setLeft(148.75);
    obj.button18:setTop(265.50);
    obj.button18:setWidth(30);
    obj.button18:setHeight(27);
    obj.button18:setName("button18");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.NnpNave);
    obj.layout18:setLeft(1);
    obj.layout18:setTop(1);
    obj.layout18:setWidth(250);
    obj.layout18:setHeight(222);
    obj.layout18:setAlign("client");
    obj.layout18:setName("layout18");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout18);
    obj.edit53:setType("number");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setLeft(519);
    obj.edit53:setTop(112);
    obj.edit53:setWidth(25);
    obj.edit53:setHeight(25);
    obj.edit53:setField("minMin18");
    obj.edit53:setName("edit53");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout18);
    obj.dataLink34:setField("minMin18");
    obj.dataLink34:setName("dataLink34");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout18);
    obj.edit54:setType("number");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setLeft(548);
    obj.edit54:setTop(112);
    obj.edit54:setWidth(25);
    obj.edit54:setHeight(25);
    obj.edit54:setField("maxMin18");
    obj.edit54:setName("edit54");

    obj.progressBar18 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar18:setParent(obj.layout18);
    obj.progressBar18:setLeft(495);
    obj.progressBar18:setTop(138);
    obj.progressBar18:setWidth(105);
    obj.progressBar18:setHeight(20.50);
    obj.progressBar18:setColor("red");
    obj.progressBar18:setHitTest(true);
    obj.progressBar18:setMax(1);
    obj.progressBar18:setField("usosMin18");
    obj.progressBar18:setName("progressBar18");

    obj.Ne3Nave = GUI.fromHandle(_obj_newObject("layout"));
    obj.Ne3Nave:setParent(obj.Lnave3);
    obj.Ne3Nave:setName("Ne3Nave");
    obj.Ne3Nave:setAlign("client");
    obj.Ne3Nave:setVisible(false);

    obj.image147 = GUI.fromHandle(_obj_newObject("image"));
    obj.image147:setParent(obj.Ne3Nave);
    obj.image147:setSRC("/imagens/fundo.png");
    obj.image147:setLeft(333);
    obj.image147:setTop(62);
    obj.image147:setWidth(452);
    obj.image147:setHeight(323);
    obj.image147:setName("image147");

    obj.image148 = GUI.fromHandle(_obj_newObject("image"));
    obj.image148:setParent(obj.Ne3Nave);
    obj.image148:setSRC("/imagens/CirculoNave.png");
    obj.image148:setWidth(459);
    obj.image148:setHeight(330);
    obj.image148:setLeft(330.50);
    obj.image148:setTop(60);
    obj.image148:setName("image148");

    obj.image149 = GUI.fromHandle(_obj_newObject("image"));
    obj.image149:setParent(obj.Ne3Nave);
    obj.image149:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image149:setLeft(50);
    obj.image149:setTop(94);
    obj.image149:setWidth(279);
    obj.image149:setHeight(54);
    obj.image149:setName("image149");

    obj.image150 = GUI.fromHandle(_obj_newObject("image"));
    obj.image150:setParent(obj.Ne3Nave);
    obj.image150:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image150:setLeft(50);
    obj.image150:setTop(148);
    obj.image150:setWidth(279);
    obj.image150:setHeight(54);
    obj.image150:setName("image150");

    obj.image151 = GUI.fromHandle(_obj_newObject("image"));
    obj.image151:setParent(obj.Ne3Nave);
    obj.image151:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image151:setLeft(50);
    obj.image151:setTop(201);
    obj.image151:setWidth(279);
    obj.image151:setHeight(54);
    obj.image151:setName("image151");

    obj.image152 = GUI.fromHandle(_obj_newObject("image"));
    obj.image152:setParent(obj.Ne3Nave);
    obj.image152:setSRC("/imagens/model.png");
    obj.image152:setLeft(59);
    obj.image152:setTop(110);
    obj.image152:setWidth(91);
    obj.image152:setHeight(19);
    obj.image152:setName("image152");

    obj.image153 = GUI.fromHandle(_obj_newObject("image"));
    obj.image153:setParent(obj.Ne3Nave);
    obj.image153:setSRC("/imagens/nome.png");
    obj.image153:setLeft(59);
    obj.image153:setTop(168);
    obj.image153:setWidth(74);
    obj.image153:setHeight(19);
    obj.image153:setName("image153");

    obj.image154 = GUI.fromHandle(_obj_newObject("image"));
    obj.image154:setParent(obj.Ne3Nave);
    obj.image154:setSRC("/imagens/nivelNave.png");
    obj.image154:setLeft(59);
    obj.image154:setTop(216);
    obj.image154:setWidth(71);
    obj.image154:setHeight(25);
    obj.image154:setName("image154");

    obj.Ne31 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ne31:setParent(obj.Ne3Nave);
    obj.Ne31:setName("Ne31");
    obj.Ne31:setSRC("/Naves/N/3 - Ne3/1.png");
    obj.Ne31:setLeft(500);
    obj.Ne31:setTop(165);
    obj.Ne31:setWidth(95);
    obj.Ne31:setHeight(104);
    obj.Ne31:setVisible(false);

    obj.Ne32 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ne32:setParent(obj.Ne3Nave);
    obj.Ne32:setName("Ne32");
    obj.Ne32:setSRC("/Naves/N/3 - Ne3/2.png");
    obj.Ne32:setLeft(500);
    obj.Ne32:setTop(165);
    obj.Ne32:setWidth(120);
    obj.Ne32:setHeight(114);
    obj.Ne32:setVisible(false);

    obj.Ne33 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ne33:setParent(obj.Ne3Nave);
    obj.Ne33:setName("Ne33");
    obj.Ne33:setSRC("/Naves/N/3 - Ne3/3.png");
    obj.Ne33:setLeft(500);
    obj.Ne33:setTop(165);
    obj.Ne33:setWidth(120);
    obj.Ne33:setHeight(106);
    obj.Ne33:setVisible(false);

    obj.Ne34 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ne34:setParent(obj.Ne3Nave);
    obj.Ne34:setName("Ne34");
    obj.Ne34:setSRC("/Naves/N/3 - Ne3/4.png");
    obj.Ne34:setLeft(500);
    obj.Ne34:setTop(165);
    obj.Ne34:setWidth(120);
    obj.Ne34:setHeight(104);
    obj.Ne34:setVisible(false);

    obj.Ne35 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ne35:setParent(obj.Ne3Nave);
    obj.Ne35:setName("Ne35");
    obj.Ne35:setSRC("/Naves/N/3 - Ne3/5.png");
    obj.Ne35:setLeft(500);
    obj.Ne35:setTop(165);
    obj.Ne35:setWidth(100);
    obj.Ne35:setHeight(104);
    obj.Ne35:setVisible(false);

    obj.Ne36 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ne36:setParent(obj.Ne3Nave);
    obj.Ne36:setName("Ne36");
    obj.Ne36:setSRC("/Naves/N/3 - Ne3/6.png");
    obj.Ne36:setLeft(500);
    obj.Ne36:setTop(165);
    obj.Ne36:setWidth(95);
    obj.Ne36:setHeight(104);
    obj.Ne36:setVisible(false);

    obj.Ne37 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ne37:setParent(obj.Ne3Nave);
    obj.Ne37:setName("Ne37");
    obj.Ne37:setSRC("/Naves/N/3 - Ne3/7.png");
    obj.Ne37:setLeft(500);
    obj.Ne37:setTop(165);
    obj.Ne37:setWidth(100);
    obj.Ne37:setHeight(120);
    obj.Ne37:setVisible(false);

    obj.Ne38 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ne38:setParent(obj.Ne3Nave);
    obj.Ne38:setName("Ne38");
    obj.Ne38:setSRC("/Naves/N/3 - Ne3/8.png");
    obj.Ne38:setLeft(500);
    obj.Ne38:setTop(165);
    obj.Ne38:setWidth(100);
    obj.Ne38:setHeight(120);
    obj.Ne38:setVisible(false);

    obj.model19 = GUI.fromHandle(_obj_newObject("label"));
    obj.model19:setParent(obj.Ne3Nave);
    obj.model19:setName("model19");
    obj.model19:setLeft(153.13);
    obj.model19:setTop(95.50);
    obj.model19:setWidth(173.63);
    obj.model19:setHeight(47.25);
    obj.model19:setHorzTextAlign("center");
    obj.model19:setFontSize(30);
    lfm_setPropAsString(obj.model19, "fontStyle",  "bold");
    obj.model19:setText("Ne3");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.Ne3Nave);
    obj.edit55:setField("nomeNave19");
    obj.edit55:setLeft(153.12);
    obj.edit55:setTop(149.50);
    obj.edit55:setWidth(173.62);
    obj.edit55:setHeight(47.25);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setFontSize(30);
    lfm_setPropAsString(obj.edit55, "fontStyle",  "bold");
    obj.edit55:setTransparent(true);
    obj.edit55:setName("edit55");

    obj.textEditor37 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor37:setParent(obj.Ne3Nave);
    obj.textEditor37:setField("Textoanotacao35");
    obj.textEditor37:setLeft(334.25);
    obj.textEditor37:setTop(276.25);
    obj.textEditor37:setWidth(222);
    obj.textEditor37:setHeight(111);
    obj.textEditor37:setTransparent(true);
    obj.textEditor37:setName("textEditor37");

    obj.textEditor38 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor38:setParent(obj.Ne3Nave);
    obj.textEditor38:setField("Textoanotacao36");
    obj.textEditor38:setLeft(558.25);
    obj.textEditor38:setTop(276.25);
    obj.textEditor38:setWidth(229);
    obj.textEditor38:setHeight(111);
    obj.textEditor38:setTransparent(true);
    obj.textEditor38:setName("textEditor38");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.Ne3Nave);
    obj.label19:setField("nivelNave19");
    obj.label19:setLeft(153.12);
    obj.label19:setTop(203.50);
    obj.label19:setWidth(173.62);
    obj.label19:setHeight(47.25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontSize(30);
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setHitTest(true);
    obj.label19:setName("label19");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.Ne3Nave);
    obj.button19:setText("UP");
    lfm_setPropAsString(obj.button19, "fontStyle",  "bold");
    obj.button19:setFontColor("yellow");
    obj.button19:setLeft(148.75);
    obj.button19:setTop(265.50);
    obj.button19:setWidth(30);
    obj.button19:setHeight(27);
    obj.button19:setName("button19");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.Ne3Nave);
    obj.layout19:setLeft(1);
    obj.layout19:setTop(1);
    obj.layout19:setWidth(250);
    obj.layout19:setHeight(222);
    obj.layout19:setAlign("client");
    obj.layout19:setName("layout19");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout19);
    obj.edit56:setType("number");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setLeft(519);
    obj.edit56:setTop(112);
    obj.edit56:setWidth(25);
    obj.edit56:setHeight(25);
    obj.edit56:setField("minMin19");
    obj.edit56:setName("edit56");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout19);
    obj.dataLink35:setField("minMin19");
    obj.dataLink35:setName("dataLink35");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout19);
    obj.edit57:setType("number");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setLeft(548);
    obj.edit57:setTop(112);
    obj.edit57:setWidth(25);
    obj.edit57:setHeight(25);
    obj.edit57:setField("maxMin19");
    obj.edit57:setName("edit57");

    obj.progressBar19 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar19:setParent(obj.layout19);
    obj.progressBar19:setLeft(495);
    obj.progressBar19:setTop(138);
    obj.progressBar19:setWidth(105);
    obj.progressBar19:setHeight(20.50);
    obj.progressBar19:setColor("red");
    obj.progressBar19:setHitTest(true);
    obj.progressBar19:setMax(1);
    obj.progressBar19:setField("usosMin19");
    obj.progressBar19:setName("progressBar19");

    obj.NnpoQNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.NnpoQNave:setParent(obj.Lnave3);
    obj.NnpoQNave:setName("NnpoQNave");
    obj.NnpoQNave:setAlign("client");
    obj.NnpoQNave:setVisible(false);

    obj.image155 = GUI.fromHandle(_obj_newObject("image"));
    obj.image155:setParent(obj.NnpoQNave);
    obj.image155:setSRC("/imagens/fundo.png");
    obj.image155:setLeft(333);
    obj.image155:setTop(62);
    obj.image155:setWidth(452);
    obj.image155:setHeight(323);
    obj.image155:setName("image155");

    obj.image156 = GUI.fromHandle(_obj_newObject("image"));
    obj.image156:setParent(obj.NnpoQNave);
    obj.image156:setSRC("/imagens/CirculoNave.png");
    obj.image156:setWidth(459);
    obj.image156:setHeight(330);
    obj.image156:setLeft(330.50);
    obj.image156:setTop(60);
    obj.image156:setName("image156");

    obj.image157 = GUI.fromHandle(_obj_newObject("image"));
    obj.image157:setParent(obj.NnpoQNave);
    obj.image157:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image157:setLeft(50);
    obj.image157:setTop(94);
    obj.image157:setWidth(279);
    obj.image157:setHeight(54);
    obj.image157:setName("image157");

    obj.image158 = GUI.fromHandle(_obj_newObject("image"));
    obj.image158:setParent(obj.NnpoQNave);
    obj.image158:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image158:setLeft(50);
    obj.image158:setTop(148);
    obj.image158:setWidth(279);
    obj.image158:setHeight(54);
    obj.image158:setName("image158");

    obj.image159 = GUI.fromHandle(_obj_newObject("image"));
    obj.image159:setParent(obj.NnpoQNave);
    obj.image159:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image159:setLeft(50);
    obj.image159:setTop(201);
    obj.image159:setWidth(279);
    obj.image159:setHeight(54);
    obj.image159:setName("image159");

    obj.image160 = GUI.fromHandle(_obj_newObject("image"));
    obj.image160:setParent(obj.NnpoQNave);
    obj.image160:setSRC("/imagens/model.png");
    obj.image160:setLeft(59);
    obj.image160:setTop(110);
    obj.image160:setWidth(91);
    obj.image160:setHeight(19);
    obj.image160:setName("image160");

    obj.image161 = GUI.fromHandle(_obj_newObject("image"));
    obj.image161:setParent(obj.NnpoQNave);
    obj.image161:setSRC("/imagens/nome.png");
    obj.image161:setLeft(59);
    obj.image161:setTop(168);
    obj.image161:setWidth(74);
    obj.image161:setHeight(19);
    obj.image161:setName("image161");

    obj.image162 = GUI.fromHandle(_obj_newObject("image"));
    obj.image162:setParent(obj.NnpoQNave);
    obj.image162:setSRC("/imagens/nivelNave.png");
    obj.image162:setLeft(59);
    obj.image162:setTop(216);
    obj.image162:setWidth(71);
    obj.image162:setHeight(25);
    obj.image162:setName("image162");

    obj.NnpoQ1 = GUI.fromHandle(_obj_newObject("image"));
    obj.NnpoQ1:setParent(obj.NnpoQNave);
    obj.NnpoQ1:setName("NnpoQ1");
    obj.NnpoQ1:setSRC("/Naves/N/4 - NnpoQ/1.png");
    obj.NnpoQ1:setLeft(500);
    obj.NnpoQ1:setTop(165);
    obj.NnpoQ1:setWidth(95);
    obj.NnpoQ1:setHeight(104);
    obj.NnpoQ1:setVisible(false);

    obj.NnpoQ2 = GUI.fromHandle(_obj_newObject("image"));
    obj.NnpoQ2:setParent(obj.NnpoQNave);
    obj.NnpoQ2:setName("NnpoQ2");
    obj.NnpoQ2:setSRC("/Naves/N/4 - NnpoQ/2.png");
    obj.NnpoQ2:setLeft(500);
    obj.NnpoQ2:setTop(165);
    obj.NnpoQ2:setWidth(120);
    obj.NnpoQ2:setHeight(114);
    obj.NnpoQ2:setVisible(false);

    obj.NnpoQ3 = GUI.fromHandle(_obj_newObject("image"));
    obj.NnpoQ3:setParent(obj.NnpoQNave);
    obj.NnpoQ3:setName("NnpoQ3");
    obj.NnpoQ3:setSRC("/Naves/N/4 - NnpoQ/3.png");
    obj.NnpoQ3:setLeft(500);
    obj.NnpoQ3:setTop(165);
    obj.NnpoQ3:setWidth(120);
    obj.NnpoQ3:setHeight(106);
    obj.NnpoQ3:setVisible(false);

    obj.NnpoQ4 = GUI.fromHandle(_obj_newObject("image"));
    obj.NnpoQ4:setParent(obj.NnpoQNave);
    obj.NnpoQ4:setName("NnpoQ4");
    obj.NnpoQ4:setSRC("/Naves/N/4 - NnpoQ/4.png");
    obj.NnpoQ4:setLeft(500);
    obj.NnpoQ4:setTop(165);
    obj.NnpoQ4:setWidth(120);
    obj.NnpoQ4:setHeight(104);
    obj.NnpoQ4:setVisible(false);

    obj.NnpoQ5 = GUI.fromHandle(_obj_newObject("image"));
    obj.NnpoQ5:setParent(obj.NnpoQNave);
    obj.NnpoQ5:setName("NnpoQ5");
    obj.NnpoQ5:setSRC("/Naves/N/4 - NnpoQ/5.png");
    obj.NnpoQ5:setLeft(500);
    obj.NnpoQ5:setTop(165);
    obj.NnpoQ5:setWidth(100);
    obj.NnpoQ5:setHeight(104);
    obj.NnpoQ5:setVisible(false);

    obj.NnpoQ6 = GUI.fromHandle(_obj_newObject("image"));
    obj.NnpoQ6:setParent(obj.NnpoQNave);
    obj.NnpoQ6:setName("NnpoQ6");
    obj.NnpoQ6:setSRC("/Naves/N/4 - NnpoQ/6.png");
    obj.NnpoQ6:setLeft(500);
    obj.NnpoQ6:setTop(165);
    obj.NnpoQ6:setWidth(95);
    obj.NnpoQ6:setHeight(104);
    obj.NnpoQ6:setVisible(false);

    obj.NnpoQ7 = GUI.fromHandle(_obj_newObject("image"));
    obj.NnpoQ7:setParent(obj.NnpoQNave);
    obj.NnpoQ7:setName("NnpoQ7");
    obj.NnpoQ7:setSRC("/Naves/N/4 - NnpoQ/7.png");
    obj.NnpoQ7:setLeft(500);
    obj.NnpoQ7:setTop(165);
    obj.NnpoQ7:setWidth(100);
    obj.NnpoQ7:setHeight(120);
    obj.NnpoQ7:setVisible(false);

    obj.NnpoQ8 = GUI.fromHandle(_obj_newObject("image"));
    obj.NnpoQ8:setParent(obj.NnpoQNave);
    obj.NnpoQ8:setName("NnpoQ8");
    obj.NnpoQ8:setSRC("/Naves/N/4 - NnpoQ/8.png");
    obj.NnpoQ8:setLeft(500);
    obj.NnpoQ8:setTop(165);
    obj.NnpoQ8:setWidth(100);
    obj.NnpoQ8:setHeight(120);
    obj.NnpoQ8:setVisible(false);

    obj.model20 = GUI.fromHandle(_obj_newObject("label"));
    obj.model20:setParent(obj.NnpoQNave);
    obj.model20:setName("model20");
    obj.model20:setLeft(153.13);
    obj.model20:setTop(95.50);
    obj.model20:setWidth(173.63);
    obj.model20:setHeight(47.25);
    obj.model20:setHorzTextAlign("center");
    obj.model20:setFontSize(30);
    lfm_setPropAsString(obj.model20, "fontStyle",  "bold");
    obj.model20:setText("NnpoQ");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.NnpoQNave);
    obj.edit58:setField("nomeNave20");
    obj.edit58:setLeft(153.12);
    obj.edit58:setTop(149.50);
    obj.edit58:setWidth(173.62);
    obj.edit58:setHeight(47.25);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(30);
    lfm_setPropAsString(obj.edit58, "fontStyle",  "bold");
    obj.edit58:setTransparent(true);
    obj.edit58:setName("edit58");

    obj.textEditor39 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor39:setParent(obj.NnpoQNave);
    obj.textEditor39:setField("Textoanotacao37");
    obj.textEditor39:setLeft(334.25);
    obj.textEditor39:setTop(276.25);
    obj.textEditor39:setWidth(222);
    obj.textEditor39:setHeight(111);
    obj.textEditor39:setTransparent(true);
    obj.textEditor39:setName("textEditor39");

    obj.textEditor40 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor40:setParent(obj.NnpoQNave);
    obj.textEditor40:setField("Textoanotacao38");
    obj.textEditor40:setLeft(558.25);
    obj.textEditor40:setTop(276.25);
    obj.textEditor40:setWidth(229);
    obj.textEditor40:setHeight(111);
    obj.textEditor40:setTransparent(true);
    obj.textEditor40:setName("textEditor40");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.NnpoQNave);
    obj.label20:setField("nivelNave20");
    obj.label20:setLeft(153.12);
    obj.label20:setTop(203.50);
    obj.label20:setWidth(173.62);
    obj.label20:setHeight(47.25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setFontSize(30);
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setText("0");
    obj.label20:setHitTest(true);
    obj.label20:setName("label20");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.NnpoQNave);
    obj.button20:setText("UP");
    lfm_setPropAsString(obj.button20, "fontStyle",  "bold");
    obj.button20:setFontColor("yellow");
    obj.button20:setLeft(148.75);
    obj.button20:setTop(265.50);
    obj.button20:setWidth(30);
    obj.button20:setHeight(27);
    obj.button20:setName("button20");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.NnpoQNave);
    obj.layout20:setLeft(1);
    obj.layout20:setTop(1);
    obj.layout20:setWidth(250);
    obj.layout20:setHeight(222);
    obj.layout20:setAlign("client");
    obj.layout20:setName("layout20");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout20);
    obj.edit59:setType("number");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setLeft(519);
    obj.edit59:setTop(112);
    obj.edit59:setWidth(25);
    obj.edit59:setHeight(25);
    obj.edit59:setField("minMin20");
    obj.edit59:setName("edit59");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout20);
    obj.dataLink36:setField("minMin20");
    obj.dataLink36:setName("dataLink36");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout20);
    obj.edit60:setType("number");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setLeft(548);
    obj.edit60:setTop(112);
    obj.edit60:setWidth(25);
    obj.edit60:setHeight(25);
    obj.edit60:setField("maxMin20");
    obj.edit60:setName("edit60");

    obj.progressBar20 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar20:setParent(obj.layout20);
    obj.progressBar20:setLeft(495);
    obj.progressBar20:setTop(138);
    obj.progressBar20:setWidth(105);
    obj.progressBar20:setHeight(20.50);
    obj.progressBar20:setColor("red");
    obj.progressBar20:setHitTest(true);
    obj.progressBar20:setMax(1);
    obj.progressBar20:setField("usosMin20");
    obj.progressBar20:setName("progressBar20");

    obj.Nah3Nave = GUI.fromHandle(_obj_newObject("layout"));
    obj.Nah3Nave:setParent(obj.Lnave3);
    obj.Nah3Nave:setName("Nah3Nave");
    obj.Nah3Nave:setAlign("client");
    obj.Nah3Nave:setVisible(false);

    obj.image163 = GUI.fromHandle(_obj_newObject("image"));
    obj.image163:setParent(obj.Nah3Nave);
    obj.image163:setSRC("/imagens/fundo.png");
    obj.image163:setLeft(333);
    obj.image163:setTop(62);
    obj.image163:setWidth(452);
    obj.image163:setHeight(323);
    obj.image163:setName("image163");

    obj.image164 = GUI.fromHandle(_obj_newObject("image"));
    obj.image164:setParent(obj.Nah3Nave);
    obj.image164:setSRC("/imagens/CirculoNave.png");
    obj.image164:setWidth(459);
    obj.image164:setHeight(330);
    obj.image164:setLeft(330.50);
    obj.image164:setTop(60);
    obj.image164:setName("image164");

    obj.image165 = GUI.fromHandle(_obj_newObject("image"));
    obj.image165:setParent(obj.Nah3Nave);
    obj.image165:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image165:setLeft(50);
    obj.image165:setTop(94);
    obj.image165:setWidth(279);
    obj.image165:setHeight(54);
    obj.image165:setName("image165");

    obj.image166 = GUI.fromHandle(_obj_newObject("image"));
    obj.image166:setParent(obj.Nah3Nave);
    obj.image166:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image166:setLeft(50);
    obj.image166:setTop(148);
    obj.image166:setWidth(279);
    obj.image166:setHeight(54);
    obj.image166:setName("image166");

    obj.image167 = GUI.fromHandle(_obj_newObject("image"));
    obj.image167:setParent(obj.Nah3Nave);
    obj.image167:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image167:setLeft(50);
    obj.image167:setTop(201);
    obj.image167:setWidth(279);
    obj.image167:setHeight(54);
    obj.image167:setName("image167");

    obj.image168 = GUI.fromHandle(_obj_newObject("image"));
    obj.image168:setParent(obj.Nah3Nave);
    obj.image168:setSRC("/imagens/model.png");
    obj.image168:setLeft(59);
    obj.image168:setTop(110);
    obj.image168:setWidth(91);
    obj.image168:setHeight(19);
    obj.image168:setName("image168");

    obj.image169 = GUI.fromHandle(_obj_newObject("image"));
    obj.image169:setParent(obj.Nah3Nave);
    obj.image169:setSRC("/imagens/nome.png");
    obj.image169:setLeft(59);
    obj.image169:setTop(168);
    obj.image169:setWidth(74);
    obj.image169:setHeight(19);
    obj.image169:setName("image169");

    obj.image170 = GUI.fromHandle(_obj_newObject("image"));
    obj.image170:setParent(obj.Nah3Nave);
    obj.image170:setSRC("/imagens/nivelNave.png");
    obj.image170:setLeft(59);
    obj.image170:setTop(216);
    obj.image170:setWidth(71);
    obj.image170:setHeight(25);
    obj.image170:setName("image170");

    obj.Nah31 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nah31:setParent(obj.Nah3Nave);
    obj.Nah31:setName("Nah31");
    obj.Nah31:setSRC("/Naves/N/5 - Nah3/1.png");
    obj.Nah31:setLeft(500);
    obj.Nah31:setTop(165);
    obj.Nah31:setWidth(95);
    obj.Nah31:setHeight(104);
    obj.Nah31:setVisible(false);

    obj.Nah32 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nah32:setParent(obj.Nah3Nave);
    obj.Nah32:setName("Nah32");
    obj.Nah32:setSRC("/Naves/N/5 - Nah3/2.png");
    obj.Nah32:setLeft(500);
    obj.Nah32:setTop(165);
    obj.Nah32:setWidth(120);
    obj.Nah32:setHeight(114);
    obj.Nah32:setVisible(false);

    obj.Nah33 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nah33:setParent(obj.Nah3Nave);
    obj.Nah33:setName("Nah33");
    obj.Nah33:setSRC("/Naves/N/5 - Nah3/3.png");
    obj.Nah33:setLeft(500);
    obj.Nah33:setTop(165);
    obj.Nah33:setWidth(120);
    obj.Nah33:setHeight(106);
    obj.Nah33:setVisible(false);

    obj.Nah34 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nah34:setParent(obj.Nah3Nave);
    obj.Nah34:setName("Nah34");
    obj.Nah34:setSRC("/Naves/N/5 - Nah3/4.png");
    obj.Nah34:setLeft(500);
    obj.Nah34:setTop(165);
    obj.Nah34:setWidth(120);
    obj.Nah34:setHeight(104);
    obj.Nah34:setVisible(false);

    obj.Nah35 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nah35:setParent(obj.Nah3Nave);
    obj.Nah35:setName("Nah35");
    obj.Nah35:setSRC("/Naves/N/5 - Nah3/5.png");
    obj.Nah35:setLeft(500);
    obj.Nah35:setTop(165);
    obj.Nah35:setWidth(100);
    obj.Nah35:setHeight(104);
    obj.Nah35:setVisible(false);

    obj.Nah36 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nah36:setParent(obj.Nah3Nave);
    obj.Nah36:setName("Nah36");
    obj.Nah36:setSRC("/Naves/N/5 - Nah3/6.png");
    obj.Nah36:setLeft(500);
    obj.Nah36:setTop(165);
    obj.Nah36:setWidth(95);
    obj.Nah36:setHeight(104);
    obj.Nah36:setVisible(false);

    obj.Nah37 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nah37:setParent(obj.Nah3Nave);
    obj.Nah37:setName("Nah37");
    obj.Nah37:setSRC("/Naves/N/5 - Nah3/7.png");
    obj.Nah37:setLeft(500);
    obj.Nah37:setTop(165);
    obj.Nah37:setWidth(100);
    obj.Nah37:setHeight(120);
    obj.Nah37:setVisible(false);

    obj.Nah38 = GUI.fromHandle(_obj_newObject("image"));
    obj.Nah38:setParent(obj.Nah3Nave);
    obj.Nah38:setName("Nah38");
    obj.Nah38:setSRC("/Naves/N/5 - Nah3/8.png");
    obj.Nah38:setLeft(500);
    obj.Nah38:setTop(165);
    obj.Nah38:setWidth(100);
    obj.Nah38:setHeight(120);
    obj.Nah38:setVisible(false);

    obj.model21 = GUI.fromHandle(_obj_newObject("label"));
    obj.model21:setParent(obj.Nah3Nave);
    obj.model21:setName("model21");
    obj.model21:setLeft(153.13);
    obj.model21:setTop(95.50);
    obj.model21:setWidth(173.63);
    obj.model21:setHeight(47.25);
    obj.model21:setHorzTextAlign("center");
    obj.model21:setFontSize(30);
    lfm_setPropAsString(obj.model21, "fontStyle",  "bold");
    obj.model21:setText("Nah3");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.Nah3Nave);
    obj.edit61:setField("nomeNave121");
    obj.edit61:setLeft(153.12);
    obj.edit61:setTop(149.50);
    obj.edit61:setWidth(173.62);
    obj.edit61:setHeight(47.25);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setFontSize(30);
    lfm_setPropAsString(obj.edit61, "fontStyle",  "bold");
    obj.edit61:setTransparent(true);
    obj.edit61:setName("edit61");

    obj.textEditor41 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor41:setParent(obj.Nah3Nave);
    obj.textEditor41:setField("Textoanotacao38");
    obj.textEditor41:setLeft(334.25);
    obj.textEditor41:setTop(276.25);
    obj.textEditor41:setWidth(222);
    obj.textEditor41:setHeight(111);
    obj.textEditor41:setTransparent(true);
    obj.textEditor41:setName("textEditor41");

    obj.textEditor42 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor42:setParent(obj.Nah3Nave);
    obj.textEditor42:setField("Textoanotacao39");
    obj.textEditor42:setLeft(558.25);
    obj.textEditor42:setTop(276.25);
    obj.textEditor42:setWidth(229);
    obj.textEditor42:setHeight(111);
    obj.textEditor42:setTransparent(true);
    obj.textEditor42:setName("textEditor42");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.Nah3Nave);
    obj.label21:setField("nivelNave21");
    obj.label21:setLeft(153.12);
    obj.label21:setTop(203.50);
    obj.label21:setWidth(173.62);
    obj.label21:setHeight(47.25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(30);
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setText("0");
    obj.label21:setHitTest(true);
    obj.label21:setName("label21");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.Nah3Nave);
    obj.button21:setText("UP");
    lfm_setPropAsString(obj.button21, "fontStyle",  "bold");
    obj.button21:setFontColor("yellow");
    obj.button21:setLeft(148.75);
    obj.button21:setTop(265.50);
    obj.button21:setWidth(30);
    obj.button21:setHeight(27);
    obj.button21:setName("button21");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.Nah3Nave);
    obj.layout21:setLeft(1);
    obj.layout21:setTop(1);
    obj.layout21:setWidth(250);
    obj.layout21:setHeight(222);
    obj.layout21:setAlign("client");
    obj.layout21:setName("layout21");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout21);
    obj.edit62:setType("number");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setLeft(519);
    obj.edit62:setTop(112);
    obj.edit62:setWidth(25);
    obj.edit62:setHeight(25);
    obj.edit62:setField("minMin21");
    obj.edit62:setName("edit62");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout21);
    obj.dataLink37:setField("minMin21");
    obj.dataLink37:setName("dataLink37");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout21);
    obj.edit63:setType("number");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setLeft(548);
    obj.edit63:setTop(112);
    obj.edit63:setWidth(25);
    obj.edit63:setHeight(25);
    obj.edit63:setField("maxMin21");
    obj.edit63:setName("edit63");

    obj.progressBar21 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar21:setParent(obj.layout21);
    obj.progressBar21:setLeft(495);
    obj.progressBar21:setTop(138);
    obj.progressBar21:setWidth(105);
    obj.progressBar21:setHeight(20.50);
    obj.progressBar21:setColor("red");
    obj.progressBar21:setHitTest(true);
    obj.progressBar21:setMax(1);
    obj.progressBar21:setField("usosMin21");
    obj.progressBar21:setName("progressBar21");

    obj.NkLNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.NkLNave:setParent(obj.Lnave3);
    obj.NkLNave:setName("NkLNave");
    obj.NkLNave:setAlign("client");
    obj.NkLNave:setVisible(false);

    obj.image171 = GUI.fromHandle(_obj_newObject("image"));
    obj.image171:setParent(obj.NkLNave);
    obj.image171:setSRC("/imagens/fundo.png");
    obj.image171:setLeft(333);
    obj.image171:setTop(62);
    obj.image171:setWidth(452);
    obj.image171:setHeight(323);
    obj.image171:setName("image171");

    obj.image172 = GUI.fromHandle(_obj_newObject("image"));
    obj.image172:setParent(obj.NkLNave);
    obj.image172:setSRC("/imagens/CirculoNave.png");
    obj.image172:setWidth(459);
    obj.image172:setHeight(330);
    obj.image172:setLeft(330.50);
    obj.image172:setTop(60);
    obj.image172:setName("image172");

    obj.image173 = GUI.fromHandle(_obj_newObject("image"));
    obj.image173:setParent(obj.NkLNave);
    obj.image173:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image173:setLeft(50);
    obj.image173:setTop(94);
    obj.image173:setWidth(279);
    obj.image173:setHeight(54);
    obj.image173:setName("image173");

    obj.image174 = GUI.fromHandle(_obj_newObject("image"));
    obj.image174:setParent(obj.NkLNave);
    obj.image174:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image174:setLeft(50);
    obj.image174:setTop(148);
    obj.image174:setWidth(279);
    obj.image174:setHeight(54);
    obj.image174:setName("image174");

    obj.image175 = GUI.fromHandle(_obj_newObject("image"));
    obj.image175:setParent(obj.NkLNave);
    obj.image175:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image175:setLeft(50);
    obj.image175:setTop(201);
    obj.image175:setWidth(279);
    obj.image175:setHeight(54);
    obj.image175:setName("image175");

    obj.image176 = GUI.fromHandle(_obj_newObject("image"));
    obj.image176:setParent(obj.NkLNave);
    obj.image176:setSRC("/imagens/model.png");
    obj.image176:setLeft(59);
    obj.image176:setTop(110);
    obj.image176:setWidth(91);
    obj.image176:setHeight(19);
    obj.image176:setName("image176");

    obj.image177 = GUI.fromHandle(_obj_newObject("image"));
    obj.image177:setParent(obj.NkLNave);
    obj.image177:setSRC("/imagens/nome.png");
    obj.image177:setLeft(59);
    obj.image177:setTop(168);
    obj.image177:setWidth(74);
    obj.image177:setHeight(19);
    obj.image177:setName("image177");

    obj.image178 = GUI.fromHandle(_obj_newObject("image"));
    obj.image178:setParent(obj.NkLNave);
    obj.image178:setSRC("/imagens/nivelNave.png");
    obj.image178:setLeft(59);
    obj.image178:setTop(216);
    obj.image178:setWidth(71);
    obj.image178:setHeight(25);
    obj.image178:setName("image178");

    obj.NkL1 = GUI.fromHandle(_obj_newObject("image"));
    obj.NkL1:setParent(obj.NkLNave);
    obj.NkL1:setName("NkL1");
    obj.NkL1:setSRC("/Naves/N/6 - NkL/1.png");
    obj.NkL1:setLeft(500);
    obj.NkL1:setTop(165);
    obj.NkL1:setWidth(95);
    obj.NkL1:setHeight(104);
    obj.NkL1:setVisible(false);

    obj.NkL2 = GUI.fromHandle(_obj_newObject("image"));
    obj.NkL2:setParent(obj.NkLNave);
    obj.NkL2:setName("NkL2");
    obj.NkL2:setSRC("/Naves/N/6 - NkL/2.png");
    obj.NkL2:setLeft(500);
    obj.NkL2:setTop(165);
    obj.NkL2:setWidth(120);
    obj.NkL2:setHeight(114);
    obj.NkL2:setVisible(false);

    obj.NkL3 = GUI.fromHandle(_obj_newObject("image"));
    obj.NkL3:setParent(obj.NkLNave);
    obj.NkL3:setName("NkL3");
    obj.NkL3:setSRC("/Naves/N/6 - NkL/3.png");
    obj.NkL3:setLeft(500);
    obj.NkL3:setTop(165);
    obj.NkL3:setWidth(120);
    obj.NkL3:setHeight(106);
    obj.NkL3:setVisible(false);

    obj.NkL4 = GUI.fromHandle(_obj_newObject("image"));
    obj.NkL4:setParent(obj.NkLNave);
    obj.NkL4:setName("NkL4");
    obj.NkL4:setSRC("/Naves/N/6 - NkL/4.png");
    obj.NkL4:setLeft(500);
    obj.NkL4:setTop(165);
    obj.NkL4:setWidth(120);
    obj.NkL4:setHeight(104);
    obj.NkL4:setVisible(false);

    obj.NkL5 = GUI.fromHandle(_obj_newObject("image"));
    obj.NkL5:setParent(obj.NkLNave);
    obj.NkL5:setName("NkL5");
    obj.NkL5:setSRC("/Naves/N/6 - NkL/5.png");
    obj.NkL5:setLeft(500);
    obj.NkL5:setTop(165);
    obj.NkL5:setWidth(100);
    obj.NkL5:setHeight(104);
    obj.NkL5:setVisible(false);

    obj.NkL6 = GUI.fromHandle(_obj_newObject("image"));
    obj.NkL6:setParent(obj.NkLNave);
    obj.NkL6:setName("NkL6");
    obj.NkL6:setSRC("/Naves/N/6 - NkL/6.png");
    obj.NkL6:setLeft(500);
    obj.NkL6:setTop(165);
    obj.NkL6:setWidth(95);
    obj.NkL6:setHeight(104);
    obj.NkL6:setVisible(false);

    obj.NkL7 = GUI.fromHandle(_obj_newObject("image"));
    obj.NkL7:setParent(obj.NkLNave);
    obj.NkL7:setName("NkL7");
    obj.NkL7:setSRC("/Naves/N/6 - NkL/7.png");
    obj.NkL7:setLeft(500);
    obj.NkL7:setTop(165);
    obj.NkL7:setWidth(100);
    obj.NkL7:setHeight(120);
    obj.NkL7:setVisible(false);

    obj.NkL8 = GUI.fromHandle(_obj_newObject("image"));
    obj.NkL8:setParent(obj.NkLNave);
    obj.NkL8:setName("NkL8");
    obj.NkL8:setSRC("/Naves/N/6 - NkL/8.png");
    obj.NkL8:setLeft(500);
    obj.NkL8:setTop(165);
    obj.NkL8:setWidth(100);
    obj.NkL8:setHeight(120);
    obj.NkL8:setVisible(false);

    obj.model22 = GUI.fromHandle(_obj_newObject("label"));
    obj.model22:setParent(obj.NkLNave);
    obj.model22:setName("model22");
    obj.model22:setLeft(153.13);
    obj.model22:setTop(95.50);
    obj.model22:setWidth(173.63);
    obj.model22:setHeight(47.25);
    obj.model22:setHorzTextAlign("center");
    obj.model22:setFontSize(30);
    lfm_setPropAsString(obj.model22, "fontStyle",  "bold");
    obj.model22:setText("NkL");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.NkLNave);
    obj.edit64:setField("nomeNave22");
    obj.edit64:setLeft(153.12);
    obj.edit64:setTop(149.50);
    obj.edit64:setWidth(173.62);
    obj.edit64:setHeight(47.25);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setFontSize(30);
    lfm_setPropAsString(obj.edit64, "fontStyle",  "bold");
    obj.edit64:setTransparent(true);
    obj.edit64:setName("edit64");

    obj.textEditor43 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor43:setParent(obj.NkLNave);
    obj.textEditor43:setField("Textoanotacao40");
    obj.textEditor43:setLeft(334.25);
    obj.textEditor43:setTop(276.25);
    obj.textEditor43:setWidth(222);
    obj.textEditor43:setHeight(111);
    obj.textEditor43:setTransparent(true);
    obj.textEditor43:setName("textEditor43");

    obj.textEditor44 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor44:setParent(obj.NkLNave);
    obj.textEditor44:setField("Textoanotacao41");
    obj.textEditor44:setLeft(558.25);
    obj.textEditor44:setTop(276.25);
    obj.textEditor44:setWidth(229);
    obj.textEditor44:setHeight(111);
    obj.textEditor44:setTransparent(true);
    obj.textEditor44:setName("textEditor44");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.NkLNave);
    obj.label22:setField("nivelNave22");
    obj.label22:setLeft(153.12);
    obj.label22:setTop(203.50);
    obj.label22:setWidth(173.62);
    obj.label22:setHeight(47.25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontSize(30);
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setText("0");
    obj.label22:setHitTest(true);
    obj.label22:setName("label22");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.NkLNave);
    obj.button22:setText("UP");
    lfm_setPropAsString(obj.button22, "fontStyle",  "bold");
    obj.button22:setFontColor("yellow");
    obj.button22:setLeft(148.75);
    obj.button22:setTop(265.50);
    obj.button22:setWidth(30);
    obj.button22:setHeight(27);
    obj.button22:setName("button22");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.NkLNave);
    obj.layout22:setLeft(1);
    obj.layout22:setTop(1);
    obj.layout22:setWidth(250);
    obj.layout22:setHeight(222);
    obj.layout22:setAlign("client");
    obj.layout22:setName("layout22");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout22);
    obj.edit65:setType("number");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setLeft(519);
    obj.edit65:setTop(112);
    obj.edit65:setWidth(25);
    obj.edit65:setHeight(25);
    obj.edit65:setField("minMin22");
    obj.edit65:setName("edit65");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout22);
    obj.dataLink38:setField("minMin22");
    obj.dataLink38:setName("dataLink38");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout22);
    obj.edit66:setType("number");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setLeft(548);
    obj.edit66:setTop(112);
    obj.edit66:setWidth(25);
    obj.edit66:setHeight(25);
    obj.edit66:setField("maxMin22");
    obj.edit66:setName("edit66");

    obj.progressBar22 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar22:setParent(obj.layout22);
    obj.progressBar22:setLeft(495);
    obj.progressBar22:setTop(138);
    obj.progressBar22:setWidth(105);
    obj.progressBar22:setHeight(20.50);
    obj.progressBar22:setColor("red");
    obj.progressBar22:setHitTest(true);
    obj.progressBar22:setMax(1);
    obj.progressBar22:setField("usosMin22");
    obj.progressBar22:setName("progressBar22");

    obj.NopQNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.NopQNave:setParent(obj.Lnave3);
    obj.NopQNave:setName("NopQNave");
    obj.NopQNave:setAlign("client");
    obj.NopQNave:setVisible(false);

    obj.image179 = GUI.fromHandle(_obj_newObject("image"));
    obj.image179:setParent(obj.NopQNave);
    obj.image179:setSRC("/imagens/fundo.png");
    obj.image179:setLeft(333);
    obj.image179:setTop(62);
    obj.image179:setWidth(452);
    obj.image179:setHeight(323);
    obj.image179:setName("image179");

    obj.image180 = GUI.fromHandle(_obj_newObject("image"));
    obj.image180:setParent(obj.NopQNave);
    obj.image180:setSRC("/imagens/CirculoNave.png");
    obj.image180:setWidth(459);
    obj.image180:setHeight(330);
    obj.image180:setLeft(330.50);
    obj.image180:setTop(60);
    obj.image180:setName("image180");

    obj.image181 = GUI.fromHandle(_obj_newObject("image"));
    obj.image181:setParent(obj.NopQNave);
    obj.image181:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image181:setLeft(50);
    obj.image181:setTop(94);
    obj.image181:setWidth(279);
    obj.image181:setHeight(54);
    obj.image181:setName("image181");

    obj.image182 = GUI.fromHandle(_obj_newObject("image"));
    obj.image182:setParent(obj.NopQNave);
    obj.image182:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image182:setLeft(50);
    obj.image182:setTop(148);
    obj.image182:setWidth(279);
    obj.image182:setHeight(54);
    obj.image182:setName("image182");

    obj.image183 = GUI.fromHandle(_obj_newObject("image"));
    obj.image183:setParent(obj.NopQNave);
    obj.image183:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image183:setLeft(50);
    obj.image183:setTop(201);
    obj.image183:setWidth(279);
    obj.image183:setHeight(54);
    obj.image183:setName("image183");

    obj.image184 = GUI.fromHandle(_obj_newObject("image"));
    obj.image184:setParent(obj.NopQNave);
    obj.image184:setSRC("/imagens/model.png");
    obj.image184:setLeft(59);
    obj.image184:setTop(110);
    obj.image184:setWidth(91);
    obj.image184:setHeight(19);
    obj.image184:setName("image184");

    obj.image185 = GUI.fromHandle(_obj_newObject("image"));
    obj.image185:setParent(obj.NopQNave);
    obj.image185:setSRC("/imagens/nome.png");
    obj.image185:setLeft(59);
    obj.image185:setTop(168);
    obj.image185:setWidth(74);
    obj.image185:setHeight(19);
    obj.image185:setName("image185");

    obj.image186 = GUI.fromHandle(_obj_newObject("image"));
    obj.image186:setParent(obj.NopQNave);
    obj.image186:setSRC("/imagens/nivelNave.png");
    obj.image186:setLeft(59);
    obj.image186:setTop(216);
    obj.image186:setWidth(71);
    obj.image186:setHeight(25);
    obj.image186:setName("image186");

    obj.NopQ1 = GUI.fromHandle(_obj_newObject("image"));
    obj.NopQ1:setParent(obj.NopQNave);
    obj.NopQ1:setName("NopQ1");
    obj.NopQ1:setSRC("/Naves/N/7 - NopQ/1.png");
    obj.NopQ1:setLeft(500);
    obj.NopQ1:setTop(165);
    obj.NopQ1:setWidth(95);
    obj.NopQ1:setHeight(104);
    obj.NopQ1:setVisible(false);

    obj.NopQ2 = GUI.fromHandle(_obj_newObject("image"));
    obj.NopQ2:setParent(obj.NopQNave);
    obj.NopQ2:setName("NopQ2");
    obj.NopQ2:setSRC("/Naves/N/7 - NopQ/2.png");
    obj.NopQ2:setLeft(500);
    obj.NopQ2:setTop(165);
    obj.NopQ2:setWidth(120);
    obj.NopQ2:setHeight(114);
    obj.NopQ2:setVisible(false);

    obj.NopQ3 = GUI.fromHandle(_obj_newObject("image"));
    obj.NopQ3:setParent(obj.NopQNave);
    obj.NopQ3:setName("NopQ3");
    obj.NopQ3:setSRC("/Naves/N/7 - NopQ/3.png");
    obj.NopQ3:setLeft(500);
    obj.NopQ3:setTop(165);
    obj.NopQ3:setWidth(120);
    obj.NopQ3:setHeight(106);
    obj.NopQ3:setVisible(false);

    obj.NopQ4 = GUI.fromHandle(_obj_newObject("image"));
    obj.NopQ4:setParent(obj.NopQNave);
    obj.NopQ4:setName("NopQ4");
    obj.NopQ4:setSRC("/Naves/N/7 - NopQ/4.png");
    obj.NopQ4:setLeft(500);
    obj.NopQ4:setTop(165);
    obj.NopQ4:setWidth(120);
    obj.NopQ4:setHeight(104);
    obj.NopQ4:setVisible(false);

    obj.NopQ5 = GUI.fromHandle(_obj_newObject("image"));
    obj.NopQ5:setParent(obj.NopQNave);
    obj.NopQ5:setName("NopQ5");
    obj.NopQ5:setSRC("/Naves/N/7 - NopQ/5.png");
    obj.NopQ5:setLeft(500);
    obj.NopQ5:setTop(165);
    obj.NopQ5:setWidth(100);
    obj.NopQ5:setHeight(104);
    obj.NopQ5:setVisible(false);

    obj.NopQ6 = GUI.fromHandle(_obj_newObject("image"));
    obj.NopQ6:setParent(obj.NopQNave);
    obj.NopQ6:setName("NopQ6");
    obj.NopQ6:setSRC("/Naves/N/7 - NopQ/6.png");
    obj.NopQ6:setLeft(500);
    obj.NopQ6:setTop(165);
    obj.NopQ6:setWidth(95);
    obj.NopQ6:setHeight(104);
    obj.NopQ6:setVisible(false);

    obj.NopQ7 = GUI.fromHandle(_obj_newObject("image"));
    obj.NopQ7:setParent(obj.NopQNave);
    obj.NopQ7:setName("NopQ7");
    obj.NopQ7:setSRC("/Naves/N/7 - NopQ/7.png");
    obj.NopQ7:setLeft(500);
    obj.NopQ7:setTop(165);
    obj.NopQ7:setWidth(100);
    obj.NopQ7:setHeight(120);
    obj.NopQ7:setVisible(false);

    obj.NopQ8 = GUI.fromHandle(_obj_newObject("image"));
    obj.NopQ8:setParent(obj.NopQNave);
    obj.NopQ8:setName("NopQ8");
    obj.NopQ8:setSRC("/Naves/N/7 - NopQ/8.png");
    obj.NopQ8:setLeft(500);
    obj.NopQ8:setTop(165);
    obj.NopQ8:setWidth(100);
    obj.NopQ8:setHeight(120);
    obj.NopQ8:setVisible(false);

    obj.model23 = GUI.fromHandle(_obj_newObject("label"));
    obj.model23:setParent(obj.NopQNave);
    obj.model23:setName("model23");
    obj.model23:setLeft(153.13);
    obj.model23:setTop(95.50);
    obj.model23:setWidth(173.63);
    obj.model23:setHeight(47.25);
    obj.model23:setHorzTextAlign("center");
    obj.model23:setFontSize(30);
    lfm_setPropAsString(obj.model23, "fontStyle",  "bold");
    obj.model23:setText("NopQ");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.NopQNave);
    obj.edit67:setField("nomeNave23");
    obj.edit67:setLeft(153.12);
    obj.edit67:setTop(149.50);
    obj.edit67:setWidth(173.62);
    obj.edit67:setHeight(47.25);
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setFontSize(30);
    lfm_setPropAsString(obj.edit67, "fontStyle",  "bold");
    obj.edit67:setTransparent(true);
    obj.edit67:setName("edit67");

    obj.textEditor45 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor45:setParent(obj.NopQNave);
    obj.textEditor45:setField("Textoanotacao42");
    obj.textEditor45:setLeft(334.25);
    obj.textEditor45:setTop(276.25);
    obj.textEditor45:setWidth(222);
    obj.textEditor45:setHeight(111);
    obj.textEditor45:setTransparent(true);
    obj.textEditor45:setName("textEditor45");

    obj.textEditor46 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor46:setParent(obj.NopQNave);
    obj.textEditor46:setField("Textoanotacao43");
    obj.textEditor46:setLeft(558.25);
    obj.textEditor46:setTop(276.25);
    obj.textEditor46:setWidth(229);
    obj.textEditor46:setHeight(111);
    obj.textEditor46:setTransparent(true);
    obj.textEditor46:setName("textEditor46");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.NopQNave);
    obj.label23:setField("nivelNave23");
    obj.label23:setLeft(153.12);
    obj.label23:setTop(203.50);
    obj.label23:setWidth(173.62);
    obj.label23:setHeight(47.25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(30);
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setText("0");
    obj.label23:setHitTest(true);
    obj.label23:setName("label23");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.NopQNave);
    obj.button23:setText("UP");
    lfm_setPropAsString(obj.button23, "fontStyle",  "bold");
    obj.button23:setFontColor("yellow");
    obj.button23:setLeft(148.75);
    obj.button23:setTop(265.50);
    obj.button23:setWidth(30);
    obj.button23:setHeight(27);
    obj.button23:setName("button23");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.NopQNave);
    obj.layout23:setLeft(1);
    obj.layout23:setTop(1);
    obj.layout23:setWidth(250);
    obj.layout23:setHeight(222);
    obj.layout23:setAlign("client");
    obj.layout23:setName("layout23");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout23);
    obj.edit68:setType("number");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setLeft(519);
    obj.edit68:setTop(112);
    obj.edit68:setWidth(25);
    obj.edit68:setHeight(25);
    obj.edit68:setField("minMin23");
    obj.edit68:setName("edit68");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout23);
    obj.dataLink39:setField("minMin23");
    obj.dataLink39:setName("dataLink39");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout23);
    obj.edit69:setType("number");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setLeft(548);
    obj.edit69:setTop(112);
    obj.edit69:setWidth(25);
    obj.edit69:setHeight(25);
    obj.edit69:setField("maxMin23");
    obj.edit69:setName("edit69");

    obj.progressBar23 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar23:setParent(obj.layout23);
    obj.progressBar23:setLeft(495);
    obj.progressBar23:setTop(138);
    obj.progressBar23:setWidth(105);
    obj.progressBar23:setHeight(20.50);
    obj.progressBar23:setColor("red");
    obj.progressBar23:setHitTest(true);
    obj.progressBar23:setMax(1);
    obj.progressBar23:setField("usosMin23");
    obj.progressBar23:setName("progressBar23");

    obj.n2NNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.n2NNave:setParent(obj.Lnave3);
    obj.n2NNave:setName("n2NNave");
    obj.n2NNave:setAlign("client");
    obj.n2NNave:setVisible(false);

    obj.image187 = GUI.fromHandle(_obj_newObject("image"));
    obj.image187:setParent(obj.n2NNave);
    obj.image187:setSRC("/imagens/fundo.png");
    obj.image187:setLeft(333);
    obj.image187:setTop(62);
    obj.image187:setWidth(452);
    obj.image187:setHeight(323);
    obj.image187:setName("image187");

    obj.image188 = GUI.fromHandle(_obj_newObject("image"));
    obj.image188:setParent(obj.n2NNave);
    obj.image188:setSRC("/imagens/CirculoNave.png");
    obj.image188:setWidth(459);
    obj.image188:setHeight(330);
    obj.image188:setLeft(330.50);
    obj.image188:setTop(60);
    obj.image188:setName("image188");

    obj.image189 = GUI.fromHandle(_obj_newObject("image"));
    obj.image189:setParent(obj.n2NNave);
    obj.image189:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image189:setLeft(50);
    obj.image189:setTop(94);
    obj.image189:setWidth(279);
    obj.image189:setHeight(54);
    obj.image189:setName("image189");

    obj.image190 = GUI.fromHandle(_obj_newObject("image"));
    obj.image190:setParent(obj.n2NNave);
    obj.image190:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image190:setLeft(50);
    obj.image190:setTop(148);
    obj.image190:setWidth(279);
    obj.image190:setHeight(54);
    obj.image190:setName("image190");

    obj.image191 = GUI.fromHandle(_obj_newObject("image"));
    obj.image191:setParent(obj.n2NNave);
    obj.image191:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image191:setLeft(50);
    obj.image191:setTop(201);
    obj.image191:setWidth(279);
    obj.image191:setHeight(54);
    obj.image191:setName("image191");

    obj.image192 = GUI.fromHandle(_obj_newObject("image"));
    obj.image192:setParent(obj.n2NNave);
    obj.image192:setSRC("/imagens/model.png");
    obj.image192:setLeft(59);
    obj.image192:setTop(110);
    obj.image192:setWidth(91);
    obj.image192:setHeight(19);
    obj.image192:setName("image192");

    obj.image193 = GUI.fromHandle(_obj_newObject("image"));
    obj.image193:setParent(obj.n2NNave);
    obj.image193:setSRC("/imagens/nome.png");
    obj.image193:setLeft(59);
    obj.image193:setTop(168);
    obj.image193:setWidth(74);
    obj.image193:setHeight(19);
    obj.image193:setName("image193");

    obj.image194 = GUI.fromHandle(_obj_newObject("image"));
    obj.image194:setParent(obj.n2NNave);
    obj.image194:setSRC("/imagens/nivelNave.png");
    obj.image194:setLeft(59);
    obj.image194:setTop(216);
    obj.image194:setWidth(71);
    obj.image194:setHeight(25);
    obj.image194:setName("image194");

    obj.n2N1 = GUI.fromHandle(_obj_newObject("image"));
    obj.n2N1:setParent(obj.n2NNave);
    obj.n2N1:setName("n2N1");
    obj.n2N1:setSRC("/Naves/N/8 - n2N/1.png");
    obj.n2N1:setLeft(500);
    obj.n2N1:setTop(165);
    obj.n2N1:setWidth(95);
    obj.n2N1:setHeight(104);
    obj.n2N1:setVisible(false);

    obj.n2N2 = GUI.fromHandle(_obj_newObject("image"));
    obj.n2N2:setParent(obj.n2NNave);
    obj.n2N2:setName("n2N2");
    obj.n2N2:setSRC("/Naves/N/8 - n2N/2.png");
    obj.n2N2:setLeft(500);
    obj.n2N2:setTop(165);
    obj.n2N2:setWidth(120);
    obj.n2N2:setHeight(114);
    obj.n2N2:setVisible(false);

    obj.n2N3 = GUI.fromHandle(_obj_newObject("image"));
    obj.n2N3:setParent(obj.n2NNave);
    obj.n2N3:setName("n2N3");
    obj.n2N3:setSRC("/Naves/N/8 - n2N/3.png");
    obj.n2N3:setLeft(500);
    obj.n2N3:setTop(165);
    obj.n2N3:setWidth(120);
    obj.n2N3:setHeight(106);
    obj.n2N3:setVisible(false);

    obj.n2N4 = GUI.fromHandle(_obj_newObject("image"));
    obj.n2N4:setParent(obj.n2NNave);
    obj.n2N4:setName("n2N4");
    obj.n2N4:setSRC("/Naves/N/8 - n2N/4.png");
    obj.n2N4:setLeft(500);
    obj.n2N4:setTop(165);
    obj.n2N4:setWidth(120);
    obj.n2N4:setHeight(104);
    obj.n2N4:setVisible(false);

    obj.n2N5 = GUI.fromHandle(_obj_newObject("image"));
    obj.n2N5:setParent(obj.n2NNave);
    obj.n2N5:setName("n2N5");
    obj.n2N5:setSRC("/Naves/N/8 - n2N/5.png");
    obj.n2N5:setLeft(500);
    obj.n2N5:setTop(165);
    obj.n2N5:setWidth(100);
    obj.n2N5:setHeight(104);
    obj.n2N5:setVisible(false);

    obj.n2N6 = GUI.fromHandle(_obj_newObject("image"));
    obj.n2N6:setParent(obj.n2NNave);
    obj.n2N6:setName("n2N6");
    obj.n2N6:setSRC("/Naves/N/8 - n2N/6.png");
    obj.n2N6:setLeft(500);
    obj.n2N6:setTop(165);
    obj.n2N6:setWidth(95);
    obj.n2N6:setHeight(104);
    obj.n2N6:setVisible(false);

    obj.n2N7 = GUI.fromHandle(_obj_newObject("image"));
    obj.n2N7:setParent(obj.n2NNave);
    obj.n2N7:setName("n2N7");
    obj.n2N7:setSRC("/Naves/N/8 - n2N/7.png");
    obj.n2N7:setLeft(500);
    obj.n2N7:setTop(165);
    obj.n2N7:setWidth(100);
    obj.n2N7:setHeight(120);
    obj.n2N7:setVisible(false);

    obj.n2N8 = GUI.fromHandle(_obj_newObject("image"));
    obj.n2N8:setParent(obj.n2NNave);
    obj.n2N8:setName("n2N8");
    obj.n2N8:setSRC("/Naves/N/8 - n2N/8.png");
    obj.n2N8:setLeft(500);
    obj.n2N8:setTop(165);
    obj.n2N8:setWidth(100);
    obj.n2N8:setHeight(120);
    obj.n2N8:setVisible(false);

    obj.model24 = GUI.fromHandle(_obj_newObject("label"));
    obj.model24:setParent(obj.n2NNave);
    obj.model24:setName("model24");
    obj.model24:setLeft(153.13);
    obj.model24:setTop(95.50);
    obj.model24:setWidth(173.63);
    obj.model24:setHeight(47.25);
    obj.model24:setHorzTextAlign("center");
    obj.model24:setFontSize(30);
    lfm_setPropAsString(obj.model24, "fontStyle",  "bold");
    obj.model24:setText("n2N");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.n2NNave);
    obj.edit70:setField("nomeNave24");
    obj.edit70:setLeft(153.12);
    obj.edit70:setTop(149.50);
    obj.edit70:setWidth(173.62);
    obj.edit70:setHeight(47.25);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setFontSize(30);
    lfm_setPropAsString(obj.edit70, "fontStyle",  "bold");
    obj.edit70:setTransparent(true);
    obj.edit70:setName("edit70");

    obj.textEditor47 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor47:setParent(obj.n2NNave);
    obj.textEditor47:setField("Textoanotacao44");
    obj.textEditor47:setLeft(334.25);
    obj.textEditor47:setTop(276.25);
    obj.textEditor47:setWidth(222);
    obj.textEditor47:setHeight(111);
    obj.textEditor47:setTransparent(true);
    obj.textEditor47:setName("textEditor47");

    obj.textEditor48 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor48:setParent(obj.n2NNave);
    obj.textEditor48:setField("Textoanotacao45");
    obj.textEditor48:setLeft(558.25);
    obj.textEditor48:setTop(276.25);
    obj.textEditor48:setWidth(229);
    obj.textEditor48:setHeight(111);
    obj.textEditor48:setTransparent(true);
    obj.textEditor48:setName("textEditor48");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.n2NNave);
    obj.label24:setField("nivelNave24");
    obj.label24:setLeft(153.12);
    obj.label24:setTop(203.50);
    obj.label24:setWidth(173.62);
    obj.label24:setHeight(47.25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontSize(30);
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setText("0");
    obj.label24:setHitTest(true);
    obj.label24:setName("label24");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.n2NNave);
    obj.button24:setText("UP");
    lfm_setPropAsString(obj.button24, "fontStyle",  "bold");
    obj.button24:setFontColor("yellow");
    obj.button24:setLeft(148.75);
    obj.button24:setTop(265.50);
    obj.button24:setWidth(30);
    obj.button24:setHeight(27);
    obj.button24:setName("button24");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.n2NNave);
    obj.layout24:setLeft(1);
    obj.layout24:setTop(1);
    obj.layout24:setWidth(250);
    obj.layout24:setHeight(222);
    obj.layout24:setAlign("client");
    obj.layout24:setName("layout24");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout24);
    obj.edit71:setType("number");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setLeft(519);
    obj.edit71:setTop(112);
    obj.edit71:setWidth(25);
    obj.edit71:setHeight(25);
    obj.edit71:setField("minMin24");
    obj.edit71:setName("edit71");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout24);
    obj.dataLink40:setField("minMin24");
    obj.dataLink40:setName("dataLink40");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout24);
    obj.edit72:setType("number");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setLeft(548);
    obj.edit72:setTop(112);
    obj.edit72:setWidth(25);
    obj.edit72:setHeight(25);
    obj.edit72:setField("maxMin24");
    obj.edit72:setName("edit72");

    obj.progressBar24 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar24:setParent(obj.layout24);
    obj.progressBar24:setLeft(495);
    obj.progressBar24:setTop(138);
    obj.progressBar24:setWidth(105);
    obj.progressBar24:setHeight(20.50);
    obj.progressBar24:setColor("red");
    obj.progressBar24:setHitTest(true);
    obj.progressBar24:setMax(1);
    obj.progressBar24:setField("usosMin24");
    obj.progressBar24:setName("progressBar24");

    obj.BotaoNaveN17 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN17:setParent(obj.Lnave3);
    obj.BotaoNaveN17:setName("BotaoNaveN17");
    obj.BotaoNaveN17:setText("Nko");
    obj.BotaoNaveN17:setLeft(63.75);
    obj.BotaoNaveN17:setTop(301);
    obj.BotaoNaveN17:setWidth(70.25);
    obj.BotaoNaveN17:setHeight(27);
    obj.BotaoNaveN17:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN17, "fontStyle",  "bold");

    obj.BotaoNaveN18 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN18:setParent(obj.Lnave3);
    obj.BotaoNaveN18:setName("BotaoNaveN18");
    obj.BotaoNaveN18:setText("Nnp");
    obj.BotaoNaveN18:setLeft(138);
    obj.BotaoNaveN18:setTop(301);
    obj.BotaoNaveN18:setWidth(70.25);
    obj.BotaoNaveN18:setHeight(27);
    obj.BotaoNaveN18:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN18, "fontStyle",  "bold");

    obj.BotaoNaveN19 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN19:setParent(obj.Lnave3);
    obj.BotaoNaveN19:setName("BotaoNaveN19");
    obj.BotaoNaveN19:setText("Ne3");
    obj.BotaoNaveN19:setLeft(213);
    obj.BotaoNaveN19:setTop(301);
    obj.BotaoNaveN19:setWidth(70.25);
    obj.BotaoNaveN19:setHeight(27);
    obj.BotaoNaveN19:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN19, "fontStyle",  "bold");

    obj.BotaoNaveN20 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN20:setParent(obj.Lnave3);
    obj.BotaoNaveN20:setName("BotaoNaveN20");
    obj.BotaoNaveN20:setText("NnpoQ");
    obj.BotaoNaveN20:setLeft(63.75);
    obj.BotaoNaveN20:setTop(333);
    obj.BotaoNaveN20:setWidth(70.25);
    obj.BotaoNaveN20:setHeight(27);
    obj.BotaoNaveN20:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN20, "fontStyle",  "bold");

    obj.BotaoNaveN21 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN21:setParent(obj.Lnave3);
    obj.BotaoNaveN21:setName("BotaoNaveN21");
    obj.BotaoNaveN21:setText("Nah3");
    obj.BotaoNaveN21:setLeft(138);
    obj.BotaoNaveN21:setTop(333);
    obj.BotaoNaveN21:setWidth(70.25);
    obj.BotaoNaveN21:setHeight(27);
    obj.BotaoNaveN21:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN21, "fontStyle",  "bold");

    obj.BotaoNaveN22 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN22:setParent(obj.Lnave3);
    obj.BotaoNaveN22:setName("BotaoNaveN22");
    obj.BotaoNaveN22:setText("NkL");
    obj.BotaoNaveN22:setLeft(213);
    obj.BotaoNaveN22:setTop(333);
    obj.BotaoNaveN22:setWidth(70.25);
    obj.BotaoNaveN22:setHeight(27);
    obj.BotaoNaveN22:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN22, "fontStyle",  "bold");

    obj.BotaoNaveN23 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN23:setParent(obj.Lnave3);
    obj.BotaoNaveN23:setName("BotaoNaveN23");
    obj.BotaoNaveN23:setText("NopQ");
    obj.BotaoNaveN23:setLeft(63.75);
    obj.BotaoNaveN23:setTop(365);
    obj.BotaoNaveN23:setWidth(70.25);
    obj.BotaoNaveN23:setHeight(27);
    obj.BotaoNaveN23:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN23, "fontStyle",  "bold");

    obj.BotaoNaveN24 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN24:setParent(obj.Lnave3);
    obj.BotaoNaveN24:setName("BotaoNaveN24");
    obj.BotaoNaveN24:setText("n2N");
    obj.BotaoNaveN24:setLeft(138);
    obj.BotaoNaveN24:setTop(365);
    obj.BotaoNaveN24:setWidth(70.25);
    obj.BotaoNaveN24:setHeight(27);
    obj.BotaoNaveN24:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN24, "fontStyle",  "bold");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.Lnave3);
    obj.dataLink41:setField("nivelNave17");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.Lnave3);
    obj.dataLink42:setField("nivelNave18");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.Lnave3);
    obj.dataLink43:setField("nivelNave19");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.Lnave3);
    obj.dataLink44:setField("nivelNave20");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.Lnave3);
    obj.dataLink45:setField("nivelNave21");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.Lnave3);
    obj.dataLink46:setField("nivelNave22");
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.Lnave3);
    obj.dataLink47:setField("nivelNave23");
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.Lnave3);
    obj.dataLink48:setField("nivelNave24");
    obj.dataLink48:setName("dataLink48");

    obj.Lnave4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Lnave4:setParent(obj.scrollBox1);
    obj.Lnave4:setName("Lnave4");
    obj.Lnave4:setAlign("client");
    obj.Lnave4:setVisible(false);

    obj.OxNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.OxNave:setParent(obj.Lnave4);
    obj.OxNave:setName("OxNave");
    obj.OxNave:setAlign("client");
    obj.OxNave:setVisible(false);

    obj.image195 = GUI.fromHandle(_obj_newObject("image"));
    obj.image195:setParent(obj.OxNave);
    obj.image195:setSRC("/imagens/fundo.png");
    obj.image195:setLeft(333);
    obj.image195:setTop(62);
    obj.image195:setWidth(452);
    obj.image195:setHeight(323);
    obj.image195:setName("image195");

    obj.image196 = GUI.fromHandle(_obj_newObject("image"));
    obj.image196:setParent(obj.OxNave);
    obj.image196:setSRC("/imagens/CirculoNave.png");
    obj.image196:setWidth(459);
    obj.image196:setHeight(330);
    obj.image196:setLeft(330.50);
    obj.image196:setTop(60);
    obj.image196:setName("image196");

    obj.image197 = GUI.fromHandle(_obj_newObject("image"));
    obj.image197:setParent(obj.OxNave);
    obj.image197:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image197:setLeft(50);
    obj.image197:setTop(94);
    obj.image197:setWidth(279);
    obj.image197:setHeight(54);
    obj.image197:setName("image197");

    obj.image198 = GUI.fromHandle(_obj_newObject("image"));
    obj.image198:setParent(obj.OxNave);
    obj.image198:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image198:setLeft(50);
    obj.image198:setTop(148);
    obj.image198:setWidth(279);
    obj.image198:setHeight(54);
    obj.image198:setName("image198");

    obj.image199 = GUI.fromHandle(_obj_newObject("image"));
    obj.image199:setParent(obj.OxNave);
    obj.image199:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image199:setLeft(50);
    obj.image199:setTop(201);
    obj.image199:setWidth(279);
    obj.image199:setHeight(54);
    obj.image199:setName("image199");

    obj.image200 = GUI.fromHandle(_obj_newObject("image"));
    obj.image200:setParent(obj.OxNave);
    obj.image200:setSRC("/imagens/model.png");
    obj.image200:setLeft(59);
    obj.image200:setTop(110);
    obj.image200:setWidth(91);
    obj.image200:setHeight(19);
    obj.image200:setName("image200");

    obj.image201 = GUI.fromHandle(_obj_newObject("image"));
    obj.image201:setParent(obj.OxNave);
    obj.image201:setSRC("/imagens/nome.png");
    obj.image201:setLeft(59);
    obj.image201:setTop(168);
    obj.image201:setWidth(74);
    obj.image201:setHeight(19);
    obj.image201:setName("image201");

    obj.image202 = GUI.fromHandle(_obj_newObject("image"));
    obj.image202:setParent(obj.OxNave);
    obj.image202:setSRC("/imagens/nivelNave.png");
    obj.image202:setLeft(59);
    obj.image202:setTop(216);
    obj.image202:setWidth(71);
    obj.image202:setHeight(25);
    obj.image202:setName("image202");

    obj.Ox1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox1:setParent(obj.OxNave);
    obj.Ox1:setName("Ox1");
    obj.Ox1:setSRC("/Naves/O/1 - Ox/1.png");
    obj.Ox1:setLeft(500);
    obj.Ox1:setTop(165);
    obj.Ox1:setWidth(95);
    obj.Ox1:setHeight(104);
    obj.Ox1:setVisible(false);

    obj.Ox2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox2:setParent(obj.OxNave);
    obj.Ox2:setName("Ox2");
    obj.Ox2:setSRC("/Naves/O/1 - Ox/2.png");
    obj.Ox2:setLeft(500);
    obj.Ox2:setTop(165);
    obj.Ox2:setWidth(120);
    obj.Ox2:setHeight(114);
    obj.Ox2:setVisible(false);

    obj.Ox3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox3:setParent(obj.OxNave);
    obj.Ox3:setName("Ox3");
    obj.Ox3:setSRC("/Naves/O/1 - Ox/3.png");
    obj.Ox3:setLeft(500);
    obj.Ox3:setTop(165);
    obj.Ox3:setWidth(120);
    obj.Ox3:setHeight(106);
    obj.Ox3:setVisible(false);

    obj.Ox4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox4:setParent(obj.OxNave);
    obj.Ox4:setName("Ox4");
    obj.Ox4:setSRC("/Naves/O/1 - Ox/4.png");
    obj.Ox4:setLeft(500);
    obj.Ox4:setTop(165);
    obj.Ox4:setWidth(120);
    obj.Ox4:setHeight(104);
    obj.Ox4:setVisible(false);

    obj.Ox5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox5:setParent(obj.OxNave);
    obj.Ox5:setName("Ox5");
    obj.Ox5:setSRC("/Naves/O/1 - Ox/5.png");
    obj.Ox5:setLeft(500);
    obj.Ox5:setTop(165);
    obj.Ox5:setWidth(100);
    obj.Ox5:setHeight(104);
    obj.Ox5:setVisible(false);

    obj.Ox6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox6:setParent(obj.OxNave);
    obj.Ox6:setName("Ox6");
    obj.Ox6:setSRC("/Naves/O/1 - Ox/6.png");
    obj.Ox6:setLeft(500);
    obj.Ox6:setTop(165);
    obj.Ox6:setWidth(95);
    obj.Ox6:setHeight(104);
    obj.Ox6:setVisible(false);

    obj.Ox7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox7:setParent(obj.OxNave);
    obj.Ox7:setName("Ox7");
    obj.Ox7:setSRC("/Naves/O/1 - Ox/7.png");
    obj.Ox7:setLeft(500);
    obj.Ox7:setTop(165);
    obj.Ox7:setWidth(100);
    obj.Ox7:setHeight(120);
    obj.Ox7:setVisible(false);

    obj.Ox8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox8:setParent(obj.OxNave);
    obj.Ox8:setName("Ox8");
    obj.Ox8:setSRC("/Naves/O/1 - Ox/8.png");
    obj.Ox8:setLeft(500);
    obj.Ox8:setTop(165);
    obj.Ox8:setWidth(100);
    obj.Ox8:setHeight(120);
    obj.Ox8:setVisible(false);

    obj.model25 = GUI.fromHandle(_obj_newObject("label"));
    obj.model25:setParent(obj.OxNave);
    obj.model25:setName("model25");
    obj.model25:setLeft(153.13);
    obj.model25:setTop(95.50);
    obj.model25:setWidth(173.63);
    obj.model25:setHeight(47.25);
    obj.model25:setHorzTextAlign("center");
    obj.model25:setFontSize(30);
    lfm_setPropAsString(obj.model25, "fontStyle",  "bold");
    obj.model25:setText("Ox");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.OxNave);
    obj.edit73:setField("nomeNave25");
    obj.edit73:setLeft(153.12);
    obj.edit73:setTop(149.50);
    obj.edit73:setWidth(173.62);
    obj.edit73:setHeight(47.25);
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setFontSize(30);
    lfm_setPropAsString(obj.edit73, "fontStyle",  "bold");
    obj.edit73:setTransparent(true);
    obj.edit73:setName("edit73");

    obj.textEditor49 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor49:setParent(obj.OxNave);
    obj.textEditor49:setField("Textoanotacao46");
    obj.textEditor49:setLeft(334.25);
    obj.textEditor49:setTop(276.25);
    obj.textEditor49:setWidth(222);
    obj.textEditor49:setHeight(111);
    obj.textEditor49:setTransparent(true);
    obj.textEditor49:setName("textEditor49");

    obj.textEditor50 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor50:setParent(obj.OxNave);
    obj.textEditor50:setField("Textoanotacao47");
    obj.textEditor50:setLeft(558.25);
    obj.textEditor50:setTop(276.25);
    obj.textEditor50:setWidth(229);
    obj.textEditor50:setHeight(111);
    obj.textEditor50:setTransparent(true);
    obj.textEditor50:setName("textEditor50");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.OxNave);
    obj.label25:setField("nivelNave25");
    obj.label25:setLeft(153.12);
    obj.label25:setTop(203.50);
    obj.label25:setWidth(173.62);
    obj.label25:setHeight(47.25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontSize(30);
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setHitTest(true);
    obj.label25:setName("label25");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.OxNave);
    obj.button25:setText("UP");
    lfm_setPropAsString(obj.button25, "fontStyle",  "bold");
    obj.button25:setFontColor("yellow");
    obj.button25:setLeft(148.75);
    obj.button25:setTop(265.50);
    obj.button25:setWidth(30);
    obj.button25:setHeight(27);
    obj.button25:setName("button25");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.OxNave);
    obj.layout25:setLeft(1);
    obj.layout25:setTop(1);
    obj.layout25:setWidth(250);
    obj.layout25:setHeight(222);
    obj.layout25:setAlign("client");
    obj.layout25:setName("layout25");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout25);
    obj.edit74:setType("number");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setLeft(519);
    obj.edit74:setTop(112);
    obj.edit74:setWidth(25);
    obj.edit74:setHeight(25);
    obj.edit74:setField("minMin25");
    obj.edit74:setName("edit74");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout25);
    obj.dataLink49:setField("minMin25");
    obj.dataLink49:setName("dataLink49");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout25);
    obj.edit75:setType("number");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setLeft(548);
    obj.edit75:setTop(112);
    obj.edit75:setWidth(25);
    obj.edit75:setHeight(25);
    obj.edit75:setField("maxMin25");
    obj.edit75:setName("edit75");

    obj.progressBar25 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar25:setParent(obj.layout25);
    obj.progressBar25:setLeft(495);
    obj.progressBar25:setTop(138);
    obj.progressBar25:setWidth(105);
    obj.progressBar25:setHeight(20.50);
    obj.progressBar25:setColor("red");
    obj.progressBar25:setHitTest(true);
    obj.progressBar25:setMax(1);
    obj.progressBar25:setField("usosMin25");
    obj.progressBar25:setName("progressBar25");

    obj.Oh23Nave = GUI.fromHandle(_obj_newObject("layout"));
    obj.Oh23Nave:setParent(obj.Lnave4);
    obj.Oh23Nave:setName("Oh23Nave");
    obj.Oh23Nave:setAlign("client");
    obj.Oh23Nave:setVisible(false);

    obj.image203 = GUI.fromHandle(_obj_newObject("image"));
    obj.image203:setParent(obj.Oh23Nave);
    obj.image203:setSRC("/imagens/fundo.png");
    obj.image203:setLeft(333);
    obj.image203:setTop(62);
    obj.image203:setWidth(452);
    obj.image203:setHeight(323);
    obj.image203:setName("image203");

    obj.image204 = GUI.fromHandle(_obj_newObject("image"));
    obj.image204:setParent(obj.Oh23Nave);
    obj.image204:setSRC("/imagens/CirculoNave.png");
    obj.image204:setWidth(459);
    obj.image204:setHeight(330);
    obj.image204:setLeft(330.50);
    obj.image204:setTop(60);
    obj.image204:setName("image204");

    obj.image205 = GUI.fromHandle(_obj_newObject("image"));
    obj.image205:setParent(obj.Oh23Nave);
    obj.image205:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image205:setLeft(50);
    obj.image205:setTop(94);
    obj.image205:setWidth(279);
    obj.image205:setHeight(54);
    obj.image205:setName("image205");

    obj.image206 = GUI.fromHandle(_obj_newObject("image"));
    obj.image206:setParent(obj.Oh23Nave);
    obj.image206:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image206:setLeft(50);
    obj.image206:setTop(148);
    obj.image206:setWidth(279);
    obj.image206:setHeight(54);
    obj.image206:setName("image206");

    obj.image207 = GUI.fromHandle(_obj_newObject("image"));
    obj.image207:setParent(obj.Oh23Nave);
    obj.image207:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image207:setLeft(50);
    obj.image207:setTop(201);
    obj.image207:setWidth(279);
    obj.image207:setHeight(54);
    obj.image207:setName("image207");

    obj.image208 = GUI.fromHandle(_obj_newObject("image"));
    obj.image208:setParent(obj.Oh23Nave);
    obj.image208:setSRC("/imagens/model.png");
    obj.image208:setLeft(59);
    obj.image208:setTop(110);
    obj.image208:setWidth(91);
    obj.image208:setHeight(19);
    obj.image208:setName("image208");

    obj.image209 = GUI.fromHandle(_obj_newObject("image"));
    obj.image209:setParent(obj.Oh23Nave);
    obj.image209:setSRC("/imagens/nome.png");
    obj.image209:setLeft(59);
    obj.image209:setTop(168);
    obj.image209:setWidth(74);
    obj.image209:setHeight(19);
    obj.image209:setName("image209");

    obj.image210 = GUI.fromHandle(_obj_newObject("image"));
    obj.image210:setParent(obj.Oh23Nave);
    obj.image210:setSRC("/imagens/nivelNave.png");
    obj.image210:setLeft(59);
    obj.image210:setTop(216);
    obj.image210:setWidth(71);
    obj.image210:setHeight(25);
    obj.image210:setName("image210");

    obj.Oh231 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oh231:setParent(obj.Oh23Nave);
    obj.Oh231:setName("Oh231");
    obj.Oh231:setSRC("/Naves/O/2 - Oh23/1.png");
    obj.Oh231:setLeft(500);
    obj.Oh231:setTop(165);
    obj.Oh231:setWidth(95);
    obj.Oh231:setHeight(104);
    obj.Oh231:setVisible(false);

    obj.Oh232 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oh232:setParent(obj.Oh23Nave);
    obj.Oh232:setName("Oh232");
    obj.Oh232:setSRC("/Naves/O/2 - Oh23/2.png");
    obj.Oh232:setLeft(500);
    obj.Oh232:setTop(165);
    obj.Oh232:setWidth(120);
    obj.Oh232:setHeight(114);
    obj.Oh232:setVisible(false);

    obj.Oh233 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oh233:setParent(obj.Oh23Nave);
    obj.Oh233:setName("Oh233");
    obj.Oh233:setSRC("/Naves/O/2 - Oh23/3.png");
    obj.Oh233:setLeft(500);
    obj.Oh233:setTop(165);
    obj.Oh233:setWidth(120);
    obj.Oh233:setHeight(106);
    obj.Oh233:setVisible(false);

    obj.Oh234 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oh234:setParent(obj.Oh23Nave);
    obj.Oh234:setName("Oh234");
    obj.Oh234:setSRC("/Naves/O/2 - Oh23/4.png");
    obj.Oh234:setLeft(500);
    obj.Oh234:setTop(165);
    obj.Oh234:setWidth(120);
    obj.Oh234:setHeight(104);
    obj.Oh234:setVisible(false);

    obj.Oh235 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oh235:setParent(obj.Oh23Nave);
    obj.Oh235:setName("Oh235");
    obj.Oh235:setSRC("/Naves/O/2 - Oh23/5.png");
    obj.Oh235:setLeft(500);
    obj.Oh235:setTop(165);
    obj.Oh235:setWidth(100);
    obj.Oh235:setHeight(104);
    obj.Oh235:setVisible(false);

    obj.Oh236 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oh236:setParent(obj.Oh23Nave);
    obj.Oh236:setName("Oh236");
    obj.Oh236:setSRC("/Naves/O/2 - Oh23/6.png");
    obj.Oh236:setLeft(500);
    obj.Oh236:setTop(165);
    obj.Oh236:setWidth(95);
    obj.Oh236:setHeight(104);
    obj.Oh236:setVisible(false);

    obj.Oh237 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oh237:setParent(obj.Oh23Nave);
    obj.Oh237:setName("Oh237");
    obj.Oh237:setSRC("/Naves/O/2 - Oh23/7.png");
    obj.Oh237:setLeft(500);
    obj.Oh237:setTop(165);
    obj.Oh237:setWidth(100);
    obj.Oh237:setHeight(120);
    obj.Oh237:setVisible(false);

    obj.Oh238 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oh238:setParent(obj.Oh23Nave);
    obj.Oh238:setName("Oh238");
    obj.Oh238:setSRC("/Naves/O/2 - Oh23/8.png");
    obj.Oh238:setLeft(500);
    obj.Oh238:setTop(165);
    obj.Oh238:setWidth(100);
    obj.Oh238:setHeight(120);
    obj.Oh238:setVisible(false);

    obj.model26 = GUI.fromHandle(_obj_newObject("label"));
    obj.model26:setParent(obj.Oh23Nave);
    obj.model26:setName("model26");
    obj.model26:setLeft(153.13);
    obj.model26:setTop(95.50);
    obj.model26:setWidth(173.63);
    obj.model26:setHeight(47.25);
    obj.model26:setHorzTextAlign("center");
    obj.model26:setFontSize(30);
    lfm_setPropAsString(obj.model26, "fontStyle",  "bold");
    obj.model26:setText("Oh23");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.Oh23Nave);
    obj.edit76:setField("nomeNave26");
    obj.edit76:setLeft(153.12);
    obj.edit76:setTop(149.50);
    obj.edit76:setWidth(173.62);
    obj.edit76:setHeight(47.25);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setFontSize(30);
    lfm_setPropAsString(obj.edit76, "fontStyle",  "bold");
    obj.edit76:setTransparent(true);
    obj.edit76:setName("edit76");

    obj.textEditor51 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor51:setParent(obj.Oh23Nave);
    obj.textEditor51:setField("Textoanotacao48");
    obj.textEditor51:setLeft(334.25);
    obj.textEditor51:setTop(276.25);
    obj.textEditor51:setWidth(222);
    obj.textEditor51:setHeight(111);
    obj.textEditor51:setTransparent(true);
    obj.textEditor51:setName("textEditor51");

    obj.textEditor52 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor52:setParent(obj.Oh23Nave);
    obj.textEditor52:setField("Textoanotacao49");
    obj.textEditor52:setLeft(558.25);
    obj.textEditor52:setTop(276.25);
    obj.textEditor52:setWidth(229);
    obj.textEditor52:setHeight(111);
    obj.textEditor52:setTransparent(true);
    obj.textEditor52:setName("textEditor52");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.Oh23Nave);
    obj.label26:setField("nivelNave26");
    obj.label26:setLeft(153.12);
    obj.label26:setTop(203.50);
    obj.label26:setWidth(173.62);
    obj.label26:setHeight(47.25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setFontSize(30);
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setHitTest(true);
    obj.label26:setName("label26");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.Oh23Nave);
    obj.button26:setText("UP");
    lfm_setPropAsString(obj.button26, "fontStyle",  "bold");
    obj.button26:setFontColor("yellow");
    obj.button26:setLeft(148.75);
    obj.button26:setTop(265.50);
    obj.button26:setWidth(30);
    obj.button26:setHeight(27);
    obj.button26:setName("button26");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.Oh23Nave);
    obj.layout26:setLeft(1);
    obj.layout26:setTop(1);
    obj.layout26:setWidth(250);
    obj.layout26:setHeight(222);
    obj.layout26:setAlign("client");
    obj.layout26:setName("layout26");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout26);
    obj.edit77:setType("number");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setLeft(519);
    obj.edit77:setTop(112);
    obj.edit77:setWidth(25);
    obj.edit77:setHeight(25);
    obj.edit77:setField("minMin26");
    obj.edit77:setName("edit77");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout26);
    obj.dataLink50:setField("minMin26");
    obj.dataLink50:setName("dataLink50");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout26);
    obj.edit78:setType("number");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setLeft(548);
    obj.edit78:setTop(112);
    obj.edit78:setWidth(25);
    obj.edit78:setHeight(25);
    obj.edit78:setField("maxMin26");
    obj.edit78:setName("edit78");

    obj.progressBar26 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar26:setParent(obj.layout26);
    obj.progressBar26:setLeft(495);
    obj.progressBar26:setTop(138);
    obj.progressBar26:setWidth(105);
    obj.progressBar26:setHeight(20.50);
    obj.progressBar26:setColor("red");
    obj.progressBar26:setHitTest(true);
    obj.progressBar26:setMax(1);
    obj.progressBar26:setField("usosMin26");
    obj.progressBar26:setName("progressBar26");

    obj.Ox2Nave = GUI.fromHandle(_obj_newObject("layout"));
    obj.Ox2Nave:setParent(obj.Lnave4);
    obj.Ox2Nave:setName("Ox2Nave");
    obj.Ox2Nave:setAlign("client");
    obj.Ox2Nave:setVisible(false);

    obj.image211 = GUI.fromHandle(_obj_newObject("image"));
    obj.image211:setParent(obj.Ox2Nave);
    obj.image211:setSRC("/imagens/fundo.png");
    obj.image211:setLeft(333);
    obj.image211:setTop(62);
    obj.image211:setWidth(452);
    obj.image211:setHeight(323);
    obj.image211:setName("image211");

    obj.image212 = GUI.fromHandle(_obj_newObject("image"));
    obj.image212:setParent(obj.Ox2Nave);
    obj.image212:setSRC("/imagens/CirculoNave.png");
    obj.image212:setWidth(459);
    obj.image212:setHeight(330);
    obj.image212:setLeft(330.50);
    obj.image212:setTop(60);
    obj.image212:setName("image212");

    obj.image213 = GUI.fromHandle(_obj_newObject("image"));
    obj.image213:setParent(obj.Ox2Nave);
    obj.image213:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image213:setLeft(50);
    obj.image213:setTop(94);
    obj.image213:setWidth(279);
    obj.image213:setHeight(54);
    obj.image213:setName("image213");

    obj.image214 = GUI.fromHandle(_obj_newObject("image"));
    obj.image214:setParent(obj.Ox2Nave);
    obj.image214:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image214:setLeft(50);
    obj.image214:setTop(148);
    obj.image214:setWidth(279);
    obj.image214:setHeight(54);
    obj.image214:setName("image214");

    obj.image215 = GUI.fromHandle(_obj_newObject("image"));
    obj.image215:setParent(obj.Ox2Nave);
    obj.image215:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image215:setLeft(50);
    obj.image215:setTop(201);
    obj.image215:setWidth(279);
    obj.image215:setHeight(54);
    obj.image215:setName("image215");

    obj.image216 = GUI.fromHandle(_obj_newObject("image"));
    obj.image216:setParent(obj.Ox2Nave);
    obj.image216:setSRC("/imagens/model.png");
    obj.image216:setLeft(59);
    obj.image216:setTop(110);
    obj.image216:setWidth(91);
    obj.image216:setHeight(19);
    obj.image216:setName("image216");

    obj.image217 = GUI.fromHandle(_obj_newObject("image"));
    obj.image217:setParent(obj.Ox2Nave);
    obj.image217:setSRC("/imagens/nome.png");
    obj.image217:setLeft(59);
    obj.image217:setTop(168);
    obj.image217:setWidth(74);
    obj.image217:setHeight(19);
    obj.image217:setName("image217");

    obj.image218 = GUI.fromHandle(_obj_newObject("image"));
    obj.image218:setParent(obj.Ox2Nave);
    obj.image218:setSRC("/imagens/nivelNave.png");
    obj.image218:setLeft(59);
    obj.image218:setTop(216);
    obj.image218:setWidth(71);
    obj.image218:setHeight(25);
    obj.image218:setName("image218");

    obj.Ox21 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox21:setParent(obj.Ox2Nave);
    obj.Ox21:setName("Ox21");
    obj.Ox21:setSRC("/Naves/O/3 - Ox2/1.png");
    obj.Ox21:setLeft(500);
    obj.Ox21:setTop(165);
    obj.Ox21:setWidth(95);
    obj.Ox21:setHeight(104);
    obj.Ox21:setVisible(false);

    obj.Ox22 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox22:setParent(obj.Ox2Nave);
    obj.Ox22:setName("Ox22");
    obj.Ox22:setSRC("/Naves/O/3 - Ox2/2.png");
    obj.Ox22:setLeft(500);
    obj.Ox22:setTop(165);
    obj.Ox22:setWidth(120);
    obj.Ox22:setHeight(114);
    obj.Ox22:setVisible(false);

    obj.Ox23 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox23:setParent(obj.Ox2Nave);
    obj.Ox23:setName("Ox23");
    obj.Ox23:setSRC("/Naves/O/3 - Ox2/3.png");
    obj.Ox23:setLeft(500);
    obj.Ox23:setTop(165);
    obj.Ox23:setWidth(120);
    obj.Ox23:setHeight(106);
    obj.Ox23:setVisible(false);

    obj.Ox24 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox24:setParent(obj.Ox2Nave);
    obj.Ox24:setName("Ox24");
    obj.Ox24:setSRC("/Naves/O/3 - Ox2/4.png");
    obj.Ox24:setLeft(500);
    obj.Ox24:setTop(165);
    obj.Ox24:setWidth(120);
    obj.Ox24:setHeight(104);
    obj.Ox24:setVisible(false);

    obj.Ox25 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox25:setParent(obj.Ox2Nave);
    obj.Ox25:setName("Ox25");
    obj.Ox25:setSRC("/Naves/O/3 - Ox2/5.png");
    obj.Ox25:setLeft(500);
    obj.Ox25:setTop(165);
    obj.Ox25:setWidth(100);
    obj.Ox25:setHeight(104);
    obj.Ox25:setVisible(false);

    obj.Ox26 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox26:setParent(obj.Ox2Nave);
    obj.Ox26:setName("Ox26");
    obj.Ox26:setSRC("/Naves/O/3 - Ox2/6.png");
    obj.Ox26:setLeft(500);
    obj.Ox26:setTop(165);
    obj.Ox26:setWidth(95);
    obj.Ox26:setHeight(104);
    obj.Ox26:setVisible(false);

    obj.Ox27 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox27:setParent(obj.Ox2Nave);
    obj.Ox27:setName("Ox27");
    obj.Ox27:setSRC("/Naves/O/3 - Ox2/7.png");
    obj.Ox27:setLeft(500);
    obj.Ox27:setTop(165);
    obj.Ox27:setWidth(100);
    obj.Ox27:setHeight(120);
    obj.Ox27:setVisible(false);

    obj.Ox28 = GUI.fromHandle(_obj_newObject("image"));
    obj.Ox28:setParent(obj.Ox2Nave);
    obj.Ox28:setName("Ox28");
    obj.Ox28:setSRC("/Naves/O/3 - Ox2/8.png");
    obj.Ox28:setLeft(500);
    obj.Ox28:setTop(165);
    obj.Ox28:setWidth(100);
    obj.Ox28:setHeight(120);
    obj.Ox28:setVisible(false);

    obj.model27 = GUI.fromHandle(_obj_newObject("label"));
    obj.model27:setParent(obj.Ox2Nave);
    obj.model27:setName("model27");
    obj.model27:setLeft(153.13);
    obj.model27:setTop(95.50);
    obj.model27:setWidth(173.63);
    obj.model27:setHeight(47.25);
    obj.model27:setHorzTextAlign("center");
    obj.model27:setFontSize(30);
    lfm_setPropAsString(obj.model27, "fontStyle",  "bold");
    obj.model27:setText("Ox2");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.Ox2Nave);
    obj.edit79:setField("nomeNave27");
    obj.edit79:setLeft(153.12);
    obj.edit79:setTop(149.50);
    obj.edit79:setWidth(173.62);
    obj.edit79:setHeight(47.25);
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setFontSize(30);
    lfm_setPropAsString(obj.edit79, "fontStyle",  "bold");
    obj.edit79:setTransparent(true);
    obj.edit79:setName("edit79");

    obj.textEditor53 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor53:setParent(obj.Ox2Nave);
    obj.textEditor53:setField("Textoanotacao50");
    obj.textEditor53:setLeft(334.25);
    obj.textEditor53:setTop(276.25);
    obj.textEditor53:setWidth(222);
    obj.textEditor53:setHeight(111);
    obj.textEditor53:setTransparent(true);
    obj.textEditor53:setName("textEditor53");

    obj.textEditor54 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor54:setParent(obj.Ox2Nave);
    obj.textEditor54:setField("Textoanotacao51");
    obj.textEditor54:setLeft(558.25);
    obj.textEditor54:setTop(276.25);
    obj.textEditor54:setWidth(229);
    obj.textEditor54:setHeight(111);
    obj.textEditor54:setTransparent(true);
    obj.textEditor54:setName("textEditor54");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.Ox2Nave);
    obj.label27:setField("nivelNave27");
    obj.label27:setLeft(153.12);
    obj.label27:setTop(203.50);
    obj.label27:setWidth(173.62);
    obj.label27:setHeight(47.25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontSize(30);
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setHitTest(true);
    obj.label27:setName("label27");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.Ox2Nave);
    obj.button27:setText("UP");
    lfm_setPropAsString(obj.button27, "fontStyle",  "bold");
    obj.button27:setFontColor("yellow");
    obj.button27:setLeft(148.75);
    obj.button27:setTop(265.50);
    obj.button27:setWidth(30);
    obj.button27:setHeight(27);
    obj.button27:setName("button27");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.Ox2Nave);
    obj.layout27:setLeft(1);
    obj.layout27:setTop(1);
    obj.layout27:setWidth(250);
    obj.layout27:setHeight(222);
    obj.layout27:setAlign("client");
    obj.layout27:setName("layout27");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout27);
    obj.edit80:setType("number");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setLeft(519);
    obj.edit80:setTop(112);
    obj.edit80:setWidth(25);
    obj.edit80:setHeight(25);
    obj.edit80:setField("minMin27");
    obj.edit80:setName("edit80");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout27);
    obj.dataLink51:setField("minMin27");
    obj.dataLink51:setName("dataLink51");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout27);
    obj.edit81:setType("number");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setLeft(548);
    obj.edit81:setTop(112);
    obj.edit81:setWidth(25);
    obj.edit81:setHeight(25);
    obj.edit81:setField("maxMin27");
    obj.edit81:setName("edit81");

    obj.progressBar27 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar27:setParent(obj.layout27);
    obj.progressBar27:setLeft(495);
    obj.progressBar27:setTop(138);
    obj.progressBar27:setWidth(105);
    obj.progressBar27:setHeight(20.50);
    obj.progressBar27:setColor("red");
    obj.progressBar27:setHitTest(true);
    obj.progressBar27:setMax(1);
    obj.progressBar27:setField("usosMin27");
    obj.progressBar27:setName("progressBar27");

    obj.OlPNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.OlPNave:setParent(obj.Lnave4);
    obj.OlPNave:setName("OlPNave");
    obj.OlPNave:setAlign("client");
    obj.OlPNave:setVisible(false);

    obj.image219 = GUI.fromHandle(_obj_newObject("image"));
    obj.image219:setParent(obj.OlPNave);
    obj.image219:setSRC("/imagens/fundo.png");
    obj.image219:setLeft(333);
    obj.image219:setTop(62);
    obj.image219:setWidth(452);
    obj.image219:setHeight(323);
    obj.image219:setName("image219");

    obj.image220 = GUI.fromHandle(_obj_newObject("image"));
    obj.image220:setParent(obj.OlPNave);
    obj.image220:setSRC("/imagens/CirculoNave.png");
    obj.image220:setWidth(459);
    obj.image220:setHeight(330);
    obj.image220:setLeft(330.50);
    obj.image220:setTop(60);
    obj.image220:setName("image220");

    obj.image221 = GUI.fromHandle(_obj_newObject("image"));
    obj.image221:setParent(obj.OlPNave);
    obj.image221:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image221:setLeft(50);
    obj.image221:setTop(94);
    obj.image221:setWidth(279);
    obj.image221:setHeight(54);
    obj.image221:setName("image221");

    obj.image222 = GUI.fromHandle(_obj_newObject("image"));
    obj.image222:setParent(obj.OlPNave);
    obj.image222:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image222:setLeft(50);
    obj.image222:setTop(148);
    obj.image222:setWidth(279);
    obj.image222:setHeight(54);
    obj.image222:setName("image222");

    obj.image223 = GUI.fromHandle(_obj_newObject("image"));
    obj.image223:setParent(obj.OlPNave);
    obj.image223:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image223:setLeft(50);
    obj.image223:setTop(201);
    obj.image223:setWidth(279);
    obj.image223:setHeight(54);
    obj.image223:setName("image223");

    obj.image224 = GUI.fromHandle(_obj_newObject("image"));
    obj.image224:setParent(obj.OlPNave);
    obj.image224:setSRC("/imagens/model.png");
    obj.image224:setLeft(59);
    obj.image224:setTop(110);
    obj.image224:setWidth(91);
    obj.image224:setHeight(19);
    obj.image224:setName("image224");

    obj.image225 = GUI.fromHandle(_obj_newObject("image"));
    obj.image225:setParent(obj.OlPNave);
    obj.image225:setSRC("/imagens/nome.png");
    obj.image225:setLeft(59);
    obj.image225:setTop(168);
    obj.image225:setWidth(74);
    obj.image225:setHeight(19);
    obj.image225:setName("image225");

    obj.image226 = GUI.fromHandle(_obj_newObject("image"));
    obj.image226:setParent(obj.OlPNave);
    obj.image226:setSRC("/imagens/nivelNave.png");
    obj.image226:setLeft(59);
    obj.image226:setTop(216);
    obj.image226:setWidth(71);
    obj.image226:setHeight(25);
    obj.image226:setName("image226");

    obj.OlP1 = GUI.fromHandle(_obj_newObject("image"));
    obj.OlP1:setParent(obj.OlPNave);
    obj.OlP1:setName("OlP1");
    obj.OlP1:setSRC("/Naves/O/4 - OlP/1.png");
    obj.OlP1:setLeft(500);
    obj.OlP1:setTop(165);
    obj.OlP1:setWidth(95);
    obj.OlP1:setHeight(104);
    obj.OlP1:setVisible(false);

    obj.OlP2 = GUI.fromHandle(_obj_newObject("image"));
    obj.OlP2:setParent(obj.OlPNave);
    obj.OlP2:setName("OlP2");
    obj.OlP2:setSRC("/Naves/O/4 - OlP/2.png");
    obj.OlP2:setLeft(500);
    obj.OlP2:setTop(165);
    obj.OlP2:setWidth(120);
    obj.OlP2:setHeight(114);
    obj.OlP2:setVisible(false);

    obj.OlP3 = GUI.fromHandle(_obj_newObject("image"));
    obj.OlP3:setParent(obj.OlPNave);
    obj.OlP3:setName("OlP3");
    obj.OlP3:setSRC("/Naves/O/4 - OlP/3.png");
    obj.OlP3:setLeft(500);
    obj.OlP3:setTop(165);
    obj.OlP3:setWidth(120);
    obj.OlP3:setHeight(106);
    obj.OlP3:setVisible(false);

    obj.OlP4 = GUI.fromHandle(_obj_newObject("image"));
    obj.OlP4:setParent(obj.OlPNave);
    obj.OlP4:setName("OlP4");
    obj.OlP4:setSRC("/Naves/O/4 - OlP/4.png");
    obj.OlP4:setLeft(500);
    obj.OlP4:setTop(165);
    obj.OlP4:setWidth(120);
    obj.OlP4:setHeight(104);
    obj.OlP4:setVisible(false);

    obj.OlP5 = GUI.fromHandle(_obj_newObject("image"));
    obj.OlP5:setParent(obj.OlPNave);
    obj.OlP5:setName("OlP5");
    obj.OlP5:setSRC("/Naves/O/4 - OlP/5.png");
    obj.OlP5:setLeft(500);
    obj.OlP5:setTop(165);
    obj.OlP5:setWidth(100);
    obj.OlP5:setHeight(104);
    obj.OlP5:setVisible(false);

    obj.OlP6 = GUI.fromHandle(_obj_newObject("image"));
    obj.OlP6:setParent(obj.OlPNave);
    obj.OlP6:setName("OlP6");
    obj.OlP6:setSRC("/Naves/O/4 - OlP/6.png");
    obj.OlP6:setLeft(500);
    obj.OlP6:setTop(165);
    obj.OlP6:setWidth(95);
    obj.OlP6:setHeight(104);
    obj.OlP6:setVisible(false);

    obj.OlP7 = GUI.fromHandle(_obj_newObject("image"));
    obj.OlP7:setParent(obj.OlPNave);
    obj.OlP7:setName("OlP7");
    obj.OlP7:setSRC("/Naves/O/4 - OlP/7.png");
    obj.OlP7:setLeft(500);
    obj.OlP7:setTop(165);
    obj.OlP7:setWidth(100);
    obj.OlP7:setHeight(120);
    obj.OlP7:setVisible(false);

    obj.OlP8 = GUI.fromHandle(_obj_newObject("image"));
    obj.OlP8:setParent(obj.OlPNave);
    obj.OlP8:setName("OlP8");
    obj.OlP8:setSRC("/Naves/O/4 - OlP/8.png");
    obj.OlP8:setLeft(500);
    obj.OlP8:setTop(165);
    obj.OlP8:setWidth(100);
    obj.OlP8:setHeight(120);
    obj.OlP8:setVisible(false);

    obj.model28 = GUI.fromHandle(_obj_newObject("label"));
    obj.model28:setParent(obj.OlPNave);
    obj.model28:setName("model28");
    obj.model28:setLeft(153.13);
    obj.model28:setTop(95.50);
    obj.model28:setWidth(173.63);
    obj.model28:setHeight(47.25);
    obj.model28:setHorzTextAlign("center");
    obj.model28:setFontSize(30);
    lfm_setPropAsString(obj.model28, "fontStyle",  "bold");
    obj.model28:setText("OlP");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.OlPNave);
    obj.edit82:setField("nomeNave28");
    obj.edit82:setLeft(153.12);
    obj.edit82:setTop(149.50);
    obj.edit82:setWidth(173.62);
    obj.edit82:setHeight(47.25);
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setFontSize(30);
    lfm_setPropAsString(obj.edit82, "fontStyle",  "bold");
    obj.edit82:setTransparent(true);
    obj.edit82:setName("edit82");

    obj.textEditor55 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor55:setParent(obj.OlPNave);
    obj.textEditor55:setField("Textoanotacao52");
    obj.textEditor55:setLeft(334.25);
    obj.textEditor55:setTop(276.25);
    obj.textEditor55:setWidth(222);
    obj.textEditor55:setHeight(111);
    obj.textEditor55:setTransparent(true);
    obj.textEditor55:setName("textEditor55");

    obj.textEditor56 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor56:setParent(obj.OlPNave);
    obj.textEditor56:setField("Textoanotacao53");
    obj.textEditor56:setLeft(558.25);
    obj.textEditor56:setTop(276.25);
    obj.textEditor56:setWidth(229);
    obj.textEditor56:setHeight(111);
    obj.textEditor56:setTransparent(true);
    obj.textEditor56:setName("textEditor56");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.OlPNave);
    obj.label28:setField("nivelNave28");
    obj.label28:setLeft(153.12);
    obj.label28:setTop(203.50);
    obj.label28:setWidth(173.62);
    obj.label28:setHeight(47.25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setFontSize(30);
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setText("0");
    obj.label28:setHitTest(true);
    obj.label28:setName("label28");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.OlPNave);
    obj.button28:setText("UP");
    lfm_setPropAsString(obj.button28, "fontStyle",  "bold");
    obj.button28:setFontColor("yellow");
    obj.button28:setLeft(148.75);
    obj.button28:setTop(265.50);
    obj.button28:setWidth(30);
    obj.button28:setHeight(27);
    obj.button28:setName("button28");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.OlPNave);
    obj.layout28:setLeft(1);
    obj.layout28:setTop(1);
    obj.layout28:setWidth(250);
    obj.layout28:setHeight(222);
    obj.layout28:setAlign("client");
    obj.layout28:setName("layout28");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout28);
    obj.edit83:setType("number");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setLeft(519);
    obj.edit83:setTop(112);
    obj.edit83:setWidth(25);
    obj.edit83:setHeight(25);
    obj.edit83:setField("minMin28");
    obj.edit83:setName("edit83");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout28);
    obj.dataLink52:setField("minMin28");
    obj.dataLink52:setName("dataLink52");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout28);
    obj.edit84:setType("number");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setLeft(548);
    obj.edit84:setTop(112);
    obj.edit84:setWidth(25);
    obj.edit84:setHeight(25);
    obj.edit84:setField("maxMin28");
    obj.edit84:setName("edit84");

    obj.progressBar28 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar28:setParent(obj.layout28);
    obj.progressBar28:setLeft(495);
    obj.progressBar28:setTop(138);
    obj.progressBar28:setWidth(105);
    obj.progressBar28:setHeight(20.50);
    obj.progressBar28:setColor("red");
    obj.progressBar28:setHitTest(true);
    obj.progressBar28:setMax(1);
    obj.progressBar28:setField("usosMin28");
    obj.progressBar28:setName("progressBar28");

    obj.OazNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.OazNave:setParent(obj.Lnave4);
    obj.OazNave:setName("OazNave");
    obj.OazNave:setAlign("client");
    obj.OazNave:setVisible(false);

    obj.image227 = GUI.fromHandle(_obj_newObject("image"));
    obj.image227:setParent(obj.OazNave);
    obj.image227:setSRC("/imagens/fundo.png");
    obj.image227:setLeft(333);
    obj.image227:setTop(62);
    obj.image227:setWidth(452);
    obj.image227:setHeight(323);
    obj.image227:setName("image227");

    obj.image228 = GUI.fromHandle(_obj_newObject("image"));
    obj.image228:setParent(obj.OazNave);
    obj.image228:setSRC("/imagens/CirculoNave.png");
    obj.image228:setWidth(459);
    obj.image228:setHeight(330);
    obj.image228:setLeft(330.50);
    obj.image228:setTop(60);
    obj.image228:setName("image228");

    obj.image229 = GUI.fromHandle(_obj_newObject("image"));
    obj.image229:setParent(obj.OazNave);
    obj.image229:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image229:setLeft(50);
    obj.image229:setTop(94);
    obj.image229:setWidth(279);
    obj.image229:setHeight(54);
    obj.image229:setName("image229");

    obj.image230 = GUI.fromHandle(_obj_newObject("image"));
    obj.image230:setParent(obj.OazNave);
    obj.image230:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image230:setLeft(50);
    obj.image230:setTop(148);
    obj.image230:setWidth(279);
    obj.image230:setHeight(54);
    obj.image230:setName("image230");

    obj.image231 = GUI.fromHandle(_obj_newObject("image"));
    obj.image231:setParent(obj.OazNave);
    obj.image231:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image231:setLeft(50);
    obj.image231:setTop(201);
    obj.image231:setWidth(279);
    obj.image231:setHeight(54);
    obj.image231:setName("image231");

    obj.image232 = GUI.fromHandle(_obj_newObject("image"));
    obj.image232:setParent(obj.OazNave);
    obj.image232:setSRC("/imagens/model.png");
    obj.image232:setLeft(59);
    obj.image232:setTop(110);
    obj.image232:setWidth(91);
    obj.image232:setHeight(19);
    obj.image232:setName("image232");

    obj.image233 = GUI.fromHandle(_obj_newObject("image"));
    obj.image233:setParent(obj.OazNave);
    obj.image233:setSRC("/imagens/nome.png");
    obj.image233:setLeft(59);
    obj.image233:setTop(168);
    obj.image233:setWidth(74);
    obj.image233:setHeight(19);
    obj.image233:setName("image233");

    obj.image234 = GUI.fromHandle(_obj_newObject("image"));
    obj.image234:setParent(obj.OazNave);
    obj.image234:setSRC("/imagens/nivelNave.png");
    obj.image234:setLeft(59);
    obj.image234:setTop(216);
    obj.image234:setWidth(71);
    obj.image234:setHeight(25);
    obj.image234:setName("image234");

    obj.Oaz1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oaz1:setParent(obj.OazNave);
    obj.Oaz1:setName("Oaz1");
    obj.Oaz1:setSRC("/Naves/O/5 - Oaz/1.png");
    obj.Oaz1:setLeft(500);
    obj.Oaz1:setTop(165);
    obj.Oaz1:setWidth(95);
    obj.Oaz1:setHeight(104);
    obj.Oaz1:setVisible(false);

    obj.Oaz2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oaz2:setParent(obj.OazNave);
    obj.Oaz2:setName("Oaz2");
    obj.Oaz2:setSRC("/Naves/O/5 - Oaz/2.png");
    obj.Oaz2:setLeft(500);
    obj.Oaz2:setTop(165);
    obj.Oaz2:setWidth(120);
    obj.Oaz2:setHeight(114);
    obj.Oaz2:setVisible(false);

    obj.Oaz3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oaz3:setParent(obj.OazNave);
    obj.Oaz3:setName("Oaz3");
    obj.Oaz3:setSRC("/Naves/O/5 - Oaz/3.png");
    obj.Oaz3:setLeft(500);
    obj.Oaz3:setTop(165);
    obj.Oaz3:setWidth(120);
    obj.Oaz3:setHeight(106);
    obj.Oaz3:setVisible(false);

    obj.Oaz4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oaz4:setParent(obj.OazNave);
    obj.Oaz4:setName("Oaz4");
    obj.Oaz4:setSRC("/Naves/O/5 - Oaz/4.png");
    obj.Oaz4:setLeft(500);
    obj.Oaz4:setTop(165);
    obj.Oaz4:setWidth(120);
    obj.Oaz4:setHeight(104);
    obj.Oaz4:setVisible(false);

    obj.Oaz5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oaz5:setParent(obj.OazNave);
    obj.Oaz5:setName("Oaz5");
    obj.Oaz5:setSRC("/Naves/O/5 - Oaz/5.png");
    obj.Oaz5:setLeft(500);
    obj.Oaz5:setTop(165);
    obj.Oaz5:setWidth(100);
    obj.Oaz5:setHeight(104);
    obj.Oaz5:setVisible(false);

    obj.Oaz6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oaz6:setParent(obj.OazNave);
    obj.Oaz6:setName("Oaz6");
    obj.Oaz6:setSRC("/Naves/O/5 - Oaz/6.png");
    obj.Oaz6:setLeft(500);
    obj.Oaz6:setTop(165);
    obj.Oaz6:setWidth(95);
    obj.Oaz6:setHeight(104);
    obj.Oaz6:setVisible(false);

    obj.Oaz7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oaz7:setParent(obj.OazNave);
    obj.Oaz7:setName("Oaz7");
    obj.Oaz7:setSRC("/Naves/O/5 - Oaz/7.png");
    obj.Oaz7:setLeft(500);
    obj.Oaz7:setTop(165);
    obj.Oaz7:setWidth(100);
    obj.Oaz7:setHeight(120);
    obj.Oaz7:setVisible(false);

    obj.Oaz8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oaz8:setParent(obj.OazNave);
    obj.Oaz8:setName("Oaz8");
    obj.Oaz8:setSRC("/Naves/O/5 - Oaz/8.png");
    obj.Oaz8:setLeft(500);
    obj.Oaz8:setTop(165);
    obj.Oaz8:setWidth(100);
    obj.Oaz8:setHeight(120);
    obj.Oaz8:setVisible(false);

    obj.model29 = GUI.fromHandle(_obj_newObject("label"));
    obj.model29:setParent(obj.OazNave);
    obj.model29:setName("model29");
    obj.model29:setLeft(153.13);
    obj.model29:setTop(95.50);
    obj.model29:setWidth(173.63);
    obj.model29:setHeight(47.25);
    obj.model29:setHorzTextAlign("center");
    obj.model29:setFontSize(30);
    lfm_setPropAsString(obj.model29, "fontStyle",  "bold");
    obj.model29:setText("Oaz");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.OazNave);
    obj.edit85:setField("nomeNave129");
    obj.edit85:setLeft(153.12);
    obj.edit85:setTop(149.50);
    obj.edit85:setWidth(173.62);
    obj.edit85:setHeight(47.25);
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setFontSize(30);
    lfm_setPropAsString(obj.edit85, "fontStyle",  "bold");
    obj.edit85:setTransparent(true);
    obj.edit85:setName("edit85");

    obj.textEditor57 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor57:setParent(obj.OazNave);
    obj.textEditor57:setField("Textoanotacao54");
    obj.textEditor57:setLeft(334.25);
    obj.textEditor57:setTop(276.25);
    obj.textEditor57:setWidth(222);
    obj.textEditor57:setHeight(111);
    obj.textEditor57:setTransparent(true);
    obj.textEditor57:setName("textEditor57");

    obj.textEditor58 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor58:setParent(obj.OazNave);
    obj.textEditor58:setField("Textoanotacao55");
    obj.textEditor58:setLeft(558.25);
    obj.textEditor58:setTop(276.25);
    obj.textEditor58:setWidth(229);
    obj.textEditor58:setHeight(111);
    obj.textEditor58:setTransparent(true);
    obj.textEditor58:setName("textEditor58");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.OazNave);
    obj.label29:setField("nivelNave29");
    obj.label29:setLeft(153.12);
    obj.label29:setTop(203.50);
    obj.label29:setWidth(173.62);
    obj.label29:setHeight(47.25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setFontSize(30);
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setText("0");
    obj.label29:setHitTest(true);
    obj.label29:setName("label29");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.OazNave);
    obj.button29:setText("UP");
    lfm_setPropAsString(obj.button29, "fontStyle",  "bold");
    obj.button29:setFontColor("yellow");
    obj.button29:setLeft(148.75);
    obj.button29:setTop(265.50);
    obj.button29:setWidth(30);
    obj.button29:setHeight(27);
    obj.button29:setName("button29");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.OazNave);
    obj.layout29:setLeft(1);
    obj.layout29:setTop(1);
    obj.layout29:setWidth(250);
    obj.layout29:setHeight(222);
    obj.layout29:setAlign("client");
    obj.layout29:setName("layout29");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout29);
    obj.edit86:setType("number");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setLeft(519);
    obj.edit86:setTop(112);
    obj.edit86:setWidth(25);
    obj.edit86:setHeight(25);
    obj.edit86:setField("minMin29");
    obj.edit86:setName("edit86");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout29);
    obj.dataLink53:setField("minMin29");
    obj.dataLink53:setName("dataLink53");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout29);
    obj.edit87:setType("number");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setLeft(548);
    obj.edit87:setTop(112);
    obj.edit87:setWidth(25);
    obj.edit87:setHeight(25);
    obj.edit87:setField("maxMin29");
    obj.edit87:setName("edit87");

    obj.progressBar29 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar29:setParent(obj.layout29);
    obj.progressBar29:setLeft(495);
    obj.progressBar29:setTop(138);
    obj.progressBar29:setWidth(105);
    obj.progressBar29:setHeight(20.50);
    obj.progressBar29:setColor("red");
    obj.progressBar29:setHitTest(true);
    obj.progressBar29:setMax(1);
    obj.progressBar29:setField("usosMin29");
    obj.progressBar29:setName("progressBar29");

    obj.OjHNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.OjHNave:setParent(obj.Lnave4);
    obj.OjHNave:setName("OjHNave");
    obj.OjHNave:setAlign("client");
    obj.OjHNave:setVisible(false);

    obj.image235 = GUI.fromHandle(_obj_newObject("image"));
    obj.image235:setParent(obj.OjHNave);
    obj.image235:setSRC("/imagens/fundo.png");
    obj.image235:setLeft(333);
    obj.image235:setTop(62);
    obj.image235:setWidth(452);
    obj.image235:setHeight(323);
    obj.image235:setName("image235");

    obj.image236 = GUI.fromHandle(_obj_newObject("image"));
    obj.image236:setParent(obj.OjHNave);
    obj.image236:setSRC("/imagens/CirculoNave.png");
    obj.image236:setWidth(459);
    obj.image236:setHeight(330);
    obj.image236:setLeft(330.50);
    obj.image236:setTop(60);
    obj.image236:setName("image236");

    obj.image237 = GUI.fromHandle(_obj_newObject("image"));
    obj.image237:setParent(obj.OjHNave);
    obj.image237:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image237:setLeft(50);
    obj.image237:setTop(94);
    obj.image237:setWidth(279);
    obj.image237:setHeight(54);
    obj.image237:setName("image237");

    obj.image238 = GUI.fromHandle(_obj_newObject("image"));
    obj.image238:setParent(obj.OjHNave);
    obj.image238:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image238:setLeft(50);
    obj.image238:setTop(148);
    obj.image238:setWidth(279);
    obj.image238:setHeight(54);
    obj.image238:setName("image238");

    obj.image239 = GUI.fromHandle(_obj_newObject("image"));
    obj.image239:setParent(obj.OjHNave);
    obj.image239:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image239:setLeft(50);
    obj.image239:setTop(201);
    obj.image239:setWidth(279);
    obj.image239:setHeight(54);
    obj.image239:setName("image239");

    obj.image240 = GUI.fromHandle(_obj_newObject("image"));
    obj.image240:setParent(obj.OjHNave);
    obj.image240:setSRC("/imagens/model.png");
    obj.image240:setLeft(59);
    obj.image240:setTop(110);
    obj.image240:setWidth(91);
    obj.image240:setHeight(19);
    obj.image240:setName("image240");

    obj.image241 = GUI.fromHandle(_obj_newObject("image"));
    obj.image241:setParent(obj.OjHNave);
    obj.image241:setSRC("/imagens/nome.png");
    obj.image241:setLeft(59);
    obj.image241:setTop(168);
    obj.image241:setWidth(74);
    obj.image241:setHeight(19);
    obj.image241:setName("image241");

    obj.image242 = GUI.fromHandle(_obj_newObject("image"));
    obj.image242:setParent(obj.OjHNave);
    obj.image242:setSRC("/imagens/nivelNave.png");
    obj.image242:setLeft(59);
    obj.image242:setTop(216);
    obj.image242:setWidth(71);
    obj.image242:setHeight(25);
    obj.image242:setName("image242");

    obj.OjH1 = GUI.fromHandle(_obj_newObject("image"));
    obj.OjH1:setParent(obj.OjHNave);
    obj.OjH1:setName("OjH1");
    obj.OjH1:setSRC("/Naves/O/6 - OjH/1.png");
    obj.OjH1:setLeft(500);
    obj.OjH1:setTop(165);
    obj.OjH1:setWidth(95);
    obj.OjH1:setHeight(104);
    obj.OjH1:setVisible(false);

    obj.OjH2 = GUI.fromHandle(_obj_newObject("image"));
    obj.OjH2:setParent(obj.OjHNave);
    obj.OjH2:setName("OjH2");
    obj.OjH2:setSRC("/Naves/O/6 - OjH/2.png");
    obj.OjH2:setLeft(500);
    obj.OjH2:setTop(165);
    obj.OjH2:setWidth(120);
    obj.OjH2:setHeight(114);
    obj.OjH2:setVisible(false);

    obj.OjH3 = GUI.fromHandle(_obj_newObject("image"));
    obj.OjH3:setParent(obj.OjHNave);
    obj.OjH3:setName("OjH3");
    obj.OjH3:setSRC("/Naves/O/6 - OjH/3.png");
    obj.OjH3:setLeft(500);
    obj.OjH3:setTop(165);
    obj.OjH3:setWidth(120);
    obj.OjH3:setHeight(106);
    obj.OjH3:setVisible(false);

    obj.OjH4 = GUI.fromHandle(_obj_newObject("image"));
    obj.OjH4:setParent(obj.OjHNave);
    obj.OjH4:setName("OjH4");
    obj.OjH4:setSRC("/Naves/O/6 - OjH/4.png");
    obj.OjH4:setLeft(500);
    obj.OjH4:setTop(165);
    obj.OjH4:setWidth(120);
    obj.OjH4:setHeight(104);
    obj.OjH4:setVisible(false);

    obj.OjH5 = GUI.fromHandle(_obj_newObject("image"));
    obj.OjH5:setParent(obj.OjHNave);
    obj.OjH5:setName("OjH5");
    obj.OjH5:setSRC("/Naves/O/6 - OjH/5.png");
    obj.OjH5:setLeft(500);
    obj.OjH5:setTop(165);
    obj.OjH5:setWidth(100);
    obj.OjH5:setHeight(104);
    obj.OjH5:setVisible(false);

    obj.OjH6 = GUI.fromHandle(_obj_newObject("image"));
    obj.OjH6:setParent(obj.OjHNave);
    obj.OjH6:setName("OjH6");
    obj.OjH6:setSRC("/Naves/O/6 - OjH/6.png");
    obj.OjH6:setLeft(500);
    obj.OjH6:setTop(165);
    obj.OjH6:setWidth(95);
    obj.OjH6:setHeight(104);
    obj.OjH6:setVisible(false);

    obj.OjH7 = GUI.fromHandle(_obj_newObject("image"));
    obj.OjH7:setParent(obj.OjHNave);
    obj.OjH7:setName("OjH7");
    obj.OjH7:setSRC("/Naves/O/6 - OjH/7.png");
    obj.OjH7:setLeft(500);
    obj.OjH7:setTop(165);
    obj.OjH7:setWidth(100);
    obj.OjH7:setHeight(120);
    obj.OjH7:setVisible(false);

    obj.OjH8 = GUI.fromHandle(_obj_newObject("image"));
    obj.OjH8:setParent(obj.OjHNave);
    obj.OjH8:setName("OjH8");
    obj.OjH8:setSRC("/Naves/O/6 - OjH/8.png");
    obj.OjH8:setLeft(500);
    obj.OjH8:setTop(165);
    obj.OjH8:setWidth(100);
    obj.OjH8:setHeight(120);
    obj.OjH8:setVisible(false);

    obj.model30 = GUI.fromHandle(_obj_newObject("label"));
    obj.model30:setParent(obj.OjHNave);
    obj.model30:setName("model30");
    obj.model30:setLeft(153.13);
    obj.model30:setTop(95.50);
    obj.model30:setWidth(173.63);
    obj.model30:setHeight(47.25);
    obj.model30:setHorzTextAlign("center");
    obj.model30:setFontSize(30);
    lfm_setPropAsString(obj.model30, "fontStyle",  "bold");
    obj.model30:setText("OjH");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.OjHNave);
    obj.edit88:setField("nomeNave30");
    obj.edit88:setLeft(153.12);
    obj.edit88:setTop(149.50);
    obj.edit88:setWidth(173.62);
    obj.edit88:setHeight(47.25);
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setFontSize(30);
    lfm_setPropAsString(obj.edit88, "fontStyle",  "bold");
    obj.edit88:setTransparent(true);
    obj.edit88:setName("edit88");

    obj.textEditor59 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor59:setParent(obj.OjHNave);
    obj.textEditor59:setField("Textoanotacao56");
    obj.textEditor59:setLeft(334.25);
    obj.textEditor59:setTop(276.25);
    obj.textEditor59:setWidth(222);
    obj.textEditor59:setHeight(111);
    obj.textEditor59:setTransparent(true);
    obj.textEditor59:setName("textEditor59");

    obj.textEditor60 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor60:setParent(obj.OjHNave);
    obj.textEditor60:setField("Textoanotacao57");
    obj.textEditor60:setLeft(558.25);
    obj.textEditor60:setTop(276.25);
    obj.textEditor60:setWidth(229);
    obj.textEditor60:setHeight(111);
    obj.textEditor60:setTransparent(true);
    obj.textEditor60:setName("textEditor60");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.OjHNave);
    obj.label30:setField("nivelNave30");
    obj.label30:setLeft(153.12);
    obj.label30:setTop(203.50);
    obj.label30:setWidth(173.62);
    obj.label30:setHeight(47.25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setFontSize(30);
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setText("0");
    obj.label30:setHitTest(true);
    obj.label30:setName("label30");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.OjHNave);
    obj.button30:setText("UP");
    lfm_setPropAsString(obj.button30, "fontStyle",  "bold");
    obj.button30:setFontColor("yellow");
    obj.button30:setLeft(148.75);
    obj.button30:setTop(265.50);
    obj.button30:setWidth(30);
    obj.button30:setHeight(27);
    obj.button30:setName("button30");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.OjHNave);
    obj.layout30:setLeft(1);
    obj.layout30:setTop(1);
    obj.layout30:setWidth(250);
    obj.layout30:setHeight(222);
    obj.layout30:setAlign("client");
    obj.layout30:setName("layout30");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout30);
    obj.edit89:setType("number");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setLeft(519);
    obj.edit89:setTop(112);
    obj.edit89:setWidth(25);
    obj.edit89:setHeight(25);
    obj.edit89:setField("minMin30");
    obj.edit89:setName("edit89");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout30);
    obj.dataLink54:setField("minMin30");
    obj.dataLink54:setName("dataLink54");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout30);
    obj.edit90:setType("number");
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setLeft(548);
    obj.edit90:setTop(112);
    obj.edit90:setWidth(25);
    obj.edit90:setHeight(25);
    obj.edit90:setField("maxMin30");
    obj.edit90:setName("edit90");

    obj.progressBar30 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar30:setParent(obj.layout30);
    obj.progressBar30:setLeft(495);
    obj.progressBar30:setTop(138);
    obj.progressBar30:setWidth(105);
    obj.progressBar30:setHeight(20.50);
    obj.progressBar30:setColor("red");
    obj.progressBar30:setHitTest(true);
    obj.progressBar30:setMax(1);
    obj.progressBar30:setField("usosMin30");
    obj.progressBar30:setName("progressBar30");

    obj.OSdNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.OSdNave:setParent(obj.Lnave4);
    obj.OSdNave:setName("OSdNave");
    obj.OSdNave:setAlign("client");
    obj.OSdNave:setVisible(false);

    obj.image243 = GUI.fromHandle(_obj_newObject("image"));
    obj.image243:setParent(obj.OSdNave);
    obj.image243:setSRC("/imagens/fundo.png");
    obj.image243:setLeft(333);
    obj.image243:setTop(62);
    obj.image243:setWidth(452);
    obj.image243:setHeight(323);
    obj.image243:setName("image243");

    obj.image244 = GUI.fromHandle(_obj_newObject("image"));
    obj.image244:setParent(obj.OSdNave);
    obj.image244:setSRC("/imagens/CirculoNave.png");
    obj.image244:setWidth(459);
    obj.image244:setHeight(330);
    obj.image244:setLeft(330.50);
    obj.image244:setTop(60);
    obj.image244:setName("image244");

    obj.image245 = GUI.fromHandle(_obj_newObject("image"));
    obj.image245:setParent(obj.OSdNave);
    obj.image245:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image245:setLeft(50);
    obj.image245:setTop(94);
    obj.image245:setWidth(279);
    obj.image245:setHeight(54);
    obj.image245:setName("image245");

    obj.image246 = GUI.fromHandle(_obj_newObject("image"));
    obj.image246:setParent(obj.OSdNave);
    obj.image246:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image246:setLeft(50);
    obj.image246:setTop(148);
    obj.image246:setWidth(279);
    obj.image246:setHeight(54);
    obj.image246:setName("image246");

    obj.image247 = GUI.fromHandle(_obj_newObject("image"));
    obj.image247:setParent(obj.OSdNave);
    obj.image247:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image247:setLeft(50);
    obj.image247:setTop(201);
    obj.image247:setWidth(279);
    obj.image247:setHeight(54);
    obj.image247:setName("image247");

    obj.image248 = GUI.fromHandle(_obj_newObject("image"));
    obj.image248:setParent(obj.OSdNave);
    obj.image248:setSRC("/imagens/model.png");
    obj.image248:setLeft(59);
    obj.image248:setTop(110);
    obj.image248:setWidth(91);
    obj.image248:setHeight(19);
    obj.image248:setName("image248");

    obj.image249 = GUI.fromHandle(_obj_newObject("image"));
    obj.image249:setParent(obj.OSdNave);
    obj.image249:setSRC("/imagens/nome.png");
    obj.image249:setLeft(59);
    obj.image249:setTop(168);
    obj.image249:setWidth(74);
    obj.image249:setHeight(19);
    obj.image249:setName("image249");

    obj.image250 = GUI.fromHandle(_obj_newObject("image"));
    obj.image250:setParent(obj.OSdNave);
    obj.image250:setSRC("/imagens/nivelNave.png");
    obj.image250:setLeft(59);
    obj.image250:setTop(216);
    obj.image250:setWidth(71);
    obj.image250:setHeight(25);
    obj.image250:setName("image250");

    obj.OSd1 = GUI.fromHandle(_obj_newObject("image"));
    obj.OSd1:setParent(obj.OSdNave);
    obj.OSd1:setName("OSd1");
    obj.OSd1:setSRC("/Naves/O/7 - OSd/1.png");
    obj.OSd1:setLeft(500);
    obj.OSd1:setTop(165);
    obj.OSd1:setWidth(95);
    obj.OSd1:setHeight(104);
    obj.OSd1:setVisible(false);

    obj.OSd2 = GUI.fromHandle(_obj_newObject("image"));
    obj.OSd2:setParent(obj.OSdNave);
    obj.OSd2:setName("OSd2");
    obj.OSd2:setSRC("/Naves/O/7 - OSd/2.png");
    obj.OSd2:setLeft(500);
    obj.OSd2:setTop(165);
    obj.OSd2:setWidth(120);
    obj.OSd2:setHeight(114);
    obj.OSd2:setVisible(false);

    obj.OSd3 = GUI.fromHandle(_obj_newObject("image"));
    obj.OSd3:setParent(obj.OSdNave);
    obj.OSd3:setName("OSd3");
    obj.OSd3:setSRC("/Naves/O/7 - OSd/3.png");
    obj.OSd3:setLeft(500);
    obj.OSd3:setTop(165);
    obj.OSd3:setWidth(120);
    obj.OSd3:setHeight(106);
    obj.OSd3:setVisible(false);

    obj.OSd4 = GUI.fromHandle(_obj_newObject("image"));
    obj.OSd4:setParent(obj.OSdNave);
    obj.OSd4:setName("OSd4");
    obj.OSd4:setSRC("/Naves/O/7 - OSd/4.png");
    obj.OSd4:setLeft(500);
    obj.OSd4:setTop(165);
    obj.OSd4:setWidth(120);
    obj.OSd4:setHeight(104);
    obj.OSd4:setVisible(false);

    obj.OSd5 = GUI.fromHandle(_obj_newObject("image"));
    obj.OSd5:setParent(obj.OSdNave);
    obj.OSd5:setName("OSd5");
    obj.OSd5:setSRC("/Naves/O/7 - OSd/5.png");
    obj.OSd5:setLeft(500);
    obj.OSd5:setTop(165);
    obj.OSd5:setWidth(100);
    obj.OSd5:setHeight(104);
    obj.OSd5:setVisible(false);

    obj.OSd6 = GUI.fromHandle(_obj_newObject("image"));
    obj.OSd6:setParent(obj.OSdNave);
    obj.OSd6:setName("OSd6");
    obj.OSd6:setSRC("/Naves/O/7 - OSd/6.png");
    obj.OSd6:setLeft(500);
    obj.OSd6:setTop(165);
    obj.OSd6:setWidth(95);
    obj.OSd6:setHeight(104);
    obj.OSd6:setVisible(false);

    obj.OSd7 = GUI.fromHandle(_obj_newObject("image"));
    obj.OSd7:setParent(obj.OSdNave);
    obj.OSd7:setName("OSd7");
    obj.OSd7:setSRC("/Naves/O/7 - OSd/7.png");
    obj.OSd7:setLeft(500);
    obj.OSd7:setTop(165);
    obj.OSd7:setWidth(100);
    obj.OSd7:setHeight(120);
    obj.OSd7:setVisible(false);

    obj.OSd8 = GUI.fromHandle(_obj_newObject("image"));
    obj.OSd8:setParent(obj.OSdNave);
    obj.OSd8:setName("OSd8");
    obj.OSd8:setSRC("/Naves/O/7 - OSd/8.png");
    obj.OSd8:setLeft(500);
    obj.OSd8:setTop(165);
    obj.OSd8:setWidth(100);
    obj.OSd8:setHeight(120);
    obj.OSd8:setVisible(false);

    obj.model31 = GUI.fromHandle(_obj_newObject("label"));
    obj.model31:setParent(obj.OSdNave);
    obj.model31:setName("model31");
    obj.model31:setLeft(153.13);
    obj.model31:setTop(95.50);
    obj.model31:setWidth(173.63);
    obj.model31:setHeight(47.25);
    obj.model31:setHorzTextAlign("center");
    obj.model31:setFontSize(30);
    lfm_setPropAsString(obj.model31, "fontStyle",  "bold");
    obj.model31:setText("OSd");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.OSdNave);
    obj.edit91:setField("nomeNave31");
    obj.edit91:setLeft(153.12);
    obj.edit91:setTop(149.50);
    obj.edit91:setWidth(173.62);
    obj.edit91:setHeight(47.25);
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setFontSize(30);
    lfm_setPropAsString(obj.edit91, "fontStyle",  "bold");
    obj.edit91:setTransparent(true);
    obj.edit91:setName("edit91");

    obj.textEditor61 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor61:setParent(obj.OSdNave);
    obj.textEditor61:setField("Textoanotacao58");
    obj.textEditor61:setLeft(334.25);
    obj.textEditor61:setTop(276.25);
    obj.textEditor61:setWidth(222);
    obj.textEditor61:setHeight(111);
    obj.textEditor61:setTransparent(true);
    obj.textEditor61:setName("textEditor61");

    obj.textEditor62 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor62:setParent(obj.OSdNave);
    obj.textEditor62:setField("Textoanotacao59");
    obj.textEditor62:setLeft(558.25);
    obj.textEditor62:setTop(276.25);
    obj.textEditor62:setWidth(229);
    obj.textEditor62:setHeight(111);
    obj.textEditor62:setTransparent(true);
    obj.textEditor62:setName("textEditor62");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.OSdNave);
    obj.label31:setField("nivelNave31");
    obj.label31:setLeft(153.12);
    obj.label31:setTop(203.50);
    obj.label31:setWidth(173.62);
    obj.label31:setHeight(47.25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setFontSize(30);
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setText("0");
    obj.label31:setHitTest(true);
    obj.label31:setName("label31");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.OSdNave);
    obj.button31:setText("UP");
    lfm_setPropAsString(obj.button31, "fontStyle",  "bold");
    obj.button31:setFontColor("yellow");
    obj.button31:setLeft(148.75);
    obj.button31:setTop(265.50);
    obj.button31:setWidth(30);
    obj.button31:setHeight(27);
    obj.button31:setName("button31");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.OSdNave);
    obj.layout31:setLeft(1);
    obj.layout31:setTop(1);
    obj.layout31:setWidth(250);
    obj.layout31:setHeight(222);
    obj.layout31:setAlign("client");
    obj.layout31:setName("layout31");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout31);
    obj.edit92:setType("number");
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setLeft(519);
    obj.edit92:setTop(112);
    obj.edit92:setWidth(25);
    obj.edit92:setHeight(25);
    obj.edit92:setField("minMin31");
    obj.edit92:setName("edit92");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout31);
    obj.dataLink55:setField("minMin31");
    obj.dataLink55:setName("dataLink55");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout31);
    obj.edit93:setType("number");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setLeft(548);
    obj.edit93:setTop(112);
    obj.edit93:setWidth(25);
    obj.edit93:setHeight(25);
    obj.edit93:setField("maxMin31");
    obj.edit93:setName("edit93");

    obj.progressBar31 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar31:setParent(obj.layout31);
    obj.progressBar31:setLeft(495);
    obj.progressBar31:setTop(138);
    obj.progressBar31:setWidth(105);
    obj.progressBar31:setHeight(20.50);
    obj.progressBar31:setColor("red");
    obj.progressBar31:setHitTest(true);
    obj.progressBar31:setMax(1);
    obj.progressBar31:setField("usosMin31");
    obj.progressBar31:setName("progressBar31");

    obj.OqwNave = GUI.fromHandle(_obj_newObject("layout"));
    obj.OqwNave:setParent(obj.Lnave4);
    obj.OqwNave:setName("OqwNave");
    obj.OqwNave:setAlign("client");
    obj.OqwNave:setVisible(false);

    obj.image251 = GUI.fromHandle(_obj_newObject("image"));
    obj.image251:setParent(obj.OqwNave);
    obj.image251:setSRC("/imagens/fundo.png");
    obj.image251:setLeft(333);
    obj.image251:setTop(62);
    obj.image251:setWidth(452);
    obj.image251:setHeight(323);
    obj.image251:setName("image251");

    obj.image252 = GUI.fromHandle(_obj_newObject("image"));
    obj.image252:setParent(obj.OqwNave);
    obj.image252:setSRC("/imagens/CirculoNave.png");
    obj.image252:setWidth(459);
    obj.image252:setHeight(330);
    obj.image252:setLeft(330.50);
    obj.image252:setTop(60);
    obj.image252:setName("image252");

    obj.image253 = GUI.fromHandle(_obj_newObject("image"));
    obj.image253:setParent(obj.OqwNave);
    obj.image253:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image253:setLeft(50);
    obj.image253:setTop(94);
    obj.image253:setWidth(279);
    obj.image253:setHeight(54);
    obj.image253:setName("image253");

    obj.image254 = GUI.fromHandle(_obj_newObject("image"));
    obj.image254:setParent(obj.OqwNave);
    obj.image254:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image254:setLeft(50);
    obj.image254:setTop(148);
    obj.image254:setWidth(279);
    obj.image254:setHeight(54);
    obj.image254:setName("image254");

    obj.image255 = GUI.fromHandle(_obj_newObject("image"));
    obj.image255:setParent(obj.OqwNave);
    obj.image255:setSRC("/imagens/quadradoPreenchidoCheio.png");
    obj.image255:setLeft(50);
    obj.image255:setTop(201);
    obj.image255:setWidth(279);
    obj.image255:setHeight(54);
    obj.image255:setName("image255");

    obj.image256 = GUI.fromHandle(_obj_newObject("image"));
    obj.image256:setParent(obj.OqwNave);
    obj.image256:setSRC("/imagens/model.png");
    obj.image256:setLeft(59);
    obj.image256:setTop(110);
    obj.image256:setWidth(91);
    obj.image256:setHeight(19);
    obj.image256:setName("image256");

    obj.image257 = GUI.fromHandle(_obj_newObject("image"));
    obj.image257:setParent(obj.OqwNave);
    obj.image257:setSRC("/imagens/nome.png");
    obj.image257:setLeft(59);
    obj.image257:setTop(168);
    obj.image257:setWidth(74);
    obj.image257:setHeight(19);
    obj.image257:setName("image257");

    obj.image258 = GUI.fromHandle(_obj_newObject("image"));
    obj.image258:setParent(obj.OqwNave);
    obj.image258:setSRC("/imagens/nivelNave.png");
    obj.image258:setLeft(59);
    obj.image258:setTop(216);
    obj.image258:setWidth(71);
    obj.image258:setHeight(25);
    obj.image258:setName("image258");

    obj.Oqw1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oqw1:setParent(obj.OqwNave);
    obj.Oqw1:setName("Oqw1");
    obj.Oqw1:setSRC("/Naves/O/8 - Oqw/1.png");
    obj.Oqw1:setLeft(500);
    obj.Oqw1:setTop(165);
    obj.Oqw1:setWidth(95);
    obj.Oqw1:setHeight(104);
    obj.Oqw1:setVisible(false);

    obj.Oqw2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oqw2:setParent(obj.OqwNave);
    obj.Oqw2:setName("Oqw2");
    obj.Oqw2:setSRC("/Naves/O/8 - Oqw/2.png");
    obj.Oqw2:setLeft(500);
    obj.Oqw2:setTop(165);
    obj.Oqw2:setWidth(120);
    obj.Oqw2:setHeight(114);
    obj.Oqw2:setVisible(false);

    obj.Oqw3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oqw3:setParent(obj.OqwNave);
    obj.Oqw3:setName("Oqw3");
    obj.Oqw3:setSRC("/Naves/O/8 - Oqw/3.png");
    obj.Oqw3:setLeft(500);
    obj.Oqw3:setTop(165);
    obj.Oqw3:setWidth(120);
    obj.Oqw3:setHeight(106);
    obj.Oqw3:setVisible(false);

    obj.Oqw4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oqw4:setParent(obj.OqwNave);
    obj.Oqw4:setName("Oqw4");
    obj.Oqw4:setSRC("/Naves/O/8 - Oqw/4.png");
    obj.Oqw4:setLeft(500);
    obj.Oqw4:setTop(165);
    obj.Oqw4:setWidth(120);
    obj.Oqw4:setHeight(104);
    obj.Oqw4:setVisible(false);

    obj.Oqw5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oqw5:setParent(obj.OqwNave);
    obj.Oqw5:setName("Oqw5");
    obj.Oqw5:setSRC("/Naves/O/8 - Oqw/5.png");
    obj.Oqw5:setLeft(500);
    obj.Oqw5:setTop(165);
    obj.Oqw5:setWidth(100);
    obj.Oqw5:setHeight(104);
    obj.Oqw5:setVisible(false);

    obj.Oqw6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oqw6:setParent(obj.OqwNave);
    obj.Oqw6:setName("Oqw6");
    obj.Oqw6:setSRC("/Naves/O/8 - Oqw/6.png");
    obj.Oqw6:setLeft(500);
    obj.Oqw6:setTop(165);
    obj.Oqw6:setWidth(95);
    obj.Oqw6:setHeight(104);
    obj.Oqw6:setVisible(false);

    obj.Oqw7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oqw7:setParent(obj.OqwNave);
    obj.Oqw7:setName("Oqw7");
    obj.Oqw7:setSRC("/Naves/O/8 - Oqw/7.png");
    obj.Oqw7:setLeft(500);
    obj.Oqw7:setTop(165);
    obj.Oqw7:setWidth(100);
    obj.Oqw7:setHeight(120);
    obj.Oqw7:setVisible(false);

    obj.Oqw8 = GUI.fromHandle(_obj_newObject("image"));
    obj.Oqw8:setParent(obj.OqwNave);
    obj.Oqw8:setName("Oqw8");
    obj.Oqw8:setSRC("/Naves/O/8 - Oqw/8.png");
    obj.Oqw8:setLeft(500);
    obj.Oqw8:setTop(165);
    obj.Oqw8:setWidth(100);
    obj.Oqw8:setHeight(120);
    obj.Oqw8:setVisible(false);

    obj.model32 = GUI.fromHandle(_obj_newObject("label"));
    obj.model32:setParent(obj.OqwNave);
    obj.model32:setName("model32");
    obj.model32:setLeft(153.13);
    obj.model32:setTop(95.50);
    obj.model32:setWidth(173.63);
    obj.model32:setHeight(47.25);
    obj.model32:setHorzTextAlign("center");
    obj.model32:setFontSize(30);
    lfm_setPropAsString(obj.model32, "fontStyle",  "bold");
    obj.model32:setText("Oqw");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.OqwNave);
    obj.edit94:setField("nomeNave32");
    obj.edit94:setLeft(153.12);
    obj.edit94:setTop(149.50);
    obj.edit94:setWidth(173.62);
    obj.edit94:setHeight(47.25);
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setFontSize(30);
    lfm_setPropAsString(obj.edit94, "fontStyle",  "bold");
    obj.edit94:setTransparent(true);
    obj.edit94:setName("edit94");

    obj.textEditor63 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor63:setParent(obj.OqwNave);
    obj.textEditor63:setField("Textoanotacao60");
    obj.textEditor63:setLeft(334.25);
    obj.textEditor63:setTop(276.25);
    obj.textEditor63:setWidth(222);
    obj.textEditor63:setHeight(111);
    obj.textEditor63:setTransparent(true);
    obj.textEditor63:setName("textEditor63");

    obj.textEditor64 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor64:setParent(obj.OqwNave);
    obj.textEditor64:setField("Textoanotacao61");
    obj.textEditor64:setLeft(558.25);
    obj.textEditor64:setTop(276.25);
    obj.textEditor64:setWidth(229);
    obj.textEditor64:setHeight(111);
    obj.textEditor64:setTransparent(true);
    obj.textEditor64:setName("textEditor64");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.OqwNave);
    obj.label32:setField("nivelNave32");
    obj.label32:setLeft(153.12);
    obj.label32:setTop(203.50);
    obj.label32:setWidth(173.62);
    obj.label32:setHeight(47.25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setFontSize(30);
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setText("0");
    obj.label32:setHitTest(true);
    obj.label32:setName("label32");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.OqwNave);
    obj.button32:setText("UP");
    lfm_setPropAsString(obj.button32, "fontStyle",  "bold");
    obj.button32:setFontColor("yellow");
    obj.button32:setLeft(148.75);
    obj.button32:setTop(265.50);
    obj.button32:setWidth(30);
    obj.button32:setHeight(27);
    obj.button32:setName("button32");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.OqwNave);
    obj.layout32:setLeft(1);
    obj.layout32:setTop(1);
    obj.layout32:setWidth(250);
    obj.layout32:setHeight(222);
    obj.layout32:setAlign("client");
    obj.layout32:setName("layout32");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout32);
    obj.edit95:setType("number");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setLeft(519);
    obj.edit95:setTop(112);
    obj.edit95:setWidth(25);
    obj.edit95:setHeight(25);
    obj.edit95:setField("minMin32");
    obj.edit95:setName("edit95");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout32);
    obj.dataLink56:setField("minMin32");
    obj.dataLink56:setName("dataLink56");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout32);
    obj.edit96:setType("number");
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setLeft(548);
    obj.edit96:setTop(112);
    obj.edit96:setWidth(25);
    obj.edit96:setHeight(25);
    obj.edit96:setField("maxMin32");
    obj.edit96:setName("edit96");

    obj.progressBar32 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar32:setParent(obj.layout32);
    obj.progressBar32:setLeft(495);
    obj.progressBar32:setTop(138);
    obj.progressBar32:setWidth(105);
    obj.progressBar32:setHeight(20.50);
    obj.progressBar32:setColor("red");
    obj.progressBar32:setHitTest(true);
    obj.progressBar32:setMax(1);
    obj.progressBar32:setField("usosMin32");
    obj.progressBar32:setName("progressBar32");

    obj.BotaoNaveN25 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN25:setParent(obj.Lnave4);
    obj.BotaoNaveN25:setName("BotaoNaveN25");
    obj.BotaoNaveN25:setText("Ox");
    obj.BotaoNaveN25:setLeft(63.75);
    obj.BotaoNaveN25:setTop(301);
    obj.BotaoNaveN25:setWidth(70.25);
    obj.BotaoNaveN25:setHeight(27);
    obj.BotaoNaveN25:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN25, "fontStyle",  "bold");

    obj.BotaoNaveN26 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN26:setParent(obj.Lnave4);
    obj.BotaoNaveN26:setName("BotaoNaveN26");
    obj.BotaoNaveN26:setText("Oh23");
    obj.BotaoNaveN26:setLeft(138);
    obj.BotaoNaveN26:setTop(301);
    obj.BotaoNaveN26:setWidth(70.25);
    obj.BotaoNaveN26:setHeight(27);
    obj.BotaoNaveN26:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN26, "fontStyle",  "bold");

    obj.BotaoNaveN27 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN27:setParent(obj.Lnave4);
    obj.BotaoNaveN27:setName("BotaoNaveN27");
    obj.BotaoNaveN27:setText("Ox2");
    obj.BotaoNaveN27:setLeft(213);
    obj.BotaoNaveN27:setTop(301);
    obj.BotaoNaveN27:setWidth(70.25);
    obj.BotaoNaveN27:setHeight(27);
    obj.BotaoNaveN27:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN27, "fontStyle",  "bold");

    obj.BotaoNaveN28 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN28:setParent(obj.Lnave4);
    obj.BotaoNaveN28:setName("BotaoNaveN28");
    obj.BotaoNaveN28:setText("OlP");
    obj.BotaoNaveN28:setLeft(63.75);
    obj.BotaoNaveN28:setTop(333);
    obj.BotaoNaveN28:setWidth(70.25);
    obj.BotaoNaveN28:setHeight(27);
    obj.BotaoNaveN28:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN28, "fontStyle",  "bold");

    obj.BotaoNaveN29 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN29:setParent(obj.Lnave4);
    obj.BotaoNaveN29:setName("BotaoNaveN29");
    obj.BotaoNaveN29:setText("Oaz");
    obj.BotaoNaveN29:setLeft(138);
    obj.BotaoNaveN29:setTop(333);
    obj.BotaoNaveN29:setWidth(70.25);
    obj.BotaoNaveN29:setHeight(27);
    obj.BotaoNaveN29:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN29, "fontStyle",  "bold");

    obj.BotaoNaveN30 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN30:setParent(obj.Lnave4);
    obj.BotaoNaveN30:setName("BotaoNaveN30");
    obj.BotaoNaveN30:setText("OjH");
    obj.BotaoNaveN30:setLeft(213);
    obj.BotaoNaveN30:setTop(333);
    obj.BotaoNaveN30:setWidth(70.25);
    obj.BotaoNaveN30:setHeight(27);
    obj.BotaoNaveN30:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN30, "fontStyle",  "bold");

    obj.BotaoNaveN31 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN31:setParent(obj.Lnave4);
    obj.BotaoNaveN31:setName("BotaoNaveN31");
    obj.BotaoNaveN31:setText("OSd");
    obj.BotaoNaveN31:setLeft(63.75);
    obj.BotaoNaveN31:setTop(365);
    obj.BotaoNaveN31:setWidth(70.25);
    obj.BotaoNaveN31:setHeight(27);
    obj.BotaoNaveN31:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN31, "fontStyle",  "bold");

    obj.BotaoNaveN32 = GUI.fromHandle(_obj_newObject("button"));
    obj.BotaoNaveN32:setParent(obj.Lnave4);
    obj.BotaoNaveN32:setName("BotaoNaveN32");
    obj.BotaoNaveN32:setText("Oqw");
    obj.BotaoNaveN32:setLeft(138);
    obj.BotaoNaveN32:setTop(365);
    obj.BotaoNaveN32:setWidth(70.25);
    obj.BotaoNaveN32:setHeight(27);
    obj.BotaoNaveN32:setFontSize(15);
    lfm_setPropAsString(obj.BotaoNaveN32, "fontStyle",  "bold");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.Lnave4);
    obj.dataLink57:setField("nivelNave25");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.Lnave4);
    obj.dataLink58:setField("nivelNave26");
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.Lnave4);
    obj.dataLink59:setField("nivelNave27");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.Lnave4);
    obj.dataLink60:setField("nivelNave28");
    obj.dataLink60:setName("dataLink60");

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.Lnave4);
    obj.dataLink61:setField("nivelNave29");
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.Lnave4);
    obj.dataLink62:setField("nivelNave30");
    obj.dataLink62:setName("dataLink62");

    obj.dataLink63 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.Lnave4);
    obj.dataLink63:setField("nivelNave31");
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.Lnave4);
    obj.dataLink64:setField("nivelNave32");
    obj.dataLink64:setName("dataLink64");

    obj._e_event0 = obj.image2:addEventListener("onClick",
        function (_)
            dialogs.confirmYesNo("Deseja realmente apagar todas as suas naves?",
                    function (confirmado)
                            if confirmado then
            	  sheet.nivelNave1 = 0;
            	  sheet.nivelNave2 = 0;
            	  sheet.nivelNave3 = 0;
            	  sheet.nivelNave4 = 0;
            	  sheet.nivelNave5 = 0;
            	  sheet.nivelNave6 = 0;
            	  sheet.nivelNave7 = 0;
            	  sheet.nivelNave8 = 0;
            	  sheet.nivelNave9 = 0;
            	  sheet.nivelNave10 = 0;
            	  sheet.nivelNave11 = 0;
            	  sheet.nivelNave12 = 0;
            	  sheet.nivelNave13 = 0;
            	  sheet.nivelNave14 = 0;
            	  sheet.nivelNave15 = 0;
            	  sheet.nivelNave16 = 0;
            	  sheet.nivelNave17 = 0;
            	  sheet.nivelNave18 = 0;
            	  sheet.nivelNave19 = 0;
            	  sheet.nivelNave20 = 0;
            	  sheet.nivelNave21 = 0;
            	  sheet.nivelNave22 = 0;
            	  sheet.nivelNave23 = 0;
            	  sheet.nivelNave24 = 0;
            	  sheet.nivelNave25 = 0;
            	  sheet.nivelNave26 = 0;
            	  sheet.nivelNave27 = 0;
            	  sheet.nivelNave28 = 0;
            	  sheet.nivelNave29 = 0;
            	  sheet.nivelNave30 = 0;
            	  sheet.nivelNave31 = 0;
            	  sheet.nivelNave32 = 0;
                  sheet.Textoanotacao1 = ("");
                  sheet.Textoanotacao2 = ("");
                  sheet.Textoanotacao3 = ("");
                  sheet.Textoanotacao4 = ("");
                  sheet.Textoanotacao5 = ("");
                  sheet.Textoanotacao6 = ("");
                  sheet.Textoanotacao7 = ("");
                  sheet.Textoanotacao8 = ("");
                  sheet.Textoanotacao9 = ("");
                  sheet.Textoanotacao10 = ("");
                  sheet.Textoanotacao11 = ("");
                  sheet.Textoanotacao12 = ("");
                  sheet.Textoanotacao13 = ("");
                  sheet.Textoanotacao14 = ("");
                  sheet.Textoanotacao15 = ("");
                  sheet.Textoanotacao16 = ("");
                  sheet.Textoanotacao17 = ("");
                  sheet.Textoanotacao18 = ("");
                  sheet.Textoanotacao19 = ("");
                  sheet.Textoanotacao20 = ("");
                  sheet.Textoanotacao21 = ("");
                  sheet.Textoanotacao22 = ("");
                  sheet.Textoanotacao23 = ("");
                  sheet.Textoanotacao24 = ("");
                  sheet.Textoanotacao25 = ("");
                  sheet.Textoanotacao26 = ("");
                  sheet.Textoanotacao27 = ("");
                  sheet.Textoanotacao28 = ("");
                  sheet.Textoanotacao29 = ("");
                  sheet.Textoanotacao30 = ("");
                  sheet.Textoanotacao31 = ("");
                  sheet.Textoanotacao32 = ("");
                  sheet.Textoanotacao33 = ("");
                  sheet.Textoanotacao34 = ("");
                  sheet.Textoanotacao35 = ("");
                  sheet.Textoanotacao36 = ("");
                  sheet.Textoanotacao37 = ("");
                  sheet.Textoanotacao38 = ("");
                  sheet.Textoanotacao39 = ("");
                  sheet.Textoanotacao40 = ("");
                  sheet.Textoanotacao41 = ("");
                  sheet.Textoanotacao142 = ("");
                  sheet.Textoanotacao43 = ("");
                  sheet.Textoanotacao44 = ("");
                  sheet.Textoanotacao45 = ("");
                  sheet.Textoanotacao46 = ("");
                  sheet.Textoanotacao47 = ("");
                  sheet.Textoanotacao48 = ("");
                  sheet.Textoanotacao49 = ("");
                  sheet.Textoanotacao50 = ("");
                  sheet.Textoanotacao51 = ("");
                  sheet.Textoanotacao52 = ("");
                  sheet.Textoanotacao53 = ("");
                  sheet.Textoanotacao54 = ("");
                  sheet.Textoanotacao55 = ("");
                  sheet.Textoanotacao56 = ("");
                  sheet.Textoanotacao57 = ("");
                  sheet.Textoanotacao58 = ("");
                  sheet.Textoanotacao59 = ("");
                  sheet.Textoanotacao60 = ("");
                  sheet.Textoanotacao61 = ("");
            	  sheet.nomeNave1 = ("");
            	  sheet.nomeNave2 = ("");
            	  sheet.nomeNave3 = ("");
            	  sheet.nomeNave4 = ("");
            	  sheet.nomeNave5 = ("");
            	  sheet.nomeNave6 = ("");
            	  sheet.nomeNave7 = ("");
            	  sheet.nomeNave8 = ("");
            	  sheet.nomeNave9 = ("");
            	  sheet.nomeNave10 = ("");
            	  sheet.nomeNave11 = ("");
            	  sheet.nomeNave12 = ("");
            	  sheet.nomeNave13 = ("");
            	  sheet.nomeNave14 = ("");
            	  sheet.nomeNave15 = ("");
            	  sheet.nomeNave16 = ("");
            	  sheet.nomeNave17 = ("");
            	  sheet.nomeNave18 = ("");
            	  sheet.nomeNave19 = ("");
            	  sheet.nomeNave20 = ("");
            	  sheet.nomeNave21 = ("");
            	  sheet.nomeNave22 = ("");
            	  sheet.nomeNave23 = ("");
            	  sheet.nomeNave24 = ("");
            	  sheet.nomeNave25 = ("");
            	  sheet.nomeNave26 = ("");
            	  sheet.nomeNave27 = ("");
            	  sheet.nomeNave28 = ("");
            	  sheet.nomeNave29 = ("");
            	  sheet.nomeNave30 = ("");
            	  sheet.nomeNave31 = ("");
            	  sheet.nomeNave32 = ("");
            	  sheet.min = 0
            
                            else
                                    -- aqui nada acontece
                            end;
                    end);
        end, obj);

    obj._e_event1 = obj.RNP10:addEventListener("onClick",
        function (_)
            self.RP10.visible = true
            	   self.RNP10.visible = false;
            	   self.RNP13.visible = true;	   
            	   self.RP13.visible = false;	   
            	   self.Lnave1.visible = true;
            	   self.Lnave2.visible = false;
            		self.Lnave3.visible = false;
                   self.Lnave4.visible = false;		
            	   self.RP11.visible = false;
            	   self.RNP11.visible = true;
            	   self.BotaoNaveN1.visible = true;
            	   self.BotaoNaveN2.visible = true;
            	   self.BotaoNaveN3.visible = true;
            	   self.BotaoNaveN4.visible = true;
            	   self.BotaoNaveN5.visible = true;
            	   self.BotaoNaveN6.visible = true;
            	   self.BotaoNaveN7.visible = true;
            	   self.BotaoNaveN8.visible = true;
            	   self.BotaoNaveN9.visible = false;
            	   self.BotaoNaveN10.visible = false;
            	   self.BotaoNaveN11.visible = false;
            	   self.BotaoNaveN12.visible = false;
            	   self.BotaoNaveN13.visible = false;
            	   self.BotaoNaveN14.visible = false;
            	   self.BotaoNaveN15.visible = false;
            	   self.BotaoNaveN16.visible = false;
            	   self.BotaoNaveN17.visible = false;
            	   self.BotaoNaveN18.visible = false;
            	   self.BotaoNaveN19.visible = false;
            	   self.BotaoNaveN20.visible = false;
            	   self.BotaoNaveN21.visible = false;
            	   self.BotaoNaveN22.visible = false;
            	   self.BotaoNaveN23.visible = false;
            	   self.BotaoNaveN24.visible = false;
            	   self.BotaoNaveN25.visible = false;
            	   self.BotaoNaveN26.visible = false;
            	   self.BotaoNaveN27.visible = false;
            	   self.BotaoNaveN28.visible = false;
            	   self.BotaoNaveN29.visible = false;
            	   self.BotaoNaveN30.visible = false;
            	   self.BotaoNaveN31.visible = false;
            	   self.BotaoNaveN32.visible = false;	   
            	   self.RP12.visible = false;
            	   self.RNP12.visible = true;
        end, obj);

    obj._e_event2 = obj.RNP11:addEventListener("onClick",
        function (_)
            self.RP11.visible = true;
            		self.RNP13.visible = true;		
            		self.RP13.visible = false;		
            		self.RNP11.visible = false;
            		self.RNP10.visible = true;
            		self.RP10.visible = false;
            		self.Lnave1.visible = false;
            		self.Lnave1.visible = false;
            		self.Lnave2.visible = true;
            		self.Lnave3.visible = false;	
                   self.Lnave4.visible = false;				
            	    self.BotaoNaveN1.visible = false;
            	    self.BotaoNaveN2.visible = false;
            	    self.BotaoNaveN3.visible = false;
            	    self.BotaoNaveN4.visible = false;
            	    self.BotaoNaveN5.visible = false;
            	    self.BotaoNaveN6.visible = false;
            	    self.BotaoNaveN7.visible = false;
            	    self.BotaoNaveN8.visible = false;
            	   self.BotaoNaveN9.visible = true;
            	   self.BotaoNaveN10.visible = true;
            	   self.BotaoNaveN11.visible = true;
            	   self.BotaoNaveN12.visible = true;
            	   self.BotaoNaveN13.visible = true;
            	   self.BotaoNaveN14.visible = true;
            	   self.BotaoNaveN15.visible = true;
            	   self.BotaoNaveN16.visible = true;
            	   self.BotaoNaveN17.visible = false;
            	   self.BotaoNaveN18.visible = false;
            	   self.BotaoNaveN19.visible = false;
            	   self.BotaoNaveN20.visible = false;
            	   self.BotaoNaveN21.visible = false;
            	   self.BotaoNaveN22.visible = false;
            	   self.BotaoNaveN23.visible = false;
            	   self.BotaoNaveN24.visible = false;	
            	   self.BotaoNaveN25.visible = false;
            	   self.BotaoNaveN26.visible = false;
            	   self.BotaoNaveN27.visible = false;
            	   self.BotaoNaveN28.visible = false;
            	   self.BotaoNaveN29.visible = false;
            	   self.BotaoNaveN30.visible = false;
            	   self.BotaoNaveN31.visible = false;
            	   self.BotaoNaveN32.visible = false;	   
            	           self.RP12.visible = false;
            	   self.RNP12.visible = true;
        end, obj);

    obj._e_event3 = obj.RNP12:addEventListener("onClick",
        function (_)
            self.RP10.visible = false;	
            		self.RNP10.visible = true;	
                    self.RP12.visible = true;
            		self.RP11.visible = false;
            		self.RP13.visible = false;
            		self.RNP12.visible = false;
            		self.RNP11.visible = true;
            		self.RNP12.visible = false;
            		self.RNP13.visible = true;
            		self.Lnave1.visible = false;
            		self.Lnave2.visible = false;
            		self.Lnave3.visible = true;
                   self.Lnave4.visible = false;				
            	    self.BotaoNaveN1.visible = false;
            	    self.BotaoNaveN2.visible = false;
            	    self.BotaoNaveN3.visible = false;
            	    self.BotaoNaveN4.visible = false;
            	    self.BotaoNaveN5.visible = false;
            	    self.BotaoNaveN6.visible = false;
            	    self.BotaoNaveN7.visible = false;
            	    self.BotaoNaveN8.visible = false;
            	   self.BotaoNaveN9.visible = false;
            	   self.BotaoNaveN10.visible = false;
            	   self.BotaoNaveN11.visible = false;
            	   self.BotaoNaveN12.visible = false;
            	   self.BotaoNaveN13.visible = false;
            	   self.BotaoNaveN14.visible = false;
            	   self.BotaoNaveN15.visible = false;
            	   self.BotaoNaveN16.visible = false;		
            	   self.BotaoNaveN17.visible = true;
            	   self.BotaoNaveN18.visible = true;
            	   self.BotaoNaveN19.visible = true;
            	   self.BotaoNaveN20.visible = true;
            	   self.BotaoNaveN21.visible = true;
            	   self.BotaoNaveN22.visible = true;
            	   self.BotaoNaveN23.visible = true;
            	   self.BotaoNaveN24.visible = true;	
            	   self.BotaoNaveN25.visible = false;
            	   self.BotaoNaveN26.visible = false;
            	   self.BotaoNaveN27.visible = false;
            	   self.BotaoNaveN28.visible = false;
            	   self.BotaoNaveN29.visible = false;
            	   self.BotaoNaveN30.visible = false;
            	   self.BotaoNaveN31.visible = false;
            	   self.BotaoNaveN32.visible = false;
        end, obj);

    obj._e_event4 = obj.RNP13:addEventListener("onClick",
        function (_)
            self.RP12.visible = false;
            		self.RP11.visible = false;
            		self.RNP12.visible = true;
            		self.RNP11.visible = true;
            		self.RNP13.visible = false;
            		self.RP10.visible = false;
            		self.RNP10.visible = true;
            		self.Lnave1.visible = false;
            		self.Lnave2.visible = false;
            		self.Lnave3.visible = false;
            	    self.Lnave4.visible = true;		
            		self.RP13.visible = true;
            	    self.BotaoNaveN1.visible = false;
            	    self.BotaoNaveN2.visible = false;
            	    self.BotaoNaveN3.visible = false;
            	    self.BotaoNaveN4.visible = false;
            	    self.BotaoNaveN5.visible = false;
            	    self.BotaoNaveN6.visible = false;
            	    self.BotaoNaveN7.visible = false;
            	    self.BotaoNaveN8.visible = false;
            	   self.BotaoNaveN9.visible = false;
            	   self.BotaoNaveN10.visible = false;
            	   self.BotaoNaveN11.visible = false;
            	   self.BotaoNaveN12.visible = false;
            	   self.BotaoNaveN13.visible = false;
            	   self.BotaoNaveN14.visible = false;
            	   self.BotaoNaveN15.visible = false;
            	   self.BotaoNaveN16.visible = false;
            	   self.BotaoNaveN17.visible = false;
            	   self.BotaoNaveN18.visible = false;
            	   self.BotaoNaveN19.visible = false;
            	   self.BotaoNaveN20.visible = false;
            	   self.BotaoNaveN21.visible = false;
            	   self.BotaoNaveN22.visible = false;
            	   self.BotaoNaveN23.visible = false;
            	   self.BotaoNaveN24.visible = true;
            	   self.BotaoNaveN25.visible = true;
            	   self.BotaoNaveN26.visible = true;
            	   self.BotaoNaveN27.visible = true;
            	   self.BotaoNaveN28.visible = true;
            	   self.BotaoNaveN29.visible = true;
            	   self.BotaoNaveN30.visible = true;
            	   self.BotaoNaveN31.visible = true;
            	   self.BotaoNaveN32.visible = true;
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            sheet.nivelNave1 = (sheet.nivelNave1 or 0) +0.2;
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave1 = (sheet.nivelNave1 or 0) -0.2;
        end, obj);

    obj._e_event7 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin1~=nil and sheet.maxMin1~=nil and sheet.usosMin1~=nil then
            						sheet.usosMin1 = (sheet.minMin1 or 0)/ (sheet.maxMin1 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave1 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave1 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin1 = 0;
            					end;
        end, obj);

    obj._e_event8 = obj.edit3:addEventListener("onUserChange",
        function (_)
            if sheet.minMin1~=nil and sheet.maxMin1~=nil then
            						sheet.usosMin1 = (sheet.minMin1 or 0)/ (sheet.maxMin1 or 0);
            					end;
        end, obj);

    obj._e_event9 = obj.button2:addEventListener("onClick",
        function (_)
            sheet.nivelNave2 = (sheet.nivelNave2 or 0) +0.2;
        end, obj);

    obj._e_event10 = obj.button2:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave2 = (sheet.nivelNave2 or 0) -0.2;
        end, obj);

    obj._e_event11 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin2~=nil and sheet.maxMin2~=nil and sheet.usosMin2~=nil then
            						sheet.usosMin2 = (sheet.minMin2 or 0)/ (sheet.maxMin2 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave2 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave2 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin2 = 0;
            					end;
        end, obj);

    obj._e_event12 = obj.edit6:addEventListener("onUserChange",
        function (_)
            if sheet.minMin2~=nil and sheet.maxMin2~=nil then
            						sheet.usosMin2 = (sheet.minMin2 or 0)/ (sheet.maxMin2 or 0);
            					end;
        end, obj);

    obj._e_event13 = obj.button3:addEventListener("onClick",
        function (_)
            sheet.nivelNave3 = (sheet.nivelNave3 or 0) +0.2;
        end, obj);

    obj._e_event14 = obj.button3:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave3 = (sheet.nivelNave3 or 0) -0.2;
        end, obj);

    obj._e_event15 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin3~=nil and sheet.maxMin3~=nil and sheet.usosMin3~=nil then
            						sheet.usosMin3 = (sheet.minMin3 or 0)/ (sheet.maxMin3 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave3 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave3 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin3 = 0;
            					end;
        end, obj);

    obj._e_event16 = obj.edit9:addEventListener("onUserChange",
        function (_)
            if sheet.minMin3~=nil and sheet.maxMin3~=nil then
            						sheet.usosMin3 = (sheet.minMin3 or 0)/ (sheet.maxMin3 or 0);
            					end;
        end, obj);

    obj._e_event17 = obj.button4:addEventListener("onClick",
        function (_)
            sheet.nivelNave4 = (sheet.nivelNave4 or 0) +0.2;
        end, obj);

    obj._e_event18 = obj.button4:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave4 = (sheet.nivelNave4 or 0) -0.2;
        end, obj);

    obj._e_event19 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin4~=nil and sheet.maxMin4~=nil and sheet.usosMin4~=nil then
            						sheet.usosMin4 = (sheet.minMin4 or 0)/ (sheet.maxMin4 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave4 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave4 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin4 = 0;
            					end;
        end, obj);

    obj._e_event20 = obj.edit12:addEventListener("onUserChange",
        function (_)
            if sheet.minMin4~=nil and sheet.maxMin4~=nil then
            						sheet.usosMin4 = (sheet.minMin4 or 0)/ (sheet.maxMin4 or 0);
            					end;
        end, obj);

    obj._e_event21 = obj.button5:addEventListener("onClick",
        function (_)
            sheet.nivelNave5 = (sheet.nivelNave5 or 0) +0.2;
        end, obj);

    obj._e_event22 = obj.button5:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave5 = (sheet.nivelNave5 or 0) -0.2;
        end, obj);

    obj._e_event23 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin5~=nil and sheet.maxMin5~=nil and sheet.usosMin5~=nil then
            						sheet.usosMin5 = (sheet.minMin5 or 0)/ (sheet.maxMin5 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave5 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave5 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin5 = 0;
            					end;
        end, obj);

    obj._e_event24 = obj.edit15:addEventListener("onUserChange",
        function (_)
            if sheet.minMin5~=nil and sheet.maxMin5~=nil then
            						sheet.usosMin5 = (sheet.minMin5 or 0)/ (sheet.maxMin5 or 0);
            					end;
        end, obj);

    obj._e_event25 = obj.button6:addEventListener("onClick",
        function (_)
            sheet.nivelNave6 = (sheet.nivelNave6 or 0) +0.2;
        end, obj);

    obj._e_event26 = obj.button6:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave6 = (sheet.nivelNave6 or 0) -0.2;
        end, obj);

    obj._e_event27 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin6~=nil and sheet.maxMin6~=nil and sheet.usosMin6~=nil then
            						sheet.usosMin6 = (sheet.minMin6 or 0)/ (sheet.maxMin6 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave6 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave6 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin6 = 0;
            					end;
        end, obj);

    obj._e_event28 = obj.edit18:addEventListener("onUserChange",
        function (_)
            if sheet.minMin6~=nil and sheet.maxMin6~=nil then
            						sheet.usosMin6 = (sheet.minMin6 or 0)/ (sheet.maxMin6 or 0);
            					end;
        end, obj);

    obj._e_event29 = obj.button7:addEventListener("onClick",
        function (_)
            sheet.nivelNave7 = (sheet.nivelNave7 or 0) +0.2;
        end, obj);

    obj._e_event30 = obj.button7:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave7 = (sheet.nivelNave7 or 0) -0.2;
        end, obj);

    obj._e_event31 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin7~=nil and sheet.maxMin7~=nil and sheet.usosMin7~=nil then
            						sheet.usosMin7 = (sheet.minMin7 or 0)/ (sheet.maxMin7 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave7 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave7 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin7 = 0;
            					end;
        end, obj);

    obj._e_event32 = obj.edit21:addEventListener("onUserChange",
        function (_)
            if sheet.minMin7~=nil and sheet.maxMin7~=nil then
            						sheet.usosMin7 = (sheet.minMin7 or 0)/ (sheet.maxMin7 or 0);
            					end;
        end, obj);

    obj._e_event33 = obj.button8:addEventListener("onClick",
        function (_)
            sheet.nivelNave8 = (sheet.nivelNave8 or 0) +0.2;
        end, obj);

    obj._e_event34 = obj.button8:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave8 = (sheet.nivelNave8 or 0) -0.2;
        end, obj);

    obj._e_event35 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin8~=nil and sheet.maxMin8~=nil and sheet.usosMin8~=nil then
            						sheet.usosMin8 = (sheet.minMin8 or 0)/ (sheet.maxMin8 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave8 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave8 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin8 = 0;
            					end;
        end, obj);

    obj._e_event36 = obj.edit24:addEventListener("onUserChange",
        function (_)
            if sheet.minMin8~=nil and sheet.maxMin8~=nil then
            						sheet.usosMin8 = (sheet.minMin8 or 0)/ (sheet.maxMin8 or 0);
            					end;
        end, obj);

    obj._e_event37 = obj.BotaoNaveN1:addEventListener("onClick",
        function (_)
            self.HjQNave.visible = true;
            		self.HnmNave.visible = false
            		self.HppNave.visible = false;
            		self.HjKLNave.visible = false;
            		self.HccDNave.visible = false
            		self.H2bNave.visible = false;
            		self.HhOpNave.visible = false;
            		self.H3oNave.visible = false;
        end, obj);

    obj._e_event38 = obj.BotaoNaveN2:addEventListener("onClick",
        function (_)
            self.HjQNave.visible = false;
            		self.HnmNave.visible = true
            		self.HppNave.visible = false;
            		self.HjKLNave.visible = false;
            		self.HccDNave.visible = false
            		self.H2bNave.visible = false;
            		self.HhOpNave.visible = false;
            		self.H3oNave.visible = false;
        end, obj);

    obj._e_event39 = obj.BotaoNaveN3:addEventListener("onClick",
        function (_)
            self.HjQNave.visible = false;
            		self.HnmNave.visible = false
            		self.HppNave.visible = true;
            		self.HjKLNave.visible = false;
            		self.HccDNave.visible = false
            		self.H2bNave.visible = false;
            		self.HhOpNave.visible = false;
            		self.H3oNave.visible = false;
        end, obj);

    obj._e_event40 = obj.BotaoNaveN4:addEventListener("onClick",
        function (_)
            self.HjQNave.visible = false;
            		self.HnmNave.visible = false
            		self.HppNave.visible = false;
            		self.HjKLNave.visible = true;
            		self.HccDNave.visible = false
            		self.H2bNave.visible = false;
            		self.HhOpNave.visible = false;
            		self.H3oNave.visible = false;
        end, obj);

    obj._e_event41 = obj.BotaoNaveN5:addEventListener("onClick",
        function (_)
            self.HjQNave.visible = false;
            		self.HnmNave.visible = false
            		self.HppNave.visible = false;
            		self.HjKLNave.visible = false;
            		self.HccDNave.visible = true
            		self.H2bNave.visible = false;
            		self.HhOpNave.visible = false;
            		self.H3oNave.visible = false;
        end, obj);

    obj._e_event42 = obj.BotaoNaveN6:addEventListener("onClick",
        function (_)
            self.HjQNave.visible = false;
            		self.HnmNave.visible = false
            		self.HppNave.visible = false;
            		self.HjKLNave.visible = false;
            		self.HccDNave.visible = false
            		self.H2bNave.visible = true;
            		self.HhOpNave.visible = false;
            		self.H3oNave.visible = false;
        end, obj);

    obj._e_event43 = obj.BotaoNaveN7:addEventListener("onClick",
        function (_)
            self.HjQNave.visible = false;
            		self.HnmNave.visible = false
            		self.HppNave.visible = false;
            		self.HjKLNave.visible = false;
            		self.HccDNave.visible = false
            		self.H2bNave.visible = false;
            		self.HhOpNave.visible = true;
            		self.H3oNave.visible = false;
        end, obj);

    obj._e_event44 = obj.BotaoNaveN8:addEventListener("onClick",
        function (_)
            self.HjQNave.visible = false;
            		self.HnmNave.visible = false
            		self.HppNave.visible = false;
            		self.HjKLNave.visible = false;
            		self.HccDNave.visible = false
            		self.H2bNave.visible = false;
            		self.HhOpNave.visible = false;
            		self.H3oNave.visible = true;
        end, obj);

    obj._e_event45 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave1 >= 10 then
            		  self.HjQ1.visible = false;
            		  self.HjQ2.visible = true;
            		else
            		 self.HjQ1.visible = true;
            		 self.HjQ2.visible = false;
            		 end;
                     if sheet.nivelNave1 >= 20 then
            		  self.HjQ2.visible = false;
            		  self.HjQ3.visible = true;
            		else
            		  self.HjQ3.visible = false;
            		 end;
                     if sheet.nivelNave1 >= 30 then
            		 self.HjQ3.visible = false;
            		 self.HjQ4.visible = true;
            		else
            		 self.HjQ4.visible = false;
            		end;
                     if sheet.nivelNave1 >= 40 then
            		 self.HjQ4.visible = false;
            		 self.HjQ5.visible = true;
            		else
            		 self.HjQ5.visible = false;
            		end;	
                     if sheet.nivelNave1 >= 50 then
            		 self.HjQ5.visible = false;
            		 self.HjQ6.visible = true;
            		else
            		 self.HjQ6.visible = false;
            		end;
                     if sheet.nivelNave1 >= 60 then
            		 self.HjQ6.visible = false;
            		 self.HjQ7.visible = true;
            		else
            		 self.HjQ7.visible = false;
            		end;
                     if sheet.nivelNave1 >= 70 then
            		 self.HjQ7.visible = false;
            		 self.HjQ8.visible = true;
            		else
            		 self.HjQ8.visible = false;
            		end;
        end, obj);

    obj._e_event46 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave2 >= 10 then
            		  self.Hnm1.visible = false;
            		  self.Hnm2.visible = true;
            		else
            		 self.Hnm1.visible = true;
            		 self.Hnm2.visible = false;
            		 end;
                     if sheet.nivelNave2 >= 20 then
            		  self.Hnm2.visible = false;
            		  self.Hnm3.visible = true;
            		else
            		  self.Hnm3.visible = false;
            		 end;
                     if sheet.nivelNave2 >= 30 then
            		 self.Hnm3.visible = false;
            		 self.Hnm4.visible = true;
            		else
            		 self.Hnm4.visible = false;
            		end;
                     if sheet.nivelNave2 >= 40 then
            		 self.Hnm4.visible = false;
            		 self.Hnm5.visible = true;
            		else
            		 self.Hnm5.visible = false;
            		end;	
                     if sheet.nivelNave2 >= 50 then
            		 self.Hnm5.visible = false;
            		 self.Hnm6.visible = true;
            		else
            		 self.Hnm6.visible = false;
            		end;
                     if sheet.nivelNave2 >= 60 then
            		 self.Hnm6.visible = false;
            		 self.Hnm7.visible = true;
            		else
            		 self.Hnm7.visible = false;
            		end;
                     if sheet.nivelNave2 >= 70 then
            		 self.Hnm7.visible = false;
            		 self.Hnm8.visible = true;
            		else
            		 self.Hnm8.visible = false;
            		end;
        end, obj);

    obj._e_event47 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave3 >= 10 then
            		  self.Hpp1.visible = false;
            		  self.Hpp2.visible = true;
            		else
            		 self.Hpp1.visible = true;
            		 self.Hpp2.visible = false;
            		 end;
                     if sheet.nivelNave3 >= 20 then
            		  self.Hpp2.visible = false;
            		  self.Hpp3.visible = true;
            		else
            		  self.Hpp3.visible = false;
            		 end;
                     if sheet.nivelNave3 >= 30 then
            		 self.Hpp3.visible = false;
            		 self.Hpp4.visible = true;
            		else
            		 self.Hpp4.visible = false;
            		end;
                     if sheet.nivelNave3 >= 40 then
            		 self.Hpp4.visible = false;
            		 self.Hpp5.visible = true;
            		else
            		 self.Hpp5.visible = false;
            		end;	
                     if sheet.nivelNave3 >= 50 then
            		 self.Hpp5.visible = false;
            		 self.Hpp6.visible = true;
            		else
            		 self.Hpp6.visible = false;
            		end;
                     if sheet.nivelNave3 >= 60 then
            		 self.Hpp6.visible = false;
            		 self.Hpp7.visible = true;
            		else
            		 self.Hpp7.visible = false;
            		end;
                     if sheet.nivelNave3 >= 70 then
            		 self.Hpp7.visible = false;
            		 self.Hpp8.visible = true;
            		else
            		 self.Hpp8.visible = false;
            		end;
        end, obj);

    obj._e_event48 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave4 >= 10 then
            		  self.HjKL1.visible = false;
            		  self.HjKL2.visible = true;
            		else
            		 self.HjKL1.visible = true;
            		 self.HjKL2.visible = false;
            		 end;
                     if sheet.nivelNave4 >= 20 then
            		  self.HjKL2.visible = false;
            		  self.HjKL3.visible = true;
            		else
            		  self.HjKL3.visible = false;
            		 end;
                     if sheet.nivelNave4 >= 30 then
            		 self.HjKL3.visible = false;
            		 self.HjKL4.visible = true;
            		else
            		 self.HjKL4.visible = false;
            		end;
                     if sheet.nivelNave4 >= 40 then
            		 self.HjKL4.visible = false;
            		 self.HjKL5.visible = true;
            		else
            		 self.HjKL5.visible = false;
            		end;	
                     if sheet.nivelNave4 >= 50 then
            		 self.HjKL5.visible = false;
            		 self.HjKL6.visible = true;
            		else
            		 self.HjKL6.visible = false;
            		end;
                     if sheet.nivelNave4 >= 60 then
            		 self.HjKL6.visible = false;
            		 self.HjKL7.visible = true;
            		else
            		 self.HjKL7.visible = false;
            		end;
                     if sheet.nivelNave4 >= 70 then
            		 self.HjKL7.visible = false;
            		 self.HjKL8.visible = true;
            		else
            		 self.HjKL8.visible = false;
            		end;
        end, obj);

    obj._e_event49 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave5 >= 10 then
            		  self.HccD1.visible = false;
            		  self.HccD2.visible = true;
            		else
            		 self.HccD1.visible = true;
            		 self.HccD2.visible = false;
            		 end;
                     if sheet.nivelNave5 >= 20 then
            		  self.HccD2.visible = false;
            		  self.HccD3.visible = true;
            		else
            		  self.HccD3.visible = false;
            		 end;
                     if sheet.nivelNave5 >= 30 then
            		 self.HccD3.visible = false;
            		 self.HccD4.visible = true;
            		else
            		 self.HccD4.visible = false;
            		end;
                     if sheet.nivelNave5 >= 40 then
            		 self.HccD4.visible = false;
            		 self.HccD5.visible = true;
            		else
            		 self.HccD5.visible = false;
            		end;	
                     if sheet.nivelNave5 >= 50 then
            		 self.HccD5.visible = false;
            		 self.HccD6.visible = true;
            		else
            		 self.HccD6.visible = false;
            		end;
                     if sheet.nivelNave5 >= 60 then
            		 self.HccD6.visible = false;
            		 self.HccD7.visible = true;
            		else
            		 self.HccD7.visible = false;
            		end;
                     if sheet.nivelNave5 >= 70 then
            		 self.HccD7.visible = false;
            		 self.HccD8.visible = true;
            		else
            		 self.HccD8.visible = false;
            		end;
        end, obj);

    obj._e_event50 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave6 >= 10 then
            		  self.H2b1.visible = false;
            		  self.H2b2.visible = true;
            		else
            		 self.H2b1.visible = true;
            		 self.H2b2.visible = false;
            		 end;
                     if sheet.nivelNave6 >= 20 then
            		  self.H2b2.visible = false;
            		  self.H2b3.visible = true;
            		else
            		  self.H2b3.visible = false;
            		 end;
                     if sheet.nivelNave6 >= 30 then
            		 self.H2b3.visible = false;
            		 self.H2b4.visible = true;
            		else
            		 self.H2b4.visible = false;
            		end;
                     if sheet.nivelNave6 >= 40 then
            		 self.H2b4.visible = false;
            		 self.H2b5.visible = true;
            		else
            		 self.H2b5.visible = false;
            		end;	
                     if sheet.nivelNave6 >= 50 then
            		 self.H2b5.visible = false;
            		 self.H2b6.visible = true;
            		else
            		 self.H2b6.visible = false;
            		end;
                     if sheet.nivelNave6 >= 60 then
            		 self.H2b6.visible = false;
            		 self.H2b7.visible = true;
            		else
            		 self.H2b7.visible = false;
            		end;
                     if sheet.nivelNave6 >= 70 then
            		 self.H2b7.visible = false;
            		 self.H2b8.visible = true;
            		else
            		 self.H2b8.visible = false;
            		end;
        end, obj);

    obj._e_event51 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave7 >= 10 then
            		  self.HhOp1.visible = false;
            		  self.HhOp2.visible = true;
            		else
            		 self.HhOp1.visible = true;
            		 self.HhOp2.visible = false;
            		 end;
                     if sheet.nivelNave7 >= 20 then
            		  self.HhOp2.visible = false;
            		  self.HhOp2.visible = true;
            		else
            		  self.HhOp3.visible = false;
            		 end;
                     if sheet.nivelNave7 >= 30 then
            		 self.HhOp3.visible = false;
            		 self.HhOp4.visible = true;
            		else
            		 self.HhOp4.visible = false;
            		end;
                     if sheet.nivelNave7 >= 40 then
            		 self.HhOp4.visible = false;
            		 self.HhOp5.visible = true;
            		else
            		 self.HhOp5.visible = false;
            		end;	
                     if sheet.nivelNave7 >= 50 then
            		 self.HhOp5.visible = false;
            		 self.HhOp6.visible = true;
            		else
            		 self.HhOp6.visible = false;
            		end;
                     if sheet.nivelNave7 >= 60 then
            		 self.HhOp6.visible = false;
            		 self.HhOp7.visible = true;
            		else
            		 self.HhOp7.visible = false;
            		end;
                     if sheet.nivelNave7 >= 70 then
            		 self.HhOp7.visible = false;
            		 self.HhOp7.visible = true;
            		else
            		 self.HhOp8.visible = false;
            		end;
        end, obj);

    obj._e_event52 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave8 >= 10 then
            		  self.H3o1.visible = false;
            		  self.H3o2.visible = true;
            		else
            		 self.H3o1.visible = true;
            		 self.H3o2.visible = false;
            		 end;
                     if sheet.nivelNave8 >= 20 then
            		  self.H3o2.visible = false;
            		  self.H3o3.visible = true;
            		else
            		  self.H3o3.visible = false;
            		 end;
                     if sheet.nivelNave8 >= 30 then
            		 self.H3o3.visible = false;
            		 self.H3o4.visible = true;
            		else
            		 self.H3o4.visible = false;
            		end;
                     if sheet.nivelNave8 >= 40 then
            		 self.H3o4.visible = false;
            		 self.H3o5.visible = true;
            		else
            		 self.H3o5.visible = false;
            		end;	
                     if sheet.nivelNave8 >= 50 then
            		 self.H3o5.visible = false;
            		 self.H3o6.visible = true;
            		else
            		 self.H3o6.visible = false;
            		end;
                     if sheet.nivelNave8 >= 60 then
            		 self.H3o6.visible = false;
            		 self.H3o7.visible = true;
            		else
            		 self.H3o7.visible = false;
            		end;
                     if sheet.nivelNave8 >= 70 then
            		 self.H3o7.visible = false;
            		 self.H3o8.visible = true;
            		else
            		 self.H3o8.visible = false;
            		end;
        end, obj);

    obj._e_event53 = obj.label9:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave9 = (sheet.nivelNave9 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event54 = obj.button9:addEventListener("onClick",
        function (_)
            if sheet.nivelNave9 >= 70 then
            		 	   sheet.nivelNave9 = (sheet.nivelNave9 or 0) +0;
            		 else
            	   sheet.nivelNave9 = (sheet.nivelNave9 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event55 = obj.button9:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave9 = (sheet.nivelNave9 or 0) -0.2;
        end, obj);

    obj._e_event56 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin9~=nil and sheet.maxMin9~=nil and sheet.usosMin9~=nil then
            						sheet.usosMin9 = (sheet.minMin9 or 0)/ (sheet.maxMin9 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave9 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave9 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin9 = 0;
            					end;
        end, obj);

    obj._e_event57 = obj.edit27:addEventListener("onUserChange",
        function (_)
            if sheet.minMin9~=nil and sheet.maxMin9~=nil then
            						sheet.usosMin9 = (sheet.minMin9 or 0)/ (sheet.maxMin9 or 0);
            					end;
        end, obj);

    obj._e_event58 = obj.label10:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave10 = (sheet.nivelNave10 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event59 = obj.button10:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            	 end;
            	    if sheet.nivelNave10 >= 70 then
            		 	   sheet.nivelNave10 = (sheet.nivelNave10 or 0) +0;
            		 else
            	   sheet.nivelNave10 = (sheet.nivelNave10 or 0) +0.2;
            	 end;
        end, obj);

    obj._e_event60 = obj.button10:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave10 = (sheet.nivelNave10 or 0) -0.2;
        end, obj);

    obj._e_event61 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin10~=nil and sheet.maxMin10~=nil and sheet.usosMin10~=nil then
            						sheet.usosMin10 = (sheet.minMin10 or 0)/ (sheet.maxMin10 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave10 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave10 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin10 = 0;
            					end;
        end, obj);

    obj._e_event62 = obj.edit30:addEventListener("onUserChange",
        function (_)
            if sheet.minMin10~=nil and sheet.maxMin10~=nil then
            						sheet.usosMin10 = (sheet.minMin10 or 0)/ (sheet.maxMin10 or 0);
            					end;
        end, obj);

    obj._e_event63 = obj.label11:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave11 = (sheet.nivelNave11 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event64 = obj.button11:addEventListener("onClick",
        function (_)
            if sheet.nivelNave11 >= 70 then
            		 	   sheet.nivelNave11 = (sheet.nivelNave11 or 0) +0;
            		 else
            	   sheet.nivelNave11 = (sheet.nivelNave11 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event65 = obj.button11:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave11 = (sheet.nivelNave11 or 0) -0.2;
        end, obj);

    obj._e_event66 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin11~=nil and sheet.maxMin11~=nil and sheet.usosMin11~=nil then
            						sheet.usosMin11 = (sheet.minMin11 or 0)/ (sheet.maxMin11 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave11 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave11 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin11 = 0;
            					end;
        end, obj);

    obj._e_event67 = obj.edit33:addEventListener("onUserChange",
        function (_)
            if sheet.minMin11~=nil and sheet.maxMin11~=nil then
            						sheet.usosMin11 = (sheet.minMin11 or 0)/ (sheet.maxMin11 or 0);
            					end;
        end, obj);

    obj._e_event68 = obj.label12:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave12 = (sheet.nivelNave12 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event69 = obj.button12:addEventListener("onClick",
        function (_)
            if sheet.nivelNave12 >= 70 then
            		 	   sheet.nivelNave12 = (sheet.nivelNave12 or 0) +0;
            		 else
            	   sheet.nivelNave12 = (sheet.nivelNave12 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event70 = obj.button12:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave12 = (sheet.nivelNave12 or 0) -0.2;
        end, obj);

    obj._e_event71 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin12~=nil and sheet.maxMin12~=nil and sheet.usosMin12~=nil then
            						sheet.usosMin12 = (sheet.minMin12 or 0)/ (sheet.maxMin12 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave12 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave12 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin12 = 0;
            					end;
        end, obj);

    obj._e_event72 = obj.edit36:addEventListener("onUserChange",
        function (_)
            if sheet.minMin12~=nil and sheet.maxMin12~=nil then
            						sheet.usosMin12 = (sheet.minMin12 or 0)/ (sheet.maxMin12 or 0);
            					end;
        end, obj);

    obj._e_event73 = obj.label13:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave13 = (sheet.nivelNave13 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event74 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet.nivelNave13 >= 70 then
            		 	   sheet.nivelNave13 = (sheet.nivelNave13 or 0) +0;
            		 else
            	   sheet.nivelNave13 = (sheet.nivelNave13 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event75 = obj.button13:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave13 = (sheet.nivelNave13 or 0) -0.2;
        end, obj);

    obj._e_event76 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin13~=nil and sheet.maxMin13~=nil and sheet.usosMin13~=nil then
            						sheet.usosMin13 = (sheet.minMin13 or 0)/ (sheet.maxMin13 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave13 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave13 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin13 = 0;
            					end;
        end, obj);

    obj._e_event77 = obj.edit39:addEventListener("onUserChange",
        function (_)
            if sheet.minMin13~=nil and sheet.maxMin13~=nil then
            						sheet.usosMin13 = (sheet.minMin13 or 0)/ (sheet.maxMin13 or 0);
            					end;
        end, obj);

    obj._e_event78 = obj.label14:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave14 = (sheet.nivelNave14 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event79 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet.nivelNave14 >= 70 then
            		 	   sheet.nivelNave14 = (sheet.nivelNave14 or 0) +0;
            		 else
            	   sheet.nivelNave14 = (sheet.nivelNave14 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event80 = obj.button14:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave14 = (sheet.nivelNave14 or 0) -0.2;
        end, obj);

    obj._e_event81 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin14~=nil and sheet.maxMin14~=nil and sheet.usosMin14~=nil then
            						sheet.usosMin14 = (sheet.minMin14 or 0)/ (sheet.maxMin14 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave14 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave14 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin14 = 0;
            					end;
        end, obj);

    obj._e_event82 = obj.edit42:addEventListener("onUserChange",
        function (_)
            if sheet.minMin14~=nil and sheet.maxMin14~=nil then
            						sheet.usosMin14 = (sheet.minMin14 or 0)/ (sheet.maxMin14 or 0);
            					end;
        end, obj);

    obj._e_event83 = obj.label15:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave15 = (sheet.nivelNave15 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event84 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet.nivelNave15 >= 70 then
            		 	   sheet.nivelNave15 = (sheet.nivelNave15 or 0) +0;
            		 else
            	   sheet.nivelNave15 = (sheet.nivelNave15 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event85 = obj.button15:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave15 = (sheet.nivelNave15 or 0) -0.2;
        end, obj);

    obj._e_event86 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin15~=nil and sheet.maxMin15~=nil and sheet.usosMin15~=nil then
            						sheet.usosMin15 = (sheet.minMin15 or 0)/ (sheet.maxMin15 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave15 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave15 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin15 = 0;
            					end;
        end, obj);

    obj._e_event87 = obj.edit45:addEventListener("onUserChange",
        function (_)
            if sheet.minMin15~=nil and sheet.maxMin15~=nil then
            						sheet.usosMin15 = (sheet.minMin15 or 0)/ (sheet.maxMin15 or 0);
            					end;
        end, obj);

    obj._e_event88 = obj.label16:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave16 = (sheet.nivelNave16 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event89 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet.nivelNave16 >= 70 then
            		 	   sheet.nivelNave16 = (sheet.nivelNave16 or 0) +0;
            		 else
            	   sheet.nivelNave16 = (sheet.nivelNave16 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event90 = obj.button16:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave16 = (sheet.nivelNave16 or 0) -0.2;
        end, obj);

    obj._e_event91 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin16~=nil and sheet.maxMin16~=nil and sheet.usosMin16~=nil then
            						sheet.usosMin16 = (sheet.minMin16 or 0)/ (sheet.maxMin16 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave16 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave16 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin16 = 0;
            					end;
        end, obj);

    obj._e_event92 = obj.edit48:addEventListener("onUserChange",
        function (_)
            if sheet.minMin16~=nil and sheet.maxMin16~=nil then
            						sheet.usosMin16 = (sheet.minMin16 or 0)/ (sheet.maxMin16 or 0);
            					end;
        end, obj);

    obj._e_event93 = obj.BotaoNaveN9:addEventListener("onClick",
        function (_)
            self.LqwNave.visible = true;
            		self.LDaNave.visible = false
            		self.LhnNave.visible = false;
            		self.LjNNave.visible = false;
            		self.LaHNave.visible = false
            		self.LmHNave.visible = false;
            		self.LbAnNave.visible = false;
            		self.LgUNave.visible = false;
        end, obj);

    obj._e_event94 = obj.BotaoNaveN10:addEventListener("onClick",
        function (_)
            self.LqwNave.visible = false;
            		self.LDaNave.visible = true
            		self.LhnNave.visible = false;
            		self.LjNNave.visible = false;
            		self.LaHNave.visible = false
            		self.LmHNave.visible = false;
            		self.LbAnNave.visible = false;
            		self.LgUNave.visible = false;
        end, obj);

    obj._e_event95 = obj.BotaoNaveN11:addEventListener("onClick",
        function (_)
            self.LqwNave.visible = false;
            		self.LDaNave.visible = false
            		self.LhnNave.visible = true;
            		self.LjNNave.visible = false;
            		self.LaHNave.visible = false
            		self.LmHNave.visible = false;
            		self.LbAnNave.visible = false;
            		self.LgUNave.visible = false;
        end, obj);

    obj._e_event96 = obj.BotaoNaveN12:addEventListener("onClick",
        function (_)
            self.LqwNave.visible = false;
            		self.LDaNave.visible = false
            		self.LhnNave.visible = false;
            		self.LjNNave.visible = true;
            		self.LaHNave.visible = false
            		self.LmHNave.visible = false;
            		self.LbAnNave.visible = false;
            		self.LgUNave.visible = false;
        end, obj);

    obj._e_event97 = obj.BotaoNaveN13:addEventListener("onClick",
        function (_)
            self.LqwNave.visible = false;
            		self.LDaNave.visible = false
            		self.LhnNave.visible = false;
            		self.LjNNave.visible = false;
            		self.LaHNave.visible = true
            		self.LmHNave.visible = false;
            		self.LbAnNave.visible = false;
            		self.LgUNave.visible = false;
        end, obj);

    obj._e_event98 = obj.BotaoNaveN14:addEventListener("onClick",
        function (_)
            self.LqwNave.visible = false;
            		self.LDaNave.visible = false
            		self.LhnNave.visible = false;
            		self.LjNNave.visible = false;
            		self.LaHNave.visible = false
            		self.LmHNave.visible = true;
            		self.LbAnNave.visible = false;
            		self.LgUNave.visible = false;
        end, obj);

    obj._e_event99 = obj.BotaoNaveN15:addEventListener("onClick",
        function (_)
            self.LqwNave.visible = false;
            		self.LDaNave.visible = false
            		self.LhnNave.visible = false;
            		self.LjNNave.visible = false;
            		self.LaHNave.visible = false
            		self.LmHNave.visible = false;
            		self.LbAnNave.visible = true;
            		self.LgUNave.visible = false;
        end, obj);

    obj._e_event100 = obj.BotaoNaveN16:addEventListener("onClick",
        function (_)
            self.LqwNave.visible = false;
            		self.LDaNave.visible = false
            		self.LhnNave.visible = false;
            		self.LjNNave.visible = false;
            		self.LaHNave.visible = false
            		self.LmHNave.visible = false;
            		self.LbAnNave.visible = false;
            		self.LgUNave.visible = true;
        end, obj);

    obj._e_event101 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave9 >= 10 then
            		  self.Lqw1.visible = false;
            		  self.Lqw2.visible = true;
            		else
            		 self.Lqw1.visible = true;
            		 self.Lqw2.visible = false;
            		 end;
                     if sheet.nivelNave9 >= 20 then
            		  self.Lqw2.visible = false;
            		  self.Lqw3.visible = true;
            		else
            		  self.Lqw3.visible = false;
            		 end;
                     if sheet.nivelNave9 >= 30 then
            		 self.Lqw3.visible = false;
            		 self.Lqw4.visible = true;
            		else
            		 self.Lqw4.visible = false;
            		end;
                     if sheet.nivelNave9 >= 40 then
            		 self.Lqw4.visible = false;
            		 self.Lqw5.visible = true;
            		else
            		 self.Lqw5.visible = false;
            		end;	
                     if sheet.nivelNave9 >= 50 then
            		 self.Lqw5.visible = false;
            		 self.Lqw6.visible = true;
            		else
            		 self.Lqw6.visible = false;
            		end;
                     if sheet.nivelNave9 >= 60 then
            		 self.Lqw6.visible = false;
            		 self.Lqw7.visible = true;
            		else
            		 self.Lqw7.visible = false;
            		end;
                     if sheet.nivelNave9 >= 70 then
            		 self.Lqw7.visible = false;
            		 self.Lqw8.visible = true;
            		else
            		 self.Lqw8.visible = false;
            		end;
        end, obj);

    obj._e_event102 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave10 >= 10 then
            		  self.LDa1.visible = false;
            		  self.LDa2.visible = true;
            		else
            		 self.LDa1.visible = true;
            		 self.LDa2.visible = false;
            		 end;
                     if sheet.nivelNave10 >= 20 then
            		  self.LDa2.visible = false;
            		  self.LDa3.visible = true;
            		else
            		  self.LDa3.visible = false;
            		 end;
                     if sheet.nivelNave10 >= 30 then
            		 self.LDa3.visible = false;
            		 self.LDa4.visible = true;
            		else
            		 self.LDa4.visible = false;
            		end;
                     if sheet.nivelNave10 >= 40 then
            		 self.LDa4.visible = false;
            		 self.LDa5.visible = true;
            		else
            		 self.LDa5.visible = false;
            		end;	
                     if sheet.nivelNave10 >= 50 then
            		 self.LDa5.visible = false;
            		 self.LDa6.visible = true;
            		else
            		 self.LDa6.visible = false;
            		end;
                     if sheet.nivelNave10 >= 60 then
            		 self.LDa6.visible = false;
            		 self.LDa7.visible = true;
            		else
            		 self.LDa7.visible = false;
            		end;
                     if sheet.nivelNave10 >= 70 then
            		 self.LDa7.visible = false;
            		 self.LDa8.visible = true;
            		else
            		 self.LDa8.visible = false;
            		end;
        end, obj);

    obj._e_event103 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave11 >= 10 then
            		  self.Lhn1.visible = false;
            		  self.Lhn2.visible = true;
            		else
            		 self.Lhn1.visible = true;
            		 self.Lhn2.visible = false;
            		 end;
                     if sheet.nivelNave11 >= 20 then
            		  self.Lhn2.visible = false;
            		  self.Lhn3.visible = true;
            		else
            		  self.Lhn3.visible = false;
            		 end;
                     if sheet.nivelNave11 >= 30 then
            		 self.Lhn3.visible = false;
            		 self.Lhn4.visible = true;
            		else
            		 self.Lhn4.visible = false;
            		end;
                     if sheet.nivelNave11 >= 40 then
            		 self.Lhn4.visible = false;
            		 self.Lhn5.visible = true;
            		else
            		 self.Lhn5.visible = false;
            		end;	
                     if sheet.nivelNave11 >= 50 then
            		 self.Lhn5.visible = false;
            		 self.Lhn6.visible = true;
            		else
            		 self.Lhn6.visible = false;
            		end;
                     if sheet.nivelNave11 >= 60 then
            		 self.Lhn6.visible = false;
            		 self.Lhn7.visible = true;
            		else
            		 self.Lhn7.visible = false;
            		end;
                     if sheet.nivelNave11 >= 70 then
            		 self.Lhn7.visible = false;
            		 self.Lhn8.visible = true;
            		else
            		 self.Lhn8.visible = false;
            		end;
        end, obj);

    obj._e_event104 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave12 >= 10 then
            		  self.LjN1.visible = false;
            		  self.LjN2.visible = true;
            		else
            		 self.LjN1.visible = true;
            		 self.LjN2.visible = false;
            		 end;
                     if sheet.nivelNave12 >= 20 then
            		  self.LjN2.visible = false;
            		  self.LjN3.visible = true;
            		else
            		  self.LjN3.visible = false;
            		 end;
                     if sheet.nivelNave12 >= 30 then
            		 self.LjN3.visible = false;
            		 self.LjN4.visible = true;
            		else
            		 self.LjN4.visible = false;
            		end;
                     if sheet.nivelNave12 >= 40 then
            		 self.LjN4.visible = false;
            		 self.LjN5.visible = true;
            		else
            		 self.LjN5.visible = false;
            		end;	
                     if sheet.nivelNave12 >= 50 then
            		 self.LjN5.visible = false;
            		 self.LjN6.visible = true;
            		else
            		 self.LjN6.visible = false;
            		end;
                     if sheet.nivelNave12 >= 60 then
            		 self.LjN6.visible = false;
            		 self.LjN7.visible = true;
            		else
            		 self.LjN7.visible = false;
            		end;
                     if sheet.nivelNave12 >= 70 then
            		 self.LjN7.visible = false;
            		 self.LjN8.visible = true;
            		else
            		 self.LjN8.visible = false;
            		end;
        end, obj);

    obj._e_event105 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave13 >= 10 then
            		  self.LaH1.visible = false;
            		  self.LaH2.visible = true;
            		else
            		 self.LaH1.visible = true;
            		 self.LaH2.visible = false;
            		 end;
                     if sheet.nivelNave13 >= 20 then
            		  self.LaH2.visible = false;
            		  self.LaH3.visible = true;
            		else
            		  self.LaH3.visible = false;
            		 end;
                     if sheet.nivelNave13 >= 30 then
            		 self.LaH3.visible = false;
            		 self.LaH4.visible = true;
            		else
            		 self.LaH4.visible = false;
            		end;
                     if sheet.nivelNave13 >= 40 then
            		 self.LaH4.visible = false;
            		 self.LaH5.visible = true;
            		else
            		 self.LaH5.visible = false;
            		end;	
                     if sheet.nivelNave13 >= 50 then
            		 self.LaH5.visible = false;
            		 self.LaH6.visible = true;
            		else
            		 self.LaH6.visible = false;
            		end;
                     if sheet.nivelNave13 >= 60 then
            		 self.LaH6.visible = false;
            		 self.LaH7.visible = true;
            		else
            		 self.LaH7.visible = false;
            		end;
                     if sheet.nivelNave13 >= 70 then
            		 self.LaH7.visible = false;
            		 self.LaH8.visible = true;
            		else
            		 self.LaH8.visible = false;
            		end;
        end, obj);

    obj._e_event106 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave14 >= 10 then
            		  self.LmH1.visible = false;
            		  self.LmH2.visible = true;
            		else
            		 self.LmH1.visible = true;
            		 self.LmH2.visible = false;
            		 end;
                     if sheet.nivelNave14 >= 20 then
            		  self.LmH2.visible = false;
            		  self.LmH3.visible = true;
            		else
            		  self.LmH3.visible = false;
            		 end;
                     if sheet.nivelNave14 >= 30 then
            		 self.LmH3.visible = false;
            		 self.LmH4.visible = true;
            		else
            		 self.LmH4.visible = false;
            		end;
                     if sheet.nivelNave14 >= 40 then
            		 self.LmH4.visible = false;
            		 self.LmH5.visible = true;
            		else
            		 self.LmH5.visible = false;
            		end;	
                     if sheet.nivelNave14 >= 50 then
            		 self.LmH5.visible = false;
            		 self.LmH6.visible = true;
            		else
            		 self.LmH6.visible = false;
            		end;
                     if sheet.nivelNave14 >= 60 then
            		 self.LmH6.visible = false;
            		 self.LmH7.visible = true;
            		else
            		 self.LmH7.visible = false;
            		end;
                     if sheet.nivelNave14 >= 70 then
            		 self.LmH7.visible = false;
            		 self.LmH8.visible = true;
            		else
            		 self.LmH8.visible = false;
            		end;
        end, obj);

    obj._e_event107 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave15 >= 10 then
            		  self.LbAn1.visible = false;
            		  self.LbAn2.visible = true;
            		else
            		 self.LbAn1.visible = true;
            		 self.LbAn2.visible = false;
            		 end;
                     if sheet.nivelNave15 >= 20 then
            		  self.LbAn2.visible = false;
            		  self.LbAn3.visible = true;
            		else
            		  self.LbAn3.visible = false;
            		 end;
                     if sheet.nivelNave15 >= 30 then
            		 self.LbAn3.visible = false;
            		 self.LbAn4.visible = true;
            		else
            		 self.LbAn4.visible = false;
            		end;
                     if sheet.nivelNave15 >= 40 then
            		 self.LbAn4.visible = false;
            		 self.LbAn5.visible = true;
            		else
            		 self.LbAn5.visible = false;
            		end;	
                     if sheet.nivelNave15 >= 50 then
            		 self.LbAn5.visible = false;
            		 self.LbAn6.visible = true;
            		else
            		 self.LbAn6.visible = false;
            		end;
                     if sheet.nivelNave15 >= 60 then
            		 self.LbAn6.visible = false;
            		 self.LbAn7.visible = true;
            		else
            		 self.LbAn7.visible = false;
            		end;
                     if sheet.nivelNave15 >= 70 then
            		 self.LbAn7.visible = false;
            		 self.LbAn8.visible = true;
            		else
            		 self.LbAn8.visible = false;
            		end;
        end, obj);

    obj._e_event108 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave16 >= 10 then
            		  self.LgU1.visible = false;
            		  self.LgU2.visible = true;
            		else
            		 self.LgU1.visible = true;
            		 self.LgU2.visible = false;
            		 end;
                     if sheet.nivelNave16 >= 20 then
            		  self.LgU2.visible = false;
            		  self.LgU3.visible = true;
            		else
            		  self.LgU3.visible = false;
            		 end;
                     if sheet.nivelNave16 >= 30 then
            		 self.LgU3.visible = false;
            		 self.LgU4.visible = true;
            		else
            		 self.LgU4.visible = false;
            		end;
                     if sheet.nivelNave16 >= 40 then
            		 self.LgU4.visible = false;
            		 self.LgU5.visible = true;
            		else
            		 self.LgU5.visible = false;
            		end;	
                     if sheet.nivelNave16 >= 50 then
            		 self.LgU5.visible = false;
            		 self.LgU6.visible = true;
            		else
            		 self.LgU6.visible = false;
            		end;
                     if sheet.nivelNave16 >= 60 then
            		 self.LgU6.visible = false;
            		 self.LgU7.visible = true;
            		else
            		 self.LgU7.visible = false;
            		end;
                     if sheet.nivelNave16 >= 70 then
            		 self.LgU7.visible = false;
            		 self.LgU8.visible = true;
            		else
            		 self.LgU8.visible = false;
            		end;
        end, obj);

    obj._e_event109 = obj.label17:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave17 = (sheet.nivelNave17 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event110 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet.nivelNave17 >= 70 then
            		 	   sheet.nivelNave17 = (sheet.nivelNave17 or 0) +0;
            		 else
            	   sheet.nivelNave17 = (sheet.nivelNave17 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event111 = obj.button17:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave17 = (sheet.nivelNave17 or 0) -0.2;
        end, obj);

    obj._e_event112 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin17~=nil and sheet.maxMin17~=nil and sheet.usosMin17~=nil then
            						sheet.usosMin17 = (sheet.minMin17 or 0)/ (sheet.maxMin17 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave17 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave17 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin17 = 0;
            					end;
        end, obj);

    obj._e_event113 = obj.edit51:addEventListener("onUserChange",
        function (_)
            if sheet.minMin17~=nil and sheet.maxMin17~=nil then
            						sheet.usosMin17 = (sheet.minMin17 or 0)/ (sheet.maxMin17 or 0);
            					end;
        end, obj);

    obj._e_event114 = obj.label18:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave18 = (sheet.nivelNave18 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event115 = obj.button18:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            	 end;
            	    if sheet.nivelNave18 >= 70 then
            		 	   sheet.nivelNave18 = (sheet.nivelNave18 or 0) +0;
            		 else
            	   sheet.nivelNave18 = (sheet.nivelNave18 or 0) +0.2;
            	 end;
        end, obj);

    obj._e_event116 = obj.button18:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave18 = (sheet.nivelNave18 or 0) -0.2;
        end, obj);

    obj._e_event117 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin18~=nil and sheet.maxMin18~=nil and sheet.usosMin18~=nil then
            						sheet.usosMin18 = (sheet.minMin18 or 0)/ (sheet.maxMin18 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave18 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave18 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin18 = 0;
            					end;
        end, obj);

    obj._e_event118 = obj.edit54:addEventListener("onUserChange",
        function (_)
            if sheet.minMin18~=nil and sheet.maxMin18~=nil then
            						sheet.usosMin18 = (sheet.minMin18 or 0)/ (sheet.maxMin18 or 0);
            					end;
        end, obj);

    obj._e_event119 = obj.label19:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave19 = (sheet.nivelNave19 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event120 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet.nivelNave19 >= 70 then
            		 	   sheet.nivelNave19 = (sheet.nivelNave19 or 0) +0;
            		 else
            	   sheet.nivelNave19 = (sheet.nivelNave19 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event121 = obj.button19:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave19 = (sheet.nivelNave19 or 0) -0.2;
        end, obj);

    obj._e_event122 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin19~=nil and sheet.maxMin19~=nil and sheet.usosMin19~=nil then
            						sheet.usosMin19 = (sheet.minMin19 or 0)/ (sheet.maxMin19 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave19 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave19 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin19 = 0;
            					end;
        end, obj);

    obj._e_event123 = obj.edit57:addEventListener("onUserChange",
        function (_)
            if sheet.minMin19~=nil and sheet.maxMin19~=nil then
            						sheet.usosMin19 = (sheet.minMin19 or 0)/ (sheet.maxMin19 or 0);
            					end;
        end, obj);

    obj._e_event124 = obj.label20:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave20 = (sheet.nivelNave20 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event125 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet.nivelNave20 >= 70 then
            		 	   sheet.nivelNave20 = (sheet.nivelNave20 or 0) +0;
            		 else
            	   sheet.nivelNave20 = (sheet.nivelNave20 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event126 = obj.button20:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave20 = (sheet.nivelNave20 or 0) -0.2;
        end, obj);

    obj._e_event127 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin20~=nil and sheet.maxMin20~=nil and sheet.usosMin20~=nil then
            						sheet.usosMin20 = (sheet.minMin20 or 0)/ (sheet.maxMin20 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave20 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave20 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin20 = 0;
            					end;
        end, obj);

    obj._e_event128 = obj.edit60:addEventListener("onUserChange",
        function (_)
            if sheet.minMin20~=nil and sheet.maxMin20~=nil then
            						sheet.usosMin20 = (sheet.minMin20 or 0)/ (sheet.maxMin20 or 0);
            					end;
        end, obj);

    obj._e_event129 = obj.label21:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave21 = (sheet.nivelNave21 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event130 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet.nivelNave21 >= 70 then
            		 	   sheet.nivelNave21 = (sheet.nivelNave21 or 0) +0;
            		 else
            	   sheet.nivelNave21 = (sheet.nivelNave21 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event131 = obj.button21:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave21 = (sheet.nivelNave21 or 0) -0.2;
        end, obj);

    obj._e_event132 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin21~=nil and sheet.maxMin21~=nil and sheet.usosMin21~=nil then
            						sheet.usosMin21 = (sheet.minMin21 or 0)/ (sheet.maxMin21 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave21 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave21 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin21 = 0;
            					end;
        end, obj);

    obj._e_event133 = obj.edit63:addEventListener("onUserChange",
        function (_)
            if sheet.minMin21~=nil and sheet.maxMin21~=nil then
            						sheet.usosMin21 = (sheet.minMin21 or 0)/ (sheet.maxMin21 or 0);
            					end;
        end, obj);

    obj._e_event134 = obj.label22:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave22 = (sheet.nivelNave22 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event135 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet.nivelNave22 >= 70 then
            		 	   sheet.nivelNave22 = (sheet.nivelNave22 or 0) +0;
            		 else
            	   sheet.nivelNave22 = (sheet.nivelNave22 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event136 = obj.button22:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave22 = (sheet.nivelNave22 or 0) -0.2;
        end, obj);

    obj._e_event137 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin22~=nil and sheet.maxMin22~=nil and sheet.usosMin22~=nil then
            						sheet.usosMin22 = (sheet.minMin22 or 0)/ (sheet.maxMin22 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave22 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave22 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin22 = 0;
            					end;
        end, obj);

    obj._e_event138 = obj.edit66:addEventListener("onUserChange",
        function (_)
            if sheet.minMin22~=nil and sheet.maxMin22~=nil then
            						sheet.usosMin22 = (sheet.minMin22 or 0)/ (sheet.maxMin22 or 0);
            					end;
        end, obj);

    obj._e_event139 = obj.label23:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave23 = (sheet.nivelNave23 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event140 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet.nivelNave23 >= 70 then
            		 	   sheet.nivelNave23 = (sheet.nivelNave23 or 0) +0;
            		 else
            	   sheet.nivelNave23 = (sheet.nivelNave23 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event141 = obj.button23:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave23 = (sheet.nivelNave23 or 0) -0.2;
        end, obj);

    obj._e_event142 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin23~=nil and sheet.maxMin23~=nil and sheet.usosMin23~=nil then
            						sheet.usosMin23 = (sheet.minMin23 or 0)/ (sheet.maxMin23 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave23 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave23 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin23 = 0;
            					end;
        end, obj);

    obj._e_event143 = obj.edit69:addEventListener("onUserChange",
        function (_)
            if sheet.minMin23~=nil and sheet.maxMin23~=nil then
            						sheet.usosMin23 = (sheet.minMin23 or 0)/ (sheet.maxMin23 or 0);
            					end;
        end, obj);

    obj._e_event144 = obj.label24:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave24 = (sheet.nivelNave24 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event145 = obj.button24:addEventListener("onClick",
        function (_)
            if sheet.nivelNave24 >= 70 then
            		 	   sheet.nivelNave24 = (sheet.nivelNave24 or 0) +0;
            		 else
            	   sheet.nivelNave24 = (sheet.nivelNave24 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event146 = obj.button24:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave24 = (sheet.nivelNave24 or 0) -0.2;
        end, obj);

    obj._e_event147 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin24~=nil and sheet.maxMin24~=nil and sheet.usosMin24~=nil then
            						sheet.usosMin24 = (sheet.minMin24 or 0)/ (sheet.maxMin24 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave24 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave24 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin24 = 0;
            					end;
        end, obj);

    obj._e_event148 = obj.edit72:addEventListener("onUserChange",
        function (_)
            if sheet.minMin24~=nil and sheet.maxMin24~=nil then
            						sheet.usosMin24 = (sheet.minMin24 or 0)/ (sheet.maxMin24 or 0);
            					end;
        end, obj);

    obj._e_event149 = obj.BotaoNaveN17:addEventListener("onClick",
        function (_)
            self.NkoNave.visible = true;
            		self.NnpNave.visible = false
            		self.Ne3Nave.visible = false;
            		self.NnpoQNave.visible = false;
            		self.Nah3Nave.visible = false
            		self.NkLNave.visible = false;
            		self.NopQNave.visible = false;
            		self.n2NNave.visible = false;
        end, obj);

    obj._e_event150 = obj.BotaoNaveN18:addEventListener("onClick",
        function (_)
            self.NkoNave.visible = false;
            		self.NnpNave.visible = true
            		self.Ne3Nave.visible = false;
            		self.NnpoQNave.visible = false;
            		self.Nah3Nave.visible = false
            		self.NkLNave.visible = false;
            		self.NopQNave.visible = false;
            		self.n2NNave.visible = false;
        end, obj);

    obj._e_event151 = obj.BotaoNaveN19:addEventListener("onClick",
        function (_)
            self.NkoNave.visible = false;
            		self.NnpNave.visible = false
            		self.Ne3Nave.visible = true;
            		self.NnpoQNave.visible = false;
            		self.Nah3Nave.visible = false
            		self.NkLNave.visible = false;
            		self.NopQNave.visible = false;
            		self.n2NNave.visible = false;
        end, obj);

    obj._e_event152 = obj.BotaoNaveN20:addEventListener("onClick",
        function (_)
            self.NkoNave.visible = false;
            		self.NnpNave.visible = false
            		self.Ne3Nave.visible = false;
            		self.NnpoQNave.visible = true;
            		self.Nah3Nave.visible = false
            		self.NkLNave.visible = false;
            		self.NopQNave.visible = false;
            		self.n2NNave.visible = false;
        end, obj);

    obj._e_event153 = obj.BotaoNaveN21:addEventListener("onClick",
        function (_)
            self.NkoNave.visible = false;
            		self.NnpNave.visible = false
            		self.Ne3Nave.visible = false;
            		self.NnpoQNave.visible = false;
            		self.Nah3Nave.visible = true
            		self.NkLNave.visible = false;
            		self.NopQNave.visible = false;
            		self.n2NNave.visible = false;
        end, obj);

    obj._e_event154 = obj.BotaoNaveN22:addEventListener("onClick",
        function (_)
            self.NkoNave.visible = false;
            		self.NnpNave.visible = false
            		self.Ne3Nave.visible = false;
            		self.NnpoQNave.visible = false;
            		self.Nah3Nave.visible = false
            		self.NkLNave.visible = true;
            		self.NopQNave.visible = false;
            		self.n2NNave.visible = false;
        end, obj);

    obj._e_event155 = obj.BotaoNaveN23:addEventListener("onClick",
        function (_)
            self.NkoNave.visible = false;
            		self.NnpNave.visible = false
            		self.Ne3Nave.visible = false;
            		self.NnpoQNave.visible = false;
            		self.Nah3Nave.visible = false
            		self.NkLNave.visible = false;
            		self.NopQNave.visible = true;
            		self.n2NNave.visible = false;
        end, obj);

    obj._e_event156 = obj.BotaoNaveN24:addEventListener("onClick",
        function (_)
            self.NkoNave.visible = false;
            		self.NnpNave.visible = false
            		self.Ne3Nave.visible = false;
            		self.NnpoQNave.visible = false;
            		self.Nah3Nave.visible = false
            		self.NkLNave.visible = false;
            		self.NopQNave.visible = false;
            		self.n2NNave.visible = true;
        end, obj);

    obj._e_event157 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave17 >= 10 then
            		  self.Nko1.visible = false;
            		  self.Nko2.visible = true;
            		else
            		 self.Nko1.visible = true;
            		 self.Nko2.visible = false;
            		 end;
                     if sheet.nivelNave17 >= 20 then
            		  self.Nko2.visible = false;
            		  self.Nko3.visible = true;
            		else
            		  self.Nko3.visible = false;
            		 end;
                     if sheet.nivelNave17 >= 30 then
            		 self.Nko3.visible = false;
            		 self.Nko4.visible = true;
            		else
            		 self.Nko4.visible = false;
            		end;
                     if sheet.nivelNave17 >= 40 then
            		 self.Nko4.visible = false;
            		 self.Nko5.visible = true;
            		else
            		 self.Nko5.visible = false;
            		end;	
                     if sheet.nivelNave17 >= 50 then
            		 self.Nko5.visible = false;
            		 self.Nko6.visible = true;
            		else
            		 self.Nko6.visible = false;
            		end;
                     if sheet.nivelNave17 >= 60 then
            		 self.Nko6.visible = false;
            		 self.Nko7.visible = true;
            		else
            		 self.Nko7.visible = false;
            		end;
                     if sheet.nivelNave17 >= 70 then
            		 self.Nko7.visible = false;
            		 self.Nko8.visible = true;
            		else
            		 self.Nko8.visible = false;
            		end;
        end, obj);

    obj._e_event158 = obj.dataLink42:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave18 >= 10 then
            		  self.Nnp1.visible = false;
            		  self.Nnp2.visible = true;
            		else
            		 self.Nnp1.visible = true;
            		 self.Nnp2.visible = false;
            		 end;
                     if sheet.nivelNave18 >= 20 then
            		  self.Nnp2.visible = false;
            		  self.Nnp3.visible = true;
            		else
            		  self.Nnp3.visible = false;
            		 end;
                     if sheet.nivelNave18 >= 30 then
            		 self.Nnp3.visible = false;
            		 self.Nnp4.visible = true;
            		else
            		 self.Nnp4.visible = false;
            		end;
                     if sheet.nivelNave18 >= 40 then
            		 self.Nnp4.visible = false;
            		 self.Nnp5.visible = true;
            		else
            		 self.Nnp5.visible = false;
            		end;	
                     if sheet.nivelNave18 >= 50 then
            		 self.Nnp5.visible = false;
            		 self.Nnp6.visible = true;
            		else
            		 self.Nnp6.visible = false;
            		end;
                     if sheet.nivelNave18 >= 60 then
            		 self.Nnp6.visible = false;
            		 self.Nnp7.visible = true;
            		else
            		 self.Nnp7.visible = false;
            		end;
                     if sheet.nivelNave18 >= 70 then
            		 self.Nnp7.visible = false;
            		 self.Nnp8.visible = true;
            		else
            		 self.Nnp8.visible = false;
            		end;
        end, obj);

    obj._e_event159 = obj.dataLink43:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave19 >= 10 then
            		  self.Ne31.visible = false;
            		  self.Ne32.visible = true;
            		else
            		 self.Ne31.visible = true;
            		 self.Ne32.visible = false;
            		 end;
                     if sheet.nivelNave19 >= 20 then
            		  self.Ne32.visible = false;
            		  self.Ne33.visible = true;
            		else
            		  self.Ne33.visible = false;
            		 end;
                     if sheet.nivelNave19 >= 30 then
            		 self.Ne33.visible = false;
            		 self.Ne34.visible = true;
            		else
            		 self.Ne34.visible = false;
            		end;
                     if sheet.nivelNave19 >= 40 then
            		 self.Ne34.visible = false;
            		 self.Ne35.visible = true;
            		else
            		 self.Ne35.visible = false;
            		end;	
                     if sheet.nivelNave19 >= 50 then
            		 self.Ne35.visible = false;
            		 self.Ne36.visible = true;
            		else
            		 self.Ne36.visible = false;
            		end;
                     if sheet.nivelNave19 >= 60 then
            		 self.Ne36.visible = false;
            		 self.Ne37.visible = true;
            		else
            		 self.Ne37.visible = false;
            		end;
                     if sheet.nivelNave19 >= 70 then
            		 self.Ne37.visible = false;
            		 self.Ne38.visible = true;
            		else
            		 self.Ne38.visible = false;
            		end;
        end, obj);

    obj._e_event160 = obj.dataLink44:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave20 >= 10 then
            		  self.NnpoQ1.visible = false;
            		  self.NnpoQ2.visible = true;
            		else
            		 self.NnpoQ1.visible = true;
            		 self.NnpoQ2.visible = false;
            		 end;
                     if sheet.nivelNave20 >= 20 then
            		  self.NnpoQ2.visible = false;
            		  self.NnpoQ3.visible = true;
            		else
            		  self.NnpoQ3.visible = false;
            		 end;
                     if sheet.nivelNave20 >= 30 then
            		 self.NnpoQ3.visible = false;
            		 self.NnpoQ4.visible = true;
            		else
            		 self.NnpoQ4.visible = false;
            		end;
                     if sheet.nivelNave20 >= 40 then
            		 self.NnpoQ4.visible = false;
            		 self.NnpoQ5.visible = true;
            		else
            		 self.NnpoQ5.visible = false;
            		end;	
                     if sheet.nivelNave20 >= 50 then
            		 self.NnpoQ5.visible = false;
            		 self.NnpoQ6.visible = true;
            		else
            		 self.NnpoQ6.visible = false;
            		end;
                     if sheet.nivelNave20 >= 60 then
            		 self.NnpoQ6.visible = false;
            		 self.NnpoQ7.visible = true;
            		else
            		 self.NnpoQ7.visible = false;
            		end;
                     if sheet.nivelNave20 >= 70 then
            		 self.NnpoQ7.visible = false;
            		 self.NnpoQ8.visible = true;
            		else
            		 self.NnpoQ8.visible = false;
            		end;
        end, obj);

    obj._e_event161 = obj.dataLink45:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave21 >= 10 then
            		  self.Nah31.visible = false;
            		  self.Nah32.visible = true;
            		else
            		 self.Nah31.visible = true;
            		 self.Nah32.visible = false;
            		 end;
                     if sheet.nivelNave21 >= 20 then
            		  self.Nah32.visible = false;
            		  self.Nah33.visible = true;
            		else
            		  self.Nah33.visible = false;
            		 end;
                     if sheet.nivelNave21 >= 30 then
            		 self.Nah33.visible = false;
            		 self.Nah34.visible = true;
            		else
            		 self.Nah34.visible = false;
            		end;
                     if sheet.nivelNave21 >= 40 then
            		 self.Nah34.visible = false;
            		 self.Nah35.visible = true;
            		else
            		 self.Nah35.visible = false;
            		end;	
                     if sheet.nivelNave21 >= 50 then
            		 self.Nah35.visible = false;
            		 self.Nah36.visible = true;
            		else
            		 self.Nah36.visible = false;
            		end;
                     if sheet.nivelNave21 >= 60 then
            		 self.Nah36.visible = false;
            		 self.Nah37.visible = true;
            		else
            		 self.Nah37.visible = false;
            		end;
                     if sheet.nivelNave21 >= 70 then
            		 self.Nah37.visible = false;
            		 self.Nah38.visible = true;
            		else
            		 self.Nah38.visible = false;
            		end;
        end, obj);

    obj._e_event162 = obj.dataLink46:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave22 >= 10 then
            		  self.NkL1.visible = false;
            		  self.NkL2.visible = true;
            		else
            		 self.NkL1.visible = true;
            		 self.NkL2.visible = false;
            		 end;
                     if sheet.nivelNave22 >= 20 then
            		  self.NkL2.visible = false;
            		  self.NkL3.visible = true;
            		else
            		  self.NkL3.visible = false;
            		 end;
                     if sheet.nivelNave22 >= 30 then
            		 self.NkL3.visible = false;
            		 self.NkL4.visible = true;
            		else
            		 self.NkL4.visible = false;
            		end;
                     if sheet.nivelNave22 >= 40 then
            		 self.NkL4.visible = false;
            		 self.NkL5.visible = true;
            		else
            		 self.NkL5.visible = false;
            		end;	
                     if sheet.nivelNave22 >= 50 then
            		 self.NkL5.visible = false;
            		 self.NkL6.visible = true;
            		else
            		 self.NkL6.visible = false;
            		end;
                     if sheet.nivelNave22 >= 60 then
            		 self.NkL6.visible = false;
            		 self.NkL7.visible = true;
            		else
            		 self.NkL7.visible = false;
            		end;
                     if sheet.nivelNave22 >= 70 then
            		 self.NkL7.visible = false;
            		 self.NkL8.visible = true;
            		else
            		 self.NkL8.visible = false;
            		end;
        end, obj);

    obj._e_event163 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave23 >= 10 then
            		  self.NopQ1.visible = false;
            		  self.NopQ2.visible = true;
            		else
            		 self.NopQ1.visible = true;
            		 self.NopQ2.visible = false;
            		 end;
                     if sheet.nivelNave23 >= 20 then
            		  self.NopQ2.visible = false;
            		  self.NopQ3.visible = true;
            		else
            		  self.NopQ3.visible = false;
            		 end;
                     if sheet.nivelNave23 >= 30 then
            		 self.NopQ3.visible = false;
            		 self.NopQ4.visible = true;
            		else
            		 self.NopQ4.visible = false;
            		end;
                     if sheet.nivelNave23 >= 40 then
            		 self.NopQ4.visible = false;
            		 self.NopQ5.visible = true;
            		else
            		 self.NopQ5.visible = false;
            		end;	
                     if sheet.nivelNave23 >= 50 then
            		 self.NopQ5.visible = false;
            		 self.NopQ6.visible = true;
            		else
            		 self.NopQ6.visible = false;
            		end;
                     if sheet.nivelNave23 >= 60 then
            		 self.NopQ6.visible = false;
            		 self.NopQ7.visible = true;
            		else
            		 self.NopQ7.visible = false;
            		end;
                     if sheet.nivelNave23 >= 70 then
            		 self.NopQ7.visible = false;
            		 self.NopQ8.visible = true;
            		else
            		 self.NopQ8.visible = false;
            		end;
        end, obj);

    obj._e_event164 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave24 >= 10 then
            		  self.n2N1.visible = false;
            		  self.n2N2.visible = true;
            		else
            		 self.n2N1.visible = true;
            		 self.n2N2.visible = false;
            		 end;
                     if sheet.nivelNave24 >= 20 then
            		  self.n2N2.visible = false;
            		  self.n2N3.visible = true;
            		else
            		  self.n2N3.visible = false;
            		 end;
                     if sheet.nivelNave24 >= 30 then
            		 self.n2N3.visible = false;
            		 self.n2N4.visible = true;
            		else
            		 self.n2N4.visible = false;
            		end;
                     if sheet.nivelNave24 >= 40 then
            		 self.n2N4.visible = false;
            		 self.n2N5.visible = true;
            		else
            		 self.n2N5.visible = false;
            		end;	
                     if sheet.nivelNave24 >= 50 then
            		 self.n2N5.visible = false;
            		 self.n2N6.visible = true;
            		else
            		 self.n2N6.visible = false;
            		end;
                     if sheet.nivelNave24 >= 60 then
            		 self.n2N6.visible = false;
            		 self.n2N7.visible = true;
            		else
            		 self.n2N7.visible = false;
            		end;
                     if sheet.nivelNave24 >= 70 then
            		 self.n2N7.visible = false;
            		 self.n2N8.visible = true;
            		else
            		 self.n2N8.visible = false;
            		end;
        end, obj);

    obj._e_event165 = obj.label25:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave25 = (sheet.nivelNave25 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event166 = obj.button25:addEventListener("onClick",
        function (_)
            if sheet.nivelNave25 >= 70 then
            		 	   sheet.nivelNave25 = (sheet.nivelNave25 or 0) +0;
            		 else
            	   sheet.nivelNave25 = (sheet.nivelNave25 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event167 = obj.button25:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave25 = (sheet.nivelNave25 or 0) -0.2;
        end, obj);

    obj._e_event168 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin25~=nil and sheet.maxMin25~=nil and sheet.usosMin25~=nil then
            						sheet.usosMin25 = (sheet.minMin25 or 0)/ (sheet.maxMin25 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave25 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave25 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin25 = 0;
            					end;
        end, obj);

    obj._e_event169 = obj.edit75:addEventListener("onUserChange",
        function (_)
            if sheet.minMin25~=nil and sheet.maxMin25~=nil then
            						sheet.usosMin25 = (sheet.minMin25 or 0)/ (sheet.maxMin25 or 0);
            					end;
        end, obj);

    obj._e_event170 = obj.label26:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave26 = (sheet.nivelNave26 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event171 = obj.button26:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            	 end;
            	    if sheet.nivelNave26 >= 70 then
            		 	   sheet.nivelNave26 = (sheet.nivelNave26 or 0) +0;
            		 else
            	   sheet.nivelNave26 = (sheet.nivelNave26 or 0) +0.2;
            	 end;
        end, obj);

    obj._e_event172 = obj.button26:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave26 = (sheet.nivelNave26 or 0) -0.2;
        end, obj);

    obj._e_event173 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin26~=nil and sheet.maxMin26~=nil and sheet.usosMin26~=nil then
            						sheet.usosMin26 = (sheet.minMin26 or 0)/ (sheet.maxMin26 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave26 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave26 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin26 = 0;
            					end;
        end, obj);

    obj._e_event174 = obj.edit78:addEventListener("onUserChange",
        function (_)
            if sheet.minMin26~=nil and sheet.maxMin26~=nil then
            						sheet.usosMin26 = (sheet.minMin26 or 0)/ (sheet.maxMin26 or 0);
            					end;
        end, obj);

    obj._e_event175 = obj.label27:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave27 = (sheet.nivelNave27 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event176 = obj.button27:addEventListener("onClick",
        function (_)
            if sheet.nivelNave27 >= 70 then
            		 	   sheet.nivelNave27 = (sheet.nivelNave27 or 0) +0;
            		 else
            	   sheet.nivelNave27 = (sheet.nivelNave27 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event177 = obj.button27:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave27 = (sheet.nivelNave27 or 0) -0.2;
        end, obj);

    obj._e_event178 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin27~=nil and sheet.maxMin27~=nil and sheet.usosMin27~=nil then
            						sheet.usosMin27 = (sheet.minMin27 or 0)/ (sheet.maxMin27 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave27 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave27 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin27 = 0;
            					end;
        end, obj);

    obj._e_event179 = obj.edit81:addEventListener("onUserChange",
        function (_)
            if sheet.minMin27~=nil and sheet.maxMin27~=nil then
            						sheet.usosMin27 = (sheet.minMin27 or 0)/ (sheet.maxMin27 or 0);
            					end;
        end, obj);

    obj._e_event180 = obj.label28:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave28 = (sheet.nivelNave28 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event181 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet.nivelNave28 >= 70 then
            		 	   sheet.nivelNave28 = (sheet.nivelNave28 or 0) +0;
            		 else
            	   sheet.nivelNave28 = (sheet.nivelNave28 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event182 = obj.button28:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave28 = (sheet.nivelNave28 or 0) -0.2;
        end, obj);

    obj._e_event183 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin28~=nil and sheet.maxMin28~=nil and sheet.usosMin28~=nil then
            						sheet.usosMin28 = (sheet.minMin28 or 0)/ (sheet.maxMin28 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave28 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave28 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin28 = 0;
            					end;
        end, obj);

    obj._e_event184 = obj.edit84:addEventListener("onUserChange",
        function (_)
            if sheet.minMin28~=nil and sheet.maxMin28~=nil then
            						sheet.usosMin28 = (sheet.minMin28 or 0)/ (sheet.maxMin28 or 0);
            					end;
        end, obj);

    obj._e_event185 = obj.label29:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave29 = (sheet.nivelNave29 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event186 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet.nivelNave29 >= 70 then
            		 	   sheet.nivelNave29 = (sheet.nivelNave29 or 0) +0;
            		 else
            	   sheet.nivelNave29 = (sheet.nivelNave29 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event187 = obj.button29:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave29 = (sheet.nivelNave29 or 0) -0.2;
        end, obj);

    obj._e_event188 = obj.dataLink53:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin29~=nil and sheet.maxMin29~=nil and sheet.usosMin29~=nil then
            						sheet.usosMin29 = (sheet.minMin29 or 0)/ (sheet.maxMin29 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave29 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave29 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin29 = 0;
            					end;
        end, obj);

    obj._e_event189 = obj.edit87:addEventListener("onUserChange",
        function (_)
            if sheet.minMin29~=nil and sheet.maxMin29~=nil then
            						sheet.usosMin29 = (sheet.minMin29 or 0)/ (sheet.maxMin29 or 0);
            					end;
        end, obj);

    obj._e_event190 = obj.label30:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave30 = (sheet.nivelNave30 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event191 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet.nivelNave30 >= 70 then
            		 	   sheet.nivelNave30 = (sheet.nivelNave30 or 0) +0;
            		 else
            	   sheet.nivelNave30 = (sheet.nivelNave30 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event192 = obj.button30:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave30 = (sheet.nivelNave30 or 0) -0.2;
        end, obj);

    obj._e_event193 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin30~=nil and sheet.maxMin30~=nil and sheet.usosMin30~=nil then
            						sheet.usosMin30 = (sheet.minMin30 or 0)/ (sheet.maxMin30 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave30 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave30 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin30 = 0;
            					end;
        end, obj);

    obj._e_event194 = obj.edit90:addEventListener("onUserChange",
        function (_)
            if sheet.minMin30~=nil and sheet.maxMin30~=nil then
            						sheet.usosMin30 = (sheet.minMin30 or 0)/ (sheet.maxMin30 or 0);
            					end;
        end, obj);

    obj._e_event195 = obj.label31:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave31 = (sheet.nivelNave31 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event196 = obj.button31:addEventListener("onClick",
        function (_)
            if sheet.nivelNave31 >= 70 then
            		 	   sheet.nivelNave31 = (sheet.nivelNave31 or 0) +0;
            		 else
            	   sheet.nivelNave31 = (sheet.nivelNave31 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event197 = obj.button31:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave31 = (sheet.nivelNave31 or 0) -0.2;
        end, obj);

    obj._e_event198 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin31~=nil and sheet.maxMin31~=nil and sheet.usosMin31~=nil then
            						sheet.usosMin31 = (sheet.minMin31 or 0)/ (sheet.maxMin31 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave31 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave31 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin31 = 0;
            					end;
        end, obj);

    obj._e_event199 = obj.edit93:addEventListener("onUserChange",
        function (_)
            if sheet.minMin31~=nil and sheet.maxMin31~=nil then
            						sheet.usosMin31 = (sheet.minMin31 or 0)/ (sheet.maxMin31 or 0);
            					end;
        end, obj);

    obj._e_event200 = obj.label32:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel da Nave", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelNave32 = (sheet.nivelNave32 or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event201 = obj.button32:addEventListener("onClick",
        function (_)
            if sheet.nivelNave32 >= 70 then
            		 	   sheet.nivelNave32 = (sheet.nivelNave32 or 0) +0;
            		 else
            	   sheet.nivelNave32 = (sheet.nivelNave32 or 0) +0.2;
            		 end;
        end, obj);

    obj._e_event202 = obj.button32:addEventListener("onMenu",
        function (_, x, y)
            sheet.nivelNave32 = (sheet.nivelNave32 or 0) -0.2;
        end, obj);

    obj._e_event203 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.minMin32~=nil and sheet.maxMin32~=nil and sheet.usosMin32~=nil then
            						sheet.usosMin32 = (sheet.minMin32 or 0)/ (sheet.maxMin32 or 0);
            
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local mod = 0;
            						if newValue~=nil and oldValue~=nil then
            							mod = newValue - oldValue;
            						end;
            						
            						if mod>0 then
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave32 or "PONHA UM NOME NA SUA NAVE") .. " recuperou " .. mod .. " de HP " )
            						end;
            						if 0>mod then
            							mod = mod * -1;
            							mesaDoPersonagem.activeChat:enviarMensagem((sheet.nomeNave32 or "PONHA UM NOME NA SUA NAVE") .. " perdeu " .. mod .. " de HP " )
            						end;
            					else
            						sheet.usosMin32 = 0;
            					end;
        end, obj);

    obj._e_event204 = obj.edit96:addEventListener("onUserChange",
        function (_)
            if sheet.minMin32~=nil and sheet.maxMin32~=nil then
            						sheet.usosMin32 = (sheet.minMin32 or 0)/ (sheet.maxMin32 or 0);
            					end;
        end, obj);

    obj._e_event205 = obj.BotaoNaveN25:addEventListener("onClick",
        function (_)
            self.OxNave.visible = true;
            		self.Oh23Nave.visible = false
            		self.Ox2Nave.visible = false;
            		self.OlPNave.visible = false;
            		self.OazNave.visible = false
            		self.OjHNave.visible = false;
            		self.OSdNave.visible = false;
            		self.OqwNave.visible = false;
        end, obj);

    obj._e_event206 = obj.BotaoNaveN26:addEventListener("onClick",
        function (_)
            self.OxNave.visible = false;
            		self.Oh23Nave.visible = true
            		self.Ox2Nave.visible = false;
            		self.OlPNave.visible = false;
            		self.OazNave.visible = false
            		self.OjHNave.visible = false;
            		self.OSdNave.visible = false;
            		self.OqwNave.visible = false;
        end, obj);

    obj._e_event207 = obj.BotaoNaveN27:addEventListener("onClick",
        function (_)
            self.OxNave.visible = false;
            		self.Oh23Nave.visible = false
            		self.Ox2Nave.visible = true;
            		self.OlPNave.visible = false;
            		self.OazNave.visible = false
            		self.OjHNave.visible = false;
            		self.OSdNave.visible = false;
            		self.OqwNave.visible = false;
        end, obj);

    obj._e_event208 = obj.BotaoNaveN28:addEventListener("onClick",
        function (_)
            self.OxNave.visible = false;
            		self.Oh23Nave.visible = false
            		self.Ox2Nave.visible = false;
            		self.OlPNave.visible = true;
            		self.OazNave.visible = false
            		self.OjHNave.visible = false;
            		self.OSdNave.visible = false;
            		self.OqwNave.visible = false;
        end, obj);

    obj._e_event209 = obj.BotaoNaveN29:addEventListener("onClick",
        function (_)
            self.OxNave.visible = false;
            		self.Oh23Nave.visible = false
            		self.Ox2Nave.visible = false;
            		self.OlPNave.visible = false;
            		self.OazNave.visible = true
            		self.OjHNave.visible = false;
            		self.OSdNave.visible = false;
            		self.OqwNave.visible = false;
        end, obj);

    obj._e_event210 = obj.BotaoNaveN30:addEventListener("onClick",
        function (_)
            self.OxNave.visible = false;
            		self.Oh23Nave.visible = false
            		self.Ox2Nave.visible = false;
            		self.OlPNave.visible = false;
            		self.OazNave.visible = false
            		self.OjHNave.visible = true;
            		self.OSdNave.visible = false;
            		self.OqwNave.visible = false;
        end, obj);

    obj._e_event211 = obj.BotaoNaveN31:addEventListener("onClick",
        function (_)
            self.OxNave.visible = false;
            		self.Oh23Nave.visible = false
            		self.Ox2Nave.visible = false;
            		self.OlPNave.visible = false;
            		self.OazNave.visible = false
            		self.OjHNave.visible = false;
            		self.OSdNave.visible = true;
            		self.OqwNave.visible = false;
        end, obj);

    obj._e_event212 = obj.BotaoNaveN32:addEventListener("onClick",
        function (_)
            self.OxNave.visible = false;
            		self.Oh23Nave.visible = false
            		self.Ox2Nave.visible = false;
            		self.OlPNave.visible = false;
            		self.OazNave.visible = false
            		self.OjHNave.visible = false;
            		self.OSdNave.visible = false;
            		self.OqwNave.visible = true;
        end, obj);

    obj._e_event213 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave25 >= 10 then
            		  self.Ox1.visible = false;
            		  self.Ox2.visible = true;
            		else
            		 self.Ox1.visible = true;
            		 self.Ox2.visible = false;
            		 end;
                     if sheet.nivelNave25 >= 20 then
            		  self.Ox2.visible = false;
            		  self.Ox3.visible = true;
            		else
            		  self.Ox3.visible = false;
            		 end;
                     if sheet.nivelNave25 >= 30 then
            		 self.Ox3.visible = false;
            		 self.Ox4.visible = true;
            		else
            		 self.Ox4.visible = false;
            		end;
                     if sheet.nivelNave25 >= 40 then
            		 self.Ox4.visible = false;
            		 self.Ox5.visible = true;
            		else
            		 self.Ox5.visible = false;
            		end;	
                     if sheet.nivelNave25 >= 50 then
            		 self.Ox5.visible = false;
            		 self.Ox6.visible = true;
            		else
            		 self.Ox6.visible = false;
            		end;
                     if sheet.nivelNave25 >= 60 then
            		 self.Ox6.visible = false;
            		 self.Ox7.visible = true;
            		else
            		 self.Ox7.visible = false;
            		end;
                     if sheet.nivelNave25 >= 70 then
            		 self.Ox7.visible = false;
            		 self.Ox8.visible = true;
            		else
            		 self.Ox8.visible = false;
            		end;
        end, obj);

    obj._e_event214 = obj.dataLink58:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave26 >= 10 then
            		  self.Oh231.visible = false;
            		  self.Oh232.visible = true;
            		else
            		 self.Oh231.visible = true;
            		 self.Oh232.visible = false;
            		 end;
                     if sheet.nivelNave26 >= 20 then
            		  self.Oh232.visible = false;
            		  self.Oh233.visible = true;
            		else
            		  self.Oh233.visible = false;
            		 end;
                     if sheet.nivelNave26 >= 30 then
            		 self.Oh233.visible = false;
            		 self.Oh234.visible = true;
            		else
            		 self.Oh234.visible = false;
            		end;
                     if sheet.nivelNave26 >= 40 then
            		 self.Oh234.visible = false;
            		 self.Oh235.visible = true;
            		else
            		 self.Oh235.visible = false;
            		end;	
                     if sheet.nivelNave26 >= 50 then
            		 self.Oh235.visible = false;
            		 self.Oh236.visible = true;
            		else
            		 self.Oh236.visible = false;
            		end;
                     if sheet.nivelNave26 >= 60 then
            		 self.Oh236.visible = false;
            		 self.Oh237.visible = true;
            		else
            		 self.Oh237.visible = false;
            		end;
                     if sheet.nivelNave26 >= 70 then
            		 self.Oh237.visible = false;
            		 self.Oh238.visible = true;
            		else
            		 self.Oh238.visible = false;
            		end;
        end, obj);

    obj._e_event215 = obj.dataLink59:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave27 >= 10 then
            		  self.Ox21.visible = false;
            		  self.Ox22.visible = true;
            		else
            		 self.Ox21.visible = true;
            		 self.Ox22.visible = false;
            		 end;
                     if sheet.nivelNave27 >= 20 then
            		  self.Ox22.visible = false;
            		  self.Ox23.visible = true;
            		else
            		  self.Ox23.visible = false;
            		 end;
                     if sheet.nivelNave27 >= 30 then
            		 self.Ox23.visible = false;
            		 self.Ox24.visible = true;
            		else
            		 self.Ox24.visible = false;
            		end;
                     if sheet.nivelNave27 >= 40 then
            		 self.Ox24.visible = false;
            		 self.Ox25.visible = true;
            		else
            		 self.Ox25.visible = false;
            		end;	
                     if sheet.nivelNave27 >= 50 then
            		 self.Ox25.visible = false;
            		 self.Ox26.visible = true;
            		else
            		 self.Ox26.visible = false;
            		end;
                     if sheet.nivelNave27 >= 60 then
            		 self.Ox26.visible = false;
            		 self.Ox27.visible = true;
            		else
            		 self.Ox27.visible = false;
            		end;
                     if sheet.nivelNave27 >= 70 then
            		 self.Ox27.visible = false;
            		 self.Ox28.visible = true;
            		else
            		 self.Ox28.visible = false;
            		end;
        end, obj);

    obj._e_event216 = obj.dataLink60:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave28 >= 10 then
            		  self.OlP1.visible = false;
            		  self.OlP2.visible = true;
            		else
            		 self.OlP1.visible = true;
            		 self.OlP2.visible = false;
            		 end;
                     if sheet.nivelNave28 >= 20 then
            		  self.OlP2.visible = false;
            		  self.OlP3.visible = true;
            		else
            		  self.OlP3.visible = false;
            		 end;
                     if sheet.nivelNave28 >= 30 then
            		 self.OlP3.visible = false;
            		 self.OlP4.visible = true;
            		else
            		 self.OlP4.visible = false;
            		end;
                     if sheet.nivelNave28 >= 40 then
            		 self.OlP4.visible = false;
            		 self.OlP5.visible = true;
            		else
            		 self.OlP5.visible = false;
            		end;	
                     if sheet.nivelNave28 >= 50 then
            		 self.OlP5.visible = false;
            		 self.OlP6.visible = true;
            		else
            		 self.OlP6.visible = false;
            		end;
                     if sheet.nivelNave28 >= 60 then
            		 self.OlP6.visible = false;
            		 self.OlP7.visible = true;
            		else
            		 self.OlP7.visible = false;
            		end;
                     if sheet.nivelNave28 >= 70 then
            		 self.OlP7.visible = false;
            		 self.OlP8.visible = true;
            		else
            		 self.OlP8.visible = false;
            		end;
        end, obj);

    obj._e_event217 = obj.dataLink61:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave29 >= 10 then
            		  self.Oaz1.visible = false;
            		  self.Oaz2.visible = true;
            		else
            		 self.Oaz1.visible = true;
            		 self.Oaz2.visible = false;
            		 end;
                     if sheet.nivelNave29 >= 20 then
            		  self.Oaz2.visible = false;
            		  self.Oaz3.visible = true;
            		else
            		  self.Oaz3.visible = false;
            		 end;
                     if sheet.nivelNave29 >= 30 then
            		 self.Oaz3.visible = false;
            		 self.Oaz4.visible = true;
            		else
            		 self.Oaz4.visible = false;
            		end;
                     if sheet.nivelNave29 >= 40 then
            		 self.Oaz4.visible = false;
            		 self.Oaz5.visible = true;
            		else
            		 self.Oaz5.visible = false;
            		end;	
                     if sheet.nivelNave29 >= 50 then
            		 self.Oaz5.visible = false;
            		 self.Oaz6.visible = true;
            		else
            		 self.Oaz6.visible = false;
            		end;
                     if sheet.nivelNave29 >= 60 then
            		 self.Oaz6.visible = false;
            		 self.Oaz7.visible = true;
            		else
            		 self.Oaz7.visible = false;
            		end;
                     if sheet.nivelNave29 >= 70 then
            		 self.Oaz7.visible = false;
            		 self.Oaz8.visible = true;
            		else
            		 self.Oaz8.visible = false;
            		end;
        end, obj);

    obj._e_event218 = obj.dataLink62:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave30 >= 10 then
            		  self.OjH1.visible = false;
            		  self.OjH2.visible = true;
            		else
            		 self.OjH1.visible = true;
            		 self.OjH2.visible = false;
            		 end;
                     if sheet.nivelNave30 >= 20 then
            		  self.OjH2.visible = false;
            		  self.OjH3.visible = true;
            		else
            		  self.OjH3.visible = false;
            		 end;
                     if sheet.nivelNave30 >= 30 then
            		 self.OjH3.visible = false;
            		 self.OjH4.visible = true;
            		else
            		 self.OjH4.visible = false;
            		end;
                     if sheet.nivelNave30 >= 40 then
            		 self.OjH4.visible = false;
            		 self.OjH5.visible = true;
            		else
            		 self.OjH5.visible = false;
            		end;	
                     if sheet.nivelNave30 >= 50 then
            		 self.OjH5.visible = false;
            		 self.OjH6.visible = true;
            		else
            		 self.OjH6.visible = false;
            		end;
                     if sheet.nivelNave30 >= 60 then
            		 self.OjH6.visible = false;
            		 self.OjH7.visible = true;
            		else
            		 self.OjH7.visible = false;
            		end;
                     if sheet.nivelNave30 >= 70 then
            		 self.OjH7.visible = false;
            		 self.OjH8.visible = true;
            		else
            		 self.OjH8.visible = false;
            		end;
        end, obj);

    obj._e_event219 = obj.dataLink63:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave31 >= 10 then
            		  self.OSd1.visible = false;
            		  self.OSd2.visible = true;
            		else
            		 self.OSd1.visible = true;
            		 self.OSd2.visible = false;
            		 end;
                     if sheet.nivelNave31 >= 20 then
            		  self.OSd2.visible = false;
            		  self.OSd3.visible = true;
            		else
            		  self.OSd3.visible = false;
            		 end;
                     if sheet.nivelNave31 >= 30 then
            		 self.OSd3.visible = false;
            		 self.OSd4.visible = true;
            		else
            		 self.OSd4.visible = false;
            		end;
                     if sheet.nivelNave31 >= 40 then
            		 self.OSd4.visible = false;
            		 self.OSd5.visible = true;
            		else
            		 self.OSd5.visible = false;
            		end;	
                     if sheet.nivelNave31 >= 50 then
            		 self.OSd5.visible = false;
            		 self.OSd6.visible = true;
            		else
            		 self.OSd6.visible = false;
            		end;
                     if sheet.nivelNave31 >= 60 then
            		 self.OSd6.visible = false;
            		 self.OSd7.visible = true;
            		else
            		 self.OSd7.visible = false;
            		end;
                     if sheet.nivelNave31 >= 70 then
            		 self.OSd7.visible = false;
            		 self.OSd8.visible = true;
            		else
            		 self.OSd8.visible = false;
            		end;
        end, obj);

    obj._e_event220 = obj.dataLink64:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.nivelNave32 >= 10 then
            		  self.Oqw1.visible = false;
            		  self.Oqw2.visible = true;
            		else
            		 self.Oqw1.visible = true;
            		 self.Oqw2.visible = false;
            		 end;
                     if sheet.nivelNave32 >= 20 then
            		  self.Oqw2.visible = false;
            		  self.Oqw3.visible = true;
            		else
            		  self.Oqw3.visible = false;
            		 end;
                     if sheet.nivelNave32 >= 30 then
            		 self.Oqw3.visible = false;
            		 self.Oqw4.visible = true;
            		else
            		 self.Oqw4.visible = false;
            		end;
                     if sheet.nivelNave32 >= 40 then
            		 self.Oqw4.visible = false;
            		 self.Oqw5.visible = true;
            		else
            		 self.Oqw5.visible = false;
            		end;	
                     if sheet.nivelNave32 >= 50 then
            		 self.Oqw5.visible = false;
            		 self.Oqw6.visible = true;
            		else
            		 self.Oqw6.visible = false;
            		end;
                     if sheet.nivelNave32 >= 60 then
            		 self.Oqw6.visible = false;
            		 self.Oqw7.visible = true;
            		else
            		 self.Oqw7.visible = false;
            		end;
                     if sheet.nivelNave32 >= 70 then
            		 self.Oqw7.visible = false;
            		 self.Oqw8.visible = true;
            		else
            		 self.Oqw8.visible = false;
            		end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.OlP1 ~= nil then self.OlP1:destroy(); self.OlP1 = nil; end;
        if self.model6 ~= nil then self.model6:destroy(); self.model6 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.LDa1 ~= nil then self.LDa1:destroy(); self.LDa1 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.OjH7 ~= nil then self.OjH7:destroy(); self.OjH7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.image94 ~= nil then self.image94:destroy(); self.image94 = nil; end;
        if self.image51 ~= nil then self.image51:destroy(); self.image51 = nil; end;
        if self.LjN1 ~= nil then self.LjN1:destroy(); self.LjN1 = nil; end;
        if self.model4 ~= nil then self.model4:destroy(); self.model4 = nil; end;
        if self.image117 ~= nil then self.image117:destroy(); self.image117 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.model17 ~= nil then self.model17:destroy(); self.model17 = nil; end;
        if self.image248 ~= nil then self.image248:destroy(); self.image248 = nil; end;
        if self.Hpp4 ~= nil then self.Hpp4:destroy(); self.Hpp4 = nil; end;
        if self.image135 ~= nil then self.image135:destroy(); self.image135 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.image157 ~= nil then self.image157:destroy(); self.image157 = nil; end;
        if self.image229 ~= nil then self.image229:destroy(); self.image229 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.image211 ~= nil then self.image211:destroy(); self.image211 = nil; end;
        if self.textEditor38 ~= nil then self.textEditor38:destroy(); self.textEditor38 = nil; end;
        if self.image136 ~= nil then self.image136:destroy(); self.image136 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.image201 ~= nil then self.image201:destroy(); self.image201 = nil; end;
        if self.image70 ~= nil then self.image70:destroy(); self.image70 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.n2N3 ~= nil then self.n2N3:destroy(); self.n2N3 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.H3o2 ~= nil then self.H3o2:destroy(); self.H3o2 = nil; end;
        if self.LjN2 ~= nil then self.LjN2:destroy(); self.LjN2 = nil; end;
        if self.model8 ~= nil then self.model8:destroy(); self.model8 = nil; end;
        if self.textEditor27 ~= nil then self.textEditor27:destroy(); self.textEditor27 = nil; end;
        if self.image244 ~= nil then self.image244:destroy(); self.image244 = nil; end;
        if self.LgU5 ~= nil then self.LgU5:destroy(); self.LgU5 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.NkL2 ~= nil then self.NkL2:destroy(); self.NkL2 = nil; end;
        if self.image200 ~= nil then self.image200:destroy(); self.image200 = nil; end;
        if self.image213 ~= nil then self.image213:destroy(); self.image213 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.BotaoNaveN16 ~= nil then self.BotaoNaveN16:destroy(); self.BotaoNaveN16 = nil; end;
        if self.BotaoNaveN24 ~= nil then self.BotaoNaveN24:destroy(); self.BotaoNaveN24 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.image56 ~= nil then self.image56:destroy(); self.image56 = nil; end;
        if self.model15 ~= nil then self.model15:destroy(); self.model15 = nil; end;
        if self.textEditor48 ~= nil then self.textEditor48:destroy(); self.textEditor48 = nil; end;
        if self.NkL4 ~= nil then self.NkL4:destroy(); self.NkL4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.Hnm4 ~= nil then self.Hnm4:destroy(); self.Hnm4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.progressBar7 ~= nil then self.progressBar7:destroy(); self.progressBar7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.H3o7 ~= nil then self.H3o7:destroy(); self.H3o7 = nil; end;
        if self.NnpoQ3 ~= nil then self.NnpoQ3:destroy(); self.NnpoQ3 = nil; end;
        if self.image171 ~= nil then self.image171:destroy(); self.image171 = nil; end;
        if self.OSd3 ~= nil then self.OSd3:destroy(); self.OSd3 = nil; end;
        if self.Ne35 ~= nil then self.Ne35:destroy(); self.Ne35 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.image107 ~= nil then self.image107:destroy(); self.image107 = nil; end;
        if self.LmH7 ~= nil then self.LmH7:destroy(); self.LmH7 = nil; end;
        if self.LaH8 ~= nil then self.LaH8:destroy(); self.LaH8 = nil; end;
        if self.progressBar5 ~= nil then self.progressBar5:destroy(); self.progressBar5 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.image198 ~= nil then self.image198:destroy(); self.image198 = nil; end;
        if self.OlPNave ~= nil then self.OlPNave:destroy(); self.OlPNave = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.Ne36 ~= nil then self.Ne36:destroy(); self.Ne36 = nil; end;
        if self.image95 ~= nil then self.image95:destroy(); self.image95 = nil; end;
        if self.LbAn4 ~= nil then self.LbAn4:destroy(); self.LbAn4 = nil; end;
        if self.Ox24 ~= nil then self.Ox24:destroy(); self.Ox24 = nil; end;
        if self.image206 ~= nil then self.image206:destroy(); self.image206 = nil; end;
        if self.OlP7 ~= nil then self.OlP7:destroy(); self.OlP7 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.Hnm6 ~= nil then self.Hnm6:destroy(); self.Hnm6 = nil; end;
        if self.Nnp5 ~= nil then self.Nnp5:destroy(); self.Nnp5 = nil; end;
        if self.LgU6 ~= nil then self.LgU6:destroy(); self.LgU6 = nil; end;
        if self.BotaoNaveN8 ~= nil then self.BotaoNaveN8:destroy(); self.BotaoNaveN8 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.Oh232 ~= nil then self.Oh232:destroy(); self.Oh232 = nil; end;
        if self.image49 ~= nil then self.image49:destroy(); self.image49 = nil; end;
        if self.model5 ~= nil then self.model5:destroy(); self.model5 = nil; end;
        if self.textEditor58 ~= nil then self.textEditor58:destroy(); self.textEditor58 = nil; end;
        if self.LgU7 ~= nil then self.LgU7:destroy(); self.LgU7 = nil; end;
        if self.image91 ~= nil then self.image91:destroy(); self.image91 = nil; end;
        if self.Nah38 ~= nil then self.Nah38:destroy(); self.Nah38 = nil; end;
        if self.image52 ~= nil then self.image52:destroy(); self.image52 = nil; end;
        if self.model13 ~= nil then self.model13:destroy(); self.model13 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.BotaoNaveN15 ~= nil then self.BotaoNaveN15:destroy(); self.BotaoNaveN15 = nil; end;
        if self.HhOp4 ~= nil then self.HhOp4:destroy(); self.HhOp4 = nil; end;
        if self.HjKL6 ~= nil then self.HjKL6:destroy(); self.HjKL6 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.Ox22 ~= nil then self.Ox22:destroy(); self.Ox22 = nil; end;
        if self.image256 ~= nil then self.image256:destroy(); self.image256 = nil; end;
        if self.image210 ~= nil then self.image210:destroy(); self.image210 = nil; end;
        if self.image63 ~= nil then self.image63:destroy(); self.image63 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.image103 ~= nil then self.image103:destroy(); self.image103 = nil; end;
        if self.image140 ~= nil then self.image140:destroy(); self.image140 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.textEditor54 ~= nil then self.textEditor54:destroy(); self.textEditor54 = nil; end;
        if self.textEditor43 ~= nil then self.textEditor43:destroy(); self.textEditor43 = nil; end;
        if self.image240 ~= nil then self.image240:destroy(); self.image240 = nil; end;
        if self.image123 ~= nil then self.image123:destroy(); self.image123 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.LaH4 ~= nil then self.LaH4:destroy(); self.LaH4 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.H2b2 ~= nil then self.H2b2:destroy(); self.H2b2 = nil; end;
        if self.OSd6 ~= nil then self.OSd6:destroy(); self.OSd6 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.H2b1 ~= nil then self.H2b1:destroy(); self.H2b1 = nil; end;
        if self.image193 ~= nil then self.image193:destroy(); self.image193 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.image64 ~= nil then self.image64:destroy(); self.image64 = nil; end;
        if self.BotaoNaveN13 ~= nil then self.BotaoNaveN13:destroy(); self.BotaoNaveN13 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.HjKL5 ~= nil then self.HjKL5:destroy(); self.HjKL5 = nil; end;
        if self.Lhn2 ~= nil then self.Lhn2:destroy(); self.Lhn2 = nil; end;
        if self.image54 ~= nil then self.image54:destroy(); self.image54 = nil; end;
        if self.image133 ~= nil then self.image133:destroy(); self.image133 = nil; end;
        if self.textEditor55 ~= nil then self.textEditor55:destroy(); self.textEditor55 = nil; end;
        if self.image231 ~= nil then self.image231:destroy(); self.image231 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.model30 ~= nil then self.model30:destroy(); self.model30 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.BotaoNaveN29 ~= nil then self.BotaoNaveN29:destroy(); self.BotaoNaveN29 = nil; end;
        if self.Hnm1 ~= nil then self.Hnm1:destroy(); self.Hnm1 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.NkoNave ~= nil then self.NkoNave:destroy(); self.NkoNave = nil; end;
        if self.textEditor40 ~= nil then self.textEditor40:destroy(); self.textEditor40 = nil; end;
        if self.progressBar8 ~= nil then self.progressBar8:destroy(); self.progressBar8 = nil; end;
        if self.Ox3 ~= nil then self.Ox3:destroy(); self.Ox3 = nil; end;
        if self.image161 ~= nil then self.image161:destroy(); self.image161 = nil; end;
        if self.image217 ~= nil then self.image217:destroy(); self.image217 = nil; end;
        if self.image246 ~= nil then self.image246:destroy(); self.image246 = nil; end;
        if self.image132 ~= nil then self.image132:destroy(); self.image132 = nil; end;
        if self.OjH2 ~= nil then self.OjH2:destroy(); self.OjH2 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.image183 ~= nil then self.image183:destroy(); self.image183 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.model32 ~= nil then self.model32:destroy(); self.model32 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor47 ~= nil then self.textEditor47:destroy(); self.textEditor47 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.Lqw2 ~= nil then self.Lqw2:destroy(); self.Lqw2 = nil; end;
        if self.image145 ~= nil then self.image145:destroy(); self.image145 = nil; end;
        if self.NnpoQ4 ~= nil then self.NnpoQ4:destroy(); self.NnpoQ4 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.image165 ~= nil then self.image165:destroy(); self.image165 = nil; end;
        if self.progressBar10 ~= nil then self.progressBar10:destroy(); self.progressBar10 = nil; end;
        if self.Nah32 ~= nil then self.Nah32:destroy(); self.Nah32 = nil; end;
        if self.Hpp7 ~= nil then self.Hpp7:destroy(); self.Hpp7 = nil; end;
        if self.HccD1 ~= nil then self.HccD1:destroy(); self.HccD1 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.HjKLNave ~= nil then self.HjKLNave:destroy(); self.HjKLNave = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.Lhn3 ~= nil then self.Lhn3:destroy(); self.Lhn3 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.LDa5 ~= nil then self.LDa5:destroy(); self.LDa5 = nil; end;
        if self.image233 ~= nil then self.image233:destroy(); self.image233 = nil; end;
        if self.image75 ~= nil then self.image75:destroy(); self.image75 = nil; end;
        if self.image144 ~= nil then self.image144:destroy(); self.image144 = nil; end;
        if self.Nko3 ~= nil then self.Nko3:destroy(); self.Nko3 = nil; end;
        if self.NopQ6 ~= nil then self.NopQ6:destroy(); self.NopQ6 = nil; end;
        if self.image170 ~= nil then self.image170:destroy(); self.image170 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.image105 ~= nil then self.image105:destroy(); self.image105 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.OSd8 ~= nil then self.OSd8:destroy(); self.OSd8 = nil; end;
        if self.Ne34 ~= nil then self.Ne34:destroy(); self.Ne34 = nil; end;
        if self.OSd4 ~= nil then self.OSd4:destroy(); self.OSd4 = nil; end;
        if self.HhOp1 ~= nil then self.HhOp1:destroy(); self.HhOp1 = nil; end;
        if self.Lhn5 ~= nil then self.Lhn5:destroy(); self.Lhn5 = nil; end;
        if self.image209 ~= nil then self.image209:destroy(); self.image209 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.Ne32 ~= nil then self.Ne32:destroy(); self.Ne32 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.progressBar28 ~= nil then self.progressBar28:destroy(); self.progressBar28 = nil; end;
        if self.image234 ~= nil then self.image234:destroy(); self.image234 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.image179 ~= nil then self.image179:destroy(); self.image179 = nil; end;
        if self.image76 ~= nil then self.image76:destroy(); self.image76 = nil; end;
        if self.image100 ~= nil then self.image100:destroy(); self.image100 = nil; end;
        if self.Ox5 ~= nil then self.Ox5:destroy(); self.Ox5 = nil; end;
        if self.image243 ~= nil then self.image243:destroy(); self.image243 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.LmH2 ~= nil then self.LmH2:destroy(); self.LmH2 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.Oaz4 ~= nil then self.Oaz4:destroy(); self.Oaz4 = nil; end;
        if self.image251 ~= nil then self.image251:destroy(); self.image251 = nil; end;
        if self.image208 ~= nil then self.image208:destroy(); self.image208 = nil; end;
        if self.Ox27 ~= nil then self.Ox27:destroy(); self.Ox27 = nil; end;
        if self.Ox6 ~= nil then self.Ox6:destroy(); self.Ox6 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.textEditor51 ~= nil then self.textEditor51:destroy(); self.textEditor51 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.image149 ~= nil then self.image149:destroy(); self.image149 = nil; end;
        if self.image50 ~= nil then self.image50:destroy(); self.image50 = nil; end;
        if self.image188 ~= nil then self.image188:destroy(); self.image188 = nil; end;
        if self.OSd7 ~= nil then self.OSd7:destroy(); self.OSd7 = nil; end;
        if self.image255 ~= nil then self.image255:destroy(); self.image255 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.LbAn2 ~= nil then self.LbAn2:destroy(); self.LbAn2 = nil; end;
        if self.LjNNave ~= nil then self.LjNNave:destroy(); self.LjNNave = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.progressBar20 ~= nil then self.progressBar20:destroy(); self.progressBar20 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.image216 ~= nil then self.image216:destroy(); self.image216 = nil; end;
        if self.Oaz6 ~= nil then self.Oaz6:destroy(); self.Oaz6 = nil; end;
        if self.NopQ5 ~= nil then self.NopQ5:destroy(); self.NopQ5 = nil; end;
        if self.LjN8 ~= nil then self.LjN8:destroy(); self.LjN8 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.BotaoNaveN32 ~= nil then self.BotaoNaveN32:destroy(); self.BotaoNaveN32 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.Ox28 ~= nil then self.Ox28:destroy(); self.Ox28 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.NkL8 ~= nil then self.NkL8:destroy(); self.NkL8 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.image44 ~= nil then self.image44:destroy(); self.image44 = nil; end;
        if self.Oh233 ~= nil then self.Oh233:destroy(); self.Oh233 = nil; end;
        if self.LmH5 ~= nil then self.LmH5:destroy(); self.LmH5 = nil; end;
        if self.image53 ~= nil then self.image53:destroy(); self.image53 = nil; end;
        if self.textEditor46 ~= nil then self.textEditor46:destroy(); self.textEditor46 = nil; end;
        if self.image109 ~= nil then self.image109:destroy(); self.image109 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.LaH7 ~= nil then self.LaH7:destroy(); self.LaH7 = nil; end;
        if self.textEditor32 ~= nil then self.textEditor32:destroy(); self.textEditor32 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.image205 ~= nil then self.image205:destroy(); self.image205 = nil; end;
        if self.Lhn8 ~= nil then self.Lhn8:destroy(); self.Lhn8 = nil; end;
        if self.Lnave1 ~= nil then self.Lnave1:destroy(); self.Lnave1 = nil; end;
        if self.HccD2 ~= nil then self.HccD2:destroy(); self.HccD2 = nil; end;
        if self.HccD6 ~= nil then self.HccD6:destroy(); self.HccD6 = nil; end;
        if self.HjQNave ~= nil then self.HjQNave:destroy(); self.HjQNave = nil; end;
        if self.n2NNave ~= nil then self.n2NNave:destroy(); self.n2NNave = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.image249 ~= nil then self.image249:destroy(); self.image249 = nil; end;
        if self.image120 ~= nil then self.image120:destroy(); self.image120 = nil; end;
        if self.HhOp5 ~= nil then self.HhOp5:destroy(); self.HhOp5 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.Oh234 ~= nil then self.Oh234:destroy(); self.Oh234 = nil; end;
        if self.image137 ~= nil then self.image137:destroy(); self.image137 = nil; end;
        if self.OlP5 ~= nil then self.OlP5:destroy(); self.OlP5 = nil; end;
        if self.BotaoNaveN2 ~= nil then self.BotaoNaveN2:destroy(); self.BotaoNaveN2 = nil; end;
        if self.BotaoNaveN14 ~= nil then self.BotaoNaveN14:destroy(); self.BotaoNaveN14 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.Nah35 ~= nil then self.Nah35:destroy(); self.Nah35 = nil; end;
        if self.model12 ~= nil then self.model12:destroy(); self.model12 = nil; end;
        if self.textEditor42 ~= nil then self.textEditor42:destroy(); self.textEditor42 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.LjN6 ~= nil then self.LjN6:destroy(); self.LjN6 = nil; end;
        if self.OlP4 ~= nil then self.OlP4:destroy(); self.OlP4 = nil; end;
        if self.textEditor49 ~= nil then self.textEditor49:destroy(); self.textEditor49 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.image166 ~= nil then self.image166:destroy(); self.image166 = nil; end;
        if self.Ox2Nave ~= nil then self.Ox2Nave:destroy(); self.Ox2Nave = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.LbAn8 ~= nil then self.LbAn8:destroy(); self.LbAn8 = nil; end;
        if self.LaH3 ~= nil then self.LaH3:destroy(); self.LaH3 = nil; end;
        if self.image178 ~= nil then self.image178:destroy(); self.image178 = nil; end;
        if self.image65 ~= nil then self.image65:destroy(); self.image65 = nil; end;
        if self.OjHNave ~= nil then self.OjHNave:destroy(); self.OjHNave = nil; end;
        if self.HccD3 ~= nil then self.HccD3:destroy(); self.HccD3 = nil; end;
        if self.Nah31 ~= nil then self.Nah31:destroy(); self.Nah31 = nil; end;
        if self.NkL5 ~= nil then self.NkL5:destroy(); self.NkL5 = nil; end;
        if self.image81 ~= nil then self.image81:destroy(); self.image81 = nil; end;
        if self.image61 ~= nil then self.image61:destroy(); self.image61 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.OjH8 ~= nil then self.OjH8:destroy(); self.OjH8 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.image172 ~= nil then self.image172:destroy(); self.image172 = nil; end;
        if self.NnpNave ~= nil then self.NnpNave:destroy(); self.NnpNave = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.image67 ~= nil then self.image67:destroy(); self.image67 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.textEditor35 ~= nil then self.textEditor35:destroy(); self.textEditor35 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.image88 ~= nil then self.image88:destroy(); self.image88 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.textEditor52 ~= nil then self.textEditor52:destroy(); self.textEditor52 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.BotaoNaveN12 ~= nil then self.BotaoNaveN12:destroy(); self.BotaoNaveN12 = nil; end;
        if self.Lqw4 ~= nil then self.Lqw4:destroy(); self.Lqw4 = nil; end;
        if self.image226 ~= nil then self.image226:destroy(); self.image226 = nil; end;
        if self.progressBar24 ~= nil then self.progressBar24:destroy(); self.progressBar24 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.Lnave2 ~= nil then self.Lnave2:destroy(); self.Lnave2 = nil; end;
        if self.BotaoNaveN27 ~= nil then self.BotaoNaveN27:destroy(); self.BotaoNaveN27 = nil; end;
        if self.Hnm3 ~= nil then self.Hnm3:destroy(); self.Hnm3 = nil; end;
        if self.LmH8 ~= nil then self.LmH8:destroy(); self.LmH8 = nil; end;
        if self.LaHNave ~= nil then self.LaHNave:destroy(); self.LaHNave = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.LqwNave ~= nil then self.LqwNave:destroy(); self.LqwNave = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.H3o4 ~= nil then self.H3o4:destroy(); self.H3o4 = nil; end;
        if self.model3 ~= nil then self.model3:destroy(); self.model3 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.image152 ~= nil then self.image152:destroy(); self.image152 = nil; end;
        if self.LDa6 ~= nil then self.LDa6:destroy(); self.LDa6 = nil; end;
        if self.image47 ~= nil then self.image47:destroy(); self.image47 = nil; end;
        if self.textEditor26 ~= nil then self.textEditor26:destroy(); self.textEditor26 = nil; end;
        if self.LgU2 ~= nil then self.LgU2:destroy(); self.LgU2 = nil; end;
        if self.HccD8 ~= nil then self.HccD8:destroy(); self.HccD8 = nil; end;
        if self.BotaoNaveN20 ~= nil then self.BotaoNaveN20:destroy(); self.BotaoNaveN20 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.image78 ~= nil then self.image78:destroy(); self.image78 = nil; end;
        if self.Ox4 ~= nil then self.Ox4:destroy(); self.Ox4 = nil; end;
        if self.BotaoNaveN19 ~= nil then self.BotaoNaveN19:destroy(); self.BotaoNaveN19 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.LmHNave ~= nil then self.LmHNave:destroy(); self.LmHNave = nil; end;
        if self.Ne31 ~= nil then self.Ne31:destroy(); self.Ne31 = nil; end;
        if self.Lqw3 ~= nil then self.Lqw3:destroy(); self.Lqw3 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.image55 ~= nil then self.image55:destroy(); self.image55 = nil; end;
        if self.image83 ~= nil then self.image83:destroy(); self.image83 = nil; end;
        if self.textEditor23 ~= nil then self.textEditor23:destroy(); self.textEditor23 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.HppNave ~= nil then self.HppNave:destroy(); self.HppNave = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.OjH3 ~= nil then self.OjH3:destroy(); self.OjH3 = nil; end;
        if self.BotaoNaveN1 ~= nil then self.BotaoNaveN1:destroy(); self.BotaoNaveN1 = nil; end;
        if self.NkLNave ~= nil then self.NkLNave:destroy(); self.NkLNave = nil; end;
        if self.Oh231 ~= nil then self.Oh231:destroy(); self.Oh231 = nil; end;
        if self.image68 ~= nil then self.image68:destroy(); self.image68 = nil; end;
        if self.progressBar11 ~= nil then self.progressBar11:destroy(); self.progressBar11 = nil; end;
        if self.textEditor34 ~= nil then self.textEditor34:destroy(); self.textEditor34 = nil; end;
        if self.NnpoQ1 ~= nil then self.NnpoQ1:destroy(); self.NnpoQ1 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.HjKL1 ~= nil then self.HjKL1:destroy(); self.HjKL1 = nil; end;
        if self.image122 ~= nil then self.image122:destroy(); self.image122 = nil; end;
        if self.n2N6 ~= nil then self.n2N6:destroy(); self.n2N6 = nil; end;
        if self.Ox2 ~= nil then self.Ox2:destroy(); self.Ox2 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.Nko6 ~= nil then self.Nko6:destroy(); self.Nko6 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.HnmNave ~= nil then self.HnmNave:destroy(); self.HnmNave = nil; end;
        if self.Hnm8 ~= nil then self.Hnm8:destroy(); self.Hnm8 = nil; end;
        if self.HjKL4 ~= nil then self.HjKL4:destroy(); self.HjKL4 = nil; end;
        if self.Oh236 ~= nil then self.Oh236:destroy(); self.Oh236 = nil; end;
        if self.H2b8 ~= nil then self.H2b8:destroy(); self.H2b8 = nil; end;
        if self.textEditor45 ~= nil then self.textEditor45:destroy(); self.textEditor45 = nil; end;
        if self.OjH1 ~= nil then self.OjH1:destroy(); self.OjH1 = nil; end;
        if self.OSd1 ~= nil then self.OSd1:destroy(); self.OSd1 = nil; end;
        if self.image82 ~= nil then self.image82:destroy(); self.image82 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.progressBar23 ~= nil then self.progressBar23:destroy(); self.progressBar23 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.Lhn4 ~= nil then self.Lhn4:destroy(); self.Lhn4 = nil; end;
        if self.image223 ~= nil then self.image223:destroy(); self.image223 = nil; end;
        if self.textEditor63 ~= nil then self.textEditor63:destroy(); self.textEditor63 = nil; end;
        if self.image139 ~= nil then self.image139:destroy(); self.image139 = nil; end;
        if self.image129 ~= nil then self.image129:destroy(); self.image129 = nil; end;
        if self.image221 ~= nil then self.image221:destroy(); self.image221 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image147 ~= nil then self.image147:destroy(); self.image147 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image46 ~= nil then self.image46:destroy(); self.image46 = nil; end;
        if self.RP11 ~= nil then self.RP11:destroy(); self.RP11 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.image62 ~= nil then self.image62:destroy(); self.image62 = nil; end;
        if self.image77 ~= nil then self.image77:destroy(); self.image77 = nil; end;
        if self.image158 ~= nil then self.image158:destroy(); self.image158 = nil; end;
        if self.model20 ~= nil then self.model20:destroy(); self.model20 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.image127 ~= nil then self.image127:destroy(); self.image127 = nil; end;
        if self.BotaoNaveN21 ~= nil then self.BotaoNaveN21:destroy(); self.BotaoNaveN21 = nil; end;
        if self.model16 ~= nil then self.model16:destroy(); self.model16 = nil; end;
        if self.Nnp3 ~= nil then self.Nnp3:destroy(); self.Nnp3 = nil; end;
        if self.model9 ~= nil then self.model9:destroy(); self.model9 = nil; end;
        if self.n2N4 ~= nil then self.n2N4:destroy(); self.n2N4 = nil; end;
        if self.BotaoNaveN3 ~= nil then self.BotaoNaveN3:destroy(); self.BotaoNaveN3 = nil; end;
        if self.image196 ~= nil then self.image196:destroy(); self.image196 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.progressBar4 ~= nil then self.progressBar4:destroy(); self.progressBar4 = nil; end;
        if self.image250 ~= nil then self.image250:destroy(); self.image250 = nil; end;
        if self.H2bNave ~= nil then self.H2bNave:destroy(); self.H2bNave = nil; end;
        if self.H2b3 ~= nil then self.H2b3:destroy(); self.H2b3 = nil; end;
        if self.HhOp6 ~= nil then self.HhOp6:destroy(); self.HhOp6 = nil; end;
        if self.image66 ~= nil then self.image66:destroy(); self.image66 = nil; end;
        if self.image184 ~= nil then self.image184:destroy(); self.image184 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.image232 ~= nil then self.image232:destroy(); self.image232 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.image84 ~= nil then self.image84:destroy(); self.image84 = nil; end;
        if self.RNP12 ~= nil then self.RNP12:destroy(); self.RNP12 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.HccDNave ~= nil then self.HccDNave:destroy(); self.HccDNave = nil; end;
        if self.n2N5 ~= nil then self.n2N5:destroy(); self.n2N5 = nil; end;
        if self.BotaoNaveN9 ~= nil then self.BotaoNaveN9:destroy(); self.BotaoNaveN9 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.Lnave3 ~= nil then self.Lnave3:destroy(); self.Lnave3 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.progressBar21 ~= nil then self.progressBar21:destroy(); self.progressBar21 = nil; end;
        if self.image143 ~= nil then self.image143:destroy(); self.image143 = nil; end;
        if self.Oqw3 ~= nil then self.Oqw3:destroy(); self.Oqw3 = nil; end;
        if self.image131 ~= nil then self.image131:destroy(); self.image131 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.HjQ4 ~= nil then self.HjQ4:destroy(); self.HjQ4 = nil; end;
        if self.HjKL3 ~= nil then self.HjKL3:destroy(); self.HjKL3 = nil; end;
        if self.H2b6 ~= nil then self.H2b6:destroy(); self.H2b6 = nil; end;
        if self.progressBar26 ~= nil then self.progressBar26:destroy(); self.progressBar26 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.image116 ~= nil then self.image116:destroy(); self.image116 = nil; end;
        if self.image192 ~= nil then self.image192:destroy(); self.image192 = nil; end;
        if self.H3oNave ~= nil then self.H3oNave:destroy(); self.H3oNave = nil; end;
        if self.Lnave4 ~= nil then self.Lnave4:destroy(); self.Lnave4 = nil; end;
        if self.LgU8 ~= nil then self.LgU8:destroy(); self.LgU8 = nil; end;
        if self.image257 ~= nil then self.image257:destroy(); self.image257 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.H3o5 ~= nil then self.H3o5:destroy(); self.H3o5 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.Nko5 ~= nil then self.Nko5:destroy(); self.Nko5 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.image104 ~= nil then self.image104:destroy(); self.image104 = nil; end;
        if self.LbAnNave ~= nil then self.LbAnNave:destroy(); self.LbAnNave = nil; end;
        if self.Lqw6 ~= nil then self.Lqw6:destroy(); self.Lqw6 = nil; end;
        if self.image113 ~= nil then self.image113:destroy(); self.image113 = nil; end;
        if self.image112 ~= nil then self.image112:destroy(); self.image112 = nil; end;
        if self.NopQ7 ~= nil then self.NopQ7:destroy(); self.NopQ7 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.textEditor57 ~= nil then self.textEditor57:destroy(); self.textEditor57 = nil; end;
        if self.image176 ~= nil then self.image176:destroy(); self.image176 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.progressBar3 ~= nil then self.progressBar3:destroy(); self.progressBar3 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.model18 ~= nil then self.model18:destroy(); self.model18 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.NnpoQ7 ~= nil then self.NnpoQ7:destroy(); self.NnpoQ7 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.textEditor61 ~= nil then self.textEditor61:destroy(); self.textEditor61 = nil; end;
        if self.HjKL8 ~= nil then self.HjKL8:destroy(); self.HjKL8 = nil; end;
        if self.image102 ~= nil then self.image102:destroy(); self.image102 = nil; end;
        if self.image148 ~= nil then self.image148:destroy(); self.image148 = nil; end;
        if self.image74 ~= nil then self.image74:destroy(); self.image74 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.model19 ~= nil then self.model19:destroy(); self.model19 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.image191 ~= nil then self.image191:destroy(); self.image191 = nil; end;
        if self.Nnp1 ~= nil then self.Nnp1:destroy(); self.Nnp1 = nil; end;
        if self.HhOp2 ~= nil then self.HhOp2:destroy(); self.HhOp2 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.BotaoNaveN10 ~= nil then self.BotaoNaveN10:destroy(); self.BotaoNaveN10 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.BotaoNaveN5 ~= nil then self.BotaoNaveN5:destroy(); self.BotaoNaveN5 = nil; end;
        if self.image242 ~= nil then self.image242:destroy(); self.image242 = nil; end;
        if self.image142 ~= nil then self.image142:destroy(); self.image142 = nil; end;
        if self.LDa7 ~= nil then self.LDa7:destroy(); self.LDa7 = nil; end;
        if self.LjN4 ~= nil then self.LjN4:destroy(); self.LjN4 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.image80 ~= nil then self.image80:destroy(); self.image80 = nil; end;
        if self.Nah3Nave ~= nil then self.Nah3Nave:destroy(); self.Nah3Nave = nil; end;
        if self.image180 ~= nil then self.image180:destroy(); self.image180 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.HccD5 ~= nil then self.HccD5:destroy(); self.HccD5 = nil; end;
        if self.image155 ~= nil then self.image155:destroy(); self.image155 = nil; end;
        if self.RP12 ~= nil then self.RP12:destroy(); self.RP12 = nil; end;
        if self.LgUNave ~= nil then self.LgUNave:destroy(); self.LgUNave = nil; end;
        if self.image126 ~= nil then self.image126:destroy(); self.image126 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.Ox26 ~= nil then self.Ox26:destroy(); self.Ox26 = nil; end;
        if self.Ne3Nave ~= nil then self.Ne3Nave:destroy(); self.Ne3Nave = nil; end;
        if self.image110 ~= nil then self.image110:destroy(); self.image110 = nil; end;
        if self.image214 ~= nil then self.image214:destroy(); self.image214 = nil; end;
        if self.image151 ~= nil then self.image151:destroy(); self.image151 = nil; end;
        if self.progressBar19 ~= nil then self.progressBar19:destroy(); self.progressBar19 = nil; end;
        if self.image101 ~= nil then self.image101:destroy(); self.image101 = nil; end;
        if self.image175 ~= nil then self.image175:destroy(); self.image175 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image85 ~= nil then self.image85:destroy(); self.image85 = nil; end;
        if self.image225 ~= nil then self.image225:destroy(); self.image225 = nil; end;
        if self.n2N1 ~= nil then self.n2N1:destroy(); self.n2N1 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.OqwNave ~= nil then self.OqwNave:destroy(); self.OqwNave = nil; end;
        if self.Oaz7 ~= nil then self.Oaz7:destroy(); self.Oaz7 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.image60 ~= nil then self.image60:destroy(); self.image60 = nil; end;
        if self.image228 ~= nil then self.image228:destroy(); self.image228 = nil; end;
        if self.image169 ~= nil then self.image169:destroy(); self.image169 = nil; end;
        if self.image187 ~= nil then self.image187:destroy(); self.image187 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.BotaoNaveN26 ~= nil then self.BotaoNaveN26:destroy(); self.BotaoNaveN26 = nil; end;
        if self.LbAn7 ~= nil then self.LbAn7:destroy(); self.LbAn7 = nil; end;
        if self.Nah37 ~= nil then self.Nah37:destroy(); self.Nah37 = nil; end;
        if self.model26 ~= nil then self.model26:destroy(); self.model26 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.image154 ~= nil then self.image154:destroy(); self.image154 = nil; end;
        if self.model7 ~= nil then self.model7:destroy(); self.model7 = nil; end;
        if self.LDa8 ~= nil then self.LDa8:destroy(); self.LDa8 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.image124 ~= nil then self.image124:destroy(); self.image124 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.image79 ~= nil then self.image79:destroy(); self.image79 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.LbAn3 ~= nil then self.LbAn3:destroy(); self.LbAn3 = nil; end;
        if self.LbAn1 ~= nil then self.LbAn1:destroy(); self.LbAn1 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.Oqw2 ~= nil then self.Oqw2:destroy(); self.Oqw2 = nil; end;
        if self.BotaoNaveN25 ~= nil then self.BotaoNaveN25:destroy(); self.BotaoNaveN25 = nil; end;
        if self.image118 ~= nil then self.image118:destroy(); self.image118 = nil; end;
        if self.image45 ~= nil then self.image45:destroy(); self.image45 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image177 ~= nil then self.image177:destroy(); self.image177 = nil; end;
        if self.image106 ~= nil then self.image106:destroy(); self.image106 = nil; end;
        if self.LmH6 ~= nil then self.LmH6:destroy(); self.LmH6 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.textEditor36 ~= nil then self.textEditor36:destroy(); self.textEditor36 = nil; end;
        if self.image195 ~= nil then self.image195:destroy(); self.image195 = nil; end;
        if self.image197 ~= nil then self.image197:destroy(); self.image197 = nil; end;
        if self.BotaoNaveN4 ~= nil then self.BotaoNaveN4:destroy(); self.BotaoNaveN4 = nil; end;
        if self.image207 ~= nil then self.image207:destroy(); self.image207 = nil; end;
        if self.Ne33 ~= nil then self.Ne33:destroy(); self.Ne33 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.Lhn7 ~= nil then self.Lhn7:destroy(); self.Lhn7 = nil; end;
        if self.Nnp7 ~= nil then self.Nnp7:destroy(); self.Nnp7 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.LjN5 ~= nil then self.LjN5:destroy(); self.LjN5 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.Ne38 ~= nil then self.Ne38:destroy(); self.Ne38 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor56 ~= nil then self.textEditor56:destroy(); self.textEditor56 = nil; end;
        if self.model24 ~= nil then self.model24:destroy(); self.model24 = nil; end;
        if self.image241 ~= nil then self.image241:destroy(); self.image241 = nil; end;
        if self.Lqw1 ~= nil then self.Lqw1:destroy(); self.Lqw1 = nil; end;
        if self.image92 ~= nil then self.image92:destroy(); self.image92 = nil; end;
        if self.BotaoNaveN23 ~= nil then self.BotaoNaveN23:destroy(); self.BotaoNaveN23 = nil; end;
        if self.image153 ~= nil then self.image153:destroy(); self.image153 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.H3o3 ~= nil then self.H3o3:destroy(); self.H3o3 = nil; end;
        if self.HjKL2 ~= nil then self.HjKL2:destroy(); self.HjKL2 = nil; end;
        if self.Ox25 ~= nil then self.Ox25:destroy(); self.Ox25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.LaH2 ~= nil then self.LaH2:destroy(); self.LaH2 = nil; end;
        if self.Nko2 ~= nil then self.Nko2:destroy(); self.Nko2 = nil; end;
        if self.image58 ~= nil then self.image58:destroy(); self.image58 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.Hpp3 ~= nil then self.Hpp3:destroy(); self.Hpp3 = nil; end;
        if self.NkL1 ~= nil then self.NkL1:destroy(); self.NkL1 = nil; end;
        if self.LbAn6 ~= nil then self.LbAn6:destroy(); self.LbAn6 = nil; end;
        if self.OjH4 ~= nil then self.OjH4:destroy(); self.OjH4 = nil; end;
        if self.LjN3 ~= nil then self.LjN3:destroy(); self.LjN3 = nil; end;
        if self.image97 ~= nil then self.image97:destroy(); self.image97 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.LaH6 ~= nil then self.LaH6:destroy(); self.LaH6 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.image181 ~= nil then self.image181:destroy(); self.image181 = nil; end;
        if self.Nnp4 ~= nil then self.Nnp4:destroy(); self.Nnp4 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.HccD4 ~= nil then self.HccD4:destroy(); self.HccD4 = nil; end;
        if self.progressBar14 ~= nil then self.progressBar14:destroy(); self.progressBar14 = nil; end;
        if self.OlP3 ~= nil then self.OlP3:destroy(); self.OlP3 = nil; end;
        if self.image125 ~= nil then self.image125:destroy(); self.image125 = nil; end;
        if self.LgU3 ~= nil then self.LgU3:destroy(); self.LgU3 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.image96 ~= nil then self.image96:destroy(); self.image96 = nil; end;
        if self.NkL6 ~= nil then self.NkL6:destroy(); self.NkL6 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.image190 ~= nil then self.image190:destroy(); self.image190 = nil; end;
        if self.image254 ~= nil then self.image254:destroy(); self.image254 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.image99 ~= nil then self.image99:destroy(); self.image99 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.image215 ~= nil then self.image215:destroy(); self.image215 = nil; end;
        if self.model10 ~= nil then self.model10:destroy(); self.model10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.LgU4 ~= nil then self.LgU4:destroy(); self.LgU4 = nil; end;
        if self.BotaoNaveN11 ~= nil then self.BotaoNaveN11:destroy(); self.BotaoNaveN11 = nil; end;
        if self.image146 ~= nil then self.image146:destroy(); self.image146 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.progressBar18 ~= nil then self.progressBar18:destroy(); self.progressBar18 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.textEditor22 ~= nil then self.textEditor22:destroy(); self.textEditor22 = nil; end;
        if self.HjQ1 ~= nil then self.HjQ1:destroy(); self.HjQ1 = nil; end;
        if self.image108 ~= nil then self.image108:destroy(); self.image108 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.image220 ~= nil then self.image220:destroy(); self.image220 = nil; end;
        if self.OlP8 ~= nil then self.OlP8:destroy(); self.OlP8 = nil; end;
        if self.Lqw5 ~= nil then self.Lqw5:destroy(); self.Lqw5 = nil; end;
        if self.textEditor30 ~= nil then self.textEditor30:destroy(); self.textEditor30 = nil; end;
        if self.image89 ~= nil then self.image89:destroy(); self.image89 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.BotaoNaveN30 ~= nil then self.BotaoNaveN30:destroy(); self.BotaoNaveN30 = nil; end;
        if self.Oaz1 ~= nil then self.Oaz1:destroy(); self.Oaz1 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.progressBar22 ~= nil then self.progressBar22:destroy(); self.progressBar22 = nil; end;
        if self.image93 ~= nil then self.image93:destroy(); self.image93 = nil; end;
        if self.LaH5 ~= nil then self.LaH5:destroy(); self.LaH5 = nil; end;
        if self.LmH4 ~= nil then self.LmH4:destroy(); self.LmH4 = nil; end;
        if self.Nnp8 ~= nil then self.Nnp8:destroy(); self.Nnp8 = nil; end;
        if self.image90 ~= nil then self.image90:destroy(); self.image90 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.OlP2 ~= nil then self.OlP2:destroy(); self.OlP2 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.Lhn6 ~= nil then self.Lhn6:destroy(); self.Lhn6 = nil; end;
        if self.image159 ~= nil then self.image159:destroy(); self.image159 = nil; end;
        if self.H3o8 ~= nil then self.H3o8:destroy(); self.H3o8 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image59 ~= nil then self.image59:destroy(); self.image59 = nil; end;
        if self.image134 ~= nil then self.image134:destroy(); self.image134 = nil; end;
        if self.image219 ~= nil then self.image219:destroy(); self.image219 = nil; end;
        if self.OSd2 ~= nil then self.OSd2:destroy(); self.OSd2 = nil; end;
        if self.model31 ~= nil then self.model31:destroy(); self.model31 = nil; end;
        if self.HhOp8 ~= nil then self.HhOp8:destroy(); self.HhOp8 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image121 ~= nil then self.image121:destroy(); self.image121 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.image189 ~= nil then self.image189:destroy(); self.image189 = nil; end;
        if self.BotaoNaveN6 ~= nil then self.BotaoNaveN6:destroy(); self.BotaoNaveN6 = nil; end;
        if self.image168 ~= nil then self.image168:destroy(); self.image168 = nil; end;
        if self.OazNave ~= nil then self.OazNave:destroy(); self.OazNave = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.image73 ~= nil then self.image73:destroy(); self.image73 = nil; end;
        if self.Oh238 ~= nil then self.Oh238:destroy(); self.Oh238 = nil; end;
        if self.NnpoQ5 ~= nil then self.NnpoQ5:destroy(); self.NnpoQ5 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.RP13 ~= nil then self.RP13:destroy(); self.RP13 = nil; end;
        if self.Oaz5 ~= nil then self.Oaz5:destroy(); self.Oaz5 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.textEditor59 ~= nil then self.textEditor59:destroy(); self.textEditor59 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.RNP13 ~= nil then self.RNP13:destroy(); self.RNP13 = nil; end;
        if self.Ne37 ~= nil then self.Ne37:destroy(); self.Ne37 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.OxNave ~= nil then self.OxNave:destroy(); self.OxNave = nil; end;
        if self.progressBar30 ~= nil then self.progressBar30:destroy(); self.progressBar30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.NopQ3 ~= nil then self.NopQ3:destroy(); self.NopQ3 = nil; end;
        if self.image72 ~= nil then self.image72:destroy(); self.image72 = nil; end;
        if self.Oqw8 ~= nil then self.Oqw8:destroy(); self.Oqw8 = nil; end;
        if self.image238 ~= nil then self.image238:destroy(); self.image238 = nil; end;
        if self.textEditor62 ~= nil then self.textEditor62:destroy(); self.textEditor62 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.progressBar15 ~= nil then self.progressBar15:destroy(); self.progressBar15 = nil; end;
        if self.image71 ~= nil then self.image71:destroy(); self.image71 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.model14 ~= nil then self.model14:destroy(); self.model14 = nil; end;
        if self.Oh23Nave ~= nil then self.Oh23Nave:destroy(); self.Oh23Nave = nil; end;
        if self.HhOp3 ~= nil then self.HhOp3:destroy(); self.HhOp3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.NopQ4 ~= nil then self.NopQ4:destroy(); self.NopQ4 = nil; end;
        if self.image258 ~= nil then self.image258:destroy(); self.image258 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.textEditor50 ~= nil then self.textEditor50:destroy(); self.textEditor50 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.progressBar13 ~= nil then self.progressBar13:destroy(); self.progressBar13 = nil; end;
        if self.NnpoQNave ~= nil then self.NnpoQNave:destroy(); self.NnpoQNave = nil; end;
        if self.OSd5 ~= nil then self.OSd5:destroy(); self.OSd5 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.image119 ~= nil then self.image119:destroy(); self.image119 = nil; end;
        if self.image245 ~= nil then self.image245:destroy(); self.image245 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.Hpp6 ~= nil then self.Hpp6:destroy(); self.Hpp6 = nil; end;
        if self.progressBar16 ~= nil then self.progressBar16:destroy(); self.progressBar16 = nil; end;
        if self.textEditor25 ~= nil then self.textEditor25:destroy(); self.textEditor25 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.Lqw7 ~= nil then self.Lqw7:destroy(); self.Lqw7 = nil; end;
        if self.n2N8 ~= nil then self.n2N8:destroy(); self.n2N8 = nil; end;
        if self.model23 ~= nil then self.model23:destroy(); self.model23 = nil; end;
        if self.progressBar9 ~= nil then self.progressBar9:destroy(); self.progressBar9 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.image111 ~= nil then self.image111:destroy(); self.image111 = nil; end;
        if self.LbAn5 ~= nil then self.LbAn5:destroy(); self.LbAn5 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.BotaoNaveN18 ~= nil then self.BotaoNaveN18:destroy(); self.BotaoNaveN18 = nil; end;
        if self.progressBar31 ~= nil then self.progressBar31:destroy(); self.progressBar31 = nil; end;
        if self.image239 ~= nil then self.image239:destroy(); self.image239 = nil; end;
        if self.image98 ~= nil then self.image98:destroy(); self.image98 = nil; end;
        if self.image227 ~= nil then self.image227:destroy(); self.image227 = nil; end;
        if self.NopQ2 ~= nil then self.NopQ2:destroy(); self.NopQ2 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.Nah34 ~= nil then self.Nah34:destroy(); self.Nah34 = nil; end;
        if self.model27 ~= nil then self.model27:destroy(); self.model27 = nil; end;
        if self.Oqw7 ~= nil then self.Oqw7:destroy(); self.Oqw7 = nil; end;
        if self.textEditor60 ~= nil then self.textEditor60:destroy(); self.textEditor60 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.image235 ~= nil then self.image235:destroy(); self.image235 = nil; end;
        if self.HjQ3 ~= nil then self.HjQ3:destroy(); self.HjQ3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.Nko8 ~= nil then self.Nko8:destroy(); self.Nko8 = nil; end;
        if self.image156 ~= nil then self.image156:destroy(); self.image156 = nil; end;
        if self.Nko4 ~= nil then self.Nko4:destroy(); self.Nko4 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.progressBar25 ~= nil then self.progressBar25:destroy(); self.progressBar25 = nil; end;
        if self.image204 ~= nil then self.image204:destroy(); self.image204 = nil; end;
        if self.Oqw1 ~= nil then self.Oqw1:destroy(); self.Oqw1 = nil; end;
        if self.H3o6 ~= nil then self.H3o6:destroy(); self.H3o6 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.H3o1 ~= nil then self.H3o1:destroy(); self.H3o1 = nil; end;
        if self.image138 ~= nil then self.image138:destroy(); self.image138 = nil; end;
        if self.image163 ~= nil then self.image163:destroy(); self.image163 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.LgU1 ~= nil then self.LgU1:destroy(); self.LgU1 = nil; end;
        if self.H2b5 ~= nil then self.H2b5:destroy(); self.H2b5 = nil; end;
        if self.image141 ~= nil then self.image141:destroy(); self.image141 = nil; end;
        if self.n2N7 ~= nil then self.n2N7:destroy(); self.n2N7 = nil; end;
        if self.Ox7 ~= nil then self.Ox7:destroy(); self.Ox7 = nil; end;
        if self.image182 ~= nil then self.image182:destroy(); self.image182 = nil; end;
        if self.image164 ~= nil then self.image164:destroy(); self.image164 = nil; end;
        if self.image115 ~= nil then self.image115:destroy(); self.image115 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.RNP11 ~= nil then self.RNP11:destroy(); self.RNP11 = nil; end;
        if self.model22 ~= nil then self.model22:destroy(); self.model22 = nil; end;
        if self.Nah36 ~= nil then self.Nah36:destroy(); self.Nah36 = nil; end;
        if self.NnpoQ6 ~= nil then self.NnpoQ6:destroy(); self.NnpoQ6 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image150 ~= nil then self.image150:destroy(); self.image150 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.BotaoNaveN7 ~= nil then self.BotaoNaveN7:destroy(); self.BotaoNaveN7 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.Ox8 ~= nil then self.Ox8:destroy(); self.Ox8 = nil; end;
        if self.image185 ~= nil then self.image185:destroy(); self.image185 = nil; end;
        if self.Oaz8 ~= nil then self.Oaz8:destroy(); self.Oaz8 = nil; end;
        if self.textEditor29 ~= nil then self.textEditor29:destroy(); self.textEditor29 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image86 ~= nil then self.image86:destroy(); self.image86 = nil; end;
        if self.Nah33 ~= nil then self.Nah33:destroy(); self.Nah33 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.Hpp5 ~= nil then self.Hpp5:destroy(); self.Hpp5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.Hnm5 ~= nil then self.Hnm5:destroy(); self.Hnm5 = nil; end;
        if self.Lqw8 ~= nil then self.Lqw8:destroy(); self.Lqw8 = nil; end;
        if self.HjQ6 ~= nil then self.HjQ6:destroy(); self.HjQ6 = nil; end;
        if self.image114 ~= nil then self.image114:destroy(); self.image114 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor41 ~= nil then self.textEditor41:destroy(); self.textEditor41 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.OjH6 ~= nil then self.OjH6:destroy(); self.OjH6 = nil; end;
        if self.Oaz2 ~= nil then self.Oaz2:destroy(); self.Oaz2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.H2b7 ~= nil then self.H2b7:destroy(); self.H2b7 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.image224 ~= nil then self.image224:destroy(); self.image224 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.progressBar32 ~= nil then self.progressBar32:destroy(); self.progressBar32 = nil; end;
        if self.image160 ~= nil then self.image160:destroy(); self.image160 = nil; end;
        if self.image230 ~= nil then self.image230:destroy(); self.image230 = nil; end;
        if self.RP10 ~= nil then self.RP10:destroy(); self.RP10 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.Oh235 ~= nil then self.Oh235:destroy(); self.Oh235 = nil; end;
        if self.Oh237 ~= nil then self.Oh237:destroy(); self.Oh237 = nil; end;
        if self.HhOpNave ~= nil then self.HhOpNave:destroy(); self.HhOpNave = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.textEditor31 ~= nil then self.textEditor31:destroy(); self.textEditor31 = nil; end;
        if self.NkL3 ~= nil then self.NkL3:destroy(); self.NkL3 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.HjQ8 ~= nil then self.HjQ8:destroy(); self.HjQ8 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.textEditor33 ~= nil then self.textEditor33:destroy(); self.textEditor33 = nil; end;
        if self.image236 ~= nil then self.image236:destroy(); self.image236 = nil; end;
        if self.textEditor39 ~= nil then self.textEditor39:destroy(); self.textEditor39 = nil; end;
        if self.Nko1 ~= nil then self.Nko1:destroy(); self.Nko1 = nil; end;
        if self.LaH1 ~= nil then self.LaH1:destroy(); self.LaH1 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.LDa4 ~= nil then self.LDa4:destroy(); self.LDa4 = nil; end;
        if self.LmH3 ~= nil then self.LmH3:destroy(); self.LmH3 = nil; end;
        if self.OlP6 ~= nil then self.OlP6:destroy(); self.OlP6 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.model21 ~= nil then self.model21:destroy(); self.model21 = nil; end;
        if self.Hpp2 ~= nil then self.Hpp2:destroy(); self.Hpp2 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.model28 ~= nil then self.model28:destroy(); self.model28 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.LhnNave ~= nil then self.LhnNave:destroy(); self.LhnNave = nil; end;
        if self.textEditor64 ~= nil then self.textEditor64:destroy(); self.textEditor64 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.image212 ~= nil then self.image212:destroy(); self.image212 = nil; end;
        if self.progressBar29 ~= nil then self.progressBar29:destroy(); self.progressBar29 = nil; end;
        if self.NopQ8 ~= nil then self.NopQ8:destroy(); self.NopQ8 = nil; end;
        if self.image128 ~= nil then self.image128:destroy(); self.image128 = nil; end;
        if self.LDaNave ~= nil then self.LDaNave:destroy(); self.LDaNave = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.image247 ~= nil then self.image247:destroy(); self.image247 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.image237 ~= nil then self.image237:destroy(); self.image237 = nil; end;
        if self.NkL7 ~= nil then self.NkL7:destroy(); self.NkL7 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.Ox1 ~= nil then self.Ox1:destroy(); self.Ox1 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.model11 ~= nil then self.model11:destroy(); self.model11 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.Oqw4 ~= nil then self.Oqw4:destroy(); self.Oqw4 = nil; end;
        if self.Nko7 ~= nil then self.Nko7:destroy(); self.Nko7 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.textEditor37 ~= nil then self.textEditor37:destroy(); self.textEditor37 = nil; end;
        if self.image173 ~= nil then self.image173:destroy(); self.image173 = nil; end;
        if self.HjQ7 ~= nil then self.HjQ7:destroy(); self.HjQ7 = nil; end;
        if self.image252 ~= nil then self.image252:destroy(); self.image252 = nil; end;
        if self.image203 ~= nil then self.image203:destroy(); self.image203 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.H2b4 ~= nil then self.H2b4:destroy(); self.H2b4 = nil; end;
        if self.HjQ2 ~= nil then self.HjQ2:destroy(); self.HjQ2 = nil; end;
        if self.image222 ~= nil then self.image222:destroy(); self.image222 = nil; end;
        if self.NopQ1 ~= nil then self.NopQ1:destroy(); self.NopQ1 = nil; end;
        if self.image202 ~= nil then self.image202:destroy(); self.image202 = nil; end;
        if self.image48 ~= nil then self.image48:destroy(); self.image48 = nil; end;
        if self.image57 ~= nil then self.image57:destroy(); self.image57 = nil; end;
        if self.image174 ~= nil then self.image174:destroy(); self.image174 = nil; end;
        if self.textEditor24 ~= nil then self.textEditor24:destroy(); self.textEditor24 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.HjKL7 ~= nil then self.HjKL7:destroy(); self.HjKL7 = nil; end;
        if self.model29 ~= nil then self.model29:destroy(); self.model29 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.image69 ~= nil then self.image69:destroy(); self.image69 = nil; end;
        if self.textEditor44 ~= nil then self.textEditor44:destroy(); self.textEditor44 = nil; end;
        if self.Lhn1 ~= nil then self.Lhn1:destroy(); self.Lhn1 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.image87 ~= nil then self.image87:destroy(); self.image87 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.Oqw6 ~= nil then self.Oqw6:destroy(); self.Oqw6 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.n2N2 ~= nil then self.n2N2:destroy(); self.n2N2 = nil; end;
        if self.Oaz3 ~= nil then self.Oaz3:destroy(); self.Oaz3 = nil; end;
        if self.BotaoNaveN28 ~= nil then self.BotaoNaveN28:destroy(); self.BotaoNaveN28 = nil; end;
        if self.RNP10 ~= nil then self.RNP10:destroy(); self.RNP10 = nil; end;
        if self.Nnp2 ~= nil then self.Nnp2:destroy(); self.Nnp2 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.image162 ~= nil then self.image162:destroy(); self.image162 = nil; end;
        if self.NnpoQ8 ~= nil then self.NnpoQ8:destroy(); self.NnpoQ8 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.image253 ~= nil then self.image253:destroy(); self.image253 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.image194 ~= nil then self.image194:destroy(); self.image194 = nil; end;
        if self.model25 ~= nil then self.model25:destroy(); self.model25 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.image130 ~= nil then self.image130:destroy(); self.image130 = nil; end;
        if self.HhOp7 ~= nil then self.HhOp7:destroy(); self.HhOp7 = nil; end;
        if self.LDa2 ~= nil then self.LDa2:destroy(); self.LDa2 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.image167 ~= nil then self.image167:destroy(); self.image167 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.image199 ~= nil then self.image199:destroy(); self.image199 = nil; end;
        if self.Hpp1 ~= nil then self.Hpp1:destroy(); self.Hpp1 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.Hnm2 ~= nil then self.Hnm2:destroy(); self.Hnm2 = nil; end;
        if self.Hnm7 ~= nil then self.Hnm7:destroy(); self.Hnm7 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.Ox23 ~= nil then self.Ox23:destroy(); self.Ox23 = nil; end;
        if self.image186 ~= nil then self.image186:destroy(); self.image186 = nil; end;
        if self.progressBar6 ~= nil then self.progressBar6:destroy(); self.progressBar6 = nil; end;
        if self.LDa3 ~= nil then self.LDa3:destroy(); self.LDa3 = nil; end;
        if self.OjH5 ~= nil then self.OjH5:destroy(); self.OjH5 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.progressBar27 ~= nil then self.progressBar27:destroy(); self.progressBar27 = nil; end;
        if self.NopQNave ~= nil then self.NopQNave:destroy(); self.NopQNave = nil; end;
        if self.progressBar12 ~= nil then self.progressBar12:destroy(); self.progressBar12 = nil; end;
        if self.NnpoQ2 ~= nil then self.NnpoQ2:destroy(); self.NnpoQ2 = nil; end;
        if self.LjN7 ~= nil then self.LjN7:destroy(); self.LjN7 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.HccD7 ~= nil then self.HccD7:destroy(); self.HccD7 = nil; end;
        if self.OSdNave ~= nil then self.OSdNave:destroy(); self.OSdNave = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.textEditor53 ~= nil then self.textEditor53:destroy(); self.textEditor53 = nil; end;
        if self.model1 ~= nil then self.model1:destroy(); self.model1 = nil; end;
        if self.LmH1 ~= nil then self.LmH1:destroy(); self.LmH1 = nil; end;
        if self.Nnp6 ~= nil then self.Nnp6:destroy(); self.Nnp6 = nil; end;
        if self.textEditor28 ~= nil then self.textEditor28:destroy(); self.textEditor28 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.model2 ~= nil then self.model2:destroy(); self.model2 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.BotaoNaveN22 ~= nil then self.BotaoNaveN22:destroy(); self.BotaoNaveN22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.progressBar17 ~= nil then self.progressBar17:destroy(); self.progressBar17 = nil; end;
        if self.image218 ~= nil then self.image218:destroy(); self.image218 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.Oqw5 ~= nil then self.Oqw5:destroy(); self.Oqw5 = nil; end;
        if self.BotaoNaveN31 ~= nil then self.BotaoNaveN31:destroy(); self.BotaoNaveN31 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.Ox21 ~= nil then self.Ox21:destroy(); self.Ox21 = nil; end;
        if self.HjQ5 ~= nil then self.HjQ5:destroy(); self.HjQ5 = nil; end;
        if self.Hpp8 ~= nil then self.Hpp8:destroy(); self.Hpp8 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.BotaoNaveN17 ~= nil then self.BotaoNaveN17:destroy(); self.BotaoNaveN17 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha123_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha123_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha123_svg = {
    newEditor = newfrmFicha123_svg, 
    new = newfrmFicha123_svg, 
    name = "frmFicha123_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha123_svg = _frmFicha123_svg;
Firecast.registrarForm(_frmFicha123_svg);

return _frmFicha123_svg;
