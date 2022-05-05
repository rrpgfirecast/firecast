require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Pathfinder2E()
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
    obj:setDataType("br.com.rrpg.pathfinder2e");
    obj:setFormType("sheetTemplate");
    obj:setTitle("Pathfinder 2e");
    obj:setName("Pathfinder2E");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.popInfo = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.popInfo:setParent(obj);
    obj.popInfo:setName("popInfo");
    obj.popInfo:setWidth(1000);
    obj.popInfo:setHeight(440);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popInfo);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setAlign("client");
    obj.image1:setStyle("stretch");
    obj.image1:setSRC("/imagens/Fundo 1.jpg");
    obj.image1:setOpacity(1);
    obj.image1:setName("image1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(70);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setWidth(131);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("Gray");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setCornerType("innerRound");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(131);
    obj.label1:setHeight(25);
    obj.label1:setText("Imagens");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontColor("Gray");
    obj.label1:setFontFamily("Stencil");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setLeft(5);
    obj.rectangle3:setTop(30);
    obj.rectangle3:setWidth(270);
    obj.rectangle3:setHeight(402);
    obj.rectangle3:setColor("transparent");
    obj.rectangle3:setStrokeColor("Gray");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle3:setName("rectangle3");

    obj.rclImagem = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclImagem:setParent(obj.rectangle3);
    obj.rclImagem:setName("rclImagem");
    obj.rclImagem:setField("campoImagem");
    obj.rclImagem:setTemplateForm("frmImagem");
    obj.rclImagem:setLeft(15);
    obj.rclImagem:setTop(0);
    obj.rclImagem:setWidth(245);
    obj.rclImagem:setHeight(398);
    obj.rclImagem:setLayout("vertical");
    obj.rclImagem:setMinQt(0);

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle1);
    obj.rectangle4:setLeft(560);
    obj.rectangle4:setTop(5);
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setWidth(131);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("transparent");
    obj.rectangle4:setStrokeColor("Gray");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setCornerType("innerRound");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle4);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(131);
    obj.label2:setHeight(25);
    obj.label2:setText("Anotações");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontColor("Gray");
    obj.label2:setFontFamily("Stencil");
    obj.label2:setName("label2");

    obj.anotacoesLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.anotacoesLabel:setParent(obj.rectangle1);
    obj.anotacoesLabel:setLeft(280);
    obj.anotacoesLabel:setTop(30);
    obj.anotacoesLabel:setWidth(710);
    obj.anotacoesLabel:setHeight(402);
    obj.anotacoesLabel:setColor("transparent");
    obj.anotacoesLabel:setStrokeColor("Gray");
    obj.anotacoesLabel:setStrokeSize(1);
    obj.anotacoesLabel:setName("anotacoesLabel");
    obj.anotacoesLabel:setVisible(true);
    obj.anotacoesLabel:setCornerType("round");
    obj.anotacoesLabel:setXradius(10);
    obj.anotacoesLabel:setYradius(10);
    obj.anotacoesLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.anotacoesLabel);
    obj.label3:setAlign("client");
    obj.label3:setField("anotacoes");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontSize(16);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setVertTextAlign("leading");
    obj.label3:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label3:setFontColor("Gray");
    obj.label3:setName("label3");

    obj.anotacoesEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoesEdit:setParent(obj.rectangle1);
    obj.anotacoesEdit:setField("anotacoes");
    obj.anotacoesEdit:setLeft(280);
    obj.anotacoesEdit:setTop(30);
    obj.anotacoesEdit:setWidth(710);
    obj.anotacoesEdit:setHeight(402);
    obj.anotacoesEdit:setName("anotacoesEdit");
    obj.anotacoesEdit:setVisible(false);
    obj.anotacoesEdit:setFontSize(16);
    obj.anotacoesEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.popDeath = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDeath:setParent(obj);
    obj.popDeath:setName("popDeath");
    obj.popDeath:setWidth(1000);
    obj.popDeath:setHeight(600);

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.popDeath);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setColor("transparent");
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setXradius(15);
    obj.rectangle5:setYradius(15);
    obj.rectangle5:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle5);
    obj.image2:setAlign("client");
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/imagens/Death.gif");
    obj.image2:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image2:setOpacity(1);
    lfm_setPropAsString(obj.image2, "animate",  "true");
    obj.image2:setName("image2");

    obj.popTalentos = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.popTalentos:setParent(obj);
    obj.popTalentos:setName("popTalentos");
    obj.popTalentos:setWidth(1030);
    obj.popTalentos:setHeight(587);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.popTalentos);
    obj.image3:setAlign("client");
    obj.image3:setStyle("stretch");
    obj.image3:setSRC("/imagens/Fundo 1.jpg");
    obj.image3:setOpacity(1);
    obj.image3:setName("image3");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.popTalentos);
    obj.rectangle6:setLeft(25);
    obj.rectangle6:setTop(5);
    obj.rectangle6:setWidth(310);
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("transparent");
    obj.rectangle6:setStrokeColor("Gray");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setCornerType("innerRound");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle6);
    obj.label4:setWidth(310);
    obj.label4:setHeight(25);
    obj.label4:setText("Características");
    obj.label4:setVertTextAlign("center");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(16);
    obj.label4:setFontColor("Gray");
    obj.label4:setFontFamily("Stencil");
    obj.label4:setName("label4");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.popTalentos);
    obj.rectangle7:setLeft(25);
    obj.rectangle7:setTop(30);
    obj.rectangle7:setWidth(310);
    obj.rectangle7:setHeight(255);
    obj.rectangle7:setColor("transparent");
    obj.rectangle7:setStrokeColor("Gray");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle7:setName("rectangle7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle7);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setName("rectangle8");
    obj.rectangle8:setWidth(55);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("transparent");
    obj.rectangle8:setStrokeColor("Gray");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setXradius(5);
    obj.rectangle8:setYradius(5);

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle8);
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWidth(55);
    obj.label5:setHeight(25);
    obj.label5:setText("Nível");
    obj.label5:setFontColor("Gray");
    obj.label5:setFontFamily("Stencil");
    obj.label5:setName("label5");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle7);
    obj.rectangle9:setLeft(55);
    obj.rectangle9:setWidth(232);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("transparent");
    obj.rectangle9:setStrokeColor("Gray");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(5);

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle9);
    obj.label6:setVertTextAlign("center");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWidth(252);
    obj.label6:setHeight(25);
    obj.label6:setText("Nome");
    obj.label6:setFontColor("Gray");
    obj.label6:setFontFamily("Stencil");
    obj.label6:setName("label6");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle7);
    obj.button2:setLeft(286);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.rclCaracteristicas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclCaracteristicas:setParent(obj.rectangle7);
    obj.rclCaracteristicas:setLeft(0);
    obj.rclCaracteristicas:setTop(25);
    obj.rclCaracteristicas:setName("rclCaracteristicas");
    obj.rclCaracteristicas:setField("campoCaracteristicas");
    obj.rclCaracteristicas:setTemplateForm("frmTalentos");
    obj.rclCaracteristicas:setWidth(328);
    obj.rclCaracteristicas:setHeight(225);
    obj.rclCaracteristicas:setLayout("vertical");
    obj.rclCaracteristicas:setMinQt(0);

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.popTalentos);
    obj.rectangle10:setLeft(360);
    obj.rectangle10:setTop(5);
    obj.rectangle10:setWidth(310);
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("transparent");
    obj.rectangle10:setStrokeColor("Gray");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setCornerType("innerRound");
    obj.rectangle10:setXradius(5);
    obj.rectangle10:setYradius(5);

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle10);
    obj.label7:setWidth(310);
    obj.label7:setHeight(25);
    obj.label7:setText("Talentos de Ancestralidade");
    obj.label7:setVertTextAlign("center");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontSize(16);
    obj.label7:setFontColor("Gray");
    obj.label7:setFontFamily("Stencil");
    obj.label7:setName("label7");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.popTalentos);
    obj.rectangle11:setLeft(360);
    obj.rectangle11:setTop(30);
    obj.rectangle11:setWidth(310);
    obj.rectangle11:setHeight(255);
    obj.rectangle11:setColor("transparent");
    obj.rectangle11:setStrokeColor("Gray");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle11:setName("rectangle11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle11);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setName("rectangle12");
    obj.rectangle12:setWidth(55);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("transparent");
    obj.rectangle12:setStrokeColor("Gray");
    obj.rectangle12:setStrokeSize(2);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(5);

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle12);
    obj.label8:setVertTextAlign("center");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWidth(55);
    obj.label8:setHeight(25);
    obj.label8:setText("Nível");
    obj.label8:setFontColor("Gray");
    obj.label8:setFontFamily("Stencil");
    obj.label8:setName("label8");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.rectangle11);
    obj.rectangle13:setLeft(55);
    obj.rectangle13:setWidth(232);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setName("rectangle13");
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("transparent");
    obj.rectangle13:setStrokeColor("Gray");
    obj.rectangle13:setStrokeSize(2);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setXradius(5);
    obj.rectangle13:setYradius(5);

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle13);
    obj.label9:setVertTextAlign("center");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWidth(252);
    obj.label9:setHeight(25);
    obj.label9:setText("Nome");
    obj.label9:setFontColor("Gray");
    obj.label9:setFontFamily("Stencil");
    obj.label9:setName("label9");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle11);
    obj.button3:setLeft(286);
    obj.button3:setTop(1);
    obj.button3:setWidth(23);
    obj.button3:setHeight(23);
    obj.button3:setText("+");
    obj.button3:setName("button3");

    obj.rclTalAncestralidade = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTalAncestralidade:setParent(obj.rectangle11);
    obj.rclTalAncestralidade:setLeft(0);
    obj.rclTalAncestralidade:setTop(25);
    obj.rclTalAncestralidade:setName("rclTalAncestralidade");
    obj.rclTalAncestralidade:setField("campoTalAncestralidade");
    obj.rclTalAncestralidade:setTemplateForm("frmTalentos");
    obj.rclTalAncestralidade:setWidth(328);
    obj.rclTalAncestralidade:setHeight(225);
    obj.rclTalAncestralidade:setLayout("vertical");
    obj.rclTalAncestralidade:setMinQt(0);

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.popTalentos);
    obj.rectangle14:setLeft(695);
    obj.rectangle14:setTop(5);
    obj.rectangle14:setWidth(310);
    obj.rectangle14:setName("rectangle14");
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("transparent");
    obj.rectangle14:setStrokeColor("Gray");
    obj.rectangle14:setStrokeSize(2);
    obj.rectangle14:setCornerType("innerRound");
    obj.rectangle14:setXradius(5);
    obj.rectangle14:setYradius(5);

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle14);
    obj.label10:setWidth(310);
    obj.label10:setHeight(25);
    obj.label10:setText("Talentos de Perícias");
    obj.label10:setVertTextAlign("center");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontSize(16);
    obj.label10:setFontColor("Gray");
    obj.label10:setFontFamily("Stencil");
    obj.label10:setName("label10");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.popTalentos);
    obj.rectangle15:setLeft(695);
    obj.rectangle15:setTop(30);
    obj.rectangle15:setWidth(310);
    obj.rectangle15:setHeight(255);
    obj.rectangle15:setColor("transparent");
    obj.rectangle15:setStrokeColor("Gray");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setXradius(10);
    obj.rectangle15:setYradius(10);
    obj.rectangle15:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle15:setName("rectangle15");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle15);
    obj.rectangle16:setLeft(0);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setName("rectangle16");
    obj.rectangle16:setWidth(55);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("transparent");
    obj.rectangle16:setStrokeColor("Gray");
    obj.rectangle16:setStrokeSize(2);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setXradius(5);
    obj.rectangle16:setYradius(5);

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle16);
    obj.label11:setVertTextAlign("center");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWidth(55);
    obj.label11:setHeight(25);
    obj.label11:setText("Nível");
    obj.label11:setFontColor("Gray");
    obj.label11:setFontFamily("Stencil");
    obj.label11:setName("label11");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle15);
    obj.rectangle17:setLeft(55);
    obj.rectangle17:setWidth(232);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setName("rectangle17");
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("transparent");
    obj.rectangle17:setStrokeColor("Gray");
    obj.rectangle17:setStrokeSize(2);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setXradius(5);
    obj.rectangle17:setYradius(5);

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle17);
    obj.label12:setVertTextAlign("center");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWidth(252);
    obj.label12:setHeight(25);
    obj.label12:setText("Nome");
    obj.label12:setFontColor("Gray");
    obj.label12:setFontFamily("Stencil");
    obj.label12:setName("label12");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle15);
    obj.button4:setLeft(286);
    obj.button4:setTop(1);
    obj.button4:setWidth(23);
    obj.button4:setHeight(23);
    obj.button4:setText("+");
    obj.button4:setName("button4");

    obj.rclTalPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTalPericias:setParent(obj.rectangle15);
    obj.rclTalPericias:setLeft(0);
    obj.rclTalPericias:setTop(25);
    obj.rclTalPericias:setName("rclTalPericias");
    obj.rclTalPericias:setField("campoTalPericias");
    obj.rclTalPericias:setTemplateForm("frmTalentos");
    obj.rclTalPericias:setWidth(328);
    obj.rclTalPericias:setHeight(225);
    obj.rclTalPericias:setLayout("vertical");
    obj.rclTalPericias:setMinQt(0);

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.popTalentos);
    obj.rectangle18:setLeft(25);
    obj.rectangle18:setTop(300);
    obj.rectangle18:setWidth(310);
    obj.rectangle18:setName("rectangle18");
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("transparent");
    obj.rectangle18:setStrokeColor("Gray");
    obj.rectangle18:setStrokeSize(2);
    obj.rectangle18:setCornerType("innerRound");
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(5);

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle18);
    obj.label13:setWidth(310);
    obj.label13:setHeight(25);
    obj.label13:setText("Talentos Gerais");
    obj.label13:setVertTextAlign("center");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setFontSize(16);
    obj.label13:setFontColor("Gray");
    obj.label13:setFontFamily("Stencil");
    obj.label13:setName("label13");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.popTalentos);
    obj.rectangle19:setLeft(25);
    obj.rectangle19:setTop(325);
    obj.rectangle19:setWidth(310);
    obj.rectangle19:setHeight(255);
    obj.rectangle19:setColor("transparent");
    obj.rectangle19:setStrokeColor("Gray");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setXradius(10);
    obj.rectangle19:setYradius(10);
    obj.rectangle19:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle19:setName("rectangle19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.rectangle19);
    obj.rectangle20:setLeft(0);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setName("rectangle20");
    obj.rectangle20:setWidth(55);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("transparent");
    obj.rectangle20:setStrokeColor("Gray");
    obj.rectangle20:setStrokeSize(2);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(5);

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle20);
    obj.label14:setVertTextAlign("center");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setWidth(55);
    obj.label14:setHeight(25);
    obj.label14:setText("Nível");
    obj.label14:setFontColor("Gray");
    obj.label14:setFontFamily("Stencil");
    obj.label14:setName("label14");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle19);
    obj.rectangle21:setLeft(55);
    obj.rectangle21:setWidth(232);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setName("rectangle21");
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("transparent");
    obj.rectangle21:setStrokeColor("Gray");
    obj.rectangle21:setStrokeSize(2);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setXradius(5);
    obj.rectangle21:setYradius(5);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle21);
    obj.label15:setVertTextAlign("center");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWidth(252);
    obj.label15:setHeight(25);
    obj.label15:setText("Nome");
    obj.label15:setFontColor("Gray");
    obj.label15:setFontFamily("Stencil");
    obj.label15:setName("label15");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle19);
    obj.button5:setLeft(286);
    obj.button5:setTop(1);
    obj.button5:setWidth(23);
    obj.button5:setHeight(23);
    obj.button5:setText("+");
    obj.button5:setName("button5");

    obj.rclTalGerais = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTalGerais:setParent(obj.rectangle19);
    obj.rclTalGerais:setLeft(0);
    obj.rclTalGerais:setTop(25);
    obj.rclTalGerais:setName("rclTalGerais");
    obj.rclTalGerais:setField("campoTalGerais");
    obj.rclTalGerais:setTemplateForm("frmTalentos");
    obj.rclTalGerais:setWidth(328);
    obj.rclTalGerais:setHeight(225);
    obj.rclTalGerais:setLayout("vertical");
    obj.rclTalGerais:setMinQt(0);

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.popTalentos);
    obj.rectangle22:setLeft(360);
    obj.rectangle22:setTop(300);
    obj.rectangle22:setWidth(310);
    obj.rectangle22:setName("rectangle22");
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("transparent");
    obj.rectangle22:setStrokeColor("Gray");
    obj.rectangle22:setStrokeSize(2);
    obj.rectangle22:setCornerType("innerRound");
    obj.rectangle22:setXradius(5);
    obj.rectangle22:setYradius(5);

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle22);
    obj.label16:setWidth(310);
    obj.label16:setHeight(25);
    obj.label16:setText("Talentos de Classe");
    obj.label16:setVertTextAlign("center");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(16);
    obj.label16:setFontColor("Gray");
    obj.label16:setFontFamily("Stencil");
    obj.label16:setName("label16");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.popTalentos);
    obj.rectangle23:setLeft(360);
    obj.rectangle23:setTop(325);
    obj.rectangle23:setWidth(310);
    obj.rectangle23:setHeight(255);
    obj.rectangle23:setColor("transparent");
    obj.rectangle23:setStrokeColor("Gray");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setXradius(10);
    obj.rectangle23:setYradius(10);
    obj.rectangle23:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle23:setName("rectangle23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle23);
    obj.rectangle24:setLeft(0);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setName("rectangle24");
    obj.rectangle24:setWidth(55);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("transparent");
    obj.rectangle24:setStrokeColor("Gray");
    obj.rectangle24:setStrokeSize(2);
    obj.rectangle24:setCornerType("round");
    obj.rectangle24:setXradius(5);
    obj.rectangle24:setYradius(5);

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle24);
    obj.label17:setVertTextAlign("center");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setWidth(55);
    obj.label17:setHeight(25);
    obj.label17:setText("Nível");
    obj.label17:setFontColor("Gray");
    obj.label17:setFontFamily("Stencil");
    obj.label17:setName("label17");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle23);
    obj.rectangle25:setLeft(55);
    obj.rectangle25:setWidth(232);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setName("rectangle25");
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("transparent");
    obj.rectangle25:setStrokeColor("Gray");
    obj.rectangle25:setStrokeSize(2);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setXradius(5);
    obj.rectangle25:setYradius(5);

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle25);
    obj.label18:setVertTextAlign("center");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWidth(252);
    obj.label18:setHeight(25);
    obj.label18:setText("Nome");
    obj.label18:setFontColor("Gray");
    obj.label18:setFontFamily("Stencil");
    obj.label18:setName("label18");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle23);
    obj.button6:setLeft(286);
    obj.button6:setTop(1);
    obj.button6:setWidth(23);
    obj.button6:setHeight(23);
    obj.button6:setText("+");
    obj.button6:setName("button6");

    obj.rclTalClasse = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTalClasse:setParent(obj.rectangle23);
    obj.rclTalClasse:setLeft(0);
    obj.rclTalClasse:setTop(25);
    obj.rclTalClasse:setName("rclTalClasse");
    obj.rclTalClasse:setField("campoTalClasse");
    obj.rclTalClasse:setTemplateForm("frmTalentos");
    obj.rclTalClasse:setWidth(328);
    obj.rclTalClasse:setHeight(225);
    obj.rclTalClasse:setLayout("vertical");
    obj.rclTalClasse:setMinQt(0);

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.popTalentos);
    obj.rectangle26:setLeft(695);
    obj.rectangle26:setTop(300);
    obj.rectangle26:setWidth(310);
    obj.rectangle26:setName("rectangle26");
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("transparent");
    obj.rectangle26:setStrokeColor("Gray");
    obj.rectangle26:setStrokeSize(2);
    obj.rectangle26:setCornerType("innerRound");
    obj.rectangle26:setXradius(5);
    obj.rectangle26:setYradius(5);

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle26);
    obj.label19:setWidth(310);
    obj.label19:setHeight(25);
    obj.label19:setText("Talentos Bônus");
    obj.label19:setVertTextAlign("center");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontSize(16);
    obj.label19:setFontColor("Gray");
    obj.label19:setFontFamily("Stencil");
    obj.label19:setName("label19");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.popTalentos);
    obj.rectangle27:setLeft(695);
    obj.rectangle27:setTop(325);
    obj.rectangle27:setWidth(310);
    obj.rectangle27:setHeight(255);
    obj.rectangle27:setColor("transparent");
    obj.rectangle27:setStrokeColor("Gray");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setCornerType("round");
    obj.rectangle27:setXradius(10);
    obj.rectangle27:setYradius(10);
    obj.rectangle27:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle27:setName("rectangle27");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.rectangle27);
    obj.rectangle28:setLeft(0);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setName("rectangle28");
    obj.rectangle28:setWidth(55);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("transparent");
    obj.rectangle28:setStrokeColor("Gray");
    obj.rectangle28:setStrokeSize(2);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(5);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle28);
    obj.label20:setVertTextAlign("center");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWidth(55);
    obj.label20:setHeight(25);
    obj.label20:setText("Nível");
    obj.label20:setFontColor("Gray");
    obj.label20:setFontFamily("Stencil");
    obj.label20:setName("label20");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.rectangle27);
    obj.rectangle29:setLeft(55);
    obj.rectangle29:setWidth(232);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setName("rectangle29");
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("transparent");
    obj.rectangle29:setStrokeColor("Gray");
    obj.rectangle29:setStrokeSize(2);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(5);

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle29);
    obj.label21:setVertTextAlign("center");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWidth(252);
    obj.label21:setHeight(25);
    obj.label21:setText("Nome");
    obj.label21:setFontColor("Gray");
    obj.label21:setFontFamily("Stencil");
    obj.label21:setName("label21");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle27);
    obj.button7:setLeft(286);
    obj.button7:setTop(1);
    obj.button7:setWidth(23);
    obj.button7:setHeight(23);
    obj.button7:setText("+");
    obj.button7:setName("button7");

    obj.rclTalBonus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTalBonus:setParent(obj.rectangle27);
    obj.rclTalBonus:setLeft(0);
    obj.rclTalBonus:setTop(25);
    obj.rclTalBonus:setName("rclTalBonus");
    obj.rclTalBonus:setField("campoTalBonus");
    obj.rclTalBonus:setTemplateForm("frmTalentos");
    obj.rclTalBonus:setWidth(328);
    obj.rclTalBonus:setHeight(225);
    obj.rclTalBonus:setLayout("vertical");
    obj.rclTalBonus:setMinQt(0);

    obj.popTalentoInfo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popTalentoInfo:setParent(obj.popTalentos);
    obj.popTalentoInfo:setName("popTalentoInfo");
    obj.popTalentoInfo:setWidth(400);
    obj.popTalentoInfo:setHeight(310);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.popTalentoInfo);
    obj.image4:setAlign("client");
    obj.image4:setStyle("stretch");
    obj.image4:setSRC("/imagens/Fundo 1.jpg");
    obj.image4:setOpacity(1);
    obj.image4:setName("image4");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.popTalentoInfo);
    obj.rectangle30:setLeft(135);
    obj.rectangle30:setTop(10);
    obj.rectangle30:setName("rectangle30");
    obj.rectangle30:setWidth(131);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("transparent");
    obj.rectangle30:setStrokeColor("Gray");
    obj.rectangle30:setStrokeSize(2);
    obj.rectangle30:setCornerType("innerRound");
    obj.rectangle30:setXradius(5);
    obj.rectangle30:setYradius(5);

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle30);
    obj.label22:setVertTextAlign("center");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWidth(131);
    obj.label22:setHeight(25);
    obj.label22:setText("Traços");
    obj.label22:setFontSize(16);
    obj.label22:setFontColor("Gray");
    obj.label22:setFontFamily("Stencil");
    obj.label22:setName("label22");

    obj.talTracosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.talTracosLabel:setParent(obj.popTalentoInfo);
    obj.talTracosLabel:setLeft(10);
    obj.talTracosLabel:setTop(35);
    obj.talTracosLabel:setWidth(380);
    obj.talTracosLabel:setHeight(25);
    obj.talTracosLabel:setColor("transparent");
    obj.talTracosLabel:setStrokeColor("Gray");
    obj.talTracosLabel:setStrokeSize(1);
    obj.talTracosLabel:setName("talTracosLabel");
    obj.talTracosLabel:setVisible(true);
    obj.talTracosLabel:setCornerType("round");
    obj.talTracosLabel:setXradius(5);
    obj.talTracosLabel:setYradius(5);

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.talTracosLabel);
    obj.label23:setWidth(380);
    obj.label23:setHeight(25);
    obj.label23:setField("talTracos");
    obj.label23:setFontSize(16);
    obj.label23:setVertTextAlign("center");
    obj.label23:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setFontColor("Gray");
    obj.label23:setName("label23");

    obj.talTracosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.talTracosEdit:setParent(obj.popTalentoInfo);
    obj.talTracosEdit:setField("talTracos");
    obj.talTracosEdit:setLeft(10);
    obj.talTracosEdit:setTop(35);
    obj.talTracosEdit:setWidth(380);
    obj.talTracosEdit:setHeight(25);
    obj.talTracosEdit:setName("talTracosEdit");
    obj.talTracosEdit:setVisible(false);
    obj.talTracosEdit:setFontSize(16);

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.popTalentoInfo);
    obj.rectangle31:setLeft(135);
    obj.rectangle31:setTop(70);
    obj.rectangle31:setName("rectangle31");
    obj.rectangle31:setWidth(131);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("transparent");
    obj.rectangle31:setStrokeColor("Gray");
    obj.rectangle31:setStrokeSize(2);
    obj.rectangle31:setCornerType("innerRound");
    obj.rectangle31:setXradius(5);
    obj.rectangle31:setYradius(5);

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle31);
    obj.label24:setWidth(131);
    obj.label24:setHeight(25);
    obj.label24:setText("Ações");
    obj.label24:setVertTextAlign("center");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontSize(16);
    obj.label24:setFontColor("Gray");
    obj.label24:setFontFamily("Stencil");
    obj.label24:setName("label24");

    obj.talAcoesLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.talAcoesLabel:setParent(obj.popTalentoInfo);
    obj.talAcoesLabel:setLeft(10);
    obj.talAcoesLabel:setTop(95);
    obj.talAcoesLabel:setWidth(380);
    obj.talAcoesLabel:setHeight(25);
    obj.talAcoesLabel:setColor("transparent");
    obj.talAcoesLabel:setStrokeColor("Gray");
    obj.talAcoesLabel:setStrokeSize(1);
    obj.talAcoesLabel:setName("talAcoesLabel");
    obj.talAcoesLabel:setVisible(true);
    obj.talAcoesLabel:setCornerType("round");
    obj.talAcoesLabel:setXradius(5);
    obj.talAcoesLabel:setYradius(5);

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.talAcoesLabel);
    obj.label25:setWidth(380);
    obj.label25:setHeight(25);
    obj.label25:setField("talAcoes");
    obj.label25:setFontSize(16);
    obj.label25:setVertTextAlign("center");
    obj.label25:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setFontColor("Gray");
    obj.label25:setName("label25");

    obj.talAcoesEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.talAcoesEdit:setParent(obj.popTalentoInfo);
    obj.talAcoesEdit:setField("talAcoes");
    obj.talAcoesEdit:setLeft(10);
    obj.talAcoesEdit:setTop(95);
    obj.talAcoesEdit:setWidth(380);
    obj.talAcoesEdit:setHeight(25);
    obj.talAcoesEdit:setName("talAcoesEdit");
    obj.talAcoesEdit:setVisible(false);
    obj.talAcoesEdit:setFontSize(16);

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.popTalentoInfo);
    obj.rectangle32:setLeft(135);
    obj.rectangle32:setTop(130);
    obj.rectangle32:setName("rectangle32");
    obj.rectangle32:setWidth(131);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("transparent");
    obj.rectangle32:setStrokeColor("Gray");
    obj.rectangle32:setStrokeSize(2);
    obj.rectangle32:setCornerType("innerRound");
    obj.rectangle32:setXradius(5);
    obj.rectangle32:setYradius(5);

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle32);
    obj.label26:setWidth(131);
    obj.label26:setHeight(25);
    obj.label26:setText("Descrição");
    obj.label26:setVertTextAlign("center");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setFontSize(16);
    obj.label26:setFontColor("Gray");
    obj.label26:setFontFamily("Stencil");
    obj.label26:setName("label26");

    obj.talDescLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.talDescLabel:setParent(obj.popTalentoInfo);
    obj.talDescLabel:setLeft(10);
    obj.talDescLabel:setTop(155);
    obj.talDescLabel:setWidth(380);
    obj.talDescLabel:setHeight(145);
    obj.talDescLabel:setColor("transparent");
    obj.talDescLabel:setStrokeColor("Gray");
    obj.talDescLabel:setStrokeSize(1);
    obj.talDescLabel:setName("talDescLabel");
    obj.talDescLabel:setVisible(true);
    obj.talDescLabel:setCornerType("round");
    obj.talDescLabel:setXradius(10);
    obj.talDescLabel:setYradius(10);
    obj.talDescLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.talDescLabel);
    obj.label27:setAlign("client");
    obj.label27:setField("talDesc");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setFontSize(16);
    obj.label27:setHorzTextAlign("leading");
    obj.label27:setVertTextAlign("leading");
    obj.label27:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label27:setFontColor("Gray");
    obj.label27:setName("label27");

    obj.talDescEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.talDescEdit:setParent(obj.popTalentoInfo);
    obj.talDescEdit:setField("talDesc");
    obj.talDescEdit:setLeft(10);
    obj.talDescEdit:setTop(155);
    obj.talDescEdit:setWidth(380);
    obj.talDescEdit:setHeight(145);
    obj.talDescEdit:setName("talDescEdit");
    obj.talDescEdit:setVisible(false);
    obj.talDescEdit:setFontSize(16);
    obj.talDescEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.popAcaoInfo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAcaoInfo:setParent(obj);
    obj.popAcaoInfo:setName("popAcaoInfo");
    obj.popAcaoInfo:setWidth(400);
    obj.popAcaoInfo:setHeight(400);

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.popAcaoInfo);
    obj.image5:setAlign("client");
    obj.image5:setStyle("stretch");
    obj.image5:setSRC("/imagens/Fundo 1.jpg");
    obj.image5:setOpacity(1);
    obj.image5:setName("image5");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.popAcaoInfo);
    obj.rectangle33:setLeft(135);
    obj.rectangle33:setTop(10);
    obj.rectangle33:setName("rectangle33");
    obj.rectangle33:setWidth(131);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("transparent");
    obj.rectangle33:setStrokeColor("Gray");
    obj.rectangle33:setStrokeSize(2);
    obj.rectangle33:setCornerType("innerRound");
    obj.rectangle33:setXradius(5);
    obj.rectangle33:setYradius(5);

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle33);
    obj.label28:setVertTextAlign("center");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWidth(131);
    obj.label28:setHeight(25);
    obj.label28:setText("Traços");
    obj.label28:setFontSize(16);
    obj.label28:setFontColor("Gray");
    obj.label28:setFontFamily("Stencil");
    obj.label28:setName("label28");

    obj.acaoTracosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.acaoTracosLabel:setParent(obj.popAcaoInfo);
    obj.acaoTracosLabel:setLeft(10);
    obj.acaoTracosLabel:setTop(35);
    obj.acaoTracosLabel:setWidth(380);
    obj.acaoTracosLabel:setHeight(25);
    obj.acaoTracosLabel:setColor("transparent");
    obj.acaoTracosLabel:setStrokeColor("Gray");
    obj.acaoTracosLabel:setStrokeSize(1);
    obj.acaoTracosLabel:setName("acaoTracosLabel");
    obj.acaoTracosLabel:setVisible(true);
    obj.acaoTracosLabel:setCornerType("round");
    obj.acaoTracosLabel:setXradius(5);
    obj.acaoTracosLabel:setYradius(5);

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.acaoTracosLabel);
    obj.label29:setWidth(380);
    obj.label29:setHeight(25);
    obj.label29:setField("acaoTracos");
    obj.label29:setFontSize(16);
    obj.label29:setVertTextAlign("center");
    obj.label29:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setFontColor("Gray");
    obj.label29:setName("label29");

    obj.acaoTracosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.acaoTracosEdit:setParent(obj.popAcaoInfo);
    obj.acaoTracosEdit:setField("acaoTracos");
    obj.acaoTracosEdit:setLeft(10);
    obj.acaoTracosEdit:setTop(35);
    obj.acaoTracosEdit:setWidth(380);
    obj.acaoTracosEdit:setHeight(25);
    obj.acaoTracosEdit:setName("acaoTracosEdit");
    obj.acaoTracosEdit:setVisible(false);
    obj.acaoTracosEdit:setFontSize(16);

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.popAcaoInfo);
    obj.rectangle34:setLeft(135);
    obj.rectangle34:setTop(70);
    obj.rectangle34:setName("rectangle34");
    obj.rectangle34:setWidth(131);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("transparent");
    obj.rectangle34:setStrokeColor("Gray");
    obj.rectangle34:setStrokeSize(2);
    obj.rectangle34:setCornerType("innerRound");
    obj.rectangle34:setXradius(5);
    obj.rectangle34:setYradius(5);

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle34);
    obj.label30:setVertTextAlign("center");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWidth(131);
    obj.label30:setHeight(25);
    obj.label30:setText("Acionamento");
    obj.label30:setFontSize(16);
    obj.label30:setFontColor("Gray");
    obj.label30:setFontFamily("Stencil");
    obj.label30:setName("label30");

    obj.acionamentoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.acionamentoLabel:setParent(obj.popAcaoInfo);
    obj.acionamentoLabel:setLeft(10);
    obj.acionamentoLabel:setTop(95);
    obj.acionamentoLabel:setWidth(380);
    obj.acionamentoLabel:setHeight(55);
    obj.acionamentoLabel:setColor("transparent");
    obj.acionamentoLabel:setStrokeColor("Gray");
    obj.acionamentoLabel:setStrokeSize(1);
    obj.acionamentoLabel:setName("acionamentoLabel");
    obj.acionamentoLabel:setVisible(true);
    obj.acionamentoLabel:setCornerType("round");
    obj.acionamentoLabel:setXradius(10);
    obj.acionamentoLabel:setYradius(10);
    obj.acionamentoLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.acionamentoLabel);
    obj.label31:setAlign("client");
    obj.label31:setField("acionamento");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setFontSize(16);
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setVertTextAlign("leading");
    obj.label31:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label31:setFontColor("Gray");
    obj.label31:setName("label31");

    obj.acionamentoEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.acionamentoEdit:setParent(obj.popAcaoInfo);
    obj.acionamentoEdit:setField("acionamento");
    obj.acionamentoEdit:setLeft(10);
    obj.acionamentoEdit:setTop(95);
    obj.acionamentoEdit:setWidth(380);
    obj.acionamentoEdit:setHeight(55);
    obj.acionamentoEdit:setName("acionamentoEdit");
    obj.acionamentoEdit:setVisible(false);
    obj.acionamentoEdit:setFontSize(16);
    obj.acionamentoEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.popAcaoInfo);
    obj.rectangle35:setLeft(135);
    obj.rectangle35:setTop(160);
    obj.rectangle35:setName("rectangle35");
    obj.rectangle35:setWidth(131);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("transparent");
    obj.rectangle35:setStrokeColor("Gray");
    obj.rectangle35:setStrokeSize(2);
    obj.rectangle35:setCornerType("innerRound");
    obj.rectangle35:setXradius(5);
    obj.rectangle35:setYradius(5);

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle35);
    obj.label32:setWidth(131);
    obj.label32:setHeight(25);
    obj.label32:setText("Descrição");
    obj.label32:setVertTextAlign("center");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setFontSize(16);
    obj.label32:setFontColor("Gray");
    obj.label32:setFontFamily("Stencil");
    obj.label32:setName("label32");

    obj.acaoDescLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.acaoDescLabel:setParent(obj.popAcaoInfo);
    obj.acaoDescLabel:setLeft(10);
    obj.acaoDescLabel:setTop(185);
    obj.acaoDescLabel:setWidth(380);
    obj.acaoDescLabel:setHeight(205);
    obj.acaoDescLabel:setColor("transparent");
    obj.acaoDescLabel:setStrokeColor("Gray");
    obj.acaoDescLabel:setStrokeSize(1);
    obj.acaoDescLabel:setName("acaoDescLabel");
    obj.acaoDescLabel:setVisible(true);
    obj.acaoDescLabel:setCornerType("round");
    obj.acaoDescLabel:setXradius(10);
    obj.acaoDescLabel:setYradius(10);
    obj.acaoDescLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.acaoDescLabel);
    obj.label33:setAlign("client");
    obj.label33:setField("acaoDesc");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setFontSize(16);
    obj.label33:setHorzTextAlign("leading");
    obj.label33:setVertTextAlign("leading");
    obj.label33:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label33:setFontColor("Gray");
    obj.label33:setName("label33");

    obj.acaoDescEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.acaoDescEdit:setParent(obj.popAcaoInfo);
    obj.acaoDescEdit:setField("acaoDesc");
    obj.acaoDescEdit:setLeft(10);
    obj.acaoDescEdit:setTop(185);
    obj.acaoDescEdit:setWidth(380);
    obj.acaoDescEdit:setHeight(205);
    obj.acaoDescEdit:setName("acaoDescEdit");
    obj.acaoDescEdit:setVisible(false);
    obj.acaoDescEdit:setFontSize(16);
    obj.acaoDescEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.popItem = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.popItem:setParent(obj);
    obj.popItem:setName("popItem");
    obj.popItem:setWidth(585);
    obj.popItem:setHeight(330);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.popItem);
    obj.image6:setAlign("client");
    obj.image6:setStyle("stretch");
    obj.image6:setSRC("/imagens/Fundo 1.jpg");
    obj.image6:setOpacity(1);
    obj.image6:setName("image6");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.popItem);
    obj.rectangle36:setLeft(5);
    obj.rectangle36:setTop(5);
    obj.rectangle36:setWidth(300);
    obj.rectangle36:setHeight(320);
    obj.rectangle36:setColor("transparent");
    obj.rectangle36:setStrokeColor("Gray");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setCornerType("round");
    obj.rectangle36:setXradius(10);
    obj.rectangle36:setYradius(10);
    obj.rectangle36:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle36:setName("rectangle36");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.rectangle36);
    obj.rectangle37:setLeft(0);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(177);
    obj.rectangle37:setName("rectangle37");
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("transparent");
    obj.rectangle37:setStrokeColor("Gray");
    obj.rectangle37:setStrokeSize(2);
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setXradius(5);
    obj.rectangle37:setYradius(5);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle37);
    obj.label34:setVertTextAlign("center");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setWidth(177);
    obj.label34:setHeight(25);
    obj.label34:setText("Item");
    obj.label34:setFontSize(16);
    obj.label34:setFontColor("Gray");
    obj.label34:setFontFamily("Stencil");
    obj.label34:setName("label34");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.rectangle36);
    obj.rectangle38:setLeft(177);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(100);
    obj.rectangle38:setName("rectangle38");
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("transparent");
    obj.rectangle38:setStrokeColor("Gray");
    obj.rectangle38:setStrokeSize(2);
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setXradius(5);
    obj.rectangle38:setYradius(5);

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle38);
    obj.label35:setVertTextAlign("center");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setWidth(100);
    obj.label35:setHeight(25);
    obj.label35:setText("Volume");
    obj.label35:setFontSize(16);
    obj.label35:setFontColor("Gray");
    obj.label35:setFontFamily("Stencil");
    obj.label35:setName("label35");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle36);
    obj.button8:setLeft(277);
    obj.button8:setTop(1);
    obj.button8:setWidth(23);
    obj.button8:setHeight(23);
    obj.button8:setText("+");
    obj.button8:setName("button8");

    obj.rclInventario = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventario:setParent(obj.rectangle36);
    obj.rclInventario:setLeft(0);
    obj.rclInventario:setTop(25);
    obj.rclInventario:setName("rclInventario");
    obj.rclInventario:setField("campoInventario");
    obj.rclInventario:setTemplateForm("frmInventario");
    obj.rclInventario:setWidth(317);
    obj.rclInventario:setHeight(290);
    obj.rclInventario:setLayout("vertical");
    obj.rclInventario:setMinQt(0);

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.popItem);
    obj.rectangle39:setLeft(390);
    obj.rectangle39:setTop(5);
    obj.rectangle39:setName("rectangle39");
    obj.rectangle39:setWidth(131);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("transparent");
    obj.rectangle39:setStrokeColor("Gray");
    obj.rectangle39:setStrokeSize(2);
    obj.rectangle39:setCornerType("innerRound");
    obj.rectangle39:setXradius(5);
    obj.rectangle39:setYradius(5);

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle39);
    obj.label36:setVertTextAlign("center");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWidth(131);
    obj.label36:setHeight(25);
    obj.label36:setText("Dinheiro");
    obj.label36:setFontColor("Gray");
    obj.label36:setFontFamily("Stencil");
    obj.label36:setName("label36");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.popItem);
    obj.rectangle40:setLeft(373);
    obj.rectangle40:setTop(30);
    obj.rectangle40:setWidth(164);
    obj.rectangle40:setHeight(125);
    obj.rectangle40:setColor("transparent");
    obj.rectangle40:setStrokeColor("Gray");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setXradius(10);
    obj.rectangle40:setYradius(10);
    obj.rectangle40:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle40:setName("rectangle40");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.rectangle40);
    obj.rectangle41:setLeft(5);
    obj.rectangle41:setTop(5);
    obj.rectangle41:setWidth(55);
    obj.rectangle41:setName("rectangle41");
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("transparent");
    obj.rectangle41:setStrokeColor("Gray");
    obj.rectangle41:setStrokeSize(2);
    obj.rectangle41:setCornerType("innerRound");
    obj.rectangle41:setXradius(5);
    obj.rectangle41:setYradius(5);

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle41);
    obj.label37:setVertTextAlign("center");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setWidth(55);
    obj.label37:setHeight(25);
    obj.label37:setText("PC");
    obj.label37:setFontColor("Gray");
    obj.label37:setFontFamily("Stencil");
    obj.label37:setName("label37");

    obj.pecaCobreLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pecaCobreLabel:setParent(obj.rectangle40);
    obj.pecaCobreLabel:setLeft(59);
    obj.pecaCobreLabel:setTop(5);
    obj.pecaCobreLabel:setWidth(100);
    obj.pecaCobreLabel:setHeight(25);
    obj.pecaCobreLabel:setColor("transparent");
    obj.pecaCobreLabel:setStrokeColor("Gray");
    obj.pecaCobreLabel:setStrokeSize(1);
    obj.pecaCobreLabel:setName("pecaCobreLabel");
    obj.pecaCobreLabel:setVisible(true);
    obj.pecaCobreLabel:setCornerType("round");
    obj.pecaCobreLabel:setXradius(5);
    obj.pecaCobreLabel:setYradius(5);

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.pecaCobreLabel);
    obj.label38:setWidth(100);
    obj.label38:setHeight(25);
    obj.label38:setField("pecaCobre");
    obj.label38:setFontSize(16);
    obj.label38:setVertTextAlign("center");
    obj.label38:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label38, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setFontColor("Gray");
    obj.label38:setName("label38");

    obj.pecaCobreEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pecaCobreEdit:setParent(obj.rectangle40);
    obj.pecaCobreEdit:setField("pecaCobre");
    obj.pecaCobreEdit:setLeft(59);
    obj.pecaCobreEdit:setTop(5);
    obj.pecaCobreEdit:setWidth(100);
    obj.pecaCobreEdit:setHeight(25);
    obj.pecaCobreEdit:setType("float");
    obj.pecaCobreEdit:setName("pecaCobreEdit");
    obj.pecaCobreEdit:setVisible(false);
    obj.pecaCobreEdit:setFontSize(16);

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.rectangle40);
    obj.rectangle42:setLeft(5);
    obj.rectangle42:setTop(35);
    obj.rectangle42:setWidth(55);
    obj.rectangle42:setName("rectangle42");
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("transparent");
    obj.rectangle42:setStrokeColor("Gray");
    obj.rectangle42:setStrokeSize(2);
    obj.rectangle42:setCornerType("innerRound");
    obj.rectangle42:setXradius(5);
    obj.rectangle42:setYradius(5);

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle42);
    obj.label39:setVertTextAlign("center");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setWidth(55);
    obj.label39:setHeight(25);
    obj.label39:setText("PP");
    obj.label39:setFontColor("Gray");
    obj.label39:setFontFamily("Stencil");
    obj.label39:setName("label39");

    obj.pecaPrataLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pecaPrataLabel:setParent(obj.rectangle40);
    obj.pecaPrataLabel:setLeft(59);
    obj.pecaPrataLabel:setTop(35);
    obj.pecaPrataLabel:setWidth(100);
    obj.pecaPrataLabel:setHeight(25);
    obj.pecaPrataLabel:setColor("transparent");
    obj.pecaPrataLabel:setStrokeColor("Gray");
    obj.pecaPrataLabel:setStrokeSize(1);
    obj.pecaPrataLabel:setName("pecaPrataLabel");
    obj.pecaPrataLabel:setVisible(true);
    obj.pecaPrataLabel:setCornerType("round");
    obj.pecaPrataLabel:setXradius(5);
    obj.pecaPrataLabel:setYradius(5);

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.pecaPrataLabel);
    obj.label40:setWidth(100);
    obj.label40:setHeight(25);
    obj.label40:setField("pecaPrata");
    obj.label40:setFontSize(16);
    obj.label40:setVertTextAlign("center");
    obj.label40:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label40, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setFontColor("Gray");
    obj.label40:setName("label40");

    obj.pecaPrataEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pecaPrataEdit:setParent(obj.rectangle40);
    obj.pecaPrataEdit:setField("pecaPrata");
    obj.pecaPrataEdit:setLeft(59);
    obj.pecaPrataEdit:setTop(35);
    obj.pecaPrataEdit:setWidth(100);
    obj.pecaPrataEdit:setHeight(25);
    obj.pecaPrataEdit:setType("float");
    obj.pecaPrataEdit:setName("pecaPrataEdit");
    obj.pecaPrataEdit:setVisible(false);
    obj.pecaPrataEdit:setFontSize(16);

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.rectangle40);
    obj.rectangle43:setLeft(5);
    obj.rectangle43:setTop(65);
    obj.rectangle43:setWidth(55);
    obj.rectangle43:setName("rectangle43");
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("transparent");
    obj.rectangle43:setStrokeColor("Gray");
    obj.rectangle43:setStrokeSize(2);
    obj.rectangle43:setCornerType("innerRound");
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(5);

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle43);
    obj.label41:setVertTextAlign("center");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setWidth(55);
    obj.label41:setHeight(25);
    obj.label41:setText("PO");
    obj.label41:setFontColor("Gray");
    obj.label41:setFontFamily("Stencil");
    obj.label41:setName("label41");

    obj.pecaOuroLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pecaOuroLabel:setParent(obj.rectangle40);
    obj.pecaOuroLabel:setLeft(59);
    obj.pecaOuroLabel:setTop(65);
    obj.pecaOuroLabel:setWidth(100);
    obj.pecaOuroLabel:setHeight(25);
    obj.pecaOuroLabel:setColor("transparent");
    obj.pecaOuroLabel:setStrokeColor("Gray");
    obj.pecaOuroLabel:setStrokeSize(1);
    obj.pecaOuroLabel:setName("pecaOuroLabel");
    obj.pecaOuroLabel:setVisible(true);
    obj.pecaOuroLabel:setCornerType("round");
    obj.pecaOuroLabel:setXradius(5);
    obj.pecaOuroLabel:setYradius(5);

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.pecaOuroLabel);
    obj.label42:setWidth(100);
    obj.label42:setHeight(25);
    obj.label42:setField("pecaOuro");
    obj.label42:setFontSize(16);
    obj.label42:setVertTextAlign("center");
    obj.label42:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label42, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setFontColor("Gray");
    obj.label42:setName("label42");

    obj.pecaOuroEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pecaOuroEdit:setParent(obj.rectangle40);
    obj.pecaOuroEdit:setField("pecaOuro");
    obj.pecaOuroEdit:setLeft(59);
    obj.pecaOuroEdit:setTop(65);
    obj.pecaOuroEdit:setWidth(100);
    obj.pecaOuroEdit:setHeight(25);
    obj.pecaOuroEdit:setType("float");
    obj.pecaOuroEdit:setName("pecaOuroEdit");
    obj.pecaOuroEdit:setVisible(false);
    obj.pecaOuroEdit:setFontSize(16);

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.rectangle40);
    obj.rectangle44:setLeft(5);
    obj.rectangle44:setTop(95);
    obj.rectangle44:setWidth(55);
    obj.rectangle44:setName("rectangle44");
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("transparent");
    obj.rectangle44:setStrokeColor("Gray");
    obj.rectangle44:setStrokeSize(2);
    obj.rectangle44:setCornerType("innerRound");
    obj.rectangle44:setXradius(5);
    obj.rectangle44:setYradius(5);

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle44);
    obj.label43:setVertTextAlign("center");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setWidth(55);
    obj.label43:setHeight(25);
    obj.label43:setText("PL");
    obj.label43:setFontColor("Gray");
    obj.label43:setFontFamily("Stencil");
    obj.label43:setName("label43");

    obj.pecaPlatinaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pecaPlatinaLabel:setParent(obj.rectangle40);
    obj.pecaPlatinaLabel:setLeft(59);
    obj.pecaPlatinaLabel:setTop(95);
    obj.pecaPlatinaLabel:setWidth(100);
    obj.pecaPlatinaLabel:setHeight(25);
    obj.pecaPlatinaLabel:setColor("transparent");
    obj.pecaPlatinaLabel:setStrokeColor("Gray");
    obj.pecaPlatinaLabel:setStrokeSize(1);
    obj.pecaPlatinaLabel:setName("pecaPlatinaLabel");
    obj.pecaPlatinaLabel:setVisible(true);
    obj.pecaPlatinaLabel:setCornerType("round");
    obj.pecaPlatinaLabel:setXradius(5);
    obj.pecaPlatinaLabel:setYradius(5);

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.pecaPlatinaLabel);
    obj.label44:setWidth(100);
    obj.label44:setHeight(25);
    obj.label44:setField("pecaPlatina");
    obj.label44:setFontSize(16);
    obj.label44:setVertTextAlign("center");
    obj.label44:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label44, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setFontColor("Gray");
    obj.label44:setName("label44");

    obj.pecaPlatinaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pecaPlatinaEdit:setParent(obj.rectangle40);
    obj.pecaPlatinaEdit:setField("pecaPlatina");
    obj.pecaPlatinaEdit:setLeft(59);
    obj.pecaPlatinaEdit:setTop(95);
    obj.pecaPlatinaEdit:setWidth(100);
    obj.pecaPlatinaEdit:setHeight(25);
    obj.pecaPlatinaEdit:setType("float");
    obj.pecaPlatinaEdit:setName("pecaPlatinaEdit");
    obj.pecaPlatinaEdit:setVisible(false);
    obj.pecaPlatinaEdit:setFontSize(16);

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.popItem);
    obj.rectangle45:setLeft(390);
    obj.rectangle45:setTop(170);
    obj.rectangle45:setName("rectangle45");
    obj.rectangle45:setWidth(131);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("transparent");
    obj.rectangle45:setStrokeColor("Gray");
    obj.rectangle45:setStrokeSize(2);
    obj.rectangle45:setCornerType("innerRound");
    obj.rectangle45:setXradius(5);
    obj.rectangle45:setYradius(5);

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle45);
    obj.label45:setVertTextAlign("center");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWidth(131);
    obj.label45:setHeight(25);
    obj.label45:setText("Volume");
    obj.label45:setFontColor("Gray");
    obj.label45:setFontFamily("Stencil");
    obj.label45:setName("label45");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.popItem);
    obj.rectangle46:setLeft(330);
    obj.rectangle46:setTop(195);
    obj.rectangle46:setWidth(249);
    obj.rectangle46:setHeight(130);
    obj.rectangle46:setColor("transparent");
    obj.rectangle46:setStrokeColor("Gray");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setXradius(10);
    obj.rectangle46:setYradius(10);
    obj.rectangle46:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle46:setName("rectangle46");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.rectangle46);
    obj.rectangle47:setLeft(95);
    obj.rectangle47:setTop(5);
    obj.rectangle47:setWidth(60);
    obj.rectangle47:setHeight(60);
    obj.rectangle47:setColor("transparent");
    obj.rectangle47:setStrokeColor("Gray");
    obj.rectangle47:setStrokeSize(2);
    obj.rectangle47:setCornerType("round");
    obj.rectangle47:setXradius(30);
    obj.rectangle47:setYradius(30);
    obj.rectangle47:setName("rectangle47");

    obj.volumeAtualLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.volumeAtualLabel:setParent(obj.rectangle47);
    obj.volumeAtualLabel:setLeft(0);
    obj.volumeAtualLabel:setTop(0);
    obj.volumeAtualLabel:setWidth(60);
    obj.volumeAtualLabel:setHeight(60);
    obj.volumeAtualLabel:setField("volumeAtual");
    obj.volumeAtualLabel:setFontSize(16);
    obj.volumeAtualLabel:setName("volumeAtualLabel");
    obj.volumeAtualLabel:setVertTextAlign("center");
    obj.volumeAtualLabel:setHorzTextAlign("center");
    lfm_setPropAsString(obj.volumeAtualLabel, "formatFloat",  "0.##");
    lfm_setPropAsString(obj.volumeAtualLabel, "fontStyle",  "bold");
    obj.volumeAtualLabel:setFontColor("Gray");

    obj.volumeAtualEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.volumeAtualEdit:setParent(obj.rectangle47);
    obj.volumeAtualEdit:setField("volumeAtual");
    obj.volumeAtualEdit:setLeft(0);
    obj.volumeAtualEdit:setTop(0);
    obj.volumeAtualEdit:setWidth(60);
    obj.volumeAtualEdit:setHeight(60);
    obj.volumeAtualEdit:setType("float");
    obj.volumeAtualEdit:setName("volumeAtualEdit");
    obj.volumeAtualEdit:setVisible(false);
    obj.volumeAtualEdit:setFontSize(16);

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.rectangle46);
    obj.rectangle48:setLeft(5);
    obj.rectangle48:setTop(70);
    obj.rectangle48:setName("rectangle48");
    obj.rectangle48:setWidth(131);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("transparent");
    obj.rectangle48:setStrokeColor("Gray");
    obj.rectangle48:setStrokeSize(2);
    obj.rectangle48:setCornerType("innerRound");
    obj.rectangle48:setXradius(5);
    obj.rectangle48:setYradius(5);

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle48);
    obj.label46:setVertTextAlign("center");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setWidth(131);
    obj.label46:setHeight(25);
    obj.label46:setText("Sobrecarregado");
    obj.label46:setFontColor("Gray");
    obj.label46:setFontFamily("Stencil");
    obj.label46:setName("label46");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.rectangle46);
    obj.rectangle49:setLeft(135);
    obj.rectangle49:setTop(70);
    obj.rectangle49:setName("rectangle49");
    obj.rectangle49:setWidth(55);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("transparent");
    obj.rectangle49:setStrokeColor("Gray");
    obj.rectangle49:setStrokeSize(2);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(5);

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle49);
    obj.label47:setVertTextAlign("center");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setWidth(55);
    obj.label47:setHeight(25);
    obj.label47:setField("sobrecarga");
    obj.label47:setFontColor("Gray");
    obj.label47:setFontSize(16);
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setName("label47");

    obj.outrosSobrecargaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.outrosSobrecargaLabel:setParent(obj.rectangle46);
    obj.outrosSobrecargaLabel:setLeft(189);
    obj.outrosSobrecargaLabel:setTop(70);
    obj.outrosSobrecargaLabel:setWidth(55);
    obj.outrosSobrecargaLabel:setHeight(25);
    obj.outrosSobrecargaLabel:setColor("transparent");
    obj.outrosSobrecargaLabel:setStrokeColor("Gray");
    obj.outrosSobrecargaLabel:setStrokeSize(1);
    obj.outrosSobrecargaLabel:setName("outrosSobrecargaLabel");
    obj.outrosSobrecargaLabel:setVisible(true);
    obj.outrosSobrecargaLabel:setCornerType("round");
    obj.outrosSobrecargaLabel:setXradius(5);
    obj.outrosSobrecargaLabel:setYradius(5);

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.outrosSobrecargaLabel);
    obj.label48:setWidth(55);
    obj.label48:setHeight(25);
    obj.label48:setField("outrosSobrecarga");
    obj.label48:setFontSize(16);
    obj.label48:setVertTextAlign("center");
    obj.label48:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label48, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setFontColor("Gray");
    obj.label48:setName("label48");

    obj.outrosSobrecargaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.outrosSobrecargaEdit:setParent(obj.rectangle46);
    obj.outrosSobrecargaEdit:setField("outrosSobrecarga");
    obj.outrosSobrecargaEdit:setLeft(189);
    obj.outrosSobrecargaEdit:setTop(70);
    obj.outrosSobrecargaEdit:setWidth(55);
    obj.outrosSobrecargaEdit:setHeight(25);
    obj.outrosSobrecargaEdit:setType("float");
    obj.outrosSobrecargaEdit:setName("outrosSobrecargaEdit");
    obj.outrosSobrecargaEdit:setVisible(false);
    obj.outrosSobrecargaEdit:setFontSize(16);

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.rectangle46);
    obj.rectangle50:setLeft(5);
    obj.rectangle50:setTop(100);
    obj.rectangle50:setName("rectangle50");
    obj.rectangle50:setWidth(131);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("transparent");
    obj.rectangle50:setStrokeColor("Gray");
    obj.rectangle50:setStrokeSize(2);
    obj.rectangle50:setCornerType("innerRound");
    obj.rectangle50:setXradius(5);
    obj.rectangle50:setYradius(5);

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle50);
    obj.label49:setVertTextAlign("center");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setWidth(131);
    obj.label49:setHeight(25);
    obj.label49:setText("Máximo");
    obj.label49:setFontColor("Gray");
    obj.label49:setFontFamily("Stencil");
    obj.label49:setName("label49");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.rectangle46);
    obj.rectangle51:setLeft(135);
    obj.rectangle51:setTop(100);
    obj.rectangle51:setName("rectangle51");
    obj.rectangle51:setWidth(55);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("transparent");
    obj.rectangle51:setStrokeColor("Gray");
    obj.rectangle51:setStrokeSize(2);
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setXradius(5);
    obj.rectangle51:setYradius(5);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle51);
    obj.label50:setVertTextAlign("center");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setWidth(55);
    obj.label50:setHeight(25);
    obj.label50:setField("maximo");
    obj.label50:setFontColor("Gray");
    obj.label50:setFontSize(16);
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setName("label50");

    obj.outrosMaximoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.outrosMaximoLabel:setParent(obj.rectangle46);
    obj.outrosMaximoLabel:setLeft(189);
    obj.outrosMaximoLabel:setTop(100);
    obj.outrosMaximoLabel:setWidth(55);
    obj.outrosMaximoLabel:setHeight(25);
    obj.outrosMaximoLabel:setColor("transparent");
    obj.outrosMaximoLabel:setStrokeColor("Gray");
    obj.outrosMaximoLabel:setStrokeSize(1);
    obj.outrosMaximoLabel:setName("outrosMaximoLabel");
    obj.outrosMaximoLabel:setVisible(true);
    obj.outrosMaximoLabel:setCornerType("round");
    obj.outrosMaximoLabel:setXradius(5);
    obj.outrosMaximoLabel:setYradius(5);

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.outrosMaximoLabel);
    obj.label51:setWidth(55);
    obj.label51:setHeight(25);
    obj.label51:setField("outrosMaximo");
    obj.label51:setFontSize(16);
    obj.label51:setVertTextAlign("center");
    obj.label51:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label51, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setFontColor("Gray");
    obj.label51:setName("label51");

    obj.outrosMaximoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.outrosMaximoEdit:setParent(obj.rectangle46);
    obj.outrosMaximoEdit:setField("outrosMaximo");
    obj.outrosMaximoEdit:setLeft(189);
    obj.outrosMaximoEdit:setTop(100);
    obj.outrosMaximoEdit:setWidth(55);
    obj.outrosMaximoEdit:setHeight(25);
    obj.outrosMaximoEdit:setType("float");
    obj.outrosMaximoEdit:setName("outrosMaximoEdit");
    obj.outrosMaximoEdit:setVisible(false);
    obj.outrosMaximoEdit:setFontSize(16);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle46);
    obj.dataLink1:setFields({'modFor','outrosSobrecarga','outrosMaximo'});
    obj.dataLink1:setName("dataLink1");

    obj.popInv = GUI.fromHandle(_obj_newObject("popup"));
    obj.popInv:setParent(obj.popItem);
    obj.popInv:setName("popInv");
    obj.popInv:setWidth(320);
    obj.popInv:setHeight(200);

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.popInv);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setName("rectangle52");
    obj.rectangle52:setColor("transparent");
    obj.rectangle52:setCornerType("round");
    obj.rectangle52:setXradius(15);
    obj.rectangle52:setYradius(15);
    obj.rectangle52:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.rectangle52);
    obj.image7:setAlign("client");
    obj.image7:setStyle("stretch");
    obj.image7:setSRC("/imagens/Fundo 1.jpg");
    obj.image7:setOpacity(1);
    obj.image7:setName("image7");

    obj.descItemLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.descItemLabel:setParent(obj.rectangle52);
    obj.descItemLabel:setLeft(5);
    obj.descItemLabel:setTop(5);
    obj.descItemLabel:setWidth(298);
    obj.descItemLabel:setHeight(178);
    obj.descItemLabel:setColor("transparent");
    obj.descItemLabel:setStrokeColor("Gray");
    obj.descItemLabel:setStrokeSize(1);
    obj.descItemLabel:setName("descItemLabel");
    obj.descItemLabel:setVisible(true);
    obj.descItemLabel:setCornerType("round");
    obj.descItemLabel:setXradius(10);
    obj.descItemLabel:setYradius(10);
    obj.descItemLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.descItemLabel);
    obj.label52:setAlign("client");
    obj.label52:setField("descItem");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setFontSize(16);
    obj.label52:setHorzTextAlign("leading");
    obj.label52:setVertTextAlign("leading");
    obj.label52:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label52:setFontColor("Gray");
    obj.label52:setName("label52");

    obj.descItemEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.descItemEdit:setParent(obj.rectangle52);
    obj.descItemEdit:setField("descItem");
    obj.descItemEdit:setLeft(5);
    obj.descItemEdit:setTop(5);
    obj.descItemEdit:setWidth(298);
    obj.descItemEdit:setHeight(178);
    obj.descItemEdit:setName("descItemEdit");
    obj.descItemEdit:setVisible(false);
    obj.descItemEdit:setFontSize(16);
    obj.descItemEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.popMagias = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.popMagias:setParent(obj);
    obj.popMagias:setName("popMagias");
    obj.popMagias:setWidth(1302);
    obj.popMagias:setHeight(546);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.popMagias);
    obj.image8:setAlign("client");
    obj.image8:setStyle("stretch");
    obj.image8:setSRC("/imagens/Fundo 1.jpg");
    obj.image8:setOpacity(1);
    obj.image8:setName("image8");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.popMagias);
    obj.rectangle53:setLeft(50);
    obj.rectangle53:setTop(5);
    obj.rectangle53:setWidth(200);
    obj.rectangle53:setName("rectangle53");
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setColor("transparent");
    obj.rectangle53:setStrokeColor("Gray");
    obj.rectangle53:setStrokeSize(2);
    obj.rectangle53:setCornerType("innerRound");
    obj.rectangle53:setXradius(5);
    obj.rectangle53:setYradius(5);

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle53);
    obj.label53:setWidth(200);
    obj.label53:setHeight(25);
    obj.label53:setText("Tradições Mágicas");
    obj.label53:setVertTextAlign("center");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setFontSize(16);
    obj.label53:setFontColor("Gray");
    obj.label53:setFontFamily("Stencil");
    obj.label53:setName("label53");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.popMagias);
    obj.rectangle54:setLeft(5);
    obj.rectangle54:setTop(30);
    obj.rectangle54:setWidth(290);
    obj.rectangle54:setHeight(116);
    obj.rectangle54:setColor("transparent");
    obj.rectangle54:setStrokeColor("Gray");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setCornerType("round");
    obj.rectangle54:setXradius(10);
    obj.rectangle54:setYradius(10);
    obj.rectangle54:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle54:setName("rectangle54");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.rectangle54);
    obj.rectangle55:setLeft(5);
    obj.rectangle55:setTop(8);
    obj.rectangle55:setWidth(115);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("transparent");
    obj.rectangle55:setStrokeColor("Gray");
    obj.rectangle55:setStrokeSize(2);
    obj.rectangle55:setCornerType("bevel");
    obj.rectangle55:setXradius(5);
    obj.rectangle55:setYradius(5);
    obj.rectangle55:setName("rectangle55");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle55);
    obj.label54:setVertTextAlign("center");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setWidth(115);
    obj.label54:setHeight(25);
    obj.label54:setText("Arcanas");
    obj.label54:setFontColor("Gray");
    obj.label54:setFontFamily("Stencil");
    obj.label54:setName("label54");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.rectangle54);
    obj.rectangle56:setLeft(110);
    obj.rectangle56:setTop(5);
    obj.rectangle56:setWidth(32);
    obj.rectangle56:setHeight(32);
    obj.rectangle56:setColor("Gray");
    obj.rectangle56:setCornerType("round");
    obj.rectangle56:setXradius(15);
    obj.rectangle56:setYradius(15);
    obj.rectangle56:setName("rectangle56");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.rectangle56);
    obj.imageCheckBox1:setLeft(3);
    obj.imageCheckBox1:setTop(3);
    obj.imageCheckBox1:setField("arcanas");
    obj.imageCheckBox1:setWidth(25);
    obj.imageCheckBox1:setHeight(25);
    obj.imageCheckBox1:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox1:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.rectangle54);
    obj.rectangle57:setLeft(5);
    obj.rectangle57:setTop(45);
    obj.rectangle57:setWidth(115);
    obj.rectangle57:setHeight(25);
    obj.rectangle57:setColor("transparent");
    obj.rectangle57:setStrokeColor("Gray");
    obj.rectangle57:setStrokeSize(2);
    obj.rectangle57:setCornerType("bevel");
    obj.rectangle57:setXradius(5);
    obj.rectangle57:setYradius(5);
    obj.rectangle57:setName("rectangle57");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle57);
    obj.label55:setVertTextAlign("center");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setWidth(115);
    obj.label55:setHeight(25);
    obj.label55:setText("Primais");
    obj.label55:setFontColor("Gray");
    obj.label55:setFontFamily("Stencil");
    obj.label55:setName("label55");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.rectangle54);
    obj.rectangle58:setLeft(110);
    obj.rectangle58:setTop(42);
    obj.rectangle58:setWidth(32);
    obj.rectangle58:setHeight(32);
    obj.rectangle58:setColor("Gray");
    obj.rectangle58:setCornerType("round");
    obj.rectangle58:setXradius(15);
    obj.rectangle58:setYradius(15);
    obj.rectangle58:setName("rectangle58");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.rectangle58);
    obj.imageCheckBox2:setLeft(3);
    obj.imageCheckBox2:setTop(3);
    obj.imageCheckBox2:setField("primais");
    obj.imageCheckBox2:setWidth(25);
    obj.imageCheckBox2:setHeight(25);
    obj.imageCheckBox2:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox2:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.rectangle54);
    obj.rectangle59:setLeft(5);
    obj.rectangle59:setTop(82);
    obj.rectangle59:setWidth(115);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("transparent");
    obj.rectangle59:setStrokeColor("Gray");
    obj.rectangle59:setStrokeSize(2);
    obj.rectangle59:setCornerType("bevel");
    obj.rectangle59:setXradius(5);
    obj.rectangle59:setYradius(5);
    obj.rectangle59:setName("rectangle59");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle59);
    obj.label56:setVertTextAlign("center");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setWidth(115);
    obj.label56:setHeight(25);
    obj.label56:setText("Preparadas");
    obj.label56:setFontColor("Gray");
    obj.label56:setFontFamily("Stencil");
    obj.label56:setName("label56");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.rectangle54);
    obj.rectangle60:setLeft(110);
    obj.rectangle60:setTop(79);
    obj.rectangle60:setWidth(32);
    obj.rectangle60:setHeight(32);
    obj.rectangle60:setColor("Gray");
    obj.rectangle60:setCornerType("round");
    obj.rectangle60:setXradius(15);
    obj.rectangle60:setYradius(15);
    obj.rectangle60:setName("rectangle60");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.rectangle60);
    obj.imageCheckBox3:setLeft(3);
    obj.imageCheckBox3:setTop(3);
    obj.imageCheckBox3:setField("preparadas");
    obj.imageCheckBox3:setWidth(25);
    obj.imageCheckBox3:setHeight(25);
    obj.imageCheckBox3:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox3:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.rectangle54);
    obj.rectangle61:setLeft(170);
    obj.rectangle61:setTop(8);
    obj.rectangle61:setWidth(115);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("transparent");
    obj.rectangle61:setStrokeColor("Gray");
    obj.rectangle61:setStrokeSize(2);
    obj.rectangle61:setCornerType("bevel");
    obj.rectangle61:setXradius(5);
    obj.rectangle61:setYradius(5);
    obj.rectangle61:setName("rectangle61");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle61);
    obj.label57:setVertTextAlign("center");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setWidth(115);
    obj.label57:setHeight(25);
    obj.label57:setText("Ocultistas");
    obj.label57:setFontColor("Gray");
    obj.label57:setFontFamily("Stencil");
    obj.label57:setName("label57");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.rectangle54);
    obj.rectangle62:setLeft(150);
    obj.rectangle62:setTop(5);
    obj.rectangle62:setWidth(32);
    obj.rectangle62:setHeight(32);
    obj.rectangle62:setColor("Gray");
    obj.rectangle62:setCornerType("round");
    obj.rectangle62:setXradius(15);
    obj.rectangle62:setYradius(15);
    obj.rectangle62:setName("rectangle62");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.rectangle62);
    obj.imageCheckBox4:setLeft(3);
    obj.imageCheckBox4:setTop(3);
    obj.imageCheckBox4:setField("ocultistas");
    obj.imageCheckBox4:setWidth(25);
    obj.imageCheckBox4:setHeight(25);
    obj.imageCheckBox4:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox4:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.rectangle54);
    obj.rectangle63:setLeft(170);
    obj.rectangle63:setTop(45);
    obj.rectangle63:setWidth(115);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("transparent");
    obj.rectangle63:setStrokeColor("Gray");
    obj.rectangle63:setStrokeSize(2);
    obj.rectangle63:setCornerType("bevel");
    obj.rectangle63:setXradius(5);
    obj.rectangle63:setYradius(5);
    obj.rectangle63:setName("rectangle63");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle63);
    obj.label58:setVertTextAlign("center");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setWidth(115);
    obj.label58:setHeight(25);
    obj.label58:setText("Divinas");
    obj.label58:setFontColor("Gray");
    obj.label58:setFontFamily("Stencil");
    obj.label58:setName("label58");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.rectangle54);
    obj.rectangle64:setLeft(150);
    obj.rectangle64:setTop(42);
    obj.rectangle64:setWidth(32);
    obj.rectangle64:setHeight(32);
    obj.rectangle64:setColor("Gray");
    obj.rectangle64:setCornerType("round");
    obj.rectangle64:setXradius(15);
    obj.rectangle64:setYradius(15);
    obj.rectangle64:setName("rectangle64");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.rectangle64);
    obj.imageCheckBox5:setLeft(3);
    obj.imageCheckBox5:setTop(3);
    obj.imageCheckBox5:setField("divinas");
    obj.imageCheckBox5:setWidth(25);
    obj.imageCheckBox5:setHeight(25);
    obj.imageCheckBox5:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox5:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.rectangle54);
    obj.rectangle65:setLeft(170);
    obj.rectangle65:setTop(82);
    obj.rectangle65:setWidth(115);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("transparent");
    obj.rectangle65:setStrokeColor("Gray");
    obj.rectangle65:setStrokeSize(2);
    obj.rectangle65:setCornerType("bevel");
    obj.rectangle65:setXradius(5);
    obj.rectangle65:setYradius(5);
    obj.rectangle65:setName("rectangle65");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle65);
    obj.label59:setVertTextAlign("center");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setWidth(115);
    obj.label59:setHeight(25);
    obj.label59:setText("Espontâneas");
    obj.label59:setFontColor("Gray");
    obj.label59:setFontFamily("Stencil");
    obj.label59:setName("label59");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.rectangle54);
    obj.rectangle66:setLeft(150);
    obj.rectangle66:setTop(79);
    obj.rectangle66:setWidth(32);
    obj.rectangle66:setHeight(32);
    obj.rectangle66:setColor("Gray");
    obj.rectangle66:setCornerType("round");
    obj.rectangle66:setXradius(15);
    obj.rectangle66:setYradius(15);
    obj.rectangle66:setName("rectangle66");

    obj.imageCheckBox6 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox6:setParent(obj.rectangle66);
    obj.imageCheckBox6:setLeft(3);
    obj.imageCheckBox6:setTop(3);
    obj.imageCheckBox6:setField("espontaneas");
    obj.imageCheckBox6:setWidth(25);
    obj.imageCheckBox6:setHeight(25);
    obj.imageCheckBox6:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox6:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox6:setName("imageCheckBox6");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.popMagias);
    obj.rectangle67:setLeft(50);
    obj.rectangle67:setTop(156);
    obj.rectangle67:setWidth(200);
    obj.rectangle67:setName("rectangle67");
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("transparent");
    obj.rectangle67:setStrokeColor("Gray");
    obj.rectangle67:setStrokeSize(2);
    obj.rectangle67:setCornerType("innerRound");
    obj.rectangle67:setXradius(5);
    obj.rectangle67:setYradius(5);

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle67);
    obj.label60:setWidth(200);
    obj.label60:setHeight(25);
    obj.label60:setText("Espaços de Magia");
    obj.label60:setVertTextAlign("center");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setFontSize(16);
    obj.label60:setFontColor("Gray");
    obj.label60:setFontFamily("Stencil");
    obj.label60:setName("label60");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.popMagias);
    obj.rectangle68:setLeft(5);
    obj.rectangle68:setTop(181);
    obj.rectangle68:setWidth(290);
    obj.rectangle68:setHeight(355);
    obj.rectangle68:setColor("transparent");
    obj.rectangle68:setStrokeColor("Gray");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setCornerType("round");
    obj.rectangle68:setXradius(10);
    obj.rectangle68:setYradius(10);
    obj.rectangle68:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle68:setName("rectangle68");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.rectangle68);
    obj.rectangle69:setLeft(63);
    obj.rectangle69:setTop(5);
    obj.rectangle69:setWidth(110);
    obj.rectangle69:setName("rectangle69");
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setColor("transparent");
    obj.rectangle69:setStrokeColor("Gray");
    obj.rectangle69:setStrokeSize(2);
    obj.rectangle69:setCornerType("innerRound");
    obj.rectangle69:setXradius(5);
    obj.rectangle69:setYradius(5);

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle69);
    obj.label61:setVertTextAlign("center");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setWidth(110);
    obj.label61:setHeight(25);
    obj.label61:setText("Pontos de Foco");
    obj.label61:setFontColor("Gray");
    obj.label61:setFontFamily("Stencil");
    obj.label61:setFontSize(12);
    obj.label61:setName("label61");

    obj.pontoFocoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pontoFocoLabel:setParent(obj.rectangle68);
    obj.pontoFocoLabel:setLeft(173);
    obj.pontoFocoLabel:setTop(5);
    obj.pontoFocoLabel:setWidth(55);
    obj.pontoFocoLabel:setHeight(25);
    obj.pontoFocoLabel:setColor("transparent");
    obj.pontoFocoLabel:setStrokeColor("Gray");
    obj.pontoFocoLabel:setStrokeSize(1);
    obj.pontoFocoLabel:setName("pontoFocoLabel");
    obj.pontoFocoLabel:setVisible(true);
    obj.pontoFocoLabel:setCornerType("round");
    obj.pontoFocoLabel:setXradius(5);
    obj.pontoFocoLabel:setYradius(5);

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.pontoFocoLabel);
    obj.label62:setWidth(55);
    obj.label62:setHeight(25);
    obj.label62:setField("pontoFoco");
    obj.label62:setFontSize(16);
    obj.label62:setVertTextAlign("center");
    obj.label62:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label62, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setFontColor("Gray");
    obj.label62:setName("label62");

    obj.pontoFocoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pontoFocoEdit:setParent(obj.rectangle68);
    obj.pontoFocoEdit:setField("pontoFoco");
    obj.pontoFocoEdit:setLeft(173);
    obj.pontoFocoEdit:setTop(5);
    obj.pontoFocoEdit:setWidth(55);
    obj.pontoFocoEdit:setHeight(25);
    obj.pontoFocoEdit:setType("float");
    obj.pontoFocoEdit:setName("pontoFocoEdit");
    obj.pontoFocoEdit:setVisible(false);
    obj.pontoFocoEdit:setFontSize(16);

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.rectangle68);
    obj.rectangle70:setLeft(63);
    obj.rectangle70:setTop(40);
    obj.rectangle70:setWidth(110);
    obj.rectangle70:setName("rectangle70");
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("transparent");
    obj.rectangle70:setStrokeColor("Gray");
    obj.rectangle70:setStrokeSize(2);
    obj.rectangle70:setCornerType("innerRound");
    obj.rectangle70:setXradius(5);
    obj.rectangle70:setYradius(5);

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle70);
    obj.label63:setVertTextAlign("center");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setWidth(110);
    obj.label63:setHeight(25);
    obj.label63:setText("Nível de Truque");
    obj.label63:setFontColor("Gray");
    obj.label63:setFontFamily("Stencil");
    obj.label63:setFontSize(12);
    obj.label63:setName("label63");

    obj.nivelTruqueLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nivelTruqueLabel:setParent(obj.rectangle68);
    obj.nivelTruqueLabel:setLeft(173);
    obj.nivelTruqueLabel:setTop(40);
    obj.nivelTruqueLabel:setWidth(55);
    obj.nivelTruqueLabel:setHeight(25);
    obj.nivelTruqueLabel:setColor("transparent");
    obj.nivelTruqueLabel:setStrokeColor("Gray");
    obj.nivelTruqueLabel:setStrokeSize(1);
    obj.nivelTruqueLabel:setName("nivelTruqueLabel");
    obj.nivelTruqueLabel:setVisible(true);
    obj.nivelTruqueLabel:setCornerType("round");
    obj.nivelTruqueLabel:setXradius(5);
    obj.nivelTruqueLabel:setYradius(5);

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.nivelTruqueLabel);
    obj.label64:setWidth(55);
    obj.label64:setHeight(25);
    obj.label64:setField("nivelTruque");
    obj.label64:setFontSize(16);
    obj.label64:setVertTextAlign("center");
    obj.label64:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label64, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setFontColor("Gray");
    obj.label64:setName("label64");

    obj.nivelTruqueEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivelTruqueEdit:setParent(obj.rectangle68);
    obj.nivelTruqueEdit:setField("nivelTruque");
    obj.nivelTruqueEdit:setLeft(173);
    obj.nivelTruqueEdit:setTop(40);
    obj.nivelTruqueEdit:setWidth(55);
    obj.nivelTruqueEdit:setHeight(25);
    obj.nivelTruqueEdit:setType("float");
    obj.nivelTruqueEdit:setName("nivelTruqueEdit");
    obj.nivelTruqueEdit:setVisible(false);
    obj.nivelTruqueEdit:setFontSize(16);

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.rectangle68);
    obj.rectangle71:setLeft(63);
    obj.rectangle71:setTop(75);
    obj.rectangle71:setName("rectangle71");
    obj.rectangle71:setWidth(55);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("transparent");
    obj.rectangle71:setStrokeColor("Gray");
    obj.rectangle71:setStrokeSize(2);
    obj.rectangle71:setCornerType("round");
    obj.rectangle71:setXradius(5);
    obj.rectangle71:setYradius(5);

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle71);
    obj.label65:setVertTextAlign("center");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setWidth(55);
    obj.label65:setHeight(25);
    obj.label65:setText("Nível");
    obj.label65:setFontColor("Gray");
    obj.label65:setFontFamily("Stencil");
    obj.label65:setName("label65");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.rectangle68);
    obj.rectangle72:setLeft(118);
    obj.rectangle72:setWidth(55);
    obj.rectangle72:setTop(75);
    obj.rectangle72:setName("rectangle72");
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("transparent");
    obj.rectangle72:setStrokeColor("Gray");
    obj.rectangle72:setStrokeSize(2);
    obj.rectangle72:setCornerType("round");
    obj.rectangle72:setXradius(5);
    obj.rectangle72:setYradius(5);

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle72);
    obj.label66:setVertTextAlign("center");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setWidth(55);
    obj.label66:setHeight(25);
    obj.label66:setText("Máximo");
    obj.label66:setFontColor("Gray");
    obj.label66:setFontFamily("Stencil");
    obj.label66:setName("label66");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.rectangle68);
    obj.rectangle73:setLeft(173);
    obj.rectangle73:setWidth(55);
    obj.rectangle73:setTop(75);
    obj.rectangle73:setName("rectangle73");
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setColor("transparent");
    obj.rectangle73:setStrokeColor("Gray");
    obj.rectangle73:setStrokeSize(2);
    obj.rectangle73:setCornerType("round");
    obj.rectangle73:setXradius(5);
    obj.rectangle73:setYradius(5);

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle73);
    obj.label67:setVertTextAlign("center");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setWidth(55);
    obj.label67:setHeight(25);
    obj.label67:setText("Usados");
    obj.label67:setFontColor("Gray");
    obj.label67:setFontFamily("Stencil");
    obj.label67:setName("label67");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.rectangle68);
    obj.rectangle74:setLeft(63);
    obj.rectangle74:setTop(100);
    obj.rectangle74:setWidth(55);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("transparent");
    obj.rectangle74:setStrokeColor("Gray");
    obj.rectangle74:setStrokeSize(2);
    obj.rectangle74:setCornerType("round");
    obj.rectangle74:setXradius(5);
    obj.rectangle74:setYradius(5);
    obj.rectangle74:setName("rectangle74");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle74);
    obj.label68:setVertTextAlign("center");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setWidth(55);
    obj.label68:setHeight(25);
    obj.label68:setText("1");
    obj.label68:setFontColor("Gray");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setName("label68");

    obj.maxSlot1Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot1Label:setParent(obj.rectangle68);
    obj.maxSlot1Label:setLeft(118);
    obj.maxSlot1Label:setTop(100);
    obj.maxSlot1Label:setWidth(55);
    obj.maxSlot1Label:setHeight(25);
    obj.maxSlot1Label:setColor("transparent");
    obj.maxSlot1Label:setStrokeColor("Gray");
    obj.maxSlot1Label:setStrokeSize(1);
    obj.maxSlot1Label:setName("maxSlot1Label");
    obj.maxSlot1Label:setVisible(true);
    obj.maxSlot1Label:setCornerType("round");
    obj.maxSlot1Label:setXradius(5);
    obj.maxSlot1Label:setYradius(5);

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.maxSlot1Label);
    obj.label69:setWidth(55);
    obj.label69:setHeight(25);
    obj.label69:setField("maxSlot1");
    obj.label69:setFontSize(16);
    obj.label69:setVertTextAlign("center");
    obj.label69:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label69, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setFontColor("Gray");
    obj.label69:setName("label69");

    obj.maxSlot1Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot1Edit:setParent(obj.rectangle68);
    obj.maxSlot1Edit:setField("maxSlot1");
    obj.maxSlot1Edit:setLeft(118);
    obj.maxSlot1Edit:setTop(100);
    obj.maxSlot1Edit:setWidth(55);
    obj.maxSlot1Edit:setHeight(25);
    obj.maxSlot1Edit:setType("float");
    obj.maxSlot1Edit:setName("maxSlot1Edit");
    obj.maxSlot1Edit:setVisible(false);
    obj.maxSlot1Edit:setFontSize(16);

    obj.usadosSlot1Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot1Label:setParent(obj.rectangle68);
    obj.usadosSlot1Label:setLeft(173);
    obj.usadosSlot1Label:setTop(100);
    obj.usadosSlot1Label:setWidth(55);
    obj.usadosSlot1Label:setHeight(25);
    obj.usadosSlot1Label:setColor("transparent");
    obj.usadosSlot1Label:setStrokeColor("Gray");
    obj.usadosSlot1Label:setStrokeSize(1);
    obj.usadosSlot1Label:setName("usadosSlot1Label");
    obj.usadosSlot1Label:setVisible(true);
    obj.usadosSlot1Label:setCornerType("round");
    obj.usadosSlot1Label:setXradius(5);
    obj.usadosSlot1Label:setYradius(5);

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.usadosSlot1Label);
    obj.label70:setWidth(55);
    obj.label70:setHeight(25);
    obj.label70:setField("usadosSlot1");
    obj.label70:setFontSize(16);
    obj.label70:setVertTextAlign("center");
    obj.label70:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label70, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setFontColor("Gray");
    obj.label70:setName("label70");

    obj.usadosSlot1Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot1Edit:setParent(obj.rectangle68);
    obj.usadosSlot1Edit:setField("usadosSlot1");
    obj.usadosSlot1Edit:setLeft(173);
    obj.usadosSlot1Edit:setTop(100);
    obj.usadosSlot1Edit:setWidth(55);
    obj.usadosSlot1Edit:setHeight(25);
    obj.usadosSlot1Edit:setType("float");
    obj.usadosSlot1Edit:setName("usadosSlot1Edit");
    obj.usadosSlot1Edit:setVisible(false);
    obj.usadosSlot1Edit:setFontSize(16);

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.rectangle68);
    obj.rectangle75:setLeft(63);
    obj.rectangle75:setTop(125);
    obj.rectangle75:setWidth(55);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("transparent");
    obj.rectangle75:setStrokeColor("Gray");
    obj.rectangle75:setStrokeSize(2);
    obj.rectangle75:setCornerType("round");
    obj.rectangle75:setXradius(5);
    obj.rectangle75:setYradius(5);
    obj.rectangle75:setName("rectangle75");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle75);
    obj.label71:setVertTextAlign("center");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setWidth(55);
    obj.label71:setHeight(25);
    obj.label71:setText("2");
    obj.label71:setFontColor("Gray");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setName("label71");

    obj.maxSlot2Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot2Label:setParent(obj.rectangle68);
    obj.maxSlot2Label:setLeft(118);
    obj.maxSlot2Label:setTop(125);
    obj.maxSlot2Label:setWidth(55);
    obj.maxSlot2Label:setHeight(25);
    obj.maxSlot2Label:setColor("transparent");
    obj.maxSlot2Label:setStrokeColor("Gray");
    obj.maxSlot2Label:setStrokeSize(1);
    obj.maxSlot2Label:setName("maxSlot2Label");
    obj.maxSlot2Label:setVisible(true);
    obj.maxSlot2Label:setCornerType("round");
    obj.maxSlot2Label:setXradius(5);
    obj.maxSlot2Label:setYradius(5);

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.maxSlot2Label);
    obj.label72:setWidth(55);
    obj.label72:setHeight(25);
    obj.label72:setField("maxSlot2");
    obj.label72:setFontSize(16);
    obj.label72:setVertTextAlign("center");
    obj.label72:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label72, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setFontColor("Gray");
    obj.label72:setName("label72");

    obj.maxSlot2Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot2Edit:setParent(obj.rectangle68);
    obj.maxSlot2Edit:setField("maxSlot2");
    obj.maxSlot2Edit:setLeft(118);
    obj.maxSlot2Edit:setTop(125);
    obj.maxSlot2Edit:setWidth(55);
    obj.maxSlot2Edit:setHeight(25);
    obj.maxSlot2Edit:setType("float");
    obj.maxSlot2Edit:setName("maxSlot2Edit");
    obj.maxSlot2Edit:setVisible(false);
    obj.maxSlot2Edit:setFontSize(16);

    obj.usadosSlot2Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot2Label:setParent(obj.rectangle68);
    obj.usadosSlot2Label:setLeft(173);
    obj.usadosSlot2Label:setTop(125);
    obj.usadosSlot2Label:setWidth(55);
    obj.usadosSlot2Label:setHeight(25);
    obj.usadosSlot2Label:setColor("transparent");
    obj.usadosSlot2Label:setStrokeColor("Gray");
    obj.usadosSlot2Label:setStrokeSize(1);
    obj.usadosSlot2Label:setName("usadosSlot2Label");
    obj.usadosSlot2Label:setVisible(true);
    obj.usadosSlot2Label:setCornerType("round");
    obj.usadosSlot2Label:setXradius(5);
    obj.usadosSlot2Label:setYradius(5);

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.usadosSlot2Label);
    obj.label73:setWidth(55);
    obj.label73:setHeight(25);
    obj.label73:setField("usadosSlot2");
    obj.label73:setFontSize(16);
    obj.label73:setVertTextAlign("center");
    obj.label73:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label73, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setFontColor("Gray");
    obj.label73:setName("label73");

    obj.usadosSlot2Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot2Edit:setParent(obj.rectangle68);
    obj.usadosSlot2Edit:setField("usadosSlot2");
    obj.usadosSlot2Edit:setLeft(173);
    obj.usadosSlot2Edit:setTop(125);
    obj.usadosSlot2Edit:setWidth(55);
    obj.usadosSlot2Edit:setHeight(25);
    obj.usadosSlot2Edit:setType("float");
    obj.usadosSlot2Edit:setName("usadosSlot2Edit");
    obj.usadosSlot2Edit:setVisible(false);
    obj.usadosSlot2Edit:setFontSize(16);

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.rectangle68);
    obj.rectangle76:setLeft(63);
    obj.rectangle76:setTop(150);
    obj.rectangle76:setWidth(55);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setColor("transparent");
    obj.rectangle76:setStrokeColor("Gray");
    obj.rectangle76:setStrokeSize(2);
    obj.rectangle76:setCornerType("round");
    obj.rectangle76:setXradius(5);
    obj.rectangle76:setYradius(5);
    obj.rectangle76:setName("rectangle76");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle76);
    obj.label74:setVertTextAlign("center");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setWidth(55);
    obj.label74:setHeight(25);
    obj.label74:setText("3");
    obj.label74:setFontColor("Gray");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setName("label74");

    obj.maxSlot3Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot3Label:setParent(obj.rectangle68);
    obj.maxSlot3Label:setLeft(118);
    obj.maxSlot3Label:setTop(150);
    obj.maxSlot3Label:setWidth(55);
    obj.maxSlot3Label:setHeight(25);
    obj.maxSlot3Label:setColor("transparent");
    obj.maxSlot3Label:setStrokeColor("Gray");
    obj.maxSlot3Label:setStrokeSize(1);
    obj.maxSlot3Label:setName("maxSlot3Label");
    obj.maxSlot3Label:setVisible(true);
    obj.maxSlot3Label:setCornerType("round");
    obj.maxSlot3Label:setXradius(5);
    obj.maxSlot3Label:setYradius(5);

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.maxSlot3Label);
    obj.label75:setWidth(55);
    obj.label75:setHeight(25);
    obj.label75:setField("maxSlot3");
    obj.label75:setFontSize(16);
    obj.label75:setVertTextAlign("center");
    obj.label75:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label75, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setFontColor("Gray");
    obj.label75:setName("label75");

    obj.maxSlot3Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot3Edit:setParent(obj.rectangle68);
    obj.maxSlot3Edit:setField("maxSlot3");
    obj.maxSlot3Edit:setLeft(118);
    obj.maxSlot3Edit:setTop(150);
    obj.maxSlot3Edit:setWidth(55);
    obj.maxSlot3Edit:setHeight(25);
    obj.maxSlot3Edit:setType("float");
    obj.maxSlot3Edit:setName("maxSlot3Edit");
    obj.maxSlot3Edit:setVisible(false);
    obj.maxSlot3Edit:setFontSize(16);

    obj.usadosSlot3Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot3Label:setParent(obj.rectangle68);
    obj.usadosSlot3Label:setLeft(173);
    obj.usadosSlot3Label:setTop(150);
    obj.usadosSlot3Label:setWidth(55);
    obj.usadosSlot3Label:setHeight(25);
    obj.usadosSlot3Label:setColor("transparent");
    obj.usadosSlot3Label:setStrokeColor("Gray");
    obj.usadosSlot3Label:setStrokeSize(1);
    obj.usadosSlot3Label:setName("usadosSlot3Label");
    obj.usadosSlot3Label:setVisible(true);
    obj.usadosSlot3Label:setCornerType("round");
    obj.usadosSlot3Label:setXradius(5);
    obj.usadosSlot3Label:setYradius(5);

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.usadosSlot3Label);
    obj.label76:setWidth(55);
    obj.label76:setHeight(25);
    obj.label76:setField("usadosSlot3");
    obj.label76:setFontSize(16);
    obj.label76:setVertTextAlign("center");
    obj.label76:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label76, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setFontColor("Gray");
    obj.label76:setName("label76");

    obj.usadosSlot3Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot3Edit:setParent(obj.rectangle68);
    obj.usadosSlot3Edit:setField("usadosSlot3");
    obj.usadosSlot3Edit:setLeft(173);
    obj.usadosSlot3Edit:setTop(150);
    obj.usadosSlot3Edit:setWidth(55);
    obj.usadosSlot3Edit:setHeight(25);
    obj.usadosSlot3Edit:setType("float");
    obj.usadosSlot3Edit:setName("usadosSlot3Edit");
    obj.usadosSlot3Edit:setVisible(false);
    obj.usadosSlot3Edit:setFontSize(16);

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.rectangle68);
    obj.rectangle77:setLeft(63);
    obj.rectangle77:setTop(175);
    obj.rectangle77:setWidth(55);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setColor("transparent");
    obj.rectangle77:setStrokeColor("Gray");
    obj.rectangle77:setStrokeSize(2);
    obj.rectangle77:setCornerType("round");
    obj.rectangle77:setXradius(5);
    obj.rectangle77:setYradius(5);
    obj.rectangle77:setName("rectangle77");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle77);
    obj.label77:setVertTextAlign("center");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setWidth(55);
    obj.label77:setHeight(25);
    obj.label77:setText("4");
    obj.label77:setFontColor("Gray");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setName("label77");

    obj.maxSlot4Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot4Label:setParent(obj.rectangle68);
    obj.maxSlot4Label:setLeft(118);
    obj.maxSlot4Label:setTop(175);
    obj.maxSlot4Label:setWidth(55);
    obj.maxSlot4Label:setHeight(25);
    obj.maxSlot4Label:setColor("transparent");
    obj.maxSlot4Label:setStrokeColor("Gray");
    obj.maxSlot4Label:setStrokeSize(1);
    obj.maxSlot4Label:setName("maxSlot4Label");
    obj.maxSlot4Label:setVisible(true);
    obj.maxSlot4Label:setCornerType("round");
    obj.maxSlot4Label:setXradius(5);
    obj.maxSlot4Label:setYradius(5);

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.maxSlot4Label);
    obj.label78:setWidth(55);
    obj.label78:setHeight(25);
    obj.label78:setField("maxSlot4");
    obj.label78:setFontSize(16);
    obj.label78:setVertTextAlign("center");
    obj.label78:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label78, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setFontColor("Gray");
    obj.label78:setName("label78");

    obj.maxSlot4Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot4Edit:setParent(obj.rectangle68);
    obj.maxSlot4Edit:setField("maxSlot4");
    obj.maxSlot4Edit:setLeft(118);
    obj.maxSlot4Edit:setTop(175);
    obj.maxSlot4Edit:setWidth(55);
    obj.maxSlot4Edit:setHeight(25);
    obj.maxSlot4Edit:setType("float");
    obj.maxSlot4Edit:setName("maxSlot4Edit");
    obj.maxSlot4Edit:setVisible(false);
    obj.maxSlot4Edit:setFontSize(16);

    obj.usadosSlot4Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot4Label:setParent(obj.rectangle68);
    obj.usadosSlot4Label:setLeft(173);
    obj.usadosSlot4Label:setTop(175);
    obj.usadosSlot4Label:setWidth(55);
    obj.usadosSlot4Label:setHeight(25);
    obj.usadosSlot4Label:setColor("transparent");
    obj.usadosSlot4Label:setStrokeColor("Gray");
    obj.usadosSlot4Label:setStrokeSize(1);
    obj.usadosSlot4Label:setName("usadosSlot4Label");
    obj.usadosSlot4Label:setVisible(true);
    obj.usadosSlot4Label:setCornerType("round");
    obj.usadosSlot4Label:setXradius(5);
    obj.usadosSlot4Label:setYradius(5);

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.usadosSlot4Label);
    obj.label79:setWidth(55);
    obj.label79:setHeight(25);
    obj.label79:setField("usadosSlot4");
    obj.label79:setFontSize(16);
    obj.label79:setVertTextAlign("center");
    obj.label79:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label79, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setFontColor("Gray");
    obj.label79:setName("label79");

    obj.usadosSlot4Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot4Edit:setParent(obj.rectangle68);
    obj.usadosSlot4Edit:setField("usadosSlot4");
    obj.usadosSlot4Edit:setLeft(173);
    obj.usadosSlot4Edit:setTop(175);
    obj.usadosSlot4Edit:setWidth(55);
    obj.usadosSlot4Edit:setHeight(25);
    obj.usadosSlot4Edit:setType("float");
    obj.usadosSlot4Edit:setName("usadosSlot4Edit");
    obj.usadosSlot4Edit:setVisible(false);
    obj.usadosSlot4Edit:setFontSize(16);

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.rectangle68);
    obj.rectangle78:setLeft(63);
    obj.rectangle78:setTop(200);
    obj.rectangle78:setWidth(55);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setColor("transparent");
    obj.rectangle78:setStrokeColor("Gray");
    obj.rectangle78:setStrokeSize(2);
    obj.rectangle78:setCornerType("round");
    obj.rectangle78:setXradius(5);
    obj.rectangle78:setYradius(5);
    obj.rectangle78:setName("rectangle78");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle78);
    obj.label80:setVertTextAlign("center");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setWidth(55);
    obj.label80:setHeight(25);
    obj.label80:setText("5");
    obj.label80:setFontColor("Gray");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setName("label80");

    obj.maxSlot5Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot5Label:setParent(obj.rectangle68);
    obj.maxSlot5Label:setLeft(118);
    obj.maxSlot5Label:setTop(200);
    obj.maxSlot5Label:setWidth(55);
    obj.maxSlot5Label:setHeight(25);
    obj.maxSlot5Label:setColor("transparent");
    obj.maxSlot5Label:setStrokeColor("Gray");
    obj.maxSlot5Label:setStrokeSize(1);
    obj.maxSlot5Label:setName("maxSlot5Label");
    obj.maxSlot5Label:setVisible(true);
    obj.maxSlot5Label:setCornerType("round");
    obj.maxSlot5Label:setXradius(5);
    obj.maxSlot5Label:setYradius(5);

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.maxSlot5Label);
    obj.label81:setWidth(55);
    obj.label81:setHeight(25);
    obj.label81:setField("maxSlot5");
    obj.label81:setFontSize(16);
    obj.label81:setVertTextAlign("center");
    obj.label81:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label81, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setFontColor("Gray");
    obj.label81:setName("label81");

    obj.maxSlot5Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot5Edit:setParent(obj.rectangle68);
    obj.maxSlot5Edit:setField("maxSlot5");
    obj.maxSlot5Edit:setLeft(118);
    obj.maxSlot5Edit:setTop(200);
    obj.maxSlot5Edit:setWidth(55);
    obj.maxSlot5Edit:setHeight(25);
    obj.maxSlot5Edit:setType("float");
    obj.maxSlot5Edit:setName("maxSlot5Edit");
    obj.maxSlot5Edit:setVisible(false);
    obj.maxSlot5Edit:setFontSize(16);

    obj.usadosSlot5Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot5Label:setParent(obj.rectangle68);
    obj.usadosSlot5Label:setLeft(173);
    obj.usadosSlot5Label:setTop(200);
    obj.usadosSlot5Label:setWidth(55);
    obj.usadosSlot5Label:setHeight(25);
    obj.usadosSlot5Label:setColor("transparent");
    obj.usadosSlot5Label:setStrokeColor("Gray");
    obj.usadosSlot5Label:setStrokeSize(1);
    obj.usadosSlot5Label:setName("usadosSlot5Label");
    obj.usadosSlot5Label:setVisible(true);
    obj.usadosSlot5Label:setCornerType("round");
    obj.usadosSlot5Label:setXradius(5);
    obj.usadosSlot5Label:setYradius(5);

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.usadosSlot5Label);
    obj.label82:setWidth(55);
    obj.label82:setHeight(25);
    obj.label82:setField("usadosSlot5");
    obj.label82:setFontSize(16);
    obj.label82:setVertTextAlign("center");
    obj.label82:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label82, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setFontColor("Gray");
    obj.label82:setName("label82");

    obj.usadosSlot5Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot5Edit:setParent(obj.rectangle68);
    obj.usadosSlot5Edit:setField("usadosSlot5");
    obj.usadosSlot5Edit:setLeft(173);
    obj.usadosSlot5Edit:setTop(200);
    obj.usadosSlot5Edit:setWidth(55);
    obj.usadosSlot5Edit:setHeight(25);
    obj.usadosSlot5Edit:setType("float");
    obj.usadosSlot5Edit:setName("usadosSlot5Edit");
    obj.usadosSlot5Edit:setVisible(false);
    obj.usadosSlot5Edit:setFontSize(16);

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.rectangle68);
    obj.rectangle79:setLeft(63);
    obj.rectangle79:setTop(225);
    obj.rectangle79:setWidth(55);
    obj.rectangle79:setHeight(25);
    obj.rectangle79:setColor("transparent");
    obj.rectangle79:setStrokeColor("Gray");
    obj.rectangle79:setStrokeSize(2);
    obj.rectangle79:setCornerType("round");
    obj.rectangle79:setXradius(5);
    obj.rectangle79:setYradius(5);
    obj.rectangle79:setName("rectangle79");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle79);
    obj.label83:setVertTextAlign("center");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setWidth(55);
    obj.label83:setHeight(25);
    obj.label83:setText("6");
    obj.label83:setFontColor("Gray");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setName("label83");

    obj.maxSlot6Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot6Label:setParent(obj.rectangle68);
    obj.maxSlot6Label:setLeft(118);
    obj.maxSlot6Label:setTop(225);
    obj.maxSlot6Label:setWidth(55);
    obj.maxSlot6Label:setHeight(25);
    obj.maxSlot6Label:setColor("transparent");
    obj.maxSlot6Label:setStrokeColor("Gray");
    obj.maxSlot6Label:setStrokeSize(1);
    obj.maxSlot6Label:setName("maxSlot6Label");
    obj.maxSlot6Label:setVisible(true);
    obj.maxSlot6Label:setCornerType("round");
    obj.maxSlot6Label:setXradius(5);
    obj.maxSlot6Label:setYradius(5);

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.maxSlot6Label);
    obj.label84:setWidth(55);
    obj.label84:setHeight(25);
    obj.label84:setField("maxSlot6");
    obj.label84:setFontSize(16);
    obj.label84:setVertTextAlign("center");
    obj.label84:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label84, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setFontColor("Gray");
    obj.label84:setName("label84");

    obj.maxSlot6Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot6Edit:setParent(obj.rectangle68);
    obj.maxSlot6Edit:setField("maxSlot6");
    obj.maxSlot6Edit:setLeft(118);
    obj.maxSlot6Edit:setTop(225);
    obj.maxSlot6Edit:setWidth(55);
    obj.maxSlot6Edit:setHeight(25);
    obj.maxSlot6Edit:setType("float");
    obj.maxSlot6Edit:setName("maxSlot6Edit");
    obj.maxSlot6Edit:setVisible(false);
    obj.maxSlot6Edit:setFontSize(16);

    obj.usadosSlot6Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot6Label:setParent(obj.rectangle68);
    obj.usadosSlot6Label:setLeft(173);
    obj.usadosSlot6Label:setTop(225);
    obj.usadosSlot6Label:setWidth(55);
    obj.usadosSlot6Label:setHeight(25);
    obj.usadosSlot6Label:setColor("transparent");
    obj.usadosSlot6Label:setStrokeColor("Gray");
    obj.usadosSlot6Label:setStrokeSize(1);
    obj.usadosSlot6Label:setName("usadosSlot6Label");
    obj.usadosSlot6Label:setVisible(true);
    obj.usadosSlot6Label:setCornerType("round");
    obj.usadosSlot6Label:setXradius(5);
    obj.usadosSlot6Label:setYradius(5);

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.usadosSlot6Label);
    obj.label85:setWidth(55);
    obj.label85:setHeight(25);
    obj.label85:setField("usadosSlot6");
    obj.label85:setFontSize(16);
    obj.label85:setVertTextAlign("center");
    obj.label85:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label85, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setFontColor("Gray");
    obj.label85:setName("label85");

    obj.usadosSlot6Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot6Edit:setParent(obj.rectangle68);
    obj.usadosSlot6Edit:setField("usadosSlot6");
    obj.usadosSlot6Edit:setLeft(173);
    obj.usadosSlot6Edit:setTop(225);
    obj.usadosSlot6Edit:setWidth(55);
    obj.usadosSlot6Edit:setHeight(25);
    obj.usadosSlot6Edit:setType("float");
    obj.usadosSlot6Edit:setName("usadosSlot6Edit");
    obj.usadosSlot6Edit:setVisible(false);
    obj.usadosSlot6Edit:setFontSize(16);

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.rectangle68);
    obj.rectangle80:setLeft(63);
    obj.rectangle80:setTop(250);
    obj.rectangle80:setWidth(55);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("transparent");
    obj.rectangle80:setStrokeColor("Gray");
    obj.rectangle80:setStrokeSize(2);
    obj.rectangle80:setCornerType("round");
    obj.rectangle80:setXradius(5);
    obj.rectangle80:setYradius(5);
    obj.rectangle80:setName("rectangle80");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle80);
    obj.label86:setVertTextAlign("center");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setWidth(55);
    obj.label86:setHeight(25);
    obj.label86:setText("7");
    obj.label86:setFontColor("Gray");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setName("label86");

    obj.maxSlot7Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot7Label:setParent(obj.rectangle68);
    obj.maxSlot7Label:setLeft(118);
    obj.maxSlot7Label:setTop(250);
    obj.maxSlot7Label:setWidth(55);
    obj.maxSlot7Label:setHeight(25);
    obj.maxSlot7Label:setColor("transparent");
    obj.maxSlot7Label:setStrokeColor("Gray");
    obj.maxSlot7Label:setStrokeSize(1);
    obj.maxSlot7Label:setName("maxSlot7Label");
    obj.maxSlot7Label:setVisible(true);
    obj.maxSlot7Label:setCornerType("round");
    obj.maxSlot7Label:setXradius(5);
    obj.maxSlot7Label:setYradius(5);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.maxSlot7Label);
    obj.label87:setWidth(55);
    obj.label87:setHeight(25);
    obj.label87:setField("maxSlot7");
    obj.label87:setFontSize(16);
    obj.label87:setVertTextAlign("center");
    obj.label87:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label87, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setFontColor("Gray");
    obj.label87:setName("label87");

    obj.maxSlot7Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot7Edit:setParent(obj.rectangle68);
    obj.maxSlot7Edit:setField("maxSlot7");
    obj.maxSlot7Edit:setLeft(118);
    obj.maxSlot7Edit:setTop(250);
    obj.maxSlot7Edit:setWidth(55);
    obj.maxSlot7Edit:setHeight(25);
    obj.maxSlot7Edit:setType("float");
    obj.maxSlot7Edit:setName("maxSlot7Edit");
    obj.maxSlot7Edit:setVisible(false);
    obj.maxSlot7Edit:setFontSize(16);

    obj.usadosSlot7Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot7Label:setParent(obj.rectangle68);
    obj.usadosSlot7Label:setLeft(173);
    obj.usadosSlot7Label:setTop(250);
    obj.usadosSlot7Label:setWidth(55);
    obj.usadosSlot7Label:setHeight(25);
    obj.usadosSlot7Label:setColor("transparent");
    obj.usadosSlot7Label:setStrokeColor("Gray");
    obj.usadosSlot7Label:setStrokeSize(1);
    obj.usadosSlot7Label:setName("usadosSlot7Label");
    obj.usadosSlot7Label:setVisible(true);
    obj.usadosSlot7Label:setCornerType("round");
    obj.usadosSlot7Label:setXradius(5);
    obj.usadosSlot7Label:setYradius(5);

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.usadosSlot7Label);
    obj.label88:setWidth(55);
    obj.label88:setHeight(25);
    obj.label88:setField("usadosSlot7");
    obj.label88:setFontSize(16);
    obj.label88:setVertTextAlign("center");
    obj.label88:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label88, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setFontColor("Gray");
    obj.label88:setName("label88");

    obj.usadosSlot7Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot7Edit:setParent(obj.rectangle68);
    obj.usadosSlot7Edit:setField("usadosSlot7");
    obj.usadosSlot7Edit:setLeft(173);
    obj.usadosSlot7Edit:setTop(250);
    obj.usadosSlot7Edit:setWidth(55);
    obj.usadosSlot7Edit:setHeight(25);
    obj.usadosSlot7Edit:setType("float");
    obj.usadosSlot7Edit:setName("usadosSlot7Edit");
    obj.usadosSlot7Edit:setVisible(false);
    obj.usadosSlot7Edit:setFontSize(16);

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.rectangle68);
    obj.rectangle81:setLeft(63);
    obj.rectangle81:setTop(275);
    obj.rectangle81:setWidth(55);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("transparent");
    obj.rectangle81:setStrokeColor("Gray");
    obj.rectangle81:setStrokeSize(2);
    obj.rectangle81:setCornerType("round");
    obj.rectangle81:setXradius(5);
    obj.rectangle81:setYradius(5);
    obj.rectangle81:setName("rectangle81");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle81);
    obj.label89:setVertTextAlign("center");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setWidth(55);
    obj.label89:setHeight(25);
    obj.label89:setText("8");
    obj.label89:setFontColor("Gray");
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setName("label89");

    obj.maxSlot8Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot8Label:setParent(obj.rectangle68);
    obj.maxSlot8Label:setLeft(118);
    obj.maxSlot8Label:setTop(275);
    obj.maxSlot8Label:setWidth(55);
    obj.maxSlot8Label:setHeight(25);
    obj.maxSlot8Label:setColor("transparent");
    obj.maxSlot8Label:setStrokeColor("Gray");
    obj.maxSlot8Label:setStrokeSize(1);
    obj.maxSlot8Label:setName("maxSlot8Label");
    obj.maxSlot8Label:setVisible(true);
    obj.maxSlot8Label:setCornerType("round");
    obj.maxSlot8Label:setXradius(5);
    obj.maxSlot8Label:setYradius(5);

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.maxSlot8Label);
    obj.label90:setWidth(55);
    obj.label90:setHeight(25);
    obj.label90:setField("maxSlot8");
    obj.label90:setFontSize(16);
    obj.label90:setVertTextAlign("center");
    obj.label90:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label90, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setFontColor("Gray");
    obj.label90:setName("label90");

    obj.maxSlot8Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot8Edit:setParent(obj.rectangle68);
    obj.maxSlot8Edit:setField("maxSlot8");
    obj.maxSlot8Edit:setLeft(118);
    obj.maxSlot8Edit:setTop(275);
    obj.maxSlot8Edit:setWidth(55);
    obj.maxSlot8Edit:setHeight(25);
    obj.maxSlot8Edit:setType("float");
    obj.maxSlot8Edit:setName("maxSlot8Edit");
    obj.maxSlot8Edit:setVisible(false);
    obj.maxSlot8Edit:setFontSize(16);

    obj.usadosSlot8Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot8Label:setParent(obj.rectangle68);
    obj.usadosSlot8Label:setLeft(173);
    obj.usadosSlot8Label:setTop(275);
    obj.usadosSlot8Label:setWidth(55);
    obj.usadosSlot8Label:setHeight(25);
    obj.usadosSlot8Label:setColor("transparent");
    obj.usadosSlot8Label:setStrokeColor("Gray");
    obj.usadosSlot8Label:setStrokeSize(1);
    obj.usadosSlot8Label:setName("usadosSlot8Label");
    obj.usadosSlot8Label:setVisible(true);
    obj.usadosSlot8Label:setCornerType("round");
    obj.usadosSlot8Label:setXradius(5);
    obj.usadosSlot8Label:setYradius(5);

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.usadosSlot8Label);
    obj.label91:setWidth(55);
    obj.label91:setHeight(25);
    obj.label91:setField("usadosSlot8");
    obj.label91:setFontSize(16);
    obj.label91:setVertTextAlign("center");
    obj.label91:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label91, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label91, "fontStyle",  "bold");
    obj.label91:setFontColor("Gray");
    obj.label91:setName("label91");

    obj.usadosSlot8Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot8Edit:setParent(obj.rectangle68);
    obj.usadosSlot8Edit:setField("usadosSlot8");
    obj.usadosSlot8Edit:setLeft(173);
    obj.usadosSlot8Edit:setTop(275);
    obj.usadosSlot8Edit:setWidth(55);
    obj.usadosSlot8Edit:setHeight(25);
    obj.usadosSlot8Edit:setType("float");
    obj.usadosSlot8Edit:setName("usadosSlot8Edit");
    obj.usadosSlot8Edit:setVisible(false);
    obj.usadosSlot8Edit:setFontSize(16);

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.rectangle68);
    obj.rectangle82:setLeft(63);
    obj.rectangle82:setTop(300);
    obj.rectangle82:setWidth(55);
    obj.rectangle82:setHeight(25);
    obj.rectangle82:setColor("transparent");
    obj.rectangle82:setStrokeColor("Gray");
    obj.rectangle82:setStrokeSize(2);
    obj.rectangle82:setCornerType("round");
    obj.rectangle82:setXradius(5);
    obj.rectangle82:setYradius(5);
    obj.rectangle82:setName("rectangle82");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle82);
    obj.label92:setVertTextAlign("center");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setWidth(55);
    obj.label92:setHeight(25);
    obj.label92:setText("9");
    obj.label92:setFontColor("Gray");
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setName("label92");

    obj.maxSlot9Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot9Label:setParent(obj.rectangle68);
    obj.maxSlot9Label:setLeft(118);
    obj.maxSlot9Label:setTop(300);
    obj.maxSlot9Label:setWidth(55);
    obj.maxSlot9Label:setHeight(25);
    obj.maxSlot9Label:setColor("transparent");
    obj.maxSlot9Label:setStrokeColor("Gray");
    obj.maxSlot9Label:setStrokeSize(1);
    obj.maxSlot9Label:setName("maxSlot9Label");
    obj.maxSlot9Label:setVisible(true);
    obj.maxSlot9Label:setCornerType("round");
    obj.maxSlot9Label:setXradius(5);
    obj.maxSlot9Label:setYradius(5);

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.maxSlot9Label);
    obj.label93:setWidth(55);
    obj.label93:setHeight(25);
    obj.label93:setField("maxSlot9");
    obj.label93:setFontSize(16);
    obj.label93:setVertTextAlign("center");
    obj.label93:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label93, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setFontColor("Gray");
    obj.label93:setName("label93");

    obj.maxSlot9Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot9Edit:setParent(obj.rectangle68);
    obj.maxSlot9Edit:setField("maxSlot9");
    obj.maxSlot9Edit:setLeft(118);
    obj.maxSlot9Edit:setTop(300);
    obj.maxSlot9Edit:setWidth(55);
    obj.maxSlot9Edit:setHeight(25);
    obj.maxSlot9Edit:setType("float");
    obj.maxSlot9Edit:setName("maxSlot9Edit");
    obj.maxSlot9Edit:setVisible(false);
    obj.maxSlot9Edit:setFontSize(16);

    obj.usadosSlot9Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot9Label:setParent(obj.rectangle68);
    obj.usadosSlot9Label:setLeft(173);
    obj.usadosSlot9Label:setTop(300);
    obj.usadosSlot9Label:setWidth(55);
    obj.usadosSlot9Label:setHeight(25);
    obj.usadosSlot9Label:setColor("transparent");
    obj.usadosSlot9Label:setStrokeColor("Gray");
    obj.usadosSlot9Label:setStrokeSize(1);
    obj.usadosSlot9Label:setName("usadosSlot9Label");
    obj.usadosSlot9Label:setVisible(true);
    obj.usadosSlot9Label:setCornerType("round");
    obj.usadosSlot9Label:setXradius(5);
    obj.usadosSlot9Label:setYradius(5);

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.usadosSlot9Label);
    obj.label94:setWidth(55);
    obj.label94:setHeight(25);
    obj.label94:setField("usadosSlot9");
    obj.label94:setFontSize(16);
    obj.label94:setVertTextAlign("center");
    obj.label94:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label94, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setFontColor("Gray");
    obj.label94:setName("label94");

    obj.usadosSlot9Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot9Edit:setParent(obj.rectangle68);
    obj.usadosSlot9Edit:setField("usadosSlot9");
    obj.usadosSlot9Edit:setLeft(173);
    obj.usadosSlot9Edit:setTop(300);
    obj.usadosSlot9Edit:setWidth(55);
    obj.usadosSlot9Edit:setHeight(25);
    obj.usadosSlot9Edit:setType("float");
    obj.usadosSlot9Edit:setName("usadosSlot9Edit");
    obj.usadosSlot9Edit:setVisible(false);
    obj.usadosSlot9Edit:setFontSize(16);

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.rectangle68);
    obj.rectangle83:setLeft(63);
    obj.rectangle83:setTop(325);
    obj.rectangle83:setWidth(55);
    obj.rectangle83:setHeight(25);
    obj.rectangle83:setColor("transparent");
    obj.rectangle83:setStrokeColor("Gray");
    obj.rectangle83:setStrokeSize(2);
    obj.rectangle83:setCornerType("round");
    obj.rectangle83:setXradius(5);
    obj.rectangle83:setYradius(5);
    obj.rectangle83:setName("rectangle83");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle83);
    obj.label95:setVertTextAlign("center");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setWidth(55);
    obj.label95:setHeight(25);
    obj.label95:setText("10");
    obj.label95:setFontColor("Gray");
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setName("label95");

    obj.maxSlot10Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.maxSlot10Label:setParent(obj.rectangle68);
    obj.maxSlot10Label:setLeft(118);
    obj.maxSlot10Label:setTop(325);
    obj.maxSlot10Label:setWidth(55);
    obj.maxSlot10Label:setHeight(25);
    obj.maxSlot10Label:setColor("transparent");
    obj.maxSlot10Label:setStrokeColor("Gray");
    obj.maxSlot10Label:setStrokeSize(1);
    obj.maxSlot10Label:setName("maxSlot10Label");
    obj.maxSlot10Label:setVisible(true);
    obj.maxSlot10Label:setCornerType("round");
    obj.maxSlot10Label:setXradius(5);
    obj.maxSlot10Label:setYradius(5);

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.maxSlot10Label);
    obj.label96:setWidth(55);
    obj.label96:setHeight(25);
    obj.label96:setField("maxSlot10");
    obj.label96:setFontSize(16);
    obj.label96:setVertTextAlign("center");
    obj.label96:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label96, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setFontColor("Gray");
    obj.label96:setName("label96");

    obj.maxSlot10Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxSlot10Edit:setParent(obj.rectangle68);
    obj.maxSlot10Edit:setField("maxSlot10");
    obj.maxSlot10Edit:setLeft(118);
    obj.maxSlot10Edit:setTop(325);
    obj.maxSlot10Edit:setWidth(55);
    obj.maxSlot10Edit:setHeight(25);
    obj.maxSlot10Edit:setType("float");
    obj.maxSlot10Edit:setName("maxSlot10Edit");
    obj.maxSlot10Edit:setVisible(false);
    obj.maxSlot10Edit:setFontSize(16);

    obj.usadosSlot10Label = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.usadosSlot10Label:setParent(obj.rectangle68);
    obj.usadosSlot10Label:setLeft(173);
    obj.usadosSlot10Label:setTop(325);
    obj.usadosSlot10Label:setWidth(55);
    obj.usadosSlot10Label:setHeight(25);
    obj.usadosSlot10Label:setColor("transparent");
    obj.usadosSlot10Label:setStrokeColor("Gray");
    obj.usadosSlot10Label:setStrokeSize(1);
    obj.usadosSlot10Label:setName("usadosSlot10Label");
    obj.usadosSlot10Label:setVisible(true);
    obj.usadosSlot10Label:setCornerType("round");
    obj.usadosSlot10Label:setXradius(5);
    obj.usadosSlot10Label:setYradius(5);

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.usadosSlot10Label);
    obj.label97:setWidth(55);
    obj.label97:setHeight(25);
    obj.label97:setField("usadosSlot10");
    obj.label97:setFontSize(16);
    obj.label97:setVertTextAlign("center");
    obj.label97:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label97, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setFontColor("Gray");
    obj.label97:setName("label97");

    obj.usadosSlot10Edit = GUI.fromHandle(_obj_newObject("edit"));
    obj.usadosSlot10Edit:setParent(obj.rectangle68);
    obj.usadosSlot10Edit:setField("usadosSlot10");
    obj.usadosSlot10Edit:setLeft(173);
    obj.usadosSlot10Edit:setTop(325);
    obj.usadosSlot10Edit:setWidth(55);
    obj.usadosSlot10Edit:setHeight(25);
    obj.usadosSlot10Edit:setType("float");
    obj.usadosSlot10Edit:setName("usadosSlot10Edit");
    obj.usadosSlot10Edit:setVisible(false);
    obj.usadosSlot10Edit:setFontSize(16);

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.popMagias);
    obj.rectangle84:setLeft(542);
    obj.rectangle84:setTop(5);
    obj.rectangle84:setWidth(200);
    obj.rectangle84:setName("rectangle84");
    obj.rectangle84:setHeight(25);
    obj.rectangle84:setColor("transparent");
    obj.rectangle84:setStrokeColor("Gray");
    obj.rectangle84:setStrokeSize(2);
    obj.rectangle84:setCornerType("innerRound");
    obj.rectangle84:setXradius(5);
    obj.rectangle84:setYradius(5);

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle84);
    obj.label98:setWidth(200);
    obj.label98:setHeight(25);
    obj.label98:setText("Magias Conhecidas");
    obj.label98:setVertTextAlign("center");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setFontSize(16);
    obj.label98:setFontColor("Gray");
    obj.label98:setFontFamily("Stencil");
    obj.label98:setName("label98");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.popMagias);
    obj.rectangle85:setLeft(314);
    obj.rectangle85:setTop(30);
    obj.rectangle85:setWidth(655);
    obj.rectangle85:setHeight(506);
    obj.rectangle85:setColor("transparent");
    obj.rectangle85:setStrokeColor("Gray");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setCornerType("round");
    obj.rectangle85:setXradius(10);
    obj.rectangle85:setYradius(10);
    obj.rectangle85:setName("rectangle85");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.rectangle85);
    obj.rectangle86:setLeft(65);
    obj.rectangle86:setTop(10);
    obj.rectangle86:setWidth(200);
    obj.rectangle86:setName("rectangle86");
    obj.rectangle86:setHeight(25);
    obj.rectangle86:setColor("transparent");
    obj.rectangle86:setStrokeColor("Gray");
    obj.rectangle86:setStrokeSize(2);
    obj.rectangle86:setCornerType("innerRound");
    obj.rectangle86:setXradius(5);
    obj.rectangle86:setYradius(5);

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle86);
    obj.label99:setWidth(200);
    obj.label99:setHeight(25);
    obj.label99:setText("Truques Mágicos");
    obj.label99:setVertTextAlign("center");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setFontSize(16);
    obj.label99:setFontColor("Gray");
    obj.label99:setFontFamily("Stencil");
    obj.label99:setName("label99");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.rectangle85);
    obj.rectangle87:setLeft(25);
    obj.rectangle87:setTop(35);
    obj.rectangle87:setWidth(290);
    obj.rectangle87:setHeight(203);
    obj.rectangle87:setColor("transparent");
    obj.rectangle87:setStrokeColor("Gray");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setCornerType("round");
    obj.rectangle87:setXradius(10);
    obj.rectangle87:setYradius(10);
    obj.rectangle87:setName("rectangle87");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.rectangle87);
    obj.rectangle88:setLeft(0);
    obj.rectangle88:setWidth(55);
    obj.rectangle88:setTop(0);
    obj.rectangle88:setName("rectangle88");
    obj.rectangle88:setHeight(25);
    obj.rectangle88:setColor("transparent");
    obj.rectangle88:setStrokeColor("Gray");
    obj.rectangle88:setStrokeSize(2);
    obj.rectangle88:setCornerType("round");
    obj.rectangle88:setXradius(5);
    obj.rectangle88:setYradius(5);

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.rectangle88);
    obj.label100:setVertTextAlign("center");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setWidth(55);
    obj.label100:setHeight(25);
    obj.label100:setText("Nível");
    obj.label100:setFontColor("Gray");
    obj.label100:setFontFamily("Stencil");
    obj.label100:setName("label100");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.rectangle87);
    obj.rectangle89:setLeft(55);
    obj.rectangle89:setWidth(212);
    obj.rectangle89:setTop(0);
    obj.rectangle89:setName("rectangle89");
    obj.rectangle89:setHeight(25);
    obj.rectangle89:setColor("transparent");
    obj.rectangle89:setStrokeColor("Gray");
    obj.rectangle89:setStrokeSize(2);
    obj.rectangle89:setCornerType("round");
    obj.rectangle89:setXradius(5);
    obj.rectangle89:setYradius(5);

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.rectangle89);
    obj.label101:setVertTextAlign("center");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setWidth(212);
    obj.label101:setHeight(25);
    obj.label101:setText("Nome");
    obj.label101:setFontColor("Gray");
    obj.label101:setFontFamily("Stencil");
    obj.label101:setName("label101");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle87);
    obj.button9:setLeft(267);
    obj.button9:setTop(1);
    obj.button9:setWidth(23);
    obj.button9:setHeight(23);
    obj.button9:setText("+");
    obj.button9:setName("button9");

    obj.rclTruquesMagicos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTruquesMagicos:setParent(obj.rectangle87);
    obj.rclTruquesMagicos:setLeft(0);
    obj.rclTruquesMagicos:setTop(25);
    obj.rclTruquesMagicos:setName("rclTruquesMagicos");
    obj.rclTruquesMagicos:setField("campoTruquesMagicos");
    obj.rclTruquesMagicos:setTemplateForm("frmMagiasConhecidas");
    obj.rclTruquesMagicos:setWidth(308);
    obj.rclTruquesMagicos:setHeight(175);
    obj.rclTruquesMagicos:setLayout("vertical");
    obj.rclTruquesMagicos:setMinQt(0);

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.rectangle85);
    obj.rectangle90:setLeft(385);
    obj.rectangle90:setTop(10);
    obj.rectangle90:setWidth(200);
    obj.rectangle90:setName("rectangle90");
    obj.rectangle90:setHeight(25);
    obj.rectangle90:setColor("transparent");
    obj.rectangle90:setStrokeColor("Gray");
    obj.rectangle90:setStrokeSize(2);
    obj.rectangle90:setCornerType("innerRound");
    obj.rectangle90:setXradius(5);
    obj.rectangle90:setYradius(5);

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.rectangle90);
    obj.label102:setWidth(200);
    obj.label102:setHeight(25);
    obj.label102:setText("Magias Inatas");
    obj.label102:setVertTextAlign("center");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setFontSize(16);
    obj.label102:setFontColor("Gray");
    obj.label102:setFontFamily("Stencil");
    obj.label102:setName("label102");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.rectangle85);
    obj.rectangle91:setLeft(340);
    obj.rectangle91:setTop(35);
    obj.rectangle91:setWidth(290);
    obj.rectangle91:setHeight(203);
    obj.rectangle91:setColor("transparent");
    obj.rectangle91:setStrokeColor("Gray");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setCornerType("round");
    obj.rectangle91:setXradius(10);
    obj.rectangle91:setYradius(10);
    obj.rectangle91:setName("rectangle91");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.rectangle91);
    obj.rectangle92:setLeft(0);
    obj.rectangle92:setWidth(55);
    obj.rectangle92:setTop(0);
    obj.rectangle92:setName("rectangle92");
    obj.rectangle92:setHeight(25);
    obj.rectangle92:setColor("transparent");
    obj.rectangle92:setStrokeColor("Gray");
    obj.rectangle92:setStrokeSize(2);
    obj.rectangle92:setCornerType("round");
    obj.rectangle92:setXradius(5);
    obj.rectangle92:setYradius(5);

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.rectangle92);
    obj.label103:setVertTextAlign("center");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setWidth(55);
    obj.label103:setHeight(25);
    obj.label103:setText("Nível");
    obj.label103:setFontColor("Gray");
    obj.label103:setFontFamily("Stencil");
    obj.label103:setName("label103");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.rectangle91);
    obj.rectangle93:setLeft(55);
    obj.rectangle93:setWidth(212);
    obj.rectangle93:setTop(0);
    obj.rectangle93:setName("rectangle93");
    obj.rectangle93:setHeight(25);
    obj.rectangle93:setColor("transparent");
    obj.rectangle93:setStrokeColor("Gray");
    obj.rectangle93:setStrokeSize(2);
    obj.rectangle93:setCornerType("round");
    obj.rectangle93:setXradius(5);
    obj.rectangle93:setYradius(5);

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.rectangle93);
    obj.label104:setVertTextAlign("center");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setWidth(212);
    obj.label104:setHeight(25);
    obj.label104:setText("Nome");
    obj.label104:setFontColor("Gray");
    obj.label104:setFontFamily("Stencil");
    obj.label104:setName("label104");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle91);
    obj.button10:setLeft(267);
    obj.button10:setTop(1);
    obj.button10:setWidth(23);
    obj.button10:setHeight(23);
    obj.button10:setText("+");
    obj.button10:setName("button10");

    obj.rclMagiasInatas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagiasInatas:setParent(obj.rectangle91);
    obj.rclMagiasInatas:setLeft(0);
    obj.rclMagiasInatas:setTop(25);
    obj.rclMagiasInatas:setName("rclMagiasInatas");
    obj.rclMagiasInatas:setField("campoMagiasInatas");
    obj.rclMagiasInatas:setTemplateForm("frmMagiasConhecidas");
    obj.rclMagiasInatas:setWidth(308);
    obj.rclMagiasInatas:setHeight(175);
    obj.rclMagiasInatas:setLayout("vertical");
    obj.rclMagiasInatas:setMinQt(0);

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.rectangle85);
    obj.rectangle94:setLeft(65);
    obj.rectangle94:setTop(268);
    obj.rectangle94:setWidth(200);
    obj.rectangle94:setName("rectangle94");
    obj.rectangle94:setHeight(25);
    obj.rectangle94:setColor("transparent");
    obj.rectangle94:setStrokeColor("Gray");
    obj.rectangle94:setStrokeSize(2);
    obj.rectangle94:setCornerType("innerRound");
    obj.rectangle94:setXradius(5);
    obj.rectangle94:setYradius(5);

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.rectangle94);
    obj.label105:setWidth(200);
    obj.label105:setHeight(25);
    obj.label105:setText("Magias de Foco");
    obj.label105:setVertTextAlign("center");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setFontSize(16);
    obj.label105:setFontColor("Gray");
    obj.label105:setFontFamily("Stencil");
    obj.label105:setName("label105");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.rectangle85);
    obj.rectangle95:setLeft(25);
    obj.rectangle95:setTop(293);
    obj.rectangle95:setWidth(290);
    obj.rectangle95:setHeight(203);
    obj.rectangle95:setColor("transparent");
    obj.rectangle95:setStrokeColor("Gray");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setCornerType("round");
    obj.rectangle95:setXradius(10);
    obj.rectangle95:setYradius(10);
    obj.rectangle95:setName("rectangle95");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.rectangle95);
    obj.rectangle96:setLeft(0);
    obj.rectangle96:setWidth(55);
    obj.rectangle96:setTop(0);
    obj.rectangle96:setName("rectangle96");
    obj.rectangle96:setHeight(25);
    obj.rectangle96:setColor("transparent");
    obj.rectangle96:setStrokeColor("Gray");
    obj.rectangle96:setStrokeSize(2);
    obj.rectangle96:setCornerType("round");
    obj.rectangle96:setXradius(5);
    obj.rectangle96:setYradius(5);

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.rectangle96);
    obj.label106:setVertTextAlign("center");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setWidth(55);
    obj.label106:setHeight(25);
    obj.label106:setText("Nível");
    obj.label106:setFontColor("Gray");
    obj.label106:setFontFamily("Stencil");
    obj.label106:setName("label106");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.rectangle95);
    obj.rectangle97:setLeft(55);
    obj.rectangle97:setWidth(212);
    obj.rectangle97:setTop(0);
    obj.rectangle97:setName("rectangle97");
    obj.rectangle97:setHeight(25);
    obj.rectangle97:setColor("transparent");
    obj.rectangle97:setStrokeColor("Gray");
    obj.rectangle97:setStrokeSize(2);
    obj.rectangle97:setCornerType("round");
    obj.rectangle97:setXradius(5);
    obj.rectangle97:setYradius(5);

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle97);
    obj.label107:setVertTextAlign("center");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setWidth(212);
    obj.label107:setHeight(25);
    obj.label107:setText("Nome");
    obj.label107:setFontColor("Gray");
    obj.label107:setFontFamily("Stencil");
    obj.label107:setName("label107");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle95);
    obj.button11:setLeft(267);
    obj.button11:setTop(1);
    obj.button11:setWidth(23);
    obj.button11:setHeight(23);
    obj.button11:setText("+");
    obj.button11:setName("button11");

    obj.rclMagiasFoco = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagiasFoco:setParent(obj.rectangle95);
    obj.rclMagiasFoco:setLeft(0);
    obj.rclMagiasFoco:setTop(25);
    obj.rclMagiasFoco:setName("rclMagiasFoco");
    obj.rclMagiasFoco:setField("campoMagiasFoco");
    obj.rclMagiasFoco:setTemplateForm("frmMagiasConhecidas");
    obj.rclMagiasFoco:setWidth(308);
    obj.rclMagiasFoco:setHeight(175);
    obj.rclMagiasFoco:setLayout("vertical");
    obj.rclMagiasFoco:setMinQt(0);

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.rectangle85);
    obj.rectangle98:setLeft(385);
    obj.rectangle98:setTop(268);
    obj.rectangle98:setWidth(200);
    obj.rectangle98:setName("rectangle98");
    obj.rectangle98:setHeight(25);
    obj.rectangle98:setColor("transparent");
    obj.rectangle98:setStrokeColor("Gray");
    obj.rectangle98:setStrokeSize(2);
    obj.rectangle98:setCornerType("innerRound");
    obj.rectangle98:setXradius(5);
    obj.rectangle98:setYradius(5);

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.rectangle98);
    obj.label108:setWidth(200);
    obj.label108:setHeight(25);
    obj.label108:setText("Magias");
    obj.label108:setVertTextAlign("center");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setFontSize(16);
    obj.label108:setFontColor("Gray");
    obj.label108:setFontFamily("Stencil");
    obj.label108:setName("label108");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.rectangle85);
    obj.rectangle99:setLeft(340);
    obj.rectangle99:setTop(293);
    obj.rectangle99:setWidth(290);
    obj.rectangle99:setHeight(203);
    obj.rectangle99:setColor("transparent");
    obj.rectangle99:setStrokeColor("Gray");
    obj.rectangle99:setStrokeSize(1);
    obj.rectangle99:setCornerType("round");
    obj.rectangle99:setXradius(10);
    obj.rectangle99:setYradius(10);
    obj.rectangle99:setName("rectangle99");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.rectangle99);
    obj.rectangle100:setLeft(0);
    obj.rectangle100:setWidth(55);
    obj.rectangle100:setTop(0);
    obj.rectangle100:setName("rectangle100");
    obj.rectangle100:setHeight(25);
    obj.rectangle100:setColor("transparent");
    obj.rectangle100:setStrokeColor("Gray");
    obj.rectangle100:setStrokeSize(2);
    obj.rectangle100:setCornerType("round");
    obj.rectangle100:setXradius(5);
    obj.rectangle100:setYradius(5);

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.rectangle100);
    obj.label109:setVertTextAlign("center");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setWidth(55);
    obj.label109:setHeight(25);
    obj.label109:setText("Nível");
    obj.label109:setFontColor("Gray");
    obj.label109:setFontFamily("Stencil");
    obj.label109:setName("label109");

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.rectangle99);
    obj.rectangle101:setLeft(55);
    obj.rectangle101:setWidth(212);
    obj.rectangle101:setTop(0);
    obj.rectangle101:setName("rectangle101");
    obj.rectangle101:setHeight(25);
    obj.rectangle101:setColor("transparent");
    obj.rectangle101:setStrokeColor("Gray");
    obj.rectangle101:setStrokeSize(2);
    obj.rectangle101:setCornerType("round");
    obj.rectangle101:setXradius(5);
    obj.rectangle101:setYradius(5);

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.rectangle101);
    obj.label110:setVertTextAlign("center");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setWidth(212);
    obj.label110:setHeight(25);
    obj.label110:setText("Nome");
    obj.label110:setFontColor("Gray");
    obj.label110:setFontFamily("Stencil");
    obj.label110:setName("label110");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle99);
    obj.button12:setLeft(267);
    obj.button12:setTop(1);
    obj.button12:setWidth(23);
    obj.button12:setHeight(23);
    obj.button12:setText("+");
    obj.button12:setName("button12");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.rectangle99);
    obj.rclMagias:setLeft(0);
    obj.rclMagias:setTop(25);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("campoMagias");
    obj.rclMagias:setTemplateForm("frmMagiasConhecidas");
    obj.rclMagias:setWidth(308);
    obj.rclMagias:setHeight(175);
    obj.rclMagias:setLayout("vertical");
    obj.rclMagias:setMinQt(0);

    obj.popInfoMagia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popInfoMagia:setParent(obj.rectangle85);
    obj.popInfoMagia:setName("popInfoMagia");
    obj.popInfoMagia:setWidth(400);
    obj.popInfoMagia:setHeight(350);

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.popInfoMagia);
    obj.image9:setAlign("client");
    obj.image9:setStyle("stretch");
    obj.image9:setSRC("/imagens/Fundo 1.jpg");
    obj.image9:setOpacity(1);
    obj.image9:setName("image9");

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.popInfoMagia);
    obj.rectangle102:setLeft(135);
    obj.rectangle102:setTop(10);
    obj.rectangle102:setName("rectangle102");
    obj.rectangle102:setWidth(131);
    obj.rectangle102:setHeight(25);
    obj.rectangle102:setColor("transparent");
    obj.rectangle102:setStrokeColor("Gray");
    obj.rectangle102:setStrokeSize(2);
    obj.rectangle102:setCornerType("innerRound");
    obj.rectangle102:setXradius(5);
    obj.rectangle102:setYradius(5);

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle102);
    obj.label111:setVertTextAlign("center");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setWidth(131);
    obj.label111:setHeight(25);
    obj.label111:setText("Ações");
    obj.label111:setFontSize(16);
    obj.label111:setFontColor("Gray");
    obj.label111:setFontFamily("Stencil");
    obj.label111:setName("label111");

    obj.magiaAcaoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.magiaAcaoLabel:setParent(obj.popInfoMagia);
    obj.magiaAcaoLabel:setLeft(10);
    obj.magiaAcaoLabel:setTop(35);
    obj.magiaAcaoLabel:setWidth(380);
    obj.magiaAcaoLabel:setHeight(25);
    obj.magiaAcaoLabel:setColor("transparent");
    obj.magiaAcaoLabel:setStrokeColor("Gray");
    obj.magiaAcaoLabel:setStrokeSize(1);
    obj.magiaAcaoLabel:setName("magiaAcaoLabel");
    obj.magiaAcaoLabel:setVisible(true);
    obj.magiaAcaoLabel:setCornerType("round");
    obj.magiaAcaoLabel:setXradius(5);
    obj.magiaAcaoLabel:setYradius(5);

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.magiaAcaoLabel);
    obj.label112:setWidth(380);
    obj.label112:setHeight(25);
    obj.label112:setField("magiaAcao");
    obj.label112:setFontSize(16);
    obj.label112:setVertTextAlign("center");
    obj.label112:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label112, "fontStyle",  "bold");
    obj.label112:setFontColor("Gray");
    obj.label112:setName("label112");

    obj.magiaAcaoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.magiaAcaoEdit:setParent(obj.popInfoMagia);
    obj.magiaAcaoEdit:setField("magiaAcao");
    obj.magiaAcaoEdit:setLeft(10);
    obj.magiaAcaoEdit:setTop(35);
    obj.magiaAcaoEdit:setWidth(380);
    obj.magiaAcaoEdit:setHeight(25);
    obj.magiaAcaoEdit:setName("magiaAcaoEdit");
    obj.magiaAcaoEdit:setVisible(false);
    obj.magiaAcaoEdit:setFontSize(16);

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.popInfoMagia);
    obj.rectangle103:setLeft(50);
    obj.rectangle103:setTop(70);
    obj.rectangle103:setWidth(55);
    obj.rectangle103:setHeight(25);
    obj.rectangle103:setColor("transparent");
    obj.rectangle103:setStrokeColor("Gray");
    obj.rectangle103:setStrokeSize(2);
    obj.rectangle103:setCornerType("bevel");
    obj.rectangle103:setXradius(5);
    obj.rectangle103:setYradius(5);
    obj.rectangle103:setName("rectangle103");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle103);
    obj.label113:setVertTextAlign("center");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setWidth(55);
    obj.label113:setHeight(25);
    obj.label113:setText("M");
    obj.label113:setFontColor("Gray");
    obj.label113:setFontFamily("Stencil");
    obj.label113:setName("label113");

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.popInfoMagia);
    obj.rectangle104:setLeft(95);
    obj.rectangle104:setTop(67);
    obj.rectangle104:setWidth(32);
    obj.rectangle104:setHeight(32);
    obj.rectangle104:setColor("Gray");
    obj.rectangle104:setCornerType("round");
    obj.rectangle104:setXradius(15);
    obj.rectangle104:setYradius(15);
    obj.rectangle104:setName("rectangle104");

    obj.imageCheckBox7 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox7:setParent(obj.rectangle104);
    obj.imageCheckBox7:setLeft(3);
    obj.imageCheckBox7:setTop(3);
    obj.imageCheckBox7:setField("material");
    obj.imageCheckBox7:setWidth(25);
    obj.imageCheckBox7:setHeight(25);
    obj.imageCheckBox7:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox7:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox7:setName("imageCheckBox7");

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.popInfoMagia);
    obj.rectangle105:setLeft(162);
    obj.rectangle105:setTop(70);
    obj.rectangle105:setWidth(55);
    obj.rectangle105:setHeight(25);
    obj.rectangle105:setColor("transparent");
    obj.rectangle105:setStrokeColor("Gray");
    obj.rectangle105:setStrokeSize(2);
    obj.rectangle105:setCornerType("bevel");
    obj.rectangle105:setXradius(5);
    obj.rectangle105:setYradius(5);
    obj.rectangle105:setName("rectangle105");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle105);
    obj.label114:setVertTextAlign("center");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setWidth(55);
    obj.label114:setHeight(25);
    obj.label114:setText("S");
    obj.label114:setFontColor("Gray");
    obj.label114:setFontFamily("Stencil");
    obj.label114:setName("label114");

    obj.rectangle106 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.popInfoMagia);
    obj.rectangle106:setLeft(207);
    obj.rectangle106:setTop(67);
    obj.rectangle106:setWidth(32);
    obj.rectangle106:setHeight(32);
    obj.rectangle106:setColor("Gray");
    obj.rectangle106:setCornerType("round");
    obj.rectangle106:setXradius(15);
    obj.rectangle106:setYradius(15);
    obj.rectangle106:setName("rectangle106");

    obj.imageCheckBox8 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox8:setParent(obj.rectangle106);
    obj.imageCheckBox8:setLeft(3);
    obj.imageCheckBox8:setTop(3);
    obj.imageCheckBox8:setField("somatico");
    obj.imageCheckBox8:setWidth(25);
    obj.imageCheckBox8:setHeight(25);
    obj.imageCheckBox8:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox8:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox8:setName("imageCheckBox8");

    obj.rectangle107 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.popInfoMagia);
    obj.rectangle107:setLeft(274);
    obj.rectangle107:setTop(70);
    obj.rectangle107:setWidth(55);
    obj.rectangle107:setHeight(25);
    obj.rectangle107:setColor("transparent");
    obj.rectangle107:setStrokeColor("Gray");
    obj.rectangle107:setStrokeSize(2);
    obj.rectangle107:setCornerType("bevel");
    obj.rectangle107:setXradius(5);
    obj.rectangle107:setYradius(5);
    obj.rectangle107:setName("rectangle107");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.rectangle107);
    obj.label115:setVertTextAlign("center");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setWidth(55);
    obj.label115:setHeight(25);
    obj.label115:setText("V");
    obj.label115:setFontColor("Gray");
    obj.label115:setFontFamily("Stencil");
    obj.label115:setName("label115");

    obj.rectangle108 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.popInfoMagia);
    obj.rectangle108:setLeft(319);
    obj.rectangle108:setTop(67);
    obj.rectangle108:setWidth(32);
    obj.rectangle108:setHeight(32);
    obj.rectangle108:setColor("Gray");
    obj.rectangle108:setCornerType("round");
    obj.rectangle108:setXradius(15);
    obj.rectangle108:setYradius(15);
    obj.rectangle108:setName("rectangle108");

    obj.imageCheckBox9 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox9:setParent(obj.rectangle108);
    obj.imageCheckBox9:setLeft(3);
    obj.imageCheckBox9:setTop(3);
    obj.imageCheckBox9:setField("verbal");
    obj.imageCheckBox9:setWidth(25);
    obj.imageCheckBox9:setHeight(25);
    obj.imageCheckBox9:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox9:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox9:setName("imageCheckBox9");

    obj.rectangle109 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.popInfoMagia);
    obj.rectangle109:setLeft(135);
    obj.rectangle109:setTop(110);
    obj.rectangle109:setName("rectangle109");
    obj.rectangle109:setWidth(131);
    obj.rectangle109:setHeight(25);
    obj.rectangle109:setColor("transparent");
    obj.rectangle109:setStrokeColor("Gray");
    obj.rectangle109:setStrokeSize(2);
    obj.rectangle109:setCornerType("innerRound");
    obj.rectangle109:setXradius(5);
    obj.rectangle109:setYradius(5);

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle109);
    obj.label116:setWidth(131);
    obj.label116:setHeight(25);
    obj.label116:setText("Descrição");
    obj.label116:setVertTextAlign("center");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setFontSize(16);
    obj.label116:setFontColor("Gray");
    obj.label116:setFontFamily("Stencil");
    obj.label116:setName("label116");

    obj.magiaDescLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.magiaDescLabel:setParent(obj.popInfoMagia);
    obj.magiaDescLabel:setLeft(10);
    obj.magiaDescLabel:setTop(135);
    obj.magiaDescLabel:setWidth(380);
    obj.magiaDescLabel:setHeight(205);
    obj.magiaDescLabel:setColor("transparent");
    obj.magiaDescLabel:setStrokeColor("Gray");
    obj.magiaDescLabel:setStrokeSize(1);
    obj.magiaDescLabel:setName("magiaDescLabel");
    obj.magiaDescLabel:setVisible(true);
    obj.magiaDescLabel:setCornerType("round");
    obj.magiaDescLabel:setXradius(10);
    obj.magiaDescLabel:setYradius(10);
    obj.magiaDescLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.magiaDescLabel);
    obj.label117:setAlign("client");
    obj.label117:setField("magiaDesc");
    lfm_setPropAsString(obj.label117, "fontStyle",  "bold");
    obj.label117:setFontSize(16);
    obj.label117:setHorzTextAlign("leading");
    obj.label117:setVertTextAlign("leading");
    obj.label117:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label117:setFontColor("Gray");
    obj.label117:setName("label117");

    obj.magiaDescEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.magiaDescEdit:setParent(obj.popInfoMagia);
    obj.magiaDescEdit:setField("magiaDesc");
    obj.magiaDescEdit:setLeft(10);
    obj.magiaDescEdit:setTop(135);
    obj.magiaDescEdit:setWidth(380);
    obj.magiaDescEdit:setHeight(205);
    obj.magiaDescEdit:setName("magiaDescEdit");
    obj.magiaDescEdit:setVisible(false);
    obj.magiaDescEdit:setFontSize(16);
    obj.magiaDescEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.rectangle110 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.popMagias);
    obj.rectangle110:setLeft(1035);
    obj.rectangle110:setTop(5);
    obj.rectangle110:setWidth(200);
    obj.rectangle110:setName("rectangle110");
    obj.rectangle110:setHeight(25);
    obj.rectangle110:setColor("transparent");
    obj.rectangle110:setStrokeColor("Gray");
    obj.rectangle110:setStrokeSize(2);
    obj.rectangle110:setCornerType("innerRound");
    obj.rectangle110:setXradius(5);
    obj.rectangle110:setYradius(5);

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle110);
    obj.label118:setWidth(200);
    obj.label118:setHeight(25);
    obj.label118:setText("Magias Preparadas");
    obj.label118:setVertTextAlign("center");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setFontSize(16);
    obj.label118:setFontColor("Gray");
    obj.label118:setFontFamily("Stencil");
    obj.label118:setName("label118");

    obj.rectangle111 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.popMagias);
    obj.rectangle111:setLeft(990);
    obj.rectangle111:setTop(30);
    obj.rectangle111:setWidth(290);
    obj.rectangle111:setHeight(506);
    obj.rectangle111:setColor("transparent");
    obj.rectangle111:setStrokeColor("Gray");
    obj.rectangle111:setStrokeSize(1);
    obj.rectangle111:setCornerType("round");
    obj.rectangle111:setXradius(10);
    obj.rectangle111:setYradius(10);
    obj.rectangle111:setName("rectangle111");

    obj.rectangle112 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.rectangle111);
    obj.rectangle112:setLeft(0);
    obj.rectangle112:setWidth(157);
    obj.rectangle112:setTop(0);
    obj.rectangle112:setName("rectangle112");
    obj.rectangle112:setHeight(25);
    obj.rectangle112:setColor("transparent");
    obj.rectangle112:setStrokeColor("Gray");
    obj.rectangle112:setStrokeSize(2);
    obj.rectangle112:setCornerType("round");
    obj.rectangle112:setXradius(5);
    obj.rectangle112:setYradius(5);

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle112);
    obj.label119:setVertTextAlign("center");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setWidth(157);
    obj.label119:setHeight(25);
    obj.label119:setText("Nome");
    obj.label119:setFontColor("Gray");
    obj.label119:setFontFamily("Stencil");
    obj.label119:setName("label119");

    obj.rectangle113 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.rectangle111);
    obj.rectangle113:setLeft(157);
    obj.rectangle113:setWidth(55);
    obj.rectangle113:setTop(0);
    obj.rectangle113:setName("rectangle113");
    obj.rectangle113:setHeight(25);
    obj.rectangle113:setColor("transparent");
    obj.rectangle113:setStrokeColor("Gray");
    obj.rectangle113:setStrokeSize(2);
    obj.rectangle113:setCornerType("round");
    obj.rectangle113:setXradius(5);
    obj.rectangle113:setYradius(5);

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle113);
    obj.label120:setVertTextAlign("center");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setWidth(55);
    obj.label120:setHeight(25);
    obj.label120:setText("Nível");
    obj.label120:setFontColor("Gray");
    obj.label120:setFontFamily("Stencil");
    obj.label120:setName("label120");

    obj.rectangle114 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.rectangle111);
    obj.rectangle114:setLeft(212);
    obj.rectangle114:setWidth(55);
    obj.rectangle114:setTop(0);
    obj.rectangle114:setName("rectangle114");
    obj.rectangle114:setHeight(25);
    obj.rectangle114:setColor("transparent");
    obj.rectangle114:setStrokeColor("Gray");
    obj.rectangle114:setStrokeSize(2);
    obj.rectangle114:setCornerType("round");
    obj.rectangle114:setXradius(5);
    obj.rectangle114:setYradius(5);

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle114);
    obj.label121:setVertTextAlign("center");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setWidth(55);
    obj.label121:setHeight(25);
    obj.label121:setText("Slots");
    obj.label121:setFontColor("Gray");
    obj.label121:setFontFamily("Stencil");
    obj.label121:setName("label121");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle111);
    obj.button13:setLeft(267);
    obj.button13:setTop(1);
    obj.button13:setWidth(23);
    obj.button13:setHeight(23);
    obj.button13:setText("+");
    obj.button13:setName("button13");

    obj.rclMagiasPreparadas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagiasPreparadas:setParent(obj.rectangle111);
    obj.rclMagiasPreparadas:setLeft(0);
    obj.rclMagiasPreparadas:setTop(25);
    obj.rclMagiasPreparadas:setName("rclMagiasPreparadas");
    obj.rclMagiasPreparadas:setField("campoMagiasPreparadas");
    obj.rclMagiasPreparadas:setTemplateForm("frmMagiasPreparadas");
    obj.rclMagiasPreparadas:setWidth(307);
    obj.rclMagiasPreparadas:setHeight(475);
    obj.rclMagiasPreparadas:setLayout("vertical");
    obj.rclMagiasPreparadas:setMinQt(0);


		local function showInfoPopup()
			local pop = self:findControlByName("popInfo");

			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:show();
			else
				showMessage("Não encontrei o popup de informações para exibir.");
			end;
		end;

		local function showTalentosPopup()
			local pop = self:findControlByName("popTalentos");

			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:show();
			else
				showMessage("Não encontrei o popup de talentos para exibir.");
			end;
		end;

		local function showMagiasPopup()
			local pop = self:findControlByName("popMagias");

			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:show();
			else
				showMessage("Não encontrei o popup de magias para exibir.");
			end;
		end;

        local function showDeathPopup()
            local pop = self:findControlByName("popDeath");

            if pop ~= nil then
                pop:setNodeObject(self.sheet);
                pop:showPopupEx("center", sheet);
            else
                showMessage("Não encontrei o popup de morte para exibir.");
            end;
        end;

		local function showItemPopup()
			local pop = self:findControlByName("popItem");

			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:show();
			else
				showMessage("Não encontrei o popup de itens para exibir.");
			end;
		end;
		


    obj.rectangle115 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj);
    obj.rectangle115:setAlign("client");
    obj.rectangle115:setName("rectangle115");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.rectangle115);
    obj.image10:setAlign("client");
    obj.image10:setStyle("autoFit");
    obj.image10:setSRC("/imagens/Fundo 1.jpg");
    obj.image10:setName("image10");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle115);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setMinScaledWidth(400);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setWidth(1200);
    obj.flowLayout1:setHeight(400);
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setOrientation("horizontal");
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setWidth(1200);
    obj.flowPart1:setHeight(230);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setAlign("top");
    obj.flowPart1:setMinScaledWidth(400);
    obj.flowPart1:setAvoidScale(true);
    obj.flowPart1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle116 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.flowPart1);
    obj.rectangle116:setAlign("client");
    obj.rectangle116:setName("rectangle116");
    obj.rectangle116:setColor("transparent");
    obj.rectangle116:setCornerType("round");
    obj.rectangle116:setXradius(15);
    obj.rectangle116:setYradius(15);
    obj.rectangle116:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.rectangle116);
    obj.image11:setAlign("client");
    obj.image11:setStyle("stretch");
    obj.image11:setSRC("/imagens/Fundo 2.png");
    obj.image11:setOpacity(0.1);
    obj.image11:setName("image11");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle116);
    obj.label122:setLeft(0);
    obj.label122:setTop(5);
    obj.label122:setWidth(1200);
    obj.label122:setHeight(25);
    obj.label122:setText("Personagem");
    obj.label122:setFontSize(20);
    obj.label122:setVertTextAlign("center");
    obj.label122:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label122, "fontStyle",  "italic");
    obj.label122:setFontColor("Gray");
    obj.label122:setFontFamily("Stencil");
    obj.label122:setName("label122");

    obj.rectangle117 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.rectangle116);
    obj.rectangle117:setLeft(10);
    obj.rectangle117:setTop(40);
    obj.rectangle117:setName("rectangle117");
    obj.rectangle117:setWidth(131);
    obj.rectangle117:setHeight(25);
    obj.rectangle117:setColor("transparent");
    obj.rectangle117:setStrokeColor("Gray");
    obj.rectangle117:setStrokeSize(2);
    obj.rectangle117:setCornerType("innerRound");
    obj.rectangle117:setXradius(5);
    obj.rectangle117:setYradius(5);

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle117);
    obj.label123:setWidth(131);
    obj.label123:setHeight(25);
    obj.label123:setVertTextAlign("center");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setText("Nome");
    obj.label123:setFontSize(16);
    obj.label123:setFontColor("Gray");
    obj.label123:setFontFamily("Stencil");
    obj.label123:setName("label123");

    obj.nomeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeLabel:setParent(obj.rectangle116);
    obj.nomeLabel:setLeft(140);
    obj.nomeLabel:setTop(40);
    obj.nomeLabel:setWidth(250);
    obj.nomeLabel:setHeight(25);
    obj.nomeLabel:setColor("transparent");
    obj.nomeLabel:setStrokeColor("Gray");
    obj.nomeLabel:setStrokeSize(1);
    obj.nomeLabel:setName("nomeLabel");
    obj.nomeLabel:setVisible(true);
    obj.nomeLabel:setCornerType("round");
    obj.nomeLabel:setXradius(5);
    obj.nomeLabel:setYradius(5);

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.nomeLabel);
    obj.label124:setWidth(250);
    obj.label124:setHeight(25);
    obj.label124:setField("nome");
    obj.label124:setFontSize(16);
    obj.label124:setVertTextAlign("center");
    obj.label124:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label124, "fontStyle",  "bold");
    obj.label124:setFontColor("Gray");
    obj.label124:setName("label124");

    obj.nomeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeEdit:setParent(obj.rectangle116);
    obj.nomeEdit:setField("nome");
    obj.nomeEdit:setLeft(140);
    obj.nomeEdit:setTop(40);
    obj.nomeEdit:setWidth(250);
    obj.nomeEdit:setHeight(25);
    obj.nomeEdit:setName("nomeEdit");
    obj.nomeEdit:setVisible(false);
    obj.nomeEdit:setFontSize(16);

    obj.rectangle118 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.rectangle116);
    obj.rectangle118:setLeft(10);
    obj.rectangle118:setTop(70);
    obj.rectangle118:setName("rectangle118");
    obj.rectangle118:setWidth(131);
    obj.rectangle118:setHeight(25);
    obj.rectangle118:setColor("transparent");
    obj.rectangle118:setStrokeColor("Gray");
    obj.rectangle118:setStrokeSize(2);
    obj.rectangle118:setCornerType("innerRound");
    obj.rectangle118:setXradius(5);
    obj.rectangle118:setYradius(5);

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle118);
    obj.label125:setWidth(131);
    obj.label125:setHeight(25);
    obj.label125:setVertTextAlign("center");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setText("Raça");
    obj.label125:setFontSize(16);
    obj.label125:setFontColor("Gray");
    obj.label125:setFontFamily("Stencil");
    obj.label125:setName("label125");

    obj.racaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.racaLabel:setParent(obj.rectangle116);
    obj.racaLabel:setLeft(140);
    obj.racaLabel:setTop(70);
    obj.racaLabel:setWidth(250);
    obj.racaLabel:setHeight(25);
    obj.racaLabel:setColor("transparent");
    obj.racaLabel:setStrokeColor("Gray");
    obj.racaLabel:setStrokeSize(1);
    obj.racaLabel:setName("racaLabel");
    obj.racaLabel:setVisible(true);
    obj.racaLabel:setCornerType("round");
    obj.racaLabel:setXradius(5);
    obj.racaLabel:setYradius(5);

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.racaLabel);
    obj.label126:setWidth(250);
    obj.label126:setHeight(25);
    obj.label126:setField("raca");
    obj.label126:setFontSize(16);
    obj.label126:setVertTextAlign("center");
    obj.label126:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label126, "fontStyle",  "bold");
    obj.label126:setFontColor("Gray");
    obj.label126:setName("label126");

    obj.racaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.racaEdit:setParent(obj.rectangle116);
    obj.racaEdit:setField("raca");
    obj.racaEdit:setLeft(140);
    obj.racaEdit:setTop(70);
    obj.racaEdit:setWidth(250);
    obj.racaEdit:setHeight(25);
    obj.racaEdit:setName("racaEdit");
    obj.racaEdit:setVisible(false);
    obj.racaEdit:setFontSize(16);

    obj.rectangle119 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.rectangle116);
    obj.rectangle119:setLeft(10);
    obj.rectangle119:setTop(100);
    obj.rectangle119:setName("rectangle119");
    obj.rectangle119:setWidth(131);
    obj.rectangle119:setHeight(25);
    obj.rectangle119:setColor("transparent");
    obj.rectangle119:setStrokeColor("Gray");
    obj.rectangle119:setStrokeSize(2);
    obj.rectangle119:setCornerType("innerRound");
    obj.rectangle119:setXradius(5);
    obj.rectangle119:setYradius(5);

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.rectangle119);
    obj.label127:setWidth(131);
    obj.label127:setHeight(25);
    obj.label127:setVertTextAlign("center");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setText("Sexo");
    obj.label127:setFontSize(16);
    obj.label127:setFontColor("Gray");
    obj.label127:setFontFamily("Stencil");
    obj.label127:setName("label127");

    obj.sexoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.sexoLabel:setParent(obj.rectangle116);
    obj.sexoLabel:setLeft(140);
    obj.sexoLabel:setTop(100);
    obj.sexoLabel:setWidth(250);
    obj.sexoLabel:setHeight(25);
    obj.sexoLabel:setColor("transparent");
    obj.sexoLabel:setStrokeColor("Gray");
    obj.sexoLabel:setStrokeSize(1);
    obj.sexoLabel:setName("sexoLabel");
    obj.sexoLabel:setVisible(true);
    obj.sexoLabel:setCornerType("round");
    obj.sexoLabel:setXradius(5);
    obj.sexoLabel:setYradius(5);

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.sexoLabel);
    obj.label128:setWidth(250);
    obj.label128:setHeight(25);
    obj.label128:setField("sexo");
    obj.label128:setFontSize(16);
    obj.label128:setVertTextAlign("center");
    obj.label128:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label128, "fontStyle",  "bold");
    obj.label128:setFontColor("Gray");
    obj.label128:setName("label128");

    obj.sexoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.sexoEdit:setParent(obj.rectangle116);
    obj.sexoEdit:setField("sexo");
    obj.sexoEdit:setLeft(140);
    obj.sexoEdit:setTop(100);
    obj.sexoEdit:setWidth(250);
    obj.sexoEdit:setHeight(25);
    obj.sexoEdit:setName("sexoEdit");
    obj.sexoEdit:setVisible(false);
    obj.sexoEdit:setFontSize(16);

    obj.rectangle120 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.rectangle116);
    obj.rectangle120:setLeft(10);
    obj.rectangle120:setTop(130);
    obj.rectangle120:setName("rectangle120");
    obj.rectangle120:setWidth(131);
    obj.rectangle120:setHeight(25);
    obj.rectangle120:setColor("transparent");
    obj.rectangle120:setStrokeColor("Gray");
    obj.rectangle120:setStrokeSize(2);
    obj.rectangle120:setCornerType("innerRound");
    obj.rectangle120:setXradius(5);
    obj.rectangle120:setYradius(5);

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.rectangle120);
    obj.label129:setWidth(131);
    obj.label129:setHeight(25);
    obj.label129:setVertTextAlign("center");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setText("Herança");
    obj.label129:setFontSize(16);
    obj.label129:setFontColor("Gray");
    obj.label129:setFontFamily("Stencil");
    obj.label129:setName("label129");

    obj.herancaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.herancaLabel:setParent(obj.rectangle116);
    obj.herancaLabel:setLeft(140);
    obj.herancaLabel:setTop(130);
    obj.herancaLabel:setWidth(250);
    obj.herancaLabel:setHeight(25);
    obj.herancaLabel:setColor("transparent");
    obj.herancaLabel:setStrokeColor("Gray");
    obj.herancaLabel:setStrokeSize(1);
    obj.herancaLabel:setName("herancaLabel");
    obj.herancaLabel:setVisible(true);
    obj.herancaLabel:setCornerType("round");
    obj.herancaLabel:setXradius(5);
    obj.herancaLabel:setYradius(5);

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.herancaLabel);
    obj.label130:setWidth(250);
    obj.label130:setHeight(25);
    obj.label130:setField("heranca");
    obj.label130:setFontSize(16);
    obj.label130:setVertTextAlign("center");
    obj.label130:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label130, "fontStyle",  "bold");
    obj.label130:setFontColor("Gray");
    obj.label130:setName("label130");

    obj.herancaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.herancaEdit:setParent(obj.rectangle116);
    obj.herancaEdit:setField("heranca");
    obj.herancaEdit:setLeft(140);
    obj.herancaEdit:setTop(130);
    obj.herancaEdit:setWidth(250);
    obj.herancaEdit:setHeight(25);
    obj.herancaEdit:setName("herancaEdit");
    obj.herancaEdit:setVisible(false);
    obj.herancaEdit:setFontSize(16);

    obj.rectangle121 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.rectangle116);
    obj.rectangle121:setLeft(10);
    obj.rectangle121:setTop(160);
    obj.rectangle121:setName("rectangle121");
    obj.rectangle121:setWidth(131);
    obj.rectangle121:setHeight(25);
    obj.rectangle121:setColor("transparent");
    obj.rectangle121:setStrokeColor("Gray");
    obj.rectangle121:setStrokeSize(2);
    obj.rectangle121:setCornerType("innerRound");
    obj.rectangle121:setXradius(5);
    obj.rectangle121:setYradius(5);

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.rectangle121);
    obj.label131:setWidth(131);
    obj.label131:setHeight(25);
    obj.label131:setVertTextAlign("center");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setText("Tamanho");
    obj.label131:setFontSize(16);
    obj.label131:setFontColor("Gray");
    obj.label131:setFontFamily("Stencil");
    obj.label131:setName("label131");

    obj.tamanhoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.tamanhoLabel:setParent(obj.rectangle116);
    obj.tamanhoLabel:setLeft(140);
    obj.tamanhoLabel:setTop(160);
    obj.tamanhoLabel:setWidth(250);
    obj.tamanhoLabel:setHeight(25);
    obj.tamanhoLabel:setColor("transparent");
    obj.tamanhoLabel:setStrokeColor("Gray");
    obj.tamanhoLabel:setStrokeSize(1);
    obj.tamanhoLabel:setName("tamanhoLabel");
    obj.tamanhoLabel:setVisible(true);
    obj.tamanhoLabel:setCornerType("round");
    obj.tamanhoLabel:setXradius(5);
    obj.tamanhoLabel:setYradius(5);

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.tamanhoLabel);
    obj.label132:setWidth(250);
    obj.label132:setHeight(25);
    obj.label132:setField("tamanho");
    obj.label132:setFontSize(16);
    obj.label132:setVertTextAlign("center");
    obj.label132:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label132, "fontStyle",  "bold");
    obj.label132:setFontColor("Gray");
    obj.label132:setName("label132");

    obj.tamanhoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.tamanhoEdit:setParent(obj.rectangle116);
    obj.tamanhoEdit:setField("tamanho");
    obj.tamanhoEdit:setLeft(140);
    obj.tamanhoEdit:setTop(160);
    obj.tamanhoEdit:setWidth(250);
    obj.tamanhoEdit:setHeight(25);
    obj.tamanhoEdit:setName("tamanhoEdit");
    obj.tamanhoEdit:setVisible(false);
    obj.tamanhoEdit:setFontSize(16);

    obj.rectangle122 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.rectangle116);
    obj.rectangle122:setLeft(10);
    obj.rectangle122:setTop(190);
    obj.rectangle122:setName("rectangle122");
    obj.rectangle122:setWidth(131);
    obj.rectangle122:setHeight(25);
    obj.rectangle122:setColor("transparent");
    obj.rectangle122:setStrokeColor("Gray");
    obj.rectangle122:setStrokeSize(2);
    obj.rectangle122:setCornerType("innerRound");
    obj.rectangle122:setXradius(5);
    obj.rectangle122:setYradius(5);

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle122);
    obj.label133:setWidth(131);
    obj.label133:setHeight(25);
    obj.label133:setVertTextAlign("center");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setText("Traços");
    obj.label133:setFontSize(16);
    obj.label133:setFontColor("Gray");
    obj.label133:setFontFamily("Stencil");
    obj.label133:setName("label133");

    obj.tracosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.tracosLabel:setParent(obj.rectangle116);
    obj.tracosLabel:setLeft(140);
    obj.tracosLabel:setTop(190);
    obj.tracosLabel:setWidth(250);
    obj.tracosLabel:setHeight(25);
    obj.tracosLabel:setColor("transparent");
    obj.tracosLabel:setStrokeColor("Gray");
    obj.tracosLabel:setStrokeSize(1);
    obj.tracosLabel:setName("tracosLabel");
    obj.tracosLabel:setVisible(true);
    obj.tracosLabel:setCornerType("round");
    obj.tracosLabel:setXradius(5);
    obj.tracosLabel:setYradius(5);

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.tracosLabel);
    obj.label134:setWidth(250);
    obj.label134:setHeight(25);
    obj.label134:setField("tracos");
    obj.label134:setFontSize(16);
    obj.label134:setVertTextAlign("center");
    obj.label134:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label134, "fontStyle",  "bold");
    obj.label134:setFontColor("Gray");
    obj.label134:setName("label134");

    obj.tracosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.tracosEdit:setParent(obj.rectangle116);
    obj.tracosEdit:setField("tracos");
    obj.tracosEdit:setLeft(140);
    obj.tracosEdit:setTop(190);
    obj.tracosEdit:setWidth(250);
    obj.tracosEdit:setHeight(25);
    obj.tracosEdit:setName("tracosEdit");
    obj.tracosEdit:setVisible(false);
    obj.tracosEdit:setFontSize(16);

    obj.rectangle123 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.rectangle116);
    obj.rectangle123:setLeft(408);
    obj.rectangle123:setTop(40);
    obj.rectangle123:setName("rectangle123");
    obj.rectangle123:setWidth(131);
    obj.rectangle123:setHeight(25);
    obj.rectangle123:setColor("transparent");
    obj.rectangle123:setStrokeColor("Gray");
    obj.rectangle123:setStrokeSize(2);
    obj.rectangle123:setCornerType("innerRound");
    obj.rectangle123:setXradius(5);
    obj.rectangle123:setYradius(5);

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle123);
    obj.label135:setWidth(131);
    obj.label135:setHeight(25);
    obj.label135:setVertTextAlign("center");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setText("Classe");
    obj.label135:setFontSize(16);
    obj.label135:setFontColor("Gray");
    obj.label135:setFontFamily("Stencil");
    obj.label135:setName("label135");

    obj.classeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.classeLabel:setParent(obj.rectangle116);
    obj.classeLabel:setLeft(538);
    obj.classeLabel:setTop(40);
    obj.classeLabel:setWidth(250);
    obj.classeLabel:setHeight(25);
    obj.classeLabel:setColor("transparent");
    obj.classeLabel:setStrokeColor("Gray");
    obj.classeLabel:setStrokeSize(1);
    obj.classeLabel:setName("classeLabel");
    obj.classeLabel:setVisible(true);
    obj.classeLabel:setCornerType("round");
    obj.classeLabel:setXradius(5);
    obj.classeLabel:setYradius(5);

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.classeLabel);
    obj.label136:setWidth(250);
    obj.label136:setHeight(25);
    obj.label136:setField("classe");
    obj.label136:setFontSize(16);
    obj.label136:setVertTextAlign("center");
    obj.label136:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label136, "fontStyle",  "bold");
    obj.label136:setFontColor("Gray");
    obj.label136:setName("label136");

    obj.classeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.classeEdit:setParent(obj.rectangle116);
    obj.classeEdit:setField("classe");
    obj.classeEdit:setLeft(538);
    obj.classeEdit:setTop(40);
    obj.classeEdit:setWidth(250);
    obj.classeEdit:setHeight(25);
    obj.classeEdit:setName("classeEdit");
    obj.classeEdit:setVisible(false);
    obj.classeEdit:setFontSize(16);

    obj.rectangle124 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.rectangle116);
    obj.rectangle124:setLeft(408);
    obj.rectangle124:setTop(70);
    obj.rectangle124:setName("rectangle124");
    obj.rectangle124:setWidth(131);
    obj.rectangle124:setHeight(25);
    obj.rectangle124:setColor("transparent");
    obj.rectangle124:setStrokeColor("Gray");
    obj.rectangle124:setStrokeSize(2);
    obj.rectangle124:setCornerType("innerRound");
    obj.rectangle124:setXradius(5);
    obj.rectangle124:setYradius(5);

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.rectangle124);
    obj.label137:setWidth(131);
    obj.label137:setHeight(25);
    obj.label137:setVertTextAlign("center");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setText("Biografia");
    obj.label137:setFontSize(16);
    obj.label137:setFontColor("Gray");
    obj.label137:setFontFamily("Stencil");
    obj.label137:setName("label137");

    obj.biografiaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.biografiaLabel:setParent(obj.rectangle116);
    obj.biografiaLabel:setLeft(538);
    obj.biografiaLabel:setTop(70);
    obj.biografiaLabel:setWidth(250);
    obj.biografiaLabel:setHeight(25);
    obj.biografiaLabel:setColor("transparent");
    obj.biografiaLabel:setStrokeColor("Gray");
    obj.biografiaLabel:setStrokeSize(1);
    obj.biografiaLabel:setName("biografiaLabel");
    obj.biografiaLabel:setVisible(true);
    obj.biografiaLabel:setCornerType("round");
    obj.biografiaLabel:setXradius(5);
    obj.biografiaLabel:setYradius(5);

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.biografiaLabel);
    obj.label138:setWidth(250);
    obj.label138:setHeight(25);
    obj.label138:setField("biografia");
    obj.label138:setFontSize(16);
    obj.label138:setVertTextAlign("center");
    obj.label138:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label138, "fontStyle",  "bold");
    obj.label138:setFontColor("Gray");
    obj.label138:setName("label138");

    obj.biografiaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.biografiaEdit:setParent(obj.rectangle116);
    obj.biografiaEdit:setField("biografia");
    obj.biografiaEdit:setLeft(538);
    obj.biografiaEdit:setTop(70);
    obj.biografiaEdit:setWidth(250);
    obj.biografiaEdit:setHeight(25);
    obj.biografiaEdit:setName("biografiaEdit");
    obj.biografiaEdit:setVisible(false);
    obj.biografiaEdit:setFontSize(16);

    obj.rectangle125 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.rectangle116);
    obj.rectangle125:setLeft(408);
    obj.rectangle125:setTop(100);
    obj.rectangle125:setName("rectangle125");
    obj.rectangle125:setWidth(131);
    obj.rectangle125:setHeight(25);
    obj.rectangle125:setColor("transparent");
    obj.rectangle125:setStrokeColor("Gray");
    obj.rectangle125:setStrokeSize(2);
    obj.rectangle125:setCornerType("innerRound");
    obj.rectangle125:setXradius(5);
    obj.rectangle125:setYradius(5);

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.rectangle125);
    obj.label139:setWidth(131);
    obj.label139:setHeight(25);
    obj.label139:setVertTextAlign("center");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setText("Tendência");
    obj.label139:setFontSize(16);
    obj.label139:setFontColor("Gray");
    obj.label139:setFontFamily("Stencil");
    obj.label139:setName("label139");

    obj.tendenciaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.tendenciaLabel:setParent(obj.rectangle116);
    obj.tendenciaLabel:setLeft(538);
    obj.tendenciaLabel:setTop(100);
    obj.tendenciaLabel:setWidth(250);
    obj.tendenciaLabel:setHeight(25);
    obj.tendenciaLabel:setColor("transparent");
    obj.tendenciaLabel:setStrokeColor("Gray");
    obj.tendenciaLabel:setStrokeSize(1);
    obj.tendenciaLabel:setName("tendenciaLabel");
    obj.tendenciaLabel:setVisible(true);
    obj.tendenciaLabel:setCornerType("round");
    obj.tendenciaLabel:setXradius(5);
    obj.tendenciaLabel:setYradius(5);

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.tendenciaLabel);
    obj.label140:setWidth(250);
    obj.label140:setHeight(25);
    obj.label140:setField("tendencia");
    obj.label140:setFontSize(16);
    obj.label140:setVertTextAlign("center");
    obj.label140:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label140, "fontStyle",  "bold");
    obj.label140:setFontColor("Gray");
    obj.label140:setName("label140");

    obj.tendenciaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.tendenciaEdit:setParent(obj.rectangle116);
    obj.tendenciaEdit:setField("tendencia");
    obj.tendenciaEdit:setLeft(538);
    obj.tendenciaEdit:setTop(100);
    obj.tendenciaEdit:setWidth(250);
    obj.tendenciaEdit:setHeight(25);
    obj.tendenciaEdit:setName("tendenciaEdit");
    obj.tendenciaEdit:setVisible(false);
    obj.tendenciaEdit:setFontSize(16);

    obj.rectangle126 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.rectangle116);
    obj.rectangle126:setLeft(408);
    obj.rectangle126:setTop(130);
    obj.rectangle126:setName("rectangle126");
    obj.rectangle126:setWidth(131);
    obj.rectangle126:setHeight(25);
    obj.rectangle126:setColor("transparent");
    obj.rectangle126:setStrokeColor("Gray");
    obj.rectangle126:setStrokeSize(2);
    obj.rectangle126:setCornerType("innerRound");
    obj.rectangle126:setXradius(5);
    obj.rectangle126:setYradius(5);

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.rectangle126);
    obj.label141:setWidth(131);
    obj.label141:setHeight(25);
    obj.label141:setVertTextAlign("center");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setText("Origem");
    obj.label141:setFontSize(16);
    obj.label141:setFontColor("Gray");
    obj.label141:setFontFamily("Stencil");
    obj.label141:setName("label141");

    obj.origemLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.origemLabel:setParent(obj.rectangle116);
    obj.origemLabel:setLeft(538);
    obj.origemLabel:setTop(130);
    obj.origemLabel:setWidth(250);
    obj.origemLabel:setHeight(25);
    obj.origemLabel:setColor("transparent");
    obj.origemLabel:setStrokeColor("Gray");
    obj.origemLabel:setStrokeSize(1);
    obj.origemLabel:setName("origemLabel");
    obj.origemLabel:setVisible(true);
    obj.origemLabel:setCornerType("round");
    obj.origemLabel:setXradius(5);
    obj.origemLabel:setYradius(5);

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.origemLabel);
    obj.label142:setWidth(250);
    obj.label142:setHeight(25);
    obj.label142:setField("origem");
    obj.label142:setFontSize(16);
    obj.label142:setVertTextAlign("center");
    obj.label142:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label142, "fontStyle",  "bold");
    obj.label142:setFontColor("Gray");
    obj.label142:setName("label142");

    obj.origemEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.origemEdit:setParent(obj.rectangle116);
    obj.origemEdit:setField("origem");
    obj.origemEdit:setLeft(538);
    obj.origemEdit:setTop(130);
    obj.origemEdit:setWidth(250);
    obj.origemEdit:setHeight(25);
    obj.origemEdit:setName("origemEdit");
    obj.origemEdit:setVisible(false);
    obj.origemEdit:setFontSize(16);

    obj.rectangle127 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.rectangle116);
    obj.rectangle127:setLeft(408);
    obj.rectangle127:setTop(160);
    obj.rectangle127:setName("rectangle127");
    obj.rectangle127:setWidth(131);
    obj.rectangle127:setHeight(25);
    obj.rectangle127:setColor("transparent");
    obj.rectangle127:setStrokeColor("Gray");
    obj.rectangle127:setStrokeSize(2);
    obj.rectangle127:setCornerType("innerRound");
    obj.rectangle127:setXradius(5);
    obj.rectangle127:setYradius(5);

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.rectangle127);
    obj.label143:setWidth(131);
    obj.label143:setHeight(25);
    obj.label143:setVertTextAlign("center");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setText("Divindade");
    obj.label143:setFontSize(16);
    obj.label143:setFontColor("Gray");
    obj.label143:setFontFamily("Stencil");
    obj.label143:setName("label143");

    obj.divindadeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.divindadeLabel:setParent(obj.rectangle116);
    obj.divindadeLabel:setLeft(538);
    obj.divindadeLabel:setTop(160);
    obj.divindadeLabel:setWidth(250);
    obj.divindadeLabel:setHeight(25);
    obj.divindadeLabel:setColor("transparent");
    obj.divindadeLabel:setStrokeColor("Gray");
    obj.divindadeLabel:setStrokeSize(1);
    obj.divindadeLabel:setName("divindadeLabel");
    obj.divindadeLabel:setVisible(true);
    obj.divindadeLabel:setCornerType("round");
    obj.divindadeLabel:setXradius(5);
    obj.divindadeLabel:setYradius(5);

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.divindadeLabel);
    obj.label144:setWidth(250);
    obj.label144:setHeight(25);
    obj.label144:setField("divindade");
    obj.label144:setFontSize(16);
    obj.label144:setVertTextAlign("center");
    obj.label144:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label144, "fontStyle",  "bold");
    obj.label144:setFontColor("Gray");
    obj.label144:setName("label144");

    obj.divindadeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.divindadeEdit:setParent(obj.rectangle116);
    obj.divindadeEdit:setField("divindade");
    obj.divindadeEdit:setLeft(538);
    obj.divindadeEdit:setTop(160);
    obj.divindadeEdit:setWidth(250);
    obj.divindadeEdit:setHeight(25);
    obj.divindadeEdit:setName("divindadeEdit");
    obj.divindadeEdit:setVisible(false);
    obj.divindadeEdit:setFontSize(16);

    obj.rectangle128 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.rectangle116);
    obj.rectangle128:setLeft(408);
    obj.rectangle128:setTop(190);
    obj.rectangle128:setName("rectangle128");
    obj.rectangle128:setWidth(131);
    obj.rectangle128:setHeight(25);
    obj.rectangle128:setColor("transparent");
    obj.rectangle128:setStrokeColor("Gray");
    obj.rectangle128:setStrokeSize(2);
    obj.rectangle128:setCornerType("innerRound");
    obj.rectangle128:setXradius(5);
    obj.rectangle128:setYradius(5);

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.rectangle128);
    obj.label145:setWidth(131);
    obj.label145:setHeight(25);
    obj.label145:setVertTextAlign("center");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setText("Jogador");
    obj.label145:setFontSize(16);
    obj.label145:setFontColor("Gray");
    obj.label145:setFontFamily("Stencil");
    obj.label145:setName("label145");

    obj.jogadorLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.jogadorLabel:setParent(obj.rectangle116);
    obj.jogadorLabel:setLeft(538);
    obj.jogadorLabel:setTop(190);
    obj.jogadorLabel:setWidth(250);
    obj.jogadorLabel:setHeight(25);
    obj.jogadorLabel:setColor("transparent");
    obj.jogadorLabel:setStrokeColor("Gray");
    obj.jogadorLabel:setStrokeSize(1);
    obj.jogadorLabel:setName("jogadorLabel");
    obj.jogadorLabel:setVisible(true);
    obj.jogadorLabel:setCornerType("round");
    obj.jogadorLabel:setXradius(5);
    obj.jogadorLabel:setYradius(5);

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.jogadorLabel);
    obj.label146:setWidth(250);
    obj.label146:setHeight(25);
    obj.label146:setField("jogador");
    obj.label146:setFontSize(16);
    obj.label146:setVertTextAlign("center");
    obj.label146:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label146, "fontStyle",  "bold");
    obj.label146:setFontColor("Gray");
    obj.label146:setName("label146");

    obj.jogadorEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.jogadorEdit:setParent(obj.rectangle116);
    obj.jogadorEdit:setField("jogador");
    obj.jogadorEdit:setLeft(538);
    obj.jogadorEdit:setTop(190);
    obj.jogadorEdit:setWidth(250);
    obj.jogadorEdit:setHeight(25);
    obj.jogadorEdit:setName("jogadorEdit");
    obj.jogadorEdit:setVisible(false);
    obj.jogadorEdit:setFontSize(16);

    obj.rectangle129 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.rectangle116);
    obj.rectangle129:setLeft(808);
    obj.rectangle129:setTop(40);
    obj.rectangle129:setName("rectangle129");
    obj.rectangle129:setWidth(131);
    obj.rectangle129:setHeight(25);
    obj.rectangle129:setColor("transparent");
    obj.rectangle129:setStrokeColor("Gray");
    obj.rectangle129:setStrokeSize(2);
    obj.rectangle129:setCornerType("innerRound");
    obj.rectangle129:setXradius(5);
    obj.rectangle129:setYradius(5);

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.rectangle129);
    obj.label147:setWidth(131);
    obj.label147:setHeight(25);
    obj.label147:setVertTextAlign("center");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setText("Nível");
    obj.label147:setFontSize(16);
    obj.label147:setFontColor("Gray");
    obj.label147:setFontFamily("Stencil");
    obj.label147:setName("label147");

    obj.nivelLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nivelLabel:setParent(obj.rectangle116);
    obj.nivelLabel:setLeft(938);
    obj.nivelLabel:setTop(40);
    obj.nivelLabel:setWidth(250);
    obj.nivelLabel:setHeight(25);
    obj.nivelLabel:setColor("transparent");
    obj.nivelLabel:setStrokeColor("Gray");
    obj.nivelLabel:setStrokeSize(1);
    obj.nivelLabel:setName("nivelLabel");
    obj.nivelLabel:setVisible(true);
    obj.nivelLabel:setCornerType("round");
    obj.nivelLabel:setXradius(5);
    obj.nivelLabel:setYradius(5);

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.nivelLabel);
    obj.label148:setWidth(250);
    obj.label148:setHeight(25);
    obj.label148:setField("nivel");
    obj.label148:setFontSize(16);
    obj.label148:setVertTextAlign("center");
    obj.label148:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label148, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label148, "fontStyle",  "bold");
    obj.label148:setFontColor("Gray");
    obj.label148:setName("label148");

    obj.nivelEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivelEdit:setParent(obj.rectangle116);
    obj.nivelEdit:setField("nivel");
    obj.nivelEdit:setLeft(938);
    obj.nivelEdit:setTop(40);
    obj.nivelEdit:setWidth(250);
    obj.nivelEdit:setHeight(25);
    obj.nivelEdit:setType("float");
    obj.nivelEdit:setName("nivelEdit");
    obj.nivelEdit:setVisible(false);
    obj.nivelEdit:setFontSize(16);

    obj.rectangle130 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.rectangle116);
    obj.rectangle130:setLeft(808);
    obj.rectangle130:setTop(70);
    obj.rectangle130:setName("rectangle130");
    obj.rectangle130:setWidth(131);
    obj.rectangle130:setHeight(25);
    obj.rectangle130:setColor("transparent");
    obj.rectangle130:setStrokeColor("Gray");
    obj.rectangle130:setStrokeSize(2);
    obj.rectangle130:setCornerType("innerRound");
    obj.rectangle130:setXradius(5);
    obj.rectangle130:setYradius(5);

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.rectangle130);
    obj.label149:setWidth(131);
    obj.label149:setHeight(25);
    obj.label149:setVertTextAlign("center");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setText("Experiência");
    obj.label149:setFontSize(16);
    obj.label149:setFontColor("Gray");
    obj.label149:setFontFamily("Stencil");
    obj.label149:setName("label149");

    obj.experienciaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.experienciaLabel:setParent(obj.rectangle116);
    obj.experienciaLabel:setLeft(938);
    obj.experienciaLabel:setTop(70);
    obj.experienciaLabel:setWidth(250);
    obj.experienciaLabel:setHeight(25);
    obj.experienciaLabel:setColor("transparent");
    obj.experienciaLabel:setStrokeColor("Gray");
    obj.experienciaLabel:setStrokeSize(1);
    obj.experienciaLabel:setName("experienciaLabel");
    obj.experienciaLabel:setVisible(true);
    obj.experienciaLabel:setCornerType("round");
    obj.experienciaLabel:setXradius(5);
    obj.experienciaLabel:setYradius(5);

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.experienciaLabel);
    obj.label150:setWidth(250);
    obj.label150:setHeight(25);
    obj.label150:setField("experiencia");
    obj.label150:setFontSize(16);
    obj.label150:setVertTextAlign("center");
    obj.label150:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label150, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label150, "fontStyle",  "bold");
    obj.label150:setFontColor("Gray");
    obj.label150:setName("label150");

    obj.experienciaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.experienciaEdit:setParent(obj.rectangle116);
    obj.experienciaEdit:setField("experiencia");
    obj.experienciaEdit:setLeft(938);
    obj.experienciaEdit:setTop(70);
    obj.experienciaEdit:setWidth(250);
    obj.experienciaEdit:setHeight(25);
    obj.experienciaEdit:setType("float");
    obj.experienciaEdit:setName("experienciaEdit");
    obj.experienciaEdit:setVisible(false);
    obj.experienciaEdit:setFontSize(16);

    obj.rectangle131 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.rectangle116);
    obj.rectangle131:setLeft(808);
    obj.rectangle131:setTop(100);
    obj.rectangle131:setName("rectangle131");
    obj.rectangle131:setWidth(131);
    obj.rectangle131:setHeight(25);
    obj.rectangle131:setColor("transparent");
    obj.rectangle131:setStrokeColor("Gray");
    obj.rectangle131:setStrokeSize(2);
    obj.rectangle131:setCornerType("innerRound");
    obj.rectangle131:setXradius(5);
    obj.rectangle131:setYradius(5);

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.rectangle131);
    obj.label151:setWidth(131);
    obj.label151:setHeight(25);
    obj.label151:setVertTextAlign("center");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setText("Velocidade");
    obj.label151:setFontSize(16);
    obj.label151:setFontColor("Gray");
    obj.label151:setFontFamily("Stencil");
    obj.label151:setName("label151");

    obj.velocidadeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.velocidadeLabel:setParent(obj.rectangle116);
    obj.velocidadeLabel:setLeft(938);
    obj.velocidadeLabel:setTop(100);
    obj.velocidadeLabel:setWidth(250);
    obj.velocidadeLabel:setHeight(25);
    obj.velocidadeLabel:setColor("transparent");
    obj.velocidadeLabel:setStrokeColor("Gray");
    obj.velocidadeLabel:setStrokeSize(1);
    obj.velocidadeLabel:setName("velocidadeLabel");
    obj.velocidadeLabel:setVisible(true);
    obj.velocidadeLabel:setCornerType("round");
    obj.velocidadeLabel:setXradius(5);
    obj.velocidadeLabel:setYradius(5);

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.velocidadeLabel);
    obj.label152:setWidth(250);
    obj.label152:setHeight(25);
    obj.label152:setField("velocidade");
    obj.label152:setFontSize(16);
    obj.label152:setVertTextAlign("center");
    obj.label152:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label152, "formatFloat",  "0.## m");
    lfm_setPropAsString(obj.label152, "fontStyle",  "bold");
    obj.label152:setFontColor("Gray");
    obj.label152:setName("label152");

    obj.velocidadeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.velocidadeEdit:setParent(obj.rectangle116);
    obj.velocidadeEdit:setField("velocidade");
    obj.velocidadeEdit:setLeft(938);
    obj.velocidadeEdit:setTop(100);
    obj.velocidadeEdit:setWidth(250);
    obj.velocidadeEdit:setHeight(25);
    obj.velocidadeEdit:setType("float");
    obj.velocidadeEdit:setName("velocidadeEdit");
    obj.velocidadeEdit:setVisible(false);
    obj.velocidadeEdit:setFontSize(16);

    obj.rectangle132 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.rectangle116);
    obj.rectangle132:setLeft(808);
    obj.rectangle132:setTop(130);
    obj.rectangle132:setName("rectangle132");
    obj.rectangle132:setWidth(131);
    obj.rectangle132:setHeight(25);
    obj.rectangle132:setColor("transparent");
    obj.rectangle132:setStrokeColor("Gray");
    obj.rectangle132:setStrokeSize(2);
    obj.rectangle132:setCornerType("innerRound");
    obj.rectangle132:setXradius(5);
    obj.rectangle132:setYradius(5);

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.rectangle132);
    obj.label153:setWidth(131);
    obj.label153:setHeight(25);
    obj.label153:setVertTextAlign("center");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setText("Idade");
    obj.label153:setFontSize(16);
    obj.label153:setFontColor("Gray");
    obj.label153:setFontFamily("Stencil");
    obj.label153:setName("label153");

    obj.idadeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.idadeLabel:setParent(obj.rectangle116);
    obj.idadeLabel:setLeft(938);
    obj.idadeLabel:setTop(130);
    obj.idadeLabel:setWidth(250);
    obj.idadeLabel:setHeight(25);
    obj.idadeLabel:setColor("transparent");
    obj.idadeLabel:setStrokeColor("Gray");
    obj.idadeLabel:setStrokeSize(1);
    obj.idadeLabel:setName("idadeLabel");
    obj.idadeLabel:setVisible(true);
    obj.idadeLabel:setCornerType("round");
    obj.idadeLabel:setXradius(5);
    obj.idadeLabel:setYradius(5);

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.idadeLabel);
    obj.label154:setWidth(250);
    obj.label154:setHeight(25);
    obj.label154:setField("idade");
    obj.label154:setFontSize(16);
    obj.label154:setVertTextAlign("center");
    obj.label154:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label154, "formatFloat",  "0.## anos");
    lfm_setPropAsString(obj.label154, "fontStyle",  "bold");
    obj.label154:setFontColor("Gray");
    obj.label154:setName("label154");

    obj.idadeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.idadeEdit:setParent(obj.rectangle116);
    obj.idadeEdit:setField("idade");
    obj.idadeEdit:setLeft(938);
    obj.idadeEdit:setTop(130);
    obj.idadeEdit:setWidth(250);
    obj.idadeEdit:setHeight(25);
    obj.idadeEdit:setType("float");
    obj.idadeEdit:setName("idadeEdit");
    obj.idadeEdit:setVisible(false);
    obj.idadeEdit:setFontSize(16);

    obj.rectangle133 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.rectangle116);
    obj.rectangle133:setLeft(808);
    obj.rectangle133:setTop(160);
    obj.rectangle133:setName("rectangle133");
    obj.rectangle133:setWidth(131);
    obj.rectangle133:setHeight(25);
    obj.rectangle133:setColor("transparent");
    obj.rectangle133:setStrokeColor("Gray");
    obj.rectangle133:setStrokeSize(2);
    obj.rectangle133:setCornerType("innerRound");
    obj.rectangle133:setXradius(5);
    obj.rectangle133:setYradius(5);

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.rectangle133);
    obj.label155:setWidth(131);
    obj.label155:setHeight(25);
    obj.label155:setVertTextAlign("center");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setText("Altura");
    obj.label155:setFontSize(16);
    obj.label155:setFontColor("Gray");
    obj.label155:setFontFamily("Stencil");
    obj.label155:setName("label155");

    obj.alturaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.alturaLabel:setParent(obj.rectangle116);
    obj.alturaLabel:setLeft(938);
    obj.alturaLabel:setTop(160);
    obj.alturaLabel:setWidth(250);
    obj.alturaLabel:setHeight(25);
    obj.alturaLabel:setColor("transparent");
    obj.alturaLabel:setStrokeColor("Gray");
    obj.alturaLabel:setStrokeSize(1);
    obj.alturaLabel:setName("alturaLabel");
    obj.alturaLabel:setVisible(true);
    obj.alturaLabel:setCornerType("round");
    obj.alturaLabel:setXradius(5);
    obj.alturaLabel:setYradius(5);

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.alturaLabel);
    obj.label156:setWidth(250);
    obj.label156:setHeight(25);
    obj.label156:setField("altura");
    obj.label156:setFontSize(16);
    obj.label156:setVertTextAlign("center");
    obj.label156:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label156, "formatFloat",  "0.## m");
    lfm_setPropAsString(obj.label156, "fontStyle",  "bold");
    obj.label156:setFontColor("Gray");
    obj.label156:setName("label156");

    obj.alturaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.alturaEdit:setParent(obj.rectangle116);
    obj.alturaEdit:setField("altura");
    obj.alturaEdit:setLeft(938);
    obj.alturaEdit:setTop(160);
    obj.alturaEdit:setWidth(250);
    obj.alturaEdit:setHeight(25);
    obj.alturaEdit:setType("float");
    obj.alturaEdit:setName("alturaEdit");
    obj.alturaEdit:setVisible(false);
    obj.alturaEdit:setFontSize(16);

    obj.rectangle134 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.rectangle116);
    obj.rectangle134:setLeft(808);
    obj.rectangle134:setTop(190);
    obj.rectangle134:setName("rectangle134");
    obj.rectangle134:setWidth(131);
    obj.rectangle134:setHeight(25);
    obj.rectangle134:setColor("transparent");
    obj.rectangle134:setStrokeColor("Gray");
    obj.rectangle134:setStrokeSize(2);
    obj.rectangle134:setCornerType("innerRound");
    obj.rectangle134:setXradius(5);
    obj.rectangle134:setYradius(5);

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.rectangle134);
    obj.label157:setWidth(131);
    obj.label157:setHeight(25);
    obj.label157:setVertTextAlign("center");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setText("Peso");
    obj.label157:setFontSize(16);
    obj.label157:setFontColor("Gray");
    obj.label157:setFontFamily("Stencil");
    obj.label157:setName("label157");

    obj.pesoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pesoLabel:setParent(obj.rectangle116);
    obj.pesoLabel:setLeft(938);
    obj.pesoLabel:setTop(190);
    obj.pesoLabel:setWidth(250);
    obj.pesoLabel:setHeight(25);
    obj.pesoLabel:setColor("transparent");
    obj.pesoLabel:setStrokeColor("Gray");
    obj.pesoLabel:setStrokeSize(1);
    obj.pesoLabel:setName("pesoLabel");
    obj.pesoLabel:setVisible(true);
    obj.pesoLabel:setCornerType("round");
    obj.pesoLabel:setXradius(5);
    obj.pesoLabel:setYradius(5);

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.pesoLabel);
    obj.label158:setWidth(250);
    obj.label158:setHeight(25);
    obj.label158:setField("peso");
    obj.label158:setFontSize(16);
    obj.label158:setVertTextAlign("center");
    obj.label158:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label158, "formatFloat",  "0.## kg");
    lfm_setPropAsString(obj.label158, "fontStyle",  "bold");
    obj.label158:setFontColor("Gray");
    obj.label158:setName("label158");

    obj.pesoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pesoEdit:setParent(obj.rectangle116);
    obj.pesoEdit:setField("peso");
    obj.pesoEdit:setLeft(938);
    obj.pesoEdit:setTop(190);
    obj.pesoEdit:setWidth(250);
    obj.pesoEdit:setHeight(25);
    obj.pesoEdit:setType("float");
    obj.pesoEdit:setName("pesoEdit");
    obj.pesoEdit:setVisible(false);
    obj.pesoEdit:setFontSize(16);

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setWidth(515);
    obj.flowPart2:setHeight(382);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setAlign("top");
    obj.flowPart2:setMinScaledWidth(400);
    obj.flowPart2:setAvoidScale(true);
    obj.flowPart2:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle135 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.flowPart2);
    obj.rectangle135:setAlign("client");
    obj.rectangle135:setName("rectangle135");
    obj.rectangle135:setColor("transparent");
    obj.rectangle135:setCornerType("round");
    obj.rectangle135:setXradius(15);
    obj.rectangle135:setYradius(15);
    obj.rectangle135:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.rectangle135);
    obj.image12:setAlign("client");
    obj.image12:setStyle("stretch");
    obj.image12:setSRC("/imagens/Fundo 3.png");
    obj.image12:setOpacity(0.1);
    obj.image12:setName("image12");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.rectangle135);
    obj.label159:setLeft(157);
    obj.label159:setTop(5);
    obj.label159:setWidth(201);
    obj.label159:setHeight(25);
    obj.label159:setText("Atributos");
    obj.label159:setFontSize(20);
    obj.label159:setVertTextAlign("center");
    obj.label159:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label159, "fontStyle",  "italic");
    obj.label159:setFontColor("Gray");
    obj.label159:setFontFamily("Stencil");
    obj.label159:setName("label159");

    obj.rectangle136 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle136:setParent(obj.rectangle135);
    obj.rectangle136:setLeft(10);
    obj.rectangle136:setName("rectangle136");
    obj.rectangle136:setTop(40);
    obj.rectangle136:setWidth(55);
    obj.rectangle136:setHeight(25);
    obj.rectangle136:setColor("transparent");
    obj.rectangle136:setStrokeColor("Gray");
    obj.rectangle136:setStrokeSize(2);
    obj.rectangle136:setCornerType("round");
    obj.rectangle136:setXradius(5);
    obj.rectangle136:setYradius(5);

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.rectangle136);
    obj.label160:setVertTextAlign("center");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setWidth(55);
    obj.label160:setHeight(25);
    obj.label160:setText("ATR");
    obj.label160:setFontColor("Gray");
    obj.label160:setFontFamily("Stencil");
    obj.label160:setName("label160");

    obj.rectangle137 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle137:setParent(obj.rectangle135);
    obj.rectangle137:setLeft(65);
    obj.rectangle137:setName("rectangle137");
    obj.rectangle137:setTop(40);
    obj.rectangle137:setWidth(55);
    obj.rectangle137:setHeight(25);
    obj.rectangle137:setColor("transparent");
    obj.rectangle137:setStrokeColor("Gray");
    obj.rectangle137:setStrokeSize(2);
    obj.rectangle137:setCornerType("round");
    obj.rectangle137:setXradius(5);
    obj.rectangle137:setYradius(5);

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.rectangle137);
    obj.label161:setVertTextAlign("center");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setWidth(55);
    obj.label161:setHeight(25);
    obj.label161:setText("Base");
    obj.label161:setFontColor("Gray");
    obj.label161:setFontFamily("Stencil");
    obj.label161:setName("label161");

    obj.rectangle138 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle138:setParent(obj.rectangle135);
    obj.rectangle138:setLeft(120);
    obj.rectangle138:setName("rectangle138");
    obj.rectangle138:setTop(40);
    obj.rectangle138:setWidth(55);
    obj.rectangle138:setHeight(25);
    obj.rectangle138:setColor("transparent");
    obj.rectangle138:setStrokeColor("Gray");
    obj.rectangle138:setStrokeSize(2);
    obj.rectangle138:setCornerType("round");
    obj.rectangle138:setXradius(5);
    obj.rectangle138:setYradius(5);

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.rectangle138);
    obj.label162:setVertTextAlign("center");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setWidth(55);
    obj.label162:setHeight(25);
    obj.label162:setText("Raça");
    obj.label162:setFontColor("Gray");
    obj.label162:setFontFamily("Stencil");
    obj.label162:setName("label162");

    obj.rectangle139 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle139:setParent(obj.rectangle135);
    obj.rectangle139:setLeft(175);
    obj.rectangle139:setName("rectangle139");
    obj.rectangle139:setTop(40);
    obj.rectangle139:setWidth(55);
    obj.rectangle139:setHeight(25);
    obj.rectangle139:setColor("transparent");
    obj.rectangle139:setStrokeColor("Gray");
    obj.rectangle139:setStrokeSize(2);
    obj.rectangle139:setCornerType("round");
    obj.rectangle139:setXradius(5);
    obj.rectangle139:setYradius(5);

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.rectangle139);
    obj.label163:setVertTextAlign("center");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setWidth(55);
    obj.label163:setHeight(25);
    obj.label163:setText("Bio");
    obj.label163:setFontColor("Gray");
    obj.label163:setFontFamily("Stencil");
    obj.label163:setName("label163");

    obj.rectangle140 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle140:setParent(obj.rectangle135);
    obj.rectangle140:setLeft(230);
    obj.rectangle140:setName("rectangle140");
    obj.rectangle140:setTop(40);
    obj.rectangle140:setWidth(55);
    obj.rectangle140:setHeight(25);
    obj.rectangle140:setColor("transparent");
    obj.rectangle140:setStrokeColor("Gray");
    obj.rectangle140:setStrokeSize(2);
    obj.rectangle140:setCornerType("round");
    obj.rectangle140:setXradius(5);
    obj.rectangle140:setYradius(5);

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.rectangle140);
    obj.label164:setVertTextAlign("center");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setWidth(55);
    obj.label164:setHeight(25);
    obj.label164:setText("Classe");
    obj.label164:setFontColor("Gray");
    obj.label164:setFontFamily("Stencil");
    obj.label164:setName("label164");

    obj.rectangle141 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle141:setParent(obj.rectangle135);
    obj.rectangle141:setLeft(285);
    obj.rectangle141:setName("rectangle141");
    obj.rectangle141:setTop(40);
    obj.rectangle141:setWidth(55);
    obj.rectangle141:setHeight(25);
    obj.rectangle141:setColor("transparent");
    obj.rectangle141:setStrokeColor("Gray");
    obj.rectangle141:setStrokeSize(2);
    obj.rectangle141:setCornerType("round");
    obj.rectangle141:setXradius(5);
    obj.rectangle141:setYradius(5);

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.rectangle141);
    obj.label165:setVertTextAlign("center");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setWidth(55);
    obj.label165:setHeight(25);
    obj.label165:setText("Nível");
    obj.label165:setFontColor("Gray");
    obj.label165:setFontFamily("Stencil");
    obj.label165:setName("label165");

    obj.rectangle142 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle142:setParent(obj.rectangle135);
    obj.rectangle142:setLeft(340);
    obj.rectangle142:setName("rectangle142");
    obj.rectangle142:setTop(40);
    obj.rectangle142:setWidth(55);
    obj.rectangle142:setHeight(25);
    obj.rectangle142:setColor("transparent");
    obj.rectangle142:setStrokeColor("Gray");
    obj.rectangle142:setStrokeSize(2);
    obj.rectangle142:setCornerType("round");
    obj.rectangle142:setXradius(5);
    obj.rectangle142:setYradius(5);

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.rectangle142);
    obj.label166:setVertTextAlign("center");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setWidth(55);
    obj.label166:setHeight(25);
    obj.label166:setText("Outros");
    obj.label166:setFontColor("Gray");
    obj.label166:setFontFamily("Stencil");
    obj.label166:setName("label166");

    obj.rectangle143 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle143:setParent(obj.rectangle135);
    obj.rectangle143:setLeft(395);
    obj.rectangle143:setName("rectangle143");
    obj.rectangle143:setTop(40);
    obj.rectangle143:setWidth(55);
    obj.rectangle143:setHeight(25);
    obj.rectangle143:setColor("transparent");
    obj.rectangle143:setStrokeColor("Gray");
    obj.rectangle143:setStrokeSize(2);
    obj.rectangle143:setCornerType("round");
    obj.rectangle143:setXradius(5);
    obj.rectangle143:setYradius(5);

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.rectangle143);
    obj.label167:setVertTextAlign("center");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setWidth(55);
    obj.label167:setHeight(25);
    obj.label167:setText("Total");
    obj.label167:setFontColor("Gray");
    obj.label167:setFontFamily("Stencil");
    obj.label167:setName("label167");

    obj.rectangle144 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle144:setParent(obj.rectangle135);
    obj.rectangle144:setLeft(450);
    obj.rectangle144:setStrokeSize(3);
    obj.rectangle144:setName("rectangle144");
    obj.rectangle144:setTop(40);
    obj.rectangle144:setWidth(55);
    obj.rectangle144:setHeight(25);
    obj.rectangle144:setColor("transparent");
    obj.rectangle144:setStrokeColor("Gray");
    obj.rectangle144:setCornerType("round");
    obj.rectangle144:setXradius(5);
    obj.rectangle144:setYradius(5);

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.rectangle144);
    obj.label168:setVertTextAlign("center");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setWidth(55);
    obj.label168:setHeight(25);
    obj.label168:setText("Bônus");
    obj.label168:setFontColor("Gray");
    obj.label168:setFontFamily("Stencil");
    obj.label168:setName("label168");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle135);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(64);
    obj.layout1:setWidth(515);
    obj.layout1:setHeight(35);
    obj.layout1:setName("layout1");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout1);
    obj.button14:setLeft(5);
    obj.button14:setTop(1);
    obj.button14:setWidth(55);
    obj.button14:setText("FOR");
    obj.button14:setFontSize(16);
    obj.button14:setVertTextAlign("center");
    obj.button14:setHorzTextAlign("center");
    obj.button14:setName("button14");

    obj.ForBaseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ForBaseLabel:setParent(obj.layout1);
    obj.ForBaseLabel:setLeft(60);
    obj.ForBaseLabel:setTop(0);
    obj.ForBaseLabel:setWidth(55);
    obj.ForBaseLabel:setHeight(25);
    obj.ForBaseLabel:setColor("transparent");
    obj.ForBaseLabel:setStrokeColor("Gray");
    obj.ForBaseLabel:setStrokeSize(1);
    obj.ForBaseLabel:setName("ForBaseLabel");
    obj.ForBaseLabel:setVisible(true);
    obj.ForBaseLabel:setCornerType("round");
    obj.ForBaseLabel:setXradius(5);
    obj.ForBaseLabel:setYradius(5);

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.ForBaseLabel);
    obj.label169:setWidth(55);
    obj.label169:setHeight(25);
    obj.label169:setField("ForBase");
    obj.label169:setFontSize(16);
    obj.label169:setVertTextAlign("center");
    obj.label169:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label169, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label169, "fontStyle",  "bold");
    obj.label169:setFontColor("Gray");
    obj.label169:setName("label169");

    obj.ForBaseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForBaseEdit:setParent(obj.layout1);
    obj.ForBaseEdit:setField("ForBase");
    obj.ForBaseEdit:setLeft(60);
    obj.ForBaseEdit:setTop(0);
    obj.ForBaseEdit:setWidth(55);
    obj.ForBaseEdit:setHeight(25);
    obj.ForBaseEdit:setType("float");
    obj.ForBaseEdit:setName("ForBaseEdit");
    obj.ForBaseEdit:setVisible(false);
    obj.ForBaseEdit:setFontSize(16);

    obj.ForRacaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ForRacaLabel:setParent(obj.layout1);
    obj.ForRacaLabel:setLeft(115);
    obj.ForRacaLabel:setTop(0);
    obj.ForRacaLabel:setWidth(55);
    obj.ForRacaLabel:setHeight(25);
    obj.ForRacaLabel:setColor("transparent");
    obj.ForRacaLabel:setStrokeColor("Gray");
    obj.ForRacaLabel:setStrokeSize(1);
    obj.ForRacaLabel:setName("ForRacaLabel");
    obj.ForRacaLabel:setVisible(true);
    obj.ForRacaLabel:setCornerType("round");
    obj.ForRacaLabel:setXradius(5);
    obj.ForRacaLabel:setYradius(5);

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.ForRacaLabel);
    obj.label170:setWidth(55);
    obj.label170:setHeight(25);
    obj.label170:setField("ForRaca");
    obj.label170:setFontSize(16);
    obj.label170:setVertTextAlign("center");
    obj.label170:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label170, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label170, "fontStyle",  "bold");
    obj.label170:setFontColor("Gray");
    obj.label170:setName("label170");

    obj.ForRacaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForRacaEdit:setParent(obj.layout1);
    obj.ForRacaEdit:setField("ForRaca");
    obj.ForRacaEdit:setLeft(115);
    obj.ForRacaEdit:setTop(0);
    obj.ForRacaEdit:setWidth(55);
    obj.ForRacaEdit:setHeight(25);
    obj.ForRacaEdit:setType("float");
    obj.ForRacaEdit:setName("ForRacaEdit");
    obj.ForRacaEdit:setVisible(false);
    obj.ForRacaEdit:setFontSize(16);

    obj.ForBioLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ForBioLabel:setParent(obj.layout1);
    obj.ForBioLabel:setLeft(170);
    obj.ForBioLabel:setTop(0);
    obj.ForBioLabel:setWidth(55);
    obj.ForBioLabel:setHeight(25);
    obj.ForBioLabel:setColor("transparent");
    obj.ForBioLabel:setStrokeColor("Gray");
    obj.ForBioLabel:setStrokeSize(1);
    obj.ForBioLabel:setName("ForBioLabel");
    obj.ForBioLabel:setVisible(true);
    obj.ForBioLabel:setCornerType("round");
    obj.ForBioLabel:setXradius(5);
    obj.ForBioLabel:setYradius(5);

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.ForBioLabel);
    obj.label171:setWidth(55);
    obj.label171:setHeight(25);
    obj.label171:setField("ForBio");
    obj.label171:setFontSize(16);
    obj.label171:setVertTextAlign("center");
    obj.label171:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label171, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label171, "fontStyle",  "bold");
    obj.label171:setFontColor("Gray");
    obj.label171:setName("label171");

    obj.ForBioEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForBioEdit:setParent(obj.layout1);
    obj.ForBioEdit:setField("ForBio");
    obj.ForBioEdit:setLeft(170);
    obj.ForBioEdit:setTop(0);
    obj.ForBioEdit:setWidth(55);
    obj.ForBioEdit:setHeight(25);
    obj.ForBioEdit:setType("float");
    obj.ForBioEdit:setName("ForBioEdit");
    obj.ForBioEdit:setVisible(false);
    obj.ForBioEdit:setFontSize(16);

    obj.ForClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ForClasseLabel:setParent(obj.layout1);
    obj.ForClasseLabel:setLeft(225);
    obj.ForClasseLabel:setTop(0);
    obj.ForClasseLabel:setWidth(55);
    obj.ForClasseLabel:setHeight(25);
    obj.ForClasseLabel:setColor("transparent");
    obj.ForClasseLabel:setStrokeColor("Gray");
    obj.ForClasseLabel:setStrokeSize(1);
    obj.ForClasseLabel:setName("ForClasseLabel");
    obj.ForClasseLabel:setVisible(true);
    obj.ForClasseLabel:setCornerType("round");
    obj.ForClasseLabel:setXradius(5);
    obj.ForClasseLabel:setYradius(5);

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.ForClasseLabel);
    obj.label172:setWidth(55);
    obj.label172:setHeight(25);
    obj.label172:setField("ForClasse");
    obj.label172:setFontSize(16);
    obj.label172:setVertTextAlign("center");
    obj.label172:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label172, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label172, "fontStyle",  "bold");
    obj.label172:setFontColor("Gray");
    obj.label172:setName("label172");

    obj.ForClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForClasseEdit:setParent(obj.layout1);
    obj.ForClasseEdit:setField("ForClasse");
    obj.ForClasseEdit:setLeft(225);
    obj.ForClasseEdit:setTop(0);
    obj.ForClasseEdit:setWidth(55);
    obj.ForClasseEdit:setHeight(25);
    obj.ForClasseEdit:setType("float");
    obj.ForClasseEdit:setName("ForClasseEdit");
    obj.ForClasseEdit:setVisible(false);
    obj.ForClasseEdit:setFontSize(16);

    obj.ForNivelLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ForNivelLabel:setParent(obj.layout1);
    obj.ForNivelLabel:setLeft(280);
    obj.ForNivelLabel:setTop(0);
    obj.ForNivelLabel:setWidth(55);
    obj.ForNivelLabel:setHeight(25);
    obj.ForNivelLabel:setColor("transparent");
    obj.ForNivelLabel:setStrokeColor("Gray");
    obj.ForNivelLabel:setStrokeSize(1);
    obj.ForNivelLabel:setName("ForNivelLabel");
    obj.ForNivelLabel:setVisible(true);
    obj.ForNivelLabel:setCornerType("round");
    obj.ForNivelLabel:setXradius(5);
    obj.ForNivelLabel:setYradius(5);

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.ForNivelLabel);
    obj.label173:setWidth(55);
    obj.label173:setHeight(25);
    obj.label173:setField("ForNivel");
    obj.label173:setFontSize(16);
    obj.label173:setVertTextAlign("center");
    obj.label173:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label173, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label173, "fontStyle",  "bold");
    obj.label173:setFontColor("Gray");
    obj.label173:setName("label173");

    obj.ForNivelEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForNivelEdit:setParent(obj.layout1);
    obj.ForNivelEdit:setField("ForNivel");
    obj.ForNivelEdit:setLeft(280);
    obj.ForNivelEdit:setTop(0);
    obj.ForNivelEdit:setWidth(55);
    obj.ForNivelEdit:setHeight(25);
    obj.ForNivelEdit:setType("float");
    obj.ForNivelEdit:setName("ForNivelEdit");
    obj.ForNivelEdit:setVisible(false);
    obj.ForNivelEdit:setFontSize(16);

    obj.ForOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ForOutrosLabel:setParent(obj.layout1);
    obj.ForOutrosLabel:setLeft(335);
    obj.ForOutrosLabel:setTop(0);
    obj.ForOutrosLabel:setWidth(55);
    obj.ForOutrosLabel:setHeight(25);
    obj.ForOutrosLabel:setColor("transparent");
    obj.ForOutrosLabel:setStrokeColor("Gray");
    obj.ForOutrosLabel:setStrokeSize(1);
    obj.ForOutrosLabel:setName("ForOutrosLabel");
    obj.ForOutrosLabel:setVisible(true);
    obj.ForOutrosLabel:setCornerType("round");
    obj.ForOutrosLabel:setXradius(5);
    obj.ForOutrosLabel:setYradius(5);

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.ForOutrosLabel);
    obj.label174:setWidth(55);
    obj.label174:setHeight(25);
    obj.label174:setField("ForOutros");
    obj.label174:setFontSize(16);
    obj.label174:setVertTextAlign("center");
    obj.label174:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label174, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label174, "fontStyle",  "bold");
    obj.label174:setFontColor("Gray");
    obj.label174:setName("label174");

    obj.ForOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForOutrosEdit:setParent(obj.layout1);
    obj.ForOutrosEdit:setField("ForOutros");
    obj.ForOutrosEdit:setLeft(335);
    obj.ForOutrosEdit:setTop(0);
    obj.ForOutrosEdit:setWidth(55);
    obj.ForOutrosEdit:setHeight(25);
    obj.ForOutrosEdit:setType("float");
    obj.ForOutrosEdit:setName("ForOutrosEdit");
    obj.ForOutrosEdit:setVisible(false);
    obj.ForOutrosEdit:setFontSize(16);

    obj.rectangle145 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle145:setParent(obj.layout1);
    obj.rectangle145:setLeft(390);
    obj.rectangle145:setTop(0);
    obj.rectangle145:setWidth(55);
    obj.rectangle145:setHeight(25);
    obj.rectangle145:setColor("transparent");
    obj.rectangle145:setStrokeColor("Gray");
    obj.rectangle145:setStrokeSize(1);
    obj.rectangle145:setVisible(true);
    obj.rectangle145:setOpacity(1);
    obj.rectangle145:setCornerType("round");
    obj.rectangle145:setXradius(5);
    obj.rectangle145:setYradius(5);
    obj.rectangle145:setName("rectangle145");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.rectangle145);
    obj.label175:setWidth(55);
    obj.label175:setHeight(25);
    obj.label175:setField("ForTotal");
    obj.label175:setFontSize(16);
    lfm_setPropAsString(obj.label175, "fontStyle",  "bold");
    obj.label175:setFontColor("Gray");
    obj.label175:setVertTextAlign("center");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.rectangle146 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle146:setParent(obj.layout1);
    obj.rectangle146:setLeft(445);
    obj.rectangle146:setTop(0);
    obj.rectangle146:setWidth(55);
    obj.rectangle146:setHeight(25);
    obj.rectangle146:setColor("transparent");
    obj.rectangle146:setStrokeColor("Gray");
    obj.rectangle146:setStrokeSize(3);
    obj.rectangle146:setVisible(true);
    obj.rectangle146:setOpacity(1);
    obj.rectangle146:setCornerType("round");
    obj.rectangle146:setXradius(5);
    obj.rectangle146:setYradius(5);
    obj.rectangle146:setName("rectangle146");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.rectangle146);
    obj.label176:setWidth(55);
    obj.label176:setHeight(25);
    obj.label176:setField("Forbonus");
    obj.label176:setFontSize(16);
    lfm_setPropAsString(obj.label176, "fontStyle",  "bold");
    obj.label176:setFontColor("Gray");
    obj.label176:setVertTextAlign("center");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setFields({'ForBase', 'ForRaca', 'ForBio', 'ForClasse', 'ForNivel', 'ForOutros'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setField("ForTotal");
    obj.dataLink3:setName("dataLink3");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle135);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(89);
    obj.layout2:setWidth(515);
    obj.layout2:setHeight(35);
    obj.layout2:setName("layout2");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout2);
    obj.button15:setLeft(5);
    obj.button15:setTop(1);
    obj.button15:setWidth(55);
    obj.button15:setText("DES");
    obj.button15:setFontSize(16);
    obj.button15:setVertTextAlign("center");
    obj.button15:setHorzTextAlign("center");
    obj.button15:setName("button15");

    obj.DesBaseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DesBaseLabel:setParent(obj.layout2);
    obj.DesBaseLabel:setLeft(60);
    obj.DesBaseLabel:setTop(0);
    obj.DesBaseLabel:setWidth(55);
    obj.DesBaseLabel:setHeight(25);
    obj.DesBaseLabel:setColor("transparent");
    obj.DesBaseLabel:setStrokeColor("Gray");
    obj.DesBaseLabel:setStrokeSize(1);
    obj.DesBaseLabel:setName("DesBaseLabel");
    obj.DesBaseLabel:setVisible(true);
    obj.DesBaseLabel:setCornerType("round");
    obj.DesBaseLabel:setXradius(5);
    obj.DesBaseLabel:setYradius(5);

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.DesBaseLabel);
    obj.label177:setWidth(55);
    obj.label177:setHeight(25);
    obj.label177:setField("DesBase");
    obj.label177:setFontSize(16);
    obj.label177:setVertTextAlign("center");
    obj.label177:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label177, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label177, "fontStyle",  "bold");
    obj.label177:setFontColor("Gray");
    obj.label177:setName("label177");

    obj.DesBaseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.DesBaseEdit:setParent(obj.layout2);
    obj.DesBaseEdit:setField("DesBase");
    obj.DesBaseEdit:setLeft(60);
    obj.DesBaseEdit:setTop(0);
    obj.DesBaseEdit:setWidth(55);
    obj.DesBaseEdit:setHeight(25);
    obj.DesBaseEdit:setType("float");
    obj.DesBaseEdit:setName("DesBaseEdit");
    obj.DesBaseEdit:setVisible(false);
    obj.DesBaseEdit:setFontSize(16);

    obj.DesRacaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DesRacaLabel:setParent(obj.layout2);
    obj.DesRacaLabel:setLeft(115);
    obj.DesRacaLabel:setTop(0);
    obj.DesRacaLabel:setWidth(55);
    obj.DesRacaLabel:setHeight(25);
    obj.DesRacaLabel:setColor("transparent");
    obj.DesRacaLabel:setStrokeColor("Gray");
    obj.DesRacaLabel:setStrokeSize(1);
    obj.DesRacaLabel:setName("DesRacaLabel");
    obj.DesRacaLabel:setVisible(true);
    obj.DesRacaLabel:setCornerType("round");
    obj.DesRacaLabel:setXradius(5);
    obj.DesRacaLabel:setYradius(5);

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.DesRacaLabel);
    obj.label178:setWidth(55);
    obj.label178:setHeight(25);
    obj.label178:setField("DesRaca");
    obj.label178:setFontSize(16);
    obj.label178:setVertTextAlign("center");
    obj.label178:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label178, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label178, "fontStyle",  "bold");
    obj.label178:setFontColor("Gray");
    obj.label178:setName("label178");

    obj.DesRacaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.DesRacaEdit:setParent(obj.layout2);
    obj.DesRacaEdit:setField("DesRaca");
    obj.DesRacaEdit:setLeft(115);
    obj.DesRacaEdit:setTop(0);
    obj.DesRacaEdit:setWidth(55);
    obj.DesRacaEdit:setHeight(25);
    obj.DesRacaEdit:setType("float");
    obj.DesRacaEdit:setName("DesRacaEdit");
    obj.DesRacaEdit:setVisible(false);
    obj.DesRacaEdit:setFontSize(16);

    obj.DesBioLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DesBioLabel:setParent(obj.layout2);
    obj.DesBioLabel:setLeft(170);
    obj.DesBioLabel:setTop(0);
    obj.DesBioLabel:setWidth(55);
    obj.DesBioLabel:setHeight(25);
    obj.DesBioLabel:setColor("transparent");
    obj.DesBioLabel:setStrokeColor("Gray");
    obj.DesBioLabel:setStrokeSize(1);
    obj.DesBioLabel:setName("DesBioLabel");
    obj.DesBioLabel:setVisible(true);
    obj.DesBioLabel:setCornerType("round");
    obj.DesBioLabel:setXradius(5);
    obj.DesBioLabel:setYradius(5);

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.DesBioLabel);
    obj.label179:setWidth(55);
    obj.label179:setHeight(25);
    obj.label179:setField("DesBio");
    obj.label179:setFontSize(16);
    obj.label179:setVertTextAlign("center");
    obj.label179:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label179, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label179, "fontStyle",  "bold");
    obj.label179:setFontColor("Gray");
    obj.label179:setName("label179");

    obj.DesBioEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.DesBioEdit:setParent(obj.layout2);
    obj.DesBioEdit:setField("DesBio");
    obj.DesBioEdit:setLeft(170);
    obj.DesBioEdit:setTop(0);
    obj.DesBioEdit:setWidth(55);
    obj.DesBioEdit:setHeight(25);
    obj.DesBioEdit:setType("float");
    obj.DesBioEdit:setName("DesBioEdit");
    obj.DesBioEdit:setVisible(false);
    obj.DesBioEdit:setFontSize(16);

    obj.DesClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DesClasseLabel:setParent(obj.layout2);
    obj.DesClasseLabel:setLeft(225);
    obj.DesClasseLabel:setTop(0);
    obj.DesClasseLabel:setWidth(55);
    obj.DesClasseLabel:setHeight(25);
    obj.DesClasseLabel:setColor("transparent");
    obj.DesClasseLabel:setStrokeColor("Gray");
    obj.DesClasseLabel:setStrokeSize(1);
    obj.DesClasseLabel:setName("DesClasseLabel");
    obj.DesClasseLabel:setVisible(true);
    obj.DesClasseLabel:setCornerType("round");
    obj.DesClasseLabel:setXradius(5);
    obj.DesClasseLabel:setYradius(5);

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.DesClasseLabel);
    obj.label180:setWidth(55);
    obj.label180:setHeight(25);
    obj.label180:setField("DesClasse");
    obj.label180:setFontSize(16);
    obj.label180:setVertTextAlign("center");
    obj.label180:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label180, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label180, "fontStyle",  "bold");
    obj.label180:setFontColor("Gray");
    obj.label180:setName("label180");

    obj.DesClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.DesClasseEdit:setParent(obj.layout2);
    obj.DesClasseEdit:setField("DesClasse");
    obj.DesClasseEdit:setLeft(225);
    obj.DesClasseEdit:setTop(0);
    obj.DesClasseEdit:setWidth(55);
    obj.DesClasseEdit:setHeight(25);
    obj.DesClasseEdit:setType("float");
    obj.DesClasseEdit:setName("DesClasseEdit");
    obj.DesClasseEdit:setVisible(false);
    obj.DesClasseEdit:setFontSize(16);

    obj.DesNivelLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DesNivelLabel:setParent(obj.layout2);
    obj.DesNivelLabel:setLeft(280);
    obj.DesNivelLabel:setTop(0);
    obj.DesNivelLabel:setWidth(55);
    obj.DesNivelLabel:setHeight(25);
    obj.DesNivelLabel:setColor("transparent");
    obj.DesNivelLabel:setStrokeColor("Gray");
    obj.DesNivelLabel:setStrokeSize(1);
    obj.DesNivelLabel:setName("DesNivelLabel");
    obj.DesNivelLabel:setVisible(true);
    obj.DesNivelLabel:setCornerType("round");
    obj.DesNivelLabel:setXradius(5);
    obj.DesNivelLabel:setYradius(5);

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.DesNivelLabel);
    obj.label181:setWidth(55);
    obj.label181:setHeight(25);
    obj.label181:setField("DesNivel");
    obj.label181:setFontSize(16);
    obj.label181:setVertTextAlign("center");
    obj.label181:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label181, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label181, "fontStyle",  "bold");
    obj.label181:setFontColor("Gray");
    obj.label181:setName("label181");

    obj.DesNivelEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.DesNivelEdit:setParent(obj.layout2);
    obj.DesNivelEdit:setField("DesNivel");
    obj.DesNivelEdit:setLeft(280);
    obj.DesNivelEdit:setTop(0);
    obj.DesNivelEdit:setWidth(55);
    obj.DesNivelEdit:setHeight(25);
    obj.DesNivelEdit:setType("float");
    obj.DesNivelEdit:setName("DesNivelEdit");
    obj.DesNivelEdit:setVisible(false);
    obj.DesNivelEdit:setFontSize(16);

    obj.DesOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DesOutrosLabel:setParent(obj.layout2);
    obj.DesOutrosLabel:setLeft(335);
    obj.DesOutrosLabel:setTop(0);
    obj.DesOutrosLabel:setWidth(55);
    obj.DesOutrosLabel:setHeight(25);
    obj.DesOutrosLabel:setColor("transparent");
    obj.DesOutrosLabel:setStrokeColor("Gray");
    obj.DesOutrosLabel:setStrokeSize(1);
    obj.DesOutrosLabel:setName("DesOutrosLabel");
    obj.DesOutrosLabel:setVisible(true);
    obj.DesOutrosLabel:setCornerType("round");
    obj.DesOutrosLabel:setXradius(5);
    obj.DesOutrosLabel:setYradius(5);

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.DesOutrosLabel);
    obj.label182:setWidth(55);
    obj.label182:setHeight(25);
    obj.label182:setField("DesOutros");
    obj.label182:setFontSize(16);
    obj.label182:setVertTextAlign("center");
    obj.label182:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label182, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label182, "fontStyle",  "bold");
    obj.label182:setFontColor("Gray");
    obj.label182:setName("label182");

    obj.DesOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.DesOutrosEdit:setParent(obj.layout2);
    obj.DesOutrosEdit:setField("DesOutros");
    obj.DesOutrosEdit:setLeft(335);
    obj.DesOutrosEdit:setTop(0);
    obj.DesOutrosEdit:setWidth(55);
    obj.DesOutrosEdit:setHeight(25);
    obj.DesOutrosEdit:setType("float");
    obj.DesOutrosEdit:setName("DesOutrosEdit");
    obj.DesOutrosEdit:setVisible(false);
    obj.DesOutrosEdit:setFontSize(16);

    obj.rectangle147 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle147:setParent(obj.layout2);
    obj.rectangle147:setLeft(390);
    obj.rectangle147:setTop(0);
    obj.rectangle147:setWidth(55);
    obj.rectangle147:setHeight(25);
    obj.rectangle147:setColor("transparent");
    obj.rectangle147:setStrokeColor("Gray");
    obj.rectangle147:setStrokeSize(1);
    obj.rectangle147:setVisible(true);
    obj.rectangle147:setOpacity(1);
    obj.rectangle147:setCornerType("round");
    obj.rectangle147:setXradius(5);
    obj.rectangle147:setYradius(5);
    obj.rectangle147:setName("rectangle147");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.rectangle147);
    obj.label183:setWidth(55);
    obj.label183:setHeight(25);
    obj.label183:setField("DesTotal");
    obj.label183:setFontSize(16);
    lfm_setPropAsString(obj.label183, "fontStyle",  "bold");
    obj.label183:setFontColor("Gray");
    obj.label183:setVertTextAlign("center");
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.rectangle148 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle148:setParent(obj.layout2);
    obj.rectangle148:setLeft(445);
    obj.rectangle148:setTop(0);
    obj.rectangle148:setWidth(55);
    obj.rectangle148:setHeight(25);
    obj.rectangle148:setColor("transparent");
    obj.rectangle148:setStrokeColor("Gray");
    obj.rectangle148:setStrokeSize(3);
    obj.rectangle148:setVisible(true);
    obj.rectangle148:setOpacity(1);
    obj.rectangle148:setCornerType("round");
    obj.rectangle148:setXradius(5);
    obj.rectangle148:setYradius(5);
    obj.rectangle148:setName("rectangle148");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.rectangle148);
    obj.label184:setWidth(55);
    obj.label184:setHeight(25);
    obj.label184:setField("Desbonus");
    obj.label184:setFontSize(16);
    lfm_setPropAsString(obj.label184, "fontStyle",  "bold");
    obj.label184:setFontColor("Gray");
    obj.label184:setVertTextAlign("center");
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout2);
    obj.dataLink4:setFields({'DesBase', 'DesRaca', 'DesBio', 'DesClasse', 'DesNivel', 'DesOutros'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout2);
    obj.dataLink5:setField("DesTotal");
    obj.dataLink5:setName("dataLink5");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle135);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(114);
    obj.layout3:setWidth(515);
    obj.layout3:setHeight(35);
    obj.layout3:setName("layout3");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout3);
    obj.button16:setLeft(5);
    obj.button16:setTop(1);
    obj.button16:setWidth(55);
    obj.button16:setText("CON");
    obj.button16:setFontSize(16);
    obj.button16:setVertTextAlign("center");
    obj.button16:setHorzTextAlign("center");
    obj.button16:setName("button16");

    obj.ConBaseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ConBaseLabel:setParent(obj.layout3);
    obj.ConBaseLabel:setLeft(60);
    obj.ConBaseLabel:setTop(0);
    obj.ConBaseLabel:setWidth(55);
    obj.ConBaseLabel:setHeight(25);
    obj.ConBaseLabel:setColor("transparent");
    obj.ConBaseLabel:setStrokeColor("Gray");
    obj.ConBaseLabel:setStrokeSize(1);
    obj.ConBaseLabel:setName("ConBaseLabel");
    obj.ConBaseLabel:setVisible(true);
    obj.ConBaseLabel:setCornerType("round");
    obj.ConBaseLabel:setXradius(5);
    obj.ConBaseLabel:setYradius(5);

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.ConBaseLabel);
    obj.label185:setWidth(55);
    obj.label185:setHeight(25);
    obj.label185:setField("ConBase");
    obj.label185:setFontSize(16);
    obj.label185:setVertTextAlign("center");
    obj.label185:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label185, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label185, "fontStyle",  "bold");
    obj.label185:setFontColor("Gray");
    obj.label185:setName("label185");

    obj.ConBaseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ConBaseEdit:setParent(obj.layout3);
    obj.ConBaseEdit:setField("ConBase");
    obj.ConBaseEdit:setLeft(60);
    obj.ConBaseEdit:setTop(0);
    obj.ConBaseEdit:setWidth(55);
    obj.ConBaseEdit:setHeight(25);
    obj.ConBaseEdit:setType("float");
    obj.ConBaseEdit:setName("ConBaseEdit");
    obj.ConBaseEdit:setVisible(false);
    obj.ConBaseEdit:setFontSize(16);

    obj.ConRacaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ConRacaLabel:setParent(obj.layout3);
    obj.ConRacaLabel:setLeft(115);
    obj.ConRacaLabel:setTop(0);
    obj.ConRacaLabel:setWidth(55);
    obj.ConRacaLabel:setHeight(25);
    obj.ConRacaLabel:setColor("transparent");
    obj.ConRacaLabel:setStrokeColor("Gray");
    obj.ConRacaLabel:setStrokeSize(1);
    obj.ConRacaLabel:setName("ConRacaLabel");
    obj.ConRacaLabel:setVisible(true);
    obj.ConRacaLabel:setCornerType("round");
    obj.ConRacaLabel:setXradius(5);
    obj.ConRacaLabel:setYradius(5);

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.ConRacaLabel);
    obj.label186:setWidth(55);
    obj.label186:setHeight(25);
    obj.label186:setField("ConRaca");
    obj.label186:setFontSize(16);
    obj.label186:setVertTextAlign("center");
    obj.label186:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label186, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label186, "fontStyle",  "bold");
    obj.label186:setFontColor("Gray");
    obj.label186:setName("label186");

    obj.ConRacaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ConRacaEdit:setParent(obj.layout3);
    obj.ConRacaEdit:setField("ConRaca");
    obj.ConRacaEdit:setLeft(115);
    obj.ConRacaEdit:setTop(0);
    obj.ConRacaEdit:setWidth(55);
    obj.ConRacaEdit:setHeight(25);
    obj.ConRacaEdit:setType("float");
    obj.ConRacaEdit:setName("ConRacaEdit");
    obj.ConRacaEdit:setVisible(false);
    obj.ConRacaEdit:setFontSize(16);

    obj.ConBioLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ConBioLabel:setParent(obj.layout3);
    obj.ConBioLabel:setLeft(170);
    obj.ConBioLabel:setTop(0);
    obj.ConBioLabel:setWidth(55);
    obj.ConBioLabel:setHeight(25);
    obj.ConBioLabel:setColor("transparent");
    obj.ConBioLabel:setStrokeColor("Gray");
    obj.ConBioLabel:setStrokeSize(1);
    obj.ConBioLabel:setName("ConBioLabel");
    obj.ConBioLabel:setVisible(true);
    obj.ConBioLabel:setCornerType("round");
    obj.ConBioLabel:setXradius(5);
    obj.ConBioLabel:setYradius(5);

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.ConBioLabel);
    obj.label187:setWidth(55);
    obj.label187:setHeight(25);
    obj.label187:setField("ConBio");
    obj.label187:setFontSize(16);
    obj.label187:setVertTextAlign("center");
    obj.label187:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label187, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label187, "fontStyle",  "bold");
    obj.label187:setFontColor("Gray");
    obj.label187:setName("label187");

    obj.ConBioEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ConBioEdit:setParent(obj.layout3);
    obj.ConBioEdit:setField("ConBio");
    obj.ConBioEdit:setLeft(170);
    obj.ConBioEdit:setTop(0);
    obj.ConBioEdit:setWidth(55);
    obj.ConBioEdit:setHeight(25);
    obj.ConBioEdit:setType("float");
    obj.ConBioEdit:setName("ConBioEdit");
    obj.ConBioEdit:setVisible(false);
    obj.ConBioEdit:setFontSize(16);

    obj.ConClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ConClasseLabel:setParent(obj.layout3);
    obj.ConClasseLabel:setLeft(225);
    obj.ConClasseLabel:setTop(0);
    obj.ConClasseLabel:setWidth(55);
    obj.ConClasseLabel:setHeight(25);
    obj.ConClasseLabel:setColor("transparent");
    obj.ConClasseLabel:setStrokeColor("Gray");
    obj.ConClasseLabel:setStrokeSize(1);
    obj.ConClasseLabel:setName("ConClasseLabel");
    obj.ConClasseLabel:setVisible(true);
    obj.ConClasseLabel:setCornerType("round");
    obj.ConClasseLabel:setXradius(5);
    obj.ConClasseLabel:setYradius(5);

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.ConClasseLabel);
    obj.label188:setWidth(55);
    obj.label188:setHeight(25);
    obj.label188:setField("ConClasse");
    obj.label188:setFontSize(16);
    obj.label188:setVertTextAlign("center");
    obj.label188:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label188, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label188, "fontStyle",  "bold");
    obj.label188:setFontColor("Gray");
    obj.label188:setName("label188");

    obj.ConClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ConClasseEdit:setParent(obj.layout3);
    obj.ConClasseEdit:setField("ConClasse");
    obj.ConClasseEdit:setLeft(225);
    obj.ConClasseEdit:setTop(0);
    obj.ConClasseEdit:setWidth(55);
    obj.ConClasseEdit:setHeight(25);
    obj.ConClasseEdit:setType("float");
    obj.ConClasseEdit:setName("ConClasseEdit");
    obj.ConClasseEdit:setVisible(false);
    obj.ConClasseEdit:setFontSize(16);

    obj.ConNivelLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ConNivelLabel:setParent(obj.layout3);
    obj.ConNivelLabel:setLeft(280);
    obj.ConNivelLabel:setTop(0);
    obj.ConNivelLabel:setWidth(55);
    obj.ConNivelLabel:setHeight(25);
    obj.ConNivelLabel:setColor("transparent");
    obj.ConNivelLabel:setStrokeColor("Gray");
    obj.ConNivelLabel:setStrokeSize(1);
    obj.ConNivelLabel:setName("ConNivelLabel");
    obj.ConNivelLabel:setVisible(true);
    obj.ConNivelLabel:setCornerType("round");
    obj.ConNivelLabel:setXradius(5);
    obj.ConNivelLabel:setYradius(5);

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.ConNivelLabel);
    obj.label189:setWidth(55);
    obj.label189:setHeight(25);
    obj.label189:setField("ConNivel");
    obj.label189:setFontSize(16);
    obj.label189:setVertTextAlign("center");
    obj.label189:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label189, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label189, "fontStyle",  "bold");
    obj.label189:setFontColor("Gray");
    obj.label189:setName("label189");

    obj.ConNivelEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ConNivelEdit:setParent(obj.layout3);
    obj.ConNivelEdit:setField("ConNivel");
    obj.ConNivelEdit:setLeft(280);
    obj.ConNivelEdit:setTop(0);
    obj.ConNivelEdit:setWidth(55);
    obj.ConNivelEdit:setHeight(25);
    obj.ConNivelEdit:setType("float");
    obj.ConNivelEdit:setName("ConNivelEdit");
    obj.ConNivelEdit:setVisible(false);
    obj.ConNivelEdit:setFontSize(16);

    obj.ConOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ConOutrosLabel:setParent(obj.layout3);
    obj.ConOutrosLabel:setLeft(335);
    obj.ConOutrosLabel:setTop(0);
    obj.ConOutrosLabel:setWidth(55);
    obj.ConOutrosLabel:setHeight(25);
    obj.ConOutrosLabel:setColor("transparent");
    obj.ConOutrosLabel:setStrokeColor("Gray");
    obj.ConOutrosLabel:setStrokeSize(1);
    obj.ConOutrosLabel:setName("ConOutrosLabel");
    obj.ConOutrosLabel:setVisible(true);
    obj.ConOutrosLabel:setCornerType("round");
    obj.ConOutrosLabel:setXradius(5);
    obj.ConOutrosLabel:setYradius(5);

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.ConOutrosLabel);
    obj.label190:setWidth(55);
    obj.label190:setHeight(25);
    obj.label190:setField("ConOutros");
    obj.label190:setFontSize(16);
    obj.label190:setVertTextAlign("center");
    obj.label190:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label190, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label190, "fontStyle",  "bold");
    obj.label190:setFontColor("Gray");
    obj.label190:setName("label190");

    obj.ConOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ConOutrosEdit:setParent(obj.layout3);
    obj.ConOutrosEdit:setField("ConOutros");
    obj.ConOutrosEdit:setLeft(335);
    obj.ConOutrosEdit:setTop(0);
    obj.ConOutrosEdit:setWidth(55);
    obj.ConOutrosEdit:setHeight(25);
    obj.ConOutrosEdit:setType("float");
    obj.ConOutrosEdit:setName("ConOutrosEdit");
    obj.ConOutrosEdit:setVisible(false);
    obj.ConOutrosEdit:setFontSize(16);

    obj.rectangle149 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle149:setParent(obj.layout3);
    obj.rectangle149:setLeft(390);
    obj.rectangle149:setTop(0);
    obj.rectangle149:setWidth(55);
    obj.rectangle149:setHeight(25);
    obj.rectangle149:setColor("transparent");
    obj.rectangle149:setStrokeColor("Gray");
    obj.rectangle149:setStrokeSize(1);
    obj.rectangle149:setVisible(true);
    obj.rectangle149:setOpacity(1);
    obj.rectangle149:setCornerType("round");
    obj.rectangle149:setXradius(5);
    obj.rectangle149:setYradius(5);
    obj.rectangle149:setName("rectangle149");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.rectangle149);
    obj.label191:setWidth(55);
    obj.label191:setHeight(25);
    obj.label191:setField("ConTotal");
    obj.label191:setFontSize(16);
    lfm_setPropAsString(obj.label191, "fontStyle",  "bold");
    obj.label191:setFontColor("Gray");
    obj.label191:setVertTextAlign("center");
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.rectangle150 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle150:setParent(obj.layout3);
    obj.rectangle150:setLeft(445);
    obj.rectangle150:setTop(0);
    obj.rectangle150:setWidth(55);
    obj.rectangle150:setHeight(25);
    obj.rectangle150:setColor("transparent");
    obj.rectangle150:setStrokeColor("Gray");
    obj.rectangle150:setStrokeSize(3);
    obj.rectangle150:setVisible(true);
    obj.rectangle150:setOpacity(1);
    obj.rectangle150:setCornerType("round");
    obj.rectangle150:setXradius(5);
    obj.rectangle150:setYradius(5);
    obj.rectangle150:setName("rectangle150");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.rectangle150);
    obj.label192:setWidth(55);
    obj.label192:setHeight(25);
    obj.label192:setField("Conbonus");
    obj.label192:setFontSize(16);
    lfm_setPropAsString(obj.label192, "fontStyle",  "bold");
    obj.label192:setFontColor("Gray");
    obj.label192:setVertTextAlign("center");
    obj.label192:setHorzTextAlign("center");
    obj.label192:setName("label192");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout3);
    obj.dataLink6:setFields({'ConBase', 'ConRaca', 'ConBio', 'ConClasse', 'ConNivel', 'ConOutros'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout3);
    obj.dataLink7:setField("ConTotal");
    obj.dataLink7:setName("dataLink7");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle135);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(139);
    obj.layout4:setWidth(515);
    obj.layout4:setHeight(35);
    obj.layout4:setName("layout4");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout4);
    obj.button17:setLeft(5);
    obj.button17:setTop(1);
    obj.button17:setWidth(55);
    obj.button17:setText("INT");
    obj.button17:setFontSize(16);
    obj.button17:setVertTextAlign("center");
    obj.button17:setHorzTextAlign("center");
    obj.button17:setName("button17");

    obj.IntBaseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.IntBaseLabel:setParent(obj.layout4);
    obj.IntBaseLabel:setLeft(60);
    obj.IntBaseLabel:setTop(0);
    obj.IntBaseLabel:setWidth(55);
    obj.IntBaseLabel:setHeight(25);
    obj.IntBaseLabel:setColor("transparent");
    obj.IntBaseLabel:setStrokeColor("Gray");
    obj.IntBaseLabel:setStrokeSize(1);
    obj.IntBaseLabel:setName("IntBaseLabel");
    obj.IntBaseLabel:setVisible(true);
    obj.IntBaseLabel:setCornerType("round");
    obj.IntBaseLabel:setXradius(5);
    obj.IntBaseLabel:setYradius(5);

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.IntBaseLabel);
    obj.label193:setWidth(55);
    obj.label193:setHeight(25);
    obj.label193:setField("IntBase");
    obj.label193:setFontSize(16);
    obj.label193:setVertTextAlign("center");
    obj.label193:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label193, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label193, "fontStyle",  "bold");
    obj.label193:setFontColor("Gray");
    obj.label193:setName("label193");

    obj.IntBaseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.IntBaseEdit:setParent(obj.layout4);
    obj.IntBaseEdit:setField("IntBase");
    obj.IntBaseEdit:setLeft(60);
    obj.IntBaseEdit:setTop(0);
    obj.IntBaseEdit:setWidth(55);
    obj.IntBaseEdit:setHeight(25);
    obj.IntBaseEdit:setType("float");
    obj.IntBaseEdit:setName("IntBaseEdit");
    obj.IntBaseEdit:setVisible(false);
    obj.IntBaseEdit:setFontSize(16);

    obj.IntRacaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.IntRacaLabel:setParent(obj.layout4);
    obj.IntRacaLabel:setLeft(115);
    obj.IntRacaLabel:setTop(0);
    obj.IntRacaLabel:setWidth(55);
    obj.IntRacaLabel:setHeight(25);
    obj.IntRacaLabel:setColor("transparent");
    obj.IntRacaLabel:setStrokeColor("Gray");
    obj.IntRacaLabel:setStrokeSize(1);
    obj.IntRacaLabel:setName("IntRacaLabel");
    obj.IntRacaLabel:setVisible(true);
    obj.IntRacaLabel:setCornerType("round");
    obj.IntRacaLabel:setXradius(5);
    obj.IntRacaLabel:setYradius(5);

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.IntRacaLabel);
    obj.label194:setWidth(55);
    obj.label194:setHeight(25);
    obj.label194:setField("IntRaca");
    obj.label194:setFontSize(16);
    obj.label194:setVertTextAlign("center");
    obj.label194:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label194, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label194, "fontStyle",  "bold");
    obj.label194:setFontColor("Gray");
    obj.label194:setName("label194");

    obj.IntRacaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.IntRacaEdit:setParent(obj.layout4);
    obj.IntRacaEdit:setField("IntRaca");
    obj.IntRacaEdit:setLeft(115);
    obj.IntRacaEdit:setTop(0);
    obj.IntRacaEdit:setWidth(55);
    obj.IntRacaEdit:setHeight(25);
    obj.IntRacaEdit:setType("float");
    obj.IntRacaEdit:setName("IntRacaEdit");
    obj.IntRacaEdit:setVisible(false);
    obj.IntRacaEdit:setFontSize(16);

    obj.IntBioLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.IntBioLabel:setParent(obj.layout4);
    obj.IntBioLabel:setLeft(170);
    obj.IntBioLabel:setTop(0);
    obj.IntBioLabel:setWidth(55);
    obj.IntBioLabel:setHeight(25);
    obj.IntBioLabel:setColor("transparent");
    obj.IntBioLabel:setStrokeColor("Gray");
    obj.IntBioLabel:setStrokeSize(1);
    obj.IntBioLabel:setName("IntBioLabel");
    obj.IntBioLabel:setVisible(true);
    obj.IntBioLabel:setCornerType("round");
    obj.IntBioLabel:setXradius(5);
    obj.IntBioLabel:setYradius(5);

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.IntBioLabel);
    obj.label195:setWidth(55);
    obj.label195:setHeight(25);
    obj.label195:setField("IntBio");
    obj.label195:setFontSize(16);
    obj.label195:setVertTextAlign("center");
    obj.label195:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label195, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label195, "fontStyle",  "bold");
    obj.label195:setFontColor("Gray");
    obj.label195:setName("label195");

    obj.IntBioEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.IntBioEdit:setParent(obj.layout4);
    obj.IntBioEdit:setField("IntBio");
    obj.IntBioEdit:setLeft(170);
    obj.IntBioEdit:setTop(0);
    obj.IntBioEdit:setWidth(55);
    obj.IntBioEdit:setHeight(25);
    obj.IntBioEdit:setType("float");
    obj.IntBioEdit:setName("IntBioEdit");
    obj.IntBioEdit:setVisible(false);
    obj.IntBioEdit:setFontSize(16);

    obj.IntClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.IntClasseLabel:setParent(obj.layout4);
    obj.IntClasseLabel:setLeft(225);
    obj.IntClasseLabel:setTop(0);
    obj.IntClasseLabel:setWidth(55);
    obj.IntClasseLabel:setHeight(25);
    obj.IntClasseLabel:setColor("transparent");
    obj.IntClasseLabel:setStrokeColor("Gray");
    obj.IntClasseLabel:setStrokeSize(1);
    obj.IntClasseLabel:setName("IntClasseLabel");
    obj.IntClasseLabel:setVisible(true);
    obj.IntClasseLabel:setCornerType("round");
    obj.IntClasseLabel:setXradius(5);
    obj.IntClasseLabel:setYradius(5);

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.IntClasseLabel);
    obj.label196:setWidth(55);
    obj.label196:setHeight(25);
    obj.label196:setField("IntClasse");
    obj.label196:setFontSize(16);
    obj.label196:setVertTextAlign("center");
    obj.label196:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label196, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label196, "fontStyle",  "bold");
    obj.label196:setFontColor("Gray");
    obj.label196:setName("label196");

    obj.IntClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.IntClasseEdit:setParent(obj.layout4);
    obj.IntClasseEdit:setField("IntClasse");
    obj.IntClasseEdit:setLeft(225);
    obj.IntClasseEdit:setTop(0);
    obj.IntClasseEdit:setWidth(55);
    obj.IntClasseEdit:setHeight(25);
    obj.IntClasseEdit:setType("float");
    obj.IntClasseEdit:setName("IntClasseEdit");
    obj.IntClasseEdit:setVisible(false);
    obj.IntClasseEdit:setFontSize(16);

    obj.IntNivelLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.IntNivelLabel:setParent(obj.layout4);
    obj.IntNivelLabel:setLeft(280);
    obj.IntNivelLabel:setTop(0);
    obj.IntNivelLabel:setWidth(55);
    obj.IntNivelLabel:setHeight(25);
    obj.IntNivelLabel:setColor("transparent");
    obj.IntNivelLabel:setStrokeColor("Gray");
    obj.IntNivelLabel:setStrokeSize(1);
    obj.IntNivelLabel:setName("IntNivelLabel");
    obj.IntNivelLabel:setVisible(true);
    obj.IntNivelLabel:setCornerType("round");
    obj.IntNivelLabel:setXradius(5);
    obj.IntNivelLabel:setYradius(5);

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.IntNivelLabel);
    obj.label197:setWidth(55);
    obj.label197:setHeight(25);
    obj.label197:setField("IntNivel");
    obj.label197:setFontSize(16);
    obj.label197:setVertTextAlign("center");
    obj.label197:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label197, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label197, "fontStyle",  "bold");
    obj.label197:setFontColor("Gray");
    obj.label197:setName("label197");

    obj.IntNivelEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.IntNivelEdit:setParent(obj.layout4);
    obj.IntNivelEdit:setField("IntNivel");
    obj.IntNivelEdit:setLeft(280);
    obj.IntNivelEdit:setTop(0);
    obj.IntNivelEdit:setWidth(55);
    obj.IntNivelEdit:setHeight(25);
    obj.IntNivelEdit:setType("float");
    obj.IntNivelEdit:setName("IntNivelEdit");
    obj.IntNivelEdit:setVisible(false);
    obj.IntNivelEdit:setFontSize(16);

    obj.IntOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.IntOutrosLabel:setParent(obj.layout4);
    obj.IntOutrosLabel:setLeft(335);
    obj.IntOutrosLabel:setTop(0);
    obj.IntOutrosLabel:setWidth(55);
    obj.IntOutrosLabel:setHeight(25);
    obj.IntOutrosLabel:setColor("transparent");
    obj.IntOutrosLabel:setStrokeColor("Gray");
    obj.IntOutrosLabel:setStrokeSize(1);
    obj.IntOutrosLabel:setName("IntOutrosLabel");
    obj.IntOutrosLabel:setVisible(true);
    obj.IntOutrosLabel:setCornerType("round");
    obj.IntOutrosLabel:setXradius(5);
    obj.IntOutrosLabel:setYradius(5);

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.IntOutrosLabel);
    obj.label198:setWidth(55);
    obj.label198:setHeight(25);
    obj.label198:setField("IntOutros");
    obj.label198:setFontSize(16);
    obj.label198:setVertTextAlign("center");
    obj.label198:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label198, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label198, "fontStyle",  "bold");
    obj.label198:setFontColor("Gray");
    obj.label198:setName("label198");

    obj.IntOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.IntOutrosEdit:setParent(obj.layout4);
    obj.IntOutrosEdit:setField("IntOutros");
    obj.IntOutrosEdit:setLeft(335);
    obj.IntOutrosEdit:setTop(0);
    obj.IntOutrosEdit:setWidth(55);
    obj.IntOutrosEdit:setHeight(25);
    obj.IntOutrosEdit:setType("float");
    obj.IntOutrosEdit:setName("IntOutrosEdit");
    obj.IntOutrosEdit:setVisible(false);
    obj.IntOutrosEdit:setFontSize(16);

    obj.rectangle151 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle151:setParent(obj.layout4);
    obj.rectangle151:setLeft(390);
    obj.rectangle151:setTop(0);
    obj.rectangle151:setWidth(55);
    obj.rectangle151:setHeight(25);
    obj.rectangle151:setColor("transparent");
    obj.rectangle151:setStrokeColor("Gray");
    obj.rectangle151:setStrokeSize(1);
    obj.rectangle151:setVisible(true);
    obj.rectangle151:setOpacity(1);
    obj.rectangle151:setCornerType("round");
    obj.rectangle151:setXradius(5);
    obj.rectangle151:setYradius(5);
    obj.rectangle151:setName("rectangle151");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.rectangle151);
    obj.label199:setWidth(55);
    obj.label199:setHeight(25);
    obj.label199:setField("IntTotal");
    obj.label199:setFontSize(16);
    lfm_setPropAsString(obj.label199, "fontStyle",  "bold");
    obj.label199:setFontColor("Gray");
    obj.label199:setVertTextAlign("center");
    obj.label199:setHorzTextAlign("center");
    obj.label199:setName("label199");

    obj.rectangle152 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle152:setParent(obj.layout4);
    obj.rectangle152:setLeft(445);
    obj.rectangle152:setTop(0);
    obj.rectangle152:setWidth(55);
    obj.rectangle152:setHeight(25);
    obj.rectangle152:setColor("transparent");
    obj.rectangle152:setStrokeColor("Gray");
    obj.rectangle152:setStrokeSize(3);
    obj.rectangle152:setVisible(true);
    obj.rectangle152:setOpacity(1);
    obj.rectangle152:setCornerType("round");
    obj.rectangle152:setXradius(5);
    obj.rectangle152:setYradius(5);
    obj.rectangle152:setName("rectangle152");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.rectangle152);
    obj.label200:setWidth(55);
    obj.label200:setHeight(25);
    obj.label200:setField("Intbonus");
    obj.label200:setFontSize(16);
    lfm_setPropAsString(obj.label200, "fontStyle",  "bold");
    obj.label200:setFontColor("Gray");
    obj.label200:setVertTextAlign("center");
    obj.label200:setHorzTextAlign("center");
    obj.label200:setName("label200");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout4);
    obj.dataLink8:setFields({'IntBase', 'IntRaca', 'IntBio', 'IntClasse', 'IntNivel', 'IntOutros'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout4);
    obj.dataLink9:setField("IntTotal");
    obj.dataLink9:setName("dataLink9");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle135);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(164);
    obj.layout5:setWidth(515);
    obj.layout5:setHeight(35);
    obj.layout5:setName("layout5");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout5);
    obj.button18:setLeft(5);
    obj.button18:setTop(1);
    obj.button18:setWidth(55);
    obj.button18:setText("SAB");
    obj.button18:setFontSize(16);
    obj.button18:setVertTextAlign("center");
    obj.button18:setHorzTextAlign("center");
    obj.button18:setName("button18");

    obj.SabBaseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.SabBaseLabel:setParent(obj.layout5);
    obj.SabBaseLabel:setLeft(60);
    obj.SabBaseLabel:setTop(0);
    obj.SabBaseLabel:setWidth(55);
    obj.SabBaseLabel:setHeight(25);
    obj.SabBaseLabel:setColor("transparent");
    obj.SabBaseLabel:setStrokeColor("Gray");
    obj.SabBaseLabel:setStrokeSize(1);
    obj.SabBaseLabel:setName("SabBaseLabel");
    obj.SabBaseLabel:setVisible(true);
    obj.SabBaseLabel:setCornerType("round");
    obj.SabBaseLabel:setXradius(5);
    obj.SabBaseLabel:setYradius(5);

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.SabBaseLabel);
    obj.label201:setWidth(55);
    obj.label201:setHeight(25);
    obj.label201:setField("SabBase");
    obj.label201:setFontSize(16);
    obj.label201:setVertTextAlign("center");
    obj.label201:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label201, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label201, "fontStyle",  "bold");
    obj.label201:setFontColor("Gray");
    obj.label201:setName("label201");

    obj.SabBaseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.SabBaseEdit:setParent(obj.layout5);
    obj.SabBaseEdit:setField("SabBase");
    obj.SabBaseEdit:setLeft(60);
    obj.SabBaseEdit:setTop(0);
    obj.SabBaseEdit:setWidth(55);
    obj.SabBaseEdit:setHeight(25);
    obj.SabBaseEdit:setType("float");
    obj.SabBaseEdit:setName("SabBaseEdit");
    obj.SabBaseEdit:setVisible(false);
    obj.SabBaseEdit:setFontSize(16);

    obj.SabRacaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.SabRacaLabel:setParent(obj.layout5);
    obj.SabRacaLabel:setLeft(115);
    obj.SabRacaLabel:setTop(0);
    obj.SabRacaLabel:setWidth(55);
    obj.SabRacaLabel:setHeight(25);
    obj.SabRacaLabel:setColor("transparent");
    obj.SabRacaLabel:setStrokeColor("Gray");
    obj.SabRacaLabel:setStrokeSize(1);
    obj.SabRacaLabel:setName("SabRacaLabel");
    obj.SabRacaLabel:setVisible(true);
    obj.SabRacaLabel:setCornerType("round");
    obj.SabRacaLabel:setXradius(5);
    obj.SabRacaLabel:setYradius(5);

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.SabRacaLabel);
    obj.label202:setWidth(55);
    obj.label202:setHeight(25);
    obj.label202:setField("SabRaca");
    obj.label202:setFontSize(16);
    obj.label202:setVertTextAlign("center");
    obj.label202:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label202, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label202, "fontStyle",  "bold");
    obj.label202:setFontColor("Gray");
    obj.label202:setName("label202");

    obj.SabRacaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.SabRacaEdit:setParent(obj.layout5);
    obj.SabRacaEdit:setField("SabRaca");
    obj.SabRacaEdit:setLeft(115);
    obj.SabRacaEdit:setTop(0);
    obj.SabRacaEdit:setWidth(55);
    obj.SabRacaEdit:setHeight(25);
    obj.SabRacaEdit:setType("float");
    obj.SabRacaEdit:setName("SabRacaEdit");
    obj.SabRacaEdit:setVisible(false);
    obj.SabRacaEdit:setFontSize(16);

    obj.SabBioLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.SabBioLabel:setParent(obj.layout5);
    obj.SabBioLabel:setLeft(170);
    obj.SabBioLabel:setTop(0);
    obj.SabBioLabel:setWidth(55);
    obj.SabBioLabel:setHeight(25);
    obj.SabBioLabel:setColor("transparent");
    obj.SabBioLabel:setStrokeColor("Gray");
    obj.SabBioLabel:setStrokeSize(1);
    obj.SabBioLabel:setName("SabBioLabel");
    obj.SabBioLabel:setVisible(true);
    obj.SabBioLabel:setCornerType("round");
    obj.SabBioLabel:setXradius(5);
    obj.SabBioLabel:setYradius(5);

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.SabBioLabel);
    obj.label203:setWidth(55);
    obj.label203:setHeight(25);
    obj.label203:setField("SabBio");
    obj.label203:setFontSize(16);
    obj.label203:setVertTextAlign("center");
    obj.label203:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label203, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label203, "fontStyle",  "bold");
    obj.label203:setFontColor("Gray");
    obj.label203:setName("label203");

    obj.SabBioEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.SabBioEdit:setParent(obj.layout5);
    obj.SabBioEdit:setField("SabBio");
    obj.SabBioEdit:setLeft(170);
    obj.SabBioEdit:setTop(0);
    obj.SabBioEdit:setWidth(55);
    obj.SabBioEdit:setHeight(25);
    obj.SabBioEdit:setType("float");
    obj.SabBioEdit:setName("SabBioEdit");
    obj.SabBioEdit:setVisible(false);
    obj.SabBioEdit:setFontSize(16);

    obj.SabClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.SabClasseLabel:setParent(obj.layout5);
    obj.SabClasseLabel:setLeft(225);
    obj.SabClasseLabel:setTop(0);
    obj.SabClasseLabel:setWidth(55);
    obj.SabClasseLabel:setHeight(25);
    obj.SabClasseLabel:setColor("transparent");
    obj.SabClasseLabel:setStrokeColor("Gray");
    obj.SabClasseLabel:setStrokeSize(1);
    obj.SabClasseLabel:setName("SabClasseLabel");
    obj.SabClasseLabel:setVisible(true);
    obj.SabClasseLabel:setCornerType("round");
    obj.SabClasseLabel:setXradius(5);
    obj.SabClasseLabel:setYradius(5);

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.SabClasseLabel);
    obj.label204:setWidth(55);
    obj.label204:setHeight(25);
    obj.label204:setField("SabClasse");
    obj.label204:setFontSize(16);
    obj.label204:setVertTextAlign("center");
    obj.label204:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label204, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label204, "fontStyle",  "bold");
    obj.label204:setFontColor("Gray");
    obj.label204:setName("label204");

    obj.SabClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.SabClasseEdit:setParent(obj.layout5);
    obj.SabClasseEdit:setField("SabClasse");
    obj.SabClasseEdit:setLeft(225);
    obj.SabClasseEdit:setTop(0);
    obj.SabClasseEdit:setWidth(55);
    obj.SabClasseEdit:setHeight(25);
    obj.SabClasseEdit:setType("float");
    obj.SabClasseEdit:setName("SabClasseEdit");
    obj.SabClasseEdit:setVisible(false);
    obj.SabClasseEdit:setFontSize(16);

    obj.SabNivelLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.SabNivelLabel:setParent(obj.layout5);
    obj.SabNivelLabel:setLeft(280);
    obj.SabNivelLabel:setTop(0);
    obj.SabNivelLabel:setWidth(55);
    obj.SabNivelLabel:setHeight(25);
    obj.SabNivelLabel:setColor("transparent");
    obj.SabNivelLabel:setStrokeColor("Gray");
    obj.SabNivelLabel:setStrokeSize(1);
    obj.SabNivelLabel:setName("SabNivelLabel");
    obj.SabNivelLabel:setVisible(true);
    obj.SabNivelLabel:setCornerType("round");
    obj.SabNivelLabel:setXradius(5);
    obj.SabNivelLabel:setYradius(5);

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.SabNivelLabel);
    obj.label205:setWidth(55);
    obj.label205:setHeight(25);
    obj.label205:setField("SabNivel");
    obj.label205:setFontSize(16);
    obj.label205:setVertTextAlign("center");
    obj.label205:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label205, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label205, "fontStyle",  "bold");
    obj.label205:setFontColor("Gray");
    obj.label205:setName("label205");

    obj.SabNivelEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.SabNivelEdit:setParent(obj.layout5);
    obj.SabNivelEdit:setField("SabNivel");
    obj.SabNivelEdit:setLeft(280);
    obj.SabNivelEdit:setTop(0);
    obj.SabNivelEdit:setWidth(55);
    obj.SabNivelEdit:setHeight(25);
    obj.SabNivelEdit:setType("float");
    obj.SabNivelEdit:setName("SabNivelEdit");
    obj.SabNivelEdit:setVisible(false);
    obj.SabNivelEdit:setFontSize(16);

    obj.SabOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.SabOutrosLabel:setParent(obj.layout5);
    obj.SabOutrosLabel:setLeft(335);
    obj.SabOutrosLabel:setTop(0);
    obj.SabOutrosLabel:setWidth(55);
    obj.SabOutrosLabel:setHeight(25);
    obj.SabOutrosLabel:setColor("transparent");
    obj.SabOutrosLabel:setStrokeColor("Gray");
    obj.SabOutrosLabel:setStrokeSize(1);
    obj.SabOutrosLabel:setName("SabOutrosLabel");
    obj.SabOutrosLabel:setVisible(true);
    obj.SabOutrosLabel:setCornerType("round");
    obj.SabOutrosLabel:setXradius(5);
    obj.SabOutrosLabel:setYradius(5);

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.SabOutrosLabel);
    obj.label206:setWidth(55);
    obj.label206:setHeight(25);
    obj.label206:setField("SabOutros");
    obj.label206:setFontSize(16);
    obj.label206:setVertTextAlign("center");
    obj.label206:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label206, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label206, "fontStyle",  "bold");
    obj.label206:setFontColor("Gray");
    obj.label206:setName("label206");

    obj.SabOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.SabOutrosEdit:setParent(obj.layout5);
    obj.SabOutrosEdit:setField("SabOutros");
    obj.SabOutrosEdit:setLeft(335);
    obj.SabOutrosEdit:setTop(0);
    obj.SabOutrosEdit:setWidth(55);
    obj.SabOutrosEdit:setHeight(25);
    obj.SabOutrosEdit:setType("float");
    obj.SabOutrosEdit:setName("SabOutrosEdit");
    obj.SabOutrosEdit:setVisible(false);
    obj.SabOutrosEdit:setFontSize(16);

    obj.rectangle153 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle153:setParent(obj.layout5);
    obj.rectangle153:setLeft(390);
    obj.rectangle153:setTop(0);
    obj.rectangle153:setWidth(55);
    obj.rectangle153:setHeight(25);
    obj.rectangle153:setColor("transparent");
    obj.rectangle153:setStrokeColor("Gray");
    obj.rectangle153:setStrokeSize(1);
    obj.rectangle153:setVisible(true);
    obj.rectangle153:setOpacity(1);
    obj.rectangle153:setCornerType("round");
    obj.rectangle153:setXradius(5);
    obj.rectangle153:setYradius(5);
    obj.rectangle153:setName("rectangle153");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.rectangle153);
    obj.label207:setWidth(55);
    obj.label207:setHeight(25);
    obj.label207:setField("SabTotal");
    obj.label207:setFontSize(16);
    lfm_setPropAsString(obj.label207, "fontStyle",  "bold");
    obj.label207:setFontColor("Gray");
    obj.label207:setVertTextAlign("center");
    obj.label207:setHorzTextAlign("center");
    obj.label207:setName("label207");

    obj.rectangle154 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle154:setParent(obj.layout5);
    obj.rectangle154:setLeft(445);
    obj.rectangle154:setTop(0);
    obj.rectangle154:setWidth(55);
    obj.rectangle154:setHeight(25);
    obj.rectangle154:setColor("transparent");
    obj.rectangle154:setStrokeColor("Gray");
    obj.rectangle154:setStrokeSize(3);
    obj.rectangle154:setVisible(true);
    obj.rectangle154:setOpacity(1);
    obj.rectangle154:setCornerType("round");
    obj.rectangle154:setXradius(5);
    obj.rectangle154:setYradius(5);
    obj.rectangle154:setName("rectangle154");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.rectangle154);
    obj.label208:setWidth(55);
    obj.label208:setHeight(25);
    obj.label208:setField("Sabbonus");
    obj.label208:setFontSize(16);
    lfm_setPropAsString(obj.label208, "fontStyle",  "bold");
    obj.label208:setFontColor("Gray");
    obj.label208:setVertTextAlign("center");
    obj.label208:setHorzTextAlign("center");
    obj.label208:setName("label208");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout5);
    obj.dataLink10:setFields({'SabBase', 'SabRaca', 'SabBio', 'SabClasse', 'SabNivel', 'SabOutros'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout5);
    obj.dataLink11:setField("SabTotal");
    obj.dataLink11:setName("dataLink11");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle135);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(189);
    obj.layout6:setWidth(515);
    obj.layout6:setHeight(35);
    obj.layout6:setName("layout6");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout6);
    obj.button19:setLeft(5);
    obj.button19:setTop(1);
    obj.button19:setWidth(55);
    obj.button19:setText("CAR");
    obj.button19:setFontSize(16);
    obj.button19:setVertTextAlign("center");
    obj.button19:setHorzTextAlign("center");
    obj.button19:setName("button19");

    obj.CarBaseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CarBaseLabel:setParent(obj.layout6);
    obj.CarBaseLabel:setLeft(60);
    obj.CarBaseLabel:setTop(0);
    obj.CarBaseLabel:setWidth(55);
    obj.CarBaseLabel:setHeight(25);
    obj.CarBaseLabel:setColor("transparent");
    obj.CarBaseLabel:setStrokeColor("Gray");
    obj.CarBaseLabel:setStrokeSize(1);
    obj.CarBaseLabel:setName("CarBaseLabel");
    obj.CarBaseLabel:setVisible(true);
    obj.CarBaseLabel:setCornerType("round");
    obj.CarBaseLabel:setXradius(5);
    obj.CarBaseLabel:setYradius(5);

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.CarBaseLabel);
    obj.label209:setWidth(55);
    obj.label209:setHeight(25);
    obj.label209:setField("CarBase");
    obj.label209:setFontSize(16);
    obj.label209:setVertTextAlign("center");
    obj.label209:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label209, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label209, "fontStyle",  "bold");
    obj.label209:setFontColor("Gray");
    obj.label209:setName("label209");

    obj.CarBaseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarBaseEdit:setParent(obj.layout6);
    obj.CarBaseEdit:setField("CarBase");
    obj.CarBaseEdit:setLeft(60);
    obj.CarBaseEdit:setTop(0);
    obj.CarBaseEdit:setWidth(55);
    obj.CarBaseEdit:setHeight(25);
    obj.CarBaseEdit:setType("float");
    obj.CarBaseEdit:setName("CarBaseEdit");
    obj.CarBaseEdit:setVisible(false);
    obj.CarBaseEdit:setFontSize(16);

    obj.CarRacaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CarRacaLabel:setParent(obj.layout6);
    obj.CarRacaLabel:setLeft(115);
    obj.CarRacaLabel:setTop(0);
    obj.CarRacaLabel:setWidth(55);
    obj.CarRacaLabel:setHeight(25);
    obj.CarRacaLabel:setColor("transparent");
    obj.CarRacaLabel:setStrokeColor("Gray");
    obj.CarRacaLabel:setStrokeSize(1);
    obj.CarRacaLabel:setName("CarRacaLabel");
    obj.CarRacaLabel:setVisible(true);
    obj.CarRacaLabel:setCornerType("round");
    obj.CarRacaLabel:setXradius(5);
    obj.CarRacaLabel:setYradius(5);

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.CarRacaLabel);
    obj.label210:setWidth(55);
    obj.label210:setHeight(25);
    obj.label210:setField("CarRaca");
    obj.label210:setFontSize(16);
    obj.label210:setVertTextAlign("center");
    obj.label210:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label210, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label210, "fontStyle",  "bold");
    obj.label210:setFontColor("Gray");
    obj.label210:setName("label210");

    obj.CarRacaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarRacaEdit:setParent(obj.layout6);
    obj.CarRacaEdit:setField("CarRaca");
    obj.CarRacaEdit:setLeft(115);
    obj.CarRacaEdit:setTop(0);
    obj.CarRacaEdit:setWidth(55);
    obj.CarRacaEdit:setHeight(25);
    obj.CarRacaEdit:setType("float");
    obj.CarRacaEdit:setName("CarRacaEdit");
    obj.CarRacaEdit:setVisible(false);
    obj.CarRacaEdit:setFontSize(16);

    obj.CarBioLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CarBioLabel:setParent(obj.layout6);
    obj.CarBioLabel:setLeft(170);
    obj.CarBioLabel:setTop(0);
    obj.CarBioLabel:setWidth(55);
    obj.CarBioLabel:setHeight(25);
    obj.CarBioLabel:setColor("transparent");
    obj.CarBioLabel:setStrokeColor("Gray");
    obj.CarBioLabel:setStrokeSize(1);
    obj.CarBioLabel:setName("CarBioLabel");
    obj.CarBioLabel:setVisible(true);
    obj.CarBioLabel:setCornerType("round");
    obj.CarBioLabel:setXradius(5);
    obj.CarBioLabel:setYradius(5);

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.CarBioLabel);
    obj.label211:setWidth(55);
    obj.label211:setHeight(25);
    obj.label211:setField("CarBio");
    obj.label211:setFontSize(16);
    obj.label211:setVertTextAlign("center");
    obj.label211:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label211, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label211, "fontStyle",  "bold");
    obj.label211:setFontColor("Gray");
    obj.label211:setName("label211");

    obj.CarBioEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarBioEdit:setParent(obj.layout6);
    obj.CarBioEdit:setField("CarBio");
    obj.CarBioEdit:setLeft(170);
    obj.CarBioEdit:setTop(0);
    obj.CarBioEdit:setWidth(55);
    obj.CarBioEdit:setHeight(25);
    obj.CarBioEdit:setType("float");
    obj.CarBioEdit:setName("CarBioEdit");
    obj.CarBioEdit:setVisible(false);
    obj.CarBioEdit:setFontSize(16);

    obj.CarClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CarClasseLabel:setParent(obj.layout6);
    obj.CarClasseLabel:setLeft(225);
    obj.CarClasseLabel:setTop(0);
    obj.CarClasseLabel:setWidth(55);
    obj.CarClasseLabel:setHeight(25);
    obj.CarClasseLabel:setColor("transparent");
    obj.CarClasseLabel:setStrokeColor("Gray");
    obj.CarClasseLabel:setStrokeSize(1);
    obj.CarClasseLabel:setName("CarClasseLabel");
    obj.CarClasseLabel:setVisible(true);
    obj.CarClasseLabel:setCornerType("round");
    obj.CarClasseLabel:setXradius(5);
    obj.CarClasseLabel:setYradius(5);

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.CarClasseLabel);
    obj.label212:setWidth(55);
    obj.label212:setHeight(25);
    obj.label212:setField("CarClasse");
    obj.label212:setFontSize(16);
    obj.label212:setVertTextAlign("center");
    obj.label212:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label212, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label212, "fontStyle",  "bold");
    obj.label212:setFontColor("Gray");
    obj.label212:setName("label212");

    obj.CarClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarClasseEdit:setParent(obj.layout6);
    obj.CarClasseEdit:setField("CarClasse");
    obj.CarClasseEdit:setLeft(225);
    obj.CarClasseEdit:setTop(0);
    obj.CarClasseEdit:setWidth(55);
    obj.CarClasseEdit:setHeight(25);
    obj.CarClasseEdit:setType("float");
    obj.CarClasseEdit:setName("CarClasseEdit");
    obj.CarClasseEdit:setVisible(false);
    obj.CarClasseEdit:setFontSize(16);

    obj.CarNivelLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CarNivelLabel:setParent(obj.layout6);
    obj.CarNivelLabel:setLeft(280);
    obj.CarNivelLabel:setTop(0);
    obj.CarNivelLabel:setWidth(55);
    obj.CarNivelLabel:setHeight(25);
    obj.CarNivelLabel:setColor("transparent");
    obj.CarNivelLabel:setStrokeColor("Gray");
    obj.CarNivelLabel:setStrokeSize(1);
    obj.CarNivelLabel:setName("CarNivelLabel");
    obj.CarNivelLabel:setVisible(true);
    obj.CarNivelLabel:setCornerType("round");
    obj.CarNivelLabel:setXradius(5);
    obj.CarNivelLabel:setYradius(5);

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.CarNivelLabel);
    obj.label213:setWidth(55);
    obj.label213:setHeight(25);
    obj.label213:setField("CarNivel");
    obj.label213:setFontSize(16);
    obj.label213:setVertTextAlign("center");
    obj.label213:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label213, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label213, "fontStyle",  "bold");
    obj.label213:setFontColor("Gray");
    obj.label213:setName("label213");

    obj.CarNivelEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarNivelEdit:setParent(obj.layout6);
    obj.CarNivelEdit:setField("CarNivel");
    obj.CarNivelEdit:setLeft(280);
    obj.CarNivelEdit:setTop(0);
    obj.CarNivelEdit:setWidth(55);
    obj.CarNivelEdit:setHeight(25);
    obj.CarNivelEdit:setType("float");
    obj.CarNivelEdit:setName("CarNivelEdit");
    obj.CarNivelEdit:setVisible(false);
    obj.CarNivelEdit:setFontSize(16);

    obj.CarOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CarOutrosLabel:setParent(obj.layout6);
    obj.CarOutrosLabel:setLeft(335);
    obj.CarOutrosLabel:setTop(0);
    obj.CarOutrosLabel:setWidth(55);
    obj.CarOutrosLabel:setHeight(25);
    obj.CarOutrosLabel:setColor("transparent");
    obj.CarOutrosLabel:setStrokeColor("Gray");
    obj.CarOutrosLabel:setStrokeSize(1);
    obj.CarOutrosLabel:setName("CarOutrosLabel");
    obj.CarOutrosLabel:setVisible(true);
    obj.CarOutrosLabel:setCornerType("round");
    obj.CarOutrosLabel:setXradius(5);
    obj.CarOutrosLabel:setYradius(5);

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.CarOutrosLabel);
    obj.label214:setWidth(55);
    obj.label214:setHeight(25);
    obj.label214:setField("CarOutros");
    obj.label214:setFontSize(16);
    obj.label214:setVertTextAlign("center");
    obj.label214:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label214, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label214, "fontStyle",  "bold");
    obj.label214:setFontColor("Gray");
    obj.label214:setName("label214");

    obj.CarOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarOutrosEdit:setParent(obj.layout6);
    obj.CarOutrosEdit:setField("CarOutros");
    obj.CarOutrosEdit:setLeft(335);
    obj.CarOutrosEdit:setTop(0);
    obj.CarOutrosEdit:setWidth(55);
    obj.CarOutrosEdit:setHeight(25);
    obj.CarOutrosEdit:setType("float");
    obj.CarOutrosEdit:setName("CarOutrosEdit");
    obj.CarOutrosEdit:setVisible(false);
    obj.CarOutrosEdit:setFontSize(16);

    obj.rectangle155 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle155:setParent(obj.layout6);
    obj.rectangle155:setLeft(390);
    obj.rectangle155:setTop(0);
    obj.rectangle155:setWidth(55);
    obj.rectangle155:setHeight(25);
    obj.rectangle155:setColor("transparent");
    obj.rectangle155:setStrokeColor("Gray");
    obj.rectangle155:setStrokeSize(1);
    obj.rectangle155:setVisible(true);
    obj.rectangle155:setOpacity(1);
    obj.rectangle155:setCornerType("round");
    obj.rectangle155:setXradius(5);
    obj.rectangle155:setYradius(5);
    obj.rectangle155:setName("rectangle155");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.rectangle155);
    obj.label215:setWidth(55);
    obj.label215:setHeight(25);
    obj.label215:setField("CarTotal");
    obj.label215:setFontSize(16);
    lfm_setPropAsString(obj.label215, "fontStyle",  "bold");
    obj.label215:setFontColor("Gray");
    obj.label215:setVertTextAlign("center");
    obj.label215:setHorzTextAlign("center");
    obj.label215:setName("label215");

    obj.rectangle156 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle156:setParent(obj.layout6);
    obj.rectangle156:setLeft(445);
    obj.rectangle156:setTop(0);
    obj.rectangle156:setWidth(55);
    obj.rectangle156:setHeight(25);
    obj.rectangle156:setColor("transparent");
    obj.rectangle156:setStrokeColor("Gray");
    obj.rectangle156:setStrokeSize(3);
    obj.rectangle156:setVisible(true);
    obj.rectangle156:setOpacity(1);
    obj.rectangle156:setCornerType("round");
    obj.rectangle156:setXradius(5);
    obj.rectangle156:setYradius(5);
    obj.rectangle156:setName("rectangle156");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.rectangle156);
    obj.label216:setWidth(55);
    obj.label216:setHeight(25);
    obj.label216:setField("Carbonus");
    obj.label216:setFontSize(16);
    lfm_setPropAsString(obj.label216, "fontStyle",  "bold");
    obj.label216:setFontColor("Gray");
    obj.label216:setVertTextAlign("center");
    obj.label216:setHorzTextAlign("center");
    obj.label216:setName("label216");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout6);
    obj.dataLink12:setFields({'CarBase', 'CarRaca', 'CarBio', 'CarClasse', 'CarNivel', 'CarOutros'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout6);
    obj.dataLink13:setField("CarTotal");
    obj.dataLink13:setName("dataLink13");

    obj.rectangle157 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle157:setParent(obj.rectangle135);
    obj.rectangle157:setLeft(85);
    obj.rectangle157:setTop(229);
    obj.rectangle157:setName("rectangle157");
    obj.rectangle157:setWidth(131);
    obj.rectangle157:setHeight(25);
    obj.rectangle157:setColor("transparent");
    obj.rectangle157:setStrokeColor("Gray");
    obj.rectangle157:setStrokeSize(2);
    obj.rectangle157:setCornerType("innerRound");
    obj.rectangle157:setXradius(5);
    obj.rectangle157:setYradius(5);

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.rectangle157);
    obj.label217:setWidth(131);
    obj.label217:setHeight(25);
    obj.label217:setText("Condições");
    obj.label217:setVertTextAlign("center");
    obj.label217:setHorzTextAlign("center");
    obj.label217:setFontSize(16);
    obj.label217:setFontColor("Gray");
    obj.label217:setFontFamily("Stencil");
    obj.label217:setName("label217");

    obj.condicoesLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.condicoesLabel:setParent(obj.rectangle135);
    obj.condicoesLabel:setLeft(5);
    obj.condicoesLabel:setTop(254);
    obj.condicoesLabel:setWidth(296);
    obj.condicoesLabel:setHeight(118);
    obj.condicoesLabel:setColor("transparent");
    obj.condicoesLabel:setStrokeColor("Gray");
    obj.condicoesLabel:setStrokeSize(1);
    obj.condicoesLabel:setName("condicoesLabel");
    obj.condicoesLabel:setVisible(true);
    obj.condicoesLabel:setCornerType("round");
    obj.condicoesLabel:setXradius(10);
    obj.condicoesLabel:setYradius(10);
    obj.condicoesLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.condicoesLabel);
    obj.label218:setAlign("client");
    obj.label218:setField("condicoes");
    lfm_setPropAsString(obj.label218, "fontStyle",  "bold");
    obj.label218:setFontSize(16);
    obj.label218:setHorzTextAlign("leading");
    obj.label218:setVertTextAlign("leading");
    obj.label218:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label218:setFontColor("Gray");
    obj.label218:setName("label218");

    obj.condicoesEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.condicoesEdit:setParent(obj.rectangle135);
    obj.condicoesEdit:setField("condicoes");
    obj.condicoesEdit:setLeft(5);
    obj.condicoesEdit:setTop(254);
    obj.condicoesEdit:setWidth(296);
    obj.condicoesEdit:setHeight(118);
    obj.condicoesEdit:setName("condicoesEdit");
    obj.condicoesEdit:setVisible(false);
    obj.condicoesEdit:setFontSize(16);
    obj.condicoesEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle135);
    obj.layout7:setLeft(290);
    obj.layout7:setTop(260);
    obj.layout7:setWidth(250);
    obj.layout7:setHeight(35);
    obj.layout7:setName("layout7");

    obj.rectangle158 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle158:setParent(obj.layout7);
    obj.rectangle158:setLeft(10);
    obj.rectangle158:setTop(3);
    obj.rectangle158:setWidth(105);
    obj.rectangle158:setHeight(25);
    obj.rectangle158:setColor("transparent");
    obj.rectangle158:setStrokeColor("Gray");
    obj.rectangle158:setStrokeSize(2);
    obj.rectangle158:setCornerType("bevel");
    obj.rectangle158:setXradius(5);
    obj.rectangle158:setYradius(5);
    obj.rectangle158:setName("rectangle158");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.rectangle158);
    obj.label219:setVertTextAlign("center");
    obj.label219:setHorzTextAlign("center");
    obj.label219:setWidth(105);
    obj.label219:setHeight(25);
    obj.label219:setText("Heroísmo");
    obj.label219:setFontColor("Gray");
    obj.label219:setFontFamily("Stencil");
    obj.label219:setName("label219");

    obj.rectangle159 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle159:setParent(obj.layout7);
    obj.rectangle159:setLeft(105);
    obj.rectangle159:setTop(0);
    obj.rectangle159:setWidth(109);
    obj.rectangle159:setHeight(32);
    obj.rectangle159:setColor("Gray");
    obj.rectangle159:setCornerType("round");
    obj.rectangle159:setXradius(15);
    obj.rectangle159:setYradius(15);
    obj.rectangle159:setName("rectangle159");

    obj.imageCheckBox10 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox10:setParent(obj.rectangle159);
    obj.imageCheckBox10:setLeft(7);
    obj.imageCheckBox10:setTop(3);
    obj.imageCheckBox10:setField("heroismo1");
    obj.imageCheckBox10:setWidth(25);
    obj.imageCheckBox10:setHeight(25);
    obj.imageCheckBox10:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox10:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox10:setName("imageCheckBox10");

    obj.imageCheckBox11 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox11:setParent(obj.rectangle159);
    obj.imageCheckBox11:setLeft(42);
    obj.imageCheckBox11:setTop(3);
    obj.imageCheckBox11:setField("heroismo2");
    obj.imageCheckBox11:setWidth(25);
    obj.imageCheckBox11:setHeight(25);
    obj.imageCheckBox11:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox11:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox11:setName("imageCheckBox11");

    obj.imageCheckBox12 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox12:setParent(obj.rectangle159);
    obj.imageCheckBox12:setLeft(77);
    obj.imageCheckBox12:setTop(3);
    obj.imageCheckBox12:setField("heroismo3");
    obj.imageCheckBox12:setWidth(25);
    obj.imageCheckBox12:setHeight(25);
    obj.imageCheckBox12:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox12:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox12:setName("imageCheckBox12");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle135);
    obj.layout8:setLeft(290);
    obj.layout8:setTop(297);
    obj.layout8:setWidth(250);
    obj.layout8:setHeight(35);
    obj.layout8:setName("layout8");

    obj.rectangle160 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle160:setParent(obj.layout8);
    obj.rectangle160:setLeft(10);
    obj.rectangle160:setTop(3);
    obj.rectangle160:setWidth(105);
    obj.rectangle160:setHeight(25);
    obj.rectangle160:setColor("transparent");
    obj.rectangle160:setStrokeColor("Gray");
    obj.rectangle160:setStrokeSize(2);
    obj.rectangle160:setCornerType("bevel");
    obj.rectangle160:setXradius(5);
    obj.rectangle160:setYradius(5);
    obj.rectangle160:setName("rectangle160");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.rectangle160);
    obj.label220:setVertTextAlign("center");
    obj.label220:setHorzTextAlign("center");
    obj.label220:setWidth(105);
    obj.label220:setHeight(25);
    obj.label220:setText("Ferido");
    obj.label220:setFontColor("Gray");
    obj.label220:setFontFamily("Stencil");
    obj.label220:setName("label220");

    obj.rectangle161 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle161:setParent(obj.layout8);
    obj.rectangle161:setLeft(105);
    obj.rectangle161:setTop(0);
    obj.rectangle161:setWidth(109);
    obj.rectangle161:setHeight(32);
    obj.rectangle161:setColor("Gray");
    obj.rectangle161:setCornerType("round");
    obj.rectangle161:setXradius(15);
    obj.rectangle161:setYradius(15);
    obj.rectangle161:setName("rectangle161");

    obj.imageCheckBox13 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox13:setParent(obj.rectangle161);
    obj.imageCheckBox13:setLeft(7);
    obj.imageCheckBox13:setTop(3);
    obj.imageCheckBox13:setField("ferido1");
    obj.imageCheckBox13:setWidth(25);
    obj.imageCheckBox13:setHeight(25);
    obj.imageCheckBox13:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox13:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox13:setName("imageCheckBox13");

    obj.imageCheckBox14 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox14:setParent(obj.rectangle161);
    obj.imageCheckBox14:setLeft(42);
    obj.imageCheckBox14:setTop(3);
    obj.imageCheckBox14:setField("ferido2");
    obj.imageCheckBox14:setWidth(25);
    obj.imageCheckBox14:setHeight(25);
    obj.imageCheckBox14:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox14:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox14:setName("imageCheckBox14");

    obj.imageCheckBox15 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox15:setParent(obj.rectangle161);
    obj.imageCheckBox15:setLeft(77);
    obj.imageCheckBox15:setTop(3);
    obj.imageCheckBox15:setField("ferido3");
    obj.imageCheckBox15:setWidth(25);
    obj.imageCheckBox15:setHeight(25);
    obj.imageCheckBox15:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox15:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox15:setName("imageCheckBox15");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle135);
    obj.layout9:setLeft(290);
    obj.layout9:setTop(332);
    obj.layout9:setWidth(250);
    obj.layout9:setHeight(35);
    obj.layout9:setName("layout9");

    obj.rectangle162 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle162:setParent(obj.layout9);
    obj.rectangle162:setLeft(10);
    obj.rectangle162:setTop(3);
    obj.rectangle162:setWidth(105);
    obj.rectangle162:setHeight(25);
    obj.rectangle162:setColor("transparent");
    obj.rectangle162:setStrokeColor("Gray");
    obj.rectangle162:setStrokeSize(2);
    obj.rectangle162:setCornerType("bevel");
    obj.rectangle162:setXradius(5);
    obj.rectangle162:setYradius(5);
    obj.rectangle162:setName("rectangle162");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.rectangle162);
    obj.label221:setVertTextAlign("center");
    obj.label221:setHorzTextAlign("center");
    obj.label221:setWidth(105);
    obj.label221:setHeight(25);
    obj.label221:setText("Morrendo");
    obj.label221:setFontColor("Gray");
    obj.label221:setFontFamily("Stencil");
    obj.label221:setName("label221");

    obj.rectangle163 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle163:setParent(obj.layout9);
    obj.rectangle163:setLeft(105);
    obj.rectangle163:setTop(0);
    obj.rectangle163:setWidth(109);
    obj.rectangle163:setHeight(32);
    obj.rectangle163:setColor("Gray");
    obj.rectangle163:setCornerType("round");
    obj.rectangle163:setXradius(15);
    obj.rectangle163:setYradius(15);
    obj.rectangle163:setName("rectangle163");

    obj.imageCheckBox16 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox16:setParent(obj.rectangle163);
    obj.imageCheckBox16:setLeft(7);
    obj.imageCheckBox16:setTop(3);
    obj.imageCheckBox16:setField("morrendo1");
    obj.imageCheckBox16:setWidth(25);
    obj.imageCheckBox16:setHeight(25);
    obj.imageCheckBox16:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox16:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox16:setName("imageCheckBox16");

    obj.imageCheckBox17 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox17:setParent(obj.rectangle163);
    obj.imageCheckBox17:setLeft(42);
    obj.imageCheckBox17:setTop(3);
    obj.imageCheckBox17:setField("morrendo2");
    obj.imageCheckBox17:setWidth(25);
    obj.imageCheckBox17:setHeight(25);
    obj.imageCheckBox17:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox17:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox17:setName("imageCheckBox17");

    obj.imageCheckBox18 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox18:setParent(obj.rectangle163);
    obj.imageCheckBox18:setLeft(77);
    obj.imageCheckBox18:setTop(3);
    obj.imageCheckBox18:setField("morrendo3");
    obj.imageCheckBox18:setWidth(25);
    obj.imageCheckBox18:setHeight(25);
    obj.imageCheckBox18:setImageChecked("/imagens/checked.png");
    obj.imageCheckBox18:setImageUnchecked("/imagens/unchecked.png");
    obj.imageCheckBox18:setName("imageCheckBox18");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle135);
    obj.dataLink14:setFields({'morrendo1', 'morrendo2', 'morrendo3'});
    obj.dataLink14:setName("dataLink14");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setWidth(295);
    obj.flowPart3:setHeight(382);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setAlign("top");
    obj.flowPart3:setMinScaledWidth(400);
    obj.flowPart3:setAvoidScale(true);
    obj.flowPart3:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle164 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle164:setParent(obj.flowPart3);
    obj.rectangle164:setAlign("client");
    obj.rectangle164:setName("rectangle164");
    obj.rectangle164:setColor("transparent");
    obj.rectangle164:setCornerType("round");
    obj.rectangle164:setXradius(15);
    obj.rectangle164:setYradius(15);
    obj.rectangle164:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.rectangle164);
    obj.image13:setAlign("client");
    obj.image13:setStyle("stretch");
    obj.image13:setSRC("/imagens/Fundo 3.png");
    obj.image13:setOpacity(0.1);
    obj.image13:setName("image13");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.rectangle164);
    obj.label222:setLeft(0);
    obj.label222:setTop(5);
    obj.label222:setWidth(295);
    obj.label222:setHeight(25);
    obj.label222:setText("Testes");
    obj.label222:setFontSize(20);
    obj.label222:setVertTextAlign("center");
    obj.label222:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label222, "fontStyle",  "italic");
    obj.label222:setFontColor("Gray");
    obj.label222:setFontFamily("Stencil");
    obj.label222:setName("label222");

    obj.rectangle165 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle165:setParent(obj.rectangle164);
    obj.rectangle165:setLeft(10);
    obj.rectangle165:setTop(64);
    obj.rectangle165:setName("rectangle165");
    obj.rectangle165:setWidth(55);
    obj.rectangle165:setHeight(25);
    obj.rectangle165:setColor("transparent");
    obj.rectangle165:setStrokeColor("Gray");
    obj.rectangle165:setStrokeSize(2);
    obj.rectangle165:setCornerType("round");
    obj.rectangle165:setXradius(5);
    obj.rectangle165:setYradius(5);

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.rectangle165);
    obj.label223:setVertTextAlign("center");
    obj.label223:setHorzTextAlign("center");
    obj.label223:setWidth(55);
    obj.label223:setHeight(25);
    obj.label223:setText("Teste");
    obj.label223:setFontColor("Gray");
    obj.label223:setFontFamily("Stencil");
    obj.label223:setName("label223");

    obj.rectangle166 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle166:setParent(obj.rectangle164);
    obj.rectangle166:setLeft(65);
    obj.rectangle166:setTop(64);
    obj.rectangle166:setName("rectangle166");
    obj.rectangle166:setWidth(55);
    obj.rectangle166:setHeight(25);
    obj.rectangle166:setColor("transparent");
    obj.rectangle166:setStrokeColor("Gray");
    obj.rectangle166:setStrokeSize(2);
    obj.rectangle166:setCornerType("round");
    obj.rectangle166:setXradius(5);
    obj.rectangle166:setYradius(5);

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.rectangle166);
    obj.label224:setVertTextAlign("center");
    obj.label224:setHorzTextAlign("center");
    obj.label224:setWidth(55);
    obj.label224:setHeight(25);
    obj.label224:setText("ATR");
    obj.label224:setFontColor("Gray");
    obj.label224:setFontFamily("Stencil");
    obj.label224:setName("label224");

    obj.rectangle167 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle167:setParent(obj.rectangle164);
    obj.rectangle167:setLeft(120);
    obj.rectangle167:setTop(64);
    obj.rectangle167:setName("rectangle167");
    obj.rectangle167:setWidth(55);
    obj.rectangle167:setHeight(25);
    obj.rectangle167:setColor("transparent");
    obj.rectangle167:setStrokeColor("Gray");
    obj.rectangle167:setStrokeSize(2);
    obj.rectangle167:setCornerType("round");
    obj.rectangle167:setXradius(5);
    obj.rectangle167:setYradius(5);

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.rectangle167);
    obj.label225:setVertTextAlign("center");
    obj.label225:setHorzTextAlign("center");
    obj.label225:setWidth(55);
    obj.label225:setHeight(25);
    obj.label225:setText("Prof");
    obj.label225:setFontColor("Gray");
    obj.label225:setFontFamily("Stencil");
    obj.label225:setName("label225");

    obj.rectangle168 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle168:setParent(obj.rectangle164);
    obj.rectangle168:setLeft(175);
    obj.rectangle168:setTop(64);
    obj.rectangle168:setName("rectangle168");
    obj.rectangle168:setWidth(55);
    obj.rectangle168:setHeight(25);
    obj.rectangle168:setColor("transparent");
    obj.rectangle168:setStrokeColor("Gray");
    obj.rectangle168:setStrokeSize(2);
    obj.rectangle168:setCornerType("round");
    obj.rectangle168:setXradius(5);
    obj.rectangle168:setYradius(5);

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.rectangle168);
    obj.label226:setVertTextAlign("center");
    obj.label226:setHorzTextAlign("center");
    obj.label226:setWidth(55);
    obj.label226:setHeight(25);
    obj.label226:setText("Outros");
    obj.label226:setFontColor("Gray");
    obj.label226:setFontFamily("Stencil");
    obj.label226:setName("label226");

    obj.rectangle169 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle169:setParent(obj.rectangle164);
    obj.rectangle169:setLeft(230);
    obj.rectangle169:setTop(64);
    obj.rectangle169:setStrokeSize(3);
    obj.rectangle169:setName("rectangle169");
    obj.rectangle169:setWidth(55);
    obj.rectangle169:setHeight(25);
    obj.rectangle169:setColor("transparent");
    obj.rectangle169:setStrokeColor("Gray");
    obj.rectangle169:setCornerType("round");
    obj.rectangle169:setXradius(5);
    obj.rectangle169:setYradius(5);

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.rectangle169);
    obj.label227:setVertTextAlign("center");
    obj.label227:setHorzTextAlign("center");
    obj.label227:setWidth(55);
    obj.label227:setHeight(25);
    obj.label227:setText("Bônus");
    obj.label227:setFontColor("Gray");
    obj.label227:setFontFamily("Stencil");
    obj.label227:setName("label227");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle164);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(89);
    obj.layout10:setWidth(295);
    obj.layout10:setHeight(35);
    obj.layout10:setName("layout10");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout10);
    obj.button20:setLeft(5);
    obj.button20:setTop(1);
    obj.button20:setWidth(55);
    obj.button20:setText("FOR");
    obj.button20:setFontSize(16);
    obj.button20:setVertTextAlign("center");
    obj.button20:setHorzTextAlign("center");
    obj.button20:setName("button20");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout10);
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setHorzTextAlign("trailing");
    obj.comboBox1:setLeft(115);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(55);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("FortProf");
    obj.comboBox1:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox1:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.FortOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.FortOutrosLabel:setParent(obj.layout10);
    obj.FortOutrosLabel:setLeft(170);
    obj.FortOutrosLabel:setTop(0);
    obj.FortOutrosLabel:setWidth(55);
    obj.FortOutrosLabel:setHeight(25);
    obj.FortOutrosLabel:setColor("transparent");
    obj.FortOutrosLabel:setStrokeColor("Gray");
    obj.FortOutrosLabel:setStrokeSize(1);
    obj.FortOutrosLabel:setName("FortOutrosLabel");
    obj.FortOutrosLabel:setVisible(true);
    obj.FortOutrosLabel:setCornerType("round");
    obj.FortOutrosLabel:setXradius(5);
    obj.FortOutrosLabel:setYradius(5);

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.FortOutrosLabel);
    obj.label228:setWidth(55);
    obj.label228:setHeight(25);
    obj.label228:setField("FortOutros");
    obj.label228:setFontSize(16);
    obj.label228:setVertTextAlign("center");
    obj.label228:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label228, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label228, "fontStyle",  "bold");
    obj.label228:setFontColor("Gray");
    obj.label228:setName("label228");

    obj.FortOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.FortOutrosEdit:setParent(obj.layout10);
    obj.FortOutrosEdit:setField("FortOutros");
    obj.FortOutrosEdit:setLeft(170);
    obj.FortOutrosEdit:setTop(0);
    obj.FortOutrosEdit:setWidth(55);
    obj.FortOutrosEdit:setHeight(25);
    obj.FortOutrosEdit:setType("float");
    obj.FortOutrosEdit:setName("FortOutrosEdit");
    obj.FortOutrosEdit:setVisible(false);
    obj.FortOutrosEdit:setFontSize(16);

    obj.rectangle170 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle170:setParent(obj.layout10);
    obj.rectangle170:setLeft(225);
    obj.rectangle170:setTop(0);
    obj.rectangle170:setWidth(55);
    obj.rectangle170:setHeight(25);
    obj.rectangle170:setColor("transparent");
    obj.rectangle170:setStrokeColor("Gray");
    obj.rectangle170:setStrokeSize(3);
    obj.rectangle170:setVisible(true);
    obj.rectangle170:setOpacity(1);
    obj.rectangle170:setCornerType("round");
    obj.rectangle170:setXradius(5);
    obj.rectangle170:setYradius(5);
    obj.rectangle170:setName("rectangle170");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.rectangle170);
    obj.label229:setWidth(55);
    obj.label229:setHeight(25);
    obj.label229:setField("modFort");
    obj.label229:setFontSize(16);
    lfm_setPropAsString(obj.label229, "fontStyle",  "bold");
    obj.label229:setFontColor("Gray");
    obj.label229:setVertTextAlign("center");
    obj.label229:setHorzTextAlign("center");
    obj.label229:setName("label229");

    obj.rectangle171 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle171:setParent(obj.layout10);
    obj.rectangle171:setLeft(60);
    obj.rectangle171:setTop(0);
    obj.rectangle171:setWidth(55);
    obj.rectangle171:setHeight(25);
    obj.rectangle171:setColor("transparent");
    obj.rectangle171:setStrokeColor("Gray");
    obj.rectangle171:setStrokeSize(1);
    obj.rectangle171:setVisible(true);
    obj.rectangle171:setOpacity(1);
    obj.rectangle171:setCornerType("round");
    obj.rectangle171:setXradius(5);
    obj.rectangle171:setYradius(5);
    obj.rectangle171:setName("rectangle171");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.rectangle171);
    obj.label230:setWidth(55);
    obj.label230:setHeight(25);
    obj.label230:setField("modCon");
    obj.label230:setFontSize(16);
    lfm_setPropAsString(obj.label230, "fontStyle",  "bold");
    obj.label230:setFontColor("Gray");
    obj.label230:setVertTextAlign("center");
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle164);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(114);
    obj.layout11:setWidth(295);
    obj.layout11:setHeight(35);
    obj.layout11:setName("layout11");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout11);
    obj.button21:setLeft(5);
    obj.button21:setTop(1);
    obj.button21:setWidth(55);
    obj.button21:setText("REF");
    obj.button21:setFontSize(16);
    obj.button21:setVertTextAlign("center");
    obj.button21:setHorzTextAlign("center");
    obj.button21:setName("button21");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout11);
    obj.comboBox2:setVertTextAlign("center");
    obj.comboBox2:setHorzTextAlign("trailing");
    obj.comboBox2:setLeft(115);
    obj.comboBox2:setTop(0);
    obj.comboBox2:setWidth(55);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("RefProf");
    obj.comboBox2:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox2:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setName("comboBox2");

    obj.RefOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.RefOutrosLabel:setParent(obj.layout11);
    obj.RefOutrosLabel:setLeft(170);
    obj.RefOutrosLabel:setTop(0);
    obj.RefOutrosLabel:setWidth(55);
    obj.RefOutrosLabel:setHeight(25);
    obj.RefOutrosLabel:setColor("transparent");
    obj.RefOutrosLabel:setStrokeColor("Gray");
    obj.RefOutrosLabel:setStrokeSize(1);
    obj.RefOutrosLabel:setName("RefOutrosLabel");
    obj.RefOutrosLabel:setVisible(true);
    obj.RefOutrosLabel:setCornerType("round");
    obj.RefOutrosLabel:setXradius(5);
    obj.RefOutrosLabel:setYradius(5);

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.RefOutrosLabel);
    obj.label231:setWidth(55);
    obj.label231:setHeight(25);
    obj.label231:setField("RefOutros");
    obj.label231:setFontSize(16);
    obj.label231:setVertTextAlign("center");
    obj.label231:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label231, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label231, "fontStyle",  "bold");
    obj.label231:setFontColor("Gray");
    obj.label231:setName("label231");

    obj.RefOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.RefOutrosEdit:setParent(obj.layout11);
    obj.RefOutrosEdit:setField("RefOutros");
    obj.RefOutrosEdit:setLeft(170);
    obj.RefOutrosEdit:setTop(0);
    obj.RefOutrosEdit:setWidth(55);
    obj.RefOutrosEdit:setHeight(25);
    obj.RefOutrosEdit:setType("float");
    obj.RefOutrosEdit:setName("RefOutrosEdit");
    obj.RefOutrosEdit:setVisible(false);
    obj.RefOutrosEdit:setFontSize(16);

    obj.rectangle172 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle172:setParent(obj.layout11);
    obj.rectangle172:setLeft(225);
    obj.rectangle172:setTop(0);
    obj.rectangle172:setWidth(55);
    obj.rectangle172:setHeight(25);
    obj.rectangle172:setColor("transparent");
    obj.rectangle172:setStrokeColor("Gray");
    obj.rectangle172:setStrokeSize(3);
    obj.rectangle172:setVisible(true);
    obj.rectangle172:setOpacity(1);
    obj.rectangle172:setCornerType("round");
    obj.rectangle172:setXradius(5);
    obj.rectangle172:setYradius(5);
    obj.rectangle172:setName("rectangle172");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.rectangle172);
    obj.label232:setWidth(55);
    obj.label232:setHeight(25);
    obj.label232:setField("modRef");
    obj.label232:setFontSize(16);
    lfm_setPropAsString(obj.label232, "fontStyle",  "bold");
    obj.label232:setFontColor("Gray");
    obj.label232:setVertTextAlign("center");
    obj.label232:setHorzTextAlign("center");
    obj.label232:setName("label232");

    obj.rectangle173 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle173:setParent(obj.layout11);
    obj.rectangle173:setLeft(60);
    obj.rectangle173:setTop(0);
    obj.rectangle173:setWidth(55);
    obj.rectangle173:setHeight(25);
    obj.rectangle173:setColor("transparent");
    obj.rectangle173:setStrokeColor("Gray");
    obj.rectangle173:setStrokeSize(1);
    obj.rectangle173:setVisible(true);
    obj.rectangle173:setOpacity(1);
    obj.rectangle173:setCornerType("round");
    obj.rectangle173:setXradius(5);
    obj.rectangle173:setYradius(5);
    obj.rectangle173:setName("rectangle173");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.rectangle173);
    obj.label233:setWidth(55);
    obj.label233:setHeight(25);
    obj.label233:setField("modDes");
    obj.label233:setFontSize(16);
    lfm_setPropAsString(obj.label233, "fontStyle",  "bold");
    obj.label233:setFontColor("Gray");
    obj.label233:setVertTextAlign("center");
    obj.label233:setHorzTextAlign("center");
    obj.label233:setName("label233");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle164);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(139);
    obj.layout12:setWidth(295);
    obj.layout12:setHeight(35);
    obj.layout12:setName("layout12");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout12);
    obj.button22:setLeft(5);
    obj.button22:setTop(1);
    obj.button22:setWidth(55);
    obj.button22:setText("VON");
    obj.button22:setFontSize(16);
    obj.button22:setVertTextAlign("center");
    obj.button22:setHorzTextAlign("center");
    obj.button22:setName("button22");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout12);
    obj.comboBox3:setVertTextAlign("center");
    obj.comboBox3:setHorzTextAlign("trailing");
    obj.comboBox3:setLeft(115);
    obj.comboBox3:setTop(0);
    obj.comboBox3:setWidth(55);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("VonProf");
    obj.comboBox3:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox3:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setName("comboBox3");

    obj.VonOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.VonOutrosLabel:setParent(obj.layout12);
    obj.VonOutrosLabel:setLeft(170);
    obj.VonOutrosLabel:setTop(0);
    obj.VonOutrosLabel:setWidth(55);
    obj.VonOutrosLabel:setHeight(25);
    obj.VonOutrosLabel:setColor("transparent");
    obj.VonOutrosLabel:setStrokeColor("Gray");
    obj.VonOutrosLabel:setStrokeSize(1);
    obj.VonOutrosLabel:setName("VonOutrosLabel");
    obj.VonOutrosLabel:setVisible(true);
    obj.VonOutrosLabel:setCornerType("round");
    obj.VonOutrosLabel:setXradius(5);
    obj.VonOutrosLabel:setYradius(5);

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.VonOutrosLabel);
    obj.label234:setWidth(55);
    obj.label234:setHeight(25);
    obj.label234:setField("VonOutros");
    obj.label234:setFontSize(16);
    obj.label234:setVertTextAlign("center");
    obj.label234:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label234, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label234, "fontStyle",  "bold");
    obj.label234:setFontColor("Gray");
    obj.label234:setName("label234");

    obj.VonOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.VonOutrosEdit:setParent(obj.layout12);
    obj.VonOutrosEdit:setField("VonOutros");
    obj.VonOutrosEdit:setLeft(170);
    obj.VonOutrosEdit:setTop(0);
    obj.VonOutrosEdit:setWidth(55);
    obj.VonOutrosEdit:setHeight(25);
    obj.VonOutrosEdit:setType("float");
    obj.VonOutrosEdit:setName("VonOutrosEdit");
    obj.VonOutrosEdit:setVisible(false);
    obj.VonOutrosEdit:setFontSize(16);

    obj.rectangle174 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle174:setParent(obj.layout12);
    obj.rectangle174:setLeft(225);
    obj.rectangle174:setTop(0);
    obj.rectangle174:setWidth(55);
    obj.rectangle174:setHeight(25);
    obj.rectangle174:setColor("transparent");
    obj.rectangle174:setStrokeColor("Gray");
    obj.rectangle174:setStrokeSize(3);
    obj.rectangle174:setVisible(true);
    obj.rectangle174:setOpacity(1);
    obj.rectangle174:setCornerType("round");
    obj.rectangle174:setXradius(5);
    obj.rectangle174:setYradius(5);
    obj.rectangle174:setName("rectangle174");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.rectangle174);
    obj.label235:setWidth(55);
    obj.label235:setHeight(25);
    obj.label235:setField("modVon");
    obj.label235:setFontSize(16);
    lfm_setPropAsString(obj.label235, "fontStyle",  "bold");
    obj.label235:setFontColor("Gray");
    obj.label235:setVertTextAlign("center");
    obj.label235:setHorzTextAlign("center");
    obj.label235:setName("label235");

    obj.rectangle175 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle175:setParent(obj.layout12);
    obj.rectangle175:setLeft(60);
    obj.rectangle175:setTop(0);
    obj.rectangle175:setWidth(55);
    obj.rectangle175:setHeight(25);
    obj.rectangle175:setColor("transparent");
    obj.rectangle175:setStrokeColor("Gray");
    obj.rectangle175:setStrokeSize(1);
    obj.rectangle175:setVisible(true);
    obj.rectangle175:setOpacity(1);
    obj.rectangle175:setCornerType("round");
    obj.rectangle175:setXradius(5);
    obj.rectangle175:setYradius(5);
    obj.rectangle175:setName("rectangle175");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.rectangle175);
    obj.label236:setWidth(55);
    obj.label236:setHeight(25);
    obj.label236:setField("modSab");
    obj.label236:setFontSize(16);
    lfm_setPropAsString(obj.label236, "fontStyle",  "bold");
    obj.label236:setFontColor("Gray");
    obj.label236:setVertTextAlign("center");
    obj.label236:setHorzTextAlign("center");
    obj.label236:setName("label236");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle164);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(164);
    obj.layout13:setWidth(295);
    obj.layout13:setHeight(35);
    obj.layout13:setName("layout13");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout13);
    obj.button23:setLeft(5);
    obj.button23:setTop(1);
    obj.button23:setWidth(55);
    obj.button23:setText("PER");
    obj.button23:setFontSize(16);
    obj.button23:setVertTextAlign("center");
    obj.button23:setHorzTextAlign("center");
    obj.button23:setName("button23");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout13);
    obj.comboBox4:setVertTextAlign("center");
    obj.comboBox4:setHorzTextAlign("trailing");
    obj.comboBox4:setLeft(115);
    obj.comboBox4:setTop(0);
    obj.comboBox4:setWidth(55);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("PerProf");
    obj.comboBox4:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox4:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setName("comboBox4");

    obj.PerOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.PerOutrosLabel:setParent(obj.layout13);
    obj.PerOutrosLabel:setLeft(170);
    obj.PerOutrosLabel:setTop(0);
    obj.PerOutrosLabel:setWidth(55);
    obj.PerOutrosLabel:setHeight(25);
    obj.PerOutrosLabel:setColor("transparent");
    obj.PerOutrosLabel:setStrokeColor("Gray");
    obj.PerOutrosLabel:setStrokeSize(1);
    obj.PerOutrosLabel:setName("PerOutrosLabel");
    obj.PerOutrosLabel:setVisible(true);
    obj.PerOutrosLabel:setCornerType("round");
    obj.PerOutrosLabel:setXradius(5);
    obj.PerOutrosLabel:setYradius(5);

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.PerOutrosLabel);
    obj.label237:setWidth(55);
    obj.label237:setHeight(25);
    obj.label237:setField("PerOutros");
    obj.label237:setFontSize(16);
    obj.label237:setVertTextAlign("center");
    obj.label237:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label237, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label237, "fontStyle",  "bold");
    obj.label237:setFontColor("Gray");
    obj.label237:setName("label237");

    obj.PerOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.PerOutrosEdit:setParent(obj.layout13);
    obj.PerOutrosEdit:setField("PerOutros");
    obj.PerOutrosEdit:setLeft(170);
    obj.PerOutrosEdit:setTop(0);
    obj.PerOutrosEdit:setWidth(55);
    obj.PerOutrosEdit:setHeight(25);
    obj.PerOutrosEdit:setType("float");
    obj.PerOutrosEdit:setName("PerOutrosEdit");
    obj.PerOutrosEdit:setVisible(false);
    obj.PerOutrosEdit:setFontSize(16);

    obj.rectangle176 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle176:setParent(obj.layout13);
    obj.rectangle176:setLeft(225);
    obj.rectangle176:setTop(0);
    obj.rectangle176:setWidth(55);
    obj.rectangle176:setHeight(25);
    obj.rectangle176:setColor("transparent");
    obj.rectangle176:setStrokeColor("Gray");
    obj.rectangle176:setStrokeSize(3);
    obj.rectangle176:setVisible(true);
    obj.rectangle176:setOpacity(1);
    obj.rectangle176:setCornerType("round");
    obj.rectangle176:setXradius(5);
    obj.rectangle176:setYradius(5);
    obj.rectangle176:setName("rectangle176");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.rectangle176);
    obj.label238:setWidth(55);
    obj.label238:setHeight(25);
    obj.label238:setField("modPer");
    obj.label238:setFontSize(16);
    lfm_setPropAsString(obj.label238, "fontStyle",  "bold");
    obj.label238:setFontColor("Gray");
    obj.label238:setVertTextAlign("center");
    obj.label238:setHorzTextAlign("center");
    obj.label238:setName("label238");

    obj.rectangle177 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle177:setParent(obj.layout13);
    obj.rectangle177:setLeft(60);
    obj.rectangle177:setTop(0);
    obj.rectangle177:setWidth(55);
    obj.rectangle177:setHeight(25);
    obj.rectangle177:setColor("transparent");
    obj.rectangle177:setStrokeColor("Gray");
    obj.rectangle177:setStrokeSize(1);
    obj.rectangle177:setVisible(true);
    obj.rectangle177:setOpacity(1);
    obj.rectangle177:setCornerType("round");
    obj.rectangle177:setXradius(5);
    obj.rectangle177:setYradius(5);
    obj.rectangle177:setName("rectangle177");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.rectangle177);
    obj.label239:setWidth(55);
    obj.label239:setHeight(25);
    obj.label239:setField("modSab");
    obj.label239:setFontSize(16);
    lfm_setPropAsString(obj.label239, "fontStyle",  "bold");
    obj.label239:setFontColor("Gray");
    obj.label239:setVertTextAlign("center");
    obj.label239:setHorzTextAlign("center");
    obj.label239:setName("label239");

    obj.rectangle178 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle178:setParent(obj.rectangle164);
    obj.rectangle178:setLeft(82);
    obj.rectangle178:setTop(229);
    obj.rectangle178:setName("rectangle178");
    obj.rectangle178:setWidth(131);
    obj.rectangle178:setHeight(25);
    obj.rectangle178:setColor("transparent");
    obj.rectangle178:setStrokeColor("Gray");
    obj.rectangle178:setStrokeSize(2);
    obj.rectangle178:setCornerType("innerRound");
    obj.rectangle178:setXradius(5);
    obj.rectangle178:setYradius(5);

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.rectangle178);
    obj.label240:setWidth(131);
    obj.label240:setHeight(25);
    obj.label240:setText("Sentidos");
    obj.label240:setVertTextAlign("center");
    obj.label240:setHorzTextAlign("center");
    obj.label240:setFontSize(16);
    obj.label240:setFontColor("Gray");
    obj.label240:setFontFamily("Stencil");
    obj.label240:setName("label240");

    obj.sentidosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.sentidosLabel:setParent(obj.rectangle164);
    obj.sentidosLabel:setLeft(5);
    obj.sentidosLabel:setTop(254);
    obj.sentidosLabel:setWidth(281);
    obj.sentidosLabel:setHeight(118);
    obj.sentidosLabel:setColor("transparent");
    obj.sentidosLabel:setStrokeColor("Gray");
    obj.sentidosLabel:setStrokeSize(1);
    obj.sentidosLabel:setName("sentidosLabel");
    obj.sentidosLabel:setVisible(true);
    obj.sentidosLabel:setCornerType("round");
    obj.sentidosLabel:setXradius(10);
    obj.sentidosLabel:setYradius(10);
    obj.sentidosLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.sentidosLabel);
    obj.label241:setAlign("client");
    obj.label241:setField("sentidos");
    lfm_setPropAsString(obj.label241, "fontStyle",  "bold");
    obj.label241:setFontSize(16);
    obj.label241:setHorzTextAlign("leading");
    obj.label241:setVertTextAlign("leading");
    obj.label241:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label241:setFontColor("Gray");
    obj.label241:setName("label241");

    obj.sentidosEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.sentidosEdit:setParent(obj.rectangle164);
    obj.sentidosEdit:setField("sentidos");
    obj.sentidosEdit:setLeft(5);
    obj.sentidosEdit:setTop(254);
    obj.sentidosEdit:setWidth(281);
    obj.sentidosEdit:setHeight(118);
    obj.sentidosEdit:setName("sentidosEdit");
    obj.sentidosEdit:setVisible(false);
    obj.sentidosEdit:setFontSize(16);
    obj.sentidosEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle164);
    obj.dataLink15:setFields({'nivel', 'modCon', 'FortProf', 'FortOutros'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle164);
    obj.dataLink16:setFields({'nivel', 'modDes', 'RefProf', 'RefOutros'});
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle164);
    obj.dataLink17:setFields({'nivel', 'modSab', 'VonProf', 'VonOutros'});
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.rectangle164);
    obj.dataLink18:setFields({'nivel', 'modSab', 'PerProf', 'PerOutros'});
    obj.dataLink18:setName("dataLink18");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setWidth(382);
    obj.flowPart4:setHeight(382);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setAlign("top");
    obj.flowPart4:setMinScaledWidth(400);
    obj.flowPart4:setAvoidScale(true);
    obj.flowPart4:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle179 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle179:setParent(obj.flowPart4);
    obj.rectangle179:setAlign("client");
    obj.rectangle179:setName("rectangle179");
    obj.rectangle179:setColor("transparent");
    obj.rectangle179:setCornerType("round");
    obj.rectangle179:setXradius(15);
    obj.rectangle179:setYradius(15);
    obj.rectangle179:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.rectangle179);
    obj.image14:setAlign("client");
    obj.image14:setStyle("stretch");
    obj.image14:setSRC("/imagens/Fundo 3.png");
    obj.image14:setOpacity(0.1);
    obj.image14:setName("image14");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.rectangle179);
    obj.label242:setLeft(0);
    obj.label242:setTop(5);
    obj.label242:setWidth(382);
    obj.label242:setHeight(25);
    obj.label242:setText("Aparência");
    obj.label242:setFontSize(20);
    obj.label242:setVertTextAlign("center");
    obj.label242:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label242, "fontStyle",  "italic");
    obj.label242:setFontColor("Gray");
    obj.label242:setFontFamily("Stencil");
    obj.label242:setName("label242");

    obj.rectangle180 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle180:setParent(obj.rectangle179);
    obj.rectangle180:setLeft(19);
    obj.rectangle180:setTop(30);
    obj.rectangle180:setWidth(340);
    obj.rectangle180:setHeight(340);
    obj.rectangle180:setColor("transparent");
    obj.rectangle180:setStrokeColor("Gray");
    obj.rectangle180:setStrokeSize(2);
    obj.rectangle180:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle180:setName("rectangle180");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.rectangle180);
    obj.image15:setAlign("client");
    obj.image15:setStyle("proportional");
    obj.image15:setSRC("/imagens/Logo.png");
    obj.image15:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image15:setOpacity(0.5);
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.rectangle180);
    obj.image16:setAlign("client");
    obj.image16:setField("avatar");
    obj.image16:setEditable(true);
    obj.image16:setStyle("autoFit");
    obj.image16:setMargins({left=2, right=2, top=2, bottom=2});
    lfm_setPropAsString(obj.image16, "animate",  "true");
    obj.image16:setName("image16");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setWidth(405);
    obj.flowPart5:setHeight(382);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setAlign("top");
    obj.flowPart5:setMinScaledWidth(400);
    obj.flowPart5:setAvoidScale(true);
    obj.flowPart5:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle181 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle181:setParent(obj.flowPart5);
    obj.rectangle181:setAlign("client");
    obj.rectangle181:setName("rectangle181");
    obj.rectangle181:setColor("transparent");
    obj.rectangle181:setCornerType("round");
    obj.rectangle181:setXradius(15);
    obj.rectangle181:setYradius(15);
    obj.rectangle181:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.rectangle181);
    obj.image17:setAlign("client");
    obj.image17:setStyle("stretch");
    obj.image17:setSRC("/imagens/Fundo 3.png");
    obj.image17:setOpacity(0.1);
    obj.image17:setName("image17");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.rectangle181);
    obj.label243:setLeft(0);
    obj.label243:setTop(5);
    obj.label243:setWidth(405);
    obj.label243:setHeight(25);
    obj.label243:setText("Pontos de Vida");
    obj.label243:setFontSize(20);
    obj.label243:setVertTextAlign("center");
    obj.label243:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label243, "fontStyle",  "italic");
    obj.label243:setFontColor("Gray");
    obj.label243:setFontFamily("Stencil");
    obj.label243:setName("label243");

    obj.pvTotalLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pvTotalLabel:setParent(obj.rectangle181);
    obj.pvTotalLabel:setLeft(172);
    obj.pvTotalLabel:setTop(40);
    obj.pvTotalLabel:setWidth(60);
    obj.pvTotalLabel:setHeight(60);
    obj.pvTotalLabel:setColor("transparent");
    obj.pvTotalLabel:setStrokeColor("Gray");
    obj.pvTotalLabel:setStrokeSize(2);
    obj.pvTotalLabel:setName("pvTotalLabel");
    obj.pvTotalLabel:setCornerType("round");
    obj.pvTotalLabel:setXradius(30);
    obj.pvTotalLabel:setYradius(30);

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.pvTotalLabel);
    obj.label244:setWidth(60);
    obj.label244:setHeight(60);
    obj.label244:setField("pvTotal");
    obj.label244:setFontSize(18);
    obj.label244:setVertTextAlign("center");
    obj.label244:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label244, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label244, "fontStyle",  "bold");
    obj.label244:setFontColor("Gray");
    obj.label244:setName("label244");

    obj.rectangle182 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle182:setParent(obj.rectangle181);
    obj.rectangle182:setLeft(92);
    obj.rectangle182:setTop(135);
    obj.rectangle182:setName("rectangle182");
    obj.rectangle182:setWidth(55);
    obj.rectangle182:setHeight(25);
    obj.rectangle182:setColor("transparent");
    obj.rectangle182:setStrokeColor("Gray");
    obj.rectangle182:setStrokeSize(2);
    obj.rectangle182:setCornerType("round");
    obj.rectangle182:setXradius(5);
    obj.rectangle182:setYradius(5);

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.rectangle182);
    obj.label245:setVertTextAlign("center");
    obj.label245:setHorzTextAlign("center");
    obj.label245:setWidth(55);
    obj.label245:setHeight(25);
    obj.label245:setText("Classe");
    obj.label245:setFontColor("Gray");
    obj.label245:setFontFamily("Stencil");
    obj.label245:setName("label245");

    obj.rectangle183 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle183:setParent(obj.rectangle181);
    obj.rectangle183:setLeft(147);
    obj.rectangle183:setTop(135);
    obj.rectangle183:setName("rectangle183");
    obj.rectangle183:setWidth(55);
    obj.rectangle183:setHeight(25);
    obj.rectangle183:setColor("transparent");
    obj.rectangle183:setStrokeColor("Gray");
    obj.rectangle183:setStrokeSize(2);
    obj.rectangle183:setCornerType("round");
    obj.rectangle183:setXradius(5);
    obj.rectangle183:setYradius(5);

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.rectangle183);
    obj.label246:setVertTextAlign("center");
    obj.label246:setHorzTextAlign("center");
    obj.label246:setWidth(55);
    obj.label246:setHeight(25);
    obj.label246:setText("Raça");
    obj.label246:setFontColor("Gray");
    obj.label246:setFontFamily("Stencil");
    obj.label246:setName("label246");

    obj.rectangle184 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle184:setParent(obj.rectangle181);
    obj.rectangle184:setLeft(202);
    obj.rectangle184:setTop(135);
    obj.rectangle184:setName("rectangle184");
    obj.rectangle184:setWidth(55);
    obj.rectangle184:setHeight(25);
    obj.rectangle184:setColor("transparent");
    obj.rectangle184:setStrokeColor("Gray");
    obj.rectangle184:setStrokeSize(2);
    obj.rectangle184:setCornerType("round");
    obj.rectangle184:setXradius(5);
    obj.rectangle184:setYradius(5);

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.rectangle184);
    obj.label247:setVertTextAlign("center");
    obj.label247:setHorzTextAlign("center");
    obj.label247:setWidth(55);
    obj.label247:setHeight(25);
    obj.label247:setText("Temp");
    obj.label247:setFontColor("Gray");
    obj.label247:setFontFamily("Stencil");
    obj.label247:setName("label247");

    obj.rectangle185 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle185:setParent(obj.rectangle181);
    obj.rectangle185:setLeft(257);
    obj.rectangle185:setTop(135);
    obj.rectangle185:setName("rectangle185");
    obj.rectangle185:setWidth(55);
    obj.rectangle185:setHeight(25);
    obj.rectangle185:setColor("transparent");
    obj.rectangle185:setStrokeColor("Gray");
    obj.rectangle185:setStrokeSize(2);
    obj.rectangle185:setCornerType("round");
    obj.rectangle185:setXradius(5);
    obj.rectangle185:setYradius(5);

    obj.label248 = GUI.fromHandle(_obj_newObject("label"));
    obj.label248:setParent(obj.rectangle185);
    obj.label248:setVertTextAlign("center");
    obj.label248:setHorzTextAlign("center");
    obj.label248:setWidth(55);
    obj.label248:setHeight(25);
    obj.label248:setText("Outros");
    obj.label248:setFontColor("Gray");
    obj.label248:setFontFamily("Stencil");
    obj.label248:setName("label248");

    obj.pvClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pvClasseLabel:setParent(obj.rectangle181);
    obj.pvClasseLabel:setLeft(92);
    obj.pvClasseLabel:setTop(160);
    obj.pvClasseLabel:setWidth(55);
    obj.pvClasseLabel:setHeight(25);
    obj.pvClasseLabel:setColor("transparent");
    obj.pvClasseLabel:setStrokeColor("Gray");
    obj.pvClasseLabel:setStrokeSize(1);
    obj.pvClasseLabel:setName("pvClasseLabel");
    obj.pvClasseLabel:setVisible(true);
    obj.pvClasseLabel:setCornerType("round");
    obj.pvClasseLabel:setXradius(5);
    obj.pvClasseLabel:setYradius(5);

    obj.label249 = GUI.fromHandle(_obj_newObject("label"));
    obj.label249:setParent(obj.pvClasseLabel);
    obj.label249:setWidth(55);
    obj.label249:setHeight(25);
    obj.label249:setField("pvClasse");
    obj.label249:setFontSize(16);
    obj.label249:setVertTextAlign("center");
    obj.label249:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label249, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label249, "fontStyle",  "bold");
    obj.label249:setFontColor("Gray");
    obj.label249:setName("label249");

    obj.pvClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pvClasseEdit:setParent(obj.rectangle181);
    obj.pvClasseEdit:setField("pvClasse");
    obj.pvClasseEdit:setLeft(92);
    obj.pvClasseEdit:setTop(160);
    obj.pvClasseEdit:setWidth(55);
    obj.pvClasseEdit:setHeight(25);
    obj.pvClasseEdit:setType("float");
    obj.pvClasseEdit:setName("pvClasseEdit");
    obj.pvClasseEdit:setVisible(false);
    obj.pvClasseEdit:setFontSize(16);

    obj.pvAncestralidadeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pvAncestralidadeLabel:setParent(obj.rectangle181);
    obj.pvAncestralidadeLabel:setLeft(147);
    obj.pvAncestralidadeLabel:setTop(160);
    obj.pvAncestralidadeLabel:setWidth(55);
    obj.pvAncestralidadeLabel:setHeight(25);
    obj.pvAncestralidadeLabel:setColor("transparent");
    obj.pvAncestralidadeLabel:setStrokeColor("Gray");
    obj.pvAncestralidadeLabel:setStrokeSize(1);
    obj.pvAncestralidadeLabel:setName("pvAncestralidadeLabel");
    obj.pvAncestralidadeLabel:setVisible(true);
    obj.pvAncestralidadeLabel:setCornerType("round");
    obj.pvAncestralidadeLabel:setXradius(5);
    obj.pvAncestralidadeLabel:setYradius(5);

    obj.label250 = GUI.fromHandle(_obj_newObject("label"));
    obj.label250:setParent(obj.pvAncestralidadeLabel);
    obj.label250:setWidth(55);
    obj.label250:setHeight(25);
    obj.label250:setField("pvAncestralidade");
    obj.label250:setFontSize(16);
    obj.label250:setVertTextAlign("center");
    obj.label250:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label250, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label250, "fontStyle",  "bold");
    obj.label250:setFontColor("Gray");
    obj.label250:setName("label250");

    obj.pvAncestralidadeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pvAncestralidadeEdit:setParent(obj.rectangle181);
    obj.pvAncestralidadeEdit:setField("pvAncestralidade");
    obj.pvAncestralidadeEdit:setLeft(147);
    obj.pvAncestralidadeEdit:setTop(160);
    obj.pvAncestralidadeEdit:setWidth(55);
    obj.pvAncestralidadeEdit:setHeight(25);
    obj.pvAncestralidadeEdit:setType("float");
    obj.pvAncestralidadeEdit:setName("pvAncestralidadeEdit");
    obj.pvAncestralidadeEdit:setVisible(false);
    obj.pvAncestralidadeEdit:setFontSize(16);

    obj.pvTempLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pvTempLabel:setParent(obj.rectangle181);
    obj.pvTempLabel:setLeft(202);
    obj.pvTempLabel:setTop(160);
    obj.pvTempLabel:setWidth(55);
    obj.pvTempLabel:setHeight(25);
    obj.pvTempLabel:setColor("transparent");
    obj.pvTempLabel:setStrokeColor("Gray");
    obj.pvTempLabel:setStrokeSize(1);
    obj.pvTempLabel:setName("pvTempLabel");
    obj.pvTempLabel:setVisible(true);
    obj.pvTempLabel:setCornerType("round");
    obj.pvTempLabel:setXradius(5);
    obj.pvTempLabel:setYradius(5);

    obj.label251 = GUI.fromHandle(_obj_newObject("label"));
    obj.label251:setParent(obj.pvTempLabel);
    obj.label251:setWidth(55);
    obj.label251:setHeight(25);
    obj.label251:setField("pvTemp");
    obj.label251:setFontSize(16);
    obj.label251:setVertTextAlign("center");
    obj.label251:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label251, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label251, "fontStyle",  "bold");
    obj.label251:setFontColor("Gray");
    obj.label251:setName("label251");

    obj.pvTempEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pvTempEdit:setParent(obj.rectangle181);
    obj.pvTempEdit:setField("pvTemp");
    obj.pvTempEdit:setLeft(202);
    obj.pvTempEdit:setTop(160);
    obj.pvTempEdit:setWidth(55);
    obj.pvTempEdit:setHeight(25);
    obj.pvTempEdit:setType("float");
    obj.pvTempEdit:setName("pvTempEdit");
    obj.pvTempEdit:setVisible(false);
    obj.pvTempEdit:setFontSize(16);

    obj.pvOutroLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.pvOutroLabel:setParent(obj.rectangle181);
    obj.pvOutroLabel:setLeft(257);
    obj.pvOutroLabel:setTop(160);
    obj.pvOutroLabel:setWidth(55);
    obj.pvOutroLabel:setHeight(25);
    obj.pvOutroLabel:setColor("transparent");
    obj.pvOutroLabel:setStrokeColor("Gray");
    obj.pvOutroLabel:setStrokeSize(1);
    obj.pvOutroLabel:setName("pvOutroLabel");
    obj.pvOutroLabel:setVisible(true);
    obj.pvOutroLabel:setCornerType("round");
    obj.pvOutroLabel:setXradius(5);
    obj.pvOutroLabel:setYradius(5);

    obj.label252 = GUI.fromHandle(_obj_newObject("label"));
    obj.label252:setParent(obj.pvOutroLabel);
    obj.label252:setWidth(55);
    obj.label252:setHeight(25);
    obj.label252:setField("pvOutro");
    obj.label252:setFontSize(16);
    obj.label252:setVertTextAlign("center");
    obj.label252:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label252, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label252, "fontStyle",  "bold");
    obj.label252:setFontColor("Gray");
    obj.label252:setName("label252");

    obj.pvOutroEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.pvOutroEdit:setParent(obj.rectangle181);
    obj.pvOutroEdit:setField("pvOutro");
    obj.pvOutroEdit:setLeft(257);
    obj.pvOutroEdit:setTop(160);
    obj.pvOutroEdit:setWidth(55);
    obj.pvOutroEdit:setHeight(25);
    obj.pvOutroEdit:setType("float");
    obj.pvOutroEdit:setName("pvOutroEdit");
    obj.pvOutroEdit:setVisible(false);
    obj.pvOutroEdit:setFontSize(16);

    obj.rectangle186 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle186:setParent(obj.rectangle181);
    obj.rectangle186:setLeft(60);
    obj.rectangle186:setTop(229);
    obj.rectangle186:setWidth(285);
    obj.rectangle186:setName("rectangle186");
    obj.rectangle186:setHeight(25);
    obj.rectangle186:setColor("transparent");
    obj.rectangle186:setStrokeColor("Gray");
    obj.rectangle186:setStrokeSize(2);
    obj.rectangle186:setCornerType("innerRound");
    obj.rectangle186:setXradius(5);
    obj.rectangle186:setYradius(5);

    obj.label253 = GUI.fromHandle(_obj_newObject("label"));
    obj.label253:setParent(obj.rectangle186);
    obj.label253:setWidth(285);
    obj.label253:setHeight(25);
    obj.label253:setText("Resistências e Imunidades");
    obj.label253:setVertTextAlign("center");
    obj.label253:setHorzTextAlign("center");
    obj.label253:setFontSize(16);
    obj.label253:setFontColor("Gray");
    obj.label253:setFontFamily("Stencil");
    obj.label253:setName("label253");

    obj.resistenciasLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.resistenciasLabel:setParent(obj.rectangle181);
    obj.resistenciasLabel:setLeft(5);
    obj.resistenciasLabel:setTop(254);
    obj.resistenciasLabel:setWidth(391);
    obj.resistenciasLabel:setHeight(120);
    obj.resistenciasLabel:setColor("transparent");
    obj.resistenciasLabel:setStrokeColor("Gray");
    obj.resistenciasLabel:setStrokeSize(1);
    obj.resistenciasLabel:setName("resistenciasLabel");
    obj.resistenciasLabel:setVisible(true);
    obj.resistenciasLabel:setCornerType("round");
    obj.resistenciasLabel:setXradius(10);
    obj.resistenciasLabel:setYradius(10);
    obj.resistenciasLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label254 = GUI.fromHandle(_obj_newObject("label"));
    obj.label254:setParent(obj.resistenciasLabel);
    obj.label254:setAlign("client");
    obj.label254:setField("resistencias");
    lfm_setPropAsString(obj.label254, "fontStyle",  "bold");
    obj.label254:setFontSize(16);
    obj.label254:setHorzTextAlign("leading");
    obj.label254:setVertTextAlign("leading");
    obj.label254:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label254:setFontColor("Gray");
    obj.label254:setName("label254");

    obj.resistenciasEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.resistenciasEdit:setParent(obj.rectangle181);
    obj.resistenciasEdit:setField("resistencias");
    obj.resistenciasEdit:setLeft(5);
    obj.resistenciasEdit:setTop(254);
    obj.resistenciasEdit:setWidth(391);
    obj.resistenciasEdit:setHeight(120);
    obj.resistenciasEdit:setName("resistenciasEdit");
    obj.resistenciasEdit:setVisible(false);
    obj.resistenciasEdit:setFontSize(16);
    obj.resistenciasEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.rectangle181);
    obj.dataLink19:setFields({'pvClasse','pvAncestralidade','pvTemp','pvOutro','modCon', 'nivel'});
    obj.dataLink19:setName("dataLink19");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setWidth(405);
    obj.flowPart6:setHeight(382);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setAlign("top");
    obj.flowPart6:setMinScaledWidth(400);
    obj.flowPart6:setAvoidScale(true);
    obj.flowPart6:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle187 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle187:setParent(obj.flowPart6);
    obj.rectangle187:setAlign("client");
    obj.rectangle187:setName("rectangle187");
    obj.rectangle187:setColor("transparent");
    obj.rectangle187:setCornerType("round");
    obj.rectangle187:setXradius(15);
    obj.rectangle187:setYradius(15);
    obj.rectangle187:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.rectangle187);
    obj.image18:setAlign("client");
    obj.image18:setStyle("stretch");
    obj.image18:setSRC("/imagens/Fundo 3.png");
    obj.image18:setOpacity(0.1);
    obj.image18:setName("image18");

    obj.label255 = GUI.fromHandle(_obj_newObject("label"));
    obj.label255:setParent(obj.rectangle187);
    obj.label255:setLeft(0);
    obj.label255:setTop(5);
    obj.label255:setWidth(405);
    obj.label255:setHeight(25);
    obj.label255:setText("Classe de Armadura");
    obj.label255:setFontSize(20);
    obj.label255:setVertTextAlign("center");
    obj.label255:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label255, "fontStyle",  "italic");
    obj.label255:setFontColor("Gray");
    obj.label255:setFontFamily("Stencil");
    obj.label255:setName("label255");

    obj.caTotalLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caTotalLabel:setParent(obj.rectangle187);
    obj.caTotalLabel:setLeft(172);
    obj.caTotalLabel:setTop(40);
    obj.caTotalLabel:setWidth(60);
    obj.caTotalLabel:setHeight(60);
    obj.caTotalLabel:setColor("transparent");
    obj.caTotalLabel:setStrokeColor("Gray");
    obj.caTotalLabel:setStrokeSize(2);
    obj.caTotalLabel:setName("caTotalLabel");
    obj.caTotalLabel:setCornerType("round");
    obj.caTotalLabel:setXradius(30);
    obj.caTotalLabel:setYradius(30);

    obj.label256 = GUI.fromHandle(_obj_newObject("label"));
    obj.label256:setParent(obj.caTotalLabel);
    obj.label256:setWidth(60);
    obj.label256:setHeight(60);
    obj.label256:setField("caTotal");
    obj.label256:setFontSize(18);
    obj.label256:setVertTextAlign("center");
    obj.label256:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label256, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label256, "fontStyle",  "bold");
    obj.label256:setFontColor("Gray");
    obj.label256:setName("label256");

    obj.rectangle188 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle188:setParent(obj.rectangle187);
    obj.rectangle188:setLeft(64);
    obj.rectangle188:setTop(110);
    obj.rectangle188:setName("rectangle188");
    obj.rectangle188:setWidth(55);
    obj.rectangle188:setHeight(25);
    obj.rectangle188:setColor("transparent");
    obj.rectangle188:setStrokeColor("Gray");
    obj.rectangle188:setStrokeSize(2);
    obj.rectangle188:setCornerType("round");
    obj.rectangle188:setXradius(5);
    obj.rectangle188:setYradius(5);

    obj.label257 = GUI.fromHandle(_obj_newObject("label"));
    obj.label257:setParent(obj.rectangle188);
    obj.label257:setVertTextAlign("center");
    obj.label257:setHorzTextAlign("center");
    obj.label257:setWidth(55);
    obj.label257:setHeight(25);
    obj.label257:setText("ARM");
    obj.label257:setFontColor("Gray");
    obj.label257:setFontFamily("Stencil");
    obj.label257:setName("label257");

    obj.rectangle189 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle189:setParent(obj.rectangle187);
    obj.rectangle189:setLeft(119);
    obj.rectangle189:setTop(110);
    obj.rectangle189:setName("rectangle189");
    obj.rectangle189:setWidth(55);
    obj.rectangle189:setHeight(25);
    obj.rectangle189:setColor("transparent");
    obj.rectangle189:setStrokeColor("Gray");
    obj.rectangle189:setStrokeSize(2);
    obj.rectangle189:setCornerType("round");
    obj.rectangle189:setXradius(5);
    obj.rectangle189:setYradius(5);

    obj.label258 = GUI.fromHandle(_obj_newObject("label"));
    obj.label258:setParent(obj.rectangle189);
    obj.label258:setVertTextAlign("center");
    obj.label258:setHorzTextAlign("center");
    obj.label258:setWidth(55);
    obj.label258:setHeight(25);
    obj.label258:setText("LIM");
    obj.label258:setFontColor("Gray");
    obj.label258:setFontFamily("Stencil");
    obj.label258:setName("label258");

    obj.rectangle190 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle190:setParent(obj.rectangle187);
    obj.rectangle190:setLeft(174);
    obj.rectangle190:setTop(110);
    obj.rectangle190:setName("rectangle190");
    obj.rectangle190:setWidth(55);
    obj.rectangle190:setHeight(25);
    obj.rectangle190:setColor("transparent");
    obj.rectangle190:setStrokeColor("Gray");
    obj.rectangle190:setStrokeSize(2);
    obj.rectangle190:setCornerType("round");
    obj.rectangle190:setXradius(5);
    obj.rectangle190:setYradius(5);

    obj.label259 = GUI.fromHandle(_obj_newObject("label"));
    obj.label259:setParent(obj.rectangle190);
    obj.label259:setVertTextAlign("center");
    obj.label259:setHorzTextAlign("center");
    obj.label259:setWidth(55);
    obj.label259:setHeight(25);
    obj.label259:setText("PROF");
    obj.label259:setFontColor("Gray");
    obj.label259:setFontFamily("Stencil");
    obj.label259:setName("label259");

    obj.rectangle191 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle191:setParent(obj.rectangle187);
    obj.rectangle191:setLeft(229);
    obj.rectangle191:setTop(110);
    obj.rectangle191:setName("rectangle191");
    obj.rectangle191:setWidth(55);
    obj.rectangle191:setHeight(25);
    obj.rectangle191:setColor("transparent");
    obj.rectangle191:setStrokeColor("Gray");
    obj.rectangle191:setStrokeSize(2);
    obj.rectangle191:setCornerType("round");
    obj.rectangle191:setXradius(5);
    obj.rectangle191:setYradius(5);

    obj.label260 = GUI.fromHandle(_obj_newObject("label"));
    obj.label260:setParent(obj.rectangle191);
    obj.label260:setVertTextAlign("center");
    obj.label260:setHorzTextAlign("center");
    obj.label260:setWidth(55);
    obj.label260:setHeight(25);
    obj.label260:setText("PEN");
    obj.label260:setFontColor("Gray");
    obj.label260:setFontFamily("Stencil");
    obj.label260:setName("label260");

    obj.rectangle192 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle192:setParent(obj.rectangle187);
    obj.rectangle192:setLeft(284);
    obj.rectangle192:setTop(110);
    obj.rectangle192:setName("rectangle192");
    obj.rectangle192:setWidth(55);
    obj.rectangle192:setHeight(25);
    obj.rectangle192:setColor("transparent");
    obj.rectangle192:setStrokeColor("Gray");
    obj.rectangle192:setStrokeSize(2);
    obj.rectangle192:setCornerType("round");
    obj.rectangle192:setXradius(5);
    obj.rectangle192:setYradius(5);

    obj.label261 = GUI.fromHandle(_obj_newObject("label"));
    obj.label261:setParent(obj.rectangle192);
    obj.label261:setVertTextAlign("center");
    obj.label261:setHorzTextAlign("center");
    obj.label261:setWidth(55);
    obj.label261:setHeight(25);
    obj.label261:setText("Outros");
    obj.label261:setFontColor("Gray");
    obj.label261:setFontFamily("Stencil");
    obj.label261:setName("label261");

    obj.caArmaduraLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caArmaduraLabel:setParent(obj.rectangle187);
    obj.caArmaduraLabel:setLeft(64);
    obj.caArmaduraLabel:setTop(135);
    obj.caArmaduraLabel:setWidth(55);
    obj.caArmaduraLabel:setHeight(25);
    obj.caArmaduraLabel:setColor("transparent");
    obj.caArmaduraLabel:setStrokeColor("Gray");
    obj.caArmaduraLabel:setStrokeSize(1);
    obj.caArmaduraLabel:setName("caArmaduraLabel");
    obj.caArmaduraLabel:setVisible(true);
    obj.caArmaduraLabel:setCornerType("round");
    obj.caArmaduraLabel:setXradius(5);
    obj.caArmaduraLabel:setYradius(5);

    obj.label262 = GUI.fromHandle(_obj_newObject("label"));
    obj.label262:setParent(obj.caArmaduraLabel);
    obj.label262:setWidth(55);
    obj.label262:setHeight(25);
    obj.label262:setField("caArmadura");
    obj.label262:setFontSize(16);
    obj.label262:setVertTextAlign("center");
    obj.label262:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label262, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label262, "fontStyle",  "bold");
    obj.label262:setFontColor("Gray");
    obj.label262:setName("label262");

    obj.caArmaduraEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.caArmaduraEdit:setParent(obj.rectangle187);
    obj.caArmaduraEdit:setField("caArmadura");
    obj.caArmaduraEdit:setLeft(64);
    obj.caArmaduraEdit:setTop(135);
    obj.caArmaduraEdit:setWidth(55);
    obj.caArmaduraEdit:setHeight(25);
    obj.caArmaduraEdit:setType("float");
    obj.caArmaduraEdit:setName("caArmaduraEdit");
    obj.caArmaduraEdit:setVisible(false);
    obj.caArmaduraEdit:setFontSize(16);

    obj.caLimitLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caLimitLabel:setParent(obj.rectangle187);
    obj.caLimitLabel:setLeft(119);
    obj.caLimitLabel:setTop(135);
    obj.caLimitLabel:setWidth(55);
    obj.caLimitLabel:setHeight(25);
    obj.caLimitLabel:setColor("transparent");
    obj.caLimitLabel:setStrokeColor("Gray");
    obj.caLimitLabel:setStrokeSize(1);
    obj.caLimitLabel:setName("caLimitLabel");
    obj.caLimitLabel:setVisible(true);
    obj.caLimitLabel:setCornerType("round");
    obj.caLimitLabel:setXradius(5);
    obj.caLimitLabel:setYradius(5);

    obj.label263 = GUI.fromHandle(_obj_newObject("label"));
    obj.label263:setParent(obj.caLimitLabel);
    obj.label263:setWidth(55);
    obj.label263:setHeight(25);
    obj.label263:setField("caLimit");
    obj.label263:setFontSize(16);
    obj.label263:setVertTextAlign("center");
    obj.label263:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label263, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label263, "fontStyle",  "bold");
    obj.label263:setFontColor("Gray");
    obj.label263:setName("label263");

    obj.caLimitEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.caLimitEdit:setParent(obj.rectangle187);
    obj.caLimitEdit:setField("caLimit");
    obj.caLimitEdit:setLeft(119);
    obj.caLimitEdit:setTop(135);
    obj.caLimitEdit:setWidth(55);
    obj.caLimitEdit:setHeight(25);
    obj.caLimitEdit:setType("float");
    obj.caLimitEdit:setName("caLimitEdit");
    obj.caLimitEdit:setVisible(false);
    obj.caLimitEdit:setFontSize(16);

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle187);
    obj.comboBox5:setVertTextAlign("center");
    obj.comboBox5:setHorzTextAlign("trailing");
    obj.comboBox5:setLeft(174);
    obj.comboBox5:setTop(135);
    obj.comboBox5:setWidth(55);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("caProf");
    obj.comboBox5:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox5:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setName("comboBox5");

    obj.penalidadeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.penalidadeLabel:setParent(obj.rectangle187);
    obj.penalidadeLabel:setLeft(229);
    obj.penalidadeLabel:setTop(135);
    obj.penalidadeLabel:setWidth(55);
    obj.penalidadeLabel:setHeight(25);
    obj.penalidadeLabel:setColor("transparent");
    obj.penalidadeLabel:setStrokeColor("Gray");
    obj.penalidadeLabel:setStrokeSize(1);
    obj.penalidadeLabel:setName("penalidadeLabel");
    obj.penalidadeLabel:setVisible(true);
    obj.penalidadeLabel:setCornerType("round");
    obj.penalidadeLabel:setXradius(5);
    obj.penalidadeLabel:setYradius(5);

    obj.label264 = GUI.fromHandle(_obj_newObject("label"));
    obj.label264:setParent(obj.penalidadeLabel);
    obj.label264:setWidth(55);
    obj.label264:setHeight(25);
    obj.label264:setField("penalidade");
    obj.label264:setFontSize(16);
    obj.label264:setVertTextAlign("center");
    obj.label264:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label264, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label264, "fontStyle",  "bold");
    obj.label264:setFontColor("Gray");
    obj.label264:setName("label264");

    obj.penalidadeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.penalidadeEdit:setParent(obj.rectangle187);
    obj.penalidadeEdit:setField("penalidade");
    obj.penalidadeEdit:setLeft(229);
    obj.penalidadeEdit:setTop(135);
    obj.penalidadeEdit:setWidth(55);
    obj.penalidadeEdit:setHeight(25);
    obj.penalidadeEdit:setType("float");
    obj.penalidadeEdit:setName("penalidadeEdit");
    obj.penalidadeEdit:setVisible(false);
    obj.penalidadeEdit:setFontSize(16);

    obj.caOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caOutrosLabel:setParent(obj.rectangle187);
    obj.caOutrosLabel:setLeft(284);
    obj.caOutrosLabel:setTop(135);
    obj.caOutrosLabel:setWidth(55);
    obj.caOutrosLabel:setHeight(25);
    obj.caOutrosLabel:setColor("transparent");
    obj.caOutrosLabel:setStrokeColor("Gray");
    obj.caOutrosLabel:setStrokeSize(1);
    obj.caOutrosLabel:setName("caOutrosLabel");
    obj.caOutrosLabel:setVisible(true);
    obj.caOutrosLabel:setCornerType("round");
    obj.caOutrosLabel:setXradius(5);
    obj.caOutrosLabel:setYradius(5);

    obj.label265 = GUI.fromHandle(_obj_newObject("label"));
    obj.label265:setParent(obj.caOutrosLabel);
    obj.label265:setWidth(55);
    obj.label265:setHeight(25);
    obj.label265:setField("caOutros");
    obj.label265:setFontSize(16);
    obj.label265:setVertTextAlign("center");
    obj.label265:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label265, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label265, "fontStyle",  "bold");
    obj.label265:setFontColor("Gray");
    obj.label265:setName("label265");

    obj.caOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.caOutrosEdit:setParent(obj.rectangle187);
    obj.caOutrosEdit:setField("caOutros");
    obj.caOutrosEdit:setLeft(284);
    obj.caOutrosEdit:setTop(135);
    obj.caOutrosEdit:setWidth(55);
    obj.caOutrosEdit:setHeight(25);
    obj.caOutrosEdit:setType("float");
    obj.caOutrosEdit:setName("caOutrosEdit");
    obj.caOutrosEdit:setVisible(false);
    obj.caOutrosEdit:setFontSize(16);

    obj.rectangle193 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle193:setParent(obj.rectangle187);
    obj.rectangle193:setLeft(64);
    obj.rectangle193:setTop(170);
    obj.rectangle193:setName("rectangle193");
    obj.rectangle193:setWidth(55);
    obj.rectangle193:setHeight(25);
    obj.rectangle193:setColor("transparent");
    obj.rectangle193:setStrokeColor("Gray");
    obj.rectangle193:setStrokeSize(2);
    obj.rectangle193:setCornerType("round");
    obj.rectangle193:setXradius(5);
    obj.rectangle193:setYradius(5);

    obj.label266 = GUI.fromHandle(_obj_newObject("label"));
    obj.label266:setParent(obj.rectangle193);
    obj.label266:setVertTextAlign("center");
    obj.label266:setHorzTextAlign("center");
    obj.label266:setWidth(55);
    obj.label266:setHeight(25);
    obj.label266:setText("ESC");
    obj.label266:setFontColor("Gray");
    obj.label266:setFontFamily("Stencil");
    obj.label266:setName("label266");

    obj.rectangle194 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle194:setParent(obj.rectangle187);
    obj.rectangle194:setLeft(119);
    obj.rectangle194:setTop(170);
    obj.rectangle194:setName("rectangle194");
    obj.rectangle194:setWidth(55);
    obj.rectangle194:setHeight(25);
    obj.rectangle194:setColor("transparent");
    obj.rectangle194:setStrokeColor("Gray");
    obj.rectangle194:setStrokeSize(2);
    obj.rectangle194:setCornerType("round");
    obj.rectangle194:setXradius(5);
    obj.rectangle194:setYradius(5);

    obj.label267 = GUI.fromHandle(_obj_newObject("label"));
    obj.label267:setParent(obj.rectangle194);
    obj.label267:setVertTextAlign("center");
    obj.label267:setHorzTextAlign("center");
    obj.label267:setWidth(55);
    obj.label267:setHeight(25);
    obj.label267:setText("DUR");
    obj.label267:setFontColor("Gray");
    obj.label267:setFontFamily("Stencil");
    obj.label267:setName("label267");

    obj.rectangle195 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle195:setParent(obj.rectangle187);
    obj.rectangle195:setLeft(174);
    obj.rectangle195:setTop(170);
    obj.rectangle195:setName("rectangle195");
    obj.rectangle195:setWidth(55);
    obj.rectangle195:setHeight(25);
    obj.rectangle195:setColor("transparent");
    obj.rectangle195:setStrokeColor("Gray");
    obj.rectangle195:setStrokeSize(2);
    obj.rectangle195:setCornerType("round");
    obj.rectangle195:setXradius(5);
    obj.rectangle195:setYradius(5);

    obj.label268 = GUI.fromHandle(_obj_newObject("label"));
    obj.label268:setParent(obj.rectangle195);
    obj.label268:setVertTextAlign("center");
    obj.label268:setHorzTextAlign("center");
    obj.label268:setWidth(55);
    obj.label268:setHeight(25);
    obj.label268:setText("MÁX");
    obj.label268:setFontColor("Gray");
    obj.label268:setFontFamily("Stencil");
    obj.label268:setName("label268");

    obj.rectangle196 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle196:setParent(obj.rectangle187);
    obj.rectangle196:setLeft(229);
    obj.rectangle196:setTop(170);
    obj.rectangle196:setName("rectangle196");
    obj.rectangle196:setWidth(55);
    obj.rectangle196:setHeight(25);
    obj.rectangle196:setColor("transparent");
    obj.rectangle196:setStrokeColor("Gray");
    obj.rectangle196:setStrokeSize(2);
    obj.rectangle196:setCornerType("round");
    obj.rectangle196:setXradius(5);
    obj.rectangle196:setYradius(5);

    obj.label269 = GUI.fromHandle(_obj_newObject("label"));
    obj.label269:setParent(obj.rectangle196);
    obj.label269:setVertTextAlign("center");
    obj.label269:setHorzTextAlign("center");
    obj.label269:setWidth(55);
    obj.label269:setHeight(25);
    obj.label269:setText("LQ");
    obj.label269:setFontColor("Gray");
    obj.label269:setFontFamily("Stencil");
    obj.label269:setName("label269");

    obj.rectangle197 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle197:setParent(obj.rectangle187);
    obj.rectangle197:setLeft(284);
    obj.rectangle197:setTop(170);
    obj.rectangle197:setName("rectangle197");
    obj.rectangle197:setWidth(55);
    obj.rectangle197:setHeight(25);
    obj.rectangle197:setColor("transparent");
    obj.rectangle197:setStrokeColor("Gray");
    obj.rectangle197:setStrokeSize(2);
    obj.rectangle197:setCornerType("round");
    obj.rectangle197:setXradius(5);
    obj.rectangle197:setYradius(5);

    obj.label270 = GUI.fromHandle(_obj_newObject("label"));
    obj.label270:setParent(obj.rectangle197);
    obj.label270:setVertTextAlign("center");
    obj.label270:setHorzTextAlign("center");
    obj.label270:setWidth(55);
    obj.label270:setHeight(25);
    obj.label270:setText("PV");
    obj.label270:setFontColor("Gray");
    obj.label270:setFontFamily("Stencil");
    obj.label270:setName("label270");

    obj.caEscudoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caEscudoLabel:setParent(obj.rectangle187);
    obj.caEscudoLabel:setLeft(64);
    obj.caEscudoLabel:setTop(195);
    obj.caEscudoLabel:setWidth(55);
    obj.caEscudoLabel:setHeight(25);
    obj.caEscudoLabel:setColor("transparent");
    obj.caEscudoLabel:setStrokeColor("Gray");
    obj.caEscudoLabel:setStrokeSize(1);
    obj.caEscudoLabel:setName("caEscudoLabel");
    obj.caEscudoLabel:setVisible(true);
    obj.caEscudoLabel:setCornerType("round");
    obj.caEscudoLabel:setXradius(5);
    obj.caEscudoLabel:setYradius(5);

    obj.label271 = GUI.fromHandle(_obj_newObject("label"));
    obj.label271:setParent(obj.caEscudoLabel);
    obj.label271:setWidth(55);
    obj.label271:setHeight(25);
    obj.label271:setField("caEscudo");
    obj.label271:setFontSize(16);
    obj.label271:setVertTextAlign("center");
    obj.label271:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label271, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label271, "fontStyle",  "bold");
    obj.label271:setFontColor("Gray");
    obj.label271:setName("label271");

    obj.caEscudoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.caEscudoEdit:setParent(obj.rectangle187);
    obj.caEscudoEdit:setField("caEscudo");
    obj.caEscudoEdit:setLeft(64);
    obj.caEscudoEdit:setTop(195);
    obj.caEscudoEdit:setWidth(55);
    obj.caEscudoEdit:setHeight(25);
    obj.caEscudoEdit:setType("float");
    obj.caEscudoEdit:setName("caEscudoEdit");
    obj.caEscudoEdit:setVisible(false);
    obj.caEscudoEdit:setFontSize(16);

    obj.caDurezaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caDurezaLabel:setParent(obj.rectangle187);
    obj.caDurezaLabel:setLeft(119);
    obj.caDurezaLabel:setTop(195);
    obj.caDurezaLabel:setWidth(55);
    obj.caDurezaLabel:setHeight(25);
    obj.caDurezaLabel:setColor("transparent");
    obj.caDurezaLabel:setStrokeColor("Gray");
    obj.caDurezaLabel:setStrokeSize(1);
    obj.caDurezaLabel:setName("caDurezaLabel");
    obj.caDurezaLabel:setVisible(true);
    obj.caDurezaLabel:setCornerType("round");
    obj.caDurezaLabel:setXradius(5);
    obj.caDurezaLabel:setYradius(5);

    obj.label272 = GUI.fromHandle(_obj_newObject("label"));
    obj.label272:setParent(obj.caDurezaLabel);
    obj.label272:setWidth(55);
    obj.label272:setHeight(25);
    obj.label272:setField("caDureza");
    obj.label272:setFontSize(16);
    obj.label272:setVertTextAlign("center");
    obj.label272:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label272, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label272, "fontStyle",  "bold");
    obj.label272:setFontColor("Gray");
    obj.label272:setName("label272");

    obj.caDurezaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.caDurezaEdit:setParent(obj.rectangle187);
    obj.caDurezaEdit:setField("caDureza");
    obj.caDurezaEdit:setLeft(119);
    obj.caDurezaEdit:setTop(195);
    obj.caDurezaEdit:setWidth(55);
    obj.caDurezaEdit:setHeight(25);
    obj.caDurezaEdit:setType("float");
    obj.caDurezaEdit:setName("caDurezaEdit");
    obj.caDurezaEdit:setVisible(false);
    obj.caDurezaEdit:setFontSize(16);

    obj.caEscudoMaxLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caEscudoMaxLabel:setParent(obj.rectangle187);
    obj.caEscudoMaxLabel:setLeft(174);
    obj.caEscudoMaxLabel:setTop(195);
    obj.caEscudoMaxLabel:setWidth(55);
    obj.caEscudoMaxLabel:setHeight(25);
    obj.caEscudoMaxLabel:setColor("transparent");
    obj.caEscudoMaxLabel:setStrokeColor("Gray");
    obj.caEscudoMaxLabel:setStrokeSize(1);
    obj.caEscudoMaxLabel:setName("caEscudoMaxLabel");
    obj.caEscudoMaxLabel:setVisible(true);
    obj.caEscudoMaxLabel:setCornerType("round");
    obj.caEscudoMaxLabel:setXradius(5);
    obj.caEscudoMaxLabel:setYradius(5);

    obj.label273 = GUI.fromHandle(_obj_newObject("label"));
    obj.label273:setParent(obj.caEscudoMaxLabel);
    obj.label273:setWidth(55);
    obj.label273:setHeight(25);
    obj.label273:setField("caEscudoMax");
    obj.label273:setFontSize(16);
    obj.label273:setVertTextAlign("center");
    obj.label273:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label273, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label273, "fontStyle",  "bold");
    obj.label273:setFontColor("Gray");
    obj.label273:setName("label273");

    obj.caEscudoMaxEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.caEscudoMaxEdit:setParent(obj.rectangle187);
    obj.caEscudoMaxEdit:setField("caEscudoMax");
    obj.caEscudoMaxEdit:setLeft(174);
    obj.caEscudoMaxEdit:setTop(195);
    obj.caEscudoMaxEdit:setWidth(55);
    obj.caEscudoMaxEdit:setHeight(25);
    obj.caEscudoMaxEdit:setType("float");
    obj.caEscudoMaxEdit:setName("caEscudoMaxEdit");
    obj.caEscudoMaxEdit:setVisible(false);
    obj.caEscudoMaxEdit:setFontSize(16);

    obj.caEscudoLQLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caEscudoLQLabel:setParent(obj.rectangle187);
    obj.caEscudoLQLabel:setLeft(229);
    obj.caEscudoLQLabel:setTop(195);
    obj.caEscudoLQLabel:setWidth(55);
    obj.caEscudoLQLabel:setHeight(25);
    obj.caEscudoLQLabel:setColor("transparent");
    obj.caEscudoLQLabel:setStrokeColor("Gray");
    obj.caEscudoLQLabel:setStrokeSize(1);
    obj.caEscudoLQLabel:setName("caEscudoLQLabel");
    obj.caEscudoLQLabel:setVisible(true);
    obj.caEscudoLQLabel:setCornerType("round");
    obj.caEscudoLQLabel:setXradius(5);
    obj.caEscudoLQLabel:setYradius(5);

    obj.label274 = GUI.fromHandle(_obj_newObject("label"));
    obj.label274:setParent(obj.caEscudoLQLabel);
    obj.label274:setWidth(55);
    obj.label274:setHeight(25);
    obj.label274:setField("caEscudoLQ");
    obj.label274:setFontSize(16);
    obj.label274:setVertTextAlign("center");
    obj.label274:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label274, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label274, "fontStyle",  "bold");
    obj.label274:setFontColor("Gray");
    obj.label274:setName("label274");

    obj.caEscudoLQEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.caEscudoLQEdit:setParent(obj.rectangle187);
    obj.caEscudoLQEdit:setField("caEscudoLQ");
    obj.caEscudoLQEdit:setLeft(229);
    obj.caEscudoLQEdit:setTop(195);
    obj.caEscudoLQEdit:setWidth(55);
    obj.caEscudoLQEdit:setHeight(25);
    obj.caEscudoLQEdit:setType("float");
    obj.caEscudoLQEdit:setName("caEscudoLQEdit");
    obj.caEscudoLQEdit:setVisible(false);
    obj.caEscudoLQEdit:setFontSize(16);

    obj.caEscudoPVLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.caEscudoPVLabel:setParent(obj.rectangle187);
    obj.caEscudoPVLabel:setLeft(284);
    obj.caEscudoPVLabel:setTop(195);
    obj.caEscudoPVLabel:setWidth(55);
    obj.caEscudoPVLabel:setHeight(25);
    obj.caEscudoPVLabel:setColor("transparent");
    obj.caEscudoPVLabel:setStrokeColor("Gray");
    obj.caEscudoPVLabel:setStrokeSize(1);
    obj.caEscudoPVLabel:setName("caEscudoPVLabel");
    obj.caEscudoPVLabel:setVisible(true);
    obj.caEscudoPVLabel:setCornerType("round");
    obj.caEscudoPVLabel:setXradius(5);
    obj.caEscudoPVLabel:setYradius(5);

    obj.label275 = GUI.fromHandle(_obj_newObject("label"));
    obj.label275:setParent(obj.caEscudoPVLabel);
    obj.label275:setWidth(55);
    obj.label275:setHeight(25);
    obj.label275:setField("caEscudoPV");
    obj.label275:setFontSize(16);
    obj.label275:setVertTextAlign("center");
    obj.label275:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label275, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label275, "fontStyle",  "bold");
    obj.label275:setFontColor("Gray");
    obj.label275:setName("label275");

    obj.caEscudoPVEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.caEscudoPVEdit:setParent(obj.rectangle187);
    obj.caEscudoPVEdit:setField("caEscudoPV");
    obj.caEscudoPVEdit:setLeft(284);
    obj.caEscudoPVEdit:setTop(195);
    obj.caEscudoPVEdit:setWidth(55);
    obj.caEscudoPVEdit:setHeight(25);
    obj.caEscudoPVEdit:setType("float");
    obj.caEscudoPVEdit:setName("caEscudoPVEdit");
    obj.caEscudoPVEdit:setVisible(false);
    obj.caEscudoPVEdit:setFontSize(16);

    obj.rectangle198 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle198:setParent(obj.rectangle187);
    obj.rectangle198:setLeft(137);
    obj.rectangle198:setTop(229);
    obj.rectangle198:setName("rectangle198");
    obj.rectangle198:setWidth(131);
    obj.rectangle198:setHeight(25);
    obj.rectangle198:setColor("transparent");
    obj.rectangle198:setStrokeColor("Gray");
    obj.rectangle198:setStrokeSize(2);
    obj.rectangle198:setCornerType("innerRound");
    obj.rectangle198:setXradius(5);
    obj.rectangle198:setYradius(5);

    obj.label276 = GUI.fromHandle(_obj_newObject("label"));
    obj.label276:setParent(obj.rectangle198);
    obj.label276:setWidth(131);
    obj.label276:setHeight(25);
    obj.label276:setText("Movimentos");
    obj.label276:setVertTextAlign("center");
    obj.label276:setHorzTextAlign("center");
    obj.label276:setFontSize(16);
    obj.label276:setFontColor("Gray");
    obj.label276:setFontFamily("Stencil");
    obj.label276:setName("label276");

    obj.movimentosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.movimentosLabel:setParent(obj.rectangle187);
    obj.movimentosLabel:setLeft(5);
    obj.movimentosLabel:setTop(254);
    obj.movimentosLabel:setWidth(391);
    obj.movimentosLabel:setHeight(120);
    obj.movimentosLabel:setColor("transparent");
    obj.movimentosLabel:setStrokeColor("Gray");
    obj.movimentosLabel:setStrokeSize(1);
    obj.movimentosLabel:setName("movimentosLabel");
    obj.movimentosLabel:setVisible(true);
    obj.movimentosLabel:setCornerType("round");
    obj.movimentosLabel:setXradius(10);
    obj.movimentosLabel:setYradius(10);
    obj.movimentosLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label277 = GUI.fromHandle(_obj_newObject("label"));
    obj.label277:setParent(obj.movimentosLabel);
    obj.label277:setAlign("client");
    obj.label277:setField("movimentos");
    lfm_setPropAsString(obj.label277, "fontStyle",  "bold");
    obj.label277:setFontSize(16);
    obj.label277:setHorzTextAlign("leading");
    obj.label277:setVertTextAlign("leading");
    obj.label277:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label277:setFontColor("Gray");
    obj.label277:setName("label277");

    obj.movimentosEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.movimentosEdit:setParent(obj.rectangle187);
    obj.movimentosEdit:setField("movimentos");
    obj.movimentosEdit:setLeft(5);
    obj.movimentosEdit:setTop(254);
    obj.movimentosEdit:setWidth(391);
    obj.movimentosEdit:setHeight(120);
    obj.movimentosEdit:setName("movimentosEdit");
    obj.movimentosEdit:setVisible(false);
    obj.movimentosEdit:setFontSize(16);
    obj.movimentosEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.rectangle187);
    obj.dataLink20:setFields({'nivel', 'modDes', 'caArmadura', 'caLimit', 'caProf', 'caOutros','caEscudo'});
    obj.dataLink20:setName("dataLink20");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setWidth(382);
    obj.flowPart7:setHeight(382);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setAlign("top");
    obj.flowPart7:setMinScaledWidth(400);
    obj.flowPart7:setAvoidScale(true);
    obj.flowPart7:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle199 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle199:setParent(obj.flowPart7);
    obj.rectangle199:setAlign("client");
    obj.rectangle199:setName("rectangle199");
    obj.rectangle199:setColor("transparent");
    obj.rectangle199:setCornerType("round");
    obj.rectangle199:setXradius(15);
    obj.rectangle199:setYradius(15);
    obj.rectangle199:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.rectangle199);
    obj.image19:setAlign("client");
    obj.image19:setStyle("stretch");
    obj.image19:setSRC("/imagens/Fundo 3.png");
    obj.image19:setOpacity(0.1);
    obj.image19:setName("image19");

    obj.label278 = GUI.fromHandle(_obj_newObject("label"));
    obj.label278:setParent(obj.rectangle199);
    obj.label278:setLeft(0);
    obj.label278:setTop(5);
    obj.label278:setWidth(382);
    obj.label278:setHeight(25);
    obj.label278:setText("Habilidades");
    obj.label278:setFontSize(20);
    obj.label278:setVertTextAlign("center");
    obj.label278:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label278, "fontStyle",  "italic");
    obj.label278:setFontColor("Gray");
    obj.label278:setFontFamily("Stencil");
    obj.label278:setName("label278");

    obj.rectangle200 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle200:setParent(obj.rectangle199);
    obj.rectangle200:setLeft(101);
    obj.rectangle200:setTop(40);
    obj.rectangle200:setWidth(180);
    obj.rectangle200:setHeight(40);
    obj.rectangle200:setColor("Gray");
    obj.rectangle200:setCornerType("round");
    obj.rectangle200:setXradius(20);
    obj.rectangle200:setYradius(20);
    obj.rectangle200:setName("rectangle200");

    obj.talentos = GUI.fromHandle(_obj_newObject("button"));
    obj.talentos:setParent(obj.rectangle200);
    obj.talentos:setName("talentos");
    obj.talentos:setLeft(15);
    obj.talentos:setTop(5);
    obj.talentos:setWidth(150);
    obj.talentos:setHeight(30);
    obj.talentos:setText("Talentos");
    obj.talentos:setFontSize(16);
    obj.talentos:setVertTextAlign("center");
    obj.talentos:setHorzTextAlign("center");
    obj.talentos:setFontFamily("Stencil");

    obj.rectangle201 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle201:setParent(obj.rectangle199);
    obj.rectangle201:setLeft(125);
    obj.rectangle201:setTop(90);
    obj.rectangle201:setName("rectangle201");
    obj.rectangle201:setWidth(131);
    obj.rectangle201:setHeight(25);
    obj.rectangle201:setColor("transparent");
    obj.rectangle201:setStrokeColor("Gray");
    obj.rectangle201:setStrokeSize(2);
    obj.rectangle201:setCornerType("innerRound");
    obj.rectangle201:setXradius(5);
    obj.rectangle201:setYradius(5);

    obj.label279 = GUI.fromHandle(_obj_newObject("label"));
    obj.label279:setParent(obj.rectangle201);
    obj.label279:setWidth(131);
    obj.label279:setHeight(25);
    obj.label279:setText("Ações");
    obj.label279:setVertTextAlign("center");
    obj.label279:setHorzTextAlign("center");
    obj.label279:setFontSize(16);
    obj.label279:setFontColor("Gray");
    obj.label279:setFontFamily("Stencil");
    obj.label279:setName("label279");

    obj.rectangle202 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle202:setParent(obj.rectangle199);
    obj.rectangle202:setLeft(5);
    obj.rectangle202:setTop(115);
    obj.rectangle202:setWidth(368);
    obj.rectangle202:setHeight(105);
    obj.rectangle202:setColor("transparent");
    obj.rectangle202:setStrokeColor("Gray");
    obj.rectangle202:setStrokeSize(1);
    obj.rectangle202:setCornerType("round");
    obj.rectangle202:setXradius(10);
    obj.rectangle202:setYradius(10);
    obj.rectangle202:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle202:setName("rectangle202");

    obj.rectangle203 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle203:setParent(obj.rectangle202);
    obj.rectangle203:setLeft(0);
    obj.rectangle203:setWidth(100);
    obj.rectangle203:setTop(0);
    obj.rectangle203:setName("rectangle203");
    obj.rectangle203:setHeight(25);
    obj.rectangle203:setColor("transparent");
    obj.rectangle203:setStrokeColor("Gray");
    obj.rectangle203:setStrokeSize(2);
    obj.rectangle203:setCornerType("round");
    obj.rectangle203:setXradius(5);
    obj.rectangle203:setYradius(5);

    obj.label280 = GUI.fromHandle(_obj_newObject("label"));
    obj.label280:setParent(obj.rectangle203);
    obj.label280:setVertTextAlign("center");
    obj.label280:setHorzTextAlign("center");
    obj.label280:setWidth(100);
    obj.label280:setHeight(25);
    obj.label280:setText("Tipo");
    obj.label280:setFontColor("Gray");
    obj.label280:setFontFamily("Stencil");
    obj.label280:setName("label280");

    obj.rectangle204 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle204:setParent(obj.rectangle202);
    obj.rectangle204:setLeft(100);
    obj.rectangle204:setWidth(245);
    obj.rectangle204:setTop(0);
    obj.rectangle204:setName("rectangle204");
    obj.rectangle204:setHeight(25);
    obj.rectangle204:setColor("transparent");
    obj.rectangle204:setStrokeColor("Gray");
    obj.rectangle204:setStrokeSize(2);
    obj.rectangle204:setCornerType("round");
    obj.rectangle204:setXradius(5);
    obj.rectangle204:setYradius(5);

    obj.label281 = GUI.fromHandle(_obj_newObject("label"));
    obj.label281:setParent(obj.rectangle204);
    obj.label281:setVertTextAlign("center");
    obj.label281:setHorzTextAlign("center");
    obj.label281:setWidth(245);
    obj.label281:setHeight(25);
    obj.label281:setText("Ação");
    obj.label281:setFontColor("Gray");
    obj.label281:setFontFamily("Stencil");
    obj.label281:setName("label281");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.rectangle202);
    obj.button24:setLeft(345);
    obj.button24:setTop(1);
    obj.button24:setWidth(23);
    obj.button24:setHeight(23);
    obj.button24:setText("+");
    obj.button24:setName("button24");

    obj.rclAcoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAcoes:setParent(obj.rectangle202);
    obj.rclAcoes:setLeft(0);
    obj.rclAcoes:setTop(25);
    obj.rclAcoes:setName("rclAcoes");
    obj.rclAcoes:setField("campoAcoes");
    obj.rclAcoes:setTemplateForm("frmAcoes");
    obj.rclAcoes:setWidth(368);
    obj.rclAcoes:setHeight(75);
    obj.rclAcoes:setLayout("vertical");
    obj.rclAcoes:setMinQt(0);

    obj.rectangle205 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle205:setParent(obj.rectangle199);
    obj.rectangle205:setLeft(125);
    obj.rectangle205:setTop(229);
    obj.rectangle205:setName("rectangle205");
    obj.rectangle205:setWidth(131);
    obj.rectangle205:setHeight(25);
    obj.rectangle205:setColor("transparent");
    obj.rectangle205:setStrokeColor("Gray");
    obj.rectangle205:setStrokeSize(2);
    obj.rectangle205:setCornerType("innerRound");
    obj.rectangle205:setXradius(5);
    obj.rectangle205:setYradius(5);

    obj.label282 = GUI.fromHandle(_obj_newObject("label"));
    obj.label282:setParent(obj.rectangle205);
    obj.label282:setWidth(131);
    obj.label282:setHeight(25);
    obj.label282:setText("CD de Classe");
    obj.label282:setVertTextAlign("center");
    obj.label282:setHorzTextAlign("center");
    obj.label282:setFontSize(16);
    obj.label282:setFontColor("Gray");
    obj.label282:setFontFamily("Stencil");
    obj.label282:setName("label282");

    obj.rectangle206 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle206:setParent(obj.rectangle199);
    obj.rectangle206:setLeft(5);
    obj.rectangle206:setTop(254);
    obj.rectangle206:setWidth(368);
    obj.rectangle206:setHeight(120);
    obj.rectangle206:setColor("transparent");
    obj.rectangle206:setStrokeColor("Gray");
    obj.rectangle206:setStrokeSize(1);
    obj.rectangle206:setCornerType("round");
    obj.rectangle206:setXradius(10);
    obj.rectangle206:setYradius(10);
    obj.rectangle206:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle206:setName("rectangle206");

    obj.rectangle207 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle207:setParent(obj.rectangle206);
    obj.rectangle207:setLeft(0);
    obj.rectangle207:setWidth(100);
    obj.rectangle207:setTop(0);
    obj.rectangle207:setName("rectangle207");
    obj.rectangle207:setHeight(25);
    obj.rectangle207:setColor("transparent");
    obj.rectangle207:setStrokeColor("Gray");
    obj.rectangle207:setStrokeSize(2);
    obj.rectangle207:setCornerType("round");
    obj.rectangle207:setXradius(5);
    obj.rectangle207:setYradius(5);

    obj.label283 = GUI.fromHandle(_obj_newObject("label"));
    obj.label283:setParent(obj.rectangle207);
    obj.label283:setVertTextAlign("center");
    obj.label283:setHorzTextAlign("center");
    obj.label283:setWidth(100);
    obj.label283:setHeight(25);
    obj.label283:setText("Classe");
    obj.label283:setFontColor("Gray");
    obj.label283:setFontFamily("Stencil");
    obj.label283:setName("label283");

    obj.rectangle208 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle208:setParent(obj.rectangle206);
    obj.rectangle208:setLeft(100);
    obj.rectangle208:setTop(0);
    obj.rectangle208:setName("rectangle208");
    obj.rectangle208:setWidth(55);
    obj.rectangle208:setHeight(25);
    obj.rectangle208:setColor("transparent");
    obj.rectangle208:setStrokeColor("Gray");
    obj.rectangle208:setStrokeSize(2);
    obj.rectangle208:setCornerType("round");
    obj.rectangle208:setXradius(5);
    obj.rectangle208:setYradius(5);

    obj.label284 = GUI.fromHandle(_obj_newObject("label"));
    obj.label284:setParent(obj.rectangle208);
    obj.label284:setVertTextAlign("center");
    obj.label284:setHorzTextAlign("center");
    obj.label284:setWidth(55);
    obj.label284:setHeight(25);
    obj.label284:setText("ATR");
    obj.label284:setFontColor("Gray");
    obj.label284:setFontFamily("Stencil");
    obj.label284:setName("label284");

    obj.rectangle209 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle209:setParent(obj.rectangle206);
    obj.rectangle209:setLeft(155);
    obj.rectangle209:setTop(0);
    obj.rectangle209:setName("rectangle209");
    obj.rectangle209:setWidth(55);
    obj.rectangle209:setHeight(25);
    obj.rectangle209:setColor("transparent");
    obj.rectangle209:setStrokeColor("Gray");
    obj.rectangle209:setStrokeSize(2);
    obj.rectangle209:setCornerType("round");
    obj.rectangle209:setXradius(5);
    obj.rectangle209:setYradius(5);

    obj.label285 = GUI.fromHandle(_obj_newObject("label"));
    obj.label285:setParent(obj.rectangle209);
    obj.label285:setVertTextAlign("center");
    obj.label285:setHorzTextAlign("center");
    obj.label285:setWidth(55);
    obj.label285:setHeight(25);
    obj.label285:setText("Prof");
    obj.label285:setFontColor("Gray");
    obj.label285:setFontFamily("Stencil");
    obj.label285:setName("label285");

    obj.rectangle210 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle210:setParent(obj.rectangle206);
    obj.rectangle210:setLeft(210);
    obj.rectangle210:setTop(0);
    obj.rectangle210:setName("rectangle210");
    obj.rectangle210:setWidth(55);
    obj.rectangle210:setHeight(25);
    obj.rectangle210:setColor("transparent");
    obj.rectangle210:setStrokeColor("Gray");
    obj.rectangle210:setStrokeSize(2);
    obj.rectangle210:setCornerType("round");
    obj.rectangle210:setXradius(5);
    obj.rectangle210:setYradius(5);

    obj.label286 = GUI.fromHandle(_obj_newObject("label"));
    obj.label286:setParent(obj.rectangle210);
    obj.label286:setVertTextAlign("center");
    obj.label286:setHorzTextAlign("center");
    obj.label286:setWidth(55);
    obj.label286:setHeight(25);
    obj.label286:setText("Outros");
    obj.label286:setFontColor("Gray");
    obj.label286:setFontFamily("Stencil");
    obj.label286:setName("label286");

    obj.rectangle211 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle211:setParent(obj.rectangle206);
    obj.rectangle211:setLeft(265);
    obj.rectangle211:setTop(0);
    obj.rectangle211:setWidth(80);
    obj.rectangle211:setStrokeSize(3);
    obj.rectangle211:setName("rectangle211");
    obj.rectangle211:setHeight(25);
    obj.rectangle211:setColor("transparent");
    obj.rectangle211:setStrokeColor("Gray");
    obj.rectangle211:setCornerType("round");
    obj.rectangle211:setXradius(5);
    obj.rectangle211:setYradius(5);

    obj.label287 = GUI.fromHandle(_obj_newObject("label"));
    obj.label287:setParent(obj.rectangle211);
    obj.label287:setVertTextAlign("center");
    obj.label287:setHorzTextAlign("center");
    obj.label287:setWidth(80);
    obj.label287:setHeight(25);
    obj.label287:setText("CD");
    obj.label287:setFontColor("Gray");
    obj.label287:setFontFamily("Stencil");
    obj.label287:setName("label287");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.rectangle206);
    obj.button25:setLeft(345);
    obj.button25:setTop(1);
    obj.button25:setWidth(23);
    obj.button25:setHeight(23);
    obj.button25:setText("+");
    obj.button25:setName("button25");

    obj.nomeClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeClasseLabel:setParent(obj.rectangle206);
    obj.nomeClasseLabel:setLeft(0);
    obj.nomeClasseLabel:setTop(25);
    obj.nomeClasseLabel:setWidth(100);
    obj.nomeClasseLabel:setHeight(25);
    obj.nomeClasseLabel:setColor("transparent");
    obj.nomeClasseLabel:setStrokeColor("Gray");
    obj.nomeClasseLabel:setStrokeSize(1);
    obj.nomeClasseLabel:setName("nomeClasseLabel");
    obj.nomeClasseLabel:setVisible(true);
    obj.nomeClasseLabel:setCornerType("round");
    obj.nomeClasseLabel:setXradius(5);
    obj.nomeClasseLabel:setYradius(5);

    obj.label288 = GUI.fromHandle(_obj_newObject("label"));
    obj.label288:setParent(obj.nomeClasseLabel);
    obj.label288:setWidth(100);
    obj.label288:setHeight(25);
    obj.label288:setField("nomeClasse");
    obj.label288:setFontSize(16);
    obj.label288:setVertTextAlign("center");
    obj.label288:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label288, "fontStyle",  "bold");
    obj.label288:setFontColor("Gray");
    obj.label288:setName("label288");

    obj.nomeClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeClasseEdit:setParent(obj.rectangle206);
    obj.nomeClasseEdit:setField("nomeClasse");
    obj.nomeClasseEdit:setLeft(0);
    obj.nomeClasseEdit:setTop(25);
    obj.nomeClasseEdit:setWidth(100);
    obj.nomeClasseEdit:setHeight(25);
    obj.nomeClasseEdit:setName("nomeClasseEdit");
    obj.nomeClasseEdit:setVisible(false);
    obj.nomeClasseEdit:setFontSize(16);

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.rectangle206);
    obj.comboBox6:setVertTextAlign("center");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setLeft(100);
    obj.comboBox6:setTop(25);
    obj.comboBox6:setWidth(55);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setField("atrBox");
    obj.comboBox6:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox6:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setName("comboBox6");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle206);
    obj.comboBox7:setVertTextAlign("center");
    obj.comboBox7:setHorzTextAlign("trailing");
    obj.comboBox7:setLeft(155);
    obj.comboBox7:setTop(25);
    obj.comboBox7:setWidth(55);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setField("profClasse");
    obj.comboBox7:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox7:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox7:setFontColor("white");
    obj.comboBox7:setName("comboBox7");

    obj.outrosClasseLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.outrosClasseLabel:setParent(obj.rectangle206);
    obj.outrosClasseLabel:setLeft(210);
    obj.outrosClasseLabel:setTop(25);
    obj.outrosClasseLabel:setWidth(55);
    obj.outrosClasseLabel:setHeight(25);
    obj.outrosClasseLabel:setColor("transparent");
    obj.outrosClasseLabel:setStrokeColor("Gray");
    obj.outrosClasseLabel:setStrokeSize(1);
    obj.outrosClasseLabel:setName("outrosClasseLabel");
    obj.outrosClasseLabel:setVisible(true);
    obj.outrosClasseLabel:setCornerType("round");
    obj.outrosClasseLabel:setXradius(5);
    obj.outrosClasseLabel:setYradius(5);

    obj.label289 = GUI.fromHandle(_obj_newObject("label"));
    obj.label289:setParent(obj.outrosClasseLabel);
    obj.label289:setWidth(55);
    obj.label289:setHeight(25);
    obj.label289:setField("outrosClasse");
    obj.label289:setFontSize(16);
    obj.label289:setVertTextAlign("center");
    obj.label289:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label289, "fontStyle",  "bold");
    obj.label289:setFontColor("Gray");
    obj.label289:setName("label289");

    obj.outrosClasseEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.outrosClasseEdit:setParent(obj.rectangle206);
    obj.outrosClasseEdit:setField("outrosClasse");
    obj.outrosClasseEdit:setLeft(210);
    obj.outrosClasseEdit:setTop(25);
    obj.outrosClasseEdit:setWidth(55);
    obj.outrosClasseEdit:setHeight(25);
    obj.outrosClasseEdit:setName("outrosClasseEdit");
    obj.outrosClasseEdit:setVisible(false);
    obj.outrosClasseEdit:setFontSize(16);

    obj.rectangle212 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle212:setParent(obj.rectangle206);
    obj.rectangle212:setLeft(265);
    obj.rectangle212:setTop(25);
    obj.rectangle212:setWidth(80);
    obj.rectangle212:setHeight(25);
    obj.rectangle212:setColor("transparent");
    obj.rectangle212:setStrokeColor("Gray");
    obj.rectangle212:setStrokeSize(3);
    obj.rectangle212:setVisible(true);
    obj.rectangle212:setOpacity(1);
    obj.rectangle212:setCornerType("round");
    obj.rectangle212:setXradius(5);
    obj.rectangle212:setYradius(5);
    obj.rectangle212:setName("rectangle212");

    obj.label290 = GUI.fromHandle(_obj_newObject("label"));
    obj.label290:setParent(obj.rectangle212);
    obj.label290:setWidth(80);
    obj.label290:setHeight(25);
    obj.label290:setField("cdClasse");
    obj.label290:setFontSize(16);
    lfm_setPropAsString(obj.label290, "fontStyle",  "bold");
    obj.label290:setFontColor("Gray");
    obj.label290:setVertTextAlign("center");
    obj.label290:setHorzTextAlign("center");
    obj.label290:setName("label290");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.rectangle206);
    obj.button26:setLeft(345);
    obj.button26:setTop(26);
    obj.button26:setWidth(23);
    obj.button26:setHeight(23);
    obj.button26:setText("i");
    obj.button26:setName("button26");

    obj.rclClasses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclClasses:setParent(obj.rectangle206);
    obj.rclClasses:setLeft(0);
    obj.rclClasses:setTop(50);
    obj.rclClasses:setName("rclClasses");
    obj.rclClasses:setField("campoClasses");
    obj.rclClasses:setTemplateForm("frmClasses");
    obj.rclClasses:setWidth(368);
    obj.rclClasses:setHeight(65);
    obj.rclClasses:setLayout("vertical");
    obj.rclClasses:setMinQt(0);

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.rectangle199);
    obj.dataLink21:setFields({'nivel', 'atrClasse', 'profClasse', 'outrosClasse'});
    obj.dataLink21:setName("dataLink21");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setWidth(405);
    obj.flowPart8:setHeight(628);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setAlign("top");
    obj.flowPart8:setMinScaledWidth(400);
    obj.flowPart8:setAvoidScale(true);
    obj.flowPart8:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle213 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle213:setParent(obj.flowPart8);
    obj.rectangle213:setAlign("client");
    obj.rectangle213:setName("rectangle213");
    obj.rectangle213:setColor("transparent");
    obj.rectangle213:setCornerType("round");
    obj.rectangle213:setXradius(15);
    obj.rectangle213:setYradius(15);
    obj.rectangle213:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.rectangle213);
    obj.image20:setAlign("client");
    obj.image20:setStyle("stretch");
    obj.image20:setSRC("/imagens/Fundo 3.png");
    obj.image20:setOpacity(0.1);
    obj.image20:setName("image20");

    obj.label291 = GUI.fromHandle(_obj_newObject("label"));
    obj.label291:setParent(obj.rectangle213);
    obj.label291:setLeft(0);
    obj.label291:setTop(5);
    obj.label291:setWidth(405);
    obj.label291:setHeight(25);
    obj.label291:setText("Perícias");
    obj.label291:setFontSize(20);
    obj.label291:setVertTextAlign("center");
    obj.label291:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label291, "fontStyle",  "italic");
    obj.label291:setFontColor("Gray");
    obj.label291:setFontFamily("Stencil");
    obj.label291:setName("label291");

    obj.rectangle214 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle214:setParent(obj.rectangle213);
    obj.rectangle214:setLeft(40);
    obj.rectangle214:setWidth(100);
    obj.rectangle214:setName("rectangle214");
    obj.rectangle214:setTop(40);
    obj.rectangle214:setHeight(25);
    obj.rectangle214:setColor("transparent");
    obj.rectangle214:setStrokeColor("Gray");
    obj.rectangle214:setStrokeSize(2);
    obj.rectangle214:setCornerType("round");
    obj.rectangle214:setXradius(5);
    obj.rectangle214:setYradius(5);

    obj.label292 = GUI.fromHandle(_obj_newObject("label"));
    obj.label292:setParent(obj.rectangle214);
    obj.label292:setVertTextAlign("center");
    obj.label292:setHorzTextAlign("center");
    obj.label292:setWidth(100);
    obj.label292:setHeight(25);
    obj.label292:setText("Perícia");
    obj.label292:setFontColor("Gray");
    obj.label292:setFontFamily("Stencil");
    obj.label292:setName("label292");

    obj.rectangle215 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle215:setParent(obj.rectangle213);
    obj.rectangle215:setLeft(140);
    obj.rectangle215:setName("rectangle215");
    obj.rectangle215:setTop(40);
    obj.rectangle215:setWidth(55);
    obj.rectangle215:setHeight(25);
    obj.rectangle215:setColor("transparent");
    obj.rectangle215:setStrokeColor("Gray");
    obj.rectangle215:setStrokeSize(2);
    obj.rectangle215:setCornerType("round");
    obj.rectangle215:setXradius(5);
    obj.rectangle215:setYradius(5);

    obj.label293 = GUI.fromHandle(_obj_newObject("label"));
    obj.label293:setParent(obj.rectangle215);
    obj.label293:setVertTextAlign("center");
    obj.label293:setHorzTextAlign("center");
    obj.label293:setWidth(55);
    obj.label293:setHeight(25);
    obj.label293:setText("ATR");
    obj.label293:setFontColor("Gray");
    obj.label293:setFontFamily("Stencil");
    obj.label293:setName("label293");

    obj.rectangle216 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle216:setParent(obj.rectangle213);
    obj.rectangle216:setLeft(195);
    obj.rectangle216:setName("rectangle216");
    obj.rectangle216:setTop(40);
    obj.rectangle216:setWidth(55);
    obj.rectangle216:setHeight(25);
    obj.rectangle216:setColor("transparent");
    obj.rectangle216:setStrokeColor("Gray");
    obj.rectangle216:setStrokeSize(2);
    obj.rectangle216:setCornerType("round");
    obj.rectangle216:setXradius(5);
    obj.rectangle216:setYradius(5);

    obj.label294 = GUI.fromHandle(_obj_newObject("label"));
    obj.label294:setParent(obj.rectangle216);
    obj.label294:setVertTextAlign("center");
    obj.label294:setHorzTextAlign("center");
    obj.label294:setWidth(55);
    obj.label294:setHeight(25);
    obj.label294:setText("Prof");
    obj.label294:setFontColor("Gray");
    obj.label294:setFontFamily("Stencil");
    obj.label294:setName("label294");

    obj.rectangle217 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle217:setParent(obj.rectangle213);
    obj.rectangle217:setLeft(250);
    obj.rectangle217:setName("rectangle217");
    obj.rectangle217:setTop(40);
    obj.rectangle217:setWidth(55);
    obj.rectangle217:setHeight(25);
    obj.rectangle217:setColor("transparent");
    obj.rectangle217:setStrokeColor("Gray");
    obj.rectangle217:setStrokeSize(2);
    obj.rectangle217:setCornerType("round");
    obj.rectangle217:setXradius(5);
    obj.rectangle217:setYradius(5);

    obj.label295 = GUI.fromHandle(_obj_newObject("label"));
    obj.label295:setParent(obj.rectangle217);
    obj.label295:setVertTextAlign("center");
    obj.label295:setHorzTextAlign("center");
    obj.label295:setWidth(55);
    obj.label295:setHeight(25);
    obj.label295:setText("Outros");
    obj.label295:setFontColor("Gray");
    obj.label295:setFontFamily("Stencil");
    obj.label295:setName("label295");

    obj.rectangle218 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle218:setParent(obj.rectangle213);
    obj.rectangle218:setLeft(305);
    obj.rectangle218:setStrokeSize(3);
    obj.rectangle218:setName("rectangle218");
    obj.rectangle218:setTop(40);
    obj.rectangle218:setWidth(55);
    obj.rectangle218:setHeight(25);
    obj.rectangle218:setColor("transparent");
    obj.rectangle218:setStrokeColor("Gray");
    obj.rectangle218:setCornerType("round");
    obj.rectangle218:setXradius(5);
    obj.rectangle218:setYradius(5);

    obj.label296 = GUI.fromHandle(_obj_newObject("label"));
    obj.label296:setParent(obj.rectangle218);
    obj.label296:setVertTextAlign("center");
    obj.label296:setHorzTextAlign("center");
    obj.label296:setWidth(55);
    obj.label296:setHeight(25);
    obj.label296:setText("Bônus");
    obj.label296:setFontColor("Gray");
    obj.label296:setFontFamily("Stencil");
    obj.label296:setName("label296");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle213);
    obj.layout14:setLeft(15);
    obj.layout14:setTop(64);
    obj.layout14:setWidth(382);
    obj.layout14:setHeight(35);
    obj.layout14:setName("layout14");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout14);
    obj.button27:setLeft(25);
    obj.button27:setTop(1);
    obj.button27:setWidth(100);
    obj.button27:setText("Acrobatismo");
    obj.button27:setFontSize(14);
    obj.button27:setVertTextAlign("center");
    obj.button27:setHorzTextAlign("center");
    obj.button27:setName("button27");

    obj.rectangle219 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle219:setParent(obj.layout14);
    obj.rectangle219:setLeft(125);
    obj.rectangle219:setTop(0);
    obj.rectangle219:setWidth(55);
    obj.rectangle219:setHeight(25);
    obj.rectangle219:setColor("transparent");
    obj.rectangle219:setStrokeColor("Gray");
    obj.rectangle219:setStrokeSize(1);
    obj.rectangle219:setVisible(true);
    obj.rectangle219:setOpacity(1);
    obj.rectangle219:setCornerType("round");
    obj.rectangle219:setXradius(5);
    obj.rectangle219:setYradius(5);
    obj.rectangle219:setName("rectangle219");

    obj.label297 = GUI.fromHandle(_obj_newObject("label"));
    obj.label297:setParent(obj.rectangle219);
    obj.label297:setWidth(55);
    obj.label297:setHeight(25);
    obj.label297:setField("modDes");
    obj.label297:setFontSize(16);
    lfm_setPropAsString(obj.label297, "fontStyle",  "bold");
    obj.label297:setFontColor("Gray");
    obj.label297:setVertTextAlign("center");
    obj.label297:setHorzTextAlign("center");
    obj.label297:setName("label297");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout14);
    obj.comboBox8:setVertTextAlign("center");
    obj.comboBox8:setHorzTextAlign("trailing");
    obj.comboBox8:setLeft(180);
    obj.comboBox8:setTop(0);
    obj.comboBox8:setWidth(55);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setField("AcrobatismoProf");
    obj.comboBox8:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox8:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox8:setFontColor("white");
    obj.comboBox8:setName("comboBox8");

    obj.AcrobatismoOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.AcrobatismoOutrosLabel:setParent(obj.layout14);
    obj.AcrobatismoOutrosLabel:setLeft(235);
    obj.AcrobatismoOutrosLabel:setTop(0);
    obj.AcrobatismoOutrosLabel:setWidth(55);
    obj.AcrobatismoOutrosLabel:setHeight(25);
    obj.AcrobatismoOutrosLabel:setColor("transparent");
    obj.AcrobatismoOutrosLabel:setStrokeColor("Gray");
    obj.AcrobatismoOutrosLabel:setStrokeSize(1);
    obj.AcrobatismoOutrosLabel:setName("AcrobatismoOutrosLabel");
    obj.AcrobatismoOutrosLabel:setVisible(true);
    obj.AcrobatismoOutrosLabel:setCornerType("round");
    obj.AcrobatismoOutrosLabel:setXradius(5);
    obj.AcrobatismoOutrosLabel:setYradius(5);

    obj.label298 = GUI.fromHandle(_obj_newObject("label"));
    obj.label298:setParent(obj.AcrobatismoOutrosLabel);
    obj.label298:setWidth(55);
    obj.label298:setHeight(25);
    obj.label298:setField("AcrobatismoOutros");
    obj.label298:setFontSize(16);
    obj.label298:setVertTextAlign("center");
    obj.label298:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label298, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label298, "fontStyle",  "bold");
    obj.label298:setFontColor("Gray");
    obj.label298:setName("label298");

    obj.AcrobatismoOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.AcrobatismoOutrosEdit:setParent(obj.layout14);
    obj.AcrobatismoOutrosEdit:setField("AcrobatismoOutros");
    obj.AcrobatismoOutrosEdit:setLeft(235);
    obj.AcrobatismoOutrosEdit:setTop(0);
    obj.AcrobatismoOutrosEdit:setWidth(55);
    obj.AcrobatismoOutrosEdit:setHeight(25);
    obj.AcrobatismoOutrosEdit:setType("float");
    obj.AcrobatismoOutrosEdit:setName("AcrobatismoOutrosEdit");
    obj.AcrobatismoOutrosEdit:setVisible(false);
    obj.AcrobatismoOutrosEdit:setFontSize(16);

    obj.rectangle220 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle220:setParent(obj.layout14);
    obj.rectangle220:setLeft(290);
    obj.rectangle220:setTop(0);
    obj.rectangle220:setWidth(55);
    obj.rectangle220:setHeight(25);
    obj.rectangle220:setColor("transparent");
    obj.rectangle220:setStrokeColor("Gray");
    obj.rectangle220:setStrokeSize(3);
    obj.rectangle220:setVisible(true);
    obj.rectangle220:setOpacity(1);
    obj.rectangle220:setCornerType("round");
    obj.rectangle220:setXradius(5);
    obj.rectangle220:setYradius(5);
    obj.rectangle220:setName("rectangle220");

    obj.label299 = GUI.fromHandle(_obj_newObject("label"));
    obj.label299:setParent(obj.rectangle220);
    obj.label299:setWidth(55);
    obj.label299:setHeight(25);
    obj.label299:setField("modAcrobatismo");
    obj.label299:setFontSize(16);
    lfm_setPropAsString(obj.label299, "fontStyle",  "bold");
    obj.label299:setFontColor("Gray");
    obj.label299:setVertTextAlign("center");
    obj.label299:setHorzTextAlign("center");
    obj.label299:setName("label299");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout14);
    obj.dataLink22:setFields({'nivel', 'modDes', 'AcrobatismoProf', 'AcrobatismoOutros'});
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout14);
    obj.dataLink23:setField("modAcrobatismo");
    obj.dataLink23:setName("dataLink23");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle213);
    obj.layout15:setLeft(15);
    obj.layout15:setTop(89);
    obj.layout15:setWidth(382);
    obj.layout15:setHeight(35);
    obj.layout15:setName("layout15");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout15);
    obj.button28:setLeft(25);
    obj.button28:setTop(1);
    obj.button28:setWidth(100);
    obj.button28:setText("Arcanismo");
    obj.button28:setFontSize(14);
    obj.button28:setVertTextAlign("center");
    obj.button28:setHorzTextAlign("center");
    obj.button28:setName("button28");

    obj.rectangle221 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle221:setParent(obj.layout15);
    obj.rectangle221:setLeft(125);
    obj.rectangle221:setTop(0);
    obj.rectangle221:setWidth(55);
    obj.rectangle221:setHeight(25);
    obj.rectangle221:setColor("transparent");
    obj.rectangle221:setStrokeColor("Gray");
    obj.rectangle221:setStrokeSize(1);
    obj.rectangle221:setVisible(true);
    obj.rectangle221:setOpacity(1);
    obj.rectangle221:setCornerType("round");
    obj.rectangle221:setXradius(5);
    obj.rectangle221:setYradius(5);
    obj.rectangle221:setName("rectangle221");

    obj.label300 = GUI.fromHandle(_obj_newObject("label"));
    obj.label300:setParent(obj.rectangle221);
    obj.label300:setWidth(55);
    obj.label300:setHeight(25);
    obj.label300:setField("modInt");
    obj.label300:setFontSize(16);
    lfm_setPropAsString(obj.label300, "fontStyle",  "bold");
    obj.label300:setFontColor("Gray");
    obj.label300:setVertTextAlign("center");
    obj.label300:setHorzTextAlign("center");
    obj.label300:setName("label300");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout15);
    obj.comboBox9:setVertTextAlign("center");
    obj.comboBox9:setHorzTextAlign("trailing");
    obj.comboBox9:setLeft(180);
    obj.comboBox9:setTop(0);
    obj.comboBox9:setWidth(55);
    obj.comboBox9:setHeight(25);
    obj.comboBox9:setField("ArcanismoProf");
    obj.comboBox9:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox9:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox9:setFontColor("white");
    obj.comboBox9:setName("comboBox9");

    obj.ArcanismoOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ArcanismoOutrosLabel:setParent(obj.layout15);
    obj.ArcanismoOutrosLabel:setLeft(235);
    obj.ArcanismoOutrosLabel:setTop(0);
    obj.ArcanismoOutrosLabel:setWidth(55);
    obj.ArcanismoOutrosLabel:setHeight(25);
    obj.ArcanismoOutrosLabel:setColor("transparent");
    obj.ArcanismoOutrosLabel:setStrokeColor("Gray");
    obj.ArcanismoOutrosLabel:setStrokeSize(1);
    obj.ArcanismoOutrosLabel:setName("ArcanismoOutrosLabel");
    obj.ArcanismoOutrosLabel:setVisible(true);
    obj.ArcanismoOutrosLabel:setCornerType("round");
    obj.ArcanismoOutrosLabel:setXradius(5);
    obj.ArcanismoOutrosLabel:setYradius(5);

    obj.label301 = GUI.fromHandle(_obj_newObject("label"));
    obj.label301:setParent(obj.ArcanismoOutrosLabel);
    obj.label301:setWidth(55);
    obj.label301:setHeight(25);
    obj.label301:setField("ArcanismoOutros");
    obj.label301:setFontSize(16);
    obj.label301:setVertTextAlign("center");
    obj.label301:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label301, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label301, "fontStyle",  "bold");
    obj.label301:setFontColor("Gray");
    obj.label301:setName("label301");

    obj.ArcanismoOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ArcanismoOutrosEdit:setParent(obj.layout15);
    obj.ArcanismoOutrosEdit:setField("ArcanismoOutros");
    obj.ArcanismoOutrosEdit:setLeft(235);
    obj.ArcanismoOutrosEdit:setTop(0);
    obj.ArcanismoOutrosEdit:setWidth(55);
    obj.ArcanismoOutrosEdit:setHeight(25);
    obj.ArcanismoOutrosEdit:setType("float");
    obj.ArcanismoOutrosEdit:setName("ArcanismoOutrosEdit");
    obj.ArcanismoOutrosEdit:setVisible(false);
    obj.ArcanismoOutrosEdit:setFontSize(16);

    obj.rectangle222 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle222:setParent(obj.layout15);
    obj.rectangle222:setLeft(290);
    obj.rectangle222:setTop(0);
    obj.rectangle222:setWidth(55);
    obj.rectangle222:setHeight(25);
    obj.rectangle222:setColor("transparent");
    obj.rectangle222:setStrokeColor("Gray");
    obj.rectangle222:setStrokeSize(3);
    obj.rectangle222:setVisible(true);
    obj.rectangle222:setOpacity(1);
    obj.rectangle222:setCornerType("round");
    obj.rectangle222:setXradius(5);
    obj.rectangle222:setYradius(5);
    obj.rectangle222:setName("rectangle222");

    obj.label302 = GUI.fromHandle(_obj_newObject("label"));
    obj.label302:setParent(obj.rectangle222);
    obj.label302:setWidth(55);
    obj.label302:setHeight(25);
    obj.label302:setField("modArcanismo");
    obj.label302:setFontSize(16);
    lfm_setPropAsString(obj.label302, "fontStyle",  "bold");
    obj.label302:setFontColor("Gray");
    obj.label302:setVertTextAlign("center");
    obj.label302:setHorzTextAlign("center");
    obj.label302:setName("label302");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout15);
    obj.dataLink24:setFields({'nivel', 'modInt', 'ArcanismoProf', 'ArcanismoOutros'});
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout15);
    obj.dataLink25:setField("modArcanismo");
    obj.dataLink25:setName("dataLink25");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle213);
    obj.layout16:setLeft(15);
    obj.layout16:setTop(114);
    obj.layout16:setWidth(382);
    obj.layout16:setHeight(35);
    obj.layout16:setName("layout16");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout16);
    obj.button29:setLeft(25);
    obj.button29:setTop(1);
    obj.button29:setWidth(100);
    obj.button29:setText("Atletismo");
    obj.button29:setFontSize(14);
    obj.button29:setVertTextAlign("center");
    obj.button29:setHorzTextAlign("center");
    obj.button29:setName("button29");

    obj.rectangle223 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle223:setParent(obj.layout16);
    obj.rectangle223:setLeft(125);
    obj.rectangle223:setTop(0);
    obj.rectangle223:setWidth(55);
    obj.rectangle223:setHeight(25);
    obj.rectangle223:setColor("transparent");
    obj.rectangle223:setStrokeColor("Gray");
    obj.rectangle223:setStrokeSize(1);
    obj.rectangle223:setVisible(true);
    obj.rectangle223:setOpacity(1);
    obj.rectangle223:setCornerType("round");
    obj.rectangle223:setXradius(5);
    obj.rectangle223:setYradius(5);
    obj.rectangle223:setName("rectangle223");

    obj.label303 = GUI.fromHandle(_obj_newObject("label"));
    obj.label303:setParent(obj.rectangle223);
    obj.label303:setWidth(55);
    obj.label303:setHeight(25);
    obj.label303:setField("modFor");
    obj.label303:setFontSize(16);
    lfm_setPropAsString(obj.label303, "fontStyle",  "bold");
    obj.label303:setFontColor("Gray");
    obj.label303:setVertTextAlign("center");
    obj.label303:setHorzTextAlign("center");
    obj.label303:setName("label303");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout16);
    obj.comboBox10:setVertTextAlign("center");
    obj.comboBox10:setHorzTextAlign("trailing");
    obj.comboBox10:setLeft(180);
    obj.comboBox10:setTop(0);
    obj.comboBox10:setWidth(55);
    obj.comboBox10:setHeight(25);
    obj.comboBox10:setField("AtletismoProf");
    obj.comboBox10:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox10:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox10:setFontColor("white");
    obj.comboBox10:setName("comboBox10");

    obj.AtletismoOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.AtletismoOutrosLabel:setParent(obj.layout16);
    obj.AtletismoOutrosLabel:setLeft(235);
    obj.AtletismoOutrosLabel:setTop(0);
    obj.AtletismoOutrosLabel:setWidth(55);
    obj.AtletismoOutrosLabel:setHeight(25);
    obj.AtletismoOutrosLabel:setColor("transparent");
    obj.AtletismoOutrosLabel:setStrokeColor("Gray");
    obj.AtletismoOutrosLabel:setStrokeSize(1);
    obj.AtletismoOutrosLabel:setName("AtletismoOutrosLabel");
    obj.AtletismoOutrosLabel:setVisible(true);
    obj.AtletismoOutrosLabel:setCornerType("round");
    obj.AtletismoOutrosLabel:setXradius(5);
    obj.AtletismoOutrosLabel:setYradius(5);

    obj.label304 = GUI.fromHandle(_obj_newObject("label"));
    obj.label304:setParent(obj.AtletismoOutrosLabel);
    obj.label304:setWidth(55);
    obj.label304:setHeight(25);
    obj.label304:setField("AtletismoOutros");
    obj.label304:setFontSize(16);
    obj.label304:setVertTextAlign("center");
    obj.label304:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label304, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label304, "fontStyle",  "bold");
    obj.label304:setFontColor("Gray");
    obj.label304:setName("label304");

    obj.AtletismoOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.AtletismoOutrosEdit:setParent(obj.layout16);
    obj.AtletismoOutrosEdit:setField("AtletismoOutros");
    obj.AtletismoOutrosEdit:setLeft(235);
    obj.AtletismoOutrosEdit:setTop(0);
    obj.AtletismoOutrosEdit:setWidth(55);
    obj.AtletismoOutrosEdit:setHeight(25);
    obj.AtletismoOutrosEdit:setType("float");
    obj.AtletismoOutrosEdit:setName("AtletismoOutrosEdit");
    obj.AtletismoOutrosEdit:setVisible(false);
    obj.AtletismoOutrosEdit:setFontSize(16);

    obj.rectangle224 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle224:setParent(obj.layout16);
    obj.rectangle224:setLeft(290);
    obj.rectangle224:setTop(0);
    obj.rectangle224:setWidth(55);
    obj.rectangle224:setHeight(25);
    obj.rectangle224:setColor("transparent");
    obj.rectangle224:setStrokeColor("Gray");
    obj.rectangle224:setStrokeSize(3);
    obj.rectangle224:setVisible(true);
    obj.rectangle224:setOpacity(1);
    obj.rectangle224:setCornerType("round");
    obj.rectangle224:setXradius(5);
    obj.rectangle224:setYradius(5);
    obj.rectangle224:setName("rectangle224");

    obj.label305 = GUI.fromHandle(_obj_newObject("label"));
    obj.label305:setParent(obj.rectangle224);
    obj.label305:setWidth(55);
    obj.label305:setHeight(25);
    obj.label305:setField("modAtletismo");
    obj.label305:setFontSize(16);
    lfm_setPropAsString(obj.label305, "fontStyle",  "bold");
    obj.label305:setFontColor("Gray");
    obj.label305:setVertTextAlign("center");
    obj.label305:setHorzTextAlign("center");
    obj.label305:setName("label305");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout16);
    obj.dataLink26:setFields({'nivel', 'modFor', 'AtletismoProf', 'AtletismoOutros'});
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout16);
    obj.dataLink27:setField("modAtletismo");
    obj.dataLink27:setName("dataLink27");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle213);
    obj.layout17:setLeft(15);
    obj.layout17:setTop(139);
    obj.layout17:setWidth(382);
    obj.layout17:setHeight(35);
    obj.layout17:setName("layout17");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout17);
    obj.button30:setLeft(25);
    obj.button30:setTop(1);
    obj.button30:setWidth(100);
    obj.button30:setText("Diplomacia");
    obj.button30:setFontSize(14);
    obj.button30:setVertTextAlign("center");
    obj.button30:setHorzTextAlign("center");
    obj.button30:setName("button30");

    obj.rectangle225 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle225:setParent(obj.layout17);
    obj.rectangle225:setLeft(125);
    obj.rectangle225:setTop(0);
    obj.rectangle225:setWidth(55);
    obj.rectangle225:setHeight(25);
    obj.rectangle225:setColor("transparent");
    obj.rectangle225:setStrokeColor("Gray");
    obj.rectangle225:setStrokeSize(1);
    obj.rectangle225:setVisible(true);
    obj.rectangle225:setOpacity(1);
    obj.rectangle225:setCornerType("round");
    obj.rectangle225:setXradius(5);
    obj.rectangle225:setYradius(5);
    obj.rectangle225:setName("rectangle225");

    obj.label306 = GUI.fromHandle(_obj_newObject("label"));
    obj.label306:setParent(obj.rectangle225);
    obj.label306:setWidth(55);
    obj.label306:setHeight(25);
    obj.label306:setField("modCar");
    obj.label306:setFontSize(16);
    lfm_setPropAsString(obj.label306, "fontStyle",  "bold");
    obj.label306:setFontColor("Gray");
    obj.label306:setVertTextAlign("center");
    obj.label306:setHorzTextAlign("center");
    obj.label306:setName("label306");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout17);
    obj.comboBox11:setVertTextAlign("center");
    obj.comboBox11:setHorzTextAlign("trailing");
    obj.comboBox11:setLeft(180);
    obj.comboBox11:setTop(0);
    obj.comboBox11:setWidth(55);
    obj.comboBox11:setHeight(25);
    obj.comboBox11:setField("DiplomaciaProf");
    obj.comboBox11:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox11:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox11:setFontColor("white");
    obj.comboBox11:setName("comboBox11");

    obj.DiplomaciaOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DiplomaciaOutrosLabel:setParent(obj.layout17);
    obj.DiplomaciaOutrosLabel:setLeft(235);
    obj.DiplomaciaOutrosLabel:setTop(0);
    obj.DiplomaciaOutrosLabel:setWidth(55);
    obj.DiplomaciaOutrosLabel:setHeight(25);
    obj.DiplomaciaOutrosLabel:setColor("transparent");
    obj.DiplomaciaOutrosLabel:setStrokeColor("Gray");
    obj.DiplomaciaOutrosLabel:setStrokeSize(1);
    obj.DiplomaciaOutrosLabel:setName("DiplomaciaOutrosLabel");
    obj.DiplomaciaOutrosLabel:setVisible(true);
    obj.DiplomaciaOutrosLabel:setCornerType("round");
    obj.DiplomaciaOutrosLabel:setXradius(5);
    obj.DiplomaciaOutrosLabel:setYradius(5);

    obj.label307 = GUI.fromHandle(_obj_newObject("label"));
    obj.label307:setParent(obj.DiplomaciaOutrosLabel);
    obj.label307:setWidth(55);
    obj.label307:setHeight(25);
    obj.label307:setField("DiplomaciaOutros");
    obj.label307:setFontSize(16);
    obj.label307:setVertTextAlign("center");
    obj.label307:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label307, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label307, "fontStyle",  "bold");
    obj.label307:setFontColor("Gray");
    obj.label307:setName("label307");

    obj.DiplomaciaOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.DiplomaciaOutrosEdit:setParent(obj.layout17);
    obj.DiplomaciaOutrosEdit:setField("DiplomaciaOutros");
    obj.DiplomaciaOutrosEdit:setLeft(235);
    obj.DiplomaciaOutrosEdit:setTop(0);
    obj.DiplomaciaOutrosEdit:setWidth(55);
    obj.DiplomaciaOutrosEdit:setHeight(25);
    obj.DiplomaciaOutrosEdit:setType("float");
    obj.DiplomaciaOutrosEdit:setName("DiplomaciaOutrosEdit");
    obj.DiplomaciaOutrosEdit:setVisible(false);
    obj.DiplomaciaOutrosEdit:setFontSize(16);

    obj.rectangle226 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle226:setParent(obj.layout17);
    obj.rectangle226:setLeft(290);
    obj.rectangle226:setTop(0);
    obj.rectangle226:setWidth(55);
    obj.rectangle226:setHeight(25);
    obj.rectangle226:setColor("transparent");
    obj.rectangle226:setStrokeColor("Gray");
    obj.rectangle226:setStrokeSize(3);
    obj.rectangle226:setVisible(true);
    obj.rectangle226:setOpacity(1);
    obj.rectangle226:setCornerType("round");
    obj.rectangle226:setXradius(5);
    obj.rectangle226:setYradius(5);
    obj.rectangle226:setName("rectangle226");

    obj.label308 = GUI.fromHandle(_obj_newObject("label"));
    obj.label308:setParent(obj.rectangle226);
    obj.label308:setWidth(55);
    obj.label308:setHeight(25);
    obj.label308:setField("modDiplomacia");
    obj.label308:setFontSize(16);
    lfm_setPropAsString(obj.label308, "fontStyle",  "bold");
    obj.label308:setFontColor("Gray");
    obj.label308:setVertTextAlign("center");
    obj.label308:setHorzTextAlign("center");
    obj.label308:setName("label308");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout17);
    obj.dataLink28:setFields({'nivel', 'modCar', 'DiplomaciaProf', 'DiplomaciaOutros'});
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout17);
    obj.dataLink29:setField("modDiplomacia");
    obj.dataLink29:setName("dataLink29");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle213);
    obj.layout18:setLeft(15);
    obj.layout18:setTop(164);
    obj.layout18:setWidth(382);
    obj.layout18:setHeight(35);
    obj.layout18:setName("layout18");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout18);
    obj.button31:setLeft(25);
    obj.button31:setTop(1);
    obj.button31:setWidth(100);
    obj.button31:setText("Dissimulação");
    obj.button31:setFontSize(14);
    obj.button31:setVertTextAlign("center");
    obj.button31:setHorzTextAlign("center");
    obj.button31:setName("button31");

    obj.rectangle227 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle227:setParent(obj.layout18);
    obj.rectangle227:setLeft(125);
    obj.rectangle227:setTop(0);
    obj.rectangle227:setWidth(55);
    obj.rectangle227:setHeight(25);
    obj.rectangle227:setColor("transparent");
    obj.rectangle227:setStrokeColor("Gray");
    obj.rectangle227:setStrokeSize(1);
    obj.rectangle227:setVisible(true);
    obj.rectangle227:setOpacity(1);
    obj.rectangle227:setCornerType("round");
    obj.rectangle227:setXradius(5);
    obj.rectangle227:setYradius(5);
    obj.rectangle227:setName("rectangle227");

    obj.label309 = GUI.fromHandle(_obj_newObject("label"));
    obj.label309:setParent(obj.rectangle227);
    obj.label309:setWidth(55);
    obj.label309:setHeight(25);
    obj.label309:setField("modCar");
    obj.label309:setFontSize(16);
    lfm_setPropAsString(obj.label309, "fontStyle",  "bold");
    obj.label309:setFontColor("Gray");
    obj.label309:setVertTextAlign("center");
    obj.label309:setHorzTextAlign("center");
    obj.label309:setName("label309");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout18);
    obj.comboBox12:setVertTextAlign("center");
    obj.comboBox12:setHorzTextAlign("trailing");
    obj.comboBox12:setLeft(180);
    obj.comboBox12:setTop(0);
    obj.comboBox12:setWidth(55);
    obj.comboBox12:setHeight(25);
    obj.comboBox12:setField("DissimulacaoProf");
    obj.comboBox12:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox12:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox12:setFontColor("white");
    obj.comboBox12:setName("comboBox12");

    obj.DissimulacaoOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DissimulacaoOutrosLabel:setParent(obj.layout18);
    obj.DissimulacaoOutrosLabel:setLeft(235);
    obj.DissimulacaoOutrosLabel:setTop(0);
    obj.DissimulacaoOutrosLabel:setWidth(55);
    obj.DissimulacaoOutrosLabel:setHeight(25);
    obj.DissimulacaoOutrosLabel:setColor("transparent");
    obj.DissimulacaoOutrosLabel:setStrokeColor("Gray");
    obj.DissimulacaoOutrosLabel:setStrokeSize(1);
    obj.DissimulacaoOutrosLabel:setName("DissimulacaoOutrosLabel");
    obj.DissimulacaoOutrosLabel:setVisible(true);
    obj.DissimulacaoOutrosLabel:setCornerType("round");
    obj.DissimulacaoOutrosLabel:setXradius(5);
    obj.DissimulacaoOutrosLabel:setYradius(5);

    obj.label310 = GUI.fromHandle(_obj_newObject("label"));
    obj.label310:setParent(obj.DissimulacaoOutrosLabel);
    obj.label310:setWidth(55);
    obj.label310:setHeight(25);
    obj.label310:setField("DissimulacaoOutros");
    obj.label310:setFontSize(16);
    obj.label310:setVertTextAlign("center");
    obj.label310:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label310, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label310, "fontStyle",  "bold");
    obj.label310:setFontColor("Gray");
    obj.label310:setName("label310");

    obj.DissimulacaoOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.DissimulacaoOutrosEdit:setParent(obj.layout18);
    obj.DissimulacaoOutrosEdit:setField("DissimulacaoOutros");
    obj.DissimulacaoOutrosEdit:setLeft(235);
    obj.DissimulacaoOutrosEdit:setTop(0);
    obj.DissimulacaoOutrosEdit:setWidth(55);
    obj.DissimulacaoOutrosEdit:setHeight(25);
    obj.DissimulacaoOutrosEdit:setType("float");
    obj.DissimulacaoOutrosEdit:setName("DissimulacaoOutrosEdit");
    obj.DissimulacaoOutrosEdit:setVisible(false);
    obj.DissimulacaoOutrosEdit:setFontSize(16);

    obj.rectangle228 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle228:setParent(obj.layout18);
    obj.rectangle228:setLeft(290);
    obj.rectangle228:setTop(0);
    obj.rectangle228:setWidth(55);
    obj.rectangle228:setHeight(25);
    obj.rectangle228:setColor("transparent");
    obj.rectangle228:setStrokeColor("Gray");
    obj.rectangle228:setStrokeSize(3);
    obj.rectangle228:setVisible(true);
    obj.rectangle228:setOpacity(1);
    obj.rectangle228:setCornerType("round");
    obj.rectangle228:setXradius(5);
    obj.rectangle228:setYradius(5);
    obj.rectangle228:setName("rectangle228");

    obj.label311 = GUI.fromHandle(_obj_newObject("label"));
    obj.label311:setParent(obj.rectangle228);
    obj.label311:setWidth(55);
    obj.label311:setHeight(25);
    obj.label311:setField("modDissimulacao");
    obj.label311:setFontSize(16);
    lfm_setPropAsString(obj.label311, "fontStyle",  "bold");
    obj.label311:setFontColor("Gray");
    obj.label311:setVertTextAlign("center");
    obj.label311:setHorzTextAlign("center");
    obj.label311:setName("label311");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout18);
    obj.dataLink30:setFields({'nivel', 'modCar', 'DissimulacaoProf', 'DissimulacaoOutros'});
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout18);
    obj.dataLink31:setField("modDissimulacao");
    obj.dataLink31:setName("dataLink31");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle213);
    obj.layout19:setLeft(15);
    obj.layout19:setTop(189);
    obj.layout19:setWidth(382);
    obj.layout19:setHeight(35);
    obj.layout19:setName("layout19");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout19);
    obj.button32:setLeft(25);
    obj.button32:setTop(1);
    obj.button32:setWidth(100);
    obj.button32:setText("Furtividade");
    obj.button32:setFontSize(14);
    obj.button32:setVertTextAlign("center");
    obj.button32:setHorzTextAlign("center");
    obj.button32:setName("button32");

    obj.rectangle229 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle229:setParent(obj.layout19);
    obj.rectangle229:setLeft(125);
    obj.rectangle229:setTop(0);
    obj.rectangle229:setWidth(55);
    obj.rectangle229:setHeight(25);
    obj.rectangle229:setColor("transparent");
    obj.rectangle229:setStrokeColor("Gray");
    obj.rectangle229:setStrokeSize(1);
    obj.rectangle229:setVisible(true);
    obj.rectangle229:setOpacity(1);
    obj.rectangle229:setCornerType("round");
    obj.rectangle229:setXradius(5);
    obj.rectangle229:setYradius(5);
    obj.rectangle229:setName("rectangle229");

    obj.label312 = GUI.fromHandle(_obj_newObject("label"));
    obj.label312:setParent(obj.rectangle229);
    obj.label312:setWidth(55);
    obj.label312:setHeight(25);
    obj.label312:setField("modDes");
    obj.label312:setFontSize(16);
    lfm_setPropAsString(obj.label312, "fontStyle",  "bold");
    obj.label312:setFontColor("Gray");
    obj.label312:setVertTextAlign("center");
    obj.label312:setHorzTextAlign("center");
    obj.label312:setName("label312");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout19);
    obj.comboBox13:setVertTextAlign("center");
    obj.comboBox13:setHorzTextAlign("trailing");
    obj.comboBox13:setLeft(180);
    obj.comboBox13:setTop(0);
    obj.comboBox13:setWidth(55);
    obj.comboBox13:setHeight(25);
    obj.comboBox13:setField("FurtividadeProf");
    obj.comboBox13:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox13:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox13:setFontColor("white");
    obj.comboBox13:setName("comboBox13");

    obj.FurtividadeOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.FurtividadeOutrosLabel:setParent(obj.layout19);
    obj.FurtividadeOutrosLabel:setLeft(235);
    obj.FurtividadeOutrosLabel:setTop(0);
    obj.FurtividadeOutrosLabel:setWidth(55);
    obj.FurtividadeOutrosLabel:setHeight(25);
    obj.FurtividadeOutrosLabel:setColor("transparent");
    obj.FurtividadeOutrosLabel:setStrokeColor("Gray");
    obj.FurtividadeOutrosLabel:setStrokeSize(1);
    obj.FurtividadeOutrosLabel:setName("FurtividadeOutrosLabel");
    obj.FurtividadeOutrosLabel:setVisible(true);
    obj.FurtividadeOutrosLabel:setCornerType("round");
    obj.FurtividadeOutrosLabel:setXradius(5);
    obj.FurtividadeOutrosLabel:setYradius(5);

    obj.label313 = GUI.fromHandle(_obj_newObject("label"));
    obj.label313:setParent(obj.FurtividadeOutrosLabel);
    obj.label313:setWidth(55);
    obj.label313:setHeight(25);
    obj.label313:setField("FurtividadeOutros");
    obj.label313:setFontSize(16);
    obj.label313:setVertTextAlign("center");
    obj.label313:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label313, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label313, "fontStyle",  "bold");
    obj.label313:setFontColor("Gray");
    obj.label313:setName("label313");

    obj.FurtividadeOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.FurtividadeOutrosEdit:setParent(obj.layout19);
    obj.FurtividadeOutrosEdit:setField("FurtividadeOutros");
    obj.FurtividadeOutrosEdit:setLeft(235);
    obj.FurtividadeOutrosEdit:setTop(0);
    obj.FurtividadeOutrosEdit:setWidth(55);
    obj.FurtividadeOutrosEdit:setHeight(25);
    obj.FurtividadeOutrosEdit:setType("float");
    obj.FurtividadeOutrosEdit:setName("FurtividadeOutrosEdit");
    obj.FurtividadeOutrosEdit:setVisible(false);
    obj.FurtividadeOutrosEdit:setFontSize(16);

    obj.rectangle230 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle230:setParent(obj.layout19);
    obj.rectangle230:setLeft(290);
    obj.rectangle230:setTop(0);
    obj.rectangle230:setWidth(55);
    obj.rectangle230:setHeight(25);
    obj.rectangle230:setColor("transparent");
    obj.rectangle230:setStrokeColor("Gray");
    obj.rectangle230:setStrokeSize(3);
    obj.rectangle230:setVisible(true);
    obj.rectangle230:setOpacity(1);
    obj.rectangle230:setCornerType("round");
    obj.rectangle230:setXradius(5);
    obj.rectangle230:setYradius(5);
    obj.rectangle230:setName("rectangle230");

    obj.label314 = GUI.fromHandle(_obj_newObject("label"));
    obj.label314:setParent(obj.rectangle230);
    obj.label314:setWidth(55);
    obj.label314:setHeight(25);
    obj.label314:setField("modFurtividade");
    obj.label314:setFontSize(16);
    lfm_setPropAsString(obj.label314, "fontStyle",  "bold");
    obj.label314:setFontColor("Gray");
    obj.label314:setVertTextAlign("center");
    obj.label314:setHorzTextAlign("center");
    obj.label314:setName("label314");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout19);
    obj.dataLink32:setFields({'nivel', 'modDes', 'FurtividadeProf', 'FurtividadeOutros'});
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout19);
    obj.dataLink33:setField("modFurtividade");
    obj.dataLink33:setName("dataLink33");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle213);
    obj.layout20:setLeft(15);
    obj.layout20:setTop(214);
    obj.layout20:setWidth(382);
    obj.layout20:setHeight(35);
    obj.layout20:setName("layout20");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout20);
    obj.button33:setLeft(25);
    obj.button33:setTop(1);
    obj.button33:setWidth(100);
    obj.button33:setText("Intimidação");
    obj.button33:setFontSize(14);
    obj.button33:setVertTextAlign("center");
    obj.button33:setHorzTextAlign("center");
    obj.button33:setName("button33");

    obj.rectangle231 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle231:setParent(obj.layout20);
    obj.rectangle231:setLeft(125);
    obj.rectangle231:setTop(0);
    obj.rectangle231:setWidth(55);
    obj.rectangle231:setHeight(25);
    obj.rectangle231:setColor("transparent");
    obj.rectangle231:setStrokeColor("Gray");
    obj.rectangle231:setStrokeSize(1);
    obj.rectangle231:setVisible(true);
    obj.rectangle231:setOpacity(1);
    obj.rectangle231:setCornerType("round");
    obj.rectangle231:setXradius(5);
    obj.rectangle231:setYradius(5);
    obj.rectangle231:setName("rectangle231");

    obj.label315 = GUI.fromHandle(_obj_newObject("label"));
    obj.label315:setParent(obj.rectangle231);
    obj.label315:setWidth(55);
    obj.label315:setHeight(25);
    obj.label315:setField("modCar");
    obj.label315:setFontSize(16);
    lfm_setPropAsString(obj.label315, "fontStyle",  "bold");
    obj.label315:setFontColor("Gray");
    obj.label315:setVertTextAlign("center");
    obj.label315:setHorzTextAlign("center");
    obj.label315:setName("label315");

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout20);
    obj.comboBox14:setVertTextAlign("center");
    obj.comboBox14:setHorzTextAlign("trailing");
    obj.comboBox14:setLeft(180);
    obj.comboBox14:setTop(0);
    obj.comboBox14:setWidth(55);
    obj.comboBox14:setHeight(25);
    obj.comboBox14:setField("IntimidacaoProf");
    obj.comboBox14:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox14:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox14:setFontColor("white");
    obj.comboBox14:setName("comboBox14");

    obj.IntimidacaoOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.IntimidacaoOutrosLabel:setParent(obj.layout20);
    obj.IntimidacaoOutrosLabel:setLeft(235);
    obj.IntimidacaoOutrosLabel:setTop(0);
    obj.IntimidacaoOutrosLabel:setWidth(55);
    obj.IntimidacaoOutrosLabel:setHeight(25);
    obj.IntimidacaoOutrosLabel:setColor("transparent");
    obj.IntimidacaoOutrosLabel:setStrokeColor("Gray");
    obj.IntimidacaoOutrosLabel:setStrokeSize(1);
    obj.IntimidacaoOutrosLabel:setName("IntimidacaoOutrosLabel");
    obj.IntimidacaoOutrosLabel:setVisible(true);
    obj.IntimidacaoOutrosLabel:setCornerType("round");
    obj.IntimidacaoOutrosLabel:setXradius(5);
    obj.IntimidacaoOutrosLabel:setYradius(5);

    obj.label316 = GUI.fromHandle(_obj_newObject("label"));
    obj.label316:setParent(obj.IntimidacaoOutrosLabel);
    obj.label316:setWidth(55);
    obj.label316:setHeight(25);
    obj.label316:setField("IntimidacaoOutros");
    obj.label316:setFontSize(16);
    obj.label316:setVertTextAlign("center");
    obj.label316:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label316, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label316, "fontStyle",  "bold");
    obj.label316:setFontColor("Gray");
    obj.label316:setName("label316");

    obj.IntimidacaoOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.IntimidacaoOutrosEdit:setParent(obj.layout20);
    obj.IntimidacaoOutrosEdit:setField("IntimidacaoOutros");
    obj.IntimidacaoOutrosEdit:setLeft(235);
    obj.IntimidacaoOutrosEdit:setTop(0);
    obj.IntimidacaoOutrosEdit:setWidth(55);
    obj.IntimidacaoOutrosEdit:setHeight(25);
    obj.IntimidacaoOutrosEdit:setType("float");
    obj.IntimidacaoOutrosEdit:setName("IntimidacaoOutrosEdit");
    obj.IntimidacaoOutrosEdit:setVisible(false);
    obj.IntimidacaoOutrosEdit:setFontSize(16);

    obj.rectangle232 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle232:setParent(obj.layout20);
    obj.rectangle232:setLeft(290);
    obj.rectangle232:setTop(0);
    obj.rectangle232:setWidth(55);
    obj.rectangle232:setHeight(25);
    obj.rectangle232:setColor("transparent");
    obj.rectangle232:setStrokeColor("Gray");
    obj.rectangle232:setStrokeSize(3);
    obj.rectangle232:setVisible(true);
    obj.rectangle232:setOpacity(1);
    obj.rectangle232:setCornerType("round");
    obj.rectangle232:setXradius(5);
    obj.rectangle232:setYradius(5);
    obj.rectangle232:setName("rectangle232");

    obj.label317 = GUI.fromHandle(_obj_newObject("label"));
    obj.label317:setParent(obj.rectangle232);
    obj.label317:setWidth(55);
    obj.label317:setHeight(25);
    obj.label317:setField("modIntimidacao");
    obj.label317:setFontSize(16);
    lfm_setPropAsString(obj.label317, "fontStyle",  "bold");
    obj.label317:setFontColor("Gray");
    obj.label317:setVertTextAlign("center");
    obj.label317:setHorzTextAlign("center");
    obj.label317:setName("label317");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout20);
    obj.dataLink34:setFields({'nivel', 'modCar', 'IntimidacaoProf', 'IntimidacaoOutros'});
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout20);
    obj.dataLink35:setField("modIntimidacao");
    obj.dataLink35:setName("dataLink35");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle213);
    obj.layout21:setLeft(15);
    obj.layout21:setTop(239);
    obj.layout21:setWidth(382);
    obj.layout21:setHeight(35);
    obj.layout21:setName("layout21");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout21);
    obj.button34:setLeft(25);
    obj.button34:setTop(1);
    obj.button34:setWidth(100);
    obj.button34:setText("Ladroagem");
    obj.button34:setFontSize(14);
    obj.button34:setVertTextAlign("center");
    obj.button34:setHorzTextAlign("center");
    obj.button34:setName("button34");

    obj.rectangle233 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle233:setParent(obj.layout21);
    obj.rectangle233:setLeft(125);
    obj.rectangle233:setTop(0);
    obj.rectangle233:setWidth(55);
    obj.rectangle233:setHeight(25);
    obj.rectangle233:setColor("transparent");
    obj.rectangle233:setStrokeColor("Gray");
    obj.rectangle233:setStrokeSize(1);
    obj.rectangle233:setVisible(true);
    obj.rectangle233:setOpacity(1);
    obj.rectangle233:setCornerType("round");
    obj.rectangle233:setXradius(5);
    obj.rectangle233:setYradius(5);
    obj.rectangle233:setName("rectangle233");

    obj.label318 = GUI.fromHandle(_obj_newObject("label"));
    obj.label318:setParent(obj.rectangle233);
    obj.label318:setWidth(55);
    obj.label318:setHeight(25);
    obj.label318:setField("modDes");
    obj.label318:setFontSize(16);
    lfm_setPropAsString(obj.label318, "fontStyle",  "bold");
    obj.label318:setFontColor("Gray");
    obj.label318:setVertTextAlign("center");
    obj.label318:setHorzTextAlign("center");
    obj.label318:setName("label318");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout21);
    obj.comboBox15:setVertTextAlign("center");
    obj.comboBox15:setHorzTextAlign("trailing");
    obj.comboBox15:setLeft(180);
    obj.comboBox15:setTop(0);
    obj.comboBox15:setWidth(55);
    obj.comboBox15:setHeight(25);
    obj.comboBox15:setField("LadroagemProf");
    obj.comboBox15:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox15:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox15:setFontColor("white");
    obj.comboBox15:setName("comboBox15");

    obj.LadroagemOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.LadroagemOutrosLabel:setParent(obj.layout21);
    obj.LadroagemOutrosLabel:setLeft(235);
    obj.LadroagemOutrosLabel:setTop(0);
    obj.LadroagemOutrosLabel:setWidth(55);
    obj.LadroagemOutrosLabel:setHeight(25);
    obj.LadroagemOutrosLabel:setColor("transparent");
    obj.LadroagemOutrosLabel:setStrokeColor("Gray");
    obj.LadroagemOutrosLabel:setStrokeSize(1);
    obj.LadroagemOutrosLabel:setName("LadroagemOutrosLabel");
    obj.LadroagemOutrosLabel:setVisible(true);
    obj.LadroagemOutrosLabel:setCornerType("round");
    obj.LadroagemOutrosLabel:setXradius(5);
    obj.LadroagemOutrosLabel:setYradius(5);

    obj.label319 = GUI.fromHandle(_obj_newObject("label"));
    obj.label319:setParent(obj.LadroagemOutrosLabel);
    obj.label319:setWidth(55);
    obj.label319:setHeight(25);
    obj.label319:setField("LadroagemOutros");
    obj.label319:setFontSize(16);
    obj.label319:setVertTextAlign("center");
    obj.label319:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label319, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label319, "fontStyle",  "bold");
    obj.label319:setFontColor("Gray");
    obj.label319:setName("label319");

    obj.LadroagemOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.LadroagemOutrosEdit:setParent(obj.layout21);
    obj.LadroagemOutrosEdit:setField("LadroagemOutros");
    obj.LadroagemOutrosEdit:setLeft(235);
    obj.LadroagemOutrosEdit:setTop(0);
    obj.LadroagemOutrosEdit:setWidth(55);
    obj.LadroagemOutrosEdit:setHeight(25);
    obj.LadroagemOutrosEdit:setType("float");
    obj.LadroagemOutrosEdit:setName("LadroagemOutrosEdit");
    obj.LadroagemOutrosEdit:setVisible(false);
    obj.LadroagemOutrosEdit:setFontSize(16);

    obj.rectangle234 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle234:setParent(obj.layout21);
    obj.rectangle234:setLeft(290);
    obj.rectangle234:setTop(0);
    obj.rectangle234:setWidth(55);
    obj.rectangle234:setHeight(25);
    obj.rectangle234:setColor("transparent");
    obj.rectangle234:setStrokeColor("Gray");
    obj.rectangle234:setStrokeSize(3);
    obj.rectangle234:setVisible(true);
    obj.rectangle234:setOpacity(1);
    obj.rectangle234:setCornerType("round");
    obj.rectangle234:setXradius(5);
    obj.rectangle234:setYradius(5);
    obj.rectangle234:setName("rectangle234");

    obj.label320 = GUI.fromHandle(_obj_newObject("label"));
    obj.label320:setParent(obj.rectangle234);
    obj.label320:setWidth(55);
    obj.label320:setHeight(25);
    obj.label320:setField("modLadroagem");
    obj.label320:setFontSize(16);
    lfm_setPropAsString(obj.label320, "fontStyle",  "bold");
    obj.label320:setFontColor("Gray");
    obj.label320:setVertTextAlign("center");
    obj.label320:setHorzTextAlign("center");
    obj.label320:setName("label320");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout21);
    obj.dataLink36:setFields({'nivel', 'modDes', 'LadroagemProf', 'LadroagemOutros'});
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout21);
    obj.dataLink37:setField("modLadroagem");
    obj.dataLink37:setName("dataLink37");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle213);
    obj.layout22:setLeft(15);
    obj.layout22:setTop(264);
    obj.layout22:setWidth(382);
    obj.layout22:setHeight(35);
    obj.layout22:setName("layout22");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout22);
    obj.button35:setLeft(25);
    obj.button35:setTop(1);
    obj.button35:setWidth(100);
    obj.button35:setText("Manufatura");
    obj.button35:setFontSize(14);
    obj.button35:setVertTextAlign("center");
    obj.button35:setHorzTextAlign("center");
    obj.button35:setName("button35");

    obj.rectangle235 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle235:setParent(obj.layout22);
    obj.rectangle235:setLeft(125);
    obj.rectangle235:setTop(0);
    obj.rectangle235:setWidth(55);
    obj.rectangle235:setHeight(25);
    obj.rectangle235:setColor("transparent");
    obj.rectangle235:setStrokeColor("Gray");
    obj.rectangle235:setStrokeSize(1);
    obj.rectangle235:setVisible(true);
    obj.rectangle235:setOpacity(1);
    obj.rectangle235:setCornerType("round");
    obj.rectangle235:setXradius(5);
    obj.rectangle235:setYradius(5);
    obj.rectangle235:setName("rectangle235");

    obj.label321 = GUI.fromHandle(_obj_newObject("label"));
    obj.label321:setParent(obj.rectangle235);
    obj.label321:setWidth(55);
    obj.label321:setHeight(25);
    obj.label321:setField("modInt");
    obj.label321:setFontSize(16);
    lfm_setPropAsString(obj.label321, "fontStyle",  "bold");
    obj.label321:setFontColor("Gray");
    obj.label321:setVertTextAlign("center");
    obj.label321:setHorzTextAlign("center");
    obj.label321:setName("label321");

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout22);
    obj.comboBox16:setVertTextAlign("center");
    obj.comboBox16:setHorzTextAlign("trailing");
    obj.comboBox16:setLeft(180);
    obj.comboBox16:setTop(0);
    obj.comboBox16:setWidth(55);
    obj.comboBox16:setHeight(25);
    obj.comboBox16:setField("ManufaturaProf");
    obj.comboBox16:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox16:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox16:setFontColor("white");
    obj.comboBox16:setName("comboBox16");

    obj.ManufaturaOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ManufaturaOutrosLabel:setParent(obj.layout22);
    obj.ManufaturaOutrosLabel:setLeft(235);
    obj.ManufaturaOutrosLabel:setTop(0);
    obj.ManufaturaOutrosLabel:setWidth(55);
    obj.ManufaturaOutrosLabel:setHeight(25);
    obj.ManufaturaOutrosLabel:setColor("transparent");
    obj.ManufaturaOutrosLabel:setStrokeColor("Gray");
    obj.ManufaturaOutrosLabel:setStrokeSize(1);
    obj.ManufaturaOutrosLabel:setName("ManufaturaOutrosLabel");
    obj.ManufaturaOutrosLabel:setVisible(true);
    obj.ManufaturaOutrosLabel:setCornerType("round");
    obj.ManufaturaOutrosLabel:setXradius(5);
    obj.ManufaturaOutrosLabel:setYradius(5);

    obj.label322 = GUI.fromHandle(_obj_newObject("label"));
    obj.label322:setParent(obj.ManufaturaOutrosLabel);
    obj.label322:setWidth(55);
    obj.label322:setHeight(25);
    obj.label322:setField("ManufaturaOutros");
    obj.label322:setFontSize(16);
    obj.label322:setVertTextAlign("center");
    obj.label322:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label322, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label322, "fontStyle",  "bold");
    obj.label322:setFontColor("Gray");
    obj.label322:setName("label322");

    obj.ManufaturaOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ManufaturaOutrosEdit:setParent(obj.layout22);
    obj.ManufaturaOutrosEdit:setField("ManufaturaOutros");
    obj.ManufaturaOutrosEdit:setLeft(235);
    obj.ManufaturaOutrosEdit:setTop(0);
    obj.ManufaturaOutrosEdit:setWidth(55);
    obj.ManufaturaOutrosEdit:setHeight(25);
    obj.ManufaturaOutrosEdit:setType("float");
    obj.ManufaturaOutrosEdit:setName("ManufaturaOutrosEdit");
    obj.ManufaturaOutrosEdit:setVisible(false);
    obj.ManufaturaOutrosEdit:setFontSize(16);

    obj.rectangle236 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle236:setParent(obj.layout22);
    obj.rectangle236:setLeft(290);
    obj.rectangle236:setTop(0);
    obj.rectangle236:setWidth(55);
    obj.rectangle236:setHeight(25);
    obj.rectangle236:setColor("transparent");
    obj.rectangle236:setStrokeColor("Gray");
    obj.rectangle236:setStrokeSize(3);
    obj.rectangle236:setVisible(true);
    obj.rectangle236:setOpacity(1);
    obj.rectangle236:setCornerType("round");
    obj.rectangle236:setXradius(5);
    obj.rectangle236:setYradius(5);
    obj.rectangle236:setName("rectangle236");

    obj.label323 = GUI.fromHandle(_obj_newObject("label"));
    obj.label323:setParent(obj.rectangle236);
    obj.label323:setWidth(55);
    obj.label323:setHeight(25);
    obj.label323:setField("modManufatura");
    obj.label323:setFontSize(16);
    lfm_setPropAsString(obj.label323, "fontStyle",  "bold");
    obj.label323:setFontColor("Gray");
    obj.label323:setVertTextAlign("center");
    obj.label323:setHorzTextAlign("center");
    obj.label323:setName("label323");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout22);
    obj.dataLink38:setFields({'nivel', 'modInt', 'ManufaturaProf', 'ManufaturaOutros'});
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout22);
    obj.dataLink39:setField("modManufatura");
    obj.dataLink39:setName("dataLink39");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle213);
    obj.layout23:setLeft(15);
    obj.layout23:setTop(289);
    obj.layout23:setWidth(382);
    obj.layout23:setHeight(35);
    obj.layout23:setName("layout23");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout23);
    obj.button36:setLeft(25);
    obj.button36:setTop(1);
    obj.button36:setWidth(100);
    obj.button36:setText("Medicina");
    obj.button36:setFontSize(14);
    obj.button36:setVertTextAlign("center");
    obj.button36:setHorzTextAlign("center");
    obj.button36:setName("button36");

    obj.rectangle237 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle237:setParent(obj.layout23);
    obj.rectangle237:setLeft(125);
    obj.rectangle237:setTop(0);
    obj.rectangle237:setWidth(55);
    obj.rectangle237:setHeight(25);
    obj.rectangle237:setColor("transparent");
    obj.rectangle237:setStrokeColor("Gray");
    obj.rectangle237:setStrokeSize(1);
    obj.rectangle237:setVisible(true);
    obj.rectangle237:setOpacity(1);
    obj.rectangle237:setCornerType("round");
    obj.rectangle237:setXradius(5);
    obj.rectangle237:setYradius(5);
    obj.rectangle237:setName("rectangle237");

    obj.label324 = GUI.fromHandle(_obj_newObject("label"));
    obj.label324:setParent(obj.rectangle237);
    obj.label324:setWidth(55);
    obj.label324:setHeight(25);
    obj.label324:setField("modSab");
    obj.label324:setFontSize(16);
    lfm_setPropAsString(obj.label324, "fontStyle",  "bold");
    obj.label324:setFontColor("Gray");
    obj.label324:setVertTextAlign("center");
    obj.label324:setHorzTextAlign("center");
    obj.label324:setName("label324");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout23);
    obj.comboBox17:setVertTextAlign("center");
    obj.comboBox17:setHorzTextAlign("trailing");
    obj.comboBox17:setLeft(180);
    obj.comboBox17:setTop(0);
    obj.comboBox17:setWidth(55);
    obj.comboBox17:setHeight(25);
    obj.comboBox17:setField("MedicinaProf");
    obj.comboBox17:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox17:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox17:setFontColor("white");
    obj.comboBox17:setName("comboBox17");

    obj.MedicinaOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.MedicinaOutrosLabel:setParent(obj.layout23);
    obj.MedicinaOutrosLabel:setLeft(235);
    obj.MedicinaOutrosLabel:setTop(0);
    obj.MedicinaOutrosLabel:setWidth(55);
    obj.MedicinaOutrosLabel:setHeight(25);
    obj.MedicinaOutrosLabel:setColor("transparent");
    obj.MedicinaOutrosLabel:setStrokeColor("Gray");
    obj.MedicinaOutrosLabel:setStrokeSize(1);
    obj.MedicinaOutrosLabel:setName("MedicinaOutrosLabel");
    obj.MedicinaOutrosLabel:setVisible(true);
    obj.MedicinaOutrosLabel:setCornerType("round");
    obj.MedicinaOutrosLabel:setXradius(5);
    obj.MedicinaOutrosLabel:setYradius(5);

    obj.label325 = GUI.fromHandle(_obj_newObject("label"));
    obj.label325:setParent(obj.MedicinaOutrosLabel);
    obj.label325:setWidth(55);
    obj.label325:setHeight(25);
    obj.label325:setField("MedicinaOutros");
    obj.label325:setFontSize(16);
    obj.label325:setVertTextAlign("center");
    obj.label325:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label325, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label325, "fontStyle",  "bold");
    obj.label325:setFontColor("Gray");
    obj.label325:setName("label325");

    obj.MedicinaOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.MedicinaOutrosEdit:setParent(obj.layout23);
    obj.MedicinaOutrosEdit:setField("MedicinaOutros");
    obj.MedicinaOutrosEdit:setLeft(235);
    obj.MedicinaOutrosEdit:setTop(0);
    obj.MedicinaOutrosEdit:setWidth(55);
    obj.MedicinaOutrosEdit:setHeight(25);
    obj.MedicinaOutrosEdit:setType("float");
    obj.MedicinaOutrosEdit:setName("MedicinaOutrosEdit");
    obj.MedicinaOutrosEdit:setVisible(false);
    obj.MedicinaOutrosEdit:setFontSize(16);

    obj.rectangle238 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle238:setParent(obj.layout23);
    obj.rectangle238:setLeft(290);
    obj.rectangle238:setTop(0);
    obj.rectangle238:setWidth(55);
    obj.rectangle238:setHeight(25);
    obj.rectangle238:setColor("transparent");
    obj.rectangle238:setStrokeColor("Gray");
    obj.rectangle238:setStrokeSize(3);
    obj.rectangle238:setVisible(true);
    obj.rectangle238:setOpacity(1);
    obj.rectangle238:setCornerType("round");
    obj.rectangle238:setXradius(5);
    obj.rectangle238:setYradius(5);
    obj.rectangle238:setName("rectangle238");

    obj.label326 = GUI.fromHandle(_obj_newObject("label"));
    obj.label326:setParent(obj.rectangle238);
    obj.label326:setWidth(55);
    obj.label326:setHeight(25);
    obj.label326:setField("modMedicina");
    obj.label326:setFontSize(16);
    lfm_setPropAsString(obj.label326, "fontStyle",  "bold");
    obj.label326:setFontColor("Gray");
    obj.label326:setVertTextAlign("center");
    obj.label326:setHorzTextAlign("center");
    obj.label326:setName("label326");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout23);
    obj.dataLink40:setFields({'nivel', 'modSab', 'MedicinaProf', 'MedicinaOutros'});
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout23);
    obj.dataLink41:setField("modMedicina");
    obj.dataLink41:setName("dataLink41");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle213);
    obj.layout24:setLeft(15);
    obj.layout24:setTop(314);
    obj.layout24:setWidth(382);
    obj.layout24:setHeight(35);
    obj.layout24:setName("layout24");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout24);
    obj.button37:setLeft(25);
    obj.button37:setTop(1);
    obj.button37:setWidth(100);
    obj.button37:setText("Natureza");
    obj.button37:setFontSize(14);
    obj.button37:setVertTextAlign("center");
    obj.button37:setHorzTextAlign("center");
    obj.button37:setName("button37");

    obj.rectangle239 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle239:setParent(obj.layout24);
    obj.rectangle239:setLeft(125);
    obj.rectangle239:setTop(0);
    obj.rectangle239:setWidth(55);
    obj.rectangle239:setHeight(25);
    obj.rectangle239:setColor("transparent");
    obj.rectangle239:setStrokeColor("Gray");
    obj.rectangle239:setStrokeSize(1);
    obj.rectangle239:setVisible(true);
    obj.rectangle239:setOpacity(1);
    obj.rectangle239:setCornerType("round");
    obj.rectangle239:setXradius(5);
    obj.rectangle239:setYradius(5);
    obj.rectangle239:setName("rectangle239");

    obj.label327 = GUI.fromHandle(_obj_newObject("label"));
    obj.label327:setParent(obj.rectangle239);
    obj.label327:setWidth(55);
    obj.label327:setHeight(25);
    obj.label327:setField("modSab");
    obj.label327:setFontSize(16);
    lfm_setPropAsString(obj.label327, "fontStyle",  "bold");
    obj.label327:setFontColor("Gray");
    obj.label327:setVertTextAlign("center");
    obj.label327:setHorzTextAlign("center");
    obj.label327:setName("label327");

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout24);
    obj.comboBox18:setVertTextAlign("center");
    obj.comboBox18:setHorzTextAlign("trailing");
    obj.comboBox18:setLeft(180);
    obj.comboBox18:setTop(0);
    obj.comboBox18:setWidth(55);
    obj.comboBox18:setHeight(25);
    obj.comboBox18:setField("NaturezaProf");
    obj.comboBox18:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox18:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox18:setFontColor("white");
    obj.comboBox18:setName("comboBox18");

    obj.NaturezaOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.NaturezaOutrosLabel:setParent(obj.layout24);
    obj.NaturezaOutrosLabel:setLeft(235);
    obj.NaturezaOutrosLabel:setTop(0);
    obj.NaturezaOutrosLabel:setWidth(55);
    obj.NaturezaOutrosLabel:setHeight(25);
    obj.NaturezaOutrosLabel:setColor("transparent");
    obj.NaturezaOutrosLabel:setStrokeColor("Gray");
    obj.NaturezaOutrosLabel:setStrokeSize(1);
    obj.NaturezaOutrosLabel:setName("NaturezaOutrosLabel");
    obj.NaturezaOutrosLabel:setVisible(true);
    obj.NaturezaOutrosLabel:setCornerType("round");
    obj.NaturezaOutrosLabel:setXradius(5);
    obj.NaturezaOutrosLabel:setYradius(5);

    obj.label328 = GUI.fromHandle(_obj_newObject("label"));
    obj.label328:setParent(obj.NaturezaOutrosLabel);
    obj.label328:setWidth(55);
    obj.label328:setHeight(25);
    obj.label328:setField("NaturezaOutros");
    obj.label328:setFontSize(16);
    obj.label328:setVertTextAlign("center");
    obj.label328:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label328, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label328, "fontStyle",  "bold");
    obj.label328:setFontColor("Gray");
    obj.label328:setName("label328");

    obj.NaturezaOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.NaturezaOutrosEdit:setParent(obj.layout24);
    obj.NaturezaOutrosEdit:setField("NaturezaOutros");
    obj.NaturezaOutrosEdit:setLeft(235);
    obj.NaturezaOutrosEdit:setTop(0);
    obj.NaturezaOutrosEdit:setWidth(55);
    obj.NaturezaOutrosEdit:setHeight(25);
    obj.NaturezaOutrosEdit:setType("float");
    obj.NaturezaOutrosEdit:setName("NaturezaOutrosEdit");
    obj.NaturezaOutrosEdit:setVisible(false);
    obj.NaturezaOutrosEdit:setFontSize(16);

    obj.rectangle240 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle240:setParent(obj.layout24);
    obj.rectangle240:setLeft(290);
    obj.rectangle240:setTop(0);
    obj.rectangle240:setWidth(55);
    obj.rectangle240:setHeight(25);
    obj.rectangle240:setColor("transparent");
    obj.rectangle240:setStrokeColor("Gray");
    obj.rectangle240:setStrokeSize(3);
    obj.rectangle240:setVisible(true);
    obj.rectangle240:setOpacity(1);
    obj.rectangle240:setCornerType("round");
    obj.rectangle240:setXradius(5);
    obj.rectangle240:setYradius(5);
    obj.rectangle240:setName("rectangle240");

    obj.label329 = GUI.fromHandle(_obj_newObject("label"));
    obj.label329:setParent(obj.rectangle240);
    obj.label329:setWidth(55);
    obj.label329:setHeight(25);
    obj.label329:setField("modNatureza");
    obj.label329:setFontSize(16);
    lfm_setPropAsString(obj.label329, "fontStyle",  "bold");
    obj.label329:setFontColor("Gray");
    obj.label329:setVertTextAlign("center");
    obj.label329:setHorzTextAlign("center");
    obj.label329:setName("label329");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout24);
    obj.dataLink42:setFields({'nivel', 'modSab', 'NaturezaProf', 'NaturezaOutros'});
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout24);
    obj.dataLink43:setField("modNatureza");
    obj.dataLink43:setName("dataLink43");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle213);
    obj.layout25:setLeft(15);
    obj.layout25:setTop(339);
    obj.layout25:setWidth(382);
    obj.layout25:setHeight(35);
    obj.layout25:setName("layout25");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout25);
    obj.button38:setLeft(25);
    obj.button38:setTop(1);
    obj.button38:setWidth(100);
    obj.button38:setText("Ocultismo");
    obj.button38:setFontSize(14);
    obj.button38:setVertTextAlign("center");
    obj.button38:setHorzTextAlign("center");
    obj.button38:setName("button38");

    obj.rectangle241 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle241:setParent(obj.layout25);
    obj.rectangle241:setLeft(125);
    obj.rectangle241:setTop(0);
    obj.rectangle241:setWidth(55);
    obj.rectangle241:setHeight(25);
    obj.rectangle241:setColor("transparent");
    obj.rectangle241:setStrokeColor("Gray");
    obj.rectangle241:setStrokeSize(1);
    obj.rectangle241:setVisible(true);
    obj.rectangle241:setOpacity(1);
    obj.rectangle241:setCornerType("round");
    obj.rectangle241:setXradius(5);
    obj.rectangle241:setYradius(5);
    obj.rectangle241:setName("rectangle241");

    obj.label330 = GUI.fromHandle(_obj_newObject("label"));
    obj.label330:setParent(obj.rectangle241);
    obj.label330:setWidth(55);
    obj.label330:setHeight(25);
    obj.label330:setField("modInt");
    obj.label330:setFontSize(16);
    lfm_setPropAsString(obj.label330, "fontStyle",  "bold");
    obj.label330:setFontColor("Gray");
    obj.label330:setVertTextAlign("center");
    obj.label330:setHorzTextAlign("center");
    obj.label330:setName("label330");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout25);
    obj.comboBox19:setVertTextAlign("center");
    obj.comboBox19:setHorzTextAlign("trailing");
    obj.comboBox19:setLeft(180);
    obj.comboBox19:setTop(0);
    obj.comboBox19:setWidth(55);
    obj.comboBox19:setHeight(25);
    obj.comboBox19:setField("OcultismoProf");
    obj.comboBox19:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox19:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox19:setFontColor("white");
    obj.comboBox19:setName("comboBox19");

    obj.OcultismoOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.OcultismoOutrosLabel:setParent(obj.layout25);
    obj.OcultismoOutrosLabel:setLeft(235);
    obj.OcultismoOutrosLabel:setTop(0);
    obj.OcultismoOutrosLabel:setWidth(55);
    obj.OcultismoOutrosLabel:setHeight(25);
    obj.OcultismoOutrosLabel:setColor("transparent");
    obj.OcultismoOutrosLabel:setStrokeColor("Gray");
    obj.OcultismoOutrosLabel:setStrokeSize(1);
    obj.OcultismoOutrosLabel:setName("OcultismoOutrosLabel");
    obj.OcultismoOutrosLabel:setVisible(true);
    obj.OcultismoOutrosLabel:setCornerType("round");
    obj.OcultismoOutrosLabel:setXradius(5);
    obj.OcultismoOutrosLabel:setYradius(5);

    obj.label331 = GUI.fromHandle(_obj_newObject("label"));
    obj.label331:setParent(obj.OcultismoOutrosLabel);
    obj.label331:setWidth(55);
    obj.label331:setHeight(25);
    obj.label331:setField("OcultismoOutros");
    obj.label331:setFontSize(16);
    obj.label331:setVertTextAlign("center");
    obj.label331:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label331, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label331, "fontStyle",  "bold");
    obj.label331:setFontColor("Gray");
    obj.label331:setName("label331");

    obj.OcultismoOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.OcultismoOutrosEdit:setParent(obj.layout25);
    obj.OcultismoOutrosEdit:setField("OcultismoOutros");
    obj.OcultismoOutrosEdit:setLeft(235);
    obj.OcultismoOutrosEdit:setTop(0);
    obj.OcultismoOutrosEdit:setWidth(55);
    obj.OcultismoOutrosEdit:setHeight(25);
    obj.OcultismoOutrosEdit:setType("float");
    obj.OcultismoOutrosEdit:setName("OcultismoOutrosEdit");
    obj.OcultismoOutrosEdit:setVisible(false);
    obj.OcultismoOutrosEdit:setFontSize(16);

    obj.rectangle242 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle242:setParent(obj.layout25);
    obj.rectangle242:setLeft(290);
    obj.rectangle242:setTop(0);
    obj.rectangle242:setWidth(55);
    obj.rectangle242:setHeight(25);
    obj.rectangle242:setColor("transparent");
    obj.rectangle242:setStrokeColor("Gray");
    obj.rectangle242:setStrokeSize(3);
    obj.rectangle242:setVisible(true);
    obj.rectangle242:setOpacity(1);
    obj.rectangle242:setCornerType("round");
    obj.rectangle242:setXradius(5);
    obj.rectangle242:setYradius(5);
    obj.rectangle242:setName("rectangle242");

    obj.label332 = GUI.fromHandle(_obj_newObject("label"));
    obj.label332:setParent(obj.rectangle242);
    obj.label332:setWidth(55);
    obj.label332:setHeight(25);
    obj.label332:setField("modOcultismo");
    obj.label332:setFontSize(16);
    lfm_setPropAsString(obj.label332, "fontStyle",  "bold");
    obj.label332:setFontColor("Gray");
    obj.label332:setVertTextAlign("center");
    obj.label332:setHorzTextAlign("center");
    obj.label332:setName("label332");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout25);
    obj.dataLink44:setFields({'nivel', 'modInt', 'OcultismoProf', 'OcultismoOutros'});
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout25);
    obj.dataLink45:setField("modOcultismo");
    obj.dataLink45:setName("dataLink45");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle213);
    obj.layout26:setLeft(15);
    obj.layout26:setTop(364);
    obj.layout26:setWidth(382);
    obj.layout26:setHeight(35);
    obj.layout26:setName("layout26");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout26);
    obj.button39:setLeft(25);
    obj.button39:setTop(1);
    obj.button39:setWidth(100);
    obj.button39:setText("Performance");
    obj.button39:setFontSize(14);
    obj.button39:setVertTextAlign("center");
    obj.button39:setHorzTextAlign("center");
    obj.button39:setName("button39");

    obj.rectangle243 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle243:setParent(obj.layout26);
    obj.rectangle243:setLeft(125);
    obj.rectangle243:setTop(0);
    obj.rectangle243:setWidth(55);
    obj.rectangle243:setHeight(25);
    obj.rectangle243:setColor("transparent");
    obj.rectangle243:setStrokeColor("Gray");
    obj.rectangle243:setStrokeSize(1);
    obj.rectangle243:setVisible(true);
    obj.rectangle243:setOpacity(1);
    obj.rectangle243:setCornerType("round");
    obj.rectangle243:setXradius(5);
    obj.rectangle243:setYradius(5);
    obj.rectangle243:setName("rectangle243");

    obj.label333 = GUI.fromHandle(_obj_newObject("label"));
    obj.label333:setParent(obj.rectangle243);
    obj.label333:setWidth(55);
    obj.label333:setHeight(25);
    obj.label333:setField("modCar");
    obj.label333:setFontSize(16);
    lfm_setPropAsString(obj.label333, "fontStyle",  "bold");
    obj.label333:setFontColor("Gray");
    obj.label333:setVertTextAlign("center");
    obj.label333:setHorzTextAlign("center");
    obj.label333:setName("label333");

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout26);
    obj.comboBox20:setVertTextAlign("center");
    obj.comboBox20:setHorzTextAlign("trailing");
    obj.comboBox20:setLeft(180);
    obj.comboBox20:setTop(0);
    obj.comboBox20:setWidth(55);
    obj.comboBox20:setHeight(25);
    obj.comboBox20:setField("PerformanceProf");
    obj.comboBox20:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox20:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox20:setFontColor("white");
    obj.comboBox20:setName("comboBox20");

    obj.PerformanceOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.PerformanceOutrosLabel:setParent(obj.layout26);
    obj.PerformanceOutrosLabel:setLeft(235);
    obj.PerformanceOutrosLabel:setTop(0);
    obj.PerformanceOutrosLabel:setWidth(55);
    obj.PerformanceOutrosLabel:setHeight(25);
    obj.PerformanceOutrosLabel:setColor("transparent");
    obj.PerformanceOutrosLabel:setStrokeColor("Gray");
    obj.PerformanceOutrosLabel:setStrokeSize(1);
    obj.PerformanceOutrosLabel:setName("PerformanceOutrosLabel");
    obj.PerformanceOutrosLabel:setVisible(true);
    obj.PerformanceOutrosLabel:setCornerType("round");
    obj.PerformanceOutrosLabel:setXradius(5);
    obj.PerformanceOutrosLabel:setYradius(5);

    obj.label334 = GUI.fromHandle(_obj_newObject("label"));
    obj.label334:setParent(obj.PerformanceOutrosLabel);
    obj.label334:setWidth(55);
    obj.label334:setHeight(25);
    obj.label334:setField("PerformanceOutros");
    obj.label334:setFontSize(16);
    obj.label334:setVertTextAlign("center");
    obj.label334:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label334, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label334, "fontStyle",  "bold");
    obj.label334:setFontColor("Gray");
    obj.label334:setName("label334");

    obj.PerformanceOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.PerformanceOutrosEdit:setParent(obj.layout26);
    obj.PerformanceOutrosEdit:setField("PerformanceOutros");
    obj.PerformanceOutrosEdit:setLeft(235);
    obj.PerformanceOutrosEdit:setTop(0);
    obj.PerformanceOutrosEdit:setWidth(55);
    obj.PerformanceOutrosEdit:setHeight(25);
    obj.PerformanceOutrosEdit:setType("float");
    obj.PerformanceOutrosEdit:setName("PerformanceOutrosEdit");
    obj.PerformanceOutrosEdit:setVisible(false);
    obj.PerformanceOutrosEdit:setFontSize(16);

    obj.rectangle244 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle244:setParent(obj.layout26);
    obj.rectangle244:setLeft(290);
    obj.rectangle244:setTop(0);
    obj.rectangle244:setWidth(55);
    obj.rectangle244:setHeight(25);
    obj.rectangle244:setColor("transparent");
    obj.rectangle244:setStrokeColor("Gray");
    obj.rectangle244:setStrokeSize(3);
    obj.rectangle244:setVisible(true);
    obj.rectangle244:setOpacity(1);
    obj.rectangle244:setCornerType("round");
    obj.rectangle244:setXradius(5);
    obj.rectangle244:setYradius(5);
    obj.rectangle244:setName("rectangle244");

    obj.label335 = GUI.fromHandle(_obj_newObject("label"));
    obj.label335:setParent(obj.rectangle244);
    obj.label335:setWidth(55);
    obj.label335:setHeight(25);
    obj.label335:setField("modPerformance");
    obj.label335:setFontSize(16);
    lfm_setPropAsString(obj.label335, "fontStyle",  "bold");
    obj.label335:setFontColor("Gray");
    obj.label335:setVertTextAlign("center");
    obj.label335:setHorzTextAlign("center");
    obj.label335:setName("label335");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout26);
    obj.dataLink46:setFields({'nivel', 'modCar', 'PerformanceProf', 'PerformanceOutros'});
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout26);
    obj.dataLink47:setField("modPerformance");
    obj.dataLink47:setName("dataLink47");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle213);
    obj.layout27:setLeft(15);
    obj.layout27:setTop(389);
    obj.layout27:setWidth(382);
    obj.layout27:setHeight(35);
    obj.layout27:setName("layout27");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout27);
    obj.button40:setLeft(25);
    obj.button40:setTop(1);
    obj.button40:setWidth(100);
    obj.button40:setText("Religião");
    obj.button40:setFontSize(14);
    obj.button40:setVertTextAlign("center");
    obj.button40:setHorzTextAlign("center");
    obj.button40:setName("button40");

    obj.rectangle245 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle245:setParent(obj.layout27);
    obj.rectangle245:setLeft(125);
    obj.rectangle245:setTop(0);
    obj.rectangle245:setWidth(55);
    obj.rectangle245:setHeight(25);
    obj.rectangle245:setColor("transparent");
    obj.rectangle245:setStrokeColor("Gray");
    obj.rectangle245:setStrokeSize(1);
    obj.rectangle245:setVisible(true);
    obj.rectangle245:setOpacity(1);
    obj.rectangle245:setCornerType("round");
    obj.rectangle245:setXradius(5);
    obj.rectangle245:setYradius(5);
    obj.rectangle245:setName("rectangle245");

    obj.label336 = GUI.fromHandle(_obj_newObject("label"));
    obj.label336:setParent(obj.rectangle245);
    obj.label336:setWidth(55);
    obj.label336:setHeight(25);
    obj.label336:setField("modSab");
    obj.label336:setFontSize(16);
    lfm_setPropAsString(obj.label336, "fontStyle",  "bold");
    obj.label336:setFontColor("Gray");
    obj.label336:setVertTextAlign("center");
    obj.label336:setHorzTextAlign("center");
    obj.label336:setName("label336");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout27);
    obj.comboBox21:setVertTextAlign("center");
    obj.comboBox21:setHorzTextAlign("trailing");
    obj.comboBox21:setLeft(180);
    obj.comboBox21:setTop(0);
    obj.comboBox21:setWidth(55);
    obj.comboBox21:setHeight(25);
    obj.comboBox21:setField("ReligiaoProf");
    obj.comboBox21:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox21:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox21:setFontColor("white");
    obj.comboBox21:setName("comboBox21");

    obj.ReligiaoOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.ReligiaoOutrosLabel:setParent(obj.layout27);
    obj.ReligiaoOutrosLabel:setLeft(235);
    obj.ReligiaoOutrosLabel:setTop(0);
    obj.ReligiaoOutrosLabel:setWidth(55);
    obj.ReligiaoOutrosLabel:setHeight(25);
    obj.ReligiaoOutrosLabel:setColor("transparent");
    obj.ReligiaoOutrosLabel:setStrokeColor("Gray");
    obj.ReligiaoOutrosLabel:setStrokeSize(1);
    obj.ReligiaoOutrosLabel:setName("ReligiaoOutrosLabel");
    obj.ReligiaoOutrosLabel:setVisible(true);
    obj.ReligiaoOutrosLabel:setCornerType("round");
    obj.ReligiaoOutrosLabel:setXradius(5);
    obj.ReligiaoOutrosLabel:setYradius(5);

    obj.label337 = GUI.fromHandle(_obj_newObject("label"));
    obj.label337:setParent(obj.ReligiaoOutrosLabel);
    obj.label337:setWidth(55);
    obj.label337:setHeight(25);
    obj.label337:setField("ReligiaoOutros");
    obj.label337:setFontSize(16);
    obj.label337:setVertTextAlign("center");
    obj.label337:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label337, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label337, "fontStyle",  "bold");
    obj.label337:setFontColor("Gray");
    obj.label337:setName("label337");

    obj.ReligiaoOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.ReligiaoOutrosEdit:setParent(obj.layout27);
    obj.ReligiaoOutrosEdit:setField("ReligiaoOutros");
    obj.ReligiaoOutrosEdit:setLeft(235);
    obj.ReligiaoOutrosEdit:setTop(0);
    obj.ReligiaoOutrosEdit:setWidth(55);
    obj.ReligiaoOutrosEdit:setHeight(25);
    obj.ReligiaoOutrosEdit:setType("float");
    obj.ReligiaoOutrosEdit:setName("ReligiaoOutrosEdit");
    obj.ReligiaoOutrosEdit:setVisible(false);
    obj.ReligiaoOutrosEdit:setFontSize(16);

    obj.rectangle246 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle246:setParent(obj.layout27);
    obj.rectangle246:setLeft(290);
    obj.rectangle246:setTop(0);
    obj.rectangle246:setWidth(55);
    obj.rectangle246:setHeight(25);
    obj.rectangle246:setColor("transparent");
    obj.rectangle246:setStrokeColor("Gray");
    obj.rectangle246:setStrokeSize(3);
    obj.rectangle246:setVisible(true);
    obj.rectangle246:setOpacity(1);
    obj.rectangle246:setCornerType("round");
    obj.rectangle246:setXradius(5);
    obj.rectangle246:setYradius(5);
    obj.rectangle246:setName("rectangle246");

    obj.label338 = GUI.fromHandle(_obj_newObject("label"));
    obj.label338:setParent(obj.rectangle246);
    obj.label338:setWidth(55);
    obj.label338:setHeight(25);
    obj.label338:setField("modReligiao");
    obj.label338:setFontSize(16);
    lfm_setPropAsString(obj.label338, "fontStyle",  "bold");
    obj.label338:setFontColor("Gray");
    obj.label338:setVertTextAlign("center");
    obj.label338:setHorzTextAlign("center");
    obj.label338:setName("label338");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout27);
    obj.dataLink48:setFields({'nivel', 'modSab', 'ReligiaoProf', 'ReligiaoOutros'});
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout27);
    obj.dataLink49:setField("modReligiao");
    obj.dataLink49:setName("dataLink49");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle213);
    obj.layout28:setLeft(15);
    obj.layout28:setTop(414);
    obj.layout28:setWidth(382);
    obj.layout28:setHeight(35);
    obj.layout28:setName("layout28");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout28);
    obj.button41:setLeft(25);
    obj.button41:setTop(1);
    obj.button41:setWidth(100);
    obj.button41:setText("Sobrevivência");
    obj.button41:setFontSize(14);
    obj.button41:setVertTextAlign("center");
    obj.button41:setHorzTextAlign("center");
    obj.button41:setName("button41");

    obj.rectangle247 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle247:setParent(obj.layout28);
    obj.rectangle247:setLeft(125);
    obj.rectangle247:setTop(0);
    obj.rectangle247:setWidth(55);
    obj.rectangle247:setHeight(25);
    obj.rectangle247:setColor("transparent");
    obj.rectangle247:setStrokeColor("Gray");
    obj.rectangle247:setStrokeSize(1);
    obj.rectangle247:setVisible(true);
    obj.rectangle247:setOpacity(1);
    obj.rectangle247:setCornerType("round");
    obj.rectangle247:setXradius(5);
    obj.rectangle247:setYradius(5);
    obj.rectangle247:setName("rectangle247");

    obj.label339 = GUI.fromHandle(_obj_newObject("label"));
    obj.label339:setParent(obj.rectangle247);
    obj.label339:setWidth(55);
    obj.label339:setHeight(25);
    obj.label339:setField("modSab");
    obj.label339:setFontSize(16);
    lfm_setPropAsString(obj.label339, "fontStyle",  "bold");
    obj.label339:setFontColor("Gray");
    obj.label339:setVertTextAlign("center");
    obj.label339:setHorzTextAlign("center");
    obj.label339:setName("label339");

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout28);
    obj.comboBox22:setVertTextAlign("center");
    obj.comboBox22:setHorzTextAlign("trailing");
    obj.comboBox22:setLeft(180);
    obj.comboBox22:setTop(0);
    obj.comboBox22:setWidth(55);
    obj.comboBox22:setHeight(25);
    obj.comboBox22:setField("SobrevivenciaProf");
    obj.comboBox22:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox22:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox22:setFontColor("white");
    obj.comboBox22:setName("comboBox22");

    obj.SobrevivenciaOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.SobrevivenciaOutrosLabel:setParent(obj.layout28);
    obj.SobrevivenciaOutrosLabel:setLeft(235);
    obj.SobrevivenciaOutrosLabel:setTop(0);
    obj.SobrevivenciaOutrosLabel:setWidth(55);
    obj.SobrevivenciaOutrosLabel:setHeight(25);
    obj.SobrevivenciaOutrosLabel:setColor("transparent");
    obj.SobrevivenciaOutrosLabel:setStrokeColor("Gray");
    obj.SobrevivenciaOutrosLabel:setStrokeSize(1);
    obj.SobrevivenciaOutrosLabel:setName("SobrevivenciaOutrosLabel");
    obj.SobrevivenciaOutrosLabel:setVisible(true);
    obj.SobrevivenciaOutrosLabel:setCornerType("round");
    obj.SobrevivenciaOutrosLabel:setXradius(5);
    obj.SobrevivenciaOutrosLabel:setYradius(5);

    obj.label340 = GUI.fromHandle(_obj_newObject("label"));
    obj.label340:setParent(obj.SobrevivenciaOutrosLabel);
    obj.label340:setWidth(55);
    obj.label340:setHeight(25);
    obj.label340:setField("SobrevivenciaOutros");
    obj.label340:setFontSize(16);
    obj.label340:setVertTextAlign("center");
    obj.label340:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label340, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label340, "fontStyle",  "bold");
    obj.label340:setFontColor("Gray");
    obj.label340:setName("label340");

    obj.SobrevivenciaOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.SobrevivenciaOutrosEdit:setParent(obj.layout28);
    obj.SobrevivenciaOutrosEdit:setField("SobrevivenciaOutros");
    obj.SobrevivenciaOutrosEdit:setLeft(235);
    obj.SobrevivenciaOutrosEdit:setTop(0);
    obj.SobrevivenciaOutrosEdit:setWidth(55);
    obj.SobrevivenciaOutrosEdit:setHeight(25);
    obj.SobrevivenciaOutrosEdit:setType("float");
    obj.SobrevivenciaOutrosEdit:setName("SobrevivenciaOutrosEdit");
    obj.SobrevivenciaOutrosEdit:setVisible(false);
    obj.SobrevivenciaOutrosEdit:setFontSize(16);

    obj.rectangle248 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle248:setParent(obj.layout28);
    obj.rectangle248:setLeft(290);
    obj.rectangle248:setTop(0);
    obj.rectangle248:setWidth(55);
    obj.rectangle248:setHeight(25);
    obj.rectangle248:setColor("transparent");
    obj.rectangle248:setStrokeColor("Gray");
    obj.rectangle248:setStrokeSize(3);
    obj.rectangle248:setVisible(true);
    obj.rectangle248:setOpacity(1);
    obj.rectangle248:setCornerType("round");
    obj.rectangle248:setXradius(5);
    obj.rectangle248:setYradius(5);
    obj.rectangle248:setName("rectangle248");

    obj.label341 = GUI.fromHandle(_obj_newObject("label"));
    obj.label341:setParent(obj.rectangle248);
    obj.label341:setWidth(55);
    obj.label341:setHeight(25);
    obj.label341:setField("modSobrevivencia");
    obj.label341:setFontSize(16);
    lfm_setPropAsString(obj.label341, "fontStyle",  "bold");
    obj.label341:setFontColor("Gray");
    obj.label341:setVertTextAlign("center");
    obj.label341:setHorzTextAlign("center");
    obj.label341:setName("label341");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout28);
    obj.dataLink50:setFields({'nivel', 'modSab', 'SobrevivenciaProf', 'SobrevivenciaOutros'});
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout28);
    obj.dataLink51:setField("modSobrevivencia");
    obj.dataLink51:setName("dataLink51");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle213);
    obj.layout29:setLeft(15);
    obj.layout29:setTop(439);
    obj.layout29:setWidth(382);
    obj.layout29:setHeight(35);
    obj.layout29:setName("layout29");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout29);
    obj.button42:setLeft(25);
    obj.button42:setTop(1);
    obj.button42:setWidth(100);
    obj.button42:setText("Sociedade");
    obj.button42:setFontSize(14);
    obj.button42:setVertTextAlign("center");
    obj.button42:setHorzTextAlign("center");
    obj.button42:setName("button42");

    obj.rectangle249 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle249:setParent(obj.layout29);
    obj.rectangle249:setLeft(125);
    obj.rectangle249:setTop(0);
    obj.rectangle249:setWidth(55);
    obj.rectangle249:setHeight(25);
    obj.rectangle249:setColor("transparent");
    obj.rectangle249:setStrokeColor("Gray");
    obj.rectangle249:setStrokeSize(1);
    obj.rectangle249:setVisible(true);
    obj.rectangle249:setOpacity(1);
    obj.rectangle249:setCornerType("round");
    obj.rectangle249:setXradius(5);
    obj.rectangle249:setYradius(5);
    obj.rectangle249:setName("rectangle249");

    obj.label342 = GUI.fromHandle(_obj_newObject("label"));
    obj.label342:setParent(obj.rectangle249);
    obj.label342:setWidth(55);
    obj.label342:setHeight(25);
    obj.label342:setField("modInt");
    obj.label342:setFontSize(16);
    lfm_setPropAsString(obj.label342, "fontStyle",  "bold");
    obj.label342:setFontColor("Gray");
    obj.label342:setVertTextAlign("center");
    obj.label342:setHorzTextAlign("center");
    obj.label342:setName("label342");

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout29);
    obj.comboBox23:setVertTextAlign("center");
    obj.comboBox23:setHorzTextAlign("trailing");
    obj.comboBox23:setLeft(180);
    obj.comboBox23:setTop(0);
    obj.comboBox23:setWidth(55);
    obj.comboBox23:setHeight(25);
    obj.comboBox23:setField("SociedadeProf");
    obj.comboBox23:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox23:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox23:setFontColor("white");
    obj.comboBox23:setName("comboBox23");

    obj.SociedadeOutrosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.SociedadeOutrosLabel:setParent(obj.layout29);
    obj.SociedadeOutrosLabel:setLeft(235);
    obj.SociedadeOutrosLabel:setTop(0);
    obj.SociedadeOutrosLabel:setWidth(55);
    obj.SociedadeOutrosLabel:setHeight(25);
    obj.SociedadeOutrosLabel:setColor("transparent");
    obj.SociedadeOutrosLabel:setStrokeColor("Gray");
    obj.SociedadeOutrosLabel:setStrokeSize(1);
    obj.SociedadeOutrosLabel:setName("SociedadeOutrosLabel");
    obj.SociedadeOutrosLabel:setVisible(true);
    obj.SociedadeOutrosLabel:setCornerType("round");
    obj.SociedadeOutrosLabel:setXradius(5);
    obj.SociedadeOutrosLabel:setYradius(5);

    obj.label343 = GUI.fromHandle(_obj_newObject("label"));
    obj.label343:setParent(obj.SociedadeOutrosLabel);
    obj.label343:setWidth(55);
    obj.label343:setHeight(25);
    obj.label343:setField("SociedadeOutros");
    obj.label343:setFontSize(16);
    obj.label343:setVertTextAlign("center");
    obj.label343:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label343, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label343, "fontStyle",  "bold");
    obj.label343:setFontColor("Gray");
    obj.label343:setName("label343");

    obj.SociedadeOutrosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.SociedadeOutrosEdit:setParent(obj.layout29);
    obj.SociedadeOutrosEdit:setField("SociedadeOutros");
    obj.SociedadeOutrosEdit:setLeft(235);
    obj.SociedadeOutrosEdit:setTop(0);
    obj.SociedadeOutrosEdit:setWidth(55);
    obj.SociedadeOutrosEdit:setHeight(25);
    obj.SociedadeOutrosEdit:setType("float");
    obj.SociedadeOutrosEdit:setName("SociedadeOutrosEdit");
    obj.SociedadeOutrosEdit:setVisible(false);
    obj.SociedadeOutrosEdit:setFontSize(16);

    obj.rectangle250 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle250:setParent(obj.layout29);
    obj.rectangle250:setLeft(290);
    obj.rectangle250:setTop(0);
    obj.rectangle250:setWidth(55);
    obj.rectangle250:setHeight(25);
    obj.rectangle250:setColor("transparent");
    obj.rectangle250:setStrokeColor("Gray");
    obj.rectangle250:setStrokeSize(3);
    obj.rectangle250:setVisible(true);
    obj.rectangle250:setOpacity(1);
    obj.rectangle250:setCornerType("round");
    obj.rectangle250:setXradius(5);
    obj.rectangle250:setYradius(5);
    obj.rectangle250:setName("rectangle250");

    obj.label344 = GUI.fromHandle(_obj_newObject("label"));
    obj.label344:setParent(obj.rectangle250);
    obj.label344:setWidth(55);
    obj.label344:setHeight(25);
    obj.label344:setField("modSociedade");
    obj.label344:setFontSize(16);
    lfm_setPropAsString(obj.label344, "fontStyle",  "bold");
    obj.label344:setFontColor("Gray");
    obj.label344:setVertTextAlign("center");
    obj.label344:setHorzTextAlign("center");
    obj.label344:setName("label344");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout29);
    obj.dataLink52:setFields({'nivel', 'modInt', 'SociedadeProf', 'SociedadeOutros'});
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout29);
    obj.dataLink53:setField("modSociedade");
    obj.dataLink53:setName("dataLink53");

    obj.rectangle251 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle251:setParent(obj.rectangle213);
    obj.rectangle251:setLeft(137);
    obj.rectangle251:setTop(474);
    obj.rectangle251:setName("rectangle251");
    obj.rectangle251:setWidth(131);
    obj.rectangle251:setHeight(25);
    obj.rectangle251:setColor("transparent");
    obj.rectangle251:setStrokeColor("Gray");
    obj.rectangle251:setStrokeSize(2);
    obj.rectangle251:setCornerType("innerRound");
    obj.rectangle251:setXradius(5);
    obj.rectangle251:setYradius(5);

    obj.label345 = GUI.fromHandle(_obj_newObject("label"));
    obj.label345:setParent(obj.rectangle251);
    obj.label345:setWidth(131);
    obj.label345:setHeight(25);
    obj.label345:setText("Saber");
    obj.label345:setVertTextAlign("center");
    obj.label345:setHorzTextAlign("center");
    obj.label345:setFontSize(16);
    obj.label345:setFontColor("Gray");
    obj.label345:setFontFamily("Stencil");
    obj.label345:setName("label345");

    obj.rectangle252 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle252:setParent(obj.rectangle213);
    obj.rectangle252:setLeft(5);
    obj.rectangle252:setTop(499);
    obj.rectangle252:setWidth(391);
    obj.rectangle252:setHeight(120);
    obj.rectangle252:setColor("transparent");
    obj.rectangle252:setStrokeColor("Gray");
    obj.rectangle252:setStrokeSize(1);
    obj.rectangle252:setCornerType("round");
    obj.rectangle252:setXradius(10);
    obj.rectangle252:setYradius(10);
    obj.rectangle252:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle252:setName("rectangle252");

    obj.rectangle253 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle253:setParent(obj.rectangle252);
    obj.rectangle253:setLeft(0);
    obj.rectangle253:setWidth(100);
    obj.rectangle253:setTop(0);
    obj.rectangle253:setName("rectangle253");
    obj.rectangle253:setHeight(25);
    obj.rectangle253:setColor("transparent");
    obj.rectangle253:setStrokeColor("Gray");
    obj.rectangle253:setStrokeSize(2);
    obj.rectangle253:setCornerType("round");
    obj.rectangle253:setXradius(5);
    obj.rectangle253:setYradius(5);

    obj.label346 = GUI.fromHandle(_obj_newObject("label"));
    obj.label346:setParent(obj.rectangle253);
    obj.label346:setVertTextAlign("center");
    obj.label346:setHorzTextAlign("center");
    obj.label346:setWidth(100);
    obj.label346:setHeight(25);
    obj.label346:setText("Perícia");
    obj.label346:setFontColor("Gray");
    obj.label346:setFontFamily("Stencil");
    obj.label346:setName("label346");

    obj.rectangle254 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle254:setParent(obj.rectangle252);
    obj.rectangle254:setLeft(100);
    obj.rectangle254:setTop(0);
    obj.rectangle254:setName("rectangle254");
    obj.rectangle254:setWidth(55);
    obj.rectangle254:setHeight(25);
    obj.rectangle254:setColor("transparent");
    obj.rectangle254:setStrokeColor("Gray");
    obj.rectangle254:setStrokeSize(2);
    obj.rectangle254:setCornerType("round");
    obj.rectangle254:setXradius(5);
    obj.rectangle254:setYradius(5);

    obj.label347 = GUI.fromHandle(_obj_newObject("label"));
    obj.label347:setParent(obj.rectangle254);
    obj.label347:setVertTextAlign("center");
    obj.label347:setHorzTextAlign("center");
    obj.label347:setWidth(55);
    obj.label347:setHeight(25);
    obj.label347:setText("ATR");
    obj.label347:setFontColor("Gray");
    obj.label347:setFontFamily("Stencil");
    obj.label347:setName("label347");

    obj.rectangle255 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle255:setParent(obj.rectangle252);
    obj.rectangle255:setLeft(155);
    obj.rectangle255:setTop(0);
    obj.rectangle255:setName("rectangle255");
    obj.rectangle255:setWidth(55);
    obj.rectangle255:setHeight(25);
    obj.rectangle255:setColor("transparent");
    obj.rectangle255:setStrokeColor("Gray");
    obj.rectangle255:setStrokeSize(2);
    obj.rectangle255:setCornerType("round");
    obj.rectangle255:setXradius(5);
    obj.rectangle255:setYradius(5);

    obj.label348 = GUI.fromHandle(_obj_newObject("label"));
    obj.label348:setParent(obj.rectangle255);
    obj.label348:setVertTextAlign("center");
    obj.label348:setHorzTextAlign("center");
    obj.label348:setWidth(55);
    obj.label348:setHeight(25);
    obj.label348:setText("Prof");
    obj.label348:setFontColor("Gray");
    obj.label348:setFontFamily("Stencil");
    obj.label348:setName("label348");

    obj.rectangle256 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle256:setParent(obj.rectangle252);
    obj.rectangle256:setLeft(210);
    obj.rectangle256:setTop(0);
    obj.rectangle256:setName("rectangle256");
    obj.rectangle256:setWidth(55);
    obj.rectangle256:setHeight(25);
    obj.rectangle256:setColor("transparent");
    obj.rectangle256:setStrokeColor("Gray");
    obj.rectangle256:setStrokeSize(2);
    obj.rectangle256:setCornerType("round");
    obj.rectangle256:setXradius(5);
    obj.rectangle256:setYradius(5);

    obj.label349 = GUI.fromHandle(_obj_newObject("label"));
    obj.label349:setParent(obj.rectangle256);
    obj.label349:setVertTextAlign("center");
    obj.label349:setHorzTextAlign("center");
    obj.label349:setWidth(55);
    obj.label349:setHeight(25);
    obj.label349:setText("Outros");
    obj.label349:setFontColor("Gray");
    obj.label349:setFontFamily("Stencil");
    obj.label349:setName("label349");

    obj.rectangle257 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle257:setParent(obj.rectangle252);
    obj.rectangle257:setLeft(265);
    obj.rectangle257:setTop(0);
    obj.rectangle257:setWidth(102);
    obj.rectangle257:setStrokeSize(3);
    obj.rectangle257:setName("rectangle257");
    obj.rectangle257:setHeight(25);
    obj.rectangle257:setColor("transparent");
    obj.rectangle257:setStrokeColor("Gray");
    obj.rectangle257:setCornerType("round");
    obj.rectangle257:setXradius(5);
    obj.rectangle257:setYradius(5);

    obj.label350 = GUI.fromHandle(_obj_newObject("label"));
    obj.label350:setParent(obj.rectangle257);
    obj.label350:setVertTextAlign("center");
    obj.label350:setHorzTextAlign("center");
    obj.label350:setWidth(102);
    obj.label350:setHeight(25);
    obj.label350:setText("Bônus");
    obj.label350:setFontColor("Gray");
    obj.label350:setFontFamily("Stencil");
    obj.label350:setName("label350");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.rectangle252);
    obj.button43:setLeft(367);
    obj.button43:setTop(1);
    obj.button43:setWidth(23);
    obj.button43:setHeight(23);
    obj.button43:setText("+");
    obj.button43:setName("button43");

    obj.nomeSaberLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeSaberLabel:setParent(obj.rectangle252);
    obj.nomeSaberLabel:setLeft(0);
    obj.nomeSaberLabel:setTop(25);
    obj.nomeSaberLabel:setWidth(100);
    obj.nomeSaberLabel:setHeight(25);
    obj.nomeSaberLabel:setColor("transparent");
    obj.nomeSaberLabel:setStrokeColor("Gray");
    obj.nomeSaberLabel:setStrokeSize(1);
    obj.nomeSaberLabel:setName("nomeSaberLabel");
    obj.nomeSaberLabel:setVisible(true);
    obj.nomeSaberLabel:setCornerType("round");
    obj.nomeSaberLabel:setXradius(5);
    obj.nomeSaberLabel:setYradius(5);

    obj.label351 = GUI.fromHandle(_obj_newObject("label"));
    obj.label351:setParent(obj.nomeSaberLabel);
    obj.label351:setWidth(100);
    obj.label351:setHeight(25);
    obj.label351:setField("nomeSaber");
    obj.label351:setFontSize(16);
    obj.label351:setVertTextAlign("center");
    obj.label351:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label351, "fontStyle",  "bold");
    obj.label351:setFontColor("Gray");
    obj.label351:setName("label351");

    obj.nomeSaberEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeSaberEdit:setParent(obj.rectangle252);
    obj.nomeSaberEdit:setField("nomeSaber");
    obj.nomeSaberEdit:setLeft(0);
    obj.nomeSaberEdit:setTop(25);
    obj.nomeSaberEdit:setWidth(100);
    obj.nomeSaberEdit:setHeight(25);
    obj.nomeSaberEdit:setName("nomeSaberEdit");
    obj.nomeSaberEdit:setVisible(false);
    obj.nomeSaberEdit:setFontSize(16);

    obj.rectangle258 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle258:setParent(obj.rectangle252);
    obj.rectangle258:setLeft(100);
    obj.rectangle258:setTop(25);
    obj.rectangle258:setWidth(55);
    obj.rectangle258:setHeight(25);
    obj.rectangle258:setColor("transparent");
    obj.rectangle258:setStrokeColor("Gray");
    obj.rectangle258:setStrokeSize(1);
    obj.rectangle258:setVisible(true);
    obj.rectangle258:setOpacity(1);
    obj.rectangle258:setCornerType("round");
    obj.rectangle258:setXradius(5);
    obj.rectangle258:setYradius(5);
    obj.rectangle258:setName("rectangle258");

    obj.label352 = GUI.fromHandle(_obj_newObject("label"));
    obj.label352:setParent(obj.rectangle258);
    obj.label352:setWidth(55);
    obj.label352:setHeight(25);
    obj.label352:setField("modInt");
    obj.label352:setFontSize(16);
    lfm_setPropAsString(obj.label352, "fontStyle",  "bold");
    obj.label352:setFontColor("Gray");
    obj.label352:setVertTextAlign("center");
    obj.label352:setHorzTextAlign("center");
    obj.label352:setName("label352");

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.rectangle252);
    obj.comboBox24:setVertTextAlign("center");
    obj.comboBox24:setHorzTextAlign("trailing");
    obj.comboBox24:setLeft(155);
    obj.comboBox24:setTop(25);
    obj.comboBox24:setWidth(55);
    obj.comboBox24:setHeight(25);
    obj.comboBox24:setField("profSaber");
    obj.comboBox24:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox24:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox24:setFontColor("white");
    obj.comboBox24:setName("comboBox24");

    obj.outrosSaberLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.outrosSaberLabel:setParent(obj.rectangle252);
    obj.outrosSaberLabel:setLeft(210);
    obj.outrosSaberLabel:setTop(25);
    obj.outrosSaberLabel:setWidth(55);
    obj.outrosSaberLabel:setHeight(25);
    obj.outrosSaberLabel:setColor("transparent");
    obj.outrosSaberLabel:setStrokeColor("Gray");
    obj.outrosSaberLabel:setStrokeSize(1);
    obj.outrosSaberLabel:setName("outrosSaberLabel");
    obj.outrosSaberLabel:setVisible(true);
    obj.outrosSaberLabel:setCornerType("round");
    obj.outrosSaberLabel:setXradius(5);
    obj.outrosSaberLabel:setYradius(5);

    obj.label353 = GUI.fromHandle(_obj_newObject("label"));
    obj.label353:setParent(obj.outrosSaberLabel);
    obj.label353:setWidth(55);
    obj.label353:setHeight(25);
    obj.label353:setField("outrosSaber");
    obj.label353:setFontSize(16);
    obj.label353:setVertTextAlign("center");
    obj.label353:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label353, "fontStyle",  "bold");
    obj.label353:setFontColor("Gray");
    obj.label353:setName("label353");

    obj.outrosSaberEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.outrosSaberEdit:setParent(obj.rectangle252);
    obj.outrosSaberEdit:setField("outrosSaber");
    obj.outrosSaberEdit:setLeft(210);
    obj.outrosSaberEdit:setTop(25);
    obj.outrosSaberEdit:setWidth(55);
    obj.outrosSaberEdit:setHeight(25);
    obj.outrosSaberEdit:setName("outrosSaberEdit");
    obj.outrosSaberEdit:setVisible(false);
    obj.outrosSaberEdit:setFontSize(16);

    obj.rectangle259 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle259:setParent(obj.rectangle252);
    obj.rectangle259:setLeft(265);
    obj.rectangle259:setTop(25);
    obj.rectangle259:setWidth(102);
    obj.rectangle259:setHeight(25);
    obj.rectangle259:setColor("transparent");
    obj.rectangle259:setStrokeColor("Gray");
    obj.rectangle259:setStrokeSize(3);
    obj.rectangle259:setVisible(true);
    obj.rectangle259:setOpacity(1);
    obj.rectangle259:setCornerType("round");
    obj.rectangle259:setXradius(5);
    obj.rectangle259:setYradius(5);
    obj.rectangle259:setName("rectangle259");

    obj.label354 = GUI.fromHandle(_obj_newObject("label"));
    obj.label354:setParent(obj.rectangle259);
    obj.label354:setWidth(102);
    obj.label354:setHeight(25);
    obj.label354:setField("bonusSaber");
    obj.label354:setFontSize(16);
    lfm_setPropAsString(obj.label354, "fontStyle",  "bold");
    obj.label354:setFontColor("Gray");
    obj.label354:setVertTextAlign("center");
    obj.label354:setHorzTextAlign("center");
    obj.label354:setName("label354");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.rectangle252);
    obj.button44:setLeft(367);
    obj.button44:setTop(25);
    obj.button44:setWidth(23);
    obj.button44:setHeight(23);
    obj.button44:setText("R");
    obj.button44:setName("button44");

    obj.rclSaber = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSaber:setParent(obj.rectangle252);
    obj.rclSaber:setLeft(0);
    obj.rclSaber:setTop(50);
    obj.rclSaber:setName("rclSaber");
    obj.rclSaber:setField("campoSaber");
    obj.rclSaber:setTemplateForm("frmSaber");
    obj.rclSaber:setWidth(390);
    obj.rclSaber:setHeight(65);
    obj.rclSaber:setLayout("vertical");
    obj.rclSaber:setMinQt(0);

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.rectangle252);
    obj.dataLink54:setFields({'nivel', 'modInt', 'profSaber', 'outrosSaber'});
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.rectangle252);
    obj.dataLink55:setField("bonusSaber");
    obj.dataLink55:setName("dataLink55");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setWidth(405);
    obj.flowPart9:setHeight(628);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setAlign("top");
    obj.flowPart9:setMinScaledWidth(400);
    obj.flowPart9:setAvoidScale(true);
    obj.flowPart9:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle260 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle260:setParent(obj.flowPart9);
    obj.rectangle260:setAlign("client");
    obj.rectangle260:setName("rectangle260");
    obj.rectangle260:setColor("transparent");
    obj.rectangle260:setCornerType("round");
    obj.rectangle260:setXradius(15);
    obj.rectangle260:setYradius(15);
    obj.rectangle260:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.rectangle260);
    obj.image21:setAlign("client");
    obj.image21:setStyle("stretch");
    obj.image21:setSRC("/imagens/Fundo 3.png");
    obj.image21:setOpacity(0.1);
    obj.image21:setName("image21");

    obj.label355 = GUI.fromHandle(_obj_newObject("label"));
    obj.label355:setParent(obj.rectangle260);
    obj.label355:setLeft(0);
    obj.label355:setTop(5);
    obj.label355:setWidth(400);
    obj.label355:setHeight(25);
    obj.label355:setText("Proficiências");
    obj.label355:setFontSize(20);
    obj.label355:setVertTextAlign("center");
    obj.label355:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label355, "fontStyle",  "italic");
    obj.label355:setFontColor("Gray");
    obj.label355:setFontFamily("Stencil");
    obj.label355:setName("label355");

    obj.rectangle261 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle261:setParent(obj.rectangle260);
    obj.rectangle261:setLeft(137);
    obj.rectangle261:setTop(70);
    obj.rectangle261:setName("rectangle261");
    obj.rectangle261:setWidth(131);
    obj.rectangle261:setHeight(25);
    obj.rectangle261:setColor("transparent");
    obj.rectangle261:setStrokeColor("Gray");
    obj.rectangle261:setStrokeSize(2);
    obj.rectangle261:setCornerType("innerRound");
    obj.rectangle261:setXradius(5);
    obj.rectangle261:setYradius(5);

    obj.label356 = GUI.fromHandle(_obj_newObject("label"));
    obj.label356:setParent(obj.rectangle261);
    obj.label356:setWidth(131);
    obj.label356:setHeight(25);
    obj.label356:setText("Armas");
    obj.label356:setVertTextAlign("center");
    obj.label356:setHorzTextAlign("center");
    obj.label356:setFontSize(16);
    obj.label356:setFontColor("Gray");
    obj.label356:setFontFamily("Stencil");
    obj.label356:setName("label356");

    obj.rectangle262 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle262:setParent(obj.rectangle260);
    obj.rectangle262:setLeft(115);
    obj.rectangle262:setTop(95);
    obj.rectangle262:setWidth(175);
    obj.rectangle262:setHeight(125);
    obj.rectangle262:setColor("transparent");
    obj.rectangle262:setStrokeColor("Gray");
    obj.rectangle262:setStrokeSize(1);
    obj.rectangle262:setCornerType("round");
    obj.rectangle262:setXradius(10);
    obj.rectangle262:setYradius(10);
    obj.rectangle262:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle262:setName("rectangle262");

    obj.rectangle263 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle263:setParent(obj.rectangle262);
    obj.rectangle263:setLeft(5);
    obj.rectangle263:setTop(5);
    obj.rectangle263:setWidth(110);
    obj.rectangle263:setHeight(25);
    obj.rectangle263:setColor("transparent");
    obj.rectangle263:setStrokeColor("Gray");
    obj.rectangle263:setStrokeSize(2);
    obj.rectangle263:setCornerType("bevel");
    obj.rectangle263:setXradius(5);
    obj.rectangle263:setYradius(5);
    obj.rectangle263:setName("rectangle263");

    obj.label357 = GUI.fromHandle(_obj_newObject("label"));
    obj.label357:setParent(obj.rectangle263);
    obj.label357:setVertTextAlign("center");
    obj.label357:setHorzTextAlign("center");
    obj.label357:setWidth(110);
    obj.label357:setHeight(25);
    obj.label357:setText("Desarmado");
    obj.label357:setFontColor("Gray");
    obj.label357:setFontFamily("Stencil");
    obj.label357:setName("label357");

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.rectangle262);
    obj.comboBox25:setVertTextAlign("center");
    obj.comboBox25:setHorzTextAlign("trailing");
    obj.comboBox25:setLeft(115);
    obj.comboBox25:setTop(5);
    obj.comboBox25:setWidth(55);
    obj.comboBox25:setHeight(25);
    obj.comboBox25:setField("desarmado");
    obj.comboBox25:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox25:setFontColor("white");
    obj.comboBox25:setName("comboBox25");

    obj.rectangle264 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle264:setParent(obj.rectangle262);
    obj.rectangle264:setLeft(5);
    obj.rectangle264:setTop(35);
    obj.rectangle264:setWidth(110);
    obj.rectangle264:setHeight(25);
    obj.rectangle264:setColor("transparent");
    obj.rectangle264:setStrokeColor("Gray");
    obj.rectangle264:setStrokeSize(2);
    obj.rectangle264:setCornerType("bevel");
    obj.rectangle264:setXradius(5);
    obj.rectangle264:setYradius(5);
    obj.rectangle264:setName("rectangle264");

    obj.label358 = GUI.fromHandle(_obj_newObject("label"));
    obj.label358:setParent(obj.rectangle264);
    obj.label358:setVertTextAlign("center");
    obj.label358:setHorzTextAlign("center");
    obj.label358:setWidth(110);
    obj.label358:setHeight(25);
    obj.label358:setText("Simples");
    obj.label358:setFontColor("Gray");
    obj.label358:setFontFamily("Stencil");
    obj.label358:setName("label358");

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.rectangle262);
    obj.comboBox26:setVertTextAlign("center");
    obj.comboBox26:setHorzTextAlign("trailing");
    obj.comboBox26:setLeft(115);
    obj.comboBox26:setTop(35);
    obj.comboBox26:setWidth(55);
    obj.comboBox26:setHeight(25);
    obj.comboBox26:setField("simples");
    obj.comboBox26:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox26:setFontColor("white");
    obj.comboBox26:setName("comboBox26");

    obj.rectangle265 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle265:setParent(obj.rectangle262);
    obj.rectangle265:setLeft(5);
    obj.rectangle265:setTop(65);
    obj.rectangle265:setWidth(110);
    obj.rectangle265:setHeight(25);
    obj.rectangle265:setColor("transparent");
    obj.rectangle265:setStrokeColor("Gray");
    obj.rectangle265:setStrokeSize(2);
    obj.rectangle265:setCornerType("bevel");
    obj.rectangle265:setXradius(5);
    obj.rectangle265:setYradius(5);
    obj.rectangle265:setName("rectangle265");

    obj.label359 = GUI.fromHandle(_obj_newObject("label"));
    obj.label359:setParent(obj.rectangle265);
    obj.label359:setVertTextAlign("center");
    obj.label359:setHorzTextAlign("center");
    obj.label359:setWidth(110);
    obj.label359:setHeight(25);
    obj.label359:setText("Marcial");
    obj.label359:setFontColor("Gray");
    obj.label359:setFontFamily("Stencil");
    obj.label359:setName("label359");

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.rectangle262);
    obj.comboBox27:setVertTextAlign("center");
    obj.comboBox27:setHorzTextAlign("trailing");
    obj.comboBox27:setLeft(115);
    obj.comboBox27:setTop(65);
    obj.comboBox27:setWidth(55);
    obj.comboBox27:setHeight(25);
    obj.comboBox27:setField("marcial");
    obj.comboBox27:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox27:setFontColor("white");
    obj.comboBox27:setName("comboBox27");

    obj.rectangle266 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle266:setParent(obj.rectangle262);
    obj.rectangle266:setLeft(5);
    obj.rectangle266:setTop(95);
    obj.rectangle266:setWidth(110);
    obj.rectangle266:setHeight(25);
    obj.rectangle266:setColor("transparent");
    obj.rectangle266:setStrokeColor("Gray");
    obj.rectangle266:setStrokeSize(2);
    obj.rectangle266:setCornerType("bevel");
    obj.rectangle266:setXradius(5);
    obj.rectangle266:setYradius(5);
    obj.rectangle266:setName("rectangle266");

    obj.label360 = GUI.fromHandle(_obj_newObject("label"));
    obj.label360:setParent(obj.rectangle266);
    obj.label360:setVertTextAlign("center");
    obj.label360:setHorzTextAlign("center");
    obj.label360:setWidth(110);
    obj.label360:setHeight(25);
    obj.label360:setText("Avançado");
    obj.label360:setFontColor("Gray");
    obj.label360:setFontFamily("Stencil");
    obj.label360:setName("label360");

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.rectangle262);
    obj.comboBox28:setVertTextAlign("center");
    obj.comboBox28:setHorzTextAlign("trailing");
    obj.comboBox28:setLeft(115);
    obj.comboBox28:setTop(95);
    obj.comboBox28:setWidth(55);
    obj.comboBox28:setHeight(25);
    obj.comboBox28:setField("avancado");
    obj.comboBox28:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox28:setFontColor("white");
    obj.comboBox28:setName("comboBox28");

    obj.rectangle267 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle267:setParent(obj.rectangle260);
    obj.rectangle267:setLeft(137);
    obj.rectangle267:setTop(265);
    obj.rectangle267:setName("rectangle267");
    obj.rectangle267:setWidth(131);
    obj.rectangle267:setHeight(25);
    obj.rectangle267:setColor("transparent");
    obj.rectangle267:setStrokeColor("Gray");
    obj.rectangle267:setStrokeSize(2);
    obj.rectangle267:setCornerType("innerRound");
    obj.rectangle267:setXradius(5);
    obj.rectangle267:setYradius(5);

    obj.label361 = GUI.fromHandle(_obj_newObject("label"));
    obj.label361:setParent(obj.rectangle267);
    obj.label361:setWidth(131);
    obj.label361:setHeight(25);
    obj.label361:setText("Armaduras");
    obj.label361:setVertTextAlign("center");
    obj.label361:setHorzTextAlign("center");
    obj.label361:setFontSize(16);
    obj.label361:setFontColor("Gray");
    obj.label361:setFontFamily("Stencil");
    obj.label361:setName("label361");

    obj.rectangle268 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle268:setParent(obj.rectangle260);
    obj.rectangle268:setLeft(115);
    obj.rectangle268:setTop(290);
    obj.rectangle268:setWidth(175);
    obj.rectangle268:setHeight(125);
    obj.rectangle268:setColor("transparent");
    obj.rectangle268:setStrokeColor("Gray");
    obj.rectangle268:setStrokeSize(1);
    obj.rectangle268:setCornerType("round");
    obj.rectangle268:setXradius(10);
    obj.rectangle268:setYradius(10);
    obj.rectangle268:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle268:setName("rectangle268");

    obj.rectangle269 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle269:setParent(obj.rectangle268);
    obj.rectangle269:setLeft(5);
    obj.rectangle269:setTop(5);
    obj.rectangle269:setWidth(110);
    obj.rectangle269:setHeight(25);
    obj.rectangle269:setColor("transparent");
    obj.rectangle269:setStrokeColor("Gray");
    obj.rectangle269:setStrokeSize(2);
    obj.rectangle269:setCornerType("bevel");
    obj.rectangle269:setXradius(5);
    obj.rectangle269:setYradius(5);
    obj.rectangle269:setName("rectangle269");

    obj.label362 = GUI.fromHandle(_obj_newObject("label"));
    obj.label362:setParent(obj.rectangle269);
    obj.label362:setVertTextAlign("center");
    obj.label362:setHorzTextAlign("center");
    obj.label362:setWidth(110);
    obj.label362:setHeight(25);
    obj.label362:setText("Sem Armadura");
    obj.label362:setFontColor("Gray");
    obj.label362:setFontFamily("Stencil");
    obj.label362:setName("label362");

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.rectangle268);
    obj.comboBox29:setVertTextAlign("center");
    obj.comboBox29:setHorzTextAlign("trailing");
    obj.comboBox29:setLeft(115);
    obj.comboBox29:setTop(5);
    obj.comboBox29:setWidth(55);
    obj.comboBox29:setHeight(25);
    obj.comboBox29:setField("semArmadura");
    obj.comboBox29:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox29:setFontColor("white");
    obj.comboBox29:setName("comboBox29");

    obj.rectangle270 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle270:setParent(obj.rectangle268);
    obj.rectangle270:setLeft(5);
    obj.rectangle270:setTop(35);
    obj.rectangle270:setWidth(110);
    obj.rectangle270:setHeight(25);
    obj.rectangle270:setColor("transparent");
    obj.rectangle270:setStrokeColor("Gray");
    obj.rectangle270:setStrokeSize(2);
    obj.rectangle270:setCornerType("bevel");
    obj.rectangle270:setXradius(5);
    obj.rectangle270:setYradius(5);
    obj.rectangle270:setName("rectangle270");

    obj.label363 = GUI.fromHandle(_obj_newObject("label"));
    obj.label363:setParent(obj.rectangle270);
    obj.label363:setVertTextAlign("center");
    obj.label363:setHorzTextAlign("center");
    obj.label363:setWidth(110);
    obj.label363:setHeight(25);
    obj.label363:setText("Leve");
    obj.label363:setFontColor("Gray");
    obj.label363:setFontFamily("Stencil");
    obj.label363:setName("label363");

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.rectangle268);
    obj.comboBox30:setVertTextAlign("center");
    obj.comboBox30:setHorzTextAlign("trailing");
    obj.comboBox30:setLeft(115);
    obj.comboBox30:setTop(35);
    obj.comboBox30:setWidth(55);
    obj.comboBox30:setHeight(25);
    obj.comboBox30:setField("leve");
    obj.comboBox30:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox30:setFontColor("white");
    obj.comboBox30:setName("comboBox30");

    obj.rectangle271 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle271:setParent(obj.rectangle268);
    obj.rectangle271:setLeft(5);
    obj.rectangle271:setTop(65);
    obj.rectangle271:setWidth(110);
    obj.rectangle271:setHeight(25);
    obj.rectangle271:setColor("transparent");
    obj.rectangle271:setStrokeColor("Gray");
    obj.rectangle271:setStrokeSize(2);
    obj.rectangle271:setCornerType("bevel");
    obj.rectangle271:setXradius(5);
    obj.rectangle271:setYradius(5);
    obj.rectangle271:setName("rectangle271");

    obj.label364 = GUI.fromHandle(_obj_newObject("label"));
    obj.label364:setParent(obj.rectangle271);
    obj.label364:setVertTextAlign("center");
    obj.label364:setHorzTextAlign("center");
    obj.label364:setWidth(110);
    obj.label364:setHeight(25);
    obj.label364:setText("Média");
    obj.label364:setFontColor("Gray");
    obj.label364:setFontFamily("Stencil");
    obj.label364:setName("label364");

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.rectangle268);
    obj.comboBox31:setVertTextAlign("center");
    obj.comboBox31:setHorzTextAlign("trailing");
    obj.comboBox31:setLeft(115);
    obj.comboBox31:setTop(65);
    obj.comboBox31:setWidth(55);
    obj.comboBox31:setHeight(25);
    obj.comboBox31:setField("media");
    obj.comboBox31:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox31:setFontColor("white");
    obj.comboBox31:setName("comboBox31");

    obj.rectangle272 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle272:setParent(obj.rectangle268);
    obj.rectangle272:setLeft(5);
    obj.rectangle272:setTop(95);
    obj.rectangle272:setWidth(110);
    obj.rectangle272:setHeight(25);
    obj.rectangle272:setColor("transparent");
    obj.rectangle272:setStrokeColor("Gray");
    obj.rectangle272:setStrokeSize(2);
    obj.rectangle272:setCornerType("bevel");
    obj.rectangle272:setXradius(5);
    obj.rectangle272:setYradius(5);
    obj.rectangle272:setName("rectangle272");

    obj.label365 = GUI.fromHandle(_obj_newObject("label"));
    obj.label365:setParent(obj.rectangle272);
    obj.label365:setVertTextAlign("center");
    obj.label365:setHorzTextAlign("center");
    obj.label365:setWidth(110);
    obj.label365:setHeight(25);
    obj.label365:setText("Pesada");
    obj.label365:setFontColor("Gray");
    obj.label365:setFontFamily("Stencil");
    obj.label365:setName("label365");

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.rectangle268);
    obj.comboBox32:setVertTextAlign("center");
    obj.comboBox32:setHorzTextAlign("trailing");
    obj.comboBox32:setLeft(115);
    obj.comboBox32:setTop(95);
    obj.comboBox32:setWidth(55);
    obj.comboBox32:setHeight(25);
    obj.comboBox32:setField("pesada");
    obj.comboBox32:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox32:setFontColor("white");
    obj.comboBox32:setName("comboBox32");

    obj.rectangle273 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle273:setParent(obj.rectangle260);
    obj.rectangle273:setLeft(137);
    obj.rectangle273:setTop(474);
    obj.rectangle273:setName("rectangle273");
    obj.rectangle273:setWidth(131);
    obj.rectangle273:setHeight(25);
    obj.rectangle273:setColor("transparent");
    obj.rectangle273:setStrokeColor("Gray");
    obj.rectangle273:setStrokeSize(2);
    obj.rectangle273:setCornerType("innerRound");
    obj.rectangle273:setXradius(5);
    obj.rectangle273:setYradius(5);

    obj.label366 = GUI.fromHandle(_obj_newObject("label"));
    obj.label366:setParent(obj.rectangle273);
    obj.label366:setWidth(131);
    obj.label366:setHeight(25);
    obj.label366:setText("Idiomas");
    obj.label366:setVertTextAlign("center");
    obj.label366:setHorzTextAlign("center");
    obj.label366:setFontSize(16);
    obj.label366:setFontColor("Gray");
    obj.label366:setFontFamily("Stencil");
    obj.label366:setName("label366");

    obj.idiomasLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.idiomasLabel:setParent(obj.rectangle260);
    obj.idiomasLabel:setLeft(5);
    obj.idiomasLabel:setTop(499);
    obj.idiomasLabel:setWidth(391);
    obj.idiomasLabel:setHeight(120);
    obj.idiomasLabel:setColor("transparent");
    obj.idiomasLabel:setStrokeColor("Gray");
    obj.idiomasLabel:setStrokeSize(1);
    obj.idiomasLabel:setName("idiomasLabel");
    obj.idiomasLabel:setVisible(true);
    obj.idiomasLabel:setCornerType("round");
    obj.idiomasLabel:setXradius(10);
    obj.idiomasLabel:setYradius(10);
    obj.idiomasLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label367 = GUI.fromHandle(_obj_newObject("label"));
    obj.label367:setParent(obj.idiomasLabel);
    obj.label367:setAlign("client");
    obj.label367:setField("idiomas");
    lfm_setPropAsString(obj.label367, "fontStyle",  "bold");
    obj.label367:setFontSize(16);
    obj.label367:setHorzTextAlign("leading");
    obj.label367:setVertTextAlign("leading");
    obj.label367:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label367:setFontColor("Gray");
    obj.label367:setName("label367");

    obj.idiomasEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.idiomasEdit:setParent(obj.rectangle260);
    obj.idiomasEdit:setField("idiomas");
    obj.idiomasEdit:setLeft(5);
    obj.idiomasEdit:setTop(499);
    obj.idiomasEdit:setWidth(391);
    obj.idiomasEdit:setHeight(120);
    obj.idiomasEdit:setName("idiomasEdit");
    obj.idiomasEdit:setVisible(false);
    obj.idiomasEdit:setFontSize(16);
    obj.idiomasEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setWidth(382);
    obj.flowPart10:setHeight(628);
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setAlign("top");
    obj.flowPart10:setMinScaledWidth(400);
    obj.flowPart10:setAvoidScale(true);
    obj.flowPart10:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle274 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle274:setParent(obj.flowPart10);
    obj.rectangle274:setAlign("client");
    obj.rectangle274:setName("rectangle274");
    obj.rectangle274:setColor("transparent");
    obj.rectangle274:setCornerType("round");
    obj.rectangle274:setXradius(15);
    obj.rectangle274:setYradius(15);
    obj.rectangle274:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.rectangle274);
    obj.image22:setAlign("client");
    obj.image22:setStyle("stretch");
    obj.image22:setSRC("/imagens/Fundo 3.png");
    obj.image22:setOpacity(0.1);
    obj.image22:setName("image22");

    obj.label368 = GUI.fromHandle(_obj_newObject("label"));
    obj.label368:setParent(obj.rectangle274);
    obj.label368:setLeft(0);
    obj.label368:setTop(5);
    obj.label368:setWidth(382);
    obj.label368:setHeight(25);
    obj.label368:setText("Golpes");
    obj.label368:setFontSize(20);
    obj.label368:setVertTextAlign("center");
    obj.label368:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label368, "fontStyle",  "italic");
    obj.label368:setFontColor("Gray");
    obj.label368:setFontFamily("Stencil");
    obj.label368:setName("label368");

    obj.rectangle275 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle275:setParent(obj.rectangle274);
    obj.rectangle275:setLeft(5);
    obj.rectangle275:setTop(40);
    obj.rectangle275:setWidth(368);
    obj.rectangle275:setHeight(578);
    obj.rectangle275:setColor("transparent");
    obj.rectangle275:setStrokeColor("Gray");
    obj.rectangle275:setStrokeSize(1);
    obj.rectangle275:setCornerType("round");
    obj.rectangle275:setXradius(10);
    obj.rectangle275:setYradius(10);
    obj.rectangle275:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle275:setName("rectangle275");

    obj.rectangle276 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle276:setParent(obj.rectangle275);
    obj.rectangle276:setLeft(0);
    obj.rectangle276:setWidth(131);
    obj.rectangle276:setTop(0);
    obj.rectangle276:setName("rectangle276");
    obj.rectangle276:setHeight(25);
    obj.rectangle276:setColor("transparent");
    obj.rectangle276:setStrokeColor("Gray");
    obj.rectangle276:setStrokeSize(2);
    obj.rectangle276:setCornerType("round");
    obj.rectangle276:setXradius(5);
    obj.rectangle276:setYradius(5);

    obj.label369 = GUI.fromHandle(_obj_newObject("label"));
    obj.label369:setParent(obj.rectangle276);
    obj.label369:setVertTextAlign("center");
    obj.label369:setHorzTextAlign("center");
    obj.label369:setWidth(131);
    obj.label369:setHeight(25);
    obj.label369:setText("Golpe");
    obj.label369:setFontColor("Gray");
    obj.label369:setFontFamily("Stencil");
    obj.label369:setName("label369");

    obj.rectangle277 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle277:setParent(obj.rectangle275);
    obj.rectangle277:setLeft(131);
    obj.rectangle277:setTop(0);
    obj.rectangle277:setName("rectangle277");
    obj.rectangle277:setWidth(55);
    obj.rectangle277:setHeight(25);
    obj.rectangle277:setColor("transparent");
    obj.rectangle277:setStrokeColor("Gray");
    obj.rectangle277:setStrokeSize(2);
    obj.rectangle277:setCornerType("round");
    obj.rectangle277:setXradius(5);
    obj.rectangle277:setYradius(5);

    obj.label370 = GUI.fromHandle(_obj_newObject("label"));
    obj.label370:setParent(obj.rectangle277);
    obj.label370:setVertTextAlign("center");
    obj.label370:setHorzTextAlign("center");
    obj.label370:setWidth(55);
    obj.label370:setHeight(25);
    obj.label370:setText("ATR");
    obj.label370:setFontColor("Gray");
    obj.label370:setFontFamily("Stencil");
    obj.label370:setName("label370");

    obj.rectangle278 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle278:setParent(obj.rectangle275);
    obj.rectangle278:setLeft(186);
    obj.rectangle278:setTop(0);
    obj.rectangle278:setName("rectangle278");
    obj.rectangle278:setWidth(55);
    obj.rectangle278:setHeight(25);
    obj.rectangle278:setColor("transparent");
    obj.rectangle278:setStrokeColor("Gray");
    obj.rectangle278:setStrokeSize(2);
    obj.rectangle278:setCornerType("round");
    obj.rectangle278:setXradius(5);
    obj.rectangle278:setYradius(5);

    obj.label371 = GUI.fromHandle(_obj_newObject("label"));
    obj.label371:setParent(obj.rectangle278);
    obj.label371:setVertTextAlign("center");
    obj.label371:setHorzTextAlign("center");
    obj.label371:setWidth(55);
    obj.label371:setHeight(25);
    obj.label371:setText("Prof");
    obj.label371:setFontColor("Gray");
    obj.label371:setFontFamily("Stencil");
    obj.label371:setName("label371");

    obj.rectangle279 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle279:setParent(obj.rectangle275);
    obj.rectangle279:setLeft(241);
    obj.rectangle279:setTop(0);
    obj.rectangle279:setName("rectangle279");
    obj.rectangle279:setWidth(55);
    obj.rectangle279:setHeight(25);
    obj.rectangle279:setColor("transparent");
    obj.rectangle279:setStrokeColor("Gray");
    obj.rectangle279:setStrokeSize(2);
    obj.rectangle279:setCornerType("round");
    obj.rectangle279:setXradius(5);
    obj.rectangle279:setYradius(5);

    obj.label372 = GUI.fromHandle(_obj_newObject("label"));
    obj.label372:setParent(obj.rectangle279);
    obj.label372:setVertTextAlign("center");
    obj.label372:setHorzTextAlign("center");
    obj.label372:setWidth(55);
    obj.label372:setHeight(25);
    obj.label372:setText("Outros");
    obj.label372:setFontColor("Gray");
    obj.label372:setFontFamily("Stencil");
    obj.label372:setName("label372");

    obj.rectangle280 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle280:setParent(obj.rectangle275);
    obj.rectangle280:setLeft(296);
    obj.rectangle280:setTop(0);
    obj.rectangle280:setWidth(72);
    obj.rectangle280:setStrokeSize(3);
    obj.rectangle280:setName("rectangle280");
    obj.rectangle280:setHeight(25);
    obj.rectangle280:setColor("transparent");
    obj.rectangle280:setStrokeColor("Gray");
    obj.rectangle280:setCornerType("round");
    obj.rectangle280:setXradius(5);
    obj.rectangle280:setYradius(5);

    obj.label373 = GUI.fromHandle(_obj_newObject("label"));
    obj.label373:setParent(obj.rectangle280);
    obj.label373:setVertTextAlign("center");
    obj.label373:setHorzTextAlign("center");
    obj.label373:setWidth(72);
    obj.label373:setHeight(25);
    obj.label373:setText("Ataque");
    obj.label373:setFontColor("Gray");
    obj.label373:setFontFamily("Stencil");
    obj.label373:setName("label373");

    obj.rectangle281 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle281:setParent(obj.rectangle275);
    obj.rectangle281:setLeft(0);
    obj.rectangle281:setTop(25);
    obj.rectangle281:setWidth(368);
    obj.rectangle281:setHeight(77);
    obj.rectangle281:setColor("transparent");
    obj.rectangle281:setStrokeColor("Gray");
    obj.rectangle281:setStrokeSize(3);
    obj.rectangle281:setCornerType("round");
    obj.rectangle281:setXradius(5);
    obj.rectangle281:setYradius(5);
    obj.rectangle281:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle281:setName("rectangle281");

    obj.nomeGolpeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeGolpeLabel:setParent(obj.rectangle281);
    obj.nomeGolpeLabel:setLeft(0);
    obj.nomeGolpeLabel:setTop(0);
    obj.nomeGolpeLabel:setWidth(131);
    obj.nomeGolpeLabel:setHeight(25);
    obj.nomeGolpeLabel:setColor("transparent");
    obj.nomeGolpeLabel:setStrokeColor("Gray");
    obj.nomeGolpeLabel:setStrokeSize(1);
    obj.nomeGolpeLabel:setName("nomeGolpeLabel");
    obj.nomeGolpeLabel:setVisible(true);
    obj.nomeGolpeLabel:setCornerType("round");
    obj.nomeGolpeLabel:setXradius(5);
    obj.nomeGolpeLabel:setYradius(5);

    obj.label374 = GUI.fromHandle(_obj_newObject("label"));
    obj.label374:setParent(obj.nomeGolpeLabel);
    obj.label374:setWidth(131);
    obj.label374:setHeight(25);
    obj.label374:setField("nomeGolpe");
    obj.label374:setFontSize(16);
    obj.label374:setVertTextAlign("center");
    obj.label374:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label374, "fontStyle",  "bold");
    obj.label374:setFontColor("Gray");
    obj.label374:setName("label374");

    obj.nomeGolpeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeGolpeEdit:setParent(obj.rectangle281);
    obj.nomeGolpeEdit:setField("nomeGolpe");
    obj.nomeGolpeEdit:setLeft(0);
    obj.nomeGolpeEdit:setTop(0);
    obj.nomeGolpeEdit:setWidth(131);
    obj.nomeGolpeEdit:setHeight(25);
    obj.nomeGolpeEdit:setName("nomeGolpeEdit");
    obj.nomeGolpeEdit:setVisible(false);
    obj.nomeGolpeEdit:setFontSize(16);

    obj.comboBox33 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.rectangle281);
    obj.comboBox33:setVertTextAlign("center");
    obj.comboBox33:setHorzTextAlign("center");
    obj.comboBox33:setLeft(131);
    obj.comboBox33:setTop(0);
    obj.comboBox33:setWidth(55);
    obj.comboBox33:setHeight(25);
    obj.comboBox33:setField("golpeBox");
    obj.comboBox33:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox33:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox33:setFontColor("white");
    obj.comboBox33:setName("comboBox33");

    obj.comboBox34 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox34:setParent(obj.rectangle281);
    obj.comboBox34:setVertTextAlign("center");
    obj.comboBox34:setHorzTextAlign("trailing");
    obj.comboBox34:setLeft(186);
    obj.comboBox34:setTop(0);
    obj.comboBox34:setWidth(55);
    obj.comboBox34:setHeight(25);
    obj.comboBox34:setField("profGolpe");
    obj.comboBox34:setItems({'D', 'T', 'E', 'M', 'L'});
    obj.comboBox34:setValues({'0', '2', '4', '6', '8'});
    obj.comboBox34:setFontColor("white");
    obj.comboBox34:setName("comboBox34");

    obj.outrosGolpeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.outrosGolpeLabel:setParent(obj.rectangle281);
    obj.outrosGolpeLabel:setLeft(241);
    obj.outrosGolpeLabel:setTop(0);
    obj.outrosGolpeLabel:setWidth(55);
    obj.outrosGolpeLabel:setHeight(25);
    obj.outrosGolpeLabel:setColor("transparent");
    obj.outrosGolpeLabel:setStrokeColor("Gray");
    obj.outrosGolpeLabel:setStrokeSize(1);
    obj.outrosGolpeLabel:setName("outrosGolpeLabel");
    obj.outrosGolpeLabel:setVisible(true);
    obj.outrosGolpeLabel:setCornerType("round");
    obj.outrosGolpeLabel:setXradius(5);
    obj.outrosGolpeLabel:setYradius(5);

    obj.label375 = GUI.fromHandle(_obj_newObject("label"));
    obj.label375:setParent(obj.outrosGolpeLabel);
    obj.label375:setWidth(55);
    obj.label375:setHeight(25);
    obj.label375:setField("outrosGolpe");
    obj.label375:setFontSize(16);
    obj.label375:setVertTextAlign("center");
    obj.label375:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label375, "fontStyle",  "bold");
    obj.label375:setFontColor("Gray");
    obj.label375:setName("label375");

    obj.outrosGolpeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.outrosGolpeEdit:setParent(obj.rectangle281);
    obj.outrosGolpeEdit:setField("outrosGolpe");
    obj.outrosGolpeEdit:setLeft(241);
    obj.outrosGolpeEdit:setTop(0);
    obj.outrosGolpeEdit:setWidth(55);
    obj.outrosGolpeEdit:setHeight(25);
    obj.outrosGolpeEdit:setName("outrosGolpeEdit");
    obj.outrosGolpeEdit:setVisible(false);
    obj.outrosGolpeEdit:setFontSize(16);

    obj.rectangle282 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle282:setParent(obj.rectangle281);
    obj.rectangle282:setLeft(296);
    obj.rectangle282:setTop(0);
    obj.rectangle282:setWidth(72);
    obj.rectangle282:setHeight(25);
    obj.rectangle282:setColor("transparent");
    obj.rectangle282:setStrokeColor("Gray");
    obj.rectangle282:setStrokeSize(3);
    obj.rectangle282:setVisible(true);
    obj.rectangle282:setOpacity(1);
    obj.rectangle282:setCornerType("round");
    obj.rectangle282:setXradius(5);
    obj.rectangle282:setYradius(5);
    obj.rectangle282:setName("rectangle282");

    obj.label376 = GUI.fromHandle(_obj_newObject("label"));
    obj.label376:setParent(obj.rectangle282);
    obj.label376:setWidth(72);
    obj.label376:setHeight(25);
    obj.label376:setField("bonusGolpe");
    obj.label376:setFontSize(16);
    lfm_setPropAsString(obj.label376, "fontStyle",  "bold");
    obj.label376:setFontColor("Gray");
    obj.label376:setVertTextAlign("center");
    obj.label376:setHorzTextAlign("center");
    obj.label376:setName("label376");

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.rectangle281);
    obj.button45:setLeft(0);
    obj.button45:setTop(25);
    obj.button45:setWidth(55);
    obj.button45:setHeight(25);
    obj.button45:setText("Dano");
    obj.button45:setFontFamily("Stencil");
    obj.button45:setName("button45");

    obj.danoGolpeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.danoGolpeLabel:setParent(obj.rectangle281);
    obj.danoGolpeLabel:setLeft(55);
    obj.danoGolpeLabel:setTop(25);
    obj.danoGolpeLabel:setWidth(83);
    obj.danoGolpeLabel:setHeight(25);
    obj.danoGolpeLabel:setColor("transparent");
    obj.danoGolpeLabel:setStrokeColor("Gray");
    obj.danoGolpeLabel:setStrokeSize(1);
    obj.danoGolpeLabel:setName("danoGolpeLabel");
    obj.danoGolpeLabel:setVisible(true);
    obj.danoGolpeLabel:setCornerType("round");
    obj.danoGolpeLabel:setXradius(5);
    obj.danoGolpeLabel:setYradius(5);

    obj.label377 = GUI.fromHandle(_obj_newObject("label"));
    obj.label377:setParent(obj.danoGolpeLabel);
    obj.label377:setWidth(83);
    obj.label377:setHeight(25);
    obj.label377:setField("danoGolpe");
    obj.label377:setFontSize(16);
    obj.label377:setVertTextAlign("center");
    obj.label377:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label377, "fontStyle",  "bold");
    obj.label377:setFontColor("Gray");
    obj.label377:setName("label377");

    obj.danoGolpeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.danoGolpeEdit:setParent(obj.rectangle281);
    obj.danoGolpeEdit:setField("danoGolpe");
    obj.danoGolpeEdit:setLeft(55);
    obj.danoGolpeEdit:setTop(25);
    obj.danoGolpeEdit:setWidth(83);
    obj.danoGolpeEdit:setHeight(25);
    obj.danoGolpeEdit:setName("danoGolpeEdit");
    obj.danoGolpeEdit:setVisible(false);
    obj.danoGolpeEdit:setFontSize(16);

    obj.rectangle283 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle283:setParent(obj.rectangle281);
    obj.rectangle283:setLeft(138);
    obj.rectangle283:setTop(25);
    obj.rectangle283:setWidth(40);
    obj.rectangle283:setName("rectangle283");
    obj.rectangle283:setHeight(25);
    obj.rectangle283:setColor("transparent");
    obj.rectangle283:setStrokeColor("Gray");
    obj.rectangle283:setStrokeSize(2);
    obj.rectangle283:setCornerType("innerRound");
    obj.rectangle283:setXradius(5);
    obj.rectangle283:setYradius(5);

    obj.label378 = GUI.fromHandle(_obj_newObject("label"));
    obj.label378:setParent(obj.rectangle283);
    obj.label378:setVertTextAlign("center");
    obj.label378:setHorzTextAlign("center");
    obj.label378:setWidth(40);
    obj.label378:setHeight(25);
    obj.label378:setText("Pen");
    obj.label378:setFontColor("Gray");
    obj.label378:setFontFamily("Stencil");
    obj.label378:setName("label378");

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.rectangle281);
    obj.button46:setLeft(178);
    obj.button46:setTop(26);
    obj.button46:setWidth(40);
    obj.button46:setHeight(23);
    obj.button46:setText("2º");
    obj.button46:setName("button46");

    obj.comboBox35 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox35:setParent(obj.rectangle281);
    obj.comboBox35:setVertTextAlign("center");
    obj.comboBox35:setHorzTextAlign("trailing");
    obj.comboBox35:setLeft(218);
    obj.comboBox35:setTop(25);
    obj.comboBox35:setWidth(55);
    obj.comboBox35:setHeight(25);
    obj.comboBox35:setField("penSegundo");
    obj.comboBox35:setItems({'0', '-1', '-2', '-3', '-4', '-5', '-6', '-7', '-8', '-9', '-10'});
    obj.comboBox35:setValues({'0', '-1', '-2', '-3', '-4', '-5', '-6', '-7', '-8', '-9', '-10'});
    obj.comboBox35:setFontColor("white");
    obj.comboBox35:setName("comboBox35");

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.rectangle281);
    obj.button47:setLeft(273);
    obj.button47:setTop(26);
    obj.button47:setWidth(40);
    obj.button47:setHeight(23);
    obj.button47:setText("3º");
    obj.button47:setName("button47");

    obj.comboBox36 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox36:setParent(obj.rectangle281);
    obj.comboBox36:setVertTextAlign("center");
    obj.comboBox36:setHorzTextAlign("trailing");
    obj.comboBox36:setLeft(313);
    obj.comboBox36:setTop(25);
    obj.comboBox36:setWidth(55);
    obj.comboBox36:setHeight(25);
    obj.comboBox36:setField("penTerceiro");
    obj.comboBox36:setItems({'0', '-1', '-2', '-3', '-4', '-5', '-6', '-7', '-8', '-9', '-10'});
    obj.comboBox36:setValues({'0', '-1', '-2', '-3', '-4', '-5', '-6', '-7', '-8', '-9', '-10'});
    obj.comboBox36:setFontColor("white");
    obj.comboBox36:setName("comboBox36");

    obj.rectangle284 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle284:setParent(obj.rectangle281);
    obj.rectangle284:setLeft(0);
    obj.rectangle284:setTop(50);
    obj.rectangle284:setWidth(55);
    obj.rectangle284:setName("rectangle284");
    obj.rectangle284:setHeight(25);
    obj.rectangle284:setColor("transparent");
    obj.rectangle284:setStrokeColor("Gray");
    obj.rectangle284:setStrokeSize(2);
    obj.rectangle284:setCornerType("innerRound");
    obj.rectangle284:setXradius(5);
    obj.rectangle284:setYradius(5);

    obj.label379 = GUI.fromHandle(_obj_newObject("label"));
    obj.label379:setParent(obj.rectangle284);
    obj.label379:setVertTextAlign("center");
    obj.label379:setHorzTextAlign("center");
    obj.label379:setWidth(55);
    obj.label379:setHeight(25);
    obj.label379:setText("Traços");
    obj.label379:setFontColor("Gray");
    obj.label379:setFontFamily("Stencil");
    obj.label379:setName("label379");

    obj.tracosGolpeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.tracosGolpeLabel:setParent(obj.rectangle281);
    obj.tracosGolpeLabel:setLeft(55);
    obj.tracosGolpeLabel:setTop(50);
    obj.tracosGolpeLabel:setWidth(232);
    obj.tracosGolpeLabel:setHeight(25);
    obj.tracosGolpeLabel:setColor("transparent");
    obj.tracosGolpeLabel:setStrokeColor("Gray");
    obj.tracosGolpeLabel:setStrokeSize(1);
    obj.tracosGolpeLabel:setName("tracosGolpeLabel");
    obj.tracosGolpeLabel:setVisible(true);
    obj.tracosGolpeLabel:setCornerType("round");
    obj.tracosGolpeLabel:setXradius(5);
    obj.tracosGolpeLabel:setYradius(5);

    obj.label380 = GUI.fromHandle(_obj_newObject("label"));
    obj.label380:setParent(obj.tracosGolpeLabel);
    obj.label380:setWidth(232);
    obj.label380:setHeight(25);
    obj.label380:setField("tracosGolpe");
    obj.label380:setFontSize(16);
    obj.label380:setVertTextAlign("center");
    obj.label380:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label380, "fontStyle",  "bold");
    obj.label380:setFontColor("Gray");
    obj.label380:setName("label380");

    obj.tracosGolpeEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.tracosGolpeEdit:setParent(obj.rectangle281);
    obj.tracosGolpeEdit:setField("tracosGolpe");
    obj.tracosGolpeEdit:setLeft(55);
    obj.tracosGolpeEdit:setTop(50);
    obj.tracosGolpeEdit:setWidth(232);
    obj.tracosGolpeEdit:setHeight(25);
    obj.tracosGolpeEdit:setName("tracosGolpeEdit");
    obj.tracosGolpeEdit:setVisible(false);
    obj.tracosGolpeEdit:setFontSize(16);

    obj.comboBox37 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox37:setParent(obj.rectangle281);
    obj.comboBox37:setVertTextAlign("center");
    obj.comboBox37:setHorzTextAlign("trailing");
    obj.comboBox37:setLeft(287);
    obj.comboBox37:setTop(50);
    obj.comboBox37:setWidth(55);
    obj.comboBox37:setHeight(25);
    obj.comboBox37:setField("tipoDano");
    obj.comboBox37:setItems({'Cn', 'Ct', 'Pf'});
    obj.comboBox37:setFontColor("white");
    obj.comboBox37:setName("comboBox37");

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.rectangle281);
    obj.button48:setLeft(342);
    obj.button48:setTop(51);
    obj.button48:setWidth(23);
    obj.button48:setHeight(23);
    obj.button48:setText("+");
    obj.button48:setName("button48");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.rectangle281);
    obj.dataLink56:setFields({'nivel', 'atrGolpe', 'profGolpe', 'outrosGolpe'});
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.rectangle281);
    obj.dataLink57:setField("bonusGolpe");
    obj.dataLink57:setName("dataLink57");

    obj.rclGolpes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclGolpes:setParent(obj.rectangle275);
    obj.rclGolpes:setLeft(0);
    obj.rclGolpes:setTop(105);
    obj.rclGolpes:setName("rclGolpes");
    obj.rclGolpes:setField("campoGolpes");
    obj.rclGolpes:setTemplateForm("frmGolpes");
    obj.rclGolpes:setWidth(368);
    obj.rclGolpes:setHeight(473);
    obj.rclGolpes:setLayout("vertical");
    obj.rclGolpes:setMinQt(0);

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setWidth(405);
    obj.flowPart11:setHeight(400);
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setAlign("top");
    obj.flowPart11:setMinScaledWidth(400);
    obj.flowPart11:setAvoidScale(true);
    obj.flowPart11:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle285 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle285:setParent(obj.flowPart11);
    obj.rectangle285:setAlign("client");
    obj.rectangle285:setName("rectangle285");
    obj.rectangle285:setColor("transparent");
    obj.rectangle285:setCornerType("round");
    obj.rectangle285:setXradius(15);
    obj.rectangle285:setYradius(15);
    obj.rectangle285:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.rectangle285);
    obj.image23:setAlign("client");
    obj.image23:setStyle("stretch");
    obj.image23:setSRC("/imagens/Fundo 3.png");
    obj.image23:setOpacity(0.1);
    obj.image23:setName("image23");

    obj.label381 = GUI.fromHandle(_obj_newObject("label"));
    obj.label381:setParent(obj.rectangle285);
    obj.label381:setLeft(0);
    obj.label381:setTop(5);
    obj.label381:setWidth(405);
    obj.label381:setHeight(25);
    obj.label381:setText("Personalidade");
    obj.label381:setFontSize(20);
    obj.label381:setVertTextAlign("center");
    obj.label381:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label381, "fontStyle",  "italic");
    obj.label381:setFontColor("Gray");
    obj.label381:setFontFamily("Stencil");
    obj.label381:setName("label381");

    obj.personalidadeLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.personalidadeLabel:setParent(obj.rectangle285);
    obj.personalidadeLabel:setLeft(6);
    obj.personalidadeLabel:setTop(31);
    obj.personalidadeLabel:setWidth(389);
    obj.personalidadeLabel:setHeight(300);
    obj.personalidadeLabel:setColor("transparent");
    obj.personalidadeLabel:setStrokeColor("Gray");
    obj.personalidadeLabel:setStrokeSize(1);
    obj.personalidadeLabel:setName("personalidadeLabel");
    obj.personalidadeLabel:setVisible(true);
    obj.personalidadeLabel:setCornerType("round");
    obj.personalidadeLabel:setXradius(10);
    obj.personalidadeLabel:setYradius(10);
    obj.personalidadeLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label382 = GUI.fromHandle(_obj_newObject("label"));
    obj.label382:setParent(obj.personalidadeLabel);
    obj.label382:setAlign("client");
    obj.label382:setField("personalidade");
    lfm_setPropAsString(obj.label382, "fontStyle",  "bold");
    obj.label382:setFontSize(16);
    obj.label382:setHorzTextAlign("leading");
    obj.label382:setVertTextAlign("leading");
    obj.label382:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label382:setFontColor("Gray");
    obj.label382:setName("label382");

    obj.personalidadeEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.personalidadeEdit:setParent(obj.rectangle285);
    obj.personalidadeEdit:setField("personalidade");
    obj.personalidadeEdit:setLeft(6);
    obj.personalidadeEdit:setTop(31);
    obj.personalidadeEdit:setWidth(389);
    obj.personalidadeEdit:setHeight(300);
    obj.personalidadeEdit:setName("personalidadeEdit");
    obj.personalidadeEdit:setVisible(false);
    obj.personalidadeEdit:setFontSize(16);
    obj.personalidadeEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj.rectangle286 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle286:setParent(obj.rectangle285);
    obj.rectangle286:setLeft(115);
    obj.rectangle286:setTop(342);
    obj.rectangle286:setWidth(180);
    obj.rectangle286:setHeight(40);
    obj.rectangle286:setColor("Gray");
    obj.rectangle286:setCornerType("round");
    obj.rectangle286:setXradius(20);
    obj.rectangle286:setYradius(20);
    obj.rectangle286:setName("rectangle286");

    obj.inventario = GUI.fromHandle(_obj_newObject("button"));
    obj.inventario:setParent(obj.rectangle286);
    obj.inventario:setName("inventario");
    obj.inventario:setLeft(15);
    obj.inventario:setTop(5);
    obj.inventario:setWidth(150);
    obj.inventario:setHeight(30);
    obj.inventario:setText("Inventário");
    obj.inventario:setFontSize(16);
    obj.inventario:setVertTextAlign("center");
    obj.inventario:setHorzTextAlign("center");
    obj.inventario:setFontFamily("Stencil");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setWidth(791);
    obj.flowPart12:setHeight(400);
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setAlign("top");
    obj.flowPart12:setMinScaledWidth(400);
    obj.flowPart12:setAvoidScale(true);
    obj.flowPart12:setMargins({left=2, right=2, top=2, bottom=2});

    obj.rectangle287 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle287:setParent(obj.flowPart12);
    obj.rectangle287:setAlign("client");
    obj.rectangle287:setName("rectangle287");
    obj.rectangle287:setColor("transparent");
    obj.rectangle287:setCornerType("round");
    obj.rectangle287:setXradius(15);
    obj.rectangle287:setYradius(15);
    obj.rectangle287:setMargins({left=2, right=2, top=2, bottom=2});

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.rectangle287);
    obj.image24:setAlign("client");
    obj.image24:setStyle("stretch");
    obj.image24:setSRC("/imagens/Fundo 3.png");
    obj.image24:setOpacity(0.1);
    obj.image24:setName("image24");

    obj.label383 = GUI.fromHandle(_obj_newObject("label"));
    obj.label383:setParent(obj.rectangle287);
    obj.label383:setLeft(0);
    obj.label383:setTop(5);
    obj.label383:setWidth(791);
    obj.label383:setHeight(25);
    obj.label383:setText("História");
    obj.label383:setFontSize(20);
    obj.label383:setVertTextAlign("center");
    obj.label383:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label383, "fontStyle",  "italic");
    obj.label383:setFontColor("Gray");
    obj.label383:setFontFamily("Stencil");
    obj.label383:setName("label383");

    obj.info = GUI.fromHandle(_obj_newObject("button"));
    obj.info:setParent(obj.rectangle287);
    obj.info:setName("info");
    obj.info:setLeft(756);
    obj.info:setTop(5);
    obj.info:setWidth(23);
    obj.info:setHeight(23);
    obj.info:setText("i");

    obj.historiaLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.historiaLabel:setParent(obj.rectangle287);
    obj.historiaLabel:setLeft(7);
    obj.historiaLabel:setTop(31);
    obj.historiaLabel:setWidth(773);
    obj.historiaLabel:setHeight(360);
    obj.historiaLabel:setColor("transparent");
    obj.historiaLabel:setStrokeColor("Gray");
    obj.historiaLabel:setStrokeSize(1);
    obj.historiaLabel:setName("historiaLabel");
    obj.historiaLabel:setVisible(true);
    obj.historiaLabel:setCornerType("round");
    obj.historiaLabel:setXradius(10);
    obj.historiaLabel:setYradius(10);
    obj.historiaLabel:setMargins({left=6, right=6, top=6, bottom=6});

    obj.label384 = GUI.fromHandle(_obj_newObject("label"));
    obj.label384:setParent(obj.historiaLabel);
    obj.label384:setAlign("client");
    obj.label384:setField("historia");
    lfm_setPropAsString(obj.label384, "fontStyle",  "bold");
    obj.label384:setFontSize(16);
    obj.label384:setHorzTextAlign("leading");
    obj.label384:setVertTextAlign("leading");
    obj.label384:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label384:setFontColor("Gray");
    obj.label384:setName("label384");

    obj.historiaEdit = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.historiaEdit:setParent(obj.rectangle287);
    obj.historiaEdit:setField("historia");
    obj.historiaEdit:setLeft(7);
    obj.historiaEdit:setTop(31);
    obj.historiaEdit:setWidth(773);
    obj.historiaEdit:setHeight(360);
    obj.historiaEdit:setName("historiaEdit");
    obj.historiaEdit:setVisible(false);
    obj.historiaEdit:setFontSize(16);
    obj.historiaEdit:setMargins({left=6, right=6, top=6, bottom=6});

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclImagem:append();
        end, obj);

    obj._e_event1 = obj.anotacoesLabel:addEventListener("onClick",
        function (_)
            self.anotacoesLabel.visible = false;
                            self.anotacoesEdit.visible = true;
                            self.anotacoesEdit:setFocus();
        end, obj);

    obj._e_event2 = obj.anotacoesEdit:addEventListener("onExit",
        function (_)
            self.anotacoesLabel.visible = true;
                            self.anotacoesEdit.visible = false;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclCaracteristicas:append();
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclTalAncestralidade:append();
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclTalPericias:append();
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclTalGerais:append();
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclTalClasse:append();
        end, obj);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclTalBonus:append();
        end, obj);

    obj._e_event9 = obj.talTracosLabel:addEventListener("onClick",
        function (_)
            self.talTracosLabel.visible = false;
                            self.talTracosEdit.visible = true;
                            self.talTracosEdit:setFocus();
        end, obj);

    obj._e_event10 = obj.talTracosEdit:addEventListener("onExit",
        function (_)
            self.talTracosLabel.visible = true;
                            self.talTracosEdit.visible = false;
        end, obj);

    obj._e_event11 = obj.talAcoesLabel:addEventListener("onClick",
        function (_)
            self.talAcoesLabel.visible = false;
                            self.talAcoesEdit.visible = true;
                            self.talAcoesEdit:setFocus();
        end, obj);

    obj._e_event12 = obj.talAcoesEdit:addEventListener("onExit",
        function (_)
            self.talAcoesLabel.visible = true;
                            self.talAcoesEdit.visible = false;
        end, obj);

    obj._e_event13 = obj.talDescLabel:addEventListener("onClick",
        function (_)
            self.talDescLabel.visible = false;
                            self.talDescEdit.visible = true;
                            self.talDescEdit:setFocus();
        end, obj);

    obj._e_event14 = obj.talDescEdit:addEventListener("onExit",
        function (_)
            self.talDescLabel.visible = true;
                            self.talDescEdit.visible = false;
        end, obj);

    obj._e_event15 = obj.acaoTracosLabel:addEventListener("onClick",
        function (_)
            self.acaoTracosLabel.visible = false;
                            self.acaoTracosEdit.visible = true;
                            self.acaoTracosEdit:setFocus();
        end, obj);

    obj._e_event16 = obj.acaoTracosEdit:addEventListener("onExit",
        function (_)
            self.acaoTracosLabel.visible = true;
                            self.acaoTracosEdit.visible = false;
        end, obj);

    obj._e_event17 = obj.acionamentoLabel:addEventListener("onClick",
        function (_)
            self.acionamentoLabel.visible = false;
                            self.acionamentoEdit.visible = true;
                            self.acionamentoEdit:setFocus();
        end, obj);

    obj._e_event18 = obj.acionamentoEdit:addEventListener("onExit",
        function (_)
            self.acionamentoLabel.visible = true;
                            self.acionamentoEdit.visible = false;
        end, obj);

    obj._e_event19 = obj.acaoDescLabel:addEventListener("onClick",
        function (_)
            self.acaoDescLabel.visible = false;
                            self.acaoDescEdit.visible = true;
                            self.acaoDescEdit:setFocus();
        end, obj);

    obj._e_event20 = obj.acaoDescEdit:addEventListener("onExit",
        function (_)
            self.acaoDescLabel.visible = true;
                            self.acaoDescEdit.visible = false;
        end, obj);

    obj._e_event21 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclInventario:append();
        end, obj);

    obj._e_event22 = obj.pecaCobreLabel:addEventListener("onClick",
        function (_)
            self.pecaCobreLabel.visible = false;
                            self.pecaCobreEdit.visible = true;
                            self.pecaCobreEdit:setFocus();
        end, obj);

    obj._e_event23 = obj.pecaCobreEdit:addEventListener("onExit",
        function (_)
            self.pecaCobreLabel.visible = true;
                            self.pecaCobreEdit.visible = false;
        end, obj);

    obj._e_event24 = obj.pecaPrataLabel:addEventListener("onClick",
        function (_)
            self.pecaPrataLabel.visible = false;
                            self.pecaPrataEdit.visible = true;
                            self.pecaPrataEdit:setFocus();
        end, obj);

    obj._e_event25 = obj.pecaPrataEdit:addEventListener("onExit",
        function (_)
            self.pecaPrataLabel.visible = true;
                            self.pecaPrataEdit.visible = false;
        end, obj);

    obj._e_event26 = obj.pecaOuroLabel:addEventListener("onClick",
        function (_)
            self.pecaOuroLabel.visible = false;
                            self.pecaOuroEdit.visible = true;
                            self.pecaOuroEdit:setFocus();
        end, obj);

    obj._e_event27 = obj.pecaOuroEdit:addEventListener("onExit",
        function (_)
            self.pecaOuroLabel.visible = true;
                            self.pecaOuroEdit.visible = false;
        end, obj);

    obj._e_event28 = obj.pecaPlatinaLabel:addEventListener("onClick",
        function (_)
            self.pecaPlatinaLabel.visible = false;
                            self.pecaPlatinaEdit.visible = true;
                            self.pecaPlatinaEdit:setFocus();
        end, obj);

    obj._e_event29 = obj.pecaPlatinaEdit:addEventListener("onExit",
        function (_)
            self.pecaPlatinaLabel.visible = true;
                            self.pecaPlatinaEdit.visible = false;
        end, obj);

    obj._e_event30 = obj.rectangle47:addEventListener("onClick",
        function (_)
            self.volumeAtualLabel.visible = false;
                                self.volumeAtualEdit.visible = true;
                                self.volumeAtualEdit:setFocus();
        end, obj);

    obj._e_event31 = obj.volumeAtualEdit:addEventListener("onExit",
        function (_)
            self.volumeAtualLabel.visible = true;
                                    self.volumeAtualEdit.visible = false;
        end, obj);

    obj._e_event32 = obj.outrosSobrecargaLabel:addEventListener("onClick",
        function (_)
            self.outrosSobrecargaLabel.visible = false;
                            self.outrosSobrecargaEdit.visible = true;
                            self.outrosSobrecargaEdit:setFocus();
        end, obj);

    obj._e_event33 = obj.outrosSobrecargaEdit:addEventListener("onExit",
        function (_)
            self.outrosSobrecargaLabel.visible = true;
                            self.outrosSobrecargaEdit.visible = false;
        end, obj);

    obj._e_event34 = obj.outrosMaximoLabel:addEventListener("onClick",
        function (_)
            self.outrosMaximoLabel.visible = false;
                            self.outrosMaximoEdit.visible = true;
                            self.outrosMaximoEdit:setFocus();
        end, obj);

    obj._e_event35 = obj.outrosMaximoEdit:addEventListener("onExit",
        function (_)
            self.outrosMaximoLabel.visible = true;
                            self.outrosMaximoEdit.visible = false;
        end, obj);

    obj._e_event36 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                sheet.sobrecarga = 5 + (tonumber(sheet.modFor) or 0) + (tonumber(sheet.outrosSobrecarga) or 0);
                                sheet.maximo = 10 + (tonumber(sheet.modFor) or 0) + (tonumber(sheet.outrosMaximo) or 0);
        end, obj);

    obj._e_event37 = obj.descItemLabel:addEventListener("onClick",
        function (_)
            self.descItemLabel.visible = false;
                            self.descItemEdit.visible = true;
                            self.descItemEdit:setFocus();
        end, obj);

    obj._e_event38 = obj.descItemEdit:addEventListener("onExit",
        function (_)
            self.descItemLabel.visible = true;
                            self.descItemEdit.visible = false;
        end, obj);

    obj._e_event39 = obj.pontoFocoLabel:addEventListener("onClick",
        function (_)
            self.pontoFocoLabel.visible = false;
                            self.pontoFocoEdit.visible = true;
                            self.pontoFocoEdit:setFocus();
        end, obj);

    obj._e_event40 = obj.pontoFocoEdit:addEventListener("onExit",
        function (_)
            self.pontoFocoLabel.visible = true;
                            self.pontoFocoEdit.visible = false;
        end, obj);

    obj._e_event41 = obj.nivelTruqueLabel:addEventListener("onClick",
        function (_)
            self.nivelTruqueLabel.visible = false;
                            self.nivelTruqueEdit.visible = true;
                            self.nivelTruqueEdit:setFocus();
        end, obj);

    obj._e_event42 = obj.nivelTruqueEdit:addEventListener("onExit",
        function (_)
            self.nivelTruqueLabel.visible = true;
                            self.nivelTruqueEdit.visible = false;
        end, obj);

    obj._e_event43 = obj.maxSlot1Label:addEventListener("onClick",
        function (_)
            self.maxSlot1Label.visible = false;
                            self.maxSlot1Edit.visible = true;
                            self.maxSlot1Edit:setFocus();
        end, obj);

    obj._e_event44 = obj.maxSlot1Edit:addEventListener("onExit",
        function (_)
            self.maxSlot1Label.visible = true;
                            self.maxSlot1Edit.visible = false;
        end, obj);

    obj._e_event45 = obj.usadosSlot1Label:addEventListener("onClick",
        function (_)
            self.usadosSlot1Label.visible = false;
                            self.usadosSlot1Edit.visible = true;
                            self.usadosSlot1Edit:setFocus();
        end, obj);

    obj._e_event46 = obj.usadosSlot1Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot1Label.visible = true;
                            self.usadosSlot1Edit.visible = false;
        end, obj);

    obj._e_event47 = obj.maxSlot2Label:addEventListener("onClick",
        function (_)
            self.maxSlot2Label.visible = false;
                            self.maxSlot2Edit.visible = true;
                            self.maxSlot2Edit:setFocus();
        end, obj);

    obj._e_event48 = obj.maxSlot2Edit:addEventListener("onExit",
        function (_)
            self.maxSlot2Label.visible = true;
                            self.maxSlot2Edit.visible = false;
        end, obj);

    obj._e_event49 = obj.usadosSlot2Label:addEventListener("onClick",
        function (_)
            self.usadosSlot2Label.visible = false;
                            self.usadosSlot2Edit.visible = true;
                            self.usadosSlot2Edit:setFocus();
        end, obj);

    obj._e_event50 = obj.usadosSlot2Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot2Label.visible = true;
                            self.usadosSlot2Edit.visible = false;
        end, obj);

    obj._e_event51 = obj.maxSlot3Label:addEventListener("onClick",
        function (_)
            self.maxSlot3Label.visible = false;
                            self.maxSlot3Edit.visible = true;
                            self.maxSlot3Edit:setFocus();
        end, obj);

    obj._e_event52 = obj.maxSlot3Edit:addEventListener("onExit",
        function (_)
            self.maxSlot3Label.visible = true;
                            self.maxSlot3Edit.visible = false;
        end, obj);

    obj._e_event53 = obj.usadosSlot3Label:addEventListener("onClick",
        function (_)
            self.usadosSlot3Label.visible = false;
                            self.usadosSlot3Edit.visible = true;
                            self.usadosSlot3Edit:setFocus();
        end, obj);

    obj._e_event54 = obj.usadosSlot3Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot3Label.visible = true;
                            self.usadosSlot3Edit.visible = false;
        end, obj);

    obj._e_event55 = obj.maxSlot4Label:addEventListener("onClick",
        function (_)
            self.maxSlot4Label.visible = false;
                            self.maxSlot4Edit.visible = true;
                            self.maxSlot4Edit:setFocus();
        end, obj);

    obj._e_event56 = obj.maxSlot4Edit:addEventListener("onExit",
        function (_)
            self.maxSlot4Label.visible = true;
                            self.maxSlot4Edit.visible = false;
        end, obj);

    obj._e_event57 = obj.usadosSlot4Label:addEventListener("onClick",
        function (_)
            self.usadosSlot4Label.visible = false;
                            self.usadosSlot4Edit.visible = true;
                            self.usadosSlot4Edit:setFocus();
        end, obj);

    obj._e_event58 = obj.usadosSlot4Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot4Label.visible = true;
                            self.usadosSlot4Edit.visible = false;
        end, obj);

    obj._e_event59 = obj.maxSlot5Label:addEventListener("onClick",
        function (_)
            self.maxSlot5Label.visible = false;
                            self.maxSlot5Edit.visible = true;
                            self.maxSlot5Edit:setFocus();
        end, obj);

    obj._e_event60 = obj.maxSlot5Edit:addEventListener("onExit",
        function (_)
            self.maxSlot5Label.visible = true;
                            self.maxSlot5Edit.visible = false;
        end, obj);

    obj._e_event61 = obj.usadosSlot5Label:addEventListener("onClick",
        function (_)
            self.usadosSlot5Label.visible = false;
                            self.usadosSlot5Edit.visible = true;
                            self.usadosSlot5Edit:setFocus();
        end, obj);

    obj._e_event62 = obj.usadosSlot5Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot5Label.visible = true;
                            self.usadosSlot5Edit.visible = false;
        end, obj);

    obj._e_event63 = obj.maxSlot6Label:addEventListener("onClick",
        function (_)
            self.maxSlot6Label.visible = false;
                            self.maxSlot6Edit.visible = true;
                            self.maxSlot6Edit:setFocus();
        end, obj);

    obj._e_event64 = obj.maxSlot6Edit:addEventListener("onExit",
        function (_)
            self.maxSlot6Label.visible = true;
                            self.maxSlot6Edit.visible = false;
        end, obj);

    obj._e_event65 = obj.usadosSlot6Label:addEventListener("onClick",
        function (_)
            self.usadosSlot6Label.visible = false;
                            self.usadosSlot6Edit.visible = true;
                            self.usadosSlot6Edit:setFocus();
        end, obj);

    obj._e_event66 = obj.usadosSlot6Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot6Label.visible = true;
                            self.usadosSlot6Edit.visible = false;
        end, obj);

    obj._e_event67 = obj.maxSlot7Label:addEventListener("onClick",
        function (_)
            self.maxSlot7Label.visible = false;
                            self.maxSlot7Edit.visible = true;
                            self.maxSlot7Edit:setFocus();
        end, obj);

    obj._e_event68 = obj.maxSlot7Edit:addEventListener("onExit",
        function (_)
            self.maxSlot7Label.visible = true;
                            self.maxSlot7Edit.visible = false;
        end, obj);

    obj._e_event69 = obj.usadosSlot7Label:addEventListener("onClick",
        function (_)
            self.usadosSlot7Label.visible = false;
                            self.usadosSlot7Edit.visible = true;
                            self.usadosSlot7Edit:setFocus();
        end, obj);

    obj._e_event70 = obj.usadosSlot7Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot7Label.visible = true;
                            self.usadosSlot7Edit.visible = false;
        end, obj);

    obj._e_event71 = obj.maxSlot8Label:addEventListener("onClick",
        function (_)
            self.maxSlot8Label.visible = false;
                            self.maxSlot8Edit.visible = true;
                            self.maxSlot8Edit:setFocus();
        end, obj);

    obj._e_event72 = obj.maxSlot8Edit:addEventListener("onExit",
        function (_)
            self.maxSlot8Label.visible = true;
                            self.maxSlot8Edit.visible = false;
        end, obj);

    obj._e_event73 = obj.usadosSlot8Label:addEventListener("onClick",
        function (_)
            self.usadosSlot8Label.visible = false;
                            self.usadosSlot8Edit.visible = true;
                            self.usadosSlot8Edit:setFocus();
        end, obj);

    obj._e_event74 = obj.usadosSlot8Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot8Label.visible = true;
                            self.usadosSlot8Edit.visible = false;
        end, obj);

    obj._e_event75 = obj.maxSlot9Label:addEventListener("onClick",
        function (_)
            self.maxSlot9Label.visible = false;
                            self.maxSlot9Edit.visible = true;
                            self.maxSlot9Edit:setFocus();
        end, obj);

    obj._e_event76 = obj.maxSlot9Edit:addEventListener("onExit",
        function (_)
            self.maxSlot9Label.visible = true;
                            self.maxSlot9Edit.visible = false;
        end, obj);

    obj._e_event77 = obj.usadosSlot9Label:addEventListener("onClick",
        function (_)
            self.usadosSlot9Label.visible = false;
                            self.usadosSlot9Edit.visible = true;
                            self.usadosSlot9Edit:setFocus();
        end, obj);

    obj._e_event78 = obj.usadosSlot9Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot9Label.visible = true;
                            self.usadosSlot9Edit.visible = false;
        end, obj);

    obj._e_event79 = obj.maxSlot10Label:addEventListener("onClick",
        function (_)
            self.maxSlot10Label.visible = false;
                            self.maxSlot10Edit.visible = true;
                            self.maxSlot10Edit:setFocus();
        end, obj);

    obj._e_event80 = obj.maxSlot10Edit:addEventListener("onExit",
        function (_)
            self.maxSlot10Label.visible = true;
                            self.maxSlot10Edit.visible = false;
        end, obj);

    obj._e_event81 = obj.usadosSlot10Label:addEventListener("onClick",
        function (_)
            self.usadosSlot10Label.visible = false;
                            self.usadosSlot10Edit.visible = true;
                            self.usadosSlot10Edit:setFocus();
        end, obj);

    obj._e_event82 = obj.usadosSlot10Edit:addEventListener("onExit",
        function (_)
            self.usadosSlot10Label.visible = true;
                            self.usadosSlot10Edit.visible = false;
        end, obj);

    obj._e_event83 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclTruquesMagicos:append();
        end, obj);

    obj._e_event84 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclMagiasInatas:append();
        end, obj);

    obj._e_event85 = obj.button11:addEventListener("onClick",
        function (_)
            self.rclMagiasFoco:append();
        end, obj);

    obj._e_event86 = obj.button12:addEventListener("onClick",
        function (_)
            self.rclMagias:append();
        end, obj);

    obj._e_event87 = obj.magiaAcaoLabel:addEventListener("onClick",
        function (_)
            self.magiaAcaoLabel.visible = false;
                            self.magiaAcaoEdit.visible = true;
                            self.magiaAcaoEdit:setFocus();
        end, obj);

    obj._e_event88 = obj.magiaAcaoEdit:addEventListener("onExit",
        function (_)
            self.magiaAcaoLabel.visible = true;
                            self.magiaAcaoEdit.visible = false;
        end, obj);

    obj._e_event89 = obj.magiaDescLabel:addEventListener("onClick",
        function (_)
            self.magiaDescLabel.visible = false;
                            self.magiaDescEdit.visible = true;
                            self.magiaDescEdit:setFocus();
        end, obj);

    obj._e_event90 = obj.magiaDescEdit:addEventListener("onExit",
        function (_)
            self.magiaDescLabel.visible = true;
                            self.magiaDescEdit.visible = false;
        end, obj);

    obj._e_event91 = obj.button13:addEventListener("onClick",
        function (_)
            self.rclMagiasPreparadas:append();
        end, obj);

    obj._e_event92 = obj.nomeLabel:addEventListener("onClick",
        function (_)
            self.nomeLabel.visible = false;
                            self.nomeEdit.visible = true;
                            self.nomeEdit:setFocus();
        end, obj);

    obj._e_event93 = obj.nomeEdit:addEventListener("onExit",
        function (_)
            self.nomeLabel.visible = true;
                            self.nomeEdit.visible = false;
        end, obj);

    obj._e_event94 = obj.racaLabel:addEventListener("onClick",
        function (_)
            self.racaLabel.visible = false;
                            self.racaEdit.visible = true;
                            self.racaEdit:setFocus();
        end, obj);

    obj._e_event95 = obj.racaEdit:addEventListener("onExit",
        function (_)
            self.racaLabel.visible = true;
                            self.racaEdit.visible = false;
        end, obj);

    obj._e_event96 = obj.sexoLabel:addEventListener("onClick",
        function (_)
            self.sexoLabel.visible = false;
                            self.sexoEdit.visible = true;
                            self.sexoEdit:setFocus();
        end, obj);

    obj._e_event97 = obj.sexoEdit:addEventListener("onExit",
        function (_)
            self.sexoLabel.visible = true;
                            self.sexoEdit.visible = false;
        end, obj);

    obj._e_event98 = obj.herancaLabel:addEventListener("onClick",
        function (_)
            self.herancaLabel.visible = false;
                            self.herancaEdit.visible = true;
                            self.herancaEdit:setFocus();
        end, obj);

    obj._e_event99 = obj.herancaEdit:addEventListener("onExit",
        function (_)
            self.herancaLabel.visible = true;
                            self.herancaEdit.visible = false;
        end, obj);

    obj._e_event100 = obj.tamanhoLabel:addEventListener("onClick",
        function (_)
            self.tamanhoLabel.visible = false;
                            self.tamanhoEdit.visible = true;
                            self.tamanhoEdit:setFocus();
        end, obj);

    obj._e_event101 = obj.tamanhoEdit:addEventListener("onExit",
        function (_)
            self.tamanhoLabel.visible = true;
                            self.tamanhoEdit.visible = false;
        end, obj);

    obj._e_event102 = obj.tracosLabel:addEventListener("onClick",
        function (_)
            self.tracosLabel.visible = false;
                            self.tracosEdit.visible = true;
                            self.tracosEdit:setFocus();
        end, obj);

    obj._e_event103 = obj.tracosEdit:addEventListener("onExit",
        function (_)
            self.tracosLabel.visible = true;
                            self.tracosEdit.visible = false;
        end, obj);

    obj._e_event104 = obj.classeLabel:addEventListener("onClick",
        function (_)
            self.classeLabel.visible = false;
                            self.classeEdit.visible = true;
                            self.classeEdit:setFocus();
        end, obj);

    obj._e_event105 = obj.classeEdit:addEventListener("onExit",
        function (_)
            self.classeLabel.visible = true;
                            self.classeEdit.visible = false;
        end, obj);

    obj._e_event106 = obj.biografiaLabel:addEventListener("onClick",
        function (_)
            self.biografiaLabel.visible = false;
                            self.biografiaEdit.visible = true;
                            self.biografiaEdit:setFocus();
        end, obj);

    obj._e_event107 = obj.biografiaEdit:addEventListener("onExit",
        function (_)
            self.biografiaLabel.visible = true;
                            self.biografiaEdit.visible = false;
        end, obj);

    obj._e_event108 = obj.tendenciaLabel:addEventListener("onClick",
        function (_)
            self.tendenciaLabel.visible = false;
                            self.tendenciaEdit.visible = true;
                            self.tendenciaEdit:setFocus();
        end, obj);

    obj._e_event109 = obj.tendenciaEdit:addEventListener("onExit",
        function (_)
            self.tendenciaLabel.visible = true;
                            self.tendenciaEdit.visible = false;
        end, obj);

    obj._e_event110 = obj.origemLabel:addEventListener("onClick",
        function (_)
            self.origemLabel.visible = false;
                            self.origemEdit.visible = true;
                            self.origemEdit:setFocus();
        end, obj);

    obj._e_event111 = obj.origemEdit:addEventListener("onExit",
        function (_)
            self.origemLabel.visible = true;
                            self.origemEdit.visible = false;
        end, obj);

    obj._e_event112 = obj.divindadeLabel:addEventListener("onClick",
        function (_)
            self.divindadeLabel.visible = false;
                            self.divindadeEdit.visible = true;
                            self.divindadeEdit:setFocus();
        end, obj);

    obj._e_event113 = obj.divindadeEdit:addEventListener("onExit",
        function (_)
            self.divindadeLabel.visible = true;
                            self.divindadeEdit.visible = false;
        end, obj);

    obj._e_event114 = obj.jogadorLabel:addEventListener("onClick",
        function (_)
            self.jogadorLabel.visible = false;
                            self.jogadorEdit.visible = true;
                            self.jogadorEdit:setFocus();
        end, obj);

    obj._e_event115 = obj.jogadorEdit:addEventListener("onExit",
        function (_)
            self.jogadorLabel.visible = true;
                            self.jogadorEdit.visible = false;
        end, obj);

    obj._e_event116 = obj.nivelLabel:addEventListener("onClick",
        function (_)
            self.nivelLabel.visible = false;
                            self.nivelEdit.visible = true;
                            self.nivelEdit:setFocus();
        end, obj);

    obj._e_event117 = obj.nivelEdit:addEventListener("onExit",
        function (_)
            self.nivelLabel.visible = true;
                            self.nivelEdit.visible = false;
        end, obj);

    obj._e_event118 = obj.experienciaLabel:addEventListener("onClick",
        function (_)
            self.experienciaLabel.visible = false;
                            self.experienciaEdit.visible = true;
                            self.experienciaEdit:setFocus();
        end, obj);

    obj._e_event119 = obj.experienciaEdit:addEventListener("onExit",
        function (_)
            self.experienciaLabel.visible = true;
                            self.experienciaEdit.visible = false;
        end, obj);

    obj._e_event120 = obj.velocidadeLabel:addEventListener("onClick",
        function (_)
            self.velocidadeLabel.visible = false;
                            self.velocidadeEdit.visible = true;
                            self.velocidadeEdit:setFocus();
        end, obj);

    obj._e_event121 = obj.velocidadeEdit:addEventListener("onExit",
        function (_)
            self.velocidadeLabel.visible = true;
                            self.velocidadeEdit.visible = false;
        end, obj);

    obj._e_event122 = obj.idadeLabel:addEventListener("onClick",
        function (_)
            self.idadeLabel.visible = false;
                            self.idadeEdit.visible = true;
                            self.idadeEdit:setFocus();
        end, obj);

    obj._e_event123 = obj.idadeEdit:addEventListener("onExit",
        function (_)
            self.idadeLabel.visible = true;
                            self.idadeEdit.visible = false;
        end, obj);

    obj._e_event124 = obj.alturaLabel:addEventListener("onClick",
        function (_)
            self.alturaLabel.visible = false;
                            self.alturaEdit.visible = true;
                            self.alturaEdit:setFocus();
        end, obj);

    obj._e_event125 = obj.alturaEdit:addEventListener("onExit",
        function (_)
            self.alturaLabel.visible = true;
                            self.alturaEdit.visible = false;
        end, obj);

    obj._e_event126 = obj.pesoLabel:addEventListener("onClick",
        function (_)
            self.pesoLabel.visible = false;
                            self.pesoEdit.visible = true;
                            self.pesoEdit:setFocus();
        end, obj);

    obj._e_event127 = obj.pesoEdit:addEventListener("onExit",
        function (_)
            self.pesoLabel.visible = true;
                            self.pesoEdit.visible = false;
        end, obj);

    obj._e_event128 = obj.button14:addEventListener("onClick",
        function (_)
            if sheet.modFor ~= nil then
                                local mod = tonumber(sheet.modFor);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Força de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Força de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event129 = obj.ForBaseLabel:addEventListener("onClick",
        function (_)
            self.ForBaseLabel.visible = false;
                            self.ForBaseEdit.visible = true;
                            self.ForBaseEdit:setFocus();
        end, obj);

    obj._e_event130 = obj.ForBaseEdit:addEventListener("onExit",
        function (_)
            self.ForBaseLabel.visible = true;
                            self.ForBaseEdit.visible = false;
        end, obj);

    obj._e_event131 = obj.ForRacaLabel:addEventListener("onClick",
        function (_)
            self.ForRacaLabel.visible = false;
                            self.ForRacaEdit.visible = true;
                            self.ForRacaEdit:setFocus();
        end, obj);

    obj._e_event132 = obj.ForRacaEdit:addEventListener("onExit",
        function (_)
            self.ForRacaLabel.visible = true;
                            self.ForRacaEdit.visible = false;
        end, obj);

    obj._e_event133 = obj.ForBioLabel:addEventListener("onClick",
        function (_)
            self.ForBioLabel.visible = false;
                            self.ForBioEdit.visible = true;
                            self.ForBioEdit:setFocus();
        end, obj);

    obj._e_event134 = obj.ForBioEdit:addEventListener("onExit",
        function (_)
            self.ForBioLabel.visible = true;
                            self.ForBioEdit.visible = false;
        end, obj);

    obj._e_event135 = obj.ForClasseLabel:addEventListener("onClick",
        function (_)
            self.ForClasseLabel.visible = false;
                            self.ForClasseEdit.visible = true;
                            self.ForClasseEdit:setFocus();
        end, obj);

    obj._e_event136 = obj.ForClasseEdit:addEventListener("onExit",
        function (_)
            self.ForClasseLabel.visible = true;
                            self.ForClasseEdit.visible = false;
        end, obj);

    obj._e_event137 = obj.ForNivelLabel:addEventListener("onClick",
        function (_)
            self.ForNivelLabel.visible = false;
                            self.ForNivelEdit.visible = true;
                            self.ForNivelEdit:setFocus();
        end, obj);

    obj._e_event138 = obj.ForNivelEdit:addEventListener("onExit",
        function (_)
            self.ForNivelLabel.visible = true;
                            self.ForNivelEdit.visible = false;
        end, obj);

    obj._e_event139 = obj.ForOutrosLabel:addEventListener("onClick",
        function (_)
            self.ForOutrosLabel.visible = false;
                            self.ForOutrosEdit.visible = true;
                            self.ForOutrosEdit:setFocus();
        end, obj);

    obj._e_event140 = obj.ForOutrosEdit:addEventListener("onExit",
        function (_)
            self.ForOutrosLabel.visible = true;
                            self.ForOutrosEdit.visible = false;
        end, obj);

    obj._e_event141 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local resultado = math.floor((tonumber(sheet.ForBase) or 0) +
            									(tonumber(sheet.ForRaca) or 0) +
            									(tonumber(sheet.ForBio) or 0) +
            									(tonumber(sheet.ForClasse) or 0) +
            									(tonumber(sheet.ForNivel) or 0) +
            									(tonumber(sheet.ForOutros) or 0));
            			    sheet.ForTotal = resultado;
        end, obj);

    obj._e_event142 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = math.floor((tonumber(sheet.ForTotal or 0) - 10) / 2);
                            sheet.modFor = mod;
            				if (mod >= 0) then
            					sheet.Forbonus = "+" .. mod;
            				else
            				    sheet.Forbonus = mod;
            				end;
        end, obj);

    obj._e_event143 = obj.button15:addEventListener("onClick",
        function (_)
            if sheet.modDes ~= nil then
                                local mod = tonumber(sheet.modDes);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Destreza de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Destreza de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event144 = obj.DesBaseLabel:addEventListener("onClick",
        function (_)
            self.DesBaseLabel.visible = false;
                            self.DesBaseEdit.visible = true;
                            self.DesBaseEdit:setFocus();
        end, obj);

    obj._e_event145 = obj.DesBaseEdit:addEventListener("onExit",
        function (_)
            self.DesBaseLabel.visible = true;
                            self.DesBaseEdit.visible = false;
        end, obj);

    obj._e_event146 = obj.DesRacaLabel:addEventListener("onClick",
        function (_)
            self.DesRacaLabel.visible = false;
                            self.DesRacaEdit.visible = true;
                            self.DesRacaEdit:setFocus();
        end, obj);

    obj._e_event147 = obj.DesRacaEdit:addEventListener("onExit",
        function (_)
            self.DesRacaLabel.visible = true;
                            self.DesRacaEdit.visible = false;
        end, obj);

    obj._e_event148 = obj.DesBioLabel:addEventListener("onClick",
        function (_)
            self.DesBioLabel.visible = false;
                            self.DesBioEdit.visible = true;
                            self.DesBioEdit:setFocus();
        end, obj);

    obj._e_event149 = obj.DesBioEdit:addEventListener("onExit",
        function (_)
            self.DesBioLabel.visible = true;
                            self.DesBioEdit.visible = false;
        end, obj);

    obj._e_event150 = obj.DesClasseLabel:addEventListener("onClick",
        function (_)
            self.DesClasseLabel.visible = false;
                            self.DesClasseEdit.visible = true;
                            self.DesClasseEdit:setFocus();
        end, obj);

    obj._e_event151 = obj.DesClasseEdit:addEventListener("onExit",
        function (_)
            self.DesClasseLabel.visible = true;
                            self.DesClasseEdit.visible = false;
        end, obj);

    obj._e_event152 = obj.DesNivelLabel:addEventListener("onClick",
        function (_)
            self.DesNivelLabel.visible = false;
                            self.DesNivelEdit.visible = true;
                            self.DesNivelEdit:setFocus();
        end, obj);

    obj._e_event153 = obj.DesNivelEdit:addEventListener("onExit",
        function (_)
            self.DesNivelLabel.visible = true;
                            self.DesNivelEdit.visible = false;
        end, obj);

    obj._e_event154 = obj.DesOutrosLabel:addEventListener("onClick",
        function (_)
            self.DesOutrosLabel.visible = false;
                            self.DesOutrosEdit.visible = true;
                            self.DesOutrosEdit:setFocus();
        end, obj);

    obj._e_event155 = obj.DesOutrosEdit:addEventListener("onExit",
        function (_)
            self.DesOutrosLabel.visible = true;
                            self.DesOutrosEdit.visible = false;
        end, obj);

    obj._e_event156 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local resultado = math.floor((tonumber(sheet.DesBase) or 0) +
            									(tonumber(sheet.DesRaca) or 0) +
            									(tonumber(sheet.DesBio) or 0) +
            									(tonumber(sheet.DesClasse) or 0) +
            									(tonumber(sheet.DesNivel) or 0) +
            									(tonumber(sheet.DesOutros) or 0));
            			    sheet.DesTotal = resultado;
        end, obj);

    obj._e_event157 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = math.floor((tonumber(sheet.DesTotal or 0) - 10) / 2);
                            sheet.modDes = mod;
            				if (mod >= 0) then
            					sheet.Desbonus = "+" .. mod;
            				else
            				    sheet.Desbonus = mod;
            				end;
        end, obj);

    obj._e_event158 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet.modCon ~= nil then
                                local mod = tonumber(sheet.modCon);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Constituição de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Constituição de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event159 = obj.ConBaseLabel:addEventListener("onClick",
        function (_)
            self.ConBaseLabel.visible = false;
                            self.ConBaseEdit.visible = true;
                            self.ConBaseEdit:setFocus();
        end, obj);

    obj._e_event160 = obj.ConBaseEdit:addEventListener("onExit",
        function (_)
            self.ConBaseLabel.visible = true;
                            self.ConBaseEdit.visible = false;
        end, obj);

    obj._e_event161 = obj.ConRacaLabel:addEventListener("onClick",
        function (_)
            self.ConRacaLabel.visible = false;
                            self.ConRacaEdit.visible = true;
                            self.ConRacaEdit:setFocus();
        end, obj);

    obj._e_event162 = obj.ConRacaEdit:addEventListener("onExit",
        function (_)
            self.ConRacaLabel.visible = true;
                            self.ConRacaEdit.visible = false;
        end, obj);

    obj._e_event163 = obj.ConBioLabel:addEventListener("onClick",
        function (_)
            self.ConBioLabel.visible = false;
                            self.ConBioEdit.visible = true;
                            self.ConBioEdit:setFocus();
        end, obj);

    obj._e_event164 = obj.ConBioEdit:addEventListener("onExit",
        function (_)
            self.ConBioLabel.visible = true;
                            self.ConBioEdit.visible = false;
        end, obj);

    obj._e_event165 = obj.ConClasseLabel:addEventListener("onClick",
        function (_)
            self.ConClasseLabel.visible = false;
                            self.ConClasseEdit.visible = true;
                            self.ConClasseEdit:setFocus();
        end, obj);

    obj._e_event166 = obj.ConClasseEdit:addEventListener("onExit",
        function (_)
            self.ConClasseLabel.visible = true;
                            self.ConClasseEdit.visible = false;
        end, obj);

    obj._e_event167 = obj.ConNivelLabel:addEventListener("onClick",
        function (_)
            self.ConNivelLabel.visible = false;
                            self.ConNivelEdit.visible = true;
                            self.ConNivelEdit:setFocus();
        end, obj);

    obj._e_event168 = obj.ConNivelEdit:addEventListener("onExit",
        function (_)
            self.ConNivelLabel.visible = true;
                            self.ConNivelEdit.visible = false;
        end, obj);

    obj._e_event169 = obj.ConOutrosLabel:addEventListener("onClick",
        function (_)
            self.ConOutrosLabel.visible = false;
                            self.ConOutrosEdit.visible = true;
                            self.ConOutrosEdit:setFocus();
        end, obj);

    obj._e_event170 = obj.ConOutrosEdit:addEventListener("onExit",
        function (_)
            self.ConOutrosLabel.visible = true;
                            self.ConOutrosEdit.visible = false;
        end, obj);

    obj._e_event171 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local resultado = math.floor((tonumber(sheet.ConBase) or 0) +
            									(tonumber(sheet.ConRaca) or 0) +
            									(tonumber(sheet.ConBio) or 0) +
            									(tonumber(sheet.ConClasse) or 0) +
            									(tonumber(sheet.ConNivel) or 0) +
            									(tonumber(sheet.ConOutros) or 0));
            			    sheet.ConTotal = resultado;
        end, obj);

    obj._e_event172 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = math.floor((tonumber(sheet.ConTotal or 0) - 10) / 2);
                            sheet.modCon = mod;
            				if (mod >= 0) then
            					sheet.Conbonus = "+" .. mod;
            				else
            				    sheet.Conbonus = mod;
            				end;
        end, obj);

    obj._e_event173 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet.modInt ~= nil then
                                local mod = tonumber(sheet.modInt);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Inteligência de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Inteligência de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event174 = obj.IntBaseLabel:addEventListener("onClick",
        function (_)
            self.IntBaseLabel.visible = false;
                            self.IntBaseEdit.visible = true;
                            self.IntBaseEdit:setFocus();
        end, obj);

    obj._e_event175 = obj.IntBaseEdit:addEventListener("onExit",
        function (_)
            self.IntBaseLabel.visible = true;
                            self.IntBaseEdit.visible = false;
        end, obj);

    obj._e_event176 = obj.IntRacaLabel:addEventListener("onClick",
        function (_)
            self.IntRacaLabel.visible = false;
                            self.IntRacaEdit.visible = true;
                            self.IntRacaEdit:setFocus();
        end, obj);

    obj._e_event177 = obj.IntRacaEdit:addEventListener("onExit",
        function (_)
            self.IntRacaLabel.visible = true;
                            self.IntRacaEdit.visible = false;
        end, obj);

    obj._e_event178 = obj.IntBioLabel:addEventListener("onClick",
        function (_)
            self.IntBioLabel.visible = false;
                            self.IntBioEdit.visible = true;
                            self.IntBioEdit:setFocus();
        end, obj);

    obj._e_event179 = obj.IntBioEdit:addEventListener("onExit",
        function (_)
            self.IntBioLabel.visible = true;
                            self.IntBioEdit.visible = false;
        end, obj);

    obj._e_event180 = obj.IntClasseLabel:addEventListener("onClick",
        function (_)
            self.IntClasseLabel.visible = false;
                            self.IntClasseEdit.visible = true;
                            self.IntClasseEdit:setFocus();
        end, obj);

    obj._e_event181 = obj.IntClasseEdit:addEventListener("onExit",
        function (_)
            self.IntClasseLabel.visible = true;
                            self.IntClasseEdit.visible = false;
        end, obj);

    obj._e_event182 = obj.IntNivelLabel:addEventListener("onClick",
        function (_)
            self.IntNivelLabel.visible = false;
                            self.IntNivelEdit.visible = true;
                            self.IntNivelEdit:setFocus();
        end, obj);

    obj._e_event183 = obj.IntNivelEdit:addEventListener("onExit",
        function (_)
            self.IntNivelLabel.visible = true;
                            self.IntNivelEdit.visible = false;
        end, obj);

    obj._e_event184 = obj.IntOutrosLabel:addEventListener("onClick",
        function (_)
            self.IntOutrosLabel.visible = false;
                            self.IntOutrosEdit.visible = true;
                            self.IntOutrosEdit:setFocus();
        end, obj);

    obj._e_event185 = obj.IntOutrosEdit:addEventListener("onExit",
        function (_)
            self.IntOutrosLabel.visible = true;
                            self.IntOutrosEdit.visible = false;
        end, obj);

    obj._e_event186 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local resultado = math.floor((tonumber(sheet.IntBase) or 0) +
            									(tonumber(sheet.IntRaca) or 0) +
            									(tonumber(sheet.IntBio) or 0) +
            									(tonumber(sheet.IntClasse) or 0) +
            									(tonumber(sheet.IntNivel) or 0) +
            									(tonumber(sheet.IntOutros) or 0));
            			    sheet.IntTotal = resultado;
        end, obj);

    obj._e_event187 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = math.floor((tonumber(sheet.IntTotal or 0) - 10) / 2);
                            sheet.modInt = mod;
            				if (mod >= 0) then
            					sheet.Intbonus = "+" .. mod;
            				else
            				    sheet.Intbonus = mod;
            				end;
        end, obj);

    obj._e_event188 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet.modSab ~= nil then
                                local mod = tonumber(sheet.modSab);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Sabedoria de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Sabedoria de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event189 = obj.SabBaseLabel:addEventListener("onClick",
        function (_)
            self.SabBaseLabel.visible = false;
                            self.SabBaseEdit.visible = true;
                            self.SabBaseEdit:setFocus();
        end, obj);

    obj._e_event190 = obj.SabBaseEdit:addEventListener("onExit",
        function (_)
            self.SabBaseLabel.visible = true;
                            self.SabBaseEdit.visible = false;
        end, obj);

    obj._e_event191 = obj.SabRacaLabel:addEventListener("onClick",
        function (_)
            self.SabRacaLabel.visible = false;
                            self.SabRacaEdit.visible = true;
                            self.SabRacaEdit:setFocus();
        end, obj);

    obj._e_event192 = obj.SabRacaEdit:addEventListener("onExit",
        function (_)
            self.SabRacaLabel.visible = true;
                            self.SabRacaEdit.visible = false;
        end, obj);

    obj._e_event193 = obj.SabBioLabel:addEventListener("onClick",
        function (_)
            self.SabBioLabel.visible = false;
                            self.SabBioEdit.visible = true;
                            self.SabBioEdit:setFocus();
        end, obj);

    obj._e_event194 = obj.SabBioEdit:addEventListener("onExit",
        function (_)
            self.SabBioLabel.visible = true;
                            self.SabBioEdit.visible = false;
        end, obj);

    obj._e_event195 = obj.SabClasseLabel:addEventListener("onClick",
        function (_)
            self.SabClasseLabel.visible = false;
                            self.SabClasseEdit.visible = true;
                            self.SabClasseEdit:setFocus();
        end, obj);

    obj._e_event196 = obj.SabClasseEdit:addEventListener("onExit",
        function (_)
            self.SabClasseLabel.visible = true;
                            self.SabClasseEdit.visible = false;
        end, obj);

    obj._e_event197 = obj.SabNivelLabel:addEventListener("onClick",
        function (_)
            self.SabNivelLabel.visible = false;
                            self.SabNivelEdit.visible = true;
                            self.SabNivelEdit:setFocus();
        end, obj);

    obj._e_event198 = obj.SabNivelEdit:addEventListener("onExit",
        function (_)
            self.SabNivelLabel.visible = true;
                            self.SabNivelEdit.visible = false;
        end, obj);

    obj._e_event199 = obj.SabOutrosLabel:addEventListener("onClick",
        function (_)
            self.SabOutrosLabel.visible = false;
                            self.SabOutrosEdit.visible = true;
                            self.SabOutrosEdit:setFocus();
        end, obj);

    obj._e_event200 = obj.SabOutrosEdit:addEventListener("onExit",
        function (_)
            self.SabOutrosLabel.visible = true;
                            self.SabOutrosEdit.visible = false;
        end, obj);

    obj._e_event201 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local resultado = math.floor((tonumber(sheet.SabBase) or 0) +
            									(tonumber(sheet.SabRaca) or 0) +
            									(tonumber(sheet.SabBio) or 0) +
            									(tonumber(sheet.SabClasse) or 0) +
            									(tonumber(sheet.SabNivel) or 0) +
            									(tonumber(sheet.SabOutros) or 0));
            			    sheet.SabTotal = resultado;
        end, obj);

    obj._e_event202 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = math.floor((tonumber(sheet.SabTotal or 0) - 10) / 2);
                            sheet.modSab = mod;
            				if (mod >= 0) then
            					sheet.Sabbonus = "+" .. mod;
            				else
            				    sheet.Sabbonus = mod;
            				end;
        end, obj);

    obj._e_event203 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet.modCar ~= nil then
                                local mod = tonumber(sheet.modCar);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Carisma de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Carisma de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event204 = obj.CarBaseLabel:addEventListener("onClick",
        function (_)
            self.CarBaseLabel.visible = false;
                            self.CarBaseEdit.visible = true;
                            self.CarBaseEdit:setFocus();
        end, obj);

    obj._e_event205 = obj.CarBaseEdit:addEventListener("onExit",
        function (_)
            self.CarBaseLabel.visible = true;
                            self.CarBaseEdit.visible = false;
        end, obj);

    obj._e_event206 = obj.CarRacaLabel:addEventListener("onClick",
        function (_)
            self.CarRacaLabel.visible = false;
                            self.CarRacaEdit.visible = true;
                            self.CarRacaEdit:setFocus();
        end, obj);

    obj._e_event207 = obj.CarRacaEdit:addEventListener("onExit",
        function (_)
            self.CarRacaLabel.visible = true;
                            self.CarRacaEdit.visible = false;
        end, obj);

    obj._e_event208 = obj.CarBioLabel:addEventListener("onClick",
        function (_)
            self.CarBioLabel.visible = false;
                            self.CarBioEdit.visible = true;
                            self.CarBioEdit:setFocus();
        end, obj);

    obj._e_event209 = obj.CarBioEdit:addEventListener("onExit",
        function (_)
            self.CarBioLabel.visible = true;
                            self.CarBioEdit.visible = false;
        end, obj);

    obj._e_event210 = obj.CarClasseLabel:addEventListener("onClick",
        function (_)
            self.CarClasseLabel.visible = false;
                            self.CarClasseEdit.visible = true;
                            self.CarClasseEdit:setFocus();
        end, obj);

    obj._e_event211 = obj.CarClasseEdit:addEventListener("onExit",
        function (_)
            self.CarClasseLabel.visible = true;
                            self.CarClasseEdit.visible = false;
        end, obj);

    obj._e_event212 = obj.CarNivelLabel:addEventListener("onClick",
        function (_)
            self.CarNivelLabel.visible = false;
                            self.CarNivelEdit.visible = true;
                            self.CarNivelEdit:setFocus();
        end, obj);

    obj._e_event213 = obj.CarNivelEdit:addEventListener("onExit",
        function (_)
            self.CarNivelLabel.visible = true;
                            self.CarNivelEdit.visible = false;
        end, obj);

    obj._e_event214 = obj.CarOutrosLabel:addEventListener("onClick",
        function (_)
            self.CarOutrosLabel.visible = false;
                            self.CarOutrosEdit.visible = true;
                            self.CarOutrosEdit:setFocus();
        end, obj);

    obj._e_event215 = obj.CarOutrosEdit:addEventListener("onExit",
        function (_)
            self.CarOutrosLabel.visible = true;
                            self.CarOutrosEdit.visible = false;
        end, obj);

    obj._e_event216 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local resultado = math.floor((tonumber(sheet.CarBase) or 0) +
            									(tonumber(sheet.CarRaca) or 0) +
            									(tonumber(sheet.CarBio) or 0) +
            									(tonumber(sheet.CarClasse) or 0) +
            									(tonumber(sheet.CarNivel) or 0) +
            									(tonumber(sheet.CarOutros) or 0));
            			    sheet.CarTotal = resultado;
        end, obj);

    obj._e_event217 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = math.floor((tonumber(sheet.CarTotal or 0) - 10) / 2);
                            sheet.modCar = mod;
            				if (mod >= 0) then
            					sheet.Carbonus = "+" .. mod;
            				else
            				    sheet.Carbonus = mod;
            				end;
        end, obj);

    obj._e_event218 = obj.condicoesLabel:addEventListener("onClick",
        function (_)
            self.condicoesLabel.visible = false;
                            self.condicoesEdit.visible = true;
                            self.condicoesEdit:setFocus();
        end, obj);

    obj._e_event219 = obj.condicoesEdit:addEventListener("onExit",
        function (_)
            self.condicoesLabel.visible = true;
                            self.condicoesEdit.visible = false;
        end, obj);

    obj._e_event220 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.morrendo1 == true) and (sheet.morrendo2 == true) and (sheet.morrendo3 == true) then
                                            showDeathPopup();
                                            end;
        end, obj);

    obj._e_event221 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet.modFort ~= nil then
                            local mod = tonumber(sheet.modFort);
                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Fortitude de " .. (sheet.nome or "Personagem"));
                            else
                            local rolagem = Firecast.interpretarRolagem("1d20");
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Fortitude de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event222 = obj.FortOutrosLabel:addEventListener("onClick",
        function (_)
            self.FortOutrosLabel.visible = false;
                            self.FortOutrosEdit.visible = true;
                            self.FortOutrosEdit:setFocus();
        end, obj);

    obj._e_event223 = obj.FortOutrosEdit:addEventListener("onExit",
        function (_)
            self.FortOutrosLabel.visible = true;
                            self.FortOutrosEdit.visible = false;
        end, obj);

    obj._e_event224 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet.modRef ~= nil then
                            local mod = tonumber(sheet.modRef);
                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Reflexo de " .. (sheet.nome or "Personagem"));
                            else
                            local rolagem = Firecast.interpretarRolagem("1d20");
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Reflexo de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event225 = obj.RefOutrosLabel:addEventListener("onClick",
        function (_)
            self.RefOutrosLabel.visible = false;
                            self.RefOutrosEdit.visible = true;
                            self.RefOutrosEdit:setFocus();
        end, obj);

    obj._e_event226 = obj.RefOutrosEdit:addEventListener("onExit",
        function (_)
            self.RefOutrosLabel.visible = true;
                            self.RefOutrosEdit.visible = false;
        end, obj);

    obj._e_event227 = obj.button22:addEventListener("onClick",
        function (_)
            if sheet.modVon ~= nil then
                            local mod = tonumber(sheet.modVon);
                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Vontade de " .. (sheet.nome or "Personagem"));
                            else
                            local rolagem = Firecast.interpretarRolagem("1d20");
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Vontade de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event228 = obj.VonOutrosLabel:addEventListener("onClick",
        function (_)
            self.VonOutrosLabel.visible = false;
                            self.VonOutrosEdit.visible = true;
                            self.VonOutrosEdit:setFocus();
        end, obj);

    obj._e_event229 = obj.VonOutrosEdit:addEventListener("onExit",
        function (_)
            self.VonOutrosLabel.visible = true;
                            self.VonOutrosEdit.visible = false;
        end, obj);

    obj._e_event230 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet.modPer ~= nil then
                            local mod = tonumber(sheet.modPer);
                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Percepção de " .. (sheet.nome or "Personagem"));
                            else
                            local rolagem = Firecast.interpretarRolagem("1d20");
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Percepção de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event231 = obj.PerOutrosLabel:addEventListener("onClick",
        function (_)
            self.PerOutrosLabel.visible = false;
                            self.PerOutrosEdit.visible = true;
                            self.PerOutrosEdit:setFocus();
        end, obj);

    obj._e_event232 = obj.PerOutrosEdit:addEventListener("onExit",
        function (_)
            self.PerOutrosLabel.visible = true;
                            self.PerOutrosEdit.visible = false;
        end, obj);

    obj._e_event233 = obj.sentidosLabel:addEventListener("onClick",
        function (_)
            self.sentidosLabel.visible = false;
                            self.sentidosEdit.visible = true;
                            self.sentidosEdit:setFocus();
        end, obj);

    obj._e_event234 = obj.sentidosEdit:addEventListener("onExit",
        function (_)
            self.sentidosLabel.visible = true;
                            self.sentidosEdit.visible = false;
        end, obj);

    obj._e_event235 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                            local prof = (tonumber(sheet.FortProf) or 0);
                                            if prof > 0 then
                                            sheet.modFort = math.floor((tonumber(sheet.modCon) or 0) +
                                                                (tonumber(sheet.FortProf) or 0) +
                                                                (tonumber(sheet.FortOutros) or 0)+
                                                                (tonumber(sheet.nivel) or 0));
                                            else
                                            sheet.modFort = math.floor((tonumber(sheet.modCon) or 0) +
                                                                (tonumber(sheet.FortProf) or 0) +
                                                                (tonumber(sheet.FortOutros) or 0));
                                            end;
                                            local mod = (tonumber(sheet.modFort) or 0);
                                            if mod >= 0 then
                                                sheet.modFort = "+" .. mod;
                                            else
                                                sheet.modFort = mod;
                                            end;
        end, obj);

    obj._e_event236 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                            local prof = (tonumber(sheet.RefProf) or 0);
                                            if prof > 0 then
                                            sheet.modRef = math.floor((tonumber(sheet.modDes) or 0) +
                                                                (tonumber(sheet.RefProf) or 0) +
                                                                (tonumber(sheet.RefOutros) or 0)+
                                                                (tonumber(sheet.nivel) or 0));
                                            else
                                            sheet.modRef = math.floor((tonumber(sheet.modDes) or 0) +
                                                                (tonumber(sheet.RefProf) or 0) +
                                                                (tonumber(sheet.RefOutros) or 0));
                                            end;
                                            local mod = (tonumber(sheet.modRef) or 0);
                                            if mod >= 0 then
                                                sheet.modRef = "+" .. mod;
                                            else
                                                sheet.modRef = mod;
                                            end;
        end, obj);

    obj._e_event237 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                            local prof = (tonumber(sheet.VonProf) or 0);
                                            if prof > 0 then
                                            sheet.modVon = math.floor((tonumber(sheet.modSab) or 0) +
                                                                (tonumber(sheet.VonProf) or 0) +
                                                                (tonumber(sheet.VonOutros) or 0)+
                                                                (tonumber(sheet.nivel) or 0));
                                            else
                                            sheet.modVon = math.floor((tonumber(sheet.modSab) or 0) +
                                                                (tonumber(sheet.VonProf) or 0) +
                                                                (tonumber(sheet.VonOutros) or 0));
                                            end;
                                            local mod = (tonumber(sheet.modVon) or 0);
                                            if mod >= 0 then
                                                sheet.modVon = "+" .. mod;
                                            else
                                                sheet.modVon = mod;
                                            end;
        end, obj);

    obj._e_event238 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                            local prof = (tonumber(sheet.PerProf) or 0);
                                            if prof > 0 then
                                            sheet.modPer = math.floor((tonumber(sheet.modSab) or 0) +
                                                                (tonumber(sheet.PerProf) or 0) +
                                                                (tonumber(sheet.PerOutros) or 0)+
                                                                (tonumber(sheet.nivel) or 0));
                                            else
                                            sheet.modPer = math.floor((tonumber(sheet.modSab) or 0) +
                                                                (tonumber(sheet.PerProf) or 0) +
                                                                (tonumber(sheet.PerOutros) or 0));
                                            end;
                                            local mod = (tonumber(sheet.modPer) or 0);
                                            if mod >= 0 then
                                                sheet.modPer = "+" .. mod;
                                            else
                                                sheet.modPer = mod;
                                            end;
        end, obj);

    obj._e_event239 = obj.image16:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event240 = obj.pvClasseLabel:addEventListener("onClick",
        function (_)
            self.pvClasseLabel.visible = false;
                            self.pvClasseEdit.visible = true;
                            self.pvClasseEdit:setFocus();
        end, obj);

    obj._e_event241 = obj.pvClasseEdit:addEventListener("onExit",
        function (_)
            self.pvClasseLabel.visible = true;
                            self.pvClasseEdit.visible = false;
        end, obj);

    obj._e_event242 = obj.pvAncestralidadeLabel:addEventListener("onClick",
        function (_)
            self.pvAncestralidadeLabel.visible = false;
                            self.pvAncestralidadeEdit.visible = true;
                            self.pvAncestralidadeEdit:setFocus();
        end, obj);

    obj._e_event243 = obj.pvAncestralidadeEdit:addEventListener("onExit",
        function (_)
            self.pvAncestralidadeLabel.visible = true;
                            self.pvAncestralidadeEdit.visible = false;
        end, obj);

    obj._e_event244 = obj.pvTempLabel:addEventListener("onClick",
        function (_)
            self.pvTempLabel.visible = false;
                            self.pvTempEdit.visible = true;
                            self.pvTempEdit:setFocus();
        end, obj);

    obj._e_event245 = obj.pvTempEdit:addEventListener("onExit",
        function (_)
            self.pvTempLabel.visible = true;
                            self.pvTempEdit.visible = false;
        end, obj);

    obj._e_event246 = obj.pvOutroLabel:addEventListener("onClick",
        function (_)
            self.pvOutroLabel.visible = false;
                            self.pvOutroEdit.visible = true;
                            self.pvOutroEdit:setFocus();
        end, obj);

    obj._e_event247 = obj.pvOutroEdit:addEventListener("onExit",
        function (_)
            self.pvOutroLabel.visible = true;
                            self.pvOutroEdit.visible = false;
        end, obj);

    obj._e_event248 = obj.resistenciasLabel:addEventListener("onClick",
        function (_)
            self.resistenciasLabel.visible = false;
                            self.resistenciasEdit.visible = true;
                            self.resistenciasEdit:setFocus();
        end, obj);

    obj._e_event249 = obj.resistenciasEdit:addEventListener("onExit",
        function (_)
            self.resistenciasLabel.visible = true;
                            self.resistenciasEdit.visible = false;
        end, obj);

    obj._e_event250 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                            sheet.pvTotal = ((tonumber(sheet.pvClasse) or 0)+(tonumber(sheet.modCon) or 0)) * (tonumber(sheet.nivel) or 0)+
                                                            (tonumber(sheet.pvAncestralidade) or 0)+
                                                            (tonumber(sheet.pvTemp) or 0)+
                                                            (tonumber(sheet.pvOutro) or 0);
        end, obj);

    obj._e_event251 = obj.caArmaduraLabel:addEventListener("onClick",
        function (_)
            self.caArmaduraLabel.visible = false;
                            self.caArmaduraEdit.visible = true;
                            self.caArmaduraEdit:setFocus();
        end, obj);

    obj._e_event252 = obj.caArmaduraEdit:addEventListener("onExit",
        function (_)
            self.caArmaduraLabel.visible = true;
                            self.caArmaduraEdit.visible = false;
        end, obj);

    obj._e_event253 = obj.caLimitLabel:addEventListener("onClick",
        function (_)
            self.caLimitLabel.visible = false;
                            self.caLimitEdit.visible = true;
                            self.caLimitEdit:setFocus();
        end, obj);

    obj._e_event254 = obj.caLimitEdit:addEventListener("onExit",
        function (_)
            self.caLimitLabel.visible = true;
                            self.caLimitEdit.visible = false;
        end, obj);

    obj._e_event255 = obj.penalidadeLabel:addEventListener("onClick",
        function (_)
            self.penalidadeLabel.visible = false;
                            self.penalidadeEdit.visible = true;
                            self.penalidadeEdit:setFocus();
        end, obj);

    obj._e_event256 = obj.penalidadeEdit:addEventListener("onExit",
        function (_)
            self.penalidadeLabel.visible = true;
                            self.penalidadeEdit.visible = false;
        end, obj);

    obj._e_event257 = obj.caOutrosLabel:addEventListener("onClick",
        function (_)
            self.caOutrosLabel.visible = false;
                            self.caOutrosEdit.visible = true;
                            self.caOutrosEdit:setFocus();
        end, obj);

    obj._e_event258 = obj.caOutrosEdit:addEventListener("onExit",
        function (_)
            self.caOutrosLabel.visible = true;
                            self.caOutrosEdit.visible = false;
        end, obj);

    obj._e_event259 = obj.caEscudoLabel:addEventListener("onClick",
        function (_)
            self.caEscudoLabel.visible = false;
                            self.caEscudoEdit.visible = true;
                            self.caEscudoEdit:setFocus();
        end, obj);

    obj._e_event260 = obj.caEscudoEdit:addEventListener("onExit",
        function (_)
            self.caEscudoLabel.visible = true;
                            self.caEscudoEdit.visible = false;
        end, obj);

    obj._e_event261 = obj.caDurezaLabel:addEventListener("onClick",
        function (_)
            self.caDurezaLabel.visible = false;
                            self.caDurezaEdit.visible = true;
                            self.caDurezaEdit:setFocus();
        end, obj);

    obj._e_event262 = obj.caDurezaEdit:addEventListener("onExit",
        function (_)
            self.caDurezaLabel.visible = true;
                            self.caDurezaEdit.visible = false;
        end, obj);

    obj._e_event263 = obj.caEscudoMaxLabel:addEventListener("onClick",
        function (_)
            self.caEscudoMaxLabel.visible = false;
                            self.caEscudoMaxEdit.visible = true;
                            self.caEscudoMaxEdit:setFocus();
        end, obj);

    obj._e_event264 = obj.caEscudoMaxEdit:addEventListener("onExit",
        function (_)
            self.caEscudoMaxLabel.visible = true;
                            self.caEscudoMaxEdit.visible = false;
        end, obj);

    obj._e_event265 = obj.caEscudoLQLabel:addEventListener("onClick",
        function (_)
            self.caEscudoLQLabel.visible = false;
                            self.caEscudoLQEdit.visible = true;
                            self.caEscudoLQEdit:setFocus();
        end, obj);

    obj._e_event266 = obj.caEscudoLQEdit:addEventListener("onExit",
        function (_)
            self.caEscudoLQLabel.visible = true;
                            self.caEscudoLQEdit.visible = false;
        end, obj);

    obj._e_event267 = obj.caEscudoPVLabel:addEventListener("onClick",
        function (_)
            self.caEscudoPVLabel.visible = false;
                            self.caEscudoPVEdit.visible = true;
                            self.caEscudoPVEdit:setFocus();
        end, obj);

    obj._e_event268 = obj.caEscudoPVEdit:addEventListener("onExit",
        function (_)
            self.caEscudoPVLabel.visible = true;
                            self.caEscudoPVEdit.visible = false;
        end, obj);

    obj._e_event269 = obj.movimentosLabel:addEventListener("onClick",
        function (_)
            self.movimentosLabel.visible = false;
                            self.movimentosEdit.visible = true;
                            self.movimentosEdit:setFocus();
        end, obj);

    obj._e_event270 = obj.movimentosEdit:addEventListener("onExit",
        function (_)
            self.movimentosLabel.visible = true;
                            self.movimentosEdit.visible = false;
        end, obj);

    obj._e_event271 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                            if (tonumber(sheet.caProf) or 0) > 0 then
                                                sheet.caTotal = 10 + math.min((tonumber(sheet.modDes) or 0), (tonumber(sheet.caLimit) or 999))+
                                                                (tonumber(sheet.caArmadura) or 0)+
                                                                (tonumber(sheet.caProf) or 0)+
                                                                (tonumber(sheet.caOutros) or 0)+
                                                                (tonumber(sheet.nivel) or 0);
                                            else
                                                sheet.caTotal = 10 + math.min((tonumber(sheet.modDes) or 0), (tonumber(sheet.caLimit) or 999))+
                                                                (tonumber(sheet.caArmadura) or 0)+
                                                                (tonumber(sheet.caOutros) or 0);
                                            end;
        end, obj);

    obj._e_event272 = obj.talentos:addEventListener("onClick",
        function (_)
            showTalentosPopup();
        end, obj);

    obj._e_event273 = obj.button24:addEventListener("onClick",
        function (_)
            self.rclAcoes:append();
        end, obj);

    obj._e_event274 = obj.button25:addEventListener("onClick",
        function (_)
            self.rclClasses:append();
        end, obj);

    obj._e_event275 = obj.nomeClasseLabel:addEventListener("onClick",
        function (_)
            self.nomeClasseLabel.visible = false;
                            self.nomeClasseEdit.visible = true;
                            self.nomeClasseEdit:setFocus();
        end, obj);

    obj._e_event276 = obj.nomeClasseEdit:addEventListener("onExit",
        function (_)
            self.nomeClasseLabel.visible = true;
                            self.nomeClasseEdit.visible = false;
        end, obj);

    obj._e_event277 = obj.comboBox6:addEventListener("onChange",
        function (_)
            if sheet == nil then return end;
                                                        if sheet.atrBox == "1" then
                                                             sheet.atrClasse = (tonumber(sheet.modFor) or 0);
                                                        elseif sheet.atrBox == "2" then
                                                             sheet.atrClasse = (tonumber(sheet.modDes) or 0);
                                                        elseif sheet.atrBox == "3" then
                                                             sheet.atrClasse = (tonumber(sheet.modCon) or 0);
                                                        elseif sheet.atrBox == "4" then
                                                             sheet.atrClasse = (tonumber(sheet.modInt) or 0);
                                                        elseif sheet.atrBox == "5" then
                                                             sheet.atrClasse = (tonumber(sheet.modSab) or 0);
                                                        elseif sheet.atrBox == "6" then
                                                             sheet.atrClasse = (tonumber(sheet.modCar) or 0);
                                                    end;
        end, obj);

    obj._e_event278 = obj.outrosClasseLabel:addEventListener("onClick",
        function (_)
            self.outrosClasseLabel.visible = false;
                            self.outrosClasseEdit.visible = true;
                            self.outrosClasseEdit:setFocus();
        end, obj);

    obj._e_event279 = obj.outrosClasseEdit:addEventListener("onExit",
        function (_)
            self.outrosClasseLabel.visible = true;
                            self.outrosClasseEdit.visible = false;
        end, obj);

    obj._e_event280 = obj.button26:addEventListener("onClick",
        function (_)
            showMagiasPopup();
        end, obj);

    obj._e_event281 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                                                if (tonumber(sheet.profClasse) or 0) > 0 then
                                                    sheet.cdClasse = 10 + (tonumber(sheet.atrClasse) or 0)+
                                                                    (tonumber(sheet.profClasse) or 0)+
                                                                    (tonumber(sheet.outrosClasse) or 0)+
                                                                    (tonumber(sheet.nivel) or 0);
                                                else
                                                    sheet.cdClasse = 10 + (tonumber(sheet.atrClasse) or 0) + (tonumber(sheet.outrosClasse) or 0);
                                                end;
        end, obj);

    obj._e_event282 = obj.button27:addEventListener("onClick",
        function (_)
            if sheet.modAcrobatismo ~= nil then
                                local mod = tonumber(sheet.modAcrobatismo);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Acrobatismo de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Acrobatismo de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event283 = obj.AcrobatismoOutrosLabel:addEventListener("onClick",
        function (_)
            self.AcrobatismoOutrosLabel.visible = false;
                            self.AcrobatismoOutrosEdit.visible = true;
                            self.AcrobatismoOutrosEdit:setFocus();
        end, obj);

    obj._e_event284 = obj.AcrobatismoOutrosEdit:addEventListener("onExit",
        function (_)
            self.AcrobatismoOutrosLabel.visible = true;
                            self.AcrobatismoOutrosEdit.visible = false;
        end, obj);

    obj._e_event285 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.AcrobatismoProf) or 0) > 0 then
                               sheet.modAcrobatismo = (tonumber(sheet.modDes) or 0)+
                                               (tonumber(sheet.AcrobatismoProf) or 0)+
                                               (tonumber(sheet.AcrobatismoOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modAcrobatismo = (tonumber(sheet.modDes) or 0) + (tonumber(sheet.AcrobatismoOutros) or 0);
                           end;
        end, obj);

    obj._e_event286 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modAcrobatismo or 0));
                            if (mod >= 0) then
                                sheet.modAcrobatismo = "+" .. mod;
                            else
                                sheet.modAcrobatismo = mod;
                            end;
        end, obj);

    obj._e_event287 = obj.button28:addEventListener("onClick",
        function (_)
            if sheet.modArcanismo ~= nil then
                                local mod = tonumber(sheet.modArcanismo);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Arcanismo de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Arcanismo de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event288 = obj.ArcanismoOutrosLabel:addEventListener("onClick",
        function (_)
            self.ArcanismoOutrosLabel.visible = false;
                            self.ArcanismoOutrosEdit.visible = true;
                            self.ArcanismoOutrosEdit:setFocus();
        end, obj);

    obj._e_event289 = obj.ArcanismoOutrosEdit:addEventListener("onExit",
        function (_)
            self.ArcanismoOutrosLabel.visible = true;
                            self.ArcanismoOutrosEdit.visible = false;
        end, obj);

    obj._e_event290 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.ArcanismoProf) or 0) > 0 then
                               sheet.modArcanismo = (tonumber(sheet.modInt) or 0)+
                                               (tonumber(sheet.ArcanismoProf) or 0)+
                                               (tonumber(sheet.ArcanismoOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modArcanismo = (tonumber(sheet.modInt) or 0) + (tonumber(sheet.ArcanismoOutros) or 0);
                           end;
        end, obj);

    obj._e_event291 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modArcanismo or 0));
                            if (mod >= 0) then
                                sheet.modArcanismo = "+" .. mod;
                            else
                                sheet.modArcanismo = mod;
                            end;
        end, obj);

    obj._e_event292 = obj.button29:addEventListener("onClick",
        function (_)
            if sheet.modAtletismo ~= nil then
                                local mod = tonumber(sheet.modAtletismo);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Atletismo de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Atletismo de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event293 = obj.AtletismoOutrosLabel:addEventListener("onClick",
        function (_)
            self.AtletismoOutrosLabel.visible = false;
                            self.AtletismoOutrosEdit.visible = true;
                            self.AtletismoOutrosEdit:setFocus();
        end, obj);

    obj._e_event294 = obj.AtletismoOutrosEdit:addEventListener("onExit",
        function (_)
            self.AtletismoOutrosLabel.visible = true;
                            self.AtletismoOutrosEdit.visible = false;
        end, obj);

    obj._e_event295 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.AtletismoProf) or 0) > 0 then
                               sheet.modAtletismo = (tonumber(sheet.modFor) or 0)+
                                               (tonumber(sheet.AtletismoProf) or 0)+
                                               (tonumber(sheet.AtletismoOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modAtletismo = (tonumber(sheet.modFor) or 0) + (tonumber(sheet.AtletismoOutros) or 0);
                           end;
        end, obj);

    obj._e_event296 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modAtletismo or 0));
                            if (mod >= 0) then
                                sheet.modAtletismo = "+" .. mod;
                            else
                                sheet.modAtletismo = mod;
                            end;
        end, obj);

    obj._e_event297 = obj.button30:addEventListener("onClick",
        function (_)
            if sheet.modDiplomacia ~= nil then
                                local mod = tonumber(sheet.modDiplomacia);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Diplomacia de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Diplomacia de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event298 = obj.DiplomaciaOutrosLabel:addEventListener("onClick",
        function (_)
            self.DiplomaciaOutrosLabel.visible = false;
                            self.DiplomaciaOutrosEdit.visible = true;
                            self.DiplomaciaOutrosEdit:setFocus();
        end, obj);

    obj._e_event299 = obj.DiplomaciaOutrosEdit:addEventListener("onExit",
        function (_)
            self.DiplomaciaOutrosLabel.visible = true;
                            self.DiplomaciaOutrosEdit.visible = false;
        end, obj);

    obj._e_event300 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.DiplomaciaProf) or 0) > 0 then
                               sheet.modDiplomacia = (tonumber(sheet.modCar) or 0)+
                                               (tonumber(sheet.DiplomaciaProf) or 0)+
                                               (tonumber(sheet.DiplomaciaOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modDiplomacia = (tonumber(sheet.modCar) or 0) + (tonumber(sheet.DiplomaciaOutros) or 0);
                           end;
        end, obj);

    obj._e_event301 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modDiplomacia or 0));
                            if (mod >= 0) then
                                sheet.modDiplomacia = "+" .. mod;
                            else
                                sheet.modDiplomacia = mod;
                            end;
        end, obj);

    obj._e_event302 = obj.button31:addEventListener("onClick",
        function (_)
            if sheet.modDissimulacao ~= nil then
                                local mod = tonumber(sheet.modDissimulacao);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Dissimulação de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Dissimulação de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event303 = obj.DissimulacaoOutrosLabel:addEventListener("onClick",
        function (_)
            self.DissimulacaoOutrosLabel.visible = false;
                            self.DissimulacaoOutrosEdit.visible = true;
                            self.DissimulacaoOutrosEdit:setFocus();
        end, obj);

    obj._e_event304 = obj.DissimulacaoOutrosEdit:addEventListener("onExit",
        function (_)
            self.DissimulacaoOutrosLabel.visible = true;
                            self.DissimulacaoOutrosEdit.visible = false;
        end, obj);

    obj._e_event305 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.DissimulacaoProf) or 0) > 0 then
                               sheet.modDissimulacao = (tonumber(sheet.modCar) or 0)+
                                               (tonumber(sheet.DissimulacaoProf) or 0)+
                                               (tonumber(sheet.DissimulacaoOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modDissimulacao = (tonumber(sheet.modCar) or 0) + (tonumber(sheet.DissimulacaoOutros) or 0);
                           end;
        end, obj);

    obj._e_event306 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modDissimulacao or 0));
                            if (mod >= 0) then
                                sheet.modDissimulacao = "+" .. mod;
                            else
                                sheet.modDissimulacao = mod;
                            end;
        end, obj);

    obj._e_event307 = obj.button32:addEventListener("onClick",
        function (_)
            if sheet.modFurtividade ~= nil then
                                local mod = tonumber(sheet.modFurtividade);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Furtividade de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Furtividade de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event308 = obj.FurtividadeOutrosLabel:addEventListener("onClick",
        function (_)
            self.FurtividadeOutrosLabel.visible = false;
                            self.FurtividadeOutrosEdit.visible = true;
                            self.FurtividadeOutrosEdit:setFocus();
        end, obj);

    obj._e_event309 = obj.FurtividadeOutrosEdit:addEventListener("onExit",
        function (_)
            self.FurtividadeOutrosLabel.visible = true;
                            self.FurtividadeOutrosEdit.visible = false;
        end, obj);

    obj._e_event310 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.FurtividadeProf) or 0) > 0 then
                               sheet.modFurtividade = (tonumber(sheet.modDes) or 0)+
                                               (tonumber(sheet.FurtividadeProf) or 0)+
                                               (tonumber(sheet.FurtividadeOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modFurtividade = (tonumber(sheet.modDes) or 0) + (tonumber(sheet.FurtividadeOutros) or 0);
                           end;
        end, obj);

    obj._e_event311 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modFurtividade or 0));
                            if (mod >= 0) then
                                sheet.modFurtividade = "+" .. mod;
                            else
                                sheet.modFurtividade = mod;
                            end;
        end, obj);

    obj._e_event312 = obj.button33:addEventListener("onClick",
        function (_)
            if sheet.modIntimidacao ~= nil then
                                local mod = tonumber(sheet.modIntimidacao);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Intimidação de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Intimidação de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event313 = obj.IntimidacaoOutrosLabel:addEventListener("onClick",
        function (_)
            self.IntimidacaoOutrosLabel.visible = false;
                            self.IntimidacaoOutrosEdit.visible = true;
                            self.IntimidacaoOutrosEdit:setFocus();
        end, obj);

    obj._e_event314 = obj.IntimidacaoOutrosEdit:addEventListener("onExit",
        function (_)
            self.IntimidacaoOutrosLabel.visible = true;
                            self.IntimidacaoOutrosEdit.visible = false;
        end, obj);

    obj._e_event315 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.IntimidacaoProf) or 0) > 0 then
                               sheet.modIntimidacao = (tonumber(sheet.modCar) or 0)+
                                               (tonumber(sheet.IntimidacaoProf) or 0)+
                                               (tonumber(sheet.IntimidacaoOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modIntimidacao = (tonumber(sheet.modCar) or 0) + (tonumber(sheet.IntimidacaoOutros) or 0);
                           end;
        end, obj);

    obj._e_event316 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modIntimidacao or 0));
                            if (mod >= 0) then
                                sheet.modIntimidacao = "+" .. mod;
                            else
                                sheet.modIntimidacao = mod;
                            end;
        end, obj);

    obj._e_event317 = obj.button34:addEventListener("onClick",
        function (_)
            if sheet.modLadroagem ~= nil then
                                local mod = tonumber(sheet.modLadroagem);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Ladroagem de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Ladroagem de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event318 = obj.LadroagemOutrosLabel:addEventListener("onClick",
        function (_)
            self.LadroagemOutrosLabel.visible = false;
                            self.LadroagemOutrosEdit.visible = true;
                            self.LadroagemOutrosEdit:setFocus();
        end, obj);

    obj._e_event319 = obj.LadroagemOutrosEdit:addEventListener("onExit",
        function (_)
            self.LadroagemOutrosLabel.visible = true;
                            self.LadroagemOutrosEdit.visible = false;
        end, obj);

    obj._e_event320 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.LadroagemProf) or 0) > 0 then
                               sheet.modLadroagem = (tonumber(sheet.modDes) or 0)+
                                               (tonumber(sheet.LadroagemProf) or 0)+
                                               (tonumber(sheet.LadroagemOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modLadroagem = (tonumber(sheet.modDes) or 0) + (tonumber(sheet.LadroagemOutros) or 0);
                           end;
        end, obj);

    obj._e_event321 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modLadroagem or 0));
                            if (mod >= 0) then
                                sheet.modLadroagem = "+" .. mod;
                            else
                                sheet.modLadroagem = mod;
                            end;
        end, obj);

    obj._e_event322 = obj.button35:addEventListener("onClick",
        function (_)
            if sheet.modManufatura ~= nil then
                                local mod = tonumber(sheet.modManufatura);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Manufatura de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Manufatura de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event323 = obj.ManufaturaOutrosLabel:addEventListener("onClick",
        function (_)
            self.ManufaturaOutrosLabel.visible = false;
                            self.ManufaturaOutrosEdit.visible = true;
                            self.ManufaturaOutrosEdit:setFocus();
        end, obj);

    obj._e_event324 = obj.ManufaturaOutrosEdit:addEventListener("onExit",
        function (_)
            self.ManufaturaOutrosLabel.visible = true;
                            self.ManufaturaOutrosEdit.visible = false;
        end, obj);

    obj._e_event325 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.ManufaturaProf) or 0) > 0 then
                               sheet.modManufatura = (tonumber(sheet.modInt) or 0)+
                                               (tonumber(sheet.ManufaturaProf) or 0)+
                                               (tonumber(sheet.ManufaturaOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modManufatura = (tonumber(sheet.modInt) or 0) + (tonumber(sheet.ManufaturaOutros) or 0);
                           end;
        end, obj);

    obj._e_event326 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modManufatura or 0));
                            if (mod >= 0) then
                                sheet.modManufatura = "+" .. mod;
                            else
                                sheet.modManufatura = mod;
                            end;
        end, obj);

    obj._e_event327 = obj.button36:addEventListener("onClick",
        function (_)
            if sheet.modMedicina ~= nil then
                                local mod = tonumber(sheet.modMedicina);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Medicina de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Medicina de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event328 = obj.MedicinaOutrosLabel:addEventListener("onClick",
        function (_)
            self.MedicinaOutrosLabel.visible = false;
                            self.MedicinaOutrosEdit.visible = true;
                            self.MedicinaOutrosEdit:setFocus();
        end, obj);

    obj._e_event329 = obj.MedicinaOutrosEdit:addEventListener("onExit",
        function (_)
            self.MedicinaOutrosLabel.visible = true;
                            self.MedicinaOutrosEdit.visible = false;
        end, obj);

    obj._e_event330 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.MedicinaProf) or 0) > 0 then
                               sheet.modMedicina = (tonumber(sheet.modSab) or 0)+
                                               (tonumber(sheet.MedicinaProf) or 0)+
                                               (tonumber(sheet.MedicinaOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modMedicina = (tonumber(sheet.modSab) or 0) + (tonumber(sheet.MedicinaOutros) or 0);
                           end;
        end, obj);

    obj._e_event331 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modMedicina or 0));
                            if (mod >= 0) then
                                sheet.modMedicina = "+" .. mod;
                            else
                                sheet.modMedicina = mod;
                            end;
        end, obj);

    obj._e_event332 = obj.button37:addEventListener("onClick",
        function (_)
            if sheet.modNatureza ~= nil then
                                local mod = tonumber(sheet.modNatureza);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Natureza de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Natureza de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event333 = obj.NaturezaOutrosLabel:addEventListener("onClick",
        function (_)
            self.NaturezaOutrosLabel.visible = false;
                            self.NaturezaOutrosEdit.visible = true;
                            self.NaturezaOutrosEdit:setFocus();
        end, obj);

    obj._e_event334 = obj.NaturezaOutrosEdit:addEventListener("onExit",
        function (_)
            self.NaturezaOutrosLabel.visible = true;
                            self.NaturezaOutrosEdit.visible = false;
        end, obj);

    obj._e_event335 = obj.dataLink42:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.NaturezaProf) or 0) > 0 then
                               sheet.modNatureza = (tonumber(sheet.modSab) or 0)+
                                               (tonumber(sheet.NaturezaProf) or 0)+
                                               (tonumber(sheet.NaturezaOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modNatureza = (tonumber(sheet.modSab) or 0) + (tonumber(sheet.NaturezaOutros) or 0);
                           end;
        end, obj);

    obj._e_event336 = obj.dataLink43:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modNatureza or 0));
                            if (mod >= 0) then
                                sheet.modNatureza = "+" .. mod;
                            else
                                sheet.modNatureza = mod;
                            end;
        end, obj);

    obj._e_event337 = obj.button38:addEventListener("onClick",
        function (_)
            if sheet.modOcultismo ~= nil then
                                local mod = tonumber(sheet.modOcultismo);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Ocultismo de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Ocultismo de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event338 = obj.OcultismoOutrosLabel:addEventListener("onClick",
        function (_)
            self.OcultismoOutrosLabel.visible = false;
                            self.OcultismoOutrosEdit.visible = true;
                            self.OcultismoOutrosEdit:setFocus();
        end, obj);

    obj._e_event339 = obj.OcultismoOutrosEdit:addEventListener("onExit",
        function (_)
            self.OcultismoOutrosLabel.visible = true;
                            self.OcultismoOutrosEdit.visible = false;
        end, obj);

    obj._e_event340 = obj.dataLink44:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.OcultismoProf) or 0) > 0 then
                               sheet.modOcultismo = (tonumber(sheet.modInt) or 0)+
                                               (tonumber(sheet.OcultismoProf) or 0)+
                                               (tonumber(sheet.OcultismoOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modOcultismo = (tonumber(sheet.modInt) or 0) + (tonumber(sheet.OcultismoOutros) or 0);
                           end;
        end, obj);

    obj._e_event341 = obj.dataLink45:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modOcultismo or 0));
                            if (mod >= 0) then
                                sheet.modOcultismo = "+" .. mod;
                            else
                                sheet.modOcultismo = mod;
                            end;
        end, obj);

    obj._e_event342 = obj.button39:addEventListener("onClick",
        function (_)
            if sheet.modPerformance ~= nil then
                                local mod = tonumber(sheet.modPerformance);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Performance de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Performance de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event343 = obj.PerformanceOutrosLabel:addEventListener("onClick",
        function (_)
            self.PerformanceOutrosLabel.visible = false;
                            self.PerformanceOutrosEdit.visible = true;
                            self.PerformanceOutrosEdit:setFocus();
        end, obj);

    obj._e_event344 = obj.PerformanceOutrosEdit:addEventListener("onExit",
        function (_)
            self.PerformanceOutrosLabel.visible = true;
                            self.PerformanceOutrosEdit.visible = false;
        end, obj);

    obj._e_event345 = obj.dataLink46:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.PerformanceProf) or 0) > 0 then
                               sheet.modPerformance = (tonumber(sheet.modCar) or 0)+
                                               (tonumber(sheet.PerformanceProf) or 0)+
                                               (tonumber(sheet.PerformanceOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modPerformance = (tonumber(sheet.modCar) or 0) + (tonumber(sheet.PerformanceOutros) or 0);
                           end;
        end, obj);

    obj._e_event346 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modPerformance or 0));
                            if (mod >= 0) then
                                sheet.modPerformance = "+" .. mod;
                            else
                                sheet.modPerformance = mod;
                            end;
        end, obj);

    obj._e_event347 = obj.button40:addEventListener("onClick",
        function (_)
            if sheet.modReligiao ~= nil then
                                local mod = tonumber(sheet.modReligiao);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Religião de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Religião de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event348 = obj.ReligiaoOutrosLabel:addEventListener("onClick",
        function (_)
            self.ReligiaoOutrosLabel.visible = false;
                            self.ReligiaoOutrosEdit.visible = true;
                            self.ReligiaoOutrosEdit:setFocus();
        end, obj);

    obj._e_event349 = obj.ReligiaoOutrosEdit:addEventListener("onExit",
        function (_)
            self.ReligiaoOutrosLabel.visible = true;
                            self.ReligiaoOutrosEdit.visible = false;
        end, obj);

    obj._e_event350 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.ReligiaoProf) or 0) > 0 then
                               sheet.modReligiao = (tonumber(sheet.modSab) or 0)+
                                               (tonumber(sheet.ReligiaoProf) or 0)+
                                               (tonumber(sheet.ReligiaoOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modReligiao = (tonumber(sheet.modSab) or 0) + (tonumber(sheet.ReligiaoOutros) or 0);
                           end;
        end, obj);

    obj._e_event351 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modReligiao or 0));
                            if (mod >= 0) then
                                sheet.modReligiao = "+" .. mod;
                            else
                                sheet.modReligiao = mod;
                            end;
        end, obj);

    obj._e_event352 = obj.button41:addEventListener("onClick",
        function (_)
            if sheet.modSobrevivencia ~= nil then
                                local mod = tonumber(sheet.modSobrevivencia);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Sobrevivência de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Sobrevivência de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event353 = obj.SobrevivenciaOutrosLabel:addEventListener("onClick",
        function (_)
            self.SobrevivenciaOutrosLabel.visible = false;
                            self.SobrevivenciaOutrosEdit.visible = true;
                            self.SobrevivenciaOutrosEdit:setFocus();
        end, obj);

    obj._e_event354 = obj.SobrevivenciaOutrosEdit:addEventListener("onExit",
        function (_)
            self.SobrevivenciaOutrosLabel.visible = true;
                            self.SobrevivenciaOutrosEdit.visible = false;
        end, obj);

    obj._e_event355 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.SobrevivenciaProf) or 0) > 0 then
                               sheet.modSobrevivencia = (tonumber(sheet.modSab) or 0)+
                                               (tonumber(sheet.SobrevivenciaProf) or 0)+
                                               (tonumber(sheet.SobrevivenciaOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modSobrevivencia = (tonumber(sheet.modSab) or 0) + (tonumber(sheet.SobrevivenciaOutros) or 0);
                           end;
        end, obj);

    obj._e_event356 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modSobrevivencia or 0));
                            if (mod >= 0) then
                                sheet.modSobrevivencia = "+" .. mod;
                            else
                                sheet.modSobrevivencia = mod;
                            end;
        end, obj);

    obj._e_event357 = obj.button42:addEventListener("onClick",
        function (_)
            if sheet.modSociedade ~= nil then
                                local mod = tonumber(sheet.modSociedade);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Sociedade de " .. (sheet.nome or "Personagem"));
                            else
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, "Teste de Sociedade de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event358 = obj.SociedadeOutrosLabel:addEventListener("onClick",
        function (_)
            self.SociedadeOutrosLabel.visible = false;
                            self.SociedadeOutrosEdit.visible = true;
                            self.SociedadeOutrosEdit:setFocus();
        end, obj);

    obj._e_event359 = obj.SociedadeOutrosEdit:addEventListener("onExit",
        function (_)
            self.SociedadeOutrosLabel.visible = true;
                            self.SociedadeOutrosEdit.visible = false;
        end, obj);

    obj._e_event360 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                           if (tonumber(sheet.SociedadeProf) or 0) > 0 then
                               sheet.modSociedade = (tonumber(sheet.modInt) or 0)+
                                               (tonumber(sheet.SociedadeProf) or 0)+
                                               (tonumber(sheet.SociedadeOutros) or 0)+
                                               (tonumber(sheet.nivel) or 0);
                           else
                               sheet.modSociedade = (tonumber(sheet.modInt) or 0) + (tonumber(sheet.SociedadeOutros) or 0);
                           end;
        end, obj);

    obj._e_event361 = obj.dataLink53:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.modSociedade or 0));
                            if (mod >= 0) then
                                sheet.modSociedade = "+" .. mod;
                            else
                                sheet.modSociedade = mod;
                            end;
        end, obj);

    obj._e_event362 = obj.button43:addEventListener("onClick",
        function (_)
            self.rclSaber:append();
        end, obj);

    obj._e_event363 = obj.nomeSaberLabel:addEventListener("onClick",
        function (_)
            self.nomeSaberLabel.visible = false;
                            self.nomeSaberEdit.visible = true;
                            self.nomeSaberEdit:setFocus();
        end, obj);

    obj._e_event364 = obj.nomeSaberEdit:addEventListener("onExit",
        function (_)
            self.nomeSaberLabel.visible = true;
                            self.nomeSaberEdit.visible = false;
        end, obj);

    obj._e_event365 = obj.outrosSaberLabel:addEventListener("onClick",
        function (_)
            self.outrosSaberLabel.visible = false;
                            self.outrosSaberEdit.visible = true;
                            self.outrosSaberEdit:setFocus();
        end, obj);

    obj._e_event366 = obj.outrosSaberEdit:addEventListener("onExit",
        function (_)
            self.outrosSaberLabel.visible = true;
                            self.outrosSaberEdit.visible = false;
        end, obj);

    obj._e_event367 = obj.button44:addEventListener("onClick",
        function (_)
            if sheet.bonusSaber ~= nil then
                                                        local mod = tonumber(sheet.bonusSaber);
                                                        local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                                        local mesa = Firecast.getMesaDe(sheet);
                                                        mesa.activeChat:rolarDados(rolagem, "Teste de Saber de " .. (sheet.nome or "Personagem"));
                                                    else
                                                        local rolagem = Firecast.interpretarRolagem("1d20");
                                                        local mesa = Firecast.getMesaDe(sheet);
                                                        mesa.activeChat:rolarDados(rolagem, "Teste de Saber de " .. (sheet.nome or "Personagem"));
                                                    end;
        end, obj);

    obj._e_event368 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                                                       if (tonumber(sheet.profSaber) or 0) > 0 then
                                                           sheet.bonusSaber = (tonumber(sheet.modInt) or 0)+
                                                                           (tonumber(sheet.profSaber) or 0)+
                                                                           (tonumber(sheet.outrosSaber) or 0)+
                                                                           (tonumber(sheet.nivel) or 0);
                                                       else
                                                           sheet.bonusSaber = (tonumber(sheet.modInt) or 0) + (tonumber(sheet.outrosSaber) or 0);
                                                       end;
        end, obj);

    obj._e_event369 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                                    local mod = (tonumber(sheet.bonusSaber or 0));
                                                    if (mod >= 0) then
                                                        sheet.bonusSaber = "+" .. mod;
                                                    else
                                                        sheet.bonusSaber = mod;
                                                    end;
        end, obj);

    obj._e_event370 = obj.idiomasLabel:addEventListener("onClick",
        function (_)
            self.idiomasLabel.visible = false;
                            self.idiomasEdit.visible = true;
                            self.idiomasEdit:setFocus();
        end, obj);

    obj._e_event371 = obj.idiomasEdit:addEventListener("onExit",
        function (_)
            self.idiomasLabel.visible = true;
                            self.idiomasEdit.visible = false;
        end, obj);

    obj._e_event372 = obj.nomeGolpeLabel:addEventListener("onClick",
        function (_)
            self.nomeGolpeLabel.visible = false;
                            self.nomeGolpeEdit.visible = true;
                            self.nomeGolpeEdit:setFocus();
        end, obj);

    obj._e_event373 = obj.nomeGolpeEdit:addEventListener("onExit",
        function (_)
            self.nomeGolpeLabel.visible = true;
                            self.nomeGolpeEdit.visible = false;
        end, obj);

    obj._e_event374 = obj.comboBox33:addEventListener("onChange",
        function (_)
            if sheet == nil then return end;
                                                            if sheet.golpeBox == "1" then
                                                                 sheet.atrGolpe = (tonumber(sheet.modFor) or 0);
                                                            elseif sheet.golpeBox == "2" then
                                                                 sheet.atrGolpe = (tonumber(sheet.modDes) or 0);
                                                            elseif sheet.golpeBox == "3" then
                                                                 sheet.atrGolpe = (tonumber(sheet.modCon) or 0);
                                                            elseif sheet.golpeBox == "4" then
                                                                 sheet.atrGolpe = (tonumber(sheet.modInt) or 0);
                                                            elseif sheet.golpeBox == "5" then
                                                                 sheet.atrGolpe = (tonumber(sheet.modSab) or 0);
                                                            elseif sheet.golpeBox == "6" then
                                                                 sheet.atrGolpe = (tonumber(sheet.modCar) or 0);
                                                        end;
        end, obj);

    obj._e_event375 = obj.outrosGolpeLabel:addEventListener("onClick",
        function (_)
            self.outrosGolpeLabel.visible = false;
                            self.outrosGolpeEdit.visible = true;
                            self.outrosGolpeEdit:setFocus();
        end, obj);

    obj._e_event376 = obj.outrosGolpeEdit:addEventListener("onExit",
        function (_)
            self.outrosGolpeLabel.visible = true;
                            self.outrosGolpeEdit.visible = false;
        end, obj);

    obj._e_event377 = obj.button45:addEventListener("onClick",
        function (_)
            if sheet.danoGolpe == nil then
            				                                showMessage("O ataque não possui dano.");
                                                        elseif sheet.bonusGolpe ~= nil then
                                                            local mod = tonumber(sheet.bonusGolpe);
                                                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                                            local dano = Firecast.interpretarRolagem(sheet.danoGolpe);
                                                            local mesa = Firecast.getMesaDe(sheet);
                                                            mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpe or "Ataque") .. " de " .. (sheet.nome or "Personagem"),
                                                                function(rolado)
                                                                    mesa.activeChat:rolarDados(dano, "Primeiro Dano de " .. (sheet.nomeGolpe or "Ataque"))
                                                                end);
                                                        elseif sheet.bonusGolpe == nil then
                                                            local rolagem = Firecast.interpretarRolagem("1d20");
                                                            local dano = Firecast.interpretarRolagem(sheet.danoGolpe);
                                                            local mesa = Firecast.getMesaDe(sheet);
                                                            mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpe or "Ataque") .. " de " .. (sheet.nome or "Personagem"),
                                                                function(rolado)
                                                                    mesa.activeChat:rolarDados(dano, "Primeiro Dano de " .. (sheet.nomeGolpe or "Ataque"))
                                                                end);
                                                        end;
        end, obj);

    obj._e_event378 = obj.danoGolpeLabel:addEventListener("onClick",
        function (_)
            self.danoGolpeLabel.visible = false;
                            self.danoGolpeEdit.visible = true;
                            self.danoGolpeEdit:setFocus();
        end, obj);

    obj._e_event379 = obj.danoGolpeEdit:addEventListener("onExit",
        function (_)
            self.danoGolpeLabel.visible = true;
                            self.danoGolpeEdit.visible = false;
        end, obj);

    obj._e_event380 = obj.button46:addEventListener("onClick",
        function (_)
            if sheet.danoGolpe == nil then
            				                                showMessage("O ataque não possui dano.");
                                                        elseif sheet.bonusGolpe ~= nil then
                                                            local mod = tonumber(sheet.bonusGolpe) + tonumber(sheet.penSegundo);
                                                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                                            local dano = Firecast.interpretarRolagem(sheet.danoGolpe);
                                                            local mesa = Firecast.getMesaDe(sheet);
                                                            mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpe or "Ataque") .. " de " .. (sheet.nome or "Personagem"),
                                                                function(rolado)
                                                                    mesa.activeChat:rolarDados(dano, "Segundo Dano de " .. (sheet.nomeGolpe or "Ataque"))
                                                                end);
                                                        elseif sheet.bonusGolpe == nil then
                                                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. (tonumber(sheet.penSegundo) or 0));
                                                            local dano = Firecast.interpretarRolagem(sheet.danoGolpe);
                                                            local mesa = Firecast.getMesaDe(sheet);
                                                            mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpe or "Ataque") .. " de " .. (sheet.nome or "Personagem"),
                                                                function(rolado)
                                                                    mesa.activeChat:rolarDados(dano, "Segundo Dano de " .. (sheet.nomeGolpe or "Ataque"))
                                                                end);
                                                        end;
        end, obj);

    obj._e_event381 = obj.button47:addEventListener("onClick",
        function (_)
            if sheet.danoGolpe == nil then
            				                                showMessage("O ataque não possui dano.");
                                                        elseif sheet.bonusGolpe ~= nil then
                                                            local mod = tonumber(sheet.bonusGolpe) + tonumber(sheet.penTerceiro);
                                                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                                            local dano = Firecast.interpretarRolagem(sheet.danoGolpe);
                                                            local mesa = Firecast.getMesaDe(sheet);
                                                            mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpe or "Ataque") .. " de " .. (sheet.nome or "Personagem"),
                                                                function(rolado)
                                                                    mesa.activeChat:rolarDados(dano, "Terceiro Dano de " .. (sheet.nomeGolpe or "Ataque"))
                                                                end);
                                                        elseif sheet.bonusGolpe == nil then
                                                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. (tonumber(sheet.penTerceiro) or 0));
                                                            local dano = Firecast.interpretarRolagem(sheet.danoGolpe);
                                                            local mesa = Firecast.getMesaDe(sheet);
                                                            mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpe or "Ataque") .. " de " .. (sheet.nome or "Personagem"),
                                                                function(rolado)
                                                                    mesa.activeChat:rolarDados(dano, "Terceiro Dano de " .. (sheet.nomeGolpe or "Ataque"))
                                                                end);
                                                        end;
        end, obj);

    obj._e_event382 = obj.tracosGolpeLabel:addEventListener("onClick",
        function (_)
            self.tracosGolpeLabel.visible = false;
                            self.tracosGolpeEdit.visible = true;
                            self.tracosGolpeEdit:setFocus();
        end, obj);

    obj._e_event383 = obj.tracosGolpeEdit:addEventListener("onExit",
        function (_)
            self.tracosGolpeLabel.visible = true;
                            self.tracosGolpeEdit.visible = false;
        end, obj);

    obj._e_event384 = obj.button48:addEventListener("onClick",
        function (_)
            self.rclGolpes:append();
        end, obj);

    obj._e_event385 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                                                           if (tonumber(sheet.profGolpe) or 0) > 0 then
                                                               sheet.bonusGolpe = (tonumber(sheet.atrGolpe) or 0)+
                                                                               (tonumber(sheet.profGolpe) or 0)+
                                                                               (tonumber(sheet.outrosGolpe) or 0)+
                                                                               (tonumber(sheet.nivel) or 0);
                                                           else
                                                               sheet.bonusGolpe = (tonumber(sheet.atrGolpe) or 0) + (tonumber(sheet.outrosGolpe) or 0);
                                                           end;
        end, obj);

    obj._e_event386 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                                                        local mod = (tonumber(sheet.bonusGolpe or 0));
                                                        if (mod >= 0) then
                                                            sheet.bonusGolpe = "+" .. mod;
                                                        else
                                                            sheet.bonusGolpe = mod;
                                                        end;
        end, obj);

    obj._e_event387 = obj.personalidadeLabel:addEventListener("onClick",
        function (_)
            self.personalidadeLabel.visible = false;
                            self.personalidadeEdit.visible = true;
                            self.personalidadeEdit:setFocus();
        end, obj);

    obj._e_event388 = obj.personalidadeEdit:addEventListener("onExit",
        function (_)
            self.personalidadeLabel.visible = true;
                            self.personalidadeEdit.visible = false;
        end, obj);

    obj._e_event389 = obj.inventario:addEventListener("onClick",
        function (_)
            showItemPopup();
        end, obj);

    obj._e_event390 = obj.info:addEventListener("onClick",
        function (_)
            showInfoPopup();
        end, obj);

    obj._e_event391 = obj.historiaLabel:addEventListener("onClick",
        function (_)
            self.historiaLabel.visible = false;
                            self.historiaEdit.visible = true;
                            self.historiaEdit:setFocus();
        end, obj);

    obj._e_event392 = obj.historiaEdit:addEventListener("onExit",
        function (_)
            self.historiaLabel.visible = true;
                            self.historiaEdit.visible = false;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event392);
        __o_rrpgObjs.removeEventListenerById(self._e_event391);
        __o_rrpgObjs.removeEventListenerById(self._e_event390);
        __o_rrpgObjs.removeEventListenerById(self._e_event389);
        __o_rrpgObjs.removeEventListenerById(self._e_event388);
        __o_rrpgObjs.removeEventListenerById(self._e_event387);
        __o_rrpgObjs.removeEventListenerById(self._e_event386);
        __o_rrpgObjs.removeEventListenerById(self._e_event385);
        __o_rrpgObjs.removeEventListenerById(self._e_event384);
        __o_rrpgObjs.removeEventListenerById(self._e_event383);
        __o_rrpgObjs.removeEventListenerById(self._e_event382);
        __o_rrpgObjs.removeEventListenerById(self._e_event381);
        __o_rrpgObjs.removeEventListenerById(self._e_event380);
        __o_rrpgObjs.removeEventListenerById(self._e_event379);
        __o_rrpgObjs.removeEventListenerById(self._e_event378);
        __o_rrpgObjs.removeEventListenerById(self._e_event377);
        __o_rrpgObjs.removeEventListenerById(self._e_event376);
        __o_rrpgObjs.removeEventListenerById(self._e_event375);
        __o_rrpgObjs.removeEventListenerById(self._e_event374);
        __o_rrpgObjs.removeEventListenerById(self._e_event373);
        __o_rrpgObjs.removeEventListenerById(self._e_event372);
        __o_rrpgObjs.removeEventListenerById(self._e_event371);
        __o_rrpgObjs.removeEventListenerById(self._e_event370);
        __o_rrpgObjs.removeEventListenerById(self._e_event369);
        __o_rrpgObjs.removeEventListenerById(self._e_event368);
        __o_rrpgObjs.removeEventListenerById(self._e_event367);
        __o_rrpgObjs.removeEventListenerById(self._e_event366);
        __o_rrpgObjs.removeEventListenerById(self._e_event365);
        __o_rrpgObjs.removeEventListenerById(self._e_event364);
        __o_rrpgObjs.removeEventListenerById(self._e_event363);
        __o_rrpgObjs.removeEventListenerById(self._e_event362);
        __o_rrpgObjs.removeEventListenerById(self._e_event361);
        __o_rrpgObjs.removeEventListenerById(self._e_event360);
        __o_rrpgObjs.removeEventListenerById(self._e_event359);
        __o_rrpgObjs.removeEventListenerById(self._e_event358);
        __o_rrpgObjs.removeEventListenerById(self._e_event357);
        __o_rrpgObjs.removeEventListenerById(self._e_event356);
        __o_rrpgObjs.removeEventListenerById(self._e_event355);
        __o_rrpgObjs.removeEventListenerById(self._e_event354);
        __o_rrpgObjs.removeEventListenerById(self._e_event353);
        __o_rrpgObjs.removeEventListenerById(self._e_event352);
        __o_rrpgObjs.removeEventListenerById(self._e_event351);
        __o_rrpgObjs.removeEventListenerById(self._e_event350);
        __o_rrpgObjs.removeEventListenerById(self._e_event349);
        __o_rrpgObjs.removeEventListenerById(self._e_event348);
        __o_rrpgObjs.removeEventListenerById(self._e_event347);
        __o_rrpgObjs.removeEventListenerById(self._e_event346);
        __o_rrpgObjs.removeEventListenerById(self._e_event345);
        __o_rrpgObjs.removeEventListenerById(self._e_event344);
        __o_rrpgObjs.removeEventListenerById(self._e_event343);
        __o_rrpgObjs.removeEventListenerById(self._e_event342);
        __o_rrpgObjs.removeEventListenerById(self._e_event341);
        __o_rrpgObjs.removeEventListenerById(self._e_event340);
        __o_rrpgObjs.removeEventListenerById(self._e_event339);
        __o_rrpgObjs.removeEventListenerById(self._e_event338);
        __o_rrpgObjs.removeEventListenerById(self._e_event337);
        __o_rrpgObjs.removeEventListenerById(self._e_event336);
        __o_rrpgObjs.removeEventListenerById(self._e_event335);
        __o_rrpgObjs.removeEventListenerById(self._e_event334);
        __o_rrpgObjs.removeEventListenerById(self._e_event333);
        __o_rrpgObjs.removeEventListenerById(self._e_event332);
        __o_rrpgObjs.removeEventListenerById(self._e_event331);
        __o_rrpgObjs.removeEventListenerById(self._e_event330);
        __o_rrpgObjs.removeEventListenerById(self._e_event329);
        __o_rrpgObjs.removeEventListenerById(self._e_event328);
        __o_rrpgObjs.removeEventListenerById(self._e_event327);
        __o_rrpgObjs.removeEventListenerById(self._e_event326);
        __o_rrpgObjs.removeEventListenerById(self._e_event325);
        __o_rrpgObjs.removeEventListenerById(self._e_event324);
        __o_rrpgObjs.removeEventListenerById(self._e_event323);
        __o_rrpgObjs.removeEventListenerById(self._e_event322);
        __o_rrpgObjs.removeEventListenerById(self._e_event321);
        __o_rrpgObjs.removeEventListenerById(self._e_event320);
        __o_rrpgObjs.removeEventListenerById(self._e_event319);
        __o_rrpgObjs.removeEventListenerById(self._e_event318);
        __o_rrpgObjs.removeEventListenerById(self._e_event317);
        __o_rrpgObjs.removeEventListenerById(self._e_event316);
        __o_rrpgObjs.removeEventListenerById(self._e_event315);
        __o_rrpgObjs.removeEventListenerById(self._e_event314);
        __o_rrpgObjs.removeEventListenerById(self._e_event313);
        __o_rrpgObjs.removeEventListenerById(self._e_event312);
        __o_rrpgObjs.removeEventListenerById(self._e_event311);
        __o_rrpgObjs.removeEventListenerById(self._e_event310);
        __o_rrpgObjs.removeEventListenerById(self._e_event309);
        __o_rrpgObjs.removeEventListenerById(self._e_event308);
        __o_rrpgObjs.removeEventListenerById(self._e_event307);
        __o_rrpgObjs.removeEventListenerById(self._e_event306);
        __o_rrpgObjs.removeEventListenerById(self._e_event305);
        __o_rrpgObjs.removeEventListenerById(self._e_event304);
        __o_rrpgObjs.removeEventListenerById(self._e_event303);
        __o_rrpgObjs.removeEventListenerById(self._e_event302);
        __o_rrpgObjs.removeEventListenerById(self._e_event301);
        __o_rrpgObjs.removeEventListenerById(self._e_event300);
        __o_rrpgObjs.removeEventListenerById(self._e_event299);
        __o_rrpgObjs.removeEventListenerById(self._e_event298);
        __o_rrpgObjs.removeEventListenerById(self._e_event297);
        __o_rrpgObjs.removeEventListenerById(self._e_event296);
        __o_rrpgObjs.removeEventListenerById(self._e_event295);
        __o_rrpgObjs.removeEventListenerById(self._e_event294);
        __o_rrpgObjs.removeEventListenerById(self._e_event293);
        __o_rrpgObjs.removeEventListenerById(self._e_event292);
        __o_rrpgObjs.removeEventListenerById(self._e_event291);
        __o_rrpgObjs.removeEventListenerById(self._e_event290);
        __o_rrpgObjs.removeEventListenerById(self._e_event289);
        __o_rrpgObjs.removeEventListenerById(self._e_event288);
        __o_rrpgObjs.removeEventListenerById(self._e_event287);
        __o_rrpgObjs.removeEventListenerById(self._e_event286);
        __o_rrpgObjs.removeEventListenerById(self._e_event285);
        __o_rrpgObjs.removeEventListenerById(self._e_event284);
        __o_rrpgObjs.removeEventListenerById(self._e_event283);
        __o_rrpgObjs.removeEventListenerById(self._e_event282);
        __o_rrpgObjs.removeEventListenerById(self._e_event281);
        __o_rrpgObjs.removeEventListenerById(self._e_event280);
        __o_rrpgObjs.removeEventListenerById(self._e_event279);
        __o_rrpgObjs.removeEventListenerById(self._e_event278);
        __o_rrpgObjs.removeEventListenerById(self._e_event277);
        __o_rrpgObjs.removeEventListenerById(self._e_event276);
        __o_rrpgObjs.removeEventListenerById(self._e_event275);
        __o_rrpgObjs.removeEventListenerById(self._e_event274);
        __o_rrpgObjs.removeEventListenerById(self._e_event273);
        __o_rrpgObjs.removeEventListenerById(self._e_event272);
        __o_rrpgObjs.removeEventListenerById(self._e_event271);
        __o_rrpgObjs.removeEventListenerById(self._e_event270);
        __o_rrpgObjs.removeEventListenerById(self._e_event269);
        __o_rrpgObjs.removeEventListenerById(self._e_event268);
        __o_rrpgObjs.removeEventListenerById(self._e_event267);
        __o_rrpgObjs.removeEventListenerById(self._e_event266);
        __o_rrpgObjs.removeEventListenerById(self._e_event265);
        __o_rrpgObjs.removeEventListenerById(self._e_event264);
        __o_rrpgObjs.removeEventListenerById(self._e_event263);
        __o_rrpgObjs.removeEventListenerById(self._e_event262);
        __o_rrpgObjs.removeEventListenerById(self._e_event261);
        __o_rrpgObjs.removeEventListenerById(self._e_event260);
        __o_rrpgObjs.removeEventListenerById(self._e_event259);
        __o_rrpgObjs.removeEventListenerById(self._e_event258);
        __o_rrpgObjs.removeEventListenerById(self._e_event257);
        __o_rrpgObjs.removeEventListenerById(self._e_event256);
        __o_rrpgObjs.removeEventListenerById(self._e_event255);
        __o_rrpgObjs.removeEventListenerById(self._e_event254);
        __o_rrpgObjs.removeEventListenerById(self._e_event253);
        __o_rrpgObjs.removeEventListenerById(self._e_event252);
        __o_rrpgObjs.removeEventListenerById(self._e_event251);
        __o_rrpgObjs.removeEventListenerById(self._e_event250);
        __o_rrpgObjs.removeEventListenerById(self._e_event249);
        __o_rrpgObjs.removeEventListenerById(self._e_event248);
        __o_rrpgObjs.removeEventListenerById(self._e_event247);
        __o_rrpgObjs.removeEventListenerById(self._e_event246);
        __o_rrpgObjs.removeEventListenerById(self._e_event245);
        __o_rrpgObjs.removeEventListenerById(self._e_event244);
        __o_rrpgObjs.removeEventListenerById(self._e_event243);
        __o_rrpgObjs.removeEventListenerById(self._e_event242);
        __o_rrpgObjs.removeEventListenerById(self._e_event241);
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
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

        if self.label329 ~= nil then self.label329:destroy(); self.label329 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.FortOutrosLabel ~= nil then self.FortOutrosLabel:destroy(); self.FortOutrosLabel = nil; end;
        if self.label327 ~= nil then self.label327:destroy(); self.label327 = nil; end;
        if self.rectangle148 ~= nil then self.rectangle148:destroy(); self.rectangle148 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.pvOutroEdit ~= nil then self.pvOutroEdit:destroy(); self.pvOutroEdit = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.usadosSlot10Edit ~= nil then self.usadosSlot10Edit:destroy(); self.usadosSlot10Edit = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.label338 ~= nil then self.label338:destroy(); self.label338 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.acaoDescEdit ~= nil then self.acaoDescEdit:destroy(); self.acaoDescEdit = nil; end;
        if self.DesBaseLabel ~= nil then self.DesBaseLabel:destroy(); self.DesBaseLabel = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.MedicinaOutrosEdit ~= nil then self.MedicinaOutrosEdit:destroy(); self.MedicinaOutrosEdit = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.personalidadeLabel ~= nil then self.personalidadeLabel:destroy(); self.personalidadeLabel = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.maxSlot3Label ~= nil then self.maxSlot3Label:destroy(); self.maxSlot3Label = nil; end;
        if self.rectangle138 ~= nil then self.rectangle138:destroy(); self.rectangle138 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.rclMagiasInatas ~= nil then self.rclMagiasInatas:destroy(); self.rclMagiasInatas = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.SabOutrosLabel ~= nil then self.SabOutrosLabel:destroy(); self.SabOutrosLabel = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.maxSlot1Edit ~= nil then self.maxSlot1Edit:destroy(); self.maxSlot1Edit = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label331 ~= nil then self.label331:destroy(); self.label331 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.danoGolpeLabel ~= nil then self.danoGolpeLabel:destroy(); self.danoGolpeLabel = nil; end;
        if self.rectangle201 ~= nil then self.rectangle201:destroy(); self.rectangle201 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label293 ~= nil then self.label293:destroy(); self.label293 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.inventario ~= nil then self.inventario:destroy(); self.inventario = nil; end;
        if self.usadosSlot9Edit ~= nil then self.usadosSlot9Edit:destroy(); self.usadosSlot9Edit = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.nivelTruqueEdit ~= nil then self.nivelTruqueEdit:destroy(); self.nivelTruqueEdit = nil; end;
        if self.anotacoesEdit ~= nil then self.anotacoesEdit:destroy(); self.anotacoesEdit = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label367 ~= nil then self.label367:destroy(); self.label367 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.rectangle208 ~= nil then self.rectangle208:destroy(); self.rectangle208 = nil; end;
        if self.outrosSaberLabel ~= nil then self.outrosSaberLabel:destroy(); self.outrosSaberLabel = nil; end;
        if self.penalidadeEdit ~= nil then self.penalidadeEdit:destroy(); self.penalidadeEdit = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.SabClasseEdit ~= nil then self.SabClasseEdit:destroy(); self.SabClasseEdit = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.ForBioLabel ~= nil then self.ForBioLabel:destroy(); self.ForBioLabel = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.rectangle232 ~= nil then self.rectangle232:destroy(); self.rectangle232 = nil; end;
        if self.ConNivelLabel ~= nil then self.ConNivelLabel:destroy(); self.ConNivelLabel = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.comboBox36 ~= nil then self.comboBox36:destroy(); self.comboBox36 = nil; end;
        if self.SociedadeOutrosLabel ~= nil then self.SociedadeOutrosLabel:destroy(); self.SociedadeOutrosLabel = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.imageCheckBox13 ~= nil then self.imageCheckBox13:destroy(); self.imageCheckBox13 = nil; end;
        if self.caEscudoLabel ~= nil then self.caEscudoLabel:destroy(); self.caEscudoLabel = nil; end;
        if self.rectangle198 ~= nil then self.rectangle198:destroy(); self.rectangle198 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.DesRacaEdit ~= nil then self.DesRacaEdit:destroy(); self.DesRacaEdit = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.label287 ~= nil then self.label287:destroy(); self.label287 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.maxSlot4Edit ~= nil then self.maxSlot4Edit:destroy(); self.maxSlot4Edit = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.ReligiaoOutrosEdit ~= nil then self.ReligiaoOutrosEdit:destroy(); self.ReligiaoOutrosEdit = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.condicoesLabel ~= nil then self.condicoesLabel:destroy(); self.condicoesLabel = nil; end;
        if self.label258 ~= nil then self.label258:destroy(); self.label258 = nil; end;
        if self.experienciaLabel ~= nil then self.experienciaLabel:destroy(); self.experienciaLabel = nil; end;
        if self.rectangle284 ~= nil then self.rectangle284:destroy(); self.rectangle284 = nil; end;
        if self.rectangle287 ~= nil then self.rectangle287:destroy(); self.rectangle287 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.comboBox35 ~= nil then self.comboBox35:destroy(); self.comboBox35 = nil; end;
        if self.label307 ~= nil then self.label307:destroy(); self.label307 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.rectangle262 ~= nil then self.rectangle262:destroy(); self.rectangle262 = nil; end;
        if self.label340 ~= nil then self.label340:destroy(); self.label340 = nil; end;
        if self.rectangle238 ~= nil then self.rectangle238:destroy(); self.rectangle238 = nil; end;
        if self.rectangle243 ~= nil then self.rectangle243:destroy(); self.rectangle243 = nil; end;
        if self.caArmaduraLabel ~= nil then self.caArmaduraLabel:destroy(); self.caArmaduraLabel = nil; end;
        if self.pontoFocoEdit ~= nil then self.pontoFocoEdit:destroy(); self.pontoFocoEdit = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.volumeAtualLabel ~= nil then self.volumeAtualLabel:destroy(); self.volumeAtualLabel = nil; end;
        if self.rectangle211 ~= nil then self.rectangle211:destroy(); self.rectangle211 = nil; end;
        if self.label372 ~= nil then self.label372:destroy(); self.label372 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label261 ~= nil then self.label261:destroy(); self.label261 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.LadroagemOutrosLabel ~= nil then self.LadroagemOutrosLabel:destroy(); self.LadroagemOutrosLabel = nil; end;
        if self.rectangle245 ~= nil then self.rectangle245:destroy(); self.rectangle245 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label378 ~= nil then self.label378:destroy(); self.label378 = nil; end;
        if self.velocidadeLabel ~= nil then self.velocidadeLabel:destroy(); self.velocidadeLabel = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label381 ~= nil then self.label381:destroy(); self.label381 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.pecaCobreLabel ~= nil then self.pecaCobreLabel:destroy(); self.pecaCobreLabel = nil; end;
        if self.label284 ~= nil then self.label284:destroy(); self.label284 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.rectangle156 ~= nil then self.rectangle156:destroy(); self.rectangle156 = nil; end;
        if self.DissimulacaoOutrosLabel ~= nil then self.DissimulacaoOutrosLabel:destroy(); self.DissimulacaoOutrosLabel = nil; end;
        if self.classeEdit ~= nil then self.classeEdit:destroy(); self.classeEdit = nil; end;
        if self.rectangle217 ~= nil then self.rectangle217:destroy(); self.rectangle217 = nil; end;
        if self.FurtividadeOutrosEdit ~= nil then self.FurtividadeOutrosEdit:destroy(); self.FurtividadeOutrosEdit = nil; end;
        if self.label324 ~= nil then self.label324:destroy(); self.label324 = nil; end;
        if self.label332 ~= nil then self.label332:destroy(); self.label332 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.SabBioEdit ~= nil then self.SabBioEdit:destroy(); self.SabBioEdit = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.rectangle279 ~= nil then self.rectangle279:destroy(); self.rectangle279 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.label278 ~= nil then self.label278:destroy(); self.label278 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.outrosClasseLabel ~= nil then self.outrosClasseLabel:destroy(); self.outrosClasseLabel = nil; end;
        if self.label334 ~= nil then self.label334:destroy(); self.label334 = nil; end;
        if self.usadosSlot4Label ~= nil then self.usadosSlot4Label:destroy(); self.usadosSlot4Label = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label335 ~= nil then self.label335:destroy(); self.label335 = nil; end;
        if self.rectangle261 ~= nil then self.rectangle261:destroy(); self.rectangle261 = nil; end;
        if self.rectangle203 ~= nil then self.rectangle203:destroy(); self.rectangle203 = nil; end;
        if self.label263 ~= nil then self.label263:destroy(); self.label263 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label375 ~= nil then self.label375:destroy(); self.label375 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.tendenciaEdit ~= nil then self.tendenciaEdit:destroy(); self.tendenciaEdit = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label382 ~= nil then self.label382:destroy(); self.label382 = nil; end;
        if self.label323 ~= nil then self.label323:destroy(); self.label323 = nil; end;
        if self.PerformanceOutrosEdit ~= nil then self.PerformanceOutrosEdit:destroy(); self.PerformanceOutrosEdit = nil; end;
        if self.idiomasLabel ~= nil then self.idiomasLabel:destroy(); self.idiomasLabel = nil; end;
        if self.imageCheckBox12 ~= nil then self.imageCheckBox12:destroy(); self.imageCheckBox12 = nil; end;
        if self.rectangle244 ~= nil then self.rectangle244:destroy(); self.rectangle244 = nil; end;
        if self.pvTempLabel ~= nil then self.pvTempLabel:destroy(); self.pvTempLabel = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.label315 ~= nil then self.label315:destroy(); self.label315 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.imageCheckBox8 ~= nil then self.imageCheckBox8:destroy(); self.imageCheckBox8 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.MedicinaOutrosLabel ~= nil then self.MedicinaOutrosLabel:destroy(); self.MedicinaOutrosLabel = nil; end;
        if self.label306 ~= nil then self.label306:destroy(); self.label306 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.ReligiaoOutrosLabel ~= nil then self.ReligiaoOutrosLabel:destroy(); self.ReligiaoOutrosLabel = nil; end;
        if self.label347 ~= nil then self.label347:destroy(); self.label347 = nil; end;
        if self.sexoEdit ~= nil then self.sexoEdit:destroy(); self.sexoEdit = nil; end;
        if self.divindadeLabel ~= nil then self.divindadeLabel:destroy(); self.divindadeLabel = nil; end;
        if self.usadosSlot7Edit ~= nil then self.usadosSlot7Edit:destroy(); self.usadosSlot7Edit = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.pecaCobreEdit ~= nil then self.pecaCobreEdit:destroy(); self.pecaCobreEdit = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.outrosClasseEdit ~= nil then self.outrosClasseEdit:destroy(); self.outrosClasseEdit = nil; end;
        if self.caEscudoLQEdit ~= nil then self.caEscudoLQEdit:destroy(); self.caEscudoLQEdit = nil; end;
        if self.imageCheckBox7 ~= nil then self.imageCheckBox7:destroy(); self.imageCheckBox7 = nil; end;
        if self.label254 ~= nil then self.label254:destroy(); self.label254 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.maxSlot1Label ~= nil then self.maxSlot1Label:destroy(); self.maxSlot1Label = nil; end;
        if self.label355 ~= nil then self.label355:destroy(); self.label355 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle266 ~= nil then self.rectangle266:destroy(); self.rectangle266 = nil; end;
        if self.rectangle158 ~= nil then self.rectangle158:destroy(); self.rectangle158 = nil; end;
        if self.label248 ~= nil then self.label248:destroy(); self.label248 = nil; end;
        if self.rclTruquesMagicos ~= nil then self.rclTruquesMagicos:destroy(); self.rclTruquesMagicos = nil; end;
        if self.anotacoesLabel ~= nil then self.anotacoesLabel:destroy(); self.anotacoesLabel = nil; end;
        if self.IntBaseLabel ~= nil then self.IntBaseLabel:destroy(); self.IntBaseLabel = nil; end;
        if self.maxSlot6Edit ~= nil then self.maxSlot6Edit:destroy(); self.maxSlot6Edit = nil; end;
        if self.popDeath ~= nil then self.popDeath:destroy(); self.popDeath = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label273 ~= nil then self.label273:destroy(); self.label273 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.label325 ~= nil then self.label325:destroy(); self.label325 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.rectangle277 ~= nil then self.rectangle277:destroy(); self.rectangle277 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle195 ~= nil then self.rectangle195:destroy(); self.rectangle195 = nil; end;
        if self.label361 ~= nil then self.label361:destroy(); self.label361 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.AtletismoOutrosLabel ~= nil then self.AtletismoOutrosLabel:destroy(); self.AtletismoOutrosLabel = nil; end;
        if self.NaturezaOutrosLabel ~= nil then self.NaturezaOutrosLabel:destroy(); self.NaturezaOutrosLabel = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.rectangle257 ~= nil then self.rectangle257:destroy(); self.rectangle257 = nil; end;
        if self.SabNivelLabel ~= nil then self.SabNivelLabel:destroy(); self.SabNivelLabel = nil; end;
        if self.rectangle209 ~= nil then self.rectangle209:destroy(); self.rectangle209 = nil; end;
        if self.DesClasseLabel ~= nil then self.DesClasseLabel:destroy(); self.DesClasseLabel = nil; end;
        if self.talDescEdit ~= nil then self.talDescEdit:destroy(); self.talDescEdit = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.pvAncestralidadeEdit ~= nil then self.pvAncestralidadeEdit:destroy(); self.pvAncestralidadeEdit = nil; end;
        if self.label380 ~= nil then self.label380:destroy(); self.label380 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.label330 ~= nil then self.label330:destroy(); self.label330 = nil; end;
        if self.ConBaseLabel ~= nil then self.ConBaseLabel:destroy(); self.ConBaseLabel = nil; end;
        if self.talentos ~= nil then self.talentos:destroy(); self.talentos = nil; end;
        if self.label339 ~= nil then self.label339:destroy(); self.label339 = nil; end;
        if self.talAcoesEdit ~= nil then self.talAcoesEdit:destroy(); self.talAcoesEdit = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.rectangle250 ~= nil then self.rectangle250:destroy(); self.rectangle250 = nil; end;
        if self.imageCheckBox10 ~= nil then self.imageCheckBox10:destroy(); self.imageCheckBox10 = nil; end;
        if self.label336 ~= nil then self.label336:destroy(); self.label336 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.ForClasseEdit ~= nil then self.ForClasseEdit:destroy(); self.ForClasseEdit = nil; end;
        if self.racaEdit ~= nil then self.racaEdit:destroy(); self.racaEdit = nil; end;
        if self.pecaPrataLabel ~= nil then self.pecaPrataLabel:destroy(); self.pecaPrataLabel = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label317 ~= nil then self.label317:destroy(); self.label317 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.rectangle223 ~= nil then self.rectangle223:destroy(); self.rectangle223 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.pecaPrataEdit ~= nil then self.pecaPrataEdit:destroy(); self.pecaPrataEdit = nil; end;
        if self.nomeGolpeLabel ~= nil then self.nomeGolpeLabel:destroy(); self.nomeGolpeLabel = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.rectangle162 ~= nil then self.rectangle162:destroy(); self.rectangle162 = nil; end;
        if self.rectangle175 ~= nil then self.rectangle175:destroy(); self.rectangle175 = nil; end;
        if self.rectangle187 ~= nil then self.rectangle187:destroy(); self.rectangle187 = nil; end;
        if self.label333 ~= nil then self.label333:destroy(); self.label333 = nil; end;
        if self.IntNivelEdit ~= nil then self.IntNivelEdit:destroy(); self.IntNivelEdit = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.SobrevivenciaOutrosLabel ~= nil then self.SobrevivenciaOutrosLabel:destroy(); self.SobrevivenciaOutrosLabel = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.resistenciasEdit ~= nil then self.resistenciasEdit:destroy(); self.resistenciasEdit = nil; end;
        if self.rectangle197 ~= nil then self.rectangle197:destroy(); self.rectangle197 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.label341 ~= nil then self.label341:destroy(); self.label341 = nil; end;
        if self.rectangle286 ~= nil then self.rectangle286:destroy(); self.rectangle286 = nil; end;
        if self.rectangle213 ~= nil then self.rectangle213:destroy(); self.rectangle213 = nil; end;
        if self.rectangle189 ~= nil then self.rectangle189:destroy(); self.rectangle189 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.label304 ~= nil then self.label304:destroy(); self.label304 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.SabBaseLabel ~= nil then self.SabBaseLabel:destroy(); self.SabBaseLabel = nil; end;
        if self.CarBaseEdit ~= nil then self.CarBaseEdit:destroy(); self.CarBaseEdit = nil; end;
        if self.rclTalClasse ~= nil then self.rclTalClasse:destroy(); self.rclTalClasse = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle199 ~= nil then self.rectangle199:destroy(); self.rectangle199 = nil; end;
        if self.label280 ~= nil then self.label280:destroy(); self.label280 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle229 ~= nil then self.rectangle229:destroy(); self.rectangle229 = nil; end;
        if self.rectangle281 ~= nil then self.rectangle281:destroy(); self.rectangle281 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle182 ~= nil then self.rectangle182:destroy(); self.rectangle182 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.acaoTracosEdit ~= nil then self.acaoTracosEdit:destroy(); self.acaoTracosEdit = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label357 ~= nil then self.label357:destroy(); self.label357 = nil; end;
        if self.rectangle146 ~= nil then self.rectangle146:destroy(); self.rectangle146 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.SabRacaLabel ~= nil then self.SabRacaLabel:destroy(); self.SabRacaLabel = nil; end;
        if self.label298 ~= nil then self.label298:destroy(); self.label298 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.label281 ~= nil then self.label281:destroy(); self.label281 = nil; end;
        if self.label365 ~= nil then self.label365:destroy(); self.label365 = nil; end;
        if self.rectangle264 ~= nil then self.rectangle264:destroy(); self.rectangle264 = nil; end;
        if self.rectangle206 ~= nil then self.rectangle206:destroy(); self.rectangle206 = nil; end;
        if self.rclClasses ~= nil then self.rclClasses:destroy(); self.rclClasses = nil; end;
        if self.SabOutrosEdit ~= nil then self.SabOutrosEdit:destroy(); self.SabOutrosEdit = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle191 ~= nil then self.rectangle191:destroy(); self.rectangle191 = nil; end;
        if self.outrosMaximoLabel ~= nil then self.outrosMaximoLabel:destroy(); self.outrosMaximoLabel = nil; end;
        if self.SabClasseLabel ~= nil then self.SabClasseLabel:destroy(); self.SabClasseLabel = nil; end;
        if self.label262 ~= nil then self.label262:destroy(); self.label262 = nil; end;
        if self.maxSlot7Edit ~= nil then self.maxSlot7Edit:destroy(); self.maxSlot7Edit = nil; end;
        if self.caOutrosLabel ~= nil then self.caOutrosLabel:destroy(); self.caOutrosLabel = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.maxSlot8Edit ~= nil then self.maxSlot8Edit:destroy(); self.maxSlot8Edit = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle200 ~= nil then self.rectangle200:destroy(); self.rectangle200 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.RefOutrosEdit ~= nil then self.RefOutrosEdit:destroy(); self.RefOutrosEdit = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.penalidadeLabel ~= nil then self.penalidadeLabel:destroy(); self.penalidadeLabel = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.acaoDescLabel ~= nil then self.acaoDescLabel:destroy(); self.acaoDescLabel = nil; end;
        if self.DissimulacaoOutrosEdit ~= nil then self.DissimulacaoOutrosEdit:destroy(); self.DissimulacaoOutrosEdit = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.rectangle137 ~= nil then self.rectangle137:destroy(); self.rectangle137 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.ConBioEdit ~= nil then self.ConBioEdit:destroy(); self.ConBioEdit = nil; end;
        if self.rectangle150 ~= nil then self.rectangle150:destroy(); self.rectangle150 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.caEscudoPVEdit ~= nil then self.caEscudoPVEdit:destroy(); self.caEscudoPVEdit = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.biografiaEdit ~= nil then self.biografiaEdit:destroy(); self.biografiaEdit = nil; end;
        if self.rectangle207 ~= nil then self.rectangle207:destroy(); self.rectangle207 = nil; end;
        if self.rectangle219 ~= nil then self.rectangle219:destroy(); self.rectangle219 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.label275 ~= nil then self.label275:destroy(); self.label275 = nil; end;
        if self.label362 ~= nil then self.label362:destroy(); self.label362 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.usadosSlot2Edit ~= nil then self.usadosSlot2Edit:destroy(); self.usadosSlot2Edit = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.rectangle205 ~= nil then self.rectangle205:destroy(); self.rectangle205 = nil; end;
        if self.nomeEdit ~= nil then self.nomeEdit:destroy(); self.nomeEdit = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle193 ~= nil then self.rectangle193:destroy(); self.rectangle193 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.outrosSobrecargaEdit ~= nil then self.outrosSobrecargaEdit:destroy(); self.outrosSobrecargaEdit = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.label301 ~= nil then self.label301:destroy(); self.label301 = nil; end;
        if self.DesBioLabel ~= nil then self.DesBioLabel:destroy(); self.DesBioLabel = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle183 ~= nil then self.rectangle183:destroy(); self.rectangle183 = nil; end;
        if self.rectangle140 ~= nil then self.rectangle140:destroy(); self.rectangle140 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.rclTalBonus ~= nil then self.rclTalBonus:destroy(); self.rclTalBonus = nil; end;
        if self.rectangle147 ~= nil then self.rectangle147:destroy(); self.rectangle147 = nil; end;
        if self.CarBioLabel ~= nil then self.CarBioLabel:destroy(); self.CarBioLabel = nil; end;
        if self.rectangle246 ~= nil then self.rectangle246:destroy(); self.rectangle246 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.DesBaseEdit ~= nil then self.DesBaseEdit:destroy(); self.DesBaseEdit = nil; end;
        if self.label253 ~= nil then self.label253:destroy(); self.label253 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.IntimidacaoOutrosEdit ~= nil then self.IntimidacaoOutrosEdit:destroy(); self.IntimidacaoOutrosEdit = nil; end;
        if self.rectangle230 ~= nil then self.rectangle230:destroy(); self.rectangle230 = nil; end;
        if self.LadroagemOutrosEdit ~= nil then self.LadroagemOutrosEdit:destroy(); self.LadroagemOutrosEdit = nil; end;
        if self.label289 ~= nil then self.label289:destroy(); self.label289 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.ForOutrosLabel ~= nil then self.ForOutrosLabel:destroy(); self.ForOutrosLabel = nil; end;
        if self.movimentosEdit ~= nil then self.movimentosEdit:destroy(); self.movimentosEdit = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.PerOutrosLabel ~= nil then self.PerOutrosLabel:destroy(); self.PerOutrosLabel = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.acaoTracosLabel ~= nil then self.acaoTracosLabel:destroy(); self.acaoTracosLabel = nil; end;
        if self.racaLabel ~= nil then self.racaLabel:destroy(); self.racaLabel = nil; end;
        if self.nomeClasseLabel ~= nil then self.nomeClasseLabel:destroy(); self.nomeClasseLabel = nil; end;
        if self.SabRacaEdit ~= nil then self.SabRacaEdit:destroy(); self.SabRacaEdit = nil; end;
        if self.CarBaseLabel ~= nil then self.CarBaseLabel:destroy(); self.CarBaseLabel = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.CarBioEdit ~= nil then self.CarBioEdit:destroy(); self.CarBioEdit = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label259 ~= nil then self.label259:destroy(); self.label259 = nil; end;
        if self.rectangle224 ~= nil then self.rectangle224:destroy(); self.rectangle224 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.rectangle255 ~= nil then self.rectangle255:destroy(); self.rectangle255 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.label379 ~= nil then self.label379:destroy(); self.label379 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rectangle226 ~= nil then self.rectangle226:destroy(); self.rectangle226 = nil; end;
        if self.imageCheckBox9 ~= nil then self.imageCheckBox9:destroy(); self.imageCheckBox9 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label267 ~= nil then self.label267:destroy(); self.label267 = nil; end;
        if self.label283 ~= nil then self.label283:destroy(); self.label283 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle159 ~= nil then self.rectangle159:destroy(); self.rectangle159 = nil; end;
        if self.IntRacaLabel ~= nil then self.IntRacaLabel:destroy(); self.IntRacaLabel = nil; end;
        if self.RefOutrosLabel ~= nil then self.RefOutrosLabel:destroy(); self.RefOutrosLabel = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.historiaEdit ~= nil then self.historiaEdit:destroy(); self.historiaEdit = nil; end;
        if self.rectangle164 ~= nil then self.rectangle164:destroy(); self.rectangle164 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.rectangle285 ~= nil then self.rectangle285:destroy(); self.rectangle285 = nil; end;
        if self.label345 ~= nil then self.label345:destroy(); self.label345 = nil; end;
        if self.IntNivelLabel ~= nil then self.IntNivelLabel:destroy(); self.IntNivelLabel = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.tendenciaLabel ~= nil then self.tendenciaLabel:destroy(); self.tendenciaLabel = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.rectangle220 ~= nil then self.rectangle220:destroy(); self.rectangle220 = nil; end;
        if self.pontoFocoLabel ~= nil then self.pontoFocoLabel:destroy(); self.pontoFocoLabel = nil; end;
        if self.label318 ~= nil then self.label318:destroy(); self.label318 = nil; end;
        if self.rectangle259 ~= nil then self.rectangle259:destroy(); self.rectangle259 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.caEscudoLQLabel ~= nil then self.caEscudoLQLabel:destroy(); self.caEscudoLQLabel = nil; end;
        if self.OcultismoOutrosLabel ~= nil then self.OcultismoOutrosLabel:destroy(); self.OcultismoOutrosLabel = nil; end;
        if self.label255 ~= nil then self.label255:destroy(); self.label255 = nil; end;
        if self.rectangle256 ~= nil then self.rectangle256:destroy(); self.rectangle256 = nil; end;
        if self.label252 ~= nil then self.label252:destroy(); self.label252 = nil; end;
        if self.IntClasseEdit ~= nil then self.IntClasseEdit:destroy(); self.IntClasseEdit = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label303 ~= nil then self.label303:destroy(); self.label303 = nil; end;
        if self.nomeLabel ~= nil then self.nomeLabel:destroy(); self.nomeLabel = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.caArmaduraEdit ~= nil then self.caArmaduraEdit:destroy(); self.caArmaduraEdit = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.usadosSlot2Label ~= nil then self.usadosSlot2Label:destroy(); self.usadosSlot2Label = nil; end;
        if self.SabNivelEdit ~= nil then self.SabNivelEdit:destroy(); self.SabNivelEdit = nil; end;
        if self.rectangle280 ~= nil then self.rectangle280:destroy(); self.rectangle280 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.label374 ~= nil then self.label374:destroy(); self.label374 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.label344 ~= nil then self.label344:destroy(); self.label344 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.CarRacaLabel ~= nil then self.CarRacaLabel:destroy(); self.CarRacaLabel = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.CarClasseLabel ~= nil then self.CarClasseLabel:destroy(); self.CarClasseLabel = nil; end;
        if self.rclTalAncestralidade ~= nil then self.rclTalAncestralidade:destroy(); self.rclTalAncestralidade = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.DiplomaciaOutrosEdit ~= nil then self.DiplomaciaOutrosEdit:destroy(); self.DiplomaciaOutrosEdit = nil; end;
        if self.maxSlot9Edit ~= nil then self.maxSlot9Edit:destroy(); self.maxSlot9Edit = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.rectangle152 ~= nil then self.rectangle152:destroy(); self.rectangle152 = nil; end;
        if self.rectangle214 ~= nil then self.rectangle214:destroy(); self.rectangle214 = nil; end;
        if self.nomeGolpeEdit ~= nil then self.nomeGolpeEdit:destroy(); self.nomeGolpeEdit = nil; end;
        if self.rectangle283 ~= nil then self.rectangle283:destroy(); self.rectangle283 = nil; end;
        if self.popAcaoInfo ~= nil then self.popAcaoInfo:destroy(); self.popAcaoInfo = nil; end;
        if self.tracosEdit ~= nil then self.tracosEdit:destroy(); self.tracosEdit = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.rectangle252 ~= nil then self.rectangle252:destroy(); self.rectangle252 = nil; end;
        if self.tracosLabel ~= nil then self.tracosLabel:destroy(); self.tracosLabel = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.caLimitEdit ~= nil then self.caLimitEdit:destroy(); self.caLimitEdit = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rclImagem ~= nil then self.rclImagem:destroy(); self.rclImagem = nil; end;
        if self.CarOutrosLabel ~= nil then self.CarOutrosLabel:destroy(); self.CarOutrosLabel = nil; end;
        if self.magiaAcaoLabel ~= nil then self.magiaAcaoLabel:destroy(); self.magiaAcaoLabel = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.label353 ~= nil then self.label353:destroy(); self.label353 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.popTalentoInfo ~= nil then self.popTalentoInfo:destroy(); self.popTalentoInfo = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle154 ~= nil then self.rectangle154:destroy(); self.rectangle154 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.rectangle160 ~= nil then self.rectangle160:destroy(); self.rectangle160 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle178 ~= nil then self.rectangle178:destroy(); self.rectangle178 = nil; end;
        if self.label300 ~= nil then self.label300:destroy(); self.label300 = nil; end;
        if self.label384 ~= nil then self.label384:destroy(); self.label384 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label286 ~= nil then self.label286:destroy(); self.label286 = nil; end;
        if self.DesNivelEdit ~= nil then self.DesNivelEdit:destroy(); self.DesNivelEdit = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label356 ~= nil then self.label356:destroy(); self.label356 = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.label383 ~= nil then self.label383:destroy(); self.label383 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.sentidosEdit ~= nil then self.sentidosEdit:destroy(); self.sentidosEdit = nil; end;
        if self.outrosGolpeLabel ~= nil then self.outrosGolpeLabel:destroy(); self.outrosGolpeLabel = nil; end;
        if self.ConBaseEdit ~= nil then self.ConBaseEdit:destroy(); self.ConBaseEdit = nil; end;
        if self.label290 ~= nil then self.label290:destroy(); self.label290 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.historiaLabel ~= nil then self.historiaLabel:destroy(); self.historiaLabel = nil; end;
        if self.label265 ~= nil then self.label265:destroy(); self.label265 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label251 ~= nil then self.label251:destroy(); self.label251 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.imageCheckBox18 ~= nil then self.imageCheckBox18:destroy(); self.imageCheckBox18 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.SobrevivenciaOutrosEdit ~= nil then self.SobrevivenciaOutrosEdit:destroy(); self.SobrevivenciaOutrosEdit = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.rectangle210 ~= nil then self.rectangle210:destroy(); self.rectangle210 = nil; end;
        if self.magiaAcaoEdit ~= nil then self.magiaAcaoEdit:destroy(); self.magiaAcaoEdit = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.usadosSlot5Label ~= nil then self.usadosSlot5Label:destroy(); self.usadosSlot5Label = nil; end;
        if self.ConBioLabel ~= nil then self.ConBioLabel:destroy(); self.ConBioLabel = nil; end;
        if self.label308 ~= nil then self.label308:destroy(); self.label308 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.rectangle151 ~= nil then self.rectangle151:destroy(); self.rectangle151 = nil; end;
        if self.rectangle177 ~= nil then self.rectangle177:destroy(); self.rectangle177 = nil; end;
        if self.rectangle161 ~= nil then self.rectangle161:destroy(); self.rectangle161 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.DesOutrosLabel ~= nil then self.DesOutrosLabel:destroy(); self.DesOutrosLabel = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.label314 ~= nil then self.label314:destroy(); self.label314 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label250 ~= nil then self.label250:destroy(); self.label250 = nil; end;
        if self.popItem ~= nil then self.popItem:destroy(); self.popItem = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.ForNivelEdit ~= nil then self.ForNivelEdit:destroy(); self.ForNivelEdit = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label266 ~= nil then self.label266:destroy(); self.label266 = nil; end;
        if self.label282 ~= nil then self.label282:destroy(); self.label282 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.maxSlot4Label ~= nil then self.maxSlot4Label:destroy(); self.maxSlot4Label = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.imageCheckBox16 ~= nil then self.imageCheckBox16:destroy(); self.imageCheckBox16 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.pvClasseLabel ~= nil then self.pvClasseLabel:destroy(); self.pvClasseLabel = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.caDurezaLabel ~= nil then self.caDurezaLabel:destroy(); self.caDurezaLabel = nil; end;
        if self.label291 ~= nil then self.label291:destroy(); self.label291 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.sentidosLabel ~= nil then self.sentidosLabel:destroy(); self.sentidosLabel = nil; end;
        if self.rectangle254 ~= nil then self.rectangle254:destroy(); self.rectangle254 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.label322 ~= nil then self.label322:destroy(); self.label322 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.rectangle258 ~= nil then self.rectangle258:destroy(); self.rectangle258 = nil; end;
        if self.nomeSaberLabel ~= nil then self.nomeSaberLabel:destroy(); self.nomeSaberLabel = nil; end;
        if self.ManufaturaOutrosEdit ~= nil then self.ManufaturaOutrosEdit:destroy(); self.ManufaturaOutrosEdit = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.IntBaseEdit ~= nil then self.IntBaseEdit:destroy(); self.IntBaseEdit = nil; end;
        if self.herancaLabel ~= nil then self.herancaLabel:destroy(); self.herancaLabel = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.nomeSaberEdit ~= nil then self.nomeSaberEdit:destroy(); self.nomeSaberEdit = nil; end;
        if self.rectangle271 ~= nil then self.rectangle271:destroy(); self.rectangle271 = nil; end;
        if self.comboBox34 ~= nil then self.comboBox34:destroy(); self.comboBox34 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.imageCheckBox11 ~= nil then self.imageCheckBox11:destroy(); self.imageCheckBox11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.nomeClasseEdit ~= nil then self.nomeClasseEdit:destroy(); self.nomeClasseEdit = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.caTotalLabel ~= nil then self.caTotalLabel:destroy(); self.caTotalLabel = nil; end;
        if self.label260 ~= nil then self.label260:destroy(); self.label260 = nil; end;
        if self.label276 ~= nil then self.label276:destroy(); self.label276 = nil; end;
        if self.info ~= nil then self.info:destroy(); self.info = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.danoGolpeEdit ~= nil then self.danoGolpeEdit:destroy(); self.danoGolpeEdit = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.rectangle144 ~= nil then self.rectangle144:destroy(); self.rectangle144 = nil; end;
        if self.label256 ~= nil then self.label256:destroy(); self.label256 = nil; end;
        if self.FortOutrosEdit ~= nil then self.FortOutrosEdit:destroy(); self.FortOutrosEdit = nil; end;
        if self.label299 ~= nil then self.label299:destroy(); self.label299 = nil; end;
        if self.rectangle190 ~= nil then self.rectangle190:destroy(); self.rectangle190 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.rectangle194 ~= nil then self.rectangle194:destroy(); self.rectangle194 = nil; end;
        if self.ForBioEdit ~= nil then self.ForBioEdit:destroy(); self.ForBioEdit = nil; end;
        if self.talDescLabel ~= nil then self.talDescLabel:destroy(); self.talDescLabel = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.rectangle234 ~= nil then self.rectangle234:destroy(); self.rectangle234 = nil; end;
        if self.label350 ~= nil then self.label350:destroy(); self.label350 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.descItemLabel ~= nil then self.descItemLabel:destroy(); self.descItemLabel = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.nivelTruqueLabel ~= nil then self.nivelTruqueLabel:destroy(); self.nivelTruqueLabel = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label351 ~= nil then self.label351:destroy(); self.label351 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label328 ~= nil then self.label328:destroy(); self.label328 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.ForRacaLabel ~= nil then self.ForRacaLabel:destroy(); self.ForRacaLabel = nil; end;
        if self.nivelLabel ~= nil then self.nivelLabel:destroy(); self.nivelLabel = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.rectangle149 ~= nil then self.rectangle149:destroy(); self.rectangle149 = nil; end;
        if self.IntOutrosEdit ~= nil then self.IntOutrosEdit:destroy(); self.IntOutrosEdit = nil; end;
        if self.IntBioEdit ~= nil then self.IntBioEdit:destroy(); self.IntBioEdit = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle172 ~= nil then self.rectangle172:destroy(); self.rectangle172 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.rectangle251 ~= nil then self.rectangle251:destroy(); self.rectangle251 = nil; end;
        if self.nivelEdit ~= nil then self.nivelEdit:destroy(); self.nivelEdit = nil; end;
        if self.label319 ~= nil then self.label319:destroy(); self.label319 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.popInfoMagia ~= nil then self.popInfoMagia:destroy(); self.popInfoMagia = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.rectangle153 ~= nil then self.rectangle153:destroy(); self.rectangle153 = nil; end;
        if self.rclMagiasPreparadas ~= nil then self.rclMagiasPreparadas:destroy(); self.rclMagiasPreparadas = nil; end;
        if self.label359 ~= nil then self.label359:destroy(); self.label359 = nil; end;
        if self.rectangle273 ~= nil then self.rectangle273:destroy(); self.rectangle273 = nil; end;
        if self.label364 ~= nil then self.label364:destroy(); self.label364 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.divindadeEdit ~= nil then self.divindadeEdit:destroy(); self.divindadeEdit = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.herancaEdit ~= nil then self.herancaEdit:destroy(); self.herancaEdit = nil; end;
        if self.talTracosEdit ~= nil then self.talTracosEdit:destroy(); self.talTracosEdit = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.rectangle222 ~= nil then self.rectangle222:destroy(); self.rectangle222 = nil; end;
        if self.outrosSaberEdit ~= nil then self.outrosSaberEdit:destroy(); self.outrosSaberEdit = nil; end;
        if self.label348 ~= nil then self.label348:destroy(); self.label348 = nil; end;
        if self.CarRacaEdit ~= nil then self.CarRacaEdit:destroy(); self.CarRacaEdit = nil; end;
        if self.rclTalPericias ~= nil then self.rclTalPericias:destroy(); self.rclTalPericias = nil; end;
        if self.label288 ~= nil then self.label288:destroy(); self.label288 = nil; end;
        if self.label302 ~= nil then self.label302:destroy(); self.label302 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.idadeLabel ~= nil then self.idadeLabel:destroy(); self.idadeLabel = nil; end;
        if self.rectangle202 ~= nil then self.rectangle202:destroy(); self.rectangle202 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.rectangle263 ~= nil then self.rectangle263:destroy(); self.rectangle263 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.pecaPlatinaEdit ~= nil then self.pecaPlatinaEdit:destroy(); self.pecaPlatinaEdit = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.rectangle143 ~= nil then self.rectangle143:destroy(); self.rectangle143 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.ForNivelLabel ~= nil then self.ForNivelLabel:destroy(); self.ForNivelLabel = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.rectangle218 ~= nil then self.rectangle218:destroy(); self.rectangle218 = nil; end;
        if self.acionamentoLabel ~= nil then self.acionamentoLabel:destroy(); self.acionamentoLabel = nil; end;
        if self.label321 ~= nil then self.label321:destroy(); self.label321 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.rectangle168 ~= nil then self.rectangle168:destroy(); self.rectangle168 = nil; end;
        if self.label366 ~= nil then self.label366:destroy(); self.label366 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.ConRacaEdit ~= nil then self.ConRacaEdit:destroy(); self.ConRacaEdit = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.CarOutrosEdit ~= nil then self.CarOutrosEdit:destroy(); self.CarOutrosEdit = nil; end;
        if self.imageCheckBox17 ~= nil then self.imageCheckBox17:destroy(); self.imageCheckBox17 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.rectangle155 ~= nil then self.rectangle155:destroy(); self.rectangle155 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.maxSlot2Label ~= nil then self.maxSlot2Label:destroy(); self.maxSlot2Label = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.idiomasEdit ~= nil then self.idiomasEdit:destroy(); self.idiomasEdit = nil; end;
        if self.rectangle249 ~= nil then self.rectangle249:destroy(); self.rectangle249 = nil; end;
        if self.label268 ~= nil then self.label268:destroy(); self.label268 = nil; end;
        if self.volumeAtualEdit ~= nil then self.volumeAtualEdit:destroy(); self.volumeAtualEdit = nil; end;
        if self.pvTotalLabel ~= nil then self.pvTotalLabel:destroy(); self.pvTotalLabel = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.rectangle145 ~= nil then self.rectangle145:destroy(); self.rectangle145 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle180 ~= nil then self.rectangle180:destroy(); self.rectangle180 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.label376 ~= nil then self.label376:destroy(); self.label376 = nil; end;
        if self.rectangle171 ~= nil then self.rectangle171:destroy(); self.rectangle171 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.ForBaseEdit ~= nil then self.ForBaseEdit:destroy(); self.ForBaseEdit = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label269 ~= nil then self.label269:destroy(); self.label269 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.imageCheckBox15 ~= nil then self.imageCheckBox15:destroy(); self.imageCheckBox15 = nil; end;
        if self.rectangle221 ~= nil then self.rectangle221:destroy(); self.rectangle221 = nil; end;
        if self.DesBioEdit ~= nil then self.DesBioEdit:destroy(); self.DesBioEdit = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.label271 ~= nil then self.label271:destroy(); self.label271 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.usadosSlot6Edit ~= nil then self.usadosSlot6Edit:destroy(); self.usadosSlot6Edit = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.rectangle174 ~= nil then self.rectangle174:destroy(); self.rectangle174 = nil; end;
        if self.rectangle247 ~= nil then self.rectangle247:destroy(); self.rectangle247 = nil; end;
        if self.condicoesEdit ~= nil then self.condicoesEdit:destroy(); self.condicoesEdit = nil; end;
        if self.label377 ~= nil then self.label377:destroy(); self.label377 = nil; end;
        if self.pvAncestralidadeLabel ~= nil then self.pvAncestralidadeLabel:destroy(); self.pvAncestralidadeLabel = nil; end;
        if self.rectangle173 ~= nil then self.rectangle173:destroy(); self.rectangle173 = nil; end;
        if self.label305 ~= nil then self.label305:destroy(); self.label305 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.rectangle235 ~= nil then self.rectangle235:destroy(); self.rectangle235 = nil; end;
        if self.IntClasseLabel ~= nil then self.IntClasseLabel:destroy(); self.IntClasseLabel = nil; end;
        if self.acionamentoEdit ~= nil then self.acionamentoEdit:destroy(); self.acionamentoEdit = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.FurtividadeOutrosLabel ~= nil then self.FurtividadeOutrosLabel:destroy(); self.FurtividadeOutrosLabel = nil; end;
        if self.outrosGolpeEdit ~= nil then self.outrosGolpeEdit:destroy(); self.outrosGolpeEdit = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.maxSlot6Label ~= nil then self.maxSlot6Label:destroy(); self.maxSlot6Label = nil; end;
        if self.talTracosLabel ~= nil then self.talTracosLabel:destroy(); self.talTracosLabel = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.idadeEdit ~= nil then self.idadeEdit:destroy(); self.idadeEdit = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.label313 ~= nil then self.label313:destroy(); self.label313 = nil; end;
        if self.label358 ~= nil then self.label358:destroy(); self.label358 = nil; end;
        if self.magiaDescEdit ~= nil then self.magiaDescEdit:destroy(); self.magiaDescEdit = nil; end;
        if self.usadosSlot8Edit ~= nil then self.usadosSlot8Edit:destroy(); self.usadosSlot8Edit = nil; end;
        if self.pecaPlatinaLabel ~= nil then self.pecaPlatinaLabel:destroy(); self.pecaPlatinaLabel = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.magiaDescLabel ~= nil then self.magiaDescLabel:destroy(); self.magiaDescLabel = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.rectangle170 ~= nil then self.rectangle170:destroy(); self.rectangle170 = nil; end;
        if self.label279 ~= nil then self.label279:destroy(); self.label279 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.DesClasseEdit ~= nil then self.DesClasseEdit:destroy(); self.DesClasseEdit = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.rectangle276 ~= nil then self.rectangle276:destroy(); self.rectangle276 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.rectangle185 ~= nil then self.rectangle185:destroy(); self.rectangle185 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.IntOutrosLabel ~= nil then self.IntOutrosLabel:destroy(); self.IntOutrosLabel = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.rectangle192 ~= nil then self.rectangle192:destroy(); self.rectangle192 = nil; end;
        if self.label295 ~= nil then self.label295:destroy(); self.label295 = nil; end;
        if self.rectangle184 ~= nil then self.rectangle184:destroy(); self.rectangle184 = nil; end;
        if self.rectangle242 ~= nil then self.rectangle242:destroy(); self.rectangle242 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.tamanhoLabel ~= nil then self.tamanhoLabel:destroy(); self.tamanhoLabel = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.usadosSlot1Label ~= nil then self.usadosSlot1Label:destroy(); self.usadosSlot1Label = nil; end;
        if self.rectangle274 ~= nil then self.rectangle274:destroy(); self.rectangle274 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.DesOutrosEdit ~= nil then self.DesOutrosEdit:destroy(); self.DesOutrosEdit = nil; end;
        if self.caOutrosEdit ~= nil then self.caOutrosEdit:destroy(); self.caOutrosEdit = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.rectangle157 ~= nil then self.rectangle157:destroy(); self.rectangle157 = nil; end;
        if self.maxSlot9Label ~= nil then self.maxSlot9Label:destroy(); self.maxSlot9Label = nil; end;
        if self.usadosSlot4Edit ~= nil then self.usadosSlot4Edit:destroy(); self.usadosSlot4Edit = nil; end;
        if self.label360 ~= nil then self.label360:destroy(); self.label360 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.NaturezaOutrosEdit ~= nil then self.NaturezaOutrosEdit:destroy(); self.NaturezaOutrosEdit = nil; end;
        if self.IntRacaEdit ~= nil then self.IntRacaEdit:destroy(); self.IntRacaEdit = nil; end;
        if self.origemLabel ~= nil then self.origemLabel:destroy(); self.origemLabel = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.pvOutroLabel ~= nil then self.pvOutroLabel:destroy(); self.pvOutroLabel = nil; end;
        if self.rectangle186 ~= nil then self.rectangle186:destroy(); self.rectangle186 = nil; end;
        if self.CarClasseEdit ~= nil then self.CarClasseEdit:destroy(); self.CarClasseEdit = nil; end;
        if self.pesoEdit ~= nil then self.pesoEdit:destroy(); self.pesoEdit = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.ConOutrosEdit ~= nil then self.ConOutrosEdit:destroy(); self.ConOutrosEdit = nil; end;
        if self.label342 ~= nil then self.label342:destroy(); self.label342 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.SociedadeOutrosEdit ~= nil then self.SociedadeOutrosEdit:destroy(); self.SociedadeOutrosEdit = nil; end;
        if self.usadosSlot7Label ~= nil then self.usadosSlot7Label:destroy(); self.usadosSlot7Label = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.ConNivelEdit ~= nil then self.ConNivelEdit:destroy(); self.ConNivelEdit = nil; end;
        if self.CarNivelLabel ~= nil then self.CarNivelLabel:destroy(); self.CarNivelLabel = nil; end;
        if self.label371 ~= nil then self.label371:destroy(); self.label371 = nil; end;
        if self.jogadorLabel ~= nil then self.jogadorLabel:destroy(); self.jogadorLabel = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.usadosSlot5Edit ~= nil then self.usadosSlot5Edit:destroy(); self.usadosSlot5Edit = nil; end;
        if self.PerformanceOutrosLabel ~= nil then self.PerformanceOutrosLabel:destroy(); self.PerformanceOutrosLabel = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.movimentosLabel ~= nil then self.movimentosLabel:destroy(); self.movimentosLabel = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.popTalentos ~= nil then self.popTalentos:destroy(); self.popTalentos = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.tamanhoEdit ~= nil then self.tamanhoEdit:destroy(); self.tamanhoEdit = nil; end;
        if self.maxSlot8Label ~= nil then self.maxSlot8Label:destroy(); self.maxSlot8Label = nil; end;
        if self.CarNivelEdit ~= nil then self.CarNivelEdit:destroy(); self.CarNivelEdit = nil; end;
        if self.resistenciasLabel ~= nil then self.resistenciasLabel:destroy(); self.resistenciasLabel = nil; end;
        if self.alturaEdit ~= nil then self.alturaEdit:destroy(); self.alturaEdit = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.rclAcoes ~= nil then self.rclAcoes:destroy(); self.rclAcoes = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.talAcoesLabel ~= nil then self.talAcoesLabel:destroy(); self.talAcoesLabel = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.velocidadeEdit ~= nil then self.velocidadeEdit:destroy(); self.velocidadeEdit = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.outrosMaximoEdit ~= nil then self.outrosMaximoEdit:destroy(); self.outrosMaximoEdit = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.label285 ~= nil then self.label285:destroy(); self.label285 = nil; end;
        if self.label309 ~= nil then self.label309:destroy(); self.label309 = nil; end;
        if self.rectangle239 ~= nil then self.rectangle239:destroy(); self.rectangle239 = nil; end;
        if self.rectangle275 ~= nil then self.rectangle275:destroy(); self.rectangle275 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.origemEdit ~= nil then self.origemEdit:destroy(); self.origemEdit = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label292 ~= nil then self.label292:destroy(); self.label292 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.rectangle176 ~= nil then self.rectangle176:destroy(); self.rectangle176 = nil; end;
        if self.rectangle269 ~= nil then self.rectangle269:destroy(); self.rectangle269 = nil; end;
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.label312 ~= nil then self.label312:destroy(); self.label312 = nil; end;
        if self.label310 ~= nil then self.label310:destroy(); self.label310 = nil; end;
        if self.rclSaber ~= nil then self.rclSaber:destroy(); self.rclSaber = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label297 ~= nil then self.label297:destroy(); self.label297 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.popMagias ~= nil then self.popMagias:destroy(); self.popMagias = nil; end;
        if self.label264 ~= nil then self.label264:destroy(); self.label264 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.AcrobatismoOutrosEdit ~= nil then self.AcrobatismoOutrosEdit:destroy(); self.AcrobatismoOutrosEdit = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.outrosSobrecargaLabel ~= nil then self.outrosSobrecargaLabel:destroy(); self.outrosSobrecargaLabel = nil; end;
        if self.label326 ~= nil then self.label326:destroy(); self.label326 = nil; end;
        if self.pvTempEdit ~= nil then self.pvTempEdit:destroy(); self.pvTempEdit = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.rectangle169 ~= nil then self.rectangle169:destroy(); self.rectangle169 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.OcultismoOutrosEdit ~= nil then self.OcultismoOutrosEdit:destroy(); self.OcultismoOutrosEdit = nil; end;
        if self.label343 ~= nil then self.label343:destroy(); self.label343 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.maxSlot5Label ~= nil then self.maxSlot5Label:destroy(); self.maxSlot5Label = nil; end;
        if self.DesNivelLabel ~= nil then self.DesNivelLabel:destroy(); self.DesNivelLabel = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.classeLabel ~= nil then self.classeLabel:destroy(); self.classeLabel = nil; end;
        if self.rclMagiasFoco ~= nil then self.rclMagiasFoco:destroy(); self.rclMagiasFoco = nil; end;
        if self.AtletismoOutrosEdit ~= nil then self.AtletismoOutrosEdit:destroy(); self.AtletismoOutrosEdit = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.rectangle237 ~= nil then self.rectangle237:destroy(); self.rectangle237 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.tracosGolpeEdit ~= nil then self.tracosGolpeEdit:destroy(); self.tracosGolpeEdit = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.maxSlot7Label ~= nil then self.maxSlot7Label:destroy(); self.maxSlot7Label = nil; end;
        if self.rectangle241 ~= nil then self.rectangle241:destroy(); self.rectangle241 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.usadosSlot3Label ~= nil then self.usadosSlot3Label:destroy(); self.usadosSlot3Label = nil; end;
        if self.label270 ~= nil then self.label270:destroy(); self.label270 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label257 ~= nil then self.label257:destroy(); self.label257 = nil; end;
        if self.comboBox37 ~= nil then self.comboBox37:destroy(); self.comboBox37 = nil; end;
        if self.ForRacaEdit ~= nil then self.ForRacaEdit:destroy(); self.ForRacaEdit = nil; end;
        if self.label352 ~= nil then self.label352:destroy(); self.label352 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.usadosSlot9Label ~= nil then self.usadosSlot9Label:destroy(); self.usadosSlot9Label = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.rectangle141 ~= nil then self.rectangle141:destroy(); self.rectangle141 = nil; end;
        if self.rectangle282 ~= nil then self.rectangle282:destroy(); self.rectangle282 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.pecaOuroLabel ~= nil then self.pecaOuroLabel:destroy(); self.pecaOuroLabel = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rclInventario ~= nil then self.rclInventario:destroy(); self.rclInventario = nil; end;
        if self.rectangle142 ~= nil then self.rectangle142:destroy(); self.rectangle142 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.ForBaseLabel ~= nil then self.ForBaseLabel:destroy(); self.ForBaseLabel = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.sexoLabel ~= nil then self.sexoLabel:destroy(); self.sexoLabel = nil; end;
        if self.PerOutrosEdit ~= nil then self.PerOutrosEdit:destroy(); self.PerOutrosEdit = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.rectangle267 ~= nil then self.rectangle267:destroy(); self.rectangle267 = nil; end;
        if self.maxSlot3Edit ~= nil then self.maxSlot3Edit:destroy(); self.maxSlot3Edit = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.rectangle166 ~= nil then self.rectangle166:destroy(); self.rectangle166 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.rectangle179 ~= nil then self.rectangle179:destroy(); self.rectangle179 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.caDurezaEdit ~= nil then self.caDurezaEdit:destroy(); self.caDurezaEdit = nil; end;
        if self.rectangle212 ~= nil then self.rectangle212:destroy(); self.rectangle212 = nil; end;
        if self.AcrobatismoOutrosLabel ~= nil then self.AcrobatismoOutrosLabel:destroy(); self.AcrobatismoOutrosLabel = nil; end;
        if self.rectangle248 ~= nil then self.rectangle248:destroy(); self.rectangle248 = nil; end;
        if self.rectangle163 ~= nil then self.rectangle163:destroy(); self.rectangle163 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.ConOutrosLabel ~= nil then self.ConOutrosLabel:destroy(); self.ConOutrosLabel = nil; end;
        if self.caLimitLabel ~= nil then self.caLimitLabel:destroy(); self.caLimitLabel = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.rectangle253 ~= nil then self.rectangle253:destroy(); self.rectangle253 = nil; end;
        if self.label349 ~= nil then self.label349:destroy(); self.label349 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.ArcanismoOutrosLabel ~= nil then self.ArcanismoOutrosLabel:destroy(); self.ArcanismoOutrosLabel = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.pesoLabel ~= nil then self.pesoLabel:destroy(); self.pesoLabel = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.maxSlot10Label ~= nil then self.maxSlot10Label:destroy(); self.maxSlot10Label = nil; end;
        if self.label370 ~= nil then self.label370:destroy(); self.label370 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.rectangle240 ~= nil then self.rectangle240:destroy(); self.rectangle240 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.rectangle231 ~= nil then self.rectangle231:destroy(); self.rectangle231 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.pvClasseEdit ~= nil then self.pvClasseEdit:destroy(); self.pvClasseEdit = nil; end;
        if self.label369 ~= nil then self.label369:destroy(); self.label369 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.VonOutrosLabel ~= nil then self.VonOutrosLabel:destroy(); self.VonOutrosLabel = nil; end;
        if self.rectangle270 ~= nil then self.rectangle270:destroy(); self.rectangle270 = nil; end;
        if self.descItemEdit ~= nil then self.descItemEdit:destroy(); self.descItemEdit = nil; end;
        if self.imageCheckBox6 ~= nil then self.imageCheckBox6:destroy(); self.imageCheckBox6 = nil; end;
        if self.jogadorEdit ~= nil then self.jogadorEdit:destroy(); self.jogadorEdit = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label337 ~= nil then self.label337:destroy(); self.label337 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.IntBioLabel ~= nil then self.IntBioLabel:destroy(); self.IntBioLabel = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.IntimidacaoOutrosLabel ~= nil then self.IntimidacaoOutrosLabel:destroy(); self.IntimidacaoOutrosLabel = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.rectangle204 ~= nil then self.rectangle204:destroy(); self.rectangle204 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.label346 ~= nil then self.label346:destroy(); self.label346 = nil; end;
        if self.rectangle236 ~= nil then self.rectangle236:destroy(); self.rectangle236 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label272 ~= nil then self.label272:destroy(); self.label272 = nil; end;
        if self.label316 ~= nil then self.label316:destroy(); self.label316 = nil; end;
        if self.rectangle278 ~= nil then self.rectangle278:destroy(); self.rectangle278 = nil; end;
        if self.label354 ~= nil then self.label354:destroy(); self.label354 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.rectangle272 ~= nil then self.rectangle272:destroy(); self.rectangle272 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.rectangle228 ~= nil then self.rectangle228:destroy(); self.rectangle228 = nil; end;
        if self.label274 ~= nil then self.label274:destroy(); self.label274 = nil; end;
        if self.usadosSlot6Label ~= nil then self.usadosSlot6Label:destroy(); self.usadosSlot6Label = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.SabBioLabel ~= nil then self.SabBioLabel:destroy(); self.SabBioLabel = nil; end;
        if self.usadosSlot1Edit ~= nil then self.usadosSlot1Edit:destroy(); self.usadosSlot1Edit = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.rectangle136 ~= nil then self.rectangle136:destroy(); self.rectangle136 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle225 ~= nil then self.rectangle225:destroy(); self.rectangle225 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.ForClasseLabel ~= nil then self.ForClasseLabel:destroy(); self.ForClasseLabel = nil; end;
        if self.label311 ~= nil then self.label311:destroy(); self.label311 = nil; end;
        if self.ForOutrosEdit ~= nil then self.ForOutrosEdit:destroy(); self.ForOutrosEdit = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.label320 ~= nil then self.label320:destroy(); self.label320 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.caEscudoPVLabel ~= nil then self.caEscudoPVLabel:destroy(); self.caEscudoPVLabel = nil; end;
        if self.rectangle268 ~= nil then self.rectangle268:destroy(); self.rectangle268 = nil; end;
        if self.caEscudoMaxEdit ~= nil then self.caEscudoMaxEdit:destroy(); self.caEscudoMaxEdit = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.biografiaLabel ~= nil then self.biografiaLabel:destroy(); self.biografiaLabel = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.rectangle227 ~= nil then self.rectangle227:destroy(); self.rectangle227 = nil; end;
        if self.experienciaEdit ~= nil then self.experienciaEdit:destroy(); self.experienciaEdit = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.usadosSlot8Label ~= nil then self.usadosSlot8Label:destroy(); self.usadosSlot8Label = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.rectangle181 ~= nil then self.rectangle181:destroy(); self.rectangle181 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.rectangle265 ~= nil then self.rectangle265:destroy(); self.rectangle265 = nil; end;
        if self.DesRacaLabel ~= nil then self.DesRacaLabel:destroy(); self.DesRacaLabel = nil; end;
        if self.rectangle167 ~= nil then self.rectangle167:destroy(); self.rectangle167 = nil; end;
        if self.label249 ~= nil then self.label249:destroy(); self.label249 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.rectangle233 ~= nil then self.rectangle233:destroy(); self.rectangle233 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.caEscudoMaxLabel ~= nil then self.caEscudoMaxLabel:destroy(); self.caEscudoMaxLabel = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.SabBaseEdit ~= nil then self.SabBaseEdit:destroy(); self.SabBaseEdit = nil; end;
        if self.imageCheckBox14 ~= nil then self.imageCheckBox14:destroy(); self.imageCheckBox14 = nil; end;
        if self.rclTalGerais ~= nil then self.rclTalGerais:destroy(); self.rclTalGerais = nil; end;
        if self.caEscudoEdit ~= nil then self.caEscudoEdit:destroy(); self.caEscudoEdit = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.rclCaracteristicas ~= nil then self.rclCaracteristicas:destroy(); self.rclCaracteristicas = nil; end;
        if self.maxSlot2Edit ~= nil then self.maxSlot2Edit:destroy(); self.maxSlot2Edit = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.rectangle139 ~= nil then self.rectangle139:destroy(); self.rectangle139 = nil; end;
        if self.VonOutrosEdit ~= nil then self.VonOutrosEdit:destroy(); self.VonOutrosEdit = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.ArcanismoOutrosEdit ~= nil then self.ArcanismoOutrosEdit:destroy(); self.ArcanismoOutrosEdit = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.personalidadeEdit ~= nil then self.personalidadeEdit:destroy(); self.personalidadeEdit = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.ManufaturaOutrosLabel ~= nil then self.ManufaturaOutrosLabel:destroy(); self.ManufaturaOutrosLabel = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.ConClasseEdit ~= nil then self.ConClasseEdit:destroy(); self.ConClasseEdit = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.rectangle215 ~= nil then self.rectangle215:destroy(); self.rectangle215 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label373 ~= nil then self.label373:destroy(); self.label373 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.popInfo ~= nil then self.popInfo:destroy(); self.popInfo = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.ConClasseLabel ~= nil then self.ConClasseLabel:destroy(); self.ConClasseLabel = nil; end;
        if self.label294 ~= nil then self.label294:destroy(); self.label294 = nil; end;
        if self.usadosSlot3Edit ~= nil then self.usadosSlot3Edit:destroy(); self.usadosSlot3Edit = nil; end;
        if self.rectangle165 ~= nil then self.rectangle165:destroy(); self.rectangle165 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.maxSlot10Edit ~= nil then self.maxSlot10Edit:destroy(); self.maxSlot10Edit = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle196 ~= nil then self.rectangle196:destroy(); self.rectangle196 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.maxSlot5Edit ~= nil then self.maxSlot5Edit:destroy(); self.maxSlot5Edit = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.alturaLabel ~= nil then self.alturaLabel:destroy(); self.alturaLabel = nil; end;
        if self.ConRacaLabel ~= nil then self.ConRacaLabel:destroy(); self.ConRacaLabel = nil; end;
        if self.usadosSlot10Label ~= nil then self.usadosSlot10Label:destroy(); self.usadosSlot10Label = nil; end;
        if self.label363 ~= nil then self.label363:destroy(); self.label363 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.popInv ~= nil then self.popInv:destroy(); self.popInv = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.DiplomaciaOutrosLabel ~= nil then self.DiplomaciaOutrosLabel:destroy(); self.DiplomaciaOutrosLabel = nil; end;
        if self.rclGolpes ~= nil then self.rclGolpes:destroy(); self.rclGolpes = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label296 ~= nil then self.label296:destroy(); self.label296 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label277 ~= nil then self.label277:destroy(); self.label277 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.rectangle188 ~= nil then self.rectangle188:destroy(); self.rectangle188 = nil; end;
        if self.pecaOuroEdit ~= nil then self.pecaOuroEdit:destroy(); self.pecaOuroEdit = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.label368 ~= nil then self.label368:destroy(); self.label368 = nil; end;
        if self.rectangle260 ~= nil then self.rectangle260:destroy(); self.rectangle260 = nil; end;
        if self.rectangle216 ~= nil then self.rectangle216:destroy(); self.rectangle216 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.tracosGolpeLabel ~= nil then self.tracosGolpeLabel:destroy(); self.tracosGolpeLabel = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newPathfinder2E()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Pathfinder2E();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Pathfinder2E = {
    newEditor = newPathfinder2E, 
    new = newPathfinder2E, 
    name = "Pathfinder2E", 
    dataType = "br.com.rrpg.pathfinder2e", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Pathfinder 2e", 
    description=""};

Pathfinder2E = _Pathfinder2E;
Firecast.registrarForm(_Pathfinder2E);
Firecast.registrarDataType(_Pathfinder2E);

return _Pathfinder2E;
