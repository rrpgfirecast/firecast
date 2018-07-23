require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMain()
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
    obj:setName("frmMain");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.TheMaze");
    obj:setTitle("Ficha The Maze");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Status Básicos");
    obj.tab1:setName("tab1");

    obj.frmBase = GUI.fromHandle(_obj_newObject("form"));
    obj.frmBase:setParent(obj.tab1);
    obj.frmBase:setName("frmBase");
    obj.frmBase:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmBase);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(60);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(105);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(255);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Nível");
    obj.label2:setName("label2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(355);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(355);
    obj.label3:setTop(5);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setField("nivel");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(405);
    obj.label4:setTop(5);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Experiência");
    obj.label4:setName("label4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(505);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("experiencia");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setTop(30);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Aptidão");
    obj.label5:setName("label5");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(105);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("aptidao");
    obj.comboBox1:setItems({'Alquimista', 'Arcanista', 'Caçador', 'Cavaleiro', 'Monge', 'Necromante', 'Xamã'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setName("comboBox1");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(255);
    obj.label6:setTop(30);
    obj.label6:setWidth(100);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("Rank");
    obj.label6:setName("label6");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setLeft(355);
    obj.rectangle3:setTop(30);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(355);
    obj.label7:setTop(30);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setField("rank");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(405);
    obj.label8:setTop(30);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("Progresso");
    obj.label8:setName("label8");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(505);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("progresso");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("nivel");
    obj.dataLink1:setName("dataLink1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(65);
    obj.rectangle4:setWidth(310);
    obj.rectangle4:setHeight(85);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle4);
    obj.label9:setLeft(105);
    obj.label9:setTop(5);
    obj.label9:setWidth(75);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("Naturais");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle4);
    obj.label10:setLeft(180);
    obj.label10:setTop(5);
    obj.label10:setWidth(75);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Adicional");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle4);
    obj.label11:setLeft(255);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("Atual");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle4);
    obj.label12:setLeft(5);
    obj.label12:setTop(30);
    obj.label12:setWidth(100);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("Vida");
    obj.label12:setName("label12");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle4);
    obj.rectangle5:setLeft(105);
    obj.rectangle5:setTop(30);
    obj.rectangle5:setWidth(75);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle4);
    obj.label13:setLeft(105);
    obj.label13:setTop(30);
    obj.label13:setWidth(75);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setField("vidaBase");
    obj.label13:setName("label13");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle4);
    obj.edit4:setLeft(180);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(75);
    obj.edit4:setHeight(25);
    obj.edit4:setField("vidaCompensacao");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle4);
    obj.rectangle6:setLeft(255);
    obj.rectangle6:setTop(30);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle4);
    obj.label14:setLeft(255);
    obj.label14:setTop(30);
    obj.label14:setWidth(50);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setField("vidaAtual");
    obj.label14:setName("label14");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle4);
    obj.dataLink2:setFields({'vidaBase','vidaCompensacao'});
    obj.dataLink2:setName("dataLink2");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle4);
    obj.label15:setLeft(5);
    obj.label15:setTop(55);
    obj.label15:setWidth(100);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Fadiga");
    obj.label15:setName("label15");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle4);
    obj.rectangle7:setLeft(105);
    obj.rectangle7:setTop(55);
    obj.rectangle7:setWidth(75);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle4);
    obj.label16:setLeft(105);
    obj.label16:setTop(55);
    obj.label16:setWidth(75);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setField("fadigaBase");
    obj.label16:setName("label16");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle4);
    obj.edit5:setLeft(180);
    obj.edit5:setTop(55);
    obj.edit5:setWidth(75);
    obj.edit5:setHeight(25);
    obj.edit5:setField("fadigaCompensacao");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle4);
    obj.rectangle8:setLeft(255);
    obj.rectangle8:setTop(55);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle4);
    obj.label17:setLeft(255);
    obj.label17:setTop(55);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setField("fadigaAtual");
    obj.label17:setName("label17");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle4);
    obj.dataLink3:setFields({'fadigaBase','fadigaCompensacao'});
    obj.dataLink3:setName("dataLink3");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox1);
    obj.rectangle9:setLeft(0);
    obj.rectangle9:setTop(155);
    obj.rectangle9:setWidth(310);
    obj.rectangle9:setHeight(35);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle9);
    obj.label18:setLeft(5);
    obj.label18:setTop(5);
    obj.label18:setWidth(150);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("Peças de Aruman");
    obj.label18:setFontSize(13);
    obj.label18:setName("label18");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle9);
    obj.edit6:setLeft(155);
    obj.edit6:setTop(5);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("pecas");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox1);
    obj.rectangle10:setLeft(0);
    obj.rectangle10:setTop(195);
    obj.rectangle10:setWidth(310);
    obj.rectangle10:setHeight(490);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle10);
    obj.label19:setLeft(0);
    obj.label19:setTop(5);
    obj.label19:setWidth(310);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Bençãos e Sentinelas");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle10);
    obj.label20:setLeft(0);
    obj.label20:setTop(5);
    obj.label20:setWidth(280);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("trailing");
    obj.label20:setText("Custo");
    obj.label20:setFontSize(11);
    obj.label20:setName("label20");

    obj.rclBencaos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclBencaos:setParent(obj.rectangle10);
    obj.rclBencaos:setLeft(5);
    obj.rclBencaos:setTop(30);
    obj.rclBencaos:setWidth(300);
    obj.rclBencaos:setHeight(273);
    obj.rclBencaos:setName("rclBencaos");
    obj.rclBencaos:setField("listaDeBencaos");
    obj.rclBencaos:setTemplateForm("frmBlessing");
    obj.rclBencaos:setLayout("vertical");
    obj.rclBencaos:setMinQt(3);

    obj.rclSentinela = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSentinela:setParent(obj.rectangle10);
    obj.rclSentinela:setLeft(5);
    obj.rclSentinela:setTop(303);
    obj.rclSentinela:setWidth(300);
    obj.rclSentinela:setHeight(182);
    obj.rclSentinela:setName("rclSentinela");
    obj.rclSentinela:setField("listaDeSentinelas");
    obj.rclSentinela:setTemplateForm("frmSentinel");
    obj.rclSentinela:setLayout("vertical");
    obj.rclSentinela:setMinQt(2);

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.scrollBox1);
    obj.rectangle11:setLeft(315);
    obj.rectangle11:setTop(65);
    obj.rectangle11:setWidth(285);
    obj.rectangle11:setHeight(240);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle11);
    obj.label21:setLeft(0);
    obj.label21:setTop(5);
    obj.label21:setWidth(285);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setText("Atributos");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle11);
    obj.label22:setLeft(75);
    obj.label22:setTop(30);
    obj.label22:setWidth(50);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("Total");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle11);
    obj.label23:setLeft(125);
    obj.label23:setTop(30);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setText("Perícia");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle11);
    obj.label24:setLeft(175);
    obj.label24:setTop(30);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setText("Nível");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle11);
    obj.label25:setLeft(225);
    obj.label25:setTop(30);
    obj.label25:setWidth(50);
    obj.label25:setHeight(25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Adicional");
    obj.label25:setFontSize(11);
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle11);
    obj.label26:setLeft(0);
    obj.label26:setTop(55);
    obj.label26:setWidth(75);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setText("Agilidade");
    obj.label26:setFontSize(13);
    obj.label26:setName("label26");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle11);
    obj.rectangle12:setLeft(75);
    obj.rectangle12:setTop(55);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle11);
    obj.label27:setLeft(75);
    obj.label27:setTop(55);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setField("agilidade_total");
    obj.label27:setName("label27");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.rectangle11);
    obj.rectangle13:setLeft(125);
    obj.rectangle13:setTop(55);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle11);
    obj.label28:setLeft(125);
    obj.label28:setTop(55);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setField("agilidade_inicial");
    obj.label28:setName("label28");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle11);
    obj.edit7:setLeft(175);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("agilidade_nivel");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle11);
    obj.edit8:setLeft(225);
    obj.edit8:setTop(55);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("agilidade_outros");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle11);
    obj.dataLink4:setFields({'agilidade_inicial', 'agilidade_nivel', 'agilidade_outros'});
    obj.dataLink4:setName("dataLink4");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle11);
    obj.label29:setLeft(0);
    obj.label29:setTop(80);
    obj.label29:setWidth(75);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setText("Corpo-a-Corpo");
    obj.label29:setFontSize(10);
    obj.label29:setName("label29");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle11);
    obj.rectangle14:setLeft(75);
    obj.rectangle14:setTop(80);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle11);
    obj.label30:setLeft(75);
    obj.label30:setTop(80);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("cac_total");
    obj.label30:setName("label30");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle11);
    obj.rectangle15:setLeft(125);
    obj.rectangle15:setTop(80);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle11);
    obj.label31:setLeft(125);
    obj.label31:setTop(80);
    obj.label31:setWidth(50);
    obj.label31:setHeight(25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setField("cac_inicial");
    obj.label31:setName("label31");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle11);
    obj.edit9:setLeft(175);
    obj.edit9:setTop(80);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("cac_nivel");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle11);
    obj.edit10:setLeft(225);
    obj.edit10:setTop(80);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("cac_outros");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle11);
    obj.dataLink5:setFields({'cac_inicial', 'cac_nivel', 'cac_outros'});
    obj.dataLink5:setName("dataLink5");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle11);
    obj.label32:setLeft(0);
    obj.label32:setTop(105);
    obj.label32:setWidth(75);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setText("Manuseio");
    obj.label32:setFontSize(13);
    obj.label32:setName("label32");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle11);
    obj.rectangle16:setLeft(75);
    obj.rectangle16:setTop(105);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle11);
    obj.label33:setLeft(75);
    obj.label33:setTop(105);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setField("manuseio_total");
    obj.label33:setName("label33");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle11);
    obj.rectangle17:setLeft(125);
    obj.rectangle17:setTop(105);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle11);
    obj.label34:setLeft(125);
    obj.label34:setTop(105);
    obj.label34:setWidth(50);
    obj.label34:setHeight(25);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setField("manuseio_inicial");
    obj.label34:setName("label34");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle11);
    obj.edit11:setLeft(175);
    obj.edit11:setTop(105);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("manuseio_nivel");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle11);
    obj.edit12:setLeft(225);
    obj.edit12:setTop(105);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("manuseio_outros");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle11);
    obj.dataLink6:setFields({'manuseio_inicial', 'manuseio_nivel', 'manuseio_outros'});
    obj.dataLink6:setName("dataLink6");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle11);
    obj.label35:setLeft(0);
    obj.label35:setTop(130);
    obj.label35:setWidth(75);
    obj.label35:setHeight(25);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setText("Pontaria");
    obj.label35:setFontSize(13);
    obj.label35:setName("label35");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle11);
    obj.rectangle18:setLeft(75);
    obj.rectangle18:setTop(130);
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle11);
    obj.label36:setLeft(75);
    obj.label36:setTop(130);
    obj.label36:setWidth(50);
    obj.label36:setHeight(25);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setField("pontaria_total");
    obj.label36:setName("label36");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle11);
    obj.rectangle19:setLeft(125);
    obj.rectangle19:setTop(130);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle11);
    obj.label37:setLeft(125);
    obj.label37:setTop(130);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setField("pontaria_inicial");
    obj.label37:setName("label37");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle11);
    obj.edit13:setLeft(175);
    obj.edit13:setTop(130);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("pontaria_nivel");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle11);
    obj.edit14:setLeft(225);
    obj.edit14:setTop(130);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("pontaria_outros");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle11);
    obj.dataLink7:setFields({'pontaria_inicial', 'pontaria_nivel', 'pontaria_outros'});
    obj.dataLink7:setName("dataLink7");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle11);
    obj.label38:setLeft(0);
    obj.label38:setTop(155);
    obj.label38:setWidth(75);
    obj.label38:setHeight(25);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setText("Paranormalidade");
    obj.label38:setFontSize(9);
    obj.label38:setName("label38");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.rectangle11);
    obj.rectangle20:setLeft(75);
    obj.rectangle20:setTop(155);
    obj.rectangle20:setWidth(50);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle11);
    obj.label39:setLeft(75);
    obj.label39:setTop(155);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setField("paranormalidade_total");
    obj.label39:setName("label39");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle11);
    obj.rectangle21:setLeft(125);
    obj.rectangle21:setTop(155);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle11);
    obj.label40:setLeft(125);
    obj.label40:setTop(155);
    obj.label40:setWidth(50);
    obj.label40:setHeight(25);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setField("paranormalidade_inicial");
    obj.label40:setName("label40");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle11);
    obj.edit15:setLeft(175);
    obj.edit15:setTop(155);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("paranormalidade_nivel");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle11);
    obj.edit16:setLeft(225);
    obj.edit16:setTop(155);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("paranormalidade_outros");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle11);
    obj.dataLink8:setFields({'paranormalidade_inicial', 'paranormalidade_nivel', 'paranormalidade_outros'});
    obj.dataLink8:setName("dataLink8");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle11);
    obj.label41:setLeft(0);
    obj.label41:setTop(180);
    obj.label41:setWidth(75);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setText("Sorte");
    obj.label41:setFontSize(13);
    obj.label41:setName("label41");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle11);
    obj.rectangle22:setLeft(75);
    obj.rectangle22:setTop(180);
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle11);
    obj.label42:setLeft(75);
    obj.label42:setTop(180);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setField("sorte_total");
    obj.label42:setName("label42");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle11);
    obj.rectangle23:setLeft(125);
    obj.rectangle23:setTop(180);
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle11);
    obj.label43:setLeft(125);
    obj.label43:setTop(180);
    obj.label43:setWidth(50);
    obj.label43:setHeight(25);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setField("sorte_inicial");
    obj.label43:setName("label43");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle11);
    obj.edit17:setLeft(175);
    obj.edit17:setTop(180);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("sorte_nivel");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle11);
    obj.edit18:setLeft(225);
    obj.edit18:setTop(180);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("sorte_outros");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle11);
    obj.dataLink9:setFields({'sorte_inicial', 'sorte_nivel', 'sorte_outros'});
    obj.dataLink9:setName("dataLink9");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle11);
    obj.rectangle24:setLeft(15);
    obj.rectangle24:setTop(210);
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.atr_max = GUI.fromHandle(_obj_newObject("label"));
    obj.atr_max:setParent(obj.rectangle11);
    obj.atr_max:setLeft(15);
    obj.atr_max:setTop(210);
    obj.atr_max:setWidth(50);
    obj.atr_max:setHeight(25);
    obj.atr_max:setHorzTextAlign("center");
    obj.atr_max:setField("atr_max");
    obj.atr_max:setName("atr_max");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle11);
    obj.rectangle25:setLeft(75);
    obj.rectangle25:setTop(210);
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle11);
    obj.label44:setLeft(75);
    obj.label44:setTop(210);
    obj.label44:setWidth(50);
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setField("sum_total");
    obj.label44:setName("label44");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle11);
    obj.rectangle26:setLeft(125);
    obj.rectangle26:setTop(210);
    obj.rectangle26:setWidth(50);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle11);
    obj.label45:setLeft(125);
    obj.label45:setTop(210);
    obj.label45:setWidth(50);
    obj.label45:setHeight(25);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setField("sum_inicial");
    obj.label45:setName("label45");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.rectangle11);
    obj.rectangle27:setLeft(175);
    obj.rectangle27:setTop(210);
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle11);
    obj.label46:setLeft(175);
    obj.label46:setTop(210);
    obj.label46:setWidth(50);
    obj.label46:setHeight(25);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setField("sum_nivel");
    obj.label46:setName("label46");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle11);
    obj.dataLink10:setFields({'atr_max','sum_total'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle11);
    obj.dataLink11:setFields({'cac_total'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle11);
    obj.dataLink12:setFields({'paranormalidade_total'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle11);
    obj.dataLink13:setFields({'sum_inicial', 'sum_nivel'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle11);
    obj.dataLink14:setFields({'agilidade_inicial', 'cac_inicial', 'manuseio_inicial', 'pontaria_inicial', 'paranormalidade_inicial', 'sorte_inicial'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle11);
    obj.dataLink15:setFields({'agilidade_nivel', 'cac_nivel', 'manuseio_nivel', 'pontaria_nivel', 'paranormalidade_nivel', 'sorte_nivel'});
    obj.dataLink15:setName("dataLink15");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.scrollBox1);
    obj.rectangle28:setLeft(315);
    obj.rectangle28:setTop(310);
    obj.rectangle28:setWidth(155);
    obj.rectangle28:setHeight(80);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle28);
    obj.label47:setLeft(75);
    obj.label47:setTop(5);
    obj.label47:setWidth(75);
    obj.label47:setHeight(20);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setText("Resistência");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle28);
    obj.label48:setLeft(0);
    obj.label48:setTop(25);
    obj.label48:setWidth(75);
    obj.label48:setHeight(25);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setText("Física");
    obj.label48:setName("label48");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.rectangle28);
    obj.rectangle29:setLeft(90);
    obj.rectangle29:setTop(25);
    obj.rectangle29:setWidth(45);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle28);
    obj.label49:setLeft(90);
    obj.label49:setTop(25);
    obj.label49:setWidth(45);
    obj.label49:setHeight(25);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setField("resistenciaFisica");
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle28);
    obj.label50:setLeft(0);
    obj.label50:setTop(50);
    obj.label50:setWidth(75);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("Paranormal");
    obj.label50:setName("label50");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.rectangle28);
    obj.rectangle30:setLeft(90);
    obj.rectangle30:setTop(50);
    obj.rectangle30:setWidth(45);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle28);
    obj.label51:setLeft(90);
    obj.label51:setTop(50);
    obj.label51:setWidth(45);
    obj.label51:setHeight(25);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setField("resistenciaParanormal");
    obj.label51:setName("label51");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.scrollBox1);
    obj.rectangle31:setLeft(475);
    obj.rectangle31:setTop(310);
    obj.rectangle31:setWidth(435);
    obj.rectangle31:setHeight(80);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle31);
    obj.label52:setLeft(0);
    obj.label52:setTop(5);
    obj.label52:setWidth(435);
    obj.label52:setHeight(20);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("Redutores");
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle31);
    obj.label53:setLeft(5);
    obj.label53:setTop(25);
    obj.label53:setWidth(135);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("Físico");
    obj.label53:setName("label53");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle31);
    obj.edit19:setLeft(140);
    obj.edit19:setTop(25);
    obj.edit19:setWidth(75);
    obj.edit19:setHeight(25);
    obj.edit19:setField("redutorFisico");
    obj.edit19:setName("edit19");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle31);
    obj.label54:setLeft(220);
    obj.label54:setTop(25);
    obj.label54:setWidth(135);
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setText("Projétil");
    obj.label54:setName("label54");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle31);
    obj.edit20:setLeft(355);
    obj.edit20:setTop(25);
    obj.edit20:setWidth(75);
    obj.edit20:setHeight(25);
    obj.edit20:setField("redutorProjetil");
    obj.edit20:setName("edit20");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle31);
    obj.label55:setLeft(5);
    obj.label55:setTop(50);
    obj.label55:setWidth(135);
    obj.label55:setHeight(25);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("Paranormal");
    obj.label55:setName("label55");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle31);
    obj.edit21:setLeft(140);
    obj.edit21:setTop(50);
    obj.edit21:setWidth(75);
    obj.edit21:setHeight(25);
    obj.edit21:setField("redutorParanormal");
    obj.edit21:setName("edit21");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle31);
    obj.label56:setLeft(220);
    obj.label56:setTop(50);
    obj.label56:setWidth(135);
    obj.label56:setHeight(25);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setText("Corrosivo");
    obj.label56:setName("label56");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle31);
    obj.edit22:setLeft(355);
    obj.edit22:setTop(50);
    obj.edit22:setWidth(75);
    obj.edit22:setHeight(25);
    obj.edit22:setField("redutorCorrosivo");
    obj.edit22:setName("edit22");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.scrollBox1);
    obj.rectangle32:setLeft(315);
    obj.rectangle32:setTop(395);
    obj.rectangle32:setWidth(595);
    obj.rectangle32:setHeight(290);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle32);
    obj.label57:setLeft(0);
    obj.label57:setTop(5);
    obj.label57:setWidth(535);
    obj.label57:setHeight(25);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Habilidades");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle32);
    obj.label58:setLeft(0);
    obj.label58:setTop(5);
    obj.label58:setWidth(550);
    obj.label58:setHeight(25);
    obj.label58:setHorzTextAlign("trailing");
    obj.label58:setText("Estágio");
    obj.label58:setFontSize(11);
    obj.label58:setName("label58");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.rectangle32);
    obj.rectangle33:setLeft(310);
    obj.rectangle33:setTop(5);
    obj.rectangle33:setWidth(50);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle32);
    obj.label59:setLeft(310);
    obj.label59:setTop(5);
    obj.label59:setWidth(50);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setField("habilidadesNivel");
    obj.label59:setName("label59");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.rectangle32);
    obj.rectangle34:setLeft(360);
    obj.rectangle34:setTop(5);
    obj.rectangle34:setWidth(50);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle32);
    obj.label60:setLeft(360);
    obj.label60:setTop(5);
    obj.label60:setWidth(50);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setField("habilidadesDisponivel");
    obj.label60:setName("label60");

    obj.rclHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidades:setParent(obj.rectangle32);
    obj.rclHabilidades:setLeft(5);
    obj.rclHabilidades:setTop(30);
    obj.rclHabilidades:setWidth(585);
    obj.rclHabilidades:setHeight(255);
    obj.rclHabilidades:setName("rclHabilidades");
    obj.rclHabilidades:setField("listaDeHabilidades");
    obj.rclHabilidades:setTemplateForm("frmAbilities");
    obj.rclHabilidades:setLayout("vertical");
    obj.rclHabilidades:setMinQt(5);

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.scrollBox1);
    obj.rectangle35:setLeft(605);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(305);
    obj.rectangle35:setHeight(305);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(606);
    obj.image1:setTop(1);
    obj.image1:setWidth(303);
    obj.image1:setHeight(303);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.scrollBox1);
    obj.rectangle36:setLeft(915);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(310);
    obj.rectangle36:setHeight(190);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle36);
    obj.label61:setLeft(0);
    obj.label61:setTop(5);
    obj.label61:setWidth(310);
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setText("Contratos");
    obj.label61:setName("label61");

    obj.rclContratos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclContratos:setParent(obj.rectangle36);
    obj.rclContratos:setLeft(5);
    obj.rclContratos:setTop(30);
    obj.rclContratos:setWidth(300);
    obj.rclContratos:setHeight(155);
    obj.rclContratos:setName("rclContratos");
    obj.rclContratos:setField("listaDeContratos");
    obj.rclContratos:setTemplateForm("frmContract");
    obj.rclContratos:setLayout("vertical");
    obj.rclContratos:setMinQt(3);

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.scrollBox1);
    obj.rectangle37:setLeft(915);
    obj.rectangle37:setTop(195);
    obj.rectangle37:setWidth(310);
    obj.rectangle37:setHeight(195);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle37);
    obj.label62:setLeft(0);
    obj.label62:setTop(5);
    obj.label62:setWidth(310);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setText("Ultimato");
    obj.label62:setName("label62");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle37);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(300);
    obj.textEditor1:setHeight(160);
    obj.textEditor1:setField("ultimato");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.scrollBox1);
    obj.rectangle38:setLeft(915);
    obj.rectangle38:setTop(395);
    obj.rectangle38:setWidth(310);
    obj.rectangle38:setHeight(190);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle38);
    obj.label63:setLeft(0);
    obj.label63:setTop(5);
    obj.label63:setWidth(310);
    obj.label63:setHeight(25);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setText("Privilégio");
    obj.label63:setName("label63");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle38);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setWidth(300);
    obj.textEditor2:setHeight(155);
    obj.textEditor2:setField("privilegio");
    obj.textEditor2:setName("textEditor2");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.scrollBox1);
    obj.rectangle39:setLeft(915);
    obj.rectangle39:setTop(590);
    obj.rectangle39:setWidth(310);
    obj.rectangle39:setHeight(60);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle39);
    obj.label64:setLeft(0);
    obj.label64:setTop(5);
    obj.label64:setWidth(310);
    obj.label64:setHeight(25);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setText("Carma");
    obj.label64:setName("label64");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle39);
    obj.comboBox2:setLeft(55);
    obj.comboBox2:setTop(30);
    obj.comboBox2:setWidth(200);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("carma");
    obj.comboBox2:setItems({'Divino 2','Divino 1','Humano','Demoníaco 1','Demoníaco 2'});
    obj.comboBox2:setName("comboBox2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Inventário");
    obj.tab2:setName("tab2");

    obj.frmInventory = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInventory:setParent(obj.tab2);
    obj.frmInventory:setName("frmInventory");
    obj.frmInventory:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmInventory);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.scrollBox2);
    obj.rectangle40:setColor("#FF000000");
    obj.rectangle40:setWidth(1363);
    obj.rectangle40:setHeight(686);
    obj.rectangle40:setName("rectangle40");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.scrollBox2);
    obj.rectangle41:setLeft(0);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(1210);
    obj.rectangle41:setHeight(555);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle41);
    obj.label65:setLeft(5);
    obj.label65:setTop(5);
    obj.label65:setWidth(200);
    obj.label65:setHeight(25);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setText("Nome");
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle41);
    obj.label66:setLeft(205);
    obj.label66:setTop(5);
    obj.label66:setWidth(700);
    obj.label66:setHeight(25);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setText("Efeito");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle41);
    obj.label67:setLeft(905);
    obj.label67:setTop(5);
    obj.label67:setWidth(150);
    obj.label67:setHeight(25);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setText("Tipo");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle41);
    obj.label68:setLeft(1055);
    obj.label68:setTop(5);
    obj.label68:setWidth(50);
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setText("Qtd");
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle41);
    obj.label69:setLeft(1105);
    obj.label69:setTop(5);
    obj.label69:setWidth(50);
    obj.label69:setHeight(25);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setText("Max");
    obj.label69:setName("label69");

    obj.rclInventario = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventario:setParent(obj.rectangle41);
    obj.rclInventario:setLeft(5);
    obj.rclInventario:setTop(30);
    obj.rclInventario:setWidth(1200);
    obj.rclInventario:setHeight(520);
    obj.rclInventario:setName("rclInventario");
    obj.rclInventario:setField("listaDeItens");
    obj.rclInventario:setTemplateForm("frmItem");
    obj.rclInventario:setLayout("vertical");
    obj.rclInventario:setMinQt(6);

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.scrollBox2);
    obj.rectangle42:setLeft(0);
    obj.rectangle42:setTop(560);
    obj.rectangle42:setWidth(310);
    obj.rectangle42:setHeight(110);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle42);
    obj.label70:setLeft(0);
    obj.label70:setTop(5);
    obj.label70:setWidth(310);
    obj.label70:setHeight(25);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setText("Armazenamento");
    obj.label70:setName("label70");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle42);
    obj.comboBox3:setLeft(5);
    obj.comboBox3:setTop(30);
    obj.comboBox3:setWidth(300);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("armazenamento1");
    obj.comboBox3:setItems({'', 'Bolsa Pequena', 'Bolsa Grande', 'Mochila', 'Mochila Grande'});
    obj.comboBox3:setValues({'0','4','5','6','7'});
    obj.comboBox3:setName("comboBox3");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle42);
    obj.comboBox4:setLeft(5);
    obj.comboBox4:setTop(55);
    obj.comboBox4:setWidth(300);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("armazenamento2");
    obj.comboBox4:setItems({'', 'Bolsa Pequena', 'Bolsa Grande', 'Mochila', 'Mochila Grande'});
    obj.comboBox4:setValues({'0','4','5','6','7'});
    obj.comboBox4:setName("comboBox4");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle42);
    obj.comboBox5:setLeft(5);
    obj.comboBox5:setTop(80);
    obj.comboBox5:setWidth(300);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("armazenamento3");
    obj.comboBox5:setItems({'+0', '+1', '+2', '+3', '+4', '+5', '+6'});
    obj.comboBox5:setValues({'0','1','2','3','4','5','6'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle42);
    obj.dataLink16:setFields({'armazenamento1','armazenamento2','armazenamento3'});
    obj.dataLink16:setName("dataLink16");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Descrição");
    obj.tab3:setName("tab3");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab3);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmTemplateDescription);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.scrollBox3);
    obj.rectangle43:setLeft(0);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(1205);
    obj.rectangle43:setHeight(105);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setName("rectangle43");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle43);
    obj.label71:setLeft(3);
    obj.label71:setTop(1);
    obj.label71:setWidth(100);
    obj.label71:setHeight(20);
    obj.label71:setText("DESCRIÇÃO");
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle43);
    obj.label72:setLeft(10);
    obj.label72:setTop(25);
    obj.label72:setWidth(90);
    obj.label72:setHeight(20);
    obj.label72:setText("TAMANHO");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle43);
    obj.edit23:setLeft(100);
    obj.edit23:setTop(25);
    obj.edit23:setWidth(200);
    obj.edit23:setHeight(25);
    obj.edit23:setField("tamanho");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setName("edit23");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle43);
    obj.label73:setLeft(10);
    obj.label73:setTop(50);
    obj.label73:setWidth(90);
    obj.label73:setHeight(20);
    obj.label73:setText("ALTURA");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle43);
    obj.edit24:setLeft(100);
    obj.edit24:setTop(50);
    obj.edit24:setWidth(200);
    obj.edit24:setHeight(25);
    obj.edit24:setField("altura");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setName("edit24");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle43);
    obj.label74:setLeft(10);
    obj.label74:setTop(75);
    obj.label74:setWidth(90);
    obj.label74:setHeight(20);
    obj.label74:setText("PESO");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle43);
    obj.edit25:setLeft(100);
    obj.edit25:setTop(75);
    obj.edit25:setWidth(200);
    obj.edit25:setHeight(25);
    obj.edit25:setField("peso");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setName("edit25");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle43);
    obj.label75:setLeft(310);
    obj.label75:setTop(25);
    obj.label75:setWidth(90);
    obj.label75:setHeight(20);
    obj.label75:setText("IDADE");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle43);
    obj.edit26:setLeft(400);
    obj.edit26:setTop(25);
    obj.edit26:setWidth(200);
    obj.edit26:setHeight(25);
    obj.edit26:setField("idade");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setName("edit26");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle43);
    obj.label76:setLeft(310);
    obj.label76:setTop(50);
    obj.label76:setWidth(90);
    obj.label76:setHeight(20);
    obj.label76:setText("SEXO");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle43);
    obj.edit27:setLeft(400);
    obj.edit27:setTop(50);
    obj.edit27:setWidth(200);
    obj.edit27:setHeight(25);
    obj.edit27:setField("sexo");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setName("edit27");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle43);
    obj.label77:setLeft(310);
    obj.label77:setTop(75);
    obj.label77:setWidth(90);
    obj.label77:setHeight(20);
    obj.label77:setText("OUTROS");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle43);
    obj.edit28:setLeft(400);
    obj.edit28:setTop(75);
    obj.edit28:setWidth(200);
    obj.edit28:setHeight(25);
    obj.edit28:setField("aparenciaOutros");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setName("edit28");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle43);
    obj.label78:setLeft(610);
    obj.label78:setTop(25);
    obj.label78:setWidth(90);
    obj.label78:setHeight(20);
    obj.label78:setText("OLHOS");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle43);
    obj.edit29:setLeft(700);
    obj.edit29:setTop(25);
    obj.edit29:setWidth(200);
    obj.edit29:setHeight(25);
    obj.edit29:setField("aparenciaOlhos");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle43);
    obj.label79:setLeft(610);
    obj.label79:setTop(50);
    obj.label79:setWidth(90);
    obj.label79:setHeight(20);
    obj.label79:setText("PELE");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle43);
    obj.edit30:setLeft(700);
    obj.edit30:setTop(50);
    obj.edit30:setWidth(200);
    obj.edit30:setHeight(25);
    obj.edit30:setField("pele");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setName("edit30");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle43);
    obj.label80:setLeft(610);
    obj.label80:setTop(75);
    obj.label80:setWidth(90);
    obj.label80:setHeight(20);
    obj.label80:setText("CABELO");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle43);
    obj.edit31:setLeft(700);
    obj.edit31:setTop(75);
    obj.edit31:setWidth(200);
    obj.edit31:setHeight(25);
    obj.edit31:setField("cabelo");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.rectangle43);
    obj.label81:setLeft(910);
    obj.label81:setTop(25);
    obj.label81:setWidth(90);
    obj.label81:setHeight(20);
    obj.label81:setText("TATOO");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle43);
    obj.edit32:setLeft(1000);
    obj.edit32:setTop(25);
    obj.edit32:setWidth(200);
    obj.edit32:setHeight(25);
    obj.edit32:setField("plano");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.rectangle43);
    obj.label82:setLeft(910);
    obj.label82:setTop(50);
    obj.label82:setWidth(90);
    obj.label82:setHeight(20);
    obj.label82:setText("CICATRIZES");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle43);
    obj.edit33:setLeft(1000);
    obj.edit33:setTop(50);
    obj.edit33:setWidth(200);
    obj.edit33:setHeight(25);
    obj.edit33:setField("regiao");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle43);
    obj.label83:setLeft(910);
    obj.label83:setTop(75);
    obj.label83:setWidth(90);
    obj.label83:setHeight(20);
    obj.label83:setText("ETNIA");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle43);
    obj.edit34:setLeft(1000);
    obj.edit34:setTop(75);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(25);
    obj.edit34:setField("reino");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setName("edit34");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox3);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(110);
    obj.layout1:setWidth(375);
    obj.layout1:setHeight(240);
    obj.layout1:setName("layout1");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout1);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setName("rectangle44");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout1);
    obj.label84:setLeft(5);
    obj.label84:setTop(1);
    obj.label84:setWidth(100);
    obj.label84:setHeight(20);
    obj.label84:setText("CARACTERÍSTICAS");
    obj.label84:setName("label84");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout1);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(365);
    obj.textEditor3:setHeight(210);
    obj.textEditor3:setField("aparencia");
    obj.textEditor3:setName("textEditor3");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox3);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(355);
    obj.layout2:setWidth(375);
    obj.layout2:setHeight(250);
    obj.layout2:setName("layout2");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout2);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setName("rectangle45");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout2);
    obj.label85:setLeft(5);
    obj.label85:setTop(1);
    obj.label85:setWidth(100);
    obj.label85:setHeight(20);
    obj.label85:setText("PERSONALIDADE");
    obj.label85:setName("label85");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout2);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(365);
    obj.textEditor4:setHeight(220);
    obj.textEditor4:setField("personalidade");
    obj.textEditor4:setName("textEditor4");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox3);
    obj.layout3:setLeft(380);
    obj.layout3:setTop(110);
    obj.layout3:setWidth(825);
    obj.layout3:setHeight(495);
    obj.layout3:setName("layout3");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout3);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setName("rectangle46");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout3);
    obj.label86:setLeft(5);
    obj.label86:setTop(1);
    obj.label86:setWidth(100);
    obj.label86:setHeight(20);
    obj.label86:setText("PRE-MORTEM");
    obj.label86:setName("label86");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout3);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Anotações");
    obj.tab4:setName("tab4");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab4);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmTemplateNotes);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox4);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(400);
    obj.layout4:setHeight(580);
    obj.layout4:setName("layout4");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout4);
    obj.rectangle47:setLeft(0);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(400);
    obj.rectangle47:setHeight(580);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setXradius(5);
    obj.rectangle47:setYradius(15);
    obj.rectangle47:setCornerType("round");
    obj.rectangle47:setName("rectangle47");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout4);
    obj.label87:setLeft(0);
    obj.label87:setTop(0);
    obj.label87:setWidth(400);
    obj.label87:setHeight(20);
    obj.label87:setText("Anotações Gerais");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout4);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(540);
    obj.textEditor5:setField("anotacoes1");
    obj.textEditor5:setName("textEditor5");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox4);
    obj.layout5:setLeft(410);
    obj.layout5:setTop(0);
    obj.layout5:setWidth(400);
    obj.layout5:setHeight(580);
    obj.layout5:setName("layout5");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout5);
    obj.rectangle48:setLeft(0);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(400);
    obj.rectangle48:setHeight(580);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setXradius(5);
    obj.rectangle48:setYradius(15);
    obj.rectangle48:setCornerType("round");
    obj.rectangle48:setName("rectangle48");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout5);
    obj.label88:setLeft(0);
    obj.label88:setTop(0);
    obj.label88:setWidth(400);
    obj.label88:setHeight(20);
    obj.label88:setText("Tarefas");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout5);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(540);
    obj.textEditor6:setField("anotacoes2");
    obj.textEditor6:setName("textEditor6");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox4);
    obj.layout6:setLeft(820);
    obj.layout6:setTop(0);
    obj.layout6:setWidth(400);
    obj.layout6:setHeight(580);
    obj.layout6:setName("layout6");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout6);
    obj.rectangle49:setLeft(0);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(400);
    obj.rectangle49:setHeight(580);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(15);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout6);
    obj.label89:setLeft(0);
    obj.label89:setTop(0);
    obj.label89:setWidth(400);
    obj.label89:setHeight(20);
    obj.label89:setText("Diário da Irmandade");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout6);
    obj.textEditor7:setLeft(10);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(380);
    obj.textEditor7:setHeight(540);
    obj.textEditor7:setField("anotacoes3");
    obj.textEditor7:setName("textEditor7");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Creditos");
    obj.tab5:setName("tab5");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab5);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateCreditos);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox5);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(500);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("logo");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox5);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/TheMaze/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox5);
    obj.layout7:setLeft(850);
    obj.layout7:setTop(0);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(160);
    obj.layout7:setName("layout7");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout7);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setXradius(5);
    obj.rectangle50:setYradius(15);
    obj.rectangle50:setCornerType("round");
    obj.rectangle50:setName("rectangle50");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout7);
    obj.label90:setLeft(0);
    obj.label90:setTop(10);
    obj.label90:setWidth(200);
    obj.label90:setHeight(20);
    obj.label90:setText("Programado por: ");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout7);
    obj.label91:setLeft(0);
    obj.label91:setTop(35);
    obj.label91:setWidth(200);
    obj.label91:setHeight(20);
    obj.label91:setText("Vinny (Ambesek)");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout7);
    obj.label92:setLeft(0);
    obj.label92:setTop(60);
    obj.label92:setWidth(200);
    obj.label92:setHeight(20);
    obj.label92:setText("Consultor: Yagorok");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.scrollBox5);
    obj.label93:setLeft(555);
    obj.label93:setTop(300);
    obj.label93:setWidth(100);
    obj.label93:setHeight(20);
    obj.label93:setText("Versão Atual: ");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox5);
    obj.image4:setLeft(667);
    obj.image4:setTop(300);
    obj.image4:setWidth(100);
    obj.image4:setHeight(20);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20The%20Maze/release.png");
    obj.image4:setName("image4");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.scrollBox5);
    obj.label94:setLeft(555);
    obj.label94:setTop(325);
    obj.label94:setWidth(100);
    obj.label94:setHeight(20);
    obj.label94:setText("Sua Versão: ");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox5);
    obj.image5:setLeft(667);
    obj.image5:setTop(325);
    obj.image5:setWidth(100);
    obj.image5:setHeight(20);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("http://www.cin.ufpe.br/~jvdl/Plugins/Version/versao01.png");
    obj.image5:setName("image5");

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

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.scrollBox5);
    obj.label95:setLeft(555);
    obj.label95:setTop(400);
    obj.label95:setWidth(200);
    obj.label95:setHeight(20);
    obj.label95:setText("Conheça as Mesas:");
    obj.label95:setName("label95");

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
    obj.button4:setText("RPG The Maze");
    obj.button4:setName("button4");

    obj._e_event0 = obj.edit2:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            					local mod = (tonumber(sheet.experiencia) or 0);
            					local mod2 = 0;
            					local mod3 = 0;
            					while mod>=mod2 do
            						mod3 = mod3+1;
            						mod2 = mod2 + mod3*5;
            					end
            
            					sheet.nivel = mod3;
        end, obj);

    obj._e_event1 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					-- Alquimista
            					if sheet.aptidao == "1" then
            						sheet.agilidade_inicial = 1;
            						sheet.cac_inicial = 1;
            						sheet.manuseio_inicial = 4;
            						sheet.pontaria_inicial = 2;
            						sheet.paranormalidade_inicial = 2;
            						sheet.sorte_inicial = 3;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						habilidades[1].habilidade = "Optimização (Passiva)\nEstágio 1: Itens Consumíveis têm seus efeitos ampliados.\nEstágio 2: Recebe mais do mesmo Item.\nEstágio 3: Trocas exigem menos Materiais.";
            						habilidades[2].habilidade = "Círculo de Alquimia (Instantânea)\nEstágio 1: Cria uma área que concede Vigor ao Personagem sobre ela (1pt p/ Rodada).\nEstágio 2-3(+1): Copia a última Habilidade usada por um Aliado no Círculo (+ efeito).\nEstágio 3(+1): Receber Dano no Círculo restitui a Fadiga gasta na Rodada (+ efeito).";
            						habilidades[3].habilidade = "As Três Etapas\nEstágio 1: Mistura Itens Consumíveis para lhes dar novos efeitos (1pt).\nEstágio 2: Transmuta Itens liberando energia no processo (1pt).\nEstágio 3: Usa Cristais para fundir Itens iguais (1pt).";
            						habilidades[4].habilidade = "Colecionador (Passiva)\nEstágio 1: Aprimora o estaque de Itens iguais.\nEstágio 2: Recebe Itens extras de localidades e Tarefas.\nEstágio 3: Pode escolher o Item no teste de Drop.";
            						habilidades[5].habilidade = "Transmutação\nEstágio 1-3: Modifica a Arma que empunha para outra do mesmo tipo (1pt p/ Rodada).\nEstágio 2(+1): Pode usar Transmutação na Arma do Aliado no Círculo (+ efeito).\nEstágio 3(+1): Usa mais Fadiga para conceder Aprimoramentos à Arma (“x”pt). ";
            					
            					-- Arcanista
            					elseif sheet.aptidao=="2" then
            						sheet.agilidade_inicial = 1;
            						sheet.cac_inicial = 1;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 3;
            						sheet.paranormalidade_inicial = 4;
            						sheet.sorte_inicial = 2;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						habilidades[1].habilidade = "Habilidade “6º Sentido” (Passiva):\nEstágio 1: Percebe nativamente atividade Paranormal em objetos e lugares.\nEstágio 2: Revela a intenção de ataque e detalhes específicos de Inimigos do tipo Espírito.\nEstágio 3: Concede passivamente Dano Paranormal ampliado.";
            						habilidades[2].habilidade = "Habilidade “Aura Protetora” (Instantânea):\nEstágio 1: Cria uma Aura que nega o Dano de qualquer ataque recebido (1pt).\nEstágio 2(+1): Cria mais Auras Protetoras na mesma ação (máx. 3pt).\nEstágio 3(+1): Aumenta a força das Aura Protetoras (+ efeito)(1pt p/ estaque)(máx. 3pt p/ Aura).";
            						habilidades[3].habilidade = "Habilidade “Símbolo Arcano”:\nEstágio 1: Concede uma marca de energia Paranormal a um Personagem (1pt p/ estaque)(máx. 3pt).\nEstágio 2(+1): A marca de energia Paranormal concede melhorias ao portador (+ efeito).\nEstágio 3(+1): A marca de energia nega Status Anormais no portador (+ efeito).";
            						habilidades[4].habilidade = "Habilidade “Essência Paranormal” (Passiva):\nEstágio 1: Crítico de Paranormalidade causa ainda mais Dano Paranormal.\nEstágio 2: Regenera Fadiga se receber Dano Paranormal na Rodada.\nEstágio 3: Recebe mais 25% de aumento da Fadiga máxima.";
            						habilidades[5].habilidade = "Habilidade “Conjuração Telecinética”:\nEstágio 1: Usa Telecinese para flutuar um Inimigo ou um objeto (1pt p/ Rodada).\nEstágio 2(+1): Telecinese Paralisa Inimigos e causa Dano Paranormal (2pt p/ Inimigo).\nEstágio 3(+2): Gastar mais Fadiga aumenta o Dano Paranormal da Telecinese (+ efeito)(máx. 3pt).";
            					
            					-- Caçador
            					elseif sheet.aptidao=="3" then
            						sheet.agilidade_inicial = 3;
            						sheet.cac_inicial = 1;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 4;
            						sheet.paranormalidade_inicial = 1;
            						sheet.sorte_inicial = 2;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						habilidades[1].habilidade = "Olhar Aguçado (Passiva)\nEstágio 1: Percebe passivamente detalhes em localidades e em Itens Chave.\nEstágio 2: Revela intenção de ataque e detalhes específicos de Inimigos não-Espíritos.\nEstágio 3: Concede passivamente Dano do tipo Projétil ampliado.";
            						habilidades[2].habilidade = "Armadilha\nEstágio 1: Em modo Furtivo posiciona até duas Armadilhas em campo (1 Mat.).\nEstágio 2-3(+1): Causa Paralisação em Inimigos que ativarem uma Armadilha (+ efeito).\nEstágio 3(+1): Confecciona Armadilhas mais fortes usando mais Materiais (+ efeito) (máx. 3 Mat.).";
            						habilidades[3].habilidade = "Veterano na Caçada (Passiva)\nEstágio 1: Materiais para Armadilha não consomem espaço no Inventário.\nEstágio 1-3: A cada Estágio melhora a técnica de Arrombamento de portas.\nEstágio 3: Amplifica os efeitos do modo Furtivo.";
            						habilidades[4].habilidade = "Furtividade (Instantânea)\nEstágio 1: Entra em modo Furtivo se não for alvo de ataques (1pt p/ Rodada).\nEstágio 2(+1): Entrar em modo Furtivo não consome a ação (+ efeito).\nEstágio 3(+1): Entrar em modo Furtivo retira Paralisação, Imobilização e Aturdido (+ efeito)(2pt).";
            						habilidades[5].habilidade = "Letalidade Silenciosa\nEstágio 1: Em modo Furtivo utiliza um ataque de Dano Físico elevado se estiver atrás do Inimigo (2pt).\nEstágio 2(+1): Se esta Habilidade derrotar o Inimigo seu custo de Fadiga é restituído (+ efeito)\nEstágio 3(+1): Se esta Habilidade derrotar o Inimigo Caçador não sai do modo Furtivo (+ efeito).";
            
            					-- Cavaleiro
            					elseif sheet.aptidao=="4" then
            						sheet.agilidade_inicial = 3;
            						sheet.cac_inicial = 4;
            						sheet.manuseio_inicial = 1;
            						sheet.pontaria_inicial = 2;
            						sheet.paranormalidade_inicial = 1;
            						sheet.sorte_inicial = 2;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						habilidades[1].habilidade = "Constituição (Passiva)\nEstágio 1: Ignora o primeiro Status Anormal recebido em Batalha.\nEstágio 1-3: Aumenta o limite de Itens do Inventário em 2 a cada Estágio desta Habilidade.\nEstágio 3: Concede passivamente Dano Físico ampliado utilizando Armas Brancas.";
            						habilidades[2].habilidade = "Brado de Glória\nEstágio 1: Provoca Inimigos Físicos em campo e recebe redução de Dano Físico (2pt).\nEstágio 2(+1): Concede Vigor de Corpo-a-Corpo contra Inimigos Provocados (+ efeito).\nEstágio 3(+1): Enquanto houver Inimigos Provocados amplifica efeitos de cura em si (+ efeito).";
            						habilidades[3].habilidade = "Força Destrutiva\nEstágio 1: Aplica um golpe com Dano Físico elevado (1pt).\nEstágio 2(+1): Pode concentrar mais Dano em Força Destrutiva (+ efeito)(máx. 3pt).\nEstágio 3(+1): Esta Habilidade causa Paralisação e Fratura ao alvo (+ efeito).";
            						habilidades[4].habilidade = "Mestre da Batalha (Passiva)\nEstágio 1: Reduz passivamente o Dano Físico recebido.\nEstágio 2: Crítico de Corpo-a-Corpo causa ainda mais Dano Físico.\nEstágio 3: Cavaleiro não pode perder mais de 50% da sua Vida máxima em uma Rodada. ";
            						habilidades[5].habilidade = "Defesa Absoluta (Instantânea)\nEstágio 1: Nega um ataque Físico já executado em si (1-3pt).\nEstágio 2: Defesa não consome a Ação. (+ efeito).\nEstágio 3: Concede Contra-Ataque após a Defesa. (+efeito).";
            
            					-- Monge
            					elseif sheet.aptidao=="5" then
            						sheet.agilidade_inicial = 4;
            						sheet.cac_inicial = 3;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 1;
            						sheet.paranormalidade_inicial = 2;
            						sheet.sorte_inicial = 1;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						habilidades[1].habilidade = "Taijutsu (Passiva)\nEstágio 1: Pode atacar sem usar Armas (1 de Dano Físico)(Sem Dano Crítico).\nEstágio 2: Atacar a curta distância ativa Acerto Crítico de Taijutsu (apenas para o primeiro ataque).\nEstágio 3: Aumenta o Dano do Taijutsu em 1 ponto.";
            						habilidades[2].habilidade = "O Estilo Secreto\nEstágio 1: Acerto Crítico de Taijutsu concede chance de usar Taijutsu novamente (1pt).\nEstágio 2-3(+1): O número de repetições desta Habilidade é o mesmo de seu Estágio (1pt p/ repetição).\nEstágio 3: Acerto Crítico da Palma do Dragão e do Estilo do Leopardo ativam o Estilo Secreto (+efeito).";
            						habilidades[3].habilidade = "Chacra (Passiva)\nEstágio 1: Concede Clarividência.\nEstágio 2: Concede Taijutsu Sacerdotal (Paranormalidade também ativa o Estilo Secreto).\nEstágio 3: Enquanto com menos de 20% de Vida recupera 1 ponto de Fadiga por Rodada. ";
            						habilidades[4].habilidade = "A Palma do Dragão (Instantânea)\nEstágio 1: Causa todo Dano Físico recebido em Dano a um Inimigo + Dano do Taijutsu (2pt).\nEstágio 2(+1): Palma do Dragão como contra-ataque não consome a Ação (+ efeito).\nEstágio 3(+1): Reverte Status Anormais recebidos no ataque Inimigo (+efeito). ";
            						habilidades[5].habilidade = "O Estilo do Leopardo\nEstágio 1: Ataca dois Inimigos com o Dano do Taijutsu (1pt).\nEstágio 2(+1): Pode encadear mais Inimigos nesta Habilidade (1pt p/ repetição).\nEstágio 3(+1): Encadear quatro Inimigos restitui toda Fadiga gasta com esta Habilidade (+ efeito). ";
            					
            					-- Necromante
            					elseif sheet.aptidao=="6" then
            						sheet.agilidade_inicial = 1;
            						sheet.cac_inicial = 1;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 3;
            						sheet.paranormalidade_inicial = 4;
            						sheet.sorte_inicial = 2;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						habilidades[1].habilidade = "Profanador Sanguinolento (Passiva)\nEstágio 1: Ataques e Habilidades do Necromante causam Dano do tipo Corrosivo.\nEstágio 2: Reduz passivamente qualquer Dano do tipo Corrosivo recebido.\nEstágio 3: Inimigos com Sangramento recebem Dano ampliado do Necromante.";
            						habilidades[2].habilidade = "Reanimação\nEstágio 1: Reanima um Inimigo Inconsciente ao seu favor na Batalha (1 ponto de Vida p/ Rodada).\nEstágio 2(+1): Sacrifica o Inimigo reanimado para usar uma Habilidade sua (1-3pt).\nEstágio 3(+1): Reanima mais Inimigos Inconscientes em campo (máx. 3).";
            						habilidades[3].habilidade = "Colhedor de Almas (Instantânea)\nEstágio 1: Mata um Inimigo Inconsciente e recupera um pouco da Vida do Necromante (sem custo).\nEstágio 2(+1): Usar esta Habilidade retira Status Anormais do Necromante (+ efeito)\nEstágio 3(+1): Matar Espíritos recupera Fadiga do Necromante (+ efeito).";
            						habilidades[4].habilidade = "Hemodominus\nEstágio 1: Absorve parte da Vida de um Inimigo do tipo Físico em campo (1pt).\nEstágio 2: Inimigos atingidos pelo Hemodominus recebem Sangramento (+efeito).\nEstágio 3: Pode aumentar a quantidade de absorção de Vida (máx. 3pt).";
            						habilidades[5].habilidade = "Mors Imperiosa (Passiva)\nEstágio 1: Com 20% ou menos de Vida máxima o Necromante não gasta nada nas Habilidades.\nEstágio 2: Gasta pontos de Fadiga para não ficar Inconsciente, mas fica Exausto.\nEstágio 3(+1): Mors Imperiosa se ativa a partir de 40% de Vida.";
            					
            					-- Xamã
            					elseif sheet.aptidao=="7" then
            						sheet.agilidade_inicial = 2;
            						sheet.cac_inicial = 3;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 2;
            						sheet.paranormalidade_inicial = 3;
            						sheet.sorte_inicial = 1;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						habilidades[1].habilidade = "Tatuagem Rúnica (Passiva)\nEstágio 1: Pode usar todos os pontos do Atributo nos testes de Resistência.\nEstágio 2: Sobre efeito de Status Anormais Xamã ganha redução de Dano aumentado.\nEstágio 1-3: Ganha 2 pontos de Vida máximos a cada Estágio desta Habilidade.";
            						habilidades[2].habilidade = "Oração Ancestral (Instantânea)\nEstágio 1: Um Aliado ganha Vigor em um lançamento, mas Xamã fica Aturdido (1pt p/ Rodada).\nEstágio 2(+1): O Aliado com Vigor desta Habilidade recebe redução de Dano aumentado (+ efeito).\nEstágio 3(+1): Esta Habilidade concede Tenacidade ao Aliado (+ efeito).";
            						habilidades[3].habilidade = "O Voo Sagrado do Condor\nEstágio 1: Colide contra um Inimigo o Paralisando e Provocando os demais (1pt).\nEstágio 2(+1): Inimigos Provocados ficam Aturdidos para ataques sobre o Xamã (+ efeito).\nEstágio 3(+1): O Inimigo colidido pelo Xamã perde Tenacidade e Aceleração (+ efeito).";
            						habilidades[4].habilidade = "O Chamado dos Espíritos (Passiva)\nEstágio 1: Inimigos derrotados com ajuda de Oração Ancestral curam um pouco da Vida do Xamã.\nEstágio 2: Curas excedentes desta Habilidade curam Aliados ao invés do Xamã.\nEstágio 3: Enquanto “Aturdido” Xamã ganha Tenacidade.";
            						habilidades[5].habilidade = "Chama Violeta\nEstágio 1: Cura um pouco da Vida de um Aliado (1pt).\nEstágio 2(+1): Aumenta a quantidade de Cura ou a quantidade de Aliados curados (máx. 3pt).\nEstágio 3(+1): Cura retira Status Anormais e prolonga Status Especiais de Aliados (+ efeito).";
            					end;
        end, obj);

    obj._e_event2 = obj.edit3:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            					local mod = (tonumber(sheet.progresso) or 0);
            					local mod2 = 0;
            					local mod3 = 0;
            					while mod>=mod2 do
            						mod3 = mod3+1;
            						mod2 = mod2 + mod3*5;
            					end
            
            					sheet.rank = mod3;
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nivel = (tonumber(sheet.nivel) or 0);
            					sheet.vidaBase = 5 + (nivel * 3);
            					sheet.fadigaBase = 1 + (nivel * 2);
            					sheet.atr_max = 64 + (nivel * 3);
            					sheet.habilidadesDisponivel = math.min((nivel * 2), 15);
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local vida = 	(tonumber(sheet.vidaBase) or 0) + 
            									(tonumber(sheet.vidaCompensacao) or 0);
            					sheet.vidaAtual = vida;
        end, obj);

    obj._e_event5 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local fadiga = 	(tonumber(sheet.fadigaBase) or 0) + 
            									(tonumber(sheet.fadigaCompensacao) or 0);
            					sheet.fadigaAtual = fadiga;
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.agilidade_inicial) or 0) + 
            								(tonumber(sheet.agilidade_nivel) or 0) + 
            								(tonumber(sheet.agilidade_outros) or 0);
            				sheet.agilidade_total = total;
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.cac_inicial) or 0) + 
            								(tonumber(sheet.cac_nivel) or 0) + 
            								(tonumber(sheet.cac_outros) or 0);
            				sheet.cac_total = total;
        end, obj);

    obj._e_event8 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.manuseio_inicial) or 0) + 
            								(tonumber(sheet.manuseio_nivel) or 0) + 
            								(tonumber(sheet.manuseio_outros) or 0);
            				sheet.manuseio_total = total;
        end, obj);

    obj._e_event9 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.pontaria_inicial) or 0) + 
            								(tonumber(sheet.pontaria_nivel) or 0) + 
            								(tonumber(sheet.pontaria_outros) or 0);
            				sheet.pontaria_total = total;
        end, obj);

    obj._e_event10 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.paranormalidade_inicial) or 0) + 
            								(tonumber(sheet.paranormalidade_nivel) or 0) + 
            								(tonumber(sheet.paranormalidade_outros) or 0);
            				sheet.paranormalidade_total = total;
        end, obj);

    obj._e_event11 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.sorte_inicial) or 0) + 
            								(tonumber(sheet.sorte_nivel) or 0) + 
            								(tonumber(sheet.sorte_outros) or 0);
            				sheet.sorte_total = total;
        end, obj);

    obj._e_event12 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					
            					local max = tonumber(sheet.atr_max) or 0;
            					local gastos = tonumber(sheet.sum_total) or 0;
            					if max > gastos then
            						self.atr_max.fontColor = "#00FF00";
            					elseif max < gastos then
            						self.atr_max.fontColor = "#FF0000";
            					else
            						self.atr_max.fontColor = "#FFFFFF";
            					end;
        end, obj);

    obj._e_event13 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local res = (tonumber(sheet.cac_total) or 0);
            					res = math.floor(res/2);
            					sheet.resistenciaFisica = res;
        end, obj);

    obj._e_event14 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local res = (tonumber(sheet.paranormalidade_total) or 0);
            					res = math.floor(res/2);
            					sheet.resistenciaParanormal = res;
        end, obj);

    obj._e_event15 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local sum = (tonumber(sheet.sum_inicial) or 0) + 
            								(tonumber(sheet.sum_nivel) or 0);
            					sheet.sum_total = sum;
        end, obj);

    obj._e_event16 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local sum = 	(tonumber(sheet.agilidade_inicial) or 0) + 
            									(tonumber(sheet.cac_inicial) or 0) + 
            									(tonumber(sheet.manuseio_inicial) or 0) + 
            									(tonumber(sheet.pontaria_inicial) or 0) + 
            									(tonumber(sheet.paranormalidade_inicial) or 0) + 
            									(tonumber(sheet.sorte_inicial) or 0);
            					sheet.sum_inicial = sum;
        end, obj);

    obj._e_event17 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local sum = 	(tonumber(sheet.agilidade_nivel) or 0) + 
            									(tonumber(sheet.cac_nivel) or 0) + 
            									(tonumber(sheet.manuseio_nivel) or 0) + 
            									(tonumber(sheet.pontaria_nivel) or 0) + 
            									(tonumber(sheet.paranormalidade_nivel) or 0) + 
            									(tonumber(sheet.sorte_nivel) or 0);
            					sheet.sum_nivel = sum;
        end, obj);

    obj._e_event18 = obj.rclHabilidades:addEventListener("onEndEnumeration",
        function (_)
            if sheet== nil then return end;
            				
            				local objetos = ndb.getChildNodes(sheet.listaDeHabilidades);
            				if objetos[1].nivel == nil then
            					objetos[1].nivel = 1;
            				end;
        end, obj);

    obj._e_event19 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event20 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local armazenamento1 = (tonumber(sheet.armazenamento1) or 0);
            					local armazenamento2 = (tonumber(sheet.armazenamento2) or 0);
            					local armazenamento3 = (tonumber(sheet.armazenamento3) or 0);
            					local tamanho = 6 + armazenamento1 + armazenamento2 + armazenamento3;
            					sheet.inventarioTamanho = tamanho;
            					self.rclInventario.minQt = tamanho;
            
            					local objetos = ndb.getChildNodes(sheet.listaDeItens);
            
            					if #objetos > tamanho then
            						local excesso = #objetos - tamanho;
            						showMessage("Você possui " .. excesso .. " itens além do limite.");
            					end;
        end, obj);

    obj._e_event21 = obj.button1:addEventListener("onClick",
        function (_)
            gui.openInBrowser('link change log')
        end, obj);

    obj._e_event22 = obj.button2:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://www.cin.ufpe.br/~jvdl/Plugins/Ficha%20The%20Maze/Ficha%20The%20Maze.rpk')
        end, obj);

    obj._e_event23 = obj.button3:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event24 = obj.button4:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=130746');
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.rclHabilidades ~= nil then self.rclHabilidades:destroy(); self.rclHabilidades = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.atr_max ~= nil then self.atr_max:destroy(); self.atr_max = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rclInventario ~= nil then self.rclInventario:destroy(); self.rclInventario = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rclSentinela ~= nil then self.rclSentinela:destroy(); self.rclSentinela = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.frmBase ~= nil then self.frmBase:destroy(); self.frmBase = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rclContratos ~= nil then self.rclContratos:destroy(); self.rclContratos = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.rclBencaos ~= nil then self.rclBencaos:destroy(); self.rclBencaos = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMain()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMain();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMain = {
    newEditor = newfrmMain, 
    new = newfrmMain, 
    name = "frmMain", 
    dataType = "Ambesek.Nefertyne.TheMaze", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha The Maze", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);
Firecast.registrarDataType(_frmMain);

return _frmMain;
