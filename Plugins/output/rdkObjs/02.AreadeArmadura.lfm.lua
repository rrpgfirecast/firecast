require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha2_svg()
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
    obj:setName("frmFicha2_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(1500);
    obj.rectangle1:setHeight(800);
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(1500);
    obj.image1:setHeight(800);
    obj.image1:setSRC("images/2.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.Msg1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Msg1:setParent(obj.rectangle1);
    obj.Msg1:setHitTest(true);
    obj.Msg1:setTop(358);
    obj.Msg1:setLeft(50);
    obj.Msg1:setWidth(129);
    obj.Msg1:setHeight(39);
    obj.Msg1:setName("Msg1");

    obj.Msg2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Msg2:setParent(obj.rectangle1);
    obj.Msg2:setHitTest(true);
    obj.Msg2:setTop(358);
    obj.Msg2:setLeft(225);
    obj.Msg2:setWidth(129);
    obj.Msg2:setHeight(39);
    obj.Msg2:setName("Msg2");

    obj.Msg3 = GUI.fromHandle(_obj_newObject("image"));
    obj.Msg3:setParent(obj.rectangle1);
    obj.Msg3:setHitTest(true);
    obj.Msg3:setTop(20);
    obj.Msg3:setLeft(400);
    obj.Msg3:setWidth(129);
    obj.Msg3:setHeight(39);
    obj.Msg3:setName("Msg3");

    obj.Msg4 = GUI.fromHandle(_obj_newObject("image"));
    obj.Msg4:setParent(obj.rectangle1);
    obj.Msg4:setHitTest(true);
    obj.Msg4:setTop(140);
    obj.Msg4:setLeft(400);
    obj.Msg4:setWidth(129);
    obj.Msg4:setHeight(39);
    obj.Msg4:setName("Msg4");

    obj.Msg5 = GUI.fromHandle(_obj_newObject("image"));
    obj.Msg5:setParent(obj.rectangle1);
    obj.Msg5:setHitTest(true);
    obj.Msg5:setTop(255);
    obj.Msg5:setLeft(400);
    obj.Msg5:setWidth(129);
    obj.Msg5:setHeight(39);
    obj.Msg5:setName("Msg5");

    obj.Msg6 = GUI.fromHandle(_obj_newObject("image"));
    obj.Msg6:setParent(obj.rectangle1);
    obj.Msg6:setHitTest(true);
    obj.Msg6:setTop(365);
    obj.Msg6:setLeft(420);
    obj.Msg6:setWidth(129);
    obj.Msg6:setHeight(39);
    obj.Msg6:setName("Msg6");

    obj.Msg7 = GUI.fromHandle(_obj_newObject("image"));
    obj.Msg7:setParent(obj.rectangle1);
    obj.Msg7:setHitTest(true);
    obj.Msg7:setTop(600);
    obj.Msg7:setLeft(420);
    obj.Msg7:setWidth(129);
    obj.Msg7:setHeight(39);
    obj.Msg7:setName("Msg7");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setTop(120);
    obj.label1:setLeft(1265);
    obj.label1:setText("0");
    obj.label1:setFontSize(20);
    obj.label1:setField("Pontos");
    obj.label1:setHitTest(true);
    obj.label1:setWidth(257);
    obj.label1:setHeight(28);
    obj.label1:setFontFamily("Tahoma");
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setTop(181);
    obj.label2:setLeft(1406);
    obj.label2:setText("0");
    obj.label2:setFontSize(25);
    obj.label2:setField("Nivel");
    obj.label2:setHitTest(true);
    obj.label2:setWidth(57);
    obj.label2:setHeight(51);
    obj.label2:setFontFamily("Dotum");
    obj.label2:setFontColor("black");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setText("UP");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setFontColor("yellow");
    obj.button1:setWidth(35);
    obj.button1:setHeight(20);
    obj.button1:setTop(235);
    obj.button1:setLeft(1415);
    obj.button1:setName("button1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setSRC("/Imagens/Reseta.png");
    obj.image2:setWidth(60);
    obj.image2:setHeight(50);
    obj.image2:setTop(60);
    obj.image2:setLeft(1250);
    obj.image2:setHitTest(true);
    obj.image2:setCursor("handPoint");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setField("imagemDoPersonagem");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setLeft(65);
    obj.image3:setTop(9);
    obj.image3:setWidth(231);
    obj.image3:setHeight(230);
    obj.image3:setName("image3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setField("Nome");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(20);
    obj.edit1:setWidth(251);
    obj.edit1:setFontFamily("Andalus");
    obj.edit1:setTop(246);
    obj.edit1:setLeft(92);
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setField("Versao");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(20);
    obj.edit2:setWidth(251);
    obj.edit2:setFontFamily("Andalus");
    obj.edit2:setTop(278);
    obj.edit2:setLeft(93);
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setField("CDnA");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(20);
    obj.edit3:setWidth(251);
    obj.edit3:setFontFamily("Andalus");
    obj.edit3:setTop(310);
    obj.edit3:setLeft(93);
    obj.edit3:setName("edit3");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setField("Ppeesquerdooutros");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(15);
    obj.textEditor1:setWidth(162);
    obj.textEditor1:setHeight(174);
    obj.textEditor1:setTop(618);
    obj.textEditor1:setLeft(9);
    obj.textEditor1:setFontFamily("times New Roman");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle1);
    obj.textEditor2:setField("Ppedireitooutros");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(15);
    obj.textEditor2:setWidth(162);
    obj.textEditor2:setHeight(175);
    obj.textEditor2:setTop(618);
    obj.textEditor2:setLeft(185);
    obj.textEditor2:setFontFamily("times New Roman");
    obj.textEditor2:setName("textEditor2");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle1);
    obj.textEditor3:setField("Costasoutros");
    obj.textEditor3:setWidth(310);
    obj.textEditor3:setHeight(88);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setTop(12);
    obj.textEditor3:setLeft(779);
    obj.textEditor3:setFontFamily("times New Roman");
    obj.textEditor3:setFontSize(15);
    obj.textEditor3:setName("textEditor3");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle1);
    obj.textEditor4:setField("Mmaoesquerdaoutros");
    obj.textEditor4:setWidth(310);
    obj.textEditor4:setHeight(88);
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setTop(134);
    obj.textEditor4:setLeft(779);
    obj.textEditor4:setFontFamily("times New Roman");
    obj.textEditor4:setFontSize(15);
    obj.textEditor4:setName("textEditor4");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle1);
    obj.textEditor5:setField("Mmaodireitaoutros");
    obj.textEditor5:setWidth(310);
    obj.textEditor5:setHeight(88);
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setTop(250);
    obj.textEditor5:setLeft(779);
    obj.textEditor5:setFontFamily("times New Roman");
    obj.textEditor5:setFontSize(15);
    obj.textEditor5:setName("textEditor5");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle1);
    obj.textEditor6:setField("Cabecaoutros");
    obj.textEditor6:setWidth(600);
    obj.textEditor6:setHeight(78);
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setTop(494);
    obj.textEditor6:setLeft(495);
    obj.textEditor6:setFontFamily("times New Roman");
    obj.textEditor6:setFontSize(15);
    obj.textEditor6:setName("textEditor6");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle1);
    obj.textEditor7:setField("Olhooutros");
    obj.textEditor7:setWidth(600);
    obj.textEditor7:setHeight(78);
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setTop(713);
    obj.textEditor7:setLeft(495);
    obj.textEditor7:setFontFamily("times New Roman");
    obj.textEditor7:setFontSize(15);
    obj.textEditor7:setName("textEditor7");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setText("-");
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setTop(500);
    obj.button2:setLeft(150);
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setText("+");
    obj.button3:setWidth(20);
    obj.button3:setHeight(20);
    obj.button3:setTop(500);
    obj.button3:setLeft(131);
    obj.button3:setName("button3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setField("Ppeesquerdo");
    obj.label3:setFontSize(38);
    obj.label3:setFontFamily("Algerian");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWidth(166);
    obj.label3:setHeight(75);
    obj.label3:setTop(515);
    obj.label3:setLeft(9);
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setName("label3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.label3);
    obj.edit4:setWidth(167);
    obj.edit4:setHeight(24);
    obj.edit4:setFontSize(15);
    obj.edit4:setFontFamily("times New Roman");
    obj.edit4:setText("Habilidade");
    obj.edit4:setAlign("top");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("Cyan");
    obj.edit4:setTransparent(true);
    obj.edit4:setField("atributopeesquerdo");
    obj.edit4:setName("edit4");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setText("+");
    obj.button4:setWidth(20);
    obj.button4:setHeight(20);
    obj.button4:setTop(501);
    obj.button4:setLeft(306);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setText("-");
    obj.button5:setWidth(20);
    obj.button5:setHeight(20);
    obj.button5:setTop(501);
    obj.button5:setLeft(325);
    obj.button5:setName("button5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setField("Ppedireito");
    obj.label4:setFontSize(38);
    obj.label4:setFontFamily("Algerian");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWidth(166);
    obj.label4:setHeight(75);
    obj.label4:setTop(515);
    obj.label4:setLeft(184);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.label4);
    obj.edit5:setTransparent(true);
    obj.edit5:setWidth(167);
    obj.edit5:setHeight(24);
    obj.edit5:setField("atributopedireito");
    obj.edit5:setFontSize(15);
    obj.edit5:setFontFamily("times New Roman");
    obj.edit5:setAlign("top");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontColor("Cyan");
    obj.edit5:setName("edit5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setText("+");
    obj.button6:setWidth(20);
    obj.button6:setHeight(20);
    obj.button6:setTop(14);
    obj.button6:setLeft(589);
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setText("-");
    obj.button7:setWidth(20);
    obj.button7:setHeight(20);
    obj.button7:setTop(14);
    obj.button7:setLeft(608);
    obj.button7:setName("button7");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setField("Costas");
    obj.label5:setFontSize(38);
    obj.label5:setFontFamily("Algerian");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWidth(166);
    obj.label5:setHeight(75);
    obj.label5:setTop(13);
    obj.label5:setLeft(559);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setName("label5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setTransparent(true);
    obj.edit6:setWidth(111);
    obj.edit6:setHeight(24);
    obj.edit6:setField("atributocostas");
    obj.edit6:setFontSize(15);
    obj.edit6:setFontFamily("times New Roman");
    obj.edit6:setMargins({top=-15});
    obj.edit6:setTop(44);
    obj.edit6:setLeft(508);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontColor("Cyan");
    obj.edit6:setName("edit6");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setText("+");
    obj.button8:setWidth(20);
    obj.button8:setHeight(20);
    obj.button8:setTop(134);
    obj.button8:setLeft(589);
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle1);
    obj.button9:setText("-");
    obj.button9:setWidth(20);
    obj.button9:setHeight(20);
    obj.button9:setTop(134);
    obj.button9:setLeft(608);
    obj.button9:setName("button9");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setField("Mmaoesquerda");
    obj.label6:setFontSize(38);
    obj.label6:setFontFamily("Algerian");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWidth(166);
    obj.label6:setHeight(75);
    obj.label6:setTop(134);
    obj.label6:setLeft(559);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setName("label6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setTransparent(true);
    obj.edit7:setWidth(111);
    obj.edit7:setHeight(24);
    obj.edit7:setField("atributoMmaoesquerda");
    obj.edit7:setFontSize(15);
    obj.edit7:setFontFamily("times New Roman");
    obj.edit7:setMargins({top=-15});
    obj.edit7:setTop(165);
    obj.edit7:setLeft(508);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontColor("Cyan");
    obj.edit7:setName("edit7");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle1);
    obj.button10:setText("+");
    obj.button10:setWidth(20);
    obj.button10:setHeight(20);
    obj.button10:setTop(251);
    obj.button10:setLeft(589);
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle1);
    obj.button11:setText("-");
    obj.button11:setWidth(20);
    obj.button11:setHeight(20);
    obj.button11:setTop(251);
    obj.button11:setLeft(608);
    obj.button11:setName("button11");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setField("Mmaodireita");
    obj.label7:setFontSize(38);
    obj.label7:setFontFamily("Algerian");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWidth(166);
    obj.label7:setHeight(75);
    obj.label7:setTop(252);
    obj.label7:setLeft(559);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setName("label7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setTransparent(true);
    obj.edit8:setWidth(111);
    obj.edit8:setHeight(24);
    obj.edit8:setField("atributoMmaodireita");
    obj.edit8:setFontSize(15);
    obj.edit8:setFontFamily("times New Roman");
    obj.edit8:setMargins({top=-15});
    obj.edit8:setTop(282);
    obj.edit8:setLeft(508);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontColor("Cyan");
    obj.edit8:setName("edit8");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle1);
    obj.button12:setText("+");
    obj.button12:setWidth(20);
    obj.button12:setHeight(20);
    obj.button12:setTop(377);
    obj.button12:setLeft(1014);
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle1);
    obj.button13:setText("-");
    obj.button13:setWidth(20);
    obj.button13:setHeight(20);
    obj.button13:setTop(377);
    obj.button13:setLeft(1033);
    obj.button13:setName("button13");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setField("Cabeca");
    obj.label8:setFontSize(38);
    obj.label8:setFontFamily("Algerian");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWidth(166);
    obj.label8:setHeight(75);
    obj.label8:setTop(401);
    obj.label8:setLeft(923);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setName("label8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.label8);
    obj.edit9:setTransparent(true);
    obj.edit9:setWidth(167);
    obj.edit9:setHeight(24);
    obj.edit9:setField("Cabecaoutro");
    obj.edit9:setFontSize(15);
    obj.edit9:setFontFamily("times New Roman");
    obj.edit9:setAlign("top");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontColor("Cyan");
    obj.edit9:setName("edit9");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle1);
    obj.button14:setText("+");
    obj.button14:setWidth(20);
    obj.button14:setHeight(20);
    obj.button14:setTop(597);
    obj.button14:setLeft(1014);
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle1);
    obj.button15:setText("-");
    obj.button15:setWidth(20);
    obj.button15:setHeight(20);
    obj.button15:setTop(597);
    obj.button15:setLeft(1033);
    obj.button15:setName("button15");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setField("Olho");
    obj.label9:setFontSize(38);
    obj.label9:setFontFamily("Algerian");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWidth(166);
    obj.label9:setHeight(75);
    obj.label9:setTop(622);
    obj.label9:setLeft(923);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setName("label9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.label9);
    obj.edit10:setTransparent(true);
    obj.edit10:setWidth(167);
    obj.edit10:setHeight(24);
    obj.edit10:setField("Olhooutro");
    obj.edit10:setFontSize(15);
    obj.edit10:setFontFamily("times New Roman");
    obj.edit10:setAlign("top");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontColor("Cyan");
    obj.edit10:setName("edit10");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(527.75);
    obj.layout1:setTop(376.56);
    obj.layout1:setWidth(66.38);
    obj.layout1:setHeight(69.44);
    obj.layout1:setName("layout1");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout1);
    obj.imageCheckBox1:setField("Chip1");
    obj.imageCheckBox1:setWidth(66.38);
    obj.imageCheckBox1:setAlign("left");
    obj.imageCheckBox1:setImageChecked("/imagens/ChipDeVisãoON1.png");
    obj.imageCheckBox1:setImageUnchecked("/imagens/ChipDeVisãoOFF1.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(608.75);
    obj.layout2:setTop(376.56);
    obj.layout2:setWidth(66.38);
    obj.layout2:setHeight(69.44);
    obj.layout2:setName("layout2");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout2);
    obj.imageCheckBox2:setField("Chip2");
    obj.imageCheckBox2:setWidth(66.38);
    obj.imageCheckBox2:setAlign("left");
    obj.imageCheckBox2:setImageChecked("/imagens/ChipDeVisãoON2.png");
    obj.imageCheckBox2:setImageUnchecked("/imagens/ChipDeVisãoOFF2.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(689.75);
    obj.layout3:setTop(376.56);
    obj.layout3:setWidth(66.38);
    obj.layout3:setHeight(69.44);
    obj.layout3:setName("layout3");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout3);
    obj.imageCheckBox3:setField("Chip3");
    obj.imageCheckBox3:setWidth(66.38);
    obj.imageCheckBox3:setAlign("left");
    obj.imageCheckBox3:setImageChecked("/imagens/ChipDeVisãoON3.png");
    obj.imageCheckBox3:setImageUnchecked("/imagens/ChipDeVisãoOFF3.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(771.75);
    obj.layout4:setTop(376.56);
    obj.layout4:setWidth(66.38);
    obj.layout4:setHeight(69.44);
    obj.layout4:setName("layout4");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout4);
    obj.imageCheckBox4:setField("Chip4");
    obj.imageCheckBox4:setWidth(66.38);
    obj.imageCheckBox4:setAlign("left");
    obj.imageCheckBox4:setImageChecked("/imagens/ChipDeVisãoON4.png");
    obj.imageCheckBox4:setImageUnchecked("/imagens/ChipDeVisãoOFF4.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setLeft(527.75);
    obj.layout5:setTop(596.56);
    obj.layout5:setWidth(66.38);
    obj.layout5:setHeight(69.44);
    obj.layout5:setName("layout5");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.layout5);
    obj.imageCheckBox5:setField("Chip5");
    obj.imageCheckBox5:setWidth(66.38);
    obj.imageCheckBox5:setAlign("left");
    obj.imageCheckBox5:setImageChecked("/imagens/ChipDeVisãoON5.png");
    obj.imageCheckBox5:setImageUnchecked("/imagens/ChipDeVisãoOFF5.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setLeft(608.75);
    obj.layout6:setTop(596.56);
    obj.layout6:setWidth(66.38);
    obj.layout6:setHeight(69.44);
    obj.layout6:setName("layout6");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.layout6);
    obj.imageCheckBox6:setField("Chip6");
    obj.imageCheckBox6:setWidth(66.38);
    obj.imageCheckBox6:setAlign("left");
    obj.imageCheckBox6:setImageChecked("/imagens/ChipDeVisãoON6.png");
    obj.imageCheckBox6:setImageUnchecked("/imagens/ChipDeVisãoOFF6.png");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setLeft(689.75);
    obj.layout7:setTop(596.56);
    obj.layout7:setWidth(66.38);
    obj.layout7:setHeight(69.44);
    obj.layout7:setName("layout7");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.layout7);
    obj.imageCheckBox7:setField("Chip7");
    obj.imageCheckBox7:setWidth(66.38);
    obj.imageCheckBox7:setAlign("left");
    obj.imageCheckBox7:setImageChecked("/imagens/ChipDeVisãoON7.png");
    obj.imageCheckBox7:setImageUnchecked("/imagens/ChipDeVisãoOFF7.png");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setLeft(771.75);
    obj.layout8:setTop(596.56);
    obj.layout8:setWidth(66.38);
    obj.layout8:setHeight(69.44);
    obj.layout8:setName("layout8");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.layout8);
    obj.imageCheckBox8:setField("Chip8");
    obj.imageCheckBox8:setWidth(66.38);
    obj.imageCheckBox8:setAlign("left");
    obj.imageCheckBox8:setImageChecked("/imagens/ChipDeVisãoON8.png");
    obj.imageCheckBox8:setImageUnchecked("/imagens/ChipDeVisãoOFF8.png");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.popMeuPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup:setParent(obj);
    obj.popMeuPopup:setName("popMeuPopup");
    obj.popMeuPopup:setWidth(100);
    obj.popMeuPopup:setHeight(100);
    obj.popMeuPopup:setBackOpacity(0.0);
    obj.popMeuPopup:setTop(0);
    obj.popMeuPopup:setLeft(0);

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.popMeuPopup);
    obj.label10:setAlign("client");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Aqui fica a informção das coisas.");
    obj.label10:setName("label10");

    obj._e_event0 = obj.Msg1:addEventListener("onMouseEnter",
        function (_)
            self.Msg1.src = "/Imagens/Pé Esquerdo.png"
        end, obj);

    obj._e_event1 = obj.Msg1:addEventListener("onMouseLeave",
        function (_)
            self.Msg1.src = "/Imagens/aquinaotemnada.png"
        end, obj);

    obj._e_event2 = obj.Msg2:addEventListener("onMouseEnter",
        function (_)
            self.Msg2.src = "/Imagens/Pé Direito.png"
        end, obj);

    obj._e_event3 = obj.Msg2:addEventListener("onMouseLeave",
        function (_)
            self.Msg2.src = "/Imagens/aquinaotemnada.png"
        end, obj);

    obj._e_event4 = obj.Msg3:addEventListener("onMouseEnter",
        function (_)
            self.Msg3.src = "/Imagens/Costas.png"
        end, obj);

    obj._e_event5 = obj.Msg3:addEventListener("onMouseLeave",
        function (_)
            self.Msg3.src = "/Imagens/aquinaotemnada.png"
        end, obj);

    obj._e_event6 = obj.Msg4:addEventListener("onMouseEnter",
        function (_)
            self.Msg4.src = "/Imagens/Mão Esquerda.png"
        end, obj);

    obj._e_event7 = obj.Msg4:addEventListener("onMouseLeave",
        function (_)
            self.Msg4.src = "/Imagens/aquinaotemnada.png"
        end, obj);

    obj._e_event8 = obj.Msg5:addEventListener("onMouseEnter",
        function (_)
            self.Msg5.src = "/Imagens/Mão Direita.png"
        end, obj);

    obj._e_event9 = obj.Msg5:addEventListener("onMouseLeave",
        function (_)
            self.Msg5.src = "/Imagens/aquinaotemnada.png"
        end, obj);

    obj._e_event10 = obj.Msg6:addEventListener("onMouseEnter",
        function (_)
            self.Msg6.src = "/Imagens/Cabeça.png"
        end, obj);

    obj._e_event11 = obj.Msg6:addEventListener("onMouseLeave",
        function (_)
            self.Msg6.src = "/Imagens/aquinaotemnada.png"
        end, obj);

    obj._e_event12 = obj.Msg7:addEventListener("onMouseEnter",
        function (_)
            self.Msg7.src = "/Imagens/Olho.png"
        end, obj);

    obj._e_event13 = obj.Msg7:addEventListener("onMouseLeave",
        function (_)
            self.Msg7.src = "/Imagens/aquinaotemnada.png"
        end, obj);

    obj._e_event14 = obj.label1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Pontos de Atributo:", "",
            		   function (valorPreenchido)
            					  sheet.Pontos = (sheet.Pontos or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event15 = obj.label2:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Nivel:", "",
            		   function (valorPreenchido)
            					  sheet.Nivel = (sheet.Nivel or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event16 = obj.button1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			   sheet.Nivel = (sheet.Nivel or 0) +1;
            			   sheet.Pontos = (sheet.Pontos or 0) +0.2;
            			     else 
            				 showMessage("Você não possui permissões aqui, OTARIO!")
            		end;
        end, obj);

    obj._e_event17 = obj.image2:addEventListener("onClick",
        function (_)
            dialogs.confirmYesNo("Deseja realmente resetar sua armadura?",
                    function (confirmado)
                            if confirmado then
            	   if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            	    sheet.atributopeesquerdo = ("[Coloque seu atributo]");
            		sheet.atributopedireito = ("[Coloque seu atributo]");
            		sheet.atributocostas = ("[Atributo aqui]");
            		sheet.atributoMmaodireita = ("[Atributo aqui]");
            		sheet.atributoMmaoesquerda = ("[Atributo aqui]");
            		sheet.Olhooutro = ("[Atributo aqui]");
            		sheet.Cabecaoutro = ("[Atributo aqui]");
            		sheet.Pontos = 0;
            		sheet.Nivel = 0;
            		sheet.Ppedireito = 0;
            		sheet.Ppeesquerdo = 0;
            		sheet.Costas = 0;
            		sheet.Mmaodireita = 0;
            		sheet.Mmaoesquerda = 0;
            		sheet.Olho = 0;
            		sheet.Cabeca = 0;
            		sheet.Nome = ("")
            		sheet.Versao = ("")
            		sheet.CDnA = ("")
            		sheet.Ppeesquerdooutros = ("")
            		sheet.Ppedireitooutros = ("")
            		sheet.Costasoutros = ("")
            		sheet.Mmaoesquerdaoutros = ("")
            		sheet.Mmaodireitaoutros = ("")
            		sheet.Cabecaoutros = ("")
            		sheet.Olhooutros = ("")
                    showMessage("Resetado com sucesso!")
            		else 
            		showMessage("Você não possui permissões aqui, OTARIO!")
            		 end;
                            else
                                    -- usuário escolheu NAO
                            end;
                    end);
        end, obj);

    obj._e_event18 = obj.button2:addEventListener("onClick",
        function (_)
            local Ppeesquerdo = (sheet.Ppeesquerdo or 0) -1;
            							   if Ppeesquerdo >= 0 then
            							    sheet.Ppeesquerdo = Ppeesquerdo; sheet.Pontos = (sheet.Pontos or 0) +0.9;
            							else 
            							 showMessage("Não há pontos para se tirar aqui, desculpe!");
            							 end;
        end, obj);

    obj._e_event19 = obj.button3:addEventListener("onClick",
        function (_)
            local Pontos = (sheet.Pontos or 0) -1;
            					   if Pontos >= 0 then 
            					    sheet.Pontos = Pontos; sheet.Ppeesquerdo = (sheet.Ppeesquerdo or 0) +1; 
                                        else
                                 showMessage("Acabou seus pontos de atributos, espere o próximo nível"); 	
            		end;
        end, obj);

    obj._e_event20 = obj.button4:addEventListener("onClick",
        function (_)
            local Pontos = (sheet.Pontos or 0) -1;
            					    if Pontos >= 0 then
            					   sheet.Pontos = Pontos; sheet.Ppedireito = (sheet.Ppedireito or 0) +1;
            					   else
            					showMessage("Acabou seus pontos de atributos, espere o próximo nível")
            					end;
        end, obj);

    obj._e_event21 = obj.button5:addEventListener("onClick",
        function (_)
            local Ppedireito = (sheet.Ppedireito or 0) -1;
            						    if Ppedireito >= 0 then
            						  sheet.Ppedireito = Ppedireito; sheet.Pontos = (sheet.Pontos or 0) +0.9;
            						  else
            						  showMessage("Não há pontos para se tirar aqui, desculpe!")
            						  end;
        end, obj);

    obj._e_event22 = obj.button6:addEventListener("onClick",
        function (_)
            local Pontos = (sheet.Pontos or 0) -1;
            		  if Pontos >= 0 then
            		 sheet.Pontos = Pontos; sheet.Costas = (sheet.Costas or 0) +1;
            		 else
            		 showMessage("Acabou seus pontos de atributos, espere o próximo nível")
            		   end;
        end, obj);

    obj._e_event23 = obj.button7:addEventListener("onClick",
        function (_)
            local Costas = (sheet.Costas or 0) -1;
            		  if Costas >= 0 then
            		  sheet.Costas = Costas; sheet.Pontos = (sheet.Pontos or 0) +0.9;
            		  else
            		  showMessage("Não há pontos para se tirar aqui, desculpe!")
            		  end;
        end, obj);

    obj._e_event24 = obj.button8:addEventListener("onClick",
        function (_)
            local Pontos = (sheet.Pontos or 0) -1;
            		  if Pontos >= 0 then
            		 sheet.Pontos = Pontos; sheet.Mmaoesquerda = (sheet.Mmaoesquerda or 0) +1;
            		 else
            		 showMessage("Acabou seus pontos de atributos, espere o próximo nível")
            		   end;
        end, obj);

    obj._e_event25 = obj.button9:addEventListener("onClick",
        function (_)
            local Mmaoesquerda = (sheet.Mmaoesquerda or 0) -1;
            		  if Mmaoesquerda >= 0 then
            		  sheet.Mmaoesquerda = Mmaoesquerda; sheet.Pontos = (sheet.Pontos or 0) +0.9;
            		  else
            		  showMessage("Não há pontos para se tirar aqui, desculpe!")
            		  end;
        end, obj);

    obj._e_event26 = obj.button10:addEventListener("onClick",
        function (_)
            local Pontos = (sheet.Pontos or 0) -1;
            		  if Pontos >= 0 then
            		 sheet.Pontos = Pontos; sheet.Mmaodireita = (sheet.Mmaodireita or 0) +1;
            		 else
            		 showMessage("Acabou seus pontos de atributos, espere o próximo nível")
            		   end;
        end, obj);

    obj._e_event27 = obj.button11:addEventListener("onClick",
        function (_)
            local Mmaodireita = (sheet.Mmaodireita or 0) -1;
            		   if Mmaodireita >= 0 then 
            		    sheet.Mmaodireita = Mmaodireita; sheet.Pontos = (sheet.Pontos or 0) +0.9;
            			else 
            			 showMessage("Não há pontos para se tirar aqui, desculpe!")
            			  end;
        end, obj);

    obj._e_event28 = obj.button12:addEventListener("onClick",
        function (_)
            local Pontos = (sheet.Pontos or 0) -1;
            		  if Pontos >= 0 then
            		 sheet.Pontos = Pontos; sheet.Cabeca = (sheet.Cabeca or 0) +1;
            		 else
            		 showMessage("Acabou seus pontos de atributos, espere o próximo nível")
            		   end;
        end, obj);

    obj._e_event29 = obj.button13:addEventListener("onClick",
        function (_)
            local Cabeca = (sheet.Cabeca or 0) -1;
            		   if Cabeca >= 0 then 
            		    sheet.Cabeca = Cabeca; sheet.Pontos = (sheet.Pontos or 0) +0.9;
            			else 
            			 showMessage("Não há pontos para se tirar aqui, desculpe!")
            			  end;
        end, obj);

    obj._e_event30 = obj.button14:addEventListener("onClick",
        function (_)
            local Pontos = (sheet.Pontos or 0) -1;
            		  if Pontos >= 0 then
            		 sheet.Pontos = Pontos; sheet.Olho = (sheet.Olho or 0) +1;
            		 else
            		 showMessage("Acabou seus pontos de atributos, espere o próximo nível")
            		   end;
        end, obj);

    obj._e_event31 = obj.button15:addEventListener("onClick",
        function (_)
            local Olho = (sheet.Olho or 0) -1;
            		   if Olho >= 0 then 
            		    sheet.Olho = Olho; sheet.Pontos = (sheet.Pontos or 0) +0.9;
            			else 
            			 showMessage("Não há pontos para se tirar aqui, desculpe!")
            			  end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.Msg1 ~= nil then self.Msg1:destroy(); self.Msg1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.Msg7 ~= nil then self.Msg7:destroy(); self.Msg7 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.Msg3 ~= nil then self.Msg3:destroy(); self.Msg3 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.Msg6 ~= nil then self.Msg6:destroy(); self.Msg6 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.Msg2 ~= nil then self.Msg2:destroy(); self.Msg2 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.Msg5 ~= nil then self.Msg5:destroy(); self.Msg5 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.Msg4 ~= nil then self.Msg4:destroy(); self.Msg4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.popMeuPopup ~= nil then self.popMeuPopup:destroy(); self.popMeuPopup = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha2_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha2_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha2_svg = {
    newEditor = newfrmFicha2_svg, 
    new = newfrmFicha2_svg, 
    name = "frmFicha2_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha2_svg = _frmFicha2_svg;
Firecast.registrarForm(_frmFicha2_svg);

return _frmFicha2_svg;
