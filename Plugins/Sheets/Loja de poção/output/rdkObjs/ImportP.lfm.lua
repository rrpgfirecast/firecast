require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Loja_Para_Pocao()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("Loja_pocao_aqui");
    obj:setTitle("Loja_de_Pocao");
    obj:setName("Loja_Para_Pocao");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setSRC("/Imagens/LojaDePotion.png");
    obj.image1:setWidth(1020);
    obj.image1:setHeight(478);
    obj.image1:setName("image1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setTop(90);
    obj.rectangle1:setLeft(20);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setWidth(630);
    obj.rectangle1:setHeight(171);
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setText("Poção Grande");
    obj.label1:setTop(155);
    obj.label1:setWordWrap(false);
    obj.label1:setLeft(130);
    obj.label1:setName("label1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setTop(110);
    obj.image2:setLeft(40);
    obj.image2:setHitTest(true);
    obj.image2:setSRC("/Imagens/Poção HP Grande.png");
    obj.image2:setName("image2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setTop(110);
    obj.label2:setLeft(120);
    obj.label2:setField("quantidade");
    obj.label2:setWordWrap(false);
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.comprar1 = GUI.fromHandle(_obj_newObject("button"));
    obj.comprar1:setParent(obj.scrollBox1);
    obj.comprar1:setName("comprar1");
    obj.comprar1:setTop(210);
    obj.comprar1:setLeft(30);
    obj.comprar1:setWidth(76);
    obj.comprar1:setHeight(30);
    obj.comprar1:setText("Comprar");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setTop(210);
    obj.button1:setLeft(110);
    obj.button1:setWidth(76);
    obj.button1:setHeight(30);
    obj.button1:setText("Usar");
    obj.button1:setName("button1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setTop(110);
    obj.label3:setLeft(350);
    obj.label3:setField("quantidade2");
    obj.label3:setWordWrap(false);
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setTop(110);
    obj.image3:setLeft(260);
    obj.image3:setHitTest(true);
    obj.image3:setSRC("/Imagens/Poção HP Média.png");
    obj.image3:setName("image3");

    obj.comprar2 = GUI.fromHandle(_obj_newObject("button"));
    obj.comprar2:setParent(obj.scrollBox1);
    obj.comprar2:setName("comprar2");
    obj.comprar2:setTop(210);
    obj.comprar2:setLeft(250);
    obj.comprar2:setWidth(76);
    obj.comprar2:setHeight(30);
    obj.comprar2:setText("Comprar");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setTop(210);
    obj.button2:setLeft(330);
    obj.button2:setWidth(76);
    obj.button2:setHeight(30);
    obj.button2:setText("Usar");
    obj.button2:setName("button2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setText("Poção Média");
    obj.label4:setTop(155);
    obj.label4:setWordWrap(false);
    obj.label4:setLeft(335);
    obj.label4:setName("label4");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox1);
    obj.image4:setTop(110);
    obj.image4:setLeft(480);
    obj.image4:setHitTest(true);
    obj.image4:setSRC("/Imagens/Poção HP Pequena.png");
    obj.image4:setName("image4");

    obj.comprar3 = GUI.fromHandle(_obj_newObject("button"));
    obj.comprar3:setParent(obj.scrollBox1);
    obj.comprar3:setName("comprar3");
    obj.comprar3:setTop(210);
    obj.comprar3:setLeft(470);
    obj.comprar3:setWidth(76);
    obj.comprar3:setHeight(30);
    obj.comprar3:setText("Comprar");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setTop(210);
    obj.button3:setLeft(550);
    obj.button3:setWidth(76);
    obj.button3:setHeight(30);
    obj.button3:setText("Usar");
    obj.button3:setName("button3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setTop(110);
    obj.label5:setLeft(580);
    obj.label5:setField("quantidade3");
    obj.label5:setWordWrap(false);
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.scrollBox1);
    obj.label6:setText("Poção Pequena");
    obj.label6:setTop(155);
    obj.label6:setWordWrap(false);
    obj.label6:setLeft(560);
    obj.label6:setName("label6");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setTop(200);
    obj.layout1:setLeft(0);
    obj.layout1:setWidth(650);
    obj.layout1:setHeight(260);
    obj.layout1:setName("layout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setTop(90);
    obj.rectangle2:setLeft(20);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setWidth(630);
    obj.rectangle2:setHeight(171);
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setName("rectangle2");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setText("Poção Grande");
    obj.label7:setTop(155);
    obj.label7:setLeft(130);
    obj.label7:setName("label7");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout1);
    obj.image5:setTop(110);
    obj.image5:setLeft(40);
    obj.image5:setHitTest(true);
    obj.image5:setSRC("/Imagens/Poção MP Grande.png");
    obj.image5:setName("image5");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setTop(110);
    obj.label8:setLeft(120);
    obj.label8:setField("quantidade4");
    obj.label8:setWordWrap(false);
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.comprar4 = GUI.fromHandle(_obj_newObject("button"));
    obj.comprar4:setParent(obj.layout1);
    obj.comprar4:setName("comprar4");
    obj.comprar4:setTop(210);
    obj.comprar4:setLeft(30);
    obj.comprar4:setWidth(76);
    obj.comprar4:setHeight(30);
    obj.comprar4:setText("Comprar");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout1);
    obj.button4:setTop(210);
    obj.button4:setLeft(110);
    obj.button4:setWidth(76);
    obj.button4:setHeight(30);
    obj.button4:setText("Usar");
    obj.button4:setName("button4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setTop(110);
    obj.label9:setLeft(350);
    obj.label9:setField("quantidade5");
    obj.label9:setWordWrap(false);
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout1);
    obj.image6:setTop(110);
    obj.image6:setLeft(260);
    obj.image6:setHitTest(true);
    obj.image6:setSRC("/Imagens/Poção MP Média.png");
    obj.image6:setName("image6");

    obj.comprar5 = GUI.fromHandle(_obj_newObject("button"));
    obj.comprar5:setParent(obj.layout1);
    obj.comprar5:setName("comprar5");
    obj.comprar5:setTop(210);
    obj.comprar5:setLeft(250);
    obj.comprar5:setWidth(76);
    obj.comprar5:setHeight(30);
    obj.comprar5:setText("Comprar");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout1);
    obj.button5:setTop(210);
    obj.button5:setLeft(330);
    obj.button5:setWidth(76);
    obj.button5:setHeight(30);
    obj.button5:setText("Usar");
    obj.button5:setName("button5");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setText("Poção Média");
    obj.label10:setTop(155);
    obj.label10:setWordWrap(false);
    obj.label10:setLeft(335);
    obj.label10:setName("label10");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout1);
    obj.image7:setTop(110);
    obj.image7:setLeft(480);
    obj.image7:setHitTest(true);
    obj.image7:setSRC("/Imagens/Poção MP Pequena.png");
    obj.image7:setName("image7");

    obj.comprar6 = GUI.fromHandle(_obj_newObject("button"));
    obj.comprar6:setParent(obj.layout1);
    obj.comprar6:setName("comprar6");
    obj.comprar6:setTop(210);
    obj.comprar6:setLeft(470);
    obj.comprar6:setWidth(76);
    obj.comprar6:setHeight(30);
    obj.comprar6:setText("Comprar");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout1);
    obj.button6:setTop(210);
    obj.button6:setLeft(550);
    obj.button6:setWidth(76);
    obj.button6:setHeight(30);
    obj.button6:setText("Usar");
    obj.button6:setName("button6");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout1);
    obj.label11:setTop(110);
    obj.label11:setLeft(580);
    obj.label11:setField("quantidade6");
    obj.label11:setWordWrap(false);
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout1);
    obj.label12:setText("Poção Pequena");
    obj.label12:setTop(155);
    obj.label12:setWordWrap(false);
    obj.label12:setLeft(560);
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.scrollBox1);
    obj.label13:setTop(155);
    obj.label13:setLeft(40);
    obj.label13:setText("$70");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.scrollBox1);
    obj.label14:setTop(169);
    obj.label14:setLeft(42);
    obj.label14:setText("+30");
    obj.label14:setFontSize(8.0);
    obj.label14:setFontColor("red");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.scrollBox1);
    obj.label15:setTop(155);
    obj.label15:setLeft(270);
    obj.label15:setText("$40");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.scrollBox1);
    obj.label16:setTop(169);
    obj.label16:setLeft(272);
    obj.label16:setText("+20");
    obj.label16:setFontSize(8.0);
    obj.label16:setFontColor("red");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.scrollBox1);
    obj.label17:setTop(155);
    obj.label17:setLeft(495);
    obj.label17:setText("$20");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.scrollBox1);
    obj.label18:setTop(169);
    obj.label18:setLeft(495);
    obj.label18:setText("+10");
    obj.label18:setFontSize(8.0);
    obj.label18:setFontColor("red");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.scrollBox1);
    obj.label19:setTop(355);
    obj.label19:setLeft(40);
    obj.label19:setText("$70");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.scrollBox1);
    obj.label20:setTop(369);
    obj.label20:setLeft(42);
    obj.label20:setText("+30");
    obj.label20:setFontSize(8.0);
    obj.label20:setFontColor("blue");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.scrollBox1);
    obj.label21:setTop(355);
    obj.label21:setLeft(270);
    obj.label21:setText("$40");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.scrollBox1);
    obj.label22:setTop(369);
    obj.label22:setLeft(272);
    obj.label22:setText("+20");
    obj.label22:setFontSize(8.0);
    obj.label22:setFontColor("blue");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.scrollBox1);
    obj.label23:setTop(355);
    obj.label23:setLeft(495);
    obj.label23:setText("$20");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.scrollBox1);
    obj.label24:setTop(369);
    obj.label24:setLeft(495);
    obj.label24:setText("+10");
    obj.label24:setFontSize(8.0);
    obj.label24:setFontColor("blue");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.scrollBox1);
    obj.label25:setTop(-25);
    obj.label25:setLeft(200);
    obj.label25:setWidth(250);
    obj.label25:setHeight(200);
    obj.label25:setFontSize(22.0);
    obj.label25:setWordWrap(false);
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setFontColor("Wheat");
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.scrollBox1);
    obj.label26:setTop(440);
    obj.label26:setLeft(570);
    obj.label26:setText("by Will Martins :) ");
    lfm_setPropAsString(obj.label26, "fontStyle",  "italic");
    obj.label26:setFontSize(10.0);
    obj.label26:setName("label26");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox1);
    obj.button7:setWidth(25);
    obj.button7:setHeight(20);
    obj.button7:setTop(23);
    obj.button7:setLeft(157);
    obj.button7:setText("$");
    obj.button7:setFontColor("lime");
    lfm_setPropAsString(obj.button7, "fontStyle",  "bold");
    obj.button7:setName("button7");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setName("layout2");
    obj.layout2:setWidth(152);
    obj.layout2:setAlign("left");
    obj.layout2:setMargins({left=2, right=2});

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout2);
    obj.label27:setText("Dinheiro");
    obj.label27:setName("label27");
    obj.label27:setAlign("top");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setVertTextAlign("leading");
    obj.label27:setAutoSize(true);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setWidth(60);
    obj.edit1:setHeight(30);
    obj.edit1:setReadOnly(true);
    obj.edit1:setName("edit1");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontSize(20);
    obj.edit1:setAlign("top");

    obj.labSoma = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma:setParent(obj.edit1);
    lfm_setPropAsString(obj.labSoma, "fontStyle",  "bold");
    obj.labSoma:setFontSize(19.0);
    obj.labSoma:setAutoSize(true);
    obj.labSoma:setWordWrap(false);
    obj.labSoma:setName("labSoma");
    obj.labSoma:setAlign("top");
    obj.labSoma:setHorzTextAlign("center");
    obj.labSoma:setVertTextAlign("leading");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.labSoma);
    obj.dataLink1:setField("Soma");
    obj.dataLink1:setName("dataLink1");

    obj.QuantidadeTodos = GUI.fromHandle(_obj_newObject("button"));
    obj.QuantidadeTodos:setParent(obj.scrollBox1);
    obj.QuantidadeTodos:setName("QuantidadeTodos");
    obj.QuantidadeTodos:setText("Z-0");
    obj.QuantidadeTodos:setLeft(280);
    obj.QuantidadeTodos:setTop(23);
    obj.QuantidadeTodos:setWidth(36);
    obj.QuantidadeTodos:setHeight(20);
    lfm_setPropAsString(obj.QuantidadeTodos, "fontStyle",  "bold");

    obj.Skil500 = GUI.fromHandle(_obj_newObject("button"));
    obj.Skil500:setParent(obj.scrollBox1);
    obj.Skil500:setName("Skil500");
    obj.Skil500:setText("Skill-");
    obj.Skil500:setLeft(320);
    obj.Skil500:setTop(23);
    obj.Skil500:setWidth(45);
    obj.Skil500:setHeight(20);
    lfm_setPropAsString(obj.Skil500, "fontStyle",  "bold");

    obj.Skill501 = GUI.fromHandle(_obj_newObject("button"));
    obj.Skill501:setParent(obj.scrollBox1);
    obj.Skill501:setName("Skill501");
    obj.Skill501:setText("Skill+");
    obj.Skill501:setLeft(370);
    obj.Skill501:setTop(23);
    obj.Skill501:setWidth(45);
    obj.Skill501:setHeight(20);
    lfm_setPropAsString(obj.Skill501, "fontStyle",  "bold");

    obj.Caixa11 = GUI.fromHandle(_obj_newObject("image"));
    obj.Caixa11:setParent(obj.scrollBox1);
    obj.Caixa11:setHitTest(true);
    obj.Caixa11:setCursor("handPoint");
    obj.Caixa11:setTop(110);
    obj.Caixa11:setLeft(30);
    obj.Caixa11:setWidth(27);
    obj.Caixa11:setHeight(22);
    obj.Caixa11:setName("Caixa11");
    obj.Caixa11:setSRC("/Imagens/vender_on.png");

    obj.Caixa12 = GUI.fromHandle(_obj_newObject("image"));
    obj.Caixa12:setParent(obj.scrollBox1);
    obj.Caixa12:setHitTest(true);
    obj.Caixa12:setCursor("handPoint");
    obj.Caixa12:setTop(110);
    obj.Caixa12:setLeft(249);
    obj.Caixa12:setWidth(27);
    obj.Caixa12:setHeight(22);
    obj.Caixa12:setName("Caixa12");
    obj.Caixa12:setSRC("/Imagens/vender_on.png");

    obj.Caixa13 = GUI.fromHandle(_obj_newObject("image"));
    obj.Caixa13:setParent(obj.scrollBox1);
    obj.Caixa13:setHitTest(true);
    obj.Caixa13:setCursor("handPoint");
    obj.Caixa13:setTop(110);
    obj.Caixa13:setLeft(468);
    obj.Caixa13:setWidth(27);
    obj.Caixa13:setHeight(22);
    obj.Caixa13:setName("Caixa13");
    obj.Caixa13:setSRC("/Imagens/vender_on.png");

    obj.Caixa14 = GUI.fromHandle(_obj_newObject("image"));
    obj.Caixa14:setParent(obj.scrollBox1);
    obj.Caixa14:setHitTest(true);
    obj.Caixa14:setCursor("handPoint");
    obj.Caixa14:setTop(310);
    obj.Caixa14:setLeft(30);
    obj.Caixa14:setWidth(27);
    obj.Caixa14:setHeight(22);
    obj.Caixa14:setName("Caixa14");
    obj.Caixa14:setSRC("/Imagens/vender_on.png");

    obj.Caixa15 = GUI.fromHandle(_obj_newObject("image"));
    obj.Caixa15:setParent(obj.scrollBox1);
    obj.Caixa15:setHitTest(true);
    obj.Caixa15:setCursor("handPoint");
    obj.Caixa15:setTop(310);
    obj.Caixa15:setLeft(249);
    obj.Caixa15:setWidth(27);
    obj.Caixa15:setHeight(22);
    obj.Caixa15:setName("Caixa15");
    obj.Caixa15:setSRC("/Imagens/vender_on.png");

    obj.Caixa16 = GUI.fromHandle(_obj_newObject("image"));
    obj.Caixa16:setParent(obj.scrollBox1);
    obj.Caixa16:setHitTest(true);
    obj.Caixa16:setCursor("handPoint");
    obj.Caixa16:setTop(310);
    obj.Caixa16:setLeft(468);
    obj.Caixa16:setWidth(27);
    obj.Caixa16:setHeight(22);
    obj.Caixa16:setName("Caixa16");
    obj.Caixa16:setSRC("/Imagens/vender_on.png");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.scrollBox1);
    obj.label28:setLeft(28);
    obj.label28:setTop(94);
    obj.label28:setText("Vender");
    obj.label28:setFontSize(10);
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.scrollBox1);
    obj.label29:setLeft(246);
    obj.label29:setTop(94);
    obj.label29:setText("Vender");
    obj.label29:setFontSize(10);
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.scrollBox1);
    obj.label30:setLeft(464);
    obj.label30:setTop(94);
    obj.label30:setText("Vender");
    obj.label30:setFontSize(10);
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.scrollBox1);
    obj.label31:setLeft(28);
    obj.label31:setTop(294);
    obj.label31:setText("Vender");
    obj.label31:setFontSize(10);
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.scrollBox1);
    obj.label32:setLeft(246);
    obj.label32:setTop(294);
    obj.label32:setText("Vender");
    obj.label32:setFontSize(10);
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.scrollBox1);
    obj.label33:setLeft(464);
    obj.label33:setTop(294);
    obj.label33:setText("Vender");
    obj.label33:setFontSize(10);
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setName("label33");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox1);
    obj.image8:setSRC("/Imagens/molduraDourada.png");
    obj.image8:setWidth(671);
    obj.image8:setHeight(226);
    obj.image8:setLeft(6);
    obj.image8:setTop(51);
    obj.image8:setName("image8");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.scrollBox1);
    obj.image9:setSRC("/Imagens/molduraDourada.png");
    obj.image9:setWidth(671);
    obj.image9:setHeight(226);
    obj.image9:setLeft(6);
    obj.image9:setTop(250);
    obj.image9:setName("image9");

    obj.on = GUI.fromHandle(_obj_newObject("image"));
    obj.on:setParent(obj.scrollBox1);
    obj.on:setName("on");
    obj.on:setVisible(true);
    obj.on:setSRC("/Imagens/Botao_on.png");
    obj.on:setLeft(430);
    obj.on:setTop(-3);
    obj.on:setWidth(200);
    obj.on:setHeight(100);
    obj.on:setHitTest(true);
    obj.on:setCursor("handPoint");

    obj.off = GUI.fromHandle(_obj_newObject("image"));
    obj.off:setParent(obj.scrollBox1);
    obj.off:setName("off");
    obj.off:setVisible(false);
    obj.off:setSRC("/Imagens/Botao_off.png");
    obj.off:setLeft(430);
    obj.off:setTop(-3);
    obj.off:setWidth(200);
    obj.off:setHeight(100);
    obj.off:setHitTest(true);
    obj.off:setCursor("handPoint");

    obj.Xn1 = GUI.fromHandle(_obj_newObject("button"));
    obj.Xn1:setParent(obj.scrollBox1);
    obj.Xn1:setName("Xn1");
    obj.Xn1:setVisible(false);
    obj.Xn1:setTop(210);
    obj.Xn1:setLeft(30);
    obj.Xn1:setWidth(76);
    obj.Xn1:setHeight(30);
    obj.Xn1:setText("Comprar");

    obj.Xn2 = GUI.fromHandle(_obj_newObject("button"));
    obj.Xn2:setParent(obj.scrollBox1);
    obj.Xn2:setName("Xn2");
    obj.Xn2:setVisible(false);
    obj.Xn2:setTop(210);
    obj.Xn2:setLeft(250);
    obj.Xn2:setWidth(76);
    obj.Xn2:setHeight(30);
    obj.Xn2:setText("Comprar");

    obj.Xn3 = GUI.fromHandle(_obj_newObject("button"));
    obj.Xn3:setParent(obj.scrollBox1);
    obj.Xn3:setName("Xn3");
    obj.Xn3:setVisible(false);
    obj.Xn3:setTop(210);
    obj.Xn3:setLeft(470);
    obj.Xn3:setWidth(76);
    obj.Xn3:setHeight(30);
    obj.Xn3:setText("Comprar");

    obj.Xn4 = GUI.fromHandle(_obj_newObject("button"));
    obj.Xn4:setParent(obj.scrollBox1);
    obj.Xn4:setName("Xn4");
    obj.Xn4:setVisible(false);
    obj.Xn4:setTop(410);
    obj.Xn4:setLeft(30);
    obj.Xn4:setWidth(76);
    obj.Xn4:setHeight(30);
    obj.Xn4:setText("Comprar");

    obj.Xn5 = GUI.fromHandle(_obj_newObject("button"));
    obj.Xn5:setParent(obj.scrollBox1);
    obj.Xn5:setName("Xn5");
    obj.Xn5:setVisible(false);
    obj.Xn5:setTop(410);
    obj.Xn5:setLeft(250);
    obj.Xn5:setWidth(76);
    obj.Xn5:setHeight(30);
    obj.Xn5:setText("Comprar");

    obj.Xn6 = GUI.fromHandle(_obj_newObject("button"));
    obj.Xn6:setParent(obj.scrollBox1);
    obj.Xn6:setName("Xn6");
    obj.Xn6:setVisible(false);
    obj.Xn6:setTop(410);
    obj.Xn6:setLeft(470);
    obj.Xn6:setWidth(76);
    obj.Xn6:setHeight(30);
    obj.Xn6:setText("Comprar");

    obj.X1 = GUI.fromHandle(_obj_newObject("image"));
    obj.X1:setParent(obj.scrollBox1);
    obj.X1:setName("X1");
    obj.X1:setVisible(false);
    obj.X1:setSRC("/Imagens/XdP.png");
    obj.X1:setTop(210);
    obj.X1:setLeft(30);
    obj.X1:setWidth(76);
    obj.X1:setHeight(30);

    obj.X2 = GUI.fromHandle(_obj_newObject("image"));
    obj.X2:setParent(obj.scrollBox1);
    obj.X2:setName("X2");
    obj.X2:setVisible(false);
    obj.X2:setSRC("/Imagens/XdP.png");
    obj.X2:setTop(210);
    obj.X2:setLeft(250);
    obj.X2:setWidth(76);
    obj.X2:setHeight(30);

    obj.X3 = GUI.fromHandle(_obj_newObject("image"));
    obj.X3:setParent(obj.scrollBox1);
    obj.X3:setName("X3");
    obj.X3:setVisible(false);
    obj.X3:setSRC("/Imagens/XdP.png");
    obj.X3:setTop(210);
    obj.X3:setLeft(470);
    obj.X3:setWidth(76);
    obj.X3:setHeight(30);

    obj.X4 = GUI.fromHandle(_obj_newObject("image"));
    obj.X4:setParent(obj.scrollBox1);
    obj.X4:setName("X4");
    obj.X4:setVisible(false);
    obj.X4:setSRC("/Imagens/XdP.png");
    obj.X4:setTop(410);
    obj.X4:setLeft(30);
    obj.X4:setWidth(76);
    obj.X4:setHeight(30);

    obj.X5 = GUI.fromHandle(_obj_newObject("image"));
    obj.X5:setParent(obj.scrollBox1);
    obj.X5:setName("X5");
    obj.X5:setVisible(false);
    obj.X5:setSRC("/Imagens/XdP.png");
    obj.X5:setTop(410);
    obj.X5:setLeft(250);
    obj.X5:setWidth(76);
    obj.X5:setHeight(30);

    obj.X6 = GUI.fromHandle(_obj_newObject("image"));
    obj.X6:setParent(obj.scrollBox1);
    obj.X6:setName("X6");
    obj.X6:setVisible(false);
    obj.X6:setSRC("/Imagens/XdP.png");
    obj.X6:setTop(410);
    obj.X6:setLeft(470);
    obj.X6:setWidth(76);
    obj.X6:setHeight(30);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox1);
    obj.dataLink2:setField("olho");
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.image2:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Poções:", "",
            		   function (valorPreenchido)
            					  sheet.quantidade = (sheet.quantidade or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event1 = obj.comprar1:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -70;
            						         if Soma >= 0 then
            								 sheet.Soma = Soma; sheet.quantidade = (sheet.quantidade or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K4]Poção de HP[§K4] [§K1]Grande:[§K1] [§K7]Comprada![§K7] ");
                                        else
                                 showMessage("Você não moedas para gastar"); 	
            		end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            local quantidade = (sheet.quantidade or 0) - 1;
                                                if quantidade >= 0 then
                                                sheet.quantidade = quantidade;local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/HP +30");
                                        else
                                  showMessage("Você não tem poções para usar"); 							
                                      end;
        end, obj);

    obj._e_event3 = obj.image3:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Poções:", "",
            		   function (valorPreenchido)
            					  sheet.quantidade2 = (sheet.quantidade2 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event4 = obj.comprar2:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) - 40; 
                                                if Soma >= 0 then
                                                sheet.Soma = Soma; sheet.quantidade2 = (sheet.quantidade2 or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K4]Poção de HP[§K4] [§K1]Média:[§K1] [§K7]Comprada![§K7] ");
                                        else
                                 showMessage("Você não moedas para gastar"); 	
                                      end;
        end, obj);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (_)
            local quantidade2 = (sheet.quantidade2 or 0) - 1;
                                                if quantidade2 >= 0 then
                                                sheet.quantidade2 = quantidade2;local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/HP +20");
                                        else
                                  showMessage("Você não tem poções para usar"); 
            							
                                      end;
        end, obj);

    obj._e_event6 = obj.image4:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Poções:", "",
            		   function (valorPreenchido)
            					  sheet.quantidade3 = (sheet.quantidade3 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event7 = obj.comprar3:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) - 20; 
                                                if Soma >= 0 then
                                                sheet.Soma = Soma; sheet.quantidade3 = (sheet.quantidade3 or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K4]Poção de HP[§K4] [§K1]Pequena:[§K1] [§K7]Comprada![§K7] ");
                                        else
                                 showMessage("Você não moedas para gastar"); 	
                                      end;
        end, obj);

    obj._e_event8 = obj.button3:addEventListener("onClick",
        function (_)
            local quantidade3 = (sheet.quantidade3 or 0) - 1;
                                                if quantidade3 >= 0 then
                                                sheet.quantidade3 = quantidade3;local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/HP +10");
                                        else
                                  showMessage("Você não tem poções para usar"); 
            							
                                      end;
        end, obj);

    obj._e_event9 = obj.image5:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Poções:", "",
            		   function (valorPreenchido)
            					  sheet.quantidade4 = (sheet.quantidade4 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event10 = obj.comprar4:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) - 70; 
                                                if Soma >= 0 then
                                                sheet.Soma = Soma; sheet.quantidade4 = (sheet.quantidade4 or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K11]Poção de MP[§K11] [§K1]Grande:[§K1] [§K7]Comprada![§K7]");
                                        else
                                 showMessage("Você não moedas para gastar"); 	
                                      end;
        end, obj);

    obj._e_event11 = obj.button4:addEventListener("onClick",
        function (_)
            local quantidade4 = (sheet.quantidade4 or 0) - 1;
                                                if quantidade4 >= 0 then
                                                sheet.quantidade4 = quantidade4; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/MP +30");
                                        else
                                  showMessage("Você não tem poções para usar"); 
                                      end;
        end, obj);

    obj._e_event12 = obj.image6:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Poções:", "",
            		   function (valorPreenchido)
            					  sheet.quantidade5 = (sheet.quantidade5 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event13 = obj.comprar5:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) - 40; 
                                                if Soma >= 0 then
                                                sheet.Soma = Soma; sheet.quantidade5 = (sheet.quantidade5 or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K11]Poção de MP[§K11] [§K1]Média:[§K1] [§K7]Comprada![§K7]");
                                        else
                                 showMessage("Você não moedas para gastar"); 	
                                      end;
        end, obj);

    obj._e_event14 = obj.button5:addEventListener("onClick",
        function (_)
            local quantidade5 = (sheet.quantidade5 or 0) - 1;
                                                if quantidade5 >= 0 then
                                                sheet.quantidade5 = quantidade5; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/MP +20");
                                        else
                                  showMessage("Você não tem poções para usar"); 
                                      end;
        end, obj);

    obj._e_event15 = obj.image7:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Poções:", "",
            		   function (valorPreenchido)
            					  sheet.quantidade6 = (sheet.quantidade6 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event16 = obj.comprar6:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) - 20; 
                                                if Soma >= 0 then
                                                sheet.Soma = Soma; sheet.quantidade6 = (sheet.quantidade6 or 0) +1; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K11]Poção de MP[§K11] [§K1]Pequena:[§K1] [§K7]Comprada![§K7]");
                                        else
                                 showMessage("Você não moedas para gastar"); 	
                                      end;
        end, obj);

    obj._e_event17 = obj.button6:addEventListener("onClick",
        function (_)
            local quantidade6 = (sheet.quantidade6 or 0) - 1;
                                                if quantidade6 >= 0 then
                                                sheet.quantidade6 = quantidade6; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/MP +10");
                                        else
                                  showMessage("Você não tem poções para usar"); 
                                      end;
        end, obj);

    obj._e_event18 = obj.button7:addEventListener("onClick",
        function (_)
        end, obj);

    obj._e_event19 = obj.button7:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event20 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
            	local s = string.format("%d", math.floor(v))
            	local pos = string.len(s) % 3 
            	if pos == 0 then pos = 3 end
                return string.sub(s, 1, pos)
            	    .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
            		.. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
            	  self.labSoma.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event21 = obj.QuantidadeTodos:addEventListener("onDblClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		sheet.quantidade = 0
            		sheet.quantidade2 = 0
            		sheet.quantidade3 = 0
            		sheet.quantidade4 = 0
            		sheet.quantidade5 = 0
            		sheet.quantidade6 = 0
            		sheet.quantidade7 = 0
            		sheet.quantidade8 = 0
            		sheet.Soma = 0
            		 else
            		 
            		 showMessage("Apenas o mestre tem permição.");
            		  
            		end;
        end, obj);

    obj._e_event22 = obj.Skil500:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            	 local Soma = (sheet.Soma or 0) -500;
            	  if Soma >= 0 then;
            	   sheet.Soma = Soma;
            	    end;
            		 else 
                         showMessage("Apenas o mestre tem permição.")
            		end;
        end, obj);

    obj._e_event23 = obj.Skill501:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            	  local Soma = (sheet.Soma or 0) +500;
            	   if Soma >= 0 then 
            	    sheet.Soma = Soma;
            		 end;
            		  else 
            		   showMessage("Apenas o mestre tem permição.")
            		 end;
        end, obj);

    obj._e_event24 = obj.Caixa11:addEventListener("onMouseEnter",
        function (_)
            self.Caixa11.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event25 = obj.Caixa11:addEventListener("onMouseLeave",
        function (_)
            self.Caixa11.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event26 = obj.Caixa11:addEventListener("onClick",
        function (_)
            local quantidade = (sheet.quantidade or 0) -1;
            			      if quantidade >= 0 then
            		    sheet.quantidade = quantidade; 
            			local Soma = (sheet.Soma or 0) +70;
            			sheet.Soma = Soma; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K4]Poção de HP[§K4] [§K1]Grande:[§K1] [§K7]Vendida![§K7] ");
                                        else
                                 showMessage("Você não tem poções para vender"); 	
                                      end;
        end, obj);

    obj._e_event27 = obj.Caixa12:addEventListener("onMouseEnter",
        function (_)
            self.Caixa12.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event28 = obj.Caixa12:addEventListener("onMouseLeave",
        function (_)
            self.Caixa12.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event29 = obj.Caixa12:addEventListener("onClick",
        function (_)
            local quantidade2 = (sheet.quantidade2 or 0) -1;
            			      if quantidade2 >= 0 then
            		    sheet.quantidade2 = quantidade2; 
            			local Soma = (sheet.Soma or 0) +40;
            			sheet.Soma = Soma; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K4]Poção de HP[§K4] [§K1]Média:[§K1] [§K7]Vendida![§K7] ");
                                        else
                                 showMessage("Você não tem poções para vender"); 	
                                      end;
        end, obj);

    obj._e_event30 = obj.Caixa13:addEventListener("onMouseEnter",
        function (_)
            self.Caixa13.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event31 = obj.Caixa13:addEventListener("onMouseLeave",
        function (_)
            self.Caixa13.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event32 = obj.Caixa13:addEventListener("onClick",
        function (_)
            local quantidade3 = (sheet.quantidade3 or 0) -1;
            			      if quantidade3 >= 0 then
            		    sheet.quantidade3 = quantidade3; 
            			local Soma = (sheet.Soma or 0) +20;
            			sheet.Soma = Soma; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K4]Poção de HP[§K4] [§K1]Pequena:[§K1] [§K7]Vendida![§K7] ");
                                        else
                                 showMessage("Você não tem poções para vender"); 	
                                      end;
        end, obj);

    obj._e_event33 = obj.Caixa14:addEventListener("onMouseEnter",
        function (_)
            self.Caixa14.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event34 = obj.Caixa14:addEventListener("onMouseLeave",
        function (_)
            self.Caixa14.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event35 = obj.Caixa14:addEventListener("onClick",
        function (_)
            local quantidade4 = (sheet.quantidade4 or 0) -1;
            			      if quantidade4 >= 0 then
            		    sheet.quantidade4 = quantidade4; 
            			local Soma = (sheet.Soma or 0) +70;
            			sheet.Soma = Soma; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K11]Poção de MP[§K11] [§K1]Grande:[§K1] [§K7]Vendida![§K7] ");
                                        else
                                 showMessage("Você não tem poções para vender"); 	
                                      end;
        end, obj);

    obj._e_event36 = obj.Caixa15:addEventListener("onMouseEnter",
        function (_)
            self.Caixa15.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event37 = obj.Caixa15:addEventListener("onMouseLeave",
        function (_)
            self.Caixa15.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event38 = obj.Caixa15:addEventListener("onClick",
        function (_)
            local quantidade5 = (sheet.quantidade5 or 0) -1;
            			      if quantidade5 >= 0 then
            		    sheet.quantidade5 = quantidade5; 
            			local Soma = (sheet.Soma or 0) +40;
            			sheet.Soma = Soma; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K11]Poção de MP[§K11] [§K1]Média:[§K1] [§K7]Vendida![§K7] ");
                                        else
                                 showMessage("Você não tem poções para vender"); 	
                                      end;
        end, obj);

    obj._e_event39 = obj.Caixa16:addEventListener("onMouseEnter",
        function (_)
            self.Caixa16.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event40 = obj.Caixa16:addEventListener("onMouseLeave",
        function (_)
            self.Caixa16.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event41 = obj.Caixa16:addEventListener("onClick",
        function (_)
            local quantidade6 = (sheet.quantidade6 or 0) -1;
            			      if quantidade6 >= 0 then
            		    sheet.quantidade6 = quantidade6; 
            			local Soma = (sheet.Soma or 0) +20;
            			sheet.Soma = Soma; local minhaMesa = rrpg.getMesaDe(sheet); 
            									local chat = minhaMesa.chat; 
            									chat:enviarMensagem("/me [§K11]Poção de MP[§K11] [§K1]Pequena:[§K1] [§K7]Vendida![§K7] ");
                                        else
                                 showMessage("Você não tem poções para vender"); 	
                                      end;
        end, obj);

    obj._e_event42 = obj.on:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                 sheet.olho = 0
                 end;
        end, obj);

    obj._e_event43 = obj.off:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then   
                 sheet.olho = 1
                 end;
        end, obj);

    obj._e_event44 = obj.Xn1:addEventListener("onClick",
        function (_)
            showMessage("Você precisa estar perto de uma loja para efetuar a compra")
        end, obj);

    obj._e_event45 = obj.Xn2:addEventListener("onClick",
        function (_)
            showMessage("Você precisa estar perto de uma loja para efetuar a compra")
        end, obj);

    obj._e_event46 = obj.Xn3:addEventListener("onClick",
        function (_)
            showMessage("Você precisa estar perto de uma loja para efetuar a compra")
        end, obj);

    obj._e_event47 = obj.Xn4:addEventListener("onClick",
        function (_)
            showMessage("Você precisa estar perto de uma loja para efetuar a compra")
        end, obj);

    obj._e_event48 = obj.Xn5:addEventListener("onClick",
        function (_)
            showMessage("Você precisa estar perto de uma loja para efetuar a compra")
        end, obj);

    obj._e_event49 = obj.Xn6:addEventListener("onClick",
        function (_)
            showMessage("Você precisa estar perto de uma loja para efetuar a compra")
        end, obj);

    obj._e_event50 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.olho >= 0 then;
                self.on.visible = false;
                self.off.visible = true;
                self.Xn1.visible = true;
                self.Xn2.visible = true;
                self.Xn3.visible = true;
                self.Xn4.visible = true;
                self.Xn5.visible = true;
                self.Xn6.visible = true;
                self.X1.visible = true;
                self.X2.visible = true;
                self.X3.visible = true;
                self.X4.visible = true;
                self.X5.visible = true;
                self.X6.visible = true;
                end;
                if sheet.olho >= 1 then;
                self.on.visible = true;
                self.off.visible = false;
                self.Xn1.visible = false;
                self.Xn2.visible = false;
                self.Xn3.visible = false;
                self.Xn4.visible = false;
                self.Xn5.visible = false;
                self.Xn6.visible = false;
                self.X1.visible = false;
                self.X2.visible = false;
                self.X3.visible = false;
                self.X4.visible = false;
                self.X5.visible = false;
                self.X6.visible = false;    
            
                end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.Caixa11 ~= nil then self.Caixa11:destroy(); self.Caixa11 = nil; end;
        if self.Caixa15 ~= nil then self.Caixa15:destroy(); self.Caixa15 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.X6 ~= nil then self.X6:destroy(); self.X6 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.Skil500 ~= nil then self.Skil500:destroy(); self.Skil500 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.Xn2 ~= nil then self.Xn2:destroy(); self.Xn2 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.comprar2 ~= nil then self.comprar2:destroy(); self.comprar2 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.Caixa13 ~= nil then self.Caixa13:destroy(); self.Caixa13 = nil; end;
        if self.comprar1 ~= nil then self.comprar1:destroy(); self.comprar1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.comprar5 ~= nil then self.comprar5:destroy(); self.comprar5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.Xn4 ~= nil then self.Xn4:destroy(); self.Xn4 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.Caixa12 ~= nil then self.Caixa12:destroy(); self.Caixa12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.QuantidadeTodos ~= nil then self.QuantidadeTodos:destroy(); self.QuantidadeTodos = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.on ~= nil then self.on:destroy(); self.on = nil; end;
        if self.Xn1 ~= nil then self.Xn1:destroy(); self.Xn1 = nil; end;
        if self.X1 ~= nil then self.X1:destroy(); self.X1 = nil; end;
        if self.X2 ~= nil then self.X2:destroy(); self.X2 = nil; end;
        if self.Xn3 ~= nil then self.Xn3:destroy(); self.Xn3 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.X3 ~= nil then self.X3:destroy(); self.X3 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.comprar6 ~= nil then self.comprar6:destroy(); self.comprar6 = nil; end;
        if self.comprar3 ~= nil then self.comprar3:destroy(); self.comprar3 = nil; end;
        if self.comprar4 ~= nil then self.comprar4:destroy(); self.comprar4 = nil; end;
        if self.X4 ~= nil then self.X4:destroy(); self.X4 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.labSoma ~= nil then self.labSoma:destroy(); self.labSoma = nil; end;
        if self.X5 ~= nil then self.X5:destroy(); self.X5 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.off ~= nil then self.off:destroy(); self.off = nil; end;
        if self.Caixa14 ~= nil then self.Caixa14:destroy(); self.Caixa14 = nil; end;
        if self.Xn5 ~= nil then self.Xn5:destroy(); self.Xn5 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.Caixa16 ~= nil then self.Caixa16:destroy(); self.Caixa16 = nil; end;
        if self.Skill501 ~= nil then self.Skill501:destroy(); self.Skill501 = nil; end;
        if self.Xn6 ~= nil then self.Xn6:destroy(); self.Xn6 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newLoja_Para_Pocao()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Loja_Para_Pocao();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Loja_Para_Pocao = {
    newEditor = newLoja_Para_Pocao, 
    new = newLoja_Para_Pocao, 
    name = "Loja_Para_Pocao", 
    dataType = "Loja_pocao_aqui", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Loja_de_Pocao", 
    description=""};

Loja_Para_Pocao = _Loja_Para_Pocao;
Firecast.registrarForm(_Loja_Para_Pocao);
Firecast.registrarDataType(_Loja_Para_Pocao);

return _Loja_Para_Pocao;
